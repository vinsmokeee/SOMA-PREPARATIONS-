# Handover — read this first in a new conversation

Last updated: 2026-11-16. This note lets a new Claude session continue the work
without the previous chat. Keep it up to date at the end of every working session.

## Start here next session (updated 20 Nov 2026, Dzongkha category loading)

- **Waiting on the founder:** (1) a fluent Dzongkha check of ME Paper I (General) drafts, then publish batch "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1"; (2) Paper I writing time: cover says 3 h 45 min, instruction says 3 h (site uses 3 h).
- **Live and published:** ME General Paper III (42 parts) and Paper II (60) for Administrative / Finance / PGDE; mocks with reading time, choosing questions, one part per screen, MCQ section, Retry my mistakes, Exam Room badges.
- **Dzongkha category (20 Nov, drafts):** Paper II English & Current Affairs (33: essay 1 of 2 ×25, letter 1 of 2 ×20, comprehension passage A–D 5×4, translation Dz→En 25, 10 current-affairs MCQs; real CA Q3–6, Q8 left out) and Paper I Dzongkha & GK (44: essay 1 of 2 ×20, formal writing 1 of 2 ×15, comprehension 5×3, translation Chöke→Dzongkha 20, GK (a) 10×2 short, (b) 10×1 MCQ; uncertain items left out). Both 15 min reading (migrations 20261226000100/0200). Founder began publishing Paper II items. **RCSC Dzongkha PDFs use a font that drops letters (སློབ→སོབ, རྫོང→རོང, སྲོལ→སོལ, བླ་མ→བ་མ):** `scripts/me/dz_fix.py` repairs known words; it was also applied in place to General Paper I and Dzongkha Paper II drafts (they had copied the damaged spellings). Always run new Dzongkha text through it, then list remaining `Xོ` syllables to eyeball. **Dzongkha Paper III (Buddhist Studies) loaded (16 real questions only, drafts):** Bodhicaryāvatāra 1 of 2 ×10, Letter to a Friend 1 of 2 ×10, Poetics any 3 of 5 ×10, Madhyamakāvatāra/Kośa any 3 of 5 ×12, Chöjung 1 of 2 ×14; types essay/descriptive/analytical/long_answer/short_answer; reading 15 min (migration 20261226000300). Model answers are outlines; poetics items marked 'Claude NOT sure' — a lopen must check. A similar second set waits for that check.
- **Before saying a paper/ subject is missing (founder, 22 Nov 2026):** check ALL questions in the database - drafts and `awaiting_review` included, not only published/ live ones or the repo's module files (`scripts/me/load_*` loaders too). Query by specialisation/ paper/ year.
- **Whole passages only in mocks (20 Nov, migration 20261227000100):** the founder publishes drafts one by one; a passage/case-study group is used in mocks only when none of its questions is still waiting (`me_group_complete`). Practice is unchanged.
- **Technical Paper I 2025 loaded (20 Nov, 47 drafts; PDF sent by founder because rcsc.gov.bt now shows a 'Security Notice'/resets connections to Claude — do not work around it, ask the founder for PDFs):** case study (3×10, all), topical any 2 of 3 ×10, 20 GK MCQs (17 real + 8 new; Q13/18/20 left out), Dzongkha comprehension ka 8 + kha 4 + ga 3 + nga 5, translation En→Dz 15; reading 15 min (migration 20261227000200). Printed section marks add to 105 though the cover says 100 (founder told). This PDF's font ADDS a subjoined YA before ོ (སོན→སྱོན): `dz_fix.fix_extra_ya`.
- **Technical Paper I 2020-2024 loaded (20 Nov, 135 real-only drafts, batches 2-6):** modules `me_technical1_<year>.py` with `ADDS_TO_PAPER = True` (builder then keeps the 2025 pattern and skips the per-section count check; PATTERN/RUBRIC shared from the 2025 module). 2020 Dzongkha comprehension NOT loaded (PDF font lost most letters). Uncertain GK items left out per year (listed in each module docstring). `dz_fix.join_lines` joins wrapped PDF lines (Tibetan without spaces); the `ས་སོང→ས་སྟོང` rule is now word-bounded (it had broken ཉམས་སོང and ལག་ཤེས་སྦྱོང་བརྡར; fixed live in General Paper I).
- **Gotcha - two links between exams and exam_attempts (fixed 20 Nov):** `exams.retry_of_attempt` (migration 20261225000100) made PostgREST embeds between `exams` and `exam_attempts` ambiguous, so pages using `exams(...)` from an attempt (written answer page, test history, exam state) and `exam_attempts(count)` (admin exams) got an error and showed "Page not found". Always embed with the hint `exams!exam_attempts_exam_id_fkey(...)` / `exam_attempts!exam_attempts_exam_id_fkey(...)`. Before adding any new foreign key, grep for embeds between the two tables.
- **Launch plan (founder, 20 Nov):** no students until the whole project is built and tested. Only the founder and a few friends on the project test it. After that the founder buys a domain and publishes. Until then, drafts and work in progress are fine to load live; the specialist checks (Dzongkha, lopen, Drungtsho) are still needed before the public launch.
- **Repeated questions (21 Nov 2026, migration 20261231000200):** `question_appearances (question_id, year)` records every year RCSC asked a question (backfilled from `ai_review.source.year`; `build_me_questions.py` adds the year for each real question it loads). **When loading older years: if a question repeats an existing one (same or nearly same wording), do NOT load a duplicate - insert a `question_appearances` row for the existing question** (match by `content_hash` or by reading the stems). Students see a "Repeated question: asked by RCSC N times" label on results; `pick_me_groups` gives repeated questions a higher chance in mocks; founder's list at /admin/questions/repeated (`repeated_questions()`). Load older papers newest year first.
- **Sign-in loop fix (21 Nov 2026, migration 20261231000100):** two countries in a day (BT/IN border networks) no longer forces device confirmation (`security.config.max_countries_24h`, default 2); e-mail device and password-reset links use the implicit flow read by `/auth/link`, so they work in any browser or mail app. The Supabase e-mail templates still use `{{ .ConfirmationURL }}` (changing them needs dashboard permission).
- **Technical Paper III 2025 (20 Nov, drafts, founder sending ~49 PDFs in batches of 10):** Paper III has a pattern per specialisation (migration 20261230000100: `paper_blueprint_sections.specialisation_id`, `my_specialisation()`, `paper_sections_for_me` prefers specialisation → subject group → shared; reading 15 min; test 99_me_spec_patterns). Subject `subject-specialisation` (20261230000200). Loader: `SPECIALISATION`; modules `me_technical3_<spec>_2025.py` with shared `technical3_common.py` (STANDARD pattern 30 MCQ + 4 SAQ×5 + 1 of 2 case studies ×50; own patterns for Animal Science, Cardiology, Clinical Counselling). Batch 1 loaded: Aeronautical, Agriculture Engineering, Animal Science, Architecture (site plan picture), Automobile (3 pictures), Cardiology, Civil, Clinical Counselling. **Biotechnology set aside** (PDF kept in scratchpad; not loaded). Batch 2 loaded: Environmental Science, GIS, Electronics & Communication, Dental Surgery, Electrical (4 pictures), Food Science (own pattern: 5 SAQ × 4), Emergency Medical Response (ECG picture; own Section B 20+20+10), Conservator, Geology (Case I: the paper's FoS 0.86 doesn't follow from its data - noted). No duplicate PDFs in batch 2. MCQs with unconfirmable keys are replaced by new ones (marked new). Batch 3 loaded: Instrumentation & Control, ICT (own pattern: Part II 6 SAQs = one 20-mark group), Mechanical (weld picture), Mechatronic (own: Part II 5 SAQs group; Section B one 50-mark question per case), Horticulture, Mining (own: Part II 5×5 = 25, Section B 45; Bhutan mining-law/ERB/royalty answers flagged for expert check), MBBS, Medical Laboratory Technology (LJ chart + Gaussian pictures). **Microbiology and Biotechnology: questions only.** The safety check stopped Claude writing their answers (twice for Microbiology), so `scripts/me/load_questions_only.py` copies the question text from the parsed PDFs as DRAFTS with no answers (MCQ options all unmarked, no model answers); the founder's expert adds answers in /admin/questions (filter Draft), then Submit → Verify → Publish. Biotechnology 2025 has no MCQ 19: a blank MCQ placeholder keeps 30 marks. Claude must not try to write these answers again. Batch 4 loaded: Physiotherapy, Optometry (cross-cylinder picture), Neurology (own: Section B two compulsory 25-mark questions), Survey Engineering (own: Part II 5×4, Section B any 2 of 3 × 25), Public Health (epi-curve and causes-of-death pictures), Nursing, OT Technologist (own: 50 MCQ, 3 SAQ × 10, Case 20; linked to specialisation `occupational-therapy-technology` - the paper is Operation Theatre Technologist, founder to confirm), Statistics (survey figure), Nutrition & Dietetics (own: Part II six SAQs as one 20-mark group; Section B two compulsory × 25). Batch 5 (21 Nov): 2025 - Veterinary Science (own: Part II any 5 of 6 × 6, Section B any 2 of 4 × 20), Water Engineering (own: Section B any 5 of 6 × 10; channel and sewer pictures), Urban Planning (18 Bhutan-rule MCQ keys FLAGGED, batch name says check first). 2024 (first older-year papers) - Chemistry, Biomedical Engineering, Beautification Officer (6 flagged), and Bio Science **Paper II** 2024 (`ADDS_TO_PAPER`; MCQs 2 and 34 repeat 2025 MCQs 45 and 20, so they were not loaded again - year 2024 added in question_appearances). **Traditional Medicine (Drungtsho): questions only, Drungtsho to add answers** (Claude cannot give reliable Sowa Rigpa keys). 2024: `scripts/me/load_drungtsho_questions.py` copies the clean PDF text (20 MCQ, 6 short answers = 30, 10 long = 50). 2025: the PDF's DDC_Uchen font has no Unicode map (text garbled, same for any copy), so `scripts/me/load_tradmed_2025_images.py` cuts each question out of the page as a webp picture (`public/papers/me/tm2025/`, positions from `pdftotext -bbox-layout`); stems are short placeholders, MCQ options are ཀ ཁ ག ང; 30 MCQ, 4 short answers x 5, choose Case I or II x 50 (the 2025 layout is the current pattern). 2025 MCQs 8 and 9 repeat 2024 MCQs 2 and 6: year 2025 recorded on the 2024 (text) questions; the 2025 picture versions are duplicates the Drungtsho may archive. Batch 6 (21 Nov, founder: the last Paper III PDFs for this round; all four are BCSE **2024** papers, no 2025 ones received for these): Radiology (MCQs 11, 16, 27 replaced), Forestry (MCQs 4, 14, 16, 29, 30 replaced; keys for 3, 12, 24, 28 FLAGGED as Bhutan figures; Case I diameter-class picture; PDF parse fixed for stray numbers), Geology 2024 (MCQs 5, 8, 16 replaced; MCQ 14 fault picture; report-style cases, one item per report section; no repeats of 2025, but landslide/ slope-stability case is a repeated topic), Meteorology and Climate Studies (spec `meteorology-hydrology`; MCQs 7, 13, 16, 23 replaced; pressure map and box plot pictures). Pictures `public/papers/me/tech3-{geo,met,forest}-2024-*.png`. No repeated questions found against the 3504 live ME questions. Agriculture 2024 loaded next (spec `agriculture`; MCQs 13, 26, 28, 29 replaced - unconfirmed Bhutan figures; keys 10 and 27 FLAGGED; MCQ 14 option spelt Zoraptera). Repeated topic: human-wildlife conflict (Agriculture 2024 Case II, General Paper III 2025, Technical Paper I 2021). Founder (21 Nov): if a 2025 paper is missing, use 2024 back to 2010; if a paper has no matching subject on Soma, tell the founder (add new / map to similar / skip) - never guess. 198 older historical_official questions have no source year, so no question_appearances row yet. Drawing answers are uploaded as photos.
- **B.Ed. 2025 loaded (20 Nov, drafts, 5 PDFs from founder):** Papers I and II differ by graduate type, so two internal (inactive) subject groups `bed-general-graduates` (B.Ed. General/Primary + Secondary) and `bed-dzongkha-graduates` (B.Ed. Dzongkha) are set from the student's B.Ed. type (migration 20261229000100; papers me-bed-1/2 group-scoped). All three papers 3 h + 15 min reading, 100 marks (migration 20261229000200 sets Paper III's time, which was missing). Modules: `me_bed1_general_2025` (22 parts) and `me_bed1_dzongkha_2025` (26) - Dzongkha, font-damaged text repaired, every item flagged "Dzongkha teacher MUST check" (grammar answers are best attempts); `me_bed2_general_2025` (25) and `me_bed2_dzongkha_2025` (23) - English: essay 1 of 2, comprehension passage group, 15 grammar MCQs, précis; `me_bed3_2025` (100 MCQs, 4 sections of 25; 9 chart pictures `public/papers/me/bed3-2025-*.png`; 13 unclear/flawed real items replaced by new ones). Loader script takes `PAPER`, `CAT`, `SPEC` for the mock check.
- **Layout audit (21 Nov, founder: every paper in the latest RCSC layout):** a live audit compares each question group's type and marks with the latest pattern (`paper_blueprint_sections`). Fixed: Technical Paper I 2021/2022/2024 Dzongkha comprehension 15 -> 20 and 2023 translation 10 -> 15 (FIT block at the end of `me_technical1_<year>.py`, updated live in place, rubric rebuilt, original marks noted in the stem); Traditional Medicine Paper III 2024 (drafts, updated in place): six single 5-mark short answers and Section B as one 50-mark set (passage, 10 x 5) offered as Case I/II - `load_drungtsho_questions.py` now builds that and no longer overwrites the 2025 layout; migration 20261231000300: mocks never pick current-affairs practice questions (test 99_mocks_rcsc_format). Remaining differences are the 2025 papers' own printed marks (ICT Paper II SAQs 3/6, Traditional Medicine Paper II three 4-mark items, one 5-mark Clinical Counselling question) - correct as RCSC printed them.
- **Questions not chosen (21 Nov, founder: save AI cost):** in "answer any N" mocks the result page marks the questions the student did not choose "Question not chosen during exam" with no upload/evaluate actions; migration 20261231000400 (`question_not_chosen`, `attempt_unchosen_questions`) makes `ensure_written_answer`, `begin_transcription` and `request_answer_evaluation` refuse them (QUESTION_NOT_CHOSEN). Applied live; tested in 99_me_personal_practice.
- **Technical Paper III 2024, batch 7 (22 Nov, drafts):** founder sent 8 of the 10 requested 2024 PDFs (no 2024 Water Engineering or Horticulture; Mechatronic is a new subject - 2025 only). Modules `scripts/me/me_technical3_{survey,civil,electrical,ict,animalsci,mechanical,architecture,ece}_2024.py` (ADDS_TO_PAPER, fitted to each subject's 2025 layout: Survey short answers re-marked 5 -> 4; ICT Part II kept as one 20-mark group; Animal Science short + long answers as in 2025). 348 drafts loaded live, each tagged to its own specialisation only. Replaced MCQs (answers not confirmable): Survey 1; Civil 25; ICT 5, 22; Animal Science 14, 16, 24; Mechanical 9, 12, 16, 28; Architecture 9, 12, 19, 20, 26, 28, 29, 30 (traditional Bhutanese terms/pictures - an architect may restore them with keys); E&C 20, 24. Repeats of 2025 not loaded again, year 2024 recorded (`supabase/data/me_technical3_repeats_2024_batch7.sql`): Survey MCQs 4, 7, 19 and Case 1 (= 2025 Case III); Electrical MCQs 4, 13. FLAGGED: Electrical Case II Q1 (name of Bhutan's wiring regulation); Animal Science long answer 2 (illustrative dairy prices). Pictures `public/papers/me/tech3-{civil,ee,mech,arch}-2024-*`. Next batches the founder was given: 2024 Paper III batch 2 (Automobile, Food Science, Instrumentation, Environmental Science, Mining, Agriculture Engineering, Veterinary, Aeronautical, Conservator, GIS), then batch 3, 4, Paper II groups, General 2021.
- **Technical Paper III 2024, batch 8 (22 Nov, drafts):** of batch 2 the founder found only Food Science, Aeronautical/Avionic and Environmental Science for 2024 (Automobile, Instrumentation, Mining, Agriculture Engineering, Veterinary, Conservator, GIS: try older years). Modules `scripts/me/me_technical3_{foodsci,aeronautical,envsci}_2024.py` (ADDS_TO_PAPER, 2025 layouts; Food Science short answers re-marked 5 -> 4). 135 drafts live (42 + 49 parts + 44), each tagged to its own specialisation only; no repeats of live questions. Replaced: Food Science MCQs 7, 11 (MCQ 14 options fixed); Aeronautical MCQ 5 (two correct options; MCQs 4 and 9 re-typed, 9 with `public/papers/me/tech3-aero-2024-springs.png`); Environmental Science MCQs 19, 20, 22, 24, 30 and short answers 1 (Bhutan Climate Fund), 3 (Bhutan Waste Bank) - Bhutan facts not confirmable. Env Case II Q1 had no marks printed: given 10. FLAGGED: Food Science Case I Q4 (BFDA organic labelling). Picture `public/papers/me/tech3-food-2024-tetrapak.jpg`.
- **Technical Paper III 2024, batch 9 (22 Nov, drafts):** founder now goes year by year (finish 2024, then 2023; a subject missing in a year is left for another year). Sent 7 of 10: Nursing, Nutrition & Dietetics, Urban Planning, Statistics, Clinical Counselling, Public Health, MLT (no 2024 EMR, Dental, Optometry). Modules `scripts/me/me_technical3_{nursing,nutrition,urban,statistics,counselling,publichealth,mlt}_2024.py` (ADDS_TO_PAPER, 2025 layouts; Public Health Part II re-marked 6/3/2/9 -> 4 x 5; Counselling Section B q1 parts a+b merged - builder splits only a-e). 319 drafts live, each tagged to its own specialisation, Paper III only. Repeats of 2025 not loaded, 2024 recorded (`supabase/data/me_technical3_repeats_2024_batch9.sql`): Urban MCQs 1, 2, 4, 9, 10, 14, 15, 20, 24, 30; Nutrition MCQs 4, 10, 11 and Part II 3, 5 (replaced by new short answers so Part II stays 20). Replaced (no single defensible answer or unconfirmable Bhutan facts): Nursing MCQ 12, 26; Nutrition 6, 13, 15, 25; Urban 3, 5, 6, 7, 18, 21, 22, 23, 29 and short answer 1; Statistics 11; Counselling 1, 16, 19, 24; Public Health 7, 9, 12, 18, 23, 25; MLT 1, 5, 7, 11, 15, 18, 22, 25. Pictures `public/papers/me/tech3-{urban,stat,mlt}-2024-*`. Remaining 2024: batch 10 (Physiotherapy, OT, MBBS, Cardiology, Neurology), batch 11 (Paper II groups), batch 12 (Dzongkha category and B.Ed papers); then 2023.
- **Technical Paper III 2024, batch 10 (22 Nov, drafts) - last 2024 Paper III:** founder sent MBBS, Physiotherapy and Drungtsho (Traditional Medicine); no 2024 OT, Cardiology, Neurology. Modules `scripts/me/me_technical3_{mbbs,physio}_2024.py` (ADDS_TO_PAPER, 2025 layouts). 118 drafts live (MBBS 58, Physiotherapy 60), Paper III, own specialisation only. MBBS MCQs 3 and 10 repeated (reworded) in 2025: not loaded, 2024 recorded (`supabase/data/me_technical3_repeats_2024_batch10.sql`). Replaced: MBBS 2, 13, 18, 19, 27, 30 (guidelines differ); Physiotherapy 9, 14, 25, 27. FLAGGED: MBBS Case II xi (four NTCP targets). **Drungtsho 2024 and 2025 were already loaded on 21 Nov as question-only drafts (80, `scripts/me/load_drungtsho_questions.py`, commit efa4b97)** - the founder re-sent the same 2024 PDF; nothing new to load. A Drungtsho adds the answers. Still missing for 2024 Paper III (try older years): Agriculture Engineering, Automobile, Conservator, GIS, Horticulture, Instrumentation, Mining, Veterinary, Water, EMR, Dental, Optometry, OT, Cardiology, Neurology. Next for 2024: batch 11 (Paper II groups), batch 12 (Dzongkha category and B.Ed).
- **No Bio Science Paper III (22 Nov, founder checked every year's papers):** specialisation `bio-science` switched off (migration 20261231001300; no students, questions or pattern). Bio Science stays a Technical Paper II subject group (Agriculture, Forestry, Food Science, ...). 47 Paper III specialisations offered.
- **Question allocation is the backbone (22 Nov, founder: "agriculture subject papers shouldn't be seen in medical or Dzongkha ... we cannot afford to make mistakes there"):** audit found every published ME question correctly tagged (Paper III by specialisation, Paper II by subject group, matching topics) and every picker using `entry_fits`. Migration 20261231001200: `entry_fits` no longer exempts staff (the founder's super_admin account saw every subject mixed; the student area now follows the account's own entry for everyone, admin pages unaffected); last-minute summary and notebook filtered by entry (the notebook no longer shows another entry's notes; the earlier merge-by-paper-number was reverted); trigger `questions_allocation` refuses publishing an ME question without its paper / specialisation (Paper III) / subject group (Paper II) or with a specialisation outside its group; also fixed the last-minute key past-paper list (alias clash made it fail for premium students). Test 99_allocation (admin with Medical entry, Medical, Agriculture and Dzongkha students). Never add a staff bypass to the student area again.
- **Pause exam (22 Nov, founder):** every timed exam has a Pause button next to the timer (`exam-room.tsx`); answers are saved, then `pause_attempt` stores the seconds left and the timer stops. Migration 20261231001000: paused attempts are never closed for time (`close_if_expired`), triggers refuse answers/pages/submission while paused (ATTEMPT_PAUSED) and refuse starting another `kind = 'mock'` exam while one is paused (PAUSED_EXAM_EXISTS: "Finish your paused exam first"); `resume_attempt` sets a new deadline = now + seconds left; time spent leaves out paused time (migration 20261231001100: Continue also moves `started_at` forward by the pause, so reading time on "answer any N" papers is kept). The "choose your questions" screen has the same Pause button (`components/exam/pause-button.tsx`). Grey "Paused exam" tile + page `/dashboard/paused` (`my_paused_exams`, also lists exams still running). Opening a paused exam shows its Continue button. The "Continue where you left off" box was removed from the PE and ME home (founder). Home tiles: ME = My answers, Paused exam / My scores, Current affairs / Last-minute summary, Your notebook; PE = My scores, Current affairs / OMR, Paused exam / Last-minute summary, Your notebook. No time limit on a pause (founder decision); instead, after pausing, a 4-second "Please don't cheat, this is a practice exam" message shows before the Paused exam page.
- **Your notebook (22 Nov, founder):** brown tile (same size as the others) on the PE and ME home (`exam-flow.tsx`), page `/dashboard/notebook?stage=PE|ME` (`src/components/student/notebook.tsx`). Migration 20261231000800 `my_notebook(stage)`: every multiple-choice question answered correctly in a submitted test/practice, plus ME written answers AI-marked at 60% or more (best mark shown, model answer included); one note per question; only the student's own; nothing they have not already seen in a result. PE grouped by subject; ME: first a choice of Paper I/II/III (the student's papers), then that paper's notes grouped by topic (migration 20261231000900; each ME paper has only one broad subject). One box per paper number: notes from an earlier entry's paper go under the same number (`notebookPapers`/`notesForPaper`). The PE "Question of the Day" tile was merged into "Current affairs" (same page).
- **Time warnings (22 Nov, founder approved):** timed papers show a banner at 30, 10, 5 and 1 minutes left (`dueTimeWarnings` in `src/lib/exam/logic.ts`; skipped if the paper was opened later than that point), and the timer turns orange at 10 minutes and red at 5. Auto-submit at time-up and the 15-minute photo window are unchanged.
- **Sections in RCSC order (22 Nov, founder: "Should be in sequence Section 1, 2, 3, 4 or Part 1, 2, 3 ... check this on all papers"):** the Practise buttons on each ME paper page now follow the paper's sections (`typesInPaperOrder` in `paper-home.tsx`; they were alphabetical by question type). Every live pattern (`paper_blueprint_sections.sort_order`) was checked and is already in sequence. Migration 20261231000700: current-affairs questions are no longer listed or picked as a section of a paper (they showed as an extra "Short answers" in General Paper II); they stay in News.
- **AI cost controls (21 Nov, founder: "If it helps then okay. But shouldn't have any problem to the students"):** migration 20261231000500: the first handwriting reading + 2 re-reads per answer are free (`evaluation.config.free_rereads`), each further re-read uses one AI evaluation; an improved answer uses one (once per evaluation). Recorded in `ai_allowance_uses`, counted by `my_evaluation_allowance`, refunded by the server if the AI work fails. Students can always correct transcribed text by hand for free. Half-price batch marking of mocks was tried and REJECTED by the founder ("People don't like waiting for hours"): migration 20261231000600 makes all marking instant again; `evaluations.delivery/batch_id/batch_submitted_at` are unused leftovers. Do not propose delayed marking again. Founder (21 Nov): "Accuracy is priority" - keep marking at full effort on the top model; do not lower effort or switch the marking model to save cost.
- **Latest-layout rule for loaders:** only the module of a subject's LATEST paper sets its pattern; every older-year module must set `ADDS_TO_PAPER = True` (Geology 2024 had overwritten the 2025 label - fixed). Subjects whose latest paper is 2024 (Agriculture, Chemistry, Biomedical, Beautification, Radiology, Forestry, Meteorology): 2024 sets the layout; 2023 and older must use ADDS_TO_PAPER.
- **General category 2022-2024 loaded (21 Nov, real questions only, awaiting review; `ADDS_TO_PAPER` into the 2025 banks):** Paper II `me_general2_{2024,2023,2022}.py` (32 each; uncertain or time-bound GK MCQs left out and REPLACED by new ones of the same kind, keys N1..N9, so every year keeps 20 MCQs); Paper III `me_general3_{2024,2023,2022}.py` (10/9/12 questions, 2022 and 2024 offered 5 Part A questions); Paper I Dzongkha `me_general1_{2024,2023}.py` (same six-question layout as 2025; text copied from the PDFs with dz_fix plus per-paper fixes, model answers by Claude flagged for a Dzongkha reader; generator scripts in scratchpad `tools/p1parts.py`, `tools/p1emit.py`). **Founder rule (21 Nov): older-year questions always follow the format and marks of the LATEST paper; left-out questions are replaced by new ones of the same kind.** 2022 Paper I used an older layout (essay 20, letter 15, comprehension 15, translation from Choekey 20, GK 30): `me_general1_2022.py` loads its 2 essays at 30, 2 letters at 20 (original marks noted in the stem) and the comprehension (5 x 3); the Choekey translation and the GK section are not loaded (no such sections in the latest paper). Reloading a module does not delete its earlier rows: delete the unpublished batch first (check exam_questions does not use it). No word-for-word repeats; repeated topics: tourism SDF (P2 2022 C1, P3 2023 B1, P3 2022 B1), emigration/attrition (P2 2022 B3, P2 2023 C2, P3 2023 B5), LDC graduation (P3 2022 B3, P3 2023 B4), youth unemployment (P3 2022 B6, P3 2024 B2), community vitality (P3 2023 A1, P3 2024 A5), media and democracy (P3 2022 A3, P3 2024 A2), Ugyen Wangchuck and the monarchy (P3 2022 A4, P3 2024 A3), NCDs/health (P2 2023 C4, P2 2024 A).
- **Technical Paper II 2025 (20 Nov, drafts, PDFs from founder):** one module per subject group `scripts/me/me_technical2_<group>_2025.py` (shared `technical2_common.py`; parser in scratchpad `tools/t2parse.py`). Loaded: Bio Science 80, Medical Science 80 (2 diagram questions with pictures in `public/papers/me/`), Engineering 81 (maths retyped from page images), ICT 76, Conservator 79 (Part II any 6 of 9), Statistics 79, Nursing 100 (3 topic sections, 150 min). Uncertain MCQs left out and replaced by new ones of the same kind (listed in each module). **Traditional Medicine loaded (67 drafts, founder had no Drungtsho):** every answer is Claude's best guess on a specialist Gyud-zhi paper and carries a 'Drungtsho MUST check' issue; written answers are outlines; never publish before a Drungtsho checks. Migration 20261228000100: pattern + timing per subject group (`paper_group_settings`, `paper_blueprint_sections.subject_group_id/topic_slug`, `paper_sections_for_me`, `my_subject_group`, `paper_fits_me` - fixes Technical II/III mocks that could never start). Loader: `SUBJECT_GROUP`, `GROUP_TIMING`, pattern `topic`, question `image`, decimal part marks.
- **Next work:** load the other ME categories from https://rcsc.gov.bt/bcse-past-question-papers/ (Technical, then B.Ed.), then older years 2024 → 2010 per category; PE batch 6+ toward 3,000 later.
- Follow the founder's standing rules below (automatic follow-on changes with the checklist; changes apply to current users immediately; DB updates without asking, except destructive ones).

## Where we stopped (18 Nov 2026)

- **ME entry (founder + RCSC examination board, 20 Nov):** Administrative, Finance and PGDE share the same common papers → first ME screen shows one box "PGDE and Services" (`/dashboard/me?cat=services`) that opens the three. Other boxes: Dzongkha, B.Ed., Technical. (UI only; categories unchanged in the DB.)
- **B.Ed. three sections (founder, 20 Nov):** B.Ed. General / Primary, B.Ed. Secondary, B.Ed. Dzongkha (specialisations of `bed`; migration 20261216000100, applied live). Paper I same for all; Paper II "Subject Paper" is subject-wise with the same pattern (subjects come from the RCSC PDFs as they are loaded); Paper III Teacher Aptitude Test for all.
- **ME is Premium only (founder, 20 Nov):** no Free plan for ME. Without ME Premium, /dashboard/me shows the student's papers locked (titles from `exam_papers`) and "Join ME Premium" (`MeLocked`). Migration 20261215000100 (applied live): AI evaluations for free accounts = 0 (Admin → Evaluations can change it), no free ME samples or exams. PE keeps Free.
- **ME question loading (from 20 Nov):** RCSC past papers are fetched by Claude from https://rcsc.gov.bt/bcse-past-question-papers/ (founder approved; use `rcsc.gov.bt`, not `www.`; PDFs stay in the scratchpad, never committed). Batch module per paper in `scripts/me/` (pattern, rubric, real questions with `real=True`, similar ones with `parent`), built by `scripts/me/build_me_questions.py` into `supabase/data/*.sql` (checks: key points add up to the marks, enough questions per pattern section). Real questions: origin `historical_official`, year only in `ai_review.source` (never shown). Loaded as `awaiting_review` with `ai_review.batch`; the founder publishes with the batch button (the review page now lists every batch question). **Done: 2025 General Paper III (9 real + 9 similar, pattern Part A any 2 of 4, Part B any 3 of 5, 20 marks each).** **One part per screen (founder, 20 Nov):** the builder splits each question into one row per part (a)/(b)/(c) (marks from "(N marks)", key points by letter prefix, rubric scaled), linked by `passage_group` and ordered by `passage_position`; a shared introduction is repeated in each part's stem and folded in the exam room. Practice gives one part; mocks pick whole questions with all parts (`pick_me_groups`, migration 20261221000100). Live: the 18 combined Paper III questions were archived and replaced by 42 parts (`supabase/data/me_general3_2025_parts.sql`, approval carried over). **2025 General Paper II loaded (20 Nov, drafts):** case study (explicit `group`, 4 questions sharing the article; a new Soma practice case study too), topical (any 2 of 4), subjective (any 2 of 4), 20 MCQs (16 real + 20 new; real D6, D8, D13, D15 and C2 left out: picture/diagram or answer not certain). Mixed papers (migration 20261223000100): MCQ sections in mocks (auto-marked), mock total = paper total when questions are chosen (`attempt_total_for_choice` trigger), mock % adds MCQ marks. The choose screen also lists sections answered in full. **2025 General Paper I (Dzongkha) loaded (20 Nov, drafts, 26 parts):** essay (1 of 2, 30), formal writing (1 of 2, 20), précis (10), language and spelling (parts a+b, 10), comprehension (passage + 5×3), translation (15); types essay / long_answer / descriptive / short_answer / passage / translation; reading 15 min (migration 20261224000100). Essay and letter model answers are outlines. **Every Paper I item carries a "fluent Dzongkha check" issue; grammar Q4 answers especially need a Dzongkha teacher.** Open question for the founder: Paper I cover says writing time 3 h 45 min but instruction 1 says 3 hours (site keeps 3 h). Next: other categories (Dzongkha, Technical, B.Ed.) and older years.
- **Choose your questions, like the exam hall (founder, 20 Nov):** mocks with "answer any N" sections open on the whole question paper (`ChoosePaper`, `src/lib/exam/choice.ts`): a big amber notice with per-part counters, a "Choose this question" button per question, "Start writing" locked until each part has exactly N. Reading time from `exam_papers.reading_minutes` (15 for General Papers II and III, from the 2025 papers) is added to the mock's time and shown as an amber "Reading" timer. Then only the chosen questions are written, one part per screen; "Question paper" in the exam room's top bar reopens the paper to read again or change the choice. DB: `exam_questions.choice_group/choose_any/section_order`, `exam_attempts.chosen_groups`, `choose_mock_questions()` (migrations 20261222000100/0200, applied live).
- **Personal ME practice (founder, 20 Nov):** students never browse the ME bank (`/dashboard/written` redirects students to /dashboard/me; staff keep the list). Paper page type buttons → `start_paper_practice(paper, type)`: a question the student has not seen, preferring ones fewest other students have had (`pick_me_questions`). Mock paper → `start_paper_mock(paper)`: a personal exam (owner = student, kind mock) built from `paper_blueprint_sections` (the paper's RCSC pattern: sections, type, count, marks each, "answer any N"); time/marks from `exam_papers`. No pattern or too few questions → no mock button (`paper_mock_ready`). **When loading ME PDFs: insert the pattern into `paper_blueprint_sections` and fill the bank (300–500+ per paper).** Migration 20261219000100 (applied live).
- **Resume exactly where left off (founder, 20 Nov; PE and ME):** reopening an unfinished test opens the question last open on that device (`soma:attempt:<id>:pos` in localStorage), else the first unanswered one (`src/lib/exam/resume.ts`). Answers are saved on the server; the timer keeps running from the original deadline.
- **ME home has no "Start here / Your first written answer" box (founder, 20 Nov):** the paper cards are the way in; the coloured box shows only to continue an unfinished ME paper ("Continue where you left off").
- **ME "Retry my mistakes" (founder, 20 Nov):** on an ME mock result, `MeResultPanel` shows "Fix your mistakes" with skipped / wrong (MCQ) / below-half-marks (AI-marked written) counts and a "Retry my mistakes (N)" button → `start_me_retry()` builds an untimed personal practice (`exams.retry_of_attempt`) with only those questions (chosen questions only). Not-yet-marked written answers are reported, not included. A retry's result shows "Before → Now" per question (`me_retry_compare`). ME results end with "Back to Paper N" (paper page) instead of "Back to menu". Migration 20261225000100 (applied live).
- **Scores and history per exam (founder, 20 Nov):** My scores (`/dashboard/analytics`) and test history (`/dashboard/history`) show one exam only: `?stage=PE|ME`, else the exam the student is in (`lastStage`). `forStage()` in `src/lib/analytics.ts` filters subjects, topics, tests and recomputes totals. ME scores also show `MeOverall` (papers) and the written-answer section; PE never shows ME and vice versa. Tiles and result pages link with the right stage.
- **No Question of the Day in ME (founder, 20 Nov):** ME students keep the current-affairs news; the QOTD box is hidden on the current-affairs page when the student's exam is ME, the ME daily plan no longer adds it (`ensure_today_plan`, migration 20261220000100, applied live), and the ME Premium feature reads "Current affairs: daily Bhutan and world news". PE unchanged.
  Follow-up migration 20261220000200 (applied live) removed the QOTD from ME plans already made for today. Open: the ME daily plan's written item still picks by the student's own attempts only; switch it to `pick_me_questions` once ME questions are loaded.
- **No subject-group step for Technical (founder, 20 Nov):** after the specialisation the entry is complete; the Paper II group comes from `specialisations.subject_group_id` (Soma's proposed grouping, marked unverified with a review note; admins change it in Exam structure). Migration 20261218000100 (applied live) also cleared `profiles.subject_group_id` so everyone follows the specialisation.
- **ME paper page + overall progress (founder, 20 Nov):** paper card → `/dashboard/me/paper/[paperId]` (`PaperHome`, ME Premium only; Mock paper first, then Practise, then My progress): Practise by question type (→ `/dashboard/written?paper=&type=`), Mock paper (latest published `kind='mock'` exam for the paper; time/marks shown when `exam_papers.duration_minutes/max_marks` are set), "My mock papers" list with ↑/↓, My progress (answers marked, average of the last 10 marked answers, Strong ≥70% / Work on <50% by question type and topic, ≥2 answers). ME home: `MeOverall` below the cards = papers combined with `weightage_percent`, bars per paper, "Focus next" (biggest weighted gap or not started). Data: `my_me_progress()` (migration 20261217000100, applied live). No reset; no past papers or years shown to students.
- **"Exam Room" badge (founder, 20 Nov):** each Paper I/II/III card shows a small "EXAM ROOM" badge (door icon) next to the paper name, on every category (locked cards too).
- **Paper I / II / III cards (founder, 20 Nov — replaces the "no Paper words" rule below for the ME home):** after choosing their entry, students see "Your papers": Paper I, II, III in one charcoal colour (`PaperCards`, `PAPER_CARD`, founder chose charcoal), different from the ME rose. Subtitle = paper title from the DB (descriptions to be improved once ME PDFs arrive). Premium: tap → `/dashboard/written?paper=<id>`; without Premium: locked → Join ME Premium.
- **No "Paper I/II/III" words for students (founder, 20 Nov):** until the founder sends real ME papers, student screens and the public ME page do not name Paper I/II/III ("Subject group" instead of "Paper II group"). Admin screens still use the paper names. Text only; nothing in the DB changed.

- **Founder admin account has complimentary PE Premium until ~20 Dec 2026 and ME Premium until ~19 Dec 2026** (for testing; entitlement notes "Founder testing of PE Premium" / "… ME Premium").

- **Passages shown once (20 Nov, live):** `get_attempt_paper` returns `passage_group` (migration `20261214000100`);
  `src/lib/exam/passages.ts` folds the shared passage on later questions ("Same passage as Question N · tap to read it
  again"). Applies to all existing passage questions. Preview: `/dev/exam-preview?sample=passage`.
- **Dzongkha passages (founder, 20 Nov):** from batch 6 make each Dzongkha passage a DIFFERENT text type, like the real
  PE (notice, letter, short news report, story, speech), longer and with detail/meaning/main-idea questions. The
  batch 4–5 passages (Karmo's family, Bumthang tshechu) stay.

- **PE batch 5 PUBLISHED (20 Nov; live PE total 604: Aptitude 166, English 161, DI 145, Dzongkha 126, CA 6):** 120, same structure as batch 4 (passages `soma-b5-english`,
  `soma-b5-dzongkha`; charts `charts_batch5.py` → `public/papers/soma/b5-*.png`; 59 twins). Batch `pe-batch-5`.
  Founder must MERGE before publishing (chart images). Then live total ≈ 604.

- **PE batch 4 PUBLISHED (20 Nov; live PE total 484: Aptitude 136, English 131, DI 115, Dzongkha 96, CA 6):** 120 = 30 English (passage `soma-b4-english` ×5), 30 Aptitude, 30 DI
  (charts drawn by `scripts/past-papers/charts_batch4.py` → `public/papers/soma/b4-*.png`), 30 Dzongkha (passage
  `soma-b4-dzongkha` ×5 — needs a Dzongkha speaker). 66 linked as twins of real 2010/2011 questions. Batch name
  `pe-batch-4`; founder publishes with the batch card after merging (chart images ship with the merge).
  Difficulty enum is foundation | standard | advanced (not "hard"). Next: batch 5 with the same mix and new twins.
  **Answer positions:** use a SEEDED RANDOM shuffle per question (see `_balance` in new_pe_batch4.py) — never a cyclic A-B-C-D pattern (founder spotted it). Batch 4 live drafts were re-ordered to match.

- **3,000-question plan (founder, 20 Nov):** batches of ~120 (30 English incl. ONE passage ×5 Qs, 30 Aptitude, 30 DI with
  chart pictures, 30 Dzongkha incl. ONE passage ×5 Qs), all BCSE-style: twins of real 2010/2011 questions + new ones of
  the same types; Bhutanese context; chart data marked illustrative. Set `BATCH = "pe-batch-N"` in the batch module.
- **Batch publish (live):** `question_batches_waiting()`, `publish_question_batch(batch)` (migration `20261212000100`);
  cards on /admin/ai/review "Publish this whole batch".
- **Passages (live):** `questions.passage_group` / `passage_position` (migration `20261213000100`). Full mock tests take
  one whole passage per language section; free 25-question tests leave passages out. Past papers grouped as
  `bcse-2010-english`, `bcse-2011-english`, `bcse-20xx-dzongkha`.

- **Results page fix (20 Nov):** "Take this test again" pointed personal exams (qotd-/practice-/mock- slugs, not in the
  catalogue) to a 404. Now hidden for personal tests; free PE students get a "Join Premium" note; "Back to menu" →
  `/dashboard/pe?scores=1`, which shows a "Check your score below" pop-up (`scores-hint.tsx`). 404 button → /dashboard.
- **My scores "What to practise next" (20 Nov):** "Practise 10" silently failed for free accounts (FREE_DAILY_LIMIT). Free PE now sees the list + a Premium note (no buttons); QuickPractice shows a message on freeLimit.

- **END OF DAY 19 Nov (Bhutan):** all work merged (PRs up to #61) and live. Founder will continue tomorrow in this chat.
  Next options: PE batch 4 (more Dzongkha + DI), ME papers (founder confirming categories with RCSC), founder feedback.

- **Last-minute summary (founder, 19 Nov; APPLIED LIVE):** button "Last-minute summary →" on the exam-eve / exam-day
  card opens `/dashboard/last-minute` (`src/components/student/last-minute-summary.tsx`). Data from RPC
  `my_last_minute_summary(stage)` (migration `20261209000100`, test `99_last_minute_summary.sql`): section accuracy,
  the student's mistakes (past-paper first) with answers, and for Premium up to 15 unseen past-paper questions.
- **Feature lists updated (19 Nov, live):** OMR shading, OMR sketch practice, exam countdown and last-minute summary added to package features (migration `20261210000100`), Why Premium / About cards (`exam-info.tsx`), free points, public /pe and /packages pages.

- **OMR shading (founder, 19 Nov; APPLIED LIVE):** real PE answers are pencil-shaded circles read by a scanner. Mock tests
  (`exams.omr_mode`, set by `create_mock_test`) now use finger-shaded circles (`src/components/exam/omr-bubble.tsx`,
  judged by `src/lib/exam/omr.ts`: ≥60% filled, ≤12% outside). `attempt_answers.mark_quality` ('good'|'too_light'|'outside');
  `save_answer` gained `_mark_quality`; `finalize_attempt` scores bad shading 0 and counts it unanswered
  (migration `20261208000100_omr_shading.sql`, test `99_omr_shading.sql`). Coach + result review explain uncounted answers.
  No shading feedback during tests (founder, 19 Nov): only the results coach reveals it. "Erase" button. New page `/dashboard/omr-practice`. PE home tiles: My scores, Current affairs, Question of the Day,
  OMR sketch practice (Practice / Mock tests tiles removed — founder's choice). Tile colours (founder, final): My scores pink, OMR grey "Practise your shading for the RCSC PE", QOTD blue, Current affairs purple. Practice/QOTD stay tap-to-answer.
  Dev preview: `/dev/exam-preview?omr=0` for tap mode. Starting a mock first shows a "Practise OMR shading first?" pop-up (mock-cta.tsx StartButton; "Don't show this again" kept in localStorage `soma-omr-reminder-off`).

- **STANDING PERMISSION (founder, 19 Nov 2026):** "From this time onwards, no need to ask permission for database
  update. Do on your own." → apply live migrations / question loads after tests pass, then tell the founder.
  Still tell them before anything destructive (deleting data, removing published content).

- **Exam-day countdown (19 Nov, founder request):** migration `20261207000100_exam_dates.sql` adds `profiles.pe_exam_date`,
  `me_exam_date` (student-entered; RCSC changes dates yearly — never hardcode). Pop-up + chip (top right) in
  `src/components/app/exam-countdown.tsx` (asks until the date for the student's exam is set; "Later" hides it for the
  session), action `src/app/dashboard/exam-date-actions.ts`, helpers `src/lib/student/countdown.ts` (Bhutan days).
  PE and ME are separate: `pickCountdown()` — /dashboard/pe uses only the PE date, /dashboard/me only the ME date (asks for it if missing). Copy kept in localStorage so the public site header shows it when signed out. **APPLIED LIVE 19 Nov.** Good-luck card the day before and on exam day (`examDayNote` in countdown.ts; previews `exam-eve`, `exam-day`).

- **QOTD repeat fix (18 Nov):** `dailyFeatures` in `src/lib/ca/pipeline.ts` now skips questions already used in
  `ca_daily` and looks back 14 days if needed. 17 and 18 Nov both got the COP31 question (18 Nov row left as is
  unless founder approves replacing it). **Open issue:** CA question supply is low (6 published) — triage batches
  fail with a generic "AI request failed"; the error message now includes the cause, check `ai_jobs.error_message`.
  **Cause found 19 Nov:** the model returned a category not in `CA_CATEGORY_SLUGS`, failing the whole triage batch.
  Fixed with `.catch("other")` / `.catch("world")` in `triageSchema` (unit test `ca-triage-schema.test.ts`). 19 Nov QOTD was new (repeat fix works).

- **PE batch 3 WRITTEN (18 Nov):** 60 = 20 English, 20 Aptitude, 10 DI, 10 Dzongkha (no CA: current affairs come from the news pipeline) in `scripts/past-papers/new_pe_batch3.py` → `supabase/data/new_pe_batch3.sql`. **All 60 PUBLISHED 18 Nov.** Live PE published: Aptitude 106, English 101, DI 85, Dzongkha 66, CA 6 = 364. Next: batch 4 (more Dzongkha + DI).

- **Colours follow the page (PR #49, merged 18 Nov):** `src/components/app/exam-theme-root.tsx` sets data-exam from the
  path (/dashboard/pe → PE orange, /dashboard/me → ME maroon, else profile). Exam chooser cards are now forms
  (`chooseExamAction`) that save the pathway. Founder's friend tested a free PE test successfully (25 questions).

- **One exam at a time (founder, 18 Nov):** PE first, ME months later for those who qualify — nobody prepares for
  both at once. "Both" removed from the welcome form; choosing PE/ME replaces the old choice; mock-test and
  past-paper pages have no All/PE/ME switch and open on the profile's exam (`src/lib/student/default-stage.ts`).
  Merged via PR #48 (no DB change). 2 old profiles still say "both" (treated as ME).

- **Latest (18 Nov, end of day):** PE batch 2 all published. Live PE MCQs published: Aptitude 86, English 81, DI 75,
  Dzongkha 56, CA 6 = 304 (goal ~500). Option shuffle live. **Next: "Start PE batch 3"** — proposed 60 =
  15 English, 15 Aptitude, 10 DI, 15 Dzongkha, 5 current affairs (founder has not confirmed the mix yet).
  Remember: make every stem unique (content_hash is on the stem only).

- **PE batch 2 WRITTEN (18 Nov):** 60 questions (20 English, 20 Aptitude, 20 DI) in `scripts/past-papers/new_pe_batch2.py`
  (answers re-computed by `check_batch2()`; correct answers spread evenly over A–D) → `supabase/data/new_pe_batch2.sql`.
  **LOADED LIVE 18 Nov as 60 drafts** (2 stems reworded: content_hash is on the stem only, so generic stems like "Which sentence is correct?" clash across batches — always make stems unique).
- Dzongkha batch 1: all 54 published (review page only showed 50 — fixed with a "N drafts waiting" note).
- **Option shuffle BUILT (18 Nov):** migration `20261206000100_shuffle_options.sql` (helper `attempt_options`, per-attempt order from md5(attempt id + option id); letters re-assigned A–D; picture-letter / "only/both/neither/all of the above" options keep order), test `99_shuffle_options.sql`. **APPLIED LIVE 18 Nov** after founder approval (version 20261206000100).
- (Old note) answer options were NOT shuffled (`exams.shuffle_options` exists but is unused). Batch 1 PE has
  B as the correct answer 28/60 times (D only 3). Proposed fix (needs founder approval): shuffle option order per
  attempt in the paper function, or reorder batch 1 options live.

0. **Founder direction (18 Nov):** the only official PE papers are 2010 and 2011 (already loaded). All further PE
   questions must be written by Claude, modelled on those papers, so premium students have "endless" practice.
   Goal ~500 published PE questions, then a regular batch. ME papers: founder will send all of them after
   confirming the real categories with RCSC. Next: "Start PE batch 2". 54 Dzongkha drafts still awaiting the founder's publish.

1. **Founder sent two Dzongkha reference books** (18 Nov) for writing Dzongkha questions:
   - *Dzongkha–English Dictionary*, 2nd ed., © Dzongkha Development Commission 2013 (1180 pages).
   - *The Grammar of Dzongkha* (Karma Tshering & George van Driem, Himalayan Linguistics, 2019; 720 pages),
     licence **CC BY-NC-ND 4.0 — no commercial use, no derivatives**.
   - **They are NOT in the repo** (the GitHub repo is public and both are copyrighted). In the same chat
     session they are at `/root/.claude/uploads/1e5440e4-299a-59c5-8896-aa7b23e5c884/795d0da8-PP-XII-Dzongkha-English-Dictionary.pdf`
     and `.../4dc21deb-eScholarship_UC_item_1h4211k0.pdf`; if missing, ask the founder to send them again.
   - Use them only as **reference**: write our own questions (word meanings, particles, spelling, sentence
     order, grammar rules). Do not copy example sentences or pages from the grammar book into the app.
     The founder said words may be copied from the dictionary (single words/meanings are fine).
   - Text layer: grammar book reads fine; the dictionary text layer **drops stacked letters** (e.g.
     བསླབ་བ comes out as བསབ་བ) — always check Dzongkha spelling against the page image (`pdftoppm -png -r 150 -f N -l N`).
2. **Dzongkha batch 1 WRITTEN (18 Nov):** 54 questions in `scripts/past-papers/new_dz_batch1.py` → `supabase/data/new_dz_batch1.sql`
   (17 honorific ཞེ་ས, 17 opposites འགལ་མིང, 8 word meanings, 12 genitive/ergative particles; each cites the dictionary
   printed page = PDF page − 13). Test-loaded OK. **LOADED LIVE 18 Nov as 54 drafts (awaiting_review)** after founder approval; founder said a speaker checked. Remaining: founder publishes in /admin/ai/review. (Old note:
   "Yes, load the new questions"; then load via Management API (as batch 1 PE), founder publishes in /admin/ai/review
   after a Dzongkha speaker checks. Dictionary parsing tip: in `pdftotext` (non-layout) output, \uf041 = OPP, \uf062 = HON,
   \uf044 = synonym, \uf069 = other spelling.
   Original plan for this step: Dzongkha questions batch 1 (~40, BCSE PE Dzongkha style as in the 2010/2011 papers), as a
   new module like `scripts/past-papers/new_pe_batch1.py` with `sec: 'dzongkha'` → `build_new_questions.py`
   → test load locally → ask founder "Yes, load the new questions" → founder publishes. Mark them clearly:
   **a fluent Dzongkha speaker must check before publishing.**
3. Then PE batch 2 (~60 English/Aptitude/DI); ME past papers when sent; on-hold three-paper layout (below).

## Earlier stop (17 Nov 2026, evening)

1. **Next task:** PE question batch 2 (another ~60 English/Aptitude/DI), same method as batch 1
   (`scripts/past-papers/new_pe_batch1.py` → `build_new_questions.py` → load as drafts → founder publishes in
   /admin/ai/review: "Select all that passed" → "Approve and publish", 50 per page).
2. **Founder will send:** Dzongkha–English dictionary PDFs (for Dzongkha questions) and ME past papers
   (RCSC pages: General, Dzongkha, Technical I/II/III, B.Ed., CSCE 2009).
3. **On hold:** three paper sections + automatic Paper II groups (see "ON HOLD" below) until the founder confirms
   the specialisation → Paper II grouping with RCSC.
4. **Drafts waiting:** 48 Dzongkha past-paper questions (need a Dzongkha speaker), 26 less-certain past-paper
   questions (status revision_requested) to recheck.
5. Live DB changes always need the founder's explicit "yes, apply"; publishing must be done by the founder.

## The founder and how to work with them

- Non-technical; works on an iPhone. Wants **step-by-step**, **one step at a time**,
  plain words, short messages. Sends screenshots. Does not want jargon or long options lists.
- Build and test first; show screenshots; then one pull request to merge. Avoid many small PRs.
  Database updates no longer need approval (standing permission, 19 Nov; see above); tell the founder
  before anything destructive (deleting data, removing published content).
- **STANDING RULE (founder, 20 Nov 2026): follow-on changes are automatic.** When the founder asks for a
  change, also update everything connected to it without being told (other screens, wording, package
  feature lists, daily plan, tests, docs, previews), and list briefly what else changed. Still ask first
  when a related change is a real business decision (prices, rules, removing content) or deletes data.
- **STANDING RULE (founder, 20 Nov 2026): changes apply immediately to everyone, including students part-way.**
  Every change must also update existing data that would otherwise keep the old behaviour: today's daily
  plans, saved choices, queued items, cached pages (revalidate), unfinished practice. Check "what already
  exists for current users?" for every change and fix it in the same migration. Never delete a student's
  answers, marks or history; for a test already in progress, change what is safe and apply the rest from
  the next step.
- **Checklist for EVERY founder change (founder, 20 Nov 2026, after having to ask twice):** before sending the
  PR, check and fix in the same PR: (1) everything that uses what changed (screens, buttons, links, daily
  plan, tests); (2) current users' existing data and half-finished work; (3) whether PE and ME both need it;
  (4) wording everywhere (package features, help text, previews, docs); (5) anything now broken or
  pointless because of the change. Then list briefly what else changed.
- Do not ask the founder to publish/unpublish content during development.
- Always give direct links (GitHub PR, site pages, Supabase/Vercel settings pages).
- Never invent RCSC exam rules; mark unconfirmed values ("from the founder's brief").
- No guaranteed-success claims. AI content needs human review (except current affairs, see CLAUDE.md).

## Accounts and services

| Service | Detail |
| --- | --- |
| Site | https://soma-preparations.vercel.app (private: access code in Vercel env `SITE_ACCESS_CODE`, Production only) |
| Code | GitHub `vinsmokeee/SOMA-PREPARATIONS-`; work branch `claude/soma-bcse-platform-sr39ur`; founder merges PRs on `main` |
| Hosting | Vercel team `soma-9932`, project `soma-preparations` (Hobby plan) |
| Database | Supabase project `ihmyqurrogrodtodxfef` (free plan). Migrations applied through the Management API; then set the version in `supabase_migrations.schema_migrations` |
| AI | Anthropic API key in Vercel (`ANTHROPIC_API_KEY`); prepaid credit, auto-reload off; current-affairs budget $0.50/day |
| Email | **No email service yet** (Supabase built-in: 2/hour, owner only). "Confirm email" is **OFF** (founder's choice): sign-up needs no email; emails only for new-device checks and password reset |
| Payments | Manual + T Bank QR (admin approval); sandbox gateway for tests; no bank gateway yet |

The founder's master plan audit is a Claude Doc: "Soma Master Plan — Audit and Roadmap".

## What is built (all live)

M1–M8 (site, exam engine, imports, practice/analytics, AI written-answer marking,
AI question drafts, current affairs with 3-hourly scheduler, payments/subscriptions/security),
private preview mode, and master-plan phases:

- **Phase 1 Exam architecture:** General/Technical/Dzongkha pathways (B.Ed hidden), 31
  specialisations (duplicates flagged), Paper II groups (unlinked until verified), per-paper
  settings with source, PE four sections, cut-off history (reference only), entry-based
  delivery, PE Nu 699 / ME Nu 799 (ME "coming soon"), ME final-result note.
- **Phase 3 Daily training:** daily plan, 30-day cycle, spaced revision, weekly/fortnightly
  tests, monthly mock, streaks with rest days, badges, reminders, admin page.
- **Phase 4 AI variations:** variations of verified questions, independent AI check,
  review queue with batch approve/reject, origin labels for students. Runs in the background.
- **New student look (PR #29, merged):** home → choose PE or ME → (ME: choose entry) → Free or
  Premium → the exam's own home. Returning students go straight back to their exam. Top bar:
  profile left, logo centre, bell right. Bottom tabs follow the exam. PE is saffron, ME maroon
  (`data-exam="ME"` in `globals.css`). Preview with sample data: `/dev/home-preview?screen=…`
  (fixture build only).
- **Results:** coloured score card, last year's cut-off as a reference, section bars and a rule-based
  "Your coach" card (`src/lib/exam/coach.ts`): marks lost per section, tips, pace (too fast /
  out of time), skip advice.
- **Mock tests:** Free gets one PE test per Bhutan day (`start_attempt`). Premium makes a new
  test each time (`create_mock_test`), with about 1 in 10 questions the student got wrong
  before. ME Free gets 3 AI marks. Free PE: one practice OR mock test a day in total
  (daily plan and Question of the Day not counted). Migrations `20261127000100`,
  `20261128000100` and `20261129000100` are applied live.
- **Student pages (PR #30, #31):** Back button on every student page, coloured PE / ME switch button,
  coloured public packages page, maroon ME entry boxes, About Soma + benefits below the PE/ME
  choice, "Why go Premium?" below Free/Premium. Payment wording is left out until the founder confirms it.
- **PR #32 (merged):** bottom bar is Home + News only; no PE/ME button (Back on an exam home goes to
  the PE/ME choice; "Change exam" is in the profile menu); ME "Change entry" link; "Free · see
  Premium" badge; News page has a "Practise with the news" box on top (now purple), news below.
- **PR #33/#34 (merged):** founder's logo (public/brand/soma-logo.png, never crop or alter; resized
  copies for header and icons). Each news area shows today's or latest stories, empty areas hidden.
  `ca.config.allow_single_source` = true (founder chose Yes). Device rule (migration `20261130000100`,
  live): new-device risk counts kinds of device ("Safari on iPhone"), not browser cookies, because
  in-app browsers (Gmail, Messenger) on one phone each get a cookie. The device e-mail link only
  works in the browser that requested it (PKCE): tell the founder to press-hold, copy, paste.
- **Past papers (PR #35, merged; loaded live):** BCSE 2010 + 2011 PE, 198 questions as `awaiting_review`
  drafts (origin `historical_official`, linked to `historical_papers`). Pictures under `public/papers/` via
  `questions.image_url` (migration `20261201000100`). Dzongkha shown as pictures of the original print;
  only 9 Dzongkha answers chosen (2010), 41 need a Dzongkha speaker. 4 low-confidence items flagged in the
  review comments. Source data and scripts: `scripts/past-papers/`. Next: founder reviews and publishes,
  then generate twisted/similar/new questions (goal ~500) and ME changes the founder will list.
- **ME structure (PR #36/#37, merged; migration `20261202000100` live):** six categories all offered;
  Education Service (B.Ed.) with General / Dzongkha graduate types (separate Paper I and II, shared III);
  Technical Paper I = "Languages and General Knowledge"; BCSE 2025 Paper III list (48) selectable, CSCE 2009
  list (31) kept inactive for old papers (`list_source`, `offered_years`); students choose their Paper II group
  (`profiles.subject_group_id`, 8 RCSC 2025 groups; spec→group mapping not published). Unclassified ME content
  is never served. 124 past-paper PE questions published; 48 Dzongkha + 26 less-certain remain drafts.
  Next: founder sends ME past papers (RCSC pages: General, Dzongkha, Technical I/II/III, B.Ed., CSCE 2009).
- **Speed (PR #38):** `vercel.json` runs functions in hnd1 (Tokyo) next to the Supabase DB (ap-northeast-1);
  pages were slow when functions ran in iad1. Founder confirmed it is fast now.
- **ON HOLD (founder confirming with RCSC):** "three paper sections per entry + Paper II group set automatically
  from the specialisation" (commit 8df8bd3, PR #39 closed unmerged; reverted on the branch). Restore by reverting
  the "Put on hold" commit once the founder confirms the specialisation → Paper II grouping. The live site keeps
  the previous flow (student chooses the Paper II group).
- **Free PE (PR #41, live; migration `20261205000100`):** free accounts get ONE 25-question test a day (about 6 per
  section) from the whole published PE bank, then "Join Premium"; the daily allowance is shared with practice sets
  (`free_pe_used_today`). Premium: full 100-question mock tests, unlimited.
- **Question of the Day (PR #40, live; migration `20261204000100`):** one question per Bhutan day; the News page shows
  "already answered" with a link to the result; blank time-outs start again; 10 minutes allowed.
- **New PE questions:** batch 1 (60, Claude-written; 13 twists linked to past papers) published by the founder via
  /admin/ai/review. Data: `scripts/past-papers/new_pe_batch1.py` → `build_new_questions.py` → `supabase/data/`.
  PE published MCQs now: Aptitude 66, English 61, DI 55, Dzongkha 2. Next: more batches (goal ~500); Dzongkha
  questions once the founder sends the Dzongkha–English dictionary PDFs (need a Dzongkha speaker to check).

See `docs/ROADMAP.md` for detail.

## Open items (in order)

1. **Founder is testing the new student look on the live site** and will send changes. Show
   **screenshots first** (a `/dev/home-preview` screen plus Playwright on an iPhone profile), then
   one PR. Vercel preview links need a Vercel login, so screenshots are the reliable way.
   Inner pages (practice, exams list, written) still use the older layout with the new colours.
2. **Founder's change list** — they will send more changes after testing with friends.
3. **Phase 2 (old papers):** waiting for PDFs (PE, Technical, General, Dzongkha ME samples).
   Then Dzongkha–English dictionary/reference books.
4. **Content:** only a handful of published questions; plans are short until papers/variations are added.
5. **Before launch:** real email service (Brevo or Resend), email check before payment,
   one real QR test payment, Vercel Pro + Supabase Pro (~$45/month), domain, policy blanks
   and legal check, confirm RCSC facts (paper marks/durations, PE exemptions, Paper II groups),
   final launch checks (Phase 6), logo.
6. Phase 5 (batch PDF processing, pattern reports) after Phase 2.
7. Two old current-affairs questions say "According to the note…" / "According to The Hindu
   report…" — to archive later (ids 3d4b2b6e-…, 672bb8d3-…).

## Working rules for the code

See `CLAUDE.md`. Checks before any PR: lint, typecheck, unit, SQL (`npm run test:db`, needs a
local PostgreSQL), build with `SOMA_PUBLIC_DATA=fixture`, Playwright.
