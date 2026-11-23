"""ME Technical Paper II (General Subject Knowledge), BIO SCIENCE group, BCSE 2023 - real paper (PDF sent by the founder).
Same pattern as 2024/2025 (Part I 70 MCQ x 1; Part II 10 short answers x 3), so it is ADDED to the paper's pattern.
Already on Soma from BCSE 2024/2025 (recorded as appearances, not loaded again): MCQ 4, 7, 10, 12, 13, 18, 19, 27, 32,
35, 41, 60, 62 and 70. Left out: MCQ 5 (c and d are both incorrect), 15, 20 (progesterone, the hormone whose withdrawal
causes menstruation, is not offered), 24, 28 (options overlap), 40 (a and c are both buffers), 48 (no sensible option).
Seven new MCQs replace them.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Bio Science): BCSE 2023, batch 1"
GROUP_TAG = "bio2023"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "bio-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2023 Main Examination, Technical Paper II, Bio Science", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Bio Science: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Mobilisation of stored food in germinating seed is triggered by:",
"opts": [
"ABA",
"Cytokinin",
"GA",
"Ethylene"
]
},
{
"n": 2,
"stem": "Which hormone causes dilation of blood vessels, increased oxygen consumption and glucogenesis?",
"opts": [
"Glycogen",
"Insulin",
"ACTH",
"Adrenaline"
]
},
{
"n": 3,
"stem": "PGA as the first carbon dioxide fixation product was discovered in photosynthesis of:",
"opts": [
"Angiosperm",
"Alga",
"Bryophyte",
"Gymnosperm"
]
},
{
"n": 4,
"stem": "The theory of use and disuse of organ was propose by:",
"opts": [
"Darwin",
"deVries",
"Lamarck",
"Hooker"
]
},
{
"n": 5,
"stem": "Which of the following statements is INCORRECT?",
"opts": [
"Enzymes are in colloidal state.",
"Enzymes are catalysts.",
"Enzymes can catalyse any reaction.",
"Urea is an enzyme."
]
},
{
"n": 6,
"stem": "Sulphur is an important nutrient for optimum growth and productivity in:",
"opts": [
"Oilseed crops",
"Cereals",
"Pulse crops",
"Fibre crops"
]
},
{
"n": 7,
"stem": "10 g of NaCl is dissolved in 106 g of the solution. Its concentration is:",
"opts": [
"0.1 ppm",
"1.0 ppm",
"10 ppm",
"100 ppm"
]
},
{
"n": 8,
"stem": "Morphine, which is used as analgesic is obtained from:",
"opts": [
"Cinchona officinalis",
"Papaver somniferum",
"Taxus brevifolia",
"Berberis nilghiriensis"
]
},
{
"n": 9,
"stem": "Alzheimer’s disease in human is associated with the deficiency of:",
"opts": [
"Dopamine",
"Glutamic acid",
"Gamma Amino Butyric Acid",
"Acetylcholine"
]
},
{
"n": 10,
"stem": "Bartholin’s glands of female correspond to which glands in male?",
"opts": [
"Cowper’s glands",
"Inguinal glands",
"Prostate glands",
"Rectal glands"
]
},
{
"n": 11,
"stem": "For weak acid-strong base titration, the indicator used is:",
"opts": [
"Methyl orange",
"Blue litmus.",
"Phenolphthalein",
"K2Cr2O7"
]
},
{
"n": 12,
"stem": "An apparatus used for the measurement of quantity of electricity is known as:",
"opts": [
"Calorimeter",
"Coulometer",
"Colorimeter",
"None of the above"
]
},
{
"n": 13,
"stem": "Which of the following induces flowering in long day plants?",
"opts": [
"Gibberellins",
"Auxins",
"Cytokinin",
"Eythylene"
]
},
{
"n": 14,
"stem": "Fossil bird having reptilian characters evolved during which period?",
"opts": [
"Jurassic",
"Carboniferous",
"Triassic",
"Cretaceous"
]
},
{
"n": 15,
"stem": "Phylogenetic classification of plant was proposed by:",
"opts": [
"Lamarck",
"Linnaeus",
"Oswald Tippo t",
"Hutchinson"
]
},
{
"n": 16,
"stem": "pH of solution can be expressed as:",
"opts": [
"log10[H+]",
"–loge[H+]",
"– log10[H+]",
"Loge[H+]"
]
},
{
"n": 17,
"stem": "Which pigment involves in photoperiodic change in plants?",
"opts": [
"Chlorophyll",
"Phytochrome",
"Cytochrome",
"Anthocyanin"
]
},
{
"n": 18,
"stem": "The deteriorative process in plants that naturally terminate their functional life are collectively called:",
"opts": [
"Wilting",
"Abscission",
"Plasmolysis",
"Senescence"
]
},
{
"n": 19,
"stem": "Ontogeny recapitulates phylogeny, and this theory is called:",
"opts": [
"Biogenetic law",
"Law of embryology",
"Law of acquired characters",
"Law of bridges"
]
},
{
"n": 20,
"stem": "Withdrawal of which of the following hormones is the immediate cause of menstruation?",
"opts": [
"Estrogen",
"FSH",
"FSH-RH",
"None of the above"
]
},
{
"n": 21,
"stem": "Among mammals, a significant role in the digestion of milk is played by:",
"opts": [
"Rennin",
"Invertase",
"Amylase",
"Intestinal bacteria"
]
},
{
"n": 22,
"stem": "Length of petiole increases due to division of:",
"opts": [
"Apical meristem",
"Lateral meristem",
"Intercalary meristem",
"All the above"
]
},
{
"n": 23,
"stem": "Aerenchyma is helpful in plants by",
"opts": [
"providing buoyancy in hydrophytes.",
"absorption in stilt roots.",
"giving mechanical strength to plants.",
"giving flex ibility to plants."
]
},
{
"n": 24,
"stem": "Major radiation of mammals, birds and pollinating insects took place in which epoch?",
"opts": [
"Oligocene",
"Pliocene",
"Palaeocene",
"Miocene"
]
},
{
"n": 25,
"stem": "The spread of gene from one breeding population to another by migration which may result in change in gene frequency is:",
"opts": [
"Genetic frequency",
"Genetic drift",
"Gene flow",
"Mutation"
]
},
{
"n": 26,
"stem": "Which type of carbohydrate is cane sugar?",
"opts": [
"Polysaccharide",
"Trisaccharide",
"Disaccharide",
"None of the above"
]
},
{
"n": 27,
"stem": "Reagent which reacts with both acetaldehyde and acetone is:",
"opts": [
"Fehling",
"Grignard",
"Schiff’s",
"Tollen’s"
]
},
{
"n": 28,
"stem": "Chromosomal aberrations are caused by",
"opts": [
"change in the structure of gene.",
"change in the number of chromosomes.",
"change in the arrangement or position of genes.",
"change in the number of arrangement of genes in the chromosomes."
]
},
{
"n": 29,
"stem": "The drug which stimulates the nervous system and makes a person more wakeful, alert and active is called:",
"opts": [
"Sedative",
"Opiate narcotic",
"Stimulant",
"Hallucinogen"
]
},
{
"n": 30,
"stem": "Aromatic hydrocarbons are known as:",
"opts": [
"Alkanes",
"Alkenes",
"Alkynes",
"Arenes"
]
},
{
"n": 31,
"stem": "The ability of plant cells to re-regenerate the complete plants is known as:",
"opts": [
"Cell cloning",
"Tissue culture",
"Pleuropotency",
"Totipotency"
]
},
{
"n": 32,
"stem": "Somatic hybridisation can be done by:",
"opts": [
"Protoplast fusion",
"Haploid anther",
"Cell culture",
"Pollen culture"
]
},
{
"n": 33,
"stem": "The extra-embryonic membranes of mammalian embryo are derived:",
"opts": [
"Trophoblast",
"Follicle cells",
"Formative cells",
"Inner cell mass"
]
},
{
"n": 34,
"stem": "Volume of 0.6 M NaOH required to neutralise 30 cm3 of 0.4 M HCl is:",
"opts": [
"10 cm3",
"20 cm3",
"30 cm3",
"40 cm3"
]
},
{
"n": 35,
"stem": "The purplish red pigment rhodopsin contained in the rods type of photoreceptor cells of the human eye is derivative of:",
"opts": [
"Vitamin B1",
"Vitamin C",
"Vitamin D",
"Vitamin A"
]
},
{
"n": 36,
"stem": "Tendril of Cucurbita and thorns of Bougainvillea are examples of:",
"opts": [
"Analogous organs",
"Homologous organs",
"Vestigial organs",
"None of the above"
]
},
{
"n": 37,
"stem": "The synthesis of complex molecules from simple molecules was proved by:",
"opts": [
"Arrhenius",
"Pasteur",
"Stanley Miller",
"Darwin"
]
},
{
"n": 38,
"stem": "Production of glucose from amino acids, fatty acids and glycerol is called:",
"opts": [
"Glycolysis",
"Glycogenesis",
"Glycogenolysis",
"Gluconeogenesis"
]
},
{
"n": 39,
"stem": "An insect bite may result in inflammation of that spot. This is triggered by the alarm chemicals such as:",
"opts": [
"Histamine and dopamine",
"Histamine and kinnis",
"Interferons and semin",
"Interferons and histones"
]
},
{
"n": 40,
"stem": "A buffer solution can be prepared from a mixture of",
"opts": [
"sodium acetate and acetic acid in water.",
"sodium acetate and hydrochloric acid in water.",
"ammonia and ammonia chloride in water.",
"ammonia and sodium hydroxide in water."
]
},
{
"n": 41,
"stem": "Haemophilia is more commonly seen in human males than in human females because",
"opts": [
"this disease is due to an X-linked dominant mutation.",
"a greater proportion of girls die in infancy.",
"this disease is due to Y-linked recessive mutation.",
"this disease is due to X-linked recessive mutation."
]
},
{
"n": 42,
"stem": "Lipids, which can be found in oil-based salad dressings and ice cream, during digestion are split into:",
"opts": [
"Fatty acids and glycerol",
"Glycerol and amino acids",
"Glucose and fatty acids",
"Glucose and amino acids"
]
},
{
"n": 43,
"stem": "The ciliated columnar epithelial cells in humans are known to occur in:",
"opts": [
"Bile duct and oesophagus.",
"Eustachian tube and stomach lining.",
"Fallopian tubes and urethra.",
"Bronchioles and Fallopian tubes."
]
},
{
"n": 44,
"stem": "An enzyme which brings about the conversion of starch into maltose is known as:",
"opts": [
"Maltase",
"Invertase",
"Diastase",
"Zymase"
]
},
{
"n": 45,
"stem": "Hydrolysis of esters in alkaline medium is called:",
"opts": [
"Esterification",
"Saponification",
"Hydration",
"Alkalisation"
]
},
{
"n": 46,
"stem": "Corm is the modification of:",
"opts": [
"Root",
"Leaf",
"Stem",
"Bud"
]
},
{
"n": 47,
"stem": "Which one of the following does not exhibit autotomy?",
"opts": [
"Starfish",
"Crab",
"Lizard",
"Hydra"
]
},
{
"n": 48,
"stem": "Which of the following is considered to be the best chemical method of fixing atmospheric nitrogen?",
"opts": [
"Fisher method",
"Decan method",
"Parnas-Meyerhoff method",
"None of the above"
]
},
{
"n": 49,
"stem": "The solubility of a gas increases with increase of:",
"opts": [
"Temperature",
"Volume of the gas",
"Pressure",
"Concentration"
]
},
{
"n": 50,
"stem": "In which of the following oxygen does not evolve during photosynthesis?",
"opts": [
"Photosynthetic red algae",
"Photosynthetic green algae",
"Photosynthetic blue-green algae",
"Photosynthetic bacteria"
]
},
{
"n": 51,
"stem": "The structural isomers possible for the compounds with molecular formula C2H3Cl3 is:",
"opts": [
"2",
"3",
"4",
"5"
]
},
{
"n": 52,
"stem": "The lining of intestine and kidneys in human is:",
"opts": [
"Keratinised",
"Brush-bordered",
"Ciliated",
"Stratified squamous"
]
},
{
"n": 53,
"stem": "Root hair absorb water from soil through:",
"opts": [
"Turgor pressure",
"Ion exchange",
"Osmosis",
"DPD"
]
},
{
"n": 54,
"stem": "Which of the following is an opioid drug?",
"opts": [
"Cocaine",
"Hashish",
"Marijuana",
"Heroin"
]
},
{
"n": 55,
"stem": "The molarity of pure water is:",
"opts": [
"18 M",
"50.6 M",
"55.6 M",
"66.6 M"
]
},
{
"n": 56,
"stem": "Number of moles of NaOH present in 2 litres of 0.5 M NaOH is:",
"opts": [
"0.1",
"1.0",
"1.5",
"2.0"
]
},
{
"n": 57,
"stem": "Most accepted theory for ascent of sap is:",
"opts": [
"Capillarity theory",
"Root pressure theory",
"Transpiration pull theory",
"Pulsation theory"
]
},
{
"n": 58,
"stem": "Regeneration in animals was first reported by:",
"opts": [
"T.H.Huxley",
"A.G. Trembley",
"T.H. Morgan",
"T.Muller"
]
},
{
"n": 59,
"stem": "The science of ageing is known as:",
"opts": [
"Chronology",
"Odontology",
"Gynaecology",
"Gerontology"
]
},
{
"n": 60,
"stem": "Transfer of pollen grains from one flower to another flower of the same plant is called:",
"opts": [
"Allogamy",
"Autogamy",
"Geitonogamy",
"Cleistogamy"
]
},
{
"n": 61,
"stem": "Which one of the following have the highest number of species in nature?",
"opts": [
"Fungi",
"Insects",
"Birds",
"Angiosperms"
]
},
{
"n": 62,
"stem": "Carbon-14 dating method is based on the fact that:",
"opts": [
"Carbon-14 fraction is same in all objects",
"Carbon-14 is highly soluble",
"Ratio of carbon-14 and carbon-12 is constant",
"All the above"
]
},
{
"n": 63,
"stem": "A raw material used in making nylon is:",
"opts": [
"Adipic acid",
"Butadiene",
"Ethylene",
"Methyl methacrylate"
]
},
{
"n": 64,
"stem": "Which one of the following is used to make ‘non-stick’ cookware?",
"opts": [
"Polystyrene",
"PVC",
"Polyethylene terephthalate",
"Polyetrafluoro ethylene"
]
},
{
"n": 65,
"stem": "Biological concept of species is mainly based on:",
"opts": [
"Methods of reproduction only",
"Reproductive isolation",
"Morphological features only",
"Morphology and methods of reproduction"
]
},
{
"n": 66,
"stem": "Mutation is more common when it is present in:",
"opts": [
"Recessive condition",
"Dominant condition",
"Constant in population",
"None of the above"
]
},
{
"n": 67,
"stem": "Which of the following is not Darwin’s conclusion?",
"opts": [
"Survival of the fittest",
"Struggle for existence",
"Inheritance of acquired characters",
"Origin of species by natural selection"
]
},
{
"n": 68,
"stem": "Law of limiting factors was given by:",
"opts": [
"Arnon",
"Calvin",
"Leibig",
"Blackman"
]
},
{
"n": 69,
"stem": "In plants, the guard cells differ from other epidermal cells in having:",
"opts": [
"Cytoskeleton",
"Endoplasmic Reticulum",
"Chloroplasts",
"Mitochondria"
]
},
{
"n": 70,
"stem": "Which of the following is a bacterium involved in denitrification?",
"opts": [
"Azotobacter",
"Nitrobacter",
"Nitrosomonas",
"Pseudomonas"
]
}
]"""

