select q.ai_review->'source'->>'year' y, q.question_type t, count(*) n, sum(q.marks) m, count(distinct coalesce(q.passage_group,q.id::text)) qs, count(q.image_url) imgs
from questions q join subject_groups g on g.id=q.subject_group_id join exam_papers p on p.id=q.paper_id
where g.code='statistics' and p.code='me-technical-2' group by 1,2 order by 1,2;
