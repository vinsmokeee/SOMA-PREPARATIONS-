"""ME Technical Paper II (General Subject Knowledge), BIO SCIENCE group, BCSE 2024 - real paper. PDF sent by the founder.
Same pattern as 2025 (Part I 70 MCQ x 1; Part II 10 short answers x 3), so it is ADDED to the paper's existing pattern.
Left out (answer not certain or no correct option): MCQ 14 (desired plant breed), 17 (two toxin diseases), 35 (honey
maltose %), 57 (no listed agent is an established prostate carcinogen), 64 (dilution: correct 990 mL not offered);
five new MCQs replace them. REPEATS: MCQs 2 and 34 are the same as 2025 MCQs 45 and 20, so they are not loaded again;
the year 2024 is recorded on the 2025 questions (question_appearances) instead. MCQ 3 options re-typed from the garbled PDF line.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Bio Science): BCSE 2024, batch 1"
GROUP_TAG = "biosci2024"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "bio-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper II, Bio Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Bio Science: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "In flowering plants, pith is a central part of the ground tissues generally made up of:",
"opts": [
"Parenchyma",
"Collenchyma",
"Chlorenchyma",
"Sclerenchyma"
]
},
{
"n": 2,
"stem": "Which tissue gives rise to secondary growth?",
"opts": [
"Apical meristem",
"Adventitious root",
"Germinating seed",
"Vascular cambium"
]
},
{
"n": 3,
"stem": "The purplish red pigment rhodopsin contained in the rods type of photoreceptor cells of human eye is a derivative of:",
"opts": [
"Vitamin B1",
"Vitamin",
"C Vitamin A",
"Vitamin D"
]
},
{
"n": 4,
"stem": "The fertilisation in which male gametes are carried through pollen tube is known as:",
"opts": [
"Syngamy",
"Siphonogamy",
"Poromay",
"Chalazogamy"
]
},
{
"n": 5,
"stem": "Vernalisation stimulates flowering in:",
"opts": [
"Zamikand",
"Turmeric",
"Carrot",
"Ginger"
]
},
{
"n": 6,
"stem": "Hormone replacing the requirement of vernalisation is:",
"opts": [
"Ethylene",
"Giberrellins",
"Auxin",
"Cytokinin"
]
},
{
"n": 7,
"stem": "In malaria, the product released by mosquitoes into blood that causes chill and fever is called:",
"opts": [
"Haematin",
"Schuffner’s dots",
"Haematoxin",
"Haemazoin"
]
},
{
"n": 8,
"stem": "Which part of our body secretes the hormone secretin?",
"opts": [
"Ileum",
"Duodenum",
"Stomach",
"Oesophagus"
]
},
{
"n": 9,
"stem": "Which of the following liquids would possess the highest vapour pressure at room temperature?",
"opts": [
"Acetic acid (b.p. 118 oC)",
"Chlorobenzene (b.p. 132 oC)",
"Nitrobenzene (b.p. 212 oC)",
"Methyl alcohol (b.p. 65 oC)"
]
},
{
"n": 10,
"stem": "Wings of insects and birds are:",
"opts": [
"Analogous",
"Homologous",
"Vestigial",
"Atavism"
]
},
{
"n": 11,
"stem": "Which of the following enzymes digests protein in stomach?",
"opts": [
"Trypsin",
"Pepsin",
"Erepsin",
"None of the above"
]
},
{
"n": 12,
"stem": "Which one of the following in birds indicates their reptilian ancestry?",
"opts": [
"Scales on their hind limbs",
"Four –chambered heart",
"Two special chambers crop and gizzards in their digestive tract",
"Egg with a calcareous shell"
]
},
{
"n": 13,
"stem": "Man-made crop Triticale is a hybrid between:",
"opts": [
"Wheat and Rye",
"Rice and Barley",
"Maize and Wheat",
"Rice and Maize"
]
},
{
"n": 14,
"stem": "The following is used to get desired breed of plants:",
"opts": [
"Tissue culture",
"Genetic engineering",
"Inbreeding",
"None of the above"
]
},
{
"n": 15,
"stem": "How many gramme of CH3OH should be added to water to prepare 150 ml solution of 2.0 M CH3OH?",
"opts": [
"32.0 g",
"9.6 g",
"16.0 g",
"9.0 g"
]
},
{
"n": 16,
"stem": "Which one of the following is a systematic insecticide?",
"opts": [
"Malathion",
"Endrin",
"Parathion",
"Furadan"
]
},
{
"n": 17,
"stem": "Disease associated with secretion of toxin is:",
"opts": [
"TB",
"AIDS",
"Tetanus l",
"Food poisoning"
]
},
{
"n": 18,
"stem": "Cyanobacteria are useful biofertilisers in the field of:",
"opts": [
"Wheat",
"Maize",
"Rice",
"Sugarcane"
]
},
{
"n": 19,
"stem": "Grapheme is a good conductor of electricity because:",
"opts": [
"It is an allotrope of carbon",
"It has unpaired electrons",
"It has sheet structure",
"None of the above"
]
},
{
"n": 20,
"stem": "A free-living aerobic and non-photosynthetic nitrogen-fixing bacterium is:",
"opts": [
"Anabaena",
"Azotobacter",
"Rhizobium",
"Clostridium"
]
},
{
"n": 21,
"stem": "Which one of the following is a good electrolyte in aqueous solution?",
"opts": [
"Metallic solid",
"Covalent solid",
"Ionic solid",
"Molecular solid"
]
},
{
"n": 22,
"stem": "The pH of a solution is increased from 3 to 6. So, its H+ ion concentration will be:",
"opts": [
"Reduced to half",
"Doubled",
"Increased by 100 times",
"Reduced by 1000 times"
]
},
{
"n": 23,
"stem": "Which one of the following provides most evident proof of evolution?",
"opts": [
"Fossils",
"Morphology",
"Embryo",
"Vestigial organs"
]
},
{
"n": 24,
"stem": "Theory of continuity of germplasm was propounded by:",
"opts": [
"Mendel",
"Lamarck",
"Weismann",
"Haeckel"
]
},
{
"n": 25,
"stem": "The species listed in Red Data Book are:",
"opts": [
"Threatened",
"Endangered",
"Rare",
"All of the above"
]
},
{
"n": 26,
"stem": "All of the following are included under in situ conservation except:",
"opts": [
"Botanical garden",
"Biosphere reserve",
"National park",
"Sanctuary"
]
},
{
"n": 27,
"stem": "Which one of the following is an example of ex situ conservation? :",
"opts": [
"Wildlife sanctuary",
"Seed bank",
"Sacred groves",
"National park"
]
},
{
"n": 28,
"stem": "Resonance structure of molecule does not have:",
"opts": [
"Identical arrangement of atoms",
"Nearly the same energy content",
"The same number of paired electrons",
"Identical bonding"
]
},
{
"n": 29,
"stem": "Formic acid is prepared by heating oxalic acid with:",
"opts": [
"Glycol",
"Glycine",
"Glycerol",
"Acetic anhydride"
]
},
{
"n": 30,
"stem": "The excretory material of bony fish is:",
"opts": [
"Urea",
"Protein",
"Amino acid",
"Ammonia"
]
},
{
"n": 31,
"stem": "The principal nitrogenous excretory compound in human is synthesised:",
"opts": [
"In kidney but eliminated mostly through liver",
"In kidney as well as eliminated by kidneys",
"In liver and also eliminated by the same through bile",
"In the liver, but eliminated mostly through kidneys"
]
},
{
"n": 32,
"stem": "Which tissue acts as the first line of protection for our body from any physical or chemical damage?",
"opts": [
"Adipose tissue",
"Epithelial tissue",
"Mascular tissue",
"Areolar tissue"
]
},
{
"n": 33,
"stem": "10 g of NaCl is dissolved in 106 g of the solution. Its concentration is:",
"opts": [
"0,1 ppm",
"1.0 ppm",
"10 ppm",
"100 ppm"
]
},
{
"n": 34,
"stem": "Which is common to kidney and skeleton in mammals?",
"opts": [
"Cortex",
"Pelvis",
"Radius",
"Medulla"
]
},
{
"n": 35,
"stem": "In honey, the percentage of maltose and other sugar is:",
"opts": [
"8.5",
"9.5",
"10.5",
"11.5"
]
},
{
"n": 36,
"stem": "Which one of these diseases in animals is caused by Babesia bigemina?",
"opts": [
"Rinderpest",
"Tick fever",
"Anthrax",
"Diarrhoea"
]
},
{
"n": 37,
"stem": "Which hormone affects opening and closing of stomata?",
"opts": [
"Ethylene",
"GA",
"Abscisic acid",
"Zeatin"
]
},
{
"n": 38,
"stem": "Graham’s law is correlated with:",
"opts": [
"Diffusion",
"Osmoregupation",
"Osmosis",
"Absorption"
]
},
{
"n": 39,
"stem": "Plasmolysis is the result of:",
"opts": [
"Endosmosis",
"Exosmosis",
"Reverse osmosis",
"None of the above"
]
},
{
"n": 40,
"stem": "Exarch and polyarch xylem strands are found in:",
"opts": [
"Monocot stem",
"Dicot stem",
"Monocot root",
"Dicot root"
]
},
{
"n": 41,
"stem": "IUPAC name for C2H5CN is:",
"opts": [
"Ethyl cyanide",
"Acetonitrile",
"Propane nitrile",
"Ethane nitrile"
]
},
{
"n": 42,
"stem": "An aqueous solution of glucose is 10% in strength. The volume in which 1 g mole of it is dissolved will be:",
"opts": [
"1.0 litre",
"1.8 litre",
"8.0 litre",
"0.8 litre"
]
},
{
"n": 43,
"stem": "Gibberellin was first extracted from:",
"opts": [
"Aspergillus",
"Gelidium",
"Gracelaria",
"Gibberella fujikuroi"
]
},
{
"n": 44,
"stem": "Removal of Ringwood of tissue outside the vascular cambium from the tree trunk kills it because:",
"opts": [
"Water cannot move up",
"Shoot becomes starved",
"Annual rings are not produced",
"Food does not travel down and root becomes starved"
]
},
{
"n": 45,
"stem": "The cells without nuclei are present in:",
"opts": [
"Companion cell",
"Members of sieve tube",
"Vascular cambium",
"Root hairs"
]
},
{
"n": 46,
"stem": "The term ‘mutation’ was introduced by:",
"opts": [
"Hugo deVries",
"Darwin",
"Muller",
"Morgan"
]
},
{
"n": 47,
"stem": "When a mutation is limited to the substitution of one nucleotide for another it is called:",
"opts": [
"Translocation",
"Frameshift",
"Base inversion",
"Point mutation"
]
},
{
"n": 48,
"stem": "The basis of paper chromatography is:",
"opts": [
"Absorption",
"Adsorption",
"Partition",
"Hydration"
]
},
{
"n": 49,
"stem": "A mixture which boils off like a single pure compound is called:",
"opts": [
"Eutectic",
"Azeotrope",
"Ideal solution",
"Saturated solution"
]
},
{
"n": 50,
"stem": "‘Descent with modification’ is the main theme of:",
"opts": [
"Genetics and interpretation",
"Biogenesis",
"Recapitulation",
"Evolution"
]
},
{
"n": 51,
"stem": "The theory of use and disuse organ was proposed by:",
"opts": [
"Darwin",
"Lamarck",
"deVries",
"Hooker"
]
},
{
"n": 52,
"stem": "The low density of ice as compared to water is due to:",
"opts": [
"Induced dipole-induced dipole interactions",
"Dipole-induced dipole interactions",
"Hydrogen bonding interactions",
"Dipole-dipole interactions"
]
},
{
"n": 53,
"stem": "The hybridization of carbon atom in benzene is:",
"opts": [
"sp",
"sp2",
"sp3",
"dsp2"
]
},
{
"n": 54,
"stem": "Which one is used as a biofertiliser?",
"opts": [
"Nostoc",
"Volvox",
"Funaria",
"Rhizopus"
]
},
{
"n": 55,
"stem": "‘Mammalian thymus’ is mainly concerned with:",
"opts": [
"Regulation of body temperature",
"Regulation of body growth",
"Immunological function",
"Secretion of thyrotropin"
]
},
{
"n": 56,
"stem": "Which one of the following diseases is spread by housefly?",
"opts": [
"Malaria",
"Pneumonia",
"Tuberculosis",
"Typhoid"
]
},
{
"n": 57,
"stem": "Which of the following causes prostate cancer?",
"opts": [
"Chromium",
"Chromium oxide",
"Vinyl chloride",
"Aflatoxins"
]
},
{
"n": 58,
"stem": "The metallic lustre exhibited by sodium is explained by:",
"opts": [
"Diffusion of sodium ions",
"Excitation of free protons",
"Oscillation of loose electrons",
"Existence of body centred cubic lattice"
]
},
{
"n": 59,
"stem": "Which one contains both polar and non-polar bonds?",
"opts": [
"NH4Cl",
"HCN",
"H2O2",
"CH4"
]
},
{
"n": 60,
"stem": "Which one of the following help in blood coagulation?",
"opts": [
"Leucocytes",
"Monocytes",
"Lymphocytes",
"Thrombocytes"
]
},
{
"n": 61,
"stem": "Sympathetic nerve accelerates heart beat due to:",
"opts": [
"Insulin",
"Adrenalin",
"Glucagon",
"None of the above"
]
},
{
"n": 62,
"stem": "The ‘Eyes’ of the potato tuber are:",
"opts": [
"Root buds",
"Flower buds",
"Shoot buds",
"Axillary buds"
]
},
{
"n": 63,
"stem": "What is the function of germ pore?",
"opts": [
"Emergence of radical",
"Adsorption of water for seed germination",
"Initiation of pollen tube",
"Release of male gametes"
]
},
{
"n": 64,
"stem": "Volume of water needed to mix with 10 ml of 10 N HNO3 to get 0.1 N HNO3 is:",
"opts": [
"900 ml",
"1000 ml",
"100 ml",
"20 ml"
]
},
{
"n": 65,
"stem": "Which will show maximum depression in freezing point when concentration is 0.1 M?",
"opts": [
"NaCl",
"Urea",
"Glucose",
"K2SO4"
]
},
{
"n": 66,
"stem": "Phenomenon which converts light energy into chemical energy is:",
"opts": [
"Respiration",
"Transpiration",
"Photosynthesis",
"Photons"
]
},
{
"n": 67,
"stem": "Which of the following elements are essential for photolysis of water?",
"opts": [
"Ca and Cl",
"Cu and Fe",
"Mn and Cl",
"Zn and I"
]
},
{
"n": 68,
"stem": "For yielding one molecule of glucose, the Calvin cycle turns:",
"opts": [
"Two times",
"Four times",
"Six times",
"Eight times"
]
},
{
"n": 69,
"stem": "When two species of different genealogy come to resemble each other as a results of adaptation, the phenomenon is termed:",
"opts": [
"Co-evolution",
"Convergent evolution",
"Divergent evolution",
"Microevolution"
]
},
{
"n": 70,
"stem": "In C3 plants, the first stable product of photosynthesis during the dark reaction is:",
"opts": [
"Malic acid",
"Oxaloacetic acid",
"Phosphoglyceraldehyde",
"3-phosphoglyceric acid"
]
}
]"""
_m = json_loads = __import__("json").loads(MCQ)
_m[2]["opts"] = ["Vitamin B1", "Vitamin C", "Vitamin A", "Vitamin D"]
_m[16]["opts"][2] = "Tetanus"
_m[32]["stem"] = "10 g of NaCl is dissolved in 10^6 g of the solution. Its concentration is:"
_m[32]["opts"][0] = "0.1 ppm"
_m[6]["stem"] = "In malaria, the product released into the blood that causes chills and fever is called:"
MCQ = __import__("json").dumps(_m)

