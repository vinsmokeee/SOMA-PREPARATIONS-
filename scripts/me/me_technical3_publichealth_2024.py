"""ME Technical Paper III (Subject Specialisation Paper), Public Health, BCSE 2024 - real paper (PDF sent by the founder).
Standard pattern, same as the 2025 Public Health paper (the latest). Part II was printed as 6 + 3 + 2 + 9 marks; it is
re-marked to the 2025 layout of four short answers x 5 (founder rule: older years follow the latest layout and marks).
Replaced MCQs (no single defensible answer): 7 ('EXCEPT' with 'all of the above'), 9, 12 (OR 3.0 weak vs strong),
18, 23 (IHR notification), 25 (ozone depletion and UV are not strictly climate-change effects).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Public Health): BCSE 2024, batch 1"
GROUP_TAG = "ph2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "public-health"
ADDS_TO_PAPER = True  # 2025 is the latest Public Health paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Public Health"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following is NOT a core function of public health?",
"opts": [
"Health promotion and disease prevention",
"Healthcare delivery",
"Surveillance and monitoring of health threats",
"Policy development to improve health outcomes"
]
},
{
"n": 2,
"stem": "The World Health Organization (WHO) focuses on all of the following EXCEPT:",
"opts": [
"Eradicating infectious diseases",
"Promoting mental health awareness",
"Providing individual medical care",
"Monitoring global health trends"
]
},
{
"n": 3,
"stem": "The Ottawa Charter for Health Promotion emphasizes the importance of:",
"opts": [
"Technological advancements in medicine",
"Creating healthy public policies",
"Focusing solely on individual behavior change",
"Limiting access to unhealthy foods and beverages"
]
},
{
"n": 4,
"stem": "The Bradford Hill criteria are used to assess:",
"opts": [
"Causality between a suspected risk factor and a disease.",
"The effectiveness of an intervention.",
"The validity of a diagnostic test.",
"The generalizability of research findings."
]
},
{
"n": 5,
"stem": "The dependent variable in a research study is the one that is:",
"opts": [
"Measured or observed.",
"Manipulated by the researcher.",
"Both A and B.",
"Neither A nor B."
]
},
{
"n": 6,
"stem": "When conducting a literature review, the goal is to:",
"opts": [
"Find one perfect source to answer your research question.",
"Identify and critically evaluate existing research on your topic.",
"Summarize all the information you find",
"Focus only on the most recent research."
]
},
{
"n": 7,
"stem": "The definition of epidemiology includes all of the following EXCEPT;",
"opts": [
"Study of determinants of health-related events",
"Study of distribution of health-related events",
"Application to control public health problems",
"All of the above"
]
},
{
"n": 8,
"stem": "Which of the following is NOT a measure of disease frequency?",
"opts": [
"Incidence",
"Case fatality rate",
"Prevalence",
"Attack rate"
]
},
{
"n": 9,
"stem": "The difference between the incidence and prevalence of a disease tells us about:",
"opts": [
"The proportion of new cases in a population over time",
"The severity of the disease",
"The speed of disease transmission",
"The number of existing cases in a population"
]
},
{
"n": 10,
"stem": "A study follows a group of individuals forward in time to assess risk factors for a specific disease. This is an example of which epidemiological study design?",
"opts": [
"Case-control study",
"Cross-sectional study",
"Cohort study",
"Ecological study"
]
},
{
"n": 11,
"stem": "A case-control study is most useful for:",
"opts": [
"Determining the incidence of a disease.",
"Identifying potential risk factors for a disease.",
"Studying the natural history of a disease.",
"Evaluating the effectiveness of an intervention."
]
},
{
"n": 12,
"stem": "An odds ratio (OR) of 3.0 for exposure to a risk factor suggests:",
"opts": [
"No association between exposure and disease.",
"A weak positive association.",
"A strong positive association.",
"A protective effect of exposure"
]
},
{
"n": 13,
"stem": "When conducting health research, which principle ensures that a study measures what it is intended to measure?",
"opts": [
"Reliability",
"Generalizability",
"Sensitivity",
"Validity"
]
},
{
"n": 14,
"stem": "In a screening test, a high sensitivity means the test is good at identifying:",
"opts": [
"True negative cases",
"True positive cases",
"False positive cases",
"False negative cases"
]
},
{
"n": 15,
"stem": "A health education program focuses on teaching teenagers about the negative health consequences of smoking. This program is most aligned with which level of prevention?",
"opts": [
"Tertiary Prevention",
"Secondary Prevention",
"Primary Prevention",
"Health Education is not considered prevention"
]
},
{
"n": 16,
"stem": "When a large portion of a population is immune to a disease, it reduces the likelihood of susceptible individuals encountering infected individuals. This is known as:",
"opts": [
"Herd immunity",
"Active immunity",
"Passive immunity",
"Specificity"
]
},
{
"n": 17,
"stem": "Surveillance is an essential tool for:",
"opts": [
"Identifying disease outbreaks.",
"Monitoring trends in disease burden.",
"Evaluating the effectiveness of public health interventions.",
"All of the above."
]
},
{
"n": 18,
"stem": "Which of the following best describes the difference between health promotion and disease prevention?",
"opts": [
"Health promotion focuses on individual risk factors, while disease prevention focuses on entire populations.",
"Disease prevention is always more effective than health promotion.",
"Health promotion aims to prevent disease, while disease prevention focuses on early detection and treatment",
"There is no real difference between the two concepts."
]
},
{
"n": 19,
"stem": "Public health interventions to reduce childhood obesity might focus on:",
"opts": [
"Increasing access to processed foods",
"Promoting physical activity in schools",
"Limiting regulations on fast food advertising",
"Encouraging sugary drinks as a source of energy"
]
},
{
"n": 20,
"stem": "Which of the following is one disadvantage of passive public health surveillance system?",
"opts": [
"It provides real-time data on disease outbreaks.",
"Underreporting of cases can occur.",
"It requires a significant investment of resources.",
"It is not well-suited for monitoring chronic diseases."
]
},
{
"n": 21,
"stem": "Effective communication strategies are essential for promoting healthy behaviors and reducing NCD risk. These strategies should be:",
"opts": [
"Culturally appropriate and tailored to the target audience",
"Evidence-based and clear",
"Engaging and interactive",
"All of the above"
]
},
{
"n": 22,
"stem": "A public health professional notices a cluster of foodborne illness cases in a specific town. This observation is most likely indicative of an:",
"opts": [
"Sporadic case",
"Pandemic",
"Epidemic",
"Endemic disease"
]
},
{
"n": 23,
"stem": "A country is obligated to notify WHO under the IHR of:",
"opts": [
"Only public health emergencies of international concern (PHEICs).",
"Any case of a common infectious disease like influenza.",
"Any outbreak exceeding a specific threshold for a particular disease.",
"All cases of diseases subject to travel restrictions."
]
},
{
"n": 24,
"stem": "The primary purpose of an occupational safety and health program is to:",
"opts": [
"Increase worker productivity",
"Reduce absenteeism due to illness",
"Prevent work-related injuries and illnesses",
"Improve company profits"
]
},
{
"n": 25,
"stem": "What is a major public health concern associated with climate change?",
"opts": [
"Increased risk of vector-borne diseases",
"Depletion of the ozone layer",
"Exposure to harmful ultraviolet radiation",
"All of the above"
]
},
{
"n": 26,
"stem": "Bhutan's traditional medicine system, known as Sowa Rigpa, is:",
"opts": [
"Gradually being phased out in favor of modern medicine",
"Integrated into the national healthcare system alongside modern medicine",
"Neglected due to lack of scientific evidence",
"Only practiced by religious figures"
]
},
{
"n": 27,
"stem": "Bhutan's national lockdown strategy during the COVID-19 pandemic was primarily focused on:",
"opts": [
"Isolating positive cases",
"Encouraging herd immunity",
"Restricting movement to limit transmission",
"Prioritizing economic activity"
]
},
{
"n": 28,
"stem": "A veterinarian in Bhutan notices a recent increase in unusual cattle deaths. Which of the following actions is MOST appropriate?",
"opts": [
"Report the outbreak to public health authorities for investigation",
"Ignore the outbreak as it is likely not a public health concern",
"Continue treating cattle with existing medications",
"Advise farmers to sell their cattle immediately"
]
},
{
"n": 29,
"stem": "The EPI program in Ministry of Health Bhutan is an example of which public health strategy?",
"opts": [
"Treatment of infectious diseases",
"Preventive healthcare",
"Health education campaigns",
"Hospital-based care"
]
},
{
"n": 30,
"stem": "Bhutan is working towards achieving Universal Health Coverage (UHC). This means:",
"opts": [
"Everyone has access to essential healthcare services without financial hardship.",
"Only citizens have access to healthcare services.",
"Main emphasis of focus is on preventive healthcare",
"Prioritizes specialized care over basic services."
]
}
]"""

