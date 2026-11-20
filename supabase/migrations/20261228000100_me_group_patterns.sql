-- Technical Paper II (and later B.Ed. Paper II, Technical Paper III) is ONE paper sat by several subject groups,
-- each with its own RCSC pattern and timing (BCSE 2025: most groups 70 MCQ + short answers in 90 min; Nursing
-- 50 + 25 + 25 MCQ in 150 min; Traditional Medicine in Dzongkha). So a pattern section and the paper timing can now
-- belong to a subject group; students get their group's pattern, everyone else the shared one (subject_group_id
-- NULL). A section can also be limited to one topic (topic_slug), e.g. Nursing's three MCQ sections. Sections may
-- hold up to 200 questions (Paper II has 70 MCQs).

alter table public.paper_blueprint_sections
  add column subject_group_id uuid references public.subject_groups (id) on delete cascade,
  add column topic_slug text;
alter table public.paper_blueprint_sections drop constraint if exists paper_blueprint_sections_question_count_check;
alter table public.paper_blueprint_sections add constraint paper_blueprint_sections_question_count_check check (question_count between 1 and 200);
create index on public.paper_blueprint_sections (paper_id, subject_group_id, sort_order);

create table public.paper_group_settings (
  paper_id          uuid not null references public.exam_papers (id) on delete cascade,
  subject_group_id  uuid not null references public.subject_groups (id) on delete cascade,
  duration_minutes  int check (duration_minutes > 0),
  reading_minutes   int check (reading_minutes >= 0),
  max_marks         numeric(6, 2) check (max_marks > 0),
  source            text,
  created_at        timestamptz not null default now(),
  primary key (paper_id, subject_group_id)
);
alter table public.paper_group_settings enable row level security;
create policy "group settings readable" on public.paper_group_settings for select to authenticated using (true);
create policy "group settings managed" on public.paper_group_settings for all to authenticated
  using (public.has_permission('exams.manage')) with check (public.has_permission('exams.manage'));
grant select on public.paper_group_settings to authenticated;
grant insert, update, delete on public.paper_group_settings to authenticated;

-- Whole-paper check: does this paper belong to the caller's entry? entry_fits(stage, paper, NULL, NULL, NULL) cannot
-- answer this for Technical II/III (it reads NULL tags as "untagged question" and refuses), so mocks never started
-- there. entry_fits stays as it is for questions: untagged questions in a scoped paper stay hidden.
create or replace function public.paper_fits_me(_paper uuid)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select public.has_permission('exams.manage') or exists (
    select 1
    from public.profiles pr
    left join public.specialisations sp on sp.id = pr.specialisation_id
    join public.exam_papers p on p.id = _paper and p.stage = 'ME'
    join public.exam_paper_categories pc on pc.paper_id = p.id and pc.category_id = pr.entry_category_id
    where pr.id = auth.uid()
      and (p.bank_scope is distinct from 'specialisation' or pr.specialisation_id is not null)
      and (p.bank_scope is distinct from 'subject_group' or coalesce(pr.subject_group_id, sp.subject_group_id) is not null or pr.specialisation_id is not null));
$$;
revoke all on function public.paper_fits_me(uuid) from public, anon;

-- The caller's subject group (chosen on the profile, or the one of their specialisation)
create or replace function public.my_subject_group()
returns uuid
language sql
stable
security definer
set search_path = ''
as $$
  select coalesce(p.subject_group_id, sp.subject_group_id)
  from public.profiles p left join public.specialisations sp on sp.id = p.specialisation_id
  where p.id = auth.uid();
$$;

-- The pattern sections that apply to the caller: their group's if it has any, otherwise the shared ones
create or replace function public.paper_sections_for_me(_paper uuid)
returns setof public.paper_blueprint_sections
language sql
stable
security definer
set search_path = ''
as $$
  select b.* from public.paper_blueprint_sections b
  where b.paper_id = _paper
    and b.subject_group_id is not distinct from (
      case when exists (select 1 from public.paper_blueprint_sections x
                        where x.paper_id = _paper and x.subject_group_id = public.my_subject_group())
           then public.my_subject_group() end)
  order by b.sort_order, b.created_at;
$$;

