"""ME Technical Paper II (General Subject Knowledge), ENGINEERING group, BCSE 2025 - real paper. PDF sent by the founder.
Pattern: Part I 70 MCQ x 1 (Section A Mathematics 1-20, B Chemistry 21-40, C Physics 41-60, D General IT 61-70);
Part II 10 short answers x 3 (all). 90 min + 15 min reading. Mathematics questions were retyped from the page images
(the PDF's equations do not convert to text).
Left out (answer not certain / question flawed): 22 (methylamine + HNO2), 28 ('maximum coagulating value'), 34 (no option
matches 34.5 g sugar in 215 g water), 46 (two options true), 57 (no option matches), 64 (unclear), 69 (ambiguous);
seven new MCQs of the same sections keep Part I at 70.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Engineering): BCSE 2025, batch 1"
GROUP_TAG = "eng2025"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "engineering"
MIN_WORDS = 0
GROUP_TIMING = {"duration": 90, "reading": 15, "max_marks": 100}
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper II, Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Engineering: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Let f: [2, ∞) → R be the function defined by f(x) = x² − 4x + 5. Then the range of f is",
"opts": [
"[1, ∞)",
"[∞, 1)",
"[1, 0)",
"[0, 1)"
]
},
{
"n": 2,
"stem": "The value of tan²(sec⁻¹ 2) + cot²(cosec⁻¹ 3) is",
"opts": [
"11",
"5",
"13",
"15"
]
},
{
"n": 3,
"stem": "The matrix A = [0 0 5; 0 5 0; 5 0 0] (rows separated by ;) is a",
"opts": [
"Square matrix",
"Scalar matrix",
"Unit matrix",
"Diagonal matrix"
]
},
{
"n": 4,
"stem": "If A = [2 −1 3; −4 5 1] (a 2 × 3 matrix) and B = [2 3; 4 −2; 1 5] (a 3 × 2 matrix), then",
"opts": [
"Only BA is defined",
"Only AB is defined",
"AB and BA both are defined",
"AB and BA both are not defined"
]
},
{
"n": 5,
"stem": "If f(x) = |x|, is f(x) differentiable at x = 0?",
"opts": [
"Yes",
"No",
"Differentiable from right only",
"Differentiable from left only"
]
},
{
"n": 6,
"stem": "If f(x) = | 0  x−a  x−b ; x+a  0  x−c ; x+b  x+c  0 | (a 3 × 3 determinant, rows separated by ;), then",
"opts": [
"f(a) = 0",
"f(b) = 0",
"f(0) = 0",
"f(1) = 0"
]
},
{
"n": 7,
"stem": "If A = | 2 λ −3 ; 0 2 5 ; 1 1 3 | (rows separated by ;), then A⁻¹ exists if",
"opts": [
"λ = 2",
"λ ≠ 2",
"λ ≠ −2",
"None of these"
]
},
{
"n": 8,
"stem": "The function f(x) = (sin x)/x + cos x for x ≠ 0, and f(x) = k for x = 0, is continuous at x = 0. Then the value of k is",
"opts": [
"3",
"2",
"1",
"1.5"
]
},
{
"n": 9,
"stem": "The tangent to the curve y = e^(2x) at the point (0, 1) meets the x-axis at",
"opts": [
"(0, 1)",
"(−1/2, 0)",
"(2, 0)",
"(0, 2)"
]
},
{
"n": 10,
"stem": "f(x) = x^x has a stationary point at",
"opts": [
"x = e",
"x = 1/e",
"x = 1",
"x = √e"
]
},
{
"n": 11,
"stem": "The slope of the normal to the curve y = 2x² + 3 sin x at x = 0 is",
"opts": [
"3",
"1/3",
"−3",
"−1/3"
]
},
{
"n": 12,
"stem": "If ∫ (3eˣ − 5e⁻ˣ)/(4eˣ + 5e⁻ˣ) dx = ax + b log|4eˣ + 5e⁻ˣ| + C, then",
"opts": [
"a = −1/8, b = 7/8",
"a = 1/8, b = 7/8",
"a = −1/8, b = −7/8",
"a = 1/8, b = −7/8"
]
},
{
"n": 13,
"stem": "If x = ∫₀ʸ dt/√(1 + 9t²) and d²y/dx² = ay, then a is equal to",
"opts": [
"3",
"6",
"9",
"1"
]
},
{
"n": 14,
"stem": "∫ from −1 to 1 of (x³ + |x| + 1)/(x² + 2|x| + 1) dx is equal to",
"opts": [
"log 2",
"2 log 2",
"(1/2) log 2",
"4 log 2"
]
},
{
"n": 15,
"stem": "The degree of the differential equation d²y/dx² + 3(dy/dx)² = x² log(d²y/dx²) is",
"opts": [
"1",
"2",
"3",
"Not defined"
]
},
{
"n": 16,
"stem": "The vector having initial and terminal points (2, 5, 0) and (−3, 7, 4) respectively is",
"opts": [
"−i + 12j + 4k",
"5i + 2j − 4k",
"−5i + 2j + 4k",
"i + j + k"
]
},
{
"n": 17,
"stem": "The angle between two vectors a and b with magnitudes √3 and 4 respectively and a · b = 2√3 is",
"opts": [
"π/6",
"π/3",
"π/2",
"5π/2"
]
},
{
"n": 18,
"stem": "P is the point on the line segment joining (3, 2, −1) and (6, 2, −2). If the x-coordinate of P is 5, then its y-coordinate is",
"opts": [
"2",
"1",
"−1",
"−2"
]
},
{
"n": 19,
"stem": "A box contains 3 yellow, 3 orange and 2 purple balls. Three balls are drawn at random without replacement. The probability of drawing 2 orange balls and one purple ball is",
"opts": [
"3/28",
"2/21",
"1/28",
"167/168"
]
},
{
"n": 20,
"stem": "The area of the region bounded by the curve y = √(16 − x²) and the x-axis is",
"opts": [
"8π sq units",
"20π sq units",
"16π sq units",
"256π sq units"
]
},
{
"n": 21,
"stem": "Low concentration of oxygen in the blood and tissues of people living at high altitude is due to _____________.",
"opts": [
"low temperature",
"low atmospheric pressure",
"high atmospheric pressure",
"both low temperature and high atmospheric pressure"
]
},
{
"n": 22,
"stem": "Methylamine reacts with HNO2 to form",
"opts": [
"CH3 - O – N = O",
"CH3 – O - CH3",
"CH3OH",
"CH3 CHO"
]
},
{
"n": 23,
"stem": "In a reaction, when the concentration of the reactant is doubled, the rate of reaction increases four times. The order of the reaction is",
"opts": [
"0",
"1",
"2",
"3"
]
},
{
"n": 24,
"stem": "F2 is formed by reacting K2MnF6 with",
"opts": [
"SbF5",
"MnF3",
"KSbF6",
"MnF4"
]
},
{
"n": 25,
"stem": "Number of unpaired electrons in Ni2+ (Z = 28) is",
"opts": [
"4",
"2",
"6",
"8"
]
},
{
"n": 26,
"stem": "The hybridization involved in [Co(C2O4)3]3− is",
"opts": [
"sp3d2",
"sp3d3",
"d2sp3",
"dsp3"
]
},
{
"n": 27,
"stem": "Mercuric chloride is soluble in KI solution due to:",
"opts": [
"the formation of complex ion",
"common iodide ion",
"none of the above",
"both complex ion formation and the common iodide ion"
]
},
{
"n": 28,
"stem": "Which of the following electrolytes will have maximum coagulating value for AgI/Ag+ sol?",
"opts": [
"Na2S",
"Na3PO4",
"Na2SO4",
"NaCl"
]
},
{
"n": 29,
"stem": "Which functional group is finally introduced when phenol reacts with chloroform in the presence of dilute sodium hydroxide?",
"opts": [
"–CHCl2",
"–CHO",
"–CH2Cl",
"–COOH"
]
},
{
"n": 30,
"stem": "Which of the following tests distinguishes aldehydes and ketones?",
"opts": [
"Lucas test",
"Tollens' test",
"KMnO4 solution (Baeyer's test)",
"None of these"
]
},
{
"n": 31,
"stem": "Considering the formation, breaking and strength of hydrogen bond, predict which of the following mixtures will show a positive deviation from Raoult’s law?",
"opts": [
"Methanol and acetone",
"Chloroform and acetone",
"Nitric acid and water",
"Phenol and aniline"
]
},
{
"n": 32,
"stem": "Among the following substances, the lowest vapour pressure is exerted by",
"opts": [
"Water",
"Alcohol",
"Ether",
"Mercury"
]
},
{
"n": 33,
"stem": "Which of the following is the use of electrolysis?",
"opts": [
"Electrorefining",
"Electroplating",
"Both electroplating and electrorefining",
"None of these"
]
},
{
"n": 34,
"stem": "Calculate the molality of 34.5g of sugar dissolved in 215g of water.",
"opts": [
"0.559 m",
"0.613 m",
"0.603 m",
"0.554 m"
]
},
{
"n": 35,
"stem": "A metal ribbon ‘X’ burns in oxygen with dazzling white flame forming a white ash ‘Y’. The correct description of X, Y and the type of reaction is:",
"opts": [
"X = Ca; Y= CaO; Type of reaction – Decomposition",
"X= Mg; Y= MgO; Type of Reaction – Combination",
"X= Al; Y= Al2O3; Type of reaction - Thermal Decomposition",
"X= Zn; Y=ZnO; Type of reaction – Endothermic"
]
},
{
"n": 36,
"stem": "In the following reaction: ZnO + C → Zn + CO Statement (S): ZnO undergoes reduction. Reason (R): Carbon is a reducing agent that reduces ZnO to Zn. Choose the correct answer.",
"opts": [
"Both Statement (S) and Reason (R) are true and Reason (R) is the correct explanation of the Statement (S)",
"Both Statement (S) and Reason (R) are true, but Reason (R) is not the correct explanation of the Statement (S)",
"Statement (S) is true, but Reason (R) is false",
"Statement (S) is false, but Reason (R) is true"
]
},
{
"n": 37,
"stem": "Which of the following statements about the reaction below are correct? MnO2 + 4HCl → MnCl2 + 2H2O + Cl2 i. HCl is oxidized to Cl2 ii. MnO2 is reduced to MnCl2 iii. MnCl2 acts as an oxidizing agent iv. HCl acts as an oxidizing agent",
"opts": [
"ii, iii and iv",
"i, ii and iii",
"i and ii only",
"iii and iv only"
]
},
{
"n": 38,
"stem": "A student took sodium sulphate solution in a test tube and added barium chloride solution to it. She observed that an insoluble substance has formed. The colour and molecular formula of the insoluble substance are",
"opts": [
"Grey, Ba2SO4",
"Yellow, Ba(SO4)2",
"White, BaSO4",
"Pink, BaSO4"
]
},
{
"n": 39,
"stem": "When lead nitrate powder is heated in a boiling tube, we observe",
"opts": [
"Brown fumes of nitrogen dioxide",
"Brown fumes of lead oxide",
"Yellow fumes of nitrogen dioxide",
"Brown fumes of nitric oxide"
]
},
{
"n": 40,
"stem": "The density of a solution prepared by dissolving 120 g of urea (mol.mass = 60 u) in 1000 g of water is 1.15 g/mL. The molarity of this solution is:",
"opts": [
"2.05 M",
"1.02 M",
"0.50 M",
"1.78 M"
]
},
{
"n": 41,
"stem": "The expression for the energy stored in a capacitor is",
"opts": [
"E = CV²",
"E = ½CV²",
"E = ½C²V",
"E = ½(CV)²"
]
},
{
"n": 42,
"stem": "Unit of energy density of electric field is",
"opts": [
"JC-1",
"JV-1",
"Jm-3",
"JF-3"
]
},
{
"n": 43,
"stem": "The term \"RC\" has the same unit as",
"opts": [
"Potential",
"Capacitance",
"Energy",
"Time"
]
},
{
"n": 44,
"stem": "A wire of resistance R is cut into two equal parts, so each part has a resistance of R/2. What happens to the resistivity?",
"opts": [
"Double",
"Same",
"Half",
"One fourth"
]
},
{
"n": 45,
"stem": "Kirchhoff's first rule is based on conservation of:",
"opts": [
"Energy",
"Voltage",
"Charge",
"Mass"
]
},
{
"n": 46,
"stem": "The electrons of mass ‘m’ and charge ‘e’ is moving in a circle of radius ‘r’ with speed ‘v’ in a uniform magnetic field of strength ‘B’. then",
"opts": [
"r  m",
"r  B 1",
"r  𝑣 1",
"r  𝑚"
]
},
{
"n": 47,
"stem": "The rule that the induced current always flows so as to oppose the change that causes it is called:",
"opts": [
"Faraday's law",
"Lenz's law",
"Ohm's law",
"Kirchhoff's 1st rule"
]
},
{
"n": 48,
"stem": "If we make the magnetic field stronger, the value of induced current is:",
"opts": [
"Decreased",
"Increased",
"Vanished",
"Kept constant"
]
},
{
"n": 49,
"stem": "For a good transformer, the hysteresis loop should be ______________ in size.",
"opts": [
"Small",
"Large",
"Zero",
"None"
]
},
{
"n": 50,
"stem": "An application of mutual induction is the",
"opts": [
"Television",
"Radio",
"D.C. motor",
"Transformer"
]
},
{
"n": 51,
"stem": "A device that allows DC to flow through a circuit easily is called:",
"opts": [
"Inductor",
"Capacitor",
"AC generator",
"Transformer"
]
},
{
"n": 52,
"stem": "In parallel RLC circuit, at resonance frequency, there will be maximum",
"opts": [
"Power",
"Voltage",
"Impedance",
"None"
]
},
{
"n": 53,
"stem": "If Vrms = 10√2 volts, then the peak voltage V0 will be",
"opts": [
"10 volts",
"20 volts",
"40 volts",
"15 volts"
]
},
{
"n": 54,
"stem": "If the frequency of A.C. is doubled, the reactance of an inductor will be",
"opts": [
"Half",
"Same",
"Double",
"Triple"
]
},
{
"n": 55,
"stem": "A charge of 90C passes through a wire in 1 hour and 15 minutes. What is the current in the wire?",
"opts": [
"20mA",
"10mA",
"5 mA",
"0.35A"
]
},
{
"n": 56,
"stem": "5900 J of work is done by a machine to lift a mass of 100 kg vertically upward. The height to which the mass is lifted upward is",
"opts": [
"6.02m",
"6.01 m",
"5.90m",
"5.95m"
]
},
{
"n": 57,
"stem": "A block A of mass 4 kg is placed on another block B of mass 5 kg, and the block B rests on a smooth horizontal table. If the minimum force that can be applied on A so that both the blocks move together is 12 N, the maximum force that can be applied to B for the blocks to move together will be",
"opts": [
"30N",
"25N",
"27N",
"40N"
]
},
{
"n": 58,
"stem": "A concave mirror has a focal length of 5.00 cm. What is the image distance of an object placed 7.00 cm from the center of the mirror?",
"opts": [
"−17.5 cm",
"−2.92 cm",
"2.92 cm",
"17.5 cm"
]
},
{
"n": 59,
"stem": "What is the gravitational force between two 60 kg people sitting 100 m apart?",
"opts": [
"2.4 × 10⁻¹¹ N",
"2.4 × 10⁻⁹ N",
"3.6 × 10⁻¹ N",
"3.6 × 10¹ N"
]
},
{
"n": 60,
"stem": "A converging lens corrects farsightedness by",
"opts": [
"Dispersing the rays so they focus on the retina.",
"Bending the rays closer together so they do not focus on the retina.",
"Bending the rays closer together so they focus on the retina.",
"Dispersing the rays so they do not focus on the retina."
]
},
{
"n": 61,
"stem": "An internet standard that allows for adding media attachments to an email is called",
"opts": [
"MIME",
"DHCP",
"HDMI",
"FTP"
]
},
{
"n": 62,
"stem": "Identify the incorrect pair from the following:",
"opts": [
".jpg - graphic file",
".ttf - word text file",
".wav - audio file",
".exe - executable file"
]
},
{
"n": 63,
"stem": "The ability to read and write each piece of information in a storage device in approximately the same length of time, regardless of its location, is",
"opts": [
"Sequential Access",
"Raster scan",
"Search",
"Random Access"
]
},
{
"n": 64,
"stem": "Which of the following is a component of cyber security?",
"opts": [
"Internet Of Things",
"AI",
"Database",
"Attacks"
]
},
{
"n": 65,
"stem": "An artificially intelligent car decreases its speed based on its distance from the car in front of it. Which algorithm is used?",
"opts": [
"Naïve-Bayes",
"Decision Tree",
"Linear Regression",
"Logistic Regression"
]
},
{
"n": 66,
"stem": "What is Machine learning?",
"opts": [
"The selective acquisition of knowledge through the use of computer programs",
"The selective acquisition of knowledge through the use of manual programs",
"The autonomous acquisition of knowledge through the use of computer programs",
"The autonomous acquisition of knowledge through the use of manual programs"
]
},
{
"n": 67,
"stem": "A professor at Stanford University coined the term 'artificial intelligence' in 1956 at a conference held at Dartmouth College. The name of the professor is",
"opts": [
"Joseph Weizenbaum",
"David Levy",
"Hans Berliner",
"John McCarthy"
]
},
{
"n": 68,
"stem": "Starlink is now technically active in Bhutan, making it the latest country to gain access to SpaceX’s satellite internet service. In which type of orbit are Starlink satellites deployed to provide internet connectivity?",
"opts": [
"Geostationary orbit (GEO)",
"Medium Earth orbit (MEO)",
"Low Earth orbit (LEO)",
"Polar orbit"
]
},
{
"n": 69,
"stem": "_____________ type of cables are used in short-distance communication.",
"opts": [
"Coaxial Cable",
"Fiber Optic Cable",
"Ethernet Cable",
"Both a and b"
]
},
{
"n": 70,
"stem": "Which of the following hardware was used by the first-generation computers?",
"opts": [
"Transistors",
"Vacuum tubes",
"VLSI",
"Integrated circuits"
]
}
]"""

