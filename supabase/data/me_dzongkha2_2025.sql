-- ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language-current-affairs'), 'comprehension', 'Comprehension' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language-current-affairs'), 'current-affairs-bhutan', 'Current affairs: Bhutan' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language-current-affairs'), 'current-affairs-culture', 'Current affairs: culture' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language-current-affairs'), 'current-affairs-world', 'Current affairs: world' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language-current-affairs'), 'essay-education-and-national-development', 'Essay: education and national development' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language-current-affairs'), 'essay-technology-and-society', 'Essay: technology and society' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language-current-affairs'), 'letter-writing-formal-letters', 'Letter writing: formal letters' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language-current-affairs'), 'translation-dzongkha-to-english', 'Translation: Dzongkha to English' on conflict (subject_id, slug) do nothing;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-dzongkha-2');
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-dzongkha-2'), 1, 'Section I: Essay writing', 'essay', 2, 25, 1, 'BCSE 2025 Main Examination, Dzongkha category, Paper II');
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-dzongkha-2'), 2, 'Section II: Letter writing', 'long_answer', 2, 20, 1, 'BCSE 2025 Main Examination, Dzongkha category, Paper II');
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-dzongkha-2'), 3, 'Section III: Comprehension', 'passage', 1, 20, null, 'BCSE 2025 Main Examination, Dzongkha category, Paper II');
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-dzongkha-2'), 4, 'Section IV: Translation (Dzongkha to English)', 'translation', 1, 25, null, 'BCSE 2025 Main Examination, Dzongkha category, Paper II');
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-dzongkha-2'), 5, 'Section V: Current affairs', 'mcq', 10, 1, null, 'BCSE 2025 Main Examination, Dzongkha category, Paper II');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'essay', 'Write an essay of about 300-350 words on the following topic.

The colleges under the Royal University of Bhutan offer courses in diverse fields such as engineering, sciences, arts, Bhutanese language and literature, and social sciences.

Discuss how these courses can prepare graduates to meaningfully contribute to the development of Gelephu Mindfulness City in the future. (25 marks)', 'Graduates of the Royal University: builders of Gelephu Mindfulness City

Gelephu Mindfulness City (GMC), announced by His Majesty The King on National Day in 2023, is meant to become a green, mindful and economically vibrant city that creates opportunities for young Bhutanese. A city of this scale cannot be built by foreign investors and experts alone. Its success depends on Bhutanese graduates, and the colleges of the Royal University of Bhutan already offer the range of courses it needs.

Graduates in engineering and the sciences will be needed first. Civil and electrical engineers can design roads, bridges, buildings and power systems that use clean hydropower and solar energy. Information technology graduates can build the digital systems that run a modern city, from online services to data centres. Science graduates can monitor air, water and forests so that the city grows without harming its rich natural environment.

GMC is meant to be mindful, not just modern. Graduates in Bhutanese language and literature, arts and culture can make sure that our identity is visible in its architecture, festivals and education. They can guide visitors, translate, teach, and create books, films and art that show the values of Gross National Happiness to the world.

Social science graduates have an equally important role. Economists, planners and business graduates can attract investment, run enterprises and manage public finances. Graduates in sociology, psychology and social work can support the families who move to the new city with counselling, health and community services.

However, a degree alone is not enough. Graduates must bring integrity, discipline and a willingness to keep learning new skills, especially in technology and foreign languages. They should be ready to start their own enterprises instead of waiting only for government jobs.

