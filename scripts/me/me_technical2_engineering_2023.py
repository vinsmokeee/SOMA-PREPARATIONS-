"""ME Technical Paper II (General Subject Knowledge), ENGINEERING group, BCSE 2023 - real paper (PDF sent by the founder).
Same pattern as 2025: Part I 70 MCQ x 1 (Section A Mathematics 1-20, B Chemistry 21-40, C Physics 41-60, D General IT
61-70); Part II 10 short answers x 3. Mathematics was retyped from the page images (the PDF's equations do not convert).
Left out (no correct option, two defensible answers, or a missing figure): MCQ 19 (the true maximum, 92 at (4, 6), is not
offered), 29 (NCERT keys 'colour fades'; 'turns green' is equally defensible), 44 (needs the missing charge figure), 46
(a single convex lens is a simple microscope - not an option), 48 (secondary current is 8 A - not offered), 50 (options
are pictures of field lines that cannot be judged as text), 57 (a = g(sin30° − 0.26 cos30°) ≈ 2.7 m/s² - no option
matches). Seven new MCQs keep Part I at 70. MCQ 52 keeps the paper's graphs as a picture. Part II Q2: 'c-coordinate'
read as x-coordinate.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Engineering): BCSE 2023, batch 1"
GROUP_TAG = "eng2023"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "engineering"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2023 Main Examination, Technical Paper II, Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Engineering: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Let f: R → R be the function defined by f(x) = x³ + 5. Then f⁻¹(x) is",
"opts": [
"(x + 5)^(1/3)",
"(5 − x)^(1/3)",
"5 − x",
"(x − 5)^(1/3)"
]
},
{
"n": 2,
"stem": "The domain of the function defined by f(x) = sin⁻¹√(x − 1) is",
"opts": [
"[1, 2]",
"[−1, 1]",
"[0, 1]",
"None of these"
]
},
{
"n": 3,
"stem": "Find the positive integer n if lim (x→3) (xⁿ − 3ⁿ)/(x − 3) = 108.",
"opts": [
"3",
"4",
"−2",
"1"
]
},
{
"n": 4,
"stem": "Find the value of sec²(tan⁻¹ 2) + cosec²(cot⁻¹ 3).",
"opts": [
"12",
"5",
"15",
"9"
]
},
{
"n": 5,
"stem": "If tan⁻¹ 2x + tan⁻¹ 3x = π/4, then x is",
"opts": [
"1/6",
"1",
"(1/6, −1)",
"None of these"
]
},
{
"n": 6,
"stem": "If the matrix [x + y, 2x + z; x − y, 2z + w] (rows separated by ';') equals [4, 7; 0, 10], then the values of x, y, z and w respectively are",
"opts": [
"2, 2, 3, 4",
"2, 3, 1, 2",
"3, 3, 0, 1",
"None of these"
]
},
{
"n": 7,
"stem": "If A² − A + I = O, then the inverse of A is",
"opts": [
"I − A",
"A − I",
"A",
"A + I"
]
},
{
"n": 8,
"stem": "If the points (3, −2), (x, 2), (8, 8) are collinear, find the value of x.",
"opts": [
"2",
"5",
"4",
"3"
]
},
{
"n": 9,
"stem": "Using determinants, find the equation of the line joining the points (1, 2) and (3, 6).",
"opts": [
"x = 3y",
"y = x",
"y = 2x",
"4x − y = 5"
]
},
{
"n": 10,
"stem": "If xʸ · yˣ = 16, then the value of dy/dx at (2, 2) is",
"opts": [
"0",
"1",
"−1",
"None of these"
]
},
{
"n": 11,
"stem": "If y = (tan x)^(sin x), then dy/dx is equal to",
"opts": [
"sec x + cos x",
"sec x + log tan x",
"(tan x)^(sin x)",
"None of these"
]
},
{
"n": 12,
"stem": "It is given that at x = 1 the function x⁴ − 62x² + ax + 9 attains its maximum value on the interval [0, 2]. Find the value of a.",
"opts": [
"120",
"100",
"140",
"160"
]
},
{
"n": 13,
"stem": "The area of a right-angled triangle of given hypotenuse is maximum when the triangle is",
"opts": [
"Scalene",
"Isosceles",
"Equilateral",
"None of these"
]
},
{
"n": 14,
"stem": "The equation of the normal to the curve y = sin x at (0, 0) is",
"opts": [
"x = 0",
"y = 0",
"x + y = 0",
"x − y = 0"
]
},
{
"n": 15,
"stem": "Evaluate: ∫ tan(x − θ) tan(x + θ) tan 2x dx",
"opts": [
"(1/2) log|cos 2x| − log|cos(x − θ)| + log|cos(x + θ)| + c",
"−(1/2) log|cos 2x| + log|cos(x − θ)| + log|cos(x + θ)| + c",
"−(1/2) log|cos 2x| − log|cos(x − θ)| − log|cos(x + θ)| + c",
"None of these"
]
},
{
"n": 16,
"stem": "The solution of the differential equation (eʸ + 1) cos x dx + eʸ sin x dy = 0 is",
"opts": [
"(eʸ + 1) sin x = c",
"eˣ sin x = c",
"(eˣ + 1) cos x = c",
"None of these"
]
},
{
"n": 17,
"stem": "The vectors from the origin to the points A and B are a = 2i − 3j + 2k and b = 2i + 3j + k respectively. The area of triangle OAB is",
"opts": [
"340",
"√25",
"√229",
"(1/2)√229"
]
},
{
"n": 18,
"stem": "The area of the quadrilateral ABCD, where A(0, 4, 1), B(2, 3, −1), C(4, 5, 0) and D(2, 6, 2), is equal to",
"opts": [
"18 sq. units",
"27 sq. units",
"81 sq. units",
"9 sq. units"
]
},
{
"n": 19,
"stem": "Maximize Z = 11x + 8y, subject to x ≤ 4, y ≤ 6, x ≥ 0, y ≥ 0.",
"opts": [
"44 at (4, 2)",
"62 at (4, 0)",
"48 at (4, 2)",
"60 at (4, 2) !"
]
},
{
"n": 20,
"stem": "The probability of a man hitting a target is 1/4. How many times must he fire so that the probability of hitting the target at least once is greater than 2/3?",
"opts": [
"3",
"2",
"4",
"1"
]
},
{
"n": 21,
"stem": "Which one of the following is acidic?",
"opts": [
"Lemon juice",
"Tomatoes",
"Milk",
"All of the above"
]
},
{
"n": 22,
"stem": "The nature of calcium phosphate present in tooth enamel is",
"opts": [
"Basic",
"Amphoteric",
"Acidic",
"Neutral"
]
},
{
"n": 23,
"stem": "Which of the following does not form an acidic salt?",
"opts": [
"Phosphoric acid",
"Carbonic acid",
"Hydrochloric acid",
"Sulphuric acid"
]
},
{
"n": 24,
"stem": "Which one of the following will turn red litmus blue?",
"opts": [
"Vinegar",
"Baking soda solution",
"Lemon juice",
"Soft drinks"
]
},
{
"n": 25,
"stem": "Rusting of iron takes place in",
"opts": [
"ordinary water",
"distilled water",
"both ordinary and distilled water",
"none of the above"
]
},
{
"n": 26,
"stem": "Silver articles becomes black on prolonged exposure to air. This is due to the formation of",
"opts": [
"AgS",
"Ag2S",
"AgSO4",
"Ag2O and Ag2S"
]
},
{
"n": 27,
"stem": "An element reacts with oxygen to give a compound with a high melting point. The compound is soluble in water. The element is likely to be",
"opts": [
"calcium",
"carbon",
"iron",
"silicon"
]
},
{
"n": 28,
"stem": "In the decomposition of lead (II) nitrate to give lead (II) oxide, nitrogen dioxide and oxygen gas, the coefficient of nitrogen dioxide (in the balanced equation) is",
"opts": [
"1",
"2",
"3",
"4"
]
},
{
"n": 29,
"stem": "On immersing an iron nail in CuSO4 solution for few minutes, you will observe",
"opts": [
"the colour of solution fades away.",
"the surface of iron nails acquires a black coating.",
"the colour of solution changes to green.",
"no reaction takes place."
]
},
{
"n": 30,
"stem": "An element X on exposure to moist air turns reddish-brown and a new compound Y is formed. The substance X and Y are",
"opts": [
"X = Fe, Y = Fe2O3",
"X = Ag, Y = Ag2S",
"X = Cu, Y = CuO",
"X = Al, Y = Al2O3"
]
},
{
"n": 31,
"stem": "What is the molality of a solution formed when 58.5g of NaCl is dissolved in 2000mL water?",
"opts": [
"0.5000m",
"0.0005m",
"29.2500m",
"0.2925m"
]
},
{
"n": 32,
"stem": "What type of bond do the transition elements form with themselves?",
"opts": [
"Ionic bond",
"Metallic bond",
"Covalent bond",
"Coordinate bond"
]
},
{
"n": 33,
"stem": "The correct way of naming Co in [CoCl2(en)2]+ is",
"opts": [
"Cobaltate(II)",
"Cobalt(II)",
"Cobalt(III)",
"Cobaltate(III)"
]
},
{
"n": 34,
"stem": "Which of the following statement is INCORRECT?",
"opts": [
"Vitamins can be produced by plants",
"Vitamins contain amino groups",
"Vitamin deficiency causes diseases",
"Excess vitamin intake is harmful"
]
},
{
"n": 35,
"stem": "What is the correct name of the compound CH₃–CH(OH)–CH=CH₂?",
"opts": [
"But-1-en-3-ol",
"But-3-enol",
"But-2-en-3-ol",
"But-3-en-2-ol"
]
},
{
"n": 36,
"stem": "What characteristic of water accounts for its unique properties as a solvent?",
"opts": [
"Low viscosity",
"Cohesive",
"Polar",
"Flexible"
]
},
{
"n": 37,
"stem": "Which of the following has the highest density?",
"opts": [
"CH2Cl2",
"CHCl3",
"CH3Cl",
"CCl4"
]
},
{
"n": 38,
"stem": "What effect does temperature have on the half-life of a first-order reaction?",
"opts": [
"It increases",
"It decreases",
"It remains the same",
"Both increases as well as decrease"
]
},
{
"n": 39,
"stem": "Which solid structure has a definite and sharp melting point?",
"opts": [
"All types of solids",
"No type of solid",
"Amorphous solids",
"Crystalline solids"
]
},
{
"n": 40,
"stem": "In a fuel cell, which of the following can be utilized as a fuel?",
"opts": [
"Nitrogen",
"Argon",
"Hydrogen",
"Helium SECTION C: Physics"
]
},
{
"n": 41,
"stem": "Which of the following is the weakest force?",
"opts": [
"Gravitational force",
"Nuclear force",
"Electromagnetic force",
"None of these"
]
},
{
"n": 42,
"stem": "When we hold a book in our hand, we are balancing the gravitational force on the book due to",
"opts": [
"Normal force provided by our hand",
"Friction force provided by the book",
"Parallel force between the book and hand",
"None of these"
]
},
{
"n": 43,
"stem": "The fuse in electrical circuits has:",
"opts": [
"Low resistivity, high melting point",
"High resistivity, low melting point",
"Low resistivity, low melting point",
"High resistivity, high melting point"
]
},
{
"n": 44,
"stem": "The flux of the electrostatic field through the closed spherical surface is found to be four times that through the closed spherical surface S. Find the magnitude of the charge Q. The three charges are q1 = 1Uc, q2 = -4uC, q3 = 8.84uC.",
"opts": [
"5.84uC",
"31.32uC",
"17.52uC",
"38.52uC"
]
},
{
"n": 45,
"stem": "Which of the following physical quantity has S.I. unit J/C?",
"opts": [
"Electric flux",
"Dipole moment",
"Electric Potential",
"Electric field intensity"
]
},
{
"n": 46,
"stem": "An instrument that comprises of only a single convex lens is:",
"opts": [
"Refracting telescope",
"Compound telescope",
"Simple telescope",
"Reflecting telescope"
]
},
{
"n": 47,
"stem": "A forward-biased PN junction acts as a/an",
"opts": [
"Thyristor",
"Closed switch",
"Amplifier",
"Chopper"
]
},
{
"n": 48,
"stem": "A transformer has a primary coil with 1600 loops and a secondary coil with 1200 loops. If the current in the primary coil is 6 Ampere, then what is the current in the secondary coil of a transformer.",
"opts": [
"78 Ampere",
"98 Ampere",
"68 Ampere",
"58 Ampere"
]
},
{
"n": 49,
"stem": "The efficiency of a transformer is maximum when",
"opts": [
"Eddy current loss = iron loss",
"Hysteresis loss = copper loss.",
"Eddy current loss = hysteresis loss",
"Iron loss = Copper loss"
]
},
{
"n": 50,
"stem": "Point out the correct direction of magnetic field in the given figures.",
"opts": [
"",
"",
"",
""
]
},
{
"n": 51,
"stem": "A capacitor has some dielectric between its plates, and the capacitor is connected to a dc source. The battery is now disconnected and then the dielectric is removed, then",
"opts": [
"capacitance will increase.",
"energy stored will decrease.",
"electric field will increase.",
"voltage will decrease."
]
},
{
"n": 52,
"stem": "Which of the graphs (a)-(d) shown in the figure is correct for the V-I graph of a good (ohmic) conductor?",
"opts": [
"Graph (a): curve bending upwards away from the dashed straight line",
"Graph (b): curve rising slowly then steeply",
"Graph (c): straight line through the origin",
"Graph (d): curve rising steeply then levelling off"
],
"image": "/papers/me/tech2-eng-2023-m52.png"
},
{
"n": 53,
"stem": "As body falls, its potential energy & kinetic energy",
"opts": [
"decrease, increase",
"increase, increase",
"increase, decrease",
"decrease, decrease"
]
},
{
"n": 54,
"stem": "In an experiment to measure the internal resistance of a cell by a potentiometer, it is found that the balance point is at a length of 2 m when the cell is shunted by a 5Ω resistance and is at 3 m when the cell is shunted by a 10Ω resistance. The internal resistance of the cell is",
"opts": [
"10 Ω",
"15 Ω",
"1 Ω",
"1.5 Ω"
]
},
{
"n": 55,
"stem": "A block of wood is placed on a surface. A force is applied parallel to the surface to move the body. The frictional force developed acts",
"opts": [
"Normal to the surface upwards",
"Normal to the surface downwards",
"Along the direction of the applied force",
"Opposite to the direction of the applied force"
]
},
{
"n": 56,
"stem": "A bullet of mass 25g is moving with a velocity of 200cm/s is stopped within 5cm of the target. The average resistance offered by the target is",
"opts": [
"1 N",
"2 N",
"3 N",
"4 N"
]
},
{
"n": 57,
"stem": "A body is sliding down a rough inclined plane which makes an angle of 30 degree with the horizontal. If the coefficient of friction is 0.26, the acceleration in m/s2 is",
"opts": [
"1.95",
"2.78",
"3.47",
"4.6"
]
},
{
"n": 58,
"stem": "A body of mass 10 kg is moved parallel to the ground through a distance of 2 m. The work done against the gravitational force is",
"opts": [
"196J",
"-196J",
"20J",
"Zero"
]
},
{
"n": 59,
"stem": "A pump on the ground floor of a building can pump up water to fill a tank of volume 30m3 in 15 min. If the tank is 40 m above the ground, and the efficiency of the pump is 30%, how much electric power is consumed by the pump? (Take g=10 ms−2)",
"opts": [
"36.5 kW",
"44.4kW",
"52.5 kW",
"60.5 kW"
]
},
{
"n": 60,
"stem": "A student holds a 10kg stack of books 1.5m above the ground for 20s. How much power was used to hold the books during this time?",
"opts": [
"15W",
"0W",
"300W",
"7.35W SECTION D: General IT Knowledge"
]
},
{
"n": 61,
"stem": "Accuracy, purpose, relevance, validity and timeliness are the features of?",
"opts": [
"Data",
"Information",
"Knowledge",
"All of the above"
]
},
{
"n": 62,
"stem": "ChatGPT is a large language model-based chatbot developed by Open AI. What does “T” in ChatGPT stand for?",
"opts": [
"Translator",
"Transducer",
"Transformer",
"Technology"
]
},
{
"n": 63,
"stem": "The information that gets transformed in encryption is ____________",
"opts": [
"Plain text",
"Parallel text",
"Encrypted text",
"Decrypted text"
]
},
{
"n": 64,
"stem": "A technique in which a program attacks a network by exploiting IP broadcast addressing operations:",
"opts": [
"Smurfing",
"Denial of service",
"E-mail bombing",
"Ping storm"
]
},
{
"n": 65,
"stem": "A program that runs in the background on your computer, sending information about your browsing habits to the company that installed it on your computer is called as",
"opts": [
"Pop-ups",
"Adware",
"Grayware",
"Spyware"
]
},
{
"n": 66,
"stem": "Identify the different features of Big Data Analytics.",
"opts": [
"Open source",
"Scalability",
"Data Recovery",
"All of the above"
]
},
{
"n": 67,
"stem": "What are modern computers based on?",
"opts": [
"Microchip",
"Micro processor",
"I/O devices",
"Both (a) & (b)"
]
},
{
"n": 68,
"stem": "What technology is used to record cryptocurrency transactions?",
"opts": [
"Mining",
"Digital wallet",
"Blockchain technology",
"Token"
]
},
{
"n": 69,
"stem": "Which company bought the popular video teleconferencing software 'Skype'?",
"opts": [
"Google",
"Accenture",
"Oracle",
"Microsoft"
]
},
{
"n": 70,
"stem": "First web browser invented in 1990 is",
"opts": [
"WorldWideWeb",
"Internet Explorer",
"Mosaic",
"Nexus Part II Short Answer Questions [30 marks] Answer ALL 10 short answer questions. Each question carries 3 marks."
]
}
]"""

