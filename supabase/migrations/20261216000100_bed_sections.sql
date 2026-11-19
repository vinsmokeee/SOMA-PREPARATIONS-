-- B.Ed. has three sections (founder, 20 Nov 2026): General / Primary, Secondary and Dzongkha.
-- Paper I is the same for all three; Paper II is a subject paper (same pattern, subject-wise — the subjects
-- are added from the RCSC papers as they are loaded); Paper III is the Teacher Aptitude Test for all.
-- Existing students keep their choice (rows are renamed, not replaced).
update public.specialisations s set name = 'B.Ed. General / Primary', list_source = 'Founder, 20 Nov 2026', sort_order = 1
  from public.exam_categories c where c.id = s.category_id and c.code = 'bed' and s.code = 'bed-general-graduate';
update public.specialisations s set name = 'B.Ed. Dzongkha', list_source = 'Founder, 20 Nov 2026', sort_order = 3
  from public.exam_categories c where c.id = s.category_id and c.code = 'bed' and s.code = 'bed-dzongkha-graduate';
insert into public.specialisations (category_id, code, name, list_source, is_active, sort_order)
select c.id, 'bed-secondary', 'B.Ed. Secondary', 'Founder, 20 Nov 2026', true, 2
from public.exam_categories c where c.code = 'bed'
on conflict do nothing;

update public.exam_papers set description = 'The same paper for all three B.Ed. sections.' where code = 'me-bed-1';
update public.exam_papers set title = 'Subject Paper',
  description = 'Subject-wise paper with the same pattern for every subject; depends on the B.Ed. section and subject.'
  where code = 'me-bed-2';
update public.exam_papers set description = 'The same Teacher Aptitude Test for all three B.Ed. sections.' where code = 'me-bed-3';
