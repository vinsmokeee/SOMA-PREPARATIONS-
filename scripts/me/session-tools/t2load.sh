#!/bin/bash
# usage: t2load.sh <module-name-without-.py>  - local check (as published, with a group student mock), then live load
set -e
cd /home/user/SOMA-PREPARATIONS-
S=/tmp/claude-0/-home-user-SOMA-PREPARATIONS-/1e5440e4-299a-59c5-8896-aa7b23e5c884/scratchpad; DB=postgresql://postgres:postgres@localhost:5432/soma_test
A=https://api.supabase.com/v1/projects/ihmyqurrogrodtodxfef; M=$1; G=$2; P=${PAPER:-me-technical-2}; CAT=${CAT:-technical}; SP=${SPEC:-}
service postgresql start >/dev/null 2>&1 || true
psql -X -q $DB -c "select tests.create_user('tv@test.bt','V') where not exists (select 1 from auth.users where email='tv@test.bt')" >/dev/null
V=$(psql -X -At $DB -c "select id from auth.users where email='tv@test.bt'")
python3 -I scripts/me/build_me_questions.py scripts/me/$M.py supabase/data/$M.sql
python3 -I scripts/me/build_me_questions.py scripts/me/$M.py $S/pub_$M.sql "'$V'::uuid" >/dev/null; sed -i 's/ on commit drop//' $S/pub_$M.sql
psql -X -q -v ON_ERROR_STOP=1 $DB -f $S/pub_$M.sql
psql -X -q $DB -c "select tests.create_user('grp-$G@test.bt','G') where not exists (select 1 from auth.users where email='grp-$G@test.bt')" >/dev/null
U=$(psql -X -At $DB -c "select id from auth.users where email='grp-$G@test.bt'")
psql -X -q -v ON_ERROR_STOP=1 $DB -v u="$U" -v g="$G" -v p="$P" -v cat="$CAT" -v sp="$SP" <<'SQL'
update public.profiles set entry_category_id = (select id from public.exam_categories where code = :'cat'), subject_group_id = case when :'sp' = '' then (select id from public.subject_groups where code = :'g') end, specialisation_id = (select id from public.specialisations where code = nullif(:'sp','')), entry_confirmed_at = now() where id = :'u';
insert into public.entitlements (user_id, package_id) select :'u', (select id from public.packages where slug = 'me-premium') where not exists (select 1 from public.entitlements where user_id = :'u');
select id as p from public.exam_papers where code = :'p' \gset
set role authenticated;
select tests.login(:'u') \g /dev/null
select public.start_paper_mock(:'p') as m \gset
select count(*) as mock_questions, sum((x->>'marks')::numeric) as marks from jsonb_array_elements(public.get_attempt_paper(:'m') -> 'questions') x;
reset role;
select e.duration_minutes, e.total_marks from public.exam_attempts a join public.exams e on e.id = a.exam_id where a.id = :'m';
SQL
python3 -c "import json,sys;print(json.dumps({'query':open(sys.argv[1]).read().replace(' on commit drop','')}))" supabase/data/$M.sql > $S/q.json
curl -sS -X POST $A/database/query -H "Authorization: Bearer proxy-injected" -H "Content-Type: application/json" --data @$S/q.json; echo
python3 -c 'import json,sys;print(json.dumps({"query":"select count(*) from questions q join subject_groups g on g.id=q.subject_group_id where g.code=%s and q.paper_id=(select id from exam_papers where code=%s)" % (repr(sys.argv[1]), repr(sys.argv[2]))}))' $G $P > $S/q.json
curl -sS -X POST $A/database/query -H "Authorization: Bearer proxy-injected" -H "Content-Type: application/json" --data @$S/q.json; echo