KEY = {
 1: ("a", "f(x) = (x − 2)² + 1 ≥ 1 on [2, ∞), so the range is [1, ∞)."),
 2: ("a", "tan²(sec⁻¹2) = 2² − 1 = 3 and cot²(cosec⁻¹3) = 3² − 1 = 8; total 11."),
 3: ("a", "It is a square (3 × 3) matrix; the non-zero entries are off the main diagonal, so it is not diagonal."),
 4: ("c", "A is 2 × 3 and B is 3 × 2, so both AB (2 × 2) and BA (3 × 3) exist."),
 5: ("b", "Left derivative −1 ≠ right derivative +1 at 0."),
 6: ("c", "f(0) is a 3 × 3 skew-symmetric determinant, which is 0."),
 7: ("d", "|A| = 8 + 5λ, so A⁻¹ exists if λ ≠ −8/5; none of the options."),
 8: ("b", "lim (sin x/x + cos x) = 1 + 1 = 2, so k = 2."),
 9: ("b", "Slope 2e⁰ = 2; tangent y = 2x + 1 meets y = 0 at x = −1/2."),
 10: ("b", "d/dx(x^x) = x^x(1 + ln x) = 0 when x = 1/e."),
 11: ("d", "dy/dx = 4x + 3cos x = 3 at 0, so the normal slope is −1/3."),
 12: ("a", "Write numerator = A(denominator) + B(derivative): A = −1/8, B = 7/8."),
 13: ("c", "dy/dx = √(1 + 9y²), so d²y/dx² = 9y."),
 14: ("b", "x³ term is odd and integrates to 0; the rest is 1/(|x| + 1), giving 2 log 2."),
 15: ("d", "The equation contains log of the highest derivative, so it is not a polynomial in derivatives: degree not defined."),
 16: ("c", "Terminal minus initial: (−5, 2, 4)."),
 17: ("b", "cos θ = 2√3/(√3 × 4) = 1/2, so θ = π/3."),
 18: ("a", "Both points have y = 2, so every point on the segment has y = 2."),
 19: ("a", "C(3,2) × C(2,1)/C(8,3) = 6/56 = 3/28."),
 20: ("a", "Upper semicircle of radius 4: ½π(4²) = 8π."),
 21: ("b", "At altitude the atmospheric (and oxygen partial) pressure is low."),
 23: ("c", "Rate ∝ [A]ⁿ; doubling gives 4 times, so n = 2."),
 24: ("a", "K2MnF6 + 2SbF5 → 2KSbF6 + MnF3 + ½F2 (Christe's chemical preparation of fluorine)."),
 25: ("b", "Ni²⁺ is 3d⁸: two unpaired electrons."),
 26: ("c", "Oxalate makes Co(III) low-spin: inner-orbital d²sp³ (octahedral)."),
 27: ("a", "HgCl2 dissolves in excess KI as the complex K2[HgI4]."),
 29: ("b", "Reimer-Tiemann reaction introduces −CHO (salicylaldehyde)."),
 30: ("b", "Tollens' reagent is reduced by aldehydes but not ketones."),
 31: ("a", "Methanol-acetone: hydrogen bonds in methanol are broken, so positive deviation; the others show negative deviation."),
 32: ("d", "Mercury has the lowest vapour pressure at room temperature."),
 33: ("c", "Electrolysis is used for electrorefining and electroplating."),
 35: ("b", "Magnesium burns with a dazzling white flame forming MgO: combination."),
 36: ("a", "ZnO loses oxygen (reduced) because carbon is the reducing agent."),
 37: ("c", "HCl is oxidised to Cl2 and MnO2 is reduced; MnO2 (not MnCl2) is the oxidising agent."),
 38: ("c", "BaSO4 is a white precipitate."),
 39: ("a", "2Pb(NO3)2 → 2PbO + 4NO2 (brown) + O2."),
 40: ("a", "2 mol urea; solution volume = 1120 g/1.15 = 973.9 mL; 2/0.9739 = 2.05 M."),
 41: ("b", "Energy stored = ½CV²."),
 42: ("c", "Energy density is energy per volume, J m⁻³."),
 43: ("d", "RC is the time constant (seconds)."),
 44: ("b", "Resistivity is a material property; cutting does not change it."),
 45: ("c", "The junction rule follows from conservation of charge."),
 47: ("b", "Lenz's law gives the opposing direction."),
 48: ("b", "A stronger changing field gives more flux change and more induced current."),
 49: ("a", "A narrow (small) hysteresis loop means low core loss."),
 50: ("d", "Transformers work on mutual induction."),
 51: ("a", "An inductor passes DC easily (low reactance at zero frequency)."),
 52: ("c", "A parallel RLC circuit has maximum impedance at resonance."),
 53: ("b", "V0 = √2 × Vrms = √2 × 10√2 = 20 V."),
 54: ("c", "XL = 2πfL doubles with frequency."),
 55: ("a", "I = 90 C / 4500 s = 0.02 A = 20 mA."),
 56: ("a", "h = W/(mg) = 5900/(100 × 9.8) = 6.02 m."),
 58: ("a", "1/v = 1/f − 1/u with u = −7, f = −5 (sign convention): v = −17.5 cm (real image in front of the mirror)."),
 59: ("a", "F = 6.67×10⁻¹¹ × 60 × 60/100² = 2.4×10⁻¹¹ N."),
 60: ("c", "A converging lens bends rays together so they focus on the retina."),
 61: ("a", "MIME allows attachments in e-mail."),
 62: ("b", ".ttf is a TrueType font file, not a word-processing file."),
 63: ("d", "Random access: any location is reached in about the same time."),
 65: ("c", "Speed as a continuous function of distance: linear regression."),
 66: ("c", "Machine learning: autonomous acquisition of knowledge through computer programs."),
 67: ("d", "John McCarthy coined 'artificial intelligence' in 1956."),
 68: ("c", "Starlink satellites are in low Earth orbit (about 550 km)."),
 70: ("b", "First-generation computers used vacuum tubes."),
}

