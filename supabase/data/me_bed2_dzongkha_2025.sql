-- ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language'), 'comprehension', 'Comprehension' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language'), 'essay-writing', 'Essay writing' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language'), 'language-and-grammar', 'Language and grammar' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'english-language'), 'precis-writing', 'Precis writing' on conflict (subject_id, slug) do nothing;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-bed-2') and subject_group_id is not distinct from (select id from public.subject_groups where code = 'bed-dzongkha-graduates');
insert into public.paper_group_settings (paper_id, subject_group_id, duration_minutes, reading_minutes, max_marks, source) values ((select id from public.exam_papers where code = 'me-bed-2'), (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), 180, 15, 100, 'BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates') on conflict (paper_id, subject_group_id) do update set duration_minutes = excluded.duration_minutes, reading_minutes = excluded.reading_minutes, max_marks = excluded.max_marks, source = excluded.source;
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-2'), (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, 1, 'Section A: Essay writing', 'essay', 2, 30, 1, 'BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-2'), (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, 2, 'Section B: Comprehension', 'passage', 1, 35, null, 'BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-2'), (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, 3, 'Section C: Language and grammar', 'mcq', 15, 1, null, 'BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-2'), (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null, 4, 'Section D: Precis writing', 'descriptive', 1, 20, null, 'BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'essay', 'Write an essay in about 800 words on the following topic. (Assessed on thought and content development 15, communicative competence and vocabulary 10, grammatical accuracy and variety 5.) (30 marks)

