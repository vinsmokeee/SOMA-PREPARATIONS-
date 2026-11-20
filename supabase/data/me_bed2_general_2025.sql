-- ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language'), 'comprehension', 'Comprehension' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language'), 'essay-writing', 'Essay writing' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language'), 'grammar-and-language', 'Grammar and language' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language'), 'precis-writing', 'Precis writing' on conflict (subject_id, slug) do nothing;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-bed-2') and subject_group_id is not distinct from (select id from public.subject_groups where code = 'bed-general-graduates');
insert into public.paper_group_settings (paper_id, subject_group_id, duration_minutes, reading_minutes, max_marks, source) values ((select id from public.exam_papers where code = 'me-bed-2'), (select id from public.subject_groups where code = 'bed-general-graduates'), 180, 15, 100, 'BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates') on conflict (paper_id, subject_group_id) do update set duration_minutes = excluded.duration_minutes, reading_minutes = excluded.reading_minutes, max_marks = excluded.max_marks, source = excluded.source;
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-2'), (select id from public.subject_groups where code = 'bed-general-graduates'), null, 1, 'Section A: Essay writing', 'essay', 2, 30, 1, 'BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-2'), (select id from public.subject_groups where code = 'bed-general-graduates'), null, 2, 'Section B: Comprehension', 'passage', 1, 35, null, 'BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-2'), (select id from public.subject_groups where code = 'bed-general-graduates'), null, 3, 'Section C: Grammar and language', 'mcq', 15, 1, null, 'BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-2'), (select id from public.subject_groups where code = 'bed-general-graduates'), null, 4, 'Section D: Precis writing', 'descriptive', 1, 20, null, 'BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'essay', 'Write an essay in about 1000 words on the following topic. (Assessed on thought and content development 15, communicative competence and vocabulary 10, grammatical accuracy and variety 5.) (30 marks)

