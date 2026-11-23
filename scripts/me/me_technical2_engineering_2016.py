"""ME Technical Paper II (General Subject Knowledge), ENGINEERING group, BCSE 2016 (written 1 October 2016) - real paper,
PDF sent by the founder. Same layout as the latest (BCSE 2025) paper: Part I 70 MCQ x 1 (Section A Mathematics 1-20,
B Chemistry 21-40, C Physics 41-60, D General IT 61-70); Part II 10 short answers x 3 - so no marks were changed.
Mathematics retyped from the page images. Pictures: MCQ 48 coils, Part II Q7 logic circuit and Q8 resistor network.
Left out (more than one defensible answer / garbled): MCQ 19 (option list repeats 'gardening'), 24 (H2SO4 bond types -
textbooks differ), 33 (F2 + H2O gives O2 and some O3). Three new MCQs of the same sections keep Part I at 70.
Clarified: MCQ 17 - A and B are the end points of the diameter.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Engineering): BCSE 2016, batch 1"
GROUP_TAG = "eng2016"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "engineering"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2016 Main Examination, Technical Paper II, Engineering", "year": 2016, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Engineering: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Evaluate ∫₁² 9x√(5 − x²) dx.",
"opts": [
"8",
"12",
"14",
"21"
]
},
{
"n": 2,
"stem": "Simplify the determinant |1 x y; 0 cos x sin y; 0 sin x cos y| (rows separated by semicolons).",
"opts": [
"cos(x + y)",
"cos x cos y + sin x sin y",
"1 − cos x sin y",
"2 sin x + cos y"
]
},
{
"n": 3,
"stem": "(3 − 4i) is a complex number. Its square root is",
"opts": [
"±(√3 − 2i)",
"±(2 − i)",
"±(√3 + 2i)",
"±(2 + i)"
]
},
{
"n": 4,
"stem": "The sequence (0.15, 0.015, 0.0015, …) is called a",
"opts": [
"Arithmetic sequence",
"Geometric sequence",
"Fibonacci sequence",
"None of the above"
]
},
{
"n": 5,
"stem": "Find lim (x → 10) of (x² − 100)/(x − 10).",
"opts": [
"0",
"10",
"20",
"∞"
]
},
{
"n": 6,
"stem": "A box of apples cost Nu. 800 in 2014. If the cost increases by 10% in the 2015 and decreases by 5% in 2016, what is the cost of the box of apples in 2016?",
"opts": [
"Nu. 920",
"Nu. 840",
"Nu. 836",
"Nu. 680"
]
},
{
"n": 7,
"stem": "Mr. Kaka takes 2.5 hours to travel from place A to B. If the distance between A and B is 120 Km, by how much should he increase his initial speed to reach place B in 2 hours?",
"opts": [
"12 km/hr",
"48 km/hr",
"53 km/hr",
"60 km/hr"
]
},
{
"n": 8,
"stem": "From the group of 8 students, the chief student councilor and the 2 deputy chief councilors need to be selected. In how many ways can this be done?",
"opts": [
"168 ways",
"224 ways",
"448 ways",
"960 ways"
]
},
{
"n": 9,
"stem": "The value of log₃ 27⁴ is",
"opts": [
"1",
"3",
"6",
"12"
]
},
{
"n": 10,
"stem": "Evaluate ∫ sin(log x)/x dx.",
"opts": [
"−cos(log x) + c",
"sin x + c",
"cos x + c",
"sin²x + c"
]
},
{
"n": 11,
"stem": "If the radius of a sphere is 3 cm, the volume will be equal to",
"opts": [
"67.02 cm³",
"84.82 cm³",
"113.1 cm³",
"150.8 cm³"
]
},
{
"n": 12,
"stem": "If Karma deposits Nu. 1000 in the bank and receives annual interest at the rate of 10% compounded annually. What will be the value of this deposit at the end of 3rd year?",
"opts": [
"Nu. 1300",
"Nu. 1331",
"Nu. 1030",
"Nu. 1330"
]
},
{
"n": 13,
"stem": "The sum of the arithmetic series 5 + 11 + 17 +…….+ 95 is",
"opts": [
"800",
"750",
"600",
"550"
]
},
{
"n": 14,
"stem": "If the sum of diameter and height of a cone is 10 cm, what will be radius of the cone when the volume is maximum?",
"opts": [
"3.33 cm",
"5 cm",
"6.66 cm",
"7 cm"
]
},
{
"n": 15,
"stem": "In a shooting competition, on a scale of 1 to 10, five participants secured 3, 4, 5, 7 and 9 points. Find the mean of the scores.",
"opts": [
"6.43",
"4.64",
"5.60",
"2.15"
]
},
{
"n": 16,
"stem": "The base of a triangle is 5 cm longer than its height and the area of the triangle is 42 sq. cm, then base of the triangle is",
"opts": [
"21 cm",
"12 cm",
"8.4 cm",
"13.4 cm"
]
},
{
"n": 17,
"stem": "If the points A(3, −2) and B(−1, 1) are the end points of a diameter of a circle (units in cm), the length of the radius will be",
"opts": [
"2 cm",
"2.5 cm",
"3 cm",
"3.5 cm"
]
},
{
"n": 18,
"stem": "Which of the following identities is NOT Correct?",
"opts": [
"sin 2θ = 2 sin θ cos θ",
"cos 2θ = 1 − sin²θ",
"sin(90° − θ) = cos θ",
"sin²θ = 1 − cos²θ"
]
},
{
"n": 19,
"stem": "The students at a school each participates in 2 extracurricular activities. They can choose from gardening, dancing, basketball, cooking, singing and football. What is the probability that a student participate in gardening and either cooking, dancing or gardening?",
"opts": [
"0.33",
"0.20",
"0.15",
"0.10"
]
},
{
"n": 20,
"stem": "If y = (8x³ + 1)/(2x + 1), find dy/dx.",
"opts": [
"8x − 2",
"4x² − 1",
"8x + 1",
"4x² − 2x + 1"
]
},
{
"n": 21,
"stem": "Which apparatus is used for the measurement of quantity of electricity?",
"opts": [
"Calorimeter",
"Cathetometer",
"Coulometer",
"Colorimeter"
]
},
{
"n": 22,
"stem": "Which solution will have the highest boiling point?",
"opts": [
"1% solution of glucose in water",
"1% solution of NaCl in water",
"1% solution of ZnSO₄ in water",
"1% solution of urea in water"
]
},
{
"n": 23,
"stem": "The compound which contains both ionic and covalent bonds is",
"opts": [
"CH₄",
"H₂",
"KCN",
"KCl"
]
},
{
"n": 24,
"stem": "H2SO4 has",
"opts": [
"ionic bond",
"both Ionic and covalent bonds",
"ionic, covalent and coordinate bonds",
"covalent bond"
]
},
{
"n": 25,
"stem": "The hybridisation of the carbons (left to right) in CH₃−CH=C=CH₂ is",
"opts": [
"sp3, sp3, sp2, sp2",
"sp3, sp2, sp, sp3",
"sp3, sp3, sp2, sp3",
"sp3, sp2, sp, sp2"
]
},
{
"n": 26,
"stem": "Solid NaCl is a bad conductor of electricity, since",
"opts": [
"in solid NaCl there are no ions",
"solid NaCl is covalent",
"in solid NaCl ions are not mobile",
"in solid NaCl there are no electrons"
]
},
{
"n": 27,
"stem": "Glass is a",
"opts": [
"micro-crystalline solid",
"super cooled liquid",
"gel",
"polymeric mixture"
]
},
{
"n": 28,
"stem": "Precipitation takes place when the product of concentration of ions",
"opts": [
"equals the solubility product",
"exceeds the solubility product",
"is less than the solubility product",
"is negligible"
]
},
{
"n": 29,
"stem": "Which of the following has lowest pH value?",
"opts": [
"1 M HCl",
"1 M NaOH",
"1 M H₂SO₄",
"1 M C₂H₅OH"
]
},
{
"n": 30,
"stem": "Which is correct for an endothermic reaction?",
"opts": [
"∆H is positive",
"∆H is negative",
"∆E is negative",
"∆H = zero"
]
},
{
"n": 31,
"stem": "The function of flux during the smelting of the ore is",
"opts": [
"to make the ore porous",
"to remove gangue",
"to facilitate reduction",
"to facilitate oxidation"
]
},
{
"n": 32,
"stem": "A yellow precipitate is obtained on adding I₂ and NaOH solution to",
"opts": [
"Pb(NO₃)₂ (aq)",
"CuSO₄ (aq)",
"CaCl₂ (aq)",
"MgCl₂ (aq)"
]
},
{
"n": 33,
"stem": "Flourine (F2) reacts with water to give",
"opts": [
"HF + O2",
"HF + OF2",
"HF + O3",
"HF + O2 + O3"
]
},
{
"n": 34,
"stem": "The chemical name of bleaching powder, used to disinfect drinking water, is",
"opts": [
"Calcium hypochlorite",
"Calcium chlorohypochlorite",
"Calcium chlorate",
"Calcium perchlorate"
]
},
{
"n": 35,
"stem": "A solution of SO₂ in water reacts with H₂S to precipitate sulphur. Here SO₂ acts as",
"opts": [
"an oxidizing agent",
"a reducing agent",
"an acid",
"a catalyst"
]
},
{
"n": 36,
"stem": "CH₂=CH₂ (ethene) is a",
"opts": [
"Monomer",
"Polymer",
"Isomer",
"Epimer"
]
},
{
"n": 37,
"stem": "Faraday’s laws of electrolysis are related to the",
"opts": [
"atomic number of the cation",
"atomic number of anion",
"equivalent weight of the electrolyte",
"speed of the cation"
]
},
{
"n": 38,
"stem": "Which is not affected by temperature?",
"opts": [
"Normality",
"Molality",
"Molarity",
"All of the above"
]
},
{
"n": 39,
"stem": "Malachite is a mineral of",
"opts": [
"Mg",
"Cu",
"Al",
"Fe"
]
},
{
"n": 40,
"stem": "A catalyst increases the rate of reaction because it",
"opts": [
"Increases the activation energy",
"Decreases the energy barrier for the reaction",
"Decreases the collision diameter",
"Increases the temperature coefficient"
]
},
{
"n": 41,
"stem": "In the Fleming Left Hand Rule, what does the thumb indicate?",
"opts": [
"Current",
"Magnetic field",
"Voltage",
"Direction of force"
]
},
{
"n": 42,
"stem": "A man picks up a 50 kilogram block and carries it up a flight of stairs 10 meters high. He then carries the block back down the stairs and places the block in its original position. What is the NET work done on the block?",
"opts": [
"1,000 joules",
"750 joules",
"500 joules",
"0 joules"
]
},
{
"n": 43,
"stem": "If the resultant force acting on a body of constant mass is zero, the body's momentum is",
"opts": [
"increasing",
"decreasing",
"always zero",
"constant"
]
},
{
"n": 44,
"stem": "The maximum power dissipated in a 10,000 Ω resistor is 1 W. What is the maximum current?",
"opts": [
"1 A",
"0.001A",
"0.01A",
"0.1A"
]
},
{
"n": 45,
"stem": "A hemisphere is uniformly charged positively. The electric field at a point on a diameter away from the center is directed",
"opts": [
"perpendicular to the diameter",
"parallel to the diameter",
"at an angle tilted towards the diameter",
"at an angle tilted away from the diameter"
]
},
{
"n": 46,
"stem": "When a nucleus in an atom undergoes a radioactive decay, the electronic energy levels of the atom",
"opts": [
"do not change for any type of radioactivity",
"change for α and β radioactivity and not for γ-radioactivity",
"change for α-radioactivity and not for others",
"change for β-radioactivity and not for others"
]
},
{
"n": 47,
"stem": "If a body weighs 12N on the surface of the earth, how much will it weigh on the surface of the moon where acceleration due to gravity is only one-sixth of that on earth's surface?",
"opts": [
"12 N",
"2 N",
"10 N",
"6 N"
]
},
{
"n": 48,
"stem": "There are two coils A and B as shown in the figure below. Current starts flowing in B as shown, when A is moved towards B and stops when A stops moving. The current in A is counter clockwise. B is kept stationary when A moves. We can infer that A B v",
"opts": [
"there is a constant current in the clockwise direction in A",
"there is a varying current in A",
"there is no current in A",
"there is a constant current in the counter clockwise direction in A"
],
"image": "/papers/me/tech2-eng-2016-coils.png"
},
{
"n": 49,
"stem": "The self inductance L of a solenoid of length l and area of cross section A, with a fixed number of turns N increases as",
"opts": [
"l and A increase",
"l increases and A decreases",
"l decreases and A increases",
"both l and A decrease"
]
},
{
"n": 50,
"stem": "In which mirror can a virtual image be formed?",
"opts": [
"Plane mirror",
"Concave spherical mirror",
"Convex spherical mirror",
"All of the above"
]
},
{
"n": 51,
"stem": "The Tesla and the Gauss are units of",
"opts": [
"Conductance",
"Magnetic field strength",
"Magnetic flux",
"Electrical current"
]
},
{
"n": 52,
"stem": "An infinitely long wire carries a current of 3A. The magnetic field outside the wire",
"opts": [
"points radially away from the wire",
"points radially inward",
"circles the wire",
"is zero"
]
},
{
"n": 53,
"stem": "Whose principle or law states that each point on a wave front may be considered a new wave source?",
"opts": [
"Snell's Law",
"Huygen's Principle",
"Young's Law",
"Hertz's Law"
]
},
{
"n": 54,
"stem": "In the sun, helium is produced from hydrogen by",
"opts": [
"radioactive decay",
"disintegration",
"fission",
"fusion"
]
},
{
"n": 55,
"stem": "To convert a galvanometer to a voltmeter, you should add a",
"opts": [
"high resistance in series",
"high resistance in parallel",
"low resistance in series",
"low resistance in parallel"
]
},
{
"n": 56,
"stem": "A satellite of mass \"M\" is in orbit around the earth. If a second satellite of mass \"2M\" is to be placed in the same orbit, the second satellite must have a velocity which is",
"opts": [
"half the velocity of the first satellite",
"the same as the velocity of the first satellite",
"twice the velocity of the first satellite",
"four times the velocity of the first satellite"
]
},
{
"n": 57,
"stem": "A 10 kilogram ball falls from a height of 5 meters and rebounds from the floor to a height of 3 meters. The energy lost by the ball is",
"opts": [
"20 joules",
"98 joules",
"196 joules",
"294 joules"
]
},
{
"n": 58,
"stem": "In N-type semiconductors the majority of the carriers are",
"opts": [
"holes",
"electrons",
"protons",
"neutrons"
]
},
{
"n": 59,
"stem": "If two different gases having the same volume, temperature, and pressure and behave like ideal gases, they will also be identical in which one of the following ways?",
"opts": [
"Average molecular velocity",
"Total mass",
"Total molecular kinetic energy",
"Average momentum per molecule"
]
},
{
"n": 60,
"stem": "Weather satellites transmit cloud cover and temperature-humidity profiles back to Earth using images of which combination of the electromagnetic radiation types?",
"opts": [
"Infra-red and visible light",
"Ultraviolet and nuclear magnetic",
"Ultraviolet and infra-red",
"Ultraviolet and visible light"
]
},
{
"n": 61,
"stem": "The operating system is usually preinstalled on your computer and is responsible for managing the computer. Which of the following is NOT an example of operating system",
"opts": [
"Windows XP",
"Microsoft Word",
"Linux",
"MS-DOS"
]
},
{
"n": 62,
"stem": "The performance of a ________________is measured in bits per second",
"opts": [
"Modem",
"CPU",
"RAM",
"ROM"
]
},
{
"n": 63,
"stem": "Which of the following is NOT a network device",
"opts": [
"Router",
"Hub",
"Modem",
"Joystick"
]
},
{
"n": 64,
"stem": "Application software allows end users to accomplish specific tasks, the examples of application software includes the following EXCEPT",
"opts": [
"Video games",
"Microsoft word",
"Mozilla Firefox",
"Windows Vista"
]
},
{
"n": 65,
"stem": "___________________ involves using a code to convert the file into an unreadable format.",
"opts": [
"Coding",
"Encryption",
"Spamming",
"Trojan"
]
},
{
"n": 66,
"stem": "ADSL is a data communications technology that enables faster data transmission over copper telephone lines rather than a conventional voice band modem can provide and ADSL stands for",
"opts": [
"Asymmetric Digital Subscriber Line.",
"Access Dielectric Standard Link",
"Asymmetric Direct Subscriber Link",
"American Digital Subscriber Link"
]
},
{
"n": 67,
"stem": "A component that stores data so that future requests for that data can be served faster is known as",
"opts": [
"Database",
"Cache",
"Hard disk",
"Memory"
]
},
{
"n": 68,
"stem": "In which of the following form, data is stored in computer?",
"opts": [
"Decimal",
"Binary",
"Hexa Decimal",
"Octal"
]
},
{
"n": 69,
"stem": "A memory bus is mainly used for communication between",
"opts": [
"Processor and memory",
"Memory and input devices",
"Input/Output devices and memory",
"Input and output devices"
]
},
{
"n": 70,
"stem": "A temporary storage area attached to the CPU for input/output operations is known as",
"opts": [
"Chip",
"Buffer",
"Register",
"Core"
]
}
]"""

