"""ME Technical Paper II (General Subject Knowledge), MEDICAL SCIENCE group, BCSE 2023 - real paper (PDF sent by the founder).
Same pattern as 2024/2025 (Part I 70 MCQ x 1; Part II 10 short answers x 3), so it is ADDED to the paper's pattern.
Left out (answer not certain, two options defensible or no correct option): MCQ 1 (raw potato has more vitamin C than
tomato), 3 (glass outlasts plastic), 17, 26 (osmosis and endosmosis both right), 28, 37, 48, 57 (every option is false),
61 (the stem says force is proportional to distance), 62 (correct ratio √2:1 not offered), 67 (one or two bulbs).
Already on Soma (recorded as appearances, not loaded again): MCQ 33 and 41 (BCSE 2024 Medical Science Paper II).
Eleven new MCQs replace the left-out ones. Part II Q2 (heart diagram, numbered parts cannot be read from the PDF) is
replaced by a new question.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Medical Science): BCSE 2023, batch 1"
GROUP_TAG = "medsci2023"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "medical-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2023 Main Examination, Technical Paper II, Medical Science", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Medical Science: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "From the following which contains the highest amount of Vitamin C?",
"opts": [
"Apple",
"Banana",
"Tomato",
"Potato"
]
},
{
"n": 2,
"stem": "Example of the edible underground stem is:",
"opts": [
"Carrot",
"Groundnut",
"Topiaca",
"Potato"
]
},
{
"n": 3,
"stem": "Choose the one which can last the longest in the environmental pollution:",
"opts": [
"Plastic",
"Glass",
"Metal",
"Paper"
]
},
{
"n": 4,
"stem": "Choose the zoonotic diseases caused by virus:",
"opts": [
"Anthrax",
"Brucella",
"Rabies",
"Leptospirosis"
]
},
{
"n": 5,
"stem": "Which of the following is the correct statement about the veins?",
"opts": [
"Have valves",
"Carry blood to an organ",
"Usually carry oxygenated blood",
"Have narrow lumen compared to arteries"
]
},
{
"n": 6,
"stem": "All of the following are correct differences between bacteria and virus EXCEPT",
"opts": [
"Bacteria have cell wall but viruses do not have cell wall.",
"Viruses are smaller than bacteria.",
"Bacteria are visible under compound microscope but viruses are not visible.",
"DNA is enclosed inside nucleus in bacteria and in a coat of protein in viruses."
]
},
{
"n": 7,
"stem": "In the living cells, functions of storage and protein modification is performed by",
"opts": [
"Centrosome",
"Ribosome",
"Golgi bodies",
"Cellulose"
]
},
{
"n": 8,
"stem": "All the following are reptiles EXCEPT",
"opts": [
"Snake",
"Lizard",
"Crocodile",
"Earthworm"
]
},
{
"n": 9,
"stem": "Choose the correct by-products of photosynthesis:",
"opts": [
"Carbon dioxide-Water-starch",
"Oxygen- carbon dioxide-water",
"Oxygen-glucose-water",
"Water-carbon dioxide-carbohydrate"
]
},
{
"n": 10,
"stem": "All the following are important for energy production in cells EXCEPT",
"opts": [
"Cellulose",
"Starch",
"Glycogen",
"Fats"
]
},
{
"n": 11,
"stem": "Choose the haemoparasites from the following.",
"opts": [
"Ascaris lumbricoide",
"Trichiuris trichiuria",
"Ancylostoma duodenale",
"Wuchereria bancrofti"
]
},
{
"n": 12,
"stem": "The most correct property of mercury that differs from other metal is",
"opts": [
"Poisonous in nature",
"Liquid in nature at room temperature",
"Hard in nature",
"Ductile and malleable in nature"
]
},
{
"n": 13,
"stem": "All the following are toxic gases EXCEPT",
"opts": [
"Carbon dioxide",
"Ammonia",
"Hydrogen sulfide",
"Sulphur dioxide"
]
},
{
"n": 14,
"stem": "During the strenuous exercise, glucose is converted to",
"opts": [
"Lactic acid",
"Pyruvic acid",
"Citric acid",
"Acetic acid"
]
},
{
"n": 15,
"stem": "While mixing the oil and water, the oil floats on the water due to",
"opts": [
"difference in surface tension.",
"difference in ionic and polar bonding.",
"difference in density.",
"due to difference in viscosity."
]
},
{
"n": 16,
"stem": "From the following, choose the INCORRECT function of adipose tissues.",
"opts": [
"Insulation for the body",
"Food reserve for the body",
"Shock absorber of various organs",
"Packing tissues for the organs"
]
},
{
"n": 17,
"stem": "Which one of the following is wrongly matched?",
"opts": [
"Squamous epithelium – Buccal cavity",
"Cuboidal epithelium - Glands",
"Ciliated columnar epithelium-Bronchus",
"Stratified Squamous epithelium – esophagus"
]
},
{
"n": 18,
"stem": "Total number of bones in the human body is",
"opts": [
"204",
"205",
"206",
"207"
]
},
{
"n": 19,
"stem": "Which part of the human brain is concerned with the body balance?",
"opts": [
"Medulla oblongata",
"Cerebellum",
"Cerebrum",
"Hypothalamus"
]
},
{
"n": 20,
"stem": "Which of the following hormones is responsible for affection & attachment?",
"opts": [
"Adrenaline",
"serotonin",
"Oxytocin",
"Rennin"
]
},
{
"n": 21,
"stem": "The most accurate normal pH range of the human urine is",
"opts": [
"5.00-6.50",
"4.00-5.00",
"4.5-8.0",
"5.5.10-7.5"
]
},
{
"n": 22,
"stem": "Which of the following is responsible for connecting bone to bone?",
"opts": [
"Tendon",
"Fibrous cartilage",
"Hyaline cartilage",
"Ligament."
]
},
{
"n": 23,
"stem": "Choose the universal blood recipient.",
"opts": [
"Healthy person with O positive blood group.",
"Healthy person with O negative blood group.",
"Healthy person with AB positive blood group.",
"Healthy person with AB Negative blood group."
]
},
{
"n": 24,
"stem": "Function of incisor teeth is",
"opts": [
"Grinding",
"Cutting",
"Tearing",
"All of the above"
]
},
{
"n": 25,
"stem": "Non-citrus fruit among the following is",
"opts": [
"Tangerine",
"Lemon",
"Orange",
"Mango"
]
},
{
"n": 26,
"stem": "A dried grape placed in a container of water gets swell due to",
"opts": [
"Osmosis",
"Endosmosis",
"Exosmosis",
"Ultra-filtration"
]
},
{
"n": 27,
"stem": "Choose the correct formula for the process of photosynthesis is",
"opts": [
"CO2 + H2O + light energy = C6H12O6 + O2.",
"CO2 + 6H2O + light energy = 6 C6H12O6 + O2.",
"6CO2 + H2O + light energy = 6 C6H12O6 + 6O2.",
"6CO2 + 6H2O + light energy = C6H12O6 + 6O2."
]
},
{
"n": 28,
"stem": "All of the following are true for fertilization of mammalian ovum EXCEPT",
"opts": [
"Corpus luteum will degenerate",
"Progesterone secretion rapidly declines",
"Estrogen secretion further decreases",
"Primary follicle starts developing"
]
},
{
"n": 29,
"stem": "When there is insufficient water supply in the plant cells, the leaves tend to wilt and bend",
"opts": [
"due to reduced turgor pressure of a plant cell.",
"due to reduced transpiration pull force.",
"due to reduced osmotic pressure of the soil water.",
"due to increase non-osmotic pressure of the root hairs."
]
},
{
"n": 30,
"stem": "Choose the water-soluble vitamins:",
"opts": [
"Vitamin A",
"Vitamin D",
"Vitamin C",
"Vitamin E"
]
},
{
"n": 31,
"stem": "Which of the following is a disaccharide?",
"opts": [
"Fructose",
"Glucose",
"Galactose",
"Sucrose"
]
},
{
"n": 32,
"stem": "Which tissue cannot store glycogen or lipids for energy?",
"opts": [
"Nervous tissues",
"Skeletal muscle",
"Liver",
"Cardiac muscle"
]
},
{
"n": 33,
"stem": "Which of these functions is the least important for proteins?",
"opts": [
"become blood osmotic proteins",
"convert to enzymes",
"utilization for energy",
"component of structures"
]
},
{
"n": 34,
"stem": "Which of the following markers is an enzyme and indicate the prostate cancer?",
"opts": [
"AFP",
"ACP",
"CA-125",
"TFT"
]
},
{
"n": 35,
"stem": "All the following tests are advised for monitoring the patients with renal failure EXCEPT",
"opts": [
"Urea/Creatinine",
"Electrolytes",
"Urine 24 hours",
"HbA1c"
]
},
{
"n": 36,
"stem": "Phosphate is important for",
"opts": [
"bone matrix",
"ATP and energy reactions",
"DNA and RNA",
"All the above"
]
},
{
"n": 37,
"stem": "All the following elements are important for function of brain EXCEPT",
"opts": [
"Mn2+",
"K+",
"Fe2+",
"Na+"
]
},
{
"n": 38,
"stem": "How do parasympathetic neural signals affect the working of the heart?",
"opts": [
"Reduce both heart rate and cardiac output",
"Heart rate is increased without affecting the cardiac output",
"Both heart rate and cardiac output increase",
"Heart rate increases but cardiac output decreases"
]
},
{
"n": 39,
"stem": "Which position does the stimulation of muscle fiber by a motor neuron occurs?",
"opts": [
"Neuromuscular junction",
"The transverse tubules",
"The myofibril",
"The sarcoplasmic reticulum"
]
},
{
"n": 40,
"stem": "Choose the INCORRECT statement about the retina.",
"opts": [
"Retina is the light absorbing portion of the visual photo pigments",
"In retina the rods have the photo pigment rhodopsin while cones have three different photo pigments",
"Retina is derivatives of vitamin C",
"Rhodopsin is the purplish red protein present in rods only"
]
},
{
"n": 41,
"stem": "A location with luxuriant growth of lichens on the trees indicates that the",
"opts": [
"trees are very healthy.",
"trees are heavily infested.",
"location is highly polluted.",
"location is clean without pollution."
]
},
{
"n": 42,
"stem": "The zone of atmosphere in which the ozone layer is present is called",
"opts": [
"Ionosphere",
"Mesosphere",
"Stratosphere",
"Troposphere"
]
},
{
"n": 43,
"stem": "Choose the white blood cell which doesn’t contains granules.",
"opts": [
"Neutrophils",
"Eosinophil",
"Basophils",
"Lymphocytes"
]
},
{
"n": 44,
"stem": "Total number of deciduous teeth in humans is",
"opts": [
"32",
"20",
"26",
"14"
]
},
{
"n": 45,
"stem": "Which statement is CORRECT with reference to the circulation of blood in mammal?",
"opts": [
"Venous blood is returned to the left auricle",
"Pulmonary vein caries venous blood from the right auricle to the lungs",
"Pulmonary artery returns oxygenated blood from the lungs to the left auricle",
"Left auricle receives oxygenated blood from the lungs"
]
},
{
"n": 46,
"stem": "Over secretion of thyroid hormones lead to",
"opts": [
"Myxedema",
"Cretinism",
"Exophthalmic goiter",
"Simple goiter"
]
},
{
"n": 47,
"stem": "Which of the following is not derivatives of skin?",
"opts": [
"Sebaceous gland",
"Sweat gland",
"Bartholin gland",
"Mammary gland"
]
},
{
"n": 48,
"stem": "The noble gases used in the hospitals are",
"opts": [
"helium and neon",
"neon and argon",
"Helium, neon and argon",
"Helium, neon and krypton"
]
},
{
"n": 49,
"stem": "The material used as coating material for nonstick pan is",
"opts": [
"Polystyrene",
"Terylene",
"Teflon",
"PVC"
]
},
{
"n": 50,
"stem": "Stainless steel contains mainly iron and carbon along with",
"opts": [
"Co and Mn",
"Mn and Ni",
"Cr and Co",
"Ni and Cr"
]
},
{
"n": 51,
"stem": "Dental amalgam used for filling teeth consist of",
"opts": [
"Ag and Hg",
"Au and Hg",
"Au, Sn and Hg",
"Ag, Sn and Hg"
]
},
{
"n": 52,
"stem": "The most suitable indicator for the titration of a weak acid against a strong base is",
"opts": [
"Phenolphthalein",
"Litmus",
"Methyl orange",
"Thymol blue"
]
},
{
"n": 53,
"stem": "Molten sodium chloride conducts electricity due to the presence of",
"opts": [
"Free electrons",
"Free ions",
"Free molecules",
"Free atoms of sodium and chloride"
]
},
{
"n": 54,
"stem": "The hardness of water is estimated by",
"opts": [
"Conductivity method",
"EDTA method",
"Tityrimetric method",
"Distillation method"
]
},
{
"n": 55,
"stem": "Ozone is",
"opts": [
"a compound of oxygen.",
"an allotrope of oxygen.",
"an isotope of oxygen.",
"an isobar of oxygen."
]
},
{
"n": 56,
"stem": "The force of attraction or repulsion between two charged bodies is directly proportional to the product of their charges and inversely proportional to the square of the distance between them. It is called",
"opts": [
"Coulomb’s law",
"Faraday’s law",
"Law of conservation of charge",
"Ohms Law"
]
},
{
"n": 57,
"stem": "All the following are false for the effect of following factors for the resistance of a conductor EXCEPT",
"opts": [
"Inversely proportional to the length of conductor",
"Directly proportional to the cross section of the conductor",
"Inversely proportional to the temperature",
"Directly proportional to the density of electrons in the conductor"
]
},
{
"n": 58,
"stem": "The unit of potential energy is",
"opts": [
"Coulomb",
"Watt",
"Electron volt",
"Ampere"
]
},
{
"n": 59,
"stem": "The erratic random movement of microscopic particles in a fluid, as a result of continuous bombardment from molecules of the surrounding medium nucleus is known as",
"opts": [
"Endosmosis",
"Diffusion",
"Osmosis",
"Brownian Motion"
]
},
{
"n": 60,
"stem": "The electromagnetic radiation with shortest wavelength is",
"opts": [
"Ultraviolet rays",
"X-rays",
"Infra-red rays",
"Gamma rays"
]
},
{
"n": 61,
"stem": "Two bodies in space pull on each other with a force proportional to their masses and the distance between them:",
"opts": [
"Newton’s First Law",
"Newton’s Second Law",
"Newton’s Third Law",
"Newton's law of universal gravitation"
]
},
{
"n": 62,
"stem": "A 100 kg mass and 50 kg mass are moving with equal kinetic energies. The ratio of the magnitudes of their linear momentum is",
"opts": [
"2:1",
"1:2",
"1:1",
"4:1"
]
},
{
"n": 63,
"stem": "The moving fan is an example of energy conversion from",
"opts": [
"Mechanical to electrical energy",
"Potential to mechanical energy",
"Potential to electrical energy",
"Electrical to mechanical energy"
]
},
{
"n": 64,
"stem": "The type of pulleys used raising the water bucket from the well is",
"opts": [
"Fixed pulley",
"Movable pulley",
"Compound pulley",
"Combination of all."
]
},
{
"n": 65,
"stem": "LED bulb is encouraged to use for lighting home because",
"opts": [
"it is energy efficient compared to other bulbs.",
"it doesn’t emit UV rays.",
"it doesn’t produce heat in the room.",
"it does not emit polluting radiation which is prevents health hazard."
]
},
{
"n": 66,
"stem": "Mirage is formed by",
"opts": [
"reflection, refraction and dispersions of sunlight by pool of water.",
"reflection of sunlight by water pool.",
"refraction of sunlight by water pool.",
"when light passes through two layers of air with different temperatures."
]
},
{
"n": 67,
"stem": "The power consumed by two electric bulbs rated 220 volt and 100 watt and operated on 110 volt is",
"opts": [
"50 W",
"85 W",
"90 W",
"45 W"
]
},
{
"n": 68,
"stem": "Choose the bulb which has the highest resistance.",
"opts": [
"1000 W",
"100 W",
"60 W",
"26 W"
]
},
{
"n": 69,
"stem": "Chemical used for cooling in the refrigerator is",
"opts": [
"CO2",
"Liquid NH3",
"NH4OH",
"NH4CL"
]
},
{
"n": 70,
"stem": "All of the following properties are correct for Prism EXCEPT",
"opts": [
"All prisms have two bases that are equal and parallel.",
"Lateral sides of a prism are perpendicular to the base.",
"Prisms can reverse the direction of light by internal reflection",
"Prism is used in binoculars."
]
}
]"""

