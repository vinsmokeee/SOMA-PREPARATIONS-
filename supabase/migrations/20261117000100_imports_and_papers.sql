-- =============================================================================
-- Soma Preparations — Migration 0013: Imports, permissions and historical papers
-- (Milestone 3)
--
--  * Source documents can now be uploaded files as well as URLs.
--  * usage_permissions records written permission from rights holders (e.g. the
--    RCSC), with the scope of what Soma may do.
--  * import_candidates is a staging area: questions extracted from a document
--    wait here for human review before becoming question-bank drafts.
--  * Historical examinations can only be published when the underlying
--    document is authorised for reproduction.
--  * A private Storage bucket holds the original files.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Permissions
-- -----------------------------------------------------------------------------
create table public.usage_permissions (
  id                   uuid primary key default gen_random_uuid(),
  title                text not null,
  granted_by           text not null default 'Royal Civil Service Commission',
  reference_number     text,
  granted_on           date,
  years_from           int check (years_from between 1990 and 2100),
  years_to             int check (years_to between 1990 and 2100),
  allows_reproduction  boolean not null default false,   -- may show original questions to students
  scope                text not null,                    -- what the permission covers, in plain words
  conditions           text,                             -- e.g. attribution, non-alteration
  attribution_text     text,                             -- credit line shown with reproduced content
  letter_storage_path  text,                             -- copy of the letter in the private bucket
  recorded_by          uuid references auth.users (id) on delete set null,
  created_at           timestamptz not null default now(),
  updated_at           timestamptz not null default now(),
  check (years_to is null or years_from is null or years_to >= years_from)
);
create trigger usage_permissions_updated_at before update on public.usage_permissions
  for each row execute function public.set_updated_at();
create trigger audit_usage_permissions after insert or update or delete on public.usage_permissions
  for each row execute function public.audit_row_change();

alter table public.usage_permissions enable row level security;
create policy usage_permissions_rw on public.usage_permissions for all to authenticated
  using (public.has_permission('papers.manage')) with check (public.has_permission('papers.manage'));

-- -----------------------------------------------------------------------------
-- Source documents: uploads and permission link
-- -----------------------------------------------------------------------------
alter table public.source_documents
  alter column url drop not null,
  alter column url_normalized drop not null,
  alter column host drop not null,
  add column origin text not null default 'url' check (origin in ('url', 'upload')),
  add column original_filename text check (original_filename is null or char_length(original_filename) <= 255),
  add column permission_id uuid references public.usage_permissions (id) on delete set null,
  add column page_count int check (page_count is null or page_count >= 0),
  add constraint source_documents_url_required check (origin = 'upload' or url is not null);

-- Import jobs can come from uploads (no URL).
alter table public.import_jobs
  alter column url drop not null,
  add column filename text check (filename is null or char_length(filename) <= 255),
  add constraint import_jobs_source_required check (url is not null or filename is not null);

-- The same file (by content) is recorded once.
create unique index source_documents_sha_uniq on public.source_documents (current_sha256) where current_sha256 is not null;

-- -----------------------------------------------------------------------------
-- Import candidates (staging for extracted questions)
-- -----------------------------------------------------------------------------
create table public.import_candidates (
  id                  uuid primary key default gen_random_uuid(),
  document_id         uuid not null references public.source_documents (id) on delete cascade,
  version_id          uuid references public.source_document_versions (id) on delete set null,
  historical_paper_id uuid references public.historical_papers (id) on delete set null,
  number              int,
  section             text,
  stem                text not null,
  options             jsonb not null default '[]'::jsonb check (jsonb_typeof(options) = 'array'),
  answer_label        text check (answer_label is null or answer_label ~ '^[A-H]$'),
  answer_source       text not null default 'none' check (answer_source in ('official_key', 'soma', 'none')),
  page                int,
  confidence          numeric(3, 2) check (confidence between 0 and 1),
  issues              text[] not null default '{}',
  status              text not null default 'pending' check (status in ('pending', 'accepted', 'rejected')),
  question_id         uuid references public.questions (id) on delete set null,
  reviewed_by         uuid references auth.users (id) on delete set null,
  reviewed_at         timestamptz,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now()
);
create index import_candidates_document_idx on public.import_candidates (document_id, number);
create trigger import_candidates_updated_at before update on public.import_candidates
  for each row execute function public.set_updated_at();

alter table public.import_candidates enable row level security;
create policy import_candidates_rw on public.import_candidates for all to authenticated
  using (public.has_permission('imports.run') or public.has_permission('papers.manage'))
  with check (public.has_permission('imports.run') or public.has_permission('papers.manage'));

-- Historical papers: who may see the source document behind a published paper
-- is still staff-only; students see the paper metadata and its examination.
alter table public.historical_papers
  add column attribution_text text;

