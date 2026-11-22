-- BCSE 2024 Technical Paper III questions that RCSC asked again (reworded) in 2025 (already loaded from the 2025 papers):
-- record 2024 on the 2025 questions instead of loading them twice (founder rule: repeated questions are tracked).
insert into public.question_appearances (question_id, year, note)
select q.id, 2024, v.note
from (values
  ('In females, Neisseria gonorrhoeae infection typically presents with%', 'mbbs-medicine', 'Also asked in BCSE 2024 Technical Paper III (MBBS / Medicine), MCQ 3 (worded differently, same options)'),
  ('Beriberi is caused by deficiency of%', 'mbbs-medicine', 'Also asked in BCSE 2024 Technical Paper III (MBBS / Medicine), MCQ 10 (worded slightly differently)')
) as v(stem, spec, note)
join public.questions q on q.stem like v.stem and q.specialisation_id = (select id from public.specialisations where code = v.spec)
  and q.question_type = 'mcq' and q.origin = 'historical_official'
on conflict do nothing
returning question_id, year;
