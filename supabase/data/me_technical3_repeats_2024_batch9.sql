-- BCSE 2024 Technical Paper III questions that RCSC asked again in 2025 (already loaded from the 2025 papers):
-- record 2024 on the 2025 questions instead of loading them twice (founder rule: repeated questions are tracked).
insert into public.question_appearances (question_id, year, note)
select q.id, 2024, v.note
from (values
  ('The agency mandated to formulate policies related to housing%', 'urban-planning', 'Also asked in BCSE 2024 Technical Paper III (Urban Planning), MCQ 1'),
  ('The formula for calculating the Indicative Contribution Ratio%', 'urban-planning', 'Also asked in BCSE 2024 Technical Paper III (Urban Planning), MCQ 2'),
  ('As per the Bhutan Building Regulation 2018, the maximum allowable floor in rural areas%', 'urban-planning', 'Also asked in BCSE 2024 Technical Paper III (Urban Planning), MCQ 4 (worded without the regulation name)'),
  ('Buffers of water courses, natural drainage and other sensitive areas%', 'urban-planning', 'Also asked in BCSE 2024 Technical Paper III (Urban Planning), MCQ 9'),
  ('As per the Spatial Planning Standards 2017 of Bhutan, the population density 80-300%', 'urban-planning', 'Also asked in BCSE 2024 Technical Paper III (Urban Planning), MCQ 10'),
  ('The formula to calculate FAR is:%', 'urban-planning', 'Also asked in BCSE 2024 Technical Paper III (Urban Planning), MCQ 14'),
  ('Under the Spatial Planning Framework, the tiers of spatial plans%', 'urban-planning', 'Also asked in BCSE 2024 Technical Paper III (Urban Planning), MCQ 15 (worded slightly differently)'),
  ('In Bhutan, the maximum limit of land pooling%', 'urban-planning', 'Also asked in BCSE 2024 Technical Paper III (Urban Planning), MCQ 20 (worded slightly differently)'),
  ('For the National Land Use Plan for Bhutan, for an urban area%', 'urban-planning', 'Also asked in BCSE 2024 Technical Paper III (Urban Planning), MCQ 24'),
  ('Gentrification is a process of urban development%', 'urban-planning', 'Also asked in BCSE 2024 Technical Paper III (Urban Planning), MCQ 30')
) as v(stem, spec, note)
join public.questions q on q.stem like v.stem and q.specialisation_id = (select id from public.specialisations where code = v.spec)
  and q.question_type = 'mcq' and q.origin = 'historical_official'
on conflict do nothing
returning question_id, year;

insert into public.question_appearances (question_id, year, note)
select q.id, 2024, v.note
from (values
  ('Which hormone is primarily responsible for lowering blood glucose levels after a meal?', 'mcq', 'Also asked in BCSE 2024 Technical Paper III (Nutrition and Dietetics), MCQ 4'),
  ('What is the recommended daily intake of protein for a patient undergoing hemodialysis?', 'mcq', 'Also asked in BCSE 2024 Technical Paper III (Nutrition and Dietetics), MCQ 10'),
  ('What is the purpose of conducting a Hazard Analysis Critical Control Point (HACCP) plan%', 'mcq', 'Also asked in BCSE 2024 Technical Paper III (Nutrition and Dietetics), MCQ 11'),
  ('Part II, question 3. Explain the rationale behind the DASH diet%', 'short_answer', 'Also asked in BCSE 2024 Technical Paper III (Nutrition and Dietetics), Part II question 3'),
  ('Part II, question 2. Discuss the nutritional management of a patient with chronic kidney disease%', 'short_answer', 'Also asked in BCSE 2024 Technical Paper III (Nutrition and Dietetics), Part II question 5 (5 marks in 2024)')
) as v(stem, qtype, note)
join public.questions q on q.stem like v.stem and q.specialisation_id = (select id from public.specialisations where code = 'nutrition-dietetics')
  and q.question_type::text = v.qtype and q.origin = 'historical_official'
on conflict do nothing
returning question_id, year;
