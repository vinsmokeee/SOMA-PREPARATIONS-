-- ME Paper III (Dzongkha category, Buddhist Studies): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'buddhist-studies'), 'abhidharmako-a', 'Abhidharmakośa' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'buddhist-studies'), 'bodhicary-vat-ra', 'Bodhicaryāvatāra' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'buddhist-studies'), 'history-of-the-dharma', 'History of the Dharma' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'buddhist-studies'), 'letter-to-a-friend', 'Letter to a Friend' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'buddhist-studies'), 'madhyamak-vat-ra', 'Madhyamakāvatāra' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'buddhist-studies'), 'poetics', 'Poetics' on conflict (subject_id, slug) do nothing;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-dzongkha-3');
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-dzongkha-3'), 1, 'Question 1: Bodhicaryāvatāra (སྤྱོད་འཇུག)', 'essay', 2, 10, 1, 'BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)');
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-dzongkha-3'), 2, 'Question 2: Letter to a Friend (བཤེས་སྤྲིངས)', 'descriptive', 2, 10, 1, 'BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)');
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-dzongkha-3'), 3, 'Question 3: Poetics (སྙན་ངག)', 'analytical', 5, 10, 3, 'BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)');
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-dzongkha-3'), 4, 'Question 4: Madhyamakāvatāra and Abhidharmakośa (དབུ་མ་འཇུག་པ་དང་མངོན་པ་མཛོད)', 'long_answer', 5, 12, 3, 'BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)');
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-dzongkha-3'), 5, 'Question 5: History of the Dharma (ཆོས་འབྱུང)', 'short_answer', 2, 14, 1, 'BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'essay', 'འོག་ལུ་བཀོད་ཡོད་པའི་དྲི་བ་གཉིས་ལས་ གཅིག་གདམ་ཁ་རྐྱབ་སྟེ་ ལན་ངེས་པར་དུ་བྲི་དགོ།

