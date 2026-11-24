"""ME General Paper II (English Language and General Knowledge), BCSE 2021 - real questions (PDF sent by the founder,
24 Nov 2026). Same layout as the latest (2025) paper: Section A case study 4 x 10, Section B any 2 of 4 x 10, Section C any
2 of 4 x 10, Section D 20 MCQ x 1 - so no marks were changed. Joins the 2025 bank (pattern from me_general2_2025.py).
Section D left out (answer not certain): Q1 (2021 International Day of Happiness theme), Q12 (donor of USD 1 million to
the COVID-19 ASEAN Response Fund), Q13 (dzongkhag bordering the most dzongkhags), Q15 (Bhutan's world population rank),
Q17 (year construction of the Phuentsholing-Thimphu highway began). Five new MCQs of the same kinds (N1-N5) replace them. Q5 (three branches of government) repeats
BCSE 2023 Section D and is recorded as an appearance; N6 replaces it.
Answers and marking guides were written by Claude: please check before publishing.
"""
import os, runpy
_base = runpy.run_path(os.path.join(os.path.dirname(__file__), "me_general2_2025.py"))
PATTERN, RUBRIC = _base["PATTERN"], _base["RUBRIC"]
CS, TOP, SUBJ, MCQ = "analytical", "long_answer", "descriptive", "mcq"

BATCH = "ME Paper II (General): BCSE 2021, batch 2"
GROUP_TAG = "2021b2"
PAPER = "me-general-2"
SUBJECT = "english-general-knowledge"
MIN_WORDS = 150
ADDS_TO_PAPER = True
SOURCE = {"title": "BCSE 2021 Main Examination, General category, Paper II", "year": 2021, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}
G = "me-general-2-2021b2-a"

PASSAGE = """Read the article below and answer ALL FOUR questions that follow.

Has Bhutan’s growth been jobless? (Tenzin Lhaden, July 17, 2018) (https://blogs.worldbank.org/endpovertyinsouthasia/has-bhutan-s-growth-been-jobless)

“The main driver of growth in Bhutan continues to be the hydropower sector, but electricity generation does not create job,” said a senior government officials attending the presentation of The World Bank’s South Asia Focus on Jobless Growth on June 28th in Thimphu. The report was presented by Martin Rama, World Bank South Asia Region Chief Economist and was attended by senior government officials, parliamentarians and development partners. The presentation alongside the launch of Bhutan Development Update was a great opportunity for the policy makers to better understand and synthesize Bhutan and the South Asia region’s development opportunities.

In the case of Bhutan, it seems clear that growth alone will not allow it to attain higher rates as enjoyed by some other developing countries.

“More than 1.8 million young people will reach working age every month in South Asia through 2025 and the good news is that economic growth is creating jobs in the region,” said Martin Rama, “But providing opportunities to these young entrants while attracting more women into the labour market will require generating even more jobs for every point of economic growth.”

The report informs that the fall in employment rates has been much faster in the region particularly in India, Bhutan and Sri Lanka and especially for women, risking foregoing the demographic dividend. While it is evident that the number of working age people is increasing, the proportion who are at work has declined owing to prioritization of the households to education, health and other commitments with increasing level of income.

Bhutan continues to be one of the fastest growing economies in the world with an annual average economic growth of 7.6 percent. The national poverty headcount fell from 12 percent in 2012 to 8 percent in 2017. Recent developments on strong lending growth, inflation, exchange rates and international reserves confirms that the country continued to maintain solid and stable growth in 2016/17. The overall unemployment rate declined for three straight years from 2.9 percent in 2013 to 2.1 percent in 2016. However, the youth unemployment rate increased from 10.7 percent in 2015 to 13.2 percent in 2016 and was especially high among educated youth. The youth unemployment rate with a bachelor’s degree was 67 percent followed by youth with a middle and higher education degree at 21 percent. The increase in youth unemployment, especially among educated youth, suggests that the high economic growth in the recent few years was not able to create enough job opportunities for them. The continued delays in the completion of the ongoing mega hydropower projects is expected to affect growth in the near future but the country would greatly benefit from a more robust private sector to create more jobs for its youth. With the working age population increasing by 830 people every month, Bhutan will therefore need to create 6,000 jobs a year to maintain its current employment rate.

The World Bank’s Investment Climate Assessment of 2016 identified three binding constraints for private sector development: access to finance, access to skilled labor and access to external markets. However, the increasing number of unemployed youth in Bhutan is not only due to the weak presence of the private sector but also due to mismatch in the labor market. The World Bank’s 2016 Labor Market Report confirms that the public sector is the ultimate choice for Bhutanese educated youth. In fact, some prefer to stay unemployed if they cannot get public sector employment due to social status considerations.

A significant gap between the public and private sector in terms of compensation and benefits has contributed to this mismatch. An interesting argument expressed by one of the participants during the launch of the Bhutan Development Update was that in Bhutan, it was more of an issue of jobs mismatch rather than the absence of availability of jobs itself. It is therefore, important to take into consideration the social dimension of unemployment and the need to tackle this social mindset. The continued decline in the labour force participation rate also indicates the weakening of the labour market and informs that after some point, people actually stop seeking for jobs due to unavailability of the desired jobs. The Labour Report suggests that creation of a national social assistance system through consolidation of social protection program and modernization will be instrumental in supporting the rebalancing of the agricultural, nonfarm private and public sectors.

So has the growth really been jobless for Bhutan? Or is it a case of willing unemployment…is that jobless growth?"""


