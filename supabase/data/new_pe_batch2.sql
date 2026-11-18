-- Claude-written PE practice questions, loaded as drafts (awaiting review) for /admin/ai/review.

begin;

insert into public.topics (subject_id, slug, name) select id, 'bar-charts', 'Bar charts' from public.subjects where slug = 'data-interpretation' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'pie-charts', 'Pie charts' from public.subjects where slug = 'data-interpretation' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'statistics-basics', 'Statistics basics' from public.subjects where slug = 'data-interpretation' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'tables', 'Tables' from public.subjects where slug = 'data-interpretation' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'antonyms', 'Antonyms' from public.subjects where slug = 'english-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'grammar', 'Grammar' from public.subjects where slug = 'english-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'synonyms', 'Synonyms' from public.subjects where slug = 'english-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'vocabulary', 'Vocabulary' from public.subjects where slug = 'english-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'ages', 'Ages' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'coding', 'Coding' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'directions', 'Directions' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'interest', 'Interest' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'letter-series', 'Letter series' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'logical-reasoning', 'Logical reasoning' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'number-series', 'Number series' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'odd-one-out', 'Odd one out' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'percentages', 'Percentages' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'profit-and-loss', 'Profit and loss' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'ratio-and-proportion', 'Ratio and proportion' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'relationships', 'Relationships' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'speed-and-distance', 'Speed and distance' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'time-and-calendars', 'Time and calendars' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'work-and-time', 'Work and time' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the word closest in meaning to the word in capitals.

The old lady was known for her BENEVOLENT nature.', 'Benevolent means kind and wanting to help others.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Kind', true, 1), ('B', 'Wealthy', false, 2), ('C', 'Clever', false, 3), ('D', 'Cruel', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the word closest in meaning to the word in capitals.

The engineer kept METICULOUS records of the work.', 'Meticulous means showing great attention to detail; very careful.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Brief', false, 1), ('B', 'Very careful', true, 2), ('C', 'Secret', false, 3), ('D', 'Careless', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the word closest in meaning to the word in capitals.

