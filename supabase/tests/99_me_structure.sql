begin;
-- Structure: six categories, three papers each, B.Ed. graduate types, 2025 specialisations, Paper II groups
select tests.assert((select count(*) from public.exam_categories where is_active and is_offered) = 6, 'all six ME categories are offered');
select tests.assert((select name from public.exam_categories where code = 'bed') = 'Education Service (B.Ed.)', 'B.Ed. has its official name');
select tests.assert((select bool_and(n = 3) from (
  select c.code, count(*) n from public.exam_categories c join public.exam_paper_categories pc on pc.category_id = c.id
  join public.exam_papers p on p.id = pc.paper_id and p.stage = 'ME' group by c.code) x), 'every category has exactly three ME papers');
select tests.assert((select count(distinct pc.paper_id) from public.exam_paper_categories pc join public.exam_categories c on c.id = pc.category_id join public.exam_papers p on p.id = pc.paper_id
  where p.stage = 'ME' and c.code in ('administrative', 'finance', 'pgde')) = 3, 'Administrative, Finance and PGDE share the same three papers');
select tests.assert((select title from public.exam_papers where code = 'me-technical-1') = 'Languages and General Knowledge', 'Technical Paper I has its RCSC 2025 name');
select tests.assert((select count(*) from public.specialisations s join public.exam_categories c on c.id = s.category_id where c.code = 'bed' and s.is_active) = 2, 'B.Ed. General and Dzongkha graduates');
select tests.assert((select count(*) from public.specialisations s join public.exam_categories c on c.id = s.category_id where c.code = 'technical' and s.is_active) = 48, 'the 48 BCSE 2025 specialisations can be chosen');
select tests.assert((select count(*) from public.specialisations where list_source = 'CSCE 2009' and not is_active) = 17, 'earlier-list specialisations are kept, not offered');
select tests.assert((select count(*) from public.specialisations where lower(name) = 'civil engineering') = 1, 'no duplicate rows for names on both lists');
select tests.assert((select count(*) from public.subject_groups where is_active) = 8, 'eight Paper II groups can be chosen');

-- Students
select tests.create_user('me-civil@test.bt', 'Civil') as civil \gset
select tests.create_user('me-nurse@test.bt', 'Nurse') as nurse \gset
select tests.create_user('me-admin@test.bt', 'Admin service') as adm \gset
select tests.create_user('me-bed@test.bt', 'BEd') as bed \gset
select tests.create_user('me-boss@test.bt') as boss \gset
insert into public.user_roles (user_id, role) values (:'boss', 'super_admin');
select id as tech from public.exam_categories where code = 'technical' \gset
select id as adminc from public.exam_categories where code = 'administrative' \gset
select id as bedc from public.exam_categories where code = 'bed' \gset
select id as s_civil from public.specialisations where code = 'civil-engineering' \gset
select id as s_nurse from public.specialisations where code = 'nursing' \gset
select id as s_law from public.specialisations where code = 'law' \gset
select id as s_bedgen from public.specialisations where code = 'bed-general-graduate' \gset
select id as g_eng from public.subject_groups where code = 'engineering' \gset
select id as g_nurse from public.subject_groups where code = 'nursing' \gset
select id as g_law from public.subject_groups where code = 'law' \gset

set local role authenticated;
select tests.login(:'civil');
update public.profiles set entry_category_id = :'tech', specialisation_id = :'s_civil', subject_group_id = :'g_eng' where id = :'civil';
select tests.assert_fails(format($$update public.profiles set specialisation_id = %L where id = %L$$, :'s_law', :'civil'), 'an earlier-list specialisation cannot be chosen');
select tests.assert_fails(format($$update public.profiles set subject_group_id = %L where id = %L$$, :'g_law', :'civil'), 'a Paper II group not on offer cannot be chosen');
select tests.login(:'nurse');
-- No Paper II group chosen: it comes from the specialisation (Nursing → Nursing)
update public.profiles set entry_category_id = :'tech', specialisation_id = :'s_nurse' where id = :'nurse';
select tests.login(:'adm');
update public.profiles set entry_category_id = :'adminc' where id = :'adm';
select tests.login(:'bed');
update public.profiles set entry_category_id = :'bedc', specialisation_id = :'s_bedgen' where id = :'bed';
select tests.assert_fails(format($$update public.profiles set subject_group_id = %L where id = %L$$, :'g_eng', :'bed'), 'only Technical students choose a Paper II group');

-- Questions (published), one per bank
select tests.login(:'boss');
reset role;
create temp table qs (tag text, id uuid);
grant all on qs to authenticated;
insert into qs select v.tag, gen_random_uuid() from (values ('civil3'), ('nurse3'), ('untagged3'), ('loose'), ('eng2'), ('nurse2'), ('general2'), ('bedgen1')) v(tag);
insert into public.questions (id, stage, question_type, stem, explanation, model_answer, paper_id, specialisation_id, subject_group_id, status, verified_by, verified_at)
select qs.id, 'ME', 'short_answer', 'ME structure test question ' || qs.tag, 'x', 'x',
  (select id from public.exam_papers where code = case qs.tag when 'civil3' then 'me-technical-3' when 'nurse3' then 'me-technical-3' when 'untagged3' then 'me-technical-3'
     when 'eng2' then 'me-technical-2' when 'nurse2' then 'me-technical-2' when 'general2' then 'me-general-2' when 'bedgen1' then 'me-bed-1' end),
  case qs.tag when 'civil3' then :'s_civil'::uuid when 'nurse3' then :'s_nurse'::uuid when 'bedgen1' then :'s_bedgen'::uuid end,
  case qs.tag when 'eng2' then :'g_eng'::uuid when 'nurse2' then :'g_nurse'::uuid end,
  'verified', :'boss', now()
from qs;
update public.questions set status = 'published' where id in (select id from qs);

set local role authenticated;
select tests.login(:'civil');
select tests.assert((select array_agg(qs.tag order by qs.tag) from public.written_practice_questions() w join qs on qs.id = w.id) = array['civil3', 'eng2'],
  'Civil Engineering sees its Paper III and its Paper II group only — never Nursing, untagged or unclassified questions');
select tests.login(:'nurse');
select tests.assert((select array_agg(qs.tag order by qs.tag) from public.written_practice_questions() w join qs on qs.id = w.id) = array['nurse2', 'nurse3'], 'Nursing gets its Paper II group from the specialisation and never sees Civil Engineering questions');
select tests.login(:'adm');
select tests.assert((select array_agg(qs.tag order by qs.tag) from public.written_practice_questions() w join qs on qs.id = w.id) = array['general2'], 'Administrative Service sees the shared general papers only');
select tests.login(:'bed');
select tests.assert((select array_agg(qs.tag order by qs.tag) from public.written_practice_questions() w join qs on qs.id = w.id) = array['bedgen1'], 'B.Ed. General graduates see their own Paper I');
rollback;
