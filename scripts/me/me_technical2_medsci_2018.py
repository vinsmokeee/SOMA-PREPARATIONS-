"""ME Technical Paper II (General Subject Knowledge), MEDICAL SCIENCE group, BCSE 2018 (written 6 October 2018) - real paper,
PDF sent by the founder (a scanned copy: every question was typed from the page images). Same layout as the latest
(BCSE 2025) paper: Part I 70 MCQ x 1; Part II 10 short answers x 3 - so no marks were changed.
Pictures: Part II Q7 distillation apparatus and Q9 eye (cropped from the paper; labels are numbered on the picture).
Repeats (recorded as appearances, not loaded again): MCQ 7 (BCSE 2019), 16 (2021), 43 (2022), 46 (2020), 67 (2024).
Left out (more than one defensible answer, unclear or out of date): MCQ 2, 10, 18 (Bhutan food-poisoning data not
published), 19, 28, 29 (86 vs 100 billion neurons), 37 (graphite and carbon both right), 47 (√2 : 1 not offered), 49, 51, 62,
64, 69 (stem garbled). Eighteen new MCQs keep Part I at 70.
Clarified: MCQ 20 option (a) reads 'simple squamous'; MCQ 63 asks about fluoride in toothpaste.
Part II repeats (recorded as appearances, replaced by new questions of the same kind): Q2 MDR-TB (BCSE 2024), Q4 ALD (2023),
Q10 oral health (2021).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Medical Science): BCSE 2018, batch 1"
GROUP_TAG = "medsci2018"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "medical-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2018 Main Examination, Technical Paper II, Medical Science", "year": 2018, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Medical Science: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following is NOT a characteristic of plant cell walls?",
"opts": [
"Found only in the sporophyte phase of the life cycle",
"Among other compounds, it also contains simple sugars",
"Contains biologically active enzymes",
"Contains strengthening polymers"
]
},
{
"n": 3,
"stem": "All the following are micronutrients required for the growth of plants EXCEPT:",
"opts": [
"Iron",
"Copper",
"Zinc",
"Magnesium"
]
},
{
"n": 4,
"stem": "Nitrogen fixation in leguminous plants is an example of:",
"opts": [
"Pathogenic plant infection with bacteria",
"Parasitic infection of plants",
"Synthesis of proteins required for plant growth",
"Symbiotic plant infection with bacteria"
]
},
{
"n": 5,
"stem": "Choose the intestinal parasite that classically causes anaemia in infected people:",
"opts": [
"Ancylostoma duodenale",
"Enterobius vermicularis",
"Giardia lamblia",
"Trichuris trichiura"
]
},
{
"n": 6,
"stem": "Choose the correct products of photosynthesis (6CO₂ + 12H₂O → ?):",
"opts": [
"C₆H₁₂O₆ + 6H₂O + 6O₂",
"6C₆H₁₂O₆ + 6H₂O + 6O",
"2C₆H₁₂O₆ + 6H₂O + 6CO₂",
"C₆H₁₂O₆ + 6H₂O + 6CO₂"
]
},
{
"n": 8,
"stem": "An allergic (type I hypersensitivity) reaction involves activation of:",
"opts": [
"Macrophages",
"T and B lymphocytes",
"Mast cells",
"Platelets"
]
},
{
"n": 9,
"stem": "Choose the chemical most commonly used as a food flavour enhancer ('tasting powder'):",
"opts": [
"Potassium bicarbonate",
"Sodium bicarbonate",
"Monosodium glutamate",
"Calcium glutamate"
]
},
{
"n": 11,
"stem": "All the following are haemoparasites (blood parasites) EXCEPT:",
"opts": [
"Plasmodium species",
"Leishmania species",
"Trichomonas species",
"Wuchereria bancrofti"
]
},
{
"n": 12,
"stem": "The chemical composition of bleaching powder is:",
"opts": [
"Magnesium bicarbonate",
"Sodium carbonate",
"Calcium bicarbonate",
"Calcium hypochlorite (calcium oxychloride)"
]
},
{
"n": 13,
"stem": "Biogas projects initiated by the Tarayana Foundation have benefited many rural families in Bhutan. Which gas makes up the largest share of the gas produced by a biogas plant?",
"opts": [
"Carbon dioxide",
"Hydrogen",
"Nitrogen",
"Methane"
]
},
{
"n": 14,
"stem": "Muscle pain following strenuous exercise has traditionally been attributed to:",
"opts": [
"Accumulation of uric acid",
"Breakdown of citric acid",
"Formation of lactic acid",
"All of the above"
]
},
{
"n": 15,
"stem": "A buffer solution is a mixture of a:",
"opts": [
"weak base and weak acid",
"weak base and strong acid",
"weak acid and conjugate acid",
"weak acid and its conjugate base"
]
},
{
"n": 17,
"stem": "The vitamin which helps in the synthesis of retinal rhodopsin is:",
"opts": [
"Vitamin A",
"Vitamin K",
"Vitamin B complex",
"Vitamin D"
]
},
{
"n": 20,
"stem": "Choose the wrongly matched pair:",
"opts": [
"Simple squamous epithelium - buccal cavity",
"Cuboidal epithelium - glands",
"Ciliated columnar epithelium - bronchus",
"Stratified squamous epithelium - oesophagus"
]
},
{
"n": 21,
"stem": "The largest (longest) bone in the human body is the:",
"opts": [
"Skull",
"Tibia",
"Fibula",
"Femur"
]
},
{
"n": 22,
"stem": "Which part of the human brain is concerned with intelligence?",
"opts": [
"Medulla oblongata",
"Cerebellum",
"Cerebrum",
"Hypothalamus"
]
},
{
"n": 23,
"stem": "Which hormone is responsible for the fight-or-flight response?",
"opts": [
"Adrenaline",
"Serotonin",
"Oxytocin",
"Rennin"
]
},
{
"n": 24,
"stem": "The most accurate normal pH range of human (arterial) blood is:",
"opts": [
"7.00-7.50",
"7.50-8.00",
"7.35-7.45",
"7.10-7.90"
]
},
{
"n": 25,
"stem": "Which of the following connects muscles to bones?",
"opts": [
"Tendon",
"Fibrous cartilage",
"Hyaline cartilage",
"Ligament"
]
},
{
"n": 26,
"stem": "Choose the universal blood donor:",
"opts": [
"A healthy person with O positive blood",
"A healthy person with O negative blood",
"A healthy person with AB positive blood",
"A healthy person with AB negative blood"
]
},
{
"n": 27,
"stem": "The main function of molar teeth is:",
"opts": [
"Grinding",
"Cutting",
"Tearing",
"All of the above"
]
},
{
"n": 30,
"stem": "World TB Day is observed on:",
"opts": [
"24 March",
"1 April",
"1 December",
"28 September"
]
},
{
"n": 31,
"stem": "Drought, floods and famine are consequences of:",
"opts": [
"Global warming",
"Landslides and soil erosion",
"Cyclones",
"Earthquakes"
]
},
{
"n": 32,
"stem": "Saponification is an example of:",
"opts": [
"Oxidation",
"Reduction",
"Hydrolysis",
"Distillation"
]
},
{
"n": 33,
"stem": "An epiphysis is seen at the ends of:",
"opts": [
"Flat bones",
"Long bones",
"Short bones",
"Sesamoid bones"
]
},
{
"n": 34,
"stem": "Illness accompanied by 'rice-water' stools is a typical symptom of:",
"opts": [
"Typhoid",
"Dysentery",
"Cholera",
"Malaria"
]
},
{
"n": 35,
"stem": "The primary ions involved in the acid-base balance of the body are:",
"opts": [
"H⁺ only",
"HCO₃⁻ only",
"H⁺ and HCO₃⁻",
"PO₄³⁻ only"
]
},
{
"n": 36,
"stem": "A catalyst is:",
"opts": [
"consumed in the reaction",
"produced in the reaction",
"chemically unchanged at the end of the reaction",
"permanently changed chemically"
]
},
{
"n": 38,
"stem": "Two isotonic solutions have the same:",
"opts": [
"Vapour pressure",
"Osmotic pressure",
"Freezing point",
"Boiling point"
]
},
{
"n": 39,
"stem": "When a non-volatile solid is added to water, the boiling point of the water is:",
"opts": [
"Decreased",
"Increased",
"Unchanged",
"Cannot be predicted"
]
},
{
"n": 40,
"stem": "The net electric charge of an isolated system always remains constant. This is called the:",
"opts": [
"Coulomb's law",
"Faraday's law",
"Law of conservation of charge",
"Ohm's law"
]
},
{
"n": 41,
"stem": "Choose the INCORRECT statement about the resistance of a (metallic) conductor:",
"opts": [
"It is directly proportional to the length of the conductor",
"It is inversely proportional to the cross-section of the conductor",
"It increases with temperature",
"It is directly proportional to the density of free electrons in the conductor"
]
},
{
"n": 42,
"stem": "The wavelength range of X-rays is about:",
"opts": [
"0.01 to 10 nm",
"10⁻¹³ to 10⁻¹² nm",
"0.01 to 0.05 nm",
"10⁻⁵ to 10⁻¹⁰ nm"
]
},
{
"n": 44,
"stem": "'The current through a conductor equals the voltage across it divided by its resistance.' This is called:",
"opts": [
"Joule's law",
"Coulomb's law",
"Ohm's law",
"None of the above"
]
},
{
"n": 45,
"stem": "All the following are properties of a convex lens EXCEPT:",
"opts": [
"It converges parallel rays to a focal point",
"It has a positive focal length",
"It forms a small (diminished) virtual image",
"It is used in the correction of hypermetropia"
]
},
{
"n": 48,
"stem": "Lead is used for protection from X-rays because of its:",
"opts": [
"Hardness",
"High ability to absorb and scatter the radiation energy (high density and atomic number)",
"Poisonous nature",
"Ductility and malleability"
]
},
{
"n": 50,
"stem": "The type of pulley used for hoisting the national flag is a:",
"opts": [
"Fixed pulley",
"Movable pulley",
"Compound pulley",
"Combination of all"
]
},
{
"n": 52,
"stem": "The normality of a solution is defined as the:",
"opts": [
"number of moles of substance per litre of solution",
"number of moles of solute per kg of solvent",
"number of gram-equivalents of solute per litre of solution",
"number of grams of solute per kilogram of solvent"
]
},
{
"n": 53,
"stem": "Which of the following electromagnetic radiations has the shortest wavelength?",
"opts": [
"Ultraviolet rays",
"X-rays",
"Radio waves",
"Infrared"
]
},
{
"n": 54,
"stem": "Two cells of 1.25 V and 0.75 V are connected in series (same direction). The effective voltage is:",
"opts": [
"0.75 V",
"1.25 V",
"2.0 V",
"0.5 V"
]
},
{
"n": 55,
"stem": "The ratio of the resistances of a 120 W and a 60 W electric bulb (same supply voltage) is:",
"opts": [
"1/2",
"2/3",
"1/3",
"4/9"
]
},
{
"n": 56,
"stem": "Albumin is an example of a:",
"opts": [
"Simple protein",
"Conjugated protein",
"Derived protein",
"Water-insoluble protein"
]
},
{
"n": 57,
"stem": "The most common cooking gas used in Bhutan is:",
"opts": [
"Liquefied petroleum gas (LPG)",
"Octane gas",
"Ethane gas",
"Compressed natural gas (CNG)"
]
},
{
"n": 58,
"stem": "The metal used to cast the statue of Lord Buddha (Buddha Dordenma) at Kuensel Phodrang in Thimphu is:",
"opts": [
"Bronze",
"Copper",
"Zinc",
"Brass"
]
},
{
"n": 59,
"stem": "The bitter taste of bitter gourd is due to the presence of:",
"opts": [
"Oxalic acid",
"Tartaric acid",
"Formic acid",
"Cucurbitacins (cucurbitane-type compounds)"
]
},
{
"n": 60,
"stem": "All the following are correct for chromosomes EXCEPT:",
"opts": [
"They contain DNA, the genetic material",
"They are present in the nucleus of human cells only",
"DNA wraps around histone proteins",
"Chromosomes exist in pairs (in diploid cells)"
]
},
{
"n": 61,
"stem": "Choose the concentration of ethyl alcohol used as a disinfectant in hospitals:",
"opts": [
"90% ethyl alcohol",
"100% ethyl alcohol",
"70% ethyl alcohol",
"50% ethyl alcohol"
]
},
{
"n": 63,
"stem": "Which element is added to toothpaste (as fluoride) to prevent tooth decay and reduce bacterial acid attack?",
"opts": [
"Bromine",
"Chlorine",
"Fluorine",
"Iodine"
]
},
{
"n": 65,
"stem": "The chemical formula of baking soda is:",
"opts": [
"NaHCO₃",
"Na₂CO₃",
"KHCO₃",
"K₂CO₃"
]
},
{
"n": 66,
"stem": "The addictive chemical present in tobacco is:",
"opts": [
"Nicotine",
"Hydrogen cyanide",
"Formaldehyde",
"Benzene"
]
},
{
"n": 68,
"stem": "Which sugar is present in sugar cane?",
"opts": [
"Glucose",
"Fructose",
"Sucrose",
"Galactose"
]
},
{
"n": 70,
"stem": "All the following are correct about sulphuric acid EXCEPT:",
"opts": [
"Its chemical formula is H₂SO₄",
"It is highly corrosive",
"Concentrated sulphuric acid acts as an oxidising agent",
"Its pH is slightly greater than 6"
]
}
]"""

