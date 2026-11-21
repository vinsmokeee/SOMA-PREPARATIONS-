"""ME Technical Paper I, BCSE 2024 (real questions only), batch 2. PDF sent by the founder (20 Nov 2026).
Same pattern as 2025 (shared from me_technical1_2025.py). Comprehension here: ka 5x2, kha 4x0.5, ga 6x0.5 (15) +
translation 15 = Dzongkha 30. Left out of GK (answer not certain): Q1 (honorary doctorates), Q8 (father of science),
Q12 (most expensive stone), Q17 (marathon position). Dzongkha text repaired with dz_fix (dropped-letter font).
"""
import os, runpy
_base = runpy.run_path(os.path.join(os.path.dirname(__file__), "me_technical1_2025.py"))
PATTERN, RUBRIC = _base["PATTERN"], _base["RUBRIC"]
CS, TOP, M, C, T = "analytical", "long_answer", "mcq", "passage", "translation"

BATCH = "ME Paper I (Technical): BCSE 2024, batch 2"
GROUP_TAG = "2024b2"
PAPER = "me-technical-1"
SUBJECT = "language-general-knowledge"
MIN_WORDS = 0
ADDS_TO_PAPER = True  # questions join the 2025 bank; pattern and mocks follow 2025
SOURCE = {"title": "BCSE 2024 Main Examination, Technical category, Paper I (Language and GK)", "year": 2024,
          "url": "https://rcsc.gov.bt/technical-paper-1/"}
DZ = "Dzongkha: please have a fluent Dzongkha reader check it before publishing."
PDF = "Real RCSC Dzongkha text from a PDF whose font drops letters; repaired automatically: compare with the PDF."
G1, D1 = "me-technical-1-2024b2-cs", "me-technical-1-2024b2-dz"

CASE = """Read the following passage and answer ALL THREE questions.

Overview
Science, Technology, Engineering, and Mathematics (STEM) education plays a significant role in achieving the Sustainable Development Goals (SDGs), particularly SDG 4 - ensuring inclusive and equitable quality education and promoting lifelong learning opportunities for all. It promotes 21st century skills by using real-world, complex problems as instructional contexts. It also advances employability skills, entrepreneurship, and innovation by integrating engineering and technology with science and mathematics. STEM education also provides an opportunity to rethink teaching and learning in practical and intuitive ways.

A publication from the Asian Development Bank draws inspiration and lessons from case studies in four countries on how to implement STEM education. Each country has its approach to STEM learning, but they all focus on promoting 21st century skills and preparing students for the future. Their curriculum also emphasizes convergence across various disciplines, innovating instructional methodology, and student collaboration.

Project-Based Learning in Thailand
Located near Bangkok, the Roong Aroon School approaches STEM education based on three success factors: (i) interdisciplinary connections; (ii) the need for new, ambitious instructional practices in enacting a STEM approach; and (iii) the engagement of students in real-world problem solving. It offers project-based learning encouraging students to become self-directed learners and enhances their collaborative skills as they work with others. In collaboration with teachers, students identify a real- life problem within or outside the school community and make it the focus of their STEM project. They discuss, identify, and research the knowledge required, develop a work plan, share the group work, present their design to the teachers, work on and try out experiments to solve the problem systematically, and prove their project inventions.

Teachers guide students with a lesson framework to plan key educational concepts in terms of content, learning objectives for knowledge, understanding, learning skills, values/attitudes, learning processes, and evaluation. They support and guide students through projects and inventions without the need for any extensive lecturing.

STEAM Integration in the Republic of Korea
The Republic of Korea (ROK) has included the Arts (hence, STEAM) as a way to promote critical thinking. Its STEAM education focuses on increasing students’ interests and understanding of science and technology and nurturing their STEAM literacy and problem-solving ability.

To achieve its goal, ROK launched initiatives to systematically implement STEAM from the national to the school level.

At the national level, the STEAM education framework involves operating model schools that integrate 20% of STEAM-related content in syllabi for science, mathematics, technology and home economics, and music and art classes. It also includes providing teacher training and supporting the teacher community, making a STEAM education platform, and involving science-related institutes as agencies for STEAM education.

The framework for integrated STEAM classes consists of the following steps:

- Context presentation - Present a situation where students could have the opportunity to solve problems that are related to their experiences. - Creative design - Provide students with opportunities to come up with creative ideas to solve the suggested problems through this process: (i) define problems, (ii) generate alternative solutions, (iii) evaluate and select an alternative, and (iv) solve problems. - Emotional touch - Provide students with opportunities to experience success in learning, which can foster their capacity to solve problems and significantly boost their confidence to take on new challenges or activities.

A Focus on Applied Learning in Singapore
The STEM Applied Learning Programme in Singapore has been implemented in secondary schools since 2014. It aims to promote interest in STEM and encourage students to pursue related careers. The program focuses on hands-on activities and presenting a challenge or problem statement relevant to the real world for students to solve. This method establishes relatedness among subjects, encourages learning through play and exploration, and stimulates development of 21st century competencies, such as collaboration, communication, and problem-solving skills.

As students find solutions to the problem, teachers facilitate, guide, motivate, and challenge them to re-examine the solution, modify its aspects, and test it. At the end of the STEM program, students collaborate and apply their knowledge to build and complete a prototype solution.

The STEM program covers 124 mainstream secondary schools that focus on one of eight areas: 1. engineering and robotics, 2. information and communication technology and programming, 3. food science and technology, 4. environmental science and sustainable living, 5. material science, 6. health science and technology, 7. transport and communication, and 8. simulation and modeling.

Key personnel of the school and education and curriculum experts discuss and finalize the design, development, and implementation of a customized curriculum. Schools invite industrial engineers and partners to schools and work together with teachers. The government provides financial support and sends a STEM educator to the school to give on-site support, including conducting professional development workshops for teachers.

Enabling a Creative Learning Environment in Finland
A group of educators who wanted to change the traditional way of teaching started STEAM education in Yli-Ii school in Oulu, Finland. This initiative began as the new national core curriculum for basic education was taken into use in secondary schools from 2017 to 2019. The new curriculum sought to reinforce student activity, increase the sense of meaning in studying, and enable experiences of success through the development of creative learning environments and new ways of working.

Yli-Ii school’s STEAM learning requires combining more than one subject together with 21st century skills. It is being implemented through a learning environment called Värkkäämö that promotes student-centered learning. Activities are designed to support students’ competence, autonomy, and involvement, and highlight cooperation between students and teachers. Students take an active role in designing their studies and the school’s STEAM working space. They can choose their working methods, platforms, and technology as they hone their skills and know-how.

Teachers, meanwhile, collaborate in teaching cross-curricular subjects and open their classroom doors to teachers and students to seek the best solutions. As students are encouraged to set learning goals themselves and learn collaboration and communication skills, they become motivated, develop self-directness, and think like mathematicians and scientists."""