KEY = {
 1: ("d", "Let u = 5 − x², du = −2x dx: ∫9x√(5 − x²)dx = −3(5 − x²)^(3/2). From 1 to 2: −3[1^(3/2) − 4^(3/2)] = −3(1 − 8) = 21."),
 2: ("a", "Expand along the first column: 1 × (cos x cos y − sin x sin y) = cos(x + y)."),
 3: ("b", "(2 − i)² = 4 − 4i + i² = 3 − 4i, so √(3 − 4i) = ±(2 − i)."),
 4: ("b", "Each term is 1/10 of the one before (constant ratio 0.1), so it is a geometric sequence."),
 5: ("c", "(x² − 100)/(x − 10) = x + 10 for x ≠ 10, so the limit is 20."),
 6: ("c", "800 × 1.10 = 880 in 2015; 880 × 0.95 = Nu. 836 in 2016."),
 7: ("a", "Initial speed = 120/2.5 = 48 km/h; needed speed = 120/2 = 60 km/h; increase = 12 km/h."),
 8: ("a", "Choose the chief in 8 ways, then the 2 deputies from the other 7 in C(7, 2) = 21 ways: 8 × 21 = 168."),
 9: ("d", "27⁴ = (3³)⁴ = 3¹², so log₃ 27⁴ = 12."),
 10: ("a", "Let u = log x, du = dx/x: ∫sin u du = −cos u + c = −cos(log x) + c."),
 11: ("c", "V = (4/3)πr³ = (4/3)π(27) = 36π ≈ 113.1 cm³."),
 12: ("b", "A = 1000 × 1.1³ = Nu. 1331."),
 13: ("a", "a = 5, d = 6, last term 95: n = (95 − 5)/6 + 1 = 16. Sum = 16/2 × (5 + 95) = 800."),
 14: ("a", "2r + h = 10, so V = (1/3)πr²(10 − 2r). dV/dr = (π/3)(20r − 6r²) = 0 gives r = 10/3 ≈ 3.33 cm."),
 15: ("c", "Mean = (3 + 4 + 5 + 7 + 9)/5 = 28/5 = 5.60."),
 16: ("b", "Base = h + 5 and ½h(h + 5) = 42, so h² + 5h − 84 = 0, h = 7 and base = 12 cm."),
 17: ("b", "AB = √[(3 + 1)² + (−2 − 1)²] = √(16 + 9) = 5 cm, so the radius is 2.5 cm."),
 18: ("b", "cos 2θ = 1 − 2sin²θ (or cos²θ − sin²θ), not 1 − sin²θ (which equals cos²θ)."),
 20: ("a", "8x³ + 1 = (2x + 1)(4x² − 2x + 1), so y = 4x² − 2x + 1 and dy/dx = 8x − 2."),
 21: ("c", "A coulometer (voltameter) measures the quantity of electricity (charge) by the amount of substance deposited."),
 22: ("b", "Boiling-point elevation depends on the number of particles: per gram, NaCl (2 ions, M = 58.5) gives the most particles."),
 23: ("c", "KCN has an ionic bond between K⁺ and CN⁻ and a covalent triple bond inside CN⁻."),
 25: ("d", "CH₃ is sp³, the CH= carbon is sp², the central =C= carbon is sp and the terminal =CH₂ is sp²."),
 26: ("c", "Solid NaCl is made of ions, but they are fixed in the crystal lattice; they conduct only when free to move (molten or dissolved)."),
 27: ("b", "Glass is an amorphous solid traditionally described as a supercooled liquid (it has no sharp melting point)."),
 28: ("b", "A precipitate forms when the ionic product exceeds the solubility product (Ksp)."),
 29: ("c", "1 M H₂SO₄ is diprotic and gives the highest H⁺ concentration, so the lowest pH."),
 30: ("a", "An endothermic reaction absorbs heat, so ΔH is positive."),
 31: ("b", "A flux combines with the gangue (impurities) to form a fusible slag that is removed."),
 32: ("a", "I₂ in NaOH gives iodide ions, and Pb²⁺ + 2I⁻ → PbI₂, a bright yellow precipitate."),
 34: ("b", "Bleaching powder, CaOCl₂, is calcium chlorohypochlorite (also called calcium oxychloride)."),
 35: ("a", "SO₂ + 2H₂S → 3S + 2H₂O: SO₂ is reduced (S from +4 to 0), so it acts as an oxidising agent."),
 36: ("a", "Ethene is the monomer that polymerises to polyethylene."),
 37: ("c", "Faraday's second law: masses deposited by the same charge are proportional to the equivalent weights."),
 38: ("b", "Molality uses mass of solvent, which does not change with temperature; normality and molarity use volume, which does."),
 39: ("b", "Malachite, Cu₂CO₃(OH)₂, is an ore of copper."),
 40: ("b", "A catalyst provides a path with lower activation energy (lowers the energy barrier)."),
 41: ("d", "Fleming's left-hand rule: thumb = force (motion), first finger = field, second finger = current."),
 42: ("d", "The block returns to its starting position, so its net change in energy, and the net work done on it, is zero."),
 43: ("d", "Zero resultant force means zero rate of change of momentum, so momentum is constant."),
 44: ("c", "P = I²R: I = √(1/10,000) = 0.01 A."),
 45: ("a", "By symmetry, at any point on the flat face (the diameter) of a uniformly charged hemisphere the field is perpendicular to that face."),
 46: ("b", "α and β decay change the atomic number (nuclear charge), so electron energy levels change; γ decay does not change the charge."),
 47: ("b", "Weight on the moon = 12/6 = 2 N."),
 48: ("d", "A current is induced in B only while A moves (changing flux), so A carries a steady current - counter-clockwise, as stated."),
 49: ("c", "L = μ₀N²A/l, so L increases when l decreases and A increases."),
 50: ("d", "Plane, concave (object inside focus) and convex mirrors can all form virtual images."),
 51: ("b", "Tesla (SI) and gauss (CGS) are units of magnetic field strength (magnetic flux density B); 1 T = 10⁴ G."),
 52: ("c", "The field lines of a straight current are circles around the wire."),
 53: ("b", "Huygens' principle: every point on a wavefront acts as a source of secondary wavelets."),
 54: ("d", "Hydrogen nuclei fuse to form helium in the sun (nuclear fusion)."),
 55: ("a", "A high resistance in series converts a galvanometer into a voltmeter."),
 56: ("b", "Orbital speed v = √(GM_earth/r) does not depend on the satellite's mass."),
 57: ("c", "Energy lost = mg(5 − 3) = 10 × 9.8 × 2 = 196 J."),
 58: ("b", "In n-type semiconductors the majority carriers are electrons."),
 59: ("c", "Same P, V and T means the same number of moles, so the same total translational kinetic energy (3/2 nRT)."),
 60: ("a", "Weather satellites image clouds in visible light and temperature/humidity in infrared."),
 61: ("b", "Microsoft Word is application software, not an operating system."),
 62: ("a", "Modem speed is measured in bits per second (bps)."),
 63: ("d", "A joystick is an input device, not a network device."),
 64: ("d", "Windows Vista is an operating system (system software), not application software."),
 65: ("b", "Encryption converts data into an unreadable form using a code (key)."),
 66: ("a", "ADSL = Asymmetric Digital Subscriber Line."),
 67: ("b", "A cache stores data so that future requests are served faster."),
 68: ("b", "Computers store data in binary (0s and 1s)."),
 69: ("a", "The memory bus connects the processor and main memory."),
 70: ("b", "A buffer is temporary storage used during input/output transfers."),
}