KEY = {
 1: ('a', 'Cell walls are found in both the sporophyte and gametophyte phases; they contain polysaccharides with some sugars, enzymes and strengthening polymers (cellulose, lignin).'),
 3: ('d', 'Magnesium is a macronutrient (secondary nutrient, part of chlorophyll); iron, copper and zinc are micronutrients.'),
 4: ('d', 'Rhizobium bacteria live in root nodules of legumes in a mutually beneficial (symbiotic) relationship and fix nitrogen.'),
 5: ('a', 'The hookworm Ancylostoma duodenale sucks blood from the intestinal wall, causing iron-deficiency anaemia.'),
 6: ('a', '6CO₂ + 12H₂O → C₆H₁₂O₆ + 6H₂O + 6O₂ (glucose, water and oxygen).'),
 8: ('c', 'In an immediate allergic reaction the allergen cross-links IgE on mast cells, which degranulate and release histamine.'),
 9: ('c', "Monosodium glutamate (MSG), sold as 'tasting powder' or ajinomoto, enhances the savoury (umami) taste."),
 11: ('c', 'Trichomonas lives in the genital tract; Plasmodium, Leishmania and Wuchereria (microfilariae) are found in blood.'),
 12: ('d', 'Bleaching powder is CaOCl₂ - calcium oxychloride (chlorinated lime), whose active ingredient is calcium hypochlorite.'),
 13: ('d', 'Biogas is about 50-70% methane, with most of the rest carbon dioxide.'),
 14: ('c', 'During strenuous exercise muscles respire anaerobically, producing lactic acid, which was long held to cause the pain (delayed soreness is now linked mainly to micro-injury).'),
 15: ('d', 'A buffer is a weak acid with its conjugate base (salt), e.g. acetic acid and sodium acetate, or a weak base with its conjugate acid.'),
 17: ('a', 'Retinal, derived from vitamin A, combines with opsin to form rhodopsin; deficiency causes night blindness.'),
 20: ('a', 'The buccal cavity is lined by stratified (not simple) squamous epithelium; the other pairs are correct.'),
 21: ('d', 'The femur (thigh bone) is the longest and strongest bone in the body.'),
 22: ('c', 'The cerebrum (cerebral cortex) controls thinking, memory, reasoning and intelligence; the cerebellum coordinates movement.'),
 23: ('a', 'Adrenaline (epinephrine) from the adrenal medulla raises heart rate, blood pressure and blood sugar in emergencies.'),
 24: ('c', 'Normal blood pH is kept between 7.35 and 7.45 - slightly alkaline.'),
 25: ('a', 'Tendons join muscle to bone; ligaments join bone to bone.'),
 26: ('b', 'O negative red cells have no A, B or Rh(D) antigens, so they can be given to anyone; AB positive is the universal recipient.'),
 27: ('a', 'Molars have broad, flat surfaces for grinding food; incisors cut and canines tear.'),
 30: ('a', 'World Tuberculosis Day is 24 March, the day Robert Koch announced the discovery of the TB bacillus (1882). 1 December is World AIDS Day.'),
 31: ('a', 'Global warming changes rainfall patterns, causing more droughts and floods and, through crop failure, famine.'),
 32: ('c', 'Saponification is the alkaline hydrolysis of fats (esters) into glycerol and soap.'),
 33: ('b', 'Long bones such as the femur have a shaft (diaphysis) and two ends (epiphyses).'),
 34: ('c', 'Cholera (Vibrio cholerae) causes profuse watery diarrhoea that looks like water in which rice was washed.'),
 35: ('c', 'The bicarbonate buffer system (H⁺ + HCO₃⁻ ⇌ H₂CO₃ ⇌ CO₂ + H₂O) is the main regulator of blood pH.'),
 36: ('c', 'A catalyst speeds up a reaction and is recovered chemically unchanged at the end.'),
 38: ('b', 'Isotonic solutions have equal osmotic pressure, so no net water moves between them.'),
 39: ('b', 'A non-volatile solute lowers the vapour pressure, so the boiling point rises (boiling-point elevation).'),
 40: ('c', 'Charge can be transferred but not created or destroyed - the law of conservation of charge.'),
 41: ('d', 'More free electrons make a better conductor, so resistance falls, not rises, with electron density. R = ρL/A, and in metals resistance rises with temperature.'),
 42: ('a', 'X-rays lie roughly between 0.01 nm and 10 nm, between ultraviolet and gamma rays.'),
 44: ('c', "Ohm's law: I = V/R."),
 45: ('c', 'A convex lens forms a virtual image only when the object is inside the focus, and that image is enlarged (magnifying glass), not small.'),
 48: ('b', "Lead's high density and atomic number make it absorb X-ray photons strongly."),
 50: ('a', 'A single fixed pulley at the top of the pole changes the direction of the pull, so pulling down raises the flag.'),
 52: ('c', 'Normality = gram-equivalents of solute per litre of solution. (a) is molarity and (b) molality.'),
 53: ('b', 'Of these, X-rays have the shortest wavelength (radio > infrared > ultraviolet > X-rays).'),
 54: ('c', 'In series the e.m.f.s add: 1.25 + 0.75 = 2.0 V.'),
 55: ('a', 'R = V²/P, so R is inversely proportional to power: R₁₂₀/R₆₀ = 60/120 = 1/2.'),
 56: ('a', 'Albumin is a simple protein (only amino acids) and is water-soluble.'),
 57: ('a', 'Households in Bhutan cook with LPG cylinders (mainly propane and butane).'),
 58: ('a', 'The Buddha Dordenma is made of bronze and gilded in gold.'),
 59: ('d', 'The bitterness of bitter gourd comes from cucurbitane-type triterpenoids such as cucurbitacins and momordicin.'),
 60: ('b', 'Chromosomes are found in the cells of all living organisms, not only in humans.'),
 61: ('c', '70% alcohol is the most effective: the water helps it penetrate cells and denature proteins.'),
 63: ('c', 'Toothpaste contains fluoride (e.g. sodium fluoride), which strengthens enamel and inhibits the acid-producing bacteria of plaque.'),
 65: ('a', 'Baking soda is sodium hydrogen carbonate (sodium bicarbonate), NaHCO₃; Na₂CO₃ is washing soda.'),
 66: ('a', 'Nicotine causes dependence; the others are toxic components of tobacco smoke.'),
 68: ('c', 'Cane sugar is sucrose, a disaccharide of glucose and fructose.'),
 70: ('d', 'Sulphuric acid is a strong acid; its solutions have a pH well below 7 (about 0-1 for dilute laboratory acid).'),
}

