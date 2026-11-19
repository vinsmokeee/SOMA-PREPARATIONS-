-- Claude-written PE practice questions, loaded as drafts (awaiting review) for /admin/ai/review.

begin;

insert into public.topics (subject_id, slug, name) select id, 'bar-charts', 'Bar charts' from public.subjects where slug = 'data-interpretation' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'distance-time-graphs', 'Distance–time graphs' from public.subjects where slug = 'data-interpretation' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'line-charts', 'Line charts' from public.subjects where slug = 'data-interpretation' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'pie-charts', 'Pie charts' from public.subjects where slug = 'data-interpretation' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'tables', 'Tables' from public.subjects where slug = 'data-interpretation' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'comprehension', 'Comprehension' from public.subjects where slug = 'dzongkha-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'honorific-words', 'Honorific words (ཞེ་ས)' from public.subjects where slug = 'dzongkha-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'opposites', 'Opposites (འགལ་མིང)' from public.subjects where slug = 'dzongkha-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'vocabulary', 'Vocabulary' from public.subjects where slug = 'dzongkha-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'antonyms', 'Antonyms' from public.subjects where slug = 'english-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'comprehension', 'Comprehension' from public.subjects where slug = 'english-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'grammar', 'Grammar' from public.subjects where slug = 'english-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'synonyms', 'Synonyms' from public.subjects where slug = 'english-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'vocabulary', 'Vocabulary' from public.subjects where slug = 'english-communication' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'ages', 'Ages' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'analogies', 'Analogies' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'averages', 'Averages' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'counting', 'Counting' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'directions', 'Directions' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'fractions', 'Fractions' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'general-awareness', 'General awareness' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'letter-series', 'Letter series' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'logical-puzzles', 'Logical puzzles' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'number-patterns', 'Number patterns' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'number-series', 'Number series' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'ordering-and-ranking', 'Ordering and ranking' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'percentages', 'Percentages' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'quantitative-comparison', 'Quantitative comparison' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'ratio-and-proportion', 'Ratio and proportion' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'time-and-calendars', 'Time and calendars' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'word-puzzles', 'Word puzzles' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Read the passage and answer the question.

Most of us know the feeling of leaving an important task for later. We tidy the desk, answer messages and make another cup of tea, yet the report stays unwritten. This habit, called procrastination, is often mistaken for laziness. Researchers who study it suggest a different explanation: people delay not because they dislike work, but because the task stirs an unpleasant feeling — boredom, self-doubt or the fear of doing it badly. Putting the task off brings quick relief, and that relief rewards the delay, so the habit grows stronger each time.

The cost is real. Work done at the last minute is rushed, and the worry that hangs over an unfinished task can be more tiring than the task itself. The remedy, the same researchers argue, is not stricter discipline but a gentler start. Breaking a large job into a first step small enough to feel harmless — writing one paragraph, reading one page — takes away much of the dread. Once we begin, the task usually turns out to be less frightening than we imagined.

According to the passage, people mainly procrastinate because', 'The passage says people delay “not because they dislike work, but because the task stirs an unpleasant feeling”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'comprehension'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Read the passage and answer the question.%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b4-english', 1)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'they are lazy', false, 1), ('B', 'the task causes an unpleasant feeling they want to avoid', true, 2), ('C', 'they have too much free time', false, 3), ('D', 'they enjoy working under pressure', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Read the passage and answer the question.

Most of us know the feeling of leaving an important task for later. We tidy the desk, answer messages and make another cup of tea, yet the report stays unwritten. This habit, called procrastination, is often mistaken for laziness. Researchers who study it suggest a different explanation: people delay not because they dislike work, but because the task stirs an unpleasant feeling — boredom, self-doubt or the fear of doing it badly. Putting the task off brings quick relief, and that relief rewards the delay, so the habit grows stronger each time.

The cost is real. Work done at the last minute is rushed, and the worry that hangs over an unfinished task can be more tiring than the task itself. The remedy, the same researchers argue, is not stricter discipline but a gentler start. Breaking a large job into a first step small enough to feel harmless — writing one paragraph, reading one page — takes away much of the dread. Once we begin, the task usually turns out to be less frightening than we imagined.

Why, according to the passage, does the habit of delay grow stronger?', '“Putting the task off brings quick relief, and that relief rewards the delay, so the habit grows stronger.”', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'comprehension'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Read the passage and answer the question.%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b4-english', 2)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Deadlines are usually too long', false, 1), ('B', 'The relief felt after putting a task off rewards the delay', true, 2), ('C', 'Tasks become harder over time', false, 3), ('D', 'Other people encourage it', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Read the passage and answer the question.

Most of us know the feeling of leaving an important task for later. We tidy the desk, answer messages and make another cup of tea, yet the report stays unwritten. This habit, called procrastination, is often mistaken for laziness. Researchers who study it suggest a different explanation: people delay not because they dislike work, but because the task stirs an unpleasant feeling — boredom, self-doubt or the fear of doing it badly. Putting the task off brings quick relief, and that relief rewards the delay, so the habit grows stronger each time.

The cost is real. Work done at the last minute is rushed, and the worry that hangs over an unfinished task can be more tiring than the task itself. The remedy, the same researchers argue, is not stricter discipline but a gentler start. Breaking a large job into a first step small enough to feel harmless — writing one paragraph, reading one page — takes away much of the dread. Once we begin, the task usually turns out to be less frightening than we imagined.

The word “remedy” in the second paragraph is closest in meaning to', 'A remedy is something that cures or corrects a problem.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'comprehension'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Read the passage and answer the question.%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b4-english', 3)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'reason', false, 1), ('B', 'punishment', false, 2), ('C', 'cure', true, 3), ('D', 'warning', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Read the passage and answer the question.

Most of us know the feeling of leaving an important task for later. We tidy the desk, answer messages and make another cup of tea, yet the report stays unwritten. This habit, called procrastination, is often mistaken for laziness. Researchers who study it suggest a different explanation: people delay not because they dislike work, but because the task stirs an unpleasant feeling — boredom, self-doubt or the fear of doing it badly. Putting the task off brings quick relief, and that relief rewards the delay, so the habit grows stronger each time.

The cost is real. Work done at the last minute is rushed, and the worry that hangs over an unfinished task can be more tiring than the task itself. The remedy, the same researchers argue, is not stricter discipline but a gentler start. Breaking a large job into a first step small enough to feel harmless — writing one paragraph, reading one page — takes away much of the dread. Once we begin, the task usually turns out to be less frightening than we imagined.

