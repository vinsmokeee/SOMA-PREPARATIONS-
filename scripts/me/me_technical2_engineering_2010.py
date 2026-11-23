"""ME Technical Paper II (General Subject Knowledge), ENGINEERING group, BCSE 2010 (written 23 November 2010) - real paper,
PDF sent by the founder (a scanned copy: every question was typed from the page images). Same layout as the latest
(BCSE 2025) paper: Part I 70 MCQ x 1 (Section A Mathematics 1-20, B Chemistry 21-40, C Physics 41-60, D General IT 61-70);
Part II 10 short answers x 3 - so no marks were changed. Picture: MCQ 49 resistor network.
Repeats (recorded as appearances of the BCSE 2016 questions, not loaded again): MCQ 34 (glass is a supercooled liquid),
35 (catalyst lowers the energy barrier).
Left out: MCQ 36 (electrolytic cell - no option gives 'anode to cathode through the external circuit'), 69 (protocol: 'between
peers' or 'across an interface'). Four new MCQs (3 Chemistry, 1 IT) keep Part I at 70.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Engineering): BCSE 2010, batch 1"
GROUP_TAG = "eng2010"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "engineering"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2010 Main Examination, Technical Paper II, Engineering", "year": 2010, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Engineering: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Solve for n (! means factorial): (n − 3)!/(n − 4)! = 56. n equals:",
"opts": [
"59",
"53",
"18.67",
"168"
]
},
{
"n": 2,
"stem": "d/dx (u/v) is equal to:",
"opts": [
"(u dv/dx − v du/dx)/v²",
"(v dv/dx − u du/dx)/u²",
"(u dv/dx + v du/dx)/v²",
"(v du/dx − u dv/dx)/v²"
]
},
{
"n": 3,
"stem": "If a die and a coin are tossed, the probability of getting a 6 on the die and a tail on the coin is:",
"opts": [
"1/8",
"1/12",
"1/7",
"2/3"
]
},
{
"n": 4,
"stem": "d/dx (tan β) is equal to:",
"opts": [
"cos²β dβ/dx",
"tan²β dβ/dx",
"sec²β dβ/dx",
"sec β dβ/dx"
]
},
{
"n": 5,
"stem": "∛80 is equal to:",
"opts": [
"∛10",
"2∛10",
"3∛10",
"4∛10"
]
},
{
"n": 6,
"stem": "∫ x cos x dx is equal to (C is an arbitrary constant of integration):",
"opts": [
"x sin x + x cos x + C",
"x cos x + sin x + C",
"x sin x + cos x + C",
"sin x + cos x + C"
]
},
{
"n": 7,
"stem": "∫₀² x cos(x² + 1) dx is equal to:",
"opts": [
"½(sin 5 − sin 1)",
"½(cos 5 − cos 1)",
"½(sin 5 − cos 1)",
"½(cos 5 − sin 1)"
]
},
{
"n": 8,
"stem": "75% of 300 is the same as:",
"opts": [
"300% of 100",
"150% of 150",
"2/3 of 400",
"3/4 of 350"
]
},
{
"n": 9,
"stem": "The second derivative (y″) of the function y = 3x⁵ − 3x⁴ + 2x³ + 10 is:",
"opts": [
"60x³ − 36x² + 12x",
"15x⁴ − 12x³ + 6x²",
"60x⁴ − 12x² + 6x",
"15x³ − 12x² + 6x²"
]
},
{
"n": 10,
"stem": "The value of lim (x → 1) of (x² + 4x − 5)/(x − 1) is:",
"opts": [
"5",
"6",
"7",
"8"
]
},
{
"n": 11,
"stem": "The ratio of a decade to a century is:",
"opts": [
"1 : 10",
"1 : 5",
"1 : 20",
"1 : 2"
]
},
{
"n": 12,
"stem": "If the area of a square is 16 square metres, its perimeter will be:",
"opts": [
"32 metres",
"16 metres",
"16 square metres",
"32 square metres"
]
},
{
"n": 13,
"stem": "The value of π/3 radians in degrees is:",
"opts": [
"30 degrees",
"90 degrees",
"120 degrees",
"60 degrees"
]
},
{
"n": 14,
"stem": "If the length of the shadow of a pole is √3 times the height of the pole, the angle of elevation of the sun is:",
"opts": [
"60 degrees",
"30 degrees",
"45 degrees",
"15 degrees"
]
},
{
"n": 15,
"stem": "If f(x) = 2x − 1 when x ≤ 0, and f(x) = x² when x > 0, then f(1/2) is:",
"opts": [
"1/2",
"1/4",
"2/3",
"1/6"
]
},
{
"n": 16,
"stem": "The area of the quadrilateral whose vertices are (3, 4), (0, 5), (2, −1) and (3, −2) is:",
"opts": [
"11",
"22",
"33",
"44"
]
},
{
"n": 17,
"stem": "A line which intersects a circle at two points is called a:",
"opts": [
"Tangent",
"Secant",
"Interior common tangent",
"Exterior common tangent"
]
},
{
"n": 18,
"stem": "Penjor and Choden are two children in a big family. Penjor has three times as many sisters as he has brothers. Choden has two fewer brothers than she has sisters. How many children are there in the family?",
"opts": [
"13 children: 10 girls and 3 boys",
"12 children: 9 girls and 3 boys",
"9 children: 6 girls and 3 boys",
"8 children: 6 girls and 2 boys"
]
},
{
"n": 19,
"stem": "A circle fits exactly inside a 2 m × 2 m square, as shown. The total area of the shaded parts (square minus circle) is (π = 22/7):",
"opts": [
"0.857 square metres",
"1.857 square metres",
"2.857 square metres",
"3.857 square metres"
]
},
{
"n": 20,
"stem": "If Karma invests Nu 150,000 in Druk PNB shares with a face value of Nu 100 that are being sold at a premium of 25%, the number of shares Karma can buy is:",
"opts": [
"1000",
"1100",
"1200",
"1300"
]
},
{
"n": 21,
"stem": "What is the coefficient of oxygen when the equation SO₂ + O₂ → SO₃ is balanced using the lowest whole numbers?",
"opts": [
"1",
"2",
"4",
"6"
]
},
{
"n": 22,
"stem": "The reaction 2H₂O₂ → (MnO₂ catalyst) will result in the production of",
"opts": [
"H₂ and O₂",
"H₂O",
"H₂O and O₂",
"H₂O₂ and O₂"
]
},
{
"n": 23,
"stem": "Which change does NOT lead to an increase in entropy?",
"opts": [
"Mixing nitrogen and oxygen gases at room temperature",
"Cooling steam so that it condenses to water",
"Heating hexane to its boiling point",
"Dissolving sugar in water"
]
},
{
"n": 24,
"stem": "Which is the strongest oxidising agent?",
"opts": [
"I₂",
"I⁻",
"F₂",
"F⁻"
]
},
{
"n": 25,
"stem": "B is the chemical symbol of which element?",
"opts": [
"Beryllium",
"Boron",
"Bromine",
"Barium"
]
},
{
"n": 26,
"stem": "Density is highest for",
"opts": [
"Pb",
"C",
"Si",
"Ag"
]
},
{
"n": 27,
"stem": "Which of the following has the lowest melting point?",
"opts": [
"N",
"As",
"P",
"Sb"
]
},
{
"n": 28,
"stem": "Photographic films or plates have ………… as an essential ingredient.",
"opts": [
"Silver oxide",
"Silver bromide",
"Silver thiosulphate",
"Silver nitrate"
]
},
{
"n": 29,
"stem": "Which of the following describes the most alkaline solution?",
"opts": [
"pH 4",
"pH 5",
"pH 7",
"pH 10"
]
},
{
"n": 30,
"stem": "The half-life of a radioactive substance is 120 days. After 480 days, 4 g of it will be reduced to:",
"opts": [
"2 g",
"1 g",
"0.5 g",
"0.25 g"
]
},
{
"n": 31,
"stem": "Which of the following conducts electricity well when in solution (dissolved in water)?",
"opts": [
"A metallic solid",
"A covalent solid",
"A molecular solid",
"An ionic solid"
]
},
{
"n": 32,
"stem": "Diamond and graphite are:",
"opts": [
"Isomers",
"Isotopes",
"Allotropes",
"Polymers"
]
},
{
"n": 33,
"stem": "The material used in solar (photovoltaic) cells contains:",
"opts": [
"Cs",
"Si",
"Sn",
"Ti"
]
},
{
"n": 37,
"stem": "Which of the following has the highest calorific value?",
"opts": [
"Carbohydrates",
"Fats",
"Vitamins",
"Proteins"
]
},
{
"n": 38,
"stem": "For making good quality mirrors, plates of float glass are used. These are made by floating molten glass over a liquid metal which does not solidify before the glass. The metal used is",
"opts": [
"Mercury",
"Tin",
"Sodium",
"Magnesium"
]
},
{
"n": 39,
"stem": "Which statement is correct about the halogens?",
"opts": [
"They are all diatomic and form univalent (−1) ions",
"They are all capable of showing several oxidation states",
"They are all diatomic and form divalent ions",
"They can all displace each other from solutions of their compounds"
]
},
{
"n": 40,
"stem": "Which of the following is NOT emitted by a radioactive substance in ordinary radioactive decay?",
"opts": [
"α rays",
"β rays",
"Positron",
"Proton"
]
},
{
"n": 41,
"stem": "Which of the following contains three scalar quantities?",
"opts": [
"Mass, distance, speed",
"Density, force, mass",
"Displacement, acceleration, mass",
"Velocity, momentum, temperature"
]
},
{
"n": 42,
"stem": "Which of Newton's laws states that 'an object continues in uniform motion in a straight line or at rest unless a resultant external force acts'?",
"opts": [
"Newton's 1st law",
"Newton's 2nd law",
"Newton's 3rd law",
"All of the above"
]
},
{
"n": 43,
"stem": "A 1.1 kW electric kettle is plugged into the 220 V mains supply. The current drawn is",
"opts": [
"0.005 A",
"0.05 A",
"0.5 A",
"5 A"
]
},
{
"n": 44,
"stem": "The light year is the distance travelled by light in",
"opts": [
"One year",
"Two years",
"Three years",
"None of the above"
]
},
{
"n": 45,
"stem": "The SI unit of electric current is the",
"opts": [
"Volt",
"Ampere",
"Ohm",
"Mole"
]
},
{
"n": 46,
"stem": "If the temperature on the Kelvin scale is 273 K, the temperature in degrees Celsius is",
"opts": [
"100 °C",
"50 °C",
"25 °C",
"0 °C"
]
},
{
"n": 47,
"stem": "Which law states that 'at constant pressure, the volume of a gas is proportional to its temperature in kelvin'?",
"opts": [
"Pressure law",
"Charles's law",
"Boyle's law",
"Snell's law"
]
},
{
"n": 48,
"stem": "A glass rod rubbed with silk acquires a positive charge because",
"opts": [
"protons are added to it",
"protons are removed from it",
"electrons are added to it",
"electrons are removed from it"
]
},
{
"n": 49,
"stem": "In the network shown, a resistor R is in series with two 3R resistors connected in parallel. The effective resistance of the network is",
"opts": [
"2R",
"4R",
"10R",
"5R/2"
],
"image": "/papers/me/tech2-eng-2010-network.png"
},
{
"n": 50,
"stem": "When the length of a metal wire increases (same thickness), its electrical resistance",
"opts": [
"Increases",
"Decreases",
"Does not change",
"None of the above"
]
},
{
"n": 51,
"stem": "Two free parallel wires carrying currents in opposite directions",
"opts": [
"attract each other",
"repel each other",
"do not affect each other",
"rotate to become perpendicular to each other"
]
},
{
"n": 52,
"stem": "Eddy currents are minimised by:",
"opts": [
"Lubrication",
"Using a high-frequency magnetic field",
"Using a core in laminated form",
"None of the above"
]
},
{
"n": 53,
"stem": "Alternating current (AC) is used in homes because",
"opts": [
"it is not dangerous",
"it is easily reproducible",
"it is cheap",
"it is economical in transmission"
]
},
{
"n": 54,
"stem": "A motor is a device which converts",
"opts": [
"AC into DC",
"DC into AC",
"mechanical energy into electrical energy",
"electrical energy into mechanical energy"
]
},
{
"n": 55,
"stem": "A car accelerates uniformly from rest. After 8 seconds it has travelled 120 m. The acceleration of the car is",
"opts": [
"60 m/s²",
"15 m/s²",
"3.75 m/s²",
"9.6 m/s²"
]
},
{
"n": 56,
"stem": "………… is the instrument used to measure current.",
"opts": [
"Voltmeter",
"Manometer",
"Ammeter",
"Ohmmeter"
]
},
{
"n": 57,
"stem": "Increasing the charge on the plates of a given capacitor means",
"opts": [
"increasing the capacitance",
"increasing the potential difference between the plates",
"both a and b",
"none of the above"
]
},
{
"n": 58,
"stem": "When the number of turns in a solenoid is doubled without any change in its length, its self-inductance becomes",
"opts": [
"four times",
"doubled",
"halved",
"squared"
]
},
{
"n": 59,
"stem": "The scattering of light explains which of the following?",
"opts": [
"Blue colour of the sky",
"Reddish colour of the sky at sunrise and sunset",
"Use of red light in danger signals",
"All of the above"
]
},
{
"n": 60,
"stem": "On hot days we can sometimes see mirages. The reason for this is",
"opts": [
"The refractive index of the atmosphere increases as we go from greater to lower heights",
"The hot air acts as a mirror",
"Air currents are set up in the atmosphere",
"The refractive index of the atmosphere increases with height"
]
},
{
"n": 61,
"stem": "HTML stands for:",
"opts": [
"Hyper Text Mailing Language",
"Hyper Text Markup Language",
"Hyper Text Market Language",
"Hyper Text Mailer's Language"
]
},
{
"n": 62,
"stem": "One byte represents:",
"opts": [
"a word",
"eight characters",
"eight bits",
"a single digit with two possible states"
]
},
{
"n": 63,
"stem": "Of the following, the largest unit of storage is a:",
"opts": [
"gigabyte",
"kilobyte",
"megabyte",
"terabyte"
]
},
{
"n": 64,
"stem": "Which of the following best describes the difference between the Internet and the WWW?",
"opts": [
"The Internet is the physical network of global computers, and the WWW is the many hypertext documents distributed globally over many computers",
"The Internet carries traffic for schools, government offices and public organisations, while the WWW carries commercial traffic",
"The Internet is the collection of computers, and the WWW is the wiring and transmission protocols that connect them",
"The Internet consists of software programs such as e-mail and IRC, while the WWW is a collection of web pages"
]
},
{
"n": 65,
"stem": "Which part of the URL http://www.bhutannews.com/sports/archery.htm records the directory or folder of the desired resource?",
"opts": [
"http",
"sports",
"archery.htm",
"www.bhutannews.com"
]
},
{
"n": 66,
"stem": "A computer on a network that shares its resources for others to use is called a",
"opts": [
"Server",
"Client",
"Mainframe",
"None of the above"
]
},
{
"n": 67,
"stem": "ASCII stands for",
"opts": [
"American Stable Code for International Interchange",
"American Standard Case for Institutional Interchange",
"American Standard Code for Information Interchange",
"American Standard Code for Interchange Information"
]
},
{
"n": 68,
"stem": "The language that a computer can understand and execute directly is called",
"opts": [
"Machine language",
"Application software",
"System program",
"All of the above"
]
},
{
"n": 70,
"stem": "RAM stands for",
"opts": [
"Rapid Access Memory",
"Random Access Memory",
"Read Access Memory",
"Remote Access Memory"
]
}
]"""

