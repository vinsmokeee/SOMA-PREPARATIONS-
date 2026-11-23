"""ME Technical Paper II (General Subject Knowledge), MEDICAL SCIENCE group, BCSE 2020 (held 26 February 2021) - real paper
(PDF sent by the founder). Same pattern as 2021-2025 (Part I 70 MCQ x 1; Part II 10 short answers x 3), ADDED to the pattern.
Left out (answer not certain or two options defensible): MCQ 4, 5, 7, 9, 10, 19, 28, 31, 32 (classic net filtration
pressure is about 10 mmHg - not offered), 41, 54 (a and b say the same thing), 58 (the volt is not offered), 62 (√2:1 not
offered), 64 (circuit figure cannot be read reliably), 66 (dynamo, turbine and windmill all convert mechanical energy).
Already on Soma (recorded as appearances, not loaded again): MCQ 11 and 21 (BCSE 2022 MCQ 11 and 21), 12 (BCSE 2023 MCQ
30), 36 (BCSE 2021 MCQ 33), 45 (BCSE 2022 MCQ 45), 60 (BCSE 2023 MCQ 60) and 67 (BCSE 2023 MCQ 64). MCQ 65: '47 KΩ' read
from the page image. Fifteen new MCQs replace the left-out ones.
Part II: Q4 (glomerular filtration) and Q5 (XDR/MDR-TB) are loaded from BCSE 2022 Q7 and Q8, and Q7 (Ohm's law) is
already on Soma from BCSE 2024, so they are recorded as appearances. Q6 asks for 'three laws' of refraction; the model
answer gives the two laws and the ray along the normal.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Medical Science): BCSE 2020, batch 1"
GROUP_TAG = "medsci2020"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "medical-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2020 Main Examination, Technical Paper II, Medical Science", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Medical Science: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "An example for enucleated cell in plants is",
"opts": [
"Parenchyma cell",
"Tracheid",
"Meristematic cell",
"A mature sieve tube cell"
]
},
{
"n": 2,
"stem": "Which of the following conditions need not be present for photosynthesis to proceed?",
"opts": [
"Water",
"Light",
"Oxygen",
"Chlorophyll"
]
},
{
"n": 3,
"stem": "In most of the mammals, the testes remain enclosed in an extra abdominal sac, the scrotum, where the temperature is lower than that in the abdomen. What will happen if the temperature of the scrotum is artificially maintained to the level of abdominal temperature?",
"opts": [
"Germinal epithelium will carry out normal spermatogenesis.",
"Germinal epithelium will produce a large quantity of androgen secretion.",
"Germinal epithelium will produce more sperms.",
"Germinal epithelium will degenerate, resulting in sterility."
]
},
{
"n": 4,
"stem": "The rate limiting step in photosynthesis is",
"opts": [
"Oxygen evolution",
"Dark reaction",
"Light reaction",
"Carbon dioxide diffusion to photosynthetic site"
]
},
{
"n": 5,
"stem": "A person who is on a long hunger strike and is surviving only on water will have",
"opts": [
"less amino acid in his urine.",
"less urea in his urine.",
"more glucose in his blood.",
"more sodium in his urine."
]
},
{
"n": 6,
"stem": "If Henles loop were absent from mammalian nephron, which of the following is to be expected?",
"opts": [
"There will be no urine formation.",
"There will be hardly any change in the quality and quantity of urine formed.",
"The urine will be more concentrated.",
"The urine will be more dilute."
]
},
{
"n": 7,
"stem": "Standing on tip toe is an example of",
"opts": [
"Elevation",
"Flexion",
"Extension",
"Retraction"
]
},
{
"n": 8,
"stem": "Which muscle is immune to fatigue?",
"opts": [
"Unstriped",
"Striped",
"Voluntary",
"Cardiac"
]
},
{
"n": 9,
"stem": "If mammalian ovum fails to get fertilized, which one of the following is unlikely?",
"opts": [
"Corpus luteum will degenerate.",
"Progesterone secretion rapidly declines.",
"Estrogen secretion further decreases.",
"Primary follicle starts developing."
]
},
{
"n": 10,
"stem": "By anticlinal division, organ increases in",
"opts": [
"Circumference",
"Area",
"Volume",
"Length"
]
},
{
"n": 11,
"stem": "Which one of the following does not cause water absorption by the plant roots?",
"opts": [
"High Turgor Pressure of a plant cell.",
"Transpiration pull force.",
"Osmotic pressure of the soil water.",
"Non osmotic pressure of the root hairs."
]
},
{
"n": 12,
"stem": "Choose the water soluble vitamins from the following:",
"opts": [
"Vitamin A",
"Vitamin D",
"Vitamin C",
"Vitamin E"
]
},
{
"n": 13,
"stem": "Choose the trace element which is required for body immune system:",
"opts": [
"Manganese",
"Copper",
"Zinc",
"Magnesium"
]
},
{
"n": 14,
"stem": "A recent study on health hazard of cigarette smoking has found that, continuous smoking reduces life span by 10 years. Choose the most appropriate habit to be adopted to quit smoking?",
"opts": [
"Ignore when you see the smokers.",
"Delay smoking when you feel urged.",
"Go out for exercise and involve in some work when you get urged.",
"Stay at home without going anywhere."
]
},
{
"n": 15,
"stem": "Choose the correct function of vacuoles:",
"opts": [
"Rigidity and protection of cells.",
"Takes part in cell division.",
"Acts as storage unit for food and water in the cells.",
"Function as power house of the cells."
]
},
{
"n": 16,
"stem": "The nitrogenous base present in pyrimidine are",
"opts": [
"Adenine & guanine",
"Adenine and thymine",
"Gunine and uracil",
"Cytosine and thymine"
]
},
{
"n": 17,
"stem": "Choose the bad cholesterol from the following:",
"opts": [
"Chylomicron",
"Very low density lipoprotein",
"Low density Lipoprotein",
"High density Lipoprotein"
]
},
{
"n": 18,
"stem": "All of the following are haemoparasitic infection EXCEPT",
"opts": [
"Dermatophytosis",
"Malaria",
"Kalazar",
"Filariasis"
]
},
{
"n": 19,
"stem": "Bhutan has the highest number of death due to alcoholic liver disease and liver cancer. Recent studies on the locally brewed alcohol ‘Ara’ found that there is a high amount of chemical toxic to the liver which causes cancer. Choose the chemical that was found in Ara that causes liver cancer.",
"opts": [
"Aflatoxin",
"Methanol",
"Aldehyde",
"Ethanol"
]
},
{
"n": 20,
"stem": "All the following vitamins are involve in body immune system EXCEPT",
"opts": [
"Vitamin A",
"Vitamin K",
"Vitamin B Complex",
"Vitamin C"
]
},
{
"n": 21,
"stem": "All of the following are the impact of intensive farming called Green Revolution EXCEPT",
"opts": [
"Water scarcity",
"Loss of habitat",
"Increase in soil fertility",
"Loss of genetic diversity"
]
},
{
"n": 22,
"stem": "In proof reading during DNA replication",
"opts": [
"wrong nucleotides are inserted.",
"wrong nucleotides are taken out.",
"wrong nucleotides are removed and correct ones are inserted.",
"mutations are prevented."
]
},
{
"n": 23,
"stem": "Which plant will lose its economic value if its fruits are produced by induced parthenocarpy?",
"opts": [
"Grape",
"Banana",
"Pomegranate",
"Orange"
]
},
{
"n": 24,
"stem": "Mountain sickness is caused due to",
"opts": [
"insufficient hemoglobin in RBCs.",
"inadequate immune system.",
"height phobia.",
"sudden change in atmospheric pressure and oxygen level."
]
},
{
"n": 25,
"stem": "In the renal tubules, the permeability of DCT and collecting duct is controlled by",
"opts": [
"Aldosterone",
"Vasopressin",
"Rennin",
"Renin"
]
},
{
"n": 26,
"stem": "In a skip generation inheritance of color blindness, the trait from a colour blind father is passed on to",
"opts": [
"Daughter",
"Son",
"Grandson",
"Granddaughter"
]
},
{
"n": 27,
"stem": "The end product of ornithine cycle is",
"opts": [
"CO2 and urea.",
"Creatinine that excreted through urine.",
"Urea that is excreted through urine.",
"Ammonia that is excreted through urine."
]
},
{
"n": 28,
"stem": "What will happen if ligaments are broken?",
"opts": [
"Bones will move freely.",
"No movement at joint.",
"Bone will become unfixed.",
"Bone will become fixed."
]
},
{
"n": 29,
"stem": "Which of the following is true regarding the Calvin cycle and light dependent reaction of the photosynthesis?",
"opts": [
"The light dependent reaction use ATP from the Calvin cycle and the Calvin cycle uses energy from absorbed sunlight.",
"During the light dependent reactions, carbon dioxide is fixed to produce sugars that form glucose.",
"The Calvin cycle converts water molecules into oxygen gas as a byproduct of its reaction.",
"The light dependent reactions take place in the thylakoid membrane and the Calvin cycle takes place in the stroma."
]
},
{
"n": 30,
"stem": "During an injury, if nasal septum gets demaged, which cartilage is perfused for its recovery?",
"opts": [
"Elastic cartilage",
"Hyaline cartilage",
"Calcified cartilage",
"Fibrous cartilage"
]
},
{
"n": 31,
"stem": "Most of the biological energy is supplied by mitochondria through",
"opts": [
"breaking of proteins.",
"reduction of NADP+",
"breaking sugars.",
"oxidising TCA substrates."
]
},
{
"n": 32,
"stem": "The net pressure gradient that causes the fluid to filter out of the glomeruli in the capsule is",
"opts": [
"20 mmHg",
"50 mmHg",
"75mmHg",
"30mmHg"
]
},
{
"n": 33,
"stem": "Which of the following nucleotide sequences contains 4 pyrimidine bases?",
"opts": [
"AGCCTTCAGC",
"GATCAATGC",
"GCUAGACAA",
"UAGCGGUAA"
]
},
{
"n": 34,
"stem": "Which biomolecule is responsible for insulation and long term energy storage?",
"opts": [
"Protein",
"Nucleic Acid",
"Lipid",
"Carbohydrates"
]
},
{
"n": 35,
"stem": "Blood group of a person with no antigens present in their blood cells is",
"opts": [
"O_",
"O+",
"AB+",
"A+"
]
},
{
"n": 36,
"stem": "The hormone erythropoietin stimulates red blood cell production in red bone marrow. Where is erythropoietin produced in the body?",
"opts": [
"Liver",
"Kidney",
"Spleen",
"Thyroid"
]
},
{
"n": 37,
"stem": "Which of the following is responsible for connecting muscle to the bone?",
"opts": [
"Tendon",
"Hyaline cartilage",
"Ligament",
"Elastic cartilage"
]
},
{
"n": 38,
"stem": "Identify the method used that does not preserve heat in the body:",
"opts": [
"Shivering",
"Curled up",
"Vasodilation",
"Vasoconstriction"
]
},
{
"n": 39,
"stem": "Maximum surface area of circulatory system is seen in",
"opts": [
"Heart",
"Capillaries",
"Arterioles",
"Veins"
]
},
{
"n": 40,
"stem": "If the base sequence of the strand of DNA is ATTCCGCTA, then its complementary strand in RNA would be",
"opts": [
"AUUCCGCUA",
"UTTGGCGTU",
"UAAGGCGAU",
"AUTTCGGTU"
]
},
{
"n": 41,
"stem": "The primary ions involved in gaseous exchange in and out of lung is",
"opts": [
"H+ only",
"HCO3- only",
"H+ & HCO3-",
"PO4 only"
]
},
{
"n": 42,
"stem": "From the following, choose the incorrect characteristics of catalyst:",
"opts": [
"It does not initiate chemical reaction but enhance the reaction.",
"It acts as reactant in the chemical reaction.",
"It remains unchanged in chemical composition.",
"It does not alter the final position of chemical equilibrium."
]
},
{
"n": 43,
"stem": "The composition of wrathful and peaceful cymbal (Roem and Cynyen) used as Buddhist religious instruments are the alloy of",
"opts": [
"Gold and Tin",
"Lead and Tin",
"Tin and copper",
"Silver and lead"
]
},
{
"n": 44,
"stem": "Which one of the following shows the increasing order of acidic strength?",
"opts": [
"HCOOH < CH3COOH < C6H5COOH",
"CH3COOH < HCOOH < C6H5COOH",
"C6H5COOH < CH3COOH < HCOOH",
"CH3COOH < C6H5COOH < HCOOH"
]
},
{
"n": 45,
"stem": "During winter, the metallic pipe gets cracked and burst due to",
"opts": [
"high water pressure in winter.",
"contraction of the metallic pipe in winter.",
"expansion of ice in the pipe.",
"pipe becomes brittle during winter."
]
},
{
"n": 46,
"stem": "Food is cooked slowly in Bumthang due to the decrease in",
"opts": [
"humidity and low temperature in high altitude.",
"boiling point and increase in atmospheric pressure in high altitude.",
"boiling point and decrease in atmospheric pressure at high altitude.",
"vapor pressure at high altitude."
]
},
{
"n": 47,
"stem": "The volume of a gas equals a constant value multiplied by its temperature as measured on the Kelvin scale. The above statement is",
"opts": [
"Boyle's Law",
"Charles' Law",
"Dalton's Law",
"Faraday's Law"
]
},
{
"n": 48,
"stem": "Looking mirror is formed by the reaction of the silver with",
"opts": [
"Secondary alcohol",
"Aldehyde",
"Ketone",
"Ester"
]
},
{
"n": 49,
"stem": "The mole fraction of the solute in one molal aqueous solution is",
"opts": [
"0.027",
"0.018",
"0.007",
"0.036"
]
},
{
"n": 50,
"stem": "Given that Zn2+/Zn = - 0.76V, Mg2+/Mg = - 2.37 V, then the correct statement about the reaction Zn + MgCl2 would be",
"opts": [
"Solid zinc dissolves",
"Formation of zinc chloride",
"Magnesium chloride precipitates out",
"No reaction occurs"
]
},
{
"n": 51,
"stem": "In a hydrogen – oxygen fuel cell, combustion of hydrogen occurs to",
"opts": [
"produce heat.",
"produce pure water.",
"create potential difference between two electrodes.",
"remove absorbed oxygen from the surface of electrodes."
]
},
{
"n": 52,
"stem": "Number of neutrons in a parent nucleus X which gives 7N14 nucleus after two successive β – emissions would be",
"opts": [
"9",
"6",
"8",
"7"
]
},
{
"n": 53,
"stem": "The unit of rate constant for second order reaction is",
"opts": [
"mol L-1 sec-1",
"sec-1",
"mol-1 L-1 sec",
"mol-1 L sec-1"
]
},
{
"n": 54,
"stem": "The isoelectric point of a protein is",
"opts": [
"the pH at which the protein molecule has no net electrical charges on its surface.",
"the pH at which a protein in solution has an equal number of positive and negative charges.",
"the electric charge under isotonic conditions.",
"the electric charge under isothermal conditions."
]
},
{
"n": 55,
"stem": "The pH of a solution is enhanced from 2 to 3. The concentration of H + in the new solution",
"opts": [
"is three times the original solution.",
"is two times the original solution.",
"decreases 10 times.",
"increases 10 times."
]
},
{
"n": 56,
"stem": "The electrical force between two charged objects is directly proportional to the product of the quantity of charge on the objects and inversely proportional to the square of the separation distance between the two objects. It is called",
"opts": [
"Coulomb’s law",
"Faraday’s law",
"Law of conservation of charge",
"Ohms Law"
]
},
{
"n": 57,
"stem": "Choose the correct effect of conductance of a conductor:",
"opts": [
"Directly proportional to the length of conductor.",
"Directly proportional to the cross section of the conductor.",
"Inversely proportional to the temperature.",
"Inversely proportional to the density of electrons in the conductor."
]
},
{
"n": 58,
"stem": "The unit of an electric potential is",
"opts": [
"Coulomb",
"Watt",
"Electron volt",
"Ampere"
]
},
{
"n": 59,
"stem": "All of the following are properties of convex lens EXCEPT",
"opts": [
"One surface bulges outwards.",
"Converges parallel rays to a focal point.",
"Have negative focal lengths.",
"Commonly used in cameras."
]
},
{
"n": 60,
"stem": "The electromagnetic radiation with shortest wavelength is",
"opts": [
"X-rays",
"Ultraviolet rays",
"Radio waves",
"Infra-red rays"
]
},
{
"n": 61,
"stem": "Every particle attracts every other particle in the universe with a force that is directly proportional to the product of their masses and inversely proportional to the square of the distance between their centers. This is the law of",
"opts": [
"Newton’s First Law",
"Newton’s Second Law",
"Newton’s Third Law",
"Newton's law of universal gravitation"
]
},
{
"n": 62,
"stem": "A 2 kg mass and 1 kg mass are moving with equal kinetic energies. The ratio of the magnitudes of their linear momentum is",
"opts": [
"1 : 2",
"1 : 1",
"4 : 1",
"2 : 1"
]
},
{
"n": 63,
"stem": "Which of the following pairs of physical quantities are dimensionally similar?",
"opts": [
"Force and work",
"Work and pressure",
"Pressure and potential energy",
"Work and potential energy"
]
},
{
"n": 64,
"stem": "The total current in the circuit shown below is",
"opts": [
"8.31 A",
"6.82 A",
"4.92 A",
"2.00 A"
]
},
{
"n": 65,
"stem": "A carbon resistor of 47 kΩ is to be marked with rings of different colours for identification. The correct sequence of colours will be",
"opts": [
"yellow, violet, orange",
"violet, orange, yellow",
"orange, yellow, violet",
"orange, violet, yellow"
]
},
{
"n": 66,
"stem": "The best example of converting mechanical energy into electrical energy is",
"opts": [
"Moving dynamo",
"Moving of turbine by water",
"Solar panel",
"Wind mill"
]
},
{
"n": 67,
"stem": "The type of pulleys used for lifting the water from the well is",
"opts": [
"Fixed pulley",
"Single movable pulley",
"Compound pulley",
"Combination of all"
]
},
{
"n": 68,
"stem": "An image size as the same object size can be obtained by",
"opts": [
"Plane mirror only",
"Convex mirror only",
"Concave mirror only",
"Both plane and concave mirror"
]
},
{
"n": 69,
"stem": "A well cut diamond appears bright due to",
"opts": [
"Emission of bright light",
"Total internal reflection",
"Scattering of light",
"Dispersion of light"
]
},
{
"n": 70,
"stem": "A wire having a very high value of conductance is said to be",
"opts": [
"A moderately good conductor",
"A very good conductor",
"An insulator",
"A semiconductor"
]
}
]"""

