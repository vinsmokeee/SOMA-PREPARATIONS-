-- BCSE Technical Paper II (Medical Science) questions that RCSC asked again in another year (2019-2023 papers, sent by
-- the founder): each question is loaded once (latest year, or the BCSE 2024 question already on Soma) and the other years
-- are recorded as appearances (founder rule: repeated questions are tracked, not loaded twice).
insert into public.question_appearances (question_id, year, note)
select q.id, v.year, v.note
from (values
  ('All the following cause water appsorbtion into the plant EXC%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Medical Science), MCQ 2'),
  ('All the following cause water appsorbtion into the plant EXC%', 2020, 'Also asked in BCSE 2020 Technical Paper II (Medical Science), MCQ 11'),
  ('Action potential is due to the movement of%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Medical Science), MCQ 7'),
  ('Choose the good cholesterol from the following.%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Medical Science), MCQ 10'),
  ('Which part of the human brain is concerned with the body bal%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Medical Science), MCQ 23'),
  ('Which of the following is responsible for connecting bone to%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Medical Science), MCQ 25'),
  ('Which of the following is responsible for connecting bone to%', 2022, 'Also asked in BCSE 2022 Technical Paper II (Medical Science), MCQ 37'),
  ('The world HIV Day is observed on%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Medical Science), MCQ 28'),
  ('Which tissue cannot store glycogen or lipids for energy?%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Medical Science), MCQ 30'),
  ('What type of pulley is a construction crane?%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Medical Science), MCQ 66'),
  ('LED bulb is encouraged to use for lighting home because%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Medical Science), MCQ 67'),
  ('All of the following are the impact of intensive farming cal%', 2020, 'Also asked in BCSE 2020 Technical Paper II (Medical Science), MCQ 21'),
  ('Choose the water-soluble vitamins:%', 2020, 'Also asked in BCSE 2020 Technical Paper II (Medical Science), MCQ 12'),
  ('Choose the water-soluble vitamins:%', 2021, 'Also asked in BCSE 2021 Technical Paper II (Medical Science), MCQ 7'),
  ('Erythropoietin is secreted by%', 2020, 'Also asked in BCSE 2020 Technical Paper II (Medical Science), MCQ 36'),
  ('During winter the metallic pipe gets cracked and burst due t%', 2020, 'Also asked in BCSE 2020 Technical Paper II (Medical Science), MCQ 45'),
  ('The electromagnetic radiation with shortest wavelength is%', 2020, 'Also asked in BCSE 2020 Technical Paper II (Medical Science), MCQ 60'),
  ('The type of pulleys used raising the water bucket from the w%', 2020, 'Also asked in BCSE 2020 Technical Paper II (Medical Science), MCQ 67'),
  ('The zone of atmosphere in which the ozone layer is present i%', 2021, 'Also asked in BCSE 2021 Technical Paper II (Medical Science), MCQ 60'),
  ('Why do you think the Infection control and medical waste man%', 2022, 'Also asked in BCSE 2022 Technical Paper II (Medical Science), Part II Q9'),
  ('Complete the following table with the differences between DN%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Medical Science), Part II Q4'),
  ('Draw a clear diagram of the glomerular filtration mechanism %', 2020, 'Also asked in BCSE 2020 Technical Paper II (Medical Science), Part II Q4'),
  ('Explain Drug Sensitive TB (DS-TB), Extensively Drug-Resistan%', 2020, 'Also asked in BCSE 2020 Technical Paper II (Medical Science), Part II Q5'),
  ('Which of these functions is the least important for proteins%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Medical Science), MCQ 29'),
  ('Which of these functions is the least important for proteins%', 2023, 'Also asked in BCSE 2023 Technical Paper II (Medical Science), MCQ 33'),
  ('A location with luxuriant growth of lichens on the trees ind%', 2023, 'Also asked in BCSE 2023 Technical Paper II (Medical Science), MCQ 41'),
  ('Which of the following organism breathes through skin?%', 2022, 'Also asked in BCSE 2022 Technical Paper II (Medical Science), MCQ 3'),
  ('The unit of electrical current is%', 2019, 'Also asked in BCSE 2019 Technical Paper II (Medical Science), MCQ 58'),
  ('Infections induced by a ''physician'' is known as%', 2022, 'Also asked in BCSE 2022 Technical Paper II (Medical Science), MCQ 19'),
  ('Name 5 different types of human teeth and explain their func%', 2022, 'Also asked in BCSE 2022 Technical Paper II (Medical Science), Part II Q4'),
  ('State the laws of reflection from a plane mirror.%', 2022, 'Also asked in BCSE 2022 Technical Paper II (Medical Science), Part II Q10'),
  ('Using the circuit shown (a voltage V applied across a resist%', 2020, 'Also asked in BCSE 2020 Technical Paper II (Medical Science), Part II Q7')
) as v(stem, year, note)
join public.questions q on q.stem like v.stem and q.subject_group_id = (select id from public.subject_groups where code = 'medical-science')
  and q.paper_id = (select id from public.exam_papers where code = 'me-technical-2') and q.status <> 'archived'
on conflict do nothing
returning question_id, year;