KEY = {
 1: ('a', '(n − 3)!/(n − 4)! = n − 3 = 56, so n = 59.'),
 2: ('d', 'Quotient rule: d(u/v)/dx = (v u′ − u v′)/v².'),
 3: ('b', 'Independent events: 1/6 × 1/2 = 1/12.'),
 4: ('c', 'd/dx tan β = sec²β × dβ/dx (chain rule).'),
 5: ('b', '80 = 8 × 10 and ∛8 = 2, so ∛80 = 2∛10.'),
 6: ('c', 'By parts (u = x, dv = cos x dx): x sin x − ∫sin x dx = x sin x + cos x + C.'),
 7: ('a', 'Let u = x² + 1, du = 2x dx; limits 1 to 5: ½∫₁⁵ cos u du = ½(sin 5 − sin 1).'),
 8: ('b', '75% of 300 = 225 and 150% of 150 = 225. (The others give 300, 266.7 and 262.5.)'),
 9: ('a', 'y′ = 15x⁴ − 12x³ + 6x²; y″ = 60x³ − 36x² + 12x.'),
 10: ('b', 'x² + 4x − 5 = (x + 5)(x − 1), so the limit is 1 + 5 = 6.'),
 11: ('a', '10 years : 100 years = 1 : 10.'),
 12: ('b', 'Side = √16 = 4 m, so the perimeter = 4 × 4 = 16 m.'),
 13: ('d', 'π rad = 180°, so π/3 = 60°.'),
 14: ('b', 'tan θ = h/(√3 h) = 1/√3, so θ = 30°.'),
 15: ('b', '1/2 > 0, so f(1/2) = (1/2)² = 1/4.'),
 16: ('a', 'Shoelace formula: ½|15 − 10 − 1 + 18| = ½ × 22 = 11 square units.'),
 17: ('b', 'A secant cuts a circle at two points; a tangent touches it at one.'),
 18: ('c', 'Let G girls and B boys. Penjor: G = 3(B − 1). Choden: B = (G − 1) − 2. So G = 3(G − 4), G = 6 and B = 3: 9 children.'),
 19: ('a', 'Square 4 m² − circle π(1)² = 4 − 22/7 ≈ 0.857 m².'),
 20: ('c', 'Price per share = 100 + 25% = Nu 125; 150,000/125 = 1200 shares.'),
 21: ('a', '2SO₂ + O₂ → 2SO₃: the coefficient of O₂ is 1.'),
 22: ('c', 'MnO₂ catalyses the decomposition 2H₂O₂ → 2H₂O + O₂.'),
 23: ('b', 'Condensing a gas to a liquid makes the system more ordered, so entropy decreases.'),
 24: ('c', 'F₂ is the most electronegative element and the strongest oxidising agent; ions such as F⁻ and I⁻ cannot gain more electrons.'),
 25: ('b', 'B = boron (Be beryllium, Br bromine, Ba barium).'),
 26: ('a', 'Lead (about 11.3 g/cm³) is denser than silver (10.5), carbon and silicon (about 2.3).'),
 27: ('a', 'Nitrogen is a gas at room temperature (melting point −210 °C); P, As and Sb are solids.'),
 28: ('b', 'Light-sensitive silver bromide (AgBr) is the key ingredient of photographic film.'),
 29: ('d', 'The higher the pH above 7, the more alkaline the solution.'),
 30: ('d', '480/120 = 4 half-lives: 4 → 2 → 1 → 0.5 → 0.25 g.'),
 31: ('d', 'Ionic solids dissolve to give free-moving ions that carry current.'),
 32: ('c', 'They are different structural forms of the same element, carbon - allotropes.'),
 33: ('b', 'Most solar cells are made from the semiconductor silicon.'),
 37: ('b', 'Fats give about 9 kcal/g compared with about 4 kcal/g for carbohydrates and proteins.'),
 38: ('b', 'In the float (Pilkington) process molten glass floats on a bath of molten tin.'),
 39: ('a', 'F₂, Cl₂, Br₂ and I₂ are diatomic and form X⁻ ions. Fluorine shows only −1, and a halogen displaces only those below it.'),
 40: ('d', 'Common decays emit α particles, β particles (electrons or positrons) and γ rays; proton emission is not an ordinary mode of decay.'),
 41: ('a', 'Mass, distance and speed have magnitude only; force, displacement, acceleration, velocity and momentum are vectors.'),
 42: ('a', 'This is the first law - the law of inertia.'),
 43: ('d', 'I = P/V = 1100/220 = 5 A.'),
 44: ('a', 'One light year is the distance light travels in one year (about 9.46 × 10¹⁵ m).'),
 45: ('b', 'Current is measured in amperes (A).'),
 46: ('d', '°C = K − 273, so 273 K = 0 °C.'),
 47: ('b', "Charles's law: V ∝ T at constant pressure (Boyle's law: P ∝ 1/V at constant temperature)."),
 48: ('d', 'Only electrons move in charging by rubbing; the glass loses electrons to the silk.'),
 49: ('d', '3R ∥ 3R = 1.5R; plus R in series = 2.5R = 5R/2.'),
 50: ('a', 'R = ρL/A, so resistance is proportional to length.'),
 51: ('b', 'Like (same-direction) currents attract; opposite currents repel.'),
 52: ('c', 'Laminating the core breaks up the paths of eddy currents.'),
 53: ('d', 'AC voltage can be stepped up and down with transformers, so power is transmitted at high voltage with low losses.'),
 54: ('d', 'A motor turns electrical energy into mechanical energy (a generator does the reverse).'),
 55: ('c', 's = ½at²: 120 = ½ × a × 64, so a = 3.75 m/s².'),
 56: ('c', 'An ammeter measures current.'),
 57: ('b', "Q = CV; C is fixed by the capacitor's construction, so more charge means a larger potential difference."),
 58: ('a', 'L = μ₀N²A/l, so doubling N makes L four times as large.'),
 59: ('d', 'Short (blue) wavelengths scatter most, so the sky is blue; at sunrise/sunset the long path leaves red; red is scattered least so it is seen far away.'),
 60: ('d', 'Air near the hot ground is hotter and less dense, so the refractive index increases with height; light bends upward and is totally internally reflected, giving the mirage.'),
 61: ('b', 'HTML = HyperText Markup Language.'),
 62: ('c', '1 byte = 8 bits (a bit is a single binary digit).'),
 63: ('d', 'KB < MB < GB < TB.'),
 64: ('a', 'The Internet is the global network infrastructure; the World Wide Web is the system of linked hypertext pages that runs on it.'),
 65: ('b', 'http is the protocol, www.bhutannews.com the host, sports the directory and archery.htm the file.'),
 66: ('a', 'A server provides shared resources/services; clients use them.'),
 67: ('c', 'ASCII = American Standard Code for Information Interchange.'),
 68: ('a', 'The CPU directly executes only machine language (binary instructions).'),
 70: ('b', 'RAM = Random Access Memory.'),
}

