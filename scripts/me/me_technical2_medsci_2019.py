"""ME Technical Paper II (General Subject Knowledge), MEDICAL SCIENCE group, BCSE 2019 - real paper (PDF sent by the founder).
Same pattern as 2020-2025 (Part I 70 MCQ x 1; Part II 10 short answers x 3), so it is ADDED to the paper's pattern.
Left out (answer not certain, two options defensible or a missing figure): MCQ 1 (cell walls are neither protein nor
semi-permeable), 6 (both Aedes species carry dengue), 11 (cell-division diagram not in the PDF), 12, 14, 19, 21, 31,
34, 37 (lowering the freezing and melting point are the same), 47, 54, 57 (every option is false), 63 (√2:1 not offered).
Already on Soma (recorded as appearances, not loaded again): MCQ 2 (BCSE 2022 MCQ 11), 7 (2022 MCQ 10), 10 (2022 MCQ 17),
23 (2023 MCQ 19), 25 (2023 MCQ 22), 28 (2021 MCQ 29), 30 (2023 MCQ 32), 66 (2022 MCQ 67), 67 (2023 MCQ 65), and 29 and 58
(BCSE 2024 Medical Science Paper II). Fourteen new MCQs replace the left-out ones.
Part II: Q4 (DNA and RNA) is loaded from BCSE 2023 Q6 (appearance recorded); Q7 (ear diagram - numbered parts cannot be
read from the PDF) is replaced by a new question.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Medical Science): BCSE 2019, batch 1"
GROUP_TAG = "medsci2019"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "medical-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2019 Main Examination, Technical Paper II, Medical Science", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Medical Science: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Which is NOT a characteristic of plant cell walls?",
"opts": [
"It is semi-permeable.",
"It is made of proteins.",
"It surrounds the cytoplasm.",
"It is a protection for cytoplasm."
]
},
{
"n": 2,
"stem": "All the following causes water absorption by the plant roots EXCEPT",
"opts": [
"High Turgor Pressure of a plant cell.",
"Transpiration pull force.",
"Osmotic pressure of the soil water.",
"Non osmotic pressure of the root hairs."
]
},
{
"n": 3,
"stem": "All of the following are fat soluble vitamins, EXCEPT",
"opts": [
"Vitamin A",
"Vitamin D",
"Vitamin C",
"Vitamin E"
]
},
{
"n": 4,
"stem": "Choose the trace element which is required for iron metabolism in human body:",
"opts": [
"Manganese",
"Copper",
"Zinc",
"Magnesium"
]
},
{
"n": 5,
"stem": "Dermatophytosis is an example of",
"opts": [
"bacterial infection.",
"parasitic infection.",
"viral infection.",
"fungal infection."
]
},
{
"n": 6,
"stem": "Choose the correct species of mosquito that transmits dengue virus:",
"opts": [
"Aedes aegypti",
"Aedes albopictus",
"Anopheles mosquitoe",
"Culex quinquefasciatus"
]
},
{
"n": 7,
"stem": "Action potential is due to",
"opts": [
"K+",
"Cl-",
"Ca+",
"Na+"
]
},
{
"n": 8,
"stem": "Choose the correct function of chloroplast:",
"opts": [
"Rigidity and protection of plant cells.",
"Takes part in plant cell division.",
"Acts as food processing unit in the plant cells.",
"Function as power house of the plant cells."
]
},
{
"n": 9,
"stem": "The nitrogenous base present in purine are",
"opts": [
"adenine & guanine.",
"adenine and thymine.",
"gunine and uracil.",
"cytosine and thymine."
]
},
{
"n": 10,
"stem": "One of the lipoprotein is called good cholesterol because it transports fatty acids from peripheral tissues to the liver for metabolism. Choose the good cholesterol from the following:",
"opts": [
"Chylomicron",
"Very low density lipoprotein cholesterol",
"Low density Lipoprotein cholesterol",
"High density Lipoprotein"
]
},
{
"n": 11,
"stem": "Cell division takes place in four phases. Choose the correct phase of the cell division from the diagram provided on the right side.",
"opts": [
"Prophase",
"Metaphase",
"Anaphase",
"Telophase"
]
},
{
"n": 12,
"stem": "Eukaryotic cells differ from prokaryotic cells due to",
"opts": [
"mode of cell division.",
"multi-cellular in nature.",
"shape and size of the cells.",
"motility of the cells."
]
},
{
"n": 13,
"stem": "All of the following are intestinal parasites EXCEPT:",
"opts": [
"Ascaris lumbricoide",
"Trichiuris trichiuria",
"Ancylostoma duodenale",
"Wuchereria bancrofti"
]
},
{
"n": 14,
"stem": "Recent studies on locally brewed alcohol called ‘Ara’ were found to have high chemical toxic to the liver. Choose the chemical that has been found in unacceptable level in Ara that is toxic to the liver:",
"opts": [
"Suphur oxide",
"Methanol",
"Aldehyde",
"Ethanol"
]
},
{
"n": 15,
"stem": "Why is flu common in winter?",
"opts": [
"Flu virus can survive only in winter.",
"Lowering of immune system in winter.",
"Cold temperature favors the multiplication of virus.",
"Due to low humidity and more indoor stay of people in winter."
]
},
{
"n": 16,
"stem": "Choose the correct pH level of normal human urine:",
"opts": [
"Average 6.0, range 4.5-8.0",
"Average 5.0, range 4.0-7.5",
"Average 6.5, range 5.0-8.5",
"Average 7.0, range 5.0-8.0"
]
},
{
"n": 17,
"stem": "Smallest unit of the compound capable of existing on its own is",
"opts": [
"protons",
"atom",
"elements",
"molecule"
]
},
{
"n": 18,
"stem": "The vitamin which helps in synthesis of coagulation is",
"opts": [
"vitamin A",
"vitamin K",
"vitamin B Complex",
"vitamin D"
]
},
{
"n": 19,
"stem": "Common bacteria that cause diarrhoea in Bhutan is",
"opts": [
"E. coli",
"Salmonella",
"Shigella",
"Staphylococcus species"
]
},
{
"n": 20,
"stem": "All of the following are functions of bones EXCEPT:",
"opts": [
"Protection for the internal organs.",
"Provide shape to the body.",
"Provide support to the whole body.",
"Shock absorber of various organs."
]
},
{
"n": 21,
"stem": "Each sensory organ has cells with specified functions. Choose the wrongly matched pair from the following:",
"opts": [
"Taste - gustatory cells",
"Smell - olfactory neuron",
"Hearing - stereocilia",
"Vision - rod cells"
]
},
{
"n": 22,
"stem": "All the following are cold blooded animal EXCEPT:",
"opts": [
"Frog",
"Turtle",
"Crocodile",
"Penguin"
]
},
{
"n": 23,
"stem": "Which part of the human brain is concerned with the body balance in movement?",
"opts": [
"Medulla oblongata",
"Cerebellum",
"Cerebrum",
"Hypothalamus"
]
},
{
"n": 24,
"stem": "A hormone that helps in uterine contraction and control of bleeding is",
"opts": [
"prolactin.",
"serotonin.",
"oxytocin.",
"rennin."
]
},
{
"n": 25,
"stem": "Which of the following is responsible for connecting bone to bone?",
"opts": [
"Tendon",
"Fibrous cartilage",
"Hyaline cartilage",
"Ligament."
]
},
{
"n": 26,
"stem": "Function of canine teeth is",
"opts": [
"grinding.",
"cutting.",
"tearing.",
"All the above."
]
},
{
"n": 27,
"stem": "Choose the INCORRECT function of liver?",
"opts": [
"Detoxification of harmful substances.",
"Excretion of bilirubin.",
"Synthesis of proteins.",
"Production of blood cells."
]
},
{
"n": 28,
"stem": "The world’s AID’s Day is observed on",
"opts": [
"24th March.",
"1st April.",
"1st December.",
"28th September."
]
},
{
"n": 29,
"stem": "Which of the following functions is the least important for proteins?",
"opts": [
"Become blood osmotic proteins.",
"Converted to enzymes.",
"Utilization for energy.",
"Component of body structure."
]
},
{
"n": 30,
"stem": "Choose the tissue which cannot store glycogen or lipids for energy:",
"opts": [
"Nerve tissues",
"Muscle tissues",
"Liver tissues",
"Cardiac muscle tissues"
]
},
{
"n": 31,
"stem": "All of the following are correct for Saponification EXCEPT:",
"opts": [
"Involve hydrolysis of an ester under acidic or basic conditions.",
"Reaction forms an alcohol and the salt of a carboxylic acid.",
"Reaction is used for production of soaps.",
"It is an example of Redox reactions."
]
},
{
"n": 32,
"stem": "Sesamoid bones are seen in all the following parts of the body EXCEPT:",
"opts": [
"Knee",
"Foot",
"Hand",
"Arms"
]
},
{
"n": 33,
"stem": "Black water fever is associated with",
"opts": [
"typhoid.",
"dysentery.",
"cholera.",
"malaria."
]
},
{
"n": 34,
"stem": "The primary ions involved in gaseous exchange in and out of lung is",
"opts": [
"H+ only",
"HCO3- only",
"H+ & HCO3-",
"PO4 only"
]
},
{
"n": 35,
"stem": "All of the following are characteristics of Catalyst EXCEPT:",
"opts": [
"Does not initiate chemical reaction but enhance the reaction.",
"Remains unchanged in chemical composition.",
"Does not alter the final position of chemical equilibrium.",
"Act as reactant in the chemical reaction."
]
},
{
"n": 36,
"stem": "Children are discouraged to play with the paints containing chemicals that affect behavior and intelligence in children on high exposure. Choose the correct chemicals/substance from the following that cause the above effect:",
"opts": [
"Lead",
"Mercury",
"Graphite",
"Carbon"
]
},
{
"n": 37,
"stem": "Department of Roads uses salt to melt the ice faster on the road on the high mountains. What is the effect of salt on the ice?",
"opts": [
"Lowers vapour pressure of the ice.",
"Lowers melting point of the ice.",
"Increases the freezing point of the ice.",
"Lowers the freezing point of the ice."
]
},
{
"n": 38,
"stem": "Food is cooked faster in Phuntsholing than Bumthang. Choose the correct reason from the following:",
"opts": [
"Due to increase humidity and high temperature in low altitude.",
"Due to decrease in boiling point and decrease in atmospheric pressure in low altitude.",
"Due to increase in boiling point and increase in atmospheric pressure in low altitude.",
"Due to increase in vapour pressure in low altitude."
]
},
{
"n": 39,
"stem": "Choose the correct Boyle’s law:",
"opts": [
"If the volume of the lungs is increased, the pressure also increases proportionately.",
"If the volume of the lungs is increased, the pressure decreases proportionately.",
"If the volume of the lungs is increased, the pressure remains the same.",
"If the volume of the lungs is decreased, the pressure also decreases proportionately."
]
},
{
"n": 40,
"stem": "Dry ice is formed due to",
"opts": [
"hydrogen bond.",
"covalent bond.",
"electrostatic bond.",
"van der waals forces."
]
},
{
"n": 41,
"stem": "Molality of the solution is defined as the number of",
"opts": [
"moles of a substance per liter of solution.",
"moles of solute per kg of solvent.",
"equivalent weights of solute per liter of solution.",
"grams of solute per kilogram of solvent."
]
},
{
"n": 42,
"stem": "Choose the INCORRECT application of the following halogens:",
"opts": [
"Chlorine- bleaching agent",
"Iodine- antiseptic",
"Bromine- flame retardants",
"Fluorine- insecticide"
]
},
{
"n": 43,
"stem": "Choose the paramagnetic metal from the following:",
"opts": [
"Copper",
"Lead",
"Iron",
"Brass"
]
},
{
"n": 44,
"stem": "Catalytic dehydrogenation of a primary alcohol gives",
"opts": [
"secondary alcohol.",
"aldehyde.",
"ketone.",
"ester."
]
},
{
"n": 45,
"stem": "Primary composition of the drinking glass is",
"opts": [
"sodium oxide.",
"silicon dioxide.",
"calcium oxide.",
"lead oxide."
]
},
{
"n": 46,
"stem": "The main composition of the white paper is",
"opts": [
"cellulose.",
"hemi-cellulose.",
"lignin.",
"rosin."
]
},
{
"n": 47,
"stem": "Choose the correct description of denatured alcohol:",
"opts": [
"It is fit for consumption.",
"It contains ordinary ethyl alcohol.",
"It is used as cleaning agent.",
"It is usually prepared by adding methanol."
]
},
{
"n": 48,
"stem": "Choose the correct reaction for the production of sulphuric acid:",
"opts": [
"SO2 +H2O2 = H2SO4",
"SO3 +H2O = 2H2SO4",
"SO3 +H2O = H2SO4",
"SO4 +H2O = H2SO4"
]
},
{
"n": 49,
"stem": "The removal of 2 hydrogen atoms from an alcohol yields",
"opts": [
"an acetide.",
"a aldehyde.",
"a polyene.",
"a ketoacetone."
]
},
{
"n": 50,
"stem": "Amphoteric substance is the one which",
"opts": [
"acts both as an acid and as a base.",
"exists in two distinct crystalline forms.",
"acts as only acid.",
"acts as only base."
]
},
{
"n": 51,
"stem": "The correct formula for vinegar is",
"opts": [
"CH3COOH.",
"C6H8O7.",
"NaHCO3.",
"HCOOH."
]
},
{
"n": 52,
"stem": "Compound that is easily absorbed through walls of stomach is",
"opts": [
"sugar.",
"protein.",
"fat.",
"alcohol."
]
},
{
"n": 53,
"stem": "2 molar NaCl solution can be prepared by adding",
"opts": [
"1 moles of NaCl into 2 liters of solvent.",
"5 moles of NaCl into 2.5 liters of solvent.",
"2.5 moles of NaCl into 1 liter of solvent.",
"1 moles of NaCl into 2.5 liter of solvent."
]
},
{
"n": 54,
"stem": "All the following are uses of baking soda EXCEPT:",
"opts": [
"Natural toothpaste",
"Deodorant",
"Pain reliever",
"Insecticide"
]
},
{
"n": 55,
"stem": "Nickel is used as catalyst in",
"opts": [
"saponification.",
"hydrogenation of oil.",
"dehydrogenation.",
"oxidation of alcohol."
]
},
{
"n": 56,
"stem": "The electrical current (I) flowing in a circuit is proportional to the voltage (V) and inversely proportional to the resistance (R). It is called",
"opts": [
"Coulomb’s law",
"Faraday’s law",
"Law of conservation of charge",
"Ohm’s Law"
]
},
{
"n": 57,
"stem": "Choose the correct effect of resistance of a conductor:",
"opts": [
"Inversely proportional to the length of conductor.",
"Directly proportional to the cross section of the conductor.",
"Inversely proportional to the temperature.",
"Directly proportional to the density of electrons in the conductor."
]
},
{
"n": 58,
"stem": "The unit of an electric current is",
"opts": [
"coulomb",
"watt",
"electron volt",
"ampere"
]
},
{
"n": 59,
"stem": "All of the following are properties of concave lens EXCEPT:",
"opts": [
"One surface that curves inwards",
"Converges parallel rays to a focal point",
"Have negative focal lengths",
"Correct short-sightedness"
]
},
{
"n": 60,
"stem": "Rutherford’s scattering experiment is related to the size of",
"opts": [
"nucleus",
"atom",
"electron",
"neutron"
]
},
{
"n": 61,
"stem": "The electromagnetic radiation with maximum wavelength is",
"opts": [
"ultraviolet rays",
"radio waves",
"x-rays",
"infra-red rays"
]
},
{
"n": 62,
"stem": "The acceleration of a system is directly proportional to and in the same direction as the net external force acting on the system, and inversely proportional to its mass. It is the law of",
"opts": [
"Newton’s First Law",
"Newton’s Second Law",
"Newton’s Third Law",
"Newton's law of universal gravitation"
]
},
{
"n": 63,
"stem": "A 10 kg mass and 5 kg mass are moving with equal kinetic energies. The ratio of the magnitudes of their linear momentum is",
"opts": [
"1:2",
"1:1",
"4:1",
"2:1"
]
},
{
"n": 64,
"stem": "Mercury is no more recommended to be used in sphygmomanometer because",
"opts": [
"it is toxic to the human body.",
"it is not easily available.",
"it is difficult to handle.",
"it provides incorrect blood pressure reading."
]
},
{
"n": 65,
"stem": "The best example of converting potential energy into electrical energy is",
"opts": [
"moving dynamo.",
"moving of turbine by water.",
"solar panel.",
"wind mill."
]
},
{
"n": 66,
"stem": "The type of pulleys used by the crane to lift the construction material is",
"opts": [
"fixed pulley.",
"movable pulley.",
"compound pulley.",
"combination of all."
]
},
{
"n": 67,
"stem": "Bhutan Power Corporation encourages using LED bulb for lighting the home because",
"opts": [
"it is energy efficient compared to other bulbs.",
"it does not emit polluting radiation which is prevents health hazard.",
"it does not emit UV rays.",
"it does not produce heat in the room."
]
},
{
"n": 68,
"stem": "Rainbow is formed by",
"opts": [
"reflection, refraction and dispersions of sunlight by water droplets.",
"reflection of sunlight by water droplets.",
"refraction of sunlight by water droplets.",
"dispersions of sunlight by water droplets."
]
},
{
"n": 69,
"stem": "Two bulbs, one of 50W and other of 25W, are connected in series to a supply of 200v. What is the ratio of the current flowing through them?",
"opts": [
"0.5",
"0.15",
"2.0",
"1.0"
]
},
{
"n": 70,
"stem": "Which one has more resistance: a 100-watt bulb or a 60-watt bulb?",
"opts": [
"100-watt bulb has more resistance.",
"60-watt bulb has more resistance.",
"Both have the same resistance.",
"There is no difference in resistance."
]
}
]"""

