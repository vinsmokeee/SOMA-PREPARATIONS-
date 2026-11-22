"""ME Technical Paper II (General Subject Knowledge), MEDICAL SCIENCE group, BCSE 2024 - real paper. PDF sent by the founder.
Same pattern as 2025 (Part I 70 MCQ x 1; Part II 10 short answers x 3), so it is ADDED to the paper's existing pattern.
Left out (answer not certain, two options correct or no correct option): MCQ 8 (C. perfringens and C. botulinum both
cause food poisoning), 23, 24, 25, 26, 28, 35, 42, 44, 45, 60, 62 (a and b both define osmosis), 65 (correct ratio
√2:1 not offered), 66, 69 (energy given in watts); MCQ 5 is word for word the same as MLT Paper III 2024 MCQ 4
(already on Soma - stems must be unique); sixteen new MCQs keep Part I at 70.
Part II: Q4 (ear diagram - several labels point to parts too close to identify reliably) and Q5 (number of BHSQA
standards, objective elements and KPIs - could not be confirmed) are replaced by new questions. Q8 lists 'incident
ray' twice; the second is read as 'angle of reflection'.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Medical Science): BCSE 2024, batch 1"
GROUP_TAG = "medsci2024"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "medical-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper II, Medical Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Medical Science: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "All the statements are correct regarding bacteria EXCEPT",
"opts": [
"Respiration, cell division and sporulation are the functions of mitochondria in bacteria.",
"Capsule in bacteria enables adherence to surface and protection against phagocytosis.",
"Heterotrophs are the bacteria that are unable to Synthesize their own food materials",
"All the above"
]
},
{
"n": 2,
"stem": "Which of the follow is the important Macronutrient for the growth of plant?",
"opts": [
"Iron",
"Copper",
"Potassium",
"None of the above."
]
},
{
"n": 3,
"stem": "Which of the following is bisexual flower?",
"opts": [
"Corn",
"Mustard",
"Papaya",
"None of the above"
]
},
{
"n": 4,
"stem": "Which of the following organism breathes through skin?",
"opts": [
"Snake",
"Fish",
"Earth worm",
"Snail"
]
},
{
"n": 5,
"stem": "Which of the following is most resistant to sterilization?",
"opts": [
"Tubercle bacilli.",
"Viruses",
"Spores",
"Prions"
]
},
{
"n": 6,
"stem": "Which of the following plant is not a root?",
"opts": [
"Carrot",
"Radish",
"Turnip",
"Potato"
]
},
{
"n": 7,
"stem": "Most effective mode of transmission of HIV:",
"opts": [
"Sexual",
"Blood product",
"Needle/syringe",
"Mother of fetus"
]
},
{
"n": 8,
"stem": "Food poison is caused by:",
"opts": [
"Clostridium perfringens",
"Clostridium botulism",
"Corynebacterium diphtherae",
"Clostridium tetani"
]
},
{
"n": 9,
"stem": "Hand rub should not be used in which condition?",
"opts": [
"Before touching patient",
"After touching patient",
"After touching patient's surrounding",
"Hands are visibly soiled"
]
},
{
"n": 10,
"stem": "How many moments of hand hygiene have been laid down by WHO?",
"opts": [
"5 moments",
"6 moments",
"7 moments",
"8 moments"
]
},
{
"n": 11,
"stem": "Which antibody crosses placenta?",
"opts": [
"IgG",
"IGA",
"IgE",
"IgM"
]
},
{
"n": 12,
"stem": "Best way of sterilizing disposable plastic syringes is:",
"opts": [
"UV rays",
"Autoclave",
"Gamma rays",
"Hot air oven"
]
},
{
"n": 13,
"stem": "Dengue is caused by",
"opts": [
"Alphavirus",
"Bunyavirus",
"Flavivirus",
"Hantavirus"
]
},
{
"n": 14,
"stem": "Aorta arises from A:",
"opts": [
"Right atrium",
"Left atrium",
"Right ventricle",
"Left ventricle"
]
},
{
"n": 15,
"stem": "Which of the following cells is not a WBC?",
"opts": [
"Neutrophil",
"Basophil",
"Monocyte",
"Thrombocyte"
]
},
{
"n": 16,
"stem": "Which of the following is known as 'bad cholesterol?",
"opts": [
"LDL",
"HDL",
"VLDL",
"Chylomicrons"
]
},
{
"n": 17,
"stem": "Infections induced by a 'physician' is known as",
"opts": [
"Iatrogenic",
"Nosocomial",
"Congenital",
"Subclinical"
]
},
{
"n": 18,
"stem": "What is the major metabolically available storage form of iron in the body?",
"opts": [
"Hemosiderin",
"Ferritin",
"Transferrin",
"Hemoglobin"
]
},
{
"n": 19,
"stem": "The shape of a cell is maintained by which of the following?",
"opts": [
"Microtubules",
"Spindle Fibers",
"Ribosomes",
"Centrioles"
]
},
{
"n": 20,
"stem": "Which single feature of normal RBC’s is most responsible for limiting their life span?",
"opts": [
"Loss of mitochondria",
"Increased flexibility of the cell membrane",
"Reduction of Hb iron",
"Loss of nucleus"
]
},
{
"n": 21,
"stem": "The most important practice in preventing the spread of disease is:",
"opts": [
"Wearing masks during patient contact",
"Proper hand washing",
"Wearing disposable lab coats",
"Identifying specimens from known or suspected HIV and HBV patients with a red label"
]
},
{
"n": 22,
"stem": "The most common type of protein found in the cell membrane is:",
"opts": [
"Lipoprotein",
"Mucoprotein",
"Glycoprotein",
"Nucleoprotein"
]
},
{
"n": 23,
"stem": "Strand of RNA is made of:",
"opts": [
"Ribose sugar",
"Phosphate unit",
"Nitrogen base",
"Deoxyribose sugar"
]
},
{
"n": 24,
"stem": "Which of the following activates more than 100 different enzymes?",
"opts": [
"Vitamin A",
"Vitamin B",
"Vitamin C",
"Vitamin D"
]
},
{
"n": 25,
"stem": "Which of the following are obtained from fruits, vegetables, and cereals?",
"opts": [
"Monosaccharides",
"Sucrose",
"Cellulose",
"Starch"
]
},
{
"n": 26,
"stem": "Which of the following is used to make rectified spirit by fermentation process?",
"opts": [
"Cellulose",
"Starch",
"Glucose",
"Fructose"
]
},
{
"n": 27,
"stem": "Plants convert glucose (C6H12O6) in to:",
"opts": [
"Starch only",
"Cellulose only",
"Glucose",
"Starch and cellulose"
]
},
{
"n": 28,
"stem": "How many amino acids are synthesized by our bodies?",
"opts": [
"10",
"20",
"30",
"40"
]
},
{
"n": 29,
"stem": "Which of the following is the key to the ability of DNA to store genetic information and to pass it on from generation to generation?",
"opts": [
"Double stranded structure of DNA",
"Deoxyribose sugar",
"Phosphate unit",
"Nitrogen base"
]
},
{
"n": 30,
"stem": "Vitamin E is necessary for",
"opts": [
"Eyes and skin",
"Energy production in cells",
"Antioxidant",
"Blood clotting"
]
},
{
"n": 31,
"stem": "The vitamin which helps in chemical transmission of images from the eye to the brain is",
"opts": [
"Vitamin A",
"Vitamin B",
"Vitamin C",
"Vitamin D"
]
},
{
"n": 32,
"stem": "Specific organic compounds which are required by our bodies to prevent specific diseases but cannot be produced by our bodies are called",
"opts": [
"Hydrocarbons",
"Carbohydrates",
"Proteins",
"Vitamins"
]
},
{
"n": 33,
"stem": "Nutrition is derived by cows, cattle, goats, deer, sheep, and termites from",
"opts": [
"Cellulose",
"Starch",
"Monosaccharides",
"Oligosaccharides"
]
},
{
"n": 34,
"stem": "Human beings possess 46 chromosomes, divided as:",
"opts": [
"44 autosomes and 2 sex chromosomes",
"46 are autosomes",
"40 are autosomes and 6 sex chromosome",
"None of the above"
]
},
{
"n": 35,
"stem": "The distance which is travelled by an average red blood cell during its approximately four months life span is equal to",
"opts": [
"300 km",
"500 km",
"1000km",
"2000km"
]
},
{
"n": 36,
"stem": "Phenotype is the expression of",
"opts": [
"Genetic makeup",
"Physical makeup",
"Chemical composition",
"Metabolism"
]
},
{
"n": 37,
"stem": "Latex gloves protect the Hospital employee from:",
"opts": [
"Accidental needle puncture",
"Equipment handling injury",
"Patient aerosols",
"Body fluid"
]
},
{
"n": 38,
"stem": "The part of the hand that should not be used while checking someone else's pulse is",
"opts": [
"Index finger",
"Pinky finger",
"Central finger",
"Thumb"
]
},
{
"n": 39,
"stem": "Emerging and re-emerging infectious diseases are characterized by all, EXCEPT-",
"opts": [
"They have appeared for the first time or existed previously and presently increasing in incidence or Geographical range",
"They have developed resistance to drug",
"They are the result of increasing change in ecosystem, deforestation",
"They are seldom of Zoonotic origin"
]
},
{
"n": 40,
"stem": "All of the following are vaccine preventable diseases EXCEPT:",
"opts": [
"Measles",
"Hepatitis B",
"Dengue",
"Pertussis"
]
},
{
"n": 41,
"stem": "A location with luxuriant growth of lichens on the trees indicates that the:",
"opts": [
"trees are very healthy",
"trees are heavily infested",
"location is highly polluted",
"location is clean without pollution"
]
},
{
"n": 42,
"stem": "The zone of atmosphere in which the most of the aeroplane fly is called:",
"opts": [
"Ionosphere",
"Mesosphere",
"Stratosphere",
"Troposphere"
]
},
{
"n": 43,
"stem": "How many deciduous teeth are present in humans?",
"opts": [
"32",
"20",
"26",
"28"
]
},
{
"n": 44,
"stem": "Iodine deficiency in human being can lead to",
"opts": [
"Myxedema",
"Cretinism",
"Exophthalmic goiter",
"Simple goiter"
]
},
{
"n": 45,
"stem": "The noble gases used in the electrical light bulbs are:",
"opts": [
"Helium and neon",
"Neon and argon",
"Helium, neon and argon",
"Helium, neon and krypton"
]
},
{
"n": 46,
"stem": "The material commonly used for manufacturing water pipe is",
"opts": [
"Polystyrene",
"Terylene",
"Teflon",
"Polyvinyl chloride (PVC)"
]
},
{
"n": 47,
"stem": "Brass is an alloy of:",
"opts": [
"Ag & Mg",
"Mn & Ni",
"Cr and Co",
"Cu & Zn"
]
},
{
"n": 48,
"stem": "The metal most commonly used for dental braces is",
"opts": [
"Gold",
"Titanium",
"Stainless steel",
"Chrome"
]
},
{
"n": 49,
"stem": "Which of these functions is the least important for proteins?",
"opts": [
"Become blood osmotic proteins",
"Convert to enzymes",
"Utilization for energy",
"Component of structures"
]
},
{
"n": 50,
"stem": "The World Health Day is celebrated on:",
"opts": [
"1st March",
"7th April",
"6th October",
"10th December"
]
},
{
"n": 51,
"stem": "Cleanliness, physical exercise, rest and sleep are a part of:",
"opts": [
"Hygiene",
"Social hygiene",
"Personal hygiene",
"None of the above"
]
},
{
"n": 52,
"stem": "Which of the following factors is necessary for a healthy person?",
"opts": [
"Vaccination",
"Balanced diet",
"Personal hygiene",
"All of the above"
]
},
{
"n": 53,
"stem": "The moles of solute divided by the mass of solvent in kilograms is termed as:",
"opts": [
"Molality",
"Molarity",
"Moles",
"Equivalent weight"
]
},
{
"n": 54,
"stem": "Why is it difficult to recycle plastics?",
"opts": [
"It is very hard",
"It comes in different sizes",
"It is adhesive",
"It contains different types of polymer resins"
]
},
{
"n": 55,
"stem": "Which of the following plans is used as a waste management plan?",
"opts": [
"Plan for reuse",
"The integrated plan",
"Plan for recycling",
"Plan for reducing"
]
},
{
"n": 56,
"stem": "Which of the following wastes is called the Municipal Solid Waste (MSW)?",
"opts": [
"Food wastes",
"Wood pieces",
"Plastic cans",
"All of the above"
]
},
{
"n": 57,
"stem": "The process of burning municipal solid wastes under suitable temperature and conditions in a specific furnace is called:",
"opts": [
"Landfill",
"Incineration",
"Recycling",
"Vermicomposting"
]
},
{
"n": 58,
"stem": "The burning of solid waste is not recommended because",
"opts": [
"It is very costly",
"It requires a lot of space",
"It requires modern technologies",
"It causes several environmental issues"
]
},
{
"n": 59,
"stem": "Whenever a conductor is placed in a varying magnetic field, an electromotive force is induced. It is called",
"opts": [
"Coulomb’s law",
"Faraday’s law",
"Law of conservation of charge",
"Ohms Law"
]
},
{
"n": 60,
"stem": "All the following statements are “TRUE” for the factors effecting resistance of a conductor EXCEPT:",
"opts": [
"Directly proportional to the length of conductor",
"Inversely proportional to the cross section of the conductor",
"Directly proportional to the temperature",
"Inversely proportional to the density of electrons in the conductor"
]
},
{
"n": 61,
"stem": "The unit of electrical current is:",
"opts": [
"Coulomb",
"Watt",
"Electron volt",
"Ampere"
]
},
{
"n": 62,
"stem": "Choose the correct definition of Osmosis:",
"opts": [
"Movement of water molecules from a solution with a high concentration of water molecules to a solution with a lower concentration of water molecules through a partially permeable membrane of the cells.",
"Movement of water molecules from a less solute concentration to a high solute concentration through a semipermeable membrane.",
"Movement of molecules from a region of higher concentration to a region of lower concentration down the concentration gradient.",
"Random movement displayed by small particles that are suspended in fluids as a result of the collisions of the particles with other fast-moving particles in the fluid."
]
},
{
"n": 63,
"stem": "Choose the correct wavelength of X-ray which is commonly used electromagnetic radiation:",
"opts": [
"100-400 nm",
"0.1-10 nm",
"780 nm -1 mm",
"0.000001-0.1 nm"
]
},
{
"n": 64,
"stem": "For every action (force) in nature there is an equal and opposite reaction. It is called:",
"opts": [
"Newton’s First Law",
"Newton’s Second Law",
"Newton’s Third Law",
"Newton's law of universal gravitation"
]
},
{
"n": 65,
"stem": "A 120 kg mass and 60 kg mass are moving with equal kinetic energies. The ratio of the magnitudes of their linear momentum is:",
"opts": [
"2 : 1",
"1 : 2",
"1 : 1",
"4 : 1"
]
},
{
"n": 66,
"stem": "The moving Turbine in hydroelectric power plant is an example of energy conversion from:",
"opts": [
"Mechanical to electrical energy",
"Potential to mechanical energy",
"Potential to electrical energy",
"Electrical to mechanical energy"
]
},
{
"n": 67,
"stem": "A simple device that is used either to break the electrical circuit or complete it is called",
"opts": [
"Transistor",
"Switch",
"Capacitor",
"Transformer"
]
},
{
"n": 68,
"stem": "Magnetism of the earth is due to:",
"opts": [
"Doppler effect",
"Dynamo effect",
"Solar effect",
"Gravitational effect"
]
},
{
"n": 69,
"stem": "If a current of 1.5 ampere is maintained a resistor of 10 ohms, then the energy dissipated in the resistor in 1 minute is:",
"opts": [
"1350 W",
"22.5 W",
"135 W",
"125 W"
]
},
{
"n": 70,
"stem": "A stone is dropped from the roof of house to the ground. The kinetic energy of the stone will be maximum:",
"opts": [
"Just after it is dropped",
"When it is just on the half way",
"Just before it touches the ground",
"After touching the ground"
]
}
]"""