NEW_MCQ = [
    ('Which of the following is an example of a chemical change?', ['Melting of ice', 'Dissolving salt in water', 'Rusting of iron', 'Boiling of water'], 'c', 'Rusting forms a new substance (hydrated iron oxide); the others are physical changes.'),
    ('The atomic number of an element is 17. Its electronic configuration is', ['2, 8, 7', '2, 8, 8', '2, 7, 8', '2, 8, 6, 1'], 'a', '17 electrons fill shells as 2, 8, 7 (chlorine).'),
    ('Which gas is evolved when zinc reacts with dilute hydrochloric acid?', ['Oxygen', 'Chlorine', 'Hydrogen', 'Carbon dioxide'], 'c', 'Zn + 2HCl → ZnCl₂ + H₂.'),
    ('Which keyboard shortcut copies the selected text in Microsoft Windows?', ['Ctrl + V', 'Ctrl + X', 'Ctrl + C', 'Ctrl + Z'], 'c', 'Ctrl + C copies; Ctrl + X cuts, Ctrl + V pastes and Ctrl + Z undoes.'),
]

SAQ = [
 dict(marks=3, stem="Divide (x⁴ − 3x² + 7x − 10) by (x − 2). (3 marks)",
      kp=[("Long or synthetic division with coefficients 1, 0, −3, 7, −10 (include the missing x³ term)", 1), ("Quotient = x³ + 2x² + x + 9", 1), ("Remainder = 8 (check: f(2) = 16 − 12 + 14 − 10 = 8)", 1)],
      model="Write the dividend with every power: x⁴ + 0x³ − 3x² + 7x − 10. Synthetic division by x − 2 (use 2):\n1 → 1; 0 + 2 = 2; −3 + 4 = 1; 7 + 2 = 9; −10 + 18 = 8.\nQuotient: x³ + 2x² + x + 9; remainder 8.\nSo (x⁴ − 3x² + 7x − 10)/(x − 2) = x³ + 2x² + x + 9 + 8/(x − 2). (Remainder theorem check: f(2) = 16 − 12 + 14 − 10 = 8.)"),
 dict(marks=3, stem="Solve: 2x² − 36x + 162 = 32 (3 marks)",
      kp=[("Rearrange: 2x² − 36x + 130 = 0, i.e. x² − 18x + 65 = 0", 1), ("Factorise: (x − 5)(x − 13) = 0", 1), ("x = 5 or x = 13", 1)],
      model="2x² − 36x + 162 − 32 = 0 → 2x² − 36x + 130 = 0 → x² − 18x + 65 = 0.\n(x − 5)(x − 13) = 0, so x = 5 or x = 13.\n(Check x = 5: 50 − 180 + 162 = 32 ✓.)"),
 dict(marks=3, stem="A right-angled triangle has a perimeter of 24 cm and a hypotenuse of 10 cm. Find the sides x and y (y > x) that make the right angle. (3 marks)",
      kp=[("x + y = 24 − 10 = 14 and x² + y² = 10² = 100", 1), ("(x + y)² = x² + y² + 2xy, so 196 = 100 + 2xy and xy = 48", 1), ("x and y are roots of t² − 14t + 48 = 0: x = 6 cm, y = 8 cm", 1)],
      model="x + y = 24 − 10 = 14 and, by Pythagoras, x² + y² = 100.\n(x + y)² = 196 = x² + y² + 2xy = 100 + 2xy, so xy = 48.\nx and y satisfy t² − 14t + 48 = 0 → (t − 6)(t − 8) = 0.\nSince y > x: x = 6 cm and y = 8 cm (a 6-8-10 triangle)."),
 dict(marks=3, stem="Two spheres with charges of +20 C and +80 C are placed 15 cm apart. Find the position of the point between them where the electric field intensity is zero. (3 marks)",
      kp=[("At the null point the fields of the two charges are equal and opposite: k(20)/d² = k(80)/(15 − d)²", 1), ("(15 − d)/d = √(80/20) = 2, so 15 − d = 2d", 1), ("d = 5 cm from the +20 C charge (10 cm from the +80 C charge)", 1)],
      model="Let the point be d cm from the +20 C charge. Both charges are positive, so their fields point in opposite directions between them, and the field is zero where they are equal:\nk × 20/d² = k × 80/(15 − d)²\n(15 − d)²/d² = 4, so (15 − d)/d = 2 and d = 5 cm.\nThe field is zero 5 cm from the +20 C charge, i.e. 10 cm from the +80 C charge (nearer the smaller charge)."),
 dict(marks=3, stem="Why is sodium chloride not a good conductor of electricity in the solid state, but conducts electricity in the molten state? (3 marks)",
      kp=[("NaCl is an ionic compound made of Na⁺ and Cl⁻ ions; it has no free electrons", 1), ("In the solid the ions are held in fixed positions in the crystal lattice and cannot move, so no current flows", 1),
          ("On melting (or dissolving) the lattice breaks down and the ions are free to move and carry charge, so it conducts", 1)],
      model="Sodium chloride is an ionic compound: a lattice of Na⁺ and Cl⁻ ions held by strong electrostatic forces, with no free electrons. Electric current needs mobile charged particles. In the solid the ions are locked in fixed positions in the crystal lattice, so they cannot move and the solid does not conduct. When NaCl is melted (or dissolved in water) the lattice breaks down and the ions become free to move; Na⁺ moves to the cathode and Cl⁻ to the anode, so molten NaCl conducts electricity (and is decomposed - electrolysis)."),
 dict(marks=3, stem="Why is alum added to water for purification? (3 marks)",
      kp=[("Muddy water contains fine suspended clay/colloidal particles carrying negative charge, which do not settle", 1),
          ("Alum (potash alum) gives Al³⁺ ions which neutralise these charges, so the particles coagulate (flocculate) into larger flocs", 1), ("The heavy flocs settle and are removed by decantation/filtration, leaving clear water; alum also has a mild antiseptic effect", 1)],
      model="Turbid water contains very fine suspended particles of clay and other impurities which are colloidal and negatively charged; they repel each other and do not settle.\nAlum [K₂SO₄·Al₂(SO₄)₃·24H₂O] dissolves to give highly charged Al³⁺ ions, which neutralise the negative charge on the particles. The particles then coagulate (flocculate), forming larger, heavier flocs (helped by Al(OH)₃ formed in water) that settle to the bottom. The clear water can be decanted or filtered. Alum also acts as a mild antiseptic. (This process is called coagulation or flocculation.)"),
 dict(marks=3, stem="Rays of light from a luminous object converge to a focus at a point A. A convex lens of 24 cm focal length is then placed 24 cm from A, so as to intercept the rays before they meet at A. If they now meet at B, find the distance AB. (3 marks)",
      kp=[("A acts as a virtual object 24 cm beyond the lens (u = +24 cm), f = +24 cm", 1), ("Lens formula 1/v − 1/u = 1/f: 1/v = 1/24 + 1/24 = 1/12, so v = 12 cm", 1), ("B is 12 cm from the lens, so AB = 24 − 12 = 12 cm", 1)],
      model="The converging rays would have met at A, 24 cm behind the lens, so A acts as a virtual object with u = +24 cm (Cartesian signs, light travelling left to right). For the convex lens f = +24 cm.\n1/v − 1/u = 1/f → 1/v = 1/24 + 1/24 = 2/24 = 1/12 → v = +12 cm.\nThe rays now meet at B, 12 cm from the lens on the same side as A, so AB = 24 − 12 = 12 cm (B lies between the lens and A)."),
 dict(marks=3, stem="What is Fleming's left-hand rule? (3 marks)",
      kp=[("Used to find the direction of the force (motion) on a current-carrying conductor in a magnetic field (motor rule)", 1),
          ("Stretch the thumb, first finger and second finger of the left hand mutually at right angles", 1), ("First finger = magnetic Field, seCond finger = Current, thuMb = Motion (force)", 1)],
      model="Fleming's left-hand rule gives the direction of the force on a current-carrying conductor placed in a magnetic field - it is used for electric motors.\nHold the thumb, forefinger and middle finger of the left hand mutually at right angles. If the forefinger points in the direction of the magnetic field (N to S) and the middle finger in the direction of the (conventional) current, then the thumb points in the direction of the force, i.e. the motion of the conductor.\n(Memory aid: Father - thuMb - Motion, Forefinger - Field, seCond finger - Current.)"),
 dict(marks=3, stem="What is a nuclear fission reaction? (3 marks)",
      kp=[("Splitting of a heavy nucleus (e.g. U-235) into two medium-sized nuclei when it absorbs a slow neutron", 1),
          ("Example: ²³⁵U + ¹n → ¹⁴¹Ba + ⁹²Kr + 3 ¹n + energy (about 200 MeV per fission), from the mass defect E = Δmc²", 1),
          ("The released neutrons cause further fissions - a chain reaction, controlled in reactors and uncontrolled in atom bombs", 1)],
      model="Nuclear fission is the splitting of a heavy nucleus into two lighter nuclei of comparable size, with the release of neutrons and a large amount of energy. It is usually triggered when a nucleus such as uranium-235 absorbs a slow neutron:\n²³⁵U + ¹n → ¹⁴¹Ba + ⁹²Kr + 3 ¹n + energy (about 200 MeV).\nThe energy comes from the mass defect (the products have slightly less mass, E = Δmc²). The 2-3 neutrons released can split more nuclei, giving a chain reaction: controlled (using moderators and control rods) in nuclear power reactors, and uncontrolled in an atom bomb."),
 dict(marks=3, stem="What do you understand by Artificial Intelligence? (3 marks)",
      kp=[("AI is the branch of computer science that makes machines/software perform tasks that normally need human intelligence", 1),
          ("Such tasks: learning from data, reasoning, problem-solving, understanding language, recognising speech and images, decision-making", 1), ("Examples: expert systems, chess/game programs, speech assistants, machine translation, robotics, self-driving cars, chatbots", 1)],
      model="Artificial Intelligence (AI) is the branch of computer science concerned with building computer systems that can perform tasks which normally require human intelligence - such as learning from experience and data, reasoning, solving problems, understanding natural language, recognising speech and images, and making decisions.\nAI systems use techniques such as rules (expert systems), search, and machine learning (including neural networks).\nExamples: expert systems for medical diagnosis, chess and game-playing programs, voice assistants, machine translation, face recognition, robotics and self-driving cars."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
