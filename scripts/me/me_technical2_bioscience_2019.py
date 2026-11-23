"""ME Technical Paper II (General Subject Knowledge), BIO SCIENCE group, BCSE 2019 - real paper (PDF sent by the founder).
Same pattern as 2020-2025 (Part I 70 MCQ x 1; Part II 10 short answers x 3), so it is ADDED to the paper's pattern.
Already on Soma or loaded from a later year (recorded as appearances): MCQ 3, 4, 5, 6, 7, 8, 10, 11, 12, 14, 17, 21, 22,
24, 25, 26, 32, 36, 39, 45, 46, 47, 49, 54, 58, 59, 64, 66 and 70; Part II Q3 (loaded from BCSE 2022 Q3). MCQ 34's typos
('freeing', 'sample') are corrected. Left out: MCQ 37 (BaO with HCl gives no H2O2 - probably a misprint for BaO2), 51
(delay and failure of clotting both fit), 57 (C4H8O has more isomers than any option counts reliably), 65 (both enthalpy
and entropy increase). Four new MCQs replace them.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Bio Science): BCSE 2019, batch 1"
GROUP_TAG = "bio2019"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "bio-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2019 Main Examination, Technical Paper II, Bio Science", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Bio Science: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "The rate of transpiration will be very less in a situation where",
"opts": [
"wind is blowing with a very high velocity.",
"ground water is sufficiently available.",
"relative humidity is very high.",
"environment is very hot and dry."
]
},
{
"n": 2,
"stem": "The concentration unit independent of temperature is",
"opts": [
"Molarity",
"Molality",
"Normality",
"Weight volume percent"
]
},
{
"n": 3,
"stem": "How many grammes of CH3OH should be added to water to prepare 150.0 ml solution of 2.0 M of CH3OH?",
"opts": [
"9.6 g",
"2.5 g",
"32.0 g",
"150.0 g"
]
},
{
"n": 4,
"stem": "Which type of moment is present in Mimosa pudica?",
"opts": [
"Nyctinastic",
"Chemonastic",
"Seismonastic",
"Thigmonastic"
]
},
{
"n": 5,
"stem": "The outermost layer of maize endosperm is known as",
"opts": [
"Perisperm",
"Aleurone",
"Tapetum",
"Endothecium"
]
},
{
"n": 6,
"stem": "Which of the following liquids would posses the highest vapour pressure at room temperature?",
"opts": [
"Acetic acid (b.p. 118 oC)",
"Chlorobenzene (b.p. 132 oC)",
"Methyl alcohol (b.p. 65 oC)",
"Nitrobenzene (b.p. 212 oC)"
]
},
{
"n": 7,
"stem": "The molarity of pure water is",
"opts": [
"50.5 M",
"18.5 M",
"55.6 M",
"100 M"
]
},
{
"n": 8,
"stem": "The fertilisation in which male gametes are carried through pollen tube is known as",
"opts": [
"Syngamy",
"Porogamy",
"Siphonogamy",
"Chalazogamy"
]
},
{
"n": 9,
"stem": "A steroid hormone which regulate glucose metabolism is",
"opts": [
"Cortisone",
"Cortisol",
"Corticosterone",
"11-deoxycorticosterone"
]
},
{
"n": 10,
"stem": "Which part of ovary in mammals acts as an endocrine gland after ovulation?",
"opts": [
"Stroma",
"Germinal epithelium",
"Vitelline membrane",
"Graafian follicle"
]
},
{
"n": 11,
"stem": "The bond angle in water is",
"opts": [
"90o",
"101o",
"105o",
"180 o"
]
},
{
"n": 12,
"stem": "Sympathetic nerve accelerates heart beat due to",
"opts": [
"Insulin",
"Adrenalin",
"Glucagon",
"None of the above"
]
},
{
"n": 13,
"stem": "Which part of human brain is concerned with the regulation of body temperature?",
"opts": [
"Medulla oblongata",
"Cerebellum",
"Cerebrum",
"Hypothalamus"
]
},
{
"n": 14,
"stem": "IUPAC name of C2H5CN is",
"opts": [
"Ethyl cyanide",
"Acetonitrile",
"Propane nitrile",
"Ethane nitrile"
]
},
{
"n": 15,
"stem": "Bipolar neurons occur in",
"opts": [
"Vertebrate embryos",
"Retina of eye",
"Brain and spinal cord",
"Skeletal muscles"
]
},
{
"n": 16,
"stem": "Which of the following is important for muscle contraction and nerve impulse transmission?",
"opts": [
"Ca2+ ions",
"Mg2+ ions",
"Mn2+ ions",
"Fe2+ ions"
]
},
{
"n": 17,
"stem": "Which of the following monosaccharides is a pentose?",
"opts": [
"Glucose",
"Fructose",
"Arabinose",
"Galactose"
]
},
{
"n": 18,
"stem": "Growth curve in animals is",
"opts": [
"Delta curve",
"Alpha curve",
"Beta curve",
"Sigmoid curve"
]
},
{
"n": 19,
"stem": "Carbohydrates are compounds of",
"opts": [
"C, N, O",
"C, H, N",
"C, H, O",
"N, P, K"
]
},
{
"n": 20,
"stem": "Growth in living being is called",
"opts": [
"Accretion",
"Intussusception",
"Aggregation",
"Interaction"
]
},
{
"n": 21,
"stem": "Which type of carbohydrate is cane sugar?",
"opts": [
"Polysaccharide",
"Trisaccharide",
"Disaccharide",
"Monosaccharide"
]
},
{
"n": 22,
"stem": "In organic chemistry the isomers have the same",
"opts": [
"Structural formula",
"Chemical properties",
"Physical properties",
"Molecular formula"
]
},
{
"n": 23,
"stem": "Decreased defence against pathogens causes ageing, and it is due the disappearance of",
"opts": [
"Pituitary gland",
"Thymus gland",
"Parathyroid gland",
"Spleen"
]
},
{
"n": 24,
"stem": "The undifferentiated cells in the adult which retain the power to divide are called",
"opts": [
"Meristematic cells",
"Posmitotic cells",
"Stem cells",
"All the above"
]
},
{
"n": 25,
"stem": "In malaria, the product released by mosquitoes into blood that causes chill and fever is called",
"opts": [
"Haematin",
"Schuffner’s dots",
"Haemazoin",
"Haematoxin"
]
},
{
"n": 26,
"stem": "Which pair is essential for the growth of fish in water?",
"opts": [
"Nitrates and sulphates",
"Sulphanates and carbonates",
"Calcium and phosphorus",
"Carbonates and phosphates"
]
},
{
"n": 27,
"stem": "Which is not a natural polymer?",
"opts": [
"Wool",
"Silk",
"Leather",
"Nylon"
]
},
{
"n": 28,
"stem": "Solarisation is",
"opts": [
"formation of chlorophyll.",
"destruction of chlorophyll.",
"utilisation of sunlight.",
"none of the above"
]
},
{
"n": 29,
"stem": "The route by which virtually all energy enter into ecosystem is",
"opts": [
"Leaf abscission",
"Respiration",
"Photosynthesis",
"Transpiration"
]
},
{
"n": 30,
"stem": "The chemical name of bleaching powder is",
"opts": [
"Calcium hypochlorite",
"Calcium chlorohypochlorite",
"Calcium chlorate",
"Calcium perchlorate"
]
},
{
"n": 31,
"stem": "The impurities present in the mineral are called",
"opts": [
"Flux",
"Alloy",
"Gangue",
"Slag"
]
},
{
"n": 32,
"stem": "Graham’s law is correlated with",
"opts": [
"Diffusion",
"Imbibitions",
"Osmosis",
"Absorption"
]
},
{
"n": 33,
"stem": "Water used as moderator in nuclear reactor is called",
"opts": [
"Hard water",
"Heavy water",
"Nuclear water",
"Soft water"
]
},
{
"n": 34,
"stem": "Isotonic solutions have",
"opts": [
"same freezing point.",
"same temperature.",
"same vapour pressure.",
"same osmotic pressure."
]
},
{
"n": 35,
"stem": "Stomatal opening is regulated by",
"opts": [
"Light",
"Temperature",
"Atmospheric pressure",
"Wind"
]
},
{
"n": 36,
"stem": "Faraday’s laws of electrolysis are related to the",
"opts": [
"atomic number of the cation.",
"atomic number of the anion.",
"equivalent weight of the electrolyte.",
"speed of the cation."
]
},
{
"n": 37,
"stem": "When HCl is added to the following oxides, which one would give H2O2:",
"opts": [
"MnO2",
"BaO",
"PbO2",
"None of the above"
]
},
{
"n": 38,
"stem": "Water lost in the process of guttation is",
"opts": [
"pure water",
"impure water",
"in vapour form",
"both (a) and (c)"
]
},
{
"n": 39,
"stem": "In plasmolysed cell, the spaced between nucleus and plasma membrane is occupied by",
"opts": [
"Hypotonic solution",
"Hypertonic solution",
"Isotonic solution",
"Air"
]
},
{
"n": 40,
"stem": "Water potential in plant cells is determined by",
"opts": [
"Matric potential",
"Solute potential or osmotic potential",
"Pressure potential",
"All of the above"
]
},
{
"n": 41,
"stem": "Ascaris is most commonly found in:",
"opts": [
"Men",
"Women",
"Children",
"(a) and (b)"
]
},
{
"n": 42,
"stem": "Which of the following is not a concept of Lamark?",
"opts": [
"Environmental pressure causes variation.",
"Rate and survival of organism is different due to variation.",
"Inheritance of acquired character.",
"If an organ is used constantly it will continuously increase in size."
]
},
{
"n": 43,
"stem": "An evolutionary process giving rise to new species adapting to new habitat and ways of life is called",
"opts": [
"Adaptation",
"Adaptive radiation",
"Convergent evolution",
"Microevolution"
]
},
{
"n": 44,
"stem": "Which of the following enzyme converts maltose to glucose?",
"opts": [
"Diastase",
"Zymase",
"Maltase",
"Invertase"
]
},
{
"n": 45,
"stem": "The pH of a solution is 5.9. If the hydrogen ion concentration is decreased hundred times, the solution will be",
"opts": [
"more acidic.",
"neutral.",
"basic.",
"of the same acidity."
]
},
{
"n": 46,
"stem": "Mutation is more common when it is present in",
"opts": [
"Recessive condition",
"Dominant condition",
"Constant in population",
"None of the above"
]
},
{
"n": 47,
"stem": "Genetic diversity in agricultural crops is threatened by",
"opts": [
"excessive use of fertilisers.",
"intensive use of biopesticides.",
"introduction of high-yielding varieties.",
"extensive intercropping."
]
},
{
"n": 48,
"stem": "Which of the following is not done in wildlife sanctuary?",
"opts": [
"Fauna is conserved",
"Flora is conserved",
"Soil and flora are utilised",
"Hunting is prohibited"
]
},
{
"n": 49,
"stem": "How much volume of 0.6 M NaOH is required to neutralise 30 cm3 of 0.4 M HCl?",
"opts": [
"30 cm3",
"20 cm3",
"40 cm3",
"50 cm3"
]
},
{
"n": 50,
"stem": "Which of the following solution has the highest boiling point?",
"opts": [
"0.1 M BaCl2",
"0.1 M NaCl",
"0.1 M Urea",
"0.1 M glucose"
]
},
{
"n": 51,
"stem": "Haemophilia is a condition where there is",
"opts": [
"no production of haemoglobin in the blood.",
"no production of melanin in the skin.",
"a delay in clotting of blood.",
"a failure of clotting mechanism of blood."
]
},
{
"n": 52,
"stem": "When chromosome number of a given organism has one additional chromosome in one of the homologous pairs, the condition is known as",
"opts": [
"Trisomy",
"Monosomy",
"Polyploidy",
"Nullisomy"
]
},
{
"n": 53,
"stem": "Which of the following represents the edible part of fruit of litchi?",
"opts": [
"Pericarp",
"Mesocarp",
"Juicy aril",
"Endocarp"
]
},
{
"n": 54,
"stem": "In leaves of C4 plants, malic acid synthesis during carbon dioxide fixation occurs in",
"opts": [
"Epidermal cells",
"Mesophyll cells",
"Bundle sheath cells",
"Guard cells"
]
},
{
"n": 55,
"stem": "Solid NaCl is a bad conductor of electricity since",
"opts": [
"there are no ions in solid NaCl",
"solid NaCl is covalent",
"ions are not mobile in solid NaCl",
"there are no electrons in solid NaCl"
]
},
{
"n": 56,
"stem": "Dry ice is an example of a crystalline solid which is",
"opts": [
"Ionic",
"Molecular",
"Covalent",
"Metallic"
]
},
{
"n": 57,
"stem": "How many isomers are possible in C4H8O molecule?",
"opts": [
"3",
"4",
"5",
"6"
]
},
{
"n": 58,
"stem": "Which of the following cell organelles is associated with photorespiration?",
"opts": [
"Mitochondria",
"Peroxisome",
"Chloroplast",
"All of the above"
]
},
{
"n": 59,
"stem": "Law of limiting factors was given by",
"opts": [
"Leibig",
"Blackman",
"Calvin",
"Darwin"
]
},
{
"n": 60,
"stem": "Most of the fossils are found in which rock?",
"opts": [
"Sedimentary rock",
"Metamorphic rock",
"Igneous rock",
"None of the above"
]
},
{
"n": 61,
"stem": "A plant requires magnesium for",
"opts": [
"holding cells together.",
"protein synthesis.",
"chlorophyll synthesis.",
"cell wall development."
]
},
{
"n": 62,
"stem": "Carbohydrate must contain at least",
"opts": [
"2 carbon atoms",
"3 carbon atoms",
"4 carbon atoms",
"6 carbon atoms"
]
},
{
"n": 63,
"stem": "Which of the following is a polysaccharides?",
"opts": [
"CH2OH(CHOH)4CHO",
"CH2OH(CHOH)3CO.CH2OH",
"C12H22O11",
"(C6H10O5)n"
]
},
{
"n": 64,
"stem": "Blue litmus turns red in a solution of pH",
"opts": [
"below 7",
"above 7",
"at 7",
"at all pH"
]
},
{
"n": 65,
"stem": "The process of evaporation of a liquid is accompanied by",
"opts": [
"an increase of enthalpy.",
"a decrease of entropy.",
"no change in free energy.",
"an increase of entropy."
]
},
{
"n": 66,
"stem": "The process of decay of dead organic matter is known as",
"opts": [
"Nitrification",
"Denitrification",
"Ammonification",
"Nitrogen fixation"
]
},
{
"n": 67,
"stem": "Nitrite is converted to nitrate by",
"opts": [
"Nitrosomonas",
"Nitrobacter",
"Pseudomonas",
"Clostridium"
]
},
{
"n": 68,
"stem": "Commercially important ore of lead is",
"opts": [
"Haematite",
"Siderite",
"Galena",
"Sphalerite"
]
},
{
"n": 69,
"stem": "The structure of H2O2 is",
"opts": [
"Planar",
"Non-planar",
"Spherical",
"Linear"
]
},
{
"n": 70,
"stem": "Transfer of pollen grains from the anther to the stigma of another flower of the same plant is called",
"opts": [
"Autogamy",
"Cleistogamy",
"Geitonogamy",
"Allogamy"
]
}
]"""

