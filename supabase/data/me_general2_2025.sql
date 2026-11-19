-- ME Paper II (General): BCSE 2025 + similar, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'case-study-and-comprehension', 'Case study and comprehension' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'english-grammar', 'English: grammar' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'english-language-and-linguistics', 'English: language and linguistics' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'english-literature', 'English: literature' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'english-vocabulary-and-idioms', 'English: vocabulary and idioms' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'english-writing-and-research', 'English: writing and research' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge', 'General knowledge' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-bhutan', 'General knowledge: Bhutan' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-education', 'General knowledge: education' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-geography', 'General knowledge: geography' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-mathematics', 'General knowledge: mathematics' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-science', 'General knowledge: science' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-sports', 'General knowledge: sports' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'subjective-education-and-language', 'Subjective: education and language' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'subjective-environment-and-citizenship', 'Subjective: environment and citizenship' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'subjective-general-knowledge', 'Subjective: general knowledge' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'subjective-writing-skills', 'Subjective: writing skills' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'topical-issues-economy-and-environment', 'Topical issues: economy and environment' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'topical-issues-national-values', 'Topical issues: national values' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'topical-issues-technology-and-governance', 'Topical issues: technology and governance' on conflict (subject_id, slug) do nothing;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-general-2');
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-general-2'), 1, 'Section A: Case study', 'analytical', 1, 40, null, 'BCSE 2025 Main Examination, General category, Paper II');
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-general-2'), 2, 'Section B: Topical discussion', 'long_answer', 4, 10, 2, 'BCSE 2025 Main Examination, General category, Paper II');
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-general-2'), 3, 'Section C: Subjective questions', 'descriptive', 4, 10, 2, 'BCSE 2025 Main Examination, General category, Paper II');
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-general-2'), 4, 'Section D: Multiple choice questions', 'mcq', 20, 1, null, 'BCSE 2025 Main Examination, General category, Paper II');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'Read the article below and answer the question that follows.

PHOBJIKHA SHEEP FARMING DECLINES AS YOUTH SEEK CITIES, FARMERS SHIFT TO CROPS (Kuensel)

Phobjikha valley in Wangdue, once home to thousands of sheep, is witnessing a decline in its sheep population, now estimated at a mere 350. This sharp drop indicates the nearing disappearance of traditional sheep farming in the valley, a shift away from a way of life deeply rooted in Phobjikha''s culture, as villagers increasingly turn to more profitable crops and the younger generation migrates to urban areas.

Bhutan''s sheep population is genetically classified into four distinct types: Jakar, Sipsu, Sarpang, and Sakten. The Jakar variety, believed to be native to Phobjikha and found only in Bumthang and Trongsa, is currently at particular risk.

The Livestock Extension Officer of Phobjikha Gewog reported that the area had over 2,000 sheep in 2013. However, the number has steadily declined over the years. He attributed this to changing lifestyles, stating that while sheep rearing was once a tradition, most villagers have now shifted their focus to potato cultivation, finding sheep rearing too time-consuming and labour-intensive.

The decline has also been worsened by frequent attacks from feral dogs, as well as occasional attacks by bears and other wild animals. "The migration of young people to urban areas in search of better opportunities has left mostly the elderly residents in the villages, which poses a challenge to the conservation of sheep in the near future," said the Livestock Extension Officer.

Currently, about 351 sheep are being reared in two chiwogs in Phobjikha, primarily cared for by elderly villagers. "Sheep rearing is not a lucrative business, and the lack of tsamdro (pastureland), along with the fact that only elderly people are involved, are major hurdles to preserving the native sheep in the gewog," the Livestock Extension Officer said.

The Phobjikha Gup recalled a time, about 30 years ago, when each household would rear as many as 200 sheep. Parents would convert wool into blankets and clothing for their children, providing warmth during harsh winters. Farmers now prefer cultivating potatoes, a more reliable source of income than sheep rearing, which is exhausting and time-consuming because the sheep must be watched constantly to protect them from attacks. Most of the sheep are now sold. "Sheep rearing is not very profitable, as a kilogram of wool sells for only Nu 450-500," the Gup said.

To conserve the native sheep, the Samdrup Phuentshog Lug Detshe was established in collaboration with the National Biodiversity Centre, and equipment, including a wool-shredding machine, was distributed to farmers. However, this initiative did not succeed. Despite sheep manure being known as highly nutritious for the soil, farmers have abandoned the practice due to the challenges and difficulties involved in managing them. The Khemdro Chiwog Tshogpa said that most sheep are now being sold to Bumthang, and only three households in the chiwog are still rearing sheep.

A once-common tradition of taking sheep to summer grazing grounds in the Black Mountains, where yak herders would look after them, has nearly vanished. Most yak herders have sold their yaks, with only one individual continuing the practice.

According to the Integrated Agriculture and Livestock Census, Phobjikha recorded a total of 351 local sheep (96 males and 255 females), with two reported deaths and 0.20 metric tonnes (MT) of wool produced. This reflects a decline from the previous counts of 426 sheep (0.49 MT of wool) and, a year earlier, 770 sheep (3.57 MT of wool). There are 9,176 sheep in the country, with Samtse alone accounting for 5,367 of them.

Question 1
"The decline in Phobjikha''s sheep population is attributed to altering lifestyles, migration of youth to urban areas, and challenges such as predation by wild animals and lack of pastureland."
Suggest three strategies that the government could implement to help conserve native sheep farming and support the livelihood of villagers. (10 marks)', 'Three strategies the government could implement:

1. Protect the flocks and the pastures. The passage shows that feral dogs, bears and the lack of tsamdro are major hurdles. The government could control feral dogs through sterilisation and management, help farmers build predator-proof night shelters, and set aside or restore community pastureland for sheep. This reduces losses and the constant need to guard the sheep.

2. Make sheep rearing profitable. Farmers prefer potatoes because wool sells for only Nu 450-500 a kilogram. The government could link farmers to weavers and buyers of Bhutanese woollen products, support small processing units for yarn and textiles, brand Phobjikha wool as a heritage product for tourists, and promote the sale of sheep manure as organic fertiliser. Higher income gives villagers a reason to keep sheep.

3. Conserve the native Jakar breed and attract youth. A conservation breeding programme with the National Biodiversity Centre could keep a protected flock, while subsidies, training and small grants for young farmers who take up sheep rearing would bring younger people into the work instead of leaving it to the elderly.

Together these measures protect a rare native breed and give rural families a more secure livelihood.', null, '[{"point": "Three distinct, practical strategies linked to the causes in the passage (for example support against predators and feral dogs, pastureland/tsamdro, better wool prices and markets, incentives for youth, conservation breeding of the Jakar sheep)", "marks": 6}, {"point": "Explains how each strategy helps both conservation and livelihoods", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'case-study-and-comprehension'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, 'me-general-2-2025b1-a1', 1, null)
  returning id
)
insert into me_q select 'A1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'A1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'A1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'Read the article below and answer the question that follows.

PHOBJIKHA SHEEP FARMING DECLINES AS YOUTH SEEK CITIES, FARMERS SHIFT TO CROPS (Kuensel)

Phobjikha valley in Wangdue, once home to thousands of sheep, is witnessing a decline in its sheep population, now estimated at a mere 350. This sharp drop indicates the nearing disappearance of traditional sheep farming in the valley, a shift away from a way of life deeply rooted in Phobjikha''s culture, as villagers increasingly turn to more profitable crops and the younger generation migrates to urban areas.

Bhutan''s sheep population is genetically classified into four distinct types: Jakar, Sipsu, Sarpang, and Sakten. The Jakar variety, believed to be native to Phobjikha and found only in Bumthang and Trongsa, is currently at particular risk.

The Livestock Extension Officer of Phobjikha Gewog reported that the area had over 2,000 sheep in 2013. However, the number has steadily declined over the years. He attributed this to changing lifestyles, stating that while sheep rearing was once a tradition, most villagers have now shifted their focus to potato cultivation, finding sheep rearing too time-consuming and labour-intensive.

The decline has also been worsened by frequent attacks from feral dogs, as well as occasional attacks by bears and other wild animals. "The migration of young people to urban areas in search of better opportunities has left mostly the elderly residents in the villages, which poses a challenge to the conservation of sheep in the near future," said the Livestock Extension Officer.

Currently, about 351 sheep are being reared in two chiwogs in Phobjikha, primarily cared for by elderly villagers. "Sheep rearing is not a lucrative business, and the lack of tsamdro (pastureland), along with the fact that only elderly people are involved, are major hurdles to preserving the native sheep in the gewog," the Livestock Extension Officer said.

