-- ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'comprehension', 'Comprehension' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'essay', 'Essay' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'grammar', 'Grammar' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'grammar-mcq', 'Grammar MCQ' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'grammar-in-use', 'Grammar in use' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'translation', 'Translation' on conflict (subject_id, slug) do nothing;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'essay', 'འོག་ལུ་བཀོད་དེ་ཡོད་པའི་ འབྲི་རྩོམ་གྱི་དོན་ཚན་གཉིས་ལས་ གཅིག་གདམ་ཁ་རྐྱབ་སྟེ་ ཚིག་འབྲུ་ ༦༠༠ ལྷགཔ་ཅིག་ནང་བྲིས། (སྐུགས་ ༣༠)
(བརྗོད་དོན་ལུ་སྐུགས་ ༡༥། ཚིག་སྦྱོར་ལུ་སྐུགས་ ༡༠། འབྲི་བཀོད་ལུ་སྐུགས་ ༥།)

རྒྱལ་ཁབ་ག་ཏེ་འབད་རུང་རང་གི་ལམ་ལུགས་སྲོལ་ཚུ་ རྒྱལ་ཁབ་ཀྱི་སྲོག་ཤིང་བཟུམ་བརྩིཝ་ཨིན་པས་ འདི་ལུ་ཁྱོད་ཀྱིས་ ཁས་ལེན་ཡོད་ག་མེད? ཁུངས་བཀལ།', 'ལན་གྱི་དཔེ་ (outline) - ཁས་ལེན་ཡོད།
མགོ་བཙུགས། ལམ་ལུགས་སྲོལ་ཟེར་མི་འདི་ སྐད་ཡིག་ གོ་ལ་ སྒྲིག་ལམ་རྣམ་གཞག་ ཆོས་ལུགས་ བཟོ་རིག་ ཟློས་གར་ ཚུ་ཨིན། སྲོག་ཤིང་ མེད་པ་ཅིན་ ཁྱིམ་ ལྡིར་བཟུམ་ ལམ་སྲོལ་མེད་པ་ཅིན་ རྒྱལ་ཁབ་ ལྡིར་འགྱོཝ་ཨིན།
བདེན་ཁུངས། ༡. ལམ་སྲོལ་འདི་ རྒྱལ་ཁབ་ཀྱི་ ངོ་རྐྱང་ཨིན་ - འབྲུག་ཆུང་ཀུ་ཅིག་ཨིན་རུང་ ངོ་རྐྱང་ ཐུན་མོང་མ་ཡིན་པ་ ཡོདཔ་ལས་ རང་དབང་ སྲུང་ཚུགས། ༢. མི་སེར་ཚུ་ མཐུན་སྒྲིལ་གྱི་ ཐག་པ་གཅིག་ནང་ བསྡམ་བཞག་ཨིན། ༣. རྒྱལ་ཡོངས་དགའ་སྐྱིད་དཔལ་འཛོམས་ཀྱི་ ཀ་བ་ཅིག་ ལམ་སྲོལ་ སྲུང་སྐྱོབ་ཨིན། ༤. རྩ་ཁྲིམས་ཆེན་མོ་ནང་ཡང་ ལམ་སྲོལ་ སྲུང་སྐྱོབ་འབད་ནི་ རྒྱལ་གཞུང་གི་ འགན་ཁུར་སྦེ་ བཀོད་དེ་ཡོད།
ཕྱོགས་གཞན། ལ་ལུ་གིས་ ལམ་སྲོལ་འདི་ གོང་འཕེལ་ལུ་ བཀག་ཆ་ཨིན་ ཟེར་རུང་ ལམ་སྲོལ་ སྲུང་སྟེ་ དུས་དང་འཁྲིལ་བའི་ གོང་འཕེལ་ཡང་ འབད་ཚུགས།
མཇུག་བསྡུ། ལམ་སྲོལ་འདི་ རྒྱལ་ཁབ་ཀྱི་ སྲོག་ཤིང་ཨིནམ་ལས་ མི་ཚེ་རེ་རེ་གིས་ སྲུང་སྐྱོབ་འབད་དགོ།', null, '[{"point": "མགོ་བཙུགས། ལམ་ལུགས་སྲོལ་ (སྒྲིག་ལམ་རྣམ་གཞག་ གོ་ལ་ སྐད་ཡིག་ ཆོས་ རིག་གཞུང) གི་གོ་དོན་དང་ རང་གི་ཕྱོགས་ ཁ་གསལ།", "marks": 5}, {"point": "བདེན་ཁུངས་ ༣ ལས་ལྷག་ (ངོ་རྐྱང་ རང་དབང་ མཐུན་སྒྲིལ་ རྒྱལ་ཡོངས་དགའ་སྐྱིད་) ལུང་དང་ དཔེ་དང་བཅས།", "marks": 15}, {"point": "ཕྱོགས་གཞན་གྱི་ བསམ་འཆར་ལུ་ ལན།", "marks": 5}, {"point": "མཇུག་བསྡུ།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'essay'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'E1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'E1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 15.0, 1 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 10.5, 2 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 4.5, 3 from me_q where key = 'E1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'essay', 'འོག་ལུ་བཀོད་དེ་ཡོད་པའི་ འབྲི་རྩོམ་གྱི་དོན་ཚན་གཉིས་ལས་ གཅིག་གདམ་ཁ་རྐྱབ་སྟེ་ ཚིག་འབྲུ་ ༦༠༠ ལྷགཔ་ཅིག་ནང་བྲིས། (སྐུགས་ ༣༠)
(བརྗོད་དོན་ལུ་སྐུགས་ ༡༥། ཚིག་སྦྱོར་ལུ་སྐུགས་ ༡༠། འབྲི་བཀོད་ལུ་སྐུགས་ ༥།)

འཛམ་གླིང་ནང་ལུ་མི་རིགས་དང་ཆོས་ལུགས་ ལུང་ཕྱོགས་སྟོབས་ཤུགས་གོང་འཕེལ་གྱི་རིམ་པ་ཚུ་ལས་བརྟེན་ཏེ་ སྤྱིར་བཏང་འཛམ་གླིང་ཞི་བདེ་གི་དཀའ་རྙོགས་ཚུ་བྱུངམ་ཨིན་པས། དེ་ལུ་ཁྱོད་ཀྱིས་འབད་བ་ཅིན་ཐབས་ཤེས་ཚུ་སྒྲིག་དགོཔ་ཁག་ཆེ་མི་ཆེ། ག་དེ་སྦེ་ཨིན་ན?', 'ལན་གྱི་དཔེ་ (outline)
མགོ་བཙུགས། ད་རེས་ འཛམ་གླིང་ནང་ མི་རིགས་ ཆོས་ལུགས་ ས་ཁོངས་ དང་ སྟོབས་ཤུགས་ཀྱི་ དོ་འགྲན་ལས་ བརྟེན་ཏེ་ དམག་འཁྲུག་ དང་ འཁྲུག་རྩོད་ ཚུ་ བྱུང་དོ་ཡོདཔ་ལས་ ཐབས་ཤེས་ སྒྲིག་ནི་ ཧ་ཅང་ ཁག་ཆེ།
ཐབས་ཤེས། ༡. དཀའ་ངལ་ཚུ་ དམག་གིས་མེན་པར་ གྲོས་བསྡུར་ དང་ མཐུན་ཕྱོགས་ཀྱི་ ཐོག་ལས་ སེལ། ༢. མི་རིགས་དང་ ཆོས་ལུགས་ མ་འདྲཝ་ཚུ་ལུ་ ཕན་ཚུན་ གུས་བཀུར་ (ཤེས་ཡོན་ནང་ ལས་ར་ སློབ་སྟོན)། ༣. རྒྱལ་སྤྱི་ ཚོགས་སྡེ་ (UN) བཟུམ་ ཚུ་ ཤུགས་ཅན་བཟོ་སྟེ་ ཁྲིམས་མཐུན་ ཐག་གཅོད། ༤. དཔལ་འབྱོར་ མཉམ་འབྲེལ་ དང་ དབུལ་ཕོངས་ མར་ཕབ་ - དབུལ་ཕོངས་ འཁྲུག་རྩོད་ཀྱི་ རྒྱུ་རྐྱེན་ཅིག་ཨིན། ༥. ནང་པའི་ བྱམས་སྙིང་རྗེ་ དང་ བཟོད་པའི་ ལྟ་བ་ ཁྱབ་སྤེལ།
དཔེ། འབྲུག་གིས་ རྒྱལ་ཁབ་ག་ར་དང་ མཐུན་ལམ་ ཞི་བདེའི་ཐོག་ལས་ འཐབ་ཡོདཔ།
མཇུག་བསྡུ། ཐབས་ཤེས་ སྒྲིག་དགོཔ་ ཁག་ཆེ། ཞི་བདེ་ མེད་པ་ཅིན་ གོང་འཕེལ་ དང་ བདེ་སྐྱིད་ ག་ནི་ཡང་ མི་འོང་།', null, '[{"point": "མགོ་བཙུགས། འཛམ་གླིང་ཞི་བདེའི་ དཀའ་རྙོགས་ཀྱི་ རྒྱུ་རྐྱེན་ (མི་རིགས་ ཆོས་ལུགས་ ལུང་ཕྱོགས་ སྟོབས་ཤུགས) ཁ་གསལ།", "marks": 5}, {"point": "ཐབས་ཤེས་ ༣ ལས་ལྷག་ (གྲོས་བསྡུར་ ཕན་ཚུན་ གུས་བཀུར་ ཤེས་ཡོན་ རྒྱལ་སྤྱི་ ཚོགས་སྡེ་ དཔལ་འབྱོར་ མཉམ་འབྲེལ་) རྒྱབ་ཁུངས་དང་བཅས།", "marks": 15}, {"point": "དཔེ་ (འབྲུག་གི་ ཞི་བདེའི་ སྲིད་བྱུས་) དང་ ལུང་།", "marks": 5}, {"point": "མཇུག་བསྡུ།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'essay'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'E2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'E2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 15.0, 1 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 10.5, 2 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 4.5, 3 from me_q where key = 'E2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ ༥ གི་ལན་ག་ར་བྲིས་དགོ། (སྐུགས་ ༥x༢=༡༠)

a) དབྱངས་ཡིག་ བཞི་གི་ མིང་བྲིས་ཏེ་ ཡི་གུ་ཅིག་ནང་ རེ་རེ་ བཀལ་ཏེ་ དཔེ་སྟོན། (2 marks)', 'a) གི་གུ (ི) ཞབས་ཀྱུ (ུ) འགྲེང་བུ (ེ) ན་རོ (ོ) - དཔེ། ཀི་ ཀུ་ ཀེ་ ཀོ།', null, '[{"point": "གི་གུ་ (ི) ཞབས་ཀྱུ་ (ུ) འགྲེང་བུ་ (ེ) ན་རོ་ (ོ) - དཔེ་ (ཀི་ ཀུ་ ཀེ་ ཀོ)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF.", "Part a) is new (the real part on how Thonmi formed six letters was left out)."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2024-l1', 1, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'L1a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'L1a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 1.0, 1 from me_q where key = 'L1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'L1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ ༥ གི་ལན་ག་ར་བྲིས་དགོ། (སྐུགས་ ༥x༢=༡༠)

b) དབྱངས་གསལ་ལ་ མིང་གི་རྣམ་གྲངས་མི་འདྲ་བ་ཇི་ལྟར་འདུག? ༢རེ་ངོས་འཛིན་བྱོས། (2 marks)', 'b) དབྱངས་ལུ་ ཨཱ་ལི་ དང་ སྲོག། གསལ་བྱེད་ལུ་ ཀཱ་ལི་ དང་ ལུས། ཟེར་ མིང་གི་ རྣམ་གྲངས་ ཡོད།', null, '[{"point": "དབྱངས་ - ཨཱ་ལི་ / སྲོག། གསལ་བྱེད་ - ཀཱ་ལི་ / ལུས།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF.", "Part a) is new (the real part on how Thonmi formed six letters was left out)."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2024-l1', 2, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'L1b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'L1b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 1.0, 1 from me_q where key = 'L1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'L1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ ༥ གི་ལན་ག་ར་བྲིས་དགོ། (སྐུགས་ ༥x༢=༡༠)

c) ཡང་འཇུག་ཅེས་པའི་གོ་དོན་དང་ ཡང་འཇུག་ད་ཞུགས་ཡོད་པའི་དཔེར་བརྗོད་༢བྲིས། (2 marks)', 'c) ཡང་འཇུག་ ཟེར་མི་འདི་ རྗེས་འཇུག་གི་ རྗེས་ལུ་ ཡང་བསྐྱར་ འཇུག་པའི་ ཡི་གུ་ (ས་ དང་ ད་) ཨིན། དཔེ། བསྒྲུབས། ལྷགས།', null, '[{"point": "ཡང་འཇུག་ - རྗེས་འཇུག་གི་ རྗེས་སུ་ ཡང་ འཇུག་པའི་ ཡི་གུ་ (ས་ ད) - དཔེ་ བསྒྲུབས་ ལྷགས།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF.", "Part a) is new (the real part on how Thonmi formed six letters was left out)."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2024-l1', 3, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'L1c', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'L1c' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 1.0, 1 from me_q where key = 'L1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'L1c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ ༥ གི་ལན་ག་ར་བྲིས་དགོ། (སྐུགས་ ༥x༢=༡༠)

d) ཕྲད་རང་དབང་ཅན་དང་གཞན་དབང་ཅན་གཉིས་ཀྱི་ ཁྱད་པར་ཕྱེས། (2 marks)', 'd) ཕྲད་གཞན་དབང་ཅན་ - ཚིག་སྔ་མའི་ མཐའ་ཡིག་དང་འཁྲིལ་ཏེ་ ཕྲད་ཀྱི་ རྣམ་པ་ འགྱུར་བ་ (དཔེ། ཀྱི་ གི་ གྱི་ འི་ ཡི།)། ཕྲད་རང་དབང་ཅན་ - མཐའ་ཡིག་ ག་ཅི་ཡོད་རུང་ མ་འགྱུར་བར་ རང་གི་ རྣམ་པ་ཐོག་ལུ་ སྡོད་མི་ (དཔེ། ནི་ དང་ ལས་ ནས།)། (Claude: check)', null, '[{"point": "གཞན་དབང་ཅན་ - མཐའ་ཡིག་དང་འཁྲིལ་ཏེ་ འགྱུར་བ་ (ཀྱི་གི་གྱི་འི་ཡི) རང་དབང་ཅན་ - མ་འགྱུར་བ་ (ནི་ དང་ ལས་ ནས)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF.", "Part a) is new (the real part on how Thonmi formed six letters was left out)."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2024-l1', 4, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'L1d', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'L1d' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 1.0, 1 from me_q where key = 'L1d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L1d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'L1d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ ༥ གི་ལན་ག་ར་བྲིས་དགོ། (སྐུགས་ ༥x༢=༡༠)

e) ཨི་ལྡན་གྱི་དབྱངས་མ་ཞུགས་པའི་རྩོམ་ཤོ་ལོ་ཀ་གཅིག་རང་གི་ཕམ་དང་སློབ་དཔོན་རྒྱལ་ཁབ་གང་རུང་ཅིག་ལུ་བྲིས། (2 marks)', 'e) ཕ་མ་བཟང་པོ་ཕན་བདེ་སྟེར། །ལུས་དང་ཟས་གོས་ཡོངས་སུ་བསྐྱངས། །སློབ་སྟོན་ཤེས་རབ་ཡར་སྤེལ་མཛད། །ཕ་མ་མཆོག་ལ་ཕྱག་འཚལ་ལོ། །', null, '[{"point": "གི་གུ་ མེད་པའི་ ཚིགས་བཅད་ ཤོ་ལོ་ཀ་ (རྐང་པ་ ༤) དོན་དང་ ཡིག་སྦྱོར་ ངེས་བདེན།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF.", "Part a) is new (the real part on how Thonmi formed six letters was left out)."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2024-l1', 5, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'L1e', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'L1e' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 1.0, 1 from me_q where key = 'L1e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L1e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'L1e';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'ཚིག་ཕྲད་ཅེས་པའི་གོ་དོན་ནི་', null, 'ཕྲད་ནི་ ལྕགས་གཉིས་ སྦྱོར་བའི་ ཚ་ལ་ ལྟ་བུ་ཨིན། (Claude''s answer: check)', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-mcq'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'K2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'K2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'བསྟན་བྱའི་དོན་མེན་ཀྱང་ཕྲད་ཞུགས་ཚེ་ཚིག་སྔ་ཕྱི་གཉིས་འབྲེལ་བ་བཟོ་ཚུགས་མི།', false, 1), ('B', 'བསྟན་བྱའི་དོན་མེད་ཀྱང་ཕྲད་ཞུགས་ཚེ་ཚིག་སྔ་མ་དང་འབྲེལ་བ་བཟོ་ཚུགས་མི།', false, 2), ('C', 'བསྟན་བྱའི་དོན་མེད་ཀྱང་ཕྲད་ཞུགས་ཚེ་ཚིག་ཕྱི་མ་དང་འབྲེལ་བ་བཟོ་ཚུགས་མི།', false, 3), ('D', 'བསྟན་བྱའི་དོན་མེད་ཀྱང་ཕྲད་ཞུགས་ཚེ་ལྕགས་གཉིས་སྦྱོར་བའི་ཚ་ལ་ལྟ་བུ་འབྲེལ་བ་བཟོ་ཚུགས་མི།', true, 4)) as v(label, body, ok, pos) where me_q.key = 'K2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'སུམ་ཅུ་པའི་གཞུང་སློབ་སྦྱོང་བྱེད་པའི་དགོས་པ་ནི་', null, 'སུམ་ཅུ་པ་ སློབ་སྦྱོང་ གི་ དགོས་པ་ - བརྡ་སྤྲོད་ (བརྡ་སྦྱོར) རིག་པའི་ གནས་ལུ་ མི་རྨོངས་པ། (Claude''s answer: check)', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-mcq'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'K5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'K5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'བརྡ་སྦྱོར་རིག་པའི་གནས་ལུ་མི་རྨོངས་པའི་དགོས་པ།', true, 1), ('B', 'ཐུ་མི་སམྦྷོ་ཊའི་སྐོར་ལས་ཤེས་པའི་དགོས་པ།', false, 2), ('C', 'བོད་ལ་ཡི་གེ་ཇི་ལྟར་བྱུང་ཚུལ་གྱི་སྐོར་ལས་ཤེས་པའི་དགོས་པ།', false, 3), ('D', 'སུམ་ཅུ་པའི་གཞུང་ཇི་ལྟ་བ་བཞིན་དུ་རྟོགས་པའི་དགོས་པ།', false, 4)) as v(label, body, ok, pos) where me_q.key = 'K5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ལྔའི་ལན་ག་ར་བྲིས། (སྐུགས་ ༥x༡=༥)

a) རྫོང་ཁའི་སྐད་ཡིག་གི་བྱེད་ལས་ག་ཅི་ཨིནམ་སྨོ? (1 mark)', 'a) རྫོང་ཁ་འདི་ རྒྱལ་ཡོངས་ཀྱི་ སྐད་ཡིག་ཨིནམ་ལས་ མི་སེར་ཚུ་ བརྡ་དོན་བརྗེ་སོར་ གཞུང་གི་ ཡིག་ཆ་ ཤེས་རིག་ ཚུ་ནང་ ལག་ལེན་འཐབ་ཨིན། མཐུན་སྒྲིལ་ དང་ ངོ་རྐྱང་གི་ མཚོན་རྟགས་ཨིན།', null, '[{"point": "རྒྱལ་ཡོངས་ཀྱི་ སྐད་ཡིག - བརྡ་དོན་བརྗེ་སོར་ གཞུང་གི་ ཡིག་ཆ་ མཐུན་སྒྲིལ་ ངོ་རྐྱང་", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-in-use'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF.", "Part c) is new (the real spelling-correction part was left out: the PDF font hides the printed misspellings)."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2024-l2', 1, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'L2a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'L2a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 0.5, 1 from me_q where key = 'L2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L2a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ལྔའི་ལན་ག་ར་བྲིས། (སྐུགས་ ༥x༡=༥)

b) རྫོང་ཁའི་མིང་ཚིག་གི་ཐ་སྙད་ནང་ལུ་ ཆོས་སྐད་ལས་སྒྱུར་བཅོས་འབད་ཡོད་པའི་མིང་ཚིག་བཞི་གི་དཔེ་རེ་བཀོད། (1 mark)', 'b) ཡིན་ → ཨིན། འགྲོ་ → འགྱོ། བྱེད་ → འབད། སྨྲས་ → སླབ། (Claude''s examples: check)', null, '[{"point": "དཔེ་ བཞི་ (ཡིན་ → ཨིན། འགྲོ་ → འགྱོ། བྱེད་ → འབད། སྨྲས་ → སླབ།) (Claude: check)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-in-use'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF.", "Part c) is new (the real spelling-correction part was left out: the PDF font hides the printed misspellings)."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2024-l2', 2, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'L2b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'L2b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 0.5, 1 from me_q where key = 'L2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L2b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ལྔའི་ལན་ག་ར་བྲིས། (སྐུགས་ ༥x༡=༥)

c) མགོ། ལག་པ། མིག། ཁང་པ། ཟེར་བའི་ ཚིག་ཚུ་གི་ ཞེ་ས་ བྲིས། (1 mark)', 'c) མགོ་ → དབུ། ལག་པ་ → ཕྱག། མིག་ → སྤྱན། ཁང་པ་ → གཟིམ་ཆུང་ (གཟིམས་ཁང)།', null, '[{"point": "དབུ། ཕྱག། སྤྱན། གཟིམ་ཆུང་ / གཟིམས་ཁང་།", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-in-use'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF.", "Part c) is new (the real spelling-correction part was left out: the PDF font hides the printed misspellings)."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2024-l2', 3, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'L2c', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'L2c' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 0.5, 1 from me_q where key = 'L2c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L2c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ལྔའི་ལན་ག་ར་བྲིས། (སྐུགས་ ༥x༡=༥)

d) མཐུ་ཆེན་ཆོས་ཀྱི་རྒྱལ་པོ་འབྲུག་ལུ་མ་བྱོན་པ་ཅིན་ རྒྱལ་ཡོངས་ཀྱི་ཁ་སྐད་ག་ཅི་ནང་འོང་ག? ག་དེ་སྦེ? (1 mark)', 'd) ཞབས་དྲུང་མ་བྱོན་པ་ཅིན་ རྒྱལ་ཁབ་ གཅིག་ཏུ་ མ་བསྡམས་པར་ ས་ཁོངས་ སོ་སོ་ནང་ རང་སོའི་ ཁ་སྐད་ (ཤར་ཕྱོགས་ ཚངས་ལྷ་ སོགས) ར་ ལག་ལེན་འཐབ་སྟེ་ རྒྱལ་ཡོངས་ཀྱི་ ཁ་སྐད་ གཅིག་ ཡོད་ནི་ མེད་ ཟེར་ བསམ། (བསམ་འཆར་ - རྒྱུ་མཚན་ བཀོད་དགོ)', null, '[{"point": "རང་གི་ བསམ་འཆར་ རྒྱུ་མཚན་དང་བཅས་", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-in-use'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF.", "Part c) is new (the real spelling-correction part was left out: the PDF font hides the printed misspellings)."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2024-l2', 4, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'L2d', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'L2d' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 0.5, 1 from me_q where key = 'L2d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L2d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'འོག་གི་དྲི་བ་ལྔའི་ལན་ག་ར་བྲིས། (སྐུགས་ ༥x༡=༥)

e) སྐད་ཡིག་མཁས་པ་ཚུ་གིས་རྒྱལ་ཁབ་ག་ཏེ་ཨིན་རུང་ རང་གི་སྐད་ཡིག་གཞི་བཟུང་སྟེ་ཞིབ་འཚོལ་འབད་དགོཔ་སྦེ་བཀོད་དེ་འདུག? ག་ཅི་འབད་ཨིན་ན? (1 mark)', 'e) རང་གི་སྐད་ཡིག་འདི་ རྒྱལ་ཁབ་ཀྱི་ ངོ་རྐྱང་དང་ ལམ་སྲོལ་ ཆོས་ ལོ་རྒྱུས་ ཚུ་ འཛིན་མི་ཨིནམ་ལས་ ཞིབ་འཚོལ་འབད་དེ་ གོང་འཕེལ་ མ་བཏང་པ་ཅིན་ སྐད་ཡིག་ ཉམས་ཏེ་ ངོ་རྐྱང་ཡང་ བརླག་འོང་།', null, '[{"point": "རྒྱུ་མཚན་ (རང་སྐད་ ཧ་གོ་ ལམ་སྲོལ་ སྲུང་སྐྱོབ་ ངོ་རྐྱང་)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-in-use'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF.", "Part c) is new (the real spelling-correction part was left out: the PDF font hides the printed misspellings)."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2024-l2', 5, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'L2e', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'L2e' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 0.5, 1 from me_q where key = 'L2e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 0.5, 2 from me_q where key = 'L2e';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ལེགས་ཤོམ་སྦེ་ ལྷག་ཞིནམ་ལས་ དྲི་བའི་ལན་བྲིས།

༆ སྤྱིར་བཏང་ཟློས་གར་རིག་པའི་འབྱུང་ཁུངས། དེ་ཡང་ལོ་རྒྱུས་ལས་བཤད་དོ་བཟུམ་འབད་བ་ཅིན་ ཧེ་མ་ བསྐལ་པ་བཟང་པོ་རྫོགས་ལྡན་གྱི་དུས་ཀྱི་ཤུལ་མ་ གསུམ་ལྡན་གྱི་བསྐལ་པ་འགོ་བཙུགས་པའི་སྐབས་ལུ་ རིག་བྱེད་ཆེན་པོ་བཞི་འཇིག་རྟེན་མི་ཡུལ་ལུ་དར་ཏེ་ཡོད་རུང་ དེ་གིས་མི་གི་འདོད་པ་གྲུབ་མ་ཚུགསཔ་ལས་ ཉིནམ་གཅིག་སུམ་ཅུ་ར་གསུམ་གྱི་གནས་ ཚངས་པའི་འཇིག་རྟེན་ལུ་ལྷའི་དབང་པོ་བརྒྱ་བྱིན་དང་ ལྷ་ཚུ་གིས་ལྷའི་རྒྱལ་པོ་ཚངས་པའི་ཞབས་སར་ལུ་བཅར་ཏེ་ སྲིད་པ་གསུམ་ན་ཡོད་པའི་འགྲོ་བ་སེམས་ཅན་གེ་ར་གི་ཕན་བདེའི་དོན་ལུ་ རིག་བྱེད་ལྔ་པ་ཅིག་ངེས་པར་དུ་གསུང་གནང་དགོཔ་སྦེ་ གསོལཝ་བཏབ་པའི་ངོར་ལུ་ལྷ་ཚངས་པ་གིས་ ཁྱེད་ཚུ་སྡུག་བསྔལ་མ་འབད་ཟེར་ རིག་བྱེད་རེ་རེའི་ནང་ལས་ཁྱད་པར་གྱི་ཆོས་རེ་ཟུར་བཏོན་མཛད་དེ་ རིག་བྱེད་ལྔ་པ་ནཏྱ་ཝེ་ངྷ་ཟེར་ཟློས་གར་གྱི་རིག་བྱེད་འདི་བརམས་ཞིནམ་ལས་སེམས་ཅན་སྡུག་བསྔལ་ལས་ འགྲོལ་ཐབས་འབད་ནི་ཨིན་ཟེར་གསུངས་ནུག།

དེ་ཡང་སྙན་ངག་གི་རིག་བྱེད་ལས་སྒྲ་དང་སྙན་ཚིག་ཚུ་བཏོན། ངེས་བརྗོད་ཀྱི་རིག་བྱེད་ལས་གཟུགས་ཀྱི་ཉམས་དང་རྣམ་འགྱུར་ཚུ་བཏོན། མཆོད་སྦྱིན་གྱི་རིག་བྱེད་ལས་དབྱངས་དང་གདངས་ཚུ་བཏོན། སྲིད་སྲུང་གི་རིག་བྱེད་ལས་གདོང་གི་རྣམ་འགྱུར་ཚུ་བཏོན་ཏེ་ རོ་ཉམས་དང་ལྡན་པའི་ཟློས་གར་གྱི་རིག་བྱེད་གསར་གཏོད་མཛད་གནང་གནངམ་ཨིན་པས། ལྷ་ཚངས་པ་གིས་དེ་སྦེ་གསར་གཏོད་མཛད་གནང་ཞིནམ་ལས་ ཟློས་གར་འདི་མི་ཡུལ་ལུ་མ་བཏོན་པའི་ཧེ་མ་ཚར་གཅིག་ ལྷ་དང་ལྷ་མིན་ལ་སོགས་པ་ སྟེང་ལྷའི་གནས་ནང་ཡོད་མི་ཚུ་ལུ་སྟོན་ནིའི་དོན་ལུ་ སྤྲུལ་པའི་བཟོ་བོ་བྷི་ཤྭ་ཀར་ལུ་ཞལ་བཀོད་གནང་སྟེ་ འཁྲབ་སྟོན་ཁང་ཅིག་བཟོ་སྟེ་ སྟོན་པའི་སྐབས་ལུ་ འཁྲབ་སྟོན་གྱི་བཅུད་དོན་འདི་ནང་ ལྷ་དང་ལྷ་མིན་གཉིས་འཐབ་རྩོད་ཀྱི་སྐབས་ལུ་ལྷ་ཚུ་གིས་རྒྱལ་ཁ་ཐོབ་སྟེ་ཡོདཔ་སྦེ་སྟོནམ་ལས་བརྟེན་ ལྷ་མིན་ཚུ་གིས་ལྷ་ཚངས་པ་ལུ་ དེ་སྦེ་ཕྱོགས་རིས་ཡོད་པའི་ལྟདམོ་མེན་པར་སྲིད་པ་གསུམ་ན་ལྷ་མི་གེ་ར་ལུ་ ཕན་བདེའི་སྤྲོ་བ་བྱིན་ནི་ཡོདཔ་ཅིག་མཛད་གནང་དགོ་ཟེར་བའི་ཞུ་བའི་ལན་ལུ་ ལྷ་ཚངས་པ་གིས་ང་གིས་བརམས་པའི་ཟློས་གར་འདི་ལྷ་རྐྱངམ་ཅིག་སེམས་དགའ་ནིའི་དོན་ལུ་ཡང་མེན། ལྷ་མིན་རྐྱངམ་ཅིག་སེམས་དགའ་ནིའི་དོན་ལུ་ཡང་མེན། ངེའི་ཟློས་གར་འདི་གིས་ག་ཅི་སྟོན་སྨོ་ཟེར་བ་ཅིན་ སེམས་ཅན་རང་ར་སོ་སོ་གི་ཁམས་དང་དབང་པོ་དང་བསྟུན་པའི་སེམས་ཀྱི་ཉམས་ཚུ་ ཕྱི་ཁར་སྟོན་ནི་ཨིནམ་ལས་ དེ་གིས་ངེས་འབྱུང་ཅན་ལུ་ཆོས་དང་། ཁོང་ཁྲོ་ཅན་ལུ་བཟོད་པ། འདོད་ཆགས་ཅན་ལུ་བདེ་བ་དང་། སྡོམ་པ་ཅན་ལུ་ཚུལ་ཁྲིམས། དཔའ་ཞུམ་མི་ལུ་སྙིང་སྟོབས། དཔའ་བོ་ལུ་ང་རྒྱལ། རྨོངས་པ་ལུ་ཤེས་རབ། མཁས་པ་ལུ་ཡོན་ཏན། མྱ་ངན་ཕྱོགས་མི་ལུ་དང་ལེན་གྱི་བཟོད་པ། ཚོང་པ་ལུ་ཁེ་སང་ལ་སོགས་པ་ སེམས་ཀྱི་རྣམ་རྟོག་དང་འཁྲིལ་ཏེ་བཟོ་བཟོཝ་ཨིནམ་ལས་ དྲག་ཞན་མཐོ་དམའ་ཀུན་གྱིས་དགའ་མགུ་སྤྲོ་གསུམ་གྱི་ཐོག་ལས་ལོངས་སྤྱོད་ནིའི་དོན་ལུ་ ཨིན་ཟེར་གསུངས་ནུག།

ཟློས་གར་རིག་པ་འདི་ འཇིག་རྟེན་མི་ཡུལ་ལུ་དར་ཚུལ་འདི་ འཛམ་བུ་གླིང་ལུ་འགོ་ཐོག་ བ་ར་ཏ་མུ་ནི་གིས་ ཚངས་པ་ཆེན་པོའི་ལུང་བསྟན་དང་འཁྲིལ་ཏེ་ སྤྱི་ལོའི་ཧེ་མ་ལོ་༡༠༠༠ དེ་ཅིག་ལུ་ ཟློས་གར་གྱི་མཚན་ཉིད་སྟོན་པའི་གཞུང་གསརཔ་བརམས་ཏེ་འཛམ་བུ་གླིང་ལུ་ ཟློས་གར་གྱི་རིག་གཞུང་ ཁྱབ་སྤེལ་མཛད་གནང་སྟེ་ འཇིག་རྟེན་མི་ཡུལ་ལུ་ དར་ཞིནམ་ལས་ཚུར་ ཟློས་གར་འཁྲབ་པའི་སྐབས་ལུ་ མགུ་ཏོག་གི་འགུལ་བསྐྱོད་དང་ མིག་ཏོ་ལྟ་ཐངས་གདོང་གི་རྣམ་འགྱུར་ལ་སོགས་པ་ལས་ རྐངམ་གཡུག་ནི་དང་ སྤར་ཐངས་ཚུན་ ལུས་དང་ཡན་ལག་གི་འགུལ་བསྐྱོད་གྱངས་ཁ་མེདཔ་ཅིག་དང་ དབྱངས་དང་ཚིག་གསུམ་གྱི་སྦྱོར་བ་ཚུ་བརྡ་དོན་སྟོན་ནིའི་དོན་ལུ་ དར་ཁྱབ་སོང་སྟེ་ཡོདཔ་ཨིན།

(ཀ) འོག་གི་དྲི་བ་རེ་ལུ་ ལན་ ༤ ཡོད་ས་ལས་ ལན་ངོ་མ་འདི་ གདམ་ཁ་རྐྱབ་སྟེ་ བྲིས། (སྐུགས་ ༥x༡=༥)
༡) ལྷ་ཚངས་པ་གིས་སེམས་ཅན་ཚུ་སྡུག་བསྔལ་ལས་འགྲོལ་ཐབས་ལུ་རིག་བྱེད་ལྔ་པ་བརམས་དགོ་མི་འདི་ ཀ ལྷའི་དབང་པོ་བརྒྱ་བྱིན་དང་ལྷ་ཚུ་གི་རྒྱལ་པོ་འབདཝ་ལས་ཨིན། ཁ ལྷ་དང་ལྷ་མིན་འཐབ་རྩོད་ཀྱི་སྡུག་བསྔལ་ལས་འགྲོལ་ཐབས་ཀྱི་དོན་ལུ་འབདཝ་ལས་ཨིན། ག ལྷའི་དབང་པོ་བརྒྱ་བྱིན་དང་ལྷ་ཚུ་གི་འགྲོ་ཀུན་ཕན་བདེའི་ཆེད་དུ་གསོལཝ་བཏབ་ལས་ཨིན། ང འདོད་ཆགས་ཅན་ལུ་བདེ་བ་དང་རྨོངས་པ་ལུ་ཤེས་རབ་མཁས་པ་ལུ་ཡོན་ཏན་ཚུ་ཐོབ་ཐབས་ལུ་ཨིན།
༢) ཟློས་གར་གྱི་རིག་པ་འདི་ ཀ རིག་བྱེད་བཞི་ལས་བཏོན་ནུག། ཁ སྙན་ངག་ངེས་རྗོད་སྲིད་སྲུང་གསུམ་ལས་བཏོན་ནུག། ག མཆོད་སྦྱིན་གྱི་རིག་བྱེད་དང་ངེས་བརྗོད་གཉིས་ལས་བཏོན་ནུག། ང སྲིད་སྲུང་གི་རིག་བྱེད་གཅིག་ལས་རོ་ཉམས་ལྡན་པའི་ཟློས་གར་བཏོན་ནུག།
༣) ཟློས་གར་གྱི་རིག་པ་ཚངས་པ་གིས་བརམས་གནངམ་ལས་བརྟེན་ཏེ་ ཀ ད་རེས་ནངས་པར་ལམ་སྲོལ་ཁྱད་དུ་འཕགསཔ་ཅིག་སྟོན་ཚུགས་པས། ཁ ད་རེས་ནངས་པར་ཟློས་གར་གྱི་ལེའུ་དང་གདངས་ཚུ་ལེགས་ཤོམ་སྟོན་ཚུགས་པས། ག ད་རེས་ནངས་པར་རིག་བྱེད་ལྔའི་ཟློས་གར་གྱི་རིག་པ་འདི་ག་ར་གིས་ལོངས་སྤྱོད་ཚུགས་པས། ང ད་རེས་ནངས་པར་སེམས་ཅན་རང་སོའི་ཁམས་དང་བསྟུན་ཏེ་ཕན་བདེའི་ལོངས་སྤྱོད་ཚུགས་པས།
༤) སྤྱིར་བཏང་ཟློས་གར་རིག་པ་འདི་འཛམ་བུ་གླིང་ལུ་ ནམ་དར་ནུག? ཀ སྔོན་བསྐལ་པ་རྫོགས་ལྡན་གྱི་དུས་ལུ། ཁ དུས་རབས་ཀྱི་ཧེ་ལོ་ལྔ་བརྒྱ་དེ་ཅིག་གི་དུས་ལུ། ག གསུམ་ལྡན་གྱི་བསྐལ་པ་འགོ་བཙུགས་པའི་སྐབས་ལུ། ང དུས་རབས་ཀྱི་ཧེ་མ་ལོ་ཆིག་སྟོང་དེ་ཅིག་གི་དུས་ལུ།
༥) མིག་ཏོ་རྐངམ་གདོང་གི་རྣམ་འགྱུར་ལ་སོགས་པའི་འགུལ་བསྐྱོད་ལེ་ཤ་འགྱུར་མི་འདི་ ཀ སྒྲ་དང་དབྱངས་ཀྱི་མཆོད་པ་ཕུལ་བའི་བརྡ་དོན་ལུ། ཁ གླུ་གཞས་ཀྱི་རིག་པ་ལུ་སྤྲོ་བ་འབྱུང་ནིའི་བརྡ་དོན་ལུ། ག དབྱངས་དང་ཚིག་སྦྱོར་གསུམ་བརྡ་དོན་སྟོན་ནིའི་དོན་ལུ། ང དགའ་མགུ་སྤྲོ་གསུམ་གྱི་ཐོག་ལས་ལོངས་སྤྱོད་པའི་བརྡ་དོན་ལུ། (སྐུགས་ 5)', '༡) ག  ༢) ཀ  ༣) ང  ༤) ང  ༥) ག', null, '[{"point": "༡) ག", "marks": 1}, {"point": "༢) ཀ", "marks": 1}, {"point": "༣) ང", "marks": 1}, {"point": "༤) ང", "marks": 1}, {"point": "༥) ག", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2024-cp', 1, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'C1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 2.0, 1 from me_q where key = 'C1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 2.0, 2 from me_q where key = 'C1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 1.0, 3 from me_q where key = 'C1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', '(ཁ) ༡) རིག་བྱེད་ལྔ་པ་ཟློས་གར་རིག་པ་འདི་གིས་ང་བཅས་རའི་ལམ་སྲོལ་ལུ་ཁེ་ཕན་ག་བཟུམ་འདུག? དོན་མཚམས་གཅིག་ནང་ལུ་གནད་དོན་བཞི་དེ་ཅིག་བཀོད། (སྐུགས་ 4)', 'ཟློས་གར་རིག་པ་འདི་གིས་ ང་བཅས་ཀྱི་ ལམ་སྲོལ་ལུ་ ཁེ་ཕན་ ལེ་ཤ་ཡོད། དང་པ་ འཆམ་ དང་ གཞས་ ཚུ་ ཟློས་གར་ལས་ བྱུང་སྟེ་ ལམ་སྲོལ་ སྲུང་སྐྱོབ་འབདཝ་ཨིན། གཉིས་པ་ ཚེས་བཅུའི་ འཆམ་ཚུ་གིས་ ཆོས་ཀྱི་ བསླབ་བྱ་ དང་ ལས་རྒྱུ་འབྲས་ སྟོནམ་ཨིན། གསུམ་པ་ མི་སེར་ཚུ་ལུ་ དགའ་མགུ་ སྤྲོ་གསུམ་ དང་ སེམས་ཀྱི་ ངལ་གསོ་ བྱིནམ་ཨིན། བཞི་པ་ སེམས་ཅན་ རང་སོའི་ ཁམས་དང་འཁྲིལ་ཏེ་ བཟོད་པ་ ཚུལ་ཁྲིམས་ ཤེས་རབ་ བཟུམ་གྱི་ ཡོན་ཏན་ སློབ་ཚུགསཔ་ཨིན།', null, '[{"point": "ཁེ་ཕན་ བཞི་ (སེམས་ཀྱི་ ཉམས་ ཕྱི་ཁར་ སྟོན་ ལམ་སྲོལ་ སྲུང་སྐྱོབ་ ཆོས་ཀྱི་ བསླབ་བྱ་ དགའ་སྤྲོ)", "marks": 3}, {"point": "དོན་མཚམས་ གཅིག་ ཡིག་སྦྱོར།", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2024-cp', 2, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'C2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 2.0, 1 from me_q where key = 'C2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 1.5, 2 from me_q where key = 'C2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'C2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', '(ཁ) ༢) ཟློས་གར་རིག་པའི་ རྨོངས་པ་ལུ་ཤེས་རབ་ཟེར་བའི་སྐབས་ རིག་པ་ག་བཟུམ་ཐོབ་འོང་ག? ཁུངས་བཤད་རྐྱབ། (སྐུགས་ 4)', 'རྨོངས་པ་ ཟེར་མི་ མི་ཤེས་པའི་ མི་ཚུ་གིས་ ཟློས་གར་ བལྟཝ་ད་ ལེགས་ཉེས་ དགེ་སྡིག་ ཤན་འབྱེད་ ཤེས་པའི་ ཤེས་རབ་ཀྱི་ རིག་པ་ ཐོབ་འོང་། ཟློས་གར་ནང་ ལས་ལེགས་ཉེས་ཀྱི་ འབྲས་བུ་ མིག་མཐོང་ སྦེ་ སྟོནམ་ལས་ ཧ་གོ་ལཱ་སླ་སྦེ་ ཤེས་ཚུགས།', null, '[{"point": "རྨོངས་པ་ (མི་ཤེས་མི) ཚུ་གིས་ ཟློས་གར་ བལྟ་སྟེ་ ལེགས་ཉེས་ ཤན་འབྱེད་ ཤེས་ནི་གི་ ཤེས་རབ་ ཐོབ།", "marks": 2}, {"point": "ཁུངས་ - ཟློས་གར་གྱིས་ སེམས་ཀྱི་ ཉམས་ དང་ བྱ་སྤྱོད་ཀྱི་ འབྲས་བུ་ མིག་མཐོང་ སྟོནམ་ལས།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2024-cp', 3, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'C3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 2.0, 1 from me_q where key = 'C3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 1.5, 2 from me_q where key = 'C3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'C3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', '(ཁ) ༣) ཞབས་ཁྲ་རྐྱབ་པའི་སྐབས་ ལུས་ཀྱི་རྣམ་འགྱུར་རྐང་ལག་གི་འགུལ་བསྐྱོད་ཚིག་སྦྱོར་ཚུ་ལེགས་ཤོམ་ཡོད་པ་ཅིན་རང་གི་ལམ་སྲོལ་གྱི་ཉམས་སྲུང་ཕན་པ་ག་བཟུམ་འོང་ག? དོན་མཚམས་གཉིས་ནང་ལུ་བྲིས། (སྐུགས་ 4)', 'ཞབས་ཁྲ་ རྐྱབ་པའི་སྐབས་ ལུས་ཀྱི་ རྣམ་འགྱུར་ རྐང་ལག་གི་ འགུལ་བསྐྱོད་ དང་ ཚིག་སྦྱོར་ ཚུ་ ལེགས་ཤོམ་ཡོད་པ་ཅིན་ ལྟ་མི་ཚུ་ལུ་ དགའ་མགུ་ སྤྲོ་གསུམ་ སྐྱེ་སྟེ་ གཞོན་ནུ་ཚུ་གིས་ཡང་ ཡིད་ཆེས་ཏེ་ སློབ་ནི་ལུ་ སྤྲོ་བ་ སྐྱེཝ་ཨིན།

དེ་གིས་ ལམ་སྲོལ་འདི་ ཉམས་མེད་ སྲུང་སྐྱོབ་ འབད་ཚུགས་པའི་ཁར་ མི་རབས་ ཤུལ་མ་ཚུ་ལུ་ ཡང་ ཚད་ལྡན་ སྦེ་ སྤྲོད་ཚུགས། ཕྱི་རྒྱལ་གྱི་ ལྟ་བཤལ་པ་ཚུ་ལུ་ཡང་ འབྲུག་གི་ ངོ་རྐྱང་ སྟོན་ཚུགས།', null, '[{"point": "དོན་མཚམས་ ༡ - ཞབས་ཁྲ་ ལེགས་ཤོམ་ཡོད་པ་ཅིན་ ལྟ་མི་ ཚུ་ལུ་ དགའ་སྤྲོ་ སྐྱེ་ནི་ དང་ གཞོན་ནུ་ཚུ་གིས་ སློབ་ནི།", "marks": 2}, {"point": "དོན་མཚམས་ ༢ - ལམ་སྲོལ་ ཉམས་མེད་ སྲུང་སྐྱོབ་ དང་ མི་རབས་ ཤུལ་མ་ལུ་ སྤྲོད་ཚུགས།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2024-cp', 4, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'C4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 2.0, 1 from me_q where key = 'C4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 1.5, 2 from me_q where key = 'C4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'C4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', '(ཁ) ༤) ཁོང་ཁྲོ། ལྷ་མིན། འདོད་ཆགས། ཚོང་པ། ཚུ་གི་ཚིག་ལག་ལེན་ཐོག་ལས་ཟུང་ལྡན་གྱི་རྩོམ་ཤོ་ལོ་གཅིག་རྐྱབ། (སྐུགས་ 4)', 'ཁོང་ཁྲོ་ཅན་ལུ་ བཟོད་པའི་ སྨན་ཡོད་དེ། །ལྷ་མིན་ ཚུ་ཡང་ ཞི་བར་འགྱུར། །འདོད་ཆགས་ཅན་ལུ་ བདེ་བའི་ ལམ། །ཚོང་པ་ ཚུ་ལུ་ ཁེ་ཕན་ཐོབ། ། (Claude''s attempt: a teacher must check the verse form)', null, '[{"point": "ཚིག་ བཞི་ ག་ར་ ལག་ལེན་འཐབ་ཡོདཔ།", "marks": 2}, {"point": "ཟུང་ལྡན་ (རྐང་པ་ ཆ་ཟུང་) གི་ བཀོད་པ་ དང་ དོན་འབྲེལ།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2024-cp', 5, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'C5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 2.0, 1 from me_q where key = 'C5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 1.5, 2 from me_q where key = 'C5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'C5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', '(ཁ) ༥) ང་བཅས་རྒྱལ་ཁབ་ལུ་ཟློས་གར་གླུ་གཞས་ཚུ་ནམ་ལས་བྱུང་བྱུངམ་བཟུམ་མཐོང་མས? ག་ཅི་འབད? ཁུངས་བཀལ། (སྐུགས་ 4)', 'ང་གི་ བསམ་འཆར་ལུ་ འབྲུག་ནང་ ཟློས་གར་ (འཆམ་) ཚུ་ ནང་པའི་ ཆོས་ དར་ཁྱབ་ སོང་པའི་ དུས་ལས་ར་ བྱུང་ཡོདཔ་ཨིན། གཏེར་སྟོན་ པདྨ་གླིང་པ་ གིས་ འཆམ་ ལེ་ཤ་ བཞེངས་ཡོདཔ་ དང་ ཤུལ་ལས་ རྫོང་ཚུ་ནང་ ཚེས་བཅུ་ གི་ ལམ་སྲོལ་ དར་ཡོདཔ་ཨིན། ཆོས་ཀྱི་ བསླབ་བྱ་ སྟོན་ནི་ དང་ མི་སེར་ཚུ་ལུ་ དགའ་སྤྲོ་ བྱིན་ནིའི་དོན་ལུ་ཨིན། (བསམ་འཆར་ - ཁུངས་ བཀལ་དགོ། Claude: check facts)', null, '[{"point": "རང་གི་ བསམ་འཆར་ - དུས་ནམ་ (དཔེ་ གུ་རུ་རིན་པོ་ཆེ་ / པདྨ་གླིང་པའི་ དུས་ལས་ འཆམ་)", "marks": 2}, {"point": "རྒྱུ་མཚན་ དང་ ཁུངས་", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2024-cp', 6, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'C6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 2.0, 1 from me_q where key = 'C6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 1.5, 2 from me_q where key = 'C6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 0.5, 3 from me_q where key = 'C6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', '(ག) འོག་གི་མིང་ཚིག་ཚུ་གི་རྣམ་གྲངས་ གོང་གི་ཡིག་རྒྱུགས་ནང་ལས་འཚོལ་ཏེ་བྲིས། (སྐུགས་ ༡x༥=༥)
༡) ཐེ་རེག་འབའ་རེ། ༢) ཆེད་དུ། ༣) གསར་བཟོ། ༤) ཧན་ཚིག། ༥) གཡོག་བཀོལ། (སྐུགས་ 5)', '༡) ཚར་གཅིག ༢) དོན་ལུ། ༣) གསར་གཏོད། ༤) ཞུ་བ། (Claude: check) ༥) ཞལ་བཀོད།', null, '[{"point": "༡) ཚར་གཅིག", "marks": 1}, {"point": "༢) དོན་ལུ།", "marks": 1}, {"point": "༣) གསར་གཏོད།", "marks": 1}, {"point": "༤) ཞུ་བ། (Claude: check)", "marks": 1}, {"point": "༥) ཞལ་བཀོད།", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2024-cp', 7, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'C7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C7' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 2.0, 1 from me_q where key = 'C7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 2.0, 2 from me_q where key = 'C7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 1.0, 3 from me_q where key = 'C7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', '(ང) འོག་གི་མིང་ཚིག་ལྔ་གི་བརྗོད་ཚིག་བཟོ། གོང་གི་ཡིག་རྒྱུགས་ནང་ལས་འདྲ་བཤུས་རྐྱབ་མི་ཆོག། (སྐུགས་ ༡x༥=༥)
༡) བྲན་བཀོལ། ༢) བསྟན་སྤྱི། ༣) གནོད་ཉེན། ༤) སྔོ་འཁན། ༥) སྐྱེ་མཆེད། (སྐུགས་ 5)', '༡) སྔར་ རྒྱལ་པོ་ཚུ་གིས་ མི་ལུ་ བྲན་བཀོལ་ འབད་ནི་འདི་ ད་རེས་ མེད། ༢) བསྟན་སྤྱི་ ཡར་རྒྱས་ ཡོང་ནིའི་དོན་ལུ་ སྨོན་ལམ་ བཏབ། ༣) ཆརཔ་ དྲགས་པ་ཅིན་ ས་རུད་ཀྱི་ གནོད་ཉེན་ ཡོད། ༤) (སྔོ་འཁན་ - Claude cannot confirm this word; a teacher must check) ༥) སྐྱེ་མཆེད་ དྲུག་ ཟེར་ ཆོས་ནང་ བཤད་ཡོད།', null, '[{"point": "༡)", "marks": 1}, {"point": "༢)", "marks": 1}, {"point": "༣)", "marks": 1}, {"point": "༤)", "marks": 1}, {"point": "༥) རྗོད་ཚིག་རེ་རེ་ དོན་དང་ཡིག་སྦྱོར་ངེས་བདེན།", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-1-beddzo2024-cp', 8, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'C8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C8' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 2.0, 1 from me_q where key = 'C8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 2.0, 2 from me_q where key = 'C8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 1.0, 3 from me_q where key = 'C8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'translation', 'འོག་ལུ་ཨིང་སྐད་ཀྱི་ཐོག་ལུ་བཀོད་དེ་ཡོད་མི་འདི་ རྫོང་ཁའི་ནང་ལུ་སྐད་སྒྱུར་འབད་དེ་བྲིས། (སྐུགས་ ༡༥)

Screening for Cervical Cancer to regular healthcare services

During the 6th Meet-the-press session, Health Minister Tandin Wangchuk expressed concerns over women losing their lives, with 20-25 annual deaths, due to cervical cancer. To address this, the Health Minister announced that screening for cervical cancer has been added to regular healthcare services. This initiative is also a part of flagship project that includes breast and stomach cancers.

The latest screening for cervical cancer shows about 90 percent of women have been tested so far. However, 10 percent of women have not been screened. So, this will be continued in the 13th Five-Year Plan where the screening services will be offered to prevent at the earliest” said the Health Minister.

Previously, the vaccination for the prevention of cervical cancer was only administered to the girls, but Lyonpo Tandin Wangchuk stated that it will now be administered to boys as well.

Furthermore, to prevent cancers at the earliest stage, the Ministry of Health plans to create awareness programs and upgrade the qualifications of existing doctors to specialize in these fields.', 'ལན་གྱི་དཔེ།
བུ་ཚའི་སྐྲན་ནད་ བརྟག་ཞིབ་ འཕྲོད་བསྟེན་ ཞབས་ཏོག་ རྒྱུན་ལྡན་ནང་ བཙུགས་ཡོདཔ།
གསར་ཤོག་གི་ འཕྲད་ཚོགས་ ཐེངས་ ༦ པའི་སྐབས་ འཕྲོད་བསྟེན་བློན་པོ་ རྟ་མགྲིན་དབང་ཕྱུག་གིས་ བུ་ཚའི་སྐྲན་ནད་ (Cervical cancer) ལས་བརྟེན་ ལོ་བསྟར་ བུད་མེད་ ༢༠ ལས་ ༢༥ ཚུན་ ཚེ་ལས་འདས་དོ་ཡོདཔ་ལུ་ སེམས་ཁྲལ་ གསུངས་ཅི། དེ་ སེལ་ནིའི་དོན་ལུ་ བློན་པོ་གིས་ བུ་ཚའི་སྐྲན་ནད་ བརྟག་ཞིབ་འདི་ འཕྲོད་བསྟེན་ ཞབས་ཏོག་ རྒྱུན་ལྡན་ནང་ བཙུགས་ཡོདཔ་སྦེ་ ཁྱབ་བསྒྲགས་གནང་ཅི། ལས་འགུལ་འདི་ ནུ་མ་ དང་ ཕོ་བའི་ སྐྲན་ནད་ཡང་ ཚུདཔ་ཨིན་པའི་ གཙོ་བོའི་ ལས་འགུལ་གྱི་ ཡན་ལག་ཅིག་ཨིན།
བུ་ཚའི་སྐྲན་ནད་ བརྟག་ཞིབ་ ཤུལ་མམ་ལྟར་ བུད་མེད་ བརྒྱ་ཆ་ ༩༠ དེ་ཅིག་ བརྟག་ཞིབ་འབད་ཚར་ཡོདཔ་ཨིན། ཨིན་རུང་ བརྒྱ་ཆ་ ༡༠ བརྟག་ཞིབ་མ་འབད་བས། དེ་འབདཝ་ལས་ ལོ་ངོ་ལྔའི་འཆར་གཞི་ ༡༣ པའི་ནང་ འཕྲོ་མཐུད་དེ་ སྔ་ས་ར་ ཁ་ཐུག་འབད་ནིའི་དོན་ལུ་ བརྟག་ཞིབ་ ཞབས་ཏོག་ བྱིན་ནི་ཨིན་ ཟེར་ བློན་པོ་གིས་ གསུངས་ཅི།
ཧེ་མ་ བུ་ཚའི་སྐྲན་ནད་ ཁ་ཐུག་འབད་ནིའི་ ཁབ་ (Vaccination) འདི་ བུམོ་ཚུ་ལུ་རྐྱངམ་ཅིག་ བཙུགས་ཏེ་ཡོད་རུང་ ད་ལས་ཕར་ བུ་ཚུ་ལུ་ཡང་ བཙུགས་ནི་ཨིན་ ཟེར་ བློན་པོ་ རྟ་མགྲིན་དབང་ཕྱུག་གིས་ གསུངས་ཅི།
དེ་མ་ཚད་ སྐྲན་ནད་ ཚུ་ སྔ་ས་ར་ ཁ་ཐུག་འབད་ནིའི་དོན་ལུ་ འཕྲོད་བསྟེན་ལྷན་ཁག་གིས་ ཤེས་ཚོར་གྱི་ ལས་རིམ་ཚུ་ བཟོ་ནི་ དང་ ད་ལྟོ་ཡོད་པའི་ སྨན་པ་ཚུ་ ས་སྒོ་འདི་ཚུ་ནང་ ཁྱད་རིག་ཅན་ བཟོ་ནིའི་དོན་ལུ་ ཤེས་ཚད་ ཡར་དྲག་གཏང་ནིའི་ འཆར་གཞི་ཡོད། (བུ་ཚ་ / ཟ་ཁང་ - the right Dzongkha medical term must be checked by a teacher)', null, '[{"point": "དོན་ཚན་དང་པ་ - བློན་པོ་ རྟ་མགྲིན་དབང་ཕྱུག་ ལོ་ལྟར་ ༢༠-༢༥ ཤི་མི་ བཟའ་ཚང་གི་ཤ་ཚིལ་ བརྟག་ཞིབ་ ཞབས་ཏོག་ཐོག་ བཙུགས་ ནུ་མ་ ཕོ་བའི་ སྐྲན་ནད།", "marks": 5}, {"point": "དོན་ཚན་གཉིས་པ་ - ༩༠% བརྟག་ཞིབ་ ༡༠% མ་འབད་ ལོ་ལྔའི་འཆར་གཞི་ ༡༣ པ་ བུ་ཚུ་ལུ་ཡང་ ཁ་ཐུག་ཁབ།", "marks": 5}, {"point": "དོན་ཚན་གསུམ་པ་ - ཤེས་ཚོར་ ལས་རིམ་ སྨན་པ་ཚུ་གི་ ཁྱད་རིག།", "marks": 3}, {"point": "ཚིག་སྦྱོར་དང་ ཡིག་སྦྱོར།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'translation'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing.", "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, B.Ed. Paper I - Dzongkha for Dzongkha Graduates", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'T1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'T1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (བརྗོད་དོན།)', 'Relevant answer, ideas well developed, reasons, quotations and examples.', 8.0, 1 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language (ཚིག་སྦྱོར།)', 'Apt words, expressions, spelling and grammar.', 5.0, 2 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Punctuation, sentence and paragraph breaks.', 2.0, 3 from me_q where key = 'T1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'སུམ་ཅུ་པའི་ནང་ གསལ་བྱེད་ ག་དེམ་ཅིག་ཡོད?', null, 'གསལ་བྱེད་ ཀ་ལས་ ཨ་ཚུན་ སུམ་ཅུ་ (༣༠) ཡོད།', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-mcq'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'K1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '༢༨', false, 1), ('B', '༣༢', false, 2), ('C', '༣༠', true, 3), ('D', '༣༤', false, 4)) as v(label, body, ok, pos) where me_q.key = 'K1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'སྔོན་འཇུག་ ག་དེམ་ཅིག་ཡོད?', null, 'སྔོན་འཇུག་ ལྔ་ (ག་ ད་ བ་ མ་ འ) ཡོད།', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-mcq'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'K3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '༣', false, 1), ('B', '༥', true, 2), ('C', '༤', false, 3), ('D', '༡༠', false, 4)) as v(label, body, ok, pos) where me_q.key = 'K3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'རྗེས་འཇུག་ ག་དེམ་ཅིག་ཡོད?', null, 'རྗེས་འཇུག་ བཅུ་ (ག་ ང་ ད་ ན་ བ་ མ་ འ་ ར་ ལ་ ས) ཡོད།', '[]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'grammar-mcq'), (select id from public.exam_papers where code = 'me-bed-1'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha answer key and model answers written by Claude: a fluent Dzongkha teacher MUST check them before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper I (Dzongkha Graduates, Dzongkha): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, null)
  returning id
)
insert into me_q select 'K4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '༡༠', true, 1), ('B', '༥', false, 2), ('C', '༨', false, 3), ('D', '༢', false, 4)) as v(label, body, ok, pos) where me_q.key = 'K4';
commit;
