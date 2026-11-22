-- ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers
begin;
delete from public.questions where subject_group_id = (select id from public.subject_groups where code = 'traditional-medicine') and paper_id = (select id from public.exam_papers where code = 'me-technical-2') and status = 'draft' and ai_review ->> 'batch' = 'ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers';
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'ལག་ལེན་གཅེས་རིགས་བསྡུས་པ་སྨན་ཀུན་བཅུད་དུ་བསྒྲུབ་པའི་ལས་ཀྱི་ཆོ་ག་ཀུན་གསལ་སྣང་མཛོད་བརྩམས་མི་ག་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'སྨན་པ་ཚུལ་ཁྲིམས་སྐལ་བཟང་གིས་བརྩམས།', false, 1), ('B', 'བསམ་གཏན་གྱིས་བརྩམས།', false, 2), ('C', 'ཁྲོ་རུ་ཚེ་རྣམ་ཀྱིས་བརྩམས།', false, 3), ('D', 'བསྟན་འཛིན་ཕུན་ཚོགས་ཀྱིས་བརྩམས།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'གསོ་རིག་རྒྱུད་བཞིའི་འགྲེལ་ཆེན་གྱི་དཔེ་རིས་ཕྱོགས་བསྒྲིགས་མཛད་མི་ག་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'སྐྱེམ་པ་ཚེ་དབང་།', false, 1), ('B', 'བསྟན་འཛིན་ཕུན་ཚོགས།', false, 2), ('C', 'ཁྲོ་རུ་ཚེ་རྣམ་ཀྱིས་བརྩམས།', false, 3), ('D', 'སྨན་པ་ཚུལ་ཁྲིམས་སྐལ་བཟང་།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'གསོ་རིག་སྙིང་བསྡུས་སྐྱ་རེངས་གསར་པ་བརྩམས་མི་ག་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'བསམ་གཏན་གྱིས་བརྩམས།', false, 1), ('B', 'ཁྲོ་རུ་ཚེ་རྣམ་ཀྱིས་བརྩམས།', false, 2), ('C', 'བསྟན་འཛིན་ཕུན་ཚོགས་ཀྱིས་བརྩམས།', false, 3), ('D', 'སྨན་པ་ཚུལ་ཁྲིམས་སྐལ་བཟང་གིས་བརྩམས།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'བོད་ཀྱི་གསོ་རིག་དང་ཨ་ཡུར་ཝེ་དྷ་ཀྲུང་དབྱིབས་སྨན་གཞུང་བཅས་ལས་བསྟན་པའི་སྐྱེ་དངོས་སྨན་རྫས་ཀྱི་དཔར་རིས་དང་ལག་ལེན་
གཅེས་བཏུས་བརྩམས་མི?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'སྨན་པ་ཚུལ་ཁྲིམས་སྐལ་བཟང་གིས་བརྩམས།', false, 1), ('B', 'སྨན་པ་ཟླ་བ་བཀྲིས་ཀྱི་བརྩམས།', false, 2), ('C', 'ཟུར་མཁར་མཉམ་ཉིད་རྡོ་རྗེ་ཀྱི་བརྩམས།', false, 3), ('D', 'ཁྲོ་རུ་ཚེ་རྣམ་གྱིས་བརྩམས།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'ཟུར་མཁར་མཉམ་ཉིད་རྡོ་རྗེ་ཀྱི་བརྩམས་མི་དཔེ་ཆ་གྱི་མིང་ག་ཅི་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཀོང་སྤྲུལ་གསོ་རིག་ཟིན་ཏིག།', false, 1), ('B', 'མན་ངག་བྱེ་བ་རིང་བསྲེལ་པོད་ཆུང་རབ་འབྱམས་གསལ་བའི་སྒྲོན་མེ།', false, 2), ('C', 'བོད་ཀྱི་གསོ་བ་རིག་པའི་སྨན་རྫས་སྡེ་ཚན་བརྒྱད་དུ་གཏོགས་པ་རྣམས་སོད་ཡུལ་སྨན་སོར་གང་དུ་གསལ་བ་བཙོ་སང་ཞུན་ཐིགས།', false, 3), ('D', 'བཻ་དཱུར་སྔོན་པོ།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'དམུ་དགེ་བསམ་གཏན་གྱིས་དཔེ་ཆ་ག་ཅིག་བརྩམས་ནུག?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གཡུ་ཐོག་གསར་རྙིང་གི་རྣམ་ཐར།', false, 1), ('B', 'གསོ་བ་རིག་པའི་བསྟན་བཅོས་སྨན་བླའི་དགོངས་རྒྱན་རྒྱུད་བཞིའི་གསལ་བྱེད་བཻ་དཱུར་སྔོན་སྔོན་པོའི་མལླི་ཀ།', false, 2), ('C', 'བདུད་རྩི་སྙིང་པོ་ཡན་ལག་བརྒྱད་པ་གསང་བ་མན་ངག་གི་རྒྱུད།', false, 3), ('D', 'གསོ་བ་རིག་པའི་བསྟན་བཅོས་སྨན་བླའི་དགོངས་རྒྱན།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'རྗེ་མཁན་ཁྲི་རབས་༧༠ པའི་སྐུ་སྒེར་དྲུང་འཚོ་ག་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དྲུང་འཚོ་ཡེ་ཤེས་ཚེ་རིང་།', false, 1), ('B', 'དྲུང་འཚོ་ཕུར་པ་ཚེ་རིང་།', false, 2), ('C', 'དྲུང་འཚོ་ཡེ་ཤེས་རྡོ་རྗེ།', false, 3), ('D', 'དྲུང་འཚོ་ཕུར་སྤ་རྡོ་རྗེ།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'འབྲུག་རྒྱལ་ཁབ་ལུ་ Full-fledge Clinical Trial ཟེར་མི་མཚན་རིག་གི་ཞིབ་འཇུག་འདི་ གོ་དང་པ་ནང་པའི་དྲུང་འཚོ་གཅིག་གིས་
འབད་ཡོདཔ་དང་ ཞིབ་འཇུག་འདི་ འབྲུག་གསོ་བའི་ཀུན་སྤྱོད་བཀོད་ཚོགས་ཀྱིས་ འབྲུག་རྒྱལ་ཁབ་ལུ་ Full-fledge Clinical Trialགོ་ཐོ་
དང་པ་ཨིནམ་སྦེ་ཐོ་བཀོད་གྲུབ་ཡོདཔ་ཨིན། ཞིབ་འཇུག་མཛད་མི་དྲུང་འཚོ་ག་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དྲུང་འཚོ་འཇིག་མེད་སེངྒེ།', false, 1), ('B', 'དྲུང་འཚོ་ཀརྨ་ཨོན།', false, 2), ('C', 'དྲུང་འཚོ་རྟེན་འབྲེལ་དབང་འདུས།', false, 3), ('D', 'དྲུང་འཚོ་རྡོ་རྗེ་རྒྱལ་མཚན།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'སྡེ་སྲིད་བསྟན་འཛིན་འབྲུག་སྒྲ་སྤྱི་ལོ་གནམ་སྐུ་འཁྲུངས་ནུག?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '༡༦༠༢', false, 1), ('B', '༡༦༠༣', false, 2), ('C', '༡༦༠༤', false, 3), ('D', '༡༦༠༥', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'གསོ་རིག་འབྱུང་ཁུངས་མུ་ཏིག་འཕྲེང་མཛེས་དཔེ་སྤྲུན་ཐེངས་དང་པ་དབྱིན་ལོ་ནམ་པར་བསྐྲུན་འབད་ནུག?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '༢༠༠༦', false, 1), ('B', '༡༩༩༩', false, 2), ('C', '༢༠༠༨', false, 3), ('D', '༢༠༡༣', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'རྒྱུད་ཀྱི་མན་ངག་གི་ཆེ་བ་དགུ་འདི་ ག་ཅི་གི་དགོངས་པ་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དར་མོ་བཀའ་རྒྱ་མའི་དགོངས་པ་ཨིན།', false, 1), ('B', 'ཁོག་དབུག་ཁྱུང་ཆེན་ལྡིང་བའི་དགོངས་པ་ཨིན།', false, 2), ('C', 'གསོ་རིག་རྒྱུད་བཞིའི་དགོངས་པ་ཨིན།', false, 3), ('D', 'འབྱུང་རྩིས་སྔོན་འགྲོའི་དགོངས་པ་ཨིན།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'དབྱིན་ལོ་ ༢༠༢༣ ལུ་རྒྱ་ནག་རྒྱལ་ཁབ་ལས་ སློབ་ཕྲུག་ཁྱད་དུ་འཕགས་པའི་གཟེངས་བསྟོད་ཞེས་མི་དྲུང་འཚོ་ག་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དྲུང་འཚོ་རྡོ་རྗེ་ཕུན་ཚུགས།', false, 1), ('B', 'དྲུང་འཚོ་ཀརྨ་དགེ་ལེགས།', false, 2), ('C', 'དྲུང་འཚོ་བསོད་ནམས་ཆོས་གྲགས།', false, 3), ('D', 'དྲུང་འཚོ་རྡོ་རྗེ་རྒྱལ་མཚན།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'ད་རེས་ ནང་སྨན་ལྟེ་བའི་སྡེ་འཛིན་ག་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དྲུང་འཚོ་ཐར་པ་ལ།', false, 1), ('B', 'དྲུང་འཚོ་ཨོན་དབང་ཕྱུག', false, 2), ('C', 'དྲུང་འཚོ་ཀརྨ་དགེ་ལེགས།', false, 3), ('D', 'དྲུང་འཚོ་ཨོན་ཕུན་ཚོགས།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'ཆང་གི་ཉེས་དམིགས་སུམ་ཅུ་རྩ་ལྔ་འདི་ ག་ཏེ་ལས་གསུངས་ནུག?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དགའ་བའི་ཅན་གྱི་མདོ་སྡེ་ཉིད།', false, 1), ('B', 'མན་ངག་བྱེ་བ་རིང་བསྲེལ།', false, 2), ('C', 'རྒྱུད་བཞི།', false, 3), ('D', 'གཡུ་ཐོག་སྙིང་ཐིག', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'འབྱུང་རྩིས་སྔོན་འགྲོ་གཙུག་ལག་སྒོ་འབྱེད་ལྡེ་མིག་དང་ཟླ་ཐོ་འགྲོལ་བའི་ལྡེ་མིག་ཕན་བདེའི་གཏེར་མཛོད་ པར་ཐེངས་དང་པ་ སྤྱི་ལོ་༢༠༠༨ལུ་
པར་བསྐྲུན་འབད་ཡོད་མི་འདི་ ཕྱོགས་སྒྲིགས་འབད་མི་གཙོ་བོ་ག་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དྲུང་འཚོ་ངག་དབང་བཟང་པོ།', false, 1), ('B', 'དྲུང་འཚོ་ཕུར་པ་ཚེ་རིང་།', false, 2), ('C', 'དྲུང་འཚོ་རོ་ཕུག', false, 3), ('D', 'དྲུང་འཚོ་རྟེན་འབྲེལ་དབང་འདུས།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'མན་ངག་ཟབ་མོ་ཀུན་གྱི་སྙིང་ཁུ་བསྡུས་པའི་གཞུང་འདི་ ག་ཅི་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'རྒྱུད་བཞི།', false, 1), ('B', 'དར་མོ་བཀའ་རྒྱ་མ།', false, 2), ('C', 'གསོ་རིག་ཟིན་ཏིག', false, 3), ('D', 'གཡུ་ཐོག་སྙིང་ཐིག', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'ག་བུར་དྲི་ལྡན་ཟེར་མི་འདི་ག་ཅི་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'བ་ལེ་ཀའི་མིང་གི་རྣམ་གྲངས།', false, 1), ('B', 'ཨ་རུ་རའི་མིང་གི་རྣམ་གྲངས།', false, 2), ('C', 'ག་བྲའི་མིང་གི་རྣམ་གྲངས།', false, 3), ('D', 'གངས་ཐིག་ཀྱི་མིང་གི་རྣམ་གྲངས།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'བོད་གངས་ཅན་པའི་གསོ་བ་རིག་པའི་དཔལ་ལྡན་རྒྱུད་བཞི་སོགས་ཀྱི་བར་དང་དཀའ་གནད་འགའ་ཞིག་བཀྲོལ་བ་སྔོན་བྱོན་མཁས་པའི་
གསུང་རྒྱུན་གཡུ་ཐོག་དགོངས་རྒྱན་ལུ་མིང་ ག་ཅི་ཞུཝ་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གསོ་བ་རིག་པའི་ཚིག་མཛོད་གཡུ་ཐོག་དགོངས་རྒྱན།', false, 1), ('B', 'ཞི་གནས་དང་ལུས་སོང་གི་ལམ་སྟོན།', false, 2), ('C', 'བཅོམ་ལྡན་འདས་ཀྱི་གསུངས་རྒྱུན།', false, 3), ('D', 'གསོ་རིག་རྒྱུད་བཞིའི་འགྲེལ་ཆེན།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'གར་ཤ་ཞེས་པ་ནི?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ལག་པའི་མཐེབ་མཛུབ་བར་གྱི་གཉན་པའི་ཤ་གནད་ཀྱི་མིང་ཡིན།', false, 1), ('B', 'ཤ་བའི་ཤ་གི་མིང་གི་རྣམ་གྲངས་ཡིན།', false, 2), ('C', 'གར་ནག་གྱི་མིང་གྱི་རྣམ་གྲངས་ཡིན།', false, 3), ('D', 'གོང་ལུ་འཁོད་འདི་ཡོད་པའི་གདམ་ཁ་གསུམ་ཆ་རང་མེན།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'ཚ་བའི་ནད་ལ་དྲོད་བཅོས་དང་གྲང་བའི་ནད་ལ་བསིལ་བཅོས་བྱེད་པ་ལྟ་བུ་ངོ་བོ་མི་མཐུན་པའི་སོར་བ་བྱས་པ་ལ་ག་ཅི་ཟེརཝ་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ལྷག་པའི་སོར་བ།', false, 1), ('B', 'ལོག་པའི་སོར་བ།', false, 2), ('C', 'མཐུན་པའི་སོར་བ།', false, 3), ('D', 'མི་མཐུན་པའི་སོར་བ།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'ལྕེའི་སྟེང་དུ་འབྲུམ་པ་ཞིབ་མོར་འབྱུང་བའི་བྱིས་པའི་ཁ་ནད་ཀྱི་མིང་ལ་ག་ཅི་ཟེརཝ་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'བྱིས་པ་ཁ་ལང་བ།', false, 1), ('B', 'བྱིས་པའི་ཁ་རྨ།', false, 2), ('C', 'བྱིས་པའི་ཁ་ལ་ཚ་བ་རྒྱས་པ།', false, 3), ('D', 'བྱིས་པའི་ཁ་ནད།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'མེ་བཙའ་གདབ་མི་རུང་བའི་ཡུལ་མིག་ལ་སོགས་པའི་དབང་པོ་ལུ་ག་ཅིག་ཟེརཝ་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དབང་པོའི་གསང་དམིགས།', false, 1), ('B', 'མེ་བཙའི་གསང་དམིགས།', false, 2), ('C', 'དབང་ཐང་སྒོ།', false, 3), ('D', 'དབང་པོའི་སྒོ།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'རོ་དང་ཞུ་རྗེས་སོགས་ལ་བལྟོས་མི་དགོས་པ་ནད་བབས་སའི་གནས་དང་ གཉེན་པོ་གཉིས་ཕན་ཚུན་མདོག་དབྱིབས་འདྲ་མཐུན་གྱི་སྒོ་
ནས་ནད་འཇོམས་པར་བྱེད་པའི་སྨན་གྱི་ནུས་པའི་མིང་ལུ་ ག་ཅིག་སབ་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གཉེན་པོའི་ཐུས་པ།', false, 1), ('B', 'ངོ་འོའི་ནུས་པ།', false, 2), ('C', 'དབྱིབས་མཐུན་གྱི་ནུས་པ།', false, 3), ('D', 'རྟེན་འབྲུལ་གྱི་ནུས་པ།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'འབྱུང་པོས་རྒྱུད་བརླམ་ནས་ལུས་ངག་ཡིད་གསུམ་གྱི་སོད་པ་སྒྱུར་བར་བྱེད་པའི་ལྷ་གདོན་སོགས་བཅོ་བརྒྱད་ཀྱི་བསྡུས་མིང་ལུ་ག་ཅིག་སབ་
སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'འབྱུང་པོའི་གདོན་ཆེན་བཅོ་ལྔ།', false, 1), ('B', 'འབྱུང་པོའི་གདོན་ཆེན་བཅོ་བརྒྱད།', false, 2), ('C', 'འབྱུང་པོའི་གདོན་ཆེན་ཉི་ཤུ།', false, 3), ('D', 'འབྱུང་པོའི་གདོན་ཆེན་བཅུ་གསུམ།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'འབྱུང་འགྱུར་ངོ་བོ་ལོག་པའི་སྐབས་ལ་བལྟོས་ནས་བཏགས་པའི་ལྷེན་སྣ་ནས་འོག་ཏུ་ཚོན་དོ་གཞལ་བའི་སར་ཡོད་པའི་མེ་བཙའི་གསང་
དམིགས་ཀྱི་མིང་ག་ཅིག་སབ་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ལྷེན་གསང་།', false, 1), ('B', 'སྐྲན་གསང་།', false, 2), ('C', 'ལྷེན་སྐྲན་གསང་།', false, 3), ('D', 'མེ་ཉམས་གསང་།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'མེ་ལྕེ་འཁོར་ལོ་ཞེས་པ་ནི?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ནད་ཀྱི་རྟགས་ལ་བལྟོས་ནས་བཏགས་པའི་གཉན་ནད་པགས་ལ་བབས་པའི་ནད་ཀྱི་མིང་ཡིན།', false, 1), ('B', 'ནད་ཀྱི་རྟགས་ལ་བལྟོས་ནས་བཏགས་པའི་གཉན་ནད་རུས་ལ་བབས་པའི་ནད་ཀྱི་མིང་ཡིན།', false, 2), ('C', 'ནད་ཀྱི་རྟགས་ལ་བལྟོས་ནས་བཏགས་པའི་གཉན་ནད་ཤ་ལ་བབས་པའི་ནད་ཀྱི་མིང་ཡིན།', false, 3), ('D', 'ནད་ཀྱི་རྟགས་ལ་བལྟོས་ནས་བཏགས་པའི་གཉན་ནད་ཁྲག་ལ་བབས་པའི་ནད་ཀྱི་མིང་ཡིན།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'གསོ་བ་པོ་སྨན་པས་དུས་རྟག་ཏུ་བློ་ལ་དམ་པོར་གཟུངས་བར་བྱ་དགོས་པའི་དམ་ཚིག་གཉིས་ལ་ག་ཅིག་ཟེརཝ་སྨོ?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'རྟེན་འབྲེལ་གཉིས།', false, 1), ('B', 'དམ་ཚིགས་གཉིས།', false, 2), ('C', 'གཟུང་བྱ་གཉིས།', false, 3), ('D', 'ཤེས་བྱ་གཉིས།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'རིམས་ཉིན་གཅིག་པ་ཞེས་པ་ནི?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'རིམས་ནད་ཤ་ལ་བབས་པའི་མིང་ཡིན།', false, 1), ('B', 'རིམས་ནད་སྙིང་ལ་བབས་པའི་མིང་ཡིན།', false, 2), ('C', 'རིམས་ནད་ཁྲག་ལ་བབས་པའི་མིང་ཡིན།', false, 3), ('D', 'རིམས་ནད་ལྤགས་ལ་བབས་པའི་མིང་ཡིན།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'གསོ་རིག་ཞི་གནས་དང་ལུས་སོང་འདི་འབྲུག་ལུ་ག་གིས་སྟོན་གནང་ཡི?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དྲུང་འཚོ་ཡེ་ཤེས་དཔལ་འབྱོར།', false, 1), ('B', 'དྲུང་འཚོ་རྟེན་འབྲེལ་དབང་འདུས།', false, 2), ('C', 'དྲུང་འཚོ་ཕུར་པ་ཚེ་རིང་།', false, 3), ('D', 'དྲུང་འཚ་ཆོས་སྐྱིད་དབང་མོ།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'mcq', 'ཨུ་པ་དེ་ཤ་ཞེས་པ་ནི?', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'མན་ངག་ཡིན།', false, 1), ('B', 'སྨན་གྱི་མིང་ཡིན།', false, 2), ('C', 'སོར་སྡེའི་མིང་ཡིན་།', false, 3), ('D', 'བཀའ་ཡིན།', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'short_answer', 'དྲི་བ་དང་པ།
བཀོད་རྒྱ། གཤམ་འཁོད་ལན་གཉིས་ལས་གཅིག་གདམ་ཁ་རྐྱབ་ཏེ་ས་སྟོང་ཚུ་བཀང་ནི། ༼༡x༥=༥༽
༡༽ འཇམ་རྩིའི་ནང་ཚན་ རླུང་དང་བད་ཀན་ལྡན་པའི་ནད་སོང་བར་བྱེད་པའི་མས་བཏང་གྱི་མིང་ལ་་་་་་་་་་་་་་་་་ཟེར་སབ་ཨིན། ༼བཀྲུ་མ་སླེན/ནི་རུ་
ཧ༽ (༡)
༢༽ འོ་མ་དང་། ཞོ། མར་གསུམ་གྱི་བསྡུས་མིང་ལུ་་་་་་་་་་་་་་་་་ཟེར་སབ་ཨིན། ༼དཀར་གསུམ/མངར་གསུམ༽ (༡)
༣༽ ལུས་ཀྱི་ཆུ་ཁམས་རྒྱུ་བའི་རྩའི་གཙོ་བོའི་མིང་ལུ་་་་་་་་་་་་་་་་་་་་་་་་ཟེར་སབ་ཨིན། ༼རྐྱང་མ/རོ་མ༽ (༡)
༤༽ དུས་ཡུན་ཐུང་ངུ་ཞིག་ལ་་་་་་་་་་་་་་་་་་་་་་་་ཟེར་སབ་ཨིན། ༼སྐད་ཅིག/ཐང་ཅིག༽ (༡)
༥༽ ་་་་་་་་་་་་་་་་་་་་་་་་་་ཟེར་མི་འདི་ ཤའི་སྟེང་དུ་གཡོགས་པའི་པགས་པ་ཕྱི་མ་ཤིན་ཏུ་སྲབ་པ་ལུ་སབ་ཨིན། ༼སྐྱི་པགས/པགས་གསོབ༽ (༡)', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 1.0, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'short_answer', 'དྲི་བ་གཉིས་པ།
བཀོད་རྒྱ། གཤམ་འཁོད་ཚིག་ཚུ་གི་ངེས་ཚིག་བྲིས། ༼༢x༥=༡༠༽
༡༽ ཁ་ཟས་ཡན་ལ་གཏད་པ། ༼༢ ཁམས་འཁྲུགས་པ།
༣༽ ཁམས་ལྔ། ༤༽ ཁོང་སྙོམ།
༥༽ རྒྱུད་བཞི།

(Marks: 5 - set to the latest RCSC layout; the 2024 paper gave 10.)', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 1.0, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'short_answer', 'དྲི་བ་གསུམ་པ།
བཀོད་རྒྱ། འོག་ལུ་ཡོད་པའི་དོན་ཚུ་ལེགས་ཤོམ་སྦེ་ལྷག་ཞིནམ་ལས་ཨིན་པ་ཅིན་ཨིན་པའི་རྟགས་༼༽ དང་མིན་པ་ཅིན་མིན་པའི་རྟགས་ ༼x༽
བཀལ། ༼སྐུགས་༡x༡༥=༡༥༽
༡༽ གཏེར་སྟོན་གྲྭ་པ་མངོན་ཤེས་ སྤྱི་ལོ་༡༠༡༢ ལུ་སྐུ་འཁྲུངས་ནུག།
༢༽ ཟུར་མཁར་བློ་གྲོས་༡༥༠༩ ལོར་སྐུ་འཁྲུངས་ནུག།
༣༽ མཁའ་འགྲོ་ཡེ་ཤེས་མཚོ་རྒྱལ་ནས་སྨན་སོར་མཛད་ཚུལ་སྐོར་གསོ་རིག་འབྱུང་ཁུངས་མུ་ཏིག་འཕྲེང་མཛེས་ནང་ལུ་མེད།
༤༽ གཏེར་སྟོན་ཚེ་རིང་རྡོ་རྗེ་ཟེར་མི་འདི་སྤ་གྲོ་གདོང་དཀར་ལའི་དགུ་མལ་ལྷུ་གླིང་ཟེར་སའི་གཡུས་དེ་ཁར་སྐུ་འཁྲུངས་ནུག
༥༽ གསོ་རིག་རྒྱུད་བཞི་པར་བརྐོ་གནང་མི་སྡེ་སྲིད་འབྲུག་རྣམ་རྒྱལ་ཨིན།
༦༽ འབྲུག་རྒྱལ་གཉིས་པའི་སྐུ་དུས་ཀྱི་དྲུང་འཚོ་ཟླ་བ་དཔལ་འབྱོར་ཨིན།
༧༽ འབྲུག་ལུ་ནང་པའི་སྨན་ཁང་འདི་གཞུང་འབྲེལ་ཐོག་དབྱིན་ལོ་༡༩༩༩ ལོར་གཞི་བཙུགས་གནང་ནུག
༨༽ ལ་དྭགས་ཨམ་རྗེ་ཟེར་མི་འདི་ མཁས་དབང་ཐུབ་བསྟན་ལེགས་པའི་བློ་གྲོས་ཨིན།
༩༽ གྲང་བ་གཏིང་དུ་འཁར་ཞེས་པ་ནི་ལུས་ཟུངས་ཡོངས་གྲང་བའི་གྲོགས་སམ་རྟེན་དུ་གྱུར་ནས་བཅོས་དཀའ་བའི་གྲང་བའི་ནད་ཀྱི་མིང་
ཡིན།
༡༠༽ དངུལ་ཆུ་བཙོ་བཀྲུ་ཆེན་མོ་ཞེས་པ་ནི་དངུལ་ཆུའི་དུག་རྣམས་ཕྱིར་བསལ་ནས་བཅུད་ལེན་དུ་བསྒྱུར་པའི་ཆོ་ག་རྒྱས་པའི་མིང་ཡིན།
༡༡༽ བུད་མེད་ཀྱི་མངལ་ནང་གནས་པའི་སྲིན་བུ་མ་ར་ཀ་ལངས་པ་དང་ ཨ་སོ་ཀ་ཁྲོས་པ་ལས་བྱུང་བའི་ནད་ལུ་ མངལ་སྲིན་ཟེར་སབ་ཨིན།
༡༢༽ སྔོ་ཡི་བུ་མོ་སྤུན་བདུན་ཞེས་པ་ནི་ གཡའ་ཀྱི་དང་། སྟོང་ཟིལ། གང་ག་ཆུང་། ཧོང་ལེན། ཏིག་ཏ། བོང་དཀར་། སྤང་རྩི་བཅས་བདུན་
གྱི་བསྡུས་མིང་ཡིན།
༡༣༽ ཅུར་ནིས་ཞེས་པ་ནི་ཕྱེ་མའི་མིང་གི་རྣམ་གྲང་ཤིག་ཡིན།
༡༤༽ ལུས་ཟུངས་ཀྱི་བཅུད་ཤ་དང་། རྩི་ཡི་བཙུད་མར། ཤིང་གི་བཅུད་བུ་རམ། འབྲུ་ཡི་བཅུད་ཆང་བཅས་བཞི་ལུ་བཅུད་བཞི་ཟེར་སབ་ཨིན།
༡༥༽ སྙིགས་མ་ལྔ་ཞེས་པ་ནི་ ཚེའི་སྙིགས་མ་ཚེ་ལོ་བརྒྱ་པ་མར་འགྲིབ་དང་། ཉོན་མོངས་ཀྱི་སྙིགས་མ་དྲག་ལ་རྒྱུན་རིང་བ།
ལྟ་བའི་སྙིགས་མ་ཕྱིན་ཅི་ལོག་ཏུ་བསྒྱུར་པ། སེམས་ཅན་གྱི་སྙིགས་མ་རྒྱུད་འདུལ་དཀའ་བ། དུས་ཀྱི་སྙིགས་མ་རྩོད་ལྡན་བཅས་ལྔ་ཡིན།

(Marks: 5 - set to the latest RCSC layout; the 2024 paper gave 15.)', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 1.0, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'descriptive', 'དྲི་བ་བཞི་པ།
བཀོད་རྒྱ། དྲི་བ་ཆ་མཉམ་གྱི་ལན་ཚུ་ལན་ཤོག་ནང་ལུ་བྲིས།
༡༽ གནས་སྐབས་ཀྱི་སྤྱོད་ལམ་ཞེས་པ་གང་ཡིན་ཁ་གསལ་བྲིས? (༥)

(Marks: 3 - set to the latest RCSC layout; the 2024 paper gave 5.)', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3, 324,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 1.5, 1), ('Application', 'Applies the idea to the question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 0.5, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'descriptive', 'དྲི་བ་བཞི་པ།
བཀོད་རྒྱ། དྲི་བ་ཆ་མཉམ་གྱི་ལན་ཚུ་ལན་ཤོག་ནང་ལུ་བྲིས།
༢༽ ཡ་མའི་ནད་གཞི་ཞེས་པ་གང་ཡིན་དང་དེའི་སྨན་དང་དཔྱད་ཀྱི་སྐོར་རྒྱས་པར་བྲིས? (༥)

(Marks: 3 - set to the latest RCSC layout; the 2024 paper gave 5.)', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3, 324,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 1.5, 1), ('Application', 'Applies the idea to the question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 0.5, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'descriptive', 'དྲི་བ་བཞི་པ།
བཀོད་རྒྱ། དྲི་བ་ཆ་མཉམ་གྱི་ལན་ཚུ་ལན་ཤོག་ནང་ལུ་བྲིས།
༣༽ ལས་ལྔའི་སྐོར་ལས་ཚིགས་འབྲུ་༢༥༠ ལས་མ་ཉུངམ་ཅིག་བྲིས? (༨)

(Marks: 3 - set to the latest RCSC layout; the 2024 paper gave 8.)', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3, 324,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 1.5, 1), ('Application', 'Applies the idea to the question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 0.5, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'descriptive', 'དྲི་བ་བཞི་པ།
བཀོད་རྒྱ། དྲི་བ་ཆ་མཉམ་གྱི་ལན་ཚུ་ལན་ཤོག་ནང་ལུ་བྲིས།
༤༽ རྩུབ་དཔྱད་ཀྱི་སྐོར་ལས་ཚིགས་འབྲུ་༢༥༠ ལས་མ་ཉུངམ་ཅིག་བྲིས? (༨)

(Marks: 3 - set to the latest RCSC layout; the 2024 paper gave 8.)', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3, 324,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 1.5, 1), ('Application', 'Applies the idea to the question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 0.5, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'descriptive', 'དྲི་བ་བཞི་པ།
བཀོད་རྒྱ། དྲི་བ་ཆ་མཉམ་གྱི་ལན་ཚུ་ལན་ཤོག་ནང་ལུ་བྲིས།
༥༽ གྲང་བའི་རྩ་དྲུག་གི་སྐོར་ལས་ཁ་གསལ་བྲིས? (༤)

(Marks: 3 - set to the latest RCSC layout; the 2024 paper gave 4.)', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3, 324,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 1.5, 1), ('Application', 'Applies the idea to the question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 0.5, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'descriptive', 'དྲི་བ་བཞི་པ།
བཀོད་རྒྱ། དྲི་བ་ཆ་མཉམ་གྱི་ལན་ཚུ་ལན་ཤོག་ནང་ལུ་བྲིས།
༦༽ སུག་སྨེལ་བཅུ་དགུའི་ནུས་པ་ཁ་གསལ་བྲིས? (༤)

(Marks: 3 - set to the latest RCSC layout; the 2024 paper gave 4.)', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3, 324,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 1.5, 1), ('Application', 'Applies the idea to the question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 0.5, 3)) as v(l, d, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', 'descriptive', 'དྲི་བ་བཞི་པ།
བཀོད་རྒྱ། དྲི་བ་ཆ་མཉམ་གྱི་ལན་ཚུ་ལན་ཤོག་ནང་ལུ་བྲིས།
༧༽ དྲི་ཆུ་བརྟག་དཔྱད་འབད་བའི་སྐབས་སུ་ དྲི་ཆུའི་འཁྲུལ་སོ་ཇི་བསལ་དགོས་ཁ་གསལ་བྲིས? (༦)

(Marks: 3 - set to the latest RCSC layout; the 2024 paper gave 6.)', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3, 324,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.", "Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF."], "batch": "ME Paper II (Technical, Traditional Medicine): BCSE 2024 - questions only, Drungtsho to add answers", "source": {"title": "BCSE 2024 Main Examination, Technical Paper II, Traditional Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, (select id from public.subject_groups where code = 'traditional-medicine'))
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, 2024 from nq)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values ('Content', 'Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.', 1.5, 1), ('Application', 'Applies the idea to the question with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer in good Dzongkha.', 0.5, 3)) as v(l, d, m, p);
commit;
