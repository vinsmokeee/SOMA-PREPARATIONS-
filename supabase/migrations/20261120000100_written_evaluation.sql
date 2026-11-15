-- =============================================================================
-- Soma Preparations — Migration 0016: AI-assisted written-answer evaluation
-- (Milestone 5). Additive only: no existing data or configuration is changed.
--
--  * Two submission methods per written answer: typed or handwritten photos.
--    Photos live in the private Storage bucket "answer-sheets" under
--    <user id>/<answer id>/<file>; answer_pages records their order and checks.
--  * Handwriting is read by AI into a transcript that the STUDENT must confirm
--    (and may correct) before evaluation. Corrections are measured and logged.
--  * request_answer_evaluation() queues one AI evaluation per answer within the
--    student's allowance; the AI result is written by the server with the
--    secret key (students can never write marks).
--  * Answer guides (key points, accepted alternatives) are question content and
--    go through the existing review workflow. Subjects get assessment criteria.
--  * Students can report evaluations; staff review quality and reports.
-- =============================================================================

alter type public.ai_job_kind add value if not exists 'answer_transcription';

alter table public.exams add column untimed boolean not null default false;  -- personal untimed practice: no countdown shown

-- -----------------------------------------------------------------------------
-- Settings (admin-editable in /admin/evaluations)
-- -----------------------------------------------------------------------------
insert into public.app_settings (key, value, is_public) values
  ('evaluation.config', jsonb_build_object(
     'free_total', 3,                 -- AI evaluations for accounts without ME access (lifetime)
     'me_package_total', 100,         -- per ME entitlement
     'upload_window_minutes', 15,     -- photos may be added this long after a timed exam ends
     'max_pages', 10,
     'max_page_kb', 4096,
     'dzongkha_handwriting', true,    -- offered as Beta
     'instructions', ''               -- extra marking guidance appended to the AI instructions
   ), false)
on conflict (key) do nothing;

create or replace function public.evaluation_config()
returns jsonb language sql stable security definer set search_path = '' as $$
  select coalesce((select value from public.app_settings where key = 'evaluation.config'), '{}'::jsonb)
$$;
revoke all on function public.evaluation_config() from public, anon;
grant execute on function public.evaluation_config() to authenticated, service_role;

-- -----------------------------------------------------------------------------
-- Answer guides and subject criteria
-- -----------------------------------------------------------------------------
alter table public.questions
  add column key_points jsonb not null default '[]'::jsonb check (jsonb_typeof(key_points) = 'array'),
  add column alternative_answers text check (alternative_answers is null or char_length(alternative_answers) <= 20000);
comment on column public.questions.key_points is 'Expected points: [{"point": text, "marks": number|null}] — part of the reviewed answer guide';

alter table public.subjects
  add column assessment_criteria text check (assessment_criteria is null or char_length(assessment_criteria) <= 10000);

-- Answer-guide edits on verified/published questions are reviewer-level, like model answers.
create or replace function public.enforce_question_workflow()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  if new.status = 'published' and (tg_op = 'INSERT' or old.status is distinct from 'published') then
    if tg_op = 'INSERT' or old.status <> 'verified' then
      raise exception 'A question must be verified before it is published (current: %)',
        coalesce(old.status::text, 'new');
    end if;
    if auth.uid() is not null and not public.has_permission('questions.publish') then
      raise exception 'Missing permission questions.publish';
    end if;
    new.published_at := coalesce(new.published_at, now());
  end if;

  if new.status = 'verified' and (tg_op = 'INSERT' or old.status is distinct from 'verified') then
    if auth.uid() is not null and not public.has_permission('questions.review') then
      raise exception 'Missing permission questions.review';
    end if;
    new.verified_by := coalesce(new.verified_by, auth.uid());
    new.verified_at := coalesce(new.verified_at, now());
  end if;

  if tg_op = 'UPDATE' and (new.stem is distinct from old.stem or new.explanation is distinct from old.explanation
                            or new.model_answer is distinct from old.model_answer
                            or new.key_points is distinct from old.key_points
                            or new.alternative_answers is distinct from old.alternative_answers) then
    if old.status in ('verified', 'published') and auth.uid() is not null
       and not public.has_permission('questions.review') then
      raise exception 'Only reviewers may edit the content of verified or published questions';
    end if;
    new.version := old.version + 1;
  end if;
  return new;
end;
$$;

