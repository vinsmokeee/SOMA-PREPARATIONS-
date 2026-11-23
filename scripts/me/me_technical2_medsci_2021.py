"""ME Technical Paper II (General Subject Knowledge), MEDICAL SCIENCE group, BCSE 2021 - real paper (PDF sent by the founder).
Same pattern as 2022-2025 (Part I 70 MCQ x 1; Part II 10 short answers x 3), so it is ADDED to the paper's pattern.
Left out: MCQ 22, 36, 37, 40, 41, 57 and 68 (figures 'as of 2020/2021' that change and could not be confirmed), 34
(two or three pathways both taught), 42 (tier options overlap), 50 (calcium, the ion for synaptic transmission, is not
offered), 52 (the kidney does produce an enzyme, renin), 59 (H. pylori survives strong acid but grows best near neutral),
69 (exercise category depends on intensity, not given). Already on Soma (recorded as appearances, not loaded again):
MCQ 7 (BCSE 2023 MCQ 30) and MCQ 60 (BCSE 2023 MCQ 42). Thirteen new MCQs replace the left-out ones.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Medical Science): BCSE 2021, batch 1"
GROUP_TAG = "medsci2021"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "medical-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2021 Main Examination, Technical Paper II, Medical Science", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Medical Science: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "The term cell was first utilized by____________.",
"opts": [
"Tatum",
"Robert Hooke",
"Schwaan",
"De Bary"
]
},
{
"n": 2,
"stem": "Microfilaments are composed of a protein(s). This(se) protein(s) is(are) called",
"opts": [
"Actin",
"Tubulin",
"Myosin",
"All of the above"
]
},
{
"n": 3,
"stem": "Lysosomes are often known as scavengers of a cell. This is primarily due to _______________ of lysosomes.",
"opts": [
"catalytic activity",
"hydrolytic activity",
"parasitic activity",
"anabolic activity"
]
},
{
"n": 4,
"stem": "The oxygen and carbon dioxide cross the membrane by the process of ______________.",
"opts": [
"osmosis",
"active diffusion",
"facilitated diffusion",
"passive diffusion"
]
},
{
"n": 5,
"stem": "The food items especially those canned food can cause food poisoning. The toxin that causes poisoning is",
"opts": [
"Cholera toxin",
"Diphtheria toxin",
"Botulinum toxin",
"Tetanus Toxin"
]
},
{
"n": 6,
"stem": "Total number of essential vitamins required for the proper functioning of the human body is",
"opts": [
"12",
"13",
"14",
"15"
]
},
{
"n": 7,
"stem": "Which of the following vitamin is called water-soluble vitamin?",
"opts": [
"Vitamin A",
"Vitamin D",
"Vitamin C",
"Vitamin K"
]
},
{
"n": 8,
"stem": "Excessive consumption of calcium in our daily diet can result in",
"opts": [
"Blabber stones",
"Blood vessel hardening",
"Biliary stones",
"Kidney stones"
]
},
{
"n": 9,
"stem": "Human breath is “involuntarily during most of the times”. The center that controls this type of breathing are located in",
"opts": [
"respiratory neuron in cerebrum.",
"neurons by pulmonary arterioles.",
"neurons of pons and medulla.",
"neurons of alveolar-capillary network."
]
},
{
"n": 10,
"stem": "The maximum volume of air that can be exhaled forcefully is called",
"opts": [
"Tidal volume",
"Vital capacity",
"Total lung capacity",
"Expiratory volume"
]
},
{
"n": 11,
"stem": "Which one of the following causes permanent hardness of water?",
"opts": [
"Magnesium sulphate",
"Magnesium bicarbonate",
"Magnesium carbonate",
"Magnesium permanganate"
]
},
{
"n": 12,
"stem": "___________________ is present on the surface of the intestinal epithelial cells.",
"opts": [
"Microvilli",
"Zymogen vesicles",
"Pinocytic vesicles",
"Phagocytic vesicles"
]
},
{
"n": 13,
"stem": "Which of the following organs is known as “graveyard” of RBCs?",
"opts": [
"Spleen",
"Kidney",
"Liver",
"Gall bladder"
]
},
{
"n": 14,
"stem": "“Bundle of his” is an important part of",
"opts": [
"Pancreas",
"Brain",
"Kidney",
"Heart"
]
},
{
"n": 15,
"stem": "The building blocks of protein is",
"opts": [
"Amino acids",
"Atom",
"Elements",
"Molecule"
]
},
{
"n": 16,
"stem": "The “mitochondria” is richly found in which part of the human sperm?",
"opts": [
"Head of the sperm",
"Middle part of the sperm",
"Tails end of the sperm",
"All of the above"
]
},
{
"n": 17,
"stem": "The cartilage at the end of a long bone is called",
"opts": [
"Fibrous cartilage",
"Elastic cartilage",
"Hyaline cartilage",
"Calcified cartilage"
]
},
{
"n": 18,
"stem": "The tendency of an offspring to resemble its parents is known as",
"opts": [
"Heredity",
"Inheritance",
"Resemblance",
"Variation"
]
},
{
"n": 19,
"stem": "The balancing organ of the ear is",
"opts": [
"Organ of Corti",
"Vestibular apparatus",
"Tectorial membrane",
"Cochlea"
]
},
{
"n": 20,
"stem": "What is the shape of a growth curve in humans?",
"opts": [
"S shaped",
"V shaped",
"C shaped",
"J shaped"
]
},
{
"n": 21,
"stem": "As per the Constitution of Bhutan, ____________ states that government must provide basic free health to all the citizens.",
"opts": [
"Article 7",
"Article 8",
"Article 9",
"Article 10"
]
},
{
"n": 22,
"stem": "As per the annual Health Bulletin 2020, which of the following diseases is not in the top 10 diseases?",
"opts": [
"Diarrhoea",
"Peptic ulcer disorders",
"Accidents",
"Skins disorder"
]
},
{
"n": 23,
"stem": "Antibodies play critical role in the defense of the body against various agents. The blood cell responsible for secreting antibodies in our body is",
"opts": [
"Eosinophils",
"Monocytes",
"Lymphocytes",
"Neutrophils."
]
},
{
"n": 24,
"stem": "Which of the following cells is responsible for allergic reactions?",
"opts": [
"Eosinophils",
"Monocytes",
"Neutrophils",
"Lymphocytes"
]
},
{
"n": 25,
"stem": "Which one of the following is the hardest substance found in vertebrates?",
"opts": [
"Chondrin",
"Dentine",
"Enamel",
"Keratin"
]
},
{
"n": 26,
"stem": "Gross National Happiness is the guiding principle of Bhutan. There are 9 domain and 72 indicators to measure these 9 domains. Under the health domain, all of the following are indicators, EXCEPT",
"opts": [
"Mental health",
"Alcohol",
"Disability",
"Healthy days"
]
},
{
"n": 27,
"stem": "The medical Council is the apex body in Bhutan that is mandated to registration, CMEs and regulates quality of all health professionals. The correct full name of this Council is",
"opts": [
"Bhutan Medical and Health Council",
"Bhutan Health and Medical Council",
"Bhutan Medical Council",
"Bhutan Health Council"
]
},
{
"n": 28,
"stem": "What does the “19” in “Covid-19” refer to?",
"opts": [
"There are 19 variants of the Coronavirus.",
"There are 19 symptoms of coronavirus disease.",
"This is the 19th Coronavirus pandemic.",
"The coronavirus and disease it caused were identified in 2019."
]
},
{
"n": 29,
"stem": "The world HIV Day is observed on",
"opts": [
"1st November",
"1st December",
"1st January",
"1st March"
]
},
{
"n": 30,
"stem": "The unit of power of a lens is",
"opts": [
"Decibel",
"Joule",
"Diopter",
"Newton"
]
},
{
"n": 31,
"stem": "A post-partum woman from a rural community gave birth to a baby boy with the help of a midwife. She brought her baby to the hospital with complaints of continuous bleeding from the umbilical stump. Bleeding is due to deficiency of vitamin",
"opts": [
"A",
"D",
"E",
"K"
]
},
{
"n": 32,
"stem": "HbA1c monitoring in a Diabetic is used to monitor diabetic control depending on the life span of RBC. The life span of RBC is __________ days.",
"opts": [
"100",
"110",
"120",
"130"
]
},
{
"n": 33,
"stem": "Erythropoietin is secreted by",
"opts": [
"Spleen",
"Kidney",
"Liver",
"Thyroid"
]
},
{
"n": 34,
"stem": "The process of coagulation is classically divided into how many pathways?",
"opts": [
"2",
"3",
"4",
"5"
]
},
{
"n": 35,
"stem": "There are 17 Sustainable goals proposed to transform the world. Good health and well-being are one of the 17 goals. It is goal number",
"opts": [
"1",
"2",
"3",
"4"
]
},
{
"n": 36,
"stem": "As of 30th September 2021, Bhutan had _________ deaths due to Covid-19.",
"opts": [
"one",
"two",
"three",
"four"
]
},
{
"n": 37,
"stem": "The Covid-19 vaccination drive in Bhutan has been rigorous. Bhutan has achieved",
"opts": [
"90% coverage of eligible adult population.",
">90% coverage of eligible adult population.",
"<90% coverage of eligible adult population.",
"100% coverage of eligible adult population."
]
},
{
"n": 38,
"stem": "Where will the image of a distant object be formed when a person using a concave lens to correct vision, is not using glasses?",
"opts": [
"Behind the retina.",
"In front of the retina.",
"On the blindspot.",
"On the yellow spot."
]
},
{
"n": 39,
"stem": "A 45-year-old male patient developed severe anaphylaxis after a dose of amoxicillin. The most appropriate first line drug should be",
"opts": [
"Diazepam",
"Hydrocortisone",
"Adrenaline",
"Chlorpheniramine"
]
},
{
"n": 40,
"stem": "The most common Non-Communicable Disease (NCD) in Bhutan as of 2021 is",
"opts": [
"Diabetes Mellitus",
"Stroke",
"Hypertension",
"Kidney Failure"
]
},
{
"n": 41,
"stem": "Which one of the following Acts was amended recently by the Parliament of Bhutan?",
"opts": [
"Alcohol Control Act of Bhutan",
"Tobacco Control Act of Bhutan",
"Mental health Act of Bhutan",
"Suicide Act of Bhutan"
]
},
{
"n": 42,
"stem": "Bhutan’s Health system is a robust system with coherent flow of patient and information, and is organized into _________________ tier system.",
"opts": [
"3 (Referrals, Secondary and Primary centers)",
"4 (National Referral, Regional Referral, District and Primary Health centers)",
"5 (National, Regional referral, 40-60 bedded hospital, District and primary Centers)",
"All of the above"
]
},
{
"n": 43,
"stem": "The hardest metal found on earth is",
"opts": [
"Gold",
"Mercury",
"Tungsten",
"Lead"
]
},
{
"n": 44,
"stem": "To prevent radiation from X-rays and Gamma rays, _______________ is utilized especially in Radiology Department.",
"opts": [
"Mercury lined wall",
"Silver lined wall",
"Lead lined wall",
"All of the above"
]
},
{
"n": 45,
"stem": "The periodic table of elements contains",
"opts": [
"Alkali metals",
"Transition metals",
"Noble gases",
"All of the above"
]
},
{
"n": 46,
"stem": "Which one of the following will have maximum numbers of water molecules?",
"opts": [
"18 molecules of water",
"1.8 grams of water",
"18 grams of water",
"18 moles of water"
]
},
{
"n": 47,
"stem": "Radiodiagnosis is an important aspect of modern medicine. With progress in research in this field/specialty, a radiologist can choose number of radiodiagnosis tests. Which among the following has the highest level of radiation?",
"opts": [
"X-ray",
"Ultrasound scan",
"CT scan",
"MRI scan"
]
},
{
"n": 48,
"stem": "_______________ isotope is commonly used in diagnostic procedures in many of the cancers.",
"opts": [
"Potassium",
"Iodine",
"Titanium",
"Sodium"
]
},
{
"n": 49,
"stem": "_______________ is a process of breaking bigger molecules into smaller units that are either oxidized to release energy or used in other reactions.",
"opts": [
"Anabolism",
"Catabolism",
"Metabolism",
"Catalytic reactions"
]
},
{
"n": 50,
"stem": "Which of the following ions is essential for passage of signals from one nerve to another?",
"opts": [
"Potassium",
"Hydrogen",
"Chloride",
"Sodium"
]
},
{
"n": 51,
"stem": "Saliva in mouth plays important role in breaking down of food particles. This is primarily due to presence of which of the following salivary enzymes?",
"opts": [
"Amylase",
"Pepsin",
"Lipase",
"Protease"
]
},
{
"n": 52,
"stem": "Kidneys play critical roles in removal of waste products from the body. In addition to this role, kidneys also serve all of the following roles, EXCEPT",
"opts": [
"Production of erythropoietin",
"Vitamin D metabolism",
"Production of certain enzymes",
"Body fluid balance."
]
},
{
"n": 53,
"stem": "Aum Pem is a known diabetic for last 10 years. She has been prescribed injection short-acting insulin to control sugar. This means her body is not able to produce any insulin. Which group of cells are dysfunctional in Aum Pem’s body?",
"opts": [
"Hepatocytes",
"Alpha cells",
"Beta cells",
"Delta cells"
]
},
{
"n": 54,
"stem": "The reticular activating system (RAS) is responsible for arousal and sleep pattern in body. The RAS is located in the",
"opts": [
"Frontal cortex",
"Brain stem",
"Cerebrum",
"Spinal cord"
]
},
{
"n": 55,
"stem": "All of the following are primary colours, EXCEPT",
"opts": [
"Blue",
"Green",
"Red",
"Violet"
]
},
{
"n": 56,
"stem": "Snellen chart is used for testing",
"opts": [
"Colour Vision",
"Central vision",
"Visual Acuity",
"Peripheral vision"
]
},
{
"n": 57,
"stem": "Bhutan is increasingly witnessing huge burden of endocrine disorders and this is true especially in the recent years. As of 2021, Bhutan has ________ endocrinologists.",
"opts": [
"0",
"1",
"2",
"3"
]
},
{
"n": 58,
"stem": "_________________ is a branch of medicine which deals with the incidence, distribution, and possible control of diseases.",
"opts": [
"Biostatistics",
"Epidemiology",
"Health systems",
"Health economics"
]
},
{
"n": 59,
"stem": "H. Pylori is the bacteria responsible for causing the gastric cancer. This organism best survives in",
"opts": [
"slightly Acidic medium",
"strong Acidic medium",
"slightly Alkaline medium",
"strong Alkaline medium"
]
},
{
"n": 60,
"stem": "Ozone absorbs harmful ultraviolet rays from sun, thereby preventing many of the skin conditions in humans. Ozone is located in _______________ layer of the atmosphere.",
"opts": [
"Mesosphere",
"Stratosphere",
"Troposphere",
"Thermosphere"
]
},
{
"n": 61,
"stem": "Kawasaki disease is a condition that causes inflammation of",
"opts": [
"Muscles",
"Blood vessels",
"Tendons",
"Bones"
]
},
{
"n": 62,
"stem": "Night blindness is primarily caused by deficiency of vitamin",
"opts": [
"A",
"B",
"C",
"K"
]
},
{
"n": 63,
"stem": "There are 9 essential amino acids which play range of functions in our body. All of the following are essential amino acids, EXCEPT",
"opts": [
"Glutamine",
"Histidine",
"Leucine",
"Methionine"
]
},
{
"n": 64,
"stem": "Haemoglobin is mainly carrier of oxygen in the blood. Each Haemoglobin contains ________ heam units.",
"opts": [
"2",
"3",
"4",
"5"
]
},
{
"n": 65,
"stem": "The part of an eye that dilates and contracts based on the environment is",
"opts": [
"Cornea",
"Lens",
"Pupil",
"Sclera"
]
},
{
"n": 66,
"stem": "Hydrolysis of 1 molecule of ATP to ADP produces __________ of energy.",
"opts": [
"6.3 Kcal",
"7.3 Kcal",
"8.3 Kcal",
"9.3 Kcal"
]
},
{
"n": 67,
"stem": "All of the following drugs are classified under Non-Steroidal Anti-Inflammatory Drugs (NSAID), EXCEPT",
"opts": [
"Aspirin",
"Indomethacin",
"Mefenamic acid",
"Paracetamol"
]
},
{
"n": 68,
"stem": "__________________ is most common form of mental disorder in Bhutan as per the report in 2020.",
"opts": [
"Anxiety disorder",
"Bipolar disorder",
"Depression",
"Psychosis"
]
},
{
"n": 69,
"stem": "Mr Jigme Thinley is a 25 years old civil servant and drives to office daily. However, he plays futsal 3 times a week for 2 hours each. What is the category of his physical exercise?",
"opts": [
"Mild exercise",
"Moderate Exercise",
"Severe exercise",
"Extremely severe exercise"
]
},
{
"n": 70,
"stem": "The process of conversion of sugar to alcohol is",
"opts": [
"Fermentation",
"Infarction",
"Moulding",
"Nitrogen fixation"
]
}
]"""

