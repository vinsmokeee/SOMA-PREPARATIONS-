-- =============================================================================
-- Soma Preparations — Migration 0006: Verified reference data
--
-- Every value below was transcribed from an official RCSC document retrieved on
-- 2026-11-15 and recorded in source_documents (URL + SHA-256). Values that the
-- recorded documents do NOT state (PE duration, number of questions, total
-- marks, ME paper durations/marks, exam dates) are deliberately left NULL.
-- The Super Administrator can complete or update them from the admin
-- dashboard when RCSC publishes them.
-- =============================================================================

-- ---------------------------------------------------------------------------
-- Source documents
-- ---------------------------------------------------------------------------
insert into public.source_documents
  (id, url, url_normalized, host, title, reference_number, document_type, exam_year, published_on,
   first_retrieved_at, last_retrieved_at, current_sha256, mime_type, processing_status, usage_status, usage_notes, notes)
values
  ('00000000-0000-4000-8000-000000000101',
   'https://rcsc.gov.bt/wp-content/uploads/2026/06/BCSE-2026-Announcement.docx-1.pdf',
   'https://rcsc.gov.bt/wp-content/uploads/2026/06/bcse-2026-announcement.docx-1.pdf',
   'rcsc.gov.bt',
   'Announcement for Bhutan Civil Service Examination (BCSE) 2026',
   'RCSC/CSES-1/2025-26/117', 'announcement', 2026, '2026-06-08',
   '2026-11-15T11:40:00Z', '2026-11-15T11:40:00Z',
   '30992031cd914f54ef40720f98aa357c263fc435e2f187a2cf734647017d33e8', 'application/pdf',
   'processed', 'unknown',
   'Factual examination structure is summarised in Soma''s own words. The document itself is not reproduced.',
   'Source of: PE subject areas, OMR rule, ME categories, ME papers (per BCSR 2023), ME component and paper weightages, academic requirements.'),
  ('00000000-0000-4000-8000-000000000102',
   'https://rcsc.gov.bt/wp-content/uploads/2025/09/ME-Announcement-2025-2.pdf',
   'https://rcsc.gov.bt/wp-content/uploads/2025/09/me-announcement-2025-2.pdf',
   'rcsc.gov.bt',
   'Announcement for Written Examination (BCSE 2025)',
   null, 'announcement', 2025, '2025-09-09',
   '2026-11-15T11:40:00Z', '2026-11-15T11:40:00Z',
   '6f105de85a1904e04527c3ff1f1e934db5acad220c6540a7fe2bc1405968bff7', 'application/pdf',
   'processed', 'unknown', null,
   'BCSE 2025 ME paper titles per category, including Paper III (General) "... socio-economic development since 1961" and the separate B.Sc Nursing Paper II.'),
  ('00000000-0000-4000-8000-000000000103',
   'https://rcsc.gov.bt/wp-content/uploads/2024/12/Chapter-5-BCSE.pdf',
   'https://rcsc.gov.bt/wp-content/uploads/2024/12/chapter-5-bcse.pdf',
   'rcsc.gov.bt',
   'Bhutan Civil Service Rules and Regulations 2023 — Chapter 5: BCSE for Recruitment of University Graduates',
   'BCSR 2023, Chapter 5', 'rules', null, null,
   '2026-11-15T11:40:00Z', '2026-11-15T11:40:00Z',
   '60ec03e94be0e6c75e55c37415e9e64b9057fb7b3c914b425758423251accb27', 'application/pdf',
   'processed', 'unknown', null,
   'Rules underlying the PE/ME structure (sections 5.3.1–5.3.5).');

-- ---------------------------------------------------------------------------
-- Framework: BCSR 2023
-- ---------------------------------------------------------------------------
insert into public.exam_frameworks (id, code, name, description, verification_status, source_document_id, verified_at, is_current)
values ('00000000-0000-4000-8000-000000000201', 'bcsr-2023', 'BCSR 2023 examination framework',
        'PE and ME structure as stated in the BCSE 2026 announcement ("as per the BCSR 2023").',
        'official_verified', '00000000-0000-4000-8000-000000000101', '2026-11-15T11:40:00Z', true);

