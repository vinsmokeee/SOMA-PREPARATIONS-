"""ME Technical Paper II (General Subject Knowledge), BIO SCIENCE group, BCSE 2022 - real paper (PDF sent by the founder).
Same pattern as 2023-2025 (Part I 70 MCQ x 1; Part II 10 short answers x 3), so it is ADDED to the paper's pattern.
Already on Soma (recorded as appearances, not loaded again): MCQ 4, 22, 23, 29, 41, 44, 50, 51, 57 and 60 (BCSE 2024/2025)
and 48, 64, 65 and 67 (loaded from BCSE 2023); Part II Q1 (carotenoids) and Q2 (bile) from BCSE 2024/2025. Left out:
MCQ 42 (prostate and Cowper's glands both occur only in males), 46 (photonasty and nyctinasty both fit), 54 (two options
fit), 69 (the precursor, 7-dehydrocholesterol, is not offered). Four new MCQs replace them.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Bio Science): BCSE 2022, batch 1"
GROUP_TAG = "bio2022"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "bio-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2022 Main Examination, Technical Paper II, Bio Science", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Bio Science: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Which crop utilises solar energy most efficiently?",
"opts": [
"Potato",
"Sugarcane",
"Rice",
"Sunflower"
]
},
{
"n": 2,
"stem": "A red blood cell was kept in a certain solution for few minutes and it got burst. The said solution was:",
"opts": [
"Isotonic",
"Hypertonic",
"Hypotonic",
"All of the above"
]
},
{
"n": 3,
"stem": "The type of isomerism exhibited by the compounds CH3-O-C3H7 and C2H5-O-C2H5 is:",
"opts": [
"Optical isomerism",
"Chain isomerism",
"Tautomerism",
"Metamerism"
]
},
{
"n": 4,
"stem": "Hexose monophosphate pathway takes place in:",
"opts": [
"Endosplasmic reticulum",
"Cytoplasm",
"Cristae",
"Mitochondrial matrix"
]
},
{
"n": 5,
"stem": "Chlorophyll in chloroplasts is located in:",
"opts": [
"Grana",
"Stroma",
"Pyrenoid",
"None of the above"
]
},
{
"n": 6,
"stem": "About 1000 ml of air is always known to remain inside the human lungs. It is described as",
"opts": [
"inspiratory reserve volume.",
"expiratory reserve volume.",
"residual volume.",
"tidal volume."
]
},
{
"n": 7,
"stem": "Which of the following organs in human can be called a sort of ‘blood bank’?",
"opts": [
"Heart",
"Spleen",
"Lungs",
"Liver"
]
},
{
"n": 8,
"stem": "4.0 g of NaOH is dissolved in 100 ml solution. The normality of the solution is:",
"opts": [
"0.1 N",
"1.0 N",
"4.0 N",
"0.5 N"
]
},
{
"n": 9,
"stem": "The isotope of an element was discovered by:",
"opts": [
"Soddy",
"Curie",
"Thomson",
"Chadwick"
]
},
{
"n": 10,
"stem": "Which of the following blood vessels in the circulatory system of frog has more oxygenated blood?",
"opts": [
"Pulmocutaneous artery",
"Pulmocutaneous vein",
"Pulmonary artery",
"Precaval veins"
]
},
{
"n": 11,
"stem": "Patients suffering from cholera are given a saline drip because",
"opts": [
"Na+ ions help in stopping nerve impulse and hence sensation of pain.",
"NaCl is an important component of energy supply.",
"Na+ ions help in the retention of water in the body tissues.",
"NaCl furnishes most of the fuel required for cellular activity."
]
},
{
"n": 12,
"stem": "The existence of a substance in more than one physical form is known as:",
"opts": [
"Isotropy",
"Allotropy",
"Amorphism",
"None of the above"
]
},
{
"n": 13,
"stem": "Which one of the solids in the list is a good conductor of electricity?",
"opts": [
"NaCl",
"Diamond",
"Dry ice",
"Graphite"
]
},
{
"n": 14,
"stem": "When ice melts into water, entropy",
"opts": [
"becomes zero.",
"increases.",
"decreases.",
"remains the same."
]
},
{
"n": 15,
"stem": "The process by which new allele of a gene is produced is termed as",
"opts": [
"natural selection.",
"gene flow.",
"genetic drift.",
"mutation."
]
},
{
"n": 16,
"stem": "Blue litmus turns red in a solution of pH",
"opts": [
"below 7",
"at 7",
"above 7",
"at all pH."
]
},
{
"n": 17,
"stem": "The placental barrier between the maternal and foetal blood is minimum in:",
"opts": [
"Goat",
"Pig",
"Cow",
"Man"
]
},
{
"n": 18,
"stem": "Genetic diversity in agricultural crops is threatened by",
"opts": [
"introduction of high yielding varieties.",
"extensive use of fertilizers.",
"extensive intercropping.",
"intensive use of biopesticides."
]
},
{
"n": 19,
"stem": "Desired improved varieties of economically useful crops are raised by:",
"opts": [
"Migration",
"Biofertilisers",
"Hybridisation",
"Natural selection"
]
},
{
"n": 20,
"stem": "The terminator gene technology causes",
"opts": [
"failure of seed setting after one generation.",
"breakage of seed dormancy.",
"early flowering in plants.",
"None of the above"
]
},
{
"n": 21,
"stem": "The element which catches fire in air at 30o C and is stored under water is:",
"opts": [
"Calcium",
"Sodium",
"White Phosphorus",
"Red Phosphorus"
]
},
{
"n": 22,
"stem": "IUPAC name of C2H5CN is:",
"opts": [
"Ethyl cyanide",
"Propane nitrile",
"Acetonitrile",
"Ethane nitrile"
]
},
{
"n": 23,
"stem": "In human body, an organ capable of extensive regeneration is:",
"opts": [
"Heart",
"kidney",
"Liver",
"Spleen"
]
},
{
"n": 24,
"stem": "Bacterium Pseudomonas is useful as it can",
"opts": [
"fix atmospheric nitrogen.",
"transfer gene from one plant to another plant.",
"decompose a variety of organic compounds.",
"produce several antibiotics."
]
},
{
"n": 25,
"stem": "Which one of the following is not a biofertiliser?",
"opts": [
"Agrobacterium",
"Nostoc",
"Rhizobium",
"Mycorrhiza"
]
},
{
"n": 26,
"stem": "The isomers have the same",
"opts": [
"chemical properties.",
"molecular formula.",
"physical properties.",
"structural formula."
]
},
{
"n": 27,
"stem": "The material used in solar cells contains:",
"opts": [
"Cs",
"Si",
"Sn",
"Ti"
]
},
{
"n": 28,
"stem": "On the basis of requirement of light intensity, plants are recognised as",
"opts": [
"Dicotyledonous or monocotyledonous.",
"Hydroponics or aeroponics.",
"Xerophytes or bryophyte.",
"Sciophytes or heliophytes."
]
},
{
"n": 29,
"stem": "Graham’s law is correlated with:",
"opts": [
"Diffusion",
"Osmoregulation",
"Osmosis",
"Absorption"
]
},
{
"n": 30,
"stem": "Which one of the following is used as an antitranspirant?",
"opts": [
"Cobalt chloride",
"Naphthol acetic acid",
"Calcium carbonate",
"Phenyl mercuric acetate"
]
},
{
"n": 31,
"stem": "Identify the plant parts whose transverse section shows a clear and prominent pith.",
"opts": [
"Dicot and monocot stems",
"Dicot stem and monocot root",
"Dicot and mono roots",
"Dicot stem and dicot root"
]
},
{
"n": 32,
"stem": "On heating one end of a piece of a metal, the other end becomes hot because of",
"opts": [
"resistance of a metal.",
"mobility of atoms in the metal.",
"energised electrons moving to the other end.",
"minor perturbation in the energy of atoms."
]
},
{
"n": 33,
"stem": "The tiny air sacs present in human lungs is called:",
"opts": [
"Alveoli",
"Bronchus",
"Bronchioles",
"All of the above"
]
},
{
"n": 34,
"stem": "C-14 has a half-life of 5760 years. 100 mg of a sample of C-14 is reduced to 25 mg in",
"opts": [
"12780 years.",
"1440 years.",
"2890 years.",
"11520 years."
]
},
{
"n": 35,
"stem": "An indicator for iodine titration is:",
"opts": [
"phenolphthalein",
"Cellulose",
"Starch",
"Galactose"
]
},
{
"n": 36,
"stem": "In some plants, anthers and stigma grow and mature at the same time. This phenomenon is called:",
"opts": [
"Homogamy",
"Allogamy",
"Fusion",
"Syngamy"
]
},
{
"n": 37,
"stem": "The outermost layer of maize endosperm is known as:",
"opts": [
"Perisperm",
"Endothecium",
"Aleurone",
"Tapetum"
]
},
{
"n": 38,
"stem": "Alkaline hydrolysis of an ester is called:",
"opts": [
"Neutralization",
"Esterification",
"Polymerization",
"Saponification"
]
},
{
"n": 39,
"stem": "Which one of the following is not true about the polymers?",
"opts": [
"Polymers do not carry any charge",
"Polymers have low molecular weight",
"Polymers scatter light",
"None of the above"
]
},
{
"n": 40,
"stem": "Transfer of pollen grains from the anther to the stigma of another flower of the same plant is called_________________.",
"opts": [
"Autogamy",
"Karyogamy",
"Geitonogamy",
"Xenogamy"
]
},
{
"n": 41,
"stem": "What is the function of germ pore?",
"opts": [
"Release of male gametes",
"Emergence of radical",
"Absorption of water for seed germination",
"Initiation of pollen tube"
]
},
{
"n": 42,
"stem": "Which accessory genital gland occurs only in mammalian male?",
"opts": [
"Prostate gland",
"Perineal gland",
"Cowper’s gland",
"Bartholin gland"
]
},
{
"n": 43,
"stem": "Haeckel’s theory of recapitulation means that",
"opts": [
"Ontogeny repeats phylogeny.",
"Progeny of an organism resembles its parents.",
"All organisms begin their life from one cell.",
"Regeneration"
]
},
{
"n": 44,
"stem": "“The ratio of the concentration of a solute between two liquid phases is constant at a given temperature.” This statement is called:",
"opts": [
"Kirchoff’s law",
"Henry’s law",
"Distribution law",
"Raoult’s law"
]
},
{
"n": 45,
"stem": "The pigment involved in photomorphogenetic movement is:",
"opts": [
"Cytochrome",
"Phytochrome",
"Chromatin",
"Vernalin"
]
},
{
"n": 46,
"stem": "The flowers of Oxalis open during the day and close at night. Such type of movement is:",
"opts": [
"Photnastic",
"Nyctinasty",
"Photonasty",
"Seismonastic"
]
},
{
"n": 47,
"stem": "Volume of water needed to mix with 10 ml of 10 N HNO3 to get 0.1 N HNO3 is:",
"opts": [
"10 ml",
"990 ml",
"1000 ml",
"1010 ml"
]
},
{
"n": 48,
"stem": "Which of the following is considered to be the best chemical method of fixing atmospheric nitrogen?",
"opts": [
"Fisher method",
"Haber-Bosch method",
"Decan method",
"Parnas-Meyerhoff method"
]
},
{
"n": 49,
"stem": "In leaves of C4 plants, malic acid synthesis during carbon dioxide fixation occurs in:",
"opts": [
"Epidermal cells",
"Guard cells",
"Mesophyll cells",
"Bundle sheath cells"
]
},
{
"n": 50,
"stem": "Which of the following help in blood coagulation?",
"opts": [
"Leucocytes",
"Monocytes",
"Lymphocytes",
"Thrombocytes"
]
},
{
"n": 51,
"stem": "A mixture which boils off like a single pure compound is called:",
"opts": [
"Eutectic",
"Azeotrope",
"Ideal solution",
"Saturated solution"
]
},
{
"n": 52,
"stem": "Evolutionary history of an organism is known as:",
"opts": [
"Ancestry",
"Palaeontology",
"Ontology",
"Phylogeny"
]
},
{
"n": 53,
"stem": "Which one of the following theories was propose by Weismann?",
"opts": [
"Theory of natural selection",
"Law of inheritance",
"Theory of germplasm",
"Theory of inheritance of acquired characters"
]
},
{
"n": 54,
"stem": "The modern man differs from the apes in:",
"opts": [
"Protruding eyes",
"Spare body hair",
"Wearing of clothes",
"Arms shorter than legs"
]
},
{
"n": 55,
"stem": "The scientific name of Java man is_________________.",
"opts": [
"Homo habilis",
"Homo sapiens neanderthalensis",
"Homo erectus erectus",
"Australopithecus boisei"
]
},
{
"n": 56,
"stem": "In tissue culture, which one of the following pairs of substances is used to induce shoot formation and root formation respectively during organogenesis?",
"opts": [
"Auxins and Cytokinins",
"Cytokinins and auxins",
"Ethylene and abscisic acid",
"Hydrogen peroxide and chlorine"
]
},
{
"n": 57,
"stem": "Which term is used to describe the component isolated from a plant for in vitro culture?",
"opts": [
"Callus",
"Embryoid",
"Explant",
"None of the above"
]
},
{
"n": 58,
"stem": "Aflatoxin is produced by:",
"opts": [
"Bacterium",
"Fungus",
"Virus",
"Mosquitoes"
]
},
{
"n": 59,
"stem": "In AIDS, which of these cells are most affected?",
"opts": [
"B-cells",
"T-cells",
"Monocytes",
"Neutrophils"
]
},
{
"n": 60,
"stem": "Which of the following liquids would possess the highest vapour pressure at room temperature?",
"opts": [
"Acetic acid (b.p. 118o C)",
"Chlorobenzene (b.p. 132o C)",
"Methyl alcohol (b.p. 65o C)",
"Nitrobenzene (b.p. 212o C)"
]
},
{
"n": 61,
"stem": "A chemical substance produced by a microorganism for inhibiting the growth of another is:",
"opts": [
"Antibody",
"Antibiotic",
"Antiallergic",
"Aflatoxin"
]
},
{
"n": 62,
"stem": "Improvement of human race through hereditary qualities is called:",
"opts": [
"Euthenics",
"Human hereditary",
"Human demography",
"Eugenics"
]
},
{
"n": 63,
"stem": "The drug useful to increase cardiovascular effects in human being is:",
"opts": [
"Cocaine",
"Benzodiazepine",
"Barbiturate",
"Insulin"
]
},
{
"n": 64,
"stem": "Volume of 0.6 M NaOH required to neutralise 30 cm3 of 0.4 M HCl is:",
"opts": [
"10 cm3",
"20 cm3",
"30 cm3",
"40 cm3"
]
},
{
"n": 65,
"stem": "Morphine, which is used as analgesic is obtained from:",
"opts": [
"Cinchona officinalis",
"Papaver somniferum",
"Taxus brevifolia",
"Berberis nilghiriensis"
]
},
{
"n": 66,
"stem": "Which one of the following is surrounded by a callose wall?",
"opts": [
"Male gamete",
"Egg",
"Pollen",
"Microspore mother cell"
]
},
{
"n": 67,
"stem": "Which part of our body secrets the hormone secretin?",
"opts": [
"Ileum",
"Stomach",
"Duodenum",
"Oesophagus"
]
},
{
"n": 68,
"stem": "Uric acid is the chief nitrogenous component of the excretory product of:",
"opts": [
"Earthworm",
"Frog",
"Man",
"Cockroach"
]
},
{
"n": 69,
"stem": "Vitamin-D is synthesized in skin by the action of sunlight on:",
"opts": [
"Cholesterol",
"7-hydroxy cholesterol",
"Cephalin cholesterol",
"All of the above"
]
},
{
"n": 70,
"stem": "The minerals involved in water-splitting reaction during photosynthesis are",
"opts": [
"copper and chlorine.",
"magnesium and chlorine.",
"manganese and chlorine.",
"potassium and chlorine."
]
}
]"""

