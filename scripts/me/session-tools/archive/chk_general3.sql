-- ME Paper III (General): BCSE 2025 + similar, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'bhutan-institutions-development'), 'agriculture-and-rnr', 'Agriculture and RNR' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'bhutan-institutions-development'), 'constitution-and-governance', 'Constitution and governance' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'bhutan-institutions-development'), 'economy-and-fiscal-policy', 'Economy and fiscal policy' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'bhutan-institutions-development'), 'education-and-human-capital', 'Education and human capital' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'bhutan-institutions-development'), 'foreign-relations-and-political-history', 'Foreign relations and political history' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'bhutan-institutions-development'), 'history-and-heritage', 'History and heritage' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'bhutan-institutions-development'), 'monarchy-and-national-identity', 'Monarchy and national identity' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'bhutan-institutions-development'), 'population-and-migration', 'Population and migration' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'bhutan-institutions-development'), 'urbanisation', 'Urbanisation' on conflict (subject_id, slug) do nothing;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-general-3') and subject_group_id is not distinct from null;
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-general-3'), null, null, 1, 'Part A: Bhutan and its socio-political institutions', 'long_answer', 4, 20, 2, 'BCSE 2025 Main Examination, General category, Paper III');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-general-3'), null, null, 2, 'Part B: Bhutan and its socio-economic development since 1961', 'analytical', 5, 20, 3, 'BCSE 2025 Main Examination, General category, Paper III');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'a) "The Constitution of the Kingdom of Bhutan was introduced by His Majesty the Fourth Druk Gyalpo, Jigme Singye Wangchuck as a visionary initiative to transition the nation into a democratic Constitutional Monarchy."
As a proud and informed citizen, how would you present the distinct and visionary features of Bhutan''s Constitution at an international seminar? You may support your response with relevant comparisons to the constitution of another country. (10 marks)', 'a) At an international seminar I would begin by explaining that Bhutan''s democracy was a gift from the Throne. His Majesty the Fourth Druk Gyalpo started the drafting of the Constitution, had it discussed with people in every dzongkhag, and the Constitution was adopted in 2008. Few countries have moved to democracy so peacefully and by the monarch''s own will.

I would then present its distinct features:
- Gross National Happiness: the State must promote conditions that enable the pursuit of GNH, so wellbeing, not only economic growth, guides policy.
- Environment: at least 60 percent of the land must remain under forest cover for all time, and every Bhutanese is a trustee of the country''s natural resources.
- Monarchy with accountability: the Druk Gyalpo retires at the age of 65, and Parliament can, under strict conditions, start a process for abdication. This protects the nation more than the person.
- Balanced institutions: an apolitical National Council reviews laws alongside the elected National Assembly, and independent bodies such as the Election Commission, the Anti-Corruption Commission and the Royal Audit Authority keep power in check.
- Culture and identity: the State protects Bhutan''s cultural heritage and spiritual values.

Comparison: the Constitution of India is one of the longest in the world and focuses on rights and a federal structure, but it does not set an environmental target or happiness as a state goal. The United Kingdom has no single written constitution. Bhutan''s Constitution is short, written, and built around values that are uniquely Bhutanese.', null, '[{"point": "Democracy was given from the Throne, not won through struggle; the Constitution was adopted in 2008 after nationwide consultation", "marks": 2}, {"point": "Visionary features: Gross National Happiness as a state goal; at least 60% forest cover for all time; the Druk Gyalpo''s retirement age and a procedure for abdication; an apolitical National Council; independent constitutional bodies", "marks": 5}, {"point": "A fair comparison with another constitution (for example, India''s or the UK''s unwritten constitution) showing what is distinctive in Bhutan''s", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'constitution-and-governance'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-a1', 1, null, null)
  returning id
)
insert into me_q select 'A1a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.0, 1 from me_q where key = 'A1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.0, 2 from me_q where key = 'A1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.5, 3 from me_q where key = 'A1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.5, 4 from me_q where key = 'A1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'b) "Dzongs are monumental structures that symbolize Bhutan''s cultural and spiritual heritage. Their construction has evolved over time, reflecting changing purposes influenced by historical, religious, and political contexts."
Analyse how the purpose and significance of dzongs differ across three key periods in Bhutanese history: the pre-Zhabdrung era, the Zhabdrung era, and the modern period. What do these differences reveal about the evolving priorities and identity of Bhutan? (10 marks)', 'b) Pre-Zhabdrung era: buildings were smaller fortress-temples built by local lords and lamas of different religious schools. They mainly protected local communities and supported local religious life; there was no single national purpose.

Zhabdrung era: Zhabdrung Ngawang Namgyel built dzongs such as Simtokha, Punakha and others as strongholds against invasion and as seats of the dual system of governance, where the monastic body and the civil administration worked side by side. The dzongs unified the country and expressed a new national authority.

Modern period: dzongs house the dzongkhag administration, the courts in many places and the monastic body. They are centres of tshechus and national events and are protected as heritage with traditional architecture.

What this shows: Bhutan''s priorities moved from local defence, to national unity under the dual system, to good governance and preserving identity. The dzong still joins spiritual and secular life, which shows that Bhutan modernises without losing its roots.', null, '[{"point": "Pre-Zhabdrung: smaller fortresses and temples of local lords and religious schools, built mainly for defence and local religious life", "marks": 3}, {"point": "Zhabdrung era: dzongs as the seat of the dual system (religious and secular administration), defence and national unification", "marks": 4}, {"point": "Modern period: centres of district administration and the monastic body, symbols of identity and heritage; what this shows about Bhutan''s priorities", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'constitution-and-governance'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-a1', 2, null, null)
  returning id
)
insert into me_q select 'A1b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.0, 1 from me_q where key = 'A1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.0, 2 from me_q where key = 'A1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.5, 3 from me_q where key = 'A1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.5, 4 from me_q where key = 'A1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'a) "Druk Gyalpo Jigme Khesar Namgyel Wangchuck is revered as the People''s King for his unwavering commitment to the well-being of Bhutanese citizens through unparalleled Kidu initiatives."
Express three Kidu initiatives undertaken by His Majesty The Druk Gyalpo Jigme Khesar Namgyel Wangchuck. In your analysis, discuss the benefits of these initiatives on Bhutanese society and reflect on how, as a citizen, you can contribute to sustaining and upholding His Majesty''s love and care for the citizens. (10 marks)', 'a) Three Kidu initiatives of His Majesty:
1. Land Kidu: His Majesty travels to remote villages and grants land to landless families and regularises land holdings, so that every family has security.
2. Kidu for the vulnerable: monthly support for the elderly without care, persons with disabilities and other vulnerable people, and kidu for students so that no child leaves school for lack of money.
3. The Druk Gyalpo''s Relief Kidu during the COVID-19 pandemic, which supported thousands of people who lost jobs or income.

Benefits: these initiatives protect the weakest members of society, reduce poverty and inequality, and keep families and communities stable during hard times. They also build deep trust between the King and the people and strengthen national unity.