The Phobjikha Gup recalled a time, about 30 years ago, when each household would rear as many as 200 sheep. Parents would convert wool into blankets and clothing for their children, providing warmth during harsh winters. Farmers now prefer cultivating potatoes, a more reliable source of income than sheep rearing, which is exhausting and time-consuming because the sheep must be watched constantly to protect them from attacks. Most of the sheep are now sold. "Sheep rearing is not very profitable, as a kilogram of wool sells for only Nu 450-500," the Gup said.

To conserve the native sheep, the Samdrup Phuentshog Lug Detshe was established in collaboration with the National Biodiversity Centre, and equipment, including a wool-shredding machine, was distributed to farmers. However, this initiative did not succeed. Despite sheep manure being known as highly nutritious for the soil, farmers have abandoned the practice due to the challenges and difficulties involved in managing them. The Khemdro Chiwog Tshogpa said that most sheep are now being sold to Bumthang, and only three households in the chiwog are still rearing sheep.

A once-common tradition of taking sheep to summer grazing grounds in the Black Mountains, where yak herders would look after them, has nearly vanished. Most yak herders have sold their yaks, with only one individual continuing the practice.

According to the Integrated Agriculture and Livestock Census, Phobjikha recorded a total of 351 local sheep (96 males and 255 females), with two reported deaths and 0.20 metric tonnes (MT) of wool produced. This reflects a decline from the previous counts of 426 sheep (0.49 MT of wool) and, a year earlier, 770 sheep (3.57 MT of wool). There are 9,176 sheep in the country, with Samtse alone accounting for 5,367 of them.

Question 2
Discuss three economic consequences that the decline of native sheep farming could have on the livelihoods of rural communities like Phobjikha. Support your answer with reasons based on the passage. (10 marks)', '1. Loss of an income source and of self-sufficiency. In the past each household reared up to 200 sheep and turned the wool into blankets and clothing. With only about 351 sheep left and wool production falling sharply, families lose this income and must now buy warm clothing and blankets with cash.

2. Dependence on one crop. Most villagers have shifted to potato cultivation. Relying mainly on one crop exposes households to risks such as falling potato prices, pests or poor weather, with no livestock income to fall back on.

3. Higher farming costs and weaker soil. The passage notes that sheep manure is highly nutritious for the soil. Without it, farmers may need to buy chemical fertilisers, which increases costs and can harm the soil in the long term.

In addition, when the elderly herders are gone, the skills of wool processing and weaving may disappear, closing the door to future income from heritage products.', null, '[{"point": "Three economic consequences (for example loss of a source of income and of home-made woollen clothing, greater dependence on one crop such as potatoes, loss of manure leading to fertiliser costs, loss of traditional skills and heritage products)", "marks": 6}, {"point": "Each supported with reasons or evidence from the passage", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'case-study-and-comprehension'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, 'me-general-2-2025b1-a1', 2, null)
  returning id
)
insert into me_q select 'A2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'A2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'A2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'Read the article below and answer the question that follows.

PHOBJIKHA SHEEP FARMING DECLINES AS YOUTH SEEK CITIES, FARMERS SHIFT TO CROPS (Kuensel)

Phobjikha valley in Wangdue, once home to thousands of sheep, is witnessing a decline in its sheep population, now estimated at a mere 350. This sharp drop indicates the nearing disappearance of traditional sheep farming in the valley, a shift away from a way of life deeply rooted in Phobjikha''s culture, as villagers increasingly turn to more profitable crops and the younger generation migrates to urban areas.

Bhutan''s sheep population is genetically classified into four distinct types: Jakar, Sipsu, Sarpang, and Sakten. The Jakar variety, believed to be native to Phobjikha and found only in Bumthang and Trongsa, is currently at particular risk.

The Livestock Extension Officer of Phobjikha Gewog reported that the area had over 2,000 sheep in 2013. However, the number has steadily declined over the years. He attributed this to changing lifestyles, stating that while sheep rearing was once a tradition, most villagers have now shifted their focus to potato cultivation, finding sheep rearing too time-consuming and labour-intensive.

The decline has also been worsened by frequent attacks from feral dogs, as well as occasional attacks by bears and other wild animals. "The migration of young people to urban areas in search of better opportunities has left mostly the elderly residents in the villages, which poses a challenge to the conservation of sheep in the near future," said the Livestock Extension Officer.

Currently, about 351 sheep are being reared in two chiwogs in Phobjikha, primarily cared for by elderly villagers. "Sheep rearing is not a lucrative business, and the lack of tsamdro (pastureland), along with the fact that only elderly people are involved, are major hurdles to preserving the native sheep in the gewog," the Livestock Extension Officer said.

The Phobjikha Gup recalled a time, about 30 years ago, when each household would rear as many as 200 sheep. Parents would convert wool into blankets and clothing for their children, providing warmth during harsh winters. Farmers now prefer cultivating potatoes, a more reliable source of income than sheep rearing, which is exhausting and time-consuming because the sheep must be watched constantly to protect them from attacks. Most of the sheep are now sold. "Sheep rearing is not very profitable, as a kilogram of wool sells for only Nu 450-500," the Gup said.

To conserve the native sheep, the Samdrup Phuentshog Lug Detshe was established in collaboration with the National Biodiversity Centre, and equipment, including a wool-shredding machine, was distributed to farmers. However, this initiative did not succeed. Despite sheep manure being known as highly nutritious for the soil, farmers have abandoned the practice due to the challenges and difficulties involved in managing them. The Khemdro Chiwog Tshogpa said that most sheep are now being sold to Bumthang, and only three households in the chiwog are still rearing sheep.

A once-common tradition of taking sheep to summer grazing grounds in the Black Mountains, where yak herders would look after them, has nearly vanished. Most yak herders have sold their yaks, with only one individual continuing the practice.

According to the Integrated Agriculture and Livestock Census, Phobjikha recorded a total of 351 local sheep (96 males and 255 females), with two reported deaths and 0.20 metric tonnes (MT) of wool produced. This reflects a decline from the previous counts of 426 sheep (0.49 MT of wool) and, a year earlier, 770 sheep (3.57 MT of wool). There are 9,176 sheep in the country, with Samtse alone accounting for 5,367 of them.

Question 3
What financial concerns are emphasised in the passage as a consequence of farmers abandoning sheep rearing in favour of more lucrative alternatives like potato farming? Mention any interventions or initiatives discussed in the passage that were aimed at sustaining sheep farming, and explain why they may not have succeeded. (10 marks)', 'Financial concerns: the passage stresses that sheep rearing is "not a lucrative business". A kilogram of wool sells for only Nu 450-500, which does not reward the effort of rearing. Sheep must be watched constantly to protect them from feral dogs and wild animals, so the labour cost is high. Potato farming is seen as a more reliable source of income, so farmers sell their sheep and switch to crops.

Interventions: to conserve the native sheep, the Samdrup Phuentshog Lug Detshe was set up in collaboration with the National Biodiversity Centre, and equipment such as a wool-shredding machine was distributed to farmers.

Why they may not have succeeded:
- They did not solve the basic problem of low income from wool; without a market and a fair price, equipment alone does not make rearing worthwhile.
- Most young people have migrated, leaving only elderly villagers who cannot manage flocks and machines.
- Attacks by predators and the lack of pastureland continued.
- There may have been little follow-up training, organisation or support after the equipment was handed over.', null, '[{"point": "Financial concerns from the passage: low price of wool (Nu 450-500 per kg), sheep rearing not lucrative, potatoes a more reliable income, labour and time cost of guarding sheep", "marks": 4}, {"point": "Intervention: Samdrup Phuentshog Lug Detshe with the National Biodiversity Centre and distribution of equipment such as a wool-shredding machine", "marks": 3}, {"point": "Reasons it failed: no market or profit, labour shortage and elderly herders, predators and lack of pasture, equipment without support", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'case-study-and-comprehension'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, 'me-general-2-2025b1-a1', 3, null)
  returning id
)
insert into me_q select 'A3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'A3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'A3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'Read the article below and answer the question that follows.

PHOBJIKHA SHEEP FARMING DECLINES AS YOUTH SEEK CITIES, FARMERS SHIFT TO CROPS (Kuensel)

Phobjikha valley in Wangdue, once home to thousands of sheep, is witnessing a decline in its sheep population, now estimated at a mere 350. This sharp drop indicates the nearing disappearance of traditional sheep farming in the valley, a shift away from a way of life deeply rooted in Phobjikha''s culture, as villagers increasingly turn to more profitable crops and the younger generation migrates to urban areas.

Bhutan''s sheep population is genetically classified into four distinct types: Jakar, Sipsu, Sarpang, and Sakten. The Jakar variety, believed to be native to Phobjikha and found only in Bumthang and Trongsa, is currently at particular risk.

