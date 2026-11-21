-- Repeated questions (founder, 21 Nov 2026): when RCSC asks the same (or nearly the same) question in more than one
-- year, it is kept once and every year it was asked is recorded here. Repeats are shown to students as a label,
-- weigh more when personal mocks pick questions, and are listed for the founder in admin.
create table public.question_appearances (
  question_id uuid not null references public.questions (id) on delete cascade,
  year        int  not null check (year between 1990 and 2100),
  note        text check (note is null or length(note) <= 200),   -- e.g. "worded slightly differently"
  created_at  timestamptz not null default now(),
  primary key (question_id, year)
);
alter table public.question_appearances enable row level security;
-- Only years and question ids: safe for signed-in users to read (question content stays protected).
create policy question_appearances_read on public.question_appearances for select to authenticated using (true);
create policy question_appearances_write on public.question_appearances for all to authenticated
  using (public.has_permission('questions.create')) with check (public.has_permission('questions.create'));

-- Every past-paper question already loaded appeared at least in its own year.
insert into public.question_appearances (question_id, year)
select q.id, (q.ai_review -> 'source' ->> 'year')::int
from public.questions q
where q.origin = 'historical_official' and (q.ai_review -> 'source' ->> 'year') ~ '^\d{4}$'
on conflict do nothing;

-- Years each question of an attempt was asked by RCSC (only for the attempt's owner).
create or replace function public.attempt_repeat_years(_attempt_id uuid)
returns table (exam_question_id uuid, years int[])
language sql
stable
security definer
set search_path = ''
as $$
  select eq.id, array_agg(qa.year order by qa.year)
  from public.exam_attempts a
  join public.exam_questions eq on eq.exam_id = a.exam_id
  join public.question_appearances qa on qa.question_id = eq.question_id
  where a.id = _attempt_id and a.user_id = auth.uid()
  group by eq.id;
$$;
revoke all on function public.attempt_repeat_years(uuid) from public, anon;
grant execute on function public.attempt_repeat_years(uuid) to authenticated;

-- Founder's list: questions asked in two or more years, most repeated first.
create or replace function public.repeated_questions(_limit int default 200)
returns table (question_id uuid, stage text, paper text, specialisation text, subject_group text, stem text, status text, years int[])
language plpgsql
stable
security definer
set search_path = ''
as $$
begin
  if not public.has_permission('questions.review') then
    raise exception 'Missing permission questions.review' using errcode = '42501';
  end if;
  return query
  select q.id, q.stage::text, p.title, sp.name, sg.name, left(q.stem, 300), q.status::text, r.years
  from (select qa.question_id, array_agg(qa.year order by qa.year) as years from public.question_appearances qa
        group by qa.question_id having count(*) >= 2) r
  join public.questions q on q.id = r.question_id
  left join public.exam_papers p on p.id = q.paper_id
  left join public.specialisations sp on sp.id = q.specialisation_id
  left join public.subject_groups sg on sg.id = q.subject_group_id
  order by array_length(r.years, 1) desc, q.created_at
  limit greatest(least(coalesce(_limit, 200), 1000), 1);
end;
$$;
revoke all on function public.repeated_questions(int) from public, anon;
grant execute on function public.repeated_questions(int) to authenticated;

-- Personal mocks: unseen first, then spread across students; questions RCSC repeated over the years come up more often.
create or replace function public.pick_me_groups(_paper uuid, _type public.question_type, _n int, _exclude text[] default '{}', _topic text default null)
returns setof text
language sql
volatile
security definer
set search_path = ''
as $$
  with candidates as (
    select public.me_group_key(q) as grp, q.id,
           (select count(*) from public.question_appearances qa where qa.question_id = q.id) as asked
    from public.questions q
    where auth.uid() is not null and q.paper_id = _paper and q.status = 'published' and q.stage = 'ME'
      and q.question_type = _type
      and (_topic is null or q.topic_id in (select t.id from public.topics t where t.slug = _topic))
      and public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id)
      and (q.passage_group is null or public.me_group_complete(q.passage_group))
  ), use as (
    select c.grp,
           count(distinct a.user_id) filter (where a.user_id <> auth.uid()) as others,
           coalesce(bool_or(a.user_id = auth.uid()), false) as mine,
           greatest(max(c.asked), 1) as asked
    from candidates c
    left join public.exam_questions eq on eq.question_id = c.id
    left join public.exam_attempts a on a.exam_id = eq.exam_id
    group by c.grp
  )
  select grp from use
  where not (grp = any (coalesce(_exclude, '{}')))
  order by mine, (others + random()) / asked  -- asked in more years = more likely
  limit greatest(_n, 0);
$$;