-- ---------------------------------------------------------------------------
-- Categories (BCSE 2026 announcement, Stage II item 3)
-- ---------------------------------------------------------------------------
insert into public.exam_categories (id, code, name, description, eligibility_summary, pe_exempt, sort_order) values
  ('00000000-0000-4000-8000-000000000301', 'administrative', 'Administrative Service', null,
   'Minimum of a Bachelor''s Degree in any field.', false, 10),
  ('00000000-0000-4000-8000-000000000302', 'finance', 'Finance Service', null,
   'Minimum of a Bachelor''s Degree in Commerce / Economics (Honours) / Economics (Majors) / Business Administration / Business Management.', false, 20),
  ('00000000-0000-4000-8000-000000000303', 'pgde', 'Education Service (PGDE)', null,
   'Minimum of a Bachelor''s/Master''s Degree with at least one relevant subject prescribed for the Bhutanese School Syllabus or Higher Educational Institute Programme.', false, 30),
  ('00000000-0000-4000-8000-000000000304', 'dzongkha', 'Dzongkha', null,
   'Minimum of a Bachelor''s Degree in Dzongkha / Buddhist Studies.', false, 40),
  ('00000000-0000-4000-8000-000000000305', 'bed', 'B.Ed. Graduates (Primary / Secondary / Dzongkha)',
   'B.Ed. graduates are exempted from the PE (BCSE 2026 announcement, A.4) but must register for the BCSE.',
   'Minimum of a Bachelor of Education (B.Ed).', true, 50),
  ('00000000-0000-4000-8000-000000000306', 'technical', 'Technical Service',
   'Medical (clinical and curative subject) and engineering professionals are exempted from the PE (BCSE 2026 announcement, A.4); other technical graduates sit the PE.',
   'Minimum of a Bachelor''s Degree in the relevant field of specialisation for the position announced, and a minimum of PGDNL for law graduates.', false, 60);

-- ---------------------------------------------------------------------------
-- Papers
-- ---------------------------------------------------------------------------
insert into public.exam_papers
  (id, framework_id, stage, code, paper_number, title, description, answer_format, weightage_percent,
   verification_status, source_document_id, sort_order)
values
  ('00000000-0000-4000-8000-000000000401', '00000000-0000-4000-8000-000000000201', 'PE', 'pe', null,
   'Preliminary Examination',
   'Objective-type questions, common to all categories of graduates, answered on an OMR answer sheet. Tests English communication skills; Dzongkha communication skills; logic, analytical ability and problem-solving; data interpretation ability; and general awareness/current affairs. Duration, number of questions and total marks are not stated in the recorded source.',
   'objective_omr', null, 'official_verified', '00000000-0000-4000-8000-000000000101', 0),

  -- General: Administrative / Finance / PGDE
  ('00000000-0000-4000-8000-000000000411', '00000000-0000-4000-8000-000000000201', 'ME', 'me-general-1', 1,
   'Dzongkha', null, 'written', 15, 'official_verified', '00000000-0000-4000-8000-000000000101', 11),
  ('00000000-0000-4000-8000-000000000412', '00000000-0000-4000-8000-000000000201', 'ME', 'me-general-2', 2,
   'English & General Knowledge', null, 'written', 15, 'official_verified', '00000000-0000-4000-8000-000000000101', 12),
  ('00000000-0000-4000-8000-000000000413', '00000000-0000-4000-8000-000000000201', 'ME', 'me-general-3', 3,
   'Bhutan and its (i) Socio-Political Institutions and (ii) Socio-Economic Development',
   'The BCSE 2025 written-examination announcement titles this paper "... Socio Economic development since 1961".',
   'written', 40, 'official_verified', '00000000-0000-4000-8000-000000000101', 13),

  -- Dzongkha
  ('00000000-0000-4000-8000-000000000421', '00000000-0000-4000-8000-000000000201', 'ME', 'me-dzongkha-1', 1,
   'Dzongkha Language & General Knowledge', null, 'written', 15, 'official_verified', '00000000-0000-4000-8000-000000000101', 21),
  ('00000000-0000-4000-8000-000000000422', '00000000-0000-4000-8000-000000000201', 'ME', 'me-dzongkha-2', 2,
   'English Language & Current Affairs', null, 'written', 15, 'official_verified', '00000000-0000-4000-8000-000000000101', 22),
  ('00000000-0000-4000-8000-000000000423', '00000000-0000-4000-8000-000000000201', 'ME', 'me-dzongkha-3', 3,
   'Buddhist Studies', null, 'written', 40, 'official_verified', '00000000-0000-4000-8000-000000000101', 23),

  -- Technical
  ('00000000-0000-4000-8000-000000000431', '00000000-0000-4000-8000-000000000201', 'ME', 'me-technical-1', 1,
   'Language and General Knowledge', null, 'written', 15, 'official_verified', '00000000-0000-4000-8000-000000000101', 31),
  ('00000000-0000-4000-8000-000000000432', '00000000-0000-4000-8000-000000000201', 'ME', 'me-technical-2', 2,
   'General Subject Knowledge (common to subject groups)',
   'In BCSE 2025, B.Sc Nursing graduates sat a separate Nursing Subject paper as Paper II.',
   'written', 15, 'official_verified', '00000000-0000-4000-8000-000000000101', 32),
  ('00000000-0000-4000-8000-000000000433', '00000000-0000-4000-8000-000000000201', 'ME', 'me-technical-3', 3,
   'Subject Specialisation (for a specific position)', null, 'written', 40, 'official_verified', '00000000-0000-4000-8000-000000000101', 33),

  -- B.Ed
  ('00000000-0000-4000-8000-000000000441', '00000000-0000-4000-8000-000000000201', 'ME', 'me-bed-1', 1,
   'Dzongkha Language', null, 'written', 15, 'official_verified', '00000000-0000-4000-8000-000000000101', 41),
  ('00000000-0000-4000-8000-000000000442', '00000000-0000-4000-8000-000000000201', 'ME', 'me-bed-2', 2,
   'English Language', null, 'written', 15, 'official_verified', '00000000-0000-4000-8000-000000000101', 42),
  ('00000000-0000-4000-8000-000000000443', '00000000-0000-4000-8000-000000000201', 'ME', 'me-bed-3', 3,
   'Teacher Aptitude Test', null, 'written', 30, 'official_verified', '00000000-0000-4000-8000-000000000101', 43);

