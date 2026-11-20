-- ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'comprehension', 'Comprehension' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'essay', 'Essay' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'grammar', 'Grammar' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'grammar-mcq', 'Grammar MCQ' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'grammar-in-use', 'Grammar in use' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'translation', 'Translation' on conflict (subject_id, slug) do nothing;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-bed-1') and subject_group_id is not distinct from (select id from public.subject_groups where code = 'bed-dzongkha-graduates');
insert into public.paper_group_settings (paper_id, subject_group_id, duration_minutes, reading_minutes, max_marks, source) values ((select id from public.exam_papers where code = 'me-bed-1'), (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), 180, 15, 100, 'BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates') on conflict (paper_id, subject_group_id) do update set duration_minutes = excluded.duration_minutes, reading_minutes = excluded.reading_minutes, max_marks = excluded.max_marks, source = excluded.source;
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-1'), (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, 1, 'Question 1: Essay (འབྲི་རྩོམ།)', 'essay', 2, 30, 1, 'BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-1'), (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), 'grammar', 2, 'Question 2 (ka): Grammar questions (ཡིག་སྦྱོར།)', 'short_answer', 1, 10, null, 'BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-1'), (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, 3, 'Question 2 (kha): Multiple choice', 'mcq', 5, 1, null, 'BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-1'), (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), 'grammar-in-use', 4, 'Question 2 (ga): Grammar in use', 'short_answer', 1, 5, null, 'BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-1'), (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, 5, 'Question 3: Comprehension (གོ་བ་ལེན་ནི།)', 'passage', 1, 35, null, 'BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-1'), (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, 6, 'Question 4: Translation (སྐད་སྒྱུར།)', 'translation', 1, 15, null, 'BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'essay', 'འོག་ལུ་བཀོད་དེ་ཡོད་པའི་ འབྲི་རྩོམ་གྱི་དོན་ཚན་གཉིས་ལས་ གཅིག་གདམ་ཁ་རྐྱབ་སྟེ་ ཚིག་འབྲུ་ ༦༠༠ ལྷགཔ་ཅིག་ནང་བྲིས། (སྐུགས་ ༣༠)
(བརྗོད་དོན་ལུ་སྐུགས་ ༡༥། ཚིག་སྦྱོར་ལུ་སྐུགས་ ༡༠། འབྲི་བཀོད་ལུ་སྐུགས་ ༥།)

