"""ME Technical Paper II (General Subject Knowledge), MEDICAL SCIENCE group, BCSE 2025 - real paper. PDF sent by the founder.
Pattern: Part I 70 multiple choice x 1; Part II 10 short answers x 3 (all compulsory). 90 min + 15 min reading.
Left out (answer not certain or picture missing): MCQ 2 (emulsification - options ambiguous), 21 (tooth hypoplasia),
52 (reaction shown as a picture not in the text), 57 (solar emission band); four new MCQs keep Part I at 70.
Part II Q8 and Q10 use the paper's diagrams (public/papers/me/). Marks within Q1-Q3 parts are not printed, so each
question is kept whole (3 marks). MCQ 23: the paper printed options (b) and (d) identically; (d) was reworded
(the answer, (a), is unchanged).
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Medical Science): BCSE 2025, batch 1"
GROUP_TAG = "medsci2025"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "medical-science"
MIN_WORDS = 0
GROUP_TIMING = {"duration": 90, "reading": 15, "max_marks": 100}
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper II, Medical Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Medical Science: general subject knowledge"

MCQ = """[
{
"n": 1,
"stem": "The wings of a dragonfly, eagle, bat and Pterodactyl is an example of",
"opts": [
"Homologous organ",
"Vestigial organs",
"Analogous organs",
"None of the above"
]
},
{
"n": 2,
"stem": "Emulsification of fats is a",
"opts": [
"Mechanical digestion",
"Catalytic digestion",
"Chemical digestion",
"Non-catalytic digestion"
]
},
{
"n": 3,
"stem": "What is the pathway taken by a protein that has been made and is to be secreted from a cell?",
"opts": [
"Ribosome → vesicle → Golgi apparatus → cytoplasm",
"Ribosome → vesicle → rough ER → vesicle → SER → vesicle → plasma membrane",
"Rough ER → vesicle → SER → vesicle → Golgi apparatus → vesicle → plasma membrane",
"Rough ER → vesicle → Golgi apparatus → vesicle → plasma membrane"
]
},
{
"n": 4,
"stem": "In an experiment, a student cuts a transverse section of a young stem of a plant which he has taken from his school garden. After observing it under the microscope how would he ascertain whether it is a monocot stem or a dicot stem?",
"opts": [
"With the help of vascular bundles",
"With the help of bulliform cells",
"With the help of caesarean strips",
"With the help of stomatal apparatus"
]
},
{
"n": 5,
"stem": "When the semi-digested food from the stomach enters the duodenum, secretin is released which stimulates the salt secretion of",
"opts": [
"Mucus",
"Gastric juice",
"Intestinal juice",
"Pancreatic juice"
]
},
{
"n": 6,
"stem": "Conventional gene therapy technique mostly depends on the following except",
"opts": [
"Gene augmentation therapy",
"Gene inhibition therapy",
"Killing Specific Cells",
"CRISPR"
]
},
{
"n": 7,
"stem": "A 30-year-old male patient with acute pancreatitis has been found to have a disorder of cavitary protein digestion. The reason for such condition can be the hyposynthesis and hyposecretion of the following enzyme:",
"opts": [
"Pepsin",
"Dipeptidase",
"Amylase",
"Trypsin"
]
},
{
"n": 8,
"stem": "Which statement best compares the energy transformations of photosynthesis and cellular respiration?",
"opts": [
"Only photosynthesis uses oxygen to create energy",
"Only photosynthesis causes an increase in kinetic energy",
"Photosynthesis and cellular respiration both require chemical energy to make food",
"Photosynthesis and cellular respiration both store energy in chemical bonds"
]
},
{
"n": 9,
"stem": "Which of the following statements about the endosperm is INCORRECT?",
"opts": [
"It is a nutritive tissue for the developing embryo",
"It is typically triploid in angiosperms",
"It develops from the fusion of a sperm with two polar nuclei",
"It is present in all seeds"
]
},
{
"n": 10,
"stem": "What constituent of the neuron is responsible for briefly increasing the Na+ permeability of the membrane during the rising phase of the nerve impulse?",
"opts": [
"The sodium-potassium pump",
"The delayed rectifier potassium channel",
"The voltage-gated sodium channel",
"The omniscient consciousness of the neuron"
]
},
{
"n": 11,
"stem": "Which characteristic is shared by both RNA polymerase and DNA pol III in E. coli?",
"opts": [
"Both function as holoenzymes that have polymerase and helicase activities",
"Both use promoters to locate and bind to the starting point of genes",
"Both produce nucleic acid molecules that become permanent cellular components",
"Both use templates to synthesize an anti-parallel, complementary nucleic acid chain"
]
},
{
"n": 12,
"stem": "Pema suffers from haemophilia, a condition that prevents blood clotting. If you were a doctor, which of the following treatments would you suggest?",
"opts": [
"Chemotherapy",
"Homeotherapy",
"Gene therapy",
"Physiotherapy"
]
},
{
"n": 13,
"stem": "All the factors listed below affect the opening and closing of stomata EXCEPT",
"opts": [
"Light",
"Water",
"Oxygen",
"Minerals"
]
},
{
"n": 14,
"stem": "An individual with low blood sodium levels might experience which of the following hormonal responses?",
"opts": [
"Increased ADH, decreased aldosterone",
"Decreased ADH, increased aldosterone",
"Increased ADH, increased aldosterone",
"Decreased ADH, decreased aldosterone"
]
},
{
"n": 15,
"stem": "Which of the following statement about parenchyma cell is INCORRECT?",
"opts": [
"They are living cells",
"They are non-living cells",
"They have thin cell wall",
"They from simple permanent tissues"
]
},
{
"n": 16,
"stem": "The vasa recta is closely associated with which part of the nephron?",
"opts": [
"Proximal convoluted tubule",
"Distal convoluted tubule",
"Loop of Henle",
"Bowman's capsule"
]
},
{
"n": 17,
"stem": "The matching pairs given below are the parts of a nephron and its functions. Which pair is INCORRECT?",
"opts": [
"Bowman’s capsule → ultrafiltration",
"Proximal convoluted tubule → releases urea",
"Loop of Henle → counter current mechanism",
"Distal convoluted tubule → reabsorption of water"
]
},
{
"n": 18,
"stem": "The enzymes involved in DNA replication are correctly matched with their functions EXCEPT",
"opts": [
"DNA polymerase-I proofreading",
"Helicase - winds DNA strands",
"Primase synthesis RNA primer",
"Ligase joins DNA strands"
]
},
{
"n": 19,
"stem": "Which of the following is an example of an autoimmune disease?",
"opts": [
"Cancer",
"Rheumatoid arthritis",
"Diabetes mellitus (Type 1)",
"Both B and C"
]
},
{
"n": 20,
"stem": "The conduction of nerve impulse through myelinated neuron is faster than non-myelinated neuron because",
"opts": [
"Nerve impulses need not travel through the entire length of axon",
"Non-myelinated neurons have less neurotransmitter",
"Myelinated neurons have less neurotransmitter",
"Node of Ranvier provides insulation"
]
},
{
"n": 21,
"stem": "A 5-year-old child has hypoplasia of primary teeth limited to the incisal or occlusal one-third. This is likely due to:",
"opts": [
"Fluoride ingestion during tooth development",
"Trauma to the primary tooth buds",
"Systemic illness during the primary tooth calcification period",
"Local infection of the primary tooth buds"
]
},
{
"n": 22,
"stem": "Plants offer a viable solution for addressing global warming. The mechanism within plants that supports this claim is the",
"opts": [
"Krebs cycle",
"Calvin cycle",
"Fruiting cycle",
"Photoperiodic cycle"
]
},
{
"n": 23,
"stem": "During inspiration, the volume of thoracic cavity increases because of",
"opts": [
"Contraction of diaphragm and external intercostal muscles",
"Relaxation of diaphragm and external intercostal muscles",
"Contraction of diaphragm and relaxation of external intercostal muscles",
"Relaxation of diaphragm and contraction of internal intercostal muscles"
]
},
{
"n": 24,
"stem": "The heart sound ‘dub’ is produced when",
"opts": [
"Tricuspid and bicuspid valve closes",
"Tricuspid and semilunar valves closes",
"Semilunar and bicuspid closes",
"Semilunar valves closes sharply"
]
},
{
"n": 25,
"stem": "Bhutan has implemented routine HPV vaccination to prevent cervical cancer. What type of immunity is developed after receiving this vaccine?",
"opts": [
"Innate immunity",
"Passive artificial immunity",
"Passive natural immunity",
"Active artificial immunity"
]
},
{
"n": 26,
"stem": "The causative agent of leptospirosis belongs to which of the following bacterial types?",
"opts": [
"Spirochete",
"Gram-positive cocci",
"Acid-fast bacilli",
"Gram- negative cocci"
]
},
{
"n": 27,
"stem": "Which of the following diseases is not typically classified as a vector-borne disease?",
"opts": [
"Yellow fever",
"Leptospirosis",
"Zika virus infection",
"Chikungunya"
]
},
{
"n": 28,
"stem": "Which of the following diseases is not classified as zoonotic?",
"opts": [
"Rabies",
"Leptospirosis",
"COVID-19",
"Tetanus"
]
},
{
"n": 29,
"stem": "In the human male reproductive system, which structure is responsible for sperm maturation and storage?",
"opts": [
"Vas deferens",
"Seminiferous tubules",
"Prostate gland",
"Epididymis"
]
},
{
"n": 30,
"stem": "Which hormone is produced in response to low blood calcium levels?",
"opts": [
"Calcitriol",
"Thyroxine",
"Parathyroid hormone (PTH)",
"Calcitonin"
]
},
{
"n": 31,
"stem": "Which of the following is NOT a component of the innate immune system?",
"opts": [
"Skin barrier",
"Macrophages",
"Antibodies",
"Natural killer cells"
]
},
{
"n": 32,
"stem": "A patient is found to have a deficiency of intrinsic factor. Which biological process will be most directly affected?",
"opts": [
"Digestion of proteins in the stomach",
"Absorption of vitamin B12 in the small intestine",
"Production of bile by the liver",
"Absorption of iron in the large intestine"
]
},
{
"n": 33,
"stem": "A well stoppered thermos flask contains some ice cubes. This is an example of",
"opts": [
"Closed system",
"Open system",
"Isolated system",
"Non thermodynamics system"
]
},
{
"n": 34,
"stem": "According to Lewis concept, an acid is:",
"opts": [
"Proton donor",
"Electron pair donor",
"Electron pair acceptor",
"Proton acceptor"
]
},
{
"n": 35,
"stem": "The most electronegative element in the periodic table is________",
"opts": [
"Nitrogen",
"Oxygen",
"Chlorine",
"Fluorine"
]
},
{
"n": 36,
"stem": "Isotopes of an element have______",
"opts": [
"Different chemical and physical properties",
"Similar chemical and physical properties",
"Similar chemical but different physical properties",
"Similar physical but different chemical properties"
]
},
{
"n": 37,
"stem": "A fundamental concept in physics often described as measure of disorders, randomness, or uncertainty within a system is termed as",
"opts": [
"Entropy",
"Heat",
"Work",
"None of the mentioned"
]
},
{
"n": 38,
"stem": "What are the transition elements characteristics?",
"opts": [
"Metallic",
"Non-metallic",
"Metalloid",
"Varies from element to element"
]
},
{
"n": 39,
"stem": "What is the oxidation state of manganese in KMnO4?",
"opts": [
"+2",
"+5",
"+7",
"-1"
]
},
{
"n": 40,
"stem": "Which of the following statements are correct for depression in freezing point? I. The solution has a lower vapor pressure than pure solvent. II. The solution has a higher vapor pressure than pure solvent. III. At the freezing point, only solvent molecules solidify. IV. At the freezing point, only solute molecules solidify.",
"opts": [
"I and II",
"I and III",
"I and IV",
"II and III"
]
},
{
"n": 41,
"stem": "Which of the following salt has highest pH?",
"opts": [
"CH3COOK",
"Na2CO3",
"NH4Cl",
"NaNO3"
]
},
{
"n": 42,
"stem": "Waxes are esters of",
"opts": [
"Glycerol and fatty acid",
"Long chain alcohols and long chain fatty acids",
"Glycerol",
"Long chain of alcohols"
]
},
{
"n": 43,
"stem": "When silver nitrate solution is stored in copper vessel, silver gets precipitated out because:",
"opts": [
"Both silver and copper have positive reduction potential.",
"Reduction potential of silver is higher than that of copper",
"Reduction potential of copper is higher than that of silver",
"Both silver and copper has negative oxidation potential"
]
},
{
"n": 44,
"stem": "What is the unit of molality?",
"opts": [
"mol/L",
"mol/kg",
"g/L",
"kg/mol"
]
},
{
"n": 45,
"stem": "When acetamide is treated with an alkali and bromine, the product obtained is",
"opts": [
"Primary amine",
"Secondary amine",
"Tertiary amine",
"Quaternary ammonium salt"
]
},
{
"n": 46,
"stem": "The conductivity of electrolytic conductors is due to ________",
"opts": [
"Flow of free mobile electrons",
"Movement of ions",
"Either movement of electrons or ions",
"None of the above"
]
},
{
"n": 47,
"stem": "The rate constant of a reaction depends upon",
"opts": [
"Temperature",
"Initial concentration of the reactants",
"Time of reaction",
"Extent of reaction"
]
},
{
"n": 48,
"stem": "The IUPAC name of the complex [Co (NH3)4 Cl2] Cl is",
"opts": [
"dichlorotetraamminecobalt (III) chloride",
"tetraamminedichlorocobalt (III) chloride",
"tetraamminedichlorocobalt (II) chloride",
"tetraamminedichlorocobalt (IV) chloride"
]
},
{
"n": 49,
"stem": "The reaction of vegetables oils or fats with methanol in the presence of NaOH is called:",
"opts": [
"Cannizaro reaction",
"Aldol condensation",
"Esterification",
"Transesterification"
]
},
{
"n": 50,
"stem": "Identify the correct order of boiling points of the following compounds: CH3CH2CH2OH (1), CH3CH2CH2CHO (2), CH3CH2CH2COOH (3)",
"opts": [
"1 > 2 > 3",
"3 > 1 > 2",
"1 > 3 >2",
"3 > 2 > 1"
]
},
{
"n": 51,
"stem": "An acid reacts with an alcohol to form ester in the presence of concentrated acid;the esterification reaction is fastest in:",
"opts": [
"CH3COOH",
"HCOOH",
"C2H5COOH",
"(CH3)2CHCOOH"
]
},
{
"n": 52,
"stem": "The following reaction is called",
"opts": [
"Hydrolysis",
"Transesterification",
"Saponification",
"Esterification"
]
},
{
"n": 53,
"stem": "Which one of the following compounds is the most basic?",
"opts": [
"CH3NH2",
"(C2H5)2NH",
"(CH3)3N",
"C6H5NH2"
]
},
{
"n": 54,
"stem": "Radioactive iodine is used to diagnose the disease of",
"opts": [
"pituitary",
"kidney",
"thyroid",
"bones"
]
},
{
"n": 55,
"stem": "In an isochoric process, the increase in internal energy is:",
"opts": [
"equals to the heat absorbed",
"equals to the heat evolved",
"equals to work done",
"equals to the sum of the heat absorbed and work done"
]
},
{
"n": 56,
"stem": "When a copper wire is dipped into silver nitrate solution, silver is precipitated because",
"opts": [
"both silver and copper have positive reduction potentials",
"reduction potential of silver is higher than that of copper",
"reduction potential of copper is higher than that of silver",
"both silver and copper have negative reduction potentials"
]
},
{
"n": 57,
"stem": "Most of the energy from the sun is emitted as",
"opts": [
"Visible wavelength",
"Infrared wavelength",
"EUV wavelength",
"UV wavelength"
]
},
{
"n": 58,
"stem": "The SI unit of resistivity is __________.",
"opts": [
"Ohm",
"Joule",
"Ohm- meter",
"Ohm-1 m-1"
]
},
{
"n": 59,
"stem": "Oil spreads over the surface of water whereas water does not spread over the surface of the oil because",
"opts": [
"Surface tension of oil is higher than that of water",
"Surface tension of water is higher than that of oil",
"They have almost equal surface tension",
"Surface tension of water is very low."
]
},
{
"n": 60,
"stem": "One end of a towel dips into a bucket full of water and the other end hangs over the bucket. After sometime the towel becomes fully wet. It happens because of",
"opts": [
"Viscosity of water is high",
"Capillary action of cotton threads",
"Gravitational force",
"Evaporation of water"
]
},
{
"n": 61,
"stem": "A light bulb is connected to a 12V battery and draws a current of 2 A. What is the power dissipated by the bulb?",
"opts": [
"6 Watts",
"12 Watts",
"24 Watts",
"1/6 Watts"
]
},
{
"n": 62,
"stem": "Which of the following waves have a maximum frequency?",
"opts": [
"infrared waves",
"gamma rays",
"microwaves",
"radio waves"
]
},
{
"n": 63,
"stem": "Karma met with an Ophthalmologist and was asked to wear spectacles to enable him to see clearly up to 90 meters. Which of the following lenses would best suit his eyesight?",
"opts": [
"convex",
"concave",
"plano-convex",
"convexo concave"
]
},
{
"n": 64,
"stem": "A gas behaves as an ideal gas at",
"opts": [
"low pressure and high temperature",
"low pressure and low temperature",
"high pressure and low temperature",
"high pressure and high temperature"
]
},
{
"n": 65,
"stem": "Jigme took two identical metallic spheres of exactly equal masses. One is given a positive charge and the other an equal negative charge through friction. What are their masses after charging?",
"opts": [
"The masses of the positively and the negatively charged spheres are equal",
"The masses of the positively and the negatively charged spheres remain the same",
"The mass of the negatively charged sphere is more than the positively charged sphere",
"The mass of the positively charged sphere is more than the negatively charged sphere"
]
},
{
"n": 66,
"stem": "Which one of the following statements accurately describes the significance of the nanotechnology in medicine and healthcare?",
"opts": [
"It has completely eliminated the need for surgeries and medications",
"It has minimal impact in the field of medicine and healthcare",
"It focuses on the development of nanoscale devices in the field of telecommunication",
"It enables the precise drug delivery to specific cells or tissues, improving effectiveness of the treatment"
]
},
{
"n": 67,
"stem": "The direction of induced current is given by:",
"opts": [
"Fleming’s left-hand rule",
"Right-hand thumb rule",
"Lenz’s Law",
"Faraday’s Law"
]
},
{
"n": 68,
"stem": "Dawa bought a makeup mirror. Which of the following characteristics of an image should be considered to buy such a mirror?",
"opts": [
"upright and enlarged image",
"inverted and enlarged image",
"upright and diminished image",
"inverted and diminished image"
]
},
{
"n": 69,
"stem": "Which of the following is an example of a transverse wave?",
"opts": [
"Sound wave",
"Light wave",
"Water wave",
"Both b and c"
]
},
{
"n": 70,
"stem": "Electric field inside a hollow conductor is:",
"opts": [
"Maximum at center",
"Zero",
"Uniform non-zero",
"Inversely proportional to radius"
]
}
]"""

KEY = {
 1: ("c", "Wings of insects, birds, bats and pterosaurs do the same job but have different origins: analogous organs."),
 3: ("d", "Secretory proteins: rough ER -> transport vesicle -> Golgi -> secretory vesicle -> plasma membrane."),
 4: ("a", "Arrangement of vascular bundles (ring in dicots, scattered in monocots) identifies the stem."),
 5: ("d", "Secretin stimulates bicarbonate-rich pancreatic juice."),
 6: ("d", "CRISPR is a newer gene-editing method, not a conventional gene therapy technique."),
 7: ("d", "Trypsin from the pancreas digests proteins in the intestinal lumen."),
 8: ("d", "Photosynthesis stores energy in glucose; respiration stores it in ATP bonds."),
 9: ("d", "Not all seeds have endosperm at maturity (e.g. pea, bean are non-endospermic)."),
 10: ("c", "Voltage-gated sodium channels open during depolarisation."),
 11: ("d", "Both read a template and build an antiparallel complementary strand."),
 12: ("c", "Haemophilia is a single-gene disorder, a candidate for gene therapy (factor replacement is routine care)."),
 13: ("c", "Light, water and K+ (minerals) control stomata; oxygen does not."),
 14: ("b", "Low sodium raises aldosterone (to retain Na+) and lowers ADH (to excrete water)."),
 15: ("b", "Parenchyma cells are living."),
 16: ("c", "Vasa recta run alongside the loop of Henle (countercurrent exchange)."),
 17: ("b", "The PCT reabsorbs most substances; it does not 'release urea' as its function."),
 18: ("b", "Helicase unwinds, not winds, DNA."),
 19: ("d", "Rheumatoid arthritis and type 1 diabetes are autoimmune."),
 20: ("a", "Impulses jump from node to node (saltatory conduction)."),
 22: ("b", "The Calvin cycle fixes atmospheric CO2."),
 23: ("a", "Diaphragm and external intercostals contract during inspiration."),
 24: ("d", "'Dub' is the closure of the semilunar valves."),
 25: ("d", "Vaccination gives active artificial immunity."),
 26: ("a", "Leptospira is a spirochete."),
 27: ("b", "Leptospirosis spreads through water or soil contaminated with animal urine, not by vectors."),
 28: ("d", "Tetanus comes from soil spores; it is not passed from animals."),
 29: ("d", "Sperms mature and are stored in the epididymis."),
 30: ("c", "Parathyroid hormone raises low blood calcium."),
 31: ("c", "Antibodies belong to adaptive immunity."),
 32: ("b", "Intrinsic factor is needed to absorb vitamin B12 in the ileum."),
 33: ("c", "A well-stoppered thermos flask exchanges neither matter nor (ideally) energy: isolated system."),
 34: ("c", "Lewis acid: electron-pair acceptor."),
 35: ("d", "Fluorine is the most electronegative element."),
 36: ("c", "Same electron configuration, different masses."),
 37: ("a", "Entropy measures disorder."),
 38: ("a", "Transition elements are all metals."),
 39: ("c", "K(+1) + Mn + 4(-2) = 0, so Mn = +7."),
 40: ("b", "The solution has a lower vapour pressure, and only the solvent freezes out."),
 41: ("b", "Na2CO3 is a salt of a strong base and weak acid with strong hydrolysis: highest pH."),
 42: ("b", "Waxes are esters of long-chain alcohols with long-chain fatty acids."),
 43: ("b", "Ag+ has a higher reduction potential, so Cu displaces Ag."),
 44: ("b", "Molality is mol per kg of solvent."),
 45: ("a", "Hofmann bromamide degradation gives a primary amine."),
 46: ("b", "Electrolytes conduct by movement of ions."),
 47: ("a", "The rate constant depends on temperature (Arrhenius)."),
 48: ("b", "Ligands in alphabetical order (ammine before chloro); Co is +3."),
 49: ("d", "Oil + methanol with NaOH gives biodiesel by transesterification."),
 50: ("b", "Carboxylic acid > alcohol > aldehyde (hydrogen bonding)."),
 51: ("b", "Formic acid has least steric hindrance, so it esterifies fastest."),
 53: ("b", "Secondary aliphatic amines are the most basic in water; aniline is weakest."),
 54: ("c", "Radioactive iodine is taken up by the thyroid."),
 55: ("a", "Isochoric: W = 0, so dU = q (heat absorbed)."),
 56: ("b", "Silver's higher reduction potential lets copper reduce Ag+."),
 58: ("c", "Resistivity is measured in ohm-metre."),
 59: ("b", "Water's higher surface tension pulls the oil into a film over it."),
 60: ("b", "Water rises along cotton fibres by capillarity."),
 61: ("c", "P = VI = 12 x 2 = 24 W."),
 62: ("b", "Gamma rays have the highest frequency."),
 63: ("b", "Unable to see far objects clearly (myopia): concave lens."),
 64: ("a", "Real gases are ideal at low pressure and high temperature."),
 65: ("c", "The negative sphere gained electrons, so it is very slightly heavier."),
 66: ("d", "Nanotechnology enables targeted drug delivery."),
 67: ("c", "Lenz's law gives the direction of induced current."),
 68: ("a", "A concave make-up mirror gives an upright, enlarged image."),
 69: ("d", "Light waves are transverse; surface water waves are treated as transverse in the syllabus."),
 70: ("b", "Charges stay on the outer surface; field inside is zero."),
}

NEW_MCQ = [
 ("Bile helps the digestion of fats by", ("hydrolysing fats into fatty acids", "emulsifying fats into small droplets", "converting fats into glycerol", "absorbing fats into blood directly"), "b", "Bile salts emulsify fats; they contain no enzyme."),
 ("Mottled enamel (dental fluorosis) is caused by excess intake of", ("calcium", "iodine", "fluoride", "iron"), "c", "Excess fluoride during tooth development causes fluorosis."),
 ("Saponification is the hydrolysis of fats with", ("an acid", "an alkali (NaOH/KOH)", "an alcohol", "water only"), "b", "Fats + NaOH give soap and glycerol."),
 ("The ozone layer protects living things mainly from the Sun's", ("infrared radiation", "ultraviolet radiation", "visible light", "radio waves"), "b", "Ozone absorbs harmful UV radiation."),
]

SAQ = [
 dict(marks=3, stem="""Laya, a place which is located over 3,800 metres above sea level, is known for its thin air and harsh climate. A health assistant posted there observes that new staff often develop breathlessness, headache, and fatigue within the first few days of arrival. However, local residents (Layaps) seem unaffected and carry out physically demanding tasks with ease.
