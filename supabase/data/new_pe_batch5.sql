-- Claude-written PE practice questions, loaded as drafts (awaiting review) for /admin/ai/review.

begin;

insert into public.topics (subject_id, slug, name) select id, 'bar-charts', 'Bar charts' from public.subjects where slug = 'data-interpretation' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'line-and-scatter-charts', 'Line and scatter charts' from public.subjects where slug = 'data-interpretation' on conflict (subject_id, slug) do nothing;

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

insert into public.topics (subject_id, slug, name) select id, 'odd-one-out', 'Odd one out' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'ordering-and-ranking', 'Ordering and ranking' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'percentages', 'Percentages' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'quantitative-comparison', 'Quantitative comparison' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'rates-and-cost', 'Rates and cost' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'ratio-and-proportion', 'Ratio and proportion' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'time-and-calendars', 'Time and calendars' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

insert into public.topics (subject_id, slug, name) select id, 'word-puzzles', 'Word puzzles' from public.subjects where slug = 'logic-analytical-problem-solving' on conflict (subject_id, slug) do nothing;

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Read the passage and answer the question.

Imagine a school canteen where nothing on the menu has changed, yet students begin choosing more fruit and fewer fried snacks. The only difference is where the food is placed: the fruit now sits at eye level near the till, while the snacks have moved to a lower shelf at the back. Nobody has been told what to eat, and every choice is still free.

Economists who study behaviour call this kind of arrangement a “nudge”. Their argument is that people rarely make decisions in a vacuum; the way options are presented — what comes first, what is easiest to reach, what happens if we do nothing — quietly shapes what we choose. A form that enrols workers in a savings plan unless they opt out, for example, produces far more savers than one that asks them to opt in, although the choice is identical.

Critics worry that nudges can be used to manipulate people. Supporters reply that some arrangement is unavoidable: food must be placed somewhere, and a form must have a default. The real question, they say, is whether those who design choices do so openly and in people’s own interest.

Why did the students in the canteen choose more fruit?', 'Only the placement changed: fruit at eye level near the till, snacks on a lower shelf at the back.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'comprehension'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Read the passage and answer the question.%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b5-english', 1)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'The fruit was placed where it was easiest to see and reach', true, 1), ('B', 'The fruit became cheaper', false, 2), ('C', 'Teachers told them to eat fruit', false, 3), ('D', 'Fried snacks were banned', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Read the passage and answer the question.

Imagine a school canteen where nothing on the menu has changed, yet students begin choosing more fruit and fewer fried snacks. The only difference is where the food is placed: the fruit now sits at eye level near the till, while the snacks have moved to a lower shelf at the back. Nobody has been told what to eat, and every choice is still free.

Economists who study behaviour call this kind of arrangement a “nudge”. Their argument is that people rarely make decisions in a vacuum; the way options are presented — what comes first, what is easiest to reach, what happens if we do nothing — quietly shapes what we choose. A form that enrols workers in a savings plan unless they opt out, for example, produces far more savers than one that asks them to opt in, although the choice is identical.

Critics worry that nudges can be used to manipulate people. Supporters reply that some arrangement is unavoidable: food must be placed somewhere, and a form must have a default. The real question, they say, is whether those who design choices do so openly and in people’s own interest.

According to the passage, a “nudge” is', 'Nobody was told what to eat and “every choice is still free”, yet the arrangement shaped choices.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'comprehension'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Read the passage and answer the question.%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b5-english', 2)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'a rule that forbids certain choices', false, 1), ('B', 'a tax on unhealthy food', false, 2), ('C', 'a reward for making healthy choices', false, 3), ('D', 'a way of presenting choices that influences decisions without removing any option', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Read the passage and answer the question.

Imagine a school canteen where nothing on the menu has changed, yet students begin choosing more fruit and fewer fried snacks. The only difference is where the food is placed: the fruit now sits at eye level near the till, while the snacks have moved to a lower shelf at the back. Nobody has been told what to eat, and every choice is still free.

Economists who study behaviour call this kind of arrangement a “nudge”. Their argument is that people rarely make decisions in a vacuum; the way options are presented — what comes first, what is easiest to reach, what happens if we do nothing — quietly shapes what we choose. A form that enrols workers in a savings plan unless they opt out, for example, produces far more savers than one that asks them to opt in, although the choice is identical.

Critics worry that nudges can be used to manipulate people. Supporters reply that some arrangement is unavoidable: food must be placed somewhere, and a form must have a default. The real question, they say, is whether those who design choices do so openly and in people’s own interest.

The phrase “in a vacuum” in the second paragraph most nearly means', 'Deciding “in a vacuum” means deciding without being affected by surroundings or context.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'comprehension'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Read the passage and answer the question.%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b5-english', 3)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'without any surrounding influence', true, 1), ('B', 'very quickly', false, 2), ('C', 'in an empty room', false, 3), ('D', 'under pressure', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Read the passage and answer the question.

Imagine a school canteen where nothing on the menu has changed, yet students begin choosing more fruit and fewer fried snacks. The only difference is where the food is placed: the fruit now sits at eye level near the till, while the snacks have moved to a lower shelf at the back. Nobody has been told what to eat, and every choice is still free.

Economists who study behaviour call this kind of arrangement a “nudge”. Their argument is that people rarely make decisions in a vacuum; the way options are presented — what comes first, what is easiest to reach, what happens if we do nothing — quietly shapes what we choose. A form that enrols workers in a savings plan unless they opt out, for example, produces far more savers than one that asks them to opt in, although the choice is identical.

Critics worry that nudges can be used to manipulate people. Supporters reply that some arrangement is unavoidable: food must be placed somewhere, and a form must have a default. The real question, they say, is whether those who design choices do so openly and in people’s own interest.

Why does the savings-plan form that enrols workers automatically produce more savers?', 'The choice is identical; the difference is the default, which most people do not change.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'comprehension'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Read the passage and answer the question.%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b5-english', 4)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'It offers higher interest', false, 1), ('B', 'It is shorter', false, 2), ('C', 'Many people keep whatever happens if they do nothing', true, 3), ('D', 'It removes the choice to opt out', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Read the passage and answer the question.

Imagine a school canteen where nothing on the menu has changed, yet students begin choosing more fruit and fewer fried snacks. The only difference is where the food is placed: the fruit now sits at eye level near the till, while the snacks have moved to a lower shelf at the back. Nobody has been told what to eat, and every choice is still free.

Economists who study behaviour call this kind of arrangement a “nudge”. Their argument is that people rarely make decisions in a vacuum; the way options are presented — what comes first, what is easiest to reach, what happens if we do nothing — quietly shapes what we choose. A form that enrols workers in a savings plan unless they opt out, for example, produces far more savers than one that asks them to opt in, although the choice is identical.

Critics worry that nudges can be used to manipulate people. Supporters reply that some arrangement is unavoidable: food must be placed somewhere, and a form must have a default. The real question, they say, is whether those who design choices do so openly and in people’s own interest.

