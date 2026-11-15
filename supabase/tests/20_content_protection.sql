begin;
select tests.create_user('student2@test.bt') as s \gset
select tests.create_user('dev@test.bt') as d \gset
select tests.create_user('rev@test.bt') as r \gset
select tests.create_user('boss@test.bt') as b \gset
insert into public.user_roles (user_id, role) values (:'d', 'question_developer'), (:'r', 'content_reviewer'), (:'b', 'super_admin');

set local role authenticated;

-- Developer creates an AI-generated MCQ
select tests.login(:'d');
insert into public.questions (id, stage, question_type, stem, origin, status, subject_id)
values ('10000000-0000-4000-8000-000000000001', 'PE', 'mcq', 'Which body conducts the BCSE?', 'original', 'awaiting_review',
        (select id from public.subjects where slug = 'general-awareness-current-affairs'));
insert into public.question_options (question_id, label, body, is_correct, position) values
  ('10000000-0000-4000-8000-000000000001', 'A', 'Royal Civil Service Commission', true, 1),
  ('10000000-0000-4000-8000-000000000001', 'B', 'National Council', false, 2);

-- Developer cannot verify or publish
select tests.assert_fails($$update public.questions set status = 'verified' where id = '10000000-0000-4000-8000-000000000001'$$, 'developer cannot verify');
select tests.assert_fails($$update public.questions set status = 'published' where id = '10000000-0000-4000-8000-000000000001'$$, 'developer cannot publish');

-- Nobody can publish an unverified question, not even super admin
select tests.login(:'b');
select tests.assert_fails($$update public.questions set status = 'published' where id = '10000000-0000-4000-8000-000000000001'$$, 'cannot skip verification');

-- Reviewer verifies; verified_by recorded
select tests.login(:'r');
update public.questions set status = 'verified' where id = '10000000-0000-4000-8000-000000000001';
select tests.assert((select verified_by from public.questions where id = '10000000-0000-4000-8000-000000000001') = :'r'::uuid, 'verified_by set');
-- Reviewer lacks questions.publish
select tests.assert_fails($$update public.questions set status = 'published' where id = '10000000-0000-4000-8000-000000000001'$$, 'reviewer cannot publish');

-- Super admin publishes
select tests.login(:'b');
update public.questions set status = 'published' where id = '10000000-0000-4000-8000-000000000001';
select tests.assert((select published_at is not null from public.questions where id = '10000000-0000-4000-8000-000000000001'), 'published_at set');

-- Developer cannot silently edit published content
select tests.login(:'d');
select tests.assert_fails($$update public.questions set stem = 'Changed stem text' where id = '10000000-0000-4000-8000-000000000001'$$, 'developer cannot edit published content');

-- Students and anonymous visitors can never read questions or answer keys
select tests.login(:'s');
select tests.assert((select count(*) from public.questions) = 0, 'student cannot read question bank');
select tests.assert((select count(*) from public.question_options) = 0, 'student cannot read options/answer key');
select tests.login(null);
set local role anon;
select tests.assert((select count(*) from public.questions) = 0, 'anon cannot read question bank');
select tests.assert((select count(*) from public.question_options) = 0, 'anon cannot read answer key');

-- Public reference data is readable anonymously
select tests.assert((select count(*) from public.exam_categories) = 6, 'six ME categories visible');
select tests.assert((select count(*) from public.exam_papers where stage = 'ME') = 12, 'twelve ME papers');
select tests.assert((select count(*) from public.subjects where stage = 'PE') = 5, 'five official PE subject areas');
select tests.assert((select count(*) from public.packages) = 2, 'coming-soon packages are public');
select tests.assert((select count(*) from public.source_documents) = 0, 'source documents are internal');
update public.packages set price = 1;
reset role;
select tests.assert((select min(price) from public.packages) >= 499, 'anon cannot change prices');
rollback;