-- -----------------------------------------------------------------------------
-- Publishing rule for reproduced official papers
-- -----------------------------------------------------------------------------
create or replace function public.enforce_exam_publish()
returns trigger
language plpgsql
set search_path = ''
as $$
declare _usage public.usage_status;
begin
  if new.status = 'published' and (tg_op = 'INSERT' or old.status is distinct from 'published') then
    if not exists (select 1 from public.exam_questions where exam_id = new.id) then
      raise exception 'An examination needs at least one question before it can be published';
    end if;
    if exists (
      select 1 from public.exam_questions eq
      join public.questions q on q.id = eq.question_id
      where eq.exam_id = new.id and q.status <> 'published'
    ) then
      raise exception 'All questions must be published before the examination can be published';
    end if;
    if new.kind = 'historical' or new.is_official_reproduction then
      select d.usage_status into _usage
      from public.historical_papers hp
      join public.source_documents d on d.id = hp.source_document_id
      where hp.id = new.historical_paper_id;
      if _usage is distinct from 'authorised' then
        raise exception 'REPRODUCTION_NOT_AUTHORISED: record the permission and mark the source document as authorised first';
      end if;
    end if;
    new.published_at := coalesce(new.published_at, now());
  end if;
  return new;
end;
$$;

-- -----------------------------------------------------------------------------
-- Catalogue: add the paper year for historical examinations
-- -----------------------------------------------------------------------------
drop function public.exam_catalogue(public.exam_stage);
create function public.exam_catalogue(_stage public.exam_stage default null)
returns table (
  id uuid, slug text, title text, description text, instructions text,
  stage public.exam_stage, kind public.exam_kind, duration_minutes int, is_free boolean,
  omr_mode boolean, negative_mark_per_wrong numeric, question_count int, total_marks numeric,
  has_access boolean, cycle_name text, paper_title text, category_name text,
  open_attempt_id uuid, open_deadline_at timestamptz, completed_attempts int,
  exam_year int, attribution text
)
language sql
stable
security definer
set search_path = ''
as $$
  select e.id, e.slug, e.title, e.description, e.instructions, e.stage, e.kind,
         e.duration_minutes, e.is_free, e.omr_mode, e.negative_mark_per_wrong,
         (select count(*)::int from public.exam_questions eq
            join public.questions q on q.id = eq.question_id
            where eq.exam_id = e.id and q.status = 'published'),
         coalesce(e.total_marks, (select sum(coalesce(eq.marks, q.marks)) from public.exam_questions eq
            join public.questions q on q.id = eq.question_id
            where eq.exam_id = e.id and q.status = 'published')),
         (e.is_free or (auth.uid() is not null and public.has_stage_access(e.stage))),
         c.name, p.title, cat.name,
         oa.id, oa.deadline_at,
         (select count(*)::int from public.exam_attempts a
            where a.exam_id = e.id and a.user_id = auth.uid() and a.status <> 'in_progress'),
         hp.exam_year,
         hp.attribution_text
  from public.exams e
  left join public.exam_cycles c on c.id = e.cycle_id
  left join public.exam_papers p on p.id = e.paper_id
  left join public.exam_categories cat on cat.id = e.category_id
  left join public.historical_papers hp on hp.id = e.historical_paper_id
  left join lateral (
    select a.id, a.deadline_at from public.exam_attempts a
    where a.exam_id = e.id and a.user_id = auth.uid() and a.status = 'in_progress'
    limit 1
  ) oa on true
  where e.status = 'published' and (_stage is null or e.stage = _stage)
  order by e.stage, case e.kind when 'sample' then 0 when 'mock' then 1 when 'historical' then 2 else 3 end,
           hp.exam_year desc nulls last, e.title;
$$;
revoke execute on function public.exam_catalogue(public.exam_stage) from public;
grant execute on function public.exam_catalogue(public.exam_stage) to anon, authenticated;

-- -----------------------------------------------------------------------------
-- Private storage for original documents and permission letters
-- -----------------------------------------------------------------------------
do $$
begin
  if to_regclass('storage.buckets') is not null then
    insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
    values ('source-documents', 'source-documents', false, 26214400,
            array['application/pdf', 'image/png', 'image/jpeg'])
    on conflict (id) do update set public = false, file_size_limit = excluded.file_size_limit,
      allowed_mime_types = excluded.allowed_mime_types;

    execute $p$
      create policy "source documents: staff read" on storage.objects for select to authenticated
      using (bucket_id = 'source-documents' and (public.has_permission('imports.run') or public.has_permission('papers.manage')))
    $p$;
    execute $p$
      create policy "source documents: staff upload" on storage.objects for insert to authenticated
      with check (bucket_id = 'source-documents' and (public.has_permission('imports.run') or public.has_permission('papers.manage')))
    $p$;
    execute $p$
      create policy "source documents: staff delete" on storage.objects for delete to authenticated
      using (bucket_id = 'source-documents' and public.has_permission('papers.manage'))
    $p$;
  end if;
end;
$$;
