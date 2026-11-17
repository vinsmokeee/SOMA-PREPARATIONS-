-- Claude-written PE practice questions, loaded as drafts (awaiting review) for /admin/ai/review.

begin;

insert into public.topics (subject_id, slug, name) select id, 'line-charts', 'Line charts' from public.subjects where slug = 'data-interpretation' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'pie-charts', 'Pie charts' from public.subjects where slug = 'data-interpretation' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'statistics-basics', 'Statistics basics' from public.subjects where slug = 'data-interpretation' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'tables', 'Tables' from public.subjects where slug = 'data-interpretation' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'antonyms', 'Antonyms' from public.subjects where slug = 'english-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'grammar', 'Grammar' from public.subjects where slug = 'english-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'synonyms', 'Synonyms' from public.subjects where slug = 'english-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'vocabulary', 'Vocabulary' from public.subjects where slug = 'english-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'analogies', 'Analogies' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'averages', 'Averages' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'counting', 'Counting' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'directions', 'Directions' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'fractions', 'Fractions' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'letter-series', 'Letter series' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'number-patterns', 'Number patterns' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'number-series', 'Number series' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'odd-one-out', 'Odd one out' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'ordering-and-ranking', 'Ordering and ranking' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'percentages', 'Percentages' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'rates-and-cost', 'Rates and cost' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'ratio-and-proportion', 'Ratio and proportion' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'time-and-calendars', 'Time and calendars' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'word-puzzles', 'Word puzzles' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the word closest in meaning to the word in capitals.