As a citizen I can uphold this care by working honestly and productively, using any support responsibly, helping neighbours and elderly people in my community, volunteering, for example as a Desuup, and paying my taxes. If every citizen cares for others, His Majesty''s vision becomes a shared national responsibility.', null, '[{"point": "Three correct Kidu initiatives, for example land kidu, monthly kidu for the elderly and vulnerable, scholarship/education kidu, the Druk Gyalpo''s Relief Kidu during COVID-19", "marks": 4}, {"point": "Benefits: security for the vulnerable, reduced inequality, trust and unity between King and people", "marks": 3}, {"point": "Citizen''s role: honest work, service (for example as a Desuup), helping neighbours, not misusing support", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'monarchy-and-national-identity'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-a2', 1, null, null)
  returning id
)
insert into me_q select 'A2a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.0, 1 from me_q where key = 'A2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.0, 2 from me_q where key = 'A2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.5, 3 from me_q where key = 'A2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.5, 4 from me_q where key = 'A2a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'b) "The unique national identity created by Zhabdrung Ngawang Namgyel makes us nationally united and culturally rooted, fostering a strong sense of belonging and pride in being Bhutanese."
In reference to this, what roles can you play as a citizen to help Bhutan promote its cultural values, language and traditions in the modern era, to help preserve and promote our national identity? (10 marks)', 'b) Zhabdrung Ngawang Namgyel unified Bhutan and gave it a distinct identity through the dual system of governance, dzongs, Driglam Namzha, the national dress and festivals. To keep this identity alive in the modern era, I can:
- Speak and write Dzongkha confidently, at work and at home, and encourage children to use it.
- Wear the gho or kira and the kabney or rachu correctly and practise Driglam Namzha in offices and public places.
- Take part in tshechus, local rituals and community events, and learn their meaning from elders.
- Use social media and digital tools to share Bhutanese songs, stories, crafts and food with young people and the world.
- Support local artisans and products made in Bhutan.

Modern life brings global culture, and it should not be rejected; but if each citizen practises and shares our traditions with pride, Bhutan stays modern while remaining rooted, which is the strength of our national identity.', null, '[{"point": "Brief link to Zhabdrung''s role: dual system, Driglam Namzha, national dress, dzongs and festivals", "marks": 3}, {"point": "Practical roles: speak and write Dzongkha, wear national dress, practise Driglam Namzha, take part in tshechus and community work", "marks": 4}, {"point": "Using modern tools to promote culture: social media, tourism, teaching children; balance with modern life", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'monarchy-and-national-identity'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-a2', 2, null, null)
  returning id
)
insert into me_q select 'A2b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.0, 1 from me_q where key = 'A2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.0, 2 from me_q where key = 'A2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.5, 3 from me_q where key = 'A2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.5, 4 from me_q where key = 'A2b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'a) "Bhutan has been referred to by various names throughout history, each reflecting significant historical, cultural, or religious contexts. The country''s rich tradition of toponymy reveals how Bhutanese and their neighbours perceived and conceptualised the land over time. Place names across the country often carry deep meanings rooted in local beliefs, historical events, or spiritual associations."
In light of this, discuss the FIVE ancient names attributed to Bhutan, and discuss how these names (toponyms) within Bhutan reflect its historical and religious narratives. Support your answer with relevant examples. (10 marks)', 'a) Bhutan''s ancient names show how people saw the land:
1. Lho Mon (the southern land of darkness): used before Buddhism spread widely, "darkness" meaning the absence of the Buddhist teachings.
2. Lho Mon Kha Shi (the southern Mon land of four approaches): describing the four main routes into the country.
3. Lho Jong Men Jong (the southern valleys of medicinal herbs): reflecting the rich medicinal plants of the valleys.
4. Lho Mon Tsenden Jong (the southern Mon land of cypress): after the cypress trees that grew widely.
5. Druk Yul (the land of the Thunder Dragon): from the Drukpa Kagyu school, which became the state religion; it is the name Bhutanese use today.

Place names inside Bhutan also carry history and faith. Many are linked to Guru Rinpoche and other saints, such as Taktsang (the tiger''s lair) in Paro and Kurjey (body imprint) in Bumthang. Others recall local deities, landscapes or events. These names keep the country''s religious and historical memory alive in daily language.', null, '[{"point": "Ancient names with meanings: Lho Mon (southern land of darkness, before Buddhism), Lho Mon Kha Shi (southern land of four approaches), Lho Jong Men Jong (southern valleys of medicinal herbs), Lho Mon Tsenden Jong (southern land of cypress), and Druk Yul (land of the Thunder Dragon)", "marks": 5}, {"point": "How place names reflect history and religion, with examples (for example names linked to Guru Rinpoche, sacred sites, battles or local deities)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'history-and-heritage'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-a3', 1, null, null)
  returning id
)
insert into me_q select 'A3a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.0, 1 from me_q where key = 'A3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.0, 2 from me_q where key = 'A3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.5, 3 from me_q where key = 'A3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.5, 4 from me_q where key = 'A3a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'b) "The future is neither unseen nor unknown. It is what we make of it. What work we do today with our two hands will shape the future of our nation. Our children''s tomorrow has to be created by us today." (His Majesty The Druk Gyalpo Jigme Khesar Namgyel Wangchuck)
As a youth of Bhutan, how can you contribute to shaping a future that is both sustainable and rooted in national values, while also addressing the evolving challenges of the modern world? (10 marks)', 'b) His Majesty reminds us that the future is built by our own effort. As a youth I can contribute by:
- Learning skills the country needs, working hard in any job and taking pride in manual and technical work, not only office jobs.
- Starting or supporting small enterprises in agriculture, tourism and technology so that young people find opportunities at home instead of leaving.
- Protecting the environment: reducing waste, saving energy, planting trees and supporting clean energy.
- Living national values: honesty, service and respect for culture, and volunteering through Desuung and community work.
- Facing modern challenges with digital skills and lifelong learning, so Bhutan can compete while staying true to GNH.

If each young person acts today, the nation''s tomorrow will be both prosperous and Bhutanese.', null, '[{"point": "Youth roles for a sustainable future: skills and hard work, entrepreneurship, protecting the environment", "marks": 4}, {"point": "Rooted in national values: GNH, service, honesty, culture; volunteering (Desuung, Gyalsung)", "marks": 3}, {"point": "Facing modern challenges: digital skills, migration, unemployment, climate change; a clear personal commitment", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'history-and-heritage'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-a3', 2, null, null)
  returning id
)
insert into me_q select 'A3b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.0, 1 from me_q where key = 'A3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.0, 2 from me_q where key = 'A3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.5, 3 from me_q where key = 'A3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.5, 4 from me_q where key = 'A3b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'a) "The 2007 revision of the Bhutan-India Friendship Treaty fundamentally transformed Bhutan''s foreign policy autonomy. This crucial change significantly shaped Bhutan''s identity as a sovereign nation." Do you agree? Justify your answer. (10 marks)', 'a) I agree, with one qualification. Under the 1949 treaty, Bhutan agreed to be guided by the advice of India in its external relations. The 2007 revision replaced this with a commitment that both countries would cooperate closely on issues relating to their national interests, and it removed the earlier limits on Bhutan importing arms and equipment. Bhutan could now conduct its foreign policy as a fully sovereign state, which suited its move to a democratic Constitutional Monarchy in 2008.