KEY = {
    2: ("d", "Potato is a stem tuber (it has eyes/ buds); carrot and tapioca are roots and groundnut is a fruit that develops underground."),
    4: ("c", "Rabies is caused by a virus (Lyssavirus); anthrax, brucellosis and leptospirosis are bacterial zoonoses."),
    5: ("a", "Veins have valves that stop backflow; they carry blood towards the heart, mostly deoxygenated, and have wide lumens."),
    6: ("d", "Bacteria are prokaryotes: their DNA lies free in the cytoplasm (nucleoid), not inside a nucleus."),
    7: ("c", "Golgi bodies modify, sort, package and store proteins made on the ribosomes."),
    8: ("d", "The earthworm is an annelid; snakes, lizards and crocodiles are reptiles."),
    9: ("c", "6CO2 + 12H2O → C6H12O6 + 6O2 + 6H2O: oxygen, glucose and water are the products."),
    10: ("a", "Cellulose is structural; humans cannot digest it for energy, while starch, glycogen and fats are energy sources."),
    11: ("d", "Wuchereria bancrofti (filaria) lives in the lymph and its microfilariae circulate in the blood; the others are intestinal worms."),
    12: ("b", "Mercury is the only metal that is liquid at room temperature."),
    13: ("a", "Carbon dioxide is not a toxic gas at normal levels; ammonia, hydrogen sulphide and sulphur dioxide are toxic."),
    14: ("a", "In strenuous exercise muscles lack oxygen, so pyruvate is reduced to lactic acid (anaerobic glycolysis)."),
    15: ("c", "Oil is less dense than water, so it floats; the two do not mix because oil is non-polar."),
    16: ("d", "Packing tissue between organs is areolar (loose connective) tissue; adipose tissue insulates, stores fat and cushions organs."),
    18: ("c", "An adult human skeleton has 206 bones."),
    19: ("b", "The cerebellum co-ordinates movement and maintains balance and posture."),
    20: ("c", "Oxytocin (the 'love/ bonding hormone') promotes affection and attachment, e.g. between mother and baby."),
    21: ("c", "Normal urine pH ranges from about 4.5 to 8.0 (average about 6)."),
    22: ("d", "Ligaments join bone to bone at joints; tendons join muscle to bone."),
    23: ("c", "AB positive blood has no anti-A, anti-B or anti-D antibodies, so it can receive any ABO/ Rh group (universal recipient)."),
    24: ("b", "Incisors are chisel-shaped front teeth used for cutting/ biting."),
    25: ("d", "Mango is not a citrus fruit; tangerine, lemon and orange are citrus fruits."),
    27: ("d", "6CO2 + 6H2O + light energy → C6H12O6 + 6O2 (chlorophyll)."),
    29: ("a", "Too little water lowers turgor pressure, so cells become flaccid and the leaves wilt."),
    30: ("c", "Vitamin C (and the B vitamins) are water-soluble; A, D, E and K are fat-soluble."),
    31: ("d", "Sucrose (glucose + fructose) is a disaccharide; fructose, glucose and galactose are monosaccharides."),
    32: ("a", "Nervous tissue keeps almost no glycogen or fat stores and depends on a constant supply of blood glucose."),
    34: ("b", "Acid phosphatase (ACP, especially prostatic acid phosphatase) is an enzyme marker of prostate cancer; AFP and CA-125 are not enzymes."),
    35: ("d", "HbA1c monitors blood-sugar control in diabetes; urea/ creatinine, electrolytes and 24-hour urine monitor renal failure."),
    36: ("d", "Phosphate is part of bone mineral (hydroxyapatite), ATP and the backbone of DNA and RNA."),
    38: ("a", "Parasympathetic (vagal) signals slow the heart rate and reduce force of contraction, so cardiac output falls."),
    39: ("a", "A motor neuron stimulates a muscle fibre at the neuromuscular junction (motor end plate), where acetylcholine is released."),
    40: ("c", "The visual pigments contain retinal, a derivative of vitamin A, not vitamin C."),
    42: ("c", "The ozone layer lies in the stratosphere, about 15-35 km above the Earth."),
    43: ("d", "Lymphocytes (and monocytes) are agranulocytes; neutrophils, eosinophils and basophils have granules."),
    44: ("b", "Children have 20 deciduous (milk) teeth."),
    45: ("d", "The left auricle (atrium) receives oxygenated blood from the lungs through the pulmonary veins."),
    46: ("c", "Excess thyroid hormone (Graves' disease) causes exophthalmic goitre; myxoedema and cretinism are due to deficiency."),
    47: ("c", "Bartholin glands are vulvo-vaginal glands, not skin derivatives; sebaceous, sweat and mammary glands develop from the skin."),
    49: ("c", "Non-stick pans are coated with Teflon (polytetrafluoroethylene)."),
    50: ("d", "Stainless steel is iron with chromium (at least about 10.5%) and usually nickel."),
    51: ("d", "Dental amalgam is mercury alloyed with silver, tin (and copper)."),
    52: ("a", "A weak acid-strong base titration ends at an alkaline pH (about 8-9), where phenolphthalein changes colour."),
    53: ("b", "Molten NaCl contains free Na+ and Cl- ions that carry the current."),
    54: ("b", "Hardness of water is estimated by complexometric titration with EDTA."),
    55: ("b", "Ozone (O3) is an allotrope of oxygen (O2)."),
    56: ("a", "This is Coulomb's law: F = kq1q2/r²."),
    58: ("c", "The electron volt is a unit of energy (1 eV = 1.6 × 10^-19 J), so it can measure potential energy; coulomb, watt and ampere measure charge, power and current."),
    59: ("d", "Brownian motion is the random movement of particles caused by collisions with fluid molecules."),
    60: ("d", "Gamma rays have the shortest wavelength (highest energy) of the electromagnetic spectrum."),
    63: ("d", "A fan's motor converts electrical energy into mechanical (kinetic) energy."),
    64: ("a", "A single fixed pulley at the top of a well changes the direction of the pull."),
    65: ("a", "LED bulbs give the same light for much less electrical power, so they save energy."),
    66: ("d", "A mirage forms when light bends (refraction, then total internal reflection) through layers of air at different temperatures."),
    68: ("d", "At the same voltage R = V²/P, so the lowest-power bulb (26 W) has the highest resistance."),
    69: ("b", "Liquid ammonia absorbs a lot of heat when it evaporates, so it was the classic refrigerant (modern units use HFCs)."),
    70: ("b", "Only right prisms have lateral faces perpendicular to the bases; oblique prisms do not, so this is not true of all prisms."),
}