KEY = {
    3: ("c", "Vitamin C is water-soluble; vitamins A, D and E are fat-soluble."),
    4: ("b", "Copper (as ceruloplasmin) is needed to oxidise iron so it can be transported and used to make haemoglobin."),
    5: ("d", "Dermatophytosis (ringworm/ tinea) is a fungal infection of skin, hair and nails."),
    8: ("c", "Chloroplasts carry out photosynthesis - they are the 'food factories' of plant cells."),
    9: ("a", "The purine bases are adenine and guanine."),
    13: ("d", "Wuchereria bancrofti is a filarial worm of the lymphatics and blood; the others are intestinal worms."),
    15: ("d", "Flu spreads more in winter because dry air helps the virus survive and people crowd together indoors."),
    16: ("a", "Normal urine averages about pH 6.0, with a range of about 4.5-8.0."),
    17: ("d", "A molecule is the smallest unit of a compound that can exist independently and keep its properties."),
    18: ("b", "Vitamin K is needed by the liver to make clotting factors II, VII, IX and X."),
    20: ("d", "Bones protect organs, give shape and support the body; cushioning (shock absorption) is a role of cartilage and fat, not bone."),
    22: ("d", "The penguin is a bird and is warm-blooded; frogs, turtles and crocodiles are cold-blooded."),
    24: ("c", "Oxytocin contracts the uterus during labour and after delivery, reducing bleeding."),
    26: ("c", "Canines are pointed teeth used for tearing food."),
    27: ("d", "In adults the liver does not produce blood cells (it does so only in the fetus); it detoxifies, excretes bilirubin and makes proteins."),
    32: ("d", "Sesamoid bones (e.g. patella, bones in the hands and feet) lie within tendons; there are none in the upper arm."),
    33: ("d", "Blackwater fever is a complication of falciparum malaria with massive haemolysis and dark urine."),
    35: ("d", "A catalyst is not consumed as a reactant; it speeds up the reaction and remains unchanged."),
    36: ("a", "Lead in paints is a neurotoxin that harms children's behaviour and intelligence."),
    38: ("c", "Phuentsholing is at low altitude where air pressure is higher, so water boils at a higher temperature and food cooks faster."),
    39: ("b", "Boyle's law: at constant temperature pressure is inversely proportional to volume, so when lung volume increases the pressure decreases."),
    40: ("d", "Dry ice is solid CO2, whose molecules are held together by weak van der Waals forces."),
    41: ("b", "Molality is the number of moles of solute per kilogram of solvent."),
    42: ("d", "Fluorine is not used as an insecticide; chlorine bleaches, iodine is an antiseptic and bromine compounds are flame retardants."),
    43: ("c", "Iron is strongly attracted by a magnet (ferromagnetic, paramagnetic above its Curie point); copper, lead and brass are diamagnetic."),
    44: ("b", "Catalytic dehydrogenation (e.g. over hot copper) of a primary alcohol gives an aldehyde."),
    45: ("b", "Glass is made mainly of silica (silicon dioxide), with sodium and calcium oxides."),
    46: ("a", "Paper is made mainly of cellulose fibres."),
    48: ("c", "Sulphur trioxide reacts with water to form sulphuric acid: SO3 + H2O → H2SO4."),
    49: ("b", "Removing two hydrogen atoms (oxidation) from a primary alcohol gives an aldehyde."),
    50: ("a", "An amphoteric substance can react as both an acid and a base (e.g. water, aluminium oxide)."),
    51: ("a", "Vinegar is a dilute solution of acetic (ethanoic) acid, CH3COOH."),
    52: ("d", "Alcohol is absorbed directly through the stomach wall; sugar, protein and fat are mainly absorbed in the small intestine."),
    53: ("b", "5 moles in 2.5 litres gives 5/2.5 = 2 mol per litre."),
    55: ("b", "Finely divided nickel catalyses the hydrogenation of vegetable oils to make vanaspati ghee."),
    56: ("d", "This is Ohm's law: I = V/R."),
    59: ("b", "A concave lens diverges parallel rays; it does not bring them to a real focal point."),
    60: ("a", "Rutherford's alpha-particle scattering experiment showed a tiny, dense, positively charged nucleus."),
    61: ("b", "Radio waves have the longest wavelength of those listed."),
    62: ("b", "This is Newton's second law: F = ma."),
    64: ("a", "Mercury is toxic to people and the environment, so mercury sphygmomanometers are being replaced."),
    65: ("b", "Water stored at a height has potential energy; it turns the turbine of a hydropower generator to make electricity."),
    68: ("a", "A rainbow forms by refraction, dispersion and internal reflection of sunlight in water droplets."),
    69: ("d", "In a series circuit the same current flows through both bulbs, so the ratio is 1."),
    70: ("b", "R = V²/P: at the same voltage, the lower-power 60 W bulb has the higher resistance."),
}

