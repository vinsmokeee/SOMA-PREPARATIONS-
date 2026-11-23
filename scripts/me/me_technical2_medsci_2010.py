"""ME Technical Paper II (General Subject Knowledge), MEDICAL SCIENCE group, Civil Service Common Examination (CSCE) 2010 -
real paper, PDF sent by the founder (a scanned copy: every question was typed from the page images). Same layout as the
latest (BCSE 2025) paper: Part I 70 MCQ x 1; Part II 10 short answers x 3 - so no marks were changed. No figures.
The paper itself has no MCQ 56 ('Q. No. 56 is missing' is written on the original).
Repeats (recorded as appearances, not loaded again): MCQ 22 (BCSE 2013 MCQ 44), 26, 29 (2019), 30, 58, 61, 62, 66 (BCSE 2015),
70 (2018), 49 (2022), 63, 65 (2011).
Left out: MCQ 3 (beeswax comes from all three Apis species), 31 (graphite and carbon both right), 20 (laser gas mixtures - more than one answer). Sixteen new MCQs
(including one for the missing MCQ 56) keep Part I at 70.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Medical Science): BCSE 2010, batch 1"
GROUP_TAG = "medsci2010"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "medical-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2010 Main Examination, Technical Paper II, Medical Science", "year": 2010, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Medical Science: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "All are common bacterial diseases of domestic animals EXCEPT:",
"opts": [
"Anthrax",
"Brucellosis",
"Salmonellosis",
"Foot and mouth disease"
]
},
{
"n": 2,
"stem": "'Ewe' is the female of the:",
"opts": [
"Goat",
"Sheep",
"Donkey",
"Horse"
]
},
{
"n": 4,
"stem": "Fish meat is considered better than other meats because it contains more:",
"opts": [
"Carbohydrate",
"Fats",
"Proteins (easily digestible, with healthy fats)",
"Water"
]
},
{
"n": 5,
"stem": "The ability of an organism to ward off infection is called:",
"opts": [
"Resistance",
"Pathogenicity",
"Infection",
"Virulence"
]
},
{
"n": 6,
"stem": "Which of the following cells are involved in the defence mechanism of the body?",
"opts": [
"Lymphocytes",
"Neutrophils",
"Macrophages",
"All of the above"
]
},
{
"n": 7,
"stem": "Sexually transmitted diseases in humans include:",
"opts": [
"Syphilis",
"Chancroid",
"Gonorrhoea",
"All of the above"
]
},
{
"n": 8,
"stem": "All are non-communicable diseases EXCEPT:",
"opts": [
"Hypertension",
"Diabetes mellitus",
"Tuberculosis",
"Gout"
]
},
{
"n": 9,
"stem": "When the stem of a plant is modified into a green, flattened structure and the leaves into spines, it is called a:",
"opts": [
"Phyllode",
"Cladode (phylloclade)",
"Bulbil",
"Phylloclad"
]
},
{
"n": 10,
"stem": "A bud that grows at the apex (tip) of a stem or branch is called a(n):",
"opts": [
"Axillary bud",
"Terminal bud",
"Accessory bud",
"Adventitious bud"
]
},
{
"n": 11,
"stem": "The storage root of a carrot is a modified:",
"opts": [
"Tap root",
"Adventitious root",
"Stem",
"Leaf"
]
},
{
"n": 12,
"stem": "The stem of a plant develops directly from the:",
"opts": [
"Cotyledons",
"Radicle",
"Integuments",
"Plumule"
]
},
{
"n": 13,
"stem": "If a cell swells after being placed in a solution, the solution is:",
"opts": [
"Neutral",
"Hypertonic",
"Hypotonic",
"Isotonic"
]
},
{
"n": 14,
"stem": "When a plant cell is fully turgid, which of the following is zero?",
"opts": [
"Suction pressure (diffusion pressure deficit)",
"Wall pressure",
"Osmotic pressure",
"Turgor pressure"
]
},
{
"n": 15,
"stem": "The distribution of stomata per unit area of a leaf and their size affect the rate of:",
"opts": [
"Absorption",
"Respiration",
"Transpiration",
"Guttation"
]
},
{
"n": 16,
"stem": "Where would you find pseudostratified columnar epithelium?",
"opts": [
"Mouth",
"Epidermis",
"Kidneys",
"Trachea"
]
},
{
"n": 17,
"stem": "The inner surface of the large intestine is lined with:",
"opts": [
"Muscular tissue",
"Glandular (columnar) epithelium",
"Dermis",
"Cuticle"
]
},
{
"n": 18,
"stem": "The alveoli of mammalian lungs are lined with:",
"opts": [
"Simple cuboidal epithelium",
"Ciliated columnar epithelium",
"Simple squamous epithelium",
"Ciliated cuboidal epithelium"
]
},
{
"n": 19,
"stem": "The serous membrane covering the lungs is called the:",
"opts": [
"Pleura",
"Peritoneum",
"Pericardium",
"Serosa"
]
},
{
"n": 21,
"stem": "In the blast furnace for iron, when limestone is added, the calcium ends up in the:",
"opts": [
"Slag",
"Gangue",
"Metallic calcium",
"Calcium carbonate"
]
},
{
"n": 23,
"stem": "Concentrated sulphuric acid changes cane sugar into:",
"opts": [
"Carbon",
"Carbon dioxide",
"Carbon monoxide",
"Oxalic acid"
]
},
{
"n": 24,
"stem": "Pyrolusite is a mineral that contains:",
"opts": [
"Silver",
"Manganese",
"Chromium",
"Zinc"
]
},
{
"n": 25,
"stem": "Ethanal can be made from ethanol by:",
"opts": [
"Oxidation",
"Reduction",
"Hydration",
"Dehydration"
]
},
{
"n": 27,
"stem": "Barium is obtained by reducing its oxide with:",
"opts": [
"Carbon",
"Sodium",
"Magnesium",
"Aluminium"
]
},
{
"n": 28,
"stem": "The hardest of the alkali metals is:",
"opts": [
"Lithium",
"Sodium",
"Potassium",
"Calcium"
]
},
{
"n": 32,
"stem": "Sebum is secreted by the:",
"opts": [
"Sweat glands",
"Mucous glands",
"Sebaceous glands",
"Cardiac glands"
]
},
{
"n": 33,
"stem": "The endometrium is the innermost layer of the:",
"opts": [
"Blood vessels",
"Uterus",
"Bones",
"Intestine"
]
},
{
"n": 34,
"stem": "Mast cells are found in:",
"opts": [
"Adipose tissue",
"Areolar (loose connective) tissue",
"Fibrous tissue",
"Muscles"
]
},
{
"n": 35,
"stem": "When concentrated sulphuric acid is added to a small amount of a salt in a test tube, a colourless gas with a pungent smell is evolved (giving white fumes with ammonia). The inference is:",
"opts": [
"Chloride may be present in the salt",
"Presence of chloride in the salt is confirmed",
"Nitrate may be present in the salt",
"Presence of nitrate in the salt is confirmed"
]
},
{
"n": 36,
"stem": "A catalyst is a substance which:",
"opts": [
"increases the equilibrium concentration of the product",
"changes the equilibrium constant of the reaction",
"shortens the time to reach equilibrium",
"supplies energy to the reaction"
]
},
{
"n": 37,
"stem": "Faraday's laws of electrolysis are related to the:",
"opts": [
"atomic numbers of the ions discharged",
"moles of ions discharged",
"equivalent weights of the ions discharged",
"moles and equivalent weights of the ions discharged"
]
},
{
"n": 38,
"stem": "When an electric current is passed through an aqueous solution of sodium chloride:",
"opts": [
"the pH progressively decreases",
"the pH progressively increases",
"the pH does not change",
"a change in pH can be predicted only if concentration and current are known"
]
},
{
"n": 39,
"stem": "Sucrose is found in:",
"opts": [
"Sugar cane",
"Starch",
"Honey",
"Orange"
]
},
{
"n": 40,
"stem": "Pepsin is an example of a(n):",
"opts": [
"Enzyme",
"Hormone",
"Nutrient",
"Vitamin"
]
},
{
"n": 41,
"stem": "The islets of Langerhans are found in the:",
"opts": [
"Ovary",
"Liver",
"Pancreas",
"Spleen"
]
},
{
"n": 42,
"stem": "Bilirubin is mainly excreted in the:",
"opts": [
"Blood",
"Bile",
"Saliva",
"Pancreatic juice"
]
},
{
"n": 43,
"stem": "Glycogen is stored in the:",
"opts": [
"Liver and muscles",
"Liver only",
"Muscles only",
"Pancreas"
]
},
{
"n": 44,
"stem": "Amino acids that can be synthesised in the body are called:",
"opts": [
"Non-essential amino acids",
"Essential amino acids",
"Active amino acids",
"Inactive amino acids"
]
},
{
"n": 45,
"stem": "Most carbon dioxide is carried in the blood in the form of:",
"opts": [
"Sodium bicarbonate (bicarbonate ions)",
"Sodium carbonate",
"Potassium carbonate",
"Magnesium bicarbonate"
]
},
{
"n": 46,
"stem": "The breathing centre that controls normal breathing in mammals lies in the:",
"opts": [
"Cerebellum",
"Cerebrum",
"Midbrain",
"Medulla oblongata"
]
},
{
"n": 47,
"stem": "The foramen of Monro is an opening between the:",
"opts": [
"brain and spinal cord",
"third and fourth ventricles",
"lateral and third ventricles",
"none of the above"
]
},
{
"n": 48,
"stem": "When the sympathetic nerve supply to the heart is completely cut off, the heart beat will:",
"opts": [
"show no change",
"increase",
"decrease",
"none of the above"
]
},
{
"n": 50,
"stem": "A magnetic field can be produced by:",
"opts": [
"a moving charge only",
"a changing electric field only",
"neither of them",
"both (a) and (b)"
]
},
{
"n": 51,
"stem": "If a beta particle is emitted from a radioactive nucleus, its atomic number:",
"opts": [
"increases by one",
"decreases by one",
"increases by two",
"decreases by two"
]
},
{
"n": 52,
"stem": "Which of the following is NOT a fundamental particle?",
"opts": [
"Proton",
"Neutron",
"Meson",
"Alpha particle"
]
},
{
"n": 53,
"stem": "The resistance of a straight conductor does NOT depend on its:",
"opts": [
"temperature",
"length",
"material",
"shape of cross-section (for the same area)"
]
},
{
"n": 54,
"stem": "The angle between the magnetic meridian and the geographic meridian is known as:",
"opts": [
"magnetic dip",
"magnetic declination",
"magnetic movement",
"magnetic field strength"
]
},
{
"n": 55,
"stem": "Of the following, the most suitable material for making electromagnets is:",
"opts": [
"Soft iron",
"Steel",
"Copper",
"Nickel"
]
},
{
"n": 57,
"stem": "The working of a dynamo is based on:",
"opts": [
"the magnetic effect of current",
"the heating effect of current",
"the chemical effect of current",
"electromagnetic induction"
]
},
{
"n": 59,
"stem": "The compound microscope is commonly credited to the invention of:",
"opts": [
"Römer",
"Galileo",
"Foucault",
"Fizeau"
]
},
{
"n": 60,
"stem": "The candela is the unit of:",
"opts": [
"acoustic intensity",
"electric intensity",
"luminous intensity",
"magnetic intensity"
]
},
{
"n": 64,
"stem": "As the speed of an electric fan is increased (using its regulator), the current drawn:",
"opts": [
"increases",
"decreases",
"remains the same",
"becomes maximum when speed is maximum"
]
},
{
"n": 67,
"stem": "Tuberculosis is a disease caused by:",
"opts": [
"a virus",
"bacteria",
"arthropods",
"none of the above"
]
},
{
"n": 68,
"stem": "HIV/AIDS can be transmitted through:",
"opts": [
"blood",
"breast milk",
"body fluids (semen, vaginal fluids)",
"all of the above"
]
},
{
"n": 69,
"stem": "Condoms are used for:",
"opts": [
"contraception",
"prevention of HIV/AIDS",
"prevention of sexually transmitted diseases",
"all of the above"
]
}
]"""

