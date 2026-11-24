insert into public.question_appearances (question_id, year, note)
select q.id, 2024, 'Also asked in BCSE 2024 Technical Paper II (Bio Science)'
from public.questions q join public.subject_groups g on g.id = q.subject_group_id
where g.code = 'bio-science' and q.paper_id = (select id from public.exam_papers where code = 'me-technical-2')
  and q.stem in ('Which tissue gives rise to secondary growth?', 'Which is common to kidney and skeleton in mammals?')
on conflict do nothing;