NEW_MCQ = [
    ("Which fruit is the richest source of vitamin C among the following?", ["Banana", "Apple", "Amla (Indian gooseberry)", "Papaya"], "c",
     "Amla has about 400-600 mg of vitamin C per 100 g, far more than banana, apple or papaya."),
    ("Which of the following materials is biodegradable?", ["Polythene bag", "Glass bottle", "Aluminium can", "Vegetable peel"], "d",
     "Vegetable peels are broken down by micro-organisms; polythene, glass and aluminium persist for a very long time."),
    ("Simple squamous epithelium is found lining the", ["alveoli of the lungs", "inner surface of the stomach", "trachea", "skin surface"], "a",
     "Thin, flat simple squamous cells line the lung alveoli and blood vessels, allowing diffusion of gases."),
    ("When a living cell is placed in a hypertonic solution, it", ["swells and bursts", "loses water and shrinks", "stays the same size", "takes in salt and swells"], "b",
     "Water moves out by osmosis (exosmosis) into the more concentrated solution, so the cell shrinks (plasmolysis in plant cells)."),
    ("After fertilisation, the corpus luteum continues to secrete progesterone mainly under the influence of", ["FSH", "Oxytocin", "Human chorionic gonadotropin (hCG)", "Prolactin"], "c",
     "hCG from the developing embryo/ placenta keeps the corpus luteum alive in early pregnancy."),
    ("Which mineral is needed to make thyroxine?", ["Iron", "Iodine", "Calcium", "Zinc"], "b",
     "Thyroxine (T4) contains four iodine atoms; iodine deficiency causes goitre."),
    ("Which gas is used for MRI scanner magnets and in breathing mixtures for deep-sea divers?", ["Helium", "Argon", "Neon", "Xenon"], "a",
     "Liquid helium cools MRI superconducting magnets, and helium-oxygen mixtures are used by divers and in some breathing problems."),
    ("The resistance of a metallic conductor", ["decreases when its length increases", "increases when its cross-sectional area increases", "increases when its length increases", "does not depend on the material"], "c",
     "R = ρL/A: resistance is directly proportional to length, inversely proportional to area and depends on the material (ρ)."),
    ("According to Newton's law of universal gravitation, if the distance between two masses is doubled, the force between them becomes", ["twice as large", "half as large", "one-quarter as large", "four times as large"], "c",
     "F = Gm1m2/r², so doubling r makes the force 1/2² = 1/4 as large."),
    ("Two bodies have equal kinetic energy. If one has four times the mass of the other, the ratio of their momenta (heavier : lighter) is", ["1 : 2", "4 : 1", "1 : 1", "2 : 1"], "d",
     "p = √(2mE); with equal E, p ∝ √m, so the ratio is √4 : 1 = 2 : 1."),
    ("A bulb rated 100 W at 220 V is connected to a 110 V supply. The power it uses is", ["100 W", "50 W", "25 W", "200 W"], "c",
     "R = V²/P = 220²/100 = 484 Ω; at 110 V, P = 110²/484 = 25 W (a quarter, since power ∝ V²)."),
]

