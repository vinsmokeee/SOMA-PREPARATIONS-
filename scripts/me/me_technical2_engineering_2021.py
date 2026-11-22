"""ME Technical Paper II (General Subject Knowledge), ENGINEERING group, BCSE 2021 (written 30 October 2021) - real
paper (PDF sent by the founder). Same pattern as 2025: Part I 70 MCQ x 1 (Section A Mathematics 1-20, B Chemistry 21-40,
C Physics 41-60, D General IT 61-70); Part II 10 short answers x 3. Mathematics retyped from the page images.
Left out: MCQ 16 (the triangle in a semicircle is both right-angled and scalene - two options are true). One new MCQ keeps
Part I at 70. Clarified: MCQ 3 gives the range of x for which cos⁻¹(4x³ − 3x) = 3cos⁻¹x; MCQ 6 prints '= Q' (read as
= 0); MCQ 27 - the eye irritant is a volatile sulphur compound (syn-propanethial-S-oxide); MCQ 58 options are printed in
kg. Pictures: MCQ 50 circuit, Part II Q4 atoms and Q9 Wheatstone bridge.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Engineering): BCSE 2021, batch 1"
GROUP_TAG = "eng2021"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "engineering"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2021 Main Examination, Technical Paper II, Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Engineering: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "If A, B and C are three sets such that A ∩ B = A ∩ C and A ∪ B = A ∪ C, then",
"opts": [
"A = B",
"A = C",
"B = C",
"A ∩ B = ∅"
]
},
{
"n": 2,
"stem": "The range of the function f(x) = √[(x − 1)(3 − x)] is",
"opts": [
"[1, 3]",
"[0, 1]",
"[−2, 2]",
"None of the above"
]
},
{
"n": 3,
"stem": "For 1/2 ≤ x ≤ 1, the simplified form of cos⁻¹(4x³ − 3x) is",
"opts": [
"3 sin⁻¹x",
"3 cos⁻¹x",
"π − 3 sin⁻¹x",
"None of the above"
]
},
{
"n": 4,
"stem": "If [1 − x, 2; 18, 6] = [6, 2; 18, 6] (rows separated by ';'), then x =",
"opts": [
"±6",
"6",
"−5",
"7"
]
},
{
"n": 5,
"stem": "If y = log[(1 − x²)/(1 + x²)], then dy/dx is equal to",
"opts": [
"4x³/(1 − x⁴)",
"−4x/(1 − x⁴)",
"1/(4 − x⁴)",
"−4x³/(1 − x⁴)"
]
},
{
"n": 6,
"stem": "The solution of the differential equation x dy − y dx = 0 represents",
"opts": [
"a rectangular hyperbola",
"a parabola whose vertex is at the origin",
"a straight line passing through the origin",
"a circle whose centre is at the origin"
]
},
{
"n": 7,
"stem": "If a = 2i − 5j + k and b = 4i + 2j + k, then a · b =",
"opts": [
"0",
"−1",
"1",
"2"
]
},
{
"n": 8,
"stem": "The equation of the plane through the point (1, 2, −3) which is parallel to the plane 3x − 5y + 2z = 11 is",
"opts": [
"3x − 5y + 2z − 13 = 0",
"5x − 3y + 2z + 13 = 0",
"3x − 2y + 5z + 13 = 0",
"3x − 5y + 2z + 13 = 0"
]
},
{
"n": 9,
"stem": "A pair of dice is rolled. The probability of getting an even prime number on each die is",
"opts": [
"1/36",
"1/12",
"1/6",
"0"
]
},
{
"n": 10,
"stem": "The value of lim (x → 2) (3x² − x − 10)/(x² − 4) is",
"opts": [
"11/4",
"8/4",
"2/4",
"4/6"
]
},
{
"n": 11,
"stem": "The maximum value of the slope of the curve y = −x³ + 3x² + 12x − 5 is",
"opts": [
"15",
"12",
"9",
"0"
]
},
{
"n": 12,
"stem": "The value of sin⁻¹(cos 3π/5) is",
"opts": [
"π/10",
"3π/5",
"−π/10",
"−3π/5"
]
},
{
"n": 13,
"stem": "∫ from 0 to π/8 of tan²(2x) dx is equal to",
"opts": [
"(4 − π)/8",
"(4 + π)/8",
"(4 − π)/4",
"(4 − π)/2"
]
},
{
"n": 14,
"stem": "A tank can be filled by pipe A in 5 hours and by pipe B in 8 hours, each working on its own. When the tank is full and a drainage hole is open, the water drains in 20 hours. If the tank was empty and the two pumps were started together with the drainage hole left open, how long does it take to fill the tank?",
"opts": [
"2.5 hours",
"3.6 hours",
"7 hours",
"6 hours"
]
},
{
"n": 15,
"stem": "Tashi drives a distance of 200 km to reach the town. If the car's speed is increased by 10 km/hr above its usual speed, Tashi takes 1 hour less to cover the same distance. What is the usual speed of the car?",
"opts": [
"40 km/hr",
"50 km/hr",
"30 km/hr",
"60 km/hr"
]
},
{
"n": 17,
"stem": "The expression 50/∛5 may be simplified to",
"opts": [
"10",
"2(5^(5/3))",
"2(5^(7/3))",
"5√5"
]
},
{
"n": 18,
"stem": "The sum of a rational number and an irrational number is",
"opts": [
"a rational number",
"an irrational number",
"both",
"none of the above"
]
},
{
"n": 19,
"stem": "If the lines representing the pair of linear equations a₁x + b₁y + c₁ = 0 and a₂x + b₂y + c₂ = 0 are coincident, then",
"opts": [
"a₁/a₂ = b₁/b₂",
"a₁/a₂ = b₁/b₂ = c₁/c₂",
"a₁/a₂ ≠ b₁/b₂",
"a₁/a₂ = b₁/b₂ ≠ c₁/c₂"
]
},
{
"n": 20,
"stem": "A quadratic equation ax² + bx + c = 0 has no real roots if",
"opts": [
"b² − 4ac < 0",
"b² − 4ac = 0",
"b² − 4ac > 0",
"b² − ac < 0"
]
},
{
"n": 21,
"stem": "The essential element for batteries used in electric cars is",
"opts": [
"Magnesium",
"Lithium",
"Sodium",
"Bromine"
]
},
{
"n": 22,
"stem": "Which of the following is not part of Dalton’s atomic theory?",
"opts": [
"All matter is composed of indivisible atoms.",
"Atoms of the same element can be different.",
"Compounds are formed when atoms combine in whole number ratios.",
"A chemical reaction involves rearrangement of atoms."
]
},
{
"n": 23,
"stem": "____________ is the unit of the scale used for measurement of the spicy heat of a chilli pepper?",
"opts": [
"Smith",
"Scoville",
"Wright",
"Orville"
]
},
{
"n": 24,
"stem": "The most suitable method for ore concentration when the ore is soluble in some suitable solvent is",
"opts": [
"Hydraulic Washing",
"Magnetic Separation",
"Froth floatation",
"Leaching"
]
},
{
"n": 25,
"stem": "Choose the correct statement about the modern periodic table:",
"opts": [
"Elements in any one group contain the same number of valence electrons.",
"Elements in any one period contain the same number of shells.",
"Both a) and b)",
"None of the above"
]
},
{
"n": 26,
"stem": "The chemical formula of rust is",
"opts": [
"Fe₂O₃·nH₂O",
"Fe₂Cl₃·nH₂O",
"FeCO₂·nH₂O",
"FeO·nH₂O"
]
},
{
"n": 27,
"stem": "Which of the following is responsible for the burning of eyes when we cut an onion?",
"opts": [
"Chlorine",
"Sulphur (a volatile sulphur compound)",
"Helium",
"Methane"
]
},
{
"n": 28,
"stem": "The correct increasing order of pH values of the following substances is",
"opts": [
"Gastric Juice < Milk Of Magnesia < Citric Juice < Pure Water",
"Citric Juice < Gastric Juice < Pure Water < Milk Of Magnesia",
"Gastric Juice < Citric Juice < Pure Water < Milk Of Magnesia",
"Gastric Juice < Citric Juice < Milk Of Magnesia < Pure Water"
]
},
{
"n": 29,
"stem": "Which of the following has the longest wavelength?",
"opts": [
"X rays",
"Microwaves",
"Green light",
"UV light"
]
},
{
"n": 30,
"stem": "Which substance is oxidised in the reaction Zn(s) + Cu²⁺(aq) → Zn²⁺(aq) + Cu(s)?",
"opts": [
"Copper, because it gains electrons",
"Zinc, because it gains electrons",
"Zinc, because it loses electrons",
"Copper, because it loses electrons"
]
},
{
"n": 31,
"stem": "The hydrocarbon C₄H₈ was burnt in air and incomplete combustion occurred. Which equation correctly represents the incomplete combustion?",
"opts": [
"C₄H₈ + 4O → 4CO + 4H₂",
"C₄H₈ + 4O₂ → 4CO + 4H₂O",
"C₄H₈ + 6O₂ → 4CO₂ + 4H₂O",
"C₄H₈ + 8O → 4CO₂ + 4H₂"
]
},
{
"n": 32,
"stem": "Which statement best describes the chemistry of soaps?",
"opts": [
"They contain both a nonpolar group and a polar group.",
"They contain only a nonpolar group.",
"They contain only a charged group.",
"They are highly polar, charged compounds."
]
},
{
"n": 33,
"stem": "Which compound is the most acidic?",
"opts": [
"ClCH₂CO₂H",
"FCH₂CO₂H",
"BrCH₂CO₂H",
"ICH₂CO₂H"
]
},
{
"n": 34,
"stem": "All of the following are reducing sugar EXCEPT",
"opts": [
"D-fructose",
"D-ribose",
"Sucrose",
"Cellobiose"
]
},
{
"n": 35,
"stem": "______________ is the least active metal.",
"opts": [
"Aluminum",
"Iron",
"Platinum",
"Magnesium"
]
},
{
"n": 36,
"stem": "Mayonnaise is",
"opts": [
"a coalescent solution.",
"a hydrogenated oil.",
"an emulsion.",
"a covalent solution."
]
},
{
"n": 37,
"stem": "The element that is expected to behave most like magnesium is",
"opts": [
"Sodium",
"Calcium",
"Aluminum",
"Scandium"
]
},
{
"n": 38,
"stem": "The correct formula of the compound formed by fluorine and aluminium is",
"opts": [
"Al₃F₇",
"Al₅F",
"AlF₃",
"Al₇F₃"
]
},
{
"n": 39,
"stem": "_______________ is most likely to lose electrons in an ionic compound.",
"opts": [
"Oxygen (O)",
"Hydrogen (H)",
"Carbon (C)",
"Lead (Pb)"
]
},
{
"n": 40,
"stem": "The 2021 Nobel Prize in Chemistry has been awarded to German scientist Benjamin List of the Max Planck Institute and Scotland-born scientist David W.C. MacMillan of Princeton University for",
"opts": [
"the development of a method for genome editing.",
"the development of lithium-ion batteries.",
"the development of asymmetric organocatalysis.",
"the directed evolution of enzymes."
]
},
{
"n": 41,
"stem": "This is one-atom-thick layer of carbon atoms arranged in a hexagonal lattice. The groundbreaking experiments regarding its two-dimensional material resulted in winning the Nobel Prize in Physics in 2010. The “wonder material” is",
"opts": [
"Silicene",
"Graphene",
"Stanene",
"All of the above"
]
},
{
"n": 42,
"stem": "The pulling sensation when we stand near a running train can be explained on the basis of",
"opts": [
"Archimedes Principle",
"Bernoulli’s law",
"Avogadro’s Hypothesis",
"Newton’s Third Law of motion"
]
},
{
"n": 43,
"stem": "You are sitting inside an open vehicle moving with uniform speed. When you throw a stone vertically upwards, the stone will fall",
"opts": [
"Ahead of you",
"Behind you",
"Over you",
"Either ahead or behind of you"
]
},
{
"n": 44,
"stem": "The X-ray crystallography mainly uses which among the following properties of electromagnetic radiation?",
"opts": [
"Reflection",
"Interference",
"Diffraction",
"Refraction"
]
},
{
"n": 45,
"stem": "What is the charge of a p-type semiconductor?",
"opts": [
"Positive",
"Negative",
"Neutral",
"None of the above"
]
},
{
"n": 46,
"stem": "What is the eye defect when a person can see nearby objects clearly but cannot see distant objects distinctly?",
"opts": [
"Cataract",
"Hypermetropia",
"Myopia",
"Presbyopia"
]
},
{
"n": 47,
"stem": "The SI unit of latent heat of fusion is",
"opts": [
"J kg⁻¹ K⁻¹",
"J kg⁻¹",
"J kg⁻²",
"J kg K⁻¹"
]
},
{
"n": 48,
"stem": "What happens to the time period of the simple pendulum if the solid bob is replaced by a hollow sphere of same radius but half the mass?",
"opts": [
"Time period remains unchanged.",
"Time period becomes double.",
"Time period becomes half.",
"Time period becomes four times."
]
},
{
"n": 49,
"stem": "Which of the following instruments is used to measure the relative density of a liquid?",
"opts": [
"Hygrometer",
"Lactometer",
"Gravitometer",
"Hydrometer"
]
},
{
"n": 50,
"stem": "Determine the current I₄ through resistor R₄ in the circuit shown in the figure, powered by a 24 V source (R₁ = 5 Ω, R₂ = 4 Ω, R₃ = 12 Ω, R₄ = 8 Ω; R₂ and R₃ in parallel).",
"opts": [
"1.0 A",
"1.12 A",
"1.50 A",
"0.38 A"
],
"image": "/papers/me/tech2-eng-2021-m50.png"
},
{
"n": 51,
"stem": "A 4.0 kg object is moving across a friction-free surface with a constant velocity of 2 m/s. Which one of the following horizontal forces is necessary to maintain this state of motion?",
"opts": [
"0 N",
"0.5 N",
"2.0 N",
"8.0 N"
]
},
{
"n": 52,
"stem": "A charged particle, after being accelerated through a potential difference V, enters a uniform magnetic field and moves in a circle of radius r. If V is doubled, the radius of the circle becomes",
"opts": [
"2r",
"4r",
"r/√2",
"√2 r"
]
},
{
"n": 53,
"stem": "The phase difference between the current and voltage in series LCR circuit at resonance is",
"opts": [
"π",
"π/2",
"π/3",
"0"
]
},
{
"n": 54,
"stem": "What is the density of a block of metal which weighs 60 N in air and 40 N under water?",
"opts": [
"1000 kg/m³",
"3000 kg/m³",
"5000 kg/m³",
"7000 kg/m³"
]
},
{
"n": 55,
"stem": "The potential difference across a 4 ohm resistor is 20 volts. Assuming that all of the energy dissipated by this resistor is in the form of heat, how many joules of heat are radiated in 10 seconds?",
"opts": [
"1000 J",
"800 J",
"2000 J",
"100 J"
]
},
{
"n": 56,
"stem": "A girl throws a 0.1kg ball at a wall. The ball hits the wall perpendicularly with a velocity of 5 m/s and then bounces straight back with a velocity of 4 m/s. The change in the momentum of the ball is",
"opts": [
"0.1 kgm/s",
"0.4 kgm/s",
"0.5 kgm/s",
"0.9 kgm/s"
]
},
{
"n": 57,
"stem": "How many times more intense is 80 decibel sound than a 40-decibel sound?",
"opts": [
"2",
"40",
"1000",
"10000"
]
},
{
"n": 58,
"stem": "What is the weight of a 70 kg astronaut in space, far from any planets? (options as printed)",
"opts": [
"0 kg",
"140 kg",
"35 kg",
"210 kg"
]
},
{
"n": 59,
"stem": "In AC circuit theory, the term that replaces the resistance is",
"opts": [
"Inductance",
"Capacitance",
"Impedance",
"Reactance"
]
},
{
"n": 60,
"stem": "An object is located 1m in front of a converging lens having a focal length of 20 cm. At what distance behind the lens (whose thickness is negligible) will the image be formed?",
"opts": [
"18 cm",
"20 cm",
"25 cm",
"22 cm"
]
},
{
"n": 61,
"stem": "Which programming language is exclusively used for artificial intelligence?",
"opts": [
"Java",
"J2EE",
"Prolog",
"C"
]
},
{
"n": 62,
"stem": "Which one of the following operating systems is produced by IBM?",
"opts": [
"OS-2",
"Windows",
"DOS",
"UNIX"
]
},
{
"n": 63,
"stem": "Which of the following is NOT the function of an Operating System?",
"opts": [
"Memory Management",
"Input/Output Management",
"Job Scheduling",
"Database Management"
]
},
{
"n": 64,
"stem": "Facebook has expanded far beyond its original social networking platform since its inception. It has made following business acquisitions EXCEPT",
"opts": [
"WhatsApp",
"Snapchat",
"Instagram",
"Oculus VR"
]
},
{
"n": 65,
"stem": "System software is an interface between",
"opts": [
"Hardware and Application Software",
"Application software and Use.",
"RAM and ROM",
"CPU and UPS"
]
},
{
"n": 66,
"stem": "IM technology is a type of online chat allowing real-time text transmission over the Internet or another computer network. What does IM stands for?",
"opts": [
"Inter Message",
"Instant Messaging",
"Inter Modulation",
"Internal Messaging"
]
},
{
"n": 67,
"stem": "Which one of the following represents the binary equivalent of the decimal number 23?",
"opts": [
"01011",
"10111",
"10011",
"11011"
]
},
{
"n": 68,
"stem": "The term used to describe a memory location whose value changes during program execution is",
"opts": [
"Constant",
"Variable",
"Volatile",
"Dynamic"
]
},
{
"n": 69,
"stem": "Errors that occur in a program when the rules of programming language are NOT obeyed are called",
"opts": [
"Syntax errors",
"Run-time errors",
"Logical errors",
"Execution errors"
]
},
{
"n": 70,
"stem": "The name of the interface used by blind persons to operate a computer is",
"opts": [
"Sensor",
"Touchscreen",
"Braille",
"Icon"
]
}
]"""

