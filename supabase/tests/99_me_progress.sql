begin;
select tests.create_user('mp-stu@test.bt', 'Progress') as s \gset
select tests.create_user('mp-oth@test.bt', 'Other') as o \gset
update public.profiles set entry_category_id = (select id from public.exam_categories where code = 'administrative') where id in (:'s', :'o');
select id as p3 from public.exam_papers where code = 'me-general-3' \gset

-- A published Paper III essay, a mock paper with it, and one marked answer for the student
insert into public.questions (id, stage, question_type, stem, marks, paper_id, status, origin, verified_by, verified_at)
values ('00000000-0000-4000-8000-0000000a0001', 'ME', 'essay', 'Discuss the role of local governments in Bhutan (progress test).', 20, :'p3', 'verified', 'original', :'o', now());
update public.questions set status = 'published' where id = '00000000-0000-4000-8000-0000000a0001';
insert into public.exams (id, slug, title, stage, kind, paper_id, duration_minutes, total_marks, status)
values ('00000000-0000-4000-8000-0000000a0002', 'mp-mock', 'Paper III mock', 'ME', 'mock', :'p3', 60, 20, 'draft');
insert into public.exam_questions (id, exam_id, question_id, position) values ('00000000-0000-4000-8000-0000000a0003', '00000000-0000-4000-8000-0000000a0002', '00000000-0000-4000-8000-0000000a0001', 1);
update public.exams set status = 'published' where id = '00000000-0000-4000-8000-0000000a0002';
insert into public.exam_attempts (id, exam_id, user_id, status, submitted_at, deadline_at)
values ('00000000-0000-4000-8000-0000000a0004', '00000000-0000-4000-8000-0000000a0002', :'s', 'submitted', now(), now() + interval '1 hour');
insert into public.attempt_answers (id, attempt_id, exam_question_id, text_answer)
values ('00000000-0000-4000-8000-0000000a0005', '00000000-0000-4000-8000-0000000a0004', '00000000-0000-4000-8000-0000000a0003', 'An answer.');
insert into public.evaluations (answer_id, method, evaluator_id, status, score, max_score, completed_at)
values ('00000000-0000-4000-8000-0000000a0005', 'expert', :'o', 'completed', 12, 20, now());

set local role authenticated;
select tests.login(:'s');
select tests.assert(jsonb_array_length(public.my_me_progress()) = 3, 'three papers for the student''s category');
select tests.assert((select array_agg((x ->> 'number')::int order by ord) from jsonb_array_elements(public.my_me_progress()) with ordinality t(x, ord)) = array[1, 2, 3], 'papers in order I, II, III');
select tests.assert((select (x ->> 'marked')::int = 1 and (x ->> 'recent')::numeric = 60 and (x ->> 'weight')::numeric = 40
  from jsonb_array_elements(public.my_me_progress()) x where (x ->> 'number')::int = 3), 'Paper III: one marked answer, 60%, weight 40');
select tests.assert((select (x -> 'mocks' -> 0 ->> 'pct')::numeric = 60 and (x ->> 'mock_ready')::boolean = false
  from jsonb_array_elements(public.my_me_progress()) x where (x ->> 'number')::int = 3), 'mock attempt scored; no personal mock until the pattern is known');
select tests.assert((select (x ->> 'marked')::int = 0 and x ->> 'recent' is null
  from jsonb_array_elements(public.my_me_progress()) x where (x ->> 'number')::int = 1), 'Paper I not started');
select tests.login(:'o');
select tests.assert((select (x ->> 'marked')::int from jsonb_array_elements(public.my_me_progress()) x where (x ->> 'number')::int = 3) = 0, 'another student sees only their own answers');
rollback;
