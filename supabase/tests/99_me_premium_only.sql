begin;
-- ME is Premium only: no free AI evaluations, no free ME samples or exams.
select tests.assert(coalesce((public.evaluation_config() ->> 'free_total')::int, 0) = 0, 'free accounts get no AI evaluations');
select tests.assert(not exists (select 1 from public.questions where stage = 'ME' and is_free_sample), 'no free ME sample questions');
select tests.assert(not exists (select 1 from public.exams where stage = 'ME' and is_free), 'no free ME exams');
rollback;
