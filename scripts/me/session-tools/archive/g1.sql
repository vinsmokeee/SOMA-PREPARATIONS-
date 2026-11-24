-- ME Paper I (General, Dzongkha): BCSE 2024, batch 2: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'comprehension', 'Comprehension' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'essay', 'Essay' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'formal-writing', 'Formal writing' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'language-and-spelling', 'Language and spelling' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'pr-cis', 'Précis' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'dzongkha'), 'translation', 'Translation' on conflict (subject_id, slug) do nothing;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'essay', 'འོག་གི་འབྲི་རྩོམ་གྱི་དོན་ཚན་༢ ལས་ གང་རུང་ཅིག་གདམ་ཁ་རྐྱབ་སྟེ་ ཚིག་འབྲུ་༥༠༠ དེ་ཅིག་གི་ནང་འཁོད་ལུ་ འབྲི་རྩོམ་ཅིག་བྲིས།
(སྐུགས་ཀྱི་ཚད་གཞི་ ༡. ནང་དོན།
༢. འབྲི་བཀོད།
༣. སྐད་ཡིག་དང་ཡིག་སྦྱོར་ཚུ་ལུ་ གཞི་བཞག་སྟེ་ སྐུགས་བྱིན་ནི་ཨིན།)

དོན་ཚན་ ༡ པ། དེང་སང་གི་དུས་ལུ་ བཅོས་མའི་རིག་པ་ཤེས་དགོཔ་གལ་ཆེ་བའི་སྐོར་ལས་ གཞན་བློ་སྒྱུར་ཚུགས་པའི་འབྲི་རྩོམ་ ཅིག་བྲིས།', 'ལན་གྱི་དཔེ་ (outline)

མགོ་བཙུགས། བཅོས་མའི་རིག་པ་ཟེར་མི་འདི་ གློག་རིག་གིས་ མི་བཟུམ་སྦེ་ མནོ་བསམ་གཏང་ནི་དང་ ལཱ་འབད་ནི་གི་ འཕྲུལ་རིག་ཅིག་ཨིན། དེང་སང་ འཛམ་གླིང་ཡོངས་ལུ་ ཤེས་རིག་ གསོ་བ་ ཚོང་འབྲེལ་ ཞི་གཡོག་ཚུ་ནང་ ཁྱབ་སྤེལ་མགྱོགས་དྲགས་སྦེ་འགྱོ་དོ་ཡོདཔ་ལས་ ང་བཅས་ཀྱིས་ ཤེས་དགོཔ་ གལ་ཆེ།

ཤེས་དགོ་པའི་རྒྱུ་མཚན།
༡. ལཱ་གཡོག་དང་ གོ་སྐབས། མ་འོངས་པའི་ལཱ་གཡོག་མང་ཤོས་ཅིག་ནང་ བཅོས་མའི་རིག་པ་ལག་ལེན་འཐབ་ཚུགས་མི་ ལག་ཤེས་དགོཔ་ཨིན།
༢. ཤེས་ཡོན་དང་ གསོ་བ། སློབ་ཕྲུག་ཚུ་གིས་ རང་དབང་སྦེ་ ལྷབ་ཚུགསཔ་དང་ སྨན་པ་ཚུ་གིས་ ནད་ངོས་འཛིན་མགྱོགས་དྲགས་འབད་ཚུགས།
༣. ལཱ་མགྱོགས་དྲགས་དང་ ཁེ་ཕན་ཡར་སེང་། གཞུང་གི་ཞབས་ཏོག་དང་ ཚོང་ལཱ་ཚུ་ ཡར་དྲག་འགྱོ།
༤. རྒྱལ་ཁབ་ཀྱི་ ཌི་ཇི་ཊཱལ་དཔལ་འབོར་དང་ དགེ་ལེགས་ཕུག་ཞི་བདེ་སེམས་བརྩེའི་གྲོང་ཁྱེར་ཚུ་ནང་ ཤེས་ལྡན་མི་སྟོབས་དགོཔ།

ཉེན་ཁ་དང་ ཐབས་ལམ། ཟོལ་ཟོབ་ཀྱི་གནས་ཚུལ་དང་ བརྙན་བཟོ་ ཁ་བཟོ་འབད་ནི། མི་སྒེར་གྱི་གནས་སྡུད་ཉེན་ཁ། ལཱ་གཡོག་ལ་ལུ་ཅིག་ མེད་པར་འགྱོ་ནི། དེ་འབདཝ་ལས་ ཤེས་ཡོན་དང་ ཚུལ་ཁྲིམས་དང་ལྡནམ་སྦེ་ ལག་ལེན་འཐབ་དགོ།