(a) What is the cause of high-altitude sickness? Describe two immediate physiological responses to this condition.
(b) Mention one chemical adaptation that helps the body adjust to high altitude over time, and explain how it improves oxygen delivery. (3 marks)""",
      kp=[("Cause: low atmospheric (partial) pressure of oxygen, so less O2 in blood (hypoxia)", 1), ("Two immediate responses: faster/deeper breathing (hyperventilation) and increased heart rate / cardiac output", 1), ("Adaptation: more erythropoietin -> more RBCs and haemoglobin, or more 2,3-BPG, so blood carries/unloads more O2 to tissues", 1)],
      model="(a) At high altitude the air pressure, and so the partial pressure of oxygen, is low, so less oxygen enters the blood (hypoxia), causing altitude sickness. Immediate responses: breathing becomes faster and deeper (hyperventilation) to take in more oxygen, and the heart rate and cardiac output rise to circulate blood faster. (b) Over days and weeks the kidneys release more erythropoietin, which increases red blood cells and haemoglobin, so each litre of blood carries more oxygen. Red cells also make more 2,3-bisphosphoglycerate (2,3-BPG), which helps haemoglobin release oxygen to the tissues."),
 dict(marks=3, stem="""In July 2025, the Ministry of Health of Bhutan confirmed a cluster of acute respiratory distress syndrome (ARDS) cases among the 69th batch of Desuup trainees in Dewathang. Laboratory tests and epidemiological investigations identified leptospirosis as the cause. Tragically, 3 Desuups died from the infection.
