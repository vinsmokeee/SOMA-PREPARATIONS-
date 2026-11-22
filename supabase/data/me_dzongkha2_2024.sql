-- ME Paper II (Dzongkha category): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language-current-affairs'), 'comprehension', 'Comprehension' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language-current-affairs'), 'current-affairs-bhutan', 'Current affairs: Bhutan' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language-current-affairs'), 'current-affairs-world', 'Current affairs: world' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language-current-affairs'), 'essay-language-and-national-identity', 'Essay: language and national identity' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language-current-affairs'), 'essay-leadership-and-the-civil-service', 'Essay: leadership and the civil service' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language-current-affairs'), 'letter-writing-formal-letters', 'Letter writing: formal letters' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language-current-affairs'), 'translation-dzongkha-to-english', 'Translation: Dzongkha to English' on conflict (subject_id, slug) do nothing;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'essay', 'Write an essay of about 300-350 words on the following topic.

On 14 July 2024, Prime Minister Tshering Tobgay issued an executive order directing that all government meetings and official correspondence be conducted in Dzongkha. The order also requires translation services or translated documents for foreigners attending meetings.

Will the executive order effectively promote Dzongkha as the national language, or are there better alternatives to achieve this goal? Argue your position with supporting evidence. (25 marks)', 'Making Dzongkha the language of government

On 14 July 2024 the Prime Minister directed that all government meetings and official correspondence be conducted in Dzongkha, with translation for foreign participants. Dzongkha is our national language and a symbol of our identity and unity, yet many educated Bhutanese are more comfortable writing in English. In my view the order is a strong and necessary step, but it will succeed only if it is supported by other measures.

The order has clear strengths. Language survives through use, and the government is the largest employer and the most visible institution in the country. When ministers, secretaries and civil servants speak and write in Dzongkha every day, they show that the language is fit for modern administration, not only for ceremonies. The order creates real demand: officials will improve their skills, new administrative terms will be coined and standardised, and young people will see Dzongkha as useful for their careers.

However, an order alone cannot change habits. Many technical fields - engineering, medicine, finance and information technology - lack standard Dzongkha terms, and most civil servants were educated mainly in English. Translation for foreigners adds cost and time. If officials simply translate English drafts word for word, the result may be formal compliance rather than genuine growth of the language.

Therefore the order should be combined with other actions. Dzongkha teaching must be strengthened from the early years, with trained teachers and engaging materials. Digital tools - fonts, keyboards, spell-checkers, translation software and online dictionaries - should be improved so that writing in Dzongkha is as easy as in English. The Dzongkha Development Commission should publish glossaries for every sector, and the media, film and social media creators should be encouraged to produce attractive content. Training and recognition for civil servants who write well in Dzongkha would also help.