What does the passage recommend?', 'The remedy is “a gentler start”: a first step “small enough to feel harmless”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'comprehension'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Read the passage and answer the question.%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b4-english', 4)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Working longer hours', false, 1), ('B', 'Stricter self-discipline', false, 2), ('C', 'Avoiding difficult tasks', false, 3), ('D', 'Starting with a very small first step', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Read the passage and answer the question.

Most of us know the feeling of leaving an important task for later. We tidy the desk, answer messages and make another cup of tea, yet the report stays unwritten. This habit, called procrastination, is often mistaken for laziness. Researchers who study it suggest a different explanation: people delay not because they dislike work, but because the task stirs an unpleasant feeling — boredom, self-doubt or the fear of doing it badly. Putting the task off brings quick relief, and that relief rewards the delay, so the habit grows stronger each time.

The cost is real. Work done at the last minute is rushed, and the worry that hangs over an unfinished task can be more tiring than the task itself. The remedy, the same researchers argue, is not stricter discipline but a gentler start. Breaking a large job into a first step small enough to feel harmless — writing one paragraph, reading one page — takes away much of the dread. Once we begin, the task usually turns out to be less frightening than we imagined.

Which title best suits the passage?', 'The passage explains the cause of procrastination and a way to overcome it.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'comprehension'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Read the passage and answer the question.%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b4-english', 5)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Why We Put Things Off, and How to Start', true, 1), ('B', 'The Dangers of Hard Work', false, 2), ('C', 'How to Write a Report', false, 3), ('D', 'Laziness in the Modern Office', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following words looks plural but is singular?', '“Measles is a disease” takes a singular verb. Pliers and spectacles are plural nouns; police takes a plural verb.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which of the following words looks plural but is not?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Police', false, 1), ('B', 'Measles', true, 2), ('C', 'Pliers', false, 3), ('D', 'Spectacles', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase that correctly completes the sentence.

The committee’s decision ______ the meeting until March surprised everyone.', '“Decision” is followed by a to-infinitive: “the decision to postpone”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Choose the word or phrase that correctly completes the sentence.

The government%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'to postponing', false, 1), ('B', 'postpone', false, 2), ('C', 'to postpone', true, 3), ('D', 'postponing of', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase that correctly completes the sentence.

The modern hospital ______ from a small dispensary that was opened in 1960.', 'A completed past development with a past time reference takes the simple past: “grew from”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Choose the word that correctly completes the sentence.

“The political party%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'has grown', false, 1), ('B', 'grew', true, 2), ('C', 'grown', false, 3), ('D', 'growing', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase that correctly completes the sentence.

Unemployment will fall only ______ create more jobs in the private sector.', 'The condition is positive: unemployment falls only if we create jobs.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Choose the word or phrase that will correctly complete the sentence.

The poverty rates%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'if we', true, 1), ('B', 'unless we', false, 2), ('C', 'we will', false, 3), ('D', 'when will we', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase that correctly completes the sentence.

The new Act ______ free basic health care for every citizen.', 'A law “provides for” something: it makes it possible or required.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Choose the word or phrase that will correctly complete the sentence.

The legislation%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'provides by', false, 1), ('B', 'provides for', true, 2), ('C', 'provides with', false, 3), ('D', 'provides to', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase that correctly completes the sentence.

No sooner had the bus left ______ it began to rain.', 'The fixed pattern is “No sooner … than”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'when', false, 1), ('B', 'than', true, 2), ('C', 'then', false, 3), ('D', 'that', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following usages of the word “judicious” is correct?', 'Judicious means showing good judgement; it describes decisions and choices.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which of the following usages of the word “tortuous” is correct?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'The judicious rain flooded the fields.', false, 1), ('B', 'He felt judicious after the long walk.', false, 2), ('C', 'The road was judicious and full of bends.', false, 3), ('D', 'She made a judicious choice of words in a difficult meeting.', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following makes a correct distinction between “continual” and “continuous”?', 'Continual interruptions keep recurring; a continuous noise never stops.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'advanced', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which of the following makes a correct distinction between the words “aggravate” and “irritate”%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Continual means happening again and again with breaks; continuous means without any break.', true, 1), ('B', 'Continual means without any break; continuous means happening again and again.', false, 2), ('C', 'They mean exactly the same.', false, 3), ('D', 'Continual is used only for time; continuous only for space.', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following makes a correct distinction between “imply” and “infer”?', 'To imply is to suggest without saying; to infer is to conclude from what is suggested.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'advanced', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Which of the following makes a correct distinction between “adverse” and “averse”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Imply is formal and infer is informal; they mean the same.', false, 1), ('B', 'A speaker implies something; a listener infers it.', true, 2), ('C', 'A listener implies something; a speaker infers it.', false, 3), ('D', 'Both words mean “to say directly”.', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does “arboreal” mean?', 'Arboreal animals, such as many monkeys, live in trees.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'What does “equestrian” mean?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Living under the ground', false, 1), ('B', 'Relating to the desert', false, 2), ('C', 'Living in or relating to trees', true, 3), ('D', 'Relating to the sea', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase that correctly completes the sentence.

The old hermit lived a ______ life in a cave above the valley.', 'Reclusive means avoiding the company of others; the other three describe sociable or lively people.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Choose the word that will correctly complete the sentence.

She was taking a%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'gregarious', false, 1), ('B', 'boisterous', false, 2), ('C', 'convivial', false, 3), ('D', 'reclusive', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase that correctly completes the sentence.

The minister is ______ negotiator; she rarely loses an argument.', 'Astute means clever and quick to see an advantage.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Choose the word that correctly completes the sentence.

The professor is%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'an astute', true, 1), ('B', 'a naive', false, 2), ('C', 'an indifferent', false, 3), ('D', 'a reluctant', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase that correctly completes the sentence.

The ______ aroma of ema datshi filled the kitchen and made everyone hungry.', 'Tantalising means tempting; insipid and bland mean lacking flavour.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'The \_\_\_\_\_ smell of Italian food%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'odourless', false, 1), ('B', 'tantalising', true, 2), ('C', 'insipid', false, 3), ('D', 'bland', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase closest in meaning to the word in capitals.

The officer’s TACITURN manner made the interview difficult.', 'Taciturn means saying very little; reserved.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Choose the word or phrase closest in meaning to the word in capitals.%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'cheerful', false, 1), ('B', 'rude', false, 2), ('C', 'reserved', true, 3), ('D', 'talkative', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase closest in meaning to the word in capitals.

The report contained several SPURIOUS claims.', 'Spurious means false or fake, though it may look genuine.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Choose the word or phrase closest in meaning to the word in capitals.%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'important', false, 1), ('B', 'original', false, 2), ('C', 'careful', false, 3), ('D', 'false', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase closest in meaning to the word in capitals.

The flood caused UNPRECEDENTED damage to the town.', 'Unprecedented means never done or known before.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Choose the word or phrase closest in meaning to the word in capitals.%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'never seen before', true, 1), ('B', 'expected', false, 2), ('C', 'minor', false, 3), ('D', 'repeated', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following words has the same meaning as “cogent”?', 'A cogent argument is clear and convincing.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which of the following words has the same meaning as “ubiquitous”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'costly', false, 1), ('B', 'convincing', true, 2), ('C', 'confusing', false, 3), ('D', 'careless', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following words has the same meaning as “pragmatic”?', 'Pragmatic means dealing with things in a practical way.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which of the following words has the same meaning as “ubiquitous”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'dishonest', false, 1), ('B', 'idle', false, 2), ('C', 'practical', true, 3), ('D', 'dreamy', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following words has the same meaning as “lethargic”?', 'Lethargic means slow and lacking energy.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which of the following words has the same meaning as “ubiquitous”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'energetic', false, 1), ('B', 'angry', false, 2), ('C', 'curious', false, 3), ('D', 'sluggish', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following words has the opposite meaning of “verbose”?', 'Verbose means using too many words; concise is the opposite.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which of the following has the opposite meaning of “impinge”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'concise', true, 1), ('B', 'wordy', false, 2), ('C', 'lengthy', false, 3), ('D', 'talkative', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following words has the opposite meaning of “frivolous”?', 'Frivolous means not serious.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which of the following has the opposite meaning of “impinge”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'trivial', false, 1), ('B', 'serious', true, 2), ('C', 'silly', false, 3), ('D', 'playful', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following words has the opposite meaning of “benign”?', 'Benign means harmless or kind; harmful is the opposite.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which of the following has the opposite meaning of “impinge”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'gentle', false, 1), ('B', 'mild', false, 2), ('C', 'harmful', true, 3), ('D', 'kind', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following words has the opposite meaning of “obstinate”?', 'Obstinate means refusing to change; flexible is the opposite.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which of the following has the opposite meaning of “impinge”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'stubborn', false, 1), ('B', 'rigid', false, 2), ('C', 'determined', false, 3), ('D', 'flexible', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following words has the opposite meaning of “scarcity”?', 'Scarcity means shortage; abundance means plenty.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which of the following has the opposite meaning of “impinge”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'abundance', true, 1), ('B', 'shortage', false, 2), ('C', 'lack', false, 3), ('D', 'need', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following words has the opposite meaning of “ostentatious”?', 'Ostentatious means showy, designed to impress; modest is the opposite.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which of the following has the opposite meaning of “impinge”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'grand', false, 1), ('B', 'modest', true, 2), ('C', 'showy', false, 3), ('D', 'flashy', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Tashi is taller than Dema but shorter than Karma. Sonam is shorter than Dema. Who is the shortest?', 'Karma > Tashi > Dema > Sonam, so Sonam is the shortest.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'ordering-and-ranking'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Deki is shorter than Pema%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Tashi', false, 1), ('B', 'Karma', false, 2), ('C', 'Sonam', true, 3), ('D', 'Dema', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'In a race, Pema finished ahead of Dawa but behind Tshering. Karma finished ahead of Tshering but behind Sonam. Who came third?', 'Order: Sonam, Karma, Tshering, Pema, Dawa. Tshering is third.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'ordering-and-ranking'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'In a horse race%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Karma', false, 1), ('B', 'Pema', false, 2), ('C', 'Dawa', false, 3), ('D', 'Tshering', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Five books stand on a shelf. Maths is at the left end and Dzongkha at the right end. Science is between Maths and English. History is to the right of English. Which book is in the middle?', 'Left to right: Maths, Science, English, History, Dzongkha. English is in the middle.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'ordering-and-ranking'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Six electronic items are kept%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'English', true, 1), ('B', 'Science', false, 2), ('C', 'History', false, 3), ('D', 'Maths', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'In a class of 160 students, 96 are female. What percentage of the class is male?', 'Male = 64; 64 ÷ 160 × 100 = 40%.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'percentages'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'In a class of 125 students%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '64%', false, 1), ('B', '40%', true, 2), ('C', '60%', false, 3), ('D', '36%', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '6 is 75% of what number?', '6 ÷ 0.75 = 8.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'percentages'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like '3 is 80\% of what number?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '7.5', false, 1), ('B', '9', false, 2), ('C', '8', true, 3), ('D', '4.5', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'The price of a company share falls from Nu. 250 to Nu. 230. What is the percentage decrease?', 'Fall = 20; 20 ÷ 250 × 100 = 8%.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'percentages'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'The value of a company share drops%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '20%', false, 1), ('B', '9%', false, 2), ('C', '10%', false, 3), ('D', '8%', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Pema spends 40% of her monthly income on rent and 30% on food, and saves the remaining Nu. 9,000. What is her monthly income?', 'Savings are 30% of income: 9,000 ÷ 0.30 = Nu. 30,000.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'percentages'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Tandin pays 50\% of his monthly income%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 30,000', true, 1), ('B', 'Nu. 27,000', false, 2), ('C', 'Nu. 22,500', false, 3), ('D', 'Nu. 36,000', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'A price rises from Nu. 40 to Nu. 50 and then falls back to Nu. 40. Which statement is true?', 'Increase = 10/40 = 25%; decrease = 10/50 = 20%.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'percentages'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'A number increases from 20 to 30%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Both are 10%.', false, 1), ('B', 'The percentage increase is greater than the percentage decrease.', true, 2), ('C', 'The percentage decrease is greater than the percentage increase.', false, 3), ('D', 'Both percentages are equal.', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'The average weight of 4 parcels is 12 kg. When a fifth parcel is added, the average becomes 13 kg. How heavy is the fifth parcel?', 'Total of five = 65 kg; total of four = 48 kg; the fifth = 17 kg.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'averages'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'The average age of a group of 5 students%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '15 kg', false, 1), ('B', '12.5 kg', false, 2), ('C', '17 kg', true, 3), ('D', '13 kg', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Five friends scored 6, 9, 7, 10 and 8 in a quiz. What is their mean score?', '(6 + 9 + 7 + 10 + 8) ÷ 5 = 40 ÷ 5 = 8.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'averages'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Dechen took a quiz with five friends%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '7', false, 1), ('B', '9', false, 2), ('C', '7.5', false, 3), ('D', '8', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What is 1/3 of half of 1/4 of 480?', '1/4 of 480 = 120; half = 60; 1/3 of 60 = 20.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'fractions'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'What is 1/4 of half of 1/5 of 200?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '20', true, 1), ('B', '40', false, 2), ('C', '60', false, 3), ('D', '30', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Karma ate 3/5 of a pizza and Dorji ate 2/3 of an identical pizza. Together they ate:', '3/5 + 2/3 = 9/15 + 10/15 = 19/15, which is more than 1.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'fractions'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Sonam and Pema were each given an apple pie%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Exactly half a pizza', false, 1), ('B', 'More than one pizza', true, 2), ('C', 'Exactly one pizza', false, 3), ('D', 'Less than one pizza', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'In a class of 35 students, the ratio of boys to girls is 3 : 4. How many girls are there?', '35 ÷ 7 = 5 per part; girls = 4 × 5 = 20.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'ratio-and-proportion'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'There are 24 students in a class%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '21', false, 1), ('B', '28', false, 2), ('C', '20', true, 3), ('D', '15', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which number comes next in the series?

2, 3, 5, 8, 12, 17, ?', 'The differences grow by one: +1, +2, +3, +4, +5, so next is +6: 17 + 6 = 23.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'number-series'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which number comes next in the series?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '22', false, 1), ('B', '24', false, 2), ('C', '21', false, 3), ('D', '23', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'If:
3, 4 = 21
5, 2 = 35
4, 6 = 40
then 6, 3 = ?', 'Rule: first × (first + second). 3 × 7 = 21, 5 × 7 = 35, 4 × 10 = 40, so 6 × 9 = 54.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'number-patterns'),
    'advanced', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'If:
