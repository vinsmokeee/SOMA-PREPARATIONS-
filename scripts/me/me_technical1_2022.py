"""ME Technical Paper I, BCSE 2022 (real questions only), batch 4. PDF sent by the founder (20 Nov 2026).
Questions join the 2025 bank (pattern from me_technical1_2025.py). 2022 had FOUR topical questions (any two).
Dzongkha 2022: comprehension ka 9, kha 3, ga 3 (15) + translation 15 = 30. Left out of GK (answer not certain):
Q9 (dzongkhag with most constituencies), Q13 (university that conferred the honorary doctorate).
"""
import os, runpy
_base = runpy.run_path(os.path.join(os.path.dirname(__file__), "me_technical1_2025.py"))
PATTERN, RUBRIC = _base["PATTERN"], _base["RUBRIC"]
CS, TOP, M, C, T = "analytical", "long_answer", "mcq", "passage", "translation"

BATCH = "ME Paper I (Technical): BCSE 2022, batch 4"
GROUP_TAG = "2022b4"
PAPER = "me-technical-1"
SUBJECT = "language-general-knowledge"
MIN_WORDS = 0
ADDS_TO_PAPER = True
SOURCE = {"title": "BCSE 2022 Main Examination, Technical category, Paper I (Language and GK)", "year": 2022,
          "url": "https://rcsc.gov.bt/technical-paper-1/"}
DZ = "Dzongkha: please have a fluent Dzongkha reader check it before publishing."
G1, D1 = "me-technical-1-2022b4-cs", "me-technical-1-2022b4-dz"

CASE = """Read the following passage and answer ALL THREE questions.

FACING EXTINCTION (Kevin Hall)

For many centuries, the Kawesqars (Kah-WES-cars) endured in the harsh land at the bottom of South America where the bitter wind is sometimes strong enough to knock down a child, but they have not fared so well against their fellow man. Today fewer than 20 pureblood Kawesqars survive.

Most of the pureblood Kawesqars and another 100 people of mixed-race live in Punta Arenas, Chile’s southernmost city; in Puerto Williams, on the Chilean coast of Tierra del Fuego Island near the southern tip of South America; or in Puerto Eden, on Wellington Island.

Diseases brought by European sheep farmers and seal hunters at the end of the 19th century killed many Kawesqars. So did alcoholism. The settlers’ bounty on the heads of the Kawesqars who hunted their sheep was a factor, too, but so was the simple act of switching to western clothing.

Discarded clothing carried Western diseases, and because the stormy Patagonia region of South America often experiences all four seasons in a day, paddling in the wet clothing soon brought pulmonary diseases for which the Kawesqars had no immunity. Tuberculosis reached epidemic proportions.

Today, the Kawesqars are nearly extinct, pursued by social scientists on ‘cultural salvage’ operations to learn as much as possible about them before they disappear.

With the death of the last surviving elders “goes all our ancestral knowledge,” said Oscar Aguilera, an ethnolinguist (a student of the languages of society) at the University of Chile in Santiago who had spent two decades among the Kawesqars.

The nomadic Kawesqars had neither tribal structure nor leaders, living instead in extended families headed by the oldest male. To the surprise of anthropologists, they also had no god or gods.

“They believe in a force that gives balance to all things,” said Nelson Aguilera, an anthropologist who heads the Punta Arenas office of the National Indigenous Development Corp. (Conadi), a quasi-governmental aid agency for native Chileans. When the balance is upset, Kawesqars blame a spirit called Ayayema.

Alberto Achacaz Walakial, whose family guesses he is between 70 and 80, is one of the surviving elders. He lives in a shack with a car seat as his couch. To put food on the table, he carves sea lion bones into makeshift harpoon tips and sews tiny toy canoes out of sea lion skins, souvenirs for the tourist trade.

“We used to navigate these straits in canoes. But that was when we were children,” he recalled in Spanish. He is short and stocky, round-faced, with oriental eyes, coarse hair, a dark complexion and a halting speech rhythm. Kawesqars resemble Alaskan Inuit, who are also believed to have come to the Americas from Asia, and who live in a similarly unforgiving environment.

Achacaz became animated – and hard to understand – as he recalled fishing and hunting expeditions in his childhood. That was before 1936 when Chile built an air force base on Wellington Island. The last Kawesqars abandoned their wigwams in favour of ramshackle subsidized housing. Instead of fishing, they began taking odd jobs. Cheap jackets replaced the wraps of sea lion skin that had helped them fend off the cold for generations.

Only one of Achacaz’s three daughters, Veronica, speaks Kawesqar. There are almost no Kawesqars left to marry who are not blood relatives.

“It would be really nice, because we understand things among ourselves that no one else does,” said Veronica, 40, who married a mixed-race man. Their daughter, Susan, 4, soon will begin learning Kawesqar from elders. It won’t be easy, because of the way their language reflects the Kawesqar’s unique experience. For example, the Kawesqars have words for the immediate future, but not for the indefinite future – basically, for tonight’s dinner but not for next Friday’s meal.

“For them, this is a concept that just doesn’t exist,” said Paz Errazuriz, a Chilean artist who brought the Kawesqars national attention in 1996 with an acclaimed photography exhibit called Nomads of the Sea, which has since travelled the globe. She contends the Kawesqars’ lack of the concept of a future helps explain their inability to escape poverty. On the other hand, Kawesqars have at least 32 variants of the word ‘here’, one each for the principal places or kinds of places they used to visit as nomads.

Their ancestors are believed to have wandered across the Bering Strait from Siberia to Alaska thousands of years ago. They lived in isolation until 1520, when Ferdinand Magellan, a Portuguese captain sailing under the Spanish flag, discovered the southern strait that links the Atlantic and Pacific oceans.

“They were always people with great mobility”, said Conadi’s Aguilera. “Land means nothing to them. They view the sea as land.” Offered land, a few Kawesqars accepted small parcels in southernmost Chile, but most did not. Some, such as Patricio Tonko, 30, want exclusive fishing rights in certain Patagonian channels and the government aid to buy commercial fishing boats.

But their dwindling numbers make it hard to win attention from Santiago, the Chilean capital 2,500 kilometers to the north. “There is nobody who represents us. All the indigenous power is in the north”, where another more numerous native group lives, the Mapuches, said Tonko, a full-blooded Kawesqar who was adopted and raised in Punta Arenas in a Spanish-speaking household.

Among the Kawesqars’ biggest challenges is escaping the impression they’re already extinct. Tourist haunts in Patagonia sell postcards and buttons made from grainy, sepia-coloured photographs of

Kawesqars at the end of the 19th century. “The impression left is that Chile had an indigenous past but that it’s over”, said Mario Martinez, one of the first activists to help the Kawesqars. “Everything there points to an end: an end of the race and the culture”, photographer Errazuriz said in an interview in Santiago. “They are at the end of their lineage and live at the end of the world . . . It is evident in everything that they are the last.”"""

