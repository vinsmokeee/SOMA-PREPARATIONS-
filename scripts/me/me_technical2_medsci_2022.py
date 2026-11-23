"""ME Technical Paper II (General Subject Knowledge), MEDICAL SCIENCE group, BCSE 2022 - real paper (PDF sent by the founder).
Same pattern as 2023-2025 (Part I 70 MCQ x 1; Part II 10 short answers x 3), so it is ADDED to the paper's pattern.
Left out (answer not certain, two options defensible or a missing figure): MCQ 13 (fluoride, the trace element for teeth,
is not offered), 18, 23, 24 (stem and options contradict), 33 (bilirubin is in both bile and blood), 39, 41, 50 (air is
both a mixture and a gaseous solution), 61 (second and third laws both defensible), 65 (logic symbol not in the PDF).
Already on Soma (recorded as appearances, not loaded again): MCQ 3 and 19 (BCSE 2024 Medical Science Paper II), MCQ 37
(loaded from BCSE 2023). MCQ 64's stem matches an Engineering Paper II question word for word, so 'capacity' is written
'capacitance' (stems must be unique). Ten new MCQs replace the left-out ones.
Part II: Q3 (ear), Q5 (eye) and Q6 (heart) are diagram-labelling questions whose numbered parts cannot be read from the
PDF; they are replaced by new questions. Q4 (teeth) and Q10 (laws of reflection) are already on Soma from BCSE 2024 and
Q9 (infection control) from BCSE 2023, so they are recorded as appearances.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Medical Science): BCSE 2022, batch 1"
GROUP_TAG = "medsci2022"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "medical-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2022 Main Examination, Technical Paper II, Medical Science", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Medical Science: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Apple belongs to a group of fruits called",
"opts": [
"Drupes",
"Pomes",
"Berries",
"Nuts"
]
},
{
"n": 2,
"stem": "Choose the CORRECT basic needs of the human being.",
"opts": [
"Food-Water-Shelter-Education",
"Water-shelter-education-cars",
"Shelter-food-education-Cars",
"Cars-food-shelter-water"
]
},
{
"n": 3,
"stem": "Which of the following organism breathe through skin?",
"opts": [
"Snake",
"Lizard",
"Squirrel",
"Earthworm"
]
},
{
"n": 4,
"stem": "All of the following are important in Photosythenesis EXCEPT",
"opts": [
"Carbon dioxide",
"Water",
"Plastid",
"Oxygen"
]
},
{
"n": 5,
"stem": "Cell wall of a plant is composed of",
"opts": [
"Cellulose",
"Carbohydrates",
"Lipoprotein",
"Fats"
]
},
{
"n": 6,
"stem": "All of the following are functions of Henles loop in the human kidney EXCEPT",
"opts": [
"Transport of ions and water",
"Concentration of urine",
"Water and nutrient reabsorption",
"Dilution of the urine"
]
},
{
"n": 7,
"stem": "Which substance is in higher concentration in blood than in glomerular filtrate?",
"opts": [
"Urea",
"Plasma Protein",
"Glucose",
"Water"
]
},
{
"n": 8,
"stem": "The most accepted theory of origin of life is",
"opts": [
"special creation theory.",
"Theory of spontaneous generation.",
"Oparin Haldane Theory.",
"Theory of abiogenesis."
]
},
{
"n": 9,
"stem": "Most vitamins are",
"opts": [
"Co-enzymes",
"Catalyst",
"Competitive inhibitors",
"Feedback inhibitors"
]
},
{
"n": 10,
"stem": "Action potential is due to the movement of",
"opts": [
"NA+",
"K+",
"Cl-",
"Ca+"
]
},
{
"n": 11,
"stem": "All the following cause water appsorbtion into the plant EXCEPT",
"opts": [
"High Turgor Pressure of a plant cell",
"Transpiration pull force",
"Osmotic pressure of the soil water",
"Non osmotic pressure of the root hairs"
]
},
{
"n": 12,
"stem": "All the following are insoluble in water EXCEPT",
"opts": [
"Vitamin A",
"Vitamin D",
"Vitamin C",
"Vitamin E"
]
},
{
"n": 13,
"stem": "Choose the trace elements which is required for teeth formation.",
"opts": [
"Manganese",
"Copper",
"Calcium",
"Magnesium"
]
},
{
"n": 14,
"stem": "Health Bulletin of the Ministry of Health 2021 shows highest death due to alcohol. Choose the best advice for the public to advocate on alcohol effect.",
"opts": [
"Everyone should stop drinking immediately",
"Ignore the people seeing drinking in social gatherings and parties.",
"Avoid excessive drink and adopt of habit of daily exercise.",
"Stay at home without going anywhere"
]
},
{
"n": 15,
"stem": "Choose the function of parasympathetic nervous system.",
"opts": [
"Constriction of pupils",
"Acceleration of heart beat",
"Stimulating of sweat gland",
"Contraction of hair muscles"
]
},
{
"n": 16,
"stem": "Which of the following is not lymphoid tissue?",
"opts": [
"Thymus",
"Lymph node",
"Bone marrow",
"Liver"
]
},
{
"n": 17,
"stem": "Choose the good cholesterol from the following.",
"opts": [
"Chylomicron",
"Very low density lipoprotein",
"Low density Lipoprotein",
"High density Lipoprotein"
]
},
{
"n": 18,
"stem": "Appearance of Nairobi Fly probably indicates",
"opts": [
"Climatic Change",
"Environmental disturbance",
"Increase population",
"Onset of monsoon"
]
},
{
"n": 19,
"stem": "Infection induced by physician to the patient is known as",
"opts": [
"Iatrogenic",
"Nosocomial",
"Congenital",
"Subclinical"
]
},
{
"n": 20,
"stem": "The myofilaments of muscles consist primarily of two proteins. These two proteins are called",
"opts": [
"Actin and myosin",
"Progesterone and testosterone",
"Progesterone and estrogen",
"Actin and pectin"
]
},
{
"n": 21,
"stem": "All of the following are the impact of intensive farming called Green Revolution EXCEPT",
"opts": [
"Water scarcity",
"Loss of habitat",
"Increase in soil fertility",
"Loss of genetic diversity"
]
},
{
"n": 22,
"stem": "Increase in blood pressure and heart rate is caused by",
"opts": [
"Adrenaline",
"Thyroid",
"Secretin",
"Gastrin"
]
},
{
"n": 23,
"stem": "What causes people taking excess alcohol to vomit?",
"opts": [
"Stimulated by excess acetyl aldehyde",
"Due to entry of alcohol into the brain",
"Alcohol is converted to toxic substances in the liver",
"Lack of tolerance of stomach wall for the excess alcohol"
]
},
{
"n": 24,
"stem": "Choose the most favourable activities for asthmatic patients EXCEPT",
"opts": [
"Climbing mountains",
"Taking bath with cold water",
"Working in the industries and factories",
"Avoiding crowds and dusty places"
]
},
{
"n": 25,
"stem": "Sex of the child depends upon the kind of the sperm that fertilizes the egg. All eggs contain",
"opts": [
"only X chromosome.",
"only Y chromosome.",
"only XY chromosome.",
"only XX chromosome."
]
},
{
"n": 26,
"stem": "The number of major sense organs in the body is__________.",
"opts": [
"five",
"two",
"three",
"four"
]
},
{
"n": 27,
"stem": "Gout is due to accumulation of uric acid around the joints produced by",
"opts": [
"breakdown of purines.",
"breakdown of fats.",
"breakdown of carbohydrates.",
"breakdown of proteins."
]
},
{
"n": 28,
"stem": "When our eyes shift the vision from a nearby object to a distant object, it accommodates by",
"opts": [
"flattening the lens.",
"thickening the lens.",
"rotating the lens.",
"curving the lens."
]
},
{
"n": 29,
"stem": "Which of the following are the hormones produced by the pancreas?",
"opts": [
"Insulin and thyroxin.",
"Somatostatin and calcitonin",
"Adrenalin and glucagon.",
"Insulin, glucagon and somatstatin"
]
},
{
"n": 30,
"stem": "Anaerobic respiration in animals produces ______________.",
"opts": [
"lactic acid",
"ethanol",
"glucose",
"carbon dioxide"
]
},
{
"n": 31,
"stem": "The ear ossicles of a mammal are arranged in which one of the following orders from superficial to deep?",
"opts": [
"Malleus, incus, stapes",
"Malleus, stapes, incus",
"Incus, malleus, stapes",
"Stapes, incus, malleus"
]
},
{
"n": 32,
"stem": "The pepsin is example of enzymes produce by",
"opts": [
"chief cells in stomach.",
"parietal cells in stomach.",
"kidney cells.",
"Kupffer cells in the liver"
]
},
{
"n": 33,
"stem": "Bilirubin is found in___________.",
"opts": [
"Saliva",
"Bile",
"Blood",
"Pancreatic juice"
]
},
{
"n": 34,
"stem": "Which of the following are the least important for body energy?",
"opts": [
"Protein",
"ATP",
"Lipid",
"Carbohydrates"
]
},
{
"n": 35,
"stem": "Blood group of a person that contains two antigens in their blood cells is ________.",
"opts": [
"AB-",
"O+",
"AB+",
"A+"
]
},
{
"n": 36,
"stem": "The T3 & T4 hormone plays important in body metabolism. Where in the body are they produced?",
"opts": [
"Liver",
"Kidney",
"Spleen",
"Thyroid"
]
},
{
"n": 37,
"stem": "Which of the following is responsible for connecting bone to bone?",
"opts": [
"Tendon",
"Hyaline cartilage",
"Ligament",
"Elastic cartilage"
]
},
{
"n": 38,
"stem": "The chromosomes responsible for characteristics other than sex are known by the terms_______.",
"opts": [
"Ribosomes",
"Lysosomes",
"Autosomes",
"Spermatocytes"
]
},
{
"n": 39,
"stem": "The heart valve that prevent the back flow of the blood from the lungs is called _____________.",
"opts": [
"Tricuspid valve",
"Bicuspid valve",
"Mitral valve",
"Pulmonary valve"
]
},
{
"n": 40,
"stem": "Islet of Langerhans is found in",
"opts": [
"Pancreas",
"Liver",
"Spleen",
"Ovary"
]
},
{
"n": 41,
"stem": "Which one of the following is the primary ions involved in gaseous exchange in and out of the lungs?",
"opts": [
"H+ only",
"HCO3- only",
"H+ & HCO3-",
"PO4 only"
]
},
{
"n": 42,
"stem": "Which one of the following is the most appropriate characteristics of catalyst?",
"opts": [
"Doesn’t initiate chemical reaction but enhance the reaction.",
"Act as reactant in the chemical reaction.",
"Changed chemical composition after the reaction.",
"Change the final position of chemical equilibrium."
]
},
{
"n": 43,
"stem": "Chemicals which liquefy when exposed to air is called_____________.",
"opts": [
"Desiccator",
"Buffer",
"Hygroscopic substances",
"Anhygroscopic chemical"
]
},
{
"n": 44,
"stem": "Which of the following helps to keep a reagent or chemical dry?",
"opts": [
"Plastic bottles",
"Amber colored bottles",
"Desiccators",
"Test tubes"
]
},
{
"n": 45,
"stem": "During winter the metallic pipe gets cracked and burst due to:",
"opts": [
"High water pressure in winter",
"Contraction of the metallic pipe in winter",
"Expansion of ice in the pipe",
"Pipe becomes brittle during winter"
]
},
{
"n": 46,
"stem": "Choose the CORRECT phenomenon while cooking food at Lunana.",
"opts": [
"Food is cooked fast",
"Water boils slowly",
"Food is cooked slowly",
"Vapor pressure is increased"
]
},
{
"n": 47,
"stem": "The volume of a gas at constant temperature varies inversely with the pressure exerted on it. The above statement is_________________.",
"opts": [
"Boyle's Law",
"Charles' Law",
"Dalton's Law",
"Faraday's Law"
]
},
{
"n": 48,
"stem": "Which of the following among alkali metals is most reactive?",
"opts": [
"Sodium",
"Potassium",
"Rubidium",
"Caesium"
]
},
{
"n": 49,
"stem": "The ratio of y for inert gases is:",
"opts": [
"1.66",
"99",
"1.33",
"2.13"
]
},
{
"n": 50,
"stem": "Choose the correct statement about an air:",
"opts": [
"Air is a compound.",
"Air is a solution.",
"Air is mixture of gaseous elements.",
"Air is an element."
]
},
{
"n": 51,
"stem": "The atoms of the elements having same mass number but different atomic number are called:",
"opts": [
"Isotopes",
"Isobars",
"Isotones",
"Isomers"
]
},
{
"n": 52,
"stem": "Choose the element which is essential for construction of nuclear reactors.",
"opts": [
"Zirconium",
"Nickel",
"Cobalt",
"Tungsten"
]
},
{
"n": 53,
"stem": "The chemical compound used as baking powder is:",
"opts": [
"CaCO3",
"N2CO3",
"KHCO3",
"NaHCO3"
]
},
{
"n": 54,
"stem": "The most abundant metal on earth crust is:",
"opts": [
"Iron",
"Magnesium",
"Calcium",
"Aluminum"
]
},
{
"n": 55,
"stem": "Which of the following metals is not attacked by the environment?",
"opts": [
"Copper",
"Silver",
"Gold",
"Iron"
]
},
{
"n": 56,
"stem": "The voltage across a conductor is directly proportional to the current flowing through it, provided all physical conditions and temperatures remain constant. It is called:",
"opts": [
"Coulomb’s law",
"Faraday’s law",
"Law of conservation of charge",
"Ohms Law"
]
},
{
"n": 57,
"stem": "Electric field lines provide information about",
"opts": [
"Filed strengthen",
"Nature of charge",
"Direction",
"All the above"
]
},
{
"n": 58,
"stem": "The unit of an electric charge is:",
"opts": [
"Coulomb",
"Watt",
"Electron volt",
"Ampere"
]
},
{
"n": 59,
"stem": "All the following are properties of concave lens EXCEPT",
"opts": [
"One surface that curves inwards",
"Position of the image is before the object on the same side",
"Image formed is inverted",
"Image formed is virtual"
]
},
{
"n": 60,
"stem": "The electromagnetic radiation with longest wavelength is:",
"opts": [
"X-rays",
"Ultraviolet rays",
"Radio waves",
"Infra-red rays"
]
},
{
"n": 61,
"stem": "Hitting a ball gives an example of:",
"opts": [
"Newton’s First Law",
"Newton’s Second Law",
"Newton’s Third Law",
"Newton's law of universal gravitation"
]
},
{
"n": 62,
"stem": "A 4kg mass and a 1kg mass are moving with equal kinetic energies. The ratio of the magnitudes of their linear momenta is",
"opts": [
"1 : 2",
"1 : 1",
"4 : 1",
"2 : 1"
]
},
{
"n": 63,
"stem": "If a conductor has a potential V ≠ 0 and there are no charges anywhere else outside, then",
"opts": [
"there must be charges on the surface or inside itself.",
"there cannot be any charge in the body of the conductors.",
"there must be charges only on the surface.",
"Both (a) and (b) are correct."
]
},
{
"n": 64,
"stem": "In a parallel plate capacitor, the capacitance increases if",
"opts": [
"area of the plate is decreased.",
"distance between the plates increases.",
"area of the plate is increased.",
"dielectric constantly decreases."
]
},
{
"n": 65,
"stem": "The following logic symbol is equivalent to:",
"opts": [
"AND gate",
"OR gate",
"NOT gate",
"NAND gate"
]
},
{
"n": 66,
"stem": "The best example of converting light energy into electrical energy is",
"opts": [
"moving dynamo.",
"moving of turbine by water.",
"solar panel.",
"wind mill."
]
},
{
"n": 67,
"stem": "What type of pulley is a construction crane?",
"opts": [
"Fixed pulley",
"Single Movable pulley",
"Compound pulley",
"Combination of all"
]
},
{
"n": 68,
"stem": "All the following are the properties of image formed by a convex mirror EXCEPT",
"opts": [
"It is always formed behind the mirror between the pole and its focus.",
"It is always virtual and erect.",
"Its size is always smaller than the object",
"Magnification is always negative."
]
},
{
"n": 69,
"stem": "The strength of the earth’s magnetic field is",
"opts": [
"constant everywhere.",
"zero everywhere.",
"having very high value.",
"vary from place to place on the earth’s surface."
]
},
{
"n": 70,
"stem": "Which of the following colours of white light deviated most when passes through a prism?",
"opts": [
"Red light",
"Violet light",
"Yellow light",
"All the above"
]
}
]"""

