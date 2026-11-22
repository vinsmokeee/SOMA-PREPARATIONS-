begin;
select tests.create_user('ca-free@test.bt', 'Free') as f \gset
select tests.create_user('ca-paid@test.bt', 'Paid') as p \gset
select tests.create_user('ca-boss@test.bt') as b \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
insert into public.entitlements (user_id, package_id) values (:'p', (select id from public.packages where slug = 'pe-premium'));

-- The pipeline (server key) records test articles and stories. Test data only — not real news.
select id as src from public.ca_sources where name = 'Kuensel' \gset
insert into public.ca_items (id, title, url, area, category_id, verification, confidence, status, pipeline_status, auto_published, published_at, feature_date, summary, importance)
values ('ca000000-0000-4000-8000-000000000001', 'TEST story recent', 'https://example.test/recent', 'bhutan', (select id from public.ca_categories where slug = 'gmc'),
        'official', 'high', 'published', 'published', true, now() - interval '1 day', public.bhutan_today(), 'Test summary', 90),
       ('ca000000-0000-4000-8000-000000000002', 'TEST story old', 'https://example.test/old', 'world', (select id from public.ca_categories where slug = 'economy'),
        'corroborated', 'high', 'published', 'published', true, now() - interval '20 days', public.bhutan_today() - 20, 'Old summary', 70),
       ('ca000000-0000-4000-8000-000000000003', 'TEST story held', 'https://example.test/held', 'bhutan', null,
        'developing', 'low', 'draft', 'held', false, null, null, 'Held summary', 50);
insert into public.ca_articles (source_id, url, title, snippet, body, fingerprint, story_id, state)
values (:'src', 'https://example.test/a1', 'TEST headline one', 'snippet', 'internal body text', 'test headline one', 'ca000000-0000-4000-8000-000000000001', 'grouped'),
       (:'src', 'https://example.test/a2', 'TEST headline old', 'snippet', null, 'test headline old', 'ca000000-0000-4000-8000-000000000002', 'grouped');
-- Published requires a reviewer or the automatic flag
select tests.assert_fails($$insert into public.ca_items (title, url, status) values ('x', 'https://example.test/x', 'published')$$, 'publishing needs review or auto flag');

-- Two published questions on the recent story; one is the Question of the Day
do $$
declare q uuid; i int;
begin
  for i in 1..2 loop
    insert into public.questions (stage, question_type, stem, explanation, subject_id, origin, ca_item_id, status, auto_published)
    values ('PE', 'mcq', 'TEST current-affairs question ' || i, 'Because.', (select id from public.subjects where slug = 'general-awareness-current-affairs'),
            'current_affairs', 'ca000000-0000-4000-8000-000000000001', 'verified', true) returning id into q;
    insert into public.question_options (question_id, label, body, is_correct, position) values (q, 'A', 'right', true, 1), (q, 'B', 'wrong', false, 2);
    update public.questions set status = 'published' where id = q;
    if i = 1 then insert into public.ca_daily (day, question_id) values (public.bhutan_today(), q); end if;
  end loop;
end $$;

-- Visitors (not signed in) see the last 7 days only, never raw articles or held stories
set local role anon;
select tests.login(null);
select tests.assert((select count(*) from public.ca_items) = 1, 'anon sees only the recent published story');
select tests.assert(jsonb_array_length((public.ca_today()) -> 'items') = 1, 'today feed has the featured story');
select tests.assert(((public.ca_today()) -> 'question' ->> 'stem') like 'TEST current-affairs question%', 'question of the day shown');
select tests.assert((select count(*) from public.ca_item_sources('ca000000-0000-4000-8000-000000000001')) = 1, 'sources of recent story visible');
select tests.assert((select count(*) from public.ca_item_sources('ca000000-0000-4000-8000-000000000002')) = 0, 'sources of old story hidden');
select tests.assert(public.ca_question_count('ca000000-0000-4000-8000-000000000001') = 2, 'question count shown');

