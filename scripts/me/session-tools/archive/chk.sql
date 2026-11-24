-- ME Paper I (Technical): BCSE 2025 + similar, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'case-study', 'Case study' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'dzongkha-comprehension', 'Dzongkha comprehension' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'general-knowledge', 'General knowledge' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'topical-issues-economy', 'Topical issues: economy' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'topical-issues-employment', 'Topical issues: employment' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'topical-issues-energy', 'Topical issues: energy' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'translation-english-to-dzongkha', 'Translation: English to Dzongkha' on conflict (subject_id, slug) do nothing;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-1');
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-1'), 1, 'Section I: Case study', 'analytical', 1, 30, null, 'BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)');
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-1'), 2, 'Section II: Topical discussion', 'long_answer', 3, 10, 2, 'BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)');
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-1'), 3, 'Section III: General knowledge', 'mcq', 20, 1, null, 'BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)');
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-1'), 4, 'Section IV: Dzongkha comprehension (གོ་བ་ལེན་ནི།)', 'passage', 1, 20, null, 'BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)');
insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-1'), 5, 'Section V: Translation (སྐད་སྒྱུར།)', 'translation', 1, 15, null, 'BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'Read the following passage and answer ALL THREE questions.

The Threat of NCDs - Case Study

In our current society, a sense of complacency and invincibility where people think they have time or that their body can take a few more years or a decade more of unhealthy living, is costing us dearly. People should first come to know with this reality. The traditional Bhutanese diet removed from its physically active rural living style, is an NCD diet.

The popular ema datshi is high in butter and fat, and worse, it can take dollops of salt and taste even better for it. Our shakham and sikam are not only bad for our stomach but also our cholesterol levels. Traditional Bhutanese diet has very little vegetables incorporated in it, except for chillies and some dried greens.

If the above is not bad enough, we all eat extra quantities of rice even three times a day, and while it tastes good, rice is the most inferior of all the grains. Rice is also a sugar delivery mechanism to the body explaining how even Bhutanese without sweet tooth get diabetes. The high proportion of red meat diet in Bhutanese cuisine may also explain our high cancer rates.

The habit of chewing doma kills taste cells in the tongue and it increases the propensity for salt intake which contributes in a major way to kidney related issues. Add to this, the increasing consumption of junk food and fizzy drinks is also a catalyst to NCD.

As more and more Bhutanese moves to urban areas, there is less space and time to exercise, and people are confined to their apartments. Childrens of Thimphu may be among the unhealthiest in the country with no space to play and move, which also contributes to a drug abusive culture.

We may not have realized it yet, but we are in the middle of an NCD epidemic and it is only getting worse. Given our limited population and human resources, it is important to take care of the people we have. It is high time that a much more comprehensive approach be taken in dealing with NCDs, not just with screenings, but also with more awareness and better policy measures on the ground.

"Take care of your body, it''s the only place you have to live." - Jim Rohn

Question 1
In what ways has urbanization contributed to the rise of non-communicable diseases (NCDs) in Bhutan? Identify two ways and elaborate how these challenges can be addressed. (10 marks)', 'Urbanization has contributed to NCDs in at least two ways.

First, it has reduced physical activity. As more Bhutanese move to towns, there is less space and time to exercise and people are confined to their apartments. Children in Thimphu have little space to play and move, so they become inactive from a young age. A traditional diet rich in butter, fat and rice was suited to hard physical work in villages; eaten by people who sit at desks all day, it becomes an "NCD diet".

Second, urban life has changed what we eat. Junk food and fizzy drinks are easily available in towns and are increasingly consumed, adding sugar, salt and fat to an already heavy diet.

