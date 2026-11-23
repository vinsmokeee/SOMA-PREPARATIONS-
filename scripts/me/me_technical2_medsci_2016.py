"""ME Technical Paper II (General Subject Knowledge), MEDICAL SCIENCE group ('Medical Group'), BCSE 2016 (written 1 October 2016)
- real paper, PDF sent by the founder. Same layout as the latest (BCSE 2025) paper: Part I 70 MCQ x 1; Part II 10 short
answers x 3 - so no marks were changed (Part II Q2 and Q3 are split into parts that add to 3).
Pictures (cropped from the paper): MCQ 48 series circuit; Part II Q4 heart, Q5 enzyme graphs, Q8 teeth, Q9 eye.
Repeats (recorded as appearances, not loaded again): MCQ 2 (BCSE 2023), 4 (2023), 33 (2023), 43 (2022), 52 (2023), and
27, 35, 44, 67 (BCSE 2018).
Left out (more than one defensible answer, opinion or unverifiable): MCQ 8, 10, 12, 15 (31 pairs or 62 nerves), 16, 17 (precursor misnamed), 18, 20,
24, 26 (stem says O positive is the universal donor), 30, 31, 32, 37, 39, 63. Twenty-five new MCQs keep Part I at 70.
Fixed: MCQ 48 options printed in Ω for a kΩ circuit; MCQ 58 'heaviest' read as 'densest'; MCQ 64 'Vitamin AS' typo.
Part II repeats (recorded as appearances, replaced by new questions of the same kind): Q2 ALD (BCSE 2024), Q6 infection
control (2023), Q7 ear diagram (2022).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Medical Science): BCSE 2016, batch 1"
GROUP_TAG = "medsci2016"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "medical-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2016 Main Examination, Technical Paper II, Medical Science", "year": 2016, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Medical Science: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "All the Following are examples of edible roots EXCEPT",
"opts": [
"Carrot",
"Radish",
"Potato",
"Turnip"
]
},
{
"n": 2,
"stem": "Non citrus fruit among the following is",
"opts": [
"Tangerine",
"Lemon",
"Orange",
"Plum"
]
},
{
"n": 3,
"stem": "A dried grape (raisin) placed in a container of water swells due to",
"opts": [
"Osmosis",
"Endosmosis",
"Exosmosis",
"Ultra filtration"
]
},
{
"n": 4,
"stem": "The correct formula for the process of photosynthesis is",
"opts": [
"6CO2 + 6H2O + light energy = C6H12O6 + 6O2.",
"CO2 + H2O + light energy = C6 H12O6 + O2.",
"CO2 + 6H2O + light energy = 6 C6H12 O6 + O2.",
"6CO2 + H2O + light energy = 6 C6H12 O6 + 6O2."
]
},
{
"n": 5,
"stem": "All the following cause zoonotic diseases EXCEPT",
"opts": [
"Anthrax",
"Brucella",
"Rabies virus",
"Vibrio cholerae"
]
},
{
"n": 6,
"stem": "Choose the INCORRECT difference between bacteria and viruses:",
"opts": [
"Bacteria have cell wall but viruses do not have cell wall.",
"Viruses are smaller than bacteria.",
"Bacteria are visible under light microscope but viruses are not visible.",
"DNA is enclosed inside nucleus in bacteria and in a coat of protein in viruses."
]
},
{
"n": 7,
"stem": "Which structure is not part of an animal cell?",
"opts": [
"Centrosome",
"Ribosome",
"Golgi bodies",
"Cellulose"
]
},
{
"n": 8,
"stem": "Ciliated epithelium is seen in",
"opts": [
"Trachea",
"Intestine wall",
"Stomach wall",
"Nasal chamber"
]
},
{
"n": 9,
"stem": "A child with Down syndrome has",
"opts": [
"44 chromosomes",
"45 chromosomes",
"46 chromosomes",
"47 chromosomes"
]
},
{
"n": 10,
"stem": "Choose the INCORRECT description of window period for HIV in the body:",
"opts": [
"Person can be infected with HIV during the window period.",
"HIV remains very infectious in window period.",
"Window period lasts for four weeks.",
"Serum test for HIV sometimes show weak positive during window period."
]
},
{
"n": 11,
"stem": "March 24th is observed as",
"opts": [
"World’s TB Day",
"World’s AIDs Day",
"International Diabetic Day",
"World’s Cancer Day"
]
},
{
"n": 12,
"stem": "The International Agency for Research on Cancer concluded that, chewing betel nut (Doma) is carcinogenic (cancerous) to humans. Choose the point which has not been reported by the Researchers:",
"opts": [
"Betel nut containing three main chemicals arecoline, arecaidine and guvacine has vasoconstricting properties that affect almost all the organs.",
"The betel leaf is usually seen available very dirty forming a main source of helicobacter pylori infection ultimately leading to stomach cancer.",
"Lime or calcium carbonate paste used in mixture erodes epithelial layer of the esophagus, stomach and intestine leading to cancer.",
"Chewing Doma has been reported to be more carcinogenic than tobacco which needs to be banned in Bhutan."
]
},
{
"n": 13,
"stem": "Select the INCORRECT matching of the anatomical structure with respective organ system of human body:",
"opts": [
"Circle of Willis ………… Part of circulatory System",
"Bowman capsule………....Part of Excretory System",
"Patella……………………Part of Skeletal System",
"Stape……………………..Part of Muscular System"
]
},
{
"n": 14,
"stem": "Which of the following hormones is important for general metabolic activities of the body?",
"opts": [
"Triodothyronin",
"Insulin",
"Aldosterone",
"Antidiuretic hormones"
]
},
{
"n": 15,
"stem": "Total number of spinal nerves in Human is",
"opts": [
"31",
"62",
"124",
"61"
]
},
{
"n": 16,
"stem": "The target organ for oxytocin is",
"opts": [
"Liver",
"Kidney",
"Uterine muscles",
"Mammary glands"
]
},
{
"n": 17,
"stem": "Vitamin D is synthesized in the skin by the action of sun light on",
"opts": [
"Cholesterol",
"7-hydroxy cholesterol",
"Cephalin cholesterol",
"All the above"
]
},
{
"n": 18,
"stem": "Thiamine (B1) deficiency results in",
"opts": [
"Wernicke’s syndrome",
"Korsakkoff’s syndrome",
"Osteonecrosis",
"Tunnel vision"
]
},
{
"n": 19,
"stem": "The lobe of the brain that has function for vision is",
"opts": [
"Temporal",
"Frontal",
"Parietal",
"Occipital"
]
},
{
"n": 20,
"stem": "The incidence rate of stomach cancer has been reported to be highest in Bhutan among Asian Countries. All the following are the factors that cause stomach cancer in Bhutan EXCEPT",
"opts": [
"chewing doma",
"eating Junk foods",
"eating dried products (Shakam, Sikam & Churkam)",
"heavy intake of alcohol"
]
},
{
"n": 21,
"stem": "Which of the following statement is true for lymph?",
"opts": [
"Transport oxygen to the brain",
"Transport CO2 to the lungs",
"Return RBCs to the lymph nodes",
"Return interstitial fluids to the blood"
]
},
{
"n": 22,
"stem": "The role of pacemaker in heart is to",
"opts": [
"accelerate blood circulation",
"inhibit backflow of the blood",
"initiate heart beat",
"stimulate blood pressure"
]
},
{
"n": 23,
"stem": "During an earthquake, scared residents start to rush down the stairs to escape out of the high rise building. Which hormone initiates this action?",
"opts": [
"Adrenaline",
"Glucagon",
"Gastrin",
"Thyroxin"
]
},
{
"n": 24,
"stem": "Choose the INCORRECT description about colour blindness:",
"opts": [
"Colour blindness is usually inherited and is present at birth.",
"It is caused due to absence of one or more of the three cone cells responsible for sensing red, green, or blue light.",
"Colour blindness cannot see three basic colors.",
"It can be corrected by taking vitamin A or by surgical intervention."
]
},
{
"n": 25,
"stem": "How do sympathetic neural signals effect the working of the heart?",
"opts": [
"Reduce both heart rate and cardiac output.",
"Heart rate is increased without affecting the cardiac output.",
"Both heart rate and cardiac output increases.",
"Heart rate increases but cardiac output decreases."
]
},
{
"n": 26,
"stem": "Person with blood group O Positive is considered universal donor because",
"opts": [
"both A & B antigen present on RBCs but no antibodies in the plasma.",
"both A and B antibodies in the plasma.",
"no antigen on the RBCs and no antibodies in the plasma.",
"both A and B antigens are absent on RBCs but has only antibodies."
]
},
{
"n": 27,
"stem": "Function of molar and premolar teeth is",
"opts": [
"Grinding",
"Cutting",
"Tearing",
"All the above"
]
},
{
"n": 28,
"stem": "Which one of the following descriptions is INCORRECT about retina?",
"opts": [
"Retina is the light absorbing portion of the visual photo pigments.",
"Retina has photo pigment called rhodopsin.",
"Retina is derivatives of vitamin E.",
"Cones have photo receptors for colour vision."
]
},
{
"n": 29,
"stem": "Choose the correct order and number of vertebrae in human vertebral column:",
"opts": [
"C5-Th10 -L5 -S5 -Ca4",
"C4-Th11 -L5 -S5 -Ca4",
"C7-Th12 -L5 -S5 -Ca4",
"C10 -Th12 -L3 -S4 -Ca3"
]
},
{
"n": 30,
"stem": "Ministry of Health (MoH) in collaboration with National Housing Development Corporation (NHDC) and with financial support from the World Health Organization (WHO) launched the open-air gyms not only in Thimphu but also in other district towns. Choose the most suitable purpose of this initiative by the MoH:",
"opts": [
"To promote a healthy lifestyle of the people living in the cities.",
"To address rising non-communicable diseases (NCDs) in the country.",
"To minimized abuses with drugs, alcohol and smoking through healthy activities.",
"To minimize the gang fights and vandalism in the cities."
]
},
{
"n": 31,
"stem": "Use of traditional healing method by making incision of the skin is believed to provide a psychological relieve when blood clot is formed on exposing blood to the air. A blood clot formed is believed as removal of disease from the body. However, the practice needs to be discouraged since there is risk of infection and septicemia which is being often reported in the hospitals. Choose the correct measures to be taken to discourage this practice:",
"opts": [
"Convince the people on false believe and educate them on risk of infection when cuts are made on the skin.",
"Legalize the practice but educate the people on infection control management.",
"Penalize the practioners with fine when he/she is found practicing.",
"No intervention required since the practice dates back to our ancestors period."
]
},
{
"n": 32,
"stem": "Illegal drug trafficking has been increased in Bhutan that threatens the health and happiness of the Bhutanese society. Choose the most appropriate measures that you think will be able to reduce the drug usage:",
"opts": [
"Strengthen the existing screening system at the airport.",
"Change the existing Laws of the country for drug usage.",
"Include lessons in the school curriculum on effect of drugs on health and well being of the society.",
"Introduce a system of providing regular classes on Affect of Drugs and care of children for the parents by the schools."
]
},
{
"n": 33,
"stem": "Total number of bones in human body is",
"opts": [
"206",
"207",
"205",
"204"
]
},
{
"n": 34,
"stem": "Myxedema is a disease caused due to insufficient production of",
"opts": [
"TSH only",
"T3 & T4",
"T3 only",
"All the above three"
]
},
{
"n": 35,
"stem": "The ions involved in Acid - Base balance of the body is",
"opts": [
"H+ only",
"HCO3- only",
"Both H + & HCO3d. PO4 only"
]
},
{
"n": 36,
"stem": "Which of the following is not a hereditary disease?",
"opts": [
"Cretinism",
"Thalassemia",
"Hemophilia",
"Cystic fibrosis"
]
},
{
"n": 37,
"stem": "Choose the INCORRECT functions of blood circulation system in the human body:",
"opts": [
"Venous blood is returned to the right atrium through superior and inferior venacava.",
"Pulmonary vein caries oxygenated blood from the lungs to the left atrium.",
"Pulmonary artery returns deoxygenated blood from the body to the lungs.",
"Left auricle receives deoxygenated blood from the lungs."
]
},
{
"n": 38,
"stem": "In Radio diagnosis, CT Scanning uses",
"opts": [
"Ultrasound Waves",
"Gamma Rays",
"X-Rays",
"Infrared rays"
]
},
{
"n": 39,
"stem": "Choose the best benefit of the morning walk in terms of health promotion:",
"opts": [
"It freshens up our mind and prevents mental deterioration.",
"It is a good physical exercise that prevents NCDs.",
"It provides sound sleep and improves appetite.",
"It reduces the mental stress."
]
},
{
"n": 40,
"stem": "Choose the INCORRECT description of the electric fuse:",
"opts": [
"It is designed to melt for breaking a circuit in the event of excessive current.",
"It protects the wiring and the equipments.",
"It operates on the principle of heating effect of electric current.",
"Lead wire is commonly used to make fuse."
]
},
{
"n": 41,
"stem": "Tube light is more efficient than tungsten bulb for domestic use because",
"opts": [
"tube light doesn’t produce heat like bulb and consumes less current than tungsten bulb",
"tube light does not require tungsten filament whereas tungsten bulb requires it.",
"tube light produce light brighter than tungsten lamp.",
"tube light is cheaper than tungsten bulb."
]
},
{
"n": 42,
"stem": "The purpose of hanging a metallic chain to the ground from a truck carrying highly inflammable material is",
"opts": [
"to prevent spark due to the charge developed on the body of the truck due to high speed.",
"to convey excess heat from the engine of the truck",
"to reduce the noise of the truck coming into the cabin.",
"None of the above"
]
},
{
"n": 43,
"stem": "The unit of electrostatic charge is",
"opts": [
"Coulomb",
"Watt",
"Electron volt",
"Farad"
]
},
{
"n": 44,
"stem": "At a constant temperature, current flowing through a conductor of uniform area of crosssection is proportional to the difference of potential across its material. This is the statement of:",
"opts": [
"Joule’ Law",
"Coulomb’s Law",
"Ohm’s Law",
"None of the above"
]
},
{
"n": 45,
"stem": "All the following factors affect the electrical resistance of conductor EXCEPT",
"opts": [
"Length of conductor.",
"Area of cross section.",
"Temperature.",
"Strength of current."
]
},
{
"n": 46,
"stem": "Battery arrangement in torch is an example of",
"opts": [
"cells connected in series.",
"cells connected in parallel.",
"resistance in series.",
"resistance in parallel."
]
},
{
"n": 47,
"stem": "The unit of current capacity of car battery is measured in",
"opts": [
"Ampere hour",
"Ohm",
"Electron volt",
"Farad"
]
},
{
"n": 48,
"stem": "In the series circuit shown (9 V battery with R₁ = 3 kΩ, R₂ = 10 kΩ and R₃ = 5 kΩ), the total resistance is",
"opts": [
"2.2 kΩ",
"18 kΩ",
"2 kΩ",
"10 kΩ"
],
"image": "/papers/me/tech2-medsci-2016-series.png"
},
{
"n": 49,
"stem": "During a car accident with head on collision, the passenger in the front seat and driver usually breaks the windshield and injures the head. The reason for this forward movement when a car stops abruptly will be better explained by",
"opts": [
"Newton’s First Law of Motion",
"Newton’s second Law of motion",
"Newton’s Third Law of motion.",
"All of the above."
]
},
{
"n": 50,
"stem": "The kerosene floats on the water due to",
"opts": [
"difference in mass.",
"difference in specific gravity.",
"difference in volume.",
"difference in chemical composition."
]
},
{
"n": 51,
"stem": "Smell of the burning incense in a room slowly disappears due to",
"opts": [
"Diffusion",
"Brownian motion",
"Osmosis",
"Gravitational force"
]
},
{
"n": 52,
"stem": "The electromagnetic radiation with shortest wavelength is",
"opts": [
"Ultraviolet rays",
"X-Rays",
"Radio waves",
"Infrared"
]
},
{
"n": 53,
"stem": "ALTO 800 Car has the engine displacement of 796 cc. Choose the correct definition of the Engine displacement of a car:",
"opts": [
"It is a swept volume of the pistons inside a car engine in a single movement that reflects the power of engine expressed in cc or cm3 .",
"It is the measurement unit of the fuel consumption rate of a car expressed in cc or cm3.",
"It is the measurement unit for the amount of energy produced by engine expressed in cc or cm3.",
"None of the above."
]
},
{
"n": 54,
"stem": "It is difficult to hit the head of a fish in a pond by using catapult when aimed from the side of a pond because of",
"opts": [
"fastness of the movement of a fish.",
"change in position due to refraction of light in denser medium.",
"reflection of the light that makes fish invisible.",
"resistance of the water to the force of moving stone."
]
},
{
"n": 55,
"stem": "Molality of the solution is defined as",
"opts": [
"the number of moles of a substance per liter of solution.",
"the number of moles of solute per kg of solvent.",
"number of grams of substance per liter of solution.",
"number of grams of solute per kilogram of solvent."
]
},
{
"n": 56,
"stem": "Diamond is considered the most precious substance. Choose the incorrect description of its properties:",
"opts": [
"It is the hardest substance in the earth existence.",
"It is highly transparent with high lustre which glitters in the light.",
"It is non malleable, non ductile and stable to Chemical and heat up to 875oC.",
"It is one of the heavy metals that poorly conduct electricity."
]
},
{
"n": 57,
"stem": "The carbon rode in the middle of the torch battery is",
"opts": [
"Positive electrode",
"Negative electrode",
"Conducting medium",
"None of the above"
]
},
{
"n": 58,
"stem": "The densest (heaviest for its size) metal among the following is",
"opts": [
"Osmium",
"Mercury",
"Gold",
"Silver"
]
},
{
"n": 59,
"stem": "Which of the following is good conductor of heat and electricity?",
"opts": [
"Diamond",
"Graphite",
"Charcoal",
"Anthracine"
]
},
{
"n": 60,
"stem": "All the following describes characteristics of catalyst EXCEPT",
"opts": [
"Remain unchanged after reaction both in quantity and composition.",
"Requires only small quantity to affect large quantities of reactants.",
"Catalyst accelerates both reverse & forward reaction.",
"Catalyst is capable of starting a reaction."
]
},
{
"n": 61,
"stem": "10 moles of solute is dissolved in 5 litres of sodium chloride solution. What is its molarity?",
"opts": [
"5 molar",
"2 molar",
"2.5 Molar",
"12.5 Molar"
]
},
{
"n": 62,
"stem": "Bleaching powder containing calcium hypochloride (Ca (ClO)2) is commonly employed as disinfectant for the biological wastes generated from the hospitals and BHUs in Bhutan. The disinfecting action of this powder is due to",
"opts": [
"Calcium",
"Oxygen",
"Chlorine",
"All the above."
]
},
{
"n": 63,
"stem": "A noble gas used in the beacon light to convey the message of emergency patients inside ambulance is",
"opts": [
"Helium",
"Neon",
"Argon",
"Xenon"
]
},
{
"n": 64,
"stem": "Which of the following vitamins is involved in blood clotting?",
"opts": [
"Vitamin A",
"Vitamin B complex",
"Vitamin D",
"Vitamin K"
]
},
{
"n": 65,
"stem": "Gypsum mining, started in the 1980s in Pema Gatshel, has been an important source of revenue for the country. Gypsum is calcium sulphate dihydrate (CaSO₄·2H₂O). It is used to produce the following industrial products EXCEPT",
"opts": [
"Cement",
"Fertilizer",
"Tiles",
"Linen"
]
},
{
"n": 66,
"stem": "According to the report from the Royal Society of Chemistry, mercury in thermometers has been replaced by ionic liquids (IL). The primary reason for this change is because",
"opts": [
"mercury is poisonous.",
"IL response faster than mercury to the temperature.",
"IL is non toxic.",
"IL can operate over a wider range of temperature."
]
},
{
"n": 67,
"stem": "What is the main composition of tooth paste that kills the bacteria to prevent decaying the teeth?",
"opts": [
"Bromine",
"Chlorine",
"Iodine",
"Fluorine"
]
},
{
"n": 68,
"stem": "Which of the following is the least important source of energy for the body?",
"opts": [
"Glucose",
"Glycogen",
"Ribose",
"Galactose"
]
},
{
"n": 69,
"stem": "All of the following can store glycogen, EXCEPT",
"opts": [
"Nervous",
"Skeletal muscle",
"Liver",
"Cardiac muscle"
]
},
{
"n": 70,
"stem": "Pepper called ‘thingye’ is a popular spice eaten by Bhutanese in different form of dishes to make them spicy. The spiciness of the pepper is due to a chemical called",
"opts": [
"Piperine",
"Formic acid",
"Abscisic Acid",
"Capsaicin"
]
}
]"""

