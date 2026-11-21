-- Question allocation is the backbone of Soma (founder, 22 Nov 2026: "agriculture subject papers shouldn't be seen in
-- medical or Dzongkha"). Audit result: every published ME question carries the right paper and subject tags, and every
-- practice / mock / exam picker already follows the student's entry. Fixed here:
--  1. entry_fits no longer exempts staff: the student area always follows the account's own entry (the founder's admin
--     account saw every subject mixed together). Admin pages read questions directly and are unaffected.
--  2. Last-minute summary: past-paper questions and scores only from the student's own entry (it showed every subject).
--  3. Your notebook: only notes from the student's current entry.
--     (Also fixes the last-minute summary's key past-paper list, which failed for premium students: alias clash.)
--  4. A lock: an ME question cannot be published without the tags its paper needs (paper; specialisation for subject
--     papers; subject group for group papers), and a specialisation must belong to the question's subject group.

create or replace function public.entry_fits(_stage public.exam_stage, _paper uuid, _category uuid, _spec uuid, _group uuid)
returns boolean
language plpgsql
stable
security definer
set search_path = ''
as $$
declare _c uuid; _s uuid; _g uuid; _scope text;
begin
  -- Server jobs (no signed-in user) and PE (one paper for everyone) see everything. Staff are NOT exempt here:
  -- the student area always follows the account's own entry, so staff see exactly what such a student sees.
  if auth.uid() is null or _stage = 'PE' then
    return true;
  end if;
  if _paper is null and _category is null and _spec is null and _group is null then
    return false;  -- unclassified ME content is never shown to students
  end if;
  select p.entry_category_id, p.specialisation_id, coalesce(p.subject_group_id, sp.subject_group_id) into _c, _s, _g
  from public.profiles p left join public.specialisations sp on sp.id = p.specialisation_id
  where p.id = auth.uid();
  if _category is not null and _category is distinct from _c then return false; end if;
  if _spec is not null and _spec is distinct from _s then return false; end if;
  if _group is not null and _group is distinct from _g then return false; end if;
  if _paper is not null then
    select bank_scope into _scope from public.exam_papers where id = _paper;
    if _c is null or not exists (select 1 from public.exam_paper_categories where paper_id = _paper and category_id = _c) then
      return false;
    end if;
    if _scope = 'specialisation' and _spec is null then return false; end if;
    if _scope = 'subject_group' and _spec is null and _group is null then return false; end if;
  end if;
  return true;
end;
$$;
revoke all on function public.entry_fits(public.exam_stage, uuid, uuid, uuid, uuid) from public, anon, authenticated;

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
    where public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id)
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
      select jsonb_agg(to_jsonb(kp) - 'k' order by kp.k) from (
        select i.stem, i.image_url, i.explanation, i.subject, i.source_year, i.answer,
               row_number() over (order by i.source_year desc nulls last, i.subject, i.id) as k
        from item i join public.questions q on q.id = i.id
        where q.status = 'published' and q.stage = _stage and q.question_type = 'mcq' and q.origin = 'historical_official'
          and q.image_url is null
          and public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id)
          and not exists (select 1 from la where la.question_id = q.id)
        order by k limit 15) kp), '[]'::jsonb) else '[]'::jsonb end
  );
$$;
revoke all on function public.my_last_minute_summary(public.exam_stage) from public, anon;
grant execute on function public.my_last_minute_summary(public.exam_stage) to authenticated;

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
      'subject', coalesce(case when _stage = 'ME' then t.name end, s.name, case when q.origin = 'current_affairs' then 'Current affairs' end, 'General'),
      'subject_order', coalesce(case when _stage = 'ME' then t.sort_order end, s.sort_order, 999),
      'stem', q.stem, 'image_url', q.image_url, 'source_year', q.source_year,
      'answer', case when q.question_type = 'mcq' then
        (select o.body from public.question_options o where o.question_id = q.id and o.is_correct order by o.position limit 1) end,
      'explanation', q.explanation,
      'model_answer', case when q.question_type <> 'mcq' then q.model_answer end,
      'score', n.score, 'max_score', n.max_score,
      'saved_at', n.saved_at
    ) order by coalesce(case when _stage = 'ME' then t.sort_order end, s.sort_order, 999),
             coalesce(case when _stage = 'ME' then t.name end, s.name, 'zzz'), n.saved_at desc), '[]'::jsonb)
  from notes n
  join public.questions q on q.id = n.question_id and q.stage = _stage
  left join public.subjects s on s.id = q.subject_id
  left join public.topics t on t.id = q.topic_id
  left join public.exam_papers p on p.id = q.paper_id
  where auth.uid() is not null
    -- Only the student's own entry: notes from another subject (an earlier entry) are not shown.
    and public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id);
$$;
revoke all on function public.my_notebook(public.exam_stage) from public, anon;
grant execute on function public.my_notebook(public.exam_stage) to authenticated;

create or replace function public.check_question_allocation()
returns trigger
language plpgsql
set search_path = ''
as $$
declare _scope text; _spec_group uuid;
begin
  if new.stage <> 'ME' or new.status <> 'published' or new.origin is not distinct from 'current_affairs' then return new; end if;
  if new.paper_id is null then raise exception 'ALLOCATION: an ME question needs its paper' using errcode = 'P0001'; end if;
  select bank_scope into _scope from public.exam_papers where id = new.paper_id;
  if _scope = 'specialisation' and new.specialisation_id is null then
    raise exception 'ALLOCATION: a subject-paper question needs its specialisation' using errcode = 'P0001';
  end if;
  if _scope = 'subject_group' and new.specialisation_id is null and new.subject_group_id is null then
    raise exception 'ALLOCATION: a group-paper question needs its subject group' using errcode = 'P0001';
  end if;
  if new.specialisation_id is not null and new.subject_group_id is not null then
    select subject_group_id into _spec_group from public.specialisations where id = new.specialisation_id;
    if _spec_group is distinct from new.subject_group_id then
      raise exception 'ALLOCATION: the specialisation is not in that subject group' using errcode = 'P0001';
    end if;
  end if;
  return new;
end;
$$;
revoke all on function public.check_question_allocation() from public, anon, authenticated;
create trigger questions_allocation before insert or update of status, stage, paper_id, specialisation_id, subject_group_id, origin
  on public.questions for each row execute function public.check_question_allocation();
