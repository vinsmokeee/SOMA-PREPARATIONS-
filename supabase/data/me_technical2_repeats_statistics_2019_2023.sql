-- BCSE Technical Paper II (Statistics) questions that RCSC asked again in another year (2019-2023 papers, sent by the founder):
-- each question is loaded once (the later year, or the question already on Soma) and the other years are recorded
-- as appearances (founder rule: repeated questions are tracked, not loaded twice).
insert into public.question_appearances (question_id, year, note)
select q.id, v.year, v.note
from (values
  ('The mean, median and mode of the following set of observations (4, 4, 5, 7, 10) are%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Statistics), MCQ 7'),
  ('The mean, median and mode are the measures of%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Statistics), MCQ 8 (as "are part of")'),
  ('Which of the following would indicate that a dataset is NOT bell-shaped?%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Statistics), MCQ 16'),
  ('Which of the following is TRUE about the histogram shown?%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Statistics), MCQ 20 (same bimodal histogram)'),
  ('The first quartile is called%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Statistics), MCQ 27'),
  ('The second quartile is also known as%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Statistics), MCQ 28'),
  ('Which one of these statistics is unaffected by outliers?%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Statistics), MCQ 31'),
  ('If two variables share linear relationship, the graph will be a%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Statistics), MCQ 45'),
  ('The values of correlation between two variables will be%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Statistics), MCQ 46'),
  ('Suppose there is a correlation of r=0.9 between the number of hours%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Statistics), MCQ 48'),
  ('If a relationship between height and weight of a student is found to be statistically significant%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Statistics), MCQ 59'),
  ('Simpson’s Paradox occurs when%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Statistics), MCQ 60'),
  ('A 95\% confidence interval for the unknown population mean (μ), with sample mean (x̄) of 122%', 2020, 'Also asked in BCSE 2020 Technical Paper II (Statistics), MCQ 37')
) as v(stem, year, note)
join public.questions q on q.stem like v.stem and q.subject_group_id = (select id from public.subject_groups where code = 'statistics')
  and q.paper_id = (select id from public.exam_papers where code = 'me-technical-2') and q.status <> 'archived'
on conflict do nothing
returning question_id, year;

-- BCSE 2023 Paper II MCQ 23 is the same question as the Statistics Paper III (BCSE 2024) question already on Soma.
insert into public.question_appearances (question_id, year, note)
select q.id, 2023, 'Also asked in BCSE 2023 Technical Paper II (Statistics), MCQ 23'
from public.questions q
where q.stem = 'The unit for variance is' and q.paper_id = (select id from public.exam_papers where code = 'me-technical-3') and q.status <> 'archived'
on conflict do nothing
returning question_id, year;