KEY = {
    1: ("b", "Apple is a pome: a false fruit whose fleshy part develops from the thalamus around the core."),
    2: ("a", "Food, water and shelter are basic needs, with education usually added; cars are not a basic need."),
    4: ("d", "Oxygen is a product of photosynthesis, not a requirement; carbon dioxide, water and plastids (chloroplasts) are needed."),
    5: ("a", "The plant cell wall is made mainly of cellulose (with hemicellulose and pectin)."),
    6: ("c", "Nutrients (glucose, amino acids) are reabsorbed in the proximal convoluted tubule; the loop of Henle handles ions and water to concentrate or dilute urine."),
    7: ("b", "Plasma proteins are too large to pass the glomerular filter, so they stay at a higher concentration in blood."),
    8: ("c", "The Oparin-Haldane theory (chemical evolution) is the most accepted explanation of the origin of life."),
    9: ("a", "Most vitamins (especially the B group) act as coenzymes or their precursors."),
    10: ("a", "The rapid inflow of sodium ions (Na+) produces the depolarisation of the action potential."),
    11: ("a", "High turgor pressure inside the cell opposes water entry; transpiration pull, osmosis and active (non-osmotic) absorption cause water uptake."),
    12: ("c", "Vitamin C is water-soluble; vitamins A, D and E are fat-soluble (insoluble in water)."),
    14: ("c", "Advising moderation (avoiding excessive drinking) with daily exercise is practical health promotion."),
    15: ("a", "Parasympathetic stimulation constricts the pupils; the others are sympathetic effects."),
    16: ("d", "The liver is not a lymphoid organ; thymus, lymph nodes and bone marrow are lymphoid tissues."),
    17: ("d", "HDL is 'good' cholesterol: it carries cholesterol from the tissues back to the liver."),
    20: ("a", "Muscle myofilaments are made of the proteins actin (thin) and myosin (thick)."),
    21: ("c", "Intensive farming lowers soil fertility (over-use of chemicals); water scarcity, habitat loss and loss of genetic diversity are its impacts."),
    22: ("a", "Adrenaline (epinephrine) raises heart rate and blood pressure in the 'fight or flight' response."),
    25: ("a", "Every egg carries one X chromosome; the sperm carries either X or Y and decides the child's sex."),
    26: ("a", "The five major sense organs are the eyes, ears, nose, tongue and skin."),
    27: ("a", "Uric acid is the end product of purine breakdown; excess forms crystals in joints (gout)."),
    28: ("a", "For distant vision the ciliary muscles relax and the lens becomes flatter (thinner)."),
    29: ("d", "The pancreatic islets secrete insulin (beta cells), glucagon (alpha cells) and somatostatin (delta cells)."),
    30: ("a", "Anaerobic respiration in animal (muscle) cells produces lactic acid; yeast produces ethanol and CO2."),
    31: ("a", "From the eardrum inwards: malleus, incus, stapes."),
    32: ("a", "Chief (peptic) cells of the stomach secrete pepsinogen, which becomes pepsin; parietal cells secrete HCl."),
    34: ("a", "Proteins are used for energy only when carbohydrates and fats are short; their main roles are structural and functional."),
    35: ("a", "AB negative red cells carry two antigens (A and B); AB positive carries three (A, B and Rh D) and O none of A or B."),
    36: ("d", "T3 (triiodothyronine) and T4 (thyroxine) are made by the thyroid gland."),
    38: ("c", "Autosomes are the chromosomes other than the sex chromosomes (22 pairs in humans)."),
    40: ("a", "The islets of Langerhans are the endocrine part of the pancreas."),
    42: ("a", "A catalyst speeds up a reaction without starting it or being used up, and does not change the equilibrium position."),
    43: ("c", "Substances that absorb so much moisture from the air that they dissolve (deliquescent, e.g. NaOH, CaCl2) are strongly hygroscopic."),
    44: ("c", "A desiccator, containing a drying agent, keeps chemicals dry."),
    45: ("c", "Water expands by about 9% when it freezes; the expanding ice cracks the pipe."),
    46: ("c", "At high altitude (Lunana) air pressure is low, so water boils below 100 °C and food cooks slowly."),
    47: ("a", "Boyle's law: at constant temperature, the volume of a gas is inversely proportional to its pressure."),
    48: ("d", "Reactivity of alkali metals increases down the group; caesium is the most reactive of those listed."),
    49: ("a", "For monatomic (inert) gases, γ = Cp/Cv = (5/2)R/(3/2)R = 1.66."),
    51: ("b", "Isobars have the same mass number but different atomic numbers (e.g. argon-40 and calcium-40)."),
    52: ("a", "Zirconium alloys are used for fuel-rod cladding because they hardly absorb neutrons and resist corrosion."),
    53: ("d", "Baking soda is sodium hydrogen carbonate (NaHCO3)."),
    54: ("d", "Aluminium is the most abundant metal in the Earth's crust (about 8%)."),
    55: ("c", "Gold is a noble metal: it is not attacked by air, water or most acids."),
    56: ("d", "This is Ohm's law: V = IR at constant temperature and physical conditions."),
    57: ("d", "Field lines show direction (tangent), strength (density of lines) and the sign of the charge (lines start on positive, end on negative)."),
    58: ("a", "The SI unit of electric charge is the coulomb."),
    59: ("c", "A concave lens always forms a virtual, erect and diminished image on the same side as the object, never an inverted one."),
    60: ("c", "Radio waves have the longest wavelength of those listed."),
    62: ("d", "p = √(2mE); with equal kinetic energy, p ∝ √m, so √4 : √1 = 2 : 1."),
    63: ("d", "A conductor with a non-zero potential must carry charge (on its surface), and there can be no charge inside its body, so both (a) and (b) are correct."),
    64: ("c", "C = εA/d: capacitance increases with plate area (and dielectric constant) and decreases with separation."),
    66: ("c", "A solar (photovoltaic) panel converts light energy directly into electrical energy."),
    67: ("c", "Cranes use a compound pulley (block and tackle) to gain a large mechanical advantage."),
    68: ("d", "A convex mirror always forms a virtual, erect, diminished image, so its magnification is positive, not negative."),
    69: ("d", "The Earth's magnetic field varies from place to place (stronger near the poles, weaker near the equator)."),
    70: ("b", "Violet light has the shortest wavelength and the highest refractive index, so it deviates most."),
}

