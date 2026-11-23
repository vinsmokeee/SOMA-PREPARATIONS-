"""ME Technical Paper II (General Subject Knowledge), BIO SCIENCE group, BCSE 2020 (held February 2021) - real paper (PDF sent
by the founder). Same pattern as 2021-2025 (Part I 70 MCQ x 1; Part II 10 short answers x 3), ADDED to the pattern.
Already on Soma or loaded from a later year (recorded as appearances): MCQ 1, 5, 7, 9, 11, 14, 16, 17, 23, 24, 25, 26, 28,
33, 38, 42, 44, 45, 46, 47, 48, 52, 57, 58, 60, 61, 63 and 69. MCQ 54's arrow is restored (H2S + H2O2 → S + 2H2O).
Left out: MCQ 27, 30 (needs the percentage of HCl - not given), 34, 39 (stem garbled), 49 (psychrometer and potometer
both fit). Five new MCQs replace them.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Bio Science): BCSE 2020, batch 1"
GROUP_TAG = "bio2020"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "bio-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2020 Main Examination, Technical Paper II, Bio Science", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Bio Science: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Anatomically, fairly old dicotyledonous root is distinguished from the dicotyledonous stem by",
"opts": [
"absence of secondary xylem.",
"absence of secondary phloem.",
"presence of cortex.",
"position of protoxylem."
]
},
{
"n": 2,
"stem": "The chief water conducting elements of xylem in gymnosperms are",
"opts": [
"Vessels",
"Fibres",
"Tracheids",
"Transfusion tissues"
]
},
{
"n": 3,
"stem": "The number of moles of solute present in 1 kg of solvent is called its",
"opts": [
"Molality",
"Molarity",
"Normality",
"Formality"
]
},
{
"n": 4,
"stem": "The most electronegative element among the following is",
"opts": [
"Bromine",
"Sodium",
"Fluorine",
"Oxygen"
]
},
{
"n": 5,
"stem": "The purplish red pigment rhodopsin contained in the rods type of photoreceptor cell of the human eye is a derivative of",
"opts": [
"Vitamin B1",
"Vitamin C",
"Vitamin D",
"Vitamin A"
]
},
{
"n": 6,
"stem": "Which one of the following items gives its correct total number indicated below?",
"opts": [
"Floating ribs in humans - 4",
"Amino acids found in proteins - 16",
"Types of diabetes - 3",
"Cervical vertebrae in humans - 8"
]
},
{
"n": 7,
"stem": "Which is common to kidney and skeleton in mammals?",
"opts": [
"Cortex",
"Medulla",
"Radius",
"Pelvis"
]
},
{
"n": 8,
"stem": "Breeding of crops with high levels of minerals, vitamins and proteins is called",
"opts": [
"Somatic hybridisation",
"Biofortification",
"Biomagnification",
"Micropropagation"
]
},
{
"n": 9,
"stem": "Number of moles of NaOH present in 2 litre of 0.5 M NaOH solution is",
"opts": [
"2.0",
"2.5",
"1.5",
"1.0"
]
},
{
"n": 10,
"stem": "A historic convention of biological diversity held in Rio de Janerio in 1992 is known as the",
"opts": [
"Geneva convention",
"Earth Summit",
"Montreal protocol",
"Janerio convention"
]
},
{
"n": 11,
"stem": "Production of glucose from amino acids, fatty acids and glycerol is called",
"opts": [
"Glycogenesis",
"Glycolysis",
"Gluconeogenesis",
"Glycogenolysis"
]
},
{
"n": 12,
"stem": "Which of the following is an organic molecule needed by the body in small amount?",
"opts": [
"Protein",
"Zinc",
"Vitamin - C",
"Monosaccharide"
]
},
{
"n": 13,
"stem": "In plant, apical dominance is caused by",
"opts": [
"Gibberellin",
"Cytokinin",
"Ethylene",
"Auxin"
]
},
{
"n": 14,
"stem": "When pH of solution is increased from 3 to 5, its H+ ions concentration will be",
"opts": [
"reduced to half.",
"reduced by 100 times.",
"increased by 100 times.",
"increased by 1000 times."
]
},
{
"n": 15,
"stem": "Coiling of garden pea tendrils around any support is an example of",
"opts": [
"Thigmotaxis",
"Thigmonasty",
"Thigmotropism",
"Thermotaxis"
]
},
{
"n": 16,
"stem": "The term “mutation” was introduced by",
"opts": [
"Hugo deVries",
"Morgan",
"Muller",
"Darwin"
]
},
{
"n": 17,
"stem": "“The ratio of the concentration of a solute between two liquid phases is constant at a given temperature.” This statement is called",
"opts": [
"Henry’s law",
"Raoult’s law",
"Distribution law",
"Kirchoff’s law"
]
},
{
"n": 18,
"stem": "The metal that is used as a catalyst in the hydrogenation of oils is",
"opts": [
"Ni",
"Cu",
"Pb",
"Pt"
]
},
{
"n": 19,
"stem": "Which extra embryonic membrane in human prevents desiccation of the embryo inside the uterus?",
"opts": [
"Yolk Sac",
"Amnion",
"Chorion",
"Allantois"
]
},
{
"n": 20,
"stem": "Which of the following types of leucocytes secretes heparins and histamine?",
"opts": [
"Acidophils",
"Monocytes",
"Basophils",
"Neutrophils"
]
},
{
"n": 21,
"stem": "Biosphere reserves differ from national parks and wildlife sanctuaries because in the former",
"opts": [
"human beings are not allowed to enter.",
"people are an integral part of the system.",
"plants are paid more attention than the animals.",
"living organisms are brought from all over the world and preserved for posterity."
]
},
{
"n": 22,
"stem": "The number of moles of KCl in 1000 ml of 3 molar solution is",
"opts": [
"2",
"3",
"4",
"5"
]
},
{
"n": 23,
"stem": "Which of the following is NOT a colligative property?",
"opts": [
"Elevation in boiling point",
"Osmotic pressure",
"Optical activity",
"Relative lowering of vapour pressure"
]
},
{
"n": 24,
"stem": "Bartholin’s glands of female corresponds to which glands in male?",
"opts": [
"Cowper’s gland",
"Inguinal glands",
"Rectal glands",
"Prostate glands"
]
},
{
"n": 25,
"stem": "Evolutionary history of an organism is known as",
"opts": [
"Phylogeny",
"Ancestry",
"Palaeontology",
"Ontogeny"
]
},
{
"n": 26,
"stem": "When two species of different genealogy come to resemble each other as a result of adaptation, the phenomenon is termed as",
"opts": [
"Co-evolution",
"Convergent evolution",
"Divergent evolution",
"Microevolution"
]
},
{
"n": 27,
"stem": "Which one of the following factors does not influence the reaction rate?",
"opts": [
"Concentration of reactants",
"Order of reaction",
"Molecularity of the reaction",
"Orientation of molecules"
]
},
{
"n": 28,
"stem": "Man-made crop Triticale is a hybrid between",
"opts": [
"Rice and Maize",
"Wheat and Rye",
"Rice and Barley",
"Maize and Barley"
]
},
{
"n": 29,
"stem": "A collection of plants and seeds having diverse alleles of all the genes of a crop is called",
"opts": [
"Herbarium",
"Genome",
"Germplasm",
"Gene library"
]
},
{
"n": 30,
"stem": "If the density of the HCl acid is 1.17 gcm-3, then its molarity is",
"opts": [
"36.5",
"32.05",
"1.17",
"35.50"
]
},
{
"n": 31,
"stem": "Bleaching properties of bleaching powder are due to its",
"opts": [
"Basic properties",
"Disinfecting properties",
"Oxidising properties",
"Reducing properties"
]
},
{
"n": 32,
"stem": "Maximum number of vascular bundles is present in",
"opts": [
"Monocot stem",
"Monocot root",
"Dicot stem",
"Dicot root"
]
},
{
"n": 33,
"stem": "The lining of intestine and kidneys in human is",
"opts": [
"Keratinised",
"Brush-bordered",
"Ciliated",
"None of the above"
]
},
{
"n": 34,
"stem": "Bone marrow is made up of",
"opts": [
"muscular fibre and fatty tissue.",
"fatty tissue and areolar tissue.",
"fatty tissue and cartilage.",
"fatty tissue, areolar tissue and blood vessel."
]
},
{
"n": 35,
"stem": "Calcium acetate on heating yields",
"opts": [
"CaO, CO2, and H2O",
"CaCO3 and H2O",
"CaCO3 and CH3COCH3",
"CH3CHO and CaCO3"
]
},
{
"n": 36,
"stem": "Formaldehyde and formic acid can be distinguished by",
"opts": [
"Tollen’s reagent",
"Fehling’s solution",
"Sodium carbonate",
"Benedict reagent"
]
},
{
"n": 37,
"stem": "Sugar on hydrolysis gives",
"opts": [
"L (+) glucose + D(+) fructose",
"L (-) glucose + L(-) fructose",
"D (+) glucose + D(-) fructose",
"D (+) glucose + L(-) fructose"
]
},
{
"n": 38,
"stem": "In which of the following is oxygen not evolved during photosynthesis?",
"opts": [
"Photosynthetic red algae",
"Photosynthetic green algae",
"Photosynthetic blue-green algae",
"Photosynthetic bacteria"
]
},
{
"n": 39,
"stem": "In plasmolysed cell, the space between nucleus and plasma membrane is occupied by",
"opts": [
"Hypertonic solution",
"Hypotonic solution",
"Isotonic solution",
"Air"
]
},
{
"n": 40,
"stem": "Darwin judged the fitness of an individual by",
"opts": [
"ability to defend itself.",
"strategy to obtain food.",
"number of offspring.",
"dominance over other individuals."
]
},
{
"n": 41,
"stem": "Vitamin-K deficiency causes",
"opts": [
"Scurvy",
"Bleeding",
"Osteomalacia",
"None of the above"
]
},
{
"n": 42,
"stem": "Which one of the following enzymes digests protein in stomach?",
"opts": [
"Trypsin",
"Pepsin",
"Erepsin",
"None of the above"
]
},
{
"n": 43,
"stem": "Which one of the following aromatic compounds will not exhibit isomerism?",
"opts": [
"Benzene",
"2-chloro pyridine",
"Pirymidine",
"1,4 dichloro benzene"
]
},
{
"n": 44,
"stem": "Among mammals, a significant role in the digestion of milk is played by which of the following?",
"opts": [
"Rennin",
"Invertase",
"Amylase",
"Intestinal bacteria"
]
},
{
"n": 45,
"stem": "In C3 plants, the first stable product of photosynthesis during the dark reaction is",
"opts": [
"Malic acid",
"Oxaloacetic acid",
"3-phosphoglyceric acid",
"Phosphoglyceraldehyde"
]
},
{
"n": 46,
"stem": "Law of limiting factor was given by",
"opts": [
"Leibig",
"Blackman",
"Calvin",
"A.R.Wallace"
]
},
{
"n": 47,
"stem": "Which one of the following metals causes harmful effects?",
"opts": [
"Lead",
"Cobalt",
"Uranium",
"All of the above"
]
},
{
"n": 48,
"stem": "The process of decay of dead organic matter is known as",
"opts": [
"Denitrification",
"Nitrification",
"Ammonification",
"Nitrogen fixation"
]
},
{
"n": 49,
"stem": "An instrument for measuring atmospheric humidity as well as amount of water transpired is called",
"opts": [
"Potometer",
"Porometer",
"Psychrometer",
"Hydrometer"
]
},
{
"n": 50,
"stem": "For nitrogen fixation in soil, a useful pigment is called",
"opts": [
"Nitrogenise",
"Haemoglobin",
"Myoglobin",
"Leghaemoglobin"
]
},
{
"n": 51,
"stem": "Water holding capacity of soil is greater in",
"opts": [
"Sandy soil",
"Sandy loam",
"Clay soil",
"Silty soil"
]
},
{
"n": 52,
"stem": "The molarity of pure water is",
"opts": [
"18 M",
"45.6 M",
"50 M",
"55.6 M"
]
},
{
"n": 53,
"stem": "Heating of rubber with sulphur is known as",
"opts": [
"Galvanisation",
"Vulcanisation",
"Bessemerisation",
"Sulphonation"
]
},
{
"n": 54,
"stem": "The reaction H2S + H2O2 → S + 2H2O shows",
"opts": [
"Acidic nature of H2O2",
"Alkaline nature of H2O2",
"Oxidising nature of H2O2",
"Reducing nature of H2O2"
]
},
{
"n": 55,
"stem": "When the body is rapidly oxidising fats, excess ketone bodies accumulate resulting in",
"opts": [
"Pyruvic acid",
"Lactic acid",
"Ketoacidosis",
"ATP"
]
},
{
"n": 56,
"stem": "Uricotelic mode of passing out nitrogenous waste is found in",
"opts": [
"reptiles and birds.",
"birds and annelids.",
"amphibians and reptiles.",
"insects and amphibians."
]
},
{
"n": 57,
"stem": "Which hormone causes dilation of blood vessels, increased oxygen consumption and glucogenesis?",
"opts": [
"Glycogen",
"Insulin",
"Adrenaline",
"ACTH"
]
},
{
"n": 58,
"stem": "Which one of the following helps in blood coagulation?",
"opts": [
"Leucocytes",
"Monocytes",
"Lymphocytes",
"Thrombocytes"
]
},
{
"n": 59,
"stem": "Bleaching powder is obtained by the interaction of Cl 2 and",
"opts": [
"Dilute solution of Ca(OH)2",
"Concentrate solution of Ca(OH)2",
"Dry CaO",
"Dry slaked lime"
]
},
{
"n": 60,
"stem": "Desired improved varieties of economically useful crops are raised by",
"opts": [
"Vernalization",
"Biofertilizers",
"Hybridisation",
"Natural selection"
]
},
{
"n": 61,
"stem": "The type of placenta found in human beings is called",
"opts": [
"Diffuse",
"Zonary",
"Cotyledonary",
"Discoidal"
]
},
{
"n": 62,
"stem": "Which one of the following gives positive Fehling’s solution test?",
"opts": [
"Protein",
"Sucrose",
"Glucose",
"Fats"
]
},
{
"n": 63,
"stem": "The solubility of a gas increases with increase in",
"opts": [
"Volume of the gas",
"Concentration",
"Pressure",
"Temperature"
]
},
{
"n": 64,
"stem": "In ice-water-water vapour system, the degree of freedom is",
"opts": [
"One",
"Two",
"Three",
"None (Zero)"
]
},
{
"n": 65,
"stem": "Which of the following is correctly matched?",
"opts": [
"Pisciculture – Silk moth",
"Apiculture – Honeybee",
"Sericulture – Fish",
"Aquaculture – mosquitoes"
]
},
{
"n": 66,
"stem": "For the quick and sharp separation of the components of a mixture, the chromatography used is",
"opts": [
"Paper chromatography",
"Thinlayer chromatography",
"Column chromatography",
"Gas-liquid chromatography"
]
},
{
"n": 67,
"stem": "Which one of the following elements occurs in the free state?",
"opts": [
"Si",
"Ge",
"C",
"Sn"
]
},
{
"n": 68,
"stem": "Crossing of unrelated pure breeding animals of different traits within the same breed is called",
"opts": [
"Close breeding",
"Out crossing",
"Cross breeding",
"Species hybridisation"
]
},
{
"n": 69,
"stem": "Alzheimer’s disease in human is associated with the deficiency of",
"opts": [
"Dopamine",
"Glutamic acid",
"Acetylcholine",
"Gamma Amino Butyric acid"
]
},
{
"n": 70,
"stem": "Photochemical reactions in the chloroplasts are directly involved in",
"opts": [
"fixation of carbon dioxide.",
"synthesis of glucose and starch.",
"formation of phosphoglyceric acid.",
"photolysis of water and phosphorylation of ADP to ATP."
]
}
]"""

