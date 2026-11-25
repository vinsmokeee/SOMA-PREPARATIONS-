select p.code, q.specialisation_id::text spec, q.subject_group_id::text grp, q.question_type::text t, tp.slug topic,
  count(distinct coalesce(q.passage_group, q.id::text)) filter (where q.status='published' and (q.passage_group is null or public.me_group_complete(q.passage_group))) pub,
  count(distinct coalesce(q.passage_group, q.id::text)) filter (where q.status <> 'archived') allq
from public.questions q join public.exam_papers p on p.id=q.paper_id left join public.topics tp on tp.id=q.topic_id
where q.stage='ME' and q.origin <> 'current_affairs'
group by 1,2,3,4,5;
