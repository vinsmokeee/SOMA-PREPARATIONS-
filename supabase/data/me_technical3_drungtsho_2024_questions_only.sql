-- ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers
begin;
delete from public.questions where specialisation_id = (select id from public.specialisations where code = 'drungtsho') and paper_id = (select id from public.exam_papers where code = 'me-technical-3') and status = 'draft' and ai_review ->> 'batch' = 'ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers';
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is null and specialisation_id = (select id from public.specialisations where code = 'drungtsho');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'drungtsho'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 20, 1, null, 'BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'drungtsho'), null, 2, 'Section A: Short answer questions', 'short_answer', 1, 30, null, 'BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'drungtsho'), null, 3, 'Section B: Long answer questions (all compulsory)', 'long_answer', 1, 50, null, 'BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine');
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'ཡང་ན་སྟ་རེའི་ཁ་དང་འདྲ་བ་སོགས་ཀུན་ཀྱང་རིང་ཐུང་གི་ཚད་སྲིད་ལ་སོར་དྲུག་ཡོད་པ་ཟེར་བའི་ཚད་འདི།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཆག་གང་།', false, 1), ('B', 'མཁྱིད་གང་།', false, 2), ('C', 'མཛུབ་གང་།', false, 3), ('D', 'མཐོ་གང་།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'གཏར་དུ་རུང་བའི་ནད་གཞི་ནི་འགྲམས། འཁྲུགས། རིམས། སྐྲངས་པ། རྨ་དང་དྲེག་ནད། སུར་ཡ་དང་མེ་དབལ་ཟེར་བའི་སྐབས་
སུར་ཡ་ཟེར་བའི་གོ་དོན་འདི།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དོན་སོད་ཀྱི་གནས་སུ་ཁྲག་ངན་ཆུ་སེར་འདུས་ནས་རྨའི་མདོག་འོད་ཟེར་ལྟར་དམར་བ་འབྱུང་བ་ལ།', false, 1), ('B', 'དོན་སོད་ཀྱི་གནས་སུ་ཁྲག་ངན་ཆུ་སེར་འདུས་ནས་རྨའི་མདོག་ཉི་མ་ལྟར་དམར་ལ་སྒོར་བ་འབྱུང་བ་ལ།', false, 2), ('C', 'དོན་སོད་ཀྱི་གནས་སུ་ཁྲག་ངན་ཆུ་སེར་འདུས་ནས་རྨའི་མདོག་ཉི་མ་ལྟར་ཤིན་ཏུ་དམར་བ་འབྱུང་བ་ལ།', false, 3), ('D', 'ཡན་ལག་གི་གནས་སུ་ཁྲག་ངན་ཆུ་སེར་འདུས་ནས་རྨའི་མདོག་ཉི་མ་ལྟར་དམར་ལ་ཟླ་གམ་འབྱུང་བ་ལ།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'ཟས་ཀྱི་སྔོན་དུ་སྨན་བཏང་ནས་དེ་མ་ཐག་ཏུ་ཟས་ཟ་དགོཔ་འདི།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གཞང་དང་ལོང་ག་ལུ་གནས་པའི་ནད་གཞི་ལུ།', false, 1), ('B', 'ཁྱབ་བྱེད་ལས་འགྱུར་པའི་ནད་གཞི་ཚུ་ལུ།', false, 2), ('C', 'གྱེན་རྒྱུའི་རླུང་ལ་སོགས་པའི་ནད་རིགས་ཕལ་མོ་ཆེ་ལུ།', false, 3), ('D', 'སྐྱིགས་བུའི་ནད་གཞི་ལུ།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'རྩིབ་རིང་སྟེང་ན་ཤ་མིན་པགས་མིན་ཡོད་པ་ནི།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'མཆིན་དྲི་ཁྲ་བོ།', false, 1), ('B', 'མཆིན་དྲི་ནག་པོ།', false, 2), ('C', 'མཆིན་དྲི་དཀར་པོ།', false, 3), ('D', 'མཆིན་དྲི་གསེར་པོ།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'མཆིན་དྲི་ལ་མཆིན་པ་འདོགས་མཚམས་ནི།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཚིགས་པ་དགུ་པ་དང་ལྷེན་རུས་ནས་སོར་གང་བཅལ་བའི་འཕྲེད་ཐིག་གི་འོག', false, 1), ('B', 'ཚིགས་པ་དགུ་པ་དང་ལྷེན་རུས་ནས་མཚོན་གང་བཅལ་བའི་འཕྲེད་ཐིག་གི་འོག', false, 2), ('C', 'ཚིགས་པ་བརྒྱད་པ་དང་ལྷེན་རུས་ནས་སོར་གང་བཅལ་བའི་འཕྲེད་ཐིག་གི་འོག', false, 3), ('D', 'ཚིགས་པ་བརྒྱད་པ་དང་ལྷེན་རུས་ནས་མཚོན་གང་བཅལ་བའི་འཕྲེད་ཐིག་གི་འོག', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'གློ་མ་སྒང་ལས་བྱུང་བའི།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'སྒེ་དོར་གཉིས།', false, 1), ('B', 'ནང་རྒྱུག་གཉིས།', false, 2), ('C', 'གྲོག་རྐེད་གཉིས།', false, 3), ('D', 'ཚིགས་འགྲམས་གཉིས།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'གློ་བུ་རྟེ་མིག་ལས་བྱུང་བའི།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'སྔོན་བུ་གཉིས།', false, 1), ('B', 'ཕྱིར་རྒྱུག་གཉིས།', false, 2), ('C', 'བསོལ་མ་གཉིས།', false, 3), ('D', 'གཟེར་མགོ་གཉིས།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'ཕོ་རྩ་བོང་རྨེད་ནི།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ལྷེན་སའི་གཡས་གཡོན་མཚོན་རེའི་སར་གནས།', false, 1), ('B', 'ཕོ་དཀྱིལ་གཡས་གཡོན་སོར་གཉིས་ན་གནས།', false, 2), ('C', 'ལྟེ་བའི་གྱེན་མཚོན་གང་ན་གནས།', false, 3), ('D', 'ལྟེ་བའི་གྱེན་སོར་གང་ན་གནས།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'བྱང་ཁོག་ཤ་གནད་བཤད་དུས་ རྟ་ཤ་གཉིས་ནི།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'སོག་པའི་མེ་ལོང་སྟེང་གི་རྟ་ཤ་༢།', false, 1), ('B', 'སོག་པའི་མེ་ལོང་ནང་གྱི་རྟ་ཤ་༢།', false, 2), ('C', 'སོག་པའི་མེ་ལོང་འོག་གི་རྟ་ཤ་༢།', false, 3), ('D', 'སོག་པའི་མེ་ལོང་དཀྱིལ་གྱི་རྟ་ཤ་༢།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'སོག་རྩ་ནག་པོ་ནི།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'རླུང་གི་རྟེན་ཡིན་ཞིང་།', false, 1), ('B', 'ཁྲག་གི་རྟེན་ཡིན་ཞིང་།', false, 2), ('C', 'རླུང་ཁྲག་གི་རྟེན་ཡིན་ཞིང་།', false, 3), ('D', 'དབུགས་ཀྱི་རྟེན་ཡིན་ཞིང་།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'མདའ་དང་མཚོན་སོགས་གང་ཡང་སོར་གསུམ་གྱིས་དོན་ལ་མི་སླེབས་པ་ནི།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'མཆིན་དྲི་ཁུག་པའམ་ཁྲ་བོའི་བར་དེར།', false, 1), ('B', 'ནུ་མ་གཉིས་ནས་མཚོན་གང་གི་འོག་ཏུ།', false, 2), ('C', 'མཆིན་དྲི་ཡན་སྟོད་དུ།', false, 3), ('D', 'མཆིན་དྲི་མན་སྨད་དུ།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'ཕྲན་བུ་དྲུག་ལས་ སྨུག་པོ་ཚ་རྐྱེན་ཕོ་རྒྱུ་ལོང་གསུམ་དུ་ཞུགས་པ་ ཕོ་ཚད་དང་རྒྱུ་གཟེར་མཆེར་ཚད་ ལྟོ་བ་སོས་འགྱངས་བྱེད་པ་
སོགས་ལ་ཕན་པའི་རྩ་མིག་ངོས་འཛིན་འབད།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'མཐེབ་ཆེན་རྒྱབ་རྩ།', false, 1), ('B', 'དགུང་སྲིན་སྐྱོར་རྩ།', false, 2), ('C', 'དགུང་མོའི་རྒྱབ་རྩ།', false, 3), ('D', 'སྲིན་ལག་རྒྱབ་རྩ།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'འགྲམས་ཚད་སྐབས་ཀྱི་དབྱེ་བ་༢ ལས་ཕྱའི་ཡུལ་བཞི་ལ་འགྲམས་པ་ནི།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཤ་རུས་རྩ་དང་རྐང་ལག', false, 1), ('B', 'སྟོད་སྨད་བར་དང་ཤ་ལ་འགྲམས་པའོ།།', false, 2), ('C', 'མགོ་སྐེ་བྱང་ཁོག་དང་རྐང་ལག་གོ།', false, 3), ('D', 'ཤ་རུས་རྩ་ཆུ་རྒྱུས་དང་བཅས་པའོ།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'སོག་འཛིན་རླུང་བཅོས་པའི་སྐབས་སུ་ སྨན་མར་རུས་ཐང་བཏང་ཞིང་གསང་གསུམ་བསྲེག་ཟེར་བའི་གསང་༣ འདི་ག་ཅི་ར་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཨན་སྟོང་ སྐེ་སྟོང་ སྤྱི་བོ་ཡིན།', false, 1), ('B', 'འདུས་སོ་གསུམ་ཨིན།', false, 2), ('C', 'བྲང་གཞུང་དཀར་ནག་མཚམསདང་རྒྱབ་ཀྱི་སོག་རྩ་སྙིང་གི་གསང་ཨིན།', false, 3), ('D', 'སྤྱི་མཚོགས་དང་ཙ་ར་ཁུང་ཡིན།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'མར་བཙག་བཅད་དེ་ དེའི་ནང་ཕྱེ་བཏབ་ དེ་གུ་ རྒྱམ་ཚྭ་དང་ སྒ་སྨུག་བཏབ་མི་ལུ་འདོན་བཞི་ལས་ག་ཅི་སྨོ ?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དམར་འདོན་ཡིན།', false, 1), ('B', 'དཀར་འདོན་ཡིན།', false, 2), ('C', 'སྐྱུར་འདོན་ཡིན།', false, 3), ('D', 'སྒོག་འདོན་ཡིན།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'སྨུག་པོ་གྱེན་དུ་རོལ་ཏེ་ཁྲག་སྐྱུགས་པའི་ནདཔ་ཅིག་ལུ་ གཤམ་འཁོད་སྨན་བཞི་ལས་ཐད་དཀར་གྱི་སྨན་འདམ་འཐུ་འབད།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'འུ་སུ་༥ པ།', false, 1), ('B', 'གཡུ་རྙིང་ ༢༥།', false, 2), ('C', 'མཚེ་དུམ་༧ པ།', false, 3), ('D', 'སྐྱུ་རུ་༢༥།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'ནདཔ་ཅིག་གིས་ཁྱོད་འབད་སར་ ང་གཟུགས་ཀྱི་རུ་ཏོ་ག་ར་ནཝ་མས་ གསེར་ཁབ་ཅིག་ཞུ་དགོ་འབད་ཟེར་སླབ་པ་ཅིན་ ཁྱོད་ཀྱིས་
གཤམ་འཁོད་ གསང་ག་གདམ་འཐུ་འབད་ནི་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ག་ན་བའི་ནད་དམིགས།', false, 1), ('B', 'ཨན་སྟོང་།', false, 2), ('C', 'སྒྲོག་རུས་འདོ་གསང།', false, 3), ('D', 'མཁྲིག་རུས་འབུར་གསང།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'གདོན་ཆུ་བརྟག་པའི་སྐབས་ལུ་ གདོན་གྱི་ལྦུ་བ་ ཁ་བྱང་ཤར་ལུ་ཡོད་པ་ཅིན་ གདོན་ག་ཅི་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'མཚོ་སྨན་དང་ཀླུ་ས་བདག།', false, 1), ('B', 'ས་བདག་དང་རིག་འཛིན།', false, 2), ('C', 'རྒྱལཔོ་དང་བཙན།', false, 3), ('D', 'བཙན་བདུད་ནག་མོ།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'ཆབ་གསང་རྒྱས་བསྡུས་གཉིས་འཐོན་ནི་གུ་ལྷོདཔ་ད་བཀག་བཞག་ནི་དང་། ཡང་ཅིན་མི་འཐོན་བཞིན་དུ་བཙིར་ནི་འདི།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'སོད་ལམ་དམན་པའི་སོར་བ་ཨིན།', false, 1), ('B', 'སོད་ལམ་ལྷག་པའི་སོར་བ་ཨིན།', false, 2), ('C', 'སོད་ལམ་ལོག་པའི་སོར་བ་ཨིན།', false, 3), ('D', 'གསུམ་གའི་སོར་བ་ཡིན།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'བད་ཀན་གསོག་པའི་དུས།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དབྱར་དུས།', false, 1), ('B', 'དགུན་སྟོད་ཀྱི་དུས།', false, 2), ('C', 'དགུན་སྨད་ཀྱི་དུས།', false, 3), ('D', 'དཔྱིད་ཀའི་དུས།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'short_answer', 'དྲི་བ་གཉིས་པ།
གཤམ་འཁོད་གི་གཏར་མིག་མིང་གི་རྣམས་གྲངས་རྣམས་ཀྱི་གཏར་མིག་དངོས་ཀྱི་མིང་བྲིས་ནི། (སྐུགས་༡x༥=༥)
ཀ རྩེ་ཞབས
ཁ སྙིང་གི་ཨ་སོ་ལི་ཀ
ག མཁྲིས་རྩ་གསེར་གདུང་
ང ལོང་བུ་དར་དཔྱངས
ཅ མཆིན་པ་སྤང་', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-tradmed2024-sectiona', 1, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the case or question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 1.0, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'short_answer', 'དྲི་བ་གསུམ་པ།
ཚ་བའི་ཆུ་ལ་ཀུ་ཡ་མཐུག་པ་དང་ དྲི་དུགས་པ་མདོག་དམར་བ་ ངོ་བོ་བསྐ་བ་སོགས་འབྱུང་དགོ་པའི་རྒྱུ་མཚན་ཐུང་ཀུ་རེ་བྲིས།
(སྐུགས་༡x༤= ༤)
༡. བསྐ་བ་ནི་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་།
༢. དྲི་དུགས་པ་ནི་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་།
༣. མདོག་དམར་བ་ནི་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་།
༤. ཀུ་ཡ་མཐུག་པ་ནི་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་་།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4, 432,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-tradmed2024-sectiona', 2, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 2.5, 1), ('Application', 'Applies the idea to the case or question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 0.5, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'short_answer', 'དྲི་བ་བཞི་པ།
གཤམ་གསལ་རེའུ་མིག་ནང་ཡོད་པའི་ཤ་གནད་ཚུ་ལུས་ཀྱི་གནས་ག་ཏེ་ཡོདཔ་ཨིན་ན་ལན་ཤོག་ནང་བྲིས། (སྐུགས་༡x༥=༥)
ཨང་། ཤ་གནད། ལུས་ཀྱི་གནས།
༡ བཤུལ་ཤ་ནག་པོ།
༢ ནུ་ཤ་འཁོར་བ།
༣ རྟ་ཤ།
༤ བཞག་ཤ་དཀར་ནག
༥ འདར་ཤ་ཁུག་པ།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-tradmed2024-sectiona', 3, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the case or question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 1.0, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'short_answer', 'དྲི་བ་ལྔ་པ།
བཤད་བརྒྱུད་དུ་འབྱུང་བ་ལྔ་ལས་ལུས་ཕུང་བསྒྲུབ་ཚུལ་སྐོར་གསུངས་ཡོད་པའི་རྩ་བ་ཚིགས་རྐང་ལྔ་པོ་བྲིས་ནི། (སྐུགས་༡x༥=༥)', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-tradmed2024-sectiona', 4, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the case or question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 1.0, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'short_answer', 'དྲི་བ་དྲུག་པ།
གཤམ་གསལ་ཐིག་གི་རེའུ་མིག་ནང་དུ་ཡོད་པའི་ཀླད་པ་མི་འདྲ་བ་བདུན་པོ་རྣམས་ མགོ་དབྱིབས་དང་སར་ཏེ་ལན་ཤོག་ནང་ཏུ་བཀོད།
(སྐུགས་༦)
ཀླད་པ། ཆུ་ཀླད། འོ་ཀླད། ཤ་ཀླད། མར་ཀླད། བུང་ཀླད། ཕྲུམ་ཀླད། ཞོ་ཀླད།
མགོ་དབྱིབས།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6, 648,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-tradmed2024-sectiona', 5, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 3.5, 1), ('Application', 'Applies the idea to the case or question with examples or steps.', 1.5, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 1.0, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'short_answer', 'དྲི་བ་བདུན་པ།
གཤམ་གསལ་ལུ་ཡོད་པའི་ཕྱིའི་འབྲེལ་རྩ་དང་ལུས་སྨད་ཀྱི་དབྱེ་གསང་ཚུ་ངོས་འཛིན་འབད་ཚུལ་ཨིན་མིན་ ཨིན་པ་ཅིན་ (ཨིན) དང་
མིན་པ་ཅིན་ (མེན) བཀོད་དེ་ལན་ཤོག་ནང་བྲིས། (སྐུགས་༡x༥=༥)
༡ མཆེར་རྩ་བྱ་རྐང་ནི་སོག་པ་མེ་ལོང་གཉིས་ཀྱི་དཀྱིལ་ནས་མཚོན་དོ་བཅལ་བའི་ས་སོག་པའི་གཞུག་ཟུར་དེ་ལ་རྟ་ཤ་ཞེས་བྱ་སྟེ་དེའི་
གསེབ་ན་གྱེན་གསེགས་ལ་སོར་བཞི་ཙམ་ཞིག་གནས་པར་བཤད་དོ།
༢ མཁྲིས་པའི་རྩ་གསེར་གྱི་ཆུ་མིག་ཅེས་བྱ་བ་ནི་གློ་བའི་ཚང་ཚིང་གི་གསེབ་ན་གནས་སོ།
༣ མཁྲིས་རྩ་གསེར་གྱི་ཀ་བ་ནི་དཔུང་པ་དང་ཕྲག་པའི་བར་ན་གནས་ཏེ་རྩ་འདི་སྐྱོགས་རའི་ཚིགས་མཚམས་སུ་དོན་དུས་གསེར་གྱི་ཀ་
བའི་གནད་ཅེས་པ་དེའོ།
༤ སྨད་ཀྱི་དབྱེ་གསང་ཚིགས་པ་བཅུ་བཞི་ནས་གཡས་གཡོན་མཁྱིད་གང་གི་ས་ན་མཁལ་མའི་རྣག་འབབ་གསང༌།
༥ ལྟེ་བ་ནས་སྣེ་སའི་དཀྱིལ་དུ་འཐེན། དཔྱི་ཟུར་ནས་མཚན་མའི་སྟེང་དུ་འཐེན་པ་རྒྱ་གྲམ་དུ་ཐིག་བཏབ་པའི་རྒྱ་གྲམ་གྱི་ས་ནི་ལྟོ་བའི་
སྤྱིའི་གསང་ཡིན་ནོ།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-tradmed2024-sectiona', 6, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the case or question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 1.0, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'long_answer', 'དྲི་བ་དང་པ།
ཕྱི་པའི་ནང་ལུ་ Artery, Veins and Nerves ཟེར་མི་འདི་གསོ་བ་རིག་པའི་ནང་ལུ་ག་ཅི་སླབ་ཨིན་ན་དང་ དེ་ཚུ་དོན་སོད་
གང་ནས་དགྱེས་ཚུལ་ཡན་ལག་གང་དུ་འགྲོ་བའི་ཚུལ་བྲིས། (སྐུགས་༢x༣=༦)', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6, 648,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-tradmed2024-sectionb', 1, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 3.5, 1), ('Application', 'Applies the idea to the case or question with examples or steps.', 1.5, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 1.0, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'long_answer', 'དྲི་བ་གཉིས་པ།
སྤྱིར་བཏང་རླུང་གི་ནད་གཞི་ལུ་སྣུམས་འཆོས་དང་བྱུག་པ་ལེགས་ཀྱང་ དམིགས་བསལ་མ་རུང་བའི་རླུང་ནད་ཞིག་ཡོད་པ་དེའི་ ནད་ཀྱི་
མིང་ངོས་འཛིན་འབད་ཞིནམ་ལས་ ནད་རྟགས་འབྲི་སྟེ་ བྱུག་པ་མ་རུང་བའི་ཁུངས་བཀལ་ནི། (སྐུགས་ ༥)', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-tradmed2024-sectionb', 2, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the case or question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 1.0, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'long_answer', 'དྲི་བ་གསུམ་པ།
སྨན་བཏང་ཚུལ་བཅུའི་རྩ་བ་བྲིས་ཞིནམ་ལས་འགྲེལ་བཤད་མདོར་བསྡུས་རེ་བྲིས། (སྐུགས་ ༥)', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-tradmed2024-sectionb', 3, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the case or question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 1.0, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'long_answer', 'དྲི་བ་བཞི་པ།
མགོ་ནད་ མུར་འགྲམ་ཟུག་ཅིང་གཟེར་བ་དང༌། དཔྲལ་བ་དང་སྨིན་མའི་མཚམས་ལུག་པ་འདྲ་སྙམ་དུ་སེམས་པ་དང༌། རྣ་བ་འུར་ཞིང་སོ་
དང་འགྲམ་པ་ན་ལ་རྩ་འཁྱུག་ཅིང་མིག་གིས་བལྟ་བ་མི་བཟོད་ལ་ས་ཆུ་མང་བ་དང་ལྡང་དུབ་ཏུ་ན་ཞིང་སྣུམ་དུགས་དང་མགོ་བསམས་པ་ཅིན་
དྲག་དོཝ་བཟུམ་འཚོར་མི་འདི་མགོ་ནད་གཙོ་ཕལ་གང་གི་ཁོངས་སུ་གཏོགས་པ་དང་ དེའི་ཟས་སོ ད་ སྨན་དཔྱད་ཀྱི་ཁ་གསལ་རྒྱས་པར་
བྲིས། (སྐུགས་ ༤)', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4, 432,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-tradmed2024-sectionb', 4, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 2.5, 1), ('Application', 'Applies the idea to the case or question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 0.5, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'long_answer', 'དྲི་བ་བཅུ་ལྔ་པ།
དྲང་སོང་ཞལ་ལུང་ལྟར་གྱི་གྲོང་ཁྱེར་བལྟ་ན་སྡུག་གི་འདོད་པ་མི་འཐུན་པ་གཞན་༤ བཀོད་ནས་ རང་ལུགས་སྨན་གྱི་གྲོང་ཁྱེར་གྱི་འདོད་
པ་བྲིས། (སྐུགས་ ༥)', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-tradmed2024-sectionb', 5, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the case or question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 1.0, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'long_answer', 'དྲི་བ་བཅུ་དྲུག་པ།
སོད་ཀ་གཏར་བའི་སྐབས་སུ་དོན་སོད་གང་གི་རྩ་དང་མི་ནོར་གཅེས་པའི་ཚུལ་དང་གདབས་ཐབས་ལ་སྔར་དང་དེང་སང་མི་འདྲ་བའི་ཚུལ་
བཙག་བུའི་དབྱེ་བ་དང་བཅས་ཏེ་འཁོད། (སྐུགས ༥)', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-tradmed2024-sectionb', 6, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the case or question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 1.0, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'long_answer', 'དྲི་བ་བདུན་པ།
ཡན་ལག་གི་གནད་བཤད་པའི་སྐབས་རྨེན་བུའི་གནད་བརྒྱད་ཀྱི་དབྱེ་བ་གྲངས་ཚུལ་ཡང་དག་སྦེ་བྲིས། (སྐུགས ༥)', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-tradmed2024-sectionb', 7, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the case or question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 1.0, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'long_answer', 'དྲི་བ་བརྒྱད་པ།
ཆུ་སེར་ནད་ཀྱི་འགྱུར་ཚུལ་དང་ སྨན་དང་དཔྱད་ཀྱི་སྐོར་བྲིས་ནི། (སྐུགས ༥)', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-tradmed2024-sectionb', 8, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the case or question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 1.0, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'long_answer', 'དྲི་བ་དགུ་པ།
རྩ་དཀར་གསོ་བའི་ལེའུ་ལས་་་་གང་ཞིག་རྩ་ནད་ཚུལ་མི་ཤེས་པ།། གཟའ་ཕོག་ཟེར་བའི་སྨན་པ་བླུན་པོ་སྟེ་ཞེས་པའི་དོན་ཚན་གྱི་ཐོག་ལུ་
རྩོམ་བྲིས་ ཚིགས་འབྲུ་༢༥༠ བྲིས། (སྐུགས ༥)', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-tradmed2024-sectionb', 9, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the case or question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 1.0, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'long_answer', 'དྲི་བ་བཅུ་པ།
གཤམ་འཁོད་མགོའི་ཤ་གནད་ཀྱི་གནས་ལུགས་མིང་ དབྱིན་སྐད་ཐོག་ལུ་ཡོད་མི་འདི་ རང་ལུགས་གསོ་བ་རིགས་པའི་མགོའི་ཤ་གནད་ལྔ་
ལུ་སྐད་འགྱུར་འབད་དེ་བྲིས་ནི། (སྐུགས ༥)
1. Gelea aponeurotica
2. Fontinalis Muscle
3. Temporalis Muscle
4. Occipitalis Muscle
5. Sternocleidomastoid muscle
བཀྲིས་བདེ་ལེགས།', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-tradmed2024-sectionb', 10, (select id from public.specialisations where code = 'drungtsho'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the case or question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 1.0, 3)) as v(l, d, m, p);
commit;
