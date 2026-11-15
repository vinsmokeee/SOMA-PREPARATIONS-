#!/usr/bin/env bash
# Applies all migrations to a throw-away local PostgreSQL database and runs the
# SQL test suite in supabase/tests. Requires a local PostgreSQL (psql) server.
#   DB_TEST_URL=postgresql://postgres:postgres@localhost:5432 npm run test:db   (default)
set -euo pipefail
cd "$(dirname "$0")/../.."
BASE_URL="${DB_TEST_URL:-postgresql://postgres:postgres@localhost:5432}"
DB=soma_test
PSQL=(psql -X -q -v ON_ERROR_STOP=1)

psql_base() { "${PSQL[@]}" "$BASE_URL/postgres" "$@"; }
psql_db() { "${PSQL[@]}" "$BASE_URL/$DB" "$@"; }

psql_base -c "drop database if exists $DB with (force)" -c "create database $DB"
psql_db -f scripts/db/supabase-stub.sql
for f in supabase/migrations/*.sql; do
  echo "→ migrate $(basename "$f")"
  psql_db -f "$f"
done
if [ -f supabase/seed.sql ]; then echo "→ seed"; psql_db -f supabase/seed.sql; fi
fail=0
for t in supabase/tests/*.sql; do
  if psql_db -f "$t" > /dev/null; then echo "✓ $(basename "$t")"; else echo "✗ $(basename "$t")"; fail=1; fi
done
exit $fail