According to Section 6 of Article 7 of The Constitution of the Kingdom of Bhutan, "A Bhutanese citizen shall have the right to vote." While voting is a privilege for Bhutanese, choosing a right candidate is a sacred responsibility of every citizen. What qualities should voters look for in a candidate to ensure effective leadership? Discuss.', 'Outline (800-word essay):
Introduction - The Constitution (Article 7, Section 6) gives every Bhutanese citizen the right to vote; with it comes the sacred duty to choose leaders who will serve the Tsa-Wa-Sum.
Qualities - Integrity and honesty; competence, knowledge and experience; a clear, realistic vision and pledges consistent with GNH and national priorities; accountability and transparency; humility and a spirit of service rather than self-interest; good communication and the ability to listen to people; impartiality and unity - no regionalism, nepotism or divisive campaigning; respect for the law and the Election Commission''s rules.
How to judge - Study track records, manifestos and public debates; reject vote-buying, gifts and promises that cannot be met; vote by conscience, not by relationship or region.
Conclusion - Wise choices by informed voters strengthen democracy and ensure effective leadership for Bhutan''s future.', null, '[{"point": "Introduction: the right to vote (Art. 7.6) and the responsibility to choose wisely", "marks": 4}, {"point": "Qualities: integrity and honesty, competence and education, vision and realistic plans, commitment to Tsa-Wa-Sum and GNH", "marks": 9}, {"point": "Qualities: accountability and transparency, humility and service, communication, impartiality (no regionalism or vote-buying)", "marks": 9}, {"point": "How voters should judge (record, manifesto, debates; avoid influence of money, relatives, region)", "marks": 5}, {"point": "Conclusion", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'essay-writing'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'E1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Thought and content', 'Relevant, well-developed ideas with examples; answers the question.', 15.0, 1 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Communicative competence and vocabulary', 'Clear organisation, coherence, apt and varied vocabulary.', 10.5, 2 from me_q where key = 'E1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Grammatical accuracy and variety', 'Accurate grammar, spelling, punctuation; varied sentences.', 4.5, 3 from me_q where key = 'E1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'essay', 'Write an essay in about 800 words on the following topic. (Assessed on thought and content development 15, communicative competence and vocabulary 10, grammatical accuracy and variety 5.) (30 marks)

Gelephu Mindfulness City (GMC) offers opportunities to improve the overall education system in Bhutan. Discuss.', 'Outline (800-word essay):
Introduction - Gelephu Mindfulness City, a noble initiative of His Majesty the King, is planned as a special administrative region and a mindful, sustainable economic hub linking Bhutan with South Asia.
Opportunities for education - Branch campuses of reputed international universities and research institutes; programmes and TVET matched to the green, digital, health and finance industries GMC will attract; internships, exchange and exposure for Bhutanese students and teachers; investment in modern facilities and technology; professional development for teachers; mindfulness and wellbeing woven into learning; jobs at home that keep graduates in Bhutan and slow emigration.
Challenges - Ensuring access for students from all dzongkhags, affordability, keeping Bhutanese values and Dzongkha strong, and coordinating with national curricula and institutions.
Conclusion - With careful planning, GMC can raise the quality and relevance of Bhutanese education and help build a skilled, mindful generation.', null, '[{"point": "Introduction: what GMC is (His Majesty''s initiative, special administrative region, mindful and sustainable economic hub)", "marks": 4}, {"point": "Opportunities: international universities and institutes, research, skills and TVET aligned to new industries, exchange and exposure", "marks": 9}, {"point": "Opportunities: better teacher training, technology, jobs that retain graduates and reduce emigration; mindfulness-based learning", "marks": 9}, {"point": "Challenges and what is needed (equity, cost, cultural values, planning)", "marks": 5}, {"point": "Conclusion", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'essay-writing'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
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

Digital Currency

The term digital currency refers to a form of currency that is available only in digital or electronic form. It is also called digital money, electronic money, electronic currency, or cybercash. This means that there is no physical form. As such, it cannot be handled, stored, or manipulated. Consumers and businesses can use digital currencies to execute transaction and trades. These currencies may not be used by all countries or communities.

Digital currencies do not have physical attributes and are available only in digital form. Transactions involving digital currencies are made using computers or electronic or digital wallets connected to the internet or designated networks. In contrast, physical currencies, such as banknotes and minted coins, are tangible, meaning they have definite physical attributes and characteristics. Transactions involving such currencies are made possible only when their holders have physical possession of these currencies. Digital currencies have utility similar to physical currencies. They can be used to

purchase goods and pay for services. However, it also have restricted use among certain online communities, such as gaming sites, gambling portals, or social media networks.

Digital currencies also enable instant transactions that can be seamlessly executed across borders. For instance, someone in the United States may make payments to a counter-party in Singapore using digital currency, provided they are both connected to the same network.

As mentioned earlier, digital currencies only exist in digital form. They do not have a physical equivalent. Digital currencies can be centralized or decentralized. Fiat currency, which exists in physical form, is a centralized system of production and distribution by a central bank and government agencies. Prominent cryptocurrencies, such as Bitcoin and Ethereum, are examples of decentralized digital currency systems.

Digital currencies can transfer value. Using digital currencies requires a mental shift in the existing framework for currencies, where they are associated with sale and purchase transactions for goods and services. Digital currencies, however, extend the concept. For example, a gaming network token can extend the life of a player or provide them with extra superpowers. This is not a purchase or sale transaction but, instead, represents a transfer of value.

Digital currency is an overarching term that can be used to describe different types of currencies that exist in the electronic realm. Broadly, there are three different types of currencies:

Cryptocurrencies are digital currencies that use cryptography to secure and verify transactions in a network. Cryptography is also used to manage and control the creation of such currencies. Bitcoin and Ethereum are examples of cryptocurrencies. Depending on the jurisdiction, cryptocurrencies may or may not be regulated.

Virtual currencies are unregulated digital currencies controlled by developers or a founding organization consisting of various stakeholders involved in the process. Virtual currencies can also be algorithmically controlled by a defined network protocol. An example of a virtual currency is a gaming network token whose economics is defined and controlled by developers.

Central Bank Digital Currencies (CBDCs) are regulated digital currencies issued by the central bank of a country. A CBDC can be a supplement or a replacement for a traditional fiat currency. Unlike fiat currency, which exists in both physical and digital form, a CBDC exists purely in digital form. England, Sweden, and Uruguay are a few of the nations that are considering plans to launch a digital version of their native fiat currencies.

The use of CBDCs has been suggested as a means of enhancing the speed and security of centralized payment systems, lowering the costs and dangers of handling cash, and promoting greater financial inclusion for people and companies without access to conventional banking services. They may also make cross-border payments easier and lessen the need for foreign exchange.

Advantages of Digital Currencies

The amount of time required for transfers involving digital currencies is extremely fast. As payments in digital currencies are made directly between the transacting parties without the need for any intermediaries, the transactions are usually instantaneous and low-cost. This fares better compared to traditional payment methods that involve banks or clearinghouses. Digital-currency-based electronic transactions also bring in the necessary record-keeping and transparency in dealings.

Many requirements for physical currencies, such as the establishment of physical manufacturing facilities, are absent for digital currencies. Such currencies are also immune to physical defects or soiling that are present in physical currency.

Under the current currency regime, the Fed works through a series of intermediaries (banks and financial institutions) to circulate money into an economy. CBDCs can help circumvent this mechanism and enable a government agency to disburse payments directly to citizens. They also simplify the production and distribution methods by obviating the need for physical manufacturing and transportation of currency notes from one location to another.

Digital currencies enable direct interactions within a network. For example, a customer can pay a shopkeeper directly as long as they are situated in the same network. Even costs involving digital currency transactions between different networks are relatively cheaper as compared to those with physical or fiat currencies. By cutting out middlemen who seek economic rent from processing the transaction, digital currencies can make the overall cost of a transaction cheaper.

Digital currencies may be decentralized. This means they are not controlled by any government or financial institution. Decentralized digital currencies make them more resistant to government interference, censorship, and manipulation. Decentralization means true control over the digital currency is spread over a broader range of owners or users.

Because transactions with digital currencies are not linked to personal data, users are given a high level of privacy and anonymity. They are therefore very helpful for those who want to protect the confidentiality of their financial dealings.

Anyone with an internet connection can utilize digital currencies from anywhere in the globe. These services are therefore particularly helpful for people who do not have access to conventional banking institutions. In addition, many of these banking services only need access to an internet connection; for geographical areas that are not as developed with a strong financial infrastructure, digital currencies may be a stronger option.

Disadvantages of Digital Currencies

While they do not require physical wallets, digital currencies have their own set of requirements for storage and processing. For example, an internet connection is necessary as are smartphones and services related to their provisioning. Online wallets with robust security are also necessary to store digital currencies.

Their digital provenance makes digital currencies susceptible to hacking. Hackers can steal digital currencies from online wallets or change the protocol for digital currencies, making them unusable. As the numerous cases of hacks in cryptocurrencies have proved, securing digital systems and currencies is a work in progress.

Digital currencies used for trading can have wild price swings. For example, the decentralized nature of cryptocurrencies has resulted in a profusion of thinly capitalized digital currencies whose prices are prone to sudden changes based on investor whims. Other digital currencies have followed a similar price trajectory during their initial days. For example, Linden dollars used in the online game Second Life had a similarly volatile price trajectory in its early days.

Digital currencies are still not commonly used as a means of payment by retailers and other enterprises. Because of this, using them for routine transactions may be challenging. Though digital currencies have gained in popularity, there are still limited functionalities in everyday transactions in many places.

On a digital currency network, transactions are irreversible. This means that once a transaction has been completed, it cannot be undone. In circumstances where a mistake or fraud has taken place, this may be a disadvantage. This is also a tremendous disadvantage for those new to the digital currency space, as there is a substantial learning curve. Because there is no central oversight area for many digital currencies, new users can''t simply go to their local branch to receive help for many digital currencies.

Future of Digital Currencies Cryptocurrencies like Bitcoin have exploded in value, but they are largely used for speculation or to buy other speculative assets. Although there have been some signs of merchant adoption in countries like El Salvador, the high volatility and complexity of these currencies make them impractical for most daily applications.

Many companies have tried to reduce volatility by introducing stablecoin, whose value is fixed to the price of fiat currency. This is usually done by depositing an equivalent amount of fiat, which can be used to redeem the tokens. However, stablecoin issuers such as Tether have used these deposits on more speculative investments, raising concerns that they are vulnerable to a market crash.

Another possible application is in central bank digital currencies, which could be issued by a country''s bank or monetary authority. These would be used and stored in online wallets, similar to cryptocurrencies, but allowing the central bank to issue and freeze tokens at will. Several countries, such as China, have proposed digital versions of their currencies.

Thus, digital currencies are assets that are only used for electronic transactions. They do not have any physical form, although they can be exchanged for regular money or other assets. Although the most popular digital currencies are cryptocurrencies like bitcoin, many national governments are considering issuing their own centralized digital currencies.

Question I (15 x 1 = 15 marks). Write the letter of the correct answer, e.g. 16 (C).
1. Which of the following is used to make digital payments? (A) Stamp (B) Cheque (C) Banknote (D) Digital Wallet
2. With reference to digital currencies, choose the odd one out. (A) Speed (B) Volatility (C) Stability (D) Speculative Demand
3. What makes the future of digital currency uncertain, despite its advantages? (A) Volatility, lack of regulation, and infrastructure issues (B) Excessive government adoption (C) Absence of internet facilities (D) Lack of crypto mining
4. The synonym of the word "conventional" is (A) modern. (B) reputed. (C) traditional. (D) conservative.
5. Why might retailers be hesitant to accept cryptocurrency payments? (A) Cash is faster than digital currency. (B) They fear higher taxes. (C) Value can change rapidly. (D) They cannot count digital money.
6. In what way does digital currency most significantly challenge traditional banking? (A) It requires physical branches. (B) It encourages handwritten cheques. (C) It increases ATM dependency. (D) It bypasses intermediaries and direct user control.
7. Which of the following best describes the characteristic of a stablecoin? (A) Pegged to fiat currency. (B) Always increasing in value. (C) More volatile than bitcoin. (D) Backed by physical gold only.
8. "On a digital currency network, transactions are irreversible." The given line means (A) Transaction can be altered once done. (B) Transaction cannot be altered once done. (C) Transaction can be done multiple times. (D) Wait for instruction to complete transaction.
9. The correct synonym of "cost-effective" is (A) risky (B) luxurious (C) economical (D) expensive
10. Why might digital currencies pose a risk despite their technological advantages? (A) They are prone to manipulation. (B) They often require fossil fuels for storage. (C) They are too slow for large-scale commerce. (D) They can be vulnerable to hacking and price volatility.
11. All statements pertaining to digital currency are correct except (A) It is more transparent than physical currency (B) It needs physical manufacturing facilities (C) It reduces the risk of handling cash (D) Its transaction is instantaneous
12. Central Bank Digital Currencies (CBDC) differ from cryptocurrency because (A) CBDCs are decentralized and unregulated. (B) CBDCs are issued and regulated by country''s central bank. (C) Cryptocurrencies are issued by the government only. (D) CBDCs cannot be used for online transactions.
13. "They can also find restricted use among certain online communities, such as gaming sites, gambling portals, or social media networks." What can be inferred about the popularity of digital currencies in everyday use? (A) They are widely accepted in public places. (B) They are accepted only in remote villages. (C) They are used for all types of purchases. (D) Their use is limited to specific online communities.
14. The writer''s main purpose in this essay is to (A) entertain the reader with digital currency story. (B) explain and inform the reader about digital currencies. (C) argue on banning the use of digital currencies. (D) provide step-by-step instructions for using cryptocurrencies.
15. "Digital currencies enable instant transaction across border." What is the antonym of the word ''instant'' as used in the sentence? (A) Quick (B) Prompt (C) Immediate (D) Delayed (15 marks)', 'Answers: 1 D, 2 C, 3 A, 4 C, 5 C, 6 D, 7 A, 8 B, 9 C, 10 D, 11 B, 12 B, 13 D, 14 B, 15 D', null, '[{"point": "1 D", "marks": 1}, {"point": "2 C", "marks": 1}, {"point": "3 A", "marks": 1}, {"point": "4 C", "marks": 1}, {"point": "5 C", "marks": 1}, {"point": "6 D", "marks": 1}, {"point": "7 A", "marks": 1}, {"point": "8 B", "marks": 1}, {"point": "9 C", "marks": 1}, {"point": "10 D", "marks": 1}, {"point": "11 B", "marks": 1}, {"point": "12 B", "marks": 1}, {"point": "13 D", "marks": 1}, {"point": "14 B", "marks": 1}, {"point": "15 D", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-2-beddzo2025-cp', 1, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'B0', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Thought and content', 'Relevant, well-developed ideas with examples; answers the question.', 8.0, 1 from me_q where key = 'B0';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Communicative competence and vocabulary', 'Clear organisation, coherence, apt and varied vocabulary.', 5.0, 2 from me_q where key = 'B0';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Grammatical accuracy and variety', 'Accurate grammar, spelling, punctuation; varied sentences.', 2.0, 3 from me_q where key = 'B0';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', 'Question II. 1) Bring out a pro and a con of having digital currency in our economy. (5 marks)', 'Pro: Digital currency allows instant, low-cost payments directly between people without banks or other intermediaries, and anyone with internet access - even in remote villages without bank branches - can use it, improving financial inclusion and record-keeping. Con: It is vulnerable to hacking, and many digital currencies have wild price swings; because transactions are irreversible, a mistake or fraud cannot be undone, which is risky especially for new users with limited digital literacy.', null, '[{"point": "A pro explained (e.g. fast, low-cost transfers without intermediaries; financial inclusion; transparency)", "marks": 2.5}, {"point": "A con explained (e.g. hacking, volatility, irreversible transactions, needs internet and devices)", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-2-beddzo2025-cp', 2, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'B1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Thought and content', 'Relevant, well-developed ideas with examples; answers the question.', 2.0, 1 from me_q where key = 'B1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Communicative competence and vocabulary', 'Clear organisation, coherence, apt and varied vocabulary.', 2.0, 2 from me_q where key = 'B1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Grammatical accuracy and variety', 'Accurate grammar, spelling, punctuation; varied sentences.', 1.0, 3 from me_q where key = 'B1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', 'Question II. 2) According to Kuensel (May 17, 2025), Bhutan launched a national-level tourism crypto payment system with Binance. Highlight any two challenges this crypto payment may pose on the Bhutanese tourism sector. (5 marks)', 'First, cryptocurrencies are volatile, so the value a hotel, guide or handicraft shop receives may fall sharply before it is converted, creating uncertainty for small tourism businesses. Second, crypto payments need reliable internet, devices and digital skills, and they are open to hacking and fraud; since transactions cannot be reversed, mistakes or scams are hard to recover, and regulators must also guard against money laundering.', null, '[{"point": "Challenge 1 explained (e.g. price volatility affecting the value businesses receive)", "marks": 2.5}, {"point": "Challenge 2 explained (e.g. hacking/fraud and irreversible payments; low digital literacy and infrastructure among small businesses; regulation and money-laundering concerns)", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-2-beddzo2025-cp', 3, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'B2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Thought and content', 'Relevant, well-developed ideas with examples; answers the question.', 2.0, 1 from me_q where key = 'B2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Communicative competence and vocabulary', 'Clear organisation, coherence, apt and varied vocabulary.', 2.0, 2 from me_q where key = 'B2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Grammatical accuracy and variety', 'Accurate grammar, spelling, punctuation; varied sentences.', 1.0, 3 from me_q where key = 'B2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', 'Question II. 3) As a teacher, suggest any two ways to create awareness on digital currency among Bhutanese students. (5 marks)', 'First, I would integrate digital currency into lessons and financial-literacy activities - for example, using the Kuensel report on tourism crypto payments to discuss how digital wallets work, their benefits and risks. Second, I would organise awareness programmes such as talks by officials from the Royal Monetary Authority or banks, debates, quiz competitions and club projects that teach students to use digital money safely and recognise scams.', null, '[{"point": "Way 1 explained (e.g. integrate into lessons/financial literacy with real examples)", "marks": 2.5}, {"point": "Way 2 explained (e.g. talks by RMA/bank experts, clubs, projects, debates, safe-use and scam awareness)", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-2-beddzo2025-cp', 4, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'B3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Thought and content', 'Relevant, well-developed ideas with examples; answers the question.', 2.0, 1 from me_q where key = 'B3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Communicative competence and vocabulary', 'Clear organisation, coherence, apt and varied vocabulary.', 2.0, 2 from me_q where key = 'B3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Grammatical accuracy and variety', 'Accurate grammar, spelling, punctuation; varied sentences.', 1.0, 3 from me_q where key = 'B3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'passage', 'Question II. 4) Can digital currency co-exist with physical currency in the long run? Provide two justifications. (5 marks)', 'Yes, they can co-exist. First, central bank digital currencies are designed to supplement, not necessarily replace, fiat currency, so people can choose cash or digital money as suits them - digital for fast online and cross-border payments, cash for everyday local use. Second, not everyone has reliable internet, smartphones or digital skills, especially in rural areas and among the elderly, and cash remains essential during power or network failures; so both forms will be needed for a long time.', null, '[{"point": "Clear stand", "marks": 1}, {"point": "Justification 1 (e.g. CBDCs designed to supplement fiat; different users and needs)", "marks": 2}, {"point": "Justification 2 (e.g. limited internet/digital literacy, need for cash in emergencies and rural areas)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'comprehension'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, 'me-bed-2-beddzo2025-cp', 5, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'B4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Thought and content', 'Relevant, well-developed ideas with examples; answers the question.', 2.0, 1 from me_q where key = 'B4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Communicative competence and vocabulary', 'Clear organisation, coherence, apt and varied vocabulary.', 2.0, 2 from me_q where key = 'B4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Grammatical accuracy and variety', 'Accurate grammar, spelling, punctuation; varied sentences.', 1.0, 3 from me_q where key = 'B4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which preposition correctly completes the idiomatic phrase? He took the criticism ______ stride.', null, 'The idiom is ''take something in (one''s) stride''.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'language-and-grammar'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C1-1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'under', false, 1), ('B', 'at', false, 2), ('C', 'by', false, 3), ('D', 'in', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C1-1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Select the sentence type: "How swiftly wind howls tonight!"', null, 'It expresses strong feeling and ends with ''!''.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'language-and-grammar'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C1-3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Exclamatory', true, 1), ('B', 'Imperative', false, 2), ('C', 'Declarative', false, 3), ('D', 'Interrogative', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C1-3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which of the following sentences is grammatically flawed?', null, 'Dangling modifier: the exam was not tired.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'language-and-grammar'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C1-4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'She found the exam challenging after studying all night.', false, 1), ('B', 'Tired after studying all night, the exam was challenging.', true, 2), ('C', 'Tired after studying all night, she found the exam challenging.', false, 3), ('D', 'After studying all night, she felt tired during exam.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C1-4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', '"Sonam has invested in the government bonds." The phrase ''has invested'' is an example of', null, 'has/have + past participle.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'language-and-grammar'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C1-5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Present perfect tense.', true, 1), ('B', 'Simple past tense.', false, 2), ('C', 'Past perfect tense.', false, 3), ('D', 'Simple present tense.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C1-5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Choose the correct phrasal verb to complete the sentence: It''s important to ______ the teachings of the elders instead of discarding them.', null, '''hold on to'' fits the meaning.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'language-and-grammar'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C2-1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'hold on to', true, 1), ('B', 'hold off', false, 2), ('C', 'fall back on', false, 3), ('D', 'fall out with', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C2-1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Choose the correct phrasal verb to complete the sentence: The monks aimed to ______ peace and harmony through their teachings and community work.', null, '''bring about'' fits the meaning.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'language-and-grammar'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C2-2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'bring up', false, 1), ('B', 'bring off', false, 2), ('C', 'bring about', true, 3), ('D', 'bring down', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C2-2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Choose the correct phrasal verb to complete the sentence: During the debate, she managed to ______ her point clearly despite the distractions.', null, '''get across'' fits the meaning.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'language-and-grammar'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C2-3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'get over', false, 1), ('B', 'get across', true, 2), ('C', 'get in', false, 3), ('D', 'get by', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C2-3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Choose the correct phrasal verb to complete the sentence: The student ______ an obscure reference in the ancient manuscript while researching.', null, '''came across'' fits the meaning.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'language-and-grammar'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C2-4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'put forward', false, 1), ('B', 'came by', false, 2), ('C', 'came across', true, 3), ('D', 'put off', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C2-4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Choose the correct phrasal verb to complete the sentence: After due consideration, the high court ______ the verdict of the lower court.', null, '''set aside'' fits the meaning.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'language-and-grammar'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C2-5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'set aside', true, 1), ('B', 'set up', false, 2), ('C', 'set in', false, 3), ('D', 'set off', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C2-5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', '"The novelist used the plot device to cleverly plot the story''s climax." How is the word ''plot'' used, first and then second time?', null, 'The first ''plot'' names a thing (noun); the second is an action (verb).', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'language-and-grammar'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C3-2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'verb both times', false, 1), ('B', 'noun, then verb', true, 2), ('C', 'verb, then noun', false, 3), ('D', 'noun both times', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C3-2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', '"The campaign''s focus was clear, yet it struggled to focus public attention on gender issues." How is the word ''focus'' used, first and then second time?', null, 'The first ''focus'' names a thing (noun); the second is an action (verb).', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'language-and-grammar'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C3-3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'verb, then noun', false, 1), ('B', 'noun both times', false, 2), ('C', 'verb both times', false, 3), ('D', 'noun, then verb', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C3-3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', '"The instructor used a case study as a model to demonstrate theory and asked students to model their project accordingly." How is the word ''model'' used, first and then second time?', null, 'The first ''model'' names a thing (noun); the second is an action (verb).', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'language-and-grammar'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C3-4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'noun both times', false, 1), ('B', 'verb both times', false, 2), ('C', 'noun, then verb', true, 3), ('D', 'verb, then noun', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C3-4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', '"The literary critic gave a review of the book before the author could review the feedback." How is the word ''review'' used, first and then second time?', null, 'The first ''review'' names a thing (noun); the second is an action (verb).', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'language-and-grammar'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'C3-5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'noun both times', false, 1), ('B', 'noun, then verb', true, 2), ('C', 'verb both times', false, 3), ('D', 'verb, then noun', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C3-5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'descriptive', 'Read the information given below carefully and write a précis in not more than 100 words: in one paragraph, including the main points, with a short title. (20 marks)

The Prime Minister highlighted that our country''s economy is fundamentally tied to the Gross National Happiness Index; a decline in GNH signifies a corresponding economic downturn. Despite the pandemic''s impact, he noted a gradual recovery in 2023, with a 4.5% growth rate. Additionally, the literacy rate increased to 70.6%, and improved healthcare services led to a rise in life expectancy to 70%, all made possible through His Majesty''s support for free healthcare and education services. Good Governance stands out as a crucial pillar of GNH and is pivotal to the country''s economic development.

The Prime Minister informed the House that one of the most pressing challenges faced by the country today is the significant emigration of Bhutanese people seeking better employment opportunities abroad, with around 64,000 people, or 9% of the population, already having left. This trend poses risks to the country''s economy and public services due to the loss of skilled workforce, and if not addressed, could lead to further depopulation and economic challenges.

Presenting on the strategy to address this challenge, the Prime Minister reported that, the key is to work on reviving and expanding the economy, with the central focus on the historic Gelephu Mindfulness City, a noble initiative of His Majesty the King, the Economic Stimulus Plan and the 13FYP with substantial investment in infrastructure building to stimulate growth and development in various sectors.

The Prime Minister highlighted the key plans and priorities of the Government to include economic revival and development, enhancement of agriculture and livestock, human resource development, preservation of culture and heritage and foreign relations.

With regard to the Government’s legislative plans and priorities for 2024-2025, the Prime Minister informed that the Government plans to table the Tax Act (Amendment) Bill in the winter session to support private sector development and economic growth.

The Prime Minister concluded the report on the State of the Nation, with expression of gratitude and prayers to His Majesty the King for the visionary leadership and continued guidance and support to the government, the legislature and the people.
(Source: National Assembly of Bhutan)', 'Title: State of the Nation
The Prime Minister said Bhutan''s economy is closely linked to Gross National Happiness and good governance. After the pandemic the economy recovered, growing 4.5% in 2023, while literacy and life expectancy rose thanks to His Majesty''s support for free education and health care. The gravest challenge is emigration: about 64,000 people, 9% of the population, have left, draining skilled workers. To respond, the Government will revive the economy through Gelephu Mindfulness City, the Economic Stimulus Plan and the 13th Five Year Plan, prioritising agriculture, human resources, culture and foreign relations, and will amend the Tax Act. (about 100 words)', null, '[{"point": "Suitable short title", "marks": 2}, {"point": "Economy tied to GNH; recovery (4.5% growth 2023), literacy and life expectancy gains through free health and education; good governance", "marks": 5}, {"point": "Main challenge: emigration of about 64,000 (9%) - loss of skilled workforce", "marks": 4}, {"point": "Strategy: revive economy - GMC, Economic Stimulus Plan, 13th FYP; priorities and Tax Act (Amendment) Bill", "marks": 5}, {"point": "One paragraph, own words, within 100 words", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'precis-writing'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper II - English for Dzongkha Graduates", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'D1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Thought and content', 'Relevant, well-developed ideas with examples; answers the question.', 10.0, 1 from me_q where key = 'D1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Communicative competence and vocabulary', 'Clear organisation, coherence, apt and varied vocabulary.', 7.0, 2 from me_q where key = 'D1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Grammatical accuracy and variety', 'Accurate grammar, spelling, punctuation; varied sentences.', 3.0, 3 from me_q where key = 'D1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which sentence uses the relative pronoun correctly?', null, '''Who'' is the subject pronoun for people.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'language-and-grammar'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'CN1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The teacher which taught us Dzongkha has retired.', false, 1), ('B', 'The teacher whose taught us Dzongkha has retired.', false, 2), ('C', 'The teacher who taught us Dzongkha has retired.', true, 3), ('D', 'The teacher whom taught us Dzongkha has retired.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'CN1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', '"I will finish the report," she said. Choose the correct indirect speech.', null, 'Past reporting verb: will becomes would; I becomes she.', '[]'::jsonb, (select id from public.subjects where slug = 'english-language'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'english-language') and t.slug = 'language-and-grammar'), (select id from public.exam_papers where code = 'me-bed-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper II (Dzongkha Graduates, English): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'bed-dzongkha-graduates'), null)
  returning id
)
insert into me_q select 'CN2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'She said that she will finish the report.', false, 1), ('B', 'She says that she would finish the report.', false, 2), ('C', 'She said that I would finish the report.', false, 3), ('D', 'She said that she would finish the report.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'CN2';
commit;