The Livestock Extension Officer of Phobjikha Gewog reported that the area had over 2,000 sheep in 2013. However, the number has steadily declined over the years. He attributed this to changing lifestyles, stating that while sheep rearing was once a tradition, most villagers have now shifted their focus to potato cultivation, finding sheep rearing too time-consuming and labour-intensive.

The decline has also been worsened by frequent attacks from feral dogs, as well as occasional attacks by bears and other wild animals. "The migration of young people to urban areas in search of better opportunities has left mostly the elderly residents in the villages, which poses a challenge to the conservation of sheep in the near future," said the Livestock Extension Officer.

Currently, about 351 sheep are being reared in two chiwogs in Phobjikha, primarily cared for by elderly villagers. "Sheep rearing is not a lucrative business, and the lack of tsamdro (pastureland), along with the fact that only elderly people are involved, are major hurdles to preserving the native sheep in the gewog," the Livestock Extension Officer said.

The Phobjikha Gup recalled a time, about 30 years ago, when each household would rear as many as 200 sheep. Parents would convert wool into blankets and clothing for their children, providing warmth during harsh winters. Farmers now prefer cultivating potatoes, a more reliable source of income than sheep rearing, which is exhausting and time-consuming because the sheep must be watched constantly to protect them from attacks. Most of the sheep are now sold. "Sheep rearing is not very profitable, as a kilogram of wool sells for only Nu 450-500," the Gup said.

To conserve the native sheep, the Samdrup Phuentshog Lug Detshe was established in collaboration with the National Biodiversity Centre, and equipment, including a wool-shredding machine, was distributed to farmers. However, this initiative did not succeed. Despite sheep manure being known as highly nutritious for the soil, farmers have abandoned the practice due to the challenges and difficulties involved in managing them. The Khemdro Chiwog Tshogpa said that most sheep are now being sold to Bumthang, and only three households in the chiwog are still rearing sheep.

A once-common tradition of taking sheep to summer grazing grounds in the Black Mountains, where yak herders would look after them, has nearly vanished. Most yak herders have sold their yaks, with only one individual continuing the practice.

According to the Integrated Agriculture and Livestock Census, Phobjikha recorded a total of 351 local sheep (96 males and 255 females), with two reported deaths and 0.20 metric tonnes (MT) of wool produced. This reflects a decline from the previous counts of 426 sheep (0.49 MT of wool) and, a year earlier, 770 sheep (3.57 MT of wool). There are 9,176 sheep in the country, with Samtse alone accounting for 5,367 of them.

Question 4
"Sheep manure is known to be highly nutritious for the soil, but farmers have abandoned the practice due to the challenges and difficulties involved in managing them." (Para 6)
Mention and elaborate two pragmatic actions you can personally take to help revive eco-friendly practices like sheep farming in rural communities. (10 marks)', '1. Support the market for local wool and organic produce. I can buy blankets, scarves and other products made from Bhutanese wool, and vegetables grown with organic manure, and encourage my family and office to do the same. When people buy these products, sheep rearing and organic farming become more profitable, which is the main reason farmers have abandoned them.

2. Lend a hand and spread awareness. During holidays I can help elderly relatives and neighbours in my village with herding, building shelters or collecting manure, and volunteer with groups such as Desuung in community projects. I can also use social media to share stories about native sheep, the value of manure for soil, and young people who earn a living from farming, so that more youth see these practices as worthwhile.

Small personal actions like these, repeated by many people, help keep eco-friendly traditions alive in rural Bhutan.', null, '[{"point": "Two practical personal actions (for example buying local woollen products and organic produce, volunteering or helping elderly farmers, promoting the practice on social media, supporting or joining a cooperative, sharing knowledge about manure and organic farming)", "marks": 6}, {"point": "Each action elaborated: how it helps and how it is realistic for an individual", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'case-study-and-comprehension'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, 'me-general-2-2025b1-a1', 4, null)
  returning id
)
insert into me_q select 'A4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'A4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'A4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'During the second week of July, at the start of construction for the Gelephu International Airport, His Majesty The King, Her Majesty The Gyaltsuen, and Their Royal Highnesses led the groundworks by contributing manual labour. Thousands of volunteers across Sarpang, along with government officials, armed forces, Desuups and Gyalsups, have contributed their manual labour. Another volunteer, Pangla, said that as a farmer who has always worked in the field, working in the heat is not an issue. "This is just the beginning. I hope to continue working for another two or three years, as long as my health allows," he said. "This is for our children. We are building our future. The GMC is for us and our children. My children will benefit from this project, and even the world will benefit from it." (Kuensel)

Use the above excerpt to analyse how the volunteer initiative at the Gelephu Mindfulness City (GMC) reflects core Bhutanese values and contributes to shaping national identity and Bhutan''s future. In your response, substantiate with reasons the roles of civic participation, intergenerational responsibility, and leadership by example in following the development path for Bhutan. (10 marks)', 'The volunteer work at the start of the Gelephu airport reflects values that define Bhutan: selfless service to the nation, unity, gratitude to the Throne and the dignity of hard work. Thousands of people, from the Royal Family to farmers, Desuups and Gyalsups, worked side by side in the heat without expecting reward.

Civic participation: when citizens personally contribute to a national project, they feel ownership of it. Farmers, officials and the armed forces working together show that development is not only the government''s task but everyone''s responsibility, which strengthens national unity.

Intergenerational responsibility: the volunteer Pangla says, "This is for our children. We are building our future." This shows the Bhutanese belief that each generation must work and sacrifice for the next, which is at the heart of GNH and sustainable development.

Leadership by example: His Majesty The King, Her Majesty The Gyaltsuen and Their Royal Highnesses led the groundwork themselves. When leaders work with their own hands, people are inspired to follow, and trust between leaders and citizens grows.

