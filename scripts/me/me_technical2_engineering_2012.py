"""ME Technical Paper II (General Subject Knowledge), ENGINEERING group, BCSE 2012 Main Examination (13 October 2012) - real
paper, PDF sent by the founder (a scanned copy: every question was typed from the page images). Same layout as the latest
(BCSE 2025) paper: Part I 70 MCQ x 1 (Section A Mathematics 1-20, B Chemistry 21-40, C Physics 41-60, D General IT 61-70);
Part II 10 short answers x 3 - so no marks were changed. No figures in this paper (Part II Q8 tariff table retyped).
Left out (more than one defensible answer): MCQ 22 (atomic mass - absolute or relative), 26 (direction of conventional
current depends on galvanic vs electrolytic cell), 67 (1 GB = 1,073,741,824 or 1,000,000,000 bytes), 70 (squash/stretch/warp).
Four new MCQs (2 Chemistry, 2 IT) keep Part I at 70. Clarified: MCQ 32 'always' read as 'generally' (Cu + HNO₃ is an exception).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Engineering): BCSE 2012, batch 1"
GROUP_TAG = "eng2012"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "engineering"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Engineering: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Which diagram is used to represent sets?",
"opts": [
"Bar chart",
"PERT chart",
"Venn diagram",
"Pie chart"
]
},
{
"n": 2,
"stem": "The ratio of the circumference of a circle to its diameter is:",
"opts": [
"π",
"2",
"0.5",
"2π"
]
},
{
"n": 3,
"stem": "Half of a sphere is called a:",
"opts": [
"circle",
"hemisphere",
"circum-sphere",
"semicircle"
]
},
{
"n": 4,
"stem": "A number that has only two factors, one and itself, is a:",
"opts": [
"Unique number",
"Odd number",
"Prime number",
"Fraction"
]
},
{
"n": 5,
"stem": "Find a number which, when increased by 17, is equal to 60 times the reciprocal of the number.",
"opts": [
"2",
"3",
"6",
"8"
]
},
{
"n": 6,
"stem": "A man is five times as old as his son, and the sum of the squares of their ages is 2106. Find their ages.",
"opts": [
"Son 5 years, father 25 years",
"Son 7 years, father 35 years",
"Son 9 years, father 45 years",
"Son 10 years, father 50 years"
]
},
{
"n": 7,
"stem": "Two numbers are in the ratio 5 : 8. If 9 is added to each, they are in the ratio 8 : 11. Find the numbers.",
"opts": [
"5, 8",
"8, 11",
"15, 24",
"20, 32"
]
},
{
"n": 8,
"stem": "Find the 5th term of the series 3, 6, 12, …",
"opts": [
"24",
"48",
"96",
"192"
]
},
{
"n": 9,
"stem": "What would be the total accumulated amount in 5 years if Nu. 10,000 is deposited in a bank at an interest rate of 6% per annum compounded monthly?",
"opts": [
"Nu. 13,488.50",
"Nu. 13,300.00",
"Nu. 13,000.00",
"Nu. 13,500.00"
]
},
{
"n": 10,
"stem": "A man whose height is 1.5 m, standing 8 m from a lamp-post, observes that his shadow cast by the light is 1.25 m long. How high is the light?",
"opts": [
"10.0 m",
"11.1 m",
"12.0 m",
"9.0 m"
]
},
{
"n": 11,
"stem": "What is the length of the edge of a cube whose total surface area is 24 m²?",
"opts": [
"2 m",
"3 m",
"4 m",
"6 m"
]
},
{
"n": 12,
"stem": "How many solid spheres 6 cm in diameter could be moulded from a solid metal cylinder whose length is 45 cm and diameter 4 cm?",
"opts": [
"10",
"8",
"6",
"5"
]
},
{
"n": 13,
"stem": "The large hand of a clock is 71.12 cm long. How many centimetres does its tip move in 20 minutes?",
"opts": [
"120.00 cm",
"148.95 cm",
"150.00 cm",
"160.00 cm"
]
},
{
"n": 14,
"stem": "The angle of elevation of the top of a tower is 30°; on walking 100 m nearer, the elevation is found to be 60°. Find the height of the tower.",
"opts": [
"40√3 m",
"45√3 m",
"50√3 m",
"55√3 m"
]
},
{
"n": 15,
"stem": "A cow is tied to a pole in a meadow with a nylon rope 10 m long. The total grazing area is:",
"opts": [
"314.2 m²",
"62.84 m²",
"100 m²",
"250 m²"
]
},
{
"n": 16,
"stem": "The level of sound D in decibels is defined as D = 4 log(I/10⁻⁸), where I is the sound intensity in watts/cm². Find D for a sound of intensity I = 10⁻⁴ watts/cm².",
"opts": [
"16 decibels",
"8 decibels",
"10 decibels",
"4 decibels"
]
},
{
"n": 17,
"stem": "Which of the following is an identity?",
"opts": [
"cos 2x = 2 cos x",
"cos(x + y) = cos x + cos y",
"sin(x − y) = sin x − sin y",
"sin 2x = 2 sin x cos x"
]
},
{
"n": 18,
"stem": "lim (x → ∞) of (x⁴ + 9x³ − 11x)/(6x⁴) is equal to:",
"opts": [
"1/10",
"1/6",
"1/4",
"∞"
]
},
{
"n": 19,
"stem": "How many 6-letter words can be made using the letters of the word QUALITY without repetition?",
"opts": [
"6040",
"3528",
"720",
"5040"
]
},
{
"n": 20,
"stem": "The partial fractions of (5x + 10)/(x(x + 5)) are:",
"opts": [
"5/(2x) + 3/(x + 5)",
"2/(3x) + 10/(x + 5)",
"3/(2x + 5)",
"2/x + 3/(x + 5)"
]
},
{
"n": 21,
"stem": "A substance in which the components exist together without combining chemically is called a(n)",
"opts": [
"Element",
"Compound",
"Mixture",
"Molecule"
]
},
{
"n": 23,
"stem": "Which element is sometimes considered a non-metal and at other times a metal, depending mainly on its state?",
"opts": [
"Helium",
"Mercury",
"Hydrogen",
"Water"
]
},
{
"n": 24,
"stem": "In the chemical equation 2Al + ? F₂ → 2AlF₃, what is the value in place of the question mark?",
"opts": [
"3",
"4",
"5",
"2"
]
},
{
"n": 25,
"stem": "An instrument used for measuring the pressure of a gas is a",
"opts": [
"Barometer",
"Manometer",
"Thermometer",
"Seismometer"
]
},
{
"n": 27,
"stem": "Chemical reactions accompanied by the liberation of heat are said to be",
"opts": [
"Endothermic",
"Exothermic",
"Reverse reactions",
"Forward reactions"
]
},
{
"n": 28,
"stem": "An atom bomb works on the principle of:",
"opts": [
"Uncontrolled fusion reaction",
"Uncontrolled fission reaction",
"Controlled fission reaction",
"Controlled fusion reaction"
]
},
{
"n": 29,
"stem": "Which of the following conducts electricity?",
"opts": [
"Dry ice",
"Diamond",
"Rubber",
"Copper"
]
},
{
"n": 30,
"stem": "Which one is incorrect regarding the properties of the noble gases?",
"opts": [
"Odourless",
"Colourless",
"Chemically reactive",
"Chemically inert"
]
},
{
"n": 31,
"stem": "Which of these elements is not a noble gas?",
"opts": [
"Bromine",
"Krypton",
"Argon",
"Neon"
]
},
{
"n": 32,
"stem": "The reaction between a reactive metal and a dilute acid generally gives:",
"opts": [
"Salt and water",
"Salt and hydrogen",
"Salt and oxygen",
"Hydrogen only"
]
},
{
"n": 33,
"stem": "Organic compounds are characterised by the presence of",
"opts": [
"Carbon atoms",
"Oxygen atoms",
"Chlorine atoms",
"Nitrogen atoms"
]
},
{
"n": 34,
"stem": "The chemical formula C₆H₆ refers to which hydrocarbon?",
"opts": [
"Methane",
"Benzene",
"Butane",
"Propane"
]
},
{
"n": 35,
"stem": "When calcium carbonate is heated, one of the products of the reaction is",
"opts": [
"O₂",
"CO₂",
"CO",
"N₂"
]
},
{
"n": 36,
"stem": "When no heat is allowed to enter or leave a system, the process is called:",
"opts": [
"Isothermal",
"Adiabatic",
"Isobaric",
"Isochoric"
]
},
{
"n": 37,
"stem": "You can avoid scurvy by eating foods rich in vitamin C, such as citrus fruits. Vitamin C is also known as:",
"opts": [
"Carbonic acid",
"Ascorbic acid",
"Citric acid",
"Nitric acid"
]
},
{
"n": 38,
"stem": "Amino acids are the building blocks of:",
"opts": [
"Protein",
"Lipid",
"Carbohydrate",
"DNA"
]
},
{
"n": 39,
"stem": "Which one of the following is not a radioactive element?",
"opts": [
"Uranium",
"Thorium",
"Radium",
"Strontium"
]
},
{
"n": 40,
"stem": "The cleansing action of soap is due to:",
"opts": [
"Temperature of water",
"Emulsification of dirt",
"Coagulation of water",
"Neutrality of water"
]
},
{
"n": 41,
"stem": "If a particle's position is given by x = 4 − 12t + 3t², where t is in seconds and x in metres, what is its velocity at t = 1 s?",
"opts": [
"6 m/s",
"−6 m/s",
"12 m/s",
"−12 m/s"
]
},
{
"n": 42,
"stem": "Raindrops fall to Earth from a cloud 1700 m above the Earth's surface. If they were not slowed by air resistance, how fast would the drops be moving when they struck the ground?",
"opts": [
"182.5 m/s",
"150.0 m/s",
"250.0 m/s",
"120.0 m/s"
]
},
{
"n": 43,
"stem": "A coin placed on a book begins to slide down when the book is tilted at 13° to the horizontal. What is the coefficient of static friction between the coin and the book?",
"opts": [
"0.15",
"0.20",
"0.23",
"0.30"
]
},
{
"n": 44,
"stem": "A 75 kg man is riding on a 39 kg cart travelling at 2.3 m/s. He jumps off with zero horizontal speed. What is the resulting change in the speed of the cart?",
"opts": [
"6.7 m/s",
"2.3 m/s",
"5.5 m/s",
"4.4 m/s"
]
},
{
"n": 45,
"stem": "A student sitting on a stool that can rotate freely about a vertical axis is set rotating slowly while holding two dumbbells in outstretched hands. If he pulls his arms in, his angular speed will",
"opts": [
"decrease",
"increase",
"remain the same",
"none of the above"
]
},
{
"n": 46,
"stem": "If you wear a red shirt and stand under green light, the shirt will appear:",
"opts": [
"Blue",
"Red",
"Yellow",
"Black"
]
},
{
"n": 47,
"stem": "When a body moves in a circular path (uniform circular motion), the work done by the centripetal force is equal to:",
"opts": [
"Infinity",
"Zero",
"Mass × acceleration",
"None of the above"
]
},
{
"n": 48,
"stem": "The period of oscillation of a simple pendulum depends on the",
"opts": [
"Mass of the ball",
"Length of the string",
"Mass of the ball and length of the string",
"All of the above"
]
},
{
"n": 49,
"stem": "An aluminium flagpole is 33 m high. By how much does its length increase as the temperature increases by 15 °C? (Coefficient of linear expansion of aluminium = 23 × 10⁻⁶ /°C)",
"opts": [
"1.14 mm",
"11.4 mm",
"114.0 mm",
"0.114 mm"
]
},
{
"n": 50,
"stem": "An ammeter is an instrument used to measure the",
"opts": [
"Potential difference between two points in a circuit",
"Resistance of a wire",
"Current in a wire",
"None of the above"
]
},
{
"n": 51,
"stem": "An electric heater in your home converts:",
"opts": [
"Heat energy to electric energy",
"Electric energy to heat energy",
"Mechanical energy to electric energy",
"Electric energy to chemical energy"
]
},
{
"n": 52,
"stem": "Three resistors of 6 Ω, 10 Ω and 15 Ω are connected in series across a 230 V supply. Calculate the current flowing in the circuit.",
"opts": [
"7.419 A",
"0.143 A",
"10 A",
"12 A"
]
},
{
"n": 53,
"stem": "The cathode ray tube was used in which of the following household items?",
"opts": [
"Radio",
"Microwave oven",
"Television",
"Refrigerator"
]
},
{
"n": 54,
"stem": "A private radio station transmits its signal at a frequency of 90 kHz. If the speed of radio waves in air is 3 × 10⁸ m/s, the wavelength of the radio waves will be:",
"opts": [
"3333.33 m",
"3333333.33 m",
"333333.33 m",
"33333.33 m"
]
},
{
"n": 55,
"stem": "When a spoon is placed in a beaker of water it appears broken because of the phenomenon of:",
"opts": [
"Radiation of light",
"Reflection of light",
"Refraction of light",
"Absorption of light"
]
},
{
"n": 56,
"stem": "A natural phenomenon in which a pool of water appears to lie on the road some distance ahead on a sunny day, but can never be reached, is called a(n)",
"opts": [
"Image",
"Illusion",
"Mirage",
"Picture"
]
},
{
"n": 57,
"stem": "The image formed in the rear-view (convex) mirror of a car will be",
"opts": [
"Smaller than the real object",
"Larger than the real object",
"The same size as the real object",
"None of the above"
]
},
{
"n": 58,
"stem": "Infrared radiation is used for photography in fog because it is:",
"opts": [
"Scattered more by fog",
"Scattered less by fog",
"Absorbed by fog",
"Reflected by fog"
]
},
{
"n": 59,
"stem": "If there is a sudden fall in barometric height (pressure), it indicates the:",
"opts": [
"Plenty of sunshine",
"Arrival of rain",
"Arrival of a storm",
"Arrival of snow"
]
},
{
"n": 60,
"stem": "The most widely accepted model for how the universe began is known as the:",
"opts": [
"Newton model",
"Natural selection model",
"Kepler's planetary model",
"Big Bang model"
]
},
{
"n": 61,
"stem": "In computer graphics, the ratio between the width and height of an image is called the:",
"opts": [
"Focus ratio",
"Aspect ratio",
"Resolution ratio",
"None of the above"
]
},
{
"n": 62,
"stem": "WYSIWYG is a feature of some application programs with graphical user interfaces. WYSIWYG stands for:",
"opts": [
"What You See Is What You Get",
"What You See Is What You Graph",
"What You Set Is What You Get",
"None of the above"
]
},
{
"n": 63,
"stem": "Inside the computer, most of the mathematical calculations are carried out by the",
"opts": [
"Processing unit",
"Arithmetic logic unit",
"Internal memory",
"External memory"
]
},
{
"n": 64,
"stem": "The language used to create hypertext documents for use on the World Wide Web is:",
"opts": [
"HyperText Markup Language (HTML)",
"HyperText Transfer Protocol",
"FORTRAN",
"COBOL"
]
},
{
"n": 65,
"stem": "A group of eight bits is called a byte. The number of combinations of 0 and 1 in each byte is:",
"opts": [
"1⁸",
"10⁸",
"2⁸",
"64"
]
},
{
"n": 66,
"stem": "A computer-readable code of thick and thin parallel lines representing binary digits, used for product identification and tracking sales, is known as a:",
"opts": [
"Barcode",
"Binary code",
"Line code",
"Digital code"
]
},
{
"n": 68,
"stem": "The size of a program and the amount of data that a computer can process at any one time depend on the size of its:",
"opts": [
"Read Only Memory",
"Random Access Memory",
"Rapid Access Memory",
"Programmable Read Only Memory"
]
},
{
"n": 69,
"stem": "The most well-known protocol that allows a computer to use a standard telephone line and a modem to connect to the Internet is:",
"opts": [
"Point-to-Point Protocol",
"Public Switched Telephone Network",
"Serial Line Internet Protocol",
"Point-to-Node Protocol"
]
}
]"""

