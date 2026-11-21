begin;
select tests.assert(pg_get_functiondef('public.pick_me_groups(uuid, public.question_type, int, text[], text)'::regprocedure) like '%origin <> ''current_affairs''%',
  'mock picking leaves out current-affairs practice questions');
rollback;