KEY = {
 1: ('d', 'Foot-and-mouth disease is caused by a virus; anthrax, brucellosis and salmonellosis are bacterial.'),
 2: ('b', 'A ewe is a female sheep (female goat - nanny/doe; female donkey - jenny; female horse - mare).'),
 4: ('c', 'Fish is a rich source of easily digestible protein with less saturated fat (and omega-3 fatty acids).'),
 5: ('a', "Resistance (immunity) is the host's ability to resist infection; pathogenicity and virulence describe the microbe."),
 6: ('d', 'Lymphocytes (specific immunity), neutrophils and macrophages (phagocytosis) all defend the body.'),
 7: ('d', 'Syphilis (Treponema), chancroid (Haemophilus ducreyi) and gonorrhoea (Neisseria) are all STDs.'),
 8: ('c', 'Tuberculosis is an infectious (communicable) disease caused by Mycobacterium tuberculosis.'),
 9: ('b', 'A flattened green photosynthetic stem is a phylloclade; one of only one or two internodes is a cladode (e.g. asparagus). Opuntia (cactus) is the classic phylloclade.'),
 10: ('b', 'The terminal (apical) bud is at the tip; axillary buds are in leaf axils.'),
 11: ('a', 'The carrot is a conical modified tap root.'),
 12: ('d', 'The plumule of the embryo grows into the shoot (stem); the radicle becomes the root.'),
 13: ('c', 'In a hypotonic (more dilute) solution water enters the cell by osmosis and it swells.'),
 14: ('a', 'In a fully turgid cell turgor pressure equals osmotic pressure, so the suction pressure (DPD) is zero and no more water enters.'),
 15: ('c', 'Most water is lost through stomata, so their number and size control transpiration.'),
 16: ('d', 'The trachea is lined by pseudostratified ciliated columnar epithelium with goblet cells.'),
 17: ('b', 'The colon is lined by simple columnar epithelium rich in mucus-secreting goblet cells.'),
 18: ('c', 'Thin, flat simple squamous cells allow rapid diffusion of gases.'),
 19: ('a', 'The pleura covers the lungs; the pericardium surrounds the heart and the peritoneum lines the abdomen.'),
 21: ('a', 'Limestone decomposes to CaO, which combines with silica gangue to form calcium silicate slag.'),
 23: ('a', 'Conc. H₂SO₄ is a strong dehydrating agent: C₁₂H₂₂O₁₁ → 12C + 11H₂O, leaving black carbon (sugar charcoal).'),
 24: ('b', 'Pyrolusite is manganese dioxide (MnO₂), the main ore of manganese.'),
 25: ('a', 'Oxidising ethanol (e.g. with acidified dichromate, or dehydrogenation) gives ethanal (acetaldehyde).'),
 27: ('d', 'Barium is produced by aluminothermic reduction of barium oxide with aluminium (or by electrolysis of molten BaCl₂).'),
 28: ('a', 'Alkali metals get softer down the group; lithium is the hardest (calcium is an alkaline-earth metal).'),
 32: ('c', 'Sebaceous glands, opening into hair follicles, secrete oily sebum that keeps skin and hair supple.'),
 33: ('b', 'The endometrium lines the uterus and is shed during menstruation.'),
 34: ('b', 'Mast cells, which release histamine and heparin, are typical cells of areolar connective tissue.'),
 35: ('a', 'A colourless pungent gas (HCl) suggests chloride, but it is only a preliminary test - confirmation needs the silver nitrate test. Nitrates give brown NO₂ fumes.'),
 36: ('c', 'A catalyst speeds up forward and reverse reactions equally, so equilibrium is reached sooner without changing its position.'),
 37: ('c', 'The second law: masses liberated by the same charge are proportional to their equivalent weights.'),
 38: ('b', 'H₂ is released at the cathode and Cl₂ at the anode, leaving NaOH in solution, so the pH rises.'),
 39: ('a', 'Sucrose (cane sugar) is the main sugar of sugar cane and sugar beet; honey is mostly glucose and fructose.'),
 40: ('a', 'Pepsin is a protein-digesting enzyme of gastric juice.'),
 41: ('c', 'These endocrine cell clusters of the pancreas secrete insulin and glucagon.'),
 42: ('b', 'Bilirubin from haem breakdown is conjugated in the liver and excreted in bile (it is transported in blood bound to albumin).'),
 43: ('a', 'Glycogen is stored mainly in the liver (for blood glucose) and skeletal muscles (for their own use).'),
 44: ('a', 'Non-essential amino acids are made in the body; essential ones must come from the diet.'),
 45: ('a', 'About 70% of CO₂ travels as bicarbonate (HCO₃⁻) in plasma, largely as sodium bicarbonate.'),
 46: ('d', 'The respiratory centre is in the medulla oblongata (with the pons).'),
 47: ('c', 'The interventricular foramina (of Monro) connect each lateral ventricle with the third ventricle; the aqueduct joins the third and fourth.'),
 48: ('c', 'Sympathetic nerves speed the heart; removing them leaves parasympathetic (vagal) slowing unopposed, so the rate falls (the heart still beats on its own pacemaker).'),
 50: ('d', "Magnetic fields arise from moving charges (currents) and from changing electric fields (Maxwell's displacement current)."),
 51: ('a', 'In β⁻ decay a neutron becomes a proton and an electron is emitted, so Z rises by 1.'),
 52: ('d', 'An alpha particle is a helium nucleus (2 protons + 2 neutrons), a composite particle.'),
 53: ('d', 'R = ρL/A depends on material, length, area and temperature, not on the shape of the cross-section.'),
 54: ('b', 'Declination (variation) is the angle between true north and magnetic north; dip is the angle with the horizontal.'),
 55: ('a', 'Soft iron is easily magnetised and demagnetised (high permeability, low retentivity).'),
 57: ('d', "A dynamo (generator) produces current by electromagnetic induction (Faraday's law)."),
 59: ('b', 'Of these, Galileo is credited with an early compound microscope (occhiolino, 1609); the Janssens (c. 1590) are also often named.'),
 60: ('c', 'The candela is the SI base unit of luminous intensity.'),
 64: ('a', 'A higher speed setting lets more current through the motor windings (less resistance/impedance in the regulator), so the current increases.'),
 67: ('b', 'TB is caused by the bacterium Mycobacterium tuberculosis.'),
 68: ('d', 'HIV spreads through infected blood, sexual fluids and from mother to child, including through breast milk.'),
 69: ('d', 'Correct, consistent condom use prevents pregnancy, HIV and other STIs.'),
}