2, 3 = 10%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '54', true, 1), ('B', '18', false, 2), ('C', '45', false, 3), ('D', '36', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What is the missing letter in this series?

c  f  i  l  o  ?  u', 'Each letter is three places after the one before: o (15) + 3 = r (18).', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'letter-series'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'What is the missing letter in this series?

b  e  h%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'p', false, 1), ('B', 'r', true, 2), ('C', 'q', false, 3), ('D', 's', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which letter comes next in this series?

a  z  c  x  e  ?', 'Two series alternate: a, c, e (forward by 2) and z, x, v (back by 2). Next is v.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'letter-series'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'What is the missing letter in this series?

a  z  b%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'g', false, 1), ('B', 'u', false, 2), ('C', 'v', true, 3), ('D', 'w', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which letter completes the series?

p  m  q  m  r  m  s  m  ?', 'The letters p, q, r, s alternate with m; next is t.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'letter-series'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Which letter completes the series?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'm', false, 1), ('B', 'u', false, 2), ('C', 's', false, 3), ('D', 't', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which choice makes the best comparison?

TIGER is to REGIT as 58316 is to:', 'REGIT is TIGER written backwards; 58316 backwards is 61385.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'analogies'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Which choice makes the best comparison?

PEACH%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '61385', true, 1), ('B', '61358', false, 2), ('C', '85316', false, 3), ('D', '16385', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which choice makes the best comparison?

Petal is to flower as page is to:', 'A petal is part of a flower; a page is part of a book.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'analogies'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Which choice makes the best comparison?

Fingers%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Library', false, 1), ('B', 'Book', true, 2), ('C', 'Pen', false, 3), ('D', 'Word', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'If you unscramble the letters ANIDI, you get the name of a:', 'ANIDI unscrambles to INDIA.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'word-puzzles'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'If you unscramble the letters YKANE%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Animal', false, 1), ('B', 'Fruit', false, 2), ('C', 'Country', true, 3), ('D', 'River', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'If you unscramble the letters RGTEI, you get the name of an:', 'RGTEI unscrambles to TIGER.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'word-puzzles'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'If you unscramble the letters ITNKA%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'City', false, 1), ('B', 'Country', false, 2), ('C', 'Instrument', false, 3), ('D', 'Animal', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Seven schools play in a football league. Each school plays every other school once. How many matches are played?', '7 × 6 ÷ 2 = 21 matches.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'counting'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Five teams from Thimphu%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '21', true, 1), ('B', '42', false, 2), ('C', '14', false, 3), ('D', '49', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'In how many ways can the letters of the word DRUK be arranged, using each letter once?', '4 different letters: 4 × 3 × 2 × 1 = 24.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'counting'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'In how many ways can the letters of SOLVING%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '4', false, 1), ('B', '24', true, 2), ('C', '16', false, 3), ('D', '12', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Pema is 15 years old and three times as old as her brother. How old will Pema be when she is twice as old as her brother?', 'Brother is 5; the age gap is always 10. Pema is twice his age when he is 10 and she is 20.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'ages'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Pema is sixteen years old%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '30', false, 1), ('B', '18', false, 2), ('C', '20', true, 3), ('D', '25', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Sonam speaks Hindi and English. Dawa speaks Hindi and Nepali. Pema speaks Nepali and English. Who speaks both Nepali and English?', 'Only Pema speaks both Nepali and English.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'logical-puzzles'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Penjore, Choki, Lhamo and Dorji speak many languages%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Sonam', false, 1), ('B', 'Dawa', false, 2), ('C', 'Nobody', false, 3), ('D', 'Pema', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Dorji walks 4 km north, then turns left and walks 3 km. In which direction is he now from his starting point?', 'Turning left from north means walking west, so he ends up north and west of the start: north-west.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'directions'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which two statements are needed%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'North-west', true, 1), ('B', 'North-east', false, 2), ('C', 'South-west', false, 3), ('D', 'West', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Bhutan’s time is 6 hours ahead of London’s (UTC). When it is 12 noon in Thimphu, what time is it in London?', '12 noon minus 6 hours = 6 AM.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'time-and-calendars'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'I am a time of the day%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '7 AM', false, 1), ('B', '6 AM', true, 2), ('C', '6 PM', false, 3), ('D', '12 midnight', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Compare Column A and Column B.

Column A: 8⁴
Column B: 4⁶', '8⁴ = 2¹² and 4⁶ = 2¹²; both are 4,096.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'quantitative-comparison'),
    'advanced', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Compare Column A and Column B.%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Column B is greater', false, 1), ('B', 'The relationship cannot be determined', false, 2), ('C', 'The two quantities are equal', true, 3), ('D', 'Column A is greater', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following is one of the four pillars of Gross National Happiness?', 'The four pillars are sustainable and equitable socio-economic development, environmental conservation, preservation and promotion of culture, and good governance.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'general-awareness'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Progress that meets the needs%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Rapid industrialisation', false, 1), ('B', 'Growth in GDP above all else', false, 2), ('C', 'Military strength', false, 3), ('D', 'Preservation and promotion of culture', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

Which dzongkhag had fewer visitors in 2023 than in 2022?', 'Punakha fell from 35 to 30 thousand; all others rose.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-visitors.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Punakha', true, 1), ('B', 'Paro', false, 2), ('C', 'Bumthang', false, 3), ('D', 'Haa', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

What was the total number of visitors to the five dzongkhags in 2023?', '55 + 72 + 30 + 32 + 14 = 203 thousand.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-visitors.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '210 thousand', false, 1), ('B', '203 thousand', true, 2), ('C', '172 thousand', false, 3), ('D', '198 thousand', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

Which dzongkhag had the largest percentage increase in visitors from 2022 to 2023?', 'Haa +40% (10→14), Paro +31%, Bumthang +28%, Thimphu +20%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-visitors.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Bumthang', false, 1), ('B', 'Thimphu', false, 2), ('C', 'Haa', true, 3), ('D', 'Paro', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

In 2022, how many more visitors went to Thimphu than to Paro?', '60 − 42 = 18 thousand.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-visitors.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '12 thousand', false, 1), ('B', '17 thousand', false, 2), ('C', '25 thousand', false, 3), ('D', '18 thousand', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

What was the average number of visitors per dzongkhag in 2022?', '(42 + 60 + 35 + 25 + 10) ÷ 5 = 172 ÷ 5 = 34.4 thousand.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-visitors.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '34.4 thousand', true, 1), ('B', '40.6 thousand', false, 2), ('C', '35 thousand', false, 3), ('D', '32.8 thousand', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the line graph (illustrative figures) and answer the question.

In which month did the school use the least electricity?', 'May shows the lowest value, 700 units.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'line-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-electricity.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'March', false, 1), ('B', 'May', true, 2), ('C', 'April', false, 3), ('D', 'June', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the line graph (illustrative figures) and answer the question.

By about what percentage did use fall from January to May?', 'Fall = 500 units; 500 ÷ 1,200 × 100 ≈ 41.7%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'line-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-electricity.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'About 30%', false, 1), ('B', 'About 58%', false, 2), ('C', 'About 42%', true, 3), ('D', 'About 50%', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the line graph (illustrative figures) and answer the question.

What was the average monthly use over the six months (to the nearest unit)?', 'Total = 5,650; 5,650 ÷ 6 ≈ 941.7, so 942.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'line-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-electricity.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '950 units', false, 1), ('B', '900 units', false, 2), ('C', '1,000 units', false, 3), ('D', '942 units', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the line graph (illustrative figures) and answer the question.

In how many months was use above 900 units?', 'January (1,200), February (1,100) and March (950). June is exactly 900, not above.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'line-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-electricity.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '3', true, 1), ('B', '4', false, 2), ('C', '2', false, 3), ('D', '5', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the line graph (illustrative figures) and answer the question.

By what percentage did use rise from May to June?', 'Rise = 200; 200 ÷ 700 × 100 ≈ 28.6%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'line-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-electricity.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'About 33%', false, 1), ('B', 'About 29%', true, 2), ('C', 'About 22%', false, 3), ('D', 'About 20%', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the pie chart and answer the question.

How much does Karma spend on books each month?', '20% of 6,000 = Nu. 1,200.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'pie-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-allowance.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 1,500', false, 1), ('B', 'Nu. 2,000', false, 2), ('C', 'Nu. 1,200', true, 3), ('D', 'Nu. 900', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the pie chart and answer the question.

What angle at the centre does the Transport slice make?', '15% of 360° = 54°.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'pie-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-allowance.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '45°', false, 1), ('B', '60°', false, 2), ('C', '36°', false, 3), ('D', '54°', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the pie chart and answer the question.

How much more does Karma spend on food than he saves?', 'Food 40% − savings 15% = 25% of 6,000 = Nu. 1,500.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'pie-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-allowance.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 1,500', true, 1), ('B', 'Nu. 2,400', false, 2), ('C', 'Nu. 900', false, 3), ('D', 'Nu. 1,200', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the pie chart and answer the question.

If his allowance rises to Nu. 7,500 and the shares stay the same, how much will he spend on his phone?', '10% of 7,500 = Nu. 750.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'pie-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-allowance.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 1,125', false, 1), ('B', 'Nu. 750', true, 2), ('C', 'Nu. 600', false, 3), ('D', 'Nu. 900', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the pie chart and answer the question.

What is the ratio of spending on food to spending on books?', '40% : 20% = 2 : 1.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'pie-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-allowance.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '1 : 2', false, 1), ('B', '3 : 2', false, 2), ('C', '2 : 1', true, 3), ('D', '4 : 1', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

How many new businesses were registered in the six towns altogether?', '48 + 36 + 30 + 24 + 18 + 12 = 168.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-businesses.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '158', false, 1), ('B', '172', false, 2), ('C', '148', false, 3), ('D', '168', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

About what percentage of all the new businesses were in Thimphu?', '48 ÷ 168 × 100 ≈ 28.6%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-businesses.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'About 29%', true, 1), ('B', 'About 25%', false, 2), ('C', 'About 33%', false, 3), ('D', 'About 48%', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

What is the ratio of new businesses in Phuentsholing to those in Bumthang?', '36 : 12 = 3 : 1.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-businesses.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '1 : 3', false, 1), ('B', '3 : 1', true, 2), ('C', '2 : 1', false, 3), ('D', '4 : 1', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

How many towns had more new businesses than the average of the six towns?', 'Average = 168 ÷ 6 = 28. Thimphu, Phuentsholing and Gelephu are above 28.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-businesses.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '4', false, 1), ('B', '1', false, 2), ('C', '3', true, 3), ('D', '2', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

Gelephu registered how many percent more new businesses than Paro?', '(30 − 24) ÷ 24 × 100 = 25%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-businesses.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '20%', false, 1), ('B', '6%', false, 2), ('C', '30%', false, 3), ('D', '25%', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the distance–time graph and answer the question.

What was the bus’s speed during the first two hours?', '100 km in 2 hours = 50 km/h.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'distance-time-graphs'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'A student walks to a bus stop%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, '/papers/soma/b4-bus.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '50 km/h', true, 1), ('B', '100 km/h', false, 2), ('C', '40 km/h', false, 3), ('D', '25 km/h', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the distance–time graph and answer the question.

For how long did the bus stop?', 'The graph is flat from 2 h to 2.5 h: half an hour.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'distance-time-graphs'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-bus.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '2 hours', false, 1), ('B', '30 minutes', true, 2), ('C', '1 hour', false, 3), ('D', '15 minutes', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the distance–time graph and answer the question.

How far did the bus travel in total?', 'The graph ends at 160 km.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'distance-time-graphs'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-bus.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '180 km', false, 1), ('B', '60 km', false, 2), ('C', '160 km', true, 3), ('D', '100 km', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the distance–time graph and answer the question.

What was the average speed for the whole journey, including the stop?', '160 km in 4 hours = 40 km/h.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'distance-time-graphs'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Using the same graph%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, '/papers/soma/b4-bus.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '50 km/h', false, 1), ('B', '45 km/h', false, 2), ('C', '32 km/h', false, 3), ('D', '40 km/h', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the distance–time graph and answer the question.

What was the bus’s speed after the stop?', '60 km (100→160) in 1.5 hours = 40 km/h.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'distance-time-graphs'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, '/papers/soma/b4-bus.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '40 km/h', true, 1), ('B', '60 km/h', false, 2), ('C', '50 km/h', false, 3), ('D', '30 km/h', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'The table shows how many students sat and passed practice tests at a study centre (illustrative figures).

| Year | 2019 | 2020 | 2021 | 2022 | 2023 |
|---|---|---|---|---|---|
| Sat | 120 | 150 | 160 | 140 | 180 |
| Passed | 54 | 72 | 80 | 77 | 108 |

In which year was the pass rate highest?', 'Pass rates: 45%, 48%, 50%, 55%, 60%. The highest is 2023.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '2020', false, 1), ('B', '2023', true, 2), ('C', '2022', false, 3), ('D', '2021', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'The table shows how many students sat and passed practice tests at a study centre (illustrative figures).

| Year | 2019 | 2020 | 2021 | 2022 | 2023 |
|---|---|---|---|---|---|
| Sat | 120 | 150 | 160 | 140 | 180 |
| Passed | 54 | 72 | 80 | 77 | 108 |

What was the pass rate in 2019?', '54 ÷ 120 × 100 = 45%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '40%', false, 1), ('B', '50%', false, 2), ('C', '45%', true, 3), ('D', '54%', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'The table shows how many students sat and passed practice tests at a study centre (illustrative figures).

| Year | 2019 | 2020 | 2021 | 2022 | 2023 |
|---|---|---|---|---|---|
| Sat | 120 | 150 | 160 | 140 | 180 |
| Passed | 54 | 72 | 80 | 77 | 108 |

How many students passed over the five years altogether?', '54 + 72 + 80 + 77 + 108 = 391.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '381', false, 1), ('B', '401', false, 2), ('C', '750', false, 3), ('D', '391', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'The table shows how many students sat and passed practice tests at a study centre (illustrative figures).

| Year | 2019 | 2020 | 2021 | 2022 | 2023 |
|---|---|---|---|---|---|
| Sat | 120 | 150 | 160 | 140 | 180 |
| Passed | 54 | 72 | 80 | 77 | 108 |

By what percentage did the number of students sitting the test rise from 2019 to 2023?', '(180 − 120) ÷ 120 × 100 = 50%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '50%', true, 1), ('B', '60%', false, 2), ('C', '40%', false, 3), ('D', '33%', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'The table shows how many students sat and passed practice tests at a study centre (illustrative figures).

| Year | 2019 | 2020 | 2021 | 2022 | 2023 |
|---|---|---|---|---|---|
| Sat | 120 | 150 | 160 | 140 | 180 |
| Passed | 54 | 72 | 80 | 77 | 108 |

What was the average number of students who passed per year?', '391 ÷ 5 = 78.2.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '77', false, 1), ('B', '78.2', true, 2), ('C', '75', false, 3), ('D', '80', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'ཚིག་ཚན་འདི་ལྷག་སྟེ་ དྲི་བ་ལུ་ལན་བྲིས།

(Read the passage and answer the question.)

དཀར་མོ་ སྤ་རོ་ལུ་ སྡོདཔ་ཨིན། ཁོ་མོའི་ཁྱིམ་ནང་ མི་ལྔ་ཡོད། ཁོ་མོའི་ཨ་པ་ ཞིང་པ་ཨིན། ཁོ་མོའི་ཨ་མ་ སློབ་དཔོན་ཨིན། དཀར་མོ་ འཛིན་རིམ་བཅུ་པ་ནང་ སློབ་སྦྱོང་འབདཝ་ཨིན། ཁོ་མོ་ ཤུལ་མ་ སྨན་པ་ཅིག་ འབད་ནི་མནོཝ་ཨིན།

དཀར་མོ་ ག་ཏེ་ སྡོདཔ་སྨོ?

(Where does Karmo live?)', 'The passage says Karmo lives in Paro (སྤ་རོ).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'comprehension'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Read the passage and the question in the picture%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b4-dzongkha', 1)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'སྤུ་ན་ཁ', false, 1), ('B', 'བུམ་ཐང', false, 2), ('C', 'སྤ་རོ', true, 3), ('D', 'ཐིམ་ཕུ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'ཚིག་ཚན་འདི་ལྷག་སྟེ་ དྲི་བ་ལུ་ལན་བྲིས།

(Read the passage and answer the question.)

དཀར་མོ་ སྤ་རོ་ལུ་ སྡོདཔ་ཨིན། ཁོ་མོའི་ཁྱིམ་ནང་ མི་ལྔ་ཡོད། ཁོ་མོའི་ཨ་པ་ ཞིང་པ་ཨིན། ཁོ་མོའི་ཨ་མ་ སློབ་དཔོན་ཨིན། དཀར་མོ་ འཛིན་རིམ་བཅུ་པ་ནང་ སློབ་སྦྱོང་འབདཝ་ཨིན། ཁོ་མོ་ ཤུལ་མ་ སྨན་པ་ཅིག་ འབད་ནི་མནོཝ་ཨིན།

དཀར་མོའི་ཁྱིམ་ནང་ མི་ ག་དེམ་ཅིག་ཡོད་ག?

(How many people are in Karmo''s house?)', 'The passage says five people (མི་ལྔ).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'comprehension'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Read the passage and the question in the picture%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b4-dzongkha', 2)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གསུམ', false, 1), ('B', 'བཞི', false, 2), ('C', 'དྲུག', false, 3), ('D', 'ལྔ', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'ཚིག་ཚན་འདི་ལྷག་སྟེ་ དྲི་བ་ལུ་ལན་བྲིས།

(Read the passage and answer the question.)

དཀར་མོ་ སྤ་རོ་ལུ་ སྡོདཔ་ཨིན། ཁོ་མོའི་ཁྱིམ་ནང་ མི་ལྔ་ཡོད། ཁོ་མོའི་ཨ་པ་ ཞིང་པ་ཨིན། ཁོ་མོའི་ཨ་མ་ སློབ་དཔོན་ཨིན། དཀར་མོ་ འཛིན་རིམ་བཅུ་པ་ནང་ སློབ་སྦྱོང་འབདཝ་ཨིན། ཁོ་མོ་ ཤུལ་མ་ སྨན་པ་ཅིག་ འབད་ནི་མནོཝ་ཨིན།

དཀར་མོའི་ཨ་པ་ ལཱ་ ག་ཅི་ འབདཝ་སྨོ?

(What is Karmo''s father''s work?)', 'Her father is a farmer (ཞིང་པ).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'comprehension'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Read the passage and the question in the picture%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b4-dzongkha', 3)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཞིང་པ', true, 1), ('B', 'སློབ་དཔོན', false, 2), ('C', 'སྨན་པ', false, 3), ('D', 'ཚོང་པ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'ཚིག་ཚན་འདི་ལྷག་སྟེ་ དྲི་བ་ལུ་ལན་བྲིས།

(Read the passage and answer the question.)

དཀར་མོ་ སྤ་རོ་ལུ་ སྡོདཔ་ཨིན། ཁོ་མོའི་ཁྱིམ་ནང་ མི་ལྔ་ཡོད། ཁོ་མོའི་ཨ་པ་ ཞིང་པ་ཨིན། ཁོ་མོའི་ཨ་མ་ སློབ་དཔོན་ཨིན། དཀར་མོ་ འཛིན་རིམ་བཅུ་པ་ནང་ སློབ་སྦྱོང་འབདཝ་ཨིན། ཁོ་མོ་ ཤུལ་མ་ སྨན་པ་ཅིག་ འབད་ནི་མནོཝ་ཨིན།

དཀར་མོ་ འཛིན་རིམ་ ག་དེམ་ཅིག་ནང་ ཨིན་ན?

(Which class is Karmo in?)', 'She studies in class ten (འཛིན་རིམ་བཅུ་པ).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'comprehension'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Read the passage and the question in the picture%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b4-dzongkha', 4)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'བརྒྱད་པ', false, 1), ('B', 'བཅུ་པ', true, 2), ('C', 'དགུ་པ', false, 3), ('D', 'བཅུ་གཅིག་པ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'ཚིག་ཚན་འདི་ལྷག་སྟེ་ དྲི་བ་ལུ་ལན་བྲིས།

(Read the passage and answer the question.)

དཀར་མོ་ སྤ་རོ་ལུ་ སྡོདཔ་ཨིན། ཁོ་མོའི་ཁྱིམ་ནང་ མི་ལྔ་ཡོད། ཁོ་མོའི་ཨ་པ་ ཞིང་པ་ཨིན། ཁོ་མོའི་ཨ་མ་ སློབ་དཔོན་ཨིན། དཀར་མོ་ འཛིན་རིམ་བཅུ་པ་ནང་ སློབ་སྦྱོང་འབདཝ་ཨིན། ཁོ་མོ་ ཤུལ་མ་ སྨན་པ་ཅིག་ འབད་ནི་མནོཝ་ཨིན།

དཀར་མོ་ ཤུལ་མ་ ག་ཅི་ འབད་ནི་ མནོཝ་ཨིན་ན?

(What does Karmo want to become?)', 'She wants to become a doctor (སྨན་པ).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'comprehension'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Read the passage and the question in the picture%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b4-dzongkha', 5)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཞིང་པ', false, 1), ('B', 'དྲུང་ཆེན', false, 2), ('C', 'སྨན་པ', true, 3), ('D', 'སློབ་དཔོན', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“ཁ་མཐུན” ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ ག་ཅི་སྨོ?

(Which is the honorific form of “ཁ་མཐུན”?)', '“ཁ་མཐུན” means agreement; its honorific (ཞེ་ས) is “ཞལ་མཐུན”. Source: DDC Dzongkha–English Dictionary, p. 59.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཕྱག་མཐུན', false, 1), ('B', 'སྐུ་མཐུན', false, 2), ('C', 'དབུ་མཐུན', false, 3), ('D', 'ཞལ་མཐུན', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“གེགས” ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ ག་ཅི་སྨོ?

(Which is the honorific form of “གེགས”?)', '“གེགས” means obstacle, hindrance; its honorific (ཞེ་ས) is “སྐུ་གེགས”. Source: DDC Dzongkha–English Dictionary, p. 109.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'སྐུ་གེགས', true, 1), ('B', 'ཞལ་གེགས', false, 2), ('C', 'ཕྱག་གེགས', false, 3), ('D', 'དབུ་གེགས', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“མི་ཚེ་གང” ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ ག་ཅི་སྨོ?

(Which is the honorific form of “མི་ཚེ་གང”?)', '“མི་ཚེ་གང” means lifetime; its honorific (ཞེ་ས) is “སྐུ་རིང”. Source: DDC Dzongkha–English Dictionary, p. 680.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དབུ་རིང', false, 1), ('B', 'སྐུ་རིང', true, 2), ('C', 'ཞལ་རིང', false, 3), ('D', 'ཕྱག་རིང', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“མི་སེར” ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ ག་ཅི་སྨོ?

(Which is the honorific form of “མི་སེར”?)', '“མི་སེར” means citizen, subject; its honorific (ཞེ་ས) is “ཆབ་འབངས”. Source: DDC Dzongkha–English Dictionary, p. 683.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཞལ་འབངས', false, 1), ('B', 'ཕྱག་འབངས', false, 2), ('C', 'ཆབ་འབངས', true, 3), ('D', 'སྐུ་འབངས', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“སྒེར” ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ ག་ཅི་སྨོ?

(Which is the honorific form of “སྒེར”?)', '“སྒེར” means private, personal; its honorific (ཞེ་ས) is “སྐུ་སྒེར”. Source: DDC Dzongkha–English Dictionary, p. 185.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཞལ་སྒེར', false, 1), ('B', 'ཕྱག་སྒེར', false, 2), ('C', 'དབུ་སྒེར', false, 3), ('D', 'སྐུ་སྒེར', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“སྐྱེས་སྐར” ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ ག་ཅི་སྨོ?

(Which is the honorific form of “སྐྱེས་སྐར”?)', '“སྐྱེས་སྐར” means birth star; its honorific (ཞེ་ས) is “འཁྲུངས་སྐར”. Source: DDC Dzongkha–English Dictionary, p. 45.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'འཁྲུངས་སྐར', true, 1), ('B', 'སྐུ་སྐར', false, 2), ('C', 'ཞལ་སྐར', false, 3), ('D', 'ཕྱག་སྐར', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“འགོ་འདྲེན” ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ ག་ཅི་སྨོ?

(Which is the honorific form of “འགོ་འདྲེན”?)', '“འགོ་འདྲེན” means leadership; its honorific (ཞེ་ས) is “དབུ་འདྲེན”. Source: DDC Dzongkha–English Dictionary, p. 155.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'སྐུ་འདྲེན', false, 1), ('B', 'དབུ་འདྲེན', true, 2), ('C', 'ཞལ་འདྲེན', false, 3), ('D', 'ཕྱག་འདྲེན', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“ཚོགས་ཁང” ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ ག་ཅི་སྨོ?

(Which is the honorific form of “ཚོགས་ཁང”?)', '“ཚོགས་ཁང” means assembly hall; its honorific (ཞེ་ས) is “ཞལ་འཛོམས་ཁང”. Source: DDC Dzongkha–English Dictionary, p. 767.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཕྱག་འཛོམས་ཁང', false, 1), ('B', 'དབུ་འཛོམས་ཁང', false, 2), ('C', 'ཞལ་འཛོམས་ཁང', true, 3), ('D', 'སྐུ་འཛོམས་ཁང', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“ག་ར” ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ ག་ཅི་སྨོ?

(Which word is the opposite of “ག་ར”?)', '“ག་ར” and “ལ་ལུ” are opposites (all / some). Source: DDC Dzongkha–English Dictionary, p. 104.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཆ་མཉམ', false, 1), ('B', 'ཡོངས་རྫོགས', false, 2), ('C', 'ཧྲིལ་བུ', false, 3), ('D', 'ལ་ལུ', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“གྱང” ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ ག་ཅི་སྨོ?

(Which word is the opposite of “གྱང”?)', '“གྱང” and “དྲོ” are opposites (cold / warm). Source: DDC Dzongkha–English Dictionary, p. 116.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དྲོ', true, 1), ('B', 'གྲང', false, 2), ('C', 'ཁྱགས', false, 3), ('D', 'བསིལ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“ངག་བརྗོད” ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ ག་ཅི་སྨོ?

(Which word is the opposite of “ངག་བརྗོད”?)', '“ངག་བརྗོད” and “ཡིག་ཐོག” are opposites (oral / written). Source: DDC Dzongkha–English Dictionary, p. 201.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'སྐད་ཐོག', false, 1), ('B', 'ཡིག་ཐོག', true, 2), ('C', 'ཁ་ཐོག', false, 3), ('D', 'གསུང་ཐོག', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“མངོན་གྱུར” ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ ག་ཅི་སྨོ?

(Which word is the opposite of “མངོན་གྱུར”?)', '“མངོན་གྱུར” and “ལྐོག་གྱུར” are opposites (visible, manifest / hidden). Source: DDC Dzongkha–English Dictionary, p. 219.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཕྱི་གྱུར', false, 1), ('B', 'ཐོན་གྱུར', false, 2), ('C', 'ལྐོག་གྱུར', true, 3), ('D', 'གསལ་གྱུར', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“གཏོར” ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ ག་ཅི་སྨོ?

(Which word is the opposite of “གཏོར”?)', '“གཏོར” and “སྤུང” are opposites (scatter / gather into a pile). Source: DDC Dzongkha–English Dictionary, p. 325.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཐོར', false, 1), ('B', 'བཀྲམ', false, 2), ('C', 'གཡུགས', false, 3), ('D', 'སྤུང', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“བསྟེན” ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ ག་ཅི་སྨོ?

(Which word is the opposite of “བསྟེན”?)', '“བསྟེན” and “སྤང” are opposites (adopt, rely on / give up). Source: DDC Dzongkha–English Dictionary, p. 347.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'སྤང', true, 1), ('B', 'བཟུང', false, 2), ('C', 'ལེན', false, 3), ('D', 'བསྐྱེད', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“བདེ་བ” ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ ག་ཅི་སྨོ?

(Which word is the opposite of “བདེ་བ”?)', '“བདེ་བ” and “སྡུག་བསྔལ” are opposites (happiness / suffering). Source: DDC Dzongkha–English Dictionary, p. 439.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཞི་བ', false, 1), ('B', 'སྡུག་བསྔལ', true, 2), ('C', 'སྐྱིད་པ', false, 3), ('D', 'དགའ་བ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“འབོལ་དྲགས” ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ ག་ཅི་སྨོ?

(Which word is the opposite of “འབོལ་དྲགས”?)', '“འབོལ་དྲགས” and “དཀོན་དྲགས” are opposites (plentiful / scarce). Source: DDC Dzongkha–English Dictionary, p. 642.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ལངམ་དྲགས', false, 1), ('B', 'ཡོད་དྲགས', false, 2), ('C', 'དཀོན་དྲགས', true, 3), ('D', 'མང་དྲགས', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“མ་རིག་པ” ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ ག་ཅི་སྨོ?

(Which word is the opposite of “མ་རིག་པ”?)', '“མ་རིག་པ” and “རིག་པ” are opposites (ignorance / knowledge). Source: DDC Dzongkha–English Dictionary, p. 669.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'མི་ཤེས་པ', false, 1), ('B', 'བླུན་པོ', false, 2), ('C', 'གཏི་མུག', false, 3), ('D', 'རིག་པ', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does the Dzongkha word “ཞིང་པ” mean?

(“ཞིང་པ” ཟེར་བའི་ཚིག་གི་ དོན་ ག་ཅི་སྨོ?)', '“ཞིང་པ” means farmer. Source: DDC Dzongkha–English Dictionary.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Farmer', true, 1), ('B', 'Teacher', false, 2), ('C', 'Trader', false, 3), ('D', 'Doctor', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does the Dzongkha word “སློབ་དཔོན” mean?

(“སློབ་དཔོན” ཟེར་བའི་ཚིག་གི་ དོན་ ག་ཅི་སྨོ?)', '“སློབ་དཔོན” means teacher. Source: DDC Dzongkha–English Dictionary.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Farmer', false, 1), ('B', 'Teacher', true, 2), ('C', 'Student', false, 3), ('D', 'Monk', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does the Dzongkha word “སྨན་པ” mean?

(“སྨན་པ” ཟེར་བའི་ཚིག་གི་ དོན་ ག་ཅི་སྨོ?)', '“སྨན་པ” means doctor. Source: DDC Dzongkha–English Dictionary.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Teacher', false, 1), ('B', 'Farmer', false, 2), ('C', 'Doctor', true, 3), ('D', 'Nurse', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does the Dzongkha word “རྣ་བ” mean?

(“རྣ་བ” ཟེར་བའི་ཚིག་གི་ དོན་ ག་ཅི་སྨོ?)', '“རྣ་བ” means ear. Source: DDC Dzongkha–English Dictionary.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Eye', false, 1), ('B', 'Nose', false, 2), ('C', 'Mouth', false, 3), ('D', 'Ear', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does the Dzongkha word “ཉིནམ” mean?

(“ཉིནམ” ཟེར་བའི་ཚིག་གི་ དོན་ ག་ཅི་སྨོ?)', '“ཉིནམ” means day. Source: DDC Dzongkha–English Dictionary.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Day', true, 1), ('B', 'Night', false, 2), ('C', 'Week', false, 3), ('D', 'Month', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does the Dzongkha word “ལྕི་བ” mean?

(“ལྕི་བ” ཟེར་བའི་ཚིག་གི་ དོན་ ག་ཅི་སྨོ?)', '“ལྕི་བ” means heavy. Source: DDC Dzongkha–English Dictionary.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Hot', false, 1), ('B', 'Heavy', true, 2), ('C', 'Light', false, 3), ('D', 'Long', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does the Dzongkha word “གླིང་ཆེན” mean?

(“གླིང་ཆེན” ཟེར་བའི་ཚིག་གི་ དོན་ ག་ཅི་སྨོ?)', '“གླིང་ཆེན” means continent. Source: DDC Dzongkha–English Dictionary.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Mountain', false, 1), ('B', 'Ocean', false, 2), ('C', 'Continent', true, 3), ('D', 'Island', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does the Dzongkha word “སྐམ་ཞིང” mean?

(“སྐམ་ཞིང” ཟེར་བའི་ཚིག་གི་ དོན་ ག་ཅི་སྨོ?)', '“སྐམ་ཞིང” means dry land (dry field). Source: DDC Dzongkha–English Dictionary.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-4"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Paddy field', false, 1), ('B', 'Forest', false, 2), ('C', 'Riverbank', false, 3), ('D', 'Dry land (dry field)', true, 4)) as v(label, body, ok, pos);

commit;
