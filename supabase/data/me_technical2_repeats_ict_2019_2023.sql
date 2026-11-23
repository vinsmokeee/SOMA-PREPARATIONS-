-- BCSE Technical Paper II (ICT) questions that RCSC asked again in another year (2019-2023 papers, sent by the founder):
-- each question is loaded once (latest year, or the BCSE 2024 question already on Soma) and the other years are recorded
-- as appearances (founder rule: repeated questions are tracked, not loaded twice).
insert into public.question_appearances (question_id, year, note)
select q.id, v.year, v.note
from (values
  ('What is the correct HTML for adding a background color?%', 2022, 'Also asked in BCSE 2022 Technical Paper II (ICT), MCQ 4'),
  ('What is the output of this C Program? int main() { float a=1%', 2022, 'Also asked in BCSE 2022 Technical Paper II (ICT), MCQ 8'),
  ('Which are the components of FQDN?%', 2022, 'Also asked in BCSE 2022 Technical Paper II (ICT), MCQ 11'),
  ('The OSI model consists of \_\_\_\_\_\_\_ layers.%', 2022, 'Also asked in BCSE 2022 Technical Paper II (ICT), MCQ 13'),
  ('The \_\_\_\_\_\_\_\_\_\_\_\_address uniquely defines a host on the Inter%', 2022, 'Also asked in BCSE 2022 Technical Paper II (ICT), MCQ 14'),
  ('Which command is used to retrieve entries from a database us%', 2022, 'Also asked in BCSE 2022 Technical Paper II (ICT), MCQ 20'),
  ('Which keyword is used in SQL query to retrieve a unique reco%', 2022, 'Also asked in BCSE 2022 Technical Paper II (ICT), MCQ 22'),
  ('What type of testing is depicted in the diagram?%', 2022, 'Also asked in BCSE 2022 Technical Paper II (ICT), MCQ 23'),
  ('Which characteristic of the OOPs is shown by this diagram?%', 2022, 'Also asked in BCSE 2022 Technical Paper II (ICT), MCQ 25'),
  ('The parity bit is added for:%', 2022, 'Also asked in BCSE 2022 Technical Paper II (ICT), MCQ 38'),
  ('What is the loopback (localhost) ip address?%', 2022, 'Also asked in BCSE 2022 Technical Paper II (ICT), MCQ 44'),
  ('Which of the following is a valid IPv6 address format?%', 2022, 'Also asked in BCSE 2022 Technical Paper II (ICT), MCQ 58'),
  ('What is the full subnet mask for the address 172.16.5.10/28?%', 2021, 'Also asked in BCSE 2021 Technical Paper II (ICT), MCQ 3'),
  ('IEEE standard for Wi-Fi 6 is%', 2021, 'Also asked in BCSE 2021 Technical Paper II (ICT), MCQ 23'),
  ('Which among the following is the least strong security encry%', 2021, 'Also asked in BCSE 2021 Technical Paper II (ICT), MCQ 24'),
  ('In computing, one nibble is equal to\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.%', 2021, 'Also asked in BCSE 2021 Technical Paper II (ICT), MCQ 44'),
  ('Find the mean of the following set of numbers: 1, 1, 1, 2, 4%', 2020, 'Also asked in BCSE 2020 Technical Paper II (ICT), MCQ 2'),
  ('URL stands for%', 2020, 'Also asked in BCSE 2020 Technical Paper II (ICT), MCQ 8'),
  ('What is NOS?%', 2019, 'Also asked in BCSE 2019 Technical Paper II (ICT), MCQ 44'),
  ('The number of values a function can return at a time is%', 2019, 'Also asked in BCSE 2019 Technical Paper II (ICT), MCQ 49'),
  ('A malicious code hidden inside a seemingly harmless piece of%', 2023, 'Also asked in BCSE 2023 Technical Paper II (ICT), MCQ 45')
) as v(stem, year, note)
join public.questions q on q.stem like v.stem and q.subject_group_id = (select id from public.subject_groups where code = 'ict')
  and q.paper_id = (select id from public.exam_papers where code = 'me-technical-2') and q.status <> 'archived'
on conflict do nothing
returning question_id, year;