NEW_MCQ = [
 ("Primary aliphatic amines (other than methylamine) react with nitrous acid to give mainly", ("alcohols with evolution of nitrogen", "secondary amines", "nitroalkanes", "nitriles"), "a", "RNH2 + HNO2 → ROH + N2 + H2O."),
 ("According to the Hardy-Schulze rule, the coagulating power of an ion increases with its", ("size", "valency (charge)", "mass", "colour"), "b", "Higher charge on the oppositely charged ion coagulates a sol more effectively."),
 ("The molality of a solution containing 0.1 mol of solute in 500 g of water is", ("0.05 m", "0.2 m", "0.5 m", "2 m"), "b", "0.1 mol / 0.5 kg = 0.2 m."),
 ("A charged particle moves in a circle in a uniform magnetic field. Its radius r is", ("directly proportional to its speed", "independent of its mass", "directly proportional to the field B", "independent of its charge"), "a", "r = mv/(qB), so r ∝ v."),
 ("A block of mass 2 kg on a smooth surface is pushed by a 10 N horizontal force. Its acceleration is", ("2 m/s²", "5 m/s²", "10 m/s²", "20 m/s²"), "b", "a = F/m = 10/2 = 5 m/s²."),
 ("Which of the following is malicious software that demands payment to unlock a victim's files?", ("Firewall", "Ransomware", "Spreadsheet", "Compiler"), "b", "Ransomware encrypts files and demands a ransom."),
 ("Which network cable carries data as light signals?", ("Twisted pair", "Coaxial", "Fibre optic", "Telephone wire"), "c", "Optical fibre carries data as pulses of light."),
]