KEY = {
    1: ("b", "Robert Hooke first used the term 'cell' in 1665 after seeing cork under his microscope."),
    2: ("a", "Microfilaments are made of the protein actin; microtubules are made of tubulin."),
    3: ("b", "Lysosomes contain hydrolytic enzymes that digest worn-out organelles, debris and microbes."),
    4: ("d", "Oxygen and carbon dioxide are small, non-polar molecules that cross membranes by simple (passive) diffusion."),
    5: ("c", "Botulinum toxin from Clostridium botulinum in badly canned food causes botulism."),
    6: ("b", "Humans need 13 essential vitamins: A, C, D, E, K and eight B vitamins."),
    8: ("d", "Very high calcium intake (especially from supplements) increases the risk of kidney stones."),
    9: ("c", "Automatic breathing is controlled by respiratory centres in the medulla oblongata and pons."),
    10: ("b", "Vital capacity is the maximum volume of air that can be breathed out forcefully after a maximum breath in."),
    11: ("a", "Permanent hardness is caused by sulphates and chlorides of calcium and magnesium; bicarbonates cause temporary hardness."),
    12: ("a", "Microvilli (the brush border) on intestinal cells greatly increase the surface for absorption."),
    13: ("a", "The spleen removes and destroys old and damaged red blood cells - the 'graveyard of RBCs'."),
    14: ("d", "The bundle of His is part of the heart's conducting system, carrying impulses from the AV node to the ventricles."),
    15: ("a", "Proteins are made of amino acids linked by peptide bonds."),
    16: ("b", "The middle piece of the sperm is packed with mitochondria that supply energy for swimming."),
    17: ("c", "Articular cartilage at the ends of long bones is hyaline cartilage."),
    18: ("a", "Heredity is the passing of characters from parents to offspring, so offspring resemble their parents."),
    19: ("b", "The vestibular apparatus (semicircular canals, utricle, saccule) maintains balance; the cochlea is for hearing."),
    20: ("a", "Human growth follows an S-shaped (sigmoid) curve: slow, then rapid, then levelling off."),
    21: ("c", "Article 9 (Principles of State Policy) of the Constitution of Bhutan provides for free access to basic public health services."),
    23: ("c", "Antibodies are secreted by B lymphocytes after they turn into plasma cells."),
    24: ("a", "Eosinophils (with basophils and mast cells) are involved in allergic reactions and fighting parasites."),
    25: ("c", "Tooth enamel is the hardest substance in the vertebrate body."),
    26: ("b", "The GNH health domain indicators are self-reported health, healthy days, disability and mental health; alcohol is not one of them."),
    27: ("a", "The Bhutan Medical and Health Council registers and regulates health professionals."),
    28: ("d", "COVID-19 stands for 'coronavirus disease 2019', the year the virus and disease were identified."),
    29: ("b", "World AIDS Day is observed on 1 December every year."),
    30: ("c", "The power of a lens is measured in dioptres (D = 1/focal length in metres)."),
    31: ("d", "Newborns are low in vitamin K; deficiency causes bleeding (haemorrhagic disease of the newborn), prevented by a vitamin K injection at birth."),
    32: ("c", "Red blood cells live about 120 days, so HbA1c reflects average blood glucose over the past 2-3 months."),
    33: ("b", "Erythropoietin is produced mainly by the kidneys and stimulates red cell production in the bone marrow."),
    35: ("c", "SDG 3 is 'Good health and well-being'."),
    38: ("b", "A concave lens corrects myopia, where distant objects are focused in front of the retina."),
    39: ("c", "Intramuscular adrenaline is the first-line drug for anaphylaxis; antihistamines and steroids are given after it."),
    43: ("c", "Among the options, tungsten is the hardest metal (gold, mercury and lead are soft)."),
    44: ("c", "Lead-lined walls block X-rays and gamma rays in radiology departments."),
    45: ("d", "The periodic table contains alkali metals, transition metals and noble gases, among others."),
    46: ("d", "18 moles of water contain 18 × 6.02 × 10^23 molecules, far more than 18 g (1 mole) or 1.8 g of water."),
    47: ("c", "A CT scan gives a much higher radiation dose than a plain X-ray; ultrasound and MRI use no ionising radiation."),
    48: ("b", "Radioactive iodine isotopes (I-131, I-123) are used to diagnose and treat thyroid cancer."),
    49: ("b", "Catabolism breaks large molecules into smaller ones, releasing energy."),
    51: ("a", "Salivary amylase (ptyalin) begins the digestion of starch in the mouth."),
    53: ("c", "Insulin is made by the beta cells of the islets of Langerhans; in type 1 diabetes these cells are destroyed."),
    54: ("b", "The reticular activating system lies in the brainstem."),
    55: ("d", "The primary colours of light are red, green and blue; violet is not a primary colour."),
    56: ("c", "The Snellen chart tests visual acuity (sharpness of distance vision)."),
    58: ("b", "Epidemiology studies the distribution, determinants and control of diseases in populations."),
    61: ("b", "Kawasaki disease is an inflammation of blood vessels (vasculitis), mainly in young children, affecting the coronary arteries."),
    62: ("a", "Vitamin A deficiency causes night blindness."),
    63: ("a", "Glutamine is a non-essential amino acid; histidine, leucine and methionine are essential."),
    64: ("c", "Haemoglobin has four globin chains, each with one haem group, so it carries four oxygen molecules."),
    65: ("c", "The pupil gets larger or smaller (by the iris muscles) according to the light."),
    66: ("b", "Hydrolysis of ATP to ADP releases about 7.3 kcal per mole under standard conditions."),
    67: ("d", "Paracetamol relieves pain and fever but has very little anti-inflammatory action, so it is not classed as an NSAID."),
    70: ("a", "Fermentation by yeast converts sugar into alcohol (ethanol) and carbon dioxide."),
}

