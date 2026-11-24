-- ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'comprehension', 'Comprehension' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'essay', 'Essay' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'formal-writing', 'Formal writing' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'language-and-spelling', 'Language and spelling' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'pr-cis', 'Précis' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'translation', 'Translation' on conflict (subject_id, slug) do nothing;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-general-1') and subject_group_id is not distinct from null;
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-general-1'), null, null, 1, 'Question 1: Essay (འབྲི་རྩོམ།)', 'essay', 2, 30, 1, 'BCSE 2025 Main Examination, General category, Paper I (Dzongkha)');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-general-1'), null, null, 2, 'Question 2: Formal writing (ཡིག་བསྐུར་རྣམ་གཞག།)', 'long_answer', 2, 20, 1, 'BCSE 2025 Main Examination, General category, Paper I (Dzongkha)');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-general-1'), null, null, 3, 'Question 3: Précis (བཅུད་དོན།)', 'descriptive', 1, 10, null, 'BCSE 2025 Main Examination, General category, Paper I (Dzongkha)');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-general-1'), null, null, 4, 'Question 4: Language and spelling (སྐད་ཡིག་དང་ཡི་གུའི་སྦྱོར་བ།)', 'short_answer', 1, 10, null, 'BCSE 2025 Main Examination, General category, Paper I (Dzongkha)');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-general-1'), null, null, 5, 'Question 5: Comprehension (གོ་བ་ལེན་ནི།)', 'passage', 1, 15, null, 'BCSE 2025 Main Examination, General category, Paper I (Dzongkha)');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-general-1'), null, null, 6, 'Question 6: Translation (སྐད་སྒྱུར།)', 'translation', 1, 15, null, 'BCSE 2025 Main Examination, General category, Paper I (Dzongkha)');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'essay', 'འོག་གི་འབྲི་རྩོམ་གྱི་དོན་ཚན་ལུ་གཞི་བཞག་སྟེ་ ཚིག་འབྲུ་ ༥༠༠ དེ་ཅིག་གི་ནང་འཁོད་ལུ་ འབྲི་རྩོམ་ཅིག་བྲིས། (སྐུགས་ ༣༠)
(སྐུགས་ཀྱི་ཚད་གཞི་ - ནང་དོན། འབྲི་བཀོད། དང་ སྐད་ཡིག་དང་ཡིག་སྦྱོར་ཚུ་ལུ་གཞི་བཞག་སྟེ་ སྐུགས་བྱིན་ནི་ཨིན།)

འཛམ་གླིང་གཅིག་འགྱུར་གྱི་ནམ་དུས་ལུ་ སྐད་ཡིག་དང་ལམ་སྲོལ་ དེ་ལས་ བརྩི་མཐོང་ཚུ་རྩིས་ཏེ་ འབྲུག་གི་གཞན་དང་མ་འདྲ་བའི་ ལམ་སྲོལ་གྱི་སྲོལ་ཁྱུན་ཚུ་ བདག་འཛིན་འཐབ་ནི་ལུ་ གདོང་ལེན་ཡོད་མི་ཚུ་གི་སྐོར་ལས་ གྲོས་བསྟུན་འབད་དེ་ བྲིས།', 'ལན་གྱི་དཔེ་ (outline)

མགོ་བཙུགས། འཛམ་གླིང་གཅིག་འགྱུར་གྱི་ནམ་དུས་འདི་ནང་ བརྙན་འཕྲིན་ ཚོང་འབྲེལ་ དེ་ལས་ འགྲུལ་སྐྱོད་ཚུ་ལས་བརྟེན་ རྒྱལ་ཁབ་ག་ར་ ཉེ་འབྲེལ་ཅན་སྦེ་སོང་ཡོདཔ་ཨིན། འབྲུག་གི་སྐད་ཡིག་ ལམ་སྲོལ་ དེ་ལས་ བརྩི་མཐོང་ཚུ་ ང་བཅས་རའི་རྒྱལ་ཁབ་ཀྱི་ ངོ་རྐྱང་དང་ རང་དབང་གི་གཞི་རྩ་ཨིན།

གདོང་ལེན།
༡. ཕྱི་རྒྱལ་གྱི་སྐད་ཡིག་དང་ བརྙན་ཐོག་གི་ཤུགས་རྐྱེན་ལས་བརྟེན་ ན་གཞོན་ཚུ་གིས་ རྫོང་ཁ་ལུ་ དོ་སྣང་ཉུང་སུ་བཏང་དོ་ཡོདཔ།
༢. སྒྲིག་ལམ་རྣམ་གཞག་དང་ གོ་ལ་གི་ལམ་སྲོལ་ཚུ་ ཉིན་བསར་གྱི་མི་ཚེ་ནང་ ལག་ལེན་ཉུང་སུ་འགྱོ་མི།
༣. ཁྲོམ་ཁར་སྤོ་མི་དང་ ཕྱི་རྒྱལ་ལུ་འགྱོ་མི་ལས་བརྟེན་ གཡུས་ཁའི་ལམ་སྲོལ་དང་ རྩེད་མོ་ ཞབས་ཁྲ་ཚུ་ ཉམས་འགྱོ་མི།
༤. ཉོ་ཚོང་གི་ཅ་ཆས་དང་ གྱོན་ཆས་ཚུ་ ཕྱི་རྒྱལ་ལས་འོང་ཞིནམ་ལས་ རང་སོའི་ལག་ཤེས་ཉམས་ནིའི་ཉེན་ཁ།

ཐབས་ལམ།
- ཁྱིམ་དང་སློབ་གྲྭ་ནང་ རྫོང་ཁ་ལག་ལེན་ཡར་དྲག་གཏང་ནི།
- བརྙན་འཕྲིན་དང་ ཡོངས་འབྲེལ་ཐོག་ལུ་ འབྲུག་གི་ལམ་སྲོལ་ཚུ་ ཁྱབ་སྤེལ་འབད་ནི།
- རྒས་ཤོས་ཚུ་ལས་ ན་གཞོན་ཚུ་ལུ་ ཤེས་ཡོན་སྤྲོད་ནི།
- གཞུང་གིས་ སྲིད་བྱུས་དང་ ལག་ཤེས་པ་ཚུ་ལུ་ རྒྱབ་སྐྱོར་འབད་ནི།

