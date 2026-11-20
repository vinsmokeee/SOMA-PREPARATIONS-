-- ME Paper I (Technical): BCSE 2020, batch 6: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'case-study', 'Case study' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'general-knowledge', 'General knowledge' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'topical-issues-culture-and-media', 'Topical issues: culture and media' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'topical-issues-economy-and-governance', 'Topical issues: economy and governance' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'topical-issues-education-and-skills', 'Topical issues: education and skills' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'topical-issues-education-and-technology', 'Topical issues: education and technology' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'language-general-knowledge'), 'translation-english-to-dzongkha', 'Translation: English to Dzongkha' on conflict (subject_id, slug) do nothing;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'analytical', 'Read the following passage (an excerpt from ''The Theory of Moral Sentiments'' by Adam Smith) and answer ALL THREE questions.

When we consider the character of any individual, we naturally view it under two different aspects; first, as it may affect his own happiness; and secondly, as it may affect that of other people. The preservation and healthful state of the body seem to be the objects which Nature first recommends to the care of every individual. The appetites of hunger and thirst, the agreeable or disagreeable sensations of pleasure and pain, of heat and cold, etc. may be considered as lessons delivered by the voice of Nature herself, directing him what he ought to choose, and what he ought to avoid, for this purpose. The first lessons which he is taught by those to whom his childhood is entrusted, tend, the greater part of them, to the same purpose. Their principal object is to teach him how to keep out of harm’s way.

As he grows up, he soon learns that some care and foresight are necessary for providing the means of gratifying those natural appetites, of procuring pleasure and avoiding pain, of procuring the agreeable and avoiding the disagreeable temperature of heat and cold. In the proper direction of this care and foresight consists the art of preserving and increasing, what is called his external fortune. Though it is in order to supply the necessities and conveniences of the body that the advantages of external fortune are originally recommended to us, yet we cannot live long in the world without perceiving that the respect of our equals, our credit and rank in the society we live in, depend very much upon the degree in which we possess, or are supposed to possess, those advantages. The desire of becoming the proper objects of this respect, of deserving and obtaining this credit and rank among our equals, is, perhaps, the strongest of all our desires, and our anxiety to obtain the advantages of fortune is accordingly much more excited and irritated by this desire, than by that of supplying all the necessities and conveniences of the body, which are always very easily supplied.

Our rank and credit among our equals, too, depend very much upon, what, perhaps, a virtuous man would wish them to depend entirely, our character and conduct, or upon the confidence, esteem, and good-will, which these naturally excite in the people we live with. The care of the health, of the fortune, of the rank and reputation of the individual, the objects upon which his comfort and happiness in this life are supposed principally to depend, is considered as the proper business of that virtue which is commonly called Prudence.

We suffer more, it has already been observed, when we fall from a better to a worse situation, than we ever enjoy when we rise from a worse to a better. Security, therefore, is the first and the principal object of prudence. It is averse to expose our health, our fortune, our rank, or reputation, to any sort of hazard. It is rather cautious than enterprising, and more anxious to preserve the advantages which we already possess, than forward to prompt us to the acquisition of still greater advantages. The methods of improving our fortune, which it principally recommends to us, are those which expose to no loss or hazard; real knowledge and skill in our trade or profession, assiduity and industry in the exercise of it, frugality, and even some degree of parsimony, in all our expenses.

The prudent man always studies seriously and earnestly to understand whatever he professes to understand, and not merely to persuade other people that he understands it; and though his talents may not always be very brilliant, they are always perfectly genuine. He neither endeavours to impose upon you by the cunning devices of an artful impostor, nor by the arrogant airs of an assuming pedant, nor by the confident assertions of a superficial and impudent pretender. He is not ostentatious even of the abilities which he really possesses. His conversation is simple and modest, and he is averse to all the quackish arts by which other people so frequently thrust themselves into public notice and reputation. For reputation in his profession, he is naturally disposed to rely a good deal upon the solidity of his knowledge and abilities; and he does not always think of cultivating the favour of those little clubs and cabals, who, in the superior arts and sciences, so often erect themselves into the supreme judges of merit; and who make it their business to celebrate the talents and virtues of one another, and to decry whatever can come into competition with them. If he ever connects himself with any society of this kind, it is merely in self-defence, not with a view to impose upon the public, but to hinder the public from being imposed upon, to his disadvantage, by the clamours, the whispers, or the intrigues, either of that particular society, or of some other of the same kind.

