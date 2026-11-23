"""ME Technical Paper II (General Subject Knowledge), BIO SCIENCE group, BCSE 2021 - real paper (PDF sent by the founder).
Same pattern as 2022-2025 (Part I 70 MCQ x 1; Part II 10 short answers x 3), so it is ADDED to the paper's pattern.
Already on Soma or loaded from a later year (recorded as appearances): MCQ 1, 5, 8, 10, 11, 17, 18, 19, 24, 28, 34, 39,
41, 43, 45, 50, 54, 56, 59, 66, 68, 70; Part II Q7 (loaded from BCSE 2023 Q6). MCQ 62's stem says the mosquito releases
the product; it is kept, and the explanation notes that haemozoin is released from burst red cells.
Left out: MCQ 20, 21 ('extremely high risk' is critically endangered - not offered), 33, 40 (CHON and CHONP both quoted),
61. Five new MCQs replace them.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Bio Science): BCSE 2021, batch 1"
GROUP_TAG = "bio2021"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "bio-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2021 Main Examination, Technical Paper II, Bio Science", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Bio Science: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "In plants, the guard cells differ from other epidermal cells in having",
"opts": [
"Cytoskeleton",
"Mitochondria",
"Chloroplasts",
"Endoplasmic Reticulum"
]
},
{
"n": 2,
"stem": "Heartwood differs from sapwood in",
"opts": [
"presence of rays and fibres.",
"absence of vessels and parenchyma.",
"being susceptible to pest and pathogens.",
"having dead and nonconducting elements."
]
},
{
"n": 3,
"stem": "In studying circulation in human, it is found that maximum amount of oxygen is lost from the blood in the",
"opts": [
"capillaries surrounding the tissue cells.",
"aeteries of the body.",
"capillaries surrounding the alveoli.",
"left auricle of the heart."
]
},
{
"n": 4,
"stem": "From outer to inside, the sequence of three bones present in the middle ear of mammals is",
"opts": [
"Malleus, stapes and incus.",
"Stapes, malleus and incus.",
"Malleus, incus and stapes.",
"Incus, malleus and stapes."
]
},
{
"n": 5,
"stem": "IUPAC name of C2H5 CN is",
"opts": [
"Ethyl cyanide",
"Propane nitrile",
"Acetonitrile",
"Ethane nitrile"
]
},
{
"n": 6,
"stem": "As the atomic number of halogens increases, the halogens",
"opts": [
"gain electrons less readily.",
"become less dense.",
"loss the outermost electrons less readily.",
"become lighter in colour."
]
},
{
"n": 7,
"stem": "About 70% of the total global carbon is found in",
"opts": [
"Grasslands",
"Agro-ecosystems",
"Forests",
"Oceans"
]
},
{
"n": 8,
"stem": "A free-living aerobic and non-photosynthetic nitrogen-fixing bacterium is",
"opts": [
"Anabaena",
"Clostridium",
"Azotobacter",
"Rhizobium"
]
},
{
"n": 9,
"stem": "Red phosphorus is less reactive than yellow phosphorus because",
"opts": [
"it is red in colour.",
"it is highly polymerised.",
"it is hard.",
"it is insoluble in C2H5OH."
]
},
{
"n": 10,
"stem": "Which one of the following is a systematic insecticide?",
"opts": [
"Malathion",
"Parathion",
"Endrin",
"Furadan"
]
},
{
"n": 11,
"stem": "When a mutation is limited to the substitution of one nucleotide for another, it is called",
"opts": [
"Translocation",
"Base inversion",
"Frameshift",
"None of the above"
]
},
{
"n": 12,
"stem": "An allotrope of phosphorus used in safety matches is",
"opts": [
"White phosphorus",
"Red phosphorus",
"Black phosphorus",
"Violet phosphorus"
]
},
{
"n": 13,
"stem": "In an isothermal expansion of an ideal gas against a vacuum, the work involved is",
"opts": [
"Zero",
"Maximum",
"Minimum",
"Not equal to the heat absorbed by the system."
]
},
{
"n": 14,
"stem": "The total entropy change for a system and its surrounding increases, if the process is",
"opts": [
"Reversible",
"Irreversible",
"Exothermic",
"Endothermic"
]
},
{
"n": 15,
"stem": "The hormone that increases the blood calcium level in human and decreases its excretion by kidney is",
"opts": [
"Parathormone",
"Calcitonin",
"Thyroxine",
"Insulin"
]
},
{
"n": 16,
"stem": "Haemoglobin is having maximum affinity with",
"opts": [
"Carbon dioxide",
"Carbon monoxide",
"Oxygen",
"Ammonia"
]
},
{
"n": 17,
"stem": "When ice melts into water, entropy",
"opts": [
"becomes zero.",
"decreases.",
"increases.",
"remains the same."
]
},
{
"n": 18,
"stem": "Which of the following induces flowering in long day plants?",
"opts": [
"Gibberellins",
"Auxins",
"Ethylene",
"Cytokinin"
]
},
{
"n": 19,
"stem": "The pigment involved in photomorphogenetic movement is",
"opts": [
"Cytochrome",
"Phytochrome",
"Chromatin",
"Vernalin"
]
},
{
"n": 20,
"stem": "If flowers are cut and dipped in dilute NaCl solution, then",
"opts": [
"transpiration is low.",
"endosmosis occurs.",
"no bacterial growth takes place.",
"absorption of solute inside flower cell takes place."
]
},
{
"n": 21,
"stem": "A taxon, which is facing an extremely high risk of extinction in the wild in immediate future is known as",
"opts": [
"Rare",
"Exotic",
"Endangered",
"Vulnerable"
]
},
{
"n": 22,
"stem": "The correct sequence of layers found in root anatomy is",
"opts": [
"Epiblema, cortex, endodermis, pericycle.",
"Cortex, epiblema, endodermis, pericycle.",
"Endodermis, pericycle, cortex, epiblema.",
"Cortex, epiblema, endodermis, epidermis."
]
},
{
"n": 23,
"stem": "Radioactive disintegration differs from a chemical change in being",
"opts": [
"a nuclear process.",
"an exothermic process.",
"a spontaneous process.",
"a unimolecular first order reaction."
]
},
{
"n": 24,
"stem": "10 g of NaCl is dissolved in 10 6 g of the solution. Its concentration is",
"opts": [
"0.1 ppm",
"1 ppm",
"10 ppm",
"100 ppm"
]
},
{
"n": 25,
"stem": "Lignifications is associated with",
"opts": [
"Xylem",
"Phloem",
"Parenchyma",
"Chlorenchyma"
]
},
{
"n": 26,
"stem": "The conversion of nitrate to nitrogen is called",
"opts": [
"Nitrification",
"Denitrification",
"Nitrogen fixation",
"Ammonification"
]
},
{
"n": 27,
"stem": "Which of the following structures represents female gametophyte?",
"opts": [
"Endosperm",
"Ovule",
"Embryo sac",
"Embryo"
]
},
{
"n": 28,
"stem": "The principal nitrogenous excretory compound in humans is synthesised",
"opts": [
"in kidneys but eliminated mostly through liver.",
"in kidneys as well as eliminated by kidneys.",
"in liver and also eliminated by the same through bile.",
"in liver but eliminated mostly through kidneys."
]
},
{
"n": 29,
"stem": "The molar solution of H2SO4 is equal to",
"opts": [
"N/2 solution",
"N solution",
"2N solution",
"3N solution"
]
},
{
"n": 30,
"stem": "What is the molarity of 0.2 N Na2CO3 solution?",
"opts": [
"0.05 M",
"0.4 M",
"0.1 M",
"0.2 M"
]
},
{
"n": 31,
"stem": "Blood platelets are found only in the blood of",
"opts": [
"Birds",
"Reptiles",
"Amphibians",
"Mammals"
]
},
{
"n": 32,
"stem": "“Organ of Jacobson” helps in",
"opts": [
"Touch",
"Vision",
"Smell",
"Hear"
]
},
{
"n": 33,
"stem": "If mammalian ovum fails to get fertilised, which one of the following is unlikely?",
"opts": [
"Corpus luteum will disintegrate.",
"Primary follicle starts developing.",
"Estrogen secretion further decreases.",
"Progesterone secretion rapidly declines."
]
},
{
"n": 34,
"stem": "The Volume of 0.6 M NaOH required to neutralise 30 cm 3 of 0.4 M HCl is",
"opts": [
"20 cm3",
"30 cm3",
"40 cm3",
"50 cm3"
]
},
{
"n": 35,
"stem": "The reaction of acetamide with water is called",
"opts": [
"Alcoholysis",
"Ammonolysis",
"Hydrolysis",
"Sponification"
]
},
{
"n": 36,
"stem": "Lactose is disaccharide of",
"opts": [
"Glucose and fructose.",
"Glucose and glucose.",
"Glucose and maltose.",
"Glucose and galactose."
]
},
{
"n": 37,
"stem": "Which carbohydrate is essential constituent of plant cell?",
"opts": [
"Starch",
"Cellulose",
"Glucose",
"Sucrose"
]
},
{
"n": 38,
"stem": "The enzyme responsible for reduction of molecular nitrogen to the level of ammonia in the leguminous root nodules is",
"opts": [
"Amminase",
"Nitrate reductase",
"Nitrogenase",
"Nitrite reductase"
]
},
{
"n": 39,
"stem": "The isomers have the same",
"opts": [
"Structural formula",
"Chemical properties",
"Physical properties",
"Molecular formula"
]
},
{
"n": 40,
"stem": "The elements that make up 99% of all elements found in living system are",
"opts": [
"C, H, O",
"C, H, O, N",
"C, H, O, N, P",
"C, H, O, P"
]
},
{
"n": 41,
"stem": "What type of carbohydrate is cane sugar?",
"opts": [
"Monosaccharide",
"Disaccharide",
"Trisaccharide",
"Polysaccharide"
]
},
{
"n": 42,
"stem": "During depression of freezing point in a solution, which of the following are in equilibrium?",
"opts": [
"Liquid solvent, solid solvent",
"Liquid solvent, solid solute",
"Liquid solute, solid solvent",
"None of the above"
]
},
{
"n": 43,
"stem": "Which part of our body secrets the hormone secretin?",
"opts": [
"Ileum",
"Stomach",
"Duodenum",
"Oesophagus"
]
},
{
"n": 44,
"stem": "The bond angle in water is",
"opts": [
"90°",
"105°",
"107°",
"120°"
]
},
{
"n": 45,
"stem": "Which one of the following has the highest number of species in nature?",
"opts": [
"Fungi",
"Angiosperms",
"Birds",
"Insects"
]
},
{
"n": 46,
"stem": "The pH of a solution is 5.9. If the hydrogen ion concentration is decreased hundred times, the solution will be",
"opts": [
"More acidic",
"Neutral",
"Basic",
"Of the same acidity."
]
},
{
"n": 47,
"stem": "Which of the following species are restricted to an area?",
"opts": [
"Sibling species",
"Endemic species",
"Allopatric species",
"Sympatric species"
]
},
{
"n": 48,
"stem": "Which one of the following is against the theory of ascent of sap given by Dixon and Jolly?",
"opts": [
"Cohesion force of water molecules.",
"Adhesive force of water molecules.",
"Requirement of ATP.",
"None of the above."
]
},
{
"n": 49,
"stem": "Which of the following is not a purpose of transpiration?",
"opts": [
"Supplies water for photosynthesis.",
"Helps in translocation of sugars from source to sink.",
"Maintains shape and structure of the plants.",
"Transports minerals from the soil to all parts of the plant."
]
},
{
"n": 50,
"stem": "NH3 dissolves in H2O to give NH4OH. In this reaction water acts as",
"opts": [
"an acid.",
"a base.",
"a salt.",
"a conjugate base."
]
},
{
"n": 51,
"stem": "When a buffer solution of CH3COONa and CH3COOH is diluted with water, then",
"opts": [
"H+ ion concentration increases.",
"H+ ion concentration decreases.",
"H+ ion concentration remains constant.",
"CH3COO- ion concentration increases."
]
},
{
"n": 52,
"stem": "In human female, menstruation can be deferred by the administration of",
"opts": [
"FSH only.",
"LH only.",
"Combination of FSH and LH.",
"Combination of estrogens and progesterone."
]
},
{
"n": 53,
"stem": "What makes a lemon sour?",
"opts": [
"Oxalic acid",
"Tartaric acid",
"Citric acid",
"Hydrochloric acid"
]
},
{
"n": 54,
"stem": "Formic acid is prepared by heating oxalic acid with",
"opts": [
"Glycol",
"Glycerol",
"Glycine",
"Acetic anhydride"
]
},
{
"n": 55,
"stem": "Which of the following scientist’s name is correctly matched with the theory put forth by him?",
"opts": [
"Weismann – Theory of continuity of germplasm.",
"Pastuer – Inheritance of acquired characters.",
"De Vries – Natural selection.",
"Mendel – Theory of pangenesis."
]
},
{
"n": 56,
"stem": "Evolutionary history of an organism is known as",
"opts": [
"Ancestry",
"Ontogeny",
"Phylogeny",
"Palaeontology"
]
},
{
"n": 57,
"stem": "Pineal gland of human brain secrets melatonin concerned with",
"opts": [
"Anger",
"Body temperature",
"Sleep",
"Colouration of skin"
]
},
{
"n": 58,
"stem": "Lower carboxylic acids are soluble in water due to",
"opts": [
"Low molecular weight.",
"Dissociation into ions.",
"H-bonding.",
"Easy hydrolysis."
]
},
{
"n": 59,
"stem": "Bacterium Pseudomonas is useful as it can",
"opts": [
"fix atmospheric nitrogen.",
"decompose a variety of organic compounds.",
"produce several antibodies.",
"None of the above."
]
},
{
"n": 60,
"stem": "Blood dialyser works on the physical laws of",
"opts": [
"Imbibitions and osmosis.",
"Plasmolysis.",
"Imbibitions and diffusion.",
"Diffusion and osmosis."
]
},
{
"n": 61,
"stem": "Which pair is essential for the growth of fish in water?",
"opts": [
"Nitrates and sulphates",
"Sulphanates and carbonates",
"Calcium and phosphate",
"Carbonates and phosphates"
]
},
{
"n": 62,
"stem": "In malaria, the product released by mosquitoes into blood that causes chill and fever is called",
"opts": [
"Haematin",
"Schuffner’s dots",
"Haematoxin",
"Haemazoin"
]
},
{
"n": 63,
"stem": "Status of Red Panda is",
"opts": [
"Critically endangered",
"Endangered",
"Vulnerable",
"Extinct"
]
},
{
"n": 64,
"stem": "Leaf abscission is caused by",
"opts": [
"Auxin",
"ABA",
"Gibberellins",
"Cytokinin"
]
},
{
"n": 65,
"stem": "In thermodynamics, a process is called reversible when",
"opts": [
"surroundings and system change into each other.",
"there is no boundary between system and surroundings.",
"the surroundings are always in equilibrium with the system.",
"the system changes into the surroundings spontaneously."
]
},
{
"n": 66,
"stem": "In some plants, anthers and stigma grow and mature at the same time. This phenomenon is called",
"opts": [
"Homogamy",
"Allogamy",
"Syngamy",
"Fusion"
]
},
{
"n": 67,
"stem": "Anatomically, fairly old dicotyledonous root is distinguished from the dicotyledonous stem by",
"opts": [
"absence of secondary xylem.",
"absence of secondary phloem.",
"presence of cortex.",
"position of protoxylem."
]
},
{
"n": 68,
"stem": "The minerals involved in water-splitting reaction during photosynthesis are",
"opts": [
"Magnesium and chlorine",
"Potassium and manganese",
"Manganese and chlorine",
"Copper and chlorine"
]
},
{
"n": 69,
"stem": "The C4 plants are photosynthetically more efficient than C 3 plants because of",
"opts": [
"the higher leaf area.",
"the presence of more chloroplasts.",
"the lower rate of photorespiration.",
"the carbon dioxide efflux is not prevented."
]
},
{
"n": 70,
"stem": "The ‘Eyes’ of the potato tuber are",
"opts": [
"Root buds",
"Shoot buds",
"Flower buds",
"Axillary buds"
]
}
]"""