KEY = {
    1: ("c", "Gibberellin (GA) from the embryo induces the aleurone layer to make α-amylase, which mobilises stored starch."),
    2: ("d", "Adrenaline dilates blood vessels to muscles, raises oxygen consumption and increases glucose production."),
    3: ("b", "Calvin found 3-phosphoglyceric acid (PGA) as the first stable CO2-fixation product using the alga Chlorella."),
    6: ("a", "Oilseed crops have a high sulphur requirement for oil and sulphur-containing amino acids."),
    8: ("b", "Morphine comes from the opium poppy, Papaver somniferum."),
    9: ("d", "Alzheimer's disease is linked with loss of acetylcholine-producing (cholinergic) neurons."),
    11: ("c", "A weak acid-strong base titration ends in the alkaline range, where phenolphthalein changes colour."),
    14: ("a", "Archaeopteryx, the fossil bird with reptilian features, lived in the Jurassic period."),
    16: ("c", "pH = −log10[H+]."),
    17: ("b", "Phytochrome detects day length (red/far-red light) and controls photoperiodic responses."),
    21: ("a", "Rennin curdles milk protein (casein) in the stomach of young mammals."),
    22: ("c", "The petiole elongates through activity of the intercalary meristem at its base."),
    23: ("a", "Air spaces of aerenchyma make aquatic plants buoyant and aid gas exchange."),
    25: ("c", "Movement of genes between populations by migration is gene flow."),
    26: ("c", "Cane sugar (sucrose) is a disaccharide of glucose and fructose."),
    29: ("c", "Stimulants (e.g. caffeine, amphetamines) increase alertness and activity."),
    30: ("d", "Aromatic hydrocarbons are called arenes (e.g. benzene)."),
    31: ("d", "Totipotency is the ability of a single plant cell to regenerate a whole plant."),
    33: ("a", "The trophoblast gives rise to the extra-embryonic membranes (chorion) and the placenta."),
    34: ("b", "M1V1 = M2V2: 0.6 × V = 0.4 × 30, so V = 20 cm³."),
    36: ("b", "Both are modified stems (same origin, different function) - homologous organs."),
    37: ("c", "Stanley Miller's 1953 experiment made amino acids from simple molecules."),
    38: ("d", "Making glucose from non-carbohydrate sources is gluconeogenesis."),
    39: ("b", "Histamine and kinins released at the bite cause inflammation."),
    42: ("a", "Lipases split fats into fatty acids and glycerol."),
    43: ("d", "Ciliated columnar epithelium lines the bronchioles and Fallopian tubes."),
    44: ("c", "Diastase (amylase) converts starch into maltose."),
    45: ("b", "Alkaline hydrolysis of esters is saponification."),
    46: ("c", "A corm is a swollen underground stem."),
    47: ("d", "Starfish, crabs and lizards can shed (autotomise) a body part; Hydra does not."),
    49: ("c", "By Henry's law, a gas's solubility increases with pressure (it decreases with temperature)."),
    50: ("d", "Photosynthetic bacteria carry out anoxygenic photosynthesis (they do not split water)."),
    51: ("a", "C2H3Cl3 has two isomers: 1,1,1- and 1,1,2-trichloroethane."),
    52: ("b", "Intestinal cells and kidney tubule cells have a brush border of microvilli."),
    53: ("c", "Root hairs take in water by osmosis."),
    54: ("d", "Heroin (diacetylmorphine) is an opioid made from morphine."),
    55: ("c", "1000 g of water ÷ 18 g/mol = 55.6 mol per litre."),
    56: ("b", "moles = M × V = 0.5 × 2 = 1.0 mol."),
    57: ("c", "Dixon and Joly's cohesion-tension (transpiration pull) theory is the most accepted."),
    58: ("b", "Abraham Trembley first described regeneration, in Hydra (1744)."),
    59: ("d", "Gerontology is the study of ageing."),
    61: ("b", "Insects have more described species than any other group."),
    63: ("a", "Nylon-6,6 is made from adipic acid and hexamethylenediamine."),
    64: ("d", "Non-stick coatings are polytetrafluoroethylene (PTFE, Teflon)."),
    65: ("b", "The biological species concept defines species by reproductive isolation."),
    66: ("a", "Most mutations are recessive, so they are mostly carried in the recessive condition."),
    67: ("c", "Inheritance of acquired characters is Lamarck's idea, not Darwin's."),
    68: ("d", "F. F. Blackman proposed the law of limiting factors (1905)."),
    69: ("c", "Guard cells have chloroplasts; other epidermal cells usually do not."),
}