-- Which categories sit which paper
insert into public.exam_paper_categories (paper_id, category_id)
select p.id, c.id
from public.exam_papers p
join public.exam_categories c on
     (p.code like 'me-general-%'   and c.code in ('administrative', 'finance', 'pgde'))
  or (p.code like 'me-dzongkha-%'  and c.code = 'dzongkha')
  or (p.code like 'me-technical-%' and c.code = 'technical')
  or (p.code like 'me-bed-%'       and c.code = 'bed')
  or (p.code = 'pe'                and c.code in ('administrative', 'finance', 'pgde', 'dzongkha', 'technical'));

-- ME components (BCSE 2026 announcement, Stage II item 4)
insert into public.me_components (framework_id, category_id, component, weightage_percent)
select '00000000-0000-4000-8000-000000000201', c.id, v.component,
       case when c.code = 'bed' then v.bed else v.other end
from public.exam_categories c
cross join (values
  ('academic_achievement', 20::numeric, 10::numeric),
  ('written_examination',  60::numeric, 70::numeric),
  ('viva_voce',            20::numeric, 20::numeric)
) as v(component, bed, other);

-- ---------------------------------------------------------------------------
-- Cycles
-- ---------------------------------------------------------------------------
insert into public.exam_cycles
  (id, code, name, year, framework_id, status, registration_opens, registration_closes,
   pe_cutoff_note, verification_status, source_document_id, notes)
values
  ('00000000-0000-4000-8000-000000000501', 'bcse-2026', 'BCSE 2026', 2026,
   '00000000-0000-4000-8000-000000000201', 'announced', '2026-06-08', '2026-07-07',
   'The minimum PE cut-off is decided by the Commission. PE marks are not carried forward to the ME.',
   'official_verified', '00000000-0000-4000-8000-000000000101',
   'PE and ME dates are published separately in the RCSC schedule and are not recorded yet. Update the cycle status as the examination progresses.'),
  ('00000000-0000-4000-8000-000000000502', 'bcse-2027', 'BCSE 2027', 2027,
   '00000000-0000-4000-8000-000000000201', 'planned', null, null, null,
   'unverified', null,
   'Placeholder for Soma''s BCSE 2027 preparation cycle. Assumes the BCSR 2023 framework continues; verify against the BCSE 2027 announcement when published.');