KEY = {
    2: ("c", "Gymnosperms (except a few like Gnetum) have no vessels; tracheids conduct water."),
    3: ("a", "Moles of solute per kg of solvent is molality."),
    4: ("c", "Fluorine is the most electronegative element."),
    6: ("a", "Humans have two pairs (4) of floating ribs; 20 amino acids, 7 cervical vertebrae."),
    8: ("b", "Breeding crops with more minerals, vitamins and protein is biofortification."),
    10: ("b", "The 1992 Rio conference is the Earth Summit, where the Convention on Biological Diversity was signed."),
    12: ("c", "Vitamin C is an organic micronutrient needed in small amounts; zinc is inorganic."),
    13: ("d", "Auxin from the apical bud suppresses lateral buds (apical dominance)."),
    15: ("c", "Tendrils coil in response to touch - thigmotropism."),
    18: ("a", "Finely divided nickel catalyses hydrogenation of oils."),
    19: ("b", "The fluid-filled amnion protects the embryo from desiccation and shock."),
    20: ("c", "Basophils secrete heparin and histamine."),
    21: ("b", "Biosphere reserves include local people as part of the system (buffer and transition zones)."),
    22: ("b", "3 M means 3 mol per litre: 3 mol in 1000 ml."),
    29: ("c", "A collection of plants and seeds with all the alleles of a crop is its germplasm."),
    31: ("c", "Bleaching powder releases chlorine, an oxidising agent that bleaches."),
    32: ("a", "Monocot stems have many scattered vascular bundles."),
    35: ("c", "Heating calcium acetate gives calcium carbonate and acetone (CH3COCH3)."),
    36: ("c", "Formic acid gives effervescence (CO2) with sodium carbonate; formaldehyde does not (both reduce Tollens' reagent)."),
    37: ("c", "Sucrose hydrolyses to D(+)-glucose and D(−)-fructose (invert sugar)."),
    40: ("c", "Darwinian fitness is measured by reproductive success - the number of offspring."),
    41: ("b", "Vitamin K is needed for clotting factors; deficiency causes bleeding."),
    43: ("a", "Benzene (C6H6) has no isomers."),
    50: ("d", "Leghaemoglobin in root nodules protects nitrogenase from oxygen."),
    51: ("c", "Clay soil, with fine particles and small pores, holds the most water."),
    53: ("b", "Heating rubber with sulphur is vulcanisation."),
    54: ("c", "H2O2 oxidises H2S to sulphur, showing its oxidising nature."),
    55: ("c", "Excess ketone bodies make the blood acidic - ketoacidosis."),
    56: ("a", "Reptiles and birds (and insects) excrete uric acid - uricotelic."),
    59: ("d", "Bleaching powder is made by passing chlorine over dry slaked lime, Ca(OH)2."),
    62: ("c", "Glucose is a reducing sugar and gives a red precipitate with Fehling's solution."),
    64: ("d", "At the triple point, F = C − P + 2 = 1 − 3 + 2 = 0."),
    65: ("b", "Apiculture is bee-keeping."),
    66: ("b", "Thin-layer chromatography gives quick, sharp separations."),
    67: ("c", "Carbon occurs free in nature as diamond and graphite (coal)."),
    68: ("b", "Crossing unrelated animals of the same breed is out-crossing."),
    70: ("d", "The light (photochemical) reactions split water and make ATP (photophosphorylation)."),
}