DZP = """༈ འབྲུག་རྒྱལ་ཁབ་ཀྱི་ གོང་འཕེལ་གྱི་ལྟ་བ་འདི་ རྒྱལ་ཡོངས་དགའ་སྐྱིད་དཔལ་འཛོམས་ཀྱི་ ཀ་ཆེན་༤ ལུ་གཞི་བཞག་སྟེ་ཨིནམ་བཞིན་དུ་ ང་བཅས་མི་ལུ་ རང་བཞིན་གྱིས་ཕོག་པའི་འགན་ཁུར་འདི་ ལམ་སྲོལ་མི་ཉམས་གོང་འཕེལ་གཏང་ནི་དང་། རང་བཞིན་གནས་སྟངས་ ཉམས་སྲུང་འབད་ནི་འདི་ཨིན།

དེ་གི་ནང་ལས་ཡང་ འབྲུག་གི་རྩ་ཁྲིམས་ཆེན་མོའི་ནང་ཡང་ རྒྱལ་ཁམས་ཀྱི་མི་སྡེ་དང་མི་སེར་གྱི་ལམ་སྲོལ་ འཚོ་བ་འབོར་ཐབས་ལུ་དྲན་རྟེན་དང་ སྒྱུ་རྩལ་ ཡང་ན་ རྒྱལ་རབས་ཅན་གྱི་ས་གོ་དང་ཅ་དངོས་ རྫོང་གཞིས་ ལྷ་ཁང་ དགོན་སྡེ་ རྟེན་གསུམ་གནས་ སྐད་ཡིག་ རྩོམ་རིག་ སྒྲ་དབངས་ མཐོང་སྣང་གི་སྒྱུ་རྩལ་ ཆོས་ལུགས་བརྩིས་པའི་རྒྱལ་ཁབ་ཀྱི་སྲོལ་རྒྱུན་གྱི་ལམ་སྲོལ་འདི་ ཉེན་སྲུང་དང་ཉེན་སྐྱོབ་ ཡར་སྤེལ་དོན་ལུ་ བརྩོན་ཤུགས་བསྐྱེད་དགོཔ་སྦེ་ཡོདཔ་ཨིན། དེ་མ་ཚད་ རྒྱལ་ཁབ་ཀྱི་ ལམ་སྲོལ་འདི་ འཕོ་འགྱུར་ཆེ་བའི་ནུས་ཤུགས་ཅན་ཅིག་ཨིན་པའི་ ངོས་འཛིན་འབད་ནི་དང་ འཕོ་འགྱུར་དང་རྒྱུན་ཆད་མེད་པའི་སྔར་སྲོལ་གྱི་ཁྱད་ཆོས་དང་ གཙུག་སྡེ་ཚུ་ཡར་འཕེལ་ཅན་ཅིག་སྦེ་ ཡུན་བརྟན་ཚུགས་པའི་མཐའ་བཙན་དང་ ཕན་འདེབས་ལུ་ བརྩོན་ཤུགས་བསྐྱེད་དགོཔ་ཨིན། འདི་འབདཝ་ལས་ བདུན་ཕྲག་འདི་ནང་ ཐིམ་ཕུག་ལུ་ ལམ་སྲོལ་དང་འབྲེལ་བའི་ ས་ཁོངས་གསུམ་ངོས་འཛིན་འབད་ཡོད་པའི་ འཛིན་སྐྱོང་འཆར་གཞི་ཚུ་ གསལ་བཤད་འབད་ཡོདཔ་ད་ ས་གནས་ཁག་༦ ལམ་སྲོལ་གྱི་ས་ཁོངས་སྦེ་བཟོ་ནི་གི་འཆར་གཞི་ཡོད་མི་དེ་ཡང་ བུ་ལི་དང་།རམ་སྟོད། ཨུ་ར། མནའ་སྦྱིས། སྒང་སྟོད། རིན་ཆེན་སྒང་ཚུ་གི་སྐོར་ལས་ གྲོས་བསྡུར་འབད་ནུག།

དེ་བཟུམ་མའི་ ལམ་སྲོལ་གྱི་ ས་ཁོངས་བཟོ་ནི་གི་ ཐབས་ལམ་དེ་ ལེགས་ཤོམ་ཅིག་ཨིན་རུང་ འབྲུག་པའི་ས་ཆ་དེ་ར་ ཐུན་མོང་མ་ཡིན་པའི་ལམ་སྲོལ་ས་ཁོངས་སྦེ་ཡོདཔ་ལས་ ཕྱིའི་ལྟ་བཤལཔ་ཚུ་ རྒྱལ་ཁབ་ནང་འོང་དགོ་མི་དེ་ར་ གནད་དོན་དེ་ལུ་བརྟེན་ཨིན་མས།ང་བཅས་རའི་ གྲོང་གསེབ་ཚུ་ནང་ ཁྱིམ་ཚུ་གི་བཟོ་བཀོད་ཅོག་འཐདཔ་བཟོ་ནི་དང་ སའི་ཆགས་ཚུལ་དག་པ་ཅིག་ གཅིག་མཚུངས་བཟོ་ནི་དེ་ ལམ་སྲོལ་གྱི་གྲངས་སུ་མི་ཚུད་ནི་ཨིནམ་ལས་ སྔོན་དང་ཕུ་ལས་ཡོད་པའི་ལྷ་ཁང་དགོན་སྡེ་དང་ དྲན་རྟེན་ ལུང་ཕྱོགས་སོ་སོའི་ལམ་ལུགས་སྲོལ་ཚུ་ བདག་འཛིན་འཐབ་པ་ཅིན་ རྩ་ཁྲིམས་ཆེན་མོའི་དགོངས་དོན་ཚུ་འགྲུབ་ཚུགས་ནི་ཨིན་མས།

ད་རེས་ནངས་པར་ འཛམ་གླིང་གཅིག་གྱུར་དང་ རྒྱལ་ཁབ་གོང་འཕེལ་འགྱོ་བའི་ནམ་དུས་ལུ་ ང་བཅས་རའི་མི་སྡེ་ཚུ་ལུ་ ག་ཅི་ཁག་ཆེ་ནི་སོ་ཟེར་བ་ཅིན་ གཞི་རྟེན་གསོ་བའི་མཐུན་རྐྱན་དང་ མི་སྡེ་ཞབས་ཏོག་ཚུ་ ཁག་ཆེ་ནི་ཨིན་པས། བདུན་ཕྲག་དག་པ་ཅིག་གི་ཧེ་མར་རྒྱལ་ཁབ་ཀྱི་ས་ཁ་མཐོ་སར་སྡོད་མི་ཚུ་གི་དོན་ལུ་ རྒྱལ་ས་ལྟེ་བ་ལུ་ གཞུང་དང་གཅིག་ཁར་ཞལ་འཛོམས་ཐེངས་དང་པ་ཚོགས་པའི་སྐབས་ ཁོང་གིས་མི་སྡེ་དཔལ་འབོར་གོང་འཕེལ་གཏང་ནིའི་ཕན་ཐབས་ལུ་ ཤེས་རིག་དང་གསོ་བའི་ཞབས་ཏོག་ཡར་དྲག་གཏང་དགོ་པའི་གྲོས་འཆར་ཞུ་ནུག།

ང་བཅས་ཀྱིས་ ས་ཁ་མཐོ་སའི་མི་སྡེ་ཚུ་གིས་ཞུ་བ་འབད་དོ་བཟུམ་ གསོ་བ་དང་ཤེས་རིག་ བརྒྱུད་འབྲེལ་གྱི་མཐུན་རྐྱེན་ཚུ་ མཐའ་ཟུར་གྱི་ས་གནས་ཚུ་ནང་ ཐོབ་སྤྱོད་འབད་ཚུགསཔ་བཟོ་བ་ཅིན་ ད་རེས་ནངས་པ་ང་བཅས་ལུ་བྱུང་སྟེ་ཡོད་མི་ དཀའ་ངལ་ལེ་ཤ་ཅིག་ར་བསལ་ཚུགས་ནི་ཨིནམ་ད གྲོང་གསེབ་ལས་ཁྲོམ་སྡེ་ནང་ གནས་སྤོ་འོང་མི་དང་ ན་གཞོན་ཚུ་ལུ་ལཱ་གཡོག་མ་འཐོབ་པའི་དཀའ་ངལ་ཚུ་བསལ་ནི་ལུ་ལྷན་ཐབས་འབྱུང་འོང་། ང་བཅས་ཀྱིས་ འགྲོ་བ་མི་ལུ་མཁོ་བའི་གཞི་རྟེན་མཐུན་རྐྱེན་ཚུ་ མཁོ་སྤྲོད་འབད་ཚུགས་པ་ཅིན་ཐུན་མོང་མ་ཡིན་པའི་ལམ་སྲོལ་དང་སྲོལ་རྒྱུན་གྱི་དྲན་རྟེན་ རང་བཞིན་གྱིས་ར་ཉམས་སྲུང་འབད་ཚུགས།

གལ་སྲིད་མི་སྡེ་ནང་ དཔལ་འབོར་དང་འབྲེལ་བའི་ཞབས་ཏོག་ཚུ་ མཐའ་ཟུར་གྱི་ས་གནས་ཚུ་ནང་ལྷོད་མ་ཚུགས་པ་ཅིན་ མི་སྡེ་ཚུ་གིས་ཁོང་རའི་འཚོ་སྐྱོང་དང་ གཙོ་རིམ་ཚུ་ལུ་ ཤུགས་བཏོན་པའི་བསྒང་ལས་ ད་ཚུན་གྱི་བར་ན་ ཉམས་མེད་གནས་ཡོད་མི་འབྲུག་གི་ལམ་སྲོལ་བཟང་པོ་ཚུ་ འགྲོས་ཀྱིས་བཏང་སྟེ་ ཡལ་ཉམས་འགྱོ་ནི་གི་ཉེན་ཁ་ཡོདཔ་ཨིན། འདི་འབདཝ་ལས་ ལམ་སྲོལ་དང་སྲོལ་རྒྱུན་ཉམས་སྲུང་དེ་ གོང་འཕེལ་དང་གཅིག་ཁར་འགྱོ་དགོ་ ཟེར་ཞུ་ནི་ཨིན།། (ཁུངས་གཏུགས་ སྤྱི་ལོ་༢༠༡༧ ཟླ་༡༠ པའི་ཚེས་༢༨ རེས་གཟའ་ཉི་མའི་ཀུན་གསལ་ནང་ལས།"""

