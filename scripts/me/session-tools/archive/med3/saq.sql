select q.ai_review->'source'->>'year' y, left(stem,140) s from questions q join subject_groups g on g.id=q.subject_group_id where g.code='medical-science' and q.question_type<>'mcq' order by 1;