drop function public.pick_me_groups(uuid, public.question_type, int, text[]);
create or replace function public.pick_me_groups(_paper uuid, _type public.question_type, _n int, _exclude text[] default '{}', _topic text default null)
returns setof text
language sql
volatile
security definer
set search_path = ''
as $$
  with candidates as (
    select public.me_group_key(q) as grp, q.id
    from public.questions q
    where auth.uid() is not null and q.paper_id = _paper and q.status = 'published' and q.stage = 'ME'
      and q.question_type = _type
      and (_topic is null or q.topic_id in (select t.id from public.topics t where t.slug = _topic))
      and public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id)
      and (q.passage_group is null or public.me_group_complete(q.passage_group))
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

create or replace function public.paper_mock_ready(_paper uuid)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (select 1 from public.paper_sections_for_me(_paper))
     and not exists (
       select 1 from (
         select b.question_type, b.topic_slug, sum(b.question_count) as need
         from public.paper_sections_for_me(_paper) b group by b.question_type, b.topic_slug) n
       where n.need > (select count(distinct public.me_group_key(q)) from public.questions q
                       where q.paper_id = _paper and q.status = 'published' and q.stage = 'ME' and q.question_type = n.question_type
                         and (n.topic_slug is null or q.topic_id in (select t.id from public.topics t where t.slug = n.topic_slug))
                         and public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id)
                         and (q.passage_group is null or public.me_group_complete(q.passage_group))));
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
  _dur int; _read int; _max numeric;
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  if not public.has_stage_access('ME') and not public.has_permission('exams.manage') then
    raise exception 'ACCESS_REQUIRED' using errcode = '42501';
  end if;
  select * into _p from public.exam_papers where id = _paper and stage = 'ME';
  if _p.id is null or not public.paper_fits_me(_p.id) then raise exception 'QUESTION_NOT_FOUND' using errcode = 'P0002'; end if;
  if not exists (select 1 from public.paper_sections_for_me(_paper)) then
    raise exception 'NO_PATTERN' using errcode = 'P0002';
  end if;
  if (select count(*) from public.exams where owner_id = _uid and created_at > now() - interval '1 day') >= 40 then
    raise exception 'RATE_LIMIT' using errcode = 'P0001';
  end if;
  select coalesce(g.duration_minutes, _p.duration_minutes), coalesce(g.reading_minutes, _p.reading_minutes), coalesce(g.max_marks, _p.max_marks)
    into _dur, _read, _max
  from (select 1) x left join public.paper_group_settings g on g.paper_id = _paper and g.subject_group_id = public.my_subject_group();
  insert into public.exams (slug, title, description, stage, kind, paper_id, duration_minutes, total_marks, is_free, status, owner_id, untimed)
  values ('mock-' || replace(gen_random_uuid()::text, '-', ''), 'Paper ' || coalesce(_p.paper_number::text, '') || ' mock: ' || _p.title,
          'A mock paper built for you in the RCSC pattern.', 'ME', 'mock', _p.id,
          coalesce(_dur + coalesce(_read, 0), 600), _max, false, 'draft', _uid, _dur is null)
  returning id into _exam;
  for _s in select * from public.paper_sections_for_me(_paper) loop
    _grps := array(select public.pick_me_groups(_paper, _s.question_type, _s.question_count, _picked, _s.topic_slug));
    if coalesce(array_length(_grps, 1), 0) < _s.question_count then raise exception 'NOT_ENOUGH_QUESTIONS' using errcode = 'P0002'; end if;
    _n := 0;
    for _q in
      select q.id, q.marks, g.ord, g.grp
      from unnest(_grps) with ordinality as g(grp, ord)
      join public.questions q on public.me_group_key(q) = g.grp
      where q.paper_id = _paper
        and (_s.topic_slug is null or q.topic_id in (select t.id from public.topics t where t.slug = _s.topic_slug)) and q.status = 'published' and q.stage = 'ME'
        and public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id)
      order by g.ord, q.passage_position nulls first, q.created_at
    loop
      _pos := _pos + 1;
      insert into public.exam_questions (exam_id, question_id, position, section, marks, is_optional, choice_group, choose_any, section_order)
      values (_exam, _q.id, _pos,
              _s.title || case when _s.answer_any is not null then ' (answer any ' || _s.answer_any || ' of the ' || _s.question_count || ' questions)' else '' end,
              _q.marks, _s.answer_any is not null, _q.grp, _s.answer_any, _s.sort_order);
    end loop;
    _picked := _picked || _grps;
    _total := _total + coalesce(_s.marks_each, 0) * coalesce(_s.answer_any, _s.question_count);
  end loop;
  update public.exams set total_marks = coalesce(_max, nullif(_total, 0)), status = 'published',
    reading_minutes = case when _dur is not null then _read end where id = _exam;
  return public.start_attempt(_exam);
end;
$$;

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