NEW_MCQ = [
    ("The plant cell wall is described as freely permeable because it", ["allows water and dissolved substances to pass through", "allows only water to pass", "blocks all substances", "is made of lipids"], "a",
     "The cellulose cell wall is fully permeable; the selectively (semi-) permeable layer is the plasma membrane inside it."),
    ("Japanese encephalitis is transmitted to humans by", ["Culex mosquitoes", "Anopheles mosquitoes", "sandflies", "ticks only"], "a",
     "Japanese encephalitis virus is spread by Culex mosquitoes; pigs and wading birds are its reservoirs."),
    ("During which phase of mitosis do the sister chromatids separate and move to opposite poles?", ["Prophase", "Metaphase", "Anaphase", "Telophase"], "c",
     "In anaphase the centromeres split and the spindle pulls the chromatids to opposite poles."),
    ("The feature that best distinguishes a eukaryotic cell from a prokaryotic cell is", ["a membrane-bound nucleus", "a cell membrane", "ribosomes", "cytoplasm"], "a",
     "Eukaryotic cells have a true nucleus and membrane-bound organelles; all cells have a cell membrane, ribosomes and cytoplasm."),
    ("Which gas, produced by vehicle exhaust and faulty stoves, combines with haemoglobin and prevents it from carrying oxygen?", ["Carbon monoxide", "Nitrogen", "Oxygen", "Helium"], "a",
     "Carbon monoxide binds haemoglobin about 200 times more strongly than oxygen, forming carboxyhaemoglobin."),
    ("Typhoid fever is caused by", ["Salmonella Typhi", "Vibrio cholerae", "Plasmodium vivax", "the hepatitis A virus"], "a",
     "Typhoid (enteric fever) is caused by Salmonella enterica serovar Typhi, spread through contaminated food and water."),
    ("Hair cells that convert sound vibrations into nerve impulses are located in the", ["organ of Corti in the cochlea", "semicircular canals", "eardrum", "Eustachian tube"], "a",
     "The organ of Corti in the cochlea contains the hair cells for hearing."),
    ("Milk is pasteurised mainly to", ["kill disease-causing micro-organisms", "add vitamins", "increase its fat content", "make it sweeter"], "a",
     "Pasteurisation heats milk (e.g. 72 °C for 15 seconds) to kill pathogens such as those causing tuberculosis and brucellosis, without boiling it."),
    ("Most oxygen is carried in the blood", ["dissolved in plasma", "combined with haemoglobin", "as bicarbonate", "combined with white blood cells"], "b",
     "About 97-98% of oxygen is carried bound to haemoglobin as oxyhaemoglobin; only about 2% is dissolved in plasma."),
    ("Adding common salt to water", ["raises its freezing point", "lowers its boiling point", "lowers its freezing point", "has no effect on its freezing point"], "c",
     "Dissolved salt lowers the freezing point of water (and raises its boiling point) - a colligative property."),
    ("Denatured (methylated) spirit is ethanol made unfit to drink by adding", ["methanol", "sugar", "water", "glucose"], "a",
     "Methanol (and other substances) is added to ethanol to make it poisonous, so it is not sold for drinking."),
    ("Baking soda is used as an antacid because it", ["is acidic", "neutralises excess stomach acid", "kills bacteria in the stomach", "increases acid secretion"], "b",
     "Sodium hydrogen carbonate is a mild base that neutralises excess hydrochloric acid in the stomach."),
    ("The resistance of a wire is", ["directly proportional to its length", "directly proportional to its area of cross-section", "independent of its material", "independent of its length"], "a",
     "R = ρL/A: resistance increases with length, decreases with cross-sectional area and depends on the material."),
    ("The momentum of a body of mass 5 kg moving at 4 m/s is", ["1.25 kg m/s", "9 kg m/s", "20 kg m/s", "40 kg m/s"], "c",
     "Momentum p = mv = 5 × 4 = 20 kg m/s."),
]