KEY = {
    1: ("c", "High humidity lowers the water-vapour gradient between leaf and air, so transpiration is very low."),
    2: ("b", "Molality uses mass of solvent, which does not change with temperature."),
    9: ("b", "Cortisol is the main glucocorticoid regulating glucose metabolism."),
    13: ("d", "The hypothalamus is the body's thermostat."),
    15: ("b", "Bipolar neurons occur in the retina (and olfactory epithelium)."),
    16: ("a", "Calcium ions trigger muscle contraction and neurotransmitter release."),
    18: ("d", "Growth follows a sigmoid (S-shaped) curve."),
    19: ("c", "Carbohydrates contain carbon, hydrogen and oxygen."),
    20: ("b", "Growth in living things is from within, by intussusception (non-living things grow by accretion)."),
    23: ("b", "The thymus shrinks with age, reducing T-cell production and defence against pathogens."),
    27: ("d", "Nylon is a synthetic polymer; wool, silk and leather are natural."),
    28: ("b", "Solarisation is the destruction (photo-oxidation) of chlorophyll by very intense light."),
    29: ("c", "Nearly all energy enters ecosystems through photosynthesis."),
    30: ("b", "Bleaching powder (CaOCl2) is calcium chlorohypochlorite (calcium oxychloride)."),
    31: ("c", "Earthy impurities in an ore are called gangue (matrix)."),
    33: ("b", "Heavy water (D2O) is used as a moderator."),
    34: ("d", "Isotonic solutions have the same osmotic pressure."),
    35: ("a", "Light is the main factor regulating stomatal opening."),
    38: ("b", "Guttation fluid contains dissolved salts and sugars, so it is not pure water."),
    40: ("d", "Water potential = solute potential + pressure potential (+ matric potential)."),
    41: ("c", "Ascaris infection is most common in children."),
    42: ("b", "Differential survival due to variation is Darwin's idea, not Lamarck's."),
    43: ("b", "Evolution of many species from one ancestor into new habitats is adaptive radiation."),
    44: ("c", "Maltase splits maltose into two glucose molecules."),
    48: ("c", "Using soil and flora is not allowed in a wildlife sanctuary."),
    50: ("a", "BaCl2 gives 3 particles per formula unit (i = 3), so it has the largest boiling-point elevation."),
    52: ("a", "One extra chromosome (2n + 1) is trisomy."),
    53: ("c", "The edible part of litchi is the fleshy aril."),
    55: ("c", "Solid NaCl has ions, but they are fixed in the lattice and cannot move."),
    56: ("b", "Dry ice (solid CO2) is a molecular solid."),
    60: ("a", "Most fossils are found in sedimentary rocks."),
    61: ("c", "Magnesium is the central atom of chlorophyll."),
    62: ("b", "The simplest carbohydrates (trioses such as glyceraldehyde) have 3 carbon atoms."),
    63: ("d", "(C6H10O5)n is a polysaccharide such as starch or cellulose."),
    67: ("b", "Nitrobacter oxidises nitrite to nitrate."),
    68: ("c", "Galena (PbS) is the main ore of lead."),
    69: ("b", "H2O2 has a non-planar (open-book) structure."),
}

