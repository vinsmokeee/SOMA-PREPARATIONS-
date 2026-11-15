-- =============================================================================
-- Soma Preparations — Migration 0014: Practice sets and learning analytics
-- (Milestone 4)
--
--  * Personal practice sets: an examination row owned by one student
--    (exams.owner_id), built from published questions by create_practice_set().
--    They are private to their owner and never listed in the catalogue.
--  * practice_options(): what a student can practise, with question counts,
--    respecting premium access (free accounts practise free-sample questions).
--  * my_performance(): the signed-in student's own analytics (totals, subject
--    and topic accuracy, trend, coverage, pending mistakes).
-- =============================================================================

alter table public.exams
  add column owner_id uuid references auth.users (id) on delete cascade;
create index exams_owner_idx on public.exams (owner_id, created_at desc) where owner_id is not null;

drop policy exams_public on public.exams;
create policy exams_public on public.exams for select to anon, authenticated
  using ((status = 'published' and owner_id is null) or owner_id = auth.uid() or public.has_permission('exams.manage'));

-- -----------------------------------------------------------------------------
-- start_attempt: personal practice sets can only be started by their owner.
-- -----------------------------------------------------------------------------
create or replace function public.start_attempt(_exam_id uuid)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  _uid uuid := auth.uid();
  _exam public.exams%rowtype;
  _staff boolean;
  _open uuid;
  _order uuid[];
  _id uuid;
begin
  if _uid is null then
    raise exception 'NOT_SIGNED_IN' using errcode = '42501';
  end if;
  select * into _exam from public.exams where id = _exam_id;
  _staff := public.has_permission('exams.manage');
  if _exam.id is null or (_exam.status <> 'published' and not _staff)
     or (_exam.owner_id is not null and _exam.owner_id <> _uid) then
    raise exception 'EXAM_NOT_FOUND' using errcode = 'P0002';
  end if;
  if not _exam.is_free and not _staff and not public.has_stage_access(_exam.stage) then
    raise exception 'ACCESS_REQUIRED' using errcode = '42501';
  end if;

  select id into _open from public.exam_attempts
  where exam_id = _exam_id and user_id = _uid and status = 'in_progress';
  if _open is not null then
    if not public.close_if_expired(_open) then
      return _open;
    end if;
  end if;

  select array_agg(x.id order by x.k1, x.k2) into _order
  from (
    select eq.id,
           case when _exam.shuffle_questions then random() else 0 end as k1,
           eq.position as k2
    from public.exam_questions eq
    join public.questions q on q.id = eq.question_id
    where eq.exam_id = _exam_id and (q.status = 'published' or _staff)
  ) x;
  if _order is null then
    raise exception 'EXAM_EMPTY' using errcode = 'P0001';
  end if;

  begin
    insert into public.exam_attempts (exam_id, user_id, deadline_at, question_order)
    values (_exam_id, _uid, now() + make_interval(mins => _exam.duration_minutes), _order)
    returning id into _id;
  exception when unique_violation then
    select id into _id from public.exam_attempts
    where exam_id = _exam_id and user_id = _uid and status = 'in_progress';
  end;
  return _id;
end;
$$;

