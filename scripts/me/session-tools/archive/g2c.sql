-- ME Paper II (General): BCSE 2022, batch 2: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'case-study-and-comprehension', 'Case study and comprehension' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-bhutan', 'General knowledge: Bhutan' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-bhutan-law', 'General knowledge: Bhutan law' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-books', 'General knowledge: books' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-environment', 'General knowledge: environment' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-geography', 'General knowledge: geography' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-mathematics', 'General knowledge: mathematics' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-science', 'General knowledge: science' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-sports', 'General knowledge: sports' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-wildlife', 'General knowledge: wildlife' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-world', 'General knowledge: world' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'subjective-society-and-values', 'Subjective: society and values' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'subjective-sports', 'Subjective: sports' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'subjective-tourism-policy', 'Subjective: tourism policy' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'subjective-youth-and-substance-abuse', 'Subjective: youth and substance abuse' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'topical-issues-civil-service-reform', 'Topical issues: civil service reform' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'topical-issues-climate-change', 'Topical issues: climate change' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'topical-issues-global-economy', 'Topical issues: global economy' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'topical-issues-migration', 'Topical issues: migration' on conflict (subject_id, slug) do nothing;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'analytical', 'Read the article below and answer ALL FOUR questions that follow.

When disaster strikes (Ilan Kelman, 5 October 2021, engelsbergideas.com)

Numerous synonyms exist for ‘disaster’, that is, when there are casualties, damage, and disruption: calamity, catastrophe, crisis, debacle, emergency, and tragedy, among others. Some have been defined and differentiated, rarely consistently, in academic books, glossaries, dictionaries, and laws. Even then, we struggle to translate and interpret the vocabulary and concepts across languages and cultures.

A ‘disaster’ is perhaps best described as a situation requiring outside help. Something happens that cannot be dealt with, so assistance is needed. It applies to the individual and to the family – think house fires or vehicle crashes. It applies to countries and to continents, such as the North American power outages of 1965 and 2003; and it happens on a worldwide level, with pandemics such as 1918- 1920 flu, and the ongoing COVID-19 outbreak. It could happen again, through space weather knocking out power grids and communication systems, for example, or via a major meteorite strike.

While ‘a situation requiring outside help’ helps to define and describe a ‘disaster,’ it does not explain why disasters arise. The fundamental causes of disasters, important for exploring disaster trends, can be distant from the observed impacts.

Some disasters involve environmental phenomena, with prominent examples being volcanic eruptions, rainfall, heat and humidity, landslides, blizzards, and tsunamis. The scale of a disaster is not necessarily correlated with an environmental phenomenon’s size or impact.

Some people are easily able to evacuate from a hurricane or wildfire, for example, and then rebuild their home with insurance money. Others cannot afford to buy insurance or to evacuate; they might lose their job if they leave for a few days; or perhaps they do not have the physical or mental health to start again after losing everything. When a virus sweeps the world, some people are comfortable working from home and stockpiling food from occasional supermarket visits. Others must continue to commute, lack the cash to purchase large quantities of supplies, or experience violence at home. Some people are happy heading to a communal evacuation shelter for a few days after a tornado or chemical explosion, while others legitimately fear discrimination or assault.

These differences in people and places, not the environmental phenomenon itself, explain disaster causes. In December 2003, similar earthquakes rattled central California and southern Iran killing, respectively, two people and around 25,000 people. The disparity did not come from the tremors, but from the number of people and types of infrastructure shaken. Similarly, Bangladesh has long been a landfall zone for cyclones blowing off the Bay of Bengal. Perhaps half a million people died in a 1970 cyclone disaster, while storm disasters in 2020 and 2021 resulted in just dozens of fatalities. In the interim, extensive effort to prepare for cyclones was made, resulting in vastly improved knowledge, awareness, preparedness, evacuation, sheltering, and recovery.

Thus, describing a disaster must focus on society, not nature. The phrase ‘natural disaster’ is best avoided on the premise that disasters are not natural. They are caused by society’s actions and choices, typically giving some people opportunities and resources to avoid problems, while forcing many others to be vulnerable through poverty, marginalisation, and violence.

In other words, as is often said, earthquakes don’t kill people, collapsing infrastructure does.

Infrastructure collapses because codes and regulations do not exist or are not enforced, while the people most affected retain few options to examine their seismic vulnerability or to improve their situation.