NEW_MCQ = [
    ("Which of the following is an enzyme?", ["Urea", "Urease", "Glucose", "Glycerol"], "b",
     "Urease is the enzyme that breaks down urea; urea, glucose and glycerol are not enzymes."),
    ("The system of plant classification based on evolutionary relationships is called", ["Artificial system", "Natural system", "Phylogenetic system", "Numerical system"], "c",
     "A phylogenetic system groups plants by their evolutionary relationships (e.g. Engler and Prantl, Hutchinson)."),
    ("A fall in which hormone at the end of the cycle directly causes menstruation?", ["Progesterone", "FSH", "Oxytocin", "Prolactin"], "a",
     "When the corpus luteum degenerates, progesterone falls and the uterine lining breaks down."),
    ("Mammals became the dominant land animals in which era?", ["Palaeozoic", "Mesozoic", "Cenozoic", "Precambrian"], "c",
     "After the dinosaurs' extinction, mammals diversified and dominated in the Cenozoic era (the 'Age of Mammals')."),
    ("Down syndrome is caused by", ["loss of a chromosome", "an extra copy of chromosome 21", "an extra X chromosome", "a gene mutation in the Y chromosome"], "b",
     "Down syndrome (trisomy 21) results from three copies of chromosome 21."),
    ("Which mixture forms an acidic buffer solution?", ["Acetic acid and sodium acetate", "Hydrochloric acid and sodium chloride", "Sodium hydroxide and sodium chloride", "Ammonia and ammonium chloride"], "a",
     "A weak acid with its salt (acetic acid/ sodium acetate) is an acidic buffer; ammonia/ ammonium chloride is a basic buffer."),
    ("Ammonia is manufactured industrially from nitrogen and hydrogen by the", ["Contact process", "Haber process", "Solvay process", "Ostwald process"], "b",
     "The Haber(-Bosch) process combines N2 and H2 over an iron catalyst at high pressure."),
]