NEW_MCQ = [
    ("The 'reservoir' of the hepatitis B virus in the community is mainly", ["mosquitoes", "chronically infected human carriers", "contaminated soil", "stray dogs"], "b",
     "Hepatitis B spreads from infected people (especially chronic carriers) through blood, sexual contact and from mother to baby."),
    ("In the coagulation cascade, fibrinogen is converted into fibrin by", ["thrombin", "plasmin", "heparin", "vitamin K"], "a",
     "Thrombin cuts fibrinogen into fibrin threads, which form the mesh of the clot."),
    ("Which of the following diseases is prevented by the BCG vaccine?", ["Measles", "Tuberculosis", "Polio", "Tetanus"], "b",
     "BCG (Bacillus Calmette-Guérin) vaccine protects young children against severe forms of tuberculosis."),
    ("Which vitamin is made in the skin when it is exposed to sunlight?", ["Vitamin A", "Vitamin C", "Vitamin D", "Vitamin K"], "c",
     "Ultraviolet B light converts 7-dehydrocholesterol in the skin into vitamin D3 (cholecalciferol)."),
    ("Which body mass index (BMI) range is classified as 'normal weight' for adults by WHO?", ["Below 18.5", "18.5-24.9", "25.0-29.9", "30 and above"], "b",
     "WHO adult BMI categories: below 18.5 underweight, 18.5-24.9 normal, 25-29.9 overweight and 30 or more obese."),
    ("Which gas is mainly responsible for the greenhouse effect caused by burning fossil fuels?", ["Oxygen", "Nitrogen", "Carbon dioxide", "Argon"], "c",
     "Burning coal, oil and gas releases carbon dioxide, the main greenhouse gas added by human activity."),
    ("The primary health care approach was declared at the international conference held in 1978 at", ["Geneva", "Alma-Ata", "Ottawa", "New Delhi"], "b",
     "The Declaration of Alma-Ata (1978) made primary health care the key to 'Health for All'."),
    ("Which ion enters the nerve ending and triggers the release of neurotransmitter at a synapse?", ["Calcium (Ca2+)", "Chloride (Cl-)", "Hydrogen (H+)", "Iodide (I-)"], "a",
     "When an impulse reaches the nerve ending, calcium ions enter and cause vesicles to release the neurotransmitter into the synapse."),
    ("Renin, an enzyme that helps regulate blood pressure, is secreted by the", ["liver", "kidney", "pancreas", "adrenal medulla"], "b",
     "Renin is secreted by the juxtaglomerular cells of the kidney and starts the renin-angiotensin-aldosterone system."),
    ("Which organism causes most peptic ulcers and is a risk factor for stomach cancer?", ["Escherichia coli", "Helicobacter pylori", "Salmonella typhi", "Vibrio cholerae"], "b",
     "Helicobacter pylori infection of the stomach causes most peptic ulcers and increases the risk of gastric cancer."),
    ("Which of the following is the most common symptom of depression?", ["Persistent low mood and loss of interest", "High fever", "Joint swelling", "Skin rash"], "a",
     "Depression is marked by persistent sadness and loss of interest or pleasure, with poor sleep, appetite and energy."),
    ("Which of the following is an example of vigorous-intensity physical activity?", ["Slow walking", "Running or playing football", "Light housework", "Sitting and reading"], "b",
     "Running and competitive football raise breathing and heart rate a lot (vigorous); walking and light housework are moderate or light."),
    ("WHO recommends that adults do at least how much moderate-intensity physical activity per week?", ["30 minutes", "60 minutes", "150 minutes", "500 minutes"], "c",
     "WHO recommends at least 150-300 minutes of moderate (or 75-150 minutes of vigorous) physical activity a week for adults."),
]

