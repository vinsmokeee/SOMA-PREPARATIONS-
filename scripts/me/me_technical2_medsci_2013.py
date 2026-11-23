"""ME Technical Paper II (General Subject Knowledge), MEDICAL SCIENCE group ('Medical & Health Group'), BCSE 2013 Main
Examination (13 October 2013) - real paper, PDF sent by the founder. Same layout as the latest (BCSE 2025) paper: Part I 70
MCQ x 1; Part II 10 short answers x 3 - so no marks were changed (Part II Q4, Q7 and Q9 are split into parts that add to 3).
The PDF's two-column options and garbled pages 2-3 were retyped from the page images. Picture: MCQ 35 translation.
Left out: MCQ 22 (the liver does make some hormones), 27 (answer should be −346 °F; the sign is missing), 36 (blue sky is due
to scattering - not an option). Three new MCQs keep Part I at 70.
Part II repeats (recorded as appearances, replaced by new questions of the same kind): Q3 Ohm's law (BCSE 2024), Q5 noble
gases (2020), Q8 molarity, molality and normality (2024).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Medical Science): BCSE 2013, batch 1"
GROUP_TAG = "medsci2013"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "medical-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2013 Main Examination, Technical Paper II, Medical Science", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Medical Science: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "An action potential (depolarisation of a nerve fibre) is due mainly to the movement of:",
"opts": [
"Na⁺",
"K⁺",
"Cl⁻",
"Ca²⁺"
]
},
{
"n": 2,
"stem": "All bacteria fix Nitrogen Except",
"opts": [
"Cyanobacteria",
"E-Coli",
"Rhizobium",
"Azotobacter"
]
},
{
"n": 3,
"stem": "Bacterial cell wall is made up of",
"opts": [
"Peptide",
"Chitin",
"Protein",
"Peptidoglycan"
]
},
{
"n": 4,
"stem": "A body of mass 4 kg is acted upon by a constant force. It travels 5 m in the first second and 2 m in the third second. The magnitude of the force acting on the body is:",
"opts": [
"2 N",
"4 N",
"6 N",
"8 N"
]
},
{
"n": 5,
"stem": "A car leaves Paro at 9 am and reaches Punakha at 1 pm, covering a distance of 120 km. Its average speed is:",
"opts": [
"30 km/h",
"50 km/h",
"70 km/h",
"40 km/h"
]
},
{
"n": 6,
"stem": "If the dispersed phase is a liquid and the dispersion medium is a solid, the colloid is known as:",
"opts": [
"A sol",
"A gel",
"An emulsion",
"A foam"
]
},
{
"n": 7,
"stem": "The unit of the rate constant of a first-order reaction is:",
"opts": [
"time⁻¹",
"mol L⁻¹ s⁻¹",
"L mol⁻¹ s⁻¹",
"L mol⁻¹ s"
]
},
{
"n": 8,
"stem": "The reaction of hot, concentrated NaOH with Cl₂ gives:",
"opts": [
"NaCl only",
"NaCl and NaClO₃",
"NaCl and NaOCl",
"NaClO₃ only"
]
},
{
"n": 9,
"stem": "If the rate of a reaction is equal to its rate constant, the order of the reaction is:",
"opts": [
"Zero order",
"First order",
"Second order",
"Pseudo-unimolecular"
]
},
{
"n": 10,
"stem": "The membranous infolding in bacteria that is associated with initiating DNA replication is the:",
"opts": [
"Carboxysome",
"Mesosome",
"Magnetosome",
"Nucleosome"
]
},
{
"n": 11,
"stem": "A compound contains 32.3% sodium, 45.1% sulphur and 22.5% oxygen, and its molecular weight is 142.2. Its molecular formula is:",
"opts": [
"NaSO₂",
"Na₃SO₄",
"Na₂S₂O₂",
"Na₂S₃O₂"
]
},
{
"n": 12,
"stem": "According to Boyle's law (constant mass of gas at constant temperature), the volume V of a gas is related to its pressure P as:",
"opts": [
"V ∝ n",
"V ∝ 1/P",
"V ∝ 1/n",
"V ∝ P"
]
},
{
"n": 13,
"stem": "How many moles of oxygen will fill a 5-litre container at 20 atm pressure and 0 °C? (R = 0.0821 L atm K⁻¹ mol⁻¹)",
"opts": [
"4.75 mol",
"4.65 mol",
"4.55 mol",
"4.45 mol"
]
},
{
"n": 14,
"stem": "The basic building block of matter is the:",
"opts": [
"electron",
"atom",
"element",
"molecule"
]
},
{
"n": 15,
"stem": "Urine and blood are studied under the discipline of:",
"opts": [
"Organic chemistry",
"Inorganic chemistry",
"Physical chemistry",
"Biochemistry"
]
},
{
"n": 16,
"stem": "An H⁺ ion has:",
"opts": [
"one electron",
"one proton",
"one electron and one proton",
"one proton and one neutron"
]
},
{
"n": 17,
"stem": "Water has a high boiling point because of:",
"opts": [
"covalent bonds",
"ionic bonds",
"polar bonds",
"hydrogen bonds"
]
},
{
"n": 18,
"stem": "24 g of carbon contains ______ atoms of carbon:",
"opts": [
"6 × 6.02 × 10²³",
"2 × 6.02 × 10²³",
"12 × 6.02 × 10²³",
"24 × 6.02 × 10²³"
]
},
{
"n": 19,
"stem": "The scientific study of embryo i.e. from zygote to the formation of complete organism is called as:",
"opts": [
"Morphology",
"Sexology",
"Gerontology",
"Embryology"
]
},
{
"n": 20,
"stem": "The vector (mosquito) of malaria is studied in the discipline of:",
"opts": [
"Microbiology",
"Parasitology",
"Entomology",
"anatomy"
]
},
{
"n": 21,
"stem": "Which of the following is NOT the study of environmental effects on organisms?",
"opts": [
"Environmental biology",
"Ecology",
"Palaeontology",
"Both a and b"
]
},
{
"n": 22,
"stem": "All the functions of liver all are true except:",
"opts": [
"urea formation",
"vitamin storage",
"cholesterol formation",
"hormone production"
]
},
{
"n": 23,
"stem": "Automatic, involuntary activities such as breathing and heartbeat are controlled by the:",
"opts": [
"cerebrum",
"cerebellum",
"medulla oblongata",
"spinal cord"
]
},
{
"n": 24,
"stem": "Which of the following is not related to DNA:",
"opts": [
"genes",
"Transcription",
"double helix",
"uracil"
]
},
{
"n": 25,
"stem": "When a colour-blind man marries a normal (non-carrier) woman, the chance of colour blindness in their sons is:",
"opts": [
"0%",
"50%",
"75%",
"100%"
]
},
{
"n": 26,
"stem": "Genetic material in an organism especially in its germ cells is called",
"opts": [
"Cytoplasm",
"Gene pool",
"Germplasm",
"Protoplasm"
]
},
{
"n": 27,
"stem": "Nitrogen freezes at 63.1 K. What is the corresponding temperature in the Fahrenheit scale?",
"opts": [
"315⁰⁰F",
"346⁰F",
"321⁰F",
"290⁰F"
]
},
{
"n": 28,
"stem": "When a car is braked to a stop, its kinetic energy is transformed to",
"opts": [
"Potential energy.",
"Energy of motion.",
"Energy of rest.",
"Heat."
]
},
{
"n": 29,
"stem": "Two identical arrows, one with twice the kinetic energy of the other, are fired into a hay bale. The faster arrow will penetrate",
"opts": [
"The same distance as the slower arrow.",
"Twice as far as the slower arrow.",
"Four times as far as the slower arrow.",
"More than four times as far as the slower arrow."
]
},
{
"n": 30,
"stem": "An object at rest may have",
"opts": [
"Speed.",
"Velocity.",
"Energy.",
"Momentum."
]
},
{
"n": 31,
"stem": "A feather and a coin dropped in a vacuum fall with equal",
"opts": [
"Forces.",
"Momenta.",
"Accelerations.",
"Kinetic energies."
]
},
{
"n": 32,
"stem": "In the first step of glycolysis, glucose is converted to glucose-6-phosphate. Which of the following supplies the energy for the reaction?",
"opts": [
"ATP",
"RNA",
"Oxygen",
"Hydrogen"
]
},
{
"n": 33,
"stem": "In 1940s and 1950s, scientists did experiments to determine the molecule responsible for heredity. Their experiments demonstrated that the molecule that encodes and transmits information in organisms is",
"opts": [
"DNA.",
"Glucosamine.",
"Insulin.",
"Vitamin D."
]
},
{
"n": 34,
"stem": "Under normal conditions, which of the following causes a zygote to form?",
"opts": [
"Mitosis takes place.",
"Meiosis takes place.",
"Two gametes combine.",
"Asexual reproduction occurs."
]
},
{
"n": 35,
"stem": "The diagram shows a process that occurs in cells (a ribosome moving along an mRNA strand, with tRNAs bringing amino acids). Which process is shown?",
"opts": [
"Diffusion",
"Recombination",
"Respiration",
"Translation"
],
"image": "/papers/me/tech2-medsci-2013-translation.png"
},
{
"n": 36,
"stem": "Blue colour of the sky is due to",
"opts": [
"Diffraction of light",
"Dispersion of light",
"Reflection of light",
"Refraction of light"
]
},
{
"n": 37,
"stem": "The pesticides DDT and parathion are inhibitors of key enzymes in the",
"opts": [
"Respiratory system",
"Cardiovascular system",
"Digestive system",
"Nervous system"
]
},
{
"n": 38,
"stem": "Colour in a rainbow are produced due to",
"opts": [
"Interference of light waves reflected by water drops in the air",
"Diffraction of light waves",
"Dispersion and total internal reflection of sunlight by water drops in the air",
"All of the above"
]
},
{
"n": 39,
"stem": "A Periscope is an instrument used for",
"opts": [
"Finding the focal length of the lens",
"Seeing very distant objects",
"Seeing very small objects",
"Viewing objects out of the line of vision"
]
},
{
"n": 40,
"stem": "Movement of tongue muscle is controlled by",
"opts": [
"Facial nerve",
"Trigeminal nerve",
"hypoglossal nerve",
"Vagus nerve"
]
},
{
"n": 41,
"stem": "Which one of the following is polysaccharide?",
"opts": [
"Glycogen",
"Sucrose",
"Lactose",
"Maltose"
]
},
{
"n": 42,
"stem": "By the statement ‘survival of the fittest’, Darwin meant that ________.",
"opts": [
"The strongest of all species survives",
"The most intelligent of the species survives",
"The cleverest of the species survives",
"The most adaptable of the species to changes survives"
]
},
{
"n": 43,
"stem": "Which one of the following is mainly responsible for green house effect?",
"opts": [
"SO₂",
"CO₂",
"CO",
"O₂"
]
},
{
"n": 44,
"stem": "The metal used as a catalyst in the hydrogenation of vegetable oils (to make vanaspati ghee) is",
"opts": [
"Nickel",
"Lead",
"Copper",
"Platinum"
]
},
{
"n": 45,
"stem": "An insect can run along the edge of a pond without wetting its feet because of",
"opts": [
"Viscosity",
"Pascal’s law",
"Surface tension",
"Capillary action"
]
},
{
"n": 46,
"stem": "Structural lipids of cell membrane",
"opts": [
"Simple lipid",
"Chromolipids",
"Steroid",
"Phospholipid"
]
},
{
"n": 47,
"stem": "The rise of a liquid in a capillary tube does not depend upon",
"opts": [
"Angle of contact",
"Density of the liquid",
"Radius of the capillary tube",
"Atmospheric pressure"
]
},
{
"n": 48,
"stem": "Sound wave is an example of",
"opts": [
"Longitudinal wave",
"Transverse wave",
"Stationary wave",
"All of these"
]
},
{
"n": 49,
"stem": "Which one of the following animal phyla does not possess a coelom?",
"opts": [
"Platyhelminthes",
"Annelida",
"Mollusca",
"Echinodermata"
]
},
{
"n": 50,
"stem": "The ozone layer forms naturally by the",
"opts": [
"Interaction of CFC with oxygen",
"Interaction of UV radiation with oxygen",
"Interaction of IR radiation with oxygen",
"Interaction of oxygen and water vapour"
]
},
{
"n": 51,
"stem": "The yellow precipitate formed during the chromyl chloride test is chemically",
"opts": [
"Lead chromate",
"Chromic acid",
"Sodium chromate",
"Lead acetate"
]
},
{
"n": 52,
"stem": "Argon is used in",
"opts": [
"High temperature welding",
"Radiotherapy for treatment of cancer",
"Filling airships",
"Obtain low temperature"
]
},
{
"n": 53,
"stem": "Cooking is fast in a pressure cooker, because",
"opts": [
"Food is cooked at constant volume.",
"Loss of heat due to radiation is minimum.",
"Food particles are effectively smashed.",
"Water boils at higher temperature inside the pressure cooker."
]
},
{
"n": 54,
"stem": "Dalda is prepared from oils by",
"opts": [
"Oxidation",
"Reduction",
"Hydrolysis",
"Distillation"
]
},
{
"n": 55,
"stem": "Helium is used in balloons in place of hydrogen because it is",
"opts": [
"Incombustible",
"Lighter than hydrogen",
"Radioactive",
"More abundant than hydrogen"
]
},
{
"n": 56,
"stem": "Sugar constituent present in DNA is",
"opts": [
"Deoxyribose",
"Ribose",
"Arabinose",
"Glucose"
]
},
{
"n": 57,
"stem": "Pollen grains of a plant whose 2n = 28 are cultured to get callus by tissue culture. The number of chromosomes in the cells of the callus would be:",
"opts": [
"21",
"14",
"56",
"28"
]
},
{
"n": 58,
"stem": "Pieces of plant tissue used in tissue culture is called",
"opts": [
"Explant",
"Somaclone",
"Inoculant",
"Clone"
]
},
{
"n": 59,
"stem": "Ovule integument gets transformed into",
"opts": [
"Seed",
"Fruit wall",
"Seed coat",
"Cotyledons"
]
},
{
"n": 60,
"stem": "Most of the endangered species are the victims of",
"opts": [
"Habitat destruction",
"Over-hunting",
"Acid rain",
"Competition with introduced species"
]
},
{
"n": 61,
"stem": "A female Anopheles mosquito can be recognized by",
"opts": [
"Proboscis and palpi are long and more or less of equal length",
"Proboscis long and palpi short",
"Proboscis short and palpi long",
"Both proboscis and palpi are short"
]
},
{
"n": 62,
"stem": "Leptocorisa is a major pest of",
"opts": [
"Paddy",
"Coconut",
"Wheat",
"Sugarcane"
]
},
{
"n": 63,
"stem": "A 6% solution of urea is isotonic with",
"opts": [
"6% solution of Glucose",
"25% solution of Glucose",
"1 M solution of Glucose",
"0.05 M solution of Glucose"
]
},
{
"n": 64,
"stem": "Which one of the following gases is NOT a greenhouse gas?",
"opts": [
"Carbon monoxide",
"Methane",
"Oxygen",
"Water vapour"
]
},
{
"n": 65,
"stem": "Fleshy fruits with stony endocarp are called",
"opts": [
"Berries",
"Pomes",
"Drupes",
"Capsules"
]
},
{
"n": 66,
"stem": "When a freshwater protozoan is placed in sea water, its contractile vacuole:",
"opts": [
"Disappears",
"Increases in size",
"Increases in number",
"Remains unchanged"
]
},
{
"n": 67,
"stem": "Galvanization is the deposition of",
"opts": [
"Copper on iron",
"Tin on Iron",
"Zinc on Iron",
"Aluminium on Iron"
]
},
{
"n": 68,
"stem": "The process of bleaching by chlorine is called",
"opts": [
"Decomposition",
"Oxidation",
"Reduction",
"Absorption"
]
},
{
"n": 69,
"stem": "Which of the following is the hardest metal?",
"opts": [
"Iron",
"Platinum",
"Tungsten",
"Silver"
]
},
{
"n": 70,
"stem": "Cassiterite is the ore of",
"opts": [
"Lead",
"Tin",
"Zinc",
"Copper"
]
}
]"""

