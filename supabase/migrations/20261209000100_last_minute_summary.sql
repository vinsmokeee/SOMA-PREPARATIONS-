-- Last-minute summary (founder, 19 Nov 2026): the day before and on exam day, students open a short revision page.
-- Mostly past-paper questions: the student's own mistakes (with the right answer and explanation), their score by
-- section, and, for Premium, key past-paper questions they have not seen yet. Students still never read the question
-- tables directly; this returns only what the page shows.
create or replace function public.my_last_minute_summary(_stage public.exam_stage default 'PE')
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  with la as (
    select l.question_id, l.is_correct, l.answered_at from public.my_latest_answers() l
    join public.questions q on q.id = l.question_id and q.stage = _stage and q.question_type = 'mcq'
  ),
  item as (
    select q.id, q.stem, q.image_url, q.explanation, q.origin, q.source_year, s.name as subject,
           (select o.body from public.question_options o where o.question_id = q.id and o.is_correct order by o.position limit 1) as answer
    from public.questions q left join public.subjects s on s.id = q.subject_id
  )
  select jsonb_build_object(
    'premium', public.has_stage_access(_stage) or public.has_permission('exams.manage'),
    'answered', (select count(*) from la),
    'sections', coalesce((
      select jsonb_agg(jsonb_build_object('subject', x.subject, 'answered', x.n, 'correct', x.c) order by x.c::numeric / x.n, x.subject)
      from (select coalesce(s.name, 'Other') as subject, count(*) as n, count(*) filter (where la.is_correct) as c
            from la join public.questions q on q.id = la.question_id left join public.subjects s on s.id = q.subject_id
            group by 1) x), '[]'::jsonb),
    -- Mistakes: past-paper questions first, then the most recent.
    'mistakes', coalesce((
      select jsonb_agg(to_jsonb(m) - 'k' order by m.k) from (
        select i.stem, i.image_url, i.explanation, i.subject, i.source_year, i.answer, i.origin = 'historical_official' as past_paper,
               row_number() over (order by (i.origin = 'historical_official') desc, la.answered_at desc) as k
        from la join item i on i.id = la.question_id
        where la.is_correct is not true
        order by k limit 25) m), '[]'::jsonb),
    -- Premium: key past-paper questions not yet seen (newest papers first).
    'key_past', case when public.has_stage_access(_stage) or public.has_permission('exams.manage') then coalesce((
      select jsonb_agg(to_jsonb(k) - 'k' order by k.k) from (
        select i.stem, i.image_url, i.explanation, i.subject, i.source_year, i.answer,
               row_number() over (order by i.source_year desc nulls last, i.subject, i.id) as k
        from item i join public.questions q on q.id = i.id
        where q.status = 'published' and q.stage = _stage and q.question_type = 'mcq' and q.origin = 'historical_official'
          and q.image_url is null
          and not exists (select 1 from la where la.question_id = q.id)
        order by k limit 15) k), '[]'::jsonb) else '[]'::jsonb end
  );
$$;
revoke all on function public.my_last_minute_summary(public.exam_stage) from public, anon;
grant execute on function public.my_last_minute_summary(public.exam_stage) to authenticated;
