select q.ai_review->>'batch' b, q.status, left(q.stem,60) from questions q where q.stem in ('The material used in solar cells contains:','Which of the following is NOT an operating system?');