KEY = {
 1: ("c", "The potato is a stem tuber (it has 'eyes', which are buds); carrot, radish and turnip are swollen roots."),
 3: ("b", "Water moves into the raisin by osmosis; movement of water into a cell or tissue is called endosmosis (out of it, exosmosis)."),
 5: ("d", "Vibrio cholerae spreads between people through contaminated water; anthrax, brucellosis and rabies pass from animals to humans (zoonoses)."),
 6: ("d", "Bacteria are prokaryotes with no true nucleus - their DNA lies free in the cytoplasm (nucleoid); viruses have nucleic acid inside a protein coat."),
 7: ("d", "Cellulose forms plant cell walls; animal cells have no cell wall. Centrosomes, ribosomes and Golgi bodies are found in animal cells."),
 9: ("d", "Down syndrome (trisomy 21) gives 47 chromosomes instead of 46."),
 11: ("a", "24 March is World TB Day; World AIDS Day is 1 December, World Diabetes Day 14 November and World Cancer Day 4 February."),
 13: ("d", "The stapes is an ear ossicle - a bone (skeletal system), not a muscle. The circle of Willis (arteries), Bowman's capsule and patella are correctly matched."),
 14: ("a", "Thyroid hormones (T3, triiodothyronine, and T4) set the basal metabolic rate of the whole body."),
 19: ("d", "The occipital lobe contains the visual cortex."),
 21: ("d", "Lymph returns excess tissue (interstitial) fluid and proteins to the blood through the lymphatic vessels."),
 22: ("c", "The sinoatrial (SA) node, the natural pacemaker, initiates each heartbeat."),
 23: ("a", "Adrenaline triggers the fight-or-flight response - faster heart rate and breathing, more blood to the muscles."),
 25: ("c", "Sympathetic stimulation increases both heart rate and force of contraction, so cardiac output increases."),
 28: ("c", "Retinal (the light-sensitive part of rhodopsin) is derived from vitamin A, not vitamin E."),
 29: ("c", "The vertebral column has 7 cervical, 12 thoracic, 5 lumbar, 5 sacral (fused) and 4 coccygeal (fused) vertebrae."),
 34: ("b", "Myxoedema is caused by deficient thyroid hormones (T3 and T4) in adults."),
 36: ("a", "Cretinism is usually due to congenital hypothyroidism from iodine deficiency in pregnancy; thalassaemia, haemophilia and cystic fibrosis are inherited genetic disorders."),
 38: ("c", "CT (computed tomography) scanning uses X-rays taken from many angles."),
 40: ("d", "Fuse wire is not pure lead; it is usually an alloy of tin and lead (or tinned copper) with a low melting point. The other statements are correct."),
 41: ("a", "A tube light converts more of its energy to light and less to heat, so it uses less current for the same brightness."),
 42: ("a", "The metal chain conducts static charge built up on the tanker's body to the earth, preventing sparks that could ignite the fuel."),
 45: ("d", "Resistance depends on length, cross-sectional area, material and temperature - not on the current flowing."),
 46: ("a", "Cells in a torch are placed end to end - in series - so their voltages add."),
 47: ("a", "Battery capacity is given in ampere-hours (Ah)."),
 48: ("b", "In series R = 3 + 10 + 5 = 18 kΩ (the paper printed the options without the k)."),
 49: ("a", "By inertia (Newton's first law) the occupants keep moving forward when the car suddenly stops."),
 50: ("b", "Kerosene has a lower specific gravity (density) than water, so it floats."),
 51: ("a", "The incense molecules spread out through the air by diffusion until the smell is too dilute to notice."),
 53: ("a", "Engine displacement is the total volume swept by all the pistons in one stroke, a measure of engine size, given in cc."),
 54: ("b", "Light bends at the water surface, so the fish appears higher (closer) than it really is - refraction."),
 55: ("b", "Molality = moles of solute per kilogram of solvent."),
 56: ("d", "Diamond is a form of carbon (a non-metal), not a heavy metal; it is a poor conductor of electricity."),
 57: ("a", "In a dry (Leclanché) cell the central carbon rod is the positive electrode; the zinc case is negative."),
 58: ("a", "Osmium is the densest naturally occurring element (about 22.6 g/cm³), denser than gold, mercury and silver."),
 59: ("b", "Graphite has delocalised electrons and conducts electricity and heat; diamond does not conduct electricity."),
 60: ("d", "A catalyst cannot start a reaction that is not feasible; it only speeds up a reaction that would occur anyway."),
 61: ("b", "Molarity = moles/litres = 10/5 = 2 M."),
 62: ("c", "Bleaching powder releases available chlorine (as hypochlorous acid), which kills microorganisms."),
 64: ("d", "Vitamin K is needed to make clotting factors (prothrombin)."),
 65: ("d", "Gypsum is used in cement (to control setting), as a fertiliser/soil conditioner and in tiles and plaster boards; linen is a fabric made from flax."),
 66: ("a", "Mercury is a toxic heavy metal; a broken thermometer releases poisonous vapour, so it is being replaced."),
 68: ("c", "Ribose is a structural sugar of RNA and ATP, not a fuel; glucose, glycogen and galactose are energy sources."),
 69: ("a", "Glycogen is stored mainly in the liver and skeletal muscle (and some in cardiac muscle); nerve tissue stores very little."),
 70: ("d", "Capsaicin makes chillies hot; piperine is the pungent compound of black pepper."),
}

