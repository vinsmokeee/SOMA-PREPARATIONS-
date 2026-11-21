-- ME Paper II (General): BCSE 2023, batch 2: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'case-study-and-comprehension', 'Case study and comprehension' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge', 'General knowledge' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-bhutan', 'General knowledge: Bhutan' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-bhutan-constitution', 'General knowledge: Bhutan constitution' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-bhutan-culture', 'General knowledge: Bhutan culture' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-bhutan-government', 'General knowledge: Bhutan government' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-bhutan-law', 'General knowledge: Bhutan law' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-books', 'General knowledge: books' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-geography', 'General knowledge: geography' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-management', 'General knowledge: management' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-science', 'General knowledge: science' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-sports', 'General knowledge: sports' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-technology', 'General knowledge: technology' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'general-knowledge-world', 'General knowledge: world' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'subjective-agriculture-and-land-use', 'Subjective: agriculture and land use' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'subjective-civil-service', 'Subjective: civil service' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'subjective-health-and-lifestyle', 'Subjective: health and lifestyle' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'subjective-youth-and-drugs', 'Subjective: youth and drugs' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'topical-issues-economy-and-development', 'Topical issues: economy and development' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'topical-issues-education-and-child-protection', 'Topical issues: education and child protection' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'topical-issues-governance-and-service-delivery', 'Topical issues: governance and service delivery' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-general-knowledge'), 'topical-issues-judiciary-and-rule-of-law', 'Topical issues: judiciary and rule of law' on conflict (subject_id, slug) do nothing;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'analytical', 'Read the article below and answer ALL FOUR questions that follow.

CIVIL SERVANTS’ MINDSET FOR 21st CENTURY BHUTAN

The four mindsets that could be cultivated or promoted in our civil service are:

The Servant-Leader Mindset

Civil servants are paid to serve the larger public or national interests, including policy formulation, planning and strategizing, policy implementation, resource mobilization and utilization, infrastructure development, monitoring and evaluation, public service delivery etc. Because civil servants are paid to do what we are expected or entrusted to do, the most undesirable mindset in civil servants will be to think that we are doing someone a favour. The work civil servants do is not charity.

But public service, in its true sense, is much more profound and transcends any monetary equation. Ideally, civil servants should be intrinsically motivated by the service we can render in the form of the work we do. We should be driven by the impacts that our sincerity and hard work will have on the wellbeing of fellow citizens and our nation at large. In the civil service, we (ought to) live more for others than for ourselves, that indeed is the true purpose of civil service. A doctor should be driven by the lives he can save or the pains he can mitigate. Similarly, a teacher should be driven by the possible impact of his students on the future of our nation. No quantum of money can buy such a level of inspiration and fulfilment.

The mindset we ought to have in the civil service is that of a servant-leader. “The servant-leader is servant first… It begins with the natural feeling that one wants to serve, to serve first. With the loyalty of a servant and the competency of a leader, there is no doubt that Bhutan’s civil servants will serve our public better and navigate the complexities of the 21st century. But first, we need to discover the “servant” in the civil servant.

The Entrepreneurial Mindset

The draft 21st Century Economic Roadmap for Bhutan highlights how excessive regulation, bureaucratic red-tapism and indifference in the civil service are painful bottlenecks in our system, particularly for businesses. Many of us in the civil service know this. Perhaps we have a great opportunity now to change it, and change must begin with oneself.

If our country has to become self-reliant and a fully developed country during our lifetime as envisioned by His Majesty The King, civil servants will increasingly need to shift gear towards a more entrepreneurial mindset. Civil servants need not do business but we need to have the business acumen as a part of our competency. We have the potential to be more decisive, innovative and risk-taking. We need to graduate from the existing fail-safe mentality.

A robust and resilient economy, high income and high living standards are necessary imperatives of a developed country. If we have this realization, it won’t be difficult for our fellow civil servants in the Ministries of Agriculture or Economic Affairs, the Tourism Council of Bhutan or the Thimphu Thromde to formulate plans and policies that will help generate more revenues for our economy.

These are random examples; civil servants across government agencies can do the same, one way or the other. If civil servants have an entrepreneurial mindset, we would see, or better still create, opportunities beyond the regulatory horizons.

If we are to become a developed country in our generation, it will be imperative to promote an entrepreneurial mindset in our civil service – a mindset that values time, innovation, efficiency, partnership, data, risk-taking and money. It is about time that we rethink the belief, or the myth, that we are happy with less.

The Growth-Mindset

A fixed mindset assumes that our character, intelligence, and creative ability are static given which we can’t change in any meaningful ways; a growth mindset thrives on the challenge and sees failure not as evidence of unintelligence but as a heartening springboard for growth and for stretching our existing abilities. In a growth mindset, people believe that their most basic abilities can be developed through dedication and hard work (Carol Dweck).

Nobody knows everything under the sun. But today, we have the opportunity and the resources to know as much as we need to, or wish to. All we need is a bit of humility to acknowledge that we don’t know everything, the openness to learn, and the belief that we can get better through our efforts. In a recent RIGSS Podcast interview, the Resident Representative of UNDP Bhutan, Ms. Azusa Kubota, highlighted the need for “humility” as a part of building capabilities. She said “The first humility is to really admit that we all need to embrace the fact that we don’t know many things happening around us and we certainly don’t know our future; acknowledging this requires courage and also this will allow us to seek support in defining what it is that we don’t know”.

In the Bhutanese civil service, the assurance of job security irrespective of how much we know or don’t know, or how much we perform or don’t perform, seems to be one of the biggest inhibitors of the growth mindset. The inability of the system to differentiate civil servants based on merit leads to a perception of lack of recognition to those who invest time and effort to learn more and do better. The world around us is fast changing; the only way the bureaucracy can catch up and stay ahead and relevant is by bureaucrats embracing a growth mindset. A growth mindset will help us know more, innovate, solve problems and dream bigger. It will help us achieve higher levels of motivation and performance. A growth mindset will allow us to embrace change. With a growth mindset, it’s not about how good you are, it’s rather about how good you want to be. And sky is the only limit.

The Problem-Solving Mindset

In a recent zoom conference, author and social entrepreneur Tami Simon was asked about the mindset of employees in her company that makes her company do so well. The mindset, she said, is: “You have a problem? Let me solve it.”

We are generally good at problem identification or definition, which no doubt is important. For example, most of us today can talk about the problems the COVID-19 pandemic has inflicted upon us as a nation, such as unemployment, dwindling economic growth, food security etc. We now need to move towards finding solutions, which is most important.

Those with a problem-solving mindset embrace problems rather than shun them. They see opportunities. And embracing problems is perhaps the starting point to finding solutions. In times of massive uncertainty like today, problems are varied and never-ending, and the only way to move forward and do better is by discussing and discovering solutions to our problems. Our attitude towards problems, whether we embrace them or shun them, would make all the difference.

Bhutan’s civil service has the best of brains and a wealth of experience. We are solving a lot of problems, and we can do so much more. We are capable of taking that “dragonfly eye view” of problems so that we see threats and opportunities beyond the periphery of vision (McKinsey Quarterly, Sep. 2020). The ability to view things with a 360 degrees lens is crucial for each and every Bhutanese, particularly those of us bestowed with the trust of public service. If we realize that we can, and must, solve our own problems, then we can. If we have a problem-solving mindset, everything else towards finding solutions will follow.

