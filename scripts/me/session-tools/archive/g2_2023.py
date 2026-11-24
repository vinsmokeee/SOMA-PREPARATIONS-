"""ME General Paper II (English Language and General Knowledge), BCSE 2023 - real questions only (PDF sent by the
founder, 21 Nov 2026). Joins the 2025 bank (pattern from me_general2_2025.py).
Section D left out (answer not certain): Q7 (Five Nations Championship sport), Q9 (Treldha Tshechu date),
Q11 (DHI-owned companies).
Answers and marking guides were written by Claude: please check before publishing.
"""
import os, runpy
_base = runpy.run_path(os.path.join(os.path.dirname(__file__), "me_general2_2025.py"))
PATTERN, RUBRIC = _base["PATTERN"], _base["RUBRIC"]
CS, TOP, SUBJ, MCQ = "analytical", "long_answer", "descriptive", "mcq"

BATCH = "ME Paper II (General): BCSE 2023, batch 2"
GROUP_TAG = "2023b2"
PAPER = "me-general-2"
SUBJECT = "english-general-knowledge"
MIN_WORDS = 150
ADDS_TO_PAPER = True
SOURCE = {"title": "BCSE 2023 Main Examination, General category, Paper II", "year": 2023, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}
G = "me-general-2-2023b2-a"

PASSAGE = """Read the article below and answer ALL FOUR questions that follow.

@@PASSAGE@@"""


def cs(key, n, q, kp, model):
    return dict(key=key, real=True, type=CS, marks=10, topic="Case study and comprehension", group=G, pos=n,
                stem=PASSAGE + "\n\n" + q, key_points=kp, model=model)


def mcq(key, topic, stem, opts, ans, exp):
    return dict(key=key, real=True, type=MCQ, topic=topic, stem=stem, opts=opts, ans="abcd".index(ans), exp=exp)