In conclusion, the executive order is an effective starting point because it puts Dzongkha at the heart of government. Supported by education, technology and content, it can turn our national language into a living language of work and daily life for future generations.', null, '[{"point": "Introduction: the executive order and why promoting Dzongkha matters (national language, identity, unity)", "marks": 3}, {"point": "Arguments for the order: daily official use, leadership by example, creates demand, terminology development, everyday confidence", "marks": 6}, {"point": "Limits/ challenges: technical terms, English-medium education, staff proficiency, cost and time of translation, risk of mere formality", "marks": 6}, {"point": "Better or complementary alternatives: early schooling and teaching quality, digital tools (fonts, keyboards, dictionaries), media and content, incentives, Dzongkha Development Commission support", "marks": 6}, {"point": "Clear position and conclusion", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'essay-language-and-national-identity'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 25,
    2700, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Dzongkha category, Paper II", "year": 2024, "url": "https://rcsc.gov.bt/question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'E1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'E1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 10.0, 1 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 6.0, 2 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 9.0, 3 from me_q where key = 'E1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'essay', 'Write an essay of about 300-350 words on the following topic.

Based on Yuval Noah Harari''s statement at the RIGSS Dialogue on 4 April 2023 about leaders recognising their limitations and delegating responsibilities, what key leadership skills are essential for future civil servants of Bhutan to follow his view? Argue this position with supporting evidence. (25 marks)', 'Leaders who know their limits

At the RIGSS Dialogue in April 2023, the historian Yuval Noah Harari reminded Bhutanese leaders that in a fast-changing world no leader can know or do everything. Good leaders recognise their limitations and share responsibility with others. For the future civil servants of Bhutan, this view points to a set of essential leadership skills.

The first is self-awareness and humility. A civil servant who honestly knows his or her strengths and weaknesses will seek advice, admit mistakes and keep learning. In an age of artificial intelligence, climate change and new economic projects such as Gelephu Mindfulness City, problems are too complex for one person; humility allows leaders to learn from experts and from the people they serve.

The second skill is delegation built on trust. Instead of controlling every decision, leaders should give clear responsibilities to capable team members, provide resources and hold them accountable for results. This makes work faster, develops younger officers and reduces the bottlenecks that slow public services. The recent civil service reforms, which emphasise performance and accountability, need leaders who empower rather than micromanage.

Third, collaboration and communication are vital. Leaders must listen, explain decisions clearly and work across agencies, the private sector and communities. Emotional intelligence - understanding the feelings and motivations of others - helps build teams that are committed rather than merely obedient. Leaders should also use evidence and data rather than relying only on their own opinions.

Finally, adaptability and integrity complete the picture. Future civil servants must be ready to change plans when circumstances change, while remaining honest, fair and loyal to the Tsa-Wa-Sum. Integrity makes delegation safe, because people trust a leader who is just and transparent.

In conclusion, Harari''s view suggests that the strongest leaders are not those who know everything, but those who know their limits, trust their teams and keep learning. Civil servants with these skills will serve Bhutan well in a complex future.', null, '[{"point": "Introduction: Harari''s idea - no leader can know everything; good leaders recognise limits and delegate", "marks": 3}, {"point": "Self-awareness and humility; listening and learning; admitting mistakes", "marks": 5}, {"point": "Delegation and trust: empowering teams, clear responsibilities, accountability", "marks": 5}, {"point": "Collaboration, communication, emotional intelligence; using expertise and data", "marks": 5}, {"point": "Adaptability, integrity and service to the nation (civil service reform, Bhutan context/ examples)", "marks": 4}, {"point": "Conclusion", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'essay-leadership-and-the-civil-service'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 25,
    2700, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Dzongkha category, Paper II", "year": 2024, "url": "https://rcsc.gov.bt/question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'E2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'E2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 10.0, 1 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 6.0, 2 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 9.0, 3 from me_q where key = 'E2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Write a letter of about 150 words on the following situation.

As Karma, a student at Sherubtse College in Trashigang, write a letter to the Chairperson of the Royal Civil Service Commission anticipating potential difficulties you might face travelling to the examination centres in Thimphu. Describe the issues you expect, and suggest practical solutions, such as online examinations or additional district centres, to address these challenges. (20 marks)', 'Karma
Sherubtse College
Kanglung, Trashigang

[Date]

The Chairperson
Royal Civil Service Commission
Thimphu

Subject: Difficulties in travelling to examination centres in Thimphu

Respected Madam/Sir,

I am a final-year student at Sherubtse College, preparing for the Bhutan Civil Service Examination. I write to share some difficulties that students in the east may face if all examination centres are in Thimphu.

The journey from Trashigang to Thimphu takes two days, and roadblocks during the monsoon can make it longer. Many students cannot afford bus fares, hotel rooms and meals for a week, and the long trip leaves us tired and stressed before the examination. We also miss classes and other assessments.

I respectfully suggest that the Commission consider additional centres in the eastern region, such as Trashigang or Mongar, or computer-based online examinations at colleges under supervision. Publishing the schedule early would also help us plan.

Thank you for considering this request.

Yours faithfully,
Karma', null, '[{"point": "Correct formal letter format: sender''s address, date, receiver''s designation and address, subject, salutation, closing and signature", "marks": 5}, {"point": "Introduction and purpose stated clearly and politely", "marks": 3}, {"point": "Difficulties described: long distance and travel time, cost of travel and accommodation, road blocks/ weather, missing classes, stress", "marks": 5}, {"point": "Practical solutions: additional regional/ Dzongkhag centres (e.g. Trashigang/ Kanglung), online or computer-based tests, travel support, schedule", "marks": 5}, {"point": "Polite, concise language (about 150 words)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'letter-writing-formal-letters'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Dzongkha category, Paper II", "year": 2024, "url": "https://rcsc.gov.bt/question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'L1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'L1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 8.0, 1 from me_q where key = 'L1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 5.0, 2 from me_q where key = 'L1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 7.0, 3 from me_q where key = 'L1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Write a letter of about 150 words on the following situation.

As a Dzongkha teacher at Motithang Higher Secondary School in Thimphu, write a letter to the Director of the CSCD (Centre for School Curriculum Development) proposing the inclusion of short stories collected from Class 9 and 11 students in the curriculum. Request that outstanding stories be incorporated into the syllabus or that students be given a platform to publish their work. (20 marks)', '[Name]
Dzongkha Teacher
Motithang Higher Secondary School
Thimphu

[Date]

The Director
Centre for School Curriculum Development
Paro

Subject: Proposal to include students'' short stories in the Dzongkha curriculum

Respected Sir/Madam,

I am a Dzongkha teacher at Motithang Higher Secondary School. This year, our Class 9 and 11 students wrote and collected short stories in Dzongkha as part of their writing activities, and many of them are original, meaningful and well written.

Including some of these stories in the curriculum would encourage students to write creatively in our national language and make the texts more familiar and interesting to young readers. It would also show that Dzongkha literature can grow through our own students.

I therefore request that the Centre review the outstanding stories for inclusion in the syllabus or, if that is not possible, provide a platform such as an annual anthology or an online collection where students can publish their work. I will gladly share the collection and assist in any way.

Thank you for your kind consideration.

Yours faithfully,
[Name]', null, '[{"point": "Correct formal letter format", "marks": 5}, {"point": "Purpose: proposal to include students'' short stories", "marks": 3}, {"point": "Justification: quality of stories, promotes Dzongkha writing, creativity, relevance to learners, motivation", "marks": 5}, {"point": "Clear requests: include outstanding stories in syllabus or provide a publishing platform (anthology, magazine, online); offer to share collection/ help", "marks": 5}, {"point": "Polite, concise language", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'letter-writing-formal-letters'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Dzongkha category, Paper II", "year": 2024, "url": "https://rcsc.gov.bt/question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'L2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'L2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 8.0, 1 from me_q where key = 'L2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 5.0, 2 from me_q where key = 'L2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 7.0, 3 from me_q where key = 'L2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Read the passage below and then answer the questions that follow.

What is Meditation?
By Jiddu Krishnamurti and Chögyam Trungpa Rinpoche

In this conversation, J. Krishnamurti and Chögyam Trungpa Rinpoche delve into the nature of meditation, challenging traditional views and practices. Here are the key points from the discussion:

Critique of Personal Experience in Religion: Krishnamurti argues that personal experience in organized religions is often unreliable because it can be a projection of one''s own intentions, fears, and hopes. He suggests that such experiences, which are centered on the individual, lack validity in understanding truth.

Questioning the Role of Meditation: Krishnamurti questions whether meditation, as commonly practiced, can truly lead to understanding or truth. He criticizes practices that conform to established patterns, arguing that they often reinforce the ego and do not necessarily bring one closer to truth.

Meditation as Observation: He proposes that true meditation involves observing without the filter of personal biases or the ego ("the me"). This form of meditation should be about seeing things as they are, without division or preconceived notions.

Traditional Approaches vs. True Meditation: Krishnamurti dismisses traditional forms of meditation - whether they involve repeating mantras or following specific rituals - as potentially reinforcing the ego rather than dissolving it. He emphasizes the need for observation without the ego, suggesting that traditional practices often perpetuate disorder rather than bring about real understanding.

Role of the Mind and Order: He explores the idea that for meditation to be meaningful, the mind must be free from the constraints of time and memory. True meditation is about seeing beyond these constraints, which can only happen when the mind is completely still.

Discussion with Trungpa Rinpoche: Trungpa Rinpoche adds that meditation should not become an additional problem to solve but rather be integrated into the understanding of life''s challenges. He agrees with Krishnamurti''s view that meditation should not be about achieving personal experiences or escaping problems but about understanding and observing life more deeply.

Question A (5 x 1 = 5 marks)
Write the correct option for each question, for example: 1 (A).

1. What does Krishnamurti argue about personal experience in organised religions?
(A) It often lacks validity as it can be a projection of personal intentions, fears and hopes.  (B) It is always valid for understanding truth.  (C) It provides a comprehensive view of truth.  (D) It is irrelevant to understanding truth.

2. What does Krishnamurti question about meditation?
(A) Whether meditation, as commonly practised, can truly lead to understanding or truth.  (B) Whether meditation can lead to material success.  (C) Whether meditation can improve physical health.  (D) Whether meditation is a religious practice.

3. According to Krishnamurti, what should true meditation involve?
(A) Observing without the filter of personal biases or the ego.  (B) Observing with personal biases.  (C) Following traditional rituals.  (D) Repeating mantras.

4. How does Krishnamurti view traditional forms of meditation?
(A) As potentially reinforcing the ego rather than dissolving it.  (B) As essential for achieving understanding.  (C) As effective in dissolving the ego.  (D) As irrelevant to meditation.

5. What does Trungpa Rinpoche add to the discussion about meditation?
(A) Meditation should be integrated into the understanding of life''s challenges.  (B) Meditation should be about achieving personal experiences.  (C) Meditation should focus on ritualistic practices.  (D) Meditation should be used to escape problems.', '1 (A)  2 (A)  3 (A)  4 (A)  5 (A)

1: experience "can be a projection of one''s own intentions, fears, and hopes" and lacks validity.
2: he "questions whether meditation, as commonly practiced, can truly lead to understanding or truth".
3: "observing without the filter of personal biases or the ego".
4: traditional forms are "potentially reinforcing the ego rather than dissolving it".
5: meditation should "be integrated into the understanding of life''s challenges".', null, '[{"point": "1 (A)", "marks": 1}, {"point": "2 (A)", "marks": 1}, {"point": "3 (A)", "marks": 1}, {"point": "4 (A)", "marks": 1}, {"point": "5 (A)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Dzongkha category, Paper II", "year": 2024, "url": "https://rcsc.gov.bt/question-papers/"}}'::jsonb, 'me-dzongkha-2-2024b1-s3-cp', 1, null, null, null, null)
  returning id
)
insert into me_q select 'S3A', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S3A' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 2.0, 1 from me_q where key = 'S3A';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 1.0, 2 from me_q where key = 'S3A';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 2.0, 3 from me_q where key = 'S3A';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Define mindfulness according to J. Krishnamurti and Chögyam Trungpa Rinpoche. What do they see as the core aspects of mindfulness? (5 marks)', 'For Krishnamurti, mindfulness (true meditation) is observing life as it is, without the filter of personal biases, preconceived ideas or the ego - "the me". Its core aspects are: observation without division between observer and observed; a mind that is completely still and free from the constraints of time and memory; and not seeking special personal experiences. Trungpa Rinpoche adds that mindfulness should not become one more problem to solve or a way of escaping problems, but should be integrated into everyday life, so that we understand and face life''s challenges more deeply and clearly.', null, '[{"point": "Definition from the passage: seeing things as they are - pure observation without the ego (''the me''), biases or preconceived notions", "marks": 2}, {"point": "Core aspects: freedom from time and memory/ a still mind; no division; not chasing experiences or escaping problems; integrated into daily life and its challenges (Trungpa)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Dzongkha category, Paper II", "year": 2024, "url": "https://rcsc.gov.bt/question-papers/"}}'::jsonb, 'me-dzongkha-2-2024b1-s3-cp', 2, null, null, null, null)
  returning id
)
insert into me_q select 'S3B', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S3B' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 2.0, 1 from me_q where key = 'S3B';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 1.0, 2 from me_q where key = 'S3B';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 2.0, 3 from me_q where key = 'S3B';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'How can the wisdom shared by J. Krishnamurti and Chögyam Trungpa Rinpoche be applied in creating a mindfulness initiative for Gelephu Mindfulness City in Bhutan? (5 marks)', 'Gelephu Mindfulness City should treat mindfulness not as a brand, ritual or tourist attraction, but as a way of living with awareness. Following Krishnamurti, its programmes should encourage people to observe themselves and their surroundings clearly, without ego or prejudice - for example in decision-making, where leaders listen and look at facts before acting. Following Trungpa Rinpoche, mindfulness should be woven into daily life rather than kept as a separate activity: workplaces, schools and public services can build in moments of reflection, mindful communication and attention to wellbeing. The city could provide quiet green spaces, community learning programmes and training for residents and businesses, and measure success by wellbeing and harmony rather than only by profit, so that mindfulness helps people face real challenges instead of escaping from them.', null, '[{"point": "Applies the ideas: mindfulness as observation and awareness rather than ritual or show; avoid ego/ commercialisation", "marks": 2}, {"point": "Concrete proposals: integrate mindfulness in daily life, work, schools, planning and governance; spaces for quiet reflection; training; measuring wellbeing; inclusive of all", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Dzongkha category, Paper II", "year": 2024, "url": "https://rcsc.gov.bt/question-papers/"}}'::jsonb, 'me-dzongkha-2-2024b1-s3-cp', 3, null, null, null, null)
  returning id
)
insert into me_q select 'S3C', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S3C' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 2.0, 1 from me_q where key = 'S3C';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 1.0, 2 from me_q where key = 'S3C';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 2.0, 3 from me_q where key = 'S3C';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'What is the primary criticism that J. Krishnamurti has about traditional meditation practices, and how does it relate to his view of mindfulness? (5 marks)', 'Krishnamurti''s main criticism is that traditional meditation - repeating mantras, following set rituals and conforming to established patterns - tends to strengthen the ego instead of dissolving it, so it perpetuates disorder and does not bring real understanding or truth. This relates directly to his view of mindfulness: for him, true meditation is simple, direct observation of things as they are, without the ego, without division and without the burden of time and memory. Any method that the ''me'' practises in order to gain something keeps the ego in control, so it stands in the way of that clear, still and choiceless awareness.', null, '[{"point": "Criticism: traditional practices (mantras, rituals, set patterns) conform to established patterns and reinforce the ego, perpetuating disorder rather than bringing understanding", "marks": 2.5}, {"point": "Relation: his mindfulness is choiceless observation without the ego, free of time/ memory and patterns - so method-based practice works against it", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Dzongkha category, Paper II", "year": 2024, "url": "https://rcsc.gov.bt/question-papers/"}}'::jsonb, 'me-dzongkha-2-2024b1-s3-cp', 4, null, null, null, null)
  returning id
)
insert into me_q select 'S3D', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S3D' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 2.0, 1 from me_q where key = 'S3D';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 1.0, 2 from me_q where key = 'S3D';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 2.0, 3 from me_q where key = 'S3D';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'translation', 'Read the following passage carefully and translate it into English. (25 marks)

འཆར་གཞི་༡༣ པའི་ནང་ ཨ་ལོ་གཅེས་སྐྱོང་དང་གོང་འཕེལ་ལྟེ་བ་ཚུ་ ཡར་དྲག་གཏང་ནི།

༉ འཆར་གཞི་༡༣ པའི་ནང་ ཤེས་རིག་དང་རིག་རྩལ་གོང་འཕེལ་ལྷན་ཁག་གིས་ ཨ་ལོ་གཅེས་སྐྱོང་དང་གོང་འཕེལ་ལྟེ་བའི་དོན་ལུ་ འཆར་དངུལ་དངུལ་ཀྲམ་ས་ཡ་༧༠༠བགོ་བཀྲམ་འབད་མི་གིས་ ལྟེ་བ་གསརཔ་ གཞི་བཙུགས་འབད་ནི་དང་ ད་ཡོད་པའི་ལྟེ་བ་ཚུ་ ཉམས་བཅོས་འབད་ནིའི་ལས་རིམ་ཡོདཔ་ཨིན་པས། ལྷན་ཁག་གི་ འཆར་གཞི་དང་འཁྲིལ་བ་ཅིན་ གཞི་རྟེན་བཟོ་སྐྲུན་དང་ རྩེདམོ་རྩེ་ནི་མཐུན་རྐྱེན་ དེ་ལས་ ལྷབ་སྦྱང་མཐུན་རྐྱེན་མཁོ་སྒྲུབ་འབད་ནི་ལུ་ གཙོ་རིམ་བཟུང་འོང་ཟེར་ཨིན་པས། འཆར་གཞི་ནང་ བཀོད་མིའི་ནང་ ལྟེ་བ་གསརཔ་༡༠༠ དང་ ད་ལོ་ཡོད་པའི་ ལྟེ་བ་༨༠ དེ་ཅིག་ མཐུན་རྐྱེན་ཚུ་བཙུགས་ཏེ་ ཉམས་བཅོས་འབད་ནི་ ལས་རིམ་ཡོདཔ་བཞིན་དུ་ དེ་གིས་ སྐྱེས་ལོ་༥ འོག་རྒྱུ་འབད་མི་ཨ་ལོ་ཚུ་ལུ་ མཐུན་རྐྱེན་ངེས་བརྟན་བཟོ་ནི་དང་ ཤེས་རིག་གི་ སྤུས་ཚད་ཡར་དྲག་གཏང་ནི་ལུ་ ལྷན་ཐབས་བྱུང་ཚུགས་ནི་ཨིན་པས།

དེ་མ་ཚད་ ལྷན་ཁག་གིས་ སློབ་ཕྲུག་འཛུལ་ཞུགས་ཀྱི་ གྱངས་ཁ་ཉུང་སུ་ཡོད་མི་ ས་གོ་ཚུ་ནང་ ལྟེ་བ་གཞི་བཙུགས་ འབད་ནི་ གདོང་ལེན་འབྱུང་ནི་ཨིནམ་ལས་ སློབ་སྟོན་ཚུ་ ཁྱིམ་ནང་ལས་འབད་ནི་གི་ འཆར་གཞི་ཚུ་ཡང་ཡོདཔ་ཨིན་པས། དེ་བཟུམ་མའི་ ཐབས་ལམ་དེ་ཡང་ ལྟེ་བའི་ཞབས་ཏོག་ཚུ་ཨ་ལོ་ག་ར་ལུ་ ཐོབ་ཚུགསཔ་བཟོ་ནི་དང་ ཨ་ལོ་ཕུད་རོག་གཅིག་ཡང་ ཤེས་ཡོན་གྱི་གོ་སྐབས་མ་འཐོབ་པར་མི་བཞག་ནིའི་དོན་ལུ་ཨིན་པས།

ལྷན་ཁག་གིས་ ལྟེ་བ་གསརཔ་གཞི་བཙུགས་དང་ཅ་ཆས་ཀྱི་དོན་ལུ་ འཆར་དངུལ་དངུལ་ཀྲམ་ས་ཡ་༤༥༠ བགོ་བཀྲམ་འབད་དེ་ཡོདཔ་བཞིན་དུ་ ལྟེ་བའི་ནང་ རྩེདམོ་རྩེ་ནི་དང་ལྷག་སྦྱང་གི་བརྩིས་ཏེ་ གཞི་རྟེན་མཐུན་རྐྱེན་ཚུ་ལངམ་སྦེ་བགོ་བཀྲམ་འབད་ནི་ཨིན་པས།

དེ་ལས་ ལྟེ་བའི་སློབ་སྟོན་པའི་ཁྱད་རིག་གོང་འཕེལ་དང་ཆ་ཚང་ཤེས་རིག་སློབ་སྟོན་པའི་དོན་ལུ་ དངུལ་ཀྲམ་ས་ཡ་༣༣༠.༥ བགོ་བཀྲམ་འབད་དེ་ཡོདཔ་ཨིན་པས། སློབ་གྲྭ་ཤེས་ཡོན་ལས་ཁུངས་ཀྱི་ འགོ་དཔོན་ཚུ་གིས་སབ་མིའི་ནང་ ཁྱིམ་ནང་ལས་སློབ་སྟོན་ལས་རིམ་དེ་ སློབ་ཕྲུག་འཛུལ་ཞུགས་ཉུང་སུ་ཡོད་མི་སྤྱི་འོག་ཚུ་ནང་ འགོ་འདྲེན་འཐབ་ནི་ཨིནམ་ད་ སློབ་ཕྲུག་ཚུ་ལུ་ རང་སོའི་ཕམ་ཚུ་གི་བསླབ་སྟོན་ཐོག་ལུ་ རྩེདམོ་རྩེ་ནི་ཅ་ཆས་ཚུ་ བྱིན་འོང་ཟེར་ཨིན་པས། ཉེ་འདབས་ལུ་ཡོད་པའི་ ལྟེ་བའི་སློབ་སྟོན་པ་ཚུ་གིས་ ཟླ་རིམ་བཞིན་དུ་ ལ་རྟོག་འབད་བར་འགྱོ་ནི་ཨིན་པས།

སྤྱི་འོག་ ༤༧༢ ལུ་ ཨ་ལོ་གཅེས་སྐྱོང་དང་གོང་འཕེལ་ལྟེ་བ་ཡོད་མི་ལས་ སྤྱི་འོག་༥༦༧ ལུ་ མཐུན་རྐྱེན་ཚུ་མེདཔ་ད་ དེ་ཚུ་གི་གྲས་ལས་ ལྷན་ཁག་གིས་ ལྟེ་བ་༢༩༥ གཅིག་སྒྲིལ་འབད་དེ་ སློབ་རིམ་༥ ཚུན་གྱི་ སློབ་གྲྭ་བཟོ་ནི་འཆར་གཞི་ཡོདཔ་ཨིན་པས། མ་གཞི་ ལྷན་ཁག་གིས་སྤྱི་འོག་༢༠༧ ལུ་ ལྟེ་བ་གཞི་བཙུགས་འབད་ནི་གི་ འཆར་གཞི་སོད་ཡོད་རུང་ སྤྱི་འོག་ག་རའི་ནང་ ལྟེ་བ་དགོས་མཁོ་མེདཔ་སྦེ་ ཐོན་ཡོདཔ་ད་ ཁ་སོར་ཏེ་ཡོད་པའི་སྤྱི་འོག་ཚུ་ སློབ་གྲྭ་དང་བརྗེ་སོར་འབད་དེ་ཡོདཔ་ཨིན་པས། མཐུན་རྐྱེན་གྱི་སྤུས་ཚད་ངེས་བརྟན་བཟོ་ཐབས་ལུ་ སློབ་དཔོན་ཞབས་ཏོག་ལས་རིམ་འོག་ལུ་ ལྷན་ཁག་གིས་སློབ་དཔོན་དང་སློབ་ཕྲུག་གི་ཆ་ཚད་ སློབ་དཔོན་རེ་ལུ་ སློབ་ཕྲུག་༡༥ ལས་༨ ལུ་ མར་ཕབ་འབད་ནིའི་ ལས་རིམ་ཡོདཔ་ཨིན་པས།

ལྟེ་བའི་སློབ་སྟོན་པའི་ ཤེས་ཚད་ཡར་དྲག་གཏང་ནིའི་དོན་ལུ་ སྤ་རོ་མཐོ་རིམ་སློབ་གྲྭ་ནང་ ལྟེ་བའི་ཌེབ་ལོ་མའི་ལས་རིམ་གཞི་བཙུགས་འབད་ནི་ཨིནམ་ད་ ད་རེས་ ལྟེ་བའི་སློབ་སྟོན་པ་མང་ཤོས་ར་ སློབ་རིམ་༡༢ པ་ ཚང་མི་ཚུ་ཨིནམ་བཞིན་དུ་ སྦྱོང་བརྡར་ཡང་ བདུན་ཕྲག་༢ ལས་བརྒལ་མེདཔ་ལས་ ཁོང་ཆ་ཁྱབ་ལུ་ དགོས་མཁོ་ཅན་གྱི་ རིག་རྩལ་དང་ ཁྱད་རིག་ལྷན་ཐབས་ཞབས་ཏོག་ཚུ་མེདཔ་ཨིན་པས།

ད་རེས་ རྒྱལ་ཁབ་ནང་ ལྟེ་བ་༥༦༡ ཡོད་མི་ལས་ གཞུང་གི་ལྟེ་བ་༤༧༥ དང་སྒེར་གྱི་ལྟེ་བ་༦༢ ཡོདཔ་དང་ དེ་ལས་ ལཱ་འབད་སར་༢༠ དང་གཞུང་མིན་ལས་ཚོགས་ཀྱིས་ ལྟེ་བ་༤ ལག་ལེན་འཐབ་སྟེ་ ཡོད་པའི་གནས་ཚུལ།', 'Improving Early Childhood Care and Development centres in the 13th Plan

In the 13th Plan, the Ministry of Education and Skills Development has allocated a budget of Nu 700 million for Early Childhood Care and Development (ECCD) centres, with programmes to establish new centres and renovate existing ones. According to the ministry''s plan, priority will be given to building infrastructure and to providing play and learning facilities. The plan includes 100 new centres and the renovation of about 80 existing centres with proper facilities, which will help ensure facilities for children under five and improve the quality of education.

Moreover, since establishing centres is a challenge in places with low enrolment, the ministry also plans home-based (facilitation) programmes. Such an approach is meant to make ECCD services available to all children and to ensure that not a single child is left without the opportunity of education.

The ministry has allocated Nu 450 million for establishing new centres and for equipment, and will provide adequate infrastructure for play and learning in the centres.

In addition, Nu 330.5 million has been allocated for the professional development of ECCD facilitators and of comprehensive education facilitators. According to officials of the Department of School Education, the home-based programme will be carried out in chiwogs with low enrolment, where children will be given play materials under the guidance of their parents. Facilitators from nearby centres will visit every month to monitor them.

ECCD centres exist in 472 chiwogs, while 567 chiwogs lack such facilities; among them, the ministry plans to merge 295 centres into schools up to Class 5. The ministry had originally planned to establish centres in 207 chiwogs, but as it was found that not every chiwog needed a centre, the remaining chiwogs have been switched to schools. To ensure the quality of services, the ministry plans, under the teacher service programme, to reduce the ratio from 15 children to 8 children per facilitator.

To improve the qualifications of ECCD facilitators, an ECCD diploma programme will be established at Paro College of Education. At present most facilitators have only completed Class 12 and their training has not exceeded two weeks, so they lack the necessary skills and professional support.

At present there are 561 centres in the country: 475 government centres, 62 private centres, 20 workplace centres and 4 centres run by non-governmental organisations.', null, '[{"point": "Accuracy: the meaning of every sentence is kept, with no additions or omissions", "marks": 10}, {"point": "Completeness: all paragraphs and all figures (Nu 700 million, 450 million, 330.5 million, 100 and 80 centres, ratios, totals) translated correctly", "marks": 6}, {"point": "Clarity and natural English expression", "marks": 5}, {"point": "Correct spelling, grammar and punctuation", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'translation-dzongkha-to-english'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 25,
    2700, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Real translation passage extracted from a PDF with a faulty font and repaired automatically: compare it word by word with the RCSC PDF.", "Dzongkha text: please have a fluent Dzongkha reader check it before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Dzongkha category, Paper II", "year": 2024, "url": "https://rcsc.gov.bt/question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'T1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'T1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 10.0, 1 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 6.0, 2 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 9.0, 3 from me_q where key = 'T1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which Shechen Rabjam Rinpoche bestowed the Rinchen Terzod empowerment in Paro, Bhutan, from 29 May to 10 September 2024?', null, 'The present Shechen Rabjam Rinpoche is the 7th in his line.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Dzongkha category, Paper II", "year": 2024, "url": "https://rcsc.gov.bt/question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'V1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'V1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '9th Shechen Rabjam Rinpoche', false, 1), ('B', '8th Shechen Rabjam Rinpoche', false, 2), ('C', '10th Shechen Rabjam Rinpoche', false, 3), ('D', '7th Shechen Rabjam Rinpoche', true, 4)) as v(label, body, ok, pos) where me_q.key = 'V1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In which year did Her Majesty the Queen Mother Ashi Dorji Wangmo Wangchuck co-found Bhutan''s first literature festival, now ''Bhutan Echoes'', as a Bhutan-India initiative?', null, 'The festival (first called Mountain Echoes) began in 2010.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Dzongkha category, Paper II", "year": 2024, "url": "https://rcsc.gov.bt/question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'V2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'V2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2011', false, 1), ('B', '2013', false, 2), ('C', '2010', true, 3), ('D', '2012', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'On which National Day did His Majesty The Fifth Druk Gyalpo announce the Gelephu Mindfulness City project?', null, 'It was announced on 17 December 2023, the 116th National Day (counting from 1907).', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Dzongkha category, Paper II", "year": 2024, "url": "https://rcsc.gov.bt/question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'V3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'V3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '115th National Day', false, 1), ('B', '116th National Day', true, 2), ('C', '113th National Day', false, 3), ('D', '114th National Day', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Who is the author of the book ''Treasures of the Thunder Dragon: A Portrait of Bhutan''?', null, 'It was written by Her Majesty the Queen Mother Ashi Dorji Wangmo Wangchuck (2006).', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Dzongkha category, Paper II", "year": 2024, "url": "https://rcsc.gov.bt/question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'V5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'V5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ashi Dorji Wangmo Wangchuck', true, 1), ('B', 'Dr. Karma Phuntsho', false, 2), ('C', 'Dasho Karma Ura', false, 3), ('D', 'Michael Aris', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which country won UEFA Euro 2024?', null, 'Spain beat England 2-1 in the final in Berlin.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-world'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Dzongkha category, Paper II", "year": 2024, "url": "https://rcsc.gov.bt/question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'V6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'V6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Netherlands', false, 1), ('B', 'Spain', true, 2), ('C', 'England', false, 3), ('D', 'France', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Who appoints the Chairperson and commissioners of the Royal Civil Service Commission?', null, 'Under the Constitution (Article 26) the Druk Gyalpo appoints them.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Dzongkha category, Paper II", "year": 2024, "url": "https://rcsc.gov.bt/question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'V8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'V8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The Druk Gyalpo', true, 1), ('B', 'The Chief Justice of Bhutan', false, 2), ('C', 'The Prime Minister', false, 3), ('D', 'The Chairperson of the National Council', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Who declared Dzongkha the national language of Bhutan?', null, 'Dzongkha was declared the national language under the Third Druk Gyalpo, Jigme Dorji Wangchuck (1971).', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Dzongkha category, Paper II", "year": 2024, "url": "https://rcsc.gov.bt/question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'V10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'V10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The First Druk Gyalpo', false, 1), ('B', 'The Fourth Druk Gyalpo', false, 2), ('C', 'The Second Druk Gyalpo', false, 3), ('D', 'The Third Druk Gyalpo', true, 4)) as v(label, body, ok, pos) where me_q.key = 'V10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'How many elected members does the National Assembly of Bhutan have?', null, 'The National Assembly has 47 members, one from each constituency.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'V11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '47', true, 1), ('B', '72', false, 2), ('C', '25', false, 3), ('D', '52', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In which year did Bhutan hold its first National Assembly elections under parliamentary democracy?', null, 'The first National Assembly elections were held on 24 March 2008.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'V12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2013', false, 1), ('B', '2007', false, 2), ('C', '2008', true, 3), ('D', '2005', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Constitution of the Kingdom of Bhutan was adopted on:', null, 'It was adopted on 18 July 2008.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'V13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '21 February 2006', false, 1), ('B', '18 July 2008', true, 2), ('C', '17 December 2007', false, 3), ('D', '1 November 2008', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V13';
commit;