Question 1
Based on the description of disaster in the second paragraph, explain why the scale of a disaster is not necessarily correlated with an environmental phenomenon''s size or impact. (10 marks)', 'The second paragraph describes a disaster as "a situation requiring outside help": something happens that the people affected cannot deal with themselves, so assistance is needed. This definition is about the capacity of people to cope, not about the size of the natural event.
Therefore the scale of a disaster depends on how vulnerable and prepared the affected people are. A small event - a house fire or a vehicle crash - is a disaster for a family because they cannot cope alone, while a large hurricane or earthquake may cause little harm where people are wealthy, insured, well-housed and prepared, because they can evacuate and rebuild without outside help. Conversely, a moderate event can be catastrophic for poor, crowded or marginalised communities with weak buildings and no means to evacuate.
The passage gives clear examples: in December 2003 similar earthquakes struck central California and southern Iran, killing two people and about 25,000 people respectively - the difference came from the number of people and the type of infrastructure, not the tremors. Likewise, cyclones in Bangladesh killed about half a million people in 1970 but only dozens in 2020-2021 because of better preparedness. The size of the phenomenon stayed similar; the capacity to cope changed.', null, '[{"point": "Definition from paragraph 2: a disaster is a situation requiring outside help - something happens that cannot be dealt with locally", "marks": 3}, {"point": "So scale depends on capacity to cope/ vulnerability (people, wealth, preparedness, infrastructure), not on the size of the hazard; a small event can overwhelm a vulnerable community while a large one may be handled", "marks": 4}, {"point": "Examples from passage: house fire/ vehicle crash for a family; similar 2003 earthquakes - California 2 deaths vs Iran about 25,000; Bangladesh cyclones 1970 vs 2020-21", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'case-study-and-comprehension'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-general-2-2022b2-a', 1, null, null, null, null)
  returning id
)
insert into me_q select 'A1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'A1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'A1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'A1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'analytical', 'Read the article below and answer ALL FOUR questions that follow.

When disaster strikes (Ilan Kelman, 5 October 2021, engelsbergideas.com)

Numerous synonyms exist for ‘disaster’, that is, when there are casualties, damage, and disruption: calamity, catastrophe, crisis, debacle, emergency, and tragedy, among others. Some have been defined and differentiated, rarely consistently, in academic books, glossaries, dictionaries, and laws. Even then, we struggle to translate and interpret the vocabulary and concepts across languages and cultures.

A ‘disaster’ is perhaps best described as a situation requiring outside help. Something happens that cannot be dealt with, so assistance is needed. It applies to the individual and to the family – think house fires or vehicle crashes. It applies to countries and to continents, such as the North American power outages of 1965 and 2003; and it happens on a worldwide level, with pandemics such as 1918- 1920 flu, and the ongoing COVID-19 outbreak. It could happen again, through space weather knocking out power grids and communication systems, for example, or via a major meteorite strike.

While ‘a situation requiring outside help’ helps to define and describe a ‘disaster,’ it does not explain why disasters arise. The fundamental causes of disasters, important for exploring disaster trends, can be distant from the observed impacts.

Some disasters involve environmental phenomena, with prominent examples being volcanic eruptions, rainfall, heat and humidity, landslides, blizzards, and tsunamis. The scale of a disaster is not necessarily correlated with an environmental phenomenon’s size or impact.

Some people are easily able to evacuate from a hurricane or wildfire, for example, and then rebuild their home with insurance money. Others cannot afford to buy insurance or to evacuate; they might lose their job if they leave for a few days; or perhaps they do not have the physical or mental health to start again after losing everything. When a virus sweeps the world, some people are comfortable working from home and stockpiling food from occasional supermarket visits. Others must continue to commute, lack the cash to purchase large quantities of supplies, or experience violence at home. Some people are happy heading to a communal evacuation shelter for a few days after a tornado or chemical explosion, while others legitimately fear discrimination or assault.

These differences in people and places, not the environmental phenomenon itself, explain disaster causes. In December 2003, similar earthquakes rattled central California and southern Iran killing, respectively, two people and around 25,000 people. The disparity did not come from the tremors, but from the number of people and types of infrastructure shaken. Similarly, Bangladesh has long been a landfall zone for cyclones blowing off the Bay of Bengal. Perhaps half a million people died in a 1970 cyclone disaster, while storm disasters in 2020 and 2021 resulted in just dozens of fatalities. In the interim, extensive effort to prepare for cyclones was made, resulting in vastly improved knowledge, awareness, preparedness, evacuation, sheltering, and recovery.

Thus, describing a disaster must focus on society, not nature. The phrase ‘natural disaster’ is best avoided on the premise that disasters are not natural. They are caused by society’s actions and choices, typically giving some people opportunities and resources to avoid problems, while forcing many others to be vulnerable through poverty, marginalisation, and violence.

In other words, as is often said, earthquakes don’t kill people, collapsing infrastructure does.

Infrastructure collapses because codes and regulations do not exist or are not enforced, while the people most affected retain few options to examine their seismic vulnerability or to improve their situation.

Question 2
What, according to the passage, causes disaster? (10 marks)', 'According to the passage, disasters are caused not by environmental phenomena themselves but by society''s actions and choices - the "differences in people and places". The fundamental causes are often distant from the visible impacts.
Specifically: (1) vulnerability created by poverty - some people cannot afford insurance, cannot evacuate, would lose their jobs if they left, or lack the cash to stock up on supplies; (2) poor physical or mental health that prevents people from recovering; (3) marginalisation, discrimination and violence - some fear assault in shelters or experience violence at home; (4) the number of people exposed and the type of infrastructure - weak buildings collapse because building codes and regulations do not exist or are not enforced, and "earthquakes don''t kill people, collapsing infrastructure does"; and (5) lack of preparedness, knowledge, evacuation and recovery systems. Society''s choices give some people the opportunities and resources to avoid problems while forcing many others into vulnerability, and that vulnerability turns a hazard into a disaster.', null, '[{"point": "Disasters are caused by society, not nature: differences in people and places - vulnerability", "marks": 3}, {"point": "Factors: poverty, inability to afford insurance/ evacuation, job insecurity, poor health, marginalisation, discrimination and violence, number of people exposed", "marks": 4}, {"point": "Poor infrastructure: building codes and regulations absent or not enforced; ''earthquakes don''t kill people, collapsing infrastructure does''; society''s actions and choices give some people resources and leave others vulnerable", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'case-study-and-comprehension'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-general-2-2022b2-a', 2, null, null, null, null)
  returning id
)
insert into me_q select 'A2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'A2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'A2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'A2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'analytical', 'Read the article below and answer ALL FOUR questions that follow.

When disaster strikes (Ilan Kelman, 5 October 2021, engelsbergideas.com)

Numerous synonyms exist for ‘disaster’, that is, when there are casualties, damage, and disruption: calamity, catastrophe, crisis, debacle, emergency, and tragedy, among others. Some have been defined and differentiated, rarely consistently, in academic books, glossaries, dictionaries, and laws. Even then, we struggle to translate and interpret the vocabulary and concepts across languages and cultures.

A ‘disaster’ is perhaps best described as a situation requiring outside help. Something happens that cannot be dealt with, so assistance is needed. It applies to the individual and to the family – think house fires or vehicle crashes. It applies to countries and to continents, such as the North American power outages of 1965 and 2003; and it happens on a worldwide level, with pandemics such as 1918- 1920 flu, and the ongoing COVID-19 outbreak. It could happen again, through space weather knocking out power grids and communication systems, for example, or via a major meteorite strike.

While ‘a situation requiring outside help’ helps to define and describe a ‘disaster,’ it does not explain why disasters arise. The fundamental causes of disasters, important for exploring disaster trends, can be distant from the observed impacts.

Some disasters involve environmental phenomena, with prominent examples being volcanic eruptions, rainfall, heat and humidity, landslides, blizzards, and tsunamis. The scale of a disaster is not necessarily correlated with an environmental phenomenon’s size or impact.

Some people are easily able to evacuate from a hurricane or wildfire, for example, and then rebuild their home with insurance money. Others cannot afford to buy insurance or to evacuate; they might lose their job if they leave for a few days; or perhaps they do not have the physical or mental health to start again after losing everything. When a virus sweeps the world, some people are comfortable working from home and stockpiling food from occasional supermarket visits. Others must continue to commute, lack the cash to purchase large quantities of supplies, or experience violence at home. Some people are happy heading to a communal evacuation shelter for a few days after a tornado or chemical explosion, while others legitimately fear discrimination or assault.

These differences in people and places, not the environmental phenomenon itself, explain disaster causes. In December 2003, similar earthquakes rattled central California and southern Iran killing, respectively, two people and around 25,000 people. The disparity did not come from the tremors, but from the number of people and types of infrastructure shaken. Similarly, Bangladesh has long been a landfall zone for cyclones blowing off the Bay of Bengal. Perhaps half a million people died in a 1970 cyclone disaster, while storm disasters in 2020 and 2021 resulted in just dozens of fatalities. In the interim, extensive effort to prepare for cyclones was made, resulting in vastly improved knowledge, awareness, preparedness, evacuation, sheltering, and recovery.

Thus, describing a disaster must focus on society, not nature. The phrase ‘natural disaster’ is best avoided on the premise that disasters are not natural. They are caused by society’s actions and choices, typically giving some people opportunities and resources to avoid problems, while forcing many others to be vulnerable through poverty, marginalisation, and violence.

In other words, as is often said, earthquakes don’t kill people, collapsing infrastructure does.

Infrastructure collapses because codes and regulations do not exist or are not enforced, while the people most affected retain few options to examine their seismic vulnerability or to improve their situation.

Question 3
Why is it suggested that the phrase ''natural disaster'' be avoided? (10 marks)', 'The passage argues that the phrase ''natural disaster'' should be avoided because disasters are not natural. Environmental phenomena - earthquakes, cyclones, floods - are natural hazards, but whether they become disasters depends on society: how many people live in exposed places, how strong the buildings are, whether people can afford to evacuate and recover, and whether they are poor, marginalised or subject to violence.
Calling a disaster ''natural'' hides these human causes. It suggests that disasters are unavoidable acts of nature for which no one is responsible, rather than the result of choices such as failing to enforce building codes, allowing poverty and inequality, and neglecting preparedness. The evidence in the passage - similar earthquakes killing 2 people in California but 25,000 in Iran, and Bangladesh reducing cyclone deaths from about half a million to dozens through preparation - shows that society, not nature, decides the outcome.
Therefore, describing disasters as social rather than natural focuses attention on prevention, accountability and reducing vulnerability.', null, '[{"point": "Disasters are not natural - hazards are natural, but disasters result from society''s actions/ choices and vulnerability", "marks": 4}, {"point": "The term hides human responsibility (poverty, poor planning, unenforced building codes, marginalisation) and suggests disasters are inevitable acts of nature", "marks": 3}, {"point": "Avoiding it shifts focus to society, prevention and reducing vulnerability - with evidence (California vs Iran, Bangladesh)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'case-study-and-comprehension'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-general-2-2022b2-a', 3, null, null, null, null)
  returning id
)
insert into me_q select 'A3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'A3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'A3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'A3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'analytical', 'Read the article below and answer ALL FOUR questions that follow.

When disaster strikes (Ilan Kelman, 5 October 2021, engelsbergideas.com)

Numerous synonyms exist for ‘disaster’, that is, when there are casualties, damage, and disruption: calamity, catastrophe, crisis, debacle, emergency, and tragedy, among others. Some have been defined and differentiated, rarely consistently, in academic books, glossaries, dictionaries, and laws. Even then, we struggle to translate and interpret the vocabulary and concepts across languages and cultures.

A ‘disaster’ is perhaps best described as a situation requiring outside help. Something happens that cannot be dealt with, so assistance is needed. It applies to the individual and to the family – think house fires or vehicle crashes. It applies to countries and to continents, such as the North American power outages of 1965 and 2003; and it happens on a worldwide level, with pandemics such as 1918- 1920 flu, and the ongoing COVID-19 outbreak. It could happen again, through space weather knocking out power grids and communication systems, for example, or via a major meteorite strike.

While ‘a situation requiring outside help’ helps to define and describe a ‘disaster,’ it does not explain why disasters arise. The fundamental causes of disasters, important for exploring disaster trends, can be distant from the observed impacts.

Some disasters involve environmental phenomena, with prominent examples being volcanic eruptions, rainfall, heat and humidity, landslides, blizzards, and tsunamis. The scale of a disaster is not necessarily correlated with an environmental phenomenon’s size or impact.

Some people are easily able to evacuate from a hurricane or wildfire, for example, and then rebuild their home with insurance money. Others cannot afford to buy insurance or to evacuate; they might lose their job if they leave for a few days; or perhaps they do not have the physical or mental health to start again after losing everything. When a virus sweeps the world, some people are comfortable working from home and stockpiling food from occasional supermarket visits. Others must continue to commute, lack the cash to purchase large quantities of supplies, or experience violence at home. Some people are happy heading to a communal evacuation shelter for a few days after a tornado or chemical explosion, while others legitimately fear discrimination or assault.

These differences in people and places, not the environmental phenomenon itself, explain disaster causes. In December 2003, similar earthquakes rattled central California and southern Iran killing, respectively, two people and around 25,000 people. The disparity did not come from the tremors, but from the number of people and types of infrastructure shaken. Similarly, Bangladesh has long been a landfall zone for cyclones blowing off the Bay of Bengal. Perhaps half a million people died in a 1970 cyclone disaster, while storm disasters in 2020 and 2021 resulted in just dozens of fatalities. In the interim, extensive effort to prepare for cyclones was made, resulting in vastly improved knowledge, awareness, preparedness, evacuation, sheltering, and recovery.

Thus, describing a disaster must focus on society, not nature. The phrase ‘natural disaster’ is best avoided on the premise that disasters are not natural. They are caused by society’s actions and choices, typically giving some people opportunities and resources to avoid problems, while forcing many others to be vulnerable through poverty, marginalisation, and violence.

In other words, as is often said, earthquakes don’t kill people, collapsing infrastructure does.

Infrastructure collapses because codes and regulations do not exist or are not enforced, while the people most affected retain few options to examine their seismic vulnerability or to improve their situation.

Question 4
Based on the arguments presented in the passage, how can disasters be either averted or their scale minimised? (10 marks)', 'Since the passage argues that disasters arise from society rather than nature, they can be averted or minimised by changing society''s actions and choices:
1. Reduce vulnerability: address poverty, marginalisation, discrimination and violence so that everyone has the means to protect themselves - for example social protection, affordable insurance, job security during evacuations, and support for people with poor health.
2. Build safe infrastructure: create and strictly enforce building codes and land-use regulations so that buildings and infrastructure do not collapse, and help ordinary people examine and improve the safety of their homes.
3. Invest in preparedness, as Bangladesh did with cyclones: improve knowledge and awareness, early warning systems, evacuation planning, safe and inclusive shelters where people do not fear discrimination or assault, and effective recovery and rebuilding.
4. Plan for wider risks such as pandemics and space weather, with backup power and communication systems.
In Bhutan, this means enforcing building codes against earthquakes, early warning for GLOFs and floods, avoiding construction in hazard zones, and making sure vulnerable rural and poor households are included in preparedness.', null, '[{"point": "Reduce vulnerability: tackle poverty, marginalisation, discrimination and violence; social protection/ insurance so all can evacuate and recover", "marks": 3}, {"point": "Safe infrastructure: make and enforce building codes and regulations; help people assess/ improve their seismic vulnerability", "marks": 3}, {"point": "Preparedness like Bangladesh: knowledge, awareness, early warning, evacuation plans, safe shelters, recovery systems; include vulnerable groups; apply to Bhutan (GLOF, earthquakes, landslides)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'case-study-and-comprehension'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-general-2-2022b2-a', 4, null, null, null, null)
  returning id
)
insert into me_q select 'A4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'A4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'A4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'A4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', '"Welcome to the summer from hell: 2022 is shaping up to be a season of disaster - and a preview of our future." (www.grid.news)
Given the global climate disasters reported in 2022, what picture does this preview paint of our future? (10 marks)', 'In 2022 the world experienced record heatwaves across Europe (the UK passed 40 °C for the first time) and South Asia; catastrophic floods in Pakistan that submerged about a third of the country; severe droughts in Europe, China and the Horn of Africa that dried rivers and destroyed crops; widespread wildfires; and rapid glacier melt.
The picture of our future: as the planet keeps warming, such extreme events will become more frequent and more intense. Heatwaves will threaten health and lives; floods and droughts will damage farms, causing food and water insecurity and rising prices; diseases will spread to new areas; coastal and mountain communities will be displaced, increasing migration and conflict; economies will lose infrastructure and productivity; and ecosystems and biodiversity will be lost. The poor and vulnerable, who did least to cause climate change, will suffer most.
For Bhutan, this means more glacial lake outburst floods, erratic monsoons, landslides, forest fires and drying springs, threatening agriculture and hydropower. The preview is a warning that the world must cut greenhouse gas emissions urgently and invest in adaptation and disaster preparedness.', null, '[{"point": "2022 examples: record heatwaves (Europe, UK 40 °C, India/ Pakistan), Pakistan floods (a third of the country), droughts (Europe, China, Horn of Africa), wildfires, glacier melt", "marks": 3}, {"point": "Picture of future: more frequent and intense extremes as warming continues, food and water insecurity, health risks, migration, economic losses, biodiversity loss, worst for poor/ vulnerable", "marks": 4}, {"point": "Relevance to Bhutan (GLOFs, erratic monsoon, landslides, drying springs) and need for urgent mitigation and adaptation", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'topical-issues-climate-change'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'B1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'B1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'B1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'B1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', '"Beyond the suffering and humanitarian crisis from Russia''s invasion of Ukraine, the entire global economy will feel the effects of slower growth and faster inflation." (How war in Ukraine is reverberating across the world''s regions, IMF Blog, 15 March 2022)
How have we experienced the effects in Bhutan? (10 marks)', 'Although Bhutan is far from Ukraine, we felt the effects through prices and trade, because we import most of our fuel, food and goods through India:
1. Fuel prices rose sharply - petrol, diesel and LPG became much more expensive, raising transport fares and the cost of moving goods.
2. Food prices increased, especially cooking oil, wheat flour and other imported items, because Russia and Ukraine are major exporters of wheat and sunflower oil.
3. Construction materials and fertilisers became costlier, affecting construction projects and farmers.
4. Inflation rose (to around 6-7% in 2022), increasing the cost of living, especially for low-income households.
5. Higher import bills put pressure on Bhutan''s foreign currency reserves, and the government took measures to manage imports (e.g. restricting vehicle imports) to protect reserves.
6. Slower global growth delayed the economic recovery from COVID-19, affecting tourism and businesses.
The government responded by monitoring prices, supporting essential supplies and encouraging food self-sufficiency, and households had to adjust their spending.', null, '[{"point": "Price rise: fuel (petrol, diesel, LPG), cooking oil, wheat/ food items, fertiliser and construction materials - imported mostly via India; higher inflation (around 6-7%) and cost of living", "marks": 4}, {"point": "Economic effects: pressure on foreign currency reserves (rupee and dollar), import restrictions/ measures, higher transport costs, slower recovery after COVID, impact on businesses and construction, tourism", "marks": 4}, {"point": "Social effects on households and government responses (fuel/ subsidy measures, monitoring prices, encouraging self-sufficiency)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'topical-issues-global-economy'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'B2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'B2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'B2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'B2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Over the past few years, an increasing number of Bhutanese have been leaving the country to go abroad for reasons ranging from better employment and pay to higher education, among others.
Does this trend translate into opportunities or concerns for Bhutan? (10 marks)', 'The trend brings both opportunities and concerns, but at the current scale the concerns are greater.
Opportunities: remittances sent home support families and add foreign exchange; Bhutanese abroad gain education, skills, work culture and international experience that they can bring back; emigration reduces pressure on the domestic job market; and the diaspora can build networks for trade, investment and tourism.
Concerns: Bhutan is losing many skilled and experienced people - nurses, doctors, teachers, engineers and civil servants - causing shortages and weaker public services (civil service attrition reached high levels); the government''s investment in their education and training is lost; rural areas lose young people, leaving the elderly alone and more land fallow; families are separated; and for a small country with a small population, large-scale emigration threatens the economy, national identity and even security.
To turn this into an opportunity, Bhutan should improve pay, career growth and working conditions to retain talent, create more jobs through private sector growth and projects such as the Gelephu Mindfulness City, encourage Bhutanese to return through reintegration programmes, and engage the diaspora in national development.', null, '[{"point": "Opportunities: remittances and foreign exchange, skills/ education/ exposure brought back, reduced unemployment pressure, diaspora networks, investment and new ideas", "marks": 4}, {"point": "Concerns: brain drain/ loss of skilled workers (nurses, doctors, teachers, civil servants), shortages in services, ageing rural population and fallow land, family separation and elderly care, small population and national security/ identity, cost of training lost", "marks": 4}, {"point": "Balanced conclusion/ stand with suggestions (retention, reintegration programmes, better pay and opportunities, engage diaspora)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'topical-issues-migration'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'B3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'B3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'B3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'B3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', '"In order to realize the vision, the civil service has to be grounded as a robust organization that is apolitical, meritorious, innovative, resilient, and driven by a culture of research and state-of-the-art technology, enabling legislations and indeed the highest ethical standards of its leaders and personnel." (Royal Kasho on Civil Service Reform, 17 December 2020)
How can Bhutanese graduates who join the civil service contribute to realising the Royal Vision? (10 marks)', 'Graduates joining the civil service can help realise His Majesty''s vision by living the qualities named in the Royal Kasho:
1. Apolitical: serve every government and citizen impartially, keeping away from party politics.
2. Highest ethical standards: be honest, punctual and accountable, avoid corruption and favouritism, and use public resources carefully.
3. Meritorious: work hard and deliver results, welcome performance management, and seek advancement only through merit.
4. Innovative and research-driven: bring fresh ideas, question old practices, use data and evidence in decisions, and look for solutions rather than only identifying problems.
5. State-of-the-art technology: develop digital skills and help move services online, making them faster and more transparent.
6. Resilient: adapt to reforms and change, keep learning (through courses, RIGSS and self-study), and work well under pressure.
7. Citizen-centred service: adopt a servant-leader mindset, treating service as a duty and serving everyone equally.
By combining youthful energy and education with these values, new civil servants can make the civil service dynamic and help Bhutan become a developed nation.', null, '[{"point": "Apolitical and ethical: neutrality, integrity, no corruption, highest ethical standards", "marks": 2}, {"point": "Meritorious: work hard, perform, earn promotion on merit, accept performance management", "marks": 2}, {"point": "Innovative and research-driven: new ideas, evidence and data in decisions, problem-solving", "marks": 2}, {"point": "Technology: digital skills, use and promote digital services", "marks": 2}, {"point": "Resilient and service-minded: adapt to reform and change, continuous learning, citizen-centred service, servant-leader", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'topical-issues-civil-service-reform'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'B4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'B4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'B4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'B4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'descriptive', '"As of Wednesday, 27 tourists have confirmed their visit under the new fee. Some have visited and left, some are in the country and some are on the way." (The Signs are Good, Kuensel editorial, 13 August 2022)
How optimistic or sceptical are you about the revised Sustainable Development Fee (SDF) meeting its objective of ''high value, low volume'' tourism? (10 marks)', 'When Bhutan reopened in September 2022, the Sustainable Development Fee was raised from USD 65 to USD 200 per person per night, alongside reforms to improve service standards, aiming at ''high value, low volume'' tourism.
My view is cautiously optimistic. Reasons for optimism: the higher fee attracts visitors who value Bhutan''s culture and nature and spend more per person; fewer tourists reduce pressure on the environment, monasteries and local communities; the fee funds conservation, free health care and education, and carbon-neutral development; and the reforms push hotels, guides and operators to raise quality, strengthening the Bhutan brand as an exclusive destination.
Reasons for scepticism: the sudden increase reduced arrivals at first (only a few dozen tourists in the first weeks), hurting hotels, guides, drivers, handicraft sellers and small businesses that had already suffered during COVID; Bhutan competes with cheaper Himalayan destinations; regional tourists who now pay the fee may travel less; and benefits may not reach rural communities. The government later reduced the fee to USD 100 (2023) and offered incentives, showing the policy needs adjustment.
Overall, the SDF can achieve high value, low volume tourism if it is combined with better products and services, marketing, and support for affected businesses.', null, '[{"point": "Context: SDF raised from USD 65 to USD 200 per night (Sept 2022) with tourism reform; objective high value, low volume - quality visitors, sustainability, funds for conservation/ development", "marks": 2}, {"point": "Clear stand (optimistic/ sceptical/ balanced)", "marks": 1}, {"point": "Reasons for optimism: attracts high-spending, respectful visitors, protects culture and environment, funds conservation and free services, better quality services and standards, brand", "marks": 3.5}, {"point": "Reasons for scepticism: lower arrivals hurt hotels, guides, small businesses and jobs; competition with cheaper destinations; regional tourists; uneven benefits; later reduction to USD 100 shows adjustment needed", "marks": 3.5}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'subjective-tourism-policy'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'C1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'C1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'C1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'C1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'C1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'C1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'descriptive', 'Due to increased instances of substance abuse among youth in Bhutan, random drug tests for teachers and students are being initiated in schools.
What is your assessment of this initiative towards curbing substance abuse among Bhutanese youth? (10 marks)', 'Assessment: random drug testing is a useful step, but it will work only if it is part of a wider, supportive approach.
Benefits: it acts as a deterrent, because students and teachers know they may be tested; it allows early detection, so young people can receive counselling and treatment before addiction becomes severe; testing teachers ensures that role models in schools are drug-free; it helps make schools safer; and the results give data on the real extent of the problem.
Concerns: testing may violate privacy and dignity if not handled confidentially; students who test positive may be stigmatised, labelled or expelled, pushing them out of school and further into drugs; it may make users hide their problem rather than seek help; tests cost money and can give wrong results; and it treats the symptom rather than the causes, such as peer pressure, family problems, stress and lack of recreation.
To be effective, the initiative must be confidential and fair, focus on helping rather than punishing (counselling, rehabilitation and reintegration), involve parents, and go together with awareness programmes, life-skills education, sports and recreation, and strict action against drug suppliers.', null, '[{"point": "Positive effects: deterrence, early detection and intervention/ counselling, safer schools, teachers as role models, data on extent of problem", "marks": 4}, {"point": "Concerns: privacy and dignity, stigma and labelling, possible dropouts or hiding, cost and accuracy of tests, focus on testing rather than causes, need consent and confidentiality", "marks": 4}, {"point": "Overall assessment with conditions: must be part of comprehensive approach - counselling, rehabilitation not punishment, awareness, parents, recreation", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'subjective-youth-and-substance-abuse'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'C2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'C2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'C2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'C2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'C2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'C2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'descriptive', 'Bhutan, still seen across the world as a deeply traditional country, will be sending to the Miss Universe pageant a Miss Bhutan who is openly gay, of mixed ethnicity, and who, despite losing both her parents at a young age, has achieved much on her own terms. (Breaking stereotypes and conventions: Miss Universe Bhutan, The Bhutanese, 11 June 2022)
In your personal view, how does a gay Miss Universe Bhutan reflect on our society? (10 marks)', 'In my view, a gay Miss Universe Bhutan reflects well on our society. It shows that Bhutan is tolerant, inclusive and accepting of diversity. In 2021 Parliament amended the Penal Code to decriminalise homosexuality, and choosing an openly gay woman of mixed ethnicity to represent the nation shows that people are judged by their talent and character rather than by sexual orientation or background. This is consistent with Buddhist values of compassion, respect for all beings and non-discrimination, and with the GNH idea that every person''s wellbeing matters.
It also shows a society that is modern and confident while rooted in tradition, giving equal opportunities to young women and celebrating resilience - she lost both parents young and still achieved much on her own terms, which inspires other young people facing hardship.
At the same time, some people with traditional or conservative views may be uncomfortable, so acceptance should grow through respectful dialogue rather than conflict. Internationally, her participation breaks the stereotype of Bhutan as closed and rigid and presents a positive image of an open, compassionate and progressive country.', null, '[{"point": "Reflects tolerance, acceptance and inclusiveness; Bhutan decriminalised homosexuality (Penal Code amendment 2020/ 2021); Buddhist values of compassion and non-discrimination", "marks": 4}, {"point": "Reflects modern, open and confident society; equal opportunity; youth and women empowerment; resilience (orphan who succeeded); breaks stereotypes", "marks": 3}, {"point": "Balanced view: some traditional/ conservative views remain, need for respect and dialogue; positive image internationally", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'subjective-society-and-values'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'C3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'C3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'C3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'C3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'C3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'C3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'descriptive', '"The 2022 Bhutan Premier League (BPL) next month will witness international players in local clubs, and the tournament is expected to become more competitive among the 10 teams." (Clubs sign international players for 2022 BPL, Kuensel, 20 July 2022)
We are seeing a gradual increase in the inclusion of international players by football clubs in Bhutan. Will the addition of players from outside Bhutan improve the game for Bhutan? (10 marks)', 'Yes, with limits, international players can improve football in Bhutan.
Benefits: foreign players usually bring higher technical skill, fitness and experience, making the league more competitive; local players learn by training and playing alongside them; they bring professionalism, tactical understanding and discipline; a stronger league attracts more spectators, media and sponsors, giving clubs more income; and higher-level competition improves Bhutanese clubs'' performance in AFC competitions and strengthens the national team.
Risks: if clubs rely too much on foreign players, local players get fewer chances, especially young talent; hiring foreigners is costly for clubs with small budgets; and benefits may not reach grassroots football.
Therefore the addition of international players will improve the game if the Bhutan Football Federation keeps a sensible quota on foreign players per team, requires clubs to develop youth academies and play local players, and invests in coaching, facilities and grassroots programmes.', null, '[{"point": "Clear stand", "marks": 1}, {"point": "Benefits: higher standard and competitiveness, local players learn skills, professionalism and discipline, better coaching culture, attracts spectators and sponsors, better performance in AFC competitions/ national team", "marks": 5}, {"point": "Risks/ conditions: fewer chances for local players, cost to clubs, dependence on foreigners; need quota limits, youth development, coaching", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'subjective-sports'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'C4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'C4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'C4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'C4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'C4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'C4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Who received the 2022 Blue Planet Prize along with His Majesty the Fourth Druk Gyalpo?', null, 'The 2022 Blue Planet Prize went to His Majesty the Fourth Druk Gyalpo and climate scientist Professor Veerabhadran Ramanathan.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-bhutan'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'D1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Professor Veerabhadran Ramanathan', true, 1), ('B', 'Professor Jeffrey D. Sachs', false, 2), ('C', 'Professor Tilman', false, 3), ('D', 'Professor Stephen Carpenter', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The clearest and most detailed image of the distant universe ever taken was released on 11 July 2022. Which telescope captured it?', null, 'The James Webb Space Telescope''s first deep field image was released in July 2022.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-science'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'D2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hubble Space Telescope', false, 1), ('B', 'Xuntian Space Telescope', false, 2), ('C', 'James Webb Space Telescope', true, 3), ('D', 'Subaru Telescope', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the largest nuclear power plant in Europe?', null, 'Zaporizhzhia in Ukraine is Europe''s largest nuclear power plant.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-world'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'D3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Zaporizhzhia Nuclear Power Plant', true, 1), ('B', 'Rostov Nuclear Power Plant', false, 2), ('C', 'Khmelnytskyi Nuclear Power Plant', false, 3), ('D', 'Chernobyl Nuclear Power Plant', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Who received the 2021 Booker Prize?', null, 'Damon Galgut won the 2021 Booker Prize for ''The Promise''.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-books'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'D4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'George Saunders for Lincoln in the Bardo', false, 1), ('B', 'Joshua Cohen for The Netanyahus', false, 2), ('C', 'Geetanjali Shree for Tomb of Sand', false, 3), ('D', 'Damon Galgut for The Promise', true, 4)) as v(label, body, ok, pos) where me_q.key = 'D4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which country was the first to give women the right to vote (nationally)?', null, 'New Zealand gave women the vote in 1893.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-world'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'D5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'USA', false, 1), ('B', 'New Zealand', true, 2), ('C', 'Finland', false, 3), ('D', 'UK', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In chess, in what direction can a bishop move?', null, 'A bishop moves diagonally.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-sports'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'D6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Diagonally', true, 1), ('B', 'Horizontally', false, 2), ('C', 'All directions', false, 3), ('D', 'Straight ahead', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of these is part of the United Kingdom?', null, 'The UK is England, Scotland, Wales and Northern Ireland.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-geography'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'D7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Sweden', false, 1), ('B', 'Norway', false, 2), ('C', 'Scotland', true, 3), ('D', 'Iceland', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When was the Domestic Violence Prevention Act of Bhutan enacted by Parliament?', null, 'The Domestic Violence Prevention Act of Bhutan was enacted in 2013.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-bhutan-law'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'D8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2014', false, 1), ('B', '2011', false, 2), ('C', '2012', false, 3), ('D', '2013', true, 4)) as v(label, body, ok, pos) where me_q.key = 'D8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'World Water Day is celebrated every year on 22 March. The theme of World Water Day 2022 was:', null, '2022: ''Groundwater: Making the invisible visible'' (2021 was ''Valuing Water'', 2020 ''Water and Climate Change'').', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-environment'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'D11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Groundwater: Making the invisible visible', true, 1), ('B', 'Valuing Water', false, 2), ('C', 'Water and Climate Change', false, 3), ('D', 'The World''s Water: Is there enough?', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Who received the 2022 UNESCO Peace Prize in recognition of efforts to welcome refugees?', null, 'Former German Chancellor Angela Merkel received the 2022 UNESCO Félix Houphouët-Boigny Peace Prize for welcoming refugees.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-world'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'D12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Joe Biden', false, 1), ('B', 'Narendra Modi', false, 2), ('C', 'Angela Merkel', true, 3), ('D', 'Volodymyr Zelenskyy', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which animal is known as the ''Ghost of the Mountains''?', null, 'The elusive snow leopard is called the ''ghost of the mountains''.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-wildlife'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'D13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Himalayan tahr', false, 1), ('B', 'Yak', false, 2), ('C', 'Brown bear', false, 3), ('D', 'Snow leopard', true, 4)) as v(label, body, ok, pos) where me_q.key = 'D13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which country hosted the 75th Regional Committee Meeting for South-East Asia of the World Health Organization (WHO) from 5 to 9 September 2022?', null, 'The 75th session of the WHO South-East Asia Regional Committee was held in Paro, Bhutan.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-bhutan'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'D15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'India', false, 1), ('B', 'Bhutan', true, 2), ('C', 'Maldives', false, 3), ('D', 'Thailand', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Paro Taktsang can be seen on which Bhutanese currency note?', null, 'Paro Taktsang appears on the Nu 5 note.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-bhutan'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'D16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Fifty-Ngultrum note', false, 1), ('B', 'Ten-Ngultrum note', false, 2), ('C', 'Five-Ngultrum note', true, 3), ('D', 'Twenty-Ngultrum note', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Who is the author of ''The History of the Decline and Fall of the Roman Empire''?', null, 'Edward Gibbon wrote it (1776-1789).', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-books'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'D17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Holinshed', false, 1), ('B', 'Edward Gibbon', true, 2), ('C', 'Macaulay', false, 3), ('D', 'Herodotus', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The number one followed by one hundred zeros is known as a:', null, '10^100 is a googol.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-mathematics'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'D18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Megatron', false, 1), ('B', 'Googol', true, 2), ('C', 'Namonole', false, 3), ('D', 'Gigabyte', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following colours does not appear on the Olympic rings?', null, 'The rings are blue, yellow, black, green and red - no orange.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-sports'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'D19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Yellow', false, 1), ('B', 'Blue', false, 2), ('C', 'Black', false, 3), ('D', 'Orange', true, 4)) as v(label, body, ok, pos) where me_q.key = 'D19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Who is the first person from a tribal community, and the second woman after Pratibha Patil, to become President of India?', null, 'Droupadi Murmu became India''s 15th President in July 2022.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-world'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2022, batch 2", "source": {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'D20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Droupadi Murmu', true, 1), ('B', 'Kiran Bedi', false, 2), ('C', 'Mary Kom', false, 3), ('D', 'Indira Gandhi', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D20';
commit;