མཇུག་བསྡུ། འཛམ་གླིང་གཅིག་འགྱུར་འདི་ བཀག་མི་ཚུགས་རུང་ ང་བཅས་རའི་ ངོ་རྐྱང་ལམ་སྲོལ་ཚུ་ བདག་འཛིན་འཐབ་ནི་འདི་ མི་ངོ་རེ་རེ་གི་འགན་ཁུར་ཨིན།', null, '[{"point": "མགོ་བཙུགས། འཛམ་གླིང་གཅིག་འགྱུར་གྱི་དོན་དང་ འབྲུག་གི་ངོ་རྐྱང་ལམ་སྲོལ་གྱི་གལ་གནད།", "marks": 4}, {"point": "གདོང་ལེན་ ༣ ལས་ལྷག་ (དཔེར་ན་ ཕྱི་རྒྱལ་གྱི་སྐད་ཡིག་དང་ བརྙན་ཐོག་གི་ཤུགས་རྐྱེན། ན་གཞོན་ཚུ་གིས་ རྫོང་ཁ་དང་ སྒྲིག་ལམ་རྣམ་གཞག་ ལག་ལེན་ཉུང་སུ། ཕྱི་རྒྱལ་ལུ་འགྱོ་མི། ཁྲོམ་ཁར་སྤོ་མི།) དཔེ་དང་བཅས།", "marks": 12}, {"point": "ཐབས་ལམ་ (ཁྱིམ་དང་སློབ་གྲྭ་ནང་ རྫོང་ཁ་ལག་ལེན། བརྙན་འཕྲིན་ཐོག་ ལམ་སྲོལ་ཡར་དྲག། གཞུང་གི་སྲིད་བྱུས།)", "marks": 8}, {"point": "མཇུག་བསྡུ་ - ང་བཅས་རའི་འགན་ཁུར།", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'essay'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper I (Dzongkha)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-I-Dzongkha.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'E1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 12.0, 1 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 7.5, 2 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 10.5, 3 from me_q where key = 'E1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'essay', 'འོག་གི་འབྲི་རྩོམ་གྱི་དོན་ཚན་ལུ་གཞི་བཞག་སྟེ་ ཚིག་འབྲུ་ ༥༠༠ དེ་ཅིག་གི་ནང་འཁོད་ལུ་ འབྲི་རྩོམ་ཅིག་བྲིས། (སྐུགས་ ༣༠)
(སྐུགས་ཀྱི་ཚད་གཞི་ - ནང་དོན། འབྲི་བཀོད། དང་ སྐད་ཡིག་དང་ཡིག་སྦྱོར་ཚུ་ལུ་གཞི་བཞག་སྟེ་ སྐུགས་བྱིན་ནི་ཨིན།)

མ་འོངས་པ་ནང་ ཁྱོད་ འབྲུག་གི་བོན་ཆེན་སྦེ་ བཙག་འཐུ་གྲུབ་པ་ཅིན་ དཔལ་འབོར་གྱི་གདོང་ལེན་ཡོད་མི་ཚུ་བསལ་ཏེ་ གོང་འཕེལ་ག་དེ་སྦེ་ གཏང་ནི་སོ? དེ་ལུ་གཞི་བཞག་སྟེ་ འཆར་སྣང་འབྲི་རྩོམ་ཅིག་ བྲིས།', 'ལན་གྱི་དཔེ་ (outline)

མགོ་བཙུགས། ང་བོན་ཆེན་སྦེ་ བཙག་འཐུ་གྲུབ་པ་ཅིན་ རྒྱལ་ཡོངས་དགའ་སྐྱིད་དཔལ་འཛོམས་ཀྱི་ ལམ་སྟོན་འོག་ལུ་ དཔལ་འབོར་ ཡར་དྲག་གཏང་ནི་ ང་གི་གཙོ་བོ་ཨིན།

གདོང་ལེན།
༡. དཔལ་འབོར་ ཆུ་གློག་ལུ་ བརྟེན་དགོཔ་ཡོདཔ།
༢. ན་གཞོན་ཚུ་ལུ་ ལས་གཡོགས་མེདཔ་དང་ ཕྱི་རྒྱལ་ལུ་འགྱོ་མི་མང་སུ་ཡོདཔ།
༣. ཕྱི་རྒྱལ་ལས་ ཉོ་ཚོང་ཅ་ཆས་ ནང་འདྲེན་མང་དྲགས་འབད་མི་དང་ བུ་ལོན་ཡར་སེང་།

ལཱ་གི་འཆར་གཞི།
- སོ་ནམ་དང་ ཕྱུགས་གསོ་ཡར་དྲག་གཏང་སྟེ་ ནང་འཁོད་ཐོན་སྐྱེད་ཡར་སེང་ནི།
- ཚོང་ལཱ་ཆུང་ཀུ་དང་ ན་གཞོན་ཚུ་གི་ ཚོང་ལཱ་ལུ་ དངུལ་འབབ་དང་ ལག་ཤེས་སྦྱོང་བརྡར་རྒྱབ་སྐྱོར།
- ཞི་བདེ་སེམས་བརྩེའི་གྲོང་ཁྱེར་ (GMC) བཟུམ་གྱི་ ལས་འགུལ་ཚུ་ཐོག་ལས་ ཕྱི་རྒྱལ་གྱི་ མ་དངུལ་བཙུགས་ནི་དང་ ལས་གཡོགས་གསར་བསྐྲུན།
- ཉི་མའི་གློག་མེ་བཟུམ་གྱི་ བསྐྱར་གསོ་ནུས་ཤུགས་ ཡར་དྲག་གཏང་ནི།
- ལྟ་བཤལ་ཡར་དྲག་དང་ བརྙན་རིག་ལག་ལེན་གྱི་ ལཱ་ཚུ།
- ཀུན་གསལ་དང་ ཚུལ་ཁྲིམས་ཅན་གྱི་ གཞུང་སྐྱོང་།

མཇུག་བསྡུ། མི་སེར་ག་ར་ མཐུན་སྒྲིལ་ཐོག་ལས་ ལཱ་འབད་བ་ཅིན་ འབྲུག་ རང་མགོ་རང་འདྲོང་ཅན་གྱི་ དཔལ་འབོར་ཅིག་ཨིན་མི་ རྒྱལ་ཁབ་ཅིག་ ཆགས་ཚུགས།', null, '[{"point": "མགོ་བཙུགས། ད་ལྟོའི་དཔལ་འབོར་གནས་སངས་ (ཆུ་གློག་ལུ་བརྟེན་དགོཔ། ན་གཞོན་ལཱ་མེད། ཕྱི་རྒྱལ་ལུ་འགྱོ་མི།)", "marks": 5}, {"point": "དཔལ་འབོར་གྱི་གདོང་ལེན་ ༣ ལས་ལྷག་ ངོས་འཛིན།", "marks": 7}, {"point": "ལཱ་གི་འཆར་གཞི་ ༣-༤ (ལས་གཡོགས་གསར་བསྐྲུན། སོ་ནམ་ཡར་དྲག། ཚོང་ལཱ་ཆུང་ཀུ་ལུ་རྒྱབ་སྐྱོར། ཞི་བདེ་སེམས་བརྩེའི་གྲོང་ཁྱེར། ཀུན་གསལ་ཚུལ་ཁྲིམས།) ཁ་གསལ་སྦེ།", "marks": 12}, {"point": "རྒྱལ་ཡོངས་དགའ་སྐྱིད་དཔལ་འཛོམས་དང་ མཐུན་སྒྲིལ། མཇུག་བསྡུ།", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'essay'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper I (Dzongkha)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-I-Dzongkha.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'E2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 12.0, 1 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 7.5, 2 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 10.5, 3 from me_q where key = 'E2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'བསོད་ནམས་རྡོ་རྗེ་གི་མིང་ཐོ་ཁར་ ཐིམ་ཕུག་ལུ་ སྐམ་ཞིང་ དྲིསི་མཱལ་ ༥༠ ཡོད་མི་འདི་ ཉི་མ་རྡོ་རྗེ་ལུ་ བཙོང་ཡོད་མི་ལུ་ གཞི་བཞག་སྟེ་ ཉོ་བཙོང་གི་གན་རྒྱ་ཚད་ལྡན་ཅིག་ བྲིས། (སྐུགས་ ༢༠)

གན་རྒྱ་ནང་ཚུད་དགོ་པའི་གནད་དོན།
༡. ར་ཕན་གཉིས་ཀྱི་ངོ་སྤྲོད་ཁ་གསལ།
༢. ཉོ་བཙོང་འཐབ་ཡོད་པའི་ ས་ཆ་གི་ཁ་གསལ།
༣. དངུལ་སྤྲོད་ལེན་གྱི་ཁ་གསལ།
༤. སའི་བདག་དབང་སྤོ་ནིའི་དུས་ཡུན།
༥. འཛོམས་དཔང་རྒྱབ་མི་གི་ཁ་གསལ།', 'ལན་གྱི་དཔེ།

ས་ཆའི་ཉོ་བཙོང་གན་རྒྱ།

༡. ར་ཕན་གཉིས་ཀྱི་ངོ་སྤྲོད།
བཙོང་མི་ (ཕྱོགས་དང་པ)༽ བསོད་ནམས་རྡོ་རྗེ། ངོ་སྤྲོད་ཨང་ ............ ། སྡོད་གནས་ ............ །
ཉོ་མི་ (ཕྱོགས་གཉིས་པ)༽ ཉི་མ་རྡོ་རྗེ། ངོ་སྤྲོད་ཨང་ ............ ། སྡོད་གནས་ ............ །

༢. ས་ཆའི་ཁ་གསལ།
ཐིམ་ཕུག་རྫོང་ཁག་ ............ རྒེད་འོག་ ............ ལུ་ཡོད་པའི་ སྐམ་ཞིང་ ཌི་སི་མཱལ་ ༥༠ ཐམ་ཨང་ ............ འདི་ ཕྱོགས་དང་པའི་མིང་ཐོ་ཁར་ཡོདཔ་ཨིན། (མཚམས་ - ཤར་/ནུབ་/ལྷོ་/བྱང་)

༣. དངུལ་སྤྲོད་ལེན།
ས་ཆ་འདི་གི་གོང་ཚད་ ངུལ་ཀྲམ་ ............ འདི་ ཕྱོགས་གཉིས་པ་གིས་ ཕྱོགས་དང་པ་ལུ་ (དངུལ་ཁང་ཐོག་ / ལག་ལེན་) སྤྲོད་ཡོདཔ་ཨིན།

༤. བདག་དབང་སྤོ་ནིའི་དུས་ཡུན།
དངུལ་ཆ་ཚང་སྤྲོད་ཞིནམ་ལས་ ཟླཝ་ ............ གི་ནང་འཁོད་ལུ་ ས་ཆའི་བདག་དབང་ ཕྱོགས་གཉིས་པའི་མིང་ཐོ་ཁར་ སྤོ་ནིའི་ལཱ་ཚུ་ ཕྱོགས་དང་པ་གིས་འབད་དགོ།

༥. འཛོམས་དཔང་།
འཛོམས་དཔང་ ༡༽ མིང་ ............ ངོ་སྤྲོད་ཨང་ ............ མཚན་རྟགས་ ............
འཛོམས་དཔང་ ༢༽ མིང་ ............ ངོ་སྤྲོད་ཨང་ ............ མཚན་རྟགས་ ............

བཙོང་མི་གི་མཚན་རྟགས་ ............  ཉོ་མི་གི་མཚན་རྟགས་ ............
ས་གནས་ ............  ཚེས་གྲངས་ ............', null, '[{"point": "གན་རྒྱའི་མགོ་མིང་དང་ ར་ཕན་གཉིས་ཀྱི་ངོ་སྤྲོད་ (མིང་། ངོ་སྤྲོད་ཨང་། སྡོད་གནས།)", "marks": 4}, {"point": "ས་ཆའི་ཁ་གསལ་ (ས་གནས། ས་ཁོངས་ ཌི་སི་མཱལ་ ༥༠། ཐམ་ཨང་། མཚམས།)", "marks": 4}, {"point": "དངུལ་སྤྲོད་ལེན་ (གོང་ཚད། སྤྲོད་ཐངས། ཚེས་གྲངས།)", "marks": 4}, {"point": "བདག་དབང་སྤོ་ནིའི་དུས་ཡུན་དང་ ཆ་རྐྱེན།", "marks": 4}, {"point": "འཛོམས་དཔང་དང་ མཚན་རྟགས་ ཚེས་གྲངས། ཚད་ལྡན་འབྲི་བཀོད།", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'formal-writing'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper I (Dzongkha)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-I-Dzongkha.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'L1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 8.0, 1 from me_q where key = 'L1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 5.0, 2 from me_q where key = 'L1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 7.0, 3 from me_q where key = 'L1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'ཁྱོད་ར་ བུམ་ཐང་རྫོང་ཁག་ ཆུ་མིག་རྒེད་འོག་ལས་ སངས་རྒྱས་ཨིནམ་བཟོ་སྟེ་ རྒཔོ་ལུ་ སྦྲང་རྩི་གི་ཚོང་ལཱ་ཅིག་ གཞི་བཙུགས་འབད་ནིའི་དོན་ལུ་ གནང་བ་ཞུ་ནིའི་ ཞུ་ཡིག་ཚད་ལྡན་ཅིག་ སྔར་སྲོལ་ལམ་ལུགས་ཀྱི་ཐོག་ལུ་ བྲིས། (སྐུགས་ ༢༠)

ཞུ་ཡིག་ནང་ཚང་དགོ་པའི་གནད་དོན།
༡. ཞུ་ཡིག་ཕུལ་མིའི་ངོ་སྤྲོད་ཁ་གསལ།
༢. ཞུ་ཡིག་ཕུལ་དགོ་པའི་གནད་དོན་ཁ་གསལ།
༣. ཚོང་ལཱ་གཞི་བཙུགས་འབད་སའི་ས་གནས་ཀྱི་ཁ་གསལ།
༤. ཞུ་ཡིག་ཕུལ་བའི་གནམ་ལོ་ཟླ་ཚེས་དང་ སྤྱི་ཚེས་ཁ་གསལ།', 'ལན་གྱི་དཔེ།

སྐྱབས་མགོན་ རྒཔོ་མཆོག་ ཆུ་མིག་རྒེད་འོག། བུམ་ཐང་རྫོང་ཁག་ལུ།

ཞུ་དོན། སྦྲང་རྩི་གི་ཚོང་ལཱ་ གཞི་བཙུགས་འབད་ནིའི་ གནང་བ་ཞུ་བ།

གོང་ལུ་ཞུ་ཡོད་པའི་ཞུ་དོན་ནི་ ང་ སངས་རྒྱས་ ངོ་སྤྲོད་ཨང་ ............ ཆུ་མིག་རྒེད་འོག་ ............ གཡུས་ཀྱི་ ཁྲམ་ཨང་ ............ ཅན་གྱི་ མི་སེར་ཅིག་ཨིན།

ང་གིས་ ཆུ་མིག་རྒེད་འོག་ ............ ས་གནས་ལུ་ སྦྲང་མ་གསོ་སྟེ་ སྦྲང་རྩི་ཐོན་སྐྱེད་དང་ བཙོང་ནིའི་ ཚོང་ལཱ་ཆུང་ཀུ་ཅིག་ གཞི་བཙུགས་འབད་ནི་ལུ་ དམིགས་ཡོདཔ་ཨིན། ཚོང་ལཱ་འདི་གིས་ རང་གི་འོང་འབབ་ཡར་སེང་འགྱོ་ནི་མ་ཚད་ གཡུས་ཀྱི་ན་གཞོན་ཚུ་ལུ་ཡང་ ལཱ་གི་གོ་སྐབས་ ཐོབ་ནི་ཨིན།

དེ་འབདཝ་ལས་ ཚོང་ལཱ་འདི་ གཞི་བཙུགས་འབད་ནིའི་ གནང་བ་ཅིག་ གནང་དགོ་པའི་ཞུ་བ་ཕུལ་བ་ཨིན།

ཞུ་ཡིག་ཕུལ་མི།
སངས་རྒྱས། (མཚན་རྟགས)
གནམ་ལོ་ ............ ཟླཝ་ ............ ཚེས་ ............ ། སྤྱི་ཚེས་ ............', null, '[{"point": "སྔར་སྲོལ་ཞུ་ཡིག་གི་རྣམ་གཞག་ (ཞུ་ཡུལ་ལུ་ མཐོ་བཀོད་ཞེ་སའི་ཚིག ཞུ་ཡིག་ཕུལ་མི།)", "marks": 5}, {"point": "ཞུ་ཡིག་ཕུལ་མིའི་ངོ་སྤྲོད་ (སངས་རྒྱས། ཆུ་མིག་རྒེད་འོག། ངོ་སྤྲོད་ཨང་།)", "marks": 4}, {"point": "གནད་དོན་ཁ་གསལ་ (སྦྲང་རྩི་ཚོང་ལཱ། དགོས་དོན། ས་གནས།)", "marks": 6}, {"point": "གནམ་ལོ་ཟླ་ཚེས་དང་ སྤྱི་ཚེས། མཚན་རྟགས། ཞེ་སའི་ཚིག་དང་ ཡིག་སྦྱོར་ངེས་བདེན།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'formal-writing'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper I (Dzongkha)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-I-Dzongkha.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'L2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 8.0, 1 from me_q where key = 'L2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 5.0, 2 from me_q where key = 'L2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 7.0, 3 from me_q where key = 'L2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'descriptive', 'འོག་གི་གནས་ཚུལ་དེ་ནང་ལས་ ཤེས་དགོ་པའི་གནད་དོན་ཁག་ཆེ་དྲགས་ཚུ་མ་གཏོགས་ གཞན་དོན་དག་མེད་པའི་ཚིག་དོན་ཚུ་བཏོགས་ཏེ་ གནས་ཚུལ་འདི་ ཚིག་འབྲུ་༢༠༠-༣༠༠ དེ་ཅིག་ནང་བཅུད་བསྡུས་ཏེ་ བྲིས། (སྐུགས་ ༡༠)

རྒྱལ་ཡོངས་རྩིས་དཔྱད་བཀོད་འཛིན་གྱིས་ གསལ་སྟོན་འབད་ཡོད་པའི་ ཁྱིམ་གུང་གི་ ཉོ་སྤྱོད་དང་ཟད་འགྲོའི་སྙན་ཞུ་དང་འཁྲིལཝ་ད་ ཁྱིམ་གྱི་ཇོ་བདག་དང་ ཁང་གླ་ཁར་སྡོད་མི་ཚུ་གི་ ཁྱད་པར་དེ་ཡང་ རང་གི་ཁྱིམ་ནང་སྡོད་མི་བརྒྱ་ཆ་ ༥༣.༢ དང་ ཁྱིམ་ཁང་གླ་ཁར་སྡོད་མི་བརྒྱ་ཆ་ ༤༦.༨ ཡོདཔ་སྦེ་ གསལ་སྟོན་བྱུང་ཡོདཔ་ཨིན་པས།

གྲོང་གསེབ་ཚུ་ནང་འབད་བ་ཅིན་ ཁྱིམ་གྱི་ཇོ་བདག་མང་སུ་ཡོདཔ་ད་ ཁྱིམ་ཡོད་མི་བརྒྱ་ཆ་ ༧༥.༢ དང་ ཁང་གླ་ཁར་གཏང་མི་དེ་ བརྒྱ་ཆ་ ༢༤.༢ མ་གཏོགས་མེདཔ་སྦེ་ཨིན་པས། ཁྲོམ་ཁ་ལུ་འབད་བ་ཅིན་ ཁྱིམ་རང་དབང་ཡོད་མི་བརྒྱ་ཆ་ ༡༦.༢ ཡོད་པའི་གུར་ བརྒྱ་ཆ་ ༨༡.༨ དེ་ཅིག་ ཁང་གླ་ཁར་གཏང་མི་ཨིནམ་ལས་ འདི་ཚུ་ནང་ རྒྱུ་དངོས་ཀྱི་གནས་གོང་མཐོ་དྲགས་འབད་མི་དང་ གོ་སྐབས་ཚད་ཅིག་ལས་བརྒལ་མེད་མི་གིས་ གདོང་ལེན་བྱུང་དོ་ཡོདཔ་སྦེ་ཨིན་པས། འབྲུག་གི་ཁྲོམ་ཚོགས་སྤྱིར་བཏང་དང་ དམིགས་བསལ་གྱིས་ཐིམ་ཕུག་ལུ་འབད་བ་ཅིན་ རང་གི་འོང་འབབ་ལས་ བརྒྱ་ཆ་ ༣༠ ཁྱིམ་གྱི་དོན་ལུ་ཟད་འགྲོ་གཏང་དོ་ཡོདཔ་སྦེ་ གསལ་སྟོན་བྱུང་ཡོདཔ་ཨིན་པས། འཛམ་གླིང་སྤྱི་ཚོགས་མི་སྟོབས་ལས་རིམ་དང་འཁྲིལཝ་ད་ ཁྱིམ་གྱི་ཇོ་བདག་ཚུ་གིས་ ཁོང་རའི་འོང་འབབ་ལས་བརྒྱ་ཆ་ ༣༠ ལས་བརྒལ་ ཁྱིམ་གྱི་གནས་གོང་དང་ཁང་གླ་གུ་ལུ་ བཀལ་མ་ཆོགཔ་སྦེ་ཡོདཔ་ཨིན་པས།

ཞིབ་འཇུག་ནང་འབད་བ་ཅིན་ འབྲུག་མི་བརྒྱ་ཆ་ ༦༠ དེ་ཅིག་ ད་ལྟོ་ རང་ལུགས་ཀྱི་ཁྱིམ་ནང་སྡོད་ཡོདཔ་སྦེ་ཨིན་པས། གྲོང་གསེབ་ནང་འབད་བ་ཅིན་ ཁྱིམ་ནང་སྡོད་མི་བརྒྱ་ཆ་ ༨༢ ཡོད་པའི་གུར་ ཁྲོམ་ཚོགས་ནང་ འབད་བ་ཅིན་ བརྒྱ་ཆ་ ༦༦.༩ དེ་ཅིག་ ཡོདཔ་ཨིན་པས།

དབྱེ་ཞིབ་གནས་ཐོ་དང་འཁྲིལ་ཏེ་ འབད་བ་ཅིན་ རྫོང་ཁག་དང་ ཁྲོམ་སྡེ་ཚུ་ནང་ ཇོ་བདག་གི་ཁྱད་པར་ཚུ་ སྦོམ་སྦེ་ར་ཆགས་ཏེ་ཡོདཔ་སྦེ་ཨིན་པས། ལྷུན་རྩེ་དེ་ ཁྱིམ་གྱི་ཇོ་བདག་མཐོ་ཤོས་ཅིག་སྦེ་འཐོན་ཡོདཔ་ཨིན་མས། དེ་ཡང་ བརྒྱ་ཆ་ ༨༤.༣ ཨིནམ་དང་ འདི་གི་འོག་ལས་ར་ དར་དཀར་ནང་ལུ་ བརྒྱ་ཆ་ ༨༤.༡ ཡོདཔ་ཨིན་མས། མཐོ་ཤོས་གསུམ་པ་འདི་ བསམ་གྲུབ་ལྗོངས་མཁར་ལུ་ བརྒྱ་ཆ་ ༨༢ སྦེ་ཡོདཔ་ཨིན་པས། འདི་དང་འདྲཝ་སྦེ་ ཐིམ་ཕུག་ལུ་འབད་བ་ཅིན་ བརྒྱ་ཆ་ ༣༦.༡ ལས་མེདཔ་ལས་ ཁྱིམ་གྱི་ཐོ་བཀོད་དམའ་ཤོས་ཨིནམ་དང་ དེ་གི་ཤུལ་ལས་ སྤ་རོ་ལུ་ བརྒྱ་ཆ་ ༣༨.༤ སྦེ་ཡོདཔ་ཨིན་པས། ཁྲོམ་སྡེ་ཚུ་གི་གྲས་ལས་འབད་བ་ཅིན་ དགེ་ལེགས་ཕུག་ཁྲོམ་སྡེ་ནང་ བརྒྱ་ཆ་ ༢༤.༤ ཡོདཔ་ལས་བརྟེན་ ཁྱིམ་གྱི་ཇོ་བདག་མཐོ་ཤོས་ཡོད་མི་དང་ དམའ་ཤོས་དེ་ ཕུན་ཚོགས་གླིང་ལུ་བརྒྱ་ཆ་ ༨.༧ འབད་མི་དེ་ཨིན་པའི་གནས་ཚུལ།', 'ལན་གྱི་དཔེ།

ཁྱིམ་གྱི་ཇོ་བདག་དང་ ཁང་གླ།

རྒྱལ་ཡོངས་རྩིས་དཔྱད་བཀོད་འཛིན་གྱི་ སྙན་ཞུ་དང་འཁྲིལ་ འབྲུག་མི་ བརྒྱ་ཆ་ ༥༣.༢ དེ་ རང་གི་ཁྱིམ་ནང་ལུ་ དང་ བརྒྱ་ཆ་ ༤༦.༨ དེ་ ཁང་གླ་ཁར་ སྡོད་དོ་ཡོདཔ་ཨིན། གྲོང་གསེབ་ནང་ ཁྱིམ་གྱི་ཇོ་བདག་ བརྒྱ་ཆ་ ༧༥.༢ ཡོདཔ་ད་ ཁྲོམ་ཁར་ བརྒྱ་ཆ་ ༨༡.༨ དེ་ ཁང་གླ་ཁར་སྡོད་དོ་ཡོདཔ་ཨིན།

ཁྲོམ་ཁར་ ཁྱིམ་གྱི་གནས་གོང་མཐོ་དྲགས་ནི་དང་ ཉོ་ནིའི་གོ་སྐབས་ཉུང་སུ་ཡོད་ནི་ཚུ་ གདོང་ལེན་གཙོ་བོ་ཨིན། ཐིམ་ཕུག་ལུ་ མི་ཚུ་གིས་ རང་གི་འོང་འབབ་ལས་ བརྒྱ་ཆ་ ༣༠ ཁྱིམ་ལུ་ ཟད་འགྲོ་གཏང་དོ་ཡོདཔ་ད་ འཛམ་གླིང་གི་ཚད་གཞི་དང་འཁྲིལ་ འོང་འབབ་ལས་ བརྒྱ་ཆ་ ༣༠ ལས་བརྒལ་ ཁྱིམ་ལུ་ ཟད་མ་ཆོགཔ་ཨིན།

རྫོང་ཁག་ཚུ་ནང་ ལྷུན་རྩེ་ (བརྒྱ་ཆ་ ༨༤.༣) དང་ དར་དཀར་ (༨༤.༡) ལུ་ ཁྱིམ་གྱི་ཇོ་བདག་ མཐོ་ཤོས་ཡོདཔ་ད་ ཐིམ་ཕུག་ (༣༦.༡) དང་ སྤ་རོ་ (༣༨.༤) ལུ་ དམའ་ཤོས་ཨིན། ཁྲོམ་སྡེ་ཚུ་ནང་ དགེ་ལེགས་ཕུག་ (༢༤.༤) མཐོ་ཤོས་དང་ ཕུན་ཚོགས་གླིང་ (༨.༧) དམའ་ཤོས་ཨིན།', null, '[{"point": "གནད་དོན་གཙོ་བོ་ - ཁྱིམ་གྱི་ཇོ་བདག་ ༥༣.༢% དང་ ཁང་གླ་ ༤༦.༨%; གྲོང་གསེབ་ནང་ ཇོ་བདག་མང་། ཁྲོམ་ཁར་ ཁང་གླ་མང་།", "marks": 3}, {"point": "ཁྲོམ་ཁར་གདོང་ལེན་ (གནས་གོང་མཐོ་ དོ་བཟུམ་མེད།) ཐིམ་ཕུག་ལུ་ འོང་འབབ་ ༣༠% ཁྱིམ་ལུ་ཟད་ (ཚད་གཞི་ ༣༠%)", "marks": 3}, {"point": "རྫོང་ཁག་དང་ཁྲོམ་སྡེའི་ཁྱད་པར་ (ལྷུན་རྩེ་མཐོ་ཤོས། ཐིམ་ཕུག་དམའ་ཤོས།)", "marks": 2}, {"point": "ཚིག་འབྲུ་ ༢༠༠-༣༠༠། རང་གི་ཚིག་ཐོག་ལས་ བཅུད་བསྡུས་ཏེ།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'pr-cis'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper I (Dzongkha)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-I-Dzongkha.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'P1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 4.0, 1 from me_q where key = 'P1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 2.5, 2 from me_q where key = 'P1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 3.5, 3 from me_q where key = 'P1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'short_answer', 'a) སྐད་ཡིག་གི་དྲི་བ། འོག་ལུ་བཀོད་དེ་ཡོད་མི་ དྲི་བ་ག་རའི་ལན་བྲིས། (སྐུགས་ [༡×༥=༥])
༡༽ འབྲུག་གི་རྒྱལ་ཡོངས་ཀྱི་སྐད་ཡིག་འདི་ངོས་འཛིན་འབད་ཞིནམ་ལས་ གཞི་བཙུགས་མཛད་གནང་མི་ག་སོ།
༢༽ རྒྱལ་ཁབ་ནང་ རྒྱལ་ཡོངས་སྐད་ཡིག་དགོ་མི་འདི་ ག་ཅི་ལས་བརྟེན་ཨིན་ན? རྒྱུ་མཚན་ ༢ ཐོ་བཀོད་འབད།
༣༽ དབུ་སྐྲ་བསིལ། ཟེར་བའི་ཞེ་སའི་ཚིག་འདི་ ཕལ་ཚིག་ནང་ བསྒྱུར་ཏེ་ བྲིས།
༤༽ འོག་ལུ་ཡོད་པའི་ རྒྱན་སྡུད་ཀྱི་དཔེ་བརྗོད་ ༣ ལས་ མཐུན་པའི་རྒྱན་དང་ སྡུད་པའི་དཔེར་བརྗོད་གཉིསཔོ་འདི་ ངོས་འཛིན་འབད་དེ་ བྲིས།
   ཀ) ངོ་རིས་ལེགས་རུང་ སེམས་གོ་མི་ཆོད་པས།
   ཁ) ཁྱོད་ཡུང་ ད་རིས་གཡུས་ཁར་འོང་ནུག་སོ?
   ག) མེ་ཏོག་འདི་ འཇའ་རུ་འཇའ་བས།
༥༽ འོག་གི་ས་སྟོང་ནང་ འོས་འབབ་ཡོད་པའི་ མིང་གི་ཁྱད་ཚིག་བཙུགས་ཏེ་ རྗོད་ཚིག་ཆ་ཚངམ་སྦེ་ བཟོ།
   ཀ) ཚདཔ་ཚ་སྟེ་འབད་ར་མ་ཚུགས། ཆུ་................ཅིག་འཐུང་དགོ་མནོ་ཡི།
   ཁ) སང་ཐང་དགའ་ཏོག་ཏོ་ཅིག་ནང་ མེ་ཏོག་................སྦེ་ ཤར་ནུག། (5 marks)', 'a)
༡༽ མི་དབང་ འབྲུག་རྒྱལ་གསུམ་པ་ འཇིགས་མེད་རྡོ་རྗེ་དབང་ཕྱུག་མཆོག་གིས་ རྫོང་ཁ་འདི་ རྒྱལ་ཡོངས་ཀྱི་སྐད་ཡིག་སྦེ་ ངོས་འཛིན་མཛད་གནང་ཡི།
༢༽ རྒྱུ་མཚན། (ཀ) རྒྱལ་ཁབ་ཀྱི་ ངོ་རྐྱང་དང་ མི་སེར་ཚུ་གི་བར་ན་ མཐུན་སྒྲིལ་ཡར་དྲག་གཏང་ནི། (ཁ) གཞུང་གི་ལཱ་དང་ མི་སེར་ག་ར་གི་བར་ན་ འབྲེལ་བ་འཐབ་ནིའི་ སྐད་ཡིག་མཐུན་མོང་ཅིག་དགོཔ།
༣༽ སྐྲ་བཀྲུ།
༤༽ མཐུན་པའི་རྒྱན་ - ཀ) ངོ་རིས་ལེགས་རུང་ སེམས་གོ་མི་ཆོད་པས། སྡུད་པ་ - ཁ) ཁྱོད་ཡུང་ ད་རིས་གཡུས་ཁར་འོང་ནུག་སོ?
༥༽ ཀ) ཆུ་གྲང་མོ་ཅིག་ ཁ) མེ་ཏོག་ ཁ་ཕྱེ་སྟེ་ / ཧིང་སང་སང་སྦེ་', null, '[{"point": "༡ རྒྱལ་ཡོངས་སྐད་ཡིག་ངོས་འཛིན་ (རྒྱལ་པོ་གསུམ་པ་ འཇིགས་མེད་རྡོ་རྗེ་དབང་ཕྱུག་མཆོག); ༢ རྒྱུ་མཚན་ ༢ (རྒྱལ་ཡོངས་ངོ་རྐྱང་དང་ མཐུན་སྒྲིལ། གཞུང་གི་ལཱ་དང་ འབྲེལ་བ་འཐབ་ནི།); ༣ སྐྲ་བཀྲུ་; ༤ མཐུན་པའི་རྒྱན་ (ཀ) དང་ སྡུད་པ་ (ཁ); ༥ ཁྱད་ཚིག་འོས་འབབ་ (ཆུ་གྲང་མོ། མེ་ཏོག་ཁ་ཕྱེ་སྟེ / གསརཔ་སྦེ)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'language-and-spelling'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Part (a) item 4 (rgyan sdud examples) and the expected answers of part (b) need a Dzongkha teacher''s confirmation."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper I (Dzongkha)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-I-Dzongkha.pdf"}}'::jsonb, 'me-general-1-2025b1-g1', 1, null, null)
  returning id
)
insert into me_q select 'G1a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 2.0, 1 from me_q where key = 'G1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'G1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 2.0, 3 from me_q where key = 'G1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'short_answer', 'b) འོག་གི་ རྗོད་ཚིག་གི་ས་སྟོང་ནང་ བྱེད་འབྲེལ་ལས་ཚིག་དང་ བྱེད་མེད་ལས་ཚིག་གི་བ་ཚིག་གཉིས་ལས་ ག་འདི་འོས་འབབ་འདུག་ག་བཙུགས་ཏེ་ ས་སྟོང་སུབས། (སྐུགས་ [༡×༥=༥])
༡) ཐབ་ཁར་ཡོད་པའི་ ཇ་འདི་.........ད་ ཕབ་བཞག་གནང་། (བསྐོལ/འཁོལ)
༢) ཉི་མ་གིས་ ཧོད་ནང་ ཆུ་ལྟེམ་ལྟེམ་སྦེ་.........བཞག་ནུག། (བཀང་/གང་)
༣) ཚོདམ་.........རན་དོ། ལྟོ་བཟའ་སྦེ་སོང་། (བཙོ/ཚོ)
༤) བསོད་ནམས་ཀྱིས་ བར་ན་ དཀྲོགས་ཏེ་ རྨགཔ་དང་ཨམ་སྲུ་ ཁ་.........བཏང་ད་ནུག། (འཕྱལ/འབལ)
༥) བམ་གིས་ རྫུ་འཕྲུལ་བཏོན་ཏེ་ ཆརཔ་.........ད་ནུག། (གཅད/ཆད) (5 marks)', 'b)
༡) འཁོལ། ༢) བཀང་། ༣) ཚོ། ༤) འཕྱལ། ༥) བཅད།', null, '[{"point": "༡ འཁོལ། ༢ བཀང་། ༣ ཚོ། ༤ འཕྱལ། ༥ བཅད།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'language-and-spelling'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Part (a) item 4 (rgyan sdud examples) and the expected answers of part (b) need a Dzongkha teacher''s confirmation."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper I (Dzongkha)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-I-Dzongkha.pdf"}}'::jsonb, 'me-general-1-2025b1-g1', 2, null, null)
  returning id
)
insert into me_q select 'G1b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 2.0, 1 from me_q where key = 'G1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'G1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 2.0, 3 from me_q where key = 'G1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བའི་ལན་ བྲིས།

ཁྲག་ནང་ཞ་རྩི་ (lead) གི་གནས་ཚད་དང་འབྲེལ་བའི་རྒྱལ་ཡོངས་བརྟག་ཞིབ་སྙན་ཞུ།

རྒྱལ་ཡོངས་ཁྲག་གི་ ཞ་རྩི་གནས་ཚད་ཞིབ་འཇུག་གི་ ཆ་ཚང་སྙན་ཞུ་གིས་ དབྱེ་ཁག་ ༡༠ གྱི་ནང་ལས་ དཔེ་ཚད་ ༢༤༠༠ ལུ་གཞི་བཞག་སྟེ་དབྱེ་ཞིབ་འབདཝ་ད་ ཉིན་བསར་གྱི་ཅ་ཆས་ཚུ་ནང་ ཞ་རྩི་གི་བཙོག་པ་ ཁྱབ་ཆེཝ་སྦེ་ ཁྱབ་སྤེལ་སོང་སྟེ་ཡོདཔ་ལས་ དམིགས་བསལ་གྱིས་ ཨ་ལུ་ཚུ་ལུ་ མི་མང་གསོ་བའི་ཉེན་ཁ་སྦོམ་སྦེ་ར་ འབྱུང་དོ་ཡོདཔ་སྦེ་ གསལ་སྟོན་འབད་ནུག། བརྟག་ཞིབ་འདི་གིས་ བྱིན་རབས་དང་ ཆོས་དོན་གྱི་ཅ་ཆས་ ཐབ་ཚང་གི་ཅ་ཆས་ ཁྱིམ་གྱི་ཅ་ཆས་ རྩེད་ཆས་ སློབ་གྲྭའི་ཅ་ཆས་ ས་དང་ཚོས་གཞི་ དེ་ལས་ མཛེས་ཆས་ཚུ་ བརྟག་དཔྱད་འབད་བའི་སྐབས་ ཟ་སྤྱོད་འབད་བཏུབ་མི་དང་མ་བཏུབ་པའི་ ཐོན་སྐྱེད་གཉིས་ཆ་རའི་ནང་ ལྕགས་རས་ཀྱི་ གནས་ཚད་འདི་ ཉེན་ཁ་ཅན་ཅིག་སྦེ་ མཐོང་ཡོདཔ་ཨིན།

ཞ་རྩི་འདི་ དམིགས་བསལ་གྱིས་ ཨ་ལུ་ཚུ་ལུ་ཉེན་ཁ་སྦོམ་སྦེ་ཡོདཔ་ཨིན་མས། དེ་ཡང་ ལྕགས་རས་འདི་ རྒས་ཤོས་ཚུ་དང་ཕྱདཔ་ད་ ཨ་ལུ་ཚུ་ལུ་ གཟུགས་ནང་སིམ་ནིའི་ནུས་པ་ ཚར་ ༤ ལས་ ༥ གི་བར་ན་ མཐོ་དྲགས་སྦེ་ཡོདཔ་ལས་ འདི་གིས་ རྩ་ཁམས་དང་སྤྱོད་ལམ། ཀླདཔ་དང་ རིག་སྟོབས་ཚུ་ལུ་གནོད་སྐྱོན་རྐྱབ་དོ་ཡོདཔ་ཨིན་མས། དེ་མ་ཚད་ ཁྲག་མར་ཕབ་འགྱོ་ནིའི་ནད་གཞི་འཐོབ་ནི་དང་ མཆིནམ་ལུ་ཡང་ གནོད་སྐྱོན་ཕོགཔ་སྦེ་ཨིན་མས། འཛམ་གླིང་གསོ་བའི་ལས་ཚོགས་ཀྱིས་ ཁྲག་ནང་ཞ་རྩི་གི་གནས་ཚད་ ཨ་ཙི་ལས་མེད་རུང་ ཉེན་སྲུང་མེདཔ་སྦེ་བཤདཔ་ཨིན་མས།

ཞིབ་འཇུག་འདི་ནང་ མཐོང་གསལ་ཆེ་ཤོས་ཅིག་འདི་ བྱིན་རབས་དང་དམ་རས་ཀྱི་རིགས་ནང་ ཞ་རྩི་མཐོ་དྲགས་སྦེ་ཐོན་ཡོད་མི་འདི་ཨིན་མས། དེ་ཡང་ བྱིན་རབས་དམ་རས་ཀྱི་དཔེ་ཚད་ ༧༦༧ བརྟག་དཔྱད་འབད་བའི་སྐབས་ བརྒྱ་ཆ་ ༤༤.༢ གིས་ གཞི་བཞག་ཚད་གཞི་ལས་བརྒལ་ཡོདཔ་ཨིན་མས། ཞིབ་འཇུག་འདི་གིས་ བྱིན་རབས་དམ་རས་ཟ་སྤྱོད་འབད་མི་དང་ ཨ་ལུ་ཚུ་གི་ཁྲག་ནང་ ཞ་རྩི་གི་གནས་ཚད་ཡར་སེང་འགྱོ་མི་ཚུ་གི་བར་ན་ འབྲེལ་བ་ཡོདཔ་སྦེ་ མཐོང་ཡོདཔ་ཨིན་མས། དེ་ཡང་ བྱིན་རབས་ཟ་མི་ ཨ་ལུ་ཚུ་གི་གྲས་ལས་ བརྒྱ་ཆ་ ༧༨ ལུ་ ཞ་རྩི་གི་གནས་ཚད་མཐོ་དྲགས་སྦེ་མངོན་གསལ་བྱུང་ཡོདཔ་མ་ཚད་ འདས་པའི་ཉིནམ་ ༡༥ གི་ནང་འཁོད་ལུ་ བྱིན་རབས་ཟ་མི་ ཨ་ལུ་ཚུ་ནང་ བརྒྱ་ཆ་ ༨༤ གིས་ མཐོ་དྲགས་སྦེ་འཐོན་ཡོདཔ་སྦེ་ གསལ་སྟོན་བྱུང་ནུག། ཆོས་དང་འབྲེལ་བའི་ཅ་ཆས་ སྤོས་ཕོར་དང་དཀར་མེ་གཏིང་ལ་སོགས་པ་ཚུ་ནང་ཡང་ ཞ་རྩི་མཐོ་དྲགས་སྦེ་ཡོདཔ་ཨིན་མས།

ཉིན་ལྟར་གྱི་མི་ཚེ་ནང་ལུ་ གལ་ཆེ་ཤོས་ཅིག་ཨིན་མི་ ཐབ་ཚང་གི་ཅ་ཆས་དང་ བཞེས་སྒོའི་རས་སོར་ཚུ་ཡང་ ཞ་རྩི་གི་ འབྱུང་ཁུངས་གཙོ་བོ་ཅིག་ཨིན་མས། བརྟག་དཔྱད་འབད་ཡོད་པའི་ ཐབ་ཚང་གི་ཅ་ཆས་ ༦༦༥ ལས་ བརྒྱ་ཆ་ ༢༡.༥ ལུ་ཚད་གཞི་ལས་བརྒལ་ཡོདཔ་དང་ ཟངས་དང་ལྕགས་ཀྱི་ཐ་ལི། དེ་ལས་ འཐུང་ཆུ་གི་ཕོརཔ་ཚུ་ནང་ ཞ་རྩི་གི་གནས་ཚད་ མཐོ་དྲགས་ཡོདཔ་སྦེ་ ངོས་འཛིན་བྱུང་ཡོདཔ་ཨིན་པས། ཨེ་ཕྱེ་དཔྱ་བཞི་དང་ ཡུང་བ་དཔྱ་གསུམ་ནང་ ཚད་གཞི་ལས་ལྷག་པའི་ཞ་རྩི་ཡོདཔ་ཨིན་པས།

ས་ཆའི་དཔེ་ཚད་ ༦༠ ལས་ བརྒྱ་ཆ་ ༣.༣ གྱིས་ ཚད་གཞི་ལས་བརྒལ་ཡོདཔ་ཨིནམ་དང་ ཚོན་གྱི་རིགས་ནང་ བཙོག་པ་ཉུང་སུ་སྦེ་འཐོན་ཡོདཔ་ད། དེ་ཡང་ དཔེ་ཚད་ ༡༢༧ ལས་ བརྒྱ་ཆ་ ༠.༨ རྐྱངམ་གཅིག་ཡོདཔ་ཨིན་མས། མཛེས་ཆའི་རིགས་ཚུ་ དཔེ་ཚད་ ༡༤ གི་ནང་ལས་ བརྒྱ་ཆ་ ༡༤.༣ དེ་ཅིག་གིས་ ཚད་གཞི་ལས་ལྷག་སྟེ་ཡོདཔ་ཨིན་མས།

༡༽ ཅ་ལ་དང་དངོས་པོ་ཚུ་ལས་ ཞ་རྩི་བརྒྱ་ཆ་ཉུང་ཤོས་ཡོད་མི་ ༡ དང་ མཐོ་ཤོས་ཡོད་པའི་རིགས་ ༢ ཐོ་བཀོད་འབད། (སྐུགས་ ༣)', 'ཞ་རྩི་ཉུང་ཤོས་ཡོད་མི་ - ཚོན་གྱི་རིགས་ (དཔེ་ཚད་ ༡༢༧ ལས་ བརྒྱ་ཆ་ ༠.༨ རྐྱངམ་གཅིག)། མཐོ་ཤོས་ཡོད་མི་ - བྱིན་རབས་དམ་རས་ (བརྒྱ་ཆ་ ༤༤.༢) དང་ ཐབ་ཚང་གི་ཅ་ཆས་ (བརྒྱ་ཆ་ ༢༡.༥)།', null, '[{"point": "ཉུང་ཤོས་ - ཚོན་གྱི་རིགས་ (བརྒྱ་ཆ་ ༠.༨)། མཐོ་ཤོས་ - བྱིན་རབས་དམ་རས་ (བརྒྱ་ཆ་ ༤༤.༢) དང་ ཐབ་ཚང་གི་ཅ་ཆས་ (བརྒྱ་ཆ་ ༢༡.༥) ཡང་ན་ མཛེས་ཆས་ (བརྒྱ་ཆ་ ༡༤.༣)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper I (Dzongkha)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-I-Dzongkha.pdf"}}'::jsonb, 'me-general-1-2025b1-c1', 1, null, null)
  returning id
)
insert into me_q select 'C1a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བའི་ལན་ བྲིས།

