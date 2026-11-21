insert into public.question_appearances (question_id, year, note)
select q.id, 2025, 'Also asked in BCSE 2025 Technical Paper III (Traditional Medicine), MCQ ' || case when q.stem like 'གཏར་དུ་རུང་བའི་ནད་གཞི%' then '8' else '9' end
from public.questions q
where q.specialisation_id = (select id from public.specialisations where code = 'drungtsho') and q.question_type = 'mcq'
  and (q.stem like 'གཏར་དུ་རུང་བའི་ནད་གཞི%' or q.stem like 'གློ་མ་སྒང་ལས་བྱུང་བའི%')
on conflict do nothing
returning question_id, year;