Future of Bhutan Baccalaureate.', 'Outline (1000-word essay):
Introduction - The Bhutan Baccalaureate is the reform of school education into a holistic, competency-based curriculum and qualification, preparing learners for a changing world while rooted in Bhutanese values.
Opportunities - It moves away from rote learning towards inquiry, projects, critical thinking, creativity and digital skills; it values character, mindfulness and GNH; and it aims at qualifications recognised internationally, making graduates more employable and confident.
Challenges - Teachers need extensive professional development; schools need laboratories, ICT and libraries, especially in rural areas; continuous, skills-based assessment demands time and fair moderation; teacher shortages and large classes; parents and the public must understand the new system.
Recommendations - Phase implementation; invest in teacher training and mentoring; equip schools fairly; involve parents and communities; monitor and adjust using evidence.
Teacher''s role - as facilitators, mentors and role models who link global knowledge with Bhutaneseness.
Conclusion - With strong teachers and support, the Baccalaureate can prepare young Bhutanese to thrive in a global future while remaining proudly Bhutanese.', null, '[{"point": "Introduction: what the Bhutan Baccalaureate is (new competency-based, holistic curriculum and qualification) and why it matters", "marks": 4}, {"point": "Opportunities: 21st-century skills, project work, international recognition, values and GNH, better graduate employability", "marks": 9}, {"point": "Challenges: teacher preparation, resources and infrastructure, assessment change, equity between urban and rural schools, parents'' understanding", "marks": 9}, {"point": "Recommendations and the teacher''s role", "marks": 5}, {"point": "Conclusion", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'essay-writing'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'E1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Thought and content', 'Relevant, well-developed ideas with examples; answers the question.', 15.0, 1 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Communicative competence and vocabulary', 'Clear organisation, coherence, apt and varied vocabulary.', 10.5, 2 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Grammatical accuracy and variety', 'Accurate grammar, spelling, punctuation; varied sentences.', 4.5, 3 from me_q where key = 'E1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'essay', 'Write an essay in about 1000 words on the following topic. (Assessed on thought and content development 15, communicative competence and vocabulary 10, grammatical accuracy and variety 5.) (30 marks)

Technology and Innovation in Education.', 'Outline (1000-word essay):
Introduction - Technology (devices, internet, digital platforms, AI) and innovation (new ways of teaching and learning) are reshaping classrooms in Bhutan and the world.
Benefits - Access to vast resources; interactive and personalised learning; online learning that kept education going during COVID-19; coding, robotics and digital literacy (e.g. Bhutan''s ICT curriculum); efficient assessment and record keeping; connecting remote schools to experts.
Challenges - Digital divide between urban and rural schools; cost and poor connectivity; lack of teacher skills; distraction, screen addiction and cyberbullying; plagiarism with AI tools; data privacy.
Way forward - Teacher training, infrastructure investment, blended learning, digital citizenship education, using technology as a tool not a replacement for teachers, and innovation in pedagogy (project-based and inquiry learning).
Conclusion - Used wisely, technology and innovation can make education more engaging, equitable and future-ready while keeping human values at the centre.', null, '[{"point": "Introduction defining technology and innovation in education", "marks": 4}, {"point": "Benefits with examples (digital resources, e-learning, personalised learning, AI, coding, access in remote areas)", "marks": 9}, {"point": "Challenges and risks (digital divide, cost, connectivity, screen time, misuse, teacher skills, data privacy)", "marks": 9}, {"point": "Role of teachers and ways forward", "marks": 5}, {"point": "Conclusion", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'essay-writing'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'E2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Thought and content', 'Relevant, well-developed ideas with examples; answers the question.', 15.0, 1 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Communicative competence and vocabulary', 'Clear organisation, coherence, apt and varied vocabulary.', 10.5, 2 from me_q where key = 'E2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Grammatical accuracy and variety', 'Accurate grammar, spelling, punctuation; varied sentences.', 4.5, 3 from me_q where key = 'E2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', 'Read the passage below and answer the questions that follow.

Bhutaneseness: Preserving Identity in a Rapidly Changing World

In today’s fast-paced global landscape, where cultures blend and identities often blur, the concept of Bhutaneseness stands as a vital beacon of national identity and cultural preservation. Bhutaneseness is more than just being from Bhutan; it is the essence of what it means to live, think, and belong as a Bhutanese in the 21st century. As the world races toward modernization and globalization, the urgency to understand, protect, and nurture Bhutaneseness has never been greater. This essay explores the meaning of Bhutaneseness, its significance in contemporary times, and why it is crucial for Bhutan’s youth and graduates to uphold this identity amid global pressures.

Bhutaneseness refers to the collective identity, values, traditions, and worldview that define the Bhutanese people. Rooted deeply in the country’s history, geography, and spiritual heritage, it is a complex interplay of cultural pride, social norms, and philosophical outlooks. At its core, Bhutaneseness embodies the principles of compassion, community, and harmony with nature— values that have been nurtured by Bhutan’s Buddhist traditions and the guiding philosophy of Gross National Happiness (GNH).

Unlike many nations that measure progress solely by economic growth, Bhutan has prioritized holistic well-being and cultural preservation. This unique approach has shaped Bhutaneseness into a living, breathing identity that balances tradition and modernity. It is reflected in the everyday lives of Bhutanese people—from the national dress (gho and kira) worn with pride, to the celebration of festivals like Tshechu, which reinforce communal bonds and spiritual values.

In an era marked by rapid technological advancement, mass media, and cultural homogenization, small nations like Bhutan face unprecedented challenges. The influx of global ideas and lifestyles threatens to dilute local identities. For Bhutan, this is not a distant worry but a pressing reality. The younger generation, especially college graduates who are exposed to global education and digital culture, often find themselves at a crossroads between embracing global modernity and preserving their unique heritage.

Take, for example, the widespread use of social media platforms like Instagram and TikTok among Bhutanese youth. While these platforms offer opportunities for connection and learning, they also introduce foreign cultural norms and values that can overshadow traditional Bhutanese ways of life. The risk is that Bhutaneseness might become a nostalgic concept rather than a lived reality.

Bhutan’s situation is not unique. Countries with rich cultural heritages have grappled with similar dilemmas. Consider Japan, a nation that has successfully blended ultra-modern technology with deep- rooted traditions. Japanese society maintains its cultural identity through education, language preservation, and cultural festivals, even as it leads the world in innovation. The Japanese concept of “wa” (harmony) and respect for ancestors continues to shape social behavior, much like Bhutan’s emphasis on community and spirituality.

On the other hand, some indigenous communities in the Americas have struggled to maintain their identities amid globalization. The loss of native languages and customs has led to cultural erosion and social challenges. This contrast underscores the importance of proactive cultural preservation efforts - something Bhutan must continue to prioritize.

For Bhutan’s graduates, understanding and embodying Bhutaneseness is not just a matter of pride but a responsibility. Education plays a critical role here. Bhutan’s education system has made strides in incorporating GNH values and cultural studies into its curriculum. However, there is a need to deepen this integration and make it relevant to the challenges of the modern world.

Graduates entering the workforce or pursuing higher education abroad must be equipped with a strong sense of Bhutanese identity that enables them to act as cultural ambassadors. This means fostering skills that allow them to innovate while respecting and promoting Bhutanese values. For instance, graduates in environmental science can champion Bhutan’s commitment to carbon neutrality, while those in business can develop enterprises that align with ethical and sustainable principles rooted in Bhutanese culture.

One inspiring example of Bhutaneseness in action is Bhutan’s leadership in environmental conservation. The country’s constitution mandates that at least 60% of its land remains forested, a policy that reflects Bhutanese respect for nature and sustainability. This commitment has earned Bhutan global recognition as a carbon-negative nation. Graduates today can draw motivation from this example to pursue careers that not only advance their personal goals but also contribute to national and global well-being.

Another example is the preservation of the Dzongkha language. Despite the dominance of English in education and business, Dzongkha remains a symbol of national identity. Efforts to promote the language through media, literature, and technology help maintain Bhutaneseness in everyday life.

Despite these strengths, Bhutaneseness faces real challenges. Urbanization and migration to cities like Thimphu have introduced new lifestyles that sometimes clash with traditional values. The allure of global pop culture can overshadow local arts and crafts. Moreover, economic pressures may push young Bhutanese to prioritize material success over cultural values.

To effectively address these challenges, a multi-pronged approach is essential. Strengthening cultural education in schools and universities will ensure that students gain a deep understanding of the roots and ongoing relevance of Bhutaneseness. At the same time, creating platforms for youth engagement will allow young Bhutanese to creatively express their identity, blending traditional values with modern influences. Continued government support through policies that protect cultural heritage, language, and the environment remains crucial in safeguarding Bhutan’s unique legacy. Additionally, encouraging Bhutanese graduates to act as cultural ambassadors abroad can help showcase and promote Bhutan’s distinct identity on the global stage, fostering greater appreciation and respect for Bhutaneseness worldwide.

In conclusion, Bhutaneseness is not a static relic of the past but a dynamic, evolving identity that must be actively preserved and celebrated. For Bhutan’s graduates and youth, it represents a source of strength and guidance in navigating the complexities of the modern world. As globalization accelerates, the urgency to protect this identity grows - because Bhutaneseness is not just about who Bhutanese are today, but about shaping who they will be tomorrow.

By embracing Bhutaneseness with pride and purpose, Bhutan’s new generation can ensure that their nation remains a shining example of how tradition and modernity can coexist harmoniously, inspiring the world with its unique path to progress and happiness.

Question I (5 x 1 = 5 marks). Write the letter of the correct answer, e.g. 6 (A).
1. What does the term Bhutaneseness primarily refer to?
(A) The political structure combining monarchy and democracy in Bhutan. (B) A set of economic policies focused on national growth and modernization. (C) The geographic and environmental attributes unique to Bhutan''s landscape. (D) The collective cultural identity, traditions, and shared values of the Bhutanese people.
2. What challenge does social media pose to Bhutaneseness?
(A) It makes it harder for people to speak Dzongkha regularly online. (B) It slows down internet speed in Bhutan. (C) It introduces foreign culture that may overshadow traditional Bhutanese culture. (D) It spreads misinformation about Bhutan.
3. Why is education important for preserving traits of a society?
(A) It focuses mostly on technical skills, ignoring traditions. (B) It discourages learning about Bhutanese cultural heritage. (C) It includes Bhutanese cultural values and GNH principles. (D) It teaches mainly foreign languages, neglecting local culture.
4. What risk does cultural globalization pose to Bhutanese youth?
(A) It could lose cultural identity and traditional values. (B) It may lead to improved access to education abroad. (C) It could create better chances for jobs outside Bhutan. (D) It may increase awareness of environmental issues locally.
5. How does the essay advise Bhutanese graduates to approach their future?
(A) To focus mainly on achieving economic success and wealth. (B) To preserve Bhutaneseness while embracing modern changes. (C) To seek job opportunities outside Bhutan. (D) To adopt global culture and leave behind Bhutanese traditions. (5 marks)', '1 (D)  2 (C)  3 (C)  4 (A)  5 (B)', null, '[{"point": "1 (D)", "marks": 1}, {"point": "2 (C)", "marks": 1}, {"point": "3 (C)", "marks": 1}, {"point": "4 (A)", "marks": 1}, {"point": "5 (B)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-2-bedgen2025-cp', 1, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'B0', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Thought and content', 'Relevant, well-developed ideas with examples; answers the question.', 2.0, 1 from me_q where key = 'B0';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Communicative competence and vocabulary', 'Clear organisation, coherence, apt and varied vocabulary.', 2.0, 2 from me_q where key = 'B0';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Grammatical accuracy and variety', 'Accurate grammar, spelling, punctuation; varied sentences.', 1.0, 3 from me_q where key = 'B0';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', 'Question II. 1. In what ways can teachers balance teaching global knowledge alongside Bhutanese cultural preservation to prepare students for a globalized world? (5 marks)', 'Teachers can teach global knowledge - science, technology, languages, world issues - through Bhutanese examples and values, for instance linking climate change to Bhutan''s carbon-negative policy. They can use projects where students compare Bhutan with other countries, invite elders and artisans, and use technology to share Bhutanese culture online. By modelling values such as respect, compassion and driglam namzha, and by helping students think critically about what to adopt from global culture, teachers prepare learners who are globally competent yet rooted in their identity.', null, '[{"point": "Integrate global content with local examples and values (GNH, culture) in lessons", "marks": 2}, {"point": "Use projects, comparisons and technology to connect global and local; model Bhutanese values", "marks": 2}, {"point": "Encourage critical thinking about global influences", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-2-bedgen2025-cp', 2, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'B1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Thought and content', 'Relevant, well-developed ideas with examples; answers the question.', 2.0, 1 from me_q where key = 'B1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Communicative competence and vocabulary', 'Clear organisation, coherence, apt and varied vocabulary.', 2.0, 2 from me_q where key = 'B1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Grammatical accuracy and variety', 'Accurate grammar, spelling, punctuation; varied sentences.', 1.0, 3 from me_q where key = 'B1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', 'Question II. 2. Explain the significance of teaching Dzongkha in preserving the language. (5 marks)', 'Dzongkha is the national language and a key symbol of Bhutanese identity and unity. Because English dominates education and business, teaching Dzongkha in schools ensures every generation learns to read, write and speak it well, so it does not decline into a language used only at home. Schools also connect students with literature, history and values expressed in Dzongkha, and, together with media and technology, keep the language alive in daily life.', null, '[{"point": "Dzongkha is the national language and a symbol of identity and unity", "marks": 2}, {"point": "Schooling transmits it to the young; keeps it alive against English dominance", "marks": 2}, {"point": "Through media, literature and technology it stays in everyday use", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-2-bedgen2025-cp', 3, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'B2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Thought and content', 'Relevant, well-developed ideas with examples; answers the question.', 2.0, 1 from me_q where key = 'B2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Communicative competence and vocabulary', 'Clear organisation, coherence, apt and varied vocabulary.', 2.0, 2 from me_q where key = 'B2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Grammatical accuracy and variety', 'Accurate grammar, spelling, punctuation; varied sentences.', 1.0, 3 from me_q where key = 'B2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', 'Question II. 3. What risks could occur if Bhutanese identities are not actively preserved? (5 marks)', 'Bhutaneseness could become a nostalgic idea rather than a lived reality: Dzongkha, traditional dress, arts, festivals and values could fade under global pop culture and materialism. As with some indigenous communities in the Americas, loss of language and customs can lead to cultural erosion and social problems. A small nation that loses its distinct identity also weakens its unity, its GNH values and, ultimately, its sovereignty.', null, '[{"point": "Loss of language, customs, values; Bhutaneseness becomes nostalgia", "marks": 2}, {"point": "Cultural homogenisation and erosion; social problems (as with some indigenous communities)", "marks": 2}, {"point": "Weakened national unity/sovereignty and GNH", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-2-bedgen2025-cp', 4, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'B3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Thought and content', 'Relevant, well-developed ideas with examples; answers the question.', 2.0, 1 from me_q where key = 'B3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Communicative competence and vocabulary', 'Clear organisation, coherence, apt and varied vocabulary.', 2.0, 2 from me_q where key = 'B3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Grammatical accuracy and variety', 'Accurate grammar, spelling, punctuation; varied sentences.', 1.0, 3 from me_q where key = 'B3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', 'Question II. 4. Why is it important for Bhutan to balance modernization with cultural preservation? (5 marks)', 'Modernization is necessary for jobs, health, education and a competitive economy, but uncontrolled modernization can erase the culture and values that make Bhutan unique. Balancing the two lets Bhutan enjoy progress while keeping its identity, social harmony and the GNH approach to holistic well-being. Japan shows that a country can lead in technology while preserving traditions, and Bhutan can do the same.', null, '[{"point": "Modernization brings needed development, technology, jobs", "marks": 2}, {"point": "Unchecked modernization erodes identity; preservation gives unity and GNH", "marks": 2}, {"point": "Example of balance (Japan, GNH)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-2-bedgen2025-cp', 5, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'B4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Thought and content', 'Relevant, well-developed ideas with examples; answers the question.', 2.0, 1 from me_q where key = 'B4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Communicative competence and vocabulary', 'Clear organisation, coherence, apt and varied vocabulary.', 2.0, 2 from me_q where key = 'B4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Grammatical accuracy and variety', 'Accurate grammar, spelling, punctuation; varied sentences.', 1.0, 3 from me_q where key = 'B4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', 'Question II. 5. How can Bhutanese youth, especially graduates, serve as cultural ambassadors in a globalized world? (5 marks)', 'Graduates can act as cultural ambassadors by living Bhutanese values - compassion, respect, honesty - wherever they work or study, speaking Dzongkha and wearing national dress on suitable occasions, and explaining GNH and Bhutan''s environmental commitments to others. They can share Bhutanese culture through social media, cultural events and Bhutanese associations abroad, and choose careers and enterprises that reflect Bhutanese principles such as sustainability.', null, '[{"point": "Live and display Bhutanese values, language, dress and etiquette at home and abroad", "marks": 2}, {"point": "Share culture through social media, events, careers aligned with Bhutanese values (e.g. sustainability)", "marks": 2}, {"point": "Represent Bhutan positively and promote GNH", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-2-bedgen2025-cp', 6, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'B5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Thought and content', 'Relevant, well-developed ideas with examples; answers the question.', 2.0, 1 from me_q where key = 'B5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Communicative competence and vocabulary', 'Clear organisation, coherence, apt and varied vocabulary.', 2.0, 2 from me_q where key = 'B5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Grammatical accuracy and variety', 'Accurate grammar, spelling, punctuation; varied sentences.', 1.0, 3 from me_q where key = 'B5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', 'Question II. 6. How can teachers effectively incorporate Bhutanese cultural values and traditions into their teaching? (5 marks)', 'Teachers can weave values and traditions into everyday lessons using Bhutanese stories, proverbs and local examples; organise cultural days, traditional games, arts and crafts and visits to dzongs and lhakhangs; invite elders and artisans to talk to students; teach and practise driglam namzha; and above all model values such as respect, honesty and compassion in their own conduct and classroom culture.', null, '[{"point": "Integrate values and local examples into subject lessons; use stories, proverbs", "marks": 2}, {"point": "Activities: cultural days, arts, field trips, community elders, driglam namzha", "marks": 2}, {"point": "Role-modelling and a respectful classroom culture", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-2-bedgen2025-cp', 7, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'B6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Thought and content', 'Relevant, well-developed ideas with examples; answers the question.', 2.0, 1 from me_q where key = 'B6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Communicative competence and vocabulary', 'Clear organisation, coherence, apt and varied vocabulary.', 2.0, 2 from me_q where key = 'B6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Grammatical accuracy and variety', 'Accurate grammar, spelling, punctuation; varied sentences.', 1.0, 3 from me_q where key = 'B6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which group of words consists of infinitives? I: Am, Was, Were. II: To cut, To laugh, To adjust. III: Playing, Doing, Washing. IV: She, You, They.', null, 'Infinitives are ''to'' + base verb.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'grammar-and-language'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'C2-1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'III', false, 1), ('B', 'II', true, 2), ('C', 'I', false, 3), ('D', 'IV', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C2-1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which of the following has a prepositional phrase functioning as an adjective?', null, '''In the blue jacket'' describes the man.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'grammar-and-language'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'C2-2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'She spoke silently in the class.', false, 1), ('B', 'The kids played outside all afternoon.', false, 2), ('C', 'We arrived after the meeting ended.', false, 3), ('D', 'The man in the blue jacket is my uncle.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C2-2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A relative pronoun is correctly used in', null, '''That'' introduces a relative clause describing ''the book''.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'grammar-and-language'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'C2-3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'I think that it will rain today.', false, 1), ('B', 'That is an amazing idea!', false, 2), ('C', 'She said that she would join later.', false, 3), ('D', 'The book that you gave me is excellent.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C2-3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A tiger growls, a dolphin whistles, and a zebra', null, 'Zebras bray (like donkeys).', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'grammar-and-language'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'C2-4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'neighs.', false, 1), ('B', 'brays.', true, 2), ('C', 'honks.', false, 3), ('D', 'bleats.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C2-4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'He ______ just ______ home when it began to rain.', null, 'Past perfect for the earlier past action.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'grammar-and-language'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'C2-5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'has, left', false, 1), ('B', 'have, leave', false, 2), ('C', 'had, left', true, 3), ('D', 'had, leave', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C2-5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Match: I ''Pema waited for the bus, but it was late.'' II ''Dorji and Dendup arrived at the bus station early and waited until noon for the bus.'' III ''After they left on the bus, Tenzin and Sonam realized that Thinley was waiting at the bus station.'' with W Simple, X Complex, Y Compound-Complex, Z Compound.', null, 'I compound (but), II simple (one clause, compound predicate), III complex.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'grammar-and-language'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'C3-1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'I=W, II=X, III=Y', false, 1), ('B', 'I=Z, II=W, III=X', true, 2), ('C', 'I=Y, II=Z, III=W', false, 3), ('D', 'I=X, II=Y, III=Z', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C3-1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A sentence that has correct subject-verb agreement is', null, '''One of my friends'' takes a singular verb.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'grammar-and-language'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'C3-2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'One of my friends are hiking to Dagala.', false, 1), ('B', 'One of my friend is hiking to Dagala.', false, 2), ('C', 'One of my friends is hiking to Dagala.', true, 3), ('D', 'One of my friend are hiking to Dagala.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C3-2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'We will complete the exam soon. Change the voice.', null, 'Future simple passive: will be + past participle.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'grammar-and-language'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'C3-5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The exam will be finished by us soon.', true, 1), ('B', 'The exam will been finished by us soon.', false, 2), ('C', 'The exam will have been finished by us soon.', false, 3), ('D', 'The exam will being finish by us soon.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C3-5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'descriptive', 'Read the information given below carefully and write a précis in not more than 150 words: in one paragraph, including the main points, with a short title. (20 marks)

Teaching is widely regarded as the noblest profession due to its profound influence on individuals and society. Teachers play a vital role not only in imparting knowledge but also in shaping character and inspiring lifelong learning. According to UNESCO, teachers are the backbone of education systems worldwide, equipping students with critical thinking skills and values essential for personal and societal growth. By nurturing intellectual curiosity and moral integrity, educators help students become informed and responsible citizens who contribute positively to their communities. Moreover, teaching transcends the mere transmission of information; it is a transformative process that connects learning to real-life experiences. Renowned educator John Dewey emphasized that effective teaching actively engages students, fostering self-confidence and resilience. This active engagement prepares learners to face future challenges competently and adapt to a rapidly changing world. Beyond academics, teachers serve as role models, guiding students to become empathetic, socially conscious, and ethical individuals. Their dedication, often extended beyond classroom hours and despite challenging conditions, reflects a level of commitment and service that few other professions demand. The nobility of teaching also lies in its ethical dimensions and far-reaching impact on society. Educators carry the unique responsibility of shaping not only academic achievement but also the social and emotional development of their students. By promoting values such as fairness, respect, and perseverance, teachers contribute to building harmonious and progressive communities. This influence extends beyond individual lives to shape the foundations of nations, making teaching an indispensable and honorable profession.', 'Title: Teaching - The Noblest Profession
Teaching is considered the noblest profession because it shapes both individuals and society. Teachers, described by UNESCO as the backbone of education, not only pass on knowledge but also build character, critical thinking and a love of learning, helping students become responsible citizens. Good teaching, as John Dewey stressed, actively engages learners and links learning to real life, building the confidence and resilience needed in a changing world. Teachers also act as role models, guiding students to be ethical, caring and socially aware, often working beyond class hours in difficult conditions. By promoting fairness, respect and perseverance and supporting students'' social and emotional growth, teachers help build harmonious communities and lay the foundations of nations, which makes teaching an indispensable and honourable calling. (about 125 words)', null, '[{"point": "Suitable short title", "marks": 2}, {"point": "Main points: teaching shapes knowledge, character and lifelong learning (UNESCO: backbone)", "marks": 5}, {"point": "Teaching transforms - engages, builds confidence and resilience (Dewey); teachers as role models, dedication", "marks": 5}, {"point": "Ethical dimension: values, social-emotional development, builds communities and nations", "marks": 4}, {"point": "One paragraph, own words, within 150 words, correct language", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'precis-writing'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for General Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'D1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Thought and content', 'Relevant, well-developed ideas with examples; answers the question.', 10.0, 1 from me_q where key = 'D1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Communicative competence and vocabulary', 'Clear organisation, coherence, apt and varied vocabulary.', 7.0, 2 from me_q where key = 'D1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Grammatical accuracy and variety', 'Accurate grammar, spelling, punctuation; varied sentences.', 3.0, 3 from me_q where key = 'D1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Being fully present and aware of the current moment, calmly noticing one''s thoughts without judgement, is called', null, 'Mindfulness.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'grammar-and-language'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'CN1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Stubbornness', false, 1), ('B', 'Mindfulness', true, 2), ('C', 'Timelessness', false, 3), ('D', 'Leadership', false, 4)) as v(label, body, ok, pos) where me_q.key = 'CN1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Sticking to a study plan and avoiding distractions shows', null, 'Self-discipline.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'grammar-and-language'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'CN2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Prudence', false, 1), ('B', 'Stubbornness', false, 2), ('C', 'Self-discipline', true, 3), ('D', 'Honesty', false, 4)) as v(label, body, ok, pos) where me_q.key = 'CN2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Continuing to work hard despite failures until one succeeds shows', null, 'Perseverance.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'grammar-and-language'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'CN3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Timidity', false, 1), ('B', 'Laziness', false, 2), ('C', 'Arrogance', false, 3), ('D', 'Perseverance', true, 4)) as v(label, body, ok, pos) where me_q.key = 'CN3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Refusing all help and suggestions and insisting on one''s own way, even when frustrated, shows', null, 'Stubbornness.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'grammar-and-language'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'CN4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Stubbornness', true, 1), ('B', 'Humility', false, 2), ('C', 'Flexibility', false, 3), ('D', 'Generosity', false, 4)) as v(label, body, ok, pos) where me_q.key = 'CN4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Returning a lost wallet without expecting any reward shows', null, 'Honesty (integrity).', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'grammar-and-language'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'CN5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Greed', false, 1), ('B', 'Pride', false, 2), ('C', 'Honesty', true, 3), ('D', 'Envy', false, 4)) as v(label, body, ok, pos) where me_q.key = 'CN5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Choose the correct sentence.', null, '''No sooner ... than'' and ''Hardly ... when'' with inversion.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'grammar-and-language'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'CN6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'No sooner had the bell rung than the students left.', true, 1), ('B', 'Hardly had the bell rung than the students left.', false, 2), ('C', 'Hardly the bell had rung when the students left.', false, 3), ('D', 'No sooner had the bell rung when the students left.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'CN6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', '''The news is too good to be true.'' The correct transformation is', null, 'too ... to = so ... that ... not.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'grammar-and-language'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (General Graduates, English): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-general-graduates'), null)
  returning id
)
insert into me_q select 'CN7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The news is so good that it cannot be true.', true, 1), ('B', 'The news is so good that it can be true.', false, 2), ('C', 'The news is very good to be true.', false, 3), ('D', 'The news is good that it can be true.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'CN7';
commit;