In conclusion, the courses offered by our colleges give graduates the knowledge GMC needs. If they combine that knowledge with strong values and hard work, our graduates can turn the vision of a mindful city into reality and build a better future for the nation.', null, '[{"point": "Introduction: what Gelephu Mindfulness City (GMC) is and why it needs skilled Bhutanese graduates", "marks": 3}, {"point": "Engineering and sciences: infrastructure, green energy, technology and sustainable building", "marks": 5}, {"point": "Arts, Bhutanese language and literature: culture, identity, mindfulness and tourism in the city", "marks": 5}, {"point": "Social sciences: planning, governance, economics, social services and community wellbeing", "marks": 5}, {"point": "What graduates themselves must add: values, entrepreneurship, lifelong learning, discipline", "marks": 4}, {"point": "Conclusion that links the courses back to the vision of GMC", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'essay-education-and-national-development'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 25,
    2700, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-II.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'E1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 10.0, 1 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 6.0, 2 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 9.0, 3 from me_q where key = 'E1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'essay', 'Write an essay of about 300-350 words on the following topic.

According to the Bhutan Media Foundation, Bhutanese spend an average of 163 minutes online each day, which is higher than the global average of 145 minutes per day. Intensive social media users include Generation Z (ages 13-29), Millennials (ages 30-44), university graduates, and employed citizens, each spending four or more hours daily on these platforms.

Discuss the impact of spending significant time on social media on mental health, time management, and social connections in the era of rapid technological advancement. (25 marks)', 'Living online: the cost of 163 minutes a day

According to the Bhutan Media Foundation, Bhutanese spend an average of 163 minutes online every day, more than the global average of 145 minutes. Young people, university graduates and employed citizens often spend four hours or more on social media. In an age of rapid technological change, this habit is shaping our mental health, our use of time and our relationships.

The effect on mental health is mixed. Social media lets people find information, share their talents and look for support. However, scrolling through pictures of other people''s perfect lives can make users feel that they are not good enough. Many young people suffer from anxiety, loneliness and loss of sleep because they stay online late into the night, and cyberbullying can cause deep hurt.

Time management also suffers. A quick look at a phone often turns into an hour. Students lose time meant for study, and employees are distracted at work, which lowers productivity. Constant notifications make it difficult to concentrate on one task for long, and people postpone important work.

Social connections are affected in two ways. Social media helps families stay in touch with relatives studying or working in Australia and elsewhere, and it brings people with common interests together. Yet at home, family members often sit together while each looks at a separate screen. Face-to-face conversation, visits to neighbours and community activities are becoming less common.

Technology itself is not the problem; the way we use it is. Each person can set time limits, switch off notifications and keep phones away at meals and before sleep. Schools and parents can teach digital literacy and encourage sports, reading and volunteering.

In conclusion, social media can inform and connect us, but too much of it harms our minds, our time and our relationships. If we use it mindfully, in the spirit of Gross National Happiness, we can enjoy its benefits without losing what matters most.', null, '[{"point": "Introduction using the figures given (163 minutes against a global 145; heavy users)", "marks": 3}, {"point": "Mental health: comparison, anxiety, sleep loss, cyberbullying; and the positive side (support, information)", "marks": 6}, {"point": "Time management: distraction, lost study and work time, procrastination", "marks": 5}, {"point": "Social connections: staying in touch abroad versus weaker face-to-face relationships at home", "marks": 5}, {"point": "Balanced suggestions: limits, digital literacy, offline activities, role of families and schools", "marks": 3}, {"point": "Conclusion", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'essay-technology-and-society'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 25,
    2700, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-II.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'E2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 10.0, 1 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 6.0, 2 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 9.0, 3 from me_q where key = 'E2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'Write a letter of about 150 words on the following topic.

Your name is Sonam, an educated farmer from Mendrelgang Gewog, Punakha Dzongkhag. As a farmer, you are initiating a new agricultural project in your gewog.

Write a letter to the Dzongkhag Agriculture and Livestock Officer setting out a clear problem statement, well-defined objectives, methods and a comprehensive budget for your new project. (20 marks)', 'Sonam
Mendrelgang Gewog
Punakha Dzongkhag

12 March 2025

The Dzongkhag Agriculture and Livestock Officer
Punakha Dzongkhag Administration
Punakha

Subject: Proposal for a community vegetable greenhouse project in Mendrelgang

Sir/Madam,

I am an educated farmer from Mendrelgang Gewog and I would like to submit a proposal for a new agricultural project.

Problem: Farmers in our gewog grow vegetables only in summer. In winter, vegetables are brought from outside at high prices, and many of our young people remain without work.

Objectives: (1) to grow vegetables throughout the year; (2) to reduce dependence on imported vegetables; (3) to create jobs for ten young people.

Methods: We will form a group of ten farmers, build five greenhouses with drip irrigation, use organic manure and sell the produce at the Punakha and Wangdue markets.

Budget: greenhouses Nu. 250,000; drip irrigation Nu. 60,000; seeds and manure Nu. 40,000; training Nu. 30,000. Total Nu. 380,000. Our group will contribute labour and Nu. 50,000.

I request your office to support us with technical guidance and funding. I look forward to your kind consideration.

Yours faithfully,
Sonam', null, '[{"point": "Correct formal format: sender''s address, date, receiver''s address, subject, salutation, closing and name", "marks": 4}, {"point": "Clear problem statement", "marks": 4}, {"point": "Well-defined objectives", "marks": 4}, {"point": "Methods: how the project will be carried out", "marks": 4}, {"point": "Budget with items and a total, and a polite request", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'letter-writing-formal-letters'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-II.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'L1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 8.0, 1 from me_q where key = 'L1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 5.0, 2 from me_q where key = 'L1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 7.0, 3 from me_q where key = 'L1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'Write a letter of about 150 words on the following topic.

You are Dorji, the student counsellor of the College of Science and Technology, Phuntsholing, Chukha. Your college is organizing a symposium on "Buddhism in the 21st Century" during winter vacation.

Write a letter to the President of your college requesting permission to participate. In your letter, explain why you are interested in organizing this event, and explain its importance to the students and college, and how it can benefit the society. (20 marks)', 'Dorji
Student Counsellor
College of Science and Technology
Phuntsholing, Chukha

2 December 2025

The President
College of Science and Technology
Phuntsholing, Chukha

Subject: Request for permission to take part in organising the symposium on "Buddhism in the 21st Century"

Respected Sir/Madam,

I would like to request your kind permission to participate in organising the college symposium on "Buddhism in the 21st Century" during the winter vacation.

As the student counsellor, I meet many students who face stress, anxiety and confusion about their future. Buddhist teachings on mindfulness, compassion and the nature of the mind offer practical ways to handle these problems, so I am keen to help bring them to our students.

The symposium will help students see that science and Buddhism can complement each other, build their values and confidence, and show that our college cares for the wellbeing of its students as well as their academic results.

It will also benefit society, because graduates who are mindful and ethical will become better engineers, leaders and citizens, and the event will promote our culture and Gross National Happiness.

I hope you will kindly grant me permission.

Yours faithfully,
Dorji', null, '[{"point": "Correct formal format: addresses, date, subject, salutation, closing and name", "marks": 4}, {"point": "Clear request for permission", "marks": 3}, {"point": "Why the writer is interested in organising the event", "marks": 4}, {"point": "Importance to the students and the college", "marks": 5}, {"point": "Benefit to society", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'letter-writing-formal-letters'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-II.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'L2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 8.0, 1 from me_q where key = 'L2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 5.0, 2 from me_q where key = 'L2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 7.0, 3 from me_q where key = 'L2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'passage', 'Read the passage below and then answer the questions that follow.

The Future of the Buddhadharma: Dzongsar Khyentse Rinpoche

Whenever we are talking about the future of Buddhism, I think we need to talk about a few things. One - I have been trying to get the right word, and the best I can come up with is ''hillbilly Buddhist''. By this, I am talking about people who don''t even know the Four Noble Truths, though they kind of know who the Buddha is. They may not know where the Buddha came from, but they are Buddhist by birth, culturally Buddhist, born in a Buddhist place; they are not intellectual. We have been paying attention to academics, and there is a lot of activity on science and Buddhism, psychology and Buddhism, Buddhist institutes, Buddhist scholarships. But I think those hillbilly Buddhists are so important because where do you get cream if you don''t have milk? They are the milk.

Connected to hillbilly Buddhists, we need to be aware of geopolitics. Of course, ours is not a political organization, of course not, but politics are part of our life. The water you drink, the food you eat, will always have some sort of political aspect; it''s something that you cannot avoid. And geopolitics is very big, and it''s getting more astute, more pronounced, sharper. And it''s just going to get - ''worse'' is maybe not the right word - it''s just going to get quicker and whatever...

And religion plays an important role because, as I have been saying recently, identity crisis is on the rise, and it''s just going to rise more and more. We now know why the Heart Sutra is so important, because here, actually, Buddha is saying there is no identity - if only people can get that. Identity crisis is going to be really, really strong. And religion always fuels that identity crisis. Politicians will use it. Nations will use this. Yes, I rejoice that the United States government recognized Buddha Jayanti recently. I rejoice in this very much, but the intention of the United States government may not necessarily be to propagate the Buddha dharma. But that is fine. I think the stakeholders need to know that, and if we can reap profit and not become the tool of politics, I think we should. Whatever profit - geographical profit, space profit, money profit, influence profit - we should.

And then also, when we talk about the future of Buddhism, I think demography and population demographics are all related. Just the other day I was going to Bloomingdale''s. Right outside there were so many Sherpas, so many Nepali - like food delivery workers - I was thinking, ''Wow!'' It can have a positive effect too. For instance, Buddhism in Australia: the first-ever influence of Buddhism was brought by Chinese. The Chinese people brought a Guanyin statue. That''s how the religion sort of ends up moving around. Not necessarily always just because a Rinpoche taught, or a Rinpoche set up a dharma center. These are important - these hillbilly Buddhists are so important.

But, for instance, as a Bhutanese, I am thinking that a lot of Bhutanese have moved to Australia and Canada. We are talking about 100,000. And they are all educated Bhutanese. And they are sort of hillbilly Buddhists. And they are going to have their children, and most of them may never go back to Bhutan. And their children are going to be exposed to a different culture - different altogether - a different world. And they may not speak their language, they may not understand Buddha dharma, and they may end up becoming Mormon, whatever - it doesn''t matter, this is what happens.

And then connected to that, migration. So basically what I am saying is, when we are talking about the future of Buddhism, I think we should also be aware of how people are migrating and to where. For instance, I am going to New York in a few weeks, and there are a lot of Bhutanese there, a lot of Himalayan people. And they are going to be migrating there, most likely. So, should we, Khyentse Foundation, have Sunday schools there for these people, who probably are there for economic reasons, not because of anything else? And when they go there, I am sure they also have this insecurity of losing their identity, and a big part of this identity, for them, is Buddha dharma. But there is no facility, so should we step in?

And again, very related, Taiwan. Until recently, it was one of the strongest Buddhist-influenced places, but from what I hear, people going to the Buddhist temples, people becoming monks and nuns - the ratio is dwindling. And perhaps because the local Taiwanese Mahayana masters are not really knowing how to package it. So maybe this is where we, Khyentse Foundation - not like going in and as Buddhists - maybe we can assist with this. And so on and so forth.

Question A (5 x 1 = 5 marks)
Write the correct option for each question, for example: 1 (A).

1. The term ''hillbilly Buddhist'' primarily refers to
(A) culturally born Buddhists with little formal knowledge.  (B) rural monks and nuns.  (C) Buddhism rejecters.  (D) Buddhist scholars.

2. What role does geopolitics play in the future of Buddhism, as described in the passage?
(A) Geopolitics affects daily life and influences how Buddhism is perceived and practised.  (B) Buddhist leaders always avoid any political involvement.  (C) Geopolitics is irrelevant to Buddhism and its practice.  (D) Buddhism controls all political decisions worldwide.

3. The passage suggests that an ''identity crisis'' is rising because
(A) religion often fuels identity conflicts, which politicians can exploit.  (B) the Heart Sutra promotes a strong fixed identity.  (C) Buddhism clearly defines people''s identities.  (D) people have lost interest in all religions.

4. Who brought the first influence of Buddhism to Australia according to the passage?
(A) Bhutanese monks  (B) Tibetan Rinpoches  (C) Nepalese Sherpas  (D) Chinese people

5. The speaker shows how Buddhism spreads beyond formal teachings and dharma centres with the example of
(A) Bhutanese monks establishing monasteries abroad.  (B) Chinese people bringing a Guanyin statue to Australia.  (C) Taiwanese masters teaching meditation online.  (D) Nepalese Sherpas opening Buddhist schools.', '1 (A)  2 (A)  3 (A)  4 (D)  5 (B)

1: hillbilly Buddhists are "Buddhist by birth, culturally Buddhist" who "don''t even know the Four Noble Truths".
2: "politics are part of our life... the water you drink, the food you eat, will always have some sort of political aspect".
3: "religion always fuels that identity crisis. Politicians will use it."
4: "the first-ever influence of Buddhism was brought by Chinese".
5: "The Chinese people brought a Guanyin statue. That''s how the religion sort of ends up moving around."', null, '[{"point": "1 (A)", "marks": 1}, {"point": "2 (A)", "marks": 1}, {"point": "3 (A)", "marks": 1}, {"point": "4 (D)", "marks": 1}, {"point": "5 (B)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-II.pdf"}}'::jsonb, 'me-dzongkha-2-2025b1-s3-cp', 1, null)
  returning id
)
insert into me_q select 'S3A', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 2.0, 1 from me_q where key = 'S3A';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 1.0, 2 from me_q where key = 'S3A';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 2.0, 3 from me_q where key = 'S3A';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'passage', 'How does geopolitics influence the practice and future of Buddhism according to the speaker? Explain with reference to identity crisis and political intentions. (5 marks)', 'According to the speaker, Buddhism cannot stay away from geopolitics, because politics is part of everyday life: even the water we drink and the food we eat have a political side, and geopolitics is becoming sharper and faster.

He links this to a growing identity crisis. People are increasingly anxious about who they are, and religion "always fuels that identity crisis", so politicians and nations will use religion for their own purposes. This is why he finds the Heart Sutra''s teaching that there is no fixed identity so important.

He gives the example of the United States government recognising Buddha Jayanti. He welcomes it, but warns that its intention may not be to spread the dharma. Buddhists should be aware of such intentions, accept whatever benefit (money, space, influence) they can gain, but never become a tool of politics.', null, '[{"point": "Politics is part of daily life and cannot be avoided; geopolitics is growing sharper and faster", "marks": 2}, {"point": "Identity crisis is rising and religion fuels it; politicians and nations use religion", "marks": 2}, {"point": "Governments may support Buddhism (US and Buddha Jayanti) for their own intentions; Buddhists should benefit without becoming a tool of politics", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-II.pdf"}}'::jsonb, 'me-dzongkha-2-2025b1-s3-cp', 2, null)
  returning id
)
insert into me_q select 'S3B', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 2.0, 1 from me_q where key = 'S3B';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 1.0, 2 from me_q where key = 'S3B';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 2.0, 3 from me_q where key = 'S3B';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'passage', 'Explain the speaker''s concern about Bhutanese people migrating to countries like Australia and other countries. How might this affect the future of Buddhism and Bhutanese culture? (5 marks)', 'The speaker is concerned that about 100,000 educated Bhutanese have moved to Australia and Canada, and that most of them may never return. They are "hillbilly Buddhists", Buddhist by culture rather than by study.

His main worry is about their children. Growing up in a completely different culture, the children may not speak Dzongkha or their parents'' language, may not understand the Buddha dharma and may even adopt another religion.

This could weaken the future of Buddhism, because the ordinary cultural Buddhists he calls "the milk" are the base from which the religion grows. It could also weaken Bhutanese culture and identity, as language, customs and values are not passed on. In my view, this is why he asks whether organisations like the Khyentse Foundation should start Sunday schools abroad, and why families and Bhutanese communities abroad should keep teaching their children their language and faith.', null, '[{"point": "About 100,000 educated Bhutanese have moved to Australia and Canada; most may never return", "marks": 1}, {"point": "Their children grow up in a different culture and may lose the language and the dharma, or change religion", "marks": 2}, {"point": "Effect: fewer people carrying Buddhism and Bhutanese culture forward; loss of identity; need for support such as Sunday schools (own view)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-II.pdf"}}'::jsonb, 'me-dzongkha-2-2025b1-s3-cp', 3, null)
  returning id
)
insert into me_q select 'S3C', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 2.0, 1 from me_q where key = 'S3C';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 1.0, 2 from me_q where key = 'S3C';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 2.0, 3 from me_q where key = 'S3C';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'passage', 'In what ways can contemporary Buddhism adapt to rapid technological change without compromising its fundamental teachings and cultural traditions? Support your answer with ideas from the passage and your own views. (5 marks)', 'The passage suggests that Buddhism declines when it is not presented in a way people can relate to: in Taiwan, temple attendance is dwindling perhaps because masters do not know "how to package it". The speaker also wants to reach ordinary and migrant Buddhists, for example through Sunday schools abroad.

Technology can help with both. Teachings can be shared through online classes, short videos, podcasts and mobile apps in simple English and in Dzongkha, so that young people and Bhutanese living abroad can learn wherever they are. Meditation apps and social media can show how mindfulness and compassion help with stress and modern life.

However, the core must not change. Teachings should come from qualified teachers, practice and ethics should matter more than popularity, and rituals, language and festivals should be preserved. Technology should be the vehicle, not the message.', null, '[{"point": "From the passage: the teaching must be ''packaged'' well (Taiwan example) and reach ordinary and migrant Buddhists (e.g. Sunday schools)", "marks": 2}, {"point": "Own views: online teachings, apps, videos and social media in simple language and local languages", "marks": 2}, {"point": "Keep the core: authentic teachers, practice and ethics, culture and language preserved", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-II.pdf"}}'::jsonb, 'me-dzongkha-2-2025b1-s3-cp', 4, null)
  returning id
)
insert into me_q select 'S3D', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 2.0, 1 from me_q where key = 'S3D';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 1.0, 2 from me_q where key = 'S3D';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 2.0, 3 from me_q where key = 'S3D';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'translation', 'Read the following passage carefully and translate it into English. (25 marks)

སློབ་དཔོན་ཚུ་ དགོངས་ཞུ་འབད་ནི་ལས་ ག་དེ་སྦེ་ བསྒྱུར་བཅོས་འབད་ཚུགས་ག?

༉ སྤྱི་ལོ་༢༠༢༤ ལུ་ སློབ་དཔོན་དགོངས་ཞུ་འབད་མི་ ཡར་སེང་འགྱོ་མི་དེ་གིས་ ང་བཅས་རའི་ ཤེས་རིག་གི་ལམ་ལུགས་ནང་ དུམ་ གྲ་ཅིག་ འཛོལ་བ་ཞུགས་ཡོད་པའི་མངོན་གསལ་བྱུང་ཡོདཔ་ད་ ལོ་གཅིག་ནང་ སློབ་དཔོན་ ༡,༡༩༣ གྱིས་ཤེས་རིག་གི་ལཱ་ནང་ལས་ དགོངས་ཞུ་འབད་མི་དེ་ སྤྱི་ལོ་༢༠༢༣ དང་ཕྱདཔ་ད་ གསུམ་ལྟབ་སྦེ་ ཡར་འཕོར་སོང་ཡོདཔ་ལས་ དེ་འཕོ་ལས་ གྲོས་ཐག་གཅད་ དགོ་པའི་གནས་སྟངས་ཅིག་ཨིན་མས། དགོངས་ཞུ་འབད་མིའི་གྲས་ལས་ ཁག་འབག་སློབ་དཔོན་ ༦༤༨ དང་ དུས་རྒྱུན་གྱི་ལས་ བྱེདཔ་ ༥༤༥ ཡོདཔ་ད་ མི་མང་གི་སློབ་གྲྭ་ཚུ་ནང་ དགོངས་ཞུའི་ཚད་གཞི་ བརྒྱ་ཆ་ ༦.༩༠ འབད་མི་དེ་ ཧེ་མ་དང་ཕྱོདཔ་ད་ མཐོ་ ཤོས་ཅིག་ཨིནམ་ད་ དེ་ཡང་ ཟླཝ་རེ་ནང་ སློབ་དཔོན་ ༩༩ དེ་ཅིག་གིས་ དགོངས་ཞུ་འབད་མི་ལུ་ལྟཝ་ད་ འདས་པའི་ལོ་ ༥ འི་ ནང་ སློབ་དཔོན་ཚུ་གིས་ དགོངས་ཞུ་འབད་མིའི་གྱངས་ཁ་དེ་ མཐོ་ཤོས་ཅིག་ཨིན་མས། 

སྤྱི་ལོ་ ༢༠༢༠ ལུ་ སློབ་དཔོན་ ༡༦༣ དང་ སྤྱི་ལོ་༢༠༢༡ ལུ་ ༣༥༣ སྤྱི་ལོ་ ༢༠༢༢ ལུ་ ༤༧༨ དེ་ལས་ སྤྱི་ལོ་ ༢༠༢༣ ལུ་ ༣༧༡ གིས་ དགོངས་ཞུ་འབད་ཡོདཔ་ཨིན་པས། སྤྱི་ལོ་༢༠༢༤ ལུ་ སློབ་དཔོན་མང་རབས་ཅིག་གིས་ དགོངས་ཞུ་འབད་མའི་གནས་ སྟངས་དེ་ ཚབས་ཆེན་ ཅིག་ཨིན་རུང་ གནས་སྡུད་དེ་གིས་ གནས་ཚུལ་གྱི་ཆ་ཤས་ཅིག་རྐྱངམ་གཅིག་ སྟོན་དོ་ཡོདཔ་ད་ དགོངས་ཞུ་ འབད་བའི་རྒྱབ་ལས་ སློབ་དཔོན་ཚུ་གིས་ ཁོང་གི་རེ་བ་དང་ དགོས་མཁོ་ཚུ་འགྲུབ་ནི་ལུ་ རྒྱབ་སྐྱོར་མེད་པའི་ལམ་ལུགས་དེ་ལུ་ སེམས་ཕམ་བྱུང་སྟེ་ཡོད་ཟེར་ སྟོན་དོ་ཡོདཔ་ཨིན་མས། ང་བཅས་རའི་ སློབ་དཔོན་མང་རབས་ཅིག་ གནད་དོན་ག་ཅི་སྦེ་ ཐོན་འགྱོཝ་ ཨིན་ན? དེ་ཡང་ ལཱ་གི་ལྗིད་ཚད་ལྕི་མི་དང་ ཚེ་གཡོག་གི་གནས་ཚད་ ཡར་དྲག་འགྱོ་ནི་ལུ་ཐོགས་ལུས་མི་ ངོས་འཛིན་མེད་མི་ལུ་ བརྟེན་ཨིན་མས། 

དེ་ལས་ གྲོང་གསེབ་ཀྱི་ས་གནས་ཚུ་ནང་ གནས་སྤོར་བཏང་མི་དེ་གིས་ གནས་སྟངས་སྐྱོ་དྲགས་ བཟོ་དོ་ཡོདཔ་སྦེ་ ཨིན་མས། སློབ་ དཔོན་ཚུ་ འཕལ་འཕལ་སྦེ་ར་ དཔེ་ཆ་སྟོན་ནི་དང་ གྲོས་སྟོན་འབད་ནི་ དེ་ལས་ བདག་སྐྱོང་གི་འགན་ཁུར་ཚུ་ སྣ་མང་འབག་དགོཔ་ ལས་ ཁོང་ལུ་ ལཱ་གི་དཀའ་ངལ་བྱུང་དོ་ཡོད་པའི་ཁར་ བརྩི་མཐོང་ཆུང་སུ་ཅིག་ལས་མེདཔ་ཨིན་མས། གྲོང་གསེབ་ཀྱི་ས་ཁོངས་ཚུ་ནང་ གཞི་རྟེན་མཐུན་རྐྱེན་ཚུ་ ལེགས་ཤོམ་མེད་མི་དང་ བཟའ་ཚང་ཚུ་དང་ ཐག་རིང་ས་སྦེ་ སྤྲོད་དགོཔ་བྱུང་མི་ལུ་བརྟེན་ དཀའ་ངལ་དེ་ ཧེང་སྐལ་ར་ སྦོམ་འགྱོ་དོ་ཡོདཔ་ད་ དེ་དང་གཅིག་ཁར་ ལས་སྡེ་གཞན་ཚུ་དང་ ཡང་ན་ རྒྱལ་ཁབ་གཞན་ཁར་ འོང་འབབ་ལེགས་ ཤོམ་འཐོབ་ནིའི་ གོ་སྐབས་ཡོདཔ་ལས་ སློབ་དཔོན་གྱི་ལཱ་འབད་ནི་དེ་ གདམ་ཁ་ལེགས་ཤོམ་ཅིག་སྦེ་ མི་མཐོང་དོ་ཡོདཔ་ཨིན་མས། 

སློབ་གྲྭ་ཚུ་ནང་ སློབ་དཔོན་ལངམ་སྦེ་མེད་ནི་དེ་གིས་ སློབ་ཁང་ནང་ སློབ་ཕྲུག་གི་གྱངས་ཁ་ཡར་འཕར་འགྱོ་མི་དང་ ཤེས་རིག་གི་སྤུས་ ཚད་ མར་བབས་འགྱོ་དོ་ཡོདཔ་ད་ དམིགས་བསལ་དུ་ གྲོང་གསེབ་ཀྱི་ས་ཁོངས་ཚུ་ནང་ སློབ་དཔོན་མ་ལང་པའི་ དཀའ་ངལ་སྦོམ་ བྱུང་དོ་ཡོདཔ་ལས་ སློབ་ཕྲུག་ཚུ་ལུ་ ཤེས་རིག་གི་ཁྱད་པར་ སྦོམ་བཟོ་ནིའི་ཉེན་ཁ་འདུག། 

ལྷག་ལུས་སློབ་དཔོན་ཚུ་ལུ་ དེ་གིས་ ང་བཅས་རའི་ ལཱ་གི་ལྗིད་ཚད་ ཡར་སེང་འགྱོ་བའི་དཀའ་སྡུག་འབྱུང་ནིའི་ཉེན་ཁ་ཡོདཔ་ད་ ཤེས་རིག་ལམ་ལུགས་ཀྱི་གཞི་འགྱམ་དེ་ ཉམས་སུ་བཟོ་སྟེ་ དུས་ཚོད་འ་ནེམ་ཅིག་ཁར་ རྒྱལ་ཁབ་ཀྱི་མི་སྡེ་དཔལ་འབོར་གོང་འཕེལ་ལུ་ གནོད་ཉེན་འབྱུང་ནི་ཨིན་མས། ལམ་ལུགས་འདི་ བསྒྱུར་བཅོས་འབད་དགོ་པ་ཅིན་ བློ་ཁོག་སྦོམ་བཙུགས་ཏེ་ ལམ་ལུགས་ཀྱི་ བསྒྱུར་ བཅོས་ཚུ་འབད་དགོཔ་མ་ཚད་ སློབ་དཔོན་ཚུ་གི་དངུལ་ཕྱོགས་ཡང་ རྒྱལ་ཁབ་ཀྱི་མ་འོངས་སྒྲིང་སྒྲིང་བཟོ་ནི་ལུ་ དོ་འགྲན་ཅན་སྦེ་བཟོ་དགོཔ་ད་ འགན་འཁྲི་སྦོམ་འབག་དོ་ཡོདཔ་ལས་ དེ་ཡང་ སློབ་དཔོན་ཚུ་གིས་ ངེས་བརྟན་བལྟ་དགོཔ་འདུག། གྲོང་གསེབ་ཀྱི་ས་ ཁོངས་ཚུ་ནང་ གནས་སྤོར་བཏང་མི་ཚུ་ལུ་ སེམས་ཤུགས་མཐུན་རྐྱེན་ཚུ་བྱིན་དགོཔ་ད་ དེ་ཡང་ ཁྱིམ་གྱི་འཐུས་བྱིན་ནི་དང་ གནས་ ཡུན་མར་ཕབ་འབད་ནི་ དེ་ལས་ གཞི་རྟེན་མཐུན་རྐྱེན་ཚུ་ ལེགས་ཤོམ་བཟོ་དགོ་པའི་ཁར་ གོ་སྐབས་ཡར་སེང་དང་ ཁྱད་རིག་གི་གོ་ སྐབས་ཚུ་ བྱིན་ནིའི་དོན་ལུ་ ལཱ་གཡོག་གི་ལམ་ལུགས་ཚུ་ བསྐྱར་ཞིབ་འབད་དགོཔ་འདུག། ལྷག་པར་དུ་ ཁྱད་རིག་གོང་འཕེལ་གཏང་ ནི་ལུ་ གཙོ་རིམ་བཟུང་དགོཔ་ད་ དུས་རྒྱུན་གྱི་ སྦྱོང་བརྡར་དང་ གོ་བསྡུར་ཞལ་འཛོམས་ དེ་ལས་ དེང་སང་གི་ སློབ་སྟོན་ལག་ཆས་ ཚུ་ ལག་ལེན་འཐབ་ཚུགས་པ་ཅིན་ སློབ་དཔོན་ཚུ་ལུ་ ལྕོགས་གྲུབ་ཅན་བཟོ་ནི་དང་ ལཱ་གཡོག་ནང་འབད་རུང་ ངལ་རངས་བསྐྱེད་ནིའི་ ཕན་ཁྱད་འདུག།', 'How can teacher resignations be addressed?

In 2024, the rising number of teachers resigning showed that a crack has appeared in our education system. In one year, 1,193 teachers left the teaching profession, three times as many as in 2023, a situation that calls for decisions to be taken. Of those who resigned, 648 were regular teachers and 545 were on contract. The resignation rate of 6.90 percent in public schools is the highest so far: about 99 teachers resigned every month, the highest number of teacher resignations in the past five years.

In 2020, 163 teachers resigned; in 2021, 353; in 2022, 478; and in 2023, 371. Although the resignation of so many teachers in 2024 is serious, the data tells only part of the story: teachers say they resigned because they were frustrated with a system that does not support their hopes and needs. Why are so many of our teachers leaving? It is because of heavy workloads and a lack of recognition, which keep their standard of living from improving.

Transfers to rural places are also making the situation worse. Teachers often have to teach, counsel and carry many administrative responsibilities at short notice, so they face difficulties at work and receive little respect. In rural areas, poor infrastructure and having to live far away from their families make these difficulties even greater. At the same time, with chances of earning a better income in other sectors or abroad, teaching is not seen as a good choice.

The shortage of teachers in schools is increasing the number of students in each class and lowering the quality of education. The shortage is especially severe in rural areas, so there is a risk of a wide gap in the education students receive.

For the teachers who remain, the workload is likely to increase, which could weaken the foundation of the education system and, over time, harm the social and economic development of the nation. To change the system, bold reforms are needed, and teachers'' salaries must be made competitive, since teachers carry a great responsibility in building the nation''s future. Teachers transferred to rural areas should be given incentives such as housing allowances, shorter postings and better infrastructure, and employment policies should be reviewed to give opportunities for promotion and professional growth. Above all, professional development should be a priority: regular training, workshops and the use of modern teaching tools would make teachers more capable and bring them satisfaction in their work.', null, '[{"point": "Accuracy: the meaning of every sentence is kept, with no additions or omissions", "marks": 10}, {"point": "Completeness: all paragraphs and all figures (years, numbers, percentages) translated correctly", "marks": 6}, {"point": "Clarity and natural English expression", "marks": 5}, {"point": "Correct spelling, grammar and punctuation", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'translation-dzongkha-to-english'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 25,
    2700, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Real translation passage extracted from a PDF with a faulty font and cleaned automatically: compare it word by word with the RCSC PDF.", "Dzongkha text: please have a fluent Dzongkha reader check it before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-II.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'T1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 10.0, 1 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 6.0, 2 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 9.0, 3 from me_q where key = 'T1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'What is the budget allocation for the 13th Five Year Plan in Bhutan?', null, 'The 13th Five Year Plan (2024-2029) has an outlay of Nu. 512.283 billion.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-II.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'V1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Nu. 512.283 billion', true, 1), ('B', 'Nu. 456 billion', false, 2), ('C', 'Nu. 500 billion', false, 3), ('D', 'Nu. 400 billion', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Who became the first Bhutanese in over sixty years to receive the Ramon Magsaysay Award in 2024 for "his invaluable and enduring contributions towards harmonizing the richness of Bhutan''s past with the diverse challenges and opportunities of its present, and for inspiring young Bhutanese to be proud of their identity while embracing the future"?', null, 'Historian Dr. Karma Phuntsho of the Loden Foundation received the 2024 Ramon Magsaysay Award.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-II.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'V2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Dasho Karma Ura', false, 1), ('B', 'Dr. Dorji Wangchuk', false, 2), ('C', 'Dr. Lotay Tshering', false, 3), ('D', 'Dr. Karma Phuntsho', true, 4)) as v(label, body, ok, pos) where me_q.key = 'V2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'According to His Majesty, what values form the foundation of the Gyalsung National Service?', null, 'Gyalsung is built on values such as courage, resilience, humility and righteousness.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-II.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'V7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Wealth, power, and influence', false, 1), ('B', 'Courage, resilience, humility, and righteousness', true, 2), ('C', 'Strength, intelligence, and competitiveness', false, 3), ('D', 'Economic growth and technological innovation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which company announced the launch of its first mass-market AR smart glasses, named "Specs", scheduled for 2026?', null, 'Snap Inc. announced consumer AR glasses called Specs for 2026.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-world'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-II.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'V9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Snap', true, 1), ('B', 'Meta', false, 2), ('C', 'Google', false, 3), ('D', 'Apple', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'When was Zhungdra (traditional Bhutanese folk music) first performed to commemorate the victories over the Tibetans and as a gesture of appreciation to the protective deities Yeshey Gonpo and Pelden Lhamo?', null, 'Zhungdra dates from the 17th century, the time of Zhabdrung Ngawang Namgyal and the victories over Tibetan invasions.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-culture'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-II.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'V10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '20th century', false, 1), ('B', '17th century', true, 2), ('C', '19th century', false, 3), ('D', '18th century', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'essay', 'Write an essay of about 300-350 words on the following topic.

Every year thousands of young Bhutanese leave the country to study and work abroad, while many sectors at home face a shortage of skilled workers.

Discuss the reasons why young people choose to go abroad and suggest ways in which Bhutan can encourage them to contribute to the nation. (25 marks)', 'Going abroad: loss or opportunity for Bhutan?

In recent years, thousands of young Bhutanese have left for Australia, Canada and other countries to study and work. At the same time, hospitals, schools and the construction sector at home are short of skilled people. This trend deserves careful thought because the future of the nation depends on its youth.

There are several reasons why young people leave. The most important is income: a few years of work abroad can earn more than many years at home. Some want higher studies and international experience. Others feel that jobs in Bhutan are limited, promotions are slow and the private sector is small. Many are also influenced by friends and relatives who have already gone and share their success on social media.

The effects are both negative and positive. The departure of nurses, teachers and engineers leaves gaps in public services, and villages are left with mostly elderly people. On the other hand, those abroad send money home, which supports families and the economy, and they learn new skills and work habits.

Bhutan can turn this trend into an opportunity. Pay and career paths in key professions should be improved so that staying is a reasonable choice. Projects such as Gelephu Mindfulness City and a growing private sector can create attractive jobs. The government can keep strong links with Bhutanese abroad, invite them to invest and share their skills, and make it easy for returnees to start businesses or rejoin service. Schools can also prepare students for entrepreneurship rather than only for government jobs.

Young people who go abroad do not stop being Bhutanese. With wise policies, their skills, savings and experience can come back home. If we create opportunities and keep them connected to their roots, those who leave today can become the builders of a stronger Bhutan tomorrow.', null, '[{"point": "Introduction: the situation and why it matters", "marks": 3}, {"point": "Reasons: higher income, further studies, limited jobs and career growth at home, peer influence", "marks": 6}, {"point": "Effects on Bhutan: shortage of skilled workers, ageing villages, but also remittances and new skills", "marks": 5}, {"point": "Practical suggestions: better pay and careers, GMC and private-sector jobs, diaspora links, returning-skills schemes", "marks": 6}, {"point": "Conclusion", "marks": 3}, {"point": "Language and organisation of a well-paragraphed essay", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'essay-education-and-national-development'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 25,
    2700, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'E1'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'E1s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 10.0, 1 from me_q where key = 'E1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 6.0, 2 from me_q where key = 'E1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 9.0, 3 from me_q where key = 'E1s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'essay', 'Write an essay of about 300-350 words on the following topic.

Artificial intelligence tools that can write, translate and answer questions are now freely available on mobile phones.

Discuss how these tools can help and harm students and young workers in Bhutan, and how they should be used responsibly. (25 marks)', 'Artificial intelligence: a helper, not a replacement

Only a few years ago, artificial intelligence (AI) seemed like science fiction. Today, any Bhutanese student with a mobile phone can ask an AI tool to explain a lesson, translate a paragraph or draft a letter in seconds. These tools bring great opportunities, but they also carry real risks.

AI can be a patient tutor. A student in a remote school who has no one to ask can get an explanation of a difficult mathematics problem or practise English conversation. Young workers can use AI to summarise long reports, prepare presentations and write emails faster, leaving more time for important tasks. Small businesses can use it for advertising and accounts without hiring experts.

However, the same tools can do harm. Some students simply copy AI answers for assignments, which is dishonest and stops them from learning to think and write for themselves. AI tools sometimes give wrong or invented information in a confident way, and users who do not check may spread errors. Sharing personal or official information with these tools can also put privacy and security at risk.

AI should therefore be used responsibly. Students should use it to understand, not to copy, and should always be honest about where help came from. Every answer should be checked against reliable sources. Schools, colleges and offices need clear rules about when AI may be used, and teachers can design tasks that test real understanding. Above all, digital literacy should be taught so that young people understand both the power and the limits of these tools.

In conclusion, AI is like any powerful tool: it can build or destroy depending on how it is used. If young Bhutanese use it with honesty and good judgement, it can help them learn faster and work better, while their own thinking remains their greatest strength.', null, '[{"point": "Introduction: what AI tools are and how widely they are used", "marks": 3}, {"point": "Benefits: learning support, translation, faster work, access to information", "marks": 7}, {"point": "Harms: copying and plagiarism, weaker thinking and writing skills, wrong information, privacy", "marks": 7}, {"point": "Responsible use: honesty, checking facts, rules in schools and offices, digital literacy", "marks": 5}, {"point": "Conclusion", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'essay-technology-and-society'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 25,
    2700, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'E2'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'E2s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 10.0, 1 from me_q where key = 'E2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 6.0, 2 from me_q where key = 'E2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 9.0, 3 from me_q where key = 'E2s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'Write a letter of about 150 words on the following topic.

Your name is Pema, a youth from Khaling Gewog, Trashigang Dzongkhag. You want to start a small dairy processing unit that makes cheese and butter with other young people of your village.

Write a letter to the Manager of the Bhutan Development Bank, Trashigang branch, applying for a loan. Mention the problem your project will solve, its objectives, how it will work, and the budget. (20 marks)', 'Pema
Khaling Gewog
Trashigang Dzongkhag

5 April 2025

The Manager
Bhutan Development Bank Limited
Trashigang Branch
Trashigang

Subject: Application for a loan to start a dairy processing unit

Sir/Madam,

I am a youth from Khaling Gewog and I am writing to apply for a loan to start a small dairy processing unit with four other young people of my village.

Problem: Farmers in our village produce plenty of milk, but much of it is wasted or sold cheaply because there is no place to process it, and many young people here are unemployed.

Objectives: to process local milk into cheese and butter, to give farmers a fair price, and to create jobs for five young people.

Plan: We will collect milk from 30 households every morning, process it in a small rented building and sell our products in Trashigang and Samdrup Jongkhar.

Budget: equipment Nu. 300,000; building repairs Nu. 80,000; packaging Nu. 40,000; working capital Nu. 80,000. Total Nu. 500,000. We will contribute Nu. 100,000 and request a loan of Nu. 400,000.

I kindly request you to consider our application.

Yours faithfully,
Pema', null, '[{"point": "Correct formal format: addresses, date, subject, salutation, closing and name", "marks": 4}, {"point": "Clear problem statement", "marks": 4}, {"point": "Objectives", "marks": 4}, {"point": "How the project will work", "marks": 4}, {"point": "Budget with a total and the amount of loan requested", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'letter-writing-formal-letters'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 20,
    2160, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'L1'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'L1s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 8.0, 1 from me_q where key = 'L1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 5.0, 2 from me_q where key = 'L1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 7.0, 3 from me_q where key = 'L1s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'Write a letter of about 150 words on the following topic.

You are Karma, the president of the Nature Club of a higher secondary school in Bumthang. Your club wants to organise a clean-up campaign and tree-planting day along the river near your school.

Write a letter to the Principal of your school requesting permission to organise the event. Explain why the club wants to organise it, its importance to the students and the school, and how it can benefit the community. (20 marks)', 'Karma
President, Nature Club
Chumey Higher Secondary School
Bumthang

10 May 2025

The Principal
Chumey Higher Secondary School
Bumthang

Subject: Request for permission to organise a river clean-up and tree-planting day

Respected Sir/Madam,

On behalf of the Nature Club, I request your kind permission to organise a clean-up campaign and tree-planting day along the river near our school on Saturday, 7 June, which is World Environment Day week.

Our club members have noticed plastic bottles, wrappers and other waste along the river bank, and some parts of the bank are losing soil because there are few trees. We want to take action instead of only talking about the problem.

The event will teach students responsibility and teamwork, give them practical experience of caring for nature, and show that our school takes its role in protecting the environment seriously.

The community will benefit from a cleaner river, safer drinking water downstream and stronger river banks. We also hope to inspire villagers to join us.

We will arrange gloves, bags and saplings with help from the Dzongkhag forestry office. I hope you will kindly grant us permission.

Yours faithfully,
Karma', null, '[{"point": "Correct formal format: addresses, date, subject, salutation, closing and name", "marks": 4}, {"point": "Clear request for permission (with date and plan)", "marks": 3}, {"point": "Why the club wants to organise the event", "marks": 4}, {"point": "Importance to the students and the school", "marks": 5}, {"point": "Benefit to the community", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'letter-writing-formal-letters'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 20,
    2160, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'L2'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'L2s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 8.0, 1 from me_q where key = 'L2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 5.0, 2 from me_q where key = 'L2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 7.0, 3 from me_q where key = 'L2s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'passage', 'Read the passage below and then answer the question that follows.

The Return of the Village Bazaar

Every Sunday morning, the small bazaar in our gewog comes back to life. Farmers arrive before sunrise with baskets of chillies, cheese, eggs, beans and leafy greens. For most of the week the sheds stand empty, but on Sunday they are full of colour and noise. A few years ago, many people thought the village bazaar would disappear. Young people had moved to towns, roads made it easy to drive to the big shops in the Dzongkhag headquarters, and imported vegetables from across the border were often cheaper than our own.

Something changed during the pandemic. When travel was restricted, families discovered how much they depended on food grown by their neighbours. Farmers who had stopped selling began to bring their produce again, and customers who had always bought imported vegetables found that local ones tasted better and stayed fresh longer. Some young people who had lost their jobs in town returned home and started small farms, using greenhouses and drip irrigation they had learnt about on social media.

Today the bazaar is more than a market. Old friends meet over a cup of suja, children help their parents with the scales, and elderly farmers share advice with young ones about seeds and the weather. Money spent here stays in the village. Still, the bazaar faces problems. Prices fall sharply when everyone brings the same vegetables at the same time, and much of the produce is wasted because there is no cold storage. Some farmers complain that wild animals destroy their crops before harvest.

The future of the bazaar depends on whether farmers can plan together, grow a wider variety of crops and find ways to store and process what they cannot sell. If they can, the Sunday bazaar may become not only a place to buy food but a symbol of a self-reliant community.

Question A (5 x 1 = 5 marks)
Write the correct option for each question, for example: 1 (A).

1. Why did many people think the village bazaar would disappear?
(A) The gewog closed the bazaar.  (B) Young people moved away, shops in town were easy to reach and imports were cheap.  (C) Farmers stopped growing vegetables.  (D) The bazaar was moved to the Dzongkhag headquarters.

2. According to the passage, what did customers discover during the pandemic?
(A) Imported vegetables were safer.  (B) Local vegetables were more expensive and less fresh.  (C) Local vegetables tasted better and stayed fresh longer.  (D) Supermarkets were cheaper than the bazaar.

3. Which of these is NOT given as a problem the bazaar faces?
(A) Prices fall when everyone sells the same vegetables.  (B) Produce is wasted for lack of cold storage.  (C) Wild animals destroy crops.  (D) Customers refuse to pay in cash.

4. The phrase "Money spent here stays in the village" means that
(A) the bazaar does not accept money from outsiders.  (B) spending at the bazaar supports local farmers and families.  (C) villagers save all their money.  (D) prices are fixed by the gewog.

5. The writer suggests that the bazaar could become a symbol of
(A) modern shopping.  (B) foreign trade.  (C) a self-reliant community.  (D) government support.', '1 (B)  2 (C)  3 (D)  4 (B)  5 (C)

1: young people moved to towns, roads made the big shops easy to reach, and imports were cheaper.
2: local vegetables "tasted better and stayed fresh longer".
3: falling prices, no cold storage and wild animals are all mentioned; refusing to pay in cash is not.
4: the money goes to local farmers and stays in the local economy.
5: "a symbol of a self-reliant community".', null, '[{"point": "1 (B)", "marks": 1}, {"point": "2 (C)", "marks": 1}, {"point": "3 (D)", "marks": 1}, {"point": "4 (B)", "marks": 1}, {"point": "5 (C)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 5,
    540, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'S3A'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-dzongkha-2-2025b1-s3-cp2', 1, null)
  returning id
)
insert into me_q select 'S3As', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 2.0, 1 from me_q where key = 'S3As';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 1.0, 2 from me_q where key = 'S3As';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 2.0, 3 from me_q where key = 'S3As';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'passage', 'How did the pandemic change the village bazaar, according to the passage? (5 marks)', 'When travel was restricted during the pandemic, families realised how much they depended on food grown by their neighbours. Farmers who had stopped selling started bringing their produce to the bazaar again, and customers who used to buy imported vegetables found that local ones tasted better and stayed fresh longer. Some young people who had lost their jobs in town returned home and started small farms, using greenhouses and drip irrigation that they had learnt about on social media. As a result, the bazaar that many expected to disappear came back to life.', null, '[{"point": "Families realised how much they depended on food from neighbours when travel was restricted", "marks": 2}, {"point": "Farmers began selling again and customers preferred local vegetables", "marks": 2}, {"point": "Some young people returned and started small farms using new methods", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 5,
    540, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'S3B'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-dzongkha-2-2025b1-s3-cp2', 2, null)
  returning id
)
insert into me_q select 'S3Bs', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 2.0, 1 from me_q where key = 'S3Bs';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 1.0, 2 from me_q where key = 'S3Bs';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 2.0, 3 from me_q where key = 'S3Bs';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'passage', 'Explain why the writer says that "the bazaar is more than a market". (5 marks)', 'The writer means that the bazaar does much more than allow people to buy and sell food. It is a social meeting place where old friends meet and talk over a cup of suja, which keeps the community close. It is also a place of learning between generations: children help their parents with the scales, and elderly farmers share their knowledge of seeds and weather with young farmers. Finally, it supports the local economy, because the money spent there stays in the village instead of going to shops elsewhere or across the border.', null, '[{"point": "It is a social meeting place: friends meet over suja", "marks": 2}, {"point": "It passes knowledge between generations: elders advise the young; children help parents", "marks": 2}, {"point": "It supports the local economy: money stays in the village", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 5,
    540, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'S3C'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-dzongkha-2-2025b1-s3-cp2', 3, null)
  returning id
)
insert into me_q select 'S3Cs', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 2.0, 1 from me_q where key = 'S3Cs';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 1.0, 2 from me_q where key = 'S3Cs';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 2.0, 3 from me_q where key = 'S3Cs';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'passage', 'Suggest ways in which farmers and the community can solve the problems faced by the bazaar. Support your answer with ideas from the passage and your own views. (5 marks)', 'First, as the passage suggests, farmers should plan together through a cooperative or farmers'' group, deciding who grows what and when, so that the bazaar is not flooded with the same vegetables and prices stay fair. Growing a wider variety of crops, including off-season vegetables in greenhouses, would also help.

Second, the community could ask the gewog and agriculture office for a small cold store and learn to process surplus produce into dried chillies, pickles, cheese and other products that keep longer. Farmers could also sell regularly to schools, hospitals and hotels.

Third, to stop wild animals destroying crops, farmers can use electric fencing and guard their fields together, with support from the gewog. With these steps the bazaar can become stronger and more reliable.', null, '[{"point": "Plan together and grow a wider variety of crops so that prices do not fall (from the passage)", "marks": 2}, {"point": "Storage and processing: cold storage, drying, pickles, cheese; sell to schools and institutions (own views)", "marks": 2}, {"point": "Protect crops from wild animals, e.g. electric fencing, with support from the gewog", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 5,
    540, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'S3D'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-dzongkha-2-2025b1-s3-cp2', 4, null)
  returning id
)
insert into me_q select 'S3Ds', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 2.0, 1 from me_q where key = 'S3Ds';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 1.0, 2 from me_q where key = 'S3Ds';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 2.0, 3 from me_q where key = 'S3Ds';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'translation', 'Read the following passage carefully and translate it into English. (25 marks)

འབྲུག་གི་གྲོང་སྡེ་ཚུ་ནང་ གད་སྙིགས་ལེན་སྟངས་ཀྱི་དཀའ་ངལ།

༉ ལོ་ཤས་ཀྱི་རིང་ལུ་ འབྲུག་གི་གྲོང་སྡེ་ཚུ་ནང་ མི་རློབས་ཡར་འཕར་འགྱོ་མི་དང་གཅིག་ཁར་ གད་སྙིགས་ཀྱི་གྱངས་ཁ་ཡང་ ལོ་བསྟར་དུ་ ཡར་སེང་འགྱོ་དོ་ཡོདཔ་ཨིན། ཐིམ་ཕུ་ཁྲོམ་རྐྱངམ་གཅིག་ནང་ ཉིན་རེ་ལུ་ གད་སྙིགས་ མེ་ཊིཀ་ཊཱན་ ༥༠ ལས་ལྷག་སྟེ་ བཏོན་དོ་ཡོདཔ་ཨིན་མས། གད་སྙིགས་དེ་ཚུ་ ལེགས་ཤོམ་སྦེ་ ལེན་ནི་མེད་པ་ཅིན་ ཆུ་དང་རླུང་ བཙོག་པ་བཟོ་ནི་མ་ཚད་ མི་ཚུ་གི་འཕྲོད་བསྟེན་ལུ་ཡང་ གནོད་ཉེན་འབྱུང་ནི་ཨིན།

གད་སྙིགས་ཀྱི་དཀའ་ངལ་འདི་ གཞུང་རྐྱངམ་གཅིག་གིས་ སེལ་མི་ཚུགས། ཁྱིམ་ཚང་རེ་རེ་གིས་ གད་སྙིགས་ཚུ་ རུལ་ཚུགས་མི་དང་ རུལ་མི་ཚུགས་མི་ སོ་སོ་སྦེ་ ཕྱེ་དགོཔ་ཨིན། ཕྱིར་ལོག་ལག་ལེན་འཐབ་ཚུགས་པའི་ ཅ་ལ་ཚུ་ བསྡུ་ལེན་འབད་དེ་ ཚོང་ནི་དང་ རུལ་ཚུགས་པའི་ གད་སྙིགས་ཚུ་ལས་ ལུད་བཟོ་ཚུགས། སློབ་གྲྭ་དང་ གཞོན་ནུའི་སྡེ་ཚན་ཚུ་གིས་ཡང་ གཙང་སྦྲ་གི་ལས་འགུལ་ཚུ་ འགོ་འདྲེན་འབད་དེ་ མི་མང་ལུ་ ཤེས་ཚོར་བྱིན་ཚུགས།

གལ་སྲིད་ ང་བཅས་ར་ མི་ངོ་རེ་རེ་གིས་ འགན་ཁུར་འབག་པ་ཅིན་ ང་བཅས་རའི་ རྒྱལ་ཁབ་འདི་ ཉམས་དགའ་ དེ་ལས་ གཙང་སྦྲ་ཅན་ཅིག་སྦེ་ ཤུལ་མའི་མི་རབས་ཚུ་ལུ་ སྤྲོད་ཚུགས།', 'The problem of waste management in Bhutan''s towns

Over the past few years, as the population of Bhutan''s towns has grown, the amount of waste has also been increasing every year. In Thimphu city alone, more than 50 metric tonnes of waste are produced every day. If this waste is not managed properly, it will not only pollute the water and air but also harm people''s health.

The problem of waste cannot be solved by the government alone. Every household must separate its waste into biodegradable and non-biodegradable waste. Items that can be reused or recycled can be collected and sold, and manure can be made from biodegradable waste. Schools and youth groups can also lead cleanliness campaigns and raise awareness among the public.

If each one of us takes responsibility, we can hand over our country to future generations as a beautiful and clean place.', null, '[{"point": "Accuracy: the meaning of every sentence is kept, with no additions or omissions", "marks": 10}, {"point": "Completeness: all paragraphs and figures translated correctly", "marks": 6}, {"point": "Clarity and natural English expression", "marks": 5}, {"point": "Correct spelling, grammar and punctuation", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'translation-dzongkha-to-english'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 25,
    2700, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'T1'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha text: please have a fluent Dzongkha reader check it before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'T1s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and analysis', 'Relevant, well-developed points that answer exactly what is asked.', 10.0, 1 from me_q where key = 'T1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Orderly, coherent presentation; correct format for letters; paragraphs.', 6.0, 2 from me_q where key = 'T1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language accuracy', 'Grammar, spelling, punctuation and appropriate vocabulary.', 9.0, 3 from me_q where key = 'T1s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'In which year did Bhutan graduate from the United Nations list of Least Developed Countries (LDCs)?', null, 'Bhutan graduated from the LDC category on 13 December 2023.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'V11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2025', false, 1), ('B', '2019', false, 2), ('C', '2021', false, 3), ('D', '2023', true, 4)) as v(label, body, ok, pos) where me_q.key = 'V11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Gelephu Mindfulness City was first announced by His Majesty The King on:', null, 'His Majesty announced the Gelephu Mindfulness City in the National Day address on 17 December 2023.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'V12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2 June 2024, Coronation Day', false, 1), ('B', '11 November 2022, His Majesty the Fourth King''s birthday', false, 2), ('C', '21 June 2023, International Day of Yoga', false, 3), ('D', '17 December 2023, National Day', true, 4)) as v(label, body, ok, pos) where me_q.key = 'V12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which political party formed the government after the National Assembly elections of January 2024?', null, 'The People''s Democratic Party won 30 of 47 seats; Bhutan Tendrel Party became the opposition.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'V13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Druk Phuensum Tshogpa', false, 1), ('B', 'Druk Nyamrup Tshogpa', false, 2), ('C', 'People''s Democratic Party', true, 3), ('D', 'Bhutan Tendrel Party', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Who became the Prime Minister of Bhutan in January 2024?', null, 'Dasho Tshering Tobgay of the People''s Democratic Party became Prime Minister for the second time in January 2024.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'V14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Dasho Tshering Tobgay', true, 1), ('B', 'Pema Chewang', false, 2), ('C', 'Lyonchhen Jigmi Y. Thinley', false, 3), ('D', 'Dr. Lotay Tshering', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Bhutan''s first utility-scale solar power plant, commissioned recently, is located in:', null, 'The 17.38 MW Sephu Solar Project is in Wangdue Phodrang.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'V15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Phuentsholing, Chhukha', false, 1), ('B', 'Jakar, Bumthang', false, 2), ('C', 'Sephu, Wangdue Phodrang', true, 3), ('D', 'Gelephu, Sarpang', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Gelephu Mindfulness City is being developed in which Dzongkhag?', null, 'Gelephu is in Sarpang Dzongkhag, on the southern border.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'V16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Samdrup Jongkhar', false, 1), ('B', 'Sarpang', true, 2), ('C', 'Samtse', false, 3), ('D', 'Zhemgang', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The Constitution of Bhutan requires the country to maintain at least what share of its total land under forest cover for all time?', null, 'Article 5 of the Constitution requires a minimum of 60 percent of land under forest cover for all time.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'V17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '72 percent', false, 1), ('B', '50 percent', false, 2), ('C', '60 percent', true, 3), ('D', '70 percent', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The 13th Five Year Plan of Bhutan covers the period:', null, 'The 13th Five Year Plan runs from July 2024 to June 2029.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'V18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2019-2024', false, 1), ('B', '2024-2029', true, 2), ('C', '2025-2030', false, 3), ('D', '2023-2028', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The National Day of Bhutan, celebrated on 17 December, commemorates:', null, 'National Day marks the enthronement of Gongsar Ugyen Wangchuck as the first King on 17 December 1907.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'V19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'the signing of the Constitution', false, 1), ('B', 'the founding of the Dratshang', false, 2), ('C', 'the coronation of the first King, Gongsar Ugyen Wangchuck, in 1907', true, 3), ('D', 'the first democratic elections', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The first full batch of young Bhutanese began Gyalsung National Service training in:', null, 'The first Gyalsung batch began training in September 2024.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language-current-affairs'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language-current-affairs') and t.slug = 'current-affairs-bhutan'), (select id from public.exam_papers where code = 'me-dzongkha-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'V20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2024', true, 1), ('B', '2023', false, 2), ('C', '2026', false, 3), ('D', '2022', false, 4)) as v(label, body, ok, pos) where me_q.key = 'V20';
commit;