NEW_MCQ = [
    ("The smallest bone in the human body is the:", ["Stapes", "Incus", "Malleus", "Patella"], "a", "The stapes (stirrup) in the middle ear, about 3 mm long, is the smallest bone."),
    ("The normal blood pressure of a healthy adult is about:", ["90/60 mmHg", "120/80 mmHg", "140/90 mmHg", "160/100 mmHg"], "b", "About 120/80 mmHg (systolic/diastolic); 140/90 or above is high blood pressure."),
    ("Which instrument is used to measure blood pressure?", ["Stethoscope", "Sphygmomanometer", "Thermometer", "Spirometer"], "b", "A sphygmomanometer (cuff and gauge) measures blood pressure."),
    ("A person with which blood group is called the universal recipient?", ["O negative", "A positive", "B negative", "AB positive"], "d", "AB positive blood has no anti-A, anti-B or anti-D antibodies, so it can receive red cells of any group."),
    ("The average lifespan of a human red blood cell is about:", ["20 days", "60 days", "120 days", "365 days"], "c", "Red cells circulate for about 120 days before being removed by the spleen and liver."),
    ("The element present at the centre of each haem group of haemoglobin is:", ["Magnesium", "Iron", "Copper", "Zinc"], "b", "Each haem contains an iron (Fe²⁺) atom that binds oxygen; magnesium is at the centre of chlorophyll."),
    ("Penicillin, the first widely used antibiotic, was discovered by:", ["Louis Pasteur", "Alexander Fleming", "Robert Koch", "Edward Jenner"], "b", "Alexander Fleming discovered penicillin from the mould Penicillium in 1928."),
    ("Tetanus is caused by:", ["Clostridium tetani", "Clostridium botulinum", "Corynebacterium diphtheriae", "Bordetella pertussis"], "a", "Clostridium tetani spores enter through wounds and release a toxin that causes muscle spasms; it is prevented by tetanus toxoid vaccine."),
    ("Poliomyelitis is caused by a:", ["Bacterium", "Virus", "Fungus", "Protozoan"], "b", "Polio is caused by the poliovirus and is prevented by oral and injectable polio vaccines."),
    ("Pellagra is caused by deficiency of:", ["Thiamine (vitamin B1)", "Niacin (vitamin B3)", "Vitamin C", "Vitamin D"], "b", "Niacin deficiency causes pellagra - dermatitis, diarrhoea and dementia."),
    ("Beriberi is caused by deficiency of:", ["Vitamin A", "Vitamin B1 (thiamine)", "Vitamin B12", "Vitamin K"], "b", "Thiamine deficiency causes beriberi, affecting nerves and the heart; it is linked with diets of polished rice."),
    ("Hydrochloric acid in the stomach is secreted by the:", ["Chief cells", "Parietal (oxyntic) cells", "Goblet cells", "Islet cells"], "b", "Parietal cells secrete HCl and intrinsic factor; chief cells secrete pepsinogen."),
    ("The normal resting respiratory rate of a healthy adult is about:", ["6-8 breaths per minute", "12-20 breaths per minute", "30-40 breaths per minute", "50-60 breaths per minute"], "b", "A healthy adult at rest breathes about 12-20 times a minute."),
    ("Avogadro's number is approximately:", ["6.022 × 10²³", "3 × 10⁸", "1.6 × 10⁻¹⁹", "9.8"], "a", "One mole contains 6.022 × 10²³ particles."),
    ("A solution with a pH of 3 is:", ["Strongly basic", "Neutral", "Acidic", "Weakly basic"], "c", "pH below 7 is acidic; the lower the pH, the more acidic."),
    ("The chemical formula of Plaster of Paris is:", ["CaSO₄·2H₂O", "CaSO₄·½H₂O", "CaCO₃", "Ca(OH)₂"], "b", "Plaster of Paris is calcium sulphate hemihydrate, made by heating gypsum (CaSO₄·2H₂O); used for casts and moulds."),
    ("The SI unit of work and energy is the:", ["Watt", "Newton", "Joule", "Pascal"], "c", "Work and energy are measured in joules (1 J = 1 N × 1 m)."),
    ("The speed of light in a vacuum is about:", ["3 × 10⁵ m/s", "3 × 10⁸ m/s", "3 × 10¹⁰ m/s", "340 m/s"], "b", "Light travels at about 3 × 10⁸ m/s; 340 m/s is the speed of sound in air."),
    ("One kilowatt-hour (kWh) of electrical energy is equal to:", ["3600 J", "1000 J", "3.6 × 10⁶ J", "3.6 × 10⁵ J"], "c", "1 kWh = 1000 W × 3600 s = 3.6 × 10⁶ J."),
    ("Sound cannot travel through:", ["Water", "Steel", "Air", "A vacuum"], "d", "Sound needs a medium; there are no particles to vibrate in a vacuum."),
    ("The ozone layer in the stratosphere protects living things from:", ["Infrared radiation", "Ultraviolet radiation", "Radio waves", "Visible light"], "b", "Ozone absorbs most of the sun's harmful ultraviolet (UV-B and UV-C) radiation."),
    ("Which gland is called the 'master gland' of the endocrine system?", ["Thyroid", "Adrenal", "Pituitary", "Pancreas"], "c", "The pituitary releases hormones that control many other endocrine glands."),
    ("The exchange of gases between blood and tissues takes place through the:", ["Arteries", "Veins", "Capillaries", "Aorta"], "c", "Capillary walls are one cell thick, allowing oxygen, carbon dioxide and nutrients to diffuse."),
    ("The longest part of the human digestive tract is the:", ["Oesophagus", "Stomach", "Small intestine", "Large intestine"], "c", "The small intestine is about 6-7 m long; it is where most digestion and absorption take place."),
    ("Which of the following is a water-soluble vitamin?", ["Vitamin A", "Vitamin C", "Vitamin D", "Vitamin E"], "b", "Vitamins B and C are water-soluble; A, D, E and K are fat-soluble."),
]