NEW_MCQ = [
    ("If f(x) = 3x² − 4x + 2, then f′(2) is", ["6", "8", "10", "12"], "b", "f′(x) = 6x − 4, so f′(2) = 12 − 4 = 8."),
    ("The oxidation number of chromium in K₂Cr₂O₇ is", ["+3", "+4", "+6", "+7"], "c", "2(+1) + 2x + 7(−2) = 0 gives 2x = 12, so x = +6."),
    ("Which of the following is an amphoteric oxide?", ["Na₂O", "Al₂O₃", "SO₃", "CaO"], "b", "Al₂O₃ reacts with both acids and bases; Na₂O and CaO are basic, SO₃ is acidic."),
]

SAQ = [
 dict(marks=3, stem="The sum of 3 numbers A, B and C is 18. The ratio of A to B is 2 : 3 and the ratio of B to C is 3 : 4. Find the values of A, B and C. (3 marks)",
      kp=[("Combine the ratios: A : B : C = 2 : 3 : 4 (total 9 parts)", 1), ("One part = 18/9 = 2", 1), ("A = 4, B = 6, C = 8", 1)],
      model="A : B = 2 : 3 and B : C = 3 : 4, so A : B : C = 2 : 3 : 4 (9 parts). One part = 18/9 = 2. A = 2 × 2 = 4, B = 3 × 2 = 6, C = 4 × 2 = 8. (Check: 4 + 6 + 8 = 18.)"),
 dict(marks=3, stem="Given that y(x) = (x + 2)(2x + 1)², determine the equation of the tangent to the curve at the point x = −3. (3 marks)",
      kp=[("Point: y(−3) = (−1)(−5)² = −25, so (−3, −25)", 1), ("dy/dx = (2x + 1)² + 4(x + 2)(2x + 1); at x = −3 slope = 25 + 20 = 45", 1), ("Tangent: y + 25 = 45(x + 3), i.e. y = 45x + 110", 1)],
      model="At x = −3: y = (−3 + 2)(2(−3) + 1)² = (−1)(25) = −25.\nProduct rule: dy/dx = (2x + 1)² + (x + 2) × 2(2x + 1) × 2 = (2x + 1)² + 4(x + 2)(2x + 1).\nAt x = −3: dy/dx = 25 + 4(−1)(−5) = 45.\nTangent: y − (−25) = 45(x + 3), so y = 45x + 110."),
 dict(marks=3, stem="The following marks were scored by a class of 20 students in a mathematics test:\n15, 20, 30, 25, 30, 45, 50, 70, 60, 43, 33, 42, 45, 38, 80, 55, 40, 70, 78, 50\na) What is the mean mark of the class? (1 mark)\nb) What is the standard deviation of the marks? (1 mark)\nc) What percentage of the students scored within one standard deviation of the mean? (1 mark)",
      kp=[("a) Σx = 919, mean = 919/20 = 45.95", 1), ("b) σ = √[Σ(x − x̄)²/n] ≈ 18.07 (sample s ≈ 18.53 also accepted)", 1), ("c) 27.9 to 64.0 contains 13 of 20 marks = 65%", 1)],
      model="a) Σx = 919, so the mean = 919/20 = 45.95.\nb) Σ(x − x̄)² = 6,526.95; σ = √(6,526.95/20) = √326.35 ≈ 18.07 (treating the class as the population; the sample SD with n − 1 is 18.53).\nc) Mean ± 1 SD = 45.95 ± 18.07 = 27.88 to 64.02. Marks in this range: 30, 30, 45, 50, 60, 43, 33, 42, 45, 38, 55, 40, 50 - 13 students, so 13/20 = 65%."),
 dict(marks=3, stem="Complete the following reactions and balance the equations:\na) …… + NaCl → NaHCO₃ + NH₄Cl (1 mark)\nb) Cu + HNO₃ → CuO + …… + H₂O (1 mark)\nc) H₂SO₄ + …… → Al₂(SO₄)₃ + H₂O (1 mark)",
      kp=[("a) NH₄HCO₃ + NaCl → NaHCO₃ + NH₄Cl (or NH₃ + CO₂ + H₂O + NaCl → NaHCO₃ + NH₄Cl, Solvay process)", 1), ("b) Cu + 2HNO₃ → CuO + 2NO₂ + H₂O", 1), ("c) 3H₂SO₄ + 2Al(OH)₃ → Al₂(SO₄)₃ + 6H₂O", 1)],
      model="a) NH₄HCO₃ + NaCl → NaHCO₃ + NH₄Cl (the Solvay process step; equivalently NH₃ + CO₂ + H₂O + NaCl → NaHCO₃ + NH₄Cl).\nb) Cu + 2HNO₃ → CuO + 2NO₂ + H₂O (concentrated nitric acid oxidises copper and is reduced to nitrogen dioxide).\nc) 3H₂SO₄ + 2Al(OH)₃ → Al₂(SO₄)₃ + 6H₂O (acid + base → salt + water)."),
 dict(marks=3, stem="Calculate the pH of a buffer solution containing 0.15 moles of NH₄OH and 0.25 moles of NH₄Cl. (Kb for NH₄OH is 1.98 × 10⁻⁵) (3 marks)",
      kp=[("Henderson equation for a basic buffer: pOH = pKb + log([salt]/[base])", 1), ("pKb = 4.70; pOH = 4.70 + log(0.25/0.15) = 4.70 + 0.22 = 4.93", 1), ("pH = 14 − 4.93 = 9.07 (≈ 9.08)", 1)],
      model="For a basic buffer: pOH = pKb + log([salt]/[base]).\npKb = −log(1.98 × 10⁻⁵) = 4.703.\npOH = 4.703 + log(0.25/0.15) = 4.703 + 0.222 = 4.925.\npH = 14 − 4.925 = 9.075 ≈ 9.08."),
 dict(marks=3, stem="Briefly answer the following questions:\na) What is the word that describes a substance which reacts with both strong bases and strong acids? (1 mark)\nb) What is the name of the point on a phase diagram which indicates the temperature above which a gas cannot be converted to a liquid? (1 mark)\nc) What is the most abundant element in the human body? (1 mark)",
      kp=[("a) Amphoteric", 1), ("b) Critical point (critical temperature)", 1), ("c) Oxygen (by mass, about 65%)", 1)],
      model="a) Amphoteric (e.g. Al₂O₃, ZnO).\nb) The critical point - above the critical temperature a gas cannot be liquefied by pressure alone.\nc) Oxygen (about 65% of body mass, mostly in water)."),
 dict(marks=3, image="/papers/me/tech2-eng-2016-logic.png", stem="Answer the following with reference to the logic circuit shown (A and B feed one OR gate, B and C feed a second OR gate, and the two outputs feed an AND gate).\na) Write the Boolean expression for the circuit diagram. (1 mark)\nb) Name four types of gates. (1 mark)\nc) What is used in a gate to establish how the input values map to the output value? (1 mark)",
      kp=[("a) Y = (A + B) · (B + C)", 1), ("b) Any four: AND, OR, NOT, NAND, NOR, XOR, XNOR", 1), ("c) A truth table (the Boolean function of the gate)", 1)],
      model="a) The upper OR gate gives A + B and the lower OR gate gives B + C; the AND gate gives Y = (A + B)(B + C), which simplifies to B + AC.\nb) AND, OR, NOT and NAND (also NOR, XOR, XNOR).\nc) A truth table, which lists the output for every combination of input values (the gate's Boolean function)."),
 dict(marks=3, image="/papers/me/tech2-eng-2016-resistors.png", stem="Find the equivalent resistance R_EQ between A and B for the resistor combination circuit shown. (3 marks)",
      kp=[("Reduce from the far end: (R8 + R10) = 12 Ω ∥ R9 6 Ω = 4 Ω; + R7 8 Ω = 12 Ω ∥ R6 6 Ω = 4 Ω", 1), ("+ R5 4 Ω = 8 Ω ∥ R4 8 Ω = 4 Ω; + R3 4 Ω = 8 Ω ∥ R2 8 Ω = 4 Ω", 1), ("+ R1 6 Ω: R_EQ = 10 Ω", 1)],
      model="Work from the right-hand end towards A and B.\nR8 + R10 = 10 + 2 = 12 Ω, in parallel with R9 = 6 Ω: 12 × 6/18 = 4 Ω.\nAdd R7 = 8 Ω in series: 12 Ω, in parallel with R6 = 6 Ω: 4 Ω.\nAdd R5 = 4 Ω: 8 Ω, in parallel with R4 = 8 Ω: 4 Ω.\nAdd R3 = 4 Ω: 8 Ω, in parallel with R2 = 8 Ω: 4 Ω.\nAdd R1 = 6 Ω in series: R_EQ = 10 Ω."),
 dict(marks=3, stem="Explain why an object orbiting the Earth is said to be freely falling. Use your explanation to point out why objects appear weightless under certain circumstances. (3 marks)",
      kp=[("The only force on an orbiting object is gravity, so it is continuously accelerating towards Earth - it is in free fall", 1),
          ("Its sideways speed is so large that as it falls it keeps 'missing' the Earth, so it follows a curved orbit instead of hitting the ground", 1),
          ("Everything inside falls with the same acceleration, so there is no normal (contact) force from the floor/scale - apparent weightlessness, although gravity still acts", 1)],
      model="An orbiting object (e.g. a satellite) has only one force acting on it - Earth's gravity. It therefore accelerates towards the centre of the Earth all the time, which is exactly what free fall means. It does not hit the ground because it also moves sideways fast enough that, as it falls, the Earth's surface curves away beneath it: it keeps falling around the Earth.\nAn astronaut and the spacecraft fall together with the same acceleration, so the floor does not push up on the astronaut and a scale reads zero. Weight as we feel it is this contact (normal) force, so the astronaut appears weightless - even though gravity (about 90% of its surface value at the ISS height) is still acting. The same happens in a freely falling lift."),
 dict(marks=3, stem="What is an IP address? How do you view the IP address on your computer? Provide an example of the IP address format. (3 marks)",
      kp=[("An IP (Internet Protocol) address is a unique numerical label that identifies a device on a network/the Internet", 1),
          ("View it with ipconfig (Windows command prompt) or ifconfig / ip addr (Linux/macOS), or in the network settings", 1),
          ("Example: IPv4 192.168.1.10 (four numbers 0-255 separated by dots); IPv6 e.g. 2001:db8::1", 1)],
      model="An IP (Internet Protocol) address is a unique numerical address given to each device on a network so that data can be sent to and from it - like a postal address for a computer.\nTo view it: on Windows open Command Prompt and type ipconfig; on Linux or macOS use ifconfig or ip addr; or look in the network connection settings.\nFormat: IPv4 uses four numbers from 0 to 255 separated by dots, e.g. 192.168.1.10 (32 bits); IPv6 uses eight groups of hexadecimal digits separated by colons, e.g. 2001:0db8:0000:0000:0000:0000:0000:0001 (128 bits)."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
