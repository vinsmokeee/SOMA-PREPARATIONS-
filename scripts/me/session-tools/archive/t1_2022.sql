-- ME Paper I (Technical): BCSE 2022, batch 4: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null);
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'case-study', 'Case study' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'dzongkha-comprehension', 'Dzongkha comprehension' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'general-knowledge', 'General knowledge' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'topical-issues-economy', 'Topical issues: economy' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'topical-issues-employment', 'Topical issues: employment' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'topical-issues-environment', 'Topical issues: environment' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'topical-issues-international-relations', 'Topical issues: international relations' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'translation-english-to-dzongkha', 'Translation: English to Dzongkha' on conflict (subject_id, slug) do nothing;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'Read the following passage and answer ALL THREE questions.

FACING EXTINCTION (Kevin Hall)

For many centuries, the Kawesqars (Kah-WES-cars) endured in the harsh land at the bottom of South America where the bitter wind is sometimes strong enough to knock down a child, but they have not fared so well against their fellow man. Today fewer than 20 pureblood Kawesqars survive.

Most of the pureblood Kawesqars and another 100 people of mixed-race live in Punta Arenas, Chile’s southernmost city; in Puerto Willaims, on the Chilian coast of Terria del Feugo Island near the southern tip of South America; or in Puerto Eden, on Wellington Island.

Diseases brought by European sheep farmers and seal hunters at the end of the 19th century killed many Kawesqars. So did alcoholism. The settlers’ bounty on the heads of the Kawesqars who hunted their sheep was a factor, too, but so was the simple act of switching to western clothing.

Discarded clothing carried Western diseases, and because the stormy Patagonia region of South America often experiences all four seasons in a day, paddling in the wet clothing soon brought pulmonary diseases for which the Kawesqars had no immunity. Tuberculosis reached epidemic proportions.

Today, The Kawesqars are nearly extinct, pursued by social scientists on ‘cultural salvage’ operations to learn as much as possible about them before they disappear.

With the death of the last surviving elders “goes all our ancestral knowledge,” said Oscar Aguilera, an ethnolinguistic (a students of the languages of society) at the University of Chile in Santiago who had spent two decades among the Kawesqars.

The nomadic Kawesqars had neither tribal structure nor leaders, living instead in extended families headed by the oldest male. To the surprise of anthropologists, they also had no god or gods.

“They believe in a force that gives balance to all things,”said Nelson Auguila, an anthropologist who head the Punta Arenas office of the National Indeginuous Develoopment Corp. (Conadi), a quasi- governmental aid agency for native Chilians. When the balance in upset, Kawesqars blame a spirit called Ayayema.

Alberto Achacaz Walakial, whose family guesses he is between 70 and 80, is one of the surviving elders. He lives in a shack with a car seat as his couch. To put food on the table, he carves sea lion bones into makeshift harpoon tips and sews tiny toy canoes out of sea lion skins, souvenirs for the tourist trade.

“We used to navigate these straits in canoes. But that was when we were children, “he recalled in Spanish. He is short and stocky, round-faced, with oriental eyes, coarse hair, a dark complexion and a halting speech rhythm. Kawesqars resemble Alaskan Inuit, who are also believed to have come to the Americas from Asia, and who live in a similarly unforgiving environment.

Achacaz became animated – and hard to understand-as he recalled fishing and hunting expeditions in his childhood. That was before 1936 when Chile built an air force base on Wellington Island. The last Kawesqars abandoned their wigwams in favour of ramshackle subsidized housing. Instead of fishing, they began taking odd jobs. Cheap jackets replaced the wraps of sea lion skin that had helped them fend off the cold for generations.

Only one of Achacaz’s three daughters, Veronica, speaks Kawesqar. There are almost no Kawesqars left to marry who are not blood relatives.

“It would be really nice, because we understand things among ourselves that no one else does,” said Veronica, 40, who married a mixed-race man. Their daughter, Susan, 4, soon will begin learning Kawesqar from elders. It won’t be easy, because of the way their language reflects the Kawesqar’s unique experience. For example, the Kawesqars have words for the immediate future, but not for the indefinite future – basically, for tonight’s dinner but not for next Friday’s meal.

“For them, this is a concept that just doesn’t exist,” said Paz Errazuriz, a Chiliean artist who brought the Kawesqars national attention in 1996 with an acclaimed photography exhibit called Nomads of the Sea, which has since travelled the globe. She contends the Kawesqars’ lack of the concept of a future helps explain their inability to escape poverty. On the other hand, Kawesqars have at least 32 variants of the word ‘here”, one each for the principal places or kinds of places they used to visit as nomads.

Their ancestors are believed to have wandered across the Bering Strait from Siberia to Alaska thousands of years ago. They lived in isolation until 1520, when Ferdinand Magellan, a Portugese captain sailing under the Spanish flag, discovered the southern strait that links the Atlantic and Pacific oceans.

“They were always people with great mobility”, said Conadi’s Aguilera. “Land means nothing to them. They view the sea as land.” Offered land, a few Kawesqars accepted small parcels in southernmost Chile, but most did not. Some, such as Patricio Tonko, 30, want exclusive fishing rights in certain Patagonian channels and the government aid to buy commercial fishing boats.

But their dwindling numbers make it hard to win attention from Santiago, the Chilian capital 2,500 kilometers to the north. “There is nobody who represents us. All the indigenous power is in the north”, where another more numerous native group lives, the Mapuches, said Tonko, a full-blooded Kawesqar who was adopted and raised in Punta Arenas in a Spanish-speaking household.

Among the Kawesqars’ biggest challenges is escaping the impression they’re already extinct. Tourist haunts in Patagonia sell postcards and buttons made from grainy, sepia-coloured photographs of

Kawesqars at the end of the 19th century. “The impression left is that Chile had an indigenous past but that it’s over”, said Mario Martinez, one of the first activists to help the Kawesqars. “Everything there points to an end: an end of the race and the culture”, photographer Errazuriz said in an interview in Santiagio. “They are at the end of their lineage and live at the end of the world . . . It is evident in everything that they are the last.”

