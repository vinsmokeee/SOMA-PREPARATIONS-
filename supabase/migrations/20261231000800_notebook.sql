-- "Your notebook" (founder, 22 Nov 2026): every question a student has answered correctly is kept as a note with
-- its answer, so they can revise any time. PE: grouped by subject. ME: grouped by paper (I, II, III), then subject.
--  * Multiple choice: answered correctly in a submitted test or practice (any time).
--  * Written (ME): an AI-marked answer that scored at least 60% (the best mark is shown).
-- Only questions the student has already answered and seen the result of are shown, so nothing new is revealed:
-- the result page already shows the right option, explanation and model answer.

create or replace function public.my_notebook(_stage public.exam_stage)
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  with mine as (
    select aa.id as answer_id, aa.is_correct, aa.selected_option_id, eq.question_id, a.submitted_at
    from public.attempt_answers aa
    join public.exam_attempts a on a.id = aa.attempt_id
    join public.exam_questions eq on eq.id = aa.exam_question_id
    where a.user_id = auth.uid() and a.status in ('submitted', 'auto_submitted')
  ),
  mcq as (
    select distinct on (m.question_id) m.question_id, m.submitted_at as saved_at, null::numeric as score, null::numeric as max_score
    from mine m where m.is_correct and m.selected_option_id is not null
    order by m.question_id, m.submitted_at desc
  ),
  written as (
    select distinct on (m.question_id) m.question_id, ev.completed_at as saved_at, ev.score, ev.max_score
    from mine m
    join public.evaluations ev on ev.answer_id = m.answer_id and ev.method = 'ai_feedback' and ev.status = 'completed'
      and ev.scored and ev.max_score > 0 and ev.score >= 0.6 * ev.max_score
    order by m.question_id, ev.score / ev.max_score desc, ev.completed_at desc
  ),
  notes as (select * from mcq union all select * from written)
  select coalesce(jsonb_agg(jsonb_build_object(
      'question_id', q.id,
      'kind', case when q.question_type = 'mcq' then 'mcq' else 'written' end,
      'paper_id', p.id, 'paper_number', p.paper_number, 'paper_title', p.title,
      'subject', coalesce(s.name, case when q.origin = 'current_affairs' then 'Current affairs' end, 'General'),
      'subject_order', coalesce(s.sort_order, 999),
      'stem', q.stem, 'image_url', q.image_url, 'source_year', q.source_year,
      'answer', case when q.question_type = 'mcq' then
        (select o.body from public.question_options o where o.question_id = q.id and o.is_correct order by o.position limit 1) end,
      'explanation', q.explanation,
      'model_answer', case when q.question_type <> 'mcq' then q.model_answer end,
      'score', n.score, 'max_score', n.max_score,
      'saved_at', n.saved_at
    ) order by coalesce(s.sort_order, 999), coalesce(s.name, 'zzz'), n.saved_at desc), '[]'::jsonb)
  from notes n
  join public.questions q on q.id = n.question_id and q.stage = _stage
  left join public.subjects s on s.id = q.subject_id
  left join public.exam_papers p on p.id = q.paper_id
  where auth.uid() is not null;
$$;
revoke all on function public.my_notebook(public.exam_stage) from public, anon;
grant execute on function public.my_notebook(public.exam_stage) to authenticated;