KEY = {
    1: ("d", "y = x³ + 5 → x = (y − 5)^(1/3), so f⁻¹(x) = (x − 5)^(1/3)."),
    2: ("a", "sin⁻¹ needs 0 ≤ √(x − 1) ≤ 1, i.e. 0 ≤ x − 1 ≤ 1, so x ∈ [1, 2]."),
    3: ("b", "The limit equals n·3ⁿ⁻¹; n·3ⁿ⁻¹ = 108 gives n = 4 (4 x 27 = 108)."),
    4: ("c", "sec²(tan⁻¹2) = 1 + 2² = 5; cosec²(cot⁻¹3) = 1 + 3² = 10; total 15."),
    5: ("a", "tan⁻¹2x + tan⁻¹3x = tan⁻¹[5x/(1 − 6x²)] = π/4 → 6x² + 5x − 1 = 0 → x = 1/6 or −1; x = −1 makes the sum negative (−3π/4), so x = 1/6."),
    6: ("a", "x + y = 4 and x − y = 0 give x = y = 2; 2x + z = 7 gives z = 3; 2z + w = 10 gives w = 4."),
    7: ("a", "A² − A + I = O → A(I − A) = I, so A⁻¹ = I − A."),
    8: ("b", "Slope from (3, −2) to (8, 8) is 2; from (3, −2) to (x, 2): 4/(x − 3) = 2 → x = 5."),
    9: ("c", "|x y 1; 1 2 1; 3 6 1| = 0 gives 2x − y = 0, i.e. y = 2x."),
    10: ("c", "y ln x + x ln y = ln 16 → y′ ln x + y/x + ln y + (x/y)y′ = 0; at (2, 2): y′(ln 2 + 1) + (1 + ln 2) = 0 → y′ = −1."),
    11: ("d", "dy/dx = (tan x)^(sin x)[cos x · log tan x + sec x] - none of the options."),
    12: ("a", "f′(x) = 4x³ − 124x + a = 0 at x = 1 → 4 − 124 + a = 0 → a = 120."),
    13: ("b", "With hypotenuse h and legs x, √(h² − x²), area is maximum when x² = h²/2: the legs are equal (isosceles)."),
    14: ("c", "Tangent slope cos 0 = 1, so the normal slope is −1: y = −x, i.e. x + y = 0."),
    15: ("b", "tan 2x = tan[(x + θ) + (x − θ)] gives tan(x − θ)tan(x + θ)tan 2x = tan 2x − tan(x + θ) − tan(x − θ); integrating: −½ log|cos 2x| + log|cos(x + θ)| + log|cos(x − θ)| + c."),
    16: ("a", "Separate: cot x dx + eʸ/(eʸ + 1) dy = 0 → log sin x + log(eʸ + 1) = log c → (eʸ + 1) sin x = c."),
    17: ("d", "a x b = (−9, 2, 12), |a x b| = √229; area of triangle OAB = ½√229."),
    18: ("d", "Area = ½|AC x BD|; AC = (4, 1, −1), BD = (0, 3, 3), AC x BD = (6, −12, 12), magnitude 18, area = 9 sq. units."),
    20: ("c", "1 − (3/4)ⁿ > 2/3 → (3/4)ⁿ < 1/3: n = 3 gives 0.42, n = 4 gives 0.32, so at least 4 shots."),
    21: ("d", "Lemon juice (citric acid), tomatoes (oxalic/ citric acid) and milk (lactic acid, pH ≈ 6.5) are all acidic."),
    22: ("a", "Tooth enamel is calcium phosphate (hydroxyapatite), a basic salt - acids from food dissolve it."),
    23: ("c", "HCl is monobasic, so it cannot form an acid salt; H₃PO₄, H₂CO₃ and H₂SO₄ do (NaH₂PO₄, NaHCO₃, NaHSO₄)."),
    24: ("b", "Baking soda (NaHCO₃) solution is basic and turns red litmus blue; the others are acidic."),
    25: ("a", "Rusting needs both water and dissolved oxygen; ordinary water contains dissolved air, boiled distilled water does not."),
    26: ("b", "Silver reacts with H₂S in air to form black silver sulphide, Ag₂S (tarnishing)."),
    27: ("a", "Calcium forms CaO, an ionic oxide with a high melting point that dissolves in water (forming Ca(OH)₂)."),
    28: ("d", "2Pb(NO₃)₂ → 2PbO + 4NO₂ + O₂."),
    30: ("a", "Iron rusts in moist air to reddish-brown hydrated iron(III) oxide, Fe₂O₃·xH₂O."),
    31: ("a", "58.5 g NaCl = 1 mol; 2000 mL water = 2 kg; molality = 1/2 = 0.5 m."),
    32: ("b", "Transition metals are held together by metallic bonding (delocalised d and s electrons)."),
    33: ("c", "x + 2(−1) + 2(0) = +1 → x = +3; in a complex cation the metal keeps its name: cobalt(III)."),
    34: ("b", "Vitamins do not, in general, contain amino groups (the 'amine' in the name is historical); the other statements are true."),
    35: ("d", "Longest chain with the double bond: C4; OH on C2 and C=C at C3: but-3-en-2-ol."),
    36: ("c", "Water is a polar molecule with hydrogen bonding, so it dissolves ionic and polar substances."),
    37: ("d", "Density rises with the number of heavy Cl atoms: CCl₄ ≈ 1.59 g/cm³ is the highest."),
    38: ("b", "Raising temperature increases the rate constant k, so t½ = 0.693/k decreases."),
    39: ("d", "Crystalline solids have long-range order and a sharp melting point; amorphous solids soften over a range."),
    40: ("c", "Hydrogen is the usual fuel (H₂-O₂ fuel cell); N₂, Ar and He are not fuels."),
    41: ("a", "Gravitation is by far the weakest of the fundamental forces."),
    42: ("a", "The upward normal (contact) force of the hand balances the book's weight."),
    43: ("b", "A fuse wire has high resistivity and a low melting point so it melts quickly on overcurrent."),
    45: ("c", "J/C = volt, the unit of electric potential."),
    47: ("b", "A forward-biased diode conducts with low resistance - it behaves like a closed switch."),
    49: ("d", "Transformer efficiency is maximum when the variable copper loss equals the constant iron (core) loss."),
    51: ("c", "With the battery disconnected Q stays constant; removing the dielectric lowers C, so V = Q/C rises and E = V/d increases (energy also rises)."),
    52: ("c", "A good (ohmic) conductor at constant temperature has V proportional to I: a straight line through the origin."),
    53: ("a", "Falling: height decreases, so potential energy decreases while kinetic energy increases."),
    54: ("a", "E·R/(R + r) ∝ balance length: [5/(5 + r)]/[10/(10 + r)] = 2/3 → r = 10 Ω."),
    55: ("d", "Kinetic friction opposes the relative motion, i.e. acts opposite to the applied force."),
    56: ("a", "v = 2 m/s, s = 0.05 m: a = v²/2s = 40 m/s²; F = 0.025 x 40 = 1 N."),
    58: ("d", "Gravity is vertical and the displacement horizontal, so the work done against gravity is zero."),
    59: ("b", "Useful power = mgh/t = (30 000 x 10 x 40)/900 = 13.3 kW; input = 13.3/0.30 = 44.4 kW."),
    60: ("b", "No displacement, so no work is done on the books: power = 0 W."),
    61: ("b", "Accuracy, relevance, validity, timeliness and purpose describe useful information (processed data)."),
    62: ("c", "GPT = Generative Pre-trained Transformer."),
    63: ("a", "Encryption converts plain text into cipher text."),
    64: ("a", "A smurf attack floods a network using ICMP requests sent to IP broadcast addresses with a spoofed source."),
    65: ("d", "Spyware secretly collects information such as browsing habits and sends it to a third party."),
    66: ("d", "Big data analytics tools are commonly open source, scalable and support data recovery."),
    67: ("d", "Modern computers are built on integrated circuits - microchips, with the microprocessor as the CPU."),
    68: ("c", "Cryptocurrency transactions are recorded on a blockchain (distributed ledger)."),
    69: ("d", "Microsoft bought Skype in 2011."),
    70: ("a", "Tim Berners-Lee's WorldWideWeb (later Nexus), written in 1990, was the first web browser."),
}