KEY = {
    2: ("d", "Heartwood consists of dead, non-conducting, often tannin-filled elements; sapwood conducts water."),
    3: ("a", "Blood gives up most oxygen in the tissue capillaries."),
    4: ("c", "From the eardrum inwards: malleus, incus, stapes."),
    6: ("a", "Down the group electron affinity and oxidising power fall, so halogens gain electrons less readily."),
    7: ("d", "Oceans hold the largest share (about 70%) of global carbon."),
    9: ("b", "Red phosphorus is a polymeric chain of P4 units, so it is far less reactive than P4 (white/ yellow)."),
    12: ("b", "Red phosphorus is used on the striking surface of safety match boxes."),
    13: ("a", "In free expansion against vacuum, external pressure is zero, so no work is done."),
    14: ("b", "The total entropy of system plus surroundings increases in an irreversible (spontaneous) process."),
    15: ("a", "Parathormone raises blood calcium and reduces its excretion by the kidney."),
    16: ("b", "Haemoglobin binds carbon monoxide about 200-250 times more strongly than oxygen."),
    22: ("a", "From outside: epiblema, cortex, endodermis, pericycle."),
    23: ("a", "Radioactive decay is a nuclear process - it changes the nucleus, not the electrons."),
    25: ("a", "Lignin is deposited in the walls of xylem elements (vessels, tracheids, fibres)."),
    26: ("b", "Conversion of nitrate to nitrogen gas is denitrification."),
    27: ("c", "The embryo sac is the female gametophyte of flowering plants."),
    29: ("c", "H2SO4 is dibasic: 1 M = 2 N."),
    30: ("c", "Na2CO3 has an n-factor of 2: M = N/2 = 0.1 M."),
    31: ("d", "Platelets (cell fragments) occur only in mammals; other vertebrates have nucleated thrombocytes."),
    32: ("c", "Jacobson's (vomeronasal) organ is used for smell."),
    35: ("c", "Reaction with water is hydrolysis (acetamide gives acetic acid and ammonia)."),
    36: ("d", "Lactose = glucose + galactose."),
    37: ("b", "Cellulose is the essential structural carbohydrate of plant cell walls."),
    38: ("c", "Nitrogenase reduces N2 to ammonia in root nodules."),
    42: ("a", "At the freezing point of a solution, liquid solvent is in equilibrium with solid (frozen) solvent."),
    44: ("b", "The H-O-H bond angle is about 104.5° (≈105°)."),
    46: ("c", "Decreasing [H+] 100 times raises pH by 2 to 7.9 - basic."),
    47: ("b", "Endemic species are restricted to a particular area."),
    48: ("c", "The cohesion-tension theory is a passive process; it needs no ATP."),
    49: ("b", "Sugars are translocated through phloem by pressure flow, not by transpiration."),
    51: ("c", "Dilution changes both acid and salt equally, so [H+] (pH) of the buffer stays almost constant."),
    52: ("d", "Oestrogen and progesterone (e.g. the pill) keep the endometrium and delay menstruation."),
    53: ("c", "Lemons are sour because of citric acid."),
    55: ("a", "Weismann proposed the continuity of germplasm."),
    57: ("c", "Melatonin from the pineal gland regulates sleep-wake (circadian) rhythm."),
    58: ("c", "Lower carboxylic acids form hydrogen bonds with water."),
    60: ("d", "A dialyser removes waste by diffusion (and water by osmosis/ ultrafiltration) across a semi-permeable membrane."),
    62: ("d", "Haemozoin (malarial pigment) and toxins released when infected red cells burst cause chills and fever - released from the parasite in the blood, not by the mosquito itself."),
    63: ("b", "The red panda is listed as Endangered on the IUCN Red List."),
    64: ("b", "Abscisic acid (with ethylene) promotes leaf abscission."),
    65: ("c", "A reversible process proceeds through equilibrium states, with system and surroundings always in equilibrium."),
    67: ("d", "Roots have exarch protoxylem (towards the outside); stems have endarch protoxylem."),
    69: ("c", "C4 plants concentrate CO2 around RuBisCO, so photorespiration is very low."),
}

