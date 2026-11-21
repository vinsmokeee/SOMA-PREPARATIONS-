"""ME General Paper II (English Language and General Knowledge), BCSE 2022 - real questions only (PDF sent by the
founder, 21 Nov 2026). Joins the 2025 bank (pattern from me_general2_2025.py).
Section D left out (answer not certain): Q9 (who appoints Dungkhag Drangpons), Q10 (Tokyo Paralympics were 2020
Games held in 2021 - two options fit), Q14 (Je Khenpo nickname).
Answers and marking guides were written by Claude: please check before publishing.
"""
import os, runpy
_base = runpy.run_path(os.path.join(os.path.dirname(__file__), "me_general2_2025.py"))
PATTERN, RUBRIC = _base["PATTERN"], _base["RUBRIC"]
CS, TOP, SUBJ, MCQ = "analytical", "long_answer", "descriptive", "mcq"

BATCH = "ME Paper II (General): BCSE 2022, batch 2"
GROUP_TAG = "2022b2"
PAPER = "me-general-2"
SUBJECT = "english-general-knowledge"
MIN_WORDS = 150
ADDS_TO_PAPER = True
SOURCE = {"title": "BCSE 2022 Main Examination, General category, Paper II", "year": 2022, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}
G = "me-general-2-2022b2-a"

PASSAGE = """Read the article below and answer ALL FOUR questions that follow.

When disaster strikes (Ilan Kelman, 5 October 2021, engelsbergideas.com)

Numerous synonyms exist for ‘disaster’, that is, when there are casualties, damage, and disruption: calamity, catastrophe, crisis, debacle, emergency, and tragedy, among others. Some have been defined and differentiated, rarely consistently, in academic books, glossaries, dictionaries, and laws. Even then, we struggle to translate and interpret the vocabulary and concepts across languages and cultures.

A ‘disaster’ is perhaps best described as a situation requiring outside help. Something happens that cannot be dealt with, so assistance is needed. It applies to the individual and to the family – think house fires or vehicle crashes. It applies to countries and to continents, such as the North American power outages of 1965 and 2003; and it happens on a worldwide level, with pandemics such as 1918- 1920 flu, and the ongoing COVID-19 outbreak. It could happen again, through space weather knocking out power grids and communication systems, for example, or via a major meteorite strike.

While ‘a situation requiring outside help’ helps to define and describe a ‘disaster,’ it does not explain why disasters arise. The fundamental causes of disasters, important for exploring disaster trends, can be distant from the observed impacts.

Some disasters involve environmental phenomena, with prominent examples being volcanic eruptions, rainfall, heat and humidity, landslides, blizzards, and tsunamis. The scale of a disaster is not necessarily correlated with an environmental phenomenon’s size or impact.

Some people are easily able to evacuate from a hurricane or wildfire, for example, and then rebuild their home with insurance money. Others cannot afford to buy insurance or to evacuate; they might lose their job if they leave for a few days; or perhaps they do not have the physical or mental health to start again after losing everything. When a virus sweeps the world, some people are comfortable working from home and stockpiling food from occasional supermarket visits. Others must continue to commute, lack the cash to purchase large quantities of supplies, or experience violence at home. Some people are happy heading to a communal evacuation shelter for a few days after a tornado or chemical explosion, while others legitimately fear discrimination or assault.

These differences in people and places, not the environmental phenomenon itself, explain disaster causes. In December 2003, similar earthquakes rattled central California and southern Iran killing, respectively, two people and around 25,000 people. The disparity did not come from the tremors, but from the number of people and types of infrastructure shaken. Similarly, Bangladesh has long been a landfall zone for cyclones blowing off the Bay of Bengal. Perhaps half a million people died in a 1970 cyclone disaster, while storm disasters in 2020 and 2021 resulted in just dozens of fatalities. In the interim, extensive effort to prepare for cyclones was made, resulting in vastly improved knowledge, awareness, preparedness, evacuation, sheltering, and recovery.

Thus, describing a disaster must focus on society, not nature. The phrase ‘natural disaster’ is best avoided on the premise that disasters are not natural. They are caused by society’s actions and choices, typically giving some people opportunities and resources to avoid problems, while forcing many others to be vulnerable through poverty, marginalisation, and violence.

In other words, as is often said, earthquakes don’t kill people, collapsing infrastructure does.

Infrastructure collapses because codes and regulations do not exist or are not enforced, while the people most affected retain few options to examine their seismic vulnerability or to improve their situation."""


