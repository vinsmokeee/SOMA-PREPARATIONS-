# Past papers → question bank

Source of truth for the BCSE 2010 and 2011 PE papers (RCSC, supplied by the founder as PDFs).

- `q<year>_english.py`, `q<year>_ps_di.py`: every question as data: wording, options, answer (0 = A),
  confidence (high / medium / low), explanation, reviewer note, and `fig` = (page, x0, y0, x1, y1) at 200 dpi
  for charts and figures shown as pictures.
- `dz<year>.py`: Dzongkha questions are pictures of the original print (`dzcrop.py` cuts them out), with the
  passage area and any answers chosen so far. Unlisted answers are left for a Dzongkha speaker.
- `build.py` writes `public/papers/pe-<year>/*.webp` and `supabase/data/past_papers_pe_2010_2011.sql`
  (questions as `awaiting_review` drafts, `origin = historical_official`, linked to `historical_papers` and
  `source_documents`, with a review comment giving the answer confidence).

Rebuild: put the PDFs in `<work>/papers/pe2010.pdf` and `pe2011.pdf`, run
`python3 dzcrop.py <pdf> <year> <first page> <last page> <work>/papers/dzq 26` for each paper, then
`python3 -I build.py <repo>` from `<work>/qb` (the script expects `../papers`).