This change strengthened Bhutan''s identity: Bhutan is seen as an equal partner, it builds its own diplomatic relations and takes positions in the United Nations and other forums in its own name. However, the revision did not weaken the friendship with India; cooperation in hydropower, trade and development continued and even deepened. So the revision transformed Bhutan''s autonomy in law and perception, while keeping a close, trusted partnership.', null, '[{"point": "Clear stand (agree, with balance)", "marks": 1}, {"point": "What changed: the 1949 treaty''s clause on being guided by India''s advice in external relations was replaced by close cooperation on issues of national interest; arms imports no longer needed the same approval", "marks": 4}, {"point": "How it strengthened sovereignty and identity, while the close friendship and cooperation with India continued", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'foreign-relations-and-political-history'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-a4', 1, null, null)
  returning id
)
insert into me_q select 'A4a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.0, 1 from me_q where key = 'A4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.0, 2 from me_q where key = 'A4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.5, 3 from me_q where key = 'A4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.5, 4 from me_q where key = 'A4a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'b) If the feudal system of governance had persisted in Bhutan, how might the country''s political and economic development have unfolded? In your response, critically examine the potential implications of feudal rule by considering structural challenges, leadership instability, and the influence of regional powers on Bhutan''s sovereignty and development. (10 marks)', 'b) Before the monarchy was established in 1907, Bhutan was divided among powerful regional governors (penlops and dzongpons) who often fought each other, and the central authority was weak.

If this feudal system had continued:
- Structural challenges: there would be no single administration, budget or plan. Roads, schools and hospitals would depend on the will of local rulers, and planned development such as the Five-Year Plans from 1961 would not have been possible.
- Leadership instability: succession disputes and civil wars would have continued, discouraging trade, farming and investment.
- Regional powers: a divided Bhutan would have been easy for neighbouring powers to influence or absorb, as happened to other small Himalayan states, putting sovereignty at risk.

Under the Wangchuck dynasty, Bhutan instead gained stable leadership, unified administration, planned development and international recognition, including membership of the United Nations in 1971. This contrast shows how important the end of feudal rule was for Bhutan''s survival and progress.', null, '[{"point": "Feudal rule before 1907: rival penlops and dzongpons, civil wars", "marks": 3}, {"point": "Implications: no unified administration, insecurity, slow economic development, no national planning", "marks": 4}, {"point": "Regional powers: risk of foreign interference or loss of sovereignty; contrast with stability under the monarchy", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'foreign-relations-and-political-history'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-a4', 2, null, null)
  returning id
)
insert into me_q select 'A4b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.0, 1 from me_q where key = 'A4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.0, 2 from me_q where key = 'A4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.5, 3 from me_q where key = 'A4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.5, 4 from me_q where key = 'A4b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'The National Assembly on June 16, 2025 adopted the Goods and Services Tax (Amendment) Bill, reducing the GST rate to 5 percent on taxable goods and services, with implementation set for January 1, 2026.

a) How might the reduction of GST to 5 percent impact government revenue, consumer prices, and the competitiveness of businesses in Bhutan? (10 marks)', 'a) Government revenue: a 5 percent rate brings in less tax on each sale than a higher rate would. In the short term, revenue may fall. Over time, a moderate rate can improve compliance and widen the tax base as more businesses register and more goods are bought in Bhutan instead of across the border, which can partly make up the loss.

Consumer prices: GST adds to the price of taxable goods and services. A low rate keeps this increase small, protecting household budgets, especially if businesses pass the benefit to customers rather than keeping it as profit.

Competitiveness: a lower rate reduces costs for businesses and makes Bhutanese goods and services more attractive compared with imports and shopping in neighbouring towns. Small businesses can adjust more easily, and tourism and services may become more competitive.', null, '[{"point": "Revenue: lower rate per sale, but possible higher compliance and consumption; short-term revenue risk", "marks": 3}, {"point": "Prices: smaller increase in consumer prices; consumers benefit if businesses pass it on", "marks": 3}, {"point": "Competitiveness: lower costs, easier compliance, competition with imports and cross-border shopping", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'economy-and-fiscal-policy'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-b1', 1, null, null)
  returning id
)
insert into me_q select 'B1a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.0, 1 from me_q where key = 'B1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.0, 2 from me_q where key = 'B1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.5, 3 from me_q where key = 'B1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.5, 4 from me_q where key = 'B1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'The National Assembly on June 16, 2025 adopted the Goods and Services Tax (Amendment) Bill, reducing the GST rate to 5 percent on taxable goods and services, with implementation set for January 1, 2026.

b) To what extent can this tax reform contribute to Bhutan''s broader development goals, such as sustainable economic growth, poverty reduction, and social equity? (10 marks)', 'b) The reform can support development, but only partly:
- Sustainable growth: lower taxes can encourage spending, investment and a formal economy with better records, helping long-term growth.
- Poverty reduction: GST is a consumption tax, which takes a larger share of income from poorer households. A low rate, together with exemptions on essential goods, reduces this burden.
- Social equity: the effect on equity depends on how the government uses its revenue. If revenue falls, spending on health, education and social protection could be squeezed.

So the reform helps by keeping prices stable and making business easier, but to reduce poverty and inequality it must be combined with careful exemptions, efficient spending and other measures such as job creation.', null, '[{"point": "Growth: consumption and business activity; simpler tax system", "marks": 4}, {"point": "Poverty and equity: GST is a consumption tax that weighs more on the poor; a low rate and exemptions on essentials help; limits of the reform", "marks": 4}, {"point": "Balanced conclusion (to what extent)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'economy-and-fiscal-policy'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-b1', 2, null, null)
  returning id
)
insert into me_q select 'B1b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.0, 1 from me_q where key = 'B1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.0, 2 from me_q where key = 'B1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.5, 3 from me_q where key = 'B1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.5, 4 from me_q where key = 'B1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'In the 13th Five Year Plan, the Agriculture and Renewable Natural Resource (RNR) sector in Bhutan aims to increase its contribution to the national GDP from Nu. 31 billion to Nu. 50 billion by the year 2029.

a) Why is this target important for Bhutan''s economy and self-reliance? (5 marks)', 'a) The target matters because most rural Bhutanese depend on agriculture and livestock. Raising the sector''s output increases rural incomes and jobs, reduces the large food import bill, strengthens food and nutrition security and makes Bhutan more self-reliant. It also helps diversify the economy so that growth does not depend mainly on hydropower.', null, '[{"point": "Food self-sufficiency, fewer imports, rural jobs and incomes, balanced growth beyond hydropower", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'agriculture-and-rnr'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-b2', 1, null, null)
  returning id
)
insert into me_q select 'B2a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 1.5, 1 from me_q where key = 'B2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 1.5, 2 from me_q where key = 'B2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B2a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'In the 13th Five Year Plan, the Agriculture and Renewable Natural Resource (RNR) sector in Bhutan aims to increase its contribution to the national GDP from Nu. 31 billion to Nu. 50 billion by the year 2029.

b) What challenges may the sector face in achieving this goal? (7 marks)', 'b) Challenges:
- Small, scattered and steep landholdings that are hard to mechanise.
- Labour shortage as young people move to towns or abroad, leaving fallow land.
- Human-wildlife conflict and crop damage.
- Climate change: erratic rain, drought and pests.
- High production costs and competition from cheaper imports.
- Weak post-harvest storage, processing and market access.', null, '[{"point": "Challenges: small and scattered landholdings, labour shortage and rural-urban migration, human-wildlife conflict, climate change, high costs, limited markets and processing", "marks": 7}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'agriculture-and-rnr'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 7,
    756, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-b2', 2, null, null)
  returning id
)
insert into me_q select 'B2b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 3.0, 1 from me_q where key = 'B2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 2.0, 2 from me_q where key = 'B2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B2b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'In the 13th Five Year Plan, the Agriculture and Renewable Natural Resource (RNR) sector in Bhutan aims to increase its contribution to the national GDP from Nu. 31 billion to Nu. 50 billion by the year 2029.