NEW_MCQ = [
    ("Cut flowers last longer when placed in a solution containing a little sugar because the sugar", ["kills all bacteria", "provides food for respiration", "stops transpiration", "makes the stem woody"], "b",
     "Sugar supplies respiratory substrate to the cut flowers, delaying senescence."),
    ("Under the IUCN Red List, a species facing an extremely high risk of extinction in the wild is classified as", ["Vulnerable", "Near threatened", "Critically endangered", "Least concern"], "c",
     "Critically Endangered is the IUCN category for an extremely high risk of extinction in the wild."),
    ("After ovulation, the ruptured Graafian follicle changes into the", ["Corpus luteum", "Corpus albicans", "Primary follicle", "Zona pellucida"], "a",
     "The empty follicle becomes the corpus luteum, which secretes progesterone."),
    ("The two most abundant elements by mass in the human body are", ["Carbon and hydrogen", "Oxygen and carbon", "Nitrogen and oxygen", "Calcium and phosphorus"], "b",
     "Oxygen (about 65%) and carbon (about 18%) are the most abundant by mass, mainly because of water and organic molecules."),
    ("Eutrophication of lakes is mainly caused by excess", ["Nitrates and phosphates", "Sodium and chloride", "Iron and copper", "Calcium and magnesium"], "a",
     "Run-off of nitrate and phosphate fertilisers causes algal blooms and oxygen depletion (eutrophication)."),
]