DZP = """༉ འཛམ་གླིང་ནང་ལུ་ ཡར་རྒྱས་ཀྱི་འགྱུར་བ་ཚུ་ ཡར་ངོའི་ཟླཝ་བཟུམ་སྦེ་ ཉིནམ་གཅིག་བ་ཉིནམ་གཅིག་ གོང་འཕེལ་འགྱོཝ་མས། དེ་དང་ཅི་ཁར་ འཕྲུལ་ཆས་ཚུ་ཡང་ རྣམ་པ་སྣ་ཚོགས་ ཐོན་དོ་ཡོད་པའི་གྲས་ལས་ ད་རེས་ནངས་པ་ མི་ག་ར་གིས་ ཁྱབ་ཆེཝ་སྦེ་ ལག་ལེན་འཐབ་མི་ འགྲུལ་འཕྲིན་འདི་ཨིན་པས། དེ་ཡོད་པ་ཅིན་ གནམ་མེད་ས་མེད་ སྟབས་བདེ་ཏོག་ཏོ་དང་ མེད་པ་ཅིན་ཐ་སྡུག་པའི་ནང་ལས་ ཐ་སྡུག་ཤོས་ཅིག་ཨིན་མས། འགྲུལ་འཕྲིན་འདི་ བརྒྱུད་འཕྲིན་བཟུམ་སྦེ་མེན་པར་ རང་ག་ཏེ་འགྱོ་ས་ལུ་ འབག་བཏུབ། ལག་ལེན་འཐབ་རུང་ སྟབས་བདེ་ཏོག་ཏོ་ ཨིནམ་པའི་གུ་ མེད་ཐབས་མེད་པའི་ནོར་བུ་བཟུམ་ཅིག་ཨིན། དེ་འབདཝ་ད་འགྲུལ་འཕྲིན་འདི་ལག་ལེན་ འཐབ་མ་ཤེས་པ་ཅིན་ འཕྲལ་དང་ཕུག་ལུ་ དེ་ལས་བརྟེན་པའི་ གནོད་པ་དང་ཉེན་ཁ་ཡང་ སྦོམ་སྦེ་ར་མཐོངམ་མས།

ཧེ་མ་འབད་བ་ཅིན་ གོངམ་དང་རང་གི་ཕམ་ སྤུན་ཆ་དང་ལྟ་ལྟོ་ཚང་ཚུ་དང་གཅིག་ཁར་ འབྲེལ་བ་འཐབ་དགོ་པ་ཅིན་ ཡི་གུ་ཕར་ཚུར་བསྐྱལ་ཏེ་ འབྲེལ་བ་འཐབ་ཞིནམ་ལས་ བསམ་ལན་ཚུ་ བརྗེ་སོར་འབད་དེ་ སྡོད་ནུག། ཨིན་རུང་ དུས་རབས་ ཉེར་གཅིག་པའི་ནང་ལུ་ ཚན་རིག་མཁས་པ་ཚུ་གི་ བཀའ་དྲིན་ལས་བརྟེན་ཏེ་ ལ་དང་ལུང་གི་རྒྱབ་ཁར་ཡོད་མི་ཚུ་ཡང་ གདོང་བསྐོར་རྐྱབ་སྟེ་ ཡོདཔ་བཟུམ་སྦེ་ བློ་ཕར་ཚུར་ སླབ་ཚུགས་པས། དུས་ཡུན་སྐར་ཆ་གཅིག་ ལང་མ་ལངམ་ཅིག་གི་ ནང་འཁོད་ལུ་ཡི་གུ་ག་ཅི་བཟུམ་ བསྐྱལ་ནི་ཡོད་རུང་ བསྐྱལ་སའི་ས་སྒོ་ནང་ལུ་ དེ་འཕྲོ་ལས་ལྷོད་ཚུགས་པས།

འགྲུལ་འཕྲིན་ལག་ལེན་ ལེགས་ཤོམ་སྦེ་ འཐབ་མ་ཤེས་པ་ཅིན་ ཕམ་དང་བུ་གཞི་ སྤུན་ཆ་དང་ལྟ་ལྟོ་ཚང་ཚུ་གི་བར་ན་ སྟབས་མ་བདེཝ་དང་ དཀའ་ངལ་ཐོན་ས་མཐོང་མས། གཉེན་དང་གྲོགས་ཀྱི་བར་ན་ བཟའ་ཚང་གི་དཀའ་ངལ་དང་ དགའཝ་མཐུནམ་ཚུ་ཡང་ལ་ལུ་ཁ་བྱལ། ལ་ལུ་ཅིག་གསརཔ་ཕྱད་མི་ཡང་ ལེ་ཤ་ཅིག་ར་འདུག། འགྲུལ་འཕྲིན་འདི་ ཉེ་བར་མཁོཝ་ཅིག་ཨིན་རུང་ ཚུལ་མཐུན་འབད་ལག་ལེན་མ་འཐབ་པ་ཅིན་ ནང་དོག་སར་ཚུད་ནིའི་ ཉེན་ཁ་ཡང་ སྦོམ་སྦེ་ར་འདུག། ཚུལ་དང་མཐུནམ་སྦེ་ ལག་ལེན་འཐབ་པ་ཅིན་ བསམ་པའི་འཆར་གཞི་དང་ ལས་སྣ་ག་ཅི་བཟུམ་ཡོད་རུང་ ཡུདཔ་ཐེངས་ཅིག་ལུ་ར་ འབད་ཚུགས་དོ་ཡོདཔ་ཨིན།

འགྲུལ་འཕྲིན་ལག་པར་མེད་པ་ཅིན་ ག་ནི་བ་ཁག་ཆེ་བའི་ཅ་ལ་ཅིག་ འབྱང་སྟོར་ཤོར་སོངཔ་བཟུམ་ཚོར་ཏེ་ སེམས་ཡང་ འཚབ་འཚུབ་འབད་དེ་ ག་ཅི་ཅིག་མ་ཚངམ་བཟུམ་སྦེ་ སྡོད་སར་མཐོངམ་མས། འཕྲུལ་ཆས་དེ་ནང་ལུ་ ཕན་ཐོགས་ཆེ་བའི་ ཡོན་ཏན་གསརཔ་སྣ་ཚོགས་ཡོད་རུང་ དེ་ཚུ་ མི་མང་ཤོས་ཅིག་གིས་ར་ གཞན་ལུ་སྐྱོན་བརྗོད་དང་ མ་བདེན་པའི་གནས་ཚུལ་ཚུ་ སྤེལ་ནིའི་མཁོ་ཆས་བཟུམ་ཅིག་འབད་ ལག་ལེན་འཐབ་མས། རང་རིགཔ་བསྒྱིམས་ཏེ་ མ་སྡོད་པ་ཅིན་ འགྲུལ་འཕྲིན་ནང་ལུ་ ཡོད་པའི་ཡོངས་འབྲེལ་གྱི་རིམ་ལུགས་ཚུ་ ལག་ལེན་འཐབ་སྟེ་ མགུ་སྐོར་རྐྱབ་མི་ཡང་ ཡར་སེང་འགྱོ། ཁྲིམས་འགལ་གྱི་ ལཱ་འབད་མི་ཚུ་ཡང་ ཉིན་བསྟར་བཞིན་དུ་ཡར་འཕར་འགྱོ་སྟེ་ར་འདུག། དེ་གིས་ མཇུག་ལས་མཇུག་སུ་ རང་ལུ་གནོདཔ་མ་ཚད་ ཕམ་དང་སྤུན་ཆ་ཚུ་ལུ་ཡང་ ཚ་གྱང་བཀལཝ་ཨིན་ནོ།"""