c) What strategies or innovations could help realise this vision? (8 marks)', 'c) Strategies:
- Farm mechanisation suited to hills, and better irrigation including drip and solar pumps.
- Focus on high-value and niche products such as organic vegetables, fruits, spices, mushrooms and dairy, with Bhutanese branding for export.
- Cooperatives and commercial farming so small farmers can produce at scale and sell together.
- Processing and value addition near farms, creating jobs.
- Market links: contract farming with schools, hotels and the armed forces, and export channels.
- Technology: improved seeds, digital information for farmers and climate-smart practices.
- Incentives and training to attract youth into agribusiness.

With these measures the sector can grow towards the target while protecting the environment.', null, '[{"point": "Strategies: mechanisation and irrigation, high-value and organic products, commercial farming and cooperatives, processing and value addition, market links and export, technology and extension, youth in agriculture", "marks": 8}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'agriculture-and-rnr'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-b2', 3, null, null)
  returning id
)
insert into me_q select 'B2c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 3.5, 1 from me_q where key = 'B2c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 2.5, 2 from me_q where key = 'B2c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B2c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B2c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'Currently, around 66,000 Bhutanese, which is 8.5% of the population, reside overseas. This group represents a critical segment of the workforce, possessing good education and valuable skills across various sectors. Addressing workforce migration has become a national priority.

Critically analyse and pen down your thoughts on the following:

a) The possible reasons behind the increasing migration of Bhutanese workers. (5 marks)', 'a) Reasons for migration:
- Much higher wages abroad, for example in Australia, compared with salaries at home.
- Limited jobs and slow career growth, especially in the private sector.
- Rising cost of living and the wish to save for a house or family needs.
- Opportunities to study and gain international experience.
- Influence of friends and relatives who have already gone.', null, '[{"point": "Reasons: higher wages abroad, limited jobs and career growth, cost of living, education opportunities, peer influence", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'population-and-migration'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-b3', 1, null, null)
  returning id
)
insert into me_q select 'B3a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 1.5, 1 from me_q where key = 'B3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 1.5, 2 from me_q where key = 'B3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B3a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'Currently, around 66,000 Bhutanese, which is 8.5% of the population, reside overseas. This group represents a critical segment of the workforce, possessing good education and valuable skills across various sectors. Addressing workforce migration has become a national priority.

Critically analyse and pen down your thoughts on the following:

b) The socio-economic impacts this trend may have on the country. (5 marks)', 'b) Socio-economic impacts:
- Loss of skilled people such as nurses, teachers, engineers and civil servants, which can weaken public services.
- Fewer young workers and an older rural population.
- Remittances support families and bring foreign currency, and returnees may bring new skills.
- Families are separated, and the country''s long-term human capital is reduced if people do not return.', null, '[{"point": "Impacts: skills shortage in health, education and civil service; ageing rural population; remittances as a positive; family and social effects", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'population-and-migration'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-b3', 2, null, null)
  returning id
)
insert into me_q select 'B3b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 1.5, 1 from me_q where key = 'B3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 1.5, 2 from me_q where key = 'B3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B3b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'Currently, around 66,000 Bhutanese, which is 8.5% of the population, reside overseas. This group represents a critical segment of the workforce, possessing good education and valuable skills across various sectors. Addressing workforce migration has become a national priority.

Critically analyse and pen down your thoughts on the following:

c) Practical strategies Bhutan can adopt to retain and reintegrate skilled human capital. (10 marks)', 'c) Strategies to retain and reintegrate:
- Improve pay, allowances and clear career paths for professionals in short supply.
- Create good private-sector jobs through investment, including in the Gelephu Mindfulness City and new industries.
- Recognise skills and qualifications gained abroad, and offer returnees fast-track jobs or support to start businesses.
- Engage the diaspora: online networks, short-term assignments and investment schemes so they can contribute from abroad.
- Improve quality of life at home: housing, childcare, good schools and health care.
- Plan the workforce: train more people in shortage fields so that departures do not leave gaps.

Migration cannot be stopped completely, but by making Bhutan a rewarding place to work and welcoming people back, the country can turn brain drain into brain circulation.', null, '[{"point": "Strategies: better pay and career paths, opportunities in the private sector and GMC, recognising foreign skills, return incentives, diaspora engagement, improving quality of life", "marks": 10}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'population-and-migration'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-b3', 3, null, null)
  returning id
)
insert into me_q select 'B3c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.0, 1 from me_q where key = 'B3c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.0, 2 from me_q where key = 'B3c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.5, 3 from me_q where key = 'B3c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.5, 4 from me_q where key = 'B3c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'According to the National Statistics Bureau, the population of Bhutan will continue to increase, but at a slower pace than in the recent past. The resident population is projected to reach 884 thousand by 2047, staying well below the one million mark. Bhutan has been experiencing a steep fertility decline, and fertility is expected to remain below replacement level in the foreseeable future. The birth rate will decline substantially to 11 per thousand, and the annual growth rate will fall from the current level of 1 percent to less than 0.3 percent in 2047.

a) What are the possible causes of declining fertility and population growth in Bhutan? (6 marks)', 'a) Causes of declining fertility:
- More girls and women in education and paid work, so they marry and have children later.
- Higher cost of living, housing and education, making families choose fewer children.
- Urbanisation and smaller nuclear families.
- Easy access to family planning and better child survival, so parents no longer need many children.
- Many young adults moving abroad during their child-bearing years.', null, '[{"point": "Causes: education and employment of women, later marriage, cost of raising children, urbanisation, family planning, migration of young adults", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'population-and-migration'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-b4', 1, null, null)
  returning id
)
insert into me_q select 'B4a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 2.0, 1 from me_q where key = 'B4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 2.0, 2 from me_q where key = 'B4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B4a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'According to the National Statistics Bureau, the population of Bhutan will continue to increase, but at a slower pace than in the recent past. The resident population is projected to reach 884 thousand by 2047, staying well below the one million mark. Bhutan has been experiencing a steep fertility decline, and fertility is expected to remain below replacement level in the foreseeable future. The birth rate will decline substantially to 11 per thousand, and the annual growth rate will fall from the current level of 1 percent to less than 0.3 percent in 2047.

b) How might these demographic changes affect the country''s economic development, workforce, and social systems? (8 marks)', 'b) Effects:
- Workforce: fewer young people entering work leads to labour shortages in farming, construction and services.
- Economy: a smaller workforce can slow growth unless productivity rises; demand for some goods and services falls.
- Social systems: an ageing population increases demand for health care, elderly care and pensions, while fewer workers pay contributions. Fewer children will enrol in schools, and some rural schools may close.
- Opportunity: smaller families can invest more in each child''s education and health.', null, '[{"point": "Effects: smaller workforce and labour shortages, ageing population and pressure on pensions and health care, school enrolments fall, economic growth slows; possible benefits such as higher investment per child", "marks": 8}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'population-and-migration'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-b4', 2, null, null)
  returning id
)
insert into me_q select 'B4b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 3.5, 1 from me_q where key = 'B4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 2.5, 2 from me_q where key = 'B4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B4b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'According to the National Statistics Bureau, the population of Bhutan will continue to increase, but at a slower pace than in the recent past. The resident population is projected to reach 884 thousand by 2047, staying well below the one million mark. Bhutan has been experiencing a steep fertility decline, and fertility is expected to remain below replacement level in the foreseeable future. The birth rate will decline substantially to 11 per thousand, and the annual growth rate will fall from the current level of 1 percent to less than 0.3 percent in 2047.