ཁྲག་ནང་ཞ་རྩི་ (lead) གི་གནས་ཚད་དང་འབྲེལ་བའི་རྒྱལ་ཡོངས་བརྟག་ཞིབ་སྙན་ཞུ།

རྒྱལ་ཡོངས་ཁྲག་གི་ ཞ་རྩི་གནས་ཚད་ཞིབ་འཇུག་གི་ ཆ་ཚང་སྙན་ཞུ་གིས་ དབྱེ་ཁག་ ༡༠ གྱི་ནང་ལས་ དཔེ་ཚད་ ༢༤༠༠ ལུ་གཞི་བཞག་སྟེ་དབྱེ་ཞིབ་འབདཝ་ད་ ཉིན་བསར་གྱི་ཅ་ཆས་ཚུ་ནང་ ཞ་རྩི་གི་བཙོག་པ་ ཁྱབ་ཆེཝ་སྦེ་ ཁྱབ་སྤེལ་སོང་སྟེ་ཡོདཔ་ལས་ དམིགས་བསལ་གྱིས་ ཨ་ལུ་ཚུ་ལུ་ མི་མང་གསོ་བའི་ཉེན་ཁ་སྦོམ་སྦེ་ར་ འབྱུང་དོ་ཡོདཔ་སྦེ་ གསལ་སྟོན་འབད་ནུག། བརྟག་ཞིབ་འདི་གིས་ བྱིན་རབས་དང་ ཆོས་དོན་གྱི་ཅ་ཆས་ ཐབ་ཚང་གི་ཅ་ཆས་ ཁྱིམ་གྱི་ཅ་ཆས་ རྩེད་ཆས་ སློབ་གྲྭའི་ཅ་ཆས་ ས་དང་ཚོས་གཞི་ དེ་ལས་ མཛེས་ཆས་ཚུ་ བརྟག་དཔྱད་འབད་བའི་སྐབས་ ཟ་སྤྱོད་འབད་བཏུབ་མི་དང་མ་བཏུབ་པའི་ ཐོན་སྐྱེད་གཉིས་ཆ་རའི་ནང་ ལྕགས་རས་ཀྱི་ གནས་ཚད་འདི་ ཉེན་ཁ་ཅན་ཅིག་སྦེ་ མཐོང་ཡོདཔ་ཨིན།

ཞ་རྩི་འདི་ དམིགས་བསལ་གྱིས་ ཨ་ལུ་ཚུ་ལུ་ཉེན་ཁ་སྦོམ་སྦེ་ཡོདཔ་ཨིན་མས། དེ་ཡང་ ལྕགས་རས་འདི་ རྒས་ཤོས་ཚུ་དང་ཕྱདཔ་ད་ ཨ་ལུ་ཚུ་ལུ་ གཟུགས་ནང་སིམ་ནིའི་ནུས་པ་ ཚར་ ༤ ལས་ ༥ གི་བར་ན་ མཐོ་དྲགས་སྦེ་ཡོདཔ་ལས་ འདི་གིས་ རྩ་ཁམས་དང་སྤྱོད་ལམ། ཀླདཔ་དང་ རིག་སྟོབས་ཚུ་ལུ་གནོད་སྐྱོན་རྐྱབ་དོ་ཡོདཔ་ཨིན་མས། དེ་མ་ཚད་ ཁྲག་མར་ཕབ་འགྱོ་ནིའི་ནད་གཞི་འཐོབ་ནི་དང་ མཆིནམ་ལུ་ཡང་ གནོད་སྐྱོན་ཕོགཔ་སྦེ་ཨིན་མས། འཛམ་གླིང་གསོ་བའི་ལས་ཚོགས་ཀྱིས་ ཁྲག་ནང་ཞ་རྩི་གི་གནས་ཚད་ ཨ་ཙི་ལས་མེད་རུང་ ཉེན་སྲུང་མེདཔ་སྦེ་བཤདཔ་ཨིན་མས།

ཞིབ་འཇུག་འདི་ནང་ མཐོང་གསལ་ཆེ་ཤོས་ཅིག་འདི་ བྱིན་རབས་དང་དམ་རས་ཀྱི་རིགས་ནང་ ཞ་རྩི་མཐོ་དྲགས་སྦེ་ཐོན་ཡོད་མི་འདི་ཨིན་མས། དེ་ཡང་ བྱིན་རབས་དམ་རས་ཀྱི་དཔེ་ཚད་ ༧༦༧ བརྟག་དཔྱད་འབད་བའི་སྐབས་ བརྒྱ་ཆ་ ༤༤.༢ གིས་ གཞི་བཞག་ཚད་གཞི་ལས་བརྒལ་ཡོདཔ་ཨིན་མས། ཞིབ་འཇུག་འདི་གིས་ བྱིན་རབས་དམ་རས་ཟ་སྤྱོད་འབད་མི་དང་ ཨ་ལུ་ཚུ་གི་ཁྲག་ནང་ ཞ་རྩི་གི་གནས་ཚད་ཡར་སེང་འགྱོ་མི་ཚུ་གི་བར་ན་ འབྲེལ་བ་ཡོདཔ་སྦེ་ མཐོང་ཡོདཔ་ཨིན་མས། དེ་ཡང་ བྱིན་རབས་ཟ་མི་ ཨ་ལུ་ཚུ་གི་གྲས་ལས་ བརྒྱ་ཆ་ ༧༨ ལུ་ ཞ་རྩི་གི་གནས་ཚད་མཐོ་དྲགས་སྦེ་མངོན་གསལ་བྱུང་ཡོདཔ་མ་ཚད་ འདས་པའི་ཉིནམ་ ༡༥ གི་ནང་འཁོད་ལུ་ བྱིན་རབས་ཟ་མི་ ཨ་ལུ་ཚུ་ནང་ བརྒྱ་ཆ་ ༨༤ གིས་ མཐོ་དྲགས་སྦེ་འཐོན་ཡོདཔ་སྦེ་ གསལ་སྟོན་བྱུང་ནུག། ཆོས་དང་འབྲེལ་བའི་ཅ་ཆས་ སྤོས་ཕོར་དང་དཀར་མེ་གཏིང་ལ་སོགས་པ་ཚུ་ནང་ཡང་ ཞ་རྩི་མཐོ་དྲགས་སྦེ་ཡོདཔ་ཨིན་མས།

ཉིན་ལྟར་གྱི་མི་ཚེ་ནང་ལུ་ གལ་ཆེ་ཤོས་ཅིག་ཨིན་མི་ ཐབ་ཚང་གི་ཅ་ཆས་དང་ བཞེས་སྒོའི་རས་སོར་ཚུ་ཡང་ ཞ་རྩི་གི་ འབྱུང་ཁུངས་གཙོ་བོ་ཅིག་ཨིན་མས། བརྟག་དཔྱད་འབད་ཡོད་པའི་ ཐབ་ཚང་གི་ཅ་ཆས་ ༦༦༥ ལས་ བརྒྱ་ཆ་ ༢༡.༥ ལུ་ཚད་གཞི་ལས་བརྒལ་ཡོདཔ་དང་ ཟངས་དང་ལྕགས་ཀྱི་ཐ་ལི། དེ་ལས་ འཐུང་ཆུ་གི་ཕོརཔ་ཚུ་ནང་ ཞ་རྩི་གི་གནས་ཚད་ མཐོ་དྲགས་ཡོདཔ་སྦེ་ ངོས་འཛིན་བྱུང་ཡོདཔ་ཨིན་པས། ཨེ་ཕྱེ་དཔྱ་བཞི་དང་ ཡུང་བ་དཔྱ་གསུམ་ནང་ ཚད་གཞི་ལས་ལྷག་པའི་ཞ་རྩི་ཡོདཔ་ཨིན་པས།