KEY = {
    1: ("a", "Bacteria have no mitochondria; respiration and related functions occur at the cell membrane/ mesosomes."),
    2: ("c", "Potassium (with N and P) is a primary macronutrient; iron and copper are micronutrients."),
    3: ("b", "Mustard flowers have both stamens and carpels (bisexual); maize and papaya flowers are usually unisexual."),
    4: ("c", "Earthworms breathe through their moist skin (cutaneous respiration)."),
    6: ("d", "Potato is a stem tuber; carrot, radish and turnip are modified roots."),
    7: ("b", "Transfusion of infected blood/ blood products carries the highest risk per exposure (over 90%)."),
    9: ("d", "Visibly soiled hands must be washed with soap and water; alcohol hand rub is not enough."),
    10: ("a", "WHO's '5 Moments for Hand Hygiene'."),
    11: ("a", "IgG is the only antibody that crosses the placenta."),
    12: ("c", "Disposable plastic syringes are sterilised industrially by gamma irradiation (heat would melt them)."),
    13: ("c", "Dengue virus is a flavivirus."),
    14: ("d", "The aorta arises from the left ventricle."),
    15: ("d", "Thrombocytes (platelets) are not white blood cells."),
    16: ("a", "LDL is 'bad cholesterol'; HDL is 'good'."),
    17: ("a", "Iatrogenic: caused by medical treatment or a physician; nosocomial: acquired in hospital."),
    18: ("b", "Ferritin is the main, readily available storage form of iron; haemosiderin is a less available form."),
    19: ("a", "Microtubules (part of the cytoskeleton) help maintain cell shape."),
    20: ("d", "Without a nucleus (and organelles) the RBC cannot make new proteins or repair itself, limiting its life to about 120 days."),
    21: ("b", "Proper hand washing is the single most important measure to prevent spread of infection."),
    22: ("c", "Glycoproteins are the most common proteins in the cell membrane."),
    27: ("d", "Plants convert glucose to starch (storage) and cellulose (cell walls)."),
    29: ("d", "Genetic information is stored in the sequence of nitrogenous bases."),
    30: ("c", "Vitamin E is the main fat-soluble antioxidant."),
    31: ("a", "Vitamin A forms retinal in rhodopsin, needed for vision."),
    32: ("d", "Vitamins are organic compounds needed in small amounts that the body cannot make in sufficient quantity."),
    33: ("a", "Ruminants and termites digest cellulose with the help of microbes in their gut."),
    34: ("a", "22 pairs of autosomes (44) and one pair of sex chromosomes."),
    36: ("a", "Phenotype is the observable expression of the genotype (with environment)."),
    37: ("d", "Gloves protect against contact with blood and body fluids, not needle-stick injuries."),
    38: ("d", "The thumb has its own pulse and can be confused with the patient's."),
    39: ("d", "Most emerging infections are zoonotic, so 'seldom of zoonotic origin' is false."),
    40: ("c", "There is no routine vaccine for dengue in national immunisation programmes; measles, hepatitis B and pertussis are vaccine-preventable."),
    41: ("d", "Lichens are sensitive to air pollution; luxuriant growth shows clean air."),
    43: ("b", "Children have 20 deciduous (milk) teeth."),
    46: ("d", "PVC is commonly used for water pipes."),
    47: ("d", "Brass is an alloy of copper and zinc."),
    48: ("c", "Stainless steel is the most common material for braces."),
    49: ("c", "Using protein for energy is its least important role (carbohydrates and fats are the main fuels)."),
    50: ("b", "World Health Day is 7 April (WHO founded 1948)."),
    51: ("c", "Cleanliness, exercise, rest and sleep are part of personal hygiene."),
    52: ("d", "All contribute to good health."),
    53: ("a", "Molality = moles of solute per kg of solvent."),
    54: ("d", "Plastics are made of many different polymer resins that must be separated before recycling."),
    55: ("b", "Integrated solid waste management combines reduction, reuse, recycling and disposal."),
    56: ("d", "Municipal solid waste includes food waste, wood, plastics and other household/ commercial waste."),
    57: ("b", "Incineration is controlled burning of waste in a furnace."),
    58: ("d", "Open burning causes air pollution and other environmental problems."),
    59: ("b", "Faraday's law of electromagnetic induction."),
    61: ("d", "The ampere is the SI unit of current."),
    63: ("b", "X-ray wavelengths are about 0.01-10 nm; diagnostic X-rays fall in the 0.1-10 nm range given."),
    64: ("c", "Newton's third law: every action has an equal and opposite reaction."),
    67: ("b", "A switch opens or closes a circuit."),
    68: ("b", "Earth's magnetism comes from the dynamo effect of the moving molten iron outer core."),
    70: ("c", "Kinetic energy is greatest just before the stone hits the ground."),
}
NEW_MCQ = [
    ("Tuberculosis is caused by", ["Mycobacterium tuberculosis", "Streptococcus pneumoniae", "Vibrio cholerae", "Plasmodium vivax"], "a", "TB is caused by the bacillus Mycobacterium tuberculosis."),
    ("Which blood group is known as the universal recipient?", ["O negative", "A positive", "B negative", "AB positive"], "d", "AB positive has no anti-A, anti-B or anti-D antibodies."),
    ("The normal resting heart rate of a healthy adult is", ["40-50 beats/min", "60-100 beats/min", "110-140 beats/min", "150-180 beats/min"], "b", "60-100 beats per minute."),
    ("Insulin is secreted by the", ["alpha cells of the pancreas", "beta cells of the islets of Langerhans", "adrenal cortex", "thyroid gland"], "b", "Beta cells secrete insulin; alpha cells secrete glucagon."),
    ("Bile is produced by the", ["gall bladder", "pancreas", "liver", "stomach"], "c", "The liver makes bile; the gall bladder stores and concentrates it."),
    ("The structural and functional unit of the kidney is the", ["neuron", "nephron", "alveolus", "villus"], "b", "Each kidney has about one million nephrons."),
    ("Scurvy is caused by deficiency of", ["vitamin A", "vitamin C", "vitamin D", "vitamin K"], "b", "Vitamin C is needed for collagen synthesis."),
    ("Malaria is transmitted by the bite of the", ["female Anopheles mosquito", "female Aedes mosquito", "Culex mosquito", "sandfly"], "a", "Female Anopheles mosquitoes transmit Plasmodium."),
    ("The largest organ of the human body is the", ["liver", "skin", "brain", "lungs"], "b", "The skin is the largest organ by area and weight."),
    ("The pH of pure water at 25 °C is", ["0", "5", "7", "14"], "c", "Pure water is neutral, pH 7."),
    ("The SI unit of force is the", ["joule", "watt", "newton", "pascal"], "c", "1 newton = 1 kg·m/s²."),
    ("Which organelle is called the 'powerhouse of the cell'?", ["Ribosome", "Golgi body", "Mitochondrion", "Lysosome"], "c", "Mitochondria produce most of the cell's ATP."),
    ("Rabies is most commonly transmitted to humans by", ["mosquito bites", "contaminated water", "bites of infected dogs", "airborne droplets"], "c", "Most human rabies follows dog bites."),
    ("Which gas do plants take in for photosynthesis?", ["Oxygen", "Nitrogen", "Carbon dioxide", "Hydrogen"], "c", "6CO2 + 6H2O → C6H12O6 + 6O2 in light."),
    ("Which antibody is the first to be produced in a primary immune response?", ["IgA", "IgE", "IgG", "IgM"], "d", "IgM appears first; IgG follows and dominates the secondary response."),
    ("The normal lifespan of a red blood cell is about", ["7 days", "30 days", "120 days", "1 year"], "c", "RBCs live about 120 days."),
]
SAQ = [
 dict(marks=3, stem="What is avian flu? Explain the causes, symptoms, mode of transmission and preventive measures of avian flu. (3 marks)",
      kp=[("Definition and cause: bird flu - infection with avian influenza A viruses (e.g. H5N1, H7N9) of birds, occasionally infecting humans", 1),
          ("Symptoms (fever, cough, sore throat, myalgia, conjunctivitis, severe pneumonia/ ARDS) and transmission (close contact with infected live/ dead poultry, droppings, markets; rarely human-to-human)", 1),
          ("Prevention: avoid contact with sick/ dead birds, cook poultry and eggs well, hand hygiene, PPE for poultry workers, culling and surveillance, antivirals (oseltamivir) for exposed", 1)],
      model="Avian influenza (bird flu) is an infection caused by influenza A viruses that normally circulate in birds, such as H5N1 and H7N9, which occasionally infect humans. Cause: avian influenza A virus. Symptoms in humans: fever, cough, sore throat, muscle aches, conjunctivitis and, in severe cases, pneumonia, breathing difficulty (ARDS) and death. Transmission: close contact with infected live or dead poultry or wild birds, their droppings or contaminated surfaces, e.g. in backyard farms and live bird markets; human-to-human spread is rare. Prevention: avoid contact with sick or dead birds and report them; cook poultry and eggs thoroughly; wash hands with soap; poultry workers use PPE; surveillance, culling and disinfection of infected flocks by livestock authorities; and antiviral drugs (oseltamivir) for cases and exposed people."),
 dict(marks=3, stem="Name 5 different types of human teeth and explain their functions. List some measures to prevent tooth decay, which is commonly seen in Bhutan, especially in school-going children. (3 marks)",
      kp=[("Types and functions: incisors (cutting/ biting), canines (tearing), premolars (crushing/ grinding), molars (grinding), wisdom teeth (third molars - grinding)", 1.5),
          ("Prevention: brush twice daily with fluoride toothpaste, floss, limit sugary food/ drinks/ doma, rinse after meals, regular dental check-ups, school oral health programmes, fissure sealants/ fluoride varnish", 1.5)],
      model="Types: (1) incisors - chisel-shaped front teeth for cutting and biting food; (2) canines - pointed teeth for tearing; (3) premolars - for crushing and grinding; (4) molars - broad teeth for grinding and chewing; (5) third molars (wisdom teeth) - extra grinding teeth at the back. Prevention of tooth decay: brush twice a day with fluoride toothpaste and clean between teeth; reduce sugary snacks, sweets and soft drinks and avoid chewing doma (betel nut); rinse the mouth after meals; drink safe water; visit a dental clinic regularly for check-ups, fluoride varnish and fissure sealants; and support school oral health education and supervised tooth-brushing programmes."),
 dict(marks=3, stem="Among many public health issues in Bhutan, alcohol liver disease (ALD) tops the list; Jigme Dorji Wangchuck National Referral Hospital in Thimphu reports the highest deaths every year due to ALD.\n(a) Explain briefly how the consumption of alcohol causes ALD.\n(b) Write down at least 5 of the most important measures you would suggest to discourage the consumption of alcohol in Bhutan. (3 marks)",
      kp=[("(a) Liver metabolises alcohol to toxic acetaldehyde and free radicals → fatty liver (steatosis) → alcoholic hepatitis (inflammation) → fibrosis and cirrhosis (liver failure, portal hypertension)", 1.5),
          ("(b) Five measures: higher taxes/ prices, restrict sale hours/ outlets/ licences, enforce age limits and drink-driving laws, ban advertising, awareness campaigns, control home brewing (ara), screening and brief interventions, treatment/ rehabilitation, community and religious involvement", 1.5)],
      model="(a) The liver metabolises alcohol; this produces toxic acetaldehyde and free radicals and changes fat metabolism. With regular heavy drinking, fat accumulates in liver cells (fatty liver), then inflammation and cell death occur (alcoholic hepatitis), and repeated injury causes scarring (fibrosis) leading to cirrhosis, with liver failure, jaundice, ascites, bleeding varices and liver cancer. (b) Measures: increase taxes and prices of alcohol; reduce availability - fewer bar licences, limited opening hours and dry days; enforce the minimum legal drinking age and drink-driving laws; ban alcohol advertising and promotion; regulate home brewing of ara; public awareness and school education on harms; screening and brief interventions in health facilities; treatment, counselling and rehabilitation services; involve communities, religious leaders and families."),
 dict(marks=3, real=False, stem="Name the three ossicles of the middle ear and describe how sound waves are conducted from the outer ear to the inner ear. (3 marks)",
      kp=[("Ossicles: malleus (hammer), incus (anvil), stapes (stirrup)", 1),
          ("Pathway: pinna collects → external auditory canal → tympanic membrane vibrates → ossicles amplify → stapes at oval window → fluid waves in cochlea → hair cells (organ of Corti) → auditory nerve → brain (temporal lobe)", 2)],
      model="The three ossicles are the malleus (hammer), incus (anvil) and stapes (stirrup). Sound conduction: the pinna collects sound waves and directs them through the external auditory canal to the tympanic membrane (eardrum), which vibrates; the vibrations pass through the malleus, incus and stapes, which amplify them; the stapes pushes on the oval window, setting up waves in the fluid of the cochlea; these bend the hair cells of the organ of Corti, which convert them into nerve impulses carried by the auditory (cochlear) nerve to the auditory cortex in the temporal lobe of the brain."),
 dict(marks=3, real=False, stem="What is the 5S approach used in health facilities? Explain each of the five S's and give two benefits of 5S in a hospital. (3 marks)",
      kp=[("Five S's: Sort (remove unneeded items), Set in order (a place for everything, labelled), Shine (clean and inspect), Standardise (common rules/ procedures), Sustain (discipline, habit, audits)", 2),
          ("Benefits (any two): safer, cleaner workplace, less time searching, fewer errors/ expired items, better infection control, efficient use of space, improved patient and staff satisfaction, basis for CQI", 1)],
      model="5S is a workplace organisation method from Japanese management used as the base for continuous quality improvement (CQI) in health facilities. (1) Sort (Seiri) - remove items that are not needed; (2) Set in order (Seiton) - arrange needed items so they are easy to find and return, with labels; (3) Shine (Seiso) - clean the workplace and equipment and inspect for problems; (4) Standardise (Seiketsu) - make the first three S's routine with standard procedures, signs and checklists; (5) Sustain (Shitsuke) - build the habit and discipline through training, monitoring and audits. Benefits: a cleaner, safer and more organised workplace; less time wasted searching for items; fewer errors and expired drugs; better infection control; efficient use of space; and improved patient and staff satisfaction and quality of care."),
 dict(marks=3, stem="Describe the functions of lipids in the body. (3 marks)",
      kp=[("Energy: concentrated energy source (9 kcal/g) and storage in adipose tissue", 1),
          ("Structure: phospholipids and cholesterol in cell membranes; myelin; insulation and protection of organs", 1),
          ("Others: absorption and transport of fat-soluble vitamins A, D, E, K; precursors of hormones (steroid hormones, prostaglandins), bile acids; essential fatty acids", 1)],
      model="Lipids: (1) provide a concentrated source of energy (9 kcal per gram) and are stored as triglycerides in adipose tissue; (2) form the structure of cell membranes (phospholipids, cholesterol) and the myelin sheath of nerves; (3) insulate the body against heat loss and cushion and protect vital organs; (4) help absorb and transport the fat-soluble vitamins A, D, E and K; (5) are precursors of steroid hormones (cortisol, sex hormones), vitamin D and bile acids, and of signalling molecules such as prostaglandins; (6) supply essential fatty acids (omega-3 and omega-6)."),
 dict(marks=3, stem="Using the circuit shown (a voltage V applied across a resistor R, with current I flowing through it), state Ohm's law with its formula. (3 marks)",
      kp=[("Statement: at constant temperature (and physical conditions), the current through a conductor is directly proportional to the potential difference across it", 1.5),
          ("Formula V = IR (I = V/R, R = V/I), units volt, ampere, ohm; V-I graph straight line through origin", 1.5)],
      model="Ohm's law states that, at constant temperature and other physical conditions, the current (I) flowing through a conductor is directly proportional to the potential difference (V) across its ends. So V ∝ I, i.e. V = IR, where R is the resistance of the conductor (a constant). Units: V in volts, I in amperes, R in ohms (Ω). Rearranged: I = V/R and R = V/I. A graph of V against I is a straight line through the origin with slope R."),
 dict(marks=3, stem="State the laws of reflection from a plane mirror. Draw a diagram and label: (a) incident ray; (b) normal; (c) reflected ray; (d) angle of reflection; (e) angle of incidence. (3 marks)",
      kp=[("Law 1: the angle of incidence equals the angle of reflection (i = r)", 1), ("Law 2: the incident ray, reflected ray and normal at the point of incidence all lie in the same plane", 1),
          ("Correct labelled diagram: mirror, normal at point of incidence, incident and reflected rays, angles i and r measured from the normal", 1)],
      model="Laws of reflection: (1) the angle of incidence is equal to the angle of reflection (∠i = ∠r); (2) the incident ray, the reflected ray and the normal at the point of incidence all lie in the same plane. Diagram: draw a plane mirror as a straight line; at the point of incidence draw a dotted line perpendicular to the mirror (the normal); draw the incident ray coming in towards the point and the reflected ray leaving on the other side of the normal; mark the angle between the incident ray and the normal as the angle of incidence (i) and the angle between the reflected ray and the normal as the angle of reflection (r), with i = r."),
 dict(marks=3, stem="Define molarity, molality and normality and show the formula for calculating each. (3 marks)",
      kp=[("Molarity (M) = moles of solute / volume of solution in litres (mol/L)", 1), ("Molality (m) = moles of solute / mass of solvent in kg (mol/kg)", 1),
          ("Normality (N) = gram equivalents of solute / volume of solution in litres; N = M x n-factor (valence)", 1)],
      model="Molarity (M) is the number of moles of solute dissolved in one litre of solution: M = moles of solute / volume of solution (L) = (mass/ molar mass) / volume (L). Molality (m) is the number of moles of solute per kilogram of solvent: m = moles of solute / mass of solvent (kg); it does not change with temperature. Normality (N) is the number of gram equivalents of solute per litre of solution: N = gram equivalents / volume (L) = (mass/ equivalent weight) / volume (L), and N = M x n-factor (e.g. for H2SO4, N = 2M)."),
 dict(marks=3, stem="According to the Annual Health Bulletin of the Ministry of Health, multi-drug resistant tuberculosis (MDR-TB) cases have increased in Bhutan. What could be the causes of increasing MDR-TB cases in the country? What preventive measures would you suggest to the Ministry of Health to reduce MDR-TB? (3 marks)",
      kp=[("Causes: incomplete/ irregular treatment and defaulting, inappropriate regimens or drug quality, poor adherence/ DOT, delayed diagnosis, transmission of resistant strains (crowding), cross-border movement, comorbidity (diabetes, HIV, alcohol)", 1.5),
          ("Prevention: strict DOT and adherence support, early diagnosis with rapid molecular tests (GeneXpert) and drug-susceptibility testing, contact tracing, infection control, quality-assured drugs, treatment of MDR-TB patients, nutrition/ social support, awareness, preventive therapy", 1.5)],
      model="Causes: patients not completing or irregularly taking TB treatment (defaulting, side effects, feeling better early); poor supervision of treatment; inappropriate or interrupted drug supply; delayed diagnosis allowing spread; direct transmission of resistant strains in crowded homes, institutions and workplaces; cross-border movement; and comorbidities such as diabetes, HIV and alcohol use. Prevention: ensure directly observed treatment with patient support (counselling, nutrition, travel help); early diagnosis using rapid molecular tests (GeneXpert) with drug-susceptibility testing for all TB patients; prompt, complete treatment of MDR-TB cases with newer regimens; contact tracing and screening; infection control in health facilities and homes; uninterrupted supply of quality-assured drugs; community awareness to reduce stigma and defaulting; and monitoring through the national TB programme."),
]
Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