EAR = "/papers/me/tech2-medsci-2016-ear.png"
SAQ = [
 dict(marks=3, stem="Bhutan is known worldwide for using renewable natural resources to produce electricity. Name at least three renewable resources used in Bhutan and briefly explain the principle of each type of power plant. (3 marks)",
      kp=[("Hydropower (main source, e.g. Chukha, Tala, Punatsangchhu, Mangdechhu): potential energy of water stored/falling from a height turns a turbine coupled to a generator (electromagnetic induction)", 1),
          ("Solar power (e.g. Sephu solar plant, rooftop panels): photovoltaic cells convert sunlight directly into electricity (photoelectric effect)", 1),
          ("Wind power (e.g. Rubesa wind farm, Wangdue): moving air turns the blades of a wind turbine that drives a generator; (biogas/biomass also accepted)", 1)],
      model="1. Hydropower - Bhutan's main source (Chukha, Tala, Kurichhu, Dagachhu, Mangdechhu, Punatsangchhu). Water from a river is stored or diverted and falls through penstocks; its potential energy becomes kinetic energy that spins a turbine connected to a generator, where electromagnetic induction produces electricity.\n2. Solar power - photovoltaic (PV) panels on roofs and the solar plant at Sephu (Wangdue) convert sunlight directly into direct current electricity using semiconductor cells; an inverter converts it to AC.\n3. Wind power - wind turbines at Rubesa (Wangdue): moving air turns the blades, which drive a generator.\n(Biogas plants, in which animal dung is digested anaerobically to produce methane for cooking, are also used in rural Bhutan.)"),
 dict(real=False, marks=3, stem="How do vaccines protect the body against disease? Differentiate active and passive immunity with one example of each. (3 marks)",
      kp=[("A vaccine contains killed/weakened microbes, toxoids or their parts (antigens); it stimulates the immune system to make antibodies and memory cells without causing the disease", 1),
          ("On later exposure memory cells respond quickly and strongly, preventing illness; high coverage also gives herd immunity", 0.5),
          ("Active immunity: the body makes its own antibodies - long-lasting, slow to develop (natural infection, vaccination e.g. BCG, measles)", 0.75),
          ("Passive immunity: ready-made antibodies are received - immediate but short-lived (maternal antibodies via placenta/breast milk, antitetanus or anti-rabies serum/immunoglobulin)", 0.75)],
      model="A vaccine contains antigens - killed or weakened (attenuated) microorganisms, inactivated toxins (toxoids) or parts of the organism. When given, it stimulates the immune system to produce antibodies and memory B and T cells without causing the disease. If the person is later exposed to the real organism, the memory cells recognise it and produce a rapid, strong response that prevents illness. When most people are vaccinated, spread is interrupted (herd immunity).\nActive immunity: the person's own immune system makes antibodies after infection or vaccination. It takes time to develop but lasts long, often for life. Examples: immunity after measles infection; vaccination with BCG, measles-rubella or hepatitis B vaccine.\nPassive immunity: ready-made antibodies are given to the person. It acts immediately but lasts only weeks or months. Examples: maternal antibodies passing to the baby through the placenta and breast milk; injection of rabies immunoglobulin or anti-tetanus serum after exposure."),
 dict(marks=3, stem="In February 2016, the Prime Minister of Bhutan said in a speech abroad: \"This country isn't just carbon neutral, it is carbon negative.\"\na) Explain why Bhutan is not only carbon neutral but also carbon negative. (1.5 marks)\nb) Give a few examples to show that Bhutan contributes little to global warming and promotes its prevention. (1.5 marks)",
      kp=[("a) Bhutan's forests (over 70% cover) absorb more CO₂ (about 6-9 million tonnes a year) than the country emits (about 2-3 million tonnes), so net emissions are negative", 1),
          ("a) Its exports of clean hydropower to India replace coal-fired electricity, offsetting further emissions", 0.5),
          ("b) Examples (any three): constitutional minimum 60% forest cover; electricity almost entirely from hydropower; electric vehicles/taxis promotion; low-industry, high-value low-volume tourism; protected areas and biological corridors (about half the country); pledge at UNFCCC to remain carbon neutral", 1.5)],
      model="a) Carbon neutral means a country's emissions equal what it absorbs; carbon negative means it absorbs more than it emits. Bhutan's forests cover over 70% of the land and absorb several times more carbon dioxide than the country produces from transport, industry and households. In addition, Bhutan exports clean hydroelectricity to India, which replaces electricity from fossil fuels and avoids further emissions.\nb) Examples: the Constitution requires at least 60% forest cover forever; more than half the country is protected areas and biological corridors; almost all electricity comes from renewable hydropower; the government promotes electric vehicles and taxis; tourism follows a 'high value, low volume' policy; Bhutan has pledged internationally (UNFCCC, Paris Agreement) to remain carbon neutral."),
 dict(marks=3, image="/papers/me/tech2-medsci-2016-heart.png", stem="Copy the diagram of the heart and indicate with arrows the direction of the flow of blood in and out of the heart. Name the valves present in the human heart, with their location. (3 marks)",
      kp=[("Flow: venae cavae → right atrium → right ventricle → pulmonary artery → lungs → pulmonary veins → left atrium → left ventricle → aorta → body", 1.5),
          ("Atrioventricular valves: tricuspid (between right atrium and right ventricle) and bicuspid/mitral (between left atrium and left ventricle)", 0.75),
          ("Semilunar valves: pulmonary valve (at the opening of the pulmonary artery from the right ventricle) and aortic valve (at the opening of the aorta from the left ventricle)", 0.75)],
      model="Direction of flow (arrows on the diagram): deoxygenated blood enters the right atrium from the superior and inferior venae cavae → passes through the tricuspid valve into the right ventricle → is pumped through the pulmonary valve into the pulmonary artery to the lungs. Oxygenated blood returns through the four pulmonary veins into the left atrium → passes through the mitral (bicuspid) valve into the left ventricle → is pumped through the aortic valve into the aorta and to the whole body.\nValves:\n• Tricuspid valve - between the right atrium and right ventricle.\n• Mitral (bicuspid) valve - between the left atrium and left ventricle.\n• Pulmonary (semilunar) valve - at the exit of the right ventricle into the pulmonary artery.\n• Aortic (semilunar) valve - at the exit of the left ventricle into the aorta."),
 dict(marks=3, image="/papers/me/tech2-medsci-2016-enzyme.png", stem="Explain what you understand from the two graphs about the catalytic action of enzymes (energy profile with and without enzyme; initial velocity against substrate concentration). Explain Vmax and Km, and write some important characteristics of a catalyst. (3 marks)",
      kp=[("Graph 1: the enzyme lowers the activation energy (lower peak) so the reaction is faster; the overall energy released (reactants to products) is unchanged", 1),
          ("Graph 2: rate rises with substrate concentration then levels off; Vmax = maximum rate when all enzyme active sites are saturated; Km = substrate concentration at half Vmax (low Km = high affinity)", 1),
          ("Catalyst characteristics: unchanged at the end, needed in small amounts, does not change equilibrium or ΔH, speeds forward and reverse reactions equally, specific (enzymes) and affected by temperature/pH", 1)],
      model="Graph 1 (energy profile): with an enzyme the energy hill between reactants and products is lower - the enzyme lowers the activation energy by providing an alternative pathway, so more molecules can react and the reaction is faster. The overall energy released by the reaction (difference between reactants and products) is the same with or without the enzyme.\nGraph 2 (Michaelis-Menten curve): at low substrate concentration the initial velocity rises almost in proportion to the substrate; at high concentration it levels off because all active sites are occupied.\n• Vmax - the maximum rate reached when the enzyme is saturated with substrate.\n• Km (Michaelis constant) - the substrate concentration at which the rate is half of Vmax; a low Km means the enzyme has a high affinity for its substrate.\nCharacteristics of a catalyst: it is chemically unchanged at the end; a small amount is enough; it does not change the position of equilibrium or ΔH; it speeds up forward and reverse reactions equally; it cannot start a reaction that is not feasible; enzymes are highly specific and work best at an optimum temperature and pH."),
 dict(real=False, marks=3, stem="Hand hygiene is the most important measure to prevent hospital-acquired infections. State the WHO 'five moments for hand hygiene' and the correct method of hand rubbing. (3 marks)",
      kp=[("Five moments (1): before touching a patient; before a clean/aseptic procedure; after body-fluid exposure risk", 1.5),
          ("Five moments (2): after touching a patient; after touching patient surroundings", 0.5),
          ("Method: alcohol rub 20-30 s (or soap and water 40-60 s) covering palms, backs, between fingers, backs of fingers, thumbs, fingertips; remove jewellery, dry hands, use soap and water when visibly soiled", 1)],
      model="WHO five moments for hand hygiene:\n1. Before touching a patient.\n2. Before a clean or aseptic procedure (e.g. inserting a catheter, giving an injection).\n3. After a body-fluid exposure risk (blood, urine, secretions, removing gloves).\n4. After touching a patient.\n5. After touching the patient's surroundings (bed, equipment), even if the patient was not touched.\nMethod: use an alcohol-based hand rub for 20-30 seconds, or soap and running water for 40-60 seconds when hands are visibly dirty or after caring for patients with diarrhoea. Remove rings and watches; rub palm to palm, the back of each hand, between the fingers, the backs of the fingers, each thumb (rotational rubbing) and the fingertips in the palms; rinse and dry with a single-use towel, turning off the tap with the towel."),
 dict(real=False, marks=3, stem="Describe the structure of human skin and state its main functions. (3 marks)",
      kp=[("Structure: epidermis (outer stratified squamous, keratinised; stratum corneum and basal layer with melanocytes) and dermis (connective tissue with blood vessels, nerve endings, hair follicles, sweat and sebaceous glands); hypodermis with fat below", 1.5),
          ("Functions (any five): protection against microbes, injury and UV; temperature regulation (sweat, blood flow); sensation (touch, pain, heat); excretion of salts/urea in sweat; synthesis of vitamin D; storage of fat; prevents water loss", 1.5)],
      model="Structure: the skin is the largest organ of the body and has two main layers. The outer epidermis is stratified squamous epithelium; its surface layer (stratum corneum) is made of dead keratinised cells, and its deepest layer contains dividing cells and melanocytes that make melanin. Below it, the dermis is dense connective tissue containing blood vessels, nerve endings and receptors, hair follicles, sweat glands and sebaceous (oil) glands. Beneath the skin lies the subcutaneous layer (hypodermis) of fat.\nFunctions: protects the body against microorganisms, chemicals, injury and ultraviolet light; prevents water loss; regulates body temperature through sweating and changes in skin blood flow; contains receptors for touch, pain, pressure and temperature; excretes small amounts of salts and urea in sweat; makes vitamin D in sunlight; stores fat as an energy reserve and insulator."),
 dict(marks=3, image="/papers/me/tech2-medsci-2016-teeth.png", stem="Classify the teeth numbered 1-8 on the right of the diagram, and name the structural parts numbered 1-6 of the tooth on the left (list the names with their numbers; the diagram need not be drawn). (3 marks)",
      issues=["Tooth-section labels 3 (cementum) and 5 (nerves and blood vessels in the root canal) read from the scanned diagram - please confirm."],
      kp=[("Teeth: 1 central incisor, 2 lateral incisor, 3 canine, 4 first premolar", 1), ("5 second premolar, 6 first molar, 7 second molar, 8 third molar (wisdom tooth)", 1),
          ("Parts: 1 enamel, 2 dentine, 3 cementum, 4 jaw (alveolar) bone, 5 nerves and blood vessels in the root canal, 6 pulp (pulp cavity)", 1)],
      model="Classification of teeth (each quarter of the jaw): 1 - central incisor; 2 - lateral incisor; 3 - canine; 4 - first premolar; 5 - second premolar; 6 - first molar; 7 - second molar; 8 - third molar (wisdom tooth). An adult has 32 permanent teeth.\nParts of the tooth: 1 - enamel; 2 - dentine; 3 - cementum (covering the root); 4 - jaw (alveolar) bone; 5 - nerves and blood vessels in the root canal; 6 - pulp (pulp cavity). (The unnumbered line points to the gum, gingiva.)"),
 dict(marks=3, image="/papers/me/tech2-medsci-2016-eye.png", stem="Name the structural parts of the human eye numbered 1-13 in the diagram (list the names with their numbers; the diagram need not be drawn). (3 marks)",
      issues=["Several labels read from a small diagram (1 eyelid/conjunctiva, 2 retina, 4 choroid, 8 suspensory ligament, 13 ciliary body) - please confirm against the original."],
      kp=[("1 eyelid (conjunctiva); 2 retina; 3 sclera; 4 choroid", 1), ("5 fovea (yellow spot); 6 optic nerve; 7 blind spot; 8 suspensory ligament; 9 cornea", 1),
          ("10 lens; 11 aqueous humour; 12 iris; 13 ciliary body (muscle)", 1)],
      model="1 - Eyelid / conjunctiva\n2 - Retina\n3 - Sclera\n4 - Choroid\n5 - Fovea (yellow spot)\n6 - Optic nerve\n7 - Blind spot (optic disc)\n8 - Suspensory ligament\n9 - Cornea\n10 - Lens\n11 - Aqueous humour\n12 - Iris\n13 - Ciliary body (ciliary muscle)"),
 dict(marks=3, stem="A patient-satisfaction survey by the Hospital Administration and Management Transformation (HAMT) programme showed that most patients were not satisfied with: the behaviour of staff; the communication skills of staff; OPD waiting time; and the emergency response of staff. Explain some ways in which you would help the HAMT programme and the management to improve patient satisfaction. (3 marks)",
      kp=[("Staff behaviour and communication: training in customer care/soft skills and empathy, greeting and explaining in a language patients understand, respecting privacy, name badges, supervision and recognition of good behaviour", 1),
          ("Waiting time: token/queue and appointment system, triage, more counters at peak hours, clear signage/help desk, starting OPD on time, electronic records", 1),
          ("Emergency response: staffed 24-hour emergency team, protocols and drills, ready equipment and ambulance coordination; plus feedback/grievance box and regular surveys to monitor", 1)],
      model="Behaviour and communication of staff: run regular training in customer care, empathy and communication; greet patients, introduce ourselves, explain procedures and medicines in simple language (Dzongkha/local language), respect privacy and dignity; display name badges; supervise and recognise staff who serve patients well.\nOPD waiting time: introduce a token/queue and appointment system, triage patients so urgent cases are seen first, open more counters and assign more staff at peak hours, start OPD on time, use electronic records, and provide a help desk and clear signboards so patients do not get lost.\nEmergency response: keep a trained team on duty 24 hours, use triage and written protocols, hold regular drills, keep equipment, drugs and ambulances ready, and coordinate with the 112 ambulance service.\nMonitoring: set up suggestion/grievance boxes and a feedback hotline, repeat patient-satisfaction surveys and act on the results."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