ས་ཆའི་དཔེ་ཚད་ ༦༠ ལས་ བརྒྱ་ཆ་ ༣.༣ གྱིས་ ཚད་གཞི་ལས་བརྒལ་ཡོདཔ་ཨིནམ་དང་ ཚོན་གྱི་རིགས་ནང་ བཙོག་པ་ཉུང་སུ་སྦེ་འཐོན་ཡོདཔ་ད། དེ་ཡང་ དཔེ་ཚད་ ༡༢༧ ལས་ བརྒྱ་ཆ་ ༠.༨ རྐྱངམ་གཅིག་ཡོདཔ་ཨིན་མས། མཛེས་ཆའི་རིགས་ཚུ་ དཔེ་ཚད་ ༡༤ གི་ནང་ལས་ བརྒྱ་ཆ་ ༡༤.༣ དེ་ཅིག་གིས་ ཚད་གཞི་ལས་ལྷག་སྟེ་ཡོདཔ་ཨིན་མས།

༢༽ བྱིན་རབས་ཟ་མི་ཨ་ལུ་དང་ ཁྲག་ནང་ཞ་རྩི་ཡར་སེང་འགྱོ་མི་གཉིས་ལུ་ འབྲེལ་བ་ཡོད་པའི་ སྒྲུབ་བྱེད་ག་དེ་སྦེ་བཀོད་ནུག? (སྐུགས་ ༣)', 'བྱིན་རབས་ཟ་མི་ ཨ་ལུ་ཚུ་ལས་ བརྒྱ་ཆ་ ༧༨ ལུ་ ཁྲག་ནང་ཞ་རྩི་ མཐོ་དྲགས་སྦེ་ཐོན་ཡོདཔ་དང་ འདས་པའི་ཉིནམ་ ༡༥ གི་ནང་འཁོད་ལུ་ བྱིན་རབས་ཟ་མི་ ཨ་ལུ་ཚུ་ནང་ བརྒྱ་ཆ་ ༨༤ གིས་ མཐོ་དྲགས་སྦེ་ཐོན་ཡོདཔ་ཨིན།', null, '[{"point": "བྱིན་རབས་ཟ་མི་ཨ་ལུ་ཚུ་ལས་ བརྒྱ་ཆ་ ༧༨ ལུ་ ཞ་རྩི་མཐོ་དྲགས། འདས་པའི་ཉིནམ་ ༡༥ ནང་ ཟ་མི་ཚུ་ནང་ བརྒྱ་ཆ་ ༨༤ མཐོ་དྲགས།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper I (Dzongkha)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-I-Dzongkha.pdf"}}'::jsonb, 'me-general-1-2025b1-c1', 2, null, null)
  returning id
)
insert into me_q select 'C1b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བའི་ལན་ བྲིས།

ཁྲག་ནང་ཞ་རྩི་ (lead) གི་གནས་ཚད་དང་འབྲེལ་བའི་རྒྱལ་ཡོངས་བརྟག་ཞིབ་སྙན་ཞུ།

རྒྱལ་ཡོངས་ཁྲག་གི་ ཞ་རྩི་གནས་ཚད་ཞིབ་འཇུག་གི་ ཆ་ཚང་སྙན་ཞུ་གིས་ དབྱེ་ཁག་ ༡༠ གྱི་ནང་ལས་ དཔེ་ཚད་ ༢༤༠༠ ལུ་གཞི་བཞག་སྟེ་དབྱེ་ཞིབ་འབདཝ་ད་ ཉིན་བསར་གྱི་ཅ་ཆས་ཚུ་ནང་ ཞ་རྩི་གི་བཙོག་པ་ ཁྱབ་ཆེཝ་སྦེ་ ཁྱབ་སྤེལ་སོང་སྟེ་ཡོདཔ་ལས་ དམིགས་བསལ་གྱིས་ ཨ་ལུ་ཚུ་ལུ་ མི་མང་གསོ་བའི་ཉེན་ཁ་སྦོམ་སྦེ་ར་ འབྱུང་དོ་ཡོདཔ་སྦེ་ གསལ་སྟོན་འབད་ནུག། བརྟག་ཞིབ་འདི་གིས་ བྱིན་རབས་དང་ ཆོས་དོན་གྱི་ཅ་ཆས་ ཐབ་ཚང་གི་ཅ་ཆས་ ཁྱིམ་གྱི་ཅ་ཆས་ རྩེད་ཆས་ སློབ་གྲྭའི་ཅ་ཆས་ ས་དང་ཚོས་གཞི་ དེ་ལས་ མཛེས་ཆས་ཚུ་ བརྟག་དཔྱད་འབད་བའི་སྐབས་ ཟ་སྤྱོད་འབད་བཏུབ་མི་དང་མ་བཏུབ་པའི་ ཐོན་སྐྱེད་གཉིས་ཆ་རའི་ནང་ ལྕགས་རས་ཀྱི་ གནས་ཚད་འདི་ ཉེན་ཁ་ཅན་ཅིག་སྦེ་ མཐོང་ཡོདཔ་ཨིན།

ཞ་རྩི་འདི་ དམིགས་བསལ་གྱིས་ ཨ་ལུ་ཚུ་ལུ་ཉེན་ཁ་སྦོམ་སྦེ་ཡོདཔ་ཨིན་མས། དེ་ཡང་ ལྕགས་རས་འདི་ རྒས་ཤོས་ཚུ་དང་ཕྱདཔ་ད་ ཨ་ལུ་ཚུ་ལུ་ གཟུགས་ནང་སིམ་ནིའི་ནུས་པ་ ཚར་ ༤ ལས་ ༥ གི་བར་ན་ མཐོ་དྲགས་སྦེ་ཡོདཔ་ལས་ འདི་གིས་ རྩ་ཁམས་དང་སྤྱོད་ལམ། ཀླདཔ་དང་ རིག་སྟོབས་ཚུ་ལུ་གནོད་སྐྱོན་རྐྱབ་དོ་ཡོདཔ་ཨིན་མས། དེ་མ་ཚད་ ཁྲག་མར་ཕབ་འགྱོ་ནིའི་ནད་གཞི་འཐོབ་ནི་དང་ མཆིནམ་ལུ་ཡང་ གནོད་སྐྱོན་ཕོགཔ་སྦེ་ཨིན་མས། འཛམ་གླིང་གསོ་བའི་ལས་ཚོགས་ཀྱིས་ ཁྲག་ནང་ཞ་རྩི་གི་གནས་ཚད་ ཨ་ཙི་ལས་མེད་རུང་ ཉེན་སྲུང་མེདཔ་སྦེ་བཤདཔ་ཨིན་མས།

ཞིབ་འཇུག་འདི་ནང་ མཐོང་གསལ་ཆེ་ཤོས་ཅིག་འདི་ བྱིན་རབས་དང་དམ་རས་ཀྱི་རིགས་ནང་ ཞ་རྩི་མཐོ་དྲགས་སྦེ་ཐོན་ཡོད་མི་འདི་ཨིན་མས། དེ་ཡང་ བྱིན་རབས་དམ་རས་ཀྱི་དཔེ་ཚད་ ༧༦༧ བརྟག་དཔྱད་འབད་བའི་སྐབས་ བརྒྱ་ཆ་ ༤༤.༢ གིས་ གཞི་བཞག་ཚད་གཞི་ལས་བརྒལ་ཡོདཔ་ཨིན་མས། ཞིབ་འཇུག་འདི་གིས་ བྱིན་རབས་དམ་རས་ཟ་སྤྱོད་འབད་མི་དང་ ཨ་ལུ་ཚུ་གི་ཁྲག་ནང་ ཞ་རྩི་གི་གནས་ཚད་ཡར་སེང་འགྱོ་མི་ཚུ་གི་བར་ན་ འབྲེལ་བ་ཡོདཔ་སྦེ་ མཐོང་ཡོདཔ་ཨིན་མས། དེ་ཡང་ བྱིན་རབས་ཟ་མི་ ཨ་ལུ་ཚུ་གི་གྲས་ལས་ བརྒྱ་ཆ་ ༧༨ ལུ་ ཞ་རྩི་གི་གནས་ཚད་མཐོ་དྲགས་སྦེ་མངོན་གསལ་བྱུང་ཡོདཔ་མ་ཚད་ འདས་པའི་ཉིནམ་ ༡༥ གི་ནང་འཁོད་ལུ་ བྱིན་རབས་ཟ་མི་ ཨ་ལུ་ཚུ་ནང་ བརྒྱ་ཆ་ ༨༤ གིས་ མཐོ་དྲགས་སྦེ་འཐོན་ཡོདཔ་སྦེ་ གསལ་སྟོན་བྱུང་ནུག། ཆོས་དང་འབྲེལ་བའི་ཅ་ཆས་ སྤོས་ཕོར་དང་དཀར་མེ་གཏིང་ལ་སོགས་པ་ཚུ་ནང་ཡང་ ཞ་རྩི་མཐོ་དྲགས་སྦེ་ཡོདཔ་ཨིན་མས།

ཉིན་ལྟར་གྱི་མི་ཚེ་ནང་ལུ་ གལ་ཆེ་ཤོས་ཅིག་ཨིན་མི་ ཐབ་ཚང་གི་ཅ་ཆས་དང་ བཞེས་སྒོའི་རས་སོར་ཚུ་ཡང་ ཞ་རྩི་གི་ འབྱུང་ཁུངས་གཙོ་བོ་ཅིག་ཨིན་མས། བརྟག་དཔྱད་འབད་ཡོད་པའི་ ཐབ་ཚང་གི་ཅ་ཆས་ ༦༦༥ ལས་ བརྒྱ་ཆ་ ༢༡.༥ ལུ་ཚད་གཞི་ལས་བརྒལ་ཡོདཔ་དང་ ཟངས་དང་ལྕགས་ཀྱི་ཐ་ལི། དེ་ལས་ འཐུང་ཆུ་གི་ཕོརཔ་ཚུ་ནང་ ཞ་རྩི་གི་གནས་ཚད་ མཐོ་དྲགས་ཡོདཔ་སྦེ་ ངོས་འཛིན་བྱུང་ཡོདཔ་ཨིན་པས། ཨེ་ཕྱེ་དཔྱ་བཞི་དང་ ཡུང་བ་དཔྱ་གསུམ་ནང་ ཚད་གཞི་ལས་ལྷག་པའི་ཞ་རྩི་ཡོདཔ་ཨིན་པས།

ས་ཆའི་དཔེ་ཚད་ ༦༠ ལས་ བརྒྱ་ཆ་ ༣.༣ གྱིས་ ཚད་གཞི་ལས་བརྒལ་ཡོདཔ་ཨིནམ་དང་ ཚོན་གྱི་རིགས་ནང་ བཙོག་པ་ཉུང་སུ་སྦེ་འཐོན་ཡོདཔ་ད། དེ་ཡང་ དཔེ་ཚད་ ༡༢༧ ལས་ བརྒྱ་ཆ་ ༠.༨ རྐྱངམ་གཅིག་ཡོདཔ་ཨིན་མས། མཛེས་ཆའི་རིགས་ཚུ་ དཔེ་ཚད་ ༡༤ གི་ནང་ལས་ བརྒྱ་ཆ་ ༡༤.༣ དེ་ཅིག་གིས་ ཚད་གཞི་ལས་ལྷག་སྟེ་ཡོདཔ་ཨིན་མས།

༣༽ ཞ་རྩི་འདི་ དམིགས་བསལ་གྱིས་ ཨ་ལུ་ཚུ་ལུ་ གནོད་སྐྱོན་ཆེ་དགོ་མི་འདི་ ག་ཅི་ལས་བརྟེན་ཨིན་ན? (སྐུགས་ ༣)', 'ཨ་ལུ་ཚུ་གི་གཟུགས་ནང་ ཞ་རྩི་སིམ་ནིའི་ནུས་པ་འདི་ རྒས་ཤོས་ཚུ་དང་ཕྱདཔ་ད་ ཚར་ ༤ ལས་ ༥ གི་བར་ན་ མཐོ་ཡོདཔ་ལས་ རྩ་ཁམས་ ཀླདཔ་དང་ རིག་སྟོབས་ཀྱི་གོང་འཕེལ་ལུ་ གནོད་སྐྱོན་ཆེཝ་ཨིན།', null, '[{"point": "ཨ་ལུ་ཚུ་གི་གཟུགས་ནང་ ཞ་རྩི་སིམ་ནིའི་ནུས་པ་ རྒས་ཤོས་ཚུ་ལས་ ཚར་ ༤-༥ མཐོ་ཡོདཔ། རྩ་ཁམས་ ཀླདཔ་ རིག་སྟོབས་ལུ་གནོད།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper I (Dzongkha)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-I-Dzongkha.pdf"}}'::jsonb, 'me-general-1-2025b1-c1', 3, null, null)
  returning id
)
insert into me_q select 'C1c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C1c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བའི་ལན་ བྲིས།

ཁྲག་ནང་ཞ་རྩི་ (lead) གི་གནས་ཚད་དང་འབྲེལ་བའི་རྒྱལ་ཡོངས་བརྟག་ཞིབ་སྙན་ཞུ།

རྒྱལ་ཡོངས་ཁྲག་གི་ ཞ་རྩི་གནས་ཚད་ཞིབ་འཇུག་གི་ ཆ་ཚང་སྙན་ཞུ་གིས་ དབྱེ་ཁག་ ༡༠ གྱི་ནང་ལས་ དཔེ་ཚད་ ༢༤༠༠ ལུ་གཞི་བཞག་སྟེ་དབྱེ་ཞིབ་འབདཝ་ད་ ཉིན་བསར་གྱི་ཅ་ཆས་ཚུ་ནང་ ཞ་རྩི་གི་བཙོག་པ་ ཁྱབ་ཆེཝ་སྦེ་ ཁྱབ་སྤེལ་སོང་སྟེ་ཡོདཔ་ལས་ དམིགས་བསལ་གྱིས་ ཨ་ལུ་ཚུ་ལུ་ མི་མང་གསོ་བའི་ཉེན་ཁ་སྦོམ་སྦེ་ར་ འབྱུང་དོ་ཡོདཔ་སྦེ་ གསལ་སྟོན་འབད་ནུག། བརྟག་ཞིབ་འདི་གིས་ བྱིན་རབས་དང་ ཆོས་དོན་གྱི་ཅ་ཆས་ ཐབ་ཚང་གི་ཅ་ཆས་ ཁྱིམ་གྱི་ཅ་ཆས་ རྩེད་ཆས་ སློབ་གྲྭའི་ཅ་ཆས་ ས་དང་ཚོས་གཞི་ དེ་ལས་ མཛེས་ཆས་ཚུ་ བརྟག་དཔྱད་འབད་བའི་སྐབས་ ཟ་སྤྱོད་འབད་བཏུབ་མི་དང་མ་བཏུབ་པའི་ ཐོན་སྐྱེད་གཉིས་ཆ་རའི་ནང་ ལྕགས་རས་ཀྱི་ གནས་ཚད་འདི་ ཉེན་ཁ་ཅན་ཅིག་སྦེ་ མཐོང་ཡོདཔ་ཨིན།

ཞ་རྩི་འདི་ དམིགས་བསལ་གྱིས་ ཨ་ལུ་ཚུ་ལུ་ཉེན་ཁ་སྦོམ་སྦེ་ཡོདཔ་ཨིན་མས། དེ་ཡང་ ལྕགས་རས་འདི་ རྒས་ཤོས་ཚུ་དང་ཕྱདཔ་ད་ ཨ་ལུ་ཚུ་ལུ་ གཟུགས་ནང་སིམ་ནིའི་ནུས་པ་ ཚར་ ༤ ལས་ ༥ གི་བར་ན་ མཐོ་དྲགས་སྦེ་ཡོདཔ་ལས་ འདི་གིས་ རྩ་ཁམས་དང་སྤྱོད་ལམ། ཀླདཔ་དང་ རིག་སྟོབས་ཚུ་ལུ་གནོད་སྐྱོན་རྐྱབ་དོ་ཡོདཔ་ཨིན་མས། དེ་མ་ཚད་ ཁྲག་མར་ཕབ་འགྱོ་ནིའི་ནད་གཞི་འཐོབ་ནི་དང་ མཆིནམ་ལུ་ཡང་ གནོད་སྐྱོན་ཕོགཔ་སྦེ་ཨིན་མས། འཛམ་གླིང་གསོ་བའི་ལས་ཚོགས་ཀྱིས་ ཁྲག་ནང་ཞ་རྩི་གི་གནས་ཚད་ ཨ་ཙི་ལས་མེད་རུང་ ཉེན་སྲུང་མེདཔ་སྦེ་བཤདཔ་ཨིན་མས།

ཞིབ་འཇུག་འདི་ནང་ མཐོང་གསལ་ཆེ་ཤོས་ཅིག་འདི་ བྱིན་རབས་དང་དམ་རས་ཀྱི་རིགས་ནང་ ཞ་རྩི་མཐོ་དྲགས་སྦེ་ཐོན་ཡོད་མི་འདི་ཨིན་མས། དེ་ཡང་ བྱིན་རབས་དམ་རས་ཀྱི་དཔེ་ཚད་ ༧༦༧ བརྟག་དཔྱད་འབད་བའི་སྐབས་ བརྒྱ་ཆ་ ༤༤.༢ གིས་ གཞི་བཞག་ཚད་གཞི་ལས་བརྒལ་ཡོདཔ་ཨིན་མས། ཞིབ་འཇུག་འདི་གིས་ བྱིན་རབས་དམ་རས་ཟ་སྤྱོད་འབད་མི་དང་ ཨ་ལུ་ཚུ་གི་ཁྲག་ནང་ ཞ་རྩི་གི་གནས་ཚད་ཡར་སེང་འགྱོ་མི་ཚུ་གི་བར་ན་ འབྲེལ་བ་ཡོདཔ་སྦེ་ མཐོང་ཡོདཔ་ཨིན་མས། དེ་ཡང་ བྱིན་རབས་ཟ་མི་ ཨ་ལུ་ཚུ་གི་གྲས་ལས་ བརྒྱ་ཆ་ ༧༨ ལུ་ ཞ་རྩི་གི་གནས་ཚད་མཐོ་དྲགས་སྦེ་མངོན་གསལ་བྱུང་ཡོདཔ་མ་ཚད་ འདས་པའི་ཉིནམ་ ༡༥ གི་ནང་འཁོད་ལུ་ བྱིན་རབས་ཟ་མི་ ཨ་ལུ་ཚུ་ནང་ བརྒྱ་ཆ་ ༨༤ གིས་ མཐོ་དྲགས་སྦེ་འཐོན་ཡོདཔ་སྦེ་ གསལ་སྟོན་བྱུང་ནུག། ཆོས་དང་འབྲེལ་བའི་ཅ་ཆས་ སྤོས་ཕོར་དང་དཀར་མེ་གཏིང་ལ་སོགས་པ་ཚུ་ནང་ཡང་ ཞ་རྩི་མཐོ་དྲགས་སྦེ་ཡོདཔ་ཨིན་མས།