NEW_MCQ = [
    ("Which element is added to drinking water or toothpaste to help prevent tooth decay?", ["Fluorine (as fluoride)", "Chlorine", "Iron", "Sodium"], "a",
     "Fluoride makes tooth enamel more resistant to acid and helps prevent dental caries."),
    ("The vector of kala-azar (visceral leishmaniasis) is the", ["Aedes mosquito", "sandfly", "tsetse fly", "housefly"], "b",
     "Kala-azar is caused by Leishmania donovani and spread by the bite of the female sandfly (Phlebotomus)."),
    ("Which part of the brain contains the vomiting centre?", ["Cerebrum", "Cerebellum", "Medulla oblongata", "Hypothalamus"], "c",
     "The vomiting centre and the chemoreceptor trigger zone are in the medulla oblongata."),
    ("Which of the following is a common trigger of an asthma attack?", ["Drinking clean water", "House dust and pollen", "Eating green vegetables", "Sleeping on time"], "b",
     "Allergens such as house dust mites and pollen, smoke and cold air commonly trigger asthma attacks."),
    ("Bilirubin is formed mainly from the breakdown of", ["haemoglobin", "glycogen", "fatty acids", "urea"], "a",
     "When old red blood cells are broken down, haem is converted to biliverdin and then bilirubin, which the liver excretes in bile."),
    ("Which heart valve lies between the left atrium and the left ventricle?", ["Tricuspid valve", "Pulmonary valve", "Aortic valve", "Mitral (bicuspid) valve"], "d",
     "The mitral (bicuspid) valve stops blood flowing back from the left ventricle into the left atrium."),
    ("Most carbon dioxide is carried in the blood as", ["dissolved CO2 gas", "bicarbonate ions (HCO3-)", "carbaminohaemoglobin only", "carbonic acid crystals"], "b",
     "About 70% of CO2 is carried as bicarbonate formed in red cells by carbonic anhydrase; the rest is dissolved or bound to haemoglobin."),
    ("Which of the following is a pure substance (a compound), not a mixture?", ["Air", "Sea water", "Distilled water", "Brass"], "c",
     "Distilled water is the compound H2O; air, sea water and brass (an alloy) are mixtures."),
    ("The force that a rocket's exhaust gases exert backwards and the forward push on the rocket illustrate", ["Newton's first law", "Newton's third law", "the law of universal gravitation", "Ohm's law"], "b",
     "Newton's third law: for every action there is an equal and opposite reaction."),
    ("A logic gate whose output is 1 only when all its inputs are 1 is the", ["OR gate", "NOT gate", "AND gate", "NOR gate"], "c",
     "An AND gate gives output 1 only when every input is 1."),
]