NEW_MCQ = [
    ('Which blood vessel carries oxygenated blood from the lungs to the heart?', ['Pulmonary artery', 'Pulmonary vein', 'Aorta', 'Vena cava'], 'b', 'The pulmonary veins return oxygen-rich blood to the left atrium - the only veins carrying oxygenated blood in adults.'),
    ('Which organ produces bile?', ['Gall bladder', 'Pancreas', 'Liver', 'Stomach'], 'c', 'Bile is made by the liver and stored and concentrated in the gall bladder.'),
    ('The basic unit of heredity is the:', ['Cell', 'Gene', 'Chromosome', 'Nucleus'], 'b', 'A gene is a segment of DNA that codes for a trait; genes are carried on chromosomes.'),
    ('Which vitamin is produced in the skin on exposure to sunlight?', ['Vitamin A', 'Vitamin C', 'Vitamin D', 'Vitamin K'], 'c', 'UV-B light converts 7-dehydrocholesterol in the skin into vitamin D₃.'),
    ('The normal range of fasting blood glucose in a healthy adult is about:', ['40-60 mg/dL', '70-100 mg/dL', '140-180 mg/dL', '200-250 mg/dL'], 'b', 'Fasting glucose of 70-100 mg/dL is normal; 126 mg/dL or more on repeated tests indicates diabetes.'),
    ('Which instrument is used to listen to heart and lung sounds?', ['Sphygmomanometer', 'Stethoscope', 'Otoscope', 'Ophthalmoscope'], 'b', 'The stethoscope (invented by Laennec) is used for auscultation of the heart, lungs and bowel.'),
    ('The cause of night blindness is deficiency of:', ['Vitamin A', 'Vitamin B1', 'Vitamin C', 'Vitamin D'], 'a', 'Vitamin A is needed to make rhodopsin in the rods; its lack causes night blindness and xerophthalmia.'),
    ('The universal antidote for oral poisoning traditionally contains:', ['Activated charcoal, magnesium oxide and tannic acid', 'Sodium chloride and sugar', 'Milk and egg white only', 'Vinegar and water'], 'a', "The classic 'universal antidote' mixes activated charcoal (adsorbs poisons), magnesium oxide (neutralises acids) and tannic acid (precipitates alkaloids); activated charcoal alone is used today."),
    ('Which gland secretes thyroxine?', ['Pituitary', 'Adrenal', 'Thyroid', 'Parathyroid'], 'c', 'The thyroid gland in the neck secretes thyroxine (T4) and triiodothyronine (T3).'),
    ('Which part of the human ear helps to maintain balance?', ['Cochlea', 'Semicircular canals', 'Ear drum', 'Pinna'], 'b', 'The semicircular canals (with the utricle and saccule) detect head movement and maintain balance.'),
    ('The process by which white blood cells engulf and destroy bacteria is called:', ['Pinocytosis', 'Phagocytosis', 'Exocytosis', 'Osmosis'], 'b', 'Neutrophils and macrophages engulf bacteria by phagocytosis and digest them with lysosomal enzymes.'),
    ('The human heart is enclosed in a double-layered membrane called the:', ['Pleura', 'Pericardium', 'Peritoneum', 'Meninges'], 'b', 'The pericardium surrounds and protects the heart; the pleura covers the lungs.'),
    ('An instrument used to measure atmospheric pressure is the:', ['Thermometer', 'Barometer', 'Hygrometer', 'Ammeter'], 'b', 'A barometer measures atmospheric pressure; a hygrometer measures humidity.'),
    ('Kilowatt-hour (kWh) is a unit of:', ['Power', 'Energy', 'Current', 'Voltage'], 'b', "1 kWh is the energy used by a 1 kW device in 1 hour (3.6 × 10⁶ J) - the 'unit' on electricity bills."),
    ('Which disease is caused by deficiency of iron in the diet?', ['Goitre', 'Anaemia', 'Rickets', 'Scurvy'], 'b', 'Iron is needed for haemoglobin; its deficiency causes iron-deficiency (microcytic) anaemia.'),
    ('Insulin is chemically a:', ['Steroid', 'Protein (polypeptide)', 'Carbohydrate', 'Lipid'], 'b', 'Insulin is a small protein of 51 amino acids in two chains joined by disulphide bonds.'),
]

