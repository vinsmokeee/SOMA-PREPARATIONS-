"""ME General Paper II (English Language and General Knowledge), BCSE 2020 - real questions (PDF sent by the founder,
24 Nov 2026). Same layout as the latest (2025) paper: Section A case study 4 x 10, Section B any 2 of 4 x 10, Section C any
2 of 4 x 10, Section D 20 MCQ x 1 - so no marks were changed. Joins the 2025 bank (pattern from me_general2_2025.py).
Section D left out (more than one defensible answer): Q7 (1949 Treaty - options a, b and c all partly true), Q20 ('all
children have the potential to learn' - several educators). Two new MCQs of the same kinds (N1, N2) replace them.
Answers and marking guides were written by Claude: please check before publishing.
"""
import os, runpy
_base = runpy.run_path(os.path.join(os.path.dirname(__file__), "me_general2_2025.py"))
PATTERN, RUBRIC = _base["PATTERN"], _base["RUBRIC"]
CS, TOP, SUBJ, MCQ = "analytical", "long_answer", "descriptive", "mcq"

BATCH = "ME Paper II (General): BCSE 2020, batch 2"
GROUP_TAG = "2020b2"
PAPER = "me-general-2"
SUBJECT = "english-general-knowledge"
MIN_WORDS = 150
ADDS_TO_PAPER = True
SOURCE = {"title": "BCSE 2020 Main Examination, General category, Paper II", "year": 2020, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}
G = "me-general-2-2020b2-a"

PASSAGE = """Read the article below and answer ALL FOUR questions that follow.

Neutrogena, Sun Activated Advertising (Source: Digital Marketing Industry - Case Study Library)

Neutrogena wanted to advertise its new Beach Defense Sunscreen during sunny days, but didn’t want to limit its media to weather forecast apps. By combining weather- and location-based technology, the brand automatically activated its ads based on real-time UV conditions and distance from Neutrogena retailers to create a relevant, engaging campaign that drove awareness and sales.

Real-time triggers used to only target audience at appropriate times (when sun was shining) and the Mobile campaign “followed the sun” across beauty or lifestyle content popular with target audience.

The campaign used many factors, eg. the nearby retailers and time of the day, to push dynamically created ad units and consumers were encouraged to purchase via maps and coupons that were personalized for them. The Product awareness increased from zero to 63% while purchase intent rose by 43%

In 2013, Neutrogena set out to launch its new sunscreen line, Neutrogena Beach Defense. Faced with the challenge of breaking through an already cluttered category, the brand focused on activating its mobile campaign based on the ideal weather conditions. However, conventional weather targeting required placing the brand in lackluster environments where users were typically spending mere seconds with the content.

Neutrogena described its target audience as “proactive everyday protectors,” women 25 to 54 years old, who are very aware of the damage the sun can cause but still enjoy spending time in the sun with their children. They are careful to protect themselves and their families on a regular basis to ensure that they are safe from the dangers of the sun.

Rather than running the campaign on mobile weather apps, the brand sought to deliver its Neutrogena Beach Defense ads only when the sun was shining, and decided to concentrate on ideal locations during the day when protection from the sun occupied their minds. By combining weather and location cues, the brand could adapt to real-time triggers, only targeting its audience at appropriate times.

Using weather- and location-based technology allowed Neutrogena to be strategic about its media budget. The campaign took a number of factors into account before pushing an ad unit, which was dynamically created, based on distance to a retail location, time of the day, and the surrounding areas. Neutrogena developed an advanced mobile campaign that allowed real-time UV conditions to automatically activate the Neutrogena Beach Defense ads. Essentially, Neutrogena Beach Defense ads would “follow the sun” across a rich variety of beauty or lifestyle content popular with the target audience. To further enhance the campaign’s effectiveness, the brand layered customer location data in areas of prolonged sun exposure such as parks, beaches, and pools. This allowed Neutrogena Beach Defense to have a dominant presence in key out-of-home locations when the weather was ideal.

The primary objective of the campaign was to increase purchase intent, so the brand added geo-fencing that would dynamically replace the click-through to the brand site with directions to the nearest store and a coupon offer when probable audience was near key retail locations.

The campaign was one of the first in the industry to utilize weather targeting without limiting the choices of where the brand could advertise. More importantly, it was successful in launching the new Beach Defense brand into a highly competitive category. Within the first few months of its launch, the mobile campaign exceeded expectations in awareness and intent to buy, whereby awareness of Neutrogena Beach Defense increased from zero to 63 percent and purchase intent rose by 43 percent."""


