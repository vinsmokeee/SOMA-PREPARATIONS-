"""ME General Paper III (Bhutan: socio-political institutions; socio-economic development since 1961), BCSE 2020 -
real questions only (PDF sent by the founder, 24 Nov 2026; exam held 27 February 2021). Joins the 2025 bank (pattern from
me_general3_2025.py). Same layout as the latest papers: 5 questions in Part A (any 2) and 7 in Part B (any 3), 20 marks
each - so no marks were changed. Part B stems carried no printed marks; "(20 marks)" added as in the latest papers.
Part A Q4 b) (media and democracy) is close to BCSE 2024 Part A Q2 a) but asks a different thing and comes with a
different part a), so it is kept as its own question.
Model answers and marking guides were written by Claude: please check before publishing.
"""
import os, runpy
_base = runpy.run_path(os.path.join(os.path.dirname(__file__), "me_general3_2025.py"))
PATTERN, RUBRIC = _base["PATTERN"], _base["RUBRIC"]
A, B = "long_answer", "analytical"

BATCH = "ME Paper III (General): BCSE 2020, batch 2"
GROUP_TAG = "2020b2"
PAPER = "me-general-3"
SUBJECT = "bhutan-institutions-development"
ADDS_TO_PAPER = True
SOURCE = {"title": "BCSE 2020 Main Examination, General category, Paper III", "year": 2020, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}