KEY = {
    1: ("d", "Mature sieve tube elements lose their nucleus; their activities are controlled by the companion cells."),
    2: ("c", "Oxygen is a product of photosynthesis, not a condition for it; water, light and chlorophyll are needed."),
    3: ("d", "Sperm formation needs a temperature about 2-3 °C below body temperature; at abdominal temperature the germinal epithelium degenerates, causing sterility."),
    6: ("d", "The loop of Henle concentrates urine; without it, urine would be large in volume and dilute."),
    8: ("d", "Cardiac muscle contracts rhythmically throughout life without fatigue."),
    13: ("c", "Zinc is a trace element essential for the development and function of immune cells."),
    14: ("c", "Replacing the urge with exercise or other activity is a recommended behavioural way to quit smoking."),
    15: ("c", "Vacuoles store water, food, salts and wastes in the cell."),
    16: ("d", "Pyrimidines are cytosine, thymine (in DNA) and uracil (in RNA); adenine and guanine are purines."),
    17: ("c", "LDL is 'bad' cholesterol: it carries cholesterol to the tissues and arteries, promoting atherosclerosis."),
    18: ("a", "Dermatophytosis (ringworm) is a fungal skin infection; malaria, kala-azar and filariasis are blood parasites."),
    20: ("b", "Vitamin K is needed for blood clotting, not mainly for immunity; vitamins A, B complex and C support immunity."),
    22: ("c", "In proof-reading, DNA polymerase removes a wrongly inserted nucleotide and inserts the correct one."),
    23: ("c", "The edible part of pomegranate comes from the seeds (arils), so a seedless (parthenocarpic) fruit would lose its value."),
    24: ("d", "Mountain sickness is caused by the low air pressure and low oxygen at high altitude (hypoxia)."),
    25: ("b", "Vasopressin (ADH) increases the water permeability of the distal tubule and collecting duct."),
    26: ("c", "A colour-blind father passes his X chromosome to all daughters (carriers), who can pass it to their sons: the grandson."),
    27: ("c", "The ornithine (urea) cycle in the liver converts ammonia into urea, which is excreted in urine."),
    29: ("d", "The light reactions occur in the thylakoid membranes and the Calvin cycle in the stroma of the chloroplast."),
    30: ("b", "The nasal septum is made of hyaline cartilage."),
    33: ("b", "GATCAATGC has four pyrimidines (T, C, T, C); the other sequences have six or three."),
    34: ("c", "Lipids (fats) store energy long-term and insulate the body."),
    35: ("a", "O negative red cells carry none of the A, B or Rh D antigens."),
    37: ("a", "Tendons connect muscles to bones; ligaments connect bone to bone."),
    38: ("c", "Vasodilation brings more blood to the skin, so heat is lost; shivering, curling up and vasoconstriction conserve heat."),
    39: ("b", "Capillaries have the largest total cross-sectional and surface area for exchange."),
    40: ("c", "The RNA complementary to ATTCCGCTA is UAAGGCGAU (A pairs with U, T with A, C with G)."),
    42: ("b", "A catalyst is not used up as a reactant; it remains chemically unchanged at the end of the reaction."),
    43: ("c", "Cymbals are made of bronze, an alloy of copper and tin."),
    44: ("d", "Acid strength: acetic acid (pKa 4.76) < benzoic acid (4.20) < formic acid (3.75)."),
    46: ("c", "At high altitude the air pressure is lower, so water boils below 100 °C and food cooks slowly."),
    47: ("b", "Charles's law: at constant pressure, the volume of a gas is directly proportional to its absolute (Kelvin) temperature."),
    48: ("b", "Aldehydes reduce Tollens' reagent (ammoniacal silver nitrate), depositing a silver mirror on the glass."),
    49: ("b", "1 molal means 1 mol solute in 1 kg (55.5 mol) of water: mole fraction = 1/56.5 ≈ 0.018."),
    50: ("d", "Zinc (E° = -0.76 V) is a weaker reducing agent than magnesium (-2.37 V), so it cannot displace Mg: no reaction."),
    51: ("c", "In a fuel cell the energy of the hydrogen-oxygen reaction is converted directly into electricity (a potential difference)."),
    52: ("a", "Each beta emission raises Z by 1, so the parent is boron-14 (Z = 5, A = 14) with 14 - 5 = 9 neutrons."),
    53: ("d", "For a second-order reaction, rate = k[A]², so k has units of mol⁻¹ L s⁻¹."),
    55: ("c", "pH is -log[H+]; raising pH from 2 to 3 makes [H+] ten times smaller."),
    56: ("a", "Coulomb's law: F = kq1q2/r²."),
    57: ("b", "Conductance (G = σA/L) increases with cross-sectional area and decreases with length."),
    59: ("c", "A convex lens has a positive focal length; concave lenses have negative focal lengths."),
    61: ("d", "This is Newton's law of universal gravitation: F = Gm1m2/r²."),
    63: ("d", "Work and potential energy are both energy, with dimensions ML²T⁻²."),
    65: ("a", "47 kΩ = 47 × 10³ Ω: yellow (4), violet (7), orange (× 10³)."),
    68: ("d", "A plane mirror gives an image of the same size; a concave mirror does too when the object is at its centre of curvature."),
    69: ("b", "Light entering a cut diamond is totally internally reflected many times because of its high refractive index and small critical angle."),
    70: ("b", "High conductance means low resistance, so the wire is a very good conductor."),
}