SAQ = [
 dict(marks=3, stem="The STEPS survey on non-communicable diseases carried out in 2019 reported: mean salt intake 8.3 g/day against the WHO recommended 5 g/day; 42.9% of respondents were current drinkers of alcohol, of whom 22% were harmful drinkers aged 25-39 years; 23.9% were current users of tobacco products; 6% had raised blood sugar but were not on treatment; an increase in the proportion of overweight; and 86.4% had insufficient fruit and vegetable intake.\n(a) Write down the possible consequences for the public and the country if quick intervention is not implemented.\n(b) As a health worker, what strategy and policy would you advise the Department of Public Health to implement to gradually improve public health in the country? (3 marks)",
      kp=[("(a) Consequences: rising NCDs - hypertension, stroke, heart disease, diabetes and complications, kidney failure, liver disease, cancers; premature deaths and disability; higher health costs and burden on free health care; lost productivity and slower economic and GNH progress", 1.5),
          ("(b) Strategy/ policy: salt reduction (labelling, awareness), alcohol and tobacco control (tax, licensing, enforcement), promote physical activity and fruit/ vegetable intake, school and workplace health programmes, regular NCD screening (PEN/ health camps) and treatment follow-up, health education, multisectoral approach", 1.5)],
      model="(a) If nothing is done, hypertension, stroke and heart disease will rise from high salt intake; alcohol will increase liver disease, injuries, violence and road accidents; tobacco will raise cancers and lung and heart disease; untreated high blood sugar will lead to diabetic complications such as kidney failure, blindness and amputations; overweight and poor diet will add to all of these. The result will be more premature deaths and disability, a heavy and rising cost to the free health system (dialysis, referrals abroad), lost productivity and slower social and economic development. (b) I would advise: a national salt-reduction campaign with food labelling and less salt in suja and processed foods; stronger alcohol control (higher taxes, fewer licences, dry days, enforcing the age limit and drink-driving laws) and tobacco control enforcement with cessation services; promotion of physical activity (open spaces, walking, sports) and of fruit and vegetable production and intake; health-promoting schools and workplaces; regular community screening for blood pressure, blood sugar and BMI with treatment follow-up (WHO PEN approach); mass health education; and a multisectoral NCD policy involving agriculture, education, trade and local governments."),
 dict(marks=3, stem="What are the symptoms, mode of transmission and preventive measures for Monkeypox (mpox)? (3 marks)",
      kp=[("Symptoms: fever, headache, muscle and back pain, swollen lymph nodes (lymphadenopathy), then a rash that becomes vesicles/ pustules and crusts (face, palms, soles, genitals); lasts 2-4 weeks", 1),
          ("Transmission: close/ skin-to-skin contact with lesions, body fluids or contaminated materials (bedding), respiratory droplets during prolonged face-to-face contact, sexual contact, mother to fetus; from infected animals (bites, bushmeat)", 1),
          ("Prevention: isolate cases until lesions heal, avoid close and sexual contact with infected people, hand hygiene, PPE for health workers, avoid sharing bedding/ towels, safe handling of animals, vaccination of high-risk contacts, surveillance and contact tracing", 1)],
      model="Mpox (monkeypox) is a viral disease caused by the monkeypox virus (an orthopoxvirus). Symptoms: fever, headache, muscle and back aches, tiredness and characteristic swollen lymph nodes, followed by a rash that progresses from flat spots to raised bumps, fluid-filled vesicles and pustules and then crusts, often on the face, palms, soles and genital area; illness usually lasts 2 to 4 weeks. Transmission: close contact with an infected person's skin lesions, body fluids or contaminated items such as bedding and towels; respiratory droplets during prolonged face-to-face contact; sexual contact; from mother to baby; and from infected animals through bites, scratches or handling bushmeat. Prevention: isolate patients until all scabs fall off; avoid close or sexual contact with infected people; wash hands often; health workers use gloves, gowns, masks and eye protection; do not share bedding or clothes; handle animals safely; vaccinate high-risk contacts where available; and carry out surveillance, contact tracing and public awareness."),
 dict(marks=3, real=False, stem="Describe the functions of the outer ear, the middle ear and the inner ear, and explain how the inner ear helps the body keep its balance. (3 marks)",
      kp=[("Outer ear (pinna, ear canal): collects sound and directs it to the eardrum; wax protects the canal. Middle ear (eardrum, ossicles, Eustachian tube): transmits and amplifies vibrations; Eustachian tube equalises pressure", 1.5),
          ("Inner ear: cochlea (organ of Corti) converts vibrations into nerve impulses for hearing; vestibular apparatus (semicircular canals for rotation, utricle and saccule for gravity/ linear movement) detects head movement and position, sending signals via the vestibular nerve to the brain (cerebellum) for balance", 1.5)],
      model="Outer ear: the pinna collects sound waves and the external auditory canal directs them to the eardrum; wax and hairs in the canal protect it. Middle ear: the tympanic membrane vibrates and the three ossicles (malleus, incus, stapes) pass and amplify these vibrations to the oval window of the inner ear; the Eustachian tube connects the middle ear to the throat and keeps the air pressure equal on both sides of the eardrum. Inner ear: the cochlea, with the organ of Corti, changes the fluid vibrations into nerve impulses that travel along the auditory nerve to the brain for hearing. Balance: the vestibular apparatus of the inner ear contains three semicircular canals, set at right angles, which detect rotation of the head, and the utricle and saccule, which detect gravity and straight-line movement; movement of fluid (endolymph) bends hair cells, which send impulses through the vestibular nerve to the brain (cerebellum and brainstem) so that posture and eye movements are adjusted to keep balance."),
 dict(marks=3, real=False, stem="Name the structures of the eye through which light passes to reach the retina, in order, and give one function of each. Briefly explain how short-sightedness (myopia) is corrected. (3 marks)",
      kp=[("Path: cornea (main refraction, transparent window) → aqueous humour (nourishes, keeps shape) → pupil (opening; size controlled by the iris) → lens (fine focusing, accommodation) → vitreous humour (keeps eyeball shape) → retina (rods and cones convert light to impulses)", 2),
          ("Myopia: image forms in front of the retina (long eyeball/ strong lens); corrected with a concave (diverging) lens", 1)],
      model="Light passes through: (1) the cornea - the transparent front window that does most of the bending (refraction) of light; (2) the aqueous humour - fluid that nourishes the cornea and lens and keeps the front of the eye in shape; (3) the pupil - the opening whose size is controlled by the iris to regulate how much light enters; (4) the lens - changes shape (accommodation) to focus near and distant objects; (5) the vitreous humour - jelly that keeps the eyeball round and transmits light; and (6) the retina - where rods and cones convert light into nerve impulses carried by the optic nerve to the brain. In short-sightedness (myopia) the eyeball is too long or the lens too strong, so images of distant objects form in front of the retina; it is corrected with a concave (diverging) lens, which spreads the light so the image falls on the retina."),
 dict(marks=3, real=False, stem="Describe the conducting system of the human heart (SA node, AV node, bundle of His and Purkinje fibres) and state what an electrocardiogram (ECG) records. (3 marks)",
      kp=[("SA node in the right atrium is the pacemaker: starts each impulse, which spreads over both atria so they contract; AV node delays the impulse so the atria empty into the ventricles", 1.5),
          ("Bundle of His carries the impulse down the septum (right and left bundle branches) to the Purkinje fibres, which spread it through the ventricle walls so they contract from apex upwards; ECG records the heart's electrical activity (P wave, QRS complex, T wave) through skin electrodes", 1.5)],
      model="The heartbeat starts in the sinoatrial (SA) node, a group of special muscle cells in the wall of the right atrium that acts as the natural pacemaker (about 72 impulses a minute). The impulse spreads over both atria, which contract. It then reaches the atrioventricular (AV) node, which delays it briefly so that the atria finish emptying into the ventricles. From the AV node the impulse passes along the bundle of His in the interventricular septum, which divides into right and left bundle branches, and then into the Purkinje fibres, which spread it rapidly through the ventricular walls so the ventricles contract together from the apex upwards. An electrocardiogram (ECG) records this electrical activity through electrodes on the skin: the P wave shows atrial depolarisation, the QRS complex ventricular depolarisation and the T wave ventricular repolarisation; it is used to detect abnormal rhythms, heart attacks and other heart diseases."),
 dict(marks=3, stem="Draw a clear diagram of the glomerular filtration mechanism (the nephron) and show the following parts with clear arrow marks: renal artery, glomerulus, Bowman's capsule, proximal convoluted tubule, loop of Henle, distal convoluted tubule and collecting duct. (3 marks)",
      kp=[("Correct labelled diagram of a nephron: afferent arteriole from the renal artery into the glomerulus inside Bowman's capsule, leading to PCT, loop of Henle (descending and ascending limbs), DCT and collecting duct", 1.5),
          ("Arrows/ explanation: blood enters at high pressure, plasma is filtered (not cells and proteins) into Bowman's capsule; filtrate flows through PCT (reabsorption of glucose, amino acids, salts, water) → loop of Henle (concentration) → DCT (secretion, fine adjustment) → collecting duct (water reabsorption under ADH) → urine", 1.5)],
      model="Diagram (described): a branch of the renal artery gives an afferent arteriole that enters a knot of capillaries, the glomerulus, which sits inside the cup-shaped Bowman's capsule; a narrower efferent arteriole leaves it. From the capsule the tubule continues as the coiled proximal convoluted tubule, then the U-shaped loop of Henle dipping into the medulla, then the distal convoluted tubule, which drains into a collecting duct. Arrows show: blood flowing in from the renal artery; filtration of plasma - water, glucose, salts, urea - (but not blood cells and large proteins) from the glomerulus into Bowman's capsule because of the high glomerular pressure; flow of filtrate through the PCT (where glucose, amino acids, most salts and water are reabsorbed), the loop of Henle (where urine is concentrated), the DCT (secretion and fine adjustment of salts and pH) and the collecting duct (water reabsorbed under ADH), and urine leaving towards the renal pelvis."),
 dict(marks=3, stem="Explain Drug Sensitive TB (DS-TB), Extensively Drug-Resistant TB (XDR-TB) and Multi-Drug Resistant TB (MDR-TB), and give at least three important causes of increasing MDR-TB in Bhutan and its preventive measures. (3 marks)",
      kp=[("Definitions: DS-TB responds to the standard first-line drugs; MDR-TB is resistant to at least isoniazid and rifampicin; XDR-TB is MDR/ rifampicin-resistant TB also resistant to a fluoroquinolone and at least one more key second-line drug (e.g. bedaquiline/ linezolid; older definition: an injectable)", 1.5),
          ("Causes and prevention: irregular/ incomplete treatment and defaulting, poor DOT, delayed diagnosis, spread of resistant strains, drug supply problems, comorbidities; prevent with DOT and adherence support, early diagnosis with GeneXpert and drug-sensitivity testing, contact tracing, infection control, uninterrupted quality drugs, awareness", 1.5)],
      model="Drug-sensitive TB (DS-TB) is TB caused by bacteria that are killed by the standard first-line drugs (isoniazid, rifampicin, pyrazinamide, ethambutol) given for about 6 months. Multidrug-resistant TB (MDR-TB) is TB resistant to at least the two most powerful first-line drugs, isoniazid and rifampicin, and needs longer, costlier second-line treatment. Extensively drug-resistant TB (XDR-TB) is MDR/ rifampicin-resistant TB that is also resistant to a fluoroquinolone and at least one other key second-line drug such as bedaquiline or linezolid (earlier defined as resistance to a fluoroquinolone and an injectable drug); it is very hard to treat. Causes of rising MDR-TB in Bhutan: patients not completing or irregularly taking treatment; poor supervision of treatment; delayed diagnosis, so resistant strains spread in crowded homes and institutions; interrupted drug supply; and cross-border movement and comorbidities such as diabetes and alcohol use. Prevention: directly observed treatment with patient support; rapid diagnosis with GeneXpert and drug-sensitivity testing; screening of contacts; infection control in health facilities; uninterrupted quality drugs; and community awareness to reduce stigma and defaulting."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