KEY = {
    1: ("c", "Standard result: if A ∩ B = A ∩ C and A ∪ B = A ∪ C then B = C."),
    2: ("b", "Domain [1, 3]; (x − 1)(3 − x) is 0 at the ends and maximum 1 at x = 2, so the range is [0, 1]."),
    3: ("b", "Put x = cos θ: 4cos³θ − 3cos θ = cos 3θ, so cos⁻¹(cos 3θ) = 3θ = 3cos⁻¹x when 0 ≤ 3θ ≤ π, i.e. 1/2 ≤ x ≤ 1."),
    4: ("c", "1 − x = 6 → x = −5."),
    5: ("b", "y = log(1 − x²) − log(1 + x²): y′ = −2x/(1 − x²) − 2x/(1 + x²) = −4x/(1 − x⁴)."),
    6: ("c", "x dy = y dx → dy/y = dx/x → y = cx, a straight line through the origin."),
    7: ("b", "a · b = 2(4) + (−5)(2) + 1(1) = 8 − 10 + 1 = −1."),
    8: ("d", "Parallel plane: 3x − 5y + 2z + d = 0 through (1, 2, −3): 3 − 10 − 6 + d = 0 → d = 13."),
    9: ("a", "The only even prime is 2: P = (1/6)(1/6) = 1/36."),
    10: ("a", "(3x + 5)(x − 2)/[(x − 2)(x + 2)] → (3x + 5)/(x + 2) = 11/4 at x = 2."),
    11: ("a", "Slope y′ = −3x² + 6x + 12; y″ = 0 at x = 1, maximum slope = −3 + 6 + 12 = 15."),
    12: ("c", "cos 3π/5 = sin(π/2 − 3π/5) = sin(−π/10); sin⁻¹ of it = −π/10 (in [−π/2, π/2])."),
    13: ("a", "tan² 2x = sec² 2x − 1: [tan 2x/2 − x] from 0 to π/8 = 1/2 − π/8 = (4 − π)/8."),
    14: ("b", "Net rate = 1/5 + 1/8 − 1/20 = 11/40 per hour, so time = 40/11 ≈ 3.6 hours."),
    15: ("a", "200/v − 200/(v + 10) = 1 → v² + 10v − 2000 = 0 → v = 40 km/hr."),
    17: ("b", "50/5^(1/3) = 2 x 5² x 5^(−1/3) = 2 x 5^(5/3)."),
    18: ("b", "Rational + irrational is always irrational."),
    19: ("b", "Coincident lines: a₁/a₂ = b₁/b₂ = c₁/c₂ (infinitely many solutions)."),
    20: ("a", "No real roots when the discriminant b² − 4ac < 0."),
    21: ("b", "Electric-car batteries are lithium-ion batteries."),
    22: ("b", "Dalton held that atoms of the same element are identical; isotopes came later."),
    23: ("b", "Chilli pungency is measured in Scoville heat units."),
    24: ("d", "Leaching dissolves the ore in a suitable solvent (e.g. bauxite in NaOH, gold in cyanide)."),
    25: ("c", "Elements of a group have the same valence electrons; elements of a period have the same number of shells."),
    26: ("a", "Rust is hydrated iron(III) oxide, Fe₂O₃·nH₂O."),
    27: ("b", "Cutting onions releases a volatile sulphur compound (syn-propanethial-S-oxide) that irritates the eyes; the paper's option 'Sulphur' is meant."),
    28: ("c", "Gastric juice (pH ≈ 1.5) < citrus juice (≈ 2.5) < pure water (7) < milk of magnesia (≈ 10)."),
    29: ("b", "Wavelength order: X-rays < UV < visible < microwaves."),
    30: ("c", "Zn → Zn²⁺ + 2e⁻: zinc loses electrons and is oxidised."),
    31: ("b", "Incomplete combustion gives CO: C₄H₈ + 4O₂ → 4CO + 4H₂O (balanced)."),
    32: ("a", "A soap has a long non-polar hydrocarbon tail and a polar (ionic) carboxylate head."),
    33: ("b", "Fluorine is the most electronegative, so FCH₂COOH stabilises its anion most and is the most acidic."),
    34: ("c", "Sucrose has no free anomeric carbon (both are joined in the glycosidic bond): non-reducing."),
    35: ("c", "Platinum is a noble metal - the least reactive of these."),
    36: ("c", "Mayonnaise is an emulsion of oil droplets in water/ vinegar stabilised by egg-yolk lecithin."),
    37: ("b", "Calcium is in the same group (2) as magnesium."),
    38: ("c", "Al³⁺ and F⁻ combine as AlF₃."),
    39: ("d", "Lead is a metal and forms cations (Pb²⁺) by losing electrons; O, H, C are non-metals."),
    40: ("c", "List and MacMillan won the 2021 Nobel Prize in Chemistry for asymmetric organocatalysis."),
    41: ("b", "Geim and Novoselov won the 2010 Nobel Prize in Physics for graphene."),
    42: ("b", "The fast-moving air near the train has lower pressure (Bernoulli), so the higher pressure behind pushes you towards the train."),
    43: ("c", "The stone keeps the vehicle's horizontal velocity, so it falls back into your hand."),
    44: ("c", "X-ray crystallography relies on diffraction of X-rays by the crystal lattice (Bragg's law)."),
    45: ("c", "A p-type semiconductor is electrically neutral overall - holes are balanced by the negative acceptor ions."),
    46: ("c", "Myopia (short-sightedness): near objects clear, distant objects blurred."),
    47: ("b", "Latent heat L = Q/m: J kg⁻¹."),
    48: ("a", "T = 2π√(L/g) does not depend on the mass (the radius, and so the length to the centre, is unchanged)."),
    49: ("d", "A hydrometer measures the relative density (specific gravity) of liquids."),
    50: ("c", "R₂ || R₃ = 3 Ω; total = 5 + 3 + 8 = 16 Ω; I = 24/16 = 1.5 A, which flows through R₄ in series."),
    51: ("a", "With no friction and constant velocity no net force is needed (Newton's first law)."),
    52: ("d", "r = mv/(qB) = √(2mqV)/(qB) ∝ √V, so doubling V gives √2 r."),
    53: ("d", "At resonance XL = XC, the circuit is purely resistive and the current is in phase with the voltage."),
    54: ("b", "Loss of weight = 20 N = weight of water displaced; relative density = 60/20 = 3, density 3000 kg/m³."),
    55: ("a", "P = V²/R = 400/4 = 100 W; heat = 100 x 10 = 1000 J."),
    56: ("d", "Δp = m(v₁ + v₂) = 0.1 x (5 + 4) = 0.9 kg m/s (direction reverses)."),
    57: ("d", "A 40 dB difference = 10^(40/10) = 10 000 times the intensity."),
    58: ("a", "Far from all planets there is no gravitational pull, so the weight is zero (the paper prints the options in kg)."),
    59: ("c", "In a.c. circuits the total opposition to current is the impedance Z."),
    60: ("c", "1/v − 1/u = 1/f with u = −100 cm, f = 20 cm: 1/v = 1/20 − 1/100 = 1/25, v = 25 cm."),
    61: ("c", "Prolog (logic programming) was designed for artificial intelligence."),
    62: ("a", "OS/2 was produced by IBM (initially with Microsoft)."),
    63: ("d", "Database management is done by a DBMS, not by the operating system."),
    64: ("b", "Facebook bought WhatsApp, Instagram and Oculus VR; Snapchat rejected its offer."),
    65: ("a", "System software (the OS) is the interface between the hardware and application software."),
    66: ("b", "IM = Instant Messaging."),
    67: ("b", "23 = 16 + 4 + 2 + 1 = 10111₂."),
    68: ("b", "A variable is a named memory location whose value can change during execution."),
    69: ("a", "Breaking the grammar rules of a programming language gives syntax errors."),
    70: ("c", "Braille displays/ keyboards let blind users read and enter text."),
}

