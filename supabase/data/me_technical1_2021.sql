-- ME Paper I (Technical): BCSE 2021, batch 5: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'case-study', 'Case study' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'dzongkha-comprehension', 'Dzongkha comprehension' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'general-knowledge', 'General knowledge' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'topical-issues-environment-and-agriculture', 'Topical issues: environment and agriculture' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'topical-issues-health-and-governance', 'Topical issues: health and governance' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'topical-issues-skills-and-economy', 'Topical issues: skills and economy' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'topical-issues-youth-and-society', 'Topical issues: youth and society' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'translation-english-to-dzongkha', 'Translation: English to Dzongkha' on conflict (subject_id, slug) do nothing;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'Read the following passage (an excerpt from the book ''The Tipping Point'') and answer ALL THREE questions.

Suicide, smoking, and the search for the unsticky cigarette: Case Study (by Malcolm Gladwell)

Not long ago, on the South Pacific islands of Micronesia, a seventeen-year-old boy named Sima got into an argument with his father, He was staying with his family at his grandfather''s house when his father - a stern and demanding man - ordered him out of bed early one morning and told him to find a bamboo pole-knife to harvest breadfruit. Sima spent hours in the village, looking without success for a pole-knife, and when he returned empty-handed, his father was furious. “The family would now go hungry”, he told his son, waving a machete in rage. "Get out of here and go find somewhere else to live."

Sima left his grandfather''s house and walked back to his home village. Along the way, he ran into his fourteen-year- old brother and borrowed a pen. Two hours later, curious about where Sima had gone, his brother went looking for him. He returned to the now empty family house and peered in the window. In the middle of a dark room, hanging slack and still from a noose, was Sima. He was dead. His suicide note read: My life is coming to an end at this time. Now today is a day of sorrow for myself, also a day of suffering for me. But it is a day of celebration for Papa. Today Papa sent me away. Thank you for loving me so little. Sima. Give my farewell to Mama. Mama, you won''t have any more frustration or trouble from your boy. Much love from Sima.

In the early 1960s, suicide on the islands of Micronesia was almost unknown. But for reasons no one quite understands, it then began to rise, steeply and dramatically, by leaps and bounds every year, until by the end of the 1980s there were more suicides per capita in Micronesia than anywhere else in the world. For males between fifteen and twenty-four, the suicide rate in the United States is about 22 per 100,000. In the islands of Micronesia, the rate is about 160 per 100,000 - more than seven times higher. At that level, suicide is almost commonplace, triggered by the smallest of incidents. Sima took his own life because his father yelled at him. In the midst of the Micronesian epidemic, that was hardly unusual. Teens committed suicide on the islands because they saw their girlfriends with another boy, or because their parents refused to give them a few extra dollars for beer. One nineteen-year-old hanged himself because his parents didn''t buy him a graduation gown. One seventeen-year-old hanged himself because he had been rebuked by his older brother for making too much noise. What, in Western cultures, is something rare, random, and deeply pathological, has become in Micronesia a ritual of adolescence, with its own particular rules and symbols. Virtually all suicides on the islands, in fact, are identical variations on Sima''s story. The victim is almost always male. He is in his late teens, unmarried, and living at home. The precipitating event is invariably domestic: a dispute with girlfriends or parents. In three quarters of the cases, the victim had never tried - or even threatened - suicide before. The suicide notes tend to express not depression but a kind of wounded pride and self- pity, a protest against mistreatment. The act itself typically occurs on a weekend night, usually after a bout of drinking with friends. In all but a few cases, the victim observes the same procedure, as if there

were a strict, unwritten protocol about the correct way to take one''s own life. He finds a remote spot or empty house. He takes a rope and makes a noose, but he does not suspend himself, as in a typical Western hanging. He ties the noose to a low branch or a window or a doorknob and leans forward, so that the weight of his body draws the noose tightly around his neck, cutting oil the flow of blood to the brain. Unconsciousness follows. Death results from anoxia - the shortage of blood to the brain.

In Micronesia, the anthropologist Donald Rubinstein writes, these rituals have become embedded in the local culture. As the number of suicides have grown, the idea has fed upon itself, infecting younger and younger boys, and transforming the act itself so that the unthinkable has somehow been rendered thinkable. According to Rubinstein, who has documented the Micronesian epidemic in a series of brilliant papers: Suicide ideation among adolescents appears widespread in certain Micronesian communities and is popularly expressed in recent songs composed locally and aired on Micronesian radio stations, and in graffiti adorning T-shirts and high school walls. A number of young boys who attempted suicide reported that they first saw or heard about it when they were 8 or 10 years old. Their suicide attempts appear in the spirit of imitative or experimental play. One 11-year-old boy, for example, hanged himself inside his house and when found he was already unconscious and his tongue protruding. He later explained that he wanted to "try" out hanging. He said that he did not want to die, although he knew he was risking death. Such cases of imitative suicide attempts by boys as young as five and six have been reported recently from Truk. Several cases of young adolescent suicide deaths recen tly in Micronesia were evidently the outcome of such experiments. Thus, as suicide grows more frequent in these communities the idea itself acquires a certain familiarity if not fascination to young men, and the lethality of the act seems to be trivialized. Especially among some younger boys, the suicide acts appear to have acquired an experimental almost recreational element.

There is something very chilling about this passage. Suicide isn''t supposed to be trivialized like this. But the truly chilling thing about it is how familiar it all seems. Here we have a contagious epidemic of self-destruction, engaged in by youth in the spirit of experimentation, imitation, and rebellion. Here we have a mindless action that somehow, among teenagers, has become an important form of self- expression. In a strange way, the Micronesian teen suicide epidemic sounds an awful lot like the epidemic of teenage smoking in the West.

