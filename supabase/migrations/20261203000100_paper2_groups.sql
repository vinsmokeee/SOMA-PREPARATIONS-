-- Technical Paper II group set from the specialisation, so students do not choose it themselves
-- (founder, 17 Nov 2026: the separate "Paper II group" step was confusing).
-- RCSC publishes the 2025 Paper II groups (Statistics, Medical Science, Engineering, Traditional Medicine,
-- ICT, Bio Science, Nursing, Conservator) but not which specialisation sits which group. This grouping is
-- Soma's proposal, marked unverified on each specialisation; administrators correct it in Exam structure.
with map(spec_code, group_code) as (values
  -- Engineering
  ('agriculture-engineering', 'engineering'), ('automobile-engineering', 'engineering'), ('architecture', 'engineering'),
  ('aeronautical-engineering', 'engineering'), ('biomedical-engineering', 'engineering'), ('civil-engineering', 'engineering'),
  ('electrical-engineering-2025', 'engineering'), ('electronics-communication-engineering', 'engineering'),
  ('instrumentation-control-engineering', 'engineering'), ('meteorology-hydrology', 'engineering'), ('mechanical-engineering', 'engineering'),
  ('survey-engineering', 'engineering'), ('urban-planning', 'engineering'), ('water-engineering', 'engineering'), ('mining', 'engineering'),
  ('mechatronic-engineering', 'engineering'), ('geology', 'engineering'),
  -- ICT
  ('ict', 'ict'), ('gis', 'ict'),
  -- Medical Science
  ('mbbs-medicine', 'medical-science'), ('cardiology', 'medical-science'), ('neurology', 'medical-science'), ('dental-surgery', 'medical-science'),
  ('radiology', 'medical-science'), ('physiotherapy', 'medical-science'), ('optometry', 'medical-science'),
  ('occupational-therapy-technology', 'medical-science'), ('medical-laboratory-technology', 'medical-science'),
  ('clinical-counselling', 'medical-science'), ('emergency-medical-response', 'medical-science'), ('public-health', 'medical-science'),
  ('nutrition-dietetics', 'medical-science'),
  -- Nursing, Traditional Medicine, Statistics, Conservator
  ('nursing', 'nursing'), ('drungtsho', 'traditional-medicine'), ('statistics', 'statistics'), ('conservator', 'conservator'),
  -- Bio Science
  ('agriculture', 'bio-science'), ('animal-science', 'bio-science'), ('biotechnology', 'bio-science'), ('chemistry', 'bio-science'),
  ('bio-science', 'bio-science'), ('environmental-science', 'bio-science'), ('food-science', 'bio-science'), ('forestry', 'bio-science'),
  ('horticulture', 'bio-science'), ('microbiology', 'bio-science'), ('veterinary-science', 'bio-science'),
  ('beautification-officer', 'bio-science')
)
update public.specialisations s
set subject_group_id = g.id,
    verification_status = 'unverified',
    review_note = trim(both ' ' from coalesce(s.review_note, '') || ' Paper II group "' || g.name || '" proposed by Soma (RCSC does not publish the grouping): confirm or change it.')
from map m join public.subject_groups g on g.code = m.group_code
where s.code = m.spec_code and s.subject_group_id is null;