Together, these values build a national identity based on service and unity, and they give the GMC a strong foundation as a project of the whole nation for Bhutan''s future.', null, '[{"point": "Core values shown: selfless service, unity, gratitude, hard work, dignity of labour (with evidence from the excerpt)", "marks": 3}, {"point": "Civic participation: citizens from all walks of life building a national project together", "marks": 2}, {"point": "Intergenerational responsibility: ''This is for our children'', building for the future", "marks": 2}, {"point": "Leadership by example: the Royal Family leading the groundwork", "marks": 2}, {"point": "Link to national identity and Bhutan''s future", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'topical-issues-national-values'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'B1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'B1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'B1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', '"A new venture is bubbling beneath the surface. Welcome to the country''s first crawfish farm, promising a fresh twist to local aquaculture. Crawfish Himalayan Limited, a foreign direct investment company in Phuentsholing, is preparing to bring crawfish to both domestic and international markets. The general manager said, ''We are developing a state-of-the-art hatchery to breed and cultivate Cherax quadricarinatus, one of the most sought-after crawfish species globally. Known for its high market value and strong international demand, this species presents a significant opportunity for sustainable aquaculture.''" (BBS)

Based on the above excerpt, evaluate the potential of Bhutan''s first crawfish farm to contribute to sustainable economic development. Write two opportunities and one possible environmental challenge such ventures might bring. (10 marks)', 'The crawfish farm shows how foreign direct investment can bring a new, high-value industry to Bhutan and help diversify an economy that depends heavily on hydropower and tourism.

Opportunity 1: export earnings and diversification. The species has high market value and strong international demand. Exporting it can bring foreign currency and reduce Bhutan''s trade deficit, while adding aquaculture as a new sector of the economy.

Opportunity 2: jobs, skills and technology. A state-of-the-art hatchery creates jobs for young Bhutanese and brings modern aquaculture knowledge through the foreign investor. Local farmers may later supply feed or start their own farms, and Bhutanese consumers get a new source of protein.

Environmental challenge: Cherax quadricarinatus is not native to Bhutan. If animals escape into rivers, they could compete with native species, spread disease and upset river ecosystems. Wastewater from ponds may also pollute nearby water.

Overall, the venture has real potential for sustainable development, provided strict biosecurity, water treatment and environmental monitoring are in place.', null, '[{"point": "Brief evaluation of potential for sustainable economic development", "marks": 2}, {"point": "Opportunity 1 explained (for example export earnings and foreign currency, diversification)", "marks": 3}, {"point": "Opportunity 2 explained (for example jobs, skills and technology through FDI, local supply)", "marks": 3}, {"point": "Environmental challenge explained (for example escape of a non-native species into rivers, disease, water pollution)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'topical-issues-economy-and-environment'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'B2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'B2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'B2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'Bhutan recently commissioned its first utility-scale solar photovoltaic (PV) power plant, the 17.38 MW Sephu Solar Project in Wangdue Phodrang, to diversify its renewable energy portfolio.

Propose and explain two practical ways in which you and your community can support the growth and adoption of solar energy in Bhutan. (10 marks)', 'Bhutan''s electricity comes mainly from hydropower, which falls in the dry winter months. Solar energy diversifies supply and improves energy security, and every community can help it grow.

1. Use solar energy in homes and community buildings. Families can install solar water heaters, solar lights and, where possible, rooftop panels. Communities can install solar panels on schools, lhakhangs and community centres. Each installation reduces demand on the grid and shows neighbours that solar works in Bhutan''s conditions.

2. Use solar in farming and spread awareness. Farmers can use solar-powered water pumps for irrigation and solar electric fences against wild animals, which save cost and are reliable in remote areas. Youth and local leaders can share information about these benefits through community meetings and social media and help families learn about available support schemes.

By taking up solar ourselves and encouraging others, we support Bhutan''s goal of clean, diverse and secure energy.', null, '[{"point": "Way 1: practical, explained (for example installing rooftop solar or solar water heaters/lights at home, school or lhakhang)", "marks": 4}, {"point": "Way 2: practical, explained (for example awareness, community or cooperative projects, using solar in farming such as solar pumps and fencing)", "marks": 4}, {"point": "Why solar matters for Bhutan: diversification, winter shortfall, energy security", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'topical-issues-economy-and-environment'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'B3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'B3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'B3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'With the mounting presence of generative artificial intelligence (GAI) tools like ChatGPT in workplaces, Bhutanese civil servants are beginning to explore their use in tasks such as drafting reports, analysing policy documents, and improving service delivery.

Express your views in about 150-200 words on the application of GAI in the civil service by emphasising and elaborating two advantages of using GAI for civil servants and one probable risk or limitation it might pose to ethical governance or public trust. (10 marks)', 'Generative AI can be a useful assistant for Bhutanese civil servants if it is used carefully.

The first advantage is saving time. Tools such as ChatGPT can prepare first drafts of letters, reports and meeting minutes, and summarise long documents in seconds. Officers can then spend more time on thinking, checking and serving the public.

The second advantage is better analysis and service. AI can help compare policy documents, find key points and answer common questions from citizens quickly and consistently, which improves the speed and quality of public services.

However, there is a serious risk. AI can produce confident but wrong information, and it may be biased. Civil servants may also enter confidential government or personal data into public tools, which threatens privacy and security. If decisions rely on unchecked AI output, public trust in government could be damaged.

In my view, the civil service should adopt GAI with clear guidelines: protect data, always check the output, and keep a human officer accountable for every decision.', null, '[{"point": "Advantage 1 elaborated (for example saving time on drafting and summarising)", "marks": 3}, {"point": "Advantage 2 elaborated (for example better analysis and faster, more consistent service to citizens)", "marks": 3}, {"point": "One risk or limitation (for example errors and invented facts, data privacy and confidentiality, bias, over-reliance, accountability)", "marks": 3}, {"point": "Own view and length about 150-200 words", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'topical-issues-technology-and-governance'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'B4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'B4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'B4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'descriptive', 'Article 5 of the Constitution of the Kingdom of Bhutan declares that every Bhutanese is a trustee of the country''s natural resources and must help protect the environment for present and future generations. Mention and elaborate two ways a citizen can help protect Bhutan''s natural environment. (10 marks)', 'Article 5 makes every Bhutanese a trustee of the country''s natural resources. This means we hold the environment in trust for future generations and must protect it, not only enjoy it.

1. Reduce waste and pollution. A citizen can avoid plastic bags and single-use items, segregate waste at home, compost kitchen waste and never litter in rivers, forests or towns. Less waste keeps our water clean, protects wildlife and keeps Bhutan beautiful.

2. Protect forests and resources. A citizen can take part in tree-planting and clean-up campaigns, use firewood and water carefully, choose energy-saving appliances and report illegal logging, poaching or forest fires to the authorities. These actions help Bhutan keep its forest cover and rich biodiversity.

If every citizen acts as a responsible trustee, Bhutan can continue to be a carbon-negative country with a healthy environment for generations to come.', null, '[{"point": "Brief link to Article 5 and the idea of a trustee", "marks": 2}, {"point": "Way 1 mentioned and elaborated (for example reducing waste and pollution)", "marks": 4}, {"point": "Way 2 mentioned and elaborated (for example planting trees, saving energy and water, protecting wildlife, following environmental laws)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'subjective-environment-and-citizenship'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'C1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'C1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'C1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'C1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'descriptive', 'Discuss one potential benefit and one risk of adopting cryptocurrency as a mainstream form of payment in the global economy. (10 marks)', 'Cryptocurrency is a digital currency, such as Bitcoin, that uses cryptography and blockchain technology and is not issued or controlled by a central bank.

Benefit: fast and low-cost cross-border payments. Cryptocurrency can be sent anywhere in the world within minutes, without going through several banks. This can make payments cheaper and quicker for businesses and for workers sending money home, and it can give people without bank accounts access to digital payments through a mobile phone.

Risk: price volatility and fraud. The value of many cryptocurrencies rises and falls sharply within days, so people who are paid or save in them may suddenly lose much of their money. Because transactions are hard to reverse and regulation is still weak in many countries, scams, hacking and illegal uses such as money laundering are common.

So cryptocurrency offers speed and access, but its instability and risks mean it needs strong regulation before it can safely become a mainstream form of payment.', null, '[{"point": "Brief explanation of cryptocurrency", "marks": 2}, {"point": "One benefit discussed (for example fast, low-cost cross-border payments, financial inclusion, transparency of blockchain)", "marks": 4}, {"point": "One risk discussed (for example price volatility, fraud and scams, use in crime, weak regulation, loss of savings)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'subjective-general-knowledge'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'C3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'C3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'C3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'C3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'descriptive', 'Should teachers in Bhutanese classrooms use translanguaging (switching between languages) to teach subjects other than Dzongkha, even though English is the official medium of instruction? Why? Provide two reasons to justify your stand. (10 marks)', 'Yes, I believe teachers may use translanguaging in a limited and planned way, while keeping English as the main medium of instruction.

Reason 1: it improves understanding. Many children, especially in rural schools, do not speak English at home. When a difficult idea in science or mathematics is explained briefly in Dzongkha or the child''s home language, students understand the concept instead of only memorising English words. Once they understand, they can learn the English terms more easily.

Reason 2: it builds confidence and participation. Students who struggle with English often stay silent. Allowing them to discuss ideas in a familiar language, and then present in English, encourages them to take part, ask questions and learn from one another. It also values Bhutanese languages and identity.

However, translanguaging should support English, not replace it. Teachers should use it mainly to explain and check understanding, and gradually move students back to English, so that they still gain the English skills they need for higher studies and work.', null, '[{"point": "Clear stand (yes, no or a qualified yes)", "marks": 2}, {"point": "Reason 1 explained with an example", "marks": 4}, {"point": "Reason 2 explained with an example; any condition or limit noted", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'subjective-education-and-language'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'C4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'C4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'C4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'C4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'After years of hard work, she is finally on cloud nine. The idiom "on cloud nine" in the sentence means:', null, '"On cloud nine" means extremely happy, which fits the reward after years of hard work.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'english-vocabulary-and-idioms'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'D1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Feeling frustrated.', false, 1), ('B', 'Feeling anxious.', false, 2), ('C', 'Feeling very confused.', false, 3), ('D', 'Feeling extremely happy.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'D1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The exclusive legal right granted to a creator of an original work that prevents others from using, reproducing, or sharing it without consent is known as:', null, 'Copyright protects original creative works. A patent protects inventions, a trademark protects brand names and logos, and plagiarism is the wrongful copying of others'' work.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'D2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Trademark', false, 1), ('B', 'Copyright', true, 2), ('C', 'Plagiarism', false, 3), ('D', 'Patent', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'A Bhutanese baby who is adopted and brought up by an Italian-speaking couple will have the physical characteristics inherited from his/her biological parents but will inevitably speak Italian. This shows that language is:', null, 'The child inherits physical features but learns the language of the people around them, so language is learned behaviour, not inherited.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'english-language-and-linguistics'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'D3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'passed down from generations.', false, 1), ('B', 'inherited by the speaker.', false, 2), ('C', 'imprinted in the child''s brain.', false, 3), ('D', 'a behavioural aspect of humans.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'D3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'To gain a competitive advantage, an organisation implements multiple approaches for the professional development of its employees. Which strategy among the following is the most effective?', null, 'Professional development of existing employees is achieved through training. Selection and recruitment bring in new staff; compensation concerns pay.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'D4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Training strategy', true, 1), ('B', 'Compensation strategy', false, 2), ('C', 'Selection strategy', false, 3), ('D', 'Recruitment strategy', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The sentence that demonstrates correct parallel structure is:', null, 'Parallel structure uses the same form for each item: reading, swimming, jogging. Only the last sentence uses -ing forms throughout.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'english-grammar'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'D5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'She likes reading books, to swim in the lake, and jogging in the park.', false, 1), ('B', 'She likes reading novels, swimming in the pool, and jogging in the park.', true, 2), ('C', 'She likes reading books, swimming in the lake, and to jog in the park.', false, 3), ('D', 'She likes to read books, swimming in the lake, and jog in the park.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Sequence the following organisations based on the chronological order of Bhutan''s membership, from the earliest to the latest.
I. NAM
II. SAARC
III. BIMSTEC
IV. Colombo Plan', null, 'Bhutan joined the Colombo Plan in 1962, the Non-Aligned Movement in 1973, SAARC as a founding member in 1985, and BIMSTEC in 2004.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-bhutan'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'D7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'I, III, IV, II', false, 1), ('B', 'III, I, II, IV', false, 2), ('C', 'II, IV, I, III', false, 3), ('D', 'IV, I, II, III', true, 4)) as v(label, body, ok, pos) where me_q.key = 'D7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'If Ms X is reading a classic novel, which of the following authors is best known for writing "Pride and Prejudice", a book she might choose?', null, '"Pride and Prejudice" (1813) was written by Jane Austen.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'english-literature'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'D9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Jane Austen', true, 1), ('B', 'Charles Dickens', false, 2), ('C', 'George Orwell', false, 3), ('D', 'Emily Brontë', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which type of poem is Mr X most likely reading if it has 14 lines, is often written in iambic pentameter, and explores themes of love, time, or beauty?', null, 'A sonnet has 14 lines, usually in iambic pentameter, and often deals with love, time and beauty.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'english-literature'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'D10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ode', false, 1), ('B', 'Ballad', false, 2), ('C', 'Sonnet', true, 3), ('D', 'Haiku', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'A friend is asking for help to understand in-text citation for his/her research paper. The option that best explains what in-text citation is:', null, 'An in-text citation gives the source within the text, such as (Author, Year). The list at the end is the reference list or bibliography.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'english-writing-and-research'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'D11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Quoting a sentence directly without mentioning the source.', false, 1), ('B', 'Writing a summary of the research in your own words.', false, 2), ('C', 'Listing the sources used at the end of the research paper.', false, 3), ('D', 'Including the author''s name and publication year within parentheses.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'D11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'You are part of a space research team tasked with collecting soil samples and investigating the possibility of life on Mars. The type of space mission that would help achieve this goal is:', null, 'A rover lands and moves on the surface, so it can collect and study soil samples. Orbiters and flybys observe from space.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-science'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'D12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Orbiter spacecraft', false, 1), ('B', 'Rover mission', true, 2), ('C', 'Flyby mission', false, 3), ('D', 'Human spaceflight mission', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'On August 1, 2025, why did the Bhutan Football Federation host a Football Carnival Festival at the Changlimithang Stadium in Thimphu?', null, 'Bhutan became a member of FIFA in 2000, so 2025 marked 25 years of membership.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-sports'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'D14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To conduct trials for the national football team', false, 1), ('B', 'To raise awareness about youth football training', false, 2), ('C', 'To mark the opening of the football season', false, 3), ('D', 'To celebrate 25 years of Bhutan''s membership in FIFA', true, 4)) as v(label, body, ok, pos) where me_q.key = 'D14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The student improved her writing by practising every day. The word "practising" in the sentence is:', null, '"Practising" follows the preposition "by" and works as a noun (the act of practising), so it is a gerund.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'english-grammar'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'D16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'a gerund', true, 1), ('B', 'an infinitive', false, 2), ('C', 'a participle', false, 3), ('D', 'a main verb', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'In which of the following years did Brazil win the FIFA Men''s World Cup?', null, 'Brazil has won the World Cup five times: 1958, 1962, 1970, 1994 and 2002.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-sports'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'D17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1954, 1966, 1974, 1990, 1998', false, 1), ('B', '1962, 1970, 1982, 1994, 2006', false, 2), ('C', '1958, 1962, 1970, 1994, 2002', true, 3), ('D', '1950, 1958, 1962, 1970, 1994', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The incorrectly matched pair among the largest producers of these food products is:', null, 'Norway is not a major maize producer (the largest is the United States). Brazil leads in coffee, China in rice, and India is among the largest wheat producers.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-geography'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'D18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Brazil – Coffee', false, 1), ('B', 'India – Wheat', false, 2), ('C', 'Norway – Maize', true, 3), ('D', 'China – Rice', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which of the following statements about numbers is incorrect?', null, 'The square root of 2 is irrational: it cannot be written as a fraction. The other three statements are true.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-mathematics'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'D19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Every prime number greater than 2 is odd.', false, 1), ('B', 'The square root of 2 is a rational number.', true, 2), ('C', 'The sum of two irrational numbers can be rational.', false, 3), ('D', 'Zero is an even number.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which of the following activities best demonstrates bodily-kinesthetic intelligence according to Howard Gardner''s theory of Multiple Intelligences?', null, 'Bodily-kinesthetic intelligence is skill in using the body, as in dance. Puzzles are logical-mathematical, speaking is linguistic, and philosophy is mainly logical or existential.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-education'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025, "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'D20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Expressing ideas effectively through public speaking.', false, 1), ('B', 'Understanding abstract concepts in philosophical texts.', false, 2), ('C', 'Learning new dance choreography through movement.', true, 3), ('D', 'Solving logical puzzles with patterns and sequences.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'Read the article below and answer the question that follows.

COMMUNITY FORESTS: WHEN VILLAGES LOOK AFTER THEIR OWN TREES (practice passage written by Soma)

In many parts of Bhutan, villagers no longer wait for a permit from a distant office to collect timber for a new house or firewood for the winter. Under the community forestry programme, groups of households form a Community Forest Management Group (CFMG) and take legal responsibility for a nearby patch of government forest. They agree on a management plan, decide who may harvest what and when, and share the benefits.

Supporters say the programme has changed how people see the forest. "When the forest belongs to all of us, nobody wants to cut a tree carelessly," a member of one group in eastern Bhutan explains. Groups patrol their forest, plant seedlings on bare slopes and fight small fires early. Some groups earn income by selling surplus timber, firewood or non-wood products such as mushrooms, cane, bamboo and medicinal plants, and use part of the money for village needs such as school uniforms or repairs to a lhakhang.

The programme also faces difficulties. Many young people have left for towns and abroad, so the same few elderly members do most of the patrolling and planting. Record-keeping and accounts are demanding for members with little formal education, and a few groups have argued over how benefits should be shared. In some places, demand for timber from outside buyers has tempted members to harvest more than the plan allows. Forest officials say that the groups that work best are those with honest, active leaders and clear rules agreed by everyone.

Community forestry is closely linked to the constitutional duty of every Bhutanese to protect the environment. If it succeeds, it can keep forests healthy while improving rural livelihoods; if it fails, it can lead to quarrels and damage to the very forests it was meant to protect.

Question 1
Suggest three measures that could help Community Forest Management Groups overcome the difficulties described in the passage. (10 marks)', '1. Bring young people into the groups. Membership could be offered to young people living in nearby towns, with small paid tasks such as patrolling, nursery work or managing accounts, and schools could run nature clubs linked to the community forest. This shares the workload now carried by a few elderly members.

2. Train members in record-keeping and accounts. Forest officials or local organisations could run simple, practical training and provide easy record books or a mobile app. Clear records reduce mistakes and suspicion.

3. Agree on fair rules and check that they are followed. Each group should agree openly on how benefits are shared and how much may be harvested, display the rules in the village, and invite forest officials to review harvesting each year. Clear rules and regular checks prevent quarrels and stop members from over-harvesting for outside buyers.

With these measures the groups can protect the forest and keep members united.', null, '[{"point": "Three measures linked to the difficulties in the passage (involving youth, training in record-keeping and accounts, fair benefit-sharing rules, monitoring of harvesting, support from forest officials)", "marks": 6}, {"point": "Explains how each measure solves a specific difficulty", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'case-study-and-comprehension'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'A1'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-2-s1-cs', 1, null)
  returning id
)
insert into me_q select 'A1s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'A1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'A1s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'Read the article below and answer the question that follows.

COMMUNITY FORESTS: WHEN VILLAGES LOOK AFTER THEIR OWN TREES (practice passage written by Soma)

In many parts of Bhutan, villagers no longer wait for a permit from a distant office to collect timber for a new house or firewood for the winter. Under the community forestry programme, groups of households form a Community Forest Management Group (CFMG) and take legal responsibility for a nearby patch of government forest. They agree on a management plan, decide who may harvest what and when, and share the benefits.

Supporters say the programme has changed how people see the forest. "When the forest belongs to all of us, nobody wants to cut a tree carelessly," a member of one group in eastern Bhutan explains. Groups patrol their forest, plant seedlings on bare slopes and fight small fires early. Some groups earn income by selling surplus timber, firewood or non-wood products such as mushrooms, cane, bamboo and medicinal plants, and use part of the money for village needs such as school uniforms or repairs to a lhakhang.

The programme also faces difficulties. Many young people have left for towns and abroad, so the same few elderly members do most of the patrolling and planting. Record-keeping and accounts are demanding for members with little formal education, and a few groups have argued over how benefits should be shared. In some places, demand for timber from outside buyers has tempted members to harvest more than the plan allows. Forest officials say that the groups that work best are those with honest, active leaders and clear rules agreed by everyone.

Community forestry is closely linked to the constitutional duty of every Bhutanese to protect the environment. If it succeeds, it can keep forests healthy while improving rural livelihoods; if it fails, it can lead to quarrels and damage to the very forests it was meant to protect.

Question 2
Explain three benefits that community forestry can bring to rural households, using evidence from the passage. (10 marks)', '1. Easy access to forest resources. Villagers no longer have to wait for a permit from a distant office to collect timber for houses or firewood for winter, because the group manages a nearby forest under its own plan.

2. Income for households and the village. Groups can sell surplus timber, firewood and non-wood products such as mushrooms, cane, bamboo and medicinal plants. Part of the income is used for community needs such as school uniforms or repairs to a lhakhang.

3. A healthier forest that keeps giving. Because the forest "belongs to all of us", members patrol it, plant seedlings on bare slopes and fight fires early. A well-managed forest protects water sources and soil and provides resources for future generations.

These benefits show how community forestry can join conservation with better rural livelihoods.', null, '[{"point": "Three benefits supported by the passage: easier access to timber and firewood, income from selling surplus and non-wood products, money for village needs, healthier forests through patrolling, planting and fire control, a sense of ownership", "marks": 6}, {"point": "Evidence from the passage for each", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'case-study-and-comprehension'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'A2'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-2-s1-cs', 2, null)
  returning id
)
insert into me_q select 'A2s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'A2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'A2s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'Read the article below and answer the question that follows.

COMMUNITY FORESTS: WHEN VILLAGES LOOK AFTER THEIR OWN TREES (practice passage written by Soma)

In many parts of Bhutan, villagers no longer wait for a permit from a distant office to collect timber for a new house or firewood for the winter. Under the community forestry programme, groups of households form a Community Forest Management Group (CFMG) and take legal responsibility for a nearby patch of government forest. They agree on a management plan, decide who may harvest what and when, and share the benefits.

Supporters say the programme has changed how people see the forest. "When the forest belongs to all of us, nobody wants to cut a tree carelessly," a member of one group in eastern Bhutan explains. Groups patrol their forest, plant seedlings on bare slopes and fight small fires early. Some groups earn income by selling surplus timber, firewood or non-wood products such as mushrooms, cane, bamboo and medicinal plants, and use part of the money for village needs such as school uniforms or repairs to a lhakhang.

The programme also faces difficulties. Many young people have left for towns and abroad, so the same few elderly members do most of the patrolling and planting. Record-keeping and accounts are demanding for members with little formal education, and a few groups have argued over how benefits should be shared. In some places, demand for timber from outside buyers has tempted members to harvest more than the plan allows. Forest officials say that the groups that work best are those with honest, active leaders and clear rules agreed by everyone.

Community forestry is closely linked to the constitutional duty of every Bhutanese to protect the environment. If it succeeds, it can keep forests healthy while improving rural livelihoods; if it fails, it can lead to quarrels and damage to the very forests it was meant to protect.

Question 3
According to the passage, what can make some community forest groups fail? Explain why "honest, active leaders and clear rules" are important for their success. (10 marks)', 'The passage shows several reasons why some groups struggle or fail:
- Young people have left for towns and abroad, so a few elderly members do most of the patrolling and planting.
- Record-keeping and accounts are hard for members with little formal education.
- Some groups have quarrelled over how benefits are shared.
- Demand from outside buyers has tempted members to harvest more than the plan allows.

Honest, active leaders and clear rules address these problems. An honest leader keeps accounts open and handles money fairly, so members trust one another. An active leader organises patrols, planting and meetings, so the work does not fall on a few people. Clear rules agreed by everyone show who may harvest what and how benefits are shared, which prevents quarrels and over-harvesting. Together, good leadership and clear rules make the group accountable to its members and to the forest.', null, '[{"point": "Causes of failure from the passage: few elderly members doing the work, difficult record-keeping and accounts, quarrels over benefit-sharing, temptation to over-harvest for outside buyers", "marks": 5}, {"point": "Why honest, active leaders and clear rules matter: trust, fairness, accountability, preventing over-harvesting and conflict", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'case-study-and-comprehension'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'A3'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-2-s1-cs', 3, null)
  returning id
)
insert into me_q select 'A3s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'A3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'A3s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'Read the article below and answer the question that follows.

COMMUNITY FORESTS: WHEN VILLAGES LOOK AFTER THEIR OWN TREES (practice passage written by Soma)

In many parts of Bhutan, villagers no longer wait for a permit from a distant office to collect timber for a new house or firewood for the winter. Under the community forestry programme, groups of households form a Community Forest Management Group (CFMG) and take legal responsibility for a nearby patch of government forest. They agree on a management plan, decide who may harvest what and when, and share the benefits.

Supporters say the programme has changed how people see the forest. "When the forest belongs to all of us, nobody wants to cut a tree carelessly," a member of one group in eastern Bhutan explains. Groups patrol their forest, plant seedlings on bare slopes and fight small fires early. Some groups earn income by selling surplus timber, firewood or non-wood products such as mushrooms, cane, bamboo and medicinal plants, and use part of the money for village needs such as school uniforms or repairs to a lhakhang.

The programme also faces difficulties. Many young people have left for towns and abroad, so the same few elderly members do most of the patrolling and planting. Record-keeping and accounts are demanding for members with little formal education, and a few groups have argued over how benefits should be shared. In some places, demand for timber from outside buyers has tempted members to harvest more than the plan allows. Forest officials say that the groups that work best are those with honest, active leaders and clear rules agreed by everyone.

Community forestry is closely linked to the constitutional duty of every Bhutanese to protect the environment. If it succeeds, it can keep forests healthy while improving rural livelihoods; if it fails, it can lead to quarrels and damage to the very forests it was meant to protect.

Question 4
"Community forestry is closely linked to the constitutional duty of every Bhutanese to protect the environment."
Mention and elaborate two actions you can personally take to support forest conservation in your community. (10 marks)', 'Article 5 of the Constitution makes every Bhutanese a trustee of the country''s natural resources. Two actions I can take:

1. Take part in conservation work. I can join tree-planting drives on Social Forestry Day, clean-up campaigns and the activities of the local community forest group, and encourage friends to come along. Planting and caring for seedlings helps restore bare slopes and protects water sources.

2. Use forest resources wisely and protect the forest. At home I can use firewood efficiently, for example with improved stoves, avoid wasting timber, and choose sustainable products. I can also report illegal felling and forest fires quickly to the gewog or forest office.

These actions are small, but if every citizen takes them, Bhutan can keep its forests healthy for future generations.', null, '[{"point": "Two practical personal actions (for example joining planting and clean-up drives, using firewood and timber responsibly, reporting illegal felling and fires, raising awareness, supporting local forest products)", "marks": 6}, {"point": "Each elaborated and linked to the constitutional duty as a trustee of natural resources", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'case-study-and-comprehension'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'A4'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-general-2-s1-cs', 4, null)
  returning id
)
insert into me_q select 'A4s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A4s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A4s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'A4s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'A4s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'Every year thousands of Desuups and other volunteers support the nation during emergencies and national events, from flood response and fire fighting to helping with large national gatherings.

Analyse how volunteerism reflects Bhutanese values and strengthens the nation. In your answer, explain the roles of civic responsibility, unity, and leadership by example. (10 marks)', 'Volunteerism reflects deep Bhutanese values: selfless service, compassion for others, gratitude to the country and the Throne, and the belief that the nation''s well-being comes before personal comfort.

Civic responsibility: volunteers act because they see the nation''s problems as their own. When floods or fires strike, Desuups and local people do not wait for others; they protect lives and property themselves. This sense of duty is the foundation of a strong society.

Unity: volunteers come from every background, such as students, farmers, civil servants and business people, and serve side by side in the same uniform. Shared work builds friendship and trust and reduces divisions between people and regions.

Leadership by example: His Majesty The King and the Royal Family personally lead and take part in national service. When leaders serve, citizens are inspired to follow.

Through these values, volunteerism makes Bhutan more resilient in crises and keeps the spirit of service alive in every generation.', null, '[{"point": "Bhutanese values shown by volunteerism: selfless service, compassion, gratitude, unity", "marks": 3}, {"point": "Civic responsibility explained with an example", "marks": 2}, {"point": "Unity across backgrounds explained", "marks": 2}, {"point": "Leadership by example explained (for example the Royal Family and leaders who serve)", "marks": 2}, {"point": "Link to national strength and resilience", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'topical-issues-national-values'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B1'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'B1s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'B1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'B1s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'Many young Bhutanese are starting small agribusinesses, such as mushroom farms, poultry units and dairy processing, supported by credit schemes and training programmes.

Evaluate the potential of youth agribusiness to contribute to sustainable development in Bhutan. Write two opportunities and one challenge such ventures may face. (10 marks)', 'Youth agribusiness can play an important role in Bhutan''s development by joining employment for young people with greater food self-sufficiency.

Opportunity 1: jobs and self-employment. Agribusiness allows young people to create their own work instead of waiting for office jobs. This reduces youth unemployment and the pressure to migrate to towns or abroad.

Opportunity 2: food security and rural development. Local production of mushrooms, eggs, milk products and vegetables reduces Bhutan''s dependence on imports and keeps money in the country. Farms in rural areas also bring life and income back to villages.

Challenge: finding reliable markets and fair prices. Small producers often compete with cheaper imports and face high transport costs, and some lack business skills or enough capital. Without steady buyers, many ventures may close.

Overall, youth agribusiness has strong potential if it is supported with market links, training, affordable credit and cooperation among producers.', null, '[{"point": "Brief evaluation of potential", "marks": 2}, {"point": "Opportunity 1 explained (for example jobs and self-employment for youth, reducing unemployment and migration)", "marks": 3}, {"point": "Opportunity 2 explained (for example food self-sufficiency, fewer imports, rural development)", "marks": 3}, {"point": "Challenge explained (for example markets and prices, access to finance, skills, wildlife damage, climate)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'topical-issues-economy-and-environment'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B2'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'B2s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'B2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'B2s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'Waste management has become a growing concern in Bhutan''s towns, with plastic and household waste increasing every year.

Propose and explain two practical ways in which you and your community can reduce waste and keep your surroundings clean. (10 marks)', 'Waste harms health, pollutes rivers and spoils the beauty that Bhutan is known for. Every household and community can help.

1. Segregate and reuse waste at home. Families can separate wet waste from dry waste. Kitchen waste can be composted into manure for gardens, while paper, bottles and metals can be given to recyclers. This greatly reduces what goes to landfills and makes recycling easier.

2. Reduce plastic and organise community action. We can carry our own cloth bags and water bottles, avoid single-use plastics, and choose products with less packaging. Communities, schools and youth groups can organise regular clean-up campaigns and awareness drives, and keep their own neighbourhood clean.

If each of us reduces and manages waste responsibly, our towns will stay clean, healthy and attractive for residents and visitors.', null, '[{"point": "Way 1: practical, explained (for example segregating waste at source, composting, recycling)", "marks": 4}, {"point": "Way 2: practical, explained (for example reducing plastic use, community clean-up campaigns, awareness)", "marks": 4}, {"point": "Why it matters: health, environment, tourism, Bhutan''s clean image", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'topical-issues-economy-and-environment'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B3'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'B3s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'B3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'B3s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'Government services in Bhutan are increasingly offered online, from applying for documents to paying bills, and many citizens now use mobile banking and digital identity.

Express your views in about 150-200 words on digital public services by explaining two advantages for citizens and one challenge the government must address. (10 marks)', 'Digital public services can make government faster and fairer for every Bhutanese.

The first advantage is convenience. Citizens can apply for documents, pay bills and access information from home or a village, without travelling to a dzongkhag or thromde office and waiting in queues. This saves time and money, especially for people in remote areas.

The second advantage is transparency and efficiency. Online systems record every step, so applications are processed in order, delays are visible and opportunities for favouritism or corruption are reduced. Officials can also serve more people with less paperwork.

However, the government must address the digital divide. Many elderly people, rural residents and those with little education lack smartphones, reliable internet or digital skills, so they may be left behind. Online systems also need strong cyber security to protect citizens'' personal data.

In my view, digital services are the right direction, but they must be combined with digital literacy programmes, community help desks and strong data protection, so that no citizen is excluded.', null, '[{"point": "Advantage 1 elaborated (for example saving time and travel, services from remote areas)", "marks": 3}, {"point": "Advantage 2 elaborated (for example transparency, less corruption, faster service)", "marks": 3}, {"point": "One challenge (for example digital divide, internet access, digital literacy of elderly, cyber security and privacy)", "marks": 3}, {"point": "Own view and length about 150-200 words", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'topical-issues-technology-and-governance'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B4'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'B4s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B4s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B4s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'B4s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'B4s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'descriptive', 'Article 9 of the Constitution directs the State to promote conditions that will enable the pursuit of Gross National Happiness. Mention and elaborate two ways in which a citizen can contribute to Gross National Happiness in daily life. (10 marks)', 'Gross National Happiness is Bhutan''s development philosophy: progress should balance material growth with well-being, culture, good governance and the environment. The Constitution asks the State to promote it, but citizens also have a part to play.

1. Work honestly and serve others. By doing our jobs with integrity, being punctual and treating people fairly, we support good governance and a productive economy. Helping neighbours, volunteering and respecting others builds trust and harmony in society.

2. Care for culture, nature and well-being. We can speak Dzongkha, take part in community festivals, protect the environment by reducing waste and planting trees, and look after our own health and mental well-being and that of our families.

When each citizen lives in this balanced way, GNH becomes a reality in daily life, not only a government policy.', null, '[{"point": "Brief explanation of GNH and the State''s duty", "marks": 2}, {"point": "Way 1 mentioned and elaborated (for example honest, productive work and good governance)", "marks": 4}, {"point": "Way 2 mentioned and elaborated (for example caring for community, culture and environment, personal well-being)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'subjective-environment-and-citizenship'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'C1'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C1s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'C1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'C1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'C1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'C1s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'descriptive', 'You are the Communication Officer of your dzongkhag administration. Write a short official press release (about 150-200 words) informing the public about a tree-planting campaign to be held in your dzongkhag next month. Include the purpose, date, venue and how the public can take part. (10 marks)', 'PRESS RELEASE
Dzongkhag Administration launches tree-planting campaign

[Dzongkhag], [date]: The Dzongkhag Administration, in collaboration with the Department of Forests and Park Services and local schools, will hold a tree-planting campaign on [date] at [venue], beginning at 9 a.m.

The campaign aims to restore degraded slopes, protect water sources and raise awareness of every citizen''s duty to protect the environment, as enshrined in Article 5 of the Constitution. Around 2,000 native seedlings will be planted during the day.

Members of the public, students, Desuups, civil servants and business communities are warmly invited to take part. Participants are requested to register with their gewog office or at the dzongkhag administration by [date], and to bring a water bottle and, if possible, a digging tool. Seedlings, gloves and refreshments will be provided.

Let us come together to keep our dzongkhag green for present and future generations.

For more information, please contact:
Communication Officer, Dzongkhag Administration
Phone: [number] | Email: [address]', null, '[{"point": "Correct press-release format: heading, place and date line, contact details at the end", "marks": 3}, {"point": "Content: purpose, date, venue, how to take part, who is organising", "marks": 4}, {"point": "Formal, clear and concise language, about 150-200 words", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'subjective-writing-skills'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C2s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'C2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'C2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'C2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'C2s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'descriptive', 'Discuss one potential benefit and one risk of the growing use of social media among young people in Bhutan. (10 marks)', 'Social media platforms such as Facebook, TikTok and YouTube are now part of daily life for most young Bhutanese, who use them on smartphones for news, entertainment and communication.

Benefit: access to information and opportunities. Young people can learn new skills from online tutorials, follow news, join discussions and connect with friends and relatives abroad. Many youth also use social media to promote small businesses, share their art and music, or raise awareness on social issues.

Risk: misinformation and harm to well-being. False news and rumours spread quickly and can mislead people. Too much time online can lead to addiction, poor sleep and weaker studies, and cyberbullying and comparison with others can harm mental health. Sharing personal information carelessly also creates privacy and safety risks.

Social media is therefore a powerful tool. Young people need digital literacy and self-discipline to enjoy its benefits while avoiding its dangers.', null, '[{"point": "Brief introduction to the growth of social media use", "marks": 2}, {"point": "One benefit discussed (for example access to information and learning, staying connected, opportunities for business and creativity)", "marks": 4}, {"point": "One risk discussed (for example misinformation, cyberbullying, addiction and mental health, privacy)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'subjective-general-knowledge'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'C3'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C3s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'C3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'C3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'C3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'C3s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'descriptive', 'Should mobile phones be allowed in Bhutanese classrooms for learning purposes? Why? Provide two reasons to justify your stand. (10 marks)', 'I believe mobile phones should be allowed in classrooms only for planned learning activities, under the teacher''s guidance.

Reason 1: they open up learning resources. With a phone, students can look up information, watch short educational videos, use dictionaries and learning apps, and practise skills such as mathematics or languages. In schools with few books or computers, phones can bring the world''s knowledge into the classroom.

Reason 2: they prepare students for a digital future. Bhutan is moving towards digital services and jobs. Using phones responsibly in class teaches students how to search, check sources and use technology for work, skills they will need after school.

However, phones can also distract students, enable cheating and expose them to harmful content. Therefore schools should allow them only when the teacher plans a learning task, with clear rules, and phones should be kept away at other times.', null, '[{"point": "Clear stand (yes, no or a qualified view)", "marks": 2}, {"point": "Reason 1 explained with an example", "marks": 4}, {"point": "Reason 2 explained with an example; any condition noted", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'subjective-education-and-language'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'C4'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C4s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'C4s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'C4s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'C4s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'C4s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'descriptive', 'Discuss one advantage and one disadvantage of working from home for employees and organisations. (10 marks)', 'Working from home became common during the COVID-19 pandemic and has continued in many organisations, supported by internet and online meeting tools.

Advantage: flexibility and savings. Employees save the time and money spent on travelling, and can arrange their work around family needs, which can improve well-being and productivity. Organisations can save on office space and can hire skilled people who live far away.

Disadvantage: isolation and weaker teamwork. Employees may feel lonely and disconnected from colleagues, and communication can become slow or unclear. Supervisors find it harder to guide new staff, and work and home life can mix, leading to longer working hours and stress. Working from home also depends on reliable internet and electricity, which are not available everywhere.

A balanced approach, combining some days in the office with some days at home, can bring the benefits while reducing the problems.', null, '[{"point": "Brief introduction to remote work", "marks": 2}, {"point": "One advantage discussed (for example flexibility, saving travel time and costs, wider talent pool)", "marks": 4}, {"point": "One disadvantage discussed (for example isolation, communication and supervision problems, blurred work-life boundaries, need for reliable internet)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'subjective-general-knowledge'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C5s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'C5s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'C5s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'C5s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'C5s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Losing that job turned out to be a blessing in disguise. The idiom "a blessing in disguise" means:', null, 'A blessing in disguise is something that seems unfortunate at first but later proves to be good.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'english-vocabulary-and-idioms'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A misfortune that cannot be avoided.', false, 1), ('B', 'Something good that at first seemed bad.', true, 2), ('C', 'A reward for hard work.', false, 3), ('D', 'A secret gift from a friend.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Choose the word closest in meaning to "meticulous":', null, 'Meticulous means showing great attention to detail; very careful and precise.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'english-vocabulary-and-idioms'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Very careful and precise', true, 1), ('B', 'Quick', false, 2), ('C', 'Careless', false, 3), ('D', 'Generous', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which sentence is in the passive voice?', null, 'In the passive voice the object becomes the subject and the verb uses a form of "be" + past participle: "The report was submitted".', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'english-grammar'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The officer submitted the report.', false, 1), ('B', 'The officer is submitting the report.', false, 2), ('C', 'The officer will submit the report.', false, 3), ('D', 'The report was submitted by the officer.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'In which year did Bhutan become a member of the United Nations?', null, 'Bhutan joined the United Nations in 1971.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-bhutan'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1985', false, 1), ('B', '1971', true, 2), ('C', '2008', false, 3), ('D', '1962', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Bhutan''s National Day, 17 December, commemorates:', null, 'National Day marks the enthronement of Gongsar Ugyen Wangchuck as the first hereditary King of Bhutan on 17 December 1907.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-bhutan'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Bhutan''s admission to the United Nations', false, 1), ('B', 'The birth of Guru Rinpoche', false, 2), ('C', 'The coronation of the first King, Ugyen Wangchuck, in 1907', true, 3), ('D', 'The adoption of the Constitution', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The Constitution of the Kingdom of Bhutan was adopted in:', null, 'The Constitution was adopted on 18 July 2008.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-bhutan'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2008', true, 1), ('B', '1953', false, 2), ('C', '2013', false, 3), ('D', '1999', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The highest mountain in Bhutan is:', null, 'Gangkar Puensum (about 7,570 m) is Bhutan''s highest peak and is considered the highest unclimbed mountain in the world.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-bhutan'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Jichu Drake', false, 1), ('B', 'Masang Gang', false, 2), ('C', 'Gangkar Puensum', true, 3), ('D', 'Jomolhari', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which author wrote the novel "Nineteen Eighty-Four" (1984)?', null, '"Nineteen Eighty-Four" was written by George Orwell and published in 1949.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'english-literature'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ernest Hemingway', false, 1), ('B', 'George Orwell', true, 2), ('C', 'Aldous Huxley', false, 3), ('D', 'Charles Dickens', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'A traditional Japanese haiku has:', null, 'A haiku has three lines, traditionally of 5, 7 and 5 syllables.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'english-literature'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Three lines', true, 1), ('B', 'Four lines', false, 2), ('C', 'No fixed number of lines', false, 3), ('D', 'Fourteen lines', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Choose the grammatically correct sentence.', null, 'With "neither ... nor", the verb agrees with the nearer subject, "students", so it is plural: were.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'english-grammar'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Neither the teacher nor the students was late.', false, 1), ('B', 'Neither the teacher or the students were late.', false, 2), ('C', 'Neither the teacher nor the students were late.', true, 3), ('D', 'Neither the teacher nor the students is late.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Choose the word opposite in meaning to "scarce":', null, 'Scarce means in short supply; its opposite is abundant.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'english-vocabulary-and-idioms'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Rare', false, 1), ('B', 'Expensive', false, 2), ('C', 'Limited', false, 3), ('D', 'Abundant', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which of the following is NOT one of the four pillars of Gross National Happiness?', null, 'The four pillars are good governance, sustainable socio-economic development, preservation and promotion of culture, and environmental conservation.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-bhutan'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Rapid industrialisation', true, 1), ('B', 'Environmental conservation', false, 2), ('C', 'Preservation and promotion of culture', false, 3), ('D', 'Good governance', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The largest ocean in the world is the:', null, 'The Pacific Ocean is the largest and deepest ocean.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-geography'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Pacific Ocean', true, 1), ('B', 'Indian Ocean', false, 2), ('C', 'Arctic Ocean', false, 3), ('D', 'Atlantic Ocean', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The currency of Bhutan is the:', null, 'Bhutan''s currency is the Ngultrum (Nu), which is pegged to the Indian Rupee.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-bhutan'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Rupee', false, 1), ('B', 'Ngultrum', true, 2), ('C', 'Taka', false, 3), ('D', 'Kyat', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which planet is known as the Red Planet?', null, 'Mars looks red because of iron oxide (rust) on its surface.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-science'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Jupiter', false, 1), ('B', 'Saturn', false, 2), ('C', 'Venus', false, 3), ('D', 'Mars', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'In the sentence "She speaks softly", the word "softly" is:', null, '"Softly" describes how she speaks, so it modifies the verb: it is an adverb.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'english-grammar'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'a preposition', false, 1), ('B', 'an adverb', true, 2), ('C', 'a noun', false, 3), ('D', 'an adjective', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Presenting someone else''s work or ideas as your own without acknowledgement is called:', null, 'Plagiarism is using another person''s work or ideas without giving credit.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'english-writing-and-research'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Paraphrasing', false, 1), ('B', 'Citation', false, 2), ('C', 'Plagiarism', true, 3), ('D', 'Copyright', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The national sport of Bhutan is:', null, 'Archery (dha) is Bhutan''s national sport.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-bhutan'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cricket', false, 1), ('B', 'Khuru', false, 2), ('C', 'Archery', true, 3), ('D', 'Football', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which of the following is a renewable source of energy?', null, 'Solar energy is renewable; coal, natural gas and petroleum are fossil fuels that cannot be replaced.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-science'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Solar energy', true, 1), ('B', 'Natural gas', false, 2), ('C', 'Coal', false, 3), ('D', 'Petroleum', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The SAARC Secretariat is located in:', null, 'The SAARC Secretariat was set up in Kathmandu, Nepal, in 1987.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Dhaka', false, 1), ('B', 'Thimphu', false, 2), ('C', 'New Delhi', false, 3), ('D', 'Kathmandu', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
commit;