Teenage smoking is one of the great, baffling phenomena of modern life. No one really knows how to fight it, or even, for that matter, what it is. The principal assumption of the anti-smoking movement has been that tobacco companies persuade teens to smoke by lying to them, by making smoking sound a lot more desirable and a lot less harmful than it really is. To address that problem, then, we''ve restricted and policed cigarette advertising, so it''s a lot harder for tobacco companies to lie. We''ve raised the price of cigarettes and enforced the law against selling tobacco to minors, to try to make it much harder for teens to buy cigarettes. And we''ve run extensive public health campaigns on television and radio and in magazines to try to educate teens about the dangers of smoking.

It has become fairly obvious, however, that this approach isn''t very effective. Why do we think, for example, that the key to fighting smoking is educating people about the risks of cigarettes? Harvard University economist W. Kip Viscusi recently asked a group of smokers to guess how many years of life, on average, smoking from the age of twenty-one onward would cost them. They guessed nine years. The real answer is somewhere around six or seven. Smokers aren''t smokers because they underestimate the risks of smoking. They smoke even though they overestimate the risk of smoking.

At the same time, it is not clear how effective it is to have adults tell teenagers that they shouldn''t smoke. As any parent of a teenage child will tell you, the essential contrariness of adolescents suggests that the more adults inveigh against smoking and lecture teenagers about its dangers, the more teens, paradoxically, will want to try it. Sure enough, if you look at smoking trends over the past decade or so, that is exactly what has happened. The anti-smoking movement has never been louder or more prominent. Yet all signs suggest that among the young the anti-smoking message is backfiring. Between 1993 and 1997, the number of college students who smoke jumped from 22.3 % to 28.5 %. Between 1991 and 1997, the number of high school students who smoke jumped to 32 %. Since 1988, in fact, the total number of teen smokers in the United States has risen an extraordinary 73 %. There are few public health programs in recent years that have fallen as short of their mission as the war on smoking.

The lesson here is not that we should give up trying to fight cigarettes. The point is simply that the way we have tended to think about the causes of smoking doesn''t make a lot of sense. That''s why the epidemic of suicide in Micronesia is so interesting and potentially relevant to the smoking problem. It gives us another way of trying to come to terms with youth smoking. What if smoking, instead of following the rational principles of the marketplace, follows the same kind of mysterious and complex social rules and rituals that govern teen suicide? If smoking really is an epidemic like Micronesian suicide, how does that change the way we ought to fight the problem?

Question 1
What are the similarities between the two cases: the Micronesian epidemic and the smoking epidemic in the US? (10 marks)', 'The author sees several similarities.

First, both are epidemics that mainly affect young people and spread from person to person. In Micronesia, suicide spread as boys heard about it, imitated it and even "tried it out"; teenage smoking in the US also spreads through imitation of peers.

Second, both are acts of experimentation, rebellion and self-expression. Micronesian suicides were a protest against parents or girlfriends; smoking is a way for teenagers to show independence from adults.

