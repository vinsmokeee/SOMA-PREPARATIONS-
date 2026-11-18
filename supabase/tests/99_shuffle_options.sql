begin;
select tests.create_user('so-stu@test.bt', 'Student') as s \gset
select tests.create_user('so-boss@test.bt') as b \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
set local role authenticated;
select tests.login(:'b');
-- An ordinary question (correct answer stored first) and one whose options refer to a printed picture.
select public.save_question(null,
  jsonb_build_object('stage','PE','question_type','mcq','stem','Shuffle test: which is a mammal?','explanation','x','is_free_sample', true,'subject_id',(select id from public.subjects where slug = 'data-interpretation')),
  '[{"body":"Yak","is_correct":true},{"body":"Trout","is_correct":false},{"body":"Eagle","is_correct":false},{"body":"Frog","is_correct":false}]'::jsonb) as q1 \gset
select public.save_question(null,
  jsonb_build_object('stage','PE','question_type','mcq','stem','Shuffle test: picture question','explanation','x','is_free_sample', true,'subject_id',(select id from public.subjects where slug = 'data-interpretation')),
  '[{"body":"ཀ","is_correct":false},{"body":"ཁ","is_correct":true},{"body":"ག","is_correct":false},{"body":"ང","is_correct":false}]'::jsonb) as q2 \gset
select public.save_question(null,
  jsonb_build_object('stage','PE','question_type','mcq','stem','Shuffle test: conclusions','explanation','x','is_free_sample', true,'subject_id',(select id from public.subjects where slug = 'data-interpretation')),
  '[{"body":"Only I","is_correct":false},{"body":"Only II","is_correct":true},{"body":"Both I and II","is_correct":false},{"body":"Neither I nor II","is_correct":false}]'::jsonb) as q3 \gset
select public.review_question(x, 'submit'), public.review_question(x, 'verify'), public.review_question(x, 'publish') from unnest(array[:'q1', :'q2', :'q3']::uuid[]) x;
insert into public.exams (slug, title, stage, kind, duration_minutes, is_free, status) values ('so-sample', 'Shuffle test', 'PE', 'practice', 10, true, 'draft') returning id as ex \gset
insert into public.exam_questions (exam_id, question_id, position) values (:'ex', :'q1', 1), (:'ex', :'q2', 2), (:'ex', :'q3', 3);
update public.exams set status = 'published' where id = :'ex';

select tests.login(:'s');
select tests.assert_fails(format($$select public.attempt_options(gen_random_uuid(), %L, true)$$, :'q1'), 'students cannot call the option helper directly');

-- Twelve attempts: collect where the correct answer of the ordinary question lands.
create temp table pos (a uuid, letter text, labels text, bodies text, fixed2 text, fixed3 text);
grant all on pos to authenticated;
do $$
declare _a uuid; _p jsonb; _q jsonb;
begin
  for i in 1..12 loop
    _a := public.start_attempt((select id from public.exams where slug = 'so-sample'));
    _p := public.get_attempt_paper(_a);
    select x into _q from jsonb_array_elements(_p -> 'questions') x where x ->> 'stem' like '%mammal%';
    insert into pos select _a,
      (select o ->> 'label' from jsonb_array_elements(_q -> 'options') o where o ->> 'body' = 'Yak'),
      (select string_agg(o ->> 'label', '' ) from jsonb_array_elements(_q -> 'options') o),
      (select string_agg(o ->> 'body', ',') from jsonb_array_elements(_q -> 'options') o),
      (select string_agg((o ->> 'label') || (o ->> 'body'), ',') from jsonb_array_elements(_p -> 'questions') x, jsonb_array_elements(x -> 'options') o where x ->> 'stem' like '%picture%'),
      (select string_agg(o ->> 'body', ',') from jsonb_array_elements(_p -> 'questions') x, jsonb_array_elements(x -> 'options') o where x ->> 'stem' like '%conclusions%');
    perform public.submit_attempt(_a);
  end loop;
end $$;
select tests.assert((select bool_and(labels = 'ABCD') from pos), 'letters always run A, B, C, D in the order shown');
select tests.assert((select count(distinct letter) from pos) >= 2, 'the correct answer is not always in the same place');
select tests.assert((select count(distinct bodies) from pos) >= 3, 'different attempts see different orders');
select tests.assert((select bool_and(fixed2 = 'Aཀ,Bཁ,Cག,Dང') from pos), 'options that name letters in a picture keep their order');
select tests.assert((select bool_and(fixed3 = 'Only I,Only II,Both I and II,Neither I nor II') from pos), '"only / both / neither" options keep their order');
select tests.assert((select bool_and(
  (select string_agg((o ->> 'label') || (o ->> 'body'), ',') from jsonb_array_elements(public.get_attempt_result(p.a) -> 'questions') x, jsonb_array_elements(x -> 'options') o where x ->> 'stem' like '%mammal%')
  = (select string_agg(l || b, ',') from unnest(string_to_array(p.labels, NULL), string_to_array(p.bodies, ',')) as t(l, b))) from pos p),
  'the result shows the same order and letters as the paper');
select tests.assert((select bool_and((select (o ->> 'is_correct')::boolean from jsonb_array_elements(public.get_attempt_result(p.a) -> 'questions') x, jsonb_array_elements(x -> 'options') o where o ->> 'body' = 'Yak')) from pos p),
  'the answer key still marks the right option');
rollback;
