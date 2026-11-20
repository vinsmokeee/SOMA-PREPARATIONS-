"""ME Technical Paper III (Subject Specialisation Paper), Animal Science, BCSE 2025 - real paper (PDF sent by the founder).
Pattern (own): Section A Part I 30 MCQ; Part II any 5 of 6 short answers x 6 (30); Section B any 2 of 4 long answers x 20 (40).
150 min + 15 min reading. Left out: MCQ 19 (sturgeon caviar age: sources differ); one new MCQ keeps Part I at 30.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Animal Science): BCSE 2025, batch 1"
GROUP_TAG = "animalsci2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "animal-science"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Animal Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Animal Science"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following animals has cotyledonary placenta?",
"opts": [
"Horse",
"Cattle",
"Dog",
"Cat"
]
},
{
"n": 2,
"stem": "The testis in mammals descend into the scrotal sac due to:",
"opts": [
"Presence of urinary bladder",
"Presence of rectum",
"Long vas deferens",
"Requirement of low temperature for spermatogenesis"
]
},
{
"n": 3,
"stem": "A period of sexual activity during the estrus cycle when the female will allow mating is called:",
"opts": [
"Proestrus",
"Estrus",
"Diestrus",
"Anestrus"
]
},
{
"n": 4,
"stem": "A female progeny born from a cross between a Mithun bull and a Siri cow is called:",
"opts": [
"Thrabam",
"Yangkum",
"Jatsham",
"Doebum"
]
},
{
"n": 5,
"stem": "Normal cow milk obtained from a clean udder contains:",
"opts": [
"Fat",
"Minerals",
"Proteins",
"All of the above"
]
},
{
"n": 6,
"stem": "The scientific name for Yak is:",
"opts": [
"Bos indicus",
"Bos grunniens",
"Bos frontalis",
"Bos taurus"
]
},
{
"n": 7,
"stem": "Which of the following organ has honeycomb like structure?",
"opts": [
"Rumen",
"Reticulum",
"Omasum",
"Abomasum"
]
},
{
"n": 8,
"stem": "The optimum pH for very good silage preservation is in the range of:",
"opts": [
"3.5 - 4.2",
"4.2 - 4.5",
"4.5 - 4.8",
"4.8 - 5.2"
]
},
{
"n": 9,
"stem": "Which is the most developed special sense in the birds?",
"opts": [
"Vision",
"Hearing",
"Smell",
"Taste"
]
},
{
"n": 10,
"stem": "The primary end product of protein metabolism in poultry is:",
"opts": [
"Urea",
"Uric acid",
"Ammonia",
"Urates"
]
},
{
"n": 11,
"stem": "The maximum permissible level of ammonia in poultry houses is:",
"opts": [
"55 ppm",
"25 ppm",
"35 ppm",
"45 ppm"
]
},
{
"n": 12,
"stem": "The brown colour of eggshell is due to which of the following pigment:",
"opts": [
"Carotenoid",
"Protoporphyrin",
"Biliverdin",
"Melanin"
]
},
{
"n": 13,
"stem": "The enlargement of the sciatic nerve is seen in:",
"opts": [
"Newcastle disease",
"Marek’s disease",
"Avian Influenza",
"Infectious Coryza"
]
},
{
"n": 14,
"stem": "The average gestation period for a pig is:",
"opts": [
"4 months, 3 weeks, and 3 days",
"3 months, 3 weeks, and 3 days",
"2 months, 2 weeks, and 2 days",
"1 month, 1 week, and 1 day"
]
},
{
"n": 15,
"stem": "A highly palatable, nutrient-rich and easily digestible diet that is frequently offered to piglets while they are still nursing is called:",
"opts": [
"Creep feed",
"Grower ration",
"Finisher ration",
"None of the above"
]
},
{
"n": 16,
"stem": "“Thumps” is a condition common among piglets of 2-3 weeks and is caused due to:",
"opts": [
"Ascorbic acid deficiency",
"Calcium deficiency",
"Iron deficiency",
"Vitamin D deficiency"
]
},
{
"n": 17,
"stem": "A young female pig that has not yet produced a litter or been bred is called:",
"opts": [
"Gilt",
"Grower",
"Sow",
"Finisher"
]
},
{
"n": 18,
"stem": "The term \"Measly Pork\" refers to the presence of the following in the muscle tissue of pigs:",
"opts": [
"Cysticerci of Taenia solium",
"Metacestodes of Taenia saginatta",
"Cysts of Toxoplasma gondii",
"Hydatid cysts of Echinococcus granulosus"
]
},
{
"n": 19,
"stem": "The typical caviar harvest age for female Siberian Sturgeon (Acipenser baerii) ranges from:",
"opts": [
"12 months to 18 months",
"3 years to 5 years",
"5 years to 7 years",
"7 years to 12 years"
]
},
{
"n": 20,
"stem": "The migration pattern exhibited by Golden Mahseer is called:",
"opts": [
"Anadromous",
"Catadromous",
"Potamodromous",
"Oceanodromous"
]
},
{
"n": 21,
"stem": "The most common site of occurrence of haematoma in dog is:",
"opts": [
"Abdomen",
"Pinna or Ear flap",
"Eyelid",
"Tail"
]
},
{
"n": 22,
"stem": "The primary route of transmission for canine parvovirus is:",
"opts": [
"Respiratory droplets",
"Direct contact with saliva",
"Fecal-oral route",
"Vector-borne"
]
},
{
"n": 23,
"stem": "Taenia multiceps is tape worm of dog and its larval stage present in sheep/cattle is:",
"opts": [
"Coenurus serialis",
"Hydatid",
"Coenurus cerebralis",
"None"
]
},
{
"n": 24,
"stem": "The most common serotype of Foot and Mouth Disease virus found in Bhutan is:",
"opts": [
"Serotype O",
"Serotype A",
"Serotype Asia 1",
"Serotype C"
]
},
{
"n": 25,
"stem": "All the following diseases are considered to be zoonotic diseases except:",
"opts": [
"Brucellosis",
"Leptospirosis",
"Listeriosis",
"Black Quarter"
]
},
{
"n": 26,
"stem": "The drug of choice for Fascioliosis is:",
"opts": [
"Triclabendazole",
"Oxyclozanide",
"Amprolium hydrochloride",
"Albendazole"
]
},
{
"n": 27,
"stem": "The drug of choice for a canine transmissible venereal tumor is:",
"opts": [
"Vincristine sulfate",
"Ceftriazone",
"Amatidine",
"Aspirin"
]
},
{
"n": 28,
"stem": "Feline panleukopenia is also known as:",
"opts": [
"Feline peritonitis",
"Feline parvoviral enteritis",
"Feline rhinotracheitis",
"Feline Pneumonia"
]
},
{
"n": 29,
"stem": "The most appropriate sample for laboratory confirmation of rabies is:",
"opts": [
"Saliva",
"Serum",
"Brain tissue in 10% formaldehyde",
"Brain tissue in 50% glycerol saline"
]
},
{
"n": 30,
"stem": "The vaccine against rabies was first developed by:",
"opts": [
"Edward Jenner",
"Louis Pasteur",
"Robert Koch",
"Robert Hook"
]
}
]"""

