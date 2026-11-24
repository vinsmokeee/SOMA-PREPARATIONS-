select q.status, q.question_type, count(*) parts, count(distinct coalesce(q.passage_group,q.id::text)) qs
from questions q join subject_groups g on g.id=q.subject_group_id join exam_papers p on p.id=q.paper_id
where g.code='engineering' and p.code='me-technical-2' group by 1,2 order by 1,2;
