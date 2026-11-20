"""ME Technical Paper III (Subject Specialisation Paper), Public Health, BCSE 2025 - real paper (PDF sent by the founder).
Standard pattern. Replaced MCQs on Bhutan statistics that could not be verified (5 sanitation %, 14 national health
accounts, 21 MMR 2023, 27 adolescent mental health 2025) and MCQ 30 (five options, 'all of the above'). Half-mark
sub-parts in Part II are combined into whole-mark parts. SAQ 3a (number of notifiable diseases) is flagged: check the
current RCDC list. Case I shows the epidemic curve figures; Case II shows the Bhutan causes-of-death chart.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Public Health): BCSE 2025, batch 1"
GROUP_TAG = "ph2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "public-health"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Public Health", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Public Health"

MCQ = r"""[
{
"n": 1,
"stem": "Which measure best describes the risk of developing a disease in a population over time?",
"opts": [
"Prevalence",
"Incidence rate",
"Case-fatality rate",
"Odds ratio"
]
},
{
"n": 2,
"stem": "The generic measure of disease burden, including both the quality and the quantity of life lived refers to:",
"opts": [
"DALY",
"QALY",
"YLL",
"YLD"
]
},
{
"n": 3,
"stem": "Association of mine workers and silicosis of lungs (an occupational lung disease among miners) was observed repeatedly by different persons, in different places, at different times, and using different methods. Which Bradford Hill criterion does this best illustrate?",
"opts": [
"Analogy",
"Plausibility",
"Consistency",
"Specificity"
]
},
{
"n": 4,
"stem": "The ability of a test to correctly identify the proportion of individuals who have a specific disease or condition, thereby accurately identify most people who are sick, reducing the likelihood of missing cases.",
"opts": [
"True negative rate",
"False negative rate",
"True positive rate",
"False positive rate"
]
},
{
"n": 5,
"stem": "According to the UNICEF Bhutan, what percent of the Bhutanese population have access to basic sanitation services?",
"opts": [
"63%",
"73%",
"83%",
"93%"
]
},
{
"n": 6,
"stem": "A very small airborne solid particles or liquid particles suspended in the air like smoke, soot, dust, and chemicals that can be inhaled deep into the lungs and cause various health problems. Which of the following measures of air pollution level is referred to?",
"opts": [
"PM2.5",
"PM10",
"Nitrogen Dioxide (NO2)",
"Carbon Monoxide (CO)"
]
},
{
"n": 7,
"stem": "Which of the following best describes the role of Health Promotion and Behavioral Sciences in public health?",
"opts": [
"Monitoring disease outbreaks and enforcing health laws",
"Conducting surgical procedures and prescribing medications",
"Understanding health behaviors, designing behavior change strategies, and engaging communities",
"Managing hospital administration and budgeting"
]
},
{
"n": 8,
"stem": "Which of the following are the three strategic priorities of the World Health Organization (WHO) in Bhutan?",
"opts": [
"Expanding hospital infrastructure, increasing medical tourism, and promoting herbal medicine exports",
"Strengthening health systems for UHC, building national capacities for public health security, and managing major diseases",
"Privatizing healthcare services, reducing immunization campaigns, and outsourcing surveillance functions",
"Promoting traditional healing systems, building regional trade agreements, and establishing medical colleges"
]
},
{
"n": 9,
"stem": "Which of the following statements best reflects the budgeting principles and health financing approach in Bhutan?",
"opts": [
"Bhutan follows a fully privatized health financing system with minimal government input.",
"Health financing in Bhutan is based on out-of-pocket payments and voluntary insurance schemes.",
"Bhutan follows a publicly funded model with health care provided free at the point of delivery, primarily financed through general taxation and external grants.",
"Bhutan allocates less than 2% of its national budget to health care, relying solely on donor support."
]
},
{
"n": 10,
"stem": "A Health Assistant in a Primary Health Centre (PHC) at Nagor in Silambi in Mongar District is delivering preventive measures for communicable and non-communicable diseases through comprehensive school health programs and outreach health camps. This is an example of:",
"opts": [
"Curative health service",
"Preventive and promotive health service",
"Emergency response service",
"Rehabilitative service"
]
},
{
"n": 11,
"stem": "Which is a key element of the primary health care approach?",
"opts": [
"Hospital-based care",
"Specialist services",
"Community participation",
"Expensive technologies"
]
},
{
"n": 12,
"stem": "The Gross National Happiness (GNH) framework in Bhutan integrates health under which pillar?",
"opts": [
"Good Governance",
"Sustainable Socio-economic Development",
"Preservation of Culture",
"Conservation of Environment"
]
},
{
"n": 13,
"stem": "Bhutan’s current health expenditure is approximately 4 to 4.5% of GDP. According to the Abuja Declaration of 2001, what percentage of the annual budget should be allocated to the improvement of the health sector?",
"opts": [
"10 %",
"15%",
"20%",
"30%"
]
},
{
"n": 14,
"stem": "Which types of disease and programs are consuming the largest share of health expenditure currently, as per the national health accounts, MoH, Bhutan?",
"opts": [
"Infectious disease followed by NCDs and reproductive health care.",
"Non-communicable diseases (NCDs) followed by reproductive health care and infectious diseases.",
"Reproductive health care, followed by NCDs and infectious disease.",
"HIV, TB and Malaria."
]
},
{
"n": 15,
"stem": "What is herd immunity?",
"opts": [
"Vaccinating only vulnerable groups",
"Immunity from past infections",
"Protection of unvaccinated people due to high community immunity",
"A method for treating disease"
]
},
{
"n": 16,
"stem": "The main aim of outbreak investigation is to:",
"opts": [
"Blame the source",
"Find patient zero",
"Control the outbreak",
"Publish data"
]
},
{
"n": 17,
"stem": "Which level of prevention involves vaccination?",
"opts": [
"Primary",
"Secondary",
"Tertiary",
"Quaternary"
]
},
{
"n": 18,
"stem": "Most common diarrheal agent for infant is:",
"opts": [
"Rhino virus",
"Rota virus",
"Enterovirus",
"E. coli"
]
},
{
"n": 19,
"stem": "Which vitamin deficiency is a major cause of preventable childhood blindness?",
"opts": [
"Vitamin A",
"Vitamin B12",
"Vitamin C",
"Vitamin D"
]
},
{
"n": 20,
"stem": "Bhutan achieved IDD elimination in 2003, but ongoing monitoring is needed to ensure this status is maintained. Iodine surveillance in community is done by:",
"opts": [
"Testing iodine secretion in urine",
"Measuring iodine from packets",
"Analysis of goiter prevalence",
"Data collection"
]
},
{
"n": 21,
"stem": "According to the National Health Survey report, 2023, what is the current maternal mortality ratio in Bhutan?",
"opts": [
"53 per 1000 live births.",
"53 per 100000 live births.",
"89 per 1000 live births.",
"89 per 100000 live births"
]
},
{
"n": 22,
"stem": "Calculating formula of General Fertility Rate (GFR):",
"opts": [
"No. of live birth /Population of women of reproductive age (15-49yrs) *1000",
"No. of live birth /Population of married women of reproductive age (15-49yrs) *1000",
"No. of live birth /Total population of women*1000",
"No. of live birth /Population of women of reproductive age (15-49 yrs) *100000"
]
},
{
"n": 23,
"stem": "What is the recommended minimum number of ANC visits according to WHO?",
"opts": [
"Two",
"Three",
"Four",
"Eight"
]
},
{
"n": 24,
"stem": "The very important variable for assessing nutrition of under 5 children is/are:",
"opts": [
"Weight",
"Height",
"Age",
"All of above"
]
},
{
"n": 25,
"stem": "Which of the following is the leading cause of premature death among adults worldwide in recent years?",
"opts": [
"Road Traffic accidents",
"Ischemic Heart Diseases (CVDs)",
"Tuberculosis",
"COPD"
]
},
{
"n": 26,
"stem": "Identify a pair of cancers with a risk factors linked to infectious agents from the following:",
"opts": [
"Lungs and Liver cancers.",
"Cervical and Breast Cancers.",
"Stomach and Cervical Cancers",
"Head and Neck cancers."
]
},
{
"n": 27,
"stem": "Which mental health condition is most prevalent among adolescents in Bhutan according to Annual Health Bulletin 2025?",
"opts": [
"Schizophrenia",
"Anxiety disorder",
"Depression",
"Bipolar disorder"
]
},
{
"n": 28,
"stem": "One Health is a collaborative approach to:",
"opts": [
"Human health only",
"Animal welfare only",
"Environmental sustainability",
"Human, animal, and environmental health"
]
},
{
"n": 29,
"stem": "The introduction of Bhutan’s electronic Patient Information System (ePIS) can improve health equity primarily by:",
"opts": [
"Providing equal access to accurate patient health records across all health facilities, including rural areas",
"Limiting health services to those living in urban centers with internet access",
"Prioritizing high-income patients in data management",
"Restricting the sharing of patient data between healthcare providers"
]
},
{
"n": 30,
"stem": "Collaboration between allopathic (modern) medicine/Doctors and traditional medicine/Drungtshos is important in order to achieve which of the following goals?",
"opts": [
"Improve healthcare service coverage and accessibility",
"Integrate diverse medical knowledge for holistic patient care",
"Enhance patient trust and cultural acceptance of treatments",
"Strengthen national health systems and achieve Universal Health Coverage (UHC) e) All of the above"
]
}
]"""

KEY = {
    1: ("b", "Incidence rate measures the risk of new disease over time."), 2: ("a", "DALY combines years of life lost and years lived with disability."),
    3: ("c", "Repeated findings by different people, places and methods = consistency."), 4: ("c", "Sensitivity is the true positive rate."),
    6: ("a", "PM2.5 particles are fine enough to reach deep into the lungs."), 7: ("c", "Health promotion and behavioural sciences focus on behaviour change and community engagement."),
    8: ("b", "WHO priorities in Bhutan: UHC health systems, health security capacity and major diseases."), 9: ("c", "Bhutan provides free health care at the point of delivery, financed mainly by government revenue and grants."),
    10: ("b", "School health and outreach camps are preventive and promotive services."), 11: ("c", "Community participation is a key principle of primary health care."),
    12: ("b", "Health falls under sustainable and equitable socio-economic development."), 13: ("b", "The Abuja Declaration target is 15% of the annual budget."),
    15: ("c", "Herd immunity protects unvaccinated people when community immunity is high."), 16: ("c", "The main aim of outbreak investigation is to control the outbreak and prevent recurrence."),
    17: ("a", "Vaccination is primary prevention."), 18: ("b", "Rotavirus is the commonest cause of infant diarrhoea."),
    19: ("a", "Vitamin A deficiency is a major cause of preventable childhood blindness."), 20: ("a", "Urinary iodine excretion is the main indicator of population iodine status."),
    22: ("a", "GFR = live births / women aged 15-49 x 1000."), 23: ("d", "WHO (2016) recommends at least eight antenatal contacts."),
    24: ("d", "Weight, height and age together give nutritional indices (weight-for-age, height-for-age, weight-for-height)."), 25: ("b", "Ischaemic heart disease is the leading cause of death worldwide."),
    26: ("c", "Stomach cancer (H. pylori) and cervical cancer (HPV) are linked to infections."), 28: ("d", "One Health links human, animal and environmental health."),
    29: ("a", "ePIS gives all facilities, including rural ones, access to accurate patient records."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "Which indicator is used for SDG target 6.2 on sanitation?", ["Proportion of population using safely managed sanitation services", "Number of hospitals per district", "Infant mortality rate", "Proportion of women aged 15-49 using contraception"], "a",
            "SDG 6.2.1 tracks the proportion of the population using safely managed sanitation services (with hand-washing facilities)."),
    new_mcq(2, T, "National Health Accounts (NHA) are mainly used to", ["Track how much is spent on health, by whom and on what", "Count hospital beds", "Register births and deaths", "Measure disease incidence"], "a",
            "NHA track health expenditure flows: sources, financing schemes, providers and functions."),
    new_mcq(3, T, "The maternal mortality ratio is expressed per", ["1000 live births", "100 000 live births", "1000 women aged 15-49", "100 000 population"], "b",
            "MMR = maternal deaths / live births x 100 000."),
    new_mcq(4, T, "Which of these is a common mental health condition among adolescents worldwide?", ["Depression and anxiety disorders", "Dementia", "Parkinson's disease", "Schizophrenia as the most common"], "a",
            "Depression and anxiety are among the leading causes of illness and disability in adolescents (WHO)."),
    new_mcq(5, T, "Collaboration between modern medicine and traditional medicine (Drungtshos) in Bhutan mainly helps to", ["Replace modern medicine with traditional medicine", "Improve access, cultural acceptance and holistic care towards universal health coverage", "Reduce the number of health facilities", "Limit patient choice"], "b",
            "Integration widens coverage and acceptability and supports holistic, people-centred care and UHC."),
    saq(1, T, """Epidemiological studies help determine how often diseases occur, identify risk factors and understand how diseases spread. Choosing the appropriate study design is a crucial step in an epidemiological investigation.