NEW_MCQ = [
    ("The rate of a chemical reaction generally increases when the", ["temperature is decreased", "concentration of reactants is increased", "catalyst is removed", "surface area is decreased"], "b",
     "More reactant particles per unit volume means more collisions, so the rate increases."),
    ("Bone marrow, found in the cavities of long bones, mainly produces", ["Bile", "Blood cells", "Hormones", "Enzymes"], "b",
     "Red bone marrow is the site of haemopoiesis - formation of red cells, white cells and platelets."),
    ("When a plant cell is placed in a strong salt solution, the protoplast shrinks away from the cell wall. This is called", ["Deplasmolysis", "Plasmolysis", "Imbibition", "Turgidity"], "b",
     "Water leaves the cell by exosmosis and the protoplast shrinks from the wall - plasmolysis."),
    ("The instrument used to measure the rate of water uptake (and hence transpiration) by a leafy shoot is the", ["Potometer", "Barometer", "Auxanometer", "Respirometer"], "a",
     "A potometer measures water uptake by a cut shoot, which is nearly equal to the water lost in transpiration."),
    ("Which of the following is an example of a C4 plant?", ["Wheat", "Rice", "Maize", "Potato"], "c",
     "Maize (like sugarcane and sorghum) fixes CO2 first into a 4-carbon acid; wheat, rice and potato are C3 plants."),
]