NEW_MCQ = [
    ("If A is a 3 x 3 matrix with |A| = 4, then |2A| is", ["8", "16", "32", "64"], "c", "|kA| = kⁿ|A| for an n x n matrix: 2³ x 4 = 32."),
    ("The value of ∫ from 0 to π/2 of sin²x dx is", ["π/2", "π/4", "1", "0"], "b", "sin²x = (1 − cos 2x)/2; the integral over [0, π/2] is π/4."),
    ("The number of moles of solute in 500 mL of a 0.2 M solution is", ["0.01", "0.1", "0.4", "1.0"], "b", "n = M x V = 0.2 x 0.5 = 0.1 mol."),
    ("In a galvanic (electrochemical) cell, the anode is the electrode at which", ["reduction takes place", "oxidation takes place", "electrons enter from the external circuit", "no reaction takes place"], "b", "Oxidation occurs at the anode (negative terminal of a galvanic cell); reduction at the cathode."),
    ("A transformer has 1600 turns on the primary and 400 turns on the secondary. If the primary is connected to 240 V a.c., the secondary voltage is", ["960 V", "60 V", "240 V", "120 V"], "b", "Vs/Vp = Ns/Np = 400/1600, so Vs = 240/4 = 60 V (step-down)."),
    ("The SI unit of magnetic flux is", ["tesla", "weber", "henry", "gauss"], "b", "Magnetic flux is measured in weber (Wb = T m²); tesla is flux density, henry inductance."),
    ("A body slides down a smooth (frictionless) inclined plane of angle 30°. Its acceleration (g = 10 m/s²) is", ["10 m/s²", "8.66 m/s²", "5 m/s²", "2.5 m/s²"], "c", "a = g sin θ = 10 x 0.5 = 5 m/s²."),
]