KEY = {
    1: ("a", "Pith is mostly parenchyma."),
    3: ("c", "Rhodopsin's retinal comes from vitamin A."), 4: ("b", "Siphonogamy: male gametes carried by the pollen tube."),
    5: ("c", "Biennials like carrot need vernalisation to flower."), 6: ("b", "Gibberellins can replace the cold requirement."),
    7: ("d", "Haemozoin released when infected red cells burst causes chills and fever."), 8: ("b", "Secretin is secreted by the duodenum."),
    9: ("d", "Methyl alcohol has the lowest boiling point, so the highest vapour pressure."), 10: ("a", "Insect and bird wings are analogous (same function, different origin)."),
    11: ("b", "Pepsin digests protein in the stomach."), 12: ("a", "Scales on birds' legs show reptilian ancestry."),
    13: ("a", "Triticale = wheat x rye."), 15: ("b", "0.150 L x 2.0 M = 0.30 mol x 32 g = 9.6 g."),
    16: ("d", "Furadan (carbofuran) is a systemic insecticide."), 18: ("c", "Cyanobacteria are biofertilisers in rice fields."),
    19: ("b", "Graphene's free (delocalised) electrons carry current."), 20: ("b", "Azotobacter is free-living, aerobic and non-photosynthetic."),
    21: ("c", "Ionic solids dissolve to give ions: good electrolytes."), 22: ("d", "pH 3 to 6: [H+] falls 1000 times."),
    23: ("a", "Fossils give the most direct evidence of evolution."), 24: ("c", "Weismann proposed germplasm continuity."),
    25: ("d", "The Red Data Book lists threatened, endangered and rare species."), 26: ("a", "A botanical garden is ex situ, not in situ."),
    27: ("b", "Seed banks are ex situ conservation."), 28: ("d", "Resonance structures differ in bonding (electron arrangement)."),
    29: ("c", "Oxalic acid heated with glycerol gives formic acid."), 30: ("d", "Bony fish excrete mainly ammonia."),
    31: ("d", "Urea is made in the liver and excreted by the kidneys."), 32: ("b", "Epithelial tissue is the first line of protection."),
    33: ("c", "10 g in 10^6 g = 10 ppm."),
    36: ("b", "Babesia bigemina causes tick fever (babesiosis)."), 37: ("c", "Abscisic acid closes stomata."),
    38: ("a", "Graham's law concerns diffusion (effusion) of gases."), 39: ("b", "Plasmolysis results from exosmosis."),
    40: ("c", "Monocot roots have exarch, polyarch xylem (dicot roots have 2-6 strands)."), 41: ("c", "C2H5CN is propanenitrile."),
    42: ("b", "10% = 10 g/100 mL; 180 g in 1.8 L."), 43: ("d", "Gibberellin was first isolated from Gibberella fujikuroi."),
    44: ("d", "Girdling removes phloem: food cannot reach the roots."), 45: ("b", "Mature sieve tube members lack nuclei."),
    46: ("a", "Hugo de Vries introduced the term mutation."), 47: ("d", "One-nucleotide substitution is a point mutation."),
    48: ("c", "Paper chromatography is partition chromatography."), 49: ("b", "An azeotrope boils at a constant temperature like a pure liquid."),
    50: ("d", "'Descent with modification' is evolution."), 51: ("b", "Lamarck proposed use and disuse."),
    52: ("c", "Hydrogen bonding gives ice an open, less dense structure."), 53: ("b", "Benzene carbons are sp2 hybridised."),
    54: ("a", "Nostoc (cyanobacterium) is a biofertiliser."), 55: ("c", "The thymus is mainly immunological (T-cell maturation)."),
    56: ("d", "Houseflies spread typhoid."), 58: ("c", "Lustre comes from oscillating free (loose) electrons."),
    59: ("c", "H2O2 has polar O-H and non-polar O-O bonds."), 60: ("d", "Thrombocytes (platelets) help clotting."),
    61: ("b", "Sympathetic action via adrenaline/noradrenaline speeds the heart."), 62: ("d", "Potato 'eyes' are axillary buds."),
    63: ("c", "The pollen tube emerges through the germ pore."), 65: ("d", "K2SO4 gives 3 ions (largest i), so the largest depression."),
    66: ("c", "Photosynthesis converts light to chemical energy."), 67: ("c", "Mn and Cl are needed for photolysis of water."),
    68: ("c", "Six turns of the Calvin cycle make one glucose."), 69: ("b", "Unrelated species becoming alike = convergent evolution."),
    70: ("d", "3-phosphoglyceric acid is the first stable product in C3 plants."),
}
NEW_MCQ = [
    ("Which technique is most widely used to produce many genetically identical, disease-free plantlets of a desired variety?", ["Micropropagation (tissue culture)", "Cross-pollination", "Seed treatment", "Grafting rootstocks only"], "a",
     "Tissue culture (micropropagation) multiplies identical plants rapidly, often virus-free via meristem culture."),
    ("Tetanus symptoms are caused mainly by", ["A neurotoxin (tetanospasmin) produced by Clostridium tetani", "Direct destruction of muscle by bacteria", "An allergic reaction", "A virus attacking nerves"], "a",
     "Tetanospasmin blocks inhibitory nerve signals, causing muscle spasms."),
    ("The main sugars in honey are", ["Fructose and glucose", "Sucrose and lactose", "Maltose and galactose", "Starch and glycogen"], "a",
     "Honey is mostly fructose (about 38%) and glucose (about 31%)."),
    ("Aflatoxins, produced by Aspergillus flavus on poorly stored grains and nuts, mainly cause cancer of the", ["Liver", "Skin", "Bone", "Eye"], "a",
     "Aflatoxin B1 is a potent liver carcinogen."),
    ("How much water must be added to 10 mL of 10 N HNO3 to make it 0.1 N?", ["90 mL", "990 mL", "1000 mL", "100 mL"], "b",
     "N1V1 = N2V2: 10 x 10 = 0.1 x V2, V2 = 1000 mL; water added = 1000 - 10 = 990 mL."),
]
SAQ = [
 dict(marks=3, stem="What is vegetative propagation? Give two suitable examples. (3 marks)",
      kp=[("Definition: asexual reproduction in which new plants arise from vegetative parts (root, stem, leaf) without seeds; offspring identical", 1), ("Two examples (1 each): stem tuber of potato, rhizome of ginger, runner of strawberry/ grass, bulb of onion, leaf of Bryophyllum, sweet potato roots; artificial - cuttings (rose), grafting (apple), layering", 2)],
      model="Vegetative propagation is asexual reproduction in which new plants develop from vegetative parts of the parent - root, stem or leaf - instead of seeds, so the offspring are genetically identical to the parent. Examples: potato from the 'eyes' (buds) of stem tubers; ginger and turmeric from rhizomes; onion from bulbs; Bryophyllum from buds on leaf margins; sweet potato from tuberous roots; artificially, roses from stem cuttings and apples by grafting."),
 dict(marks=3, stem="What is siphonogamy? Differentiate between parthenogenesis and parthenocarpy. (3 marks)",
      kp=[("Siphonogamy: male gametes carried to the egg through a pollen tube (seed plants)", 1), ("Parthenogenesis: development of an embryo/ new individual from an unfertilised egg (e.g. honeybee drones, some plants)", 1), ("Parthenocarpy: development of fruit without fertilisation, seedless fruit (banana, grapes), natural or induced by auxin/ GA", 1)],
      model="Siphonogamy is fertilisation in which the non-motile male gametes are carried to the egg through a pollen tube, as in gymnosperms and flowering plants. Parthenogenesis is the development of an embryo (a new individual) from an unfertilised egg, e.g. drones of honeybees and some plants. Parthenocarpy is the development of a fruit without fertilisation, giving seedless fruits such as banana and some grapes; it can be natural or induced by spraying auxins or gibberellins. Thus parthenogenesis produces an individual, parthenocarpy produces a seedless fruit."),
 dict(marks=3, stem="Saturated solutions of Na2SO4 and Al2(SO4)3 are mixed and allowed to crystallise. Write the name and formula of the crystals formed. (3 marks)",
      kp=[("Crystals: sodium alum (soda alum), a double salt", 1), ("Formula: Na2SO4·Al2(SO4)3·24H2O, i.e. NaAl(SO4)2·12H2O", 2)],
      model="On mixing and crystallising, a double salt called sodium alum (soda alum) is formed: Na2SO4·Al2(SO4)3·24H2O, usually written NaAl(SO4)2·12H2O. Like other alums it gives the simple ions Na+, Al3+ and SO4 2- in solution."),
 dict(marks=3, stem="Name the hormones involved in the regulation of spermatogenesis. (3 marks)",
      kp=[("GnRH from hypothalamus", 0.5), ("FSH acting on Sertoli cells (and ABP, inhibin)", 1), ("LH (ICSH) stimulating Leydig cells to secrete testosterone; testosterone essential", 1), ("Inhibin feedback (others: growth hormone)", 0.5)],
      model="Spermatogenesis is controlled by the hypothalamic-pituitary-testicular axis: gonadotropin-releasing hormone (GnRH) from the hypothalamus stimulates the anterior pituitary to release follicle-stimulating hormone (FSH) and luteinising hormone (LH, also called ICSH). LH stimulates Leydig cells to secrete testosterone (androgens), which is essential for spermatogenesis. FSH acts on Sertoli cells to support developing sperm and stimulate androgen-binding protein and inhibin; inhibin and testosterone give negative feedback to the hypothalamus and pituitary."),
 dict(marks=3, stem="Given the equation C12H22O11 + H2O → C6H12O6 + C6H12O6, what is the order of the reaction? Justify your answer. Also name the reactants and products. (3 marks)",
      kp=[("Order: first order (pseudo-first-order) - inversion of cane sugar", 1), ("Justification: water in large excess so its concentration effectively constant; rate depends only on [sucrose] (rate = k'[sucrose])", 1), ("Reactants: sucrose and water; products: glucose and fructose", 1)],
      model="This is the acid-catalysed hydrolysis (inversion) of cane sugar. Although two reactants appear, it is a pseudo-first-order reaction: water is present in large excess, so its concentration hardly changes and the rate depends only on the sucrose concentration (rate = k[sucrose]). Reactants: sucrose (C12H22O11) and water; products: glucose and fructose (both C6H12O6)."),
 dict(marks=3, stem="Why does chlorophyll appear red in reflected light and green in transmitted light? (3 marks)",
      kp=[("Green in transmitted light: chlorophyll absorbs red and blue light and transmits/ reflects green", 1.5), ("Red in reflected light: fluorescence - absorbed energy re-emitted as red light (about 680 nm) seen when solution viewed by reflected light", 1.5)],
      model="Chlorophyll strongly absorbs blue and red light and does not absorb green, so when light passes through a chlorophyll solution the transmitted light is green. When viewed by reflected light, the solution appears red because chlorophyll fluoresces: molecules excited by absorbed light lose energy by re-emitting it as longer-wavelength red light (about 680 nm), which is seen from the illuminated side."),
 dict(marks=3, stem="How is intracellular CO2 increased in C4 plants during the day? (3 marks)",
      kp=[("In mesophyll cells PEP carboxylase (high affinity, no oxygenase) fixes CO2/ HCO3- with PEP into oxaloacetate (C4 acid)", 1), ("OAA converted to malate/ aspartate and transported to bundle sheath cells (Kranz anatomy)", 1), ("Decarboxylated in bundle sheath releasing CO2, raising concentration around Rubisco; pyruvate returns, PEP regenerated (uses ATP); reduces photorespiration", 1)],
      model="In C4 plants, CO2 is first fixed in the mesophyll cells by PEP carboxylase, which has a high affinity for CO2 (as HCO3-) and no oxygenase activity, combining it with phosphoenolpyruvate to form oxaloacetate. This is converted to malate (or aspartate) and moved into the bundle sheath cells of the Kranz anatomy, where it is decarboxylated, releasing CO2. This concentrates CO2 around Rubisco in the bundle sheath, so the Calvin cycle works efficiently and photorespiration is suppressed; the pyruvate returns to the mesophyll and is converted back to PEP using ATP."),
 dict(marks=3, stem="A 0.2 M solution of a monobasic acid is 0.95% dissociated. Calculate its dissociation constant. (3 marks)",
      kp=[("α = 0.0095", 1), ("Ka = Cα²/(1 - α) ≈ Cα²", 1), ("Ka = 0.2 x (0.0095)² ≈ 1.8 x 10^-5", 1)],
      model="Degree of dissociation α = 0.95% = 0.0095. For a weak monobasic acid HA, Ka = Cα² / (1 - α). Ka = 0.2 x (0.0095)² / (1 - 0.0095) = 0.2 x 9.025 x 10^-5 / 0.9905 ≈ 1.82 x 10^-5 (≈ 1.8 x 10^-5 using Ka ≈ Cα²)."),
 dict(marks=3, stem="Name the cells that secrete mucus. What functions does mucus carry out? (3 marks)",
      kp=[("Goblet cells (also mucous cells of glands, e.g. gastric mucous neck cells, salivary/ submucosal glands)", 1), ("Functions: lubrication (food passage), protection of lining from acid/ enzymes/ abrasion", 1), ("Traps dust/ microbes in respiratory tract (mucociliary clearance), keeps surfaces moist, contains antibodies/ lysozyme", 1)],
      model="Mucus is secreted mainly by goblet cells of the epithelium of the respiratory and digestive tracts, and by mucous cells of glands (e.g. gastric mucous neck cells, salivary and submucosal glands). Functions: lubricates the passage of food and protects the gut lining from stomach acid, digestive enzymes and abrasion; in the respiratory tract it traps dust and microbes, which cilia sweep away (mucociliary clearance); it keeps surfaces moist and contains antibodies (IgA) and lysozyme that help defence."),
 dict(marks=3, stem="Why is photosynthesis called a process of transformation of photonic (light) energy into chemical energy? (3 marks)",
      kp=[("Chlorophyll absorbs photons; light reactions excite electrons, photolysis of water, O2 released", 1), ("Light energy stored as ATP and NADPH (photophosphorylation)", 1), ("ATP/ NADPH used in Calvin cycle to fix CO2 into glucose - energy stored in chemical bonds of carbohydrates", 1)],
      model="In photosynthesis, chlorophyll and other pigments absorb photons of light. This energy excites electrons in the photosystems, drives the splitting of water (releasing O2) and the electron transport chain, producing ATP (photophosphorylation) and NADPH - light energy is now stored chemically. In the Calvin cycle, ATP and NADPH are used to reduce CO2 into glucose and other carbohydrates, so the light energy ends up stored in the chemical bonds of organic molecules, which all living things use as food and fuel."),
]
Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