These challenges can be addressed. Town planners should set aside parks, playgrounds, walking and cycling paths and open-air gyms in every neighbourhood, and offices and schools can make daily physical activity part of their routine. At the same time, the sale of junk food and fizzy drinks near schools can be restricted, healthier food labelling encouraged, and families taught to prepare traditional dishes with less butter, salt and rice and more vegetables.', null, '[{"point": "Way 1 with explanation from the passage: less space and time to exercise; people confined to apartments", "marks": 3}, {"point": "Way 2 with explanation: urban diet - junk food and fizzy drinks, traditional heavy diet without rural physical work; children with no place to play", "marks": 3}, {"point": "Practical solutions for each (parks, playgrounds and walking paths in town planning; workplace and school physical activity; healthy food rules near schools)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'case-study'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2025b1-cs', 1, null)
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
Discuss how traditional Bhutanese dietary habits, when removed from their original rural context, pose a threat to modern health. Mention and explain two culturally sensitive alternatives that can be promoted to encourage healthier eating patterns. (10 marks)', 'In the past, Bhutanese families ate butter-rich ema datshi, dried meat, large portions of rice and salty dishes, but they also walked long distances and worked in the fields all day, so they burned what they ate. In towns today, the same diet is eaten by people who sit in offices and cars. As the passage explains, ema datshi is high in butter, fat and salt; shakam and sikam raise cholesterol; we eat large quantities of white rice three times a day, which acts as a sugar delivery mechanism and leads to diabetes; red meat is linked to cancer; and doma chewing kills taste cells, so people add more salt, which harms the kidneys. With few vegetables, this diet now causes high blood pressure, diabetes, heart, kidney disease and cancer.

Two culturally sensitive alternatives can be promoted. First, keep our favourite dishes but cook them in a healthier way: ema datshi with less butter and salt and more vegetables such as beans, mushrooms and spinach. Second, return to our own healthier grains and greens: red rice, buckwheat and millet in smaller portions, together with local vegetables and fruit grown in our kitchen gardens. Because these choices remain truly Bhutanese, families are more likely to accept them than foreign diet plans.', null, '[{"point": "Threat explained with evidence: diet was suited to physically active rural life; now high butter, fat and salt (ema datshi), shakam/sikam, large rice portions, red meat, few vegetables, doma", "marks": 5}, {"point": "Two culturally sensitive alternatives explained (e.g. red rice/buckwheat/millet in smaller portions; ema datshi with less butter and salt and more vegetables; local vegetables and fruit; less doma)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'case-study'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2025b1-cs', 2, null)
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
"Given our limited population and human resources, it is important to take care of the people we have. It is high time that a much more comprehensive approach be taken in dealing with NCDs, not just with screenings, but also more awareness and policy measures on the ground."

With reference to the above excerpt, mention to what extent the government should intervene in regulating traditional diets, junk food and lifestyle habits to curb the NCD epidemic, or should it be left to individuals'' responsibility and awareness? Justify and explain with two reasons. (10 marks)', 'In my view, the government should intervene firmly where the market and environment are concerned, but leave personal food choices to well-informed individuals.

First, as the excerpt says, Bhutan has a small population and limited human resources, so every life lost or disabled by NCDs is a serious loss to the nation, and treatment of diabetes, kidney failure and cancer is very expensive for our free health system. The government is therefore justified in regulating junk food and fizzy drinks through higher taxes, clear labels on salt and sugar, and bans on selling them in and near schools, and in providing parks and sports facilities.

Second, traditional diets and lifestyle habits are part of our culture and daily life, and cannot be regulated in every kitchen. Here the best tool is awareness, not force: regular screening, health education in schools, campaigns on reducing butter, salt, rice and doma, and support from community leaders. When people understand the risks, they change more willingly and permanently.

So the government should regulate what is sold and create a healthy environment, while individuals take responsibility for their own eating and exercise.', null, '[{"point": "Clear stand (e.g. a balance: the government regulates the environment, individuals choose; or either side argued well)", "marks": 2}, {"point": "Reason 1 explained with reference to the excerpt (e.g. small population and human resources: NCDs cost the nation, so prevention is the state''s duty - taxes on junk food and sugary drinks, labelling, rules in schools)", "marks": 4}, {"point": "Reason 2 explained (e.g. traditional diet cannot be banned and needs awareness and personal choice; the state should educate and create conditions, not police kitchens)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'case-study'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2025b1-cs', 3, null)
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
  values ('ME', 'long_answer', 'Does the recent tax revision of imposing income tax on interest earned from fixed deposits while simultaneously lowering taxes on the import of vehicles reflect a fair and progressive fiscal policy, or does it risk burdening low and middle-income savers while encouraging consumption and increasing the country''s trade deficit? Give reasons to support your answer and include relevant examples. (10 marks)', 'In my view, the combination risks being unfair to ordinary savers and harmful to the economy, unless it is carefully adjusted.

Fixed deposits are the main way for low and middle-income families, civil servants and pensioners to save, because they are safe and simple. Taxing their interest lowers the small return they earn and discourages saving, while wealthier people can move money into other investments. This makes the tax regressive in effect.

At the same time, lowering taxes on imported vehicles encourages people to spend rather than save. Almost all vehicles and fuel are imported, mostly from India, so more vehicle purchases mean more outflow of rupees, a wider trade deficit and pressure on foreign currency reserves, as well as more traffic and pollution in Thimphu.

The policy could be made fairer by exempting interest on small deposits up to a threshold, and by limiting vehicle tax cuts to electric vehicles, which use our own hydropower. Then the revision would support both savers and sustainable growth.', null, '[{"point": "Clear stand", "marks": 2}, {"point": "Effect on savers explained (fixed deposits are the main saving tool of low/middle-income families and retirees; tax lowers returns, discourages saving)", "marks": 3}, {"point": "Effect on consumption and trade deficit explained (cheaper imported vehicles, fuel imports, rupee outflow, congestion)", "marks": 3}, {"point": "Balance or suggestions with examples (e.g. tax-free threshold for small deposits; target vehicle tax cuts to electric vehicles)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'topical-issues-economy'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
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
  values ('ME', 'long_answer', 'Given the rising concerns surrounding youth unemployment in Bhutan, recommend any three targeted policy interventions or collaborative initiatives between the government, private sector, and educational institutions that would be most effective in creating sustainable employment opportunities for young people. (10 marks)', 'Three interventions could create lasting jobs for young Bhutanese.

First, education should match the needs of the economy. Colleges and technical institutes should design courses together with employers, and every student should complete an internship or apprenticeship in a real workplace before graduating, so that graduates have practical skills employers want.

Second, young people should be helped to create their own jobs. The government can offer low-interest start-up loans and simplified licensing, while private companies and banks provide mentoring and incubation centres where young entrepreneurs in agriculture, IT, tourism and crafts can test their ideas.

Third, the government can give private firms incentives, such as wage subsidies or tax relief for a year, for hiring young people, and prepare youth for jobs in growing sectors such as Gelephu Mindfulness City, hydropower, construction and digital services.

Working together, these partners can turn young people from job seekers into skilled workers and job creators.', null, '[{"point": "Intervention 1 explained (e.g. curriculum and TVET aligned with industry needs, apprenticeships and internships)", "marks": 3}, {"point": "Intervention 2 explained (e.g. support for youth enterprise: start-up loans, incubation, mentoring by private sector)", "marks": 3}, {"point": "Intervention 3 explained (e.g. wage subsidies or incentives for private firms that hire youth; jobs in GMC, agriculture, IT)", "marks": 3}, {"point": "Collaboration among government, private sector and institutions shown", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'topical-issues-employment'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
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
  values ('ME', 'long_answer', 'Considering the economic costs, land-use requirements, and technological needs, do you agree or disagree that investing in solar power is a more sustainable long-term solution for Bhutan''s energy security compared to continuing expansion in hydropower? Justify and explain with three reasons. (10 marks)', 'I believe solar power should complement, not replace, hydropower, so I partly disagree that it is a more sustainable long-term solution on its own.

First, on economic costs, large hydropower projects need huge loans and often face cost overruns and delays, as Punatsangchhu shows. Solar plants are cheaper per project and quicker to build, like the 17.38 MW Sephu solar plant, but each produces far less electricity, so solar alone cannot earn the export revenue that hydropower provides.

Second, on land use, Bhutan is mountainous and must keep at least 60 percent forest cover. Solar farms need large areas of flat, sunny land, which is scarce and valuable for farming, whereas hydropower produces much more energy from the same area, although reservoirs and tunnels also affect land and rivers.

Third, on technology, hydropower is proven and supplies power day and night, but its output falls in winter when rivers are low, and climate change threatens glacier-fed rivers. Solar produces most in the sunny dry winter, filling that gap, but needs battery storage and imported panels.

Therefore, the most sustainable path is to diversify: continue well-planned hydropower while expanding solar to secure supply in winter.', null, '[{"point": "Clear stand (agree, disagree or a reasoned mix)", "marks": 1}, {"point": "Reason 1: economic costs compared (hydropower: large investment, debt, cost overruns; solar: falling costs, quicker to build; but lower output)", "marks": 3}, {"point": "Reason 2: land use (solar needs large flat land, scarce in Bhutan; hydropower floods valleys but less land per unit)", "marks": 3}, {"point": "Reason 3: technology and reliability (hydro is proven, but winter flow falls and climate change threatens glaciers; solar needs storage and imported panels)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'topical-issues-energy'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
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
  values ('ME', 'mcq', 'In which year did Bhutan compete in the Summer Olympics for the first time?', null, 'Bhutan first took part in the 1984 Los Angeles Olympics, in archery.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1972', false, 1), ('B', '2000', false, 2), ('C', '1984', true, 3), ('D', '1992', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Bhutan is NOT a member of which international organization?', null, 'Bhutan is a member of BIMSTEC, SAARC and the UN, but not of ASEAN.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'BIMSTEC', false, 1), ('B', 'ASEAN', true, 2), ('C', 'SAARC', false, 3), ('D', 'UN', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Bhutan''s tourism fee per day (Sustainable Development Fee) is currently', null, 'The SDF was reduced from USD 200 to USD 100 per night in 2023.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '$200', false, 1), ('B', '$50', false, 2), ('C', '$100', true, 3), ('D', '$150', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The Berlin Wall fell in', null, 'The Berlin Wall fell on 9 November 1989.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1989', true, 1), ('B', '1987', false, 2), ('C', '1990', false, 3), ('D', '1991', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which empire built the Colosseum in Rome?', null, 'The Colosseum was built by the Roman Empire (completed in AD 80).', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Greek', false, 1), ('B', 'Byzantine', false, 2), ('C', 'Ottoman', false, 3), ('D', 'Roman', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which country has the most time zones?', null, 'France has 12 time zones because of its overseas territories.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'France', true, 1), ('B', 'China', false, 2), ('C', 'United States', false, 3), ('D', 'Russia', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The river Nile flows into which sea?', null, 'The Nile flows north into the Mediterranean Sea.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Arabian Sea', false, 1), ('B', 'Red Sea', false, 2), ('C', 'Mediterranean Sea', true, 3), ('D', 'Black Sea', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which country is known as the Land of the Rising Sun?', null, 'Japan (Nihon) means ''origin of the sun''.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'South Korea', false, 1), ('B', 'Japan', true, 2), ('C', 'Thailand', false, 3), ('D', 'China', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The Great Barrier Reef is located off the coast of', null, 'The Great Barrier Reef lies off Queensland, Australia.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Indonesia', false, 1), ('B', 'New Zealand', false, 2), ('C', 'India', false, 3), ('D', 'Australia', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'What is the capital of Canada?', null, 'Ottawa is the capital of Canada.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Montreal', false, 1), ('B', 'Ottawa', true, 2), ('C', 'Vancouver', false, 3), ('D', 'Toronto', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which continent has the highest number of countries?', null, 'Africa has 54 countries.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'South America', false, 1), ('B', 'Europe', false, 2), ('C', 'Asia', false, 3), ('D', 'Africa', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The 2026 FIFA World Cup will be jointly hosted by', null, 'The 2026 World Cup is hosted by the USA, Canada and Mexico.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'USA, Canada, Mexico', true, 1), ('B', 'Mexico, Argentina, Brazil', false, 2), ('C', 'USA, UK, Canada', false, 3), ('D', 'USA, Spain, Portugal', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The headquarters of the World Bank is in', null, 'The World Bank is headquartered in Washington D.C.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Washington D.C.', true, 1), ('B', 'New York', false, 2), ('C', 'Brussels', false, 3), ('D', 'Geneva', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'NATO was established in', null, 'NATO was founded in April 1949.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1955', false, 1), ('B', '1949', true, 2), ('C', '1960', false, 3), ('D', '1945', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which agency supports maternal and reproductive health in Bhutan?', null, 'UNFPA, the UN Population Fund, works on maternal and reproductive health.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'UNFPA', true, 1), ('B', 'UNICEF', false, 2), ('C', 'UN Women', false, 3), ('D', 'WHO', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'What colours make up the Olympic rings?', null, 'The five rings are blue, yellow, black, green and red.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Red, White, Green, Blue, Black', false, 1), ('B', 'Red, Orange, Yellow, Green, Blue', false, 2), ('C', 'Blue, White, Red, Yellow, Black', false, 3), ('D', 'Red, Blue, Green, Yellow, Black', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which Formula 1 driver holds the record for most Grand Prix wins?', null, 'Lewis Hamilton holds the record with more than 100 Grand Prix wins.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Michael Schumacher', false, 1), ('B', 'Sebastian Vettel', false, 2), ('C', 'Max Verstappen', false, 3), ('D', 'Lewis Hamilton', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'passage', '༉ ལས་རྒྱུ་འབྲས་ཟེར་མི་འདི་ རྒྱུ་ལཱ་དགེ་བ་དང་ མི་དགེ་བ་འབད་དེ་ དེའི་འབྲས་བུ་བདེ་བ་དང་ སྡུག་བསྔལ་ མྱོང་མི་ལུ་ སླབ་ཨིན།དཔེ་འབད་བ་ཅིན་ ས་ཁ་ལུ་ སོན་ག་ཅི་བཏབ་ཅིག་ ལྕུག་གུ་འདི་ཡང་ སོན་དང་འཁྲིལ་སྐྱེཝ་ཨིན། དེ་བཟུམ་ ལས་དགེ་བ་འབད་བ་ཅིན་ དེའི་འབྲས་བུ་ བདེ་བ་འོང་ནི་དང་ ལས་མི་དགེ་བ་འབད་བ་ཅིན་ དེའི་ འབྲས་བུ་ སྡུག་བསྔལ་འོང་ནི། ལས་དཀར་ནག་ ཟུང་འབྲེལ་འབད་བ་ཅིན་ དེའི་འབྲས་བུ་ཡང་ བདེ་སྡུག་ གཉིས་ཆ་ར་ འོང་ནི་དེ་ བསླུ་བ་མི་སྲིད། འདི་ཡང་ ལས་འབྲས་བསླུ་བ་མེད་པ་ནི།། ཐམས་ཅད་མཁྱེན་པའི་ཁྱད་ཆོས་ཡིན།། ཟེར་ གསུང་དོ་བཟུམ་དང་། ལས་བརྒྱ་པ་ལས། ལུས་ཅན་དག་གི་ལས་རྣམས་ནི།།བསྐལ་པ་བརྒྱར་ཡང་ཆུད་མི་ཟ།། ཚོགས་ཤིང་དུས་ལ་བབས་པ་ན།། འབྲས་བུ་ཉིད་དུ་སྨིན་པར་འགྱུར།། ཟེར་དོ་བཟུམ་ ལས་བསགས་པའི་ འབྲས་བུ་འདི་ ལས་གསག་མི་ལུ་ དུས་ཚོད་ག་དེམ་ཅིག་ ཡུན་རིང་སོང་རུང་ ཆུད་མི་ཟ་བར་སྨིན་ནི་ཨིན།

གཞན་ཡང་། ས་བླ་མཐོན་པོར་གཤེགས་པའི་མཁའ་ལྡིང་གི། གྲིབ་མ་རེ་ཞིག་བལྟ་བར་མི་མངོན་ཡང་།། ལས་ཅན་དག་དང་འདུ་འབྲས་སྤངས་པ་བཞིན།། ཚོགས་ཤིང་དུས་ལ་འབབ་ཚེ་ལྷག་པར་མངོན།། ཟེར་གསུང་དོ་བཟུམ་ དཔེ་འབད་བ་ཅིན་ བྱ་ནམ་མཁའ་ལུ་འཕུར་མི་འདི་ ནམ་མཁའི་དབྱིངས་མཐོན་པོ་ལུ་ལྷོད་པའི་ཚེ་ བྱ་དེའི་གྱིབ་མ་ ཚར་གཅིག་མ་མཐོང་རུང་ གྱིབ་མ་མེདཔ་མེན་པར། མཇུག་ལུ་བྱ་དེ་ག་ཏེ་ར་འབབ་རུང་ གྱིབ་མ་འདི་ནག་ཧྲིལ་འབད་འོང་དོ་བཟུམ། དགེ་སྡིག་གི་ ལས་གསག་མི་ལུ་འབྲས་བུ་ འདི་འཕྱོ་ ལས་ ཉམས་སུ་མ་མྱོང་རུང་ མཇུག་ལུ་ལས་ཀྱི་འབྲས་བུ་འདི་ ལས་གསག་མི་རང་གིས་ར་ མྱོང་དགོཔ་འདི་ ཐད་རི་བ་རི་ཨིན།

ང་བཅས་འགྲོ་བ་གེ་ར་ བདེ་བ་མ་གཏོགས་ སྡུག་བསྔལ་མྱོང་དགོ་མནོ་མི་ ག་ཡང་མེདཔ་ལས། ད་རེས་ རྟེན་དལ་འབྱོར་མི་ལུས་རིན་པོ་ཆེ་ གྲུ་ཆེན་དང་འདྲཝ་འདི་ཐོབ། བདེ་བའི་རྒྱུ་དང་སྡུག་བསྔལ་གྱི་རྒྱུ་ ག་ཅི་འགྲུབ་ནི་ཨིན་ན? རྟ་ཁ་སྲབ་ཀྱིས་སྒྱུར་དོ་བཟུམ་མའི་རང་དབང་འཐོབ་ད། ལས་རྒྱུ་འབྲས་ལུ་ རྩིས་བཞག་སོམ་བསྐྱེད་དེ་ སྡིག་པ་དང་དགེ་བ་ ཆུང་ཀུ་ཅིག་ཨིན་རུང་ སྤང་བླང་འབད་དགོཔ་འདི་ གནམ་མེད་ས་མེད་གལ་ཆེ་དྲགས་ཅིག་ཨིན།

སྡིག་པ་ཆུང་ཀུ་ཅིག་གིས་ གནོད་མི་ཚུགས། ཟེར་ འབད་ནི་དང་ དགེ་བ་ཆུང་ཀུ་ཅིག་གིས་ རང་ལུ་ཕན་མི་ཐོགས་མནོ་ མ་འབད་བར་བཀོ་བཞག་ནི་འདི་ འཛོལ་བ་ཨིན་མི་འདི་ཡང་། མདོ་མཛངས་བླུན་ལས། སྡིག་པ་ཆུང་ངུ་དག་ལ་ཡང་།། མི་གནོད་སྙམ་དུ་བརྙས་མི་བྱ།།མེ་མདག་ཆུང་ངུ་དག་གིས་ཀྱང་།། རྩ་ཕུང་རི་ཙམ་བསྲེག་པར་བྱེད།། ཟེར་གསུང་དོ་བཟུམ་ སྡིག་པ་ཆུང་ཀུ་ཅིག་གིས་ མི་གནོད་ཟེར་འབད་ནི་མེན་པར་ སྤང་དགོ། དགེ་བ་འདི་ཡང་། དགེ་བ་ཆུང་ངུ་དག་ལ་ཡང་།། མི་ཕན་སྙམ་དུ་བསྙས་མི་བྱ།། ཆུ་ཡི་ཐིགས་པ་བསགས་པ་ཡིས།། སོད་ཆེན་རིམ་གྱིས་གང་བར་འགྱུར།། ཟེར་གསུང་དོ་བཟུམ་ དགེ་བ་ཆུང་ཀུ་ཅིག་ཨིན་རུང་ མ་བཞག་པར་བསྒྲུབ་དགོཔ་འདི་ ག་ནི་ལས་ཡང་གལ་ཆེ། དེ་འབདཝ་ལས་ ང་བཅས་ག་ར་ ཚེ་འདི་ཕྱི་གཉིས་ལུ་ འབྲས་བུ་འདོད་པའི་ སྡུག་བསྔལ་དང་བྲལ་ཏེ་ བདེ་བ་དང་ ལྡནམ་འབད་ སོད་ཚུགས་ནི་གི་དོན་ལུ་ རྒྱུ་སྡིག་པ་སྤངས་ཏེ་ དགེ་བ་བསྒྲུབ་ནི་ལུ་བརྩོན་སྦེ་ ལས་རྒྱུ་འབྲས་བརྩིས་ཏེ་ འབད་བ་ཅིན་ རང་དང་གཞན་གཉིས་ཀའི་ བྱ་བ་ལམ་འགྲོ་ལེགས་ཤོམ་འགྱོ་བ་ལུ་ ཐེ་ཚོམ་མེདཔ་ཨིན་ནོ། །

ལྟག་གི་ཡིག་རྒྱུགས་ལྷག་ཞིནམ་ལས་ དྲི་བ་ ཀ་ ཁ་ ག་ ང་ བཞི་གི་ལན་བྲིས།

དྲི་བ་ ཀ། ལན་ཐུང་ཀུ། འོག་གི་དྲི་བ་ག་ར་གི་ ལན་བྲིས། (སྐུགས་ ༤x༢=༨)
༡ ལས་རྒྱུ་འབྲས་འདི་ལུ་ ཁྱོད་ཀྱིས་ཡིད་ཆེ་བསྐྱེད་ཚུགས་པས་ག? ཁུངས་བཀལ།
༢ ལས་བརྒྱ་པ་ལས། ལུས་ཅན་དག་གི་ལས་རྣམས་ནི།། བསྐལ་པ་བརྒྱར་ཡང་ཆུད་མི་ཟ།། ཚོགས་ཤིང་དུས་ལ་བབས་པ་ན།། འབྲས་བུ་ཉིད་དུ་སྨིན་པར་འགྱུར།། ཟེར་བའི་ལུང་དྲང་གི་དོན་དག་བྲིས།
༣ ད་རེས་ རྟེན་དལ་འབྱོར་མི་ལུས་རིན་པོ་ཆེ་ གྲུ་ཆེན་དང་འདྲཝ་འདི་ཐོབ། ཟེར་བའི་སྐབས་ མི་ལུས་རིན་པོ་ཆེ་འདི་ དཔེ་གྲུ་ཆེན་ལུ་བཞག་དགོ་པའི་ཁུངས་ག་ཅི་སྨོ?
༤ ལས་རྒྱུ་འབྲས་ལུ་བརྩི་མཐོང་བསྐྱེད་དེ་ སྡིག་པ་སྤང་ནི་དང་ དགེ་བ་བསྒྲུབ་ནི་ལུ་ ག་དེ་སྦེ་ར་བརྩོན་ནི་སྨོ?', '༡ ཡིད་ཆེས་ བསྐྱེད་ཚུགས། ས་ཁ་ལུ་ སོན་ ག་ཅི་བཏབ་རུང་ ལྕུག་གུ་ཡང་ སོན་དང་འཁྲིལ་ སྐྱེཝ་བཟུམ་ དགེ་བ་འབད་བ་ཅིན་ བདེ་བ་དང་ མི་དགེ་བ་འབད་བ་ཅིན་ སྡུག་བསྔལ་ འོང་ནི་ ངེས་པར་ཨིན།
༢ ལུས་ཅན་ སེམས་ཅན་ཚུ་གིས་ བསགས་པའི་ ལས་ཚུ་ བསྐལ་པ་བརྒྱ་ སོང་རུང་ ཆུད་མི་ཟ། རྐྱེན་ཚོགས་ཏེ་ དུས་ལ་བབས་པའི་ཚེ་ འབྲས་བུ་ ངེས་པར་དུ་ སྨིན།
༣ གྲུ་ཆེན་གྱི་ རོགས་ཀྱིས་ ཆུ་བོ་ཆེན་པོ་ལས་ བརྒལ་ཚུགས་དོ་བཟུམ་ དལ་འབྱོར་གྱི་ མི་ལུས་འདི་གི་ རོགས་ཀྱིས་ འཁོར་བའི་ རྒྱ་མཚོ་ལས་ བརྒལ་ཏེ་ ཐར་པ་ ཐོབ་ཚུགསཔ་ལས་ དཔེ་ གྲུ་ཆེན་ལུ་ བཞག་ཨིན།
༤ སྡིག་པ་ ཆུང་ཀུ་ཅིག་ཨིན་རུང་ མེ་མདག་ཆུང་ཀུ་གིས་ རྩ་ཕུང་ བསྲེག་དོ་བཟུམ་ གནོད་ཚུགསཔ་ལས་ སྤང་། དགེ་བ་ ཆུང་ཀུ་ཡང་ ཆུ་ཐིགས་ བསགས་ཏེ་ སྣོད་ཆེན་ གང་དོ་བཟུམ་ མ་བཞག་པར་ བསྒྲུབ། ཉིན་བསར་ ལས་རྒྱུ་འབྲས་ བརྩི་སྟེ་ ཀུན་སྤྱོད་ བཟང་པོ་ བཞག།', null, '[{"point": "༡ ཡིད་ཆེས་ བསྐྱེད་ཚུགས་ (སོན་དང་ ལྕུག་གུའི་ དཔེ་ ཡང་ན་ ལུང་) ཁུངས་དང་བཅས།", "marks": 2}, {"point": "༢ ལས་བསགས་པའི་ འབྲས་བུ་ བསྐལ་པ་བརྒྱ་ སོང་རུང་ མ་ཆུད་ཟ་བར་ རྐྱེན་ཚོགས་ཏེ་ དུས་ལ་བབས་པའི་ཚེ་ ངེས་པར་དུ་ སྨིན།", "marks": 2}, {"point": "༣ གྲུ་ཆེན་གྱིས་ ཆུ་བོ་ལས་ བརྒལ་བ་བཟུམ་ མི་ལུས་འདི་གིས་ འཁོར་བའི་ རྒྱ་མཚོ་ལས་ བརྒལ་ཏེ་ ཐར་པ་ཐོབ་ནིའི་ རྟེན་ཨིན།", "marks": 2}, {"point": "༤ སྡིག་པ་ ཆུང་ཀུ་ཡང་ སྤང་ (མེ་མདག་གི་ དཔེ།) དགེ་བ་ ཆུང་ཀུ་ཡང་ བསྒྲུབ་ (ཆུ་ཐིགས་ཀྱི་ དཔེ།) ཉིན་བསར་ ལག་ལེན།", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'dzongkha-comprehension'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check it before publishing.", "Real RCSC Dzongkha text from a PDF whose font adds stray letters; cleaned automatically: compare with the PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2025b1-dz', 1, null)
  returning id
)
insert into me_q select 'D1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 3.5, 1 from me_q where key = 'D1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.0, 2 from me_q where key = 'D1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 1.5, 3 from me_q where key = 'D1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 1.0, 4 from me_q where key = 'D1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'passage', 'དྲི་བ་ ཁ། ལན་གདམ་ཁ་ཅན། འོག་གི་དྲི་བ་རེ་ལུ་ ལན་ ཀ་ཁ་ག་ང་ ཡོད་ས་ལས་ ལན་ངོ་མ་འདི་གདམ་ཁ་རྐྱབ་སྟེ་ ཀ་རྟགས་དང་སྦྲགས་ཏེ་ བྲིས། (སྐུགས་ ༤x༡=༤)
༡ ལས་འབྲས་བསླུ་བ་མེད་པ་ནི།། ཐམས་ཅད་མཁྱེན་པའི་ཁྱད་ཆོས་ཡིན།། ཟེར་བའི་ལུང་དྲང་གི་ བཅུད་དོན་འདི་ ...
ཀ) ལས་རྒྱུ་འབྲས་འདི་མ་པ་ལས་མེད་ཟེར་ཨིན་པས།  ཁ) ལས་རྒྱུ་འབྲས་འདི་ངེས་པར་དུ་ཡོད་ཟེར་བའི་དོན་ཨིན་པས།  ག) ལས་རྒྱུ་འབྲས་འདི་སངས་རྒྱས་དང་ཁྱད་པར་མེད་ཟེར་ཨིན་པས།  ང) ལས་རྒྱུ་འབྲས་འདི་སངས་རྒྱས་ལུ་རྐྱངམ་གཅིག་ཡོད་ཟེར་ཨིན་པས།
༢ ཚོགས་ཤིང་དུས་ལ་བབས་པ་ན། ། འབྲས་བུ་ཉིད་དུ་སྨིན་པར་འགྱུར། ། ཟེར་བའི་སྐབས་ སྨིན་ཟེར་མིའི་ རྣམ་གྲངས་འདི་ ...
ཀ) མིན།  ཁ) ཤིང་འབྲས།  ག) འཚོ་འཚོཔ།  ང) བསགས་བསགསཔ།
༣ ས་བླ་མཐོན་པོར་གཤེགས་པའི་མཁའ་ལྡིང་གི། གྲིབ་མ་རེ་ཞིག་བལྟ་བར་མི་མངོན་ཡང་།། ཟེར་མི་འདི་ དཔེ་ཨིན་པས། འདི་གི་ དོན་འདི་ ...
ཀ) ལས་ཀྱི་འབྲས་བུ་འདི་ཐད་རི་བ་རི་མྱོང་དགོ་ཟེར་ཨིན་པས།  ཁ) བྱ་དེའི་གྲིབ་མ་མཐོང་མི་ཚུགས་ཟེར་ཨིན་པས།  ག) དགེ་བ་བསྒྲུབ་དགོ་ཟེར་ཨིན་པས།  ང) སྡིག་པ་སྤང་དགོ་ཟེར་ཨིན་པས།
༤ རང་དང་གཞན་གཉིས་ཀའི་ བྱ་བ་ལམ་འགྲོ་ལེགས་ཤོམ་འགྱོ་མི་འདི་ ...
ཀ) ལས་རྒྱུ་འབྲས་བརྩི་ཤེས་ནི་འདི་གིས་ཨིན།  ཁ) སྡུག་བསྔལ་དང་བྲལ་ནི་འདི་གིས་ཨིན།  ག) བདེ་བ་དང་ལྡན་ནི་འདི་གིས་ཨིན།  ང) སྤང་བླང་ཧ་གོ་ནི་འདི་གིས་ཨིན།', '༡ (ཁ)  ༢ (ག) [to confirm]  ༣ (ཀ)  ༤ (ཀ)
༡ ལས་འབྲས་ མི་བསླུ་བ་ ངེས་པར་དུ་ ཡོད།
༢ སྨིན་ = འབྲས་བུ་ ཚོས་ཏེ་ འཚོ་འཚོཔ་ (Claude''s reading; confirm).
༣ བྱའི་གྲིབ་མ་ མཐོང་མ་ཚུགས་རུང་ མཇུག་ལུ་ མངོན་དོ་བཟུམ་ ལས་ཀྱི་འབྲས་བུ་ ཐད་རི་བ་རི་ མྱོང་དགོ།
༤ ལས་རྒྱུ་འབྲས་ བརྩི་ཤེས་པ་ཅིན་ རང་གཞན་གཉིས་ཀའི་ བྱ་བ་ ལེགས་ཤོམ་འགྱོ།', null, '[{"point": "༡ (ཁ)", "marks": 1}, {"point": "༢ (ག) - to be confirmed by a Dzongkha teacher", "marks": 1}, {"point": "༣ (ཀ)", "marks": 1}, {"point": "༤ (ཀ)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'dzongkha-comprehension'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check it before publishing.", "Real RCSC Dzongkha text from a PDF whose font adds stray letters; cleaned automatically: compare with the PDF.", "Item ༢ (meaning of སྨིན): Claude is not sure of the intended answer; a Dzongkha teacher must confirm."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2025b1-dz', 2, null)
  returning id
)
insert into me_q select 'D2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 1.5, 1 from me_q where key = 'D2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 1.0, 2 from me_q where key = 'D2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 1.0, 3 from me_q where key = 'D2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 0.5, 4 from me_q where key = 'D2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'passage', 'དྲི་བ་ ག། འོག་གི་མིང་ཚིག་ཚུ་གི་ རྗོད་ཚིག་བྲིས། (ལྟག་གི་ཡིག་རྒྱུགས་ནང་ལས་ འདྲ་བཤུས་ཕབ་མི་ཆོག) (སྐུགས་ ༣)
༡༽ ཟུང་འབྲེལ།  ༢༽ ཆུད་མི་ཟ།  ༣༽ མཐོན་པོ།  ༤༽ སྤང་བླང་།  ༥༽ ཚེ་འདི་ཕྱི།  ༦༽ ཐེ་ཚོམ།', '༡ ཤེས་རིག་དང་ ལམ་སྲོལ་ ཟུང་འབྲེལ་ཐོག་ལས་ སློབ་སྦྱོང་འབད་དགོ།
༢ ཁྱོད་ཀྱིས་ བཏང་མི་ དཀའ་ངལ་འདི་ ཆུད་མི་ཟ།
༣ ཇོ་མོ་ལྷ་རི་ ཧ་ཅང་ མཐོན་པོ་ཅིག་ཨིན།
༤ ལཱ་ག་ཅི་འབད་རུང་ སྤང་བླང་ ཧ་གོ་སྟེ་ འབད་དགོ།
༥ དགེ་བ་འདི་ ཚེ་འདི་ཕྱི་ གཉིས་ཆ་ར་ལུ་ ཕན།
༦ ང་ ཁོ་ ནངས་པ་ འོང་ནི་ཨིན་ན་ མེན་ན་ ཐེ་ཚོམ་ཟ་དོ།', null, '[{"point": "ཚིག་ ༦ ལུ་ རྗོད་ཚིག་ ཀྲིག་ཀྲི་ (ཚིག་རེ་ལུ་ ༠.༥) ཡིག་རྒྱུགས་ལས་ འདྲ་བཤུས་ མེད།", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'dzongkha-comprehension'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check it before publishing.", "Real RCSC Dzongkha text from a PDF whose font adds stray letters; cleaned automatically: compare with the PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2025b1-dz', 3, null)
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
  values ('ME', 'passage', 'དྲི་བ་ ང་། འོག་གི་དོན་མཚམས་འདི་ལྷག་སྟེ་ ཡིག་སྡེབ་འཛོལ་བ་ ༥ ཡོད་མི་ཚུ་ ངོས་འཛིན་འབད་ཞིནམ་ལས་ སྡེབ་བཅོས་ཁ་རྐྱབ་སྟེ་ བྲིས། (སྐུགས་ ༡x༥=༥)
ཤེས་རིག་གི་འཆར་སང་འདི་ རྒྱལ་ཡོངས་དགའ་སྐྱིད་སྤེལ་འཛོམས་ཀྱི་ ལྟ་བ་འཛིན་པའི་ཤེས་ཡན་ཅན་དང་ འབྲུག་པའི་མཐུན་མོང་མ་ཡིན་པའི་ ཁྱད་ཆོས་ཐ་དམ་ཚིད་དང་ལས་རྒྱུ་འབྲས་ཚུ་འགྱུར་བ་མེད་པར་ བཙི་ཤེས་པའི་མི་སྡེ་ཅིག་ལུ་ འགྱུར་ཚུགས་ནི་འདི་ཨིན།', 'འཆར་སང → འཆར་སྣང། སྤེལ་འཛོམས → དཔལ་འཛོམས། ཤེས་ཡན → ཤེས་ཡོན། ཐ་དམ་ཚིད → ཐ་དམ་ཚིག། བཙི → བརྩི།', null, '[{"point": "འཆར་སང → འཆར་སྣང", "marks": 1}, {"point": "སྤེལ་འཛོམས → དཔལ་འཛོམས", "marks": 1}, {"point": "ཤེས་ཡན → ཤེས་ཡོན", "marks": 1}, {"point": "ཐ་དམ་ཚིད → ཐ་དམ་ཚིག", "marks": 1}, {"point": "བཙི → བརྩི", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'dzongkha-comprehension'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check it before publishing.", "Real RCSC Dzongkha text from a PDF whose font adds stray letters; cleaned automatically: compare with the PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2025b1-dz', 4, null)
  returning id
)
insert into me_q select 'D4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 2.0, 1 from me_q where key = 'D4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 1.0, 2 from me_q where key = 'D4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 1.0, 3 from me_q where key = 'D4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 1.0, 4 from me_q where key = 'D4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'translation', 'འོག་གི་ཨིང་སྐད་ནང་ཡོད་མི་དོན་མཚམས་འདི་ ལེགས་ཤོམ་སྦེ་ལྷག་ཞིནམ་ལས་ རྫོང་ཁའི་ཐོག་ལུ་ སྐད་སྒྱུར་འབད། (གནད་དོན་ཕོག་མ་ཕོག་དང་ གོ་རིམ་ སྡེབ་སྦྱོར་ཚུ་ལུ་ བལྟ་སྟེ་ སྐུགས་བྱིན་ནི་ཨིན།) (སྐུགས་ ༡༥)

Bhutan is making concerted efforts to position itself as a premium destination for holistic and high-quality education by 2035, according to the Industrial Development Roadmap 2025.

The goal is not only to improve education for citizens but also to attract international students and private investments into the sector.

Currently, 94 percent of students attend public institutions, while only 6 percent are enrolled in private schools and institutes. However, private sector participation increases at higher education levels.

With growing demand for diverse tertiary education, the Industrial Development Roadmap highlights the urgent need to expand infrastructure and strengthen both public and private education institutions.

According to the Bhutan Education Blueprint 2014-2025, private sector involvement is crucial, especially in diversifying and improving tertiary and technical education.', 'བཟོ་གྲྭ་གོང་འཕེལ་ལམ་སྟོན་ ༢༠༢༥ ལྟར་དུ་ འབྲུག་རྒྱལ་ཁབ་འདི་ སྤྱི་ལོ་ ༢༠༣༥ ཚུན་ ཆ་ཚང་དང་ སྤུས་ཚད་ལྡན་པའི་ ཤེས་རིག་གི་ གནས་ས་ མཐོ་ཤོས་ཅིག་སྦེ་ བཟོ་ནིའི་དོན་ལུ་ མཉམ་འབྲེལ་གྱི་ བརྩོན་ཤུགས་ བསྐྱེད་དེ་ཡོདཔ་ཨིན།

དམིགས་དོན་འདི་ མི་སེར་ཚུ་གི་ ཤེས་རིག་ ཡར་དྲག་གཏང་ནི་ རྐྱངམ་ཅིག་ མེན་པར་ ཕྱི་རྒྱལ་གྱི་ སློབ་ཕྲུག་ཚུ་དང་ སྒེར་གྱི་ མ་རྩ་བཙུགས་མི་ཚུ་ཡང་ ལས་སྡེ་འདི་ནང་ འདྲེན་ནི་ཨིན།

ད་ལྟོ་ སློབ་ཕྲུག་ བརྒྱ་ཆ་ ༩༤ གིས་ གཞུང་གི་ སློབ་གྲྭ་ཚུ་ནང་ སློབ་སྦྱོང་འབད་དོ་ཡོདཔ་ད་ བརྒྱ་ཆ་ ༦ རྐྱངམ་ཅིག་ སྒེར་གྱི་ སློབ་གྲྭ་དང་ ཚོགས་སྡེ་ཚུ་ནང་ ཐོ་བཀོད་འབད་དེ་ཡོད། ཨིན་རུང་ མཐོ་རིམ་ཤེས་རིག་གི་ གནས་རིམ་ཚུ་ནང་ སྒེར་སྡེའི་ མཉམ་ཞུགས་ ཡར་སེངམ་ཨིན།

མཐོ་རིམ་ཤེས་རིག་ སྣ་མང་གི་ དགོས་མཁོ་ ཡར་སེང་འགྱོ་མི་དང་བསྟུན་ བཟོ་གྲྭ་གོང་འཕེལ་ལམ་སྟོན་ནང་ གཞི་རྟེན་མཐུན་རྐྱེན་ རྒྱ་སྐྱེད་འབད་ནི་དང་ གཞུང་དང་ སྒེར་གྱི་ ཤེས་རིག་ཚོགས་སྡེ་ གཉིས་ཆ་ར་ ཤུགས་ཅན་བཟོ་ནིའི་ དགོས་མཁོ་ འཕྲལ་མཁོ་ཅན་ཅིག་ ཡོདཔ་སྦེ་ གསལ་སྟོན་འབད་དེ་ཡོད།

འབྲུག་གི་ཤེས་རིག་ཐག་ཡིག་ ༢༠༡༤-༢༠༢༥ ལྟར་དུ་ སྒེར་སྡེའི་ མཉམ་ཞུགས་འདི་ ལྷག་པར་དུ་ མཐོ་རིམ་དང་ བཟོ་རིག་ ཤེས་རིག་ སྣ་མང་དང་ ཡར་དྲག་གཏང་ནི་ལུ་ གལ་ཆེཝ་ཨིན།', null, '[{"point": "གནད་དོན་ཕོག་མ་ཕོག་ - དོན་ཚན་ཆ་ཚང་ མ་ལུས་པར་ དོན་མ་འཛོལ་བར།", "marks": 7}, {"point": "ཨང་གྲངས་ (༢༠༣༥། ༩༤ ། ༦ ། ༢༠༡༤-༢༠༢༥) དང་ མིང་ (ཡིག་ཆ་) ཚུ་ ངོ་མ་བཟུམ།", "marks": 3}, {"point": "གོ་རིམ་དང་ སྡེབ་སྦྱོར་ བརྡ་སྤྲོད།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'translation-english-to-dzongkha'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check it before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'T1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 6.0, 1 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 4.0, 2 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 3.0, 3 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 2.0, 4 from me_q where key = 'T1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'Read the following passage and answer ALL THREE questions.

Road Safety on Bhutan''s Highways - Case Study

Every year, road crashes in Bhutan take dozens of lives and leave many more injured, often young people in the most productive years of their lives. Behind each number is a family that loses a breadwinner, a student or a parent. With the number of vehicles growing faster than the population, the problem is likely to grow unless attitudes change.

Many crashes have the same causes. Drivers speed on winding mountain roads, overtake on blind curves and drive after drinking at social gatherings. Some drivers are tired after long journeys to deliver goods or passengers on time. Others are distracted by mobile phones. Heavy trucks carrying construction materials and boulders share narrow roads with taxis and private cars.

Road conditions add to the danger. Landslides, potholes and roadworks during the monsoon make driving difficult, and many stretches still have no crash barriers or proper signs. In winter, black ice and fog on high passes catch drivers by surprise.

Enforcement has improved, with checkpoints and alcohol tests, but traffic police cannot be everywhere. Some experts say that driving schools teach people how to pass the test rather than how to drive safely. Others point out that once a licence is issued, a driver may never be tested again.

Road safety is not only the job of the police or the road department. It begins with every driver, passenger and pedestrian choosing to follow the rules even when nobody is watching.

"Arrive alive: it is better to be late than never." 

Question 1
According to the passage, what are the main causes of road crashes in Bhutan? Identify two causes and explain how each can be addressed. (10 marks)', 'The passage gives two broad kinds of causes. The first is driver behaviour: speeding on winding roads, overtaking on blind curves, drink driving after social gatherings, fatigue after long journeys and distraction by mobile phones. This can be addressed by stricter enforcement such as speed checks, random alcohol tests and heavy fines, by limiting the driving hours of truck and taxi drivers, and by awareness campaigns.

The second is road conditions: landslides, potholes and roadworks during the monsoon, stretches without crash barriers or signs, and black ice and fog on high passes in winter. The Department of Surface Transport can install crash barriers and warning signs at dangerous curves, clear landslides quickly, put sand or salt on icy passes and announce road conditions on radio and social media so that drivers can plan.', null, '[{"point": "Cause 1 explained (e.g. speeding and overtaking on blind curves; drink driving; fatigue; phone use)", "marks": 3}, {"point": "Cause 2 explained (e.g. road conditions: landslides, potholes, no barriers or signs; ice and fog)", "marks": 3}, {"point": "Practical solution for each", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'case-study'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'A1'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-technical-1-2025b1-cs2', 1, null)
  returning id
)
insert into me_q select 'A1s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 2.0, 3 from me_q where key = 'A1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 1.5, 4 from me_q where key = 'A1s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'Question 2
"Some experts say that driving schools teach people how to pass the test rather than how to drive safely." Discuss this statement and suggest two improvements to the way drivers are trained and licensed in Bhutan. (10 marks)', 'The statement suggests that many learners practise only the fixed routines needed for the licence test, such as parking and a short drive in town. They rarely learn to drive on narrow mountain highways, at night, in rain, fog or ice, or to judge when overtaking is safe. As a result, new drivers may hold a licence but lack the judgement needed on real roads.

Two improvements could help. First, driving schools should be required to give a minimum number of practical hours on highways and in difficult conditions, including lessons on defensive driving, fatigue and the dangers of alcohol. Second, licensing should not be a one-time event: new drivers could hold a probation licence for two years with zero tolerance for alcohol, a penalty points system could suspend repeat offenders, and drivers of taxis, buses and trucks could take refresher courses and tests every few years.', null, '[{"point": "Discussion of the statement (training focused on test routines, little practice on mountain roads, night, rain, defensive driving)", "marks": 4}, {"point": "Improvement 1 explained (e.g. compulsory practical hours on highways and in bad weather; defensive driving)", "marks": 3}, {"point": "Improvement 2 explained (e.g. periodic re-testing or refresher courses; probation licence; points system)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'case-study'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'A2'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-technical-1-2025b1-cs2', 2, null)
  returning id
)
insert into me_q select 'A2s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 2.0, 3 from me_q where key = 'A2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 1.5, 4 from me_q where key = 'A2s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'Question 3
"Road safety is not only the job of the police or the road department." To what extent do you agree? Justify your view with two reasons. (10 marks)', 'I fully agree that road safety is everyone''s responsibility.

First, as the passage notes, traffic police cannot be everywhere. Most crashes are caused by choices drivers make when nobody is watching: speeding, overtaking on blind curves, using phones or driving after drinking. Only drivers themselves can make the right choice at that moment.

Second, others also play a part. Passengers can wear seat belts and refuse to travel with a driver who has been drinking, families and friends can arrange a sober driver after gatherings, employers can give truck and taxi drivers enough rest, and pedestrians can use footpaths and crossings. Schools can teach road safety from an early age.

The police and road department must enforce rules and build safe roads, but crashes will only fall when every road user follows the rules.', null, '[{"point": "Clear stand", "marks": 2}, {"point": "Reason 1 explained (e.g. police cannot be everywhere; drivers'' choices decide most crashes)", "marks": 4}, {"point": "Reason 2 explained (e.g. passengers, families, employers and pedestrians share responsibility: seat belts, refusing to ride with a drunk driver, rest for drivers)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'case-study'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'A3'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-technical-1-2025b1-cs2', 3, null)
  returning id
)
insert into me_q select 'A3s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 2.0, 3 from me_q where key = 'A3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 1.5, 4 from me_q where key = 'A3s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'Bhutan depends heavily on imports of fuel, food and consumer goods, mostly from India. Do you think promoting "Made in Bhutan" products can reduce the country''s trade deficit? Give reasons to support your answer and include relevant examples. (10 marks)', 'Promoting "Made in Bhutan" products can help reduce the trade deficit, but only for some goods and only if quality and prices compete.

First, many things we import can be produced at home. Vegetables, eggs, dairy, rice, furniture, juice and handicrafts are already made in Bhutan; if more people buy them, less money leaves the country, and farmers and small businesses earn more.

Second, there are limits. Our market is small, production costs are high, and many raw materials, machines and packaging are themselves imported. Fuel and vehicles cannot be produced locally at all.

To make the campaign work, the government can support producers with credit, storage and marketing, schools and offices can buy local products, and producers must improve quality and packaging. Combined with exports such as hydropower and minerals, this can narrow the deficit.', null, '[{"point": "Clear stand", "marks": 2}, {"point": "Reason 1 with example (import substitution: vegetables, dairy, eggs, furniture, processed food)", "marks": 3}, {"point": "Reason 2 with example (limits: small market, high costs, raw materials imported; need quality and scale)", "marks": 3}, {"point": "Suggestions to make it work", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'topical-issues-economy'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B1'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'B1s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 2.0, 3 from me_q where key = 'B1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 1.5, 4 from me_q where key = 'B1s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'Many young Bhutanese leave for Australia and other countries to work and study. Recommend three measures that the government, private sector and communities could take to make staying and working in Bhutan more attractive for young people. (10 marks)', 'First, the government should improve pay, promotion and professional growth in the professions most affected, such as nursing, teaching and engineering, so that a career at home is a real option.

Second, the private sector, with government support, should create more attractive jobs. Projects like Gelephu Mindfulness City, digital services, tourism and modern agriculture can offer well-paid work, and young entrepreneurs can be supported with credit and mentoring.

Third, communities and the government can improve living conditions and recognition: affordable housing in towns, childcare, sports and cultural spaces, and public recognition of young achievers. Programmes that keep in touch with Bhutanese abroad and help returnees find jobs or start businesses would also encourage people to come back with new skills.

Together these measures can turn migration from a loss into a temporary stage that strengthens the nation.', null, '[{"point": "Measure 1 explained (e.g. better pay and career paths in key professions)", "marks": 3}, {"point": "Measure 2 explained (e.g. private-sector growth, GMC and enterprise support)", "marks": 3}, {"point": "Measure 3 explained (e.g. housing, recognition, links with diaspora and return schemes)", "marks": 3}, {"point": "Collaboration shown", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'topical-issues-employment'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B2'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'B2s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 2.0, 3 from me_q where key = 'B2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 1.5, 4 from me_q where key = 'B2s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'long_answer', 'Do you agree that Bhutan should rapidly shift to electric vehicles (EVs) for both public and private transport? Justify and explain with three reasons. (10 marks)', 'I agree that Bhutan should shift to electric vehicles, but steadily rather than overnight.

First, EVs run on electricity from our own hydropower, while petrol and diesel are imported with scarce rupees. Using our own clean power would reduce fuel imports and the trade deficit.

Second, EVs produce no exhaust, improving air quality in towns like Thimphu and Phuentsholing and helping Bhutan remain carbon negative.

Third, there are real challenges: EVs cost more to buy, charging stations are still few on long highways, cold weather and steep roads reduce battery range, and old batteries must be disposed of safely. These can be managed by tax incentives, building chargers along national highways, starting with taxis and buses, and setting up battery recycling.

A planned shift will bring economic and environmental gains while avoiding hardship.', null, '[{"point": "Clear stand", "marks": 1}, {"point": "Reason 1: energy and economy (own hydropower vs imported fuel; trade deficit)", "marks": 3}, {"point": "Reason 2: environment and health (no exhaust, carbon neutrality)", "marks": 3}, {"point": "Reason 3: challenges (cost, charging network, mountain roads, battery disposal) and how to manage them", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'topical-issues-energy'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'B3'), 'new_scenario',
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'B3s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 2.0, 3 from me_q where key = 'B3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 1.5, 4 from me_q where key = 'B3s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The headquarters of the United Nations is located in', null, 'The UN headquarters is in New York.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Vienna', false, 1), ('B', 'Geneva', false, 2), ('C', 'New York', true, 3), ('D', 'Paris', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which is the longest river in Asia?', null, 'The Yangtze in China is Asia''s longest river.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mekong', false, 1), ('B', 'Yangtze', true, 2), ('C', 'Ganges', false, 3), ('D', 'Indus', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The Paris Agreement, adopted in 2015, deals mainly with', null, 'The Paris Agreement aims to limit global warming.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'refugees', false, 1), ('B', 'climate change', true, 2), ('C', 'nuclear weapons', false, 3), ('D', 'world trade', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Bhutan joined the United Nations in', null, 'Bhutan became a UN member on 21 September 1971.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1985', false, 1), ('B', '1990', false, 2), ('C', '1962', false, 3), ('D', '1971', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which planet is the largest in our solar system?', null, 'Jupiter is the largest planet.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Saturn', false, 1), ('B', 'Earth', false, 2), ('C', 'Jupiter', true, 3), ('D', 'Neptune', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The currency of Japan is the', null, 'Japan''s currency is the yen.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Yen', true, 1), ('B', 'Yuan', false, 2), ('C', 'Ringgit', false, 3), ('D', 'Won', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The international organization that sets rules for trade between nations is the', null, 'The World Trade Organization (WTO) deals with the rules of trade.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ILO', false, 1), ('B', 'WHO', false, 2), ('C', 'WTO', true, 3), ('D', 'IMF', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Mount Everest lies on the border of Nepal and', null, 'Everest lies on the border of Nepal and China (Tibet).', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'China', true, 1), ('B', 'India', false, 2), ('C', 'Bhutan', false, 3), ('D', 'Pakistan', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'passage', '༉ ལཱ་གཡོག་ནང་ ཉིན་བསར་ ཆུ་ཚོད་ཀྱི་ དུས་ཚོད་ བརྩི་ནི་འདི་ ལཱ་ཤུལ་ལེགས་ཤོམ་ ཐོན་ནིའི་ རྩ་བ་ཨིན། ལཱ་ཁང་ནང་ དུས་ཚོད་ཁར་ འོང་ནི་དང་ བཀོད་ཡོད་པའི་ ལཱ་ཚུ་ དུས་ཚོད་ནང་འཁོད་ མཇུག་བསྡུ་ནི་ཚུ་གིས་ ལཱ་ཞབས་ཏོག་ལེན་མི་ མི་སེར་ཚུ་གི་ ཡིད་ཆེས་ ཐོབ་ཚུགསཔ་ཨིན།

དུས་ཚོད་ མ་བརྩི་བ་ཅིན་ ལཱ་ ཕྱི་འགྱང་ནི་མ་ཚད་ མི་གཞན་གྱི་ དུས་ཚོད་ཡང་ ཆུད་ཟད་ འགྱོཝ་ཨིན། ཡིག་ཚང་ནང་ ཞབས་ཏོག་ ལེན་བར་ འོང་མི་ མི་སེར་ཅིག་ ཐག་རིང་ས་ལས་ འོང་སྟེ་ ལཱ་གཡོག་པ་ མེད་པར་ ལོག་འགྱོ་དགོ་པ་ཅིན་ ཁོ་གི་ ཉིན་གཅིག་གི་ ལཱ་དང་ དངུལ་ ཆུད་ཟད་ འགྱོཝ་ཨིན།

དེ་འབདཝ་ལས་ ལཱ་གཡོག་པ་ རེ་རེ་གིས་ ལཱ་འདི་ རང་གི་ འགན་ཁུར་ཨིན་ཟེར་ མནོ་སྟེ་ དུས་ཚོད་ བརྩི་ཞིནམ་ལས་ དྲང་བདེན་གྱི་ ཐོག་ལས་ ལཱ་འབད་པ་ཅིན་ རྒྱལ་ཁབ་ཀྱི་ གོང་འཕེལ་ལུ་ ཕན་ཐོགས་ཆེཝ་ཨིན།

ལྟག་གི་ཡིག་རྒྱུགས་ལྷག་ཞིནམ་ལས་ དྲི་བ་ ཀ་ ཁ་ ག་ ང་ བཞི་གི་ལན་བྲིས།

དྲི་བ་ ཀ། ལན་ཐུང་ཀུ། (སྐུགས་ ༤x༢=༨)
༡ ཡིག་རྒྱུགས་ནང་ ལཱ་ཤུལ་ལེགས་ཤོམ་ ཐོན་ནིའི་ རྩ་བ་ ག་ཅི་ཨིན་ཟེར་ བཀོད་ཡོད་ག?
༢ དུས་ཚོད་ མ་བརྩི་བ་ཅིན་ གནོད་པ་ ག་ཅི་ར་ འབྱུངམ་ཨིན་ན?
༣ ཡིག་རྒྱུགས་ནང་ མི་སེར་ཅིག་གི་ དཔེ་ ག་ཅི་སྦེ་ བཀོད་ཡོད་ག?
༤ ཁྱོད་ལཱ་གཡོག་པ་ཅིག་ ཨིན་པ་ཅིན་ དུས་ཚོད་ བརྩི་ནི་ལུ་ ག་ཅི་འབད་ནི་ཨིན་ན?', '༡ ཉིན་བསར་ དུས་ཚོད་ བརྩི་ནི་འདི་ ལཱ་ཤུལ་ ལེགས་ཤོམ་ ཐོན་ནིའི་ རྩ་བ་ཨིན།
༢ ལཱ་ ཕྱི་འགྱང་ནི་དང་ མི་གཞན་གྱི་ དུས་ཚོད་ཡང་ ཆུད་ཟད་ འགྱོཝ་ཨིན།
༣ ཐག་རིང་ས་ལས་ ཞབས་ཏོག་ལེན་བར་ འོང་མི་ མི་སེར་ཅིག་ ལཱ་གཡོག་པ་ མེད་པར་ ལོག་འགྱོ་དགོ་པ་ཅིན་ ཁོ་གི་ ཉིན་གཅིག་གི་ ལཱ་དང་ དངུལ་ ཆུད་ཟད་ འགྱོཝ་ཨིན།
༤ ལཱ་ཁང་ནང་ དུས་ཚོད་ཁར་ འོང་ནི། ལཱ་ཚུ་ ཉིན་རེ་བཞིན་ འཆར་གཞི་ བཟོ་སྟེ་ དུས་ཚོད་ནང་འཁོད་ མཇུག་བསྡུ་ནི།', null, '[{"point": "༡ ཉིན་བསར་ དུས་ཚོད་ བརྩི་ནི།", "marks": 2}, {"point": "༢ ལཱ་ ཕྱི་འགྱང་ནི་དང་ མི་གཞན་གྱི་ དུས་ཚོད་ ཆུད་ཟད་འགྱོ་ནི།", "marks": 2}, {"point": "༣ ཐག་རིང་ས་ལས་ འོང་མི་ མི་སེར་ ལཱ་གཡོག་པ་ མེད་པར་ ལོག་འགྱོ་དགོ་པ་ཅིན་ ཉིན་གཅིག་གི་ ལཱ་དང་ དངུལ་ ཆུད་ཟད།", "marks": 2}, {"point": "༤ རང་གི་ ཐབས་ལམ་ ༢ (དུས་ཚོད་ཁར་ འོང་ནི། ལཱ་ དུས་ནང་ མཇུག་བསྡུ་ནི།)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'dzongkha-comprehension'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 8,
    864, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'D1'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check it before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-technical-1-2025b1-dz2', 1, null)
  returning id
)
insert into me_q select 'D1s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 3.5, 1 from me_q where key = 'D1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.0, 2 from me_q where key = 'D1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 1.5, 3 from me_q where key = 'D1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 1.0, 4 from me_q where key = 'D1s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'passage', 'དྲི་བ་ ཁ། ལན་གདམ་ཁ་ཅན། ལན་ངོ་མ་འདི་གདམ་ཁ་རྐྱབ་སྟེ་ ཀ་རྟགས་དང་སྦྲགས་ཏེ་ བྲིས། (སྐུགས་ ༤x༡=༤)
༡ ཡིག་རྒྱུགས་ཀྱི་ གནད་དོན་ གཙོ་བོ་འདི་ ...  ཀ) ལཱ་ཁང་གི་ བཟོ་བཀོད།  ཁ) དུས་ཚོད་ བརྩི་ནིའི་ གལ་གནད།  ག) མི་སེར་ཚུ་གི་ ཉོ་ཚོང་།  ང) ཡིག་ཚང་གི་ བཅའ་ཡིག།
༢ "ཆུད་ཟད་" ཟེར་མིའི་ དོན་འདི་ ...  ཀ) ཁེ་ཕན་ ཐོབ།  ཁ) ལེགས་ཤོམ་ འགྱོ།  ག) དོན་མེད་ དུ་ ཤོར།  ང) མང་སུ་ འགྱོ།
༣ མི་སེར་ཚུ་གི་ ཡིད་ཆེས་ ཐོབ་ཚུགས་ནི་འདི་ ...  ཀ) ལཱ་ དུས་ཚོད་ནང་འཁོད་ མཇུག་བསྡུ་བ་ལས།  ཁ) ཡིག་ཚང་ ཆེ་བ་ལས།  ག) ལཱ་གཡོག་པ་ མང་བ་ལས།  ང) གླ་ཆ་ མཐོ་བ་ལས།
༤ ཡིག་རྒྱུགས་ལྟར་ན་ ལཱ་གཡོག་པ་གིས་ ལཱ་འདི་ ...  ཀ) གཞན་གྱི་ ལཱ་ཨིན།  ཁ) རང་གི་ འགན་ཁུར་ཨིན།  ག) རྩེད་མོ་ཨིན།  ང) ལཱ་ཁག་ཨིན།', '༡ (ཁ)  ༢ (ག)  ༣ (ཀ)  ༤ (ཁ)', null, '[{"point": "༡ (ཁ)", "marks": 1}, {"point": "༢ (ག)", "marks": 1}, {"point": "༣ (ཀ)", "marks": 1}, {"point": "༤ (ཁ)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'dzongkha-comprehension'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 4,
    432, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'D2'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check it before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-technical-1-2025b1-dz2', 2, null)
  returning id
)
insert into me_q select 'D2s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 1.5, 1 from me_q where key = 'D2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 1.0, 2 from me_q where key = 'D2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 1.0, 3 from me_q where key = 'D2s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 0.5, 4 from me_q where key = 'D2s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'passage', 'དྲི་བ་ ག། འོག་གི་མིང་ཚིག་ཚུ་གི་ རྗོད་ཚིག་བྲིས། (ཡིག་རྒྱུགས་ནང་ལས་ འདྲ་བཤུས་ཕབ་མི་ཆོག) (སྐུགས་ ༣)
༡༽ དུས་ཚོད།  ༢༽ ཞབས་ཏོག།  ༣༽ ཡིད་ཆེས།  ༤༽ འགན་ཁུར།  ༥༽ དྲང་བདེན།  ༦༽ གོང་འཕེལ།', '༡ ང་ ཨ་རྟག་ར་ དུས་ཚོད་ཁར་ སློབ་གྲྭ་ལུ་ འགྱོཝ་ཨིན།
༢ སྨན་པ་ཚུ་གིས་ ནད་པ་ཚུ་ལུ་ ཞབས་ཏོག་ ལེགས་ཤོམ་ བྱིནམ་ཨིན།
༣ ཨམ་ ཨ་པ་ཚུ་གིས་ ང་ལུ་ ཡིད་ཆེས་ བསྐྱེད་ཡི།
༤ མཐའ་འཁོར་ ཉམས་སྲུང་འདི་ ང་བཅས་ ག་ར་གི་ འགན་ཁུར་ཨིན།
༥ ཚོང་པ་འདི་ དྲང་བདེན་ཅན་ཅིག་ཨིན།
༦ ལམ་ཚུ་ བཟོ་ཞིནམ་ལས་ གཡུས་ཚན་ ནང་ གོང་འཕེལ་ བྱུང་ཡི།', null, '[{"point": "ཚིག་ ༦ ལུ་ རྗོད་ཚིག་ ཀྲིག་ཀྲི་ (ཚིག་རེ་ལུ་ ༠.༥)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'dzongkha-comprehension'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 3,
    324, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'D3'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check it before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-technical-1-2025b1-dz2', 3, null)
  returning id
)
insert into me_q select 'D3s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 1.0, 1 from me_q where key = 'D3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 1.0, 2 from me_q where key = 'D3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 0.5, 3 from me_q where key = 'D3s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 0.5, 4 from me_q where key = 'D3s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'passage', 'དྲི་བ་ ང་། འོག་གི་དོན་མཚམས་འདི་ལྷག་སྟེ་ ཡིག་སྡེབ་འཛོལ་བ་ ༥ ཡོད་མི་ཚུ་ ངོས་འཛིན་འབད་ཞིནམ་ལས་ སྡེབ་བཅོས་ཁ་རྐྱབ་སྟེ་ བྲིས། (སྐུགས་ ༡x༥=༥)
ང་བཅས་རའི་ རྒྱལ་ཁབ་ཀྱི་ མཐའ་འཁོར་འདི་ ཉམ་སྲུང་འབད་ནི་འདི་ ང་བཅས་ ག་ར་གི་ འགན་ཁུར་ཨིན། ནགས་ཚལ་ཚུ་ ལེགས་ཤོམ་སྦེ་ སྲུང་སྐྱབ་འབད་དེ་ ལྗོན་ཤིན་ཚུ་ བཙུགས་ནི་དང་ གད་སྙིག་ཚུ་ ཁ་ཐོར་ མ་བཀོ་བར་ སྣོད་ནང་བླུགས་པ་ཅིན་ ཤུལ་མའི་ མི་རབས་ཚུ་ལུ་ ཕན་ཐོག་ཡོདཔ་ཨིན།', 'ཉམ་སྲུང → ཉམས་སྲུང། སྲུང་སྐྱབ → སྲུང་སྐྱོབ། ལྗོན་ཤིན → ལྗོན་ཤིང། གད་སྙིག → གད་སྙིགས། ཕན་ཐོག → ཕན་ཐོགས།', null, '[{"point": "ཉམ་སྲུང → ཉམས་སྲུང", "marks": 1}, {"point": "སྲུང་སྐྱབ → སྲུང་སྐྱོབ", "marks": 1}, {"point": "ལྗོན་ཤིན → ལྗོན་ཤིང", "marks": 1}, {"point": "གད་སྙིག → གད་སྙིགས", "marks": 1}, {"point": "ཕན་ཐོག → ཕན་ཐོགས", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'dzongkha-comprehension'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 5,
    540, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'D4'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check it before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, 'me-technical-1-2025b1-dz2', 4, null)
  returning id
)
insert into me_q select 'D4s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 2.0, 1 from me_q where key = 'D4s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 1.0, 2 from me_q where key = 'D4s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 1.0, 3 from me_q where key = 'D4s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 1.0, 4 from me_q where key = 'D4s';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'translation', 'འོག་གི་ཨིང་སྐད་ནང་ཡོད་མི་དོན་མཚམས་འདི་ ལེགས་ཤོམ་སྦེ་ལྷག་ཞིནམ་ལས་ རྫོང་ཁའི་ཐོག་ལུ་ སྐད་སྒྱུར་འབད། (སྐུགས་ ༡༥)

Bhutan aims to increase the use of digital services in government offices so that citizens can apply for documents and pay bills online without travelling to a Dzongkhag headquarters.

Today, many services are already available through online portals and mobile applications. However, people in rural areas still face problems because of weak internet connections and limited digital skills.

To address these challenges, the government plans to improve network coverage, train community members as digital helpers and make online forms available in Dzongkha.', 'འབྲུག་རྒྱལ་ཁབ་ཀྱིས་ མི་སེར་ཚུ་ རྫོང་ཁག་གི་ ལྟེ་བ་ལུ་ འགྲུལ་བསྐྱོད་ མ་འབད་བར་ ཡིག་ཆ་ཚུ་གི་ ཞུ་ཡིག་ཕུལ་ནི་དང་ གླ་ཆ་ཚུ་ ཡོངས་འབྲེལ་ཐོག་ལས་ སྤྲོད་ཚུགས་ནིའི་དོན་ལུ་ གཞུང་གི་ ཡིག་ཚང་ཚུ་ནང་ ཨང་རྟགས་ཅན་གྱི་ ཞབས་ཏོག་ཚུ་ ལག་ལེན་ ཡར་སེང་གཏང་ནིའི་ དམིགས་དོན་ བཞག་ཡོདཔ་ཨིན།

ད་རིས་ ཞབས་ཏོག་ ལེ་ཤ་ཅིག་ ཡོངས་འབྲེལ་གྱི་ སྒོ་སྒྲིག་དང་ ཁ་པར་གྱི་ ལག་ལེན་ཐབས་རིག་ཚུ་བརྒྱུད་དེ་ ཐོབ་ཚུགས་ཏེ་ཡོད། ཨིན་རུང་ གཡུས་ཁའི་ ས་གནས་ཚུ་ནང་ ཡོངས་འབྲེལ་གྱི་ མཐུད་ལམ་ ཉམས་ཆུང་བ་དང་ ཨང་རྟགས་ལག་ཤེས་ ཉུང་བ་ལས་བརྟེན་ མི་ཚུ་ལུ་ དཀའ་ངལ་ ད་ལྟོ་ཡང་ ཡོདཔ་ཨིན།

དཀའ་ངལ་དེ་ཚུ་ སེལ་ནིའི་དོན་ལུ་ གཞུང་གིས་ བརྒྱུད་འཕྲིན་གྱི་ ཁྱབ་ཚད་ ཡར་དྲག་གཏང་ནི། མི་སྡེའི་ འཐུས་མི་ཚུ་ ཨང་རྟགས་རོགས་རམ་པ་སྦེ་ སྦྱོང་བརྡར་བྱིན་ནི། ཡོངས་འབྲེལ་གྱི་ འགེངས་ཤོག་ཚུ་ རྫོང་ཁ་ནང་ བཟོ་ནིའི་ འཆར་གཞི་ ཡོདཔ་ཨིན།', null, '[{"point": "གནད་དོན་ཕོག་མ་ཕོག་ - དོན་ཚན་ཆ་ཚང་ མ་ལུས་པར།", "marks": 7}, {"point": "ཚིག་ (digital services, portals, network coverage) ཚུ་ རྫོང་ཁ་ནང་ ངོ་མ་སྦེ་ སྒྱུར་ཡོདཔ།", "marks": 3}, {"point": "གོ་རིམ་དང་ སྡེབ་སྦྱོར་ བརྡ་སྤྲོད།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'translation-english-to-dzongkha'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 15,
    1620, 'ai_variation', 'awaiting_review',
    (select id from me_q where key = 'T1'), 'new_scenario',
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check it before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2025 + similar, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'T1s', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 6.0, 1 from me_q where key = 'T1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 4.0, 2 from me_q where key = 'T1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 3.0, 3 from me_q where key = 'T1s';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 2.0, 4 from me_q where key = 'T1s';
commit;