SAQ = [
 dict(marks=3, stem="List the 6 building blocks of health systems. Describe one of them in 2-3 lines. (2+1 marks)",
      kp=[("Six WHO building blocks: service delivery; health workforce; health information systems; access to essential medicines (medical products, vaccines, technologies); financing; leadership/ governance", 2),
          ("Correct 2-3 line description of any one (e.g. health workforce: enough, well-trained, motivated and fairly distributed staff)", 1)],
      model="The WHO six building blocks of a health system are: (1) service delivery; (2) health workforce; (3) health information systems; (4) access to essential medicines, vaccines and technologies (medical products); (5) health financing; and (6) leadership and governance. For example, the health workforce means having enough health workers with the right skills, who are well trained, motivated, fairly paid and distributed across the country (including rural areas) so that services reach everyone."),
 dict(marks=3, stem="Oral health is one of the major problems in Bhutan, but many health workers at PHCs and district level are not aware of the common oral health disorders. To increase early detection of oral health problems we must build the capacity of health professionals. Describe 2 resource-smart approaches to build the capacity of health professionals. (1.5x2 marks)",
      kp=[("Approach 1 (e.g. integrate oral health into existing in-service training/ CME and use online or virtual training and the national e-learning platform, with simple screening checklists and pictorial guides)", 1.5),
          ("Approach 2 (e.g. training of trainers/ cascade training by dental surgeons and dental hygienists at district level, supportive supervision, mentoring and tele-dentistry consultation)", 1.5)],
      model="(1) Integrate oral health into existing training: add a short module on common oral diseases (dental caries, gum disease, oral cancer and precancerous lesions, oral infections) into existing in-service training, CMEs and refresher courses for health assistants and nurses, and use online/ virtual sessions and simple pictorial screening guides and checklists, so no separate costly training is needed. (2) Training of trainers and mentoring: dental surgeons and dental hygienists at regional and district hospitals train a few focal persons, who then train staff at PHCs (cascade training); this is supported by supportive supervision visits, on-the-job mentoring and tele-dentistry (sending photos for advice), which builds skills and early referral at low cost."),
 dict(marks=3, stem="Name two occupational health diseases commonly seen in Bhutan. Name the most appropriate diagnostic test for diagnosis of respiratory diseases. (1+2 marks)",
      kp=[("Two occupational diseases, e.g. pneumoconiosis/ silicosis (mining, quarrying, stone crushing), occupational asthma/ dust-related lung disease, noise-induced hearing loss, musculoskeletal disorders/ back pain, pesticide poisoning, needle-stick infections in health workers", 1),
          ("Diagnostic test: spirometry (lung function test) for respiratory diseases, with chest X-ray (and sputum tests) as supporting tests", 2)],
      model="Occupational diseases seen in Bhutan include dust-related lung diseases such as silicosis/ pneumoconiosis among workers in mines, quarries, stone-crushing units and construction, and noise-induced hearing loss in industrial workers; others are musculoskeletal disorders (back pain), pesticide poisoning in farmers and needle-stick infections among health workers. The most appropriate diagnostic test for respiratory diseases is spirometry (pulmonary function test), which measures FEV1 and FVC to show obstructive or restrictive lung disease; a chest X-ray (and sputum examination for infection) supports the diagnosis."),
 dict(marks=3, stem="'Out of pocket expenditure' was 16% for Bhutan in 2018. This is interesting given that health care is free in Bhutan. Briefly describe 3 possible factors contributing to out-of-pocket expenditure. (3 marks)",
      kp=[("Indirect costs of seeking care: travel, food and lodging for patients and attendants, especially for referrals to Thimphu or abroad; lost wages", 1),
          ("Private purchase: medicines/ supplies not available or out of stock, private clinics, diagnostic services, pharmacies, spectacles, dental items", 1),
          ("Treatment outside the free system: self-referral and private treatment in India/ abroad, traditional/ religious healing (rituals), patient preference for private services", 1)],
      model="(1) Indirect costs: although treatment is free, patients and their attendants pay for travel, food and lodging when they go to district or referral hospitals or are referred to Thimphu, and they lose wages while away. (2) Buying medicines and services privately: when medicines, supplies or tests are out of stock or not on the essential list, people buy them from private pharmacies and diagnostic centres; they also pay for spectacles, some dental care and over-the-counter drugs. (3) Seeking care outside the free system: some people go to private clinics or travel to India or elsewhere for treatment on their own (self-referral), and many spend on rituals and traditional healing; these all add to out-of-pocket spending."),
 dict(marks=3, stem="What is EEG? Briefly describe the different types of brain waves. (1+2 marks)",
      kp=[("EEG (electroencephalogram/ -graphy): a recording of the electrical activity of the brain using electrodes placed on the scalp; used for epilepsy, sleep studies, brain death, encephalopathy", 1),
          ("Brain waves: delta (<4 Hz, deep sleep, infants), theta (4-7 Hz, drowsiness/ light sleep, children), alpha (8-13 Hz, relaxed awake with eyes closed), beta (13-30 Hz, alert, active thinking), gamma (>30 Hz, high-level processing)", 2)],
      model="An EEG (electroencephalogram) is a recording of the electrical activity of the brain, picked up by small electrodes placed on the scalp; it is used to diagnose epilepsy and seizures, study sleep and assess brain function (for example in encephalopathy or brain death). Types of brain waves: delta waves (below 4 Hz) - slow, large waves seen in deep sleep and in infants; theta waves (4-7 Hz) - in drowsiness and light sleep and in children; alpha waves (8-13 Hz) - in a relaxed, awake person with eyes closed, best over the back of the head; beta waves (13-30 Hz) - fast, low waves when alert, thinking or anxious; and gamma waves (above 30 Hz) - linked to high-level processing and concentration."),
 dict(marks=3, stem="What is oxygen debt? (3 marks)",
      kp=[("Definition: the extra oxygen taken in after strenuous exercise, above the resting need (excess post-exercise oxygen consumption, EPOC)", 1),
          ("Cause: during heavy exercise oxygen supply is not enough, so muscles respire anaerobically, producing lactic acid and using up ATP, creatine phosphate and myoglobin oxygen", 1),
          ("Repayment: the extra oxygen is used to oxidise lactic acid (or convert it to glucose in the liver), restore ATP/ creatine phosphate and reoxygenate myoglobin and blood; hence heavy breathing and fast heart rate continue after exercise", 1)],
      model="Oxygen debt (excess post-exercise oxygen consumption) is the extra amount of oxygen the body takes in after strenuous exercise, over and above its normal resting need. During heavy exercise the muscles need more oxygen than the lungs and blood can supply, so they also respire anaerobically: glucose is broken down to lactic acid, and stores of ATP, creatine phosphate and oxygen bound to myoglobin are used up. After the exercise stops, the person keeps breathing deeply and the heart keeps beating fast; the extra oxygen 'repays the debt' by oxidising lactic acid or converting it back to glucose in the liver (Cori cycle), rebuilding ATP and creatine phosphate, re-oxygenating myoglobin and haemoglobin and cooling the body."),
 dict(marks=3, stem="Draw and label an animal cell. List a function each of 2 organelles. (2+1 marks)",
      kp=[("Labelled diagram: cell (plasma) membrane, cytoplasm, nucleus with nucleolus and nuclear membrane, mitochondria, rough and smooth endoplasmic reticulum, ribosomes, Golgi apparatus, lysosomes, centrosome/ centrioles, vacuole (small)", 2),
          ("Functions of any 2, e.g. nucleus controls the cell and holds DNA; mitochondria make ATP (aerobic respiration); ribosomes make proteins; Golgi packages proteins; lysosomes digest waste", 1)],
      model="Diagram (described): a rounded cell bounded by a thin plasma membrane, with cytoplasm containing a large central nucleus (with nuclear membrane, nucleolus and chromatin), rod-shaped mitochondria with folded inner membranes (cristae), rough endoplasmic reticulum studded with ribosomes, smooth endoplasmic reticulum, free ribosomes, a stack of Golgi apparatus, small lysosomes, a centrosome with two centrioles near the nucleus and small vacuoles; there is no cell wall, chloroplast or large central vacuole. Functions: the nucleus contains DNA and controls all the activities of the cell; mitochondria are the 'powerhouses' that release energy as ATP by aerobic respiration (others: ribosomes make proteins, Golgi apparatus packages and secretes proteins, lysosomes digest waste and worn-out parts)."),
 dict(marks=3, stem="Define diffusion and facilitated diffusion. List one primary difference between the two. (2+1 marks)",
      kp=[("Diffusion: net movement of molecules from a region of higher concentration to lower concentration (down the gradient) without energy, directly through the membrane (e.g. O2, CO2)", 1),
          ("Facilitated diffusion: passive movement down the concentration gradient with the help of specific carrier or channel proteins in the membrane, no ATP (e.g. glucose into red cells, ions through channels)", 1),
          ("Difference: simple diffusion needs no membrane protein; facilitated diffusion needs specific carrier/ channel proteins (so it is specific and can be saturated)", 1)],
      model="Diffusion is the net movement of molecules or ions from a region of higher concentration to a region of lower concentration until they are evenly spread; it needs no energy and small, non-polar molecules such as oxygen and carbon dioxide diffuse directly through the lipid bilayer. Facilitated diffusion is also passive movement down the concentration gradient without ATP, but it takes place with the help of specific carrier or channel proteins in the membrane, for substances that cannot cross the lipid layer easily, such as glucose and ions. Primary difference: simple diffusion does not need membrane proteins, whereas facilitated diffusion depends on specific transport proteins, so it is selective and reaches a maximum rate when all carriers are busy (saturation)."),
 dict(marks=3, stem="What is the difference between renewable and non-renewable energy? Name 2 sources of each. (1+2 marks)",
      kp=[("Renewable energy comes from sources that are naturally replenished and will not run out (in human time); non-renewable comes from limited sources that take millions of years to form and are used up", 1),
          ("Renewable: hydropower, solar, wind, biomass, geothermal; non-renewable: coal, petroleum/ oil, natural gas, nuclear (uranium)", 2)],
      model="Renewable energy comes from natural sources that are constantly replaced and will not run out in human terms, and is generally cleaner; non-renewable energy comes from sources found in limited amounts that took millions of years to form and will be used up, and burning them pollutes. Renewable sources: hydropower (Bhutan's main source), solar energy, wind, biomass and geothermal energy. Non-renewable sources: coal, petroleum (oil and diesel), natural gas and nuclear fuel (uranium)."),
 dict(marks=3, stem="The ultrasound scan is a commonly used diagnostic test in modern medical practice. What is the principle of ultrasound scan? (3 marks)",
      kp=[("Ultrasound: high-frequency sound waves (about 2-18 MHz, above 20 kHz) produced by a piezoelectric transducer (probe) that both sends and receives", 1),
          ("Pulse-echo principle: waves pass into the body and are reflected (echoes) at boundaries between tissues of different acoustic impedance; gel removes air", 1),
          ("The time taken for echoes to return gives depth and their strength gives brightness; a computer forms a real-time image; no ionising radiation, safe in pregnancy; Doppler measures blood flow", 1)],
      model="An ultrasound scan uses very high-frequency sound waves (usually 2-18 MHz, far above the human hearing limit of 20 kHz). A probe (transducer) containing piezoelectric crystals converts electrical energy into sound pulses and sends them into the body; gel is used so there is no air between the probe and skin. When the sound waves meet boundaries between tissues of different density (acoustic impedance), part of the wave is reflected back as an echo - this is the pulse-echo principle. The same crystals receive the echoes and convert them into electrical signals; the time taken for an echo to return shows the depth of the structure and its strength shows the brightness, so a computer builds a real-time picture. It uses no ionising radiation, so it is safe in pregnancy, and the Doppler effect is used to measure blood flow."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