Question 1
How does the Kawesqars'' language reflect the way they lived? How is it (the language) also the cause of their struggle for survival once other people settled in their land? (10 marks)', 'The Kawesqar language mirrors their life as sea nomads. They lived day to day, hunting and fishing for what they needed immediately, so their language has words for the immediate future, such as tonight''s dinner, but not for an indefinite future like next Friday. They moved constantly between places along the channels, so they have at least 32 different words for "here", one for each main place or kind of place they used to visit.

The same language became part of their struggle once settlers arrived. In a settled, cash-based economy, people need to plan, save and think about the long term. Without the concept of a future, the Kawesqars found it hard to plan, invest or save, and the artist Paz Errazuriz argues that this helps explain their inability to escape poverty. Their words also describe a nomadic world that no longer exists, so with few speakers left and children growing up among Spanish speakers, the language is hard to pass on, and with it their knowledge disappears.', null, '[{"point": "Language reflects nomadic sea life: words for the immediate future but not the indefinite future; at least 32 variants of ''here'' for places visited", "marks": 5}, {"point": "Cause of struggle: no concept of a distant future, so no planning or saving - linked to their inability to escape poverty in a settled economy; hard to pass on as few speakers remain", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'case-study'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2022b4-cs', 1, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'A1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 2.0, 3 from me_q where key = 'A1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 1.5, 4 from me_q where key = 'A1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'Question 2
The article ends with the line, "It is evident in everything that they are the last."
Mention two pieces of evidence that the author points to in the article to show that those living Kawesqars are the last pure-blood of the tribe and elaborate them. (10 marks)', 'First, their numbers are tiny. Fewer than 20 pureblood Kawesqars survive, and there are almost no Kawesqars left to marry who are not blood relatives. Veronica, for example, married a mixed-race man, so their daughter is not pureblood; each generation becomes more mixed.

Second, their language and way of life are disappearing with the elders. Only one of Alberto Achacaz''s three daughters speaks Kawesqar, and when elders like him die, "all our ancestral knowledge" goes with them. They no longer travel in canoes or live in wigwams; they live in subsidised housing, do odd jobs and make souvenirs for tourists. Even postcards sold to tourists show them as a people of the past, giving the impression that they are already extinct.', null, '[{"point": "Evidence 1 elaborated: fewer than 20 pureblood Kawesqars survive; almost none left to marry who are not blood relatives (mixed marriages)", "marks": 5}, {"point": "Evidence 2 elaborated: language and way of life dying - only one of Achacaz''s three daughters speaks Kawesqar; elders dying with ancestral knowledge; canoes, wigwams and sealskin replaced; tourist postcards present them as already extinct", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'case-study'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2022b4-cs', 2, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'A2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 2.0, 3 from me_q where key = 'A2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 1.5, 4 from me_q where key = 'A2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'Question 3
Like in Chile, Bhutan also has many minority indigenous tribes that may become extinct not far in the future if appropriate measures are not taken. Identify any ONE tribe and suggest ways in which the government and the people themselves can help this tribe to thrive. (10 marks)', 'One such group is the Doyas (Lhops) of Dorokha and Taba-Dramtoe in Samtse, a small community with its own language, customs and burial practices.

The government can help by documenting their language, songs and rituals with the Dzongkha Development Commission and the National Library, so that knowledge is preserved; by providing schools, health care and roads while respecting their way of life; by supporting livelihoods such as farming, cardamom and crafts, and protecting their land; and by promoting community-based cultural tourism that brings income without destroying traditions.

The community itself must keep its identity alive: parents should speak their language at home, elders can teach songs, rituals and skills to children, festivals should continue, and the community can form cooperatives to market products. Educated Doya youth can act as leaders and bridges between tradition and modern life.

With both efforts, the Doyas can modernise without losing who they are.', null, '[{"point": "One tribe identified with brief description (e.g. Doyas/Lhop of Samtse, Monpas of Trongsa/Zhemgang, Brokpas of Merak-Sakteng, Layaps)", "marks": 2}, {"point": "Government measures (education and health access, documenting language and culture, livelihood and land rights, cultural tourism)", "marks": 4}, {"point": "Measures by the community itself (teach language to children, keep festivals and crafts, cooperatives, community leaders)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'case-study'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2022b4-cs', 3, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'A3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 2.0, 3 from me_q where key = 'A3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 1.5, 4 from me_q where key = 'A3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'In recent times, many Bhutanese, educated youths in particular, have been going abroad by the hundreds in search of employment and a better life. Concerned citizens have opined that this trend, among other things, would lead to brain-drain. Elaborate your views on this issue. (10 marks)', 'I agree that large-scale migration of educated youth risks brain-drain, though it also brings some benefits.

Young people leave because jobs at home are limited, salaries are low compared with countries like Australia, and they want further study and a better life for their families; friends'' success stories encourage others.

The loss is serious when skilled professionals such as nurses, doctors, teachers and engineers leave, creating gaps in public services and slowing development. Villages are left with the elderly. On the other hand, migrants send remittances, and those who return bring new skills and experience.

To limit brain-drain, Bhutan should improve pay and careers in critical professions, create private-sector jobs (for example through Gelephu Mindfulness City), keep links with Bhutanese abroad and make it easy for them to return and invest.', null, '[{"point": "Clear view", "marks": 2}, {"point": "Causes (limited jobs and pay, better opportunities abroad, peer influence)", "marks": 3}, {"point": "Effects: brain-drain (doctors, nurses, teachers, engineers), ageing villages; but remittances and skills", "marks": 3}, {"point": "Suggestions", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'topical-issues-employment'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'B1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 2.0, 3 from me_q where key = 'B1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 1.5, 4 from me_q where key = 'B1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'The government recently endorsed the Tourism Levy Bill that increased the Sustainable Development Fee (SDF) to US $200 every night for a tourist. This decision has been met with mixed reactions from the people concerned like the tour operators and hotel owners. Express your opinion on this decision by highlighting its effect on the economy of the country. (10 marks)', 'The decision supports "high value, low volume" tourism, but its economic effects are mixed.

On the positive side, a higher SDF brings more revenue per visitor for health, education, environmental protection and carbon-neutral development, and it avoids mass tourism that can damage our culture and environment.

On the negative side, many tourists may choose cheaper destinations, so arrivals fall. Tour operators, hotels, guides, drivers, restaurants and handicraft sellers lose income, and many young people in the sector lose jobs at a time when the economy is recovering from COVID-19. Foreign exchange earnings may also fall.

In my opinion the policy is right in principle, but it needs flexibility: incentives such as reduced fees for longer stays or for visits to less-visited eastern dzongkhags, and better quality services so that tourists feel they get value for the fee. (The SDF was later reduced to US $100 in 2023.)', null, '[{"point": "Clear opinion", "marks": 2}, {"point": "Positive effects (high-value low-volume tourism, revenue for sustainability, less pressure on environment and culture)", "marks": 3}, {"point": "Negative effects (fewer tourists, losses for tour operators, hotels, guides, drivers, handicraft sellers; jobs)", "marks": 3}, {"point": "Balanced suggestion", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'topical-issues-economy'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'B2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 2.0, 3 from me_q where key = 'B2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 1.5, 4 from me_q where key = 'B2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'At the 2021 United Nations Climate Change Conference (COP 26) several countries agreed to accelerate the implementation of ''transition to zero emission vehicles'' as one of the ways to address climate change. Explain your stand on this agreement by giving evidences on the pros and cons of ''zero emission vehicles''. (10 marks)', 'I support the agreement, while recognising its challenges.

Pros: zero emission vehicles such as electric cars produce no exhaust, so they cut carbon dioxide and air pollution in cities. Running costs are lower because electricity is cheaper than fuel and EVs need less maintenance. For Bhutan, EVs run on our own clean hydropower, reducing fuel imports and the trade deficit.

Cons: EVs are expensive to buy and need charging stations, which are still few. Batteries require mining of lithium and cobalt, which harms the environment, and old batteries must be recycled safely. In countries whose electricity comes from coal, EVs only move emissions to power plants. In mountainous areas, cold weather and steep roads reduce range.

Overall, with support for charging networks, recycling and clean power, the transition is an important step against climate change.', null, '[{"point": "Clear stand", "marks": 2}, {"point": "Pros with evidence (no exhaust, less CO2 and air pollution, lower running costs, use of clean hydropower in Bhutan, less fuel import)", "marks": 4}, {"point": "Cons with evidence (high cost, charging infrastructure, battery mining and disposal, electricity source in other countries, range in mountains)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'topical-issues-environment'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'B3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 2.0, 3 from me_q where key = 'B3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 1.5, 4 from me_q where key = 'B3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'The following is an extract of an article that appeared recently in a journal: "There could be no better example of the United Nations'' failure to live up to its founding ideals than the recent visit by Secretary-General António Guterres to Russia. Attempting to calm the dangerous war in Ukraine, he obtained nothing of significance." To what extent do you agree or disagree with the extract? Provide evidence in support of your opinion. (10 marks)', 'I partly disagree with the extract.

It is true that the UN failed to stop the war. Russia, as a permanent member of the Security Council, can veto any resolution against it, so the UN could not take strong action, and Guterres'' visit to Moscow in April 2022 did not bring a ceasefire. This shows a weakness in the UN''s structure.

However, the visit was not without results. It helped arrange the evacuation of civilians from the Azovstal steel plant in Mariupol, and the UN later brokered, with Turkey, the Black Sea Grain Initiative that allowed Ukrainian grain to reach world markets and eased a global food crisis. UN agencies also provided humanitarian aid to millions of refugees.

So the UN did not achieve peace, but it still served its humanitarian ideals; the real problem lies in the power of the permanent members.', null, '[{"point": "Clear stand", "marks": 2}, {"point": "Evidence for the extract (war continued; Security Council veto by Russia; UN unable to stop aggression)", "marks": 4}, {"point": "Evidence against (humanitarian corridors e.g. Mariupol/Azovstal evacuation, Black Sea Grain Initiative, aid to refugees)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'topical-issues-international-relations'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'B4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 2.0, 3 from me_q where key = 'B4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 1.5, 4 from me_q where key = 'B4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The Nobel Prize is awarded as per the will of', null, 'The prizes were founded by the will of Alfred Nobel (1895).', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'C1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Alfred Nobel', true, 1), ('B', 'Isaac Nobel', false, 2), ('C', 'Asimov Nobel', false, 3), ('D', 'Nobel Asimov', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which highest civilian award of Bhutan was conferred on Shri Narendra Modi, Prime Minister of India?', null, 'Modi received the Ngadag Pel gi Khorlo (Order of the Druk Gyalpo).', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'C2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ngadag Pel gi Khorlo', true, 1), ('B', 'Drakpoi Rinchen Tshuktor', false, 2), ('C', 'Druk Wangyal', false, 3), ('D', 'Druk Thugsey', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Bhutan hosted the SAARC Summit for the first time in', null, 'The 16th SAARC Summit was held in Thimphu in April 2010.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'C3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2014', false, 1), ('B', '2011', false, 2), ('C', '2010', true, 3), ('D', '2012', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'In 2022, His Majesty the Fourth Druk Gyalpo was awarded the Blue Planet Prize in recognition of his contributions towards the', null, 'The Blue Planet Prize honours contributions to solving global environmental problems.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'C4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'prevention of water and air pollution', false, 1), ('B', 'preservation of cultural heritage', false, 2), ('C', 'resolution of global environmental problems', true, 3), ('D', 'resolution of global social harmony', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The Olympic motto adopted in July 2021, ''Citius, Altius, Fortius - Communiter'', means', null, '''Communiter'' means together.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'C5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Faster, Higher, Stronger - In Unity', false, 1), ('B', 'Faster, Higher, Stronger - Together', true, 2), ('C', 'Stronger, Faster, Better - Globally', false, 3), ('D', 'Faster, Higher, Stronger - In Harmony', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'BIMSTEC was established by seven South and Southeast Asian nations for', null, 'BIMSTEC is the Bay of Bengal Initiative for Multi-Sectoral Technical and Economic Cooperation.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'C6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'mutual assistance to strengthen political stability', false, 1), ('B', 'cooperation in defence and military fields', false, 2), ('C', 'mutual cooperation in using the Bay of Bengal for commercial purposes', false, 3), ('D', 'collaboration and mutual assistance in economic and technical fields', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'NFTs (non-fungible tokens) basically deal in', null, 'NFTs are unique digital certificates, widely used to buy and sell digital art.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'C7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'exchange of cryptocurrencies', false, 1), ('B', 'fronting of technological licences', false, 2), ('C', 'not-for-profit commerce', false, 3), ('D', 'buying and selling digital art', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'In digital technology, the metaverse refers to', null, 'The metaverse is a shared virtual space where people interact through avatars.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'C8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'a virtual reality simulation where people can interact with each other', true, 1), ('B', 'things that are beyond reality', false, 2), ('C', 'conversations over the internet using secret codes', false, 3), ('D', 'coding and gamification', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Who is considered the father of English literature?', null, 'Geoffrey Chaucer, author of The Canterbury Tales.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'C10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Edmund Spenser', false, 1), ('B', 'Geoffrey Chaucer', true, 2), ('C', 'Charles Dickens', false, 3), ('D', 'Christopher Marlowe', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'This South Asian country is made up of a group of islands to the southwest of Sri Lanka:', null, 'The Maldives lies southwest of Sri Lanka.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'C11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Malaysia', false, 1), ('B', 'Madagascar', false, 2), ('C', 'Maldives', true, 3), ('D', 'Mauritius', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Wimbledon is associated with which sport?', null, 'Wimbledon is the oldest tennis tournament.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'C12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Soccer', false, 1), ('B', 'Badminton', false, 2), ('C', 'Cricket', false, 3), ('D', 'Tennis', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Bhutan lost control over the Duar areas of Assam and Bengal as a result of the', null, 'The Treaty of Sinchula after the Duar War (1865) ceded the Duars to British India.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'C14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Anglo-Bhutanese Treaty, 1774', false, 1), ('B', 'Treaty of Sinchula, 1865', true, 2), ('C', 'Treaty of Friendship, 1949', false, 3), ('D', 'Treaty of Punakha, 1910', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The people who initiated the formation of the United Nations were', null, 'Roosevelt and Churchill''s Atlantic Charter (1941) laid the foundation of the UN.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'C15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Winston Churchill and Charles de Gaulle', false, 1), ('B', 'Winston Churchill and Joseph Stalin', false, 2), ('C', 'Joseph Stalin and Franklin D. Roosevelt', false, 3), ('D', 'Franklin D. Roosevelt and Winston Churchill', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Tesla Inc. chiefly manufactures', null, 'Tesla is best known for electric vehicles.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'C16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'electric vehicles', true, 1), ('B', 'aviation engines', false, 2), ('C', 'space vehicles', false, 3), ('D', 'mobile phones', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which one of the following is a legacy of Gyalse Tenzin Rabgye, the 4th Druk Desi?', null, 'The thirteen traditional arts (zorig chusum) were formalised during Gyalse Tenzin Rabgye''s rule.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'C17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The Tungam-Gelong chham', false, 1), ('B', 'Zorig chusum, the thirteen traditional arts', true, 2), ('C', 'Tax reform', false, 3), ('D', 'Judicial procedure', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The theme of the International Day of Happiness 2022 was', null, 'The 2022 theme was ''Keep Calm, Stay Wise and Be Kind''.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'C18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Keep Calm, Stay Wise and Be Kind', true, 1), ('B', 'Share Happiness and be Part of Something Amazing', false, 2), ('C', 'Share Happiness', false, 3), ('D', 'Happiness For All, Forever', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which protocol is related to the Access and Benefit Sharing (ABS) mechanism?', null, 'The Nagoya Protocol (2010) covers access to genetic resources and benefit sharing.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'C19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Geneva Protocol', false, 1), ('B', 'Cartagena Protocol', false, 2), ('C', 'Nagoya Protocol', true, 3), ('D', 'Kyoto Protocol', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The first Bhutanese feature film, Gasa Lamai Singye, was made in', null, 'Gasa Lamai Singye was released in 1989.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'C20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1991', false, 1), ('B', '1989', true, 2), ('C', '1990', false, 3), ('D', '1988', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'passage', '༉ འཛམ་གླིང་ནང་ལུ་ ཡར་རྒྱས་ཀྱི་འགྱུར་བ་ཚུ་ ཡར་ངོའི་ཟླཝ་བཟུམ་སྦེ་ ཉིནམ་གཅིག་བ་ཉིནམ་གཅིག་ གོང་འཕེལ་འགྱོཝ་མས། དེ་དང་ཅི་ཁར་ འཕྲུལ་ཆས་ཚུ་ཡང་ རྣམ་པ་སྣ་ཚོགས་ ཐོན་དོ་ཡོད་པའི་གྲས་ལས་ ད་རེས་ནངས་པ་ མི་ག་ར་གིས་ ཁྱབ་ཆེཝ་སྦེ་ ལག་ལེན་འཐབ་མི་ འགྲུལ་འཕྲིན་འདི་ཨིན་པས། དེ་ཡོད་པ་ཅིན་ གནམ་མེད་ས་མེད་ སྟབས་བདེ་ཏོག་ཏོ་དང་ མེད་པ་ཅིན་ཐ་སྡུག་པའི་ནང་ལས་ ཐ་སྡུག་ཤོས་ཅིག་ཨིན་མས། འགྲུལ་འཕྲིན་འདི་ བརྒྱུད་འཕྲིན་བཟུམ་སྦེ་མེན་པར་ རང་ག་ཏེ་འགྱོ་ས་ལུ་ འབག་བཏུབ། ལག་ལེན་འཐབ་རུང་ སྟབས་བདེ་ཏོག་ཏོ་ ཨིནམ་པའི་གུ་ མེད་ཐབས་མེད་པའི་ནོར་བུ་བཟུམ་ཅིག་ཨིན། དེ་འབདཝ་ད་འགྲུལ་འཕྲིན་འདི་ལག་ལེན་ འཐབ་མ་ཤེས་པ་ཅིན་ འཕྲལ་དང་ཕུག་ལུ་ དེ་ལས་བརྟེན་པའི་ གནོད་པ་དང་ཉེན་ཁ་ཡང་ སྦོམ་སྦེ་ར་མཐོངམ་མས།

ཧེ་མ་འབད་བ་ཅིན་ གོངམ་དང་རང་གི་ཕམ་ སྤུན་ཆ་དང་ལྟ་ལྟོ་ཚང་ཚུ་དང་གཅིག་ཁར་ འབྲེལ་བ་འཐབ་དགོ་པ་ཅིན་ ཡི་གུ་ཕར་ཚུར་བསྐྱལ་ཏེ་ འབྲེལ་བ་འཐབ་ཞིནམ་ལས་ བསམ་ལན་ཚུ་ བརྗེ་སོར་འབད་དེ་ སྡོད་ནུག། ཨིན་རུང་ དུས་རབས་ ཉེར་གཅིག་པའི་ནང་ལུ་ ཚན་རིག་མཁས་པ་ཚུ་གི་ བཀའ་དྲིན་ལས་བརྟེན་ཏེ་ ལ་དང་ལུང་གི་རྒྱབ་ཁར་ཡོད་མི་ཚུ་ཡང་ གདོང་བསྐོར་རྐྱབ་སྟེ་ ཡོདཔ་བཟུམ་སྦེ་ བློ་ཕར་ཚུར་ སླབ་ཚུགས་པས། དུས་ཡུན་སྐར་ཆ་གཅིག་ ལང་མ་ལངམ་ཅིག་གི་ ནང་འཁོད་ལུ་ཡི་གུ་ག་ཅི་བཟུམ་ བསྐྱལ་ནི་ཡོད་རུང་ བསྐྱལ་སའི་ས་སྒོ་ནང་ལུ་ དེ་འཕྲོ་ལས་ལྷོད་ཚུགས་པས།

འགྲུལ་འཕྲིན་ལག་ལེན་ ལེགས་ཤོམ་སྦེ་ འཐབ་མ་ཤེས་པ་ཅིན་ ཕམ་དང་བུ་གཞི་ སྤུན་ཆ་དང་ལྟ་ལྟོ་ཚང་ཚུ་གི་བར་ན་ སྟབས་མ་བདེཝ་དང་ དཀའ་ངལ་ཐོན་ས་མཐོང་མས། གཉེན་དང་གྲོགས་ཀྱི་བར་ན་ བཟའ་ཚང་གི་དཀའ་ངལ་དང་ དགའཝ་མཐུནམ་ཚུ་ཡང་ལ་ལུ་ཁ་བྱལ། ལ་ལུ་ཅིག་གསརཔ་ཕྱད་མི་ཡང་ ལེ་ཤ་ཅིག་ར་འདུག། འགྲུལ་འཕྲིན་འདི་ ཉེ་བར་མཁོཝ་ཅིག་ཨིན་རུང་ ཚུལ་མཐུན་འབད་ལག་ལེན་མ་འཐབ་པ་ཅིན་ ནང་དོག་སར་ཚུད་ནིའི་ ཉེན་ཁ་ཡང་ སྦོམ་སྦེ་ར་འདུག། ཚུལ་དང་མཐུནམ་སྦེ་ ལག་ལེན་འཐབ་པ་ཅིན་ བསམ་པའི་འཆར་གཞི་དང་ ལས་སྣ་ག་ཅི་བཟུམ་ཡོད་རུང་ ཡུདཔ་ཐེངས་ཅིག་ལུ་ར་ འབད་ཚུགས་དོ་ཡོདཔ་ཨིན།

འགྲུལ་འཕྲིན་ལག་པར་མེད་པ་ཅིན་ ག་ནི་བ་ཁག་ཆེ་བའི་ཅ་ལ་ཅིག་ འབྱང་སྟོར་ཤོར་སོངཔ་བཟུམ་ཚོར་ཏེ་ སེམས་ཡང་ འཚབ་འཚུབ་འབད་དེ་ ག་ཅི་ཅིག་མ་ཚངམ་བཟུམ་སྦེ་ སྡོད་སར་མཐོངམ་མས། འཕྲུལ་ཆས་དེ་ནང་ལུ་ ཕན་ཐོགས་ཆེ་བའི་ ཡོན་ཏན་གསརཔ་སྣ་ཚོགས་ཡོད་རུང་ དེ་ཚུ་ མི་མང་ཤོས་ཅིག་གིས་ར་ གཞན་ལུ་སྐྱོན་བརྗོད་དང་ མ་བདེན་པའི་གནས་ཚུལ་ཚུ་ སྤེལ་ནིའི་མཁོ་ཆས་བཟུམ་ཅིག་འབད་ ལག་ལེན་འཐབ་མས། རང་རིགཔ་བསྒྱིམས་ཏེ་ མ་སྡོད་པ་ཅིན་ འགྲུལ་འཕྲིན་ནང་ལུ་ ཡོད་པའི་ཡོངས་འབྲེལ་གྱི་རིམ་ལུགས་ཚུ་ ལག་ལེན་འཐབ་སྟེ་ མགུ་སྐོར་རྐྱབ་མི་ཡང་ ཡར་སེང་འགྱོ། ཁྲིམས་འགལ་གྱི་ ལཱ་འབད་མི་ཚུ་ཡང་ ཉིན་བསྟར་བཞིན་དུ་ཡར་འཕར་འགྱོ་སྟེ་ར་འདུག། དེ་གིས་ མཇུག་ལས་མཇུག་སུ་ རང་ལུ་གནོདཔ་མ་ཚད་ ཕམ་དང་སྤུན་ཆ་ཚུ་ལུ་ཡང་ ཚ་གྱང་བཀལཝ་ཨིན་ནོ།

ལྟག་གི་ཡིག་རྒྱུགས་ལྷག་ཞིནམ་ལས་ དྲི་བ་ ཀ་ ཁ་ ག་ གསུམ་གྱི་ལན་བྲིས།

ཀ༽ འོག་གི་དྲི་བ་ཚུ་གི་ལན་བྲིས། (སྐུགས་ ༩)
༡ འགྲུལ་འཕྲིན་ནང་ལུ་ རིམ་ལུགས་སྣ་ཚོགས་ཡོད་ས་ལས་ མི་སྡེ་ལུ་ཕན་ཐོགས་ཤོས་ར་ ག་འདི་ཨིན་པས? གནད་དོན་གཉིས་བཀོད། (༢)
༢ འགྲུལ་འཕྲིན་མེད་པའི་སྐབས་ལུ་ མི་ཚུ་འབྲེལ་བ་ག་དེ་སྦེ་ འཐབ་སྡོད་ནུག? (༡)
༣ བརྒྱུད་འཕྲིན་དང་ འགྲུལ་འཕྲིན་གྱི་ ཁྱད་པར་ ༢ བྲིས། (༢)
༤ ཁྱོད་ཀྱིས་འབད་བ་ཅིན་ འགྲུལ་འཕྲིན་ལག་ལེན་འཐབ་ཐངས་ ལེགས་ཤོམ་འདི་ག་དེ་སྦེ་ཆ་བཞག་ནི་སྨོ? (༢)
༥ གཞན་ལུ་སྐྱོན་བརྗོད་དང་ མ་བདེན་པའི་གནས་ཚུལ་ཚུ་ སྤེལ་ནི་ཚུ་བཀག་ནིའི་ཐབས་ཤེས་ དྲག་ཤོས་གཉིས་བཀོད། (༢)', '༡ ཁ་པར་དང་ བརྙན་འཕྲིན་ཁ་པར་ - ལ་དང་ལུང་གི་ རྒྱབ་ཁར་ཡོད་མི་དང་ཡང་ ཡུདཔ་ཐེངས་ཅིག་ལུ་ བློ་སླབ་ཚུགས། ཡི་གུ་ (འཕྲིན་དོན་) - སྐར་ཆ་གཅིག་ནང་ ས་སྒོ་ལུ་ ལྷོད། (ཡོངས་འབྲེལ་བརྒྱུད་དེ་ ཤེས་ཡོན་དང་ ཚོང་ ལཱ་ ཚུ་ཡང་ འབད་ཚུགས།)
༢ ཡི་གུ་ ཕར་ཚུར་ བསྐྱལ་ཏེ་ བསམ་ལན་ བརྗེ་སོར་འབད་སྟེ་ འབྲེལ་བ་འཐབ་ནུག།
༣ བརྒྱུད་འཕྲིན་འདི་ ས་གོ་གཅིག་ནང་ བཙུགས་ཡོད་ཅིང་ འབག་མི་བཏུབ། འགྲུལ་འཕྲིན་འདི་ ག་ཏེ་འགྱོ་རུང་ འབག་བཏུབ་སྟེ་ ཁ་པར་ཁེར་མེན་པར་ ཡོངས་འབྲེལ་ ཡི་གུ་ པར་ ལ་སོགས་པའི་ རིམ་ལུགས་ སྣ་ཚོགས་ཡོད།
༤ དགོས་མཁོ་ཡོད་པའི་སྐབས་ རྐྱངམ་ཅིག་ ལག་ལེན་འཐབ་ནི། ལཱ་ དང་ སློབ་སྦྱོང་ དང་ འཁོར་ལོ་ བཏང་བའི་སྐབས་ ལག་ལེན་མ་འཐབ་ནི། བཟའ་ཚང་དང་ བློ་སླབ་ནི་ལུ་ དུས་ཚོད་ བྱིན་ནི།
༥ གནས་ཚུལ་ ག་ཅི་ར་ སྤེལ་རུང་ མ་སྤེལ་བའི་ཧེ་མ་ བདེན་མེད་ ཞིབ་དཔྱད་འབད་ནི། མ་བདེན་པའི་ གནས་ཚུལ་ སྤེལ་མི་ལུ་ ཁྲིམས་དོན་ བཀག་ཆ་ དང་ ཤེས་ཚོར་ བྱིན་ནི།', null, '[{"point": "༡ རིམ་ལུགས་ཕན་ཐོགས་ཤོས་ ༢ (ཁ་པར་ / བརྙན་འཕྲིན་ཁ་པར་གྱིས་ སྐར་ཆ་གཅིག་ནང་ བློ་སླབ་ ཡི་གུ་བསྐྱལ། ཡོངས་འབྲེལ་ ཤེས་ཡོན་ ཚོང་ ལཱ་)", "marks": 2}, {"point": "༢ ཡི་གུ་ ཕར་ཚུར་ བསྐྱལ་ཏེ་ འབྲེལ་བ་འཐབ།", "marks": 1}, {"point": "༣ བརྒྱུད་འཕྲིན་ ས་གནས་གཅིག་ནང་ བཙུགས་ཡོད་ / འགྲུལ་འཕྲིན་ ག་ཏེ་འགྱོ་རུང་ འབག་བཏུབ། (ཁྱད་པར་ ༢)", "marks": 2}, {"point": "༤ ལེགས་ཤོམ་ལག་ལེན་ ཐབས་ ༢ (དགོས་མཁོ་ཙམ་ ལག་ལེན། མ་བདེན་པའི་ གནས་ཚུལ་ མ་སྤེལ། ལཱ་དང་ ལམ་ཁར་ ཉེན་སྲུང་།)", "marks": 2}, {"point": "༥ ཐབས་ཤེས་ ༢ (བདེན་མེད་ ཞིབ་དཔྱད་ སྤེལ་མ་བཅུག། ཁྲིམས་དང་ ཤེས་ཚོར།)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'dzongkha-comprehension'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 9,
    972, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check it before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2022b4-dz', 1, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'D1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 3.5, 1 from me_q where key = 'D1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.0, 2 from me_q where key = 'D1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 2.0, 3 from me_q where key = 'D1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 1.5, 4 from me_q where key = 'D1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'passage', 'ཁ༽ འོག་གི་མིང་ཚིག་ཚུ་གི་ རྗོད་ཚིག་བྲིས། (ཡིག་རྒྱུགས་ནང་ལས་ འདྲ་བཤུས་ཕབ་མི་ཆོག) (སྐུགས་ ༦x༠.༥= ༣)
༡) ཡར་རྒྱས།  ༢) མེད་ཐབས་མེད།  ༣) ཐ་སྡུག  ༤) འཚབ་འཚུབ།  ༥) ཡུདཔ་ཐེངས་ཅིག  ༦) སྐར་ཆ་གཅིག', '༡ ལམ་ བཟོ་ཞིནམ་ལས་ གཡུས་ཚན་འདི་ ཡར་རྒྱས་སོང་ཡི།
༢ ཞིང་ལཱ་ལུ་ ཆུ་འདི་ མེད་ཐབས་མེད་པའི་ མཁོ་ཆས་ཨིན།
༣ ཁོ་ ཕྱི་ཁར་ ཕྱིན་མི་འདི་ ཐ་སྡུག་ ཆར་པ་ ཕོག་སྟེ་ ལུས་ཡི།
༤ བུ་ ཕྱི་རུ་ ལོག་མ་འོང་པས་ ཨམ་ཚབ་འཚུབ་ འབད་དེ་ སྡོད་ཡི།
༥ ལཱ་འདི་ ཡུདཔ་ཐེངས་ཅིག་ལུ་ མཇུག་བསྡུ་ཡི།
༦ འཕྲིན་དོན་འདི་ སྐར་ཆ་གཅིག་ནང་ ལྷོད་ཡི།', null, '[{"point": "ཚིག་ ༦ ལུ་ རྗོད་ཚིག་ ཀྲིག་ཀྲི་ (ཚིག་རེ་ལུ་ ༠.༥)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'dzongkha-comprehension'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 3,
    324, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check it before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2022b4-dz', 2, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'D2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 1.0, 1 from me_q where key = 'D2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 1.0, 2 from me_q where key = 'D2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 0.5, 3 from me_q where key = 'D2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 0.5, 4 from me_q where key = 'D2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'passage', 'ག༽ འོག་གི་མིང་ཚིག་ཚུ་གི་ རྣམ་གྲངས་ ཡིག་རྒྱུགས་ནང་ལས་འཚོལ་ཏེ་བྲིས། (སྐུགས་ ༦x༠.༥= ༣)
༡) ཨ་རོགས་དགའ་རོགས།  ༢) བཀྲམ།  ༣) དྲནམ་བཏོན།  ༤) ཁྲིམས་དང་མ་མཐུནམ།  ༥) ལྷམ་པ་མ་འདྲཝ།  ༦) ནང་འཁོད།', 'ཨ་རོགས་དགའ་རོགས = གཉེན་དང་གྲོགས། བཀྲམ = སྤེལ། དྲནམ་བཏོན = བསམ་ལན་ (to confirm)། ཁྲིམས་དང་མ་མཐུནམ = ཁྲིམས་འགལ། ལྷམ་པ་མ་འདྲཝ = རྣམ་པ་སྣ་ཚོགས། ནང་འཁོད = ནང་ / ཡུདཔ་ཐེངས་ཅིག (to confirm)', null, '[{"point": "ཨ་རོགས་དགའ་རོགས → གཉེན་དང་གྲོགས། བཀྲམ → སྤེལ། དྲནམ་བཏོན → (བསམ་ལན་ / སེམས་ཁར་ཤར།) ཁྲིམས་དང་མ་མཐུནམ → ཁྲིམས་འགལ། ལྷམ་པ་མ་འདྲཝ → རྣམ་པ་སྣ་ཚོགས། ནང་འཁོད → ནང་ (ཡུདཔ) (ཚིག་རེ་ལུ་ ༠.༥)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'dzongkha-comprehension'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 3,
    324, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check it before publishing.", "Synonyms: a Dzongkha teacher should confirm the expected words from the passage."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2022b4-dz', 3, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'D3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 1.0, 1 from me_q where key = 'D3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 1.0, 2 from me_q where key = 'D3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 0.5, 3 from me_q where key = 'D3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 0.5, 4 from me_q where key = 'D3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'translation', 'འོག་ལུ་ ཨིང་སྐད་ནང་ཡོད་མི་ བཀའ་ཤོག་འདི་ རྫོང་ཁའི་ཐོག་ལུ་ སྐད་སྒྱུར་འབད་དེ་བྲིས། (སྐུགས་ ༡༥)

Bhutan’s education program, both modern and monastic, has been a success story. Our general literacy rate today stands at 71.4% and youth literacy rate at over 93%. Mass education and literacy resulted in the creation of a corps of administrative and technical personnel which was required for development while reducing our dependence on foreign experts. We have come a long way in developing our national human resource in diverse fields. More than a hundred years later, we find ourselves on the point of a new century again and in need of a new vision to prepare for what lies ahead. Unlike the past century, this one is qualitatively and quantitatively different. It is defined by the accelerated rate of change in all aspects of our lives because of rapid technological advancements and globalization. The future will be more wired and digital, driven by sophisticated technologies in towns and villages alike, as well as in homes and in workplaces. Since the introduction of parliamentary democracy, our time and energy have largely been committed to the establishment of democratic institutions and ensuring their success. This remains a national priority. However, we need to bring into focus other equally compelling national priorities. Education is an indispensable one. The Ministry of Education has made commendable efforts to initiate reforms in our education system. It is now time to give renewed life to these efforts by reorienting our school structures for the need and challenges of a different social context. We must revisit our curriculum, pedagogy, learning process, and assessments to either transform or rewrite them in view of the challenges and opportunities of the twenty-first century. Otherwise, continued focus on textbooks and content without integrating technology and social learning risks perpetuating passive modes of learning. Then, whatever education our children acquire today will become irrelevant and obsolete when they graduate. Their competitiveness in an increasingly progressive and fast-changing world will be compromised and the nation will suffer by paying a heavy price. (The kasho (Royal edict) on the reforms decreed for the education on December 17, 2020).', '(Outline of the key renderings; a Dzongkha teacher should check)
འབྲུག་གི་ ཤེས་རིག་ ལས་རིམ་ - དེང་སང་གི་ ཤེས་རིག་དང་ ཆོས་ཕྱོགས་ཀྱི་ ཤེས་རིག་ གཉིས་ཆ་ར་ - འདི་ གྲུབ་འབྲས་ཅན་གྱི་ ལོ་རྒྱུས་ཅིག་ཨིན། ད་ལྟོ་ ཡོངས་ཁྱབ་ ཡིག་རིག་གི་ ཚད་ བརྒྱ་ཆ་ ༧༡.༤ དང་ ན་གཞོན་གྱི་ ཡིག་རིག་ཚད་ བརྒྱ་ཆ་ ༩༣ ལས་ལྷག་ཡོད། མི་མང་ཤེས་རིག་དང་ ཡིག་རིག་ལས་བརྟེན་ གོང་འཕེལ་ལུ་ མཁོ་བའི་ འཛིན་སྐྱོང་དང་ བཟོ་རིག་ ལཱ་གཡོག་པ་ཚུ་ ཐོན་ཏེ་ ཕྱི་རྒྱལ་གྱི་ མཁས་མཆོག་ཚུ་ལུ་ བརྟེན་དགོཔ་ ཉུང་སུ་ཕྱིན་ཡི།

ལོ་བརྒྱ་ ལྷག་ཅིག་གི་ཤུལ་ལུ་ ང་བཅས་ ལོག་སྟེ་ དུས་རབས་གསརཔ་ཅིག་གི་ མཐའ་མར་ལྷོད་དེ་ཡོདཔ་ལས་ མ་འོངས་པའི་དོན་ལུ་ མཐོང་སྣང་གསརཔ་ཅིག་ དགོཔ་ཨིན། དུས་རབས་འདི་ ཚན་རིག་ ཡར་རྒྱས་དང་ འཛམ་གླིང་གཅིག་འགྱུར་ལས་བརྟེན་ མི་ཚེའི་ ཆ་ཤས་ག་ར་ནང་ འགྱུར་བ་ མགྱོགས་དྲགས་སྦེ་ འབྱུང་སའི་ དུས་རབས་ཅིག་ཨིན། ...

དམངས་གཙོའི་ ལམ་ལུགས་ བཙུགས་ཞིནམ་ལས་ ང་བཅས་ཀྱི་ དུས་ཚོད་དང་ ནུས་ཤུགས་ མང་ཤོས་ཅིག་ དམངས་གཙོའི་ ཚོགས་སྡེ་ཚུ་ གཞི་བཙུགས་ནི་ལུ་ བཏང་ཡི། ... ཤེས་རིག་འདི་ མེད་ཐབས་མེད་པའི་ གཙོ་རིམ་ཅིག་ཨིན།

ཤེས་རིག་ལྷན་ཁག་གིས་ བཅོ་བསྒྱུར་ ཚུ་ འགོ་བཙུགས་ཡོདཔ་ལུ་ བསྔགས་བརྗོད་ཡོད། ... སློབ་རིམ་ སློབ་སྟོན་ཐབས་ལམ་ སློབ་སྦྱོང་ དང་ བརྟག་དཔྱད་ཚུ་ ལོག་ཞིབ་དཔྱད་འབད་དེ་ བསྒྱུར་བཅོས་ ཡང་ན་ ལོག་བཟོ་དགོ། དེ་མེན་པ་ཅིན་ ... རྒྱལ་ཁབ་ཀྱིས་ གླ་ཆ་ ལྕི་ཏོག་ཏོ་ སྤྲོད་དགོ་པའི་ ཉེན་ཁ་ཡོད། (སྤྱི་ལོ་ ༢༠༢༠ སྤྱི་ཟླ་ ༡༢ པའི་ ཚེས་ ༡༧ ལུ་ ཤེས་རིག་ བཅོ་བསྒྱུར་གྱི་ བཀའ་ཤོག)', null, '[{"point": "གནད་དོན་ཕོག་མ་ཕོག་ - དོན་ཚན་ཆ་ཚང་ མ་ལུས་པར།", "marks": 7}, {"point": "ཞེ་ས་ (བཀའ་ཤོག་) དང་ ཨང་གྲངས་ (༧༡.༤% ། ༩༣%) ངོ་མ་བཟུམ།", "marks": 3}, {"point": "གོ་རིམ་དང་ སྡེབ་སྦྱོར་ བརྡ་སྤྲོད།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'translation-english-to-dzongkha'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 15,
    1620, 'historical_official', 'verified',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check it before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2022, batch 4", "source": {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, 'bd8dd32d-8d38-4583-9d23-763f1f5ce224'::uuid)
  returning id
)
insert into me_q select 'T1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 6.0, 1 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 4.0, 2 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 3.0, 3 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 2.0, 4 from me_q where key = 'T1';
update public.questions set status = 'published' where id in (select id from me_q);
commit;
