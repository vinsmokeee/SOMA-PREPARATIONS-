-- Claude-written PE practice questions, loaded as drafts (awaiting review) for /admin/ai/review.

begin;

insert into public.topics (subject_id, slug, name) select id, 'honorific-words', 'Honorific words (ཞེ་ས)' from public.subjects where slug = 'dzongkha-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'opposites', 'Opposites (འགལ་མིང)' from public.subjects where slug = 'dzongkha-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'particles', 'Particles (ཚིག་ཕྲད)' from public.subjects where slug = 'dzongkha-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'vocabulary', 'Vocabulary' from public.subjects where slug = 'dzongkha-communication' on conflict (subject_id, slug) do nothing;

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'མགོ ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “མགོ”?)', '“མགོ” means head; its honorific (ཞེ་ས) is “དབུ”. Source: DDC Dzongkha–English Dictionary, p. 149.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དབུ', true, 1), ('B', 'ཞབས', false, 2), ('C', 'ཕྱག', false, 3), ('D', 'ཞལ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'གདོང ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “གདོང”?)', '“གདོང” means face; its honorific (ཞེ་ས) is “ཞལ”. Source: DDC Dzongkha–English Dictionary, p. 431.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དབུ', false, 1), ('B', 'ཞལ', true, 2), ('C', 'ཞབས', false, 3), ('D', 'ཐུགས', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'རྐང་པ ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “རྐང་པ”?)', '“རྐང་པ” means leg, foot; its honorific (ཞེ་ས) is “ཞབས”. Source: DDC Dzongkha–English Dictionary, p. ix (guide page).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཕྱག', false, 1), ('B', 'དབུ', false, 2), ('C', 'ཞབས', true, 3), ('D', 'ཞལ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'སྐྲ ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “སྐྲ”?)', '“སྐྲ” means hair; its honorific (ཞེ་ས) is “དབུ་སྐྲ”. Source: DDC Dzongkha–English Dictionary, p. 49.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཞབས་སྐྲ', false, 1), ('B', 'ཕྱག་སྐྲ', false, 2), ('C', 'ཞལ་སྐྲ', false, 3), ('D', 'དབུ་སྐྲ', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'གོ་ལ ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “གོ་ལ”?)', '“གོ་ལ” means dress, clothes; its honorific (ཞེ་ས) is “ན་བཟའ”. Source: DDC Dzongkha–English Dictionary, p. 113.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ན་བཟའ', true, 1), ('B', 'ཕྱག་ཕྲེང', false, 2), ('C', 'ཞབས་ལྷམ', false, 3), ('D', 'གསོལ་ཇ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'ཇ ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “ཇ”?)', '“ཇ” means tea; its honorific (ཞེ་ས) is “གསོལ་ཇ”. Source: DDC Dzongkha–English Dictionary, p. 267.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཞལ་ཇ', false, 1), ('B', 'གསོལ་ཇ', true, 2), ('C', 'ཕྱག་ཇ', false, 3), ('D', 'སྐུ་ཇ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'ཉལ་ཁང ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “ཉལ་ཁང”?)', '“ཉལ་ཁང” means bedroom; its honorific (ཞེ་ས) is “གཟིམ་ཁང”. Source: DDC Dzongkha–English Dictionary, p. 287.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གསོལ་ཁང', false, 1), ('B', 'ཕྱག་ཁང', false, 2), ('C', 'གཟིམ་ཁང', true, 3), ('D', 'ཞལ་ཁང', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'ཐབ ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “ཐབ”?)', '“ཐབ” means kitchen; its honorific (ཞེ་ས) is “གསོལ་ཐབ”. Source: DDC Dzongkha–English Dictionary, p. 354.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གཟིམ་ཐབ', false, 1), ('B', 'ཞལ་ཐབ', false, 2), ('C', 'ཕྱག་ཐབ', false, 3), ('D', 'གསོལ་ཐབ', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'ཕ་མ ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “ཕ་མ”?)', '“ཕ་མ” means father and mother, parents; its honorific (ཞེ་ས) is “ཡབ་ཡུམ”. Source: DDC Dzongkha–English Dictionary, p. 557.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཡབ་ཡུམ', true, 1), ('B', 'སྐུ་ཕ་མ', false, 2), ('C', 'ཞལ་ཕ་མ', false, 3), ('D', 'ཕྱག་ཕ་མ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'ཚ་བོ ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “ཚ་བོ”?)', '“ཚ་བོ” means nephew, grandson; its honorific (ཞེ་ས) is “སྐུ་ཚ”. Source: DDC Dzongkha–English Dictionary, p. 751.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཞལ་ཚ', false, 1), ('B', 'སྐུ་ཚ', true, 2), ('C', 'ཕྱག་ཚ', false, 3), ('D', 'དབུ་ཚ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'མི་རབས ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “མི་རབས”?)', '“མི་རབས” means generation; its honorific (ཞེ་ས) is “གདུང་རབས”. Source: DDC Dzongkha–English Dictionary, p. 681.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'སྐུ་རབས', false, 1), ('B', 'ཞལ་རབས', false, 2), ('C', 'གདུང་རབས', true, 3), ('D', 'ཕྱག་རབས', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'མིང་གནས ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “མིང་གནས”?)', '“མིང་གནས” means title, name; its honorific (ཞེ་ས) is “མཚན་གནས”. Source: DDC Dzongkha–English Dictionary, p. 688.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཞལ་གནས', false, 1), ('B', 'སྐུ་གནས', false, 2), ('C', 'ཕྱག་གནས', false, 3), ('D', 'མཚན་གནས', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'ཕྲེང་བ ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “ཕྲེང་བ”?)', '“ཕྲེང་བ” means rosary, string of beads; its honorific (ཞེ་ས) is “ཕྱག་ཕྲེང”. Source: DDC Dzongkha–English Dictionary, p. 587.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཕྱག་ཕྲེང', true, 1), ('B', 'ཞལ་ཕྲེང', false, 2), ('C', 'དབུ་ཕྲེང', false, 3), ('D', 'སྐུ་ཕྲེང', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'ཁ་ཏ ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “ཁ་ཏ”?)', '“ཁ་ཏ” means advice; its honorific (ཞེ་ས) is “ཞལ་ཏ”. Source: DDC Dzongkha–English Dictionary, p. 58.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཕྱག་ཏ', false, 1), ('B', 'ཞལ་ཏ', true, 2), ('C', 'སྐུ་ཏ', false, 3), ('D', 'དབུ་ཏ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'གཉིད་དཀྲོག ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “གཉིད་དཀྲོག”?)', '“གཉིད་དཀྲོག” means wake (someone) up; its honorific (ཞེ་ས) is “མནལ་དཀྲོག”. Source: DDC Dzongkha–English Dictionary, p. 301.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གཟིམ་དཀྲོག', false, 1), ('B', 'ཞལ་དཀྲོག', false, 2), ('C', 'མནལ་དཀྲོག', true, 3), ('D', 'སྐུ་དཀྲོག', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'སྟོད་གོ ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “སྟོད་གོ”?)', '“སྟོད་གོ” means jacket, upper garment; its honorific (ཞེ་ས) is “སྐུ་སྟོད”. Source: DDC Dzongkha–English Dictionary, p. 342.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དབུ་སྟོད', false, 1), ('B', 'ཞལ་སྟོད', false, 2), ('C', 'ཕྱག་སྟོད', false, 3), ('D', 'སྐུ་སྟོད', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'བརྩེ་བ ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “བརྩེ་བ”?)', '“བརྩེ་བ” means love, kindness; its honorific (ཞེ་ས) is “ཐུགས་བརྩེ”. Source: DDC Dzongkha–English Dictionary, p. 747.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཐུགས་བརྩེ', true, 1), ('B', 'སྐུ་བརྩེ', false, 2), ('C', 'ཞལ་བརྩེ', false, 3), ('D', 'ཕྱག་བརྩེ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'མགོ ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “མགོ”?)', '“མགོ” and “མཇུག” are opposites (head / tail, end). Source: DDC Dzongkha–English Dictionary, p. 149.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དབུ', false, 1), ('B', 'སྟོད', false, 2), ('C', 'མཇུག', true, 3), ('D', 'མདུན', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'སྐམ་ཞིང ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “སྐམ་ཞིང”?)', '“སྐམ་ཞིང” and “ཆུ་ཞིང” are opposites (dry land / wet (paddy) land). Source: DDC Dzongkha–English Dictionary, p. 30.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'སོ་ནམ', false, 1), ('B', 'ཞིང་ཁ', false, 2), ('C', 'སྐམ་ས', false, 3), ('D', 'ཆུ་ཞིང', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'གླིང་ཆེན ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “གླིང་ཆེན”?)', '“གླིང་ཆེན” and “གླིང་ཕྲན” are opposites (continent / island). Source: DDC Dzongkha–English Dictionary, p. 129.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གླིང་ཕྲན', true, 1), ('B', 'རྒྱལ་ཁབ', false, 2), ('C', 'ས་ཁོངས', false, 3), ('D', 'མཚོ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'གྱེན ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “གྱེན”?)', '“གྱེན” and “ཐུར” are opposites (ascent, uphill / downhill). Source: DDC Dzongkha–English Dictionary, p. 118.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཡར', false, 1), ('B', 'ཐུར', true, 2), ('C', 'སྟོད', false, 3), ('D', 'མཐོ་ས', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'ཁེ ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “ཁེ”?)', '“ཁེ” and “གྱོང” are opposites (profit / loss). Source: DDC Dzongkha–English Dictionary, p. 118.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཕན', false, 1), ('B', 'ཐོབ', false, 2), ('C', 'གྱོང', true, 3), ('D', 'ཁེ་ཕན', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'བཅོས་མ ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “བཅོས་མ”?)', '“བཅོས་མ” and “ངོ་མ” are opposites (artificial / genuine). Source: DDC Dzongkha–English Dictionary, p. 235.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'རྫུན་མ', false, 1), ('B', 'ཟོལ', false, 2), ('C', 'བཟོ་བཅོས', false, 3), ('D', 'ངོ་མ', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'ཐོབ ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “ཐོབ”?)', '“ཐོབ” and “ཤོར” are opposites (gain / lose). Source: DDC Dzongkha–English Dictionary, p. 367.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཤོར', true, 1), ('B', 'ལེན', false, 2), ('C', 'འཐོབ', false, 3), ('D', 'རྙེད', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'མཐུན ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “མཐུན”?)', '“མཐུན” and “འགལ” are opposites (agree / contradict). Source: DDC Dzongkha–English Dictionary, p. 374.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'འགྲིག', false, 1), ('B', 'འགལ', true, 2), ('C', 'མཐུན་འགྱུར', false, 3), ('D', 'འཆམ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'སྡིག་པ ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “སྡིག་པ”?)', '“སྡིག་པ” and “དགེ་བ” are opposites (sin / virtue). Source: DDC Dzongkha–English Dictionary, p. 465.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཉེས་པ', false, 1), ('B', 'ལས', false, 2), ('C', 'དགེ་བ', true, 3), ('D', 'སྡུག་བསྔལ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'ནང་ལོགས ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “ནང་ལོགས”?)', '“ནང་ལོགས” and “ཕྱི་ལོགས” are opposites (inside / outside). Source: DDC Dzongkha–English Dictionary, p. 485.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ནང་ཁ', false, 1), ('B', 'བར་ལོགས', false, 2), ('C', 'སྟོད་ལོགས', false, 3), ('D', 'ཕྱི་ལོགས', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'དཔོན ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “དཔོན”?)', '“དཔོན” and “གཡོག” are opposites (master / servant). Source: DDC Dzongkha–English Dictionary, p. 534.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གཡོག', true, 1), ('B', 'རྒྱལ་པོ', false, 2), ('C', 'བླ་མ', false, 3), ('D', 'དྲུང', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'ཕམ ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “ཕམ”?)', '“ཕམ” and “རྒྱལ” are opposites (defeat / victory). Source: DDC Dzongkha–English Dictionary, p. 563.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཤོར', false, 1), ('B', 'རྒྱལ', true, 2), ('C', 'ཉེས', false, 3), ('D', 'འཐབ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'བསྔགས་པ ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “བསྔགས་པ”?)', '“བསྔགས་པ” and “སྨད་པ” are opposites (praise / blame). Source: DDC Dzongkha–English Dictionary, p. 226.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'བསྟོད་པ', false, 1), ('B', 'དགའ་བ', false, 2), ('C', 'སྨད་པ', true, 3), ('D', 'ཡིད་ཆེས', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'སྟོད ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “སྟོད”?)', '“སྟོད” and “སྨད” are opposites (upper part / lower part). Source: DDC Dzongkha–English Dictionary, p. 342.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གོང', false, 1), ('B', 'ཡར', false, 2), ('C', 'མགོ', false, 3), ('D', 'སྨད', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'བརྩིག ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “བརྩིག”?)', '“བརྩིག” and “བཤིག” are opposites (build, pile up / demolish). Source: DDC Dzongkha–English Dictionary, p. 746.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'བཤིག', true, 1), ('B', 'བཟོ', false, 2), ('C', 'བསྐྲུན', false, 3), ('D', 'སྤུང', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'བརྩོན་འགྲུས ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “བརྩོན་འགྲུས”?)', '“བརྩོན་འགྲུས” and “ལེ་ལོ” are opposites (diligence / laziness). Source: DDC Dzongkha–English Dictionary, p. 747.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དཀའ་སྤྱད', false, 1), ('B', 'ལེ་ལོ', true, 2), ('C', 'ཤུགས', false, 3), ('D', 'སེམས་ཤུགས', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'གཙང་ཏོག་ཏོ ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “གཙང་ཏོག་ཏོ”?)', '“གཙང་ཏོག་ཏོ” and “བཙོག་སི་སི” are opposites (clean / dirty). Source: DDC Dzongkha–English Dictionary, p. 721.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གཙང་མ', false, 1), ('B', 'དྭངས་ཏོག་ཏོ', false, 2), ('C', 'བཙོག་སི་སི', true, 3), ('D', 'སྐམ་ཀྲོག་ཀྲོ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What does the Dzongkha word “གླིང་ཕྲན” mean?', '“གླིང་ཕྲན” means island. Source: DDC Dzongkha–English Dictionary, p. 130.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Continent', false, 1), ('B', 'Island', true, 2), ('C', 'Valley', false, 3), ('D', 'Lake', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What does the Dzongkha word “ཚོགས་ཁང” mean?', '“ཚོགས་ཁང” means assembly hall. Source: DDC Dzongkha–English Dictionary, p. 767.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Kitchen', false, 1), ('B', 'Classroom', false, 2), ('C', 'Assembly hall', true, 3), ('D', 'Storeroom', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What does the Dzongkha word “མི་རབས” mean?', '“མི་རབས” means generation. Source: DDC Dzongkha–English Dictionary, p. 681.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Population', false, 1), ('B', 'Citizen', false, 2), ('C', 'Family name', false, 3), ('D', 'Generation', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What does the Dzongkha word “ཆུ་ཞིང” mean?', '“ཆུ་ཞིང” means paddy field (wet land). Source: DDC Dzongkha–English Dictionary, p. 253.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Paddy field (wet land)', true, 1), ('B', 'Dry land', false, 2), ('C', 'Riverbank', false, 3), ('D', 'Water tank', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What does the Dzongkha word “བཅོས་མ” mean?', '“བཅོས་མ” means artificial. Source: DDC Dzongkha–English Dictionary, p. 235.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Genuine', false, 1), ('B', 'Artificial', true, 2), ('C', 'Ancient', false, 3), ('D', 'Expensive', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What does the Dzongkha word “ཕྱི་མི” mean?', '“ཕྱི་མི” means foreigner, outsider. Source: DDC Dzongkha–English Dictionary, p. 578.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Neighbour', false, 1), ('B', 'Relative', false, 2), ('C', 'Foreigner, outsider', true, 3), ('D', 'Guest of honour', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What does the Dzongkha word “བརྩོན་འགྲུས” mean?', '“བརྩོན་འགྲུས” means diligence, hard work. Source: DDC Dzongkha–English Dictionary, p. 747.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Patience', false, 1), ('B', 'Laziness', false, 2), ('C', 'Honesty', false, 3), ('D', 'Diligence, hard work', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What does the Dzongkha word “སྔོན་ཤེས” mean?', '“སྔོན་ཤེས” means foresight, foreknowledge. Source: DDC Dzongkha–English Dictionary, p. 226.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Foresight, foreknowledge', true, 1), ('B', 'Memory', false, 2), ('C', 'Regret', false, 3), ('D', 'Ignorance', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'སྟོང་ས་ནང་ འབྲེལ་སྒྲ་ཏག་ཏག་ག་ཅི་བཙུགས་དགོཔ་སྨོ?

རྒྱལ་ཁབ་______་མི་སེར།

(Choose the correct genitive particle: “citizens of the country”.)', 'The genitive particle is written ཀྱི after བ, ད and ས. “རྒྱལ་ཁབ” ends in བ, so: རྒྱལ་ཁབ་ཀྱི་མི་སེར། (rule from The Grammar of Dzongkha, Tshering & van Driem 2019, ch. 4).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'particles'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གི', false, 1), ('B', 'གྱི', false, 2), ('C', 'ཀྱི', true, 3), ('D', 'འི', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'སྟོང་ས་ནང་ འབྲེལ་སྒྲ་ཏག་ཏག་ག་ཅི་བཙུགས་དགོཔ་སྨོ?

ཁྱིམ་______་སྒོ།

(Choose the correct genitive particle: “the door of the house”.)', 'The genitive particle is written གྱི after ན, ར, ལ and མ. “ཁྱིམ” ends in མ, so: ཁྱིམ་གྱི་སྒོ། (rule from The Grammar of Dzongkha, Tshering & van Driem 2019, ch. 4).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'particles'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གི', false, 1), ('B', 'གྱི', true, 2), ('C', 'ཀྱི', false, 3), ('D', 'འི', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'སྟོང་ས་ནང་ འབྲེལ་སྒྲ་ཏག་ཏག་ག་ཅི་བཙུགས་དགོཔ་སྨོ?

འབྲུག་______་ལོ་རྒྱུས།

(Choose the correct genitive particle: “the history of Bhutan”.)', 'The genitive particle is written གི after ག and ང. “འབྲུག” ends in ག, so: འབྲུག་གི་ལོ་རྒྱུས། (rule from The Grammar of Dzongkha, Tshering & van Driem 2019, ch. 4).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'particles'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གི', true, 1), ('B', 'གྱི', false, 2), ('C', 'ཀྱི', false, 3), ('D', 'འི', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'སྟོང་ས་ནང་ འབྲེལ་སྒྲ་ཏག་ཏག་ག་ཅི་བཙུགས་དགོཔ་སྨོ?

ཆོས་______་དཔེ་དེབ།

(Choose the correct genitive particle: “a religious book (book of dharma)”.)', 'The genitive particle is written ཀྱི after བ, ད and ས. “ཆོས” ends in ས, so: ཆོས་ཀྱི་དཔེ་དེབ། (rule from The Grammar of Dzongkha, Tshering & van Driem 2019, ch. 4).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'particles'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གི', false, 1), ('B', 'གྱི', false, 2), ('C', 'ཀྱི', true, 3), ('D', 'འི', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'སྟོང་ས་ནང་ འབྲེལ་སྒྲ་ཏག་ཏག་ག་ཅི་བཙུགས་དགོཔ་སྨོ?

ཡུལ་______་མི་སེར།

(Choose the correct genitive particle: “the people of the village”.)', 'The genitive particle is written གྱི after ན, ར, ལ and མ. “ཡུལ” ends in ལ, so: ཡུལ་གྱི་མི་སེར། (rule from The Grammar of Dzongkha, Tshering & van Driem 2019, ch. 4).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'particles'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གི', false, 1), ('B', 'གྱི', true, 2), ('C', 'ཀྱི', false, 3), ('D', 'འི', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'སྟོང་ས་ནང་ འབྲེལ་སྒྲ་ཏག་ཏག་ག་ཅི་བཙུགས་དགོཔ་སྨོ?

གཞུང་______་ལཱ།

(Choose the correct genitive particle: “government work”.)', 'The genitive particle is written གི after ག and ང. “གཞུང” ends in ང, so: གཞུང་གི་ལཱ། (rule from The Grammar of Dzongkha, Tshering & van Driem 2019, ch. 4).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'particles'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གི', true, 1), ('B', 'གྱི', false, 2), ('C', 'ཀྱི', false, 3), ('D', 'འི', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'སྟོང་ས་ནང་ འབྲེལ་སྒྲ་ཏག་ཏག་ག་ཅི་བཙུགས་དགོཔ་སྨོ?

ནགས་ཚལ་______་ཤིང་།

(Choose the correct genitive particle: “the trees of the forest”.)', 'The genitive particle is written གྱི after ན, ར, ལ and མ. “ནགས་ཚལ” ends in ལ, so: ནགས་ཚལ་གྱི་ཤིང་། (rule from The Grammar of Dzongkha, Tshering & van Driem 2019, ch. 4).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'particles'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གི', false, 1), ('B', 'གྱི', true, 2), ('C', 'ཀྱི', false, 3), ('D', 'འི', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'སྟོང་ས་ནང་ འབྲེལ་སྒྲ་ཏག་ཏག་ག་ཅི་བཙུགས་དགོཔ་སྨོ?

དུས་______་ཡུན་ཚད།

(Choose the correct genitive particle: “the length of time”.)', 'The genitive particle is written ཀྱི after བ, ད and ས. “དུས” ends in ས, so: དུས་ཀྱི་ཡུན་ཚད། (rule from The Grammar of Dzongkha, Tshering & van Driem 2019, ch. 4).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'particles'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གི', false, 1), ('B', 'གྱི', false, 2), ('C', 'ཀྱི', true, 3), ('D', 'འི', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'སྟོང་ས་ནང་ བྱེད་སྒྲ་ཏག་ཏག་ག་ཅི་བཙུགས་དགོཔ་སྨོ?

སློབ་དཔོན་______་སློབ་ཕྲུག་ཚུ་ལུ་ སློབ་སྟོན་འབདཝ་ཨིན།

(Choose the correct ergative particle: “The teacher teaches the students.”)', 'The ergative particle follows the same spelling rule as the genitive: གྱིས after ན, ར, ལ and མ. “སློབ་དཔོན” ends in ན, so: སློབ་དཔོན་གྱིས་སློབ་ཕྲུག་ཚུ་ལུ་ སློབ་སྟོན་འབདཝ་ཨིན། (The Grammar of Dzongkha, ch. 5).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'particles'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གིས', false, 1), ('B', 'གྱིས', true, 2), ('C', 'ཀྱིས', false, 3), ('D', 'ཡིས', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'སྟོང་ས་ནང་ བྱེད་སྒྲ་ཏག་ཏག་ག་ཅི་བཙུགས་དགོཔ་སྨོ?

ཁོང་______་ཡི་གུ་བྲི་ཡི།

(Choose the correct ergative particle: “They wrote a letter.”)', 'The ergative particle follows the same spelling rule as the genitive: གིས after ག and ང. “ཁོང” ends in ང, so: ཁོང་གིས་ཡི་གུ་བྲི་ཡི། (The Grammar of Dzongkha, ch. 5).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'particles'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གིས', true, 1), ('B', 'གྱིས', false, 2), ('C', 'ཀྱིས', false, 3), ('D', 'ཡིས', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'སྟོང་ས་ནང་ བྱེད་སྒྲ་ཏག་ཏག་ག་ཅི་བཙུགས་དགོཔ་སྨོ?

གཞུང་______་ཁྲིམས་གསརཔ་ཅིག་ བཏོན་ཡི།

(Choose the correct ergative particle: “The government issued a new law.”)', 'The ergative particle follows the same spelling rule as the genitive: གིས after ག and ང. “གཞུང” ends in ང, so: གཞུང་གིས་ཁྲིམས་གསརཔ་ཅིག་ བཏོན་ཡི། (The Grammar of Dzongkha, ch. 5).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'particles'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གིས', true, 1), ('B', 'གྱིས', false, 2), ('C', 'ཀྱིས', false, 3), ('D', 'ཡིས', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'སྟོང་ས་ནང་ བྱེད་སྒྲ་ཏག་ཏག་ག་ཅི་བཙུགས་དགོཔ་སྨོ?

ལས་ཁུངས་______་བརྡ་བསྐུལ་འབད་ཡི།

(Choose the correct ergative particle: “The office gave a notice.”)', 'The ergative particle follows the same spelling rule as the genitive: ཀྱིས after བ, ད and ས. “ལས་ཁུངས” ends in ས, so: ལས་ཁུངས་ཀྱིས་བརྡ་བསྐུལ་འབད་ཡི། (The Grammar of Dzongkha, ch. 5).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'particles'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གིས', false, 1), ('B', 'གྱིས', false, 2), ('C', 'ཀྱིས', true, 3), ('D', 'ཡིས', false, 4)) as v(label, body, ok, pos);

commit;
