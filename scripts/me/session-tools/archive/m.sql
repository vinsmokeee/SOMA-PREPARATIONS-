with sec as (
  select b.paper_id, b.specialisation_id, b.subject_group_id, b.question_type, b.topic_slug, sum(b.question_count) need
  from paper_blueprint_sections b join exam_papers p on p.id = b.paper_id where p.stage = 'ME'
  group by 1,2,3,4,5
), bank as (
  select s.*, (
    select count(distinct coalesce(q.passage_group, q.id::text)) from questions q
    left join specialisations qs on qs.id = q.specialisation_id
    where q.paper_id = s.paper_id and q.status = 'published' and q.stage = 'ME' and q.question_type = s.question_type
      and q.origin <> 'current_affairs'
      and (s.topic_slug is null or q.topic_id in (select t.id from topics t where t.slug = s.topic_slug))
      and (s.specialisation_id is null or q.specialisation_id = s.specialisation_id)
      and (s.subject_group_id is null or coalesce(q.subject_group_id, qs.subject_group_id) = s.subject_group_id)
  ) have
  from sec s
)
select p.code paper, coalesce(sp.name, g.code, 'all') who, min(floor(have::numeric / need))::int mocks,
       string_agg(question_type || ' ' || have || '/' || need, ', ' order by question_type) detail
from bank b join exam_papers p on p.id = b.paper_id left join specialisations sp on sp.id = b.specialisation_id left join subject_groups g on g.id = b.subject_group_id
group by 1,2 order by 1,2
