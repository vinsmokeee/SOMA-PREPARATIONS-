begin;
-- Reference data
select tests.assert((select count(*) from public.specialisations where list_source like '%CSCE 2009%') = 31, 'the 31 earlier-list specialisations are all kept');
select tests.assert((select count(*) from public.specialisations where review_note is not null) = 4, 'possible duplicates flagged, not merged');
select tests.assert((select count(*) from public.specialisations where subject_group_id is not null) = 0, 'no specialisation linked to a Paper II group until verified');
select tests.assert((select string_agg(ps.title, ',' order by ps.sort_order) from public.paper_sections ps join public.exam_papers p on p.id = ps.paper_id where p.code = 'pe')
  = 'English,Dzongkha,Aptitude,Data Interpretation', 'PE has the four sections');
select tests.assert((select question_count = 100 and duration_minutes = 150 and max_marks = 100 and params_source = 'founder_brief' from public.exam_papers where code = 'pe'), 'PE defaults from the brief, marked as such');
select tests.assert((select duration_minutes from public.exam_papers where code = 'me-technical-2') = 90, 'Technical Paper II 90 minutes');
select tests.assert((select bank_scope from public.exam_papers where code = 'me-technical-3') = 'specialisation', 'Paper III per specialisation');
select tests.assert((select count(*) from public.pe_cutoff_history) = 3, 'cut-off history is reference data');
select tests.assert((select is_offered from public.exam_categories where code = 'bed'), 'B.Ed. is offered (founder, 17 Nov 2026)');
select tests.assert((select includes_me and not includes_pe from public.packages where slug = 'me-premium'), 'separate ME package');
select tests.assert((select status from public.packages where slug = 'pe-me-premium') = 'draft', 'combined package hidden');

-- People and questions
select tests.create_user('ea-boss@test.bt') as b \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
select tests.create_user('ea-civil@test.bt') as civ \gset
select tests.create_user('ea-admin@test.bt') as adm \gset
select tests.create_user('ea-new@test.bt') as nw \gset
select id as tech from public.exam_categories where code = 'technical' \gset
select id as gen from public.exam_categories where code = 'administrative' \gset
select id as bed from public.exam_categories where code = 'bed' \gset
select id as civil from public.specialisations where code = 'civil-engineering' \gset
select id as elec from public.specialisations where code = 'electrical-engineering' \gset
select id as t2 from public.exam_papers where code = 'me-technical-2' \gset
select id as t3 from public.exam_papers where code = 'me-technical-3' \gset
select id as g1 from public.exam_papers where code = 'me-general-1' \gset
update public.profiles set entry_category_id = :'tech', specialisation_id = :'civil' where id = :'civ';
update public.profiles set entry_category_id = :'gen' where id = :'adm';

insert into public.questions (stage, question_type, stem, model_answer, paper_id, specialisation_id, subject_group_id, status, verified_by)
values ('ME', 'short_answer', 'EA civil paper three question about concrete', 'x', :'t3', :'civil', null, 'verified', :'b'),
       ('ME', 'short_answer', 'EA electrical paper three question about circuits', 'x', :'t3', :'elec', null, 'verified', :'b'),
       ('ME', 'short_answer', 'EA unclassified technical paper two question', 'x', :'t2', null, null, 'verified', :'b'),
       ('ME', 'short_answer', 'EA civil paper two question in its own bank', 'x', :'t2', :'civil', null, 'verified', :'b'),
       ('ME', 'short_answer', 'EA general paper one dzongkha question', 'x', :'g1', null, null, 'verified', :'b'),
       ('ME', 'short_answer', 'EA unrestricted legacy written question', 'x', null, null, null, 'verified', :'b');
update public.questions set status = 'published' where stem like 'EA %';

set local role authenticated;
select tests.login(:'civ');
select tests.assert((select count(*) from public.written_practice_questions() where stem like 'EA %') = 2, 'civil student: own Paper II and III only');
select tests.assert(not exists (select 1 from public.written_practice_questions() where stem like 'EA unrestricted%'), 'unclassified ME questions are never served');
select tests.assert(not exists (select 1 from public.written_practice_questions() where stem like 'EA electrical%'), 'never another specialisation');
select tests.assert(not exists (select 1 from public.written_practice_questions() where stem like 'EA unclassified%'), 'unclassified Paper II not served');
select tests.assert(not exists (select 1 from public.written_practice_questions() where stem like 'EA general%'), 'never another pathway');
select tests.assert_fails(format($$select public.create_written_practice(%L)$$, (select id from public.questions where stem like 'EA electrical%')), 'cannot start another specialisation''s question');
select tests.assert_fails(format($$update public.profiles set specialisation_id = %L, entry_category_id = %L where id = auth.uid()$$, :'civil', :'gen'), 'specialisation must belong to the category');

select tests.login(:'adm');
select tests.assert((select count(*) from public.written_practice_questions() where stem like 'EA %') = 1, 'general student: general paper only');

select tests.login(:'nw');
select tests.assert((select count(*) from public.written_practice_questions() where stem like 'EA %') = 0, 'no entry yet: no ME questions');

-- Entry is locked once the student has ME access (administrators can still change it)
select tests.login(:'b');
select public.admin_grant_subscription(:'civ', (select id from public.packages where slug = 'me-premium'), 45, 'complimentary', 'test grant');
select tests.login(:'civ');
select tests.assert_fails(format($$update public.profiles set specialisation_id = %L where id = auth.uid()$$, :'elec'), 'entry locked with ME access');
select tests.login(:'b');
update public.profiles set specialisation_id = :'elec' where id = :'civ';
select tests.assert((select specialisation_id from public.profiles where id = :'civ') = :'elec', 'administrator can change it');
rollback;
