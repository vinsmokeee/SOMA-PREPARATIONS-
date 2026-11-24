-- ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'), 'comprehension', 'Comprehension' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'), 'essay', 'Essay' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'), 'formal-writing', 'Formal writing' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'), 'general-knowledge', 'General knowledge' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'), 'translation', 'Translation' on conflict (subject_id, slug) do nothing;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-dzongkha-1') and subject_group_id is not distinct from null;
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-dzongkha-1'), null, null, 1, 'Question 1: Essay (འབྲི་རྩོམ།)', 'essay', 2, 20, 1, 'BCSE 2025 Main Examination, Dzongkha category, Paper I');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-dzongkha-1'), null, null, 2, 'Question 2: Formal writing (ཡིག་བསྐུར་རྣམ་གཞག།)', 'long_answer', 2, 15, 1, 'BCSE 2025 Main Examination, Dzongkha category, Paper I');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-dzongkha-1'), null, null, 3, 'Question 3: Comprehension (གོ་བ་ལེན་ནི།)', 'passage', 1, 15, null, 'BCSE 2025 Main Examination, Dzongkha category, Paper I');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-dzongkha-1'), null, null, 4, 'Question 4: Translation (སྐད་སྒྱུར།)', 'translation', 1, 20, null, 'BCSE 2025 Main Examination, Dzongkha category, Paper I');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-dzongkha-1'), null, null, 5, 'Question 5 (a): General knowledge (སྤྱིར་བཏང་ཤེས་ཡོན།)', 'short_answer', 10, 2, null, 'BCSE 2025 Main Examination, Dzongkha category, Paper I');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-dzongkha-1'), null, null, 6, 'Question 5 (b): General knowledge, multiple choice', 'mcq', 10, 1, null, 'BCSE 2025 Main Examination, Dzongkha category, Paper I');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'essay', 'འོག་ལུ་དྲི་བ་ ཀ་དང་ཁ་སྦེ་ གཉིས་ཡོད་ས་ལས་ གང་རུང་ཅིག་གདམ་ཁ་རྐྱབ་སྟེ་ ཚིག་འབྲུ་ ༤༥༠-༥༠༠ གི་ནང་འཁོད་ལུ་བཅུད་བསྡུ་བའི་འབྲི་རྩོམ་ཅིག་བྲི། (སྐུགས་ ༢༠)

ད་ལྟོ་ཚུན་ཚོད་འབྲུག་པའི་ན་གཞོན་ཚུ་ ཕྱི་རྒྱལ་ཁབ་ལས་ཕར་ཤེས་ཡོན་སྦྱང་ནི་དང་ ལཱ་གཡོག་གི་གོ་སྐབས་འཚོལ་ཏེ་འགྱོ་མི་ལེ་ཤ་ཐོན་ཡོདཔ་མ་ཚད་ ད་ལས་ཕར་ཡང་འཕོ་མཐུད་དེ་འཐོན་ནི་ཨིནམ་ལས་ ཁྱོད་ཀྱིས་འབད་བ་ཅིན་ ཁོང་དེ་བཟུམ་སྦེ་འགྱོཝ་ད་ མ་འོངས་པ་ན་ ང་བཅས་རའི་རྒྱལ་ཁབ་ལུ་ཁེ་ཕན་ག་ཅི་འབྱུང་ནི་ཨིན་ན་དང་། དེ་བཟུམ་སྦེ་ གནོད་པ་ཡང་ག་ཅི་ར་འབྱུང་སྲིད་ནི་ཨིན་ན་ཚུ་གི་སྐོར་ལས་ ཁྱོད་རའི་སེམས་ཁར་ཤར་མི་ཅིག་ འཆར་སྣང་འབྲི་རྩོམ་སྦེ་བྲིས།', 'ལན་གྱི་དཔེ་ (outline)

མགོ་བཙུགས། ལོ་ཤས་ཀྱི་རིང་ལུ་ འབྲུག་པའི་ན་གཞོན་ ལེ་ཤ་ཅིག་ ཨས་ཊེ་ལི་ཡ་ དང་ ཀེ་ན་ཌ་ ལ་སོགས་པའི་ ཕྱི་རྒྱལ་ཁབ་ཚུ་ནང་ ཤེས་ཡོན་སྦྱང་ནི་དང་ ལཱ་གཡོག་འཚོལ་ནི་ལུ་ འགྱོ་ཡོདཔ་ཨིན།

ཁེ་ཕན།
༡. ཕྱི་རྒྱལ་ལས་ དངུལ་འབབ་ ནང་སོ་ལུ་ གཏང་མི་ལས་བརྟེན་ བཟའ་ཚང་དང་ རྒྱལ་ཁབ་ཀྱི་ དཔལ་འབྱོར་ལུ་ ཕན་ཐོགས་འབྱུངམ་ཨིན།
༢. ལག་ཤེས་ ཤེས་ཡོན་ དེ་ལས་ ལཱ་གི་ལམ་ལུགས་གསརཔ་ཚུ་ སྦྱང་ཚུགས།
༣. ལོག་འོངམ་ད་ ཉམས་མྱོང་ཚུ་ ཚོང་ལཱ་དང་ ཞབས་ཏོག་ནང་ ལག་ལེན་འཐབ་ཚུགས།

གནོད་པ།
༡. སྨན་པ་ སློབ་དཔོན་ བཟོ་རིག་པ་ལ་སོགས་པའི་ ཤེས་ཚད་ཅན་གྱི་ ལཱ་གཡོག་པ་ མ་ལང་མི།
༢. གཡུས་ཚན་ཚུ་ནང་ རྒས་ཤོས་ཚུ་རྐྱངམ་ཅིག་ལུས་ཏེ་ ཞིང་ས་སྤང་སྦེ་ ལུས་མི།
༣. ཕྱི་རྒྱལ་ནང་ཚར་མི་ ཨ་ལུ་ཚུ་གིས་ རྫོང་ཁ་དང་ ལམ་སྲོལ་ ཉམས་ནིའི་ཉེན་ཁ།

འཆར་སྣང་། གཞུང་གིས་ ནང་སོ་ལུ་ ལཱ་གཡོག་གི་གོ་སྐབས་ ཡར་སེང་གཏང་ནི་དང་ ཕྱི་རྒྱལ་ནང་ཡོད་མི་ འབྲུག་མི་ཚུ་དང་ ཉེ་འབྲེལ་བཞག་ནི། ལོག་འོང་མི་ཚུ་ལུ་ ལཱ་དང་ ཚོང་ལཱ་གི་གོ་སྐབས་བྱིན་ནི།