SAQ = [
 dict(marks=3, stem="What is rabies? Write down its causes, incubation period, host animals, symptoms, mode of transmission and preventive measures for rabies. (3 marks)",
      kp=[("Definition and cause: acute, almost always fatal viral encephalitis caused by the rabies virus (Lyssavirus, family Rhabdoviridae); incubation usually 1-3 months (from days to over a year)", 1),
          ("Hosts and transmission: dogs (main source in Bhutan), cats, foxes, jackals, bats, cattle; spread by bite, scratch or lick on broken skin/ mucosa (saliva). Symptoms: pain/ tingling at the bite, fever, headache, hydrophobia, aerophobia, agitation, paralysis, coma, death", 1),
          ("Prevention: dog vaccination and population control, avoid stray animals; wash wound 15 minutes with soap and water, post-exposure vaccine (+ rabies immunoglobulin for severe bites), pre-exposure vaccine for high-risk people, awareness", 1)],
      model="Rabies is an acute viral infection of the brain (encephalitis) that is almost always fatal once symptoms appear. Cause: the rabies virus, a Lyssavirus of the family Rhabdoviridae. Incubation period: usually 1 to 3 months, but it can be a few days to more than a year, shorter for bites on the face. Host animals: mainly dogs (the source of most human cases in Bhutan), also cats, foxes, jackals, bats and cattle. Transmission: the virus in saliva enters through a bite or scratch, or a lick on broken skin or mucous membranes. Symptoms: pain or tingling at the bite site, fever and headache, then anxiety, agitation, fear of water (hydrophobia) and of air (aerophobia), excessive salivation, paralysis, coma and death. Prevention: vaccinate dogs and control stray dog populations; avoid contact with stray or wild animals; after a bite, wash the wound with soap and running water for 15 minutes and seek care at once for post-exposure vaccination, with rabies immunoglobulin for severe bites; pre-exposure vaccination for high-risk groups (veterinary staff, dog handlers); and public awareness."),
 dict(marks=3, real=False, stem="Trace the path of blood through the human heart, naming the four chambers, the four valves and the major blood vessels entering and leaving the heart. (3 marks)",
      kp=[("Right side: superior and inferior vena cava → right atrium → tricuspid valve → right ventricle → pulmonary valve → pulmonary artery → lungs", 1.5),
          ("Left side: pulmonary veins → left atrium → mitral (bicuspid) valve → left ventricle → aortic valve → aorta → body", 1.5)],
      model="Deoxygenated blood from the body enters the right atrium through the superior and inferior venae cavae. It passes through the tricuspid valve into the right ventricle, which pumps it through the pulmonary valve into the pulmonary artery to the lungs, where it picks up oxygen and gives off carbon dioxide. Oxygenated blood returns through the pulmonary veins into the left atrium, passes through the mitral (bicuspid) valve into the left ventricle, and is pumped through the aortic valve into the aorta and on to the whole body. The four chambers are the right and left atria and right and left ventricles; the four valves are the tricuspid, pulmonary, mitral and aortic valves; the left ventricle has the thickest wall because it pumps blood to the whole body."),
 dict(marks=3, stem="Why do you think the Infection control and medical waste management system is important in the healthcare centres? Explain some important infection control and waste management practices you would follow when you work in the hospitals. (3 marks)",
      kp=[("Importance: prevents hospital-acquired infections in patients, staff and visitors; protects the community and environment from infectious and hazardous waste; prevents needle-stick injuries and spread of resistant organisms; quality and safety of care", 1),
          ("Infection control practices: hand hygiene (5 moments), PPE, standard precautions, safe injection practice, sterilisation/ disinfection, isolation, cleaning, vaccination of staff", 1),
          ("Waste management: segregate at source into colour-coded bins, sharps in puncture-proof containers (no recapping), safe storage, transport and treatment (autoclave, incineration), staff training and records", 1)],
      model="Importance: hospitals have many infectious patients, invasive procedures and hazardous waste. Good infection control and waste management prevent hospital-acquired infections in patients, staff and visitors, stop the spread of resistant organisms, prevent needle-stick injuries and infections such as hepatitis B, C and HIV, and protect waste handlers, the community and the environment; they are a basic part of safe, quality care. Practices I would follow: wash or rub hands at the WHO five moments; use gloves, masks, gowns and eye protection as needed (standard precautions); follow safe injection practices and never recap needles; clean, disinfect and sterilise instruments correctly; isolate infectious patients; keep wards clean; and keep my vaccinations (hepatitis B) up to date. For waste: segregate at the point of generation into colour-coded bins (general, infectious, sharps, pharmaceutical, chemical); put sharps into puncture-proof containers; store waste safely and send it for proper treatment such as autoclaving or incineration; and keep records and train staff."),
 dict(marks=3, stem="Describe the sources and functions of the following vitamins in tabulated form: Vitamin A, Vitamin C and Vitamin D. (3 marks)",
      kp=[("Vitamin A - sources: liver, eggs, milk, butter, carrots, green leafy vegetables, yellow fruits (beta-carotene); functions: vision in dim light (rhodopsin), healthy skin and mucous membranes, immunity, growth", 1),
          ("Vitamin C - sources: citrus fruits, amla, guava, tomatoes, chillies, green vegetables; functions: collagen formation and wound healing, antioxidant, iron absorption, immunity (deficiency: scurvy)", 1),
          ("Vitamin D - sources: sunlight on the skin, fish liver oil, oily fish, egg yolk, fortified milk; functions: absorption of calcium and phosphate, strong bones and teeth (deficiency: rickets/ osteomalacia)", 1)],
      model="Vitamin A | Sources: liver, fish liver oil, eggs, milk and butter; carrots, pumpkin, mango, papaya and dark green leafy vegetables (as beta-carotene) | Functions: needed for vision in dim light (part of rhodopsin), healthy skin and mucous membranes, normal growth and immunity; deficiency causes night blindness and xerophthalmia. Vitamin C | Sources: citrus fruits (oranges, lemons), amla, guava, tomatoes, chillies and fresh green vegetables | Functions: formation of collagen for skin, blood vessels and wound healing; antioxidant; helps absorb iron; supports immunity; deficiency causes scurvy (bleeding gums). Vitamin D | Sources: made in the skin by sunlight; fish liver oil, oily fish, egg yolk and fortified milk | Functions: increases absorption of calcium and phosphate from the gut for strong bones and teeth; deficiency causes rickets in children and osteomalacia in adults."),
 dict(marks=3, stem="Every year, the Health Bulletin published by the Ministry of Health shows a high number of deaths due to Alcoholic Liver Disease (ALD). Explain the functions of the liver. How does alcohol affect the liver? Explain some preventive measures to reduce ALD in Bhutan. (3 marks)",
      kp=[("Functions of liver: bile production, metabolism of carbohydrates (glycogen), fats and proteins (urea), detoxification of drugs and alcohol, plasma proteins and clotting factors, storage of vitamins and iron, bilirubin excretion", 1),
          ("Effect of alcohol: metabolised to toxic acetaldehyde → fatty liver → alcoholic hepatitis → fibrosis and cirrhosis (liver failure, liver cancer)", 1),
          ("Prevention: higher tax/ price, fewer outlets and limited hours, enforce age limit and drink-driving laws, control home-brewed ara, awareness and school education, early screening, counselling and rehabilitation, community and religious involvement", 1)],
      model="Functions of the liver: produces bile for fat digestion; stores glucose as glycogen and keeps blood sugar steady; metabolises fats and proteins and makes urea from ammonia; detoxifies drugs, alcohol and toxins; makes plasma proteins (albumin) and clotting factors; stores vitamins A, D and B12 and iron; and breaks down old red cells and excretes bilirubin. Effect of alcohol: the liver breaks alcohol down to acetaldehyde, which is toxic and produces free radicals; regular heavy drinking causes fat to collect in liver cells (fatty liver), then inflammation and cell death (alcoholic hepatitis), and finally scarring (fibrosis and cirrhosis) with liver failure, jaundice, ascites, bleeding and liver cancer. Prevention in Bhutan: raise taxes and prices on alcohol; reduce licences, opening hours and add dry days; enforce the legal drinking age and drink-driving laws; control home brewing and sale of ara; run awareness campaigns in communities and schools; screen drinkers in health centres and offer brief counselling, de-addiction and rehabilitation services; and involve families, local leaders and religious figures."),
 dict(marks=3, stem="Complete the following table with the differences between DNA and RNA for: nucleic acid (full name), sugar, structure, conformation, helix geometry, stability, function and nitrogen bases. (3 marks)",
      kp=[("Name and sugar: DNA = deoxyribonucleic acid with deoxyribose; RNA = ribonucleic acid with ribose. Bases: DNA has A, G, C, T; RNA has A, G, C, U", 1),
          ("Structure, conformation and helix: DNA double-stranded, B-form right-handed double helix, long; RNA usually single-stranded, can fold into A-form helical regions, shorter", 1),
          ("Stability and function: DNA more stable (no 2'-OH), stores and transmits genetic information; RNA less stable, carries information and makes proteins (mRNA, tRNA, rRNA)", 1)],
      model="Nucleic acid: DNA is deoxyribonucleic acid; RNA is ribonucleic acid. Sugar: DNA has deoxyribose; RNA has ribose. Structure: DNA is double-stranded and very long; RNA is usually single-stranded and shorter. Conformation: DNA forms a double helix of two antiparallel strands held by hydrogen bonds; RNA folds on itself into loops and hairpins (e.g. tRNA). Helix geometry: DNA is mainly the right-handed B-form helix; double-stranded regions of RNA take the A-form. Stability: DNA is chemically more stable (no 2'-OH group) and lasts long; RNA is less stable and easily broken down by enzymes and alkali. Function: DNA stores and passes on genetic information; RNA carries and uses this information to make proteins (mRNA, tRNA, rRNA). Nitrogen bases: DNA has adenine, guanine, cytosine and thymine; RNA has adenine, guanine, cytosine and uracil (instead of thymine)."),
 dict(marks=3, stem="On a graph of enzyme reaction velocity (V) against substrate concentration [S], define Vmax, ½Vmax and Km. (3 marks)",
      kp=[("Vmax: the maximum rate of the reaction when all enzyme active sites are saturated with substrate; the curve levels off (plateau)", 1),
          ("½Vmax: half of the maximum velocity; the point on the curve used to read Km", 1),
          ("Km (Michaelis constant): the substrate concentration at which the reaction rate is half of Vmax; a low Km means high affinity of the enzyme for its substrate", 1)],
      model="The graph of reaction velocity against substrate concentration is a rectangular hyperbola (Michaelis-Menten curve): velocity rises steeply at low [S] and then levels off. Vmax is the maximum velocity reached when the enzyme is fully saturated with substrate, so adding more substrate does not increase the rate (the plateau). ½Vmax is half of this maximum velocity. Km, the Michaelis constant, is the substrate concentration at which the velocity is half of Vmax (read from the curve by drawing across from ½Vmax and down to the [S] axis); it reflects the enzyme's affinity for its substrate - a low Km means high affinity, a high Km low affinity. These are related by V = Vmax[S]/(Km + [S])."),
 dict(marks=3, stem="State the specific function of each of the following: (a) Loop of Henle; (b) Islets of Langerhans; (c) Retina; (d) Cowper's gland; (e) Circle of Willis; (f) Pulmonary artery. (3 marks)",
      kp=[("(a) Loop of Henle - concentrates urine by reabsorbing water and salts (countercurrent mechanism); (b) Islets of Langerhans - endocrine pancreas secreting insulin, glucagon and somatostatin to regulate blood glucose", 1),
          ("(c) Retina - light-sensitive layer of the eye; rods and cones convert light into nerve impulses sent by the optic nerve; (d) Cowper's (bulbourethral) gland - secretes alkaline mucus that lubricates and neutralises the urethra before ejaculation", 1),
          ("(e) Circle of Willis - ring of arteries at the base of the brain linking carotid and vertebral circulation, giving collateral blood supply; (f) Pulmonary artery - carries deoxygenated blood from the right ventricle to the lungs", 1)],
      model="(a) Loop of Henle: creates a salt gradient in the kidney medulla (countercurrent multiplier) and reabsorbs water and sodium chloride, so concentrated urine can be produced. (b) Islets of Langerhans: endocrine cells of the pancreas - beta cells secrete insulin, alpha cells glucagon and delta cells somatostatin - which regulate blood glucose. (c) Retina: the inner light-sensitive layer of the eye whose rods (dim light) and cones (colour, bright light) convert light into nerve impulses carried to the brain by the optic nerve. (d) Cowper's (bulbourethral) gland: secretes a clear alkaline mucus that lubricates the urethra and neutralises acidic urine traces before ejaculation. (e) Circle of Willis: a ring of arteries at the base of the brain joining the internal carotid and vertebral (basilar) arteries, providing a collateral blood supply if one artery is blocked. (f) Pulmonary artery: carries deoxygenated blood from the right ventricle to the lungs for oxygenation."),
 dict(marks=3, stem="The following slogans describe four groups of important biomolecules. Name the group of biomolecules for each:\n1. \"We are polyhydroxyaldehydes or ketones; classified as mono-, oligo- and polysaccharides; held together by glycosidic bonds which supply energy and serve as structural constituents of the body.\"\n2. \"We are the basis of structure and function of life; composed of twenty amino acids, the building blocks; organized into primary, secondary, tertiary and quaternary structure; classified as simple, conjugated and derived.\"\n3. \"We are the chemical basis of life and heredity; organized into genes that control every function; composed of repeating units of deoxyribonucleotides; arranged in a double helix, held by hydrogen bonds.\"\n4. \"With water, we say, 'touch me not'; to the tongue, we are tasteful; within limits, we are dutiful; in excess, we are dangerous.\" (3 marks)",
      kp=[("1 - Carbohydrates; 2 - Proteins", 1.5), ("3 - Nucleic acids (DNA); 4 - Lipids (fats and oils - insoluble in water)", 1.5)],
      model="1. Carbohydrates (sugars - polyhydroxy aldehydes or ketones, linked by glycosidic bonds, giving energy and structure). 2. Proteins (made of 20 amino acids, with primary to quaternary structure; simple, conjugated and derived proteins). 3. Nucleic acids - DNA (deoxyribonucleotides arranged in a double helix, carrying genes and heredity). 4. Lipids (fats and oils - they do not mix with water, add taste to food, are useful in moderation but harmful in excess)."),
 dict(marks=3, stem="Name the phases of the menstrual cycle and give the usual start and end day of each (28-day cycle) for these descriptions:\n(i) Bleeding occurs; average blood loss 35 ml (10-80 ml); plasmin inhibits clotting of menstrual fluid; abdomen, back and thigh cramping.\n(ii) Thickening of the uterine lining; secretion of estradiol; folliculogenesis and formation of the Graafian follicle and ovum.\n(iii) Ovum is released; release of LH by the pituitary gland; LH matures the ovum and weakens the follicle wall.\n(iv) Secretion of hormones, especially progesterone by the corpus luteum; preparation for implantation.\n(v) Sloughing of the degenerated uterine lining; onset of bleeding. (3 marks)",
      kp=[("(i) Menstrual phase: day 1 to day 5; (ii) Follicular/ proliferative phase: day 6 to day 13", 1.5),
          ("(iii) Ovulation: about day 14; (iv) Luteal/ secretory phase: day 15 to day 28; (v) Ischaemic/ premenstrual phase: around day 28, leading into day 1 of the next cycle", 1.5)],
      model="(i) Menstrual phase - day 1 to day 5 (bleeding as the uterine lining is shed). (ii) Follicular (proliferative) phase - day 6 to day 13 (estrogen from the growing Graafian follicle thickens the endometrium). (iii) Ovulatory phase - about day 14 (the LH surge releases the ovum). (iv) Luteal (secretory) phase - day 15 to day 28 (the corpus luteum secretes progesterone and the uterus is prepared for implantation). (v) Ischaemic (premenstrual) phase - the last day(s) of the cycle, around day 28: if there is no pregnancy, the corpus luteum degenerates, progesterone falls, the lining breaks down and bleeding begins (day 1 of the next cycle). Days vary between women; a 28-day cycle is assumed."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