Question 1
Explain the significance of the statement "The work civil servants do is not charity," and discuss the implication of this perspective on the mindset and approach of civil servants towards their duties and responsibilities. (10 marks)', 'The statement means that civil servants are paid, from public money, to do the work they are entrusted with - formulating policies, delivering services, building infrastructure. When a civil servant issues a licence, treats a patient or teaches a class, he or she is not doing the citizen a favour; the citizen is entitled to that service, and the civil servant is obliged to provide it. Treating duty as charity leads to arrogance, delays, favouritism and the expectation of gifts or personal connections.
Implications for mindset and approach:
1. Accountability: civil servants must account for their time, resources and results to the public that pays them.
2. Professionalism and courtesy: every citizen should be served promptly, politely and equally, without needing to ''know someone'' in the office.
3. Integrity: no favouritism, bribes or expectation of rewards for doing one''s job.
4. Efficiency and citizen focus: reducing red tape and waiting times, because the public''s time is valuable.
5. Going beyond the pay: the passage adds that true public service transcends money - civil servants should be intrinsically motivated by the impact of their work on citizens'' wellbeing, like a doctor driven by the lives he saves. This leads to the servant-leader mindset: serving first, with the loyalty of a servant and the competence of a leader.', null, '[{"point": "Significance: civil servants are paid with public money to serve; service is a duty/ obligation, not a favour or personal kindness; citizens are entitled to services", "marks": 4}, {"point": "Implications for mindset and approach: accountability, professionalism, punctuality, courtesy, no favouritism/ ''knowing someone'', no expectation of gifts, efficiency, citizen-centred service; and going beyond - intrinsic motivation, servant-leader, service with dedication", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'case-study-and-comprehension'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-general-2-2023b2-a', 1, null, null, null, null)
  returning id
)
insert into me_q select 'A1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'A1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'A1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'A1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'analytical', 'Read the article below and answer ALL FOUR questions that follow.

CIVIL SERVANTS’ MINDSET FOR 21st CENTURY BHUTAN

The four mindsets that could be cultivated or promoted in our civil service are:

The Servant-Leader Mindset

Civil servants are paid to serve the larger public or national interests, including policy formulation, planning and strategizing, policy implementation, resource mobilization and utilization, infrastructure development, monitoring and evaluation, public service delivery etc. Because civil servants are paid to do what we are expected or entrusted to do, the most undesirable mindset in civil servants will be to think that we are doing someone a favour. The work civil servants do is not charity.

But public service, in its true sense, is much more profound and transcends any monetary equation. Ideally, civil servants should be intrinsically motivated by the service we can render in the form of the work we do. We should be driven by the impacts that our sincerity and hard work will have on the wellbeing of fellow citizens and our nation at large. In the civil service, we (ought to) live more for others than for ourselves, that indeed is the true purpose of civil service. A doctor should be driven by the lives he can save or the pains he can mitigate. Similarly, a teacher should be driven by the possible impact of his students on the future of our nation. No quantum of money can buy such a level of inspiration and fulfilment.

The mindset we ought to have in the civil service is that of a servant-leader. “The servant-leader is servant first… It begins with the natural feeling that one wants to serve, to serve first. With the loyalty of a servant and the competency of a leader, there is no doubt that Bhutan’s civil servants will serve our public better and navigate the complexities of the 21st century. But first, we need to discover the “servant” in the civil servant.

The Entrepreneurial Mindset

The draft 21st Century Economic Roadmap for Bhutan highlights how excessive regulation, bureaucratic red-tapism and indifference in the civil service are painful bottlenecks in our system, particularly for businesses. Many of us in the civil service know this. Perhaps we have a great opportunity now to change it, and change must begin with oneself.

If our country has to become self-reliant and a fully developed country during our lifetime as envisioned by His Majesty The King, civil servants will increasingly need to shift gear towards a more entrepreneurial mindset. Civil servants need not do business but we need to have the business acumen as a part of our competency. We have the potential to be more decisive, innovative and risk-taking. We need to graduate from the existing fail-safe mentality.

A robust and resilient economy, high income and high living standards are necessary imperatives of a developed country. If we have this realization, it won’t be difficult for our fellow civil servants in the Ministries of Agriculture or Economic Affairs, the Tourism Council of Bhutan or the Thimphu Thromde to formulate plans and policies that will help generate more revenues for our economy.

These are random examples; civil servants across government agencies can do the same, one way or the other. If civil servants have an entrepreneurial mindset, we would see, or better still create, opportunities beyond the regulatory horizons.

If we are to become a developed country in our generation, it will be imperative to promote an entrepreneurial mindset in our civil service – a mindset that values time, innovation, efficiency, partnership, data, risk-taking and money. It is about time that we rethink the belief, or the myth, that we are happy with less.

The Growth-Mindset

A fixed mindset assumes that our character, intelligence, and creative ability are static given which we can’t change in any meaningful ways; a growth mindset thrives on the challenge and sees failure not as evidence of unintelligence but as a heartening springboard for growth and for stretching our existing abilities. In a growth mindset, people believe that their most basic abilities can be developed through dedication and hard work (Carol Dweck).

Nobody knows everything under the sun. But today, we have the opportunity and the resources to know as much as we need to, or wish to. All we need is a bit of humility to acknowledge that we don’t know everything, the openness to learn, and the belief that we can get better through our efforts. In a recent RIGSS Podcast interview, the Resident Representative of UNDP Bhutan, Ms. Azusa Kubota, highlighted the need for “humility” as a part of building capabilities. She said “The first humility is to really admit that we all need to embrace the fact that we don’t know many things happening around us and we certainly don’t know our future; acknowledging this requires courage and also this will allow us to seek support in defining what it is that we don’t know”.

In the Bhutanese civil service, the assurance of job security irrespective of how much we know or don’t know, or how much we perform or don’t perform, seems to be one of the biggest inhibitors of the growth mindset. The inability of the system to differentiate civil servants based on merit leads to a perception of lack of recognition to those who invest time and effort to learn more and do better. The world around us is fast changing; the only way the bureaucracy can catch up and stay ahead and relevant is by bureaucrats embracing a growth mindset. A growth mindset will help us know more, innovate, solve problems and dream bigger. It will help us achieve higher levels of motivation and performance. A growth mindset will allow us to embrace change. With a growth mindset, it’s not about how good you are, it’s rather about how good you want to be. And sky is the only limit.

The Problem-Solving Mindset

In a recent zoom conference, author and social entrepreneur Tami Simon was asked about the mindset of employees in her company that makes her company do so well. The mindset, she said, is: “You have a problem? Let me solve it.”

We are generally good at problem identification or definition, which no doubt is important. For example, most of us today can talk about the problems the COVID-19 pandemic has inflicted upon us as a nation, such as unemployment, dwindling economic growth, food security etc. We now need to move towards finding solutions, which is most important.

Those with a problem-solving mindset embrace problems rather than shun them. They see opportunities. And embracing problems is perhaps the starting point to finding solutions. In times of massive uncertainty like today, problems are varied and never-ending, and the only way to move forward and do better is by discussing and discovering solutions to our problems. Our attitude towards problems, whether we embrace them or shun them, would make all the difference.

Bhutan’s civil service has the best of brains and a wealth of experience. We are solving a lot of problems, and we can do so much more. We are capable of taking that “dragonfly eye view” of problems so that we see threats and opportunities beyond the periphery of vision (McKinsey Quarterly, Sep. 2020). The ability to view things with a 360 degrees lens is crucial for each and every Bhutanese, particularly those of us bestowed with the trust of public service. If we realize that we can, and must, solve our own problems, then we can. If we have a problem-solving mindset, everything else towards finding solutions will follow.

Question 2
As an aspiring future civil servant, assess your readiness in adopting a growth mindset. Explore two distinct personal attributes that exemplify your possession of a growth mindset. (10 marks)', 'A growth mindset, as Carol Dweck explains, is the belief that our abilities can be developed through dedication and hard work, and that failure is a springboard for growth rather than proof that we are not capable. The passage adds that it requires humility - admitting we do not know everything - and openness to learn.
Assessment of my readiness: I believe I am largely ready. I enjoy learning new things and do not see my abilities as fixed. However, I know I sometimes feel discouraged by setbacks and need to keep working on accepting criticism calmly; I am aware of this and actively work on it.
Two attributes that show my growth mindset:
1. Learning from failure (resilience): when I did not clear an examination or performed poorly in a project, I analysed what went wrong, changed my study methods, asked teachers for help and tried again - and improved. I treat mistakes as lessons, not as defeat.
2. Curiosity and continuous learning: I regularly teach myself new skills - for example computer applications, data tools or a new language - through online courses and practice, and I seek feedback from others to improve. In the civil service I would apply this by volunteering for new tasks, learning from colleagues, and adapting to new systems and reforms.
With humility and effort, I would aim not to be content with how good I am, but focus on how good I want to be.', null, '[{"point": "Understands growth mindset (Dweck): abilities developed through effort, failure as springboard, humility and openness to learn - vs fixed mindset", "marks": 2}, {"point": "Honest self-assessment of readiness with examples (strengths and areas to improve)", "marks": 3}, {"point": "Two distinct personal attributes each illustrated with a concrete example (e.g. learning from failure/ resilience, curiosity and continuous learning, seeking and using feedback, humility, embracing challenges, persistence)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'case-study-and-comprehension'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-general-2-2023b2-a', 2, null, null, null, null)
  returning id
)
insert into me_q select 'A2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'A2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'A2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'A2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'analytical', 'Read the article below and answer ALL FOUR questions that follow.

CIVIL SERVANTS’ MINDSET FOR 21st CENTURY BHUTAN

The four mindsets that could be cultivated or promoted in our civil service are:

The Servant-Leader Mindset

Civil servants are paid to serve the larger public or national interests, including policy formulation, planning and strategizing, policy implementation, resource mobilization and utilization, infrastructure development, monitoring and evaluation, public service delivery etc. Because civil servants are paid to do what we are expected or entrusted to do, the most undesirable mindset in civil servants will be to think that we are doing someone a favour. The work civil servants do is not charity.

But public service, in its true sense, is much more profound and transcends any monetary equation. Ideally, civil servants should be intrinsically motivated by the service we can render in the form of the work we do. We should be driven by the impacts that our sincerity and hard work will have on the wellbeing of fellow citizens and our nation at large. In the civil service, we (ought to) live more for others than for ourselves, that indeed is the true purpose of civil service. A doctor should be driven by the lives he can save or the pains he can mitigate. Similarly, a teacher should be driven by the possible impact of his students on the future of our nation. No quantum of money can buy such a level of inspiration and fulfilment.

The mindset we ought to have in the civil service is that of a servant-leader. “The servant-leader is servant first… It begins with the natural feeling that one wants to serve, to serve first. With the loyalty of a servant and the competency of a leader, there is no doubt that Bhutan’s civil servants will serve our public better and navigate the complexities of the 21st century. But first, we need to discover the “servant” in the civil servant.

The Entrepreneurial Mindset

The draft 21st Century Economic Roadmap for Bhutan highlights how excessive regulation, bureaucratic red-tapism and indifference in the civil service are painful bottlenecks in our system, particularly for businesses. Many of us in the civil service know this. Perhaps we have a great opportunity now to change it, and change must begin with oneself.

If our country has to become self-reliant and a fully developed country during our lifetime as envisioned by His Majesty The King, civil servants will increasingly need to shift gear towards a more entrepreneurial mindset. Civil servants need not do business but we need to have the business acumen as a part of our competency. We have the potential to be more decisive, innovative and risk-taking. We need to graduate from the existing fail-safe mentality.

A robust and resilient economy, high income and high living standards are necessary imperatives of a developed country. If we have this realization, it won’t be difficult for our fellow civil servants in the Ministries of Agriculture or Economic Affairs, the Tourism Council of Bhutan or the Thimphu Thromde to formulate plans and policies that will help generate more revenues for our economy.

These are random examples; civil servants across government agencies can do the same, one way or the other. If civil servants have an entrepreneurial mindset, we would see, or better still create, opportunities beyond the regulatory horizons.

If we are to become a developed country in our generation, it will be imperative to promote an entrepreneurial mindset in our civil service – a mindset that values time, innovation, efficiency, partnership, data, risk-taking and money. It is about time that we rethink the belief, or the myth, that we are happy with less.

The Growth-Mindset

A fixed mindset assumes that our character, intelligence, and creative ability are static given which we can’t change in any meaningful ways; a growth mindset thrives on the challenge and sees failure not as evidence of unintelligence but as a heartening springboard for growth and for stretching our existing abilities. In a growth mindset, people believe that their most basic abilities can be developed through dedication and hard work (Carol Dweck).

Nobody knows everything under the sun. But today, we have the opportunity and the resources to know as much as we need to, or wish to. All we need is a bit of humility to acknowledge that we don’t know everything, the openness to learn, and the belief that we can get better through our efforts. In a recent RIGSS Podcast interview, the Resident Representative of UNDP Bhutan, Ms. Azusa Kubota, highlighted the need for “humility” as a part of building capabilities. She said “The first humility is to really admit that we all need to embrace the fact that we don’t know many things happening around us and we certainly don’t know our future; acknowledging this requires courage and also this will allow us to seek support in defining what it is that we don’t know”.

In the Bhutanese civil service, the assurance of job security irrespective of how much we know or don’t know, or how much we perform or don’t perform, seems to be one of the biggest inhibitors of the growth mindset. The inability of the system to differentiate civil servants based on merit leads to a perception of lack of recognition to those who invest time and effort to learn more and do better. The world around us is fast changing; the only way the bureaucracy can catch up and stay ahead and relevant is by bureaucrats embracing a growth mindset. A growth mindset will help us know more, innovate, solve problems and dream bigger. It will help us achieve higher levels of motivation and performance. A growth mindset will allow us to embrace change. With a growth mindset, it’s not about how good you are, it’s rather about how good you want to be. And sky is the only limit.

The Problem-Solving Mindset

In a recent zoom conference, author and social entrepreneur Tami Simon was asked about the mindset of employees in her company that makes her company do so well. The mindset, she said, is: “You have a problem? Let me solve it.”

We are generally good at problem identification or definition, which no doubt is important. For example, most of us today can talk about the problems the COVID-19 pandemic has inflicted upon us as a nation, such as unemployment, dwindling economic growth, food security etc. We now need to move towards finding solutions, which is most important.

Those with a problem-solving mindset embrace problems rather than shun them. They see opportunities. And embracing problems is perhaps the starting point to finding solutions. In times of massive uncertainty like today, problems are varied and never-ending, and the only way to move forward and do better is by discussing and discovering solutions to our problems. Our attitude towards problems, whether we embrace them or shun them, would make all the difference.

Bhutan’s civil service has the best of brains and a wealth of experience. We are solving a lot of problems, and we can do so much more. We are capable of taking that “dragonfly eye view” of problems so that we see threats and opportunities beyond the periphery of vision (McKinsey Quarterly, Sep. 2020). The ability to view things with a 360 degrees lens is crucial for each and every Bhutanese, particularly those of us bestowed with the trust of public service. If we realize that we can, and must, solve our own problems, then we can. If we have a problem-solving mindset, everything else towards finding solutions will follow.

Question 3
Suggest actionable strategies aimed at facilitating the integration of the four identified mindsets within the Bhutanese civil service. (10 marks)', 'Strategies to build the four mindsets:
1. Servant-leader mindset: recruit and induct civil servants on values of service (not only examinations); provide leadership and ethics training; leaders should model service; reward staff for excellent public service and use citizen feedback and service charters to hold offices accountable.
2. Entrepreneurial mindset: review and remove excessive regulations and red tape; set up innovation funds and pilot projects; allow calculated risk-taking without fear of punishment for honest failure; partner with the private sector; train civil servants in economics, business acumen and data use; and set targets based on outcomes such as revenue generated and time saved for businesses.
3. Growth mindset: introduce merit-based performance management that differentiates and rewards high performers (as the passage notes job security without differentiation inhibits growth); provide continuous learning through RIGSS, online courses, study and exchange programmes; use mentoring and coaching; and make learning part of every civil servant''s performance plan.
4. Problem-solving mindset: create cross-agency teams and innovation labs to tackle national problems such as unemployment and food security; use design thinking; empower officers at all levels to make decisions; hold solution-focused meetings; and share lessons from both successes and failures.', null, '[{"point": "Servant-leader: values-based recruitment and induction, leadership training, recognising service excellence, citizen feedback", "marks": 2.5}, {"point": "Entrepreneurial: cut red tape/ simplify rules, innovation funds and pilots, tolerate calculated risks, partnerships with private sector, data-driven decisions, performance targets on outcomes", "marks": 2.5}, {"point": "Growth: merit-based performance management and promotion, continuous learning (RIGSS, online courses), mentoring, rewarding learning, differentiating performers", "marks": 2.5}, {"point": "Problem-solving: cross-agency teams, design thinking/ innovation labs, empowering staff to decide, solution-focused meetings, learning from failures", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'case-study-and-comprehension'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-general-2-2023b2-a', 3, null, null, null, null)
  returning id
)
insert into me_q select 'A3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'A3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'A3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'A3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'analytical', 'Read the article below and answer ALL FOUR questions that follow.

CIVIL SERVANTS’ MINDSET FOR 21st CENTURY BHUTAN

The four mindsets that could be cultivated or promoted in our civil service are:

The Servant-Leader Mindset

Civil servants are paid to serve the larger public or national interests, including policy formulation, planning and strategizing, policy implementation, resource mobilization and utilization, infrastructure development, monitoring and evaluation, public service delivery etc. Because civil servants are paid to do what we are expected or entrusted to do, the most undesirable mindset in civil servants will be to think that we are doing someone a favour. The work civil servants do is not charity.

But public service, in its true sense, is much more profound and transcends any monetary equation. Ideally, civil servants should be intrinsically motivated by the service we can render in the form of the work we do. We should be driven by the impacts that our sincerity and hard work will have on the wellbeing of fellow citizens and our nation at large. In the civil service, we (ought to) live more for others than for ourselves, that indeed is the true purpose of civil service. A doctor should be driven by the lives he can save or the pains he can mitigate. Similarly, a teacher should be driven by the possible impact of his students on the future of our nation. No quantum of money can buy such a level of inspiration and fulfilment.

The mindset we ought to have in the civil service is that of a servant-leader. “The servant-leader is servant first… It begins with the natural feeling that one wants to serve, to serve first. With the loyalty of a servant and the competency of a leader, there is no doubt that Bhutan’s civil servants will serve our public better and navigate the complexities of the 21st century. But first, we need to discover the “servant” in the civil servant.

The Entrepreneurial Mindset

The draft 21st Century Economic Roadmap for Bhutan highlights how excessive regulation, bureaucratic red-tapism and indifference in the civil service are painful bottlenecks in our system, particularly for businesses. Many of us in the civil service know this. Perhaps we have a great opportunity now to change it, and change must begin with oneself.

If our country has to become self-reliant and a fully developed country during our lifetime as envisioned by His Majesty The King, civil servants will increasingly need to shift gear towards a more entrepreneurial mindset. Civil servants need not do business but we need to have the business acumen as a part of our competency. We have the potential to be more decisive, innovative and risk-taking. We need to graduate from the existing fail-safe mentality.

A robust and resilient economy, high income and high living standards are necessary imperatives of a developed country. If we have this realization, it won’t be difficult for our fellow civil servants in the Ministries of Agriculture or Economic Affairs, the Tourism Council of Bhutan or the Thimphu Thromde to formulate plans and policies that will help generate more revenues for our economy.

These are random examples; civil servants across government agencies can do the same, one way or the other. If civil servants have an entrepreneurial mindset, we would see, or better still create, opportunities beyond the regulatory horizons.

If we are to become a developed country in our generation, it will be imperative to promote an entrepreneurial mindset in our civil service – a mindset that values time, innovation, efficiency, partnership, data, risk-taking and money. It is about time that we rethink the belief, or the myth, that we are happy with less.

The Growth-Mindset

A fixed mindset assumes that our character, intelligence, and creative ability are static given which we can’t change in any meaningful ways; a growth mindset thrives on the challenge and sees failure not as evidence of unintelligence but as a heartening springboard for growth and for stretching our existing abilities. In a growth mindset, people believe that their most basic abilities can be developed through dedication and hard work (Carol Dweck).

Nobody knows everything under the sun. But today, we have the opportunity and the resources to know as much as we need to, or wish to. All we need is a bit of humility to acknowledge that we don’t know everything, the openness to learn, and the belief that we can get better through our efforts. In a recent RIGSS Podcast interview, the Resident Representative of UNDP Bhutan, Ms. Azusa Kubota, highlighted the need for “humility” as a part of building capabilities. She said “The first humility is to really admit that we all need to embrace the fact that we don’t know many things happening around us and we certainly don’t know our future; acknowledging this requires courage and also this will allow us to seek support in defining what it is that we don’t know”.

In the Bhutanese civil service, the assurance of job security irrespective of how much we know or don’t know, or how much we perform or don’t perform, seems to be one of the biggest inhibitors of the growth mindset. The inability of the system to differentiate civil servants based on merit leads to a perception of lack of recognition to those who invest time and effort to learn more and do better. The world around us is fast changing; the only way the bureaucracy can catch up and stay ahead and relevant is by bureaucrats embracing a growth mindset. A growth mindset will help us know more, innovate, solve problems and dream bigger. It will help us achieve higher levels of motivation and performance. A growth mindset will allow us to embrace change. With a growth mindset, it’s not about how good you are, it’s rather about how good you want to be. And sky is the only limit.

The Problem-Solving Mindset

In a recent zoom conference, author and social entrepreneur Tami Simon was asked about the mindset of employees in her company that makes her company do so well. The mindset, she said, is: “You have a problem? Let me solve it.”

We are generally good at problem identification or definition, which no doubt is important. For example, most of us today can talk about the problems the COVID-19 pandemic has inflicted upon us as a nation, such as unemployment, dwindling economic growth, food security etc. We now need to move towards finding solutions, which is most important.

Those with a problem-solving mindset embrace problems rather than shun them. They see opportunities. And embracing problems is perhaps the starting point to finding solutions. In times of massive uncertainty like today, problems are varied and never-ending, and the only way to move forward and do better is by discussing and discovering solutions to our problems. Our attitude towards problems, whether we embrace them or shun them, would make all the difference.

Bhutan’s civil service has the best of brains and a wealth of experience. We are solving a lot of problems, and we can do so much more. We are capable of taking that “dragonfly eye view” of problems so that we see threats and opportunities beyond the periphery of vision (McKinsey Quarterly, Sep. 2020). The ability to view things with a 360 degrees lens is crucial for each and every Bhutanese, particularly those of us bestowed with the trust of public service. If we realize that we can, and must, solve our own problems, then we can. If we have a problem-solving mindset, everything else towards finding solutions will follow.

Question 4
In your role as a service provider, which among the four mindsets discussed in the passage do you consider the most pivotal? Justify. (10 marks)', 'In my role as a service provider, I consider the servant-leader mindset the most pivotal.
Justification:
1. It is the foundation of public service: the passage says we must first "discover the servant in the civil servant". Service providers deal with citizens every day; if they see their work as a duty to serve, they will be courteous, prompt and fair, and will not make people feel they are receiving a favour.
2. It ensures equal service for all: a servant-leader serves everyone without favouritism or the need to ''know someone'' in the office, which is one of the biggest public complaints.
3. It brings intrinsic motivation: like a doctor driven by lives saved or a teacher by students'' futures, a servant-leader works sincerely even without supervision or extra pay, which improves the quality of service.
4. It leads to the other mindsets: someone truly committed to serving will want to learn and grow, find solutions to citizens'' problems, and remove red tape that frustrates businesses - so growth, problem-solving and entrepreneurial mindsets follow naturally.
In the Bhutanese context of GNH and His Majesty''s vision of a dynamic civil service, the servant-leader mindset keeps the citizen at the centre of everything we do.', null, '[{"point": "Clear choice of one mindset", "marks": 2}, {"point": "Justification with at least three well-developed reasons linked to service delivery and the passage", "marks": 6}, {"point": "Shows how it supports/ connects with the other mindsets; Bhutanese context", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'case-study-and-comprehension'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-general-2-2023b2-a', 4, null, null, null, null)
  returning id
)
insert into me_q select 'A4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'A4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'A4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'A4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'A4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'A4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', '"One of the biggest complaints of ordinary people in Bhutan over the years has been that you cannot get your work done if you do not know someone in that office. This simple line says much more than a voluminous consultant''s report on the problems of governance and service delivery." - The Bhutanese, August 2023
What are your personal observations and views on the service delivery standards of offices? Elaborate how services can best be delivered equally to all citizens. (10 marks)', 'Observations: many citizens feel that knowing someone in an office makes work faster - files move quickly for relatives and friends while others are told to come back another day. Common problems include unclear procedures, too many documents, long waiting times, officials being unavailable, and rural and elderly people who lack connections or digital skills being left behind. At the same time, there have been improvements: many services are now online (G2C, eServices, NDI), service standards with fixed timelines have been introduced, and civil service reforms stress performance and accountability.
How to deliver services equally to all:
1. Digitalise services through online portals and the National Digital Identity, so applications are processed in order without personal contact.
2. Publish clear service standards - required documents, fees and timelines - at every office and online.
3. Use queue and token systems (first come, first served) and track files so no one can jump the queue.
4. Set up effective grievance redressal and citizen feedback, and act on complaints.
5. Hold officials accountable: monitor performance, and penalise favouritism and corruption (with the ACC''s support).
6. Train civil servants in ethics, customer service and the servant-leader mindset.
7. Bring services closer to people through one-stop community centres and mobile services for rural, elderly and disabled citizens.
Equal service is a basic right and essential for trust in government.', null, '[{"point": "Observations: favouritism/ ''connections'' culture, delays and red tape, rude or absent staff, unclear procedures, repeated visits, rural people disadvantaged; also improvements (G2C online services, service standards)", "marks": 4}, {"point": "Ways to deliver equally: online/ digital services and NDI, clear service standards and timelines, first-come-first-served queues/ tokens, transparency of procedures and fees, grievance redressal and feedback, accountability and penalties for favouritism, training in ethics and customer service, decentralised/ one-stop service centres", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'topical-issues-governance-and-service-delivery'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'B1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'B1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'B1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'B1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'The Supreme Court of Bhutan suspended two justices for what the highest appellate court deemed a deliberate miscarriage of justice. Within hours of the decision - which went viral on social media - many pointed out several cases that should be re-opened, hoping decisions could be reversed or to determine whether miscarriages happened. - Kuensel, August 2023
Express your views on the damage caused by the miscarriage of justice, and elaborate measures on how public confidence in the judicial system can be regained after this event. (10 marks)', 'Damage: a deliberate miscarriage of justice harms the people who lost cases unfairly - their property, freedom or reputation. More seriously, it damages public trust in the judiciary, the institution citizens rely on as the final guardian of fairness and the rule of law. People begin to doubt other judgments, suspect corruption or influence, and may lose faith in going to court; disputes may then be settled outside the law. It also affects investor confidence and the image of Bhutan''s democracy.
At the same time, the Supreme Court''s action against its own justices shows that the system can hold even judges accountable, which is a positive sign.
Measures to regain confidence:
1. Complete a transparent investigation and take firm action according to law, communicating the findings to the public.
2. Provide a clear, fair mechanism to review cases where miscarriage is credibly alleged.
3. Strengthen judicial ethics: a code of conduct, ethics training, asset declarations and disciplinary procedures.
4. Increase transparency: publish judgments with reasons, open court proceedings, and use electronic case management with random allocation of cases.
5. Ensure merit-based, independent appointments and continuous training of judges.
6. Improve access to justice through legal aid and public legal awareness.
Consistent fairness and openness over time will rebuild trust.', null, '[{"point": "Damage: injustice to victims/ wrongly affected parties, loss of public trust and confidence in judiciary and rule of law, doubts on other cases, perception of corruption, harm to democracy and investment, people may take law into own hands", "marks": 4}, {"point": "Positive view of the Court acting against its own members - accountability", "marks": 1}, {"point": "Measures: transparent investigation and disciplinary action, review mechanism for disputed cases, judicial code of conduct and ethics training, independent oversight/ audits, publishing judgments and reasons, case management and random case allocation, legal aid and awareness, merit-based appointments, communication with public", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'topical-issues-judiciary-and-rule-of-law'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'B2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'B2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'B2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'B2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'The economy of Bhutan is based on agriculture and forestry, which provide the main livelihood for more than 60% of the population. Agriculture consists largely of subsistence farming and animal husbandry. Rugged mountains dominate the terrain and make the building of roads and other infrastructure difficult.
Suggest how Bhutan, as a landlocked country with difficult terrain but rich biodiversity, can build on its uniqueness to help the economy grow, and discuss how Bhutan can work differently in developing infrastructure in its rugged mountains and valleys. (10 marks)', 'Building on uniqueness: Bhutan''s mountains, forests, culture and clean environment are assets. It can (1) promote high-value, low-volume tourism - eco-tourism, trekking, cultural, wellness and birdwatching tourism; (2) shift from subsistence to commercial niche agriculture - organic and high-value products such as cordyceps, mushrooms, quinoa, red rice, apples, cardamom and dairy, branded as ''Bhutanese organic'' for export; (3) develop clean hydropower and solar energy for export and green industries; (4) earn from its carbon-negative status through carbon credits and green finance; (5) add value to biodiversity through medicinal plants, Sowa Rigpa products and bio-prospecting; and (6) grow the digital and knowledge economy and the Gelephu Mindfulness City, which do not depend on difficult terrain.
Developing infrastructure differently: use environment-friendly, climate-resilient road construction with proper drainage, slope stabilisation and bio-engineering; build tunnels and bridges to shorten routes and avoid landslide-prone slopes; introduce ropeways and cable cars for remote villages and tourism; expand domestic air and helicopter connectivity; invest in digital connectivity so services reach people without long travel; plan clustered settlements so services are cheaper to provide; use GIS and modern technology in planning; and partner with the private sector and development partners for financing.', null, '[{"point": "Using uniqueness: high-value low-volume tourism and eco/ adventure/ cultural tourism, organic and niche agriculture (high-value crops, cordyceps, mushrooms, branding), hydropower and clean energy, carbon credits/ green finance, biodiversity-based products (medicinal plants, bio-prospecting), Brand Bhutan, GMC, digital economy that does not depend on terrain", "marks": 5}, {"point": "Infrastructure differently: climate-resilient and environmentally friendly road design, tunnels and bridges, ropeways/ cable cars, air connectivity (domestic airports, helicopters), digital connectivity, cluster settlements, use of technology/ GIS planning, public-private partnership, slope stabilisation and bio-engineering", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'topical-issues-economy-and-development'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'B3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'B3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'B3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'B3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', '"Lamoidzingkha Drungkhag Court in Dagana has sentenced a 30-year-old teacher from Lamoidzingkha Middle Secondary School to three months in prison in a child battery case. However, the teacher had the option to pay thrimthue, a monetary penalty, in lieu of serving the prison term. The teacher was charged under Section 215 of the Child Care and Protection Act of Bhutan 2011, which stipulates that a person shall be deemed guilty of child battery if they intentionally use physical force or subject a child to physical force." - Kuensel, July 2023
In your opinion, highlight the importance of value education and discipline in schools, and how it will benefit the education system and the wellbeing of students. (10 marks)', 'Value education teaches students core values such as respect, honesty, compassion, responsibility, gratitude (ley jumdrey and tha damtshig) and the values of GNH. It shapes character so that students become responsible, caring citizens, and it helps prevent problems such as bullying, violence, substance abuse and disrespect.
Discipline is equally important: clear rules, punctuality and self-control create order in which learning can take place. However, the case shows that discipline must never be enforced through physical punishment, which is illegal under the Child Care and Protection Act 2011 and harms children physically and emotionally. Schools should use positive discipline - setting clear expectations, praising good behaviour, using logical consequences, counselling, involving parents, and teachers acting as role models.
Benefits to the education system: a safe, respectful and orderly environment improves teaching and learning outcomes; fewer conflicts and disciplinary cases; stronger teacher-student and school-community relationships; and fewer dropouts.
Benefits to students'' wellbeing: they feel safe, valued and confident; their mental health improves; they develop self-discipline rather than fear; and they grow holistically - intellectually, morally and emotionally - ready to contribute to society.', null, '[{"point": "Importance of value education: character, respect, honesty, compassion, tha damtshig ley jumdrey, GNH values, responsible citizens, reduce substance abuse and violence", "marks": 3}, {"point": "Discipline without corporal punishment: positive discipline, counselling, clear rules, consequences, role models; corporal punishment is illegal (CCPA 2011) and harmful", "marks": 3}, {"point": "Benefits to education system and students: safe and conducive learning environment, better learning outcomes, mental health and confidence, good teacher-student relationships, fewer dropouts, holistic development", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'topical-issues-education-and-child-protection'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'B4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'B4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'B4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'B4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'B4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'B4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'descriptive', '"In an effort to reduce the escalating concern of drug-related crime, the Royal Bhutan Police has strategically established a field division and amplified its manpower, marking a significant step forward in its effort to combat the proliferation of narcotics." - Kuensel, August 2023
In light of the current surge of crimes involving youth and drugs, how would you support the nation in combating this rising crime? (10 marks)', 'Drug abuse and related crimes among youth are driven by unemployment and idleness, peer pressure, easy availability of drugs across the porous border, family problems, stress and lack of recreation. Combating it needs everyone''s effort, not only the police.
How I would support the nation:
1. Lead by example: stay away from drugs and alcohol abuse and be a positive role model for younger people.
2. Spread awareness: take part in and organise awareness programmes in schools, colleges and communities, and share accurate information on social media about the dangers of drugs and the law.
3. Report: pass information about drug peddling and trafficking to the Royal Bhutan Police confidentially, and support community policing.
4. Help friends: encourage friends and relatives who use drugs to seek counselling and treatment, and support them during rehabilitation without stigma.
5. Volunteer: join Desuung, youth groups and NGOs working on prevention and recovery.
6. Promote alternatives: help organise sports, arts and skills activities so young people have positive ways to spend their time.
I would also support policies that combine enforcement with prevention, rehabilitation and reintegration, and create skills and job opportunities for youth, because treating addiction as a health problem as well as a crime is more effective.', null, '[{"point": "Understanding causes: unemployment, peer pressure, easy availability across border, family problems, stress, lack of recreation", "marks": 2}, {"point": "Personal role: stay drug-free/ role model, peer education and awareness, report trafficking/ information to RBP, support friends to seek help, volunteering (Desuung, youth groups)", "marks": 4}, {"point": "Supporting the system: community policing, family/ school involvement, rehabilitation and reintegration (not only punishment), skills and employment, sports and recreation, counselling services, Bhutan Narcotics Control Authority programmes", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'subjective-youth-and-drugs'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'C1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'C1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'C1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'C1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'C1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'C1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'descriptive', '"The rate of attrition in the civil service stands at 16% as of June 2023." - Annual Report of RCSC 2022-23. At a time of dire need for efficient public service delivery, the gap left by this high attrition has created a vacuum in the civil service.
Discuss which categories of service recipients would be affected worst, and elaborate on the consequences. (10 marks)', 'With 16% of civil servants leaving - many skilled professionals going abroad - the worst affected service recipients are:
1. Patients: the departure of nurses, doctors and technicians means longer waiting times, fewer services and risks to patient safety, especially at JDWNRH and district hospitals.
2. Students: teacher shortages lead to large classes, teachers covering subjects outside their expertise, and lower learning quality, particularly in rural schools.
3. Rural and remote communities, the elderly, the poor and the vulnerable, who depend entirely on public services and cannot pay for private alternatives.
4. Businesses and the public needing approvals and services, who face longer delays.
Consequences: service delivery slows and quality falls; the remaining staff are overburdened, leading to burnout and further resignations (a vicious cycle); experienced and skilled people leave, taking institutional memory and expertise; the government spends more on recruiting and training replacements; development plans and projects are delayed; public trust in government declines; and the economy suffers from inefficiency. The RCSC needs to improve retention, career development, pay and working conditions, and recruit and train replacements quickly.', null, '[{"point": "Worst affected recipients: patients (nurses, doctors leaving), students (teacher shortage), rural and remote communities, poor/ elderly/ vulnerable who depend on public services, businesses needing approvals", "marks": 4}, {"point": "Consequences: delays and poorer quality of service, overburdened remaining staff and burnout, loss of experienced/ skilled people and institutional memory, higher costs of recruitment and training, policy and project delays, lower trust in government, impact on economy", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'subjective-civil-service'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'C2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'C2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'C2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'C2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'C2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'C2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'descriptive', 'Bhutan''s arable land is only 7% of the total land. Of the total 664,000 acres of arable land, 9.96% is left fallow. Considering that Bhutan''s economy is mostly backed by agricultural products, it is necessary to use the land optimally.
Describe what policy and intervention the government should put forward, and explain the means and ideas by which fallow land can be revived and made more productive. (10 marks)', 'Fallow land results from rural-urban migration and labour shortages, human-wildlife conflict, lack of irrigation, low returns from farming, small fragmented plots and absentee landowners.
Policies and interventions the government should put forward:
1. A land leasing policy that lets unemployed youth, farmers'' groups and companies lease fallow private and state land on fair, long-term terms.
2. Incentives such as subsidised inputs, machinery and low-interest credit for reviving fallow land, and possibly conditions or charges to discourage keeping land idle for long periods.
3. Investment in irrigation, farm roads and electric or chain-link fencing against wildlife.
4. Farm mechanisation and hiring services to overcome labour shortages.
5. Assured markets through buy-back schemes, links with schools, hotels and exporters, and minimum support prices.
Means and ideas to revive the land: commercial and contract farming of high-value crops (vegetables, fruits, spices, quinoa); cooperatives and youth groups farming large blocks of pooled land; low-labour options such as orchards, agroforestry and fodder; greenhouses and organic farming for premium markets; sharecropping arrangements between absentee owners and active farmers; and Desuung and Gyalsung agricultural projects that train youth. Together these can raise food self-sufficiency and rural incomes.', null, '[{"point": "Causes briefly: labour shortage/ rural-urban migration, human-wildlife conflict, lack of irrigation, low profitability, land fragmentation, absentee owners", "marks": 2}, {"point": "Policies/ interventions: land leasing policy (state and private fallow land to youth/ groups), incentives and subsidies, fallow land tax or conditions, irrigation schemes, HWC fencing, farm mechanisation, credit, buy-back and market access, land consolidation", "marks": 4}, {"point": "Means and ideas to revive: commercial and contract farming, cooperatives/ youth groups, high-value and low-labour crops, agroforestry/ orchards, greenhouses, organic farming, Desuung/ Gyalsung agricultural projects, sharecropping", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'subjective-agriculture-and-land-use'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'C3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'C3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'C3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'C3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'C3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'C3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'descriptive', 'The figures are alarming. From a lone diabetic patient in 2002, there are more than 3,000 recorded cases today. This is a concern the nation must combat early to reduce non-communicable diseases (NCDs) among citizens in desk jobs with little physical movement.
Explain the holistic effect on the nation if the overall NCD issue is not acted on now, and, as a youth hoping to join a desk-bound white-collar job, what measures and interventions you would embrace to be part of a healthy workforce. (10 marks)', 'If NCDs are not tackled now, the effects on the nation will be wide: health spending and costly referrals abroad will keep rising, taking money from other development; many citizens will suffer disability or die early during their most productive years; productivity will fall due to illness and absenteeism; families will bear the burden of caring for sick members and the costs of treatment; the health system will be overstretched; and overall economic growth and Gross National Happiness will suffer.
As a young person planning to join a desk-bound job, I would:
1. Stay physically active - exercise at least 30 minutes a day, walk or cycle to work where possible, use the stairs, and take short movement breaks every hour.
2. Eat healthily - more vegetables, fruits and whole grains; less salt, sugar, oil, red meat, fast food and sugary drinks; and moderate doma (betel) consumption.
3. Avoid tobacco and limit or avoid alcohol.
4. Sleep enough and manage stress through mindfulness, meditation and hobbies.
5. Go for regular health check-ups for blood pressure, sugar and weight.
6. Encourage workplace wellness - office sports, fitness clubs, healthy food in canteens, and ergonomic workstations - and motivate colleagues to join.
A healthy workforce is a productive workforce and is essential for the nation''s development.', null, '[{"point": "Holistic effects: rising health costs and referrals, lower productivity and absenteeism, premature deaths and disability, burden on families and caregivers, reduced economic growth and GNH, pressure on health system", "marks": 5}, {"point": "Personal measures: regular exercise and active breaks, walking/ cycling, healthy diet (less salt, sugar, fat, doma), no tobacco, limited alcohol, enough sleep, stress management, regular check-ups; workplace interventions (wellness programmes, sports, standing desks)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'subjective-health-and-lifestyle'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'C4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'C4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content and relevance', 'Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).', 4.0, 1 from me_q where key = 'C4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Analysis and examples', 'Explains reasons and effects, gives Bhutanese examples and practical suggestions.', 2.5, 2 from me_q where key = 'C4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Language', 'Correct grammar, spelling and vocabulary; clear sentences.', 2.0, 3 from me_q where key = 'C4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Organisation', 'Logical order, paragraphs or points, brief introduction and conclusion.', 1.5, 4 from me_q where key = 'C4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which was the first country to adopt the 5G mobile network on a large scale?', null, 'South Korea launched the first nationwide commercial 5G network in April 2019.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-technology'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'D1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'UAE', false, 1), ('B', 'South Korea', true, 2), ('C', 'USA', false, 3), ('D', 'Japan', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In football, what is the name of the award given each year to the best player in the world?', null, 'The Ballon d''Or (run jointly with FIFA as the FIFA Ballon d''Or in 2010-2015) is the best-player award; the Golden Boot/ Shoe is for top scorers.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-sports'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'D2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'FIFA Ballon d''Or', true, 1), ('B', 'UEFA Best Player', false, 2), ('C', 'UEFA Golden Shoe', false, 3), ('D', 'FIFA Golden Boot', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The shortcut key to paste a copied file or word in MS Word is:', null, 'Ctrl + V pastes; Ctrl + C copies, Ctrl + B bold, Ctrl + P print.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-technology'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'D3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ctrl + C', false, 1), ('B', 'Ctrl + P', false, 2), ('C', 'Ctrl + B', false, 3), ('D', 'Ctrl + V', true, 4)) as v(label, body, ok, pos) where me_q.key = 'D3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the arrangement of statues, ''Rigsum Goenpo'' is the combination of:', null, 'The Rigsum Goenpo (three protectors) are Jampelyang (wisdom), Chenrezig (compassion) and Chana Dorji (power).', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-bhutan-culture'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'D4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Jetsun Drolma, Guru Padmasambhava and Zhabdrung', false, 1), ('B', 'Chenrezig, Buddha and Guru Padmasambhava', false, 2), ('C', 'Jampelyang, Chenrezig and Chana Dorji', true, 3), ('D', 'Guru Padmasambhava, Buddha and Zhabdrung', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The three main branches of government provided for by the Constitution of the Kingdom of Bhutan are:', null, 'Article 1 provides for the Legislature, the Executive and the Judiciary.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-bhutan-constitution'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'D5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ministries, Departments and Autonomous agencies', false, 1), ('B', 'Parliament, National Council and National Assembly', false, 2), ('C', 'Dzongkhag, Gewog and Chiwog', false, 3), ('D', 'Executive, Legislative and Judiciary', true, 4)) as v(label, body, ok, pos) where me_q.key = 'D5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The 2023 FIFA Women''s World Cup was hosted by:', null, 'Australia and New Zealand co-hosted the 2023 Women''s World Cup (won by Spain).', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-sports'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'D6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Australia and Sweden', false, 1), ('B', 'Australia and New Zealand', true, 2), ('C', 'Australia and England', false, 3), ('D', 'Australia and Spain', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Chandrayaan-3 spacecraft to the south pole of the Moon was launched by:', null, 'Chandrayaan-3 was launched by the Indian Space Research Organisation and landed near the lunar south pole in August 2023.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-science'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'D8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'SpaceX', false, 1), ('B', 'NASA', false, 2), ('C', 'ISRO', true, 3), ('D', 'CSIRO', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The latitude of the Tropic of Capricorn is:', null, 'The Tropic of Capricorn (about 23.4° S) is the southernmost latitude where the sun can be directly overhead at noon.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-geography'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'D10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'the most southern latitude at which the sun can appear directly over the moon', false, 1), ('B', 'the most northern latitude at which the sun can appear over the moon', false, 2), ('C', 'the most southern latitude at which the sun can appear directly overhead at noon', true, 3), ('D', 'the most northern latitude at which the sun can appear directly overhead at noon', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Who is the author of the book ''Freedom from Fear''?', null, '''Freedom from Fear'' (1991) is a collection of writings by Aung San Suu Kyi.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-books'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'D12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Aung San Suu Kyi', true, 1), ('B', 'Nelson Mandela', false, 2), ('C', 'Taslima Nasreen', false, 3), ('D', 'Benazir Bhutto', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which city hosted the United Nations High-Level Political Forum held from 10 to 19 July 2023?', null, 'The HLPF on sustainable development is held at UN Headquarters in New York.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-world'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'D13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Rome', false, 1), ('B', 'New Delhi', false, 2), ('C', 'Paris', false, 3), ('D', 'New York', true, 4)) as v(label, body, ok, pos) where me_q.key = 'D13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '''The greatest glory in living lies not in never falling, but in rising every time we fall'' is a famous quote popularly attributed to:', null, 'The quote is widely attributed to Nelson Mandela.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'D14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Nelson Mandela', true, 1), ('B', 'Barack Obama', false, 2), ('C', 'Martin Luther King', false, 3), ('D', 'Steve Jobs', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Compared to its body weight, which animal is the strongest?', null, 'A dung beetle can pull over 1,000 times its own body weight - the strongest relative to body weight.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-science'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'D15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Crow', false, 1), ('B', 'Dung beetle', true, 2), ('C', 'Ant', false, 3), ('D', 'Elephant', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The movie by Dzongsar Jamyang Khyentse Norbu announced in 2023 is titled:', null, 'Khyentse Norbu''s film is ''Pig at the Crossing''.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-bhutan'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'D16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Pig at the Crossing', true, 1), ('B', 'Pig at the Crossbow', false, 2), ('C', 'Pig at the Crossroad', false, 3), ('D', 'Pig at the Crossway', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Who is the author of the book ''Married to Bhutan''?', null, '''Married to Bhutan'' is by Linda Leaming; Jamie Zeppa wrote ''Beyond the Sky and the Earth''.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-books'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'D17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Jamie Zeppa', false, 1), ('B', 'Kunzang Choden', false, 2), ('C', 'Karma Ura', false, 3), ('D', 'Linda Leaming', true, 4)) as v(label, body, ok, pos) where me_q.key = 'D17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which pairing of minister and ministry (Third Parliament government, 2023) is inaccurate?', null, 'Dorji Tshering headed the Ministry of Infrastructure and Transport; the MoICE minister was Karma Dorji.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-bhutan-government'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'D18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'H.E. Dechen Wangmo - Ministry of Health', false, 1), ('B', 'H.E. Dorji Tshering - Ministry of Industry, Commerce and Employment', true, 2), ('C', 'H.E. Loknath Sharma - Ministry of Energy and Natural Resources', false, 3), ('D', 'H.E. Ugyen Dorji - Ministry of Home Affairs', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which leadership style gives employees autonomy and allows them to make decisions within their roles?', null, 'Laissez-faire (''let them do'') leadership delegates decisions to employees.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-management'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'D19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Laissez-faire leadership', true, 1), ('B', 'Transactional leadership', false, 2), ('C', 'Transformational leadership', false, 3), ('D', 'Charismatic leadership', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Civil Liability Bill passed during the July 2023 sitting of Parliament is also known as the:', null, 'The Civil Liability Bill deals with torts (civil wrongs) and is known as the Tort Bill.', '[]'::jsonb, (select id from public.subjects where slug = 'english-general-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-general-knowledge') and t.slug = 'general-knowledge-bhutan-law'), (select id from public.exam_papers where code = 'me-general-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (General): BCSE 2023, batch 2", "source": {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null, null)
  returning id
)
insert into me_q select 'D20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'D20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Civil Bill', false, 1), ('B', 'Assent Bill', false, 2), ('C', 'Tort Bill', true, 3), ('D', 'Asset Bill', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D20';
commit;