a) List the types of epidemiological study designs. (2 marks)
b) In which studies are the relative risk (RR) and the odds ratio (OR) used? (1 mark)
c) In a case-control study, the odds ratio for developing disease X among people exposed to risk factor Y was 4 compared with those not exposed. Interpret this odds ratio. (1 mark)
d) List the two most important purposes of randomisation. (1 mark)""",
        [("a) Descriptive (case report/series, cross-sectional, ecological) and analytical observational (case-control, cohort) and experimental (RCT, field/community trials)", 2), ("b) RR in cohort studies (and RCTs); OR in case-control studies (also cross-sectional)", 1), ("c) Exposed have 4 times the odds of disease compared with unexposed - strong positive association (not proof of causation)", 1), ("d) Eliminate selection bias and balance known and unknown confounders between groups (comparability, valid statistical inference)", 1)],
        """a) Descriptive studies - case reports and case series, cross-sectional (prevalence) surveys, ecological studies. Analytical observational studies - case-control studies and cohort (prospective/retrospective) studies. Experimental (interventional) studies - randomised controlled trials, field trials and community trials.
b) Relative risk is used in cohort studies (and randomised trials), where incidence in exposed and unexposed groups can be measured. The odds ratio is used in case-control studies (and cross-sectional studies), where incidence cannot be measured directly.
c) People exposed to Y had 4 times the odds of having disease X compared with those not exposed - a strong positive association between Y and X (it suggests but does not prove causation).
d) Randomisation removes selection bias (each participant has an equal chance of being in any group) and makes groups comparable by balancing known and unknown confounding factors, so differences in outcome can be attributed to the intervention."""),
    saq(2, T, """According to the Annual Health Bulletin 2025, 920 tuberculosis (TB) cases were reported in 2024, with an increasing case notification trend. As of December 2024, Bhutan had recorded a cumulative 1020 HIV cases since 1993; 85 new cases were detected in 2024. In total, 774 people are living with HIV and 98% of them are on antiretroviral therapy (ART).