NEW_MCQ = [
    ("Which oxide reacts with dilute acid to give hydrogen peroxide?", ["Barium peroxide (BaO2)", "Manganese dioxide (MnO2)", "Calcium oxide (CaO)", "Lead(II) oxide (PbO)"], "a",
     "BaO2 + H2SO4 → BaSO4 + H2O2 is the laboratory preparation of hydrogen peroxide."),
    ("Haemophilia is caused by deficiency of", ["a clotting factor (e.g. factor VIII)", "haemoglobin", "vitamin C", "platelets' nuclei"], "a",
     "Haemophilia A is due to lack of clotting factor VIII (and B to factor IX), so blood clots very slowly."),
    ("How many structural isomers are possible for C4H10?", ["1", "2", "3", "4"], "b",
     "Butane has two isomers: n-butane and isobutane (2-methylpropane)."),
    ("When a liquid evaporates, its entropy", ["decreases", "increases", "stays zero", "becomes negative"], "b",
     "Gas molecules are more disordered than liquid molecules, so entropy increases on evaporation."),
]

SAQ = [
 dict(marks=3, stem="In the absorption and movement of water and solutes in plant cells, some carrier proteins allow transport only if two types of molecules move together.\n(a) What is this process called? (1 mark)\n(b) The process has two types. Name and define the two types involved. (2 marks)",
      kp=[("(a) Co-transport (coupled transport)", 1), ("(b) Symport: both molecules move in the same direction across the membrane", 1), ("Antiport: the two molecules move in opposite directions", 1)],
      model="(a) This is co-transport (coupled transport), carried out by carrier proteins that move two different molecules or ions together. (b) The two types are: symport - both substances cross the membrane in the same direction (e.g. H+ and sucrose entering a cell together); and antiport - the two substances move in opposite directions (e.g. H+ moving out while Na+ moves in). (A uniport, by contrast, moves only one substance.)"),
 dict(marks=3, stem="Calculate the mole fraction of each component of a mixture made by dissolving 10.0 g of NaOH and 12.7 g of iodine in 54.0 g of water. (3 marks)",
      kp=[("Moles: NaOH = 10.0/40 = 0.25; I2 = 12.7/254 = 0.05; H2O = 54.0/18 = 3.00; total = 3.30", 1.5),
          ("Mole fractions: NaOH = 0.25/3.30 = 0.076; I2 = 0.05/3.30 = 0.015; H2O = 3.00/3.30 = 0.909 (sum = 1)", 1.5)],
      model="Moles of NaOH = 10.0 ÷ 40 = 0.25 mol; moles of I2 = 12.7 ÷ 254 = 0.05 mol; moles of H2O = 54.0 ÷ 18 = 3.00 mol. Total = 3.30 mol. Mole fraction of NaOH = 0.25 ÷ 3.30 = 0.076; of I2 = 0.05 ÷ 3.30 = 0.015; of H2O = 3.00 ÷ 3.30 = 0.909. (Check: 0.076 + 0.015 + 0.909 = 1.)"),
 dict(marks=3, stem="Crystalline solids are said to have a regular arrangement of atoms, ions or molecules. List three more characteristics of a crystalline solid. (3 marks)",
      kp=[("Sharp, definite melting point", 1), ("Anisotropic - physical properties differ in different directions; definite geometric shape and long-range order", 1),
          ("Definite heat of fusion; cleave along planes giving smooth surfaces; true solids", 1)],
      model="Besides a regular, long-range ordered arrangement of particles, crystalline solids: (1) have a sharp and definite melting point; (2) are anisotropic - properties such as refractive index and electrical conductivity differ in different directions; (3) have a definite and characteristic heat of fusion; (4) have a definite geometric shape and break (cleave) along definite planes to give smooth, flat surfaces. They are called true solids (e.g. NaCl, quartz, diamond)."),
 dict(marks=3, stem="How does species diversity differ from ecological diversity? (3 marks)",
      kp=[("Species diversity: the variety and number of species (richness and evenness) in a region, e.g. Western Ghats amphibians", 1.5),
          ("Ecological (ecosystem) diversity: the variety of habitats, communities and ecosystems (forests, grasslands, wetlands, deserts) in a region, and of ecological processes", 1.5)],
      model="Species diversity is the variety of different species in an area - both the number of species (species richness) and how evenly individuals are spread among them (evenness); for example, Bhutan's forests have many bird species. Ecological (ecosystem) diversity is diversity at a higher level: the variety of habitats, biological communities and ecosystems in a region, such as alpine meadows, broadleaf and conifer forests, wetlands and rivers, together with the ecological processes in them. Species diversity is counted among species within a community, while ecological diversity is counted among different ecosystems."),
 dict(marks=3, stem="Benzene is the simplest and most important aromatic hydrocarbon.\n(a) Name the scientist who discovered it, the year of discovery, and the material in which it was first discovered. (1.5 marks)\n(b) Give the reason why it is named benzene. What is its formula and its commercial name? (1.5 marks)",
      kp=[("(a) Michael Faraday, 1825, in the oily residue (compressed illuminating gas) from whale/ coal gas", 1.5),
          ("(b) Named from gum benzoin/ benzoic acid (Mitscherlich obtained it from benzoic acid - 'benzin'); formula C6H6; commercial name benzol", 1.5)],
      model="(a) Benzene was discovered by Michael Faraday in 1825; he isolated it from the oily liquid that condensed from compressed illuminating gas (made from whale oil/ coal gas), calling it 'bicarburet of hydrogen'. (b) It is named after gum benzoin: in 1834 Eilhard Mitscherlich obtained it by heating benzoic acid (from gum benzoin) with lime and called it 'benzin', which became benzene. Its molecular formula is C6H6, and its commercial name is benzol."),
 dict(marks=3, stem="What are honey guides? What is their importance for the plant possessing them? (3 marks)",
      kp=[("Honey (nectar) guides: lines, spots or patterns on petals (often visible in UV to insects) leading to the nectar", 1),
          ("They direct pollinators (bees, butterflies) to the nectar and, on the way, past the anthers and stigma", 1),
          ("Importance: efficient pollination (cross-pollination), less wasted visits, more seed and fruit set", 1)],
      model="Honey guides (nectar guides) are coloured lines, spots or patterns on the petals of many flowers, often visible to insects in ultraviolet light, that point towards the nectar. They guide pollinating insects such as bees and butterflies straight to the nectar, and in doing so the insect brushes against the anthers and stigma. This makes pollination, especially cross-pollination, more efficient - pollinators spend less time searching, visit more flowers and carry pollen effectively - so the plant gets better seed and fruit set."),
 dict(marks=3, stem="How can an individual prevent the loss of biodiversity and exploitation of its resources? Give three examples. (3 marks)",
      kp=[("Avoid over-exploitation: do not hunt/ poach, buy wildlife products, or over-collect medicinal plants, firewood, fish", 1),
          ("Protect habitats: plant native trees, avoid burning forests, littering and polluting rivers; support protected areas", 1),
          ("Sustainable lifestyle and awareness: reduce, reuse, recycle, save energy and water, avoid plastics, do not introduce invasive species, join conservation/ awareness activities", 1)],
      model="An individual can help by: (1) not over-exploiting resources - never hunting or poaching, not buying products made from wild animals or plants, and harvesting firewood, medicinal plants, cordyceps or fish only in sustainable amounts with permits; (2) protecting habitats - planting native trees, preventing forest fires, not dumping waste or polluting rivers, and respecting national parks and community forests; (3) living sustainably and spreading awareness - reducing, reusing and recycling, saving water and energy, avoiding single-use plastics, not releasing invasive species or pets into the wild, and taking part in clean-up, plantation and awareness campaigns."),
 dict(marks=3, stem="Give the full forms of CT and MRI. How are they different from each other? (3 marks)",
      kp=[("CT - Computed Tomography; MRI - Magnetic Resonance Imaging", 1), ("CT uses X-rays (ionising radiation) rotated around the body; MRI uses a strong magnetic field and radio waves (no ionising radiation)", 1),
          ("CT is faster, best for bones, bleeding, lungs and emergencies; MRI gives better soft-tissue contrast (brain, spinal cord, joints, muscles), takes longer, unsafe with some metal implants", 1)],
      model="CT stands for Computed (Computerised) Tomography; MRI stands for Magnetic Resonance Imaging. Differences: (1) CT uses X-rays (ionising radiation) taken from many angles around the body and combined by a computer into cross-sectional images, whereas MRI uses a powerful magnetic field and radio-frequency waves acting on hydrogen nuclei, with no ionising radiation. (2) CT is quick and best for bones, bleeding, lungs and emergency trauma; MRI gives much better contrast of soft tissues such as the brain, spinal cord, ligaments and muscles. (3) MRI takes longer, is noisy and costly, and cannot be used with some metal implants or pacemakers, while CT exposes the patient to radiation."),
 dict(marks=3, stem="In thermodynamics, a system is a specific portion of matter under study, separated from the rest of the universe by a boundary. Name the different types of systems and briefly explain them with an example. (3 marks)",
      kp=[("Open system: exchanges both matter and energy with the surroundings, e.g. water boiling in an open beaker, living organisms", 1),
          ("Closed system: exchanges energy but not matter, e.g. water in a closed (sealed) vessel being heated", 1),
          ("Isolated system: exchanges neither matter nor energy, e.g. hot tea in an ideal thermos flask", 1)],
      model="(1) Open system - can exchange both matter and energy with its surroundings; e.g. water being heated in an open beaker (vapour escapes and heat enters), or a living cell. (2) Closed system - can exchange energy but not matter; e.g. water heated in a sealed metal container. (3) Isolated system - can exchange neither matter nor energy; e.g. hot tea in an ideal (perfectly insulated) thermos flask."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
