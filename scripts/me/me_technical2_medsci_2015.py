"""ME Technical Paper II (General Subject Knowledge), MEDICAL SCIENCE group ('Medical Group'), BCSE 2015 (written 10 October 2015)
- real paper, PDF sent by the founder. Same layout as the latest (BCSE 2025) paper: Part I 70 MCQ x 1; Part II 10 short
answers x 3 - so no marks were changed (Part II Q7 is split 2 + 1).
Pictures (cropped from the paper): Part II Q6 enzyme graph, Q7 electrophoresis.
Repeats (recorded as appearances, not loaded again): MCQ 2, 21, 23, 26, 28, 30 (BCSE 2023), 25, 47 (2024), 29 (2022),
39 (2019), 57, 58 and 67 (BCSE 2016); Part II Q9 menstrual cycle (already on Soma).
Left out (more than one defensible answer or flawed): MCQ 12 (12 pairs or 24 nerves), 16, 31, 32, 33, 34, 35 (unequal cells in
parallel), 44, 48, 65, 66, 68. Twenty-five new MCQs keep Part I at 70.
Fixed: MCQ 18 option letters printed twice; MCQ 53-54 spellings; MCQ 56 options run together; MCQ 60 'Frucose' read as fucose.
Part II repeats (recorded as appearances, replaced by new questions of the same kind): Q1 heart diagram 1-19 (BCSE 2023),
Q2 DNA and RNA (2023), Q4 teeth (2024), Q9 menstrual cycle (2019).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Medical Science): BCSE 2015, batch 1"
GROUP_TAG = "medsci2015"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "medical-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2015 Main Examination, Technical Paper II, Medical Science", "year": 2015, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Medical Science: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Placenta and pericarp are both edible portions in:",
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
"Sweet potato",
"Potato"
]
},
{
"n": 3,
"stem": "The osmotic expansion of a cell kept in water is chiefly regulated by:",
"opts": [
"Mitochondria",
"Vacuoles",
"Plastids",
"Ribosome"
]
},
{
"n": 4,
"stem": "Choose the spore forming bacteria:",
"opts": [
"Mycobacterium tuberculosis",
"Clostridium tetani",
"Treponima palladium",
"Vibrio cholerae"
]
},
{
"n": 5,
"stem": "Which structures perform the function of mitochondria in bacteria?",
"opts": [
"Nucleoid",
"Ribosome",
"Cell wall",
"Mesosmes"
]
},
{
"n": 6,
"stem": "In which of the following the CO2 is not released:",
"opts": [
"Aerobic respiration",
"Anaerobic respiration",
"Alcoholic fermentation",
"Lactate fermentation"
]
},
{
"n": 7,
"stem": "A human female with Turner's syndrome:",
"opts": [
"has 45 chromosomes with XO",
"has one additional X chromosome",
"exhibits male characters",
"is able to produce normal children"
]
},
{
"n": 8,
"stem": "At which stage of HIV infection does one usually show symptoms of AIDS?",
"opts": [
"Within 15 days of sexual contact with infected person",
"When the infected retrovirus enters host cells",
"When the viral DNA is produced by reverse transcriptase",
"When HIV damages large numbers of helper T lymphocytes"
]
},
{
"n": 9,
"stem": "1st December is observed as:",
"opts": [
"World’s TB Day",
"World’s AIDs Day",
"International Diabetic Day",
"World’s Cancer Day"
]
},
{
"n": 10,
"stem": "Select the correct matching of the type of joint with its example in the human skeletal system:",
"opts": [
"Cartilaginous joints …………between frontal and parietal",
"Pivotal Joint…………………..between third and fourth cervical vertebrae",
"Hinge Joint……………………between humorous and pectoral girdle",
"Gliding joints…………………between carpals"
]
},
{
"n": 11,
"stem": "Which of the following causes an increase in sodium reabsorption in the distal convoluted tubules?",
"opts": [
"Increase in aldosterone levels",
"Increase in antidiuretic hormones",
"Decrease in aldosterone levels",
"Decrease in antidiuretic hormones."
]
},
{
"n": 12,
"stem": "Total number of cranial nerves in Human is:",
"opts": [
"30",
"24",
"12",
"10"
]
},
{
"n": 13,
"stem": "The target organ for vasopressin is:",
"opts": [
"Liver",
"Kidney",
"Gonads",
"Mammary glands"
]
},
{
"n": 14,
"stem": "The bone of the knee cap is:",
"opts": [
"Tibia",
"Femur",
"Fibula",
"Patella"
]
},
{
"n": 15,
"stem": "Osteoporosis is the disease of:",
"opts": [
"Muscle",
"Kidney",
"Heart",
"Bones"
]
},
{
"n": 16,
"stem": "The lobe of the brain that has function for smell is:",
"opts": [
"Temporal",
"Frontal",
"Parietal",
"Occipital"
]
},
{
"n": 17,
"stem": "The main function of the mammalian corpus luteum is to produce:",
"opts": [
"Estrogen only",
"Progesterone",
"Human chorionic gonadotropin",
"Relaxin only"
]
},
{
"n": 18,
"stem": "Choose the correctly matching pair:",
"opts": [
"Inner lining of salivary ducts - ciliated epithelium",
"Moist surface of buccal cavity - glandular epithelium",
"Tubular parts of nephrons - cuboidal epithelium",
"Inner surface of bronchioles - squamous epithelium"
]
},
{
"n": 19,
"stem": "In ‘S’ phase of the cell cycle:",
"opts": [
"Amount of DNA doubles in each cell",
"Amount of DNA remains same in each cell",
"Amount of DNA is reduced to half in each cell",
"Chromosome number is increased"
]
},
{
"n": 20,
"stem": "A man whose father was colour blind marries a woman who had a colour blind mother and normal father. What percentage of male children of this couple will be colour blind?",
"opts": [
"25%",
"0%",
"50%",
"75%"
]
},
{
"n": 21,
"stem": "How do parasympathetic neural signals affect the working of the heart?",
"opts": [
"Reduce both heart rate and cardiac output",
"Heart rate is increased without affecting the cardiac output",
"Both heart rate and cardiac output increase",
"Heart rate increases but cardiac output decreases"
]
},
{
"n": 22,
"stem": "A person with blood group AB positive is considered the universal recipient because he/she has:",
"opts": [
"both A and B antigens on the RBCs but no anti-A or anti-B antibodies in the plasma",
"both anti-A and anti-B antibodies in the plasma",
"no antigens on the RBCs and no antibodies in the plasma",
"both A and B antigens in the plasma but no antibodies"
]
},
{
"n": 23,
"stem": "Stimulation of muscle fiber by a motor neuron occurs at:",
"opts": [
"Neuromuscular junction",
"The transverse tubules",
"The myofibril",
"The sarcoplasmic reticulum"
]
},
{
"n": 24,
"stem": "Which one of the following statements about the retina is NOT correct?",
"opts": [
"Retina is the light absorbing portion of the visual photo pigments",
"In retina the rods have the photo pigment rhodopsin while cones have three different photo pigments",
"Retina is derivatives of vitamin C",
"Rhodopsin is the purplish red protein present in rods only"
]
},
{
"n": 25,
"stem": "A location with luxuriant growth of lichens on the trees indicates that the:",
"opts": [
"trees are very healthy",
"trees are heavily infested",
"location is highly polluted",
"location is clean without pollution"
]
},
{
"n": 26,
"stem": "The zone of atmosphere in which the ozone layer is present is called:",
"opts": [
"Ionosphere",
"Mesosphere",
"Stratosphere",
"Troposphere"
]
},
{
"n": 27,
"stem": "All the following category of white blood cells contains granules EXCEPT:",
"opts": [
"Neutrophils",
"Eosinophil",
"Basophils",
"Lymphocytes"
]
},
{
"n": 28,
"stem": "Total number of deciduous teeth in humans is:",
"opts": [
"32",
"20",
"26",
"14"
]
},
{
"n": 29,
"stem": "The ear ossicles of a mammal are arranged in one of the following orders starting from the tympanum in wards:",
"opts": [
"Incus, Malleus, stapes,",
"Stapes, incus, Malleus,",
"Malleus, stapes, incus,",
"Malleus, incus, stapes"
]
},
{
"n": 30,
"stem": "Which statement is correct with reference to the circulation of blood in mammal?",
"opts": [
"Venous blood is returned to the left auricle",
"Pulmonary vein caries venous blood from the right auricle to the lungs",
"Pulmonary artery returns oxygenated blood from the lungs to the left auricle",
"Left auricle receives oxygenated blood from the lungs"
]
},
{
"n": 31,
"stem": "All the following Electric devices and appliances need to convert DC to AC Except:",
"opts": [
"Laptop",
"X-Ray machine",
"Rice cooker",
"Laboratory Autoanalyzer"
]
},
{
"n": 32,
"stem": "All the following are function of an earthing in electric supply EXCEPT:",
"opts": [
"Reduce the current flowing into the devices and appliances",
"Increase the voltage of the electric supply",
"To reduce the resistance for safety of human and animal life",
"Protection of building and installation against the lightening"
]
},
{
"n": 33,
"stem": "All the following metals are used in the electric fuse to protect the devices, appliances and equipments from the overflow current EXCEPT:",
"opts": [
"Copper",
"Zinc",
"Lead",
"Silver"
]
},
{
"n": 34,
"stem": "Choose the incorrect statement of difference between tube light and incandescent bulb in voltage consumption:",
"opts": [
"Tungsten bulb consumes more current due to generation of heat.",
"Tube light requires lower voltage than incandescent lamp.",
"Tube light uses electrode to produce heat, helium gas to produce light and phosphor powder to reflect the light.",
"There is no contact between two electrodes and starter is used to complete the circuit."
]
},
{
"n": 35,
"stem": "Two cells of 2.5V and 1.5V are connected in parallel the effective results of the voltage will be:",
"opts": [
"1",
"2",
"3",
"4"
]
},
{
"n": 36,
"stem": "If a glass plate is placed between two charged bodies, the force between them will:",
"opts": [
"Increase",
"Decrease",
"Remain same",
"Be zero"
]
},
{
"n": 37,
"stem": "A bird perched on the electric transmission wire doesn’t get electrical shock because:",
"opts": [
"The avian blood is non conductor of electricity",
"Presence of insulated skin over the legs of the bird",
"Electric circuit is not completed for the flow of current through its body.",
"Feathers serve as insulation to the whole body of a bird."
]
},
{
"n": 38,
"stem": "The gaseous mixture used for laser surgery is:",
"opts": [
"CO2, Nitrogen, helium",
"Helium, Neon, argon",
"Nitrogen, O2, CO2",
"Neon, CO2, Nitrogen"
]
},
{
"n": 39,
"stem": "The electromagnetic radiation with maximum wavelength is:",
"opts": [
"Ultraviolet rays",
"X-Rays",
"Radio waves",
"Infrared"
]
},
{
"n": 40,
"stem": "Movement of colloidal substances under the influence of an electric current is known as:",
"opts": [
"Electrophoresis",
"Electro-osmosis",
"Electro dialysis",
"Brownian motion"
]
},
{
"n": 41,
"stem": "The refractive index of the glass prism depends upon:",
"opts": [
"The angle of prism",
"The angle of deviation of light ray",
"The colour of incident light",
"The intensity of incident light"
]
},
{
"n": 42,
"stem": "The energy which an electron acquires when accelerated through a potential difference of one volt is called:",
"opts": [
"One joule",
"One electron volt",
"One erg",
"One watt"
]
},
{
"n": 43,
"stem": "A photon is:",
"opts": [
"A quantum of radiation",
"A quantum of matter",
"Positively charged particles",
"Negatively charge particle"
]
},
{
"n": 44,
"stem": "When the speed of an electric fan increases, the current:",
"opts": [
"Increases",
"Decreases",
"Remain same",
"Becomes maximum when speed is maximum"
]
},
{
"n": 45,
"stem": "During the lightening, it is advised to plug off all the electronic devices because:",
"opts": [
"Electronic devices will be damaged due to increase voltage flow",
"Electronic devices will be damaged due to increase in current flow",
"Electronic devices will have current on their surface",
"electronic devices will be heated up"
]
},
{
"n": 46,
"stem": "2.5 liters of a sodium chloride (NaCl) solution contains 5 moles of solute. What is its molarity?",
"opts": [
"5 molar",
"2 molar",
"2.5 Molar",
"12.5 Molar"
]
},
{
"n": 47,
"stem": "Which of these functions is the least important for proteins?",
"opts": [
"Become blood osmotic proteins",
"Convert to enzymes",
"Utilization for energy",
"Component of structures"
]
},
{
"n": 48,
"stem": "Choose the incorrect statement about the bilirubin:",
"opts": [
"It is a yellow pigment produced by liver",
"It is increased in patients with liver diseases",
"It is undergoes photolysis when exposed to the light",
"It is released by the breakdown of WBCs."
]
},
{
"n": 49,
"stem": "A polysaccharide which is often called animal starch is:",
"opts": [
"Glycogen",
"Starch",
"Inulin",
"Dextrin"
]
},
{
"n": 50,
"stem": "The polysaccharide used in assessing the Glomerular filtration rate (GFR) is:",
"opts": [
"Glycogen",
"Agar",
"Inulin",
"Hyaluronic acid"
]
},
{
"n": 51,
"stem": "The polysaccharide found in the exoskeleton of invertebrates is:",
"opts": [
"Pectin",
"Chitin",
"Cellulose",
"Chondroitin sulphate"
]
},
{
"n": 52,
"stem": "Keratan sulphate is found in abundance in:",
"opts": [
"Heart muscle",
"Liver",
"Adrenal cortex",
"Cornea"
]
},
{
"n": 53,
"stem": "The scientific name of the common roundworm is:",
"opts": [
"Wuchereria bancrofti",
"Ascaris lumbricoides",
"Ancylostoma duodenale",
"Trichuris trichiura"
]
},
{
"n": 54,
"stem": "Pork tapeworm infection is caused by:",
"opts": [
"Ascaris lumbricoides",
"Ancylostoma duodenale",
"Taenia saginata",
"Taenia solium"
]
},
{
"n": 55,
"stem": "Phosphate is important for which of the following?",
"opts": [
"Bone matrix",
"ATP and energy reactions",
"DNA and RNA",
"All of these"
]
},
{
"n": 56,
"stem": "Which ion is most important in oxygen transport?",
"opts": [
"Iron (Fe²⁺)",
"Magnesium (Mg²⁺)",
"Chloride (Cl⁻)",
"Iodine"
]
},
{
"n": 57,
"stem": "Which of the following is not utilized for energy?",
"opts": [
"Glucose",
"Glycogen",
"Ribose",
"Galactose"
]
},
{
"n": 58,
"stem": "Which tissue cannot store glycogen or lipids for energy?",
"opts": [
"Nervous",
"Skeletal muscle",
"Liver",
"Cardiac muscle"
]
},
{
"n": 59,
"stem": "Compounds having the same structural formula but differing in spatial configuration are known as:",
"opts": [
"Stereoisomers",
"Anomers",
"Optical isomers",
"Epimer"
]
},
{
"n": 60,
"stem": "The carbohydrate characteristic of the ABO blood group substances (H antigen) is:",
"opts": [
"Sucrose",
"Fucose",
"Arabinose",
"Maltose"
]
},
{
"n": 61,
"stem": "The sugar found in DNA is",
"opts": [
"Xylose",
"Ribose",
"Deoxyribose",
"Ribulose"
]
},
{
"n": 62,
"stem": "The sugar found in milk is:",
"opts": [
"Galactose",
"Glucose",
"Fructose",
"Lactose"
]
},
{
"n": 63,
"stem": "All the following are the disease of hypothyroidism due to insufficient production of thyroid hormones, T3 and T4 EXCEPT:",
"opts": [
"Myxedema",
"Cretinism",
"Goiter",
"Grave’s disease"
]
},
{
"n": 64,
"stem": "The addition of solid NaCl to a pure water causes:",
"opts": [
"Decrease in pH",
"Increase in pH",
"No change in pH",
"Complete dissociation of NaCl"
]
},
{
"n": 65,
"stem": "The Choose the most effective disinfectants for use as decontaminating agent:",
"opts": [
"Detol",
"Savlon",
"Bleaching poweder",
"70% alcohol"
]
},
{
"n": 66,
"stem": "Choose the correct colour code in sequence of the category of medical wastes for segregation:",
"opts": [
"Infectious-non Infectious-Sharps Green-Red-Yellow",
"Sharps-infectious-non infectious Red-Green-Yellow",
"Sharps-infectious-non infectious Red-Green-Yellow",
"Non Infectious-Infectious-Sharps Green-Red-Yellow"
]
},
{
"n": 67,
"stem": "Chili is popularly eaten by Bhutanese in different form of dishes despite being too hot. The chemical responsible for the hotness of chilli is:",
"opts": [
"Formic acid",
"Citric acid",
"Abscisic Acid.",
"Capsaicin"
]
},
{
"n": 68,
"stem": "When two palms are rubbed together for a while, a heat is generated:",
"opts": [
"Due to the collision of electrons and protons on the palms",
"Due to the radiation of energy by the moving electrons",
"Due to the radiation of energy by the moving protons",
"Due to the collision of electrons"
]
},
{
"n": 69,
"stem": "Place a dried grape for a period of one hour in a container containing tape water. What would your observation be:",
"opts": [
"There won’t’ be any change to the dried grape",
"Grape increases the size because water enters the grape by osmosis",
"Grape shrinks because of the exosmosis of water from the grape",
"Grape shrinks because of endosmosis"
]
},
{
"n": 70,
"stem": "What does an object have when moving, that it never has when at rest?",
"opts": [
"Momentum",
"Mass",
"Energy",
"Inertia"
]
}
]"""