The prudent man is always sincere, and feels horror at the very thought of exposing himself to the disgrace which attends upon the detection of falsehood. But though always sincere, he is not always frank and open; and though he never tells anything but the truth, he does not always think himself bound, when not properly called upon, to tell the whole truth. As he is cautious in his actions, so he is reserved in his speech; and never rashly or unnecessarily obtrudes his opinion concerning either things or persons.

The prudent man, though not always distinguished by the most exquisite sensibility, is always very capable of friendship. But his friendship is not that ardent and passionate, but too often transitory affection, which appears so delicious to the generosity of youth and inexperience. It is a sedate, but steady and faithful attachment to a few well-tried and well-chosen companions; in the choice of whom he is not guided by the giddy admiration of shining accomplishments, but by the sober esteem of modesty, discretion, and good conduct. But though capable of friendship, he is not always much disposed to general sociality. He rarely frequents, and more rarely figures in those convivial societies which are distinguished for the jollity and gaiety of their conversation. Their way of life might too often interfere with the regularity of his temperance, might interrupt the steadiness of his industry, or break in upon the strictness of his frugality.

Question 1
According to the author, how is a person''s character perceived and developed? (10 marks)', 'Smith says we view a person''s character from two aspects: how it affects his own happiness, and how it affects the happiness of other people.

Character develops in stages. First, Nature teaches each person to care for the preservation and health of his body through hunger, thirst, pleasure, pain, heat and cold, and those who raise him in childhood teach him mainly to keep out of harm''s way. As he grows up, he learns that care and foresight are needed to provide for these needs, and so he learns to preserve and increase his "external fortune".