KEY = {
 1: ("a", "Depolarisation during an action potential is caused by rapid influx of Na⁺; repolarisation follows by K⁺ outflow."),
 2: ("b", "E. coli does not fix nitrogen; cyanobacteria, Rhizobium and Azotobacter do."),
 3: ("d", "Bacterial cell walls are made of peptidoglycan (murein); chitin is in fungal walls."),
 4: ("c", "s₁ = u + a/2 = 5 and s₃ = u + 5a/2 = 2, so 2a = −3 and a = −1.5 m/s². |F| = ma = 4 × 1.5 = 6 N (a retarding force)."),
 5: ("a", "120 km in 4 hours = 30 km/h."),
 6: ("b", "Liquid dispersed in a solid is a gel (e.g. jelly, cheese); liquid in liquid is an emulsion."),
 7: ("a", "For a first-order reaction k = rate/[A], so its unit is time⁻¹ (s⁻¹)."),
 8: ("b", "Hot concentrated NaOH: 3Cl₂ + 6NaOH → 5NaCl + NaClO₃ + 3H₂O. (Cold dilute NaOH gives NaCl + NaOCl.)"),
 9: ("a", "Rate = k[A]⁰ = k for a zero-order reaction."),
 10: ("b", "Mesosomes, infoldings of the bacterial plasma membrane, were thought to help in DNA replication and cell division."),
 11: ("c", "Mole ratio Na : S : O = 32.3/23 : 45.1/32 : 22.5/16 = 1.40 : 1.41 : 1.41 = 1 : 1 : 1 (NaSO, 71). 142.2/71 = 2, so Na₂S₂O₂."),
 12: ("b", "Boyle's law: at constant temperature and mass, V ∝ 1/P."),
 13: ("d", "n = PV/RT = (20 × 5)/(0.0821 × 273) ≈ 4.46 mol, i.e. about 4.45 mol."),
 14: ("b", "Atoms are the basic building blocks of all matter."),
 15: ("d", "The chemistry of living things, including blood and urine analysis, is biochemistry."),
 16: ("b", "H⁺ is a hydrogen atom that has lost its only electron - just one proton."),
 17: ("d", "Hydrogen bonds between water molecules must be broken for water to boil, giving it an unusually high boiling point."),
 18: ("b", "24 g of carbon = 24/12 = 2 mol = 2 × 6.02 × 10²³ atoms."),
 19: ("d", "The study of development from zygote to organism is embryology."),
 20: ("c", "Insects, including mosquito vectors, are studied in entomology (the malaria parasite itself in parasitology)."),
 21: ("c", "Palaeontology studies fossils; environmental biology and ecology study the effects of the environment on organisms."),
 23: ("c", "The medulla oblongata controls involuntary vital activities - breathing, heartbeat, blood pressure."),
 24: ("d", "Uracil is found in RNA; DNA has thymine instead. Genes, the double helix and transcription relate to DNA."),
 25: ("a", "Sons get their X from the mother; a normal non-carrier mother gives a normal X, so 0% of sons are colour blind (daughters are carriers)."),
 26: ("c", "Germplasm is the genetic material of germ cells passed to the next generation."),
 28: ("d", "Friction in the brakes turns the car's kinetic energy into heat."),
 29: ("b", "With the same resisting force F, the penetration distance is d = KE/F, so twice the kinetic energy gives twice the distance."),
 30: ("c", "An object at rest has no speed, velocity or momentum but can have energy (e.g. potential energy)."),
 31: ("c", "In a vacuum there is no air resistance, so all bodies fall with the same acceleration g."),
 32: ("a", "Hexokinase transfers a phosphate from ATP to glucose to form glucose-6-phosphate."),
 33: ("a", "Experiments by Avery, MacLeod and McCarty (1944) and Hershey and Chase (1952) showed that DNA carries hereditary information."),
 34: ("c", "A zygote forms when two gametes (sperm and egg) fuse at fertilisation."),
 35: ("d", "The diagram shows a ribosome reading mRNA while tRNAs bring amino acids - translation (protein synthesis)."),
 37: ("d", "DDT acts on nerve sodium channels and parathion inhibits acetylcholinesterase - both affect the nervous system."),
 38: ("c", "A rainbow forms by dispersion of sunlight in raindrops together with internal reflection inside the drops."),
 39: ("d", "A periscope uses mirrors or prisms to view objects that are out of the direct line of sight."),
 40: ("c", "The hypoglossal nerve (cranial nerve XII) supplies the muscles of the tongue."),
 41: ("a", "Glycogen is a polysaccharide; sucrose, lactose and maltose are disaccharides."),
 42: ("d", "Survival of the fittest means survival of the organisms best adapted to their environment."),
 43: ("b", "Carbon dioxide is the main greenhouse gas responsible for the enhanced greenhouse effect."),
 44: ("a", "Finely divided nickel catalyses the hydrogenation of vegetable oils into vanaspati (e.g. Dalda)."),
 45: ("c", "Surface tension forms an 'elastic skin' on water that supports the insect."),
 46: ("d", "Phospholipids form the lipid bilayer of cell membranes."),
 47: ("d", "Capillary rise h = 2T cos θ/(rρg) depends on surface tension, angle of contact, radius and density, not on atmospheric pressure."),
 48: ("a", "Sound in air is a longitudinal wave (compressions and rarefactions)."),
 49: ("a", "Flatworms (Platyhelminthes) are acoelomate; annelids, molluscs and echinoderms have a coelom."),
 50: ("b", "Ultraviolet radiation splits O₂ into oxygen atoms, which combine with O₂ to form ozone (O₃)."),
 51: ("a", "In the chromyl chloride test the chromate formed is precipitated with lead acetate as yellow lead chromate (PbCrO₄)."),
 52: ("a", "Argon, an inert gas, shields the metal during high-temperature (arc) welding; it is also used in electric bulbs."),
 53: ("d", "Higher pressure inside the cooker raises the boiling point of water (to about 120 °C), so food cooks faster."),
 54: ("b", "Vanaspati such as Dalda is made by hydrogenating oils - addition of hydrogen, a reduction."),
 55: ("a", "Helium is non-flammable (incombustible), unlike hydrogen, though slightly heavier."),
 56: ("a", "DNA contains the sugar deoxyribose."),
 57: ("b", "Pollen grains are haploid (n = 14), so a callus grown from pollen has 14 chromosomes per cell."),
 58: ("a", "The piece of plant tissue used to start a tissue culture is an explant."),
 59: ("c", "After fertilisation the ovule becomes the seed and its integuments become the seed coat."),
 60: ("a", "Habitat destruction is the main cause of species becoming endangered."),
 61: ("a", "In female Anopheles the palps are as long as the proboscis; in female Culex and Aedes the palps are short."),
 62: ("a", "Leptocorisa (the rice/gundhi bug) is a major pest of paddy."),
 63: ("c", "Urea (M = 60): 6 g per 100 mL = 60 g per litre = 1 M, so it is isotonic with a 1 M glucose solution."),
 64: ("c", "Oxygen is not a greenhouse gas; methane and water vapour are, and CO indirectly raises methane and ozone levels."),
 65: ("c", "Drupes (e.g. mango, plum, peach) have a stony endocarp around the seed."),
 66: ("a", "In sea water little water enters the protozoan by osmosis, so the contractile vacuole is not needed and disappears."),
 67: ("c", "Galvanisation is coating iron or steel with zinc to prevent rusting."),
 68: ("b", "Chlorine bleaches by oxidation (nascent oxygen from HOCl)."),
 69: ("c", "Of these, tungsten is the hardest metal (chromium is harder still but not listed)."),
 70: ("b", "Cassiterite (SnO₂) is the main ore of tin."),
}