SAQ = [
 dict(marks=3, stem="Explain how, during the light reaction of photosynthesis, ATP synthesis is a chemiosmotic phenomenon. (3 marks)",
      kp=[("Light-driven electron transport and photolysis of water pump/ release H+ into the thylakoid lumen; NADP reductase removes H+ from the stroma", 1),
          ("This creates a proton gradient (higher H+ inside the lumen) across the thylakoid membrane - the proton motive force", 1),
          ("H+ flows back to the stroma through ATP synthase (CF0-CF1), and the energy drives ADP + Pi → ATP (photophosphorylation); Mitchell's chemiosmotic theory", 1)],
      model="According to Mitchell's chemiosmotic hypothesis, ATP is made using a proton gradient across a membrane. In the light reaction: (1) water is split in the thylakoid lumen, releasing H+; (2) as electrons pass along the electron transport chain (plastoquinone, cytochrome b6f), more H+ is pumped from the stroma into the lumen; and NADP reductase on the stromal side uses H+ to form NADPH. So H+ accumulates inside the thylakoid lumen, creating a proton gradient (pH and charge difference). (3) The protons diffuse back into the stroma through the CF0 channel of ATP synthase, and this flow changes the shape of the CF1 part, which joins ADP and Pi to make ATP. ATP synthesis is therefore driven by the chemical and osmotic (proton) gradient - a chemiosmotic process."),
 dict(marks=3, stem="Structural organisation in animals attains different levels as cell - organ - organ system. What is missing in this chain? Mention the significance of such an organisation. (3 marks)",
      kp=[("Missing level: tissue (cell → tissue → organ → organ system → organism)", 1),
          ("Significance: division of labour/ specialisation - each level performs specific functions more efficiently", 1),
          ("Co-ordination and integration for survival of the whole organism; increasing complexity allows larger, more complex bodies", 1)],
      model="The missing level is the tissue: cells form tissues, tissues form organs, organs form organ systems and organ systems form the organism. Significance: this organisation brings division of labour - groups of specialised cells (tissues) perform particular functions, organs combine tissues for a definite task and organ systems carry out major body functions such as digestion or circulation; this makes each function efficient, allows co-ordination and integration among the parts, and lets complex, larger multicellular animals survive and maintain homeostasis."),
 dict(marks=3, stem="How are the following enzymes activated in the alimentary canal: pepsin, trypsin and rennin? (3 marks)",
      kp=[("Pepsin: secreted as inactive pepsinogen by chief cells; activated by HCl in the stomach (then autocatalytically by pepsin)", 1),
          ("Trypsin: secreted by the pancreas as trypsinogen; activated in the duodenum by enterokinase (enteropeptidase) of the intestinal juice", 1),
          ("Rennin: secreted as inactive prorennin (in infants/ young mammals); activated by HCl in the stomach", 1)],
      model="Protein-digesting enzymes are secreted in inactive form so they do not digest the cells that make them. Pepsin: the chief cells of the gastric glands secrete pepsinogen, which is converted into active pepsin by hydrochloric acid in the stomach; pepsin then activates more pepsinogen (autocatalysis). Trypsin: the pancreas secretes trypsinogen into the duodenum, where enterokinase (enteropeptidase) from the intestinal mucosa converts it to trypsin, which then activates other pancreatic proenzymes. Rennin: secreted as inactive prorennin by the gastric glands of young mammals and activated by HCl; it curdles milk by converting caseinogen into casein."),
 dict(marks=3, stem="What role does root pressure play in water movement in plants? (3 marks)",
      kp=[("Root pressure: positive hydrostatic pressure in the xylem of roots from active absorption of ions, which draws water in by osmosis", 1),
          ("It pushes water up the xylem a short distance (a few metres), mainly at night or when transpiration is low; seen as guttation and bleeding of cut stems", 1),
          ("It helps re-establish continuous water columns (refill embolised vessels) in spring/ morning, but is not the main force for tall trees (transpiration pull is)", 1)],
      model="Root pressure is a positive pressure that develops in the xylem of roots. Root cells actively absorb mineral ions into the xylem, lowering its water potential, so water enters from the soil by osmosis and builds up pressure. This pressure pushes water a short way up the stem (usually a few metres), especially at night or in humid conditions when transpiration is low; it is seen as guttation (water drops at leaf tips) and as sap bleeding from cut stems. Its main role is to help restore continuous water columns in the xylem broken by air bubbles; it is too small to raise water to the top of tall trees, where transpiration pull is the main force."),
 dict(marks=3, stem="A solution of 1.85 g of a solute X in 100 ml of water is found to be isotonic with a 3.42% (wt/vol) solution of sucrose (C12H22O11 = 342). Calculate the relative molecular mass of X. (3 marks)",
      kp=[("Isotonic solutions have the same osmotic pressure, so equal molar concentration (π = CRT)", 1), ("Sucrose: 3.42 g per 100 ml = 34.2 g/L ÷ 342 = 0.1 mol/L", 1),
          ("X: 1.85 g per 100 ml = 18.5 g/L = 0.1 mol/L, so M = 18.5/0.1 = 185 g/mol", 1)],
      model="Isotonic solutions have equal osmotic pressure, and since π = CRT (same temperature), they have the same molar concentration. Sucrose: 3.42 g in 100 ml = 34.2 g per litre; 34.2 ÷ 342 = 0.1 mol/L. Solution X: 1.85 g in 100 ml = 18.5 g per litre, and this must also be 0.1 mol/L. Molar mass of X = 18.5 ÷ 0.1 = 185 g/mol, so the relative molecular mass of X is 185."),
 dict(marks=3, stem="Biological clocks help organisms to maintain adaptive behaviour. Give two examples to justify that circadian rhythmic behaviour in plants is adaptive. (3 marks)",
      kp=[("Circadian rhythm: about 24-hour internal rhythm that lets plants anticipate daily changes (light, temperature)", 1),
          ("Example 1, e.g. opening and closing of stomata/ flowers at particular times (open in morning for photosynthesis, close at night to save water; flowers open when pollinators are active)", 1),
          ("Example 2, e.g. sleep (nyctinastic) movements of leaves of legumes/ Mimosa folding at night reduces heat and water loss; daily rhythm of photosynthetic enzymes, scent release", 1)],
      model="Circadian rhythms are roughly 24-hour cycles controlled by an internal biological clock, which let plants prepare for regular daily changes instead of only reacting to them. (1) Stomata and flowers open and close at set times: stomata begin opening before dawn so photosynthesis can start as soon as light comes and close at night to save water; many flowers open and release scent at the time their pollinators are active (e.g. night-flowering jasmine for moths). (2) Sleep (nyctinastic) movements: leaves of beans, Mimosa and other legumes fold at night and spread out in the day, reducing heat and water loss at night and maximising light capture in the day. Because these responses are timed in advance, they increase survival and reproduction - they are adaptive."),
 dict(marks=3, stem="What is the Warburg effect? What is its relation with photorespiration? (3 marks)",
      kp=[("Warburg effect (in photosynthesis): inhibition of photosynthesis by high oxygen concentration", 1),
          ("Cause: O2 competes with CO2 for RuBisCO, which then acts as an oxygenase", 1),
          ("Relation: oxygenation of RuBP starts photorespiration (C2 cycle in chloroplast, peroxisome, mitochondria), releasing CO2 and lowering net photosynthesis; not seen in C4 plants", 1)],
      model="In plant physiology the Warburg effect is the inhibition (decrease) of photosynthesis by high concentrations of oxygen, first noticed by Otto Warburg in Chlorella. It happens because the enzyme RuBisCO can use either CO2 or O2: when O2 is high relative to CO2, RuBisCO acts as an oxygenase and adds O2 to RuBP, forming one phosphoglycolate and one PGA instead of two PGA. This oxygenation is the first step of photorespiration (the C2 cycle through chloroplasts, peroxisomes and mitochondria), which consumes energy and releases CO2, so net photosynthesis falls. The Warburg effect is therefore the visible result of photorespiration; it is marked in C3 plants and almost absent in C4 plants, which concentrate CO2 around RuBisCO."),
 dict(marks=3, stem="Solid substances are classified into three different types depending upon their behaviour towards a magnetic field. What are they? Briefly define each of them. (3 marks)",
      kp=[("Diamagnetic: weakly repelled by a magnetic field; all electrons paired (e.g. NaCl, water, copper)", 1),
          ("Paramagnetic: weakly attracted; unpaired electrons; lose magnetism when field removed (e.g. O2, Cu2+, Fe3+ salts)", 1),
          ("Ferromagnetic: strongly attracted and can be permanently magnetised; domains align (e.g. iron, cobalt, nickel)", 1)],
      model="(1) Diamagnetic substances are weakly repelled by a magnetic field because all their electrons are paired; examples are NaCl, water, benzene and copper. (2) Paramagnetic substances are weakly attracted by a magnetic field because they have unpaired electrons; they lose this magnetism when the field is removed - e.g. O2, Cu2+ and Fe3+ compounds. (3) Ferromagnetic substances are very strongly attracted and can be permanently magnetised, because the magnetic moments of their atoms line up in domains; examples are iron, cobalt, nickel and CrO2. (Antiferromagnetic and ferrimagnetic substances are further sub-types.)"),
 dict(marks=3, stem="Which plant hormone is associated with delay of senescence, and how? What is the Richmond-Lang effect? (3 marks)",
      kp=[("Cytokinin delays senescence", 1), ("How: promotes protein and chlorophyll synthesis, keeps nutrients moving into the treated part (nutrient mobilisation/ sink), reduces breakdown of proteins and chlorophyll", 1),
          ("Richmond-Lang effect (1957): applying kinetin (cytokinin) to detached Xanthium leaves delayed their yellowing/ senescence", 1)],
      model="Cytokinins delay senescence (ageing). They keep leaves green by promoting synthesis of proteins, RNA and chlorophyll, slowing their breakdown, and by making the treated part a sink so that nutrients move into it (nutrient mobilisation). The Richmond-Lang effect, reported by Richmond and Lang in 1957, is this delay of senescence by cytokinin: detached leaves of Xanthium (cocklebur) treated with kinetin stayed green much longer than untreated leaves, which turned yellow."),
 dict(marks=3, stem="What are the three characteristics based on which the blind spot and the yellow spot are differentiated in human eyes? Give the basis of their differentiation. (3 marks)",
      kp=[("Location/ structure: blind spot is where the optic nerve and blood vessels leave the eye (optic disc); yellow spot (macula lutea) lies on the visual axis with a central fovea", 1),
          ("Photoreceptors: blind spot has no rods or cones; yellow spot has many cones (fovea only cones)", 1),
          ("Vision: no image forms at the blind spot; the yellow spot gives the sharpest, colour vision (maximum visual acuity)", 1)],
      model="(1) Position: the blind spot (optic disc) is the point where the optic nerve and retinal blood vessels leave the eyeball, slightly towards the nose; the yellow spot (macula lutea) lies at the centre of the retina on the visual axis, with a small pit called the fovea. (2) Photoreceptors: the blind spot has no photoreceptors (no rods or cones); the yellow spot is packed with cones, and the fovea has only cones. (3) Vision: light falling on the blind spot forms no image; the yellow spot gives the clearest, most detailed colour vision in bright light (maximum visual acuity)."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