He then discovers that the respect of his equals and his rank in society depend on his fortune and, even more, on his character and conduct, which win people''s confidence and goodwill. The desire for this respect becomes one of the strongest desires. Caring for one''s health, fortune, rank and reputation in a wise way is the virtue Smith calls prudence.', null, '[{"point": "Perceived from two aspects: how it affects his own happiness and how it affects other people", "marks": 3}, {"point": "Developed first through nature''s lessons (hunger, thirst, pleasure, pain) and childhood teaching to keep out of harm''s way", "marks": 3}, {"point": "Then through care and foresight for ''external fortune'', the desire for respect, rank and credit among equals, and finally through character and conduct (prudence)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'case-study'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2020b6-cs', 1, null)
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
How does the author use ''Nature'' as an analogy in developing a person''s character? (10 marks)', 'Smith presents Nature as the first teacher of every person. The appetites of hunger and thirst, and the sensations of pleasure and pain, heat and cold, are "lessons delivered by the voice of Nature herself". Like a teacher, Nature directs a person what to choose and what to avoid, so that he keeps his body safe and healthy.

From these natural lessons, a person learns to look ahead and plan to satisfy his needs, and this care and foresight grow into the art of preserving and increasing his fortune, and later into concern for respect and reputation. In this way Smith shows that prudence and good character grow out of natural instincts that are guided and refined by experience and upbringing.', null, '[{"point": "Nature as a teacher whose ''voice'' gives the first lessons: appetites and sensations of pleasure/pain, heat/cold", "marks": 4}, {"point": "These lessons direct what to choose and avoid - the basis of self-preservation and care", "marks": 3}, {"point": "They lead naturally to foresight, prudence and concern for fortune and reputation", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'case-study'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2020b6-cs', 2, null)
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
What are the key characteristics of a prudent man in the essay? (10 marks)', 'Smith describes the prudent man as follows.

He values security above all. He is cautious rather than enterprising and avoids risking his health, fortune or reputation; he improves his fortune through real knowledge and skill in his profession, hard work, and frugality.

He is genuine and modest. He studies seriously to truly understand his work rather than to impress others, never shows off, speaks simply, and relies on the solidity of his abilities rather than flattering cliques.

He is always sincere and fears being caught in a lie, but he is reserved: he does not always tell the whole truth when not asked, and never rashly gives his opinion.

He is capable of steady, faithful friendship with a few carefully chosen companions valued for modesty and good conduct, but he avoids noisy social gatherings that could disturb his temperance, industry and frugality.', null, '[{"point": "Values security; cautious rather than enterprising; improves fortune through real knowledge, skill, hard work and frugality", "marks": 3}, {"point": "Genuine, modest and not ostentatious; relies on solid ability rather than cliques", "marks": 2}, {"point": "Always sincere, but reserved in speech; never rash in opinions", "marks": 2}, {"point": "Capable of steady, faithful friendship with a few well-chosen companions; not given to jolly social gatherings; temperate", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'case-study'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, 'me-technical-1-2020b6-cs', 3, null)
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
  values ('ME', 'long_answer', 'Responding to the thematic redundancy of Bhutanese cinematography, someone shared the following opinion in the Kuensel Opinion forum (July 30, 2020): "I suggest that scriptwriters, directors, producers and actors have to think out of the box to grab the attention of the international community. Bhutanese have numerous values to share with the world, but our movie makers have to capitalise on them." How far do you agree with this opinion? Make an evidence-based argument. (10 marks)', 'I largely agree. Many Bhutanese films repeat similar themes - love triangles, family conflicts, songs and dances often copied from Bollywood - which may attract local audiences but offer little that is new to the world.

Evidence shows that original Bhutanese stories do succeed: "Travellers and Magicians" by Khyentse Norbu won international attention, and later "Lunana: A Yak in the Classroom" was nominated for an Oscar because it told an authentic story about Bhutanese values, rural life and education.

To reach international audiences, filmmakers should explore our culture, Buddhist values, Gross National Happiness, environment and contemporary social issues, invest in good scripts and technical quality, and seek co-productions and festival exposure. Government support through film funds and training would help.', null, '[{"point": "Clear stand", "marks": 2}, {"point": "Evidence of repetitive themes (love triangles, song-and-dance, Bollywood imitation) in local films", "marks": 3}, {"point": "Evidence that unique Bhutanese stories succeed internationally (e.g. Lunana, Travellers and Magicians, festivals)", "marks": 3}, {"point": "Suggestions", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'topical-issues-culture-and-media'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
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
  values ('ME', 'long_answer', 'A BBC journalist, Steph McGovern, once made a very critical statement about vocational education: "If someone chooses a vocational route, why do they not get the same respect in society as someone who just does a pure academic route?" Suggest five robust strategies to the government so that vocational graduates enjoy equal social respect and regard as any other academician does. (10 marks)', '1. Fair pay and career paths: set wage standards and promotion ladders for skilled technicians so that vocational work is financially rewarding.

2. Recognised qualifications: link TVET certificates to a national qualifications framework with pathways to diplomas and degrees, so vocational learners are not seen as "dead ends".

3. Quality institutes: modernise training institutes with up-to-date equipment and industry-linked courses so that graduates are highly skilled and in demand.

4. Change public attitudes: run awareness campaigns, celebrate successful entrepreneurs and craftsmen as role models, and hold national skills competitions and awards.

5. Support self-employment: provide start-up loans, workshops and market access so that vocational graduates can run their own businesses and create jobs for others.', null, '[{"point": "Five strategies, each explained (2 marks each): e.g. better pay and career progression; recognised qualifications and pathways to higher degrees; modern quality TVET institutes; awareness campaigns and role models; entrepreneurship support; national skills competitions and awards", "marks": 10}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'topical-issues-education-and-skills'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
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
  values ('ME', 'long_answer', 'Kuensel (July 23, 2020) reported that the five financial institutions in the country have the highest unresolved budget irregularities (Nu 294.488 million), according to the Royal Audit Authority report 2019. Financial institutions are the backbones of a state''s economic prosperity. In your opinion, where do the areas of flaws lie in our financial institutions? Suggest three practical strategies to make our financial institutions fair and robust. (10 marks)', 'Flaws: the irregularities point to weak governance and internal controls in financial institutions. Loans are sometimes sanctioned without proper appraisal or adequate collateral, monitoring of loan use is poor, and non-performing loans grow. Favouritism and conflicts of interest in lending, and slow follow-up on audit findings, also weaken accountability.

Strategies:
1. Stronger supervision: the Royal Monetary Authority and RAA should conduct regular audits and impose penalties when irregularities are not resolved on time.
2. Transparent, digital processes: use standard credit scoring, the credit information bureau and digital records so that lending decisions are objective and traceable.
3. Accountability and good governance: independent boards, clear codes of conduct, and holding officials personally responsible for losses caused by negligence or misuse, with protection for whistle-blowers.', null, '[{"point": "Areas of flaws (weak loan appraisal and monitoring, non-performing loans, favouritism/conflict of interest, weak internal controls and governance)", "marks": 4}, {"point": "Three practical strategies explained (e.g. stronger RMA supervision and audits; digital systems and transparent lending; accountability for officials; credit information bureau; board independence)", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'topical-issues-economy-and-governance'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
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
  values ('ME', 'long_answer', 'The Ministry of Education has an implicit policy of not permitting school students, while at school, the use of smartphones. However, when the schools were shut down due to the Covid-19 pandemic, every child, irrespective of his or her class level, became absolutely dependent on a smartphone for his or her online education. Should the ministry relax the implicit policy hereafter? Argue for the motion with evidence. (10 marks)', 'The ministry should relax the policy, with clear rules.

During the Covid-19 school closures, smartphones became the classroom: teachers used WhatsApp groups, Google Classroom and video lessons, and students followed BBS and online lessons. This proved that phones can be powerful learning tools rather than only distractions.

Allowing guided use at school would build digital literacy and 21st-century skills, let students research, use educational apps and dictionaries, and prepare them for a digital world and economy. It would also help schools stay ready for any future closure.

The relaxation should come with safeguards: use only during lessons or at set times, age-appropriate rules for younger classes, content filtering on school networks, teaching responsible use and cyber safety, and penalties for misuse. With such balance, the benefits outweigh the risks.', null, '[{"point": "Argues for the motion clearly", "marks": 2}, {"point": "Evidence: phones proved essential for learning during Covid (e-learning, Google Classroom, BBS lessons, WhatsApp groups)", "marks": 3}, {"point": "Benefits: digital literacy, research, 21st-century skills, communication with parents/teachers", "marks": 3}, {"point": "Safeguards with relaxation (guided use, age limits, rules, filtering)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'topical-issues-education-and-technology'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
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
  values ('ME', 'mcq', 'Bhutan became a member of the Universal Postal Union in the year', null, 'Bhutan joined the UPU in 1969, under His Majesty the Third King.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1970', false, 1), ('B', '1980', false, 2), ('C', '1979', false, 3), ('D', '1969', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'In 2020, the human rights group Amnesty International announced it was quitting which country?', null, 'Amnesty halted its operations in India in September 2020.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'India', true, 1), ('B', 'USA', false, 2), ('C', 'China', false, 3), ('D', 'North Korea', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Who among the following won the Nobel Prize for Literature?', null, 'Samuel Beckett won the Literature prize in 1969; the others won Peace or Chemistry prizes.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Philip Noel-Baker', false, 1), ('B', 'Samuel Beckett', true, 2), ('C', 'Linus Pauling', false, 3), ('D', 'Ralph Bunche', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Bhutan''s Economic Development Policy 2016 identified five jewels: hydropower, agriculture, mining, tourism and', null, 'The fifth jewel is Cottage and Small Industries.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Digital Drukyul', false, 1), ('B', 'Foreign Direct Investment', false, 2), ('C', 'Research and Development', false, 3), ('D', 'Cottage and Small Industries', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Edward Jenner''s vaccine of 1796 guarded against', null, 'Jenner''s vaccine protected against smallpox.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Chicken pox', false, 1), ('B', 'Measles', false, 2), ('C', 'Smallpox', true, 3), ('D', 'Rubella', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which country voted for constitutional amendments that let its President remain in power till 2036?', null, 'Russia''s 2020 amendments allow Putin to stay until 2036.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Sudan', false, 1), ('B', 'Russia', true, 2), ('C', 'North Korea', false, 3), ('D', 'China', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The purpose of the United Nations Population Fund (UNFPA) is', null, 'UNFPA works on all of these.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'evolving population policies, family planning and related programmes', false, 1), ('B', 'studying population dynamics', false, 2), ('C', 'All of the above', true, 3), ('D', 'collecting population data', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Where is the BIMSTEC Secretariat located?', null, 'The BIMSTEC Secretariat is in Dhaka.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Dhaka, Bangladesh', true, 1), ('B', 'Colombo, Sri Lanka', false, 2), ('C', 'New Delhi, India', false, 3), ('D', 'Kathmandu, Nepal', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which Indian short film won the Oscar in 2019?', null, '''Period. End of Sentence.'' won Best Documentary Short in 2019.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Kamera', false, 1), ('B', 'Piper', false, 2), ('C', 'India''s Daughters', false, 3), ('D', 'Period. End of Sentence', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The India-Bhutan Treaty of Friendship (1949) was revised in', null, 'The revised Treaty was signed in February 2007.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'February 2007', true, 1), ('B', 'January 2006', false, 2), ('C', 'June 2014', false, 3), ('D', 'December 2016', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The official language of Afghanistan is', null, 'Afghanistan''s official languages are Dari and Pashto.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Afghani', false, 1), ('B', 'Urdu', false, 2), ('C', 'Dari', true, 3), ('D', 'Farsi', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'The Global Peace Index 2019 ranked which country as the most peaceful in the world?', null, 'Iceland has topped the Global Peace Index since 2008.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Japan', false, 1), ('B', 'Denmark', false, 2), ('C', 'Iceland', true, 3), ('D', 'Bhutan', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'With which countries will India collaborate to increase the Asian rhino population?', null, 'The 2019 New Delhi Declaration on Asian Rhinos: India, Bhutan, Nepal, Indonesia and Malaysia.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Bhutan, Nepal, Indonesia and Malaysia', true, 1), ('B', 'Burma, Malaysia, Sri Lanka and Indonesia', false, 2), ('C', 'Nepal, Thailand, Malaysia and Sri Lanka', false, 3), ('D', 'Bangladesh, Burma, Bhutan and Thailand', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which of the following is NOT a correct pairing of business leader and company?', null, 'Warren Buffett leads Berkshire Hathaway, not Walmart.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Elon Musk = Tesla and SpaceX', false, 1), ('B', 'Jeff Bezos = Amazon', false, 2), ('C', 'Bill Gates = Microsoft', false, 3), ('D', 'Warren Buffett = Walmart', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which is the capital of Denmark?', null, 'Copenhagen is Denmark''s capital.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Oslo', false, 1), ('B', 'Copenhagen', true, 2), ('C', 'Stockholm', false, 3), ('D', 'Helsinki', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'Which one of the following is NOT an elected representative of the Local Government?', null, 'The Gaydrung is a civil servant (gewog administrative officer), not elected.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Gaydrung', true, 1), ('B', 'Mangmi', false, 2), ('C', 'Tshogpa', false, 3), ('D', 'Gup', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'mcq', 'What does PESTEL stand for?', null, 'PESTEL: Political, Economic, Social, Technological, Environmental, Legal.', '[]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'C20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Political, Emotional, Sustainable, Technological, Experimental and Legal', false, 1), ('B', 'Political, Economic, Social, Technological, Environmental and Legal', true, 2), ('C', 'Practical, Emotional, Social, Technological, Environmental and Legislative', false, 3), ('D', 'Practical, Economic, Sustainable, Technological, Experimental and Logical', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', 'translation', 'འོག་ལུ་ ཨིང་སྐད་ནང་ཡོད་མི་ གསུང་བཤད་འདི་ རྫོང་ཁའི་ཐོག་ལུ་ སྐད་སྒྱུར་འབད་དེ་བྲིས། (སྐུགས་ ༡༥)

“Our most important long term national goals include: enhancing our security and sovereignty; promoting our unique traditions and cultural heritage; conserving our environment; promoting peaceful and harmonious coexistence with other nations, and enhancing the reputation and national identity of our glorious nation of Palden Drukpa.

Our greatest wealth in human resources is epitomised by our civil servants who serve in every Dzongkhag, Gewog, and village, and should know intimately the most pressing issues, and the concerns and aspirations of the people. At the same time, they are well travelled around the world, so we expect them to be well informed and aware of the outside world. They should be up-to-date with advancements in technology and new practices, and able to use this knowledge for the benefit of our country.

Thus, it is important that the civil servants, equipped with immense knowledge, skills, and experience, render their unstinted support to the government’s endeavour aimed at improving the welfare of the people.”

An excerpt from the English Translation of the 111th National Day Address of His Majesty The King, 17th December 2018.', '"ང་བཅས་རའི་ ཡུན་རིང་གི་ རྒྱལ་ཡོངས་དམིགས་དོན་ གལ་ཆེ་ཤོས་ཚུ་ནང་ རྒྱལ་ཁབ་ཀྱི་ ཉེན་སྲུང་དང་ རང་དབང་ ཤུགས་ཅན་བཟོ་ནི། ང་བཅས་རའི་ ཐུན་མོང་མ་ཡིན་པའི་ ལམ་སྲོལ་དང་ སྔར་སྲོལ་གྱི་ ཤུལ་བཞག་ ཡར་དྲག་གཏང་ནི། མཐའ་འཁོར་ ཉམས་སྲུང་འབད་ནི། རྒྱལ་ཁབ་གཞན་དང་ ཞི་བདེ་དང་ མཐུན་ལམ་གྱི་ཐོག་ལས་ མཉམ་སྡོད་ ཡར་དྲག་གཏང་ནི། དེ་ལས་ དཔལ་ལྡན་འབྲུག་པའི་ རྒྱལ་ཁབ་ཀྱི་ མཚན་སྙན་དང་ རྒྱལ་ཡོངས་ངོ་རྐྱང་ ཡར་སེང་གཏང་ནི་ཚུ་ ཚུདཔ་ཨིན།

ང་བཅས་རའི་ མི་སྟོབས་ཀྱི་ ནོར་ ཆེ་ཤོས་འདི་ རྫོང་ཁག་ རྒེད་འོག་ དེ་ལས་ གཡུས་ཚན་ ག་ར་ནང་ ཞབས་ཏོག་ཞུ་མི་ ཞི་གཡོག་པ་ཚུ་ཨིན། ཁོང་གིས་ མི་སེར་ཚུ་གི་ གནད་དོན་ འཕྲལ་མཁོ་ཅན་ དང་ ཁོང་གི་ མནོ་བསམ་ རེ་བ་ཚུ་ ཧ་གོ་དགོ། དེ་བཟུམ་སྦེ་ ཁོང་ འཛམ་གླིང་ ནང་ ལེ་ཤ་ འགྲུལ་སྐྱོད་འབད་དེ་ཡོདཔ་ལས་ ཕྱི་རྒྱལ་གྱི་ གནས་ཚུལ་ ཤེས་དགོ། ཚན་རིག་དང་ ལམ་ལུགས་གསརཔ་ཚུ་ ཤེས་ཏེ་ རྒྱལ་ཁབ་ཀྱི་ ཁེ་ཕན་གྱི་དོན་ལུ་ ལག་ལེན་འཐབ་ཚུགས་དགོ།

དེ་འབདཝ་ལས་ ཤེས་ཡོན་ ལག་ཤེས་ ཉམས་མྱོང་ ཆེ་བའི་ ཞི་གཡོག་པ་ཚུ་གིས་ མི་སེར་གྱི་ བདེ་ཐབས་ ཡར་དྲག་གཏང་ནིའི་ གཞུང་གི་ བརྩོན་ཤུགས་ལུ་ རྒྱབ་སྐྱོར་ ཆ་ཚང་ ཞུ་དགོཔ་ གལ་ཆེ།" (སྤྱི་ལོ་ ༢༠༡༨ སྤྱི་ཟླ་ ༡༢ པའི་ ཚེས་ ༡༧ ལུ་ མི་དབང་མངའ་བདག་རིན་པོ་ཆེའི་ རྒྱལ་ཡོངས་དུས་ཆེན་ ཐེངས་ ༡༡༡ པའི་ གསུང་བཤད་ལས།)', null, '[{"point": "གནད་དོན་ཕོག་མ་ཕོག་ - དོན་ཚན་ཆ་ཚང་ མ་ལུས་པར།", "marks": 7}, {"point": "ཞེ་ས་ (མི་དབང་མངའ་བདག་རིན་པོ་ཆེའི་ གསུང་བཤད།) དང་ ཚིག་ངོ་མ།", "marks": 3}, {"point": "གོ་རིམ་དང་ སྡེབ་སྦྱོར་ བརྡ་སྤྲོད།", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'language-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'language-general-knowledge') and t.slug = 'translation-english-to-dzongkha'), (select id from public.exam_papers where code = 'me-technical-1'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Dzongkha: please have a fluent Dzongkha reader check it before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper I (Technical): BCSE 2020, batch 6", "source": {"title": "BCSE 2020 Main Examination, Technical category, Paper I (Language and GK)", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-1/"}}'::jsonb, null, null, null)
  returning id
)
insert into me_q select 'T1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).', 6.0, 1 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 4.0, 2 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).', 3.0, 3 from me_q where key = 'T1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points.', 2.0, 4 from me_q where key = 'T1';
commit;