SAQ = [
 dict(marks=3, stem="Prove that ∫ sec x dx = log|sec x + tan x| + c. (3 marks)",
      kp=[("Multiply and divide by (sec x + tan x): ∫ sec x (sec x + tan x)/(sec x + tan x) dx", 1),
          ("Put t = sec x + tan x, dt = (sec x tan x + sec²x) dx = sec x (sec x + tan x) dx", 1),
          ("∫ dt/t = log|t| + c = log|sec x + tan x| + c", 1)],
      model="∫ sec x dx = ∫ sec x (sec x + tan x)/(sec x + tan x) dx = ∫ (sec²x + sec x tan x)/(sec x + tan x) dx. Let t = sec x + tan x; then dt = (sec x tan x + sec²x) dx, which is exactly the numerator. So the integral = ∫ dt/t = log|t| + c = log|sec x + tan x| + c."),
 dict(marks=3, stem="Find those integral values of m for which the x-coordinate (printed 'c-coordinate') of the point of intersection of the lines y = mx + 1 and 3x + 4y = 9 is an integer. (3 marks)",
      kp=[("Substitute: 3x + 4(mx + 1) = 9 → x(3 + 4m) = 5 → x = 5/(3 + 4m)", 1),
          ("x is an integer when 3 + 4m ∈ {±1, ±5}", 1),
          ("Integral m: 3 + 4m = −1 → m = −1; 3 + 4m = −5 → m = −2 (others give m = ±1/2) → m = −1, −2", 1)],
      model="Substituting y = mx + 1 in 3x + 4y = 9: 3x + 4mx + 4 = 9, so x(3 + 4m) = 5 and x = 5/(3 + 4m). For x to be an integer, 3 + 4m must be a divisor of 5: ±1 or ±5. 3 + 4m = 1 → m = −1/2; 3 + 4m = −1 → m = −1; 3 + 4m = 5 → m = 1/2; 3 + 4m = −5 → m = −2. The integral values are m = −1 (x = −5) and m = −2 (x = −1)."),
 dict(marks=3, stem="Are the sets C = {x : x − 5 = 0} and E = {x : x is an integral positive root of the equation x² − 2x − 15 = 0} equal? (3 marks)",
      kp=[("C = {5}", 1), ("x² − 2x − 15 = (x − 5)(x + 3) = 0 → roots 5, −3; positive integral root 5 → E = {5}", 1.5), ("Same elements, so C = E", 0.5)],
      model="C: x − 5 = 0 gives x = 5, so C = {5}. E: x² − 2x − 15 = (x − 5)(x + 3) = 0, so x = 5 or x = −3; the only positive integral root is 5, so E = {5}. Both sets have exactly the same element, so C = E."),
 dict(marks=3, stem="What is corrosion? Explain the electrochemical theory of rusting of iron and write the reactions involved in the rusting of iron. (3 marks)",
      kp=[("Corrosion: slow destruction of a metal by chemical/ electrochemical reaction with its environment (air, moisture, acids)", 0.5),
          ("Electrochemical theory: in a water film with dissolved O₂/ CO₂, part of the iron surface is the anode and another part the cathode (mini galvanic cell)", 1),
          ("Anode: Fe → Fe²⁺ + 2e⁻; cathode: O₂ + 4H⁺ + 4e⁻ → 2H₂O (or O₂ + 2H₂O + 4e⁻ → 4OH⁻); Fe²⁺ oxidised to Fe³⁺ → 2Fe²⁺ + ½O₂ + (2 + x)H₂O → Fe₂O₃·xH₂O + 4H⁺ (rust)", 1.5)],
      model="Corrosion is the slow deterioration of a metal by chemical or electrochemical reaction with its surroundings - air, moisture, acids. Rusting of iron is electrochemical: a film of water containing dissolved O₂ and CO₂ (carbonic acid) acts as an electrolyte, and different spots on the iron become anodes and cathodes, forming tiny galvanic cells.\nAnode (oxidation): Fe(s) → Fe²⁺(aq) + 2e⁻.\nCathode (reduction): O₂(g) + 4H⁺(aq) + 4e⁻ → 2H₂O(l).\nOverall: 2Fe + O₂ + 4H⁺ → 2Fe²⁺ + 2H₂O. The Fe²⁺ ions are further oxidised by air to Fe³⁺, which forms hydrated iron(III) oxide: 4Fe²⁺ + O₂ + (4 + 2x)H₂O → 2Fe₂O₃·xH₂O + 8H⁺. Fe₂O₃·xH₂O is rust."),
 dict(marks=3, stem="Define the term solution. How many types of solutions are formed? Write briefly about each type with an example. (3 marks)",
      kp=[("Solution: homogeneous mixture of two or more substances (solute + solvent)", 1),
          ("Nine types by the states of solute and solvent (gas, liquid, solid in gaseous, liquid and solid solvents) - or three broad types: gaseous, liquid, solid solutions", 1),
          ("Examples: gaseous - air; liquid - sugar or salt in water, ethanol in water, O₂ in water; solid - alloys (brass), H₂ in palladium, amalgam", 1)],
      model="A solution is a homogeneous mixture of two or more components whose composition is uniform throughout; the component in larger amount is the solvent, the other the solute.\nBased on the physical state of the solvent there are three types (nine in all by solute/ solvent state):\n1. Gaseous solutions (solvent a gas): gas in gas - air (O₂ and N₂); liquid in gas - chloroform vapour in N₂; solid in gas - camphor in N₂.\n2. Liquid solutions (solvent a liquid): gas in liquid - O₂ dissolved in water, soda water (CO₂); liquid in liquid - ethanol in water; solid in liquid - sugar or salt in water.\n3. Solid solutions (solvent a solid): gas in solid - H₂ in palladium; liquid in solid - mercury in sodium (amalgam); solid in solid - alloys such as brass (Zn in Cu)."),
 dict(marks=3, stem="Calculate the amount of benzoic acid (C₆H₅COOH) required for preparing 250 mL of 0.15 M solution in methanol. (3 marks)",
      kp=[("Moles = M x V = 0.15 x 0.250 = 0.0375 mol", 1), ("Molar mass C₆H₅COOH = 7(12) + 6(1) + 2(16) = 122 g/mol", 1), ("Mass = 0.0375 x 122 = 4.575 g ≈ 4.58 g", 1)],
      model="Moles of benzoic acid needed = molarity x volume (L) = 0.15 x 0.250 = 0.0375 mol. Molar mass of C₆H₅COOH = (7 x 12) + (6 x 1) + (2 x 16) = 122 g/mol. Mass required = 0.0375 x 122 = 4.575 g ≈ 4.58 g, dissolved in methanol and made up to 250 mL."),
 dict(marks=3, image="/papers/me/tech2-eng-2023-coils.png", stem="The circuit arrangement in the figure shows that when an alternating current passes through coil A, a current starts flowing in coil B. (i) State the underlying principle involved. (ii) Mention two factors on which the current produced in coil B depends. (3 marks)",
      kp=[("(i) Mutual induction (electromagnetic induction, Faraday's law): the changing current in A produces a changing magnetic flux linked with B, inducing an emf in B", 1.5),
          ("(ii) Any two: number of turns of the coils, rate of change of current in A (frequency/ amplitude), distance and orientation between the coils (coupling), presence of a soft-iron core, resistance of coil B's circuit", 1.5)],
      model="(i) The principle is mutual induction (Faraday's law of electromagnetic induction). The alternating current in coil A produces a continuously changing magnetic field; the changing flux linked with coil B induces an emf in B, which drives a current through its circuit (shown by the galvanometer).\n(ii) The current in coil B depends on: the number of turns in the coils; the rate of change of current in coil A (its frequency and amplitude); the separation and relative orientation of the two coils (how much flux links them); a soft-iron core between them, which increases the mutual inductance; and the resistance of coil B's circuit."),
 dict(marks=3, stem="Read each statement below carefully and state, with reasons, if it is true or false. A particle in one-dimensional motion (a) with zero speed at an instant may have non-zero acceleration at that instant; (b) with constant speed must have zero acceleration. (3 marks)",
      kp=[("(a) True - e.g. a ball thrown vertically up has zero speed at the top but acceleration g", 1.5),
          ("(b) True - in one dimension constant speed means the velocity cannot change (reversing direction would need speed to pass through zero), so acceleration is zero", 1.5)],
      model="(a) True. At the highest point of a ball thrown vertically upwards its speed is momentarily zero, but its acceleration is still g (9.8 m/s² downwards).\n(b) True. In one-dimensional motion the velocity can change only in magnitude or by reversing direction; a reversal requires the speed to become zero, so if the speed stays constant the velocity is constant and the acceleration is zero. (This is not true in two or three dimensions, e.g. uniform circular motion.)"),
 dict(marks=3, stem="A family uses 8 kW of power. (a) Direct solar energy is incident on a horizontal surface at an average rate of 200 W per square metre. If 20% of this energy can be converted to useful electrical energy, how large an area is needed to supply 8 kW? (b) Compare this area to that of the roof of a typical house. (3 marks)",
      kp=[("Useful power per m² = 0.20 x 200 = 40 W/m²", 1), ("Area = 8000/40 = 200 m²", 1), ("(b) A typical house roof is about 100-200 m² (e.g. 10 m x 15 m); the area needed is about the whole roof or more - comparable to/ larger than a typical roof", 1)],
      model="(a) Only 20 % of the incident 200 W/m² is converted: 0.20 x 200 = 40 W of electrical power per square metre. Area needed = 8000 W/40 W m⁻² = 200 m².\n(b) The roof of a typical house is of the order of 100-200 m² (for example 10 m x 15 m = 150 m²). So the collector area needed is about as large as, or larger than, the whole roof of a typical house - solar panels on the roof alone could only just supply this family."),
 dict(marks=3, stem="How has artificial intelligence advanced? State the impact of artificial intelligence in the world today. (3 marks)",
      kp=[("Advances: from rule-based expert systems to machine learning and deep learning; large datasets and GPU computing; generative AI/ large language models (e.g. ChatGPT), computer vision, speech recognition, self-driving and robotics", 1.5),
          ("Impact: automation and productivity, healthcare diagnosis, education and personalised learning, finance/ fraud detection, agriculture, communication; concerns - job displacement, bias, privacy, misinformation/ deepfakes, need for regulation", 1.5)],
      model="Advances: AI has moved from early rule-based 'expert systems' to machine learning, where computers learn patterns from data, and to deep learning with neural networks, made possible by huge datasets and powerful processors (GPUs/ cloud). Today generative AI and large language models (such as ChatGPT) can write text and code, translate and summarise; computer vision recognises images and faces; speech assistants understand voice; and AI drives robots and self-driving vehicles.\nImpact: it raises productivity by automating routine work; supports doctors in diagnosis and drug discovery; personalises learning; detects fraud in banking; improves farming, weather and disaster forecasting; and powers e-commerce and digital services. It also raises concerns - job displacement, bias in decisions, privacy and data security, misinformation and deepfakes - so ethical use and regulation are needed."),
]
Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
for q in Q:
    if q["type"] != "mcq":
        q["issues"] = list(q.get("issues", [])) + ["Model answer written by Claude: please check before publishing."]