-- Free student
set local role authenticated;
select tests.login(:'f');
select tests.assert((select count(*) from public.ca_items) = 1, 'free account: last 7 days only');
select tests.assert((select count(*) from public.ca_articles) = 0, 'students never read raw articles');
select tests.assert((select count(*) from public.ca_archive()) = 1, 'archive limited for free account');
select public.start_question_of_day() as qa \gset
select tests.assert(jsonb_array_length(public.get_attempt_paper(:'qa') -> 'questions') = 1, 'question of the day opens for free account');
select tests.assert(public.start_question_of_day() = :'qa'::uuid, 'question of the day resumes the same attempt');
select tests.assert((public.my_question_of_day() ->> 'answered')::boolean = false, 'not answered yet');
-- Left without answering: the blank submission does not block a fresh try
select public.submit_attempt(:'qa');
select public.start_question_of_day() as qb \gset
select tests.assert(:'qb'::uuid <> :'qa'::uuid, 'a blank Question of the Day starts again');
select tests.assert((public.get_attempt_paper(:'qb') -> 'attempt' ->> 'status') = 'in_progress', 'the new try is open');
-- Answered: the button opens the result and the page knows it
select public.save_answer(:'qb', (public.get_attempt_paper(:'qb') -> 'questions' -> 0 ->> 'exam_question_id')::uuid,
  _selected_option_id => (public.get_attempt_paper(:'qb') -> 'questions' -> 0 -> 'options' -> 0 ->> 'id')::uuid, _time_spent_delta => 5);
select public.submit_attempt(:'qb');
select tests.assert(public.start_question_of_day() = :'qb'::uuid, 'after answering, the result opens');
select tests.assert((public.my_question_of_day() ->> 'answered')::boolean and (public.my_question_of_day() ->> 'attempt_id')::uuid = :'qb'::uuid, 'the page knows it is answered');
select tests.assert(public.create_ca_item_practice('ca000000-0000-4000-8000-000000000001') is not null, 'recent story practice open to free account');
select tests.assert_fails($$select public.create_ca_item_practice('ca000000-0000-4000-8000-000000000002')$$, 'old story practice needs a package');
select tests.assert_fails($$select public.create_ca_practice(10)$$, 'personalised practice needs a package');
select tests.assert_fails($$insert into public.ca_items (title, url) values ('hack', 'https://example.test/hack')$$, 'students cannot write stories');
select tests.assert_fails($$select public.ca_overview()$$, 'students cannot see the admin overview');

-- Paid student: archive and personalised practice
select tests.login(:'p');
select tests.assert((select count(*) from public.ca_items) = 2, 'package unlocks the archive');
select tests.assert((select count(*) from public.ca_archive(null, 'world')) = 1, 'archive filters by area');
select tests.assert((select count(*) from public.ca_item_sources('ca000000-0000-4000-8000-000000000002')) = 1, 'old sources visible with package');
select public.create_ca_practice(10) as pa \gset
select tests.assert(jsonb_array_length(public.get_attempt_paper(:'pa') -> 'questions') = 2, 'personalised practice uses published CA questions');
select tests.assert((select count(*) from public.ca_items where pipeline_status = 'held') = 0, 'held stories stay hidden');

-- Staff
select tests.login(:'b');
select tests.assert((select count(*) from public.ca_items) = 3, 'staff see every story');
select tests.assert(((public.ca_overview()) ->> 'held')::int = 1, 'overview counts held stories');
select tests.assert((select count(*) from public.ca_articles) = 2, 'staff see articles');
select tests.assert_fails($$select token from public.ca_scheduler$$, 'scheduler token is not readable by any signed-in user');
-- Question of the Day in the daily plan: PE students only; ME students read the news (founder, 20 Nov 2026)
reset role;
select tests.create_user('ca-me@test.bt', 'ME') as m \gset
select tests.create_user('ca-pe@test.bt', 'PE') as pe \gset
update public.profiles set pathway = 'ME' where id = :'m';
update public.profiles set pathway = 'PE' where id = :'pe';
set local role authenticated;
select tests.login(:'m'); select public.ensure_today_plan();
select tests.login(:'pe'); select public.ensure_today_plan();
reset role;
select tests.assert(not exists (select 1 from public.daily_plan_items i join public.daily_plans p on p.id = i.plan_id where p.user_id = :'m' and i.kind = 'ca'), 'ME daily plan has no Question of the Day');
select tests.assert(exists (select 1 from public.daily_plan_items i join public.daily_plans p on p.id = i.plan_id where p.user_id = :'pe' and i.kind = 'ca'), 'PE daily plan keeps the Question of the Day');
select tests.assert((select features::text ilike '%Current affairs: Daily Bhutan and world news%' and features::text not ilike '%quiz%' from public.packages where slug = 'me-premium'), 'ME Premium lists news, not quizzes');
rollback;