Q = [
cs("A1", 1, """Question 1
Explain the significance of the statement "The work civil servants do is not charity," and discuss the implication of this perspective on the mindset and approach of civil servants towards their duties and responsibilities. (10 marks)""",
   [("Significance: civil servants are paid with public money to serve; service is a duty/ obligation, not a favour or personal kindness; citizens are entitled to services", 4),
    ("Implications for mindset and approach: accountability, professionalism, punctuality, courtesy, no favouritism/ 'knowing someone', no expectation of gifts, efficiency, citizen-centred service; and going beyond - intrinsic motivation, servant-leader, service with dedication", 6)],
   """The statement means that civil servants are paid, from public money, to do the work they are entrusted with - formulating policies, delivering services, building infrastructure. When a civil servant issues a licence, treats a patient or teaches a class, he or she is not doing the citizen a favour; the citizen is entitled to that service, and the civil servant is obliged to provide it. Treating duty as charity leads to arrogance, delays, favouritism and the expectation of gifts or personal connections.
Implications for mindset and approach:
1. Accountability: civil servants must account for their time, resources and results to the public that pays them.
2. Professionalism and courtesy: every citizen should be served promptly, politely and equally, without needing to 'know someone' in the office.
3. Integrity: no favouritism, bribes or expectation of rewards for doing one's job.
4. Efficiency and citizen focus: reducing red tape and waiting times, because the public's time is valuable.
5. Going beyond the pay: the passage adds that true public service transcends money - civil servants should be intrinsically motivated by the impact of their work on citizens' wellbeing, like a doctor driven by the lives he saves. This leads to the servant-leader mindset: serving first, with the loyalty of a servant and the competence of a leader."""),
cs("A2", 2, """Question 2
As an aspiring future civil servant, assess your readiness in adopting a growth mindset. Explore two distinct personal attributes that exemplify your possession of a growth mindset. (10 marks)""",
   [("Understands growth mindset (Dweck): abilities developed through effort, failure as springboard, humility and openness to learn - vs fixed mindset", 2),
    ("Honest self-assessment of readiness with examples (strengths and areas to improve)", 3),
    ("Two distinct personal attributes each illustrated with a concrete example (e.g. learning from failure/ resilience, curiosity and continuous learning, seeking and using feedback, humility, embracing challenges, persistence)", 5)],
   """A growth mindset, as Carol Dweck explains, is the belief that our abilities can be developed through dedication and hard work, and that failure is a springboard for growth rather than proof that we are not capable. The passage adds that it requires humility - admitting we do not know everything - and openness to learn.
Assessment of my readiness: I believe I am largely ready. I enjoy learning new things and do not see my abilities as fixed. However, I know I sometimes feel discouraged by setbacks and need to keep working on accepting criticism calmly; I am aware of this and actively work on it.
Two attributes that show my growth mindset:
1. Learning from failure (resilience): when I did not clear an examination or performed poorly in a project, I analysed what went wrong, changed my study methods, asked teachers for help and tried again - and improved. I treat mistakes as lessons, not as defeat.
2. Curiosity and continuous learning: I regularly teach myself new skills - for example computer applications, data tools or a new language - through online courses and practice, and I seek feedback from others to improve. In the civil service I would apply this by volunteering for new tasks, learning from colleagues, and adapting to new systems and reforms.
With humility and effort, I would aim not to be content with how good I am, but focus on how good I want to be."""),
cs("A3", 3, """Question 3
Suggest actionable strategies aimed at facilitating the integration of the four identified mindsets within the Bhutanese civil service. (10 marks)""",
   [("Servant-leader: values-based recruitment and induction, leadership training, recognising service excellence, citizen feedback", 2.5),
    ("Entrepreneurial: cut red tape/ simplify rules, innovation funds and pilots, tolerate calculated risks, partnerships with private sector, data-driven decisions, performance targets on outcomes", 2.5),
    ("Growth: merit-based performance management and promotion, continuous learning (RIGSS, online courses), mentoring, rewarding learning, differentiating performers", 2.5),
    ("Problem-solving: cross-agency teams, design thinking/ innovation labs, empowering staff to decide, solution-focused meetings, learning from failures", 2.5)],
   """Strategies to build the four mindsets:
1. Servant-leader mindset: recruit and induct civil servants on values of service (not only examinations); provide leadership and ethics training; leaders should model service; reward staff for excellent public service and use citizen feedback and service charters to hold offices accountable.
2. Entrepreneurial mindset: review and remove excessive regulations and red tape; set up innovation funds and pilot projects; allow calculated risk-taking without fear of punishment for honest failure; partner with the private sector; train civil servants in economics, business acumen and data use; and set targets based on outcomes such as revenue generated and time saved for businesses.
3. Growth mindset: introduce merit-based performance management that differentiates and rewards high performers (as the passage notes job security without differentiation inhibits growth); provide continuous learning through RIGSS, online courses, study and exchange programmes; use mentoring and coaching; and make learning part of every civil servant's performance plan.
4. Problem-solving mindset: create cross-agency teams and innovation labs to tackle national problems such as unemployment and food security; use design thinking; empower officers at all levels to make decisions; hold solution-focused meetings; and share lessons from both successes and failures."""),
cs("A4", 4, """Question 4
In your role as a service provider, which among the four mindsets discussed in the passage do you consider the most pivotal? Justify. (10 marks)""",
   [("Clear choice of one mindset", 2), ("Justification with at least three well-developed reasons linked to service delivery and the passage", 6), ("Shows how it supports/ connects with the other mindsets; Bhutanese context", 2)],
   """In my role as a service provider, I consider the servant-leader mindset the most pivotal.
Justification:
1. It is the foundation of public service: the passage says we must first "discover the servant in the civil servant". Service providers deal with citizens every day; if they see their work as a duty to serve, they will be courteous, prompt and fair, and will not make people feel they are receiving a favour.
2. It ensures equal service for all: a servant-leader serves everyone without favouritism or the need to 'know someone' in the office, which is one of the biggest public complaints.
3. It brings intrinsic motivation: like a doctor driven by lives saved or a teacher by students' futures, a servant-leader works sincerely even without supervision or extra pay, which improves the quality of service.
4. It leads to the other mindsets: someone truly committed to serving will want to learn and grow, find solutions to citizens' problems, and remove red tape that frustrates businesses - so growth, problem-solving and entrepreneurial mindsets follow naturally.
In the Bhutanese context of GNH and His Majesty's vision of a dynamic civil service, the servant-leader mindset keeps the citizen at the centre of everything we do."""),
dict(key="B1", real=True, type=TOP, marks=10, topic="Topical issues: governance and service delivery", stem=""""One of the biggest complaints of ordinary people in Bhutan over the years has been that you cannot get your work done if you do not know someone in that office. This simple line says much more than a voluminous consultant's report on the problems of governance and service delivery." - The Bhutanese, August 2023
What are your personal observations and views on the service delivery standards of offices? Elaborate how services can best be delivered equally to all citizens. (10 marks)""",
 key_points=[("Observations: favouritism/ 'connections' culture, delays and red tape, rude or absent staff, unclear procedures, repeated visits, rural people disadvantaged; also improvements (G2C online services, service standards)", 4),
             ("Ways to deliver equally: online/ digital services and NDI, clear service standards and timelines, first-come-first-served queues/ tokens, transparency of procedures and fees, grievance redressal and feedback, accountability and penalties for favouritism, training in ethics and customer service, decentralised/ one-stop service centres", 6)],
 model="""Observations: many citizens feel that knowing someone in an office makes work faster - files move quickly for relatives and friends while others are told to come back another day. Common problems include unclear procedures, too many documents, long waiting times, officials being unavailable, and rural and elderly people who lack connections or digital skills being left behind. At the same time, there have been improvements: many services are now online (G2C, eServices, NDI), service standards with fixed timelines have been introduced, and civil service reforms stress performance and accountability.
How to deliver services equally to all:
1. Digitalise services through online portals and the National Digital Identity, so applications are processed in order without personal contact.
2. Publish clear service standards - required documents, fees and timelines - at every office and online.
3. Use queue and token systems (first come, first served) and track files so no one can jump the queue.
4. Set up effective grievance redressal and citizen feedback, and act on complaints.
5. Hold officials accountable: monitor performance, and penalise favouritism and corruption (with the ACC's support).
6. Train civil servants in ethics, customer service and the servant-leader mindset.
7. Bring services closer to people through one-stop community centres and mobile services for rural, elderly and disabled citizens.
Equal service is a basic right and essential for trust in government."""),
dict(key="B2", real=True, type=TOP, marks=10, topic="Topical issues: judiciary and rule of law", stem="""The Supreme Court of Bhutan suspended two justices for what the highest appellate court deemed a deliberate miscarriage of justice. Within hours of the decision - which went viral on social media - many pointed out several cases that should be re-opened, hoping decisions could be reversed or to determine whether miscarriages happened. - Kuensel, August 2023
Express your views on the damage caused by the miscarriage of justice, and elaborate measures on how public confidence in the judicial system can be regained after this event. (10 marks)""",
 key_points=[("Damage: injustice to victims/ wrongly affected parties, loss of public trust and confidence in judiciary and rule of law, doubts on other cases, perception of corruption, harm to democracy and investment, people may take law into own hands", 4),
             ("Positive view of the Court acting against its own members - accountability", 1),
             ("Measures: transparent investigation and disciplinary action, review mechanism for disputed cases, judicial code of conduct and ethics training, independent oversight/ audits, publishing judgments and reasons, case management and random case allocation, legal aid and awareness, merit-based appointments, communication with public", 5)],
 model="""Damage: a deliberate miscarriage of justice harms the people who lost cases unfairly - their property, freedom or reputation. More seriously, it damages public trust in the judiciary, the institution citizens rely on as the final guardian of fairness and the rule of law. People begin to doubt other judgments, suspect corruption or influence, and may lose faith in going to court; disputes may then be settled outside the law. It also affects investor confidence and the image of Bhutan's democracy.
At the same time, the Supreme Court's action against its own justices shows that the system can hold even judges accountable, which is a positive sign.
Measures to regain confidence:
1. Complete a transparent investigation and take firm action according to law, communicating the findings to the public.
2. Provide a clear, fair mechanism to review cases where miscarriage is credibly alleged.
3. Strengthen judicial ethics: a code of conduct, ethics training, asset declarations and disciplinary procedures.
4. Increase transparency: publish judgments with reasons, open court proceedings, and use electronic case management with random allocation of cases.
5. Ensure merit-based, independent appointments and continuous training of judges.
6. Improve access to justice through legal aid and public legal awareness.
Consistent fairness and openness over time will rebuild trust."""),
dict(key="B3", real=True, type=TOP, marks=10, topic="Topical issues: economy and development", stem="""The economy of Bhutan is based on agriculture and forestry, which provide the main livelihood for more than 60% of the population. Agriculture consists largely of subsistence farming and animal husbandry. Rugged mountains dominate the terrain and make the building of roads and other infrastructure difficult.
Suggest how Bhutan, as a landlocked country with difficult terrain but rich biodiversity, can build on its uniqueness to help the economy grow, and discuss how Bhutan can work differently in developing infrastructure in its rugged mountains and valleys. (10 marks)""",
 key_points=[("Using uniqueness: high-value low-volume tourism and eco/ adventure/ cultural tourism, organic and niche agriculture (high-value crops, cordyceps, mushrooms, branding), hydropower and clean energy, carbon credits/ green finance, biodiversity-based products (medicinal plants, bio-prospecting), Brand Bhutan, GMC, digital economy that does not depend on terrain", 5),
             ("Infrastructure differently: climate-resilient and environmentally friendly road design, tunnels and bridges, ropeways/ cable cars, air connectivity (domestic airports, helicopters), digital connectivity, cluster settlements, use of technology/ GIS planning, public-private partnership, slope stabilisation and bio-engineering", 5)],
 model="""Building on uniqueness: Bhutan's mountains, forests, culture and clean environment are assets. It can (1) promote high-value, low-volume tourism - eco-tourism, trekking, cultural, wellness and birdwatching tourism; (2) shift from subsistence to commercial niche agriculture - organic and high-value products such as cordyceps, mushrooms, quinoa, red rice, apples, cardamom and dairy, branded as 'Bhutanese organic' for export; (3) develop clean hydropower and solar energy for export and green industries; (4) earn from its carbon-negative status through carbon credits and green finance; (5) add value to biodiversity through medicinal plants, Sowa Rigpa products and bio-prospecting; and (6) grow the digital and knowledge economy and the Gelephu Mindfulness City, which do not depend on difficult terrain.
Developing infrastructure differently: use environment-friendly, climate-resilient road construction with proper drainage, slope stabilisation and bio-engineering; build tunnels and bridges to shorten routes and avoid landslide-prone slopes; introduce ropeways and cable cars for remote villages and tourism; expand domestic air and helicopter connectivity; invest in digital connectivity so services reach people without long travel; plan clustered settlements so services are cheaper to provide; use GIS and modern technology in planning; and partner with the private sector and development partners for financing."""),
dict(key="B4", real=True, type=TOP, marks=10, topic="Topical issues: education and child protection", stem=""""Lamoidzingkha Drungkhag Court in Dagana has sentenced a 30-year-old teacher from Lamoidzingkha Middle Secondary School to three months in prison in a child battery case. However, the teacher had the option to pay thrimthue, a monetary penalty, in lieu of serving the prison term. The teacher was charged under Section 215 of the Child Care and Protection Act of Bhutan 2011, which stipulates that a person shall be deemed guilty of child battery if they intentionally use physical force or subject a child to physical force." - Kuensel, July 2023
In your opinion, highlight the importance of value education and discipline in schools, and how it will benefit the education system and the wellbeing of students. (10 marks)""",
 key_points=[("Importance of value education: character, respect, honesty, compassion, tha damtshig ley jumdrey, GNH values, responsible citizens, reduce substance abuse and violence", 3),
             ("Discipline without corporal punishment: positive discipline, counselling, clear rules, consequences, role models; corporal punishment is illegal (CCPA 2011) and harmful", 3),
             ("Benefits to education system and students: safe and conducive learning environment, better learning outcomes, mental health and confidence, good teacher-student relationships, fewer dropouts, holistic development", 4)],
 model="""Value education teaches students core values such as respect, honesty, compassion, responsibility, gratitude (ley jumdrey and tha damtshig) and the values of GNH. It shapes character so that students become responsible, caring citizens, and it helps prevent problems such as bullying, violence, substance abuse and disrespect.
Discipline is equally important: clear rules, punctuality and self-control create order in which learning can take place. However, the case shows that discipline must never be enforced through physical punishment, which is illegal under the Child Care and Protection Act 2011 and harms children physically and emotionally. Schools should use positive discipline - setting clear expectations, praising good behaviour, using logical consequences, counselling, involving parents, and teachers acting as role models.
Benefits to the education system: a safe, respectful and orderly environment improves teaching and learning outcomes; fewer conflicts and disciplinary cases; stronger teacher-student and school-community relationships; and fewer dropouts.
Benefits to students' wellbeing: they feel safe, valued and confident; their mental health improves; they develop self-discipline rather than fear; and they grow holistically - intellectually, morally and emotionally - ready to contribute to society."""),
dict(key="C1", real=True, type=SUBJ, marks=10, topic="Subjective: youth and drugs", stem=""""In an effort to reduce the escalating concern of drug-related crime, the Royal Bhutan Police has strategically established a field division and amplified its manpower, marking a significant step forward in its effort to combat the proliferation of narcotics." - Kuensel, August 2023
In light of the current surge of crimes involving youth and drugs, how would you support the nation in combating this rising crime? (10 marks)""",
 key_points=[("Understanding causes: unemployment, peer pressure, easy availability across border, family problems, stress, lack of recreation", 2),
             ("Personal role: stay drug-free/ role model, peer education and awareness, report trafficking/ information to RBP, support friends to seek help, volunteering (Desuung, youth groups)", 4),
             ("Supporting the system: community policing, family/ school involvement, rehabilitation and reintegration (not only punishment), skills and employment, sports and recreation, counselling services, Bhutan Narcotics Control Authority programmes", 4)],
 model="""Drug abuse and related crimes among youth are driven by unemployment and idleness, peer pressure, easy availability of drugs across the porous border, family problems, stress and lack of recreation. Combating it needs everyone's effort, not only the police.
How I would support the nation:
1. Lead by example: stay away from drugs and alcohol abuse and be a positive role model for younger people.
2. Spread awareness: take part in and organise awareness programmes in schools, colleges and communities, and share accurate information on social media about the dangers of drugs and the law.
3. Report: pass information about drug peddling and trafficking to the Royal Bhutan Police confidentially, and support community policing.
4. Help friends: encourage friends and relatives who use drugs to seek counselling and treatment, and support them during rehabilitation without stigma.
5. Volunteer: join Desuung, youth groups and NGOs working on prevention and recovery.
6. Promote alternatives: help organise sports, arts and skills activities so young people have positive ways to spend their time.
I would also support policies that combine enforcement with prevention, rehabilitation and reintegration, and create skills and job opportunities for youth, because treating addiction as a health problem as well as a crime is more effective."""),
dict(key="C2", real=True, type=SUBJ, marks=10, topic="Subjective: civil service", stem=""""The rate of attrition in the civil service stands at 16% as of June 2023." - Annual Report of RCSC 2022-23. At a time of dire need for efficient public service delivery, the gap left by this high attrition has created a vacuum in the civil service.
Discuss which categories of service recipients would be affected worst, and elaborate on the consequences. (10 marks)""",
 key_points=[("Worst affected recipients: patients (nurses, doctors leaving), students (teacher shortage), rural and remote communities, poor/ elderly/ vulnerable who depend on public services, businesses needing approvals", 4),
             ("Consequences: delays and poorer quality of service, overburdened remaining staff and burnout, loss of experienced/ skilled people and institutional memory, higher costs of recruitment and training, policy and project delays, lower trust in government, impact on economy", 6)],
 model="""With 16% of civil servants leaving - many skilled professionals going abroad - the worst affected service recipients are:
1. Patients: the departure of nurses, doctors and technicians means longer waiting times, fewer services and risks to patient safety, especially at JDWNRH and district hospitals.
2. Students: teacher shortages lead to large classes, teachers covering subjects outside their expertise, and lower learning quality, particularly in rural schools.
3. Rural and remote communities, the elderly, the poor and the vulnerable, who depend entirely on public services and cannot pay for private alternatives.
4. Businesses and the public needing approvals and services, who face longer delays.
Consequences: service delivery slows and quality falls; the remaining staff are overburdened, leading to burnout and further resignations (a vicious cycle); experienced and skilled people leave, taking institutional memory and expertise; the government spends more on recruiting and training replacements; development plans and projects are delayed; public trust in government declines; and the economy suffers from inefficiency. The RCSC needs to improve retention, career development, pay and working conditions, and recruit and train replacements quickly."""),
dict(key="C3", real=True, type=SUBJ, marks=10, topic="Subjective: agriculture and land use", stem="""Bhutan's arable land is only 7% of the total land. Of the total 664,000 acres of arable land, 9.96% is left fallow. Considering that Bhutan's economy is mostly backed by agricultural products, it is necessary to use the land optimally.
Describe what policy and intervention the government should put forward, and explain the means and ideas by which fallow land can be revived and made more productive. (10 marks)""",
 key_points=[("Causes briefly: labour shortage/ rural-urban migration, human-wildlife conflict, lack of irrigation, low profitability, land fragmentation, absentee owners", 2),
             ("Policies/ interventions: land leasing policy (state and private fallow land to youth/ groups), incentives and subsidies, fallow land tax or conditions, irrigation schemes, HWC fencing, farm mechanisation, credit, buy-back and market access, land consolidation", 4),
             ("Means and ideas to revive: commercial and contract farming, cooperatives/ youth groups, high-value and low-labour crops, agroforestry/ orchards, greenhouses, organic farming, Desuung/ Gyalsung agricultural projects, sharecropping", 4)],
 model="""Fallow land results from rural-urban migration and labour shortages, human-wildlife conflict, lack of irrigation, low returns from farming, small fragmented plots and absentee landowners.
Policies and interventions the government should put forward:
1. A land leasing policy that lets unemployed youth, farmers' groups and companies lease fallow private and state land on fair, long-term terms.
2. Incentives such as subsidised inputs, machinery and low-interest credit for reviving fallow land, and possibly conditions or charges to discourage keeping land idle for long periods.
3. Investment in irrigation, farm roads and electric or chain-link fencing against wildlife.
4. Farm mechanisation and hiring services to overcome labour shortages.
5. Assured markets through buy-back schemes, links with schools, hotels and exporters, and minimum support prices.
Means and ideas to revive the land: commercial and contract farming of high-value crops (vegetables, fruits, spices, quinoa); cooperatives and youth groups farming large blocks of pooled land; low-labour options such as orchards, agroforestry and fodder; greenhouses and organic farming for premium markets; sharecropping arrangements between absentee owners and active farmers; and Desuung and Gyalsung agricultural projects that train youth. Together these can raise food self-sufficiency and rural incomes."""),
dict(key="C4", real=True, type=SUBJ, marks=10, topic="Subjective: health and lifestyle", stem="""The figures are alarming. From a lone diabetic patient in 2002, there are more than 3,000 recorded cases today. This is a concern the nation must combat early to reduce non-communicable diseases (NCDs) among citizens in desk jobs with little physical movement.
Explain the holistic effect on the nation if the overall NCD issue is not acted on now, and, as a youth hoping to join a desk-bound white-collar job, what measures and interventions you would embrace to be part of a healthy workforce. (10 marks)""",
 key_points=[("Holistic effects: rising health costs and referrals, lower productivity and absenteeism, premature deaths and disability, burden on families and caregivers, reduced economic growth and GNH, pressure on health system", 5),
             ("Personal measures: regular exercise and active breaks, walking/ cycling, healthy diet (less salt, sugar, fat, doma), no tobacco, limited alcohol, enough sleep, stress management, regular check-ups; workplace interventions (wellness programmes, sports, standing desks)", 5)],
 model="""If NCDs are not tackled now, the effects on the nation will be wide: health spending and costly referrals abroad will keep rising, taking money from other development; many citizens will suffer disability or die early during their most productive years; productivity will fall due to illness and absenteeism; families will bear the burden of caring for sick members and the costs of treatment; the health system will be overstretched; and overall economic growth and Gross National Happiness will suffer.
As a young person planning to join a desk-bound job, I would:
1. Stay physically active - exercise at least 30 minutes a day, walk or cycle to work where possible, use the stairs, and take short movement breaks every hour.
2. Eat healthily - more vegetables, fruits and whole grains; less salt, sugar, oil, red meat, fast food and sugary drinks; and moderate doma (betel) consumption.
3. Avoid tobacco and limit or avoid alcohol.
4. Sleep enough and manage stress through mindfulness, meditation and hobbies.
5. Go for regular health check-ups for blood pressure, sugar and weight.
6. Encourage workplace wellness - office sports, fitness clubs, healthy food in canteens, and ergonomic workstations - and motivate colleagues to join.
A healthy workforce is a productive workforce and is essential for the nation's development."""),
mcq("D1", "General knowledge: technology", "Which was the first country to adopt the 5G mobile network on a large scale?", ["Japan", "South Korea", "UAE", "USA"], "b", "South Korea launched the first nationwide commercial 5G network in April 2019."),
mcq("D2", "General knowledge: sports", "In football, what is the name of the award given each year to the best player in the world?", ["FIFA Ballon d'Or", "FIFA Golden Boot", "UEFA Best Player", "UEFA Golden Shoe"], "a", "The Ballon d'Or (run jointly with FIFA as the FIFA Ballon d'Or in 2010-2015) is the best-player award; the Golden Boot/ Shoe is for top scorers."),
mcq("D3", "General knowledge: technology", "The shortcut key to paste a copied file or word in MS Word is:", ["Ctrl + C", "Ctrl + B", "Ctrl + P", "Ctrl + V"], "d", "Ctrl + V pastes; Ctrl + C copies, Ctrl + B bold, Ctrl + P print."),
mcq("D4", "General knowledge: Bhutan culture", "In the arrangement of statues, 'Rigsum Goenpo' is the combination of:", ["Chenrezig, Buddha and Guru Padmasambhava", "Guru Padmasambhava, Buddha and Zhabdrung", "Jetsun Drolma, Guru Padmasambhava and Zhabdrung", "Jampelyang, Chenrezig and Chana Dorji"], "d", "The Rigsum Goenpo (three protectors) are Jampelyang (wisdom), Chenrezig (compassion) and Chana Dorji (power)."),
mcq("D5", "General knowledge: Bhutan constitution", "The three main branches of government provided for by the Constitution of the Kingdom of Bhutan are:", ["Dzongkhag, Gewog and Chiwog", "Executive, Legislative and Judiciary", "Ministries, Departments and Autonomous agencies", "Parliament, National Council and National Assembly"], "b", "Article 1 provides for the Legislature, the Executive and the Judiciary."),
mcq("D6", "General knowledge: sports", "The 2023 FIFA Women's World Cup was hosted by:", ["Australia and New Zealand", "Australia and Sweden", "Australia and Spain", "Australia and England"], "a", "Australia and New Zealand co-hosted the 2023 Women's World Cup (won by Spain)."),
mcq("D8", "General knowledge: science", "The Chandrayaan-3 spacecraft to the south pole of the Moon was launched by:", ["ISRO", "NASA", "CSIRO", "SpaceX"], "a", "Chandrayaan-3 was launched by the Indian Space Research Organisation and landed near the lunar south pole in August 2023."),
mcq("D10", "General knowledge: geography", "The latitude of the Tropic of Capricorn is:", ["the most southern latitude at which the sun can appear directly over the moon", "the most northern latitude at which the sun can appear directly overhead at noon", "the most northern latitude at which the sun can appear over the moon", "the most southern latitude at which the sun can appear directly overhead at noon"], "d", "The Tropic of Capricorn (about 23.4° S) is the southernmost latitude where the sun can be directly overhead at noon."),
mcq("D12", "General knowledge: books", "Who is the author of the book 'Freedom from Fear'?", ["Nelson Mandela", "Aung San Suu Kyi", "Taslima Nasreen", "Benazir Bhutto"], "b", "'Freedom from Fear' (1991) is a collection of writings by Aung San Suu Kyi."),
mcq("D13", "General knowledge: world", "Which city hosted the United Nations High-Level Political Forum held from 10 to 19 July 2023?", ["New Delhi", "New York", "Paris", "Rome"], "b", "The HLPF on sustainable development is held at UN Headquarters in New York."),
mcq("D14", "General knowledge", "'The greatest glory in living lies not in never falling, but in rising every time we fall' is a famous quote popularly attributed to:", ["Steve Jobs", "Barack Obama", "Nelson Mandela", "Martin Luther King"], "c", "The quote is widely attributed to Nelson Mandela."),
mcq("D15", "General knowledge: science", "Compared to its body weight, which animal is the strongest?", ["Dung beetle", "Elephant", "Ant", "Crow"], "a", "A dung beetle can pull over 1,000 times its own body weight - the strongest relative to body weight."),
mcq("D16", "General knowledge: Bhutan", "The movie by Dzongsar Jamyang Khyentse Norbu announced in 2023 is titled:", ["Pig at the Crossroad", "Pig at the Crossway", "Pig at the Crossing", "Pig at the Crossbow"], "c", "Khyentse Norbu's film is 'Pig at the Crossing'."),
mcq("D17", "General knowledge: books", "Who is the author of the book 'Married to Bhutan'?", ["Karma Ura", "Jamie Zeppa", "Linda Leaming", "Kunzang Choden"], "c", "'Married to Bhutan' is by Linda Leaming; Jamie Zeppa wrote 'Beyond the Sky and the Earth'."),
mcq("D18", "General knowledge: Bhutan government", "Which pairing of minister and ministry (Third Parliament government, 2023) is inaccurate?", ["H.E. Dechen Wangmo - Ministry of Health", "H.E. Ugyen Dorji - Ministry of Home Affairs", "H.E. Loknath Sharma - Ministry of Energy and Natural Resources", "H.E. Dorji Tshering - Ministry of Industry, Commerce and Employment"], "d", "Dorji Tshering headed the Ministry of Infrastructure and Transport; the MoICE minister was Karma Dorji."),
mcq("D19", "General knowledge: management", "Which leadership style gives employees autonomy and allows them to make decisions within their roles?", ["Transformational leadership", "Transactional leadership", "Laissez-faire leadership", "Charismatic leadership"], "c", "Laissez-faire ('let them do') leadership delegates decisions to employees."),
mcq("D20", "General knowledge: Bhutan law", "The Civil Liability Bill passed during the July 2023 sitting of Parliament is also known as the:", ["Asset Bill", "Tort Bill", "Civil Bill", "Assent Bill"], "b", "The Civil Liability Bill deals with torts (civil wrongs) and is known as the Tort Bill."),
]