SAQ = [
 dict(marks=3, stem="Absorption of water and minerals in plant cells is facilitated by different methods.\n(a) List four different methods of absorption. (2 marks)\n(b) There are two major types of transport proteins in relation to one of the absorption methods. What are they? (1 mark)",
      kp=[("(a) Any four: simple diffusion, osmosis, facilitated diffusion, active transport (also imbibition, mass flow/ ion exchange)", 2),
          ("(b) Carrier proteins and channel proteins (in facilitated diffusion/ active transport)", 1)],
      model="(a) Water and minerals enter plant cells by: (1) diffusion - movement down a concentration gradient; (2) osmosis - movement of water across a selectively permeable membrane; (3) facilitated diffusion - passive movement helped by membrane proteins; (4) active transport - movement against a gradient using ATP and carrier pumps (imbibition and ion exchange are also involved). (b) The two main types of transport proteins are channel proteins (which form pores, e.g. aquaporins and ion channels) and carrier proteins (which bind the substance and change shape to move it across, e.g. uniports, symports and antiports)."),
 dict(marks=3, stem="Give reasons for the following:\n(a) Venous blood is more acidic than arterial blood. (2 marks)\n(b) Earthworms come out of their burrows during heavy rain. (1 mark)",
      kp=[("(a) Venous blood carries more CO2 from respiring tissues; CO2 + H2O → H2CO3 → H+ + HCO3- (carbonic anhydrase), raising H+ and lowering pH (about 7.35 vs 7.4)", 2),
          ("(b) Burrows fill with water, so the air (oxygen) in the soil is displaced; earthworms breathe through moist skin and come out to get oxygen (and avoid drowning)", 1)],
      model="(a) Venous blood collects carbon dioxide produced by respiring tissues. In the red cells CO2 combines with water to form carbonic acid with the help of carbonic anhydrase, and this dissociates into H+ and bicarbonate ions. The extra H+ makes venous blood slightly more acidic (pH about 7.35) than arterial blood (about 7.4). (b) Earthworms respire through their moist skin using oxygen from the air in the soil. Heavy rain fills the burrows and soil spaces with water, so there is too little oxygen; they come out to the surface to breathe and avoid drowning."),
 dict(marks=3, stem="What mass of sodium chloride is present in 500 ml of a 2.00 M NaCl solution? (3 marks)",
      kp=[("Moles = molarity × volume (L) = 2.00 × 0.500 = 1.00 mol", 1.5), ("Mass = moles × molar mass = 1.00 × 58.5 = 58.5 g", 1.5)],
      model="Moles of NaCl = molarity × volume in litres = 2.00 mol/L × 0.500 L = 1.00 mol. Molar mass of NaCl = 23 + 35.5 = 58.5 g/mol. Mass = 1.00 × 58.5 = 58.5 g of sodium chloride."),
 dict(marks=3, stem="In plant growth and development studies, the C/N ratio is crucial. What is the C/N ratio? Describe its role. (3 marks)",
      kp=[("C/N ratio: ratio of carbohydrates (carbon) to nitrogen (nitrogenous compounds) in the plant (or in soil organic matter)", 1),
          ("High C/N ratio (more carbohydrate, less nitrogen) favours flowering and fruiting (reproductive growth)", 1),
          ("Low C/N ratio (more nitrogen) favours vegetative growth (leaves, shoots); manipulated by fertiliser, pruning, girdling; in soil it controls decomposition and N availability", 1)],
      model="The C/N ratio is the ratio of carbohydrates (carbon compounds) to nitrogenous compounds in the plant (Kraus and Kraybill, 1918). It influences the balance between vegetative and reproductive growth: when the C/N ratio is high (plenty of carbohydrates and relatively little nitrogen), plants tend to flower and set fruit; when it is low (much nitrogen), plants grow vigorously in leaves and shoots but flower poorly. Growers manipulate it, for example by limiting nitrogen, pruning roots or ringing (girdling) branches to raise the ratio and promote flowering in fruit trees. In soil, the C/N ratio of organic matter also controls how fast it decomposes and how much nitrogen is released to plants."),
 dict(marks=3, stem="Why do X-rays and gamma rays induce mutation? (3 marks)",
      kp=[("They are high-energy ionising radiations that penetrate cells", 1), ("They ionise atoms/ form free radicals (e.g. from water), which attack DNA", 1),
          ("Cause base changes, single and double strand breaks and chromosomal aberrations (deletions, translocations) - mutations; used in mutation breeding", 1)],
      model="X-rays and gamma rays are high-energy, short-wavelength ionising radiations that penetrate deep into tissues. When they pass through cells they knock electrons out of atoms, producing ions and highly reactive free radicals (especially from water). These directly or indirectly damage DNA: they alter or remove bases, break one or both strands of DNA and cause chromosome breaks that lead to deletions, inversions and translocations. If the damage is not repaired correctly, the change in the DNA sequence is inherited as a mutation; that is why they are used as mutagens in mutation breeding and why exposure must be limited."),
 dict(marks=3, stem="There is greater biodiversity in tropical and sub-tropical regions than in temperate regions. Explain. (3 marks)",
      kp=[("Tropics were less affected by glaciations, so they had a long, undisturbed evolutionary time for speciation", 1),
          ("Stable, less seasonal climate with predictable conditions allows niche specialisation", 1),
          ("More solar energy, warmth and rainfall give higher productivity, supporting more species", 1)],
      model="(1) Evolutionary time: temperate regions were repeatedly covered by ice during the glaciations, while tropical regions stayed relatively undisturbed for millions of years, giving more time for speciation and diversification. (2) Stable environment: the tropics have a less seasonal, more constant and predictable climate, which encourages niche specialisation and allows many species to coexist. (3) Energy and productivity: tropical regions receive more solar energy and warmth, and often more rain, so productivity is higher, which supports more species and more complex food webs."),
 dict(marks=3, stem="The chemical equation below shows the hydrolysis of cane sugar in aqueous solution in the presence of mineral acid:\nC12H22O11 + H2O + [H2SO4] →\n(a) Complete the equation on the product side. What are the products formed? (2 marks)\n(b) Of the three reactants in the equation, which acts as a catalyst? (1 mark)",
      kp=[("(a) C12H22O11 + H2O → C6H12O6 + C6H12O6 (with H2SO4 shown over the arrow)", 1), ("Products: glucose and fructose (invert sugar)", 1), ("(b) H2SO4 (the H+ of the mineral acid) is the catalyst", 1)],
      model="(a) C12H22O11 + H2O —(H2SO4)→ C6H12O6 + C6H12O6. The products are glucose and fructose (an equimolar mixture called invert sugar). (b) The sulphuric acid (its H+ ions) acts as the catalyst; it speeds up the reaction but is not used up. (Because water is in large excess, the reaction is pseudo-first order.)"),
 dict(marks=3, stem="What does the term 'memory' of the immune system mean? (3 marks)",
      kp=[("Ability of the immune system to remember a pathogen/ antigen it has met before", 1), ("During the first (primary) response, memory B and T cells are formed and persist for years", 1),
          ("On re-exposure they give a faster, stronger secondary (anamnestic) response, often preventing disease; basis of vaccination", 1)],
      model="Immunological memory is the ability of the immune system to remember an antigen (pathogen) it has met before. During the first exposure, the primary immune response is slow and weak, but besides plasma cells it produces long-lived memory B cells and memory T cells. If the same antigen enters again, these memory cells recognise it quickly and produce a much faster, stronger and longer-lasting secondary (anamnestic) response, often destroying the pathogen before disease develops. This memory is the basis of acquired immunity and of vaccination."),
 dict(marks=3, stem="Explain the following terms with reference to the use of pesticides:\n(a) Bioconcentration (1.5 marks)\n(b) Biomagnification (1.5 marks)",
      kp=[("(a) Bioconcentration: accumulation of a pesticide in an organism directly from the surrounding water/ environment to a concentration higher than outside (e.g. fish absorbing DDT through gills)", 1.5),
          ("(b) Biomagnification: increase in concentration of a persistent, non-biodegradable pesticide (e.g. DDT) at successive trophic levels of a food chain; top predators (fish-eating birds) worst affected - thin eggshells", 1.5)],
      model="(a) Bioconcentration is the build-up of a chemical such as a pesticide inside an organism directly from its surroundings (water or soil), so that its concentration in the body becomes higher than in the environment - for example, fish absorbing DDT from water through their gills and storing it in fat. (b) Biomagnification is the increase in concentration of a persistent, non-biodegradable, fat-soluble pesticide at each higher trophic level of a food chain, because it is not broken down or excreted and each consumer eats many contaminated organisms - e.g. DDT rising from water to plankton to fish to fish-eating birds, causing thin eggshells and population decline in the top predators."),
 dict(marks=3, stem="Atmospheric air contains 79% nitrogen, which is an essential plant nutrient, but most plants obtain nitrogen from the soil. Why? (3 marks)",
      kp=[("Atmospheric nitrogen is N2 with a very strong triple bond - inert and cannot be used directly by plants", 1),
          ("Plants lack nitrogenase and can absorb nitrogen only as nitrate (NO3-) or ammonium (NH4+)", 1),
          ("N2 must first be fixed (biological fixation by Rhizobium/ cyanobacteria, lightning, industrial fertilisers) and converted in soil (ammonification, nitrification) before roots absorb it", 1)],
      model="Atmospheric nitrogen exists as N2 molecules held by a very strong triple bond (N≡N), so it is chemically inert and cannot be used directly by plants. Plants have no nitrogenase enzyme to break this bond; they can absorb nitrogen only in combined forms, mainly nitrate (NO3-) and ammonium (NH4+) ions, through their roots. N2 must first be 'fixed' into these forms by nitrogen-fixing micro-organisms (Rhizobium in legume nodules, Azotobacter, cyanobacteria), by lightning or by industrial fertiliser manufacture, and organic nitrogen is converted in the soil by ammonification and nitrification. So most plants take their nitrogen from the soil."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
