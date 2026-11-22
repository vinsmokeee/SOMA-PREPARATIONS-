"""ME Technical Paper II (General Subject Knowledge), ENGINEERING group, BCSE 2024 - real paper. PDF sent by the founder.
Same pattern as 2025: Part I 70 MCQ x 1 (Section A Mathematics 1-20, B Chemistry 21-40, C Physics 41-60, D General IT
61-70); Part II 10 short answers x 3. Questions were retyped from the page images (the PDF's equations do not convert).
Retyped corrections: MCQ 3 'cosec⁻¹(41√4)' read as cosec⁻¹(√41/4); MCQ 12 '(d²y/dx³)²' read as (d³y/dx³)²; MCQ 18 'circle
of 8 cm' read as radius 8 cm; MCQ 42 option d (printed 30° twice) read as 60°; MCQ 60 uses g = 10 m/s².
Left out (no correct option, two defensible answers, or incomplete): MCQ 2 (range of tan⁻¹x is the open interval; no
option matches), 14 (minimum 254.4 at (8.4, 9.6) not offered), 22 (lead dissolves in both HNO₃ and acetic acid with
air), 39 (stem incomplete - the first solution is not named), 48 (options are graphs not in the text), 52 (statements
i, iii and iv are all true; no option matches), 53 (concave mirror and convex lens both work); seven new MCQs keep
Part I at 70. MCQ 46 shows the paper's circuit figure.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Engineering): BCSE 2024, batch 1"
GROUP_TAG = "eng2024"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "engineering"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper II, Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Engineering: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Let N be the set of natural numbers and R be the relation in N defined as R = {(a, b) : a = b − 2, b > 6}. Then which of the following is correct?",
"opts": [
"(2, 4) ∈ R",
"(3, 8) ∈ R",
"(6, 8) ∈ R",
"(8, 7) ∈ R"
]
},
{
"n": 3,
"stem": "The value of cot⁻¹(9) + cosec⁻¹(√41/4) is",
"opts": [
"0",
"π/4",
"tan⁻¹(2)",
"π/2"
]
},
{
"n": 4,
"stem": "If A = [aij] is a square matrix of order 2 such that aij = 1 when i ≠ j and aij = 0 when i = j, then A² is",
"opts": [
"[[1, 0], [1, 0]]",
"[[1, 1], [0, 0]]",
"[[1, 1], [1, 0]]",
"[[1, 0], [0, 1]]"
]
},
{
"n": 5,
"stem": "If A = [[x, 2], [4, 3]] and A⁻¹ = [[1/8, −1/12], [−1/6, 4/9]], then the value of x is",
"opts": [
"28/3",
"32/3",
"34/3",
"10"
]
},
{
"n": 6,
"stem": "The number of distinct real roots of the determinant |sin x, cos x, cos x; cos x, sin x, cos x; cos x, cos x, sin x| = 0 in the interval −π/4 ≤ x ≤ π/4 is",
"opts": [
"0",
"2",
"1",
"3"
]
},
{
"n": 7,
"stem": "If the function f(x) = (2x − sin⁻¹x) / (2x + tan⁻¹x) is continuous at each point of its domain, then the value of f(0) is",
"opts": [
"1/3",
"−1/3",
"2/3",
"2"
]
},
{
"n": 8,
"stem": "The point(s) on the curve y = x² at which the y-coordinate is changing six times as fast as the x-coordinate is/are",
"opts": [
"(6, 2)",
"(2, 4)",
"(3, 9)",
"(9, 3)"
]
},
{
"n": 9,
"stem": "If ∫sec²(7 − 4x) dx = a tan(7 − 4x) + C, then the value of a is",
"opts": [
"−4",
"−1/4",
"3",
"7"
]
},
{
"n": 10,
"stem": "The area bounded by the curves y = cos x, y = sin x and the y-axis, for 0 ≤ x ≤ π/4, is",
"opts": [
"2(√2 − 1)",
"√2 − 1",
"√2 + 1",
"√2"
]
},
{
"n": 11,
"stem": "The area bounded by the lines y = |x| − 1 and y = −|x| + 1 is",
"opts": [
"1 sq. unit",
"2 sq. units",
"2√2 sq. units",
"4 sq. units"
]
},
{
"n": 12,
"stem": "The order and degree of the differential equation (d³y/dx³)² − 3(d²y/dx²) + 2(dy/dx)⁴ = y⁴ are",
"opts": [
"(1, 4)",
"(3, 4)",
"(2, 4)",
"(3, 2)"
]
},
{
"n": 13,
"stem": "If a = 2i + 2j + 3k, b = −i + 2j + k and c = 3i + j are such that a + γb is perpendicular to c, then the value of γ is",
"opts": [
"3",
"0",
"4",
"8"
]
},
{
"n": 15,
"stem": "A person writes 4 letters and addresses 4 envelopes. If the letters are placed in the envelopes at random, the probability that not all the letters are placed in the right envelopes is",
"opts": [
"23/24",
"15/24",
"11/24",
"1/4"
]
},
{
"n": 16,
"stem": "∫ from 0 to 2/3 of dx/(4 + 9x²) equals",
"opts": [
"π/6",
"π/12",
"π/24",
"π/4"
]
},
{
"n": 17,
"stem": "If 6 sin⁻¹(x² − 6x + 8.5) = π, then x is equal to",
"opts": [
"1",
"2",
"3",
"8"
]
},
{
"n": 18,
"stem": "The area of the square that can be inscribed in a circle of radius 8 cm is",
"opts": [
"256 cm²",
"128 cm²",
"64√2 cm²",
"64 cm²"
]
},
{
"n": 19,
"stem": "The value of lim (x→0) (tan x − sin x)/x³ is",
"opts": [
"1",
"2",
"1/2",
"π"
]
},
{
"n": 20,
"stem": "For the probability distribution X: −4, −3, −2, −1, 0 with P(X): 0.1, 0.2, 0.3, 0.2, 0.2, E(X) is equal to",
"opts": [
"0",
"−1",
"−2",
"−1.8"
]
},
{
"n": 21,
"stem": "P₄ + 3NaOH + 3H₂O → 'A' + 3NaH₂PO₂. 'A' is",
"opts": [
"NH₃",
"PH₃",
"H₃PO₄",
"H₃PO₃"
]
},
{
"n": 23,
"stem": "The modern periodic table is based on the atomic number of the elements. The experiment which proved the significance of the atomic number was",
"opts": [
"Millikan's oil drop experiment",
"Moseley's work on X-ray spectra",
"Bragg's work on X-ray diffraction",
"Discovery of X-rays by Röntgen"
]
},
{
"n": 24,
"stem": "If the difference in electronegativities of two elements is very large, then",
"opts": [
"the bond is 50% ionic",
"the bond is 100% covalent",
"the bond is more covalent than ionic",
"the bond is more ionic than covalent"
]
},
{
"n": 25,
"stem": "The boiling point of benzene is 353.23 K. When 1.80 g of a non-volatile solute was dissolved in 90 g of benzene, the boiling point rose to 354.11 K. The molar mass of the solute is (Kb for benzene = 2.53 K kg mol⁻¹)",
"opts": [
"5.8 g mol⁻¹",
"0.58 g mol⁻¹",
"58 g mol⁻¹",
"88 g mol⁻¹"
]
},
{
"n": 26,
"stem": "Leaching of silver and gold ores is done with",
"opts": [
"NaCN/ KCN",
"NaOH/ Na₂CO₃",
"NaCl/ KCl",
"C/ CO"
]
},
{
"n": 27,
"stem": "Which of the following aqueous solutions has the highest boiling point?",
"opts": [
"1.0 M NaOH",
"1.0 M Na₂SO₄",
"1.0 M NH₄NO₃",
"1.0 M KNO₃"
]
},
{
"n": 28,
"stem": "The set with the correct order of acidity is",
"opts": [
"HClO < HClO₂ < HClO₃ < HClO₄",
"HClO₄ < HClO₃ < HClO₂ < HClO",
"HClO₄ < HClO₃ < HClO < HClO₂",
"HClO₃ < HClO₂ < HClO < HClO₄"
]
},
{
"n": 29,
"stem": "The most basic compound among the following is",
"opts": [
"benzylamine",
"aniline",
"acetanilide",
"p-nitroaniline"
]
},
{
"n": 30,
"stem": "What is the hybridisation of Xe in XeOF₄?",
"opts": [
"sp³d",
"sp³d²",
"sp²",
"sp³"
]
},
{
"n": 31,
"stem": "The value of Henry's constant KH is",
"opts": [
"greater for gases with higher solubility",
"greater for gases with lower solubility",
"constant for all gases",
"not related to the solubility of gases"
]
},
{
"n": 32,
"stem": "A 100 mL solution of 0.1 N HCl was titrated with 0.2 N NaOH. The titration was stopped after adding 30 mL of NaOH and completed by adding 0.25 N KOH. The volume of KOH required to complete the titration is",
"opts": [
"70 mL",
"32 mL",
"35 mL",
"16 mL"
]
},
{
"n": 33,
"stem": "A number of ionic compounds are insoluble in water. This is because",
"opts": [
"ionic compounds do not dissolve in water",
"water has a high dielectric constant",
"water is not a good ionising solvent",
"these compounds have exceptionally high attractive forces in their lattice"
]
},
{
"n": 34,
"stem": "For the formation of 5 mol of water, which reaction uses the most nitric acid?",
"opts": [
"3Cu + 8HNO₃ → 3Cu(NO₃)₂ + 2NO + 4H₂O",
"Al₂O₃ + 6HNO₃ → 2Al(NO₃)₃ + 3H₂O",
"4Zn + 10HNO₃ → 4Zn(NO₃)₂ + NH₄NO₃ + 3H₂O",
"Cu + 4HNO₃ → Cu(NO₃)₂ + 2NO₂ + 2H₂O"
]
},
{
"n": 35,
"stem": "A zero-order reaction is one whose rate is independent of",
"opts": [
"the temperature of the reaction",
"the concentration of the reactants",
"the concentration of the products",
"the material of the vessel in which the reaction is carried out"
]
},
{
"n": 36,
"stem": "The molecular formula of chloropicrin is",
"opts": [
"CHCl₃NO₂",
"CCl₃NO₃",
"CCl₂NO₂",
"CCl₃NO₂"
]
},
{
"n": 37,
"stem": "Sulphur does not exist as S₂ molecules because",
"opts": [
"it is less electronegative",
"it does not form pπ-pπ bonds readily",
"it has the ability to show catenation",
"it tends to show variable oxidation states"
]
},
{
"n": 38,
"stem": "Which set of conditions represents the easiest way to liquefy a gas?",
"opts": [
"Low temperature and high pressure",
"High temperature and low pressure",
"Low temperature and low pressure",
"High temperature and high pressure"
]
},
{
"n": 40,
"stem": "Liquid ammonia is used in refrigeration because of its",
"opts": [
"high dipole moment",
"high heat of vaporisation",
"high basicity",
"all of these"
]
},
{
"n": 41,
"stem": "Two point charges are placed a distance d apart, with force F between them. If a copper plate is placed between the charges, the effective force will be",
"opts": [
"F",
"2F",
"√F",
"zero"
]
},
{
"n": 42,
"stem": "A body is sliding down an inclined plane with coefficient of friction 0.5. If the normal reaction is twice the resultant downward force along the incline, the angle between the inclined plane and the horizontal is",
"opts": [
"15°",
"30°",
"45°",
"60°"
]
},
{
"n": 43,
"stem": "The work done by an external force in bringing a charge q from infinity to a point is called the",
"opts": [
"electric field due to charge q at that point",
"potential energy of charge q at that point",
"both a and b",
"none"
]
},
{
"n": 44,
"stem": "Five elements A, B, C, D and E have work functions 1.2 eV, 2.4 eV, 3.6 eV, 4.8 eV and 6 eV respectively. If light of wavelength 4000 Å falls on them, photoelectrons are emitted by",
"opts": [
"A, B and C",
"A, B, C, D and E",
"A and B",
"only E"
]
},
{
"n": 45,
"stem": "The shortest wavelength of X-rays emitted from an X-ray tube depends on",
"opts": [
"the current in the tube",
"the voltage applied to the tube",
"the nature of the gas in the tube",
"the atomic number of the target material"
]
},
{
"n": 46,
"stem": "Two identical p-n junctions may be connected in series with a battery in the three ways shown. The potential drops across the two p-n junctions are equal in",
"opts": [
"circuit 1 and circuit 2",
"circuit 2 and circuit 3",
"circuit 3 and circuit 1",
"circuit 1 only"
],
"image": "/papers/me/tech2-eng-2024-pn-circuits.png"
},
{
"n": 47,
"stem": "A ball is released from a spacecraft revolving around the earth at a height of 120 km. What will happen to the ball?",
"opts": [
"It will continue to move with velocity v along the original orbit of the spacecraft",
"It will move with the same speed tangentially to the spacecraft",
"It will fall down to the earth gradually",
"It will go very far into space"
]
},
{
"n": 49,
"stem": "The escape velocity for a rocket from earth is 11.2 km/s. What will it be (in km/s) on a planet where the acceleration due to gravity is double that on earth and the diameter is twice that of earth?",
"opts": [
"11.2",
"5.6",
"22.4",
"53.6"
]
},
{
"n": 50,
"stem": "Select the set whose dimensions are the same.",
"opts": [
"Work, energy, force",
"Velocity, momentum, impulse",
"Potential energy, kinetic energy, momentum",
"Pressure, stress, coefficient of elasticity"
]
},
{
"n": 51,
"stem": "A potentiometer wire of length 100 cm has resistance 500 Ω. It is connected in series with a resistance R and a driver cell of emf 120 V. The balancing length for a cell of emf 12 V is 40 cm. Then R is",
"opts": [
"4000 Ω",
"3000 Ω",
"1500 Ω",
"1000 Ω"
]
},
{
"n": 54,
"stem": "An average emf of 20 V is induced in an inductor when the current in it changes from 2.5 A in one direction to the same value in the opposite direction in 0.1 s. The self-inductance of the inductor is",
"opts": [
"0.4 H",
"1 H",
"2 H",
"0.6 H"
]
},
{
"n": 55,
"stem": "A slab of dielectric constant k = 4 fills the space between the plates of a parallel-plate air capacitor (C = 2 μF without the slab), which is connected across a cell of emf 100 V; the cell stays connected. Find the work done in slowly taking the slab out of the capacitor.",
"opts": [
"10 mJ",
"20 mJ",
"30 mJ",
"60 mJ"
]
},
{
"n": 56,
"stem": "A 20 N metal block is suspended by a spring balance. A beaker containing some water is placed on a weighing machine which reads 40 N. The spring balance is lowered so that the block is immersed in the water; the spring balance now reads 16 N. The reading of the weighing machine will be",
"opts": [
"36 N",
"60 N",
"44 N",
"56 N"
]
},
{
"n": 57,
"stem": "A body moves 10 m along a straight line under the action of a force of 5 N. If the work done is 25 J, the angle between the force and the direction of motion is",
"opts": [
"0°",
"30°",
"60°",
"90°"
]
},
{
"n": 58,
"stem": "The potential energy associated with a conservative force is U = Ax², where A is a constant. Then the",
"opts": [
"force always tends to accelerate the particle towards the origin",
"force always tends to accelerate the particle away from the origin",
"force tends to accelerate the particle towards the origin if A is positive",
"force tends to accelerate the particle towards the origin if A is negative"
]
},
{
"n": 59,
"stem": "A body of mass m with initial velocity v makes a head-on elastic collision with a stationary body of mass M. After the collision the body of mass m comes to rest and only the body of mass M moves. This happens only when",
"opts": [
"m >> M",
"m << M",
"m = M",
"m = ½M"
]
},
{
"n": 60,
"stem": "An engine generates 10 kW of power. How much time will it take to lift a mass of 200 kg to a height of 40 m? (g = 10 m/s²)",
"opts": [
"4 s",
"5 s",
"8 s",
"10 s"
]
},
{
"n": 61,
"stem": "Which natural element is the primary element in computer chips?",
"opts": [
"Silicon",
"Carbon",
"Iron",
"Uranium"
]
},
{
"n": 62,
"stem": "The speed of a computer's processor is measured in",
"opts": [
"nanoseconds",
"kilo-seconds",
"gigahertz",
"megabytes"
]
},
{
"n": 63,
"stem": "Credit cards, debit cards and smart cards are called",
"opts": [
"deposited money",
"plastic money",
"instant money",
"stored money"
]
},
{
"n": 64,
"stem": "The main memory (RAM) of a computer system is",
"opts": [
"volatile",
"non-volatile",
"unrestricted",
"restricted"
]
},
{
"n": 65,
"stem": "C is a ______ type of high-level language.",
"opts": [
"procedural",
"non-procedural",
"business",
"scientific"
]
},
{
"n": 66,
"stem": "Which of the following algorithms is used for public key encryption?",
"opts": [
"AES",
"DES",
"RSA",
"MD5"
]
},
{
"n": 67,
"stem": "In cloud computing, what does IaaS stand for?",
"opts": [
"Infrastructure as a Service",
"Information as a Service",
"Integration as a Service",
"Internet as a Service"
]
},
{
"n": 68,
"stem": "Which of the following is the most secure form of authentication?",
"opts": [
"Passwords",
"Biometrics",
"Two-factor authentication",
"Security questions"
]
},
{
"n": 69,
"stem": "What does the term 'phishing' refer to?",
"opts": [
"A type of firewall",
"A method used to protect data",
"A technique to obtain sensitive information by disguising as a trustworthy entity",
"A process for encrypting data"
]
},
{
"n": 70,
"stem": "Which of the following is a key concept of social engineering attacks?",
"opts": [
"Exploiting software vulnerabilities",
"Tricking people into revealing confidential information",
"Encrypting data to prevent access",
"Brute-force password cracking"
]
}
]"""

