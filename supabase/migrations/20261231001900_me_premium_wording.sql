-- ME Premium package wording, updated for the features as they now work (founder, 23 Nov 2026): subject
-- confirmation and lock, typed English / handwritten Dzongkha answers, subject-only daily plan.
-- Only true, current features; AI scores are described as indicative, never as RCSC marks.
update public.packages set
  tagline = 'Complete written-paper preparation for your ME category and subject',
  description = 'Preparation for the Main Examination written papers of your category and subject (General, Technical, Dzongkha or B.Ed.): timed RCSC-pattern mock papers, model answers, marking guides and AI feedback on your answers. Does not include the PE.',
  features = jsonb_build_array(
    'Your subject only: Papers I, II and III for the subject you confirm. Your subject is locked, so every question you see is relevant to you.',
    'RCSC-pattern mock papers: Timed full papers that follow the official BCSE layout, with reading time and "answer any" choices, built from past RCSC questions.',
    'AI marking: Up to 100 written answers marked with an indicative score and detailed feedback.',
    'Answer the exam way: Type your English answers. Dzongkha answers, drawings and calculations can also be written by hand and uploaded as photos.',
    'Your Coach: Your strengths, the points you missed and an improved answer for every marked answer.',
    'Model answers and marking guides: See what examiners look for in each answer.',
    'Daily training: A short practice plan every day from your own subject, with revision of past mistakes.',
    'Progress and analysis: Scores for each paper, your weak areas and your full answer history.',
    'Current affairs: Daily Bhutan and world news notes to use in your answers.',
    'Exam countdown: A countdown to your exam with a last-minute revision summary.'
  ),
  terms = '45 days of access from the day your package is activated. AI scores are Soma''s indicative estimates, not official RCSC marks. The written examination is one part of selection; academic marks and the interview also count toward the final result.',
  updated_at = now()
where slug = 'me-premium';