NEW_MCQ = [
    ("Which of the following hormones lowers blood glucose?", ["Glucagon", "Adrenaline", "Insulin", "Cortisol"], "c", "Insulin promotes uptake of glucose by cells and its storage as glycogen; the others raise blood glucose."),
    ("The pigment that gives human skin its colour is:", ["Haemoglobin", "Melanin", "Bilirubin", "Carotene"], "b", "Melanin, made by melanocytes in the epidermis, determines skin colour and protects against UV."),
    ("The scattering of sunlight by air molecules, which makes the sky blue, is mainly:", ["Rayleigh scattering", "Total internal reflection", "Refraction", "Polarisation"], "a", "Shorter (blue) wavelengths are scattered much more strongly than red (Rayleigh scattering ∝ 1/λ⁴)."),
]

SAQ = [
 dict(marks=3, stem="What are the various classes of organic compounds in terms of the carbon skeleton (carbon chain) in their molecules? Give examples. (3 marks)",
      kp=[("Acyclic (open-chain/aliphatic) compounds - straight or branched chains, e.g. ethane, propane, isobutane, ethanol", 1),
          ("Cyclic - homocyclic (carbocyclic): alicyclic (cyclohexane) and aromatic/benzenoid (benzene, naphthalene)", 1),
          ("Cyclic - heterocyclic (ring contains N, O or S): pyridine, furan, thiophene", 1)],
      model="Organic compounds are classified by the arrangement of carbon atoms:\n1. Acyclic or open-chain (aliphatic) compounds - carbon atoms form straight or branched chains, e.g. ethane, propane, isobutane, acetic acid.\n2. Cyclic (closed-chain) compounds:\n(a) Homocyclic (carbocyclic) - rings made only of carbon atoms: alicyclic compounds that behave like aliphatic ones (cyclopropane, cyclohexane) and aromatic (benzenoid) compounds with a benzene ring (benzene, toluene, naphthalene).\n(b) Heterocyclic - rings containing one or more atoms other than carbon (N, O, S), e.g. pyridine, furan, thiophene."),
 dict(marks=3, stem="List the main factors that control (affect) the rate of a chemical reaction. (3 marks)",
      kp=[("Concentration of reactants (pressure for gases) and nature of the reactants", 1), ("Temperature and surface area / particle size", 1), ("Catalyst (and inhibitors) and light (for photochemical reactions)", 1)],
      model="1. Nature of the reactants - ionic reactions are fast, those breaking strong covalent bonds slow.\n2. Concentration of reactants (pressure for gases) - more particles per unit volume give more collisions.\n3. Temperature - a rise of about 10 °C roughly doubles the rate, since more molecules have the activation energy.\n4. Surface area (particle size) of solids - powders react faster than lumps.\n5. Catalysts speed up reactions by lowering the activation energy (inhibitors slow them).\n6. Light - for photochemical reactions such as H₂ + Cl₂ and photosynthesis."),
 dict(real=False, marks=3, stem="State Faraday's two laws of electrolysis and write one application of electrolysis in medicine or industry. (3 marks)",
      kp=[("First law: the mass of a substance deposited/liberated at an electrode is directly proportional to the quantity of electricity passed (m = ZIt)", 1),
          ("Second law: when the same quantity of electricity passes through different electrolytes, the masses deposited are proportional to their equivalent weights", 1),
          ("Application (any one): electroplating of surgical instruments, electrorefining of copper, extraction of aluminium/sodium, manufacture of NaOH and chlorine (used as disinfectant)", 1)],
      model="Faraday's first law: the mass (m) of a substance liberated or deposited at an electrode is directly proportional to the quantity of electricity (Q = I × t) passed: m = ZIt, where Z is the electrochemical equivalent.\nFaraday's second law: when the same quantity of electricity is passed through different electrolytes, the masses of the substances liberated are proportional to their chemical equivalent weights.\nApplications: electroplating (e.g. chromium or nickel plating of surgical instruments to prevent rusting), electrorefining of copper, extraction of reactive metals such as aluminium and sodium, and the chlor-alkali process that produces sodium hydroxide and chlorine used to make disinfectants."),
 dict(marks=3, stem="Briefly answer the following questions:\na) What are catalysts? (1 marks)\nb) How much of a catalyst is consumed in the reaction it catalyses? (1 marks)\nc) Is there a difference between the initial and final energy levels in catalysed and non-catalysed reactions? (1 marks)",
      kp=[("a) Substances that change (usually increase) the rate of a reaction by lowering the activation energy, without being used up", 1), ("b) None - the catalyst is recovered chemically unchanged at the end (in amount and composition)", 1),
          ("c) No - the reactants and products have the same energy levels (same ΔH) in both; only the activation energy is lower with the catalyst", 1)],
      model="a) A catalyst is a substance that alters (usually increases) the rate of a chemical reaction by providing an alternative pathway of lower activation energy, without itself being permanently changed. Enzymes are biological catalysts.\nb) None of it is consumed - the catalyst is regenerated and remains chemically unchanged in amount and composition at the end of the reaction (though it may change physically).\nc) No. The energy of the reactants (initial level) and of the products (final level) is the same with or without a catalyst, so the overall energy change (ΔH) is unchanged; the catalyst only lowers the height of the energy barrier (activation energy) between them."),
 dict(real=False, marks=3, stem="Differentiate between isotopes and isobars with examples, and state one medical use of a radioisotope. (3 marks)",
      kp=[("Isotopes: atoms of the same element with the same atomic number but different mass numbers (different neutrons), e.g. ¹H, ²H, ³H; ¹²C and ¹⁴C", 1),
          ("Isobars: atoms of different elements with the same mass number but different atomic numbers, e.g. ⁴⁰Ar, ⁴⁰K, ⁴⁰Ca", 1),
          ("Medical use (any one): I-131 for thyroid disorders, Co-60 for cancer radiotherapy/sterilisation, Tc-99m for diagnostic scans", 1)],
      model="Isotopes are atoms of the same element that have the same atomic number (number of protons) but different mass numbers because they have different numbers of neutrons. They have the same chemical properties. Examples: protium ¹H, deuterium ²H and tritium ³H; carbon-12 and carbon-14.\nIsobars are atoms of different elements that have the same mass number but different atomic numbers, so they have different chemical properties. Examples: argon-40, potassium-40 and calcium-40.\nMedical uses of radioisotopes: iodine-131 to diagnose and treat thyroid disease; cobalt-60 for radiotherapy of cancer and for sterilising medical equipment; technetium-99m for diagnostic scans of bone, heart and other organs."),
 dict(marks=3, stem="Which is the better mode of reproduction - sexual or asexual? Why? (3 marks)",
      kp=[("Sexual reproduction is generally better for the survival of a species", 1),
          ("Because fusion of gametes and meiosis (crossing over, independent assortment) produce genetic variation, so offspring can adapt to changing environments and evolution is possible", 1),
          ("Asexual reproduction is faster, needs one parent and gives identical clones (useful in stable environments, e.g. vegetative propagation), but lacks variation and a disease can wipe out the population", 1)],
      model="Sexual reproduction is generally the better mode for the long-term survival of a species. It involves meiosis and the fusion of male and female gametes, which, through crossing over, independent assortment and random fertilisation, produces genetically varied offspring. This variation helps some individuals survive changes in the environment or new diseases, and it is the raw material for evolution.\nAsexual reproduction (binary fission, budding, vegetative propagation) is faster, needs only one parent and uses less energy, and it preserves good characters exactly (useful in agriculture, e.g. grafting). However, all offspring are identical clones, so the population cannot adapt and may be wiped out by a single disease or environmental change."),
 dict(marks=3, stem="How do you convert the following?\na) A galvanometer into an ammeter (1.5 marks)\nb) A galvanometer into a voltmeter (1.5 marks)",
      kp=[("a) Connect a low resistance (shunt) in parallel with the galvanometer", 0.5), ("a) S = Ig G/(I − Ig), so most current bypasses the coil; the ammeter has very low resistance and is connected in series", 1),
          ("b) Connect a high resistance in series with the galvanometer", 0.5), ("b) R = V/Ig − G; the voltmeter has very high resistance and is connected in parallel across the component", 1)],
      model="a) Galvanometer to ammeter: connect a very low resistance, called a shunt (S), in parallel with the galvanometer. Most of the current flows through the shunt and only the safe full-scale current Ig passes through the coil. S = Ig × G/(I − Ig), where G is the galvanometer resistance and I the maximum current to be measured. The ammeter then has a very low resistance and is connected in series in the circuit.\nb) Galvanometer to voltmeter: connect a very high resistance (R) in series with the galvanometer, so that full-scale deflection occurs at the required voltage V: R = V/Ig − G. The voltmeter then has a very high resistance and is connected in parallel across the component whose voltage is measured."),
 dict(real=False, marks=3, stem="Define the following:\na) Mole (1 marks)\nb) Molar mass (1 marks)\nc) Avogadro's number (1 marks)",
      kp=[("a) Mole: the amount of substance containing as many particles (atoms, molecules, ions) as there are atoms in exactly 12 g of carbon-12, i.e. 6.022 × 10²³ particles", 1),
          ("b) Molar mass: the mass of one mole of a substance in grams per mole (numerically equal to its relative atomic/molecular mass), e.g. H₂O = 18 g/mol", 1),
          ("c) Avogadro's number: the number of particles in one mole, 6.022 × 10²³ mol⁻¹", 1)],
      model="a) A mole is the SI unit of amount of substance: the amount that contains as many elementary particles (atoms, molecules or ions) as there are atoms in exactly 12 g of carbon-12, that is 6.022 × 10²³ particles.\nb) Molar mass is the mass of one mole of a substance, expressed in grams per mole; it is numerically equal to the relative atomic or molecular mass, e.g. water H₂O = 2 × 1 + 16 = 18 g/mol, NaCl = 58.5 g/mol.\nc) Avogadro's number (Avogadro constant) is the number of particles in one mole of any substance: 6.022 × 10²³ per mole."),
 dict(marks=3, stem="Define the following:\na) Laws of reflection (1 marks)\nb) Electrical resistance (1 marks)\nc) Ultrasonic sound (1 marks)",
      kp=[("a) Angle of incidence = angle of reflection, and the incident ray, reflected ray and normal lie in the same plane", 1), ("b) Opposition of a conductor to the flow of current; R = V/I, measured in ohms, R = ρL/A", 1),
          ("c) Sound waves of frequency above 20 kHz (beyond human hearing); used in ultrasound scanning, cleaning, SONAR", 1)],
      model="a) Laws of reflection: (i) the angle of incidence is equal to the angle of reflection; (ii) the incident ray, the reflected ray and the normal at the point of incidence all lie in the same plane.\nb) Electrical resistance is the opposition offered by a conductor to the flow of electric current. It is the ratio of the potential difference across the conductor to the current through it, R = V/I, measured in ohms (Ω); for a wire R = ρL/A.\nc) Ultrasonic sound (ultrasound) is sound with a frequency above 20,000 Hz, beyond the range of human hearing. It is used in medical ultrasound scanning, physiotherapy, cleaning instruments and SONAR; bats and dolphins use it for echolocation."),
 dict(marks=3, stem="State Kepler's laws of planetary motion. (3 marks)",
      kp=[("First law (law of orbits): every planet moves in an elliptical orbit with the sun at one focus", 1), ("Second law (law of areas): the line joining the planet and the sun sweeps out equal areas in equal intervals of time (planet moves faster when nearer the sun)", 1),
          ("Third law (law of periods): the square of the orbital period is proportional to the cube of the semi-major axis, T² ∝ a³", 1)],
      model="1. Law of orbits: every planet moves around the sun in an elliptical orbit, with the sun at one of the two foci of the ellipse.\n2. Law of areas: the line joining a planet to the sun sweeps out equal areas in equal intervals of time. So a planet moves fastest when it is nearest the sun (perihelion) and slowest when farthest (aphelion) - a result of conservation of angular momentum.\n3. Law of periods: the square of the time a planet takes to go round the sun (T) is proportional to the cube of the semi-major axis of its orbit (a): T² ∝ a³."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