NEW_MCQ = [
    ("If y = log x (natural logarithm), then d²y/dx² is", ["1/x", "−1/x²", "1/x²", "−1/x"], "b", "dy/dx = 1/x, so d²y/dx² = −1/x²."),
]

SAQ = [
 dict(marks=3, stem="If a^(2 − x) · b^(5x) = a^(x + 3) · b^(3x), show that x log(b/a) = (1/2) log a. (3 marks)",
      kp=[("Rearrange: b^(5x − 3x) = a^(x + 3 − 2 + x) → b^(2x) = a^(2x + 1)", 1), ("Take logs: 2x log b = (2x + 1) log a", 1), ("2x(log b − log a) = log a → x log(b/a) = ½ log a", 1)],
      model="a^(2 − x) · b^(5x) = a^(x + 3) · b^(3x). Dividing, b^(5x − 3x) = a^(x + 3 − (2 − x)), i.e. b^(2x) = a^(2x + 1). Taking logarithms: 2x log b = (2x + 1) log a = 2x log a + log a. So 2x(log b − log a) = log a, i.e. 2x log(b/a) = log a, and x log(b/a) = (1/2) log a. Hence shown."),
 dict(marks=3, stem="The coefficient of x in the equation x² + px + q = 0 was taken as 17 in place of 13, and its roots were found to be −2 and −15. Find the roots of the original equation. (3 marks)",
      kp=[("Constant term was correct: q = product of roots = (−2)(−15) = 30", 1), ("Original equation: x² + 13x + 30 = 0", 1), ("(x + 3)(x + 10) = 0 → roots −3 and −10", 1)],
      model="Only the coefficient of x was taken wrongly, so the constant term is right: q = (−2)(−15) = 30. (Check: with p = 17 the sum of roots is −17 = −2 − 15 ✓.) The original equation is x² + 13x + 30 = 0, i.e. (x + 3)(x + 10) = 0, so its roots are −3 and −10."),
 dict(marks=3, stem="Answer the following questions:\na) If 4 sin⁻¹x + cos⁻¹x = π, find the value of x. (2 marks)\nb) Factorise: x² + y². (1 mark)",
      kp=[("a) cos⁻¹x = π/2 − sin⁻¹x → 3 sin⁻¹x = π/2 → sin⁻¹x = π/6 → x = 1/2", 2),
          ("b) Not factorisable over real numbers; over complex numbers x² + y² = (x + iy)(x − iy)", 1)],
      model="a) Since sin⁻¹x + cos⁻¹x = π/2, cos⁻¹x = π/2 − sin⁻¹x. Then 4 sin⁻¹x + π/2 − sin⁻¹x = π, so 3 sin⁻¹x = π/2, sin⁻¹x = π/6 and x = sin(π/6) = 1/2.\nb) x² + y² has no real factors (it is a sum of squares), but using i² = −1 it factorises as x² − (iy)² = (x + iy)(x − iy)."),
 dict(marks=3, image="/papers/me/tech2-eng-2021-atoms.png", stem="Use the models in the figure (p = protons; n = neutrons; e = electrons): Atom 1 - 4p, 4n, 4e; Atom 2 - 5p, 6n, 5e; Atom 3 - 4p, 6n, 4e.\na) What is the relationship between Atom 1 and Atom 3? (1 mark)\nb) Write each atom in the shorthand notation that describes the most common isotope of hydrogen as H-1. (1 mark)\nc) How many valence electrons does Atom 2 have? (1 mark)",
      kp=[("a) Isotopes of the same element (beryllium): same number of protons (4), different numbers of neutrons", 1),
          ("b) Atom 1: Be-8; Atom 2: B-11; Atom 3: Be-10 (mass number = p + n)", 1),
          ("c) Atom 2 is boron (2, 3): 3 valence electrons", 1)],
      model="a) Atoms 1 and 3 both have 4 protons, so they are the same element (beryllium), but they have 4 and 6 neutrons respectively: they are isotopes.\nb) Mass number = protons + neutrons. Atom 1: Be-8 (4 + 4); Atom 2: 5 protons = boron, B-11 (5 + 6); Atom 3: Be-10 (4 + 6).\nc) Atom 2 (boron) has 5 electrons arranged 2, 3, so it has 3 valence electrons."),
 dict(marks=3, stem="Identify the oxidation-reduction reactions below and name the substance undergoing oxidation (circle it on paper). (3 x 1 = 3 marks)\na) HCl + NaOH → H₂O + NaCl (1 mark)\nb) PbCl₂ + KI → KCl + PbI₂ (1 mark)\nc) CuO + H₂ → Cu + H₂O (1 mark)",
      kp=[("a) Not redox - acid-base neutralisation; no oxidation numbers change", 1),
          ("b) Not redox - double displacement/ precipitation; no oxidation numbers change", 1),
          ("c) Redox: H₂ (0 → +1) is oxidised; CuO (Cu +2 → 0) is reduced", 1)],
      model="a) HCl + NaOH → H₂O + NaCl is a neutralisation (acid-base) reaction: H stays +1, Cl −1, Na +1, O −2 - no change, so it is not a redox reaction.\nb) PbCl₂ + KI → KCl + PbI₂ is a double displacement (precipitation) reaction: Pb stays +2, K +1, Cl and I −1 - not redox.\nc) CuO + H₂ → Cu + H₂O is a redox reaction: copper goes from +2 to 0 (CuO is reduced) and hydrogen goes from 0 to +1 - H₂ is the substance oxidised (it is the reducing agent)."),
 dict(marks=3, stem="A closed vessel contains 52 g of C₂H₂ and 200 g of O₂, which react to form CO₂ and H₂O.\na) How many molecules of C₂H₂ are in the vessel? (2 marks)\nb) Write a balanced equation for the reaction. (1 mark)",
      kp=[("a) Molar mass C₂H₂ = 26 g/mol; 52/26 = 2 mol; molecules = 2 x 6.022 x 10²³ = 1.204 x 10²⁴", 2),
          ("b) 2C₂H₂ + 5O₂ → 4CO₂ + 2H₂O", 1)],
      model="a) Molar mass of C₂H₂ = 2(12) + 2(1) = 26 g/mol. Moles = 52/26 = 2 mol. Number of molecules = 2 x 6.022 x 10²³ = 1.204 x 10²⁴ molecules.\nb) 2C₂H₂ + 5O₂ → 4CO₂ + 2H₂O. (Here 200 g O₂ = 6.25 mol is more than the 5 mol needed, so C₂H₂ is the limiting reactant.)"),
 dict(marks=3, stem="A ball is dropped into a tray filled with sand. When it hits the sand it has a velocity of 6.2 m/s and a momentum of 0.46 kg m/s. The ball takes 0.17 s to come to rest after it hits the sand.\na) Calculate the mass of the ball. (1.5 marks)\nb) Calculate the average impact force. (1.5 marks)",
      kp=[("a) m = p/v = 0.46/6.2 = 0.074 kg (74 g)", 1.5), ("b) F = Δp/Δt = 0.46/0.17 = 2.7 N (impulse-momentum)", 1.5)],
      model="a) Momentum p = mv, so m = p/v = 0.46/6.2 = 0.0742 kg ≈ 0.074 kg (74 g).\nb) The ball loses all its momentum (0.46 kg m/s) in 0.17 s. Average force = change in momentum/ time = 0.46/0.17 ≈ 2.7 N (acting upwards on the ball, opposite to its motion)."),
 dict(marks=3, stem="Mention the function of the following used in a communication system. (3 x 1 = 3 marks)\na) Transducer (1 mark)\nb) Repeater (1 mark)\nc) Transmitter (1 mark)",
      kp=[("a) Transducer converts one form of energy into another - e.g. a microphone converts sound into an electrical signal (loudspeaker the reverse)", 1),
          ("b) Repeater receives a weak signal, amplifies/ regenerates it and retransmits it, extending the range of communication", 1),
          ("c) Transmitter processes the message signal (amplifies, modulates onto a carrier) and sends it into the channel/ antenna", 1)],
      model="a) Transducer: a device that converts energy from one form into another - in communication, it turns the message into an electrical signal (e.g. a microphone converts sound into electrical signals) or back (a loudspeaker).\nb) Repeater: a combination of a receiver and a transmitter placed along the path; it picks up the weak signal, amplifies/ regenerates it and retransmits it, so the signal can travel longer distances (e.g. communication satellites).\nc) Transmitter: processes the incoming message signal - amplifies it and modulates it onto a high-frequency carrier - so that it is suitable for transmission through the channel (antenna, cable or optical fibre)."),
 dict(marks=3, image="/papers/me/tech2-eng-2021-bridge.png", stem="For the circuit diagram of a Wheatstone bridge shown in the figure (R₁ top-left, R₂ top-right, R₄ bottom-left, R₃ bottom-right, galvanometer G between the top and bottom junctions, cell across the left and right junctions), use Kirchhoff's laws to obtain its balance condition. (3 marks)",
      kp=[("At balance no current flows through G (Ig = 0): the current I₁ in R₁ also flows in R₂, and I₂ in R₄ also flows in R₃ (junction rule)", 1),
          ("Loop rule: loop through R₁, G, R₄ → I₁R₁ = I₂R₄; loop through R₂, G, R₃ → I₁R₂ = I₂R₃", 1),
          ("Dividing: R₁/R₂ = R₄/R₃ (i.e. R₁R₃ = R₂R₄)", 1)],
      model="Let the current from the cell divide at the left junction into I₁ (through R₁) and I₂ (through R₄). At balance the galvanometer shows no deflection, so Ig = 0; by Kirchhoff's junction rule the current I₁ continues through R₂ and I₂ through R₃.\nApplying Kirchhoff's loop rule to the closed loop containing R₁, G and R₄ (with Ig = 0): I₁R₁ − I₂R₄ = 0, so I₁R₁ = I₂R₄ ... (1).\nFor the loop containing R₂, G and R₃: I₁R₂ − I₂R₃ = 0, so I₁R₂ = I₂R₃ ... (2).\nDividing (1) by (2): R₁/R₂ = R₄/R₃, i.e. R₁R₃ = R₂R₄. This is the balance condition of the Wheatstone bridge."),
 dict(marks=3, stem="Answer the following questions on cryptocurrency:\na) What is cryptocurrency? (1 mark)\nb) Mention one major difference between digital currency and cryptocurrency. (1 mark)\nc) Name two types of cryptocurrency. (1 mark)",
      kp=[("a) A digital/ virtual currency secured by cryptography, usually decentralised and recorded on a blockchain, not issued by a central authority", 1),
          ("b) Digital currency can be centralised and regulated (e.g. bank money, central bank digital currency); cryptocurrency is decentralised, peer-to-peer, unregulated and uses a blockchain (also more volatile, more anonymous)", 1),
          ("c) Any two: Bitcoin, Ethereum (Ether), Litecoin, Ripple (XRP), Tether, Dogecoin", 1)],
      model="a) Cryptocurrency is a digital (virtual) currency that uses cryptography to secure transactions and control the creation of new units. Most are decentralised: transactions are recorded on a public distributed ledger (blockchain) maintained by a network of computers, not by a bank or government.\nb) A digital currency is any money in electronic form and may be centralised - issued or regulated by a bank or central bank (e.g. mobile banking balances, a central bank digital currency) - whereas a cryptocurrency is decentralised and peer-to-peer, not controlled by any central authority, and relies on blockchain and cryptography.\nc) Examples: Bitcoin and Ethereum (also Litecoin, Ripple/ XRP, Tether)."),
]
Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
for q in Q:
    if q["type"] != "mcq":
        q["issues"] = list(q.get("issues", [])) + ["Model answer written by Claude: please check before publishing."]
