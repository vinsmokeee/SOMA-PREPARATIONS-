-- Founder (20 Nov 2026) publishes drafts one by one. A passage / case study is split into several questions sharing
-- passage_group; a mock must never show a passage with some of its questions missing. So a group counts for mocks
-- only when none of its questions is still waiting (draft, awaiting review, revision requested, verified).
-- Rejected and archived questions do not block. Practice (one question at a time) is unchanged.

create or replace function public.me_group_complete(_grp text)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select not exists (
    select 1 from public.questions q
    where q.passage_group = _grp
      and q.status in ('draft', 'ai_generated', 'awaiting_review', 'revision_requested', 'verified'));
$$;
revoke all on function public.me_group_complete(text) from public, anon;

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
    where auth.uid() is not null and q.paper_id = _paper and q.status = 'published' and q.stage = 'ME'
      and q.question_type = _type
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
  select exists (select 1 from public.paper_blueprint_sections where paper_id = _paper)
     and not exists (
       select 1 from (
         select b.question_type, sum(b.question_count) as need from public.paper_blueprint_sections b where b.paper_id = _paper group by b.question_type) n
       where n.need > (select count(distinct public.me_group_key(q)) from public.questions q
                       where q.paper_id = _paper and q.status = 'published' and q.stage = 'ME' and q.question_type = n.question_type
                         and public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id)
                         and (q.passage_group is null or public.me_group_complete(q.passage_group))));
$$;
