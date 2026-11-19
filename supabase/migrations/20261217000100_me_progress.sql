-- ME progress for the paper pages and the overall card (founder, 20 Nov 2026).
-- One row per ME paper of the caller's category: weight, time and marks (NULL until known from RCSC),
-- question types available, marked answers, the average of the last 10 marked answers ("recent"),
-- results by question type and by topic, mock-paper attempts, and a published mock paper to start.
-- Past papers and their years are not returned (founder: students do not see them).
create or replace function public.my_me_progress()
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  with me as (
    select entry_category_id as cat from public.profiles where id = auth.uid()
  ), papers as (
    select p.id, p.paper_number, p.title, p.weightage_percent, p.duration_minutes, p.max_marks
    from public.exam_papers p
    join public.exam_paper_categories pc on pc.paper_id = p.id
    join me on me.cat = pc.category_id
    where p.stage = 'ME'
  ), marked as (  -- the latest completed evaluation of each of the caller's ME answers
    select distinct on (aa.id) q.paper_id, q.question_type, t.name as topic, a.id as attempt_id,
           ev.score, ev.max_score, ev.score / ev.max_score * 100 as pct, ev.completed_at
    from public.attempt_answers aa
    join public.exam_attempts a on a.id = aa.attempt_id and a.user_id = auth.uid()
    join public.exam_questions eq on eq.id = aa.exam_question_id
    join public.questions q on q.id = eq.question_id and q.stage = 'ME'
    left join public.topics t on t.id = q.topic_id
    join public.evaluations ev on ev.answer_id = aa.id and ev.status = 'completed' and ev.max_score > 0 and ev.score is not null
      and coalesce(ev.scored, true)  -- feedback-only evaluations have no mark
    order by aa.id, ev.completed_at desc
  )
  select coalesce(jsonb_agg(jsonb_build_object(
    'id', p.id, 'number', p.paper_number, 'title', p.title, 'weight', p.weightage_percent,
    'duration_minutes', p.duration_minutes, 'max_marks', p.max_marks,
    'marked', (select count(*) from marked m where m.paper_id = p.id),
    'recent', (select round(avg(r.pct)) from (select m.pct from marked m where m.paper_id = p.id order by m.completed_at desc limit 10) r),
    'types', (select coalesce(jsonb_agg(jsonb_build_object('type', x.question_type, 'count', x.n) order by x.question_type), '[]'::jsonb) from (
        select q.question_type, count(*) as n from public.questions q
        where q.paper_id = p.id and q.status = 'published' and q.stage = 'ME' and q.question_type <> 'mcq'
          and public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id)
        group by q.question_type) x),
    'by_type', (select coalesce(jsonb_agg(jsonb_build_object('label', y.question_type, 'pct', y.pct, 'n', y.n)), '[]'::jsonb) from (
        select m.question_type, round(avg(m.pct)) as pct, count(*) as n from marked m where m.paper_id = p.id group by m.question_type) y),
    'by_topic', (select coalesce(jsonb_agg(jsonb_build_object('label', z.topic, 'pct', z.pct, 'n', z.n)), '[]'::jsonb) from (
        select m.topic, round(avg(m.pct)) as pct, count(*) as n from marked m where m.paper_id = p.id and m.topic is not null group by m.topic) z),
    'mocks', (select coalesce(jsonb_agg(jsonb_build_object('at', k.submitted_at, 'pct', k.pct) order by k.submitted_at), '[]'::jsonb) from (
        select a.submitted_at,
               round(sum(m.score) / coalesce(nullif(max(e.total_marks), 0), sum(m.max_score)) * 100) as pct
        from public.exam_attempts a
        join public.exams e on e.id = a.exam_id and e.kind = 'mock' and e.stage = 'ME' and e.paper_id = p.id
        join marked m on m.attempt_id = a.id
        where a.user_id = auth.uid() and a.status in ('submitted', 'auto_submitted')
        group by a.id, a.submitted_at) k),
    'mock_slug', (select e.slug from public.exams e
        where e.stage = 'ME' and e.kind = 'mock' and e.paper_id = p.id and e.status = 'published' and e.owner_id is null
          and public.entry_fits(e.stage, e.paper_id, e.category_id, e.specialisation_id, e.subject_group_id)
        order by e.created_at desc limit 1)
  ) order by p.paper_number), '[]'::jsonb)
  from papers p
  where auth.uid() is not null;
$$;
revoke all on function public.my_me_progress() from public, anon;
grant execute on function public.my_me_progress() to authenticated;
