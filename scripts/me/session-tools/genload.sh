#!/bin/bash
# usage: genload.sh <module>... : build data SQL, apply to local test DB, then load live
set -e
cd /home/user/SOMA-PREPARATIONS-
S=/tmp/claude-0/-home-user-SOMA-PREPARATIONS-/1e5440e4-299a-59c5-8896-aa7b23e5c884/scratchpad; DB=postgresql://postgres:postgres@localhost:5432/soma_test
A=https://api.supabase.com/v1/projects/ihmyqurrogrodtodxfef
service postgresql start >/dev/null 2>&1 || true
for M in "$@"; do
  python3 -I scripts/me/build_me_questions.py scripts/me/$M.py supabase/data/$M.sql | tail -1
  sed 's/ on commit drop//' supabase/data/$M.sql > $S/loc_$M.sql
  psql -X -q -v ON_ERROR_STOP=1 $DB -f $S/loc_$M.sql > /dev/null && echo "local ok $M"
  python3 -c "import json,sys;print(json.dumps({'query':open(sys.argv[1]).read().replace(' on commit drop','')}))" supabase/data/$M.sql > $S/q.json
  echo "live $M: $(curl -sS -X POST $A/database/query -H 'Authorization: Bearer proxy-injected' -H 'Content-Type: application/json' --data @$S/q.json)"
done