a) Given 920 TB cases in 2024 and a cumulative 1020 HIV cases since 1993, what does this imply about the country's infectious disease burden? (2 marks)
b) If 774 people are living with HIV and 98% are on ART, calculate the number currently on ART, and state why high ART coverage is crucial in HIV control. (1 mark)
c) Explain briefly why integrated TB and HIV programmes are important in Bhutan. (1 mark)
d) Propose two priority public health interventions the Ministry of Health should focus on in 2025 to address the rising incidence of TB and HIV. (1 mark)""",
        [("a) TB burden high and rising (920 in one year in a small population), continuing transmission; HIV low prevalence but steady new cases (85/yr), concentrated; dual burden alongside NCDs, need sustained programmes", 2), ("b) 774 x 0.98 ≈ 759 on ART; high ART coverage suppresses viral load (U=U), prevents transmission, reduces deaths and TB", 1), ("c) HIV raises TB risk greatly; TB is leading cause of death in PLHIV; integrated testing, TB preventive therapy, shared resources", 1), ("d) Two interventions: active case finding/ contact tracing and TB preventive treatment, expanded HIV testing (community, self-testing) and linkage, awareness/ condom promotion, addressing stigma, MDR-TB management", 1)],
        """a) TB remains a major public health problem: 920 cases in one year is a high burden for a population of about 0.78 million (over 100 per 100 000) and the rising notifications show ongoing transmission (and better detection). HIV is a low-prevalence epidemic, but 1020 cumulative cases and 85 new cases a year show continuing transmission. Together they show a persistent communicable disease burden alongside the growing NCD burden, needing sustained investment.