(a) Describe the causative agent of leptospirosis and explain how it is commonly transmitted to humans.
(b) As a healthcare professional, list five preventive measures you would implement to control the spread of leptospirosis in the community. (3 marks)""",
      kp=[("Agent: Leptospira (interrogans), a spiral, motile spirochete bacterium", 0.5), ("Transmission: contact of skin cuts/mucous membranes with water, soil or mud contaminated by urine of infected rats, cattle, dogs; not person to person", 1), ("Five preventive measures (e.g. rodent control, avoid wading in floodwater, protective boots and gloves, safe water, vaccinate animals, awareness, early treatment / doxycycline prophylaxis for high-risk groups)", 1.5)],
      model="(a) Leptospirosis is caused by Leptospira interrogans, a thin, coiled, motile spirochete bacterium. Infected animals, especially rats, cattle, pigs and dogs, pass it in their urine; humans are infected when water, mud or soil contaminated with this urine comes into contact with cuts, abrasions or mucous membranes (eyes, mouth), for example while training, farming or wading through floodwater. (b) Preventive measures: control rodents around camps and homes; avoid swimming or wading in stagnant or flood water; wear boots, gloves and protective clothing; provide safe drinking water and proper sanitation; vaccinate livestock and dogs; educate people on early symptoms and seek early treatment; give doxycycline prophylaxis to high-risk groups such as trainees during exposure."),
 dict(marks=3, stem="""Mr. Dophu, a 47-year-old man, has been experiencing difficulty seeing nearby objects clearly, while distant objects appear normal. After a vision test, he is diagnosed with presbyopia, a common age-related condition.
