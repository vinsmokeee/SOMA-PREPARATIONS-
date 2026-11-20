begin;
select tests.create_user('wg-a@test.bt', 'A') as a \gset
select tests.create_user('wg-v@test.bt', 'V') as v \gset
update public.profiles set entry_category_id = (select id from public.exam_categories where code = 'administrative') where id = :'a';
insert into public.entitlements (user_id, package_id) values (:'a', (select id from public.packages where slug = 'me-premium'));
select id as p from public.exam_papers where code = 'me-general-2' \gset
delete from public.paper_blueprint_sections where paper_id = :'p';
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source)
values (:'p', 1, 'Passage', 'passage', 1, 10, null, 'test');
-- one passage with two questions: only the first published
insert into public.questions (stage, question_type, stem, marks, paper_id, status, origin, passage_group, passage_position, verified_by, verified_at)
values ('ME', 'passage', 'Whole group test part one', 5, :'p', 'verified', 'original', 'wg-test-1', 1, :'v', now()),
       ('ME', 'passage', 'Whole group test part two', 5, :'p', 'awaiting_review', 'original', 'wg-test-1', 2, null, null);
update public.questions set status = 'published' where stem = 'Whole group test part one';
set local role authenticated;
select tests.login(:'a');
select tests.assert(not public.paper_mock_ready(:'p'), 'a passage with a question still in review is not used in mocks');
reset role;
select tests.login(null);
update public.questions set status = 'verified', verified_by = :'v', verified_at = now() where stem = 'Whole group test part two';
update public.questions set status = 'published' where stem = 'Whole group test part two';
set local role authenticated;
select tests.login(:'a');
select tests.assert(public.paper_mock_ready(:'p'), 'once every question of the passage is published, the mock can use it');
select public.start_paper_mock(:'p') as m \gset
reset role;
select tests.assert((select count(*) = 2 from public.exam_attempts at join public.exam_questions eq on eq.exam_id = at.exam_id where at.id = :'m'), 'the mock has the whole passage');
rollback;
