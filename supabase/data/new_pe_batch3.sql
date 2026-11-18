-- Claude-written PE practice questions, loaded as drafts (awaiting review) for /admin/ai/review.

begin;

insert into public.topics (subject_id, slug, name) select id, 'percentages', 'Percentages' from public.subjects where slug = 'data-interpretation' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'statistics-basics', 'Statistics basics' from public.subjects where slug = 'data-interpretation' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'tables', 'Tables' from public.subjects where slug = 'data-interpretation' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'honorific-words', 'Honorific words (ཞེ་ས)' from public.subjects where slug = 'dzongkha-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'opposites', 'Opposites (འགལ་མིང)' from public.subjects where slug = 'dzongkha-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'antonyms', 'Antonyms' from public.subjects where slug = 'english-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'grammar', 'Grammar' from public.subjects where slug = 'english-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'synonyms', 'Synonyms' from public.subjects where slug = 'english-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'vocabulary', 'Vocabulary' from public.subjects where slug = 'english-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'analogies', 'Analogies' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'averages', 'Averages' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'coding', 'Coding' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'directions', 'Directions' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'interest', 'Interest' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'letter-series', 'Letter series' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'logical-reasoning', 'Logical reasoning' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'number-series', 'Number series' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'ordering-and-ranking', 'Ordering and ranking' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'percentages', 'Percentages' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'probability', 'Probability' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'profit-and-loss', 'Profit and loss' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'ratio-and-proportion', 'Ratio and proportion' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'speed-and-distance', 'Speed and distance' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'time-and-calendars', 'Time and calendars' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'work-and-time', 'Work and time' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the word closest in meaning to the word in capitals.

The instructions in the circular were AMBIGUOUS.', 'Ambiguous means open to more than one meaning; unclear.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Unclear', true, 1), ('B', 'Precise', false, 2), ('C', 'Lengthy', false, 3), ('D', 'Strict', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the word closest in meaning to the word in capitals.

Dorji is a DILIGENT officer.', 'Diligent means careful and hard-working.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Lazy', false, 1), ('B', 'Hard-working', true, 2), ('C', 'Talkative', false, 3), ('D', 'Young', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the word closest in meaning to the word in capitals.