(a) What type of lens would be recommended to correct Mr. Dophu's vision problem?
(b) Explain the principle behind how this lens helps improve near vision. Support your explanation with a ray diagram (describe it). (3 marks)""",
      kp=[("A convex (converging) lens / reading glasses (or bifocals)", 1), ("With age the eye lens loses flexibility; near point recedes; light from near objects focuses behind the retina", 1), ("Convex lens converges rays before they enter the eye, forming a virtual image at the eye's near point so the image falls on the retina (diagram: rays from a near object bent inward by the lens, meeting on the retina)", 1)],
      model="(a) A convex (converging) lens, as reading glasses or the lower part of bifocals. (b) In presbyopia the eye lens becomes less elastic and the ciliary muscles weaken, so the eye cannot increase its power to focus near objects; the near point moves farther away and light from a nearby object would focus behind the retina. A convex lens adds converging power: it bends the rays inward before they enter the eye, producing a virtual image of the object at the man's own near point, so the eye can focus it sharply on the retina. Ray diagram: an object at 25 cm, rays passing through the convex lens and converging so that they meet on the retina instead of behind it."),
 dict(marks=3, stem="Define buffer system and explain its importance in maintaining blood pH. (3 marks)",
      kp=[("Buffer: a solution of a weak acid and its salt (conjugate base) that resists change in pH when small amounts of acid or base are added", 1), ("Main blood buffer: carbonic acid-bicarbonate (also phosphate, proteins/haemoglobin); H+ + HCO3- <-> H2CO3 <-> CO2 + H2O", 1), ("Keeps blood pH 7.35-7.45; prevents acidosis/alkalosis, protects enzyme function; works with lungs and kidneys", 1)],
      model="A buffer system is a solution of a weak acid and its conjugate base (or a weak base and its conjugate acid) that resists a change in pH when small amounts of acid or alkali are added. In blood, the main buffer is carbonic acid-bicarbonate: extra H+ combines with HCO3- to form H2CO3, which breaks into CO2 (exhaled by the lungs) and water; extra OH- is neutralised by H2CO3. Phosphate and protein buffers (including haemoglobin) also help. These buffers keep blood pH within the narrow range 7.35-7.45, preventing acidosis or alkalosis, which would disturb enzymes, nerve function and oxygen transport."),
 dict(marks=3, stem="Explain the principle of blood pressure measurement using a sphygmomanometer. (3 marks)",
      kp=[("Cuff inflated around upper arm above systolic pressure, occluding the brachial artery (no flow, no sound)", 1), ("Pressure slowly released; first Korotkoff sound (turbulent flow) = systolic pressure", 1), ("Sounds disappear when flow becomes smooth/continuous = diastolic pressure; read on mercury/aneroid gauge in mmHg (normal about 120/80)", 1)],
      model="A sphygmomanometer measures blood pressure indirectly. An inflatable cuff around the upper arm is pumped above systolic pressure so the brachial artery is compressed and blood flow stops. A stethoscope is placed over the artery below the cuff and the pressure is slowly released. When cuff pressure falls just below systolic pressure, blood spurts through and turbulent flow produces tapping (Korotkoff) sounds: the reading at the first sound is the systolic pressure. As the pressure falls further, the sounds disappear when flow becomes smooth and continuous: this reading is the diastolic pressure. Values are read in mmHg (normal about 120/80)."),
 dict(marks=3, stem="State Newton's laws of motion and give one example of each law on how they are applied by health care professionals while providing care to patients. (3 marks)",
      kp=[("First law (inertia) with a care example, e.g. securing a patient on a moving stretcher / wheelchair brakes", 1), ("Second law F = ma with an example, e.g. more force needed to move a heavier patient; pushing a trolley", 1), ("Third law action-reaction with an example, e.g. pushing against the bed to reposition a patient; crutch walking", 1)],
      model="First law (inertia): a body stays at rest or in uniform motion unless acted on by an external force. Example: a patient on a moving stretcher keeps moving when it stops suddenly, so stretchers are moved smoothly and patients are secured with straps; wheelchair brakes are applied before transfers. Second law: force = mass x acceleration. Example: a heavier patient needs more force (or more staff, a hoist) to move or accelerate, so nurses use proper body mechanics. Third law: every action has an equal and opposite reaction. Example: when a patient pushes down on crutches or the bed rails, the reaction force lifts and supports the body; nurses push against the floor with their feet to move a patient up the bed."),
 dict(marks=3, stem="Describe the changes that occur in the uterine lining throughout the menstrual cycle. (3 marks)",
      kp=[("Menstrual phase (days 1-5): fall in progesterone and oestrogen; functional endometrium breaks down and is shed with blood", 1), ("Proliferative phase (days 6-14): oestrogen from growing follicle rebuilds and thickens endometrium; glands and blood vessels grow", 1), ("Secretory phase (days 15-28): progesterone from corpus luteum makes lining thicker, more vascular and glandular, ready for implantation; if no pregnancy, corpus luteum degenerates", 1)],
      model="Menstrual phase (about days 1-5): when progesterone and oestrogen fall, the functional layer of the endometrium breaks down and is shed with blood as menstruation. Proliferative (follicular) phase (about days 6-14): oestrogen from the developing follicle stimulates the endometrium to regenerate and thicken, with growth of glands and spiral arteries. Secretory (luteal) phase (about days 15-28): after ovulation, progesterone from the corpus luteum makes the lining thicker, richly supplied with blood and secreting nutrients, ready for implantation. If no fertilisation occurs, the corpus luteum degenerates, hormone levels drop and the cycle restarts with menstruation."),
 dict(marks=3, image="/papers/me/tech2-medsci-2025-female-reproductive.png", stem="Name the parts labelled 1-7 of the female reproductive system (see the diagram) and state one function of each part. (No need to draw the diagram.) (3 marks)",
      kp=[("1 Vagina - birth canal, receives sperm; 2 Cervix - opening of uterus, mucus, dilates in birth", 1), ("3 Uterus cavity / endometrium - implantation and nourishment of embryo; 4 Ovary - produces ova and oestrogen/progesterone", 1), ("5 Fimbriae - sweep ovum into oviduct; 6 Fallopian tube (oviduct) - site of fertilisation, carries ovum; 7 Fundus / body of uterus (myometrium) - contractions in labour", 1)],
      model="1 Vagina: receives sperm and is the birth canal. 2 Cervix: neck of the uterus; produces mucus and dilates during childbirth. 3 Uterine cavity / endometrium: where the embryo implants and is nourished. 4 Ovary: produces ova and the hormones oestrogen and progesterone. 5 Fimbriae: finger-like projections that sweep the released ovum into the oviduct. 6 Fallopian tube (oviduct): carries the ovum to the uterus; usual site of fertilisation. 7 Fundus (body) of the uterus with myometrium: its muscle contracts to expel the baby during labour.",
      issues=["Labels read from the paper's diagram: please confirm 3 (uterine cavity) and 7 (fundus)."]),
 dict(marks=3, stem="""You are working in the surgical ward and have just assisted in a minor surgical procedure (wound debridement). Following the procedure, several types of waste have been generated and you are responsible for segregating them:
