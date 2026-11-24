-- ME Paper I (General, Dzongkha): BCSE 2023, batch 2: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
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
  values ('ME', 'essay', 'འོག་གི་འབྲི་རྩོམ་དོན་ཚན་ ༢ ལས་ ག་འབད་རུང་གཅིག་ གདམ་ཁ་རྐྱབ་སྟེ་ ཚིག་འབྲུ་ ༥༠༠ དེ་ཅིག་གི་ནང་འཁོད་ལུ་ འབྲི་རྩོམ་ཅིག་བྲིས། (སྐུགས་ཀྱི་ཚད་གཞི་ བརྗོད་དོན། ཚིག་སྦྱོར། འབྲི་བཀོད་ཚུ་ལུ་ གཞི་བཞག་སྟེ་སྐུགས་བྱིན་ནི་ཨིན)

༡༽ ད་རེས་ནངས་པ་ ན་གཞོན་ཚུ་གིས་ ཤེས་ཡོན་སྦྱང་ཚར་བའི་ཤུལ་ལུ་ རང་གིས་རང་ལངམ་འབད་ སྡོད་དགོ་པ་ཅིན་ ཚེ་ཧེ་མའི་བསོད་ནམས་ལུ་ བློ་གཏད་དེ་སྡོདཔ་ལས་འདི་ ད་ལྟོ་ལཱ་རྩ་འགེངས་ཏེ་ འབད་བ་ཅིན་དྲག། ཟེར་བའི་སྐོར་ལས་ ཁུངས་བཀལ་ཏེ་ འབྲི་རྩོམ་ཅིག་བྲིས།', 'ལན་གྱི་དཔེ་ (outline)

མགོ་བཙུགས། ད་རེས་ནངས་པ་ ཤེས་ཡོན་མཐར་འཁྱོལ་མི་ ན་གཞོན་ལེ་ཤ་ཅིག་ ཞི་གཡོག་ཡང་ན་ ལཱ་གཡོག་ཡག་ཤོས་ཅིག་ སྒུག་སྡོདཔ་ལས་ ལཱ་མེད་པར་ ཕ་མ་ལུ་བརྟེན་དོ་ཡོདཔ་ཨིན། རང་གིས་རང་ལངམ་འབད་ སྡོད་ནི་འདི་ ཚེ་ཧེ་མའི་བསོད་ནམས་ལུ་ བློ་གཏད་དེ་ སྡོད་ནི་ལས་ ད་ལྟོ་ལཱ་རྩ་འགེངས་ཏེ་ འབད་ནི་འདི་ ལམ་ལེགས་ཤོས་ཨིན།

གཞུང་ཚན།
༡. བསོད་ནམས་ཡོད་རུང་ བརྩོན་འགྲུས་མ་བསྐྱེད་པ་ཅིན་ འབྲས་བུ་མི་སྨིན། ས་བོན་ཡོད་རུང་ ཞིང་མ་རྐོ་བ་ཅིན་ ལོ་ཐོག་མི་འོང་བཟུམ།
༢. ལཱ་ཆུང་ཀུ་ལས་ འགོ་བཙུགས་པ་ཅིན་ ཉམས་མྱོང་དང་ ལག་ཤེས་ཐོབ་སྟེ་ ཤུལ་ལས་ ལཱ་ཡག་ཤོས་ཀྱི་ གོ་སྐབས་འཐོབ།
༣. ཚོང་ལཱ་ཆུང་ཀུ་ སོ་ནམ་ ལག་ཤེས་ཀྱི་ལཱ་ཚུ་གིས་ རང་མགོ་རང་འདྲོང་འབད་ཚུགས་པའི་ཁར་ གཞན་ལུ་ཡང་ ལཱ་གཡོག་བྱིན་ཚུགས།
༤. ལཱ་གི་ཆེ་ཆུང་མ་བལྟ་བར་ དྲང་བདེན་དང་ ཞེ་གཅིག་ཐོག་ལས་ འབད་བ་ཅིན་ མི་སྡེ་ནང་ ཡིད་ཆེས་དང་ གུས་བཀུར་འཐོབ།
༥. ལས་རྒྱུ་འབྲས་དང་འཁྲིལ་ བསོད་ནམས་འདི་ཡང་ ད་ལྟོའི་ལཱ་བཟང་པོ་ཐོག་ལས་ གསོག་ཚུགས།

མཇུག་བསྡུ། ན་གཞོན་ཚུ་གིས་ ལཱ་ལུ་ ཁེ་མེད་བརྩི་མ་དགོ་པར་ ལཱ་རྩ་འགེངས་ཏེ་ བརྩོན་འགྲུས་བསྐྱེད་པ་ཅིན་ རང་གི་མི་ཚེ་དང་ རྒྱལ་ཁབ་ཀྱི་ ཡར་རྒྱས་ལུ་ ཕན་ཐོགས་ཡོད།', null, '[{"point": "མགོ་བཙུགས། རང་མགོ་རང་འདྲོང་ (རང་གིས་རང་ལངམ) གི་དོན་དང་ ན་གཞོན་ཚུ་གི་ ད་ལྟོའི་གནས་སྟངས་ (ལཱ་གཡོག་མེདཔ། གཞན་ལུ་བརྟེན་དགོཔ)", "marks": 6}, {"point": "བསོད་ནམས་ལུ་རྐྱངམ་ཅིག་ བློ་གཏད་དེ་སྡོད་པ་ཅིན་ ཕན་མེད་པའི་རྒྱུ་མཚན། ལཱ་རྩ་འགེངས་ཏེ་ (ལཱ་ལུ་ཁེ་མེད་བརྩི་མ་དགོ་པར) འབད་བ་ཅིན་ ཕན་ཐོགས་ཚུ་ ཁུངས་དང་ དཔེ་དང་བཅས་ (ཉམས་མྱོང་། ལག་ཤེས། ཚོང་ལཱ། སོ་ནམ། བདེ་སྲུང་)", "marks": 12}, {"point": "ལས་རྒྱུ་འབྲས་ - བསོད་ནམས་དང་ བརྩོན་འགྲུས་ཟུང་འབྲེལ། རང་གི་འགན་ཁུར་དང་ རྒྱལ་ཁབ་ལུ་ཕན་པ།", "marks": 6}, {"point": "མཇུག་བསྡུ། འབྲི་བཀོད་དང་ སྐད་ཡིག་ཚད་ལྡན།", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'essay'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper I (Dzongkha)", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'E1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'E1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 12.0, 1 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 7.5, 2 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 10.5, 3 from me_q where key = 'E1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'essay', 'འོག་གི་འབྲི་རྩོམ་དོན་ཚན་ ༢ ལས་ ག་འབད་རུང་གཅིག་ གདམ་ཁ་རྐྱབ་སྟེ་ ཚིག་འབྲུ་ ༥༠༠ དེ་ཅིག་གི་ནང་འཁོད་ལུ་ འབྲི་རྩོམ་ཅིག་བྲིས། (སྐུགས་ཀྱི་ཚད་གཞི་ བརྗོད་དོན། ཚིག་སྦྱོར། འབྲི་བཀོད་ཚུ་ལུ་ གཞི་བཞག་སྟེ་སྐུགས་བྱིན་ནི་ཨིན)

༢༽ དུས་རབས་ ༢༡ པའི་མི་ཚེའི་གནས་སྟངས་ནང་ལུ་ རྒྱལ་ཁབ་ཡར་རྒྱས་ཀྱི་འགྱུར་བ་དང་བསྟུནམ་ད་ རང་ལྕོགས་གྲུབ་ཅན་ཅིག་ལུ་འགྱུར་དགོ་པ་ཅིན་ བརྡ་དོན་འཕྲུལ་རིག་གི་ཤེས་ཡོན་འདི་ སྦྱང་དགོཔ་ཁག་ཆེ་བའི་སྐོར་ལས་བཤད་པ་རྐྱབ་སྟེ་ འབྲི་རྩོམ་ཅིག་བྲིས།', 'ལན་གྱི་དཔེ་ (outline)

མགོ་བཙུགས། བརྡ་དོན་འཕྲུལ་རིག་ཟེར་མི་འདི་ གློག་རིག་ ཁ་པར་ ཡོངས་འབྲེལ་ཚུ་ཐོག་ལས་ བརྡ་དོན་བསྡུ་ནི་ གསོག་འཇོག་འབད་ནི་ སྤེལ་ནི་གི་ ཐབས་ལམ་ཨིན། དུས་རབས་ ༢༡ པ་ནང་ མི་ཚེའི་ཕྱོགས་ག་ར་ལུ་ ཁྱབ་ཡོདཔ་ལས་ སྦྱང་དགོཔ་ཁག་ཆེ།

སྦྱང་དགོ་པའི་རྒྱུ་མཚན།
༡. ལཱ་གཡོག་ - དེང་སང་ ལཱ་གཡོག་ག་ར་ནང་ གློག་རིག་ལག་ལེན་ཤེས་དགོཔ།
༢. ཤེས་ཡོན་ - ཡོངས་འབྲེལ་ཐོག་ལས་ རང་དབང་སྦེ་ ལྷབ་ཚུགས།
༣. གཞུང་གི་ཞབས་ཏོག་ (G2C, NDI) དང་ ཌི་ཇི་ཊཱལ་དངུལ་སྤྲོད་ཚུ་ ལག་ལེན་འཐབ་ནི།
༤. ཚོང་ལཱ་ - ཡོངས་འབྲེལ་ཚོང་ལམ་ཐོག་ལས་ ཚོང་ཁང་སྦོམ་སྦེ་ཡར་རྒྱས།
༥. རྒྱལ་ཁབ་ཀྱི་ ཌི་ཇི་ཊཱལ་འགྱུར་བ་དང་ཅིག་ཁར་ མཉམ་འགྲོ་འབད་ཚུགས་པའི་ རང་ལྕོགས་གྲུབ་ཅན།

ཉེན་ཁ་དང་ ཐབས་ལམ། གློག་ཐོག་ཉེན་སྲུང་། ཟོལ་ཟོབ་ཀྱི་གནས་ཚུལ། ཡོངས་འབྲེལ་ལུ་ བརྟེན་དྲགས་ཉེན། དེ་འབདཝ་ལས་ ཤེས་ཡོན་དང་ ཚོད་འཛིན་དང་བཅས་ ལག་ལེན་འཐབ་དགོ།

མཇུག་བསྡུ། བརྡ་དོན་འཕྲུལ་རིག་ཤེས་ཡོན་འདི་ དེང་སང་གི་ མི་ཚེ་ལུ་ མེད་ཐབས་མེད་པའི་ ལག་ཆ་ཅིག་ཨིནམ་ལས་ ན་གཞོན་ག་ར་གིས་ སྦྱང་དགོ།', null, '[{"point": "མགོ་བཙུགས། བརྡ་དོན་འཕྲུལ་རིག་ (ICT) གི་ངོ་སྤྲོད་དང་ དུས་རབས་ ༢༡ པའི་ གནས་སྟངས།", "marks": 6}, {"point": "སྦྱང་དགོ་པའི་རྒྱུ་མཚན་ (ལཱ་གཡོག་དང་ ཤེས་ཡོན། ཞི་གཡོག་ཞབས་ཏོག་ ཡོངས་འབྲེལ་ཐོག། ཚོང་འབྲེལ་དང་ དངུལ་སྤྲོད། འཛམ་གླིང་དང་འབྲེལ་བ། རང་ལྕོགས་གྲུབ་ཅན)", "marks": 12}, {"point": "ཉེན་ཁ་དང་ ཆ་སྙོམས་ (གློག་ཐོག་ཉེན་སྲུང་། ཟོལ་ཟོབ། ལག་ལེན་ལེགས་ཤོམ)", "marks": 6}, {"point": "མཇུག་བསྡུ། འབྲི་བཀོད་ཚད་ལྡན།", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'essay'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper I (Dzongkha)", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'E2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'E2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 12.0, 1 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 7.5, 2 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 10.5, 3 from me_q where key = 'E2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'འོག་གི་ཡིག་འགྲུལ་གྱི་དྲི་བ་ ཀ་ དང་ ཁ་ གཉིས་ལས་ ག་འབད་རུང་ གཅིག་གི་ལན་བྲིས།

ཀ༽ ཁྱོད་ ཤེས་རིག་ལྷན་ཁག་གི་ མི་སྟོབས་གཙོ་འཛིན་འགོ་དཔོན་ཨིནམ་བཟོ་སྟེ་ ཤེས་རིག་ལྷན་ཁག་ནང་ལུ་ ལས་རིམ་འགོ་དཔོན་ ༥ དང་དེད་གཡོགཔ་ ༢ ཕྱགསམ་འཕྱག་མི་ ༡ འཕྲལ་མགྱོགས་ར་དགོཔ་ཡོདཔ་ལས་ དེའི་སྐོར་ལས་ ས་སྟོང་གསལ་བསྒྲགས་ཅིག་བྲིས།
གསལ་བསྒྲགས་ནང་ འོག་གི་གནད་དོན་ཚུ་ཚུད་དགོ།
- ཤེས་ཚད་དང་ ཉམས་མྱོང་ ལོ་ཚད།
- གདམ་འཐུའི་ ས་གནས་དང་ ཚེས་གྲངས།
- འདི་ནང་ ཁག་ཆེ་བའི་ ཡིག་ཆས་སྐོར།', 'ལན་གྱི་དཔེ།

ཤེས་རིག་ལྷན་ཁག། ཐིམ་ཕུག།
ཡིག་ཨང་། ཤེས་ལྷན/མི་སྟོབས་/༢༠༢༣/......        སྤྱི་ཚེས། ......

ས་སྟོང་གསལ་བསྒྲགས།

ཤེས་རིག་ལྷན་ཁག་ནང་ འོག་གི་ས་སྟོང་ཚུ་ འཕྲལ་མགྱོགས་སྦེ་ བཙུགས་དགོཔ་ཡོདཔ་ལས་ འོས་འབབ་ཡོད་པའི་ འབྲུག་མི་ཚུ་ལས་ ཞུ་ཡིག་ བཙུགས་ཟེར་ གསལ་བསྒྲགས་ཞུཝ་ཨིན།

༡. ལས་རིམ་འགོ་དཔོན་ - ས་སྟོང་ ༥། ཤེས་ཚད་ - མཐོ་རིམ་ཤེས་ཚད་ (འབྲེལ་ཡོད་ཀྱི་ཤེས་ཚན) དང་ ཞི་གཡོག་ཆོས་རྒྱུགས་ཀྱི་ཆ་རྐྱེན་དང་འཁྲིལ། ཉམས་མྱོང་ - ལོ་ ༢ ཡོད་པ་ཅིན་ ཁྱད་པར་དུ་བརྩི། ལོ་ཚད་ - ལོ་ ༢༡-༣༥།
༢. དེད་གཡོགཔ་ - ས་སྟོང་ ༢། ཤེས་ཚད་ - འཛིན་གྲྭ་ ༡༠ པ་ཡང་ན་ ཕྱེད་ཀ་ཤེས་ཚད་ དང་ སྣུམ་འཁོར་དེད་ཀྱི་ལག་ཁྱེར་ (ལྕི་ཡང་ན་ ཡང)། ཉམས་མྱོང་ - ལོ་ ༣། ལོ་ཚད་ - ལོ་ ༢༡-༤༥།
༣. ཕྱགསམ་ - ས་སྟོང་ ༡། ཤེས་ཚད་ - འཛིན་གྲྭ་ ༨ པ་ཡང་ན་ ཀློག་འབྲི་ཤེས་མི། ལོ་ཚད་ - ལོ་ ༡༨-༤༥།

གདམ་འཐུ། ཞུ་ཡིག་མཇུག་ཚེས་ - སྤྱི་ཚེས་ ...... ཚུན། གདམ་འཐུའི་ ས་གནས་ - ཤེས་རིག་ལྷན་ཁག་ ཐིམ་ཕུག། ཚེས་གྲངས་ - ...... (ཞིབ་དཔྱད་དང་ ཞལ་འཕྲད་དྲི་བ)།

དགོས་མཁོའི་ཡིག་ཆ། ཞུ་ཡིག། ཤེས་ཚད་ལག་ཁྱེར་ དང་ ཨང་རྟགས་ཐོ། ངོ་སྤྲོད་ལག་ཁྱེར། ཁྲིམས་བཀག་མེད་པའི་ཡིག་ཆ། ནད་མེད་ཡིག་ཆ། ཉམས་མྱོང་ཡིག་ཆ། (དེད་གཡོགཔ་ - དེད་ཀྱི་ལག་ཁྱེར)། ཡིག་ཆ་ཚུ་ ཐོབ་ཐང་ཡོད་པའི་ འདྲ་བཤུས།

ཁ་གསལ་དགོ་པ་ཅིན་ ཁ་པར་ ...... ལུ་ འབྲེལ་བ་འཐབ་གནང་།

(མཚན་རྟགས)
མི་སྟོབས་གཙོ་འཛིན་འགོ་དཔོན། ཤེས་རིག་ལྷན་ཁག།', null, '[{"point": "མགོ་ཡིག་ (ཤེས་རིག་ལྷན་ཁག) ཡིག་ཨང་ སྤྱི་ཚེས་ དང་ ''ས་སྟོང་གསལ་བསྒྲགས'' མགོ་མིང་།", "marks": 3}, {"point": "ས་སྟོང་ཁ་གསལ་ - ལས་རིམ་འགོ་དཔོན་ ༥། དེད་གཡོགཔ་ ༢། ཕྱགསམ་ ༡ (གནས་རིམ)", "marks": 4}, {"point": "ཤེས་ཚད་ ཉམས་མྱོང་ ལོ་ཚད་ ས་སྟོང་རེ་ལུ་ (དཔེར་ན་ ཤེས་ཚད་མཐོ་རིམ། ཕྱེད་ཀ་ཤེས་ཚད་ དང་ དེད་ལག་ཁྱེར། ལོ་ ༡༨ ལས་ ...)", "marks": 5}, {"point": "གདམ་འཐུའི་ ས་གནས་ ཚེས་གྲངས་ ཞུ་ཡིག་བཙུགས་པའི་ མཇུག་ཚེས། དགོས་མཁོའི་ ཡིག་ཆ་ (ཤེས་ཚད་ལག་ཁྱེར་ ངོ་སྤྲོད་ ཁྲིམས་བཀག་མེད་པའི་ཡིག་ཆ་ ནད་མེད་ཡིག་ཆ་ ...)", "marks": 5}, {"point": "མཚན་རྟགས་ (མི་སྟོབས་གཙོ་འཛིན་འགོ་དཔོན) ཁ་པར་ ཚད་ལྡན་འབྲི་བཀོད།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'formal-writing'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper I (Dzongkha)", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'L1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'L1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 8.0, 1 from me_q where key = 'L1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 5.0, 2 from me_q where key = 'L1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 7.0, 3 from me_q where key = 'L1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'འོག་གི་ཡིག་འགྲུལ་གྱི་དྲི་བ་ ཀ་ དང་ ཁ་ གཉིས་ལས་ ག་འབད་རུང་ གཅིག་གི་ལན་བྲིས།

ཁ༽ ཁྱོད་ མཐོ་རིམ་ཤེས་ཡོན་མཐར་འཁྱོལ་ཡོད་པའི་ སློབ་ཕྲུག་བསོད་ནམས་ཨིནམ་བཟོ་སྟེ་ བཟོ་གྲྭ་ཚོང་འབྲེལ་དང་ལཱ་གཡོག་ལྷན་ཁག་གི་ དྲུང་ཆེན་མཆོག་ལུ་ ཚོང་ལཱ་ཅིག་འགོ་བཙུགས་ནིའི་དོན་ལུ་ རྒྱབ་སྐྱོར་གང་དྲག་མཛད་གནང་ཟེར་ ཞུ་ཡིག་ཅིག་བྲིས།
ཞུ་ཡིག་ནང་ལུ་ འོག་གི་གནད་དོན་ཚུ་ ཚུད་དགོ།
- ཞུ་ཡིག་ ག་ལུ་འབྲིཝ་ཨིན་ན་ ཁ་བྱང་།
- ཚོང་ལཱ་ག་ཅི་འབད་ནི་ཨིན་ན་དང་ འབད་དགོ་པའི་ཁུངས།
- རྒྱབ་སྐྱོར་ ག་ཅི་བཟུམ་དགོ་ནི་ཨིན་ན་ ཁ་གསལ།', 'ལན་གྱི་དཔེ།

སྐུ་མདུན།
དྲུང་ཆེན་མཆོག།
བཟོ་གྲྭ་ཚོང་འབྲེལ་དང་ལཱ་གཡོག་ལྷན་ཁག། ཐིམ་ཕུག།

དོན་ཚན། ཚོང་ལཱ་འགོ་བཙུགས་ནིའི་དོན་ལུ་ རྒྱབ་སྐྱོར་ཞུ་བ།

ང་ བསོད་ནམས་ཟེར་མི་འདི་ ...... ལས་ མཐོ་རིམ་ཤེས་ཡོན་ (......) མཐར་འཁྱོལ་ཡོད་མི་ཅིག་ཨིན། ང་གིས་ ཞི་གཡོག་ཡང་ན་ ལཱ་གཡོག་ སྒུག་སྡོད་ནི་ལས་ རང་མགོ་རང་འདྲོང་གི་ ཚོང་ལཱ་ ...... (དཔེར་ན་ ཉི་མའི་སྐམ་ཕྲུག་བཟོ་ནི་ཡང་ན་ ཨ་རུ་རའི་ཐོན་སྐྱེད) འགོ་བཙུགས་ནི་གི་ འཆར་གཞི་བཟོ་ཡོད།
ཚོང་ལཱ་འདི་གིས་ ནང་འཁོད་ཐོན་སྐྱེད་ ཡར་སེང་འབད་ནི་དང་ ནང་འདྲེན་མར་ཕབ་ ན་གཞོན་ ༥ དེ་ཅིག་ལུ་ ལཱ་གཡོག་བྱིན་ནི་ དེ་ལས་ ས་གནས་ཀྱི་ སོ་ནམ་པ་ཚུ་ལུ་ ཚོང་ལམ་ཐོབ་ནི་གི་ ཕན་ཐོགས་ཡོད།
དེ་འབདཝ་ལས་ ལྷན་ཁག་ལས་ འོག་གི་རྒྱབ་སྐྱོར་ཚུ་ མཛད་གནང་ཟེར་ ཞུ་བ་ཕུལ་ཨིན།
༡. སྐྱིད་ཆ་དམའ་བའི་ བུ་ལོན་ཐོབ་ནིའི་ ཐབས་ལམ།
༢. ཚོང་ལཱ་གི་ཆོག་ཐམ་ མགྱོགས་དྲགས་སྦེ་ ཐོབ་ནི།
༣. ས་ཆ་ཡང་ན་ ཚོང་ཁང་གི་ས་གོ།
༤. ཚོང་ལཱ་འཛིན་སྐྱོང་དང་ ལག་ཤེས་ཀྱི་ སྦྱོང་བརྡར།
༥. ཐོན་སྐྱེད་ཚུ་ ཚོང་ལམ་ལུ་ ལྷོད་ཐབས།
ཟུར་སྦྱར། ཚོང་ལཱ་གི་ འཆར་གཞི་ཁ་གསལ། ཤེས་ཚད་ལག་ཁྱེར་འདྲ་བཤུས། ངོ་སྤྲོད་ལག་ཁྱེར་འདྲ་བཤུས།

ཞུ་མི། (མཚན་རྟགས) བསོད་ནམས། ཁ་པར་ ......
སྤྱི་ཚེས། ......', null, '[{"point": "ཁ་བྱང་ - དྲུང་ཆེན་མཆོག་ བཟོ་གྲྭ་ཚོང་འབྲེལ་དང་ལཱ་གཡོག་ལྷན་ཁག ཐིམ་ཕུག། དོན་ཚན།", "marks": 4}, {"point": "རང་ངོ་སྤྲོད་ (བསོད་ནམས། མཐོ་རིམ་ཤེས་ཡོན་མཐར་འཁྱོལ)། ཚོང་ལཱ་ག་ཅི་ (དཔེར་ན་ སོ་ནམ་ཐོན་སྐྱེད་བཟོ་བཅོས) དང་ འབད་དགོ་པའི་ཁུངས་ (ལཱ་གཡོག། ནང་འཁོད་ཐོན་སྐྱེད། ནང་འདྲེན་མར་ཕབ)", "marks": 7}, {"point": "རྒྱབ་སྐྱོར་ཁ་གསལ་ (བུ་ལོན་སྐྱིད་ཆ་དམའ། ཆོག་ཐམ་ མགྱོགས་དྲགས། ས་ཆ། ལག་ཤེས་སྦྱོང་བརྡར། ཚོང་ལམ)", "marks": 6}, {"point": "ཞེ་ས་ ཞུ་ཐངས་ མཇུག་བསྡུ་ མཚན་རྟགས་ ཚེས་གྲངས།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'formal-writing'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper I (Dzongkha)", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'L2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'L2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 8.0, 1 from me_q where key = 'L2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 5.0, 2 from me_q where key = 'L2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 7.0, 3 from me_q where key = 'L2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'descriptive', 'འོག་གི་གནས་ཚུལ་དེ་ནང་ལས་ ཤེས་དགོ་པའི་ གནད་དོན་ཁག་ཆེ་དྲགས་ཚུ་མ་གཏོགས་ གཞན་དོན་དག་མེད་པའི་ཚིག་དོན་ཚུ་བཏོག་སྟེ་ གནས་ཚུལ་འདི་ ཚིག་འབྲུ་ ༢༠༠ དེ་ཅིག་ནང་ བཅུད་བསྡུས་ཏེ་བྲིས།
ཁ་ཙ་ དགེ་ལེགས་ཕུག་ དཔལ་རི་ཐང་ལུ་ བདེ་སྲུང་ཤོ་ཐེངས་ ༥༦ པའི་སྦྱོང་བརྡར་ལས་རིམ་ནང་ མོ་བཏབ་ཀྱི་དོན་ལས་ གཞི་རྟེན་དམག་སྦྱོང་འབད་མི་ཚུ་གི་ སློབ་སྦྱོང་མཐར་འཁྱོལ་གྱི་རྟེན་འབྲེལ་ནང་ མི་དབང་མངའ་བདག་རིན་པོ་ཆེ་མཆོག་གིས་ དབུ་བཞུགས་གནང་ཡོདཔ་ཨིན་པས། དུས་ཅི་སྤྱི་ཟླ་ ༣ པའི་ནང་འགོ་བཙུགས་མི་ བདེ་སྲུང་ཤོ་ཐེངས་ ༥༦ པའི་སྦྱོང་བརྡར་དེ་ སང་ཕོད་ལས་ ན་གཞོན་ག་ར་གིས་འཐོབ་ནི་ཨིན་མི་ རྒྱལ་སྲུང་སྦྱོང་བརྡར་དང་འབྲེལ་བའི་ དམིགས་བསལ་ལས་རིམ་ཅིག་ མོ་བཏབ་ཀྱི་དོན་ལུ་ འགོ་འདྲེན་འཐབ་ཡོདཔ་ཨིན་པས།
སྦྱོང་བརྡར་ལས་རིམ་དེ་ཡང་ སང་ཕོད་ལས་བྱིན་ནི་ཨིན་མི་ རྒྱལ་སྲུང་སྦྱོང་བརྡར་དང་ཆ་འདྲཝ་སྦེ་ རྒྱལ་སྲུང་སྤེལ་ཁང་གི་ཉེ་འདབས་ལུ་ འགོ་འདྲེན་འཐབ་ཡོདཔ་མ་ཚད་ སང་ཕོད་དུས་ཚོད་འདི་བཟུམ་ཅིག་ནང་ འགོ་བཙུགས་ནི་ཨིན་པའི་དུས་ཚོད་དང་འཁྲིལ་ སྦྱོང་བརྡར་བྱིན་ནུག། ཟླཝ་གསུམ་དང་ཕྱེད་ཀྱི་རིང་བྱིན་མི་ སྦྱོང་བརྡར་ལས་རིམ་དེ་ནང་ ན་གཞོན་ཕོ་མོ་༥༠༠ གིས་བཅའ་མར་གཏོགས་ཡོདཔ་བཞིན་དུ་ དེ་བསྒང་གཞི་རྟེན་དམག་སྦྱོང་དང་། རྒྱལ་ཡོངས་ཤེས་རིག། མི་ཚེ་ལུ་མཁོ་བའི་རིག་རྩལ་གོང་འཕེལ་གཏང་ཐངས་ལ་སོགས་པ་ཚུ་ ལྷབ་སྦྱང་འབད་ཡོདཔ་ཨིན་པས།
སྦྱོང་བརྡར་མཇུག་བསྡུའི་རྟེན་འབྲེལ་ནང་ གསུང་བཤད་གནངམ་དང་འབྲེལ་ མི་དབང་མཆོག་གིས་གསུངས་མི་ནང་ རྒྱལ་ཁབ་ཡར་རྒྱས་གཏང་པའི་ནམ་དུས་ལུ་ ང་བཅས་ཀྱིས་མགྱོགས་སུ་སྦེ་འགྲུབ་ཚུགས་མི་ དམིགས་ཡུལ་ལ་ལུ་ཅིག་ལུ་འབད་རྩོལ་བསྐྱེད་དགོཔ་མ་ཚད་ དམིགས་ཡུལ་གཞན་ཚུ་འགྲུབ་ནི་ལུ་ མི་རབས་ལས་མི་རབས་དང་ ལོ་སྟོང་སྦེ་ཡང་འགོར་འོང་ཟེར་ཨིན་པས།
མི་དབང་མཆོག་གིས་གསུངས་མི་ནང་ འབྲུག་འདི་གཞན་དང་མ་འདྲ་བའི་རྒྱལ་ཁབ་སྦེ་ མི་རབས་ལེ་ཤ་ཅིག་གིས་ ལོ་ངོ་སྟོང་ཕྲག་ལས་བཅད་དེ་ བརྩོན་ཤུགས་བསྐྱེད་གྲུབ་གྲུབ་པའི་ རང་དབང་ཅན་གྱི་རྒྱལ་ཁབ་ཅིག་ཨིནམ་བཞིན་དུ་ འདི་བཟུམ་གྱི་ རྗེས་ཤུལ་བཟང་པོ་འདི་ སྔར་བ་དྲགཔ་སྦེ་སྒྲིང་སྒྲི་བཟོ་ནིའི་དོན་ལུ་ འཕྲོ་མཐུད་དེ་ར་བརྩོན་ཤུགས་བསྐྱེད་དགོཔ་མ་ཚད་ བདེ་སྲུང་དང་རྒྱལ་སྲུང་ལས་རིམ་ཚུ་ ང་བཅས་རའི་ཐུན་མོང་མ་ཡིན་པའི་ངོ་རྟགས་དང་ སྲོལ་རྒྱུན་བཟང་པོ་མི་ཉམས་གོང་འཕེལ་གཏང་ནིའི་ ལྷན་ཐབས་འབད་ནི་ལུ་ཆ་ཤས་ཅིག་ཨིན་ཟེར་གསུངས་གནང་ནུག།
ན་གཞོན་བཅའ་མར་གཏོགས་མི་ཚུ་གིས་ རང་སོའི་ཁས་བླངས་ཐོག་ལས་གདམ་ཁ་རྐྱབ་སྟེ་ སྦྱོང་བརྡར་ལས་རིམ་ནང་གྲལ་གཏོགས་འབད་མི་ལུ་ བཀྲིན་ཆེ་ཟེར་གསུངས་ཡོདཔ་དང་ ལས་རིམ་དེ་ འབྲུག་རྒྱལ་ཁབ་ མདུན་ལམ་གསར་པའི་ནང་ འཛུལ་ཞུགས་འབད་བའི་ཐབས་ལམ་དང་པ་ཅིག་ཨིན་པས། ཁྱེད་ཆ་ཁྱབ་ཀྱིས་ ང་བཅས་རའི་མ་འོངས་པའི་མི་རབས་ཚུ་ གོམ་པ་མདུན་དུ་སྤོ་ནི་ལུ་ ཆ་རོགས་འབད་ཡོདཔ་ལས་ བཀྲིན་དགའ་ཚོར་ཡོད་ཟེར་ མི་དབང་མངའ་ཞབས་མཆོག་གིས་ གསུངས་གནང་ཡོདཔ་ཨིན་པས།
བདེ་སྲུངཔ་ཚུ་གིས་མི་དབང་མཆོག་ལུ་ རུ་སྒྲིག་གི་ཐོག་ལས་སྟི་སྭོ་ཞུ་ཡོདཔ་བཞིན་དུ་ སློབ་སྦྱོང་མཇུག་བསྡུ་གི་རྟེན་འབྲེལ་བརྩི་སྲུང་ཞུ་ཚར་བའི་ཤུལ་ལུ་ མི་དབང་མངའ་བདག་རིན་པོ་ཆེ་མཆོག་གིས་ དགེ་ལེགས་ཕུག་རྟ་རས་ཐང་ལུ་ རྒྱལ་སྲུང་སྤེལ་ཁང་གི་ས་ཁོངས་ནང་ གཟིགས་ཞིབ་གནང་ཡོད་པའི་གནས་ཚུལ།།', 'ལན་གྱི་དཔེ།

མི་དབང་མངའ་བདག་རིན་པོ་ཆེ་མཆོག་གིས་ ཁ་ཙ་ དགེ་ལེགས་ཕུག་ དཔལ་རི་ཐང་ལུ་ བདེ་སྲུང་ཤོ་ཐེངས་ ༥༦ པའི་ སྦྱོང་བརྡར་མཐར་འཁྱོལ་གྱི་ རྟེན་འབྲེལ་ནང་ དབུ་བཞུགས་གནང་ནུག། སྦྱོང་བརྡར་འདི་ སང་ཕོད་ལས་ ན་གཞོན་ག་ར་གིས་ འཐོབ་ནི་ཨིན་མི་ རྒྱལ་སྲུང་སྦྱོང་བརྡར་གྱི་ མོ་བཏབ་ཀྱི་དོན་ལུ་ སྤྱི་ཟླ་ ༣ པ་ལས་ ཟླཝ་ ༣ དང་ཕྱེད་ཀྱི་རིང་ འགོ་འདྲེན་འཐབ་མི་ཅིག་ཨིན། ན་གཞོན་ཕོ་མོ་ ༥༠༠ གིས་ གཞི་རྟེན་དམག་སྦྱོང་དང་ རྒྱལ་ཡོངས་ཤེས་རིག་ མི་ཚེ་ལུ་མཁོ་བའི་ རིག་རྩལ་ཚུ་ ལྷབ་ནུག།
མི་དབང་མཆོག་གིས་ རྒྱལ་ཁབ་ཡར་རྒྱས་ཀྱི་ དམིགས་ཡུལ་ལ་ལུ་ཅིག་ མགྱོགས་སུ་ འགྲུབ་ཚུགས་རུང་ ལ་ལུ་ཅིག་ མི་རབས་ལས་མི་རབས་ ལོ་སྟོང་སྦེ་ཡང་ འགོར་འོང་ཟེར་ གསུངས་ནུག། འབྲུག་འདི་ མི་རབས་ལེ་ཤ་གིས་ བརྩོན་ཤུགས་བསྐྱེད་དེ་ བཙུགས་པའི་ རང་དབང་ཅན་གྱི་ རྒྱལ་ཁབ་ཅིག་ཨིནམ་ལས་ རྗེས་ཤུལ་བཟང་པོ་འདི་ སྒྲིང་སྒྲི་བཟོ་ནིའི་དོན་ལུ་ བརྩོན་ཤུགས་བསྐྱེད་དགོཔ་དང་ བདེ་སྲུང་དང་ རྒྱལ་སྲུང་ལས་རིམ་ཚུ་ ང་བཅས་རའི་ ངོ་རྟགས་དང་ སྲོལ་རྒྱུན་ཉམས་སྲུང་གི་ ཆ་ཤས་ཨིན་ཟེར་ གསུངས་ནུག།
མི་དབང་མཆོག་གིས་ རང་སོའི་ཁས་བླངས་ཐོག་ལས་ གྲལ་གཏོགས་འབད་མི་ ན་གཞོན་ཚུ་ལུ་ བཀྲིན་ཆེ་ཟེར་ གསུངས་ཏེ་ ལས་རིམ་འདི་ མདུན་ལམ་གསར་པའི་ གོམ་པ་དང་པ་ཨིན་ཟེར་ གསུངས་ནུག། དེ་ལས་ དགེ་ལེགས་ཕུག་ རྟ་རས་ཐང་ལུ་ རྒྱལ་སྲུང་སྤེལ་ཁང་གི་ ས་ཁོངས་ལུ་ གཟིགས་ཞིབ་གནང་ནུག།', null, '[{"point": "མི་དབང་མཆོག་གིས་ དགེ་ལེགས་ཕུག་ དཔལ་རི་ཐང་ལུ་ བདེ་སྲུང་ཤོ་ཐེངས་ ༥༦ པའི་ (རྒྱལ་སྲུང་གི་ མོ་བཏབ) སྦྱོང་བརྡར་མཐར་འཁྱོལ་ནང་ དབུ་བཞུགས། ཟླ་ ༣ ལས་འགོ་བཙུགས། ཟླཝ་ ༣ དང་ཕྱེད། ན་གཞོན་ ༥༠༠། ལྷབ་ཚན་ (དམག་སྦྱོང་ རྒྱལ་ཡོངས་ཤེས་རིག་ མི་ཚེའི་རིག་རྩལ)", "marks": 4}, {"point": "མི་དབང་མཆོག་གི་གསུང་ - དམིགས་ཡུལ་ལ་ལུ་ཅིག་ མགྱོགས་སུ་འགྲུབ། ལ་ལུ་ མི་རབས་དང་ ལོ་སྟོང་འགོར། རང་དབང་ཅན་གྱི་ རྒྱལ་ཁབ། བདེ་སྲུང་དང་ རྒྱལ་སྲུང་ ངོ་རྟགས་ཉམས་སྲུང་། ན་གཞོན་ཚུ་ལུ་ བཀྲིན་ཆེ། ལམ་གསར་གྱི་ གོམ་པ་དང་པ།", "marks": 4}, {"point": "ཚིག་འབྲུ་ ༢༠༠ དེ་ཅིག་ རང་གི་ཚིག་ཐོག་ལུ། (རྒྱལ་སྲུང་སྤེལ་ཁང་ལུ་ གཟིགས་ཞིབ)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'pr-cis'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper I (Dzongkha)", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'P1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'P1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 4.0, 1 from me_q where key = 'P1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 2.5, 2 from me_q where key = 'P1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 3.5, 3 from me_q where key = 'P1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'འོག་ལུ་བཀོད་ཡོད་མི་ དྲི་བ་ ཀ་ དང་ ཁ་ གཉིས་ཆ་རའི་ལན་བྲིས།
ཀ༽ སྐད་ཡིག་གི་དྲི་བ། འོག་ལུ་བཀོད་དེ་ཡོད་མི་ དྲི་བ་ག་རའི་ལན་བྲིས། སྐུགས་༥ །
༡༽ འབྲུག་རྒྱལ་ཁབ་ཀྱི་ཁ་སྐད་ རྫོང་ཁ་ཟེར་མི་འདི་ལུ་ མིང་གི་རྣམ་གྲངས་གཉིས་བྲིས།
༢༽ བུ་/བུམོ་ གི་གཟུགས་དང་གདོང་ལུ་བསྟོད་པ་རྐྱབ་སྟེ་ དཔེ་རེ་བཀོད་དགོ་པ་ཅིན་ ག་ཅི་ར་བཀོད་ནི་སྨོ?
༣༽ རིན་པོ་ཆེའི་ཡི་གུ་ཚུ་ཞུ་སྟེ་ དགེ་སློང་ལུ་ཕུལ་དགོ། ཟེར་བའི་སྐབས་ ཞེ་སའི་ཐོབ་ཐངས་ལེགས་བཅོས་འབད།
༤༽ ལ་མ་བརྒལ་ལབ་རྩ་སྦུག། ཆུ་མ་བརྒལ་ཟམ་པའི་སྦུག། ཟེར་བའི་དཔེ་འདི་གི་དོན་དག་བྲིས།
༥༽ ང་གི་ཁྱིམ་ནང་ལུ་ལྟོ་བཟོ་སྟེ་བཞག་ཡོད། ཟེར་བའི་སྐབས་ལུ་ རྫོང་ཁ་སླབ་ཐངས་ལུ་ འཛོལ་བ་འདུག་ག?
ཡོད་པ་ཅིན་དག་བཅོས་འབད་དེ་བྲིས།
ཁ༽ འོག་ལུ་ཨང་གྲངས་བཀོད་ཡོད་པའི་ས་སྟོང་ནང་ ཕྲད་དང་རྣམ་དབྱེ་ཚུ་ ག་འོས་འབབ་ཡོད་ག་ ཐིག་སྒྲོམ་ནང་ལས་ གདམ་ཁ་རྐྱབ་ཞིནམ་ལས་ ཨང་གྲངས་དང་སྦྲགས་ཏེ་ ལན་ཤོག་ནང་བྲིས།
སྐུགས་༥ །
ཡང་ དེ་ གི་ དང་ སྦེ་ ཀྱི་ འབད་ ཏེ་ གྱི་ གིས་ ལུ་
༉ རྒྱལ་ཡོངས་དགའ་སྐྱིད་དཔལ་འཛོམས་་་་་་་་(༡)་་་་་་ལྟ་བ་འདི་ གཞན་རྒྱལ་ཁབ་ག་དང་ཡང་ མ་འདྲ་བའི་གོང་འཕེལ་་་་་་་་(༢)་་་་་་་་འཆར་སྣང་ཅིག་ཨིན། འདི་ཡང་ མི་དབང་འབྲུག་རྒྱལ་བཞི་པ་མཆོག་་་་་་་་་་(༣)་་་་་་་་་སྤྱི་ལོ་༡༩༨༠ མཇུག་བསྡུ་རན་ཁམས་་་་་་་་(༤)་་་་་་་་་་བརྩམས་གནང་ནུག། རྒྱལ་ཡོངས་དགའ་སྐྱིད་ཡར་རྒྱས་ གཏང་ནི་འདི་་་་་་(༥)་་་་་གཙོ་བོ་གོང་འཕེལ་ལས་རིམ་གྱི་གཞི་རྟེན་འབད་འགོ་བཙུགས་་་་་་་(༦)་་་་་་གོང་འཕེལ་གྱི་ལས་རིམ་དུས་ཡུན་རིངམོ་་་་་་(༧)་་་་་་དོན་ལུ་ལམ་སྟོན་འབད་ཡོདཔ་མ་ཚད་ ང་བཅས་སྔར་སྲོལ་གོང་འཕེལ་གྱི་ལམ་ལུགས་་་་་(༨)་་་་་གིས་ རང་དོན་གྱི་དཔལ་འབྱོར་གོང་འཕེལ་རྐྱངམ་གཅིག་མེན་པར་ སྤྱི་སྙོམས་ཀྱི་ནང་པའི་ཆོས་ལུགས་་་་་་་(༩)་་་་་་མཐུན་པའི་རྟགས་མཚན་འདི་གིས་ ཕྱིའི་རྒྱལ་ཁབ་ཚུ་གིས་ཡང་ ལེགས་ཤོམ་སྦེ་ཧ་གོ་སྟེ་ ངོས་ལེན་་་་་་(༡༠)་་་་་་ཡོདཔ་ཨིན།', 'a)
༡༽ འབྲུག་སྐད། ལྷོ་སྐད། (ལྷོ་མོན་གྱི་སྐད)
༢༽ ཞལ་རས་ - ཟླ་བ་ཉ་གང་བཟུམ་ ཡིད་འོང་། མིག་ - འཇའ་ཚོན་ཡང་ན་ ཨུཏྤལ་གྱི་འདབ་མ་བཟུམ། གཟུགས་པོ་ - ཤིང་སྡོང་ ཕུལ་བཟུམ་ ཁྲུང་ཁྲུང་།
༣༽ རིན་པོ་ཆེའི་ ཕྱག་ཡིག་ཚུ་ ཞུ་སྟེ་ དགེ་སློང་ལུ་ ཕུལ་དགོ།
༤༽ ལ་མ་བརྒལ་བའི་ཧེ་མར་ ལབ་རྩ་ཕུལ་ནི་དང་ ཆུ་མ་བརྒལ་བའི་ཧེ་མར་ ཟམ་པ་ལུ་ བཀོ་བཞག་འབད་ནི་བཟུམ་ - ལཱ་ཅིག་ མཐར་མ་འཁྱོལ་བའི་ཧེ་མར་ ངལ་རངས་འབད་ནི་དང་ རང་ལུ་རྒྱབ་སྐྱོར་འབད་མི་ཚུ་ བཀོ་བཞག་མ་འབད་ཟེར་བའི་ དོན་ཨིན།
༥༽ འཛོལ་བ་ཡོད། ངེ་གི་ཁྱིམ་ནང་ ལྟོ་བཟོ་སྟེ་ བཞག་ཡོད།

b)
༡ ཀྱི། ༢ གྱི། ༣ གིས། ༤ ལུ། ༥ ཡང་། ༦ ཏེ། ༧ གི། ༨ དེ། ༩ དང་། ༡༠ འབད།', null, '[{"point": "a) ༡ འབྲུག་སྐད། ལྷོ་སྐད་ (རྣམ་གྲངས) ༢ གཟུགས་དང་གདོང་ལུ་ དཔེ་རེ་ (དཔེར་ན་ ཞལ་རས་ཉ་ཟླ་བཟུམ། གཟུགས་པོ་ ཤིང་སྡོང་ཕུལ་བཟུམ) ༣ ཡི་གུ་ ➝ ཕྱག་ཡིག ༤ ལཱ་མཐར་མ་འཁྱོལ་བའི་ཧེ་མར་ ངལ་རངས་འབད་ནི་དང་ རྒྱབ་སྐྱོར་འབད་མི་ཚུ་ བཀོ་བཞག་མ་འབད། ༥ ང་གི་ ➝ ངེ་གི་ / ནང་ལུ་ ➝ ནང་", "marks": 5}, {"point": "b) ༡ ཀྱི ༢ གྱི ༣ གིས ༤ ལུ ༥ ཡང ༦ ཏེ ༧ གི ༨ དེ ༩ དང ༡༠ འབད (ལྷག་ - སྦེ)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'language-and-spelling'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing.", "Grammar answers need a Dzongkha teacher''s confirmation (especially part (a) items 1, 3 and 4 and the blanks in part (b))."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper I (Dzongkha)", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'G1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'G1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 4.0, 1 from me_q where key = 'G1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 2.5, 2 from me_q where key = 'G1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 3.5, 3 from me_q where key = 'G1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'འོག་གི་གནས་ཚུལ་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བ་ག་རའི་ལན་བྲིས།
རྒྱལ་སྤྱི་ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་ལས་ འབྲུག་གི་ཞི་བདེ་དམག་མི་ཚུ་ལུ་ལེགས་བསྟོད།
༉ སྤྱི་ལོ་ ༢༠༡༤ ཟླ་ ༩ པ་ལས་ཚུར་ འབྲུག་ལས་འཛམ་གླིང་སྤྱི་ཚོགས་ཀྱི་ ཞི་བདེ་དམག་སྡེའི་ནང་ ཞི་བདེ་སྲུང་མི་ཚུ་ ལྷན་ཐབས་འབད་བའི་ དཔའ་ཉམས་བསྐྱེད་མི་ལུ་ ལེགས་བསྟོད་འབདཝ་དང་འབྲེལ་ འཛམ་གླིང་སྤྱི་ཚོགས་ཞི་བདེ་ལས་སྡེའི་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་ ཇེན་པི་ཡར་ལ་ཀོསི་གིས་ འཛམ་གླིང་སྤྱི་ཚོགས་ལུ་ འབྲུག་གི་ཞི་བདེ་དམག་མི་ཚུ་དང་ཉམས་མྱོང་མ་བཏུབ་བཏུབ་སྦེ་ ཐོབ་སྟེ་ཡོད་ཟེར་བཤདཔ་ཨིན་པས།
འབྲུག་གིས་འཛམ་གླིང་སྤྱི་ཚོགས་དང་ ཞི་བདེ་སྲུང་སྐྱོབ་ལས་དོན་ནང་ ལྷན་ཐབས་དང་ཆ་རོགས་གང་དྲག་འབད་མི་ལུ་ ང་བཅས་ལུ་ ཡིད་ཆེས་ངལ་རངས་དང་དཔའ་ཉམས་སྦོམ་བྱུང་སྟེ་ཡོད་ཟེར་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ བཤད་པའི་ཁར་ ད་ལྟོ་འབྲུག་པའི་ཞི་བདེ་དམག་མི་ཚུ་གིས་ ས་གནས་ ༧ ནང་ཕྱག་ཞུ་བའི་བསྒང་ཡོད་མི་ལས་ སྡེ་ཚན་སྦོམ་ཤོས་ར་ སེན་ཊཱལ་ཨཱཕ་རི་ཀ་རི་པབ་ལིག་རྒྱལ་ཁབ་ནང་ཡོད་ཟེར་བཤད་ཅི།
ད་རུང་ ལས་སྡེ་དེ་གིས་ འབྲུག་གི་དབང་འཛིན་ཚུ་དང་མཉམ་འབྲེལ་ཐོག་ལས་ ཞི་བདེ་དམག་མི་ཚུ་ གཞན་ཁར་བགོ་བཀྲམ་འབད་ནིའི་གདམ་ཁ་དང་འོས་འབབ་ཚུ་ཡང་ བལྟ་ནི་གི་སྤྲོ་བ་ཡོད་ཟེར་ ཁོ་གིས་ཀུན་གསལ་ལུ་བཤད་ཡོདཔ་དང་འབྲུག་གི་ཧོངས་ལས་ ཞི་བདེ་དམག་མི་ཚུ་ རྒྱལ་སྤྱི་ལུ་གཏང་ནིའི་དོན་ལས་ དམག་སྡེ་དང་ཁྲིམས་སྲུང་འགག་སྡེ་ལུ་ སྦྱོང་བརྡར་བྱིན་ཏེ་ གྲ་སྒྲིག་འབད་མི་ལུ་ འཛམ་གླིང་སྤྱི་ཚོགས་ཀྱིས་ངོས་ལེན་འབདཝ་མ་ཚད་ དེ་བཟུམ་མའི་བརྩོན་ཤུགས་བསྐྱེད་མི་ལུ་ རྒྱབ་སྐྱོར་འབད་ཆོག་ཆོ་ཡོད་ཟེར་བཤདཔ་ཨིན་པས།
དེ་འབདཝ་ད་ དམག་མི་བགོ་བཀྲམ་འབད་ནིའི་དུས་ཚོད་དང་ གོ་སྐབས་ཚུ་འཐོན་ནི་དེ་ ངེས་པ་མེད་མི་དེ་ཡང་ ཞི་བདེ་དམག་མིའི་དགོས་མཁོ་བསྒྱུར་བཅོས་དང་ རྒྱལ་ཁབ་ལ་ལུ་ཅིག་ནང་ ཞི་བདེ་དམག་སྡེ་སྒོ་བསྡམ་དགོཔ་འཐོན་མི་ལུ་བརྟེན་ཨིན་ཟེར་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་བཤདཔ་ཨིན་རུང་ མ་འོངས་པ་ལུ་བགོ་བཀྲམ་འབད་དགོཔ་ཐོན་པ་ཅིན་གོ་སྐབས་ཚུ་འབྲུག་ལུ་བྱིན་འོང་ཟེར་ཨིན་པས།
འཕྲལ་ཁམས་ཅིག་ཁར་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ སེན་ཊཱལ་ཨཱཕ་རི་ཀ་རི་པབ་ལིག་ལུ་ ལྟ་སྐོར་འབད་བའི་སྐབས་ འབྲུག་གི་དམག་མི་སྡེ་ཚན་དང་ཕྱད་ཡོདཔ་ད་ འབྲུག་མི་ཚུ་གིས་ཞི་བདེ་སྲུང་ནིའི་དོན་ལས་ གནས་ཚད་མཐོ་བའི་གྲ་སྒྲིག་དང་། ཁྱད་རིག། དེ་ལས་དད་དམ་གྱི་སྒོ་ལས་ཕྱག་ཞུ་མི་ལུ་ ཁོ་གིས་ལེགས་བསྟོད་འབད་ཡོདཔ་ཨིན།
ཁོ་གིས་འབད་བ་ཅིན་ འབྲུག་གི་ཞི་བདེ་དམག་མི་ཚུ་གིས་ ཕྱག་ཕྱིད་གང་དྲག་ཞུ་མི་དེ་གིས་ སེན་ཊཱལ་ཨཱཕ་རི་ཀ་རི་པབ་ལིག་རྒྱལ་ཁབ་ལུ་ ཕན་ཐོགས་བྱུང་མི་གིས་མ་དོ་བར་ ལུང་ཕྱོགས་ཡོངས་ལུ་ཞི་བདེ་བརྟན་ཏོག་ཏོ་སྦེ་གནས་ནི་ལུ་ ཕན་ཁྱད་བཟོ་ནུག་ཟེར་ཨིན་པས། དེ་མ་ཚད་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ མི་སྡེ་ཚུ་ནང་བློ་གཏད་ཡིད་ཆེས་སྒྲིང་སྒྲི་ཡོདཔ་བཟོ་ཐབས་ལུ་ ཞི་བདེའི་ལས་རིམ་ནང་ ཨམ་སྲུ་མངམ་བགོ་བཀྲམ་འབད་དགོཔ་སྦེ་ འབྲུག་ལུ་རྒྱུད་བསྐུལ་འབདཝ་ཨིན་པས།
དེ་ལས་ ཕྱི་འབྲེལ་དང་ཕྱིར་ཚོང་བློན་པོ་ ཌོག་ཊར་རྟ་མགྲིན་རྡོ་རྗེ་གིས་ མགྲོན་བརྡ་ཕུལཝ་བཞིན་དུ་ ཇེན་པི་ཡར་ལ་ཀོསི་དེ་ འབྲུག་རྒྱལ་ཁབ་ནང་ སྤྱི་ཟླ་ ༦ པའི་ཚེས་ ༣༠ ལས་སྤྱི་ཟླ་ ༧ པའི་ཚེས་ ༣ ཚུན་ གཞུང་འབྲེལ་ལྟ་སྐོར་ལུ་ལྷོད་ཡོདཔ་དང་། ནིའུ་ཡོག་ལུ་ཡོད་མི་ འཛམ་གླིང་སྤྱི་ཚོགས་ཡིག་ཚང་གཙོ་ཁང་གི་ ཞི་བདེ་ལག་ལེན་ལས་ཁུངས་ལས་ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ འབྲུག་ལུ་ལྟ་སྐོར་འབད་མི་དེ་ ཆེ་མཐོའི་གནས་རིམ་ནང་གཟིགས་སྐོར་དང་པ་ཨིན་པས།
ལྟ་སྐོར་གྱི་སྐབས་ལུ་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ མི་དབང་མངའ་བདག་རིན་པོ་ཆེའི་ སྐུ་མདུན་ལུ་བཅར་ཡོདཔ་མ་ཚད་ བློན་ཆེན་ཌོག་ཊར་ བློ་གྲོས་ཚེ་རིང་དང་། ཕྱི་འབྲེལ་བློན་པོ་ཌོག་ཊར་རྟ་མགྲིན་རྡོ་རྗེ། འབྲུག་གི་བསྟན་སྲུང་དམག་སྡེའི་གཙོ་འཛིན་སྤྱི་ཁྱབ་ གུང་བློན་བ་ཀྲོ་ཚེ་རིང་། དེ་ལས་ གཞུང་གི་ཆེ་མཐོའི་འགོ་དཔོན་ཚུ་དང་ ཕྱད་ཡོདཔ་ཨིན་པས།
འབྲུག་ལུ་ཉིན་གྲངས་ ༣ གྱི་རིང་ ལྟ་སྐོར་འབདཝ་ད་ ཁོ་གིས་ཐིམ་ཕུག་རྟ་བབ་ལུ་ འཛམ་གླིང་སྤྱི་ཚོགས་ཞི་བདེ་དྲག་དམག་ལྟེ་བ་དང་ སྤ་རོ་ཤར་པ་ལུ་འབྲུག་གི་འཛམ་གླིང་སྤྱི་ཚོགས་དམག་སྡེའི་ས་ཁོངས་ དེ་ལས་རྒྱལ་རབས་ཅན་དང་ ལམ་སྲོལ་གྱི་ས་ཁོངས་ཚུ་ནང་ ལྟ་སྐོར་འབད་ནུག།

འོག་ལུ་བཀོད་ཡོད་མི་ དྲི་བ་ག་རའི་ལན་བྲིས། སྐུགས་༥x༣=༡༥ །
༡༽ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ ཉིན་གྲངས་ ༣ གྱི་གཞུང་འབྲེལ་ལྟ་སྐོར་ཀྱི་སྐབས་ལུ་ ས་གནས་ གལ་ཅན་༣ ག་ཏེ་ལུ་ ལྟ་སྐོར་འབད་ཡི་ག? དེ་ལས་ གལ་ཆེ་བའི་མི་ངོམ་ ག་དང་ཕྱད་ཡོདཔ་ཨིན་ན་ ༣ གི་མཚན་བྲིས།', 'ས་གནས། ༡. ཐིམ་ཕུག་རྟ་བབ་ལུ་ འཛམ་གླིང་སྤྱི་ཚོགས་ཞི་བདེ་དྲག་དམག་ལྟེ་བ། ༢. སྤ་རོ་ཤར་པ་ལུ་ འབྲུག་གི་ འཛམ་གླིང་སྤྱི་ཚོགས་དམག་སྡེའི་ས་ཁོངས། ༣. རྒྱལ་རབས་ཅན་དང་ ལམ་སྲོལ་གྱི་ས་ཁོངས་ཚུ།
མི་ངོམ། ༡. མི་དབང་མངའ་བདག་རིན་པོ་ཆེ་མཆོག། ༢. བློན་ཆེན་ ཌོག་ཊར་བློ་གྲོས་ཚེ་རིང་། ༣. ཕྱི་འབྲེལ་བློན་པོ་ ཌོག་ཊར་རྟ་མགྲིན་རྡོ་རྗེ། (གུང་བློན་བ་ཀྲོ་ཚེ་རིང་ཡང་ ཕྱད་ཡོད།)', null, '[{"point": "ས་གནས་ ༣ - ཐིམ་ཕུག་རྟ་བབ་ཀྱི་ ཞི་བདེ་དྲག་དམག་ལྟེ་བ། སྤ་རོ་ཤར་པའི་ དམག་སྡེའི་ས་ཁོངས། རྒྱལ་རབས་དང་ ལམ་སྲོལ་གྱི་ས་ཁོངས། མི་ངོམ་ ༣ - མི་དབང་མཆོག། བློན་ཆེན་ཌོག་ཊར་བློ་གྲོས་ཚེ་རིང་། ཕྱི་འབྲེལ་བློན་པོ་ཌོག་ཊར་རྟ་མགྲིན་རྡོ་རྗེ་ (ཡང་ན་ གུང་བློན་བ་ཀྲོ་ཚེ་རིང)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper I (Dzongkha)", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-general-1-2023b2-c1', 1, null, null, null, null)
  returning id
)
insert into me_q select 'C1a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'C1a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'འོག་གི་གནས་ཚུལ་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བ་ག་རའི་ལན་བྲིས།
རྒྱལ་སྤྱི་ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་ལས་ འབྲུག་གི་ཞི་བདེ་དམག་མི་ཚུ་ལུ་ལེགས་བསྟོད།
༉ སྤྱི་ལོ་ ༢༠༡༤ ཟླ་ ༩ པ་ལས་ཚུར་ འབྲུག་ལས་འཛམ་གླིང་སྤྱི་ཚོགས་ཀྱི་ ཞི་བདེ་དམག་སྡེའི་ནང་ ཞི་བདེ་སྲུང་མི་ཚུ་ ལྷན་ཐབས་འབད་བའི་ དཔའ་ཉམས་བསྐྱེད་མི་ལུ་ ལེགས་བསྟོད་འབདཝ་དང་འབྲེལ་ འཛམ་གླིང་སྤྱི་ཚོགས་ཞི་བདེ་ལས་སྡེའི་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་ ཇེན་པི་ཡར་ལ་ཀོསི་གིས་ འཛམ་གླིང་སྤྱི་ཚོགས་ལུ་ འབྲུག་གི་ཞི་བདེ་དམག་མི་ཚུ་དང་ཉམས་མྱོང་མ་བཏུབ་བཏུབ་སྦེ་ ཐོབ་སྟེ་ཡོད་ཟེར་བཤདཔ་ཨིན་པས།
འབྲུག་གིས་འཛམ་གླིང་སྤྱི་ཚོགས་དང་ ཞི་བདེ་སྲུང་སྐྱོབ་ལས་དོན་ནང་ ལྷན་ཐབས་དང་ཆ་རོགས་གང་དྲག་འབད་མི་ལུ་ ང་བཅས་ལུ་ ཡིད་ཆེས་ངལ་རངས་དང་དཔའ་ཉམས་སྦོམ་བྱུང་སྟེ་ཡོད་ཟེར་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ བཤད་པའི་ཁར་ ད་ལྟོ་འབྲུག་པའི་ཞི་བདེ་དམག་མི་ཚུ་གིས་ ས་གནས་ ༧ ནང་ཕྱག་ཞུ་བའི་བསྒང་ཡོད་མི་ལས་ སྡེ་ཚན་སྦོམ་ཤོས་ར་ སེན་ཊཱལ་ཨཱཕ་རི་ཀ་རི་པབ་ལིག་རྒྱལ་ཁབ་ནང་ཡོད་ཟེར་བཤད་ཅི།
ད་རུང་ ལས་སྡེ་དེ་གིས་ འབྲུག་གི་དབང་འཛིན་ཚུ་དང་མཉམ་འབྲེལ་ཐོག་ལས་ ཞི་བདེ་དམག་མི་ཚུ་ གཞན་ཁར་བགོ་བཀྲམ་འབད་ནིའི་གདམ་ཁ་དང་འོས་འབབ་ཚུ་ཡང་ བལྟ་ནི་གི་སྤྲོ་བ་ཡོད་ཟེར་ ཁོ་གིས་ཀུན་གསལ་ལུ་བཤད་ཡོདཔ་དང་འབྲུག་གི་ཧོངས་ལས་ ཞི་བདེ་དམག་མི་ཚུ་ རྒྱལ་སྤྱི་ལུ་གཏང་ནིའི་དོན་ལས་ དམག་སྡེ་དང་ཁྲིམས་སྲུང་འགག་སྡེ་ལུ་ སྦྱོང་བརྡར་བྱིན་ཏེ་ གྲ་སྒྲིག་འབད་མི་ལུ་ འཛམ་གླིང་སྤྱི་ཚོགས་ཀྱིས་ངོས་ལེན་འབདཝ་མ་ཚད་ དེ་བཟུམ་མའི་བརྩོན་ཤུགས་བསྐྱེད་མི་ལུ་ རྒྱབ་སྐྱོར་འབད་ཆོག་ཆོ་ཡོད་ཟེར་བཤདཔ་ཨིན་པས།
དེ་འབདཝ་ད་ དམག་མི་བགོ་བཀྲམ་འབད་ནིའི་དུས་ཚོད་དང་ གོ་སྐབས་ཚུ་འཐོན་ནི་དེ་ ངེས་པ་མེད་མི་དེ་ཡང་ ཞི་བདེ་དམག་མིའི་དགོས་མཁོ་བསྒྱུར་བཅོས་དང་ རྒྱལ་ཁབ་ལ་ལུ་ཅིག་ནང་ ཞི་བདེ་དམག་སྡེ་སྒོ་བསྡམ་དགོཔ་འཐོན་མི་ལུ་བརྟེན་ཨིན་ཟེར་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་བཤདཔ་ཨིན་རུང་ མ་འོངས་པ་ལུ་བགོ་བཀྲམ་འབད་དགོཔ་ཐོན་པ་ཅིན་གོ་སྐབས་ཚུ་འབྲུག་ལུ་བྱིན་འོང་ཟེར་ཨིན་པས།
འཕྲལ་ཁམས་ཅིག་ཁར་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ སེན་ཊཱལ་ཨཱཕ་རི་ཀ་རི་པབ་ལིག་ལུ་ ལྟ་སྐོར་འབད་བའི་སྐབས་ འབྲུག་གི་དམག་མི་སྡེ་ཚན་དང་ཕྱད་ཡོདཔ་ད་ འབྲུག་མི་ཚུ་གིས་ཞི་བདེ་སྲུང་ནིའི་དོན་ལས་ གནས་ཚད་མཐོ་བའི་གྲ་སྒྲིག་དང་། ཁྱད་རིག། དེ་ལས་དད་དམ་གྱི་སྒོ་ལས་ཕྱག་ཞུ་མི་ལུ་ ཁོ་གིས་ལེགས་བསྟོད་འབད་ཡོདཔ་ཨིན།
ཁོ་གིས་འབད་བ་ཅིན་ འབྲུག་གི་ཞི་བདེ་དམག་མི་ཚུ་གིས་ ཕྱག་ཕྱིད་གང་དྲག་ཞུ་མི་དེ་གིས་ སེན་ཊཱལ་ཨཱཕ་རི་ཀ་རི་པབ་ལིག་རྒྱལ་ཁབ་ལུ་ ཕན་ཐོགས་བྱུང་མི་གིས་མ་དོ་བར་ ལུང་ཕྱོགས་ཡོངས་ལུ་ཞི་བདེ་བརྟན་ཏོག་ཏོ་སྦེ་གནས་ནི་ལུ་ ཕན་ཁྱད་བཟོ་ནུག་ཟེར་ཨིན་པས། དེ་མ་ཚད་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ མི་སྡེ་ཚུ་ནང་བློ་གཏད་ཡིད་ཆེས་སྒྲིང་སྒྲི་ཡོདཔ་བཟོ་ཐབས་ལུ་ ཞི་བདེའི་ལས་རིམ་ནང་ ཨམ་སྲུ་མངམ་བགོ་བཀྲམ་འབད་དགོཔ་སྦེ་ འབྲུག་ལུ་རྒྱུད་བསྐུལ་འབདཝ་ཨིན་པས།
དེ་ལས་ ཕྱི་འབྲེལ་དང་ཕྱིར་ཚོང་བློན་པོ་ ཌོག་ཊར་རྟ་མགྲིན་རྡོ་རྗེ་གིས་ མགྲོན་བརྡ་ཕུལཝ་བཞིན་དུ་ ཇེན་པི་ཡར་ལ་ཀོསི་དེ་ འབྲུག་རྒྱལ་ཁབ་ནང་ སྤྱི་ཟླ་ ༦ པའི་ཚེས་ ༣༠ ལས་སྤྱི་ཟླ་ ༧ པའི་ཚེས་ ༣ ཚུན་ གཞུང་འབྲེལ་ལྟ་སྐོར་ལུ་ལྷོད་ཡོདཔ་དང་། ནིའུ་ཡོག་ལུ་ཡོད་མི་ འཛམ་གླིང་སྤྱི་ཚོགས་ཡིག་ཚང་གཙོ་ཁང་གི་ ཞི་བདེ་ལག་ལེན་ལས་ཁུངས་ལས་ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ འབྲུག་ལུ་ལྟ་སྐོར་འབད་མི་དེ་ ཆེ་མཐོའི་གནས་རིམ་ནང་གཟིགས་སྐོར་དང་པ་ཨིན་པས།
ལྟ་སྐོར་གྱི་སྐབས་ལུ་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ མི་དབང་མངའ་བདག་རིན་པོ་ཆེའི་ སྐུ་མདུན་ལུ་བཅར་ཡོདཔ་མ་ཚད་ བློན་ཆེན་ཌོག་ཊར་ བློ་གྲོས་ཚེ་རིང་དང་། ཕྱི་འབྲེལ་བློན་པོ་ཌོག་ཊར་རྟ་མགྲིན་རྡོ་རྗེ། འབྲུག་གི་བསྟན་སྲུང་དམག་སྡེའི་གཙོ་འཛིན་སྤྱི་ཁྱབ་ གུང་བློན་བ་ཀྲོ་ཚེ་རིང་། དེ་ལས་ གཞུང་གི་ཆེ་མཐོའི་འགོ་དཔོན་ཚུ་དང་ ཕྱད་ཡོདཔ་ཨིན་པས།
འབྲུག་ལུ་ཉིན་གྲངས་ ༣ གྱི་རིང་ ལྟ་སྐོར་འབདཝ་ད་ ཁོ་གིས་ཐིམ་ཕུག་རྟ་བབ་ལུ་ འཛམ་གླིང་སྤྱི་ཚོགས་ཞི་བདེ་དྲག་དམག་ལྟེ་བ་དང་ སྤ་རོ་ཤར་པ་ལུ་འབྲུག་གི་འཛམ་གླིང་སྤྱི་ཚོགས་དམག་སྡེའི་ས་ཁོངས་ དེ་ལས་རྒྱལ་རབས་ཅན་དང་ ལམ་སྲོལ་གྱི་ས་ཁོངས་ཚུ་ནང་ ལྟ་སྐོར་འབད་ནུག།

འོག་ལུ་བཀོད་ཡོད་མི་ དྲི་བ་ག་རའི་ལན་བྲིས། སྐུགས་༥x༣=༡༥ །
༢༽ འཛམ་གླིང་སྤྱི་ཚོགས་ཞི་བདེ་ལས་སྡེའི་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ འབྲུག་པའི་ཞི་བདེ་དམག་མི་ཚུ་ལུ་ལེགས་བསྟོད་ ག་ཅི་ར་གསུངས་གནང་ཡི་ག? གསུམ་བྲིས།', '༡. འབྲུག་གི་ཞི་བདེ་དམག་མི་ཚུ་གིས་ གནས་ཚད་མཐོ་བའི་ གྲ་སྒྲིག་དང་ ཁྱད་རིག་ཐོག་ལས་ ཕྱག་ཞུ་དོ་ཡོདཔ། ༢. དད་དམ་གྱི་སྒོ་ལས་ ཕྱག་ཞུ་དོ་ཡོདཔ། ༣. ཁོང་གི་ཕྱག་ཕྱིད་ཀྱིས་ སེན་ཊཱལ་ཨཱཕ་རི་ཀ་རི་པབ་ལིག་རྐྱངམ་ཅིག་མེན་པར་ ལུང་ཕྱོགས་ཡོངས་ལུ་ ཞི་བདེ་བརྟན་ཏོག་ཏོ་ གནས་ནི་ལུ་ ཕན་ཁྱད་བཟོ་ཡོདཔ། (འབྲུག་གི་ ལྷན་ཐབས་ཀྱིས་ ཡིད་ཆེས་ ངལ་རངས་ དཔའ་ཉམས་བྱུང་ཡོདཔ།)', null, '[{"point": "ལེགས་བསྟོད་ - གནས་ཚད་མཐོ་བའི་ གྲ་སྒྲིག། ཁྱད་རིག། དད་དམ་གྱི་སྒོ་ལས་ ཕྱག་ཞུ་མི། (དེ་གིས་ སེན་ཊཱལ་ཨཱཕ་རི་ཀ་དང་ ལུང་ཕྱོགས་ལུ་ ཞི་བདེ་ཕན།)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper I (Dzongkha)", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-general-1-2023b2-c1', 2, null, null, null, null)
  returning id
)
insert into me_q select 'C1b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'C1b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'འོག་གི་གནས་ཚུལ་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བ་ག་རའི་ལན་བྲིས།
རྒྱལ་སྤྱི་ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་ལས་ འབྲུག་གི་ཞི་བདེ་དམག་མི་ཚུ་ལུ་ལེགས་བསྟོད།
༉ སྤྱི་ལོ་ ༢༠༡༤ ཟླ་ ༩ པ་ལས་ཚུར་ འབྲུག་ལས་འཛམ་གླིང་སྤྱི་ཚོགས་ཀྱི་ ཞི་བདེ་དམག་སྡེའི་ནང་ ཞི་བདེ་སྲུང་མི་ཚུ་ ལྷན་ཐབས་འབད་བའི་ དཔའ་ཉམས་བསྐྱེད་མི་ལུ་ ལེགས་བསྟོད་འབདཝ་དང་འབྲེལ་ འཛམ་གླིང་སྤྱི་ཚོགས་ཞི་བདེ་ལས་སྡེའི་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་ ཇེན་པི་ཡར་ལ་ཀོསི་གིས་ འཛམ་གླིང་སྤྱི་ཚོགས་ལུ་ འབྲུག་གི་ཞི་བདེ་དམག་མི་ཚུ་དང་ཉམས་མྱོང་མ་བཏུབ་བཏུབ་སྦེ་ ཐོབ་སྟེ་ཡོད་ཟེར་བཤདཔ་ཨིན་པས།
འབྲུག་གིས་འཛམ་གླིང་སྤྱི་ཚོགས་དང་ ཞི་བདེ་སྲུང་སྐྱོབ་ལས་དོན་ནང་ ལྷན་ཐབས་དང་ཆ་རོགས་གང་དྲག་འབད་མི་ལུ་ ང་བཅས་ལུ་ ཡིད་ཆེས་ངལ་རངས་དང་དཔའ་ཉམས་སྦོམ་བྱུང་སྟེ་ཡོད་ཟེར་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ བཤད་པའི་ཁར་ ད་ལྟོ་འབྲུག་པའི་ཞི་བདེ་དམག་མི་ཚུ་གིས་ ས་གནས་ ༧ ནང་ཕྱག་ཞུ་བའི་བསྒང་ཡོད་མི་ལས་ སྡེ་ཚན་སྦོམ་ཤོས་ར་ སེན་ཊཱལ་ཨཱཕ་རི་ཀ་རི་པབ་ལིག་རྒྱལ་ཁབ་ནང་ཡོད་ཟེར་བཤད་ཅི།
ད་རུང་ ལས་སྡེ་དེ་གིས་ འབྲུག་གི་དབང་འཛིན་ཚུ་དང་མཉམ་འབྲེལ་ཐོག་ལས་ ཞི་བདེ་དམག་མི་ཚུ་ གཞན་ཁར་བགོ་བཀྲམ་འབད་ནིའི་གདམ་ཁ་དང་འོས་འབབ་ཚུ་ཡང་ བལྟ་ནི་གི་སྤྲོ་བ་ཡོད་ཟེར་ ཁོ་གིས་ཀུན་གསལ་ལུ་བཤད་ཡོདཔ་དང་འབྲུག་གི་ཧོངས་ལས་ ཞི་བདེ་དམག་མི་ཚུ་ རྒྱལ་སྤྱི་ལུ་གཏང་ནིའི་དོན་ལས་ དམག་སྡེ་དང་ཁྲིམས་སྲུང་འགག་སྡེ་ལུ་ སྦྱོང་བརྡར་བྱིན་ཏེ་ གྲ་སྒྲིག་འབད་མི་ལུ་ འཛམ་གླིང་སྤྱི་ཚོགས་ཀྱིས་ངོས་ལེན་འབདཝ་མ་ཚད་ དེ་བཟུམ་མའི་བརྩོན་ཤུགས་བསྐྱེད་མི་ལུ་ རྒྱབ་སྐྱོར་འབད་ཆོག་ཆོ་ཡོད་ཟེར་བཤདཔ་ཨིན་པས།
དེ་འབདཝ་ད་ དམག་མི་བགོ་བཀྲམ་འབད་ནིའི་དུས་ཚོད་དང་ གོ་སྐབས་ཚུ་འཐོན་ནི་དེ་ ངེས་པ་མེད་མི་དེ་ཡང་ ཞི་བདེ་དམག་མིའི་དགོས་མཁོ་བསྒྱུར་བཅོས་དང་ རྒྱལ་ཁབ་ལ་ལུ་ཅིག་ནང་ ཞི་བདེ་དམག་སྡེ་སྒོ་བསྡམ་དགོཔ་འཐོན་མི་ལུ་བརྟེན་ཨིན་ཟེར་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་བཤདཔ་ཨིན་རུང་ མ་འོངས་པ་ལུ་བགོ་བཀྲམ་འབད་དགོཔ་ཐོན་པ་ཅིན་གོ་སྐབས་ཚུ་འབྲུག་ལུ་བྱིན་འོང་ཟེར་ཨིན་པས།
འཕྲལ་ཁམས་ཅིག་ཁར་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ སེན་ཊཱལ་ཨཱཕ་རི་ཀ་རི་པབ་ལིག་ལུ་ ལྟ་སྐོར་འབད་བའི་སྐབས་ འབྲུག་གི་དམག་མི་སྡེ་ཚན་དང་ཕྱད་ཡོདཔ་ད་ འབྲུག་མི་ཚུ་གིས་ཞི་བདེ་སྲུང་ནིའི་དོན་ལས་ གནས་ཚད་མཐོ་བའི་གྲ་སྒྲིག་དང་། ཁྱད་རིག། དེ་ལས་དད་དམ་གྱི་སྒོ་ལས་ཕྱག་ཞུ་མི་ལུ་ ཁོ་གིས་ལེགས་བསྟོད་འབད་ཡོདཔ་ཨིན།
ཁོ་གིས་འབད་བ་ཅིན་ འབྲུག་གི་ཞི་བདེ་དམག་མི་ཚུ་གིས་ ཕྱག་ཕྱིད་གང་དྲག་ཞུ་མི་དེ་གིས་ སེན་ཊཱལ་ཨཱཕ་རི་ཀ་རི་པབ་ལིག་རྒྱལ་ཁབ་ལུ་ ཕན་ཐོགས་བྱུང་མི་གིས་མ་དོ་བར་ ལུང་ཕྱོགས་ཡོངས་ལུ་ཞི་བདེ་བརྟན་ཏོག་ཏོ་སྦེ་གནས་ནི་ལུ་ ཕན་ཁྱད་བཟོ་ནུག་ཟེར་ཨིན་པས། དེ་མ་ཚད་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ མི་སྡེ་ཚུ་ནང་བློ་གཏད་ཡིད་ཆེས་སྒྲིང་སྒྲི་ཡོདཔ་བཟོ་ཐབས་ལུ་ ཞི་བདེའི་ལས་རིམ་ནང་ ཨམ་སྲུ་མངམ་བགོ་བཀྲམ་འབད་དགོཔ་སྦེ་ འབྲུག་ལུ་རྒྱུད་བསྐུལ་འབདཝ་ཨིན་པས།
དེ་ལས་ ཕྱི་འབྲེལ་དང་ཕྱིར་ཚོང་བློན་པོ་ ཌོག་ཊར་རྟ་མགྲིན་རྡོ་རྗེ་གིས་ མགྲོན་བརྡ་ཕུལཝ་བཞིན་དུ་ ཇེན་པི་ཡར་ལ་ཀོསི་དེ་ འབྲུག་རྒྱལ་ཁབ་ནང་ སྤྱི་ཟླ་ ༦ པའི་ཚེས་ ༣༠ ལས་སྤྱི་ཟླ་ ༧ པའི་ཚེས་ ༣ ཚུན་ གཞུང་འབྲེལ་ལྟ་སྐོར་ལུ་ལྷོད་ཡོདཔ་དང་། ནིའུ་ཡོག་ལུ་ཡོད་མི་ འཛམ་གླིང་སྤྱི་ཚོགས་ཡིག་ཚང་གཙོ་ཁང་གི་ ཞི་བདེ་ལག་ལེན་ལས་ཁུངས་ལས་ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ འབྲུག་ལུ་ལྟ་སྐོར་འབད་མི་དེ་ ཆེ་མཐོའི་གནས་རིམ་ནང་གཟིགས་སྐོར་དང་པ་ཨིན་པས།
ལྟ་སྐོར་གྱི་སྐབས་ལུ་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ མི་དབང་མངའ་བདག་རིན་པོ་ཆེའི་ སྐུ་མདུན་ལུ་བཅར་ཡོདཔ་མ་ཚད་ བློན་ཆེན་ཌོག་ཊར་ བློ་གྲོས་ཚེ་རིང་དང་། ཕྱི་འབྲེལ་བློན་པོ་ཌོག་ཊར་རྟ་མགྲིན་རྡོ་རྗེ། འབྲུག་གི་བསྟན་སྲུང་དམག་སྡེའི་གཙོ་འཛིན་སྤྱི་ཁྱབ་ གུང་བློན་བ་ཀྲོ་ཚེ་རིང་། དེ་ལས་ གཞུང་གི་ཆེ་མཐོའི་འགོ་དཔོན་ཚུ་དང་ ཕྱད་ཡོདཔ་ཨིན་པས།
འབྲུག་ལུ་ཉིན་གྲངས་ ༣ གྱི་རིང་ ལྟ་སྐོར་འབདཝ་ད་ ཁོ་གིས་ཐིམ་ཕུག་རྟ་བབ་ལུ་ འཛམ་གླིང་སྤྱི་ཚོགས་ཞི་བདེ་དྲག་དམག་ལྟེ་བ་དང་ སྤ་རོ་ཤར་པ་ལུ་འབྲུག་གི་འཛམ་གླིང་སྤྱི་ཚོགས་དམག་སྡེའི་ས་ཁོངས་ དེ་ལས་རྒྱལ་རབས་ཅན་དང་ ལམ་སྲོལ་གྱི་ས་ཁོངས་ཚུ་ནང་ ལྟ་སྐོར་འབད་ནུག།

འོག་ལུ་བཀོད་ཡོད་མི་ དྲི་བ་ག་རའི་ལན་བྲིས། སྐུགས་༥x༣=༡༥ །
༣༽ གཤམ་འཁོད་ཀྱི་ རྗོད་ཚིག་ཚུ་གི་རྣམ་གྲངས་ གོང་གི་ཡིག་རྒྱུགས་ནང་ལས་ འཚོལ་ཏེ་བྲིས།
(༡) ལྟ་སྐོར། (༢) ཆ་རོགས་འབད། (༣) བཅའ་སྒྲིག། (༤) བསྟོད་པ་རྐྱབ། (༥) སླབ་ཅི།', '(༡) ལྟ་སྐོར་ - གཟིགས་སྐོར། (༢) ཆ་རོགས་འབད་ - ལྷན་ཐབས་འབད། (༣) བཅའ་སྒྲིག་ - གྲ་སྒྲིག། (༤) བསྟོད་པ་རྐྱབ་ - ལེགས་བསྟོད་འབད། (༥) སླབ་ཅི་ - བཤདཔ་ཨིན་པས།', null, '[{"point": "༡ གཟིགས་སྐོར། ༢ ལྷན་ཐབས་འབད། ༣ གྲ་སྒྲིག། ༤ ལེགས་བསྟོད་འབད། ༥ བཤདཔ། (དོན་མཐུན་གྱི་ཚིག་ ཡིག་རྒྱུགས་ནང་ལས)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper I (Dzongkha)", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-general-1-2023b2-c1', 3, null, null, null, null)
  returning id
)
insert into me_q select 'C1c', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'C1c' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C1c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'འོག་གི་གནས་ཚུལ་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བ་ག་རའི་ལན་བྲིས།
རྒྱལ་སྤྱི་ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་ལས་ འབྲུག་གི་ཞི་བདེ་དམག་མི་ཚུ་ལུ་ལེགས་བསྟོད།
༉ སྤྱི་ལོ་ ༢༠༡༤ ཟླ་ ༩ པ་ལས་ཚུར་ འབྲུག་ལས་འཛམ་གླིང་སྤྱི་ཚོགས་ཀྱི་ ཞི་བདེ་དམག་སྡེའི་ནང་ ཞི་བདེ་སྲུང་མི་ཚུ་ ལྷན་ཐབས་འབད་བའི་ དཔའ་ཉམས་བསྐྱེད་མི་ལུ་ ལེགས་བསྟོད་འབདཝ་དང་འབྲེལ་ འཛམ་གླིང་སྤྱི་ཚོགས་ཞི་བདེ་ལས་སྡེའི་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་ ཇེན་པི་ཡར་ལ་ཀོསི་གིས་ འཛམ་གླིང་སྤྱི་ཚོགས་ལུ་ འབྲུག་གི་ཞི་བདེ་དམག་མི་ཚུ་དང་ཉམས་མྱོང་མ་བཏུབ་བཏུབ་སྦེ་ ཐོབ་སྟེ་ཡོད་ཟེར་བཤདཔ་ཨིན་པས།
འབྲུག་གིས་འཛམ་གླིང་སྤྱི་ཚོགས་དང་ ཞི་བདེ་སྲུང་སྐྱོབ་ལས་དོན་ནང་ ལྷན་ཐབས་དང་ཆ་རོགས་གང་དྲག་འབད་མི་ལུ་ ང་བཅས་ལུ་ ཡིད་ཆེས་ངལ་རངས་དང་དཔའ་ཉམས་སྦོམ་བྱུང་སྟེ་ཡོད་ཟེར་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ བཤད་པའི་ཁར་ ད་ལྟོ་འབྲུག་པའི་ཞི་བདེ་དམག་མི་ཚུ་གིས་ ས་གནས་ ༧ ནང་ཕྱག་ཞུ་བའི་བསྒང་ཡོད་མི་ལས་ སྡེ་ཚན་སྦོམ་ཤོས་ར་ སེན་ཊཱལ་ཨཱཕ་རི་ཀ་རི་པབ་ལིག་རྒྱལ་ཁབ་ནང་ཡོད་ཟེར་བཤད་ཅི།
ད་རུང་ ལས་སྡེ་དེ་གིས་ འབྲུག་གི་དབང་འཛིན་ཚུ་དང་མཉམ་འབྲེལ་ཐོག་ལས་ ཞི་བདེ་དམག་མི་ཚུ་ གཞན་ཁར་བགོ་བཀྲམ་འབད་ནིའི་གདམ་ཁ་དང་འོས་འབབ་ཚུ་ཡང་ བལྟ་ནི་གི་སྤྲོ་བ་ཡོད་ཟེར་ ཁོ་གིས་ཀུན་གསལ་ལུ་བཤད་ཡོདཔ་དང་འབྲུག་གི་ཧོངས་ལས་ ཞི་བདེ་དམག་མི་ཚུ་ རྒྱལ་སྤྱི་ལུ་གཏང་ནིའི་དོན་ལས་ དམག་སྡེ་དང་ཁྲིམས་སྲུང་འགག་སྡེ་ལུ་ སྦྱོང་བརྡར་བྱིན་ཏེ་ གྲ་སྒྲིག་འབད་མི་ལུ་ འཛམ་གླིང་སྤྱི་ཚོགས་ཀྱིས་ངོས་ལེན་འབདཝ་མ་ཚད་ དེ་བཟུམ་མའི་བརྩོན་ཤུགས་བསྐྱེད་མི་ལུ་ རྒྱབ་སྐྱོར་འབད་ཆོག་ཆོ་ཡོད་ཟེར་བཤདཔ་ཨིན་པས།
དེ་འབདཝ་ད་ དམག་མི་བགོ་བཀྲམ་འབད་ནིའི་དུས་ཚོད་དང་ གོ་སྐབས་ཚུ་འཐོན་ནི་དེ་ ངེས་པ་མེད་མི་དེ་ཡང་ ཞི་བདེ་དམག་མིའི་དགོས་མཁོ་བསྒྱུར་བཅོས་དང་ རྒྱལ་ཁབ་ལ་ལུ་ཅིག་ནང་ ཞི་བདེ་དམག་སྡེ་སྒོ་བསྡམ་དགོཔ་འཐོན་མི་ལུ་བརྟེན་ཨིན་ཟེར་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་བཤདཔ་ཨིན་རུང་ མ་འོངས་པ་ལུ་བགོ་བཀྲམ་འབད་དགོཔ་ཐོན་པ་ཅིན་གོ་སྐབས་ཚུ་འབྲུག་ལུ་བྱིན་འོང་ཟེར་ཨིན་པས།
འཕྲལ་ཁམས་ཅིག་ཁར་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ སེན་ཊཱལ་ཨཱཕ་རི་ཀ་རི་པབ་ལིག་ལུ་ ལྟ་སྐོར་འབད་བའི་སྐབས་ འབྲུག་གི་དམག་མི་སྡེ་ཚན་དང་ཕྱད་ཡོདཔ་ད་ འབྲུག་མི་ཚུ་གིས་ཞི་བདེ་སྲུང་ནིའི་དོན་ལས་ གནས་ཚད་མཐོ་བའི་གྲ་སྒྲིག་དང་། ཁྱད་རིག། དེ་ལས་དད་དམ་གྱི་སྒོ་ལས་ཕྱག་ཞུ་མི་ལུ་ ཁོ་གིས་ལེགས་བསྟོད་འབད་ཡོདཔ་ཨིན།
ཁོ་གིས་འབད་བ་ཅིན་ འབྲུག་གི་ཞི་བདེ་དམག་མི་ཚུ་གིས་ ཕྱག་ཕྱིད་གང་དྲག་ཞུ་མི་དེ་གིས་ སེན་ཊཱལ་ཨཱཕ་རི་ཀ་རི་པབ་ལིག་རྒྱལ་ཁབ་ལུ་ ཕན་ཐོགས་བྱུང་མི་གིས་མ་དོ་བར་ ལུང་ཕྱོགས་ཡོངས་ལུ་ཞི་བདེ་བརྟན་ཏོག་ཏོ་སྦེ་གནས་ནི་ལུ་ ཕན་ཁྱད་བཟོ་ནུག་ཟེར་ཨིན་པས། དེ་མ་ཚད་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ མི་སྡེ་ཚུ་ནང་བློ་གཏད་ཡིད་ཆེས་སྒྲིང་སྒྲི་ཡོདཔ་བཟོ་ཐབས་ལུ་ ཞི་བདེའི་ལས་རིམ་ནང་ ཨམ་སྲུ་མངམ་བགོ་བཀྲམ་འབད་དགོཔ་སྦེ་ འབྲུག་ལུ་རྒྱུད་བསྐུལ་འབདཝ་ཨིན་པས།
དེ་ལས་ ཕྱི་འབྲེལ་དང་ཕྱིར་ཚོང་བློན་པོ་ ཌོག་ཊར་རྟ་མགྲིན་རྡོ་རྗེ་གིས་ མགྲོན་བརྡ་ཕུལཝ་བཞིན་དུ་ ཇེན་པི་ཡར་ལ་ཀོསི་དེ་ འབྲུག་རྒྱལ་ཁབ་ནང་ སྤྱི་ཟླ་ ༦ པའི་ཚེས་ ༣༠ ལས་སྤྱི་ཟླ་ ༧ པའི་ཚེས་ ༣ ཚུན་ གཞུང་འབྲེལ་ལྟ་སྐོར་ལུ་ལྷོད་ཡོདཔ་དང་། ནིའུ་ཡོག་ལུ་ཡོད་མི་ འཛམ་གླིང་སྤྱི་ཚོགས་ཡིག་ཚང་གཙོ་ཁང་གི་ ཞི་བདེ་ལག་ལེན་ལས་ཁུངས་ལས་ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ འབྲུག་ལུ་ལྟ་སྐོར་འབད་མི་དེ་ ཆེ་མཐོའི་གནས་རིམ་ནང་གཟིགས་སྐོར་དང་པ་ཨིན་པས།
ལྟ་སྐོར་གྱི་སྐབས་ལུ་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ མི་དབང་མངའ་བདག་རིན་པོ་ཆེའི་ སྐུ་མདུན་ལུ་བཅར་ཡོདཔ་མ་ཚད་ བློན་ཆེན་ཌོག་ཊར་ བློ་གྲོས་ཚེ་རིང་དང་། ཕྱི་འབྲེལ་བློན་པོ་ཌོག་ཊར་རྟ་མགྲིན་རྡོ་རྗེ། འབྲུག་གི་བསྟན་སྲུང་དམག་སྡེའི་གཙོ་འཛིན་སྤྱི་ཁྱབ་ གུང་བློན་བ་ཀྲོ་ཚེ་རིང་། དེ་ལས་ གཞུང་གི་ཆེ་མཐོའི་འགོ་དཔོན་ཚུ་དང་ ཕྱད་ཡོདཔ་ཨིན་པས།
འབྲུག་ལུ་ཉིན་གྲངས་ ༣ གྱི་རིང་ ལྟ་སྐོར་འབདཝ་ད་ ཁོ་གིས་ཐིམ་ཕུག་རྟ་བབ་ལུ་ འཛམ་གླིང་སྤྱི་ཚོགས་ཞི་བདེ་དྲག་དམག་ལྟེ་བ་དང་ སྤ་རོ་ཤར་པ་ལུ་འབྲུག་གི་འཛམ་གླིང་སྤྱི་ཚོགས་དམག་སྡེའི་ས་ཁོངས་ དེ་ལས་རྒྱལ་རབས་ཅན་དང་ ལམ་སྲོལ་གྱི་ས་ཁོངས་ཚུ་ནང་ ལྟ་སྐོར་འབད་ནུག།

འོག་ལུ་བཀོད་ཡོད་མི་ དྲི་བ་ག་རའི་ལན་བྲིས། སྐུགས་༥x༣=༡༥ །
༤༽ འོག་གི་མིང་ཚིག་ཚུ་གི་དོན་དག་བྲིས།
(༡) མཉམ་འབྲེལ། (༢) ཀུན་གསལ། (༣) ཡོངས་ཁྱབ། (༤) ཞི་བདེ། (༥) བགོ་བཀྲམ།', '(༡) མཉམ་འབྲེལ་ - ཕྱོགས་གཉིས་ཡང་ན་ ལེ་ཤ་ མཉམ་དུ་ འབྲེལ་བ་འཐབ་སྟེ་ ལཱ་འབད་ནི། (༢) ཀུན་གསལ་ - ཀུན་ལུ་ གསལ་བར་འབད་མི་ (འབྲུག་གི་ གསར་ཤོག་ ཀུན་གསལ)། (༣) ཡོངས་ཁྱབ་ - ག་ར་ལུ་ ཁྱབ་པ་ (ཡོངས་ཁྱབ་དྲུང་ཆེན་ = ལས་སྡེ་ཆ་ཚང་གི)། (༤) ཞི་བདེ་ - དམག་འཁྲུག་དང་ འཁྲུག་རྩོད་མེད་པའི་ ཞི་བ་དང་བདེ་བ། (༥) བགོ་བཀྲམ་ - བགོ་ནི་དང་ བཀྲམ་ནི། ས་གནས་སོ་སོར་ གཏང་ནི།', null, '[{"point": "མིང་ཚིག་ ༥ གི་དོན་ - མཉམ་དུ་འབྲེལ་བ་འཐབ་ནི། ཀུན་ལུ་གསལ་བ་ (གསར་ཤོག)། ག་ར་ལུ་ཁྱབ་པ་ (ཡོངས་ཁྱབ)། ཞི་བ་དང་བདེ་བ་ (དམག་འཁྲུག་མེདཔ)། བགོ་ནི་དང་ བཀྲམ་ནི་ (གཏང་ནི)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper I (Dzongkha)", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-general-1-2023b2-c1', 4, null, null, null, null)
  returning id
)
insert into me_q select 'C1d', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'C1d' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C1d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C1d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C1d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'འོག་གི་གནས་ཚུལ་འདི་ ལྷག་ཞིནམ་ལས་ དྲི་བ་ག་རའི་ལན་བྲིས།
རྒྱལ་སྤྱི་ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་ལས་ འབྲུག་གི་ཞི་བདེ་དམག་མི་ཚུ་ལུ་ལེགས་བསྟོད།
༉ སྤྱི་ལོ་ ༢༠༡༤ ཟླ་ ༩ པ་ལས་ཚུར་ འབྲུག་ལས་འཛམ་གླིང་སྤྱི་ཚོགས་ཀྱི་ ཞི་བདེ་དམག་སྡེའི་ནང་ ཞི་བདེ་སྲུང་མི་ཚུ་ ལྷན་ཐབས་འབད་བའི་ དཔའ་ཉམས་བསྐྱེད་མི་ལུ་ ལེགས་བསྟོད་འབདཝ་དང་འབྲེལ་ འཛམ་གླིང་སྤྱི་ཚོགས་ཞི་བདེ་ལས་སྡེའི་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་ ཇེན་པི་ཡར་ལ་ཀོསི་གིས་ འཛམ་གླིང་སྤྱི་ཚོགས་ལུ་ འབྲུག་གི་ཞི་བདེ་དམག་མི་ཚུ་དང་ཉམས་མྱོང་མ་བཏུབ་བཏུབ་སྦེ་ ཐོབ་སྟེ་ཡོད་ཟེར་བཤདཔ་ཨིན་པས།
འབྲུག་གིས་འཛམ་གླིང་སྤྱི་ཚོགས་དང་ ཞི་བདེ་སྲུང་སྐྱོབ་ལས་དོན་ནང་ ལྷན་ཐབས་དང་ཆ་རོགས་གང་དྲག་འབད་མི་ལུ་ ང་བཅས་ལུ་ ཡིད་ཆེས་ངལ་རངས་དང་དཔའ་ཉམས་སྦོམ་བྱུང་སྟེ་ཡོད་ཟེར་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ བཤད་པའི་ཁར་ ད་ལྟོ་འབྲུག་པའི་ཞི་བདེ་དམག་མི་ཚུ་གིས་ ས་གནས་ ༧ ནང་ཕྱག་ཞུ་བའི་བསྒང་ཡོད་མི་ལས་ སྡེ་ཚན་སྦོམ་ཤོས་ར་ སེན་ཊཱལ་ཨཱཕ་རི་ཀ་རི་པབ་ལིག་རྒྱལ་ཁབ་ནང་ཡོད་ཟེར་བཤད་ཅི།
ད་རུང་ ལས་སྡེ་དེ་གིས་ འབྲུག་གི་དབང་འཛིན་ཚུ་དང་མཉམ་འབྲེལ་ཐོག་ལས་ ཞི་བདེ་དམག་མི་ཚུ་ གཞན་ཁར་བགོ་བཀྲམ་འབད་ནིའི་གདམ་ཁ་དང་འོས་འབབ་ཚུ་ཡང་ བལྟ་ནི་གི་སྤྲོ་བ་ཡོད་ཟེར་ ཁོ་གིས་ཀུན་གསལ་ལུ་བཤད་ཡོདཔ་དང་འབྲུག་གི་ཧོངས་ལས་ ཞི་བདེ་དམག་མི་ཚུ་ རྒྱལ་སྤྱི་ལུ་གཏང་ནིའི་དོན་ལས་ དམག་སྡེ་དང་ཁྲིམས་སྲུང་འགག་སྡེ་ལུ་ སྦྱོང་བརྡར་བྱིན་ཏེ་ གྲ་སྒྲིག་འབད་མི་ལུ་ འཛམ་གླིང་སྤྱི་ཚོགས་ཀྱིས་ངོས་ལེན་འབདཝ་མ་ཚད་ དེ་བཟུམ་མའི་བརྩོན་ཤུགས་བསྐྱེད་མི་ལུ་ རྒྱབ་སྐྱོར་འབད་ཆོག་ཆོ་ཡོད་ཟེར་བཤདཔ་ཨིན་པས།
དེ་འབདཝ་ད་ དམག་མི་བགོ་བཀྲམ་འབད་ནིའི་དུས་ཚོད་དང་ གོ་སྐབས་ཚུ་འཐོན་ནི་དེ་ ངེས་པ་མེད་མི་དེ་ཡང་ ཞི་བདེ་དམག་མིའི་དགོས་མཁོ་བསྒྱུར་བཅོས་དང་ རྒྱལ་ཁབ་ལ་ལུ་ཅིག་ནང་ ཞི་བདེ་དམག་སྡེ་སྒོ་བསྡམ་དགོཔ་འཐོན་མི་ལུ་བརྟེན་ཨིན་ཟེར་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་བཤདཔ་ཨིན་རུང་ མ་འོངས་པ་ལུ་བགོ་བཀྲམ་འབད་དགོཔ་ཐོན་པ་ཅིན་གོ་སྐབས་ཚུ་འབྲུག་ལུ་བྱིན་འོང་ཟེར་ཨིན་པས།
འཕྲལ་ཁམས་ཅིག་ཁར་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ སེན་ཊཱལ་ཨཱཕ་རི་ཀ་རི་པབ་ལིག་ལུ་ ལྟ་སྐོར་འབད་བའི་སྐབས་ འབྲུག་གི་དམག་མི་སྡེ་ཚན་དང་ཕྱད་ཡོདཔ་ད་ འབྲུག་མི་ཚུ་གིས་ཞི་བདེ་སྲུང་ནིའི་དོན་ལས་ གནས་ཚད་མཐོ་བའི་གྲ་སྒྲིག་དང་། ཁྱད་རིག། དེ་ལས་དད་དམ་གྱི་སྒོ་ལས་ཕྱག་ཞུ་མི་ལུ་ ཁོ་གིས་ལེགས་བསྟོད་འབད་ཡོདཔ་ཨིན།
ཁོ་གིས་འབད་བ་ཅིན་ འབྲུག་གི་ཞི་བདེ་དམག་མི་ཚུ་གིས་ ཕྱག་ཕྱིད་གང་དྲག་ཞུ་མི་དེ་གིས་ སེན་ཊཱལ་ཨཱཕ་རི་ཀ་རི་པབ་ལིག་རྒྱལ་ཁབ་ལུ་ ཕན་ཐོགས་བྱུང་མི་གིས་མ་དོ་བར་ ལུང་ཕྱོགས་ཡོངས་ལུ་ཞི་བདེ་བརྟན་ཏོག་ཏོ་སྦེ་གནས་ནི་ལུ་ ཕན་ཁྱད་བཟོ་ནུག་ཟེར་ཨིན་པས། དེ་མ་ཚད་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ མི་སྡེ་ཚུ་ནང་བློ་གཏད་ཡིད་ཆེས་སྒྲིང་སྒྲི་ཡོདཔ་བཟོ་ཐབས་ལུ་ ཞི་བདེའི་ལས་རིམ་ནང་ ཨམ་སྲུ་མངམ་བགོ་བཀྲམ་འབད་དགོཔ་སྦེ་ འབྲུག་ལུ་རྒྱུད་བསྐུལ་འབདཝ་ཨིན་པས།
དེ་ལས་ ཕྱི་འབྲེལ་དང་ཕྱིར་ཚོང་བློན་པོ་ ཌོག་ཊར་རྟ་མགྲིན་རྡོ་རྗེ་གིས་ མགྲོན་བརྡ་ཕུལཝ་བཞིན་དུ་ ཇེན་པི་ཡར་ལ་ཀོསི་དེ་ འབྲུག་རྒྱལ་ཁབ་ནང་ སྤྱི་ཟླ་ ༦ པའི་ཚེས་ ༣༠ ལས་སྤྱི་ཟླ་ ༧ པའི་ཚེས་ ༣ ཚུན་ གཞུང་འབྲེལ་ལྟ་སྐོར་ལུ་ལྷོད་ཡོདཔ་དང་། ནིའུ་ཡོག་ལུ་ཡོད་མི་ འཛམ་གླིང་སྤྱི་ཚོགས་ཡིག་ཚང་གཙོ་ཁང་གི་ ཞི་བདེ་ལག་ལེན་ལས་ཁུངས་ལས་ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ འབྲུག་ལུ་ལྟ་སྐོར་འབད་མི་དེ་ ཆེ་མཐོའི་གནས་རིམ་ནང་གཟིགས་སྐོར་དང་པ་ཨིན་པས།
ལྟ་སྐོར་གྱི་སྐབས་ལུ་ ཞིབ་རོགས་ཡོངས་ཁྱབ་དྲུང་ཆེན་གྱིས་ མི་དབང་མངའ་བདག་རིན་པོ་ཆེའི་ སྐུ་མདུན་ལུ་བཅར་ཡོདཔ་མ་ཚད་ བློན་ཆེན་ཌོག་ཊར་ བློ་གྲོས་ཚེ་རིང་དང་། ཕྱི་འབྲེལ་བློན་པོ་ཌོག་ཊར་རྟ་མགྲིན་རྡོ་རྗེ། འབྲུག་གི་བསྟན་སྲུང་དམག་སྡེའི་གཙོ་འཛིན་སྤྱི་ཁྱབ་ གུང་བློན་བ་ཀྲོ་ཚེ་རིང་། དེ་ལས་ གཞུང་གི་ཆེ་མཐོའི་འགོ་དཔོན་ཚུ་དང་ ཕྱད་ཡོདཔ་ཨིན་པས།
འབྲུག་ལུ་ཉིན་གྲངས་ ༣ གྱི་རིང་ ལྟ་སྐོར་འབདཝ་ད་ ཁོ་གིས་ཐིམ་ཕུག་རྟ་བབ་ལུ་ འཛམ་གླིང་སྤྱི་ཚོགས་ཞི་བདེ་དྲག་དམག་ལྟེ་བ་དང་ སྤ་རོ་ཤར་པ་ལུ་འབྲུག་གི་འཛམ་གླིང་སྤྱི་ཚོགས་དམག་སྡེའི་ས་ཁོངས་ དེ་ལས་རྒྱལ་རབས་ཅན་དང་ ལམ་སྲོལ་གྱི་ས་ཁོངས་ཚུ་ནང་ ལྟ་སྐོར་འབད་ནུག།

འོག་ལུ་བཀོད་ཡོད་མི་ དྲི་བ་ག་རའི་ལན་བྲིས། སྐུགས་༥x༣=༡༥ །
༥༽ གོང་གི་གནས་ཚུལ་འདི་ ཁྱོད་ཀྱི་མི་ཚེ་ནང་ལུ་ ཤེས་དགོཔ་ཁག་ཆེ་བས་ག? ག་ཅི་འབད?', 'ཨིན། རྒྱུ་མཚན། ༡. འབྲུག་གི་ དམག་མི་ཚུ་གིས་ འཛམ་གླིང་ལུ་ ཞི་བདེའི་ཕྱག་ཞུ་མི་འདི་ རྒྱལ་ཁབ་ཀྱི་ གཟི་བརྗིད་དང་ ངོ་སྐྱེས་ཨིནམ་ ཤེས་ཚུགས། ༢. རྒྱལ་ཁབ་ཆུང་ཀུ་ཅིག་གིས་ཡང་ འཛམ་གླིང་སྤྱི་ཚོགས་ལུ་ ཕན་ཐོགས་འབྱུང་ཚུགསཔ་ ཧ་གོ། ༣. ན་གཞོན་ང་བཅས་ལུ་ རྒྱལ་ཁབ་ལུ་ ཞབས་ཏོག་ཞུ་ནིའི་ དཔའ་ཉམས་བསྐྱེད་བཅུགཔ་ཨིན།', null, '[{"point": "རང་གི་ལྟ་བ་དང་ རྒྱུ་མཚན་ ༢-༣ (རྒྱལ་ཁབ་ཀྱི་ གཟི་བརྗིད། འཛམ་གླིང་སྤྱི་ཚོགས་དང་ འབྲེལ་བ། ན་གཞོན་ལུ་ དཔའ་ཉམས། ཤེས་ཡོན)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper I (Dzongkha)", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-general-1-2023b2-c1', 5, null, null, null, null)
  returning id
)
insert into me_q select 'C1e', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'C1e' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 1.0, 1 from me_q where key = 'C1e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 1.0, 2 from me_q where key = 'C1e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 1.0, 3 from me_q where key = 'C1e';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'translation', 'འོག་ལུ་ ཨིང་སྐད་ནང་ཡོད་མི་ཡིག་རྒྱུགས་འདི་ རྫོང་ཁའི་ཐོག་ལུ་ སྐད་སྒྱུར་འབད་དེ་བྲིས།
The People’s King
One of the Fourth Druk Gyalpo’s greatest achievement was the making of his son Jigme Khesar Namgyel Wangchuck as the Fifth Druk Gyalpo of Bhutan, and with this, His Majesty the Fourth Druk Gyalpo has ensured that “Bhutan continues to be a land blessed with great leaders”.
His Majesty’s accession to the Golden Throne on November 6, 2008 marked the dawn of the great eastern sun and another golden era in the Bhutanese history. His Majesty embodies the fresh perspective, idealism and optimism of a cloistered nation emerging into the modern world, while he is equally imbued with deep sense of respects for the traditional values. The older generations revere him for his commitment and sense of duty to uphold the traditional values, and his wisdom and compassion that he portrayed when meeting the people to explain them the political transformation taking place in the country.
His Majesty’s active involvement in cause of the future generation have made him the role model for the younger people, and thus, His Majesty has become the embodiment of the past and inspiration of the future.
Within two years of his reign, His Majesty has proven himself as an open, positive and selfless leader, the one who is deeply devoted to the cause of his people, for which he is known as the “People’s King”. Even as the Crown Prince, His Majesty gave everyone a sense of optimism for the future.
- Abstract from the book “The Wangchuck Dynasty”', 'ལན་གྱི་དཔེ།

མི་སེར་གྱི་རྒྱལ་པོ།

མི་དབང་འབྲུག་རྒྱལ་བཞི་པ་མཆོག་གི་ མཛད་པ་ཆེ་ཤོས་ཅིག་འདི་ སྲས་ འཇིགས་མེད་གེ་སར་རྣམ་རྒྱལ་དབང་ཕྱུག་མཆོག་ འབྲུག་གི་རྒྱལ་པོ་ལྔ་པ་སྦེ་ བཟོ་གནང་མི་འདི་ཨིན། དེ་གིས་ མི་དབང་འབྲུག་རྒྱལ་བཞི་པ་མཆོག་གིས་ "འབྲུག་འདི་ འགོ་ཁྲིད་ཆེན་པོ་ཚུ་གིས་ བྱིན་གྱིས་རློབས་པའི་ ས་ཅིག་ ཨིན་མི་ འཕྲོ་མཐུད་དེ་ར་ ཡོད་ནི་" ངེས་བརྟན་བཟོ་གནང་ཡོད།

མི་དབང་མཆོག་ སྤྱི་ལོ་ ༢༠༠༨ སྤྱི་ཟླ་ ༡༡ པའི་ཚེས་ ༦ ལུ་ གསེར་ཁྲི་ལུ་ མངའ་གསོལ་གནང་མི་འདི་གིས་ ཤར་ཕྱོགས་ཀྱི་ ཉི་མ་ཆེན་པོ་ ཤར་བ་དང་ འབྲུག་གི་ལོ་རྒྱུས་ནང་ དུས་རབས་གསེར་གྱི་ ནམ་དུས་གཞན་ཅིག་ འགོ་བཙུགས་བའི་ རྟགས་ཨིན། མི་དབང་མཆོག་གིས་ སྒོ་བསྡམས་ཏེ་སྡོད་པའི་ རྒྱལ་ཁབ་ཅིག་ དེང་སང་གི་ འཛམ་གླིང་ནང་ ཐོན་འོང་པའི་ མཐོང་སྣང་གསར་པ་ དམིགས་ཡུལ་བཟང་པོ་ རེ་བ་ཚུ་ སྐུ་ལུ་ ལྡན་ཏེ་ཡོདཔ་ད་ གཅིག་ཁར་ ལམ་སྲོལ་གྱི་ ཀུན་སྤྱོད་ལུ་ གུས་བཀུར་ཟབ་མོ་ཡང་ ལྡན་ཡོད། མི་རབས་རྒས་ཤོས་ཚུ་གིས་ མི་དབང་མཆོག་གིས་ ལམ་སྲོལ་གྱི་ ཀུན་སྤྱོད་ཚུ་ ཉམས་སྲུང་འབད་ནི་ལུ་ ཐུགས་དམ་དང་ འགན་ཁུར་ཡོད་མི་དང་ རྒྱལ་ཁབ་ནང་ འབྱུང་བཞིན་པའི་ ཆབ་སྲིད་ཀྱི་འགྱུར་བ་ མི་སེར་ལུ་ གསལ་བཤད་གནང་བའི་སྐབས་ སྟོན་གནང་མི་ མཁྱེན་རབ་དང་ ཐུགས་རྗེ་ལུ་ གུས་བཀུར་ཞུཝ་ཨིན། མི་རབས་མ་འོངས་པའི་ དོན་ལུ་ ཐུགས་ཁུར་བཞེས་གནང་མི་ལས་བརྟེན་ ན་གཞོན་ཚུ་ལུ་ དཔེ་སྟོན་གྱི་ མི་ངོམ་ཅིག་ལུ་ གྱུར་ཏེ་ འདས་པའི་ ངོ་བོ་དང་ མ་འོངས་པའི་ སྤྲོ་བ་སྐྱེད་མི་ཅིག་ ཨིན།

རྒྱལ་སྲིད་སྐྱོང་གནང་སྟེ་ ལོ་ ༢ གི་ནང་འཁོད་ལུ་ མི་དབང་མཆོག་ ཁ་ཕྱེ་ ལེགས་ཤོམ་ བདག་མེད་གཞན་ཕན་གྱི་ འགོ་ཁྲིད་ཅིག་ ཨིནམ་ གསལ་སྟོན་གནང་ཡོདཔ་ད་ མི་སེར་གྱི་ དོན་ལུ་ ཐུགས་ཁུར་ཟབ་མོ་ བཞེས་གནང་མི་ལས་བརྟེན་ "མི་སེར་གྱི་རྒྱལ་པོ་" ཟེར་ གྲགས་ཡོད། རྒྱལ་སྲས་སྦེ་ བཞུགས་པའི་སྐབས་ལས་ར་ མི་དབང་མཆོག་གིས་ ག་ར་ལུ་ མ་འོངས་པའི་ རེ་བ་ བྱིན་གནང་ཡོད།

- ''དབང་ཕྱུག་རྒྱལ་བརྒྱུད'' ཟེར་བའི་ དེབ་ནང་ལས་ ཕྱུང་མི།', null, '[{"point": "དོན་ཚན་ ༡ - རྒྱལ་བཞི་པ་མཆོག་གི་ མཛད་པ་ ཆེ་ཤོས་ - སྲས་ འཇིགས་མེད་གེ་སར་རྣམ་རྒྱལ་དབང་ཕྱུག་ རྒྱལ་པོ་ལྔ་པ་ལུ་ བཟོ་ནི། འབྲུག་ལུ་ འགོ་ཁྲིད་ཆེན་པོ་ ཐོབ་ནི།", "marks": 3}, {"point": "དོན་ཚན་ ༢ - ༢༠༠༨ སྤྱི་ཟླ་ ༡༡ ཚེས་ ༦ གསེར་ཁྲི་མངའ་གསོལ། ཤར་ཕྱོགས་ཉི་མ་ དུས་རབས་གསེར་གྱི། མཐོང་སྣང་གསར་པ་དང་ ལམ་སྲོལ་ལུ་ གུས་བཀུར། མི་རབས་ཕྱི་མའི་ དཔེ་སྟོན།", "marks": 5}, {"point": "དོན་ཚན་ ༣ - ལོ་ ༢ ནང་ ཁ་ཕྱེ་ ལེགས་ཤོམ་ གཞན་ཕན་ འགོ་ཁྲིད། ''མི་སེར་གྱི་རྒྱལ་པོ''། རྒྱལ་སྲས་ཀྱི་སྐབས་ལས་ རེ་བ།", "marks": 4}, {"point": "དོན་མ་ཤོར་བའི་ ཞེ་ས་ཚད་ལྡན་ ཚིག་སྦྱོར།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'dzongkha'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'dzongkha') and t.slug = 'translation'), (select id from public.exam_papers where code = 'me-general-1'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha question text copied from the PDF (font repaired) and model answer written by Claude: a fluent Dzongkha reader must check both before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (General, Dzongkha): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper I (Dzongkha)", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'T1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'T1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content (ནང་དོན།)', 'Answers what is asked with relevant, correct and well-developed points.', 6.0, 1 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Structure (འབྲི་བཀོད།)', 'Correct format for the task (essay, letter, agreement, précis), logical order and paragraphs.', 4.0, 2 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)', 'Correct Dzongkha grammar, honorifics, spelling and punctuation.', 5.0, 3 from me_q where key = 'T1';
commit;