KEY = {
    1: ("b", "Core public health functions are assessment, policy development and assurance (promotion, prevention, surveillance); direct healthcare delivery is a clinical service."),
    2: ("c", "WHO sets norms, leads global health action and monitors trends; it does not provide individual medical care."),
    3: ("b", "Building healthy public policy is one of the Ottawa Charter's five action areas."),
    4: ("a", "Bradford Hill criteria (strength, consistency, temporality, dose-response, etc.) assess causation."),
    5: ("a", "The dependent variable is the outcome that is measured; the independent variable is manipulated."),
    6: ("b", "A literature review identifies and critically evaluates existing research."),
    8: ("b", "Case fatality rate measures severity (deaths among cases), not how often disease occurs."),
    10: ("c", "Following people forward in time from exposure to outcome is a cohort study."),
    11: ("b", "Case-control studies efficiently identify risk factors, especially for rare diseases."),
    13: ("d", "Validity: the study or tool measures what it intends to measure."),
    14: ("b", "Sensitivity is the ability to correctly identify those with the disease (true positives)."),
    15: ("c", "Preventing smoking before disease develops is primary prevention."),
    16: ("a", "Herd immunity: immunity in a large proportion of the population protects the susceptible."),
    17: ("d", "Surveillance detects outbreaks, monitors trends and evaluates interventions."),
    19: ("b", "Promoting physical activity in schools is an evidence-based obesity intervention."),
    20: ("b", "Passive surveillance relies on routine reports from providers, so under-reporting is common."),
    21: ("d", "Health communication should be culturally appropriate, evidence-based, clear and engaging."),
    22: ("c", "A cluster of cases above expected numbers in one place is an epidemic (outbreak)."),
    24: ("c", "Occupational safety and health programmes aim to prevent work-related injuries and illnesses."),
    26: ("b", "Bhutan integrates traditional medicine (Sowa Rigpa) with modern medicine in its national health system."),
    27: ("c", "Lockdowns restricted movement to limit transmission."),
    28: ("a", "Unusual animal deaths may signal a zoonotic threat: report for joint investigation (One Health)."),
    29: ("b", "Immunisation (Expanded Programme on Immunization) is preventive healthcare."),
    30: ("a", "UHC: everyone can use the essential health services they need without financial hardship."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "Which study design provides the strongest evidence of a cause-and-effect relationship?", ["Case report", "Cross-sectional study", "Randomised controlled trial", "Ecological study"], "c",
            "Randomisation balances confounders, so RCTs give the strongest causal evidence among single studies."),
    new_mcq(2, T, "In a stable situation, prevalence is approximately equal to", ["incidence x average duration of disease", "incidence / mortality", "incidence - case fatality", "attack rate x population"], "a",
            "P ≈ I x D: longer-lasting diseases have higher prevalence for the same incidence."),
    new_mcq(3, T, "The specificity of a screening test is its ability to correctly identify", ["people with the disease", "people without the disease", "all positive results", "the prevalence"], "b",
            "Specificity = true negatives / all without disease."),
    new_mcq(4, T, "The 'iceberg of disease' concept means that", ["most diseases are seasonal", "the hidden (undiagnosed or subclinical) cases far outnumber the visible clinical cases", "only severe cases matter", "diseases spread from cold regions"], "b",
            "The submerged part of the iceberg represents undiagnosed, subclinical and carrier cases."),
    new_mcq(5, T, "The measure of association usually calculated in a cohort study is the", ["odds ratio only", "relative risk", "prevalence ratio of cases only", "case fatality rate"], "b",
            "Cohort studies measure incidence in exposed and unexposed groups, giving the relative risk."),
    new_mcq(6, T, "The Alma-Ata Declaration of 1978 is associated with", ["primary health care", "tobacco control", "the eradication of smallpox", "the International Health Regulations"], "a",
            "Alma-Ata declared primary health care the key to 'Health for All'."),
]