SAQ = [
 dict(marks=3, stem="How many moles of sulphur atoms and oxygen atoms are present in one mole each of H₂SO₄, H₂SO₃ and SO₂? (3 marks)",
      kp=[("H₂SO₄: 1 mol S and 4 mol O atoms", 1), ("H₂SO₃: 1 mol S and 3 mol O atoms", 1), ("SO₂: 1 mol S and 2 mol O atoms (number of atoms = moles × 6.022 × 10²³)", 1)],
      model="One mole of a compound contains as many moles of each atom as the subscript in its formula:\n• H₂SO₄ - 1 mol of S atoms and 4 mol of O atoms (4 × 6.022 × 10²³ O atoms).\n• H₂SO₃ - 1 mol of S atoms and 3 mol of O atoms.\n• SO₂ - 1 mol of S atoms and 2 mol of O atoms.\nSo each contains 1 mol (6.022 × 10²³) sulphur atoms, and 4, 3 and 2 mol of oxygen atoms respectively."),
 dict(marks=3, stem="What is electroplating? (3 marks)",
      kp=[("Electroplating: depositing a thin layer of one metal on another object by electrolysis", 1),
          ("Method: object to be plated is the cathode, plating metal is the anode, electrolyte is a solution of a salt of the plating metal; metal ions are reduced and deposited on the cathode", 1),
          ("Purposes/examples: prevent corrosion, improve appearance/hardness - chromium or nickel plating of taps and surgical instruments, silver/gold plating of jewellery, tin plating of cans", 1)],
      model="Electroplating is the process of coating an object with a thin layer of a metal by electrolysis.\nThe object to be plated is made the cathode (negative electrode), the plating metal is made the anode, and the electrolyte is a solution of a salt of the plating metal (e.g. silver nitrate or nickel sulphate). When current passes, metal ions in the solution are reduced and deposited on the object, while the anode dissolves to replace them.\nIt is used to prevent corrosion and improve appearance or hardness, e.g. chromium or nickel plating of taps, bicycle parts and surgical instruments, silver and gold plating of jewellery and utensils, and tin plating of food cans."),
 dict(marks=3, stem="What is sericulture? (3 marks)",
      kp=[("Sericulture: rearing of silkworms for the production of raw silk", 1), ("Silkworm (Bombyx mori) fed on mulberry leaves; life cycle egg → larva → pupa in cocoon → moth; cocoons boiled/reeled to obtain silk thread", 1),
          ("Other types (eri, muga, tasar); in Bhutan eri silk (castor) and mulberry silk are reared, supporting traditional weaving (kira, gho) and rural income", 1)],
      model="Sericulture is the rearing of silkworms to produce raw silk. The common mulberry silkworm, Bombyx mori, is fed on mulberry leaves. Its life cycle is egg → larva (caterpillar) → pupa inside a cocoon → adult moth. The larva spins a cocoon of a continuous silk thread made of the protein fibroin. Cocoons are collected, boiled or steamed to kill the pupa, and the thread is unwound (reeled) and spun into silk yarn.\nOther types are eri silk (worms fed on castor leaves), muga and tasar. In Bhutan, eri and mulberry silk are produced in some dzongkhags and used in traditional weaving of kira and gho, giving rural households extra income."),
 dict(marks=3, stem="Define immunity. Name its types. (3 marks)",
      kp=[("Immunity: the ability of the body to resist/defend against infection by pathogens and their toxins", 1),
          ("Innate (natural, non-specific) immunity: skin, mucous membranes, phagocytes, fever, inflammation - present from birth", 1),
          ("Acquired (adaptive, specific) immunity: active (infection, vaccination) and passive (maternal antibodies, antiserum); involves B and T lymphocytes and memory", 1)],
      model="Immunity is the ability of the body to resist disease by recognising and destroying pathogens (bacteria, viruses, parasites) and their toxins.\nTypes:\n1. Innate (natural, non-specific) immunity - present from birth and acts against all invaders: barriers such as skin and mucous membranes, stomach acid and lysozyme, phagocytic cells (neutrophils, macrophages), fever and inflammation.\n2. Acquired (adaptive, specific) immunity - develops after exposure to a particular antigen and has memory, through B lymphocytes (antibodies) and T lymphocytes. It may be active (the body makes its own antibodies after infection or vaccination - long-lasting) or passive (ready-made antibodies received from the mother or as antiserum/immunoglobulin - immediate but short-lived)."),
 dict(marks=3, stem="Define health as per the World Health Organization (WHO) definition, and explain the dimensions of health. (3 marks)",
      kp=[("WHO (1948): 'Health is a state of complete physical, mental and social well-being and not merely the absence of disease or infirmity'", 1.5),
          ("Physical dimension (body functioning, fitness), mental dimension (emotional/psychological well-being), social dimension (relationships, community)", 1),
          ("Other dimensions often added: spiritual, emotional; linked to Bhutan's Gross National Happiness/well-being", 0.5)],
      model="According to the WHO constitution (1948): \"Health is a state of complete physical, mental and social well-being and not merely the absence of disease or infirmity.\"\nThis means health is a positive state with several dimensions:\n• Physical - the body and its organs function properly; good fitness, nutrition and sleep.\n• Mental - emotional and psychological well-being; the ability to cope with stress, think clearly and work productively.\n• Social - good relationships with family and community and the ability to fit into society.\nSpiritual and emotional dimensions are also recognised, which match Bhutan's idea of well-being under Gross National Happiness."),
 dict(marks=3, stem="Define diffusion and give two examples of diffusion in the human body. (3 marks)",
      kp=[("Diffusion: net movement of molecules/ions from a region of higher concentration to lower concentration (down a concentration gradient) until evenly distributed; passive, no energy needed", 1.5),
          ("Example 1: oxygen from alveoli into blood and CO₂ from blood into alveoli", 0.75), ("Example 2: oxygen/glucose from capillaries into tissue cells, or absorption of some digested food in the intestine", 0.75)],
      model="Diffusion is the net movement of molecules or ions from a region where they are in higher concentration to a region of lower concentration, down a concentration gradient, until they are evenly distributed. It is a passive process that needs no energy; its rate increases with temperature, a steeper gradient and a larger, thinner surface.\nExamples in the body: (1) gas exchange in the lungs - oxygen diffuses from the alveoli into the blood and carbon dioxide from the blood into the alveoli; (2) oxygen and glucose diffuse from blood capillaries into tissue cells, while carbon dioxide and urea diffuse out; some products of digestion are absorbed in the small intestine by diffusion."),
 dict(marks=3, stem="Define osmotic pressure. (3 marks)",
      kp=[("Osmotic pressure: the minimum pressure that must be applied to a solution to stop the flow of pure solvent into it through a semipermeable membrane (prevent osmosis)", 1.5),
          ("Depends on the number of solute particles (colligative): π = CRT (van 't Hoff); higher concentration → higher osmotic pressure", 1),
          ("Importance: maintains water balance of cells; plasma proteins (oncotic pressure) hold fluid in blood vessels; isotonic IV fluids like 0.9% saline", 0.5)],
      model="Osmotic pressure is the pressure that must be applied to a solution to prevent the flow of pure solvent into it through a semipermeable membrane - in other words, the pressure needed to stop osmosis.\nIt is a colligative property: it depends on the number of solute particles, not their nature, and is given by van 't Hoff's equation π = CRT (C = molar concentration, R = gas constant, T = absolute temperature). A more concentrated solution has a higher osmotic pressure.\nIn the body, osmotic pressure controls the movement of water between cells and their surroundings; the osmotic (oncotic) pressure of plasma proteins keeps fluid in the blood vessels, and intravenous fluids such as 0.9% saline are made isotonic with blood so that red cells neither swell nor shrink."),
 dict(marks=3, stem="Define turgor pressure and state its importance in plants. (3 marks)",
      kp=[("Turgor pressure: the pressure exerted by the cell contents (vacuole) against the cell wall when the cell has taken in water by osmosis (equal and opposite to wall pressure)", 1.5),
          ("Importance: keeps cells turgid and non-woody plant parts (leaves, young stems) firm and upright; wilting when it falls", 1),
          ("Also drives cell enlargement/growth and the opening and closing of stomata (guard cells)", 0.5)],
      model="Turgor pressure is the pressure exerted by the protoplast (mainly the vacuole) against the cell wall when a plant cell has absorbed water by osmosis. The cell wall pushes back with an equal and opposite force, called wall pressure. A cell in this state is turgid.\nImportance: turgor keeps cells firm, so non-woody parts such as leaves, flowers and young stems stay upright; when water is lost, turgor falls and the plant wilts. Turgor pressure also provides the force for cell enlargement during growth and controls the opening and closing of stomata through changes in the guard cells."),
 dict(marks=3, stem="What is the role of haemoglobin in respiration? (3 marks)",
      kp=[("Haemoglobin is the iron-containing red pigment of red blood cells; each molecule has 4 haem groups and can bind 4 O₂", 1),
          ("In the lungs (high pO₂) it combines with oxygen to form oxyhaemoglobin; in tissues (low pO₂, high CO₂, low pH) it releases oxygen", 1),
          ("It also carries some CO₂ (as carbaminohaemoglobin, about 20-25%) and buffers H⁺, helping CO₂ transport back to the lungs", 1)],
      model="Haemoglobin is the red, iron-containing protein pigment in red blood cells. Each molecule has four haem groups, each with an iron (Fe²⁺) atom that can bind one oxygen molecule.\nIn the lungs, where the partial pressure of oxygen is high, haemoglobin combines with oxygen to form oxyhaemoglobin, so blood carries about 70 times more oxygen than plasma alone could. In the tissues, where oxygen pressure is low and carbon dioxide and acidity are high (Bohr effect), oxyhaemoglobin releases its oxygen for cellular respiration.\nHaemoglobin also carries part of the carbon dioxide (about 20-25%) back to the lungs as carbaminohaemoglobin and buffers H⁺ ions, helping transport of CO₂ as bicarbonate."),
 dict(marks=3, stem="What is spermatogenesis? (3 marks)",
      kp=[("Spermatogenesis: the formation of sperm (spermatozoa) from germ cells in the seminiferous tubules of the testes, from puberty onwards", 1),
          ("Stages: spermatogonia (2n) multiply by mitosis → primary spermatocytes → meiosis I → secondary spermatocytes (n) → meiosis II → spermatids (n) → spermiogenesis → sperm; one spermatocyte gives 4 sperm", 1.5),
          ("Controlled by FSH and testosterone (LH); Sertoli cells nourish developing sperm", 0.5)],
      model="Spermatogenesis is the process by which male gametes (sperm) are produced in the seminiferous tubules of the testes, continuously from puberty.\nStages: (1) multiplication - diploid spermatogonia divide by mitosis; (2) growth - some enlarge into primary spermatocytes (2n); (3) maturation - each primary spermatocyte undergoes meiosis I to form two haploid secondary spermatocytes, and meiosis II gives four haploid spermatids; (4) spermiogenesis - spermatids change into motile spermatozoa with a head (nucleus and acrosome), middle piece (mitochondria) and tail.\nThe process takes about 64-74 days and is controlled by FSH and testosterone (released under LH); Sertoli cells nourish the developing sperm."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