def cs(key, n, q, kp, model):
    return dict(key=key, real=True, type=CS, marks=10, topic="Case study and comprehension", group=G, pos=n,
                stem=PASSAGE + "\n\n" + q, key_points=kp, model=model)


def mcq(key, topic, stem, opts, ans, exp):
    return dict(key=key, real=True, type=MCQ, topic=topic, stem=stem, opts=opts, ans="abcd".index(ans), exp=exp)


Q = [
cs("A1", 1, """Question 1
"… the good news is that economic growth is creating jobs in the region…" (Para 3)
What are the challenges in the region for creating enough jobs despite "the good news"? (10 marks)""",
   [("Huge number of new entrants: more than 1.8 million young people reach working age every month in South Asia through 2025 - jobs must grow faster than growth alone provides", 3),
    ("Need to attract more women into the labour market; employment rates have fallen fastest in India, Bhutan and Sri Lanka, especially for women - risk of losing the demographic dividend", 4),
    ("More jobs are needed for every point of growth; the share of working-age people at work is falling as households prioritise education, health and other commitments as incomes rise", 3)],
   """Although economic growth in South Asia is creating jobs, the passage points to several challenges that make it hard to create enough of them.
First, the scale of demand is enormous: more than 1.8 million young people will reach working age every month in South Asia through 2025, so jobs must be created very quickly just to keep up.
Second, the region needs to bring more women into the labour market. The report notes that employment rates have fallen much faster in the region, particularly in India, Bhutan and Sri Lanka, and especially for women. If this continues, countries risk losing the "demographic dividend" that a large young workforce could bring.
Third, growth itself is not creating enough jobs: the region must generate "even more jobs for every point of economic growth". Although the number of working-age people is rising, the proportion actually at work has declined, as households with rising incomes give priority to education, health and other commitments.
So the good news of job creation is offset by a fast-growing young population, falling female participation and growth that is not job-intensive enough."""),
cs("A2", 2, """Question 2
Why, according to the passage, is "educated youth unemployment" on the rise in Bhutan? (10 marks)""",
   [("Growth is driven by hydropower, which does not create many jobs; recent high growth did not create enough jobs for educated youth (youth unemployment rose from 10.7% in 2015 to 13.2% in 2016; 67% for graduates)", 4),
    ("Weak private sector: binding constraints - access to finance, skilled labour and external markets; delays in mega hydropower projects", 3),
    ("Mismatch: public sector is the preferred choice; some prefer to stay unemployed rather than take private jobs because of social status and the pay/benefit gap; some stop looking for work", 3)],
   """According to the passage, educated youth unemployment is rising in Bhutan for several connected reasons.
1. The type of growth: Bhutan's growth is driven mainly by the hydropower sector, but "electricity generation does not create jobs". Even though the economy grew at about 7.6 percent a year, this growth did not create enough jobs for educated young people. Youth unemployment rose from 10.7 percent in 2015 to 13.2 percent in 2016, and among youth with a bachelor's degree it was 67 percent.
2. A weak private sector: the World Bank identified three binding constraints on private sector development - access to finance, access to skilled labour and access to external markets - so the private sector cannot absorb graduates. Delays in the mega hydropower projects are also expected to slow growth.
3. A job mismatch and social mindset: the public sector is the ultimate choice of educated youth, and some prefer to stay unemployed rather than accept private sector jobs because of social status. The large gap in pay and benefits between the public and private sectors adds to this mismatch, and some people eventually stop looking for work altogether."""),
cs("A3", 3, """Question 3
What are some issues that are detrimental to the development of the private sector which could immensely alleviate the youth unemployment issues in Bhutan? (10 marks)""",
   [("Limited access to finance (credit) for businesses", 2.5), ("Limited access to skilled labour - skills mismatch", 2.5), ("Limited access to external markets (small, landlocked economy)", 2.5),
    ("Large gap in compensation and benefits between public and private sectors and the social preference for government jobs, which deters youth from private employment; dependence on hydropower", 2.5)],
   """The passage cites the World Bank's Investment Climate Assessment of 2016, which identified three binding constraints on private sector development in Bhutan:
1. Access to finance - entrepreneurs and firms find it difficult to obtain credit to start or expand businesses.
2. Access to skilled labour - firms cannot easily find workers with the skills they need, reflecting a mismatch between education and the labour market.
3. Access to external markets - Bhutan is small and landlocked, so firms struggle to reach larger markets.
In addition, the significant gap between the public and private sectors in compensation and benefits makes private jobs unattractive. Educated youth regard the civil service as the ultimate choice and some would rather stay unemployed than join the private sector because of social status. The economy's reliance on hydropower, which creates few jobs, also limits the growth of a diversified private sector.
Tackling these issues would let the private sector grow and absorb many of the young people now unemployed."""),
cs("A4", 4, """Question 4
Is educated youth unemployment "a case of willing unemployment"? Argue for and against, citing reasons from the passage for both sides of the argument. (10 marks)""",
   [("For: public sector is the ultimate choice; some prefer to stay unemployed if they cannot get a public job because of social status; the issue is jobs mismatch rather than absence of jobs (participant's view)", 4),
    ("Against: growth driven by hydropower creates few jobs; weak private sector (finance, skilled labour, markets); Bhutan needs about 6,000 jobs a year; falling participation shows people stop seeking work because desired jobs are unavailable", 4),
    ("Balanced conclusion supported by evidence (both mindset and structural shortage; need to change mindset and reduce public-private gap)", 2)],
   """Arguments for "willing unemployment":
• The World Bank's 2016 Labour Market Report confirms that the public sector is the ultimate choice for educated Bhutanese youth, and some prefer to stay unemployed if they cannot get a public sector job because of social status.
• One participant at the launch argued that Bhutan's problem is more a jobs mismatch than an absence of jobs.
• The large gap in pay and benefits between the public and private sectors makes youth unwilling to take private jobs, so their unemployment is partly a choice.
Arguments against:
• Growth has been driven by hydropower, which "does not create jobs", so the economy has not generated enough jobs - youth unemployment among graduates reached 67 percent.
• The private sector is weak because of limited access to finance, skilled labour and external markets, so jobs simply are not there.
• Bhutan needs to create about 6,000 jobs a year to keep its employment rate, and the falling labour force participation rate shows that people stop seeking work because the desired jobs are unavailable.
Conclusion: educated youth unemployment is partly willing - a social mindset that favours government jobs - but it is also structural, caused by job-poor growth and a weak private sector. Both the mindset and the shortage of good jobs must be addressed."""),
dict(key="B1", real=True, type=TOP, marks=10, topic="Topical issues: youth and national identity", stem="""The developed nations are looking up to Bhutan as a well governed state, an environmentally efficient nation, a nation proud of its national identity and heritage. His Majesty The King stresses so much on the importance of the role of today's youth in preserving Bhutan's identity.
Are the Bhutanese youth ready to take up such a sacred responsibility? (10 marks)""",
 key_points=[("Clear position (ready / partly ready / not yet) with reasons", 2),
             ("Evidence of readiness: educated, patriotic youth; volunteerism (De-suung, COVID-19 frontline service), Driglam Namzha, national dress, interest in culture and environment", 3),
             ("Challenges: Western/ social media influence, weakening use of Dzongkha, unemployment and migration abroad, substance abuse, materialism", 3),
             ("Ways forward: values education, Royal guidance, youth engagement in nation building, role models; balanced conclusion", 2)],
 model="""Bhutanese youth are largely willing and increasingly ready to take up this sacred responsibility, but they need continued guidance and support.
Signs of readiness: today's youth are better educated and more connected than any earlier generation. Thousands have served as De-suups and volunteered on the frontline during the COVID-19 pandemic, showing patriotism and selflessness. Many proudly wear the gho and kira, observe Driglam Namzha, take part in tshechus and environmental campaigns, and use social media to promote Bhutan's culture and values.
Challenges: globalisation and social media expose youth to foreign lifestyles and consumerism; the use of Dzongkha is declining among urban youth; youth unemployment pushes many to migrate abroad; and problems such as substance abuse and weakening family ties distract some young people.
Way forward: values-based education, mentoring by elders and role models, programmes such as De-suung and Gyalsung that build national service and identity, and meaningful employment at home will help youth turn their goodwill into action.
In conclusion, Bhutanese youth are ready in spirit; with the right guidance from His Majesty, families and institutions, they can preserve and strengthen Bhutan's identity while embracing the modern world."""),
dict(key="B2", real=True, type=TOP, marks=10, topic="Topical issues: sex education", stem="""While it can be argued that sex education is important and should start at home, schools and institutions are also valuable sources of information for young people. Many, however, believe that it should be an option and not compulsory.
Analyse the concept of a mandatory sex education in Bhutan. (10 marks)""",
 key_points=[("Arguments for mandatory sex education: accurate information, prevents teenage pregnancy, STIs/HIV, sexual abuse; many parents do not talk about it at home; reaches every child", 4),
             ("Arguments against/ concerns: cultural sensitivity, parents' and religious objections, age-appropriateness, teacher training, should be optional", 3),
             ("Balanced analysis and recommendation for Bhutan (age-appropriate comprehensive sexuality education in curriculum, with parents' involvement, trained teachers, Bhutanese values)", 3)],
 model="""Mandatory sex education means teaching all students about the body, puberty, relationships, consent, reproductive health and protection from disease and abuse as a compulsory part of the curriculum.
Arguments for making it mandatory in Bhutan:
• Many parents feel shy or are not equipped to discuss sexual health at home, so school may be the only reliable source; otherwise youth learn from peers and the internet, which can be misleading.
• Reports of teenage pregnancy, sexually transmitted infections, sexual abuse and early marriage show the need for knowledge about consent, safety and protection.
• A compulsory programme reaches every child equally, including those in rural areas.
Concerns and arguments for keeping it optional:
• It is a culturally sensitive subject; some parents and religious communities may feel it encourages early sexual activity.
• Content must be age-appropriate, and many teachers are not trained to teach it comfortably.
Analysis: research shows that accurate, age-appropriate sexuality education does not encourage early sex but delays it and makes it safer. Bhutan's school health programmes already teach reproductive health in parts. The best approach is a compulsory, age-appropriate programme rooted in Bhutanese values, delivered by trained teachers and health workers, with parents informed and involved."""),
dict(key="B3", real=True, type=TOP, marks=10, topic="Topical issues: climate change and youth", stem="""Climate change is a major political issue for young people. In fact, the most prominent face of climate change activism today is a teenager: 17-year-old Greta Thunberg.
In the light of such a major global issue, how well prepared or unprepared are educated young Bhutanese to tackle climate change related challenges in Bhutan? (10 marks)""",
 key_points=[("Clear position on preparedness, with reasons", 2),
             ("Prepared: environmental education in schools (green schools, eco-clubs), awareness of Bhutan's carbon-negative status, youth volunteering, tree planting and clean-up campaigns", 3),
             ("Unprepared: limited technical skills/ research in climate science, renewable energy and disaster management; consumer habits (cars, waste); few youth in policy-making; risks to Bhutan - GLOFs, landslides, erratic monsoon, agriculture", 3),
             ("Suggestions: climate education and skills, youth engagement in policy, green jobs/ innovation; conclusion", 2)],
 model="""Educated young Bhutanese are well aware of climate change but are only partly prepared to tackle its challenges.
How they are prepared: environmental values are taught through the Green School programme, eco-clubs and the constitutional duty to protect the environment. Youth know that Bhutan is carbon negative and that its forests and rivers are national treasures. Many take part in tree planting, clean-up campaigns and waste management drives, and some young entrepreneurs work in recycling, organic farming and eco-tourism.
How they are unprepared: awareness has not always turned into action - private car use, plastic waste and consumerism are rising among urban youth. Few young people have technical skills in climate science, renewable energy, disaster risk reduction or climate-smart agriculture, and youth have little voice in policy-making. Yet Bhutan faces serious risks: glacial lake outburst floods, landslides, erratic monsoons, water shortages and crop losses.
Way forward: include climate science and practical skills in education, create green jobs, support youth research and innovation, and involve youth in planning at local and national levels.
With these steps, Bhutanese youth could become, like Greta Thunberg, powerful voices and agents of climate action."""),
dict(key="B4", real=True, type=TOP, marks=10, topic="Topical issues: technology and society", stem="""Social media has affected the global relationship status and human communication to such an extent that certain aspects of life would seem impossible without technological know-how.
Has technology really enhanced the standard of living? (10 marks)""",
 key_points=[("Clear position", 2),
             ("Ways technology has enhanced living: communication, access to information and education (online learning during COVID-19), health care (telemedicine), e-banking/ G2C services, jobs and businesses, convenience", 3),
             ("Negative effects: social media addiction, cyberbullying, misinformation, privacy loss, reduced face-to-face relationships, mental health, digital divide (rural/ elderly), job loss to automation", 3),
             ("Balanced conclusion: depends on responsible use, digital literacy and equal access", 2)],
 model="""Technology has greatly enhanced the standard of living in material terms, but its effect on overall well-being depends on how it is used.
How technology has improved life: people can communicate instantly with family and friends anywhere; information and education are available online, as seen when schools moved to online learning during COVID-19; telemedicine brings specialist advice to remote areas; mobile banking (such as mBoB) and online government services save time and travel; and technology creates new jobs and businesses, including e-commerce and digital start-ups in Bhutan.
How it has harmed life: social media addiction reduces face-to-face relationships and family time; cyberbullying, online scams and misinformation spread quickly; privacy is at risk; excessive screen time affects mental and physical health, especially among youth; and the digital divide leaves rural people and the elderly behind.
Conclusion: technology has raised the standard of living by making life more convenient, productive and connected, but it has not automatically improved happiness. In the spirit of GNH, Bhutan should promote digital literacy, responsible and balanced use, and equal access so that technology truly enhances well-being."""),
dict(key="C1", real=True, type=SUBJ, marks=10, topic="Subjective: urbanisation", stem="""Thimphu is growing and growing fast. In the past five years, houses have mushroomed in the city even extending to its outskirts and up on the hills. The greenery has gradually given way to concrete walls, footpaths, and roads. (A worthy urban life, Kuensel editorial, July 6, 2021)
How nostalgic is this of a clean and green Thimphu? (10 marks)""",
 key_points=[("Describes the old 'clean and green' Thimphu (small town, open spaces, paddy fields, forests, clean river) and the sense of loss", 2),
             ("Causes and effects of rapid urbanisation: rural-urban migration, construction on hills and wetlands, loss of greenery, traffic, waste, water shortage, air pollution, pressure on services", 4),
             ("Positives of growth (services, jobs) and suggestions: planning (Thimphu Structure Plan), green spaces, waste management, regional development to reduce migration; conclusion", 4)],
 model="""For many people the editorial is deeply nostalgic. Older residents remember a small Thimphu with paddy fields in the valley, forested hills, clean rivers, quiet roads and open spaces where children played. That 'clean and green' capital is fading.
What has changed: rural-urban migration has made Thimphu grow fast. Buildings now climb the hillsides and spread into the outskirts; green areas and wetlands have been replaced by concrete, roads and footpaths. With growth have come traffic congestion, air pollution from vehicles, mounting solid waste, drinking water shortages in some areas and pressure on schools and hospitals. The loss of greenery also raises the risk of landslides and reduces the city's beauty and liveability.
Not all change is bad: urban growth brings jobs, better services, businesses and opportunities, and many people have better housing.
What can be done: follow the Thimphu Structure Plan strictly and stop construction on steep slopes and green belts; create and protect parks and tree-lined streets; improve waste management and public transport; and develop other dzongkhags so that migration to Thimphu slows.
Thimphu cannot return to the past, but with good planning it can grow while keeping its clean and green character."""),
dict(key="C2", real=True, type=SUBJ, marks=10, topic="Subjective: care of the elderly", stem="""As we observe the International Day of Older Persons and dedicate the whole of October to elderly people, it is a good time to pause and look if our elderly people, including our "Drenchen gi pham" are getting the attention, the care and love they deserve. (Taking care of our "Drenchen gi pham", Kuensel editorial, October 2, 2021)
What are your personal observations on the ever changing social milieu of the Bhutanese families regarding the concern raised in the quote above? (10 marks)""",
 key_points=[("Traditional joint family and values of gratitude (Drenchen gi pham - parents to whom we owe kindness) ensured care for the elderly", 2),
             ("Changes: nuclear families, rural-urban migration and migration abroad leave elderly alone in villages (gungtong); busy working lives, small urban houses, generation gap", 4),
             ("Personal observations/ examples and suggestions: family responsibility, community and religious support, government programmes (pension, elderly care centres, health services), conclusion", 4)],
 model="""Traditionally, Bhutanese families lived together in joint households, and the values of tha damtshig and gratitude to Drenchen gi pham - the parents whose kindness we can never repay - ensured that elders were respected and cared for at home until the end of their lives.
My observation is that this is changing. Many young people have moved to towns or abroad for education and jobs, leaving elderly parents alone in villages, and some homes have even become empty (gungtong). In cities, nuclear families live in small flats; both parents work long hours, and grandparents who move in may feel lonely or out of place. There is also a growing generation gap in language, lifestyle and technology. As a result, some elderly people lack daily care, companionship and help with health problems, and a few have to depend on monasteries or neighbours.
At the same time, many Bhutanese still look after their parents with great love, sending money home and visiting during holidays.
To address this concern, children must recognise caring for parents as a duty, communities and religious institutions can support lonely elders, and the government can expand elderly care services, geriatric health care and social protection.
Our elders gave us everything; caring for them is the truest expression of Bhutanese values."""),
dict(key="C3", real=True, type=SUBJ, marks=10, topic="Subjective: social change and child protection", stem="""A recent news headline reads, "Lab Assistant Arrested for Rape of a Minor in Tsirang."
What according to you are some of the challenges of modernization with reference to the social and mental attitudes of Bhutanese toward sexual behavior? (10 marks)""",
 key_points=[("Modernisation changes: exposure to internet/ pornography and media, weakening family supervision, urbanisation, alcohol and drug use", 3),
             ("Attitudes: silence and stigma around sex and abuse, victim-blaming, under-reporting, abusers often known to victims, lack of awareness about consent and child rights", 4),
             ("Responses: sex/ consent education, child protection laws (Penal Code, Child Care and Protection Act), reporting mechanisms, counselling, strict enforcement, community awareness", 3)],
 model="""Cases like the rape of a minor in Tsirang show that modernisation has brought new challenges to Bhutanese social and mental attitudes towards sexual behaviour.
Challenges:
• Easy access to the internet, smartphones and pornography exposes people, including children, to sexual content without guidance on respect and consent.
• Urbanisation and busy working parents weaken family supervision, leaving children more vulnerable; alcohol and drug abuse also contribute to sexual crimes.
• Traditional attitudes have not kept pace: sex is still a taboo topic, so children are not taught about their bodies, safe and unsafe touch or how to report abuse. Victims and families often stay silent because of shame, stigma, fear or pressure to settle cases privately, especially when the abuser is a relative, teacher or person of authority.
• Victim-blaming and lack of awareness about consent and child rights allow abusers to go unpunished.
Responses needed: age-appropriate sex and consent education in schools and families; strict enforcement of the Penal Code and Child Care and Protection Act; safe, confidential reporting channels and support from RENEW, NCWC and counsellors; background checks and codes of conduct for people working with children; and community awareness that breaks the silence.
Modernisation is not the problem in itself; the challenge is to modernise attitudes too, so that children are protected and abuse is reported and punished."""),
dict(key="C4", real=True, type=SUBJ, marks=10, topic="Subjective: media and entertainment", stem="""Lately, reality shows in the country have taken a centre stage. Media has been quick to report about speculations of reality shows breeding socially challenging issues like using the shows to gamble and mint money.
What are your views on reality shows with reference to media's recent reports? (10 marks)""",
 key_points=[("Positives: platform for local talent (singing, dancing), entertainment, promotion of Bhutanese music/ culture, livelihoods in the creative industry", 3),
             ("Concerns raised by media: paid voting and betting on contestants, people spending large sums, money-making by organisers, family conflicts and debts, lack of transparency", 4),
             ("Views and suggestions: regulation by BICMA/ authorities, transparent voting, limits on paid votes, ban on gambling, media literacy; balanced conclusion", 3)],
 model="""Reality shows such as singing and talent competitions have become very popular in Bhutan. In my view they bring real benefits but also need regulation.
Positives: they give ordinary young people, including those from remote villages, a platform to show their talent; they promote Bhutanese songs, dance and language; they provide entertainment for families; and they create jobs for musicians, technicians and media houses.
Concerns raised by the media: voting is often done through paid SMS or online votes, so results can depend on money rather than talent. Reports suggested that some people placed bets on contestants and that supporters spent large amounts - sometimes borrowing money - to vote, turning the shows into a form of gambling. Organisers and telecom companies may earn large profits, and there are questions about transparency in counting votes. This can cause debts, quarrels and unfair results.
My view: reality shows should continue, but with safeguards. Authorities such as BICMA should regulate them, limit the number of paid votes per person, make vote counting transparent and audited, ban betting, and give more weight to judges' scores. The public should be educated to support contestants responsibly.
Handled properly, reality shows can remain a healthy celebration of Bhutanese talent rather than a money-making game."""),
mcq("D2", "General knowledge: books", "Who is the author of the book 'The Coming Famine: The Global Food Crisis and What We Can Do to Avoid It', which predicts that the Earth will run out of food by 2050 if world leaders don't act fast?", ["D. Felipe B. Larrain", "Jeffrey D. Sachs", "Robin Hahnel", "Julian Cribb"], "d", "Julian Cribb, an Australian science writer, wrote 'The Coming Famine' (2010)."),
mcq("D3", "General knowledge: Bhutan law", "The Civil Service Act of Bhutan was enacted by Parliament in the year:", ["2008", "2010", "2012", "2014"], "b", "The Civil Service Act of Bhutan was enacted in 2010."),
mcq("D4", "General knowledge: environment", "Which one of the following issues did the Montreal Protocol address?", ["Acid rain", "Air pollution", "Ozone depletion", "Global warming"], "c", "The Montreal Protocol (1987) phases out ozone-depleting substances such as CFCs."),
mcq("D6", "General knowledge: world", "Where is the headquarters of the World Health Organization located?", ["Geneva", "London", "Brussels", "New York"], "a", "WHO is headquartered in Geneva, Switzerland."),
mcq("D7", "General knowledge: environment", "What are the 'Global 500 Awards' given for?", ["Elimination of illiteracy", "Campaign against drugs", "Protection of environment", "Contribution to economic growth"], "c", "UNEP's Global 500 Roll of Honour recognised outstanding environmental achievements."),
mcq("D8", "General knowledge: Bhutan judiciary", "Which one of the following is the correct order of the appeal process in adjudication in Bhutan?", ["Supreme Court → Dzongkhag Court → Dungkhag Court → High Court", "Dungkhag Court → Dzongkhag Court → Supreme Court → High Court", "Supreme Court → Dungkhag Court → Dzongkhag Court → High Court", "Dungkhag Court → Dzongkhag Court → High Court → Supreme Court"], "d", "Appeals go from the Dungkhag Court to the Dzongkhag Court, then the High Court and finally the Supreme Court."),
mcq("D9", "General knowledge: world", "With which countries did the US announce a new trilateral security partnership (AUKUS) for the Indo-Pacific region in 2021?", ["Australia and United Kingdom", "India and United Kingdom", "Australia and Japan", "India and Australia"], "a", "AUKUS, announced in September 2021, is between Australia, the United Kingdom and the United States."),
mcq("D10", "General knowledge: science", "With which space agency is the 'Lucy Mission' associated?", ["ISRO", "NASA", "SpaceX", "Blue Origin"], "b", "NASA's Lucy mission, launched in October 2021, studies the Trojan asteroids of Jupiter."),
mcq("D11", "General knowledge: Bhutan constitution", "Which of the following is an INCORRECT statement about the Interim Government under the Constitution of the Kingdom of Bhutan?", ["The term of the Interim Government shall not exceed ninety days.", "The Chief Justice of Bhutan shall be appointed as the Chief Advisor.", "The Interim Government shall carry out the routine functions of the Government.", "The Interim Government shall take policy decisions or enter into agreements with foreign governments or organisations during its term."], "d", "Article 19 of the Constitution bars the Interim Government from taking policy decisions or entering into agreements with foreign governments or organisations."),
mcq("D14", "General knowledge: world", "To counter China's dominance, trade ministers of India, Japan and Australia launched the SCRI. What is the full form of SCRI?", ["Supply Chain Resilience Initiative", "Subsidised Capital Resilience Initiative", "Smart Currency Resilience Initiative", "Sound Commerce Resilience Initiative"], "a", "The Supply Chain Resilience Initiative was launched in April 2021."),
mcq("D16", "General knowledge: environment", "Which country formally rejoined the Paris Climate Agreement in 2021?", ["Brazil", "China", "India", "USA"], "d", "The United States rejoined the Paris Agreement on 19 February 2021."),
mcq("D18", "General knowledge: health", "Which body adopted a political declaration in June 2021 to end AIDS by the year 2030?", ["UN General Assembly", "UNICEF", "UNFPA", "WHO"], "a", "The UN General Assembly High-Level Meeting on HIV/AIDS adopted the 2021 Political Declaration to end AIDS by 2030."),
mcq("D19", "General knowledge: Bhutan elections", "What is the age requirement for a candidate to contest Parliament or Local Government elections in Bhutan?", ["Minimum 18 and not more than 60 years at the time of filing the nomination", "Minimum 18 and not more than 65 years at the time of filing the nomination", "Minimum 25 and not more than 65 years at the time of filing the nomination", "Minimum 30 and not more than 60 years at the time of filing the nomination"], "c", "Under the Constitution and the Election Act, a candidate must be at least 25 and not more than 65 years old when filing the nomination."),
mcq("D20", "General knowledge: world", "The historic words \"Ask not what your country can do for you - ask what you can do for your country\" are attributed to:", ["John F. Kennedy", "Abraham Lincoln", "George Washington", "Franklin D. Roosevelt"], "a", "From John F. Kennedy's inaugural address, 20 January 1961."),
# ---- new questions of the same kinds, replacing the real MCQs left out (written by Claude; check before publishing)
dict(key="N1", new=True, type=MCQ, topic="General knowledge: world", stem="The International Day of Happiness, proposed by Bhutan and adopted by the UN General Assembly, is observed every year on:",
     opts=["20 March", "21 June", "1 October", "10 December"], ans=0, exp="UN resolution 66/281 (2012), initiated by Bhutan, made 20 March the International Day of Happiness."),
dict(key="N2", new=True, type=MCQ, topic="General knowledge: Bhutan", stem="Which Bhutanese organisation runs the volunteer programme whose members wear orange uniforms and serve during national emergencies?",
     opts=["Gyalsung", "De-suung", "Tarayana Foundation", "Bhutan Red Cross Society"], ans=1, exp="De-suups (Guardians of Peace), trained under the De-suung programme, wear orange and served on the COVID-19 frontline."),
dict(key="N3", new=True, type=MCQ, topic="General knowledge: Bhutan geography", stem="Which is the largest dzongkhag of Bhutan by area?",
     opts=["Wangduephodrang", "Gasa", "Zhemgang", "Trashigang"], ans=0, exp="Wangduephodrang is the largest dzongkhag by area (about 4,000 km²)."),
dict(key="N4", new=True, type=MCQ, topic="General knowledge: world", stem="Which organisation is known as the 'Bretton Woods twin' of the World Bank?",
     opts=["World Trade Organization", "International Monetary Fund", "Asian Development Bank", "United Nations Development Programme"], ans=1, exp="The IMF and the World Bank were both created at the Bretton Woods Conference in 1944."),
dict(key="N5", new=True, type=MCQ, topic="General knowledge: Bhutan", stem="Bhutan's first hydropower project built with Indian assistance, commissioned in 1986-88, is the:",
     opts=["Tala Hydropower Project", "Chukha Hydropower Project", "Kurichhu Hydropower Project", "Basochhu Hydropower Project"], ans=1, exp="The 336 MW Chukha Hydropower Project, built with Indian grant and loan, was commissioned in 1986-88."),
dict(key="N6", new=True, type=MCQ, topic="General knowledge: Bhutan constitution", stem="Under the Constitution of Bhutan, the National Council consists of how many members?",
     opts=["20", "25", "47", "72"], ans=1, exp="Article 11: 20 members elected, one from each dzongkhag, and 5 eminent members nominated by the Druk Gyalpo - 25 in all."),
]
