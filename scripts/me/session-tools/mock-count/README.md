# How many fresh mocks can a student take?

Run each SQL file with `q.sh` and save the result as JSON in one folder (`sec.json`, `q.json`, `names.json`), then
`python3 -I calc.py <folder>`. For every ME paper and every subject (specialisation/ Paper II group) it prints how many
mocks can be built without repeating a question: "now" uses published questions only, "after-publish" counts drafts too.
It follows `start_paper_mock`/`pick_me_groups`: pattern from `paper_sections_for_me` (specialisation -> group -> shared),
a passage/case study counts as one item, topic sections are filled first. After that number, mocks still start but
repeat questions (the picker puts unseen questions first). PE (`pe.sql`): a premium mock is 100 MCQs, 25 per section.
First run: 25 Nov 2026 (see docs/HANDOVER.md).