KEY = {
 1: ("c", "In a tomato (a berry) both the fleshy pericarp and the placenta that bears the seeds are eaten."),
 3: ("b", "The large central vacuole takes up water by osmosis and controls the cell's turgor (expansion)."),
 4: ("b", "Clostridium tetani forms resistant terminal spores ('drumstick' shape); the others do not form spores."),
 5: ("d", "Mesosomes (infoldings of the bacterial cell membrane) were thought to carry out respiration, the job of mitochondria in eukaryotes."),
 6: ("d", "Lactate (lactic acid) fermentation, as in muscle, converts pyruvate to lactate without releasing CO₂; the others release CO₂."),
 7: ("a", "Turner's syndrome is 45,XO - one X chromosome missing; affected women are usually infertile."),
 8: ("d", "AIDS develops when HIV has destroyed large numbers of CD4 helper T lymphocytes, weakening immunity."),
 9: ("b", "1 December is World AIDS Day."),
 10: ("d", "The joints between carpal bones are gliding (plane) joints. The skull sutures are fibrous, the atlas-axis joint is pivotal and the shoulder is a ball-and-socket joint."),
 11: ("a", "Aldosterone from the adrenal cortex increases sodium reabsorption in the distal tubule and collecting duct."),
 13: ("b", "Vasopressin (ADH) acts on the kidney collecting ducts to increase water reabsorption."),
 14: ("d", "The knee cap is the patella."),
 15: ("d", "Osteoporosis is thinning and weakening of bones, common in older women."),
 17: ("b", "The corpus luteum secretes mainly progesterone (with some oestrogen) to maintain the uterine lining."),
 18: ("c", "Kidney tubules are lined by cuboidal epithelium. The buccal cavity has stratified squamous, bronchioles ciliated columnar/cuboidal and salivary ducts cuboidal/columnar epithelium."),
 19: ("a", "In the S (synthesis) phase DNA is replicated, so its amount doubles; the chromosome number stays the same."),
 20: ("c", "The man's X comes from his mother, so he is normal. The woman's colour-blind mother gave her one affected X, so she is a carrier: half her sons will be colour blind (50%)."),
 22: ("a", "AB red cells carry both A and B antigens, so the plasma has no anti-A or anti-B antibodies and can receive red cells of any ABO group."),
 24: ("c", "The visual pigment comes from vitamin A (retinal), not vitamin C."),
 27: ("d", "Lymphocytes (and monocytes) are agranulocytes; neutrophils, eosinophils and basophils are granulocytes."),
 36: ("b", "Glass is a dielectric; it reduces the force between the charges by its dielectric constant (relative permittivity)."),
 37: ("c", "The bird touches only one wire, so there is no potential difference across its body and no complete circuit for current to flow."),
 38: ("a", "The surgical CO₂ laser uses a mixture of carbon dioxide, nitrogen and helium."),
 40: ("a", "Movement of charged colloidal particles in an electric field is electrophoresis (used to separate serum proteins)."),
 41: ("c", "The refractive index varies with wavelength (colour) of light - this causes dispersion."),
 42: ("b", "The energy gained by an electron accelerated through 1 V is 1 electron volt (1.6 × 10⁻¹⁹ J)."),
 43: ("a", "A photon is a quantum (packet) of electromagnetic radiation."),
 45: ("a", "Lightning can cause a sudden voltage surge on the supply lines that damages connected electronic devices."),
 46: ("b", "Molarity = moles/litres = 5/2.5 = 2 M."),
 49: ("a", "Glycogen, the storage polysaccharide of animals (liver and muscle), is called animal starch."),
 50: ("c", "Inulin is freely filtered and neither reabsorbed nor secreted, so its clearance measures GFR."),
 51: ("b", "The exoskeleton of insects and crustaceans contains chitin."),
 52: ("d", "Keratan sulphate is abundant in the cornea (and cartilage)."),
 53: ("b", "The large intestinal roundworm is Ascaris lumbricoides."),
 54: ("d", "Taenia solium is the pork tapeworm; Taenia saginata is the beef tapeworm."),
 55: ("d", "Phosphate is part of bone mineral (hydroxyapatite), ATP and the backbone of DNA and RNA."),
 56: ("a", "Iron in haemoglobin binds oxygen for transport in the blood."),
 59: ("a", "Compounds with the same structural formula but different arrangement in space are stereoisomers (optical isomers, anomers and epimers are types of stereoisomers)."),
 60: ("b", "L-fucose is the characteristic sugar of the H antigen on which the A and B antigens are built. (The paper printed 'Frucose'.)"),
 61: ("c", "DNA contains deoxyribose; RNA contains ribose."),
 62: ("d", "Milk sugar is lactose (glucose + galactose)."),
 63: ("d", "Graves' disease is hyperthyroidism (too much thyroid hormone); myxoedema and cretinism are hypothyroid states, and goitre often accompanies iodine-deficiency hypothyroidism."),
 64: ("c", "NaCl is a salt of a strong acid and strong base; it does not hydrolyse, so the pH stays 7."),
 69: ("b", "Water enters the dried grape by osmosis (endosmosis), so it swells."),
 70: ("a", "Momentum (p = mv) is zero at rest; mass, inertia and energy (e.g. potential energy) can exist at rest."),
}

