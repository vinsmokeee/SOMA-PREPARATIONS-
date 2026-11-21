"""ME Technical Paper III (Subject Specialisation Paper), Veterinary Science, BCSE 2025 - real paper (PDF sent by the founder).
Own pattern from the paper: Part I 30 MCQ; Part II answer any 5 of 6 short answers x 6 = 30; Section B answer any 2 of 4
long questions x 20 = 40; total 100. All 30 MCQs kept. Disease answers stay at clinical, control and policy level.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1"
GROUP_TAG = "vet2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "veterinary-science"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Veterinary Science"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following hormone is primarily responsible for the milk let-down reflex?",
"opts": [
"Vasopressin",
"Oestrogen",
"Progesterone",
"Oxytocin"
]
},
{
"n": 2,
"stem": "What is the primary metabolic disorder that causes milk fever in cattle?",
"opts": [
"Hypokalemia",
"Hypomagnesemia",
"Hypocalcemia",
"Hypercalcemia"
]
},
{
"n": 3,
"stem": "The trivalent FMD vaccine currently used in Bhutan consists of the following serotypes:",
"opts": [
"O, A and C",
"O, A and Asia 1",
"O, A, SAT 1",
"O, A and SAT 2"
]
},
{
"n": 4,
"stem": "An ideal fluid therapy for treating diarrhoea is",
"opts": [
"Normal saline",
"Ringer lactate",
"5% dextrose",
"25% dextrose"
]
},
{
"n": 5,
"stem": "Polyneuritis in poultry is caused by the deficiency of:",
"opts": [
"Folic acid",
"Zinc",
"Thiamine",
"Copper"
]
},
{
"n": 6,
"stem": "Which cells are the primary target of canine parvovirus infection?",
"opts": [
"Mature red blood cells",
"Rapidly dividing cells of the intestinal crypts and bone marrow",
"Neurons in the brain",
"Skin epithelial cells"
]
},
{
"n": 7,
"stem": "A 5-year-old male neutered Labrador is brought to the Dzongkhag Veterinary Hospital with a 3-day history of vomiting and lethargy. On physical examination, you note a painful abdomen and a palpable mass in the mid-abdomen. Radiographs reveal a foreign body obstruction in the small intestine. What is the most appropriate next step?",
"opts": [
"Prescribe anti-emetics and monitor for improvement",
"Perform an exploratory laparotomy to remove the foreign body",
"Administer an enema to help pass the foreign body",
"Recommend a bland diet for 24 hours"
]
},
{
"n": 8,
"stem": "Scooting behaviour in dog is caused by:",
"opts": [
"Diphylidium caninum",
"Diphylobothridium latum",
"Echinococcus granulosus",
"None of the above"
]
},
{
"n": 9,
"stem": "Leptospirosis in dog is transmitted through:",
"opts": [
"Urine",
"Rodents",
"Skin penetration",
"All of the above"
]
},
{
"n": 10,
"stem": "The test used to measure the protective antibody titre against Rabies is:",
"opts": [
"RFFIT",
"Direct FAT",
"Indirect ELISA",
"SNT"
]
},
{
"n": 11,
"stem": "The first antibiotic, Penicillin, was discovered by:",
"opts": [
"Ignaz Semmelweis",
"Alexander Fleming",
"Paul Ehrlich",
"Gerd Binnig"
]
},
{
"n": 12,
"stem": "An epidemic affecting a large geographical area or often on a global scale is called:",
"opts": [
"Epidemic",
"Endemic",
"Sporadic",
"Pandemic"
]
},
{
"n": 13,
"stem": "A symbiotic relationship in which one organism benefits while the other is unaffected is called:",
"opts": [
"Saprophytism",
"Commensalism",
"Mutualism",
"Parasitism"
]
},
{
"n": 14,
"stem": "What disease is caused by Clostridium perfringens type D in lambs?",
"opts": [
"Pulpy kidney disease",
"Lamsiekte",
"Black leg",
"Tetanus"
]
},
{
"n": 15,
"stem": "The routine stain used for histopathological examination is",
"opts": [
"Leishman stain",
"Giemsa stain",
"Lactophenol cotton stain",
"Haematoxylin & Eosin stain"
]
},
{
"n": 16,
"stem": "Which of the following is not the characteristic of injectable anaesthetics?",
"opts": [
"Slow induction",
"Do not require costly and sophisticated equipment",
"Slow recovery",
"Depth or level of anaesthesia is difficult to control"
]
},
{
"n": 17,
"stem": "Red Blood Cells are nucleated in:",
"opts": [
"Cattle",
"Sheep",
"Poultry",
"Horse"
]
},
{
"n": 18,
"stem": "The temperature, pressure, and time required for autoclaving of surgical instruments is:",
"opts": [
"121°C at 15 psi for 15 minutes",
"350°C at 15 psi for 15 minutes",
"150°C at 15 psi for 30 minutes",
"121°C at 15 psi for 60 minutes"
]
},
{
"n": 19,
"stem": "The primary reason for using atropine as a preanesthetic medication in an animal receiving xylazine is to:",
"opts": [
"Induce muscle relaxation",
"Reduce salivation",
"Prevent bradycardia",
"Enhance sedation"
]
},
{
"n": 20,
"stem": "The dose rate of xylazine in horse is:",
"opts": [
"1-2 mg/kg body weight",
"1.1 mg/kg body weight",
"2.2 mg/kg body weight",
"0.1 mg/kg body weight"
]
},
{
"n": 21,
"stem": "The adverse effects of Xylazine are reversed with",
"opts": [
"Neostigmine",
"Yohimbine hydrochloride",
"Doxapram",
"Naloxone"
]
},
{
"n": 22,
"stem": "Bioavailability of drug refers to:",
"opts": [
"Percentage of administered dose that reaches systemic circulation in the unchanged form",
"Ratio of oral to parenteral dose",
"Ratio of orally administered drug to that excreted in the faeces",
"Ratio of drug excreted unchanged in urine to that excreted as metabolites"
]
},
{
"n": 23,
"stem": "Chocolates are toxic to dogs due to the presence of:",
"opts": [
"Aminophylline",
"Terbutaline",
"Theobromine",
"Pheneramine"
]
},
{
"n": 24,
"stem": "Triclabendazole is the drug of choice for:",
"opts": [
"Fascioliosis",
"Taeniasis",
"Schistosomiasis",
"Ancylostomiasis"
]
},
{
"n": 25,
"stem": "The best choice of anesthesia in rumenotomy is:",
"opts": [
"General anesthesia",
"Epidural anesthesia",
"Regional intravenous anesthesia",
"Paravertebral block"
]
},
{
"n": 26,
"stem": "The causative agent of hydatidious is:",
"opts": [
"Echinococcus granulosa",
"Diphylobothrium spp.",
"Taenia solium",
"Taenia saginata"
]
},
{
"n": 27,
"stem": "Xylazine does not have the following effect:",
"opts": [
"Analgesic",
"Muscle relaxant",
"Sedative",
"Antipyretic"
]
},
{
"n": 28,
"stem": "Abortion storm is a characteristic sign of:",
"opts": [
"Vibriosis",
"Trychomoniasis",
"Brucellosis",
"Leptospirosis"
]
},
{
"n": 29,
"stem": "Which of the following best describes the pathogenesis of rabies virus after entry into the host?",
"opts": [
"Rabies virus replicates immediately in the bloodstream resulting in viremia before CNS invasion",
"Rabies virus replicates in muscle cells at the bite site, then travels via peripheral nerves to the CNS",
"Rabies virus enters lymphatic vessels and spreads through lymph nodes before CNS invasion",
"Rabies virus primarily infects endothelial cells and spreads hematogenously to the brain"
]
},
{
"n": 30,
"stem": "Which of the following hormones triggers the release of the oocyte from the ovarian follicle during the estrous cycle?",
"opts": [
"Follicle-stimulating hormone (FSH)",
"Luteinizing hormone (LH)",
"Progesterone",
"Prolactin"
]
}
]"""