She gave a CANDID answer to the panel.', 'Candid means honest and direct; frank.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Confused', false, 1), ('B', 'Short', false, 2), ('C', 'Frank', true, 3), ('D', 'Rude', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which word has the opposite meaning of “scarce”?', 'Scarce means not enough; the opposite is plentiful. Rare and limited are close in meaning to scarce.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Costly', false, 1), ('B', 'Rare', false, 2), ('C', 'Limited', false, 3), ('D', 'Plentiful', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which word has the opposite meaning of “transparent”?', 'Transparent means you can see through it; opaque means you cannot.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Opaque', true, 1), ('B', 'Bright', false, 2), ('C', 'Visible', false, 3), ('D', 'Clear', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which word has the opposite meaning of “humble”?', 'Humble means modest; the opposite is arrogant (thinking too highly of oneself).', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Simple', false, 1), ('B', 'Arrogant', true, 2), ('C', 'Modest', false, 3), ('D', 'Polite', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct word to complete the sentence.

Each of the students ______ given a certificate.', '“Each” is singular, so it takes a singular verb: “Each of the students was given…”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'have been', false, 1), ('B', 'were', false, 2), ('C', 'was', true, 3), ('D', 'are', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct word to complete the sentence.

I look forward to ______ you at the interview.', 'In “look forward to”, “to” is a preposition, so it is followed by the -ing form: “look forward to meeting”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'be meeting', false, 1), ('B', 'meet', false, 2), ('C', 'met', false, 3), ('D', 'meeting', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct word to complete the sentence.

He is senior ______ me in the office.', 'Senior, junior, superior and inferior are followed by “to”, not “than”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'to', true, 1), ('B', 'from', false, 2), ('C', 'over', false, 3), ('D', 'than', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct word to complete the sentence.

By the time we reached the hall, the meeting ______.', 'The meeting started before we reached the hall: the earlier past action uses the past perfect, “had started”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'started', false, 1), ('B', 'had started', true, 2), ('C', 'starts', false, 3), ('D', 'has started', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct passive form of: “The committee approved the plan.”', 'Simple past active (approved) becomes simple past passive: was + past participle → “The plan was approved by the committee.”', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'The plan was approving by the committee.', false, 1), ('B', 'The plan is approved by the committee.', false, 2), ('C', 'The plan was approved by the committee.', true, 3), ('D', 'The plan has approved the committee.', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct indirect speech of: He said, “I am tired.”', 'With a past reporting verb (said), “am” changes to “was” and “I” changes to “he”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'He says that he was tired.', false, 1), ('B', 'He said that he is tired.', false, 2), ('C', 'He said that I was tired.', false, 3), ('D', 'He said that he was tired.', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which word is spelt correctly?', 'Necessary has one c and double s: n-e-c-e-s-s-a-r-y.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Necessary', true, 1), ('B', 'Necesary', false, 2), ('C', 'Neccesary', false, 3), ('D', 'Neccessary', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What does the idiom “to hit the nail on the head” mean?', 'To hit the nail on the head is to describe exactly what is causing a situation or problem.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'To hurt someone', false, 1), ('B', 'To say exactly the right thing', true, 2), ('C', 'To work very hard', false, 3), ('D', 'To make a mistake', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What does the idiom “once in a blue moon” mean?', 'Once in a blue moon means very rarely.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Very quickly', false, 1), ('B', 'Every night', false, 2), ('C', 'Very rarely', true, 3), ('D', 'At midnight', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose one word for: “a person who cannot read or write”.', 'Illiterate = unable to read or write. Illegible describes writing that cannot be read.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Illegible', false, 1), ('B', 'Ignorant', false, 2), ('C', 'Illegal', false, 3), ('D', 'Illiterate', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose one word for: “a list of items to be discussed at a meeting”.', 'The agenda lists what will be discussed; the minutes record what was discussed.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Agenda', true, 1), ('B', 'Memo', false, 2), ('C', 'Notice', false, 3), ('D', 'Minutes', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which sentence is correct?', '“One of” is followed by a plural noun (friends), and the verb agrees with “one”: “lives”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'One of my friend lives in Paro.', false, 1), ('B', 'One of my friends lives in Paro.', true, 2), ('C', 'One of my friend live in Paro.', false, 3), ('D', 'One of my friends live in Paro.', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct word to complete the sentence.

He is ______ honest man.', '“Honest” begins with a vowel sound (the h is silent), so we use “an”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'a', false, 1), ('B', 'an', true, 2), ('C', 'the', false, 3), ('D', 'no article', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct word to complete the sentence.

She is very good ______ mathematics.', 'We say “good at” a subject or skill.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'in', false, 1), ('B', 'on', false, 2), ('C', 'at', true, 3), ('D', 'with', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Find the simple interest on Nu. 20,000 at 8% per year for 3 years.', 'Simple interest = P × R × T ÷ 100 = 20,000 × 8 × 3 ÷ 100 = Nu. 4,800.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'interest'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 5,000', false, 1), ('B', 'Nu. 5,400', false, 2), ('C', 'Nu. 4,200', false, 3), ('D', 'Nu. 4,800', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Nu. 10,000 is deposited at 10% per year, compounded yearly. What is the amount after 2 years?', 'Year 1: 10,000 + 1,000 = 11,000. Year 2: 11,000 + 1,100 = Nu. 12,100.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'interest'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 12,100', true, 1), ('B', 'Nu. 12,200', false, 2), ('C', 'Nu. 11,000', false, 3), ('D', 'Nu. 12,000', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A shopkeeper buys a radio for Nu. 800 and sells it for Nu. 1,000. What is the profit percentage?', 'Profit = 200. Profit % = 200 ÷ 800 × 100 = 25% (always on the cost price).', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'profit-and-loss'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '20%', false, 1), ('B', '25%', true, 2), ('C', '30%', false, 3), ('D', '15%', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A chair is sold for Nu. 1,080 at a loss of 10%. What was its cost price?', 'Selling price = 90% of cost price, so cost price = 1,080 ÷ 0.9 = Nu. 1,200.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'profit-and-loss'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 1,100', false, 1), ('B', 'Nu. 1,188', false, 2), ('C', 'Nu. 1,200', true, 3), ('D', 'Nu. 1,180', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A jacket marked Nu. 2,500 is sold at a 20% discount. What is the selling price?', 'Discount = 20% of 2,500 = 500. Selling price = 2,500 − 500 = Nu. 2,000.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'percentages'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 2,100', false, 1), ('B', 'Nu. 2,300', false, 2), ('C', 'Nu. 1,900', false, 3), ('D', 'Nu. 2,000', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A train 240 m long passes a pole in 12 seconds. What is its speed?', 'Speed = 240 ÷ 12 = 20 m/s. To change to km/h multiply by 18/5: 20 × 18 ÷ 5 = 72 km/h.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'speed-and-distance'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '72 km/h', true, 1), ('B', '80 km/h', false, 2), ('C', '86 km/h', false, 3), ('D', '60 km/h', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Pipe A can fill a tank in 4 hours. Pipe B can empty the full tank in 6 hours. If both are opened together on an empty tank, how long will it take to fill?', 'In one hour: 1/4 − 1/6 = 3/12 − 2/12 = 1/12 of the tank. So it takes 12 hours.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'work-and-time'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '10 hours', false, 1), ('B', '12 hours', true, 2), ('C', '2.4 hours', false, 3), ('D', '5 hours', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A father is three times as old as his son. In 10 years he will be twice as old as his son. How old is the son now?', 'Let the son be s: 3s + 10 = 2(s + 10) → s = 10. Check: 30 and 10 now; 40 and 20 in 10 years.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'ages'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '15 years', false, 1), ('B', '8 years', false, 2), ('C', '10 years', true, 3), ('D', '12 years', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What number comes next?

5, 11, 23, 47, ?', 'Each term is doubled and 1 is added: 47 × 2 + 1 = 95.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'number-series'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '96', false, 1), ('B', '71', false, 2), ('C', '94', false, 3), ('D', '95', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What number comes next?

2, 5, 10, 17, 26, ?', 'The terms are n² + 1: 1+1, 4+1, 9+1, 16+1, 25+1, so next is 36 + 1 = 37.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'number-series'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '37', true, 1), ('B', '38', false, 2), ('C', '35', false, 3), ('D', '36', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What number comes next?

120, 60, 20, 5, ?', 'Divide by 2, then 3, then 4, then 5: 5 ÷ 5 = 1.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'number-series'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '2.5', false, 1), ('B', '1', true, 2), ('C', '2', false, 3), ('D', '0', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which letter comes next?

A, C, F, J, O, ?', 'The gaps grow by one: +2, +3, +4, +5, +6. O is the 15th letter; 15 + 6 = 21 = U.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'letter-series'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'S', false, 1), ('B', 'T', false, 2), ('C', 'U', true, 3), ('D', 'V', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'If CAT is coded as 24 (C = 3, A = 1, T = 20), what is the code for DOG?', 'Add the letter positions: D = 4, O = 15, G = 7; 4 + 15 + 7 = 26.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'coding'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '25', false, 1), ('B', '27', false, 2), ('C', '24', false, 3), ('D', '26', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Pointing to a man, Dechen said, “He is the only son of my mother’s father.” How is the man related to Dechen?', 'The only son of her mother’s father is her mother’s brother, that is, her maternal uncle.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'relationships'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Maternal uncle', true, 1), ('B', 'Grandfather', false, 2), ('C', 'Brother', false, 3), ('D', 'Father', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Karma faces north. He turns 90° clockwise and then turns 180°. Which direction is he facing now?', 'North → 90° clockwise = East → 180° = West.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'directions'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'South', false, 1), ('B', 'West', true, 2), ('C', 'North', false, 3), ('D', 'East', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Statements: All doctors are graduates. Some graduates are teachers.

Conclusions:
I. Some doctors are teachers.
II. Some teachers are graduates.

Which conclusion follows?', 'II follows: if some graduates are teachers, then some teachers are graduates. I does not follow: the teachers may be graduates who are not doctors.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'logical-reasoning'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Only I', false, 1), ('B', 'Only II', true, 2), ('C', 'Both I and II', false, 3), ('D', 'Neither I nor II', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', '15 August 2024 was a Thursday. What day of the week was 15 August 2025?', 'There are 365 days between them (no 29 February in that period). 365 = 52 weeks + 1 day, so the day moves on by one: Friday.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'time-and-calendars'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Wednesday', false, 1), ('B', 'Thursday', false, 2), ('C', 'Friday', true, 3), ('D', 'Saturday', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What is the angle between the hour and minute hands of a clock at 3:30?', 'Minute hand at 180°. Hour hand at 3 × 30 + 30 × 0.5 = 105°. Difference = 75°.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'time-and-calendars'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '90°', false, 1), ('B', '105°', false, 2), ('C', '60°', false, 3), ('D', '75°', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A 40-litre mixture contains milk and water in the ratio 3 : 1. How much water must be added to make the ratio 1 : 1?', 'Milk = 30 L, water = 10 L. For 1 : 1 water must be 30 L, so add 20 L.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'ratio-and-proportion'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '20 litres', true, 1), ('B', '30 litres', false, 2), ('C', '15 litres', false, 3), ('D', '10 litres', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which is the odd one out?

121, 169, 200, 225', '121 = 11², 169 = 13², 225 = 15² are perfect squares; 200 is not.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'odd-one-out'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '121', false, 1), ('B', '169', false, 2), ('C', '200', true, 3), ('D', '225', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows tourist arrivals at a hotel by quarter (illustrative figures).

| Year | Q1 | Q2 | Q3 | Q4 |
|---|---|---|---|---|
| 2023 | 1,800 | 2,400 | 1,500 | 3,300 |
| 2024 | 2,100 | 2,700 | 1,800 | 3,900 |

What were the total arrivals in 2024?', '2,100 + 2,700 + 1,800 + 3,900 = 10,500.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '10,200', false, 1), ('B', '10,500', true, 2), ('C', '9,000', false, 3), ('D', '11,000', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows tourist arrivals at a hotel by quarter (illustrative figures).

| Year | Q1 | Q2 | Q3 | Q4 |
|---|---|---|---|---|
| 2023 | 1,800 | 2,400 | 1,500 | 3,300 |
| 2024 | 2,100 | 2,700 | 1,800 | 3,900 |

By what percentage did total arrivals increase from 2023 to 2024?', '2023 total = 9,000; 2024 total = 10,500. Increase = 1,500 ÷ 9,000 × 100 ≈ 16.7%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '20.0%', false, 1), ('B', '15.0%', false, 2), ('C', '16.7%', true, 3), ('D', '14.3%', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows tourist arrivals at a hotel by quarter (illustrative figures).

| Year | Q1 | Q2 | Q3 | Q4 |
|---|---|---|---|---|
| 2023 | 1,800 | 2,400 | 1,500 | 3,300 |
| 2024 | 2,100 | 2,700 | 1,800 | 3,900 |

Which quarter had the largest increase in arrivals from 2023 to 2024?', 'Q1, Q2 and Q3 each rose by 300; Q4 rose by 600.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Q1', false, 1), ('B', 'Q2', false, 2), ('C', 'Q3', false, 3), ('D', 'Q4', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows tourist arrivals at a hotel by quarter (illustrative figures).

| Year | Q1 | Q2 | Q3 | Q4 |
|---|---|---|---|---|
| 2023 | 1,800 | 2,400 | 1,500 | 3,300 |
| 2024 | 2,100 | 2,700 | 1,800 | 3,900 |

Approximately what share of 2024 arrivals came in Q4?', '3,900 ÷ 10,500 × 100 ≈ 37.1%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '40%', false, 1), ('B', '30%', false, 2), ('C', '33%', false, 3), ('D', '37%', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows tourist arrivals at a hotel by quarter (illustrative figures).

| Year | Q1 | Q2 | Q3 | Q4 |
|---|---|---|---|---|
| 2023 | 1,800 | 2,400 | 1,500 | 3,300 |
| 2024 | 2,100 | 2,700 | 1,800 | 3,900 |

What was the average number of arrivals per quarter in 2023?', '9,000 ÷ 4 = 2,250.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '2,250', true, 1), ('B', '2,100', false, 2), ('C', '2,400', false, 3), ('D', '2,625', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows the number of students in four colleges (illustrative figures).

| College | Male | Female |
|---|---|---|
| A | 420 | 380 |
| B | 350 | 450 |
| C | 600 | 400 |
| D | 270 | 330 |

Which college has the highest proportion of female students?', 'Female share: A 47.5%, B 56.25%, C 40%, D 55%. B is highest.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'A', false, 1), ('B', 'B', true, 2), ('C', 'C', false, 3), ('D', 'D', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows the number of students in four colleges (illustrative figures).

| College | Male | Female |
|---|---|---|
| A | 420 | 380 |
| B | 350 | 450 |
| C | 600 | 400 |
| D | 270 | 330 |

How many students are there in the four colleges altogether?', '800 + 800 + 1,000 + 600 = 3,200.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '3,000', false, 1), ('B', '3,200', true, 2), ('C', '3,400', false, 3), ('D', '3,100', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows the number of students in four colleges (illustrative figures).

| College | Male | Female |
|---|---|---|
| A | 420 | 380 |
| B | 350 | 450 |
| C | 600 | 400 |
| D | 270 | 330 |

What is the ratio of all male students to all female students?', 'Males = 420 + 350 + 600 + 270 = 1,640. Females = 380 + 450 + 400 + 330 = 1,560. 1,640 : 1,560 = 41 : 39.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '4 : 3', false, 1), ('B', '21 : 19', false, 2), ('C', '41 : 39', true, 3), ('D', '39 : 41', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows the number of students in four colleges (illustrative figures).

| College | Male | Female |
|---|---|---|
| A | 420 | 380 |
| B | 350 | 450 |
| C | 600 | 400 |
| D | 270 | 330 |

What percentage of College C’s students are female?', '400 ÷ 1,000 × 100 = 40%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '60%', false, 1), ('B', '35%', false, 2), ('C', '45%', false, 3), ('D', '40%', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows the number of students in four colleges (illustrative figures).

| College | Male | Female |
|---|---|---|
| A | 420 | 380 |
| B | 350 | 450 |
| C | 600 | 400 |
| D | 270 | 330 |

In College D, the number of female students is greater than the number of male students by about what percentage?', '(330 − 270) ÷ 270 × 100 = 60 ÷ 270 × 100 ≈ 22.2% (compare with the male figure).', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '22.2%', true, 1), ('B', '20.0%', false, 2), ('C', '25.0%', false, 3), ('D', '18.2%', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A government’s spending of Nu. 60 billion is divided as follows (illustrative figures).

| Sector | Nu. billion |
|---|---|
| Health | 9 |
| Education | 12 |
| Infrastructure | 18 |
| Agriculture | 6 |
| Others | 15 |

In a pie chart of this spending, what angle would the Education slice have?', '12 ÷ 60 × 360° = 72°.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'pie-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '60°', false, 1), ('B', '72°', true, 2), ('C', '80°', false, 3), ('D', '54°', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A government’s spending of Nu. 60 billion is divided as follows (illustrative figures).

| Sector | Nu. billion |
|---|---|
| Health | 9 |
| Education | 12 |
| Infrastructure | 18 |
| Agriculture | 6 |
| Others | 15 |

What percentage of the spending goes to Infrastructure?', '18 ÷ 60 × 100 = 30%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'pie-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '35%', false, 1), ('B', '25%', false, 2), ('C', '30%', true, 3), ('D', '18%', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A government’s spending of Nu. 60 billion is divided as follows (illustrative figures).

| Sector | Nu. billion |
|---|---|
| Health | 9 |
| Education | 12 |
| Infrastructure | 18 |
| Agriculture | 6 |
| Others | 15 |

What is the ratio of Health spending to Agriculture spending?', '9 : 6 = 3 : 2.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'pie-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '3 : 1', false, 1), ('B', '9 : 4', false, 2), ('C', '2 : 3', false, 3), ('D', '3 : 2', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A government’s spending of Nu. 60 billion is divided as follows (illustrative figures).

| Sector | Nu. billion |
|---|---|
| Health | 9 |
| Education | 12 |
| Infrastructure | 18 |
| Agriculture | 6 |
| Others | 15 |

Next year the total rises by 10% and each sector keeps the same share. How much will Education receive?', 'Education’s share is 12 ÷ 60 = 20%. New total = 66 billion; 20% of 66 = Nu. 13.2 billion.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'pie-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 13.2 billion', true, 1), ('B', 'Nu. 13.0 billion', false, 2), ('C', 'Nu. 12.1 billion', false, 3), ('D', 'Nu. 14.0 billion', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A government’s spending of Nu. 60 billion is divided as follows (illustrative figures).

| Sector | Nu. billion |
|---|---|
| Health | 9 |
| Education | 12 |
| Infrastructure | 18 |
| Agriculture | 6 |
| Others | 15 |

Health and Education together receive what fraction of the total?', '9 + 12 = 21; 21 ÷ 60 = 7/20.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'pie-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '1/3', false, 1), ('B', '7/20', true, 2), ('C', '2/5', false, 3), ('D', '3/10', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'In a class, 30 students have an average mark of 60 and 20 students have an average mark of 70. What is the average mark of all 50 students?', '(30 × 60 + 20 × 70) ÷ 50 = (1,800 + 1,400) ÷ 50 = 3,200 ÷ 50 = 64.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'statistics-basics'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '62', false, 1), ('B', '65', false, 2), ('C', '64', true, 3), ('D', '66', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The average of five numbers is 20. When one number is removed, the average of the remaining four is 18. Which number was removed?', 'Total of five = 100; total of four = 72; the removed number = 100 − 72 = 28.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'statistics-basics'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '22', false, 1), ('B', '30', false, 2), ('C', '26', false, 3), ('D', '28', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What is the range of 14, 8, 23, 5, 17 and 11?', 'Range = largest − smallest = 23 − 5 = 18.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'statistics-basics'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '18', true, 1), ('B', '17', false, 2), ('C', '15', false, 3), ('D', '23', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What is the median of 4, 9, 2, 7, 5 and 8?', 'In order: 2, 4, 5, 7, 8, 9. The middle two are 5 and 7, so the median is (5 + 7) ÷ 2 = 6.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'statistics-basics'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '7', false, 1), ('B', '6', true, 2), ('C', '5.5', false, 3), ('D', '6.5', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A salary of Nu. 25,000 is increased by 12%. What is the new salary?', '12% of 25,000 = 3,000. New salary = Nu. 28,000.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'statistics-basics'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 27,000', false, 1), ('B', 'Nu. 27,500', false, 2), ('C', 'Nu. 28,000', true, 3), ('D', 'Nu. 28,500', false, 4)) as v(label, body, ok, pos);

commit;