- Blood-stained gauze and cotton
- Used gloves and surgical mask
- Used syringe with needle
- Empty plastic IV fluid bottle
- Broken glass ampoule of medication
- Used scalpel blade
- Leftover food and a tissue paper from the patient's bedside
Identify the type of biomedical waste that each represents and state the appropriate colour-coded bin for each, according to biomedical waste management guidelines. (3 marks)""",
      kp=[("Blood-stained gauze/cotton: infectious (soiled) waste - yellow bin", 0.5), ("Gloves and mask: contaminated recyclable plastic (or infectious) - red bin (per national guideline)", 0.5), ("Syringe with needle and scalpel blade: sharps - white/blue puncture-proof sharps container", 0.5), ("Empty IV bottle: non-infectious plastic / recyclable - red (or general recyclable)", 0.5), ("Broken glass ampoule: glassware - blue (puncture-proof) container", 0.5), ("Food and tissue: general (non-hazardous) waste - black/green bin", 0.5)],
      model="Blood-stained gauze and cotton: infectious soiled waste - yellow bin. Used gloves and surgical mask: contaminated plastic waste - red bin. Syringe with needle and used scalpel blade: sharps - white (translucent) puncture-proof sharps container (needles not recapped). Empty plastic IV bottle: recyclable plastic waste - red bin. Broken glass ampoule: glassware - blue puncture-proof box. Leftover food and tissue paper: general, non-hazardous waste - black (or green for biodegradable) bin.",
      issues=["Colour codes follow the common WHO / India-Bhutan scheme; check against the current Bhutan health-care waste guideline."]),
 dict(marks=3, image="/papers/me/tech2-medsci-2025-brain.png", stem="From the diagram, write down the names of the parts of the human brain numbered 1-6 (diagram need not be drawn) and state one function of each part. (3 marks)",
      kp=[("1 Frontal lobe - reasoning, planning, voluntary movement, speech (Broca)", 0.5), ("2 Temporal lobe - hearing, memory, language comprehension", 0.5), ("3 Brain stem / medulla oblongata - breathing, heart rate, reflexes", 0.5), ("4 Cerebellum - balance, posture, coordination", 0.5), ("5 Occipital lobe - vision", 0.5), ("6 Parietal lobe - touch, pain, temperature sensation, spatial awareness", 0.5)],
      model="1 Frontal lobe: thinking, planning, decision-making, voluntary movement and speech. 2 Temporal lobe: hearing, memory and understanding language. 3 Brain stem (medulla oblongata): controls breathing, heartbeat, blood pressure and reflexes such as swallowing. 4 Cerebellum: balance, posture and coordination of movements. 5 Occipital lobe: vision. 6 Parietal lobe: sensations of touch, pain and temperature, and spatial awareness."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