SAQ = [
 dict(marks=3, stem="Plants have chlorophyll a, which is the primary pigment for the light reaction, but they also have other pigments called accessory pigments.\n(a) What are the accessory pigments? (1.5 marks)\n(b) What are the roles of accessory pigments in photosynthesis? (1.5 marks)",
      kp=[("(a) Pigments other than chlorophyll a: chlorophyll b, carotenoids (carotenes, xanthophylls), phycobilins (in algae)", 1.5),
          ("(b) Absorb light of other wavelengths and pass the energy to chlorophyll a (wider range of light used); protect chlorophyll from photo-oxidation", 1.5)],
      model="(a) Accessory pigments are the light-absorbing pigments other than chlorophyll a: chlorophyll b, the carotenoids (carotenes such as β-carotene, and xanthophylls) and, in some algae and cyanobacteria, phycobilins (phycoerythrin, phycocyanin). (b) They absorb light of wavelengths that chlorophyll a absorbs poorly (e.g. blue-green and green) and transfer the absorbed energy to chlorophyll a in the reaction centre, so a wider range of light is used for photosynthesis; carotenoids also protect chlorophyll and the photosystems from photo-oxidation by excess light."),
 dict(marks=3, stem="What is the difference between saprophytic and saprozoic nutrition? (3 marks)",
      kp=[("Saprophytic: organisms (fungi, many bacteria) secrete enzymes onto dead organic matter, digest it outside the body and absorb the soluble products", 1.5),
          ("Saprozoic: animals/ protozoans absorb already dissolved organic matter (decayed matter) through their body surface, e.g. some protozoa, tapeworm-like absorption", 1.5)],
      model="Saprophytic nutrition is found in fungi and many bacteria: they live on dead and decaying organic matter, secrete digestive enzymes onto it, digest it outside their bodies and then absorb the simple soluble products (e.g. Rhizopus, mushrooms). Saprozoic nutrition is found in some animals and protozoans (e.g. Monocystis and some free-living protozoa): they absorb organic matter that is already dissolved, from decaying material or the surrounding fluid, directly through their body surface without digesting solid food outside."),
 dict(marks=3, stem="Terrestrial animals are generally either ureotelic or uricotelic, and not ammonotelic. Why? (3 marks)",
      kp=[("Ammonia is very toxic and highly soluble - it needs large amounts of water to flush out (ammonotelic animals are mostly aquatic)", 1),
          ("Land animals must conserve water, so they convert ammonia into less toxic urea (needs less water) or uric acid (almost insoluble, excreted as paste/ pellets)", 1.5),
          ("Examples: mammals and amphibians are ureotelic; birds, reptiles and insects are uricotelic", 0.5)],
      model="Ammonia is very toxic and must be kept dilute; to excrete it an animal needs a large amount of water, so ammonotelism suits aquatic animals that live in plenty of water. Terrestrial animals have to conserve water, so they convert ammonia into less toxic forms that need less water to excrete: urea (made in the liver by the ornithine cycle), which is moderately soluble and less toxic - ureotelic animals such as mammals and adult amphibians; or uric acid, which is almost insoluble and can be excreted as a paste or pellets with very little water - uricotelic animals such as birds, reptiles and insects (useful also for animals developing in shelled eggs)."),
 dict(marks=3, stem="What is the molarity of an aqueous solution of ethanoic acid (CH3COOH) which contains 6.0 g of ethanoic acid in 500 ml of the solution? (3 marks)",
      kp=[("Molar mass of CH3COOH = 60 g/mol", 1), ("Moles = 6.0 / 60 = 0.1 mol", 1), ("Molarity = 0.1 mol / 0.5 L = 0.2 M", 1)],
      model="Molar mass of CH3COOH = 2(12) + 4(1) + 2(16) = 60 g/mol. Moles of acid = 6.0 ÷ 60 = 0.1 mol. Volume = 500 ml = 0.5 L. Molarity = 0.1 ÷ 0.5 = 0.2 mol/L (0.2 M)."),
 dict(marks=3, stem="Explain the antibiotic resistance observed in bacteria in the light of Darwin's theory of natural selection. (3 marks)",
      kp=[("Variation: in a bacterial population a few cells already carry resistance genes (by mutation or gene transfer)", 1),
          ("Selection: the antibiotic kills susceptible bacteria; resistant ones survive (survival of the fittest)", 1),
          ("Inheritance: survivors multiply and pass on resistance, so the population becomes resistant over generations; misuse/ incomplete courses speed this up", 1)],
      model="Darwin's natural selection needs variation, selection and inheritance. (1) Variation: in a large population of bacteria, a few individuals already have genes for resistance, arising by chance mutation or gained from other bacteria by plasmids. (2) Selection: when an antibiotic is used, it kills the susceptible bacteria, while the resistant ones survive - the 'fittest' in that environment. (3) Inheritance: the surviving resistant bacteria multiply rapidly and pass the resistance genes to their offspring (and to other bacteria), so over many generations the population becomes mostly resistant. Overuse, misuse and incomplete courses of antibiotics increase this selection pressure."),
 dict(marks=3, stem="In dim light you can see better by looking through the corner of the eye. Why? (3 marks)",
      kp=[("Rods (contain rhodopsin) work in dim light; cones need bright light", 1), ("Fovea/ yellow spot at the centre has only cones; rods are concentrated in the periphery of the retina", 1),
          ("Looking from the corner focuses the image on the peripheral retina rich in rods, giving better dim-light (scotopic) vision", 1)],
      model="The retina has two kinds of photoreceptors: cones, which work in bright light and give colour and detail, and rods, which contain rhodopsin and are very sensitive, working in dim light. The centre of the retina, the fovea of the yellow spot, contains only cones, while rods are most numerous in the peripheral parts of the retina. When we look at an object from the corner of the eye in dim light, its image falls on the peripheral retina, where the rods are concentrated, so it is seen better than when looked at directly (when the image falls on the cone-only fovea)."),
 dict(marks=3, stem="Define the term polymer. Give the names of one natural polymer and one synthetic polymer and mention the monomers present in them. (3 marks)",
      kp=[("Polymer: a very large molecule (macromolecule) made by joining many small repeating units (monomers) by covalent bonds", 1),
          ("Natural polymer and its monomer, e.g. starch/ cellulose - glucose; protein - amino acids; natural rubber - isoprene", 1),
          ("Synthetic polymer and its monomer, e.g. polythene - ethene; PVC - vinyl chloride; nylon-6,6 - hexamethylenediamine and adipic acid", 1)],
      model="A polymer is a very large molecule (macromolecule) formed by joining a large number of small repeating units called monomers through covalent bonds (polymerisation). Natural polymer: starch (or cellulose), whose monomer is glucose (natural rubber is made of isoprene, proteins of amino acids). Synthetic polymer: polythene (polyethylene), whose monomer is ethene, CH2=CH2 (PVC from vinyl chloride; nylon-6,6 from hexamethylenediamine and adipic acid)."),
 dict(marks=3, stem="The probability of fruit set in a self-pollinated bisexual flower of a plant is far greater than in a dioecious plant. Explain. (3 marks)",
      kp=[("Bisexual self-pollinated flower: anthers and stigma in the same flower, so pollen reaches the stigma easily and reliably (often even before opening - cleistogamy)", 1.5),
          ("Dioecious plant: male and female flowers on separate plants - pollination depends on agents (wind, insects), distance and presence of both sexes; much pollen is wasted, so fruit set is less certain", 1.5)],
      model="In a bisexual flower that is self-pollinated, the anthers and stigma are in the same flower and often mature together, so pollen is transferred directly to the stigma (sometimes even before the flower opens, as in cleistogamous flowers). Pollination is assured and does not depend on outside agents, so the chance of fertilisation and fruit set is very high. A dioecious plant bears male and female flowers on separate plants, so pollen must be carried from one plant to another by wind, insects or other agents; this needs both sexes to grow nearby and to flower at the same time, and much pollen is lost on the way, so pollination and fruit set are far less certain."),
 dict(marks=3, stem="A transverse section of a tree trunk shows concentric dark and light coloured rings.\n(a) What are these rings called? (1 mark)\n(b) Why are the dark and light coloured rings of different thickness? (2 marks)",
      kp=[("(a) Annual (growth) rings", 1),
          ("(b) Spring/ early wood: cambium very active in spring/ favourable season - many wide, thin-walled vessels - light, broad band", 1),
          ("Autumn/ late wood: cambium less active - fewer, narrow, thick-walled elements - dark, narrow band; one light + one dark ring = one year's growth", 1)],
      model="(a) They are annual rings (growth rings). (b) The activity of the vascular cambium changes with the seasons. In spring (the favourable season) the cambium is very active and produces many xylem vessels with wide cavities and thin walls; this spring (early) wood is light in colour, less dense and forms a broad band. In autumn/ winter the cambium is less active and forms fewer, narrower elements with thick walls; this autumn (late) wood is darker, denser and forms a narrow band. One light band plus one dark band represents one year's growth, which is why the rings differ in colour and thickness and can be used to estimate the age of the tree."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