-- save_question also stores the answer guide when the payload includes it.
create or replace function public.save_question_guide(_id uuid, _key_points jsonb, _alternatives text)
returns void
language plpgsql
security invoker
set search_path = ''
as $$
begin
  if jsonb_typeof(coalesce(_key_points, '[]'::jsonb)) <> 'array' or jsonb_array_length(coalesce(_key_points, '[]'::jsonb)) > 30 then
    raise exception 'INVALID_KEY_POINTS' using errcode = 'P0001';
  end if;
  update public.questions
  set key_points = coalesce((
        select jsonb_agg(jsonb_build_object('point', btrim(x ->> 'point'),
                                            'marks', nullif(x ->> 'marks', '')::numeric))
        from jsonb_array_elements(coalesce(_key_points, '[]'::jsonb)) x
        where coalesce(btrim(x ->> 'point'), '') <> ''), '[]'::jsonb),
      alternative_answers = nullif(btrim(coalesce(_alternatives, '')), '')
  where id = _id;
  if not found then
    raise exception 'QUESTION_NOT_FOUND' using errcode = 'P0002';
  end if;
end;
$$;
revoke execute on function public.save_question_guide(uuid, jsonb, text) from public, anon;
grant execute on function public.save_question_guide(uuid, jsonb, text) to authenticated;

-- -----------------------------------------------------------------------------
-- Answers: method and handwriting transcript
-- -----------------------------------------------------------------------------
alter table public.attempt_answers
  add column answer_mode text not null default 'typed' check (answer_mode in ('typed', 'handwritten')),
  add column transcript_status text check (transcript_status in ('pending', 'reading', 'needs_review', 'confirmed', 'failed')),
  add column transcript_text text check (transcript_text is null or char_length(transcript_text) <= 60000),
  add column transcript_confidence text check (transcript_confidence in ('high', 'medium', 'low')),
  add column transcript_notes jsonb,           -- {unclear_count, language, page_issues:[...], message}
  add column transcript_language text check (transcript_language in ('en', 'dz', 'mixed')),
  add column transcript_confirmed_at timestamptz,
  add column transcript_edit_ratio numeric(4, 3);   -- 0 = unchanged, 1 = completely rewritten

create table public.answer_pages (
  id            uuid primary key default gen_random_uuid(),
  answer_id     uuid not null references public.attempt_answers (id) on delete cascade,
  user_id       uuid not null references auth.users (id) on delete cascade,
  storage_path  text not null unique check (storage_path ~ '^[0-9a-f-]{36}/[0-9a-f-]{36}/[A-Za-z0-9_-]+\.(jpg|jpeg|png|webp)$'),
  position      int not null check (position between 1 and 50),
  width         int check (width > 0),
  height        int check (height > 0),
  bytes         int check (bytes > 0),
  quality       jsonb not null default '{}'::jsonb,   -- client checks: {blur, brightness, warnings[]}
  created_at    timestamptz not null default now()
);
create index answer_pages_answer_idx on public.answer_pages (answer_id, position);
alter table public.answer_pages enable row level security;
create policy answer_pages_read on public.answer_pages for select to authenticated
  using (user_id = auth.uid() or public.has_permission('evaluations.assign'));
-- Writes only through the functions below.

-- -----------------------------------------------------------------------------
-- Evaluations: queue states and structured AI feedback
-- -----------------------------------------------------------------------------
alter table public.evaluations drop constraint if exists evaluations_status_check;
alter table public.evaluations add constraint evaluations_status_check
  check (status in ('assigned', 'in_progress', 'completed', 'withdrawn', 'queued', 'failed'));
alter table public.evaluations drop constraint if exists evaluations_check1;
alter table public.evaluations add constraint evaluations_ai_job_check
  check (method <> 'ai_feedback' or ai_job_id is not null or status in ('queued', 'failed', 'withdrawn'));
alter table public.evaluations
  add column details jsonb,            -- strengths, missing points, errors, structure, suggestions, improved answer...
  add column confidence text check (confidence in ('high', 'medium', 'low')),
  add column scored boolean,           -- false = qualitative feedback only (no reliable marking guide)
  add column weakness_tags text[] not null default '{}',
  add column requested_by uuid references auth.users (id) on delete set null,
  add column error_message text,
  add column quality_status text check (quality_status in ('good', 'problem')),
  add column quality_note text,
  add column improved_requested_at timestamptz;
-- Students also see their own AI evaluations while queued or failed (to show progress).
create policy evaluations_own_ai on public.evaluations for select to authenticated
  using (method = 'ai_feedback' and public.owns_answer(answer_id));
create unique index evaluations_one_ai_per_answer on public.evaluations (answer_id)
  where method = 'ai_feedback' and status in ('queued', 'in_progress', 'completed');
create index evaluations_requested_idx on public.evaluations (requested_by, assigned_at desc);

-- -----------------------------------------------------------------------------
-- Reports of incorrect or unfair evaluations
-- -----------------------------------------------------------------------------
create table public.evaluation_reports (
  id             uuid primary key default gen_random_uuid(),
  evaluation_id  uuid not null references public.evaluations (id) on delete cascade,
  user_id        uuid not null references auth.users (id) on delete cascade,
  reason         text not null check (reason in ('marks_unfair', 'misread_handwriting', 'factually_wrong', 'missed_points', 'other')),
  message        text not null check (char_length(message) between 5 and 2000),
  status         text not null default 'open' check (status in ('open', 'resolved', 'dismissed')),
  resolution     text check (resolution is null or char_length(resolution) <= 2000),
  resolved_by    uuid references auth.users (id) on delete set null,
  resolved_at    timestamptz,
  created_at     timestamptz not null default now(),
  unique (evaluation_id, user_id)
);
create index evaluation_reports_status_idx on public.evaluation_reports (status, created_at desc);
alter table public.evaluation_reports enable row level security;
create policy evaluation_reports_read on public.evaluation_reports for select to authenticated
  using (user_id = auth.uid() or public.has_permission('evaluations.assign'));