c) What policies or strategies can the government adopt to manage the challenges and opportunities of a slow-growing population? (6 marks)', 'c) Policies:
- Family-friendly measures: childcare centres, extended parental leave, housing support and flexible work.
- Raise productivity with technology, mechanisation and skills, so fewer workers can produce more.
- Retain and attract back young Bhutanese with good jobs.
- Prepare for ageing: strengthen pensions, community-based elderly care and preventive health.
- Plan schools and services for changing numbers, and allow well-managed foreign labour where shortages are serious.', null, '[{"point": "Policies: family-friendly support (childcare, parental leave, housing), productivity and technology, retaining youth, healthy ageing and pension reform, managed foreign labour", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'population-and-migration'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-b4', 3, null, null)
  returning id
)
insert into me_q select 'B4c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 2.0, 1 from me_q where key = 'B4c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 2.0, 2 from me_q where key = 'B4c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B4c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B4c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'The Government launched a new concessional education loan scheme under the Economic Stimulus Plan (ESP), aiming to provide financial aid for Class XII graduates from disadvantaged economic backgrounds seeking to pursue tertiary or vocational courses.

a) What do you understand by the Economic Stimulus Plan (ESP)? Why was the ESP introduced at this stage in our country? (7 marks)', 'a) An Economic Stimulus Plan is a package of government measures, such as public spending, cheap credit and targeted support, meant to restart economic activity when the economy is weak. Bhutan''s ESP aims to support businesses, create jobs and strengthen key sectors.

It was introduced at this stage because the economy has been recovering slowly after the COVID-19 pandemic, youth unemployment is high, many skilled people are leaving the country, and private investment is low. A stimulus helps restore growth and confidence and builds skills for the future.', null, '[{"point": "ESP: a government programme injecting funds (spending, credit and support) to revive economic activity, jobs and businesses", "marks": 3}, {"point": "Why now: slow recovery after COVID-19, unemployment especially among youth, migration of workers, low private investment", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'education-and-human-capital'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 7,
    756, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-b5', 1, null, null)
  returning id
)
insert into me_q select 'B5a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 3.0, 1 from me_q where key = 'B5a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 2.0, 2 from me_q where key = 'B5a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B5a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B5a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'The Government launched a new concessional education loan scheme under the Economic Stimulus Plan (ESP), aiming to provide financial aid for Class XII graduates from disadvantaged economic backgrounds seeking to pursue tertiary or vocational courses.

b) Critically analyse the impact that this concessional education loan scheme may have in our society, and highlight both the opportunities and possible implementation challenges of this scheme. (13 marks)', 'b) Opportunities:
- Students from poor families can join tertiary and vocational courses they could not otherwise afford, reducing inequality.
- The country gains more skilled workers, technicians and professionals, which supports growth and reduces dependence on foreign labour.
- Fewer young people are left idle after Class XII, which reduces social problems.
- Vocational training gains status as a valued path, not a second choice.

Possible implementation challenges:
- Targeting: making sure loans reach truly disadvantaged students, with clear and fair criteria.
- Repayment: graduates who cannot find jobs may struggle to repay, creating debt and default.
- Course quality and relevance: loans must fund courses that lead to real jobs in Bhutan.
- Awareness and access: rural students must know about the scheme and be able to apply easily.
- Administration and funding: the government and banks need capacity to manage the scheme.

Overall, the scheme can be a strong investment in human capital if it is well targeted, linked to job-relevant courses and has flexible, income-based repayment.', null, '[{"point": "Opportunities: access to higher and vocational education for poor students, skills for the economy, reduced inequality, fewer dropouts", "marks": 6}, {"point": "Challenges: fair targeting, repayment and default risk, graduates without jobs, quality and relevance of courses, awareness in rural areas, administrative capacity", "marks": 5}, {"point": "Balanced judgement and suggestions", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'education-and-human-capital'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 13,
    1404, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper III", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Paper-III.pdf"}}'::jsonb, 'me-general-3-2025b1-b5', 2, null, null)
  returning id
)
insert into me_q select 'B5b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 5.0, 1 from me_q where key = 'B5b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 4.0, 2 from me_q where key = 'B5b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 2.0, 3 from me_q where key = 'B5b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 2.0, 4 from me_q where key = 'B5b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'a) "Parliament of Bhutan consists of the Druk Gyalpo, the National Council and the National Assembly."
Explain how the roles of the National Council and the National Assembly differ, and why the Constitution keeps the National Council apolitical. (10 marks)', 'a) The National Assembly is elected through political parties. The party that wins forms the government, and the Assembly introduces and passes most laws, including the budget and money bills, and holds the government to account.

The National Council is the house of review. It has one member elected from each dzongkhag and eminent members nominated by the Druk Gyalpo. It reviews bills passed by the Assembly, raises issues of national importance and reviews government policy, but it does not form the government.

The Constitution keeps the National Council apolitical so that its members are not bound by party lines. It can give independent advice in the national interest, provide continuity when governments change, and balance the power of the ruling party.', null, '[{"point": "National Assembly: elected through political parties, forms the government, introduces most bills including money bills", "marks": 4}, {"point": "National Council: apolitical house of review with members from each dzongkhag and eminent members nominated by the Druk Gyalpo; reviews laws, policy and security matters", "marks": 4}, {"point": "Why apolitical: independent review above party interests, continuity, balance", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'constitution-and-governance'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'A1a'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-a1s', 1, null, null)
  returning id
)
insert into me_q select 'A1sa', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.0, 1 from me_q where key = 'A1sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.0, 2 from me_q where key = 'A1sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.5, 3 from me_q where key = 'A1sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.5, 4 from me_q where key = 'A1sa';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'b) "Lhakhangs, chortens and dzongs are not only places of worship but also living centres of community life."
Discuss how religious and community structures have shaped social life in Bhutanese villages in the past and how their role is changing today. (10 marks)', 'b) In the past, lhakhangs, chortens and dzongs were the heart of village life. People gathered there for rituals and tshechus, children learnt from monks, elders discussed village matters, and community labour was organised around them. They gave people a shared identity and values of compassion and cooperation.

Today they remain important for faith, festivals and identity. But migration to towns and abroad means fewer people maintain them, and modern entertainment competes with community gatherings. At the same time they are protected as heritage, attract tourists and are used for new purposes such as community meetings and youth programmes. Keeping them alive needs both government support and community participation.', null, '[{"point": "Past: centres of worship, festivals, learning, decision-making and mutual help", "marks": 5}, {"point": "Today: still central but affected by migration and modern life; heritage, tourism and new community roles", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'constitution-and-governance'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'A1b'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-a1s', 2, null, null)
  returning id
)
insert into me_q select 'A1sb', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.0, 1 from me_q where key = 'A1sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.0, 2 from me_q where key = 'A1sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.5, 3 from me_q where key = 'A1sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.5, 4 from me_q where key = 'A1sb';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'a) "The Desuung programme, initiated by His Majesty The Druk Gyalpo, has become a symbol of selfless national service."
Describe the purpose of the Desuung programme and discuss how it strengthens national unity and resilience. Give examples of situations where Desuups have served the nation. (10 marks)', 'a) Desuung, meaning "guardians of peace", is a national service programme started by His Majesty The Druk Gyalpo. Citizens receive training in discipline, first aid and disaster response, and become Desuups who volunteer for the nation when needed.

