"""ME Technical Paper II (General Subject Knowledge), BIO SCIENCE group, BCSE 2025 - real paper. PDF sent by the founder.
Pattern: Part I 70 multiple choice x 1 mark; Part II 10 short answers x 3 marks (all compulsory). 90 min + 15 min reading.
Left out (answer not certain): MCQ 17 (electron flow in an electrolytic cell - options ambiguous), 54 (desired plant
breed), 63 (fish growth pair); three new MCQs of the same kind keep Part I at 70.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Bio Science): BCSE 2025, batch 1"
GROUP_TAG = "biosci2025"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "bio-science"
MIN_WORDS = 0
GROUP_TIMING = {"duration": 90, "reading": 15, "max_marks": 100}
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper II, Bio Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Bio Science: general subject knowledge"

MCQ = """[
{
"n": 1,
"stem": "In monocot roots, which type of vascular bundles are found?",
"opts": [
"Collateral, conjoint and closed",
"Radial with exarch xylem",
"Bicollateral, conjoint and closed",
"Radial with endarch xylem"
]
},
{
"n": 2,
"stem": "The inner, darker and harder portions of secondary xylem that cannot conduct water in an older dicot stem is called:",
"opts": [
"Alburnam",
"Bast",
"Wood",
"Duramen"
]
},
{
"n": 3,
"stem": "Which of the following is not a characteristic feature of bryophytes?",
"opts": [
"Vascular tissues",
"Amphibious habitat",
"Dominant gametophytic generation",
"Filamentous rhizoids"
]
},
{
"n": 4,
"stem": "Which type of movement is present in Mimosa pudica?",
"opts": [
"Nyctinastic",
"Chemonastic",
"Seismonastic",
"Phototropic"
]
},
{
"n": 5,
"stem": "Importance of day length in flowering of plants was first shown in:",
"opts": [
"Lemna",
"Tobacco",
"Cotton",
"Petunia"
]
},
{
"n": 6,
"stem": "Which of the following induces flowering in long day plants?",
"opts": [
"Gibberellins",
"Ethylene",
"Auxin",
"Cytokinin"
]
},
{
"n": 7,
"stem": "The deteriorative processes in plants that naturally terminate their functional life are collectively called:",
"opts": [
"Wilting",
"Plasmolysis",
"Senescence",
"Abscission"
]
},
{
"n": 8,
"stem": "The type of placenta found in human beings is called:",
"opts": [
"Diffuse",
"Zonary",
"Cotyledonary",
"Discoidal"
]
},
{
"n": 9,
"stem": "The embryo at 16-celled stage is known as:",
"opts": [
"Morula",
"Gastrula",
"Blastula",
"Blastomere"
]
},
{
"n": 10,
"stem": "A common scent-producing gland among mammals is:",
"opts": [
"Anal gland",
"Prostate gland",
"Adrenal gland",
"Bartholin’s gland"
]
},
{
"n": 11,
"stem": "4.0 g of NaOH is dissolved in 100 ml of distilled water. The normality of the solution is:",
"opts": [
"0.1 N",
"0.5 N",
"0.2 N",
"1.0 N"
]
},
{
"n": 12,
"stem": "In a reversible reaction, rates of both sides of a reaction are:",
"opts": [
"Same",
"Different",
"Product side more",
"Reactant side more"
]
},
{
"n": 13,
"stem": "The rate of chemical reaction does not depend upon:",
"opts": [
"Catalyst",
"Pressure",
"Concentration",
"Temperature"
]
},
{
"n": 14,
"stem": "Which part of ovary in mammals acts as an endocrine gland after ovulation?",
"opts": [
"Vitelline membrane",
"Graafian follicle",
"Stroma",
"Germinal epithelium"
]
},
{
"n": 15,
"stem": "Bartholin’s gland of female corresponds to which glands in male?",
"opts": [
"Prostate glands",
"Rectal glands",
"Cowper’s glands",
"Inguinal glands"
]
},
{
"n": 16,
"stem": "Faraday’s laws of electrolysis are related to the:",
"opts": [
"Atomic number of the cation",
"Atomic number of the anion",
"Speed of the cation",
"Equivalent weight of the electrolyte"
]
},
{
"n": 17,
"stem": "In the electrolytic cell, flow of electrons is from:",
"opts": [
"Cathode to anode in solution",
"Cathode to anode through external supply",
"Cathode to anode through internal supply",
"Anode to cathode through internal supply"
]
},
{
"n": 18,
"stem": "In human body, an organ capable of extensive regeneration is:",
"opts": [
"Kidney",
"Liver",
"Thymus",
"Spleen"
]
},
{
"n": 19,
"stem": "Growth at the end of childhood and during puberty is controlled by:",
"opts": [
"Thyroxin",
"Thymosin",
"Somatotropic hormone",
"Thyroxin and somatotropic hormones"
]
},
{
"n": 20,
"stem": "Which is common to kidney and skeleton in mammals?",
"opts": [
"Cortex",
"Medulla",
"Pelvis",
"Radius"
]
},
{
"n": 21,
"stem": "Which one is the weakest base?",
"opts": [
"NH3",
"CH3NH2",
"(C2H5)2NH",
"(CH3)3N"
]
},
{
"n": 22,
"stem": "Which of the following is obtained when an alkyl halide reacts with alcoholic silver cyanide?",
"opts": [
"Alkyl cyanide",
"Alkanamine",
"Alkane",
"Carbylamine"
]
},
{
"n": 23,
"stem": "The vascular cambial ring of dicot stem is:",
"opts": [
"Primary in origin",
"Secondary in origin",
"Embryonic in origin",
"Partly primary and partly secondary in origin"
]
},
{
"n": 24,
"stem": "Which is NOT a characteristic of plant cell walls?",
"opts": [
"Found only in the sporophyte phase of life cycle",
"Among other compounds contain compounds built of simple sugars",
"May contain enzymes that are biologically active",
"Often contain strengthening polymers"
]
},
{
"n": 25,
"stem": "Substitution reactions of benzene are mainly:",
"opts": [
"Free radical",
"Electrophilic",
"Nucleophilic",
"None of the above"
]
},
{
"n": 26,
"stem": "Which of the following monosaccharides is a pentose?",
"opts": [
"Glucose",
"Fructose",
"Arabinose",
"Galactose"
]
},
{
"n": 27,
"stem": "Stroma in the chloroplasts of higher plants contains:",
"opts": [
"Light-independent reaction enzymes",
"Light -dependent reaction enzymes",
"Ribosomes",
"Chlorophyll"
]
},
{
"n": 28,
"stem": "Which of the following is a branched chain structure?",
"opts": [
"Amylose",
"Amylopectin",
"Cellulose",
"Nylon"
]
},
{
"n": 29,
"stem": "The name of Norman Borloug is associated with:",
"opts": [
"White revolution",
"Green revolution",
"Yellow revolution",
"Blue revolution"
]
},
{
"n": 30,
"stem": "In CAM-plants, carbon dioxide acceptor is:",
"opts": [
"RuBP",
"PGA",
"PEP",
"OAA"
]
},
{
"n": 31,
"stem": "Hexose monophosphate pathway takes place in:",
"opts": [
"Endoplasmic reticulum",
"Cristae",
"Mitochondrial matrix",
"Cytoplasm"
]
},
{
"n": 32,
"stem": "A solution of ethanol in water forms:",
"opts": [
"An ideal solution",
"Conjugate solution",
"Minimum boiling azeotrope",
"Maximum boiling azeotrope"
]
},
{
"n": 33,
"stem": "“The ratio of the concentration of a solute between two liquid phases is constant at a given temperature.” This statement is called:",
"opts": [
"Henry’s law",
"Raoult’s law",
"Kirchoff’s law",
"Distribution law"
]
},
{
"n": 34,
"stem": "Wind pollination is common in:",
"opts": [
"Legumes",
"Lilies",
"Grasses",
"Orchids"
]
},
{
"n": 35,
"stem": "One of the most resistant known biological materials is:",
"opts": [
"Lignin",
"Hemicellulose",
"Lignocellulose",
"Sporopollenin"
]
},
{
"n": 36,
"stem": "Which of the following is not vestigial organ in human?",
"opts": [
"Tail vertebrae",
"Nails",
"Nictitating membrane",
"Vermiform appendix"
]
},
{
"n": 37,
"stem": "The α-D-glucose and β-D-glucose differ from each other due to difference in carbon atom with respect to its:",
"opts": [
"Conformation",
"Configuration",
"Number of OH groups",
"None of the above"
]
},
{
"n": 38,
"stem": "Distribution law was given by:",
"opts": [
"Van’t Hoff",
"Raoult",
"Nernst",
"Zigmondy"
]
},
{
"n": 39,
"stem": "In thin layer chromatography, stationary phase is:",
"opts": [
"Liquid",
"Gas",
"Filter paper",
"Solid"
]
},
{
"n": 40,
"stem": "In callus culture, roots can be induced by supply of:",
"opts": [
"Auxin",
"Cytokinin",
"Gibberellin",
"Ethylene"
]
},
{
"n": 41,
"stem": "Which term is used to describe the component isolated from a plant for in vitro culture?",
"opts": [
"Callus",
"Embryoid",
"Synthetic seed",
"Explant"
]
},
{
"n": 42,
"stem": "Which of the following is not a colligative property?",
"opts": [
"Elevation in boiling point",
"Osmotic pressure",
"Optical activity",
"Relative lowering of vapour pressure"
]
},
{
"n": 43,
"stem": "Carbon-14 dating method is based on the fact that:",
"opts": [
"Carbon-14 fraction is same in all objects",
"Carbon-14 is highly insoluble",
"Ratio of carbon-14 and carbon-12 is constant",
"All the above"
]
},
{
"n": 44,
"stem": "Amphivasal vascular bundle possesses:",
"opts": [
"Xylem around phloem",
"Phloem around xylem",
"Phloem on both sides of xylem",
"Phloem towards centre and xylem towards periphery"
]
},
{
"n": 45,
"stem": "Which tissues gives rise to secondary growth?",
"opts": [
"Apical meristem",
"Adventitious roots",
"Germinating seed",
"Vascular cambium"
]
},
{
"n": 46,
"stem": "Ontology recapitulates phylogeny. This theory is called:",
"opts": [
"Biogenetic law",
"Law of embryology",
"Law of acquired characters",
"Law of bridges"
]
},
{
"n": 47,
"stem": "Organisms called Methanogens are most abundant in a",
"opts": [
"sulphur rock.",
"cattle yard.",
"polluted stream.",
"hot spring."
]
},
{
"n": 48,
"stem": "Reagent which reacts with both acetaldehyde and acetone is:",
"opts": [
"Fehling",
"Grignard",
"Schiff’s",
"Tollen’s"
]
},
{
"n": 49,
"stem": "The action of nitrous acid on an aliphatic primary amine gives:",
"opts": [
"Alcohol",
"Alkyl nitrite",
"Secondary amine",
"Nitro alkane"
]
},
{
"n": 50,
"stem": "Energy is produced in a nuclear reactor by:",
"opts": [
"Controlled fusion",
"Uncontrolled fusion",
"Controlled fission",
"Uncontrolled fission"
]
},
{
"n": 51,
"stem": "The process of decay of dead organic matter is known as:",
"opts": [
"Denitrification",
"Nitrification",
"Nitrogen fixation",
"Ammonification"
]
},
{
"n": 52,
"stem": "Which of the following metals causes harmful effects:",
"opts": [
"Lead",
"Arsenic",
"Uranium",
"All of these metals"
]
},
{
"n": 53,
"stem": "Somatic hybridisation can be done by:",
"opts": [
"Protoplast fusion",
"Haploid anther",
"Cell culture",
"Pollen culture"
]
},
{
"n": 54,
"stem": "The following is used to get desired breed of plants:",
"opts": [
"Tissue culture",
"Genetic engineering",
"Inbreeding",
"None of the above"
]
},
{
"n": 55,
"stem": "The undifferentiated cells in the adult which retain the power to divide are called:",
"opts": [
"Meristematic cells",
"Postmitotic cells",
"Stem cells",
"All the above"
]
},
{
"n": 56,
"stem": "An α-particle is identical with:",
"opts": [
"Proton",
"Neutron",
"Electron",
"Helium nucleus"
]
},
{
"n": 57,
"stem": "Which of the following does not contain volume?",
"opts": [
"Molarity",
"Molality",
"Normality",
"Formality"
]
},
{
"n": 58,
"stem": "The mechanism of regeneration in which body parts are regenerated through the proliferation of cells is:",
"opts": [
"Reparative regeneration",
"Restorative regeneration",
"Epimorphosis",
"Morphallaxis"
]
},
{
"n": 59,
"stem": "Transfer of pollen grains from one flower to another flower of same plant is:",
"opts": [
"Geitonogamy",
"Autogamy",
"Allogamy",
"Cleistogamy"
]
},
{
"n": 60,
"stem": "Oxygenic photosynthesis occurs in:",
"opts": [
"Chromatium",
"Oscillatoria",
"Rhodospirillum",
"Chlorobium"
]
},
{
"n": 61,
"stem": "The pH of 1.0 x 10-4 M solution of HCl is:",
"opts": [
"6",
"5",
"4",
"3"
]
},
{
"n": 62,
"stem": "NH3 dissolves in H2O to give NH4OH. In this reaction water acts as:",
"opts": [
"An acid",
"A base",
"A salt",
"A conjugate base"
]
},
{
"n": 63,
"stem": "Which pair is essential for the growth of fish in water?",
"opts": [
"Nitrates and sulphates",
"Sulphonates and carbonates",
"Calcium and phosphorus",
"Carbonates and phosphates"
]
},
{
"n": 64,
"stem": "Which of the following cell organelles is associated with photorespiration?",
"opts": [
"Mitochondria",
"Peroxisome",
"Chloroplast",
"All the above"
]
},
{
"n": 65,
"stem": "Process of vernalisation can be induced by:",
"opts": [
"Cytokinin l",
"Auxin",
"Ethylene",
"Gibberellic acid"
]
},
{
"n": 66,
"stem": "An apparatus used for the measurement of quantity of electricity is known as:",
"opts": [
"Calorimeter",
"Cathetometer",
"Coulometer",
"Colorimeter"
]
},
{
"n": 67,
"stem": "The high density of water compared to ice is due to:",
"opts": [
"Hydrogen bonding interaction",
"Dipole-dipole interaction",
"Dipole induced dipole interaction",
"Induced-dipole induced dipole interaction"
]
},
{
"n": 68,
"stem": "Which of the following is bacterium involved in denitrification?",
"opts": [
"Nitrosomonas",
"Pseudomonas",
"Azotobacter",
"Nitrobacter"
]
},
{
"n": 69,
"stem": "Haemophilia is more commonly seen in human males than in human females because:",
"opts": [
"This disease is due to an X-linked dominant mutation",
"This disease is due to Y-lined recessive mutation",
"This disease is due to an X-linked recessive mutation",
"This disease is due to Y-linked dominant mutation"
]
},
{
"n": 70,
"stem": "Which of the following is the formula of chlorophyll a?",
"opts": [
"C55H77O2N4Mg",
"C55H72O5N4Mg",
"C45H70O5N4Mg",
"C55H72O2N4Mg"
]
}
]"""

KEY = {
 1: ("b", "Monocot roots have radial bundles with exarch xylem (protoxylem towards the periphery)."),
 2: ("d", "Heartwood (duramen) is the dark, hard, non-conducting inner secondary xylem."),
 3: ("a", "Bryophytes lack true vascular tissues (xylem and phloem)."),
 4: ("c", "Mimosa pudica folds its leaves in response to touch: seismonasty."),
 5: ("b", "Garner and Allard (1920) discovered photoperiodism in Maryland Mammoth tobacco."),
 6: ("a", "Gibberellins can induce flowering in long-day plants under non-inductive conditions."),
 7: ("c", "Senescence is the natural deterioration that ends the functional life of plant parts."),
 8: ("d", "The human placenta is discoidal (disc-shaped, haemochorial)."),
 9: ("a", "The solid ball of 8-16 cells is the morula."),
 10: ("a", "Anal (scent) glands are the commonest scent-producing glands in mammals."),
 11: ("d", "4 g NaOH = 0.1 mol in 0.1 L = 1 M; NaOH is monoacidic, so 1 N."),
 12: ("a", "At equilibrium the forward and backward rates are equal."),
 13: ("b", "For reactions in solution, rate depends on concentration, temperature and catalyst, not on pressure."),
 14: ("b", "After ovulation the Graafian follicle becomes the corpus luteum, which secretes progesterone."),
 15: ("c", "Bartholin's glands in females correspond to Cowper's (bulbourethral) glands in males."),
 16: ("d", "Mass deposited is proportional to the equivalent weight (Faraday's second law)."),
 18: ("b", "The liver can regenerate extensively."),
 19: ("d", "Growth at puberty is controlled by both thyroxine and growth (somatotropic) hormone."),
 20: ("c", "Both have a pelvis: renal pelvis and pelvic girdle."),
 21: ("a", "Alkyl groups increase electron density on nitrogen, so NH3 is the weakest base here."),
 22: ("d", "AgCN is covalent and attacks through nitrogen, giving an isocyanide (carbylamine)."),
 23: ("d", "Fascicular cambium is primary, interfascicular cambium is secondary in origin."),
 24: ("a", "Cell walls are present in all plant cells, not only in the sporophyte."),
 25: ("b", "Benzene undergoes electrophilic substitution (nitration, halogenation, etc.)."),
 26: ("c", "Arabinose has five carbons (pentose); the others are hexoses."),
 27: ("a", "The stroma contains the Calvin-cycle (light-independent) enzymes."),
 28: ("b", "Amylopectin is branched (alpha-1,6 links); amylose and cellulose are linear."),
 29: ("b", "Norman Borlaug is the father of the Green Revolution."),
 30: ("c", "In CAM plants PEP carboxylase fixes CO2 on PEP at night."),
 31: ("d", "The pentose phosphate (HMP) pathway occurs in the cytoplasm."),
 32: ("c", "Ethanol-water shows positive deviation and forms a minimum-boiling azeotrope (95.6% ethanol)."),
 33: ("d", "The Nernst distribution (partition) law."),
 34: ("c", "Grasses are typically wind-pollinated (anemophily)."),
 35: ("d", "Sporopollenin of the pollen wall is one of the most resistant organic materials."),
 36: ("b", "Nails are functional; the others are vestigial in humans."),
 37: ("b", "Anomers differ in configuration at C-1."),
 38: ("c", "The distribution law was given by Nernst (1891)."),
 39: ("d", "In TLC the stationary phase is a solid adsorbent such as silica gel."),
 40: ("a", "A high auxin to cytokinin ratio induces roots in callus."),
 41: ("d", "The tissue taken from a plant for culture is the explant."),
 42: ("c", "Optical activity does not depend on the number of solute particles."),
 43: ("c", "Living things keep a constant C-14/C-12 ratio, which falls after death."),
 44: ("a", "In amphivasal (leptocentric) bundles xylem surrounds phloem."),
 45: ("d", "Vascular cambium (with cork cambium) produces secondary growth."),
 46: ("a", "Haeckel's biogenetic law: ontogeny recapitulates phylogeny."),
 47: ("b", "Methanogens live in anaerobic places such as cattle yards and the rumen."),
 48: ("b", "Grignard reagents add to both aldehydes and ketones; the others react with aldehydes only."),
 49: ("a", "Primary aliphatic amines with nitrous acid give alcohols with nitrogen gas."),
 50: ("c", "Reactors use controlled nuclear fission."),
 51: ("d", "Ammonification: decomposers release ammonia from dead organic matter."),
 52: ("d", "Lead, arsenic and uranium are all toxic."),
 53: ("a", "Somatic hybrids are produced by fusing protoplasts."),
 55: ("c", "Stem cells are undifferentiated cells that keep dividing in the adult."),
 56: ("d", "An alpha particle is a helium nucleus (2 protons, 2 neutrons)."),
 57: ("b", "Molality is moles per kilogram of solvent, so it does not involve volume."),
 58: ("c", "Epimorphosis regenerates lost parts by proliferation of cells (blastema)."),
 59: ("a", "Geitonogamy: transfer between flowers of the same plant."),
 60: ("b", "Oscillatoria is a cyanobacterium with oxygenic photosynthesis; the others are anoxygenic bacteria."),
 61: ("c", "pH = -log(1.0 x 10^-4) = 4."),
 62: ("a", "Water donates a proton to NH3, so it acts as an acid."),
 64: ("d", "Photorespiration involves chloroplasts, peroxisomes and mitochondria."),
 65: ("d", "Gibberellic acid can substitute for cold (vernalisation) in some plants."),
 66: ("c", "A coulometer measures the quantity of electricity."),
 67: ("a", "Hydrogen bonds give ice an open lattice, so liquid water is denser."),
 68: ("b", "Pseudomonas (and Thiobacillus) carry out denitrification."),
 69: ("c", "Haemophilia is an X-linked recessive disorder; males have one X."),
 70: ("b", "Chlorophyll a is C55H72O5N4Mg."),
}

NEW_MCQ = [
 ("In an electrolytic cell, oxidation takes place at the", ("cathode", "anode", "salt bridge", "electrolyte surface only"), "b", "Oxidation always occurs at the anode."),
 ("Which technique is used to produce a large number of genetically identical plants quickly?", ("Hybridisation", "Micropropagation", "Mutation breeding", "Inbreeding"), "b", "Micropropagation (tissue culture) gives many clones rapidly."),
 ("Excessive nitrates and phosphates in a pond mainly cause", ("acid rain", "eutrophication", "ozone depletion", "biomagnification of DDT"), "b", "Nutrient enrichment causes algal blooms and eutrophication."),
]

SAQ = [
 dict(marks=3, stem="Animal cells get ruptured when placed in distilled water or hypotonic solution but not the plant cells. Why? (3 marks)",
      kp=[("Water enters by osmosis (endosmosis) because the outside is hypotonic", 1), ("Animal cells have only a thin plasma membrane, so they swell and burst (haemolysis)", 1), ("Plant cells have a rigid cell wall that resists the turgor pressure, so they become turgid but do not burst", 1)],
      model="In distilled water or a hypotonic solution, water moves into the cell by osmosis because the solute concentration inside is higher. An animal cell is bounded only by a thin, elastic plasma membrane, so it keeps swelling until it bursts (e.g. haemolysis of red blood cells). A plant cell has a rigid cellulose cell wall; as the cell swells, wall pressure balances turgor pressure, so the cell becomes turgid but does not burst."),
 dict(marks=3, stem="Why is bile juice important in digestion of food when it has no digestive enzymes? (3 marks)",
      kp=[("Bile salts emulsify fats into small droplets, increasing surface area for lipase", 1), ("Bile is alkaline: neutralises acidic chyme and provides suitable pH for pancreatic and intestinal enzymes", 1), ("Helps absorption of fats and fat-soluble vitamins (A, D, E, K) through micelles; excretes bilirubin", 1)],
      model="Bile contains no enzymes, but bile salts emulsify fats into tiny droplets, greatly increasing the surface area on which pancreatic lipase acts. Bile is alkaline, so it neutralises the acidic chyme from the stomach and gives the alkaline medium needed by pancreatic and intestinal enzymes. Bile salts also form micelles that help absorb fatty acids and fat-soluble vitamins A, D, E and K."),
 dict(marks=3, stem="Calculate the pH value of a solution whose hydrogen ion concentration is 0.005 mole/litre. (3 marks)",
      kp=[("pH = -log[H+]", 1), ("[H+] = 5 x 10^-3 M; -log(5 x 10^-3) = 3 - log 5", 1), ("pH = 3 - 0.699 = 2.30", 1)],
      model="pH = -log[H+] = -log(5 x 10^-3) = -(log 5 + log 10^-3) = -(0.699 - 3) = 2.301. So pH is about 2.3 (acidic)."),
 dict(marks=3, stem="What is the utility of carotenoids to plants? (3 marks)",
      kp=[("Accessory pigments: absorb light (400-500 nm) and pass energy to chlorophyll", 1), ("Protect chlorophyll from photo-oxidation by quenching excess energy / free radicals", 1), ("Give colour to flowers and fruits to attract pollinators and seed dispersers; precursors of ABA / vitamin A", 1)],
      model="Carotenoids (carotenes and xanthophylls) act as accessory pigments that absorb blue-green light not absorbed by chlorophyll and transfer the energy to chlorophyll a, widening the range of light used in photosynthesis. They protect chlorophyll from photo-oxidation by absorbing excess energy and quenching harmful free radicals. They also give yellow, orange and red colours to flowers and fruits, attracting pollinators and seed dispersers, and are precursors of abscisic acid."),
 dict(marks=3, stem="Name the endocrine gland that secretes calcitonin. What roles are played by this hormone? (3 marks)",
      kp=[("Thyroid gland (parafollicular / C cells)", 1), ("Lowers blood calcium by inhibiting osteoclast bone resorption and promoting calcium deposition in bone", 1), ("Increases calcium (and phosphate) excretion by kidneys; antagonist of parathormone", 1)],
      model="Calcitonin is secreted by the parafollicular (C) cells of the thyroid gland. It lowers blood calcium: it inhibits osteoclasts so less calcium is released from bone and promotes deposition of calcium in bone, and it increases excretion of calcium and phosphate by the kidneys. It thus acts against parathyroid hormone to keep blood calcium normal."),
 dict(marks=3, stem="State phase rule and explain the terms: phase, component and degree of freedom. (3 marks)",
      kp=[("Phase rule: F = C - P + 2 (Gibbs) for a system in equilibrium", 1), ("Phase: a homogeneous, physically distinct and separable part of a system; component: least number of independent chemical species needed to express composition of all phases", 1), ("Degree of freedom: number of independent variables (T, P, concentration) that can be changed without changing the number of phases", 1)],
      model="Gibbs' phase rule: for a heterogeneous system in equilibrium, F = C - P + 2, where F is the degrees of freedom, C the number of components and P the number of phases. A phase is a homogeneous, physically distinct and mechanically separable part of the system (e.g. ice, water and vapour are three phases). A component is the smallest number of independent chemical constituents needed to express the composition of every phase. The degree of freedom is the number of variables such as temperature, pressure and concentration that can be varied independently without changing the number of phases (e.g. F = 0 at the triple point of water)."),
 dict(marks=3, stem="Explain the role played by phytochrome in seed germination. (3 marks)",
      kp=[("Phytochrome exists in two interconvertible forms, Pr (red-absorbing, 660 nm) and Pfr (far-red absorbing, 730 nm)", 1), ("Red light converts Pr to active Pfr, which promotes germination of light-sensitive (photoblastic) seeds such as lettuce, e.g. by inducing gibberellin synthesis", 1), ("Far-red light converts Pfr back to Pr and inhibits germination; the last light treatment decides the response", 1)],
      model="Phytochrome is a blue-green photoreceptor pigment that exists in two forms: Pr, which absorbs red light (about 660 nm), and Pfr, which absorbs far-red light (about 730 nm). In positively photoblastic seeds such as lettuce, red light converts Pr to the active Pfr form, which triggers germination, for example by stimulating gibberellin synthesis and enzymes that mobilise food reserves. Far-red light converts Pfr back to Pr and inhibits germination. The effect is reversible, and the final light treatment determines whether the seed germinates."),
 dict(marks=3, stem="Name the hormones which increase and decrease the rate of photosynthesis. (3 marks)",
      kp=[("Increase: cytokinins (delay senescence, promote chloroplast development) and gibberellins / auxins (increase leaf area)", 1.5), ("Decrease: abscisic acid (closes stomata, reduces CO2 entry) and ethylene (promotes senescence)", 1.5)],
      model="Hormones that increase photosynthesis: cytokinins, which promote chloroplast development and chlorophyll synthesis and delay leaf senescence; gibberellins and auxins, which increase leaf expansion and photosynthetic area. Hormones that decrease photosynthesis: abscisic acid (ABA), which closes stomata and reduces CO2 uptake, and ethylene, which hastens leaf senescence and chlorophyll breakdown.",
      issues=["Textbooks differ on which hormones to list; accept any well-justified examples."]),
 dict(marks=3, stem="Carbohydrates can be broadly divided into three classes. Name the classes and briefly describe them. (3 marks)",
      kp=[("Monosaccharides: simplest sugars that cannot be hydrolysed further, e.g. glucose, fructose, ribose", 1), ("Oligosaccharides: 2-10 monosaccharide units joined by glycosidic bonds, e.g. sucrose, maltose, lactose (disaccharides)", 1), ("Polysaccharides: many monosaccharide units, non-sweet, e.g. starch, glycogen, cellulose", 1)],
      model="1. Monosaccharides: the simplest sugars, which cannot be hydrolysed into smaller sugars; sweet and soluble, e.g. glucose, fructose, galactose, ribose. 2. Oligosaccharides: give 2-10 monosaccharide units on hydrolysis, joined by glycosidic bonds; disaccharides such as sucrose, maltose and lactose are the commonest. 3. Polysaccharides: long chains of many monosaccharide units, usually insoluble and not sweet; storage forms such as starch and glycogen, and structural forms such as cellulose and chitin."),
 dict(marks=3, stem="Root hairs are not trichomes, while epidermal hairs on stem are called trichomes. Why? (3 marks)",
      kp=[("Root hairs are unicellular extensions (outgrowths) of single epidermal cells, not separate structures", 1), ("Trichomes are epidermal appendages, usually multicellular, branched or unbranched, sometimes glandular", 1), ("Functions differ: root hairs absorb water and minerals; trichomes reduce transpiration, protect, secrete", 1)],
      model="Root hairs are simply tubular outgrowths of individual epidermal cells of the root (the cell and the hair are one cell), formed in the zone of maturation to absorb water and minerals. Trichomes are epidermal appendages of the shoot, usually multicellular, which may be branched or unbranched, soft or stiff, and sometimes glandular (secretory). Their function is mainly protective: reducing water loss by transpiration and defending against herbivores. Because of these differences in structure and function, root hairs are not called trichomes."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
