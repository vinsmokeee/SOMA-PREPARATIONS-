begin;
select tests.create_user('imp-admin@test.bt') as a \gset
select tests.create_user('imp-stu@test.bt') as s \gset
select tests.create_user('imp-res@test.bt') as r \gset
insert into public.user_roles (user_id, role) values (:'a', 'super_admin'), (:'r', 'researcher');
set local role authenticated;

-- Researcher records an uploaded document (no URL) and candidates
select tests.login(:'r');
insert into public.source_documents (id, origin, original_filename, title, document_type, exam_year, stage, current_sha256, processing_status)
values ('46000000-0000-4000-8000-000000000001', 'upload', 'PE-2015.pdf', 'BCSE 2015 Preliminary Examination', 'past_paper', 2015, 'PE', repeat('a', 64), 'extracted');
select tests.assert_fails($$insert into public.source_documents (origin, title, document_type, current_sha256) values ('upload', 'Same file again', 'past_paper', repeat('a', 64))$$, 'same file content cannot be recorded twice');
select tests.assert_fails($$insert into public.source_documents (origin, title, document_type) values ('url', 'URL doc without URL', 'other')$$, 'URL documents need a URL');
insert into public.import_candidates (document_id, number, stem, options, answer_label, answer_source)
values ('46000000-0000-4000-8000-000000000001', 1, 'Extracted stem', '[{"label":"A","body":"x"},{"label":"B","body":"y"}]', 'B', 'official_key');
select tests.assert((select count(*) from public.import_candidates) = 1, 'researcher can stage candidates');
-- Storage: researcher can upload to the private bucket
insert into storage.objects (bucket_id, name) values ('source-documents', 'uploads/PE-2015.pdf');
select tests.assert((select count(*) from storage.objects where bucket_id = 'source-documents') = 1, 'staff can read stored files');

-- Students see none of it
select tests.login(:'s');
select tests.assert((select count(*) from public.import_candidates) = 0, 'students cannot see candidates');
select tests.assert((select count(*) from public.usage_permissions) = 0, 'students cannot see permissions');
select tests.assert((select count(*) from storage.objects) = 0, 'students cannot see stored files');
select tests.assert_fails($$insert into storage.objects (bucket_id, name) values ('source-documents', 'x.pdf')$$, 'students cannot upload');

-- Founder records permission; historical exam needs an authorised document to be published
select tests.login(:'a');
insert into public.usage_permissions (id, title, scope, allows_reproduction, years_from, years_to)
values ('47000000-0000-4000-8000-000000000001', 'RCSC permission', 'Past BCSE papers may be reproduced for practice with attribution.', true, 2010, 2026);
insert into public.historical_papers (id, source_document_id, exam_year, stage, original_title, status)
values ('48000000-0000-4000-8000-000000000001', '46000000-0000-4000-8000-000000000001', 2015, 'PE', 'BCSE 2015 PE', 'draft');
select public.save_question(null, jsonb_build_object('stage','PE','question_type','mcq','stem','A reproduced 2015 question','explanation','Official key: B','subject_id',(select id from public.subjects where slug='english-communication'),'origin','historical_official'),
  '[{"body":"x","is_correct":false},{"body":"y","is_correct":true}]'::jsonb) as hq \gset
select public.review_question(:'hq', 'submit');
select public.review_question(:'hq', 'verify');
select public.review_question(:'hq', 'publish');
insert into public.exams (id, slug, title, stage, kind, duration_minutes, historical_paper_id, is_official_reproduction)
values ('49000000-0000-4000-8000-000000000001', 'pe-2015', 'BCSE 2015 PE', 'PE', 'historical', 60, '48000000-0000-4000-8000-000000000001', true);
select public.add_exam_question('49000000-0000-4000-8000-000000000001', :'hq');
select tests.assert_fails($$update public.exams set status = 'published' where id = '49000000-0000-4000-8000-000000000001'$$, 'cannot publish reproduction without authorisation');
update public.source_documents set usage_status = 'authorised', permission_id = '47000000-0000-4000-8000-000000000001' where id = '46000000-0000-4000-8000-000000000001';
update public.exams set status = 'published' where id = '49000000-0000-4000-8000-000000000001';
select tests.assert((select exam_year from public.exam_catalogue() where slug = 'pe-2015') = 2015, 'catalogue shows the paper year');
rollback;
