-- Founder (21 Nov 2026): every mock follows the latest RCSC layout. Current-affairs practice questions (origin
-- 'current_affairs') are single questions written for daily practice, not in the RCSC paper format, so a mock must
-- never pick them (they could fill a 40-mark case study with a 10-mark question). They stay available for practice.
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
      and q.origin <> 'current_affairs'
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
