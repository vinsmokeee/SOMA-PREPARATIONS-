begin;
select tests.create_user('pp-a@test.bt', 'A') as a \gset
select tests.create_user('pp-b@test.bt', 'B') as b \gset
select tests.create_user('pp-free@test.bt', 'Free') as f \gset
update public.profiles set entry_category_id = (select id from public.exam_categories where code = 'administrative') where id in (:'a', :'b', :'f');
insert into public.entitlements (user_id, package_id) select u, (select id from public.packages where slug = 'me-premium') from unnest(array[:'a', :'b']::uuid[]) u;
select id as p3 from public.exam_papers where code = 'me-general-3' \gset
create temp table qs as select gen_random_uuid() as id, g as n from generate_series(1, 4) g;
grant select on qs to authenticated;
insert into public.questions (id, stage, question_type, stem, marks, paper_id, status, origin, verified_by, verified_at)
select id, 'ME', 'essay', 'Personal practice test essay number ' || n, 10, :'p3', 'verified', 'original', :'b', now() from qs;
update public.questions set status = 'published' where id in (select id from qs);
-- A daily current-affairs question attached to the paper is practised in News, not as a section of the paper
insert into public.questions (stage, question_type, stem, marks, paper_id, status, origin, verified_by, verified_at)
values ('ME', 'short_answer', 'A current affairs short answer question for the test', 5, :'p3', 'verified', 'current_affairs', :'b', now());
update public.questions set status = 'published' where origin = 'current_affairs' and paper_id = :'p3' and status = 'verified';

set local role authenticated;
-- Practice: a question the student has not seen, then another
select tests.login(:'a');
select public.start_paper_practice(:'p3', 'essay') as a1 \gset
select public.start_paper_practice(:'p3', 'essay') as a2 \gset
reset role;
create temp table seen_a as select eq.question_id from public.exam_attempts at join public.exam_questions eq on eq.exam_id = at.exam_id where at.id in (:'a1', :'a2');
select tests.assert((select count(distinct question_id) from seen_a) = 2, 'a student gets a new question each time');
grant select on seen_a to authenticated;
set local role authenticated;
-- Another student gets questions the first one has not had
select tests.login(:'b');
select public.start_paper_practice(:'p3', 'essay') as b1 \gset
reset role;
select tests.assert((select eq.question_id from public.exam_attempts at join public.exam_questions eq on eq.exam_id = at.exam_id where at.id = :'b1') not in (select question_id from seen_a),
  'another student gets a question fewer students have had');
set local role authenticated;
-- Free students cannot practise ME
select tests.login(:'f');
select tests.assert_fails(format($$select public.start_paper_practice(%L, 'essay')$$, :'p3'), 'ME practice needs ME Premium');
select tests.login(:'a');
select tests.assert(not exists (select 1 from jsonb_array_elements(public.my_me_progress()) x, jsonb_array_elements(x -> 'types') t
  where x ->> 'id' = :'p3' and t ->> 'type' = 'short_answer'), 'news questions are not listed as a section of the paper');
select tests.assert_fails(format($$select public.start_paper_practice(%L, 'short_answer')$$, :'p3'), 'news questions are not picked for paper practice');

-- Mock: none until the pattern is known
select tests.login(:'a');
select tests.assert(not public.paper_mock_ready(:'p3'), 'no mock without a pattern');
select tests.assert_fails(format($$select public.start_paper_mock(%L)$$, :'p3'), 'no mock without a pattern (start)');
reset role;
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source)
values (:'p3', 1, 'Essays', 'essay', 2, 20, 1, 'test');
set local role authenticated;
select tests.login(:'a');
select tests.assert(public.paper_mock_ready(:'p3'), 'mock ready once the pattern is known and the bank is big enough');
select public.start_paper_mock(:'p3') as m1 \gset
select tests.assert(public.start_paper_mock(:'p3') = :'m1'::uuid and (select count(*) = 1 from public.exams where owner_id = :'a'::uuid and kind = 'mock'), 'starting the same paper again reopens the running mock (no second mock)');
reset role;
select tests.assert((select count(*) = 2 and bool_and(eq.is_optional) and bool_and(eq.question_id not in (select question_id from seen_a))
  from public.exam_attempts at join public.exam_questions eq on eq.exam_id = at.exam_id where at.id = :'m1'), 'the mock follows the pattern with questions the student has not seen');