Q = [
dict(key="A1", real=True, type=A, topic="History and democracy: tertons and civil society", stem="""a) One of the most prestigious treasure-discoverers or tertons who left both family lines and religious legacies in Bhutan is Dorje Lingpa (1346-1405), one of the five 'king' tertons. Explain how Dorje Lingpa's legacy contributed to the richness of social and cultural life of the Bhutanese people. (10 marks)
b) Clause 3 of Article 9 (Principles of State Policy) of the Constitution of Bhutan states, "The State shall endeavour to create a civil society free of oppression, discrimination and violence, based on the rule of law, protection of human rights and dignity, and to ensure the fundamental rights and freedoms of the people". In your opinion, how are Bhutan's Civil Society Organizations (CSOs) important for the success of democracy and development? Please elucidate with appropriate reasons. (10 marks)""",
 key_points=[("a) Dorje Lingpa as a terton: revealed treasure teachings (Dzogchen, rituals, medicine, astrology) that enriched religious practice; visits to Bhutan, especially Bumthang, and temples/ sites associated with his tradition", 5),
             ("a) Social and cultural legacy: noble family lines (choeje families, e.g. in Bumthang) that became religious and social leaders; ritual dances, festivals and ceremonies of his tradition still performed; preservation of art, texts and local identity", 5),
             ("b) Role of CSOs in democracy: voice for citizens and vulnerable groups, civic education and participation, accountability and watchdog role, advocacy on policy, protection of rights (Article 9(3))", 5),
             ("b) Role in development: service delivery in areas the State cannot reach (e.g. Tarayana, RENEW, Bhutan Youth Development Fund, Ability Bhutan Society), environment (RSPN), volunteerism, partnership with government; registered under the CSO Act 2007 and CSO Authority; challenges (funding, capacity) and conclusion", 5)],
 model="""a) Dorje Lingpa (1346-1405) was one of the five great 'terton kings' of the Nyingma tradition. He discovered many treasure teachings (terma) concealed by Guru Rinpoche, covering Dzogchen meditation, rituals, medicine and astrology, which widened and deepened religious practice in Bhutan. He travelled to Bhutan, especially Bumthang, where temples and sacred sites are associated with him and his tradition. His most lasting legacy is social: his descendants founded noble religious families (choeje), for example in the Bumthang valleys, who served as religious teachers, patrons and community leaders for centuries and helped maintain temples and village rituals. Ritual dances, annual ceremonies and festivals of his tradition are still performed, bringing communities together, while the art, texts and relics kept by these families preserve local history and identity. Together, the Dorje Lingpa lineage, like that of Pema Lingpa, enriched Bhutan's spiritual life, its festivals and its social structure.
b) Civil Society Organisations are registered and regulated under the Civil Society Organizations Act 2007 and the CSO Authority. They matter for democracy because they: (1) give a voice to citizens, especially women, children, youth, persons with disabilities and the poor; (2) educate citizens about their rights and duties and encourage participation beyond voting; (3) act as watchdogs, promoting accountability and transparency; (4) contribute ideas to policy and law-making; and (5) help protect rights and dignity, as Article 9(3) intends. They matter for development because they deliver services where government reach is limited - for example Tarayana Foundation in remote villages, RENEW for victims of domestic violence, the Bhutan Youth Development Fund for youth, Ability Bhutan Society for children with disabilities and RSPN for conservation. They mobilise volunteers and external funds and work as partners of government. Their challenges are limited funding and capacity and dependence on donors; with support and independence, CSOs make Bhutan's democracy deeper and development more inclusive."""),
dict(key="A2", real=True, type=A, topic="History: Desis and the Raven Crown", stem="""a) The 16th Desi Sonam Lhundrub alias Zhidhar (reign: 1768-1772) was a great leader and warrior in the annals of successive Desis of Bhutan. Discuss the lives and deeds of Desi Sonam Lhundrub with reference to the first encounter with the British and the battle of Cooch Behar which eventually led to the signing of the 1774 British-Bhutanese Treaty. (10 marks)
b) Desi Jigme Namgyel's victory over all the obstructions on his path to political career was supposedly attributed to (his wearing of) the Raven Crown in accordance with the prophecy, which ultimately became the most important and sacred Royal Crown of the Monarchs of Bhutan. Explain the religious and political significance of the Raven Crown to our country. (10 marks)""",
 key_points=[("a) Zhidhar: strong, ambitious ruler; large building works and heavy labour demands made him unpopular; intervened in the succession in Cooch Behar and took control there, capturing its ruler", 4),
             ("a) First encounter with the British: Cooch Behar appealed to the East India Company (Warren Hastings); British troops drove the Bhutanese out of Cooch Behar and into the duars (1772-73); Zhidhar overthrown and fled; Panchen Lama mediated; Anglo-Bhutanese Treaty of 25 April 1774 restored peace and trade terms", 6),
             ("b) Religious: crown topped by the raven head of Legon Jarog Dongchen (raven-headed form of Mahakala), the protective deity who guided Zhabdrung to Bhutan; divine protection and blessing", 5),
             ("b) Political: worn by Jigme Namgyel as Trongsa Penlop/ Desi, adopted by Ugyen Wangchuck and all Kings; symbol of legitimacy, sovereignty, continuity from Zhabdrung, unity of the nation; worn at coronations", 5)],
 model="""a) Desi Sonam Lhundrub, known as Zhidhar, was a forceful and ambitious ruler. At home he undertook major construction works and demanded heavy labour, which made him unpopular. Abroad he intervened in a succession dispute in the neighbouring kingdom of Cooch Behar, placed his own candidate in power and took the Cooch Behar ruler captive. The rival faction appealed to the British East India Company under Warren Hastings, which sent troops. In this first armed encounter between Bhutan and the British (1772-73), Bhutanese forces were driven out of Cooch Behar and lost positions in the duars. Facing defeat abroad and opposition at home, Zhidhar was overthrown and fled. The Panchen Lama of Tibet interceded with Hastings on Bhutan's behalf, and the new Desi concluded the Anglo-Bhutanese Treaty of 25 April 1774, which restored peace, returned some territory and opened the way for trade and later British missions such as George Bogle's (1774).
b) The Raven Crown is crowned with the head of a raven representing Legon Jarog Dongchen, the raven-headed form of Mahakala, the guardian deity who, according to tradition, guided Zhabdrung Ngawang Namgyel to Bhutan. Religiously, it symbolises the protection of the nation by this deity and the blessing of the Dharma on the ruler. Politically, Jigme Namgyel, as Trongsa Penlop and later Desi, wore it in battle and his successes were attributed to it; his son Ugyen Wangchuck adopted it, and since 1907 it has been the royal crown worn by every Druk Gyalpo at the coronation. It therefore symbolises the legitimacy of the Wangchuck dynasty, continuity with Zhabdrung's vision, the sovereignty of Bhutan and the unity of its people."""),
dict(key="A3", real=True, type=A, topic="Local government and the monarchy", stem="""a) The government is working on the gewog rationalization exercise in which many gewogs across the 20 dzongkhags are planned to be merged to strengthen the capacity of local governments. In light of this fact, in your opinion, how would merging of gewogs help strengthen the capacity of local governments in the long run? Please articulate with reasons that you think would be valid. (10 marks)
b) Since the establishment of the hereditary monarchy, the monarchs of Bhutan have been the fountainhead of peace, stability and unity. Critically assess the role of the monarchy in a democratic setting in ensuring peace, stability and unity in our country. (10 marks)""",
 key_points=[("a) Benefits: larger population and resource base, economies of scale, better use of the budget and staff, more professional staff and capacity, fewer small gewogs with duplicated offices, better planning and service delivery, reduces administrative costs given rural depopulation", 6),
             ("a) Concerns and conditions: distance from services for remote villages, local identity, representation; need for consultation, good roads/ digital services; balanced opinion", 4),
             ("b) Role: King as Head of State and symbol of unity (Article 2), above party politics, guardian of the Constitution, kidu, national service (De-suung), leadership in crises, introduced democracy; safeguards (retirement at 65, abdication procedure)", 7),
             ("b) Critical assessment: unifying force amid party divisions; democracy needs strong institutions and citizens too; balanced conclusion", 3)],
 model="""a) Many gewogs are small in population and resources, and rural-urban migration has shrunk them further. Merging gewogs can strengthen local governments by: (1) creating larger units with a bigger population and resource base, so budgets and staff are used more efficiently; (2) reducing duplicated offices and administrative costs, freeing funds for development; (3) allowing more qualified, specialised staff (engineers, planners, accountants) to serve each gewog; (4) enabling better planning of larger projects such as roads, irrigation and markets across a wider area; and (5) improving service delivery and accountability. Concerns must be managed: people in remote villages may have to travel further for services, local identity and representation may weaken, and the change needs consultation. With good roads, digital services (e.g. online G2C services) and community outreach, merging can build stronger and more capable local governments in the long run.
b) Under Article 2 of the Constitution, the Druk Gyalpo is the Head of State and the symbol of unity of the Kingdom and its people. In a democracy the monarchy remains above party politics, providing continuity and a unifying focus when elections divide people. The Kings have guarded the Constitution, ensured smooth transfers of power, granted kidu to the needy, created De-suung and Gyalsung to build national service, and led the nation in crises such as the 2003 operations against militants and the COVID-19 pandemic. It was the Fourth King who introduced democracy, and the Constitution includes safeguards - retirement of the King at 65 and a procedure for abdication. Critically, peace and stability in a democracy also depend on strong institutions, the rule of law and responsible citizens; the monarchy works best when these are also strong. On balance the monarchy remains the foundation of Bhutan's peace, stability and unity."""),
dict(key="A4", real=True, type=A, topic="Religion, media and democracy", stem="""a) The Constitution of Bhutan does not allow proselytization or coercing people to follow another faith. Unfortunately, some overzealous people think otherwise. A lot of Bhutanese people are being enticed through different ways to change their faith. In your opinion, what could be the rationale for disallowing proselytization or coercing people to follow another faith in Bhutan? Please justify. (10 marks)
b) The role of mass media is extremely crucial for the strengthening of the democratic process by educating the citizens on the various relevant issues. Discuss the role of Bhutanese mass media in fostering and strengthening democracy in Bhutan. (10 marks)""",
 key_points=[("a) Constitutional basis: Article 7(4) freedom of thought, conscience and religion, no compulsion by coercion or inducement; Buddhism as spiritual heritage (Article 3); Religious Organizations Act", 3),
             ("a) Rationale: protect freedom of belief and the vulnerable from inducement, preserve social harmony and prevent religious conflict, protect culture and identity of a small nation, unity and security, keep religion above politics", 7),
             ("b) Roles: informing citizens, voter education during elections, platform for debate, watchdog on government and corruption, giving voice to people, holding leaders accountable, promoting transparency and participation; examples (Kuensel, BBS, private media)", 7),
             ("b) Limitations and suggestions: financial and capacity constraints, social media misinformation; need independence and professionalism", 3)],
 model="""a) Article 7(4) of the Constitution guarantees every Bhutanese freedom of thought, conscience and religion, and states that no person shall be compelled to belong to another faith by means of coercion or inducement. The rationale is: (1) to protect genuine freedom of belief - a change of faith should come from conviction, not from money, gifts, jobs or pressure; (2) to protect vulnerable people such as the poor, the sick and the young from being exploited; (3) to maintain social harmony - aggressive conversion can divide families and communities and has caused conflict in many countries; (4) to protect the culture and identity of a small nation, whose Buddhist spiritual heritage (Article 3) shapes its values, art, festivals and GNH; and (5) to safeguard national unity and security. The ban does not prevent anyone from practising their own religion; it protects everyone's freedom equally.
b) The mass media - Kuensel, BBS, private newspapers, radio and online outlets - strengthen democracy by: (1) informing citizens about government policies, laws and public issues; (2) educating voters during elections through debates, coverage of party manifestos and candidate forums; (3) providing a platform for public debate and the views of ordinary people; (4) acting as a watchdog, reporting on corruption, misuse of resources and poor services, so leaders are held accountable; and (5) promoting transparency and participation. Their effectiveness is limited by small markets, financial pressures, a shortage of experienced journalists and the spread of misinformation on social media. A free, professional and financially sustainable media, together with media-literate citizens, is essential for a vibrant democracy."""),
dict(key="A5", real=True, type=A, topic="Religious leaders: the Je Khenpo", stem="""His Holiness the 70th Je Khenpo Trulku Jigme Choeda is the longest serving Je Khenpo of Bhutan. His Holiness is renowned for taking major initiatives to benefit our people and uphold Buddha Dharma aside from the regular duty of overseeing the welfare of the Central Monastic Body. Discuss some of His Holiness's significant works which contributed towards improving the spiritual and socio-cultural life of the people of Bhutan. (20 marks)""",
 key_points=[("Background: Trulku Jigme Choeda, enthroned as 70th Je Khenpo in 1996; head of the Zhung Dratshang; longest serving", 2),
             ("Spiritual works: teachings, empowerments (wangs) and mass prayer gatherings across dzongkhags (e.g. Moenlam Chenmo), consecration of temples and statues, strengthening monastic education - shedras, drubdeys, curriculum", 7),
             ("Socio-cultural works: support for nuns and nunneries, including the first full ordination of Bhutanese nuns (gelongma) in 2022; preservation of scriptures, rituals and arts; restoration of temples", 6),
             ("Social programmes: Zhung Dratshang outreach on health and social issues (HIV/AIDS, substance abuse), counselling, care for the elderly and youth, prayers for the nation in crises (e.g. COVID-19); conclusion on impact", 5)],
 model="""His Holiness Trulku Jigme Choeda was enthroned as the 70th Je Khenpo, the spiritual head of the Zhung Dratshang (Central Monastic Body), in 1996, and is the longest-serving Je Khenpo in Bhutan's history.
Spiritual contributions:
1. Teachings and empowerments: His Holiness travels widely across the dzongkhags giving teachings, empowerments (wangs) and blessings, bringing the Dharma directly to ordinary people in remote villages.
2. Mass prayers: he has presided over large prayer gatherings such as the annual Moenlam Chenmo (Great Prayer Festival), where thousands gather to pray for the King, the country and the world.
3. Monastic education: he strengthened and expanded monastic colleges (shedras) and meditation centres (drubdeys), improving the quality of Buddhist education for monks.
4. Consecration of temples, statues and stupas across the country.
Socio-cultural contributions:
5. Support for nuns: he supported the nunneries and women's religious education, and in 2022 presided over the first full ordination (gelongma) of Bhutanese nuns - a historic step for gender equality in religious life.
6. Preservation of heritage: support for preserving scriptures, rituals, mask dances and religious arts, and for the restoration of temples and dzongs.
Social contributions:
7. Under his leadership the monk body has engaged in social outreach - awareness on health issues such as HIV/AIDS, campaigns against substance abuse, counselling, care for the elderly and guidance for youth.
8. He has led prayers and rituals for the nation's wellbeing during crises such as the COVID-19 pandemic, giving people comfort and hope.
Through these works His Holiness has strengthened the spiritual foundation of Bhutanese society, preserved its culture and made the monastic body a source of guidance and service for all."""),
dict(key="B1", real=True, type=B, topic="Economic roadmap", stem=""""We have to create economic opportunities for the next generation. It's time to recalibrate ourselves to succeed in the fast-paced world. The government, lawmakers, private sector, people, and experts in various fields must work collectively to chart out a clear economic roadmap for the 21st Century." - His Majesty The King, 112th National Day.
Suggest critical elements/areas in detail that the 21st Century Economic Roadmap should encompass in order to achieve the economic development envisioned by His Majesty The King. (20 marks)""",
 key_points=[("Context: need for new growth beyond hydropower, youth jobs, LDC graduation, technology; collective effort", 2),
             ("Economic diversification and private sector: ICT/ digital economy, high-value tourism, agriculture and agro-processing, manufacturing and cottage industries, mining with value addition, FDI, ease of doing business, SME finance", 7),
             ("Human capital: education and skills reform, TVET, entrepreneurship, STEM and digital skills, health", 4),
             ("Enablers: infrastructure and connectivity, reform of regulations and civil service, fiscal and monetary stability (FCR, debt), green/ climate-resilient growth and GNH values, innovation, implementation and monitoring", 7)],
 model="""His Majesty's call reflects the need for Bhutan to create new opportunities for the young generation, reduce dependence on hydropower and aid, and prepare for graduation from LDC status and a fast-changing world. The roadmap should include:
1. Economic diversification: develop new engines of growth - ICT and the digital economy (software, data services, fintech), high-value sustainable tourism, commercial agriculture and agro-processing, organic and niche products, manufacturing and cottage industries, and mining with domestic value addition.
2. A dynamic private sector: improve ease of doing business through simpler licensing and approvals, stable policies, a liberal FDI policy, access to finance for SMEs and start-ups, and fair competition.
3. Human capital: reform education to build critical thinking, STEM and digital skills; expand quality TVET; promote entrepreneurship and lifelong learning; keep the population healthy.
4. Infrastructure and connectivity: roads, logistics, dry ports, reliable internet and digital public services, urban planning.
5. Macroeconomic stability: manage public debt and the fiscal deficit, protect foreign currency reserves, broaden the tax base.
6. Green and resilient growth: protect forests and the environment, carbon neutrality, climate-resilient agriculture and clean energy, in line with GNH.
7. Governance and institutional reform: an efficient, accountable civil service, less red tape, evidence-based policy and strong implementation and monitoring.
8. Innovation and the diaspora: research, start-up ecosystems, and engaging Bhutanese abroad for skills and investment.
Together, with the government, private sector and people working collectively, these elements can create jobs and a prosperous, self-reliant economy."""),
dict(key="B2", real=True, type=B, topic="Development challenges", stem="""Bhutan's socio-economic development has been unprecedented in taking the country forward. While the progress of the development thus far is highly commendable, Bhutan is confronted with challenging issues (by-products of the development) such as rural-urban migration, youth unemployment and unbalanced regional development.
Choose the most challenging issue(s) and provide appropriate interventions/strategies to address the issue(s) you have chosen. (20 marks)""",
 key_points=[("Chooses issue(s) and justifies why most challenging, with causes (e.g. jobs concentrated in towns, education-job mismatch, preference for civil service, poor rural services and incomes)", 6),
             ("Consequences: gungtong/ fallow land, urban pressure (housing, water, crime), social problems, regional inequality, emigration", 4),
             ("Interventions: rural infrastructure and services, commercial agriculture and agro-industry, decentralisation and regional growth centres, skills/ TVET, entrepreneurship finance, private sector jobs, attitudes and career guidance, balanced resource allocation", 10)],
 model="""I choose youth unemployment as the most challenging issue, because it is linked with the other two: young people leave villages in search of jobs (rural-urban migration), and jobs are concentrated in a few towns (unbalanced regional development).
Causes: the economy creates too few private sector jobs; many graduates prefer white-collar civil service jobs; there is a mismatch between the skills taught and those employers need; agriculture is seen as unattractive because of low incomes, wildlife damage and hard work; and rural areas lack services and opportunities.
Consequences: frustration, substance abuse and crime among idle youth; overcrowding of Thimphu and Phuentsholing; gungtong (empty houses) and fallow land in villages; dependence on foreign workers in construction; and increasing emigration of youth abroad.
Interventions:
1. Skills that match the market: expand technical and vocational training, apprenticeships and internships linked to industry needs, and reform education to build practical and digital skills.
2. Entrepreneurship: provide start-up finance (low-interest and collateral-free loans), incubation centres, mentoring and easier business registration.
3. Private sector growth: improve the business environment, attract FDI, and develop sectors such as ICT, tourism, agro-processing and manufacturing that create jobs.
4. Make agriculture attractive: commercial farming, irrigation, mechanisation, electric fencing, markets and cooperatives, so youth can earn good incomes in rural areas.
5. Balanced regional development: invest in infrastructure and services in rural dzongkhags, develop regional growth centres and industrial estates outside the main towns, and allocate resources fairly.
6. Changing attitudes: career guidance, respect for blue-collar work and well-regulated overseas employment programmes.
Addressing unemployment in this way will also reduce migration and regional imbalance."""),
dict(key="B3", real=True, type=B, topic="Foreign policy", stem="""For any country, expansion of diplomatic relations is one of the means to advance its foreign policy objectives. In the last few decades, Bhutan has established diplomatic relations with numerous countries. With formalization of diplomatic relations with Germany in 2020, Bhutan now has diplomatic relations with 53 countries and the European Union.
What are some of the core objectives of Bhutan's foreign policy and socio-economic benefits of having diplomatic relations with as many countries as possible? (20 marks)""",
 key_points=[("Core objectives: safeguard sovereignty, security and territorial integrity; promote national interest and economic self-reliance; strengthen relations with India and neighbours; enhance Bhutan's international image and GNH; multilateral engagement (UN since 1971, SAARC, BIMSTEC); Article 9(24) promotion of goodwill and cooperation", 8),
             ("Socio-economic benefits: development assistance and grants, trade and market access, investment (FDI), tourism promotion, scholarships and capacity building, technology transfer, employment opportunities for Bhutanese, support in disasters/ COVID-19 (vaccines), cultural exchange", 9),
             ("Cautions: costs of embassies, balance with small size and cultural preservation; conclusion", 3)],
 model="""Core objectives of Bhutan's foreign policy:
1. Safeguarding sovereignty, security and territorial integrity - the overriding goal for a small landlocked country between two large neighbours.
2. Promoting national interest and economic self-reliance through cooperation for development.
3. Maintaining close and friendly relations with India and good relations with neighbouring countries.
4. Enhancing Bhutan's international profile and promoting its values such as GNH, environmental conservation and peace.
5. Active participation in multilateral forums - the United Nations (member since 1971), SAARC, BIMSTEC, and others - in line with Article 9(24) of the Constitution, which directs the State to promote goodwill and cooperation with nations and respect international law.
Socio-economic benefits of wide diplomatic relations:
1. Development assistance - grants, soft loans and technical support for health, education, infrastructure and governance.
2. Trade and market access for Bhutanese exports, and diversification of trading partners.
3. Foreign direct investment and partnerships in sectors such as hydropower, ICT and tourism.
4. Tourism promotion and easier travel.
5. Scholarships, training and capacity building for Bhutanese students and officials.
6. Technology transfer and knowledge sharing.
7. Employment and study opportunities abroad for Bhutanese youth.
8. Support in emergencies - for example, vaccines and medical supplies donated by partner countries during COVID-19.
9. Cultural exchange and wider understanding of Bhutan.
At the same time, Bhutan must weigh the costs of maintaining missions and preserve its identity; a careful, gradual expansion of relations - as with Germany in 2020 - serves the country's interests best."""),
dict(key="B4", real=True, type=B, topic="Small and medium enterprises", stem="""Small and Medium Enterprises (SMEs) have a huge potential to contribute to socio-economic development, particularly in developing countries. This is no exception to Bhutan, as SMEs constitute over 98% of the enterprises. However, SMEs contribute marginally to the Gross Domestic Product and are faced with challenges in realising their full potential.
What are some of the challenges faced by SMEs in Bhutan? Suggest ways to address these challenges. (20 marks)""",
 key_points=[("Challenges: access to finance (collateral, interest), small domestic market and competition from Indian imports, high input and transport costs, shortage of skilled workers, limited technology and innovation, poor marketing and branding, regulatory burden/ licensing, limited land and infrastructure, weak business skills, foreign exchange constraints", 10),
             ("Ways to address: collateral-free/ credit guarantee schemes, start-up and CSI finance, business incubation and training, cluster development and common facilities, marketing support and 'Made in Bhutan' branding, e-commerce and export promotion, simplified regulations and one-stop services, infrastructure and industrial land, linkages with large firms and public procurement", 10)],
 model="""Challenges faced by SMEs in Bhutan:
1. Access to finance: banks demand collateral and charge high interest, which most small entrepreneurs cannot meet.
2. Small domestic market: limited demand and difficulty achieving economies of scale.
3. Competition from cheaper and better-known Indian products.
4. High costs: most raw materials are imported and transport over difficult terrain is expensive.
5. Shortage of skilled workers and managers; reliance on foreign workers.
6. Limited technology, innovation and quality standards.
7. Weak marketing, branding and market information.
8. Regulatory burden - licences, clearances and procedures.
9. Limited industrial land, infrastructure and utilities.
10. Shortages of foreign exchange to import inputs.
Ways to address them:
1. Improve finance through credit guarantee schemes, collateral-free loans, the CSI bank and start-up funds.
2. Provide business incubation, training in management, accounting and marketing, and mentoring.
3. Develop industrial clusters and common facility centres to share equipment and reduce costs.
4. Support marketing and branding - 'Made in Bhutan' labels, trade fairs, e-commerce platforms and export promotion.
5. Encourage use of local raw materials and preferential public procurement of local products.
6. Simplify licensing and approvals through one-stop online services.
7. Provide industrial land, roads, electricity and internet in regional areas.
8. Promote technology adoption, quality certification and innovation.
9. Link SMEs with larger firms and hydropower and construction projects as suppliers.
With these measures SMEs can grow, create jobs and contribute much more to GDP."""),
dict(key="B5", real=True, type=B, topic="COVID-19 and the economy", stem="""The impact of COVID-19 has been severe, extending beyond public health. It has had a devastating socio-economic impact all over the world, including Bhutan.
What are the adverse socio-economic impacts of COVID-19 in Bhutan? Suggest the way forward. (20 marks)""",
 key_points=[("Economic impacts: tourism collapse (hotels, operators, guides, crafts, airlines), contraction of the economy, construction delays (foreign labour, imports), loss of jobs and incomes, business closures, loan repayment difficulties, fiscal pressure and debt, reduced revenue, FCR pressure", 7),
             ("Social impacts: unemployment and returnees from abroad, disrupted education, mental health and substance abuse, domestic violence, poverty and inequality, delayed health services, social restrictions", 5),
             ("Way forward: Druk Gyalpo's Relief Kidu and monetary measures, economic recovery and diversification, food self-sufficiency, skills and job programmes (Build Bhutan, re-skilling), digital economy and e-learning, health system strengthening, private sector support, resilience planning", 8)],
 model="""Adverse economic impacts:
1. Tourism collapsed after borders closed in March 2020 - hotels, tour operators, guides, drivers, restaurants, handicraft shops and the airlines lost almost all income.
2. The economy contracted sharply in 2020; government revenue fell while spending on health and relief rose, widening the fiscal deficit.
3. Construction and hydropower projects were delayed because of shortages of foreign workers and imported materials.
4. Many businesses closed or cut staff; borrowers struggled to repay loans.
5. Disruption of trade and supply chains raised prices and put pressure on foreign currency reserves.
Adverse social impacts:
1. Unemployment rose, especially among youth, and many Bhutanese working abroad returned home.
2. Education was disrupted by school closures; students without internet or devices fell behind.
3. Mental health problems, substance abuse and domestic violence increased.
4. Poverty and inequality worsened for daily-wage earners and the informal sector.
5. Routine health services and referrals were delayed.
Way forward:
1. Continue targeted relief such as the Druk Gyalpo's Relief Kidu and monetary measures (interest waivers, loan deferrals) while phasing them out carefully.
2. Diversify the economy beyond tourism and hydropower - agriculture, ICT, manufacturing.
3. Strengthen food self-sufficiency and domestic production.
4. Create jobs and re-skill workers through programmes such as Build Bhutan and skills training in construction, agriculture and ICT.
5. Invest in the digital economy, e-learning and e-commerce.
6. Strengthen the health system and emergency preparedness.
7. Support the private sector with finance and simpler regulations, and plan for resilience against future shocks.
Bhutan's response, under His Majesty's leadership, contained the pandemic well; the next challenge is a resilient, diversified recovery."""),
dict(key="B6", real=True, type=B, topic="Gross National Happiness", stem="""Globally, the most popular yardstick for development is Gross Domestic Product (GDP). But Bhutan uses Gross National Happiness (GNH) to measure the progress of its development, and GDP is considered a mere subset of GNH.
What are the pros and cons of using GNH as the yardstick for development? (20 marks)""",
 key_points=[("Explains GNH: four pillars, nine domains, 33 indicators, GNH Index and surveys, GNH screening tools for policies; GDP measures only output", 4),
             ("Pros: holistic (wellbeing, culture, environment, governance, health, community), balances growth with sustainability, guides policy screening, protects environment and culture, focus on equity, internationally recognised (UN resolution, Happiness Day)", 8),
             ("Cons: subjective and hard to measure/ compare, less understood by investors and partners, may slow economic decisions, data cost and frequency, risk of complacency about poverty/ jobs, gap between philosophy and practice; balanced conclusion", 8)],
 model="""Gross National Happiness, articulated by His Majesty the Fourth King, holds that development should aim at the wellbeing and happiness of people, not just material growth. It rests on four pillars - sustainable and equitable socio-economic development, environmental conservation, preservation and promotion of culture, and good governance - and is measured by the GNH Index (9 domains and 33 indicators) through national surveys. GDP, by contrast, measures only the market value of goods and services produced.
Pros of GNH:
1. Holistic: it captures health, education, psychological wellbeing, time use, community vitality, culture, environment, governance and living standards, which GDP ignores.
2. Balances growth with sustainability, so economic activity does not destroy forests, rivers and culture - Bhutan remains carbon negative.
3. Guides policy: GNH policy screening tools assess proposed policies against its domains.
4. Emphasises equity and the wellbeing of all, not just averages.
5. Gives Bhutan a distinct identity and global recognition - the UN resolution on happiness (2011) and the International Day of Happiness.
Cons of GNH:
1. Happiness is subjective and difficult to measure and compare across people and countries.
2. Investors, lenders and many partners understand GDP better; GNH may be seen as vague.
3. Screening and balancing may slow economic decisions and investment.
4. Surveys are costly and infrequent, so data quickly become outdated.
5. There is a risk of complacency about real problems such as unemployment, poverty and debt, or of a gap between philosophy and practice.
Conclusion: GNH is a valuable, holistic framework; it works best alongside sound economic indicators such as GDP, so that growth serves wellbeing."""),
dict(key="B7", real=True, type=B, topic="Private sector finance", stem="""In October 2020, the Government launched the National Credit Guarantee Scheme (NCGS) to enhance access to financing and develop the private sector, so that the private sector can be a critical partner of the Government in pursuit of economic development.
What are the focus areas of NCGS and how can it contribute to the development of the private sector in the country? (20 marks)""",
 key_points=[("What it is: government guarantee of part of loans so banks lend to viable projects without full collateral; aimed at cottage, small and medium enterprises, start-ups and priority sectors", 4),
             ("Focus areas: priority sectors such as agriculture and livestock, manufacturing/ production, cottage and small industries, start-ups and youth entrepreneurs, import substitution and export-oriented/ job-creating businesses", 6),
             ("Contribution: access to finance without collateral, new businesses and jobs, import substitution and exports, economic recovery after COVID-19, diversification, risk-sharing encourages banks, financial inclusion, entrepreneurship culture", 7),
             ("Conditions/ risks: non-performing loans, need for monitoring, business skills and markets; conclusion", 3)],
 model="""The National Credit Guarantee Scheme was launched in October 2020 to address one of the biggest barriers to private sector growth: access to finance. Under the scheme the government guarantees a part of a loan, so that banks can lend to viable projects even when borrowers lack enough collateral, sharing the risk with the lender.
Focus areas: the scheme targets cottage, small and medium enterprises and start-ups, particularly in priority sectors that create jobs and reduce imports - such as agriculture and livestock, manufacturing and production, and small industries - and young entrepreneurs who have ideas but no collateral.
How it contributes to private sector development:
1. Access to finance: entrepreneurs, especially young people and those in rural areas, can obtain credit without large collateral.
2. New businesses and jobs: more start-ups and expansions create employment, easing youth unemployment.
3. Import substitution and exports: support to agriculture and manufacturing increases domestic production, saving foreign currency.
4. Economic recovery: after COVID-19, credit helps businesses restart and grow.
5. Diversification of the economy beyond hydropower and tourism.
6. Encouraging banks: risk-sharing makes financial institutions more willing to lend to small businesses, deepening financial inclusion.
7. Building an entrepreneurship culture and making the private sector a real partner of government.
Risks and conditions: loans may turn into non-performing loans if projects are poorly assessed; the scheme needs careful appraisal, monitoring, training of borrowers in business skills, and help with markets. Managed well, NCGS can make the private sector an engine of growth."""),
]
