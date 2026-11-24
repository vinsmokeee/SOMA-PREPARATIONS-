#!/bin/bash
# usage: localclear.sh "<batch name>" : delete one batch from the LOCAL test DB only
psql -X -q postgresql://postgres:postgres@localhost:5432/soma_test -c "delete from public.questions where ai_review->>'batch' = '$1';"
