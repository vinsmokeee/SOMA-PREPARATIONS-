-- ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'comprehension', 'Comprehension' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'essay', 'Essay' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'grammar', 'Grammar' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'grammar-mcq', 'Grammar MCQ' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'translation', 'Translation' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'verb-tenses', 'Verb tenses' on conflict (subject_id, slug) do nothing;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-bed-1') and subject_group_id is not distinct from (select id from public.subject_groups where code = 'bed-general-graduates');
insert into public.paper_group_settings (paper_id, subject_group_id, duration_minutes, reading_minutes, max_marks, source) values ((select id from public.exam_papers where code = 'me-bed-1'), (select id from public.subject_groups where code = 'bed-general-graduates'), 180, 15, 100, 'BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates') on conflict (paper_id, subject_group_id) do update set duration_minutes = excluded.duration_minutes, reading_minutes = excluded.reading_minutes, max_marks = excluded.max_marks, source = excluded.source;
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-1'), (select id from public.subject_groups where code = 'bed-general-graduates'), null, 1, 'Question 1: Essay (འབྲི་རྩོམ།)', 'essay', 2, 30, 1, 'BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-1'), (select id from public.subject_groups where code = 'bed-general-graduates'), 'grammar', 2, 'Question 2 (ka): Grammar questions (ཡི་གུའི་སྦྱོར་བ།)', 'short_answer', 1, 10, null, 'BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-1'), (select id from public.subject_groups where code = 'bed-general-graduates'), null, 3, 'Question 2 (kha): Multiple choice', 'mcq', 5, 1, null, 'BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-1'), (select id from public.subject_groups where code = 'bed-general-graduates'), 'verb-tenses', 4, 'Question 2 (ga): Verb tenses (དུས་གསུམ།)', 'short_answer', 1, 5, null, 'BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-1'), (select id from public.subject_groups where code = 'bed-general-graduates'), null, 5, 'Question 3: Comprehension (གོ་བ་ལེན་ནི།)', 'passage', 1, 35, null, 'BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-1'), (select id from public.subject_groups where code = 'bed-general-graduates'), null, 6, 'Question 4: Translation (སྐད་སྒྱུར།)', 'translation', 1, 15, null, 'BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'essay', 'འོག་ལུ་བཀོད་ཡོད་པའི་ འབྲི་རྩོམ་ དོན་ཚན་གཉིས་ལས་ གཅིག་གདམ་ཁ་རྐྱབ་སྟེ་ ཚིག་འབྲུ་ ༦༠༠ གི་ནང་འཁོད་བྲིས། (སྐུགས་ ༣༠)
(བརྗོད་དོན་ལུ་སྐུགས་ ༡༧། ཚིག་སྦྱོར་ལུ་སྐུགས་ ༨། འབྲི་བཀོད་ལུ་སྐུགས་ ༥།)