Examples: during the COVID-19 pandemic Desuups worked at borders, quarantine centres and in communities; they help during floods and other disasters; they support national events; and they have contributed to major national projects.

Desuung strengthens unity because people from all backgrounds wear the same orange uniform and serve side by side. It builds a culture of volunteerism and discipline and creates a trained reserve of citizens, making the nation more resilient in crises.', null, '[{"point": "Purpose: training citizens to serve the nation selflessly, especially in times of need", "marks": 3}, {"point": "Examples: COVID-19 response, disaster relief such as floods, national events, Gelephu Mindfulness City groundwork", "marks": 4}, {"point": "Unity and resilience: volunteerism, discipline, shared purpose across backgrounds", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'monarchy-and-national-identity'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'A2a'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-a2s', 1, null, null)
  returning id
)
insert into me_q select 'A2sa', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.0, 1 from me_q where key = 'A2sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.0, 2 from me_q where key = 'A2sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.5, 3 from me_q where key = 'A2sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.5, 4 from me_q where key = 'A2sa';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'b) Driglam Namzha is often described as the foundation of Bhutanese etiquette. Explain its importance in the civil service and in daily life, and suggest how it can be kept meaningful for young people. (10 marks)', 'b) Driglam Namzha is the traditional code of conduct promoted since Zhabdrung''s time. It covers how we dress, speak, sit, greet and show respect.

In the civil service it promotes professionalism and discipline, respect towards seniors and the public, and a dignified image of the government. In daily life it keeps harmony in families and communities and expresses Bhutanese identity.

To keep it meaningful for young people, its values (respect, humility, consideration for others) should be explained, not only its rules. Elders and leaders should model it, schools should teach it in practical, friendly ways, and it should be adapted sensibly to modern settings.', null, '[{"point": "Meaning: code of conduct (dress, speech, respect, behaviour) from Zhabdrung''s time", "marks": 3}, {"point": "Civil service: professionalism, respect for citizens and seniors, discipline", "marks": 4}, {"point": "Making it meaningful for youth: explaining values, modelling, practical training", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'monarchy-and-national-identity'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'A2b'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-a2s', 2, null, null)
  returning id
)
insert into me_q select 'A2sb', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.0, 1 from me_q where key = 'A2sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.0, 2 from me_q where key = 'A2sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.5, 3 from me_q where key = 'A2sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.5, 4 from me_q where key = 'A2sb';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'a) "The arrival of Guru Rinpoche in the 8th century is a turning point in Bhutan''s history."
Discuss the contribution of Guru Rinpoche to the spread of Buddhism in Bhutan, with examples of sacred sites associated with him. (10 marks)', 'a) Guru Rinpoche (Padmasambhava) came to Bhutan in the 8th century and is regarded as the second Buddha. According to tradition, he came to Bumthang to heal Sindhu Raja and subdued the negative forces that troubled the land, and he spread Buddhist teachings that became the foundation of Bhutan''s culture.

Sacred sites include Paro Taktsang, where he meditated after arriving on a flying tigress, and Kurjey Lhakhang in Bumthang, where he left his body imprint on a rock. Many other caves and temples across the country are associated with him.

His influence continues in tshechus, which celebrate his deeds, in the Nyingma tradition, and in values of compassion and non-violence that shape Bhutanese life.', null, '[{"point": "Guru Rinpoche''s arrival and role in establishing Buddhism; subduing negative forces; Nyingma tradition", "marks": 4}, {"point": "Sacred sites: Taktsang (Paro), Kurjey (Bumthang), Singye Dzong and others", "marks": 3}, {"point": "Lasting influence: festivals, culture, values", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'history-and-heritage'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'A3a'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-a3s', 1, null, null)
  returning id
)
insert into me_q select 'A3sa', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.0, 1 from me_q where key = 'A3sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.0, 2 from me_q where key = 'A3sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.5, 3 from me_q where key = 'A3sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.5, 4 from me_q where key = 'A3sa';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'b) "Gross National Happiness is Bhutan''s gift to the world."
As a young Bhutanese, explain how the four pillars of GNH can guide your choices in education, work and community life. (10 marks)', 'b) The four pillars of GNH are good governance, sustainable and equitable socio-economic development, preservation and promotion of culture, and environmental conservation.

- In education, I can study not only for marks but for skills that serve the country, and value character and wellbeing along with achievement.
- In work, I can be honest and accountable (good governance), work productively and support fair development, and choose environmentally responsible practices.
- In community life, I can take part in cultural events, speak Dzongkha, reduce waste, plant trees and help those in need.

GNH reminds me that success means balance between material progress, culture, nature and wellbeing.', null, '[{"point": "The four pillars: good governance, sustainable socio-economic development, preservation and promotion of culture, environmental conservation", "marks": 4}, {"point": "Applying them to own education, work and community with examples", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'history-and-heritage'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'A3b'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-a3s', 2, null, null)
  returning id
)
insert into me_q select 'A3sb', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.0, 1 from me_q where key = 'A3sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.0, 2 from me_q where key = 'A3sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.5, 3 from me_q where key = 'A3sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.5, 4 from me_q where key = 'A3sb';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'a) "Membership of the United Nations in 1971 was a landmark in Bhutan''s journey as a sovereign nation."
Discuss the significance of UN membership for Bhutan and how Bhutan has used international forums to promote its values. (10 marks)', 'a) Joining the United Nations in 1971 confirmed Bhutan''s status as a sovereign, independent nation recognised by the world community. It opened doors to development partners and UN agencies that supported health, education and infrastructure, and it gave Bhutan a voice in global affairs.

Bhutan has used international forums to share its values. It promoted the idea of happiness and wellbeing as a development goal at the UN, it speaks for climate action as a carbon-negative country, and it builds friendships through quiet, principled diplomacy as a small state.', null, '[{"point": "Significance: international recognition of sovereignty, access to development partners, a voice in world affairs", "marks": 5}, {"point": "Promoting values: GNH and wellbeing at the UN, climate action and carbon-neutral commitment, small-state diplomacy", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'foreign-relations-and-political-history'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'A4a'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-a4s', 1, null, null)
  returning id
)
insert into me_q select 'A4sa', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.0, 1 from me_q where key = 'A4sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.0, 2 from me_q where key = 'A4sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.5, 3 from me_q where key = 'A4sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.5, 4 from me_q where key = 'A4sa';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'long_answer', 'b) "Decentralisation brings government closer to the people."
Examine the role of local governments (Dzongkhag Tshogdu, Gewog Tshogde and Thromde) in Bhutan''s democracy, and suggest how their effectiveness can be improved. (10 marks)', 'b) Local governments bring decisions closer to the people. Dzongkhag Tshogdus, Gewog Tshogdes and Thromdes plan and implement local development such as farm roads, water supply and community facilities, approve local plans and budgets, and allow citizens to take part through their elected representatives. This builds accountability and ownership.