-- ---------------------------------------------------------------------------
-- Subjects. PE subject areas are named in the official announcement.
-- ME subjects mirror the official paper titles.
-- ---------------------------------------------------------------------------
insert into public.subjects (stage, slug, name, description, paper_id, is_official, source_document_id, sort_order) values
  ('PE', 'english-communication', 'English communication skills', null,
   '00000000-0000-4000-8000-000000000401', true, '00000000-0000-4000-8000-000000000101', 10),
  ('PE', 'dzongkha-communication', 'Dzongkha communication skills', null,
   '00000000-0000-4000-8000-000000000401', true, '00000000-0000-4000-8000-000000000101', 20),
  ('PE', 'logic-analytical-problem-solving', 'Logic, analytical ability and problem-solving', null,
   '00000000-0000-4000-8000-000000000401', true, '00000000-0000-4000-8000-000000000101', 30),
  ('PE', 'data-interpretation', 'Data interpretation ability', null,
   '00000000-0000-4000-8000-000000000401', true, '00000000-0000-4000-8000-000000000101', 40),
  ('PE', 'general-awareness-current-affairs', 'General awareness and current affairs', null,
   '00000000-0000-4000-8000-000000000401', true, '00000000-0000-4000-8000-000000000101', 50),

  ('ME', 'dzongkha', 'Dzongkha', 'ME Paper I (Administrative / Finance / PGDE).',
   '00000000-0000-4000-8000-000000000411', true, '00000000-0000-4000-8000-000000000101', 110),
  ('ME', 'english-general-knowledge', 'English & General Knowledge', 'ME Paper II (Administrative / Finance / PGDE).',
   '00000000-0000-4000-8000-000000000412', true, '00000000-0000-4000-8000-000000000101', 120),
  ('ME', 'bhutan-institutions-development', 'Bhutan: socio-political institutions and socio-economic development', 'ME Paper III (Administrative / Finance / PGDE).',
   '00000000-0000-4000-8000-000000000413', true, '00000000-0000-4000-8000-000000000101', 130),
  ('ME', 'dzongkha-language-general-knowledge', 'Dzongkha Language & General Knowledge', 'ME Paper I (Dzongkha).',
   '00000000-0000-4000-8000-000000000421', true, '00000000-0000-4000-8000-000000000101', 210),
  ('ME', 'english-language-current-affairs', 'English Language & Current Affairs', 'ME Paper II (Dzongkha).',
   '00000000-0000-4000-8000-000000000422', true, '00000000-0000-4000-8000-000000000101', 220),
  ('ME', 'buddhist-studies', 'Buddhist Studies', 'ME Paper III (Dzongkha).',
   '00000000-0000-4000-8000-000000000423', true, '00000000-0000-4000-8000-000000000101', 230),
  ('ME', 'language-general-knowledge', 'Language and General Knowledge', 'ME Paper I (Technical).',
   '00000000-0000-4000-8000-000000000431', true, '00000000-0000-4000-8000-000000000101', 310),
  ('ME', 'general-subject-knowledge', 'General Subject Knowledge', 'ME Paper II (Technical).',
   '00000000-0000-4000-8000-000000000432', true, '00000000-0000-4000-8000-000000000101', 320),
  ('ME', 'dzongkha-language', 'Dzongkha Language', 'ME Paper I (B.Ed).',
   '00000000-0000-4000-8000-000000000441', true, '00000000-0000-4000-8000-000000000101', 410),
  ('ME', 'english-language', 'English Language', 'ME Paper II (B.Ed).',
   '00000000-0000-4000-8000-000000000442', true, '00000000-0000-4000-8000-000000000101', 420),
  ('ME', 'teacher-aptitude', 'Teacher Aptitude', 'ME Paper III (B.Ed).',
   '00000000-0000-4000-8000-000000000443', true, '00000000-0000-4000-8000-000000000101', 430);

-- ---------------------------------------------------------------------------
-- Packages (prices are editable data). Both start as "coming soon": nothing
-- can be sold until access duration is set and payments are enabled (M8).
-- The combined package must stay unavailable until ME materials are ready.
-- ---------------------------------------------------------------------------
insert into public.packages (slug, name, tagline, description, price, features, includes_pe, includes_me, cycle_id, status, terms, sort_order) values
  ('pe-premium', 'PE Premium', 'Complete Preliminary Examination preparation',
   'Full-length PE simulations, subject-wise and topic-wise practice, detailed explanations and performance analytics.',
   499,
   '["Full-length timed PE mock examinations", "OMR-style answer-sheet practice", "Subject-wise and topic-wise practice", "Detailed answers and explanations", "Bhutan current-affairs practice", "Performance analytics and revision suggestions"]'::jsonb,
   true, false, '00000000-0000-4000-8000-000000000502', 'coming_soon',
   'Access period and included content will be confirmed before sales open.', 10),
  ('pe-me-premium', 'PE + ME Premium', 'Preparation for both stages of the BCSE',
   'Everything in PE Premium, plus Main Examination written-paper practice with model answers and marking rubrics.',
   799,
   '["Everything in PE Premium", "ME written-examination simulations by category", "Model answers and marking rubrics", "Written-answer practice with word counts"]'::jsonb,
   true, true, '00000000-0000-4000-8000-000000000502', 'coming_soon',
   'Offered only when ME materials are ready. Access period and included content will be confirmed before sales open.', 20);