TR = """Bhutan’s education program, both modern and monastic, has been a success story. Our general literacy rate today stands at 71.4% and youth literacy rate at over 93%. Mass education and literacy resulted in the creation of a corps of administrative and technical personnel which was required for development while reducing our dependence on foreign experts. We have come a long way in developing our national human resource in diverse fields. More than a hundred years later, we find ourselves on the point of a new century again and in need of a new vision to prepare for what lies ahead. Unlike the past century, this one is qualitatively and quantitatively different. It is defined by the accelerated rate of change in all aspects of our lives because of rapid technological advancements and globalization. The future will be more wired and digital, driven by sophisticated technologies in towns and villages alike, as well as in homes and in workplaces. Since the introduction of parliamentary democracy, our time and energy have largely been committed to the establishment of democratic institutions and ensuring their success. This remains a national priority. However, we need to bring into focus other equally compelling national priorities. Education is an indispensable one. The Ministry of Education has made commendable efforts to initiate reforms in our education system. It is now time to give renewed life to these efforts by reorienting our school structures for the need and challenges of a different social context. We must revisit our curriculum, pedagogy, learning process, and assessments to either transform or rewrite them in view of the challenges and opportunities of the twenty-first century. Otherwise, continued focus on textbooks and content without integrating technology and social learning risks perpetuating passive modes of learning. Then, whatever education our children acquire today will become irrelevant and obsolete when they graduate. Their competitiveness in an increasingly progressive and fast-changing world will be compromised and the nation will suffer by paying a heavy price. (The kasho (Royal edict) on the reforms decreed for the education on December 17, 2020)."""


def mcq(key, stem, opts, ans, exp):
    return dict(key=key, real=True, type=M, topic="General knowledge", stem=stem, opts=opts, ans=ans, exp=exp)


def top(key, topic, stem, kp, model):
    return dict(key=key, real=True, type=TOP, marks=10, topic=topic, stem=stem + " (10 marks)", key_points=kp, model=model)