NEW_MCQ = [
    ("In the light reactions of photosynthesis, oxygen is released from the splitting of", ["carbon dioxide", "water", "glucose", "chlorophyll"], "b",
     "Photolysis of water in the light reactions releases oxygen, protons and electrons."),
    ("During prolonged fasting, the body's main source of energy after glycogen stores are used up is", ["vitamins", "stored fat", "minerals", "water"], "b",
     "When liver glycogen runs out (about a day), the body relies mainly on fat (fatty acids and ketone bodies) for energy."),
    ("Bending the elbow so that the forearm moves towards the upper arm is called", ["extension", "flexion", "abduction", "rotation"], "b",
     "Flexion decreases the angle between two bones at a joint; extension increases it."),
    ("The hormone that triggers ovulation is", ["Luteinising hormone (LH)", "Progesterone", "Prolactin", "Oxytocin"], "a",
     "A mid-cycle surge of LH from the anterior pituitary causes the Graafian follicle to rupture and release the ovum."),
    ("Growth in length of a plant stem or root occurs mainly at the", ["apical meristem", "cork cambium", "xylem vessels", "epidermis"], "a",
     "Apical meristems at the tips of stems and roots divide to increase length (primary growth)."),
    ("Methanol in illicitly brewed alcohol is dangerous mainly because it can cause", ["blindness and death", "night blindness only", "goitre", "scurvy"], "a",
     "Methanol is converted to formaldehyde and formic acid, which damage the optic nerve (blindness) and can be fatal."),
    ("A sprained ankle means an injury to a", ["tendon", "ligament", "muscle", "bone"], "b",
     "A sprain is a stretch or tear of a ligament; a strain is an injury to a muscle or tendon."),
    ("The energy currency of the cell is", ["glucose", "ATP", "DNA", "NADPH"], "b",
     "Adenosine triphosphate (ATP) stores and supplies energy for cellular work."),
    ("The glomerular filtration rate (GFR) of a healthy adult is about", ["12 ml per minute", "125 ml per minute", "1250 ml per minute", "5 litres per minute"], "b",
     "A normal GFR is about 125 ml/min, or about 180 litres of filtrate a day, of which over 99% is reabsorbed."),
    ("In red blood cells, carbon dioxide combines with water to form carbonic acid with the help of the enzyme", ["carbonic anhydrase", "amylase", "pepsin", "lipase"], "a",
     "Carbonic anhydrase speeds up CO2 + H2O → H2CO3 → H+ + HCO3-, which is how most CO2 is carried in blood."),
    ("Proteins carry no net electrical charge at their", ["boiling point", "isoelectric point", "freezing point", "melting point"], "b",
     "At the isoelectric point (pI) a protein has equal positive and negative charges, so its net charge is zero and it is least soluble."),
    ("The SI unit of electric potential difference is the", ["ampere", "ohm", "volt", "coulomb"], "c",
     "Potential difference is measured in volts (1 V = 1 joule per coulomb)."),
    ("If the speed of a moving body is doubled, its kinetic energy becomes", ["double", "half", "four times", "the same"], "c",
     "KE = ½mv²; doubling v makes the kinetic energy 2² = 4 times as large."),
    ("Three resistors of 6 Ω each are connected in parallel. Their equivalent resistance is", ["18 Ω", "6 Ω", "3 Ω", "2 Ω"], "d",
     "For equal resistors in parallel, R = 6/3 = 2 Ω."),
    ("A hydroelectric power station converts the potential energy of stored water first into", ["chemical energy", "kinetic energy of falling water and the turbine", "light energy", "nuclear energy"], "b",
     "Water falling from the dam gains kinetic energy and turns the turbine, whose generator then produces electrical energy."),
]

