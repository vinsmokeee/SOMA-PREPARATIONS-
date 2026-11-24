-- BCSE 2021 General Paper II (sent by the founder): Section D question 5 is the same question RCSC asked in BCSE 2023
-- General Paper II, which is already loaded. It is recorded here as an appearance instead of being loaded twice
-- (founder rule: repeats are tracked, not loaded twice).
insert into public.question_appearances (question_id, year, note)
select q.id, 2021, 'Also asked in BCSE 2021 General Paper II, Section D question 5'
from public.questions q
where q.stem like 'The three main branches of government provided for by the Constitution of the Kingdom of Bhutan are:%'
  and q.paper_id = (select id from public.exam_papers where code = 'me-general-2') and q.status <> 'archived'
on conflict do nothing
returning question_id, year;