TR = """His Majesty The King was warmly received by the government and people of Gujarat, India while on a three days visit to the Indian state. His Majesty is accompanied by Prime Minister Dasho Tshering Tobgay. His Majesty was received at the airport by Minister of State Shri Jagdish Vishwakarma, who accompanied His Majesty on a visit to the Statue of Unity. Built to honour the great Indian statesman Sardar Vallabhbhai Patel as the architect of independent India, the 182 meters statue is the tallest in the world. His Majesty also visited the nearby hydro power dam, which is the second largest gravity dam in the world in terms of volume of concrete used, which was built to provide water and electricity to the Indian states of Gujarat, Madhya Pradesh, Maharashtra and Rajasthan. His Majesty was then received at Ahmedabad Airport by Gujarat Chief Minister, Shri Bhupendra Patel, who hosted a dinner in honour of the visit in Gandhinagar, the State capital. His Majesty thanked the government and people of Gujarat for the warm welcome accorded to the Bhutanese delegation - a reflection of the exceptional traditional hospitality that Gujarat, and India as a whole, is known for. While in Gujarat, His Majesty visited major projects and infrastructure sites in the state, to explore opportunities for collaboration between India and Bhutan as part of the ongoing work for Gelephu Mindfulness City."""


def mcq(key, stem, opts, ans, exp):
    return dict(key=key, real=True, type=M, topic="General knowledge", stem=stem, opts=opts, ans=ans, exp=exp)