What is the supporters’ main reply to the critics?', '“Some arrangement is unavoidable… the real question is whether those who design choices do so openly and in people’s own interest.”', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'comprehension'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Read the passage and answer the question.%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b5-english', 5)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Critics do not understand economics', false, 1), ('B', 'People should not be given any choices', false, 2), ('C', 'Some arrangement of choices cannot be avoided, so it should be designed openly and in people’s interest', true, 3), ('D', 'Nudges are never used to manipulate people', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase that correctly completes the sentence.

The new director insisted ______ checking every file herself.', 'The verb “insist” is followed by “on” + -ing.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Choose the word or phrase that correctly completes the sentence.

The government%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'at', false, 1), ('B', 'to', false, 2), ('C', 'on', true, 3), ('D', 'for', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase that correctly completes the sentence.

She is one of those officers who ______ always on time.', '“Who” refers to “those officers” (plural), so the verb is “are”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'advanced', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Choose the word or phrase that will correctly complete the sentence.

I asked the children%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'is', false, 1), ('B', 'has been', false, 2), ('C', 'are', true, 3), ('D', 'was', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase that correctly completes the sentence.

I would rather you ______ the report today than tomorrow.', 'After “would rather + another subject”, the past form is used for a present or future wish: “I would rather you submitted…”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'advanced', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'submit', false, 1), ('B', 'had been submitting', false, 2), ('C', 'will submit', false, 3), ('D', 'submitted', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase that correctly completes the sentence.

Had I known about the meeting, I ______ it.', 'This is a third conditional with inversion: “Had I known…, I would have attended”.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Choose the word or phrase that will correctly complete the sentence.

The poverty rates%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'will attend', false, 1), ('B', 'would have attended', true, 2), ('C', 'attended', false, 3), ('D', 'would attend', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase that correctly completes the sentence.

Not only the students but also the teacher ______ present at the ceremony.', 'With “not only … but also”, the verb agrees with the nearer subject, “the teacher” (singular).', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'were', false, 1), ('B', 'was', true, 2), ('C', 'have been', false, 3), ('D', 'are', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which sentence is grammatically correct?', 'When the members of a group act separately (divided opinions), the plural verb and “their” are used: “The jury were divided in their opinions.”', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'grammar'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'The jury were divided in its opinions.', false, 1), ('B', 'The jury were divided in their opinions.', true, 2), ('C', 'The jury is dividing in its opinion.', false, 3), ('D', 'The jury was divided in their opinions.', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following usages of the word “fortuitous” is correct?', 'Fortuitous means happening by chance.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which of the following usages of the word “tortuous” is correct?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'He made a fortuitous plan for the whole year.', false, 1), ('B', 'The fortuitous building had twelve floors.', false, 2), ('C', 'Their meeting in Paro was fortuitous; neither of them had planned it.', true, 3), ('D', 'She was fortuitous about her homework.', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following makes a correct distinction between “complement” and “compliment”?', 'A good sauce complements a dish; you pay someone a compliment.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Which of the following makes a correct distinction between “adverse” and “averse”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Complement is a verb only; compliment is a noun only.', false, 1), ('B', 'A complement completes something; a compliment is a remark of praise.', true, 2), ('C', 'A compliment completes something; a complement is a remark of praise.', false, 3), ('D', 'They mean the same thing.', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following makes a correct distinction between “stationary” and “stationery”?', 'A stationary bus is standing still; pens and paper are stationery.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which of the following makes a correct distinction between the words “aggravate” and “irritate”%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Both mean not moving.', false, 1), ('B', 'Stationery means not moving; stationary means writing materials.', false, 2), ('C', 'Stationary means not moving; stationery means writing materials.', true, 3), ('D', 'Both mean writing materials.', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does “philatelist” mean?', 'A philatelist collects and studies postage stamps (a coin collector is a numismatist).', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'What does “equestrian” mean?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'A person who collects stamps', true, 1), ('B', 'A person who collects coins', false, 2), ('C', 'A lover of music', false, 3), ('D', 'A person who studies plants', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does “altruistic” mean?', 'An altruistic person helps others without expecting anything in return.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'What does “equestrian” mean?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Showing unselfish concern for others', true, 1), ('B', 'Easily angered', false, 2), ('C', 'Fond of travelling', false, 3), ('D', 'Very ambitious', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase that correctly completes the sentence.

The government took ______ measures to stop the disease from spreading.', 'Stringent means strict and precise; the situation needs strict measures.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Choose the word that correctly completes the sentence.

The geographical terrain%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'casual', false, 1), ('B', 'lenient', false, 2), ('C', 'stringent', true, 3), ('D', 'frivolous', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase that correctly completes the sentence.

His explanation was so ______ that nobody in the room could follow it.', 'Convoluted means extremely complicated and difficult to follow.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'vocabulary'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Choose the word that will correctly complete the sentence.

Cultivation is%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'convoluted', true, 1), ('B', 'concise', false, 2), ('C', 'lucid', false, 3), ('D', 'simple', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase closest in meaning to the word in capitals.

New irrigation channels will AMELIORATE the problems of the farmers.', 'To ameliorate is to make something better.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Choose the word closest in meaning to the word in capitals.%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'hide', false, 1), ('B', 'create', false, 2), ('C', 'improve', true, 3), ('D', 'worsen', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase closest in meaning to the word in capitals.

He gave a PERFUNCTORY answer and left the room.', 'Perfunctory means done without care or interest, as a duty.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Choose the word closest in meaning to the word in capitals.%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'detailed', false, 1), ('B', 'thoughtful', false, 2), ('C', 'hasty and careless', true, 3), ('D', 'angry', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Choose the word or phrase closest in meaning to the word in capitals.

The storm began to ABATE by the evening.', 'To abate is to become less intense.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Choose the word closest in meaning to the word in capitals.%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'begin', false, 1), ('B', 'return', false, 2), ('C', 'strengthen', false, 3), ('D', 'lessen', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following words has the same meaning as “lucrative”?', 'A lucrative job or business makes a lot of money.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which of the following words has the same meaning as “disparage”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'dangerous', false, 1), ('B', 'profitable', true, 2), ('C', 'temporary', false, 3), ('D', 'boring', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following words has the same meaning as “dearth”?', 'A dearth is a lack or scarcity of something.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which of the following words has the same meaning as “disparage”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'shortage', true, 1), ('B', 'delay', false, 2), ('C', 'death', false, 3), ('D', 'plenty', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following words has the same meaning as “candour”?', 'Candour is the quality of being open and honest.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'synonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which of the following words has the same meaning as “disparage”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'kindness', false, 1), ('B', 'pride', false, 2), ('C', 'frankness', true, 3), ('D', 'fear', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following words has the opposite meaning of “zenith”?', 'The zenith is the highest point; the nadir is the lowest.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Which of the following words has the opposite meaning of “presumptuous”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'nadir', true, 1), ('B', 'peak', false, 2), ('C', 'summit', false, 3), ('D', 'climax', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following words has the opposite meaning of “prolific”?', 'Prolific means producing a lot.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Which of the following words has the opposite meaning of “presumptuous”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'abundant', false, 1), ('B', 'creative', false, 2), ('C', 'fruitful', false, 3), ('D', 'unproductive', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following words has the opposite meaning of “austere”?', 'Austere means very plain and simple; luxurious is the opposite.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Which of the following words has the opposite meaning of “presumptuous”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'strict', false, 1), ('B', 'severe', false, 2), ('C', 'luxurious', true, 3), ('D', 'plain', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following words has the opposite meaning of “magnanimous”?', 'Magnanimous means generous and forgiving; petty means small-minded.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Which of the following words has the opposite meaning of “presumptuous”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'petty', true, 1), ('B', 'noble', false, 2), ('C', 'forgiving', false, 3), ('D', 'generous', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following words has the opposite meaning of “nebulous”?', 'Nebulous means unclear or vague.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Which of the following words has the opposite meaning of “presumptuous”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'cloudy', false, 1), ('B', 'vague', false, 2), ('C', 'clear', true, 3), ('D', 'hazy', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following words has the opposite meaning of “gregarious”?', 'Gregarious means fond of company.', (select id from public.subjects where slug = 'english-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'english-communication' and t.slug = 'antonyms'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Which of the following words has the opposite meaning of “presumptuous”?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'unsociable', true, 1), ('B', 'friendly', false, 2), ('C', 'sociable', false, 3), ('D', 'outgoing', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'In a queue, Pema is 8th from the front and 13th from the back. How many people are in the queue?', '8 + 13 − 1 = 20 (Pema is counted twice).', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'ordering-and-ranking'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'In a horse race%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '19', false, 1), ('B', '22', false, 2), ('C', '21', false, 3), ('D', '20', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Dorji is heavier than Sonam. Tashi is lighter than Sonam but heavier than Pema. Who is the lightest?', 'Dorji > Sonam > Tashi > Pema.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'ordering-and-ranking'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Karma is heavier than Sonam%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Tashi', false, 1), ('B', 'Dorji', false, 2), ('C', 'Pema', true, 3), ('D', 'Sonam', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Four friends sit in a row. Dawa is at the left end. Chimi sits between Dawa and Ap. Bumpa sits to the right of Ap. Who is at the right end?', 'Left to right: Dawa, Chimi, Ap, Bumpa.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'ordering-and-ranking'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Four defenders, A, B, C and D%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Dawa', false, 1), ('B', 'Ap', false, 2), ('C', 'Chimi', false, 3), ('D', 'Bumpa', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of these places is the odd one out?', 'Paro, Punakha and Haa are dzongkhags; Phuentsholing is a town (in Chhukha Dzongkhag).', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'odd-one-out'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which letter combination is the odd one out?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Punakha', false, 1), ('B', 'Haa', false, 2), ('C', 'Paro', false, 3), ('D', 'Phuentsholing', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'A jacket marked at Nu. 1,200 is sold at a 15% discount. What is the selling price?', '15% of 1,200 = 180; 1,200 − 180 = Nu. 1,020.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'percentages'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 1,185', false, 1), ('B', 'Nu. 1,020', true, 2), ('C', 'Nu. 1,050', false, 3), ('D', 'Nu. 1,080', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '15% of a number is 45. What is the number?', '45 ÷ 0.15 = 300.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'percentages'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like '3 is 80\% of what number?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '250', false, 1), ('B', '300', true, 2), ('C', '450', false, 3), ('D', '675', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'The population of a village rose from 800 to 920. What is the percentage increase?', 'Increase = 120; 120 ÷ 800 × 100 = 15%.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'percentages'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'The value of a company share drops%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '13%', false, 1), ('B', '15%', true, 2), ('C', '120%', false, 3), ('D', '12%', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Find the simple interest on Nu. 12,000 at 10% per year for 2½ years.', '12,000 × 10 × 2.5 ÷ 100 = Nu. 3,000.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'rates-and-cost'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 3,000', true, 1), ('B', 'Nu. 2,500', false, 2), ('C', 'Nu. 3,600', false, 3), ('D', 'Nu. 2,400', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'The average age of 6 students is 15 years. When their teacher joins them, the average becomes 16 years. How old is the teacher?', '7 × 16 − 6 × 15 = 112 − 90 = 22.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'averages'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'The average age of a group of 5 students%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '21', false, 1), ('B', '22', true, 2), ('C', '16', false, 3), ('D', '25', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Dema needs 3/4 cup of flour for bread and 2/3 cup for a cake. She has 1½ cups. Which is true?', '3/4 + 2/3 = 17/12 cups; 1½ = 18/12, so 1/12 cup is left.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'fractions'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Dema needs to bake a cake%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'She has exactly enough', false, 1), ('B', 'She is short by 1/12 cup', false, 2), ('C', 'She is short by 1/6 cup', false, 3), ('D', 'She has enough, with 1/12 cup left over', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What is 2/5 of 3/4 of 400?', '3/4 of 400 = 300; 2/5 of 300 = 120.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'fractions'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'What is 1/4 of half of 1/5 of 200?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '150', false, 1), ('B', '300', false, 2), ('C', '120', true, 3), ('D', '160', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Nu. 900 is shared among three friends in the ratio 2 : 3 : 4. How much does the third friend get?', '900 ÷ 9 = 100 per part; 4 × 100 = Nu. 400.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'ratio-and-proportion'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'There are 24 students in a class%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 300', false, 1), ('B', 'Nu. 400', true, 2), ('C', 'Nu. 360', false, 3), ('D', 'Nu. 450', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which number comes next in the series?

4, 9, 19, 39, 79, ?', 'Each term is doubled and 1 is added: 79 × 2 + 1 = 159.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'number-series'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which number comes next in the series?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '160', false, 1), ('B', '119', false, 2), ('C', '158', false, 3), ('D', '159', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which number comes next in the series?

3, 6, 11, 18, 27, ?', 'The differences are 3, 5, 7, 9, so the next is 11: 27 + 11 = 38.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'number-series'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which number comes next in the series?%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '38', true, 1), ('B', '39', false, 2), ('C', '37', false, 3), ('D', '36', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'If:
2, 5 = 29
3, 4 = 25
6, 1 = 37
then 4, 3 = ?', 'Rule: square both numbers and add. 4 + 25 = 29, 9 + 16 = 25, 36 + 1 = 37, so 16 + 9 = 25.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'number-patterns'),
    'advanced', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'If:
2, 3 = 10%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '25', true, 1), ('B', '12', false, 2), ('C', '49', false, 3), ('D', '19', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which letter comes next in this series?

b  d  g  k  p  ?', 'The gaps grow by one: +2, +3, +4, +5, +6. p (16) + 6 = v (22).', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'letter-series'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'What is the missing letter in this series?

b  e  h%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'w', false, 1), ('B', 'v', true, 2), ('C', 'u', false, 3), ('D', 't', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which letter comes next in this series?

z  x  v  t  r  ?', 'The letters go back by two each time: r − 2 = p.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'letter-series'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'What is the missing letter in this series?

a  z  b%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'p', true, 1), ('B', 'q', false, 2), ('C', 's', false, 3), ('D', 'o', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which letter comes next in this series?

a  b  x  c  d  x  e  f  x  ?', 'Pairs of letters in order (ab, cd, ef) each followed by x; next is g.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'letter-series'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'What is the missing letter in this series?

g  ?  d%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'e', false, 1), ('B', 'h', false, 2), ('C', 'x', false, 3), ('D', 'g', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which choice makes the best comparison?

BHUTAN is to NATUHB as 724193 is to:', 'NATUHB is BHUTAN written backwards; 724193 backwards is 391427.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'analogies'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Which choice makes the best comparison?

PEACH%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '193724', false, 1), ('B', '391472', false, 2), ('C', '391427', true, 3), ('D', '724391', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which choice makes the best comparison?

Judge is to court as farmer is to:', 'A judge works in a court; a farmer works in a field.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'analogies'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Which choice makes the best comparison?

Fingers%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Field', true, 1), ('B', 'Crop', false, 2), ('C', 'Tractor', false, 3), ('D', 'Village', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'If you unscramble the letters ELPAP, you get the name of a:', 'ELPAP unscrambles to APPLE.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'word-puzzles'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'If you unscramble the letters YKANE%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Fruit', true, 1), ('B', 'Colour', false, 2), ('C', 'Country', false, 3), ('D', 'Animal', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'If you unscramble the letters ANHIC, you get the name of a:', 'ANHIC unscrambles to CHINA.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'word-puzzles'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'If you unscramble the letters ITNKA%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Bird', false, 1), ('B', 'River', false, 2), ('C', 'Fruit', false, 3), ('D', 'Country', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Eight people meet, and each person shakes hands once with every other person. How many handshakes are there?', '8 × 7 ÷ 2 = 28.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'counting'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Five teams from Thimphu%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '28', true, 1), ('B', '56', false, 2), ('C', '16', false, 3), ('D', '64', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'How many two-digit numbers can be made from the digits 1, 2, 3 and 4 if no digit is repeated?', '4 choices for the tens digit × 3 for the units digit = 12.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'counting'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'In how many ways can the letters of SOLVING%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '24', false, 1), ('B', '8', false, 2), ('C', '12', true, 3), ('D', '16', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'In a family, each son has as many brothers as sisters, and each daughter has twice as many brothers as sisters. How many sons and daughters are there?', 'With 4 sons and 3 daughters: a son has 3 brothers and 3 sisters; a daughter has 4 brothers and 2 sisters (twice as many).', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'logical-puzzles'),
    'advanced', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Pema Dorji and Kesang Choden are two children%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '4 sons and 3 daughters', true, 1), ('B', '3 sons and 3 daughters', false, 2), ('C', '5 sons and 2 daughters', false, 3), ('D', '3 sons and 4 daughters', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'All teachers in the school are graduates. Pema is a teacher in the school. Which statement must be true?', 'If every teacher there is a graduate and Pema is one of those teachers, Pema must be a graduate.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'logical-puzzles'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'All graduates are teachers.', false, 1), ('B', 'Pema is not a graduate.', false, 2), ('C', 'Pema is a graduate.', true, 3), ('D', 'Some teachers are not graduates.', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'From his house, Tashi walks 5 km east, then 3 km north, then 5 km west. Where is he now from his house?', 'The east and west walks cancel out, leaving 3 km north.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'directions'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which two statements are needed%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '5 km east', false, 1), ('B', '3 km north', true, 2), ('C', '8 km north-west', false, 3), ('D', '3 km south', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'A meeting starts at 10:45 AM and lasts 2 hours 35 minutes. When does it end?', '10:45 + 2 h = 12:45; + 35 min = 1:20 PM.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'time-and-calendars'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'I am a time of the day%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '1:10 PM', false, 1), ('B', '1:20 PM', true, 2), ('C', '1:30 PM', false, 3), ('D', '12:80 PM', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'If x < 0, compare Column A and Column B.

Column A: x²
Column B: x³', 'For a negative x, x² is positive and x³ is negative, so Column A is greater.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'quantitative-comparison'),
    'advanced', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'If y > 2, compare Column A and Column B.%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Column B is greater', false, 1), ('B', 'The two quantities are equal', false, 2), ('C', 'The relationship cannot be determined', false, 3), ('D', 'Column A is greater', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Which of the following best describes the difference between inflation and deflation?', 'Inflation means the general price level is rising; deflation means it is falling.', (select id from public.subjects where slug = 'logic-analytical-problem-solving'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'logic-analytical-problem-solving' and t.slug = 'general-awareness'),
    'standard', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2010 and stem like 'Which of the following best describes the difference between Gross Domestic Product%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Inflation is a fall in prices; deflation is a rise in prices.', false, 1), ('B', 'They are two names for the same thing.', false, 2), ('C', 'Inflation affects only food; deflation affects only fuel.', false, 3), ('D', 'Inflation is a general rise in prices; deflation is a general fall in prices.', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

Which dzongkhag sold fewer apples in 2023 than in 2022?', 'Thimphu fell from 25 to 20 tonnes; the others rose.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-apples.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Thimphu', true, 1), ('B', 'Paro', false, 2), ('C', 'Bumthang', false, 3), ('D', 'Haa', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

How many tonnes of apples did the four dzongkhags sell in 2023?', '46 + 20 + 21 + 36 = 123 tonnes.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-apples.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '110', false, 1), ('B', '128', false, 2), ('C', '118', false, 3), ('D', '123', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

Which dzongkhag had the largest percentage increase in apple sales?', 'Haa +40% (15→21), Bumthang +20%, Paro +15%; Thimphu fell.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-apples.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Paro', false, 1), ('B', 'Haa', true, 2), ('C', 'Bumthang', false, 3), ('D', 'Thimphu', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

What were the average apple sales per dzongkhag in 2022?', '(40 + 25 + 15 + 30) ÷ 4 = 110 ÷ 4 = 27.5 tonnes.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-apples.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '30 tonnes', false, 1), ('B', '27.5 tonnes', true, 2), ('C', '28.5 tonnes', false, 3), ('D', '25 tonnes', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

In 2023, how many more tonnes did Bumthang sell than Haa?', '36 − 21 = 15 tonnes.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-apples.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '9', false, 1), ('B', '15', true, 2), ('C', '16', false, 3), ('D', '6', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the line graph (illustrative figures) and answer the question.

How much warmer was Phuentsholing than Thimphu in March?', '22 − 10 = 12 °C.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'line-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-temperature.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '8 °C', false, 1), ('B', '22 °C', false, 2), ('C', '12 °C', true, 3), ('D', '10 °C', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the line graph (illustrative figures) and answer the question.

Between which two months did Thimphu’s temperature rise the most?', 'Rises: +2, +4, +3, +3, +2. February to March (+4) is the largest.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'line-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-temperature.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'January to February', false, 1), ('B', 'February to March', true, 2), ('C', 'March to April', false, 3), ('D', 'May to June', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the line graph (illustrative figures) and answer the question.

What was Phuentsholing’s average temperature over the six months (to one decimal place)?', '(16 + 18 + 22 + 25 + 27 + 28) ÷ 6 = 136 ÷ 6 ≈ 22.7 °C.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'line-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-temperature.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '22.7 °C', true, 1), ('B', '22.0 °C', false, 2), ('C', '23.5 °C', false, 3), ('D', '21.8 °C', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the line graph (illustrative figures) and answer the question.

In how many of the six months was Phuentsholing at least 10 °C warmer than Thimphu?', 'Differences: 12, 12, 12, 12, 11, 10. All six are at least 10 °C.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'line-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-temperature.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '3', false, 1), ('B', '4', false, 2), ('C', '6', true, 3), ('D', '5', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the line graph (illustrative figures) and answer the question.

Thimphu’s June temperature was how many times its January temperature?', '18 ÷ 4 = 4.5.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'line-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-temperature.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '3 times', false, 1), ('B', '14 times', false, 2), ('C', '4.5 times', true, 3), ('D', '4 times', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the pie chart and answer the question.

How many acres of the village are forest?', '40% of 400 = 160 acres.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'pie-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-landuse.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '40', false, 1), ('B', '200', false, 2), ('C', '140', false, 3), ('D', '160', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the pie chart and answer the question.

What angle at the centre does the Houses slice make?', '10% of 360° = 36°.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'pie-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-landuse.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '54°', false, 1), ('B', '10°', false, 2), ('C', '36°', true, 3), ('D', '40°', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the pie chart and answer the question.

How many more acres are farmland than pasture?', '35% − 15% = 20% of 400 = 80 acres.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'pie-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-landuse.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '80', true, 1), ('B', '20', false, 2), ('C', '60', false, 3), ('D', '100', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the pie chart and answer the question.

If a quarter of the forest is cleared, how many acres of forest remain?', 'Forest = 160 acres; a quarter is 40; 160 − 40 = 120 acres.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'pie-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-landuse.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '150', false, 1), ('B', '120', true, 2), ('C', '100', false, 3), ('D', '40', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the pie chart and answer the question.

What is the ratio of forest to houses?', '40% : 10% = 4 : 1.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'pie-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-landuse.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '4 : 1', true, 1), ('B', '1 : 4', false, 2), ('C', '2 : 1', false, 3), ('D', '8 : 1', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

How many students are there in the five colleges altogether?', '18 + 12 + 9 + 15 + 6 = 60 hundred = 6,000.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-colleges.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '6,600', false, 1), ('B', '600', false, 2), ('C', '6,000', true, 3), ('D', '5,400', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

What percentage of all the students are in College A?', '18 ÷ 60 × 100 = 30%.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-colleges.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '30%', true, 1), ('B', '36%', false, 2), ('C', '18%', false, 3), ('D', '25%', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

How many colleges have more than 1,000 students?', 'A (1,800), B (1,200) and D (1,500). C has 900 and E 600.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-colleges.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '5', false, 1), ('B', '4', false, 2), ('C', '3', true, 3), ('D', '2', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

What is the ratio of students in College A to College E?', '18 : 6 = 3 : 1.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-colleges.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '6 : 1', false, 1), ('B', '2 : 1', false, 2), ('C', '3 : 1', true, 3), ('D', '1 : 3', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the bar chart (illustrative figures) and answer the question.

How many more students does College B have than College C?', '(12 − 9) hundred = 300 students.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'bar-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-colleges.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '1,200', false, 1), ('B', '3', false, 2), ('C', '300', true, 3), ('D', '30', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the graph (illustrative figures) and answer the question.

What mark did a student who studied 4 hours a day get?', 'The point at 4 hours shows 63.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'line-and-scatter-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-study.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '60', false, 1), ('B', '55', false, 2), ('C', '63', true, 3), ('D', '70', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the graph (illustrative figures) and answer the question.

By how many marks did the score rise from 1 hour to 6 hours of study?', '78 − 40 = 38 marks.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'line-and-scatter-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-study.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '38', true, 1), ('B', '40', false, 2), ('C', '36', false, 3), ('D', '78', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the graph (illustrative figures) and answer the question.

On average, how many marks were gained for each extra hour of study (to one decimal place)?', '38 marks over 5 extra hours = 7.6.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'line-and-scatter-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-study.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '6.3', false, 1), ('B', '8.0', false, 2), ('C', '7.0', false, 3), ('D', '7.6', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the graph (illustrative figures) and answer the question.

What does the graph show about hours studied and marks?', 'The line rises steadily: a positive relationship.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'line-and-scatter-charts'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-study.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Marks stay the same', false, 1), ('B', 'There is no link', false, 2), ('C', 'More hours studied go with lower marks', false, 3), ('D', 'More hours studied go with higher marks', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'Study the graph (illustrative figures) and answer the question.

Estimate the mark for 3½ hours of study.', 'Halfway between 55 (3 h) and 63 (4 h) is 59.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'line-and-scatter-charts'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, '/papers/soma/b5-study.png',
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'About 65', false, 1), ('B', 'About 59', true, 2), ('C', 'About 70', false, 3), ('D', 'About 52', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'The table shows bus fares from Thimphu (illustrative figures).

| To | Distance (km) | Fare (Nu.) |
|---|---|---|
| Paro | 55 | 75 |
| Punakha | 72 | 105 |
| Phuentsholing | 160 | 240 |
| Bumthang | 270 | 400 |

Which route has the lowest fare per kilometre?', 'Per km: Paro 1.36, Punakha 1.46, Bumthang 1.48, Phuentsholing 1.50.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Thimphu–Bumthang', false, 1), ('B', 'Thimphu–Paro', true, 2), ('C', 'Thimphu–Punakha', false, 3), ('D', 'Thimphu–Phuentsholing', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'The table shows bus fares from Thimphu (illustrative figures).

| To | Distance (km) | Fare (Nu.) |
|---|---|---|
| Paro | 55 | 75 |
| Punakha | 72 | 105 |
| Phuentsholing | 160 | 240 |
| Bumthang | 270 | 400 |

How much does a return trip from Thimphu to Punakha cost?', '2 × 105 = Nu. 210.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 210', true, 1), ('B', 'Nu. 180', false, 2), ('C', 'Nu. 144', false, 3), ('D', 'Nu. 105', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'The table shows bus fares from Thimphu (illustrative figures).

| To | Distance (km) | Fare (Nu.) |
|---|---|---|
| Paro | 55 | 75 |
| Punakha | 72 | 105 |
| Phuentsholing | 160 | 240 |
| Bumthang | 270 | 400 |

How much more is the fare to Phuentsholing than to Paro?', '240 − 75 = Nu. 165.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 185', false, 1), ('B', 'Nu. 315', false, 2), ('C', 'Nu. 105', false, 3), ('D', 'Nu. 165', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'The table shows bus fares from Thimphu (illustrative figures).

| To | Distance (km) | Fare (Nu.) |
|---|---|---|
| Paro | 55 | 75 |
| Punakha | 72 | 105 |
| Phuentsholing | 160 | 240 |
| Bumthang | 270 | 400 |

About how much does the Bumthang fare cost per kilometre?', '400 ÷ 270 ≈ Nu. 1.48.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 0.68', false, 1), ('B', 'Nu. 1.35', false, 2), ('C', 'Nu. 1.48', true, 3), ('D', 'Nu. 2.70', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'The table shows bus fares from Thimphu (illustrative figures).

| To | Distance (km) | Fare (Nu.) |
|---|---|---|
| Paro | 55 | 75 |
| Punakha | 72 | 105 |
| Phuentsholing | 160 | 240 |
| Bumthang | 270 | 400 |

If all fares rise by 10%, what will the fare to Phuentsholing be?', '240 × 1.1 = Nu. 264.', (select id from public.subjects where slug = 'data-interpretation'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'data-interpretation' and t.slug = 'tables'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nu. 280', false, 1), ('B', 'Nu. 254', false, 2), ('C', 'Nu. 264', true, 3), ('D', 'Nu. 250', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'ཚིག་ཚན་འདི་ལྷག་སྟེ་ དྲི་བ་ལུ་ལན་བྲིས།

(Read the passage and answer the question.)

པདྨ་ བུམ་ཐང་ལུ་ སྡོདཔ་ཨིན། ཁོ་ ཞིང་ཁ་ནང་ ལཱ་འབདཝ་ཨིན། ཁོ་ལུ་ བ་གསུམ་དང་ རྟ་གཅིག་ཡོད། ཁོའི་ཡུལ་ཁར་ ལོ་ལྟར་ ཚེས་བཅུ་ཡོདཔ་ཨིན། ཚེས་བཅུ་ནང་ མི་ཚུ་ འཆམ་བལྟ་བར་ འོངམ་ཨིན།

པདྨ་ ག་ཏེ་ སྡོདཔ་སྨོ?

(Where does Pema live?)', 'The passage says Pema lives in Bumthang (བུམ་ཐང).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'comprehension'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Read the passage and the question in the picture%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b5-dzongkha', 1)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'སྤ་རོ', false, 1), ('B', 'བུམ་ཐང', true, 2), ('C', 'ཐིམ་ཕུ', false, 3), ('D', 'ཧཱ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'ཚིག་ཚན་འདི་ལྷག་སྟེ་ དྲི་བ་ལུ་ལན་བྲིས།

(Read the passage and answer the question.)

པདྨ་ བུམ་ཐང་ལུ་ སྡོདཔ་ཨིན། ཁོ་ ཞིང་ཁ་ནང་ ལཱ་འབདཝ་ཨིན། ཁོ་ལུ་ བ་གསུམ་དང་ རྟ་གཅིག་ཡོད། ཁོའི་ཡུལ་ཁར་ ལོ་ལྟར་ ཚེས་བཅུ་ཡོདཔ་ཨིན། ཚེས་བཅུ་ནང་ མི་ཚུ་ འཆམ་བལྟ་བར་ འོངམ་ཨིན།

པདྨ་ ག་ཏེ་ ལཱ་འབདཝ་སྨོ?

(Where does Pema work?)', 'He works in the field (ཞིང་ཁ་ནང).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'comprehension'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Read the passage and the question in the picture%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b5-dzongkha', 2)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'སློབ་གྲྭ་ནང', false, 1), ('B', 'ཞིང་ཁ་ནང', true, 2), ('C', 'ཚོང་ཁང་ནང', false, 3), ('D', 'སྨན་ཁང་ནང', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'ཚིག་ཚན་འདི་ལྷག་སྟེ་ དྲི་བ་ལུ་ལན་བྲིས།

(Read the passage and answer the question.)

པདྨ་ བུམ་ཐང་ལུ་ སྡོདཔ་ཨིན། ཁོ་ ཞིང་ཁ་ནང་ ལཱ་འབདཝ་ཨིན། ཁོ་ལུ་ བ་གསུམ་དང་ རྟ་གཅིག་ཡོད། ཁོའི་ཡུལ་ཁར་ ལོ་ལྟར་ ཚེས་བཅུ་ཡོདཔ་ཨིན། ཚེས་བཅུ་ནང་ མི་ཚུ་ འཆམ་བལྟ་བར་ འོངམ་ཨིན།

པདྨ་ལུ་ བ་ ག་དེམ་ཅིག་ཡོད་ག?

(How many cows does Pema have?)', 'He has three cows (བ་གསུམ).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'comprehension'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Read the passage and the question in the picture%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b5-dzongkha', 3)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གསུམ', true, 1), ('B', 'བཞི', false, 2), ('C', 'གཉིས', false, 3), ('D', 'གཅིག', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'ཚིག་ཚན་འདི་ལྷག་སྟེ་ དྲི་བ་ལུ་ལན་བྲིས།

(Read the passage and answer the question.)

པདྨ་ བུམ་ཐང་ལུ་ སྡོདཔ་ཨིན། ཁོ་ ཞིང་ཁ་ནང་ ལཱ་འབདཝ་ཨིན། ཁོ་ལུ་ བ་གསུམ་དང་ རྟ་གཅིག་ཡོད། ཁོའི་ཡུལ་ཁར་ ལོ་ལྟར་ ཚེས་བཅུ་ཡོདཔ་ཨིན། ཚེས་བཅུ་ནང་ མི་ཚུ་ འཆམ་བལྟ་བར་ འོངམ་ཨིན།

ཁོའི་ཡུལ་ཁར་ ལོ་ལྟར་ ག་ཅི་ཡོདཔ་སྨོ?

(What happens in his village every year?)', 'There is a tshechu (ཚེས་བཅུ) every year.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'comprehension'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Read the passage and the question in the picture%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b5-dzongkha', 4)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཚེས་བཅུ', true, 1), ('B', 'འཛོམས་ཚོགས', false, 2), ('C', 'ལོ་གསར', false, 3), ('D', 'རྩེད་འགྲན', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'ཚིག་ཚན་འདི་ལྷག་སྟེ་ དྲི་བ་ལུ་ལན་བྲིས།

(Read the passage and answer the question.)

པདྨ་ བུམ་ཐང་ལུ་ སྡོདཔ་ཨིན། ཁོ་ ཞིང་ཁ་ནང་ ལཱ་འབདཝ་ཨིན། ཁོ་ལུ་ བ་གསུམ་དང་ རྟ་གཅིག་ཡོད། ཁོའི་ཡུལ་ཁར་ ལོ་ལྟར་ ཚེས་བཅུ་ཡོདཔ་ཨིན། ཚེས་བཅུ་ནང་ མི་ཚུ་ འཆམ་བལྟ་བར་ འོངམ་ཨིན།

ཚེས་བཅུ་ནང་ མི་ཚུ་ ག་ཅི་ བལྟ་བར་ འོངམ་སྨོ?

(What do people come to watch at the tshechu?)', 'People come to watch the mask dances (འཆམ).', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'comprehension'),
    'foundation', 1, 90, 'ai_variation', 'awaiting_review', (select id from public.questions where origin = 'historical_official' and source_year = 2011 and stem like 'Read the passage and the question in the picture%' limit 1), 'same_objective',
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5", "what_changed": "Tests the same point as the past-paper question with a new example."}'::jsonb, null,
    'soma-b5-dzongkha', 5)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཚོང', false, 1), ('B', 'རྩེད་མོ', false, 2), ('C', 'གློག་བརྙན', false, 3), ('D', 'འཆམ', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“བགོ་སྐལ” ཟེར་བའི་ཚིག་དེ་གི་ ཞེ་ས་ ག་ཅི་སྨོ?

