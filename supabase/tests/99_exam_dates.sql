begin;
select tests.create_user('ed-a@test.bt', 'A') as a \gset
select tests.create_user('ed-b@test.bt', 'B') as b \gset
set local role authenticated;
select tests.login(:'a');
update public.profiles set pe_exam_date = date '2027-03-25' where id = :'a';
select tests.assert((select pe_exam_date from public.profiles where id = :'a') = date '2027-03-25', 'a student saves their own PE date');
select tests.assert_fails(format($$update public.profiles set pe_exam_date = date '1990-01-01' where id = %L$$, :'a'), 'impossible dates are refused');
update public.profiles set pe_exam_date = date '2027-04-01' where id = :'b';
select tests.login(:'b');
select tests.assert((select pe_exam_date from public.profiles where id = :'b') is null, 'nobody can set another student''s date');
rollback;