KEY = {
    1: ("b", "Ruminants (cattle) have a cotyledonary placenta."), 2: ("d", "Spermatogenesis needs a temperature below body temperature."),
    3: ("b", "Estrus (heat) is when the female accepts the male."), 4: ("c", "Mithun bull × Siri cow: the female is Jatsham (male Jatsha)."),
    5: ("d", "Milk contains fat, protein, lactose, minerals and vitamins."), 6: ("b", "Yak: Bos grunniens."), 7: ("b", "The reticulum has a honeycomb lining."),
    8: ("a", "Good silage has pH about 3.5-4.2."), 9: ("a", "Vision is the best developed sense in birds."), 10: ("b", "Birds excrete nitrogen mainly as uric acid."),
    11: ("b", "Ammonia should stay below about 25 ppm."), 12: ("b", "Protoporphyrin gives the brown shell colour."), 13: ("b", "Marek's disease enlarges peripheral nerves such as the sciatic."),
    14: ("b", "Pig gestation ≈ 114 days: 3 months, 3 weeks, 3 days."), 15: ("a", "Creep feed is given to suckling piglets."),
    16: ("c", "Thumps in young piglets is linked to iron-deficiency anaemia."), 17: ("a", "A gilt is a young female not yet farrowed."),
    18: ("a", "Measly pork: Cysticercus cellulosae, larva of Taenia solium."), 20: ("c", "Mahseer migrate within fresh water: potamodromous."),
    21: ("b", "Aural haematoma of the ear flap is most common."), 22: ("c", "Parvovirus spreads by the faecal-oral route."),
    23: ("c", "Coenurus cerebralis (gid) is the larva of Taenia multiceps."), 24: ("a", "Serotype O is the most common FMD serotype in Bhutan."),
    25: ("d", "Black quarter (Clostridium chauvoei) is not zoonotic."), 26: ("a", "Triclabendazole kills early and adult flukes."),
    27: ("a", "Vincristine is the drug of choice for TVT."), 28: ("b", "Feline panleukopenia is feline parvoviral enteritis."),
    29: ("d", "Brain tissue in 50% glycerol saline keeps the virus for testing."), 30: ("b", "Louis Pasteur developed the first rabies vaccine (1885)."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "The scientific name of Mithun is", ["Bos indicus", "Bos grunniens", "Bos frontalis", "Bubalus bubalis"], "c", "Mithun: Bos frontalis."),
]
SA = [
    ("What is TMR? What is the main goal of TMR feeding? List the five key components/ingredients required to formulate a balanced ration in TMR.",
     [("TMR: total mixed ration - all feeds mixed into one uniform ration", 2), ("Goal: every bite balanced; stable rumen, higher intake and production", 1), ("Five components: forage/roughage, energy concentrate, protein, minerals and vitamins, water/additives", 3)],
     "TMR (total mixed ration) is a feeding method in which all ingredients - forages, concentrates, minerals and vitamins - are weighed and thoroughly mixed so each mouthful is nutritionally balanced. Goal: provide a balanced diet in every bite, stabilise rumen fermentation, prevent selective eating and raise intake, milk yield and health. Components: (1) roughage/forage (silage, hay, green fodder); (2) energy concentrates (maize, grains, bran); (3) protein sources (oil cakes, soybean meal); (4) minerals and vitamins (mineral mixture, salt); (5) water and additives (buffers, molasses) for the right moisture."),
    ("What is conditioning of fish before stocking/transfer and/or transportation? What are the five major reasons for conditioning of fish before stocking/transfer and/or transportation?",
     [("Definition: holding fish in clean water without feed for a period to empty the gut and acclimatise", 1), ("Five reasons, 1 mark each: empty gut, less ammonia/CO₂ and oxygen use, less stress and injury, adapt to handling/crowding and water quality, remove weak/diseased fish", 5)],
     "Conditioning means holding fish in clean, well-aerated water without feeding for 24-48 hours before handling, so they empty their gut and get used to crowding. Reasons: (1) empty gut, so less faeces and ammonia foul the transport water; (2) lower oxygen consumption during transport; (3) less stress and mortality; (4) fish become hardy and used to handling and crowding; (5) weak, injured or diseased fish can be removed before stocking."),
    ("What is the \"five freedoms\" framework of animal welfare? List the five freedoms of animal welfare.",
     [("Framework: internationally used standard (UK FAWC) for minimum welfare", 1), ("Five freedoms, 1 mark each: hunger and thirst; discomfort; pain, injury, disease; to express normal behaviour; fear and distress", 5)],
     "The five freedoms (Farm Animal Welfare Council, UK) are the basic standards for the care of animals under human control: (1) freedom from hunger and thirst; (2) freedom from discomfort; (3) freedom from pain, injury and disease; (4) freedom to express normal behaviour; (5) freedom from fear and distress."),
    ("What is the marketing mix or \"4 Ps\" of the marketing framework? Briefly explain each of the \"4 Ps\" of marketing.",
     [("Marketing mix: controllable tools a business uses to meet customer needs", 2), ("Product, Price, Place, Promotion explained, 1 mark each", 4)],
     "The marketing mix is the set of controllable tools a business combines to satisfy its customers. Product: what is sold - quality, variety, packaging, brand (e.g. fresh milk, cheese). Price: what customers pay - cost, competition, discounts. Place: how it reaches customers - distribution channels, outlets, cold chain. Promotion: how customers learn of it - advertising, social media, demonstrations, offers."),
    ("Define ovariohysterectomy. List three immediate/short-term and two long-term possible post-operative complications of ovariohysterectomy.",
     [("Surgical removal of ovaries and uterus (spaying)", 1), ("Three short-term: haemorrhage, wound infection/dehiscence, anaesthetic complications/seroma", 3), ("Two long-term: urinary incontinence, obesity, ovarian remnant syndrome, stump pyometra", 2)],
     "Ovariohysterectomy (spaying) is the surgical removal of both ovaries and the uterus. Short-term complications: haemorrhage from ovarian or uterine vessels; wound infection, swelling or dehiscence; anaesthetic complications (and seroma, self-trauma). Long-term: urinary incontinence; weight gain/obesity; ovarian remnant syndrome; stump pyometra or granuloma."),
    ("Define the bovine estrous cycle and name its four main phases.",
     [("Definition: repeated reproductive cycle from one heat to the next, about 21 days (18-24)", 2), ("Four phases: proestrus, estrus, metestrus, diestrus", 4)],
     "The bovine estrous cycle is the recurring series of reproductive changes in the cow from one heat to the next, lasting about 21 days (18-24). Phases: proestrus (follicle growth, rising oestrogen); estrus (standing heat, about 12-18 h, ovulation follows); metestrus (corpus luteum forms); diestrus (functional corpus luteum, high progesterone)."),
]
for i, (s, kp, m) in enumerate(SA):
    Q.append(saq(i + 1, T, s + " (6 marks)", kp, m, marks=6))
