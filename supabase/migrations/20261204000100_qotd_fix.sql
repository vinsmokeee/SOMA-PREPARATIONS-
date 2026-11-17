-- Question of the Day: clearer behaviour (founder report, 17 Nov 2026).
--  * A student who opened the question and left had it submitted blank by the 5-minute timer; afterwards the
--    button only ever showed that empty result. Now an unanswered finished attempt is ignored and a fresh
--    attempt starts, and the time allowed is 10 minutes.
--  * my_question_of_day() tells the page whether today's question is already answered (and if correctly), so
--    the page can say so instead of offering "Answer" again.

create or replace function public.start_question_of_day()
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare _uid uuid := auth.uid(); _q uuid; _exam uuid; _done uuid; _day date := public.bhutan_today();
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  select cd.question_id into _q from public.ca_daily cd join public.questions q on q.id = cd.question_id
  where cd.day = _day and q.status = 'published';
  if _q is null then raise exception 'NO_QUESTION_TODAY' using errcode = 'P0001'; end if;
  select e.id into _exam from public.exams e join public.exam_questions eq on eq.exam_id = e.id
  where e.owner_id = _uid and e.slug like 'qotd-%' and eq.question_id = _q limit 1;
  if _exam is null then
    insert into public.exams (slug, title, description, stage, kind, duration_minutes, is_free, status, owner_id)
    values ('qotd-' || replace(gen_random_uuid()::text, '-', ''), 'Question of the Day — ' || to_char(_day, 'DD Mon YYYY'),
            'Current affairs', 'PE', 'practice', 10, true, 'draft', _uid)
    returning id into _exam;
    insert into public.exam_questions (exam_id, question_id, position) values (_exam, _q, 1);
    update public.exams set status = 'published' where id = _exam;
  else
    update public.exams set duration_minutes = greatest(duration_minutes, 10) where id = _exam;
  end if;
  -- Already answered today: return that attempt so the result page opens. A blank finished attempt (timed
  -- out without an answer) does not count: start again.
  select a.id into _done from public.exam_attempts a
  where a.exam_id = _exam and a.user_id = _uid and a.status <> 'in_progress'
    and exists (select 1 from public.attempt_answers aa where aa.attempt_id = a.id and aa.selected_option_id is not null)
  order by a.started_at desc limit 1;
  return coalesce(_done, public.start_attempt(_exam));
end;
$$;
revoke all on function public.start_question_of_day() from public, anon;
grant execute on function public.start_question_of_day() to authenticated;

-- Has the signed-in student answered today's Question of the Day?
create or replace function public.my_question_of_day()
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  select jsonb_build_object('answered', a.id is not null, 'correct', coalesce(aa.is_correct, false), 'attempt_id', a.id)
  from (select cd.question_id from public.ca_daily cd where cd.day = public.bhutan_today()) d
  left join lateral (
    select a.id from public.exam_attempts a
    join public.exams e on e.id = a.exam_id and e.owner_id = auth.uid() and e.slug like 'qotd-%'
    join public.exam_questions eq on eq.exam_id = e.id and eq.question_id = d.question_id
    where a.user_id = auth.uid() and a.status <> 'in_progress'
      and exists (select 1 from public.attempt_answers x where x.attempt_id = a.id and x.selected_option_id is not null)
    order by a.started_at desc limit 1) a on true
  left join public.attempt_answers aa on aa.attempt_id = a.id and aa.selected_option_id is not null;
$$;
revoke all on function public.my_question_of_day() from public, anon;
grant execute on function public.my_question_of_day() to authenticated;
