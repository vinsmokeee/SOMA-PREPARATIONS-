-- ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'general-subject-knowledge'), 'traditional-medicine-general-subject-knowledge', 'Traditional Medicine: general subject knowledge' on conflict (subject_id, slug) do nothing;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-2') and subject_group_id is not distinct from (select id from public.subject_groups where code = 'traditional-medicine');
insert into public.paper_group_settings (paper_id, subject_group_id, duration_minutes, reading_minutes, max_marks, source) values ((select id from public.exam_papers where code = 'me-technical-2'), (select id from public.subject_groups where code = 'traditional-medicine'), 90, 15, 100, 'BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine') on conflict (paper_id, subject_group_id) do update set duration_minutes = excluded.duration_minutes, reading_minutes = excluded.reading_minutes, max_marks = excluded.max_marks, source = excluded.source;
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-2'), (select id from public.subject_groups where code = 'traditional-medicine'), null, 1, 'Section Ka, Q1: Multiple choice (སྡེ་ཚན་ཀ)', 'mcq', 55, 1, null, 'BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-2'), (select id from public.subject_groups where code = 'traditional-medicine'), null, 2, 'Section Ka, Q2-Q4: Fill in, true or false, matching', 'short_answer', 3, 5, null, 'BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-2'), (select id from public.subject_groups where code = 'traditional-medicine'), null, 3, 'Section Kha: Written questions (སྡེ་ཚན་ཁ)', 'descriptive', 9, 3, null, 'BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'མེ་དྲོད་དང་ལུས་ཀྱི་སྟོབས་སྐྱེད་ནི། བོ་རོ་ཞིང་དྲན་པ་གསལ་ནི་ལུ་ཕན་ཐོགས་མི་འདི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'རྩི་མར་གསར་འཇམ་གྱི་ཞུན་མར་ཨིན།', true, 1), ('B', 'རྩི་མར་དང་འབྲུ་མར་འདྲེས་པའི་ཞུན་མར་ཨིན།', false, 2), ('C', 'རྩི་མར་དང་རྐང་མར་འདྲེས་པའི་ཞུན་མར་ཨིན།', false, 3), ('D', 'རྩི་རམ་རྙིང་པའི་ཞུན་རམ་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'སྨན་ཨ་རུ་ར་འཁྲུངས་ས་འདི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ཤར་ཕྱོགས་ཀྱི་རི་ནང་ཨིན།', false, 1), ('B', 'བྱང་ཕྱོགས་ཀྱི་རི་ནང་ཨིན།', false, 2), ('C', 'ལྷོ་ཕྱོགས་ཀྱི་རི་ནང་ཨིན།', true, 3), ('D', 'ནུབ་ཕྱོགས་ཀྱི་རི་ནང་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'བྱིས་པའི་རྐང་མཐིལ་དང་མཚོགས་མ་གཉིས་མེ་དང་ཉིམ་གྱིས་མ་བསྲེག་པར་བཞག་དགོ་མི་འདི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'བྱིས་པའི་ཤ་སྙི་བའི་ཕྱིར།', false, 1), ('B', 'བྱིས་པའི་མིག་གསལ་པོར་ཡོང་བའི་ཕྱིར།', true, 2), ('C', 'བྱིས་པ་པགས་ནད་ལས་བསྲུང་བའི་ཕྱིར།', false, 3), ('D', 'བྱིས་པར་མཁྲིས་པའི་ནད་ཞུགས་པའི་ཕྱིར།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'གདོན་སེལ་ཚེ་རིང་མཁའ་འགྲོས་བྱིན་གྱིས་རོབས། །ཞེས་པའི་བཅུད་ལེན་འདི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'མེ་ཏོག་གི་བཅུད་ལེན་གྱི་ཕན་ནུས་ཨིན།', false, 1), ('B', 'བདུད་རྩིའི་བཅུད་ལེན་གྱི་ཕན་ནུས་ཨིན།', false, 2), ('C', 'ས་ཡི་བཅུད་ལེན་གྱི་ཕན་ནུས་ཨིན།', false, 3), ('D', 'ཅོང་ཞིའི་བཅུད་ལེན་གྱི་ཕན་ནུས་ཨིན།', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'བྱིས་པ་སྐབས་སྐབས་སུ་བསྐུ་མཉེ་བྱ་ཞིང་མེ་དང་ཉི་མའི་འོད་མིག་ལ་མ་འཕོག་པར་ལུས་རན་པར་བསོ་བར་བྱ་དགོས་པ་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ལུས་ཀྱི་སྟོབས་དང་གཟི་མདངས་རྒྱས་པའི་ཕྱིར།', false, 1), ('B', 'ཚེ་རིང་བར་གྱུར་ཞིང་དབང་པོ་གསལ་བའི་ཕྱིར།', true, 2), ('C', 'བྱིས་པ་པགས་ནད་དང་མིག་ནད་ལས་སྲུང་བའི་ཕྱིར།', false, 3), ('D', 'མིག་སྟོབས་ཞན་པར་མི་འགྱུར་བའི་ཕྱིར།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ཁ་དང་མིག་གཡོ་བ་ལུ་མེ་བཙའ་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ར་འགྲམ་བསྲེག', true, 1), ('B', 'སྤྱི་གཙུག་བསྲེག', false, 2), ('C', 'ལྟག་ཟུར་སྤུ་འཁྱིལ་བསྲེག', false, 3), ('D', 'མཚོག་གསང་བསྲེག', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'སྙིང་གསང་ཆེན་མོའི་འཇལ་ཚད་དེ་ཡང་།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'བྲང་གཞུང་དཀར་ནག་མཚམས་ལས་གཡས་གཡོན་དུ་ཚོན་གང་རེ་བཅལ་བ།', true, 1), ('B', 'བྲང་གཞུང་དང་ནུ་མ་ནས་གཡས་གཡོན་དང་ཐུར་དུ་ཚོན་གང་རེ་བཅལ་བ།', false, 2), ('C', 'བྲང་གཞུང་དཀར་ནག་མཚམས་ལས་གཡས་གཡོན་དུ་ཚོན་དོ།', false, 3), ('D', 'ནུ་མ་ནས་ཐུར་དུ་ཚོན་གང་རེ་བཅལ་བ།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'བྱིས་པའི་ར་རྩ་དང་མཛུབ་རྩར་བརྟག་པའི་སྐབས་ལུ་སྤྱིར་བཏང་ར་བ་གཡོན་པར་རྩ་གསུམ་འདོན་པ་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ཐོག་སྙིང་རྩ། བར་མཆེར་རྩ། ཐ་མ་མཁལ་གཡོན་དང་ལྒང་པའི་རྩ་ཨིན།', false, 1), ('B', 'ཐོག་སྙིང་རྩ། བར་མཆིན་རྩ། ཐ་མ་མཁལ་གཡས་ཀྱི་རྩ་ཨིན།', false, 2), ('C', 'ཐོག་སྙིང་རྩ། བར་མཆེར་རྩ། ཐ་མ་མཁལ་གཡས་ཀྱི་རྩ་ཨིན།', false, 3), ('D', 'ཐོག་སྙིང་རྩ། བར་མཆེར་རྩ། ཐ་མ་མཁལ་གཡོན་གྱི་རྩ་ཨིན།', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'གཟུགས་འདར། གྲང་ཤུམ་བརྐྱབས། དཔྱི་མིག་དང་རྐེདཔ་སོགས་རུས་ཚིགས་ཚུ་ན། མིག་ཏོ་གསལ་ཏོ་ཏོ་མེད། ལྟོཝ་དཀྱེསཔ་ ད་ན། ཁ་ལས་སྐྱུགས་ནི་བཟུམ་འབད་མི་འདི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'རླུང་གི་རྟགས་ཨིན།', true, 1), ('B', 'མཁྲིས་པའི་རྟགས་ཨིན།', false, 2), ('C', 'ཁྲག་ནད་ཀྱི་རྟགས་ཨིན།', false, 3), ('D', 'བད་ཀན་གྱི་རྟགས་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'སྤྱི་གཙུག་ནས་རྐང་མཐིལ་བར་གྱི་ནད་རམས་བཅོས་ཐབས་ཀྱི་གདམས་པ་མན་ངག་གི་གནད་རམས་གསལ་ལ་མ་འདྲེས་ པར་སོན་པའི་ནོར་བུ་ལྟ་བུ་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'རྩ་རྒྱུད་འདི་ཨིན།', false, 1), ('B', 'ཕྱི་མ་རྒྱུད་འདི་ཨིན།', false, 2), ('C', 'བཤད་རྒྱུད་འདི་ཨིན།', false, 3), ('D', 'མན་ངག་རྒྱུད་འདི་ཨིན།', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ཟས་ཟ་ཐངས་མི་མཁས་པ་ཉི་མ་ཤ་ཆང་ལུ་ལོངས་སོད་པ་འདི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'རྒྱུའི་ཡལ་ག་ལས་གྱེས་པའི་ལོ་མ་ཡིན།', false, 1), ('B', 'འཇུག་སྒོའི་ཡལ་ག་ལས་གྱེས་པའི་ལོ་མ་ཨིན།', false, 2), ('C', 'གནས་ཀྱི་ཡལ་ག་ལས་གྱེས་པའི་ལོ་མ་ཨིན།', false, 3), ('D', 'རྐྱེན་གྱི་ཡལ་ག་ལས་གྱེས་པའི་ལོ་མ་ཨིན།', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'མཁྲིས་པ་རྒྱུ་མར་བབས་ནས་སེར་པོ་འཁྲུ་བ་ལ་སྨན་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'མཁྲིས་ཕྱེ་༧ པ་དང། བྲག་ཞུན་༩ པ་ཟབ།', false, 1), ('B', 'བྲག་ཞུན་༩ པ་དང་། ཏིག་ཏ་༨ པ་ཟབ།', true, 2), ('C', 'གམ་ཕྱེ་དམར་པོ་དང། གསེར་མདོག་༡༡ ཟབ།', false, 3), ('D', 'ཅོང་ཞི་༦ པ་དང་། ཞི་བྱེད་༦ པ་ཟབ།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ཁྱད་པར་སྨན་སོར་གྱི་ཉིནམ་བཟང་ཤོས་འདི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'འཕོད་ཆུང་ཆུ་གཉིས་འཕད་པའི་སྐབས།', false, 1), ('B', 'འཕོད་ཆུང་མེ་གཉིས་འཕད་པའི་སྐབས།', false, 2), ('C', 'འཕོད་ཆུང་ས་ཆུ་འཕད་པའི་སྐབས།', true, 3), ('D', 'འཕོད་ཆུང་མེ་རླུང་འཕད་པའི་སྐབས།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'གསོ་རིག་གཞུང་ལུགས་ཆེན་པོ་ལ་འགྱུར་བྱེད་ལོ་པཎ་གྱི་ཕྱག་ཞེས་པའི་སྐབས་ཀྱི་འགྱུར་བྱེད་ལོ་པཎ་གཉིས་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ལོ་ཙཱ་བ་བཻ་རོ་ཙ་ན་དང་མཁན་ཆེན་ཟླ་བ་མངོན་དགའ་ཨིན།', true, 1), ('B', 'ལོ་ཙཱ་བ་བཻ་རོ་ཙ་ན་དང་མཁན་ཆེན་ཁྲོ་རུ་ཚེ་རམ་ཨིན།', false, 2), ('C', 'ལོ་ཙཱ་བ་བཻ་རོ་ཙ་ན་དང་མཁན་ཆེན་མཁྱེན་རབ་ནོར་བུ་ཨིན།', false, 3), ('D', 'ལོ་ཙཱ་བ་བཻ་རོ་ཙ་ན་དང་མཁན་ཆེན་ཐུབ་བསན་ལེགས་པའི་བོ་གྲོས་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'གཡུ་ཐོག་རྙིང་མ་ཡོན་ཏན་མགོན་པོ་གིས་མཛད་གནང་མི་རྩ་རྒྱུད་ཀྱི་སོང་འགྲེམས་འདི་བ་སྨན་མཁན་རབ་ནོར་བུ་གིས།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'སྤྱི་ལོ་༡༨༨༤ ལས་སྤྱི་ལོ་༡༩༦༣ ཀྱི་བར་དག་བཅོས་མཛད་གནང་ནུག', false, 1), ('B', 'སྤྱི་ལོ་༡༨༨༥ ལས་སྤྱི་ལོ་༡༩༦༤ ཀྱི་བར་དག་བཅོས་མཛད་གནང་ནུག', false, 2), ('C', 'སྤྱི་ལོ་༡༨༨༣ ལས་སྤྱི་ལོ་༡༩༦༢ ཀྱི་བར་དག་བཅོས་མཛད་གནང་ནུག', true, 3), ('D', 'སྤྱི་ལོ་༡༨༨༢ ལས་སྤྱི་ལོ་༡༩༦༡ ཀྱི་བར་དག་བཅོས་མཛད་གནང་ནུག', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ལྷ་ཆེན་པོ་ཚངས་པ་ལུ་གསོ་དཔྱད་ཀྱི་བུམ་པ་འདི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'བཀའ་དང་པོ་བདེན་པ་བཞིའི་ཆོས་ཀྱི་འཁོར་ལོ་བསྐོར་བའི་སྐབས་སུ་གསུངས་ནུག', true, 1), ('B', 'བཀའ་དང་པོ་བདེན་པ་བཞི་དང་བར་པ་མཚན་ཉིད་མེད་པའི་ཆོས་ཀྱི་འཁོར་ལོ་བསྐོར་བའི་སྐབས་སུ་གསུངས་ནུག', false, 2), ('C', 'བཀའ་ཐ་མ་ལེགས་པར་རམ་པར་འབྱེད་པའི་ཆོས་ཀྱི་འཁོར་ལོ་བསྐོར་བའི་སྐབས་སུ་གསུངས་ནུག', false, 3), ('D', 'བཀའ་བར་པ་མཚན་ཉིད་མེད་པའི་ཆོས་ཀྱི་འཁོར་ལོ་བསྐོར་བའི་སྐབས་སུ་གསུངས་ནུག', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'འཚོ་བྱེད་གཞོན་ནུ་གིས་འདྲེ་ཚུ་དང་འཐབ་པའི་སྐབས་དམུ་ཆུའི་ནད་ཀྱི་གཉེན་པོ།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ལ་ཕུག་གི་ས་བོན་མར་དང་སར་མི་འདི་ཨིནམ་ཤེས་ནུག', false, 1), ('B', 'ར་སྤུ་དང་ལ་ཕུག་གི་ས་བོན་མེ་བཏང་པའི་དུད་པ་འདི་ཨིནམ་ཤེས་ནུག', true, 2), ('C', 'ར་སྤུ་གི་དུད་པ་ཨིནམ་ཤེས་ནུག', false, 3), ('D', 'ལ་ཕུག་གི་ས་བོན་དརཝ་དང་སར་མི་འདི་ཨིནམ་ཤེས་ནུག', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'འཚོ་བྱེད་གཞོན་ནུ་སྨན་པའི་རྒྱལ་པོར་ཐེངས་གཉིས་པ་དབང་བསྐུར་དགོ་མི་འདི་ཡང་།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'རྒྱལ་པོའི་ཁབ་ཀྱི་རྒྱལ་པོའི་སྤྱི་གཙུག་གི་སྲིན་ཐོལ་སྨན་བཅོས་འབདཝ་ལས།', true, 1), ('B', 'བཙུན་མོ་གསར་མོ་མའི་གསང་གནས་ཀྱི་སྲིན་ཐོལ་སྨན་བཅོས་འབདཝ་ལས།', false, 2), ('C', 'བཙུན་མོ་ལུས་འཕགས་མའི་གསང་གནས་ཀྱི་སྲིན་ཐོལ་སྨན་བཅོས་འབདཝ་ལས།', false, 3), ('D', 'རྒྱལཔོ་མ་སྐྱེས་དགྲ་ཡི་སྐྲན་ནད་སྨན་བཅོས་འབདཝ་ལས།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'གཡུ་ཐོག་གསར་མ་ཡོན་ཏན་རྒྱལ་པོ་གིས་སྐུ་ཚེ་གཅིག་གི་རིང་སྨན་དཔྱད་ཀྱི་འཕྲིན་ལས་བསྐྱངས་ཏེ་འགྲོ་བ་སེམས་ཅན་གྱི་དོན་ ལུ་མི་ལོ་ལེ་ཤ་བཞུགས་པའི་རིང་བུ་སློབ་ཚུ་གི་དོན་ལུ།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'གསོ་དཔྱད་ཡན་ལག་བརྒྱད་པ་ཟེར་མི་བརྩམས་གནང་ནུག', false, 1), ('B', 'ས་བཅད་བསྡུས་དོན་དྲྲྭ་བ་ཟེར་མི་བརྩམས་གནང་ནུག', false, 2), ('C', 'ཤོག་དྲིལ་སྐོར་གསུམ་ཟེར་མི་བརྩམས་གནང་ནུག', true, 3), ('D', 'གསུང་སྒྲོས་ཕན་བྱེད་རིག་པའི་མཛོད་ཟེར་མི་བརྩམས་གནང་ནུག', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'སྡེ་སྲིད་སངས་རྒྱས་རྒྱ་མཚོའི་སྐབས་ལུ་གསར་རྩོམ་མཛད་དེ་ད་རེས་ནངས་པ་ཡང་ཡོངས་གྲགས་ལུ་ཡོད་པའི་རྒྱུད་བཞིའི་འགྲེལ་ པ་འདི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'རྒྱུད་བཞིའི་འགྲེལ་པ་དྲང་སོང་དགྱེས་པའི་ཞལ་ལུང་འདི་ཨིན།', false, 1), ('B', 'རྒྱུད་བཞིའི་འགྲེལ་པ་བཻར་སྔོན་འདི་ཨིན།', true, 2), ('C', 'རྒྱུད་བཞིའི་འགྲེལ་པ་མེས་པོའི་ཞལ་ལུང་འདི་ཨིན།', false, 3), ('D', 'རྒྱུད་བཞིའི་འགྲེལ་པ་པོད་ཤེལ་ཕ་མི་འདི་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'འབྱུང་བ་ལྔ་ཚང་བའི་ཁར་སྐྱེ་འགྲོའི་རིགས་དང་སྐྱེས་དངོས་ཐམས་ཅད་འཚར་སྐྱེས་བྱེད་ཐུབ་པས་གཟའ་རཱ་ཧུ་ལ་འདི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'བཀྲིས་པའི་གཟའ་ཟེར་ཡང་སབ་ཨིན།', false, 1), ('B', 'དབང་ཐང་གི་གཟའ་ཟེར་ཡང་སབ་ཨིན།', true, 2), ('C', 'གཡང་གི་གཟའ་ཟེར་ཡང་སབ་ཨིན།', false, 3), ('D', 'བསོད་ནམས་ཀྱི་གཟའ་ཟེར་ཡང་སབ་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ཨ་རུ་བ་རུ་སྐྱུ་རུ་སྟེ་འབྲས་གསུམ་སྨན་མར་གྱིས་དམིགས་བསལ་དུ་ནད་ག་ཅི་ལུ་ཕནམ་སྨོ?', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'འདུས་ནད་ཅན་ལུ་ཕན།', true, 1), ('B', 'གྲང་ཤས་ཅན་ལུ་ཕན།', false, 2), ('C', 'ཚ་ཤས་ཅན་ལུ་ཕན།', false, 3), ('D', 'རླུང་ཤས་ཅན་ལུ་ཕན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'པོ་ཏཱ་ལ་ཡི་ཐེམ་སྐས་ལས། ལྕེ་སྟེང་དུ་ཧྲཱིཿཡིག་འདི་གུར་གུམ་གྱི་བྲིས་དགོཔ་ཨིན་རུང་མེད་ན་ཚབ་ལུ།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'གི་ཝང་དང་ཙན་དམར། གླ་རྩི་འདི་བཏུབ་སྦེ་གསུངས་ནུག', false, 1), ('B', 'གི་ཝང་དང་ཙན་དཀར་འདི་བཏུབ་སྦེ་གསུངས་ནུག', false, 2), ('C', 'གི་ཝང་དང་གླ་རྩི་འདི་བཏུབ་སྦེ་གསུངས་ནུག', true, 3), ('D', 'གླ་རྩི་དང་ཙན་དཀར་འདི་བཏུབ་སྦེ་གསུངས་ནུག', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ཕལ་ཆེར་རུས་འབྲས་མི་འབྱུང་བའི་གནས་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'པུས་མོ་ཨིན།', false, 1), ('B', 'བྲང་རུས་ཨིན།', false, 2), ('C', 'སྣ་ཨིན།', true, 3), ('D', 'མ་མགལ་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'མགོ་དང་བྲང་རུས་འབྲེལ་ཏེ་ལྟག་ཀོ་ཕར་ཚུར་དང་ཡར་མར་འགུལ་བསྐྱོད་འབད་མི་ཨིང་སྐད་ནང་(SCM) Sternocleido- mastoid ཟེར་མི་འདི་གསོ་བ་རིག་པའི་ནང་།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'རྒྱང་ཤ་ལས་བྱེད་ཟེར་སབ་ཨིན།', false, 1), ('B', 'ལྟག་ཟུར་རྒྱང་ཤ་ལས་བྱེད་ཆེན་པོ་ཟེར་སབ་ཨིན།', true, 2), ('C', 'ཕྱག་པའི་ཆུ་རྩ་དྲྲྭ་བ་ཟེར་སབ་ཨིན།', false, 3), ('D', 'མ་མགལ་རྒྱང་ཤ་ཟུར་རྩེ་ཟེར་སབ་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ཟས་ལ་འཁྲེན་པ་སྟེ་ཟས་འདོད་ཀྱང་ཟོས་འཕལ་དུ་སྐྱུགས་པ་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ཁོང་འབྲས་ཁྱད་པར་གྱི་རྟགས་ཡིན།', true, 1), ('B', 'རྩ་འབྲས་ཁྱད་པར་གྱི་རྟགས།', false, 2), ('C', 'རུས་འབྲས་ཁྱད་པར་གྱི་རྟགས།', false, 3), ('D', 'ཕྱི་འབྲས་ཁྱད་པར་གྱི་རྟགས་ཡིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'བུ་མོའི་གཞོན་ནུའི་རིགས་ལ་ནུ་འབྲས་ཕལ་ཆེར་འབྱུང་བར་མི་འགྱུར་ཏེ། ཅིའི་ཕྱིར་ཞེ་ན།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ནུ་མའི་རྩ་སྒོ་ཤིན་ཏུ་ཕ་བ་ལས་བརྟེན།', true, 1), ('B', 'ནུ་མའི་རྩ་སྒོ་ཁ་ཕྱེ་ཞིང་ཆེ་རུ་ཕྱིན་པ་ལས་བརྟེན།', false, 2), ('C', 'ནུ་མའི་རྩ་སྒོ་ཤིན་ཏུ་ཡང་ཞིང་གཡོ་བ་ལས་བརྟེན།', false, 3), ('D', 'ནུ་མའི་རྩ་སྒོ་ཤིན་ཏུ་སྤྲིངས་པ་ལས་བརྟེན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'གཞང་འབྲུམ་གྱི་ནད་སར་མི་ལྡང་བའི་ཆེད་དུ།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ནས་ཕྱེ་དང་འོ་མའི་སྐྱོ་མ་བསྟེན།', false, 1), ('B', 'ནས་ཕྱེ་དང་དར་བའི་སྐྱོ་མ་བསྟེན།', true, 2), ('C', 'སན་ཕྱེ་དང་འོ་མའི་སྐྱོ་མ་བསྟེན།', false, 3), ('D', 'སན་ཕྱེ་དང་དར་བའི་སྐྱོ་མ་བསྟེན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ཟླ་ཐོ་འགྲོལ་བའི་ལྡེ་མིག་ལས་གཏར་སྲེག་དང་དབྱུག་བཅོས་ཚུ་འཛེམས་དགོཔ་སྦེ་འཐོན་མི་འདི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'འཕོད་སོར་སྲེག་ཚེས་ཕོགཔ་ད་ཨིན།', false, 1), ('B', 'འཕོད་སོར་མི་འཕོད་ཉི་མ་ཕོགཔ་ད་ཨིན།', false, 2), ('C', 'འཕོད་སོར་སྲེག་སོར་ཕོགཔ་ད་ཨིན།', false, 3), ('D', 'འཕོད་སོར་བདུད་ཉིར་ཕོགཔ་ད་ཨིན།', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'གླང་ཤུ་ཟེར་པགས་ཀོ་སྟུག་པག་པག་སྦེ་སེར་གུ་ཐོན་ཏེ་གཡའ་བའི་པགས་ཀོའི་ནད་ལུ།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ར་ཚིལ་དང་མུ་ཟི་ནག་པོ་སར་བས་ཕན།', true, 1), ('B', 'ཤ་བའི་ཚིལ་བུ་དང་མུ་ཟི་ནག་པོ་སར་བས་ཕན།', false, 2), ('C', 'རྟ་རྐྱང་བོང་ཚིལ་དང་མུ་ཟི་ནག་པོ་སར་བས་ཕན།', false, 3), ('D', 'ཕྱག་ཚིལ་དང་མུ་ཟི་ནག་པོ་སར་བས་ཕན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'རུས་པའི་ལྡང་ཚད་གཙོ་ཆེ་བའི་དབང་དུ་བྱས་ན།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M31', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'རུས་རིགས་མི་འདྲ་བ་༢༤།', false, 1), ('B', 'རུས་རིགས་མི་འདྲ་བ་༢༣།', true, 2), ('C', 'རུས་རིགས་མི་འདྲ་བ་༢༢།', false, 3), ('D', 'རུས་རིགས་མི་འདྲ་བ་༢༡།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M31';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'རམ་ཤེས་ཚོགས་དྲུག་གསལ་བར་བྱེད་པའི་རྩ་གཙོ་བོ་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M32', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'སྙིང་ལ་སྲིད་ཅིང་རྩ་ཕན་ལྔ་བརྒྱས་སྐོར།', false, 1), ('B', 'ཀླད་པ་ལ་སྲིད་རྩ་ཕན་ལྔ་བརྒྱས་སྐོར།', true, 2), ('C', 'མཚན་མ་ལ་སྲིད་རྩ་ཕན་ལྔ་བརྒྱས་སྐོར།', false, 3), ('D', 'ལྟེ་བ་ལ་སྲིད་རྩ་ཕན་ལྔ་བརྒྱས་སྐོར།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M32';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ཤིན་ཏུ་ཉེ་བའི་འཆི་ལྟས་གཟུགས་མི་མཐོང་བ་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M33', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ས་ནུས་ཆུ་ལ་ཐིམ་པའི་རྟགས།', true, 1), ('B', 'མེ་ནུས་རླུང་ལ་ཐིམ་པའི་རྟགས།', false, 2), ('C', 'ཆུ་ནུས་མེ་ལ་ཐིམ་པའི་རྟགས།', false, 3), ('D', 'རླུང་ནུས་མཁའ་ལ་ཐིམ་པའི་རྟགས།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M33';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ཁྱད་པར་དུ་གཉན་རིམས་ཕོ་བར་བབས་པ་ན།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M34', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ཁ་མངལ་ལ་དུད་ཁུ་སྐྱུག', false, 1), ('B', 'ཁ་སྐྱ་ལ་ཆུ་སྐྱུར་སྐྱུག', false, 2), ('C', 'ཁ་སྐམ་ལ་བེ་སྣབས་སྐྱུག', false, 3), ('D', 'ཁ་ཁ་ལ་མཁྲིས་པ་སྐྱུག', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M34';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'འོ་མ་ཤི་བ་སྟེ་རུལ་བ་ལྟར་དྲི་ཆུའི་མདོག་དཀར་ལ་དྭངས་སྙིགས་བྱེ་བ་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M35', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'བད་རླུང་ནད་ཀྱི་འཆི་ཆུ་ཨིན།', false, 1), ('B', 'བད་མཁྲིས་ནད་ཀྱི་འཆི་ཆུ་ཨིན།', false, 2), ('C', 'བད་ཀན་ནད་ཀྱི་འཆི་ཆུ་ཨིན།', true, 3), ('D', 'བད་ཁྲག་ནད་ཀྱི་འཆི་ཆུ་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M35';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'རིམས་ཉིན་གཅིག་པ་ཞེས་པ་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M36', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'རིམས་ནད་ཁྲག་ལ་བབས་པའི་མིང་ཡིན།', false, 1), ('B', 'རིམས་ནད་ལྤགས་ལ་བབས་པའི་མིང་ཡིན།', false, 2), ('C', 'རིམས་ནད་སྙིང་ལ་བབས་པའི་མིང་ཡིན།', false, 3), ('D', 'རིམས་ནད་ཤ་ལ་བབས་པའི་མིང་ཡིན།', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M36';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ཅོང་ཞི་རིགས་ལྔ་ཡོད་པའི་གྲལ་ལས་བུ་ཅོང་འདི་གི་ཕན་པ་འདི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M37', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ཁྲག་མཁྲིས་དང་འདུས་ནད་ལུ་ཕན།', false, 1), ('B', 'ཕོ་མོ་གང་རུང་ལུ་བདུད་རྩི་བཟུམ་ཨིན།', false, 2), ('C', 'བཅུད་ལེན་དང་སྙིང་ནད་ལུ་ཕན།', false, 3), ('D', 'མགོ་ཆག་རྨ་ལ་བསྔགས་པ་ཨིན།', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M37';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ལྡང་ཚད་ལ་རང་གི་ཁྱོར་བ་གཅིག་ཡོད་མི་འདི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M38', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ཁྲག་དང་ཕྱི་ས་གཉིས་པོ་ཨིན།', false, 1), ('B', 'ཞག་དང་ཚིལ་བུ་གཉིས་པོ་ཨིན།', false, 2), ('C', 'མདངས་དང་ཁུ་བ་གཉིས་པོ་ཨིན།', true, 3), ('D', 'གཅིན་དང་ཆུ་སེར་གཉིས་པོ་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M38';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'བརྟན་པར་འགྱུར་བ་ཞེས་པའི་རླུང་གི་བྱེད་ལས་ཀྱིས་ཤ་དང་ཚིལ་རམས་ཀྱི་ཆ་ཤས་ཕལ་ཆེར་ཆགས་པ་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M39', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'བདུན་ཕྱག་༡༦ པར་ཨིན།', false, 1), ('B', 'བདུན་ཕྱག་༢༤ པར་ཨིན།', false, 2), ('C', 'བདུན་ཕྱག་༢༢ པར་ཨིན།', false, 3), ('D', 'བདུན་ཕྱག་༡༨ པར་ཨིན།', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M39';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ཆུའི་ཁམས་གསོ་སྐྱེད་ཀྱི་བྱ་བ་བྱེད་པའི་རྩ་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M40', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'སྲོག་རྩ་དཀར་པོ་ཨིན།', false, 1), ('B', 'སྲོག་རྩ་ནག་པོ་ཨིན།', false, 2), ('C', 'འབྲེལ་བའི་རྩ་ཨིན།', true, 3), ('D', 'སྲིད་པའི་རྩ་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M40';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'རླུང་ལ་སོགས་པའི་ནད་ག་ཅི་ར་ཨིན་རུང་།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M41', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'རང་གནས་གསོག་པའི་དུས་ལུ་བསལ་དགོ', false, 1), ('B', 'རང་གནས་ལྡང་བའི་དུས་ལུ་བསལ་དགོ', false, 2), ('C', 'རང་གནས་ལངས་པའི་དུས་ལུ་བསལ་དགོ', false, 3), ('D', 'རང་གནས་ཞི་བའི་དུས་ལུ་བསལ་དགོ', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M41';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ཁྲག་གི་རྩ་དང་སྦྲུམ་མའི་རྩ་གཉིས་འབུར་ལ་འདྲིལ་བར་འཕར་བ་ལས་དེ་གཉིས་ཀྱི་ཁྱད་པར་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M42', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ཁྲག་གི་རྩ་འདི་སྦྲུམ་མའི་རྩ་ལས་ཅུང་ཟད་དལ་བར་འཕརཝ་ཨིན།', false, 1), ('B', 'ཁྲག་གི་རྩ་འདི་སྦྲུམ་མའི་རྩ་ལས་ཅུང་ཟད་འགྱོགས་པར་འཕརཝ་ཨིན།', true, 2), ('C', 'ཁྲག་གི་རྩ་འདི་སྦྲུམ་མའི་རྩ་ལས་དཔངས་མཐོ་བར་འཕརཝ་ཨིན།', false, 3), ('D', 'ཁྲག་གི་རྩ་འདི་སྦྲུམ་མའི་རྩ་ལས་ཅུང་ཟད་ལྷོད་པར་འཕརཝ་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M42';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'གཤམ་གསལ་རླུང་སྨན་ཚུ་གི་གྲལ་ལས་བསིལ་ཆུང་ཡོད་མི་འདི་ངོས་བཟུང་།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M43', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ཨ་གར་༨ པ་ཨིན།', false, 1), ('B', 'ཨ་གར་༢༠ ཨིན།', false, 2), ('C', 'ཨ་གར་༣༥ ཨིན།', true, 3), ('D', 'བི་མ་ལ་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M43';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ནུ་མ་སྐྲངས་ཤིང་ན་བ་ལ་སྨན་ག་ཅི་གཏང་དགོཔ་ཨིན་ན།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M44', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ཨ་གར་༨ པ་གཏོང་།', false, 1), ('B', 'ཨ་གར་༣༥ གཏོང་།', true, 2), ('C', 'ཨ་གར་༢༠ གཏོང་།', false, 3), ('D', 'ཨ་གར་༡༥ གཏོང་།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M44';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'གློ་བའི་ནད་དང་དབུགས་མི་བདེ་བ་ལ་སྨན་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M45', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'རྒུན་འབྲུམ་༧ པ་གཏོང་།', false, 1), ('B', 'བོང་དམར་༧ པ་གཏོང་།', true, 2), ('C', 'བདུད་རྩི་འཆི་གསོས་གཏོང་།', false, 3), ('D', 'གཙོ་བོ་༢༥ གཏོང་།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M45';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'བཀྲུ་མ་སླེན་གྱི་སོར་བ་འདི་ནད་གཞི་ག་ཅི་བཟུམ་ལུ་གཏང་དགོཔ་ཨིན་ན།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M46', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ནད་གཞི་མཁྲིས་པ་རྐྱང་པ་ལུ་གཏང་དགོ', false, 1), ('B', 'ནད་གཞི་བད་ཀན་རླུང་དང་ལྡན་པ་ལུ་གཏང་དགོ', false, 2), ('C', 'ནད་གཞི་རླུང་མཁྲིས་དང་ལྡན་པ་ལུ་གཏང་དགོ', true, 3), ('D', 'ནད་གཞི་བད་ཀན་རྐྱང་པ་ལུ་གཏང་དགོ', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M46';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ཆུའི་སྤྲིས་མ་སྦྲང་རྩི་ཆད་པ་དང་འདྲ་ན།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M47', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ཕྱེ་མ་དང་འོ་མ་མ་ཞུ་བ།', false, 1), ('B', 'མར་དང་འོ་མ་མ་ཞུ་བ།', false, 2), ('C', 'འབྲས་དང་འོ་མ་མ་ཞུ་བ།', false, 3), ('D', 'ཤ་དང་འོ་མ་མ་ཞུ་བ།', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M47';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'མིག་ལ་མདའ་རོ་སོགས་མཚོན་ཕྱོགས་ནས་བཙན་ཐབས་སུ་སྐྲངས་པ་ལ།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M48', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'གངས་ཆུ་གྲང་མོའི་བདུག་བྱ།', false, 1), ('B', 'བྱང་མའི་རྨོས་ལྕགས་བདུག་བྱ།', false, 2), ('C', 'སྐར་ཆུའི་བདུག་བྱ།', false, 3), ('D', 'ཆུ་རོ་གྲང་མོའི་བདུག་བྱ།', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M48';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ནད་གཞིའི་སྒོ་ནས་ལུམས་མི་རུང་བ་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M49', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'འབྲས་ནད།', true, 1), ('B', 'སུར་ཡའི་ནད།', false, 2), ('C', 'སྐྱ་རྦབ།', false, 3), ('D', 'ཚབས་ནད།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M49';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'རྩའི་འཕར་ཚུལ་རེས་འགའ་ཐང་བ་སྟེ་ཞེས་པའི་ཐང་བ་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M50', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'རྩའི་འཕར་ཚུལ་གྲིམས་པ།', true, 1), ('B', 'རྩའི་འཕར་ཚུལ་མགྱོགས་པ།', false, 2), ('C', 'རྩའི་འཕར་ཚུལ་གུད་པ།', false, 3), ('D', 'རྩའི་འཕར་ཚུལ་དལ་བ།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M50';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ཨོལ་འཛུམ་གསང་ལུ་མེ་བཙའ་གདབ་པའི་ཕན་ཡོན་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M51', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'གྲེ་བ་ཚ་བ་དང་སྐད་འཛེར་བའི་ནད་ལུ་ཕན།', false, 1), ('B', 'ཨོལ་ཀྲོང་སོས་པའི་ནད་ལུ་ཕན།', false, 2), ('C', 'གློ་བའི་ནད་ཀྱིས་སྐད་འགགས་པ་ལུ་ཕན།', true, 3), ('D', 'བུད་མེད་བུ་བཙས་ནས་སྐྲངས་པར་ཕན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M51';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'རྟག་ཏུ་ཟླ་མཚན་འཛག་པའམ་བུ་འཆོར་བ། བུ་མི་ཆགས་པ་བཅས་ཀྱི་ནད་ལ།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M52', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'རྒྱུ་སོད་གསང་།', false, 1), ('B', 'ལྒང་པའི་གསང་།', false, 2), ('C', 'ལོང་ཕུགས་གསང་།', false, 3), ('D', 'རྒྱུ་སྨད་གསང་།', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M52';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'རྨ་རྒན་སྐྲངས་དང་ཞ་རེངས་སེལ་བར་བྱེད་པ་ནི།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M53', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'མི་རུས་བཙའ་མའི་ལུམས།', false, 1), ('B', 'མཁན་སྐྱའི་ལུམས།', false, 2), ('C', 'འབྲུ་སྣའི་ལུམས།', true, 3), ('D', 'མེ་ཏོག་སྣ་ཚོགས་ལུམས།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M53';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'རླུང་ཚད་གཉིས་འབྱེད་པར།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M54', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'སླེ་ཏྲེས་ཀྱི་གདུས་ཐང་།', false, 1), ('B', 'པི་པི་ལིང་གི་གདུས་ཐང་།', true, 2), ('C', 'མ་ནུ་དང་སླེ་ཏྲེས་ཀྱི་གདུས་ཐང་།', false, 3), ('D', 'བ་ལེ་ཀ་དང་སླེ་ཏྲེས་གདུས་ཐང་།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M54';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'གཞན་ཡང་གཅིན་པའི་ནང་ཁྲག་དོན་པ་དང་། གཅིན་ལམ་ལ་ཚ་ཤར་རྒྱག་པ། ཁུ་བ་འཛག་པ་ལ།', null, 'Claude''s best guess - to be confirmed by a Drungtsho.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'M55', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ལོང་རྩ་གཏར།', false, 1), ('B', 'རྟ་མཐུར་གཏར།', false, 2), ('C', 'བྱིན་ཀྱོག་གཏར།', true, 3), ('D', 'བྱིན་གཞུག་གཏར།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M55';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'དྲི་བ་གཉིས་པ།
བཀོད་རྒྱ། འོག་ལུ་ཡོད་པའི་དྭངས་མ་ལྔ་ངོས་བཟུང་ཞིནམ་ལས་དེ་དག་གང་གི་གསོས་ཡིན་ན་འོས་འབབ་དང་བསྟུན་ས་སྟོང་བསུབ་ཞིནམ་
ད་འདི་དང་འབྲེལ་བའི་ཨང་རྟགས་ཚུ་ལན་ཤོག་ནང་ཅིག་ཁར་འགྲིགས་ཏེ་བྲིས། (༡x༥=༥)
༡ ས་ཡི་དྭངས་མ་ནི།____ (............)
༢ རོ་ཡི་དྭངས་མ་ནི།____ (............)
༣ ཤིང་གི་དྭངས་མ་ནི།____ (............)
༤ མེ་ཏོག་གི་དྭངས་མ་ནི།____ (............)
༥ རྩིའི་དྭངས་མ་ནི།____ (............)', 'Outline (Claude, to be confirmed by a Drungtsho): ༡ ས་ཡི་དྭངས་མ་ - ཅོང་ཞི། ༢ རོ་ཡི་དྭངས་མ་ - ཀ་ར། ༣ ཤིང་གི་དྭངས་མ་ - གུ་གུལ / ཙན་དན། ༤ མེ་ཏོག་གི་དྭངས་མ་ - གུར་གུམ། ༥ རྩིའི་དྭངས་མ་ - སྦྲང་རྩི།', null, '[{"point": "Five essences identified correctly (1 each) - Drungtsho to confirm the key", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 1.0, 3 from me_q where key = 'Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'དྲི་བ་གསུམ་པ།
བཀོད་རྒྱ། འོག་ལུ་ཡོད་པའི་ཚིག་དོན་ཚུ་ལེགས་ཤོམ་སྦེ་ལྷག་ཞིནམ་ལས་ཨིན་པ་ཅིན་ཨིན་རྟགས་ [ཨ] བཀལ་ནི་དང་མིན་པ་ཅིན་མིན་
རྟགས་ [མ] བཀལ་ཏེ་དྲི་བའི་ཨང་དང་འཁྲིལ་ཏེ་ལན་ཤོག་ནང་བྲིས། (༡x༥=༥)
༡ པགས་ནད་འབྲུམ་ཐོར་དང་སོ་སོཔ་ཚུ་ལུ་ལྡེ་གུ་བྱུག་རུངམ་ཨིན། ( )
༢ སྨན་གྱི་རིགས་སུ་གྱུར་པ་མ་འཁྲུངས་པའམ་མ་ཚང་བ་གཅིག་ཀྱང་མེད་པའི་རྒྱན་ཡང་དག་པ་འདི་གསང་བའི་རྒྱན་ཨིན། ( )
༣ སྨན་ཞི་གསེར་ཁྱུང་བསྣན་འདི་བཤང་བ་སྐམས་ནས་འབབ་དཀའ་བའི་གཞང་འབྲུམ་གྱི་ནད་ལུ་གཏངམ་ཨིན། ( )
༤ གཞང་འབྲུམ་གསར་དུ་བྱུང་འཕལ་བུལ་ཏོག་བཏབ་པའི་ཆུ་སྐོལ་གྱི་རངས་པས་བདུག་པ་དང་། ཆུ་དེ་ཉིད་ཀྱིས་བཀྲུ་དགོ།( )
༥ གྲྭ་ཐང་རྒྱུད་བཞི་ཤིང་དཔར་བརྐོས་གནང་མི་འདི་ཟུར་མཁར་བོ་གྲོས་རྒྱལ་པོ་ཨིན། ( )', 'Outline (Claude''s guess, to be confirmed): ༡ [མ] ༢ [ཨ] ༣ [ཨ] ༤ [ཨ] ༥ [མ]', null, '[{"point": "Five true/false answers correct (1 each) - Drungtsho to confirm the key", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 1.0, 3 from me_q where key = 'Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'དྲི་བ་བཞི་པ།
བཀོད་རྒྱ། གཤམ་ལུ་འཁོད་ཡོད་མི་ཚུ་མཐུན་སྒྲིག་འབད་ཞིནམ་ལས། ཨང་རྟགས་དང་ཀ་རྟགས་ཚུ་ཅིག་ཁར་འགྲིགས་ཏེ་ལན་ཤོག་ནང་
བྲིས། (༡x༥=༥)
༡ རྒྱ་ནག་ཡུལ་དུ། ཀ མུན་ཁུང་འབེམ་ལ་བརྡེག་པ་འདྲ།།
༢ སོང་བྱེད་མི་ཤེས་སྨན་པ་འདི། ཁ གཏར་ག་གཙོ་བོ་བསན།
༣ བཅོས་ཚུལ་མི་ཤེས་སྨན་པ་འདི། ག ནང་ཡན་མེད་པའི་རྐུན་མོ་འདྲ།།
༤ ཟས་སོད་མི་ཤེས་སྨན་པ། ང་ མེ་བཙའ་རྩ་སོངས་གསུངས།
༥ དོལ་པོའི་ཡུལ་དུ། ཅ བྱེ་མའི་རི་ལ་ཆུ་འབེབས་འདྲ།།
 ཆ རང་སྲིད་དགྲ་ལ་ལོག་པ་འདྲ།།
 ཇ རྩ་ཆུའི་བརྟག་པ་བསན།', 'Outline (Claude''s guess, to be confirmed): ༡-ཇ (རྒྱ་ནག་ - རྩ་ཆུའི་བརྟག་པ) ༢-ཀ ༣-ཆ ༤-ཅ ༥-ང (དོལ་པོ་ - མེ་བཙའ)', null, '[{"point": "Five correct matches (1 each) - Drungtsho to confirm the key", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 1.0, 3 from me_q where key = 'Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'descriptive', 'དེང་སང་ཕྱི་པའི་ཚན་རིག་ལས་ཐ་དད་པ་ང་བཅས་རའི་ནང་པའི་གསོ་བ་རིག་པའི་གཞུང་ལས། བྱིས་པ་བཙའ་བའི་དུས་སུ་བཀྲ་ཤིས་པའི་
རྟགས་ག་དེ་སྦེ་ར་ཡོདཔ་ཨིན་ན? དེ་བཟུམ་སྦེ་བྱིས་པའི་ལྕེ་སྟེང་ཧྲཱིཿཡིག་གདབ་དགོ་པའི་ཁུངས། སོས་ཆུ་དྲོ་འཇམ་གྱིས་གཟུགས་འཁྱུ་
དགོ་པའི་རྒྱུ་མཚན་བཅས་བྲིས། (༤) (སྐུགས་ ༤)', 'Outline: auspicious signs at birth described in the Gyud-zhi (e.g. the child born healthy with signs of good fortune); writing HRIH on the tongue with saffron (or a substitute) to bless the child''s speech and intellect; washing the body with warm water mixed with medicinal substances to clean, warm and protect the newborn from cold and disease.', null, '[{"point": "Answer marked by a Drungtsho against the Gyud-zhi / textbook (Claude''s outline is only a guide)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'K1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'K1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'K1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'K1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'descriptive', 'སྐྱེས་ལོ་༢༥ ལངས་མི་བུམོ་པདྨ་འོད་འབུམ་འདི་མགོ་ཡུ་འཁོར་ཏེ་སྙིང་འཕར་ཤུགས་ཆེ་བ་དང་། སོང་སྐྱུགས་འབྱུང་བ། ཟ་ཁམས་མི་བདེ་
བ། ཨིན་རུང་འཕལ་འཕལ་ར་ཟས་སྣ་ཚོགས་བཟའ་དགོ་མནོ་བའི་འདོད་པ་དང་། ལུས་སྒྱིད་པ་སྐྱུར་ཏེ་ག་ཅི་ཡང་འབད་དགོ་མ་མནོཝ།
དོན་དག་མེད་པར་རྩིགཔ་ཟ་ནི་ཚུ་འབྱུང་སྟེ་བདུན་ཕྱག་དག་པ་ཅིག་འགྱོ་ཡི་ཟེར་སབ་དེ། ཁྱོད་ར་དྲུང་འཚོ་ཅིག་ཨིན་པའི་ཆ་ལས། (༤)
ཀ__གོང་ལུ་བཀོད་མི་ནད་རྟགས་ཚུ་ལུ་བརྟག་དཔྱད་འབད་བལྟཝ་ད་ནདཔ་འདི་ནད་གཞི་ག་ཅི་ཐོབ་ཡོད་པའི་ངོས་འཛིན་འབད་ནི་སྨོ ?
ཁ__ནད་གཞི་འདི་ལུ་ཕན་པའི་སྨན་ག་ཅི་ར་བཏང་ནི་ཨིན་ན་སྨན་གསུམ་ལས་མ་ཉུངམ་བྲིས།
ག__ནད་གཞི་འདི་ལུ་ཟས་དང་སྤྱོད་ལམ་གྱི་བསླབ་བྱ་ག་བཟུམ་ར་བྱིན་དགོཔ་ཨིན་ན་བྲིས། (སྐུགས་ ༤)', 'Outline: (ka) the signs (dizziness, palpitation, nausea, cravings for various foods, tiredness, irritability for some weeks in a 25-year-old woman) suggest early pregnancy (or a rlung-related disorder) - confirm by pulse and urine examination; (kha) at least three suitable medicines chosen by the Drungtsho; (ga) diet and behaviour advice: light nourishing food, rest, avoid heavy work and cold, calm mind.', null, '[{"point": "Answer marked by a Drungtsho against the Gyud-zhi / textbook (Claude''s outline is only a guide)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'K2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'K2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'K2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'K2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'descriptive', 'ལུམས་ཟེར་མི་འདི་ག་བཟུམ་ཅིག་ལུ་གོ་ནི་ཨིན་ན་དང་། རང་བྱུང་ཆུ་ལུམས་ཀྱི་ཕན་ཡོན་མ་ནོར་བར་བྲིས? (༣) (སྐུགས་ ༣)', 'Outline: lums is medicinal bathing (water or herbal bath / compress). Natural hot springs (chu tshan) help rlung disorders, joint and bone pain, stiffness, skin diseases and old wounds, and improve digestion and sleep.', null, '[{"point": "Answer marked by a Drungtsho against the Gyud-zhi / textbook (Claude''s outline is only a guide)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'K3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'K3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'K3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'K3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'descriptive', 'འདུས་སོ་གསུམ་ལ་ཆེ་བ་ཆུང་བ་བར་མ་ཞེས་བརྗོད་པ་དང་། མེ་བཙའ་གདབ་རྗེས་མཐེབ་རྒྱས་གདབ་པ། གོམས་པ་འགའ་བཅགས་པ་དང་
ཆུ་གྲང་བཏུང་མི་རུང་བ་བཅས་ཀྱི་རྒྱུ་མཚན་བྲིས། (༣) (སྐུགས་ ༣)', 'Outline: the three moxibustion sizes (large, small, medium) are chosen by the patient''s constitution, disease and site; pressing with the thumb after moxa keeps the warmth in and closes the point; some habits (e.g. heavy work) are restricted and cold water is avoided so the treatment is not cooled and its effect lost.', null, '[{"point": "Answer marked by a Drungtsho against the Gyud-zhi / textbook (Claude''s outline is only a guide)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'K4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'K4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'K4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'K4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'descriptive', 'སྐྱེས་ལོ་༣༥ ལངས་མི་ནོར་འཁྱིལ་གཡུ་སྒྲོན་འདི་གཟུགས་ཀྱི་ལྗིད་ཚད་95 KG ཡོད་པའི་ཁར་མོ་རའི་BMI འདི་བལྟ་བ་ཅིན་Obesity
ནང་ཚུད་དེ་འདུག དེ་ལུ་ཁྱོད་ར་དྲུང་འཚོ་ཅིག་ཨིན་པའི་ཆ་ལས་གནས་སྟངས་འདི་ལུ། (༣)
(Solution)
༡/ དྲིལ་ཕྱིས་བྱུག་པ་འབད་བ་ཅིན་འོས་འབབ་ག་དེ་སྦེ་ཡོད་ག? ཕན་ཡོན་བཅས་བྲིས།
༢/ དེ་ལུ་དྲིལ་ཕྱིས་བྱུག་པ་མ་འབད་བ་ཅིན་གནོད་པ་ག་དེ་སྦེ་ར་ཡོད་ག? (སྐུགས་ ༣)', 'Outline: (1) dry powder rubbing (dril phyis byug pa) suits obesity: it reduces fat and excess phlegm, firms the body, improves complexion and circulation; (2) without it the excess phlegm and fat increase, leading to heaviness, sluggish digestion and further disease.', null, '[{"point": "Answer marked by a Drungtsho against the Gyud-zhi / textbook (Claude''s outline is only a guide)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'K5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'K5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'K5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'K5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'descriptive', 'གནོད་བྱ་ལ་སོགས་པའི་ཆོས་བཅུ་པོ་ངོས་བཟུང་སྟེ་འགྲེལ་བཤད་རྐྱབ། (༤) (སྐུགས་ ༤)', 'Outline: identify and explain the ten qualities named in the question as given in the Gyud-zhi (Drungtsho to supply the exact list).', null, '[{"point": "Answer marked by a Drungtsho against the Gyud-zhi / textbook (Claude''s outline is only a guide)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'K6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'K6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'K6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'K6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'descriptive', 'མ་དང་བུ་གཉིས་ཐང་རེ་གཟི་མདངས་འཕོ། །ཟེར་བའི་གོ་དོན་དང་། དེའི་སྐབས་ཨ་ལུ་སྐྱེ་བ་ཅིན་ཉེན་འཚབས་ཆེ་ཆུང་ག་དེ་སྦེ་ཡོདཔ་ཨིན་
ན་བྲིས། (༣) (སྐུགས་ ༣)', 'Outline: during the eighth month the vital radiance (gzi mdangs) moves alternately between mother and child each day; a child born at this time is at high risk because its vitality may not be with it on that day.', null, '[{"point": "Answer marked by a Drungtsho against the Gyud-zhi / textbook (Claude''s outline is only a guide)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'K7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'K7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'K7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'K7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'descriptive', 'མེ་བཙའམ་གསེར་ཁབ་ཀྱི་དཔྱད་འདི་གིས་དཔྱད་གཞན་ལས་ཁྱད་དུ་འཕགས་པའི་ཐུན་མོང་མ་ཡིན་པའི་ནུས་པ་ག་ཅི་བཟུམ་ར་ཡོད་ག་
བྲིས? (༣) (སྐུགས་ ༣)', 'Outline: moxibustion and golden-needle therapy act directly on the channels and points, quickly relieve rlung and cold disorders, pain and swelling, and work where medicines cannot reach - unique strengths compared with other external therapies.', null, '[{"point": "Answer marked by a Drungtsho against the Gyud-zhi / textbook (Claude''s outline is only a guide)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'K8', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'K8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'K8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'K8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'descriptive', 'སྨན་གྱི་རོ་ཞེས་པའི་རྒྱུ་མཚན་དང་། རོ་དྲུག་པོ་འབྱུང་བ་ལྔ་ལས་ཇི་ལྟར་སྐྱེས་པའི་ཚུལ་བྲིས། (༣) (སྐུགས་ ༣)', 'Outline: ''taste'' (ro) because the taste of a medicine reveals its potency and action; six tastes arise from the elements: sweet = earth + water; sour = fire + earth; salty = water + fire; bitter = water + wind; hot (pungent) = fire + wind; astringent = earth + wind.', null, '[{"point": "Answer marked by a Drungtsho against the Gyud-zhi / textbook (Claude''s outline is only a guide)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'traditional-medicine-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Traditional Medicine: Claude''s best guess on a specialist Sowa Rigpa paper - a Drungtsho MUST check the answer before publishing.", "Dzongkha/Choeke text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Traditional Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'traditional-medicine'), null)
  returning id
)
insert into me_q select 'K9', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'K9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'K9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'K9';
commit;