NEW_MCQ = [
    ("The 'fight or flight' hormones are secreted by the:", ["Adrenal medulla", "Thyroid gland", "Pancreas", "Pineal gland"], "a", "The adrenal medulla secretes adrenaline and noradrenaline in stress and emergencies."),
    ("Which part of the nephron is the main site of ultrafiltration?", ["Loop of Henle", "Glomerulus and Bowman's capsule", "Collecting duct", "Distal convoluted tubule"], "b", "Blood is filtered under pressure from the glomerular capillaries into Bowman's capsule."),
    ("Which vitamin is synthesised by bacteria in the human large intestine?", ["Vitamin C", "Vitamin K", "Vitamin A", "Vitamin D"], "b", "Gut bacteria produce vitamin K (and some B vitamins)."),
    ("The disease caused by deficiency of vitamin B12 is:", ["Pernicious (megaloblastic) anaemia", "Rickets", "Scurvy", "Xerophthalmia"], "a", "B12 is needed to make red blood cells; its lack (e.g. no intrinsic factor) causes pernicious, megaloblastic anaemia."),
    ("Dengue fever is transmitted by the:", ["Anopheles mosquito", "Aedes mosquito", "Culex mosquito", "Housefly"], "b", "Aedes aegypti and Aedes albopictus mosquitoes, which bite in the daytime, spread dengue."),
    ("The universal donor of plasma (not red cells) is a person of blood group:", ["O", "A", "B", "AB"], "d", "AB plasma contains neither anti-A nor anti-B, so it can be given to anyone; for red cells group O is the universal donor."),
    ("Which part of a plant cell controls the passage of substances into and out of the cell?", ["Cell wall", "Cell membrane", "Nucleus", "Chloroplast"], "b", "The selectively permeable cell (plasma) membrane controls what enters and leaves; the cell wall is freely permeable."),
    ("The process by which plants lose water vapour through stomata is called:", ["Guttation", "Transpiration", "Respiration", "Photosynthesis"], "b", "Transpiration is evaporation of water from leaves through the stomata; it creates the pull that draws water up the plant."),
    ("Which gas is produced during photosynthesis?", ["Carbon dioxide", "Nitrogen", "Oxygen", "Methane"], "c", "Plants release oxygen from the splitting of water during photosynthesis."),
    ("The molar mass of water (H₂O) is approximately:", ["16 g/mol", "18 g/mol", "20 g/mol", "34 g/mol"], "b", "2 × 1 + 16 = 18 g/mol."),
    ("An acid turns blue litmus paper:", ["Red", "Green", "Yellow", "Colourless"], "a", "Acids turn blue litmus red; bases turn red litmus blue."),
    ("The process of converting a liquid into vapour at its boiling point is called:", ["Condensation", "Sublimation", "Boiling (vaporisation)", "Freezing"], "c", "At the boiling point the liquid turns into vapour throughout its body - boiling."),
    ("Which part of the cell contains the genetic material DNA?", ["Cell membrane", "Nucleus", "Ribosome", "Vacuole"], "b", "In eukaryotic cells most DNA is in the nucleus (some in mitochondria and chloroplasts)."),
    ("Which mirror is used by dentists to see enlarged images of teeth?", ["Plane mirror", "Convex mirror", "Concave mirror", "None of these"], "c", "A concave mirror held close to the tooth (inside its focus) gives an enlarged, upright image."),
    ("The frequency of the AC mains supply in Bhutan is:", ["50 Hz", "60 Hz", "100 Hz", "220 Hz"], "a", "Bhutan's supply is 230 V, 50 Hz (like India)."),
    ("Which radiation is used in the sterilisation of medical equipment such as syringes?", ["Infrared rays", "Gamma rays", "Radio waves", "Visible light"], "b", "Gamma rays from cobalt-60 kill microorganisms and are used to sterilise disposable medical supplies."),
    ("The pH of human saliva is about:", ["2", "6.8", "9", "11"], "b", "Saliva is close to neutral, pH about 6.5-7.0 - the optimum for salivary amylase."),
    ("Haemophilia is a disorder in which:", ["Blood does not clot properly", "Red cells are sickle shaped", "White cell count is very high", "Haemoglobin is absent"], "a", "Haemophilia is an X-linked inherited lack of a clotting factor (VIII or IX), causing prolonged bleeding."),
    ("Which part of the eye controls the amount of light entering it?", ["Cornea", "Iris (pupil)", "Lens", "Retina"], "b", "The iris changes the size of the pupil to control how much light enters."),
    ("Which part of the human brain controls breathing and heartbeat?", ["Cerebrum", "Cerebellum", "Medulla oblongata", "Thalamus"], "c", "The medulla oblongata contains the cardiac, respiratory and vasomotor centres."),
    ("Bile pigments are formed from the breakdown of:", ["Proteins", "Haemoglobin", "Fats", "Glycogen"], "b", "When old red cells are destroyed, haem is converted to biliverdin and bilirubin, which are excreted in bile."),
    ("Which blood cells are most numerous in a healthy person's blood?", ["Neutrophils", "Lymphocytes", "Red blood cells", "Platelets"], "c", "There are about 4.5-5.5 million red cells per microlitre, far more than platelets (1.5-4 lakh) or white cells (4,000-11,000)."),
    ("The gas responsible for the depletion of the ozone layer comes mainly from:", ["Chlorofluorocarbons (CFCs)", "Oxygen", "Nitrogen", "Water vapour"], "a", "Chlorine released from CFCs in the stratosphere destroys ozone molecules."),
    ("The unit of radioactivity in the SI system is the:", ["Curie", "Becquerel", "Roentgen", "Gray"], "b", "1 becquerel = one disintegration per second; the gray is the unit of absorbed dose."),
    ("The number of chambers in the human heart is:", ["Two", "Three", "Four", "Five"], "c", "The human heart has four chambers - two atria and two ventricles."),
]