ཉིན་ལྟར་གྱི་མི་ཚེ་ནང་ལུ་ གལ་ཆེ་ཤོས་ཅིག་ཨིན་མི་ ཐབ་ཚང་གི་ཅ་ཆས་དང་ བཞེས་སྒོའི་རས་སོར་ཚུ་ཡང་ ཞ་རྩི་གི་ འབྱུང་ཁུངས་གཙོ་བོ་ཅིག་ཨིན་མས། བརྟག་དཔྱད་འབད་ཡོད་པའི་ ཐབ་ཚང་གི་ཅ་ཆས་ ༦༦༥ ལས་ བརྒྱ་ཆ་ ༢༡.༥ ལུ་ཚད་གཞི་ལས་བརྒལ་ཡོདཔ་དང་ ཟངས་དང་ལྕགས་ཀྱི་ཐ་ལི། དེ་ལས་ འཐུང་ཆུ་གི་ཕོརཔ་ཚུ་ནང་ ཞ་རྩི་གི་གནས་ཚད་ མཐོ་དྲགས་ཡོདཔ་སྦེ་ ངོས་འཛིན་བྱུང་ཡོདཔ་ཨིན་པས། ཨེ་ཕྱེ་དཔྱ་བཞི་དང་ ཡུང་བ་དཔྱ་གསུམ་ནང་ ཚད་གཞི་ལས་ལྷག་པའི་ཞ་རྩི་ཡོདཔ་ཨིན་པས།

ས་ཆའི་དཔེ་ཚད་ ༦༠ ལས་ བརྒྱ་ཆ་ ༣.༣ གྱིས་ ཚད་གཞི་ལས་བརྒལ་ཡོདཔ་ཨིནམ་དང་ ཚོན་གྱི་རིགས་ནང་ བཙོག་པ་ཉུང་སུ་སྦེ་འཐོན་ཡོདཔ་ད། དེ་ཡང་ དཔེ་ཚད་ ༡༢༧ ལས་ བརྒྱ་ཆ་ ༠.༨ རྐྱངམ་གཅིག་ཡོདཔ་ཨིན་མས། མཛེས་ཆའི་རིགས་ཚུ་ དཔེ་ཚད་ ༡༤ གི་ནང་ལས་ བརྒྱ་ཆ་ ༡༤.༣ དེ་ཅིག་གིས་ ཚད་གཞི་ལས་ལྷག་སྟེ་ཡོདཔ་ཨིན་མས།

༤༽ སྙན་ཞུ་འདི་ནང་ ཞ་རྩི་གི་ གནོད་པ་ག་ཅི་ར་ཡོདཔ་སྦེ་ བཀོད་ནུག། བཅུད་བཏོན་ཏེ་ བྲིས། (སྐུགས་ ༣)', 'ཞ་རྩི་གིས་ རྩ་ཁམས་དང་ སྤྱོད་ལམ་ ཀླདཔ་དང་ རིག་སྟོབས་ལུ་ གནོད་སྐྱོན་རྐྱབ་ནི་དང་ ཁྲག་མར་ཕབ་འགྱོ་ནིའི་ནད་ཐོབ་ནི་ མཆིནམ་ལུ་ཡང་ གནོད་སྐྱོན་ཕོག་ནི་ཨིན།', null, '[{"point": "རྩ་ཁམས་དང་སྤྱོད་ལམ། ཀླདཔ་དང་རིག་སྟོབས་ལུ་གནོད། ཁྲག་མར་ཕབ་འགྱོ་ནིའི་ནད། མཆིནམ་ལུ་གནོད།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper I (Dzongkha)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-I-Dzongkha.pdf"}}'::jsonb, 'me-general-1-2025b1-c1', 4, null, null)
  returning id
)
insert into me_q select 'C1d', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C1d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C1d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C1d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བའི་ལན་ བྲིས།

ཁྲག་ནང་ཞ་རྩི་ (lead) གི་གནས་ཚད་དང་འབྲེལ་བའི་རྒྱལ་ཡོངས་བརྟག་ཞིབ་སྙན་ཞུ།

རྒྱལ་ཡོངས་ཁྲག་གི་ ཞ་རྩི་གནས་ཚད་ཞིབ་འཇུག་གི་ ཆ་ཚང་སྙན་ཞུ་གིས་ དབྱེ་ཁག་ ༡༠ གྱི་ནང་ལས་ དཔེ་ཚད་ ༢༤༠༠ ལུ་གཞི་བཞག་སྟེ་དབྱེ་ཞིབ་འབདཝ་ད་ ཉིན་བསར་གྱི་ཅ་ཆས་ཚུ་ནང་ ཞ་རྩི་གི་བཙོག་པ་ ཁྱབ་ཆེཝ་སྦེ་ ཁྱབ་སྤེལ་སོང་སྟེ་ཡོདཔ་ལས་ དམིགས་བསལ་གྱིས་ ཨ་ལུ་ཚུ་ལུ་ མི་མང་གསོ་བའི་ཉེན་ཁ་སྦོམ་སྦེ་ར་ འབྱུང་དོ་ཡོདཔ་སྦེ་ གསལ་སྟོན་འབད་ནུག། བརྟག་ཞིབ་འདི་གིས་ བྱིན་རབས་དང་ ཆོས་དོན་གྱི་ཅ་ཆས་ ཐབ་ཚང་གི་ཅ་ཆས་ ཁྱིམ་གྱི་ཅ་ཆས་ རྩེད་ཆས་ སློབ་གྲྭའི་ཅ་ཆས་ ས་དང་ཚོས་གཞི་ དེ་ལས་ མཛེས་ཆས་ཚུ་ བརྟག་དཔྱད་འབད་བའི་སྐབས་ ཟ་སྤྱོད་འབད་བཏུབ་མི་དང་མ་བཏུབ་པའི་ ཐོན་སྐྱེད་གཉིས་ཆ་རའི་ནང་ ལྕགས་རས་ཀྱི་ གནས་ཚད་འདི་ ཉེན་ཁ་ཅན་ཅིག་སྦེ་ མཐོང་ཡོདཔ་ཨིན།

ཞ་རྩི་འདི་ དམིགས་བསལ་གྱིས་ ཨ་ལུ་ཚུ་ལུ་ཉེན་ཁ་སྦོམ་སྦེ་ཡོདཔ་ཨིན་མས། དེ་ཡང་ ལྕགས་རས་འདི་ རྒས་ཤོས་ཚུ་དང་ཕྱདཔ་ད་ ཨ་ལུ་ཚུ་ལུ་ གཟུགས་ནང་སིམ་ནིའི་ནུས་པ་ ཚར་ ༤ ལས་ ༥ གི་བར་ན་ མཐོ་དྲགས་སྦེ་ཡོདཔ་ལས་ འདི་གིས་ རྩ་ཁམས་དང་སྤྱོད་ལམ། ཀླདཔ་དང་ རིག་སྟོབས་ཚུ་ལུ་གནོད་སྐྱོན་རྐྱབ་དོ་ཡོདཔ་ཨིན་མས། དེ་མ་ཚད་ ཁྲག་མར་ཕབ་འགྱོ་ནིའི་ནད་གཞི་འཐོབ་ནི་དང་ མཆིནམ་ལུ་ཡང་ གནོད་སྐྱོན་ཕོགཔ་སྦེ་ཨིན་མས། འཛམ་གླིང་གསོ་བའི་ལས་ཚོགས་ཀྱིས་ ཁྲག་ནང་ཞ་རྩི་གི་གནས་ཚད་ ཨ་ཙི་ལས་མེད་རུང་ ཉེན་སྲུང་མེདཔ་སྦེ་བཤདཔ་ཨིན་མས།

ཞིབ་འཇུག་འདི་ནང་ མཐོང་གསལ་ཆེ་ཤོས་ཅིག་འདི་ བྱིན་རབས་དང་དམ་རས་ཀྱི་རིགས་ནང་ ཞ་རྩི་མཐོ་དྲགས་སྦེ་ཐོན་ཡོད་མི་འདི་ཨིན་མས། དེ་ཡང་ བྱིན་རབས་དམ་རས་ཀྱི་དཔེ་ཚད་ ༧༦༧ བརྟག་དཔྱད་འབད་བའི་སྐབས་ བརྒྱ་ཆ་ ༤༤.༢ གིས་ གཞི་བཞག་ཚད་གཞི་ལས་བརྒལ་ཡོདཔ་ཨིན་མས། ཞིབ་འཇུག་འདི་གིས་ བྱིན་རབས་དམ་རས་ཟ་སྤྱོད་འབད་མི་དང་ ཨ་ལུ་ཚུ་གི་ཁྲག་ནང་ ཞ་རྩི་གི་གནས་ཚད་ཡར་སེང་འགྱོ་མི་ཚུ་གི་བར་ན་ འབྲེལ་བ་ཡོདཔ་སྦེ་ མཐོང་ཡོདཔ་ཨིན་མས། དེ་ཡང་ བྱིན་རབས་ཟ་མི་ ཨ་ལུ་ཚུ་གི་གྲས་ལས་ བརྒྱ་ཆ་ ༧༨ ལུ་ ཞ་རྩི་གི་གནས་ཚད་མཐོ་དྲགས་སྦེ་མངོན་གསལ་བྱུང་ཡོདཔ་མ་ཚད་ འདས་པའི་ཉིནམ་ ༡༥ གི་ནང་འཁོད་ལུ་ བྱིན་རབས་ཟ་མི་ ཨ་ལུ་ཚུ་ནང་ བརྒྱ་ཆ་ ༨༤ གིས་ མཐོ་དྲགས་སྦེ་འཐོན་ཡོདཔ་སྦེ་ གསལ་སྟོན་བྱུང་ནུག། ཆོས་དང་འབྲེལ་བའི་ཅ་ཆས་ སྤོས་ཕོར་དང་དཀར་མེ་གཏིང་ལ་སོགས་པ་ཚུ་ནང་ཡང་ ཞ་རྩི་མཐོ་དྲགས་སྦེ་ཡོདཔ་ཨིན་མས།

ཉིན་ལྟར་གྱི་མི་ཚེ་ནང་ལུ་ གལ་ཆེ་ཤོས་ཅིག་ཨིན་མི་ ཐབ་ཚང་གི་ཅ་ཆས་དང་ བཞེས་སྒོའི་རས་སོར་ཚུ་ཡང་ ཞ་རྩི་གི་ འབྱུང་ཁུངས་གཙོ་བོ་ཅིག་ཨིན་མས། བརྟག་དཔྱད་འབད་ཡོད་པའི་ ཐབ་ཚང་གི་ཅ་ཆས་ ༦༦༥ ལས་ བརྒྱ་ཆ་ ༢༡.༥ ལུ་ཚད་གཞི་ལས་བརྒལ་ཡོདཔ་དང་ ཟངས་དང་ལྕགས་ཀྱི་ཐ་ལི། དེ་ལས་ འཐུང་ཆུ་གི་ཕོརཔ་ཚུ་ནང་ ཞ་རྩི་གི་གནས་ཚད་ མཐོ་དྲགས་ཡོདཔ་སྦེ་ ངོས་འཛིན་བྱུང་ཡོདཔ་ཨིན་པས། ཨེ་ཕྱེ་དཔྱ་བཞི་དང་ ཡུང་བ་དཔྱ་གསུམ་ནང་ ཚད་གཞི་ལས་ལྷག་པའི་ཞ་རྩི་ཡོདཔ་ཨིན་པས།

ས་ཆའི་དཔེ་ཚད་ ༦༠ ལས་ བརྒྱ་ཆ་ ༣.༣ གྱིས་ ཚད་གཞི་ལས་བརྒལ་ཡོདཔ་ཨིནམ་དང་ ཚོན་གྱི་རིགས་ནང་ བཙོག་པ་ཉུང་སུ་སྦེ་འཐོན་ཡོདཔ་ད། དེ་ཡང་ དཔེ་ཚད་ ༡༢༧ ལས་ བརྒྱ་ཆ་ ༠.༨ རྐྱངམ་གཅིག་ཡོདཔ་ཨིན་མས། མཛེས་ཆའི་རིགས་ཚུ་ དཔེ་ཚད་ ༡༤ གི་ནང་ལས་ བརྒྱ་ཆ་ ༡༤.༣ དེ་ཅིག་གིས་ ཚད་གཞི་ལས་ལྷག་སྟེ་ཡོདཔ་ཨིན་མས།

༥༽ ཁྱིམ་ནང་ལུ་ཡོད་པའི་ ཐབ་ཚང་གི་ཅ་ཆས་དང་ ཟ་འཐུང་གི་རིགས་ནང་ ཞ་རྩི་ག་དེ་སྦེ་ཡོདཔ་ཨིན་ན? བཅུད་བསྡུས་ཏེ་ བྲིས། (སྐུགས་ ༣)', 'བརྟག་དཔྱད་འབད་མི་ ཐབ་ཚང་གི་ཅ་ཆས་ ༦༦༥ ལས་ བརྒྱ་ཆ་ ༢༡.༥ ལུ་ ཞ་རྩི་ཚད་གཞི་ལས་བརྒལ་ཡོདཔ་དང་ ཟངས་དང་ལྕགས་ཀྱི་ཐ་ལི་ འཐུང་ཆུ་གི་ཕོརཔ་ཚུ་ནང་ མཐོ་དྲགས་ཡོདཔ་ཨིན། ཨེ་ཕྱེ་དང་ ཡུང་བ་ནང་ཡང་ ཚད་གཞི་ལས་ལྷག་སྟེ་ཡོདཔ་ཨིན།', null, '[{"point": "ཐབ་ཚང་ཅ་ཆས་ ༦༦༥ ལས་ བརྒྱ་ཆ་ ༢༡.༥ ཚད་གཞི་ལས་བརྒལ། ཟངས་དང་ལྕགས་ཀྱི་ཐ་ལི་ དང་ ཆུ་ཕོརཔ། ཨེ་ཕྱེ་དང་ ཡུང་བ་ནང་ཡང་།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper I (Dzongkha)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-I-Dzongkha.pdf"}}'::jsonb, 'me-general-1-2025b1-c1', 5, null, null)
  returning id
)
insert into me_q select 'C1e', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C1e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C1e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C1e';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'translation', 'འོག་ལུ་ཨིང་སྐད་ནང་ཡོད་མི་ ཡིག་རྒྱུགས་འདི་ རྫོང་ཁའི་ཐོག་ལུ་ སྐད་སྒྱུར་འབད་དེ་ བྲིས། (སྐུགས་ ༡༥)

Today, as we gather to start the construction works for the Gelephu International Airport, we are laying the foundations of a legacy that will shape the lives of generations to come. We stand here, surrounded by machines, in a moment of reckoning. But there is no room for anxiety or doubt, because we are prepared. We are ready to face every challenge, to find solutions, and to give it our best effort for all times. We stand together, united in purpose, confident that no matter how difficult the road ahead is, we will persevere.

His Majesty The Great Fourth has handed over to us a great nation built with sweat and toil. The sacrifices and accomplishments of the previous generation gave us a country that enjoys peace, democracy, and immense potential. We cannot be mere custodians of their achievements, nor is it our duty to preserve only the status quo. We are builders. Our generation has been given the extraordinary opportunity to build an even brighter future.

We are deeply indebted to His Majesty and the previous generation for placing their faith in us and giving us the capabilities to design a future rooted in what we value and choose to preserve. We are privileged to be architects who will shape the future to meet our aspirations for all times to come.', 'ལན་གྱི་དཔེ།

དེ་རིང་ ང་བཅས་ དགེ་ལེགས་ཕུག་རྒྱལ་སྤྱི་གནམ་ཐང་གི་ བཟོ་བསྐྲུན་ལཱ་ འགོ་བཙུགས་ནིའི་དོན་ལུ་ འཛོམས་ཏེ་ཡོདཔ་ད་ མ་འོངས་མི་རབས་ཚུ་གི་ མི་ཚེ་ལུ་ ཤུགས་རྐྱེན་ཐེབས་ནིའི་ ཤུལ་བཞག་ཅིག་གི་ གཞི་རྟེན་བཙུགས་དོ་ཡོདཔ་ཨིན། ང་བཅས་ འཕྲུལ་ཆས་ཚུ་གིས་བསྐོར་ཏེ་ བརྩི་འཇོག་གི་ དུས་ཚོད་ཅིག་ལུ་ ལྡང་སྟེ་ཡོད། ཨིན་རུང་ ང་བཅས་ ཤོམ་ཏེ་ཡོདཔ་ལས་ སེམས་ཁར་ ཡིད་ཆེས་མེད་པའི་ དོགས་པ་ ག་ཅི་ཡང་མེད། ང་བཅས་ གདོང་ལེན་ག་ར་ལུ་ ཁ་ཐུག་རྐྱབ་ནི་དང་ ཐབས་ལམ་འཚོལ་ནི་ ནམ་ར་ཨིན་རུང་ ཉམས་ཞིབ་ལྷག་ཤོས་བཏོན་ནི་ལུ་ ཤོམ་ཏེ་ཡོད། ང་བཅས་ དམིགས་དོན་གཅིག་ཐོག་ལུ་ མཐུན་སྒྲིལ་ཐོག་ ཕྱོགས་གཅིག་ཏུ་ལྡང་སྟེ་ ཤུལ་མའི་ལམ་འདི་ ག་དེམ་ཅིག་ཁག་ཆེ་རུང་ བརྩོན་འགྲུས་མ་ཤོར་བར་ འབད་ནི་ཨིན།

མི་དབང་ འབྲུག་རྒྱལ་བཞི་པ་མཆོག་གིས་ ང་བཅས་ལུ་ རྔུལ་ཆུ་དང་ དཀའ་སྤྱད་ཐོག་ལས་ བཙུགས་པའི་ རྒྱལ་ཁབ་ཆེན་པོ་ཅིག་ ལག་ལེན་གནང་ཡོདཔ་ཨིན། མི་རབས་སྔ་མའི་ ཁེ་དབང་བཏང་མི་དང་ ལེགས་གྲུབ་ཚུ་གིས་ ང་བཅས་ལུ་ ཞི་བདེ་ མང་གཙོ་ དེ་ལས་ ནུས་ཤུགས་ཆེན་པོ་ཡོད་པའི་ རྒྱལ་ཁབ་ཅིག་ བྱིན་ཡོདཔ་ཨིན། ང་བཅས་ ཁོང་རའི་ལེགས་གྲུབ་ཚུ་ སྲུང་མི་རྐྱངམ་ཅིག་ ཨིན་མི་ཚུགས། ད་ལྟོའི་གནས་སྟངས་རྐྱངམ་ཅིག་ སྲུང་ནི་ཡང་ ང་བཅས་ཀྱི་འགན་ཁུར་མེན། ང་བཅས་ བཟོ་བསྐྲུན་པ་ཚུ་ཨིན། ང་བཅས་ཀྱི་མི་རབས་འདི་ལུ་ མ་འོངས་པ་ ད་རུང་ གསལ་ཏོག་ཏོ་ཅིག་ བཟོ་ནིའི་ གོ་སྐབས་ ཡ་མཚན་ཅན་ཅིག་ ཐོབ་ཡོདཔ་ཨིན།