b) Number on ART = 774 x 0.98 ≈ 759 people. High ART coverage suppresses the viral load (undetectable = untransmittable), preventing new infections and mother-to-child transmission, reducing illness, TB and deaths.
c) HIV greatly increases the risk of TB, and TB is the leading cause of death among people with HIV; integrated programmes ensure every TB patient is tested for HIV and every person with HIV is screened for TB and given TB preventive therapy, using shared services efficiently.
d) (1) Active TB case finding, contact tracing and TB preventive treatment, with strong MDR-TB management. (2) Expanded HIV testing (community-based and self-testing) with immediate linkage to ART, prevention education and condom promotion, and stigma reduction."""),
    saq(3, T, """According to the Royal Centre for Disease Control (RCDC), 154 221 cases of notifiable diseases were recorded through the weekly reporting system in 2024. RCDC also serves as the nodal point of the disease surveillance system in Bhutan.
a) How many immediately notifiable diseases or syndromes, and how many weekly notifiable diseases or syndromes, are currently in place with RCDC? (1 mark)
b) Among the weekly reportable diseases, acute respiratory infections (ARI) and acute watery diarrhoea (AWD) were the most frequently reported (82.0% and 15.0% of cases in 2024). Which age group is most affected by ARI and AWD, and give up to three preventive measures for each. (2 marks)
c) List the types of disease surveillance in public health. What is sentinel surveillance? (1 mark)
d) Define epidemic and pandemic, with an example of each. (1 mark)""",
        [("a) Numbers as per RCDC's current national notifiable disease list (immediately notifiable vs weekly)", 1), ("b) Under-five children most affected (also elderly); ARI prevention: hand/respiratory hygiene, vaccination (PCV, Hib, measles, influenza), breastfeeding/ nutrition, reduce indoor smoke/ ventilation; AWD: safe water, sanitation and hand-washing, rotavirus vaccine, food hygiene, breastfeeding/ ORS-zinc", 2), ("c) Types: passive, active, sentinel, syndromic, event-based, laboratory-based; sentinel = selected reporting sites provide high-quality data on specific diseases to estimate trends", 1), ("d) Epidemic: occurrence clearly in excess of expected in a community/ region (e.g. dengue outbreak); pandemic: epidemic across countries/ continents (e.g. COVID-19, 2009 H1N1)", 1)],
        """a) As listed in RCDC's current National Notifiable Disease Surveillance guideline: a set of immediately notifiable diseases/syndromes (reported within 24 hours, e.g. cholera, measles, acute flaccid paralysis, rabies, outbreaks and clusters) and a set of weekly notifiable diseases/syndromes (e.g. ARI, AWD, dysentery, enteric fever). [Examiner: check the current numbers against the RCDC guideline.]
b) Children under five years are most affected by both ARI and AWD (the elderly are also vulnerable to ARI). ARI prevention: hand-washing and respiratory hygiene (covering coughs, masks), vaccination (PCV, Hib, measles, influenza), exclusive breastfeeding and good nutrition, reducing indoor smoke and improving ventilation. AWD prevention: safe drinking water (boiling/chlorination), improved sanitation and hand-washing with soap, rotavirus vaccination, food hygiene and breastfeeding (with early ORS and zinc).
c) Types: passive, active, sentinel, syndromic, event-based, laboratory-based and integrated surveillance. Sentinel surveillance collects high-quality data from selected reporting sites (e.g. chosen hospitals) on specific diseases (such as influenza-like illness) to monitor trends and characteristics in the wider population.
d) Epidemic: occurrence of a disease clearly in excess of what is normally expected in a community or region over a period, e.g. a dengue outbreak in Phuentsholing. Pandemic: an epidemic spreading across several countries or continents, affecting large numbers of people, e.g. COVID-19 (2020) or H1N1 influenza (2009)."""),
    saq(4, T, """a) Discuss universal health coverage (UHC, SDG 3.8). What are the two indicators used to track progress (SDG 3.8.1 and 3.8.2)? (2 marks)