HEART = "/papers/me/tech2-medsci-2015-heart.png"
SAQ = [
 dict(real=False, marks=3, stem="Explain the ABO and Rh blood group systems. Why is the Rh factor important in pregnancy? (3 marks)",
      kp=[("ABO: groups A, B, AB, O depend on A/B antigens on red cells; plasma has the opposite antibodies (A has anti-B, B anti-A, O both, AB none)", 1),
          ("Rh: Rh-positive people have the D antigen; Rh-negative do not and form anti-D only after exposure", 1),
          ("Pregnancy: an Rh-negative mother carrying an Rh-positive baby can be sensitised at delivery; in the next pregnancy anti-D crosses the placenta and destroys fetal red cells (haemolytic disease of the newborn); prevented by anti-D injection within 72 hours", 1)],
      model="ABO system: red cells may carry antigen A, antigen B, both or neither, giving groups A, B, AB and O. The plasma contains the opposite naturally occurring antibodies: group A has anti-B, group B has anti-A, group O has both anti-A and anti-B, and group AB has neither. Transfusing incompatible blood causes the donor cells to clump and break down.\nRh system: people whose red cells carry the D antigen are Rh positive (most Bhutanese); those without it are Rh negative. Anti-D antibodies are formed only after an Rh-negative person is exposed to Rh-positive blood.\nImportance in pregnancy: if an Rh-negative mother carries an Rh-positive baby, fetal cells entering her blood at delivery (or miscarriage) can sensitise her to make anti-D. In a later pregnancy with an Rh-positive baby, these antibodies cross the placenta and destroy the baby's red cells, causing haemolytic disease of the newborn (anaemia, jaundice, hydrops). This is prevented by giving the mother an anti-D immunoglobulin injection within 72 hours of delivery or any sensitising event."),
 dict(real=False, marks=3, stem="What is anaemia? Describe its common causes and preventive measures in Bhutan. (3 marks)",
      kp=[("Anaemia: haemoglobin below normal (e.g. <12 g/dL in women, <13 g/dL in men, <11 g/dL in pregnancy), reducing oxygen-carrying capacity; signs - fatigue, pallor, breathlessness", 1),
          ("Causes: iron deficiency (poor diet, heavy menstruation, pregnancy), hookworm and other worm infections, folate/B12 deficiency, blood loss, malaria, inherited (thalassaemia)", 1),
          ("Prevention: iron-folic acid supplementation for pregnant women and adolescent girls, deworming, iron-rich diet with vitamin C, fortified rice/flour, sanitation and footwear, treating infections", 1)],
      model="Anaemia is a condition in which the haemoglobin concentration (or number of red cells) is lower than normal - below about 12 g/dL in women, 13 g/dL in men and 11 g/dL in pregnancy - so the blood carries less oxygen. Symptoms include tiredness, weakness, pale skin and conjunctiva, breathlessness and palpitations.\nCommon causes: iron deficiency from a poor diet, heavy menstrual bleeding and pregnancy (the commonest cause); hookworm and other intestinal worms; deficiency of folic acid or vitamin B12; blood loss; chronic infections such as malaria; inherited disorders like thalassaemia.\nPrevention in Bhutan: weekly iron-folic acid supplements for adolescent girls and daily supplements in pregnancy; regular deswarming in schools; an iron-rich diet (green leafy vegetables, meat, pulses) with vitamin C and avoiding tea with meals; fortified rice and flour; good sanitation, wearing shoes and safe water; early treatment of infections and heavy periods."),
 dict(marks=3, stem="Classify proteins based on (a) solubility and (b) structure, and give one example of each. (3 marks)",
      kp=[("By solubility/shape: fibrous proteins - insoluble, structural (keratin, collagen); globular proteins - soluble in water/salt solutions (albumin, haemoglobin, enzymes)", 1.5),
          ("By structure (composition): simple proteins - only amino acids (albumin, globulin); conjugated - protein + prosthetic group (haemoglobin, glycoproteins, lipoproteins); derived - from hydrolysis (peptones, peptides)", 1.5)],
      model="(a) Based on solubility (and shape):\n• Fibrous proteins - long, insoluble in water, structural: keratin (hair, nails), collagen (tendons).\n• Globular proteins - compact and soluble in water or salt solutions: albumin (soluble in water), globulins (soluble in dilute salt solution), haemoglobin, enzymes.\n(b) Based on structure / composition:\n• Simple proteins - give only amino acids on hydrolysis: albumin, globulin.\n• Conjugated proteins - protein joined to a non-protein (prosthetic) group: haemoglobin (haem), glycoproteins (mucin), lipoproteins, nucleoproteins.\n• Derived proteins - formed by partial breakdown of proteins: peptones, peptides.\n(Levels of structure - primary, secondary, tertiary and quaternary - are also accepted.)"),
 dict(real=False, marks=3, stem="Describe the digestion of carbohydrates, proteins and fats in the human digestive system, naming the enzymes involved. (3 marks)",
      kp=[("Carbohydrates: salivary amylase (mouth) and pancreatic amylase (duodenum) break starch to maltose; maltase, sucrase and lactase in the small intestine produce glucose, fructose and galactose", 1),
          ("Proteins: pepsin (stomach, acid pH) breaks proteins to peptides; trypsin and chymotrypsin (pancreas) and peptidases in the small intestine produce amino acids", 1),
          ("Fats: bile salts emulsify fats; pancreatic lipase (and intestinal lipase) hydrolyses them into fatty acids and glycerol; products absorbed in the villi", 1)],
      model="Carbohydrates: digestion starts in the mouth, where salivary amylase (ptyalin) breaks starch into maltose. In the duodenum, pancreatic amylase continues this. In the small intestine, maltase, sucrase and lactase split maltose, sucrose and lactose into glucose, fructose and galactose.\nProteins: in the stomach, pepsin (activated by hydrochloric acid) breaks proteins into peptides. In the small intestine, trypsin and chymotrypsin from the pancreas and peptidases from the intestinal wall break peptides into amino acids.\nFats: in the duodenum, bile salts from the liver emulsify fats into small droplets, and pancreatic lipase hydrolyses them into fatty acids and glycerol (monoglycerides).\nThe end products - simple sugars, amino acids, fatty acids and glycerol - are absorbed through the villi of the small intestine (sugars and amino acids into blood capillaries, fats into the lacteals)."),
 dict(marks=3, stem="How does smoking tobacco lead to a reduction of oxygen in the body? (3 marks)",
      kp=[("Tobacco smoke contains carbon monoxide, which binds haemoglobin about 200-250 times more strongly than oxygen, forming carboxyhaemoglobin", 1),
          ("So less haemoglobin is available to carry oxygen, and CO also makes haemoglobin hold oxygen more tightly (less released to tissues)", 1),
          ("Smoke also damages the airways and alveoli (bronchitis, emphysema, mucus, paralysed cilia), reducing gas exchange; nicotine narrows blood vessels, reducing blood flow", 1)],
      model="1. Tobacco smoke contains carbon monoxide (CO). CO combines with haemoglobin about 200-250 times more readily than oxygen, forming stable carboxyhaemoglobin. Up to 10-15% of a heavy smoker's haemoglobin may be blocked, so less oxygen can be carried.\n2. CO also shifts the oxygen-dissociation curve to the left, so the haemoglobin that does carry oxygen releases it less readily to the tissues.\n3. Smoke irritates and damages the airways: it paralyses the cilia, increases mucus, causes chronic bronchitis and destroys the alveolar walls (emphysema), reducing the area for gas exchange.\n4. Nicotine constricts blood vessels and raises heart rate, further reducing oxygen delivery to tissues."),
 dict(marks=3, image="/papers/me/tech2-medsci-2015-enzyme.png", stem="The graph shows the catalytic action of an enzyme on a substrate (energy against time, with and without enzyme). Label the parts of the graph numbered 1-3 and explain the catalytic action of enzymes with the help of the graph. (3 marks)",
      kp=[("1 = activation energy without enzyme; 2 = activation energy with enzyme; 3 = energy released (overall energy change ΔH) of the reaction", 1.5),
          ("The enzyme binds the substrate at its active site (enzyme-substrate complex) and provides a pathway of lower activation energy, so more molecules react and the rate increases", 1),
          ("The energy of reactants and products, and the overall energy released, are the same with or without the enzyme; the enzyme is unchanged at the end", 0.5)],
      model="Labels: 1 - activation energy without the enzyme (the higher peak); 2 - activation energy with the enzyme (the lower peak); 3 - the overall energy released by the reaction (difference between reactants and products, ΔH).\nExplanation: an enzyme is a biological catalyst. The substrate binds to the enzyme's active site, forming an enzyme-substrate complex that strains or orients the substrate so that bonds break and form more easily. This provides a pathway with a much lower activation energy, so many more substrate molecules have enough energy to react and the reaction is much faster. The starting and final energy levels are unchanged, so the enzyme does not alter the amount of energy released, and it is released unchanged to act again."),
 dict(marks=3, image="/papers/me/tech2-medsci-2015-electrophoresis.png", stem="Answer the following questions using the diagram of protein separation:\na) Name the technique and explain the principle of protein separation. (2 marks)\nb) Why does albumin show the highest peak among all the proteins? (1 marks)",
      kp=[("a) Serum protein electrophoresis", 0.5), ("a) Principle: in an electric field (on a support such as agarose/cellulose acetate at pH 8.6) proteins carry a negative charge and move towards the anode at different speeds depending on their charge, size and shape, separating into bands (albumin, α1, α2, β, γ-globulins) that are stained and scanned", 1.5),
          ("b) Albumin is the most abundant plasma protein (about 55-60% of total protein), so its band is densest and its peak highest", 1)],
      model="a) The technique is (serum protein) electrophoresis. Serum is placed on a support medium (agarose gel or cellulose acetate) soaked in an alkaline buffer (pH about 8.6), at which the proteins carry a net negative charge. When an electric current is passed, the proteins move towards the positive electrode (anode) at different rates according to their charge, size and shape. Albumin, small and most negatively charged, moves furthest; then α1, α2, β and finally γ-globulins. The bands are stained and scanned with a densitometer to give the peaks shown.\nb) Albumin forms the highest peak because it is the most abundant protein in plasma - about 55-60% of total serum protein (3.5-5 g/dL) - so its band takes up the most stain."),
 dict(marks=3, stem="Explain the principle of hydroelectric power generation. (3 marks)",
      kp=[("Water stored at a height (dam/reservoir or river diversion) has potential energy; it flows down through a penstock, converting PE to kinetic energy", 1),
          ("The fast-moving water strikes and rotates the blades of a turbine (mechanical energy)", 1),
          ("The turbine drives a generator: a coil rotating in a magnetic field produces electricity by electromagnetic induction; voltage stepped up by transformers for transmission", 1)],
      model="Hydroelectric power converts the energy of falling water into electricity. Water held behind a dam (or diverted from a river at a height) has gravitational potential energy. It flows down through large pipes (penstocks), and its potential energy becomes kinetic energy. The fast-moving water strikes the blades of a turbine and makes it spin (mechanical energy). The turbine is coupled to a generator, in which coils rotate in a magnetic field; by electromagnetic induction (Faraday's law) an electric current is produced. Transformers step up the voltage for transmission, and the water returns to the river. The power depends on the height of the fall (head) and the rate of water flow (P = ρgQh × efficiency)."),
 dict(real=False, marks=3, stem="Explain the mechanism of breathing (inspiration and expiration) in humans. (3 marks)",
      kp=[("Inspiration: diaphragm contracts and flattens, external intercostal muscles lift the ribs up and out; chest volume increases, lung pressure falls below atmospheric, air flows in", 1.5),
          ("Expiration (quiet): diaphragm and intercostals relax, ribs fall and diaphragm domes up by elastic recoil; volume decreases, pressure rises above atmospheric, air flows out", 1),
          ("Forced expiration uses internal intercostals and abdominal muscles; breathing is controlled by the respiratory centre in the medulla (responds mainly to CO₂)", 0.5)],
      model="Breathing works by changing the volume, and therefore the pressure, of the chest cavity (Boyle's law).\nInspiration (active): the diaphragm contracts and flattens, and the external intercostal muscles contract, raising the ribs and sternum upward and outward. The volume of the thorax and lungs increases, so the pressure inside the lungs falls below atmospheric pressure and air rushes in through the nose, trachea and bronchi.\nExpiration (normally passive): the diaphragm and external intercostals relax; the diaphragm returns to its dome shape and the ribs move down and in, helped by the elastic recoil of the lungs. The thoracic volume decreases, pressure rises above atmospheric and air is pushed out. In forced expiration (exercise, coughing) the internal intercostal and abdominal muscles contract.\nThe rate and depth of breathing are controlled by the respiratory centre in the medulla oblongata, which responds mainly to the level of carbon dioxide in the blood."),
 dict(marks=3, stem="Explain the greenhouse effect. (3 marks)",
      kp=[("Short-wave solar radiation passes through the atmosphere and warms the earth's surface, which re-emits long-wave infrared radiation", 1),
          ("Greenhouse gases (CO₂, methane, water vapour, nitrous oxide, CFCs) absorb and re-radiate this infrared, trapping heat like the glass of a greenhouse - keeping the earth about 33 °C warmer", 1),
          ("Human activities (burning fossil fuels, deforestation, agriculture) increase these gases → enhanced greenhouse effect → global warming, melting glaciers, extreme weather", 1)],
      model="The sun's energy reaches the earth mostly as short-wave radiation (visible light), which passes through the atmosphere and warms the ground and oceans. The warm earth gives off energy as long-wave infrared (heat) radiation. Greenhouse gases in the atmosphere - carbon dioxide, methane, water vapour, nitrous oxide and CFCs - absorb much of this infrared and radiate it back towards the earth, trapping heat, just as the glass of a greenhouse keeps the inside warm. This natural greenhouse effect keeps the earth's average temperature about 15 °C instead of about −18 °C.\nHuman activities - burning coal, oil and gas, deforestation, livestock and rice farming - are increasing these gases, producing an enhanced greenhouse effect and global warming, with melting glaciers (a risk of glacial lake outburst floods in Bhutan), rising sea levels and more extreme weather."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
