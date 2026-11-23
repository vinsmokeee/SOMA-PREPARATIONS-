-- BCSE Technical Paper II (Engineering) questions from the 2010-2016 papers (sent by the founder) that RCSC asked again
-- in another year: each is loaded once and the other year is recorded as an appearance (founder rule: repeats are
-- tracked, not loaded twice).
insert into public.question_appearances (question_id, year, note)
select q.id, v.year, v.note
from (values
  ('A program that runs in the background on your computer, sending information about your browsing habits%', 2013, 'Also asked in BCSE 2013 Technical Paper II (Engineering), MCQ 65'),
  ('Glass is a', 2010, 'Also asked in BCSE 2010 Technical Paper II (Engineering), MCQ 34'),
  ('A catalyst increases the rate of reaction because it', 2010, 'Also asked in BCSE 2010 Technical Paper II (Engineering), MCQ 35')
) as v(stem, year, note)
join public.questions q on q.stem like v.stem and q.subject_group_id = (select id from public.subject_groups where code = 'engineering')
  and q.paper_id = (select id from public.exam_papers where code = 'me-technical-2') and q.status <> 'archived'
on conflict do nothing
returning question_id, year;