SA = [
    ("What is the epidemiological triad, and how does it apply to understanding communicable diseases? (5 marks)",
     [("Triad: agent (pathogen - virulence, infectivity, dose), host (age, immunity, nutrition, behaviour, genetics), environment (physical, biological - vectors, social: crowding, sanitation); disease results from their interaction; vector/ time sometimes added", 3),
      ("Application with an example (e.g. malaria, TB, diarrhoea): explains transmission, guides control by acting on agent (treatment, disinfection), host (vaccination, nutrition), environment (water, sanitation, vector control)", 2)],
     "The epidemiological triad is a model of disease causation in which disease results from the interaction of three components: the agent (the cause - for communicable diseases a pathogen such as a virus, bacterium or parasite, with its infectivity, virulence and dose); the host (the human who can be infected - age, sex, immunity, nutrition, genetics, behaviour); and the environment (external factors that bring agent and host together - climate, water, sanitation, crowding, housing, vectors, socio-economic conditions). Vectors and time are sometimes added. Application: it explains why disease occurs and how it spreads, and shows where to intervene. For example, in malaria the agent is Plasmodium, the host is a non-immune person, and the environment includes Anopheles mosquitoes and stagnant water; control targets the agent (prompt treatment), the host (bed nets, prophylaxis) and the environment (indoor residual spraying, removing breeding sites). Breaking any link of the triad can prevent disease."),
    ("Briefly explain the concept of contact tracing in the context of communicable disease control. (5 marks)",
     [("Definition: identifying, listing and following up people who have been in contact with an infected person (index case) during the infectious period", 2),
      ("Steps and purpose: case interview, contact identification, notification, quarantine/ testing/ prophylaxis/ treatment, monitoring for symptoms; breaks transmission chains (e.g. TB, COVID-19, Ebola, STIs); confidentiality", 3)],
     "Contact tracing is the process of identifying, assessing and managing people who have been exposed to a person with an infectious disease (the index case) so as to prevent further transmission. Steps: (1) interview the confirmed case to identify everyone they were in close contact with during the infectious period; (2) list and locate the contacts and inform them of possible exposure, confidentially; (3) assess and manage them - testing, quarantine or isolation, post-exposure prophylaxis or vaccination, or treatment; (4) monitor contacts for symptoms for the incubation period and test those who become ill, tracing their contacts in turn. It breaks chains of transmission, finds cases early, and is used for TB, COVID-19 (widely used in Bhutan), measles, Ebola and sexually transmitted infections."),
    ("Define and differentiate between passive and active public health surveillance systems. (5 marks)",
     [("Passive: health facilities routinely report notifiable diseases to the health authority without being prompted; cheap, wide coverage, but under-reporting, incomplete, delayed", 2.5),
      ("Active: the health authority actively seeks cases (visits, calls, record searches, case finding); more complete and timely but costly, used in outbreaks, elimination programmes (e.g. AFP for polio)", 2.5)],
     "Passive surveillance: health facilities and providers report cases of notifiable diseases to the health authority routinely, on their own initiative, using standard forms or electronic systems (e.g. the national notifiable disease reporting system). It is simple, inexpensive and covers many diseases and areas, but suffers from under-reporting, incomplete data and delays. Active surveillance: the health authority regularly and actively seeks out cases - by visiting facilities, telephoning providers, reviewing records, house-to-house case finding or sentinel sites. It gives more complete, accurate and timely data but needs more staff and money, so it is used for specific purposes such as outbreak investigation, disease elimination and eradication programmes (e.g. acute flaccid paralysis surveillance for polio, measles elimination) and special studies."),
    ("List and briefly explain three strategies used in NCD prevention and control. (5 marks)",
     [("Three strategies explained, e.g. (1) health promotion and risk factor reduction - tobacco, alcohol, diet, physical activity (policies: taxes, bans, labelling - WHO best buys); (2) early detection/ screening and management at primary care (WHO PEN - BP, diabetes, cancer screening); (3) surveillance/ monitoring (STEPS), multisectoral action and health system strengthening", 5)],
     "1. Health promotion and reducing risk factors: tackle tobacco use, harmful alcohol use, unhealthy diet and physical inactivity through policies and education - tobacco and alcohol taxes and bans, salt reduction, food labelling, promoting physical activity and healthy diets in schools and workplaces (WHO 'best buys'). 2. Early detection and management in primary health care: screening for hypertension, diabetes and cancers (cervical, breast, oral) and providing treatment and follow-up using packages such as the WHO Package of Essential NCD interventions (PEN) at primary health centres, plus ensuring essential medicines. 3. Surveillance, research and multisectoral action: monitor risk factors and NCDs through surveys such as STEPS, set national targets and action plans, and engage sectors beyond health (education, agriculture, trade, transport, urban planning) and communities."),
]
for i, (s, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=5, topic=T, stem=s, key_points=kp, model=mod))

