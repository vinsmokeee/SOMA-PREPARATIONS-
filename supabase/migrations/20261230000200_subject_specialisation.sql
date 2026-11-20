-- Subject for Technical Paper III (Subject Specialisation Paper): the questions of every specialisation hang off it.
insert into public.subjects (stage, slug, name, description, paper_id, is_official, source_document_id, sort_order)
select 'ME', 'subject-specialisation', 'Subject Specialisation', 'ME Paper III (Technical).', p.id, true,
       '00000000-0000-4000-8000-000000000101', 330
from public.exam_papers p where p.code = 'me-technical-3'
on conflict do nothing;