b) List the stages of the health planning cycle. (2 marks)
c) According to the National Blood Lead Level Survey 2024, 75.9% of children aged 1-6 had blood lead levels ≥3.5 µg/dL. List ways to reduce the risk of lead exposure. (1 mark)""",
        [("a) UHC: all people get needed quality health services without financial hardship; 3.8.1 coverage of essential health services (UHC service coverage index); 3.8.2 proportion of population with large household health spending (>10%/25% of income) - financial protection", 2), ("b) Stages: situation analysis/ needs assessment, priority setting, setting goals/objectives, identifying and choosing strategies/ options, resource planning/ budgeting, implementation, monitoring and evaluation (feedback)", 2), ("c) Ways: remove lead sources (lead paint, contaminated spices/cosmetics, utensils, toys), safe water pipes, hand-washing/ cleaning dust, nutrition (iron, calcium), regulation/ testing, awareness", 1)],
        """a) UHC means all people and communities can use the promotive, preventive, curative, rehabilitative and palliative health services they need, of sufficient quality, without suffering financial hardship. Indicators: SDG 3.8.1 - coverage of essential health services (the UHC service coverage index, based on tracer interventions in RMNCH, infectious diseases, NCDs and service capacity); SDG 3.8.2 - proportion of the population with large household expenditure on health (more than 10% or 25% of household spending or income) - financial protection.