ང་བཅས་ལུ་ ཡིད་ཆེས་བཀལ་ཏེ་ ང་བཅས་ཀྱིས་ གཅེས་སྐྱོང་འབད་དེ་ བདག་འཛིན་འཐབ་ནི་ལུ་ གཞི་བཞག་པའི་ མ་འོངས་པ་ཅིག་ བཟོ་ནིའི་ ལྕོགས་གྲུབ་ གནང་མི་ལུ་ མི་དབང་མངའ་བདག་རིན་པོ་ཆེ་མཆོག་དང་ མི་རབས་སྔ་མ་ལུ་ ང་བཅས་ དྲིན་ལན་ཆེན་པོ་ཡོད། ང་བཅས་ ནམ་ར་ཨིན་རུང་ རེ་འདོད་དང་འཁྲིལ་བའི་ མ་འོངས་པ་ བཟོ་བསྐྲུན་འབད་མི་ ཨིན་ནི་འདི་ སྐལ་བ་བཟངམ་ཨིན།', null, '[{"point": "དོན་ཚན་དང་པ་ - གནམ་ཐང་བཟོ་བསྐྲུན་འགོ་བཙུགས། མི་རབས་ཚུ་གི་ཤུལ་བཞག། གདོང་ལེན་ལུ་ ཤོམ་ཏེ་ཡོདཔ། མཐུན་སྒྲིལ།", "marks": 5}, {"point": "དོན་ཚན་གཉིས་པ་ - རྒྱལ་བཞི་པ་མཆོག་གིས་ གནང་མི་རྒྱལ་ཁབ། ཞི་བདེ་ མང་གཙོ། ང་བཅས་ བཟོ་བསྐྲུན་པ་ཨིན།", "marks": 5}, {"point": "དོན་ཚན་གསུམ་པ་ - དྲིན་ལན། མ་འོངས་པ་ གཞི་བཙུགས་འབད་མི་ཨིན། ཞེ་སའི་ཚིག་དང་ ཡིག་སྦྱོར་ངེས་བདེན། དོན་མ་ཤོར་བར།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'translation'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper I (Dzongkha)", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-I-Dzongkha.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'T1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 6.0, 1 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 4.0, 2 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 5.0, 3 from me_q where key = 'T1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'essay', 'འོག་གི་འབྲི་རྩོམ་གྱི་དོན་ཚན་ལུ་གཞི་བཞག་སྟེ་ ཚིག་འབྲུ་ ༥༠༠ དེ་ཅིག་གི་ནང་འཁོད་ལུ་ འབྲི་རྩོམ་ཅིག་བྲིས། (སྐུགས་ ༣༠)
(སྐུགས་ཀྱི་ཚད་གཞི་ - ནང་དོན། འབྲི་བཀོད། དང་ སྐད་ཡིག་དང་ཡིག་སྦྱོར་ཚུ་ལུ་གཞི་བཞག་སྟེ་ སྐུགས་བྱིན་ནི་ཨིན།)

ན་གཞོན་ཚུ་ ཕྱི་རྒྱལ་ལུ་ ལཱ་དང་སློབ་སྦྱོང་གི་དོན་ལུ་ འགྱོ་མི་ མང་སུ་སོང་མི་འདི་གིས་ འབྲུག་གི་ སྤྱི་ཚོགས་དང་ དཔལ་འབོར་ལུ་ ཤུགས་རྐྱེན་ག་ཅི་ཐེབས་ནི་སོ? ཐབས་ལམ་དང་བཅས་ བྲིས།', 'ལན་གྱི་དཔེ་ (outline)

མགོ་བཙུགས། ད་རེས་ ན་གཞོན་ལེ་ཤ་ཅིག་ གླ་ཆ་མཐོ་ཤོས་དང་ ལཱ་གི་གོ་སྐབས་ དེ་ལས་ སློབ་སྦྱོང་གི་དོན་ལུ་ ཕྱི་རྒྱལ་ལུ་ འགྱོ་དོ་ཡོདཔ་ཨིན།

ལེགས་ཕན། ཕྱི་དངུལ་ (remittance) རྒྱལ་ཁབ་ནང་ འོང་ནི། ན་གཞོན་ཚུ་ལུ་ ཉམས་མོང་དང་ ལག་ཤེས་གསརཔ་ ཐོབ་ནི།

ཉེས་ཕན། ལག་ཤེས་ཅན་གྱི་ ལཱ་གཡོག་པ་ (སྨན་པ་ སློབ་དཔོན་ བཟོ་རིག་པ།) ཉུང་སུ་འགྱོ་ནི། ཁྱིམ་ཚང་ཁ་འཐོར་ནི་དང་ རྒས་ཤོས་ཚུ་ རྐྱངམ་གཅིག་ ལུས་ནི། གཡུས་ཁ་དང་ཞིང་ཁ་ སྟོང་པ་ ལུས་ནི། མི་རབས་ཀྱི་ ལམ་སྲོལ་སྤྲོད་ནི་ལུ་ གནོད་པ།

ཐབས་ལམ། རྒྱལ་ཁབ་ནང་ ལས་གཡོགས་ཀྱི་གོ་སྐབས་དང་ གླ་ཆ་ ཡར་དྲག་གཏང་ནི། ཚོང་ལཱ་གསརཔ་ལུ་ རྒྱབ་སྐྱོར། ཕྱི་རྒྱལ་ལས་ ལོག་འོང་མི་ཚུ་ལུ་ ལཱ་དང་ མ་དངུལ་གྱི་ རྒྱབ་སྐྱོར། ཕྱི་རྒྱལ་ནང་ཡོད་མི་ འབྲུག་པ་ཚུ་དང་ འབྲེལ་བ་ བཟུང་ནི།

མཇུག་བསྡུ། ཕྱི་རྒྱལ་ལུ་འགྱོ་ནི་ བཀག་མི་ཚུགས་རུང་ རྒྱལ་ཁབ་ནང་ གོ་སྐབས་ཡར་དྲག་གཏང་པ་ཅིན་ ཁོང་ལོག་ཏེ་ རྒྱལ་ཁབ་ཀྱི་དོན་ལུ་ ལཱ་འབད་ཚུགས།', null, '[{"point": "མགོ་བཙུགས། ཕྱི་རྒྱལ་ལུ་འགྱོ་མི་ཡར་སེང་དང་ རྒྱུ་རྐྱེན་ (གླ་ཆ་ ལཱ་གི་གོ་སྐབས་ སློབ་སྦྱོང་)", "marks": 5}, {"point": "ཤུགས་རྐྱེན་ - ལེགས་ཕན་ (ཕྱི་དངུལ་ ཉམས་མོང་) དང་ ཉེས་ཕན་ (ལག་ཤེས་པ་ཉུང་སུ། ཁྱིམ་ཚང་ཁ་འཐོར། གཡུས་ཁ་སྟོང་པ།)", "marks": 12}, {"point": "ཐབས་ལམ་ (ལས་གཡོགས་ཀྱི་གོ་སྐབས། གླ་ཆ་ཡར་དྲག། ལོག་འོང་མི་ཚུ་ལུ་ རྒྱབ་སྐྱོར།)", "marks": 8}, {"point": "མཇུག་བསྡུ།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'essay'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 30,
    3240, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'E1'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'E1s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 12.0, 1 from me_q where key = 'E1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 7.5, 2 from me_q where key = 'E1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 10.5, 3 from me_q where key = 'E1s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'essay', 'འོག་གི་འབྲི་རྩོམ་གྱི་དོན་ཚན་ལུ་གཞི་བཞག་སྟེ་ ཚིག་འབྲུ་ ༥༠༠ དེ་ཅིག་གི་ནང་འཁོད་ལུ་ འབྲི་རྩོམ་ཅིག་བྲིས། (སྐུགས་ ༣༠)
(སྐུགས་ཀྱི་ཚད་གཞི་ - ནང་དོན། འབྲི་བཀོད། དང་ སྐད་ཡིག་དང་ཡིག་སྦྱོར་ཚུ་ལུ་གཞི་བཞག་སྟེ་ སྐུགས་བྱིན་ནི་ཨིན།)

ཁྱོད་ རྫོང་ཁག་བདག་པོ་སྦེ་ བསྐོ་བཞག་གྲུབ་པ་ཅིན་ ཁྱོད་རའི་རྫོང་ཁག་ནང་ མི་སེར་ཚུ་གི་ ཚེ་གནས་ཡར་དྲག་གཏང་ནིའི་དོན་ལུ་ ག་ཅི་འབད་ནི་སོ? འཆར་སྣང་འབྲི་རྩོམ་ཅིག་ བྲིས།', 'ལན་གྱི་དཔེ་ (outline)

མགོ་བཙུགས། རྫོང་ཁག་བདག་པོ་ཅིག་གི་ འགན་ཁུར་འདི་ མི་སེར་ཚུ་ལུ་ ཞབས་ཏོག་ལེགས་ཤོམ་ཅིག་ བྱིན་ནི་དང་ གོང་འཕེལ་ལཱ་ཚུ་ ལམ་སྟོན་འབད་ནི་ཨིན།

གདོང་ལེན། གཡུས་ཁའི་ལམ་དང་ འཐུང་ཆུ་ མ་ལྡང་མི། ན་གཞོན་ཚུ་ལུ་ ལཱ་མེདཔ། སོ་ནམ་ལུ་ རི་དྭགས་ཀྱི་གནོད་པ།

ལཱ་གི་འཆར་གཞི།
- རྒེད་འོག་ཚུ་དང་ གྲོས་བསྟུན་འབད་དེ་ ལམ་དང་ ཆུ་ ཡོངས་འབྲེལ་ཚུ་ ཡར་དྲག་གཏང་ནི།
- ན་གཞོན་ཚུ་ལུ་ ལག་ཤེས་སྦྱོང་བརྡར་དང་ ཚོང་ལཱ་ཆུང་ཀུ་གི་ རྒྱབ་སྐྱོར།
- སོ་ནམ་པ་ཚུ་ལུ་ ཚོང་ཁང་དང་ འབྲེལ་བ་ བཟོ་ནི། རི་དྭགས་བཀག་ཐབས་ཀྱི་ ར་བ།
- མི་སེར་ཚུ་གི་ ཞུ་བ་ མགྱོགས་དྲགས་སྦེ་ ལེན་ནིའི་ ཞབས་ཏོག་ ཡར་དྲག།
- ཀུན་གསལ་དང་ ཚུལ་ཁྲིམས་ཅན་གྱི་ ལཱ།

མཇུག་བསྡུ། མི་སེར་དང་ གཞུང་ཕྱོགས་ མཐུན་སྒྲིལ་ཐོག་ལས་ ལཱ་འབད་བ་ཅིན་ རྫོང་ཁག་ དགའ་སྐྱིད་དང་ ཕྱུག་པོ་ཅིག་ ཆགས་ཚུགས།', null, '[{"point": "མགོ་བཙུགས། རྫོང་ཁག་བདག་པོའི་འགན་ཁུར་དང་ རྫོང་ཁག་གི་གནས་སངས།", "marks": 5}, {"point": "གདོང་ལེན་ ངོས་འཛིན་ (ལམ། ཆུ། ན་གཞོན་ལཱ་མེད། སོ་ནམ། གསོ་བ།)", "marks": 7}, {"point": "ལཱ་གི་འཆར་གཞི་ ༣-༤ ཁ་གསལ་སྦེ་ (ཞབས་ཏོག་ཡར་དྲག། ལས་གཡོགས། སོ་ནམ་དང་ཚོང་ལཱ། མི་སེར་དང་ གྲོས་བསྟུན།)", "marks": 12}, {"point": "ཀུན་གསལ་དང་ ཚུལ་ཁྲིམས། མཇུག་བསྡུ།", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'essay'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 30,
    3240, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'E2'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'E2s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 12.0, 1 from me_q where key = 'E2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 7.5, 2 from me_q where key = 'E2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 10.5, 3 from me_q where key = 'E2s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'ཀུན་བཟང་ཆོས་འཕེལ་གྱིས་ ཕུན་ཚོགས་གླིང་ལུ་ཡོད་པའི་ རང་གི་ཁང་ཁྱིམ་གྱི་ ཁང་མིག་ཅིག་ ཚེ་རིང་དབང་མོ་ལུ་ ལོ་གཅིག་གི་དོན་ལུ་ ཁང་གླ་ཁར་བྱིན་ནིའི་ ཁང་གླའི་གན་རྒྱ་ཚད་ལྡན་ཅིག་ བྲིས། (སྐུགས་ ༢༠)

གན་རྒྱ་ནང་ཚུད་དགོ་པའི་གནད་དོན།
༡. ར་ཕན་གཉིས་ཀྱི་ངོ་སྤྲོད་ཁ་གསལ།
༢. ཁང་མིག་གི་ཁ་གསལ།
༣. ཁང་གླ་དང་ སྤྲོད་ཐངས།
༤. དུས་ཡུན་དང་ ཆ་རྐྱེན།
༥. འཛོམས་དཔང་རྒྱབ་མི་གི་ཁ་གསལ།', 'ལན་གྱི་དཔེ།

ཁང་གླའི་གན་རྒྱ།

༡. ར་ཕན་གཉིས་ཀྱི་ངོ་སྤྲོད།
ཁྱིམ་བདག་ (ཕྱོགས་དང་པ)༽ ཀུན་བཟང་ཆོས་འཕེལ། ངོ་སྤྲོད་ཨང་ ............ ། སྡོད་གནས་ ཕུན་ཚོགས་གླིང་།
ཁང་གླ་པ་ (ཕྱོགས་གཉིས་པ)༽ ཚེ་རིང་དབང་མོ། ངོ་སྤྲོད་ཨང་ ............ ། སྡོད་གནས་ ............ །

༢. ཁང་མིག་གི་ཁ་གསལ།
ཕུན་ཚོགས་གླིང་ ............ ལུ་ཡོད་པའི་ ཁང་ཁྱིམ་གྱི་ ཐོག་ ............ པའི་ ཁང་མིག་ ............ ཅན་གྱི་ ཁང་ཚན་འདི།

༣. ཁང་གླ་དང་ སྤྲོད་ཐངས།
ཟླཝ་རེ་ལུ་ ཁང་གླ་ ངུལ་ཀྲམ་ ............ ཟླཝ་གི་ཚེས་ ༥ གི་ནང་འཁོད་ལུ་ སྤྲོད་དགོ། འགན་ལེན་དངུལ་ ............ སྤྲོད་དགོ།

༤. དུས་ཡུན་དང་ ཆ་རྐྱེན།
དུས་ཡུན་ ལོ་ ༡ (ཚེས་ ............ ལས་ ཚེས་ ............ ཚུན)། གློག་མེ་དང་ ཆུ་གི་གླ་ ཕྱོགས་གཉིས་པ་གིས་ སྤྲོད་དགོ། ཕྱིར་འཐེན་འབད་ནི་ཨིན་པ་ཅིན་ ཟླཝ་ ༡ གི་ཧེ་མ་ ཁ་བརྡ་བྱིན་དགོ།

༥. འཛོམས་དཔང་།
འཛོམས་དཔང་ ༡༽ ............ ། འཛོམས་དཔང་ ༢༽ ............ །

ཁྱིམ་བདག་གི་མཚན་རྟགས་ ............  ཁང་གླ་པའི་མཚན་རྟགས་ ............  ཚེས་གྲངས་ ............', null, '[{"point": "གན་རྒྱའི་མགོ་མིང་དང་ ར་ཕན་གཉིས་ཀྱི་ངོ་སྤྲོད།", "marks": 4}, {"point": "ཁང་མིག་གི་ཁ་གསལ་ (ས་གནས། ཐོག་ཨང་། ཁང་མིག་ག་དེམ་ཅིག)", "marks": 4}, {"point": "ཁང་གླ། སྤྲོད་ཐངས། ཚེས་གྲངས། འགན་ལེན་དངུལ།", "marks": 4}, {"point": "དུས་ཡུན་ (ལོ་ ༡) དང་ ཆ་རྐྱེན་ (གློག་ཆུ་གི་གླ། ཉམས་བཅོས། ཁ་ཐོག་ལས་ཕྱིར་འཐེན།)", "marks": 4}, {"point": "འཛོམས་དཔང་དང་ མཚན་རྟགས་ ཚེས་གྲངས།", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'formal-writing'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 20,
    2160, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'L1'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'L1s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 8.0, 1 from me_q where key = 'L1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 5.0, 2 from me_q where key = 'L1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 7.0, 3 from me_q where key = 'L1s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'ཁྱོད་ར་ སྤ་རོ་རྫོང་ཁག་ ཤར་པ་རྒེད་འོག་ལས་ པདྨ་ཡིན་ནམ་བཟོ་སྟེ་ གཡུས་ཀྱི་ ལམ་ ཉམས་བཅོས་འབད་ནིའི་དོན་ལུ་ རྒེད་འོག་བདག་པོ་ལུ་ ཞུ་ཡིག་ཚད་ལྡན་ཅིག་ སྔར་སྲོལ་ལམ་ལུགས་ཀྱི་ཐོག་ལུ་ བྲིས། (སྐུགས་ ༢༠)

ཞུ་ཡིག་ནང་ཚང་དགོ་པའི་གནད་དོན།
༡. ཞུ་ཡིག་ཕུལ་མིའི་ངོ་སྤྲོད་ཁ་གསལ།
༢. ཞུ་ཡིག་ཕུལ་དགོ་པའི་གནད་དོན་ཁ་གསལ།
༣. ལམ་གྱི་ས་གནས་དང་ དཀའ་ངལ་གྱི་ཁ་གསལ།
༤. ཞུ་ཡིག་ཕུལ་བའི་གནམ་ལོ་ཟླ་ཚེས་དང་ སྤྱི་ཚེས་ཁ་གསལ།', 'ལན་གྱི་དཔེ།

སྐྱབས་མགོན་ རྒཔོ་མཆོག་ ཤར་པ་རྒེད་འོག། སྤ་རོ་རྫོང་ཁག་ལུ།

ཞུ་དོན། གཡུས་ཀྱི་ལམ་ ཉམས་བཅོས་གནང་དགོ་པའི་ཞུ་བ།

གོང་ལུ་ཞུ་ཡོད་པའི་ཞུ་དོན་ནི་ ང་ པདྨ་ ངོ་སྤྲོད་ཨང་ ............ ཤར་པ་རྒེད་འོག་ ............ གཡུས་ཀྱི་ མི་སེར་ཅིག་ཨིན།

ང་བཅས་རའི་གཡུས་ལུ་ འགྱོ་མི་ ལམ་ (............ ལས་ ............ ཚུན) འདི་ ཆརཔ་གི་དུས་ཚོད་ནང་ ཉམས་ཏེ་ སྣུམ་འཁོར་འགྱོ་མ་ཚུགས་པར་ཡོདཔ་ལས་ ནད་པ་ཚུ་ སྨན་ཁང་ལུ་ འབག་ནི་དང་ སློབ་ཕྲུག་ཚུ་ སློབ་གྲྭ་ལུ་འགྱོ་ནི་ལུ་ དཀའ་ངལ་སྦོམ་ཡོདཔ་ཨིན།

དེ་འབདཝ་ལས་ ལམ་འདི་ ཉམས་བཅོས་གནང་དགོ་པའི་ཞུ་བ་ཕུལ་བ་ཨིན། གཡུས་ཚན་གྱི་མི་སེར་ཚུ་གིས་ ལཱ་གི་ རྒྱབ་སྐྱོར་ ཞུ་ནི་ཨིན།

ཞུ་ཡིག་ཕུལ་མི།
པདྨ། (མཚན་རྟགས)
གནམ་ལོ་ ............ ཟླཝ་ ............ ཚེས་ ............ ། སྤྱི་ཚེས་ ............', null, '[{"point": "སྔར་སྲོལ་ཞུ་ཡིག་གི་རྣམ་གཞག་ (ཞུ་ཡུལ། ཞེ་སའི་ཚིག)", "marks": 5}, {"point": "ཞུ་ཡིག་ཕུལ་མིའི་ངོ་སྤྲོད།", "marks": 4}, {"point": "གནད་དོན་ཁ་གསལ་ (ལམ་གྱི་ས་གནས། དཀའ་ངལ་ - ཆརཔ་ལས་བརྟེན་ ཉམས་ཏེ་ ནད་པ་དང་ སློབ་ཕྲུག་ཚུ་ལུ་ དཀའ་ངལ།)", "marks": 6}, {"point": "གནམ་ལོ་ཟླ་ཚེས་དང་ སྤྱི་ཚེས། མཚན་རྟགས། ཡིག་སྦྱོར།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'formal-writing'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 20,
    2160, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'L2'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'L2s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 8.0, 1 from me_q where key = 'L2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 5.0, 2 from me_q where key = 'L2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 7.0, 3 from me_q where key = 'L2s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'descriptive', 'འོག་གི་གནས་ཚུལ་དེ་ནང་ལས་ ཤེས་དགོ་པའི་གནད་དོན་ཁག་ཆེ་དྲགས་ཚུ་མ་གཏོགས་ གཞན་དོན་དག་མེད་པའི་ཚིག་དོན་ཚུ་བཏོགས་ཏེ་ གནས་ཚུལ་འདི་ ཚིག་འབྲུ་༡༠༠-༡༥༠ དེ་ཅིག་ནང་བཅུད་བསྡུས་ཏེ་ བྲིས། (སྐུགས་ ༡༠)

ཆུ་ཁུངས་སྲུང་སྐྱོབ།

འབྲུག་ནང་ ཆུ་ཁུངས་ལེ་ཤ་ཡོད་རུང་ གྲོང་གསེབ་ལ་ལོ་ཅིག་ནང་ ཆུ་ཚོད་ཉུང་སུ་སོང་སྟེ་ ཉིན་ལྟར་འཐུང་ཆུ་དང་ ཞིང་ལཱ་གི་ཆུ་ལུ་ དཀའ་ངལ་འཐོན་དོ་ཡོདཔ་ཨིན། ཆུ་ཁུངས་ཉུང་སུ་འགྱོ་མི་འདི་ ནམ་གཤིས་འགྱུར་བ་དང་ ནགས་ཚལ་བཅད་མི་ ཆུ་ཁུངས་ཀྱི་མཐའ་འཁོར་ལུ་ ལམ་དང་ཁང་བཟོ་བསྐྲུན་འབད་མི་ཚུ་ལས་བརྟེན་ཨིནམ་སྦེ་ ཞིབ་འཇུག་པ་ཚུ་གིས་བཤདཔ་ཨིན།

ཆུ་ཁུངས་ཉམས་པ་ཅིན་ ཕྱུགས་དང་ཞིང་ལཱ་ལུ་གནོད་པ་ཡོདཔ་མ་ཚད་ ཨ་ལུ་དང་རྒས་ཤོས་ཚུ་ གཞན་ལས་ ཆུ་ཡུད་རིང་སོ་ལེན་ནི་ལུ་ འགྱོ་དགོཔ་ཐོན་ཏེ་ ལཱ་དང་སློབ་སྦྱོང་ལུ་ཡང་ གནོད་པ་ཡོདཔ་ཨིན། ཆུ་གཙང་མ་མེད་པ་ཅིན་ ན་ཚ་གི་ཉེན་ཁ་ཡང་ ཡར་སེང་འགྱོཝ་ཨིན།

དེ་འབདཝ་ལས་ གཡུས་ཚན་ལ་ལོ་ཅིག་གིས་ ཆུ་ཁུངས་ཀྱི་མཐའ་འཁོར་ལུ་ ཤིང་འཛུགས་ནི་དང་ ཆུ་ཁུངས་ལུ་ ར་བ་བསྐོར་ནི་ ཕྱུགས་འགྱོ་མ་བཅུག་ནི་ཚུ་འབད་དེ་ སྲུང་སྐྱོབ་འབད་དོ་ཡོདཔ་ཨིན། ཁྱིམ་ལ་ལོ་ཅིག་གིས་ ཆརཔ་གི་ཆུ་བསག་ནིའི་ ཆུ་ཟོམ་ཚུ་ ལག་ལེན་འཐབ་དོ་ཡོདཔ་ཨིན། ཁྲོམ་ཁར་ཡང་ ཆུ་མ་ཤོར་བར་ ཆུ་ཁ་ཚུ་བཀག་ནི་ལུ་ དོ་སྣང་བཏང་དགོཔ་ཨིན།

ཆུ་འདི་ ག་ར་གི་མི་ཚེ་གི་གཞི་རྩ་ཨིནམ་ལས་ ཆུ་ཁུངས་སྲུང་སྐྱོབ་འདི་ གཞུང་རྐྱངམ་ཅིག་གི་ལཱ་མེན་པར་ མི་ངོ་རེ་རེ་གི་ འགན་ཁུར་ཨིན།', 'ལན་གྱི་དཔེ།

ཆུ་ཁུངས་སྲུང་སྐྱོབ།

ནམ་གཤིས་འགྱུར་བ་དང་ ནགས་ཚལ་བཅད་མི་ ཆུ་ཁུངས་ཀྱི་མཐའ་འཁོར་ལུ་ བཟོ་བསྐྲུན་འབད་མི་ཚུ་ལས་བརྟེན་ གྲོང་གསེབ་ལ་ལོ་ཅིག་ནང་ ཆུ་ཉུང་སུ་སོང་ཡོདཔ་ཨིན། འདི་གིས་ ཕྱུགས་དང་ཞིང་ལཱ་ལུ་གནོད་པ་མ་ཚད་ ཨ་ལུ་དང་རྒས་ཤོས་ཚུ་ ཆུ་ལེན་ནི་ལུ་ ཡུད་རིང་འགྱོ་དགོཔ་དང་ ན་ཚ་གི་ཉེན་ཁ་ཡང་ ཡར་སེང་འགྱོཝ་ཨིན། དེ་འབདཝ་ལས་ གཡུས་ཚན་ལ་ལོ་གིས་ ཆུ་ཁུངས་ལུ་ ཤིང་འཛུགས་ཏེ་ ར་བ་བསྐོར་ནི་དང་ ཆརཔ་གི་ཆུ་བསག་ནི་ཚུ་ འབད་དོ་ཡོདཔ་ཨིན། ཆུ་ཁུངས་སྲུང་སྐྱོབ་འདི་ མི་ངོ་རེ་རེ་གི་ འགན་ཁུར་ཨིན།', null, '[{"point": "ཆུ་ཁུངས་ཉུང་སུ་འགྱོ་མི་དང་ རྒྱུ་རྐྱེན་ (ནམ་གཤིས་འགྱུར་བ། ནགས་ཚལ་བཅད་མི། བཟོ་བསྐྲུན།)", "marks": 3}, {"point": "ཤུགས་རྐྱེན་ (ཕྱུགས་དང་ཞིང་ལཱ། ཨ་ལུ་དང་རྒས་ཤོས། ན་ཚ།)", "marks": 3}, {"point": "ཐབས་ལམ་ (ཤིང་འཛུགས། ར་བ། ཆརཔ་གི་ཆུ་བསག། ཆུ་མ་ཤོར་བར།) དང་ མི་ངོ་རེ་རེ་གི་འགན་ཁུར།", "marks": 2}, {"point": "ཚིག་འབྲུ་ཚད་ཀྱི་ནང་འཁོད་ རང་གི་ཚིག་ཐོག་ལས།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'pr-cis'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'P1'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'P1s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 4.0, 1 from me_q where key = 'P1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 2.5, 2 from me_q where key = 'P1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 3.5, 3 from me_q where key = 'P1s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'short_answer', 'a) སྐད་ཡིག་གི་དྲི་བ། འོག་ལུ་བཀོད་དེ་ཡོད་མི་ དྲི་བ་ག་རའི་ལན་བྲིས། (སྐུགས་ [༡×༥=༥])
༡༽ རྫོང་ཁ་གོང་འཕེལ་ལྷན་ཚོགས་ (ད་ལྟོ་ རྫོང་ཁ་གོང་འཕེལ་ལྷན་ཚོགས) འདི་ ག་དུས་ གཞི་བཙུགས་འབད་ཡི?
༢༽ ཞེ་སའི་ཚིག་ ལག་ལེན་འཐབ་དགོ་པའི་ གལ་གནད་ ༢ བྲིས།
༣༽ བཞེས་སྒོ་བཞེས། ཟེར་བའི་ཞེ་སའི་ཚིག་འདི་ ཕལ་ཚིག་ནང་ བསྒྱུར་ཏེ་ བྲིས།
༤༽ མགུ་ཏོ། ལགཔ། ཟེར་བའི་ ཕལ་ཚིག་གཉིས་ཀྱི་ ཞེ་སའི་ཚིག་ བྲིས།
༥༽ འོག་གི་ས་སྟོང་ནང་ འོས་འབབ་ཡོད་པའི་ མིང་གི་ཁྱད་ཚིག་བཙུགས་ཏེ་ རྗོད་ཚིག་ཆ་ཚངམ་སྦེ་ བཟོ།
   ཀ) ནམ་དགུན་གྱི་དུས་ཚོད་ནང་ གནམ་................སྦེ་ཡོདཔ་ཨིན།
   ཁ) ཨ་ལུ་འདི་ ................ཅིག་ཨིན་པས། (5 marks)', 'a)
༡༽ རྫོང་ཁ་གོང་འཕེལ་ལྷན་ཚོགས་འདི་ སྤྱི་ལོ་ ༡༩༨༦ ལུ་ གཞི་བཙུགས་འབད་ཡི།
༢༽ (ཀ) གཞན་ལུ་ བརྩི་མཐོང་དང་ གུས་ཞབས་སྟོན་ནི། (ཁ) སྒྲིག་ལམ་རྣམ་གཞག་དང་ འབྲུག་གི་ལམ་སྲོལ་ བདག་འཛིན་འཐབ་ནི།
༣༽ ལྟོ་ཟ།
༤༽ མགུ་ཏོ་ - དབུ། ལགཔ་ - ཕྱག།
༥༽ ཀ) གྲང་ཏོག་ཏོ་ ཁ) ཁ་དྲག་དྲགཔ་/ བློ་བཟང་བཟངམ་', null, '[{"point": "༡ སྤྱི་ལོ་ ༡༩༨༦; ༢ གལ་གནད་ ༢ (བརྩི་མཐོང་སྟོན་ནི། སྒྲིག་ལམ་རྣམ་གཞག་དང་ ལམ་སྲོལ་བདག་འཛིན།); ༣ ལྟོ་ཟ་; ༤ དབུ་ / ཕྱག་; ༥ ཁྱད་ཚིག་འོས་འབབ་ (གྲང་ཏོག་ཏོ / སེམས་ཆུང་ཀུ་ ཆེ་ཆུང་ལེགས་ཤོམ)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'language-and-spelling'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 5,
    540, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'G1a'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Grammar answers need a Dzongkha teacher''s confirmation."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-1-2025b1-g1s', 1, null, null)
  returning id
)
insert into me_q select 'G1sa', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 2.0, 1 from me_q where key = 'G1sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'G1sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 2.0, 3 from me_q where key = 'G1sa';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'short_answer', 'b) འོག་གི་ རྗོད་ཚིག་གི་ས་སྟོང་ནང་ བྱེད་འབྲེལ་ལས་ཚིག་དང་ བྱེད་མེད་ལས་ཚིག་གི་བ་ཚིག་གཉིས་ལས་ ག་འདི་འོས་འབབ་འདུག་ག་བཙུགས་ཏེ་ ས་སྟོང་སུབས། (སྐུགས་ [༡×༥=༥])
༡) ཨམ་གྱིས་ སྒོ་.........ཞིནམ་ལས་ ཕྱི་ཁར་འགྱོ་ཡི། (དབྱེ/ཕྱེ)
༢) རླུང་གིས་ ཤིང་སྡོང་.........ཡི། (བཀྱག/ཆག)
༣) ང་གིས་ ཡི་གུ་.........ཞིནམ་ལས་ བཏང་ཡི། (བྲི/འབྲི)
༤) ཁ་ཙ་ ཆརཔ་ལས་བརྟེན་ ཆུ་ཚད་.........ཡི། (བསྐྱེད/སྐྱེད)
༥) སློབ་དཔོན་གྱིས་ སློབ་ཕྲུག་ཚུ་ཕྱེད་ཀ་ཕྱེད་ཀ་སྦེ་.........ཡི། (བགོ/འགོ) (5 marks)', 'b)
༡) ཕྱེ། ༢) ཆག། ༣) བྲིས། ༤) སྐྱེད། ༥) བགོས།', null, '[{"point": "༡ ཕྱེ་ ༢ ཆག་ ༣ བྲིས་ ༤ སྐྱེད་ ༥ བགོས་ (ལས་ཚིག་ བྱེད་འབྲེལ་/བྱེད་མེད་ ངེས་བདེན)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'language-and-spelling'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 5,
    540, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'G1b'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Grammar answers need a Dzongkha teacher''s confirmation."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-1-2025b1-g1s', 2, null, null)
  returning id
)
insert into me_q select 'G1sb', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 2.0, 1 from me_q where key = 'G1sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'G1sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 2.0, 3 from me_q where key = 'G1sb';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བའི་ལན་ བྲིས། (Soma གིས་བྲིས་པའི་སྦྱོང་བརྡར་ཡིག་རྒྱུགས།)

ཆུ་ཁུངས་སྲུང་སྐྱོབ།

འབྲུག་ནང་ ཆུ་ཁུངས་ལེ་ཤ་ཡོད་རུང་ གྲོང་གསེབ་ལ་ལོ་ཅིག་ནང་ ཆུ་ཚོད་ཉུང་སུ་སོང་སྟེ་ ཉིན་ལྟར་འཐུང་ཆུ་དང་ ཞིང་ལཱ་གི་ཆུ་ལུ་ དཀའ་ངལ་འཐོན་དོ་ཡོདཔ་ཨིན། ཆུ་ཁུངས་ཉུང་སུ་འགྱོ་མི་འདི་ ནམ་གཤིས་འགྱུར་བ་དང་ ནགས་ཚལ་བཅད་མི་ ཆུ་ཁུངས་ཀྱི་མཐའ་འཁོར་ལུ་ ལམ་དང་ཁང་བཟོ་བསྐྲུན་འབད་མི་ཚུ་ལས་བརྟེན་ཨིནམ་སྦེ་ ཞིབ་འཇུག་པ་ཚུ་གིས་བཤདཔ་ཨིན།

ཆུ་ཁུངས་ཉམས་པ་ཅིན་ ཕྱུགས་དང་ཞིང་ལཱ་ལུ་གནོད་པ་ཡོདཔ་མ་ཚད་ ཨ་ལུ་དང་རྒས་ཤོས་ཚུ་ གཞན་ལས་ ཆུ་ཡུད་རིང་སོ་ལེན་ནི་ལུ་ འགྱོ་དགོཔ་ཐོན་ཏེ་ ལཱ་དང་སློབ་སྦྱོང་ལུ་ཡང་ གནོད་པ་ཡོདཔ་ཨིན། ཆུ་གཙང་མ་མེད་པ་ཅིན་ ན་ཚ་གི་ཉེན་ཁ་ཡང་ ཡར་སེང་འགྱོཝ་ཨིན།

དེ་འབདཝ་ལས་ གཡུས་ཚན་ལ་ལོ་ཅིག་གིས་ ཆུ་ཁུངས་ཀྱི་མཐའ་འཁོར་ལུ་ ཤིང་འཛུགས་ནི་དང་ ཆུ་ཁུངས་ལུ་ ར་བ་བསྐོར་ནི་ ཕྱུགས་འགྱོ་མ་བཅུག་ནི་ཚུ་འབད་དེ་ སྲུང་སྐྱོབ་འབད་དོ་ཡོདཔ་ཨིན། ཁྱིམ་ལ་ལོ་ཅིག་གིས་ ཆརཔ་གི་ཆུ་བསག་ནིའི་ ཆུ་ཟོམ་ཚུ་ ལག་ལེན་འཐབ་དོ་ཡོདཔ་ཨིན། ཁྲོམ་ཁར་ཡང་ ཆུ་མ་ཤོར་བར་ ཆུ་ཁ་ཚུ་བཀག་ནི་ལུ་ དོ་སྣང་བཏང་དགོཔ་ཨིན།

ཆུ་འདི་ ག་ར་གི་མི་ཚེ་གི་གཞི་རྩ་ཨིནམ་ལས་ ཆུ་ཁུངས་སྲུང་སྐྱོབ་འདི་ གཞུང་རྐྱངམ་ཅིག་གི་ལཱ་མེན་པར་ མི་ངོ་རེ་རེ་གི་ འགན་ཁུར་ཨིན།

༡༽ ཆུ་ཁུངས་ཉུང་སུ་འགྱོ་མིའི་ རྒྱུ་རྐྱེན་ ༣ ཐོ་བཀོད་འབད། (སྐུགས་ ༣)', 'ཆུ་ཁུངས་ཉུང་སུ་འགྱོ་མིའི་རྒྱུ་རྐྱེན་ - (༡) ནམ་གཤིས་འགྱུར་བ། (༢) ནགས་ཚལ་བཅད་མི། (༣) ཆུ་ཁུངས་ཀྱི་མཐའ་འཁོར་ལུ་ ལམ་དང་ ཁང་བཟོ་བསྐྲུན་འབད་མི།', null, '[{"point": "ནམ་གཤིས་འགྱུར་བ། ནགས་ཚལ་བཅད་མི། ཆུ་ཁུངས་ཀྱི་མཐའ་འཁོར་ལུ་ ལམ་དང་ཁང་བཟོ་བསྐྲུན།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'C1a'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-1-s1-c2', 1, null, null)
  returning id
)
insert into me_q select 'C2a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C2a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བའི་ལན་ བྲིས། (Soma གིས་བྲིས་པའི་སྦྱོང་བརྡར་ཡིག་རྒྱུགས།)

ཆུ་ཁུངས་སྲུང་སྐྱོབ།

འབྲུག་ནང་ ཆུ་ཁུངས་ལེ་ཤ་ཡོད་རུང་ གྲོང་གསེབ་ལ་ལོ་ཅིག་ནང་ ཆུ་ཚོད་ཉུང་སུ་སོང་སྟེ་ ཉིན་ལྟར་འཐུང་ཆུ་དང་ ཞིང་ལཱ་གི་ཆུ་ལུ་ དཀའ་ངལ་འཐོན་དོ་ཡོདཔ་ཨིན། ཆུ་ཁུངས་ཉུང་སུ་འགྱོ་མི་འདི་ ནམ་གཤིས་འགྱུར་བ་དང་ ནགས་ཚལ་བཅད་མི་ ཆུ་ཁུངས་ཀྱི་མཐའ་འཁོར་ལུ་ ལམ་དང་ཁང་བཟོ་བསྐྲུན་འབད་མི་ཚུ་ལས་བརྟེན་ཨིནམ་སྦེ་ ཞིབ་འཇུག་པ་ཚུ་གིས་བཤདཔ་ཨིན།

ཆུ་ཁུངས་ཉམས་པ་ཅིན་ ཕྱུགས་དང་ཞིང་ལཱ་ལུ་གནོད་པ་ཡོདཔ་མ་ཚད་ ཨ་ལུ་དང་རྒས་ཤོས་ཚུ་ གཞན་ལས་ ཆུ་ཡུད་རིང་སོ་ལེན་ནི་ལུ་ འགྱོ་དགོཔ་ཐོན་ཏེ་ ལཱ་དང་སློབ་སྦྱོང་ལུ་ཡང་ གནོད་པ་ཡོདཔ་ཨིན། ཆུ་གཙང་མ་མེད་པ་ཅིན་ ན་ཚ་གི་ཉེན་ཁ་ཡང་ ཡར་སེང་འགྱོཝ་ཨིན།

དེ་འབདཝ་ལས་ གཡུས་ཚན་ལ་ལོ་ཅིག་གིས་ ཆུ་ཁུངས་ཀྱི་མཐའ་འཁོར་ལུ་ ཤིང་འཛུགས་ནི་དང་ ཆུ་ཁུངས་ལུ་ ར་བ་བསྐོར་ནི་ ཕྱུགས་འགྱོ་མ་བཅུག་ནི་ཚུ་འབད་དེ་ སྲུང་སྐྱོབ་འབད་དོ་ཡོདཔ་ཨིན། ཁྱིམ་ལ་ལོ་ཅིག་གིས་ ཆརཔ་གི་ཆུ་བསག་ནིའི་ ཆུ་ཟོམ་ཚུ་ ལག་ལེན་འཐབ་དོ་ཡོདཔ་ཨིན། ཁྲོམ་ཁར་ཡང་ ཆུ་མ་ཤོར་བར་ ཆུ་ཁ་ཚུ་བཀག་ནི་ལུ་ དོ་སྣང་བཏང་དགོཔ་ཨིན།

ཆུ་འདི་ ག་ར་གི་མི་ཚེ་གི་གཞི་རྩ་ཨིནམ་ལས་ ཆུ་ཁུངས་སྲུང་སྐྱོབ་འདི་ གཞུང་རྐྱངམ་ཅིག་གི་ལཱ་མེན་པར་ མི་ངོ་རེ་རེ་གི་ འགན་ཁུར་ཨིན།

༢༽ ཆུ་ཁུངས་ཉམས་པ་ཅིན་ ཨ་ལུ་དང་རྒས་ཤོས་ཚུ་ལུ་ གནོད་པ་ག་ཅི་ཡོདཔ་ཨིན་ན? (སྐུགས་ ༣)', 'ཨ་ལུ་དང་ རྒས་ཤོས་ཚུ་ ཆུ་ལེན་ནི་ལུ་ ཡུད་རིང་སོ་ འགྱོ་དགོཔ་ཐོན་ཏེ་ ལཱ་དང་ སློབ་སྦྱོང་ལུ་ གནོད་པ་ཡོདཔ་ཨིན།', null, '[{"point": "ཆུ་ལེན་ནི་ལུ་ ཡུད་རིང་འགྱོ་དགོཔ་ཐོན་ཏེ་ ལཱ་དང་ སློབ་སྦྱོང་ལུ་ གནོད་པ།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'C1b'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-1-s1-c2', 2, null, null)
  returning id
)
insert into me_q select 'C2b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C2b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བའི་ལན་ བྲིས། (Soma གིས་བྲིས་པའི་སྦྱོང་བརྡར་ཡིག་རྒྱུགས།)

ཆུ་ཁུངས་སྲུང་སྐྱོབ།

འབྲུག་ནང་ ཆུ་ཁུངས་ལེ་ཤ་ཡོད་རུང་ གྲོང་གསེབ་ལ་ལོ་ཅིག་ནང་ ཆུ་ཚོད་ཉུང་སུ་སོང་སྟེ་ ཉིན་ལྟར་འཐུང་ཆུ་དང་ ཞིང་ལཱ་གི་ཆུ་ལུ་ དཀའ་ངལ་འཐོན་དོ་ཡོདཔ་ཨིན། ཆུ་ཁུངས་ཉུང་སུ་འགྱོ་མི་འདི་ ནམ་གཤིས་འགྱུར་བ་དང་ ནགས་ཚལ་བཅད་མི་ ཆུ་ཁུངས་ཀྱི་མཐའ་འཁོར་ལུ་ ལམ་དང་ཁང་བཟོ་བསྐྲུན་འབད་མི་ཚུ་ལས་བརྟེན་ཨིནམ་སྦེ་ ཞིབ་འཇུག་པ་ཚུ་གིས་བཤདཔ་ཨིན།

ཆུ་ཁུངས་ཉམས་པ་ཅིན་ ཕྱུགས་དང་ཞིང་ལཱ་ལུ་གནོད་པ་ཡོདཔ་མ་ཚད་ ཨ་ལུ་དང་རྒས་ཤོས་ཚུ་ གཞན་ལས་ ཆུ་ཡུད་རིང་སོ་ལེན་ནི་ལུ་ འགྱོ་དགོཔ་ཐོན་ཏེ་ ལཱ་དང་སློབ་སྦྱོང་ལུ་ཡང་ གནོད་པ་ཡོདཔ་ཨིན། ཆུ་གཙང་མ་མེད་པ་ཅིན་ ན་ཚ་གི་ཉེན་ཁ་ཡང་ ཡར་སེང་འགྱོཝ་ཨིན།

དེ་འབདཝ་ལས་ གཡུས་ཚན་ལ་ལོ་ཅིག་གིས་ ཆུ་ཁུངས་ཀྱི་མཐའ་འཁོར་ལུ་ ཤིང་འཛུགས་ནི་དང་ ཆུ་ཁུངས་ལུ་ ར་བ་བསྐོར་ནི་ ཕྱུགས་འགྱོ་མ་བཅུག་ནི་ཚུ་འབད་དེ་ སྲུང་སྐྱོབ་འབད་དོ་ཡོདཔ་ཨིན། ཁྱིམ་ལ་ལོ་ཅིག་གིས་ ཆརཔ་གི་ཆུ་བསག་ནིའི་ ཆུ་ཟོམ་ཚུ་ ལག་ལེན་འཐབ་དོ་ཡོདཔ་ཨིན། ཁྲོམ་ཁར་ཡང་ ཆུ་མ་ཤོར་བར་ ཆུ་ཁ་ཚུ་བཀག་ནི་ལུ་ དོ་སྣང་བཏང་དགོཔ་ཨིན།

ཆུ་འདི་ ག་ར་གི་མི་ཚེ་གི་གཞི་རྩ་ཨིནམ་ལས་ ཆུ་ཁུངས་སྲུང་སྐྱོབ་འདི་ གཞུང་རྐྱངམ་ཅིག་གི་ལཱ་མེན་པར་ མི་ངོ་རེ་རེ་གི་ འགན་ཁུར་ཨིན།

༣༽ ཆུ་གཙང་མ་མེད་པ་ཅིན་ ཉེན་ཁ་ག་ཅི་ཡོདཔ་ཨིན་ན? (སྐུགས་ ༣)', 'ཆུ་གཙང་མ་མེད་པ་ཅིན་ ན་ཚ་ཐོབ་ནིའི་ཉེན་ཁ་ ཡར་སེང་འགྱོཝ་ཨིན།', null, '[{"point": "ན་ཚ་གི་ཉེན་ཁ་ ཡར་སེང་འགྱོཝ།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'C1c'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-1-s1-c2', 3, null, null)
  returning id
)
insert into me_q select 'C2c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C2c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C2c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C2c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བའི་ལན་ བྲིས། (Soma གིས་བྲིས་པའི་སྦྱོང་བརྡར་ཡིག་རྒྱུགས།)

ཆུ་ཁུངས་སྲུང་སྐྱོབ།

འབྲུག་ནང་ ཆུ་ཁུངས་ལེ་ཤ་ཡོད་རུང་ གྲོང་གསེབ་ལ་ལོ་ཅིག་ནང་ ཆུ་ཚོད་ཉུང་སུ་སོང་སྟེ་ ཉིན་ལྟར་འཐུང་ཆུ་དང་ ཞིང་ལཱ་གི་ཆུ་ལུ་ དཀའ་ངལ་འཐོན་དོ་ཡོདཔ་ཨིན། ཆུ་ཁུངས་ཉུང་སུ་འགྱོ་མི་འདི་ ནམ་གཤིས་འགྱུར་བ་དང་ ནགས་ཚལ་བཅད་མི་ ཆུ་ཁུངས་ཀྱི་མཐའ་འཁོར་ལུ་ ལམ་དང་ཁང་བཟོ་བསྐྲུན་འབད་མི་ཚུ་ལས་བརྟེན་ཨིནམ་སྦེ་ ཞིབ་འཇུག་པ་ཚུ་གིས་བཤདཔ་ཨིན།

ཆུ་ཁུངས་ཉམས་པ་ཅིན་ ཕྱུགས་དང་ཞིང་ལཱ་ལུ་གནོད་པ་ཡོདཔ་མ་ཚད་ ཨ་ལུ་དང་རྒས་ཤོས་ཚུ་ གཞན་ལས་ ཆུ་ཡུད་རིང་སོ་ལེན་ནི་ལུ་ འགྱོ་དགོཔ་ཐོན་ཏེ་ ལཱ་དང་སློབ་སྦྱོང་ལུ་ཡང་ གནོད་པ་ཡོདཔ་ཨིན། ཆུ་གཙང་མ་མེད་པ་ཅིན་ ན་ཚ་གི་ཉེན་ཁ་ཡང་ ཡར་སེང་འགྱོཝ་ཨིན།

དེ་འབདཝ་ལས་ གཡུས་ཚན་ལ་ལོ་ཅིག་གིས་ ཆུ་ཁུངས་ཀྱི་མཐའ་འཁོར་ལུ་ ཤིང་འཛུགས་ནི་དང་ ཆུ་ཁུངས་ལུ་ ར་བ་བསྐོར་ནི་ ཕྱུགས་འགྱོ་མ་བཅུག་ནི་ཚུ་འབད་དེ་ སྲུང་སྐྱོབ་འབད་དོ་ཡོདཔ་ཨིན། ཁྱིམ་ལ་ལོ་ཅིག་གིས་ ཆརཔ་གི་ཆུ་བསག་ནིའི་ ཆུ་ཟོམ་ཚུ་ ལག་ལེན་འཐབ་དོ་ཡོདཔ་ཨིན། ཁྲོམ་ཁར་ཡང་ ཆུ་མ་ཤོར་བར་ ཆུ་ཁ་ཚུ་བཀག་ནི་ལུ་ དོ་སྣང་བཏང་དགོཔ་ཨིན།

ཆུ་འདི་ ག་ར་གི་མི་ཚེ་གི་གཞི་རྩ་ཨིནམ་ལས་ ཆུ་ཁུངས་སྲུང་སྐྱོབ་འདི་ གཞུང་རྐྱངམ་ཅིག་གི་ལཱ་མེན་པར་ མི་ངོ་རེ་རེ་གི་ འགན་ཁུར་ཨིན།

༤༽ གཡུས་ཚན་དང་ ཁྱིམ་ཚུ་གིས་ ཆུ་ཁུངས་སྲུང་སྐྱོབ་འབད་ནི་ལུ་ ག་ཅི་ར་འབད་དོ་ཡོདཔ་ཨིན་ན? (སྐུགས་ ༣)', 'ཆུ་ཁུངས་ཀྱི་ མཐའ་འཁོར་ལུ་ ཤིང་འཛུགས་ནི་དང་ ར་བ་བསྐོར་ནི་ ཕྱུགས་འགྱོ་མ་བཅུག་ནི་ཚུ་ འབད་དོ་ཡོདཔ་དང་ ཁྱིམ་ལ་ལོ་ཅིག་གིས་ ཆརཔ་གི་ཆུ་བསག་ནིའི་ ཆུ་ཟོམ་ ལག་ལེན་འཐབ་དོ་ཡོདཔ་ཨིན།', null, '[{"point": "ཆུ་ཁུངས་མཐའ་འཁོར་ལུ་ ཤིང་འཛུགས། ར་བ་བསྐོར། ཕྱུགས་འགྱོ་མ་བཅུག ཆརཔ་གི་ཆུ་བསག་ནིའི་ ཆུ་ཟོམ།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'C1d'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-1-s1-c2', 4, null, null)
  returning id
)
insert into me_q select 'C2d', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C2d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C2d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C2d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བའི་ལན་ བྲིས། (Soma གིས་བྲིས་པའི་སྦྱོང་བརྡར་ཡིག་རྒྱུགས།)

ཆུ་ཁུངས་སྲུང་སྐྱོབ།

འབྲུག་ནང་ ཆུ་ཁུངས་ལེ་ཤ་ཡོད་རུང་ གྲོང་གསེབ་ལ་ལོ་ཅིག་ནང་ ཆུ་ཚོད་ཉུང་སུ་སོང་སྟེ་ ཉིན་ལྟར་འཐུང་ཆུ་དང་ ཞིང་ལཱ་གི་ཆུ་ལུ་ དཀའ་ངལ་འཐོན་དོ་ཡོདཔ་ཨིན། ཆུ་ཁུངས་ཉུང་སུ་འགྱོ་མི་འདི་ ནམ་གཤིས་འགྱུར་བ་དང་ ནགས་ཚལ་བཅད་མི་ ཆུ་ཁུངས་ཀྱི་མཐའ་འཁོར་ལུ་ ལམ་དང་ཁང་བཟོ་བསྐྲུན་འབད་མི་ཚུ་ལས་བརྟེན་ཨིནམ་སྦེ་ ཞིབ་འཇུག་པ་ཚུ་གིས་བཤདཔ་ཨིན།

ཆུ་ཁུངས་ཉམས་པ་ཅིན་ ཕྱུགས་དང་ཞིང་ལཱ་ལུ་གནོད་པ་ཡོདཔ་མ་ཚད་ ཨ་ལུ་དང་རྒས་ཤོས་ཚུ་ གཞན་ལས་ ཆུ་ཡུད་རིང་སོ་ལེན་ནི་ལུ་ འགྱོ་དགོཔ་ཐོན་ཏེ་ ལཱ་དང་སློབ་སྦྱོང་ལུ་ཡང་ གནོད་པ་ཡོདཔ་ཨིན། ཆུ་གཙང་མ་མེད་པ་ཅིན་ ན་ཚ་གི་ཉེན་ཁ་ཡང་ ཡར་སེང་འགྱོཝ་ཨིན།

དེ་འབདཝ་ལས་ གཡུས་ཚན་ལ་ལོ་ཅིག་གིས་ ཆུ་ཁུངས་ཀྱི་མཐའ་འཁོར་ལུ་ ཤིང་འཛུགས་ནི་དང་ ཆུ་ཁུངས་ལུ་ ར་བ་བསྐོར་ནི་ ཕྱུགས་འགྱོ་མ་བཅུག་ནི་ཚུ་འབད་དེ་ སྲུང་སྐྱོབ་འབད་དོ་ཡོདཔ་ཨིན། ཁྱིམ་ལ་ལོ་ཅིག་གིས་ ཆརཔ་གི་ཆུ་བསག་ནིའི་ ཆུ་ཟོམ་ཚུ་ ལག་ལེན་འཐབ་དོ་ཡོདཔ་ཨིན། ཁྲོམ་ཁར་ཡང་ ཆུ་མ་ཤོར་བར་ ཆུ་ཁ་ཚུ་བཀག་ནི་ལུ་ དོ་སྣང་བཏང་དགོཔ་ཨིན།

ཆུ་འདི་ ག་ར་གི་མི་ཚེ་གི་གཞི་རྩ་ཨིནམ་ལས་ ཆུ་ཁུངས་སྲུང་སྐྱོབ་འདི་ གཞུང་རྐྱངམ་ཅིག་གི་ལཱ་མེན་པར་ མི་ངོ་རེ་རེ་གི་ འགན་ཁུར་ཨིན།

༥༽ ཆུ་ཁུངས་སྲུང་སྐྱོབ་འདི་ ག་གི་འགན་ཁུར་ཨིན་ན? ཡིག་རྒྱུགས་དང་འཁྲིལ་ཏེ་ རྒྱུ་མཚན་དང་བཅས་ བྲིས། (སྐུགས་ ༣)', 'ཆུ་ཁུངས་སྲུང་སྐྱོབ་འདི་ གཞུང་རྐྱངམ་ཅིག་གི་ལཱ་མེན་པར་ མི་ངོ་རེ་རེ་གི་ འགན་ཁུར་ཨིན། ག་ཅི་སྦེ་ཟེར་བ་ཅིན་ ཆུ་འདི་ ག་ར་གི་ མི་ཚེ་གི་ གཞི་རྩ་ཨིན།', null, '[{"point": "གཞུང་རྐྱངམ་ཅིག་མེན་པར་ མི་ངོ་རེ་རེ་གི་འགན་ཁུར་ཨིན། རྒྱུ་མཚན་ - ཆུ་འདི་ ག་ར་གི་མི་ཚེ་གི་གཞི་རྩ་ཨིན།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'C1e'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-1-s1-c2', 5, null, null)
  returning id
)
insert into me_q select 'C2e', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C2e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C2e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C2e';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'translation', 'འོག་ལུ་ཨིང་སྐད་ནང་ཡོད་མི་ ཡིག་རྒྱུགས་འདི་ རྫོང་ཁའི་ཐོག་ལུ་ སྐད་སྒྱུར་འབད་དེ་ བྲིས། (སྐུགས་ ༡༥)

Bhutan is known around the world for its clean environment and its rich culture. The Constitution requires that at least sixty percent of the country remains under forest cover for all time. This is not only a law but also a responsibility that every citizen shares.

Young people have an important role to play. By reducing waste, planting trees and using water and electricity wisely, they can help protect the environment for future generations. Small actions, when taken by many people, can bring about great change.

Let us remember that the forests, rivers and mountains are a gift from our ancestors. It is our duty to protect them and hand them over to our children in an even better condition.', 'ལན་གྱི་དཔེ།

འབྲུག་འདི་ མཐའ་འཁོར་གཙང་མ་དང་ ལམ་སྲོལ་ཕྱུག་པོ་ཡོད་མི་ལུ་ འཛམ་གླིང་ཡོངས་ལུ་ གདོང་ཁ་བཀྲ་ཡོདཔ་ཨིན། རྩ་ཁྲིམས་ཀྱིས་ རྒྱལ་ཁབ་ཀྱི་ས་ཁོངས་ལས་ ཉུང་ཤོས་ བརྒྱ་ཆ་ དྲུག་ཅུ་ ནམ་ར་ཨིན་རུང་ ནགས་ཚལ་གྱིས་ ཁྱབ་དགོཔ་སྦེ་ བཀོད་ཡོདཔ་ཨིན། འདི་ ཁྲིམས་རྐྱངམ་ཅིག་མེན་པར་ མི་སེར་ག་རའི་ འགན་ཁུར་ཅིག་ཨིན།

ན་གཞོན་ཚུ་གི་ འགན་ཁུར་ གལ་ཆེཝ་ཨིན། ཁོང་གིས་ གད་སྙིགས་ཉུང་སུ་བཟོ་ནི་ ཤིང་འཛུགས་ནི་ ཆུ་དང་ གློག་མེ་ ཐྲིག་ཐྲིག་སྦེ་ ལག་ལེན་འཐབ་ནི་ཚུ་གིས་ མ་འོངས་མི་རབས་ཀྱི་དོན་ལུ་ མཐའ་འཁོར་ སྲུང་སྐྱོབ་འབད་ཚུགས། མི་ལེ་ཤ་གིས་ ལཱ་ཆུང་ཀུ་ཚུ་ འབད་བ་ཅིན་ འགྱུར་བ་ཆེན་པོ་ཅིག་ འབྱུང་ཚུགས།

ནགས་ཚལ་དང་ གཙང་ཆུ་ རི་བོ་ཚུ་ ཕམ་མེས་ཚུ་གིས་ བྱིན་མི་ ལེགས་སོད་ཅིག་ཨིན་ཟེར་ དྲན་དགོ། དེ་ཚུ་ སྲུང་སྐྱོབ་འབད་དེ་ ད་རུང་ ལེགས་ཤོམ་སྦེ་ ང་བཅས་ཀྱི་ ཨ་ལུ་ཚུ་ལུ་ ལག་ལེན་འབད་ནི་འདི་ ང་བཅས་ཀྱི་ འགན་ཁུར་ཨིན།', null, '[{"point": "དོན་ཚན་དང་པ་ - མཐའ་འཁོར་གཙང་མ་དང་ ལམ་སྲོལ། རྩ་ཁྲིམས་ ནགས་ཚལ་བརྒྱ་ཆ་ ༦༠། མི་སེར་ག་རའི་འགན་ཁུར།", "marks": 5}, {"point": "དོན་ཚན་གཉིས་པ་ - ན་གཞོན་གྱི་འགན་ཁུར། གད་སྙིགས་ཉུང་སུ་ ཤིང་འཛུགས་ ཆུ་དང་གློག་མེ། ལཱ་ཆུང་ཀུ་ལས་ འགྱུར་བ་ཆེན་པོ།", "marks": 5}, {"point": "དོན་ཚན་གསུམ་པ་ - ཕམ་མེས་ཀྱི་ལེགས་སོད། ཨ་ལུ་ཚུ་ལུ་ ལག་ལེན་འབད་ནི། ཡིག་སྦྱོར་དང་ དོན་མ་ཤོར་བར།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'translation'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 15,
    1620, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'T1'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha written by Claude: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'T1s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 6.0, 1 from me_q where key = 'T1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 4.0, 2 from me_q where key = 'T1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 5.0, 3 from me_q where key = 'T1s';
commit;
