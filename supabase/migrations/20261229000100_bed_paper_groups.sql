-- B.Ed. Papers I and II differ by graduate type (RCSC BCSE 2025): "for General Graduates" (B.Ed. General / Primary and
-- B.Ed. Secondary) and "for Dzongkha Graduates" (B.Ed. Dzongkha). Paper III (Teacher Aptitude Test) is common.
-- Two internal subject groups carry this; they are inactive so they never appear in the Technical Paper II group
-- picker - B.Ed. students get theirs from their B.Ed. type (specialisation). Papers I and II become group-scoped.
insert into public.subject_groups (code, name, description, is_active, sort_order, notes)
values ('bed-general-graduates', 'B.Ed. (General Graduates)', 'B.Ed. Papers I and II for General / Primary and Secondary.', false, 200,
        'RCSC BCSE 2025 B.Ed. papers "for General Graduates". Internal: set from the B.Ed. type.'),
       ('bed-dzongkha-graduates', 'B.Ed. (Dzongkha Graduates)', 'B.Ed. Papers I and II for B.Ed. Dzongkha.', false, 210,
        'RCSC BCSE 2025 B.Ed. papers "for Dzongkha Graduates". Internal: set from the B.Ed. type.')
on conflict (code) do nothing;

update public.specialisations set subject_group_id = (select id from public.subject_groups where code = 'bed-general-graduates')
where code in ('bed-general-graduate', 'bed-secondary');
update public.specialisations set subject_group_id = (select id from public.subject_groups where code = 'bed-dzongkha-graduates')
where code = 'bed-dzongkha-graduate';

update public.exam_papers set bank_scope = 'subject_group', reading_minutes = 15 where code in ('me-bed-1', 'me-bed-2');
update public.exam_papers set reading_minutes = 15 where code = 'me-bed-3';