create policy evaluation_reports_insert on public.evaluation_reports for insert to authenticated
  with check (
    user_id = auth.uid() and status = 'open' and resolution is null and resolved_by is null
    and exists (select 1 from public.evaluations ev where ev.id = evaluation_id and ev.status = 'completed'
                and public.owns_answer(ev.answer_id)));
create policy evaluation_reports_staff on public.evaluation_reports for update to authenticated
  using (public.has_permission('evaluations.assign')) with check (public.has_permission('evaluations.assign'));

-- -----------------------------------------------------------------------------
-- Helpers
-- -----------------------------------------------------------------------------
-- Pages can be changed while the attempt is open, or (handwritten answers)
-- within the upload window after it closed, and never once evaluation started.
create or replace function public.answer_accepts_pages(_answer_id uuid)
returns boolean
language plpgsql
stable
security definer
set search_path = ''
as $$
declare _a public.exam_attempts%rowtype; _win int;
begin
  select a.* into _a from public.attempt_answers aa join public.exam_attempts a on a.id = aa.attempt_id
  where aa.id = _answer_id;
  if not found or _a.user_id is distinct from auth.uid() then return false; end if;
  if exists (select 1 from public.evaluations ev where ev.answer_id = _answer_id
             and ev.status in ('queued', 'in_progress', 'completed')) then
    return false;
  end if;
  if _a.status = 'in_progress' then return now() <= _a.deadline_at + public.attempt_save_grace(); end if;
  _win := coalesce((public.evaluation_config() ->> 'upload_window_minutes')::int, 15);
  return now() <= least(coalesce(_a.submitted_at, _a.deadline_at), _a.deadline_at) + make_interval(mins => _win)
         or (select owner_id is not null from public.exams where id = _a.exam_id);  -- untimed personal practice
end;
$$;
revoke all on function public.answer_accepts_pages(uuid) from public, anon;
grant execute on function public.answer_accepts_pages(uuid) to authenticated;

-- The caller's remaining AI evaluations.
create or replace function public.my_evaluation_allowance()
returns jsonb
language plpgsql
stable
security definer
set search_path = ''
as $$
declare
  _uid uuid := auth.uid();
  _cfg jsonb := public.evaluation_config();
  _since timestamptz;
  _limit int;
  _used int;
  _paid boolean;
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  select min(e.starts_at) into _since
  from public.entitlements e join public.packages p on p.id = e.package_id
  where e.user_id = _uid and e.revoked_at is null and p.includes_me and e.starts_at <= now()
    and (e.ends_at is null or e.ends_at > now());
  _paid := _since is not null;
  _limit := case when _paid then coalesce((_cfg ->> 'me_package_total')::int, 100)
                 else coalesce((_cfg ->> 'free_total')::int, 3) end;
  select count(*) into _used from public.evaluations ev
  where ev.requested_by = _uid and ev.method = 'ai_feedback' and ev.status not in ('failed', 'withdrawn')
    and (not _paid or ev.assigned_at >= _since);
  return jsonb_build_object('limit', _limit, 'used', _used, 'remaining', greatest(_limit - _used, 0), 'plan', case when _paid then 'me' else 'free' end);
end;
$$;
revoke all on function public.my_evaluation_allowance() from public, anon;
grant execute on function public.my_evaluation_allowance() to authenticated;

-- Ensures the caller's answer row exists for a written question of their attempt.
create or replace function public.ensure_written_answer(_attempt_id uuid, _exam_question_id uuid)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare _a public.exam_attempts%rowtype; _type public.question_type; _id uuid;
begin
  select * into _a from public.exam_attempts where id = _attempt_id;
  if not found or _a.user_id is distinct from auth.uid() then
    raise exception 'ATTEMPT_NOT_FOUND' using errcode = 'P0002';
  end if;
  if not (_exam_question_id = any(_a.question_order)) then
    raise exception 'QUESTION_NOT_IN_ATTEMPT' using errcode = 'P0001';
  end if;
  select q.question_type into _type from public.exam_questions eq join public.questions q on q.id = eq.question_id
  where eq.id = _exam_question_id;
  if _type = 'mcq' then raise exception 'INVALID_ANSWER_TYPE' using errcode = 'P0001'; end if;
  select id into _id from public.attempt_answers where attempt_id = _attempt_id and exam_question_id = _exam_question_id;
  if _id is null then
    if _a.status <> 'in_progress' and not exists (select 1 from public.exams where id = _a.exam_id and owner_id is not null) then
      -- After a timed exam closes, an answer row is created only inside the upload window.
      if now() > least(coalesce(_a.submitted_at, _a.deadline_at), _a.deadline_at)
                 + make_interval(mins => coalesce((public.evaluation_config() ->> 'upload_window_minutes')::int, 15)) then
        raise exception 'UPLOAD_WINDOW_CLOSED' using errcode = 'P0001';
      end if;
    end if;
    insert into public.attempt_answers (attempt_id, exam_question_id, answer_mode)
    values (_attempt_id, _exam_question_id, 'handwritten')
    on conflict (attempt_id, exam_question_id) do nothing
    returning id into _id;
    if _id is null then
      select id into _id from public.attempt_answers where attempt_id = _attempt_id and exam_question_id = _exam_question_id;
    end if;
  end if;
  return _id;
