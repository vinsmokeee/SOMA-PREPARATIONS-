-- Personal ME practice (founder, 20 Nov 2026): every student practises the same papers with different questions.
-- * Practice gives the student a question they have not seen, preferring questions fewer other students have had.
-- * Mock papers are built for each student from the paper's pattern (blueprint), the same way.
-- * The pattern comes from the RCSC papers as they are loaded; until then no mock is offered (NULL, never guessed).

-- Paper pattern ---------------------------------------------------------------------------------------------
create table public.paper_blueprint_sections (
  id              uuid primary key default gen_random_uuid(),
  paper_id        uuid not null references public.exam_papers (id) on delete cascade,
  sort_order      int not null default 0,
  title           text not null check (length(btrim(title)) between 1 and 120),
  question_type   public.question_type not null,
  question_count  int not null check (question_count between 1 and 50),
  marks_each      numeric(6, 2) check (marks_each > 0),
  answer_any      int check (answer_any > 0),            -- "answer any N" of question_count; NULL = answer all
  source          text,                                  -- e.g. "RCSC BCSE 2025 paper"
  created_at      timestamptz not null default now(),
  check (answer_any is null or answer_any <= question_count)
);
create index on public.paper_blueprint_sections (paper_id, sort_order);
alter table public.paper_blueprint_sections enable row level security;
create policy "blueprints readable" on public.paper_blueprint_sections for select to authenticated using (true);
create policy "blueprints managed" on public.paper_blueprint_sections for all to authenticated
  using (public.has_permission('exams.manage')) with check (public.has_permission('exams.manage'));
grant select on public.paper_blueprint_sections to authenticated;
grant insert, update, delete on public.paper_blueprint_sections to authenticated;

-- Which questions to give: unseen by the caller first, then the least used by other students, then random ---------
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
    and public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id)
  order by coalesce(u.mine, false), coalesce(u.others, 0), random()
  limit greatest(_n, 0);
$$;
revoke all on function public.pick_me_questions(uuid, public.question_type, int, uuid[]) from public, anon, authenticated;

-- Practise one question of a type from a paper ----------------------------------------------------------------
create or replace function public.start_paper_practice(_paper uuid, _type public.question_type, _minutes int default null)
returns uuid
language plpgsql
volatile
security definer
set search_path = ''
as $$
declare _q uuid;
begin
  if auth.uid() is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  if not public.has_stage_access('ME') and not public.has_permission('exams.manage') then
    raise exception 'ACCESS_REQUIRED' using errcode = '42501';
  end if;
  select id into _q from public.pick_me_questions(_paper, _type, 1) as t(id);
  if _q is null then raise exception 'NO_QUESTIONS' using errcode = 'P0002'; end if;
  return public.create_written_practice(_q, _minutes);
end;
$$;
revoke all on function public.start_paper_practice(uuid, public.question_type, int) from public, anon;
grant execute on function public.start_paper_practice(uuid, public.question_type, int) to authenticated;

-- Is there enough in the bank to build a full mock of this paper for the caller? --------------------------------
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
       where n.need > (select count(*) from public.questions q
                       where q.paper_id = _paper and q.status = 'published' and q.stage = 'ME' and q.question_type = n.question_type
                         and public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id)));
$$;
revoke all on function public.paper_mock_ready(uuid) from public, anon;
grant execute on function public.paper_mock_ready(uuid) to authenticated;

-- Build a personal mock paper from the pattern and start it -----------------------------------------------------
create or replace function public.start_paper_mock(_paper uuid)
returns uuid
language plpgsql
volatile
security definer
set search_path = ''
as $$
declare
  _uid uuid := auth.uid(); _p public.exam_papers%rowtype; _exam uuid; _picked uuid[] := '{}'; _ids uuid[];
  _s record; _pos int := 0; _total numeric := 0; _q uuid;
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
    _ids := array(select public.pick_me_questions(_paper, _s.question_type, _s.question_count, _picked));
    if coalesce(array_length(_ids, 1), 0) < _s.question_count then raise exception 'NOT_ENOUGH_QUESTIONS' using errcode = 'P0002'; end if;
    foreach _q in array _ids loop
      _pos := _pos + 1;
      insert into public.exam_questions (exam_id, question_id, position, section, marks, is_optional)
      values (_exam, _q, _pos,
              _s.title || case when _s.answer_any is not null then ' (answer any ' || _s.answer_any || ')' else '' end,
              _s.marks_each, _s.answer_any is not null);
    end loop;
    _picked := _picked || _ids;
    _total := _total + coalesce(_s.marks_each, 0) * coalesce(_s.answer_any, _s.question_count);
  end loop;
  update public.exams set total_marks = coalesce(_p.max_marks, nullif(_total, 0)), status = 'published' where id = _exam;
  return public.start_attempt(_exam);
end;
$$;
revoke all on function public.start_paper_mock(uuid) from public, anon;
grant execute on function public.start_paper_mock(uuid) to authenticated;

-- Progress: a personal mock is offered when the pattern is known and the bank is big enough --------------------
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
    'mock_ready', public.paper_mock_ready(p.id),
    'pattern', (select coalesce(jsonb_agg(jsonb_build_object('title', b.title, 'type', b.question_type, 'count', b.question_count,
        'marks_each', b.marks_each, 'answer_any', b.answer_any) order by b.sort_order, b.created_at), '[]'::jsonb)
        from public.paper_blueprint_sections b where b.paper_id = p.id)
  ) order by p.paper_number), '[]'::jsonb)
  from papers p
  where auth.uid() is not null;
$$;
revoke all on function public.my_me_progress() from public, anon;
grant execute on function public.my_me_progress() to authenticated;