Third, both follow social rules and rituals rather than rational thinking. Micronesian suicides followed an almost fixed protocol, and smoking follows its own social codes. As a result, rational approaches fail: smokers smoke even though they overestimate the risks, and the louder adults lecture against smoking, the more teenagers want to try it, just as warnings did not stop suicide from becoming "thinkable" in Micronesia.', null, '[{"point": "Both are ''epidemics'' among youth that spread by imitation and contagion, not reasoning", "marks": 3}, {"point": "Both are acts of experimentation, rebellion and self-expression among teenagers", "marks": 3}, {"point": "Both follow social rules/rituals; information and adult warnings do not stop them (smokers overestimate risks; anti-smoking messages backfire)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'case-study'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2021b5-cs', 1, null)
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
How does the author suggest that the Micronesian epidemic is deeply rooted in the day-to-day practice and culture of the Micronesian youth? (10 marks)', 'The author shows that suicide had become part of everyday youth culture in Micronesia.

It had become "a ritual of adolescence, with its own particular rules and symbols". The victim is almost always a young unmarried male living at home; the trigger is a domestic quarrel; it happens on a weekend night after drinking with friends; and the method follows an unwritten protocol with a noose tied to a low branch or doorknob.

Anthropologist Donald Rubinstein notes that the idea had become embedded in local culture: it appeared in locally composed songs on the radio and in graffiti on T-shirts and school walls. Boys first heard about it at eight or ten, and even five- and six-year-olds attempted it in "imitative or experimental play". As it became familiar, the act was trivialised, so that "the unthinkable has somehow been rendered thinkable".', null, '[{"point": "Suicide became a ''ritual of adolescence'' with set rules: typical victim, trigger, weekend night after drinking, same method", "marks": 4}, {"point": "Embedded in local culture: songs on radio, graffiti on T-shirts and school walls; children hear of it at 8-10", "marks": 3}, {"point": "Imitative ''experimental play'' by young boys; the act trivialised and made thinkable", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'case-study'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2021b5-cs', 2, null)
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
How do you relate the Micronesian epidemic and the smoking epidemic of the US to the smoking habit and the suicide trend among the youth of Bhutan? (10 marks)', 'Similar patterns can be seen in Bhutan.

Smoking and chewing tobacco remain common among young people even though Bhutan has strict tobacco control laws and awareness campaigns. Many young people start because friends do, to look mature or to rebel, just as in the US. Bans and lectures alone have not stopped it; tobacco is still smuggled and shared among peers.

Suicide is a growing concern among Bhutanese youth too. Triggers are often domestic or personal - family conflict, relationships, exam failure, unemployment, often combined with alcohol - and news and social media posts can spread the idea among vulnerable young people, as in Micronesia.

The lesson is that we must treat these as social epidemics: use positive peer leaders, school counsellors and helplines, strengthen family communication, train teachers to spot warning signs, and ensure responsible media reporting that does not glamorise suicide or smoking.', null, '[{"point": "Smoking/tobacco and substance use among Bhutanese youth spread through peers and imitation despite the Tobacco Control Act and awareness", "marks": 3}, {"point": "Youth suicide in Bhutan: rising concern; triggers (family conflict, relationships, exams, unemployment, alcohol); risk of imitation via social media", "marks": 3}, {"point": "Lessons: approaches beyond lectures - peer influencers, counselling, family support, responsible media reporting, helplines", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'case-study'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2021b5-cs', 3, null)
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
  values ('ME', 'long_answer', 'Both formal media and social media seem to praise the way Bhutan managed the Covid-19 pandemic so far. In your opinion, did Bhutan succeed or fail in managing and containing the pandemic so far? What are the factors contributing to either the success or the failure story? (10 marks)', 'In my view Bhutan clearly succeeded in managing the pandemic, recording very few deaths compared with most countries.

The most important factor was the leadership of His Majesty The King, who travelled across the country to guide preparations and personally supported frontline workers. The government acted early: borders were closed, mandatory quarantine and testing were introduced, and lockdowns were imposed quickly when cases appeared.

The vaccination campaign was among the fastest in the world, vaccinating most adults within days, with vaccines from India, the USA and other friends.

De-suups, health workers and volunteers worked tirelessly at borders and quarantine centres, and the Druk Gyalpo''s Relief Kidu supported people who lost incomes. Finally, Bhutanese people cooperated, followed protocols and trusted their leaders. Although the economy suffered, protecting lives was achieved.', null, '[{"point": "Clear view (success)", "marks": 2}, {"point": "Leadership of His Majesty and quick government action (border control, quarantine, lockdowns, testing)", "marks": 3}, {"point": "Vaccination campaign (very high coverage in days) and support from friendly countries", "marks": 2}, {"point": "Desuups, frontline workers and public cooperation; Druk Gyalpo''s Relief Kidu", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'topical-issues-health-and-governance'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
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
  values ('ME', 'long_answer', 'In the past, the human-wildlife conflict was limited to loss of agricultural produce and domestic animals. However, in recent times, the conflict has taken human lives. Suggest practical strategies to solve this human-wildlife conflict. (10 marks)', 'Several practical strategies can reduce the conflict.

First, protect fields and homes physically: electric (solar) fencing and chain-link fences around villages and fields, community guarding schedules, lights and noise alarms, and secure sheds for livestock at night.

Second, support farmers financially through crop and livestock insurance and timely compensation, so that losses do not push families to retaliate against animals.

Third, manage land wisely: keep wildlife corridors and forest food sources intact, avoid cultivating crops that attract animals near forest edges, and encourage alternative crops or relocation of high-risk fields.

Finally, protect people''s lives with awareness on how to behave around bears, elephants and tigers, early-warning systems such as phone alerts when elephants are nearby, and rapid response teams from the forestry department.', null, '[{"point": "Physical protection: electric/solar fencing, chain-link fencing, guarding huts, lighting and noise devices", "marks": 3}, {"point": "Compensation and insurance schemes (crop and livestock insurance)", "marks": 2}, {"point": "Land use and habitat: protect forest food and corridors, avoid farming in wildlife paths, relocate high-risk fields", "marks": 2}, {"point": "Awareness, early-warning and rapid response teams; safe practices for people", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'topical-issues-environment-and-agriculture'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
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
  values ('ME', 'long_answer', 'During the Covid-19 pandemic, the construction sector in Bhutan has suffered due to lack of foreign technical manpower. This went on to show that Bhutan is still dependent on foreign technical skill in the construction sector. How can Bhutan improve technical skill in future? (10 marks)', 'Bhutan can build its own technical workforce in several ways.

First, strengthen technical and vocational education: modernise TTIs, offer practical courses in masonry, carpentry, plumbing, electrical work and machine operation, and link training with real apprenticeships on construction sites, followed by national certification.

Second, change attitudes towards manual work: improve wages, safety, insurance and career paths so that young people see construction as a respectable profession, not a last resort.

Third, provide incentives: programmes like the Build Bhutan Project, requirements for contractors to employ and train a share of Bhutanese workers, and support for mechanisation that needs fewer but more skilled workers.

Finally, use partnerships with foreign firms and experts so that every large project transfers skills to Bhutanese workers.', null, '[{"point": "Strengthen TVET: modern technical training institutes, apprenticeships, certification", "marks": 3}, {"point": "Change attitudes: dignity of blue-collar work, better pay and safety, career paths", "marks": 3}, {"point": "Incentives: Build Bhutan Project-type programmes, contractor quotas for local workers, mechanisation", "marks": 2}, {"point": "Partnerships with industry and foreign experts for skills transfer", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'topical-issues-skills-and-economy'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
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
  values ('ME', 'long_answer', 'Young people worldwide today have trendy perceptions of beauty and body standards that could be detrimental to their health, psychological wellbeing, and social behaviour. Discuss the reality of the situation in Bhutan. (10 marks)', 'Bhutanese youth are not immune to global beauty trends. Through social media, films and K-pop, many young people admire very slim, fair-skinned, "perfect" looks. Fairness creams, cosmetics, hair colouring and fashion are increasingly popular, and some young people diet excessively or use supplements to change their bodies.

These standards can harm health when young people skip meals, take unsafe products or develop eating disorders. They also affect mental wellbeing: comparing themselves with edited photos online leads to low self-esteem, anxiety and depression. Socially, they can lead to body-shaming, bullying and spending money on appearance rather than essentials.

However, many Bhutanese youth still value traditional dress and inner qualities. Schools, parents and media should promote healthy body image, media literacy, sports and the idea that beauty lies in character and kindness.', null, '[{"point": "Reality in Bhutan with examples (social media and K-pop influence, fairness creams, dieting, cosmetics, gym/supplement use)", "marks": 4}, {"point": "Effects on health (eating disorders, unsafe products), mind (low self-esteem, anxiety, comparison) and behaviour (spending, bullying)", "marks": 4}, {"point": "Suggestions", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'topical-issues-youth-and-society'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
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
  values ('ME', 'mcq', 'The International Day of Happiness is celebrated every year on', null, 'The UN International Day of Happiness is 20 March.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '21st March', false, 1), ('B', '20th March', true, 2), ('C', '21st April', false, 3), ('D', '20th April', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The first country to launch an automated (self-driving) train sharing tracks with regular trains is', null, 'Germany (Hamburg S-Bahn, 2021).', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Germany', true, 1), ('B', 'USA', false, 2), ('C', 'UK', false, 3), ('D', 'Japan', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Who is the author of the book ''A Promised Land''?', null, '''A Promised Land'' (2020) is Barack Obama''s memoir.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'J.K. Rowling', false, 1), ('B', 'Shashi Tharoor', false, 2), ('C', 'Mahatma Gandhi', false, 3), ('D', 'Barack Obama', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'What do the five Olympic rings represent?', null, 'The rings stand for the five inhabited continents united by the Olympics.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ethnicity', false, 1), ('B', 'Values', false, 2), ('C', 'Continents', true, 3), ('D', 'Diversity', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'All of the following countries have embassies in Bhutan EXCEPT', null, 'India, Bangladesh and Kuwait have embassies in Thimphu; Thailand does not.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Kuwait', false, 1), ('B', 'Bangladesh', false, 2), ('C', 'Thailand', true, 3), ('D', 'India', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The 2021 Nobel Peace Prize was awarded to the field of', null, 'Journalists Maria Ressa and Dmitry Muratov received the 2021 Nobel Peace Prize.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Journalism', true, 1), ('B', 'Medicine', false, 2), ('C', 'Literature', false, 3), ('D', 'Chemistry', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Lumbini, the birthplace of Gautama Buddha, is in', null, 'Lumbini is in southern Nepal.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Nepal', true, 1), ('B', 'Sri Lanka', false, 2), ('C', 'Sikkim', false, 3), ('D', 'Bihar', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The national flag of Bhutan was first used during', null, 'The first national flag was designed for the signing of the 1949 Indo-Bhutan Treaty.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Bhutan''s admission to the UN in 1971', false, 1), ('B', 'the signing of the Treaty of Sinchula in 1865', false, 2), ('C', 'the signing of the Indo-Bhutan Treaty in 1949', true, 3), ('D', 'Prime Minister Nehru''s visit to Bhutan in 1958', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The DOGE-1 mission to the Moon was to be launched by which company?', null, 'DOGE-1 was announced as a SpaceX rideshare mission.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'NASA', false, 1), ('B', 'Roscosmos', false, 2), ('C', 'ISRO', false, 3), ('D', 'SpaceX', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'From which country did the United States withdraw its troops in 2021?', null, 'US troops left Afghanistan in August 2021.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Afghanistan', true, 1), ('B', 'Yemen', false, 2), ('C', 'Iran', false, 3), ('D', 'Iraq', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'All of the following are Scandinavian countries EXCEPT', null, 'Scandinavia is Denmark, Norway and Sweden.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Denmark', false, 1), ('B', 'Canada', true, 2), ('C', 'Sweden', false, 3), ('D', 'Norway', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'G-77 is a group of', null, 'The Group of 77 is a coalition of developing countries at the UN.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'developing countries', true, 1), ('B', 'underdeveloped countries', false, 2), ('C', 'developed countries', false, 3), ('D', 'the most developed countries', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which of the following is NOT an official language of the UN?', null, 'German is not one of the six official UN languages.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Arabic', false, 1), ('B', 'German', true, 2), ('C', 'French', false, 3), ('D', 'Chinese', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Peace is symbolised by which of the following?', null, 'The olive branch is a traditional symbol of peace.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Blue light', false, 1), ('B', 'Candle flame', false, 2), ('C', 'Lotus', false, 3), ('D', 'Olive branch', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'How many Opposition Party members were there in the National Assembly in 2008-2013?', null, 'The PDP won only 2 of 47 seats in 2008.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3', false, 1), ('B', '8', false, 2), ('C', '2', true, 3), ('D', '7', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The capital of Sweden is', null, 'Stockholm is Sweden''s capital.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Helsinki', false, 1), ('B', 'Ottawa', false, 2), ('C', 'Vienna', false, 3), ('D', 'Stockholm', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'UNIDO stands for', null, 'UNIDO is the UN Industrial Development Organization.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The United Nations Immunology Development Organization', false, 1), ('B', 'The United Nations Industrial Development Organization', true, 2), ('C', 'The United Nations Innovation Development Organization', false, 3), ('D', 'The United Nations Infrastructure Development Organization', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'passage', 'ད་རེས་ནངས་པ་ དཔལ་འབོར་གོང་འཕེལ་འགྱོཝ་དང་གཅིག་ཁར་ མི་གི་བསམ་པ་དང་སྤྱོད་པ་ཡང་ འགྱུར་ཏེ་འགྱོ་མི་ཚུ་ ང་བཅས་ར་ཆོས་དང་ལམ་སྲོལ་ལས་བརྟེན་ཏེ་ བཅོས་ཁ་རྐྱབ་དགོཔ་འདི་ག་ཅི་དེ་ ཁག་ཆེ་བས་ཟེར་ཞུ་ནི་ཨིན། དཔེ་གཏམ་ལས་ འདོདཔ་ཆེནི་ཀུན་དང་བྲལ་ཟེར་སླབ་དོ་བཟུམ་སྦེ་ རྒྱུ་ནོར་ལུ་ཞན་ཆགས་བསྐྱེད་པ་ཅིན་ སེམས་ལུ་ཞི་བདེ་དང་དགའ་སྐྱིད་མེད་པའི་ཁར་ ཤིཝ་ད་ལུ་ཡང་དམྱལ་བར་ལུ་འགྱོ་ནིའི་ལཱ་ཨིནམ་ལས། ཆོས་དང་ལམ་སྲོལ་ལས་བརྟེན་པའི་ རང་གི་སེམས་ལུ་ དགའ་སྐྱིད་དང་ཞི་བདེ་ཐོབ་མི་ཚུགས།དཔེ་གཏམ་ལས་ཡང་ དཔེ་ཅིག་ཡོདན་ ཀུན་གྱིས་ཤེས། མཚམས་ཚོད་ཤེས་ན་མཁས་པའི་རྟགས་ ཟེར་སླབ་དོ་བཟུམ་སྦེ་ ནང་པའི་ཆོས་ལྡན་གྱི་རྒྱལ་ཁབ་ནང་ སྐྱེས་མིའི་མི་སེར་ཚུ་ འདོད་པ་མ་ཆེ་བར་ རྒྱུ་ནོར་ལུ་མཚམས་ཚོད་ཤེས་ཏེ་ མནོ་བསམ་གཏང་ཐངས་དང་བ་བ་སྤྱོད་ལམ་ལེགས་ཤོམ་གྱི་ཐོག་ལས་ གཞན་ལུ་གནོད་པའི་སེམས་འདི་སྤངས་ཞིནམ་ལས་ ཕན་པའི་མནོ་བསམ་གཏང་ཚུགས་པ་ཅིན་ལེགས་ཤོམ་འོང་ནི་ཨིན།

དཔལ་ལྡན་འབྲུག་པའི་རྒྱལ་ཁབ་འདི་ནང་ལུ་ ཆོས་དང་འཇིག་རྟེན་གཉིས་ཀྱི་ལམ་སྲོལ་ཚུ་ རྒྱལ་ཁབ་གཞན་དང་དང་རྩ་ལས་རང་མ་འདྲཝ་སྦེ་ སྔོན་བྱོན་རྒྱལ་བ་གོངམ་དང་ཕམ་བཟང་པོ་ཚུ་གི་མཛད་ཤུལ་ ཡ་མཚན་ཆེ་ཏོག་ཏོ་གི་རྒྱལ་ཡོངས་སྐད་ཡིག་རྫོང་ཁ་དང་ གྱོན་ཆས་གོ་དང་དཀྱི་ར་ སྒྲིག་ལམ་རྣམ་གཞག་ཚུ་ མ་ཉམས་པར་ཧེ་མ་ལས་ད་ལོ་ཚུན་ཚོད་ མི་རབས་བརྒྱུད་དེ་ གོངམ་གིས་འོགམ་ལུ་བྱམས་བརྩེ་དང་སྐྱིད་སྡུག་ འོགམ་གི་གོངམ་ལུ་དད་པ་དང་གུས་ཞབས། ཕམ་དང་བུ་གཞི་གི་འདུ་ཤེས་ སྤུན་ཆའི་བརྩེ་གདུང་། ཉེ་འཁོར་གྱི་ཆ་བཞག། གཉེན་གྲོགས་ཀྱི་དམ་ཚིག། དགའ་མཐུན་གྱི་དག་སྣང་། ཁྱིམ་ཚང་ངོ་ཤེས་འདྲིས་ཤེས་ཅན་གྱི་མི་ཚུ་ལུ་ བརྩེ་བའི་སེམས་རྒྱུན་ཆད་མེད་པར་བསྐྱེད་དགོ།

མི་དང་སེམས་ཅན་ཚུ་ལུ་ ཕན་པ་གཞན་འབད་མ་ཚུགསས་རུང་ ན་བ་ཅིན་ཤི་མ་བཅུག་ཟེར་བའི་བྱམས་པ་དང་ ཤི་བ་ཅིན་ཨའེ་ཚ་ཁ་མ་ཚུད་འབད་ ཟེར་བའི་སྙིང་རྗེ་ སེམས་ཀྱི་གདིང་ལས་རང་བསྐྱེད་དགོཔ་ཨིན། དཔེ་གཏམ་ལས་ཡང་ རོགས་ལུ་སྡུག་བསྔལ་བྱུང་དུས།།རང་ལུ་ཧིང་ཚིམ་མ་འབད།། སྡུག་བསྔལ་རང་ལུ་ འཁོར་ནི་ཡོད་ཟེར་མནོ་དགོཔ་མ་ཚད་ སངས་རྒྱས་རུང་མཉམ་གཅིག། དམྱལ་བར་འགྱོ་རུང་མཉམ་གཅིག། དགའ་ན་དགའ་བའི་ཆ་རོགས། སྐྱོ་ན་སྐྱོ་བའི་ཆ་རོགས། འབད་ནི་གི་མནོ་བསམ་གཏང་ཤེས་དགོ།

དེ་སྦེ་མེན་པར་ རང་བདེ་ཏོག་ཏོ་སྡོད་ནི་ཡོད་པ་ཅིན་ རོགས་དོག ་སར་ཚུད་པ་བལ་ནི་མེད་པའི་མི་ཚུ་གི་ཁ་ལུ་ཉན། རང་གི་གོངམ་དང་ཕམ་སྤུན་ཆ་ཚུ་ལུ་ཞེན་པ་ལོག། ལམ་ལུགས་སྲོལ་བཟང་པོ་ ཆོས་དང་འབྲེལ་བའི་ལཱ་གཞན་འབད་ནི་ཕར་ར་བཞག། ཐཱ་ན་རང་གི་ཕམ་གིས་ བསྟེན་པའི་ཆོས་སྐྱོང་ཚུ་ལུ་ གསོལ་མཆོད་ཕུལ་ཏེ་བསྟེན་མ་ཤེས། རང་གིས་འབད་མིའི་ལཱ་ཚུ་ཡང་ དགེ་བ་དང་སྡིག་པ་ ཕན་པ་དང་གནོད་པ་ག་ཅི་ཨིན་ན་ ཧ་མ་གོཝ་སྦེ་མ་སྡོད་པར་ རྒྱལ་ཁབ་ཀྱི་ཁྱད་ཆོས་བཟང་པོའི་ངོ་རྟགས་ ཆོས་དང་ལམ་སྲོལ་ སྐད་ཡིག་དང་གྱོན་ཆས་ཚུ་ལུ་ བདག་འཛིན་མ་འབད་བར་མར་ཉམས་སོང་པ་ཅིན་ རྒྱལ་ཁབ་ཀྱི་རང་དབང་རང་བཙན་དང་ སྲུང་སྐྱོབ་ལུ་ གནོད་ནི་ཨིནམ་ཤེས་ཏེ་ ཆོས་དང་ལམ་སྲོལ་ བདག་འཛིན་འཐབ་དགོཔ་འདི་ རང་གི་སྲོག་ལས་ལྷག་པའི་ཁག་ཆེཝ་སྦེ་བརྩི་ཤེས་དགོ།

ལྟག་གི་ཡིག་རྒྱུགས་ལྷག་ཞིནམ་ལས་ དྲི་བ་ ཀ་ ཁ་ ག་ གསུམ་གྱི་ལན་བྲིས།

ཀ༽ འོག་གི་དྲི་བ་ཚུ་གི་ལན་བྲིས། (སྐུགས་ ༩)
༡ དཔལ་འབོར་གོང་འཕེལ་འགྱོཝ་དང་གཅིག་ཁར་ མིའི་བསམ་སྤྱོད་འགྱུར་ཏེ་འགྱོ་མི་ཚུ་ བཅོས་ཁ་རྐྱབ་དགོ་པ་ཅིན་ ག་ཅི་གིས་རྐྱབ་དགོཔ་སྦེ་ བཀོད་ནུག་གོ? (༡)
༢ རྒྱུ་ནོར་ལུ་སེམས་ཆགས་པ་ཅིན་ རང་གི་མི་ཚེ་ནང་ལུ་ གནོད་པ་ག་ཅི་རང་འདུག་གོ? གནད་དོན་ ༢ བྲིས། (༢)
༣ རྒྱལ་ཁབ་གཞན་དང་མ་འདྲཝ་སྦེ་ཡོད་པའི་ ཕམ་བཟང་པོའི་མཛད་ཤུལ་གྱི་ལམ་སྲོལ་ ཡིག་རྒྱུགས་འདི་ནང་ཡོད་མི་ ༢ ཐོ་བཀོད་འབད། (༢)
༤ མི་དང་སེམས་ཅན་ཚུ་ལུ་ ཕན་པའི་ལཱ་གཞན་འབད་མ་ཚུགས་རུང་ ག་ཅི་འབད་དགོཔ་སྦེ་ བཀོད་དེ་འདུག་གོ? (༢)
༥ ཁྱོད་ཀྱིས་འབད་བ་ཅིན་ ང་བཅས་རའི་ཆོས་དང་ལམ་སྲོལ་ཚུ་ བདག་འཛིན་འབད་དགོཔ་ཁག་ཆེ་བས་ག? ག་ཅི་འབད? (༢)', '༡ ཆོས་དང་ ལམ་སྲོལ་ལས་ བརྟེན་ཏེ་ བཅོས་ཁ་ རྐྱབ་དགོ།
༢ སེམས་ལུ་ ཞི་བདེ་དང་ དགའ་སྐྱིད་ མེད་པའི་ཁར་ ཤི་བའི་ཤུལ་ལུ་ཡང་ དམྱལ་བར་ འགྱོ་ནིའི་ལཱ་ ཨིན།
༣ རྒྱལ་ཡོངས་སྐད་ཡིག་ རྫོང་ཁ་དང་ གྱོན་ཆས་ གོ་དང་ ཀི་ར། སྒྲིག་ལམ་རྣམ་གཞག།
༤ ཕན་པ་ གཞན་ འབད་མ་ཚུགས་རུང་ ན་བ་ཅིན་ ཤི་མ་བཅུག་ ཟེར་བའི་ བྱམས་པ་དང་ ཤི་བ་ཅིན་ ངན་སོང་ལུ་ མ་ཚུད་འབད་ ཟེར་བའི་ སྙིང་རྗེ་ སེམས་ཀྱི་ གདིང་ལས་ བསྐྱེད་དགོ།
༥ ཁག་ཆེ། ཆོས་དང་ ལམ་སྲོལ་ སྐད་ཡིག་ གྱོན་ཆས་འདི་ རྒྱལ་ཁབ་ཀྱི་ ངོ་རྟགས་ཨིནམ་ལས་ ཉམས་པ་ཅིན་ རང་དབང་རང་བཙན་དང་ སྲུང་སྐྱོབ་ལུ་ གནོད་ནི་ཨིན།', null, '[{"point": "༡ ཆོས་དང་ལམ་སྲོལ་གྱིས།", "marks": 1}, {"point": "༢ སེམས་ལུ་ ཞི་བདེ་དང་ དགའ་སྐྱིད་མེད། ཤི་བའི་ཤུལ་ལུ་ དམྱལ་བར་འགྱོ་ནིའི་ལཱ།", "marks": 2}, {"point": "༣ རྒྱལ་ཡོངས་སྐད་ཡིག་ རྫོང་ཁ། གྱོན་ཆས་ གོ་དང་ ཀི་ར། སྒྲིག་ལམ་རྣམ་གཞག། (གཉིས་)", "marks": 2}, {"point": "༤ ན་བ་ཅིན་ ཤི་མ་བཅུག་ཟེར་བའི་ བྱམས་པ་དང་ ཤི་བ་ཅིན་ … ཟེར་བའི་ སྙིང་རྗེ་ སེམས་ཀྱི་གདིང་ལས་ བསྐྱེད་དགོ།", "marks": 2}, {"point": "༥ ཁག་ཆེ་ - རྒྱུ་མཚན་ (རང་དབང་རང་བཙན་དང་ སྲུང་སྐྱོབ། ངོ་རྐྱང་།)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'dzongkha-comprehension'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 9,
    972, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check it before publishing.", "Real RCSC Dzongkha text from a PDF whose font drops letters; repaired automatically: compare with the PDF."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2021b5-dz', 1, null)
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
  values ('ME', 'passage', 'ཁ༽ འོག་གི་མིང་ཚིག་ཚུ་གི་ རྗོད་ཚིག་བཟོ། (ཡིག་རྒྱུགས་ནང་ལས་ འདྲ་བཤུས་རྐྱབ་མི་ཆོག) (སྐུགས་ ༦x༠.༥=༣)
༡) ངོ་ཤེས་འདྲིས་ཤེས།  ༢) བརྩེ་གདུང་།  ༣) དཔེ་གཏམ།  ༤) གསོལ་མཆོད།  ༥) འཇིག་རྟེན།  ༦) དགའ་སྐྱིད།', '༡ གཡུས་ཚན་འདི་ནང་ མི་ག་ར་ ངོ་ཤེས་འདྲིས་ཤེས་ཅན་ཨིན།
༢ ཨམ་གྱིས་ ཨ་ལུ་ལུ་ བརྩེ་གདུང་ ཆེ་ཏོག་ཏོ་ ཡོད།
༣ རྒན་ཤོས་ཚུ་གིས་ དཔེ་གཏམ་ ལེ་ཤ་ ཤེས།
༤ ལོ་གསར་ནང་ ཆོས་སྐྱོང་ལུ་ གསོལ་མཆོད་ ཕུལཝ་ཨིན།
༥ འཇིག་རྟེན་འདི་ནང་ རྟག་པ་ ག་ནི་ཡང་ མེད།
༦ བཟའ་ཚང་ ག་ར་ དགའ་སྐྱིད་ཀྱི་ ངང་ལུ་ སྡོད་ཡི།', null, '[{"point": "ཚིག་ ༦ ལུ་ རྗོད་ཚིག་ ཀྲིག་ཀྲི་ (ཚིག་རེ་ལུ་ ༠.༥)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'dzongkha-comprehension'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check it before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2021b5-dz', 2, null)
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
  values ('ME', 'passage', 'ག༽ འོག་གི་མིང་ཚིག་ཚུ་གི་ རྣམ་གྲངས་ ཡིག་རྒྱུགས་ནང་ལས་འཚོལ་ཏེ་བྲིས། (སྐུགས་ ༦x༠.༥=༣)
༡) ལེགས་ཤོམ་བཟོ།  ༢) གོ་ལ།  ༣) ཧ་ལས་སི་སི།  ༤) འབད་གཞག་བཅའ་གཞག།  ༥) དགོ་འདོད་ཆེ།  ༦) རྨགཔ་དང་ཨམ་སྲུ།', 'ལེགས་ཤོམ་བཟོ = བཅོས་ཁ་རྐྱབ། གོ་ལ = གྱོན་ཆས། ཧ་ལས་སི་སི = ཡ་མཚན་ཆེ། འབད་གཞག་བཅའ་གཞག = བྱ་བ་སྤྱོད་ལམ། དགོ་འདོད་ཆེ = འདོདཔ་ཆེ། རྨགཔ་དང་ཨམ་སྲུ = ཁྱིམ་ཚང་ (to confirm)', null, '[{"point": "ལེགས་ཤོམ་བཟོ → བཅོས་ཁ་རྐྱབ། གོ་ལ → གྱོན་ཆས། ཧ་ལས་སི་སི → ཡ་མཚན་ཆེ། འབད་གཞག་བཅའ་གཞག → བྱ་བ་སྤྱོད་ལམ། དགོ་འདོད་ཆེ → འདོདཔ་ཆེ། རྨགཔ་དང་ཨམ་སྲུ → ཁྱིམ་ཚང་ / གཉེན་གྲོགས (to confirm) (ཚིག་རེ་ལུ་ ༠.༥)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'dzongkha-comprehension'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check it before publishing.", "Synonyms: a Dzongkha teacher should confirm the expected words from the passage."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2021b5-dz', 3, null)
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
  values ('ME', 'translation', 'འོག་ལུ་ ཨིང་སྐད་ནང་ཡོད་མི་ གསུང་བཤད་འདི་ རྫོང་ཁའི་ཐོག་ལུ་ སྐད་སྒྱུར་འབད་དེ་བྲིས། (སྐུགས་ ༡༥)

Today I speak on behalf of our teachers and students – our teachers will always be committed and dedicated teachers – our students will always be diligent and loyal students – but it is the duty of parents, policy makers and the government to put the right tools in their hands – the right books, the right curriculum, the right direction. For this we must first ask ourselves where do we want to go as an economy, as a democracy, as a nation. In other words, what is the Vision for Bhutan? Then we must build an education system that nurtures people with the right skills, knowledge and training to fulfill this Vision. The sooner we realize this the better. The word Vision is such a profound word and yet one that is so commonly mis-used. I feel that there is no better reason to use this word than to describe the importance of education. For if our Vision for the nation is not contained in the pages of the books that our young children hold, in the words of our teachers as they lead their classrooms, and in the education policies of our governments, then let it be said– we have no Vision.

An excerpt from Address of His Majesty The King during 3rd convocation of the Royal University of Bhutan.', 'ད་རིས་ ང་གིས་ ང་བཅས་རའི་ སློབ་དཔོན་དང་ སློབ་ཕྲུག་ཚུ་གི་ ཚབ་ལུ་ སླབ་ནི་ཨིན། ང་བཅས་རའི་ སློབ་དཔོན་ཚུ་ ནམ་ར་ཨིན་རུང་ དམ་འཆའ་དང་ བརྩོན་ཤུགས་ཅན་གྱི་ སློབ་དཔོན་ཨིནམ་དང་ སློབ་ཕྲུག་ཚུ་ ནམ་ར་ཨིན་རུང་ བརྩོན་འགྲུས་ཅན་དང་ དམ་ཚིག་ཅན་གྱི་ སློབ་ཕྲུག་ཨིན། ཨིན་རུང་ ཁོང་གི་ ལགཔ་ནང་ ལག་ཆས་ ངོ་མ་ - དཔེ་དེབ་ ངོ་མ་ སློབ་རིམ་ ངོ་མ་ ཕྱོགས་ ངོ་མ་ - བཞག་ནི་འདི་ ཕ་མ་ སྲིད་བྱུས་བཟོ་མི་ དང་ གཞུང་གི་ འགན་ཁུར་ཨིན།

དེ་གི་དོན་ལུ་ དང་པ་ ང་བཅས་ཀྱིས་ དཔལ་འབྱོར་ དམངས་གཙོ་ རྒྱལ་ཁབ་ཅིག་སྦེ་ ག་ཏེ་ འགྱོ་ནི་ཨིན་ན་ ཟེར་ རང་ལུ་རང་ དྲི་དགོ། དེ་ཡང་ འབྲུག་གི་ མཐོང་སྣང་ ག་ཅི་ཨིན་ན? དེ་ལས་ མཐོང་སྣང་འདི་ འགྲུབ་ནིའི་དོན་ལུ་ ལག་ཤེས་ ཤེས་ཡོན་ སྦྱོང་བརྡར་ ངོ་མ་ཡོད་པའི་ མི་ཚུ་ གསོ་སྐྱོང་འབད་ཚུགས་པའི་ ཤེས་རིག་ ལམ་ལུགས་ཅིག་ བཟོ་དགོ། འདི་ ཧ་གོ་ནི་ མགྱོགས་དྲགས་ ཅིན་ ལེགས།

མཐོང་སྣང་ ཟེར་མི་ ཚིག་འདི་ དོན་ཟབ་ཏོག་ཏོ་ཅིག་ཨིན་རུང་ ཨ་རྟག་ར་ ལོག་ལག་ལེན་ འཐབ་དོ་ཡོདཔ་ཨིན། ཤེས་རིག་གི་ གལ་གནད་ བཤད་ནི་ལུ་ ཚིག་འདི་ ལག་ལེན་འཐབ་ནི་ལས་ ལྷག་པའི་ རྒྱུ་མཚན་ མེད། གལ་སྲིད་ ང་བཅས་ཀྱི་ རྒྱལ་ཁབ་ཀྱི་ མཐོང་སྣང་འདི་ ང་བཅས་རའི་ ཨ་ལུ་ཚུ་གིས་ བཟུང་བའི་ དཔེ་དེབ་ཀྱི་ ཤོག་ལེབ་ནང་ མེད་པ་ཅིན་ སློབ་ཁང་ འགོ་འདྲེན་འཐབ་བའི་ སློབ་དཔོན་ཚུ་གི་ ཚིག་ནང་ མེད་པ་ཅིན་ དེ་ལས་ གཞུང་གི་ ཤེས་རིག་ སྲིད་བྱུས་ནང་ མེད་པ་ཅིན་ ང་བཅས་ལུ་ མཐོང་སྣང་ མེད་ཟེར་ བཤད་དགོ། (མི་དབང་མངའ་བདག་རིན་པོ་ཆེའི་ རྒྱལ་འཛིན་གཙུག་ལག་སློབ་སྡེའི་ ཤེས་ཚད་སྤྲོད་ཐེངས་ ༣ པའི་ གསུང་བཤད་ལས།)', null, '[{"point": "གནད་དོན་ཕོག་མ་ཕོག་ - དོན་ཚན་ཆ་ཚང་ མ་ལུས་པར།", "marks": 7}, {"point": "ཞེ་ས་ (མི་དབང་མངའ་བདག་རིན་པོ་ཆེའི་ གསུང་བཤད་) ཀྲིག་ཀྲི།", "marks": 3}, {"point": "གོ་རིམ་དང་ སྡེབ་སྦྱོར་ བརྡ་སྤྲོད།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'translation-english-to-dzongkha'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check it before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2021, batch 5", "source": {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'T1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 6.0, 1 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 4.0, 2 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 3.0, 3 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 2.0, 4 from me_q where key = 'T1';
commit;
