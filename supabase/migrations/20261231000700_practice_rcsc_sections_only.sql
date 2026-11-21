-- Founder, 22 Nov 2026: a paper's practice sections must follow the RCSC paper (Section I, II, III... / Part A, B...).
-- Daily current-affairs questions (origin 'current_affairs') are practised in News, so they are no longer listed or
-- picked as a section of a paper (they showed as an extra "Short answers" section in General Paper II).
-- The order of the practice buttons follows the paper's sections in the app (typesInPaperOrder).

create or replace function public.pick_me_questions(_paper uuid, _type public.question_type, _n int, _exclude uuid[] default '{}')
returns setof uuid
language sql
volatile
security definer
set search_path = ''
as $$
  select q.id
  from public.questions q
  left join lateral (
    select count(distinct a.user_id) filter (where a.user_id <> auth.uid()) as others,
           bool_or(a.user_id = auth.uid()) as mine
    from public.exam_questions eq join public.exam_attempts a on a.exam_id = eq.exam_id
    where eq.question_id = q.id) u on true
  where auth.uid() is not null and q.paper_id = _paper and q.status = 'published' and q.stage = 'ME' and q.question_type <> 'mcq'
    and (_type is null or q.question_type = _type)
    and not (q.id = any (coalesce(_exclude, '{}')))
    and q.origin is distinct from 'current_affairs'
    and public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id)
  order by coalesce(u.mine, false), coalesce(u.others, 0), random()
  limit greatest(_n, 0);
$$;
revoke all on function public.pick_me_questions(uuid, public.question_type, int, uuid[]) from public, anon, authenticated;

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
    select p.id, p.paper_number, p.title, p.weightage_percent,
           coalesce(g.duration_minutes, p.duration_minutes) as duration_minutes, coalesce(g.max_marks, p.max_marks) as max_marks,
           coalesce(g.reading_minutes, p.reading_minutes) as reading_minutes
    from public.exam_papers p
    left join public.paper_group_settings g on g.paper_id = p.id and g.subject_group_id = public.my_subject_group()
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
    'duration_minutes', p.duration_minutes, 'max_marks', p.max_marks, 'reading_minutes', p.reading_minutes,
    'marked', (select count(*) from marked m where m.paper_id = p.id),
    'recent', (select round(avg(r.pct)) from (select m.pct from marked m where m.paper_id = p.id order by m.completed_at desc limit 10) r),
    'types', (select coalesce(jsonb_agg(jsonb_build_object('type', x.question_type, 'count', x.n) order by x.question_type), '[]'::jsonb) from (
        select q.question_type, count(*) as n from public.questions q
        where q.paper_id = p.id and q.status = 'published' and q.stage = 'ME' and q.question_type <> 'mcq'
          and q.origin is distinct from 'current_affairs'
          and public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id)
        group by q.question_type) x),
    'by_type', (select coalesce(jsonb_agg(jsonb_build_object('label', y.question_type, 'pct', y.pct, 'n', y.n)), '[]'::jsonb) from (
        select m.question_type, round(avg(m.pct)) as pct, count(*) as n from marked m where m.paper_id = p.id group by m.question_type) y),
    'by_topic', (select coalesce(jsonb_agg(jsonb_build_object('label', z.topic, 'pct', z.pct, 'n', z.n)), '[]'::jsonb) from (
        select m.topic, round(avg(m.pct)) as pct, count(*) as n from marked m where m.paper_id = p.id and m.topic is not null group by m.topic) z),
    'mocks', (select coalesce(jsonb_agg(jsonb_build_object('at', k.submitted_at, 'pct', k.pct) order by k.submitted_at), '[]'::jsonb) from (
        -- written marks (latest evaluations) plus the automatically marked multiple-choice questions
        select a.submitted_at,
               round((coalesce(sum(m.score), 0) + coalesce(max(a.score), 0))
                     / nullif(coalesce(nullif(max(e.total_marks), 0), max(a.max_score)), 0) * 100) as pct
        from public.exam_attempts a
        join public.exams e on e.id = a.exam_id and e.kind = 'mock' and e.stage = 'ME' and e.paper_id = p.id
        left join marked m on m.attempt_id = a.id
        where a.user_id = auth.uid() and a.status in ('submitted', 'auto_submitted')
        group by a.id, a.submitted_at
        having count(m.attempt_id) > 0 or coalesce(max(a.score), 0) > 0) k),
    'mock_ready', public.paper_mock_ready(p.id),
    'pattern', (select coalesce(jsonb_agg(jsonb_build_object('title', b.title, 'type', b.question_type, 'count', b.question_count,
        'marks_each', b.marks_each, 'answer_any', b.answer_any) order by b.sort_order, b.created_at), '[]'::jsonb)
        from public.paper_sections_for_me(p.id) b)
  ) order by p.paper_number), '[]'::jsonb)
  from papers p
  where auth.uid() is not null;
$$;
