"""ME General Paper II (English Language and General Knowledge), batch 1: the RCSC BCSE 2025 paper plus new questions
of the same kinds.

Pattern (RCSC BCSE 2025, General Paper II): 100 marks, 3 hours writing + 15 minutes reading.
  Section A, case study: one article, answer ALL four questions, 10 marks each (40).
  Section B, topical discussion: answer any 2 of 4, 10 marks each (20).
  Section C, subjective questions: answer any 2 of 4, 10 marks each (20).
  Section D, multiple choice: 20 questions, 1 mark each (20).

Left out of the real paper (not usable as text): Section C Question 2 (needs the picture) and Section D Question 8
(needs the tree diagram). Also left out, because the correct answer could not be confirmed with certainty: Section D
Questions 6, 13 and 15. They can be added once checked.
Years are kept out of what students see; the source year lives in ai_review only.
"""

BATCH = "ME Paper II (General): BCSE 2025 + similar, batch 1"
GROUP_TAG = "2025b1"
PAPER = "me-general-2"
SUBJECT = "english-general-knowledge"
MIN_WORDS = 150
SOURCE = {"title": "BCSE 2025 Main Examination, General category, Paper II", "year": 2025,
          "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/General-Paper-II-English.pdf"}

PATTERN = [
    {"title": "Section A: Case study", "type": "analytical", "count": 1, "marks_each": 40, "answer_any": None},
    {"title": "Section B: Topical discussion", "type": "long_answer", "count": 4, "marks_each": 10, "answer_any": 2},
    {"title": "Section C: Subjective questions", "type": "descriptive", "count": 4, "marks_each": 10, "answer_any": 2},
    {"title": "Section D: Multiple choice questions", "type": "mcq", "count": 20, "marks_each": 1, "answer_any": None},
]

RUBRIC = [
    ("Content and relevance", "Answers exactly what is asked, with correct and relevant points (and evidence from the passage where asked).", 8),
    ("Analysis and examples", "Explains reasons and effects, gives Bhutanese examples and practical suggestions.", 5),
    ("Language", "Correct grammar, spelling and vocabulary; clear sentences.", 4),
    ("Organisation", "Logical order, paragraphs or points, brief introduction and conclusion.", 3),
]

CS, TOP, SUBJ, MCQ = "analytical", "long_answer", "descriptive", "mcq"

PASSAGE_1 = """Read the article below and answer the question that follows.

PHOBJIKHA SHEEP FARMING DECLINES AS YOUTH SEEK CITIES, FARMERS SHIFT TO CROPS (Kuensel)

Phobjikha valley in Wangdue, once home to thousands of sheep, is witnessing a decline in its sheep population, now estimated at a mere 350. This sharp drop indicates the nearing disappearance of traditional sheep farming in the valley, a shift away from a way of life deeply rooted in Phobjikha's culture, as villagers increasingly turn to more profitable crops and the younger generation migrates to urban areas.

Bhutan's sheep population is genetically classified into four distinct types: Jakar, Sipsu, Sarpang, and Sakten. The Jakar variety, believed to be native to Phobjikha and found only in Bumthang and Trongsa, is currently at particular risk.

The Livestock Extension Officer of Phobjikha Gewog reported that the area had over 2,000 sheep in 2013. However, the number has steadily declined over the years. He attributed this to changing lifestyles, stating that while sheep rearing was once a tradition, most villagers have now shifted their focus to potato cultivation, finding sheep rearing too time-consuming and labour-intensive.

The decline has also been worsened by frequent attacks from feral dogs, as well as occasional attacks by bears and other wild animals. "The migration of young people to urban areas in search of better opportunities has left mostly the elderly residents in the villages, which poses a challenge to the conservation of sheep in the near future," said the Livestock Extension Officer.

Currently, about 351 sheep are being reared in two chiwogs in Phobjikha, primarily cared for by elderly villagers. "Sheep rearing is not a lucrative business, and the lack of tsamdro (pastureland), along with the fact that only elderly people are involved, are major hurdles to preserving the native sheep in the gewog," the Livestock Extension Officer said.

The Phobjikha Gup recalled a time, about 30 years ago, when each household would rear as many as 200 sheep. Parents would convert wool into blankets and clothing for their children, providing warmth during harsh winters. Farmers now prefer cultivating potatoes, a more reliable source of income than sheep rearing, which is exhausting and time-consuming because the sheep must be watched constantly to protect them from attacks. Most of the sheep are now sold. "Sheep rearing is not very profitable, as a kilogram of wool sells for only Nu 450-500," the Gup said.

To conserve the native sheep, the Samdrup Phuentshog Lug Detshe was established in collaboration with the National Biodiversity Centre, and equipment, including a wool-shredding machine, was distributed to farmers. However, this initiative did not succeed. Despite sheep manure being known as highly nutritious for the soil, farmers have abandoned the practice due to the challenges and difficulties involved in managing them. The Khemdro Chiwog Tshogpa said that most sheep are now being sold to Bumthang, and only three households in the chiwog are still rearing sheep.

A once-common tradition of taking sheep to summer grazing grounds in the Black Mountains, where yak herders would look after them, has nearly vanished. Most yak herders have sold their yaks, with only one individual continuing the practice.

According to the Integrated Agriculture and Livestock Census, Phobjikha recorded a total of 351 local sheep (96 males and 255 females), with two reported deaths and 0.20 metric tonnes (MT) of wool produced. This reflects a decline from the previous counts of 426 sheep (0.49 MT of wool) and, a year earlier, 770 sheep (3.57 MT of wool). There are 9,176 sheep in the country, with Samtse alone accounting for 5,367 of them."""

PASSAGE_2 = """Read the article below and answer the question that follows.

COMMUNITY FORESTS: WHEN VILLAGES LOOK AFTER THEIR OWN TREES (practice passage written by Soma)

In many parts of Bhutan, villagers no longer wait for a permit from a distant office to collect timber for a new house or firewood for the winter. Under the community forestry programme, groups of households form a Community Forest Management Group (CFMG) and take legal responsibility for a nearby patch of government forest. They agree on a management plan, decide who may harvest what and when, and share the benefits.

Supporters say the programme has changed how people see the forest. "When the forest belongs to all of us, nobody wants to cut a tree carelessly," a member of one group in eastern Bhutan explains. Groups patrol their forest, plant seedlings on bare slopes and fight small fires early. Some groups earn income by selling surplus timber, firewood or non-wood products such as mushrooms, cane, bamboo and medicinal plants, and use part of the money for village needs such as school uniforms or repairs to a lhakhang.

The programme also faces difficulties. Many young people have left for towns and abroad, so the same few elderly members do most of the patrolling and planting. Record-keeping and accounts are demanding for members with little formal education, and a few groups have argued over how benefits should be shared. In some places, demand for timber from outside buyers has tempted members to harvest more than the plan allows. Forest officials say that the groups that work best are those with honest, active leaders and clear rules agreed by everyone.

Community forestry is closely linked to the constitutional duty of every Bhutanese to protect the environment. If it succeeds, it can keep forests healthy while improving rural livelihoods; if it fails, it can lead to quarrels and damage to the very forests it was meant to protect."""