end;
$$;
revoke all on function public.ensure_written_answer(uuid, uuid) from public, anon;
grant execute on function public.ensure_written_answer(uuid, uuid) to authenticated;

-- Switch an answer between typed and handwritten (while it can still change).
create or replace function public.set_answer_mode(_attempt_id uuid, _exam_question_id uuid, _mode text)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare _id uuid; _status public.attempt_status;
begin
  if _mode not in ('typed', 'handwritten') then raise exception 'INVALID_MODE' using errcode = 'P0001'; end if;
  _id := public.ensure_written_answer(_attempt_id, _exam_question_id);
  select status into _status from public.exam_attempts where id = _attempt_id;
  if _mode = 'typed' and _status <> 'in_progress' then
    raise exception 'ATTEMPT_CLOSED' using errcode = 'P0001';
  end if;
  if not public.answer_accepts_pages(_id) then raise exception 'ANSWER_LOCKED' using errcode = 'P0001'; end if;
  update public.attempt_answers set answer_mode = _mode,
    transcript_status = case when _mode = 'handwritten' then coalesce(transcript_status, 'pending') else null end
  where id = _id;
  return _id;
end;
$$;
revoke all on function public.set_answer_mode(uuid, uuid, text) from public, anon;
grant execute on function public.set_answer_mode(uuid, uuid, text) to authenticated;