རོགས་ཁ་མ་ཤེས་རང་ཁ་འབྱང་། ཟེར་བའི་དཔེ་གཏམ་ལུ་གཞི་བཞག་སྟེ་ ང་བཅས་འབྲུགཔ་རྒན་གཞོན་བར་མ་ག་ར་གིས་ གཞུང་སྐད་རྫོང་ཁ་ལུ་ བརྩི་མཐོང་བསྐྱེད་དེ་ ལག་ལེན་འཐབ་པ་ཅིན་ ཕན་ཐོགས་ཡོད་པའི་ཁུངས་དང་ གལ་སྲིད་ལག་ལེན་མ་འཐབ་པ་ཅིན་ གནོད་པ་ག་ཅི་བཟུམ་འོང་ནི་ཨིན་ན? བཤད་པ་རྒྱས་སྤྲོས་བྲིས།', 'ལན་གྱི་དཔེ་ (outline)
མགོ་བཙུགས། རོགས་ཁ་མ་ཤེས་རང་ཁ་འབྱང་། ཟེར་མི་དཔེ་གཏམ་འདི་གིས་ མི་གཞན་གྱི་སྐད་མ་ཤེས་རུང་ རང་གི་སྐད་འདི་ ལེགས་ཤོམ་སྦེ་ཤེས་དགོཔ་སྟོནམ་ཨིན། རྫོང་ཁ་འདི་ འབྲུག་གི་གཞུང་སྐད་དང་ རྒྱལ་ཡོངས་ཀྱི་ངོ་རྟགས་ཨིན།
ཕན་ཐོགས། ༡. རྒྱལ་ཁབ་ཀྱི་ ངོ་རྐྱང་དང་ རང་དབང་ བདག་འཛིན་འཐབ་ཚུགས། ༢. ཕྱོགས་ཡོངས་ཀྱི་མི་སེར་ཚུ་ བར་ན་ མཐུན་སྒྲིལ་དང་ གོ་བ་ལེན་ཚུགས། ༣. ལམ་སྲོལ་ ཆོས་ དཔེ་གཏམ་ ལོ་རྒྱུས་ཚུ་ མི་རབས་ཤུལ་མ་ལུ་ སྤྲོད་ཚུགས། ༤. གཞུང་གི་ལཱ་དང་ ཞབས་ཏོག་ཚུ་ ཁ་གསལ་སྦེ་ འབད་ཚུགས།
གནོད་པ། ༡. སྐད་ཡིག་ ཉམས་ཏེ་ ཕྱི་རྒྱལ་གྱི་སྐད་ལུ་ བརྟེན་དགོཔ་འོང་། ༢. རྒྱལ་ཁབ་ཀྱི་ ངོ་རྐྱང་ ཉམས་འགྱོ། ༣. ན་གཞོན་དང་ རྒས་ཤོས་བར་ན་ གོ་བ་ལེན་ནིའི་ བར་སྟོང་ཐོན། ༤. ལམ་སྲོལ་དང་ ཤེས་ཡོན་ཚུ་ བརླག་འགྱོ།
ཐབས་ལམ། ཁྱིམ་དང་ སློབ་གྲྭ་ ལཱ་གཡོག་ནང་ རྫོང་ཁ་ལག་ལེན་འཐབ་ནི། བརྙན་འཕྲིན་དང་ ཡོངས་འབྲེལ་ཐོག་ རྫོང་ཁ་ཡར་དྲག།
མཇུག་བསྡུ། རྫོང་ཁ་བདག་འཛིན་འཐབ་ནི་འདི་ འབྲུགཔ་རེ་རེ་གི་ འགན་ཁུར་ཨིན།', null, '[{"point": "མགོ་བཙུགས། དཔེ་གཏམ་གྱི་གོ་དོན་དང་ རྫོང་ཁ་ རྒྱལ་ཡོངས་ཀྱི་སྐད་ཡིག་ཨིན་པའི་གལ་གནད།", "marks": 5}, {"point": "ལག་ལེན་འཐབ་པའི་ཕན་ཐོགས་ (ངོ་རྐྱང་། མཐུན་སྒྲིལ། ལམ་སྲོལ་དང་ཆོས་ཀྱི་ཤེས་ཡོན། རང་དབང་།) དཔེ་དང་བཅས།", "marks": 10}, {"point": "ལག་ལེན་མ་འཐབ་པའི་གནོད་པ་ (སྐད་ཡིག་ཉམས། ངོ་རྐྱང་བརླག། ན་གཞོན་དང་རྒས་ཤོས་བར་ན་ བར་སྟོང་།)", "marks": 10}, {"point": "ཐབས་ལམ་དང་ མཇུག་བསྡུ།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'essay'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'E1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons and examples.', 16.5, 1 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 9.0, 2 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 4.5, 3 from me_q where key = 'E1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'essay', 'འོག་ལུ་བཀོད་ཡོད་པའི་ འབྲི་རྩོམ་ དོན་ཚན་གཉིས་ལས་ གཅིག་གདམ་ཁ་རྐྱབ་སྟེ་ ཚིག་འབྲུ་ ༦༠༠ གི་ནང་འཁོད་བྲིས། (སྐུགས་ ༣༠)
(བརྗོད་དོན་ལུ་སྐུགས་ ༡༧། ཚིག་སྦྱོར་ལུ་སྐུགས་ ༨། འབྲི་བཀོད་ལུ་སྐུགས་ ༥།)

སློབ་དཔོན་ཅིག་འབད་བའི་བསྒང་ལས་ རང་གི་སློབ་ཕྲུག་ཚུ་ལུ་ དཀར་ནག་བཙོང་ནི་དང་ ཉེ་རིང་ཕྱེ་ནིའི་བསམ་སྤྱོད་ཚུ་ དུག་བཟུམ་སྦེ་སྤང་དགོ། ཟེར་བའི་ཐོག་ལུ་ དཔེ་དང་བཅསཔ་སྦེ་ འབྲི་རྩོམ་ཅིག་བྲིས།', 'ལན་གྱི་དཔེ་ (outline)
མགོ་བཙུགས། སློབ་དཔོན་འདི་ སློབ་ཕྲུག་ཚུ་གི་ དཔེ་སྟོན་པ་ཨིན། ཕྱུགཔོ་དང་ དབུལཔོ་ ཕོ་མོ་ ཕྱོགས་ ཉེ་འབྲེལ་ ཡང་ན་ ཤེས་རབ་ཀྱི་ཁྱད་པར་ལུ་བལྟ་སྟེ་ ཉེ་རིང་ཕྱེ་པ་ཅིན་ སློབ་ཕྲུག་ཚུ་ལུ་ དུག་བཟུམ་གྱི་གནོད་པ་འོང་།
གནོད་པ། ཉེ་རིང་ཕྱེ་མི་སློབ་ཕྲུག་ཚུ་ སེམས་ཤུགས་ཆག་སྟེ་ སློབ་སྦྱོང་ལུ་ སྤྲོ་བ་ཉམས། སློབ་དཔོན་ལུ་ ཡིད་ཆེས་མེད། སློབ་ཁང་ནང་ མཐུན་སྒྲིལ་མེད་པར་ ཕྱོགས་རིས་ཐོན། དཔེར་ན་ སློབ་དཔོན་གྱིས་ སློབ་ཕྲུག་ལེགས་ཤོམ་ཚུ་ལུ་རྐྱངམ་ཅིག་ དྲི་བ་དྲིས་པ་ཅིན་ གཞན་ཚུ་ ཕྱི་ཁར་ལུས་འགྱོ།
ཐབས་ལམ། སློབ་ཕྲུག་ག་ར་ལུ་ འདྲ་མཉམ་གྱི་ གོ་སྐབས་བྱིན་ནི། སྐུགས་དང་ ཉེས་ཆད་ཚུ་ དྲང་བདེན་སྦེ་བྱིན་ནི། ཁྱད་པར་ཅན་གྱི་ ཁ་ཚར་ཡོད་མི་ཚུ་ལུ་ རྒྱབ་སྐྱོར་འབད་ནི། སྡེ་ཚན་ནང་ ལཱ་འབད་བཅུག་ནི།
མཇུག་བསྡུ། དྲང་བདེན་དང་ བྱམས་བརྩེ་ཡོད་པའི་ སློབ་དཔོན་གྱིས་ རྒྱལ་ཁབ་ཀྱི་ མི་རབས་ལེགས་ཤོམ་བཟོ་ཚུགས།', null, '[{"point": "མགོ་བཙུགས། སློབ་དཔོན་གྱི་འགན་ཁུར་དང་ དྲང་བདེན་གྱི་གལ་གནད།", "marks": 5}, {"point": "ཉེ་རིང་ཕྱེ་བའི་གནོད་པ་ (སློབ་ཕྲུག་གི་ སེམས་ཤུགས་ཆག། ཡིད་ཆེས་མེད། སྤྲོ་བ་ཉམས།) དཔེ་དང་བཅས།", "marks": 10}, {"point": "ཐབས་ལམ་ (སློབ་ཕྲུག་ག་ར་ལུ་ འདྲ་མཉམ། ལེགས་བཅོས་ དྲང་བདེན། ཁྱད་པར་ཅན་གྱི་ ཁ་ཚར་) དཔེ་དང་བཅས།", "marks": 10}, {"point": "མཇུག་བསྡུ།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'essay'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'E2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons and examples.', 16.5, 1 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 9.0, 2 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 4.5, 3 from me_q where key = 'E2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ ༥ གི་ལན་བྲིས། (སྐུགས་ ༥x༢=༡༠)

a) འོག་གི་བྱ་ཚིག་བརྒྱད་ལས་ དུས་གསུམ་ལུ་ཡིག་སྦྱོར་འགྱུར་བ་མེད་མི་ ༢ ལོགས་སུ་བཏོན་ཏེ་ དེ་གཉིས་ཀྱིས་ རྗོད་ཚིག་རེ་བཟོ།
བརླག། བཞུགས། ལྷོག། གཏང་། ལྷག། བསྒྲུབ། གནང་། བྲི། (2 marks)', 'a) བཞུགས། གནང་། (དུས་གསུམ་ནང་ ཡིག་སྦྱོར་འགྱུར་བ་མེད།) དཔེ། བླ་མ་ ལྷ་ཁང་ནང་ བཞུགས་ཡི། ཡབ་ཀྱིས་ ང་ལུ་ དཔེ་དེབ་ཅིག་ གནང་ཡི།', null, '[{"point": "བཞུགས། དང་ གནང་། ངོས་འཛིན་ (1) རྗོད་ཚིག་ ༢ (1)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Grammar answers are Claude''s best attempt (e.g. which verbs keep one form in all three tenses); check carefully."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-bedgen2025-l1', 1, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'L1a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons and examples.', 1.0, 1 from me_q where key = 'L1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'L1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ ༥ གི་ལན་བྲིས། (སྐུགས་ ༥x༢=༡༠)

b) མིང་ཚིག་ (གངས། དང་ དཀྲུགས།) ཟེར་མི་གཉིས་ལུ་ མིང་གཞི་དང་ རྗེས་འཇུག་གི་ཡི་གུ་ཚུ་ངོས་འཛིན་འབད། དེ་ཚུ་ མིང་གཞི་དང་ རྗེས་འཇུག་ཨིན་ཟེར་ ག་དེ་སྦེ་ཆ་བཞག་ནི་སྨོ? ཁུངས་བཀལ། (2 marks)', 'b) གངས། - མིང་གཞི་ ག རྗེས་འཇུག་ ང ཡང་འཇུག་ ས། (ཡི་གུ་གཉིས་ལས་ མིང་གཞི་ ཧེ་མ་ཨིན།) དཀྲུགས། - སྔོན་འཇུག་ ད མིང་གཞི་ ཀ (ར་བཏགས་ ཞབས་ཀྱུ་ཅན) རྗེས་འཇུག་ ག ཡང་འཇུག་ ས། (མགོ་ཅན་ འདོགས་ཅན་ དབྱངས་ཅན་ཡོད་མི་འདི་ མིང་གཞི་ཨིན།)', null, '[{"point": "གངས་ - མིང་གཞི་ ག རྗེས་འཇུག་ ང ཡང་འཇུག་ ས། དཀྲུགས་ - སྔོན་འཇུག་ ད མིང་གཞི་ ཀ རྗེས་འཇུག་ ག ཡང་འཇུག་ ས། ཁུངས།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Grammar answers are Claude''s best attempt (e.g. which verbs keep one form in all three tenses); check carefully."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-bedgen2025-l1', 2, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'L1b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons and examples.', 1.0, 1 from me_q where key = 'L1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'L1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ ༥ གི་ལན་བྲིས། (སྐུགས་ ༥x༢=༡༠)

c) གང་ཟག་གི་མིང་ཚབ་ག་ཅི་ར་སྨོ? རེ་རེ་བཞིན་བྲིས་ཞིན་ན་ མིང་ཚབ་ ༢ ལག་ལེན་འཐབ་སྟེ་ རྗོད་ཚིག་རེ་བཟོ། (2 marks)', 'c) ང་། ཁྱོད། ཁོ། མོ། ཁོང་། ང་བཅས། ཁྱོད་ཚུ། ཁོང་ཚུ། དཔེ། ང་ སློབ་གྲྭ་ལུ་འགྱོཝ་ཨིན། ཁོང་ ནངས་པ་ ཐིམ་ཕུག་ལུ་ འོང་འོང་།', null, '[{"point": "ང་། ཁྱོད། ཁོ། མོ། ཁོང་། ང་བཅས། ཁྱོད་ཚུ། ཁོང་ཚུ། (1) རྗོད་ཚིག་ ༢ (1)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Grammar answers are Claude''s best attempt (e.g. which verbs keep one form in all three tenses); check carefully."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-bedgen2025-l1', 3, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'L1c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons and examples.', 1.0, 1 from me_q where key = 'L1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'L1c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ ༥ གི་ལན་བྲིས། (སྐུགས་ ༥x༢=༡༠)

d) (ཆག། བཅག། དབོག། འཁྱིལ། རལ། ཧྲལ། ལྷོང་། རམ། ཧྲམ།) ཟེར་མི་ཚུ་ལས་ བྱེད་མེད་ལས་ཚིག་དང་ བྱེད་འབྲེལ་བྱ་ཚིག་ གཉིས་གཉིས་ངོས་འཛིན་འབད་དེ་ ཐིག་ཁྲམ་ནང་བྲིས། (2 marks)', 'd) བྱེད་མེད་ལས་ཚིག - ཆག། རལ། བྱེད་འབྲེལ་བྱ་ཚིག - བཅག། ཧྲལ།', null, '[{"point": "བྱེད་མེད་ - ཆག། རལ། བྱེད་འབྲེལ་ - བཅག། ཧྲལ། (དཔེ་གཞན་ཡང་འོས་འབབ)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Grammar answers are Claude''s best attempt (e.g. which verbs keep one form in all three tenses); check carefully."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-bedgen2025-l1', 4, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'L1d', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons and examples.', 1.0, 1 from me_q where key = 'L1d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L1d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'L1d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ ༥ གི་ལན་བྲིས། (སྐུགས་ ༥x༢=༡༠)

e) འབྲེལ་སྒྲའི་ཕྲད་ (ཀྱི་ དང་ གྱི་) གཉིས་ རྗེས་འཇུག་ག་ཅི་གི་མཐའ་མར་ཐོབ་ཨིན་ན་བྲིས་ཞིན་ན་ ཕྲད་དེ་གཉིས་བཙུགས་ཏེ་ དཔེར་བརྗོད་རེ་རྐྱབ། (2 marks)', 'e) ཀྱི་ - རྗེས་འཇུག་ ད་ བ་ ས་ གི་མཐའ་མར་ཐོབ། དཔེ། རྒྱལ་ཁབ་ཀྱི་ ལམ་སྲོལ། གྱི་ - རྗེས་འཇུག་ ན་ མ་ ར་ ལ་ གི་མཐའ་མར་ཐོབ། དཔེ། ལམ་གྱི་ ཁ།', null, '[{"point": "ཀྱི་ - ད་ བ་ ས་ གི་མཐའ་མར། གྱི་ - ན་ མ་ ར་ ལ་ གི་མཐའ་མར། དཔེར་བརྗོད་ ༢", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Grammar answers are Claude''s best attempt (e.g. which verbs keep one form in all three tenses); check carefully."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-bedgen2025-l1', 5, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'L1e', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons and examples.', 1.0, 1 from me_q where key = 'L1e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L1e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'L1e';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'སྦྱོར་བྱ་ཡི་གུའི་རྣམ་གཞག་ ཟེར་མི་འདི།', null, 'སྦྱོར་བ་ - མགོ་ཅན་དང་ འདོགས་ཅན་གྱི་ ཡི་གུ་སྦྱོར་ཐངས།', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-mcq'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'K1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'མགོ་ཅན་འདོགས་ཅན་གྱི་རྣམ་གཞག་ལུ་སླབ་ཨིན།', true, 1), ('B', 'དངོས་པོ་བདག་གཞན་གྱི་རྣམ་གཞག་ལུ་སླབ་ཨིན།', false, 2), ('C', 'སྔོན་འཇུག་རྗེས་འཇུག་གི་རྣམ་གཞག་ལུ་སླབ་ཨིན།', false, 3), ('D', 'གསལ་བྱེད་སུམ་ཅུ་གི་རྣམ་གཞག་ལུ་སླབ་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'K1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'འོག་གི་ཚིག་ཚུ་ལས་ སྔོན་འཇུག་ལུ་བརྟེན་ཏེ་ མིང་གཞིའི་རྗོད་སྒྲ་འགྱུར་འགྱོ་མི་ ག་འདི་ཨིན་ན?', null, 'སྔོན་འཇུག་ ད་ བ་ གི་ རྗོད་སྒྲ་ འགྱུར་ (དབང་ = wang)། Claude''s answer: check.', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-mcq'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'K2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'དབུགས། མནོ། དམན། དབང་། ཟེར་མི་ཚུ་ཨིན།', true, 1), ('B', 'བགམས། བདེན། འཆར། བཟང་། ཟེར་མི་ཚུ་ཨིན།', false, 2), ('C', 'བཏགས། གཞན། བཤད། བཅད། ཟེར་མི་ཚུ་ཨིན།', false, 3), ('D', 'གཏོགས། འཕར། བཀུར། གཏང་། ཟེར་མི་ཚུ་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'K2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ག་ཏེ་ལས་ཤིང་བཏོག་སྟེ་ ག་དེ་སྦེ་འབག་འོང་ནི་སྨོ? ཟེར་བའི་སྐབས་སུ།', null, 'ག་ཏེ་ (where) ཕྲད་མེན། ལྷག་བཅས་ སྟེ་ (བཏོག་སྟེ) རྐྱངམ་ཅིག Claude''s answer: check.', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-mcq'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'K3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ལྷག་བཅས་ཀྱི་ཕྲད་ ཏེ་དང་ སྟེ་ ཚུད་ནུག།', false, 1), ('B', 'ལྷག་བཅས་ཀྱི་ཕྲད་ ཏེ་ སྟེ་དང་ སྦེ་ ཚུད་ནུག།', false, 2), ('C', 'ལྷག་བཅས་ཀྱི་ཕྲད་ སྟེ་ རྐྱངམ་ཅིག་ཚུད་ནུག།', true, 3), ('D', 'ལྷག་བཅས་ཀྱི་ཕྲད་ ཏེ་ སྟེ་དང་ ལས་ ཚུད་ནུག།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'K3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'འོག་གི་ཚུ་ལས་ མ་འོངས་པའི་བྱ་ཚིག་མེན་མི་འདི།', null, 'ལྷག་གེས - བསྐུལ་ཚིག (let us read)། Claude''s answer: check.', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-mcq'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'K4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ཁོ་གིས་ལྷག་འོང་།', false, 1), ('B', 'ཁོང་གིས་ལྷག་དེས།', false, 2), ('C', 'ང་གིས་ལྷག་ནི།', false, 3), ('D', 'ང་བཅས་ཀྱིས་ལྷག་གེས།', true, 4)) as v(label, body, ok, pos) where me_q.key = 'K4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ཤིང་ལས་འབྲས་བུ་འཚོ། ཟེར་བ་ཅིན།', null, 'ལས་ - འབྱུང་ཁུངས་ (source)།', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-mcq'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'K5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'དགོས་ཆེད་ཀྱི་དཔེ་ཨིན་མས།', false, 1), ('B', 'འབྱུང་ཁུངས་ཀྱི་དཔེ་ཨིན་མས།', true, 2), ('C', 'བྱེད་པ་པོའི་དཔེ་ཨིན་མས།', false, 3), ('D', 'འབྲེལ་སྒྲ་གི་དཔེ་ཨིན་མས།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'K5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་ཐིག་ཁྲམ་ནང་གི་ བྱ་ཚིག་ཚུ་བལྟ་ཞིན་ན་ འདི་ཚུ་གི་ དུས་ཀྱི་དབྱེ་བ་དང་འཁྲིལ་ཏེ་ ས་སྟོང་བསྐང་། (སྐུགས་ ༡༠x½=༥)

མ་འོངས་པ། | ད་ལྟ་བ། | འདས་པ།
བསྒྲུབ། | (༡) | (༢)
(༣) | གཏང་། | (༤)
འབྲི། | (༥) | བྲིས།
(༦) | དཀྲོག། | (༧)
སྤུང་། | (༨) | (༩)
(༡༠) | ལྟབ། | བལྟབས།', '(༡) སྒྲུབ། (༢) བསྒྲུབས། (༣) གཏང་། (༤) བཏང་། (༥) འབྲི། (༦) དཀྲོག། (༧) དཀྲོགས། (༨) སྤུང་། (༩) སྤུངས། (༡༠) བལྟབ།', null, '[{"point": "(༡) སྒྲུབ།", "marks": 0.5}, {"point": "(༢) བསྒྲུབས།", "marks": 0.5}, {"point": "(༣) གཏང་།", "marks": 0.5}, {"point": "(༤) བཏང་།", "marks": 0.5}, {"point": "(༥) འབྲི།", "marks": 0.5}, {"point": "(༦) དཀྲོག།", "marks": 0.5}, {"point": "(༧) དཀྲོགས།", "marks": 0.5}, {"point": "(༨) སྤུང་།", "marks": 0.5}, {"point": "(༩) སྤུངས།", "marks": 0.5}, {"point": "(༡༠) བལྟབ།", "marks": 0.5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'verb-tenses'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'V1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons and examples.', 2.5, 1 from me_q where key = 'V1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 1.5, 2 from me_q where key = 'V1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 1.0, 3 from me_q where key = 'V1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ ལེགས་ཤོམ་སྦེ་ལྷག་ཞིནམ་ལས་ དྲི་བའི་ལན་བྲིས།

༉ དམ་པའི་ཆོས་ཀྱི་ལྟ་བ་དང་འཁྲིལཝ་ད་ སང་དང་འཇིག་རྟེན་ཕྱི་མ་གཉིས།། སྔོན་དུ་གང་འོང་ངེས་པ་མེད།། དེ་ཕྱིར་སང་ལ་མ་འབད་པར།། ཕྱི་མའི་དོན་ལ་འབད་པར་རིགས། ཟེར་བའི་སྐབས་སུ་ ཉིནམ་ནངས་པ་ཟེར་མི་འདི་དང་ ཚེ་ཤུལ་མ་ཟེར་མི་གཉིས་ལས་ ག་འདི་ཧེ་མར་འཐོན་འོང་ག་མི་ཤེས་ དེ་འབདཝ་ལས་ ནངས་པ་གི་དོན་ལུ་ལཱ་འབད་ནི་མེན་པར་ ཚེ་ཤུལ་མ་གི་དོན་ལུ་འབད་བ་ཅིན་དྲག། ཟེར་གསུངས་ནུག། ཨིན་རུང་ ང་བཅས་ར་འགྲོ་བ་མིའི་ལུས་ལུ་སྐྱེ་བ་ལེན་ཞིན་ན་ལས་ ང་ ཟེར་བའི་སེམས་ཅིག་ཡོད་པའི་སྐབས་ཀྱིས་ མི་ཚེ་གཉིས་མཐུད་རྐྱབ་སྟེ་སྡོད་ནི་ཡོདཔ་བཟུམ་སྦེ་ ཉིན་ནུབ་མེད་པར་ ལཱ་འབད་རིགས་འབད་ཚད་རྒྱུ་ནོར་ལོངས་སྤྱོད་དང་ གཏམ་སྙན་གྲགས་ཀྱི་དོན་ལུ་འབད་བའི་ཞོར་ལས་ རང་གི་ལཱ་འབད་ཐངས་དང་ བློ་སླབ་ཐངས་ཚུ་གིས་རོགས་ལུ་གནོད་མི་གནོད་དང་ རོགས་ཀྱི་སེམས་ཁར་ཕོག་མི་ཕོག་ཚུ་ དབྱེ་བ་ར་མ་དཔྱད་པར་ འབད་སར་མཐོངམ་མས།

རེ་ཚེ་སྐབས་ལུ་ ང་བཅས་ར་མིའི་ལུས་རྟེན་འདི་ལེན་ཏེ་ འཛམ་གླིང་ནང་སྐྱེ་བའི་ཉིནམ་ལས་ ང་བཅས་རའི་གཟུགས་ ཁར་བཟའ་འཐུང་གི་ཅ་ལ་བཟུམ་སྦེ་ གནས་ཡུན་གྱི་ཟླ་ཚེས་ཅིག་དངོས་སུ་མཐོང་ཚུགསཔ་སྦེ་ཡོད་རུང་བཏུབ་པས་ཟེར་མནོཝ་མས། དེ་སྦེ་ཡོད་པ་ཅིན་ རང་གི་ཟླ་ཚེས་ལུ་བལྟ་ཡི་ར་ རང་མ་ཤི་བར་སྡོད་ནི་གི་དུས་ཚོད་ཉུང་སུ་འགྱོ་བའི་ཚེ་ སྡིག་པའི་ལཱ་ངན་པ་ཚུ་བཞག་སྟེ་ དགེ་བའི་ལཱ་བཟང་པོ་ལུ་མང་སུ་མང་སུ་སྦེ་ བརྩོན་ཤུགས་བསྐྱེད་མི་འཐོན་ནི་ཨིན་མས།

ལོགས་གཅིག་ལས་བལྟཝ་ད་ ཧེ་མ་མིའི་བསྐལ་པ་འདི་ཆགས་པའི་བསྒང་ལས་ར་ ལུས་ཀྱིས་དགེ་བའི་ལཱ་འབདཝ་ད་ རྒྱུ་ནོར་ལོངས་སྤྱོད་ངམ་ངམ་ཤུགས་ཀྱིས་བཏགས་ནི་དང་ སེམས་ཀྱིས་མནོ་བསམ་ལེགས་ཤོམ་གཏངམ་ད་ར་ བྱད་ངོ་རིས་འཇའ་རིསམོ་ཐལ་བཏུབ་ནི་དང། ག་དེམ་ཅིག་སྦེ་ མནོ་བསམ་ཟོགཔ་གཏང་པ་ཅིན་ལོག་སྟེ་བཟོ་ཉེས་ལུ་འགྱུར་འགྱོ་ནི་ དེ་ལས་ ཁ་ལས་བློ་ལེགས་ཤོམ་སླབ་ད་ར་ ལོ་གཞོན་ཏེ་གདོང་གི་གཉེར་མ་ཚུ་ཡལ་ནི་དང་ གལ་སྲིད་ཀྱིས་རོགས་ལུ་སེམས་ལུ་ཕོག་པའི་བློ་རེ་སླབ་པ་ཅིན་ ལོ་ཚད་གཉིས་བལྟབ་སྦེ་རྒས་ཏེ་འགྱོ་ནི་ཡོད་པའི་ལམ་ལུགས་ཅིག་ཡོད་རུང་བཏུབ་པས་ཟེར་མནོཝ་མས།

འཁོར་བ་ཁབ་ཀྱི་རྩེ་ཙམ་ལ།། བདེ་བ་ནམ་ཡང་ཡོད་མ་ཡིན།། ཟེར་མི་ཚིགས་བཅད་དང་འཁྲིལ་བ་ཅིན་ ཁམས་གསུམ་འཁོར་བ་འདི་ ཁབ་ཀྱི་རྩེ་བཟུམ་སྦེ་ཆུང་ཀུ་ཅིག་ར་ཨིན། འདི་ནང་བདེ་བ་ཟེར་མི་འདི་མ་པ་ལས་མེད། ཟེརཝ་མས། དེ་ལས་མཁའ་འགྲོ་མ་འགྲོ་བ་བཟང་མོའི་རྣམ་ཐར་ནང་ འཇིག་རྟེན་ཉམས་སུ་དགའ་ཡང་རྨི་ལམ་ཙམ།། འདོད་ཡོན་ལོངས་སྤྱོད་ཆེ་ཡང་སྡིག་པའི་རྒྱུ།། ཟེར་བའི་སྐབས་ལུ་ མི་ཚེ་འདི་གཉིད་ལམ་ཅིག་དང་འདྲཝ་སྦེ་ ཡུདཔ་ཐེངས་ཅིག་ནང་གཉིད་ཚོར་བའི་བསྒང་ལས་ གཉིད་ལམ་དེ་ག་ཏེ་ཡང་མེད་པར་ཡལ་འགྱོ་དོ་བཟུམ་ མི་ཚེ་འདི་ཡང་ཡུདཔ་ཐེངས་ཅིག་ར་འོང་ནི་ཨིན་མས། དེ་སྦེ་མི་ཚེ་འདི་གཉིད་ལམ་བཟུམ་ཅིག་ལས་མེད་པ་ཅིན་ ད་རེས་སྡོད་པའི་རིང་ལུ་ རོགས་ཀྱི་རྣ་བར་མ་ཧན་པའི་གཏམ་སླབ་ནི་དང་ རོགས་ཀྱི་སེམས་ཁར་མ་འབབ་པའི་ལཱ་འབད་ནི་ཚུ་ལས་ ག་དེ་དྲག་དྲག་འཛེམ་དགོཔ་མིན་འདུག་ག་ ཟེར་མི་འདི་རང་གིས་རང་ལུ་དྲིས་ཏེ་བལྟ་དགོཔ་འདུག། ང་བཅས་ར་ཕར་ལོགས་མའི་མི་དང་འབྲེལ་བ་འཐབ་ད་ མེ་ལོང་ནང་བལྟ་དོ་བཟུམ་སྦེ་ཡང་ཚོརཝ་མས། ག་ཅི་སྦེ་ཟེར་བ་ཅིན་ རང་གིས་དགའ་འཛུམ་མ་སྟོན་པ་ཅིན་ མེ་ལོང་ནང་ལས་རང་ལུ་དགའ་འཛུམ་སྟོན་མི་བཏུབ་དོ་བཟུམ་སྦེ་ རོགས་ལུ་རང་གིས་ལེགས་ཤོམ་མ་འབད་བ་ཅིན་ རོགས་ཀྱིས་ཡང་རང་ལུ་ལེགས་ཤོམ་འབད་མི་བཏུབ། དཔེར་ན་ སྣུམ་འཁོར་ཅིག་བཏང་སྟེ་འགྱོ་རུང་ བདའ་རེ་བྱོག་རེ་རྐྱབ་དོ་བཟུམ་སྦེ་ སྣུམ་འཁོར་གཞན་ལས་རང་ཧེ་མར་ཐོན་ཏེ་འགྱོ་ཚུགས་པ་ཅིན་ གོ་ས་གོ་གནས་ཅིག་འཐོབ་ནི་ཡོདཔ་བ་ཡང་ལྷགཔ་སྦེ་ཚ་ངེར་བཏོན་ཏེ་ ཨ་ཙི་ཅིག་ཡང་སྒུག་ལོང་མེད་པར་སྣུམ་འཁོར་བརྡ་སྐད་རྐྱབ་ནི་དང་རོགས་ལུ་བལྟ་སྟེ་སྐད་རྐྱབ་ནི་ མིག་ངན་བལྟ་ནི་ཚུ་འབདཝ་མས། འདི་བཟུམ་མའི་འབད་གཞག་གིས་རོགས་ཀྱི་སེམས་དཀྲུགས་ཏེ་ རང་ལུ་མ་དགའ་བའི་མི་གི་གྱངས་ཁ་ལེ་ཤ་ཡར་སེང་འགྱོ་བའི་བསྒང་ལས་ ག་ཏེ་འགྱོ་རུང་ དཔེར་ན་ རང་གི་རྐང་མར་ལྷམ་མེད་པར་ རྐང་རྗེན་སྦེ་རང་ཡོད་སའི་ས་ཆ་ཅིག་ཁ་ལས་ཕར་ ལམ་འགྱོ་དོ་བཟུམ་སྦེ་དྲནམ་བཏོནམ་བཏོན་སར་སྡོད་དགོ།

འཇིག་རྟེན་པའི་དཔེ་གཏམ་ལས་ཡང་ འཆམ་མཐུནམ་རྒྱ་དང་བོད་ལུ་ཡང་དགོ། དགྲ་རྡོག་པའི་ར་བ་ཡང་མི་དགོ། ཟེར་ སླབ་སྲོལ་ཡོད་མི་ལྟར་དུ་ ང་བཅས་ར་འཆམ་མཐུན་པའི་མི་འདི་ གྱངས་ཁ་ག་དེམ་ཅིག་ར་ཡོད་རུང་ དེ་དང་བསྟུན་པའི་གྲོགས་རམ་དང་རྒྱབ་སྐྱོར་ཐོབ་པ་གིས་མ་ཚད་ འཆམ་མཐུནམ་མངམ་ད་ར་ བློ་ཡང་བདེ་ཏོག་ཏོ་འོངམ་ཨིན། དེ་འབདཝ་ད་ དགྲ་བྱང་ཕྱད་འདི་ ཕུད་རྡོག་གཅིག་ར་ཡོད་རུང་ དཔེ་ཅིག་འབདན་ མིག་ཏོ་ནང་རྡུལ་མ་ཆུང་ཀུ་ཅིག་གིས་ཡང་ གནམ་མེད་ས་མེད་ཟུག་རྐྱབ་སྟེ་ མ་བདེ་བའི་ཚོར་བ་བྱིན་དོ་བཟུམ་སྦེ་ར་ དགྲ་ཕུད་རྡོག་གཅིགཔོ་དེ་ཡང་ རྟག་བུ་ར་སེམས་ཁར་ཤར་ཏེ་འོང་པའི་བསྒང་ལས་རང་ལུ་དགའ་བ་ར་ལས་འབྱུང་མ་སྟེར་བའི་རྒྱུ་ངོ་མ་ཅིག་ དགྲ་བྱང་ཕྱད་འདི་ཨིན།

དེ་འབདཝ་ལས་བརྟེན་ཏེ་ དཔེར་ན་ སྤོ་ཏོ་ཅིག་གུར་འཕྱར་བཞག་པའི་ དར་ཤིང་གི་དར་འདབ་དེ་ ཉིན་རེ་བཞིན་དུ་ རླུང་མ་གིས་ ཧྲལ་ཡི་ར་རྫོགས་འགྱོ་དོ་བཟུམ་ ང་བཅས་རའི་མི་ཚེ་འདི་ཡང་ ལོ་ན་ཚོད་རྒས་ཅི་རྒས་ཅི་མི་ཚེ་རྫོགས་ནི་གུར་ཐུག་ནི་ཨིན་པ་གིས་མ་ཚད་ ལ་ལུ་ཅིག་འདི་ རླུང་མ་འཕུར་སའི་ས་གོ་ཅིག་ནང་ཕུལ་བཞག་བཞག་པའི་ དཀར་མེ་ཅིག་བཟུམ་སྦེ་ ག་དེམ་ཅིག་གི་རིང་ལུ་སྡོད་འོང་ག་མ་ཤེས་པར་ ནམ་ཤི་ནུམ་ཤི་མེད་པའི་མི་ཚེ་ཐུང་ཀུ་འདི་ནང་ རང་གི་ལོ་ན་ཚོད་འདི་ ཉིན་བསར་བཞིན་དུ་རྒས་ཅི་ར་འགྱོ་དོ་ཡོདཔ་ལས་ རྫོགས་རྫོགས་པའི་སངས་རྒྱས་ཡང་གཤེགས་ནི་འདུག་པ་ རང་བཟུམ་མའི་སེམས་ཅན་ལུ་འདི་ ཤི་ནི་ཟེར་མི་འདི་ཡོད་ར་ཡོདཔ་ལས་བརྟེན་ཏེ་ དེ་སྦེ་སྡོད་ནི་མེན་པར་ མི་ཚེ་འདི་དོན་དང་ལྡནམ་ཅིག་སྦེ་བཟོ་དགོ་པས་ཟེར་མནོ་སྟེ་ ནད་མ་འོངམ་ལས་རིམ་གྲོ། ཆུ་མ་འོངམ་ལས་གཡུར་བ། རྐྱབ་པ་ཅིན་མི་དྲག་ག་ཟེར་ཞུ་ནི་ཨིན།།

(ཀ) ༡) འཇིག་རྟེན་ཉམས་སུ་དགའ་ཡང་རྨི་ལམ་ཙམ།། འདོད་ཡོན་ལོངས་སྤྱོད་ཆེ་ཡང་སྡིག་པའི་རྒྱུ།། ཟེར་མི་འདི་གི་ འགྲེལ་བཤད་ཅིག་ རྫོང་ཁ་ནང་བྲིས། (སྐུགས་ 4)', 'འཇིག་རྟེན་གྱི་ བདེ་སྐྱིད་ཚུ་ ག་དེམ་ཅིག་ར་ དགའ་ཏོག་ཏོ་ཡོད་རུང་ རྨི་ལམ་བཟུམ་སྦེ་ ཡུདཔ་ཅིག་ནང་ ཡལ་འགྱོཝ་ཨིན། འདོད་ཡོན་དང་ ལོངས་སྤྱོད་ ག་དེམ་ཅིག་ར་ ཆེ་རུང་ དེ་ལུ་ ཆགས་སེམས་བསྐྱེད་པ་ཅིན་ སྡིག་པ་བསགས་ནིའི་ རྒྱུ་ལུ་འགྱུརཝ་ཨིན། དེ་འབདཝ་ལས་ ལོངས་སྤྱོད་ལུ་ ཞེན་ཆགས་མ་བསྐྱེད་པར་ དགེ་བའི་ལཱ་འབད་དགོ།', null, '[{"point": "འཇིག་རྟེན་གྱི་བདེ་སྐྱིད་ རྨི་ལམ་བཟུམ་ མི་རྟག་པ།", "marks": 2}, {"point": "ལོངས་སྤྱོད་ཆེ་རུང་ ཆགས་སེམས་ཀྱིས་ སྡིག་པའི་རྒྱུ་བཟོཝ།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-bedgen2025-cp', 1, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'C1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons and examples.', 2.5, 1 from me_q where key = 'C1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 1.0, 2 from me_q where key = 'C1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'C1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', '(ཀ) ༢) འཁོར་བ་ཁབ་ཀྱི་རྩེ་ཙམ་ལ།། བདེ་བ་ནམ་ཡང་ཡོད་མ་ཡིན།། ཟེར་མི་གི་ འཁོར་བ་དེ་ནང་ ང་བཅས་མི་ཚུ་ཡང་ཚུདཔ་ཨིན། སྟེ་ བདེ་བ་ནམ་ཡང་ཡོད་མ་ཡིན། ཟེར་མི་ལུ་ ཁྱོད་ཀྱིས་ཆ་བཞག་ཚུགས་ག? བསམ་འཆར་བྲིས། (སྐུགས་ 4)', 'ང་གིས་ ཆ་བཞག་ཚུགས། རྒྱུ་མཚན་ཡང་ མི་ཚུ་ སྐྱེ་བ་ རྒ་བ་ ན་བ་ འཆི་བའི་ སྡུག་བསྔལ་ལས་ ཐར་མ་ཚུགས། ནོར་དང་ གོ་གནས་ཐོབ་རུང་ མི་རྟག་པས་ ཡུན་རིང་མི་སྡོད། ཨིན་རུང་ མི་གཞན་ལུ་ ཕན་པའི་ལཱ་འབད་དེ་ སེམས་ཁར་ ཆོག་ཤེས་ཡོད་པ་ཅིན་ ནང་སེམས་ཀྱི་བདེ་བ་ ཚད་ཅིག་ཐོབ་ཚུགས་ཟེར་ ང་མནོཝ་ཨིན།', null, '[{"point": "ཁྱོད་རའི་ལན་ (ཆ་བཞག/མི་བཞག) ཁ་གསལ།", "marks": 1}, {"point": "རྒྱུ་མཚན་དང་ དཔེ་ (སྐྱེ་རྒ་ན་འཆི། མི་རྟག་པ། ཡང་ན་ ནང་སེམས་ཀྱི་བདེ་བ།)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-bedgen2025-cp', 2, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'C2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons and examples.', 2.5, 1 from me_q where key = 'C2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 1.0, 2 from me_q where key = 'C2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'C2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', '(ཀ) ༣) འཆམ་མཐུནམ་རྒྱ་དང་བོད་ལུ་ཡང་དགོ། དགྲ་རྡོག་པའི་ར་བ་ཡང་མི་དགོ། ཟེར་མི་དཔེ་གཏམ་དེ་གི་ གོ་དོན་བྲིས། (སྐུགས་ 4)', 'འཆམ་མཐུན་ཅན་གྱི་ མཛའ་རོགས་ཚུ་ རྒྱ་ནག་དང་ བོད་ཚུན་ ག་ཏེ་ར་ཡོད་རུང་ དགོཔ་ཨིན། ག་ཅི་སྦེ་ཟེར་བ་ཅིན་ དེ་ཚུ་ལས་ གྲོགས་རམ་དང་ རྒྱབ་སྐྱོར་ཐོབ་ཚུགས། དགྲ་ འདི་ ར་བ་ཅིག་ནང་ ཕུད་རྡོག་གཅིག་ར་ཡོད་རུང་ མི་དགོ། མིག་ཏོ་ནང་ རྡུལ་ཆུང་ཀུ་ཅིག་ཡོད་རུང་ ཟུག་རྐྱབ་དོ་བཟུམ་ དགྲ་གཅིག་གིས་ཡང་ སེམས་ཁར་ མ་བདེཝ་བཟོཝ་ཨིན།', null, '[{"point": "འཆམ་མཐུན་གྱི་མི་ ག་དེམ་ཅིག་ར་ མང་རུང་ ལེགས་ཤོམ་ཨིན།", "marks": 2}, {"point": "དགྲ་ གཅིག་ར་ཡོད་རུང་ གནོད་པ་འབྱུང་།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-bedgen2025-cp', 3, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'C3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons and examples.', 2.5, 1 from me_q where key = 'C3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 1.0, 2 from me_q where key = 'C3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'C3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', '(ཀ) ༤) ང་བཅས་ར་མིའི་གཟུགས་ཁར་ བཟའ་འཐུང་གི་ཅ་ལ་ཅིག་བཟུམ་སྦེ་ གནས་ཡུན་གྱི་ཟླ་ཚེས་ཡོདཔ་དྲག་ག་ མེདཔ་དྲག? གྱལ་དོན་མཚམས་ཐུང་ཀུ་ཅིག་ནང་ ཁུངས་བཀལ་ཏེ་བྲིས། (སྐུགས་ 4)', 'ང་གི་བསམ་འཆར་ལུ་ ཡོདཔ་དྲག། ཡིག་རྒྱུགས་ནང་ བཀོད་དོ་བཟུམ་ རང་གི་ ཚེ་ཚད་ཤེས་པ་ཅིན་ དུས་ཚོད་ཉུང་སུ་འགྱོ་བའི་ཚེ་ སྡིག་པའི་ལཱ་ཚུ་བཞག་སྟེ་ དགེ་བའི་ལཱ་ལུ་ བརྩོན་ཤུགས་བསྐྱེད་འོང་། དེ་མ་ཚད་ དུས་ཚོད་ལུ་ གཅེས་ཕྲུག་འབད་ མི་ཚེ་ དོན་དང་ལྡནམ་སྦེ་བཟོ་འོང་། ཨིན་རུང་ ལ་ལུ་ཅིག་ འཇིགས་སྣང་ཐོན་ནི་ཡང་ཡོདཔ་ལས་ སེམས་ཤུགས་ ཁྲེལ་མ་ཆག་པར་ བཞག་དགོ།', null, '[{"point": "ལན་ཁ་གསལ་ (ཡོདཔ་དྲག/མེདཔ་དྲག)", "marks": 1}, {"point": "རྒྱུ་མཚན་ ༢ (ཡིག་རྒྱུགས་དང་འཁྲིལ་ཏེ་ དགེ་བ་ལུ་བརྩོན། ཡང་ན་ འཇིགས་སྣང་དང་ སེམས་ཤུགས་ཆག)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-bedgen2025-cp', 4, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'C4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons and examples.', 2.5, 1 from me_q where key = 'C4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 1.0, 2 from me_q where key = 'C4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'C4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', '(ཀ) ༥) ནད་མ་འོངམ་ལས་རིམ་གྲོ། ཆུ་མ་འོངམ་ལས་གཡུར་བ། ཟེར་མི་གཉིས་ཆ་ར་ དཔེ་ཨིན་མས། དཔེ་དེ་གཉིས་ཀྱིས་ དོན་དག་ངོ་མ་ག་ཅི་སྟོནམ་སྨོ? (སྐུགས་ 4)', 'དཔེ་དེ་གཉིས་ཀྱིས་ ནད་དང་ ཆུ་ལོག་ མ་འོང་པའི་ཧེ་མ་ར་ རིམ་གྲོ་དང་ གཡུར་བ་རྐྱབ་དགོ་དོ་བཟུམ་ ཉེན་ཁ་མ་འོང་བའི་ཧེ་མ་ར་ གྲབ་རིམ་འབད་དགོཔ་སྟོནམ་ཨིན། ཡིག་རྒྱུགས་ནང་ འཆི་བ་ ནམ་འོང་ག་མི་ཤེས་པས་ ད་ལྟ་ར་ མི་ཚེ་འདི་ དོན་དང་ལྡནམ་སྦེ་ དགེ་བའི་ལཱ་འབད་དགོཔ་ ཟེར་སྟོནམ་ཨིན།', null, '[{"point": "ཉེན་ཁ་མ་འོང་བའི་ཧེ་མ་ར་ ཐབས་ཤེས་/ གྲབ་རིམ་འབད་དགོཔ།", "marks": 2}, {"point": "ཡིག་རྒྱུགས་ནང་ - འཆི་བ་མ་འོང་བའི་ཧེ་མ་ མི་ཚེ་ དོན་ལྡན་/ དགེ་བའི་ལཱ་འབད་དགོཔ།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-bedgen2025-cp', 5, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'C5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons and examples.', 2.5, 1 from me_q where key = 'C5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 1.0, 2 from me_q where key = 'C5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'C5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', '(ཁ) འོག་གི་དྲི་བ་རེ་ལུ་ ལན་བཞི་རེ་ཡོད་ས་ལས་ ལན་ངོ་མ་འདི་ གདམ་ཁ་རྐྱབ་སྟེ་བྲིས། (སྐུགས་ ༥x༡=༥)
༡) རྐང་རྗེན་ ཟེར་མི་འདི། ཀ རྐངམ་གི་རྒྱན་ཆ་ལུ་སླབ་ཨིན། ཁ རྐངམ་ལུ་ཞེ་ས་སྦེ་སླབ་ཨིན། ག རྐངམ་གི་པར་ལུ་སླབ་ཨིན། ང རྐངམ་སྟོངམ་ལུ་སླབ་ཨིན།
༢) ཉིན་ནུབ་མེད་པར། ཟེརཝ་ད་ ཉིན་ནུབ་ཀྱི་རྣམ་གྲངས་འདི་ ...... ཨིན། ཀ ཉིན་ཕྱེད་ ཁ ཉིན་ཞག་ ག ཉིན་མཚན་ ང ཉིན་དགུང་
༣) ག་དེ་དྲག་དྲག་འཛེམ་དགོཔ་མིན་འདུག་ག? ཟེརཝ་ད་ འཛེམ་གྱི་དོན་དག་འདི། ཀ བག་ཟོན་འབད་ནི་ལུ་གོཝ་ཨིན། ཁ འདྲོག་བྱེལ་འཐབ་ནི་ལུ་གོཝ་ཨིན། ག གཡང་འདྲོག་གསག་ནི་ལུ་གོཝ་ཨིན། ང སེམས་ཚབ་ཚུབ་འབད་ནི་ལུ་གོཝ་ཨིན།
༤) བྱད་ངོ་རིས། ཟེར་མི་དང་ དོན་དག་མ་འདྲ་མི་འདི། ཀ གདོང་གི་བཟོ་བལྟ། ཁ གདོང་གི་སྤར་གཞི། ག གདོང་གི་མཁུར་ཚོས། ང གདོང་གི་མཐོང་ཚུལ།
༥) དཔྱལཝ་ཨོ་ཀྲོ་བསུམ་ནི་འདི་ གདོང་གི་རྣམ་འགྱུར་ངན་པ་ཅིག་ཨིན་པ་ཅིན་ མིག་ཏོ་གི་རྣམ་འགྱུར་ངན་པ་འདི། ཀ མིག་ལྟོས་བལྟ་ནི་འདི་ཨིན། ཁ མིག་ངན་བལྟ་ནི་འདི་ཨིན། ག མིག་དཔེ་བལྟ་ནི་འདི་ཨིན། ང མིག་ཟུར་བལྟ་ནི་འདི་ཨིན། (སྐུགས་ 5)', '༡) ང  ༢) ག  ༣) ཀ  ༤) ང  ༥) ཁ', null, '[{"point": "༡) ང", "marks": 1}, {"point": "༢) ག", "marks": 1}, {"point": "༣) ཀ", "marks": 1}, {"point": "༤) ང (Claude: check)", "marks": 1}, {"point": "༥) ཁ", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-bedgen2025-cp', 6, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'C6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons and examples.', 2.5, 1 from me_q where key = 'C6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 1.5, 2 from me_q where key = 'C6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 1.0, 3 from me_q where key = 'C6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', '(ག) འོག་གི་མིང་ཚིག་གི་རྣམ་གྲངས་ གོང་གི་ཡིག་རྒྱུགས་ནང་ལས་འཚོལ་ཏེ་བྲིས། (སྐུགས་ ༥x༡=༥)
༡) ཐལཝ། ༢) གདོང་གི་ཐང་ཁུག། ༣) གང་མགྱོགས་རྐྱབ། ༤) བསམ་པ་ངན་པ། ༥) ཕྱོགས་གཅིག་ལས། (སྐུགས་ 5)', '༡) འགྱུར་ ༢) གདོང་གི་གཉེར་མ། ༣) ཚ་ངེར། ༤) མནོ་བསམ་ཟོགཔ། ༥) ལོགས་གཅིག་ལས། (Claude''s answers: check)', null, '[{"point": "༡) འགྱུར་ (འགྱུར་འགྱོ)", "marks": 1}, {"point": "༢) གདོང་གི་གཉེར་མ།", "marks": 1}, {"point": "༣) ཚ་ངེར་ (བཏོན)", "marks": 1}, {"point": "༤) མནོ་བསམ་ཟོགཔ།", "marks": 1}, {"point": "༥) ལོགས་གཅིག་ལས།", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-bedgen2025-cp', 7, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'C7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons and examples.', 2.5, 1 from me_q where key = 'C7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 1.5, 2 from me_q where key = 'C7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 1.0, 3 from me_q where key = 'C7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', '(ང) འོག་གི་མིང་ཚིག་ ༥ གི་རྗོད་ཚིག་རེ་བཟོ། (ཡིག་རྒྱུགས་ནང་ལས་ འདྲ་བཤུས་ཕབ་མི་ཆོག) (སྐུགས་ ༡x༥=༥)
༡) རྒྱུ་ནོར། ༢) རེ་ཚེ་སྐབས། ༣) གནས་ཡུན། ༤) སྙན་གྲགས། ༥) སྒུག་ལོང་མེད། (སྐུགས་ 5)', '༡) རྒྱུ་ནོར་ ག་དེམ་ཅིག་ཡོད་རུང་ ཆོག་ཤེས་མེད་པ་ཅིན་ བདེ་བ་མི་འོང་། ༢) རེ་ཚེ་སྐབས་ ཁོ་ ང་གི་ཁྱིམ་ལུ་ ལྷོད་ཡི། ༣) སྨན་འདི་གི་ གནས་ཡུན་ ཟླཝ་དྲུག་ཨིན། ༤) ཁོ་ ཞབས་ཏོག་ལེགས་ཤོམ་འབད་ནི་ལུ་ སྙན་གྲགས་ཆེ། ༥) ལཱ་ལེ་ཤ་ཡོདཔ་ལས་ ང་ སྒུག་ལོང་མེད།', null, '[{"point": "༡) རྒྱུ་ནོར། རྗོད་ཚིག་ཁ་གསལ།", "marks": 1}, {"point": "༢) རེ་ཚེ་སྐབས།", "marks": 1}, {"point": "༣) གནས་ཡུན།", "marks": 1}, {"point": "༤) སྙན་གྲགས།", "marks": 1}, {"point": "༥) སྒུག་ལོང་མེད།", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-bedgen2025-cp', 8, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'C8', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons and examples.', 2.5, 1 from me_q where key = 'C8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 1.5, 2 from me_q where key = 'C8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 1.0, 3 from me_q where key = 'C8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'translation', 'འོག་ལུ་ཨིང་སྐད་ནང་བཀོད་ཡོད་མི་འདི་ རྫོང་ཁའི་ཐོག་ལུ་སྐད་སྒྱུར་འབད། (སྐུགས་ ༡༥)

Teachers are expected to meet the needs and strengths of learners with different backgrounds to provide effective appropriate instructions. They take into account following various key concepts to engage learners in daily classroom instructions.
Key concepts: 1. Differentiated teaching strategies 2. Gender 3. Needs 4. Interests 5. Experiences
Differentiated teaching strategies refer to the approaches or innovative procedures used to reach a goal involving a wide variety of texts, tasks, processes and products suited to the various learning needs of a diverse range of learners.
Gender refers to the social, opportunities and challenges associated with being male and female.
Needs are observable gaps between a learner''s present knowledge or the competence and the curriculum standards identified as necessary for the class level.
Interests are personal preferences, likes or dislikes, which must be considered in the teaching-learning process.
Experiences refer to skills or knowledge that a learner gets from doing something.
Differentiated instructions based on learners'' gender creates equal educational opportunities for learners to begin in the classroom and with the teacher. A teacher needs to promote learning experiences that are equitable for all learners without showing a preference for any group or individual over the other.
The following are some suggestive teaching strategies to address gender equality in the teaching-learning process:
- establish and use class rules targeted to promote equality by engaging learners.
- use a classroom seating plan that supports equal participation of both boys and girls.
- have academic and behaviour expectations for all learners by avoiding making things easier for either male or female learners.
- use group activities regularly to maximise learner engagement, both male and female, especially those who are not comfortable speaking in front of large classes.
- use gender-neutral language when referring to a group or in the instructional process.', 'ལན་གྱི་དཔེ།
སློབ་དཔོན་ཚུ་གིས་ རྒྱབ་ཁུངས་མ་འདྲཝ་ཡོད་པའི་ སློབ་ཕྲུག་ཚུ་གི་ དགོས་མཁོ་དང་ ནུས་ཤུགས་ཚུ་ཧ་གོ་སྟེ་ ཕན་ཐོགས་དང་ འོས་འབབ་ཅན་གྱི་ སློབ་སྟོན་འབད་དགོཔ་ཨིན། ཁོང་ཚུ་གིས་ ཉིན་བསར་གྱི་ སློབ་ཁང་ནང་ སློབ་ཕྲུག་ཚུ་ མཉམ་ཞུགས་འབད་བཅུག་ནིའི་དོན་ལུ་ གནད་དོན་གལ་ཅན་ འོག་གི་ཚུ་ ཆ་བཞག་དགོ།
གནད་དོན་གལ་ཅན། ༡. ཁྱད་པར་ཅན་གྱི་ སློབ་སྟོན་ཐབས་ལམ། ༢. ཕོ་མོ། ༣. དགོས་མཁོ། ༤. དགའ་ཕྱོགས། ༥. ཉམས་མྱོང་།
ཁྱད་པར་ཅན་གྱི་ སློབ་སྟོན་ཐབས་ལམ་ ཟེར་མི་འདི་ སློབ་ཕྲུག་སྣ་མང་གི་ སློབ་སྦྱོང་དགོས་མཁོ་དང་ འཁྲིལ་བའི་ ཡིག་ཆ་ ལཱ་ བྱ་རིམ་ དེ་ལས་ ཐོན་འབྲས་ སྣ་མང་ཅིག་ལག་ལེན་འཐབ་སྟེ་ དམིགས་ཡུལ་ལུ་ལྷོད་ནིའི་ ཐབས་ལམ་ ཡང་ན་ གསར་བཏོད་ཀྱི་ བྱ་རིམ་ཚུ་ལུ་གོཝ་ཨིན།
ཕོ་མོ་ ཟེར་མི་འདི་ ཕོ་དང་མོ་ཨིན་མི་ལུ་ འབྲེལ་བ་ཡོད་པའི་ སྤྱི་ཚོགས་ཀྱི་ གོ་སྐབས་དང་ གདོང་ལེན་ཚུ་ལུ་གོཝ་ཨིན།
དགོས་མཁོ་ ཟེར་མི་འདི་ སློབ་ཕྲུག་གི་ ད་ལྟོའི་ ཤེས་ཡོན་ ཡང་ན་ ལྕོགས་གྲུབ་དང་ འཛིན་རིམ་དེ་ལུ་ དགོཔ་སྦེ་ ངོས་འཛིན་འབད་ཡོད་པའི་ སློབ་རིམ་གྱི་ ཚད་གཞི་གཉིས་ཀྱི་བར་ན་ མཐོང་ཚུགས་པའི་ བར་སྟོང་ཚུ་ཨིན།
དགའ་ཕྱོགས་ ཟེར་མི་འདི་ སློབ་སྟོན་དང་ སློབ་སྦྱོང་གི་ བྱ་རིམ་ནང་ ཆ་བཞག་དགོ་པའི་ རང་སོའི་ དགའ་མི་དགའ་ཚུ་ཨིན།
ཉམས་མྱོང་ ཟེར་མི་འདི་ སློབ་ཕྲུག་གིས་ ལཱ་ཅིག་འབད་དེ་ཐོབ་པའི་ ལག་ཤེས་ ཡང་ན་ ཤེས་ཡོན་ལུ་གོཝ་ཨིན།
ཕོ་མོ་ལུ་གཞི་བཞག་པའི་ ཁྱད་པར་ཅན་གྱི་ སློབ་སྟོན་གྱིས་ སློབ་ཁང་ནང་ དང་ སློབ་དཔོན་དང་གཅིག་ཁར་ སློབ་ཕྲུག་ཚུ་ལུ་ འདྲ་མཉམ་གྱི་ ཤེས་ཡོན་གོ་སྐབས་བཟོཝ་ཨིན། སློབ་དཔོན་གྱིས་ སྡེ་ཚན་ ཡང་ན་ མི་ངོ་ཅིག་ལུ་ ཕྱོགས་རིས་མ་འབད་བར་ སློབ་ཕྲུག་ག་ར་ལུ་ འདྲ་མཉམ་གྱི་ སློབ་སྦྱོང་ཉམས་མྱོང་ ཡར་དྲག་གཏང་དགོ།
སློབ་སྟོན་སློབ་སྦྱོང་ནང་ ཕོ་མོ་འདྲ་མཉམ་གྱི་དོན་ལུ་ སློབ་སྟོན་ཐབས་ལམ་ ལ་ལུ་ཅིག་ འོག་ལུ་བཀོད་ཡོད།
- སློབ་ཕྲུག་ཚུ་ མཉམ་ཞུགས་འབད་བཅུག་སྟེ་ འདྲ་མཉམ་ཡར་དྲག་གཏང་ནིའི་ སློབ་ཁང་གི་ སྒྲིག་གཞི་ཚུ་ བཟོ་སྟེ་ ལག་ལེན་འཐབ།
- བུ་དང་བུམོ་ཚུ་ འདྲ་མཉམ་སྦེ་ མཉམ་ཞུགས་འབད་ནིའི་ སློབ་ཁང་གི་ སྡོད་ས་གི་ འཆར་གཞི་ ལག་ལེན་འཐབ།
- ཕོ་ ཡང་ན་ མོ་ གང་རུང་ལུ་ ལཱ་འཇམ་ཏོང་ཏོ་མ་བཟོ་བར་ སློབ་ཕྲུག་ག་ར་ལུ་ ཤེས་ཡོན་དང་ སྤྱོད་ལམ་གྱི་ རེ་བ་འདྲ་མཉམ་བཞག།
- སྡེ་ཚན་གྱི་ལཱ་ཚུ་ རྟག་བུ་ར་ལག་ལེན་འཐབ་སྟེ་ བུ་དང་བུམོ་ ཁྱད་པར་དུ་ སློབ་ཕྲུག་ལེ་ཤའི་མདུན་ལུ་ ཁ་སླབ་ནི་ལུ་ སྤོབས་པ་མེད་མི་ཚུ་ མཉམ་ཞུགས་མང་སུ་འབད་བཅུག།
- སྡེ་ཚན་ཅིག་ ཡང་ན་ སློབ་སྟོན་གྱི་ བྱ་རིམ་ནང་ ཕོ་མོ་ ཕྱོགས་རིས་མེད་པའི་ ཚིག་ལག་ལེན་འཐབ།', null, '[{"point": "དོན་ཚན་དང་པ་ - སློབ་དཔོན་གྱི་འགན་དང་ གནད་དོན་ ༥ ཚུ་ ཁ་གསལ་སྦེ་ སྐད་སྒྱུར།", "marks": 4}, {"point": "གནད་དོན་ ༥ གི་ ངེས་ཚིག་ (ཁྱད་པར་ཅན་གྱི་སློབ་སྟོན་ ཕོ་མོ་ དགོས་མཁོ་ དགའ་ཕྱོགས་ ཉམས་མྱོང་) དོན་མ་འཛོལ་བར།", "marks": 5}, {"point": "ཕོ་མོ་འདྲ་མཉམ་གྱི་ ཐབས་ལམ་ ༥ ཚུ་ཆ་ཚང་།", "marks": 4}, {"point": "ཚིག་སྦྱོར་དང་ ཡིག་སྦྱོར་ ངེས་བདེན།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'translation'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (General Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'T1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons and examples.', 8.5, 1 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 4.5, 2 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 2.0, 3 from me_q where key = 'T1';
commit;