KEY = {
    1: ("d", "Oxytocin causes milk let-down."), 2: ("c", "Milk fever is hypocalcaemia around calving."),
    3: ("b", "Bhutan's trivalent FMD vaccine contains serotypes O, A and Asia 1."), 4: ("b", "Ringer's lactate (balanced, with lactate to correct acidosis) suits diarrhoea."),
    5: ("c", "Thiamine deficiency causes polyneuritis (star-gazing) in poultry."), 6: ("b", "Parvovirus targets rapidly dividing cells: intestinal crypts and bone marrow."),
    7: ("b", "Obstructive foreign bodies need exploratory laparotomy."), 8: ("a", "Dipylidium caninum segments cause perianal irritation and scooting."),
    9: ("d", "Leptospires spread via urine of carriers and rodents, entering through skin and mucosa."), 10: ("a", "RFFIT measures rabies virus-neutralising antibody titres."),
    11: ("b", "Alexander Fleming discovered penicillin (1928)."), 12: ("d", "A pandemic covers a large region or the world."),
    13: ("b", "Commensalism: one benefits, the other is unaffected."), 14: ("a", "C. perfringens type D causes pulpy kidney (enterotoxaemia)."),
    15: ("d", "Haematoxylin and eosin is the routine histology stain."), 16: ("a", "Injectable anaesthetics give rapid, not slow, induction."),
    17: ("c", "Bird red cells are nucleated."), 18: ("a", "Autoclave at 121 °C, 15 psi, 15 minutes."),
    19: ("c", "Atropine prevents xylazine-induced bradycardia (and reduces salivation)."), 20: ("b", "Xylazine in horses: about 1.1 mg/kg IV."),
    21: ("b", "Yohimbine (an alpha-2 antagonist) reverses xylazine."), 22: ("a", "Bioavailability is the fraction of dose reaching circulation unchanged."),
    23: ("c", "Theobromine makes chocolate toxic to dogs."), 24: ("a", "Triclabendazole treats fasciolosis (all fluke stages)."),
    25: ("d", "Rumenotomy is done standing under paravertebral (or inverted L) block."), 26: ("a", "Hydatidosis is caused by Echinococcus granulosus."),
    27: ("d", "Xylazine is not antipyretic."), 28: ("c", "Abortion storms are typical of brucellosis."),
    29: ("b", "After a bite the virus travels from the site along peripheral nerves to the CNS."), 30: ("b", "The LH surge triggers ovulation."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T)
SAQ = [
    ("A 4-month-old, unvaccinated male kitten is presented to the Dzongkhag Veterinary Hospital with acute severe lethargy, anorexia, profuse vomiting and haemorrhagic diarrhoea. There is severe dehydration and a fever of 105.8 °F. The CBC shows severe leukopenia. What is the most probable diagnosis, the line of treatment, and what would you advise the owner?",
     [("Diagnosis: feline panleukopenia (feline parvovirus)", 1.5), ("Treatment: isolation, IV fluids/ electrolytes, glucose, antiemetics, broad-spectrum antibiotics for secondary infection, nutrition, warmth; supportive", 2.5), ("Advice: guarded prognosis, vaccinate other cats, disinfect (bleach) environment, isolate, vaccination schedule", 2)],
     "Most probable diagnosis: feline panleukopenia (feline parvovirus infection) - young unvaccinated kitten, vomiting, haemorrhagic diarrhoea, fever and severe leukopenia. Treatment is supportive and intensive: isolate the kitten; IV fluids (e.g. Ringer's lactate) with potassium and dextrose to correct dehydration and electrolytes; antiemetics (maropitant/metoclopramide); broad-spectrum parenteral antibiotics (e.g. amoxicillin-clavulanate) to prevent secondary bacterial infection due to leukopenia; antipyretic care, warmth, early nutrition and nursing; blood transfusion in severe cases. Owner advice: the prognosis is guarded; keep the kitten isolated; disinfect the environment with dilute bleach (the virus survives long in the environment); vaccinate all other cats and future kittens (core vaccine from 6-8 weeks with boosters); do not bring new unvaccinated kittens into the house for several months."),
    ("What is antimicrobial resistance (AMR)? List five key drivers of AMR in veterinary medicine.",
     [("Definition: ability of microorganisms to survive/ grow despite antimicrobials that would normally kill/ inhibit them", 1), ("Five drivers (1 each): overuse/ misuse, use as growth promoters/ prophylaxis, incorrect dose/ duration, over-the-counter sale without prescription, poor biosecurity/ hygiene/ infection control, lack of diagnostics/ AST, residues in environment, weak regulation/ surveillance, poor farmer awareness", 5)],
     "Antimicrobial resistance is the ability of bacteria, viruses, fungi or parasites to resist the effects of antimicrobial drugs that previously killed or inhibited them, so infections become harder to treat in animals and people. Key drivers in veterinary medicine: 1. Overuse and misuse - treating viral infections or without diagnosis. 2. Use as growth promoters or routine mass prophylaxis in poultry and pigs. 3. Wrong dose, duration or route, and stopping treatment early. 4. Sale of antimicrobials without prescription and self-treatment by farmers. 5. Poor biosecurity, hygiene and vaccination, so more disease needs treatment. Also: lack of laboratory diagnosis and sensitivity testing, environmental contamination with residues, weak regulation and surveillance."),
    ("A pig farmer reports sudden high mortality in his herd, with several pigs showing high fever, reddening of the skin of the ears and abdomen and loss of appetite. Some surviving pigs are lethargic, and they are not responding to antibiotic treatment. What is the most probable diagnosis? List five of the most important immediate actions, including biosecurity measures to control further spread.",
     [("Probable diagnosis: African swine fever (differential classical swine fever) - notifiable", 1.5), ("Five immediate actions: report to authorities (Dzongkhag/ NCAH), quarantine/ movement standstill, sample collection for lab confirmation, safe disposal of carcasses (burial/ burning), cleaning and disinfection, restrict visitors/ vehicles, no swill feeding, surveillance of neighbouring farms, culling/ compensation per national plan", 4.5)],
     "Most probable diagnosis: African swine fever (ASF) - high fever, skin reddening, sudden high mortality and no response to antibiotics; classical swine fever is the main differential. Both are notifiable diseases. Immediate actions: 1. Report at once to the Dzongkhag Livestock/Veterinary office and NCAH; do not move or sell any pigs (movement standstill and farm quarantine). 2. Collect samples (blood, spleen, lymph nodes) safely for laboratory confirmation. 3. Dispose of dead pigs safely by deep burial or burning on the farm under veterinary supervision - never sell, eat or throw carcasses in rivers. 4. Strict biosecurity - restrict entry of people, vehicles and other animals, use foot dips, dedicated clothing and boots, and clean and disinfect pens, equipment and vehicles. 5. Stop swill feeding, control the movement of pork products, and carry out surveillance and tracing of contact farms; stamping out and compensation follow the national contingency plan."),
    ("A 7-year-old Jersey cross cow from a herd grazing on marshy pasture presents with progressive weight loss, lethargy and marked submandibular oedema (bottle jaw). What is the most probable diagnosis? Outline a comprehensive treatment and control plan.",
     [("Diagnosis: chronic fasciolosis (liver fluke, Fasciola hepatica/ gigantica)", 1.5), ("Treatment: triclabendazole (all stages) or oxyclozanide/ albendazole/ closantel, supportive nutrition, confirm by faecal sedimentation", 2), ("Control: strategic deworming of herd, snail control (drainage, fencing marshy areas, molluscicides/ ducks), rotational grazing, avoid wet pastures in risk season, safe water troughs, monitoring", 2.5)],
     "Most probable diagnosis: chronic fasciolosis (liver fluke infestation) - grazing on marshy land (snail habitat), weight loss, anaemia and hypoproteinaemia causing bottle jaw. Confirm by faecal sedimentation for fluke eggs (and liver enzymes). Treatment: triclabendazole (effective against immature and adult flukes) or oxyclozanide/closantel/albendazole for adults; supportive feeding with good-quality forage and minerals; treat the whole herd. Control: strategic flukicide treatment of the herd at key times (e.g. before and after the monsoon); control snails - drain or fence off marshy areas, provide piped water troughs, use molluscicides or ducks where appropriate; rotational grazing away from wet pastures in high-risk seasons; avoid feeding grass cut from snail habitats; monitor with regular faecal tests and abattoir liver condemnation records; and educate farmers (also note zoonotic risk)."),
    ("Describe the key considerations and procedures for collecting blood samples from a cattle herd, including selection of sampling kits, techniques to maintain sample integrity, and best practices for handling, labelling and storing samples before laboratory analysis.",
     [("Planning: purpose (serology, haematology, PCR), sample size, restraint, consent, biosafety PPE", 1.5), ("Kits and technique: vacutainers - plain/ SST for serum, EDTA for whole blood/ haematology/ PCR, heparin; needles (18-20 G); jugular or coccygeal vein; aseptic, one needle per animal", 2), ("Integrity and handling: gentle inversion, avoid haemolysis, let serum clot upright, separate serum, cool chain 2-8 °C (freeze serum if delayed), no freezing of whole blood; labelling with ID, date, farm; submission form; triple packaging; quick transport", 2.5)],
     "Planning: define the purpose (serology, haematology, PCR, biochemistry), select animals and sample size, prepare restraint (crush/chute, halter) and PPE, and inform the owner. Kits: plain or serum-separator tubes for serum (serology), EDTA tubes for whole blood (haematology, PCR, blood parasites), heparin for some biochemistry; vacutainer holders with 18-20 G needles, alcohol swabs, cooler box with ice packs, marker pens, data sheets, sharps container. Technique: collect from the jugular or coccygeal (tail) vein after cleaning the site; use a new needle for each animal to avoid spreading disease; fill tubes to the correct volume; gently invert anticoagulant tubes; avoid haemolysis (do not shake, use proper needle size). Handling and storage: keep serum tubes upright at room temperature to clot, then cool; separate serum within 24 hours (freeze at -20 °C if delayed); keep EDTA blood at 2-8 °C and never freeze it; label each tube clearly (animal ID, farm, date, sample type) matching the submission form; use triple packaging and send quickly to the laboratory with the cold chain maintained."),
    ("Briefly explain the pathogenesis of mastitis in dairy cattle and outline the main strategies for its prevention and control in a herd.",
     [("Pathogenesis: bacteria (contagious - Staph aureus, Strep agalactiae; environmental - E. coli, Strep uberis) enter teat canal, multiply in udder, inflammation, neutrophil influx, raised somatic cell count, tissue damage, clinical/ subclinical", 2.5), ("Prevention/ control: milking hygiene, pre/post-milking teat dip, proper milking machine, dry cow therapy, treat clinical cases, cull chronic cases, clean dry housing/ bedding, CMT/ SCC monitoring, nutrition, milk last infected cows, records (five/ ten-point plan)", 3.5)],
     "Pathogenesis: bacteria enter the udder through the teat canal - contagious pathogens (Staphylococcus aureus, Streptococcus agalactiae) spread from cow to cow at milking, environmental pathogens (E. coli, Streptococcus uberis) come from dirty bedding and surroundings. They multiply in the milk ducts and alveoli, release toxins and trigger inflammation; neutrophils flood into the milk (high somatic cell count), causing swelling, pain, abnormal milk and damage to secretory tissue; infection may be clinical (visible changes) or subclinical (only raised SCC, lower yield), and severe coliform cases can cause toxaemia. Prevention and control (five-point/ten-point plan): hygienic milking - clean, dry teats, gloves, forestripping; post-milking teat disinfection (and pre-dipping); a well-maintained milking machine; prompt treatment and recording of clinical cases; dry cow therapy at drying-off (with teat sealants); culling chronically infected cows; clean, dry housing and bedding; milking infected cows last; regular California Mastitis Test or SCC monitoring; good nutrition (vitamin E, selenium); and keeping cows standing after milking (feeding them) while teat ends close."),
]
for i, (s, kp, mod) in enumerate(SAQ):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=6, topic=T, stem=s, key_points=kp, model=mod))
def it(q, m, kp, mod): return (q, m, kp, mod)
L1 = "Question 1: Transboundary animal diseases\nTransboundary animal diseases (TADs) pose a significant and ever-present threat to global animal health and food security."
L2 = "Question 2: One Health\nOne Health is a collaborative, multi-sectoral and trans-disciplinary approach to achieving optimal health outcomes, recognising the interconnection between people, animals, plants and their shared environment."
L3 = "Question 3: Aseptic technique in veterinary surgery\nAseptic technique in veterinary surgery is essential to minimise the risk of microbial contamination, thereby preventing surgical site infections that can cause significant complications and suffering in animal patients."
L4 = "Question 4: Rumenotomy\nYou are called to examine a 5-year-old Jersey cross cow with inappetence, tympany and swelling of the left paralumbar fossa. Clinical examination suggests ruminal tympany with a possible foreign body impaction. A decision is made to perform a rumenotomy."
Q += case("vet2025", 1, T, L1, items=[
    it("a. As a veterinarian, analyse the interplay of factors contributing to the rapid emergence and spread of TADs in a globalised world.", 5,
       [("Factors: trade and movement of animals/ products (legal and illegal, porous borders), travel, intensification and high-density farming, climate change/ vectors, wildlife interface, weak veterinary services/ surveillance, poverty/ smallholder biosecurity, conflict, pathogen evolution", 5)],
       "TADs such as FMD, ASF, avian influenza, PPR and lumpy skin disease spread rapidly because: increasing legal and illegal movement of live animals, meat and products across borders (Bhutan's long open border with India); global travel and trade; intensification with high-density farms and poor biosecurity; smallholders with low awareness and vaccination; climate change expanding vectors (ticks, midges, mosquitoes) and altering grazing; wildlife-livestock interfaces (wild boar, migratory birds); weak surveillance, diagnostics and veterinary capacity in some countries; under-reporting for fear of trade loss; and pathogen evolution. These factors interact - e.g. trade links regions while weak surveillance delays detection, allowing wide spread before control."),
    it("b. Discuss the roles of communities, local veterinary services, national authorities and international organisations (WOAH, FAO) in prevention, control and possible eradication of TADs. Also discuss the economic implications of a TAD outbreak for international trade and market access.", 15,
       [("Communities/ farmers: biosecurity, vaccination participation, early reporting, compliance with movement controls, community animal health workers", 3), ("Local veterinary services (Dzongkhag): surveillance, diagnosis, vaccination campaigns, outbreak response, awareness, data", 3), ("National authorities (DoL, NCAH, BAFRA): legislation, border quarantine, national strategies, contingency plans, labs, compensation, coordination", 3), ("International (WOAH, FAO): standards (Terrestrial Code), official status, reporting (WAHIS), technical/ financial support, regional programmes (GF-TADs), capacity building", 3), ("Economic implications: trade bans, loss of market access/ status, price drops, control costs, livelihood loss, tourism, recovery time", 3)],
       "Communities and farmers: practise biosecurity, vaccinate their animals, report sick or dead animals early, follow movement restrictions, avoid swill feeding and illegal trade; community animal health workers and village livestock groups help in surveillance and awareness. Local veterinary services (Dzongkhag and gewog livestock offices): passive and active surveillance, clinical investigation and sampling, vaccination campaigns (FMD, rabies, HS/BQ), rapid outbreak response (quarantine, ring vaccination, culling, disinfection), farmer education and data reporting. National authorities (Department of Livestock, NCAH, Bhutan Food and Drug Authority/border quarantine): legislation and regulations (Livestock Act), border control and import risk analysis, national disease control strategies and contingency plans, reference laboratories, vaccine supply, compensation schemes, coordination with health and wildlife sectors, and official reporting. International organisations: WOAH sets standards (Terrestrial Animal Health Code), recognises official disease status, collects outbreak reports through WAHIS and evaluates veterinary services (PVS); FAO provides technical and emergency support, laboratory networks and regional programmes (e.g. GF-TADs with WOAH, progressive control pathways for FMD and PPR eradication); both support capacity building and funding. Economic implications: an outbreak triggers immediate import bans by trading partners and loss of disease-free status, closing markets for animals and products for months or years; prices collapse and farmers lose income; governments bear costs of control, vaccination, culling and compensation; related sectors (feed, transport, tourism) suffer; regaining status requires costly surveillance and evidence; for small economies like Bhutan, outbreaks also affect food security and rural livelihoods."),
])
Q += case("vet2025", 2, T, L2, items=[
    it("a. What pivotal role does the veterinary profession play in advancing the One Health paradigm?", 5,
       [("Roles: zoonoses surveillance and control (about 60% of human infections zoonotic), food safety/ meat inspection, AMR stewardship, wildlife/ ecosystem health, early warning, public health veterinarians, research, collaboration/ joint outbreak response, education", 5)],
       "Veterinarians are central to One Health because about 60% of emerging human infections are zoonotic. They detect and control zoonoses at the animal source (rabies, brucellosis, avian influenza), run animal disease surveillance that gives early warning for human health, ensure food safety through meat and milk inspection and residue control, promote prudent antimicrobial use against AMR, monitor wildlife and ecosystem health, take part in joint outbreak investigations with health and environment sectors, conduct research and educate farmers and the public."),
    it("b. Using highly pathogenic avian influenza (HPAI H5N1) as an example, explain how a One Health approach is crucial in its surveillance, prevention and control at community, national and global levels.", 15,
       [("Community: farmer awareness, biosecurity (separating poultry from wild birds), reporting sick/ dead birds, safe handling, no selling sick birds, community-based surveillance", 4), ("National: joint multisectoral task force (livestock, health, wildlife, environment), integrated surveillance (poultry, wild birds, ILI/SARI in humans), lab capacity, contingency plan - culling, zoning, disinfection, compensation, protection of responders (PPE, antivirals), risk communication, border controls", 6), ("Global: WOAH/ FAO/ WHO tripartite (quadripartite) coordination, data sharing (WAHIS, GISAID), standards, vaccines/ candidate viruses, migratory bird monitoring, funding", 3), ("Shows why sectors must share data and act together", 2)],
       "Community level: farmers and households are taught biosecurity - keep poultry fenced or housed away from wild and migratory birds, clean water and feed, no mixing of new birds; report unusual bird deaths immediately; do not handle, sell or eat sick or dead birds; use protective gear when handling poultry; community animal health workers and health assistants share information. National level: a multisectoral One Health task force (Department of Livestock, Ministry of Health/RCDC, wildlife and forest departments, local government) with a joint contingency plan; integrated surveillance in poultry, wild birds and humans (influenza-like illness and SARI); shared laboratory capacity and data; rapid response - culling and safe disposal, disinfection, movement restriction zones, compensation; protection of responders with PPE, seasonal flu vaccine and antiviral prophylaxis; joint risk communication to the public; border controls on poultry imports. Global level: the FAO-WOAH-WHO-UNEP (Quadripartite) collaboration coordinates standards and response; outbreaks are reported through WOAH-WAHIS and virus sequences shared through networks such as GISAID; monitoring of migratory bird pathways; candidate vaccine viruses and pandemic preparedness; technical and financial support to countries. Working together in this way detects H5N1 earlier, prevents spread among poultry and from animals to people, reduces economic losses and lowers pandemic risk."),
])
Q += case("vet2025", 3, T, L3, items=[
    it("a. Explain the significance of aseptic technique in preventing surgical site infections, and the core principles of asepsis.", 5,
       [("Significance: SSIs cause pain, delayed healing, dehiscence, cost, death, AMR", 2), ("Principles: sterile instruments/ field, prepare patient and surgeon, minimise contamination, sterile items touch only sterile, theatre discipline, gentle tissue handling (Halsted's principles), short surgery time", 3)],
       "Surgical site infections cause pain, delayed healing, wound breakdown, prolonged treatment and costs, and may kill the animal or need more antibiotics (adding to AMR); aseptic technique prevents microorganisms entering the wound. Core principles: everything that contacts the wound is sterile; prepare the patient's skin and the surgeon (scrub, gown, gloves) to reduce microbes; maintain a sterile field - sterile items touch only sterile items, and anything doubtful is considered contaminated; keep traffic and talking in the theatre to a minimum; handle tissues gently, control bleeding and minimise dead space and surgery time (Halsted's principles)."),
    it("b. Outline the detailed steps in the preoperative preparation of both the patient and the surgeon.", 12,
       [("Patient: assessment, fasting (food/ water withholding, especially ruminants), stabilise, clip hair widely, initial scrub, positioning, final aseptic skin prep (povidone-iodine/ chlorhexidine, concentric pattern, alcohol), draping, prophylactic antibiotics timing, bladder/ rumen", 6), ("Surgeon: theatre attire (cap, mask, scrubs), remove jewellery, nails short, surgical hand scrub (timed, antiseptic, fingertips to elbows), dry with sterile towel, gowning, closed gloving, maintain hands above waist", 6)],
       "Patient: clinical examination and stabilisation (fluids, correct dehydration); withhold feed (12-48 h in ruminants, less for small animals) and water as appropriate; give prophylactic antibiotics if indicated within 60 minutes of incision; clip hair widely around the site (away from the theatre); initial skin scrub to remove dirt; position and restrain or anaesthetise; final aseptic preparation with povidone-iodine or chlorhexidine scrub, working from the incision site outwards in a concentric pattern, alternating with alcohol, three times; apply sterile drapes and towel clamps to isolate the field. Surgeon: put on clean theatre clothes, cap and mask; remove jewellery; keep nails short; perform a timed surgical hand scrub (3-5 minutes) with chlorhexidine or povidone-iodine from fingertips to elbows, hands kept above elbows; dry with a sterile towel; put on a sterile gown and gloves (closed gloving technique); keep hands above waist level and in front of the body, and touch only sterile items."),
    it("c. Describe the role and importance of sterilisation methods for surgical instruments.", 2,
       [("Sterilisation destroys all microbes including spores on instruments, preventing SSI/ cross-infection; methods (autoclave, ethylene oxide, dry heat, chemical/ cold sterilisation) chosen by material; monitoring with indicators", 2)],
       "Sterilisation destroys all microorganisms, including bacterial spores, on instruments that enter sterile tissue, preventing surgical site infection and spread of disease between animals. The method is chosen according to the material: steam autoclaving for metal instruments and linen, ethylene oxide or plasma for heat-sensitive items, dry heat for glassware, and chemical (cold) sterilisation where needed; effectiveness is checked with chemical and biological indicators."),
    it("d. What is the most commonly used and reliable sterilisation method for surgical instruments?", 1,
       [("Steam under pressure - autoclave (121 °C, 15 psi, 15 min or 134 °C, 3-4 min)", 1)],
       "Moist heat under pressure - autoclaving (e.g. 121 °C at 15 psi for 15 minutes, or 134 °C for 3-4 minutes)."),
])
Q += case("vet2025", 4, T, L4, items=[
    it("a. Describe the step-by-step surgical procedure of rumenotomy in cattle, highlighting preoperative preparation, surgical approach and postoperative care.", 12,
       [("Preoperative: diagnosis, stabilise (fluids), relieve tympany (stomach tube/ trocar), fasting 24-48 h, antibiotics, tetanus, NSAID, restraint standing", 3), ("Anaesthesia and approach: standing, left paralumbar fossa, aseptic prep, paravertebral or inverted-L block; vertical skin incision ~20-25 cm, through muscles and peritoneum", 3), ("Rumen fixation (Weingarth frame/ stay sutures/ rumen board), incision of rumen, removal of foreign body/ contents, explore reticulum, remove metal objects, check for abscess", 3), ("Closure: rumen two layers (Cushing/ Lembert inverting), lavage, peritoneum/ muscles, skin; postop: antibiotics, NSAIDs, fluids, gradual feeding, wound care, suture removal 10-14 days, magnet", 3)],
       "Preoperative preparation: confirm the diagnosis (history, auscultation/percussion, metal detector); stabilise with fluids and electrolytes; relieve tympany by stomach tube or trocar if severe; withhold feed for about 24-48 hours if possible; give prophylactic broad-spectrum antibiotics, an NSAID and tetanus prophylaxis; restrain standing in a crush. Anaesthesia and approach: clip and aseptically prepare the left paralumbar fossa; local anaesthesia by proximal paravertebral block (T13, L1, L2) or inverted-L block; make a vertical skin incision of about 20-25 cm in the middle of the fossa; incise the external and internal oblique and transverse abdominal muscles and peritoneum. Rumen fixation and opening: exteriorise the rumen wall and fix it to the skin with stay sutures or a Weingarth rumenotomy frame to prevent contamination of the peritoneal cavity; incise the rumen; remove frothy or impacted contents and foreign bodies (plastic, wire, nails); explore the reticulum for penetrating foreign bodies and adhesions, and empty and refill with healthy ruminal fluid (transfaunation) if needed. Closure: close the rumen in two inverting layers (Cushing then Lembert) with absorbable suture; clean the rumen wall and remove the stay sutures; close the peritoneum and transverse muscle, then the oblique muscles, and the skin (interrupted sutures). Postoperative care: antibiotics for 3-5 days, NSAIDs for pain, fluids, gradual reintroduction of good-quality hay and water, monitor appetite, rumination, temperature and wound; insert a rumen magnet; remove skin sutures after 10-14 days."),
    it("b. Discuss the possible complications of rumenotomy and their management.", 5,
       [("Complications with management: peritonitis (antibiotics, lavage), wound infection/ abscess/ dehiscence (drainage, antibiotics), cannula/ rumen fistula, recurrence of tympany/ indigestion (transfaunation, diet), adhesions, subcutaneous emphysema, shock", 5)],
       "Peritonitis from leakage of rumen contents - prevent with good fixation and closure; treat with broad-spectrum antibiotics, fluids and peritoneal lavage. Wound infection, abscess or dehiscence - aseptic technique, drainage, local wound care and antibiotics; resuture if needed. Recurrent tympany or indigestion - correct diet, transfaunation with healthy rumen fluid, rumenatorics. Adhesions and traumatic reticuloperitonitis if foreign bodies remain - thorough exploration and a magnet. Subcutaneous emphysema or seroma - usually resolves; drain if large. Shock or dehydration - fluid therapy and monitoring."),
    it("c. Explain the role of rumenotomy in the overall management of ruminal tympany and foreign body syndrome, including alternative treatment options.", 3,
       [("Rumenotomy indicated when conservative treatment fails, foreign bodies/ impaction, chronic recurrent bloat; also diagnostic", 1.5), ("Alternatives: stomach tube, trocar and cannula, antifoaming agents (poloxalene, oils), magnets, rumen fistula, diet change, prevention (fencing, waste management)", 1.5)],
       "Rumenotomy is indicated when tympany is caused by foreign bodies (plastic, wire) or impaction that cannot be relieved medically, for recurrent or chronic bloat, and to explore and treat traumatic reticuloperitonitis; it is both diagnostic and therapeutic. Alternatives: passing a stomach tube to release free gas; trocarisation or a temporary cannula (rumenostomy) in emergencies; antifoaming agents (poloxalene, vegetable oil, dimethicone) for frothy bloat; oral magnets for metallic foreign bodies; laxatives and rumenatorics; and prevention through diet management, introducing legumes gradually and keeping plastics and wire away from grazing areas."),
])
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions (answer any five)", "type": "short_answer", "count": 6, "marks_each": 6, "answer_any": 5},
    {"title": "Section B: Long answer questions (answer any TWO)", "type": "passage", "count": 4, "marks_each": 20, "answer_any": 2},
]