KEY = {
 1: ('c', 'A Venn diagram shows sets as overlapping circles.'),
 2: ('a', 'C = πd, so C/d = π.'),
 3: ('b', 'Half a sphere is a hemisphere (half a circle is a semicircle).'),
 4: ('c', 'A prime number has exactly two factors: 1 and itself.'),
 5: ('b', 'x + 17 = 60/x gives x² + 17x − 60 = 0 = (x + 20)(x − 3), so x = 3 (check: 3 + 17 = 20 = 60/3).'),
 6: ('c', 'x² + (5x)² = 26x² = 2106, so x² = 81: son 9, father 45.'),
 7: ('c', '(5k + 9)/(8k + 9) = 8/11 gives 55k + 99 = 64k + 72, so k = 3: the numbers are 15 and 24.'),
 8: ('b', 'Geometric with ratio 2: the 5th term = 3 × 2⁴ = 48.'),
 9: ('a', 'A = 10,000 × (1 + 0.06/12)⁶⁰ = 10,000 × 1.005⁶⁰ ≈ Nu. 13,488.50.'),
 10: ('b', 'Similar triangles: h/(8 + 1.25) = 1.5/1.25, so h = 9.25 × 1.2 = 11.1 m.'),
 11: ('a', '6a² = 24, so a² = 4 and a = 2 m.'),
 12: ('d', 'Cylinder: π × 2² × 45 = 180π cm³. Sphere: (4/3)π × 3³ = 36π cm³. 180π/36π = 5.'),
 13: ('b', 'In 20 minutes the hand turns 1/3 of a circle: (2π × 71.12)/3 ≈ 148.95 cm.'),
 14: ('c', 'h = x tan 60° = (x + 100) tan 30°, so 3x = x + 100, x = 50 and h = 50√3 m (≈ 86.6 m).'),
 15: ('a', 'The cow can graze a circle of radius 10 m: π × 10² ≈ 314.2 m².'),
 16: ('a', 'D = 4 log(10⁻⁴/10⁻⁸) = 4 log 10⁴ = 4 × 4 = 16.'),
 17: ('d', 'sin 2x = 2 sin x cos x holds for all x; the others are false in general.'),
 18: ('b', 'Divide top and bottom by x⁴: (1 + 9/x − 11/x³)/6 → 1/6.'),
 19: ('d', 'QUALITY has 7 different letters: ⁷P₆ = 7!/1! = 5040.'),
 20: ('d', 'A/x + B/(x + 5): A = 10/5 = 2; at x = −5, B = (−25 + 10)/(−5) = 3. So 2/x + 3/(x + 5).'),
 21: ('c', 'In a mixture the components keep their own properties and are not chemically combined.'),
 23: ('c', 'Hydrogen is a non-metallic gas normally, but under extreme pressure it becomes metallic hydrogen (it is also placed with the alkali metals in Group 1).'),
 24: ('a', '2AlF₃ contains 6 F atoms = 3F₂.'),
 25: ('b', 'A manometer measures the pressure of an enclosed gas; a barometer measures atmospheric pressure.'),
 27: ('b', 'Exothermic reactions release heat (ΔH negative).'),
 28: ('b', 'An atom bomb uses an uncontrolled nuclear fission chain reaction; a reactor uses controlled fission and a hydrogen bomb fusion.'),
 29: ('d', 'Copper is a metal with free electrons; dry ice, diamond and rubber are insulators.'),
 30: ('c', 'Noble gases have full outer shells and are almost unreactive (inert).'),
 31: ('a', 'Bromine is a halogen (Group 17); Kr, Ar and Ne are noble gases.'),
 32: ('b', 'Metal + dilute acid → salt + hydrogen (e.g. Zn + 2HCl → ZnCl₂ + H₂). (Copper and nitric acid are an exception.)'),
 33: ('a', 'Organic chemistry is the chemistry of carbon compounds.'),
 34: ('b', 'C₆H₆ is benzene (methane CH₄, propane C₃H₈, butane C₄H₁₀).'),
 35: ('b', 'CaCO₃ → CaO + CO₂ on heating.'),
 36: ('b', 'Adiabatic: Q = 0. (Isothermal: constant T; isobaric: constant P; isochoric: constant V.)'),
 37: ('b', 'Vitamin C is ascorbic acid.'),
 38: ('a', 'Proteins are chains of amino acids (DNA is built from nucleotides).'),
 39: ('d', 'Natural strontium is stable (only some isotopes, such as man-made Sr-90, are radioactive); U, Th and Ra are radioactive elements.'),
 40: ('b', 'Soap molecules surround oily dirt (micelles), emulsifying it so it washes away in water.'),
 41: ('b', 'v = dx/dt = −12 + 6t; at t = 1, v = −6 m/s.'),
 42: ('a', 'v = √(2gh) = √(2 × 9.8 × 1700) = √33,320 ≈ 182.5 m/s.'),
 43: ('c', 'At the point of slipping μs = tan θ = tan 13° ≈ 0.23.'),
 44: ('d', 'Momentum: (75 + 39) × 2.3 = 262.2 = 39v, so v ≈ 6.72 m/s. The change in speed = 6.72 − 2.3 ≈ 4.4 m/s.'),
 45: ('b', 'Angular momentum Iω is conserved; pulling the arms in reduces I, so ω increases.'),
 46: ('d', 'A red shirt reflects only red light and absorbs green, so under pure green light it reflects nothing and looks black.'),
 47: ('b', 'The centripetal force is always perpendicular to the motion, so it does no work.'),
 48: ('b', 'T = 2π√(l/g): it depends on the length (and g), not on the mass.'),
 49: ('b', 'ΔL = αLΔT = 23 × 10⁻⁶ × 33 × 15 = 0.0114 m = 11.4 mm.'),
 50: ('c', 'An ammeter measures current (a voltmeter measures potential difference).'),
 51: ('b', 'A heater turns electrical energy into heat (Joule heating).'),
 52: ('a', 'R = 6 + 10 + 15 = 31 Ω; I = 230/31 ≈ 7.419 A.'),
 53: ('c', 'Older (CRT) televisions and monitors use a cathode ray tube to form the picture.'),
 54: ('a', 'λ = v/f = 3 × 10⁸/(90 × 10³) ≈ 3333.33 m.'),
 55: ('c', 'Light bends (refracts) as it passes from water to air, so the submerged part appears displaced.'),
 56: ('c', 'A mirage is caused by refraction (and total internal reflection) of light in hot air layers near the road.'),
 57: ('a', 'A convex mirror always forms a virtual, erect, diminished image - giving a wide field of view.'),
 58: ('b', 'Longer-wavelength infrared is scattered much less by fog particles than visible light.'),
 59: ('c', 'A sudden sharp fall in pressure signals a storm; a gradual fall indicates rain.'),
 60: ('d', 'The Big Bang model describes the universe expanding from a hot, dense state about 13.8 billion years ago.'),
 61: ('b', 'Aspect ratio = width : height (e.g. 16 : 9).'),
 62: ('a', 'WYSIWYG = What You See Is What You Get.'),
 63: ('b', 'The ALU in the CPU performs arithmetic and logic operations.'),
 64: ('a', 'Web pages are written in HTML; HTTP is the protocol that transfers them.'),
 65: ('c', 'Each bit has 2 states: 2⁸ = 256 combinations.'),
 66: ('a', 'A barcode encodes data in parallel bars and is read by a scanner at the point of sale.'),
 68: ('b', 'Programs and data being processed are held in RAM (main memory).'),
 69: ('a', 'PPP (Point-to-Point Protocol) is the standard dial-up protocol; SLIP is its older, simpler predecessor and PSTN is the telephone network itself.'),
}

