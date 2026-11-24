with g as (
  select q.paper_id, q.specialisation_id, q.subject_group_id, q.question_type,
         coalesce(q.passage_group, q.id::text) grp, sum(q.marks) gm,
         min(coalesce(q.ai_review->'source'->>'year','?')) yr, min(q.ai_review->>'batch') batch
  from questions q where q.stage='ME' and q.status <> 'rejected' and q.origin <> 'current_affairs'
  group by 1,2,3,4,5),
s as (
  select g.*, (select array_agg(distinct b.marks_each) from paper_blueprint_sections b
               where b.paper_id=g.paper_id and b.question_type=g.question_type
                 and (b.specialisation_id is null or b.specialisation_id=g.specialisation_id)
                 and (b.subject_group_id is null or b.subject_group_id=g.subject_group_id)) me
  from g)
select p.code, coalesce(sp.code, sg.code, '-') who, s.question_type, s.yr, s.me::text expected, s.gm, count(*) n, min(s.batch) batch
from s join exam_papers p on p.id=s.paper_id
left join specialisations sp on sp.id=s.specialisation_id left join subject_groups sg on sg.id=s.subject_group_id
where s.me is null or not (s.gm = any(s.me))
group by 1,2,3,4,5,6 order by 1,2,4
