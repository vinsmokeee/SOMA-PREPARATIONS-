-- One part per screen (founder, 20 Nov 2026): each RCSC question with parts (a), (b), (c) is stored as one question
-- per part, linked by passage_group (the shared introduction is folded on later parts) and ordered by passage_position.
-- Practice gives one part at a time. A mock still follows the RCSC pattern ("answer any 2 of 4 questions"), so it now
-- picks whole question groups and adds all their parts, in order.

-- A question group is its passage_group, or the question itself when it has none.
create or replace function public.me_group_key(_q public.questions)
returns text language sql immutable set search_path = '' as $$
  select coalesce(_q.passage_group, _q.id::text)
$$;

-- Which question groups to put in a mock: unseen by the caller first, then the least used by others, then random.
create or replace function public.pick_me_groups(_paper uuid, _type public.question_type, _n int, _exclude text[] default '{}')
returns setof text
language sql
volatile
security definer
set search_path = ''
as $$
  with candidates as (
    select public.me_group_key(q) as grp, q.id
    from public.questions q
    where auth.uid() is not null and q.paper_id = _paper and q.status = 'published' and q.stage = 'ME' and q.question_type <> 'mcq'
      and q.question_type = _type
      and public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id)
  ), use as (
    select c.grp,
           count(distinct a.user_id) filter (where a.user_id <> auth.uid()) as others,
           coalesce(bool_or(a.user_id = auth.uid()), false) as mine
    from candidates c
    left join public.exam_questions eq on eq.question_id = c.id
    left join public.exam_attempts a on a.exam_id = eq.exam_id
    group by c.grp
  )
  select grp from use
  where not (grp = any (coalesce(_exclude, '{}')))
  order by mine, others, random()
  limit greatest(_n, 0);
$$;
revoke all on function public.pick_me_groups(uuid, public.question_type, int, text[]) from public, anon, authenticated;

create or replace function public.paper_mock_ready(_paper uuid)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (select 1 from public.paper_blueprint_sections where paper_id = _paper)
     and not exists (
       select 1 from (
         select b.question_type, sum(b.question_count) as need from public.paper_blueprint_sections b where b.paper_id = _paper group by b.question_type) n
       where n.need > (select count(distinct public.me_group_key(q)) from public.questions q
                       where q.paper_id = _paper and q.status = 'published' and q.stage = 'ME' and q.question_type = n.question_type
                         and public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id)));
$$;

create or replace function public.start_paper_mock(_paper uuid)
returns uuid
language plpgsql
volatile
security definer
set search_path = ''
as $$
declare
  _uid uuid := auth.uid(); _p public.exam_papers%rowtype; _exam uuid; _picked text[] := '{}'; _grps text[];
  _s record; _pos int := 0; _total numeric := 0; _q record; _n int := 0;
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  if not public.has_stage_access('ME') and not public.has_permission('exams.manage') then
    raise exception 'ACCESS_REQUIRED' using errcode = '42501';
  end if;
  select * into _p from public.exam_papers where id = _paper and stage = 'ME';
  if _p.id is null or not public.entry_fits('ME', _p.id, null, null, null) then raise exception 'QUESTION_NOT_FOUND' using errcode = 'P0002'; end if;
  if not exists (select 1 from public.paper_blueprint_sections where paper_id = _paper) then
    raise exception 'NO_PATTERN' using errcode = 'P0002';
  end if;
  if (select count(*) from public.exams where owner_id = _uid and created_at > now() - interval '1 day') >= 40 then
    raise exception 'RATE_LIMIT' using errcode = 'P0001';
  end if;
  insert into public.exams (slug, title, description, stage, kind, paper_id, duration_minutes, total_marks, is_free, status, owner_id, untimed)
  values ('mock-' || replace(gen_random_uuid()::text, '-', ''), 'Paper ' || coalesce(_p.paper_number::text, '') || ' mock: ' || _p.title,
          'A mock paper built for you in the RCSC pattern.', 'ME', 'mock', _p.id,
          coalesce(_p.duration_minutes, 600), _p.max_marks, false, 'draft', _uid, _p.duration_minutes is null)
  returning id into _exam;
  for _s in select * from public.paper_blueprint_sections where paper_id = _paper order by sort_order, created_at loop
    _grps := array(select public.pick_me_groups(_paper, _s.question_type, _s.question_count, _picked));
    if coalesce(array_length(_grps, 1), 0) < _s.question_count then raise exception 'NOT_ENOUGH_QUESTIONS' using errcode = 'P0002'; end if;
    _n := 0;
    for _q in
      select q.id, q.marks, g.ord
      from unnest(_grps) with ordinality as g(grp, ord)
      join public.questions q on public.me_group_key(q) = g.grp
      where q.paper_id = _paper and q.status = 'published' and q.stage = 'ME'
        and public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id)
      order by g.ord, q.passage_position nulls first, q.created_at
    loop
      _pos := _pos + 1;
      insert into public.exam_questions (exam_id, question_id, position, section, marks, is_optional)
      values (_exam, _q.id, _pos,
              _s.title || case when _s.answer_any is not null then ' (answer any ' || _s.answer_any || ' of the ' || _s.question_count || ' questions)' else '' end,
              _q.marks, _s.answer_any is not null);
    end loop;
    _picked := _picked || _grps;
    _total := _total + coalesce(_s.marks_each, 0) * coalesce(_s.answer_any, _s.question_count);
  end loop;
  update public.exams set total_marks = coalesce(_p.max_marks, nullif(_total, 0)), status = 'published' where id = _exam;
  return public.start_attempt(_exam);
end;
$$;