Q = [
dict(key="A1", real=True, type=CS, marks=10, topic="Case study", group=G1, pos=1, stem=CASE + """

Question 1
How does the Kawesqars' language reflect the way they lived? How is it (the language) also the cause of their struggle for survival once other people settled in their land? (10 marks)""",
     key_points=[("Language reflects nomadic sea life: words for the immediate future but not the indefinite future; at least 32 variants of 'here' for places visited", 5),
                 ("Cause of struggle: no concept of a distant future, so no planning or saving - linked to their inability to escape poverty in a settled economy; hard to pass on as few speakers remain", 5)],
     model="""The Kawesqar language mirrors their life as sea nomads. They lived day to day, hunting and fishing for what they needed immediately, so their language has words for the immediate future, such as tonight's dinner, but not for an indefinite future like next Friday. They moved constantly between places along the channels, so they have at least 32 different words for "here", one for each main place or kind of place they used to visit.

The same language became part of their struggle once settlers arrived. In a settled, cash-based economy, people need to plan, save and think about the long term. Without the concept of a future, the Kawesqars found it hard to plan, invest or save, and the artist Paz Errazuriz argues that this helps explain their inability to escape poverty. Their words also describe a nomadic world that no longer exists, so with few speakers left and children growing up among Spanish speakers, the language is hard to pass on, and with it their knowledge disappears."""),
dict(key="A2", real=True, type=CS, marks=10, topic="Case study", group=G1, pos=2, stem="""Question 2
The article ends with the line, "It is evident in everything that they are the last."
Mention two pieces of evidence that the author points to in the article to show that those living Kawesqars are the last pure-blood of the tribe and elaborate them. (10 marks)""",
     key_points=[("Evidence 1 elaborated: fewer than 20 pureblood Kawesqars survive; almost none left to marry who are not blood relatives (mixed marriages)", 5),
                 ("Evidence 2 elaborated: language and way of life dying - only one of Achacaz's three daughters speaks Kawesqar; elders dying with ancestral knowledge; canoes, wigwams and sealskin replaced; tourist postcards present them as already extinct", 5)],
     model="""First, their numbers are tiny. Fewer than 20 pureblood Kawesqars survive, and there are almost no Kawesqars left to marry who are not blood relatives. Veronica, for example, married a mixed-race man, so their daughter is not pureblood; each generation becomes more mixed.

Second, their language and way of life are disappearing with the elders. Only one of Alberto Achacaz's three daughters speaks Kawesqar, and when elders like him die, "all our ancestral knowledge" goes with them. They no longer travel in canoes or live in wigwams; they live in subsidised housing, do odd jobs and make souvenirs for tourists. Even postcards sold to tourists show them as a people of the past, giving the impression that they are already extinct."""),
dict(key="A3", real=True, type=CS, marks=10, topic="Case study", group=G1, pos=3, stem="""Question 3
Like in Chile, Bhutan also has many minority indigenous tribes that may become extinct not far in the future if appropriate measures are not taken. Identify any ONE tribe and suggest ways in which the government and the people themselves can help this tribe to thrive. (10 marks)""",
     key_points=[("One tribe identified with brief description (e.g. Doyas/Lhop of Samtse, Monpas of Trongsa/Zhemgang, Brokpas of Merak-Sakteng, Layaps)", 2),
                 ("Government measures (education and health access, documenting language and culture, livelihood and land rights, cultural tourism)", 4),
                 ("Measures by the community itself (teach language to children, keep festivals and crafts, cooperatives, community leaders)", 4)],
     model="""One such group is the Doyas (Lhops) of Dorokha and Taba-Dramtoe in Samtse, a small community with its own language, customs and burial practices.

The government can help by documenting their language, songs and rituals with the Dzongkha Development Commission and the National Library, so that knowledge is preserved; by providing schools, health care and roads while respecting their way of life; by supporting livelihoods such as farming, cardamom and crafts, and protecting their land; and by promoting community-based cultural tourism that brings income without destroying traditions.

The community itself must keep its identity alive: parents should speak their language at home, elders can teach songs, rituals and skills to children, festivals should continue, and the community can form cooperatives to market products. Educated Doya youth can act as leaders and bridges between tradition and modern life.

With both efforts, the Doyas can modernise without losing who they are."""),
top("B1", "Topical issues: employment", """In recent times, many Bhutanese, educated youths in particular, have been going abroad by the hundreds in search of employment and a better life. Concerned citizens have opined that this trend, among other things, would lead to brain-drain. Elaborate your views on this issue.""",
    [("Clear view", 2), ("Causes (limited jobs and pay, better opportunities abroad, peer influence)", 3), ("Effects: brain-drain (doctors, nurses, teachers, engineers), ageing villages; but remittances and skills", 3), ("Suggestions", 2)],
    """I agree that large-scale migration of educated youth risks brain-drain, though it also brings some benefits.

Young people leave because jobs at home are limited, salaries are low compared with countries like Australia, and they want further study and a better life for their families; friends' success stories encourage others.

The loss is serious when skilled professionals such as nurses, doctors, teachers and engineers leave, creating gaps in public services and slowing development. Villages are left with the elderly. On the other hand, migrants send remittances, and those who return bring new skills and experience.

To limit brain-drain, Bhutan should improve pay and careers in critical professions, create private-sector jobs (for example through Gelephu Mindfulness City), keep links with Bhutanese abroad and make it easy for them to return and invest."""),
top("B2", "Topical issues: economy", """The government recently endorsed the Tourism Levy Bill that increased the Sustainable Development Fee (SDF) to US $200 every night for a tourist. This decision has been met with mixed reactions from the people concerned like the tour operators and hotel owners. Express your opinion on this decision by highlighting its effect on the economy of the country.""",
    [("Clear opinion", 2), ("Positive effects (high-value low-volume tourism, revenue for sustainability, less pressure on environment and culture)", 3),
     ("Negative effects (fewer tourists, losses for tour operators, hotels, guides, drivers, handicraft sellers; jobs)", 3), ("Balanced suggestion", 2)],
    """The decision supports "high value, low volume" tourism, but its economic effects are mixed.

On the positive side, a higher SDF brings more revenue per visitor for health, education, environmental protection and carbon-neutral development, and it avoids mass tourism that can damage our culture and environment.

On the negative side, many tourists may choose cheaper destinations, so arrivals fall. Tour operators, hotels, guides, drivers, restaurants and handicraft sellers lose income, and many young people in the sector lose jobs at a time when the economy is recovering from COVID-19. Foreign exchange earnings may also fall.

In my opinion the policy is right in principle, but it needs flexibility: incentives such as reduced fees for longer stays or for visits to less-visited eastern dzongkhags, and better quality services so that tourists feel they get value for the fee. (The SDF was later reduced to US $100 in 2023.)"""),
top("B3", "Topical issues: environment", """At the 2021 United Nations Climate Change Conference (COP 26), several countries agreed to accelerate the implementation of 'transition to zero emission vehicles' as one of the ways to address climate change. Explain your stand on this agreement by giving evidence of the pros and cons of 'zero emission vehicles'.""",
    [("Clear stand", 2), ("Pros with evidence (no exhaust, less CO2 and air pollution, lower running costs, use of clean hydropower in Bhutan, less fuel import)", 4),
     ("Cons with evidence (high cost, charging infrastructure, battery mining and disposal, electricity source in other countries, range in mountains)", 4)],
    """I support the agreement, while recognising its challenges.

Pros: zero emission vehicles such as electric cars produce no exhaust, so they cut carbon dioxide and air pollution in cities. Running costs are lower because electricity is cheaper than fuel and EVs need less maintenance. For Bhutan, EVs run on our own clean hydropower, reducing fuel imports and the trade deficit.

Cons: EVs are expensive to buy and need charging stations, which are still few. Batteries require mining of lithium and cobalt, which harms the environment, and old batteries must be recycled safely. In countries whose electricity comes from coal, EVs only move emissions to power plants. In mountainous areas, cold weather and steep roads reduce range.

Overall, with support for charging networks, recycling and clean power, the transition is an important step against climate change."""),
top("B4", "Topical issues: international relations", """The following is an extract of an article that appeared recently in a journal: "There could be no better example of the United Nations' failure to live up to its founding ideals than the recent visit by Secretary-General António Guterres to Russia. Attempting to calm the dangerous war in Ukraine, he obtained nothing of significance." To what extent do you agree or disagree with the extract? Provide evidence in support of your opinion.""",
    [("Clear stand", 2), ("Evidence for the extract (war continued; Security Council veto by Russia; UN unable to stop aggression)", 4),
     ("Evidence against (humanitarian corridors e.g. Mariupol/Azovstal evacuation, Black Sea Grain Initiative, aid to refugees)", 4)],
    """I partly disagree with the extract.

It is true that the UN failed to stop the war. Russia, as a permanent member of the Security Council, can veto any resolution against it, so the UN could not take strong action, and Guterres' visit to Moscow in April 2022 did not bring a ceasefire. This shows a weakness in the UN's structure.

However, the visit was not without results. It helped arrange the evacuation of civilians from the Azovstal steel plant in Mariupol, and the UN later brokered, with Turkey, the Black Sea Grain Initiative that allowed Ukrainian grain to reach world markets and eased a global food crisis. UN agencies also provided humanitarian aid to millions of refugees.

So the UN did not achieve peace, but it still served its humanitarian ideals; the real problem lies in the power of the permanent members."""),
mcq("C1", "The Nobel Prize is awarded as per the will of", ["Alfred Nobel", "Isaac Nobel", "Nobel Asimov", "Asimov Nobel"], 0, "The prizes were founded by the will of Alfred Nobel (1895)."),
mcq("C2", "Which highest civilian award of Bhutan was conferred on Shri Narendra Modi, Prime Minister of India?", ["Drakpoi Rinchen Tshuktor", "Ngadag Pel gi Khorlo", "Druk Wangyal", "Druk Thugsey"], 1, "Modi received the Ngadag Pel gi Khorlo (Order of the Druk Gyalpo)."),
mcq("C3", "Bhutan hosted the SAARC Summit for the first time in", ["2011", "2012", "2014", "2010"], 3, "The 16th SAARC Summit was held in Thimphu in April 2010."),
mcq("C4", "In 2022, His Majesty the Fourth Druk Gyalpo was awarded the Blue Planet Prize in recognition of his contributions towards the", ["prevention of water and air pollution", "preservation of cultural heritage", "resolution of global environmental problems", "resolution of global social harmony"], 2, "The Blue Planet Prize honours contributions to solving global environmental problems."),
mcq("C5", "The Olympic motto adopted in July 2021, 'Citius, Altius, Fortius - Communiter', means", ["Stronger, Faster, Better - Globally", "Faster, Higher, Stronger - Together", "Faster, Higher, Stronger - In Unity", "Faster, Higher, Stronger - In Harmony"], 1, "'Communiter' means together."),
mcq("C6", "BIMSTEC was established by seven South and Southeast Asian nations for", ["mutual cooperation in using the Bay of Bengal for commercial purposes", "cooperation in defence and military fields", "collaboration and mutual assistance in economic and technical fields", "mutual assistance to strengthen political stability"], 2, "BIMSTEC is the Bay of Bengal Initiative for Multi-Sectoral Technical and Economic Cooperation."),
mcq("C7", "NFTs (non-fungible tokens) basically deal in", ["not-for-profit commerce", "buying and selling digital art", "fronting of technological licences", "exchange of cryptocurrencies"], 1, "NFTs are unique digital certificates, widely used to buy and sell digital art."),
mcq("C8", "In digital technology, the metaverse refers to", ["a virtual reality simulation where people can interact with each other", "coding and gamification", "conversations over the internet using secret codes", "things that are beyond reality"], 0, "The metaverse is a shared virtual space where people interact through avatars."),
mcq("C10", "Who is considered the father of English literature?", ["Christopher Marlowe", "Geoffrey Chaucer", "Edmund Spenser", "Charles Dickens"], 1, "Geoffrey Chaucer, author of The Canterbury Tales."),
mcq("C11", "This South Asian country is made up of a group of islands to the southwest of Sri Lanka:", ["Madagascar", "Mauritius", "Maldives", "Malaysia"], 2, "The Maldives lies southwest of Sri Lanka."),
mcq("C12", "Wimbledon is associated with which sport?", ["Badminton", "Soccer", "Cricket", "Tennis"], 3, "Wimbledon is the oldest tennis tournament."),
mcq("C14", "Bhutan lost control over the Duar areas of Assam and Bengal as a result of the", ["Treaty of Sinchula, 1865", "Treaty of Punakha, 1910", "Treaty of Friendship, 1949", "Anglo-Bhutanese Treaty, 1774"], 0, "The Treaty of Sinchula after the Duar War (1865) ceded the Duars to British India."),
mcq("C15", "The people who initiated the formation of the United Nations were", ["Joseph Stalin and Franklin D. Roosevelt", "Winston Churchill and Charles de Gaulle", "Winston Churchill and Joseph Stalin", "Franklin D. Roosevelt and Winston Churchill"], 3, "Roosevelt and Churchill's Atlantic Charter (1941) laid the foundation of the UN."),
mcq("C16", "Tesla Inc. chiefly manufactures", ["aviation engines", "mobile phones", "space vehicles", "electric vehicles"], 3, "Tesla is best known for electric vehicles."),
mcq("C17", "Which one of the following is a legacy of Gyalse Tenzin Rabgye, the 4th Druk Desi?", ["Zorig chusum, the thirteen traditional arts", "The Tungam-Gelong chham", "Judicial procedure", "Tax reform"], 0, "The thirteen traditional arts (zorig chusum) were formalised during Gyalse Tenzin Rabgye's rule."),
mcq("C18", "The theme of the International Day of Happiness 2022 was", ["Share Happiness and be Part of Something Amazing", "Keep Calm, Stay Wise and Be Kind", "Happiness For All, Forever", "Share Happiness"], 1, "The 2022 theme was 'Keep Calm, Stay Wise and Be Kind'."),
mcq("C19", "Which protocol is related to the Access and Benefit Sharing (ABS) mechanism?", ["Kyoto Protocol", "Nagoya Protocol", "Geneva Protocol", "Cartagena Protocol"], 1, "The Nagoya Protocol (2010) covers access to genetic resources and benefit sharing."),
mcq("C20", "The first Bhutanese feature film, Gasa Lamai Singye, was made in", ["1988", "1989", "1990", "1991"], 1, "Gasa Lamai Singye was released in 1989."),
dict(key="D1", real=True, type=C, marks=9, topic="Dzongkha comprehension", issues=[DZ], group=D1, pos=1, stem=DZP + """

ལྟག་གི་ཡིག་རྒྱུགས་ལྷག་ཞིནམ་ལས་ དྲི་བ་ ཀ་ ཁ་ ག་ གསུམ་གྱི་ལན་བྲིས།

ཀ༽ འོག་གི་དྲི་བ་ཚུ་གི་ལན་བྲིས། (སྐུགས་ ༩)
༡ འགྲུལ་འཕྲིན་ནང་ལུ་ རིམ་ལུགས་སྣ་ཚོགས་ཡོད་ས་ལས་ མི་སྡེ་ལུ་ཕན་ཐོགས་ཤོས་ར་ ག་འདི་ཨིན་པས? གནད་དོན་གཉིས་བཀོད། (༢)
༢ འགྲུལ་འཕྲིན་མེད་པའི་སྐབས་ལུ་ མི་ཚུ་འབྲེལ་བ་ག་དེ་སྦེ་ འཐབ་སྡོད་ནུག? (༡)
༣ བརྒྱུད་འཕྲིན་དང་ འགྲུལ་འཕྲིན་གྱི་ ཁྱད་པར་ ༢ བྲིས། (༢)
༤ ཁྱོད་ཀྱིས་འབད་བ་ཅིན་ འགྲུལ་འཕྲིན་ལག་ལེན་འཐབ་ཐངས་ ལེགས་ཤོམ་འདི་ག་དེ་སྦེ་ཆ་བཞག་ནི་སྨོ? (༢)
༥ གཞན་ལུ་སྐྱོན་བརྗོད་དང་ མ་བདེན་པའི་གནས་ཚུལ་ཚུ་ སྤེལ་ནི་ཚུ་བཀག་ནིའི་ཐབས་ཤེས་ དྲག་ཤོས་གཉིས་བཀོད། (༢)""",
     key_points=[("༡ རིམ་ལུགས་ཕན་ཐོགས་ཤོས་ ༢ (ཁ་པར་ / བརྙན་འཕྲིན་ཁ་པར་གྱིས་ སྐར་ཆ་གཅིག་ནང་ བློ་སླབ་ ཡི་གུ་བསྐྱལ། ཡོངས་འབྲེལ་ ཤེས་ཡོན་ ཚོང་ ལཱ་)", 2),
                 ("༢ ཡི་གུ་ ཕར་ཚུར་ བསྐྱལ་ཏེ་ འབྲེལ་བ་འཐབ།", 1), ("༣ བརྒྱུད་འཕྲིན་ ས་གནས་གཅིག་ནང་ བཙུགས་ཡོད་ / འགྲུལ་འཕྲིན་ ག་ཏེ་འགྱོ་རུང་ འབག་བཏུབ། (ཁྱད་པར་ ༢)", 2),
                 ("༤ ལེགས་ཤོམ་ལག་ལེན་ ཐབས་ ༢ (དགོས་མཁོ་ཙམ་ ལག་ལེན། མ་བདེན་པའི་ གནས་ཚུལ་ མ་སྤེལ། ལཱ་དང་ ལམ་ཁར་ ཉེན་སྲུང་།)", 2), ("༥ ཐབས་ཤེས་ ༢ (བདེན་མེད་ ཞིབ་དཔྱད་ སྤེལ་མ་བཅུག། ཁྲིམས་དང་ ཤེས་ཚོར།)", 2)],
     model="""༡ ཁ་པར་དང་ བརྙན་འཕྲིན་ཁ་པར་ - ལ་དང་ལུང་གི་ རྒྱབ་ཁར་ཡོད་མི་དང་ཡང་ ཡུདཔ་ཐེངས་ཅིག་ལུ་ བློ་སླབ་ཚུགས། ཡི་གུ་ (འཕྲིན་དོན་) - སྐར་ཆ་གཅིག་ནང་ ས་སྒོ་ལུ་ ལྷོད། (ཡོངས་འབྲེལ་བརྒྱུད་དེ་ ཤེས་ཡོན་དང་ ཚོང་ ལཱ་ ཚུ་ཡང་ འབད་ཚུགས།)
༢ ཡི་གུ་ ཕར་ཚུར་ བསྐྱལ་ཏེ་ བསམ་ལན་ བརྗེ་སོར་འབད་སྟེ་ འབྲེལ་བ་འཐབ་ནུག།
༣ བརྒྱུད་འཕྲིན་འདི་ ས་གོ་གཅིག་ནང་ བཙུགས་ཡོད་ཅིང་ འབག་མི་བཏུབ། འགྲུལ་འཕྲིན་འདི་ ག་ཏེ་འགྱོ་རུང་ འབག་བཏུབ་སྟེ་ ཁ་པར་ཁེར་མེན་པར་ ཡོངས་འབྲེལ་ ཡི་གུ་ པར་ ལ་སོགས་པའི་ རིམ་ལུགས་ སྣ་ཚོགས་ཡོད།
༤ དགོས་མཁོ་ཡོད་པའི་སྐབས་ རྐྱངམ་ཅིག་ ལག་ལེན་འཐབ་ནི། ལཱ་ དང་ སློབ་སྦྱོང་ དང་ འཁོར་ལོ་ བཏང་བའི་སྐབས་ ལག་ལེན་མ་འཐབ་ནི། བཟའ་ཚང་དང་ བློ་སླབ་ནི་ལུ་ དུས་ཚོད་ བྱིན་ནི།
༥ གནས་ཚུལ་ ག་ཅི་ར་ སྤེལ་རུང་ མ་སྤེལ་བའི་ཧེ་མ་ བདེན་མེད་ ཞིབ་དཔྱད་འབད་ནི། མ་བདེན་པའི་ གནས་ཚུལ་ སྤེལ་མི་ལུ་ ཁྲིམས་དོན་ བཀག་ཆ་ དང་ ཤེས་ཚོར་ བྱིན་ནི།"""),
dict(key="D2", real=True, type=C, marks=3, topic="Dzongkha comprehension", issues=[DZ], group=D1, pos=2, stem="""ཁ༽ འོག་གི་མིང་ཚིག་ཚུ་གི་ རྗོད་ཚིག་བྲིས། (ཡིག་རྒྱུགས་ནང་ལས་ འདྲ་བཤུས་ཕབ་མི་ཆོག) (སྐུགས་ ༦x༠.༥= ༣)
༡) ཡར་རྒྱས།  ༢) མེད་ཐབས་མེད།  ༣) ཐ་སྡུག  ༤) འཚབ་འཚུབ།  ༥) ཡུདཔ་ཐེངས་ཅིག  ༦) སྐར་ཆ་གཅིག""",
     key_points=[("ཚིག་ ༦ ལུ་ རྗོད་ཚིག་ ཀྲིག་ཀྲི་ (ཚིག་རེ་ལུ་ ༠.༥)", 3)],
     model="""༡ ལམ་ བཟོ་ཞིནམ་ལས་ གཡུས་ཚན་འདི་ ཡར་རྒྱས་སོང་ཡི།
༢ ཞིང་ལཱ་ལུ་ ཆུ་འདི་ མེད་ཐབས་མེད་པའི་ མཁོ་ཆས་ཨིན།
༣ ཁོ་ ཕྱི་ཁར་ ཕྱིན་མི་འདི་ ཐ་སྡུག་ ཆར་པ་ ཕོག་སྟེ་ ལུས་ཡི།
༤ བུ་ ཕྱི་རུ་ ལོག་མ་འོང་པས་ ཨམ་ཚབ་འཚུབ་ འབད་དེ་ སྡོད་ཡི།
༥ ལཱ་འདི་ ཡུདཔ་ཐེངས་ཅིག་ལུ་ མཇུག་བསྡུ་ཡི།
༦ འཕྲིན་དོན་འདི་ སྐར་ཆ་གཅིག་ནང་ ལྷོད་ཡི།"""),
dict(key="D3", real=True, type=C, marks=3, topic="Dzongkha comprehension", issues=[DZ, "Synonyms: a Dzongkha teacher should confirm the expected words from the passage."], group=D1, pos=3, stem="""ག༽ འོག་གི་མིང་ཚིག་ཚུ་གི་ རྣམ་གྲངས་ ཡིག་རྒྱུགས་ནང་ལས་འཚོལ་ཏེ་བྲིས། (སྐུགས་ ༦x༠.༥= ༣)
༡) ཨ་རོགས་དགའ་རོགས།  ༢) བཀྲམ།  ༣) དྲནམ་བཏོན།  ༤) ཁྲིམས་དང་མ་མཐུནམ།  ༥) ལྷམ་པ་མ་འདྲཝ།  ༦) ནང་འཁོད།""",
     key_points=[("ཨ་རོགས་དགའ་རོགས → གཉེན་དང་གྲོགས། བཀྲམ → སྤེལ། དྲནམ་བཏོན → (བསམ་ལན་ / སེམས་ཁར་ཤར།) ཁྲིམས་དང་མ་མཐུནམ → ཁྲིམས་འགལ། ལྷམ་པ་མ་འདྲཝ → རྣམ་པ་སྣ་ཚོགས། ནང་འཁོད → ནང་ (ཡུདཔ) (ཚིག་རེ་ལུ་ ༠.༥)", 3)],
     model="ཨ་རོགས་དགའ་རོགས = གཉེན་དང་གྲོགས། བཀྲམ = སྤེལ། དྲནམ་བཏོན = བསམ་ལན་ (to confirm)། ཁྲིམས་དང་མ་མཐུནམ = ཁྲིམས་འགལ། ལྷམ་པ་མ་འདྲཝ = རྣམ་པ་སྣ་ཚོགས། ནང་འཁོད = ནང་ / ཡུདཔ་ཐེངས་ཅིག (to confirm)"),
dict(key="T1", real=True, type=T, marks=15, topic="Translation: English to Dzongkha", issues=[DZ], stem="""འོག་ལུ་ ཨིང་སྐད་ནང་ཡོད་མི་ བཀའ་ཤོག་འདི་ རྫོང་ཁའི་ཐོག་ལུ་ སྐད་སྒྱུར་འབད་དེ་བྲིས། (སྐུགས་ ༡༥)

""" + TR,
     key_points=[("གནད་དོན་ཕོག་མ་ཕོག་ - དོན་ཚན་ཆ་ཚང་ མ་ལུས་པར།", 7), ("ཞེ་ས་ (བཀའ་ཤོག་) དང་ ཨང་གྲངས་ (༧༡.༤% ། ༩༣%) ངོ་མ་བཟུམ།", 3), ("གོ་རིམ་དང་ སྡེབ་སྦྱོར་ བརྡ་སྤྲོད།", 5)],
     model="""(Outline of the key renderings; a Dzongkha teacher should check)
འབྲུག་གི་ ཤེས་རིག་ ལས་རིམ་ - དེང་སང་གི་ ཤེས་རིག་དང་ ཆོས་ཕྱོགས་ཀྱི་ ཤེས་རིག་ གཉིས་ཆ་ར་ - འདི་ གྲུབ་འབྲས་ཅན་གྱི་ ལོ་རྒྱུས་ཅིག་ཨིན། ད་ལྟོ་ ཡོངས་ཁྱབ་ ཡིག་རིག་གི་ ཚད་ བརྒྱ་ཆ་ ༧༡.༤ དང་ ན་གཞོན་གྱི་ ཡིག་རིག་ཚད་ བརྒྱ་ཆ་ ༩༣ ལས་ལྷག་ཡོད། མི་མང་ཤེས་རིག་དང་ ཡིག་རིག་ལས་བརྟེན་ གོང་འཕེལ་ལུ་ མཁོ་བའི་ འཛིན་སྐྱོང་དང་ བཟོ་རིག་ ལཱ་གཡོག་པ་ཚུ་ ཐོན་ཏེ་ ཕྱི་རྒྱལ་གྱི་ མཁས་མཆོག་ཚུ་ལུ་ བརྟེན་དགོཔ་ ཉུང་སུ་ཕྱིན་ཡི།

ལོ་བརྒྱ་ ལྷག་ཅིག་གི་ཤུལ་ལུ་ ང་བཅས་ ལོག་སྟེ་ དུས་རབས་གསརཔ་ཅིག་གི་ མཐའ་མར་ལྷོད་དེ་ཡོདཔ་ལས་ མ་འོངས་པའི་དོན་ལུ་ མཐོང་སྣང་གསརཔ་ཅིག་ དགོཔ་ཨིན། དུས་རབས་འདི་ ཚན་རིག་ ཡར་རྒྱས་དང་ འཛམ་གླིང་གཅིག་འགྱུར་ལས་བརྟེན་ མི་ཚེའི་ ཆ་ཤས་ག་ར་ནང་ འགྱུར་བ་ མགྱོགས་དྲགས་སྦེ་ འབྱུང་སའི་ དུས་རབས་ཅིག་ཨིན། ...

དམངས་གཙོའི་ ལམ་ལུགས་ བཙུགས་ཞིནམ་ལས་ ང་བཅས་ཀྱི་ དུས་ཚོད་དང་ ནུས་ཤུགས་ མང་ཤོས་ཅིག་ དམངས་གཙོའི་ ཚོགས་སྡེ་ཚུ་ གཞི་བཙུགས་ནི་ལུ་ བཏང་ཡི། ... ཤེས་རིག་འདི་ མེད་ཐབས་མེད་པའི་ གཙོ་རིམ་ཅིག་ཨིན།

ཤེས་རིག་ལྷན་ཁག་གིས་ བཅོ་བསྒྱུར་ ཚུ་ འགོ་བཙུགས་ཡོདཔ་ལུ་ བསྔགས་བརྗོད་ཡོད། ... སློབ་རིམ་ སློབ་སྟོན་ཐབས་ལམ་ སློབ་སྦྱོང་ དང་ བརྟག་དཔྱད་ཚུ་ ལོག་ཞིབ་དཔྱད་འབད་དེ་ བསྒྱུར་བཅོས་ ཡང་ན་ ལོག་བཟོ་དགོ། དེ་མེན་པ་ཅིན་ ... རྒྱལ་ཁབ་ཀྱིས་ གླ་ཆ་ ལྕི་ཏོག་ཏོ་ སྤྲོད་དགོ་པའི་ ཉེན་ཁ་ཡོད། (སྤྱི་ལོ་ ༢༠༢༠ སྤྱི་ཟླ་ ༡༢ པའི་ ཚེས་ ༡༧ ལུ་ ཤེས་རིག་ བཅོ་བསྒྱུར་གྱི་ བཀའ་ཤོག)"""),
]

# ---- Founder rule (21 Nov 2026): older-year questions follow the marks of the LATEST paper (2025: Dzongkha
# comprehension 20, translation 15). The parts below are re-marked to fit; key points are scaled to match and the
# original marks are noted in the stem.
FIT = {'D1': 12, 'D2': 4, 'D3': 4}
for _q in Q:
    if _q["key"] in FIT:
        _old, _new = _q["marks"], FIT[_q["key"]]
        _kp = [(p, round(m * _new / _old * 2) / 2) for p, m in _q["key_points"]]
        _kp[0] = (_kp[0][0], _kp[0][1] + _new - sum(m for _, m in _kp))
        _q.update(marks=_new, key_points=_kp, stem=_q["stem"] + "\n\n(Marks: %s - set to the latest RCSC layout; the 2022 paper gave %s.)" % (_new, _old))
