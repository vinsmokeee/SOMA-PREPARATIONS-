# Session helper tools (paper loading)

Copied from the Claude session scratchpad on 24 Nov 2026 so the next session can carry on with the papers.
They were written for one session: several scripts hard-code the old scratchpad path
(`/tmp/claude-0/.../scratchpad`). In a new session, copy this folder into the new scratchpad and fix the `S=`
paths (`grep -l scratchpad *`) before use.

Main ones:
- `q.sh file.sql` - run SQL on the live Supabase project (through the session proxy).
- `audit.sql` - layout audit: pattern marks vs. marks in the bank (expected leftovers: Traditional Medicine, Clinical Counselling 2025).
- `genload.sh <module>...` - build a General/ other module's SQL, apply to the local test DB, then load live.
- `t2load.sh <module> <group>` - Paper II group loader with a local mock check.
- `localload.sh`, `localclear.sh "<batch>"` - local test DB only.
- `hashcheck.py <module.py>` - exact-stem clashes with live questions.
- `statcrop.py dir prefix page x0 y0 x1 y1 outname` - crop a figure from a rendered page (VW = view width).
- `*write.py`, `*parse.py`, `p1parts.py`, `p1emit.py` - per-subject parsers/ writers used for earlier batches.

Local test DB after a restart: `service postgresql start`, recreate `tests.create_user('tv@test.bt','V')`,
and load the 2025 pattern module of the paper locally before `t2load.sh`.

## archive/
Every other script and SQL file from the scratchpad of the long build session (Nov 2026): one-off live data fixes,
checks, screenshot scripts and per-batch parsers, kept so nothing done on the live database exists only in a wiped
folder. Generated copies of `supabase/data/*.sql` (loc_*/pub_*), the RCSC PDFs (copyright), page images and query
outputs were not kept. Treat these as history: re-read before re-running anything against live.