མཇུག་བསྡུ། ཕྱི་རྒྱལ་ལུ་འགྱོ་ནི་འདི་ གོ་སྐབས་ཅིག་ཨིན་རུང་ རང་སོའི་རྒྱལ་ཁབ་ལུ་ དམ་ཚིག་དང་ འགན་ཁུར་ བརྗེད་མ་ཚུགས།', null, '[{"point": "མགོ་བཙུགས། ན་གཞོན་ཚུ་ ཕྱི་རྒྱལ་ལུ་འགྱོ་མིའི་གནས་སྟངས་ (ཤེས་ཡོན་དང་ ལཱ་གཡོག་གི་དོན་ལུ།)", "marks": 3}, {"point": "ཁེ་ཕན་ (དངུལ་འབབ་ ནང་སོ་ལུ་གཏང་མི། ལག་ཤེས་དང་ ཉམས་མྱོང་གསརཔ། ལོག་འོངམ་ད་ རྒྱལ་ཁབ་ལུ་ ཞབས་ཏོག།)", "marks": 6}, {"point": "གནོད་པ་ (ལཱ་གཡོག་པ་ ཤེས་ཚད་ཅན་ མ་ལང་མི། གཡུས་ཚན་ སྟོངམ་ལུས་མི། སྐད་ཡིག་དང་ ལམ་སྲོལ་ ཉམས་ནིའི་ཉེན་ཁ།)", "marks": 6}, {"point": "ཁྱོད་རའི་འཆར་སྣང་དང་ ཐབས་ལམ་ (ཉེ་འབྲེལ་བཞག་ནི། ལོག་འོང་མི་ཚུ་ལུ་ གོ་སྐབས།)", "marks": 3}, {"point": "མཇུག་བསྡུ།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'essay'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'E1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 8.0, 1 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 5.0, 2 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 7.0, 3 from me_q where key = 'E1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'essay', 'འོག་ལུ་དྲི་བ་ ཀ་དང་ཁ་སྦེ་ གཉིས་ཡོད་ས་ལས་ གང་རུང་ཅིག་གདམ་ཁ་རྐྱབ་སྟེ་ ཚིག་འབྲུ་ ༤༥༠-༥༠༠ གི་ནང་འཁོད་ལུ་བཅུད་བསྡུ་བའི་འབྲི་རྩོམ་ཅིག་བྲི། (སྐུགས་ ༢༠)

འབྲུག་རྒྱལ་ཁབ་ནང་ ཧེ་མ་ཆོས་སྲིད་ལུགས་གཉིས་ཀྱི་བསྟན་པ་མ་དར་བའི་སྐབས་ཀྱི་གནས་སྟངས་དང་། ཤུལ་ལས་དར་བའི་དར་ལུགས། དེ་གིས་ང་བཅས་རའི་རྒྱལ་ཁབ་འདི་ རང་དབང་རང་བཙན་སྦེ་གནས་ནི་ལུ་ ཕན་ཐབས་ག་དེ་སྦེ་བྱུང་ཡོདཔ་ཨིན་ནའི་ལོ་རྒྱུས་ཚུ་ བདེན་གཏམ་གཟང་ཐོག་ལས་ རྒྱས་བཤད་འབྲི་རྩོམ་ཡིད་ཚིམ་ཏོག་ཏོ་ཅིག་བྲིས།', 'ལན་གྱི་དཔེ་ (outline)

མགོ་བཙུགས། ཆོས་སྲིད་ལུགས་གཉིས་ མ་དར་བའི་ཧེ་མ་ འབྲུག་ནང་ ས་གནས་རེ་རེ་ལུ་ དཔོན་པོ་དང་ བླ་མ་ སོ་སོར་ཡོདཔ་ལས་ མཐུན་སྒྲིལ་དང་ གཅིག་ཁྱབ་ཀྱི་ གཞུང་ མེདཔ་ཨིན། ཕྱི་ཕྱོགས་ལས་ དམག་འཁྲུག་ཡང་ བྱུང་ནི་ཨིན།

དར་ལུགས། སྤྱི་ལོ་ ༡༦༡༦ ལུ་ ཞབས་དྲུང་ངག་དབང་རྣམ་རྒྱལ་ འབྲུག་ལུ་ ཕེབས་ཏེ་ ཆོས་སྲིད་ལུགས་གཉིས་ཀྱི་ ལམ་ལུགས་ གཞི་བཙུགས་གནང་ནུག། ཆོས་ཀྱི་ཕྱོགས་ལས་ རྗེ་མཁན་པོ་དང་ ཞུང་གྲྭ་ཚང་། སྲིད་ཀྱི་ཕྱོགས་ལས་ སྡེ་སྲིད་ཀྱིས་ འཛིན་སྐྱོང་འཐབ་ནི། རྫོང་ཚུ་ ཆོས་དང་སྲིད་གཉིས་ཀྱི་ ལྟེ་བ་སྦེ་ བཞེངས་གནང་ནུག། ཁྲིམས་ཡིག་ཡང་ བཀོད་གནང་ནུག།

ཕན་ཐབས།
༡. ས་གནས་སོ་སོ་ མཐུན་སྒྲིལ་ཏེ་ རྒྱལ་ཁབ་གཅིག་ ཆགས་ཏེ་ ཕྱི་ཕྱོགས་ཀྱི་ དམག་འཁྲུག་ཚུ་ལས་ རྒྱལ་ཁ་ཐོབ་ནུག།
༢. ཆོས་དང་ ལམ་སྲོལ་ སྐད་ཡིག་ཚུ་ ངོ་རྐྱང་སྦེ་ བཞག་ཚུགས་ཏེ་ རང་དབང་རང་བཙན་གྱི་ གཞི་རྩ་ ཆགས་ནུག།
༣. སྤྱི་ལོ་ ༡༩༠༧ ལུ་ རྒྱལ་བརྒྱུད་ གཞི་བཙུགས་འབད་ཞིནམ་ལས་ ད་ལྟོ་བར་ ཆོས་སྲིད་ཟུང་འབྲེལ་ཐོག་ལས་ རྒྱལ་ཁབ་ བདེ་སྐྱིད་དུ་ གནས་ཡོདཔ་ཨིན།

མཇུག་བསྡུ། ཆོས་སྲིད་ལུགས་གཉིས་འདི་ འབྲུག་གི་ རང་དབང་རང་བཙན་གྱི་ རྩ་བ་ཨིན།', null, '[{"point": "ཆོས་སྲིད་ལུགས་གཉིས་ མ་དར་བའི་ཧེ་མའི་གནས་སྟངས་ (ས་གནས་ཀྱི་ དཔོན་པོ་ ལ་ལུ་ སོ་སོར་ཡོདཔ། ཕྱི་ལས་ དམག་འཁྲུག།)", "marks": 5}, {"point": "ཞབས་དྲུང་ངག་དབང་རྣམ་རྒྱལ་ སྤྱི་ལོ་ ༡༦༡༦ ལུ་ ཕེབས་ཏེ་ ཆོས་སྲིད་ལུགས་གཉིས་ གཞི་བཙུགས་གནང་བའི་ ལོ་རྒྱུས་ (རྫོང་ཚུ། ཞུང་གྲྭ་ཚང་། སྡེ་སྲིད།)", "marks": 6}, {"point": "རང་དབང་རང་བཙན་ལུ་ ཕན་ཐབས་ (མཐུན་སྒྲིལ། ཕྱི་ཕྱོགས་ཀྱི་དམག་ལས་ རྒྱལ་ཁ། ཁྲིམས་ཡིག་ ཐུགས་དམ་ ངོ་རྐྱང་།)", "marks": 6}, {"point": "མཇུག་བསྡུ། ད་ལྟོ་ ཆོས་སྲིད་ཟུང་འབྲེལ་ དང་ རྒྱལ་པོ་ཚུ་གི་ ཕྱག་ལཱ།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'essay'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'E2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 8.0, 1 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 5.0, 2 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 7.0, 3 from me_q where key = 'E2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'འོག་ལུ་དྲི་བ་ ཀ་དང་ཁ་སྦེ་ གཉིས་ཡོད་ས་ལས་ ག་འབད་རུང་ཅིག་གདམ་ཁ་རྐྱབ་ཞིནམ་ལས་ ཚིག་སྦྱོར་ཕུན་སུམ་ཚོགས་པའི་ཁར་དོན་གྱི་གནད་འགག་ཚངམ་སྦེ་ཡོད་པའི་ ཡི་གུ་ཚད་ལྡན་ཅིག་བྲི་དགོ། (སྐུགས་ ༡༥)

བུམ་ཐང་རྫོང་ཁག་ ཆོས་འཁོར་རྒེད་འོག་ གཡུས་ཟངས་གླིང་ལས་ ངོ་སྤྲོད་ལག་ཁྱེར་ཨང་ ༡༡༢༢༣༣༤༤༥༦༧ ཅན་མ་འཆང་མི་ཨཔ་དཀར་གསལ་ཟླ་བ་གིས་ སྤ་རོ་རྫོང་ཁག་ ཤར་པ་རྒེད་འོག་ གཡུས་གསེར་གླིང་ནང་ལས་ ངོ་སྤྲོད་ལག་ཁྱེར་ཨང་༢༢༣༣༤༤༥༥༦༧༨ ཅན་མ་འཆང་མི་ཨམ་ཡིད་འཕོག་ལྷ་མོ་ལས་ སྒེར་འཁོར་ཊོའི་ཊ་ཀཱར་ཐོ་བཀོད་ཨང་ BP-1-B1122 ཅན་མ་ཅིག་ གོང་ཚད་དངུལ་ཀྲམ་ས་ཡ་གཅིག་སྦེ་ཉོ་ནི་གུར་བོ་བསྒྲིགས་ཡོདཔ་ལས་བརྟེན་ ནངས་པ་གནངས་ཚེ་སྤྱི་ཚེས་ ༢༥/༡༠/༢༠༢༥ལུ་སྣུམ་འཁོར་དང་རིན་གོང་ ཕར་ཚུར་སྤྲོད་ལེན་འབད་ནི་གི་དུས་སྟབས་བཟོ་སྟེ་འདུག། དེ་བསྒང་ཁྱོད་ཀྱིས་ཁོང་ར་ཕན་གཉིས་ཀྱི་བར་ན་ སྤྱི་མཐུན་གྱི་དཔང་པོ་སྦེ་ ཨམ་ཡིད་འཕོག་ལྷ་མོའི་ཟླ་རོགས་ངོ་སྤྲོད་ལག་ཁྱེར་ཨང་ ༣༣༡༡༢༢༠༠༡༢༣ ཅན་མ་འཆང་མི་ཨཔ་རྒྱ་བོ་བཙུགས་ཐོག་ལས་ ཁྲིམས་མཐུན་གྱི་ཉོ་བཙོང་གན་རྒྱ་ ན་འཐན་ཏོག་ཏོ་ཅིག་བཟོ།', 'ཉོ་བཙོང་གན་རྒྱ།

ཚེས་གྲངས། ༢༥/༡༠/༢༠༢༥

༡. བཙོང་མི་ (ཕྱོགས་དང་པ)༽ ཨམ་ཡིད་འཕོག་ལྷ་མོ། ངོ་སྤྲོད་ལག་ཁྱེར་ཨང་ ༢༢༣༣༤༤༥༥༦༧༨། སྤ་རོ་རྫོང་ཁག་ ཤར་པ་རྒེད་འོག་ གཡུས་གསེར་གླིང་།
༢. ཉོ་མི་ (ཕྱོགས་གཉིས་པ)༽ ཨཔ་དཀར་གསལ་ཟླ་བ། ངོ་སྤྲོད་ལག་ཁྱེར་ཨང་ ༡༡༢༢༣༣༤༤༥༦༧། བུམ་ཐང་རྫོང་ཁག་ ཆོས་འཁོར་རྒེད་འོག་ གཡུས་ཟངས་གླིང་།

ཉོ་བཙོང་གི་ ཆ་རྐྱེན།
༡. ཕྱོགས་དང་པ་གིས་ སྒེར་འཁོར་ ཐོ་བཀོད་ཨང་ BP-1-B1122 ཅན་མ་འདི་ ཕྱོགས་གཉིས་པ་ལུ་ བཙོང་ནི་ཨིན།
༢. རིན་གོང་ དངུལ་ཀྲམ་ ས་ཡ་གཅིག་ (༡༠༠༠༠༠༠) འདི་ ཕྱོགས་གཉིས་པ་གིས་ ད་རིས་ ཆ་ཚང་ སྤྲོད་ཡི།
༣. ཕྱོགས་དང་པ་གིས་ སྣུམ་འཁོར་དང་ ལྡེ་མིག་ ཡིག་ཆ་ག་ར་ ད་རིས་ སྤྲོད་ཡི། ཐོ་བཀོད་ ཕྱོགས་གཉིས་པའི་མིང་ཐོ་ཁར་ སྤོ་ནིའི་ལཱ་ཚུ་ ཕྱོགས་གཉིས་ཆ་རའི་ མཉམ་རུབ་ཐོག་ལས་ འབད་ནི།
༤. ད་རིས་ཚུན་ཚོད་ སྣུམ་འཁོར་ལུ་ ཡོད་པའི་ བུ་ལོན་དང་ ཁྲིམས་ཀྱི་ གནད་དོན་ག་ར་ ཕྱོགས་དང་པ་གི་ འགན་ཁུར་ཨིན།
༥. གན་རྒྱ་འདི་ ཕྱོགས་གཉིས་ཆ་ར་གིས་ ཐུགས་མཐུན་ཐོག་ལས་ བཟོ་ཡི།

ཕྱོགས་དང་པའི་ མཚན་རྟགས། .............   ཕྱོགས་གཉིས་པའི་ མཚན་རྟགས། .............
དཔང་པོ། ཨཔ་རྒྱ་བོ། ངོ་སྤྲོད་ལག་ཁྱེར་ཨང་ ༣༣༡༡༢༢༠༠༡༢༣། མཚན་རྟགས། .............', null, '[{"point": "མགོ་མིང་ (ཉོ་བཙོང་གན་རྒྱ།) དང་ ཚེས་གྲངས།", "marks": 2}, {"point": "ཕྱོགས་གཉིས་ཀྱི་ ངོ་སྤྲོད་ (མིང་། ངོ་སྤྲོད་ལག་ཁྱེར་ཨང་། སྡོད་གནས།)", "marks": 3}, {"point": "སྣུམ་འཁོར་གྱི་ ཁ་གསལ་ (ཐོ་བཀོད་ཨང་ BP-1-B1122)", "marks": 2}, {"point": "རིན་གོང་ (དངུལ་ཀྲམ་ ས་ཡ་ ༡) སྤྲོད་ལེན་དང་ དུས་ཚོད་ (༢༥/༡༠/༢༠༢༥)", "marks": 3}, {"point": "ཆ་རྐྱེན་ (ཐོ་བཀོད་སྤོ་ནི། སྐྱོན་ཆ་ ཡོད་མེད།) དང་ ཕྱོགས་གཉིས་དང་ དཔང་པོའི་ མཚན་རྟགས།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'formal-writing'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'L1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 6.0, 1 from me_q where key = 'L1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 4.0, 2 from me_q where key = 'L1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 5.0, 3 from me_q where key = 'L1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'འོག་ལུ་དྲི་བ་ ཀ་དང་ཁ་སྦེ་ གཉིས་ཡོད་ས་ལས་ ག་འབད་རུང་ཅིག་གདམ་ཁ་རྐྱབ་ཞིནམ་ལས་ ཚིག་སྦྱོར་ཕུན་སུམ་ཚོགས་པའི་ཁར་དོན་གྱི་གནད་འགག་ཚངམ་སྦེ་ཡོད་པའི་ ཡི་གུ་ཚད་ལྡན་ཅིག་བྲི་དགོ། (སྐུགས་ ༡༥)

རྒེད་འོག་ཁག་གི་ མཐའ་ཟུར་གཡུས་ཚན་ཚུ་ནང་ལས་ཕར་ འཚོ་བ་སོ་ནམ་དང་སྒོ་ནོར་ལུ་བརྟེན་སྡོད་མི་ཚུ་ ལཱ་ག་དེམ་ཅིག་ར་འགེངས་འབད་རུང་ རི་དྭགས་སེམས་ཅན་གྱི་གནོད་པ་བཀག་མ་ཚུགས་པར་ མཐའ་མཇུག་ལུ་གྱོང་རྒུད་སྦོམ་སྦེ་ཕོགཔ་ལས་བརྟེན་ མི་སེར་ཚུ་སོ་ནམ་དང་སྒོ་ནོར་གྱི་ལཱ་འབད་ནི་ལུ་ ངམ་ངམ་ཤུགས་ཀྱིས་སྤྲོ་བ་ཞན་ཏེ་ ས་གཞི་སྤང་སྦེ་བཀོ་བཞགཔ་ཨིན་མས། གནད་དོན་དེ་ལུ་ཁྱོད་ར་རྒེད་འོག་གི་རྒཔོ་ཚ་རྒྱས་ཅན་ཅིག་ཨིནམ་བཟོ་སྟེ་ སོ་ནམ་དང་སྒོ་ནོར་ལྷན་ཁག་གི་བོན་པོ་ལུ་དེ་བཟུམ་གྱི་ཚབས་ཆེན་གྱི་དཀའ་ངལ་ཚུ་ འཕལ་མགྱོགས་ར་གཞུང་ལྟེ་བ་ལས་སེལ་ཐབས་མཛད་གནང་དགོ་པའི་ཞུ་ཡིག་ཅིག་སྔར་སྲོལ་ལམ་ལུགས་ལྟར་དུ་བྲིས།', 'ཕུལ་ས། སོ་ནམ་དང་སྒོ་ནོར་ལྷན་ཁག་གི་ བོན་པོ་མཆོག། ཐིམ་ཕུ།

ཞུ་དོན། རི་དྭགས་ཀྱི་གནོད་པ་ལས་ སོ་ནམ་སྲུང་སྐྱོབ་ཀྱི་ ཐབས་ལམ་ མཛད་གནང་དགོ་པའི་ཞུ་ཡིག།

གོང་འོག་ཏུ་ ཞུ་དོན་ནི་ ང་ རྒེད་འོག་འདི་གི་ རྒཔོ་ཨིན་མི་འདི་གིས་ མཐའ་ཟུར་གཡུས་ཚན་ཚུ་ནང་ལས་ མི་སེར་ཚུ་ སོ་ནམ་དང་སྒོ་ནོར་ལུ་ བརྟེན་སྡོད་ཡོདཔ་ཨིན། ལཱ་ག་དེམ་ཅིག་ར་ འབད་རུང་ ཕག་རྒོད་ སྤྲེའུ་ ཟེར་ ལ་སོགས་པའི་ རི་དྭགས་ཚུ་གིས་ ལོ་ཐོག་དང་ ཕྱུགས་ཚུ་ལུ་ གནོད་པ་སྦོམ་སྦེ་ བཏང་སྟེ་ གྱོང་རྒུད་ ཕོགཔ་ལས་ མི་སེར་ཚུ་ སྤྲོ་བ་ཞན་ཏེ་ ཞིང་ས་ ལེ་ཤ་ཅིག་ སྤང་སྦེ་ བཞག་ཡོདཔ་ཨིན།

དེ་འབདཝ་ལས་ གཞུང་ལྟེ་བ་ལས་ (༡) ཞིང་ཁ་ཚུ་ལུ་ གློག་རིག་ར་བ་ བཙུགས་ནིའི་ མཐུན་རྐྱེན་ (༢) རི་དྭགས་ཀྱི་ གྱོང་རྒུད་ཀྱི་ གསོ་ཐབས་ (༣) ཞིང་སྲུང་གི་ ལམ་སྟོན་དང་ ལག་ཤེས་ཚུ་ འཕལ་མགྱོགས་ར་ མཛད་གནང་དགོ་པའི་ ཞུ་བ་ཕུལ་ཡི།

ཚེས་གྲངས། .............
ཞུ་ཡིག་ཕུལ་མི། ............. རྒཔོ། ............. རྒེད་འོག། མཚན་རྟགས། .............', null, '[{"point": "སྔར་སྲོལ་གྱི་ ཞུ་ཡིག་རྣམ་གཞག་ (ཕུལ་ས་ བོན་པོ་མཆོག། ཞུ་དོན། ཚེས་གྲངས། མཚན་རྟགས།)", "marks": 4}, {"point": "དཀའ་ངལ་ཁ་གསལ་ (རི་དྭགས་ཀྱི་གནོད་པ། གྱོང་རྒུད། ས་གཞི་སྤང་སྦེ་བཞག་མི།)", "marks": 4}, {"point": "ཞུ་བ་ཁ་གསལ་ (གློག་རིག་ར་བ། ཞིང་སྲུང་། མཐུན་རྐྱེན་དང་ གྱོང་རྒུད་ཀྱི་ གསོ་ཐབས།)", "marks": 4}, {"point": "ཞེ་ས་དང་ བརྩི་བཀུར་གྱི་ ཚིག་སྦྱོར།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'formal-writing'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'L2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 6.0, 1 from me_q where key = 'L2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 4.0, 2 from me_q where key = 'L2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 5.0, 3 from me_q where key = 'L2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ལྷག་ཞིནམ་ལས་ དྲི་བ་ག་ར་ལུ་ལན་བྲིས། དྲི་བ་རེ་ལུ་སྐུགས་ ༣ རེ།

ཆོས་དང་འཇིག་རྟེན་གཉིས་གཅིག་གིས་གཅིག་ལུ་ལྷན་ཐབས་འབད་ཚུགས་པའི་ཐབས་ཤེས་བསྒྲིག་དགོཔ།

༉ ང་བཅས་ར་འཛམ་བུ་གླིང་གི་རྒྱལ་ཁབ་མང་ཤོས་ཅིག་ནང་ ལུང་ཕྱོགས་དང་མི་རིགས་རང་རང་སོ་སོའི་ལས་སྐལ་དང་། སྲོལ་རྒྱུན། གོམས་གཤིས། ཁྲིམས་ལུགས་ལ་སོགས་པ་ཚུ་དང་འཁྲིལ་ཏེ་ ཕྱི་པ་དང་ནང་པ་གང་རུང་གི་ཆོས་ལུགས་ཅིག་གི་རྗེས་སུ་འབྲངས་ཏེ་ ཆོས་ལུགས་རང་སོའི་སྟོན་པ་དང་། ལྷ་ཚོགས། བླ་ཆེན་ཚུ་ལུ་དད་པ་བསྐྱེད་ནི་དང་། ཁོང་གི་གསུང་རབས་དང་ལམ་སྟོན་བསླབ་བྱ་ཚུ་ལུ་གནས་ཐོག་ལས་མི་ཚེ་སྐྱོང་ནི་འདི་ འགྲོ་བ་མི་རིགས་བརྒྱ་ཆ་དགུ་བཅུ་དེ་ཅིག་གི་ རང་བཞིན་བཟུམ་ཅིག་ལུ་གྱུར་ཏེ་ཡོདཔ་ཨིན། དེ་འབད་ནི་འདི་གིས་ ལུང་ཕྱོགས་དང་མི་རིགས་ག་ཅི་བཟུམ་ཅིག་ར་ཨིན་རུང་ མི་མང་ཤོས་ཀྱི་མི་ཚེ་ཅིག་གི་ཀུན་སྤྱོད་བཟང་ངན་གྱི་ཐད་ཁར་ཡང་ གཙོ་ཆེ་ཤོས་ཅིག་ རང་སོའི་ཆོས་ལུགས་ནང་ལས་ཐོན་མི་གི་ ལམ་སྟོན་བསླབ་བྱ་དང་ལྟ་གྲུབ་ཚུ་ནང་ ག་དེ་སྦེ་བཤད་ཡོདཔ་ཨིན་ན་ དེ་དང་འཁྲིལ་ཏེ་འོངམ་ཨིན་མས།

དེ་འབདཝ་ད་འཛམ་གླིང་ནང་མིའི་སྤྱི་ཚོགས་ གནས་ཐབས་དང་འཚོ་ཐབས་ཀྱི་མཐུན་རྐྱེན་ཆ་ཚང་དཀའ་ངལ་མེདཔ་ཅིག་ ཆོས་ལུགས་ལས་འབྱུང་ཚུགས་ག་ཟེར་བ་ཅིན་ འབྱུང་མི་ཚུགས། ག་ཅི་སྦེ་ཟེར་བ་ཅིན་ ཕྱི་ནང་གི་ཆོས་ལུགས་ག་ཅི་ནང་འབད་རུང་ ལམ་སྟོན་བསླབ་བྱ་མང་ཤོས་ཅིག་ ཚོང་དང་སོ་ནམ་ལ་སོགས་པའི་འཇིག་རྟེན་ཁྱིམ་པའི་བྱ་གཞག་སྤང་དགོཔ་དང་ དགེ་སྡིག་བང་དོར་ལུ་གཙོ་བོ་བཏོན་དགོཔ་ཚུ་ཡོདཔ་ཨིན། དེ་ལས་བརྟེན་ཆོས་ཉག་རྐྱང་གི་ཐོག་ལས་ ཕྱིའི་དཔལ་འབྱོར་གོང་འཕེལ་བཏང་སྟེ་ མི་སྡེ་འཚོ་ཐབས་ཀྱི་མཐུན་རྐྱེན་བཟོ་ནིའི་ཐབས་ལམ་དཀོན་པའི་ཁར་ དུམ་གྲ་རེ་ཡོད་མི་ཚུ་གིས་ཡང་ མི་དམངས་སྤྱི་ཡོངས་ལུ་ཕན་ནུས་ཅན་ལུ་འགྱུར་ཚུགས་པར་ལཱ་ཁག་འོང་། ལྷག་པར་དུ་སྔར་ལས་ད་ཚུན་ ཆོས་ལུགས་མང་ཤོས་ཅིག་གི་ལྟ་བ་དང་གོམས་གཤིས་ནང་ལུ་ མི་དམངས་ཀྱིས་མཐུན་རྐྱེན་སྦྱར་ཏེ་ ཆོས་སྡེ་འཚོ་སྐྱོང་འཐབ་སྲོལ་ཡོདཔ་མ་གཏོགས་ ཆོས་སྡེ་གིས་མི་དམངས་ལུ་འཚོ་བའི་མཐུན་རྐྱེན་གནང་སྟེ་ གྲོགས་རམ་འབད་ནི་འདི་དཀོན་སུ་ཅིག་ཨིན་མས།

འཛམ་གླིང་ཤར་ནུབ་ཀྱི་རྒྱལ་ཁབ་མང་ཤོས་ཅིག་གི་ བྱུང་རབས་ལོ་རྒྱུས་ཚུ་ནང་བལྟ་བ་ཅིན་ འདས་པའི་དུས་རབས་ཚུ་ནང་ ཕྱི་ནང་གི་ཆོས་ལུགས་ཁག་གི་ཆོས་སྡེ་ལ་ལུ་ཅིག་གིས་ རྒྱལ་ཁབ་དང་སྤྱི་ཚོགས་སྐྱོང་ཡོད་པའི་ལོ་རྒྱུས་ཡོད་རུང་ མང་ཤོས་ཅིག་ར་མཐའ་མཇུག་ལུ་ མི་སེར་དམངས་ཀྱི་དགོས་མཁོ་བསྒྲུབ་མ་ཚུགས་པར་འཐུས་ཤོར་ཤོརཝ་དང་ མི་སེར་ལུ་དཀའ་སྡུག་མོང་བཅུག་བཅུགཔ་ཙང་ཙ་ར་ཨིན་མས། དེ་ཡང་རྒྱུ་མཚན་གཙོ་བོ་ར་ ཆོས་དང་འཇིག་རྟེན་གྱི་གནད་དོན་ཡོངས་རོགས་ འཛིན་སྐྱོང་གཅིག་གིས་སླ་བསྲེ་རྐྱབ་འབད་དགོ་པ་ཅིན་ ཧ་ལམ་ཆོས་ནང་ལས་ཐོན་མི་སྤང་བྱ་དང་བང་བྱ་ཚུ་ཡང་ ག་ར་དབྱེ་བ་མེད་པར་འབད་དགོཔ་ངེས་ཏིག་ཨིན་རུང་ ཆོས་སྡེ་ཚུ་གིས་ཆོས་ལུགས་གོང་འཕེལ་དང་དར་ཁྱབ་གུར་ གཙོ་བོ་བཏོན་སུ་ཅིག་མཛད་ཡོད་པའི་རྒྱུ་རྐྱེན་ལས་བརྟེན་ཏེ་བྱུང་ནུག། མ་གཞི་འཛམ་བུ་གླིང་ནང་ སྔོན་མ་སྔོན་མ་ར་འདི་ ཤེས་ཡོན་དང་སྒྲིག་གཞི་ལམ་ལུགས་ག་ཅི་འབད་རུང་ གཙོ་བོ་གཞི་ར་ཆོས་སྡེའི་ལམ་ལུགས་ལས་མ་གཏོགས་ འབྱུང་ཁུངས་ལོགས་སུ་ཅིག་མེདཔ་ལས་ ད་ལྟོའི་སྲིད་ཀྱི་འཛིན་སྐྱོང་ལམ་ལུགས་ཚུ་ཡང་ ག་ར་ཆོས་སྡེའི་སྒྲིག་གཞི་ལམ་ལུགས་ལས་ར་མཆེད་མཆེདཔ་ཨིནམ་སྦེ་བཤདཔ་མས།

ག་དེ་སྦེ་ཨིན་རུང་ ང་བཅས་རའི་རྒྱལ་ཁབ་ནང་བཟུམ་ཅིག་འབད་བ་ཅིན་ དཔལ་ལྡན་འབྲུག་པ་ཞབས་དྲུང་ངག་དབང་རྣམ་རྒྱལ་གྱིས་དབུ་གཙོས་པའི་སྔོན་བྱོན་རྒྱལ་བ་གོངམ་ མ་འོངས་མངོན་གཟིགས་ཅན་དང་བཀའ་དྲིན་ཅན་ཚུ་གིས་ ཆོས་སྲིད་ཟུང་འབྲེལ་གྱི་ལམ་ལུགས་གཞི་བཙུགས་གནང་སྟེ་ ཆོས་དང་སྲིད་ག་ར་སླ་བསྲེ་རྐྱབ་མ་དགོ་པར་ ཆོས་འདི་ཆོས་འབད་མི་གིས་འཛིན་སྐྱོང་གནང་ནི་དང་། རྒྱལ་སྲིད་འདི་སྲིད་ཀྱི་ཕྱག་ལཱ་གནང་མི་ ཁྱིམ་པ་དཔོན་གཡོག་ཚུ་གིས་འཛིན་སྐྱོང་འཐབ་ནི་སྦེ་སྲོལ་བཙུགས་གནང་ནུག། དེ་ལས་བརྟེན་ང་བཅས་རའི་རྒྱལ་ཁབ་ནང་ ད་ལྟོ་བར་ན་ཡང་ མི་སེར་ཡོངས་ཀྱི་སྐྱིད་སྡུག་གི་ཕམ་ དཔལ་མི་དབང་ཡབ་སྲས་ཚུ་གི་མངའ་འོག་ལུ་ ཆོས་དང་སྲིད་ཀྱི་འཛིན་སྐྱོང་ལམ་ལུགས་ག་ར་ གཅིག་གིས་གཅིག་ནང་ལགཔ་རྐྱབ་མ་དགོ་པར་ དམ་ཆོས་སངས་རྒྱས་ཀྱི་བཀའ་དང་མཐུན་པའི་ཁར་ རྒྱལ་སྲིད་རྒྱལ་སྤྱིའི་གནས་ཚད་དང་མཐུན་པའི་སྒོ་ལས་ ཆོས་དང་འཇིག་རྟེན་གྱི་ས་མཚམས་ག་ར་ ཧིང་སང་ས་སྦེ་དབྱེ་བ་ཕྱེས་ཏེ་ འཛིན་སྐྱོང་ལམ་ལུགས་བྱ་སྟབས་བདེ་ཏོག་ཏོ་སྦེ་ཡོདཔ་ཨིན།

སྤྱིར་བཏང་ཆོས་དང་ར་ལས་མ་འདྲེས་པར་ འགྲོ་བ་མིའི་སྤྱི་ཚོགས་ཞི་བདེ་དང་དགའ་སྐྱིད་ཀྱི་ངང་ལུ་ གནས་ཚུགས་ག་ཟེར་བ་ཅིན་ དེ་ཡང་གནས་སྟངས་ག་ཅིའི་ཆ་ལས་མནོ་བསམ་བཏང་རུང་ ལཱ་ཁག་ཨིན་མས། ད་ལྟོ་ཕྱི་རྒྱལ་ཁབ་ལ་ལུ་ཅིག་ནང་ ཆོས་ལུགས་དང་མ་འདྲེས་པའི་འཛིན་སྐྱོང་ལམ་ལུགས་ཡོད་མི་ཚུ་གི་ གནས་སྟངས་ལུ་བལྟ་རུང་ཧ་གོ་ཚུགས་པས། དེ་ཡང་ག་ཅི་སྦེ་ཨིན་ན་ཟེར་བ་ཅིན་ ང་བཅས་ར་མི་ག་ར་ལུ་དགོ་མི་འདི་བདེ་བ་དང་ མ་དགོ་མི་འདི་སྡུག་བསྔལ་ཨིན་ཟེར་མི་འདི་ བརྒྱ་ཆ་བརྒྱ་བདེན་པ་བདེན་རྐྱང་ཨིན། ང་བཅས་ཆ་ཁྱབ་གནས་སྡོད་སའི་ས་གོ་འདིནི་འཁོར་བ་ནང་ཨིནམ་ལས་ འཁོར་བ་འདི་སྡུག་བསྔལ་གྱི་སྡུག་བསྔལ་དང་། འགྱུར་བའི་སྡུག་བསྔལ། ཁྱབ་པ་འདུ་བྱེད་ཀྱི་སྡུག་བསྔལ་གསུམ་གྱི་ཚང་འབདཝ་ལས་བརྟེན་ རང་གིས་མོང་ནིའི་དང་འདོད་མེད་རུང་ མི་དྲག་ཞན་ཆེ་ཆུང་མེད་པ་ག་ར་ལུ་དཀའ་ངལ་དང་སྡུག་བསྔལ་རྣམ་པ་སྣ་ཚོགས་ རང་བཞིན་ཤུགས་ཀྱིས་འཁོར་འོང་ནི་འདི་ ཀུན་གྱིས་དངོས་སུ་མཐོང་ས་དང་ཚོར་བའི་ཉམས་མོང་ཅིག་ཨིན།

དཔེར་ན། མི་སྡེའི་འཚོ་སྐྱོང་དང་འབྲེལ་བའི་ཉེར་མཁོའི་མཐུན་རྐྱེན་དང་། འཁོར་ལམ་དང་སྐྱེལ་འདྲེན་ལ་སོགས་པའི་གཞི་རྟེན་མཐུན་རྐྱེན་ཚུ་མ་ལངས་པའི་དཀའ་ངལ་གྱི་རིགས་ཨིན་པ་ཅིན་འདི་ ཕྱི་དངོས་པོའི་དཔལ་འབྱོར་གོང་འཕེལ་གྱི་ཐོག་ལས་ ཧ་ལམ་ཅིག་བསལ་ཚུགས་པས། དེ་འབདཝ་ད་མི་སྤྱིར་བཏང་ལུ་ ནང་སེམས་ཁམས་དང་འབྲེལ་བའི་དཀའ་ངལ་དང་སྡུག་བསྔལ་མང་སུ་འཐོནམ་ཨིནམ་ལས་ དེ་ལུ་སྨན་བཅོས་ཀྱི་ལྷན་ཐབས་སྦེ་ གདོང་ལེན་འབད་ནིའི་ཐབས་ལམ་དྲག་ཤོས་ཅིག་ ཕྱི་ནང་གི་ཆོས་ལུགས་ཁག་དང་ ལྷག་པར་དུ་ནང་ཆོས་ཀྱི་ལམ་སྟོན་བསླབ་བྱ་དང་ལྟ་གྲུབ་ཚུ་ནང་ཡོདཔ་ཨིན། དེ་འབདཝ་ལས་ ད་རེས་དུས་རབས་ཉི་ཤུ་ར་གཅིག་པའི་གནས་སྟངས་དང་བསྟུན་ ད་ལྟོ་འཛམ་གླིང་ནང་ཡོད་པའི་ ཕྱི་ནང་གི་ཆོས་ལུགས་ག་ར་གིས་ ཕན་ཚུན་གཅིག་གིས་གཅིག་ལུ་ གུས་ཞབས་དང་བརྩི་བཀུར་ཞུ་ཐོག་ལས་གཅིག་མཐུན་དང་མཉམ་འབྲེལ་གཙོ་བོར་བཏོན་ཏེ་ མི་སྡེ་དང་སེམས་ཅན་ཀུན་ལུ་ ཞི་བདེ་དང་དགའ་སྐྱིད་བྱིན་ཚུགས་པའི་ཐབས་ཤེས་སྟོན་དགོཔ་དང་། ཞབས་ཏོག་གནང་དགོཔ། མཐུན་རྐྱེན་བསྒྲིག་དགོཔ་ལ་སོགས་པའི་ཕྱག་འགན་ཚུ་བསྣམ་དགོཔ་ཡོདཔ་ཨིན་ནོ། །

༡༽ འཛམ་གླིང་ནང་མིའི་སྤྱི་ཚོགས་ གནས་ཐབས་དང་འཚོ་ཐབས་ཀྱི་མཐུན་རྐྱེན་ཆ་ཚང་དཀའ་ངལ་མེདཔ་ཅིག་ ཆོས་ལུགས་ལས་བྱུང་མ་ཚུགས་པའི་གནད་དོན་ག་ཅི་ཨིན་ན?', 'ཆོས་ལུགས་མང་ཤོས་ཅིག་གི་ ལམ་སྟོན་བསླབ་བྱ་ནང་ ཚོང་དང་སོ་ནམ་ལ་སོགས་པའི་ འཇིག་རྟེན་ཁྱིམ་པའི་བྱ་གཞག་ སྤང་དགོཔ་དང་ དགེ་སྡིག་བླང་དོར་ལུ་ གཙོ་བོ་བཏོན་དགོཔ་ཡོདཔ་ལས་ ཆོས་རྐྱངམ་ཅིག་གི་ཐོག་ལས་ ཕྱིའི་དཔལ་འབྱོར་ གོང་འཕེལ་གཏང་སྟེ་ མི་སྡེ་གི་ འཚོ་ཐབས་ཀྱི་ མཐུན་རྐྱེན་ བཟོ་ནིའི་ ཐབས་ལམ་ དཀོན་པས། དེ་མ་ཚད་ ཧེ་མ་ལས་ མི་དམངས་ཀྱིས་ ཆོས་སྡེ་ འཚོ་སྐྱོང་འཐབ་སྲོལ་ཡོདཔ་མ་གཏོགས་ ཆོས་སྡེ་གིས་ མི་དམངས་ལུ་ འཚོ་བའི་མཐུན་རྐྱེན་ གནང་མི་ དཀོན་པས།', null, '[{"point": "ཆོས་ལུགས་མང་ཤོས་ཅིག་གིས་ ཚོང་དང་སོ་ནམ་ལ་སོགས་པའི་ འཇིག་རྟེན་གྱི་བྱ་བ་ སྤང་དགོཔ་དང་ དགེ་སྡིག་ལུ་ གཙོ་བོ་བཏོན་མི།", "marks": 2}, {"point": "དེ་ལས་བརྟེན་ ཕྱིའི་དཔལ་འབྱོར་ གོང་འཕེལ་གཏང་ནིའི་ ཐབས་ལམ་ དཀོན་མི་དང་ མི་དམངས་ཀྱིས་ ཆོས་སྡེ་ འཚོ་སྐྱོང་འཐབ་སྲོལ་ཡོདཔ།", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, 'me-dzongkha-1-2025b1-q3', 1, null, null)
  returning id
)
insert into me_q select 'C1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', '༢༽ མི་མང་ཤོས་ཀྱི་ མི་ཚེ་ཅིག་གི་ཀུན་སྤྱོད་བཟང་ངན་གྱི་ཐད་ཁར་ གཙོ་ཆེ་ཤོས་ག་ཅི་དང་འཁྲིལ་ཏེ་འོངམ་ཨིན་ཟེརཝ་སྨོ?', 'མི་མང་ཤོས་ཀྱི་ ཀུན་སྤྱོད་བཟང་ངན་འདི་ གཙོ་བོ་ རང་སོའི་ཆོས་ལུགས་ནང་ལས་ ཐོན་མི་གི་ ལམ་སྟོན་བསླབ་བྱ་དང་ ལྟ་གྲུབ་ཚུ་ནང་ ག་དེ་སྦེ་ བཤད་ཡོདཔ་ཨིན་ན་ དེ་དང་འཁྲིལ་ཏེ་ འོངམ་ཨིན།', null, '[{"point": "རང་སོའི་ཆོས་ལུགས་ནང་ལས་ཐོན་མི་ ལམ་སྟོན་བསླབ་བྱ་དང་ ལྟ་གྲུབ་ཚུ་དང་འཁྲིལ་ཏེ་འོངམ་ཨིན།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, 'me-dzongkha-1-2025b1-q3', 2, null, null)
  returning id
)
insert into me_q select 'C2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', '༣༽ ད་ལྟོའི་སྲིད་ཀྱི་འཛིན་སྐྱོང་ལམ་ལུགས་ཚུ་ཡང་ ག་ར་ག་ཏེ་ལས་མཆེད་དེ་འོངས་འོངསམ་ཨིནམ་སྦེ་བཤདཔ་མས་ཟེར་བཀོད་ནུག?', 'འཛམ་གླིང་ནང་ སྔོན་མ་ ཤེས་ཡོན་དང་ སྒྲིག་གཞི་ལམ་ལུགས་ག་ར་ ཆོས་སྡེའི་ ལམ་ལུགས་ལས་ མ་གཏོགས་ འབྱུང་ཁུངས་ ལོགས་སུ་ མེདཔ་ལས་ ད་ལྟོའི་ སྲིད་ཀྱི་འཛིན་སྐྱོང་ལམ་ལུགས་ཚུ་ཡང་ ཆོས་སྡེའི་ སྒྲིག་གཞི་ལམ་ལུགས་ལས་ར་ མཆེད་མཆེདཔ་ཨིན་ཟེར་ བཀོད་ནུག།', null, '[{"point": "ཆོས་སྡེའི་ སྒྲིག་གཞི་ལམ་ལུགས་ལས་ མཆེད་མཆེདཔ་ཨིན།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, 'me-dzongkha-1-2025b1-q3', 3, null, null)
  returning id
)
insert into me_q select 'C3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', '༤༽ ནང་པའི་གསུང་རབ་ཚུ་ནང་ལས་འབད་བ་ཅིན་ སྡུག་བསྔལ་གྱི་སྡུག་བསྔལ་དང་། འགྱུར་བའི་སྡུག་བསྔལ། ཁྱབ་པ་འདུ་བྱེད་ཀྱི་སྡུག་བསྔལ་གསུམ་གྱི་ཚང་འདི་ ག་ཏེ་ཨིན་ཟེར་ངོས་འཛིན་འབད་ནུག?', 'སྡུག་བསྔལ་གསུམ་གྱི་ ཚང་འདི་ འཁོར་བ་ཨིན། ང་བཅས་ཆ་ཁྱབ་ གནས་སྡོད་སའི་ ས་གོ་འདི་ འཁོར་བ་ཨིནམ་ལས་ མི་དྲག་ཞན་ ཆེ་ཆུང་ ག་ར་ལུ་ དཀའ་ངལ་དང་ སྡུག་བསྔལ་ འབྱུངམ་ཨིན།', null, '[{"point": "འཁོར་བ།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, 'me-dzongkha-1-2025b1-q3', 4, null, null)
  returning id
)
insert into me_q select 'C4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', '༥༽ ནང་སེམས་ཁམས་དང་འབྲེལ་བའི་དཀའ་ངལ་དང་སྡུག་བསྔལ་ཚུ་འབྱུངམ་ད་ སྨན་བཅོས་ཀྱི་ལྷན་ཐབས་སྦེ་ གདོང་ལེན་འབད་ནིའི་ཐབས་ལམ་དྲག་ཤོས་ཅིག་ ག་ཅི་ནང་ཡོད་ཟེརཝ་སྨོ?', 'ནང་སེམས་ཁམས་དང་ འབྲེལ་བའི་ དཀའ་ངལ་ཚུ་ལུ་ གདོང་ལེན་འབད་ནིའི་ ཐབས་ལམ་ དྲག་ཤོས་འདི་ ཕྱི་ནང་གི་ཆོས་ལུགས་ཁག་དང་ ལྷག་པར་དུ་ ནང་ཆོས་ཀྱི་ ལམ་སྟོན་བསླབ་བྱ་དང་ ལྟ་གྲུབ་ཚུ་ནང་ ཡོདཔ་ཨིན།', null, '[{"point": "ཕྱི་ནང་གི་ཆོས་ལུགས་ཁག་དང་ ལྷག་པར་དུ་ ནང་ཆོས་ཀྱི་ ལམ་སྟོན་བསླབ་བྱ་དང་ ལྟ་གྲུབ་ཚུ་ནང་ཡོད།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, 'me-dzongkha-1-2025b1-q3', 5, null, null)
  returning id
)
insert into me_q select 'C5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'translation', 'འོག་ལུ་ཆོས་སྐད་ནང་ཡོད་མི་འདི་ རྫོང་ཁ་ཉག་རྐྱང་ནང་སྐད་སྒྱུར་འབད།

༄༅། ། སྔར་འཕགས་ཡུལ་བྱང་ཕྱོགས་ཀྱི་རྒྱུད་ཅིག་ན། གཤན་པ་བདེ་བྱེད་ཅེས་བྱ་བ་ཉིན་རེ་བཞིན་སྲོག་ཆགས་མང་པོ་བསད་པའི་གླས་འཚོ་བར་བྱེད་པ་ཞིག་གནས་པར་རྗེ་བཙུན་ཆེན་པོ་ཏིལླི་པས་དེར་བྱོན་ཏེ། གཤན་པའི་ཁྱིམ་དུ་ཞུགས་ནས་ཤ་བླངས་གསུངས་པས། གཤན་པ་དེས་ཤ་ཕུལ་བར་མ་བྱས་ཤིང་། ཚིག་རྩུབ་མོས་སྤྱོས་ནས་ཁོ་རང་ཁྱིམ་གྱི་ཕྱི་རོལ་དུ་སོང་ངོ་། ། དེར་སློབ་དཔོན་གྱིས་ཁོའི་བུ་མི་སྣང་བའི་རྫུ་འཕྲུལ་མཛད་དེ། ཐབ་ཀྱི་ཕྲུ་བར་འཚོས་ཀྱིན་འདུག་པའི་ཤ་དེ་དག་བུའི་རྣམ་པར་བྱིན་གྱིས་བརླབས་ནས་གཤེགས་སོ། །

ཁོ་ནང་དུ་ལོག་ནས་བུ་མཐོང་བར་མ་གྱུར་ཏེ། གང་དུ་བཙལ་ཡང་མ་རྙེད་ནས་ངལ་ཞིང་དུབ་པས་ཤ་ཚོས་སམ་སྙམ། སྣོད་ཕྱེས་ནས་བལྟས་པས་བུའི་རོར་མཐོང་ནས་སྡུག་བསྔལ་བར་གྱུར་ཏེ། བདག་ད་ལྟ་ཉིད་དུ་ཤི་ནའང་ཅི་མ་རུང་ཞེས་མ་ངན་ཆེར་བྱེད་ཅིང་། ཟས་སྐོམ་ཡིད་ལ་མེད་པར་ཞག་བདུན་འདས་པ་ན་ཤིན་ཏུ་རོད་ངན་པར་གྱུར་པ་ལ། ད་དུང་སློབ་དཔོན་གྱིས་ཁོའི་རྩར་བྱོན་ནས། ཁྱོད་དེ་ཙམ་གྱི་མ་ངན་བྱེད་པ་ཅི་ཉེས་གསུངས་པས། གཤན་པས་གསོལ་བ། ངའི་བུ་ཁྱོད་ཀྱིས་བསད་པ་ལའོ། །

སློབ་དཔོན་གྱིས་བཀའ་སྩལ་པ། ཁྱོད་རང་གི་བུ་བསད་པ་ལ་སྡུག་བསྔལ་དེ་ཙམ་དུ་ཆེ་ན། གཞན་གྱི་བུ་བསད་པ་ལའང་དེ་ལྟ་བུའི་སྡུག་བསྔལ་ཡོད་མོད། ཅིའི་ཕྱིར་འཚོ་བ་ཙམ་གྱི་ཕྱིར་གཞན་གྱི་སྲོག་ལ་གནོད་པར་བྱེད། ཅེས་གསུངས་པས། བདེན་སྙམ་པ་ལ། ཡང་སློབ་དཔོན་གྱིས། ད་ཁྱོད་ཀྱི་བུ་བྱུང་ན་གཞན་གྱི་སྲོག་ལ་འཚེ་བར་མི་བྱེད་དམ་གསུངས་པས། མི་གསོད་ཟེར་དེར་སློབ་དཔོན་གྱིས། ཁོའི་བུ་མཐོང་བའི་རྫུ་འཕྲུལ་མངོན་པར་འདུ་མཛད་པས། གཤན་པ་དེས་བུ་མཐོང་ནས་ལྷག་པར་དགའ་ཞིང་མགུ་ལ་ཡི་རངས་པ་སྐྱེས་ནས། སློབ་དཔོན་གྱི་ཞབས་ལ་བཏུད་ནས་རྗེས་སུ་འཛིན་པར་གསོལ་བས། རྗེས་སུ་བཟུང་ནས་གདམས་པ་བཏབ་པས་མཆོག་གི་དེ་ཁོ་ན་ཉིད་མངོན་དུ་བྱས་ཏེ། གྲུབ་ཐོབ་དགའ་བ་ཞེས་བྱ་སྟེ། ད་ལྟའང་སྲིན་པོའི་གྲོང་ན་བཞུགས་སོ། ། ། ། (སྐུགས་ ༢༠)', 'ཧེ་མ་ རྒྱ་གར་གྱི་ བྱང་ཕྱོགས་ཀྱི་ ས་ཁོངས་ཅིག་ནང་ བདེ་བྱེད་ཟེར་མི་ ཤན་པ་ཅིག་ ཉིན་ལྟར་ སྲོག་ཆགས་ ལེ་ཤ་ བསད་དེ་ དེ་ལས་ འོང་འབབ་ཐོག་ལས་ འཚོ་བ་སྐྱོང་སྟེ་ སྡོད་ནུག། དེ་ས་ལུ་ རྗེ་བཙུན་ཆེན་པོ་ ཏིལླི་པ་ ཕེབས་ཏེ་ ཤན་པའི་ ཁྱིམ་ནང་ ཕེབས་ཞིནམ་ལས་ ཤ་ཅིག་ ཞུ་ནུག། ཤན་པ་དེ་གིས་ ཤ་མ་བྱིན་པར་ ཚིག་རྩུབ་ཚུ་ སླབ་སྟེ་ ཁོ་རང་ ཁྱིམ་གྱི་ ཕྱི་ཁར་ ཐོན་སོང་ནུག། དེ་ལས་ སློབ་དཔོན་གྱིས་ ཁོ་གི་ བུ་ མཐོང་མ་ཚུགས་པའི་ རྫུ་འཕྲུལ་ མཛད་དེ་ ཐབ་གུ་ ཕྲུ་ནང་ བཙོ་བཞིན་ཡོད་པའི་ ཤ་དེ་ཚུ་ བུའི་ རྣམ་པ་ལུ་ བྱིན་གྱིས་བརླབས་ཏེ་ ཕེབས་སོང་ནུག།

ཁོ་ ནང་ན་ ལོག་འོངམ་ད་ བུ་ མ་མཐོང་པར་ ག་ཏེ་ འཚོལ་རུང་ མ་ཐོབ་པར་ ཐང་ཆད་དེ་ ཤ་ ཚོས་ཡི་ག་ མནོ་སྟེ་ སྣོད་ ཁ་ཕྱེ་སྟེ་ བལྟཝ་ད་ བུའི་ རོ་ མཐོངམ་ལས་ སྡུག་བསྔལ་ཏེ་ ང་ ད་རིས་ར་ ཤི་རུང་ ཕྱད་ཀྱི་མེད་ ཟེར་ ངུ་ཡི། བཟའ་ནི་ འཐུང་ནི་ ག་ནི་ཡང་ མ་བཏུབ་པར་ ཞག་བདུན་ འགྱོཝ་ད་ ཁོ་ ཧ་ཅང་ ཉམ་ཐག་སོ་ནུག། དེ་ལས་ ལོག་སྟེ་ སློབ་དཔོན་ ཁོ་གི་ སྦོ་ལོགས་ཁར་ ཕེབས་ཏེ་ ཁྱོད་ ག་ཅི་སྦེ་ དེ་ཅིག་ ངུ་ནི་ཨིན་ན་ ཟེར་ གསུངས་ནུག། ཤན་པ་གིས་ ངའི་བུ་ ཁྱོད་ཀྱིས་ བསད་ཡི་ ཟེར་ ཞུ་ནུག།

སློབ་དཔོན་གྱིས་ ཁྱོད་རའི་ བུ་ ཤི་མི་ལུ་ སྡུག་བསྔལ་ དེ་ཅིག་ ཆེ་བ་ཅིན་ གཞན་གྱི་ བུ་ བསད་མི་ལུ་ཡང་ དེ་བཟུམ་གྱི་ སྡུག་བསྔལ་ ཡོདཔ་ཨིན། ག་ཅི་སྦེ་ འཚོ་བ་སྐྱོང་ནི་ ཙམ་གྱི་དོན་ལུ་ གཞན་གྱི་ སྲོག་ལུ་ གནོད་པ་ བཏངམ་ཨིན་ན་ ཟེར་ གསུངས་ནུག། ཁོ་གིས་ བདེན་པས་ ཟེར་ མནོ་ནུག། སློབ་དཔོན་གྱིས་ ད་ ཁྱོད་ཀྱི་ བུ་ ཐོབ་པ་ཅིན་ གཞན་གྱི་ སྲོག་ལུ་ གནོད་པ་ མི་བཏང་ག་ ཟེར་ གསུངས་པའི་ཤུལ་ལུ་ ཁོ་གིས་ མི་བསད་ ཟེར་ ཞུ་ནུག། དེ་ལས་ སློབ་དཔོན་གྱིས་ ཁོ་གི་ བུ་ མཐོང་ཚུགས་པའི་ རྫུ་འཕྲུལ་ མཛད་ནུག། ཤན་པ་དེ་གིས་ བུ་ མཐོངམ་ད་ ཧ་ཅང་ དགའ་ཏེ་ སློབ་དཔོན་གྱི་ ཞབས་ལུ་ ཕྱག་འཚལ་ཏེ་ རྗེས་སུ་འཛིན་གནང་ ཟེར་ ཞུ་ནུག། སློབ་དཔོན་གྱིས་ རྗེས་སུ་ བཟུང་སྟེ་ གདམས་ངག་ གནང་ཞིནམ་ལས་ ཁོ་གིས་ མཆོག་གི་ དེ་ཁོ་ན་ཉིད་ མངོན་སུམ་དུ་ རྟོགས་ཏེ་ གྲུབ་ཐོབ་ དགའ་བ་ ཟེར་ ཆགས་ནུག། ད་ལྟོ་ཡང་ སྲིན་པོའི་ གྲོང་ནང་ བཞུགས་ཏེ་ཡོདཔ་ཨིན་ཟེར།', null, '[{"point": "དོན་ཚན་ཆ་ཚང་ མ་ལུས་པར་ དོན་མ་འཛོལ་བར་ སྐད་སྒྱུར་འབད་ཡོདཔ།", "marks": 10}, {"point": "ཆོས་སྐད་ཀྱི་ ཚིག་ (བྱོན། གསུངས། གཤེགས།) ཚུ་ རྫོང་ཁའི་ ཞེ་ས་ ཚིག་ ངོ་མ་ནང་ སྒྱུར་ཡོདཔ།", "marks": 5}, {"point": "རྫོང་ཁའི་ བརྡ་སྤྲོད་ ཡིག་སྦྱོར་ དང་ ཚིག་སྦྱོར་ ཀྲིག་ཀྲི།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'translation'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF.", "Two words still look damaged by the PDF font and were interpreted in the model answer: འཚོས་ཀྱིན (cooking) and རོད་ངན (very weak)."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'T1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 8.0, 1 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 5.0, 2 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 7.0, 3 from me_q where key = 'T1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'short_answer', 'འབྲུག་རྒྱལ་ཁབ་ནང་རྫོང་ཁག་ཁལ་གཅིག་ཡོད་ས་ལས་ རྒེད་འོག་ཉུང་ཤོས་སྦེ་ཡོད་པའི་རྫོང་ཁག་གཉིས་ཡོདཔ་ལས་ དེ་གཉིས་ངོས་འཛིན་འབད? (སྐུགས་ ༢)', 'བུམ་ཐང་རྫོང་ཁག་དང་ མགར་ས་རྫོང་ཁག། (རྫོང་ཁག་རེ་རེ་ནང་ རྒེད་འོག་ ༤ རེ།)', null, '[{"point": "བུམ་ཐང་རྫོང་ཁག་དང་ མགར་ས་རྫོང་ཁག། (རྫོང་ཁག་རེ་རེ་ནང་ རྒེད་འོག་ ༤ རེ།)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'K2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'K2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 0.5, 2 from me_q where key = 'K2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 0.5, 3 from me_q where key = 'K2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'short_answer', 'རྡོ་སྐྱོང་ལ་ལུ་ ག་ནི་བ་ར་ཆེཝ་དང་མཛེས་ཆ་ལྡནམ་སྦེ་ཡོད་པའི་ རྗེས་དྲན་མཆོད་རྟེན་ བརྒྱ་དང་ར་བརྒྱད་ཡོད་མི་འདི་ ག་གིས་སྤྱི་ལོ་ག་དེམ་ཅིག་ནང་ བཞེངས་གནང་ནུག? (སྐུགས་ ༢)', 'ཡུམ་སྐུ་ཞབས་ རྒྱལ་ཡུམ་ རྡོ་རྗེ་དབང་མོ་དབང་ཕྱུག་མཆོག་གིས་ སྤྱི་ལོ་ ༢༠༠༤ ལུ་ བཞེངས་གནང་ནུག། (འབྲུག་དབང་རྒྱལ་མཆོད་རྟེན།)', null, '[{"point": "ཡུམ་སྐུ་ཞབས་ རྒྱལ་ཡུམ་ རྡོ་རྗེ་དབང་མོ་དབང་ཕྱུག་མཆོག་གིས་ སྤྱི་ལོ་ ༢༠༠༤ ལུ་ བཞེངས་གནང་ནུག། (འབྲུག་དབང་རྒྱལ་མཆོད་རྟེན།)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'K3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'K3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 0.5, 2 from me_q where key = 'K3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 0.5, 3 from me_q where key = 'K3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'short_answer', 'ལྷོ་ཨེ་ཤི་ཡ་ལུང་ཕྱོགས་མཐུན་འབྲེལ་ཚོགས་པ་ (SAARC) ནང་ ད་ལྟོ་འཐུས་མི་རྒྱལ་ཁབ་ ག་དེམ་ཅིག་ཡོད་ག་དང་། འབྲུག་རྒྱལ་ཁབ་ཀྱིས་སྤྱི་ལོ་ག་དེམ་ཅིག་ནང་ འཐུས་མི་སྦེ་འཛུལ་ཞུགས་གནང་ཡི་ག? (སྐུགས་ ༢)', 'འཐུས་མི་རྒྱལ་ཁབ་ ༨ ཡོད། འབྲུག་ སྤྱི་ལོ་ ༡༩༨༥ ལུ་ གཞི་བཙུགས་འཐུས་མི་སྦེ་ འཛུལ་ཞུགས་གནང་ཡི།', null, '[{"point": "འཐུས་མི་རྒྱལ་ཁབ་ ༨ ཡོད། འབྲུག་ སྤྱི་ལོ་ ༡༩༨༥ ལུ་ གཞི་བཙུགས་འཐུས་མི་སྦེ་ འཛུལ་ཞུགས་གནང་ཡི།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'K5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'K5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 0.5, 2 from me_q where key = 'K5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 0.5, 3 from me_q where key = 'K5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'short_answer', 'འཛམ་གླིང་དམག་ཆེན་གཉིས་པ་འདི་ འགོ་དང་པ་རྒྱལ་ཁབ་ག་གིས་ སྤྱི་ལོ་ག་དེམ་ཅིག་ནང་འགོ་བཙུགས་ནུག? (སྐུགས་ ༢)', 'ཇར་མ་ནི་གིས་ སྤྱི་ལོ་ ༡༩༣༩ ལུ་ པོ་ལེནཌ་ལུ་ དམག་འཐབ་སྟེ་ འགོ་བཙུགས་ནུག།', null, '[{"point": "ཇར་མ་ནི་གིས་ སྤྱི་ལོ་ ༡༩༣༩ ལུ་ པོ་ལེནཌ་ལུ་ དམག་འཐབ་སྟེ་ འགོ་བཙུགས་ནུག།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'K7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'K7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 0.5, 2 from me_q where key = 'K7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 0.5, 3 from me_q where key = 'K7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'short_answer', '"རྫོང་ཁ་འདི་ འབྲུག་གི་རྒྱལ་ཡོངས་སྐད་ཡིག་ཨིན་" ཟེར་མི་འདི་ འབྲུག་གི་རྩ་ཁྲིམས་ཆེན་མོའི་ དོན་ཚན་ག་ཅི་གི་འོག་ལུ་ ཚན་པ་ཨང་ག་དེམ་ཅིག་ནང་བཀོད་ཡོད་ག? (སྐུགས་ ༢)', 'རྩ་ཁྲིམས་ཆེན་མོའི་ དོན་ཚན་ ༡ པ་ (འབྲུག་གི་རྒྱལ་ཁབ།) གི་ ཚན་པ་ ༨ པ་ནང་ བཀོད་ཡོད།', null, '[{"point": "རྩ་ཁྲིམས་ཆེན་མོའི་ དོན་ཚན་ ༡ པ་ (འབྲུག་གི་རྒྱལ་ཁབ།) གི་ ཚན་པ་ ༨ པ་ནང་ བཀོད་ཡོད།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF.", "The RCSC wording here was damaged (ར་ཚན་ / དོན་ཚན་); the stem was written as article (དོན་ཚན) and section (ཚན་པ): compare with the PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'K9', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'K9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 0.5, 2 from me_q where key = 'K9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 0.5, 3 from me_q where key = 'K9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'short_answer', 'རྒྱལ་ཁབ་ག་ཏེ་འབད་རུང་ དམངས་གཙོའི་རིང་ལུགས་ཨིན་ཟེརཝ་ད་ རང་རང་སོ་སོའི་ཁྱད་པར་དང་ཁྱད་ཆོས་ཚུ་ མ་འདྲཝ་ལེ་ཤ་ཡོདཔ་ལས་ འབྲུག་རྒྱལ་ཁབ་ཀྱི་གཞུང་ལུགས་འདི་འབད་བ་ཅིན་ ཡིག་ཆ་ག་ཅི་ནང་། ག་དེ་སྦེ་ཨིན་ཟེར་གཏན་འབེབས་གནང་ནུག? (སྐུགས་ ༢)', 'རྩ་ཁྲིམས་ཆེན་མོའི་ དོན་ཚན་ ༡ པའི་ ཚན་པ་ ༢ པ་ནང་ འབྲུག་གི་ གཞུང་ལུགས་འདི་ "དམངས་གཙོའི་ རྩ་ཁྲིམས་ཅན་གྱི་ རྒྱལ་པོའི་ གཞུང་" ཨིན་ཟེར་ གཏན་འབེབས་གནང་ནུག།', null, '[{"point": "རྩ་ཁྲིམས་ཆེན་མོའི་ དོན་ཚན་ ༡ པའི་ ཚན་པ་ ༢ པ་ནང་ འབྲུག་གི་ གཞུང་ལུགས་འདི་ \"དམངས་གཙོའི་ རྩ་ཁྲིམས་ཅན་གྱི་ རྒྱལ་པོའི་ གཞུང་\" ཨིན་ཟེར་ གཏན་འབེབས་གནང་ནུག།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'K10', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'K10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 0.5, 2 from me_q where key = 'K10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 0.5, 3 from me_q where key = 'K10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'mcq', 'ལོ་བརྒྱ་རེ་ལངམ་ད་ ...', null, 'ལོ་བརྒྱ་ལུ་ དུས་རབས་ (century) གཅིག་ ཟེར་ བརྩིཝ་ཨིན། རབ་བྱུང་ ལོ་ ༦༠ ཨིན།', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'འདས་ལོ་རེ་བརྩི་ནི་ཨིན།', false, 1), ('B', 'གནམ་ལོ་རེ་བརྩི་ནི་ཨིན།', false, 2), ('C', 'རབ་བྱུང་རེ་བརྩི་ནི་ཨིན།', false, 3), ('D', 'དུས་རབས་རེ་བརྩི་ནི་ཨིན།', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'mcq', 'རྒྱ་གར་རྒྱལ་ཁབ་འདི་ སྤྱི་ལོ་ག་དེམ་ཅིག་ནང་ ཕྱི་གླིང་པའི་སྲིད་དབང་གི་འོག་ལས་ རང་བཙན་ཐོབ་ནུག?', null, 'རྒྱ་གར་གྱིས་ སྤྱི་ཟླ་ ༨ པའི་ སྤྱི་ཚེས་ ༡༥ སྤྱི་ལོ་ ༡༩༤༧ ལུ་ རང་བཙན་ཐོབ་ནུག།', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '༡༩༤༧', true, 1), ('B', '༡༩༥༧', false, 2), ('C', '༡༩༣༧', false, 3), ('D', '༡༩༧༤', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'mcq', 'འཛམ་གླིང་སྤྱི་ཚོགས་ (UN) ནང་ལུ་ ད་ལྟོ་འཐུས་མི་རྒྱལ་ཁབ་གྱངས་ཁ་ ......... ཡོདཔ་ཨིན།', null, 'ཡུ་ཨེན་ནང་ འཐུས་མི་རྒྱལ་ཁབ་ ༡༩༣ ཡོད།', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '༡༨༣', false, 1), ('B', '༡༩༣', true, 2), ('C', '༢༠༠', false, 3), ('D', '༡༩༥', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'mcq', 'དཔལ་མི་དབང་འབྲུག་རྒྱལ་ལྔ་པ་མཆོག་ སྤྱི་ལོ་ལྟར་དུ་འབད་བ་ཅིན་ དགུང་ལོ་ ......... སྦེ་བཞུགསཔ་ད་ འབྲུག་གི་རྒྱལ་རབས་ལྔ་པའི་གསེར་ཁྲི་གུར་ཕེབས་ཏེ་ བཀྲ་ཤིས་མངའ་གསོལ་མཛད་ཅི།', null, 'མི་དབང་འབྲུག་རྒྱལ་ལྔ་པ་མཆོག་ སྤྱི་ལོ་ ༡༩༨༠ ལུ་ འཁྲུངས་ཏེ་ སྤྱི་ལོ་ ༢༠༠༨ ལུ་ དགུང་ལོ་ ༢༨ ལུ་ མངའ་གསོལ་གནང་ནུག།', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '༢༧', false, 1), ('B', '༢༨', true, 2), ('C', '༢༩', false, 3), ('D', '༣༠', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'mcq', 'ཞབས་དྲུང་རིན་པོ་ཆེ་གིས་ དཔལ་ལྡན་འབྲུག་པའི་སྲོག་རྫོང་ སྤུངས་ཐང་བདེ་བ་ཆེན་པོའི་ཕོ་བྲང་འདི་ སྤྱི་ལོ་ ......... བཞེངས་གནང་ནུག', null, 'སྤུ་ན་ཁ་རྫོང་ སྤྱི་ལོ་ ༡༦༣༧ ལུ་ བཞེངས་གནང་ནུག།', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '༡༦༣༩', false, 1), ('B', '༡༦༣༦', false, 2), ('C', '༡༦༣༨', false, 3), ('D', '༡༦༣༧', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'mcq', 'མི་དབང་འབྲུག་རྒྱལ་བཞི་པའི་སྐུའི་འཁྲུངས་སྐར་དུས་སྟོན་འདི་ ལོ་ཨ་རྟག་ར་ སྤྱི་ཟླ་དང་སྤྱི་ཚེས་ག་དེམ་ཅིག་ནང་ བརྩི་སྲུང་ཞུཝ་སྨོ?', null, 'མི་དབང་འབྲུག་རྒྱལ་བཞི་པ་མཆོག་ སྤྱི་ཟླ་ ༡༡ པའི་ སྤྱི་ཚེས་ ༡༡ ལུ་ འཁྲུངས་ནུག། (སྤྱི་ཟླ་ ༢ པའི་ ཚེས་ ༢༡ འདི་ མི་དབང་འབྲུག་རྒྱལ་ལྔ་པའི་ འཁྲུངས་སྐར་ཨིན།)', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'སྤྱི་ཟླ་ ༡༡ པའི་སྤྱི་ཚེས་ ༡༡ ལུ་ཞུཝ་ཨིན།', true, 1), ('B', 'སྤྱི་ཟླ་ ༥ པའི་སྤྱི་ཚེས་ ༢ ལུ་ཞུཝ་ཨིན།', false, 2), ('C', 'སྤྱི་ཟླ་ ༢ པའི་སྤྱི་ཚེས་ ༢༡ ལུ་ཞུཝ་ཨིན།', false, 3), ('D', 'སྤྱི་ཟླ་ ༡༡ པའི་སྤྱི་ཚེས་ ༡༠ ལུ་ཞུཝ་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'mcq', 'ཆོས་ཕྱོགས་དང་འབྲེལ་བའི་ལས་རིམ་ནང་ ཟས་དཀར་གསུམ་མངར་གསུམ་ཟེར་རྩིཝ་ད་ མངར་གསུམ་འདི་ ...', null, 'མངར་གསུམ་ ཤེལ་གུ་རམ་ གུ་རམ་ སྦྲང་རྩི་ཨིན། ཟས་དཀར་གསུམ་ ཨོམ་ ཞོ་ མར་ཨིན།', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ཤེལ་གུ་རམ། གུ་རམ། སྦྲང་རྩི་གསུམ་ཨིན།', true, 1), ('B', 'ཨོམ། མར། དར་ཚི་གསུམ་ཨིན།', false, 2), ('C', 'གུ་རམ། སྦྲང་རྩི། མངར་ཆུ་གསུམ་ཨིན།', false, 3), ('D', 'ཨོམ། ཞོ། མར་གསུམ་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'mcq', 'ཆོས་ཕྱོགས་ཀྱི་ལས་རིམ་ཚུ་ནང་ ལག་ལེན་འཐབ་སྲོལ་ཡོད་པའི་ མཆོད་ཆས་རྡོ་རྗེ་དང་དྲིལ་བུ་གཉིས་ཀྱི་ མཚོན་དོན་ག་ཅི་ཨིན་ན?', null, 'རྡོ་རྗེ་གིས་ ཐབས་ (སྙིང་རྗེ) དང་ དྲིལ་བུ་གིས་ ཤེས་རབ་ མཚོནམ་ཨིན།', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'རྡོ་རྗེ་གིས་འཁོར་བ་དང་ དྲིལ་བུ་གིས་མྱང་འདས་མཚོནམ་ཨིན།', false, 1), ('B', 'རྡོ་རྗེ་གིས་ཀུན་རྫོབ་དང་ དྲིལ་བུ་གིས་དོན་དམ་མཚོནམ་ཨིན།', false, 2), ('C', 'རྡོ་རྗེ་གིས་ཐབས་དང་ དྲིལ་བུ་གིས་ཤེས་རབ་མཚོནམ་ཨིན།', true, 3), ('D', 'རྡོ་རྗེ་གིས་སངས་རྒྱས་དང་ དྲིལ་བུ་གིས་བྱང་སེམས་མཚོནམ་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'short_answer', 'འབྲུག་གི་ རྒྱལ་ཡོངས་རི་དྭགས་འདི་ ག་ཅི་ཨིན་ན? (སྐུགས་ ༢)', 'རྒྱལ་ཡོངས་རི་དྭགས་འདི་ ཏཱ་ཀིན་ (བྲོང་གཟིག) ཨིན།', null, '[{"point": "རྒྱལ་ཡོངས་རི་དྭགས་འདི་ ཏཱ་ཀིན་ (བྲོང་གཟིག) ཨིན།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 2,
    216, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'K2'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'K11', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'K11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 0.5, 2 from me_q where key = 'K11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 0.5, 3 from me_q where key = 'K11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'short_answer', 'འབྲུག་གི་ རྒྱལ་ཡོངས་མེ་ཏོག་དང་ རྒྱལ་ཡོངས་བྱ་ ག་ཅི་ཨིན་ན? (སྐུགས་ ༢)', 'རྒྱལ་ཡོངས་མེ་ཏོག་ ཨུཏྤལ་སྔོནམ་ (blue poppy) དང་ རྒྱལ་ཡོངས་བྱ་ ཕོ་རོག་ (raven) ཨིན།', null, '[{"point": "རྒྱལ་ཡོངས་མེ་ཏོག་ ཨུཏྤལ་སྔོནམ་ (blue poppy) དང་ རྒྱལ་ཡོངས་བྱ་ ཕོ་རོག་ (raven) ཨིན།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 2,
    216, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'K3'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'K12', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'K12';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 0.5, 2 from me_q where key = 'K12';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 0.5, 3 from me_q where key = 'K12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'short_answer', 'འབྲུག་རྒྱལ་ཁབ་ཀྱིས་ ཡུ་ཨེན་ (UN) ནང་ འཐུས་མི་སྦེ་ སྤྱི་ལོ་ག་དེམ་ཅིག་ནང་ འཛུལ་ཞུགས་གནང་ཡི་ག? དེ་བསྒང་ རྒྱལ་པོ་ ག་ཨིན་ན? (སྐུགས་ ༢)', 'སྤྱི་ལོ་ ༡༩༧༡ ལུ་ འཛུལ་ཞུགས་གནང་ཡི། དེ་བསྒང་ མི་དབང་འབྲུག་རྒྱལ་གསུམ་པ་ འཇིགས་མེད་རྡོ་རྗེ་དབང་ཕྱུག་མཆོག་ ཨིན།', null, '[{"point": "སྤྱི་ལོ་ ༡༩༧༡ ལུ་ འཛུལ་ཞུགས་གནང་ཡི། དེ་བསྒང་ མི་དབང་འབྲུག་རྒྱལ་གསུམ་པ་ འཇིགས་མེད་རྡོ་རྗེ་དབང་ཕྱུག་མཆོག་ ཨིན།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 2,
    216, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'K5'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'K13', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'K13';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 0.5, 2 from me_q where key = 'K13';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 0.5, 3 from me_q where key = 'K13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'short_answer', 'འབྲུག་གི་ རྩ་ཁྲིམས་ཆེན་མོ་འདི་ སྤྱི་ཚེས་དང་ སྤྱི་ལོ་ ག་དེམ་ཅིག་ནང་ ཕྱག་རྟགས་བཀོད་དེ་ ཆ་འཇོག་གནང་ནུག? (སྐུགས་ ༢)', 'སྤྱི་ཟླ་ ༧ པའི་ སྤྱི་ཚེས་ ༡༨ སྤྱི་ལོ་ ༢༠༠༨ ལུ་ ཕྱག་རྟགས་བཀོད་དེ་ ཆ་འཇོག་གནང་ནུག།', null, '[{"point": "སྤྱི་ཟླ་ ༧ པའི་ སྤྱི་ཚེས་ ༡༨ སྤྱི་ལོ་ ༢༠༠༨ ལུ་ ཕྱག་རྟགས་བཀོད་དེ་ ཆ་འཇོག་གནང་ནུག།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 2,
    216, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'K9'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'K14', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'K14';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 0.5, 2 from me_q where key = 'K14';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 0.5, 3 from me_q where key = 'K14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'short_answer', 'འབྲུག་གི་ རྒྱལ་པོ་དང་པ་ གོང་ས་ ཨོ་རྒྱན་དབང་ཕྱུག་མཆོག་ སྤྱི་ཚེས་དང་ སྤྱི་ལོ་ ག་དེམ་ཅིག་ནང་ མངའ་གསོལ་གནང་ནུག? (སྐུགས་ ༢)', 'སྤྱི་ཟླ་ ༡༢ པའི་ སྤྱི་ཚེས་ ༡༧ སྤྱི་ལོ་ ༡༩༠༧ ལུ་ སྤུ་ན་ཁ་རྫོང་ནང་ མངའ་གསོལ་གནང་ནུག། (རྒྱལ་ཡོངས་དུས་ཆེན།)', null, '[{"point": "སྤྱི་ཟླ་ ༡༢ པའི་ སྤྱི་ཚེས་ ༡༧ སྤྱི་ལོ་ ༡༩༠༧ ལུ་ སྤུ་ན་ཁ་རྫོང་ནང་ མངའ་གསོལ་གནང་ནུག། (རྒྱལ་ཡོངས་དུས་ཆེན།)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 2,
    216, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'K10'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'K15', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'K15';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 0.5, 2 from me_q where key = 'K15';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 0.5, 3 from me_q where key = 'K15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'short_answer', 'རྩ་ཁྲིམས་ཆེན་མོ་ནང་ འབྲུག་གི་ ས་ཁོངས་ཡོངས་བསྡོམས་ནང་ལས་ ནམ་ར་ཨིན་རུང་ ནགས་ཚལ་ བརྒྱ་ཆ་ ག་དེམ་ཅིག་ བཞག་དགོ་ཟེར་ བཀོད་ཡོད་ག? (སྐུགས་ ༢)', 'བརྒྱ་ཆ་ ༦༠ ལས་ མ་ཉུངམ་ཅིག་ བཞག་དགོ་ཟེར་ བཀོད་ཡོད། (དོན་ཚན་ ༥ པ།)', null, '[{"point": "བརྒྱ་ཆ་ ༦༠ ལས་ མ་ཉུངམ་ཅིག་ བཞག་དགོ་ཟེར་ བཀོད་ཡོད། (དོན་ཚན་ ༥ པ།)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 2,
    216, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'K7'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'K16', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'K16';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 0.5, 2 from me_q where key = 'K16';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 0.5, 3 from me_q where key = 'K16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'mcq', 'འབྲུག་གི་ རྒྱལ་ཡོངས་ལྗོན་ཤིང་འདི་ ...', null, 'འབྲུག་གི་ རྒྱལ་ཡོངས་ལྗོན་ཤིང་ ཤུག་པ་ (cypress) ཨིན།', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ཐང་ཤིང་ཨིན།', false, 1), ('B', 'སོག་ཤིང་ཨིན།', false, 2), ('C', 'ཙན་དན་ཨིན།', false, 3), ('D', 'ཤུག་པ་ (cypress) ཨིན།', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'mcq', 'རྒྱལ་ཡོངས་དུས་ཆེན་འདི་ ལོ་ཨ་རྟག་ར་ ...', null, 'རྒྱལ་ཡོངས་དུས་ཆེན་ སྤྱི་ཟླ་ ༡༢ པའི་ ཚེས་ ༡༧ ལུ་ རྒྱལ་པོ་དང་པའི་ མངའ་གསོལ་ (༡༩༠༧) གི་ དྲན་རྟེན་སྦེ་ བརྩི་སྲུང་ཞུཝ་ཨིན།', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'སྤྱི་ཟླ་ ༧ པའི་ སྤྱི་ཚེས་ ༡༨ ལུ་ བརྩི་སྲུང་ཞུཝ་ཨིན།', false, 1), ('B', 'སྤྱི་ཟླ་ ༡༢ པའི་ སྤྱི་ཚེས་ ༡༧ ལུ་ བརྩི་སྲུང་ཞུཝ་ཨིན།', true, 2), ('C', 'སྤྱི་ཟླ་ ༦ པའི་ སྤྱི་ཚེས་ ༢ ལུ་ བརྩི་སྲུང་ཞུཝ་ཨིན།', false, 3), ('D', 'སྤྱི་ཟླ་ ༡༡ པའི་ སྤྱི་ཚེས་ ༡༡ ལུ་ བརྩི་སྲུང་ཞུཝ་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'mcq', 'རབ་བྱུང་གཅིག་ལུ་ ལོ་ ...', null, 'རབ་བྱུང་གཅིག་ལུ་ ལོ་ ༦༠ ཨིན།', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '༣༠ ཨིན།', false, 1), ('B', '༡༠༠ ཨིན།', false, 2), ('C', '༦༠ ཨིན།', true, 3), ('D', '༡༢ ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'mcq', 'ཞབས་དྲུང་ངག་དབང་རྣམ་རྒྱལ་ འབྲུག་ལུ་ སྤྱི་ལོ་ ...', null, 'ཞབས་དྲུང་ངག་དབང་རྣམ་རྒྱལ་ སྤྱི་ལོ་ ༡༦༡༦ ལུ་ འབྲུག་ལུ་ ཕེབས་ནུག།', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '༡༥༩༤ ལུ་ ཕེབས་ནུག།', false, 1), ('B', '༡༦༣༧ ལུ་ ཕེབས་ནུག།', false, 2), ('C', '༡༦༡༦ ལུ་ ཕེབས་ནུག།', true, 3), ('D', '༡༦༥༡ ལུ་ ཕེབས་ནུག།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'essay', 'འོག་ལུ་དྲི་བ་ ཀ་དང་ཁ་སྦེ་ གཉིས་ཡོད་ས་ལས་ གང་རུང་ཅིག་གདམ་ཁ་རྐྱབ་སྟེ་ ཚིག་འབྲུ་ ༤༥༠-༥༠༠ གི་ནང་འཁོད་ལུ་བཅུད་བསྡུ་བའི་འབྲི་རྩོམ་ཅིག་བྲི། (སྐུགས་ ༢༠)

འབྲུག་རྒྱལ་ཁབ་ནང་ ན་གཞོན་ཚུ་ ལཱ་གཡོག་མེད་པའི་ དཀའ་ངལ་ ཡར་སེང་འགྱོ་དོ་ཡོདཔ་ལས་ དེ་གི་རྒྱུ་རྐྱེན་ག་ཅི་ཨིན་ན་དང་ དཀའ་ངལ་དེ་ སེལ་ཐབས་ག་ཅི་ར་ཡོད་ག་ ཁྱོད་རའི་འཆར་སྣང་ འབྲི་རྩོམ་སྦེ་བྲིས།', 'ལན་གྱི་དཔེ་ (outline)

མགོ་བཙུགས། ལོ་ལྟར་ སློབ་གྲྭ་དང་ མཐོ་རིམ་སློབ་གྲྭ་ལས་ ཐོན་མི་ ན་གཞོན་ ལེ་ཤ་ཅིག་ཡོདཔ་ད་ ལཱ་གཡོག་གི་ གོ་སྐབས་ ལངམ་སྦེ་ མེད།

རྒྱུ་རྐྱེན། ན་གཞོན་མང་ཤོས་ཅིག་གིས་ གཞུང་གི་ ལཱ་གཡོག་རྐྱངམ་ཅིག་ལུ་ རེ་བ་བསྐྱེད་མི། སྒེར་སྡེ་ ཆུང་བ། ཤེས་ཡོན་དང་ ལཱ་གཡོག་གི་ དགོས་མཁོ་ མ་མཐུནམ། ལག་ལཱ་དང་ སོ་ནམ་ལུ་ བརྩི་མཐོང་ ཉུང་བ།

སེལ་ཐབས། ལག་ཤེས་སྦྱོང་བརྡར་ ཡར་སེང་གཏང་ནི། ཚོང་ལཱ་ཆུང་ཀུ་ འགོ་བཙུགས་ནི་ལུ་ བུ་ལོན་དང་ ལམ་སྟོན་བྱིན་ནི། སོ་ནམ་ལུ་ འཕྲུལ་ཆས་ ལག་ལེན། དགེ་ལེགས་ཕུག་ ཤེས་རིག་ལྟེ་བ་ ལ་སོགས་པའི་ ལས་འགུལ་ཚུ་གིས་ ལཱ་གསརཔ་ བཟོ་ནི།

མཇུག་བསྡུ། ན་གཞོན་ཚུ་གིས་ ལཱ་ག་ར་ལུ་ བརྩི་མཐོང་འབད་དེ་ རང་སོའི་ནུས་པ་ ལག་ལེན་འཐབ་པ་ཅིན་ དཀའ་ངལ་འདི་ སེལ་ཚུགས།', null, '[{"point": "མགོ་བཙུགས་ (དཀའ་ངལ་གྱི་ གནས་སྟངས།)", "marks": 3}, {"point": "རྒྱུ་རྐྱེན་ (གཞུང་གི་ལཱ་ལུ་ རེ་བ་བསྐྱེད་མི། སྒེར་སྡེ་ ཆུང་བ། ལག་ཤེས་དང་ ལཱ་གི་དགོས་མཁོ་ མ་མཐུནམ།)", "marks": 6}, {"point": "སེལ་ཐབས་ (ལག་ཤེས་སྦྱོང་བརྡར། ཚོང་ལཱ་ཆུང་ཀུ། སོ་ནམ། སྒེར་སྡེ་ གོང་འཕེལ།)", "marks": 7}, {"point": "མཇུག་བསྡུ།", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'essay'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 20,
    2160, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'E1'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'E1s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 8.0, 1 from me_q where key = 'E1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 5.0, 2 from me_q where key = 'E1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 7.0, 3 from me_q where key = 'E1s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'essay', 'འོག་ལུ་དྲི་བ་ ཀ་དང་ཁ་སྦེ་ གཉིས་ཡོད་ས་ལས་ གང་རུང་ཅིག་གདམ་ཁ་རྐྱབ་སྟེ་ ཚིག་འབྲུ་ ༤༥༠-༥༠༠ གི་ནང་འཁོད་ལུ་བཅུད་བསྡུ་བའི་འབྲི་རྩོམ་ཅིག་བྲི། (སྐུགས་ ༢༠)

རྒྱལ་ཡོངས་དགའ་སྐྱིད་དཔལ་འཛོམས་ཀྱི་ ཀ་ཆེན་བཞི་ ག་ཅི་ར་ཨིན་ན་དང་ དེ་ཚུ་གིས་ འབྲུག་རྒྱལ་ཁབ་ཀྱི་ གོང་འཕེལ་ལུ་ ཕན་ཐོགས་ ག་དེ་སྦེ་ བྱུང་ཡོདཔ་ཨིན་ན་ དཔེ་དང་བཅས་ རྒྱས་བཤད་འབྲི་རྩོམ་ཅིག་བྲིས།', 'ལན་གྱི་དཔེ་ (outline)

མགོ་བཙུགས། རྒྱལ་ཡོངས་དགའ་སྐྱིད་དཔལ་འཛོམས་ཀྱི་ ལྟ་བ་འདི་ མི་དབང་འབྲུག་རྒྱལ་བཞི་པ་མཆོག་གིས་ གསུངས་གནང་མི་ཅིག་ཨིན།

ཀ་ཆེན་བཞི། ༡. གཞུང་སྐྱོང་ལེགས་ལྡན། ༢. ཡུན་བརྟན་སྤྱི་ཚོགས་དཔལ་འབྱོར་གོང་འཕེལ། ༣. ལམ་སྲོལ་ཉམས་སྲུང་དང་ གོང་འཕེལ། ༤. མཐའ་འཁོར་ཉམས་སྲུང་།

ཕན་ཐོགས། ནགས་ཚལ་ བརྒྱ་ཆ་ ༦༠ ལས་ མ་ཉུངམ་ བཞག་ནིའི་ ཁྲིམས། ཤེས་རིག་དང་ འཕྲོད་བསྟེན་ རིན་མེད་སྦེ་ བྱིན་མི། སྒོ་སྒྲིག་ལམ་ལུགས་དང་ རྫོང་ཁ་ ཉམས་སྲུང་། དམངས་གཙོ་ལུ་ སྤོ་མི། ཆུ་གློག་ལས་ འོང་འབབ།

མཇུག་བསྡུ། དཔལ་འབྱོར་རྐྱངམ་ཅིག་ལས་ མི་ཚུ་གི་ དགའ་སྐྱིད་ལུ་ གཙོ་བོར་བཏོན་མི་འདི་ འབྲུག་གི་ ངོ་རྐྱང་ཨིན།', null, '[{"point": "མགོ་བཙུགས་ (རྒྱལ་ཡོངས་དགའ་སྐྱིད་དཔལ་འཛོམས་ཀྱི་ ལྟ་བ་ མི་དབང་འབྲུག་རྒྱལ་བཞི་པ་མཆོག་གིས་ གསུངས་མི།)", "marks": 3}, {"point": "ཀ་ཆེན་བཞི་ (གཞུང་སྐྱོང་ལེགས་ལྡན། ཡུན་བརྟན་སྤྱི་ཚོགས་དཔལ་འབྱོར་གོང་འཕེལ། ལམ་སྲོལ་ཉམས་སྲུང་། མཐའ་འཁོར་ཉམས་སྲུང་།)", "marks": 8}, {"point": "དཔེ་ (ནགས་ཚལ་ བརྒྱ་ཆ་ ༦༠། སྒོ་སྒྲིག་ལམ་ལུགས། ཤེས་རིག་དང་ འཕྲོད་བསྟེན་ རིན་མེད། དམངས་གཙོ།)", "marks": 6}, {"point": "མཇུག་བསྡུ།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'essay'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 20,
    2160, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'E2'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'E2s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 8.0, 1 from me_q where key = 'E2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 5.0, 2 from me_q where key = 'E2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 7.0, 3 from me_q where key = 'E2s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'འོག་ལུ་དྲི་བ་ ཀ་དང་ཁ་སྦེ་ གཉིས་ཡོད་ས་ལས་ ག་འབད་རུང་ཅིག་གདམ་ཁ་རྐྱབ་ཞིནམ་ལས་ ཚིག་སྦྱོར་ཕུན་སུམ་ཚོགས་པའི་ཁར་དོན་གྱི་གནད་འགག་ཚངམ་སྦེ་ཡོད་པའི་ ཡི་གུ་ཚད་ལྡན་ཅིག་བྲི་དགོ། (སྐུགས་ ༡༥)

ཁྱོད་ར་ ཀྲོང་གསར་རྫོང་ཁག་ ནུབ་ཕྱོགས་རྒེད་འོག་གི་ ཞིང་བདག་ ཚེ་རིང་རྡོ་རྗེ་ ཨིནམ་བཟོ་སྟེ་ ཁྱོད་རའི་ ཞིང་ས་ ཡུལ་ཁ་ ༢ འདི་ ལོ་ ༣ གི་རིང་ ཁྱིམ་ཚང་གཞན་ཅིག་ལུ་ གླ་ཁར་ བྱིན་ནིའི་ ས་ཆ་གླ་ཁར་བྱིན་ནིའི་ གན་རྒྱ་ཅིག་ བཟོ། (ཕྱོགས་གཉིས་དང་ དཔང་པོའི་ ངོ་སྤྲོད་ཁ་གསལ་ ཁྱོད་རའི་ ཡིད་ཀྱིས་ བཟོ་ཆོག)', 'ས་ཆ་གླ་ཁར་བྱིན་ནིའི་ གན་རྒྱ།

ཚེས་གྲངས། .............

༡. ཞིང་བདག་ (ཕྱོགས་དང་པ)༽ ཚེ་རིང་རྡོ་རྗེ། ངོ་སྤྲོད་ལག་ཁྱེར་ཨང་ .............། ཀྲོང་གསར་རྫོང་ཁག་ ནུབ་ཕྱོགས་རྒེད་འོག།
༢. གླ་ཁར་ལེན་མི་ (ཕྱོགས་གཉིས་པ)༽ ............. ངོ་སྤྲོད་ལག་ཁྱེར་ཨང་ .............།

ཆ་རྐྱེན།
༡. ཕྱོགས་དང་པ་གིས་ ཞིང་ས་ ཡུལ་ཁ་ ༢ (ཐམ་ཨང་ .............) འདི་ ལོ་ ༣ གི་རིང་ ཕྱོགས་གཉིས་པ་ལུ་ གླ་ཁར་ བྱིན་ནི་ཨིན།
༢. གླ་ཆ་ ལོ་རེ་ལུ་ དངུལ་ཀྲམ་ ............. ཕྱོགས་གཉིས་པ་གིས་ ལོ་ཐོག་ བསྡུ་ཞིནམ་ལས་ སྤྲོད་དགོ།
༣. ཕྱོགས་གཉིས་པ་གིས་ ཞིང་ས་ ལེགས་ཤོམ་སྦེ་ ལག་ལེན་འཐབ་དགོཔ་དང་ ཁྱིམ་དང་ བཟོ་སྐྲུན་ ག་ནི་ཡང་ བཟོ་མི་ཆོག།
༤. དུས་ཡུན་ཚང་བའི་ཤུལ་ལུ་ ཞིང་ས་ ཕྱོགས་དང་པ་ལུ་ ཕྱིར་སྤྲོད་དགོ། ཆ་རྐྱེན་ མ་བརྩི་བ་ཅིན་ གན་རྒྱ་ ཆ་མེད་གཏང་ཆོག།

ཕྱོགས་དང་པའི་ མཚན་རྟགས། .............   ཕྱོགས་གཉིས་པའི་ མཚན་རྟགས། .............   དཔང་པོ། .............', null, '[{"point": "མགོ་མིང་དང་ ཚེས་གྲངས།", "marks": 2}, {"point": "ཕྱོགས་གཉིས་ཀྱི་ ངོ་སྤྲོད།", "marks": 3}, {"point": "ཞིང་སའི་ ཁ་གསལ་ (ས་གནས་ ཚད་ ཐམ་ཨང་།)", "marks": 2}, {"point": "གླ་ཆ་ སྤྲོད་ཐངས་དང་ དུས་ཡུན།", "marks": 3}, {"point": "ཆ་རྐྱེན་ (ཞིང་ས་ ལེགས་ཤོམ་སྦེ་ ལག་ལེན། ཕྱིར་སྤྲོད། ཆ་མེད་གཏང་ཐངས།) དང་ མཚན་རྟགས།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'formal-writing'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 15,
    1620, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'L1'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'L1s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 6.0, 1 from me_q where key = 'L1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 4.0, 2 from me_q where key = 'L1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 5.0, 3 from me_q where key = 'L1s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'འོག་ལུ་དྲི་བ་ ཀ་དང་ཁ་སྦེ་ གཉིས་ཡོད་ས་ལས་ ག་འབད་རུང་ཅིག་གདམ་ཁ་རྐྱབ་ཞིནམ་ལས་ ཚིག་སྦྱོར་ཕུན་སུམ་ཚོགས་པའི་ཁར་དོན་གྱི་གནད་འགག་ཚངམ་སྦེ་ཡོད་པའི་ ཡི་གུ་ཚད་ལྡན་ཅིག་བྲི་དགོ། (སྐུགས་ ༡༥)

ཁྱོད་རའི་ གཡུས་ཚན་ནང་ འཐུང་ཆུ་གི་ དཀའ་ངལ་ སྦོམ་སྦེ་ཡོདཔ་ལས་ ཁྱོད་ར་ གཡུས་ཀྱི་ ཚོགས་པ་ཨིནམ་བཟོ་སྟེ་ རྫོང་བདག་མཆོག་ལུ་ འཐུང་ཆུ་གི་ མཐུན་རྐྱེན་ མཛད་གནང་དགོ་པའི་ ཞུ་ཡིག་ཅིག་ སྔར་སྲོལ་ལམ་ལུགས་ལྟར་དུ་བྲིས།', 'ཕུལ་ས། རྫོང་བདག་མཆོག། ............. རྫོང་ཁག།

ཞུ་དོན། འཐུང་ཆུ་གི་ མཐུན་རྐྱེན་ མཛད་གནང་དགོ་པའི་ཞུ་ཡིག།

གོང་འོག་ཏུ་ ཞུ་དོན་ནི་ ང་བཅས་རའི་ གཡུས་ཚན་ནང་ ཁྱིམ་ཚང་ ༤༥ ཡོདཔ་ད་ ཆུ་ཁ་ ཐག་རིང་སར་ཡོདཔ་ལས་ ཉིན་ལྟར་ ཆུ་ལེན་ནི་ལུ་ ཆུ་ཚོད་ གཅིག་ལས་ལྷག་སྟེ་ འགྱོ་དགོཔ་ཐོནམ་ཨིན། དགུན་ཁ་ ཆུ་ ཉུང་སུ་ འགྱོཝ་ད་ འཕྲོད་བསྟེན་དང་ ཞིང་ལཱ་ལུ་ཡང་ གནོད་པ་ བྱུང་དོ་ཡོདཔ་ཨིན།

དེ་འབདཝ་ལས་ ཆུ་ཁ་ལས་ ཆུ་དོང་དང་ ཆུ་མཛོད་ བཟོ་ནིའི་ མཐུན་རྐྱེན་ མཛད་གནང་དགོ་པའི་ ཞུ་བ་ཕུལ་ཡི། ང་བཅས་གཡུས་པ་ཚུ་གིས་ ལཱ་གི་ ཞལ་འདེབས་ ཕུལ་ནི་ཨིན།

ཚེས་གྲངས། .............   ཞུ་ཡིག་ཕུལ་མི། ............. ཚོགས་པ། མཚན་རྟགས། .............', null, '[{"point": "སྔར་སྲོལ་གྱི་ ཞུ་ཡིག་རྣམ་གཞག་ (ཕུལ་ས། ཞུ་དོན། ཚེས་གྲངས། མཚན་རྟགས།)", "marks": 4}, {"point": "དཀའ་ངལ་ཁ་གསལ།", "marks": 4}, {"point": "ཞུ་བ་ཁ་གསལ་དང་ གཡུས་པ་ཚུ་གི་ ཞལ་འདེབས།", "marks": 4}, {"point": "ཞེ་ས་དང་ ཚིག་སྦྱོར།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'formal-writing'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 15,
    1620, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'L2'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'L2s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 6.0, 1 from me_q where key = 'L2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 4.0, 2 from me_q where key = 'L2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 5.0, 3 from me_q where key = 'L2s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ལྷག་ཞིནམ་ལས་ དྲི་བ་ག་ར་ལུ་ལན་བྲིས། དྲི་བ་རེ་ལུ་སྐུགས་ ༣ རེ།

རྫོང་ཁ་འདི་ རྒྱལ་ཁབ་ཀྱི་ངོ་རྐྱང་ཨིན།

༉ རྫོང་ཁ་འདི་ འབྲུག་རྒྱལ་ཁབ་ཀྱི་རྒྱལ་ཡོངས་སྐད་ཡིག་ཨིནམ་སྦེ་ རྩ་ཁྲིམས་ཆེན་མོ་ནང་ཁ་གསལ་སྦེ་བཀོད་དེ་ཡོདཔ་ཨིན། སྔོན་མ་ རྫོང་ཁག་ཚུ་ནང་ ཆོས་དང་སྲིད་ཀྱི་ལཱ་ཚུ་ ཆོས་སྐད་དང་ རྫོང་ཁ་ནང་ལས་ར་འབད་སྲོལ་ཡོདཔ་ལས་ རྫོང་ཁ་ཟེར་བའི་མིང་ཡང་ དེ་ལས་ར་བྱུང་ཡོདཔ་ཨིན་ཟེར་ བཤདཔ་ཨིན། སྤྱི་ལོ་ ༡༩༧༡ ལུ་ རྫོང་ཁ་འདི་ སློབ་གྲྭ་ཚུ་ནང་ རྒྱལ་ཡོངས་སྐད་ཡིག་སྦེ་ སློབ་སྟོན་འབད་འགོ་བཙུགས་ཡོདཔ་ད་ སྤྱི་ལོ་ ༡༩༨༦ ལུ་ རྫོང་ཁ་གོང་འཕེལ་ལྷན་ཚོགས་ གཞི་བཙུགས་གནང་ཡོདཔ་ཨིན།

དེང་སང་ འཛམ་གླིང་གཅིག་འགྱུར་དང་ བརྒྱུད་འཕྲིན་གྱི་ལག་ལེན་ ཡར་སེང་འགྱོ་མི་དང་གཅིག་ཁར་ ན་གཞོན་མང་ཤོས་ཅིག་གིས་ ཁ་སླབ་ནི་དང་ ཡི་གུ་བྲི་ནི་ཚུ་ ཨིང་ལིཤ་སྐད་ནང་ལས་ འབད་དགའཝ་སྦེ་འདུག། དེ་གིས་ རྫོང་ཁ་གི་ཡིག་སྦྱོར་དང་ ཞེ་ས་ཚུ་ ཉམས་འགྱོ་ནིའི་ཉེན་ཁ་ཡོདཔ་ཨིན། འདི་བཟུམ་མའི་གནས་སྟངས་ནང་ ཁྱིམ་ནང་ ཕ་མ་ཚུ་གིས་ ཨ་ལུ་ཚུ་དང་གཅིག་ཁར་ རྫོང་ཁ་ནང་ཁ་སླབ་ནི་དང་ སློབ་གྲྭ་ཚུ་ནང་ རྫོང་ཁ་གི་རྩེད་འགྲན་དང་ དཔེ་ཀློག་གི་ལས་རིམ་ཚུ་ འགོ་འདྲེན་འཐབ་དགོཔ་ཨིན།

སྐད་ཡིག་ཅིག་ཉམས་པ་ཅིན་ ལོ་རྒྱུས་ ལམ་སྲོལ་ དེ་ལས་ ཤེས་ཡོན་ཚུ་ཡང་ མཉམ་སྦེ་ཉམས་འགྱོཝ་ཨིན། དེ་འབདཝ་ལས་ རྫོང་ཁ་འདི་ ཡིག་ཚང་རྐྱངམ་ཅིག་གི་ལཱ་མེན་པར་ འབྲུག་མི་ག་ར་གི་འགན་ཁུར་ཨིནམ་ལས་ ཉིན་བསར་གྱི་མི་ཚེ་ནང་ ཧ་ལམ་ཅིག་ ལག་ལེན་འཐབ་ཐོག་ལས་ མ་འོངས་མི་རབས་ཚུ་ལུ་ ཉམས་མེད་སྦེ་ སྤྲོད་དགོཔ་ཨིན།

༡༽ རྫོང་ཁ་ཟེར་བའི་ མིང་འདི་ ག་ཏེ་ལས་ བྱུང་ཡོདཔ་ཨིན་ཟེར་ བཤདཔ་སྨོ?', 'སྔོན་མ་ རྫོང་ཁག་ཚུ་ནང་ ཆོས་དང་སྲིད་ཀྱི་ ལཱ་ཚུ་ ཆོས་སྐད་དང་ རྫོང་ཁ་ནང་ལས་ འབད་སྲོལ་ཡོདཔ་ལས་ རྫོང་ཁ་ཟེར་བའི་ མིང་ བྱུང་ཡོདཔ་ཨིན་ཟེར་ བཤདཔ་ཨིན།', null, '[{"point": "རྫོང་ཁག་ཚུ་ནང་ ཆོས་དང་སྲིད་ཀྱི་ ལཱ་ཚུ་ རྫོང་ཁ་ནང་ལས་ འབད་སྲོལ་ཡོདཔ་ལས་ བྱུང་ཡོདཔ།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 3,
    324, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'C1'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-dzongkha-1-2025b1-q3s', 1, null, null)
  returning id
)
insert into me_q select 'C1s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C1s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', '༢༽ རྫོང་ཁ་ སློབ་གྲྭ་ཚུ་ནང་ སློབ་སྟོན་འབད་འགོ་བཙུགས་མི་དང་ རྫོང་ཁ་གོང་འཕེལ་ལྷན་ཚོགས་ གཞི་བཙུགས་གནང་མི་ སྤྱི་ལོ་ ག་དེམ་ཅིག་ནང་ཨིན་ན?', 'སྤྱི་ལོ་ ༡༩༧༡ ལུ་ རྫོང་ཁ་ སློབ་གྲྭ་ཚུ་ནང་ སློབ་སྟོན་འབད་འགོ་བཙུགས་ཡོདཔ་ད་ སྤྱི་ལོ་ ༡༩༨༦ ལུ་ རྫོང་ཁ་གོང་འཕེལ་ལྷན་ཚོགས་ གཞི་བཙུགས་གནང་ཡོདཔ་ཨིན།', null, '[{"point": "སྤྱི་ལོ་ ༡༩༧༡ ལུ་ སློབ་གྲྭ་ནང་ སློབ་སྟོན་འགོ་བཙུགས།", "marks": 2}, {"point": "སྤྱི་ལོ་ ༡༩༨༦ ལུ་ ལྷན་ཚོགས་ གཞི་བཙུགས།", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 3,
    324, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'C2'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-dzongkha-1-2025b1-q3s', 2, null, null)
  returning id
)
insert into me_q select 'C2s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C2s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', '༣༽ དེང་སང་ རྫོང་ཁ་ ཉམས་ནིའི་ཉེན་ཁ་ ཡོད་པའི་ རྒྱུ་མཚན་ ག་ཅི་ཨིན་ན?', 'འཛམ་གླིང་གཅིག་འགྱུར་དང་ བརྒྱུད་འཕྲིན་གྱི་ ལག་ལེན་ ཡར་སེང་འགྱོ་མི་ལས་བརྟེན་ ན་གཞོན་མང་ཤོས་ཅིག་གིས་ ཁ་སླབ་ནི་དང་ ཡི་གུ་བྲི་ནི་ ཨིང་ལིཤ་སྐད་ནང་ འབད་དགའཝ་ལས་ རྫོང་ཁ་གི་ ཡིག་སྦྱོར་དང་ ཞེ་ས་ ཉམས་ནིའི་ ཉེན་ཁ་ཡོདཔ་ཨིན།', null, '[{"point": "འཛམ་གླིང་གཅིག་འགྱུར་དང་ བརྒྱུད་འཕྲིན་ ལག་ལེན་ ཡར་སེང་འགྱོ་མི།", "marks": 1}, {"point": "ན་གཞོན་ཚུ་གིས་ ཨིང་ལིཤ་སྐད་ནང་ ཁ་སླབ་ ཡི་གུ་བྲི་ དགའཝ།", "marks": 1}, {"point": "ཡིག་སྦྱོར་དང་ ཞེ་ས་ ཉམས་ནིའི་ཉེན་ཁ།", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 3,
    324, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'C3'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-dzongkha-1-2025b1-q3s', 3, null, null)
  returning id
)
insert into me_q select 'C3s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C3s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', '༤༽ ཡིག་རྒྱུགས་ནང་ལུ་ རྫོང་ཁ་ ཉམས་སྲུང་འབད་ནིའི་དོན་ལུ་ ཐབས་ལམ་ ག་ཅི་ར་ བཀོད་ཡོད་ག?', 'ཁྱིམ་ནང་ ཕ་མ་ཚུ་གིས་ ཨ་ལུ་ཚུ་དང་གཅིག་ཁར་ རྫོང་ཁ་ནང་ ཁ་སླབ་ནི་དང་ སློབ་གྲྭ་ཚུ་ནང་ རྫོང་ཁ་གི་ རྩེད་འགྲན་དང་ དཔེ་ཀློག་གི་ ལས་རིམ་ཚུ་ འགོ་འདྲེན་འཐབ་ནི།', null, '[{"point": "ཁྱིམ་ནང་ ཕ་མ་ཚུ་གིས་ ཨ་ལུ་ཚུ་དང་ རྫོང་ཁ་ནང་ ཁ་སླབ་ནི།", "marks": 2}, {"point": "སློབ་གྲྭ་ནང་ རྫོང་ཁའི་ རྩེད་འགྲན་དང་ དཔེ་ཀློག་གི་ ལས་རིམ།", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 3,
    324, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'C4'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-dzongkha-1-2025b1-q3s', 4, null, null)
  returning id
)
insert into me_q select 'C4s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C4s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C4s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C4s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'passage', '༥༽ སྐད་ཡིག་ཅིག་ ཉམས་པ་ཅིན་ ག་ཅི་ར་ མཉམ་སྦེ་ ཉམས་འགྱོཝ་ཨིན་ན? རྫོང་ཁ་ ཉམས་སྲུང་འབད་ནི་འདི་ ག་གི་འགན་ཁུར་ཨིན་ན?', 'སྐད་ཡིག་ཅིག་ ཉམས་པ་ཅིན་ ལོ་རྒྱུས་ ལམ་སྲོལ་ དེ་ལས་ ཤེས་ཡོན་ཚུ་ཡང་ མཉམ་སྦེ་ ཉམས་འགྱོཝ་ཨིན། རྫོང་ཁ་ ཉམས་སྲུང་འདི་ ཡིག་ཚང་རྐྱངམ་ཅིག་གི་ལཱ་ མེན་པར་ འབྲུག་མི་ ག་ར་གི་ འགན་ཁུར་ཨིན།', null, '[{"point": "ལོ་རྒྱུས་ ལམ་སྲོལ་ ཤེས་ཡོན་ཚུ་ ཉམས་འགྱོཝ་ཨིན།", "marks": 2}, {"point": "འབྲུག་མི་ ག་ར་གི་ འགན་ཁུར་ཨིན།", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 3,
    324, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'C5'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-dzongkha-1-2025b1-q3s', 5, null, null)
  returning id
)
insert into me_q select 'C5s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C5s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C5s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C5s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'translation', 'འོག་ལུ་ཆོས་སྐད་ནང་ཡོད་མི་འདི་ རྫོང་ཁ་ཉག་རྐྱང་ནང་སྐད་སྒྱུར་འབད།

༄༅། ། སྔོན་རྒྱལ་པོ་ཞིག་གི་བློན་པོ་མཁས་ཤིང་བཙུན་པ་ཞིག་ཡོད་དོ། ། དུས་ཤིག་ན་རྒྱལ་པོས་བློན་པོ་ལ། འཇིག་རྟེན་ན་རིན་ཐང་ཆེ་ཤོས་ཅི་ཡིན་ཞེས་དྲིས་པས། བློན་པོས་ལན་དུ། གསེར་དངུལ་ནོར་བུ་རྣམས་རིན་ཐང་ཆེ་མོད། འོན་ཀྱང་ཡོན་ཏན་དང་ཀུན་སྤྱོད་བཟང་པོ་ནི་དེ་བས་ཀྱང་རིན་ཐང་ཆེའོ། ། ནོར་ནི་ཆོམ་རྐུན་གྱིས་འཕྲོག་ཏུ་རུང་། ཡོན་ཏན་ནི་སུས་ཀྱང་འཕྲོག་མི་ནུས། ཞེས་ཞུས་སོ། ། རྒྱལ་པོ་ཡི་རངས་ནས་ཡུལ་གྱི་བུ་ཕྲུག་རྣམས་ལ་ཡོན་ཏན་སློབ་པའི་སློབ་གྲྭ་མང་པོ་བཙུགས་སོ། ། (སྐུགས་ ༢༠)', 'ཧེ་མ་ རྒྱལ་པོ་ཅིག་གི་ བློན་པོ་ མཁས་ཏེ་ དྲང་བདེན་ཅན་ཅིག་ ཡོད་ནུག། ནམ་ཅིག་ རྒྱལ་པོ་གིས་ བློན་པོ་ལུ་ འཛམ་གླིང་ནང་ རིན་ཐང་ ཆེ་ཤོས་ ག་ཅི་ཨིན་ན་ ཟེར་ དྲི་བ་ཅིན་ བློན་པོ་གིས་ ལན་ལུ་ གསེར་དངུལ་དང་ ནོར་བུ་ཚུ་ རིན་ཐང་ ཆེ་རུང་ ཡོན་ཏན་དང་ ཀུན་སྤྱོད་ བཟང་པོ་འདི་ དེ་ལས་ཡང་ རིན་ཐང་ ཆེཝ་ཨིན། ནོར་འདི་ ཆོམ་རྐུན་གྱིས་ འཕྲོག་ཚུགས་རུང་ ཡོན་ཏན་འདི་ སུ་གིས་ཡང་ འཕྲོག་མི་ཚུགས་ ཟེར་ ཞུ་ནུག། རྒྱལ་པོ་ ཡི་རངས་ཏེ་ ས་གནས་ཀྱི་ ཨ་ལུ་ཚུ་ལུ་ ཡོན་ཏན་ སློབ་ནིའི་ སློབ་གྲྭ་ ལེ་ཤ་ བཙུགས་གནང་ནུག།', null, '[{"point": "དོན་ཚན་ཆ་ཚང་ མ་ལུས་པར་ དོན་མ་འཛོལ་བར་ སྐད་སྒྱུར་འབད་ཡོདཔ།", "marks": 10}, {"point": "ཆོས་སྐད་ཀྱི་ ཚིག་ཚུ་ རྫོང་ཁའི་ ཚིག་ ངོ་མ་ནང་ སྒྱུར་ཡོདཔ།", "marks": 5}, {"point": "རྫོང་ཁའི་ བརྡ་སྤྲོད་ ཡིག་སྦྱོར་ དང་ ཚིག་སྦྱོར་ ཀྲིག་ཀྲི།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha-language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha-language-general-knowledge') and t.slug = 'translation'), (select id from public.exam_papers where code = 'me-dzongkha-1'), 'standard', 20,
    2160, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'T1'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null)
  returning id
)
insert into me_q select 'T1s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 8.0, 1 from me_q where key = 'T1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement), logical order and paragraphs.', 5.0, 2 from me_q where key = 'T1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 7.0, 3 from me_q where key = 'T1s';
commit;
