-- =============================================================================
-- Soma Preparations — Migration 0007: Public read helpers
--
-- source_documents is internal (it holds rights notes). Public pages still need
-- to cite the official documents behind the examination structure, so this
-- function exposes ONLY citation columns of documents that are referenced by
-- framework, cycle, paper or subject rows.
-- =============================================================================
create or replace function public.get_official_citations()
returns table (
  id uuid,
  title text,
  url text,
  publisher text,
  reference_number text,
  published_on date,
  last_retrieved_at timestamptz
)
language sql
stable
security definer
set search_path = ''
as $$
  select d.id, d.title, d.url, d.publisher, d.reference_number, d.published_on, d.last_retrieved_at
  from public.source_documents d
  where d.id in (
    select source_document_id from public.exam_frameworks where source_document_id is not null
    union select source_document_id from public.exam_cycles where source_document_id is not null
    union select source_document_id from public.exam_papers where source_document_id is not null
    union select source_document_id from public.subjects where source_document_id is not null
  )
  order by d.published_on desc nulls last;
$$;
revoke all on function public.get_official_citations() from public;
grant execute on function public.get_official_citations() to anon, authenticated, service_role;