b) Situation analysis and needs assessment → priority setting → setting goals and SMART objectives → identifying and choosing strategies/options → planning resources and budget → implementation → monitoring and evaluation, feeding back into the next planning cycle.
c) Identify and remove lead sources - lead-based paints, contaminated spices and traditional medicines or cosmetics, lead-glazed or metal utensils, toys and jewellery; regulate and test products; keep homes free of dust (wet cleaning), frequent hand-washing for children; safe water pipes; good nutrition with iron and calcium; screening of children and public awareness."""),
]
C1 = """Case I: Leptospirosis outbreak in Dewathang
On 1 July 2025, the Ministry of Health issued a press release stating that "Leptospirosis Confirmed as Cause of Acute Respiratory Distress Syndrome (ARDS) Cluster in Dewathang", based on laboratory confirmation and epidemiological links.
The WHO South-East Asia Region Epidemiological Bulletin (13th edition, 2 July 2025) reported that of 230 trainees, 143 developed symptoms and were treated according to clinical protocols. Of these, three died. The Ministry has started outbreak investigation and rapid response."""
C2 = """Case II: Non-communicable diseases
According to the World Health Organization (WHO), non-communicable diseases (NCDs) killed at least 43 million people in 2021, equivalent to 75% of non-pandemic-related deaths globally. In 2021, 18 million people died from an NCD before age 70. Of all NCD deaths, 73% are in low- and middle-income countries. Cardiovascular diseases caused at least 19 million deaths in 2021, followed by cancers (10 million), chronic respiratory diseases (COPD, 4 million) and diabetes (over 2 million, including kidney disease deaths caused by diabetes). These four groups account for 80% of all premature NCD deaths. The top causes of death in Bhutan in 2021 according to WHO are shown in Figure 1 (deaths per 100 000: ischaemic heart disease 64.6, COPD 47.9, stroke 41.1, tuberculosis 26.6, cirrhosis of the liver 19.4, diarrhoeal diseases 18.9, diabetes 18.7, lower respiratory infections 15, stomach cancer 13.1, kidney diseases 12.8)."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("ph2025", 1, T, C1, items=[
    it("a) What are the key steps in an outbreak investigation? How is a case definition developed, and why is it important? (5 + 5 marks)", 10,
       [("Steps: prepare, establish/ confirm outbreak, verify diagnosis, define and find cases, descriptive epi (time, place, person), hypotheses, test (analytical), environmental/ lab studies, control measures, communicate findings, maintain surveillance", 5), ("Case definition: clinical criteria + person, place, time restrictions; confirmed/ probable/ suspected levels; standard for counting, comparability, finding cases, sensitivity vs specificity", 5)],
       "Key steps: (1) prepare for fieldwork (team, logistics, permissions); (2) establish the existence of an outbreak (compare with expected numbers); (3) verify the diagnosis (clinical and laboratory); (4) construct a working case definition; (5) find and count cases systematically (line list); (6) perform descriptive epidemiology - time (epidemic curve), place (spot map) and person; (7) develop hypotheses; (8) evaluate hypotheses with analytical studies (cohort/case-control); (9) refine hypotheses and carry out laboratory and environmental studies; (10) implement control and prevention measures (as early as possible); (11) communicate findings; (12) maintain surveillance. Case definition: a standard set of criteria for deciding whether a person has the disease under investigation, made of clinical criteria (e.g. fever with myalgia and breathlessness/ARDS) restricted by time (e.g. onset after 1 June 2025), place (Dewathang training centre) and person (trainees and staff), often graded as suspected, probable and confirmed (laboratory MAT/PCR positive). It is important because it standardises counting so cases are identified consistently by all investigators, allows comparison over time and place, guides case finding and calculation of attack rates, and balances sensitivity (broad early) with specificity (narrower later)."),
    it("b) How do you construct an epidemic curve (epi curve)? List the importance of the epi curve. (3 + 3 marks)", 6,
       [("Construction: histogram of number of cases (y-axis) by date/ time of onset (x-axis), choose time interval (about 1/4-1/3 of incubation period), include pre-epidemic period, mark events/ interventions", 3), ("Importance: shows magnitude and time course, pattern of spread (source type), likely exposure period/ incubation, outliers, trend and effect of control measures, predict course", 3)],
       "Construction: list cases with date (and time) of symptom onset; draw a histogram with number of cases on the y-axis and time of onset on the x-axis using equal intervals (about one-quarter to one-third of the incubation period, e.g. days for leptospirosis); include a period before the outbreak to show the baseline; label axes and title, and mark key events (exposure, interventions). Importance: shows the size and time course of the outbreak; suggests the mode of spread (point, continuous, intermittent or propagated); helps estimate the likely exposure period from the incubation period; identifies outliers (index or secondary cases); shows whether the outbreak is growing or ending; and helps evaluate the effect of control measures and predict future cases."),
    it("b) (continued) Interpret the epidemic curves in figures b1-b4 based on the source of the outbreak. (4 marks)", 4,
       [("b1: point (single) common source - sharp rise and fall within one incubation period", 1), ("b2: continuous common source - plateau, prolonged exposure", 1), ("b3: propagated (person-to-person) - successive larger peaks one incubation apart", 1), ("b4: intermittent common source - irregular separate peaks", 1)],
       "Figure b1 - point (single) common-source outbreak: a sharp rise and gradual fall, all cases within one incubation period (e.g. a single contaminated meal). Figure b2 - continuous common-source outbreak: cases rise and then stay at a plateau because people are exposed over a long period (e.g. a contaminated water supply). Figure b3 - propagated (person-to-person) outbreak: a few early cases followed by successively larger waves about one incubation period apart (e.g. measles). Figure b4 - intermittent common-source outbreak: separate, similar peaks with gaps, as exposure to the source occurs on and off (e.g. a periodically contaminated well)."),
    it("c) Which epidemiological study designs (analytical studies) are used to investigate the source and spread of an outbreak?", 2,
       [("Retrospective cohort study (small defined population - attack rates, RR) and case-control study (large/undefined population - OR)", 2)],
       "Analytical studies to test hypotheses: a retrospective cohort study when the population is small and well defined (like the 230 trainees) - comparing attack rates in exposed and unexposed (e.g. swimming or working in a water body) and calculating relative risk; and a case-control study when the population is large or not well defined - comparing exposures of cases and controls and calculating odds ratios. These are supported by descriptive data and laboratory/environmental investigation."),
    it("d) Using the information in the scenario, write the formula and calculate the attack rate (AR) and case fatality ratio (CFR) for the leptospirosis outbreak in Dewathang. Interpret the results.", 8,
       [("AR formula: number of new cases during outbreak / population at risk x 100", 2), ("AR = 143/230 x 100 = 62.2%", 2), ("CFR formula: deaths from disease / number of cases x 100; CFR = 3/143 x 100 = 2.1%", 2), ("Interpretation: very high attack rate - common intense exposure (e.g. contaminated water/ environment); CFR about 2% shows disease can be severe (ARDS) - need early diagnosis/ doxycycline, control", 2)],
       "Attack rate = number of new cases during the outbreak / population at risk at the start x 100 = 143 / 230 x 100 = 62.2%. Case fatality ratio = number of deaths due to the disease / number of cases x 100 = 3 / 143 x 100 = 2.1%. Interpretation: almost two-thirds of the trainees became ill - an extremely high attack rate pointing to a common, intense exposure shared by the group (e.g. contact with water or soil contaminated by rodent urine during training). A CFR of about 2% shows the disease can be severe (pulmonary haemorrhage/ARDS), so early recognition, prompt treatment with antibiotics (doxycycline/penicillin), chemoprophylaxis for exposed people and removal of the source are essential."),
    it("e) Define emerging and re-emerging infectious diseases with suitable examples. Describe what you understand by the One Health approach to disease prevention and control.", 10,
       [("Emerging: newly appearing in population or rapidly increasing incidence/ range - examples (COVID-19, Nipah, Zika, avian influenza H5N1/H7N9, MERS)", 3), ("Re-emerging: previously controlled diseases returning - examples (TB/ MDR-TB, dengue, malaria, measles, cholera, leptospirosis, scrub typhus)", 3), ("One Health: collaborative multisectoral approach recognising interconnection of human, animal and environmental health; zoonoses, AMR, food safety; joint surveillance, preparedness; Bhutan example (rabies, avian influenza, leptospirosis)", 4)],
       "Emerging infectious diseases are infections that have newly appeared in a population, or existed before but are rapidly increasing in incidence or geographic range - e.g. COVID-19, avian influenza (H5N1), Nipah virus, Zika, MERS. Re-emerging diseases are ones that were previously controlled or declining but are increasing again - e.g. tuberculosis (including MDR-TB), dengue, malaria in some areas, measles, cholera, and leptospirosis and scrub typhus in Bhutan. Drivers include climate change, urbanisation, travel, deforestation, antimicrobial resistance and weak health systems. One Health is a collaborative, multisectoral and transdisciplinary approach that recognises that human, animal and environmental health are interconnected; human, veterinary, environmental and agricultural sectors work together on joint surveillance, information sharing, preparedness and response for zoonoses (rabies, avian influenza, leptospirosis, anthrax), antimicrobial resistance and food safety. In Bhutan, joint investigations by the Ministry of Health and the Department of Livestock (e.g. rabies and leptospirosis control) are examples."),
    it("f) Describe the control and prevention measures implemented during a disease outbreak in general.", 10,
       [("Control source: identify and remove/ treat source (water, food, animals/ rodents), environmental sanitation", 2.5), ("Interrupt transmission: isolation/ quarantine, infection prevention and control, vector/ rodent control, hygiene, PPE, safe water/ food", 2.5), ("Protect susceptible: vaccination, chemoprophylaxis (e.g. doxycycline), health education, risk communication", 2.5), ("Case management, surveillance, coordination (rapid response teams, incident management), monitoring effectiveness, after-action review", 2.5)],
       "Control measures act on the source, the mode of transmission and the susceptible host. (1) Control the source: identify and eliminate or treat the source (e.g. close contaminated water bodies, rodent control, safe disposal of waste, treat infected animals), and early diagnosis and treatment of cases. (2) Interrupt transmission: isolation of cases and quarantine of contacts where relevant, infection prevention and control, environmental sanitation, safe water and food, vector and rodent control, personal protective equipment (boots and gloves for leptospirosis). (3) Protect susceptible people: vaccination or mass immunisation (e.g. measles, cholera), chemoprophylaxis (e.g. weekly doxycycline for high-risk exposure), health education and risk communication. (4) Strengthen surveillance - active case finding, contact tracing, laboratory confirmation, daily reporting. (5) Coordination - rapid response teams, incident command, multisectoral (One Health) collaboration, adequate supplies and treatment protocols. (6) Monitor the effectiveness of measures, declare the end of the outbreak after two incubation periods without new cases, and conduct an after-action review to prevent recurrence."),
])
Q += case("ph2025", 2, T, C2, items=[
    it("a) Describe the behavioural, metabolic and environmental risk factors of the major NCDs (CVD, COPD, liver cirrhosis, diabetes and cancers).", 10,
       [("Behavioural: tobacco use, harmful alcohol (cirrhosis, cancers, CVD), unhealthy diet (salt, sugar, fat, low fruit/veg; doma), physical inactivity", 4), ("Metabolic: raised BP, overweight/ obesity, raised blood glucose, raised lipids", 3), ("Environmental: air pollution (indoor biomass smoke, outdoor PM), occupational exposures, urbanisation, infections (HBV/HCV, H. pylori, HPV); linked to each disease", 3)],
       "Behavioural (modifiable) risk factors: tobacco use (smoking and chewing - CVD, COPD, many cancers); harmful use of alcohol (liver cirrhosis - a leading cause of death in Bhutan - cancers, hypertension); unhealthy diet high in salt (suja, ezay), sugar and fat and low in fruit and vegetables (CVD, diabetes, stomach and other cancers); physical inactivity (CVD, diabetes, obesity). Doma (betel nut) chewing is linked to oral cancers. Metabolic risk factors: raised blood pressure (the leading risk factor for CVD and stroke), overweight and obesity, raised blood glucose (diabetes), and raised blood lipids (cholesterol). Environmental risk factors: household air pollution from burning wood and biomass for cooking and heating (COPD, lung disease), outdoor air pollution, occupational exposures (dust, chemicals), and infections linked to cancers and liver disease (hepatitis B and C - liver cancer and cirrhosis, H. pylori - stomach cancer, HPV - cervical cancer); together with social determinants such as urbanisation, income and education."),
    it("b) How do NCDs affect socio-economic development and achievement of the 2030 Sustainable Development Goals (SDGs)?", 10,
       [("Economic: loss of productivity/ premature death of working-age, absenteeism, high treatment costs (referrals abroad), catastrophic expenditure, pressure on free health system budget", 4), ("Social: poverty trap, burden on families/ carers, inequality, reduced GNH/ well-being", 3), ("SDGs: target 3.4 (reduce premature NCD mortality by one-third), affects SDG 1 (poverty), 3.8 UHC, 8 (growth), 10 (inequality); need multisectoral action", 3)],
       "NCDs reduce development in several ways. Economic: they kill and disable people in their productive years, reducing the workforce, productivity and household income; treatment is long-term and costly (dialysis, cancer care, referrals to India), increasing government health spending in Bhutan's free health system and diverting resources from other sectors; households face catastrophic and out-of-pocket costs (travel, indirect costs). Social: families fall into poverty (a poverty trap), children may leave school to care for sick parents, inequalities widen because the poor have more risk and less access, and well-being and GNH are reduced. SDGs: NCDs directly threaten SDG target 3.4 (reduce premature NCD mortality by one-third by 2030 and promote mental health), 3.5 (alcohol), 3.a (tobacco control) and 3.8 (UHC); and indirectly SDG 1 (no poverty), SDG 8 (decent work and economic growth), SDG 10 (reduced inequalities) and SDG 11 (healthy cities, air quality). Achieving the SDGs needs a whole-of-government, multisectoral NCD response."),
    it("c) (i) What characteristics of a disease indicate its suitability for screening?", 4,
       [("Wilson-Jungner criteria: important health problem (common/ serious); recognisable latent/ early stage; natural history understood; effective, acceptable treatment that is better early; suitable, acceptable, valid test; facilities for diagnosis/ treatment; cost-effective; continuous process", 4)],
       "Based on Wilson and Jungner's criteria: the condition should be an important health problem (common and/or serious); it should have a recognisable latent or early symptomless stage; its natural history should be adequately understood; there should be an accepted, effective treatment that gives better outcomes when started early; there should be a suitable, simple, safe, valid (sensitive and specific) and acceptable test; facilities for diagnosis and treatment should be available; the cost of case-finding should be balanced against overall health spending; and screening should be a continuing process. Type 2 diabetes and hypertension meet these criteria."),
    it("c) (ii) What epidemiological study designs can be used to evaluate a screening programme for type 2 diabetes and hypertension? Describe briefly.", 6,
       [("Randomised controlled trials (individual or cluster) comparing screened vs not screened on outcomes (mortality, complications) - gold standard", 2), ("Cohort studies (screened vs unscreened followed up), case-control studies (prior screening history in cases of complications/ death vs controls)", 2), ("Ecological/ time-trend studies; also process indicators and biases (lead time, length, selection/ volunteer bias) to consider", 2)],
       "1. Randomised controlled trials (individual or cluster/community randomised): populations randomly allocated to screening or usual care and followed for outcomes such as cardiovascular events, complications and mortality - the strongest evidence, but costly and long. 2. Cohort studies: compare outcomes in people who were screened and those not screened over time (e.g. incidence of stroke or diabetic complications). 3. Case-control studies: compare the screening history of people with advanced disease or complications (cases) with those without (controls). 4. Ecological/time-trend studies: compare rates of complications or deaths before and after introduction of screening, or between districts with and without programmes. Evaluation must consider lead-time bias, length bias and volunteer (selection) bias, and also process indicators - coverage, yield of new cases, sensitivity/specificity and linkage to treatment and control rates (e.g. the PEN HEART programme in Bhutan)."),
    it("d) Describe the four levels of prevention of modern epidemics such as NCDs. Give examples of actions at each level that would be appropriate in a comprehensive programme to prevent cardiovascular diseases (ischaemic heart disease and stroke).", 10,
       [("Primordial: prevent emergence of risk factors in population - policies (tobacco control law, salt reduction, healthy school meals, urban planning for activity), examples", 2.5), ("Primary: reduce risk factors in individuals/ population before disease - health promotion, diet, exercise, quit smoking, alcohol, BP/ cholesterol control", 2.5), ("Secondary: early detection and treatment - screening BP/ glucose/ lipids, PEN, treat hypertension, total CV risk", 2.5), ("Tertiary: reduce complications/ disability after disease - cardiac/ stroke care, rehabilitation, secondary prevention drugs (aspirin, statins)", 2.5)],
       "1. Primordial prevention - preventing the emergence of risk factors in the population through social, economic and environmental policies: tobacco control (Tobacco Control Act, taxes), alcohol taxes and regulation, reducing salt and trans-fats in food, healthy school meals, urban planning with footpaths and parks, promoting traditional healthy diets from childhood. 2. Primary prevention - reducing risk factors in people before disease: health education and promotion on healthy diet (less salt and oil, more vegetables), regular physical activity, quitting tobacco and doma, limiting alcohol, weight control. 3. Secondary prevention - early detection and prompt treatment: screening adults for hypertension, diabetes and cholesterol (WHO PEN/HEARTS), total cardiovascular risk assessment, treatment with antihypertensives and statins, regular follow-up. 4. Tertiary prevention - reducing complications and disability after a heart attack or stroke: emergency care and thrombolysis, cardiac and stroke rehabilitation (physiotherapy), secondary prevention drugs (aspirin, statins, beta-blockers), and long-term support. (Quaternary prevention - avoiding overmedicalisation - may also be mentioned.)"),
    it("e) Describe your approach to the management of NCDs in a primary health care (PHC) setting. List the enablers and challenges of managing NCDs in PHCs.", 10,
       [("Approach: WHO PEN/ HEARTS protocols - screening, risk assessment, standard treatment protocols, essential drugs/ technologies, follow-up, referral, self-management, community/ VHW engagement, team-based care, records (ePIS)", 5), ("Enablers: free health care, wide PHC network, PEN implemented, VHWs, ePIS, political commitment, Health Flagship programme", 2.5), ("Challenges: shortage/ turnover of staff, drug/ equipment stock-outs, difficult terrain/ access, low awareness/ adherence, data gaps, limited specialist referral, lifestyle/ culture (diet, alcohol)", 2.5)],
       "Approach: use WHO PEN and HEARTS protocols in BHUs/PHCs - opportunistic and community screening of adults (BP, blood glucose, BMI, waist, tobacco/alcohol use), cardiovascular risk assessment; standard treatment protocols with essential medicines (antihypertensives, metformin, statins, aspirin) and basic technologies (BP machines, glucometers, urine strips); counselling on lifestyle and self-management; regular follow-up with recall systems and records in ePIS; referral of complicated cases to hospitals with back-referral; team-based care with health assistants, nurses and village health workers; community engagement and outreach for remote areas. Enablers: free health care and a wide network of PHCs; national PEN programme and standard protocols; village health workers and outreach clinics; electronic records (ePIS) and the national health flagship programmes; political commitment and GNH. Challenges: shortage and turnover of trained staff; stock-outs of medicines and test strips; difficult terrain and long travel times; low awareness, poor adherence and cultural dietary habits (salt, butter tea, alcohol); limited diagnostics and specialist support; weak data for follow-up; and rising costs."),
])
for q in Q:
    if q["key"] == "C1Q3": q["image"] = "/papers/me/tech3-ph-2025-epi-curves.png"
    if q["key"].startswith("C2Q"): q["image"] = "/papers/me/tech3-ph-2025-causes-of-death.png"
    if q["key"] == "S3": q["issues"] = ["SAQ 3a: check the current numbers of immediately and weekly notifiable diseases in the RCDC guideline."]
PATTERN = STANDARD