KEY = {
    1: ("c", "a = b − 2 with b > 6: (6, 8) satisfies 6 = 8 − 2 and 8 > 6."),
    3: ("b", "cosec⁻¹(√41/4) = tan⁻¹(4/5) and cot⁻¹9 = tan⁻¹(1/9); tan⁻¹(1/9) + tan⁻¹(4/5) = tan⁻¹[(41/45)/(41/45)] = tan⁻¹1 = π/4."),
    4: ("d", "A = [[0, 1], [1, 0]], so A² = I."),
    5: ("b", "A⁻¹ = (1/(3x − 8))[[3, −2], [−4, x]]; 3/(3x − 8) = 1/8 gives 3x − 8 = 24, x = 32/3 (check: x/24 = 4/9)."),
    6: ("c", "The determinant = (sin x − cos x)²(sin x + 2cos x) = 0; in [−π/4, π/4] only x = π/4."),
    7: ("a", "As x → 0, (2x − x)/(2x + x) = 1/3."),
    8: ("c", "dy/dt = 2x dx/dt = 6 dx/dt gives x = 3, y = 9."),
    9: ("b", "∫sec²(7 − 4x)dx = −(1/4) tan(7 − 4x) + C."),
    10: ("b", "∫₀^{π/4}(cos x − sin x)dx = [sin x + cos x]₀^{π/4} = √2 − 1."),
    11: ("b", "The region is a square with vertices (±1, 0), (0, ±1): diagonals 2 and 2, area = ½ x 2 x 2 = 2."),
    12: ("d", "Highest derivative d³y/dx³ (order 3), raised to power 2 (degree 2)."),
    13: ("d", "(a + γb)·c = 3(2 − γ) + (2 + 2γ) = 8 − γ = 0, γ = 8."),
    15: ("a", "P(all correct) = 1/4! = 1/24, so P(not all correct) = 23/24."),
    16: ("c", "∫dx/(4 + 9x²) = (1/6) tan⁻¹(3x/2); from 0 to 2/3 = (1/6)(π/4) = π/24."),
    17: ("b", "sin⁻¹(...) = π/6, so x² − 6x + 8.5 = 0.5, x² − 6x + 8 = 0, x = 2 or 4."),
    18: ("b", "Diagonal of the square = diameter = 16 cm; area = d²/2 = 128 cm²."),
    19: ("c", "tan x − sin x ≈ x³/2 for small x, so the limit is 1/2."),
    20: ("d", "E(X) = −0.4 − 0.6 − 0.6 − 0.2 + 0 = −1.8."),
    21: ("b", "White phosphorus with hot NaOH gives phosphine (PH₃) and sodium hypophosphite."),
    23: ("b", "Moseley's X-ray spectra showed frequency depends on atomic number."),
    24: ("d", "A large electronegativity difference gives a mainly ionic bond."),
    25: ("c", "ΔTb = 0.88 K; M = Kb x w x 1000/(ΔTb x W) = 2.53 x 1.8 x 1000/(0.88 x 90) ≈ 58 g/mol."),
    26: ("a", "Gold and silver are leached with dilute NaCN/ KCN in the presence of air."),
    27: ("b", "Na₂SO₄ gives 3 ions (i = 3), the largest elevation; the others give 2."),
    28: ("a", "Acidity of chlorine oxoacids increases with the number of oxygen atoms."),
    29: ("a", "In benzylamine the lone pair is not delocalised into the ring, so it is the most basic."),
    30: ("b", "XeOF₄: 6 electron pairs (5 bonds + 1 lone pair): sp³d², square pyramidal."),
    31: ("b", "p = KH x; a larger KH means lower solubility at a given pressure."),
    32: ("d", "HCl 10 meq; NaOH added 6 meq; remaining 4 meq = 0.25 x V, V = 16 mL."),
    33: ("d", "Some ionic compounds have lattice energy greater than hydration energy."),
    34: ("c", "Per 5 mol water: a and b and d need 10 mol HNO₃; c needs 10 x 5/3 ≈ 16.7 mol."),
    35: ("b", "Zero-order rate is independent of reactant concentration."), 36: ("d", "Chloropicrin is trichloronitromethane, CCl₃NO₂."),
    37: ("b", "Large sulphur atoms do not form strong pπ-pπ double bonds, so sulphur forms S₈ rings."),
    38: ("a", "Low temperature and high pressure favour liquefaction."), 40: ("b", "Its high latent heat of vaporisation absorbs much heat."),
    41: ("d", "A conductor between the charges shields them: no net force acts across it."),
    42: ("c", "mg cos θ = 2(mg sin θ − 0.5 mg cos θ) gives cos θ = sin θ, θ = 45°."),
    43: ("b", "This work is the potential energy of the charge (potential is that work per unit charge)."),
    44: ("c", "Photon energy = 12400/4000 ≈ 3.1 eV, more than the work functions of A and B only."),
    45: ("b", "λmin = hc/eV depends only on the tube voltage."),
    46: ("c", "In circuits 1 and 3 both junctions are equally (forward) biased; in circuit 2 one is forward and one reverse biased."),
    47: ("a", "The released ball has the same orbital velocity, so it continues in the same orbit."),
    49: ("c", "v = √(2gR); doubling g and R doubles v: 22.4 km/s."),
    50: ("d", "Pressure, stress and modulus of elasticity all have dimensions [ML⁻¹T⁻²]."),
    51: ("c", "12 = I x (500 x 0.4) gives I = 0.06 A; 120/(500 + R) = 0.06 gives R = 1500 Ω."),
    54: ("a", "e = L ΔI/Δt: 20 = L x 5/0.1, L = 0.4 H."),
    55: ("c", "With the cell connected, work = ½(k − 1)CV² = ½ x 3 x 2 x 10⁻⁶ x 10⁴ = 0.03 J = 30 mJ."),
    56: ("c", "Buoyant force = 20 − 16 = 4 N acts down on the water: 40 + 4 = 44 N."),
    57: ("c", "25 = 5 x 10 cos θ, cos θ = 0.5, θ = 60°."),
    58: ("c", "F = −dU/dx = −2Ax: towards the origin when A > 0."),
    59: ("c", "In an elastic head-on collision with equal masses, the velocities exchange."),
    60: ("c", "t = mgh/P = 200 x 10 x 40/10 000 = 8 s."),
    61: ("a", "Silicon."), 62: ("c", "Processor clock speed is measured in hertz (GHz)."), 63: ("b", "Plastic money."),
    64: ("a", "RAM is volatile."), 65: ("a", "C is a procedural language."), 66: ("c", "RSA is a public-key algorithm."),
    67: ("a", "Infrastructure as a Service."), 68: ("c", "Two-factor authentication combines two independent factors."),
    69: ("c", "Phishing impersonates a trusted entity to steal information."), 70: ("b", "Social engineering manipulates people."),
}
NEW_MCQ = [
    ("The range of the function f(x) = sin⁻¹x (principal value) is", ["[0, π]", "[−π/2, π/2]", "(−π/2, π/2)", "[−1, 1]"], "b", "The principal branch of sin⁻¹ takes values in [−π/2, π/2]."),
    ("The derivative of eˣ sin x is", ["eˣ cos x", "eˣ(sin x + cos x)", "eˣ(sin x − cos x)", "−eˣ cos x"], "b", "Product rule."),
    ("The pH of a 0.001 M HCl solution is", ["1", "2", "3", "11"], "c", "[H⁺] = 10⁻³ M, pH = 3."),
    ("Which gas is produced when zinc reacts with dilute sulphuric acid?", ["Oxygen", "Hydrogen", "Sulphur dioxide", "Chlorine"], "b", "Zn + H₂SO₄ → ZnSO₄ + H₂."),
    ("The gravitational potential at the centre of a uniform solid sphere (Earth) of mass M and radius R is", ["0", "−GM/R", "−3GM/(2R)", "−GM/(2R)"], "c", "Inside, V = −GM(3R² − r²)/(2R³); at r = 0, V = −1.5GM/R."),
    ("Which statement about the magnetic force on a moving charge is true?", ["It does work on the charge", "It is maximum when the charge moves along the field", "It is perpendicular to the velocity and does no work", "It acts on a stationary charge"], "c", "F = q v x B is perpendicular to v, so it does no work."),
    ("A convex lens of focal length 20 cm forms a real image of the same size as the object when the object is placed at", ["10 cm", "20 cm", "40 cm", "infinity"], "c", "At 2f the image is real, inverted and the same size."),
]
SAQ = [
 dict(marks=3, stem="Show that the following equations are consistent: 2x + 3y + 4 = 0; x + 2y + 3 = 0; 3x + 4y + 5 = 0. (3 marks)",
      kp=[("Solve two equations: from 2x + 3y = −4 and x + 2y = −3: x = 1, y = −2", 1.5), ("Substitute in third: 3(1) + 4(−2) + 5 = 0 ✓ (or determinant of augmented coefficients = 0) → consistent, unique solution", 1.5)],
      model="Solve the first two: 2x + 3y = −4 and x + 2y = −3. From the second, x = −3 − 2y; substituting, 2(−3 − 2y) + 3y = −4, so −6 − y = −4, y = −2 and x = 1. Check in the third: 3(1) + 4(−2) + 5 = 3 − 8 + 5 = 0 ✓. All three lines pass through (1, −2), so the equations are consistent. (Equivalently, the determinant |2 3 4; 1 2 3; 3 4 5| = 2(10 − 12) − 3(5 − 9) + 4(4 − 6) = −4 + 12 − 8 = 0.)"),
 dict(marks=3, stem="Write the first five terms of the sequence a₁ = 3, aₙ = 3aₙ₋₁ + 2 for all n > 1, and obtain the corresponding series. (3 marks)",
      kp=[("Terms: 3, 11, 35, 107, 323", 2), ("Series: 3 + 11 + 35 + 107 + 323 + ...", 1)],
      model="a₁ = 3; a₂ = 3(3) + 2 = 11; a₃ = 3(11) + 2 = 35; a₄ = 3(35) + 2 = 107; a₅ = 3(107) + 2 = 323. The corresponding series is 3 + 11 + 35 + 107 + 323 + ... (sum of the first five terms = 479)."),
 dict(marks=3, stem="Find the distance between P(x₁, y₁) and Q(x₂, y₂) when (i) PQ is parallel to the y-axis; (ii) PQ is parallel to the x-axis. (3 marks)",
      kp=[("Distance formula PQ = √[(x₂ − x₁)² + (y₂ − y₁)²]", 1), ("(i) parallel to y-axis: x₁ = x₂, PQ = |y₂ − y₁|", 1), ("(ii) parallel to x-axis: y₁ = y₂, PQ = |x₂ − x₁|", 1)],
      model="PQ = √[(x₂ − x₁)² + (y₂ − y₁)²]. (i) If PQ is parallel to the y-axis, the x-coordinates are equal (x₁ = x₂), so PQ = √[(y₂ − y₁)²] = |y₂ − y₁|. (ii) If PQ is parallel to the x-axis, y₁ = y₂, so PQ = |x₂ − x₁|."),
 dict(marks=3, stem="Analysis of water in a place shows that the water contains calcium chloride. People in that place are advised to use detergents for washing clothes. State at least two reasons. (3 marks)",
      kp=[("Water is hard (Ca²⁺); soap reacts with Ca²⁺ to form insoluble calcium salts (scum), wasting soap and not lathering", 1.5),
          ("Detergents (sulphonates) do not form insoluble precipitates with Ca²⁺/ Mg²⁺, so they lather and clean in hard water; also less residue on clothes", 1.5)],
      model="Calcium chloride makes the water hard. (1) Soap (sodium stearate) reacts with Ca²⁺ ions to form insoluble calcium stearate (scum): 2C₁₇H₃₅COONa + CaCl₂ → (C₁₇H₃₅COO)₂Ca↓ + 2NaCl, so much soap is wasted, it does not lather and scum sticks to clothes. (2) Synthetic detergents (sodium alkylbenzene sulphonates) do not form insoluble salts with calcium or magnesium ions, so they lather and clean well even in hard water, leaving clothes clean without deposits."),
 dict(marks=3, stem="Dry air was passed successively through a solution of 5 g of a solute in 180 g of water and then through pure water. The loss in weight of the solution was 2.50 g and that of the pure solvent was 0.04 g. What is the molecular weight of the solute? (3 marks)",
      kp=[("Ostwald-Walker: (p° − p)/p° = loss of solvent/(total loss) = 0.04/2.54 (or (p° − p)/p = 0.04/2.50)", 1.5),
          ("= n₂/n₁ ≈ (5/M)/(180/18) → M = 0.5/0.0157 ≈ 31.8 g/mol (≈ 31-32)", 1.5)],
      model="By the Ostwald-Walker method, the loss in weight of the solution is proportional to p (vapour pressure of solution) and the loss of the pure solvent to (p° − p). So (p° − p)/p° = 0.04/(2.50 + 0.04) = 0.04/2.54 = 0.0157. Relative lowering of vapour pressure = mole fraction of solute ≈ n₂/n₁ = (5/M)/(180/18) = 0.5/M. Hence M = 0.5/0.0157 ≈ 31.8 g/mol (using (p° − p)/p = n₂/n₁ gives 0.5/0.016 = 31.25). The molecular weight is about 32."),
 dict(marks=3, stem="A reaction is second order with respect to a reactant. How will the rate of reaction be affected if the concentration of this reactant is (i) doubled and (ii) reduced to half? (3 marks)",
      kp=[("Rate = k[A]²", 1), ("(i) doubled: rate x 2² = 4 times", 1), ("(ii) halved: rate x (½)² = one-quarter", 1)],
      model="For a second-order reaction, rate = k[A]². (i) If [A] is doubled, rate = k(2[A])² = 4k[A]², so the rate becomes four times. (ii) If [A] is halved, rate = k([A]/2)² = ¼k[A]², so the rate becomes one-fourth."),
 dict(marks=3, stem="Which gate does the following truth table represent, and why? A = 0, B = 0 → Y = 0; A = 0, B = 1 → Y = 0; A = 1, B = 0 → Y = 0; A = 1, B = 1 → Y = 1. (3 marks)",
      kp=[("AND gate", 1.5), ("Output is 1 only when both inputs are 1; Y = A·B", 1.5)],
      model="It is an AND gate, because the output Y is 1 only when both inputs A and B are 1; if either input is 0 the output is 0. Its Boolean expression is Y = A·B."),
 dict(marks=3, stem="Answer the following questions.\na) When a glass rod is rubbed with a silk cloth, charges appear on both. A similar phenomenon is observed with many other pairs of bodies. Explain how this observation is consistent with the law of conservation of charge. (1.5 marks)\nb) Explain why two electric field lines never cross each other at any point. (1.5 marks)",
      kp=[("a) Rubbing transfers electrons from glass to silk; glass becomes positive and silk equally negative; total charge stays zero - charge is neither created nor destroyed, only transferred", 1.5),
          ("b) The tangent to a field line gives the direction of the field; if two lines crossed, the field would have two directions at one point, which is impossible", 1.5)],
      model="a) Rubbing does not create charge; it transfers electrons from one body to the other. Electrons move from the glass rod to the silk, so the glass becomes positively charged and the silk acquires an equal negative charge. The total charge of the isolated system (glass + silk) remains zero before and after, as the law of conservation of charge requires.\nb) The tangent at any point on an electric field line gives the direction of the electric field there. If two field lines crossed, there would be two tangents - two directions of the field - at the same point, which is impossible because the field at a point has a single, unique direction."),
 dict(marks=3, stem="The storage battery of a car has an emf of 12 V. If the internal resistance of the battery is 0.4 Ω, what is the maximum current that can be drawn from the battery? (3 marks)",
      kp=[("Maximum current when external resistance R = 0 (short circuit): I = E/(R + r) → E/r", 1.5), ("I = 12/0.4 = 30 A", 1.5)],
      model="Current I = E/(R + r). It is maximum when the external resistance R = 0 (terminals short-circuited): Imax = E/r = 12 V/0.4 Ω = 30 A."),
 dict(marks=3, stem="Explain the concept of Big Data and its impact on business decision-making. (3 marks)",
      kp=[("Big Data: extremely large, fast and varied datasets beyond traditional tools - characterised by volume, velocity, variety (veracity, value)", 1.5),
          ("Impact: data-driven decisions, customer insights/ personalisation, predictive analytics and forecasting, operational efficiency, risk/ fraud detection, new products; challenges - privacy, quality, skills", 1.5)],
      model="Big Data refers to datasets so large, fast-moving and varied that traditional tools cannot store or analyse them efficiently. It is described by the Vs: volume (huge amounts), velocity (generated and processed in real time), variety (structured, text, images, sensor and social media data), plus veracity (quality) and value. Impact on business decisions: companies analyse it with analytics and machine learning to make evidence-based rather than intuition-based decisions; understand customers and personalise products and marketing; forecast demand and trends (predictive analytics); optimise operations, supply chains and pricing; detect fraud and manage risk in real time; and develop new products and services. It also brings challenges - data privacy and security, data quality, cost and the need for skilled analysts."),
]
Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