NEW_MCQ = [
    ('Deficiency of vitamin D in children causes:', ['Scurvy', 'Rickets', 'Beriberi', 'Night blindness'], 'b', 'Vitamin D is needed to absorb calcium; its lack softens bones (rickets). Scurvy - vitamin C, beriberi - B1, night blindness - A.'),
    ('The normal number of chromosomes in a human body (somatic) cell is:', ['23', '44', '46', '48'], 'c', 'Human somatic cells are diploid with 46 chromosomes (23 pairs); gametes have 23.'),
    ('The functional unit of the lungs where gas exchange takes place is the:', ['Bronchus', 'Trachea', 'Alveolus', 'Pleura'], 'c', 'Oxygen and carbon dioxide are exchanged across the thin walls of the alveoli (air sacs).'),
    ('The part of the brain that maintains balance and coordinates voluntary movements is the:', ['Cerebrum', 'Cerebellum', 'Medulla oblongata', 'Hypothalamus'], 'b', 'The cerebellum coordinates muscle movements and maintains balance and posture.'),
    ('Malaria is transmitted by the bite of an infected female:', ['Aedes mosquito', 'Culex mosquito', 'Anopheles mosquito', 'Sandfly'], 'c', 'Female Anopheles mosquitoes carry Plasmodium; Aedes spreads dengue and Culex spreads filariasis.'),
    ('Iodine deficiency in the diet most commonly causes:', ['Goitre', 'Anaemia', 'Rickets', 'Pellagra'], 'a', 'Without iodine the thyroid cannot make enough hormone and enlarges (goitre); Bhutan prevents this with iodised salt.'),
    ('Antibodies are produced by:', ['Red blood cells', 'Platelets', 'Plasma cells (derived from B lymphocytes)', 'Neutrophils'], 'c', 'Activated B lymphocytes become plasma cells, which secrete antibodies (immunoglobulins).'),
    ('Rod cells of the retina are mainly responsible for:', ['Colour vision', 'Vision in dim light', 'Focusing', 'Producing aqueous humour'], 'b', 'Rods (containing rhodopsin) work in dim light; cones are for colour and bright light.'),
    ('The pH of gastric juice in the human stomach is about:', ['1.5-3.5', '6.5-7.5', '7.5-8.5', '9-10'], 'a', 'Hydrochloric acid secreted by the stomach keeps gastric juice strongly acidic, about pH 1.5-3.5.'),
    ('The normal body (oral) temperature of a healthy human is about:', ['35 °C', '37 °C', '39 °C', '40 °C'], 'b', 'Normal oral temperature is about 37 °C (98.6 °F).'),
    ('Hepatitis B is mainly transmitted through:', ['Contaminated food and water', 'Infected blood and body fluids', 'Mosquito bites', 'Droplets from sneezing'], 'b', 'Hepatitis B spreads through blood, sexual contact and from mother to child; hepatitis A and E spread through food and water.'),
    ('Oral rehydration solution (ORS) contains:', ['Sodium chloride, potassium chloride, sodium citrate and glucose', 'Sodium chloride and sugar only', 'Calcium carbonate and glucose', 'Potassium permanganate and salt'], 'a', 'WHO low-osmolarity ORS contains sodium chloride, potassium chloride, trisodium citrate and glucose.'),
    ('Which blood cells help in blood clotting?', ['Erythrocytes', 'Leucocytes', 'Thrombocytes (platelets)', 'Lymphocytes'], 'c', 'Platelets (thrombocytes) form a plug and release factors that start clotting.'),
    ('Blood vessels that carry blood away from the heart are called:', ['Veins', 'Arteries', 'Capillaries', 'Venules'], 'b', 'Arteries carry blood away from the heart; veins return it to the heart.'),
    ('The functional unit of the nervous system is the:', ['Nephron', 'Neuron', 'Alveolus', 'Sarcomere'], 'b', 'The neuron (nerve cell) receives and transmits nerve impulses.'),
    ('The SI unit of pressure is the:', ['Newton', 'Pascal', 'Joule', 'Watt'], 'b', '1 pascal = 1 newton per square metre.'),
    ('Which enzyme in saliva begins the digestion of starch?', ['Pepsin', 'Salivary amylase (ptyalin)', 'Lipase', 'Trypsin'], 'b', 'Salivary amylase (ptyalin) breaks starch into maltose in the mouth.'),
    ('Which of the following is a fat-soluble vitamin?', ['Vitamin B1', 'Vitamin C', 'Vitamin E', 'Folic acid'], 'c', 'Vitamins A, D, E and K are fat-soluble; B vitamins and C are water-soluble.'),
]