NEW_MCQ = [
    ('Which element has the electronic configuration 2, 8, 1?', ['Magnesium', 'Sodium', 'Potassium', 'Neon'], 'b', 'Sodium (Z = 11) has 2, 8, 1 - one valence electron, so it is an alkali metal.'),
    ('Which of the following gases is the main cause of the greenhouse effect from burning fossil fuels?', ['Nitrogen', 'Oxygen', 'Carbon dioxide', 'Argon'], 'c', 'Burning coal, oil and gas releases carbon dioxide, the main human-made greenhouse gas.'),
    ('Which of the following is an output device?', ['Scanner', 'Keyboard', 'Monitor', 'Microphone'], 'c', 'A monitor displays output; the others are input devices.'),
    ("The 'brain' of the computer that executes instructions is the", ['Hard disk', 'CPU', 'RAM', 'Motherboard'], 'b', 'The central processing unit (CPU) fetches, decodes and executes program instructions.'),
]

SAQ = [
 dict(marks=3, stem="Solve the equation 8^(5 − 3x) = 12^(4 − 2x) for x, given log 2 = 0.30103 and log 3 = 0.47712. (3 marks)",
      kp=[("Take logs: (5 − 3x) log 8 = (4 − 2x) log 12, with log 8 = 3 log 2 = 0.90309 and log 12 = 2 log 2 + log 3 = 1.07918", 1),
          ("4.51545 − 2.70927x = 4.31672 − 2.15836x, so 0.19873 = 0.55091x", 1), ("x ≈ 0.3607", 1)],
      model="Taking logarithms: (5 − 3x) log 8 = (4 − 2x) log 12.\nlog 8 = 3 log 2 = 0.90309; log 12 = 2 log 2 + log 3 = 0.60206 + 0.47712 = 1.07918.\n0.90309(5 − 3x) = 1.07918(4 − 2x)\n4.51545 − 2.70927x = 4.31672 − 2.15836x\n4.51545 − 4.31672 = 2.70927x − 2.15836x\n0.19873 = 0.55091x, so x = 0.19873/0.55091 ≈ 0.3607."),
 dict(marks=3, stem="Find ∫₀¹ 2x/√(x² + 5) dx. (3 marks)",
      kp=[("Substitute u = x² + 5, du = 2x dx: ∫u^(−1/2) du = 2√u", 1), ("Antiderivative 2√(x² + 5); limits 0 to 1: 2√6 − 2√5", 1), ("≈ 4.899 − 4.472 = 0.427", 1)],
      model="Let u = x² + 5, so du = 2x dx. Then ∫2x/√(x² + 5) dx = ∫u^(−1/2) du = 2√u = 2√(x² + 5).\n∫₀¹ = 2√6 − 2√5 = 2(2.449 − 2.236) ≈ 0.427."),
 dict(marks=3, stem="The centre of a circle is at (2, −5) and its radius is 3. Find the equation of the circle. (3 marks)",
      kp=[("Standard form (x − h)² + (y − k)² = r²", 1), ("(x − 2)² + (y + 5)² = 9", 1), ("Expanded: x² + y² − 4x + 10y + 20 = 0", 1)],
      model="A circle with centre (h, k) and radius r has equation (x − h)² + (y − k)² = r².\nHere: (x − 2)² + (y + 5)² = 9.\nExpanding: x² − 4x + 4 + y² + 10y + 25 = 9, so x² + y² − 4x + 10y + 20 = 0."),
 dict(marks=3, stem="The radioisotope cobalt-60 is used to destroy cancerous cells by directing γ-rays into the cancerous tissue. Calculate the fraction of a cobalt-60 sample left after 20.00 years. The half-life of cobalt-60 is 5.27 years. (3 marks)",
      kp=[("Number of half-lives n = 20.00/5.27 = 3.795", 1), ("Fraction left = (1/2)ⁿ = (1/2)^3.795", 1), ("≈ 0.072 (about 7.2% remains)", 1)],
      model="Number of half-lives: n = t/t½ = 20.00/5.27 = 3.795.\nFraction remaining = (1/2)ⁿ = (1/2)^3.795 = 0.0720.\n(Equivalently N/N₀ = e^(−λt) with λ = 0.693/5.27 = 0.1315 per year: e^(−2.630) = 0.072.) So about 7.2% of the cobalt-60 is left."),
 dict(marks=3, stem="Write balanced equations illustrating how nitric acid is produced from ammonia. List some uses of nitric acid. (3 marks)",
      kp=[("Ostwald process: 4NH₃ + 5O₂ → 4NO + 6H₂O (Pt-Rh catalyst, about 800 °C)", 1), ("2NO + O₂ → 2NO₂; 4NO₂ + O₂ + 2H₂O → 4HNO₃ (or 3NO₂ + H₂O → 2HNO₃ + NO)", 1),
          ("Uses: fertilisers (ammonium nitrate, CAN), explosives (TNT, nitroglycerine), dyes and drugs, purifying/etching metals (parting gold and silver, aqua regia)", 1)],
      model="Nitric acid is made from ammonia by the Ostwald process:\n1. Catalytic oxidation of ammonia (platinum-rhodium gauze, about 800 °C): 4NH₃ + 5O₂ → 4NO + 6H₂O.\n2. Oxidation of nitric oxide: 2NO + O₂ → 2NO₂.\n3. Absorption in water: 3NO₂ + H₂O → 2HNO₃ + NO (overall with excess air: 4NO₂ + O₂ + 2H₂O → 4HNO₃).\nUses: manufacture of fertilisers such as ammonium nitrate and calcium ammonium nitrate; explosives (TNT, nitroglycerine); dyes, plastics (nylon) and drugs; etching and cleaning metals, separating gold from silver, and (with HCl) aqua regia; oxidiser in rocket fuel."),
 dict(marks=3, stem="A catfish is 2.00 m below the surface of a smooth lake. What is the diameter of the circle on the surface through which the fish can see the world outside the water? If the fish descends, does the diameter of the circle increase, decrease or remain the same? (Refractive index of water = 1.33, air = 1.00) (3 marks)",
      kp=[("Light from outside reaches the fish only within the critical angle: sin C = 1/1.33, C ≈ 48.8°", 1), ("Radius r = d tan C = 2.00 × tan 48.8° ≈ 2.28 m, so diameter ≈ 4.56 m", 1), ("r = d tan C, so the diameter increases as the fish goes deeper", 1)],
      model="The fish sees the outside world only through rays that refract into the water at angles up to the critical angle C (rays grazing the surface).\nsin C = n_air/n_water = 1/1.33, so C ≈ 48.8°.\nThe radius of the circle on the surface is r = d tan C = 2.00 × tan 48.8° = 2.00 × 1.14 ≈ 2.28 m, so the diameter ≈ 4.56 m.\nSince r = d tan C and C is fixed, the circle's diameter increases in proportion to depth when the fish descends."),
 dict(marks=3, stem="A block of wood floats in water with two-thirds of its volume submerged. In oil the block floats with 0.90 of its volume submerged. Find the density of (a) the wood and (b) the oil. (Density of water = 1000 kg/m³) (3 marks)",
      kp=[("Floating: weight = weight of liquid displaced, so ρ_wood V = ρ_liquid × (fraction submerged) × V", 1), ("(a) ρ_wood = (2/3) × 1000 ≈ 667 kg/m³", 1), ("(b) ρ_oil = 667/0.90 ≈ 741 kg/m³", 1)],
      model="For a floating body, weight = buoyant force: ρ_body × V = ρ_liquid × V_submerged.\n(a) In water: ρ_wood = (2/3) × 1000 ≈ 667 kg/m³ (0.667 g/cm³).\n(b) In oil: ρ_wood = 0.90 ρ_oil, so ρ_oil = 667/0.90 ≈ 741 kg/m³ (0.741 g/cm³)."),
 dict(marks=3, stem="Assume the tariff of a transmission and distribution company for its low-voltage consumers is: Block I 0-100 kWh/month at Nu. 0.80/kWh; Block II 101-300 kWh at Nu. 1.20/kWh; Block III above 300 kWh at Nu. 1.85/kWh; plus a fixed charge of Nu. 50/month. If the total power drawn by your appliances is 2 kW and you use them for five hours each day, what will your electricity bill be for a 30-day month? (3 marks)",
      kp=[("Energy = 2 kW × 5 h × 30 days = 300 kWh", 1), ("Block I: 100 × 0.80 = Nu. 80; Block II: 200 × 1.20 = Nu. 240", 1), ("Bill = 80 + 240 + 50 fixed = Nu. 370", 1)],
      model="Energy used = power × time = 2 kW × 5 h/day × 30 days = 300 kWh.\nBlock I (first 100 kWh): 100 × 0.80 = Nu. 80.\nBlock II (next 200 kWh, 101-300): 200 × 1.20 = Nu. 240.\nNothing falls in Block III.\nTotal = 80 + 240 + 50 (fixed) = Nu. 370 for the month. (A 31-day month: 310 kWh, adding 10 × 1.85 = Nu. 18.50, total Nu. 388.50.)"),
 dict(marks=3, stem="What is the Clean Development Mechanism (CDM)? Name three greenhouse gases. How can CDM projects benefit developing countries? (3 marks)",
      kp=[("CDM: a Kyoto Protocol mechanism letting industrialised (Annex I) countries invest in emission-reduction projects in developing countries and earn certified emission reduction (CER) credits towards their targets", 1),
          ("Greenhouse gases (any three): carbon dioxide (CO₂), methane (CH₄), nitrous oxide (N₂O), HFCs, PFCs, SF₆", 1),
          ("Benefits: foreign investment and income from selling carbon credits, transfer of clean technology, sustainable development such as renewable energy and jobs (e.g. Bhutan's Dagachhu hydropower was registered under CDM)", 1)],
      model="The Clean Development Mechanism is one of the flexible mechanisms of the Kyoto Protocol (1997). It allows industrialised (Annex I) countries with emission-reduction commitments to fund projects that reduce greenhouse-gas emissions in developing countries. Each tonne of CO₂-equivalent reduced earns a Certified Emission Reduction (CER) credit, which the investor can count towards its own target.\nGreenhouse gases: carbon dioxide (CO₂), methane (CH₄) and nitrous oxide (N₂O) (also HFCs, PFCs and SF₆).\nBenefits to developing countries: new investment and income from selling carbon credits, transfer of clean technology and know-how, and support for sustainable development - renewable energy, cleaner industry, jobs and reduced local pollution. Bhutan, for example, registered the Dagachhu hydropower project under the CDM."),
 dict(marks=3, stem="Draw an XOR gate with inputs A and B and output X, and give the truth table for the XOR gate. (3 marks)",
      kp=[("Symbol: an OR-gate shape with an extra curved line on the input side; inputs A, B; output X = A ⊕ B = A'B + AB'", 1), ("Truth table rows: A=0,B=0 → X=0; A=0,B=1 → X=1", 1), ("A=1,B=0 → X=1; A=1,B=1 → X=0 (output is 1 only when the inputs differ)", 1)],
      model="Symbol: the XOR gate is drawn like an OR gate (curved input side, pointed output) with an extra curved line just before the inputs. Inputs A and B enter on the left; the output X leaves on the right. X = A ⊕ B = A'B + AB'.\nTruth table:\nA | B | X\n0 | 0 | 0\n0 | 1 | 1\n1 | 0 | 1\n1 | 1 | 0\nThe output is 1 only when the two inputs are different."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
