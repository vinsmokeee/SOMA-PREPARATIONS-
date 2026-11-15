-- =============================================================================
-- Soma Preparations — Migration 0015: AI question intelligence (Milestone 6)
--
-- question_bank_analysis(): coverage and pattern statistics for staff — per
-- subject and topic, by status, origin and difficulty, and past-paper
-- questions per year. Used to find gaps and to brief AI question drafting.
-- AI-drafted questions use the existing columns questions.origin
-- ('ai_generated'), questions.status ('ai_generated') and questions.ai_job_id;
-- every AI call is logged in ai_jobs.
-- =============================================================================

create index if not exists questions_ai_job_idx on public.questions (ai_job_id) where ai_job_id is not null;

create or replace function public.question_bank_analysis(_stage public.exam_stage default null)
returns jsonb
language plpgsql
stable
security definer
set search_path = ''
as $$
begin
  if not (public.has_permission('ai.run') or public.has_permission('questions.review') or public.has_permission('reports.view')) then
    raise exception 'Missing permission' using errcode = '42501';
  end if;
  return jsonb_build_object(
    'subjects', coalesce((
      select jsonb_agg(row_to_json(x) order by x.stage, x.sort_order) from (
        select s.id, s.name, s.stage, s.sort_order, s.is_official,
               count(q.id) filter (where q.status = 'published') as published,
               count(q.id) filter (where q.status in ('awaiting_review', 'verified', 'revision_requested')) as in_review,
               count(q.id) filter (where q.status in ('draft', 'ai_generated')) as drafts,
               count(q.id) filter (where q.origin = 'ai_generated' and q.status <> 'archived') as ai_drafted,
               count(q.id) filter (where q.origin = 'historical_official' and q.status <> 'archived') as past_paper,
               count(q.id) filter (where q.difficulty = 'foundation' and q.status = 'published') as foundation,
               count(q.id) filter (where q.difficulty = 'standard' and q.status = 'published') as standard,
               count(q.id) filter (where q.difficulty = 'advanced' and q.status = 'published') as advanced,
               coalesce((
                 select jsonb_agg(jsonb_build_object('id', t.id, 'name', t.name, 'published', t.n) order by t.n, t.name)
                 from (
                   select tp.id, tp.name, count(q2.id) filter (where q2.status = 'published') as n
                   from public.topics tp left join public.questions q2 on q2.topic_id = tp.id
                   where tp.subject_id = s.id and tp.is_active
                   group by tp.id, tp.name
                 ) t), '[]'::jsonb) as topics
        from public.subjects s
        left join public.questions q on q.subject_id = s.id
        where s.is_active and (_stage is null or s.stage = _stage)
        group by s.id, s.name, s.stage, s.sort_order, s.is_official
      ) x), '[]'::jsonb),
    'past_papers_by_year', coalesce((
      select jsonb_agg(row_to_json(y) order by y.exam_year desc) from (
        select hp.exam_year, hp.stage, count(distinct hp.id) as papers, count(q.id) as questions
        from public.historical_papers hp
        left join public.questions q on q.historical_paper_id = hp.id and q.status <> 'archived'
        where (_stage is null or hp.stage = _stage)
        group by hp.exam_year, hp.stage
      ) y), '[]'::jsonb),
    'unclassified', (select count(*) from public.questions where subject_id is null and status <> 'archived' and (_stage is null or stage = _stage))
  );
end;
$$;
revoke execute on function public.question_bank_analysis(public.exam_stage) from public, anon;
grant execute on function public.question_bank_analysis(public.exam_stage) to authenticated;