SAQ = [
 dict(marks=3, stem="The rising number of people with Non-Communicable Diseases (NCDs) is an emerging public health problem that causes 70% of mortality in Bhutan. Write the three most common NCDs prevailing in Bhutan and mention their preventive measures. (3 marks)",
      kp=[("Three common NCDs, e.g. hypertension/ cardiovascular disease and stroke, diabetes mellitus, alcoholic liver disease, cancers (stomach, liver, cervical), chronic respiratory disease", 1),
          ("Prevention through healthy lifestyle: reduce salt, sugar and fat; more fruit and vegetables; regular physical activity; avoid tobacco and harmful alcohol; maintain healthy weight", 1),
          ("Early detection and control: regular screening of BP, blood sugar, BMI, cancer screening (Pap smear/ HPV, endoscopy); treatment adherence; health education; policies (alcohol tax, tobacco control)", 1)],
      model="Common NCDs in Bhutan include: (1) hypertension and other cardiovascular diseases, including stroke; (2) diabetes mellitus; and (3) alcoholic liver disease; cancers (stomach, liver, cervical) and chronic lung disease are also common. Preventive measures: reduce salt intake (less salt in suja and ezay) and sugary, fatty and processed foods; eat more fruit and vegetables; do regular physical activity (at least 150 minutes a week); stop tobacco and doma use and avoid harmful drinking; keep a healthy weight; get regular screening for blood pressure, blood sugar and weight and cancer screening (cervical screening, endoscopy for stomach cancer, hepatitis B vaccination against liver cancer); take medicines regularly once diagnosed; and support policies such as higher alcohol taxes, tobacco control and health-promoting schools and workplaces."),
 dict(marks=3, stem="Explain scientifically how the following precautionary measures can prevent SARS-CoV-2 infection: (a) physical distance; (b) wearing a mask; (c) hand washing; (d) maintaining ventilation. (3 marks)",
      kp=[("(a) Physical distance (at least 1 m): respiratory droplets fall within about 1-2 m, so distance reduces exposure; (b) masks block droplets and aerosols from an infected wearer (source control) and protect the wearer", 1.5),
          ("(c) Hand washing with soap (20 seconds) or alcohol rub dissolves the virus's lipid envelope and removes it, stopping spread from hands to eyes, nose, mouth; (d) ventilation dilutes and removes infectious aerosols in indoor air", 1.5)],
      model="SARS-CoV-2 spreads mainly through respiratory droplets and small aerosols from an infected person's breath, cough or sneeze, and sometimes from contaminated hands. (a) Physical distance of at least 1-2 metres reduces exposure because most large droplets fall to the ground within this distance. (b) A mask traps droplets and aerosols at the source when an infected person (even without symptoms) talks or coughs, and also filters some of the particles breathed in by the wearer. (c) Washing hands with soap and water for 20 seconds (or using an alcohol rub) breaks the virus's fatty (lipid) envelope and washes it away, so it is not carried from hands to the eyes, nose or mouth. (d) Good ventilation brings in fresh air and removes or dilutes the infectious aerosols that build up in closed rooms, lowering the dose a person may breathe in."),
 dict(marks=3, stem="Explain the differences between Malaria and Dengue fever in terms of causative agents, transmission, brief pathophysiology and preventive measures. (3 marks)",
      kp=[("Causative agent: malaria - Plasmodium protozoa (P. falciparum, P. vivax, etc.); dengue - dengue virus (flavivirus, 4 serotypes). Transmission: malaria - female Anopheles mosquito, bites at night; dengue - Aedes aegypti/ albopictus, bites in the daytime, breeds in clean stored water", 1),
          ("Pathophysiology: malaria - parasites multiply in liver then red cells, which rupture → cyclical fever, anaemia, (falciparum: cerebral malaria); dengue - virus infects immune cells → fever, rash, muscle/ joint pain, capillary leakage and low platelets → dengue haemorrhagic fever/ shock", 1),
          ("Prevention: both - avoid bites (nets, repellents, clothing) and vector control; malaria - insecticide-treated nets, indoor residual spraying, early diagnosis and treatment, prophylaxis for travellers; dengue - remove water containers/ breeding sites, daytime protection, community clean-up", 1)],
      model="Causative agent: malaria is caused by protozoan parasites of the genus Plasmodium (P. falciparum, P. vivax and others); dengue is caused by the dengue virus, a flavivirus with four serotypes. Transmission: malaria is spread by the bite of the female Anopheles mosquito, which bites mostly at night and breeds in clean, slow-moving water; dengue is spread by Aedes aegypti and Aedes albopictus mosquitoes, which bite mostly during the day and breed in clean water stored in containers, tyres and pots. Pathophysiology: in malaria the parasites multiply first in the liver and then inside red blood cells, which burst in cycles, causing fever with chills, anaemia and, with P. falciparum, blockage of small vessels (cerebral malaria, organ failure); in dengue the virus infects immune cells, causing high fever, headache, pain behind the eyes, muscle and joint pain and rash, and in severe cases capillary leakage, low platelets and bleeding (dengue haemorrhagic fever and shock). Prevention: for both, avoid mosquito bites and control vectors; for malaria, use insecticide-treated bed nets and indoor spraying, and diagnose and treat cases early; for dengue, remove or cover water containers and other breeding sites, use repellents and protective clothing in the daytime and run community clean-up campaigns."),
 dict(marks=3, stem="Draw a diagram to explain the laws of refraction. (3 marks)",
      kp=[("Labelled diagram: two media (e.g. air and glass), interface, normal at the point of incidence, incident ray, refracted ray bending towards the normal (into denser medium), angles i and r measured from the normal", 1),
          ("First law: the incident ray, the refracted ray and the normal at the point of incidence lie in the same plane", 1),
          ("Second law (Snell's law): sin i / sin r = constant (refractive index n2/n1); also a ray along the normal passes straight without bending", 1)],
      model="Diagram (described): draw a horizontal line as the boundary between air (above) and glass (below); at the point of incidence draw a dotted normal perpendicular to the boundary; draw the incident ray coming from air at angle i to the normal and the refracted ray in the glass bending towards the normal at a smaller angle r; label the incident ray, refracted ray, normal, angle of incidence (i) and angle of refraction (r). Laws: (1) the incident ray, the refracted ray and the normal at the point of incidence all lie in the same plane; (2) Snell's law - for a given pair of media and a given colour of light, the ratio sin i / sin r is a constant, called the refractive index of the second medium with respect to the first (n = sin i / sin r = n2/n1); light bends towards the normal on entering a denser medium and away from it on entering a rarer one. In addition, a ray falling along the normal (i = 0) passes into the second medium without bending."),
 dict(marks=3, stem="Name six noble gases and their common uses. (3 marks)",
      kp=[("Names: helium, neon, argon, krypton, xenon, radon", 1),
          ("Uses: helium - balloons, airships, cooling MRI magnets, breathing mixtures for divers; neon - advertising signs, indicator lamps; argon - inert atmosphere in welding, filling electric bulbs", 1),
          ("Uses: krypton - flash lamps, energy-saving bulbs, lasers; xenon - flash bulbs, car headlamps, anaesthesia; radon - radiotherapy of cancer (radioactive)", 1)],
      model="The six noble gases and uses: (1) Helium (He) - filling weather balloons and airships, cooling the superconducting magnets of MRI scanners, and helium-oxygen breathing mixtures for divers and some patients. (2) Neon (Ne) - red-orange advertising signs and indicator lamps. (3) Argon (Ar) - inert atmosphere for welding and metal production and filling ordinary light bulbs. (4) Krypton (Kr) - high-intensity and energy-saving lamps, photographic flash and some lasers. (5) Xenon (Xe) - flash lamps, vehicle headlamps, projector lamps and as an anaesthetic. (6) Radon (Rn) - radioactive; used in the past for radiotherapy of cancer (it is also a health hazard in homes)."),
 dict(marks=3, stem="Write down three chemical differences between diamond and graphite. (3 marks)",
      kp=[("Bonding/ hybridisation: diamond - each C sp3 bonded to 4 others in a 3-D tetrahedral network; graphite - each C sp2 bonded to 3 others in flat hexagonal layers with weak van der Waals forces between layers", 1),
          ("Electrical conductivity: graphite conducts (one free delocalised electron per carbon); diamond is an insulator (all electrons in bonds)", 1),
          ("Hardness/ stability/ reactivity: diamond very hard, high density; graphite soft, slippery (lubricant), less dense, thermodynamically more stable and more reactive (oxidised more easily)", 1)],
      model="Diamond and graphite are both allotropes of carbon but differ: (1) Bonding: in diamond each carbon is sp3 hybridised and bonded covalently to four other carbons in a rigid three-dimensional tetrahedral network; in graphite each carbon is sp2 hybridised and bonded to three others in flat hexagonal layers held together only by weak van der Waals forces. (2) Electrical conductivity: graphite has one free (delocalised) electron per carbon atom and conducts electricity, so it is used for electrodes; diamond has no free electrons and is an insulator. (3) Hardness and other properties: diamond is the hardest natural substance with high density and is used for cutting tools; graphite is soft and slippery (the layers slide), less dense, used as a lubricant and in pencils, and is the more stable form that burns/ oxidises more readily."),
 dict(marks=3, stem="Explain diabetes. Differentiate Type 1 and Type 2 diabetes. (3 marks)",
      kp=[("Diabetes mellitus: a chronic metabolic disease with high blood glucose due to lack of insulin and/ or resistance to its action; symptoms polyuria, polydipsia, polyphagia, weight loss; complications in eyes, kidneys, nerves, heart", 1),
          ("Type 1: autoimmune destruction of beta cells → absolute insulin deficiency; usually children/ young; sudden onset, thin, ketoacidosis prone; needs insulin for life", 1),
          ("Type 2: insulin resistance with relative deficiency; usually adults (40+), linked to obesity, inactivity, family history; gradual onset; managed by lifestyle change, oral drugs, insulin later; most common type (about 90%)", 1)],
      model="Diabetes mellitus is a long-term metabolic disease in which blood glucose stays high because the pancreas does not make enough insulin or the body cannot use insulin properly. It causes frequent urination, thirst, hunger, tiredness and weight loss, and over time damages the eyes, kidneys, nerves, heart and blood vessels. Type 1 diabetes is caused by autoimmune destruction of the insulin-making beta cells, giving an absolute lack of insulin; it usually starts suddenly in children and young people who are often thin, is prone to ketoacidosis and must be treated with insulin for life. Type 2 diabetes is caused mainly by insulin resistance with a relative lack of insulin; it usually develops slowly in adults (often over 40) and is linked to obesity, physical inactivity, unhealthy diet and family history; it is the most common type (about 90% of cases) and is managed with diet, exercise and weight loss, oral medicines (such as metformin) and later insulin if needed."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
