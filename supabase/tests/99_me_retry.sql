begin;
select tests.create_user('rt-stu@test.bt', 'R') as s \gset
select tests.create_user('rt-oth@test.bt', 'O') as o \gset
update public.profiles set entry_category_id = (select id from public.exam_categories where code = 'administrative'), entry_confirmed_at = now() where id in (:'s', :'o');
insert into public.entitlements (user_id, package_id) select u, (select id from public.packages where slug = 'me-premium') from unnest(array[:'s', :'o']::uuid[]) u;
select id as p3 from public.exam_papers where code = 'me-general-3' \gset
create temp table qs as select gen_random_uuid() as id, g as n from generate_series(1, 3) g;
grant select on qs to authenticated;
insert into public.questions (id, stage, question_type, stem, marks, paper_id, status, origin, verified_by, verified_at)
select id, 'ME', 'essay', 'Retry test essay number ' || n, 20, :'p3', 'verified', 'original', :'o', now() from qs;
update public.questions set status = 'published' where id in (select id from qs);
-- The student's submitted mock: q1 marked 15/20, q2 marked 5/20, q3 skipped
insert into public.exams (id, slug, title, stage, kind, paper_id, duration_minutes, total_marks, status, owner_id)
values ('00000000-0000-4000-8000-0000000b0001', 'mock-rt', 'Paper III mock', 'ME', 'mock', :'p3', 180, 60, 'draft', :'s');
insert into public.exam_questions (exam_id, question_id, position, marks) select '00000000-0000-4000-8000-0000000b0001', id, n, 20 from qs;
update public.exams set status = 'published' where id = '00000000-0000-4000-8000-0000000b0001';
insert into public.exam_attempts (id, exam_id, user_id, status, submitted_at, deadline_at)
values ('00000000-0000-4000-8000-0000000b0002', '00000000-0000-4000-8000-0000000b0001', :'s', 'submitted', now(), now() + interval '1 hour');
insert into public.attempt_answers (id, attempt_id, exam_question_id, text_answer)
select gen_random_uuid(), '00000000-0000-4000-8000-0000000b0002', eq.id, 'An answer.' from public.exam_questions eq join qs on qs.id = eq.question_id
where eq.exam_id = '00000000-0000-4000-8000-0000000b0001' and qs.n in (1, 2);
insert into public.evaluations (answer_id, method, evaluator_id, status, score, max_score, completed_at)
select aa.id, 'expert', :'o', 'completed', case qs.n when 1 then 15 else 5 end, 20, now()
from public.attempt_answers aa join public.exam_questions eq on eq.id = aa.exam_question_id join qs on qs.id = eq.question_id
where aa.attempt_id = '00000000-0000-4000-8000-0000000b0002';

set local role authenticated;
select tests.login(:'s');
select tests.assert((select array_agg(coalesce(reason, 'ok') order by pos) from public.me_attempt_mistakes('00000000-0000-4000-8000-0000000b0002')) = array['ok', 'low', 'skipped'],
  'mistakes: below half marks and skipped; a good answer is not a mistake');
select public.start_me_retry('00000000-0000-4000-8000-0000000b0002') as r \gset
reset role;
select tests.assert((select count(*) = 2 and bool_and(e.untimed) and min(e.kind::text) = 'practice' and min(e.retry_of_attempt::text) = '00000000-0000-4000-8000-0000000b0002'
  from public.exam_attempts at join public.exams e on e.id = at.exam_id join public.exam_questions eq on eq.exam_id = e.id where at.id = :'r'),
  'the retry is an untimed practice with only the two mistakes');
-- The student rewrites q2 and gets 12/20
insert into public.attempt_answers (id, attempt_id, exam_question_id, text_answer)
select gen_random_uuid(), :'r', eq.id, 'A better answer.' from public.exam_attempts at join public.exam_questions eq on eq.exam_id = at.exam_id join qs on qs.id = eq.question_id
where at.id = :'r' and qs.n = 2;
insert into public.evaluations (answer_id, method, evaluator_id, status, score, max_score, completed_at)
select aa.id, 'expert', :'o', 'completed', 12, 20, now() from public.attempt_answers aa where aa.attempt_id = :'r';
update public.exam_attempts set status = 'submitted', submitted_at = now() where id = :'r';
set local role authenticated;
select tests.login(:'s');
select tests.assert((select before_score = 5 and now_score = 12 from public.me_retry_compare(:'r') c join qs on qs.id = c.question_id where qs.n = 2), 'before 5/20, now 12/20');
select tests.login(:'o');
select tests.assert(not exists (select 1 from public.me_attempt_mistakes('00000000-0000-4000-8000-0000000b0002')), 'another student cannot see these mistakes');
select tests.assert_fails($$select public.start_me_retry('00000000-0000-4000-8000-0000000b0002')$$, 'nor retry them');
rollback;
