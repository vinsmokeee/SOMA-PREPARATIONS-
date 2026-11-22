-- BCSE 2024 Technical Paper III questions that RCSC repeated word for word in 2025 (already loaded from the 2025 papers):
-- record 2024 on the 2025 questions instead of loading them twice (founder rule: repeated questions are tracked).
insert into public.question_appearances (question_id, year, note)
select q.id, 2024, v.note
from (values
  ('Which of the following is a common error source that RTK surveying must correct for?', 'survey-engineering', 'Also asked in BCSE 2024 Technical Paper III (Survey Engineering), MCQ 4'),
  ('What is the main cause of systematic errors in surveying?', 'survey-engineering', 'Also asked in BCSE 2024 Technical Paper III (Survey Engineering), MCQ 19'),
  ('In which portion of the electromagnetic spectrum do GPS signals operate?', 'survey-engineering', 'Also asked in BCSE 2024 Technical Paper III (Survey Engineering), MCQ 7 (options differed slightly)'),
  ('The Nyquist sampling rate is given by:', 'electrical-engineering-2025', 'Also asked in BCSE 2024 Technical Paper III (Electrical Engineering), MCQ 4'),
  ('A voltmeter is connected in a %', 'electrical-engineering-2025', 'Also asked in BCSE 2024 Technical Paper III (Electrical Engineering), MCQ 13')
) as v(stem, spec, note)
join public.questions q on q.stem like v.stem and q.specialisation_id = (select id from public.specialisations where code = v.spec)
  and q.question_type = 'mcq' and q.origin = 'historical_official'
union all
select q.id, 2024, 'Also asked in BCSE 2024 Technical Paper III (Survey Engineering), Case 1 (Gelephu Mindfulness City topographic survey)'
from public.questions q where q.passage_group = 'me-technical-3-survey2025-case3'
on conflict do nothing
returning question_id, year;
