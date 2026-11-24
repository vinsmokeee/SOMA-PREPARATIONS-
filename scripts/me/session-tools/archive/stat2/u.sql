select left(q.stem,80), q.ai_review->'source'->>'year' from questions q join subject_groups g on g.id=q.subject_group_id where g.code='statistics' and q.stem ilike '%unit%variance%';
