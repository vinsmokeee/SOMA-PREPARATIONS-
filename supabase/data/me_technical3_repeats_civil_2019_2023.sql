-- BCSE Civil Engineering Technical Paper III questions that RCSC asked again in a later year (2019-2023 papers, sent by
-- the founder): the question is loaded once, from the latest year, and the earlier years are recorded as appearances
-- (founder rule: repeated questions are tracked, not loaded twice).
insert into public.question_appearances (question_id, year, note)
select q.id, v.year, v.note
from (values
  ('Hydrographic survey deal with the mapping of%', 2023, 'Also asked in BCSE 2023 Technical Paper III (Civil Engineering), MCQ 6'),
  ('To improve the earthquake resistance of a building, provide%', 2022, 'Also asked in BCSE 2022 Technical Paper III (Civil Engineering), MCQ 19'),
  ('Group I contains representative load-settlement curves%', 2020, 'Also asked in BCSE 2020 Technical Paper III (Civil Engineering), MCQ 26'),
  ('If there are m unknown member forces, r unknown reaction components and j number of joints%', 2019, 'Also asked in BCSE 2019 Technical Paper III (Civil Engineering), MCQ 9'),
  ('A simply supported beam with a gradually varying load from zero at%', 2019, 'Also asked in BCSE 2019 Technical Paper III (Civil Engineering), MCQ 10'),
  ('The speed density relationship for a road section is shown%', 2019, 'Also asked in BCSE 2019 Technical Paper III (Civil Engineering), MCQ 22'),
  ('An inflow hydrograph is routed through a reservoir to produce an outflow hydrograph%', 2019, 'Also asked in BCSE 2019 Technical Paper III (Civil Engineering), MCQ 23')
) as v(stem, year, note)
join public.questions q on q.stem like v.stem and q.specialisation_id = (select id from public.specialisations where code = 'civil-engineering')
  and q.question_type = 'mcq' and q.origin = 'historical_official' and q.status <> 'archived'
on conflict do nothing
returning question_id, year;
