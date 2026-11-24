select q.ai_review->'source'->>'year' y, q.status, count(*) from questions q join subject_groups g on g.id=q.subject_group_id join exam_papers p on p.id=q.paper_id
where g.code='statistics' and p.code='me-technical-2' and q.ai_review->>'batch' like '%BCSE 20%' group by 1,2 order by 1,2;