འཇིག་རྟེན་པའི་དཔེ་གཏམ་ དམ་ཆོས་མ་ཧ། འཇིག་རྟེན་མ་ཕྱི། ཟེར་སླབ་སྲོལ་ཡོད་མི་འདི་ལུ་ ཁྱོད་ཀྱིས་ རྒྱབ་སྣོན་དང་ ཡང་ན་ རྒྱབ་འགལ་གྱི་བསམ་འཆར་ཅིག་ བདེན་ཁུངས་གཟང་སྟེ་བྲིས།', 'ལན་གྱི་དཔེ་ (outline) - རྒྱབ་སྣོན།
མགོ་བཙུགས། དམ་ཆོས་མ་ཧ། འཇིག་རྟེན་མ་ཕྱི། ཟེར་མི་འདི་གིས་ ཆོས་ཀྱི་ལཱ་ལུ་ ཧ་ཅང་ ཧེ་མར་མ་བཏོན་ འཇིག་རྟེན་གྱི་ལཱ་ལུ་ ཕྱི་ཁར་མ་ལུས་པར་ གཉིས་ཆ་ར་ ཆ་སྙོམས་སྦེ་འབད་དགོཔ་སྟོནམ་ཨིན། ང་གིས་ རྒྱབ་སྣོན་འབདཝ་ཨིན།
བདེན་ཁུངས། ༡. མི་ཚེ་འདི་ནང་ བཟའ་འཐུང་ གྱོན་ཆས་ སྡོད་ས་དང་ བཟའ་ཚང་གི་ འགན་ཁུར་ཚུ་ འཕྲོ་མཐུད་དགོཔ་ལས་ ལཱ་དང་ཤེས་ཡོན་ལུ་ བརྩོན་དགོ། ༢. ཆོས་ཀྱི་ ལྟ་བ་ ཀུན་སྤྱོད་ བྱམས་བརྩེ་ཚུ་མེད་པ་ཅིན་ ནོར་ཡོད་རུང་ སེམས་ཁར་ བདེ་བ་མི་འོང་། ༣. རྒྱལ་ཡོངས་དགའ་སྐྱིད་དཔལ་འཛོམས་ཀྱི་ ལམ་སྲོལ་ཡང་ ཕྱི་ནང་གི་ གོང་འཕེལ་ ཆ་སྙོམས་འབད་ནི་ཨིན། ༤. སྐྱབས་རྗེ་ཞབས་དྲུང་རིན་པོ་ཆེ་ བཟུམ་གྱི་ མཁས་པ་ཚུ་གིས་ ཆོས་སྲིད་གཉིས་ལྡན་གྱི་ ལམ་ལུགས་བཙུགས་གནང་ཡོདཔ།
ཕྱོགས་གཞན། ལ་ལུ་གིས་ ཆོས་རྐྱངམ་ཅིག་ ཁག་ཆེ་ཟེར་ཨིན་རུང་ མི་ཚེ་འདི་ ཆ་ཚང་སྦེ་མ་བསྐྱང་པ་ཅིན་ ཆོས་ཀྱང་ བསྒྲུབ་མི་ཚུགས།
མཇུག་བསྡུ། ཆོས་དང་འཇིག་རྟེན་ ཆ་སྙོམས་སྦེ་ཡོད་པ་ཅིན་ མི་ཚེ་ དོན་དང་ལྡནམ་འོང་།', null, '[{"point": "མགོ་བཙུགས། དཔེ་གཏམ་གྱི་གོ་དོན་དང་ རང་གི་ཕྱོགས་ (རྒྱབ་སྣོན/རྒྱབ་འགལ) ཁ་གསལ།", "marks": 5}, {"point": "བདེན་ཁུངས་ ༣ ལས་ལྷག་ ལུང་དང་རིག་པ་ དཔེ་དང་བཅས།", "marks": 15}, {"point": "ཕྱོགས་གཞན་གྱི་ བསམ་འཆར་ལུ་ ལན།", "marks": 5}, {"point": "མཇུག་བསྡུ།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'essay'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'E1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 15.0, 1 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 10.5, 2 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 4.5, 3 from me_q where key = 'E1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'essay', 'འོག་ལུ་བཀོད་དེ་ཡོད་པའི་ འབྲི་རྩོམ་གྱི་དོན་ཚན་གཉིས་ལས་ གཅིག་གདམ་ཁ་རྐྱབ་སྟེ་ ཚིག་འབྲུ་ ༦༠༠ ལྷགཔ་ཅིག་ནང་བྲིས། (སྐུགས་ ༣༠)
(བརྗོད་དོན་ལུ་སྐུགས་ ༡༥། ཚིག་སྦྱོར་ལུ་སྐུགས་ ༡༠། འབྲི་བཀོད་ལུ་སྐུགས་ ༥།)

འབྲུག་པའི་མི་ཁུངས་ཅིག་གིས་ རང་གི་རྒྱལ་ཁབ་ཀྱི་སྐད་ཡིག་འདི་ ཤེས་དགོཔ་དང་ ལག་ལེན་འཐབ་ཤེས་དགོཔ་འདི་ ཁག་ག་དེམ་ཅིག་ཆེཝ་ཨིན་ན་ རྒྱབ་ཁུངས་ ལུང་དང་རིག་པ་གིས་བསྒྲུབས་ཏེ་བྲིས།', 'ལན་གྱི་དཔེ་ (outline)
མགོ་བཙུགས། འབྲུག་གི་རྩ་ཁྲིམས་ཆེན་མོ་ནང་ རྫོང་ཁ་འདི་ རྒྱལ་ཡོངས་ཀྱི་ སྐད་ཡིག་ཨིན་ཟེར་ གསལ་ཏོག་ཏོ་སྦེ་ བཀོད་དེ་ཡོད།
གལ་གནད། ༡. རྒྱལ་ཁབ་ཀྱི་ ངོ་རྐྱང་དང་ རང་དབང་གི་ མཚོན་རྟགས་ཨིན། ༢. ཕྱོགས་མ་འདྲཝ་ལས་ཡོད་པའི་ མི་སེར་ཚུ་ མཐུན་སྒྲིལ་གྱི་ ཐག་པ་ཨིན། ༣. ཆོས་ ལོ་རྒྱུས་ ལམ་སྲོལ་ དཔེ་གཏམ་ཚུ་ ཧ་གོ་ནི་ལུ་ དགོཔ་ཨིན། ༤. གཞུང་གི་ ཡིག་ཆ་དང་ ཞབས་ཏོག་ཚུ་ ཁ་གསལ་སྦེ་ ལག་ལེན་འཐབ་ནི་ལུ་ དགོཔ་ཨིན། ༥. སྐད་ཡིག་ བརླག་པ་ཅིན་ རྒྱལ་ཁབ་ཀྱི་ ངོ་རྐྱང་ཡང་ བརླག་འགྱོཝ་ཨིན།
ལུང་། རོགས་ཁ་མ་ཤེས་རང་ཁ་འབྱང་། ཟེར་བའི་ དཔེ་གཏམ་བཟུམ་ རང་གི་སྐད་འདི་ ཧེ་མ་ར་ ཤེས་དགོ།
མཇུག་བསྡུ། རྫོང་ཁ་ ཤེས་ནི་དང་ ལག་ལེན་འཐབ་ནི་འདི་ འབྲུག་པའི་མི་ཁུངས་རེ་རེ་གི་ འགན་ཁུར་ཨིན།', null, '[{"point": "མགོ་བཙུགས། རྫོང་ཁ་ རྒྱལ་ཡོངས་ཀྱི་སྐད་ཡིག་ (རྩ་ཁྲིམས་ ཅ་ཚན་ ༡ པ)", "marks": 5}, {"point": "གལ་གནད་ ༣ ལས་ལྷག་ (ངོ་རྐྱང་ མཐུན་སྒྲིལ་ ལམ་སྲོལ་ ཆོས་དང་ཤེས་ཡོན་ གཞུང་གི་ལཱ)", "marks": 15}, {"point": "ལུང་ (དཔེ་གཏམ་ མཁས་པའི་གསུང་) དང་ རིག་པ།", "marks": 5}, {"point": "མཇུག་བསྡུ།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'essay'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'E2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 15.0, 1 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 10.5, 2 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 4.5, 3 from me_q where key = 'E2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'འོག་ལུ་དྲི་བ་ ༥ བཀོད་ཡོད་མི་ ག་རའི་ལན་བྲིས། (སྐུགས་ ༥x༢=༡༠)

a) ཆོས་སྐད་ཀྱི་བརྡ་སྤྲོད་ཀྱི་གཞུང་ལ་ མིང་ སུམ་རྟགས་ ཞེས་བཞག་དགོ་པའི་ དགོས་དོན་བྲིས། (2 marks)', 'a) ཆོས་སྐད་ཀྱི་ བརྡ་སྤྲོད་གཞུང་འདི་ ཐོན་མི་སམྦྷོ་ཊ་གིས་ མཛད་པའི་ སུམ་ཅུ་པ་ དང་ རྟགས་ཀྱི་འཇུག་པ་ གཉིས་ལུ་གཞི་བཞག་སྟེ་ཡོདཔ་ལས་ ཡིག་འབྲུ་དང་པ་ཚུ་ བསྡོམས་ཏེ་ སུམ་རྟགས་ ཟེར་ མིང་བཏགས་ཨིན།', null, '[{"point": "ཐོན་མི་སམྦྷོ་ཊའི་ སུམ་ཅུ་པ་ དང་ རྟགས་ཀྱི་འཇུག་པ་ གཉིས་ལུ་གཞི་བཞག", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Grammar answers are Claude''s best attempt; check carefully."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2025-l1', 1, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'L1a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 1.0, 1 from me_q where key = 'L1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'L1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'འོག་ལུ་དྲི་བ་ ༥ བཀོད་ཡོད་མི་ ག་རའི་ལན་བྲིས། (སྐུགས་ ༥x༢=༡༠)

b) བཀྲ་ཤིས་ཀྱིས་མ་བཏང་། ཁོ་ལ་དད་པ་མེད། ཅེས་པའི་དཔེར་བརྗོད་གཉིས་ རྣམ་དབྱེ་གང་གི་དཔེར་བརྗོད་ཡིན? (2 marks)', 'b) བཀྲ་ཤིས་ཀྱིས་མ་བཏང་། - བྱེད་སྒྲ་ (རྣམ་དབྱེ་གསུམ་པ) གི་དཔེ། ཁོ་ལ་དད་པ་མེད། - ལ་དོན་ གནས་གཞི་ (རྣམ་དབྱེ་བདུན་པ) གི་དཔེ།', null, '[{"point": "དང་པ་ - བྱེད་སྒྲ་ (རྣམ་དབྱེ་གསུམ་པ)། གཉིས་པ་ - གནས་གཞི་ (རྣམ་དབྱེ་བདུན་པ)།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Grammar answers are Claude''s best attempt; check carefully."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2025-l1', 2, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'L1b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 1.0, 1 from me_q where key = 'L1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'L1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'འོག་ལུ་དྲི་བ་ ༥ བཀོད་ཡོད་མི་ ག་རའི་ལན་བྲིས། (སྐུགས་ ༥x༢=༡༠)

c) སྦྱོར་བྱ་ཡི་གེའི་རྣམ་གཞག་གི་ནང་དུ་ དོན་ཚན་ གང་དང་གང་ བཤད་རྒྱུ་ཡོད? (2 marks)', 'c) མགོ་ཅན་ - ར་མགོ་ ལ་མགོ་ ས་མགོ། འདོགས་ཅན་ - ཡ་བཏགས་ ར་བཏགས་ ལ་བཏགས་ ཝ་ཟུར། དེ་ཚུ་ ག་དེ་སྦེ་ སྦྱོར་ཐངས་དང་ ལྷག་ཐངས།', null, '[{"point": "མགོ་ཅན་ (ར་མགོ་ ལ་མགོ་ ས་མགོ) དང་ འདོགས་ཅན་ (ཡ་བཏགས་ ར་བཏགས་ ལ་བཏགས་ ཝ་ཟུར)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Grammar answers are Claude''s best attempt; check carefully."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2025-l1', 3, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'L1c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 1.0, 1 from me_q where key = 'L1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'L1c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'འོག་ལུ་དྲི་བ་ ༥ བཀོད་ཡོད་མི་ ག་རའི་ལན་བྲིས། (སྐུགས་ ༥x༢=༡༠)

d) ལ་དོན་གྱི་ཕྲད་ལག་ལེན་འཐབ་དགོས་པའི་ རྣམ་དབྱེ་གང་དང་གང་ཡིན་བྲིས། (2 marks)', 'd) ལ་དོན་ (སུ་ ར་ རུ་ དུ་ ན་ ལ་ ཏུ) ཚུ་ རྣམ་དབྱེ་གཉིས་པ་ ལས་སུ་བྱ་བ། བཞི་པ་ དགོས་ཆེད། བདུན་པ་ གནས་གཞི་ ནང་ ལག་ལེན་འཐབ་ཨིན། (དེ་ཉིད་དང་ ཚེ་སྐབས་ཀྱང་)', null, '[{"point": "རྣམ་དབྱེ་གཉིས་པ་ (ལས) བཞི་པ་ (དགོས་ཆེད) བདུན་པ་ (གནས་གཞི)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Grammar answers are Claude''s best attempt; check carefully."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2025-l1', 4, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'L1d', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 1.0, 1 from me_q where key = 'L1d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L1d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'L1d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'འོག་ལུ་དྲི་བ་ ༥ བཀོད་ཡོད་མི་ ག་རའི་ལན་བྲིས། (སྐུགས་ ༥x༢=༡༠)

e) རྣམ་དབྱེ་བཞི་པ་དང་གཉིས་པའི་ ཁྱད་པར་སོ་སོར་ཕྱེས། (2 marks)', 'e) རྣམ་དབྱེ་གཉིས་པ་ - བྱ་བ་ ཕོག་སའི་ཡུལ་ (དཔེ། ཁང་པ་ལ་བལྟ།)། རྣམ་དབྱེ་བཞི་པ་ - བྱ་བ་ ག་གི་དོན་ལུ་ འབདཝ་ཨིན་ན་ སྟོན་མི་ དགོས་ཆེད་ (དཔེ། སློབ་ཕྲུག་ལ་དཔེ་ཆ་སྦྱིན།)།', null, '[{"point": "གཉིས་པ་ - བྱ་བ་ཕོག་ས་ (ལས)། བཞི་པ་ - དམིགས་ཡུལ་ (དགོས་ཆེད)། དཔེ།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Grammar answers are Claude''s best attempt; check carefully."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2025-l1', 5, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'L1e', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 1.0, 1 from me_q where key = 'L1e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L1e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'L1e';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ལྷག་བཅས་ཀྱི་ཕྲད་ དངོས་བསྟན་ནི།', null, 'ལྷག་བཅས་ཀྱི་ཕྲད་ སྟེ་ ཏེ་ དེ་ གསུམ་ཨིན།', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-mcq'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'K3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ཕྲད་ སྟེ་ ཡིན།', false, 1), ('B', 'ཕྲད་ སྟེ་ཏེ་དེ་ གསུམ་ཡིན།', true, 2), ('C', 'ཕྲད་ ཏེ་ ཡིན།', false, 3), ('D', 'ཕྲད་ དེ་ ཡིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'K3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'བླ་མའི་སྐུ་མདུན་དུ་བཅར། ཞེས་པའི་སྐབས་ བྱ་ཚིག་བཅར་གྱི་ མ་འོངས་པའི་ཡིག་སྦྱོར་ནི།', null, 'Claude''s answer: check.', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-mcq'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'K4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'བཅར་ ཞེས་བྲི་དགོས།', true, 1), ('B', 'བཅརད་ ཞེས་བྲི་དགོས།', false, 2), ('C', 'འཆར་ ཞེས་བྲི་དགོས།', false, 3), ('D', 'གཅར་ ཞེས་བྲི་དགོས།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'K4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ཁྱོད་ཀྱིས་འབད་ ང་ཡང་ ཁ་རྗེ་བཟང་ཡི། ཟེར་མི་ དཔེར་བརྗོད་འདི་ བྱེད་སྒྲའི་དཔེར་བརྗོད་ཚུ་ལས་', null, 'ཁྱོད་ཀྱིས་འབད (because you did it) - རྒྱུ་མཚན། Claude''s answer: check.', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-mcq'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'K5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'བྱེད་སྒྲ་རང་བཞིན་གྱི་དཔེར་བརྗོད་ཨིན།', false, 1), ('B', 'བྱེད་སྒྲ་གཙོ་བོའི་དཔེར་བརྗོད་ཨིན།', false, 2), ('C', 'བྱེད་སྒྲ་རྒྱུ་མཚན་གྱི་དཔེར་བརྗོད་ཨིན།', true, 3), ('D', 'བྱེད་སྒྲ་ཕལ་པའི་དཔེར་བརྗོད་ཨིན།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'K5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ལྔའི་ལན་ བཀོད་རྒྱ་དང་འཁྲིལ་ཏེ་བྲིས། (སྐུགས་ ༥x༡=༥)

a) རྫོང་ཁའི་མིང་ཚིག་ལས་ སྲིངམོ་ དང་ ནུམོ། གཉིས་ལུ་ ལག་ལེན་གྱི་ཁྱད་པར་ག་ཅི་ཡོདཔ་སྨོ? (1 mark)', 'a) སྲིངམོ་ - བུ་ (ཕོ) གིས་ རང་གི་ སྲིང་མོ་ལུ་ སླབ་ཨིན། ནུམོ་ - བུམོ་གིས་ རང་ལས་ ཆུང་བའི་ སྲིང་མོ་ལུ་ སླབ་ཨིན།', null, '[{"point": "སྲིངམོ་ - བུ་གིས་ སྲིང་མོ་ལུ་ སླབ། ནུམོ་ - བུམོ་གིས་ ཆུང་བའི་ སྲིང་མོ་ལུ་ སླབ།", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-in-use'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Some of these (e.g. b, c, e) are Claude''s best attempt; check carefully."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2025-l2', 1, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'L2a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 0.5, 1 from me_q where key = 'L2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L2a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ལྔའི་ལན་ བཀོད་རྒྱ་དང་འཁྲིལ་ཏེ་བྲིས། (སྐུགས་ ༥x༡=༥)

b) འབྲེལ་སྒྲའི་ཕྲད་ འི་དང་ཡི་གཉིས་ རྐང་པ་ཁ་སྐོང་ དགོཔ་དང་མ་དགོ་པའི་སྐབས་ ལག་ལེན་འཐབ་ཐངས་ཀྱི་དཔེ་བྲིས། (1 mark)', 'b) བླ་མའི་གསུང་། (རྐང་པ་ཁ་སྐོང་མ་དགོ) - བླ་མ་ཡི་གསུང་། (ཚིགས་བཅད་ནང་ ཚིག་འབྲུ་ཁ་སྐོང་དགོཔ་ད)', null, '[{"point": "འི་ - ཚིགས་བཅད་ཀྱི་ རྐང་པ་ཁ་སྐོང་མ་དགོ་པའི་སྐབས (བླ་མའི)། ཡི་ - ཚིག་འབྲུ་ཁ་སྐོང་དགོ་པའི་སྐབས (བླ་མ་ཡི)།", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-in-use'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Some of these (e.g. b, c, e) are Claude''s best attempt; check carefully."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2025-l2', 2, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'L2b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 0.5, 1 from me_q where key = 'L2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L2b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ལྔའི་ལན་ བཀོད་རྒྱ་དང་འཁྲིལ་ཏེ་བྲིས། (སྐུགས་ ༥x༡=༥)

c) ཧྲལ། སྤུད། ཟེར་བའི་ བྱ་ཚིག་གཉིས་ བྱེད་མེད་ལས་ཚིག་ནང་བསྒྱུར་ཏེ་བྲིས། (1 mark)', 'c) ཧྲལ་ → རལ། སྤུད་ → ཕུད།', null, '[{"point": "ཧྲལ་ → རལ། སྤུད་ → ཕུད། (Claude: check)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-in-use'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Some of these (e.g. b, c, e) are Claude''s best attempt; check carefully."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2025-l2', 3, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'L2c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 0.5, 1 from me_q where key = 'L2c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L2c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ལྔའི་ལན་ བཀོད་རྒྱ་དང་འཁྲིལ་ཏེ་བྲིས། (སྐུགས་ ༥x༡=༥)

d) སྐད། ཟེར་བའི་ཚིག་འདི་ བྱ་ཚིག་སྦེ་ ལག་ལེན་འཐབ་པའི་ རྗོད་ཚིག་གཅིག་བྲིས། (1 mark)', 'd) ཨ་ཕ་གིས་ ང་ལུ་ ཕར་འོང་ཟེར་ སྐད་ཡི།', null, '[{"point": "སྐད་ བྱ་ཚིག་སྦེ་ རྗོད་ཚིག་ (དཔེ། ཨ་ཕ་གིས་ ང་ལུ་ སྐད་ཡི།)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-in-use'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Some of these (e.g. b, c, e) are Claude''s best attempt; check carefully."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2025-l2', 4, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'L2d', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 0.5, 1 from me_q where key = 'L2d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L2d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ལྔའི་ལན་ བཀོད་རྒྱ་དང་འཁྲིལ་ཏེ་བྲིས། (སྐུགས་ ༥x༡=༥)

e) སེར་ཁ། བཀག་ཆ། ཟེར་མི་ཚིག་གཉིས་ བརྗོད་བདེ་འདྲེན་པ་དང་ མིང་མཐའ་འདྲེན་པ་གཉིས་ནང་ དབྱེ་བ་ཕྱེས་ཏེ་བཙུགས། (1 mark)', 'e) སེར་ཁ་ - མིང་མཐའ་འདྲེན་པ། བཀག་ཆ་ - བརྗོད་བདེ་འདྲེན་པ། (Claude''s best attempt: a Dzongkha teacher must confirm)', null, '[{"point": "བརྗོད་བདེ་འདྲེན་པ་ / མིང་མཐའ་འདྲེན་པ་ དབྱེ་བ་ (Claude: check)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-in-use'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Some of these (e.g. b, c, e) are Claude''s best attempt; check carefully."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2025-l2', 5, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'L2e', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 0.5, 1 from me_q where key = 'L2e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L2e';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ ལེགས་ཤོམ་སྦེ་ལྷག་ཞིནམ་ལས་ དྲི་བའི་ལན་བྲིས།

ཁ་བཤད་ལེགས་བཤད།

འོ་ལགས་སོ།། ད་ནཱ་ལས་མར་ བསྐལ་པ་ཆགས་ཚུལ་ཟུར་ཙམ་ཅིག་ཞུ་བ་ཅིན། སྟོང་གསུམ་མི་མཇེད་ཀྱི་ཞིང་ཁམས་འདི་བདག་ཅག་གི་སྟོན་པ་ མཉམ་མེད་ཤཱཀྱའི་རྒྱལ་པོ་ དེའི་འདུལ་ཞིང་ཨིནམ་ལས་ སངས་རྒྱས་འཇིག་རྟེན་མི་ཡུལ་ལུ་བྱོན། དམ་པའི་ཆོས་ཀྱི་ འཁོར་ལོ་རིམ་པ་གསུམ་སྦེ་བསྐོར། རྗེས་འཇུག་མཁས༌པ་ཚུ་གིས་ ཐོག་མཐའ་བར་གསུམ་གྱི་བཀའ་ཡང་དག་པ༌དེ་ མི་ཉམས་གོང་འཕེལ་མཛད། རྒྱ་བོད་ཀྱི་ལོ་པཎ་ཚུ་གིས་ བཀའ་དེ་ ལེགས་སྦྱར་ལྷའི་སྐད་ལས་ བོད་དབུས་གཙང༌དག་པའི་སྐད་ལུ་བསྒྱུར། ཨོ་རྒྱན་གྱི་སློབ་དཔོན་པདྨ་འབྱུང་གནས་ཀྱིས་ འདྲེ་སྲིན་བཏུལ། གསང་སྔགས་ཀྱི་བསྟན་པ་བཙུགས་ཏེ་ དམ་པའི་ཆོས་ཀྱི་ སྣང་བའི་སྲོལ་གཏོད། བཀའ་བརྒྱུད་བླམ་གོང་མ་ཚུ་གིས་ འབྲུག་པ་བཀའ་བརྒྱུད་ཀྱི་ཆོས་དེ་ ཉམས་སུ་བླངས་ཏེ་ བཀའ་བརྒྱུད་ཆེ་བཞི་ཆུང་བརྒྱད་ཚུ་ རིམ་པར་བྱོན་ཏེ་ བྱ་རྒོད་ཀྱི་ཉིན་ལམ་བཅོ་བརྒྱད་ཀྱི་བར་དུ་ དར་ཁྱབ་སོངམ་ལས། སྨན་ལྗོངས་འབྲུག་གི་རྒྱལ་ཁབ་འདི་ནང་ཡང་ འབྲུག་པ་བཀའ་བརྒྱུད་ཀྱི་བསྟན་པ་རིན་པོ་ཆེ་ ཉི་མའི་དཀྱིལ་འཁོར་བཞིན་གསལ་ཏེ་ དར་ཞིང་རྒྱས་ལ་ ཡུན་རིང་དུ་གནས་པའི་ མཐུ་སྟོབས་དང་ཐབས་དང་རྟེན་འབྲེལ་ཟབ་མོ་ ཕུན་སུམ་ཚོགས་པའི་དུས་ད་རེས།

གནམ་ལས་ ཚེས་པའི་སྐར་མ་བཟང་། ས་ལས་ཚེས་པའི་ཉི་མ༌དྲོ། བར་ལས་ཚེས་པའི་རྒྱུ་སྐར་བཟང་(བཀྲ) བཟང་པོ་བཟང་གསུམ་གྱི་ སྟེང་དུ། ལྷོ་ཡི་གླིང་མཆོག་འཛམ་གླིང་འདི་ནང་། །ཤར་ཕི་ལས་ཁྲི་གདུགས་མ་ཤར་ན། །ནུབ་ཧ་ལས་གངས༌དེ་མི་བཞུ་བས། ། བྱང་སྐྱི་བསེར་རླུང་དེ་མ་འཕུ་ན། །ལྷོ་ཙན་དན་སྡོང་པོ་མ་གཡོ་བས། ། ཕ་བླ་མ་མེད་པའི་གོང་རོལ་ན། ། བུ་སངས་རྒྱས་བྱ་བའི་མིང་ཡང་མེད། །བསྐལ་པ་སྟོང་གི་སངས་རྒྱས་ཀྱང་། །བླ་མ་དག་ལ་བསྟེན་ནས་འབྱུང་། ། ཁ་མ་ཎི་ལན་གསུམ་མ་འདྲེན་ན། ། ལས་དགེ་སྡིག་ཤན་འབྱེད་མི་ཤེས་པས། །གཏམ་ཚིག་གསུམ་བརྡ་ལན་མ་བརྗེ་ན། །སྐྱེསཔ་ཕ་དང་བུ་ཡང་ངོ་མི་ཤེས། ལམ་གོམ་གསུམ་འགྲོ་ལམ་མ་གཤག་ན། །ལ་ལུངམ་གི་རིང་ཐུང་ཧ་མི་གོ།

དེ་ལུ་འཇིག་རྟེན་པའི་ གཏམ་དཔེ༌གཞན་ཡང་ ཞུ་བ་ཅིན། ཆང་མེད་པར་གཏམ་མི་འཐོན། ཆང་མར་འཛུལ་གཏམ་ཡར་ཐོན། གླུ་ལ་ཁ་ཚིག་མེད་ན། གླུ་ཚིག་སྙན་པོ་མི་འོང་། ཟེར་བའི་དཔེ་ཡོད། དགུང་བྲག་དཀར་ཤེལ་གྱི་ནང་ཤེད་ན། ། བྱ་ཡི་རྒྱལ་པོ་མཁའ་ལྡིང་ཡོད། །བྱ་གཅིག་གིས་འཕུར་ན་ཀུན་གྱིས་འཕུར། །གནམ་ཀ་བ་མེད་པའི་འོག་ཤེད་ན། །གཅན་གཟན་གྱི་རྒྱལ་པོ་སེང་གེ་ཡོད། །དེ་གཅིག་གིས་མཆོང་ན་ཀུན་གྱིས་མཆོང་། །ལྷོ་འཛམ་བུ་གླིང་གི་རྒྱལ་ཁབ་ན། །གཏམ་གྱི་རྒྱལ་པོ་ཆང་ལུ་ཡོད། །དེ་གཅིག་གིས་སླབ་ན་ཀུན་གྱིས་ཉན། །ཟེར་བའི་དཔེ་བཟུམ་ ད༌རེས་ གཡུལ་བཟང་ནོར་བུའི་གླིང་གི་ ཁང་ཁྱིམ་ཁྲ་མོའི་ནང་ བསྐལ་བཟང་ཆགས་ཚུལ་ཟུར་ཙམ་ཅིག་ཞུ་ཚར་ཡི། བཀའ་དྲིན་ཆེ།

(ཀ) འོག་གི་དྲི་བ་རེ་ལུ་ ལན་ ༤ རེ་ཡོད་ས་ལས་ ལན་ངོ་མ་འདི་ གདམ་ཁ་རྐྱབ་སྟེ་ བྲིས། (སྐུགས་ ༥x༡=༥)
༡) མཉམ་མེད་ཤཱཀྱའི་རྒྱལ་པོའི་ མཚན་གྱི་རྣམ་གྲངས། ཀ པདྨའི་གཉེན། ཟེར་ཞུཝ་ཨིན། ཁ སྨྲ་བའི་དབང་ཕྱུག། ཟེར་ཞུཝ་ཨིན། ག མཐུ་སྟོབས་ཅན། ཟེར་ཞུཝ་ཨིན། ང རྐང་གཉིས་གཙོ་བོ། ཟེར་ཞུཝ་ཨིན།
༢) དམ་པའི་ཆོས་ ཡར་རྒྱས་གོང་འཕེལ་འགྱོ་བའི་དཔེ། ཀ བྱ་རྒོད་ཀྱི་ཉིནམ་ལམ་བཅོ་བརྒྱད་ཚུན་འགྱོ་མི་བཞག་ནུག། ཁ ཉི་མའི་དཀྱིལ་འཁོར་ལུ་བཞག་ནུག། ག གནམ་ལས་ཚེས་པའི་སྐར་མ་བཟང་པོ་ལུ་བཞག་ནུག། ང ཤར་ཕྱི་ལས་ཤར་བའི་ཁྲི་གདུགས་ལུ་བཞག་ནུག།
༣) ཕ་བླ་མ་མེད་པའི་གོང་རོལ་ན། །བུ་སངས་རྒྱས་བྱ་བའི་མིང་ཡང་མེད། །བསྐལ་པ་སྟོང་གི་སངས་རྒྱས་ཀྱང་། །བླ་མ་དག་ལ་བསྟེན་ནས་བྱུང་། ། ཟེར་བའི་ཚིགས་བཅད་ཀྱི་ བཅུད་དོན་འདི། ཀ སངས་རྒྱས་ བཀའ་དྲིན་ཆེ་བའི་སྐོར་ལས་ཨིན་མས། ཁ བླམ་བཀའ་དྲིན་ཆེ་བའི་སྐོར་ལས་ཨིན་མས། ག ཕ་བླམ་ཅིག་ཡོད་པ་ཅིན་ བུ་སངས་རྒྱས་ཅིག་འབྱུང་འོང་། ཟེར་ཨིན་མས། ང སངས་རྒྱས་ལུ་བརྟེན་ཏེ་ བླམ་འབྱུངམ་ཨིན། ཟེར་ཨིན་མས།
༤) མཁའ་ལྡིང་། ཟེར་མི་འདི། ཀ བྱ་ཁྱུང་ལུ་གོཝ་ཨིན། ཁ འུག་པ་ལུ་གོཝ་ཨིན། ག ཁྱ་རྒོད་ལུ་གོཝ་ཨིན། ང བྱ་སྤྱིར་བཏང་ལུ་གོཝ་ཨིན།
༥) ཁ་བཤད་འདི་ནང་ དཀར་ནག་ལས་ཀྱི་ དབྱེ་བ་ ཕྱེ་ཤེས་དགོ་པ་ཅིན། ཀ གཏམ་ཚིག་གསུམ་བརྡ་ལན་བརྗེ་དགོ། ཟེར་ཨིན་མས། ཁ ཕ་བླ་མ་གཅིག་ར་བསྟེན་དགོ། ཟེར་ཨིན་མས། ག ཡི་གེ་དྲུག་མ་བགྲང་དགོ། ཟེར་ཨིན་མས། ང ལམ་གོམ་གསུམ་གྱི་འགྲོ་ལམ་གཤག་དགོ། ཟེར་ཨིན་མས། (སྐུགས་ 5)', '༡) ང  ༢) ཀ  ༣) ཁ  ༤) ཀ  ༥) ག', null, '[{"point": "༡) ང", "marks": 1}, {"point": "༢) ཀ", "marks": 1}, {"point": "༣) ཁ", "marks": 1}, {"point": "༤) ཀ", "marks": 1}, {"point": "༥) ག", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2025-cp', 1, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 2.0, 1 from me_q where key = 'C1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 2.0, 2 from me_q where key = 'C1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 1.0, 3 from me_q where key = 'C1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', '(ཁ) ༡) འཇིག་རྟེན་པའི་ཁ་བཤད། ཟེར་མི་འདི་ ག་ཅི་བཟུམ་ཅིག་ལུ་གོཝ་སྨོ? (སྐུགས་ 4)', 'འཇིག་རྟེན་པའི་ཁ་བཤད་ ཟེར་མི་འདི་ གཉེན་སྟོན་ ཁྱིམ་གསར་ ལོ་གསར་ བཟུམ་གྱི་ དགའ་སྟོན་སྐབས་ལུ་ ཆང་དང་གཅིག་ཁར་ སླབ་པའི་ སྲོལ་ལུགས་ཀྱི་ ལེགས་བཤད་ཅིག་ཨིན། དེ་ནང་ བསྐལ་པ་ཆགས་ཚུལ་ ཆོས་ཀྱི་ལོ་རྒྱུས་ དཔེ་གཏམ་ཚུ་ སྙན་ཚིག་ཐོག་ལས་ སླབ་སྟེ་ བཀྲ་ཤིས་དང་ རྟེན་འབྲེལ་ ལེགས་ཤོམ་བཟོཝ་ཨིན།', null, '[{"point": "གཉེན་སྟོན་ (ཆང་གི་ཁ་བཤད) བཟུམ་གྱི་ སྐབས་ལུ་ སླབ་པའི་ སྲོལ་སྲོལ་ལེགས་བཤད།", "marks": 2}, {"point": "ནང་དོན་ (བསྐལ་པ་ཆགས་ཚུལ་ ཆོས་ཀྱི་ལོ་རྒྱུས་ དཔེ་གཏམ) དང་ དམིགས་དོན་ (བཀྲ་ཤིས་ ཁ་བཤད)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2025-cp', 2, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 2.0, 1 from me_q where key = 'C2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 1.5, 2 from me_q where key = 'C2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'C2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', '(ཁ) ༢) བསྐལ་པ་སྟོང་གི་ སངས་རྒྱས་རྣམས་ ཕ་བླ་མ་ལས་བརྟེན་ཏེ་ བྱུང་པའི་ ཁུངས་དོན་བཀོད། (སྐུགས་ 4)', 'སངས་རྒྱས་ཐོབ་ནིའི་ ལམ་འདི་ ཆོས་ཨིན། ཆོས་འདི་ བླ་མ་ལས་ར་ ཐོབ་དགོཔ་ཨིན། བླ་མ་མེད་པ་ཅིན་ ལམ་སྟོན་མི་ མེད་པའི་ཁར་ སངས་རྒྱས་ཟེར་བའི་ མིང་ཡང་ མི་ཤེས། དེ་འབདཝ་ལས་ བསྐལ་པ་སྟོང་གི་ སངས་རྒྱས་ཚུ་ཡང་ བླ་མ་བསྟེན་ཏེ་ ཆོས་ཉམས་སུ་བླངས་ཏེ་ར་ སངས་རྒྱས་ཐོབ་ཡོདཔ་ཨིན།', null, '[{"point": "བླ་མ་མེད་པ་ཅིན་ ཆོས་ཀྱི་ལམ་སྟོན་མི་མེད།", "marks": 2}, {"point": "སངས་རྒྱས་ཚུ་ཡང་ བླ་མ་བསྟེན་ཏེ་ ཆོས་ཉམས་སུ་བླངས་ སངས་རྒྱས་ཐོབ།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2025-cp', 3, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 2.0, 1 from me_q where key = 'C3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 1.5, 2 from me_q where key = 'C3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'C3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', '(ཁ) ༣) སངས་རྒྱས་མི་ཡུལ་ལུ་བྱོནམ་བརྒྱ་ལམ། ཟེར་བའི་ཚིག་འདི་ རྒྱབ་རྟེན་སྦེ་བཀོད་དེ་ བརྗོད་པ་ཆ་ཚང་ཅིག་བྲིས། (སྐུགས་ 4)', 'སངས་རྒྱས་མི་ཡུལ་ལུ་བྱོནམ་བརྒྱ་ལམ་ཅིག་ཨིན། ཟེར་བའི་ ཚིག་དང་འཁྲིལ་བ་ཅིན་ སངས་རྒྱས་ མི་ཡུལ་ལུ་ བྱོན་ཏེ་ ཆོས་གསུངས་མི་འདི་ ཧ་ཅང་ དཀོན་པ་ཨིན། དེ་འབདཝ་ལས་ ང་བཅས་ ཆོས་ཐོས་ཚུགས་པའི་ དུས་ཚོད་ལུ་ སྐྱེས་མི་འདི་ སྐལ་བ་བཟང་ཏེ་ ཆོས་ཉམས་སུ་ལེན་དགོ།', null, '[{"point": "བརྗོད་པ་ཆ་ཚང་ཅིག་ (ཚིག་དེ་ ལག་ལེན་འཐབ་སྟེ)", "marks": 2}, {"point": "དོན་ཁ་གསལ་ (དཀོན་པ་/ སྐལ་བ་བཟང་པོ) དང་ ཡིག་སྦྱོར།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2025-cp', 4, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 2.0, 1 from me_q where key = 'C4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 1.5, 2 from me_q where key = 'C4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'C4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', '(ཁ) ༤) དམ་པའི་ཆོས་ཀྱི་འཁོར་ལོ་ རིམ་པ་གསུམ་ལས་ རིམ་པ་དང་པ་འདི་ ཆོས་ག་ཅི་ཟེར་མི་འདི་ ཨིན་ན? (སྐུགས་ 4)', 'ཆོས་འཁོར་རིམ་པ་དང་པ་འདི་ བདེན་པ་བཞིའི་ ཆོས་འཁོར་ཨིན། སྟོན་པ་གིས་ ཝ་ར་ཎ་སི་ དྲང་སྲོང་ལྷུང་བའི་ རི་དྭགས་ཀྱི་ནགས་ཚལ་ནང་ འཁོར་ལྔ་སྡེ་བཟང་པོ་ལུ་ སྡུག་བསྔལ་ ཀུན་འབྱུང་ འགོག་པ་ ལམ་གྱི་ བདེན་པ་བཞི་ གསུངས་ཡོདཔ་ཨིན།', null, '[{"point": "བདེན་པ་བཞིའི་ཆོས་འཁོར་ (ཆོས་འཁོར་དང་པ)", "marks": 2}, {"point": "སྡུག་བསྔལ་ ཀུན་འབྱུང་ འགོག་པ་ ལམ་ - ཝ་ར་ཎ་སི་ནང་ འཁོར་ལྔ་སྡེ་བཟང་པོ་ལུ་ གསུངས།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2025-cp', 5, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 2.0, 1 from me_q where key = 'C5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 1.5, 2 from me_q where key = 'C5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'C5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', '(ཁ) ༥) གནམ་ཀ་བ་མེད་པའི་འོག་ཤེད་ན། གཅན་གཟན་གྱི་རྒྱལ་པོ་སེང་གེ་ཡོད། དེ་གཅིག་གིས་མཆོང་ན་ཀུན་གྱིས་མཆོང་།། ཟེར་མི་ལས་ རིགས་བསྒྲེས་ཏེ་ ཁྱོད་ཀྱིས་ཡང་ དཔེ་གསརཔ་ཅིག་བཀོད། (སྐུགས་ 4)', 'མཚོ་ཆུ་བོ་ཆེན་པོའི་ནང་ཤེད་ན། །ཉ་ཡི་རྒྱལ་པོ་གསེར་ཉ་ཡོད། །དེ་གཅིག་གིས་རྐྱལ་ན་ཀུན་གྱིས་རྐྱལ། །', null, '[{"point": "དཔེ་གསརཔ་ ཚིགས་བཅད་ཀྱི་ བཀོད་པ་དང་འདྲཝ་ (ཡུལ་ - རྒྱལ་པོ་ - མི་གཅིག་གིས་འབད་ན་ ཀུན་གྱིས་འབད)", "marks": 3}, {"point": "ཡིག་སྦྱོར་དང་ དོན་འབྲེལ།", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2025-cp', 6, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 2.0, 1 from me_q where key = 'C6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 1.5, 2 from me_q where key = 'C6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'C6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', '(ག) འོག་གི་མིང་ཚིག་ཚུ་གི་རྣམ་གྲངས་ གོང་གི་ཡིག་རྒྱུགས་ནང་ལས་འཚོལ་ཏེ་བྲིས། (སྐུགས་ ༡x༥=༥)
༡) ང་བཅས། ༢) སྲོལ་བཙུགས། ༣) ཧན་ཏོང་ཏོ། ༤) ཤར་བའི། ༥) སྟོབས་ཤུགས། (སྐུགས་ 5)', '༡) བདག་ཅག ༢) སྲོལ་གཏོད། ༣) གསལ། ༤) ཚེས་པའི། ༥) མཐུ་སྟོབས།', null, '[{"point": "༡) བདག་ཅག", "marks": 1}, {"point": "༢) སྲོལ་གཏོད།", "marks": 1}, {"point": "༣) གསལ་ (Claude: check)", "marks": 1}, {"point": "༤) ཚེས་པའི།", "marks": 1}, {"point": "༥) མཐུ་སྟོབས།", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2025-cp', 7, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 2.0, 1 from me_q where key = 'C7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 2.0, 2 from me_q where key = 'C7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 1.0, 3 from me_q where key = 'C7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', '(ང) འོག་གི་མིང་ཚིག་ཚུ་གི་རྗོད་ཚིག་བཟོ། རྗོད་ཚིག་ཚུ་ ཡིག་རྒྱུགས་ནང་ལས་འདྲ་བཤུས་རྐྱབ་མི་ཆོག། (སྐུགས་ ༡x༥=༥)
༡) ཉམས་སུ་བླང་། ༢) ཉི་མའི་དཀྱིལ་འཁོར། ༣) ཤན་འབྱེད། ༤) རྗེས་འཇུག་མཁས་པ། ༥) འགྲོ་ལམ་མ་གཤག། (སྐུགས་ 5)', '༡) བླ་མའི་བསླབ་བྱ་ཚུ་ ཉམས་སུ་བླང་དགོ། ༢) ཉི་མའི་དཀྱིལ་འཁོར་ ཤར་ཕྱོགས་ལས་ ཤར་ཡི། ༣) ལེགས་ཉེས་ཤན་འབྱེད་ཤེས་དགོ། ༤) རྗེས་འཇུག་མཁས་པ་ཚུ་གིས་ བསྟན་པ་ ཡར་རྒྱས་གཏང་ཡི། ༥) ལམ་ཁ་གསརཔ་ཅིག་ འགྲོ་ལམ་མ་གཤག་པས་ ང་ཕར་འགྱོ་མ་ཚུགས།', null, '[{"point": "༡)", "marks": 1}, {"point": "༢)", "marks": 1}, {"point": "༣)", "marks": 1}, {"point": "༤)", "marks": 1}, {"point": "༥) རྗོད་ཚིག་རེ་རེ་ དོན་དང་ཡིག་སྦྱོར་ངེས་བདེན།", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2025-cp', 8, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C8', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 2.0, 1 from me_q where key = 'C8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 2.0, 2 from me_q where key = 'C8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 1.0, 3 from me_q where key = 'C8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'translation', 'འོག་ལུ་ཨིང་སྐད་ཀྱི་ཐོག་ལུ་བཀོད་དེ་ཡོད་མི་འདི་ རྫོང་ཁའི་ནང་ལུ་སྐད་སྒྱུར་འབད་དེ་བྲིས། (སྐུགས་ ༡༥)

Reading Habit
Reading habit among the Bhutanese in general has always been a wanting practice. An active reading habit among the population is not only desirable but also critical at a time when the economy is knowledge and information based. Lack of reading habit and skills in the students adversely affects their overall academic performance and acquisition of knowledge.
Realizing the importance of reading culture, and to promote it among all sections of Bhutanese society, the National Reading Programme is envisioned to be launched.
During the State of the Nation Report to Parliament on 19th June 2014, the Honorable Prime Minister highlighted various educational initiatives to be pursued, one of which is "…developing a national reading strategy so that we can inculcate a healthy reading habit. I am pleased to declare 2015 as the National Reading Year to celebrate the 60th Birth Anniversary of His Majesty the Fourth Druk Gyalpo." Subsequently, Hon''ble Prime Minister Tshering Tobgay instructed the Department of Curriculum Research and Development (DCRD), Ministry of Education to frame a National Reading Programme.', 'ལན་གྱི་དཔེ།
ལྷག་ནིའི་གོམས་གཤིས།
སྤྱིར་བཏང་ འབྲུག་མི་ཚུ་གི་ནང་ ལྷག་ནིའི་གོམས་གཤིས་འདི་ ཨ་རྟག་ར་ ཉུང་དྲགས་སྦེ་ཡོདཔ་ཨིན། དཔལ་འབྱོར་འདི་ ཤེས་ཡོན་དང་ བརྡ་དོན་ལུ་ གཞི་བཞག་པའི་ དུས་ཚོད་འདི་ནང་ མི་སེར་ཚུ་ལུ་ ལྷག་ནིའི་གོམས་གཤིས་ཤུགས་ཅན་ཅིག་ ཡོད་ནི་འདི་ རེ་འདོད་ཡོད་པ་རྐྱངམ་ཅིག་མེན་པར་ གལ་ཆེཝ་ཨིན། སློབ་ཕྲུག་ཚུ་ལུ་ ལྷག་ནིའི་གོམས་གཤིས་དང་ ལྕོགས་གྲུབ་ མེད་པ་ཅིན་ ཁོང་ཚུ་གི་ སློབ་སྦྱོང་གི་ གྲུབ་འབྲས་ཆ་ཚང་དང་ ཤེས་ཡོན་ཐོབ་ནི་ལུ་ གནོད་པ་འབྱུངམ་ཨིན།
ལྷག་ནིའི་ལམ་ལུགས་ཀྱི་ གལ་གནད་ ཧ་གོ་སྟེ་ འབྲུག་གི་ སྤྱི་ཚོགས་ཀྱི་ ཕྱོགས་ཡོངས་ནང་ ཡར་དྲག་གཏང་ནིའི་དོན་ལུ་ རྒྱལ་ཡོངས་ལྷག་ནིའི་ལས་རིམ་ འགོ་བཙུགས་ནིའི་ འཆར་གཞི་བརྩམ་ཡོདཔ་ཨིན།
སྤྱི་ལོ་ ༢༠༡༤ ཟླ་ ༦ པའི་ཚེས་ ༡༩ ལུ་ སྤྱི་ཚོགས་ལུ་ རྒྱལ་ཁབ་ཀྱི་གནས་སྟངས་སྙན་ཞུ་ཕུལ་བའི་སྐབས་ བློན་ཆེན་མཆོག་གིས་ ཤེས་རིག་གི་ ལས་འགུལ་སྣ་ཚོགས་ཀྱི་སྐོར་ལས་ གསུངས་ཡོདཔ་དང་ དེ་གི་ནང་ལས་ ཅིག་འདི་ "...ང་བཅས་ཀྱིས་ ལྷག་ནིའི་གོམས་གཤིས་ ལེགས་ཤོམ་ཅིག་ བསྐྲུན་ཚུགསཔ་སྦེ་ རྒྱལ་ཡོངས་ལྷག་ནིའི་ ཐབས་བྱུས་ཅིག་ བཟོ་ནི། མི་དབང་འབྲུག་རྒྱལ་བཞི་པ་མཆོག་གི་ འཁྲུངས་སྐར་ ལོ་ ༦༠ པའི་ དུས་དྲན་གྱི་དོན་ལུ་ སྤྱི་ལོ་ ༢༠༡༥ འདི་ རྒྱལ་ཡོངས་ལྷག་ནིའི་ལོ་ སྦེ་ གསལ་བསྒྲགས་འབད་ནི་ལུ་ ང་ དགའ་བ་ཡོད།" ཟེར་ གསུངས་ཡོདཔ་ཨིན། དེ་ལས་ བློན་ཆེན་ ཚེ་རིང་སྟོབས་རྒྱས་མཆོག་གིས་ ཤེས་རིག་ལྷན་ཁག་གི་ སློབ་རིམ་ཞིབ་འཚོལ་དང་ གོང་འཕེལ་ལས་ཁུངས་ (DCRD) ལུ་ རྒྱལ་ཡོངས་ལྷག་ནིའི་ལས་རིམ་ཅིག་ བཟོ་ནིའི་ བཀའ་རྒྱ་གནང་ཡོདཔ་ཨིན།', null, '[{"point": "དོན་ཚན་དང་པ་ - ལྷག་ནིའི་གོམས་གཤིས་ ཉུང་བ་ དེའི་གལ་གནད་དང་ གནོད་པ།", "marks": 5}, {"point": "དོན་ཚན་གཉིས་པ་ - རྒྱལ་ཡོངས་ལྷག་ནིའི་ལས་རིམ།", "marks": 3}, {"point": "དོན་ཚན་གསུམ་པ་ - ཚེས་གྲངས་ བློན་ཆེན་གྱི་གསུང་ ༢༠༡༥ རྒྱལ་ཡོངས་ལྷག་ནིའི་ལོ་ DCRD ཞེ་ས་ངེས་བདེན།", "marks": 5}, {"point": "ཚིག་སྦྱོར་དང་ ཡིག་སྦྱོར།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'translation'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'T1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 8.0, 1 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 5.0, 2 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 2.0, 3 from me_q where key = 'T1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'ལ་དོན་གྱི་ཕྲད་ (སུ་ ར་ རུ་ དུ་ ན་ ལ་ ཏུ) ག་དེམ་ཅིག་ཡོད?', null, 'ལ་དོན་ བདུན་ཡོད།', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-mcq'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'KN1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '༨', false, 1), ('B', '༦', false, 2), ('C', '༥', false, 3), ('D', '༧', true, 4)) as v(label, body, ok, pos) where me_q.key = 'KN1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'རྣམ་དབྱེ་ ག་དེམ་ཅིག་ཡོད?', null, 'རྣམ་དབྱེ་ བརྒྱད་ཡོད། (བོད་ཀྱི་བརྡ་སྤྲོད།)', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-mcq'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'KN2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '༨', true, 1), ('B', '༦', false, 2), ('C', '༧', false, 3), ('D', '༩', false, 4)) as v(label, body, ok, pos) where me_q.key = 'KN2';
commit;