-- Catalogue excludes personal practice sets.
create or replace function public.exam_catalogue(_stage public.exam_stage default null)
returns table (
  id uuid, slug text, title text, description text, instructions text,
  stage public.exam_stage, kind public.exam_kind, duration_minutes int, is_free boolean,
  omr_mode boolean, negative_mark_per_wrong numeric, question_count int, total_marks numeric,
  has_access boolean, cycle_name text, paper_title text, category_name text,
  open_attempt_id uuid, open_deadline_at timestamptz, completed_attempts int,
  exam_year int, attribution text
)
language sql
stable
security definer
set search_path = ''
as $$
  select e.id, e.slug, e.title, e.description, e.instructions, e.stage, e.kind,
         e.duration_minutes, e.is_free, e.omr_mode, e.negative_mark_per_wrong,
         (select count(*)::int from public.exam_questions eq
            join public.questions q on q.id = eq.question_id
            where eq.exam_id = e.id and q.status = 'published'),
         coalesce(e.total_marks, (select sum(coalesce(eq.marks, q.marks)) from public.exam_questions eq
            join public.questions q on q.id = eq.question_id
            where eq.exam_id = e.id and q.status = 'published')),
         (e.is_free or (auth.uid() is not null and public.has_stage_access(e.stage))),
         c.name, p.title, cat.name,
         oa.id, oa.deadline_at,
         (select count(*)::int from public.exam_attempts a
            where a.exam_id = e.id and a.user_id = auth.uid() and a.status <> 'in_progress'),
         hp.exam_year,
         hp.attribution_text
  from public.exams e
  left join public.exam_cycles c on c.id = e.cycle_id
  left join public.exam_papers p on p.id = e.paper_id
  left join public.exam_categories cat on cat.id = e.category_id
  left join public.historical_papers hp on hp.id = e.historical_paper_id
  left join lateral (
    select a.id, a.deadline_at from public.exam_attempts a
    where a.exam_id = e.id and a.user_id = auth.uid() and a.status = 'in_progress'
    limit 1
  ) oa on true
  where e.status = 'published' and e.owner_id is null and (_stage is null or e.stage = _stage)
  order by e.stage, case e.kind when 'sample' then 0 when 'mock' then 1 when 'historical' then 2 else 3 end,
           hp.exam_year desc nulls last, e.title;
$$;

-- -----------------------------------------------------------------------------
-- Helpers: the caller's latest answer per question (submitted attempts only)
-- -----------------------------------------------------------------------------
create or replace function public.my_latest_answers()
returns table (question_id uuid, is_correct boolean, answered_at timestamptz)
language sql
stable
security definer
set search_path = ''
as $$
  select distinct on (eq.question_id) eq.question_id, aa.is_correct, a.submitted_at
  from public.attempt_answers aa
  join public.exam_attempts a on a.id = aa.attempt_id
  join public.exam_questions eq on eq.id = aa.exam_question_id
  where a.user_id = auth.uid() and a.status in ('submitted', 'auto_submitted')
    and aa.selected_option_id is not null
  order by eq.question_id, a.submitted_at desc;
$$;
revoke execute on function public.my_latest_answers() from public, anon;
grant execute on function public.my_latest_answers() to authenticated;

-- Questions a student may practise: published objective questions; free
-- accounts are limited to questions marked as free samples.
create or replace function public.practice_pool(_stage public.exam_stage)
returns setof uuid
language sql
stable
security definer
set search_path = ''
as $$
  select q.id from public.questions q
  where q.status = 'published' and q.question_type = 'mcq' and q.stage = _stage
    and (q.is_free_sample or public.has_stage_access(_stage) or public.has_permission('exams.manage'));
$$;
revoke execute on function public.practice_pool(public.exam_stage) from public, anon, authenticated;

-- -----------------------------------------------------------------------------
-- practice_options: subjects/topics with available question counts
-- -----------------------------------------------------------------------------
create or replace function public.practice_options(_stage public.exam_stage)
returns jsonb
language plpgsql
stable
security definer
set search_path = ''
as $$
begin
  if auth.uid() is null then
    raise exception 'NOT_SIGNED_IN' using errcode = '42501';
  end if;
  return jsonb_build_object(
    'full_access', public.has_stage_access(_stage) or public.has_permission('exams.manage'),
    'total', (select count(*) from public.practice_pool(_stage)),
    'mistakes', (select count(*) from public.my_latest_answers() la
                 where la.is_correct is false and la.question_id in (select public.practice_pool(_stage))),
    'subjects', coalesce((
      select jsonb_agg(jsonb_build_object(
        'id', s.id, 'name', s.name, 'available', s.n,
        'topics', coalesce((
          select jsonb_agg(jsonb_build_object('id', t.id, 'name', t.name, 'available', t.n) order by t.sort_order, t.name)
          from (
            select tp.id, tp.name, tp.sort_order, count(*) as n
            from public.topics tp join public.questions q on q.topic_id = tp.id
            where tp.subject_id = s.id and q.id in (select public.practice_pool(_stage))
            group by tp.id, tp.name, tp.sort_order
          ) t), '[]'::jsonb)
      ) order by s.sort_order)
      from (
        select sb.id, sb.name, sb.sort_order, count(*) as n
        from public.subjects sb join public.questions q on q.subject_id = sb.id
        where sb.stage = _stage and q.id in (select public.practice_pool(_stage))
        group by sb.id, sb.name, sb.sort_order
      ) s), '[]'::jsonb)
  );