C1 = """Case I: Health determinants and health promotion
Health determinants and promotion are two sides of the same coin which work together to influence the overall health and well-being of individuals and communities. Health determinants influence health promotion activities. These are the various factors that influence a person's health status. By understanding and addressing the various determinants of health, and implementing effective health promotion strategies, we can create a society where everyone has the opportunity to live a healthy life."""
C2 = """Case II: Epidemiology and research
Epidemiology and research are the cornerstones of public health. Epidemiology provides the foundation for public health action by identifying health problems and their causes. Public health research builds on this knowledge by developing and testing solutions to these problems. This combined approach allows public health professionals to target interventions effectively, leading to improved health outcomes for communities."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("ph2024", 1, T, C1, items=[
    it("1. Discuss the concept of the social determinants of health (SDOH) and how they influence population health outcomes. Provide specific examples of how SDOH can impact health disparities.", 20,
       [("Concept: conditions in which people are born, grow, live, work and age, shaped by distribution of money, power and resources (WHO CSDH); structural vs intermediary determinants; Dahlgren-Whitehead rainbow", 6),
        ("Domains and pathways: income/ poverty, education, employment/ working conditions, housing, water and sanitation, food security, social support/ inclusion, gender, access to health care, environment; act via material conditions, behaviours, psychosocial stress, access", 7),
        ("Examples of disparities: rural-urban access, poverty and child stunting/ malnutrition, education and maternal/ child mortality, crowding and TB, gender and violence, unemployment and mental health/ alcohol; Bhutan context; need for intersectoral action/ health in all policies", 7)],
       "Concept: the social determinants of health are the non-medical conditions in which people are born, grow, live, work and age, and the wider forces (economic policies, social norms, political systems) that shape these conditions (WHO Commission on Social Determinants of Health, 2008). Structural determinants - income, education, occupation, social class, gender and ethnicity - determine people's position in society; intermediary determinants - living and working conditions, housing, food, water and sanitation, psychosocial factors, behaviours and access to health care - translate that position into health. The Dahlgren-Whitehead 'rainbow' shows layers from individual factors to lifestyle, social networks, living and working conditions and broad socio-economic, cultural and environmental conditions. Influence on outcomes: SDOH explain most differences in health between and within countries; they act through material conditions (nutrition, housing), behaviours (smoking, alcohol, diet), chronic stress and access to services, producing a social gradient - the lower the position, the worse the health. Examples of disparities: (1) poverty - poor households have more child stunting and malnutrition and cannot afford travel to care; (2) education - children of mothers with little education have higher infant mortality and lower immunisation; (3) geography - remote rural communities in Bhutan have longer travel times to hospitals, affecting maternal and emergency care; (4) housing and crowding - higher TB and respiratory infections; (5) water and sanitation - diarrhoeal disease; (6) gender - violence against women and unequal decision-making; (7) unemployment - youth mental health problems, alcohol and drug use; (8) occupation - injuries and exposures among construction and hydropower workers. Addressing them requires intersectoral action and 'health in all policies' (in Bhutan, linked to GNH)."),
    it("2. Explain the core principles of health promotion and provide examples of each.", 15,
       [("Principles (Ottawa Charter 5 action areas): build healthy public policy, create supportive environments, strengthen community action, develop personal skills, reorient health services; prerequisites and strategies enable, mediate, advocate", 8),
        ("Examples for each (e.g. tobacco control act, smoke-free/ healthy schools, community health groups/ village health workers, life skills and health education, primary care focused on prevention/ PEN); also equity, empowerment, participation, intersectoral, sustainability", 7)],
       "Health promotion is 'the process of enabling people to increase control over, and to improve, their health' (Ottawa Charter, 1986). Its core strategies are to advocate, enable and mediate, and its five action areas/principles are: (1) Build healthy public policy - laws and policies that make healthy choices easier, e.g. Bhutan's Tobacco Control Act, alcohol taxes, salt and sugar policies, helmet and seat-belt laws. (2) Create supportive environments - physical and social settings that support health, e.g. smoke-free public places, healthy schools with clean water and toilets, safe walking paths and open-air gyms. (3) Strengthen community action - empowering communities to set priorities and act, e.g. village health workers, community-led total sanitation, youth groups running anti-drug campaigns. (4) Develop personal skills - information, education and life skills, e.g. school health education on nutrition, sexual and reproductive health, mental health literacy, cooking demonstrations. (5) Reorient health services - from treatment towards prevention and promotion, e.g. NCD screening and counselling at primary health centres, health promotion units in hospitals. Underlying principles are equity, empowerment, participation, intersectoral collaboration, a holistic view of health, and sustainability."),
    it("3. Discuss the role of health communication in promoting healthy behaviours. How can health communication be tailored to different target audiences?", 15,
       [("Role: raises awareness and knowledge, changes attitudes and norms, motivates and reinforces behaviour, demonstrates skills, promotes services, counters misinformation, supports policy (advocacy), risk communication in emergencies; theories (health belief model, stages of change)", 7),
        ("Tailoring: audience analysis/ segmentation, culturally and linguistically appropriate (Dzongkha, local languages), literacy, age (youth - social media, peers; elderly - radio, face-to-face), gender, rural/ urban channels, trusted messengers (religious figures, local leaders), pre-testing, two-way participatory, evaluation", 8)],
       "Role of health communication: it informs and educates people about health risks and benefits, raises awareness, shapes attitudes and social norms, motivates people to adopt and maintain healthy behaviours (e.g. quitting tobacco, eating healthily, getting vaccinated), teaches skills, promotes the use of services (screening, ANC), counters misinformation, advocates for supportive policies, and provides risk communication during emergencies (as during COVID-19). It works best when based on behaviour change theories (health belief model, stages of change, social cognitive theory) and combined with other interventions. Tailoring to audiences: (1) audience research and segmentation - understand each group's knowledge, beliefs, needs, literacy and preferred channels; (2) culturally appropriate messages in the right language (Dzongkha, Sharchopkha, Lhotshamkha, English) using local examples and values; (3) age-appropriate approaches - youth through social media, influencers, peer educators and schools; adults through workplaces and TV; elderly and rural people through radio, community meetings and face-to-face talks by health workers; (4) gender-sensitive messages and channels; (5) trusted messengers - religious figures, local leaders, teachers and health workers; (6) simple, clear, pictorial materials for low-literacy groups; (7) pre-testing materials with the audience and using two-way, participatory communication; (8) monitoring and evaluating reach and impact and adjusting."),
])
Q += case("ph2024", 2, T, C2, items=[
    it("1. Explain the core principles of epidemiology and how they are used to investigate and control disease outbreaks.", 15,
       [("Core principles: distribution (person, place, time - descriptive), determinants (analytic - causes, risk factors), frequency measures (incidence, prevalence, attack rates), comparison/ association, population focus, causation, application to control", 7),
        ("Outbreak investigation steps: prepare, confirm outbreak and diagnosis, case definition, case finding, descriptive epidemiology (epi curve, maps, person characteristics), hypotheses, analytic study (case-control/ cohort), control measures, communicate findings, surveillance/ evaluation", 8)],
       "Core principles: epidemiology studies the distribution and determinants of health-related states in specified populations and applies this to control health problems. (1) Population focus - the community is the patient. (2) Distribution - descriptive epidemiology by person (age, sex, occupation), place and time. (3) Frequency measures - counts, incidence, prevalence, attack rates, mortality. (4) Determinants - analytic epidemiology compares groups to find risk factors and causes (measures of association: relative risk, odds ratio), considering bias, confounding and chance, and judging causation (Bradford Hill). (5) Application - using findings to prevent and control disease. Use in outbreaks: (1) prepare for fieldwork; (2) confirm the outbreak (cases above expected) and verify the diagnosis with laboratory tests; (3) set a case definition; (4) find and count cases (line list); (5) describe the outbreak by time (epidemic curve showing source type), place (spot map) and person; (6) develop hypotheses about source and mode of transmission; (7) test them with analytic studies (case-control or cohort, e.g. food-specific attack rates); (8) implement control and prevention measures (remove the source, treat cases, isolate, vaccinate, improve water and food hygiene) - often early, alongside investigation; (9) communicate findings and recommendations; (10) maintain surveillance to confirm the outbreak has ended and evaluate measures."),
    it("2. Explain the role of epidemiology in public health research. Discuss how epidemiological studies can be used to inform interventions aimed at improving population health.", 15,
       [("Role: measure burden and trends, identify causes/ risk factors, natural history, identify high-risk groups, evaluate interventions and services, provide evidence for policy and planning; study designs (descriptive, cross-sectional, case-control, cohort, RCT)", 7),
        ("Informing interventions with examples: smoking-lung cancer → tobacco control; STEPS survey → NCD programmes; trials → vaccines; surveillance → targeted malaria/ TB control; evaluation of programmes; priority setting and resource allocation", 8)],
       "Role of epidemiology in public health research: it measures the burden, distribution and trends of diseases (descriptive studies, surveillance, cross-sectional surveys); identifies causes and risk factors (case-control and cohort studies); describes the natural history and prognosis of disease; identifies high-risk groups; tests interventions (randomised controlled trials, community trials) and evaluates programmes and health services; and provides the evidence base for policy, planning and resource allocation. Informing interventions: (1) cohort and case-control studies linking smoking to lung cancer and heart disease led to tobacco control laws and taxes; (2) risk factor surveys such as the WHO STEPS survey show the prevalence of hypertension, raised blood sugar, alcohol and tobacco use in Bhutan, guiding NCD screening and health promotion priorities; (3) vaccine trials and surveillance data shape immunisation schedules (e.g. HPV vaccination to prevent cervical cancer); (4) mapping malaria and TB cases directs vector control and case finding to high-risk districts; (5) nutrition surveys revealing stunting and anaemia lead to fortification and supplementation programmes; (6) evaluation studies show which programmes work and allow them to be improved, scaled up or stopped. Thus epidemiology turns data into targeted, cost-effective action."),
    it("3. Identify an area of public health research that interests you, with brief justifications. Explain how your research skills and knowledge could be applied to conduct a study and contribute to this field.", 20,
       [("A relevant research area identified (e.g. NCD risk factors, mental health/ suicide, alcohol use, maternal and child nutrition, road safety, climate and health in Bhutan) with justification: burden, gaps in evidence, national priorities", 6),
        ("Study plan: research question and objectives, design (e.g. cross-sectional/ case-control/ cohort/ mixed methods), population and sampling, sample size, data collection tools, variables, analysis plan (statistics/ software), ethics (approval, consent, confidentiality)", 9),
        ("Contribution: application of skills (epidemiology, biostatistics, data management, literature review, report writing), dissemination to policy makers, how findings inform programmes; feasibility and limitations", 5)],
       "Example: Area - harmful alcohol use among adults in Bhutan. Justification: alcohol-related liver disease is a major cause of hospital deaths and illness, alcohol is linked to road traffic injuries, domestic violence and mental health problems, and there are gaps in evidence about drinking patterns and their drivers in different communities; it is a national health priority. Study plan: research question - what is the prevalence of harmful alcohol use and its associated factors among adults aged 18-69 in a selected Dzongkhag? Objectives - estimate prevalence using AUDIT, identify socio-demographic and social factors, and assess awareness of services. Design - community-based cross-sectional study with a qualitative component (focus groups) to understand cultural drivers. Population and sampling - multistage cluster sampling of households; sample size by formula n = z²p(1-p)/d² with design effect and non-response (about 400-600). Data collection - trained enumerators using a structured questionnaire on tablets (KoboToolbox) with AUDIT, demographic and social variables. Analysis - descriptive statistics, prevalence with 95% CI, chi-square tests and multivariable logistic regression in Stata or R; thematic analysis for qualitative data. Ethics - approval from the Research Ethics Board of Health, informed consent, confidentiality, referral of people with alcohol problems to services. Contribution: I would apply my skills in epidemiological study design, biostatistics, data management, literature review and report writing; share findings with the Ministry of Health, Dzongkhag health sector and BNCA through reports, policy briefs and publications; and help design targeted interventions such as brief interventions in primary care, community awareness and policy measures (licensing, taxation). Limitations such as self-reporting bias would be acknowledged."),
])
PATTERN = STANDARD