Their effectiveness can be improved by training local leaders in planning and financial management, giving them adequate and predictable funds, coordinating better with central agencies, encouraging participation of women and youth, and making decisions and spending transparent to the public.', null, '[{"point": "Roles: local planning and budgeting, development activities, participation of people, accountability", "marks": 5}, {"point": "Improvements: capacity of local leaders, adequate funds, coordination with central agencies, participation of youth and women, transparency", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'foreign-relations-and-political-history'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'A4b'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-a4s', 2, null, null)
  returning id
)
insert into me_q select 'A4sb', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.0, 1 from me_q where key = 'A4sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.0, 2 from me_q where key = 'A4sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.5, 3 from me_q where key = 'A4sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.5, 4 from me_q where key = 'A4sb';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'Hydropower has been the backbone of Bhutan''s economy for decades, contributing a large share of government revenue and exports.

a) Explain the benefits that hydropower has brought to Bhutan''s socio-economic development. (8 marks)', 'a) Hydropower has given Bhutan steady revenue to fund free education and health care, roads and other public services. Electricity exports earn foreign currency and help the trade balance. Bhutanese households and industries enjoy clean and affordable electricity, and the construction of projects created jobs and infrastructure in many dzongkhags.', null, '[{"point": "Benefits: revenue for public services, export earnings, clean energy at home, infrastructure and jobs during construction", "marks": 8}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'economy-and-fiscal-policy'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 8,
    864, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B1a'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-b1s', 1, null, null)
  returning id
)
insert into me_q select 'B1sa', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 3.5, 1 from me_q where key = 'B1sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 2.5, 2 from me_q where key = 'B1sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B1sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B1sa';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'Hydropower has been the backbone of Bhutan''s economy for decades, contributing a large share of government revenue and exports.

b) Discuss the risks of depending heavily on one sector, and suggest how Bhutan can diversify its economy. (12 marks)', 'b) Risks of heavy dependence:
- A large share of income comes from one sector, so delays or problems in projects affect the whole economy.
- Large projects are financed with loans, increasing national debt.
- Generation falls in the dry winter months and may be affected by climate change and glacial changes.
- Hydropower provides few permanent jobs.
- Exports depend mainly on one market.

Ways to diversify:
- High-value, low-volume tourism with better products throughout the year.
- Commercial agriculture and agro-processing of niche products.
- IT, digital and creative services that suit educated youth.
- Small and cottage industries and clean manufacturing.
- Other renewables such as solar to stabilise supply.
- Investment and new industries through the Gelephu Mindfulness City.
- Support for entrepreneurs through finance, skills and easier regulation.

Diversification makes growth more stable and creates more jobs for Bhutanese.', null, '[{"point": "Risks: concentration, debt from projects, seasonal and climate risks, few long-term jobs, one main buyer", "marks": 6}, {"point": "Diversification: tourism, agriculture and agro-processing, IT and digital services, manufacturing, solar and other renewables, GMC, entrepreneurship", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'economy-and-fiscal-policy'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 12,
    1296, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B1b'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-b1s', 2, null, null)
  returning id
)
insert into me_q select 'B1sb', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.5, 1 from me_q where key = 'B1sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.5, 2 from me_q where key = 'B1sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 2.0, 3 from me_q where key = 'B1sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 2.0, 4 from me_q where key = 'B1sb';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'Human-wildlife conflict continues to be one of the major problems faced by Bhutanese farmers, leading to crop loss and fallow land.

a) Why is human-wildlife conflict a serious issue for rural livelihoods in Bhutan? (6 marks)', 'a) Wild animals such as wild boar, deer, monkeys and bears destroy crops and attack livestock. Farmers lose income and food, spend nights guarding their fields and suffer from fatigue. Many give up farming and leave land fallow, which increases rural-urban migration and food imports.', null, '[{"point": "Crop and livestock loss, night guarding, reduced income and food security, land left fallow, migration", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'agriculture-and-rnr'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 6,
    648, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B2a'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-b2s', 1, null, null)
  returning id
)
insert into me_q select 'B2sa', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 2.0, 1 from me_q where key = 'B2sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 2.0, 2 from me_q where key = 'B2sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B2sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B2sa';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'Human-wildlife conflict continues to be one of the major problems faced by Bhutanese farmers, leading to crop loss and fallow land.

b) Explain the measures taken so far to reduce this conflict and their limitations. (6 marks)', 'b) Measures so far include electric fencing of fields, crop and livestock insurance or compensation schemes, and community guarding. Their limitations are high cost and maintenance of fences, damage by animals or weather, slow or limited compensation, and coverage that does not reach every village.', null, '[{"point": "Measures: electric fencing, insurance or compensation schemes, guarding; limitations: cost, maintenance, coverage", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'agriculture-and-rnr'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 6,
    648, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B2b'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-b2s', 2, null, null)
  returning id
)
insert into me_q select 'B2sb', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 2.0, 1 from me_q where key = 'B2sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 2.0, 2 from me_q where key = 'B2sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B2sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B2sb';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'Human-wildlife conflict continues to be one of the major problems faced by Bhutanese farmers, leading to crop loss and fallow land.

c) Suggest innovative and sustainable solutions that balance conservation with farmers'' welfare. (8 marks)', 'c) Sustainable solutions:
- Community-managed electric fences with training in maintenance.
- Growing crops less attractive to wildlife near forests and using buffer zones.
- Early warning systems with sensors, lights and sirens.
- Affordable insurance that pays quickly.
- Sharing benefits of conservation, such as eco-tourism income, with affected communities.
- Research on wildlife behaviour and better land-use planning.

These solutions protect farmers'' livelihoods while keeping Bhutan''s commitment to wildlife conservation.', null, '[{"point": "Solutions: community-managed fencing, crop choice and zoning, early warning technology, insurance, eco-tourism benefits for communities, research", "marks": 8}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'agriculture-and-rnr'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 8,
    864, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B2c'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-b2s', 3, null, null)
  returning id
)
insert into me_q select 'B2sc', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 3.5, 1 from me_q where key = 'B2sc';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 2.5, 2 from me_q where key = 'B2sc';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B2sc';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B2sc';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'Youth unemployment remains a pressing concern in Bhutan, even as many graduates enter the job market every year.

a) What are the main causes of youth unemployment in Bhutan? (6 marks)', 'a) Causes of youth unemployment:
- A mismatch between the skills graduates have and the skills employers need.
- Strong preference for civil service and office jobs over technical and manual work.
- A small private sector and few industries.
- Limited experience and entrepreneurship among graduates.
- Many youth concentrated in towns where jobs are limited.', null, '[{"point": "Causes: mismatch between skills and jobs, preference for white-collar jobs, small private sector, limited industries, rural-urban migration", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'population-and-migration'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 6,
    648, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B3a'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-b3s', 1, null, null)
  returning id
)
insert into me_q select 'B3sa', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 2.0, 1 from me_q where key = 'B3sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 2.0, 2 from me_q where key = 'B3sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B3sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B3sa';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'Youth unemployment remains a pressing concern in Bhutan, even as many graduates enter the job market every year.