def cs(key, n, q, kp, model):
    return dict(key=key, real=True, type=CS, marks=10, topic="Case study and comprehension", group=G, pos=n,
                stem=PASSAGE + "\n\n" + q, key_points=kp, model=model)


def mcq(key, topic, stem, opts, ans, exp):
    return dict(key=key, real=True, type=MCQ, topic=topic, stem=stem, opts=opts, ans="abcd".index(ans), exp=exp)


Q = [
cs("A1", 1, """Question 1
Based on the description of disaster in the second paragraph, explain why the scale of a disaster is not necessarily correlated with an environmental phenomenon's size or impact. (10 marks)""",
   [("Definition from paragraph 2: a disaster is a situation requiring outside help - something happens that cannot be dealt with locally", 3),
    ("So scale depends on capacity to cope/ vulnerability (people, wealth, preparedness, infrastructure), not on the size of the hazard; a small event can overwhelm a vulnerable community while a large one may be handled", 4),
    ("Examples from passage: house fire/ vehicle crash for a family; similar 2003 earthquakes - California 2 deaths vs Iran about 25,000; Bangladesh cyclones 1970 vs 2020-21", 3)],
   """The second paragraph describes a disaster as "a situation requiring outside help": something happens that the people affected cannot deal with themselves, so assistance is needed. This definition is about the capacity of people to cope, not about the size of the natural event.
Therefore the scale of a disaster depends on how vulnerable and prepared the affected people are. A small event - a house fire or a vehicle crash - is a disaster for a family because they cannot cope alone, while a large hurricane or earthquake may cause little harm where people are wealthy, insured, well-housed and prepared, because they can evacuate and rebuild without outside help. Conversely, a moderate event can be catastrophic for poor, crowded or marginalised communities with weak buildings and no means to evacuate.
The passage gives clear examples: in December 2003 similar earthquakes struck central California and southern Iran, killing two people and about 25,000 people respectively - the difference came from the number of people and the type of infrastructure, not the tremors. Likewise, cyclones in Bangladesh killed about half a million people in 1970 but only dozens in 2020-2021 because of better preparedness. The size of the phenomenon stayed similar; the capacity to cope changed."""),
cs("A2", 2, """Question 2
What, according to the passage, causes disaster? (10 marks)""",
   [("Disasters are caused by society, not nature: differences in people and places - vulnerability", 3),
    ("Factors: poverty, inability to afford insurance/ evacuation, job insecurity, poor health, marginalisation, discrimination and violence, number of people exposed", 4),
    ("Poor infrastructure: building codes and regulations absent or not enforced; 'earthquakes don't kill people, collapsing infrastructure does'; society's actions and choices give some people resources and leave others vulnerable", 3)],
   """According to the passage, disasters are caused not by environmental phenomena themselves but by society's actions and choices - the "differences in people and places". The fundamental causes are often distant from the visible impacts.
Specifically: (1) vulnerability created by poverty - some people cannot afford insurance, cannot evacuate, would lose their jobs if they left, or lack the cash to stock up on supplies; (2) poor physical or mental health that prevents people from recovering; (3) marginalisation, discrimination and violence - some fear assault in shelters or experience violence at home; (4) the number of people exposed and the type of infrastructure - weak buildings collapse because building codes and regulations do not exist or are not enforced, and "earthquakes don't kill people, collapsing infrastructure does"; and (5) lack of preparedness, knowledge, evacuation and recovery systems. Society's choices give some people the opportunities and resources to avoid problems while forcing many others into vulnerability, and that vulnerability turns a hazard into a disaster."""),
cs("A3", 3, """Question 3
Why is it suggested that the phrase 'natural disaster' be avoided? (10 marks)""",
   [("Disasters are not natural - hazards are natural, but disasters result from society's actions/ choices and vulnerability", 4),
    ("The term hides human responsibility (poverty, poor planning, unenforced building codes, marginalisation) and suggests disasters are inevitable acts of nature", 3),
    ("Avoiding it shifts focus to society, prevention and reducing vulnerability - with evidence (California vs Iran, Bangladesh)", 3)],
   """The passage argues that the phrase 'natural disaster' should be avoided because disasters are not natural. Environmental phenomena - earthquakes, cyclones, floods - are natural hazards, but whether they become disasters depends on society: how many people live in exposed places, how strong the buildings are, whether people can afford to evacuate and recover, and whether they are poor, marginalised or subject to violence.
Calling a disaster 'natural' hides these human causes. It suggests that disasters are unavoidable acts of nature for which no one is responsible, rather than the result of choices such as failing to enforce building codes, allowing poverty and inequality, and neglecting preparedness. The evidence in the passage - similar earthquakes killing 2 people in California but 25,000 in Iran, and Bangladesh reducing cyclone deaths from about half a million to dozens through preparation - shows that society, not nature, decides the outcome.
Therefore, describing disasters as social rather than natural focuses attention on prevention, accountability and reducing vulnerability."""),
cs("A4", 4, """Question 4
Based on the arguments presented in the passage, how can disasters be either averted or their scale minimised? (10 marks)""",
   [("Reduce vulnerability: tackle poverty, marginalisation, discrimination and violence; social protection/ insurance so all can evacuate and recover", 3),
    ("Safe infrastructure: make and enforce building codes and regulations; help people assess/ improve their seismic vulnerability", 3),
    ("Preparedness like Bangladesh: knowledge, awareness, early warning, evacuation plans, safe shelters, recovery systems; include vulnerable groups; apply to Bhutan (GLOF, earthquakes, landslides)", 4)],
   """Since the passage argues that disasters arise from society rather than nature, they can be averted or minimised by changing society's actions and choices:
1. Reduce vulnerability: address poverty, marginalisation, discrimination and violence so that everyone has the means to protect themselves - for example social protection, affordable insurance, job security during evacuations, and support for people with poor health.
2. Build safe infrastructure: create and strictly enforce building codes and land-use regulations so that buildings and infrastructure do not collapse, and help ordinary people examine and improve the safety of their homes.
3. Invest in preparedness, as Bangladesh did with cyclones: improve knowledge and awareness, early warning systems, evacuation planning, safe and inclusive shelters where people do not fear discrimination or assault, and effective recovery and rebuilding.
4. Plan for wider risks such as pandemics and space weather, with backup power and communication systems.
In Bhutan, this means enforcing building codes against earthquakes, early warning for GLOFs and floods, avoiding construction in hazard zones, and making sure vulnerable rural and poor households are included in preparedness."""),
dict(key="B1", real=True, type=TOP, marks=10, topic="Topical issues: climate change", stem=""""Welcome to the summer from hell: 2022 is shaping up to be a season of disaster - and a preview of our future." (www.grid.news)
Given the global climate disasters reported in 2022, what picture does this preview paint of our future? (10 marks)""",
 key_points=[("2022 examples: record heatwaves (Europe, UK 40 °C, India/ Pakistan), Pakistan floods (a third of the country), droughts (Europe, China, Horn of Africa), wildfires, glacier melt", 3),
             ("Picture of future: more frequent and intense extremes as warming continues, food and water insecurity, health risks, migration, economic losses, biodiversity loss, worst for poor/ vulnerable", 4),
             ("Relevance to Bhutan (GLOFs, erratic monsoon, landslides, drying springs) and need for urgent mitigation and adaptation", 3)],
 model="""In 2022 the world experienced record heatwaves across Europe (the UK passed 40 °C for the first time) and South Asia; catastrophic floods in Pakistan that submerged about a third of the country; severe droughts in Europe, China and the Horn of Africa that dried rivers and destroyed crops; widespread wildfires; and rapid glacier melt.
The picture of our future: as the planet keeps warming, such extreme events will become more frequent and more intense. Heatwaves will threaten health and lives; floods and droughts will damage farms, causing food and water insecurity and rising prices; diseases will spread to new areas; coastal and mountain communities will be displaced, increasing migration and conflict; economies will lose infrastructure and productivity; and ecosystems and biodiversity will be lost. The poor and vulnerable, who did least to cause climate change, will suffer most.
For Bhutan, this means more glacial lake outburst floods, erratic monsoons, landslides, forest fires and drying springs, threatening agriculture and hydropower. The preview is a warning that the world must cut greenhouse gas emissions urgently and invest in adaptation and disaster preparedness."""),
dict(key="B2", real=True, type=TOP, marks=10, topic="Topical issues: global economy", stem=""""Beyond the suffering and humanitarian crisis from Russia's invasion of Ukraine, the entire global economy will feel the effects of slower growth and faster inflation." (How war in Ukraine is reverberating across the world's regions, IMF Blog, 15 March 2022)
How have we experienced the effects in Bhutan? (10 marks)""",
 key_points=[("Price rise: fuel (petrol, diesel, LPG), cooking oil, wheat/ food items, fertiliser and construction materials - imported mostly via India; higher inflation (around 6-7%) and cost of living", 4),
             ("Economic effects: pressure on foreign currency reserves (rupee and dollar), import restrictions/ measures, higher transport costs, slower recovery after COVID, impact on businesses and construction, tourism", 4),
             ("Social effects on households and government responses (fuel/ subsidy measures, monitoring prices, encouraging self-sufficiency)", 2)],
 model="""Although Bhutan is far from Ukraine, we felt the effects through prices and trade, because we import most of our fuel, food and goods through India:
1. Fuel prices rose sharply - petrol, diesel and LPG became much more expensive, raising transport fares and the cost of moving goods.
2. Food prices increased, especially cooking oil, wheat flour and other imported items, because Russia and Ukraine are major exporters of wheat and sunflower oil.
3. Construction materials and fertilisers became costlier, affecting construction projects and farmers.
4. Inflation rose (to around 6-7% in 2022), increasing the cost of living, especially for low-income households.
5. Higher import bills put pressure on Bhutan's foreign currency reserves, and the government took measures to manage imports (e.g. restricting vehicle imports) to protect reserves.
6. Slower global growth delayed the economic recovery from COVID-19, affecting tourism and businesses.
The government responded by monitoring prices, supporting essential supplies and encouraging food self-sufficiency, and households had to adjust their spending."""),
dict(key="B3", real=True, type=TOP, marks=10, topic="Topical issues: migration", stem="""Over the past few years, an increasing number of Bhutanese have been leaving the country to go abroad for reasons ranging from better employment and pay to higher education, among others.
Does this trend translate into opportunities or concerns for Bhutan? (10 marks)""",
 key_points=[("Opportunities: remittances and foreign exchange, skills/ education/ exposure brought back, reduced unemployment pressure, diaspora networks, investment and new ideas", 4),
             ("Concerns: brain drain/ loss of skilled workers (nurses, doctors, teachers, civil servants), shortages in services, ageing rural population and fallow land, family separation and elderly care, small population and national security/ identity, cost of training lost", 4),
             ("Balanced conclusion/ stand with suggestions (retention, reintegration programmes, better pay and opportunities, engage diaspora)", 2)],
 model="""The trend brings both opportunities and concerns, but at the current scale the concerns are greater.
Opportunities: remittances sent home support families and add foreign exchange; Bhutanese abroad gain education, skills, work culture and international experience that they can bring back; emigration reduces pressure on the domestic job market; and the diaspora can build networks for trade, investment and tourism.
Concerns: Bhutan is losing many skilled and experienced people - nurses, doctors, teachers, engineers and civil servants - causing shortages and weaker public services (civil service attrition reached high levels); the government's investment in their education and training is lost; rural areas lose young people, leaving the elderly alone and more land fallow; families are separated; and for a small country with a small population, large-scale emigration threatens the economy, national identity and even security.
To turn this into an opportunity, Bhutan should improve pay, career growth and working conditions to retain talent, create more jobs through private sector growth and projects such as the Gelephu Mindfulness City, encourage Bhutanese to return through reintegration programmes, and engage the diaspora in national development."""),
dict(key="B4", real=True, type=TOP, marks=10, topic="Topical issues: civil service reform", stem=""""In order to realize the vision, the civil service has to be grounded as a robust organization that is apolitical, meritorious, innovative, resilient, and driven by a culture of research and state-of-the-art technology, enabling legislations and indeed the highest ethical standards of its leaders and personnel." (Royal Kasho on Civil Service Reform, 17 December 2020)
How can Bhutanese graduates who join the civil service contribute to realising the Royal Vision? (10 marks)""",
 key_points=[("Apolitical and ethical: neutrality, integrity, no corruption, highest ethical standards", 2), ("Meritorious: work hard, perform, earn promotion on merit, accept performance management", 2),
             ("Innovative and research-driven: new ideas, evidence and data in decisions, problem-solving", 2), ("Technology: digital skills, use and promote digital services", 2),
             ("Resilient and service-minded: adapt to reform and change, continuous learning, citizen-centred service, servant-leader", 2)],
 model="""Graduates joining the civil service can help realise His Majesty's vision by living the qualities named in the Royal Kasho:
1. Apolitical: serve every government and citizen impartially, keeping away from party politics.
2. Highest ethical standards: be honest, punctual and accountable, avoid corruption and favouritism, and use public resources carefully.
3. Meritorious: work hard and deliver results, welcome performance management, and seek advancement only through merit.
4. Innovative and research-driven: bring fresh ideas, question old practices, use data and evidence in decisions, and look for solutions rather than only identifying problems.
5. State-of-the-art technology: develop digital skills and help move services online, making them faster and more transparent.
6. Resilient: adapt to reforms and change, keep learning (through courses, RIGSS and self-study), and work well under pressure.
7. Citizen-centred service: adopt a servant-leader mindset, treating service as a duty and serving everyone equally.
By combining youthful energy and education with these values, new civil servants can make the civil service dynamic and help Bhutan become a developed nation."""),
dict(key="C1", real=True, type=SUBJ, marks=10, topic="Subjective: tourism policy", stem=""""As of Wednesday, 27 tourists have confirmed their visit under the new fee. Some have visited and left, some are in the country and some are on the way." (The Signs are Good, Kuensel editorial, 13 August 2022)
How optimistic or sceptical are you about the revised Sustainable Development Fee (SDF) meeting its objective of 'high value, low volume' tourism? (10 marks)""",
 key_points=[("Context: SDF raised from USD 65 to USD 200 per night (Sept 2022) with tourism reform; objective high value, low volume - quality visitors, sustainability, funds for conservation/ development", 2),
             ("Clear stand (optimistic/ sceptical/ balanced)", 1),
             ("Reasons for optimism: attracts high-spending, respectful visitors, protects culture and environment, funds conservation and free services, better quality services and standards, brand", 3.5),
             ("Reasons for scepticism: lower arrivals hurt hotels, guides, small businesses and jobs; competition with cheaper destinations; regional tourists; uneven benefits; later reduction to USD 100 shows adjustment needed", 3.5)],
 model="""When Bhutan reopened in September 2022, the Sustainable Development Fee was raised from USD 65 to USD 200 per person per night, alongside reforms to improve service standards, aiming at 'high value, low volume' tourism.
My view is cautiously optimistic. Reasons for optimism: the higher fee attracts visitors who value Bhutan's culture and nature and spend more per person; fewer tourists reduce pressure on the environment, monasteries and local communities; the fee funds conservation, free health care and education, and carbon-neutral development; and the reforms push hotels, guides and operators to raise quality, strengthening the Bhutan brand as an exclusive destination.
Reasons for scepticism: the sudden increase reduced arrivals at first (only a few dozen tourists in the first weeks), hurting hotels, guides, drivers, handicraft sellers and small businesses that had already suffered during COVID; Bhutan competes with cheaper Himalayan destinations; regional tourists who now pay the fee may travel less; and benefits may not reach rural communities. The government later reduced the fee to USD 100 (2023) and offered incentives, showing the policy needs adjustment.
Overall, the SDF can achieve high value, low volume tourism if it is combined with better products and services, marketing, and support for affected businesses."""),
dict(key="C2", real=True, type=SUBJ, marks=10, topic="Subjective: youth and substance abuse", stem="""Due to increased instances of substance abuse among youth in Bhutan, random drug tests for teachers and students are being initiated in schools.
What is your assessment of this initiative towards curbing substance abuse among Bhutanese youth? (10 marks)""",
 key_points=[("Positive effects: deterrence, early detection and intervention/ counselling, safer schools, teachers as role models, data on extent of problem", 4),
             ("Concerns: privacy and dignity, stigma and labelling, possible dropouts or hiding, cost and accuracy of tests, focus on testing rather than causes, need consent and confidentiality", 4),
             ("Overall assessment with conditions: must be part of comprehensive approach - counselling, rehabilitation not punishment, awareness, parents, recreation", 2)],
 model="""Assessment: random drug testing is a useful step, but it will work only if it is part of a wider, supportive approach.
Benefits: it acts as a deterrent, because students and teachers know they may be tested; it allows early detection, so young people can receive counselling and treatment before addiction becomes severe; testing teachers ensures that role models in schools are drug-free; it helps make schools safer; and the results give data on the real extent of the problem.
Concerns: testing may violate privacy and dignity if not handled confidentially; students who test positive may be stigmatised, labelled or expelled, pushing them out of school and further into drugs; it may make users hide their problem rather than seek help; tests cost money and can give wrong results; and it treats the symptom rather than the causes, such as peer pressure, family problems, stress and lack of recreation.
To be effective, the initiative must be confidential and fair, focus on helping rather than punishing (counselling, rehabilitation and reintegration), involve parents, and go together with awareness programmes, life-skills education, sports and recreation, and strict action against drug suppliers."""),
dict(key="C3", real=True, type=SUBJ, marks=10, topic="Subjective: society and values", stem="""Bhutan, still seen across the world as a deeply traditional country, will be sending to the Miss Universe pageant a Miss Bhutan who is openly gay, of mixed ethnicity, and who, despite losing both her parents at a young age, has achieved much on her own terms. (Breaking stereotypes and conventions: Miss Universe Bhutan, The Bhutanese, 11 June 2022)
In your personal view, how does a gay Miss Universe Bhutan reflect on our society? (10 marks)""",
 key_points=[("Reflects tolerance, acceptance and inclusiveness; Bhutan decriminalised homosexuality (Penal Code amendment 2020/ 2021); Buddhist values of compassion and non-discrimination", 4),
             ("Reflects modern, open and confident society; equal opportunity; youth and women empowerment; resilience (orphan who succeeded); breaks stereotypes", 3),
             ("Balanced view: some traditional/ conservative views remain, need for respect and dialogue; positive image internationally", 3)],
 model="""In my view, a gay Miss Universe Bhutan reflects well on our society. It shows that Bhutan is tolerant, inclusive and accepting of diversity. In 2021 Parliament amended the Penal Code to decriminalise homosexuality, and choosing an openly gay woman of mixed ethnicity to represent the nation shows that people are judged by their talent and character rather than by sexual orientation or background. This is consistent with Buddhist values of compassion, respect for all beings and non-discrimination, and with the GNH idea that every person's wellbeing matters.
It also shows a society that is modern and confident while rooted in tradition, giving equal opportunities to young women and celebrating resilience - she lost both parents young and still achieved much on her own terms, which inspires other young people facing hardship.
At the same time, some people with traditional or conservative views may be uncomfortable, so acceptance should grow through respectful dialogue rather than conflict. Internationally, her participation breaks the stereotype of Bhutan as closed and rigid and presents a positive image of an open, compassionate and progressive country."""),
dict(key="C4", real=True, type=SUBJ, marks=10, topic="Subjective: sports", stem=""""The 2022 Bhutan Premier League (BPL) next month will witness international players in local clubs, and the tournament is expected to become more competitive among the 10 teams." (Clubs sign international players for 2022 BPL, Kuensel, 20 July 2022)
We are seeing a gradual increase in the inclusion of international players by football clubs in Bhutan. Will the addition of players from outside Bhutan improve the game for Bhutan? (10 marks)""",
 key_points=[("Clear stand", 1), ("Benefits: higher standard and competitiveness, local players learn skills, professionalism and discipline, better coaching culture, attracts spectators and sponsors, better performance in AFC competitions/ national team", 5),
             ("Risks/ conditions: fewer chances for local players, cost to clubs, dependence on foreigners; need quota limits, youth development, coaching", 4)],
 model="""Yes, with limits, international players can improve football in Bhutan.
Benefits: foreign players usually bring higher technical skill, fitness and experience, making the league more competitive; local players learn by training and playing alongside them; they bring professionalism, tactical understanding and discipline; a stronger league attracts more spectators, media and sponsors, giving clubs more income; and higher-level competition improves Bhutanese clubs' performance in AFC competitions and strengthens the national team.
Risks: if clubs rely too much on foreign players, local players get fewer chances, especially young talent; hiring foreigners is costly for clubs with small budgets; and benefits may not reach grassroots football.
Therefore the addition of international players will improve the game if the Bhutan Football Federation keeps a sensible quota on foreign players per team, requires clubs to develop youth academies and play local players, and invests in coaching, facilities and grassroots programmes."""),
mcq("D1", "General knowledge: Bhutan", "Who received the 2022 Blue Planet Prize along with His Majesty the Fourth Druk Gyalpo?", ["Professor Veerabhadran Ramanathan", "Professor Stephen Carpenter", "Professor Jeffrey D. Sachs", "Professor Tilman"], "a", "The 2022 Blue Planet Prize went to His Majesty the Fourth Druk Gyalpo and climate scientist Professor Veerabhadran Ramanathan."),
mcq("D2", "General knowledge: science", "The clearest and most detailed image of the distant universe ever taken was released on 11 July 2022. Which telescope captured it?", ["Subaru Telescope", "Hubble Space Telescope", "Xuntian Space Telescope", "James Webb Space Telescope"], "d", "The James Webb Space Telescope's first deep field image was released in July 2022."),
mcq("D3", "General knowledge: world", "What is the largest nuclear power plant in Europe?", ["Rostov Nuclear Power Plant", "Chernobyl Nuclear Power Plant", "Zaporizhzhia Nuclear Power Plant", "Khmelnytskyi Nuclear Power Plant"], "c", "Zaporizhzhia in Ukraine is Europe's largest nuclear power plant."),
mcq("D4", "General knowledge: books", "Who received the 2021 Booker Prize?", ["Damon Galgut for The Promise", "Joshua Cohen for The Netanyahus", "Geetanjali Shree for Tomb of Sand", "George Saunders for Lincoln in the Bardo"], "a", "Damon Galgut won the 2021 Booker Prize for 'The Promise'."),
mcq("D5", "General knowledge: world", "Which country was the first to give women the right to vote (nationally)?", ["UK", "USA", "Finland", "New Zealand"], "d", "New Zealand gave women the vote in 1893."),
mcq("D6", "General knowledge: sports", "In chess, in what direction can a bishop move?", ["Diagonally", "Horizontally", "Straight ahead", "All directions"], "a", "A bishop moves diagonally."),
mcq("D7", "General knowledge: geography", "Which of these is part of the United Kingdom?", ["Sweden", "Iceland", "Norway", "Scotland"], "d", "The UK is England, Scotland, Wales and Northern Ireland."),
mcq("D8", "General knowledge: Bhutan law", "When was the Domestic Violence Prevention Act of Bhutan enacted by Parliament?", ["2011", "2012", "2013", "2014"], "c", "The Domestic Violence Prevention Act of Bhutan was enacted in 2013."),
mcq("D11", "General knowledge: environment", "World Water Day is celebrated every year on 22 March. The theme of World Water Day 2022 was:", ["Groundwater: Making the invisible visible", "The World's Water: Is there enough?", "Water and Climate Change", "Valuing Water"], "a", "2022: 'Groundwater: Making the invisible visible' (2021 was 'Valuing Water', 2020 'Water and Climate Change')."),
mcq("D12", "General knowledge: world", "Who received the 2022 UNESCO Peace Prize in recognition of efforts to welcome refugees?", ["Joe Biden", "Narendra Modi", "Angela Merkel", "Volodymyr Zelenskyy"], "c", "Former German Chancellor Angela Merkel received the 2022 UNESCO Félix Houphouët-Boigny Peace Prize for welcoming refugees."),
mcq("D13", "General knowledge: wildlife", "Which animal is known as the 'Ghost of the Mountains'?", ["Yak", "Snow leopard", "Brown bear", "Himalayan tahr"], "b", "The elusive snow leopard is called the 'ghost of the mountains'."),
mcq("D15", "General knowledge: Bhutan", "Which country hosted the 75th Regional Committee Meeting for South-East Asia of the World Health Organization (WHO) from 5 to 9 September 2022?", ["Thailand", "Maldives", "India", "Bhutan"], "d", "The 75th session of the WHO South-East Asia Regional Committee was held in Paro, Bhutan."),
mcq("D16", "General knowledge: Bhutan", "Paro Taktsang can be seen on which Bhutanese currency note?", ["Five-Ngultrum note", "Ten-Ngultrum note", "Twenty-Ngultrum note", "Fifty-Ngultrum note"], "a", "Paro Taktsang appears on the Nu 5 note."),
mcq("D17", "General knowledge: books", "Who is the author of 'The History of the Decline and Fall of the Roman Empire'?", ["Herodotus", "Holinshed", "Macaulay", "Edward Gibbon"], "d", "Edward Gibbon wrote it (1776-1789)."),
mcq("D18", "General knowledge: mathematics", "The number one followed by one hundred zeros is known as a:", ["Googol", "Megatron", "Gigabyte", "Namonole"], "a", "10^100 is a googol."),
mcq("D19", "General knowledge: sports", "Which of the following colours does not appear on the Olympic rings?", ["Blue", "Yellow", "Black", "Orange"], "d", "The rings are blue, yellow, black, green and red - no orange."),
mcq("D20", "General knowledge: world", "Who is the first person from a tribal community, and the second woman after Pratibha Patil, to become President of India?", ["Droupadi Murmu", "Indira Gandhi", "Kiran Bedi", "Mary Kom"], "a", "Droupadi Murmu became India's 15th President in July 2022."),
]
