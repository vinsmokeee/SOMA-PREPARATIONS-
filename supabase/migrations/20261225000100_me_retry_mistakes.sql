-- "Retry my mistakes" after an ME mock (founder, 20 Nov 2026): a short, untimed practice with only the questions the
-- student skipped, scored below half marks on (AI-marked written parts) or got wrong (multiple choice). In papers with
-- "answer any N", only the chosen questions count. The retry shows "Before -> Now" for each question.

alter table public.exams add column if not exists retry_of_attempt uuid references public.exam_attempts (id) on delete set null;

-- Each question of an ME mock attempt, with whether it counts as a mistake and why.
create or replace function public.me_attempt_mistakes(_attempt_id uuid)
returns table (question_id uuid, pos int, section text, marks numeric, reason text, before_score numeric, before_max numeric)
language sql
stable
security definer
set search_path = ''
as $$
  with a as (
    select at.* from public.exam_attempts at join public.exams e on e.id = at.exam_id
    where at.id = _attempt_id and at.user_id = auth.uid() and at.status in ('submitted', 'auto_submitted') and e.stage = 'ME'
  ), items as (
    select eq.question_id, eq.position as pos, eq.section, coalesce(eq.marks, q.marks) as marks, q.question_type, eq.choose_any, eq.choice_group,
           aa.id as answer_id, aa.is_correct, aa.selected_option_id, coalesce(btrim(aa.text_answer), '') as text_answer,
           (select count(*) from public.answer_pages p where p.answer_id = aa.id) as pages,
           ev.score, ev.max_score
    from a
    join public.exam_questions eq on eq.exam_id = a.exam_id
    join public.questions q on q.id = eq.question_id
    left join public.attempt_answers aa on aa.attempt_id = a.id and aa.exam_question_id = eq.id
    left join lateral (
      select e2.score, e2.max_score from public.evaluations e2
      where e2.answer_id = aa.id and e2.status = 'completed' and e2.max_score > 0 and e2.score is not null and coalesce(e2.scored, true)
      order by e2.completed_at desc limit 1) ev on true
    where eq.choose_any is null or eq.choice_group = any (coalesce(a.chosen_groups, '{}'))
  )
  select i.question_id, i.pos, i.section, i.marks,
         case
           when i.question_type = 'mcq' then case when i.is_correct is true then null when i.selected_option_id is null then 'skipped' else 'wrong' end
           when i.text_answer = '' and coalesce(i.pages, 0) = 0 then 'skipped'
           when i.score is null then 'not_marked'
           when i.score < i.max_score / 2 then 'low'
           else null
         end,
         case when i.question_type = 'mcq' then (case when i.is_correct then i.marks else 0 end) else i.score end,
         case when i.question_type = 'mcq' then i.marks else i.max_score end
  from items i
  order by i.pos;
$$;
revoke all on function public.me_attempt_mistakes(uuid) from public, anon;
grant execute on function public.me_attempt_mistakes(uuid) to authenticated;

-- Build the retry practice from the mistakes (not 'not_marked', which needs marking first) and start it.
create or replace function public.start_me_retry(_attempt_id uuid)
returns uuid
language plpgsql
volatile
security definer
set search_path = ''
as $$
declare _uid uuid := auth.uid(); _e public.exams%rowtype; _exam uuid; _n int := 0; _m record;
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  if not public.has_stage_access('ME') and not public.has_permission('exams.manage') then raise exception 'ACCESS_REQUIRED' using errcode = '42501'; end if;
  select e.* into _e from public.exam_attempts at join public.exams e on e.id = at.exam_id
  where at.id = _attempt_id and at.user_id = _uid and at.status in ('submitted', 'auto_submitted') and e.stage = 'ME';
  if _e.id is null then raise exception 'ATTEMPT_NOT_FOUND' using errcode = 'P0002'; end if;
  if (select count(*) from public.exams where owner_id = _uid and created_at > now() - interval '1 day') >= 40 then
    raise exception 'RATE_LIMIT' using errcode = 'P0001';
  end if;
  insert into public.exams (slug, title, description, stage, kind, paper_id, duration_minutes, total_marks, is_free, status, owner_id, untimed, retry_of_attempt)
  values ('practice-retry-' || replace(gen_random_uuid()::text, '-', ''), 'Retry my mistakes: ' || _e.title,
          'Untimed practice with the questions you skipped, got wrong or scored below half marks on.', 'ME', 'practice', _e.paper_id,
          600, null, false, 'draft', _uid, true, _attempt_id)
  returning id into _exam;
  for _m in select * from public.me_attempt_mistakes(_attempt_id) m where m.reason in ('skipped', 'wrong', 'low') order by m.pos loop
    _n := _n + 1;
    insert into public.exam_questions (exam_id, question_id, position, section, marks)
    values (_exam, _m.question_id, _n, regexp_replace(coalesce(_m.section, ''), '\s*\(answer any \d+ of the \d+ questions\)\s*$', ''), _m.marks);
  end loop;
  if _n = 0 then raise exception 'NO_MISTAKES' using errcode = 'P0002'; end if;
  update public.exams set status = 'published', total_marks = (select sum(marks) from public.exam_questions where exam_id = _exam) where id = _exam;
  return public.start_attempt(_exam);
end;
$$;
revoke all on function public.start_me_retry(uuid) from public, anon;
grant execute on function public.start_me_retry(uuid) to authenticated;

-- For a retry: each question's marks in the original mock ("before") and in this retry ("now").
create or replace function public.me_retry_compare(_attempt_id uuid)
returns table (question_id uuid, pos int, before_score numeric, before_max numeric, now_score numeric, now_max numeric)
language sql
stable
security definer
set search_path = ''
as $$
  with r as (
    select at.id, e.retry_of_attempt from public.exam_attempts at join public.exams e on e.id = at.exam_id
    where at.id = _attempt_id and at.user_id = auth.uid() and e.retry_of_attempt is not null and at.status in ('submitted', 'auto_submitted')
  )
  select b.question_id, n.pos, b.before_score, b.before_max, n.before_score, n.before_max
  from r
  join lateral public.me_attempt_mistakes(r.retry_of_attempt) b on true
  join lateral public.me_attempt_mistakes(r.id) n on n.question_id = b.question_id
  order by n.pos;
$$;
revoke all on function public.me_retry_compare(uuid) from public, anon;
grant execute on function public.me_retry_compare(uuid) to authenticated;