(Which is the honorific form of “བགོ་སྐལ”?)', '“བགོ་སྐལ” means share, portion; its honorific (ཞེ་ས) is “སྐུ་སྐལ”. Source: DDC Dzongkha–English Dictionary, p. 146.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཕྱག་སྐལ', false, 1), ('B', 'དབུ་སྐལ', false, 2), ('C', 'ཞལ་སྐལ', false, 3), ('D', 'སྐུ་སྐལ', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“ཆོ་ག” ཟེར་བའི་ཚིག་དེ་གི་ ཞེ་ས་ ག་ཅི་སྨོ?

(Which is the honorific form of “ཆོ་ག”?)', '“ཆོ་ག” means ritual; its honorific (ཞེ་ས) is “གསུང་ཆོག”. Source: DDC Dzongkha–English Dictionary, p. 258.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གསུང་ཆོག', true, 1), ('B', 'སྐུ་ཆོག', false, 2), ('C', 'ཕྱག་ཆོག', false, 3), ('D', 'ཞལ་ཆོག', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“བྱེལཝ” ཟེར་བའི་ཚིག་དེ་གི་ ཞེ་ས་ ག་ཅི་སྨོ?

(Which is the honorific form of “བྱེལཝ”?)', '“བྱེལཝ” means busyness, hassle; its honorific (ཞེ་ས) is “ཐུགས་བྱེལ”. Source: DDC Dzongkha–English Dictionary, p. 616.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཐུགས་བྱེལ', true, 1), ('B', 'ཞལ་བྱེལ', false, 2), ('C', 'སྐུ་བྱེལ', false, 3), ('D', 'ཕྱག་བྱེལ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“སྐེ་རྒྱན” ཟེར་བའི་ཚིག་དེ་གི་ ཞེ་ས་ ག་ཅི་སྨོ?