Q = [
dict(key="A1", real=True, type=CS, marks=10, topic="Case study", group=G1, pos=1, stem=CASE + """

Question 1
Outline the diverse methods of STEM education in four different countries towards a common goal and explain how they are similar and different from one another. (10 marks)""",
     key_points=[("Thailand: project-based learning on real-life problems (Roong Aroon School)", 2), ("Korea: STEAM adds the Arts; context presentation, creative design, emotional touch; national framework", 2),
                 ("Singapore: Applied Learning Programme; hands-on, prototypes, 8 focus areas, industry partners", 2), ("Finland: creative learning environment (Värkkämö), student-centred, cross-curricular teaching", 2),
                 ("Similarities (21st-century skills, real problems, collaboration, teacher as guide) and differences (scale, national vs school-led, arts, industry)", 2)],
     model="""All four countries use STEM to build 21st-century skills, but in different ways.

Thailand (Roong Aroon School) uses project-based learning: students identify a real problem in their community, research it, plan, experiment and present their solution, while teachers guide rather than lecture.

The Republic of Korea adds the Arts (STEAM) to promote creativity. It is a national programme: model schools put 20% STEAM content into syllabi, teachers are trained and classes follow three steps - context presentation, creative design and "emotional touch" to build confidence.

Singapore's STEM Applied Learning Programme in 124 secondary schools focuses on hands-on challenges in one of eight areas, such as robotics or food science; industry partners work with teachers and students build prototypes, with government funding and on-site STEM educators.

Finland's Yli-Ii school created a student-centred creative space (Värkkämö) where students set goals, choose methods and technology, and teachers co-teach across subjects.

Similarities: all use real-world problems, collaboration, cross-subject learning and the teacher as facilitator. Differences: Korea and Singapore are government-led and large-scale, Thailand and Finland are school-led; Korea includes the arts; Singapore links closely with industry; Finland gives students the most autonomy."""),
dict(key="A2", real=True, type=CS, marks=10, topic="Case study", group=G1, pos=2, stem="""Question 2
What are your recommendations to make STEM education successful? (10 marks)""",
     key_points=[("Teacher training and support (professional development, STEM educators)", 3), ("Facilities and resources: labs, makerspaces, ICT, especially in rural schools", 2),
                 ("Project-based, real-problem, cross-subject curriculum with industry/community partners", 3), ("Assessment and motivation: assess skills not only exams; encourage girls and careers", 2)],
     model="""First, invest in teachers. STEM teaching depends on teachers who can guide projects rather than lecture, so they need regular professional development, as in Korea and Singapore, and time to plan cross-subject lessons together.

Second, provide resources. Schools need science labs, makerspaces, computers, internet and basic tools for building prototypes; rural schools in Bhutan especially need support so that STEM does not widen the gap between town and village.

Third, make learning practical. Curricula should be built around real local problems - water supply, waste, farming, energy - with students working in teams, as in Thailand, and with engineers, hospitals and companies as partners, as in Singapore.

Finally, change assessment and motivation: grade projects, creativity and teamwork, not only written exams; hold science fairs and competitions; and encourage girls and students from all backgrounds to take up STEM careers."""),
dict(key="A3", real=True, type=CS, marks=10, topic="Case study", group=G1, pos=3, stem="""Question 3
STEM education is the most desired and discussed topic in Bhutan. Is the Ministry of Education and Skills Development ready to streamline STEM curriculum across all levels? Discuss the pros and cons based on the inference highlighted in the essay and your own expertise. (10 marks)""",
     key_points=[("Clear view on readiness", 2), ("Pros (skills for jobs and GMC, innovation, links to SDG 4, practical learning)", 4), ("Cons/challenges (teacher shortage and attrition, labs and internet in rural schools, cost, exam culture)", 4)],
     model="""In my view the Ministry has started well, but is only partly ready to streamline STEM across all levels.

Pros: STEM would prepare young Bhutanese for jobs in technology, hydropower, construction and the Gelephu Mindfulness City, encourage innovation and entrepreneurship, and make learning more practical and interesting, in line with SDG 4. Bhutan already has some foundations: coding and digital literacy in schools, science and technical colleges, and teachers who have been trained in new pedagogies.

Cons: as the case studies show, successful STEM needs well-trained teachers, labs, makerspaces and industry partners. Bhutan faces teacher shortages and resignations, many rural schools lack labs, equipment and reliable internet, and funds are limited. Our exam-oriented culture also rewards memorisation rather than project work.

Therefore the Ministry should roll out STEM in phases: train teachers first, equip schools, pilot in selected schools at each level, involve industry and adjust assessment, before making it uniform nationwide."""),
dict(key="B1", real=True, type=TOP, marks=10, topic="Topical issues: road safety", stem="""According to the news report on 16 January 2024, Bhutan witnessed a surge in motor vehicle accidents in 2023 compared to the past three years. Analyse the cause of accidents and explain the roles of concerned stakeholders in regulating the accidents. (10 marks)""",
     key_points=[("Causes analysed (speeding, drink driving, inexperience, fatigue, phones, poor roads/weather, more vehicles)", 4),
                 ("Roles: police/RSTA (enforcement, licensing, testing)", 2), ("Roles: road department (barriers, signs, maintenance)", 2), ("Roles: drivers, passengers, communities, schools, media", 2)],
     model="""Causes: the number of vehicles has grown quickly, especially after import restrictions eased, while roads are narrow and winding. Many accidents are caused by speeding, overtaking on blind curves, drink driving, inexperienced young drivers, fatigue among taxi and truck drivers and the use of mobile phones. Landslides, potholes, ice and fog add to the danger.

Stakeholders: the Royal Bhutan Police and the Road Safety and Transport Authority should enforce speed limits and alcohol tests, improve driver training and testing, and suspend licences of repeat offenders. The Department of Surface Transport should install crash barriers, signs and lighting at black spots and maintain roads. Vehicle owners must keep vehicles roadworthy. Schools, media and communities can run awareness campaigns, and every driver and passenger must follow the rules, wear seat belts and refuse to travel with a drunk driver."""),
dict(key="B2", real=True, type=TOP, marks=10, topic="Topical issues: economy", stem="""The Gelephu Mindfulness City is an interconnected bridge of sustainable development between South and Southeast Asia. Write your views on how it will hone Bhutan's economy. (10 marks)""",
     key_points=[("Investment and new sectors (FDI, green industry, IT, finance, health, education)", 3), ("Jobs and reducing youth unemployment/out-migration", 3),
                 ("Connectivity and trade (South-Southeast Asia, India's northeast, airport, rail)", 2), ("Balanced view: sustainability and values, risks", 2)],
     model="""Gelephu Mindfulness City (GMC) can strengthen Bhutan's economy in several ways.

First, it will attract foreign direct investment into new sectors such as green energy, technology, finance, health, education and agro-processing, diversifying an economy that depends heavily on hydropower and tourism.

Second, it will create jobs and business opportunities for young Bhutanese, helping reduce unemployment and the outflow of youth to other countries.

Third, its location on the southern border, with planned links to India's northeast and onward to Southeast Asia through roads, rail and an international airport, makes it a hub for trade and services.

At the same time, GMC must remain true to mindfulness: protecting forests and culture and ensuring that Bhutanese, not only foreign firms, benefit. If managed well, it can raise national income while staying sustainable."""),
dict(key="B3", real=True, type=TOP, marks=10, topic="Topical issues: governance and society", stem="""Lately, rising crime in the news has become a big concern, and people's safety is being questioned. Do you think installing CCTV cameras in strategic places (towns and institutions) is the right way to reduce crime and social problems? (10 marks)""",
     key_points=[("Clear stand", 2), ("Benefits: deterrence, evidence, faster response, sense of safety", 3), ("Concerns: privacy, data misuse, cost, crime displacement", 3), ("Other measures alongside CCTV (policing, youth programmes, lighting, community)", 2)],
     model="""I believe CCTV cameras are a useful tool, but they should be one part of a wider approach.

Cameras in towns, bus stations and institutes can deter theft, fights and vandalism, because people know they are being watched. Footage helps the police identify suspects and provides evidence in court, and it makes residents, especially women and students, feel safer at night.

However, CCTV raises privacy concerns: footage must be protected by clear laws on who can view it and how long it is kept. Cameras are costly to install and maintain, and crime may simply move to areas without cameras.

Most importantly, cameras do not address the causes of crime, such as unemployment, drug and alcohol abuse and family problems. CCTV should therefore be combined with community policing, street lighting, youth programmes and rehabilitation."""),
mcq("C2", "Which company launched AI models named 'Qwen-VL and Qwen-VL-Chat'?", ["Alibaba", "Huawei", "Meta", "Samsung"], 0, "Qwen models are developed by Alibaba Cloud."),
mcq("C3", "World Food Day is celebrated on 16 October every year. What was the theme of 2023?", ["'Food for All. Leave No One Behind'", "'Our Actions are our Future'", "'Food safety: Prepare for the Unexpected'", "'Water is life, Water is Food. Leave No One Behind'"], 3, "The 2023 World Food Day theme was 'Water is life, water is food. Leave no one behind'."),
mcq("C4", "Which of the following is the highest civilian award conferred by His Majesty the King?", ["Order of the Druk Gyalpo", "Druk Thuksey", "Civil Service Award", "National Order of Merit"], 0, "The Order of the Druk Gyalpo is Bhutan's highest civilian honour."),
mcq("C5", "Of the six official languages of the UN, which one is NOT an official UN language?", ["Arabic", "French", "German", "Chinese"], 2, "The six are Arabic, Chinese, English, French, Russian and Spanish."),
mcq("C6", "Which is the smallest country in the world?", ["Nauru", "Monaco", "Vatican", "Tuvalu"], 2, "Vatican City is the smallest country by area."),
mcq("C7", "What is the full form of QR Code?", ["Quick Regulating Code", "Quick Register Code", "Quick Recharge Code", "Quick Response Code"], 3, "QR stands for Quick Response."),
mcq("C9", "An American author who represented an extraordinary accomplishment in the education of persons with disabilities is", ["Mark Twain", "John Milton", "Maya Angelou", "Helen Keller"], 3, "Helen Keller, deaf and blind from infancy, became an author and activist."),
mcq("C10", "Which football team is known as 'The Red Devils'?", ["Manchester United", "Real Madrid", "FC Barcelona", "Arsenal"], 0, "Manchester United's nickname is the Red Devils."),
mcq("C11", "How many time zones does Russia have?", ["11", "12", "13", "14"], 0, "Russia spans 11 time zones."),
mcq("C13", "When the National Assembly is dissolved, the Druk Gyalpo appoints an Interim Government headed by a Chief Advisor. Who is the Chief Advisor as per the Constitution?", ["Chairperson of the National Council", "Chief Justice of Bhutan", "Chairperson of the Royal Privy Council", "The Attorney General"], 1, "Article 19 of the Constitution: the Chief Justice of Bhutan heads the Interim Government as Chief Advisor."),
mcq("C14", "Which of the following is NOT a constitutional body?", ["Royal Civil Service Commission", "Anti-Corruption Commission", "Royal Privy Council", "Royal Audit Authority"], 2, "The RCSC, ACC, RAA and Election Commission are constitutional bodies; the Royal Privy Council is not."),
mcq("C15", "A pentagon has five sides, a hexagon six. How many faces does a dodecahedron have?", ["11", "12", "13", "14"], 1, "'Dodeca' means twelve: a dodecahedron has 12 faces."),
mcq("C16", "Which of the following is known as the 'Blue Planet'?", ["Earth", "Mars", "Jupiter", "Saturn"], 0, "Earth looks blue from space because of its oceans."),
mcq("C18", "A rainbow has seven colours. All of the following are rainbow colours EXCEPT", ["Indigo", "Orange", "Purple", "Green"], 2, "The colours are red, orange, yellow, green, blue, indigo and violet."),
mcq("C19", "Which of the following is NOT a landlocked country?", ["Lesotho", "Laos", "Liechtenstein", "Lebanon"], 3, "Lebanon has a Mediterranean coastline."),
mcq("C20", "Where is the headquarters of Facebook (Meta)?", ["United Kingdom", "Republic of China", "United States of America", "South Africa"], 2, "Meta is headquartered in Menlo Park, California, USA."),
dict(key="D1", real=True, type=C, marks=10, topic="Dzongkha comprehension", issues=[DZ, PDF], group=D1, pos=1, stem=DZP + """

ལྟག་གི་ཡིག་རྒྱུགས་ལྷག་ཞིནམ་ལས་ དྲི་བ་ ཀ་ ཁ་ ག་ གསུམ་གྱི་ལན་བྲིས།

དྲི་བ་ ཀ༽ འོག་གི་ དྲི་བ་ག་ར་གི་ ལན་བྲིས། (སྐུགས་ ༥x༢ = ༡༠)
༡. འབྲུག་གི་རྩ་ཁྲིམས་ཆེན་མོའི་ནང་ ག་ཅི་ཡར་རྒྱས་གཏང་ནི་ལུ་ བརྩོན་ཤུགས་བསྐྱེད་དགོཔ་སྦེ་ བཀོད་དེ་འདུག? གནད་དོན་གཉིས་བྲིས།
༢. རྒྱལ་ཡོངས་དགའ་སྐྱིད་དཔལ་འཛོམས་ཀྱི་ ཀ་ཆེན་བཞི་ལས་ "ལམ་སྲོལ་བདག་འཛིན་དང་གོང་འཕེལ་" ཟེར་མི་འདི་གི་ བཤད་པ་རྐྱབ།
༣. གྲོང་གསེབ་ཚུ་ནང་ ཁྱིམ་ཚུ་གི་ བཟོ་བཀོད་ཅོག་ར་འཐདཔ་ བཟོ་དགོ་པའི་དོན་དག་ ག་ཅི་འོང་ནི་ཨིན་མས?
༤. འོག་གི་ མིང་ཚིག་ཚུ་ལག་ལེན་འཐབ་སྟེ་ དོན་མཚམས་ནང་གི་ ས་སྟོང་ཚུ་སུབས། (འཚོ་སྐྱོང་། སྒྱུ་རྩལ། ལམ་སྲོལ། གྲོང་གསེབ། ཐུན་མོང་མ་ཡིན་པ།)
ང་བཅས་རའི་ འབྲུག་རྒྱལ་ཁབ་ཀྱི་ ...(༡)... འདི་ གཞན་རྒྱལ་ཁབ་ག་དང་ཡང་ མ་འདྲ་བའི་ ཁྱད་ཆོས་ ...(༢)... ཅིག་ཨིན། དེ་ཡང་ ...(༣)... ནང་ལས་ཕར་ སྡོད་མི་ མི་སེར་ཚུ་གིས་ ཁོང་རའི་ ...(༤)... འཐབ་ནིའི་དོན་ལུ་ མེན་པར་ རྒྱལ་ཁབ་ཀྱི་ འཕྲལ་ཕུགས་གཉིས་ཀྱི་དོན་ལུ་ མནོ་བསམ་བཏང་སྟེ་ བདག་འཛིན་འབདཝ་ཨིན།
༥. ཁྱོད་ ལམ་སྲོལ་འགོ་དཔོན་ཨིན་པ་ཅིན་ རྒྱལ་ཁབ་ནང་ ལམ་སྲོལ་གོང་འཕེལ་གཏང་ནིའི་ཐབས་ལམ་ ག་ཅི་ར་བཏོན་འོང་གོ? གཉིས་ཐོ་བཀོད་འབད།""",
     key_points=[("༡ ལམ་སྲོལ་ (དྲན་རྟེན་ སྒྱུ་རྩལ་ རྫོང་ ལྷ་ཁང་ སྐད་ཡིག་ སོགས་) ཉེན་སྲུང་དང་ ཡར་སྤེལ། ལམ་སྲོལ་འདི་ འཕོ་འགྱུར་ཅན་གྱི་ ནུས་ཤུགས་སྦེ་ ངོས་འཛིན།", 2),
                 ("༢ ལམ་སྲོལ་ མི་ཉམས་པར་ བདག་འཛིན་འཐབ་སྟེ་ དུས་དང་བསྟུན་ གོང་འཕེལ་གཏང་ནི།", 2),
                 ("༣ ལམ་སྲོལ་གྱི་ གྲངས་སུ་ མི་ཚུདཔ་ཨིན། (ཡིག་རྒྱུགས་ལྟར།) ལྷ་ཁང་ དགོན་སྡེ་ དྲན་རྟེན་ཚུ་ བདག་འཛིན་འཐབ་དགོ།", 2),
                 ("༤ (༡) ལམ་སྲོལ། (༢) ཐུན་མོང་མ་ཡིན་པ། (༣) གྲོང་གསེབ། (༤) འཚོ་སྐྱོང་། (ལྷག་ལུས་ སྒྱུ་རྩལ།)", 2),
                 ("༥ ཐབས་ལམ་ གཉིས་ (མཐའ་ཟུར་ལུ་ གཞི་རྟེན་ ཞབས་ཏོག། ལམ་སྲོལ་ས་ཁོངས། སློབ་གྲྭ་ནང་ སློབ་སྟོན། སོགས།)", 2)],
     model="""༡ རྒྱལ་ཁབ་ཀྱི་ སྲོལ་རྒྱུན་གྱི་ ལམ་སྲོལ་ (དྲན་རྟེན་ སྒྱུ་རྩལ་ རྫོང་ ལྷ་ཁང་ དགོན་སྡེ་ སྐད་ཡིག་ རྩོམ་རིག་ སོགས་) ཉེན་སྲུང་དང་ ཡར་སྤེལ་ལུ་ བརྩོན་ཤུགས་བསྐྱེད་ནི། ལམ་སྲོལ་འདི་ འཕོ་འགྱུར་ཅན་གྱི་ ནུས་ཤུགས་སྦེ་ ངོས་འཛིན་ཏེ་ ཡུན་བརྟན་ཚུགས་པར་ བཟོ་ནི།
༢ འབྲུག་གི་ ལམ་སྲོལ་ སྐད་ཡིག་ སྒྱུ་རྩལ་ཚུ་ མི་ཉམས་པར་ བདག་འཛིན་འཐབ་སྟེ་ དུས་དང་བསྟུན་ ཡར་དྲག་གཏང་ནི་ཨིན།
༣ ཡིག་རྒྱུགས་ལྟར་ན་ ཁྱིམ་ཚུ་གི་ བཟོ་བཀོད་ ཅོག་འཐདཔ་བཟོ་ནི་འདི་ ལམ་སྲོལ་གྱི་ གྲངས་སུ་ མི་ཚུདཔ་ཨིན། ལྷ་ཁང་ དགོན་སྡེ་ དྲན་རྟེན་ དང་ ལུང་ཕྱོགས་སོ་སོའི་ ལམ་ལུགས་ཚུ་ བདག་འཛིན་འཐབ་པ་ཅིན་ རྩ་ཁྲིམས་ཀྱི་ དགོངས་དོན་ འགྲུབ།
༤ (༡) ལམ་སྲོལ། (༢) ཐུན་མོང་མ་ཡིན་པ། (༣) གྲོང་གསེབ། (༤) འཚོ་སྐྱོང་།
༥ མཐའ་ཟུར་གྱི་ ས་གནས་ཚུ་ལུ་ གསོ་བ་ ཤེས་རིག་ བརྒྱུད་འབྲེལ་གྱི་ མཐུན་རྐྱེན་ བྱིན་ཏེ་ མི་ཚུ་ གཡུས་ཁར་ སྡོད་ཚུགས་པ་ བཟོ་ནི། སློབ་གྲྭ་ཚུ་ནང་ ལམ་སྲོལ་ སྒྱུ་རྩལ་ སློབ་སྟོན་ ཡར་དྲག་གཏང་ནི།"""),
dict(key="D2", real=True, type=C, marks=2, topic="Dzongkha comprehension", issues=[DZ, PDF], group=D1, pos=2, stem="""དྲི་བ་ ཁ༽ འོག་གི་མིང་ཚིག་ཚུ་གི་ རྣམ་གྲངས་ ཡིག་རྒྱུགས་ནང་ལས་འཚོལ་ཏེ་བྲིས། (སྐུགས་ ༤x༠.༥ = ༢)
༡༽ ཡར་རྒྱས།  ༢༽ སྡོད་གནས།  ༣༽ ཉེན་སྐྱོབ།  ༤༽ གོ་བསྡུར།""",
     key_points=[("ཡར་རྒྱས → ཡར་སྤེལ། སྡོད་གནས → ས་གོ (ཡང་ན་ ས་ཁོངས)། ཉེན་སྐྱོབ → ཉེན་སྲུང་། གོ་བསྡུར → གྲོས་བསྡུར། (རེ་རེ་ལུ་ ༠.༥)", 2)],
     model="ཡར་རྒྱས = ཡར་སྤེལ། སྡོད་གནས = ས་གོ / ས་ཁོངས། ཉེན་སྐྱོབ = ཉེན་སྲུང་། གོ་བསྡུར = གྲོས་བསྡུར།",
     issues_extra=None),
dict(key="D3", real=True, type=C, marks=3, topic="Dzongkha comprehension", issues=[DZ, PDF], group=D1, pos=3, stem="""དྲི་བ་ ག༽ འོག་གི་མིང་ཚིག་ཚུ་གི་ རྗོད་ཚིག་བྲིས། (ལྟག་གི་ཡིག་རྒྱུགས་ནང་ལས་ འདྲ་བཤུས་ཕབ་མི་ཆོག) (སྐུགས་ ༦x༠.༥=༣)
༡) ལམ་སྲོལ།  ༢) འཕོ་འགྱུར།  ༣) ཡུན་བརྟན།  ༤) དགོངས་དོན།  ༥) འཛམ་གླིང་གཅིག་འགྱུར།  ༦) ཡལ་ཉམས།""",
     key_points=[("ཚིག་ ༦ ལུ་ རྗོད་ཚིག་ ཀྲིག་ཀྲི་ (ཚིག་རེ་ལུ་ ༠.༥)", 3)],
     model="""༡ ང་བཅས་ཀྱིས་ འབྲུག་གི་ ལམ་སྲོལ་ བདག་འཛིན་འཐབ་དགོ།
༢ དུས་རབས་ཀྱི་ འཕོ་འགྱུར་དང་བསྟུན་ ལཱ་གི་ ལམ་ལུགས་ཡང་ སོར་དགོཔ་ཨིན།
༣ ཡུན་བརྟན་གྱི་ གོང་འཕེལ་ཟེར་མི་འདི་ ཤུལ་མའི་ མི་རབས་ཀྱི་དོན་ལུ་ཨིན།
༤ སློབ་དཔོན་གྱི་ དགོངས་དོན་ ཧ་གོ་སྟེ་ ལཱ་འབད་ཡི།
༥ འཛམ་གླིང་གཅིག་འགྱུར་གྱི་ ནམ་དུས་ལུ་ ཚོང་འབྲེལ་ མགྱོགས་དྲགས་སྦེ་ ཡར་སེང་འགྱོ་དོ།
༦ ཉམས་སྲུང་ མ་འབད་བ་ཅིན་ སྔར་སྲོལ་གྱི་ རྩེད་མོ་ཚུ་ ཡལ་ཉམས་འགྱོ་ནི་ཨིན།"""),
dict(key="T1", real=True, type=T, marks=15, topic="Translation: English to Dzongkha", issues=[DZ], stem="""འོག་གི་ཨིང་སྐད་ནང་ཡོད་མི་དོན་མཚམས་འདི་ ལེགས་ཤོམ་སྦེ་ལྷག་ཞིནམ་ལས་ རྫོང་ཁའི་ཐོག་ལུ་ སྐད་སྒྱུར་འབད། (གནད་དོན་ཕོག་མ་ཕོག་དང་ གོ་རིམ་ སྡེབ་སྦྱོར་ཚུ་ལུ་ བལྟ་སྟེ་ སྐུགས་བྱིན་ནི་ཨིན།) (སྐུགས་ ༡༥)

""" + TR,
     key_points=[("གནད་དོན་ཕོག་མ་ཕོག་ - དོན་ཚན་ཆ་ཚང་ མ་ལུས་པར།", 7), ("མིང་ (མི་ མཚན་ ས་གནས་) དང་ ཨང་གྲངས་ (ཉིན་ ༣ ། མི་ཊར་ ༡༨༢) ངོ་མ་བཟུམ་ ཞེ་ས་དང་བཅས།", 3), ("གོ་རིམ་དང་ སྡེབ་སྦྱོར་ བརྡ་སྤྲོད།", 5)],
     model="""མི་དབང་མངའ་བདག་རིན་པོ་ཆེ་ རྒྱ་གར་གྱི་ མངའ་སྡེ་ གུ་ཇ་རཏ་ལུ་ ཉིན་གསུམ་གྱི་ ཆིབས་སྐྱོད་ཀྱི་ སྐབས་ གུ་ཇ་རཏ་གྱི་ གཞུང་དང་ མི་སེར་ཚུ་གིས་ ཕེབས་བསུ་ ཧ་ཅང་ གཟབ་གཟབ་སྦེ་ ཞུ་ཡི། མི་དབང་མངའ་བདག་རིན་པོ་ཆེ་དང་གཅིག་ཁར་ བློན་ཆེན་ དྲག་ཤོས་ ཚེ་རིང་སྟོབས་རྒྱས་ ཕེབས་ཡོདཔ་ཨིན།

གནམ་ཐང་ཁར་ རྒྱལ་བློན་ ཤི་རི་ ཇག་དིཤ་ བིཤ་ཝ་ཀར་མ་གིས་ ཕེབས་བསུ་ཞུ་སྟེ་ མཐུན་སྒྲིལ་གྱི་ སྐུ་འདྲ་ (Statue of Unity) ལུ་ གཟིགས་སྐོར་ཞུ་བའི་སྐབས་ རྗེས་འབྲང་ཞུ་ཡི། རང་དབང་རྒྱ་གར་གྱི་ བཟོ་བཀོད་པ་ ཆེན་པོ་ ས་དར་ བལ་ལབ་བྷའི་ པ་ཊེལ་ལུ་ བརྩི་མཐོང་གི་དོན་ལུ་ བཞེངས་ཡོད་པའི་ མི་ཊར་ ༡༨༢ ཡོད་པའི་ སྐུ་འདྲ་འདི་ འཛམ་གླིང་ནང་ མཐོ་ཤོས་ཨིན།

མི་དབང་མངའ་བདག་རིན་པོ་ཆེ་གིས་ ཉེ་འདབས་ཀྱི་ ཆུ་གློག་གི་ ཆུ་བཀག་ལུ་ཡང་ གཟིགས་སྐོར་མཛད་ཡི། ཆུ་བཀག་འདི་ ལག་ལེན་འཐབ་ཡོད་པའི་ ཅི་མེན་ཊི་གི་ ཚད་ལུ་ བལྟ་བ་ཅིན་ འཛམ་གླིང་ནང་ ཡང་ཅིག་ ཆེ་ཤོས་ཀྱི་ ཆུ་བཀག་ཨིནམ་དང་ རྒྱ་གར་གྱི་ མངའ་སྡེ་ གུ་ཇ་རཏ་ མ་དྷ་ཡ་ པྲ་དེཤ་ མ་ཧ་རཱཤ་ཊྲ་ དང་ ར་ཇསི་ཐཱན་ ཚུ་ལུ་ ཆུ་དང་ གློག་མེ་ བྱིན་ནིའི་དོན་ལུ་ བཟོ་ཡོདཔ་ཨིན།

དེ་ལས་ ཨ་མད་ཨ་བཱད་ གནམ་ཐང་ཁར་ གུ་ཇ་རཏ་གྱི་ བློན་འཛིན་ ཤི་རི་ བྷུ་པེན་ཌྲ་ པ་ཊེལ་གིས་ ཕེབས་བསུ་ཞུ་སྟེ་ མངའ་སྡེའི་ རྒྱལ་ས་ གཱན་དྷི་ནགར་ནང་ ཆིབས་སྐྱོད་ཀྱི་ བརྩི་མཐོང་གི་ དོན་ལུ་ ཕྱི་ཇའི་ སྟོན་མོ་ ཞུ་ཡི།

མི་དབང་མངའ་བདག་རིན་པོ་ཆེ་གིས་ འབྲུག་གི་ སྐུ་ཚབ་ལུ་ ཕེབས་བསུ་ ལེགས་ཤོམ་ ཞུ་མི་ལུ་ གུ་ཇ་རཏ་གྱི་ གཞུང་དང་ མི་སེར་ཚུ་ལུ་ བཀའ་དྲིན་ཆེ་ཟེར་ གསུངས་ཡི། འདི་ གུ་ཇ་རཏ་དང་ རྒྱ་གར་ཡོངས་ཀྱི་ ངོ་མཚར་ཅན་གྱི་ སྔར་སྲོལ་ མགྲོན་སྐྱོང་གི་ མཚོན་རྟགས་ཅིག་ཨིན།

གུ་ཇ་རཏ་ལུ་ ཆིབས་སྐྱོད་ཀྱི་སྐབས་ མི་དབང་མངའ་བདག་རིན་པོ་ཆེ་གིས་ དགེ་ལེགས་ཕུག་ ཡིད་ཀྱི་བྲོད་བྱེད་ཁྲོམ་སྡེ་གི་ ལཱ་གི་ ཆ་ཤས་སྦེ་ རྒྱ་གར་དང་ འབྲུག་གི་ བར་ན་ མཉམ་འབྲེལ་གྱི་ གོ་སྐབས་ཚུ་ འཚོལ་ནིའི་དོན་ལུ་ མངའ་སྡེ་ནང་གི་ ལས་འགུལ་ ཆེ་བ་དང་ གཞི་རྟེན་མཐུན་རྐྱེན་གྱི་ ས་གོ་ཚུ་ལུ་ གཟིགས་སྐོར་ མཛད་ཡི།"""),
]
for x in Q:
    x.pop("issues_extra", None)

# ---- Founder rule (21 Nov 2026): older-year questions follow the marks of the LATEST paper (2025: Dzongkha
# comprehension 20, translation 15). The parts below are re-marked to fit; key points are scaled to match and the
# original marks are noted in the stem.
FIT = {'D1': 13, 'D2': 3, 'D3': 4}
for _q in Q:
    if _q["key"] in FIT:
        _old, _new = _q["marks"], FIT[_q["key"]]
        _kp = [(p, round(m * _new / _old * 2) / 2) for p, m in _q["key_points"]]
        _kp[0] = (_kp[0][0], _kp[0][1] + _new - sum(m for _, m in _kp))
        _q.update(marks=_new, key_points=_kp, stem=_q["stem"] + "\n\n(Marks: %s - set to the latest RCSC layout; the 2024 paper gave %s.)" % (_new, _old))