ཀ) མི་མང་པོ་ཞིག་ འཛོམས་པའི་དབུས་སུ་ མི་གཅིག་གིས་ཁྱོད་ལ་ དོན་མེད་ཚིག་རྩུབ་ཀྱི་སྒོ་ནས་ སྐྱོན་བརྗོད་དེ་ བརྙས་བཅོས་བྱས་ན་ དེ་ལ་ཁྱོད་ཀྱིས་ སྤྱོད་འཇུག་ལེའུ་གང་རུང་ཞིག་གི་ནང་དོན་ སེམས་ལ་དྲན་ཏེ་ ལག་ལེན་དངོས་འཐབ་ཐོག་ ལན་ཇི་ལྟར་འཇལ་རྒྱུ་ཡིན? ཚིག་འབྲུ་ ༡༠༠ འི་ནང་འཁོད་བྲིས། (སྐུགས་ ༡༠)', 'ལན་གྱི་དཔེ་ (outline)
སྤྱོད་འཇུག་ ལེའུ་དྲུག་པ་ བཟོད་པའི་ལེའུ་ནང་ "ཞེ་སྡང་ལྟ་བུའི་སྡིག་པ་མེད། །བཟོད་པ་ལྟ་བུའི་དཀའ་ཐུབ་མེད། །" ཟེར་ གསུངས་ཡོདཔ་དང་ བསྐལ་པ་སྟོང་དུ་ བསགས་པའི་ དགེ་བ་ཚུ་ ཞེ་སྡང་ཐེངས་གཅིག་གིས་ འཇོམས་ཟེར་ གསུངས་ཡོདཔ་ལས་ ང་གིས་ ཁྲོ་སྟེ་ ལན་མི་སློག་པར་ བཟོད་པ་བསྒོམ་ནི་ཨིན། ཚིག་རྩུབ་འདི་གིས་ ངའི་ ལུས་ལུ་ གནོད་པ་ མི་འབྱུང་། སེམས་ལུ་ ལུས་མེདཔ་ལས་ སུ་གིས་ཡང་ འཇོམས་མི་ཚུགས། མི་དེ་ ཉོན་མོངས་ཀྱི་ དབང་དུ་ སོང་སྟེ་ རང་དབང་མེད་པར་ སླབ་ཨིན་ཟེར་ ཤེས་ཏེ་ ཁོ་ལུ་ སྙིང་རྗེ་ བསྒོམ། ཁོ་ ང་ལུ་ བཟོད་པ་ སྦྱོང་ནིའི་ གོ་སྐབས་ བྱིན་མི་ བཤེས་གཉེན་ཅིག་ ཨིན་ཟེར་ མནོ་སྟེ་ ཞི་དུལ་གྱི་ ཐོག་ལས་ ལན་ ཞུ་ནི་ ཡང་ན་ ཁ་རོག་སྦེ་ སྡོད་ནི་ཨིན།', null, '[{"point": "ལེའུ་ ༦ པ་ བཟོད་པའི་ལེའུ་ ངོས་འཛིན་དང་ རྩ་ཚིག་ (ཞེ་སྡང་ལྟ་བུའི་སྡིག་པ་མེད། །བཟོད་པ་ལྟ་བུའི་དཀའ་ཐུབ་མེད། ། ལ་སོགས་པ།) དྲངས་ཡོདཔ།", "marks": 3}, {"point": "ཞེ་སྡང་གི་ཉེས་དམིགས་ (བསྐལ་པ་སྟོང་དུ་བསགས་པའི་ དགེ་བ་འཇོམས།) དང་ ཚིག་རྩུབ་ཀྱིས་ ལུས་ལུ་ གནོད་མི་ཚུགས།", "marks": 3}, {"point": "ལག་ལེན་ (ལན་མ་སློག་པར་ བཟོད་པ་བསྒོམ། བརྙས་བཅོས་འབད་མི་ལུ་ སྙིང་རྗེ། ཉོན་མོངས་ཀྱི་དབང་དུ་སོང་ཡོདཔ་ ཤེས། ཁོ་ ལས་ བཟོད་པ་སྦྱོང་སའི་ དགེ་བའི་བཤེས་གཉེན་སྦེ་ མཐོང་།)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'buddhist-studies'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'buddhist-studies') and t.slug = 'bodhicary-vat-ra'), (select id from public.exam_papers where code = 'me-dzongkha-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Buddhist Studies: a lopen (Buddhist Studies teacher) must check the model answer and marking guide before publishing.", "Real RCSC text from a PDF whose font drops letters; repaired automatically: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Dzongkha category, Buddhist Studies): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-III.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'Q1a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Correct meaning of the root text, accurate terms and points, relevant explanation.', 5.0, 1 from me_q where key = 'Q1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Answers each part asked, in a clear order (verse, word meaning, overall meaning).', 2.5, 2 from me_q where key = 'Q1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (སྐད་ཡིག)', 'Correct Chöke or Dzongkha, spelling and honorifics.', 2.5, 3 from me_q where key = 'Q1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'essay', 'འོག་ལུ་བཀོད་ཡོད་པའི་དྲི་བ་གཉིས་ལས་ གཅིག་གདམ་ཁ་རྐྱབ་སྟེ་ ལན་ངེས་པར་དུ་བྲི་དགོ།

ཁ) གཤམ་གསལ་ སྤྱོད་འཇུག་གི་རྩ་ཚིག་ གཉིས་པོའི་འགྲེལ་བཤད་ འོས་ལྡན་ཞིག་བྲིས། (སྐུགས་ ༡༠)
༡༽ བདེན་པ་མཐོང་བས་གྲོལ་འགྱུར་གྱི། །སྟོང་ཉིད་མཐོང་བས་ཅི་ཞིག་བྱ། །
༢༽ གང་ཕྱིར་ལུང་ལས་ལམ་འདི་ནི། །མེད་པར་བྱང་ཆུབ་མེད་པར་གསུངས། །', 'ལན་གྱི་དཔེ་ (outline)
རྩ་ཚིག་འདི་ སྤྱོད་འཇུག་ ལེའུ་དགུ་པ་ ཤེས་རབ་ཀྱི་ལེའུ་ ལས་ཨིན། ཚིག་རྐང་དང་པོ་འདི་ ཉན་ཐོས་ཀྱི་ རྩོད་པ་ཨིན། ཁོང་གི་ ལུགས་ལུ་ བདེན་པ་བཞི་ མཐོང་བ་ ཙམ་གྱིས་ ཉོན་མོངས་སྤངས་ཏེ་ གྲོལ་བ་ཐོབ་ཚུགས་ན་ ཆོས་ཐམས་ཅད་ རང་བཞིན་མེད་པའི་ སྟོང་ཉིད་ རྟོགས་དགོཔ་ ག་ཅི་ཨིན་ན་ ཟེར་ རྩོད་ཨིན།
ཚིག་རྐང་གཉིས་པ་འདི་ ལན་ཨིན། ཤེས་རབ་ཀྱི་ཕ་རོལ་ཏུ་ཕྱིན་པའི་ ལུང་ལས་ སྟོང་ཉིད་ རྟོགས་པའི་ ལམ་འདི་ མེད་པར་ ཉན་ཐོས་ རང་རྒྱལ་ བྱང་ཆུབ་སེམས་དཔའ་ ག་གིས་ཡང་ བྱང་ཆུབ་ ཐོབ་མི་ཚུགས་ཟེར་ གསུངས་ཡོདཔ་ལས་ གྲོལ་བ་ཐོབ་ནི་ལུ་ཡང་ སྟོང་ཉིད་ རྟོགས་པ་ དགོཔ་ཨིན། བདག་འཛིན་གྱི་ རྩ་བ་ མ་ཆད་ན་ ཉོན་མོངས་ ལོག་སྟེ་ འབྱུང་ཉེན་ཡོད།', null, '[{"point": "སྐབས་ ངོས་འཛིན་ (ལེའུ་ ༩ པ་ ཤེས་རབ་ཀྱི་ལེའུ། ཉན་ཐོས་ཀྱི་ རྩོད་པ་དང་ ལན།)", "marks": 2}, {"point": "ཚིག་རྐང་དང་པོ་ - ཉན་ཐོས་ཀྱིས་ བདེན་བཞི་ མཐོང་བས་ གྲོལ་བ་ཐོབ་ན་ སྟོང་ཉིད་ རྟོགས་དགོས་པ་ ཅི་ཡོད་ ཟེར་ རྩོད་པ།", "marks": 4}, {"point": "ཚིག་རྐང་གཉིས་པ་ - ལན་ ཤེར་ཕྱིན་གྱི་ ལུང་ལས་ སྟོང་ཉིད་ཀྱི་ ལམ་ མེད་པར་ ཐེག་པ་གསུམ་གང་གི་ཡང་ བྱང་ཆུབ་ མི་ཐོབ་ཟེར་ གསུངས།", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'buddhist-studies'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'buddhist-studies') and t.slug = 'bodhicary-vat-ra'), (select id from public.exam_papers where code = 'me-dzongkha-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Buddhist Studies: a lopen (Buddhist Studies teacher) must check the model answer and marking guide before publishing.", "Real RCSC text from a PDF whose font drops letters; repaired automatically: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Dzongkha category, Buddhist Studies): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-III.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'Q1b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Correct meaning of the root text, accurate terms and points, relevant explanation.', 5.0, 1 from me_q where key = 'Q1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Answers each part asked, in a clear order (verse, word meaning, overall meaning).', 2.5, 2 from me_q where key = 'Q1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (སྐད་ཡིག)', 'Correct Chöke or Dzongkha, spelling and honorifics.', 2.5, 3 from me_q where key = 'Q1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'descriptive', 'འོག་ལུ་བཀོད་ཡོད་པའི་དྲི་བ་གཉིས་ལས་ གཅིག་གདམ་ཁ་རྐྱབ་སྟེ་ ལན་ངེས་པར་དུ་བྲི་དགོ།

ཀ) བསམ་གཏན་གྱི་སྒྲིབ་པ་ལྔ་པོ་དང་ རྗེས་དྲན་དྲུག་ལས་ལྔ་ རེ་རེ་བཞིན་བྲིས། (སྐུགས་ ༡༠)', 'བསམ་གཏན་གྱི་སྒྲིབ་པ་ལྔ། ༡. རྒོད་པ་དང་འགྱོད་པ། ༢. གནོད་སེམས། ༣. རྨུགས་པ་དང་གཉིད། ༤. འདོད་པ་ལ་འདུན་པ། ༥. ཐེ་ཚོམ།
རྗེས་སུ་དྲན་པ་དྲུག་ལས་ལྔ། ༡. སངས་རྒྱས་རྗེས་དྲན། ༢. ཆོས་རྗེས་དྲན། ༣. དགེ་འདུན་རྗེས་དྲན། ༤. གཏོང་བ་རྗེས་དྲན། ༥. ཚུལ་ཁྲིམས་རྗེས་དྲན། (དྲུག་པ་ ལྷ་རྗེས་སུ་དྲན་པ།)', null, '[{"point": "སྒྲིབ་པ་ལྔ་ - རྒོད་པ་དང་འགྱོད་པ། གནོད་སེམས། རྨུགས་པ་དང་གཉིད། འདོད་པ་ལ་འདུན་པ། ཐེ་ཚོམ། (རེ་རེ་ལུ་ ༡)", "marks": 5}, {"point": "རྗེས་དྲན་ལྔ་ (དྲུག་ལས་) - སངས་རྒྱས། ཆོས། དགེ་འདུན། གཏོང་བ། ཚུལ་ཁྲིམས། ལྷ། (རེ་རེ་ལུ་ ༡)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'buddhist-studies'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'buddhist-studies') and t.slug = 'letter-to-a-friend'), (select id from public.exam_papers where code = 'me-dzongkha-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Buddhist Studies: a lopen (Buddhist Studies teacher) must check the model answer and marking guide before publishing.", "Real RCSC text from a PDF whose font drops letters; repaired automatically: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Dzongkha category, Buddhist Studies): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-III.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'Q2a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Correct meaning of the root text, accurate terms and points, relevant explanation.', 5.0, 1 from me_q where key = 'Q2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Answers each part asked, in a clear order (verse, word meaning, overall meaning).', 2.5, 2 from me_q where key = 'Q2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (སྐད་ཡིག)', 'Correct Chöke or Dzongkha, spelling and honorifics.', 2.5, 3 from me_q where key = 'Q2a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'descriptive', 'འོག་ལུ་བཀོད་ཡོད་པའི་དྲི་བ་གཉིས་ལས་ གཅིག་གདམ་ཁ་རྐྱབ་སྟེ་ ལན་ངེས་པར་དུ་བྲི་དགོ།

ཁ) འོག་གི་ རྩ་བའི་ཚིག་གི་གོ་བ་ལེན་ཏེ་ བསམ་གཏན་དང་པོ་དང་གཉིས་པ་ལ་ ཁྱད་པར་གང་དང་གང་ཡོད་པ་ཡིན་ནམ? གསལ་པོར་བཀོད། (སྐུགས་ ༡༠)
འདོད་སྤྱོད་དགའ་དང་བདེ་དང་སྡུག་བསྔལ་དག །རྣམ་པར་སྤངས་པའི་བསམ་གཏན་བཞི་པོ་ཡིས། །
ཚངས་དང་འོད་གསལ་དག་དང་དགེ་རྒྱས་དང་། །འབྲས་བུ་ཆེ་ལྷ་རྣམས་དང་སྐལ་མཉམ་ཐོབ། །', 'ལན་གྱི་དཔེ་ (outline)
རྩ་ཚིག་འདི་ བཤེས་སྤྲིངས་ལས་ཨིན། བསམ་གཏན་བཞི་གིས་ རིམ་བཞིན་ འདོད་སྤྱོད་ དགའ་བ་ བདེ་བ་ སྡུག་བསྔལ་ཚུ་ སྤངས་ཏེ་ ཚངས་པ་ འོད་གསལ་ དགེ་རྒྱས་ འབྲས་བུ་ཆེ་བའི་ ལྷ་ཚུ་དང་ སྐལ་བ་མཉམ་པ་ ཐོབ།
བསམ་གཏན་དང་པོ། འདོད་པའི་ ལོངས་སྤྱོད་ལུ་ ཆགས་པ་ སྤངས། རྟོག་པ་དང་ དཔྱོད་པ་ ཡོད། དབེན་པ་ལས་ སྐྱེས་པའི་ དགའ་བ་དང་ བདེ་བ། འབྲས་བུ་ ཚངས་པའི་ ལྷ་ཚུ་དང་ སྐལ་བ་མཉམ་པ་ ཐོབ།
བསམ་གཏན་གཉིས་པ། རྟོག་པ་དང་ དཔྱོད་པ་ སྤངས་ཏེ་ ནང་རབ་ཏུ་ དང་བ། ཏིང་ངེ་འཛིན་ལས་ སྐྱེས་པའི་ དགའ་བ་དང་ བདེ་བ། འབྲས་བུ་ འོད་གསལ་གྱི་ ལྷ་ཚུ་དང་ སྐལ་བ་མཉམ་པ་ ཐོབ།', null, '[{"point": "བསམ་གཏན་དང་པོ་ - འདོད་པའི་ ལོངས་སྤྱོད་ སྤངས། རྟོག་པ་དང་དཔྱོད་པ་ ཡོད། དབེན་པ་ལས་སྐྱེས་པའི་ དགའ་བདེ།", "marks": 3}, {"point": "འབྲས་བུ་ - ཚངས་པའི་ལྷ་ (ཚངས་རིས་ སོགས་) དང་ སྐལ་བ་མཉམ།", "marks": 2}, {"point": "བསམ་གཏན་གཉིས་པ་ - རྟོག་དཔྱོད་ སྤངས། ནང་རབ་ཏུ་དང་བ། ཏིང་ངེ་འཛིན་ལས་སྐྱེས་པའི་ དགའ་བདེ།", "marks": 3}, {"point": "འབྲས་བུ་ - འོད་གསལ་གྱི་ ལྷ་དང་ སྐལ་བ་མཉམ།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'buddhist-studies'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'buddhist-studies') and t.slug = 'letter-to-a-friend'), (select id from public.exam_papers where code = 'me-dzongkha-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Buddhist Studies: a lopen (Buddhist Studies teacher) must check the model answer and marking guide before publishing.", "Real RCSC text from a PDF whose font drops letters; repaired automatically: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Dzongkha category, Buddhist Studies): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-III.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'Q2b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Correct meaning of the root text, accurate terms and points, relevant explanation.', 5.0, 1 from me_q where key = 'Q2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Answers each part asked, in a clear order (verse, word meaning, overall meaning).', 2.5, 2 from me_q where key = 'Q2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (སྐད་ཡིག)', 'Correct Chöke or Dzongkha, spelling and honorifics.', 2.5, 3 from me_q where key = 'Q2b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'འོག་ལུ་བཀོད་ཡོད་པའི་དྲི་བ་ལྔ་ལས་ གང་རུང་གསུམ་ལུ་ལན་རྐྱབ། (དྲི་བ་རེ་ལུ་སྐུགས་ ༡༠)

ཀ) དཔེ། རྟ་བདུན་ལྡིང་ཁང་། ཆུ་ཤེལ་དབང་པོ། པདྨའི་སྐྱེད་ཚལ། གསུམ་ལག་ལེན་འཐབ་སྟེ་ ལྡན་མིན་གཟུགས་ཅན་གྱི་ དཔེར་བརྗོད་གཅིག་དང་། དཔེ། ཉ་གང་ཟླ་བ། པདྨ། གཉིས་ལག་ལེན་འཐབ་སྟེ་ རྣམ་འགྱུར་གྱི་དཔེའི་ དཔེར་བརྗོད་གཅིག་རྩོམས། (སྐུགས་ ༡༠)', 'ལན་གྱི་དཔེ་ (outline: lopen to replace with model verses)
༡. ལྡན་མིན་གཟུགས་ཅན། དཔེ་དང་ དཔེ་ཅན་ ཐ་མི་དད་པར་ བཀོད་པ་ ("ཡིན་" ཟེར་ བཀོད།)
དཔེར་བརྗོད། ཁྱོད་ཀྱི་ཞལ་ནི་རྟ་བདུན་ལྡིང་ཁང་སྟེ། །བཞིན་རས་ཆུ་ཤེལ་དབང་པོའི་འོད་དཀར་ཅན། །ཐུགས་ནི་པདྨའི་སྐྱེད་ཚལ་རྒྱས་པ་ལ། །ངེད་ཅག་བུང་བ་དགའ་བས་འཁོར་བར་བྱེད། །
༢. རྣམ་འགྱུར་གྱི་དཔེ། དཔེ་ཅན་ ཁྱད་པར་དུ་འཕགས་པར་ བསྟན་པའི་ཕྱིར་ དཔེ་ལུ་ རྣམ་འགྱུར་ བཀོད་པ།
དཔེར་བརྗོད། ཉ་གང་ཟླ་བ་རི་བོང་སྐྱོན་གྱིས་གོས། །པདྨ་ནུབ་མོ་ཟུམ་པའི་ཉེས་པ་ཅན། །ཁྱོད་ཞལ་སྐྱོན་མེད་ཉིན་མཚན་རྟག་ཏུ་རྒྱས། །', null, '[{"point": "ལྡན་མིན་གཟུགས་ཅན་གྱི་ མཚན་ཉིད་ (དཔེ་དང་དཔེ་ཅན་ ཐ་མི་དད་པར་ བཀོད་པ།) ཤེས་ཡོདཔ།", "marks": 2}, {"point": "དཔེ་གསུམ་ ལག་ལེན་འཐབ་པའི་ ལྡན་མིན་གཟུགས་ཅན་གྱི་ ཚིགས་བཅད་ ཀྲིག་ཀྲི།", "marks": 3}, {"point": "རྣམ་འགྱུར་གྱི་དཔེའི་ མཚན་ཉིད་ ཤེས་ཡོདཔ།", "marks": 2}, {"point": "ཉ་གང་ཟླ་བ་དང་ པདྨ་ ལག་ལེན་འཐབ་པའི་ ཚིགས་བཅད་ ཀྲིག་ཀྲི།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'buddhist-studies'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'buddhist-studies') and t.slug = 'poetics'), (select id from public.exam_papers where code = 'me-dzongkha-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Buddhist Studies: a lopen (Buddhist Studies teacher) must check the model answer and marking guide before publishing.", "Real RCSC text from a PDF whose font drops letters; repaired automatically: compare with the RCSC PDF.", "Claude is NOT sure of the expected answer here (poetics terms): the marking guide is only a frame for the lopen to complete."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Dzongkha category, Buddhist Studies): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-III.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'Q3a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Correct meaning of the root text, accurate terms and points, relevant explanation.', 5.0, 1 from me_q where key = 'Q3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Answers each part asked, in a clear order (verse, word meaning, overall meaning).', 2.5, 2 from me_q where key = 'Q3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (སྐད་ཡིག)', 'Correct Chöke or Dzongkha, spelling and honorifics.', 2.5, 3 from me_q where key = 'Q3a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'འོག་ལུ་བཀོད་ཡོད་པའི་དྲི་བ་ལྔ་ལས་ གང་རུང་གསུམ་ལུ་ལན་རྐྱབ། (དྲི་བ་རེ་ལུ་སྐུགས་ ༡༠)

ཁ) འོག་གི་རྩ་བ་ཚིགས་བཅད་གཉིས་ལ་ ཁྱད་པར་གང་འདུག? འགྲེལ་བཤད་ཐོག་ གསལ་པོར་བྲིས། (སྐུགས་ ༡༠)
༡- རྒྱུའོ་ཆུ་གཏེར་བཞི་ངོགས་ཀྱི། །སྐྱེད་མོས་ཚལ་དུ་སོ་ཅན་ཏེ། །ཁོར་ཡུག་རི་བོའི་ཁོངས་སུ་ཡང་། །ཁྱོད་ཀྱི་ཡོན་ཏན་ཀུནྡའི་འོད། །
༢- སྔོ་བསངས་ཉིད་དོ་ཕྱོགས་རྣམས་ནི། །དབྱར་སྐྱེས་ཆུ་འཛིན་ཕྲེང་བ་ཡིས། །ས་ཡང་རྩྭ་སྔོན་གསར་པ་ནི། །ཤིན་ཏུ་གཞོན་པའི་ཕྲེང་བས་སོ། །', 'ལན་གྱི་དཔེ་ (frame only: lopen to complete)
ཚིགས་བཅད་དང་པོ། ཡོན་ཏན་ ཀུནྡའི་འོད་ལྟར་ དཀར་བ་འདི་ རྒྱ་མཚོ་བཞིའི་ ངོགས་ དང་ སྐྱེད་ཚལ་ འཁོར་ཡུག་ རི་བོ་ ཚུན་ཆད་ ཁྱབ་པར་ བསྟན།
ཚིགས་བཅད་གཉིས་པ། དབྱར་གྱི་ སྤྲིན་ཕྲེང་གིས་ ཕྱོགས་རྣམས་ སྔོ་བསངས་ དང་ རྩྭ་སྔོན་གྱིས་ ས་གཞི་ གཞོན་པར་ མཛེས་པའི་ རང་བཞིན་ བརྗོད།
ཁྱད་པར། རྒྱན་གྱི་ མིང་དང་ ཁྱད་པར་ (སྙན་ངག་མེ་ལོང་ ལེའུ་བར་པ་ ལྟར།) བླ་མ་ཡང་ན་ སློབ་དཔོན་གྱིས་ ཁ་སྐོང་དགོ།', null, '[{"point": "ཚིགས་བཅད་དང་པོའི་ རྒྱན་ ངོས་འཛིན་དང་ ཚིག་དོན།", "marks": 4}, {"point": "ཚིགས་བཅད་གཉིས་པའི་ རྒྱན་ ངོས་འཛིན་དང་ ཚིག་དོན།", "marks": 4}, {"point": "རྒྱན་གཉིས་ཀྱི་ ཁྱད་པར་ ཁ་གསལ།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'buddhist-studies'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'buddhist-studies') and t.slug = 'poetics'), (select id from public.exam_papers where code = 'me-dzongkha-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Buddhist Studies: a lopen (Buddhist Studies teacher) must check the model answer and marking guide before publishing.", "Real RCSC text from a PDF whose font drops letters; repaired automatically: compare with the RCSC PDF.", "Claude is NOT sure of the expected answer here (poetics terms): the marking guide is only a frame for the lopen to complete."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Dzongkha category, Buddhist Studies): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-III.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'Q3b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Correct meaning of the root text, accurate terms and points, relevant explanation.', 5.0, 1 from me_q where key = 'Q3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Answers each part asked, in a clear order (verse, word meaning, overall meaning).', 2.5, 2 from me_q where key = 'Q3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (སྐད་ཡིག)', 'Correct Chöke or Dzongkha, spelling and honorifics.', 2.5, 3 from me_q where key = 'Q3b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'འོག་ལུ་བཀོད་ཡོད་པའི་དྲི་བ་ལྔ་ལས་ གང་རུང་གསུམ་ལུ་ལན་རྐྱབ། (དྲི་བ་རེ་ལུ་སྐུགས་ ༡༠)

ག) ཁྱོད་ཀྱི་བསམ་བློ་ལྟར་ན་ སྙན་རྩོམ་ལ་མཁས་པའི་ ཐབས་ལམ་མཆོག་གྱུར་འདི་ དུས་རྒྱུན་སྙན་རྩོམ་རྒྱབ་རྒྱུ་དང་ སྙན་ངག་གི་གཞུང་སྣ་ཚོགས་ལ་ སློབ་སྦྱོང་བྱ་རྒྱུ་གཉིས་ལས་གང་དྲག? ཅིའི་ཕྱིར? (སྐུགས་ ༡༠)', 'ལན་གྱི་དཔེ་ (outline; any well-argued view earns marks)
ང་གི་ བསམ་བློ་ལྟར་ན་ གཉིས་ཆ་ར་ དགོཔ་ཨིན་རུང་ གཞི་རྩ་ སྙན་ངག་གི་ གཞུང་ (སྙན་ངག་མེ་ལོང་ སོགས་) ལུ་ སློབ་སྦྱོང་ འབད་ནི་འདི་ དང་པ་ ཨིན། གཞུང་ལས་ ལུས་ རྒྱན་ སྐྱོན་ཚུ་གི་ མཚན་ཉིད་ མ་ཤེས་པར་ རྩོམ་ན་ སྐྱོན་ཅན་ ཡོང་། གཞུང་ ཤེས་ཞིནམ་ལས་ དུས་རྒྱུན་ རྩོམ་པ་ཅིན་ ཚིག་ སྦྱང་སྟེ་ མཁས་པར་ འགྱུར། དེ་འབདཝ་ལས་ ཐོས་པ་དང་ ལག་ལེན་ ཟུང་འབྲེལ་ ཐབས་ལམ་ མཆོག་ཨིན།', null, '[{"point": "ཕྱོགས་ཅིག་ ཁ་གསལ་སྦེ་ གདམ་ཁ་རྐྱབ་ཡོདཔ་ (ཡང་ན་ གཉིས་ཆ་ར་ དགོཔ་ ཁུངས་དང་བཅས།)", "marks": 2}, {"point": "རྒྱུ་མཚན་ ༢-༣ (གཞུང་ལས་ མཚན་ཉིད་དང་ རྒྱན་ ཤེས། ལག་ལེན་ལས་ ཚིག་ སྦྱང་།)", "marks": 6}, {"point": "མཇུག་བསྡུ།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'buddhist-studies'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'buddhist-studies') and t.slug = 'poetics'), (select id from public.exam_papers where code = 'me-dzongkha-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Buddhist Studies: a lopen (Buddhist Studies teacher) must check the model answer and marking guide before publishing.", "Real RCSC text from a PDF whose font drops letters; repaired automatically: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Dzongkha category, Buddhist Studies): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-III.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'Q3c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Correct meaning of the root text, accurate terms and points, relevant explanation.', 5.0, 1 from me_q where key = 'Q3c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Answers each part asked, in a clear order (verse, word meaning, overall meaning).', 2.5, 2 from me_q where key = 'Q3c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (སྐད་ཡིག)', 'Correct Chöke or Dzongkha, spelling and honorifics.', 2.5, 3 from me_q where key = 'Q3c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'འོག་ལུ་བཀོད་ཡོད་པའི་དྲི་བ་ལྔ་ལས་ གང་རུང་གསུམ་ལུ་ལན་རྐྱབ། (དྲི་བ་རེ་ལུ་སྐུགས་ ༡༠)

ང) རིགས་ཀྱི་རང་བཞིན་བརྗོད་པ་དང་། རྨད་བྱུང་གི་དཔེ་ གཉིས་ཀྱི་དཔེར་བརྗོད་ ཚིགས་བཅད་རེ་ རང་སྟོབས་ཀྱིས་གསར་དུ་རྩོམས། (སྐུགས་ ༡༠)', 'ལན་གྱི་དཔེ་ (outline: lopen to check verses)
༡. རིགས་ཀྱི་རང་བཞིན་བརྗོད་པ། (རྨ་བྱའི་ རིགས།)
སྤྲིན་སྔོན་སྒྲ་ཡི་འབྲུག་ལྡིར་ཐོས་མ་ཐག །མཇུག་སྒྲོ་མིག་ཅན་ཡང་ཡང་བརྐྱང་བྱས་ཏེ། །སྐེ་སྔོན་སྒྲེང་ནས་གར་གྱི་ཉམས་སྟོན་པའི། །རྨ་བྱ་ནགས་ཀྱི་མཐའ་ན་རྩེན་ཞིང་འདུག །
༢. རྨད་བྱུང་གི་དཔེ།
ཟླ་བ་མཚན་མོ་རྐྱང་པར་གསལ་བ་ལས། །ཁྱོད་ཞལ་ཉིན་མཚན་ཀུན་ཏུ་གསལ་བར་མཛེས། །ཟླ་བ་གཟའ་ཡིས་ཟིན་ཀྱང་ཁྱོད་ཞལ་ནི། །སུ་ཡིས་མི་ཐུབ་འདི་ནི་ངོ་མཚར་རོ། །', null, '[{"point": "རིགས་ཀྱི་རང་བཞིན་བརྗོད་པའི་ མཚན་ཉིད་ (རིགས་ཅིག་གི་ རང་བཞིན་ ཇི་བཞིན་ བརྗོད།)", "marks": 2}, {"point": "ཚིགས་བཅད་ ཀྲིག་ཀྲི་ (ཚིག་རྐང་ ༤)", "marks": 3}, {"point": "རྨད་བྱུང་གི་དཔེའི་ མཚན་ཉིད་ (དཔེ་ལུ་ མེད་པའི་ ཡོན་ཏན་ བཀོད་དེ་ རྨད་དུ་བྱུང་བར་ བསྟན།)", "marks": 2}, {"point": "ཚིགས་བཅད་ ཀྲིག་ཀྲི་ (ཚིག་རྐང་ ༤)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'buddhist-studies'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'buddhist-studies') and t.slug = 'poetics'), (select id from public.exam_papers where code = 'me-dzongkha-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Buddhist Studies: a lopen (Buddhist Studies teacher) must check the model answer and marking guide before publishing.", "Real RCSC text from a PDF whose font drops letters; repaired automatically: compare with the RCSC PDF.", "Claude is NOT sure of the expected answer here (poetics terms): the marking guide is only a frame for the lopen to complete."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Dzongkha category, Buddhist Studies): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-III.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'Q3d', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Correct meaning of the root text, accurate terms and points, relevant explanation.', 5.0, 1 from me_q where key = 'Q3d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Answers each part asked, in a clear order (verse, word meaning, overall meaning).', 2.5, 2 from me_q where key = 'Q3d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (སྐད་ཡིག)', 'Correct Chöke or Dzongkha, spelling and honorifics.', 2.5, 3 from me_q where key = 'Q3d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'འོག་ལུ་བཀོད་ཡོད་པའི་དྲི་བ་ལྔ་ལས་ གང་རུང་གསུམ་ལུ་ལན་རྐྱབ། (དྲི་བ་རེ་ལུ་སྐུགས་ ༡༠)

ཅ) གཤམ་གྱི་ རྩ་བ་ཚིགས་བཅད་གཉིས་པོའི་ རྒྱན་ངོས་འཛིན་ཏེ་ འདི་ལས་རིགས་བསྒྲེས་ནས་ རང་སྟོབས་ཀྱིས་ དཔེར་བརྗོད་གསར་པ་རེ་རྩོམས། (སྐུགས་ ༡༠)
༡༽ ཁྱོད་གདོང་འདམ་སྐྱེས་དོ་ར་འདིར། །སྨིན་མའི་འཁྲི་ཤིང་གར་མཁན་མ། །རོལ་སྒེག་དགའ་བས་གར་བྱེད་དོ། །
༢༽ ཅི་འདི་སྟོན་གྱི་ཆུ་འཛིན་ནམ། །ཡང་ན་ངང་པའི་ཚོགས་སམ་ཅི། །སྒྲ་ནི་རྐང་གདུབ་ཀྱི་འདྲ་བ། །ཐོས་པས་འདི་ནི་ཆུ་འཛིན་མིན། །', 'ལན་གྱི་དཔེ་ (Claude''s reading; lopen to confirm the exact ornament names)
༡. གདོང་ལུ་ འདམ་སྐྱེས་ (པདྨ་) དང་ སྨིན་མ་ལུ་ འཁྲི་ཤིང་ གར་མཁན་མ་ ཟེར་ དཔེ་དང་ དཔེ་ཅན་ གཅིག་ཏུ་ བཀོད་པའི་ གཟུགས་ཅན་གྱི་ རྒྱན།
གསར་རྩོམ། ཁྱོད་མིག་ཨུཏྤལ་མཚོ་ཡི་ངོགས་འདིར་ནི། །བཞིན་བཟང་ཟླ་བའི་འོད་ཟེར་རྒྱས་པར་འཕྲོ། །
༢. སྟོན་གྱི་ སྤྲིན་ཡིན་ནམ་ ངང་པའི་ཚོགས་ཡིན་ཟེར་ ཐེ་ཚོམ་ བཀོད་ཞིནམ་ལས་ རྐང་གདུབ་ཀྱི་ སྒྲ་ ཐོས་པས་ སྤྲིན་མིན་པར་ ངེས་པ་ བཀོད་པའི་ ཐེ་ཚོམ་གྱི་ རྒྱན།
གསར་རྩོམ། ཅི་འདི་ནམ་མཁའི་སྐར་མའི་ཚོགས་སམ་ཅི། །ཡང་ན་མེ་ཏོག་ཀུནྡའི་ཕྲེང་བ་ཡིན། །དྲི་ཞིམ་ངད་ཀྱིས་ཁྱབ་པས་སྐར་མ་མིན། །', null, '[{"point": "ཚིགས་བཅད་དང་པོའི་ རྒྱན་ ངོས་འཛིན་ (གཟུགས་ཅན་གྱི་ རྒྱན།)", "marks": 2}, {"point": "དེ་དང་ རིགས་མཐུན་པའི་ ཚིགས་བཅད་གསར་པ།", "marks": 3}, {"point": "ཚིགས་བཅད་གཉིས་པའི་ རྒྱན་ ངོས་འཛིན་ (ཐེ་ཚོམ་ལས་ ངེས་པར་ བྱེད་པའི་ རྒྱན།)", "marks": 2}, {"point": "དེ་དང་ རིགས་མཐུན་པའི་ ཚིགས་བཅད་གསར་པ།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'buddhist-studies'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'buddhist-studies') and t.slug = 'poetics'), (select id from public.exam_papers where code = 'me-dzongkha-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Buddhist Studies: a lopen (Buddhist Studies teacher) must check the model answer and marking guide before publishing.", "Real RCSC text from a PDF whose font drops letters; repaired automatically: compare with the RCSC PDF.", "Claude is NOT sure of the expected answer here (poetics terms): the marking guide is only a frame for the lopen to complete."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Dzongkha category, Buddhist Studies): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-III.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'Q3e', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Correct meaning of the root text, accurate terms and points, relevant explanation.', 5.0, 1 from me_q where key = 'Q3e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Answers each part asked, in a clear order (verse, word meaning, overall meaning).', 2.5, 2 from me_q where key = 'Q3e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (སྐད་ཡིག)', 'Correct Chöke or Dzongkha, spelling and honorifics.', 2.5, 3 from me_q where key = 'Q3e';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'འོག་ལུ་བཀོད་ཡོད་པའི་དྲི་བ་ལྔ་ལས་ གང་རུང་གསུམ་ལུ་ལན་རྐྱབ། (དྲི་བ་རེ་ལུ་སྐུགས་ ༡༢)

ཀ) གཤམ་འཁོད་ དབུ་འཇུག་གི་རྩ་བ་ ཚིག་རྐང་བདུན་པོའི་ འགྲེལ་བཤད་རང་སྟོབས་ཀྱིས་རྒྱོབ། (སྐུགས་ ༡༢)
སོ་སོ་སྐྱེ་བོའི་དུས་ནའང་སྟོང་པ་ཉིད་ཐོས་ནས། །ནང་དུ་རབ་ཏུ་དགའ་བ་ཡང་དང་ཡང་དུ་འབྱུང་། །
རབ་ཏུ་དགའ་བ་ལས་བྱུང་མཆི་མས་མིག་བརླན་ཞིང་། །ལུས་ཀྱི་བ་སྤུ་ལྡང་བར་འགྱུར་བ་གང་ཡིན་པ། །
དེ་ལ་རྫོགས་པའི་སངས་རྒྱས་བློ་ཡི་ས་བོན་ཡོད། །དེ་ཉིད་ཉེ་བར་བསྟན་པའི་སྣོད་ནི་དེ་ཡིན་ཏེ། །
དེ་ལ་དམ་པའི་དོན་གྱི་བདེན་པ་བསྟན་པར་བྱ། །', 'ལན་གྱི་དཔེ་ (outline)
རྩ་བ་འདི་ དབུ་མ་འཇུག་པ་ ལེའུ་དྲུག་པ་ནང་ སྟོང་ཉིད་ བསྟན་པའི་ སྣོད་ ངོས་འཛིན་པ་ཨིན། སོ་སོ་སྐྱེ་བོའི་ དུས་སུ་ཡང་ སྟོང་པ་ཉིད་ཀྱི་ ཆོས་ ཐོས་པ་ཙམ་གྱིས་ ནང་སེམས་ལུ་ ཡང་ཡང་ དགའ་བ་ སྐྱེ་ནི། དགའ་བ་ལས་ མཆི་མ་ཤོར་ཏེ་ མིག་ བརླན་ནི་དང་ བ་སྤུ་ ལྡང་ནི་ཚུ་ སྟོང་ཉིད་ལུ་ མོས་པའི་ ཕྱི་ནང་གི་ རྟགས་ཨིན། མི་དེ་ལུ་ སྔོན་ལས་ སྟོང་ཉིད་ཀྱི་ བག་ཆགས་ཡོདཔ་ལས་ རྫོགས་པའི་ སངས་རྒྱས་ཀྱི་ བློའི་ ས་བོན་ཡོད། དེ་འབདཝ་ལས་ མི་དེ་ སྟོང་ཉིད་ བསྟན་པའི་ སྣོད་ ཨིནམ་ལས་ དེ་ལུ་ དོན་དམ་པའི་ བདེན་པ་ བསྟན་དགོ། སྣོད་མིན་ལུ་ བསྟན་པ་ཅིན་ ཆད་ལྟར་ ལྷུང་ཉེན་ཡོད།', null, '[{"point": "སྐབས་ (ལེའུ་ ༦ པ། སྟོང་ཉིད་ བསྟན་པའི་ སྣོད་ཀྱི་ མཚན་ཉིད།)", "marks": 2}, {"point": "སོ་སོ་སྐྱེ་བོ་ཡིན་རུང་ སྟོང་ཉིད་ ཐོས་པའི་ཚེ་ ནང་དགའ་བ། མཆི་མ། བ་སྤུ་ལྡང་བ་ - ཕྱི་ནང་གི་ རྟགས།", "marks": 4}, {"point": "དེ་ལ་ རྫོགས་པའི་ སངས་རྒྱས་ཀྱི་ བློའི་ ས་བོན་ (སྟོང་ཉིད་ རྟོགས་པའི་ བག་ཆགས་) ཡོད།", "marks": 3}, {"point": "དེ་ སྟོང་ཉིད་ བསྟན་པའི་ སྣོད་ ཡིན་པས་ དོན་དམ་བདེན་པ་ བསྟན་དགོ། སྣོད་མིན་ལ་ བསྟན་ན་ ཉེན་ཁ།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'buddhist-studies'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'buddhist-studies') and t.slug = 'madhyamak-vat-ra'), (select id from public.exam_papers where code = 'me-dzongkha-3'), 'standard', 12,
    1296, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Buddhist Studies: a lopen (Buddhist Studies teacher) must check the model answer and marking guide before publishing.", "Real RCSC text from a PDF whose font drops letters; repaired automatically: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Dzongkha category, Buddhist Studies): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-III.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'Q4a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Correct meaning of the root text, accurate terms and points, relevant explanation.', 6.0, 1 from me_q where key = 'Q4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Answers each part asked, in a clear order (verse, word meaning, overall meaning).', 3.0, 2 from me_q where key = 'Q4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (སྐད་ཡིག)', 'Correct Chöke or Dzongkha, spelling and honorifics.', 3.0, 3 from me_q where key = 'Q4a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'འོག་ལུ་བཀོད་ཡོད་པའི་དྲི་བ་ལྔ་ལས་ གང་རུང་གསུམ་ལུ་ལན་རྐྱབ། (དྲི་བ་རེ་ལུ་སྐུགས་ ༡༢)

ཁ) དེ་ཕྱིར་རྒྱལ་བས་སྦྱིན་པའི་གཏམ་མཛད་ནས། །ཚུལ་ཁྲིམས་རྗེས་འགྲོའི་གཏམ་ཉིད་མཛད་པ་ཡིན། ། ཞེས་པའི་སྐབས་ ཚུལ་ཁྲིམས་འདི་ཉིད་ གལ་ཆེ་བ་ཇི་ལྟ་བུ་ཞིག་ཡིན་ནམ? ཁ་གསལ་བཀོད་དེ་ གཞན་ལ་ཕན་པའི་ བསླབ་བྱ་ཞིག་ ཚིག་འབྲུ་ ༡༢༠ འི་ནང་འཁོད་བྲིས། (སྐུགས་ ༡༢)', 'ལན་གྱི་དཔེ་ (outline)
རྩ་བ་འདི་ དབུ་མ་འཇུག་པ་ ལེའུ་གཉིས་པ་ ཚུལ་ཁྲིམས་ཀྱི་ སྐབས་ལས་ཨིན། སྦྱིན་པ་ གཏང་བ་ལས་ ལོངས་སྤྱོད་ འབྱུང་རུང་ ཚུལ་ཁྲིམས་ཀྱི་ རྐང་པ་ ཉམས་པ་ཅིན་ ངན་སོང་དུ་ ལྷུང་སྟེ་ དུད་འགྲོ་ སོགས་སུ་ ལོངས་སྤྱོད་ སྤྱོད་དགོཔ་ འབྱུངམ་ལས་ སྦྱིན་པའི་ འབྲས་བུ་ མཐོ་རིས་སུ་ སྤྱོད་ནིའི་ དོན་ལུ་ ཚུལ་ཁྲིམས་ དགོ། དེ་འབདཝ་ལས་ རྒྱལ་བས་ སྦྱིན་པའི་ ཤུལ་ལུ་ ཚུལ་ཁྲིམས་ཀྱི་ གཏམ་ གསུངས་ཨིན། ཚུལ་ཁྲིམས་འདི་ མཐོ་རིས་དང་ ངེས་ལེགས་ཀྱི་ རྒྱུ་ ཡོན་ཏན་ག་ར་གི་ གཞི་ཨིན།
བསླབ་བྱ། ཉིན་བསར་ མི་དགེ་བ་བཅུ་ སྤང་། ལཱ་ནང་ དྲང་བདེན་ ཉམས་སྲུང་། གཞན་ལུ་ གནོད་པ་ མ་བཏང་། ཚུལ་ཁྲིམས་མེད་པའི་ སྦྱིན་པ་འདི་ རྐང་པ་ཉམས་པའི་ མི་གིས་ ནོར་ཁུར་བ་ཟེར་ དྲན་ཏེ་ ངག་དང་ སྤྱོད་པ་ གཙང་མ་ བཞག།', null, '[{"point": "སྐབས་ (ལེའུ་ ༢ པ་ དྲི་མ་མེད་པ། ཚུལ་ཁྲིམས།)", "marks": 2}, {"point": "ཚུལ་ཁྲིམས་ ཉམས་ན་ སྦྱིན་པའི་ འབྲས་བུ་ ངན་སོང་དུ་ སྤྱོད་དགོཔ། ཚུལ་ཁྲིམས་ མཐོ་རིས་དང་ ངེས་ལེགས་ཀྱི་ རྒྱུ།", "marks": 5}, {"point": "གཞན་ལ་ཕན་པའི་ བསླབ་བྱ་ (ཚིག་འབྲུ་ ༡༢༠ ནང་ འཁོད་) ལག་ལེན་ཅན།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'buddhist-studies'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'buddhist-studies') and t.slug = 'madhyamak-vat-ra'), (select id from public.exam_papers where code = 'me-dzongkha-3'), 'standard', 12,
    1296, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Buddhist Studies: a lopen (Buddhist Studies teacher) must check the model answer and marking guide before publishing.", "Real RCSC text from a PDF whose font drops letters; repaired automatically: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Dzongkha category, Buddhist Studies): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-III.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'Q4b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Correct meaning of the root text, accurate terms and points, relevant explanation.', 6.0, 1 from me_q where key = 'Q4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Answers each part asked, in a clear order (verse, word meaning, overall meaning).', 3.0, 2 from me_q where key = 'Q4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (སྐད་ཡིག)', 'Correct Chöke or Dzongkha, spelling and honorifics.', 3.0, 3 from me_q where key = 'Q4b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'འོག་ལུ་བཀོད་ཡོད་པའི་དྲི་བ་ལྔ་ལས་ གང་རུང་གསུམ་ལུ་ལན་རྐྱབ། (དྲི་བ་རེ་ལུ་སྐུགས་ ༡༢)

ག) སྤྱིར་བཏང་ དོན་དམ་པའི་བདེན་པ་དང་ ཀུན་རྫོབ་ཀྱི་བདེན་པ་གཉིས་ཀྱི་ ཁྱད་པར་ཁ་གསལ་བྲིས། (སྐུགས་ ༡༢)', 'ལན་གྱི་དཔེ་ (outline)
དབུ་མ་འཇུག་པ་ལས། "དངོས་ཀུན་ཡང་དག་བརྫུན་པ་མཐོང་བ་ཡིས། །དངོས་རྙེད་ངོ་བོ་གཉིས་ནི་འཛིན་པར་འགྱུར། །ཡང་དག་མཐོང་ཡུལ་གང་དེ་དེ་ཉིད་དེ། །མཐོང་བ་བརྫུན་པ་ཀུན་རྫོབ་བདེན་པར་གསུངས། །"
ཀུན་རྫོབ་བདེན་པ། ཐ་སྙད་ཀྱི་ ཚད་མས་ རྙེད་པའི་ ཡུལ་ (ཀ་བ་ བུམ་པ་ ལ་སོགས་པ་) བདེན་པར་ སྣང་རུང་ རང་བཞིན་གྱིས་ མ་གྲུབ་པའི་ བསླུ་བའི་ ཆོས།
དོན་དམ་བདེན་པ། ཡང་དག་པ་ མཐོང་བའི་ རིགས་ཤེས་ཀྱིས་ རྙེད་པའི་ ཡུལ་ སྟོང་པ་ཉིད་ ཆོས་ཐམས་ཅད་ རང་བཞིན་མེད་པ། མི་བསླུ་བ།
ཁྱད་པར། ཀུན་རྫོབ་ ཐ་སྙད་ཀྱི་ ཡུལ་ སྣང་བའི་ ཕྱོགས། དོན་དམ་ གནས་ལུགས་ སྟོང་པའི་ ཕྱོགས། ངོ་བོ་ གཅིག་ལ་ ལྡོག་པ་ ཐ་དད།', null, '[{"point": "ཀུན་རྫོབ་བདེན་པའི་ མཚན་ཉིད་ (མཐོང་བ་བརྫུན་པའི་ ཡུལ།) དང་ དཔེ།", "marks": 4}, {"point": "དོན་དམ་བདེན་པའི་ མཚན་ཉིད་ (ཡང་དག་མཐོང་བའི་ ཡུལ་ སྟོང་ཉིད།) དང་ དཔེ།", "marks": 4}, {"point": "ལུང་ (དངོས་ཀུན་ཡང་དག་བརྫུན་པ་མཐོང་བ་ཡིས། ། སོགས་) དང་ ཁྱད་པར་ ཁ་གསལ།", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'buddhist-studies'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'buddhist-studies') and t.slug = 'madhyamak-vat-ra'), (select id from public.exam_papers where code = 'me-dzongkha-3'), 'standard', 12,
    1296, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Buddhist Studies: a lopen (Buddhist Studies teacher) must check the model answer and marking guide before publishing.", "Real RCSC text from a PDF whose font drops letters; repaired automatically: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Dzongkha category, Buddhist Studies): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-III.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'Q4c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Correct meaning of the root text, accurate terms and points, relevant explanation.', 6.0, 1 from me_q where key = 'Q4c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Answers each part asked, in a clear order (verse, word meaning, overall meaning).', 3.0, 2 from me_q where key = 'Q4c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (སྐད་ཡིག)', 'Correct Chöke or Dzongkha, spelling and honorifics.', 3.0, 3 from me_q where key = 'Q4c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'འོག་ལུ་བཀོད་ཡོད་པའི་དྲི་བ་ལྔ་ལས་ གང་རུང་གསུམ་ལུ་ལན་རྐྱབ། (དྲི་བ་རེ་ལུ་སྐུགས་ ༡༢)

ང) མངོན་པ་མཛོད་ གནས་གཉིས་པའི་སྐབས་ དབང་པོ་ ༢༢ ལས་ མིག་ལ་སོགས་པའི་ དབང་པོ་ ༥ དང་། ཕོ་མོའི་དབང་པོ་ ༢ ཀྱིས་ དོན་གང་དང་གང་ལ་ དབང་བྱེད་པ་ཡིན? རེ་རེ་བཞིན་བྲིས། (སྐུགས་ ༡༢)', 'ལན་གྱི་དཔེ་ (outline)
མཛོད་ལས། "བདག་ཉིད་མཛེས་བྱེད་སྲུང་བ་དང་། །རྣམ་ཤེས་ཐུན་མོང་མ་ཡིན་པའི། །རྒྱུ་ལ་མིག་སོགས་ལྔ་དབང་བྱེད། །"
མིག་ལ་སོགས་པའི་ དབང་པོ་ལྔ་ ༡. ལུས་ མཛེས་པར་ བྱེད་པ་ལ་ དབང་བྱེད། ༢. ལུས་ སྲུང་བ་ (མཐོང་ཐོས་ལས་ ཉེན་ཁ་ སྤང་བ་) ལ་ དབང་བྱེད། ༣. རང་རང་གི་ རྣམ་པར་ཤེས་པ་ སྐྱེད་པ་ལ་ དབང་བྱེད། ༤. དེ་ཚུ་གི་ ཐུན་མོང་མ་ཡིན་པའི་ རྒྱུ་ལ་ དབང་བྱེད།
ཕོ་མོའི་ དབང་པོ་ གཉིས། སེམས་ཅན་ ཕོ་དང་མོ་ ཁྱད་པར་དུ་ དབྱེ་བ་ (དབྱིབས་ སྒྲ་ སྤྱོད་ལམ་ མི་འདྲ་བ་) ལ་ དབང་བྱེད།', null, '[{"point": "མིག་སོགས་ དབང་པོ་ ལྔ་ དོན་བཞི་ལ་ དབང་བྱེད - ལུས་ མཛེས་པར་བྱེད་པ། ལུས་ སྲུང་བ། རྣམ་ཤེས་ སྐྱེད་པ། ཐུན་མོང་མ་ཡིན་པའི་ རྒྱུ། (རེ་རེ་ལུ་ ༢)", "marks": 8}, {"point": "ཕོ་མོའི་ དབང་པོ་ གཉིས་ - སེམས་ཅན་ ཕོ་མོ་ ཁྱད་པར་དུ་ དབྱེ་བ་ (དབྱིབས་ སྐད་ སྤྱོད་ལམ་) ལ་ དབང་བྱེད།", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'buddhist-studies'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'buddhist-studies') and t.slug = 'abhidharmako-a'), (select id from public.exam_papers where code = 'me-dzongkha-3'), 'standard', 12,
    1296, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Buddhist Studies: a lopen (Buddhist Studies teacher) must check the model answer and marking guide before publishing.", "Real RCSC text from a PDF whose font drops letters; repaired automatically: compare with the RCSC PDF.", "Check the root verse quoted in the model answer against the Kośa commentary used in class."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Dzongkha category, Buddhist Studies): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-III.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'Q4d', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Correct meaning of the root text, accurate terms and points, relevant explanation.', 6.0, 1 from me_q where key = 'Q4d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Answers each part asked, in a clear order (verse, word meaning, overall meaning).', 3.0, 2 from me_q where key = 'Q4d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (སྐད་ཡིག)', 'Correct Chöke or Dzongkha, spelling and honorifics.', 3.0, 3 from me_q where key = 'Q4d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'འོག་ལུ་བཀོད་ཡོད་པའི་དྲི་བ་ལྔ་ལས་ གང་རུང་གསུམ་ལུ་ལན་རྐྱབ། (དྲི་བ་རེ་ལུ་སྐུགས་ ༡༢)

ཅ) འོག་གི་རྩ་བ་ ཚིགས་བཅད་གཅིག་གི་ འགྲེལ་བཤད་བྲིས། (སྐུགས་ ༡༢)
མངོན་པ་མཛོད་གནས་གཉིས་པ་ལས། འདོད་ན་དབང་པོ་མེད་པ་དང་། །སྒྲ་མེད་ཕྲ་རབ་རྡུལ་རྫས་བརྒྱད། །ལུས་དབང་ལྡན་ལ་རྫས་དགུའོ། །དབང་པོ་གཞན་ལྡན་རྫས་བཅུའོ། །', 'ལན་གྱི་དཔེ་ (outline)
འདོད་པའི་ཁམས་སུ་ དབང་པོ་མེད་ཅིང་ སྒྲ་མེད་པའི་ ཕྲ་རབ་ (རྡུལ་ཕྲན་ བསགས་པ་) ནི་ རྫས་བརྒྱད་ཀྱིས་ གྲུབ། དེ་ཡང་ འབྱུང་བ་བཞི་ - ས་ ཆུ་ མེ་ རླུང་ དང་ འབྱུང་འགྱུར་བཞི་ - གཟུགས་ དྲི་ རོ་ རེག་བྱ་ ཨིན།
ལུས་ཀྱི་ དབང་པོ་ ལྡན་པའི་ ཕྲ་རབ་ལ་ དེའི་ཁར་ ལུས་དབང་ ཁ་སྐོང་སྟེ་ རྫས་དགུ།
མིག་ལ་སོགས་པའི་ དབང་པོ་ གཞན་ ལྡན་པའི་ ཕྲ་རབ་ལ་ ལུས་དབང་ ཡོད་པའི་ཁར་ དབང་པོ་ དེ་ཡང་ ཁ་སྐོང་སྟེ་ རྫས་བཅུ། (མིག་དབང་ ལུས་དབང་ ལས་ ཐ་དད་དུ་ མེད་པར་ མི་འབྱུང་བའི་ ཕྱིར།) སྒྲ་ ཡོད་ན་ རྫས་ ཅིག་ ཁ་སྐོང་།', null, '[{"point": "འདོད་ཁམས་ཀྱི་ ཕྲ་རབ་ (བསགས་པའི་ ཕྲ་རབ་) དབང་པོ་དང་ སྒྲ་ མེད་ན་ རྫས་ ༨ - འབྱུང་བ་བཞི་ (ས་ ཆུ་ མེ་ རླུང་) དང་ འབྱུང་འགྱུར་བཞི་ (གཟུགས་ དྲི་ རོ་ རེག་བྱ)", "marks": 5}, {"point": "ལུས་ཀྱི་ དབང་པོ་ ལྡན་ན་ རྫས་ ༩ (ལུས་དབང་ ཁ་སྐོང་)", "marks": 3}, {"point": "དབང་པོ་གཞན་ (མིག་ སོགས་) ལྡན་ན་ རྫས་ ༡༠ (ལུས་དབང་ དང་ དབང་པོ་དེ།)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'buddhist-studies'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'buddhist-studies') and t.slug = 'abhidharmako-a'), (select id from public.exam_papers where code = 'me-dzongkha-3'), 'standard', 12,
    1296, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Buddhist Studies: a lopen (Buddhist Studies teacher) must check the model answer and marking guide before publishing.", "Real RCSC text from a PDF whose font drops letters; repaired automatically: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Dzongkha category, Buddhist Studies): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-III.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'Q4e', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Correct meaning of the root text, accurate terms and points, relevant explanation.', 6.0, 1 from me_q where key = 'Q4e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Answers each part asked, in a clear order (verse, word meaning, overall meaning).', 3.0, 2 from me_q where key = 'Q4e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (སྐད་ཡིག)', 'Correct Chöke or Dzongkha, spelling and honorifics.', 3.0, 3 from me_q where key = 'Q4e';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'short_answer', 'འོག་ལུ་བཀོད་ཡོད་པའི་ དྲི་བ་གཉིས་ལས་ གཅིག་གདམ་ཁ་རྐྱབ་སྟེ་ལན་བྲིས།

ཀ) མཐུ་ཆེན་ཆོས་ཀྱི་རྒྱལ་པོ་ ཞབས་དྲུང་ངག་དབང་རྣམ་རྒྱལ་མཆོག་ ལྗོངས་འདིར་མ་བྱོན་པའི་སྔོན་དང་ ལྷ་དང་བླ་མའི་ལུང་བསྟན་ལྟར་ ལྗོངས་འདིར་བྱོན་པའི་རྗེས་སུའི་ གནས་སྟངས་གཉིས་ལ་ ཁྱད་པར་ཇི་ལྟ་བུ་ཞིག་བྱུང་འདུག? གསལ་བར་བྲིས། (སྐུགས་ ༡༤)', 'ལན་གྱི་དཔེ་ (outline)
མ་བྱོན་པའི་སྔོན། ལྷོ་མོན་ ལྗོངས་འདི་ ས་གནས་ ལ་ལུ་ཅིག་ནང་ རྗེ་དཔོན་ སོ་སོ་ ཡོདཔ་དང་ ཆོས་བརྒྱུད་ མི་འདྲ་བ་ (ལྷ་པ་ གནས་རྙིང་པ་ སོགས་) ཡོད་དེ་ མཐུན་སྒྲིལ་ཅན་གྱི་ གཞུང་ གཅིག་ མེད་པར་ འཁྲུག་རྩོད་ བྱུང་ནི་ཨིན།
བྱོན་པ། སྤྱི་ལོ་ ༡༦༡༦ ལུ་ ལྷ་ (དཔལ་ཡེ་ཤེས་མགོན་པོ་) དང་ བླ་མའི་ ལུང་བསྟན་ལྟར་ ཞབས་དྲུང་ རིན་པོ་ཆེ་ ལྗོངས་འདིར་ ཕེབས།
བྱོན་པའི་རྗེས། ཆོས་སྲིད་ལུགས་གཉིས་ཀྱི་ ལམ་ལུགས་ གཞི་བཙུགས། ལྕགས་རི་ སྤ་རོ་ སྤུ་ན་ཁ་ ལ་སོགས་པའི་ རྫོང་ཚུ་ བཞེངས། གཞུང་གྲྭ་ཚང་ གཞི་བཙུགས། ཁྲིམས་ཡིག་ བཀོད། བོད་ཀྱི་ དམག་ ཐེངས་ ལེ་ཤ་ ཕམ་སྟེ་ རྒྱལ་ཁབ་ གཅིག་ཏུ་ བསྡུས་ནི། འབྲུག་གི་ ངོ་རྐྱང་ ལམ་སྲོལ་ སྒོ་སྒྲིག་ ཚུ་ བཙུགས།
ཁྱད་པར། སྔོན་ ཆ་སྙོམས་ མེད་པའི་ ས་གནས་ སོ་སོ་ལས་ རྗེས་སུ་ ཆོས་སྲིད་ ཟུང་འབྲེལ་ཅན་གྱི་ རྒྱལ་ཁབ་ གཅིག་ ཆགས།', null, '[{"point": "མ་བྱོན་པའི་སྔོན་ - ས་གནས་ཀྱི་ དཔོན་པོ་ དང་ ཆོས་བརྒྱུད་ སོ་སོ། མཐུན་སྒྲིལ་ མེད། གཅིག་ཁྱབ་ཀྱི་ གཞུང་ མེད།", "marks": 4}, {"point": "བྱོན་པ་ (སྤྱི་ལོ་ ༡༦༡༦) - ལྷ་ (མགོན་པོ་) དང་ བླ་མའི་ ལུང་བསྟན།", "marks": 2}, {"point": "རྗེས་སུ་ - ཆོས་སྲིད་ལུགས་གཉིས། རྫོང་ བཞེངས། གཞུང་གྲྭ་ཚང་། ཁྲིམས་ཡིག། ཕྱི་ཕྱོགས་ཀྱི་ དམག་ལས་ རྒྱལ་ཁ། རྒྱལ་ཁབ་ གཅིག་ཏུ་ བསྡུ།", "marks": 6}, {"point": "ཁྱད་པར་ ཁ་གསལ་ མཇུག་བསྡུ།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'buddhist-studies'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'buddhist-studies') and t.slug = 'history-of-the-dharma'), (select id from public.exam_papers where code = 'me-dzongkha-3'), 'standard', 14,
    1512, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Buddhist Studies: a lopen (Buddhist Studies teacher) must check the model answer and marking guide before publishing.", "Real RCSC text from a PDF whose font drops letters; repaired automatically: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Dzongkha category, Buddhist Studies): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-III.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'Q5a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Correct meaning of the root text, accurate terms and points, relevant explanation.', 7.0, 1 from me_q where key = 'Q5a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Answers each part asked, in a clear order (verse, word meaning, overall meaning).', 3.5, 2 from me_q where key = 'Q5a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (སྐད་ཡིག)', 'Correct Chöke or Dzongkha, spelling and honorifics.', 3.5, 3 from me_q where key = 'Q5a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'short_answer', 'འོག་ལུ་བཀོད་ཡོད་པའི་ དྲི་བ་གཉིས་ལས་ གཅིག་གདམ་ཁ་རྐྱབ་སྟེ་ལན་བྲིས།

ཁ) ཁྱོད་ཀྱི་བསམ་བློ་ལྟར་ན་ ཆོས་ཚན་ཆོས་འབྱུང་འདི་ལ་སློབ་སྦྱོང་བྱས་ཏེ་ གཞུང་དང་གཞུང་མིན་ལས་སྡེའི་ལས་གཡོག་གཉིས་ལས་ གང་ལ་ཕན་ཐོགས་ཆེ་བར་ མཐོང་གི་འདུག? ཅིའི་ཕྱིར? (སྐུགས་ ༡༤)', 'ལན་གྱི་དཔེ་ (outline; any well-argued view earns marks)
ང་གི་ བསམ་བློ་ལྟར་ན་ ཆོས་འབྱུང་ སྦྱང་མི་འདི་ གཞུང་གི་ ལས་གཡོག་ལུ་ ཕན་ཐོགས་ཆེ། རྒྱུ་མཚན། ༡. རྫོང་ཁག་ དང་ རྫོང་ཚུ་ནང་ ལཱ་འབད་བའི་སྐབས་ ཆོས་སྲིད་ཟུང་འབྲེལ་གྱི་ ལོ་རྒྱུས་ དང་ སྒོ་སྒྲིག་ ཤེས་དགོ། ༢. ལམ་སྲོལ་ ཉམས་སྲུང་ གི་ སྲིད་བྱུས་ བཟོ་ནི་ལུ་ ཕན། ༣. རྒྱལ་གཅེས་ དང་ ཞབས་ཏོག་གི་ སེམས་ བསྐྱེད།
ཨིན་རུང་ གཞུང་མིན་ ལས་སྡེ་ (ཕྱི་ཡུལ་ ཡུལ་སྐོར་ ལམ་སྟོན་ པ་ སྐྱེས་ཕྲུག་ སོགས་) ལུ་ཡང་ ཕན་ཐོགས་ཡོད།
མཇུག་བསྡུ། ཆོས་འབྱུང་ ཤེས་པའི་ མི་གིས་ ལས་སྡེ་ ག་ཏེ་ནང་ཡང་ རྒྱལ་ཁབ་ཀྱི་ ངོ་རྐྱང་ ཉམས་སྲུང་ འབད་ཚུགས།', null, '[{"point": "ཕྱོགས་ཅིག་ ཁ་གསལ་སྦེ་ གདམ་ཁ་ (ཡང་ན་ གཉིས་ཆ་ར་ ཁུངས་དང་བཅས།)", "marks": 2}, {"point": "རྒྱུ་མཚན་ ༣ (ལོ་རྒྱུས་ཤེས་པས་ ཆོས་སྲིད་ ལམ་སྲོལ་ སྒོ་སྒྲིག་ རྒྱལ་གཅེས་ ཤེས། ཞབས་ཏོག་ ལུ་ ཕན།) དཔེ་དང་བཅས།", "marks": 9}, {"point": "མཇུག་བསྡུ།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'buddhist-studies'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'buddhist-studies') and t.slug = 'history-of-the-dharma'), (select id from public.exam_papers where code = 'me-dzongkha-3'), 'standard', 14,
    1512, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Buddhist Studies: a lopen (Buddhist Studies teacher) must check the model answer and marking guide before publishing.", "Real RCSC text from a PDF whose font drops letters; repaired automatically: compare with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Dzongkha category, Buddhist Studies): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper III (Buddhist Studies)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-III.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'Q5b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Correct meaning of the root text, accurate terms and points, relevant explanation.', 7.0, 1 from me_q where key = 'Q5b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Answers each part asked, in a clear order (verse, word meaning, overall meaning).', 3.5, 2 from me_q where key = 'Q5b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (སྐད་ཡིག)', 'Correct Chöke or Dzongkha, spelling and honorifics.', 3.5, 3 from me_q where key = 'Q5b';
commit;