(Which is the honorific form of “སྐེ་རྒྱན”?)', '“སྐེ་རྒྱན” means necklace; its honorific (ཞེ་ས) is “མགུལ་རྒྱན”. Source: DDC Dzongkha–English Dictionary, p. 36.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཞལ་རྒྱན', false, 1), ('B', 'མགུལ་རྒྱན', true, 2), ('C', 'དབུ་རྒྱན', false, 3), ('D', 'ཕྱག་རྒྱན', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“འབད་ཐངས” ཟེར་བའི་ཚིག་དེ་གི་ ཞེ་ས་ ག་ཅི་སྨོ?

(Which is the honorific form of “འབད་ཐངས”?)', '“འབད་ཐངས” means way of doing, method; its honorific (ཞེ་ས) is “མཛད་ཐངས”. Source: DDC Dzongkha–English Dictionary, p. 637.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གསུང་ཐངས', false, 1), ('B', 'བཞེས་ཐངས', false, 2), ('C', 'གནང་ཐངས', false, 3), ('D', 'མཛད་ཐངས', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“ཁ་མང” ཟེར་བའི་ཚིག་དེ་གི་ ཞེ་ས་ ག་ཅི་སྨོ?

(Which is the honorific form of “ཁ་མང”?)', '“ཁ་མང” means talkative; its honorific (ཞེ་ས) is “ཞལ་མང”. Source: DDC Dzongkha–English Dictionary, p. 62.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'དབུ་མང', false, 1), ('B', 'ཞལ་མང', true, 2), ('C', 'སྐུ་མང', false, 3), ('D', 'ཕྱག་མང', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“སྐྱེས་ལྷ” ཟེར་བའི་ཚིག་དེ་གི་ ཞེ་ས་ ག་ཅི་སྨོ?

(Which is the honorific form of “སྐྱེས་ལྷ”?)', '“སྐྱེས་ལྷ” means birth deity; its honorific (ཞེ་ས) is “འཁྲུངས་ལྷ”. Source: DDC Dzongkha–English Dictionary, p. 45.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'སྐུ་ལྷ', false, 1), ('B', 'ཞལ་ལྷ', false, 2), ('C', 'ཕྱག་ལྷ', false, 3), ('D', 'འཁྲུངས་ལྷ', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“ཆུ་འཁྱུ་ས” ཟེར་བའི་ཚིག་དེ་གི་ ཞེ་ས་ ག་ཅི་སྨོ?

(Which is the honorific form of “ཆུ་འཁྱུ་ས”?)', '“ཆུ་འཁྱུ་ས” means bathing place; its honorific (ཞེ་ས) is “ཁྲུས་ཁང”. Source: DDC Dzongkha–English Dictionary, p. 250.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'honorific-words'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'གཟིམ་ཁང', false, 1), ('B', 'ཁྲུས་ཁང', true, 2), ('C', 'ཞལ་ཁང', false, 3), ('D', 'གསོལ་ཁང', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“སྐུ་རྒྱབ” ཟེར་བའི་ཚིག་དེ་གི་ འགལ་མིང་ ག་ཅི་སྨོ?

(Which word is the opposite of “སྐུ་རྒྱབ”?)', '“སྐུ་རྒྱབ” and “སྐུ་མདུན” are opposites (behind (honorific) / in front (honorific)). Source: DDC Dzongkha–English Dictionary, p. 32.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'སྐུ་གཡས', false, 1), ('B', 'སྐུ་སྨད', false, 2), ('C', 'སྐུ་སྟོད', false, 3), ('D', 'སྐུ་མདུན', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“ཁམས་དྭངས་ཏོག་ཏོ” ཟེར་བའི་ཚིག་དེ་གི་ འགལ་མིང་ ག་ཅི་སྨོ?

(Which word is the opposite of “ཁམས་དྭངས་ཏོག་ཏོ”?)', '“ཁམས་དྭངས་ཏོག་ཏོ” and “ཁམས་ལོག་སི་སི” are opposites (feeling fresh and well / feeling unwell). Source: DDC Dzongkha–English Dictionary, p. 67.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཁམས་ལོག་སི་སི', true, 1), ('B', 'ཁམས་བདེ་', false, 2), ('C', 'ཁམས་ལེགས་', false, 3), ('D', 'ཁམས་བཟང་', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“སྟུག་པོ” ཟེར་བའི་ཚིག་དེ་གི་ འགལ་མིང་ ག་ཅི་སྨོ?

(Which word is the opposite of “སྟུག་པོ”?)', '“སྟུག་པོ” and “སྲབ” are opposites (thick / thin). Source: DDC Dzongkha–English Dictionary, p. 340.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'མཐུག', false, 1), ('B', 'ལྕི', false, 2), ('C', 'སྲབ', true, 3), ('D', 'སྦོམ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“ཆུང” ཟེར་བའི་ཚིག་དེ་གི་ འགལ་མིང་ ག་ཅི་སྨོ?

(Which word is the opposite of “ཆུང”?)', '“ཆུང” and “ཆེ” are opposites (small / big). Source: DDC Dzongkha–English Dictionary, p. 255.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཆུང་ཀུ', false, 1), ('B', 'ཆེ', true, 2), ('C', 'ཆུང་བ', false, 3), ('D', 'ཉུང', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“དམའ་ས” ཟེར་བའི་ཚིག་དེ་གི་ འགལ་མིང་ ག་ཅི་སྨོ?

(Which word is the opposite of “དམའ་ས”?)', '“དམའ་ས” and “མཐོ་ས” are opposites (low place / high place). Source: DDC Dzongkha–English Dictionary, p. 708.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'མཐོ་ས', true, 1), ('B', 'ཐུར་ས', false, 2), ('C', 'དམའ་ཤོས', false, 3), ('D', 'གཤམ', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“མོ་གདོང” ཟེར་བའི་ཚིག་དེ་གི་ འགལ་མིང་ ག་ཅི་སྨོ?

(Which word is the opposite of “མོ་གདོང”?)', '“མོ་གདོང” and “ཕོ་གདོང” are opposites (female look / male look). Source: DDC Dzongkha–English Dictionary, p. 698.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'ཕོ་གདོང', true, 1), ('B', 'མོ་རྐྱང', false, 2), ('C', 'མི་གདོང', false, 3), ('D', 'བུ་གདོང', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“བཙུགས” ཟེར་བའི་ཚིག་དེ་གི་ འགལ་མིང་ ག་ཅི་སྨོ?

(Which word is the opposite of “བཙུགས”?)', '“བཙུགས” and “བཏོན” are opposites (put in, plant / take out). Source: DDC Dzongkha–English Dictionary, p. 727.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'standard', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'བཙུགས་ཡོད', false, 1), ('B', 'བསྐྱལ', false, 2), ('C', 'བཏོན', true, 3), ('D', 'བཞག', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', '“མེད” ཟེར་བའི་ཚིག་དེ་གི་ འགལ་མིང་ ག་ཅི་སྨོ?

(Which word is the opposite of “མེད”?)', '“མེད” and “ཡོད” are opposites (is not / is). Source: DDC Dzongkha–English Dictionary, p. 695.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'opposites'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'མིན', false, 1), ('B', 'མ', false, 2), ('C', 'མི', false, 3), ('D', 'ཡོད', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does the Dzongkha word “ཆུ” mean?

(“ཆུ” ཟེར་བའི་ཚིག་དེ་གི་ དོན་ ག་ཅི་སྨོ?)', '“ཆུ” means water.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Wind', false, 1), ('B', 'Water', true, 2), ('C', 'Fire', false, 3), ('D', 'Earth', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does the Dzongkha word “མེ” mean?

(“མེ” ཟེར་བའི་ཚིག་དེ་གི་ དོན་ ག་ཅི་སྨོ?)', '“མེ” means fire.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Fire', true, 1), ('B', 'Smoke', false, 2), ('C', 'Light', false, 3), ('D', 'Water', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does the Dzongkha word “རི” mean?

(“རི” ཟེར་བའི་ཚིག་དེ་གི་ དོན་ ག་ཅི་སྨོ?)', '“རི” means mountain.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Mountain', true, 1), ('B', 'Forest', false, 2), ('C', 'Valley', false, 3), ('D', 'River', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does the Dzongkha word “ཤིང” mean?

(“ཤིང” ཟེར་བའི་ཚིག་དེ་གི་ དོན་ ག་ཅི་སྨོ?)', '“ཤིང” means tree, wood.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Grass', false, 1), ('B', 'Flower', false, 2), ('C', 'Stone', false, 3), ('D', 'Tree, wood', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does the Dzongkha word “ཁྱི” mean?

(“ཁྱི” ཟེར་བའི་ཚིག་དེ་གི་ དོན་ ག་ཅི་སྨོ?)', '“ཁྱི” means dog.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Dog', true, 1), ('B', 'Horse', false, 2), ('C', 'Cow', false, 3), ('D', 'Cat', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does the Dzongkha word “ཟླ་བ” mean?

(“ཟླ་བ” ཟེར་བའི་ཚིག་དེ་གི་ དོན་ ག་ཅི་སྨོ?)', '“ཟླ་བ” means moon, month.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Sun, day', false, 1), ('B', 'Star', false, 2), ('C', 'Year', false, 3), ('D', 'Moon, month', true, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does the Dzongkha word “ཉི་མ” mean?

(“ཉི་མ” ཟེར་བའི་ཚིག་དེ་གི་ དོན་ ག་ཅི་སྨོ?)', '“ཉི་མ” means sun.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Sun', true, 1), ('B', 'Cloud', false, 2), ('C', 'Star', false, 3), ('D', 'Moon', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does the Dzongkha word “ལམ” mean?

(“ལམ” ཟེར་བའི་ཚིག་དེ་གི་ དོན་ ག་ཅི་སྨོ?)', '“ལམ” means road, path.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Field', false, 1), ('B', 'Road, path', true, 2), ('C', 'Bridge', false, 3), ('D', 'House', false, 4)) as v(label, body, ok, pos);

with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review, image_url, passage_group, passage_position)
  values ('PE', 'mcq', 'What does the Dzongkha word “ཁྱིམ” mean?

(“ཁྱིམ” ཟེར་བའི་ཚིག་དེ་གི་ དོན་ ག་ཅི་སྨོ?)', '“ཁྱིམ” means house, home.', (select id from public.subjects where slug = 'dzongkha-communication'),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = 'dzongkha-communication' and t.slug = 'vocabulary'),
    'foundation', 1, 90, 'ai_generated', 'awaiting_review', null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.", "batch": "pe-batch-5"}'::jsonb, null,
    null, null)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Shop', false, 1), ('B', 'School', false, 2), ('C', 'Temple', false, 3), ('D', 'House, home', true, 4)) as v(label, body, ok, pos);

commit;