The minister’s explanation was LUCID.', 'Lucid means clear and easy to understand.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Clear', true, 1), ('B', 'Vague', false, 2), ('C', 'Lengthy', false, 3), ('D', 'Emotional', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which word has the opposite meaning of “frugal”?', 'Frugal means careful with money; the opposite is extravagant (spending too much).', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Thrifty', false, 1), ('B', 'Extravagant', true, 2), ('C', 'Careful', false, 3), ('D', 'Modest', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which word has the opposite meaning of “ephemeral”?', 'Ephemeral means lasting a very short time; the opposite is permanent. The other three are synonyms.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Brief', false, 1), ('B', 'Fleeting', false, 2), ('C', 'Permanent', true, 3), ('D', 'Temporary', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the word closest in meaning to the word in capitals.

The new embankment will MITIGATE the effects of floods.', 'To mitigate is to make something less severe: to lessen it.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Increase', false, 1), ('B', 'Lessen', true, 2), ('C', 'Measure', false, 3), ('D', 'Predict', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct word to complete the sentence.

Neither the teacher nor the students ______ present at the meeting.', 'With “neither … nor”, the verb agrees with the nearer subject. “Students” is plural, so “were”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'was', false, 1), ('B', 'were', true, 2), ('C', 'is', false, 3), ('D', 'has been', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct word to complete the sentence.

If I ______ you, I would accept the offer.', 'For an imaginary situation (second conditional), standard English uses “If I were you”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'am', false, 1), ('B', 'was', false, 2), ('C', 'were', true, 3), ('D', 'be', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct word to complete the sentence.

She has been working in Thimphu ______ 2019.', 'Use “since” with a starting point in time (since 2019) and “for” with a length of time (for five years).', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'for', false, 1), ('B', 'since', true, 2), ('C', 'from', false, 3), ('D', 'during', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct word to complete the sentence.

The new policy will ______ thousands of farmers.', '“Affect” is the verb (to influence); “effect” is usually the noun (a result). After “will”, the base verb “affect” is needed.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Choose the word that correctly completes the sentence.

“What%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'affect', true, 1), ('B', 'effect', false, 2), ('C', 'affects', false, 3), ('D', 'effects', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct word to complete the sentence.

Honesty is a guiding ______ of the civil service.', 'A principle is a rule or belief; a principal is a head of a school or the main thing. “A guiding principle” is singular.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'principal', false, 1), ('B', 'principle', true, 2), ('C', 'principally', false, 3), ('D', 'principles', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which of these words takes a singular verb even though it ends in -s?', 'We say “The news is good.” Scissors, trousers and spectacles take a plural verb (“The scissors are sharp”).', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which of the following words looks plural but is not?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'News', true, 1), ('B', 'Scissors', false, 2), ('C', 'Trousers', false, 3), ('D', 'Spectacles', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which sentence is correct?', 'Treated as one body, “committee” takes a singular verb and pronoun: “has … its”. “It’s” means “it is”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'The committee has made its decision.', true, 1), ('B', 'The committee have made its decision.', false, 2), ('C', 'The committee has made their decision.', false, 3), ('D', 'The committee have made it’s decision.', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What does the idiom “to bite the bullet” mean?', 'To bite the bullet is to accept something unpleasant and face it bravely.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'To face something difficult with courage', true, 1), ('B', 'To speak angrily', false, 2), ('C', 'To make a quick decision without thinking', false, 3), ('D', 'To avoid a problem', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What does the idiom “a blessing in disguise” mean?', 'A blessing in disguise is something that looked unfortunate but brought a good result.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'A gift given secretly', false, 1), ('B', 'Something that seems bad at first but turns out to be good', true, 2), ('C', 'A false promise', false, 3), ('D', 'A lucky guess', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose one word for: “a person who speaks two languages fluently”.', 'Bilingual = able to speak two languages. Biannual = twice a year; bilateral = involving two sides; bipartisan = supported by two parties.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Bilingual', true, 1), ('B', 'Biannual', false, 2), ('C', 'Bilateral', false, 3), ('D', 'Bipartisan', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose one word for: “government by the people, through their elected representatives”.', 'Democracy is government by the people, directly or through elected representatives.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Monarchy', false, 1), ('B', 'Democracy', true, 2), ('C', 'Bureaucracy', false, 3), ('D', 'Autocracy', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which word is spelt correctly?', '“Accommodation” has a double c and a double m.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Accomodation', false, 1), ('B', 'Acommodation', false, 2), ('C', 'Accommodation', true, 3), ('D', 'Accommadation', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the correct preposition.

He was accused ______ theft.', 'The fixed phrase is “accused of” something.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'for', false, 1), ('B', 'with', false, 2), ('C', 'of', true, 3), ('D', 'about', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Choose the word closest in meaning to the word in capitals.

The auditors confirmed the VERACITY of her statement.', 'Veracity means truthfulness. (Its opposite is mendacity, which means untruthfulness.)', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'advanced', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Choose the word closest in meaning to the word in capitals.

It is believed%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Truthfulness', true, 1), ('B', 'Falseness', false, 2), ('C', 'Boldness', false, 3), ('D', 'Length', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which word has the opposite meaning of “relinquish”?', 'To relinquish is to give something up; the opposite is to retain (keep) it.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Which of the following words has the opposite meaning of “waive”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Surrender', false, 1), ('B', 'Abandon', false, 2), ('C', 'Retain', true, 3), ('D', 'Release', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What does “aquatic” mean?', 'Aquatic means living in or relating to water (from Latin aqua, water).', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'What does “equestrian” mean?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Relating to horses', false, 1), ('B', 'Relating to water', true, 2), ('C', 'Relating to the sky', false, 3), ('D', 'Relating to farming', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Pema pays 40% of her monthly income as rent and 20% as loan repayment. She spends Nu. 3,000 on food and saves Nu. 9,000 a month. What is her monthly income?', 'Rent and loan take 60%, so 40% is left = 3,000 + 9,000 = Nu. 12,000. Income = 12,000 ÷ 0.4 = Nu. 30,000.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'percentages'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Tandin pays 50\%%' limit 1), 'new_numbers',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "what_changed": "Same skill as the past-paper question, with new numbers or words."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 25,000', false, 1), ('B', 'Nu. 28,000', false, 2), ('C', 'Nu. 30,000', true, 3), ('D', 'Nu. 36,000', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Six teams take part in a league. Each team plays every other team twice. How many matches are played in total?', 'Number of pairs = 6 × 5 ÷ 2 = 15. Each pair plays twice: 15 × 2 = 30 matches.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'counting'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Five teams from Thimphu%' limit 1), 'new_numbers',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "what_changed": "Same skill as the past-paper question, with new numbers or words."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '12', false, 1), ('B', '15', false, 2), ('C', '30', true, 3), ('D', '36', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The average age of 6 friends is 22. When 2 more friends join, the average becomes 24. What is the average age of the 2 new friends?', 'Before: 6 × 22 = 132. After: 8 × 24 = 192. The new friends total 60 years, an average of 30.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'averages'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'The average age of a group of 5 students%' limit 1), 'new_numbers',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "what_changed": "Same skill as the past-paper question, with new numbers or words."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '26', false, 1), ('B', '28', false, 2), ('C', '30', true, 3), ('D', '32', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'If:
3, 4 = 21
5, 2 = 35
4, 6 = 40
then 7, 3 = ?', 'The rule is (a + b) × a: (3 + 4) × 3 = 21, (5 + 2) × 5 = 35, (4 + 6) × 4 = 40. So (7 + 3) × 7 = 70.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'number-patterns'),
    'advanced', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'If:
2, 3 = 10%' limit 1), 'new_numbers',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "what_changed": "Same skill as the past-paper question, with new numbers or words."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '49', false, 1), ('B', '63', false, 2), ('C', '70', true, 3), ('D', '80', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What comes next in the series?

c  f  i  l  o  ?', 'Each letter is 3 places after the one before: o + 3 = r.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'letter-series'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'What is the missing letter in this series?

b  e  h%' limit 1), 'new_numbers',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "what_changed": "Same skill as the past-paper question, with new numbers or words."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'q', false, 1), ('B', 'r', true, 2), ('C', 's', false, 3), ('D', 't', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What comes next in the series?

2, 6, 12, 20, 30, ?', 'The differences grow by 2 each time: +4, +6, +8, +10, so next is +12: 30 + 12 = 42. (Each term is n × (n + 1).)', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'number-series'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '36', false, 1), ('B', '40', false, 2), ('C', '42', true, 3), ('D', '44', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What comes next in the series?

3, 9, 27, 81, ?', 'Each number is 3 times the one before: 81 × 3 = 243.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'number-series'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '162', false, 1), ('B', '243', true, 2), ('C', '324', false, 3), ('D', '108', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Tashi is older than Karma. Karma is older than Dema. Sonam is younger than Dema. Who is the youngest?', 'Order from oldest: Tashi, Karma, Dema, Sonam. Sonam is the youngest.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'ordering-and-ranking'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Tashi', false, 1), ('B', 'Karma', false, 2), ('C', 'Dema', false, 3), ('D', 'Sonam', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Dorji walks 5 km north, turns right and walks 3 km, then turns right again and walks 5 km. Where is he now compared with his starting point?', 'North 5 km, then right = east 3 km, then right = south 5 km. He is back level with the start, 3 km to the east.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'directions'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '3 km east', true, 1), ('B', '3 km west', false, 2), ('C', '5 km north', false, 3), ('D', '13 km east', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The price of an item is Nu. 400. It is increased by 25% and the new price is then reduced by 20%. What is the final price?', '400 × 1.25 = 500; 500 × 0.80 = 400. The final price is Nu. 400.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'percentages'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 380', false, 1), ('B', 'Nu. 400', true, 2), ('C', 'Nu. 410', false, 3), ('D', 'Nu. 420', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Nu. 7,200 is shared between Karma and Pema in the ratio 5 : 3. How much does Karma get?', 'There are 5 + 3 = 8 parts; one part = 7,200 ÷ 8 = 900. Karma gets 5 × 900 = Nu. 4,500.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'ratio-and-proportion'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 2,700', false, 1), ('B', 'Nu. 4,000', false, 2), ('C', 'Nu. 4,500', true, 3), ('D', 'Nu. 4,800', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A car travels 180 km in 2 hours 30 minutes. What is its average speed?', '2 hours 30 minutes = 2.5 hours. 180 ÷ 2.5 = 72 km/h.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'rates-and-cost'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '60 km/h', false, 1), ('B', '72 km/h', true, 2), ('C', '75 km/h', false, 3), ('D', '90 km/h', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Sonam can finish a job in 6 days and Dawa can finish it in 12 days. Working together, how many days will they take?', 'In one day they do 1/6 + 1/12 = 3/12 = 1/4 of the job, so together they take 4 days.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'rates-and-cost'),
    'advanced', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '3 days', false, 1), ('B', '4 days', true, 2), ('C', '8 days', false, 3), ('D', '9 days', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What is the angle between the hour hand and the minute hand of a clock at exactly 4:00?', 'Each hour mark is 30° apart (360 ÷ 12). At 4:00 the hands are 4 marks apart: 4 × 30° = 120°.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'time-and-calendars'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '90°', false, 1), ('B', '100°', false, 2), ('C', '120°', true, 3), ('D', '150°', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'In a year that is not a leap year, 1 January is a Monday. What day is 1 February?', 'January has 31 days = 4 weeks + 3 days. Three days after Monday is Thursday.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'time-and-calendars'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Wednesday', false, 1), ('B', 'Thursday', true, 2), ('C', 'Friday', false, 3), ('D', 'Monday', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which choice makes the best comparison?

Page is to book as brick is to:', 'Pages are the parts that make up a book; bricks are the parts that make up a wall.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'analogies'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Which choice makes the best comparison?

Fingers%' limit 1), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "what_changed": "Same skill as the past-paper question, in a new situation."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Clay', false, 1), ('B', 'Wall', true, 2), ('C', 'Builder', false, 3), ('D', 'Cement', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'If BHUTAN is written as NATUHB, how is THIMPHU written?', 'The word is written backwards. THIMPHU backwards is U-H-P-M-I-H-T: UHPMIHT.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'analogies'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Which choice makes the best comparison?

PEACH%' limit 1), 'new_numbers',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "what_changed": "Same skill as the past-paper question, with new numbers or words."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'UHPMIHT', true, 1), ('B', 'UHPIMHT', false, 2), ('C', 'UPHMIHT', false, 3), ('D', 'HUPMIHT', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'If you rearrange the letters “LEPAN”, you get the name of a:', 'LEPAN rearranges to NEPAL, a country.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'word-puzzles'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'If you rearrange the letters “LNGEDNA”%' limit 1), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "what_changed": "Same skill as the past-paper question, in a new situation."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'River', false, 1), ('B', 'Country', true, 2), ('C', 'Animal', false, 3), ('D', 'Mountain', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'Which is the odd one out?', 'Thimphu, Paro and Punakha are dzongkhags of Bhutan; Kathmandu is the capital of Nepal.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'odd-one-out'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Thimphu', false, 1), ('B', 'Paro', false, 2), ('C', 'Punakha', false, 3), ('D', 'Kathmandu', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A bag has 3 red balls and 5 blue balls. One ball is picked at random. What is the probability that it is red?', 'There are 8 balls and 3 are red, so the probability is 3/8.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'fractions'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '3/5', false, 1), ('B', '3/8', true, 2), ('C', '5/8', false, 3), ('D', '1/3', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows rice production (tonnes) in four dzongkhags (illustrative figures for practice).

| Dzongkhag | 2021 | 2022 | 2023 |
|---|---|---|---|
| Paro | 1,200 | 1,350 | 1,500 |
| Punakha | 2,400 | 2,200 | 2,600 |
| Wangdue | 1,800 | 1,950 | 2,100 |
| Samtse | 900 | 1,100 | 1,000 |

Which dzongkhag had the highest percentage increase in production from 2021 to 2023?', 'Paro +25% (1,200 → 1,500); Wangdue +16.7%; Samtse +11.1%; Punakha +8.3%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Paro', true, 1), ('B', 'Punakha', false, 2), ('C', 'Wangdue', false, 3), ('D', 'Samtse', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows rice production (tonnes) in four dzongkhags (illustrative figures for practice).

| Dzongkhag | 2021 | 2022 | 2023 |
|---|---|---|---|
| Paro | 1,200 | 1,350 | 1,500 |
| Punakha | 2,400 | 2,200 | 2,600 |
| Wangdue | 1,800 | 1,950 | 2,100 |
| Samtse | 900 | 1,100 | 1,000 |

What was the total production of the four dzongkhags in 2022?', '1,350 + 2,200 + 1,950 + 1,100 = 6,600 tonnes.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '6,400 tonnes', false, 1), ('B', '6,600 tonnes', true, 2), ('C', '6,800 tonnes', false, 3), ('D', '7,200 tonnes', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows rice production (tonnes) in four dzongkhags (illustrative figures for practice).

| Dzongkhag | 2021 | 2022 | 2023 |
|---|---|---|---|
| Paro | 1,200 | 1,350 | 1,500 |
| Punakha | 2,400 | 2,200 | 2,600 |
| Wangdue | 1,800 | 1,950 | 2,100 |
| Samtse | 900 | 1,100 | 1,000 |

Approximately what share of the 2023 total came from Punakha?', '2023 total = 1,500 + 2,600 + 2,100 + 1,000 = 7,200. 2,600 ÷ 7,200 ≈ 36%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '30%', false, 1), ('B', '33%', false, 2), ('C', '36%', true, 3), ('D', '40%', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows rice production (tonnes) in four dzongkhags (illustrative figures for practice).

| Dzongkhag | 2021 | 2022 | 2023 |
|---|---|---|---|
| Paro | 1,200 | 1,350 | 1,500 |
| Punakha | 2,400 | 2,200 | 2,600 |
| Wangdue | 1,800 | 1,950 | 2,100 |
| Samtse | 900 | 1,100 | 1,000 |

What was Wangdue’s average yearly production over the three years?', '(1,800 + 1,950 + 2,100) ÷ 3 = 5,850 ÷ 3 = 1,950 tonnes.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '1,900 tonnes', false, 1), ('B', '1,950 tonnes', true, 2), ('C', '2,000 tonnes', false, 3), ('D', '2,050 tonnes', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows four students’ marks (out of 100).

| Student | English | Maths | Science |
|---|---|---|---|
| Pema | 72 | 85 | 78 |
| Karma | 65 | 90 | 82 |
| Dechen | 88 | 70 | 75 |
| Sonam | 80 | 76 | 91 |

Which student has the highest total?', 'Totals: Pema 235, Karma 237, Dechen 233, Sonam 247. Sonam is highest.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Pema', false, 1), ('B', 'Karma', false, 2), ('C', 'Dechen', false, 3), ('D', 'Sonam', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows four students’ marks (out of 100).

| Student | English | Maths | Science |
|---|---|---|---|
| Pema | 72 | 85 | 78 |
| Karma | 65 | 90 | 82 |
| Dechen | 88 | 70 | 75 |
| Sonam | 80 | 76 | 91 |

What is the average English mark?', '(72 + 65 + 88 + 80) ÷ 4 = 305 ÷ 4 = 76.25.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '75.00', false, 1), ('B', '76.25', true, 2), ('C', '77.50', false, 3), ('D', '78.75', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows four students’ marks (out of 100).

| Student | English | Maths | Science |
|---|---|---|---|
| Pema | 72 | 85 | 78 |
| Karma | 65 | 90 | 82 |
| Dechen | 88 | 70 | 75 |
| Sonam | 80 | 76 | 91 |

How many students scored more than 75 in all three subjects?', 'Only Sonam (80, 76, 91). Pema has 72 in English, Karma 65 in English, Dechen 70 in Maths.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '0', false, 1), ('B', '1', true, 2), ('C', '2', false, 3), ('D', '3', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'The table shows four students’ marks (out of 100).

| Student | English | Maths | Science |
|---|---|---|---|
| Pema | 72 | 85 | 78 |
| Karma | 65 | 90 | 82 |
| Dechen | 88 | 70 | 75 |
| Sonam | 80 | 76 | 91 |

What is the difference between the highest and the lowest Maths mark?', 'Highest Maths = 90 (Karma); lowest = 70 (Dechen). 90 − 70 = 20.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '15', false, 1), ('B', '18', false, 2), ('C', '20', true, 3), ('D', '25', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A family’s monthly budget of Nu. 40,000 is shared as follows (as in a pie chart).

| Item | Share |
|---|---|
| Food | 35% |
| Rent | 25% |
| Education | 15% |
| Transport | 10% |
| Savings | 15% |

How much does the family spend on food each month?', '35% of 40,000 = 0.35 × 40,000 = Nu. 14,000.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'pie-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 12,000', false, 1), ('B', 'Nu. 14,000', true, 2), ('C', 'Nu. 15,000', false, 3), ('D', 'Nu. 16,000', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A family’s monthly budget of Nu. 40,000 is shared as follows (as in a pie chart).

| Item | Share |
|---|---|
| Food | 35% |
| Rent | 25% |
| Education | 15% |
| Transport | 10% |
| Savings | 15% |

In a pie chart of this budget, what angle would the rent slice have?', '25% of 360° = 90°.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'pie-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '60°', false, 1), ('B', '75°', false, 2), ('C', '90°', true, 3), ('D', '100°', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A family’s monthly budget of Nu. 40,000 is shared as follows (as in a pie chart).

| Item | Share |
|---|---|
| Food | 35% |
| Rent | 25% |
| Education | 15% |
| Transport | 10% |
| Savings | 15% |

How much goes to education and savings together?', '15% + 15% = 30% of 40,000 = Nu. 12,000.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'pie-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 10,000', false, 1), ('B', 'Nu. 12,000', true, 2), ('C', 'Nu. 14,000', false, 3), ('D', 'Nu. 15,000', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A family’s monthly budget of Nu. 40,000 is shared as follows (as in a pie chart).

| Item | Share |
|---|---|
| Food | 35% |
| Rent | 25% |
| Education | 15% |
| Transport | 10% |
| Savings | 15% |

Rent goes up by Nu. 2,000 and the family takes it all from savings, keeping the total at Nu. 40,000. What percentage of the budget is now saved?', 'Savings were 15% = Nu. 6,000. After taking Nu. 2,000, savings are Nu. 4,000 = 4,000 ÷ 40,000 = 10%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'pie-charts'),
    'advanced', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '5%', false, 1), ('B', '10%', true, 2), ('C', '12.5%', false, 3), ('D', '15%', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A company’s exports (Nu. million) over five years (illustrative figures).

| Year | 2019 | 2020 | 2021 | 2022 | 2023 |
|---|---|---|---|---|---|
| Exports | 120 | 135 | 110 | 150 | 165 |

Between which two years was the largest increase in exports?', 'Changes: +15, −25, +40, +15. The largest increase is 2021–2022 (+40).', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'line-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '2019–2020', false, 1), ('B', '2020–2021', false, 2), ('C', '2021–2022', true, 3), ('D', '2022–2023', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A company’s exports (Nu. million) over five years (illustrative figures).

| Year | 2019 | 2020 | 2021 | 2022 | 2023 |
|---|---|---|---|---|---|
| Exports | 120 | 135 | 110 | 150 | 165 |

By approximately what percentage did exports fall from 2020 to 2021?', 'Fall = 135 − 110 = 25. 25 ÷ 135 ≈ 18.5%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'line-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '15.0%', false, 1), ('B', '18.5%', true, 2), ('C', '22.7%', false, 3), ('D', '25.0%', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A company’s exports (Nu. million) over five years (illustrative figures).

| Year | 2019 | 2020 | 2021 | 2022 | 2023 |
|---|---|---|---|---|---|
| Exports | 120 | 135 | 110 | 150 | 165 |

What were the average yearly exports over the five years?', '120 + 135 + 110 + 150 + 165 = 680. 680 ÷ 5 = Nu. 136 million.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'line-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 130 million', false, 1), ('B', 'Nu. 136 million', true, 2), ('C', 'Nu. 140 million', false, 3), ('D', 'Nu. 142 million', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A company’s exports (Nu. million) over five years (illustrative figures).

| Year | 2019 | 2020 | 2021 | 2022 | 2023 |
|---|---|---|---|---|---|
| Exports | 120 | 135 | 110 | 150 | 165 |

Exports in 2023 were what percentage of exports in 2019?', '165 ÷ 120 = 1.375 = 137.5%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'line-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '125.0%', false, 1), ('B', '130.5%', false, 2), ('C', '137.5%', true, 3), ('D', '145.0%', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What is the mean of 12, 15, 18, 21 and 24?', '(12 + 15 + 18 + 21 + 24) ÷ 5 = 90 ÷ 5 = 18.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'statistics-basics'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '16', false, 1), ('B', '18', true, 2), ('C', '19', false, 3), ('D', '20', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What is the median of 7, 3, 9, 5, 11 and 2?', 'In order: 2, 3, 5, 7, 9, 11. With six numbers, the median is the average of the middle two: (5 + 7) ÷ 2 = 6.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'statistics-basics'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '5', false, 1), ('B', '6', true, 2), ('C', '7', false, 3), ('D', '6.2', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'What is the mode of 4, 6, 4, 8, 6, 4 and 9?', '4 appears three times, more than any other number.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'statistics-basics'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '4', true, 1), ('B', '6', false, 2), ('C', '8', false, 3), ('D', '9', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', 'A student’s score rises from 60 to 75. What is the percentage increase?', 'Increase = 15. 15 ÷ 60 = 0.25 = 25%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'statistics-basics'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing."}'::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '15%', false, 1), ('B', '20%', false, 2), ('C', '25%', true, 3), ('D', '30%', false, 4)) as v(label, body, ok, pos);

commit;