KEY = {
    1: ("b", "Sugarcane is a C4 plant and among the most efficient converters of solar energy into biomass."),
    2: ("c", "In a hypotonic solution water enters the red cell by osmosis until it bursts (haemolysis)."),
    3: ("d", "Both are ethers with the same formula but different alkyl groups on the oxygen - metamerism."),
    5: ("a", "Chlorophyll is located in the thylakoid membranes of the grana."),
    6: ("c", "The air that always remains in the lungs after maximum expiration is the residual volume (about 1000-1200 ml)."),
    7: ("b", "The spleen stores blood and red cells, acting as a blood reservoir."),
    8: ("b", "4.0 g NaOH = 0.1 mol (= 0.1 equivalent) in 0.1 L gives 1.0 N."),
    9: ("a", "Frederick Soddy discovered isotopes (Nobel Prize 1921)."),
    10: ("b", "Pulmocutaneous veins bring oxygenated blood back from the lungs and skin of the frog."),
    11: ("c", "Cholera causes heavy loss of water and salts; Na+ helps retain water in the body tissues."),
    12: ("b", "Existence of an element in more than one physical form is allotropy (e.g. diamond and graphite)."),
    13: ("d", "Graphite conducts electricity through its delocalised electrons."),
    14: ("b", "Melting increases disorder, so entropy increases."),
    15: ("d", "New alleles arise only by mutation."),
    16: ("a", "Blue litmus turns red in acidic solutions (pH below 7)."),
    17: ("d", "Humans have a haemochorial placenta, with the thinnest barrier between maternal and foetal blood."),
    18: ("a", "Replacing many local varieties with a few high-yielding varieties narrows crop genetic diversity."),
    19: ("c", "Improved crop varieties are produced by hybridisation followed by selection."),
    20: ("a", "Terminator (GURT) technology makes seeds of the next generation sterile."),
    21: ("c", "White phosphorus ignites in air at about 30 °C, so it is stored under water."),
    24: ("c", "Pseudomonas can break down a wide variety of organic compounds, including pollutants."),
    25: ("a", "Agrobacterium causes crown gall and is used in genetic engineering; it is not a biofertiliser."),
    26: ("b", "Isomers have the same molecular formula but different structures and properties."),
    27: ("b", "Solar cells are made mainly of silicon."),
    28: ("d", "By light need, plants are sciophytes (shade-loving) or heliophytes (sun-loving)."),
    30: ("d", "Phenyl mercuric acetate closes stomata and is used as an antitranspirant."),
    31: ("b", "Dicot stems and monocot roots have a large, prominent pith."),
    32: ("c", "Free (energised) electrons carry heat quickly through a metal."),
    33: ("a", "The tiny air sacs of the lungs are the alveoli."),
    34: ("d", "100 mg → 25 mg is two half-lives: 2 × 5760 = 11,520 years."),
    35: ("c", "Starch gives a blue colour with iodine, so it is the indicator in iodine titrations."),
    36: ("a", "When anthers and stigma mature at the same time the condition is homogamy."),
    37: ("c", "The outer protein-rich layer of maize endosperm is the aleurone layer."),
    38: ("d", "Alkaline hydrolysis of an ester is saponification."),
    39: ("b", "Polymers have high, not low, molecular weights."),
    40: ("c", "Pollination between flowers of the same plant is geitonogamy."),
    43: ("a", "Recapitulation: ontogeny (development) repeats phylogeny (evolutionary history)."),
    45: ("b", "Phytochrome controls light-regulated (photomorphogenic) responses."),
    47: ("b", "N1V1 = N2V2: 10 × 10 = 0.1 × V2, so V2 = 1000 ml; add 1000 − 10 = 990 ml of water."),
    49: ("c", "In C4 plants oxaloacetate is reduced to malate in the mesophyll cells and then sent to the bundle sheath."),
    52: ("d", "The evolutionary history of an organism is its phylogeny."),
    53: ("c", "Weismann proposed the theory of continuity of germplasm."),
    55: ("c", "Java man is Homo erectus erectus."),
    56: ("b", "High cytokinin to auxin induces shoots; high auxin to cytokinin induces roots."),
    58: ("b", "Aflatoxin is a toxin from the fungus Aspergillus flavus."),
    59: ("b", "HIV destroys helper T cells (CD4)."),
    61: ("b", "An antibiotic is a substance made by one microbe that inhibits others."),
    62: ("d", "Eugenics aims to improve the human race through heredity."),
    63: ("a", "Cocaine is a stimulant that raises heart rate and blood pressure."),
    66: ("d", "Microspore mother cells (and tetrads) are surrounded by a callose wall."),
    68: ("d", "Insects such as the cockroach are uricotelic: uric acid is their main nitrogenous waste."),
    70: ("c", "Manganese and chloride ions are needed for splitting water in photosystem II."),
}