SAQ = [
 dict(marks=3, stem="What were the causes of the dengue outbreak in Phuentsholing that lasted for almost 3 months? (3 marks)",
      kp=[("Vector breeding: many Aedes breeding sites - water stored in containers, tanks, tyres, flower pots, blocked drains and construction sites, worsened by monsoon rain, warm humid climate", 1),
          ("Human factors: dense population and urbanisation, cross-border movement with the Indian border towns where dengue is endemic, poor waste management, low community awareness/ late reporting, daytime biting not prevented", 1),
          ("Control gaps: delayed detection and vector control, inadequate fogging/ source reduction, no vaccine, multiple serotypes allowing repeated outbreaks", 1)],
      model="The outbreak was driven by conditions that favoured the Aedes mosquito and spread of the virus: (1) the warm, humid climate and heavy monsoon rain of the southern foothills created many breeding sites in clean water collected in containers, water tanks, old tyres, flower pots, blocked drains and construction sites; (2) Phuentsholing is a crowded border town with rapid urbanisation, poor solid-waste management and constant movement of people to and from Jaigaon and other Indian towns where dengue is endemic, which repeatedly introduced the virus; (3) low community awareness, failure to protect against daytime biting and late reporting of fever cases; and (4) delays and gaps in vector control - source reduction, larval control and fogging - and the absence of a vaccine allowed transmission to continue for months."),
 dict(marks=3, stem="List down the dengue preventive measures you would advise the people. (3 marks)",
      kp=[("Remove breeding sites: empty, cover or clean water containers weekly; dispose of tyres, cans, coconut shells; clean drains; 'search and destroy' larvae", 1),
          ("Personal protection: wear long sleeves, use repellents, use bed nets/ window screens, especially in the daytime (Aedes bites in the day), protect patients from mosquitoes", 1),
          ("Community action: clean-up campaigns, cooperate with fogging/ larvicide, seek early care for fever (avoid aspirin/ ibuprofen, use paracetamol), report cases", 1)],
      model="Advice to the public: (1) Destroy mosquito breeding places - empty, scrub and cover water storage containers at least once a week; change water in flower vases and pet bowls; dispose of old tyres, cans, bottles and coconut shells; keep drains and gutters clear. (2) Protect yourself from bites, especially in the daytime when Aedes mosquitoes bite - wear long-sleeved clothes, use mosquito repellents, use bed nets for daytime sleep (especially children and patients) and fit screens on windows. (3) Take part in community clean-up campaigns and cooperate with health workers during larval surveys and fogging. (4) See a health worker early for any fever; use paracetamol, avoid aspirin and ibuprofen, drink plenty of fluids and return quickly if warning signs (bleeding, severe abdominal pain, vomiting) appear."),
 dict(marks=3, stem="Bhutan has the highest number of Multi-drug Resistant Tuberculosis (MDR-TB) cases in South-East Asia with a detection gap of 63%. How would you help the Ministry of Health to reduce this detection gap? (3 marks)",
      kp=[("Active case finding: screen high-risk groups (contacts of TB patients, people with HIV/ diabetes, prisoners, monasteries, migrant/ border populations), community and school screening, symptom screening at all OPDs", 1),
          ("Better diagnostics: GeneXpert (rapid molecular test detecting rifampicin resistance) available at district level with sample transport, universal drug-susceptibility testing for all TB patients, culture/ LPA", 1),
          ("Awareness and system support: health education to seek early care for cough >2 weeks, train health workers, follow up defaulters, strong recording/ reporting and surveillance, private and traditional sector involvement", 1)],
      model="To close the detection gap I would: (1) increase active case finding - screen all household contacts of TB patients and high-risk groups such as people with HIV or diabetes, prisoners, monks and nuns in monastic institutions, and migrant and border populations, and screen every patient with a cough of more than two weeks at all health facilities; (2) improve diagnosis - make rapid molecular tests (GeneXpert), which detect TB and rifampicin resistance within two hours, available at all district hospitals with a sample transport system from BHUs, and test every diagnosed TB patient for drug resistance (universal drug-susceptibility testing, culture and line-probe assays at the national laboratory); and (3) strengthen awareness and systems - educate communities to seek care early, train health workers, trace defaulters, involve traditional medicine units and private pharmacies in referral, and maintain good recording, reporting and surveillance so missed cases are found."),
 dict(marks=3, stem="Explain the working principle of the X-ray tube and image formation. (3 marks)",
      kp=[("X-ray tube: evacuated glass tube with a heated tungsten filament cathode (thermionic emission of electrons) and a tungsten target anode; high voltage (kV) accelerates electrons", 1),
          ("Production: electrons hit the target and decelerate → X-rays (bremsstrahlung and characteristic radiation); about 99% energy becomes heat, so rotating anode, cooling oil and lead housing; mA controls quantity, kV quality", 1),
          ("Image: X-rays pass through the body and are absorbed differently (bone absorbs most - white; air least - black; soft tissue grey); transmitted rays expose film/ digital detector forming a shadow (radiograph)", 1)],
      model="An X-ray tube is an evacuated glass tube containing a cathode and an anode. The cathode is a tungsten filament that is heated by a current so that it emits electrons (thermionic emission); the current (mA) controls how many electrons, and so the quantity of X-rays. A very high voltage (kilovolts) between cathode and anode accelerates the electrons towards a tungsten target on the anode; when these fast electrons strike the target and are suddenly slowed, part of their energy is emitted as X-rays (braking radiation and characteristic radiation), while about 99% becomes heat, removed by a rotating anode and cooling oil; the tube is enclosed in a lead-lined housing with a window. Image formation: the X-ray beam passes through the patient, and different tissues absorb it to different degrees - bone (calcium) absorbs most and appears white, soft tissues appear grey and air in the lungs absorbs least and appears black; the rays that pass through fall on a film or digital detector to form a shadow picture (radiograph)."),
 dict(marks=3, stem="What is acid-base balance? (3 marks)",
      kp=[("Definition: maintenance of the hydrogen ion concentration of body fluids within a narrow range - blood pH 7.35-7.45; below = acidosis, above = alkalosis", 1),
          ("Buffers (immediate): bicarbonate-carbonic acid, phosphate and protein (haemoglobin) buffers; lungs (minutes): change breathing to blow off or retain CO2", 1),
          ("Kidneys (hours-days): excrete H+ and reabsorb/ generate bicarbonate; disorders: respiratory and metabolic acidosis/ alkalosis (e.g. diabetic ketoacidosis, vomiting)", 1)],
      model="Acid-base balance is the regulation of the hydrogen ion (H+) concentration of body fluids so that the pH of arterial blood stays within the narrow normal range of 7.35 to 7.45; a lower pH is acidosis and a higher pH is alkalosis, both of which disturb enzymes and organ function. It is maintained by three systems: (1) chemical buffers, acting within seconds - mainly the bicarbonate-carbonic acid buffer, and phosphate and protein (haemoglobin) buffers; (2) the lungs, acting within minutes - faster, deeper breathing removes more CO2 (an acid) and slower breathing retains it; and (3) the kidneys, acting over hours to days - they excrete H+ in urine and reabsorb and generate bicarbonate. Failure produces respiratory or metabolic acidosis or alkalosis, for example diabetic ketoacidosis or severe vomiting."),
 dict(marks=3, real=False, stem="What is hearing loss? Differentiate conductive and sensorineural hearing loss with two causes of each, and give two ways to prevent noise-induced hearing loss. (3 marks)",
      kp=[("Hearing loss: partial or total inability to hear; conductive - sound cannot pass through the outer/ middle ear (causes: wax, otitis media, perforated eardrum, otosclerosis, foreign body)", 1),
          ("Sensorineural - damage to the cochlea (hair cells) or auditory nerve (causes: ageing/ presbycusis, loud noise, ototoxic drugs e.g. aminoglycosides, meningitis, measles/ mumps, congenital)", 1),
          ("Prevention of noise-induced loss: avoid or limit exposure to loud noise, use ear plugs/ muffs at work, keep earphone volume low and take breaks, regular hearing checks for exposed workers", 1)],
      model="Hearing loss is a partial or total inability to hear in one or both ears. Conductive hearing loss occurs when sound cannot pass properly through the outer or middle ear to the inner ear; causes include impacted ear wax or a foreign body, middle-ear infection with fluid (otitis media), a perforated eardrum and fixation of the stapes (otosclerosis); it is often treatable. Sensorineural hearing loss is due to damage to the hair cells of the cochlea or the auditory nerve; causes include ageing (presbycusis), long exposure to loud noise, ototoxic drugs such as aminoglycosides, infections such as meningitis, measles and mumps, and congenital causes; it is usually permanent and may need hearing aids or cochlear implants. Noise-induced hearing loss can be prevented by avoiding or limiting exposure to loud noise, wearing ear plugs or ear muffs in noisy workplaces, keeping earphone volume low and taking breaks, and regular hearing checks for exposed workers."),
 dict(marks=3, stem="Describe the menstrual cycle of the human female. (3 marks)",
      kp=[("Definition: about 28-day cycle of changes in ovary and uterus from menarche to menopause, controlled by FSH, LH (pituitary), estrogen and progesterone (ovary)", 1),
          ("Phases: menstrual (days 1-5, shedding of endometrium); follicular/ proliferative (days 6-13, FSH → follicle grows, estrogen thickens endometrium); ovulation (day 14, LH surge releases ovum)", 1),
          ("Luteal/ secretory (days 15-28): corpus luteum secretes progesterone, endometrium prepared for implantation; if no fertilisation corpus luteum degenerates, hormones fall and menstruation follows; if pregnancy, hCG maintains corpus luteum", 1)],
      model="The menstrual cycle is a series of changes in the ovaries and uterus that repeats about every 28 days from puberty (menarche) to menopause, controlled by FSH and LH from the anterior pituitary and estrogen and progesterone from the ovary. (1) Menstrual phase (days 1-5): the thickened uterine lining is shed with blood as menstrual flow because progesterone has fallen. (2) Follicular (proliferative) phase (days 6-13): FSH makes a follicle grow into a Graafian follicle, which secretes estrogen; estrogen rebuilds and thickens the endometrium. (3) Ovulation (about day 14): a surge of LH causes the Graafian follicle to rupture and release the ovum. (4) Luteal (secretory) phase (days 15-28): the empty follicle becomes the corpus luteum, which secretes progesterone (and estrogen) that make the endometrium thick, glandular and ready for implantation. If the ovum is not fertilised, the corpus luteum degenerates, progesterone and estrogen fall and menstruation begins again; if fertilisation occurs, hCG from the embryo maintains the corpus luteum and menstruation stops."),
 dict(marks=3, stem="Recent surveillance of hospital-acquired infections (HAIs) at JDWNRH found that surgical site infections are the highest (32%), followed by clinical sepsis (24%) and ventilator-associated pneumonia (12%). What could be the causes of the high rate of HAIs at JDWNRH, and what would you initiate to reduce the incidence of HAIs? (3 marks)",
      kp=[("Causes: poor hand hygiene, lapses in aseptic/ sterile technique in surgery and procedures, inadequate sterilisation of instruments, overcrowding and shortage of staff/ isolation rooms, prolonged use of catheters/ ventilators/ IV lines, inappropriate antibiotic use and resistant organisms, poor environmental cleaning/ waste management", 1.5),
          ("Interventions: strengthen the infection control committee and IPC focal persons, hand hygiene campaigns and audits, surgical safety checklist and pre-operative antibiotic prophylaxis, proper sterilisation, care bundles for ventilators (head elevation, oral care) and lines/ catheters, isolation, antibiotic stewardship, surveillance with feedback, staff training", 1.5)],
      model="Possible causes: poor hand hygiene among staff and attendants; lapses in aseptic technique during surgery, dressing and invasive procedures; inadequate cleaning and sterilisation of instruments and theatres; overcrowded wards, shortage of nurses and few isolation rooms; long use of urinary catheters, central lines and ventilators without proper care bundles; inappropriate or excessive antibiotic use leading to resistant organisms; and weak environmental cleaning and waste management. To reduce HAIs I would: strengthen the hospital infection prevention and control committee with focal persons in every ward; run hand-hygiene campaigns with alcohol rub at every bed and regular audits; use the WHO surgical safety checklist, correct skin preparation and timely antibiotic prophylaxis; ensure proper sterilisation and theatre discipline; introduce care bundles for ventilator-associated pneumonia (head-of-bed elevation, oral care, daily sedation review) and for catheters and IV lines; isolate infected patients; start an antibiotic stewardship programme; continue surveillance with feedback of infection rates to staff; and train all staff regularly."),
 dict(marks=3, stem="Describe osmotic pressure and its applications. (3 marks)",
      kp=[("Osmosis: movement of solvent (water) through a semipermeable membrane from dilute to concentrated solution; osmotic pressure is the pressure needed to stop this flow; π = CRT (colligative, depends on number of particles)", 1),
          ("Body applications: water balance between blood and tissues (plasma proteins/ oncotic pressure), isotonic IV fluids (0.9% NaCl, 5% dextrose) so red cells do not burst or shrink, kidney reabsorption, ORS", 1),
          ("Other applications: water uptake by plant roots and turgidity, preservation of food with salt/ sugar, reverse osmosis water purification, determining molar mass, dialysis", 1)],
      model="Osmosis is the movement of solvent (water) molecules through a semipermeable membrane from a dilute solution (or pure water) into a more concentrated solution. Osmotic pressure is the pressure that must be applied to the concentrated side to just stop this flow; for dilute solutions π = CRT (C = molar concentration, R = gas constant, T = temperature), so it depends on the number of dissolved particles (a colligative property). Applications: (1) in the body, the osmotic (oncotic) pressure of plasma proteins keeps water in the blood vessels, and a fall (e.g. low albumin) causes oedema; (2) intravenous fluids must be isotonic (0.9% saline, 5% dextrose), because hypotonic fluids make red cells swell and burst and hypertonic ones make them shrink; (3) kidney concentration of urine and oral rehydration solution depend on osmosis; (4) plants absorb water by osmosis and stay turgid; (5) salting and sugaring preserve food by drawing water out of microbes; (6) reverse osmosis purifies water; and (7) dialysis and determination of molar masses of large molecules use osmotic principles."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