-- Register an uploaded page (the file is already in Storage under the caller's folder).
create or replace function public.add_answer_page(
  _answer_id uuid, _storage_path text, _width int default null, _height int default null,
  _bytes int default null, _quality jsonb default '{}'::jsonb)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare _id uuid; _n int; _max int := coalesce((public.evaluation_config() ->> 'max_pages')::int, 10);
begin
  if not public.answer_accepts_pages(_answer_id) then raise exception 'ANSWER_LOCKED' using errcode = 'P0001'; end if;
  if split_part(_storage_path, '/', 1) <> auth.uid()::text or split_part(_storage_path, '/', 2) <> _answer_id::text then
    raise exception 'INVALID_PATH' using errcode = 'P0001';
  end if;
  select count(*) into _n from public.answer_pages where answer_id = _answer_id;
  if _n >= _max then raise exception 'TOO_MANY_PAGES' using errcode = 'P0001'; end if;
  if _bytes is not null and _bytes > coalesce((public.evaluation_config() ->> 'max_page_kb')::int, 4096) * 1024 then
    raise exception 'PAGE_TOO_LARGE' using errcode = 'P0001';
  end if;
  insert into public.answer_pages (answer_id, user_id, storage_path, position, width, height, bytes, quality)
  values (_answer_id, auth.uid(), _storage_path, _n + 1, _width, _height, _bytes, coalesce(_quality, '{}'::jsonb))
  returning id into _id;
  update public.attempt_answers
  set answer_mode = 'handwritten', transcript_status = 'pending', transcript_text = null,
      transcript_confidence = null, transcript_notes = null, transcript_confirmed_at = null, transcript_edit_ratio = null
  where id = _answer_id;
  return _id;
end;
$$;
revoke all on function public.add_answer_page(uuid, text, int, int, int, jsonb) from public, anon;
grant execute on function public.add_answer_page(uuid, text, int, int, int, jsonb) to authenticated;

-- Reorder (array of page ids in the new order) or remove pages.
create or replace function public.arrange_answer_pages(_answer_id uuid, _page_ids uuid[])
returns text[]   -- storage paths of removed pages (the caller deletes the files)
language plpgsql
security definer
set search_path = ''
as $$
declare _removed text[];
begin
  if not public.answer_accepts_pages(_answer_id) then raise exception 'ANSWER_LOCKED' using errcode = 'P0001'; end if;
  if exists (select 1 from unnest(_page_ids) p(id)
             where not exists (select 1 from public.answer_pages ap where ap.id = p.id and ap.answer_id = _answer_id)) then
    raise exception 'INVALID_PAGE' using errcode = 'P0001';
  end if;
  select coalesce(array_agg(storage_path), '{}') into _removed from public.answer_pages
  where answer_id = _answer_id and not (id = any(_page_ids));
  delete from public.answer_pages where answer_id = _answer_id and not (id = any(_page_ids));
  update public.answer_pages ap set position = x.n
  from unnest(_page_ids) with ordinality as x(id, n) where ap.id = x.id;
  update public.attempt_answers
  set transcript_status = case when exists (select 1 from public.answer_pages where answer_id = _answer_id) then 'pending' else null end,
      transcript_text = null, transcript_confidence = null, transcript_notes = null,
      transcript_confirmed_at = null, transcript_edit_ratio = null
  where id = _answer_id;
  return _removed;
end;
$$;
revoke all on function public.arrange_answer_pages(uuid, uuid[]) from public, anon;
grant execute on function public.arrange_answer_pages(uuid, uuid[]) to authenticated;

-- Student asks for the handwriting to be read. Returns the page paths to read.
create or replace function public.begin_transcription(_answer_id uuid)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare _aa public.attempt_answers%rowtype; _owner uuid; _paths text[]; _reads int;
begin
  select aa.* into _aa from public.attempt_answers aa where aa.id = _answer_id;
  select a.user_id into _owner from public.exam_attempts a where a.id = _aa.attempt_id;
  if _aa.id is null or _owner is distinct from auth.uid() then
    raise exception 'ANSWER_NOT_FOUND' using errcode = 'P0002';
  end if;
  if exists (select 1 from public.evaluations ev where ev.answer_id = _answer_id and ev.status in ('queued', 'in_progress', 'completed')) then
    raise exception 'ANSWER_LOCKED' using errcode = 'P0001';
  end if;
  if _aa.transcript_status = 'reading' then raise exception 'ALREADY_READING' using errcode = 'P0001'; end if;
  select array_agg(storage_path order by position) into _paths from public.answer_pages where answer_id = _answer_id;
  if _paths is null then raise exception 'NO_PAGES' using errcode = 'P0001'; end if;
  -- Cost guard: at most 30 handwriting reads per student per day.
  select count(*) into _reads from public.ai_jobs where requested_by = auth.uid() and kind = 'answer_transcription'
    and created_at > now() - interval '1 day';
  if _reads >= 30 then raise exception 'RATE_LIMIT' using errcode = 'P0001'; end if;
  update public.attempt_answers set transcript_status = 'reading' where id = _answer_id;
  return jsonb_build_object('answer_id', _answer_id, 'paths', to_jsonb(_paths));
end;
$$;
revoke all on function public.begin_transcription(uuid) from public, anon;
grant execute on function public.begin_transcription(uuid) to authenticated;

-- Student confirms (and may correct) the transcript. Edits are measured.
create or replace function public.confirm_transcript(_answer_id uuid, _text text)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare _aa public.attempt_answers%rowtype; _owner uuid; _ratio numeric; _words int;
begin
  select aa.* into _aa from public.attempt_answers aa where aa.id = _answer_id for update;
  select a.user_id into _owner from public.exam_attempts a where a.id = _aa.attempt_id;
  if _aa.id is null or _owner is distinct from auth.uid() then
    raise exception 'ANSWER_NOT_FOUND' using errcode = 'P0002';
  end if;
  if _aa.transcript_status not in ('needs_review', 'confirmed') or _aa.transcript_text is null then
    raise exception 'NOTHING_TO_CONFIRM' using errcode = 'P0001';
  end if;
  if exists (select 1 from public.evaluations ev where ev.answer_id = _answer_id and ev.status in ('queued', 'in_progress', 'completed')) then
    raise exception 'ANSWER_LOCKED' using errcode = 'P0001';
  end if;
  if _text is null or btrim(_text) = '' or char_length(_text) > 60000 then
    raise exception 'INVALID_TEXT' using errcode = 'P0001';
  end if;
  _ratio := round(greatest(0, 1 - extensions.similarity(_aa.transcript_text, _text))::numeric, 3);
  _words := coalesce(array_length(regexp_split_to_array(btrim(_text), '\s+'), 1), 0);
  update public.attempt_answers
  set text_answer = _text, word_count = _words, transcript_status = 'confirmed',
      transcript_confirmed_at = now(), transcript_edit_ratio = _ratio
  where id = _answer_id;
  return jsonb_build_object('edit_ratio', _ratio, 'words', _words);
end;
$$;
revoke all on function public.confirm_transcript(uuid, text) from public, anon;
grant execute on function public.confirm_transcript(uuid, text) to authenticated;

-- Queue an AI evaluation for the caller's answer. Returns the evaluation id.
create or replace function public.request_answer_evaluation(_answer_id uuid)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  _aa public.attempt_answers%rowtype;
  _a public.exam_attempts%rowtype;
  _q public.questions%rowtype;
  _allow jsonb;
  _id uuid;
begin
  select * into _aa from public.attempt_answers where id = _answer_id;
  select * into _a from public.exam_attempts where id = _aa.attempt_id;
  if _aa.id is null or _a.user_id is distinct from auth.uid() then
    raise exception 'ANSWER_NOT_FOUND' using errcode = 'P0002';
  end if;
  perform public.close_if_expired(_a.id);
  select * into _a from public.exam_attempts where id = _aa.attempt_id;
  if _a.status = 'in_progress' then raise exception 'SUBMIT_FIRST' using errcode = 'P0001'; end if;
  select q.* into _q from public.exam_questions eq join public.questions q on q.id = eq.question_id where eq.id = _aa.exam_question_id;
  if _q.question_type = 'mcq' then raise exception 'INVALID_ANSWER_TYPE' using errcode = 'P0001'; end if;
  if _aa.answer_mode = 'handwritten' and _aa.transcript_status <> 'confirmed' then
    raise exception 'CONFIRM_TRANSCRIPT_FIRST' using errcode = 'P0001';
  end if;
  if coalesce(btrim(_aa.text_answer), '') = '' then raise exception 'EMPTY_ANSWER' using errcode = 'P0001'; end if;
  select id into _id from public.evaluations where answer_id = _answer_id and method = 'ai_feedback'
    and status in ('queued', 'in_progress', 'completed');
  if _id is not null then return _id; end if;   -- idempotent
  _allow := public.my_evaluation_allowance();
  if (_allow ->> 'remaining')::int <= 0 then raise exception 'NO_EVALUATIONS_LEFT' using errcode = 'P0001'; end if;
  insert into public.evaluations (answer_id, method, status, max_score, requested_by)
  values (_answer_id, 'ai_feedback', 'queued', coalesce((select marks from public.exam_questions where id = _aa.exam_question_id), _q.marks), auth.uid())
  returning id into _id;
  return _id;
end;
$$;
revoke all on function public.request_answer_evaluation(uuid) from public, anon;
grant execute on function public.request_answer_evaluation(uuid) to authenticated;

-- Student asks for the improved sample answer (generated once, on demand).
create or replace function public.request_improved_answer(_evaluation_id uuid)
returns boolean   -- true when generation should start, false when it already exists / is running
language plpgsql
security definer
set search_path = ''
as $$
declare _ev public.evaluations%rowtype;
begin
  select * into _ev from public.evaluations where id = _evaluation_id for update;
  if _ev.id is null or not public.owns_answer(_ev.answer_id) then
    raise exception 'EVALUATION_NOT_FOUND' using errcode = 'P0002';
  end if;
  if _ev.status <> 'completed' or _ev.method <> 'ai_feedback' then raise exception 'NOT_READY' using errcode = 'P0001'; end if;
  if _ev.details ? 'improved_answer' then return false; end if;
  if _ev.improved_requested_at is not null and _ev.improved_requested_at > now() - interval '5 minutes' then return false; end if;
  update public.evaluations set improved_requested_at = now() where id = _evaluation_id;
  return true;
end;
$$;
revoke all on function public.request_improved_answer(uuid) from public, anon;
grant execute on function public.request_improved_answer(uuid) to authenticated;

-- -----------------------------------------------------------------------------
-- Written practice: one question, optional timer (personal practice exam)
-- -----------------------------------------------------------------------------
create or replace function public.create_written_practice(_question_id uuid, _minutes int default null)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare _uid uuid := auth.uid(); _q public.questions%rowtype; _exam uuid;
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  select * into _q from public.questions where id = _question_id;
  if _q.id is null or _q.status <> 'published' or _q.stage <> 'ME' or _q.question_type = 'mcq' then
    raise exception 'QUESTION_NOT_FOUND' using errcode = 'P0002';
  end if;
  if not _q.is_free_sample and not public.has_stage_access('ME') and not public.has_permission('exams.manage') then
    raise exception 'ACCESS_REQUIRED' using errcode = '42501';
  end if;
  if (select count(*) from public.exams where owner_id = _uid and created_at > now() - interval '1 day') >= 40 then
    raise exception 'RATE_LIMIT' using errcode = 'P0001';
  end if;
  insert into public.exams (slug, title, description, stage, kind, paper_id, category_id, duration_minutes, total_marks,
                            is_free, status, owner_id, untimed)
  values ('written-' || replace(gen_random_uuid()::text, '-', ''), 'Written practice: ' || left(regexp_replace(_q.stem, '\s+', ' ', 'g'), 80),
          case when _minutes is null then 'Untimed written practice.' else _minutes || '-minute timed written practice.' end,
          'ME', 'practice', _q.paper_id, _q.category_id,
          coalesce(least(greatest(_minutes, 5), 240), 600), _q.marks, true, 'draft', _uid, _minutes is null)
  returning id into _exam;
  insert into public.exam_questions (exam_id, question_id, position) values (_exam, _q.id, 1);
  update public.exams set status = 'published' where id = _exam;
  return public.start_attempt(_exam);
end;
$$;
revoke all on function public.create_written_practice(uuid, int) from public, anon;
grant execute on function public.create_written_practice(uuid, int) to authenticated;

-- Written questions a student may practise (no answer keys are returned).
create or replace function public.written_practice_questions()
returns table (id uuid, stem text, question_type public.question_type, marks numeric, word_limit int,
               subject_id uuid, subject text, topic text, paper_id uuid, paper text, category text,
               exam_year int, is_free_sample boolean, has_access boolean, attempts int, last_score numeric, last_max numeric)
language sql
stable
security definer
set search_path = ''
as $$
  select q.id, q.stem, q.question_type, q.marks, q.word_limit, q.subject_id, s.name, t.name, q.paper_id, p.title, cat.name,
         hp.exam_year, q.is_free_sample,
         (q.is_free_sample or public.has_stage_access('ME')),
         (select count(*)::int from public.attempt_answers aa join public.exam_attempts a on a.id = aa.attempt_id
            join public.exam_questions eq on eq.id = aa.exam_question_id
            where a.user_id = auth.uid() and eq.question_id = q.id and coalesce(btrim(aa.text_answer), '') <> ''),
         ev.score, ev.max_score
  from public.questions q
  left join public.subjects s on s.id = q.subject_id
  left join public.topics t on t.id = q.topic_id
  left join public.exam_papers p on p.id = q.paper_id
  left join public.exam_categories cat on cat.id = q.category_id
  left join public.historical_papers hp on hp.id = q.historical_paper_id
  left join lateral (
    select ev.score, ev.max_score from public.evaluations ev
    join public.attempt_answers aa on aa.id = ev.answer_id
    join public.exam_attempts a on a.id = aa.attempt_id
    join public.exam_questions eq on eq.id = aa.exam_question_id
    where a.user_id = auth.uid() and eq.question_id = q.id and ev.status = 'completed'
    order by ev.completed_at desc limit 1) ev on true
  where auth.uid() is not null and q.status = 'published' and q.stage = 'ME' and q.question_type <> 'mcq'
  order by p.sort_order nulls last, s.sort_order nulls last, q.created_at;
$$;
revoke all on function public.written_practice_questions() from public, anon;
grant execute on function public.written_practice_questions() to authenticated;

-- -----------------------------------------------------------------------------
-- History and analytics for the caller
-- -----------------------------------------------------------------------------
create or replace function public.my_written_answers(_limit int default 100)
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  select coalesce(jsonb_agg(x order by x.saved_at desc), '[]'::jsonb) from (
    select aa.id, aa.saved_at, aa.answer_mode, aa.word_count, aa.transcript_status, a.id as attempt_id, a.status as attempt_status,
           e.title as exam_title, e.owner_id is not null as is_practice, q.stem, q.question_type, coalesce(eq.marks, q.marks) as marks,
           s.name as subject, p.title as paper, cat.name as category, hp.exam_year,
           (select count(*) from public.answer_pages ap where ap.answer_id = aa.id) as pages,
           ev.id as evaluation_id, ev.status as evaluation_status, ev.score, ev.max_score, ev.scored, ev.completed_at
    from public.attempt_answers aa
    join public.exam_attempts a on a.id = aa.attempt_id
    join public.exams e on e.id = a.exam_id
    join public.exam_questions eq on eq.id = aa.exam_question_id
    join public.questions q on q.id = eq.question_id
    left join public.subjects s on s.id = q.subject_id
    left join public.exam_papers p on p.id = coalesce(q.paper_id, e.paper_id)
    left join public.exam_categories cat on cat.id = coalesce(q.category_id, e.category_id)
    left join public.historical_papers hp on hp.id = q.historical_paper_id
    left join lateral (select * from public.evaluations ev where ev.answer_id = aa.id and ev.method = 'ai_feedback'
                       order by ev.assigned_at desc limit 1) ev on true
    where a.user_id = auth.uid() and q.question_type <> 'mcq'
      and (coalesce(btrim(aa.text_answer), '') <> '' or exists (select 1 from public.answer_pages ap where ap.answer_id = aa.id))
    order by aa.saved_at desc
    limit least(greatest(coalesce(_limit, 100), 1), 500)
  ) x;
$$;
revoke all on function public.my_written_answers(int) from public, anon;
grant execute on function public.my_written_answers(int) to authenticated;

create or replace function public.my_written_performance()
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  with ev as (
    select ev.completed_at, ev.weakness_tags, q.subject_id, s.name as subject,
           coalesce(q.paper_id, e.paper_id) as paper_id, p.title as paper,
           case when ev.scored and ev.score is not null and ev.max_score > 0 then ev.score * 100 / ev.max_score end as pct
    from public.evaluations ev
    join public.attempt_answers aa on aa.id = ev.answer_id
    join public.exam_attempts a on a.id = aa.attempt_id
    join public.exams e on e.id = a.exam_id
    join public.exam_questions eq on eq.id = aa.exam_question_id
    join public.questions q on q.id = eq.question_id
    left join public.subjects s on s.id = q.subject_id
    left join public.exam_papers p on p.id = coalesce(q.paper_id, e.paper_id)
    where a.user_id = auth.uid() and ev.method = 'ai_feedback' and ev.status = 'completed'
  )
  select jsonb_build_object(
    'evaluated', (select count(*) from ev),
    'scored', (select count(pct) from ev),
    'avg_pct', (select round(avg(pct)) from ev),
    'by_subject', coalesce((select jsonb_agg(jsonb_build_object('subject_id', subject_id, 'subject', subject, 'answers', n, 'avg_pct', pct) order by pct nulls last)
       from (select subject_id, subject, count(*) n, round(avg(pct)) pct from ev group by subject_id, subject) x), '[]'::jsonb),
    'by_paper', coalesce((select jsonb_agg(jsonb_build_object('paper_id', paper_id, 'paper', paper, 'answers', n, 'avg_pct', pct) order by paper)
       from (select paper_id, paper, count(*) n, round(avg(pct)) pct from ev group by paper_id, paper) x), '[]'::jsonb),
    'weaknesses', coalesce((select jsonb_agg(jsonb_build_object('tag', tag, 'count', n) order by n desc, tag)
       from (select tag, count(*) n from ev, unnest(ev.weakness_tags) tag group by tag) x), '[]'::jsonb),
    'trend', coalesce((select jsonb_agg(jsonb_build_object('at', completed_at, 'pct', round(pct)) order by completed_at)
       from (select completed_at, pct from ev where pct is not null order by completed_at desc limit 30) t), '[]'::jsonb)
  );
$$;
revoke all on function public.my_written_performance() from public, anon;
grant execute on function public.my_written_performance() to authenticated;

-- -----------------------------------------------------------------------------
-- Staff: usage overview
-- -----------------------------------------------------------------------------
create or replace function public.evaluation_usage(_days int default 30)
returns jsonb
language plpgsql
stable
security definer
set search_path = ''
as $$
begin
  if not (public.has_permission('evaluations.assign') or public.has_permission('reports.view')) then
    raise exception 'Missing permission' using errcode = '42501';
  end if;
  return jsonb_build_object(
    'evaluations', (select jsonb_object_agg(status, n) from (select status, count(*) n from public.evaluations
                    where method = 'ai_feedback' and assigned_at > now() - make_interval(days => _days) group by status) x),
    'open_reports', (select count(*) from public.evaluation_reports where status = 'open'),
    'problems', (select count(*) from public.evaluations where quality_status = 'problem'),
    'jobs', coalesce((select jsonb_agg(jsonb_build_object('kind', kind, 'jobs', n, 'input_tokens', i, 'output_tokens', o))
             from (select kind, count(*) n, coalesce(sum(input_tokens), 0) i, coalesce(sum(output_tokens), 0) o from public.ai_jobs
                   where created_at > now() - make_interval(days => _days) group by kind) x), '[]'::jsonb),
    'per_day', coalesce((select jsonb_agg(jsonb_build_object('day', d, 'n', n) order by d)
             from (select date_trunc('day', assigned_at)::date d, count(*) n from public.evaluations
                   where method = 'ai_feedback' and assigned_at > now() - make_interval(days => _days) group by 1) x), '[]'::jsonb)
  );
end;
$$;
revoke all on function public.evaluation_usage(int) from public, anon;
grant execute on function public.evaluation_usage(int) to authenticated;

-- -----------------------------------------------------------------------------
-- Private Storage bucket for answer sheets
-- -----------------------------------------------------------------------------
do $$
begin
  if to_regclass('storage.buckets') is not null then
    insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
    values ('answer-sheets', 'answer-sheets', false, 8388608, array['image/jpeg', 'image/png', 'image/webp'])
    on conflict (id) do update set public = false, file_size_limit = excluded.file_size_limit,
      allowed_mime_types = excluded.allowed_mime_types;

    execute $p$
      create policy "answer sheets: owner or staff read" on storage.objects for select to authenticated
      using (bucket_id = 'answer-sheets' and (split_part(name, '/', 1) = auth.uid()::text or public.has_permission('evaluations.assign')))
    $p$;
    execute $p$
      create policy "answer sheets: owner upload" on storage.objects for insert to authenticated
      with check (bucket_id = 'answer-sheets' and split_part(name, '/', 1) = auth.uid()::text
                  and public.answer_accepts_pages(nullif(split_part(name, '/', 2), '')::uuid))
    $p$;
    execute $p$
      create policy "answer sheets: owner delete" on storage.objects for delete to authenticated
      using (bucket_id = 'answer-sheets' and split_part(name, '/', 1) = auth.uid()::text
             and public.answer_accepts_pages(nullif(split_part(name, '/', 2), '')::uuid))
    $p$;
  end if;
end;
$$;