def cs(key, n, stem, kp, model, group, real=False, parent=None):
    return dict(key=key, real=real, parent=parent, kind="new_scenario" if parent else None, type=CS, marks=10,
                topic="Case study and comprehension", group=group, pos=n, stem=stem, key_points=kp, model=model)


Q = [
# ---------------------------------------------------------------- Section A, real case study (one group, 4 questions)
cs("A1", 1, PASSAGE_1 + """

Question 1
"The decline in Phobjikha's sheep population is attributed to altering lifestyles, migration of youth to urban areas, and challenges such as predation by wild animals and lack of pastureland."
Suggest three strategies that the government could implement to help conserve native sheep farming and support the livelihood of villagers. (10 marks)""",
   [("Three distinct, practical strategies linked to the causes in the passage (for example support against predators and feral dogs, pastureland/tsamdro, better wool prices and markets, incentives for youth, conservation breeding of the Jakar sheep)", 6),
    ("Explains how each strategy helps both conservation and livelihoods", 4)],
   """Three strategies the government could implement:

1. Protect the flocks and the pastures. The passage shows that feral dogs, bears and the lack of tsamdro are major hurdles. The government could control feral dogs through sterilisation and management, help farmers build predator-proof night shelters, and set aside or restore community pastureland for sheep. This reduces losses and the constant need to guard the sheep.

2. Make sheep rearing profitable. Farmers prefer potatoes because wool sells for only Nu 450-500 a kilogram. The government could link farmers to weavers and buyers of Bhutanese woollen products, support small processing units for yarn and textiles, brand Phobjikha wool as a heritage product for tourists, and promote the sale of sheep manure as organic fertiliser. Higher income gives villagers a reason to keep sheep.

3. Conserve the native Jakar breed and attract youth. A conservation breeding programme with the National Biodiversity Centre could keep a protected flock, while subsidies, training and small grants for young farmers who take up sheep rearing would bring younger people into the work instead of leaving it to the elderly.

Together these measures protect a rare native breed and give rural families a more secure livelihood.""", "me-general-2-2025b1-a1", real=True),
cs("A2", 2, PASSAGE_1 + """

Question 2
Discuss three economic consequences that the decline of native sheep farming could have on the livelihoods of rural communities like Phobjikha. Support your answer with reasons based on the passage. (10 marks)""",
   [("Three economic consequences (for example loss of a source of income and of home-made woollen clothing, greater dependence on one crop such as potatoes, loss of manure leading to fertiliser costs, loss of traditional skills and heritage products)", 6),
    ("Each supported with reasons or evidence from the passage", 4)],
   """1. Loss of an income source and of self-sufficiency. In the past each household reared up to 200 sheep and turned the wool into blankets and clothing. With only about 351 sheep left and wool production falling sharply, families lose this income and must now buy warm clothing and blankets with cash.

2. Dependence on one crop. Most villagers have shifted to potato cultivation. Relying mainly on one crop exposes households to risks such as falling potato prices, pests or poor weather, with no livestock income to fall back on.

3. Higher farming costs and weaker soil. The passage notes that sheep manure is highly nutritious for the soil. Without it, farmers may need to buy chemical fertilisers, which increases costs and can harm the soil in the long term.

In addition, when the elderly herders are gone, the skills of wool processing and weaving may disappear, closing the door to future income from heritage products.""", "me-general-2-2025b1-a1", real=True),
cs("A3", 3, PASSAGE_1 + """

Question 3
What financial concerns are emphasised in the passage as a consequence of farmers abandoning sheep rearing in favour of more lucrative alternatives like potato farming? Mention any interventions or initiatives discussed in the passage that were aimed at sustaining sheep farming, and explain why they may not have succeeded. (10 marks)""",
   [("Financial concerns from the passage: low price of wool (Nu 450-500 per kg), sheep rearing not lucrative, potatoes a more reliable income, labour and time cost of guarding sheep", 4),
    ("Intervention: Samdrup Phuentshog Lug Detshe with the National Biodiversity Centre and distribution of equipment such as a wool-shredding machine", 3),
    ("Reasons it failed: no market or profit, labour shortage and elderly herders, predators and lack of pasture, equipment without support", 3)],
   """Financial concerns: the passage stresses that sheep rearing is "not a lucrative business". A kilogram of wool sells for only Nu 450-500, which does not reward the effort of rearing. Sheep must be watched constantly to protect them from feral dogs and wild animals, so the labour cost is high. Potato farming is seen as a more reliable source of income, so farmers sell their sheep and switch to crops.

Interventions: to conserve the native sheep, the Samdrup Phuentshog Lug Detshe was set up in collaboration with the National Biodiversity Centre, and equipment such as a wool-shredding machine was distributed to farmers.

Why they may not have succeeded:
- They did not solve the basic problem of low income from wool; without a market and a fair price, equipment alone does not make rearing worthwhile.
- Most young people have migrated, leaving only elderly villagers who cannot manage flocks and machines.
- Attacks by predators and the lack of pastureland continued.
- There may have been little follow-up training, organisation or support after the equipment was handed over.""", "me-general-2-2025b1-a1", real=True),
cs("A4", 4, PASSAGE_1 + """

Question 4
"Sheep manure is known to be highly nutritious for the soil, but farmers have abandoned the practice due to the challenges and difficulties involved in managing them." (Para 6)
Mention and elaborate two pragmatic actions you can personally take to help revive eco-friendly practices like sheep farming in rural communities. (10 marks)""",
   [("Two practical personal actions (for example buying local woollen products and organic produce, volunteering or helping elderly farmers, promoting the practice on social media, supporting or joining a cooperative, sharing knowledge about manure and organic farming)", 6),
    ("Each action elaborated: how it helps and how it is realistic for an individual", 4)],
   """1. Support the market for local wool and organic produce. I can buy blankets, scarves and other products made from Bhutanese wool, and vegetables grown with organic manure, and encourage my family and office to do the same. When people buy these products, sheep rearing and organic farming become more profitable, which is the main reason farmers have abandoned them.

2. Lend a hand and spread awareness. During holidays I can help elderly relatives and neighbours in my village with herding, building shelters or collecting manure, and volunteer with groups such as Desuung in community projects. I can also use social media to share stories about native sheep, the value of manure for soil, and young people who earn a living from farming, so that more youth see these practices as worthwhile.

Small personal actions like these, repeated by many people, help keep eco-friendly traditions alive in rural Bhutan.""", "me-general-2-2025b1-a1", real=True),

# ---------------------------------------------------------------- Section A, new case study of the same kind
cs("A1s", 1, PASSAGE_2 + """

Question 1
Suggest three measures that could help Community Forest Management Groups overcome the difficulties described in the passage. (10 marks)""",
   [("Three measures linked to the difficulties in the passage (involving youth, training in record-keeping and accounts, fair benefit-sharing rules, monitoring of harvesting, support from forest officials)", 6),
    ("Explains how each measure solves a specific difficulty", 4)],
   """1. Bring young people into the groups. Membership could be offered to young people living in nearby towns, with small paid tasks such as patrolling, nursery work or managing accounts, and schools could run nature clubs linked to the community forest. This shares the workload now carried by a few elderly members.

2. Train members in record-keeping and accounts. Forest officials or local organisations could run simple, practical training and provide easy record books or a mobile app. Clear records reduce mistakes and suspicion.

3. Agree on fair rules and check that they are followed. Each group should agree openly on how benefits are shared and how much may be harvested, display the rules in the village, and invite forest officials to review harvesting each year. Clear rules and regular checks prevent quarrels and stop members from over-harvesting for outside buyers.

With these measures the groups can protect the forest and keep members united.""", "me-general-2-s1-cs", parent="A1"),
cs("A2s", 2, PASSAGE_2 + """

Question 2
Explain three benefits that community forestry can bring to rural households, using evidence from the passage. (10 marks)""",
   [("Three benefits supported by the passage: easier access to timber and firewood, income from selling surplus and non-wood products, money for village needs, healthier forests through patrolling, planting and fire control, a sense of ownership", 6),
    ("Evidence from the passage for each", 4)],
   """1. Easy access to forest resources. Villagers no longer have to wait for a permit from a distant office to collect timber for houses or firewood for winter, because the group manages a nearby forest under its own plan.

2. Income for households and the village. Groups can sell surplus timber, firewood and non-wood products such as mushrooms, cane, bamboo and medicinal plants. Part of the income is used for community needs such as school uniforms or repairs to a lhakhang.

3. A healthier forest that keeps giving. Because the forest "belongs to all of us", members patrol it, plant seedlings on bare slopes and fight fires early. A well-managed forest protects water sources and soil and provides resources for future generations.

These benefits show how community forestry can join conservation with better rural livelihoods.""", "me-general-2-s1-cs", parent="A2"),
cs("A3s", 3, PASSAGE_2 + """

Question 3
According to the passage, what can make some community forest groups fail? Explain why "honest, active leaders and clear rules" are important for their success. (10 marks)""",
   [("Causes of failure from the passage: few elderly members doing the work, difficult record-keeping and accounts, quarrels over benefit-sharing, temptation to over-harvest for outside buyers", 5),
    ("Why honest, active leaders and clear rules matter: trust, fairness, accountability, preventing over-harvesting and conflict", 5)],
   """The passage shows several reasons why some groups struggle or fail:
- Young people have left for towns and abroad, so a few elderly members do most of the patrolling and planting.
- Record-keeping and accounts are hard for members with little formal education.
- Some groups have quarrelled over how benefits are shared.
- Demand from outside buyers has tempted members to harvest more than the plan allows.

Honest, active leaders and clear rules address these problems. An honest leader keeps accounts open and handles money fairly, so members trust one another. An active leader organises patrols, planting and meetings, so the work does not fall on a few people. Clear rules agreed by everyone show who may harvest what and how benefits are shared, which prevents quarrels and over-harvesting. Together, good leadership and clear rules make the group accountable to its members and to the forest.""", "me-general-2-s1-cs", parent="A3"),
cs("A4s", 4, PASSAGE_2 + """

Question 4
"Community forestry is closely linked to the constitutional duty of every Bhutanese to protect the environment."
Mention and elaborate two actions you can personally take to support forest conservation in your community. (10 marks)""",
   [("Two practical personal actions (for example joining planting and clean-up drives, using firewood and timber responsibly, reporting illegal felling and fires, raising awareness, supporting local forest products)", 6),
    ("Each elaborated and linked to the constitutional duty as a trustee of natural resources", 4)],
   """Article 5 of the Constitution makes every Bhutanese a trustee of the country's natural resources. Two actions I can take:

1. Take part in conservation work. I can join tree-planting drives on Social Forestry Day, clean-up campaigns and the activities of the local community forest group, and encourage friends to come along. Planting and caring for seedlings helps restore bare slopes and protects water sources.

2. Use forest resources wisely and protect the forest. At home I can use firewood efficiently, for example with improved stoves, avoid wasting timber, and choose sustainable products. I can also report illegal felling and forest fires quickly to the gewog or forest office.

These actions are small, but if every citizen takes them, Bhutan can keep its forests healthy for future generations.""", "me-general-2-s1-cs", parent="A4"),

# ---------------------------------------------------------------- Section B, real topical questions
dict(key="B1", real=True, type=TOP, marks=10, topic="Topical issues: national values", stem="""During the second week of July, at the start of construction for the Gelephu International Airport, His Majesty The King, Her Majesty The Gyaltsuen, and Their Royal Highnesses led the groundworks by contributing manual labour. Thousands of volunteers across Sarpang, along with government officials, armed forces, Desuups and Gyalsups, have contributed their manual labour. Another volunteer, Pangla, said that as a farmer who has always worked in the field, working in the heat is not an issue. "This is just the beginning. I hope to continue working for another two or three years, as long as my health allows," he said. "This is for our children. We are building our future. The GMC is for us and our children. My children will benefit from this project, and even the world will benefit from it." (Kuensel)

Use the above excerpt to analyse how the volunteer initiative at the Gelephu Mindfulness City (GMC) reflects core Bhutanese values and contributes to shaping national identity and Bhutan's future. In your response, substantiate with reasons the roles of civic participation, intergenerational responsibility, and leadership by example in following the development path for Bhutan. (10 marks)""",
 key_points=[("Core values shown: selfless service, unity, gratitude, hard work, dignity of labour (with evidence from the excerpt)", 3),
             ("Civic participation: citizens from all walks of life building a national project together", 2),
             ("Intergenerational responsibility: 'This is for our children', building for the future", 2),
             ("Leadership by example: the Royal Family leading the groundwork", 2),
             ("Link to national identity and Bhutan's future", 1)],
 model="""The volunteer work at the start of the Gelephu airport reflects values that define Bhutan: selfless service to the nation, unity, gratitude to the Throne and the dignity of hard work. Thousands of people, from the Royal Family to farmers, Desuups and Gyalsups, worked side by side in the heat without expecting reward.

Civic participation: when citizens personally contribute to a national project, they feel ownership of it. Farmers, officials and the armed forces working together show that development is not only the government's task but everyone's responsibility, which strengthens national unity.

Intergenerational responsibility: the volunteer Pangla says, "This is for our children. We are building our future." This shows the Bhutanese belief that each generation must work and sacrifice for the next, which is at the heart of GNH and sustainable development.

Leadership by example: His Majesty The King, Her Majesty The Gyaltsuen and Their Royal Highnesses led the groundwork themselves. When leaders work with their own hands, people are inspired to follow, and trust between leaders and citizens grows.

Together, these values build a national identity based on service and unity, and they give the GMC a strong foundation as a project of the whole nation for Bhutan's future."""),
dict(key="B2", real=True, type=TOP, marks=10, topic="Topical issues: economy and environment", stem=""""A new venture is bubbling beneath the surface. Welcome to the country's first crawfish farm, promising a fresh twist to local aquaculture. Crawfish Himalayan Limited, a foreign direct investment company in Phuentsholing, is preparing to bring crawfish to both domestic and international markets. The general manager said, 'We are developing a state-of-the-art hatchery to breed and cultivate Cherax quadricarinatus, one of the most sought-after crawfish species globally. Known for its high market value and strong international demand, this species presents a significant opportunity for sustainable aquaculture.'" (BBS)

Based on the above excerpt, evaluate the potential of Bhutan's first crawfish farm to contribute to sustainable economic development. Write two opportunities and one possible environmental challenge such ventures might bring. (10 marks)""",
 key_points=[("Brief evaluation of potential for sustainable economic development", 2),
             ("Opportunity 1 explained (for example export earnings and foreign currency, diversification)", 3),
             ("Opportunity 2 explained (for example jobs, skills and technology through FDI, local supply)", 3),
             ("Environmental challenge explained (for example escape of a non-native species into rivers, disease, water pollution)", 2)],
 model="""The crawfish farm shows how foreign direct investment can bring a new, high-value industry to Bhutan and help diversify an economy that depends heavily on hydropower and tourism.

Opportunity 1: export earnings and diversification. The species has high market value and strong international demand. Exporting it can bring foreign currency and reduce Bhutan's trade deficit, while adding aquaculture as a new sector of the economy.

Opportunity 2: jobs, skills and technology. A state-of-the-art hatchery creates jobs for young Bhutanese and brings modern aquaculture knowledge through the foreign investor. Local farmers may later supply feed or start their own farms, and Bhutanese consumers get a new source of protein.

Environmental challenge: Cherax quadricarinatus is not native to Bhutan. If animals escape into rivers, they could compete with native species, spread disease and upset river ecosystems. Wastewater from ponds may also pollute nearby water.

Overall, the venture has real potential for sustainable development, provided strict biosecurity, water treatment and environmental monitoring are in place."""),
dict(key="B3", real=True, type=TOP, marks=10, topic="Topical issues: economy and environment", stem="""Bhutan recently commissioned its first utility-scale solar photovoltaic (PV) power plant, the 17.38 MW Sephu Solar Project in Wangdue Phodrang, to diversify its renewable energy portfolio.

Propose and explain two practical ways in which you and your community can support the growth and adoption of solar energy in Bhutan. (10 marks)""",
 key_points=[("Way 1: practical, explained (for example installing rooftop solar or solar water heaters/lights at home, school or lhakhang)", 4),
             ("Way 2: practical, explained (for example awareness, community or cooperative projects, using solar in farming such as solar pumps and fencing)", 4),
             ("Why solar matters for Bhutan: diversification, winter shortfall, energy security", 2)],
 model="""Bhutan's electricity comes mainly from hydropower, which falls in the dry winter months. Solar energy diversifies supply and improves energy security, and every community can help it grow.

1. Use solar energy in homes and community buildings. Families can install solar water heaters, solar lights and, where possible, rooftop panels. Communities can install solar panels on schools, lhakhangs and community centres. Each installation reduces demand on the grid and shows neighbours that solar works in Bhutan's conditions.

2. Use solar in farming and spread awareness. Farmers can use solar-powered water pumps for irrigation and solar electric fences against wild animals, which save cost and are reliable in remote areas. Youth and local leaders can share information about these benefits through community meetings and social media and help families learn about available support schemes.

By taking up solar ourselves and encouraging others, we support Bhutan's goal of clean, diverse and secure energy."""),
dict(key="B4", real=True, type=TOP, marks=10, topic="Topical issues: technology and governance", stem="""With the mounting presence of generative artificial intelligence (GAI) tools like ChatGPT in workplaces, Bhutanese civil servants are beginning to explore their use in tasks such as drafting reports, analysing policy documents, and improving service delivery.

Express your views in about 150-200 words on the application of GAI in the civil service by emphasising and elaborating two advantages of using GAI for civil servants and one probable risk or limitation it might pose to ethical governance or public trust. (10 marks)""",
 key_points=[("Advantage 1 elaborated (for example saving time on drafting and summarising)", 3),
             ("Advantage 2 elaborated (for example better analysis and faster, more consistent service to citizens)", 3),
             ("One risk or limitation (for example errors and invented facts, data privacy and confidentiality, bias, over-reliance, accountability)", 3),
             ("Own view and length about 150-200 words", 1)],
 model="""Generative AI can be a useful assistant for Bhutanese civil servants if it is used carefully.

The first advantage is saving time. Tools such as ChatGPT can prepare first drafts of letters, reports and meeting minutes, and summarise long documents in seconds. Officers can then spend more time on thinking, checking and serving the public.

The second advantage is better analysis and service. AI can help compare policy documents, find key points and answer common questions from citizens quickly and consistently, which improves the speed and quality of public services.

However, there is a serious risk. AI can produce confident but wrong information, and it may be biased. Civil servants may also enter confidential government or personal data into public tools, which threatens privacy and security. If decisions rely on unchecked AI output, public trust in government could be damaged.

In my view, the civil service should adopt GAI with clear guidelines: protect data, always check the output, and keep a human officer accountable for every decision."""),

# ---------------------------------------------------------------- Section B, new topical questions
dict(key="B1s", parent="B1", kind="new_scenario", type=TOP, marks=10, topic="Topical issues: national values", stem="""Every year thousands of Desuups and other volunteers support the nation during emergencies and national events, from flood response and fire fighting to helping with large national gatherings.

Analyse how volunteerism reflects Bhutanese values and strengthens the nation. In your answer, explain the roles of civic responsibility, unity, and leadership by example. (10 marks)""",
 key_points=[("Bhutanese values shown by volunteerism: selfless service, compassion, gratitude, unity", 3),
             ("Civic responsibility explained with an example", 2),
             ("Unity across backgrounds explained", 2),
             ("Leadership by example explained (for example the Royal Family and leaders who serve)", 2),
             ("Link to national strength and resilience", 1)],
 model="""Volunteerism reflects deep Bhutanese values: selfless service, compassion for others, gratitude to the country and the Throne, and the belief that the nation's well-being comes before personal comfort.

Civic responsibility: volunteers act because they see the nation's problems as their own. When floods or fires strike, Desuups and local people do not wait for others; they protect lives and property themselves. This sense of duty is the foundation of a strong society.

Unity: volunteers come from every background, such as students, farmers, civil servants and business people, and serve side by side in the same uniform. Shared work builds friendship and trust and reduces divisions between people and regions.

Leadership by example: His Majesty The King and the Royal Family personally lead and take part in national service. When leaders serve, citizens are inspired to follow.

Through these values, volunteerism makes Bhutan more resilient in crises and keeps the spirit of service alive in every generation."""),
dict(key="B2s", parent="B2", kind="new_scenario", type=TOP, marks=10, topic="Topical issues: economy and environment", stem="""Many young Bhutanese are starting small agribusinesses, such as mushroom farms, poultry units and dairy processing, supported by credit schemes and training programmes.

Evaluate the potential of youth agribusiness to contribute to sustainable development in Bhutan. Write two opportunities and one challenge such ventures may face. (10 marks)""",
 key_points=[("Brief evaluation of potential", 2),
             ("Opportunity 1 explained (for example jobs and self-employment for youth, reducing unemployment and migration)", 3),
             ("Opportunity 2 explained (for example food self-sufficiency, fewer imports, rural development)", 3),
             ("Challenge explained (for example markets and prices, access to finance, skills, wildlife damage, climate)", 2)],
 model="""Youth agribusiness can play an important role in Bhutan's development by joining employment for young people with greater food self-sufficiency.

Opportunity 1: jobs and self-employment. Agribusiness allows young people to create their own work instead of waiting for office jobs. This reduces youth unemployment and the pressure to migrate to towns or abroad.

Opportunity 2: food security and rural development. Local production of mushrooms, eggs, milk products and vegetables reduces Bhutan's dependence on imports and keeps money in the country. Farms in rural areas also bring life and income back to villages.

Challenge: finding reliable markets and fair prices. Small producers often compete with cheaper imports and face high transport costs, and some lack business skills or enough capital. Without steady buyers, many ventures may close.

Overall, youth agribusiness has strong potential if it is supported with market links, training, affordable credit and cooperation among producers."""),
dict(key="B3s", parent="B3", kind="new_scenario", type=TOP, marks=10, topic="Topical issues: economy and environment", stem="""Waste management has become a growing concern in Bhutan's towns, with plastic and household waste increasing every year.

Propose and explain two practical ways in which you and your community can reduce waste and keep your surroundings clean. (10 marks)""",
 key_points=[("Way 1: practical, explained (for example segregating waste at source, composting, recycling)", 4),
             ("Way 2: practical, explained (for example reducing plastic use, community clean-up campaigns, awareness)", 4),
             ("Why it matters: health, environment, tourism, Bhutan's clean image", 2)],
 model="""Waste harms health, pollutes rivers and spoils the beauty that Bhutan is known for. Every household and community can help.

1. Segregate and reuse waste at home. Families can separate wet waste from dry waste. Kitchen waste can be composted into manure for gardens, while paper, bottles and metals can be given to recyclers. This greatly reduces what goes to landfills and makes recycling easier.

2. Reduce plastic and organise community action. We can carry our own cloth bags and water bottles, avoid single-use plastics, and choose products with less packaging. Communities, schools and youth groups can organise regular clean-up campaigns and awareness drives, and keep their own neighbourhood clean.

If each of us reduces and manages waste responsibly, our towns will stay clean, healthy and attractive for residents and visitors."""),
dict(key="B4s", parent="B4", kind="new_scenario", type=TOP, marks=10, topic="Topical issues: technology and governance", stem="""Government services in Bhutan are increasingly offered online, from applying for documents to paying bills, and many citizens now use mobile banking and digital identity.

Express your views in about 150-200 words on digital public services by explaining two advantages for citizens and one challenge the government must address. (10 marks)""",
 key_points=[("Advantage 1 elaborated (for example saving time and travel, services from remote areas)", 3),
             ("Advantage 2 elaborated (for example transparency, less corruption, faster service)", 3),
             ("One challenge (for example digital divide, internet access, digital literacy of elderly, cyber security and privacy)", 3),
             ("Own view and length about 150-200 words", 1)],
 model="""Digital public services can make government faster and fairer for every Bhutanese.

The first advantage is convenience. Citizens can apply for documents, pay bills and access information from home or a village, without travelling to a dzongkhag or thromde office and waiting in queues. This saves time and money, especially for people in remote areas.

The second advantage is transparency and efficiency. Online systems record every step, so applications are processed in order, delays are visible and opportunities for favouritism or corruption are reduced. Officials can also serve more people with less paperwork.

However, the government must address the digital divide. Many elderly people, rural residents and those with little education lack smartphones, reliable internet or digital skills, so they may be left behind. Online systems also need strong cyber security to protect citizens' personal data.

In my view, digital services are the right direction, but they must be combined with digital literacy programmes, community help desks and strong data protection, so that no citizen is excluded."""),

# ---------------------------------------------------------------- Section C, real subjective questions (Q2 needs a picture)
dict(key="C1", real=True, type=SUBJ, marks=10, topic="Subjective: environment and citizenship", stem="""Article 5 of the Constitution of the Kingdom of Bhutan declares that every Bhutanese is a trustee of the country's natural resources and must help protect the environment for present and future generations. Mention and elaborate two ways a citizen can help protect Bhutan's natural environment. (10 marks)""",
 key_points=[("Brief link to Article 5 and the idea of a trustee", 2),
             ("Way 1 mentioned and elaborated (for example reducing waste and pollution)", 4),
             ("Way 2 mentioned and elaborated (for example planting trees, saving energy and water, protecting wildlife, following environmental laws)", 4)],
 model="""Article 5 makes every Bhutanese a trustee of the country's natural resources. This means we hold the environment in trust for future generations and must protect it, not only enjoy it.

1. Reduce waste and pollution. A citizen can avoid plastic bags and single-use items, segregate waste at home, compost kitchen waste and never litter in rivers, forests or towns. Less waste keeps our water clean, protects wildlife and keeps Bhutan beautiful.

2. Protect forests and resources. A citizen can take part in tree-planting and clean-up campaigns, use firewood and water carefully, choose energy-saving appliances and report illegal logging, poaching or forest fires to the authorities. These actions help Bhutan keep its forest cover and rich biodiversity.

If every citizen acts as a responsible trustee, Bhutan can continue to be a carbon-negative country with a healthy environment for generations to come."""),
dict(key="C3", real=True, type=SUBJ, marks=10, topic="Subjective: general knowledge", stem="""Discuss one potential benefit and one risk of adopting cryptocurrency as a mainstream form of payment in the global economy. (10 marks)""",
 key_points=[("Brief explanation of cryptocurrency", 2),
             ("One benefit discussed (for example fast, low-cost cross-border payments, financial inclusion, transparency of blockchain)", 4),
             ("One risk discussed (for example price volatility, fraud and scams, use in crime, weak regulation, loss of savings)", 4)],
 model="""Cryptocurrency is a digital currency, such as Bitcoin, that uses cryptography and blockchain technology and is not issued or controlled by a central bank.

Benefit: fast and low-cost cross-border payments. Cryptocurrency can be sent anywhere in the world within minutes, without going through several banks. This can make payments cheaper and quicker for businesses and for workers sending money home, and it can give people without bank accounts access to digital payments through a mobile phone.

Risk: price volatility and fraud. The value of many cryptocurrencies rises and falls sharply within days, so people who are paid or save in them may suddenly lose much of their money. Because transactions are hard to reverse and regulation is still weak in many countries, scams, hacking and illegal uses such as money laundering are common.

So cryptocurrency offers speed and access, but its instability and risks mean it needs strong regulation before it can safely become a mainstream form of payment."""),
dict(key="C4", real=True, type=SUBJ, marks=10, topic="Subjective: education and language", stem="""Should teachers in Bhutanese classrooms use translanguaging (switching between languages) to teach subjects other than Dzongkha, even though English is the official medium of instruction? Why? Provide two reasons to justify your stand. (10 marks)""",
 key_points=[("Clear stand (yes, no or a qualified yes)", 2),
             ("Reason 1 explained with an example", 4),
             ("Reason 2 explained with an example; any condition or limit noted", 4)],
 model="""Yes, I believe teachers may use translanguaging in a limited and planned way, while keeping English as the main medium of instruction.

Reason 1: it improves understanding. Many children, especially in rural schools, do not speak English at home. When a difficult idea in science or mathematics is explained briefly in Dzongkha or the child's home language, students understand the concept instead of only memorising English words. Once they understand, they can learn the English terms more easily.

Reason 2: it builds confidence and participation. Students who struggle with English often stay silent. Allowing them to discuss ideas in a familiar language, and then present in English, encourages them to take part, ask questions and learn from one another. It also values Bhutanese languages and identity.

However, translanguaging should support English, not replace it. Teachers should use it mainly to explain and check understanding, and gradually move students back to English, so that they still gain the English skills they need for higher studies and work."""),

# ---------------------------------------------------------------- Section C, new subjective questions
dict(key="C1s", parent="C1", kind="new_scenario", type=SUBJ, marks=10, topic="Subjective: environment and citizenship", stem="""Article 9 of the Constitution directs the State to promote conditions that will enable the pursuit of Gross National Happiness. Mention and elaborate two ways in which a citizen can contribute to Gross National Happiness in daily life. (10 marks)""",
 key_points=[("Brief explanation of GNH and the State's duty", 2),
             ("Way 1 mentioned and elaborated (for example honest, productive work and good governance)", 4),
             ("Way 2 mentioned and elaborated (for example caring for community, culture and environment, personal well-being)", 4)],
 model="""Gross National Happiness is Bhutan's development philosophy: progress should balance material growth with well-being, culture, good governance and the environment. The Constitution asks the State to promote it, but citizens also have a part to play.

1. Work honestly and serve others. By doing our jobs with integrity, being punctual and treating people fairly, we support good governance and a productive economy. Helping neighbours, volunteering and respecting others builds trust and harmony in society.

2. Care for culture, nature and well-being. We can speak Dzongkha, take part in community festivals, protect the environment by reducing waste and planting trees, and look after our own health and mental well-being and that of our families.

When each citizen lives in this balanced way, GNH becomes a reality in daily life, not only a government policy."""),
dict(key="C2s", new=True, type=SUBJ, marks=10, topic="Subjective: writing skills", stem="""You are the Communication Officer of your dzongkhag administration. Write a short official press release (about 150-200 words) informing the public about a tree-planting campaign to be held in your dzongkhag next month. Include the purpose, date, venue and how the public can take part. (10 marks)""",
 key_points=[("Correct press-release format: heading, place and date line, contact details at the end", 3),
             ("Content: purpose, date, venue, how to take part, who is organising", 4),
             ("Formal, clear and concise language, about 150-200 words", 3)],
 model="""PRESS RELEASE
Dzongkhag Administration launches tree-planting campaign

[Dzongkhag], [date]: The Dzongkhag Administration, in collaboration with the Department of Forests and Park Services and local schools, will hold a tree-planting campaign on [date] at [venue], beginning at 9 a.m.

The campaign aims to restore degraded slopes, protect water sources and raise awareness of every citizen's duty to protect the environment, as enshrined in Article 5 of the Constitution. Around 2,000 native seedlings will be planted during the day.

Members of the public, students, Desuups, civil servants and business communities are warmly invited to take part. Participants are requested to register with their gewog office or at the dzongkhag administration by [date], and to bring a water bottle and, if possible, a digging tool. Seedlings, gloves and refreshments will be provided.

Let us come together to keep our dzongkhag green for present and future generations.

For more information, please contact:
Communication Officer, Dzongkhag Administration
Phone: [number] | Email: [address]"""),
dict(key="C3s", parent="C3", kind="new_scenario", type=SUBJ, marks=10, topic="Subjective: general knowledge", stem="""Discuss one potential benefit and one risk of the growing use of social media among young people in Bhutan. (10 marks)""",
 key_points=[("Brief introduction to the growth of social media use", 2),
             ("One benefit discussed (for example access to information and learning, staying connected, opportunities for business and creativity)", 4),
             ("One risk discussed (for example misinformation, cyberbullying, addiction and mental health, privacy)", 4)],
 model="""Social media platforms such as Facebook, TikTok and YouTube are now part of daily life for most young Bhutanese, who use them on smartphones for news, entertainment and communication.

Benefit: access to information and opportunities. Young people can learn new skills from online tutorials, follow news, join discussions and connect with friends and relatives abroad. Many youth also use social media to promote small businesses, share their art and music, or raise awareness on social issues.

Risk: misinformation and harm to well-being. False news and rumours spread quickly and can mislead people. Too much time online can lead to addiction, poor sleep and weaker studies, and cyberbullying and comparison with others can harm mental health. Sharing personal information carelessly also creates privacy and safety risks.

Social media is therefore a powerful tool. Young people need digital literacy and self-discipline to enjoy its benefits while avoiding its dangers."""),
dict(key="C4s", parent="C4", kind="new_scenario", type=SUBJ, marks=10, topic="Subjective: education and language", stem="""Should mobile phones be allowed in Bhutanese classrooms for learning purposes? Why? Provide two reasons to justify your stand. (10 marks)""",
 key_points=[("Clear stand (yes, no or a qualified view)", 2),
             ("Reason 1 explained with an example", 4),
             ("Reason 2 explained with an example; any condition noted", 4)],
 model="""I believe mobile phones should be allowed in classrooms only for planned learning activities, under the teacher's guidance.

Reason 1: they open up learning resources. With a phone, students can look up information, watch short educational videos, use dictionaries and learning apps, and practise skills such as mathematics or languages. In schools with few books or computers, phones can bring the world's knowledge into the classroom.

Reason 2: they prepare students for a digital future. Bhutan is moving towards digital services and jobs. Using phones responsibly in class teaches students how to search, check sources and use technology for work, skills they will need after school.

However, phones can also distract students, enable cheating and expose them to harmful content. Therefore schools should allow them only when the teacher plans a learning task, with clear rules, and phones should be kept away at other times."""),
dict(key="C5s", new=True, type=SUBJ, marks=10, topic="Subjective: general knowledge", stem="""Discuss one advantage and one disadvantage of working from home for employees and organisations. (10 marks)""",
 key_points=[("Brief introduction to remote work", 2),
             ("One advantage discussed (for example flexibility, saving travel time and costs, wider talent pool)", 4),
             ("One disadvantage discussed (for example isolation, communication and supervision problems, blurred work-life boundaries, need for reliable internet)", 4)],
 model="""Working from home became common during the COVID-19 pandemic and has continued in many organisations, supported by internet and online meeting tools.

Advantage: flexibility and savings. Employees save the time and money spent on travelling, and can arrange their work around family needs, which can improve well-being and productivity. Organisations can save on office space and can hire skilled people who live far away.

Disadvantage: isolation and weaker teamwork. Employees may feel lonely and disconnected from colleagues, and communication can become slow or unclear. Supervisors find it harder to guide new staff, and work and home life can mix, leading to longer working hours and stress. Working from home also depends on reliable internet and electricity, which are not available everywhere.

A balanced approach, combining some days in the office with some days at home, can bring the benefits while reducing the problems."""),

# ---------------------------------------------------------------- Section D, real MCQs (Q6, Q8, Q13, Q15 left out)
dict(key="D1", real=True, type=MCQ, topic="English: vocabulary and idioms", stem="After years of hard work, she is finally on cloud nine. The idiom \"on cloud nine\" in the sentence means:",
     opts=["Feeling extremely happy.", "Feeling very confused.", "Feeling frustrated.", "Feeling anxious."], ans=0,
     exp="\"On cloud nine\" means extremely happy, which fits the reward after years of hard work."),
dict(key="D2", real=True, type=MCQ, topic="General knowledge", stem="The exclusive legal right granted to a creator of an original work that prevents others from using, reproducing, or sharing it without consent is known as:",
     opts=["Patent", "Trademark", "Copyright", "Plagiarism"], ans=2,
     exp="Copyright protects original creative works. A patent protects inventions, a trademark protects brand names and logos, and plagiarism is the wrongful copying of others' work."),
dict(key="D3", real=True, type=MCQ, topic="English: language and linguistics", stem="A Bhutanese baby who is adopted and brought up by an Italian-speaking couple will have the physical characteristics inherited from his/her biological parents but will inevitably speak Italian. This shows that language is:",
     opts=["a behavioural aspect of humans.", "passed down from generations.", "imprinted in the child's brain.", "inherited by the speaker."], ans=0,
     exp="The child inherits physical features but learns the language of the people around them, so language is learned behaviour, not inherited."),
dict(key="D4", real=True, type=MCQ, topic="General knowledge", stem="To gain a competitive advantage, an organisation implements multiple approaches for the professional development of its employees. Which strategy among the following is the most effective?",
     opts=["Selection strategy", "Training strategy", "Recruitment strategy", "Compensation strategy"], ans=1,
     exp="Professional development of existing employees is achieved through training. Selection and recruitment bring in new staff; compensation concerns pay."),
dict(key="D5", real=True, type=MCQ, topic="English: grammar", stem="The sentence that demonstrates correct parallel structure is:",
     opts=["She likes to read books, swimming in the lake, and jog in the park.", "She likes reading books, to swim in the lake, and jogging in the park.",
           "She likes reading books, swimming in the lake, and to jog in the park.", "She likes reading novels, swimming in the pool, and jogging in the park."], ans=3,
     exp="Parallel structure uses the same form for each item: reading, swimming, jogging. Only the last sentence uses -ing forms throughout."),
dict(key="D7", real=True, type=MCQ, topic="General knowledge: Bhutan", stem="Sequence the following organisations based on the chronological order of Bhutan's membership, from the earliest to the latest.\nI. NAM\nII. SAARC\nIII. BIMSTEC\nIV. Colombo Plan",
     opts=["I, III, IV, II", "IV, I, II, III", "II, IV, I, III", "III, I, II, IV"], ans=1,
     exp="Bhutan joined the Colombo Plan in 1962, the Non-Aligned Movement in 1973, SAARC as a founding member in 1985, and BIMSTEC in 2004."),
dict(key="D9", real=True, type=MCQ, topic="English: literature", stem="If Ms X is reading a classic novel, which of the following authors is best known for writing \"Pride and Prejudice\", a book she might choose?",
     opts=["Charles Dickens", "George Orwell", "Emily Brontë", "Jane Austen"], ans=3,
     exp="\"Pride and Prejudice\" (1813) was written by Jane Austen."),
dict(key="D10", real=True, type=MCQ, topic="English: literature", stem="Which type of poem is Mr X most likely reading if it has 14 lines, is often written in iambic pentameter, and explores themes of love, time, or beauty?",
     opts=["Ode", "Haiku", "Sonnet", "Ballad"], ans=2,
     exp="A sonnet has 14 lines, usually in iambic pentameter, and often deals with love, time and beauty."),
dict(key="D11", real=True, type=MCQ, topic="English: writing and research", stem="A friend is asking for help to understand in-text citation for his/her research paper. The option that best explains what in-text citation is:",
     opts=["Listing the sources used at the end of the research paper.", "Writing a summary of the research in your own words.",
           "Quoting a sentence directly without mentioning the source.", "Including the author's name and publication year within parentheses."], ans=3,
     exp="An in-text citation gives the source within the text, such as (Author, Year). The list at the end is the reference list or bibliography."),
dict(key="D12", real=True, type=MCQ, topic="General knowledge: science", stem="You are part of a space research team tasked with collecting soil samples and investigating the possibility of life on Mars. The type of space mission that would help achieve this goal is:",
     opts=["Rover mission", "Orbiter spacecraft", "Flyby mission", "Human spaceflight mission"], ans=0,
     exp="A rover lands and moves on the surface, so it can collect and study soil samples. Orbiters and flybys observe from space."),
dict(key="D14", real=True, type=MCQ, topic="General knowledge: sports", stem="On August 1, 2025, why did the Bhutan Football Federation host a Football Carnival Festival at the Changlimithang Stadium in Thimphu?",
     opts=["To mark the opening of the football season", "To conduct trials for the national football team", "To raise awareness about youth football training", "To celebrate 25 years of Bhutan's membership in FIFA"], ans=3,
     exp="Bhutan became a member of FIFA in 2000, so 2025 marked 25 years of membership."),
dict(key="D16", real=True, type=MCQ, topic="English: grammar", stem="The student improved her writing by practising every day. The word \"practising\" in the sentence is:",
     opts=["a gerund", "a participle", "a main verb", "an infinitive"], ans=0,
     exp="\"Practising\" follows the preposition \"by\" and works as a noun (the act of practising), so it is a gerund."),
dict(key="D17", real=True, type=MCQ, topic="General knowledge: sports", stem="In which of the following years did Brazil win the FIFA Men's World Cup?",
     opts=["1950, 1958, 1962, 1970, 1994", "1958, 1962, 1970, 1994, 2002", "1954, 1966, 1974, 1990, 1998", "1962, 1970, 1982, 1994, 2006"], ans=1,
     exp="Brazil has won the World Cup five times: 1958, 1962, 1970, 1994 and 2002."),
dict(key="D18", real=True, type=MCQ, topic="General knowledge: geography", stem="The incorrectly matched pair among the largest producers of these food products is:",
     opts=["Norway – Maize", "Brazil – Coffee", "China – Rice", "India – Wheat"], ans=0,
     exp="Norway is not a major maize producer (the largest is the United States). Brazil leads in coffee, China in rice, and India is among the largest wheat producers."),
dict(key="D19", real=True, type=MCQ, topic="General knowledge: mathematics", stem="Which of the following statements about numbers is incorrect?",
     opts=["The sum of two irrational numbers can be rational.", "Every prime number greater than 2 is odd.", "The square root of 2 is a rational number.", "Zero is an even number."], ans=2,
     exp="The square root of 2 is irrational: it cannot be written as a fraction. The other three statements are true."),
dict(key="D20", real=True, type=MCQ, topic="General knowledge: education", stem="Which of the following activities best demonstrates bodily-kinesthetic intelligence according to Howard Gardner's theory of Multiple Intelligences?",
     opts=["Solving logical puzzles with patterns and sequences.", "Expressing ideas effectively through public speaking.", "Learning new dance choreography through movement.", "Understanding abstract concepts in philosophical texts."], ans=2,
     exp="Bodily-kinesthetic intelligence is skill in using the body, as in dance. Puzzles are logical-mathematical, speaking is linguistic, and philosophy is mainly logical or existential."),

# ---------------------------------------------------------------- Section D, new MCQs of the same kinds
dict(key="M1", new=True, type=MCQ, topic="English: vocabulary and idioms", stem="Losing that job turned out to be a blessing in disguise. The idiom \"a blessing in disguise\" means:",
     opts=["Something good that at first seemed bad.", "A secret gift from a friend.", "A misfortune that cannot be avoided.", "A reward for hard work."], ans=0,
     exp="A blessing in disguise is something that seems unfortunate at first but later proves to be good."),
dict(key="M2", new=True, type=MCQ, topic="English: vocabulary and idioms", stem="Choose the word closest in meaning to \"meticulous\":",
     opts=["Careless", "Very careful and precise", "Quick", "Generous"], ans=1,
     exp="Meticulous means showing great attention to detail; very careful and precise."),
dict(key="M3", new=True, type=MCQ, topic="English: grammar", stem="Which sentence is in the passive voice?",
     opts=["The officer submitted the report.", "The report was submitted by the officer.", "The officer is submitting the report.", "The officer will submit the report."], ans=1,
     exp="In the passive voice the object becomes the subject and the verb uses a form of \"be\" + past participle: \"The report was submitted\"."),
dict(key="M4", new=True, type=MCQ, topic="General knowledge: Bhutan", stem="In which year did Bhutan become a member of the United Nations?",
     opts=["1962", "1971", "1985", "2008"], ans=1,
     exp="Bhutan joined the United Nations in 1971."),
dict(key="M5", new=True, type=MCQ, topic="General knowledge: Bhutan", stem="Bhutan's National Day, 17 December, commemorates:",
     opts=["The adoption of the Constitution", "The coronation of the first King, Ugyen Wangchuck, in 1907", "Bhutan's admission to the United Nations", "The birth of Guru Rinpoche"], ans=1,
     exp="National Day marks the enthronement of Gongsar Ugyen Wangchuck as the first hereditary King of Bhutan on 17 December 1907."),
dict(key="M6", new=True, type=MCQ, topic="General knowledge: Bhutan", stem="The Constitution of the Kingdom of Bhutan was adopted in:",
     opts=["1953", "1999", "2008", "2013"], ans=2,
     exp="The Constitution was adopted on 18 July 2008."),
dict(key="M7", new=True, type=MCQ, topic="General knowledge: Bhutan", stem="The highest mountain in Bhutan is:",
     opts=["Jomolhari", "Gangkar Puensum", "Masang Gang", "Jichu Drake"], ans=1,
     exp="Gangkar Puensum (about 7,570 m) is Bhutan's highest peak and is considered the highest unclimbed mountain in the world."),
dict(key="M8", new=True, type=MCQ, topic="English: literature", stem="Which author wrote the novel \"Nineteen Eighty-Four\" (1984)?",
     opts=["Aldous Huxley", "George Orwell", "Charles Dickens", "Ernest Hemingway"], ans=1,
     exp="\"Nineteen Eighty-Four\" was written by George Orwell and published in 1949."),
dict(key="M9", new=True, type=MCQ, topic="English: literature", stem="A traditional Japanese haiku has:",
     opts=["Three lines", "Four lines", "Fourteen lines", "No fixed number of lines"], ans=0,
     exp="A haiku has three lines, traditionally of 5, 7 and 5 syllables."),
dict(key="M10", new=True, type=MCQ, topic="English: grammar", stem="Choose the grammatically correct sentence.",
     opts=["Neither the teacher nor the students was late.", "Neither the teacher nor the students were late.", "Neither the teacher or the students were late.", "Neither the teacher nor the students is late."], ans=1,
     exp="With \"neither ... nor\", the verb agrees with the nearer subject, \"students\", so it is plural: were."),
dict(key="M11", new=True, type=MCQ, topic="English: vocabulary and idioms", stem="Choose the word opposite in meaning to \"scarce\":",
     opts=["Rare", "Limited", "Abundant", "Expensive"], ans=2,
     exp="Scarce means in short supply; its opposite is abundant."),
dict(key="M12", new=True, type=MCQ, topic="General knowledge: Bhutan", stem="Which of the following is NOT one of the four pillars of Gross National Happiness?",
     opts=["Good governance", "Preservation and promotion of culture", "Rapid industrialisation", "Environmental conservation"], ans=2,
     exp="The four pillars are good governance, sustainable socio-economic development, preservation and promotion of culture, and environmental conservation."),
dict(key="M13", new=True, type=MCQ, topic="General knowledge: geography", stem="The largest ocean in the world is the:",
     opts=["Atlantic Ocean", "Indian Ocean", "Arctic Ocean", "Pacific Ocean"], ans=3,
     exp="The Pacific Ocean is the largest and deepest ocean."),
dict(key="M14", new=True, type=MCQ, topic="General knowledge: Bhutan", stem="The currency of Bhutan is the:",
     opts=["Ngultrum", "Rupee", "Taka", "Kyat"], ans=0,
     exp="Bhutan's currency is the Ngultrum (Nu), which is pegged to the Indian Rupee."),
dict(key="M15", new=True, type=MCQ, topic="General knowledge: science", stem="Which planet is known as the Red Planet?",
     opts=["Venus", "Jupiter", "Mars", "Saturn"], ans=2,
     exp="Mars looks red because of iron oxide (rust) on its surface."),
dict(key="M16", new=True, type=MCQ, topic="English: grammar", stem="In the sentence \"She speaks softly\", the word \"softly\" is:",
     opts=["an adjective", "an adverb", "a noun", "a preposition"], ans=1,
     exp="\"Softly\" describes how she speaks, so it modifies the verb: it is an adverb."),
dict(key="M17", new=True, type=MCQ, topic="English: writing and research", stem="Presenting someone else's work or ideas as your own without acknowledgement is called:",
     opts=["Citation", "Paraphrasing", "Plagiarism", "Copyright"], ans=2,
     exp="Plagiarism is using another person's work or ideas without giving credit."),
dict(key="M18", new=True, type=MCQ, topic="General knowledge: Bhutan", stem="The national sport of Bhutan is:",
     opts=["Football", "Archery", "Cricket", "Khuru"], ans=1,
     exp="Archery (dha) is Bhutan's national sport."),
dict(key="M19", new=True, type=MCQ, topic="General knowledge: science", stem="Which of the following is a renewable source of energy?",
     opts=["Coal", "Natural gas", "Solar energy", "Petroleum"], ans=2,
     exp="Solar energy is renewable; coal, natural gas and petroleum are fossil fuels that cannot be replaced."),
dict(key="M20", new=True, type=MCQ, topic="General knowledge", stem="The SAARC Secretariat is located in:",
     opts=["New Delhi", "Thimphu", "Kathmandu", "Dhaka"], ans=2,
     exp="The SAARC Secretariat was set up in Kathmandu, Nepal, in 1987."),
]