LA = [
    ("Discuss the multifactorial nature of mastitis in dairy cows. Explain the key roles of environmental and infectious factors in its occurrence. Propose a comprehensive mastitis control program for a commercial dairy farm, detailing the management practices for both milking and dry periods.",
     [("Multifactorial: host, pathogen and environment interacting", 4), ("Infectious (contagious: Staph. aureus, Strep. agalactiae; environmental: E. coli, Strep. uberis) and environmental factors (bedding, hygiene, milking machine)", 6),
      ("Milking-time control: hygiene, pre/post-dipping, stripping, milking order, machine maintenance, CMT", 6), ("Dry period: dry cow therapy/teat sealant, clean dry housing, culling chronic cases, records, nutrition", 4)],
     """Mastitis arises from the interaction of the cow (stage of lactation, high yield, teat injury, immunity, nutrition), pathogens and the environment.
Infectious factors: contagious organisms (Staphylococcus aureus, Streptococcus agalactiae, Mycoplasma) spread cow to cow at milking by hands, cloths and liners; environmental organisms (E. coli, Klebsiella, Streptococcus uberis) come from dung, wet bedding and dirty yards.
Environmental factors: poor hygiene, wet or dirty housing, faulty milking machines (vacuum, liners), poor milking technique, overcrowding, heat stress and fly load.
Control programme - milking: clean, dry udders; fore-strip and check milk; pre-dip and post-dip teats; individual towels; gloves; milk infected cows last; maintain the machine; monitor SCC and use CMT; treat clinical cases promptly and record.
Dry period: blanket or selective dry-cow antibiotic therapy and internal teat sealant; clean, dry calving and dry-cow areas; balanced nutrition (vitamin E, selenium); cull chronically infected cows; keep records and work with a veterinarian."""),
    ("Discuss the principles of biosecurity in modern livestock farming. Explain how a well-designed biosecurity program can mitigate the risk of disease outbreaks, improve herd health, and enhance overall farm productivity. Provide specific examples of internal and external biosecurity measures.",
     [("Principles: segregation, cleaning, disinfection (also traceability)", 5), ("Mitigates outbreaks, better herd health, lower costs and higher productivity", 5), ("External measures (quarantine, controlled visitors/vehicles, sourcing, fencing, footbaths)", 5), ("Internal measures (all-in-all-out, sick pens, hygiene, vaccination, carcass disposal, records)", 5)],
     """Biosecurity is the set of measures that keep disease out of a farm (external) and stop it spreading within the farm (internal). Its principles are segregation (keep animals away from sources of infection), cleaning (remove dirt that shelters pathogens) and disinfection, supported by monitoring and records.
Benefits: fewer outbreaks of diseases such as FMD, avian influenza or ASF; lower mortality and treatment costs; less antibiotic use; better growth, fertility and yield; access to markets; protection of public health from zoonoses.
External measures: buy animals from known healthy sources and quarantine them (2-4 weeks); fence the farm; control visitors and vehicles; footbaths and farm clothing; rodent, bird and wildlife control; safe feed and water.
Internal measures: all-in/all-out systems; separate age groups; isolation pens for sick animals; clean and disinfect pens and equipment; vaccination and deworming schedules; proper disposal of carcasses and manure; staff training and records."""),
    ("Discuss the principles and applications of estrus synchronization as a cornerstone of modern livestock breeding programs. Explain the hormonal mechanisms involved in any one of the synchronization protocols. Furthermore, evaluate the economic benefits and potential challenges of implementing an estrus synchronization program on a commercial farm, considering both time-based and cost-based factors.",
     [("Principle: control the cycle so a group comes into heat together; applications (AI, timed breeding, embryo transfer)", 5), ("One protocol's hormonal mechanism, e.g. Ovsynch GnRH-PGF2α-GnRH or PGF2α double injection or progesterone device", 6),
      ("Economic benefits: planned calving, less heat detection, more AI use, uniform batches", 5), ("Challenges: drug and labour costs, nutrition/body condition needed, variable conception, skills", 4)],
     """Estrus synchronization manipulates the estrous cycle with hormones so that a group of females comes into heat (or ovulates) at a planned time. It is used for timed artificial insemination with superior semen, embryo transfer, planned calving to match feed and markets, and to overcome poor heat detection.
Example - Ovsynch: day 0 GnRH causes ovulation or luteinisation of the dominant follicle and starts a new follicular wave; day 7 PGF2α lyses the corpus luteum, progesterone falls; day 9 a second GnRH triggers a synchronized LH surge and ovulation; timed AI 16-20 hours later. (Alternative: two PGF2α injections 11-14 days apart, or a progesterone-releasing device for 7-9 days.)
Benefits: less time on heat detection, more cows bred early, shorter calving interval, uniform calf batches, efficient use of AI technicians and labour.
Challenges: cost of hormones and extra handling; conception rates vary (poor body condition, anoestrus, stress); needs good records, skilled staff and nutrition; failure means costly repeats."""),
    ("Analyze the key factors to consider when developing a farm business plan for a new livestock enterprise. Discuss the importance of market analysis, financial projections, and risk management in ensuring the long-term sustainability and profitability of the operation.",
     [("Key factors: goals, choice of species/breed, location, feed, labour, infrastructure, regulations", 5), ("Market analysis: demand, competitors, prices, channels", 5), ("Financial projections: capital, operating costs, cash flow, break-even, financing", 5), ("Risk management: disease, prices, climate, insurance, diversification, contingency", 5)],
     """Key factors: clear goals; choice of enterprise and breed suited to climate and market; site, land and water; feed and fodder supply; housing and equipment; labour and skills; veterinary services; regulations and permits (e.g. from the Department of Livestock).
Market analysis: who will buy, how much and at what price; competitors and imports; seasonal demand; marketing channels (cooperatives, schools, hotels). It prevents producing what cannot be sold.
Financial projections: start-up capital, operating costs, expected income, cash-flow forecast, break-even point and loan repayment. They show whether the enterprise is viable and are needed to get finance.
Risk management: disease (biosecurity, vaccination), price falls, feed shortages, climate events, theft; tools include insurance, diversification, contracts, reserves and contingency plans.
Together these keep the farm profitable and sustainable over the long term."""),
]
for i, (s, kp, m) in enumerate(LA):
    Q.append(dict(key=f"L{i + 1}", real=True, type="long_answer", marks=20, topic=T, stem=s + " (20 marks)", key_points=kp, model=m))
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions (answer any 5 of 6)", "type": "short_answer", "count": 6, "marks_each": 6, "answer_any": 5},
    {"title": "Section B: Long answer questions (answer any 2 of 4)", "type": "long_answer", "count": 4, "marks_each": 20, "answer_any": 2},
]