EYE = "/papers/me/tech2-medsci-2018-eye.png"
SAQ = [
 dict(marks=3, stem="State the reasons for weighing the medical wastes generated at hospitals in Bhutan before they are discarded. (3 marks)",
      kp=[("Record keeping and monitoring: the amount of each category of waste (infectious, sharps, pharmaceutical, general) generated per ward/day, as required by national healthcare waste guidelines", 1),
          ("Planning and costing: to plan containers, storage, transport and treatment capacity (autoclave, incinerator) and to budget/cost disposal", 1),
          ("Safety and accountability: to check segregation and reduce waste, detect misuse or theft (e.g. syringes, drugs) and report to the Ministry/regulators", 1)],
      model="Healthcare waste is weighed and recorded before disposal because:\n1. Monitoring and records - the hospital and the Ministry of Health need data on how much infectious, sharp, pharmaceutical and general waste each ward or facility produces, to follow the national healthcare waste management guidelines and report it.\n2. Planning and cost - the weight decides the number of bins and bags, storage space, transport and the capacity of treatment equipment (autoclave, incinerator, deep burial pits), and helps estimate disposal costs.\n3. Safety, segregation and accountability - sudden changes show poor segregation or overuse, help reduce waste, and make sure hazardous items (sharps, expired drugs) are fully accounted for and not reused or stolen."),
 dict(real=False, marks=3, stem="Hepatitis B is a serious public health problem. Describe its causative agent, modes of transmission and preventive measures. (3 marks)",
      kp=[("Caused by the hepatitis B virus (a DNA virus) that infects the liver; can cause acute hepatitis, chronic infection, cirrhosis and liver cancer", 1),
          ("Transmission: blood and blood products, unsafe injections/needle sharing, sexual contact, mother to child at birth, sharing razors/toothbrushes; not by food or water", 1),
          ("Prevention: hepatitis B vaccine (birth dose and infant schedule, health workers), screening of blood and pregnant women, safe injections and sterilisation, condoms, not sharing razors, HBIG for exposed newborns", 1)],
      model="Causative agent: the hepatitis B virus (HBV), a DNA virus that attacks liver cells. It can cause acute hepatitis (jaundice, fatigue, dark urine) and, especially when acquired in infancy, lifelong chronic infection leading to cirrhosis and liver cancer.\nModes of transmission: through infected blood and body fluids - transfusion of unscreened blood, unsafe injections and sharing needles, unsterile instruments (tattooing, ear-piercing), sexual contact, from an infected mother to her baby at birth, and sharing razors or toothbrushes. It is not spread by food, water or casual contact.\nPreventive measures: hepatitis B vaccination (birth dose within 24 hours plus the infant schedule, and vaccination of health workers); screening of blood donors and pregnant women, with hepatitis B immunoglobulin and vaccine for babies of infected mothers; safe injection practice, sterilisation of instruments and proper sharps disposal; using condoms; not sharing razors or needles; health education."),
 dict(marks=3, stem="Bhutan's constitution mandates a minimum of 60% forest cover, and the country's forest cover is reported to have increased from 71% to over 80%. Explain the positive and negative implications of this in terms of the socioeconomic development of the country. (3 marks)",
      kp=[("Positive: carbon-negative status, clean air/water, watershed protection for hydropower (main export earner)", 1),
          ("Positive: biodiversity and ecotourism, non-wood forest products and timber, international goodwill and climate finance", 0.5),
          ("Negative: less land for farming, roads, industry and housing; higher construction costs and restrictions on land use", 1),
          ("Negative: more human-wildlife conflict (crop damage, livestock loss), forest-fire risk and rural-urban migration/food insecurity", 0.5)],
      model="Positive implications:\n• Environment: Bhutan remains carbon-negative, with clean air and water and protected watersheds.\n• Economy: forests protect the rivers that feed hydropower, Bhutan's largest export; they support high-value low-volume tourism and ecotourism, provide timber and non-wood forest products (mushrooms, bamboo, medicinal plants), and attract climate finance and international goodwill.\n• Biodiversity and culture are conserved.\nNegative implications:\n• Less land is available for agriculture, roads, hydropower and industrial estates, housing and urban growth, raising costs and slowing some projects (land-use restrictions, lengthy forestry clearances).\n• Human-wildlife conflict increases - wild boar, monkeys and elephants damage crops and predators kill livestock, adding to rural poverty, fallow land and migration to towns.\n• Large forest areas also raise the risk of forest fires and require resources to manage."),
 dict(real=False, marks=3, stem="What are iodine deficiency disorders (IDD)? Describe their effects and explain how Bhutan has controlled them. (3 marks)",
      kp=[("IDD: health problems caused by too little dietary iodine, which the thyroid needs to make thyroxine (T3, T4)", 1),
          ("Effects: goitre, hypothyroidism, cretinism and mental retardation in children of deficient mothers, stillbirths/miscarriage, poor school performance", 1),
          ("Control: universal salt iodisation (iodised salt law and Bhutan Salt Industry), monitoring of salt and urinary iodine, awareness; Bhutan was among the first countries declared to have eliminated IDD (2003)", 1)],
      model="Iodine deficiency disorders are the range of health problems caused when the diet lacks iodine, which the thyroid gland needs to make the hormones thyroxine (T4) and triiodothyronine (T3).\nEffects: enlargement of the thyroid (goitre); hypothyroidism with tiredness and weight gain; in pregnancy - miscarriage, stillbirth and babies born with cretinism (severe mental and physical retardation); in children - lower IQ, poor growth and poor school performance; deaf-mutism.\nControl in Bhutan: universal iodisation of salt (iodised salt produced at the Bhutan Salt Industry in Phuentsholing and only iodised salt allowed for sale), regular monitoring of salt iodine content and of urinary iodine in school children, and public education. With these measures Bhutan was recognised in 2003 as one of the first countries to achieve sustainable elimination of IDD."),
 dict(marks=3, stem="Classify carbohydrates based on their structure and composition and give at least three examples. (3 marks)",
      kp=[("Monosaccharides - single sugar units, e.g. glucose, fructose, galactose", 1), ("Disaccharides (and oligosaccharides) - 2 (2-10) units, e.g. sucrose, lactose, maltose", 1),
          ("Polysaccharides - many units, e.g. starch, glycogen, cellulose", 1)],
      model="Carbohydrates are classified by the number of sugar units:\n1. Monosaccharides - simple sugars that cannot be hydrolysed further, e.g. glucose, fructose, galactose, ribose.\n2. Disaccharides - two monosaccharides joined by a glycosidic bond, e.g. sucrose (glucose + fructose), lactose (glucose + galactose), maltose (glucose + glucose). (Oligosaccharides have 3-10 units, e.g. raffinose.)\n3. Polysaccharides - long chains of many units, e.g. starch (plant storage), glycogen (animal storage), cellulose (plant cell walls)."),
 dict(marks=3, stem="State the laws of reflection and refraction and write down at least one application of each. (3 marks)",
      kp=[("Reflection: angle of incidence = angle of reflection; incident ray, reflected ray and normal lie in the same plane", 1),
          ("Refraction: incident ray, refracted ray and normal lie in one plane; Snell's law sin i/sin r = constant (refractive index)", 1),
          ("Applications: reflection - mirrors, periscope, rear-view mirror, dental mirror; refraction - lenses in spectacles, cameras, microscopes, optical fibre/endoscope", 1)],
      model="Laws of reflection: (1) the angle of incidence equals the angle of reflection; (2) the incident ray, the reflected ray and the normal at the point of incidence all lie in the same plane.\nLaws of refraction: (1) the incident ray, the refracted ray and the normal lie in the same plane; (2) Snell's law - for two given media, sin i / sin r is constant (the refractive index of the second medium relative to the first).\nApplications: reflection - plane and curved mirrors, periscopes, rear-view mirrors, dentist's and ENT head mirrors; refraction - lenses in spectacles, cameras, microscopes and the eye; also total internal reflection in optical fibres and endoscopes."),
 dict(marks=3, image="/papers/me/tech2-medsci-2018-distillation.png", stem="The diagram shows a simple distillation apparatus. Write down the names of the parts labelled 1-9 (the diagram need not be drawn). (3 marks)",
      issues=["Labels read from the scanned diagram: 6 = cooling water in (lower end of condenser), 7 = water out (upper end) - please confirm."],
      kp=[("1 Bunsen burner (heat source); 2 distillation (round-bottom) flask; 3 still head (distillation head/adapter)", 1),
          ("4 thermometer; 5 Liebig condenser; 6 cooling water in", 1), ("7 cooling water out; 8 receiving flask (distillate); 9 vent/vacuum adapter outlet", 1)],
      model="1 - Bunsen burner (source of heat), with wire gauze on a tripod.\n2 - Distillation (round-bottom) flask containing the mixture.\n3 - Still head (distillation head) connecting the flask to the condenser.\n4 - Thermometer, with its bulb level with the side arm, to read the boiling point of the vapour.\n5 - Liebig condenser.\n6 - Cooling water inlet (at the lower end of the condenser).\n7 - Cooling water outlet (at the upper end).\n8 - Receiving flask collecting the distillate.\n9 - Vent (vacuum adapter outlet) open to the air, so pressure does not build up."),
 dict(marks=3, stem="State the specific function of each of the following: (i) pulmonary artery, (ii) glomerulus, (iii) islets of Langerhans, (iv) patella, (v) gall bladder, (vi) duodenum. (3 marks)",
      kp=[("(a) Pulmonary artery carries deoxygenated blood from the right ventricle to the lungs; (b) glomerulus filters blood (ultrafiltration) to form glomerular filtrate in the nephron", 1),
          ("(c) Islets of Langerhans secrete insulin (β cells) and glucagon (α cells) to control blood sugar; (d) patella (knee cap) protects the knee joint and increases the leverage of the quadriceps", 1),
          ("(e) Gall bladder stores and concentrates bile and releases it into the duodenum; (f) duodenum receives bile and pancreatic juice and is the main site of chemical digestion (neutralises stomach acid)", 1)],
      model="(a) Pulmonary artery - carries deoxygenated blood from the right ventricle to the lungs for oxygenation.\n(b) Glomerulus - a knot of capillaries in Bowman's capsule that filters blood under pressure (ultrafiltration), forming the glomerular filtrate - the first step in urine formation.\n(c) Islets of Langerhans - endocrine cells of the pancreas: β cells secrete insulin (lowers blood glucose) and α cells secrete glucagon (raises it).\n(d) Patella (knee cap) - a sesamoid bone that protects the front of the knee joint and improves the leverage of the quadriceps tendon.\n(e) Gall bladder - stores and concentrates bile made by the liver and releases it into the duodenum after a fatty meal.\n(f) Duodenum - first part of the small intestine; receives bile and pancreatic juice, neutralises the acid from the stomach and carries out most chemical digestion."),
 dict(marks=3, image=EYE, stem="From the diagram of the human eye, write down the names of the parts numbered 1-12 in the correct sequence (the diagram need not be drawn). (3 marks)",
      issues=["Labels read from the scanned diagram (1 ciliary body, 2 suspensory ligament, 9 fovea) - please confirm against the original."],
      kp=[("1 ciliary body (muscle); 2 suspensory ligament; 3 iris; 4 aqueous humour (anterior chamber)", 1), ("5 lens; 6 cornea; 7 vitreous humour; 8 optic nerve (blind spot where it leaves)", 1),
          ("9 fovea (yellow spot); 10 sclera; 11 choroid; 12 retina", 1)],
      model="1 - Ciliary body (ciliary muscle)\n2 - Suspensory ligament\n3 - Iris\n4 - Aqueous humour (in the anterior chamber)\n5 - Lens\n6 - Cornea\n7 - Vitreous humour\n8 - Optic nerve (the point where it leaves the eye is the blind spot)\n9 - Fovea (yellow spot)\n10 - Sclera\n11 - Choroid\n12 - Retina"),
 dict(real=False, marks=3, stem="Explain the principle of the autoclave and state the standard conditions used to sterilise hospital instruments. (3 marks)",
      kp=[("Principle: moist heat - saturated steam under pressure reaches a higher temperature than boiling water and kills all microbes including spores by denaturing/coagulating proteins", 1),
          ("Standard conditions: 121 °C at about 15 psi (1 bar above atmospheric) for 15-20 minutes (or 134 °C for 3-5 minutes)", 1),
          ("Use and checks: for instruments, linen, culture media and infectious waste; correct loading, air removal; chemical indicator tape/biological indicator (Geobacillus stearothermophilus spores) to confirm sterilisation", 1)],
      model="Principle: an autoclave sterilises by moist heat. Water is heated in a sealed chamber so the steam is under pressure; at higher pressure water boils at a higher temperature. Saturated steam at this temperature penetrates materials and kills all microorganisms, including bacterial spores, by coagulating and denaturing their proteins.\nStandard conditions: 121 °C at a pressure of about 15 lb per square inch (about 1 bar above atmospheric) for 15-20 minutes; or 134 °C for 3-5 minutes in high-speed cycles.\nUse and checks: used for surgical instruments, dressings, linen, culture media and infectious laboratory waste. Items must be cleaned and loosely packed so steam can reach every surface, air must be removed, and each cycle is checked with indicator tape and periodically with biological indicators (spores of Geobacillus stearothermophilus)."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