b) Discuss its social and economic consequences. (6 marks)', 'b) Consequences: the country loses productive energy; young people may feel frustrated, which can lead to substance abuse and crime; many leave the country; families carry the burden of supporting adult children; and public trust can weaken.', null, '[{"point": "Consequences: lost productivity, frustration and social problems, migration abroad, dependence on families", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'population-and-migration'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 6,
    648, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B3b'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-b3s', 2, null, null)
  returning id
)
insert into me_q select 'B3sb', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 2.0, 1 from me_q where key = 'B3sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 2.0, 2 from me_q where key = 'B3sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B3sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B3sb';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'Youth unemployment remains a pressing concern in Bhutan, even as many graduates enter the job market every year.

c) Suggest practical measures the government, private sector and youth themselves can take to address it. (8 marks)', 'c) Measures:
- Government: expand technical and vocational education, link courses to labour-market needs, and run internship and job programmes.
- Private sector: create apprenticeships and on-the-job training, and invest in new industries supported by friendly policies.
- Entrepreneurship: easy credit, mentoring and simple business registration for youth start-ups.
- Career guidance in schools and colleges.
- Youth: be willing to take up any decent work, keep learning new skills, and value the dignity of labour.', null, '[{"point": "Measures: skills training and TVET, entrepreneurship support and finance, private-sector growth, career guidance, dignity of labour, youth taking initiative", "marks": 8}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'population-and-migration'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 8,
    864, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B3c'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-b3s', 3, null, null)
  returning id
)
insert into me_q select 'B3sc', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 3.5, 1 from me_q where key = 'B3sc';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 2.5, 2 from me_q where key = 'B3sc';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B3sc';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B3sc';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'Rapid rural-urban migration has led to the growth of towns such as Thimphu and Phuentsholing, while many villages face "gungtong" (empty households).

a) Explain the reasons for rural-urban migration in Bhutan. (6 marks)', 'a) People move to towns for jobs and better income, for higher education and better schools for their children, and for better health care and services. Farming is hard and often unprofitable because of small landholdings and wildlife damage, and young people aspire to modern lifestyles.', null, '[{"point": "Reasons: jobs and income, education, health and other services, hardship of farming, aspirations of youth", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'urbanisation'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 6,
    648, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B4a'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-b4s', 1, null, null)
  returning id
)
insert into me_q select 'B4sa', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 2.0, 1 from me_q where key = 'B4sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 2.0, 2 from me_q where key = 'B4sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B4sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B4sa';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'Rapid rural-urban migration has led to the growth of towns such as Thimphu and Phuentsholing, while many villages face "gungtong" (empty households).

b) Discuss its effects on both rural and urban areas. (8 marks)', 'b) Rural areas: many houses stand empty (gungtong), farmland is left fallow, mostly elderly people remain, community activities and traditions weaken, and food production falls.
Urban areas: rapid growth causes housing shortages and high rents, traffic congestion, waste and water problems, pressure on schools and hospitals, and unemployment among new arrivals.', null, '[{"point": "Rural effects: gungtong, fallow land, ageing population, decline of culture; urban effects: housing shortage, traffic, waste, unemployment and pressure on services", "marks": 8}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'urbanisation'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 8,
    864, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B4b'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-b4s', 2, null, null)
  returning id
)
insert into me_q select 'B4sb', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 3.5, 1 from me_q where key = 'B4sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 2.5, 2 from me_q where key = 'B4sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B4sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B4sb';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'Rapid rural-urban migration has led to the growth of towns such as Thimphu and Phuentsholing, while many villages face "gungtong" (empty households).

c) Suggest strategies to promote balanced regional development. (6 marks)', 'c) Strategies for balanced development:
- Improve roads, electricity, internet, schools and health services in rural areas.
- Support rural enterprises such as farm processing, homestays and crafts.
- Make farming more profitable with mechanisation, markets and protection from wildlife.
- Develop regional towns and hubs, including Gelephu, so that growth is spread across the country.
- Use digital connectivity so people can work and access services from villages.', null, '[{"point": "Strategies: rural services and roads, rural enterprises, incentives for farming, regional hubs, digital connectivity", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'urbanisation'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 6,
    648, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B4c'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-b4s', 3, null, null)
  returning id
)
insert into me_q select 'B4sc', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 2.0, 1 from me_q where key = 'B4sc';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 2.0, 2 from me_q where key = 'B4sc';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B4sc';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B4sc';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'The Gelephu Mindfulness City (GMC) has been announced as a special administrative region intended to attract investment and create opportunities.

a) What is the vision of the Gelephu Mindfulness City, and why is it important for Bhutan''s future? (8 marks)', 'a) The Gelephu Mindfulness City is His Majesty The Druk Gyalpo''s vision of a special administrative region in Gelephu with its own laws and governance to attract international investment. It is meant to be a sustainable, green city guided by mindfulness and Bhutanese values, connected to South and South-East Asia.

It matters because it can create many jobs for Bhutanese, diversify the economy beyond hydropower, encourage young people to stay or return, and make Bhutan a regional economic hub.', null, '[{"point": "Vision: a special administrative region with its own laws to attract investment, grounded in mindfulness, sustainability and Bhutanese values; connectivity to the region", "marks": 4}, {"point": "Importance: jobs, diversification beyond hydropower, retaining youth, regional economic hub", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'education-and-human-capital'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 8,
    864, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B5a'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-b5s', 1, null, null)
  returning id
)
insert into me_q select 'B5sa', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 3.5, 1 from me_q where key = 'B5sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 2.5, 2 from me_q where key = 'B5sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 1.0, 3 from me_q where key = 'B5sa';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 1.0, 4 from me_q where key = 'B5sa';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id)
  values ('ME', 'analytical', 'The Gelephu Mindfulness City (GMC) has been announced as a special administrative region intended to attract investment and create opportunities.

b) Critically analyse the opportunities and challenges it presents for Bhutan''s economy, environment and society. (12 marks)', 'b) Opportunities:
- Foreign investment and new industries in areas such as green energy, health and wellness, education, technology and agriculture.
- Jobs and new skills for youth, reducing unemployment and out-migration.
- Better infrastructure and connectivity.
- A model of sustainable, green development.

Challenges:
- Protecting the environment and wildlife in a fast-growing area.
- Preserving culture and values with many foreign workers and investors.
- Raising finance and managing risks.
- Building strong, transparent governance so that the benefits reach ordinary Bhutanese.
- Making sure Bhutanese have the skills to take the jobs created.

With careful planning, GMC can help secure Bhutan''s economic future while staying true to GNH.', null, '[{"point": "Opportunities: investment, jobs, skills, infrastructure, new industries, green economy", "marks": 6}, {"point": "Challenges: protecting environment and culture, managing foreign workers and investors, financing, governance and fairness, benefits reaching Bhutanese", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'bhutan-institutions-development'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'bhutan-institutions-development') and t.slug = 'education-and-human-capital'), (select id from public.exam_papers where code = 'me-general-3'), 'standard', 12,
    1296, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B5b'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-3-2025b1-b5s', 2, null, null)
  returning id
)
insert into me_q select 'B5sb', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Knowledge of the subject', 'Accurate facts, institutions, policies and examples relevant to Bhutan.', 4.5, 1 from me_q where key = 'B5sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analytical skills', 'Explains causes, effects and links; weighs both sides; answers exactly what is asked in each part.', 3.5, 2 from me_q where key = 'B5sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Originality', 'Own reasoned view and practical suggestions, not only memorised points.', 2.0, 3 from me_q where key = 'B5sb';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Preciseness and structure', 'Clear introduction, organised points under each sub-part, concise conclusion.', 2.0, 4 from me_q where key = 'B5sb';
commit;