SAQ = [
 dict(marks=3, stem="Show that the points (2, 3, 4), (−1, −2, 1), (5, 8, 7) are collinear. (3 marks)",
      kp=[("Find AB = (−3, −5, −3) and BC = (6, 10, 6) (or distances)", 1), ("Show BC = −2 AB (parallel vectors sharing point B) or AB + BC = AC", 1), ("Conclude the points are collinear", 1)],
      model="Let A(2, 3, 4), B(−1, −2, 1), C(5, 8, 7). AB = B − A = (−3, −5, −3); BC = C − B = (6, 10, 6) = −2(−3, −5, −3) = −2 AB. So AB and BC are parallel and share point B, hence A, B, C lie on one line. (Using distances: AB = √43, BC = 2√43, AC = √43, and AB + AC = BC.)"),
 dict(marks=3, stem="Find the differential equation of the family of lines through the origin. (3 marks)",
      kp=[("Family: y = mx, m arbitrary constant", 1), ("Differentiate: dy/dx = m", 1), ("Eliminate m: x dy/dx − y = 0", 1)],
      model="Lines through the origin are y = mx, where m is an arbitrary constant. Differentiating, dy/dx = m. Substituting m = y/x gives y = x dy/dx, i.e. x (dy/dx) − y = 0, which is the required differential equation."),
 dict(marks=3, stem="Integrate the function (cos 2x + 2 sin² x)/cos² x with respect to x. (3 marks)",
      kp=[("cos 2x = 1 − 2 sin² x, so numerator = 1", 1), ("Integrand = 1/cos² x = sec² x", 1), ("Answer: tan x + C", 1)],
      model="cos 2x + 2 sin² x = (1 − 2 sin² x) + 2 sin² x = 1. So the integrand is 1/cos² x = sec² x, and ∫ sec² x dx = tan x + C."),
 dict(marks=3, stem="""A zinc plate was put into a solution of copper sulphate kept in a glass container. It was found that the blue colour of the solution faded with time. After a few days, when the zinc plate was taken out, a number of holes were observed on it.
(i) State the reason for the changes observed on the zinc plate.
(ii) Write the chemical equation for the reaction involved. (3 marks)""",
      kp=[("Zinc is more reactive than copper (higher in the reactivity series / lower reduction potential), so it displaces copper", 1), ("Zinc dissolves as Zn²⁺ ions, so holes form; Cu²⁺ (blue) is removed so colour fades; copper deposits", 1), ("Zn + CuSO4 → ZnSO4 + Cu", 1)],
      model="(i) Zinc is more reactive than copper, so it displaces copper from copper sulphate. Zinc atoms lose electrons and go into solution as Zn²⁺ ions, so the plate is eaten away and holes appear; copper is deposited, and as blue Cu²⁺ ions are used up, the solution loses its blue colour (zinc sulphate is colourless). (ii) Zn(s) + CuSO4(aq) → ZnSO4(aq) + Cu(s)."),
 dict(marks=3, stem="A solution of Ni(NO3)2 is electrolysed between platinum electrodes using a current of 5 amperes for 20 minutes. What mass of Ni is deposited at the cathode? (3 marks)",
      kp=[("Q = I t = 5 × 1200 = 6000 C", 1), ("Ni²⁺ + 2e⁻ → Ni, so 2 × 96500 C deposit 58.7 g", 1), ("Mass = 6000 × 58.7/193000 = 1.82 g", 1)],
      model="Q = I × t = 5 A × (20 × 60) s = 6000 C. Ni²⁺ + 2e⁻ → Ni: 2 × 96500 = 193000 C deposit 58.7 g of nickel. Mass deposited = 6000 × 58.7/193000 ≈ 1.82 g."),
 dict(marks=3, stem="What is the pH of a solution of 0.005 M HBr? (3 marks)",
      kp=[("HBr is a strong acid, fully ionised: [H⁺] = 0.005 = 5 × 10⁻³ M", 1), ("pH = −log(5 × 10⁻³) = 3 − log 5", 1), ("pH ≈ 2.30", 1)],
      model="HBr is a strong acid and ionises completely, so [H⁺] = 0.005 M = 5 × 10⁻³ M. pH = −log(5 × 10⁻³) = 3 − 0.699 = 2.30."),
 dict(marks=3, stem="Six lead-acid secondary cells, each of emf 2.0 V and internal resistance 0.015 Ω, are joined in series to supply a resistance of 8.5 Ω. What is the current drawn from the supply and its terminal voltage? (3 marks)",
      kp=[("Total emf = 6 × 2 = 12 V; total internal resistance = 6 × 0.015 = 0.09 Ω", 1), ("I = 12/(8.5 + 0.09) ≈ 1.4 A", 1), ("Terminal voltage V = IR ≈ 1.4 × 8.5 ≈ 11.9 V", 1)],
      model="Total emf E = 6 × 2.0 = 12 V; total internal resistance r = 6 × 0.015 = 0.09 Ω. Current I = E/(R + r) = 12/8.59 ≈ 1.40 A. Terminal voltage V = IR = 1.40 × 8.5 ≈ 11.9 V (or E − Ir = 12 − 0.13)."),
 dict(marks=3, stem="A coil of 0.1 m × 0.01 m with 200 turns, carrying a current of 1.0 mA, is placed in a uniform magnetic field of 0.1 T. Calculate the maximum torque that acts on the coil. (3 marks)",
      kp=[("τmax = NIAB (plane of coil parallel to the field)", 1), ("A = 0.1 × 0.01 = 1 × 10⁻³ m²; I = 1 × 10⁻³ A", 1), ("τ = 200 × 10⁻³ × 10⁻³ × 0.1 = 2 × 10⁻⁵ N m", 1)],
      model="Maximum torque τ = N I A B (when the field is parallel to the plane of the coil). A = 0.1 × 0.01 = 1.0 × 10⁻³ m², I = 1.0 × 10⁻³ A. τ = 200 × 1.0 × 10⁻³ × 1.0 × 10⁻³ × 0.1 = 2.0 × 10⁻⁵ N m."),
 dict(marks=3, stem="""Answer the following questions:
a) A steady current flows in a metallic conductor of non-uniform cross-section. Which of these quantities is constant along the conductor: current, current density, electric field, drift speed? (1.5 marks)
b) Is Ohm's law universally applicable for all conducting elements? If not, give examples of elements that do not obey Ohm's law. (1.5 marks)""",
      kp=[("a) Only the current is constant (charge conservation)", 0.75), ("a) Current density, electric field and drift speed vary inversely with the cross-sectional area", 0.75),
          ("b) No, Ohm's law is not universal", 0.5), ("b) Examples: semiconductor diode, transistor, thermistor, vacuum tube, electrolytes, filament lamp", 1)],
      model="""a) Only the current is constant along the conductor (the same charge passes every cross-section per second). Current density J = I/A, the electric field (E = ρJ) and the drift speed (vd = J/ne) are larger where the cross-section is smaller.
b) No. Ohm's law holds only for ohmic conductors such as metals at constant temperature. Non-ohmic examples: semiconductor diodes, transistors, thermistors, vacuum tubes, gas discharge tubes, electrolytes and the filament of a bulb whose resistance changes with temperature."""),
 dict(marks=3, stem="What are three advantages of using open-source software? (3 marks)",
      kp=[("Free or low cost: no licence fees", 1), ("Source code available: can be studied, customised and improved; no vendor lock-in", 1), ("Community support, transparency and security (bugs found and fixed quickly), interoperable standards", 1)],
      model="1. Cost: open-source software is usually free to use and distribute, saving licence fees. 2. Flexibility: the source code is available, so organisations can study, modify and customise it to their needs and are not locked into one vendor. 3. Reliability and security: a large community reviews the code, so bugs and security holes are found and fixed quickly, and there is strong community support and documentation."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