end;
$$;
revoke execute on function public.practice_options(public.exam_stage) from public, anon;
grant execute on function public.practice_options(public.exam_stage) to authenticated;

-- -----------------------------------------------------------------------------
-- create_practice_set: builds a personal practice set and starts it
-- -----------------------------------------------------------------------------
create or replace function public.create_practice_set(
  _stage public.exam_stage,
  _subject_id uuid default null,
  _topic_id uuid default null,
  _difficulty public.difficulty_level default null,
  _count int default 10,
  _minutes int default null,
  _mode text default 'mixed'
)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  _uid uuid := auth.uid();
  _n int := least(greatest(coalesce(_count, 10), 5), 50);
  _ids uuid[];
  _exam uuid;
  _title text;
  _label text;
begin
  if _uid is null then
    raise exception 'NOT_SIGNED_IN' using errcode = '42501';
  end if;
  if _mode not in ('mixed', 'new', 'mistakes') then
    raise exception 'INVALID_MODE' using errcode = 'P0001';
  end if;
  if (select count(*) from public.exams where owner_id = _uid and created_at > now() - interval '1 day') >= 40 then
    raise exception 'RATE_LIMIT' using errcode = 'P0001';
  end if;

  with seen as (select * from public.my_latest_answers())
  select array_agg(c.id) into _ids from (
    select q.id
    from public.questions q
    left join seen on seen.question_id = q.id
    where q.id in (select public.practice_pool(_stage))
      and (_subject_id is null or q.subject_id = _subject_id)
      and (_topic_id is null or q.topic_id = _topic_id)
      and (_difficulty is null or q.difficulty = _difficulty)
      and (_mode <> 'mistakes' or seen.is_correct is false)
      and (_mode <> 'new' or seen.question_id is null)
    order by
      case when seen.question_id is null then 0 when seen.is_correct is false then 1 else 2 end,
      random()
    limit _n
  ) c;

  if _ids is null then
    raise exception 'NO_QUESTIONS' using errcode = 'P0001';
  end if;

  select coalesce((select name from public.topics where id = _topic_id),
                  (select name from public.subjects where id = _subject_id),
                  'Mixed ' || _stage::text || ' practice') into _label;
  _title := case _mode when 'mistakes' then 'Review my mistakes: ' || _label else 'Practice: ' || _label end;

  insert into public.exams (slug, title, description, stage, kind, duration_minutes, is_free, omr_mode, status, owner_id)
  values ('practice-' || replace(gen_random_uuid()::text, '-', ''), _title,
          array_length(_ids, 1) || ' questions chosen for you.', _stage, 'practice',
          least(greatest(coalesce(_minutes, array_length(_ids, 1)), 5), 180),
          true, false, 'draft', _uid)
  returning id into _exam;

  insert into public.exam_questions (exam_id, question_id, position)
  select _exam, x.id, x.n from unnest(_ids) with ordinality as x(id, n);

  update public.exams set status = 'published' where id = _exam;
  return public.start_attempt(_exam);
end;
$$;
revoke execute on function public.create_practice_set(public.exam_stage, uuid, uuid, public.difficulty_level, int, int, text) from public, anon;
grant execute on function public.create_practice_set(public.exam_stage, uuid, uuid, public.difficulty_level, int, int, text) to authenticated;