མཇུག་བསྡུ། བཅོས་མའི་རིག་པ་འདི་ ཉེན་ཁ་ཡོད་རུང་ གོ་སྐབས་སྦོམ་ཨིནམ་ལས་ ན་གཞོན་ག་ར་གིས་ དུས་ཐོག་ལུ་ ཤེས་ཡོན་བསྐྱེད་དེ་ རང་གི་དང་ རྒྱལ་ཁབ་ཀྱི་ ཡར་རྒྱས་ལུ་ ལག་ལེན་འཐབ་དགོ།', null, '[{"point": "མགོ་བཙུགས། བཅོས་མའི་རིག་པ་ (AI) ཟེར་མི་ག་ཅི་ཨིན་ན་ ངོ་སྤྲོད་དང་ དེང་སང་ཁྱབ་སྤེལ་འགྱོ་དོ་ཡོདཔ།", "marks": 6}, {"point": "ཤེས་དགོ་པའི་རྒྱུ་མཚན་ ༣ ལས་ལྷག་ (ལཱ་གཡོག་དང་ ཤེས་རིག་ གསོ་བ་ ཚོང་འབྲེལ་ནང་ ཕན་ཐོགས། ལཱ་མགྱོགས་དྲགས། འཛམ་གླིང་དང་ཅིག་ཁར་ མཉམ་འགྲོ།)", "marks": 10}, {"point": "ཉེན་ཁ་དང་ ཆ་སྙོམས་ (ཟོལ་ཟོབ་ཀྱི་གནས་ཚུལ། གསང་བའི་གནས་སྡུད། ལཱ་གཡོག་མེདཔ། བློ་གཏད་དྲགས་ཉེན།) ཉེན་སྲུང་དང་ ཚུལ་ཁྲིམས་ལྡན་པའི་ལག་ལེན།", "marks": 8}, {"point": "གཞན་བློ་སྒྱུར་ཚུགས་པའི་ ཁུངས་དང་དཔེ། མཇུག་བསྡུ།", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'essay'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2024, batch 2", "source": {"title": "BCSE 2024 Main Examination, General category, Paper I (Dzongkha)", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'E1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'E1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 12.0, 1 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 7.5, 2 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 10.5, 3 from me_q where key = 'E1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'essay', 'འོག་གི་འབྲི་རྩོམ་གྱི་དོན་ཚན་༢ ལས་ གང་རུང་ཅིག་གདམ་ཁ་རྐྱབ་སྟེ་ ཚིག་འབྲུ་༥༠༠ དེ་ཅིག་གི་ནང་འཁོད་ལུ་ འབྲི་རྩོམ་ཅིག་བྲིས།
(སྐུགས་ཀྱི་ཚད་གཞི་ ༡. ནང་དོན།
༢. འབྲི་བཀོད།
༣. སྐད་ཡིག་དང་ཡིག་སྦྱོར་ཚུ་ལུ་ གཞི་བཞག་སྟེ་ སྐུགས་བྱིན་ནི་ཨིན།)

དོན་ཚན་ ༢ པ། རང་གི་ལམ་སྲོལ་གྱི་ར་བ་ རྒྱལ་ཡོངས་སྐད་ཡིག་འདི་ ཤེས་དགོ་པའི་སྐོར་ལས་ འབྲི་རྩོམ་ཅིག་བྲིས།', 'ལན་གྱི་དཔེ་ (outline)

མགོ་བཙུགས། རྫོང་ཁ་འདི་ འབྲུག་གི་རྒྱལ་ཡོངས་སྐད་ཡིག་ཨིནམ་སྦེ་ རྩ་ཁྲིམས་ཆེན་མོ་ནང་ གསལ་བཀོད་ཡོད་མི་དང་ ང་བཅས་རའི་ ལམ་སྲོལ་དང་ ངོ་རྐྱང་གི་ རྩ་བ་ཅིག་ཨིན།

ཤེས་དགོ་པའི་རྒྱུ་མཚན།
༡. རྒྱལ་ཁབ་ཀྱི་ངོ་རྐྱང་དང་ རང་དབང་། རྒྱལ་ཁབ་ཆུང་ཀུ་ཅིག་ལུ་ རང་སོའི་སྐད་ཡིག་འདི་ ངོ་རྟགས་གལ་ཅན་ཅིག་ཨིན།
༢. མཐུན་སྒྲིལ། ཁ་སྐད་སོ་སོ་ཡོད་མི་ མི་སེར་ག་ར་ ཐུན་མོང་གི་སྐད་ཡིག་ཐོག་ལས་ མཐུན་སྒྲིལ་འབྱུང་།
༣. ཆོས་དང་ ལམ་སྲོལ་ སྒྲིག་ལམ་རྣམ་གཞག་ དཔེ་ཆོས་ཚུ་ ཉམས་སྲུང་འབད་ནི་ལུ་ རྫོང་ཁ་ཤེས་དགོ།
༤. གཞུང་ལཱ་དང་ ཞི་གཡོག་ཚུ་ནང་ ཡིག་ཆ་དང་ བཀའ་རྒྱ་ཚུ་ རྫོང་ཁ་ཐོག་ལུ་ བྲི་དགོཔ་ཡོདཔ།

གདོང་ལེན། ཨིང་སྐད་ལུ་ བརྟེན་དྲགས་མི། ན་གཞོན་ཚུ་གིས་ རྫོང་ཁ་བྲི་ནི་ཞན་མི། གློག་རིག་ནང་ ཡིག་གཟུགས་དང་ ཚིག་མཛོད་ཉུང་མི།
ཐབས་ལམ། ཁྱིམ་ནང་ རྫོང་ཁ་སླབ་ནི། སློབ་གྲྭ་ནང་ ལྷབ་ཐངས་ཡར་དྲག་གཏང་ནི། བརྙན་འཕྲིན་དང་ ཡོངས་འབྲེལ་ཐོག་ལུ་ རྫོང་ཁའི་བརྗོད་དོན་ཡར་སེང་འབད་ནི། འགོ་ཁྲིད་པ་ཚུ་གིས་ དཔེ་སྟོན་འབད་ནི།

མཇུག་བསྡུ། རྒྱལ་ཡོངས་སྐད་ཡིག་ ཤེས་ནི་དང་ ལག་ལེན་འཐབ་ནི་འདི་ འབྲུག་མི་རེ་རེ་གི་ འགན་ཁུར་ཅིག་ཨིན།', null, '[{"point": "མགོ་བཙུགས། རྫོང་ཁ་ རྒྱལ་ཡོངས་སྐད་ཡིག་ (རྩ་ཁྲིམས་དོན་ཚན་ ༡) དང་ ལམ་སྲོལ་གྱི་རྩ་བ་ཨིནམ།", "marks": 6}, {"point": "ཤེས་དགོ་པའི་རྒྱུ་མཚན་ ༣ ལས་ལྷག་ (ངོ་རྐྱང་དང་ རང་དབང་། མཐུན་སྒྲིལ། ཆོས་དང་ ལམ་སྲོལ་ རིག་གཞུང་ཉམས་སྲུང་། ཞི་གཡོག་དང་ གཞུང་ལཱ།)", "marks": 10}, {"point": "ད་ལྟོའི་གདོང་ལེན་དང་ ཡར་དྲག་གི་ཐབས་ལམ་ (ཁྱིམ་དང་ སློབ་གྲྭ། བརྙན་འཕྲིན། གློག་རིག)", "marks": 8}, {"point": "འབྲི་བཀོད་ཚད་ལྡན། མཇུག་བསྡུ།", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'essay'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2024, batch 2", "source": {"title": "BCSE 2024 Main Examination, General category, Paper I (Dzongkha)", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'E2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'E2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 12.0, 1 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 7.5, 2 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 10.5, 3 from me_q where key = 'E2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'འོག་གི་ཡིག་འགྲུལ་གྱི་དྲི་བ་ ཀ་ དང་ ཁ་ གཉིས་ལས་ ག་འབད་རུང་གཅིག་གི་ལན་བྲིས།

དྲི་བ་ ཀ༽
“དངོས་གྲུབ་འདི་ མཐོ་རིམ་ཤེས་ཚད་མཐར་འཁྱོལ་ཞིནམ་ལས་ ཞི་གཡོག་ཆོས་རྒྱུགས་རྐྱབ་ད་ ཨང་དང་པ་ཐོན་ཏེ་ ཐིམ་ཕུག་རྫོང་ཁག་གི་ འཆར་གཞི་འགོ་དཔོན་འབད་ནི་སྦེ་ གདམ་ཁ་རྐྱབ་ནུག།”
ཁྱོད་ར་ མི་སྟོབས་འགོ་དཔོན་སངས་རྒྱས་ཨིནམ་བཟོ་སྟེ་ གོང་གི་གནས་སྟངས་ལུ་གཞི་བཞག་སྟེ་ གོ་གནས་གསར་བསྐོས་ཀྱི་ ཡིག་ཚང་བཀའ་རྒྱ་ཅིག་བཏོན།
ཡིག་ཚང་བཀའ་རྒྱ་ནང་འོག་གི་གནད་དོན་ཚུ་ཚུད་དགོ།
- བཀའ་རྒྱ་གི་ཡིག་ཨང་དང་ སྤྱི་ཚེས།
- འབྲེལ་བ་ཡོད་པའི་རྒྱབ་ཁུངས།
- བཀའ་རྒྱའི་གནད་དོན།
- རང་ལུགས་གནམ་ལོ་ཟླ་ཚེས།
- འབྲེལ་བ་བཀོད་མི་གོ་གནས་དང་མཚན་རྟགས།
- འབྲེལ་ཡོད་ཚུ་ལུ་ འདྲ་བཤུས།', 'ལན་གྱི་དཔེ།

ཐིམ་ཕུག་རྫོང་ཁག་བདག་སྐྱོང་།
ཡིག་ཨང་། ཐིམ་རྫོང་/མི་སྟོབས་/༢༠༢༤/......         སྤྱི་ཚེས། ......

ཡིག་ཚང་བཀའ་རྒྱ།

རྒྱབ་ཁུངས། རྒྱལ་གཞུང་ཞི་གཡོག་ལྷན་ཚོགས་ཀྱི་ ཞི་གཡོག་ཆོས་རྒྱུགས་ ༢༠༢༤ གི་ གྲུབ་འབྲས་དང་ ལྷན་ཚོགས་ཀྱི་ བསྐོ་བཞག་གི་ བཀའ་རྒྱ་ཡིག་ཨང་ ...... ལུ་ གཞི་བཞག་སྟེ།

བཀའ་རྒྱའི་གནད་དོན། མཐོ་རིམ་ཤེས་ཚད་མཐར་འཁྱོལ་ཏེ་ ཞི་གཡོག་ཆོས་རྒྱུགས་ནང་ ཨང་དང་པ་ཐོན་མི་ དངོས་གྲུབ་ (ངོ་སྤྲོད་ཨང་ ......) འདི་ ཐིམ་ཕུག་རྫོང་ཁག་གི་ འཆར་གཞི་འགོ་དཔོན་སྦེ་ གནས་རིམ་ ...... ནང་ སྤྱི་ཚེས་ ...... ལས་འགོ་བཙུགས་ཏེ་ བསྐོ་བཞག་འབད་ཡོདཔ་ཨིན། ཁོ་གིས་ ཚེས་གྲངས་ ...... ཚུན་ ལཱ་ལུ་འཛུལ་ཞུགས་འབད་དེ་ རྫོང་ཁག་གི་ འཆར་གཞི་དང་ འཆར་དངུལ་ ལྟ་རྟོག་ཚུ་ འགན་འཁྲི་ཡོད།

རང་ལུགས་ ཤིང་འབྲུག་ལོ་ ཟླ་ ...... ཚེས་ ......

(མཚན་རྟགས)
སངས་རྒྱས།
མི་སྟོབས་འགོ་དཔོན། ཐིམ་ཕུག་རྫོང་ཁག།

འདྲ་བཤུས།
༡. རྫོང་བདག་མཆོག་ ཐིམ་ཕུག་རྫོང་ཁག། (བརྡ་དོན་གྱི་དོན་ལུ།)
༢. རྒྱལ་གཞུང་ཞི་གཡོག་ལྷན་ཚོགས། (བརྡ་དོན་གྱི་དོན་ལུ།)
༣. དངུལ་རྩིས་ཡིག་ཚང་། (གླ་ཆ་གི་དོན་ལུ།)
༤. དངོས་གྲུབ་ (ཁོ་རའི་ཤེས་ཚོར་གྱི་དོན་ལུ།)', null, '[{"point": "ཡིག་ཚང་གི་མགོ་ཡིག་ (ཐིམ་ཕུག་རྫོང་ཁག་བདག་སྐྱོང་) དང་ ཡིག་ཨང་། སྤྱི་ཚེས།", "marks": 4}, {"point": "འབྲེལ་བ་ཡོད་པའི་རྒྱབ་ཁུངས་ (ཞི་གཡོག་ཆོས་རྒྱུགས་ཀྱི་གྲུབ་འབྲས་དང་ ལྷན་ཚོགས་ཀྱི་བཀའ་རྒྱ)", "marks": 4}, {"point": "བཀའ་རྒྱའི་གནད་དོན་ - དངོས་གྲུབ་ འཆར་གཞི་འགོ་དཔོན་སྦེ་ བསྐོ་བཞག་ ལཱ་ལུ་འཛུལ་ནིའི་ཚེས་གྲངས་ གནས་རིམ་ གླ་ཆ། འགན་ཁུར།", "marks": 6}, {"point": "རང་ལུགས་གནམ་ལོ་ཟླ་ཚེས། མི་སྟོབས་འགོ་དཔོན་སངས་རྒྱས་ཀྱི་ མཚན་རྟགས། འདྲ་བཤུས་ ཐོ་ཡིག་། ཚད་ལྡན་འབྲི་བཀོད།", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'formal-writing'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2024, batch 2", "source": {"title": "BCSE 2024 Main Examination, General category, Paper I (Dzongkha)", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'L1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'L1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 8.0, 1 from me_q where key = 'L1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 5.0, 2 from me_q where key = 'L1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 7.0, 3 from me_q where key = 'L1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'འོག་གི་ཡིག་འགྲུལ་གྱི་དྲི་བ་ ཀ་ དང་ ཁ་ གཉིས་ལས་ ག་འབད་རུང་གཅིག་གི་ལན་བྲིས།

དྲི་བ་ ཁ༽ ཁྱོད་ར་ སྤུ་ན་ཁ་ ཤེལ་རྔ་ནང་ལས་ ཉི་མ་རྡོ་རྗེ་ཨིནམ་བཟོ་སྟེ་ ཁྱོད་ཀྱི་ཆ་རོགས་ དོན་གྲུབ་ཀྱིས་ དངུལ་སྐྱིན་འགྲུལ་ལེན་པའི་ཤུལ་ལུ་ སྐྱིན་ཚབ་སྤྲོད་མ་བཏུབ་པའི་སྐོར་ལས་ རྫོང་ཁག་ཁྲིམས་འདུན་ལུ་ ཞུ་ཚིག་ཚད་ལྡན་ཅིག་བྲིས།
ཞུ་ཚིག་ནང་འོག་གི་གནད་དོན་ཚུ་ཚུད་དགོ།
- ར་བོ་ཕན་ཚུན་གཉིས་ཀྱི་ངོ་སྤྲོད་ཁ་གསལ།
- སྐྱིན་འགྲུལ་ལེན་དགོ་པའི་ཁུངས།
- ཞག་དུས་ནམ་ཚང་ཡི་ག།
- ཞུ་ཚིག་གི་གནད་དོན་གཞན་ཚུ།
- གནམ་ལོ་ཟླ་ཚེས།', 'ལན་གྱི་དཔེ།

སྐུ་མདུན།
དྲང་དཔོན་མཆོག།
རྫོང་ཁག་ཁྲིམས་འདུན། སྤུ་ན་ཁ།

དོན་ཚན། སྐྱིན་ཚབ་སྤྲོད་མ་བཏུབ་པའི་སྐོར་ལས་ ཞུ་ཚིག།

ཞུ་མི། ཉི་མ་རྡོ་རྗེ། ངོ་སྤྲོད་ཨང་ ......། སྤུ་ན་ཁ་རྫོང་ཁག་ ཤེལ་རྔ་རྒེད་འོག། ཁ་པར་ ......
ལན་འདེབས་པ། དོན་གྲུབ། ངོ་སྤྲོད་ཨང་ ......། སྡོད་གནས་ ......

ཞུ་དོན། ང་གིས་ ཆ་རོགས་ དོན་གྲུབ་ལུ་ སྤྱི་ལོ་ ...... ཟླ་ ...... ཚེས་ ...... ལུ་ དངུལ་ཀྲམ་ ...... སྐྱིན་འགྲུལ་སྦེ་ བྱིན་ཡོདཔ་ཨིན། ཁོ་གིས་ ཟླཝ་ ...... ནང་འཁོད་ལུ་ སླར་སྤྲོད་འབད་ནི་སྦེ་ སྐྱིན་ཡིག་ (འཛོམས་དཔང་ ...... གི་མདུན་ལུ་) མཚན་རྟགས་བཀོད་ཡོད། ཨིན་རུང་ ཞག་དུས་ཚང་ཞིནམ་ལས་ ང་གིས་ ཚར་ལེ་ཤ་ཞུ་ཡོད་རུང་ ད་ཚུན་ཚོད་ སྐྱིན་ཚབ་སྤྲོད་མ་བཏུབ། ཞག་དུས་ནམ་ཚང་གི་ ཡི་གུ་ཡང་ སྤྱི་ཚེས་ ...... ལུ་ བསྐུར་ཡོད།

དེ་འབདཝ་ལས་ དྲང་དཔོན་མཆོག་གིས་ ཁྲིམས་དོན་དང་འཁྲིལ་ཏེ་ སྐྱིན་ཚབ་ཆ་ཚང་ སྐྱིད་བཅས་ སླར་སྤྲོད་འབད་བཅུག་གནང་ཟེར་ ཞུ་བ་ཕུལ་ཨིན།

ཟུར་སྦྲགས། ༡. སྐྱིན་ཡིག་འདྲ་བཤུས། ༢. ཞག་དུས་ནམ་ཚང་གི་ཡི་གུ་འདྲ་བཤུས། ༣. ངོ་སྤྲོད་ལག་ཁྱེར་འདྲ་བཤུས།

རང་ལུགས་ ཤིང་འབྲུག་ལོ་ ཟླ་ ...... ཚེས་ ......
ཞུ་མི། (མཚན་རྟགས) ཉི་མ་རྡོ་རྗེ།', null, '[{"point": "ཁ་བྱང་ - རྫོང་ཁག་ཁྲིམས་འདུན་ སྤུ་ན་ཁ། ཞུ་ཚིག་གི་མགོ་མིང་།", "marks": 3}, {"point": "ཞུ་མི་ (ཉི་མ་རྡོ་རྗེ) དང་ ལན་འདེབས་པ་ (དོན་གྲུབ) གཉིས་ཀྱི་ངོ་སྤྲོད་ཁ་གསལ་ (མིང་། ངོ་སྤྲོད་ཨང་། སྡོད་གནས།)", "marks": 4}, {"point": "སྐྱིན་འགྲུལ་ལེན་དགོ་པའི་ཁུངས་ (དངུལ་གྱི་ཚད། ཚེས་གྲངས། སྐྱིན་ཡིག/འཛོམས་དཔང)། ཞག་དུས་ནམ་ཚང་ཡི་གུ་ དང་ སླར་སྤྲོད་མ་འབད་མི།", "marks": 6}, {"point": "ཞུ་ཚིག་གི་དགོས་འདུན་ (དངུལ་སླར་སྤྲོད་འབད་བཅུག་ནི་) དང་ ཡིག་ཆ་ཟུར་སྦྲགས། གནམ་ལོ་ཟླ་ཚེས། མཚན་རྟགས། ཚད་ལྡན་འབྲི་བཀོད།", "marks": 7}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'formal-writing'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2024, batch 2", "source": {"title": "BCSE 2024 Main Examination, General category, Paper I (Dzongkha)", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'L2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'L2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 8.0, 1 from me_q where key = 'L2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 5.0, 2 from me_q where key = 'L2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 7.0, 3 from me_q where key = 'L2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'descriptive', 'འོག་གི་གནས་ཚུལ་དེ་ནང་ལས་ ཤེས་དགོ་པའི་ གནད་དོན་ཁག་ཆེ་དྲགས་ཚུ་མ་གཏོགས་ གཞན་དོན་དག་མེད་པའི་ཚིག་དོན་ཚུ་བཏོགས་ཏེ་ གནས་ཚུལ་འདི་ ཚིག་འབྲུ་༢༠༠-༣༠༠ དེ་ཅིག་ནང་ བཅུད་བསྡུས་ཏེ་ བྲིས།
༉ རྒྱལ་ཁབ་ནང་ ཌི་ཇི་ཊཱལ་ (Digital) དཔལ་འབོར་གྱིས་ སྤྱི་ལོ་༢༠༢༩ འི་ནང་འཁོད་ལུ་ལཱ་གཡོག་༥༠༠༠ དང་སྤྱི་ལོ་༢༠༣༤ གི་ནང་འཁོད་ལུ་ ཌི་ཇི་ཊཱལ་དཔལ་འབོར་གྱིས་ནང་འཁོད་ཐོན་སྐྱེད་ཡོངས་འབོར་ལུ་ ཡུ་ཨེསི་ཌོ་ལར་ས་ཡ་༦༠༠ ལྷན་ཐབས་འབད་ནི་ཨིན་པས། དམིགས་གཏད་དེ་ཡང་ སྤྱི་ཟླ་༧ པའི་ཚེས་༡༢ ལུ་ འགོ་འབྱེད་འབད་མི་ རྒྱལ་ཡོངས་ཌི་ཇི་ཊཱལ་ཐབས་བྱུས་ནང་ གསལ་བཀོད་འབད་ཡོདཔ་ཨིན་པས།
རྒྱལ་ཡོངས་ཌི་ཇི་ཊཱལ་ཐབས་བྱུས་ཀྱི་འཆར་སྣང་ འབྲུག་གཅིག་སྒྲིལ་དེ་ནང་ ཌི་ཇི་ཊཱལ་དཔལ་འབོར་དང་ ཌི་ཇི་ཊཱལ་མི་སྡེ་ དེ་ལས་ ཌི་ཇི་ཊཱལ་གཞུང་སྐྱོང་༣ ལུ་ གཙོ་རིམ་བཟུང་ནི་ཨིན་པས། བློན་ཆེན་ཚེ་རིང་སྟོབས་རྒྱས་ཀྱིས་ ཁོ་རའི་ མི་སྡེ་བར་བརྒྱུད་ནང་བཀོད་མིའི་ནང་ རྒྱལ་ཡོངས་ཌི་ཇི་ཊཱལ་ཐབས་བྱུས་དེ་ ཌི་ཇི་ཊཱལ་གཞི་སྒྱུར་ཀྱི་དོན་ལུ་ ཐབས་ལམ་ཆ་ཚང་ཅིག་སྦེ་ལག་ལེན་འཐབ་ནི་ཨིནམ་བཞིན་དུ་ དཔལ་འབོར་གོང་འཕེལ་དང་མི་མང་ཞབས་ཏོག་སྐྱེལ་སྤྲོད་ཚུ་ཡང་ ལྷན་ཐབས་འབད་ཚུགས་ཟེར་ཨིན་པས།
འཆར་གཞི་༡༣ པའི་ནང་ འཆར་དངུལ་དངུལ་ཀྲམ་ཐེར་འབུམ་༡༠ བགོ་བཀྲམ་འབད་མི་ལས་ དངུལ་ཀྲམ་ས་ཡ་༡,༦༩༨ དེ་ཌི་ཇི་ཊཱལ་དཔལ་འབོར་དང་ དངུལ་ཀྲམ་ས་ཡ་༥,༡༤༨.༡༩ དེ་ ཌི་ཇི་ཊཱལ་གཞུང་སྐྱོང་ དེ་ལས་ ཌི་ཇི་ཊཱལ་མི་སྡེའི་དོན་ལུ་དངུལ་ཀྲམ་ས་ཡ་༦༡༠.༦༥ བགོ་བཀྲམ་འབད་ནུག། དེ་བཟུམ་སྦེ་ ཌི་ཇི་ཊཱལ་མཐུན་རྐྱེན་དང་གློག་ཐོག་ཉེན་སྲུང་སྒྲིང་སྒྲི་བཟོ་ནི་དེ་ལས་ ཞིབ་འཚོལ་གོང་འཕེལ་ལ་སོགས་པའི་དོན་ལུ་ དངུལ་ཀྲམ་ས་ཡ་༢,༥༤༢.༡༩ བགོ་བཀྲམ་འབད་ནུག།
ཌི་ཇི་ཊཱལ་དཔལ་འབོར་གྱི་དམིགས་ཡུལ་དེ་ཡང་ སྤྱི་ལོ་༢༠༢༩ ནང་འཁོད་ལུ་ ནང་འཁོད་ཐོན་སྐྱེད་ཡོངས་འབོར་ལུ་ དངུལ་ཀྲམ་ས་ཡ་༣༠༠ དང་ སྤྱི་ལོ་༢༠༣༤ ནང་འཁོད་ལུ་ ཌི་ཇི་ཊཱལ་དཔལ་འབོར་གྱིས་ནང་འཁོད་ཐོན་སྐྱེད་ཡོངས་འབོར་ལུ་ ཡུ་ཨེསི་ཌོ་ལར་ས་ཡ་༦༠༠ ལྷན་ཐབས་འབད་ནི་དེ་ཨིན་པས། ཐབས་བྱུས་དང་འཁྲིལ་བ་ཅིན་ དམིགས་གཏད་ཚུ་ཡང་ བཟོ་གྲྭ་ཌི་ཇི་ཊཱལ་དང་ཌི་ཇི་ཊཱལ་གནས་སྟངས་ལམ་ལུགས་ཡར་དྲག་ དེ་ལས་ བར་དོན་འཕྲུལ་རིག་བཟོ་གྲྭ་ཁང་ཚུ་ གོང་འཕེལ་གཏང་ནི་གི་ལས་རིམ་༣ ཐོག་ལས་འགྲུབ་ཚུགས་ནི་ཨིན་པས།
ཌི་ཇི་ཊཱལ་གྱི་དོན་ལུ་ འོས་འབབ་ཅན་གྱི་ལས་སྡེ་༨ ངོས་འཛིན་འབད་དེ་ཡོདཔ་བཞིན་དུ་ ཤིང་ཆ་དང་འབྲེལ་བའི་བཟོ་གྲྭ་ཁང་ཚུ་གི་དོན་ལས་ རང་བཞིན་ཚོང་བསྒྲགས་བསྡུ་གསོག་དང་ལཱ་འབད་ཞིནམ་ལས་ མཇུག་བསྡུ་ཚུགསཔ་འབད་ནི་གི་ ཆོག་ཐམ་ལྷན་ཐབས་ལ་སོགས་པ་ཚུ་ལུ་ གཙོ་རིམ་བཟུང་ནི་ཨིན་པས། ལས་རིམ་གཙོ་ཅན་གཞན་ཚུ་ཡང་ཚོང་འབྲེལ་སོ་ནམ་གྱི་དོན་ལུ་ཡུན་བརྟན་སོ་ནམ་དང་སྒོ་ནོར་ཚུ་ཨིནམ་ད་ ཌི་ཇི་ཊཱལ་འཕྲུལ་རིག་ལག་ལེན་ སྒྲིག་བཅོས་ཉམས་མོང་དང་ ཡོངས་འབྲེལ་ལྟ་སྐོར་ ཡུན་བརྟན་ ཨིསི་མརཊ་དང་ གསོ་བ་དང་ སོ་ནམ་ དེ་ལས་ གནམ་གཤིས་ཀྱི་དོན་ལུ་ གདོང་ལེན་སྐྱེལ་འདྲེན་ལམ་ལུགས་དང་གནས་སྡུད་ལམ་ལུགས་ཚུ་ཡོདཔ་ཨིན་པས།
ཌི་ཇི་ཊཱལ་ཡར་དྲག་ལམ་ལུགས་ནང་ གནས་སྟངས་བཟོ་སྟེ་ ཌི་ཇི་ཊཱལ་ཚོང་འབྲེལ་དང་གོང་འཕེལ་གསར་གཏོད་ དེ་ལས་ཚོང་འབྲེལ་གཞི་བཙུགས་ཚུ་རྒྱབ་སྐྱོར་འབད་དེ་ ཌི་ཇི་ཊཱལ་དཔལ་འབོར་བཟོ་ནི་ཨིན་པས། དེ་ནང་ ཡོངས་འབྲེལ་ཚོང་འབྲེལ་གོང་འཕེལ་དང་ ཌི་ཇི་ཊཱལ་དངུལ་སྤྲོད་ཐབས་ལམ་ དེ་ལས་ འཛམ་གླིང་ཚོང་ལམ་ལྷོད་ཐབས་ཀྱི་ཌི་ཇི་ཊཱལ་གོ་སྐབས་ཚུ་ཚུད་དེ་ཡོདཔ་བཞིན་དུ་ དེ་ཡང་ ཌི་ཇི་ཊཱལ་དཔལ་འབོར་མཐར་འཁྱོལ་ཅན་འབྱུང་ནིའི་དོན་ལུ་ མེད་ཐབས་མེདཔ་ཅིག་ཨིན་པས།
ཐབས་བྱུས་ཀྱིས་ འཕྲུལ་རིག་གཞི་བཙུགས་ཀྱི་དོན་ལས་ གནས་སྟངས་སྒྲིང་སྒྲི་དང་ དངུལ་འབྲེལ་ཐབས་ལམ་དང་འཕྲུལ་རིག་ལཱ་གཡོག་བཟོ་སྟེ་ བར་དོན་འཕྲུལ་རིག་ཡར་དྲག་གཏང་ནི་དང་ རྒྱལ་ཁབ་ཀྱི་ས་ཆ་ཨེ་ཀར་༡༠༠ ནང་ བར་དོན་འཕྲུལ་རིག་གླིང་ག་གཞི་བཙུགས་འབད་ནི་ཨིན་པས།
གཙོ་རིམ་ཅན་གྱི་ལས་རིམ་ཚུ་ཡང་ འཛམ་གླིང་ཚོང་ལམ་ནང་ བར་དོན་འཕྲུལ་རིག་ཚོང་འབྲེལ་གྱི་དོན་ལས་ བར་དོན་ཚོང་འབྲེལ་དང་ཤེས་རིག་བཟོ་གྲྭ་ཁང་དང་གཅིག་སྒྲིལ་ཡར་དྲག་ དེ་ལས་ གནས་སྡུད་ཞབས་ཏོག་ལྟེ་བའི་ནང་ ཚོང་འབྲེལ་གཞི་བཙུགས་གོང་འཕེལ་གཏང་ནི་ཚུ་ཡོདཔ་ཨིན་པས།
རྒྱལ་ཡོངས་ཌི་ཇི་ཊཱལ་ཐབས་བྱུས་ལག་ལེན་དེ་ འབྲུག་གཞུང་འཕྲུལ་རིག་ལས་སྡེ་གིས་འགོ་ཁྲིདཔ་འབད་ནི་ཨིནམ་ད་ དེ་ནང་ལས་སྣ་མང་སྦེ་འབྲེལ་གཏོགས་འབད་ནི་ཨིནམ་ད་ ཐབས་བྱུས་རེ་ལུ་ལག་ལེན་འཐབ་མི་ ཚོང་རོགས་མ་འདྲཝ་འོང་ནི་ཨིནམ་ད་རྒྱབ་སྐྱོར་འབད་མི་མཉམ་འབྲེལ་བ་ཚུ་ཡང་ངོས་འཛིན་འབད་དེ་ཡོད་པའི་གནས་ཚུལ།
རྒྱབ་རྟེན། ཀུན་གསལ། ཨོ་རྒྱན་རྡོ་རྗེ།', 'ལན་གྱི་དཔེ།

སྤྱི་ཟླ་ ༧ པའི་ཚེས་ ༡༢ ལུ་ འགོ་འབྱེད་འབད་མི་ རྒྱལ་ཡོངས་ཌི་ཇི་ཊཱལ་ཐབས་བྱུས་ནང་ ཌི་ཇི་ཊཱལ་དཔལ་འབོར་གྱིས་ སྤྱི་ལོ་ ༢༠༢༩ ཚུན་ ལཱ་གཡོག་ ༥༠༠༠ བཟོ་ནི་དང་ ༢༠༣༤ ཚུན་ ནང་འཁོད་ཐོན་སྐྱེད་ཡོངས་འབོར་ལུ་ ཡུ་ཨེསི་ཌོ་ལར་ ས་ཡ་ ༦༠༠ ལྷན་ཐབས་འབད་ནིའི་ དམིགས་གཏད་བཟུང་ཡོད། ཐབས་བྱུས་འདི་གིས་ ཌི་ཇི་ཊཱལ་དཔལ་འབོར་ ཌི་ཇི་ཊཱལ་མི་སྡེ་ དེ་ལས་ ཌི་ཇི་ཊཱལ་གཞུང་སྐྱོང་ ༣ ལུ་ གཙོ་རིམ་བཟུངམ་ཨིན། བློན་ཆེན་གྱིས་ འདི་གིས་ དཔལ་འབོར་གོང་འཕེལ་དང་ མི་མང་ཞབས་ཏོག་ ཡར་དྲག་གཏང་ཚུགས་ཟེར་ གསུངས་ནུག།
འཆར་གཞི་ ༡༣ པའི་ ཌི་ཇི་ཊཱལ་འཆར་དངུལ་ནང་ལས་ ཌི་ཇི་ཊཱལ་གཞུང་སྐྱོང་ལུ་ དངུལ་ཀྲམ་ས་ཡ་ ༥,༡༤༨.༡༩ ཌི་ཇི་ཊཱལ་དཔལ་འབོར་ལུ་ ས་ཡ་ ༡,༦༩༨ ཌི་ཇི་ཊཱལ་མི་སྡེ་ལུ་ ས་ཡ་ ༦༡༠.༦༥ དང་ མཐུན་རྐྱེན་ གློག་ཐོག་ཉེན་སྲུང་ ཞིབ་འཚོལ་ཚུ་ལུ་ ས་ཡ་ ༢,༥༤༢.༡༩ བགོ་བཀྲམ་འབད་ཡོད།
དམིགས་གཏད་ཚུ་ བཟོ་གྲྭ་ཌི་ཇི་ཊཱལ་ ཌི་ཇི་ཊཱལ་ལམ་ལུགས་ཡར་དྲག་ བར་དོན་འཕྲུལ་རིག་བཟོ་གྲྭ་གོང་འཕེལ་གྱི་ ལས་རིམ་ ༣ ཐོག་ལས་ འགྲུབ་ནི་དང་ འོས་འབབ་ཅན་གྱི་ ལས་སྡེ་ ༨ ངོས་འཛིན་འབད་ཡོད། ཡོངས་འབྲེལ་ཚོང་འབྲེལ་ ཌི་ཇི་ཊཱལ་དངུལ་སྤྲོད་ ཚོང་འབྲེལ་གསར་གཏོད་ཚུ་ལུ་ རྒྱབ་སྐྱོར་འབད་ནི་དང་ ས་ཆ་ཨེ་ཀར་ ༡༠༠ ནང་ བར་དོན་འཕྲུལ་རིག་གླིང་ག་ཅིག་ གཞི་བཙུགས་འབད་ནི་ཨིན། ཐབས་བྱུས་འདི་ འབྲུག་གཞུང་འཕྲུལ་རིག་ལས་སྡེ་གིས་ འགོ་ཁྲིད་ཐོག་ལས་ ལས་སྡེ་སྣ་མང་དང་ མཉམ་འབྲེལ་འབད་དེ་ ལག་ལེན་འཐབ་ནི་ཨིན།', null, '[{"point": "རྒྱལ་ཡོངས་ཌི་ཇི་ཊཱལ་ཐབས་བྱུས་ (སྤྱི་ཟླ་ ༧ ཚེས་ ༡༢): ༢༠༢༩ ཚུན་ ལཱ་གཡོག་ ༥༠༠༠ དང་ ༢༠༣༤ ཚུན་ ཡུ་ཨེསི་ཌོ་ལར་ ས་ཡ་ ༦༠༠ གི་དམིགས་གཏད།", "marks": 3}, {"point": "གཙོ་རིམ་ ༣ - ཌི་ཇི་ཊཱལ་དཔལ་འབོར། ཌི་ཇི་ཊཱལ་མི་སྡེ། ཌི་ཇི་ཊཱལ་གཞུང་སྐྱོང་། འཆར་གཞི་ ༡༣ པའི་ འཆར་དངུལ་བགོ་བཀྲམ་ (གཙོ་བོ་ཚུ)", "marks": 3}, {"point": "ལས་རིམ་དང་ ལས་སྡེ་ ༨། བར་དོན་འཕྲུལ་རིག་གླིང་ག་ (ཨེ་ཀར་ ༡༠༠)། འཕྲུལ་རིག་ལས་སྡེ་གིས་ འགོ་ཁྲིད།", "marks": 2}, {"point": "ཚིག་འབྲུ་ ༢༠༠-༣༠༠ ནང་འཁོད་ བཅུད་བསྡུས་ཏེ་ རང་གི་ཚིག་ཐོག་ལུ་ བྲིས་ཡོདཔ། ཁ་གསལ་མེད་པའི་ཁ་གསལ་མ་བཙུགསཔ།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'pr-cis'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2024, batch 2", "source": {"title": "BCSE 2024 Main Examination, General category, Paper I (Dzongkha)", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'P1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'P1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 4.0, 1 from me_q where key = 'P1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 2.5, 2 from me_q where key = 'P1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 3.5, 3 from me_q where key = 'P1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'འོག་ལུ་བཀོད་ཡོད་མི་ དྲི་བ་ ཀ་ དང་ ཁ་ གཉིས་ཆ་རའི་ལན་བྲིས།
དྲི་བ་ ཀ༽ སྐད་ཡིག་གི་དྲི་བ། འོག་ལུ་བཀོད་དེ་ཡོད་མི་ དྲི་བ་ག་རའི་ལན་བྲིས། སྐུགས་ [༡×༥=༥ ]
༡༽ འོག་གི་རྗོད་ཚིག་གི་ས་སྟོང་ནང་ ཕྲད་ཚུ་ ག་ཅི་ཕོགཔ་ཨིན་ན? ཟུར་ཁའི་གུག་ཤད་ནང་ལས་ བཏོན་ཏེ་བཙུགས།
ཉི་མ་......༡.....སླབ་པའི་ཁར་ལུ་ རྡོ་རྗེ་.....༢......ཉན་མ་བཏུབ་པས། (གྱི་གྱིས། གི་གིས། ཀྱི་ཀྱིས། འི་འིས། ཡི་ ཡིས།)
༢༽ རྫོང་ཁ་སླབ་ཐངས་དང་འཁྲིལཝ་ད་ འོག་གི་རྗོད་ཚིག་ནང་ འཛོལ་བ་ག་ཅི་འདུག? ངོས་འཛིན་འབད་ཞིནམ་ལས་བཅོ་ཁ་རྐྱབ་སྟེ་ བྲིས།
ད་རིས་ ནང་ལུ་འཛོམས་མི་ ཆ་རོགས་ཡོངས་ག་ར་ལུ་ ང་གི་ཧོང་ལས་ བཀའ་དྲིན་དགའ་ཚོར་ཡོད།
༣༽ བླམ་རིན་པོ་ཆེ་ གདོང་འཁྱུ་བའི་བསྒང་ཨིན་མས། ཟེར་བའི་རྗོད་ཚིག་འདི་ ཞེ་ས་ནང་ བྲིས།
༤༽ ཁབ་རྩེ་གཉིས་ཀྱིས་གོ་མི་བརྩེམ། །བློ་རྩེ་གཉིས་ཀྱིས་དོན་མི་གྲུབ། །ཟེར་མི་འདི་ གནས་སྟངས་ག་ཅི་བཟུམ་ཅིག་ནང་ བློ་ནང་ག་དེ་སྦེ་ བཙུགས་ཏེ་ སླབ་ནི་སོ? དཔེ་གཅིག་བཀོད།
༥༽ འོག་གི་དཔེ་ཅན་ལུ་ འོས་འབབ་ཡོད་པའི་དཔེ་གཅིག་བཀོད་དེ་ འཕྲོད་མཐུད་ཚིག་རྐང་གཅིག་བྲིས།
ཡིད་འོང་ཁྱོད་ཀྱི་ཞལ་རས། །.....................................................། །
དྲི་བ་ ཁ༽ འོག་གི་དོན་མཚམས་ཀྱི་ གུག་ཤད་ནང་གི་མིང་ཚིག་ཚུ་ ག་ཅི་ཕོགཔ་ཨིན་ན? དབྱེ་བ་དཔྱད་ཞིནམ་ལས་ འོས་འབབ་ཡོད་མི་འདི་ ལན་ཤོག་ནང་བྲིས། སྐུགས་ [༡×༥=༥]
མ་རིག་མུན་པ་ ༡(བསལ/གསལ) མི་ སློབ་དཔོན་གྱིས་ ང་ལུ་ ཨ་ནི་ ཅ་ལ་འདི་ ལྕོགས་སྒྲོམ་གུར་ ༢(བཀལ/བསྐྱལ་) བཞག་ཞིནམ་ལས་ ཇ་ཅིག་ ༣(བཀོལ/བསྐོལ་) འབག་ཤོག་ཟེར་གསུངས་དེས། དེ་ལས་ ང་གིས་ སློབ་དཔོན་གྱི་༤(བཀའ/དཀའ་) བཞིན་ཕྱག་ཞུ་བ་ཅིན་ དགེ་བ་ལོགས་སུ་འབད་ ༥(བསྒྲུབ/འགྲུབ་) དགོཔ་མིན་འདུག ཟེར་མནོ་སྟེ་ ཕྱག་ཕྱིད་ཞུ་ཡི།', 'a)
༡༽ ཉི་མ་ གིས་ སླབ་པའི་ཁར་ལུ་ རྡོ་རྗེ་ གིས་ ཉན་མ་བཏུབ་པས།
༢༽ འཛོལ་བ། "ཡོངས་" དང་ "ག་ར་" གཉིས་ ཟླ་ཐབས་སྦེ་ཡོདཔ། "ཧོང་" ➝ "ཧོངས་"། "བཀའ་དྲིན་དགའ་ཚོར་" ➝ "བཀྲིན་དགའ་ཚོར་"།
བཅོས་མི། ད་རིས་ ནང་ལུ་འཛོམས་མི་ ཆ་རོགས་ག་ར་ལུ་ ང་གི་ཧོངས་ལས་ བཀྲིན་དགའ་ཚོར་ཡོད།
༣༽ བླམ་རིན་པོ་ཆེ་ ཞལ་བཀྲུ་བའི་བསྒང་ཨིན་མས།
༤༽ མི་ཅིག་གིས་ ལཱ་གཉིས་ཆ་ར་ཅིག་ཚར་ལུ་ འབད་དགོ་མནོ་སྟེ་ བློ་གཉིས་ཟ་བའི་སྐབས་ ལཱ་ག་ནི་ཡང་ མཐར་མི་འཁྱོལཝ་ཨིན་ཟེར་ ཉེས་བཤད་འབད་བའི་སྐབས་ སླབ་ཨིན། དཔེར་ན། ཁྱོད་ཀྱིས་ ཆོས་རྒྱུགས་ལུ་ཡང་ ལྷབ་ནི་དང་ ཚོང་ལཱ་ཡང་ འབད་ནི་ཟེར་ བློ་གཉིས་ཟ་བ་ཅིན་ "ཁབ་རྩེ་གཉིས་ཀྱིས་གོ་མི་བརྩེམ། །བློ་རྩེ་གཉིས་ཀྱིས་དོན་མི་གྲུབ།" ཟེར་ཨིན།
༥༽ ཡིད་འོང་ཁྱོད་ཀྱི་ཞལ་རས། །ཉ་གང་ཟླ་བ་བཟུམ་སྦེ་མཛེས། །

b)
༡ བསལ། ༢ བཀལ། ༣ བསྐོལ། ༤ བཀའ། ༥ བསྒྲུབ།', null, '[{"point": "a) ༡ ཉི་མ་གིས་ / རྡོ་རྗེ་གིས། ༢ འཛོལ་བ་བཅོས་ (ཡོངས་ག་ར་ ཟླ་ཐབས་ ➝ ག་ར་། ཧོང་ ➝ ཧོངས་། བཀའ་དྲིན་དགའ་ཚོར་ ➝ བཀྲིན་དགའ་ཚོར)། ༣ བླམ་རིན་པོ་ཆེ་ ཞལ་བཀྲུ་བའི་བསྒང་ཨིན་མས། ༤ བློ་གཉིས་ཟ་སྟེ་ ལཱ་གཅིག་ལུ་ སེམས་མ་གཏད་པའི་སྐབས་ དཔེ་དང་བཅས། ༥ དཔེ་ཅན་ཚིག་རྐང་ (དཔེར་ན་ ཉ་ཟླ་བཟུམ་མཛེས།)", "marks": 5}, {"point": "b) ༡ བསལ། ༢ བཀལ། ༣ བསྐོལ། ༤ བཀའ། ༥ བསྒྲུབ།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'language-and-spelling'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing.", "Grammar answers need a Dzongkha teacher''s confirmation."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2024, batch 2", "source": {"title": "BCSE 2024 Main Examination, General category, Paper I (Dzongkha)", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'G1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'G1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 4.0, 1 from me_q where key = 'G1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 2.5, 2 from me_q where key = 'G1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 3.5, 3 from me_q where key = 'G1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བ་ག་ར་གི་ལན་ བྲིས།
༉ བཀབ་ནེ་འདི་ སངས་རྒྱས་བཅོམ་ལྡན་འདས་ཀྱིས་འཁོར་རྣམ་པ་བཞི་ལུ་འདུལ་ཁྲིམས་བཅའཝ་ད་ དགེ་སློང་ཚུ་ལུ་གཙོ་བོ་གུས་ཞབས་ཀྱི་དོན་ལུ་གནངམ་མ་ཚད་ དུས་རབས་༨ པའི་ནང་ གུ་རུ་རིན་པོ་ཆེ་འབྲུག་ལུ་བྱོན་ཏེ་ སྲོག་གཅོད་སྤང་ནི་ལ་སོགས་པའི་དགེ་བསྙེན་གྱི་སྦོམ་པ་གནང་བའི་སྐབས་ མི་སེར་སྤྱིར་བཏང་ལུ་ བཀབ་ནེའི་ཚོས་གཞི་དཀརཔོ་སྦེ་གནང་སྟེ་ཆོས་ཀྱི་མཛོད་སྒོ་དང་འབྲེལ་བའི་སྐབས་ གུས་ཞབས་ཀྱི་དོན་ལུ་བཀབ་སྲོལ་བཙུགས་གནང་གནངམ་ཨིན་པས།
དེའི་ཤུལ་ལས་ དུས་རབས་༡༧ པའི་ནང་ ཞབས་དྲུང་གིས་ཆོས་སྲིད་ལུགས་གཉིས་ཀྱི་གཞུང་དབུ་བཙུགས་སྐབས་ དགེ་འདུན་གྱི་སྡེ་ལུ་ཐུགས་བརྩེ་ཆེཝ་ལས་ ལུགས་གཉིས་ཁ་ལོ་བསྒྱུར་བའི་དཔོན་ཁག་ཡང་ དགེ་སློང་གི་གྲས་ལས་བསྐོས་ཏེ་ ལྷན་རྒྱས་གཉིས་སྐལམ་ལ་སོགས་པའི་ན་བཟའི་དབྱེ་བ་སོ་སོར་བཟོ་གནངམ་མ་ཚད་ ད་ལྟོའི་རྒཔོ་ཚུ་གི་བཀབ་ནེ་དེ་ཡང་ དེ་བསྒང་ལས་རང་ རྟོགས་ལྡན་སྒརཔ་ཟེར་བའི་དོན་ལུ་གོས་དཀར་སྔགས་ཆས་སྦེ་མཛད་གནང་ནུག།
དུས་རབས་༢༠ པའི་ནང་ རྒྱལ་བརྒྱུད་ཀྱི་གཞུང་དབུ་བརྙེས་ཞིནམ་ལས་ བློན་པོ་ལྷན་རྒྱས་གོང་འོག་དང་གཉིས་སྐལམ་ཆིབས་བཞོནམ་དང་རབ་འབྱམས་ལ་སོགས་པའི་གོ་གནས་ཀྱི་རྟགས་ཚན་གྱི་དོན་ལུ་བཀབ་ནེའི་དབྱེ་བ་སོ་སོར་མཛད་གནང་ནུག།
དུས་རབས་༢༡ པའི་ནང་ རྒྱལ་ཁབ་གོང་འཕེལ་གྱི་འགྱུར་བ་ལས་བརྟེན་ རྫོང་བདག་ དྲང་དཔོན་ ཆེ་བསོད་ཅན་གྱི་འཐུས་མི་ཚུ་གི་བཀབ་ནེའི་དབྱེ་བ་སོ་སོར་མཛད་གནང་སྟེ་ཡོད།
བཀབ་ནེ་འདི་གཙོ་བོ་གུས་ཞབས་ཀྱི་དོན་ལུ་ཨིནམ་ལས་ རྫོང་གཞིས་ དགོན་སྡེ་ གཙུག་ལག་ཁང་དང་ལྷ་ཁང་མགོན་ཁང་ཚུ་ནང་འགྱོཝ་ད་དང་ ཆོས་ཞུ་སར་བླམ་སློབ་དཔོན་ཚུ་དང་གོ་གནས་ཅན་ཚུ་གི་སྐུ་མདུན་ལུ་བཅརཝ་ད་བཀབ་དགོཔ་ཨིན།
གཟུགས་ཁར་གོ་ལ་གྱོན་ཏེ་ཡོད་རུང་ རང་ལས་མཐོ་བའི་གོང་མ་བ་སློབ་དང་ ཆོས་སྲིད་ཀྱི་མཛད་སྒོ་ཚུ་ནང་གོ་གི་ལྟག་ལུ་བཀབ་ནེ་བཀབ་མི་འདི་ ལྷག་པར་དུ་ གུས་ཞབས་ཞུ་བའི་དོན་ཨིནམ་མ་ཚད་ གོང་མ་དང་འོག་མའི་བར་ན་ཐ་དམ་ཚིག་གི་ཐོག་ལས་གུས་བཀུར་སྟོན་པའི་བར་མཚོན་དང་ ཁྲེལ་ངོ་ཚ་བག་ཡོདཔ་དང་ལྡན་པའི་མི་ཡ་རབས་ཀྱི་གྱལ་ཁར་ཚུད་དེ་ རང་བསོད་ནམས་གསག་ནིའི་དོན་ལུ་ཨིན།
དཔོན་སློབ་ཀྱི་ན་བཟའ་གཞི་སེརཔོ་ངོ་མ་ལས་ ལི་ཝང་ཁ་ཙམ་དང་ལི་ཝང་ངོ་མ་ལས་སེར་ཁ་འཚམས་ཅིག་སྦེ་ ལུང་སེརམ་ཨིན།
རྒྱ་ཚད་མཐོ་དྲུག་དང་ལག་གང་ དཀྱུས་མཐོ་ཉེར་གཅིག་དགོཔ་ཨིན། རྒྱལ་སྲས་སྐུ་འཁོར་གྱི་ན་བཟའི་ཁ་དོག་ལི་ཝང་ཁ་གནག་སུ་ཅིག་སྦེ་ཚོས་དམར་བཞེསཔ་ཨིན། རྒྱ་ཚད་མཐོ་ལྔ་དང་ལག་གང་། དཀྱུས་མཐོ་ཉི་ཤུ་ར་གཅིག་ཨིན།
ཨ་ཞེ་ཚུ་གི་ན་བཟའ་མདོག་དམརཔོ། རྒྱུ་དར་དང་གོས་ཆེན་ གྲུ་ཙེ་ ཚེམ་དྲུབ་ཅནམ། རྒྱ་མཐོ་ཕྱེད་དང་གཉིས། དཀྱུས་རལཔ་དང་སྦྲགས་ཏེ་མཐོ་བཅུ་བཞི་ཡོད།
བློན་པོ་ཚུ་གི་ན་བཟའ་མདོག་ལི་ཝང་། རྒྱ་ཚད་མཐོ་དྲུག་དང་ལག་གང་ དཀྱུས་མཐོ་ཉེར་གཅིག་ཡོད། མདུན་བཀལ་སྤྱ་མཐོ་གང་གི་ཚད་ཁར་ལྟབ་ལྔ་མཚམས་སྙོམས་ཏོག་ཏོ་ ཆོས་ཀྱི་གླེག་བམ་གྱི་སོ་ཅོག་འཐདཔ་སྦེ་བལྟབས་ཞིན་ན་ ཕྱག་ལྟག་གཡོན་པར་བཀལ་ཏེ་བཞེས་དགོ། གཞོགས་གཡས་ཐད་ལས་ན་བཟའི་སོ་དང་དཔའ་རྟགས་གཉིས་འདྲན་འདྲ་སྦེ་བཞག་དགོ།
བློན་པོའི་རགས་ཅུང་མདོག་ལི་ཝང་ ལྟབ་ཚད་སྤྱ་མཐོ་གང་ དཀྱུས་མཐོ་བཅུ་བཞི། བཀབ་ཐངས་ཨམ་སྲུ་སྤྱིར་བཏང་དང་འདྲ།
གཉིས་སྐལ་མའི་བཀབ་ནེ་མདོག་དམར་རྐྱང་། (བཙོད་ཁམ་) རྒྱ་ཚད་མཐོ་ལྔ་དང་ལག་གང་ དཀྱུས་མཐོ་ཉི་ཤུ་ར་གཅིག།
གཞོགས་གཡས་ཧོངས་གོ་གི་སོ་ལས་ ལག་གང་གི་འོག་ལས་ དཔའ་རྟགས་རོ་ལེབ་ཀྱི་རྩེ་ཕྱི་ཁར་ཐོནམ་སྦེ་བཀབ་དགོཔ་ཨིན་ནོ།།

འོག་ལུ་བཀོད་ཡོད་མི་ དྲི་བ་ག་ར་གི་ ལན་བྲིས། སྐུགས་ [༥×༣=༡༥]
༡༽ ཡིག་རྒྱུགས་ནང་ བཀོད་ཡོད་པའི་ བཀབ་ནེ་གི་འཐོབ་ལམ་ཚུ་ ཐིག་ཁྲམ་ནང་བཀོད་དེ་ ཁྱད་པར་ཧ་གོ་ཚུགསཔ་སྦེ་བཟོ།', 'དཔོན་སློབ། སེར་ལི་ཝང་ (ལུང་སེརམ)། རྒྱ་མཐོ་ ༦ དང་ལག་གང་། དཀྱུས་མཐོ་ ༢༡།
རྒྱལ་སྲས་སྐུ་འཁོར། ལི་ཝང་ཁ་གནག་སུ་ ཚོས་དམར། རྒྱ་མཐོ་ ༥ དང་ལག་གང་། དཀྱུས་མཐོ་ ༢༡།
ཨ་ཞེ། དམརཔོ (དར་དང་གོས་ཆེན། གྲུ་ཙེ་ ཚེམ་དྲུབ་ཅན)། རྒྱ་མཐོ་ ༢ དང་ཕྱེད། དཀྱུས་རལཔ་དང་སྦྲགས་ མཐོ་ ༡༤།
བློན་པོ། ལི་ཝང་། རྒྱ་མཐོ་ ༦ དང་ལག་གང་། དཀྱུས་མཐོ་ ༢༡།
བློན་པོའི་རགས་ཅུང་། ལི་ཝང་། ལྟབ་ཚད་སྤྱ་མཐོ་གང་། དཀྱུས་མཐོ་ ༡༤།
གཉིས་སྐལམ། དམར་རྐྱང་ (བཙོད་ཁམ)། རྒྱ་མཐོ་ ༥ དང་ལག་གང་། དཀྱུས་མཐོ་ ༢༡།', null, '[{"point": "ཐིག་ཁྲམ་ - བཀབ་ནེའི་རིགས་ (དཔོན་སློབ། རྒྱལ་སྲས་སྐུ་འཁོར། ཨ་ཞེ། བློན་པོ། བློན་པོའི་རགས་ཅུང་། གཉིས་སྐལམ) ཁ་དོག་དང་ རྒྱ་ཚད་ དཀྱུས་ཚད་ཚུ་ ཁ་གསལ།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2024, batch 2", "source": {"title": "BCSE 2024 Main Examination, General category, Paper I (Dzongkha)", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-general-1-2024b2-c1', 1, null, null, null, null)
  returning id
)
insert into me_q select 'C1a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བ་ག་ར་གི་ལན་ བྲིས།
༉ བཀབ་ནེ་འདི་ སངས་རྒྱས་བཅོམ་ལྡན་འདས་ཀྱིས་འཁོར་རྣམ་པ་བཞི་ལུ་འདུལ་ཁྲིམས་བཅའཝ་ད་ དགེ་སློང་ཚུ་ལུ་གཙོ་བོ་གུས་ཞབས་ཀྱི་དོན་ལུ་གནངམ་མ་ཚད་ དུས་རབས་༨ པའི་ནང་ གུ་རུ་རིན་པོ་ཆེ་འབྲུག་ལུ་བྱོན་ཏེ་ སྲོག་གཅོད་སྤང་ནི་ལ་སོགས་པའི་དགེ་བསྙེན་གྱི་སྦོམ་པ་གནང་བའི་སྐབས་ མི་སེར་སྤྱིར་བཏང་ལུ་ བཀབ་ནེའི་ཚོས་གཞི་དཀརཔོ་སྦེ་གནང་སྟེ་ཆོས་ཀྱི་མཛོད་སྒོ་དང་འབྲེལ་བའི་སྐབས་ གུས་ཞབས་ཀྱི་དོན་ལུ་བཀབ་སྲོལ་བཙུགས་གནང་གནངམ་ཨིན་པས།
དེའི་ཤུལ་ལས་ དུས་རབས་༡༧ པའི་ནང་ ཞབས་དྲུང་གིས་ཆོས་སྲིད་ལུགས་གཉིས་ཀྱི་གཞུང་དབུ་བཙུགས་སྐབས་ དགེ་འདུན་གྱི་སྡེ་ལུ་ཐུགས་བརྩེ་ཆེཝ་ལས་ ལུགས་གཉིས་ཁ་ལོ་བསྒྱུར་བའི་དཔོན་ཁག་ཡང་ དགེ་སློང་གི་གྲས་ལས་བསྐོས་ཏེ་ ལྷན་རྒྱས་གཉིས་སྐལམ་ལ་སོགས་པའི་ན་བཟའི་དབྱེ་བ་སོ་སོར་བཟོ་གནངམ་མ་ཚད་ ད་ལྟོའི་རྒཔོ་ཚུ་གི་བཀབ་ནེ་དེ་ཡང་ དེ་བསྒང་ལས་རང་ རྟོགས་ལྡན་སྒརཔ་ཟེར་བའི་དོན་ལུ་གོས་དཀར་སྔགས་ཆས་སྦེ་མཛད་གནང་ནུག།
དུས་རབས་༢༠ པའི་ནང་ རྒྱལ་བརྒྱུད་ཀྱི་གཞུང་དབུ་བརྙེས་ཞིནམ་ལས་ བློན་པོ་ལྷན་རྒྱས་གོང་འོག་དང་གཉིས་སྐལམ་ཆིབས་བཞོནམ་དང་རབ་འབྱམས་ལ་སོགས་པའི་གོ་གནས་ཀྱི་རྟགས་ཚན་གྱི་དོན་ལུ་བཀབ་ནེའི་དབྱེ་བ་སོ་སོར་མཛད་གནང་ནུག།
དུས་རབས་༢༡ པའི་ནང་ རྒྱལ་ཁབ་གོང་འཕེལ་གྱི་འགྱུར་བ་ལས་བརྟེན་ རྫོང་བདག་ དྲང་དཔོན་ ཆེ་བསོད་ཅན་གྱི་འཐུས་མི་ཚུ་གི་བཀབ་ནེའི་དབྱེ་བ་སོ་སོར་མཛད་གནང་སྟེ་ཡོད།
བཀབ་ནེ་འདི་གཙོ་བོ་གུས་ཞབས་ཀྱི་དོན་ལུ་ཨིནམ་ལས་ རྫོང་གཞིས་ དགོན་སྡེ་ གཙུག་ལག་ཁང་དང་ལྷ་ཁང་མགོན་ཁང་ཚུ་ནང་འགྱོཝ་ད་དང་ ཆོས་ཞུ་སར་བླམ་སློབ་དཔོན་ཚུ་དང་གོ་གནས་ཅན་ཚུ་གི་སྐུ་མདུན་ལུ་བཅརཝ་ད་བཀབ་དགོཔ་ཨིན།
གཟུགས་ཁར་གོ་ལ་གྱོན་ཏེ་ཡོད་རུང་ རང་ལས་མཐོ་བའི་གོང་མ་བ་སློབ་དང་ ཆོས་སྲིད་ཀྱི་མཛད་སྒོ་ཚུ་ནང་གོ་གི་ལྟག་ལུ་བཀབ་ནེ་བཀབ་མི་འདི་ ལྷག་པར་དུ་ གུས་ཞབས་ཞུ་བའི་དོན་ཨིནམ་མ་ཚད་ གོང་མ་དང་འོག་མའི་བར་ན་ཐ་དམ་ཚིག་གི་ཐོག་ལས་གུས་བཀུར་སྟོན་པའི་བར་མཚོན་དང་ ཁྲེལ་ངོ་ཚ་བག་ཡོདཔ་དང་ལྡན་པའི་མི་ཡ་རབས་ཀྱི་གྱལ་ཁར་ཚུད་དེ་ རང་བསོད་ནམས་གསག་ནིའི་དོན་ལུ་ཨིན།
དཔོན་སློབ་ཀྱི་ན་བཟའ་གཞི་སེརཔོ་ངོ་མ་ལས་ ལི་ཝང་ཁ་ཙམ་དང་ལི་ཝང་ངོ་མ་ལས་སེར་ཁ་འཚམས་ཅིག་སྦེ་ ལུང་སེརམ་ཨིན།
རྒྱ་ཚད་མཐོ་དྲུག་དང་ལག་གང་ དཀྱུས་མཐོ་ཉེར་གཅིག་དགོཔ་ཨིན། རྒྱལ་སྲས་སྐུ་འཁོར་གྱི་ན་བཟའི་ཁ་དོག་ལི་ཝང་ཁ་གནག་སུ་ཅིག་སྦེ་ཚོས་དམར་བཞེསཔ་ཨིན། རྒྱ་ཚད་མཐོ་ལྔ་དང་ལག་གང་། དཀྱུས་མཐོ་ཉི་ཤུ་ར་གཅིག་ཨིན།
ཨ་ཞེ་ཚུ་གི་ན་བཟའ་མདོག་དམརཔོ། རྒྱུ་དར་དང་གོས་ཆེན་ གྲུ་ཙེ་ ཚེམ་དྲུབ་ཅནམ། རྒྱ་མཐོ་ཕྱེད་དང་གཉིས། དཀྱུས་རལཔ་དང་སྦྲགས་ཏེ་མཐོ་བཅུ་བཞི་ཡོད།
བློན་པོ་ཚུ་གི་ན་བཟའ་མདོག་ལི་ཝང་། རྒྱ་ཚད་མཐོ་དྲུག་དང་ལག་གང་ དཀྱུས་མཐོ་ཉེར་གཅིག་ཡོད། མདུན་བཀལ་སྤྱ་མཐོ་གང་གི་ཚད་ཁར་ལྟབ་ལྔ་མཚམས་སྙོམས་ཏོག་ཏོ་ ཆོས་ཀྱི་གླེག་བམ་གྱི་སོ་ཅོག་འཐདཔ་སྦེ་བལྟབས་ཞིན་ན་ ཕྱག་ལྟག་གཡོན་པར་བཀལ་ཏེ་བཞེས་དགོ། གཞོགས་གཡས་ཐད་ལས་ན་བཟའི་སོ་དང་དཔའ་རྟགས་གཉིས་འདྲན་འདྲ་སྦེ་བཞག་དགོ།
བློན་པོའི་རགས་ཅུང་མདོག་ལི་ཝང་ ལྟབ་ཚད་སྤྱ་མཐོ་གང་ དཀྱུས་མཐོ་བཅུ་བཞི། བཀབ་ཐངས་ཨམ་སྲུ་སྤྱིར་བཏང་དང་འདྲ།
གཉིས་སྐལ་མའི་བཀབ་ནེ་མདོག་དམར་རྐྱང་། (བཙོད་ཁམ་) རྒྱ་ཚད་མཐོ་ལྔ་དང་ལག་གང་ དཀྱུས་མཐོ་ཉི་ཤུ་ར་གཅིག།
གཞོགས་གཡས་ཧོངས་གོ་གི་སོ་ལས་ ལག་གང་གི་འོག་ལས་ དཔའ་རྟགས་རོ་ལེབ་ཀྱི་རྩེ་ཕྱི་ཁར་ཐོནམ་སྦེ་བཀབ་དགོཔ་ཨིན་ནོ།།

འོག་ལུ་བཀོད་ཡོད་མི་ དྲི་བ་ག་ར་གི་ ལན་བྲིས། སྐུགས་ [༥×༣=༡༥]
༢༽ བཀབ་ནེ་བཀབ་དགོ་པའི་ དགོས་པ་ག་ཅི་ར་ཡོད་ཟེར་ བཀོད་ནུག? གོ་རིམ་བཞིན་བྲིས།', '༡. གཙོ་བོ་ གུས་ཞབས་ཞུ་ནི་གི་དོན་ལུ། ༢. གོང་མ་དང་འོག་མའི་བར་ན་ ཐ་དམ་ཚིག་གི་ཐོག་ལས་ གུས་བཀུར་སྟོན་པའི་ བར་མཚོན་ཨིན། ༣. ཁྲེལ་ངོ་ཚ་བག་ཡོད་པའི་ མི་ཡ་རབས་ཀྱི་གྱལ་ཁར་ཚུད་ནི། ༤. རང་ བསོད་ནམས་གསག་ནིའི་དོན་ལུ། (རྫོང་གཞིས་ དགོན་སྡེ་ ལྷ་ཁང་ཚུ་ནང་ འགྱོཝ་ད་དང་ བླམ་སློབ་དཔོན་ གོ་གནས་ཅན་ཚུ་གི་སྐུ་མདུན་ལུ་ བཅརཝ་ད་ བཀབ་དགོ།)', null, '[{"point": "དགོས་པ་ - གུས་ཞབས། གོང་འོག་བར་ ཐ་དམ་ཚིག་གི་ཐོག་ལས་ གུས་བཀུར་སྟོན་ནི། ཁྲེལ་ངོ་ཚ་ཤེས་པའི་ མི་ཡ་རབས་ཀྱི་གྱལ་ཁར་ཚུད་ནི། བསོད་ནམས་གསག་ནི། (རྫོང་དང་ ལྷ་ཁང་ བླམ་དཔོན་གྱི་སྐུ་མདུན་ལུ་ བཀབ་དགོ)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2024, batch 2", "source": {"title": "BCSE 2024 Main Examination, General category, Paper I (Dzongkha)", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-general-1-2024b2-c1', 2, null, null, null, null)
  returning id
)
insert into me_q select 'C1b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བ་ག་ར་གི་ལན་ བྲིས།
༉ བཀབ་ནེ་འདི་ སངས་རྒྱས་བཅོམ་ལྡན་འདས་ཀྱིས་འཁོར་རྣམ་པ་བཞི་ལུ་འདུལ་ཁྲིམས་བཅའཝ་ད་ དགེ་སློང་ཚུ་ལུ་གཙོ་བོ་གུས་ཞབས་ཀྱི་དོན་ལུ་གནངམ་མ་ཚད་ དུས་རབས་༨ པའི་ནང་ གུ་རུ་རིན་པོ་ཆེ་འབྲུག་ལུ་བྱོན་ཏེ་ སྲོག་གཅོད་སྤང་ནི་ལ་སོགས་པའི་དགེ་བསྙེན་གྱི་སྦོམ་པ་གནང་བའི་སྐབས་ མི་སེར་སྤྱིར་བཏང་ལུ་ བཀབ་ནེའི་ཚོས་གཞི་དཀརཔོ་སྦེ་གནང་སྟེ་ཆོས་ཀྱི་མཛོད་སྒོ་དང་འབྲེལ་བའི་སྐབས་ གུས་ཞབས་ཀྱི་དོན་ལུ་བཀབ་སྲོལ་བཙུགས་གནང་གནངམ་ཨིན་པས།
དེའི་ཤུལ་ལས་ དུས་རབས་༡༧ པའི་ནང་ ཞབས་དྲུང་གིས་ཆོས་སྲིད་ལུགས་གཉིས་ཀྱི་གཞུང་དབུ་བཙུགས་སྐབས་ དགེ་འདུན་གྱི་སྡེ་ལུ་ཐུགས་བརྩེ་ཆེཝ་ལས་ ལུགས་གཉིས་ཁ་ལོ་བསྒྱུར་བའི་དཔོན་ཁག་ཡང་ དགེ་སློང་གི་གྲས་ལས་བསྐོས་ཏེ་ ལྷན་རྒྱས་གཉིས་སྐལམ་ལ་སོགས་པའི་ན་བཟའི་དབྱེ་བ་སོ་སོར་བཟོ་གནངམ་མ་ཚད་ ད་ལྟོའི་རྒཔོ་ཚུ་གི་བཀབ་ནེ་དེ་ཡང་ དེ་བསྒང་ལས་རང་ རྟོགས་ལྡན་སྒརཔ་ཟེར་བའི་དོན་ལུ་གོས་དཀར་སྔགས་ཆས་སྦེ་མཛད་གནང་ནུག།
དུས་རབས་༢༠ པའི་ནང་ རྒྱལ་བརྒྱུད་ཀྱི་གཞུང་དབུ་བརྙེས་ཞིནམ་ལས་ བློན་པོ་ལྷན་རྒྱས་གོང་འོག་དང་གཉིས་སྐལམ་ཆིབས་བཞོནམ་དང་རབ་འབྱམས་ལ་སོགས་པའི་གོ་གནས་ཀྱི་རྟགས་ཚན་གྱི་དོན་ལུ་བཀབ་ནེའི་དབྱེ་བ་སོ་སོར་མཛད་གནང་ནུག།
དུས་རབས་༢༡ པའི་ནང་ རྒྱལ་ཁབ་གོང་འཕེལ་གྱི་འགྱུར་བ་ལས་བརྟེན་ རྫོང་བདག་ དྲང་དཔོན་ ཆེ་བསོད་ཅན་གྱི་འཐུས་མི་ཚུ་གི་བཀབ་ནེའི་དབྱེ་བ་སོ་སོར་མཛད་གནང་སྟེ་ཡོད།
བཀབ་ནེ་འདི་གཙོ་བོ་གུས་ཞབས་ཀྱི་དོན་ལུ་ཨིནམ་ལས་ རྫོང་གཞིས་ དགོན་སྡེ་ གཙུག་ལག་ཁང་དང་ལྷ་ཁང་མགོན་ཁང་ཚུ་ནང་འགྱོཝ་ད་དང་ ཆོས་ཞུ་སར་བླམ་སློབ་དཔོན་ཚུ་དང་གོ་གནས་ཅན་ཚུ་གི་སྐུ་མདུན་ལུ་བཅརཝ་ད་བཀབ་དགོཔ་ཨིན།
གཟུགས་ཁར་གོ་ལ་གྱོན་ཏེ་ཡོད་རུང་ རང་ལས་མཐོ་བའི་གོང་མ་བ་སློབ་དང་ ཆོས་སྲིད་ཀྱི་མཛད་སྒོ་ཚུ་ནང་གོ་གི་ལྟག་ལུ་བཀབ་ནེ་བཀབ་མི་འདི་ ལྷག་པར་དུ་ གུས་ཞབས་ཞུ་བའི་དོན་ཨིནམ་མ་ཚད་ གོང་མ་དང་འོག་མའི་བར་ན་ཐ་དམ་ཚིག་གི་ཐོག་ལས་གུས་བཀུར་སྟོན་པའི་བར་མཚོན་དང་ ཁྲེལ་ངོ་ཚ་བག་ཡོདཔ་དང་ལྡན་པའི་མི་ཡ་རབས་ཀྱི་གྱལ་ཁར་ཚུད་དེ་ རང་བསོད་ནམས་གསག་ནིའི་དོན་ལུ་ཨིན།
དཔོན་སློབ་ཀྱི་ན་བཟའ་གཞི་སེརཔོ་ངོ་མ་ལས་ ལི་ཝང་ཁ་ཙམ་དང་ལི་ཝང་ངོ་མ་ལས་སེར་ཁ་འཚམས་ཅིག་སྦེ་ ལུང་སེརམ་ཨིན།
རྒྱ་ཚད་མཐོ་དྲུག་དང་ལག་གང་ དཀྱུས་མཐོ་ཉེར་གཅིག་དགོཔ་ཨིན། རྒྱལ་སྲས་སྐུ་འཁོར་གྱི་ན་བཟའི་ཁ་དོག་ལི་ཝང་ཁ་གནག་སུ་ཅིག་སྦེ་ཚོས་དམར་བཞེསཔ་ཨིན། རྒྱ་ཚད་མཐོ་ལྔ་དང་ལག་གང་། དཀྱུས་མཐོ་ཉི་ཤུ་ར་གཅིག་ཨིན།
ཨ་ཞེ་ཚུ་གི་ན་བཟའ་མདོག་དམརཔོ། རྒྱུ་དར་དང་གོས་ཆེན་ གྲུ་ཙེ་ ཚེམ་དྲུབ་ཅནམ། རྒྱ་མཐོ་ཕྱེད་དང་གཉིས། དཀྱུས་རལཔ་དང་སྦྲགས་ཏེ་མཐོ་བཅུ་བཞི་ཡོད།
བློན་པོ་ཚུ་གི་ན་བཟའ་མདོག་ལི་ཝང་། རྒྱ་ཚད་མཐོ་དྲུག་དང་ལག་གང་ དཀྱུས་མཐོ་ཉེར་གཅིག་ཡོད། མདུན་བཀལ་སྤྱ་མཐོ་གང་གི་ཚད་ཁར་ལྟབ་ལྔ་མཚམས་སྙོམས་ཏོག་ཏོ་ ཆོས་ཀྱི་གླེག་བམ་གྱི་སོ་ཅོག་འཐདཔ་སྦེ་བལྟབས་ཞིན་ན་ ཕྱག་ལྟག་གཡོན་པར་བཀལ་ཏེ་བཞེས་དགོ། གཞོགས་གཡས་ཐད་ལས་ན་བཟའི་སོ་དང་དཔའ་རྟགས་གཉིས་འདྲན་འདྲ་སྦེ་བཞག་དགོ།
བློན་པོའི་རགས་ཅུང་མདོག་ལི་ཝང་ ལྟབ་ཚད་སྤྱ་མཐོ་གང་ དཀྱུས་མཐོ་བཅུ་བཞི། བཀབ་ཐངས་ཨམ་སྲུ་སྤྱིར་བཏང་དང་འདྲ།
གཉིས་སྐལ་མའི་བཀབ་ནེ་མདོག་དམར་རྐྱང་། (བཙོད་ཁམ་) རྒྱ་ཚད་མཐོ་ལྔ་དང་ལག་གང་ དཀྱུས་མཐོ་ཉི་ཤུ་ར་གཅིག།
གཞོགས་གཡས་ཧོངས་གོ་གི་སོ་ལས་ ལག་གང་གི་འོག་ལས་ དཔའ་རྟགས་རོ་ལེབ་ཀྱི་རྩེ་ཕྱི་ཁར་ཐོནམ་སྦེ་བཀབ་དགོཔ་ཨིན་ནོ།།

འོག་ལུ་བཀོད་ཡོད་མི་ དྲི་བ་ག་ར་གི་ ལན་བྲིས། སྐུགས་ [༥×༣=༡༥]
༣༽ འབྲུག་ལུ་ བཀབ་ནེ་གི་འགྱུར་བ་ག་དེ་སྦེ་ སོང་ནུག? བཅུད་བསྡུ་སྟེ་ བྲིས།', 'སངས་རྒྱས་ཀྱིས་ དགེ་སློང་ཚུ་ལུ་ གུས་ཞབས་ཀྱི་དོན་ལུ་ གནང་ཡི། དུས་རབས་ ༨ པ་ལུ་ གུ་རུ་རིན་པོ་ཆེ་གིས་ མི་སེར་སྤྱིར་བཏང་ལུ་ བཀབ་ནེ་དཀརཔོ་ གནང་ཡི། དུས་རབས་ ༡༧ པ་ལུ་ ཞབས་དྲུང་གིས་ ལྷན་རྒྱས་ གཉིས་སྐལམ་ཚུ་གི་ དབྱེ་བ་སོ་སོར་བཟོ་སྟེ་ རྒཔོ་ཚུ་ལུ་ སྔགས་ཆས་དཀརཔོ་ མཛད་ཡི། དུས་རབས་ ༢༠ པ་ལུ་ རྒྱལ་བརྒྱུད་ཀྱི་གཞུང་ནང་ བློན་པོ་ གཉིས་སྐལམ་ ཆིབས་བཞོནམ་ རབ་འབྱམས་ཚུ་གི་ དབྱེ་བ་མཛད་ཡི། དུས་རབས་ ༢༡ པ་ལུ་ རྫོང་བདག་ དྲང་དཔོན་ འཐུས་མི་ཚུ་གི་ བཀབ་ནེ་ མཛད་ཡི།', null, '[{"point": "འགྱུར་བ་ - སངས་རྒྱས་ཀྱི་འདུལ་ཁྲིམས། དུས་རབས་ ༨ གུ་རུ་ (མི་སེར་ལུ་ དཀརཔོ)། ༡༧ ཞབས་དྲུང་ (དབྱེ་བ་སོ་སོ། སྔགས་ཆས་དཀརཔོ)། ༢༠ རྒྱལ་བརྒྱུད་ (བློན་པོ་ གཉིས་སྐལམ་ ཆིབས་བཞོནམ་ རབ་འབྱམས)། ༢༡ (རྫོང་བདག་ དྲང་དཔོན་ འཐུས་མི)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2024, batch 2", "source": {"title": "BCSE 2024 Main Examination, General category, Paper I (Dzongkha)", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-general-1-2024b2-c1', 3, null, null, null, null)
  returning id
)
insert into me_q select 'C1c', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1c' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C1c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བ་ག་ར་གི་ལན་ བྲིས།
༉ བཀབ་ནེ་འདི་ སངས་རྒྱས་བཅོམ་ལྡན་འདས་ཀྱིས་འཁོར་རྣམ་པ་བཞི་ལུ་འདུལ་ཁྲིམས་བཅའཝ་ད་ དགེ་སློང་ཚུ་ལུ་གཙོ་བོ་གུས་ཞབས་ཀྱི་དོན་ལུ་གནངམ་མ་ཚད་ དུས་རབས་༨ པའི་ནང་ གུ་རུ་རིན་པོ་ཆེ་འབྲུག་ལུ་བྱོན་ཏེ་ སྲོག་གཅོད་སྤང་ནི་ལ་སོགས་པའི་དགེ་བསྙེན་གྱི་སྦོམ་པ་གནང་བའི་སྐབས་ མི་སེར་སྤྱིར་བཏང་ལུ་ བཀབ་ནེའི་ཚོས་གཞི་དཀརཔོ་སྦེ་གནང་སྟེ་ཆོས་ཀྱི་མཛོད་སྒོ་དང་འབྲེལ་བའི་སྐབས་ གུས་ཞབས་ཀྱི་དོན་ལུ་བཀབ་སྲོལ་བཙུགས་གནང་གནངམ་ཨིན་པས།
དེའི་ཤུལ་ལས་ དུས་རབས་༡༧ པའི་ནང་ ཞབས་དྲུང་གིས་ཆོས་སྲིད་ལུགས་གཉིས་ཀྱི་གཞུང་དབུ་བཙུགས་སྐབས་ དགེ་འདུན་གྱི་སྡེ་ལུ་ཐུགས་བརྩེ་ཆེཝ་ལས་ ལུགས་གཉིས་ཁ་ལོ་བསྒྱུར་བའི་དཔོན་ཁག་ཡང་ དགེ་སློང་གི་གྲས་ལས་བསྐོས་ཏེ་ ལྷན་རྒྱས་གཉིས་སྐལམ་ལ་སོགས་པའི་ན་བཟའི་དབྱེ་བ་སོ་སོར་བཟོ་གནངམ་མ་ཚད་ ད་ལྟོའི་རྒཔོ་ཚུ་གི་བཀབ་ནེ་དེ་ཡང་ དེ་བསྒང་ལས་རང་ རྟོགས་ལྡན་སྒརཔ་ཟེར་བའི་དོན་ལུ་གོས་དཀར་སྔགས་ཆས་སྦེ་མཛད་གནང་ནུག།
དུས་རབས་༢༠ པའི་ནང་ རྒྱལ་བརྒྱུད་ཀྱི་གཞུང་དབུ་བརྙེས་ཞིནམ་ལས་ བློན་པོ་ལྷན་རྒྱས་གོང་འོག་དང་གཉིས་སྐལམ་ཆིབས་བཞོནམ་དང་རབ་འབྱམས་ལ་སོགས་པའི་གོ་གནས་ཀྱི་རྟགས་ཚན་གྱི་དོན་ལུ་བཀབ་ནེའི་དབྱེ་བ་སོ་སོར་མཛད་གནང་ནུག།
དུས་རབས་༢༡ པའི་ནང་ རྒྱལ་ཁབ་གོང་འཕེལ་གྱི་འགྱུར་བ་ལས་བརྟེན་ རྫོང་བདག་ དྲང་དཔོན་ ཆེ་བསོད་ཅན་གྱི་འཐུས་མི་ཚུ་གི་བཀབ་ནེའི་དབྱེ་བ་སོ་སོར་མཛད་གནང་སྟེ་ཡོད།
བཀབ་ནེ་འདི་གཙོ་བོ་གུས་ཞབས་ཀྱི་དོན་ལུ་ཨིནམ་ལས་ རྫོང་གཞིས་ དགོན་སྡེ་ གཙུག་ལག་ཁང་དང་ལྷ་ཁང་མགོན་ཁང་ཚུ་ནང་འགྱོཝ་ད་དང་ ཆོས་ཞུ་སར་བླམ་སློབ་དཔོན་ཚུ་དང་གོ་གནས་ཅན་ཚུ་གི་སྐུ་མདུན་ལུ་བཅརཝ་ད་བཀབ་དགོཔ་ཨིན།
གཟུགས་ཁར་གོ་ལ་གྱོན་ཏེ་ཡོད་རུང་ རང་ལས་མཐོ་བའི་གོང་མ་བ་སློབ་དང་ ཆོས་སྲིད་ཀྱི་མཛད་སྒོ་ཚུ་ནང་གོ་གི་ལྟག་ལུ་བཀབ་ནེ་བཀབ་མི་འདི་ ལྷག་པར་དུ་ གུས་ཞབས་ཞུ་བའི་དོན་ཨིནམ་མ་ཚད་ གོང་མ་དང་འོག་མའི་བར་ན་ཐ་དམ་ཚིག་གི་ཐོག་ལས་གུས་བཀུར་སྟོན་པའི་བར་མཚོན་དང་ ཁྲེལ་ངོ་ཚ་བག་ཡོདཔ་དང་ལྡན་པའི་མི་ཡ་རབས་ཀྱི་གྱལ་ཁར་ཚུད་དེ་ རང་བསོད་ནམས་གསག་ནིའི་དོན་ལུ་ཨིན།
དཔོན་སློབ་ཀྱི་ན་བཟའ་གཞི་སེརཔོ་ངོ་མ་ལས་ ལི་ཝང་ཁ་ཙམ་དང་ལི་ཝང་ངོ་མ་ལས་སེར་ཁ་འཚམས་ཅིག་སྦེ་ ལུང་སེརམ་ཨིན།
རྒྱ་ཚད་མཐོ་དྲུག་དང་ལག་གང་ དཀྱུས་མཐོ་ཉེར་གཅིག་དགོཔ་ཨིན། རྒྱལ་སྲས་སྐུ་འཁོར་གྱི་ན་བཟའི་ཁ་དོག་ལི་ཝང་ཁ་གནག་སུ་ཅིག་སྦེ་ཚོས་དམར་བཞེསཔ་ཨིན། རྒྱ་ཚད་མཐོ་ལྔ་དང་ལག་གང་། དཀྱུས་མཐོ་ཉི་ཤུ་ར་གཅིག་ཨིན།
ཨ་ཞེ་ཚུ་གི་ན་བཟའ་མདོག་དམརཔོ། རྒྱུ་དར་དང་གོས་ཆེན་ གྲུ་ཙེ་ ཚེམ་དྲུབ་ཅནམ། རྒྱ་མཐོ་ཕྱེད་དང་གཉིས། དཀྱུས་རལཔ་དང་སྦྲགས་ཏེ་མཐོ་བཅུ་བཞི་ཡོད།
བློན་པོ་ཚུ་གི་ན་བཟའ་མདོག་ལི་ཝང་། རྒྱ་ཚད་མཐོ་དྲུག་དང་ལག་གང་ དཀྱུས་མཐོ་ཉེར་གཅིག་ཡོད། མདུན་བཀལ་སྤྱ་མཐོ་གང་གི་ཚད་ཁར་ལྟབ་ལྔ་མཚམས་སྙོམས་ཏོག་ཏོ་ ཆོས་ཀྱི་གླེག་བམ་གྱི་སོ་ཅོག་འཐདཔ་སྦེ་བལྟབས་ཞིན་ན་ ཕྱག་ལྟག་གཡོན་པར་བཀལ་ཏེ་བཞེས་དགོ། གཞོགས་གཡས་ཐད་ལས་ན་བཟའི་སོ་དང་དཔའ་རྟགས་གཉིས་འདྲན་འདྲ་སྦེ་བཞག་དགོ།
བློན་པོའི་རགས་ཅུང་མདོག་ལི་ཝང་ ལྟབ་ཚད་སྤྱ་མཐོ་གང་ དཀྱུས་མཐོ་བཅུ་བཞི། བཀབ་ཐངས་ཨམ་སྲུ་སྤྱིར་བཏང་དང་འདྲ།
གཉིས་སྐལ་མའི་བཀབ་ནེ་མདོག་དམར་རྐྱང་། (བཙོད་ཁམ་) རྒྱ་ཚད་མཐོ་ལྔ་དང་ལག་གང་ དཀྱུས་མཐོ་ཉི་ཤུ་ར་གཅིག།
གཞོགས་གཡས་ཧོངས་གོ་གི་སོ་ལས་ ལག་གང་གི་འོག་ལས་ དཔའ་རྟགས་རོ་ལེབ་ཀྱི་རྩེ་ཕྱི་ཁར་ཐོནམ་སྦེ་བཀབ་དགོཔ་ཨིན་ནོ།།

འོག་ལུ་བཀོད་ཡོད་མི་ དྲི་བ་ག་ར་གི་ ལན་བྲིས། སྐུགས་ [༥×༣=༡༥]
༤༽ རྒྱལ་ཁབ་སོ་སོ་ནང་ བཀབ་ནེ་བཀབ་ནིའི་ལམ་སྲོལ་འགོ་དང་པ་ར་ ག་དེ་སྦེ་བྱུང་ནུག?', 'སངས་རྒྱས་བཅོམ་ལྡན་འདས་ཀྱིས་ འཁོར་རྣམ་པ་བཞི་ལུ་ འདུལ་ཁྲིམས་བཅའ་བའི་སྐབས་ དགེ་སློང་ཚུ་ལུ་ གཙོ་བོ་ གུས་ཞབས་ཀྱི་དོན་ལུ་ བཀབ་ནེ་གནང་མི་ལས་ འགོ་བཙུགས་ཡི།', null, '[{"point": "འགོ་དང་པ་ སངས་རྒྱས་བཅོམ་ལྡན་འདས་ཀྱིས་ འཁོར་རྣམ་པ་བཞི་ལུ་ འདུལ་ཁྲིམས་བཅའ་བའི་སྐབས་ དགེ་སློང་ཚུ་ལུ་ གུས་ཞབས་ཀྱི་དོན་ལུ་ གནང་མི་ལས་ བྱུང་།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2024, batch 2", "source": {"title": "BCSE 2024 Main Examination, General category, Paper I (Dzongkha)", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-general-1-2024b2-c1', 4, null, null, null, null)
  returning id
)
insert into me_q select 'C1d', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1d' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C1d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C1d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C1d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'འོག་གི་ཡིག་རྒྱུགས་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བ་ག་ར་གི་ལན་ བྲིས།
༉ བཀབ་ནེ་འདི་ སངས་རྒྱས་བཅོམ་ལྡན་འདས་ཀྱིས་འཁོར་རྣམ་པ་བཞི་ལུ་འདུལ་ཁྲིམས་བཅའཝ་ད་ དགེ་སློང་ཚུ་ལུ་གཙོ་བོ་གུས་ཞབས་ཀྱི་དོན་ལུ་གནངམ་མ་ཚད་ དུས་རབས་༨ པའི་ནང་ གུ་རུ་རིན་པོ་ཆེ་འབྲུག་ལུ་བྱོན་ཏེ་ སྲོག་གཅོད་སྤང་ནི་ལ་སོགས་པའི་དགེ་བསྙེན་གྱི་སྦོམ་པ་གནང་བའི་སྐབས་ མི་སེར་སྤྱིར་བཏང་ལུ་ བཀབ་ནེའི་ཚོས་གཞི་དཀརཔོ་སྦེ་གནང་སྟེ་ཆོས་ཀྱི་མཛོད་སྒོ་དང་འབྲེལ་བའི་སྐབས་ གུས་ཞབས་ཀྱི་དོན་ལུ་བཀབ་སྲོལ་བཙུགས་གནང་གནངམ་ཨིན་པས།
དེའི་ཤུལ་ལས་ དུས་རབས་༡༧ པའི་ནང་ ཞབས་དྲུང་གིས་ཆོས་སྲིད་ལུགས་གཉིས་ཀྱི་གཞུང་དབུ་བཙུགས་སྐབས་ དགེ་འདུན་གྱི་སྡེ་ལུ་ཐུགས་བརྩེ་ཆེཝ་ལས་ ལུགས་གཉིས་ཁ་ལོ་བསྒྱུར་བའི་དཔོན་ཁག་ཡང་ དགེ་སློང་གི་གྲས་ལས་བསྐོས་ཏེ་ ལྷན་རྒྱས་གཉིས་སྐལམ་ལ་སོགས་པའི་ན་བཟའི་དབྱེ་བ་སོ་སོར་བཟོ་གནངམ་མ་ཚད་ ད་ལྟོའི་རྒཔོ་ཚུ་གི་བཀབ་ནེ་དེ་ཡང་ དེ་བསྒང་ལས་རང་ རྟོགས་ལྡན་སྒརཔ་ཟེར་བའི་དོན་ལུ་གོས་དཀར་སྔགས་ཆས་སྦེ་མཛད་གནང་ནུག།
དུས་རབས་༢༠ པའི་ནང་ རྒྱལ་བརྒྱུད་ཀྱི་གཞུང་དབུ་བརྙེས་ཞིནམ་ལས་ བློན་པོ་ལྷན་རྒྱས་གོང་འོག་དང་གཉིས་སྐལམ་ཆིབས་བཞོནམ་དང་རབ་འབྱམས་ལ་སོགས་པའི་གོ་གནས་ཀྱི་རྟགས་ཚན་གྱི་དོན་ལུ་བཀབ་ནེའི་དབྱེ་བ་སོ་སོར་མཛད་གནང་ནུག།
དུས་རབས་༢༡ པའི་ནང་ རྒྱལ་ཁབ་གོང་འཕེལ་གྱི་འགྱུར་བ་ལས་བརྟེན་ རྫོང་བདག་ དྲང་དཔོན་ ཆེ་བསོད་ཅན་གྱི་འཐུས་མི་ཚུ་གི་བཀབ་ནེའི་དབྱེ་བ་སོ་སོར་མཛད་གནང་སྟེ་ཡོད།
བཀབ་ནེ་འདི་གཙོ་བོ་གུས་ཞབས་ཀྱི་དོན་ལུ་ཨིནམ་ལས་ རྫོང་གཞིས་ དགོན་སྡེ་ གཙུག་ལག་ཁང་དང་ལྷ་ཁང་མགོན་ཁང་ཚུ་ནང་འགྱོཝ་ད་དང་ ཆོས་ཞུ་སར་བླམ་སློབ་དཔོན་ཚུ་དང་གོ་གནས་ཅན་ཚུ་གི་སྐུ་མདུན་ལུ་བཅརཝ་ད་བཀབ་དགོཔ་ཨིན།
གཟུགས་ཁར་གོ་ལ་གྱོན་ཏེ་ཡོད་རུང་ རང་ལས་མཐོ་བའི་གོང་མ་བ་སློབ་དང་ ཆོས་སྲིད་ཀྱི་མཛད་སྒོ་ཚུ་ནང་གོ་གི་ལྟག་ལུ་བཀབ་ནེ་བཀབ་མི་འདི་ ལྷག་པར་དུ་ གུས་ཞབས་ཞུ་བའི་དོན་ཨིནམ་མ་ཚད་ གོང་མ་དང་འོག་མའི་བར་ན་ཐ་དམ་ཚིག་གི་ཐོག་ལས་གུས་བཀུར་སྟོན་པའི་བར་མཚོན་དང་ ཁྲེལ་ངོ་ཚ་བག་ཡོདཔ་དང་ལྡན་པའི་མི་ཡ་རབས་ཀྱི་གྱལ་ཁར་ཚུད་དེ་ རང་བསོད་ནམས་གསག་ནིའི་དོན་ལུ་ཨིན།
དཔོན་སློབ་ཀྱི་ན་བཟའ་གཞི་སེརཔོ་ངོ་མ་ལས་ ལི་ཝང་ཁ་ཙམ་དང་ལི་ཝང་ངོ་མ་ལས་སེར་ཁ་འཚམས་ཅིག་སྦེ་ ལུང་སེརམ་ཨིན།
རྒྱ་ཚད་མཐོ་དྲུག་དང་ལག་གང་ དཀྱུས་མཐོ་ཉེར་གཅིག་དགོཔ་ཨིན། རྒྱལ་སྲས་སྐུ་འཁོར་གྱི་ན་བཟའི་ཁ་དོག་ལི་ཝང་ཁ་གནག་སུ་ཅིག་སྦེ་ཚོས་དམར་བཞེསཔ་ཨིན། རྒྱ་ཚད་མཐོ་ལྔ་དང་ལག་གང་། དཀྱུས་མཐོ་ཉི་ཤུ་ར་གཅིག་ཨིན།
ཨ་ཞེ་ཚུ་གི་ན་བཟའ་མདོག་དམརཔོ། རྒྱུ་དར་དང་གོས་ཆེན་ གྲུ་ཙེ་ ཚེམ་དྲུབ་ཅནམ། རྒྱ་མཐོ་ཕྱེད་དང་གཉིས། དཀྱུས་རལཔ་དང་སྦྲགས་ཏེ་མཐོ་བཅུ་བཞི་ཡོད།
བློན་པོ་ཚུ་གི་ན་བཟའ་མདོག་ལི་ཝང་། རྒྱ་ཚད་མཐོ་དྲུག་དང་ལག་གང་ དཀྱུས་མཐོ་ཉེར་གཅིག་ཡོད། མདུན་བཀལ་སྤྱ་མཐོ་གང་གི་ཚད་ཁར་ལྟབ་ལྔ་མཚམས་སྙོམས་ཏོག་ཏོ་ ཆོས་ཀྱི་གླེག་བམ་གྱི་སོ་ཅོག་འཐདཔ་སྦེ་བལྟབས་ཞིན་ན་ ཕྱག་ལྟག་གཡོན་པར་བཀལ་ཏེ་བཞེས་དགོ། གཞོགས་གཡས་ཐད་ལས་ན་བཟའི་སོ་དང་དཔའ་རྟགས་གཉིས་འདྲན་འདྲ་སྦེ་བཞག་དགོ།
བློན་པོའི་རགས་ཅུང་མདོག་ལི་ཝང་ ལྟབ་ཚད་སྤྱ་མཐོ་གང་ དཀྱུས་མཐོ་བཅུ་བཞི། བཀབ་ཐངས་ཨམ་སྲུ་སྤྱིར་བཏང་དང་འདྲ།
གཉིས་སྐལ་མའི་བཀབ་ནེ་མདོག་དམར་རྐྱང་། (བཙོད་ཁམ་) རྒྱ་ཚད་མཐོ་ལྔ་དང་ལག་གང་ དཀྱུས་མཐོ་ཉི་ཤུ་ར་གཅིག།
གཞོགས་གཡས་ཧོངས་གོ་གི་སོ་ལས་ ལག་གང་གི་འོག་ལས་ དཔའ་རྟགས་རོ་ལེབ་ཀྱི་རྩེ་ཕྱི་ཁར་ཐོནམ་སྦེ་བཀབ་དགོཔ་ཨིན་ནོ།།

འོག་ལུ་བཀོད་ཡོད་མི་ དྲི་བ་ག་ར་གི་ ལན་བྲིས། སྐུགས་ [༥×༣=༡༥]
༥༽ གོང་ལུ་ ཡིག་རྒྱུགས་ནང་བཀོད་དོ་བཟུམ་སྦེ་ བཀབ་ནེ་གི་འཐོབ་ལམ་ སོ་སོ་ག་ཅི་འབད་བཟོ་དགོཔ་ཨིན་ན? ཁུངས་བཀལ་ཏེ་ བྲིས།', 'དཔོན་སློབ་ - རྒྱ་མཐོ་ ༦ དང་ལག་གང་ དཀྱུས་མཐོ་ ༢༡། རྒྱལ་སྲས་སྐུ་འཁོར་ - རྒྱ་མཐོ་ ༥ དང་ལག་གང་ དཀྱུས་མཐོ་ ༢༡། ཨ་ཞེ་ - རྒྱ་མཐོ་ ༢ དང་ཕྱེད་ དཀྱུས་ (རལཔ་དང་སྦྲགས) མཐོ་ ༡༤། བློན་པོ་ - རྒྱ་མཐོ་ ༦ དང་ལག་གང་ དཀྱུས་མཐོ་ ༢༡ (མདུན་བཀལ་ སྤྱ་མཐོ་གང་གི་ཚད་ཁར་ ལྟབ་ལྔ)། བློན་པོའི་རགས་ཅུང་ - ལྟབ་ཚད་སྤྱ་མཐོ་གང་ དཀྱུས་མཐོ་ ༡༤། གཉིས་སྐལམ་ - རྒྱ་མཐོ་ ༥ དང་ལག་གང་ དཀྱུས་མཐོ་ ༢༡།', null, '[{"point": "བཀབ་ནེ་སོ་སོའི་ཚད་ (རྒྱ་ཚད་ དཀྱུས་ཚད) དང་ ཁ་དོག་ ཡིག་རྒྱུགས་ལས་ ཁུངས་བཀལ་ཏེ་ བཀོད་ཡོདཔ།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2024, batch 2", "source": {"title": "BCSE 2024 Main Examination, General category, Paper I (Dzongkha)", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-general-1-2024b2-c1', 5, null, null, null, null)
  returning id
)
insert into me_q select 'C1e', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1e' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C1e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C1e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C1e';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'translation', 'འོག་ལུ་ཨིང་སྐད་ནང་ཡོད་མི་ ཡིག་རྒྱུགས་འདི་ རྫོང་ཁའི་ཐོག་ལུ་ སྐད་སྒྱུར་འབད་དེ་ བྲིས།
It is disturbing to witness growing exploitation of the social media for unauthorised solicitation of donations. On August 21, 2024, the Ministry of Home Affairs issued a notification strictly prohibiting unauthorised solicitation of donations via social media platforms such as TikTok, Facebook, and others without prior approval. This is a timely and necessary intervention to address a problem that has been spiraling out of control, preying on the goodwill and generosity of the Bhutanese people.
The surge in unauthorised donation requests has highlighted a troubling trend - one that exploits the inherent kindness and community spirit of our society. The ministry has already reported nine cases of unauthorised donations, prompting the issuance of a stern warning against such activities. These incidents not only undermine the trust and solidarity within our communities but also pave the way for fraudulent practices that could have long-lasting negative impacts.
The act of soliciting donations is, at its core, an appeal to the compassion and empathy of others. When done with sincerity and transparency, it can be a powerful force for enabling communities to rally around a cause, support those in need, and create positive change. However, when individuals or groups exploit this mechanism for personal gain or without proper authorisation, it becomes an act of deception - one that erodes the trust that is essential for any form of charitable giving.
Unauthorised solicitations are not just a breach of trust; they are a violation of the law. According to
Chapter 21 of the Penal Code of Bhutan, under the subtopic of deceptive practices, a defendant is guilty of an offence if they defraud another person or facilitate fraud by making or altering an object or item to appear original and genuine. This legal provision underlines the seriousness with which our society views acts of deception, particularly those that involve the manipulation of others’ kindness for fraudulent purposes.', 'ལན་གྱི་དཔེ།

བརྙན་འཕྲིན་ཐོག་ལུ་ ཆོག་ཐམ་མེད་པར་ ཞལ་འདེབས་བསྡུ་མི་ ཡར་སེང་འགྱོ་དོ་ཡོདཔ་མཐོང་སྟེ་ སེམས་ཁར་ཕོག་དོ་ཡོད། སྤྱི་ལོ་ ༢༠༢༤ སྤྱི་ཟླ་ ༨ པའི་ཚེས་ ༢༡ ལུ་ ནང་སྲིད་ལྷན་ཁག་གིས་ ཧེ་མ་ལས་ ཆོག་ཐམ་མ་ལེན་པར་ ཊིཀ་ཊོཀ་ དང་ ཕེསི་བུཀ་ ལ་སོགས་པའི་ བརྙན་འཕྲིན་ཐོག་ལས་ ཞལ་འདེབས་བསྡུ་ནི་ བཀག་ཆ་ངེས་བརྟན་འབད་བའི་ བརྡ་བསྐུལ་ཅིག་ བཏོན་ཡོདཔ་ཨིན། འདི་ འབྲུག་མི་ཚུ་གི་ སེམས་བཟང་དང་ གཏོང་ཕོད་ལུ་ ཕན་གནོད་རྐྱབ་སྟེ་ ཚོད་འཛིན་མེད་པར་ ཡར་སེང་འགྱོ་དོ་ཡོད་པའི་ དཀའ་ངལ་ སེལ་ནིའི་དོན་ལུ་ དུས་ཐོག་དང་ དགོས་མཁོ་ཅན་གྱི་ བར་བཀག་ཅིག་ཨིན།

ཆོག་ཐམ་མེད་པའི་ ཞལ་འདེབས་ཞུ་བ་ ཡར་སེང་འགྱོ་མི་འདི་གིས་ ང་བཅས་རའི་མི་སྡེའི་ སེམས་བཟང་དང་ མཐུན་སྒྲིལ་གྱི་སེམས་ཤུགས་ལུ་ ཕན་གནོད་རྐྱབ་པའི་ ལམ་ལུགས་ངན་པ་ཅིག་ གསལ་སྟོན་འབད་ཡོད། ལྷན་ཁག་གིས་ ཆོག་ཐམ་མེད་པའི་ ཞལ་འདེབས་ཀྱི་ གནད་དོན་ ༩ སྙན་ཞུ་འབད་དེ་ཡོདཔ་ལས་ དེ་བཟུམ་གྱི་ ལཱ་ཚུ་ལུ་ ཉེན་བརྡ་ངེས་བརྟན་ཅིག་ བཏོན་ཡོདཔ་ཨིན། གནད་དོན་དེ་ཚུ་གིས་ མི་སྡེ་ནང་གི་ ཡིད་ཆེས་དང་ མཐུན་སྒྲིལ་ ཉམས་བཅུག་ནི་མ་ཚད་ ཡུན་རིང་གི་གནོད་པ་ཡོད་པའི་ ཟོལ་ཟོབ་ཀྱི་ལཱ་ཚུ་ལུ་ ལམ་ཁ་ཕྱེ་ཚུགས།

ཞལ་འདེབས་ཞུ་ནི་འདི་ གཞི་རྩ་ལས་ གཞན་གྱི་ སྙིང་རྗེ་དང་ བརྩེ་བ་ལུ་ ཞུ་བ་ཕུལ་ནི་ཅིག་ཨིན། དྲང་བདེན་དང་ ཀུན་གསལ་གྱི་ཐོག་ལས་ འབད་བ་ཅིན་ མི་སྡེ་ཚུ་ དམིགས་དོན་ཅིག་གི་དོན་ལུ་ གཅིག་ཁར་འཛོམས་ཏེ་ དགོས་མཁོ་ཅན་ལུ་ རྒྱབ་སྐྱོར་འབད་ནི་དང་ ལེགས་ཤོམ་གྱི་འགྱུར་བ་ བཟོ་ཚུགས་པའི་ ནུས་ཤུགས་སྦོམ་ཅིག་ཨིན། ཨིན་རུང་ མི་སྒེར་ཡང་ན་ སྡེ་ཚན་ཚུ་གིས་ རང་སོའི་ཁེ་ཕན་གྱི་དོན་ལུ་ ཡང་ན་ ཆོག་ཐམ་མེད་པར་ ལག་ལེན་འཐབ་པ་ཅིན་ དེ་ ཟོལ་ཟོབ་ཀྱི་ལཱ་ཅིག་ལུ་ འགྱུར་ཏེ་ སྦྱིན་བདག་གི་ ལཱ་ག་ར་ལུ་ དགོས་མཁོ་ཡོད་པའི་ ཡིད་ཆེས་ ཉམས་བཅུགཔ་ཨིན།

ཆོག་ཐམ་མེད་པའི་ ཞལ་འདེབས་བསྡུ་ནི་འདི་ ཡིད་ཆེས་ཉམས་པ་རྐྱངམ་ཅིག་མེན་པར་ ཁྲིམས་འགལ་ཡང་ཨིན། འབྲུག་གི་ཉེས་ཁྲིམས་ཀྱི་ ལེའུ་ ༢༡ པའི་ མགོ་སྐོར་གྱི་ལཱ་ ཟེར་མི་འོག་ལུ་ ཉེས་འཛུགས་འབད་མི་གིས་ གཞན་ལུ་ མགོ་སྐོར་རྐྱབ་པ་ཅིན་ ཡང་ན་ དངོས་པོ་ཅིག་ ངོ་མ་ཨིནམ་བཟུམ་སྦེ་ བཟོ་ནི་ ཡང་ན་ བསྒྱུར་བཅོས་འབད་དེ་ མགོ་སྐོར་ལུ་ ལྷན་ཐབས་འབད་བ་ཅིན་ ཉེས་པ་ཅན་ཨིན། ཁྲིམས་ཀྱི་དགོངས་དོན་འདི་གིས་ ང་བཅས་རའི་ མི་སྡེ་གིས་ མགོ་སྐོར་གྱི་ལཱ་ཚུ་ ལྷག་པར་དུ་ གཞན་གྱི་ སེམས་བཟང་ལུ་ བསླུ་བྲིད་འབད་བའི་ ལཱ་ཚུ་ལུ་ ག་དེ་ཅིག་ གལ་གནད་ཆེཝ་སྦེ་ བལྟཝ་ཨིན་ན་ གསལ་སྟོན་འབདཝ་ཨིན།', null, '[{"point": "དོན་ཚན་ ༡ - བརྙན་འཕྲིན་ཐོག་ལས་ ཆོག་ཐམ་མེད་པར་ ཞལ་འདེབས་བསྡུ་ནི། ནང་སྲིད་ལྷན་ཁག་གི་ བརྡ་བསྐུལ་ (༢༠༢༤/༨/༢༡)། ཕྱི་ཐབས་ཐོག་ལས་ དགོས་མཁོ།", "marks": 4}, {"point": "དོན་ཚན་ ༢ - ཆོག་ཐམ་མེད་པའི་ཞལ་འདེབས་ ཡར་སེང་། གནད་དོན་ ༩། ཉེན་བརྡ། མཐུན་སྒྲིལ་ཉམས། ཟོལ་ཟོབ།", "marks": 4}, {"point": "དོན་ཚན་ ༣ དང་ ༤ - སྙིང་རྗེ་ལུ་ ཞུ་བ་ཕུལ་ནི། ཀུན་གསལ། ཁྲིམས་འགལ་ (ཉེས་ཁྲིམས་ལེའུ་ ༢༡ མགོ་སྐོར)། ཡིད་ཆེས་ཉམས།", "marks": 4}, {"point": "དོན་དག་མ་ཤོར་བར་ ཚིག་སྦྱོར་ཚད་ལྡན་ ཡིག་སྦྱོར་ངེས་བདེན།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'translation'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2024, batch 2", "source": {"title": "BCSE 2024 Main Examination, General category, Paper I (Dzongkha)", "year": 2024, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'T1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'T1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 6.0, 1 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 4.0, 2 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 5.0, 3 from me_q where key = 'T1';
commit;
