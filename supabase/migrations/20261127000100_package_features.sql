-- =============================================================================
-- Soma Preparations — Package feature lists shown on the Free / Premium choice
-- (founder's request, 2026-11-16). Only replaces the lists if they are still
-- the original wording; edits made in Admin → Packages are kept.
-- =============================================================================
update public.packages set features =
  '["Every practice question in all four sections (English, Dzongkha, Aptitude, Data Interpretation)", "All timed mock tests, like the real PE", "Your daily plan with revision of your mistakes", "Explanations for every answer", "Scores and progress for every section", "Current affairs: daily news and quizzes"]'::jsonb
where slug = 'pe-premium'
  and features = '["Full-length timed PE mock examinations", "OMR-style answer-sheet practice", "Subject-wise and topic-wise practice", "Detailed answers and explanations", "Bhutan current-affairs practice", "Performance analytics and revision suggestions"]'::jsonb;

update public.packages set features =
  '["Written questions and papers for your entry", "100 AI-marked answers: type your answer or upload photos of your handwritten pages", "AI feedback: strengths, missing points and an improved answer", "Model answers and marking guides", "Current affairs: daily news and quizzes", "Scores and progress"]'::jsonb
where slug = 'me-premium'
  and features = '["Written-paper practice for your ME pathway and specialisation", "Model answers and marking rubrics", "AI feedback on typed and handwritten answers", "Current-affairs practice", "Performance tracking"]'::jsonb;