def cs(key, n, q, kp, model):
    return dict(key=key, real=True, type=CS, marks=10, topic="Case study and comprehension", group=G, pos=n,
                stem=PASSAGE + "\n\n" + q, key_points=kp, model=model)


def mcq(key, topic, stem, opts, ans, exp):
    return dict(key=key, real=True, type=MCQ, topic=topic, stem=stem, opts=opts, ans="abcd".index(ans), exp=exp)


Q = [
cs("A1", 1, """Question 1
There seems to be a great deal of marketing wisdom in the "mobile campaign" that Neutrogena conducted. What could Bhutanese businessmen learn from the case study? (10 marks)""",
   [("Know and define the target audience clearly (Neutrogena's 'proactive everyday protectors')", 2.5),
    ("Reach customers at the right time and place - context-based targeting (weather, location, time of day) instead of placing ads everywhere; use the budget strategically", 3),
    ("Use digital/ mobile tools: personalised ads, maps, coupons, geo-fencing to turn awareness into purchase", 2.5),
    ("Application to Bhutan with examples (e.g. promoting products on social media, location offers near shops, seasonal timing) and measuring results", 2)],
   """The Neutrogena campaign offers several lessons for Bhutanese business people.
1. Know your customer: Neutrogena defined a precise target group - women aged 25 to 54 who care about protecting their families from the sun. Bhutanese businesses should likewise identify exactly who buys their product and design messages for them.
2. Right message, right time, right place: instead of advertising everywhere, Neutrogena showed ads only when the sun was shining and near parks, beaches, pools and stores. A Bhutanese seller of rain gear could advertise during the monsoon, or a café could promote hot drinks on cold mornings to people nearby.
3. Use digital and mobile technology: most Bhutanese now use smartphones and social media. Targeted Facebook, Instagram or WeChat ads, location-based offers and online coupons are affordable and measurable.
4. Make buying easy: Neutrogena gave directions to the nearest store and a coupon at the moment of interest, converting awareness into sales. Local firms can add maps, phone numbers, mBoB payment and delivery options to their ads.
5. Spend wisely and measure results: the campaign was strategic about its budget and tracked outcomes (awareness 0 to 63 percent, purchase intent up 43 percent). Bhutanese businesses should set goals and measure the impact of their marketing.
These lessons show that creative, data-driven marketing can help even small Bhutanese businesses compete."""),
cs("A2", 2, """Question 2
Neutrogena described its target audience as "proactive everyday protectors..." Who were these protectors and what was the general outcome of such a ploy? (10 marks)""",
   [("Who: women aged 25 to 54, aware of sun damage, who enjoy time in the sun with their children and regularly protect themselves and their families", 4),
    ("Ploy: ads reached this group only when/where sun protection was on their minds - sunny weather, outdoor locations, near retailers, beauty/lifestyle content they read", 3),
    ("Outcome: awareness rose from zero to 63%, purchase intent rose by 43%, campaign exceeded expectations and launched the brand in a crowded category", 3)],
   """The "proactive everyday protectors" were women aged 25 to 54 years who are very aware of the damage the sun can cause but still enjoy spending time in the sun with their children. They are careful to protect themselves and their families from the sun on a regular basis.
By focusing on this group, Neutrogena delivered its Beach Defense ads only when and where sun protection would be on their minds: when the sun was shining (triggered by real-time UV conditions), in places of prolonged sun exposure such as parks, beaches and pools, alongside the beauty and lifestyle content these women read, and near stores where they could buy the product, with directions and coupons.
The outcome was very successful. Within the first few months the campaign exceeded expectations: awareness of Neutrogena Beach Defense rose from zero to 63 percent and purchase intent rose by 43 percent. It was one of the first campaigns to use weather targeting without limiting where the brand could advertise, and it successfully launched the new brand into a highly competitive sunscreen category."""),
cs("A3", 3, """Question 3
The ads that Neutrogena used to promote its new brand faced stiff competition from the already existing clutter of sunscreen brands. From the passage, cite TWO methods Neutrogena used to overcome the competition and mention two visible outcomes of resorting to such subtle methods. (10 marks)""",
   [("Method 1: real-time weather (UV) triggers - ads activated only when the sun was shining and 'followed the sun' across beauty/lifestyle content (not limited to weather apps)", 3),
    ("Method 2: location targeting and geo-fencing - presence in parks, beaches, pools; near stores the click-through became directions to the nearest store plus a personalised coupon", 3),
    ("Outcomes: awareness increased from zero to 63%; purchase intent rose by 43% (also: exceeded expectations, successful launch in a crowded category)", 4)],
   """Two methods Neutrogena used to overcome the clutter of competing sunscreen brands:
1. Weather-triggered advertising: real-time UV conditions automatically activated the Beach Defense ads, so they appeared only when the sun was shining. Instead of being limited to weather apps, the ads "followed the sun" across the beauty and lifestyle content popular with the target audience, where people spent more time.
2. Location targeting and geo-fencing: Neutrogena layered customer location data for places of prolonged sun exposure such as parks, beaches and pools, giving it a dominant presence there. When likely buyers were near key retail locations, geo-fencing replaced the click-through to the brand site with directions to the nearest store and a personalised coupon offer.
Two visible outcomes:
1. Awareness of Neutrogena Beach Defense increased from zero to 63 percent within the first few months.
2. Purchase intent rose by 43 percent - the campaign exceeded expectations and successfully launched the new brand into a highly competitive category."""),
cs("A4", 4, """Question 4
Take any new Bhutanese product and outline a digital ad campaign to raise the purchase intent and the awareness percentage of the new product, similar to what Neutrogena did according to the information in the passage. (10 marks)""",
   [("Names a specific new Bhutanese product and defines a clear target audience", 2),
    ("Context/ real-time triggers (season, weather, time of day, events) and location targeting/ geo-fencing near shops", 3),
    ("Channels and content: social media, mobile ads, influencers, personalised offers, coupons, maps, easy online payment", 3),
    ("Objectives and measurement: awareness and purchase intent targets, tracking; feasible budget", 2)],
   """Product: a new locally made herbal lip balm and skin cream from Bhutanese medicinal plants, for dry winter skin.
Target audience: urban women and men aged 18 to 45 in Thimphu, Paro and Phuentsholing who care about skin health and natural products, and tourists looking for authentic Bhutanese products.
Campaign plan:
1. Weather triggers: link the ads to weather data so they run when temperatures drop and the air is dry and windy (November to February), on mornings when people feel their skin cracking.
2. Location targeting: use geo-fencing around shopping areas, pharmacies, hotels and the airport; when users are near a stockist, show directions and a 10 percent discount code.
3. Content where the audience already spends time: short videos and stories on Facebook, Instagram and TikTok, Kuensel online and lifestyle pages; partner with popular Bhutanese influencers; highlight natural Bhutanese ingredients and 'Made in Bhutan'.
4. Make buying easy: link ads to an online shop with mBoB/ BNB payment and home delivery.
Objectives and measurement: raise awareness from zero to 50 percent of the target group in three months and increase purchase intent by 30 percent, tracked through surveys, coupon redemptions, clicks and sales data.
Like Neutrogena, the campaign would reach the right people at the right moment and turn awareness into purchases."""),
dict(key="B1", real=True, type=TOP, marks=10, topic="Topical issues: elections and politics", stem="""In the recent Bumthang bye-election for National Assembly member, a member of the ruling party won and some of the reasons cited for this outcome are that the ruling party will be in a better position to fulfil the election promises and developmental activities will be carried out at a faster pace.
How true is this? (10 marks)""",
 key_points=[("Arguments supporting the view: ruling party controls government and budget, can prioritise projects and pledges in the constituency, easier coordination", 3),
             ("Arguments against: development in Bhutan follows Five-Year Plans, local government (dzongkhag, gewog) and resource allocation formulas, not party affiliation; all MPs represent constituents; Constitution/ Election Act prohibit using public resources for party gain; opposition MPs also deliver", 4),
             ("Other reasons for voting, risks of such thinking (partisanship, divisions in villages), balanced conclusion", 3)],
 model="""The claim is partly true in practice but should not be true in principle.
Why voters believe it: the ruling party forms the government, controls the executive and the budget, and can more easily push for projects in a constituency represented by its own member. A ruling-party MP may have closer access to ministers, and voters may hope that their pledges - roads, water supply, farm roads - will be delivered faster.
Why it is not entirely true: development in Bhutan is planned through the Five-Year Plans and implemented through dzongkhag and gewog local governments, with funds shared by a resource allocation formula based on population, area and poverty, not on which party won. Every MP, whether from the ruling or opposition party, represents all the people of the constituency. The Constitution and the Election Act require that public resources are not used to favour any party, and the opposition also plays a vital role in checks and balances. Many opposition MPs have successfully raised their constituents' issues.
Voters may also have chosen the candidate for personal qualities, experience and local connections.
Conclusion: believing that only a ruling-party member can bring development encourages partisanship and divisions in villages. Development should depend on fair national planning and good local governance, and voters should choose the most capable candidate."""),
dict(key="B2", real=True, type=TOP, marks=10, topic="Topical issues: TVET", stem="""Mr. Raja Krishnamoorthi, an American businessman and politician, once said: "A high school diploma will no longer be sufficient. But that post-secondary education does not have to be a four-year university or a four-year college. It can be career technical education, vocational education, community college".
In the light of Mr. Krishnamoorthi's suggestion, critically evaluate the technical and vocational education and training systems in Bhutan. (10 marks)""",
 key_points=[("Strengths: Technical Training Institutes and Institutes of Zorig Chusum, programmes under MoLHR (now MoICE/ MoESD), skills for construction, automobile, electrical, hospitality, traditional arts; job-ready skills reduce dependence on foreign workers", 3),
             ("Weaknesses: low social status of TVET ('second choice'), limited capacity and courses, outdated equipment/ curriculum, weak industry links, low wages and private sector jobs, dependence on foreign labour", 4),
             ("Suggestions: TVET reform, better pay and recognition, industry partnerships/ apprenticeships, pathways to higher education, career guidance; evaluation in light of the quote", 3)],
 model="""Mr. Krishnamoorthi's point is that young people need education after school, but it need not be a university degree - technical and vocational training can be just as valuable. Bhutan's experience supports this.
Strengths of Bhutan's TVET system: Bhutan has Technical Training Institutes (in Chumey, Khuruthang, Rangjung, Samthang and others) and Institutes of Zorig Chusum that teach construction, electrical, plumbing, automobile mechanics, furniture making, hospitality and the thirteen traditional arts. These produce job-ready skills, help reduce dependence on foreign workers in construction, and keep traditional crafts alive. Short-term skills programmes help school leavers and the unemployed.
Weaknesses: TVET is often seen as a 'second choice' for students who did not qualify for college, and society values white-collar government jobs more. Capacity is limited, some equipment and curricula are outdated, and links with industry are weak, so graduates may lack practical, up-to-date skills. Many private sector jobs offer low pay and poor working conditions, so trained youth still prefer to look for office jobs, and construction continues to rely on foreign labour.
Way forward: the recent TVET reforms should be strengthened - raise its status through better pay and certification, build apprenticeships with industry, update courses (ICT, renewable energy), provide pathways to diplomas and degrees, and give career guidance in schools.
With these changes TVET can become a respected first choice, as Mr. Krishnamoorthi suggests, and help solve youth unemployment."""),
dict(key="B3", real=True, type=TOP, marks=10, topic="Topical issues: civil service", stem="""There was a lot of debate about the issue of increasing the retirement age of civil servants in the recent National Assembly. However, many members felt that this would only aggravate the unemployment problems related to young civil service aspirants.
What according to you are some of the pertinent issues of increasing the retirement age of civil servants to 60 years? (10 marks)""",
 key_points=[("Arguments for: rising life expectancy, retaining experienced and skilled officers, savings on recruitment/ training, pension sustainability, longer contribution to the nation", 3),
             ("Issues/ against: fewer vacancies and slower intake of graduates - aggravates youth unemployment; slower promotions and stagnation; fresh ideas and technology skills; productivity of older staff; cost to government", 4),
             ("Balanced view and suggestions: phased/ category-based increase, performance-based extension, expanding private sector jobs, conclusion", 3)],
 model="""Raising the retirement age of civil servants to 60 has both benefits and serious concerns.
Benefits: life expectancy in Bhutan has risen, and many civil servants are healthy and productive in their late fifties. Keeping experienced officers retains institutional knowledge and skills, especially in specialised fields such as medicine, engineering and teaching where replacements are scarce. It saves recruitment and training costs, helps the sustainability of the pension fund through longer contributions, and gives individuals more years of income.
Issues and concerns:
• Fewer vacancies: if fewer people retire, fewer posts open each year for young graduates, worsening unemployment among educated youth who see the civil service as their main choice.
• Slower promotions and career stagnation for mid-level officers, which can lower morale.
• Organisations may miss fresh ideas, energy and digital skills that new recruits bring.
• Productivity and health of some older officers, and higher salary costs at the top of the scale.
Suggestions: raise the age in phases, or only for categories where skills are scarce; link extension to performance and health; and at the same time expand jobs in the private sector so that youth are not dependent on civil service vacancies.
A balanced approach can retain experience without closing the door on the next generation."""),
dict(key="B4", real=True, type=TOP, marks=10, topic="Topical issues: youth in agriculture", stem="""Today Bhutanese youth are suddenly going back to their villages and farmlands.
Discuss how this move is going to aid the country's economy and what are some of the challenges these young educated farmers might face. (10 marks)""",
 key_points=[("Benefits to economy: food self-sufficiency and less import of vegetables/ rice/ meat, saves foreign currency (rupee), reduces fallow land and rural-urban migration (gungtong), rural jobs and incomes, agri-business and value addition, commercial farming", 4),
             ("Challenges: human-wildlife conflict, small and scattered landholding, difficult terrain, irrigation and climate, lack of capital/ credit, markets and price fluctuations, transport, labour shortage, lack of experience/ technology, social status", 4),
             ("Support needed and conclusion (loans, cooperatives, extension services, market linkages, insurance)", 2)],
 model="""Especially since the COVID-19 pandemic, many educated young Bhutanese have returned to their villages to farm, often with government support.
How this aids the economy:
• Food self-sufficiency: Bhutan imports much of its rice, vegetables and meat. More young farmers can raise production, reduce imports and save scarce Indian rupee reserves.
• Use of fallow land and revival of villages: much farmland lies fallow because of rural-urban migration; youth returning can reverse 'gungtong' and keep rural communities alive.
• Jobs and incomes: farming and agri-business create self-employment, reducing youth unemployment and pressure on towns.
• Modern ideas: educated youth bring new technology, commercial farming, greenhouses, processing and marketing skills, adding value to products for local and export markets.
Challenges they may face:
• Human-wildlife conflict - wild boars, monkeys and deer destroy crops.
• Small, scattered and steep landholdings, lack of irrigation and unpredictable weather.
• Limited capital and credit, high input costs, and lack of farm machinery.
• Difficulty in reaching markets, poor transport and price fluctuations; competition from cheap imports.
• Labour shortage in villages, lack of practical farming experience, and the social view that farming is not a respectable job for educated people.
Support from the government and financial institutions - affordable loans, extension services, irrigation, electric fencing, cooperatives, market linkages and crop insurance - will decide whether this movement succeeds and makes farming a dignified, profitable career."""),
dict(key="C1", real=True, type=SUBJ, marks=10, topic="Subjective: gender-based violence", stem="""Violence against women and children in Bhutan has increased during the Covid-19 pandemic.
Does this mean that men in Bhutan and in general are not able to cope with the pressures of daily life in a pandemic? (10 marks)""",
 key_points=[("Acknowledges the rise and pandemic stressors: lockdowns, confinement, job and income loss, financial stress, alcohol, uncertainty, reduced access to help", 3),
             ("Argues it is not simply men's inability to cope: violence is a choice rooted in gender inequality, power and control, patriarchal attitudes, alcohol abuse; most men coped without violence; stress is not an excuse", 4),
             ("Responses: helplines (RENEW, NCWC 1098), shelters, counselling, law enforcement (Domestic Violence Prevention Act 2013), awareness, men as allies; conclusion", 3)],
 model="""Reports from RENEW, the NCWC and the police showed an increase in violence against women and children during the COVID-19 lockdowns. However, this does not simply mean that men cannot cope with pressure.
Why violence increased: lockdowns confined families at home for long periods; many people lost jobs or income, creating financial stress; uncertainty and fear added mental strain; alcohol consumption at home increased; and victims were cut off from friends, workplaces and support services, making it harder to seek help.
Why it is not just about coping: most men faced the same pressures without becoming violent. Stress may trigger violence, but violence is a choice rooted in unequal power between men and women, patriarchal attitudes, the belief that men may control their wives and children, and alcohol abuse. Women also faced great stress - often more, with extra care work - yet did not respond with violence in the same way. Treating stress as an excuse shifts blame away from perpetrators.
What is needed: enforcement of the Domestic Violence Prevention Act 2013, helplines and safe shelters, counselling and mental health support for families, programmes for alcohol control, and awareness campaigns that involve men as allies in promoting respectful, equal relationships.
So the pandemic exposed and intensified existing problems of gender inequality; it did not prove that men cannot cope."""),
dict(key="C2", real=True, type=SUBJ, marks=10, topic="Subjective: justice for victims", stem="""The great hue and cry over the minor raped and murdered in Paro and the loss of a young girl's life in Thimphu in 2019 has now fizzled out.
Do you think that the law of the nation has to ensure that proper justice is provided to the families of the youngsters? (10 marks)""",
 key_points=[("Position: yes - the State has a duty under the Constitution and laws to deliver justice; public outrage fades but justice must not", 2),
             ("What proper justice means: thorough investigation, timely and fair trial, appropriate punishment under the Penal Code, protection and support for victims' families, compensation/ counselling", 4),
             ("Gaps and suggestions: delays, evidence collection/ forensics, child-friendly procedures, follow-up and transparency, prevention (child protection, awareness); conclusion", 4)],
 model="""Yes. Public anger over such tragic cases often fades within weeks, but the families' grief and need for justice do not. The law of the nation must ensure that proper justice is delivered, regardless of public attention.
Why the law must act: the Constitution guarantees the right to life, liberty and security, and equal protection of the law. Child rape and murder are among the gravest crimes under the Penal Code of Bhutan, and the Child Care and Protection Act places a special duty on the State to protect children.
What proper justice means: a thorough and professional police investigation with modern forensic evidence; a fair but timely trial without unnecessary delays; punishment proportionate to the crime to deter others; and support for the families - counselling, legal aid, information on the progress of the case, and compensation where possible.
Gaps to address: delays in investigation and trial, limited forensic capacity, lack of child-friendly procedures, and families not being kept informed. Media and the public often move on before cases conclude.
Prevention is also justice: stronger child protection systems, awareness in schools and communities, safe spaces and quick reporting.
In conclusion, justice should not depend on how loudly the public protests; the legal system must deliver it consistently to every victim and family."""),
dict(key="C3", real=True, type=SUBJ, marks=10, topic="Subjective: employment benefits", stem="""For those employed in the private sectors, be it educational institutes or other types of business entities, one annoying issue is the granting of benefits at the end of a term of employment.
Why do you think this issue arises only in the private sectors? (10 marks)""",
 key_points=[("Civil service benefits are set by law/ rules (BCSR, pension under NPPF, gratuity, leave encashment) and funded by government - predictable", 3),
             ("Private sector causes: many small firms with weak finances, no written contracts or HR policies, employers avoid gratuity/ PF contributions, weak enforcement of the Labour and Employment Act 2007 and regulations, workers unaware of rights, fear of losing jobs, high turnover, informal employment", 5),
             ("Suggestions: written contracts, mandatory PF/ gratuity, labour inspections and grievance redress, awareness; conclusion", 2)],
 model="""End-of-service benefits such as provident fund, gratuity and leave encashment are a common source of dispute in the private sector, but rarely in the civil service. The reasons are:
1. Clear rules and secure funding in the public sector: civil servants' benefits are laid down in the Bhutan Civil Service Rules and pension and provident fund schemes managed by the NPPF, and are paid from the government budget. They are predictable and protected.
2. Weak finances of private firms: many private schools and businesses are small, with uncertain income; when a business struggles or closes, employers delay or avoid paying benefits.
3. No written contracts or HR policies: many workers are hired informally without clear contracts, so benefits are not defined and disputes arise at the end of service.
4. Weak compliance and enforcement: although the Labour and Employment Act 2007 and its regulations require benefits such as provident fund and gratuity, some employers do not contribute regularly, and inspection and follow-up by the labour authorities are limited.
5. Workers' weak bargaining power: employees may not know their rights or fear losing their jobs if they complain; there are few unions.
To solve this: make written contracts and provident fund contributions mandatory and monitored, strengthen labour inspections and grievance redress, and raise awareness of workers' rights. Fair benefits would also make private sector jobs more attractive to youth."""),
dict(key="C4", real=True, type=SUBJ, marks=10, topic="Subjective: marriage and family", stem="""The sanctity of the Institution of Marriage is abused now than ever before. Marriage and divorce have become so synonymous, increasingly so today.
What are your observations and understanding of such a socially vital institution in Bhutan at present? (10 marks)""",
 key_points=[("Importance of marriage as a social institution (family, children's upbringing, values, social stability)", 2),
             ("Observations/ causes of rising divorce: hasty or early marriages, extramarital affairs, alcohol, domestic violence, financial stress, migration/ long separation, changing values and individualism, social media, women's economic independence, easier legal process", 4),
             ("Effects (children, single parents, poverty) and suggestions: pre-marital counselling, registration, family values, counselling and mediation services, law (Marriage Act), balanced conclusion", 4)],
 model="""Marriage remains a vital institution in Bhutan: it forms the family, the first school of values, provides care and security for children and the elderly, and holds communities together.
My observations: divorce has become much more common, especially in towns. Some reasons are:
• Hasty and early marriages without maturity or knowledge of each other.
• Extramarital affairs, alcohol abuse and domestic violence.
• Financial stress, unemployment and long separations when one spouse works in another place or abroad.
• Changing values: greater individualism, influence of social media and foreign media, and less family involvement in resolving conflicts.
• Women's greater education and economic independence - a positive change that allows women to leave abusive or unhappy marriages instead of suffering in silence.
Effects: children of broken families may suffer emotionally, educationally and economically; single parents face financial hardship, and child support is sometimes not paid.
Way forward: pre-marital counselling and family life education, encouraging proper marriage registration under the Marriage Act, accessible counselling and mediation services, enforcement of child support, and promoting values of respect, tha damtshig and shared responsibility.
Rising divorce does not mean marriage has lost its value; it shows the need to strengthen it with better preparation and support."""),
mcq("D1", "General knowledge: world", "The International Day of Happiness is celebrated on 20 March all over the world. The General Assembly of the United Nations proclaimed 20 March the International Day of Happiness in:", ["2012", "2013", "2014", "2015"], "a", "UN General Assembly resolution 66/281, adopted on 12 July 2012 at Bhutan's initiative, proclaimed 20 March the International Day of Happiness."),
mcq("D2", "General knowledge: Bhutan", "In 2020, Her Majesty the Gyalyum Sangay Choden Wangchuck received the individual laureate of the:", ["United Nations Educational, Scientific and Cultural Organization Award", "International Committee of the Red Cross Award", "World Health Organization Award", "UN Population Award"], "d", "Her Majesty Gyalyum Sangay Choden Wangchuck was the 2020 UN Population Award individual laureate, for work on reproductive health and women's empowerment."),
mcq("D3", "General knowledge: world", "The presidency of the UN Security Council rotates among the council members:", ["every year", "every month", "every 6 months", "every 3 months"], "b", "The presidency rotates monthly in English alphabetical order of member states."),
mcq("D4", "General knowledge: books", "Marieke Lucas Rijneveld was awarded the International Booker Prize 2020 for which novel?", ["Real Life", "The Side Road", "Such a Fun Age", "The Discomfort of Evening"], "d", "Rijneveld won the 2020 International Booker Prize for 'The Discomfort of Evening'."),
mcq("D5", "General knowledge: science", "Which vitamin is the only one that you will NOT find in an egg?", ["Vitamin D", "Vitamin A", "Vitamin C", "Vitamin B"], "c", "Eggs contain vitamins A, D, E and B vitamins but no vitamin C."),
mcq("D6", "General knowledge: world", "In 2020, the country that discovered a large natural gas reserve off its Black Sea coast is:", ["Iran", "Russia", "Turkey", "Azerbaijan"], "c", "Turkey announced the Sakarya gas field in the Black Sea in August 2020."),
mcq("D8", "General knowledge: world", "Which countries still have the shilling as their currency?", ["Kenya, Uganda, Tanzania and Somalia", "Tanzania, Ethiopia, Egypt and Morocco", "Kenya, Ethiopia, Tanzania and Egypt", "Somalia, Ethiopia, Uganda and Egypt"], "a", "Kenya, Uganda, Tanzania and Somalia use shillings; Ethiopia uses the birr, Egypt the pound and Morocco the dirham."),
mcq("D9", "General knowledge: world", "Which one of the following countries is NOT a member of the Commonwealth?", ["Malaysia", "Thailand", "Singapore", "Brunei Darussalam"], "b", "Thailand was never a British colony and is not in the Commonwealth."),
mcq("D10", "General knowledge: world", "The Nobel Peace Prize 2020 was awarded to the:", ["World Food Programme", "Food and Agriculture Organization", "Doctors Without Borders", "International Committee of the Red Cross"], "a", "The UN World Food Programme won the 2020 Nobel Peace Prize for its efforts to combat hunger."),
mcq("D11", "General knowledge: Bhutan", "The first national newspaper, Kuensel, was started by the government in the year:", ["1970", "1967", "1980", "1973"], "b", "Kuensel began in 1967 as a government bulletin; it became a weekly newspaper in 1986."),
mcq("D12", "General knowledge: science", "What now-ubiquitous device was invented by Zenith engineer Eugene Polley in 1955?", ["VCR", "Calculator", "Microwave oven", "Remote control"], "d", "Eugene Polley invented the Flash-Matic, the first wireless TV remote control, in 1955."),
mcq("D13", "General knowledge: world", "Greta Thunberg is a young environmental activist known for challenging world leaders to act on climate change. Where is she from?", ["Finland", "Sweden", "Norway", "Denmark"], "b", "Greta Thunberg is Swedish; she began her school strike for climate in Stockholm in 2018."),
mcq("D14", "General knowledge: sports", "The Olympic flame symbolises:", ["speed, perfection and strength", "unity among various nations of the world", "continuity between the ancient and modern Games", "sports as a means for securing harmony among nations"], "c", "The flame is lit at Olympia in Greece, linking the modern Games with the ancient Olympic Games."),
mcq("D15", "General knowledge: geography", "Prague is the capital city of:", ["Czech Republic", "Algeria", "Azerbaijan", "Croatia"], "a", "Prague is the capital of the Czech Republic (Czechia)."),
mcq("D16", "General knowledge: Bhutan geography", "What is the name of the highest mountain in the world that has not been climbed, located in Bhutan?", ["Kula Kangri", "Jhomo Lhari", "Gangkar Puensum", "The Black Mountain Range"], "c", "Gangkar Puensum (7,570 m) is the highest unclimbed mountain in the world; mountaineering above 6,000 m is banned in Bhutan."),
mcq("D17", "General knowledge: health", "Which country confirmed the first case of COVID-19 outside China?", ["Thailand", "Japan", "USA", "Brazil"], "a", "Thailand confirmed the first case outside China on 13 January 2020."),
mcq("D18", "General knowledge: books", "Who is the author of the book 'Fire and Fury: Inside the Trump White House'?", ["David Frum", "Ronald Kessler", "Michael Wolff", "Michael D'Antonio"], "c", "Michael Wolff wrote 'Fire and Fury' (2018)."),
mcq("D19", "General knowledge: Bhutan judiciary", "The National Judicial Commission of Bhutan comprises the following EXCEPT:", ["The Chief Justice of Bhutan as Chairperson", "The Chief Justice of the High Court", "The Chairperson of the Legislative Committee of the National Assembly", "The Attorney General"], "b", "Article 21(16): the Commission is the Chief Justice of Bhutan (chair), the senior-most Drangpon of the Supreme Court, the Chairperson of the Legislative Committee of the National Assembly and the Attorney General."),
# ---- new questions of the same kinds, replacing the real MCQs left out (written by Claude; check before publishing)
dict(key="N1", new=True, type=MCQ, topic="General knowledge: Bhutan history", stem="The Indo-Bhutan Treaty of Friendship signed in 1949 was later revised and replaced by a new treaty in:",
     opts=["1972", "1990", "2007", "2014"], ans=2, exp="India and Bhutan signed the revised Treaty of Friendship in February 2007."),
dict(key="N2", new=True, type=MCQ, topic="General knowledge: education", stem="Which educator founded the kindergarten system?",
     opts=["Maria Montessori", "Friedrich Froebel", "John Dewey", "Jean Piaget"], ans=1, exp="Friedrich Froebel opened the first kindergarten in Germany in 1837."),
]