NEW_MCQ = [
    ("Which gland secretes the fluid that forms the largest part of human semen?", ["Prostate gland", "Seminal vesicles", "Cowper's gland", "Thyroid gland"], "b",
     "The seminal vesicles contribute about 60-70% of semen volume, including fructose for the sperm."),
    ("The folding of Mimosa pudica leaves when touched is an example of", ["Phototropism", "Seismonasty", "Geotropism", "Chemotaxis"], "b",
     "Seismonasty is a non-directional movement in response to touch or shock."),
    ("Which feature is found in humans but not in apes?", ["Opposable thumb", "Larger brain with a high, rounded skull", "Ability to climb trees", "Presence of hair"], "b",
     "Humans have a much larger brain (about 1350 cc) with a high, rounded skull; apes also have opposable thumbs and hair."),
    ("Vitamin D is formed in the human skin from", ["7-dehydrocholesterol", "Carotene", "Tryptophan", "Glycogen"], "a",
     "UV-B light converts 7-dehydrocholesterol in the skin into vitamin D3."),
]

SAQ = [
 dict(marks=3, stem="Define hybridisation in crop improvement. What are the types of hybridisation? (3 marks)",
      kp=[("Definition: crossing of two or more genetically different plants to combine desirable characters in the progeny (F1 hybrid)", 1),
          ("Types by relationship: intravarietal, intervarietal (intraspecific), interspecific (within genus), intergeneric (distant/ wide hybridisation)", 2)],
      model="Hybridisation in crop improvement is the crossing (mating) of two or more genetically different parents to bring their desirable characters together in the offspring and to create variation for selection. Types, based on the relationship of the parents: (1) intravarietal - between plants of the same variety; (2) intervarietal (intraspecific) - between two varieties of the same species, e.g. two rice varieties; (3) interspecific - between two species of the same genus, e.g. Gossypium hirsutum × G. arboreum; (4) intergeneric - between two genera, e.g. Triticale from wheat × rye. Interspecific and intergeneric crosses are called distant or wide hybridisation."),
 dict(marks=3, stem="Calculate the molality of one litre of 93% H2SO4 solution (w/v). The density of the solution is 1.84 g per ml. (3 marks)",
      kp=[("93% w/v: 93 g H2SO4 per 100 ml, so 930 g in 1 L = 930/98 = 9.49 mol", 1), ("Mass of 1 L solution = 1000 × 1.84 = 1840 g; mass of water = 1840 − 930 = 910 g = 0.910 kg", 1),
          ("Molality = 9.49 / 0.910 ≈ 10.4 mol/kg", 1)],
      model="93% (w/v) means 93 g of H2SO4 in 100 ml of solution, so 1 litre contains 930 g. Moles of H2SO4 = 930 ÷ 98 = 9.49 mol. Mass of 1 litre of solution = 1000 ml × 1.84 g/ml = 1840 g, so the mass of solvent (water) = 1840 − 930 = 910 g = 0.910 kg. Molality = moles of solute ÷ kg of solvent = 9.49 ÷ 0.910 ≈ 10.4 m (10.43 mol/kg)."),
 dict(marks=3, stem="From which chemical compound are all steroid hormones derived? Name the steroid hormones secreted by Leydig cells of the testes and by the adrenal cortex. (3 marks)",
      kp=[("All steroid hormones are derived from cholesterol", 1), ("Leydig (interstitial) cells: testosterone (androgens)", 1),
          ("Adrenal cortex: aldosterone (mineralocorticoids), cortisol/ corticosterone (glucocorticoids) and small amounts of sex hormones (androgens)", 1)],
      model="All steroid hormones are made from cholesterol. The Leydig (interstitial) cells of the testes secrete androgens, mainly testosterone. The adrenal cortex secretes mineralocorticoids (mainly aldosterone, from the zona glomerulosa), glucocorticoids (mainly cortisol and corticosterone, from the zona fasciculata) and small amounts of sex hormones (androgens such as DHEA, from the zona reticularis)."),
 dict(marks=3, stem="How does the progeny formed from asexual reproduction differ from that formed by sexual reproduction? (3 marks)",
      kp=[("Asexual progeny come from one parent without fusion of gametes, so they are genetically identical to the parent (clones)", 1),
          ("Sexual progeny come from fusion of gametes of two parents (meiosis, crossing over, recombination), so they show genetic variation and differ from the parents", 1),
          ("Consequence: variation in sexual progeny helps adaptation and evolution; asexual progeny are uniform and preserve parental traits", 1)],
      model="Progeny from asexual reproduction come from a single parent by mitosis, without formation and fusion of gametes, so they are genetically identical to the parent and to each other (clones), with variation only from rare mutations. Progeny from sexual reproduction come from the fusion of male and female gametes from two parents; meiosis, crossing over and random fertilisation shuffle the genes, so the offspring are genetically different from both parents and from each other. This variation helps sexually produced populations adapt to changing environments and drives evolution, while asexual reproduction preserves desirable traits unchanged."),
 dict(marks=3, stem="When and why does the leghaemoglobin pigment develop in leguminous plants? Where is it located? (3 marks)",
      kp=[("When: develops in root nodules formed after infection of legume roots by Rhizobium (symbiotic nitrogen fixation)", 1),
          ("Why: nitrogenase is inactivated by oxygen; leghaemoglobin binds O2 and keeps the nodule interior low in free oxygen while supplying O2 for bacterial respiration", 1),
          ("Location: in the cytoplasm of infected cells of the root nodule (around bacteroids), giving nodules a pink/ red colour", 1)],
      model="Leghaemoglobin develops when Rhizobium bacteria infect the roots of leguminous plants and root nodules form for symbiotic nitrogen fixation. It is needed because the nitrogen-fixing enzyme nitrogenase is quickly destroyed by oxygen; leghaemoglobin, an oxygen-carrying pigment like haemoglobin, binds free oxygen and keeps its concentration low inside the nodule, while still delivering enough oxygen for the bacteroids to respire and make ATP. It is located in the cytoplasm of the infected cells of the root nodules, surrounding the bacteroids, and gives active nodules their pink-red colour."),
 dict(marks=3, stem="Why is transpiration considered to be a necessary evil in plants? (3 marks)",
      kp=[("'Evil': loss of large amounts of absorbed water (about 98-99%), causing wilting and reduced growth/ yield when water is short", 1),
          ("'Necessary': creates transpiration pull for ascent of sap and mineral transport, cools leaves, keeps cells turgid/ distributes water", 1),
          ("It is unavoidable because stomata must open for CO2 intake in photosynthesis - hence a 'necessary evil' (Curtis)", 1)],
      model="Transpiration is called a necessary evil (Curtis). It is an 'evil' because plants lose most (about 98-99%) of the water they absorb through it; when water is scarce this causes wilting, closes stomata and reduces growth and yield, and the plant wastes energy absorbing water. It is 'necessary' because it creates the transpiration pull that lifts water and dissolved minerals from roots to leaves, cools the leaves by evaporation and helps maintain turgidity and distribution of water. It is also unavoidable, because stomata must open to take in CO2 for photosynthesis, and water vapour inevitably escapes through them."),
 dict(marks=3, stem="Amylase is secreted by two different glands. (a) Name the glands. (b) What is the difference between the two amylases? (3 marks)",
      kp=[("(a) Salivary glands (salivary amylase/ ptyalin) and pancreas (pancreatic amylase/ amylopsin)", 1),
          ("(b) Salivary amylase acts in the mouth at about pH 6.8, digests only about 30% of starch; inactivated by stomach acid", 1),
          ("Pancreatic amylase acts in the small intestine (duodenum) at about pH 7.5-8, digests the remaining starch and glycogen to maltose", 1)],
      model="(a) Amylase is secreted by the salivary glands (salivary amylase or ptyalin) and by the pancreas (pancreatic amylase or amylopsin). (b) Salivary amylase works in the mouth at about pH 6.8; because food stays there briefly, it digests only about 30% of the starch into maltose, and it is inactivated by the acid in the stomach. Pancreatic amylase is poured into the duodenum and works in the small intestine at a slightly alkaline pH (about 7.5-8); it completes the breakdown of the remaining starch and glycogen (cooked and raw) into maltose."),
 dict(marks=3, stem="What are biofertilisers? Legumes fertilise the soil but cereals do not. Why? (3 marks)",
      kp=[("Biofertilisers: living micro-organisms (bacteria, cyanobacteria, fungi) that enrich soil nutrients - e.g. Rhizobium, Azotobacter, Anabaena/ Nostoc, mycorrhiza", 1),
          ("Legumes have root nodules with symbiotic Rhizobium that fix atmospheric nitrogen into ammonia; residues and nodules add nitrogen to soil", 1),
          ("Cereals have no such nodules/ symbiotic nitrogen-fixers, so they only take nitrogen from the soil and deplete it", 1)],
      model="Biofertilisers are living micro-organisms that increase the availability of nutrients to plants and enrich the soil, such as nitrogen-fixing bacteria (Rhizobium, Azotobacter, Azospirillum), cyanobacteria (Anabaena, Nostoc), phosphate-solubilising bacteria and mycorrhizal fungi. Legumes enrich the soil because their roots form nodules containing symbiotic Rhizobium bacteria, which fix atmospheric nitrogen into ammonia using nitrogenase; some of this nitrogen is left in the soil through root exudates, decaying nodules and crop residues. Cereals do not form such nodules or symbioses with nitrogen-fixing bacteria, so they cannot fix nitrogen and instead remove nitrogen from the soil."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
