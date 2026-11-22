begin;
-- Founder, 22 Nov 2026: in ME, English written answers are typed only; Dzongkha answers may be typed or uploaded.
-- Questions that ask to draw or show working keep the upload option. Translation into English is typed only.
select tests.assert(not public.upload_allowed('ME', 'essay', 'Write an essay on climate change in Bhutan.'), 'an English essay is typed only');
select tests.assert(not public.upload_allowed('ME', 'short_answer', 'Explain the role of the National Council.'), 'an English short answer is typed only');
select tests.assert(public.upload_allowed('ME', 'essay', 'འོག་ལུ་བཀོད་ཡོད་པའི་ འབྲི་རྩོམ་ དོན་ཚན་གཉིས་ལས་ གཅིག་བྲིས།'), 'a Dzongkha essay can be uploaded');
select tests.assert(public.upload_allowed('ME', 'translation', 'འོག་ལུ་ཨིང་སྐད་ཀྱི་ཚིག་ཚན་འདི་ རྫོང་ཁའི་ཐོག་ལུ་སྐད་སྒྱུར་འབད། The King visited Paro.'), 'translation into Dzongkha can be uploaded');
select tests.assert(not public.upload_allowed('ME', 'translation', 'Read the following passage carefully and translate it into English. འབྲུག་གི་རྒྱལ་པོ།'), 'translation into English is typed only');
select tests.assert(public.upload_allowed('ME', 'long_answer', 'Draw the bending moment diagram for the beam.'), 'a drawing question can be uploaded');
select tests.assert(public.upload_allowed('ME', 'short_answer', 'Calculate the effective depth of the slab.'), 'a calculation question can be uploaded');
select tests.assert(not public.upload_allowed('ME', 'mcq', 'Draw nothing.'), 'MCQs have no upload');
select tests.assert(public.upload_allowed('PE', 'essay', 'Write an essay on climate change.'), 'other stages are unchanged');

-- The exam room is told, and the server refuses an upload for a typed-only question.
select tests.create_user('to-stu@test.bt', 'Typist') as s \gset
select tests.create_user('to-boss@test.bt', 'Boss') as b \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
insert into public.subjects (stage, slug, name, paper_id) values ('ME', 'to-governance', 'Governance', '00000000-0000-4000-8000-000000000412');
set local role authenticated;
select tests.login(:'b');
select public.save_question(null, jsonb_build_object('stage','ME','question_type','essay','stem','Explain the importance of a constitutional monarchy.',
  'model_answer','A model answer of sufficient length for the test.','marks','10','is_free_sample',true,
  'subject_id',(select id from public.subjects where slug='to-governance'),'paper_id','00000000-0000-4000-8000-000000000412'),
  '[]'::jsonb, '[{"label":"Content","description":"d","max_marks":10}]'::jsonb) as q \gset
select public.review_question(:'q', 'submit'); select public.review_question(:'q', 'verify'); select public.review_question(:'q', 'publish');
select tests.login(:'s');
update public.profiles set entry_category_id = (select id from public.exam_categories where code = 'administrative') where id = auth.uid();
select public.create_written_practice(:'q', null) as att \gset
select (public.get_attempt_paper(:'att') -> 'questions' -> 0 ->> 'exam_question_id') as eq \gset
select tests.assert((public.get_attempt_paper(:'att') -> 'questions' -> 0 ->> 'upload_allowed')::boolean = false, 'the exam room hides the upload option');
select tests.assert_fails(format($$select public.set_answer_mode(%L, %L, 'handwritten')$$, :'att', :'eq'), 'cannot switch an English answer to handwritten');
select public.set_answer_mode(:'att', :'eq', 'typed') as ans \gset
select tests.assert_fails(format($$select public.add_answer_page(%L, %L)$$, :'ans', :'s' || '/' || :'ans' || '/p1.jpg'), 'cannot upload pages for an English answer');
rollback;