It would be PRUDENT to save part of your salary.', 'Prudent means sensible and careful about the future; wise.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Foolish', false, 1), ('B', 'Costly', false, 2), ('C', 'Wise', true, 3), ('D', 'Difficult', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which word has the opposite meaning of “abundant”?', 'Abundant means more than enough; the opposite is scarce.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Plentiful', false, 1), ('B', 'Ample', false, 2), ('C', 'Rich', false, 3), ('D', 'Scarce', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which word has the opposite meaning of “optimistic”?', 'Optimistic means expecting good things; pessimistic means expecting bad things.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Pessimistic', true, 1), ('B', 'Hopeful', false, 2), ('C', 'Cheerful', false, 3), ('D', 'Confident', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which word has the opposite meaning of “permanent”?', 'Permanent means lasting for ever; temporary means lasting only a short time.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Lasting', false, 1), ('B', 'Temporary', true, 2), ('C', 'Stable', false, 3), ('D', 'Fixed', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct word or phrase to complete the sentence.

The number of students in the college ______ increasing every year.', '“The number of …” is singular, so it takes “is”. (Compare: “A number of students are …”.)', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'are', false, 1), ('B', 'were', false, 2), ('C', 'is', true, 3), ('D', 'have been', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct word or phrase to complete the sentence.

Hardly had he reached the office ______ it started to rain.', 'The fixed pattern is “Hardly … when” (and “No sooner … than”).', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'than', false, 1), ('B', 'then', false, 2), ('C', 'after', false, 3), ('D', 'when', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct word or phrase to complete the sentence.

She prefers tea ______ coffee.', 'We say “prefer A to B”, not “prefer A than B”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'to', true, 1), ('B', 'than', false, 2), ('C', 'over than', false, 3), ('D', 'from', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct word or phrase to complete the sentence.

Neither of the two answers ______ correct.', '“Neither of” is followed by a singular verb in formal English: “Neither of the answers is correct.”', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'are', false, 1), ('B', 'is', true, 2), ('C', 'were', false, 3), ('D', 'have been', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct word or phrase to complete the sentence.

He has lived in Paro ______ ten years.', 'Use “for” with a length of time (ten years) and “since” with a starting point (since 2015).', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'since', false, 1), ('B', 'from', false, 2), ('C', 'for', true, 3), ('D', 'during', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct word or phrase to complete the sentence.

If it rains tomorrow, we ______ the match.', 'A real future possibility uses the first conditional: If + present, will + verb.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'cancelled', false, 1), ('B', 'would cancel', false, 2), ('C', 'had cancelled', false, 3), ('D', 'will cancel', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct question tag.

You are coming to the meeting, ______?', 'A positive statement with “are” takes the negative tag “aren’t you?”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'aren’t you', true, 1), ('B', 'isn’t it', false, 2), ('C', 'don’t you', false, 3), ('D', 'are you', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct passive form of: “They are building a new bridge.”', 'Present continuous active (are building) becomes present continuous passive: is being + past participle.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'A new bridge was built by them.', false, 1), ('B', 'A new bridge is being built.', true, 2), ('C', 'A new bridge has built.', false, 3), ('D', 'A new bridge is building.', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct reported speech of: She asked me, “Where do you live?”', 'In a reported question the word order becomes a statement (I lived), the tense moves back, and there is no question mark.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'She asked me where do I live.', false, 1), ('B', 'She asked me where did I live.', false, 2), ('C', 'She asked me where I lived.', true, 3), ('D', 'She asked me where I live?', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What does the idiom “to spill the beans” mean?', 'To spill the beans is to tell something that was meant to be secret.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'To waste food', false, 1), ('B', 'To make a mess', false, 2), ('C', 'To work carelessly', false, 3), ('D', 'To reveal a secret', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What does the idiom “under the weather” mean?', 'Feeling under the weather means feeling slightly unwell.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Slightly ill', true, 1), ('B', 'Very happy', false, 2), ('C', 'Out in the rain', false, 3), ('D', 'Very busy', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose one word for: “a speech given without any preparation”.', 'An impromptu speech is made without preparation. A eulogy praises someone who has died.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Eulogy', false, 1), ('B', 'Impromptu', true, 2), ('C', 'Monologue', false, 3), ('D', 'Sermon', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which of these four spellings is correct?', 'Embarrass has a double r and a double s.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Embarass', false, 1), ('B', 'Embarras', false, 2), ('C', 'Embarrass', true, 3), ('D', 'Embaras', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct word or phrase to complete the sentence.

Please keep your ticket safe; don’t ______ it.', '“Lose” (verb) means to be unable to find; “loose” (adjective) means not tight.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'loose', false, 1), ('B', 'loss', false, 2), ('C', 'lost', false, 3), ('D', 'lose', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A sum earns Nu. 2,000 simple interest in 4 years at 5% per year. What is the sum?', 'Interest = P × R × T ÷ 100, so P = 2,000 × 100 ÷ (5 × 4) = Nu. 10,000.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'interest'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 10,000', true, 1), ('B', 'Nu. 8,000', false, 2), ('C', 'Nu. 12,000', false, 3), ('D', 'Nu. 40,000', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', '30% of a number is 45. What is the number?', 'Number = 45 ÷ 0.30 = 150.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'percentages'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '135', false, 1), ('B', '150', true, 2), ('C', '160', false, 3), ('D', '175', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A price is raised by 20% and then the new price is reduced by 20%. What is the overall change?', '1.20 × 0.80 = 0.96, so the final price is 4% lower than the start.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'percentages'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'No change', false, 1), ('B', '4% increase', false, 2), ('C', '4% decrease', true, 3), ('D', '2% decrease', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A trader buys 10 pens for Nu. 100 and sells 8 pens for Nu. 100. What is the profit percentage?', 'Cost per pen = Nu. 10; selling price per pen = Nu. 12.50. Profit = 2.50 ÷ 10 × 100 = 25%.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'profit-and-loss'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '20%', false, 1), ('B', '15%', false, 2), ('C', '30%', false, 3), ('D', '25%', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A bus travels 2 hours at 60 km/h and then 3 hours at 40 km/h. What is its average speed for the whole journey?', 'Distance = 120 + 120 = 240 km; time = 5 h; average speed = 240 ÷ 5 = 48 km/h (not the average of 60 and 40).', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'speed-and-distance'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '48 km/h', true, 1), ('B', '50 km/h', false, 2), ('C', '45 km/h', false, 3), ('D', '52 km/h', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Two vehicles 360 km apart drive towards each other at 50 km/h and 70 km/h. After how long do they meet?', 'They close the gap at 50 + 70 = 120 km/h; 360 ÷ 120 = 3 hours.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'speed-and-distance'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '2.5 hours', false, 1), ('B', '3 hours', true, 2), ('C', '3.5 hours', false, 3), ('D', '4 hours', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', '6 workers can build a wall in 12 days. How many days will 8 workers take, working at the same rate?', 'Total work = 6 × 12 = 72 worker-days; 72 ÷ 8 = 9 days.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'work-and-time'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '8 days', false, 1), ('B', '10 days', false, 2), ('C', '9 days', true, 3), ('D', '16 days', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The ages of two sisters are in the ratio 4 : 5 and add up to 54 years. How old is the elder sister?', '54 ÷ 9 = 6 per part; the elder has 5 parts = 30 years (the younger 24).', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'ratio-and-proportion'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '24 years', false, 1), ('B', '27 years', false, 2), ('C', '28 years', false, 3), ('D', '30 years', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The average of four numbers is 25. A fifth number is added and the average becomes 28. What is the fifth number?', 'Total of four = 100; total of five = 140; the fifth number = 140 − 100 = 40.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'averages'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '40', true, 1), ('B', '28', false, 2), ('C', '35', false, 3), ('D', '45', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What number comes next?

3, 8, 15, 24, 35, ?', 'The differences are 5, 7, 9, 11, so the next difference is 13: 35 + 13 = 48 (each term is n² − 1).', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'number-series'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '46', false, 1), ('B', '48', true, 2), ('C', '49', false, 3), ('D', '50', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What number comes next?

1, 1, 2, 3, 5, 8, ?', 'Each number is the sum of the two before it: 5 + 8 = 13.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'number-series'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '11', false, 1), ('B', '12', false, 2), ('C', '13', true, 3), ('D', '15', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which letter comes next?

Z, X, U, Q, ?', 'The letters go back by 2, 3, 4, then 5: Z(26), X(24), U(21), Q(17), L(12).', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'letter-series'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'M', false, 1), ('B', 'K', false, 2), ('C', 'N', false, 3), ('D', 'L', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'If TREE is written as USFF, how is BIRD written?', 'Each letter moves one place forward: B→C, I→J, R→S, D→E.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'coding'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'CJSE', true, 1), ('B', 'CHSE', false, 2), ('C', 'AJSE', false, 3), ('D', 'CJTE', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Pema walks 6 km east and then 8 km north. How far is she from where she started (in a straight line)?', 'The two walks form a right angle: distance = √(6² + 8²) = √100 = 10 km.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'directions'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '14 km', false, 1), ('B', '10 km', true, 2), ('C', '12 km', false, 3), ('D', '2 km', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'In a class, Karma is 7th from the top and 18th from the bottom. How many students are in the class?', 'Total = 7 + 18 − 1 = 24 (Karma is counted in both).', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'ordering-and-ranking'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '25', false, 1), ('B', '23', false, 2), ('C', '24', true, 3), ('D', '26', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Today is Wednesday. What day of the week will it be 45 days from today?', '45 = 6 weeks + 3 days. Wednesday + 3 days = Saturday.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'time-and-calendars'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Thursday', false, 1), ('B', 'Friday', false, 2), ('C', 'Sunday', false, 3), ('D', 'Saturday', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Pen is to write as knife is to:', 'A pen is used to write; a knife is used to cut.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'analogies'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Cut', true, 1), ('B', 'Sharp', false, 2), ('C', 'Kitchen', false, 3), ('D', 'Steel', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Statements: All roses are flowers. No flower is a tree.

Conclusions:
I. No rose is a tree.
II. Some trees are roses.

Which conclusion follows?', 'Every rose is a flower and no flower is a tree, so no rose is a tree (I). II contradicts I.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'logical-reasoning'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Both I and II', false, 1), ('B', 'Only I', true, 2), ('C', 'Only II', false, 3), ('D', 'Neither I nor II', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Two fair coins are tossed. What is the probability of getting two heads?', 'The outcomes are HH, HT, TH, TT; only one of the four is HH, so 1/4.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'probability'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '1/2', false, 1), ('B', '1/3', false, 2), ('C', '1/4', true, 3), ('D', '3/4', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'How many times do the hour and minute hands of a clock point the same way in 12 hours?', 'They meet every 12/11 hours, so 11 times in 12 hours (the 11–12 o’clock meeting happens at 12).', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'time-and-calendars'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '12', false, 1), ('B', '24', false, 2), ('C', '10', false, 3), ('D', '11', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows monthly rainfall in a town (illustrative figures).

| Month | Jan | Feb | Mar | Apr | May | Jun |
|---|---|---|---|---|---|---|
| Rainfall (mm) | 10 | 15 | 30 | 85 | 160 | 320 |

What was the total rainfall from January to June?', '10 + 15 + 30 + 85 + 160 + 320 = 620 mm.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '620 mm', true, 1), ('B', '600 mm', false, 2), ('C', '640 mm', false, 3), ('D', '580 mm', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows monthly rainfall in a town (illustrative figures).

| Month | Jan | Feb | Mar | Apr | May | Jun |
|---|---|---|---|---|---|---|
| Rainfall (mm) | 10 | 15 | 30 | 85 | 160 | 320 |

Between which two months did rainfall increase the most?', 'Increases: +5, +15, +55, +75, +160. May to June is the largest (+160 mm).', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'April to May', false, 1), ('B', 'May to June', true, 2), ('C', 'March to April', false, 3), ('D', 'February to March', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows monthly rainfall in a town (illustrative figures).

| Month | Jan | Feb | Mar | Apr | May | Jun |
|---|---|---|---|---|---|---|
| Rainfall (mm) | 10 | 15 | 30 | 85 | 160 | 320 |

About what percentage of the six months’ rainfall fell in June?', '320 ÷ 620 × 100 ≈ 51.6%, so about 52%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '45%', false, 1), ('B', '48%', false, 2), ('C', '52%', true, 3), ('D', '55%', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows monthly rainfall in a town (illustrative figures).

| Month | Jan | Feb | Mar | Apr | May | Jun |
|---|---|---|---|---|---|---|
| Rainfall (mm) | 10 | 15 | 30 | 85 | 160 | 320 |

What was the average monthly rainfall over the six months (to the nearest mm)?', '620 ÷ 6 ≈ 103.3, so 103 mm.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '100 mm', false, 1), ('B', '110 mm', false, 2), ('C', '105 mm', false, 3), ('D', '103 mm', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows monthly rainfall in a town (illustrative figures).

| Month | Jan | Feb | Mar | Apr | May | Jun |
|---|---|---|---|---|---|---|
| Rainfall (mm) | 10 | 15 | 30 | 85 | 160 | 320 |

May’s rainfall was how many times March’s rainfall?', '160 ÷ 30 ≈ 5.3.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'About 5.3 times', true, 1), ('B', 'About 4 times', false, 2), ('C', 'About 6 times', false, 3), ('D', 'About 3.5 times', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'In a school of 200 students, the number who passed each subject was: English 170, Mathematics 150, Science 160. 130 students passed all three subjects.

What percentage of students passed Mathematics?', '150 ÷ 200 × 100 = 75%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'percentages'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '70%', false, 1), ('B', '75%', true, 2), ('C', '80%', false, 3), ('D', '85%', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'In a school of 200 students, the number who passed each subject was: English 170, Mathematics 150, Science 160. 130 students passed all three subjects.

How many students failed English?', '200 − 170 = 30.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'percentages'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '20', false, 1), ('B', '50', false, 2), ('C', '30', true, 3), ('D', '40', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'In a school of 200 students, the number who passed each subject was: English 170, Mathematics 150, Science 160. 130 students passed all three subjects.

How many students failed at least one subject?', '200 − 130 (passed all three) = 70.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'percentages'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '30', false, 1), ('B', '50', false, 2), ('C', '60', false, 3), ('D', '70', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The mean of eight numbers is 15. If 3 is added to each number, what is the new mean?', 'Adding the same amount to every number adds that amount to the mean: 15 + 3 = 18.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'statistics-basics'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '18', true, 1), ('B', '15', false, 2), ('C', '24', false, 3), ('D', '21', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What is the median of 12, 7, 9, 15 and 10?', 'In order: 7, 9, 10, 12, 15. The middle value is 10.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'statistics-basics'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '9', false, 1), ('B', '10', true, 2), ('C', '11', false, 3), ('D', '12', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'རྐང་རྗེན ཟེར་བའི་ཚིག་འདི་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “རྐང་རྗེན”?)', '“རྐང་རྗེན” means barefoot; its honorific (ཞེ་ས) is “ཞབས་རྗེན”. Source: DDC Dzongkha–English Dictionary, p. 21.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཞབས་རྗེན', true, 1), ('B', 'ཕྱག་རྗེན', false, 2), ('C', 'དབུ་རྗེན', false, 3), ('D', 'ཞལ་རྗེན', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'རྐང་གདན ཟེར་བའི་ཚིག་འདི་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “རྐང་གདན”?)', '“རྐང་གདན” means foot mat, doormat; its honorific (ཞེ་ས) is “ཞབས་གདན”. Source: DDC Dzongkha–English Dictionary, p. 21.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'སྐུ་གདན', false, 1), ('B', 'ཞབས་གདན', true, 2), ('C', 'ཕྱག་གདན', false, 3), ('D', 'དབུ་གདན', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'ང་རྒྱལ ཟེར་བའི་ཚིག་འདི་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “ང་རྒྱལ”?)', '“ང་རྒྱལ” means pride; its honorific (ཞེ་ས) is “ཐུགས་རྒྱལ”. Source: DDC Dzongkha–English Dictionary, p. 201.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཞལ་རྒྱལ', false, 1), ('B', 'ཕྱག་རྒྱལ', false, 2), ('C', 'ཐུགས་རྒྱལ', true, 3), ('D', 'སྐུ་རྒྱལ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'ཐང་ཀ ཟེར་བའི་ཚིག་འདི་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “ཐང་ཀ”?)', '“ཐང་ཀ” means scroll painting (thangka); its honorific (ཞེ་ས) is “ཞལ་ཐང”. Source: DDC Dzongkha–English Dictionary, p. 352.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཕྱག་ཐང', false, 1), ('B', 'སྐུ་ཐང', false, 2), ('C', 'དབུ་ཐང', false, 3), ('D', 'ཞལ་ཐང', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'ཁ་མཁས་པ ཟེར་བའི་ཚིག་འདི་གི་ ཞེ་ས་ག་ཅི་སྨོ?

(Which is the honorific form of “ཁ་མཁས་པ”?)', '“ཁ་མཁས་པ” means eloquent; its honorific (ཞེ་ས) is “ཞལ་མཁས་པ”. Source: DDC Dzongkha–English Dictionary, p. 56.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཞལ་མཁས་པ', true, 1), ('B', 'ཕྱག་མཁས་པ', false, 2), ('C', 'ཐུགས་མཁས་པ', false, 3), ('D', 'སྐུ་མཁས་པ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'ཕན་སེམས ཟེར་བའི་ཚིག་འདི་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “ཕན་སེམས”?)', '“ཕན་སེམས” and “གནོད་སེམས” are opposites (kind intention / harmful intention). Source: DDC Dzongkha–English Dictionary, p. 562.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དྲང་སེམས', false, 1), ('B', 'གནོད་སེམས', true, 2), ('C', 'བྱམས་སེམས', false, 3), ('D', 'དགའ་སེམས', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'སྤྱི་དོན ཟེར་བའི་ཚིག་འདི་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “སྤྱི་དོན”?)', '“སྤྱི་དོན” and “སྒེར་དོན” are opposites (public interest / private interest). Source: DDC Dzongkha–English Dictionary, p. 544.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'མི་དོན', false, 1), ('B', 'དོན་ཚན', false, 2), ('C', 'སྒེར་དོན', true, 3), ('D', 'རྒྱལ་དོན', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'བུད་མེད ཟེར་བའི་ཚིག་འདི་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “བུད་མེད”?)', '“བུད་མེད” and “སྐྱེས་པ” are opposites (woman / man). Source: DDC Dzongkha–English Dictionary, p. 606.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཨམ་སྲུ', false, 1), ('B', 'བུམོ', false, 2), ('C', 'ཨ་ཞེ', false, 3), ('D', 'སྐྱེས་པ', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'ཕྱི་མི ཟེར་བའི་ཚིག་འདི་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “ཕྱི་མི”?)', '“ཕྱི་མི” and “ནང་མི” are opposites (outsider, foreigner / insider). Source: DDC Dzongkha–English Dictionary, p. 578.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ནང་མི', true, 1), ('B', 'མགྲོན་པོ', false, 2), ('C', 'གྲོགས་པོ', false, 3), ('D', 'ཁྱིམ་མཚེས', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'གནོད ཟེར་བའི་ཚིག་འདི་གི་ འགལ་མིང་ག་ཅི་སྨོ?

(Which word is the opposite of “གནོད”?)', '“གནོད” and “ཕན” are opposites (harm / benefit). Source: DDC Dzongkha–English Dictionary, p. 507.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'འཐབ', false, 1), ('B', 'ཕན', true, 2), ('C', 'ཉེས', false, 3), ('D', 'སྡུག', false, 4)) as v(label, body, ok, pos);

commit;