-- -----------------------------------------------------------------------------
-- my_performance: the caller's own learning analytics
-- -----------------------------------------------------------------------------
create or replace function public.my_performance(_stage public.exam_stage default null)
returns jsonb
language plpgsql
stable
security definer
set search_path = ''
as $$
declare _uid uuid := auth.uid();
begin
  if _uid is null then
    raise exception 'NOT_SIGNED_IN' using errcode = '42501';
  end if;
  return (
    with ans as (
      select aa.id, aa.is_correct, aa.selected_option_id, aa.text_answer, aa.time_spent_seconds,
             q.id as question_id, q.question_type, q.stage, q.subject_id, q.topic_id,
             a.id as attempt_id, a.submitted_at
      from public.attempt_answers aa
      join public.exam_attempts a on a.id = aa.attempt_id
      join public.exam_questions eq on eq.id = aa.exam_question_id
      join public.questions q on q.id = eq.question_id
      where a.user_id = _uid and a.status in ('submitted', 'auto_submitted')
        and (_stage is null or q.stage = _stage)
    ),
    mcq as (select * from ans where question_type = 'mcq' and selected_option_id is not null)
    select jsonb_build_object(
      'totals', jsonb_build_object(
        'attempts', (select count(distinct a.id) from public.exam_attempts a join public.exams e on e.id = a.exam_id
                      where a.user_id = _uid and a.status in ('submitted', 'auto_submitted') and (_stage is null or e.stage = _stage)),
        'answered', (select count(*) from mcq),
        'correct', (select count(*) from mcq where is_correct),
        'time_seconds', (select coalesce(sum(time_spent_seconds), 0) from ans),
        'written_answers', (select count(*) from ans where question_type <> 'mcq' and coalesce(btrim(text_answer), '') <> ''),
        'distinct_questions', (select count(distinct question_id) from mcq)
      ),
      'by_subject', coalesce((
        select jsonb_agg(row_to_json(x) order by x.stage, x.sort_order) from (
          select s.id, s.name, s.stage, s.sort_order,
                 count(m.id) as answered,
                 count(m.id) filter (where m.is_correct) as correct,
                 round(avg(m.time_spent_seconds))::int as avg_seconds,
                 max(m.submitted_at) as last_at
          from mcq m join public.subjects s on s.id = m.subject_id
          group by s.id, s.name, s.stage, s.sort_order
        ) x), '[]'::jsonb),
      'by_topic', coalesce((
        select jsonb_agg(row_to_json(x) order by x.subject, x.name) from (
          select t.id, t.name, s.id as subject_id, s.name as subject, s.stage,
                 count(m.id) as answered,
                 count(m.id) filter (where m.is_correct) as correct
          from mcq m join public.topics t on t.id = m.topic_id join public.subjects s on s.id = t.subject_id
          group by t.id, t.name, s.id, s.name, s.stage
        ) x), '[]'::jsonb),
      'trend', coalesce((
        select jsonb_agg(row_to_json(x) order by x.submitted_at) from (
          select a.id, e.title, e.kind, e.stage, a.submitted_at,
                 count(m.id) as answered,
                 count(m.id) filter (where m.is_correct) as correct
          from public.exam_attempts a
          join public.exams e on e.id = a.exam_id
          join mcq m on m.attempt_id = a.id
          where a.user_id = _uid
          group by a.id, e.title, e.kind, e.stage, a.submitted_at
          order by a.submitted_at desc
          limit 30
        ) x), '[]'::jsonb),
      'coverage', coalesce((
        select jsonb_agg(row_to_json(x)) from (
          select s.stage,
                 count(*) filter (where exists (select 1 from mcq m where m.subject_id = s.id)) as practised,
                 count(*) as total
          from public.subjects s
          where s.is_active and (_stage is null or s.stage = _stage)
            and exists (select 1 from public.questions q where q.subject_id = s.id and q.status = 'published')
          group by s.stage
        ) x), '[]'::jsonb),
      'mistakes', (select count(*) from public.my_latest_answers() la
                   join public.questions q on q.id = la.question_id
                   where la.is_correct is false and q.status = 'published' and (_stage is null or q.stage = _stage))
    )
  );
end;
$$;
revoke execute on function public.my_performance(public.exam_stage) from public, anon;
grant execute on function public.my_performance(public.exam_stage) to authenticated;