select tests.assert((select e.owner_id = :'a'::uuid and e.kind = 'mock' and e.total_marks = 100 and e.duration_minutes = 195 and e.reading_minutes = 15 from public.exam_attempts at join public.exams e on e.id = at.exam_id where at.id = :'m1'),
  'the mock is the student''s own, marks and time follow the paper (3 hours + 15 minutes reading)');
-- Choosing questions: exactly "answer any N" per section, only questions of this mock, only by the student
set local role authenticated;
select tests.login(:'a');
select tests.assert_fails(format($$select public.choose_mock_questions(%L, '{}')$$, :'m1'), 'must choose the right number');
select tests.assert_fails(format($$select public.choose_mock_questions(%L, '{not-a-group}')$$, :'m1'), 'only questions of this mock');
select tests.assert((select count(*) = 2 and bool_and(x ->> 'choose_any' = '1') from jsonb_array_elements(public.get_attempt_paper(:'m1') -> 'questions') x), 'paper shows the choice rule');
select public.choose_mock_questions(:'m1', array[(select x ->> 'choice_group' from jsonb_array_elements(public.get_attempt_paper(:'m1') -> 'questions') x limit 1)]);
select tests.assert(jsonb_array_length(public.get_attempt_paper(:'m1') -> 'attempt' -> 'chosen_groups') = 1, 'the choice is saved');
-- A question not chosen is listed as such and can never be uploaded, read or evaluated (no AI cost)
select x ->> 'exam_question_id' as unchosen from jsonb_array_elements(public.get_attempt_paper(:'m1') -> 'questions') x
  where not (x ->> 'choice_group' = any (array(select jsonb_array_elements_text(public.get_attempt_paper(:'m1') -> 'attempt' -> 'chosen_groups')))) \gset
select x ->> 'exam_question_id' as chosen from jsonb_array_elements(public.get_attempt_paper(:'m1') -> 'questions') x
  where x ->> 'choice_group' = any (array(select jsonb_array_elements_text(public.get_attempt_paper(:'m1') -> 'attempt' -> 'chosen_groups'))) \gset
select tests.assert(array(select public.attempt_unchosen_questions(:'m1')) = array[:'unchosen'::uuid], 'the question not chosen is listed for the result page');
select tests.assert_fails(format($$select public.ensure_written_answer(%L, %L)$$, :'m1', :'unchosen'), 'no answer sheet for a question not chosen');
select tests.assert(public.ensure_written_answer(:'m1', :'chosen') is not null, 'the chosen question still takes an answer sheet');
-- Mock answers are marked straight away, like practice (founder: no waiting for hours)
select public.save_answer(:'m1', :'chosen', null, false, 'A typed essay answer for the mock test about governance.');
select public.submit_attempt(:'m1');
select public.request_answer_evaluation((select id from public.attempt_answers where attempt_id = :'m1' and exam_question_id = :'chosen')) as mev \gset
select tests.assert((select delivery from public.evaluations where id = :'mev') = 'instant', 'mock answers are marked straight away');
select tests.login(:'b');
select tests.assert_fails(format($$select public.choose_mock_questions(%L, '{}')$$, :'m1'), 'only the student chooses');
reset role;
update public.paper_blueprint_sections set question_count = 5, answer_any = null where paper_id = :'p3';
set local role authenticated;
select tests.login(:'a');
select tests.assert(not public.paper_mock_ready(:'p3'), 'not ready when the bank is too small');
select tests.assert_fails(format($$select public.start_paper_mock(%L)$$, :'p3'), 'not enough questions for the pattern');
-- Parts of one RCSC question (passage_group) go into a mock together and in order; practice gives one part
reset role;
update public.paper_blueprint_sections set question_count = 1, answer_any = null where paper_id = :'p3';
update public.questions set passage_group = 'me-test-grp', passage_position = n - 2 from qs where qs.id = questions.id and n in (3, 4);
update public.questions set passage_group = 'me-test-grp2', passage_position = n from qs where qs.id = questions.id and n in (1, 2);
set local role authenticated;
select tests.login(:'b');
select public.start_paper_mock(:'p3') as m2 \gset
reset role;
select tests.assert((select count(*) = 2 and count(distinct q.passage_group) = 1
    and string_agg(q.passage_position::text, ',' order by eq.position) = '1,2'
  from public.exam_attempts at join public.exam_questions eq on eq.exam_id = at.exam_id join public.questions q on q.id = eq.question_id where at.id = :'m2'),
  'a mock question brings all its parts, in order');
set local role authenticated;
rollback;
