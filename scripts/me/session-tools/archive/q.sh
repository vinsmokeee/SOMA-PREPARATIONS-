#!/bin/bash
# usage: q.sh file.sql
python3 - "$1" <<'PY' | curl -s -X POST https://api.supabase.com/v1/projects/ihmyqurrogrodtodxfef/database/query -H "Authorization: Bearer proxy-injected" -H "Content-Type: application/json" --data-binary @-
import json,sys; print(json.dumps({"query":open(sys.argv[1]).read()}))
PY
