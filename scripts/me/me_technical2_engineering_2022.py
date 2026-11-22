"""ME Technical Paper II (General Subject Knowledge), ENGINEERING group, BCSE 2022 - real paper (PDF sent by the founder).
Same pattern as 2025: Part I 70 MCQ x 1 (Section A Mathematics 1-20, B Chemistry 21-40, C Physics 41-60, D General IT
61-70); Part II 10 short answers x 3. Mathematics retyped from the page images.
Not loaded: MCQ 18 (struck out on the RCSC paper itself). Left out: 6 and 19 (true/false with only two options), 10
(∫7x⁴/√(x⁵ + 20) dx = (14/5)√(x⁵ + 20) - not offered), 13 (P(at least one six) = 91/216 - not offered), 22 (the
IUPAC name, propyne, is not offered), 33 (statement b says 'group' for period, so two statements are wrong), 35 (dilution
of a buffer: 'no effect' and 'little effect' both defensible), 48 (power factor options do not fit), 67 (MICR key
uncertain). Ten new MCQs keep Part I at 70. Typo fixes: MCQ 17 'Solve' read as factorise; MCQ 23 'dichromatic' as
dichromate; MCQ 27 '+ cFe' as → cFe.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Engineering): BCSE 2022, batch 1"
GROUP_TAG = "eng2022"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "engineering"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2022 Main Examination, Technical Paper II, Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Engineering: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "If y = ax² + b, then dy/dx at x = 2 is equal to",
"opts": [
"2a",
"3a",
"4a",
"None of the above"
]
},
{
"n": 2,
"stem": "Let f: R → R be defined by f(x) = 2x + cos x. Then f",
"opts": [
"has a maximum at x = 0",
"has a minimum at x = 3t",
"is an increasing function",
"is a decreasing function"
]
},
{
"n": 3,
"stem": "∫ from 0 to 2 of x² dx =",
"opts": [
"2",
"2/3",
"8/3",
"None of these"
]
},
{
"n": 4,
"stem": "∫ from 0 to π of sin²x dx =",
"opts": [
"π/2",
"π/4",
"2π",
"4π"
]
},
{
"n": 5,
"stem": "The curve for which the slope of the tangent at any point is equal to the ratio of the abscissa to the ordinate of the point is",
"opts": [
"an ellipse",
"a parabola",
"a circle",
"a hyperbola"
]
},
{
"n": 7,
"stem": "If A = [1, 2, 3; 9, 3, 6; 1, 0, 2] and B = [1, 1, 0; 2, 8, 1; 0, 2, 1] (rows separated by ';'), then find A + B.",
"opts": [
"[1, 3, 6; 2, 9, 6; 4, 5, 8]",
"[2, 3, 3; 11, 11, 7; 1, 2, 3]",
"[2, 3, 3; 9, 9, 7; 1, 4, 5]",
"[10, 3, 4; 9, 9, 6; 1, 7, 8]"
]
},
{
"n": 8,
"stem": "Find the transpose of A = [2, −1; −3, 6] (rows separated by ';').",
"opts": [
"[2, −3; −1, 6]",
"[2, −1; −3, 6]",
"[6, −1; −3, 2]",
"[−2, 1; 3, −6]"
]
},
{
"n": 9,
"stem": "Find the order of the differential equation 9 d²y/dx² = 1.",
"opts": [
"1",
"3",
"2",
"4"
]
},
{
"n": 11,
"stem": "If cos⁻¹x = y, then which of the following is correct?",
"opts": [
"0 < y < π",
"−π/2 ≤ y ≤ π/2",
"−π/2 < y < π/2",
"0 ≤ y ≤ π"
]
},
{
"n": 12,
"stem": "Dema has 6 kira, 8 tegos and 5 wonjus. How many different combinations of one kira, one tego and one wonju can Dema wear?",
"opts": [
"240",
"360",
"180",
"120"
]
},
{
"n": 14,
"stem": "Solve for x: x(x + 3) = 0",
"opts": [
"x = 0 or 3",
"x = 0 or −3",
"x = −3 or +3",
"x = 0 or 1"
]
},
{
"n": 15,
"stem": "If x = 2 is a root of the equation 3x² − 5x − 2k = 0, determine the value of k.",
"opts": [
"2",
"−2",
"1",
"3"
]
},
{
"n": 16,
"stem": "sin[π/3 − sin⁻¹(−½)] is equal to",
"opts": [
"½",
"⅓",
"−1",
"1"
]
},
{
"n": 17,
"stem": "Factorise 8x² + 10x + 3 (printed 'Solve').",
"opts": [
"(4x + 3)(3x + 2)",
"(4x + 3)(2x + 1)",
"(4x − 3)(2x + 1)",
"(4x − 3)(2x − 1)"
]
},
{
"n": 20,
"stem": "The area of the region bounded by the curve x² = 4y and the straight line x = 4y − 2 is",
"opts": [
"3/8 sq. units",
"5/8 sq. units",
"7/8 sq. units",
"9/8 sq. units"
]
},
{
"n": 21,
"stem": "The silver mirror test is given by which of the following compounds? 1. Benzophenone 2. Acetaldehyde 3. Acetone 4. Formaldehyde",
"opts": [
"2 & 4",
"Only 1",
"Only 2",
"1 & 3"
]
},
{
"n": 23,
"stem": "A 'breath test' used by traffic police to check drunk driving uses",
"opts": [
"potassium dichromate-sulphuric acid",
"turmeric on filter paper",
"potassium permanganate-sulphuric acid",
"silica gel coated with silver nitrate"
]
},
{
"n": 24,
"stem": "_______________is not acidic.",
"opts": [
"CCl4",
"SbCl4",
"PCl4",
"PCl3"
]
},
{
"n": 25,
"stem": "Many marine animals use _______________ dissolved in sea-water to make their shells.",
"opts": [
"Carbonates",
"Acids",
"Alkalis",
"Silica"
]
},
{
"n": 26,
"stem": "Which combination of atoms can form a polar covalent bond?",
"opts": [
"H and Br",
"H and H",
"Na and Br",
"N and N"
]
},
{
"n": 27,
"stem": "Consider the reaction a Fe₂O₃(s) + b CO(g) → c Fe(s) + d CO₂(g). In the balanced equation, the values of the coefficients a, b, c and d respectively are",
"opts": [
"3, 2, 3, 1",
"2, 3, 3, 1",
"1, 3, 2, 3",
"3, 3, 2, 1"
]
},
{
"n": 28,
"stem": "Which one of the following is an element?",
"opts": [
"Topaz",
"Ruby",
"Diamond",
"Sapphire"
]
},
{
"n": 29,
"stem": "The outer electron configuration of Gd (atomic number 64) is",
"opts": [
"4f³5d⁵6s²",
"4f⁷5d¹6s²",
"4f⁸5d⁰6s²",
"4f⁴5d⁴6s²"
]
},
{
"n": 30,
"stem": "How many optical isomers are there in Glucose?",
"opts": [
"8",
"12",
"16",
"Cannot be predicted"
]
},
{
"n": 31,
"stem": "When water is added to anhydrous white copper sulphate, the color will change to:",
"opts": [
"Yellow",
"Green",
"Blue",
"Red"
]
},
{
"n": 32,
"stem": "The organic reaction CH₃–CH=O + H₂N–OH → CH₃–CH=N–OH + H₂O is an example of",
"opts": [
"an addition reaction",
"a condensation reaction",
"an oxidation reaction",
"an elimination reaction"
]
},
{
"n": 34,
"stem": "What is the normality of a 1M solution of H3PO4?",
"opts": [
"0.5 N",
"2.0 N",
"1.0 N",
"3.0 N"
]
},
{
"n": 36,
"stem": "A student performs five titrations and obtains a mean result of 0.110 M with a standard deviation of 0.001 M. if the actual concentration of the titrated solution is 0.100 M, which of the following is TRUE about the titration results?",
"opts": [
"Accurate but precise",
"Both accurate and precise",
"Precise but not accurate",
"There are insufficient data to determine the accuracy and precision of the results"
]
},
{
"n": 37,
"stem": "Which of the following is a primary standard for use in standardizing bases?",
"opts": [
"Ammonium hydroxide",
"Sulfuric acid",
"Acetic acid",
"Potassium hydrogen phthalate"
]
},
{
"n": 38,
"stem": "When ferric oxide, Fe₂O₃, is dissolved in 6 M HNO₃, which iron-containing species predominates in solution?",
"opts": [
"FeO₂⁻",
"Fe(OH)₄⁻",
"Fe(OH)₃",
"[Fe(H₂O)₆]³⁺"
]
},
{
"n": 39,
"stem": "Of the following ionic substances, which has the greatest lattice enthalpy?",
"opts": [
"MgO",
"MgS",
"NaF",
"NaCl"
]
},
{
"n": 40,
"stem": "The strongest base in liquid ammonia is",
"opts": [
"NH₃",
"NH₂⁻",
"NH₄⁺",
"OH⁻"
]
},
{
"n": 41,
"stem": "The force per unit charge is known as ____________.",
"opts": [
"electric current",
"electric potential",
"electric field",
"electric space"
]
},
{
"n": 42,
"stem": "What happens when a plastic scale is rubbed against your hair?",
"opts": [
"Gains protons from hair",
"Gains electrons from hair",
"Gives electrons to hair",
"Gives protons to hair"
]
},
{
"n": 43,
"stem": "The work done against electrostatic force gets stored in which form of energy?",
"opts": [
"Thermal energy",
"Kinetic energy",
"Potential energy",
"Solar energy"
]
},
{
"n": 44,
"stem": "In a parallel plate capacitor, the capacity increases if",
"opts": [
"area of the plate is decreased.",
"distance between the plates increases.",
"area of the plate is increased.",
"dielectric constantly decreases."
]
},
{
"n": 45,
"stem": "Which of the graphs (a)-(d) shown in the figure represents an ohmic conductor?",
"opts": [
"Graph (a): straight line through the origin",
"Graph (b): curve rising slowly then steeply",
"Graph (c): curve rising steeply then levelling off",
"Graph (d): curve rising and then falling back to zero"
],
"image": "/papers/me/tech2-eng-2022-m45.png"
},
{
"n": 46,
"stem": "Which of the following apparatus construction uses electromagnetic induction?",
"opts": [
"Voltmeter",
"Galvanometer",
"Generator",
"Electric Motor"
]
},
{
"n": 47,
"stem": "An alternating current can be produced by:",
"opts": [
"Choke Coil",
"Dynamo",
"Electric Motor",
"Transformer"
]
},
{
"n": 49,
"stem": "Which of the following phenomenon is used in optical fibre?",
"opts": [
"Refraction",
"Diffraction",
"Scattering",
"Total Internal Reflection"
]
},
{
"n": 50,
"stem": "For a total internal reflection, which of the following is CORRECT?",
"opts": [
"Light travels from rarer to denser medium.",
"Light travels from denser to rarer medium.",
"Light travels in air only.",
"Light travels in water only."
]
},
{
"n": 51,
"stem": "Light year is the unit of:",
"opts": [
"Distance",
"Time",
"Intensity of light",
"None of these"
]
},
{
"n": 52,
"stem": "Polaroid glasses are used in sunglasses because",
"opts": [
"they are cheaper.",
"they are lighter in weight.",
"they look fashionable.",
"they reduce the light intensity to half on account of polarization."
]
},
{
"n": 53,
"stem": "A laser beam is used for locating distant objects because",
"opts": [
"it is monochromatic.",
"it is not chromatic.",
"it is not observed.",
"it has small angular spread."
]
},
{
"n": 54,
"stem": "Compared to liquids and solids, gases are",
"opts": [
"good conductors of electricity.",
"best conductors of electricity.",
"very poor conductors of electricity.",
"good or bad conductors of electricity depending upon the nature of the gas."
]
},
{
"n": 55,
"stem": "The photoelectric effect is based on the law of conservation of:",
"opts": [
"Energy",
"Momentum",
"Mass",
"Angular momentum"
]
},
{
"n": 56,
"stem": "Electrons in the atom are held to the nucleus by:",
"opts": [
"Nuclear Force",
"Coulomb’s Force",
"Gravitational Force",
"Van Der Waal’s Force"
]
},
{
"n": 57,
"stem": "Half-life of an radio active substance depends on:",
"opts": [
"Pressure",
"Temperature",
"Density",
"None of the above"
]
},
{
"n": 58,
"stem": "Fusion takes place at high temperature because",
"opts": [
"atom are ionised at high temperature.",
"molecules break up at high temperature.",
"nuclei break up at high temp.",
"kinetic energy is high enough to overcome repulsion between nuclei."
]
},
{
"n": 59,
"stem": "What bonds are present in a semiconductor?",
"opts": [
"Monovalent",
"Bivalent",
"Trivalent",
"Covalent"
]
},
{
"n": 60,
"stem": "A microphone converts",
"opts": [
"sound signals into electrical signals.",
"electrical signals into sound signals.",
"both (a) and (b)",
"Neither (a) nor (b)"
]
},
{
"n": 61,
"stem": "The octal equivalent of the binary number 11010.1011 is",
"opts": [
"63.51",
"32.27",
"32.54",
"None of the above"
]
},
{
"n": 62,
"stem": "Mnemonic codes and variable names are used in",
"opts": [
"a machine language.",
"an assembly language.",
"a high-level language.",
"All of the above"
]
},
{
"n": 63,
"stem": "What was the first ARPANET message?",
"opts": [
"“hello world”",
"“lo”",
"“mary had a little lamb”",
"“cyberspace, the final frontier”"
]
},
{
"n": 64,
"stem": "Who co-founded Hotmail in 1996 and then sold the company to Microsoft?",
"opts": [
"Shawn Fanning",
"Sabeer Bhatia",
"Ada Byron Lovelace",
"Ray Tomlinson"
]
},
{
"n": 65,
"stem": "The main purpose of a data link content monitor is to",
"opts": [
"determine the type of transmission used in data link.",
"detect problems in protocols.",
"determine the type of switching used in data link.",
"determine the flow of data."
]
},
{
"n": 66,
"stem": "Protection of data from a natural disaster such as a flood, storm belongs to which of the following network issue?",
"opts": [
"Performance",
"Reliability",
"Security",
"Management"
]
},
{
"n": 68,
"stem": "When used with I/O devices, the term intelligent implies",
"opts": [
"a colour output capability.",
"speech processing capability.",
"high speed printing capability.",
"features to support off-line and online tasks."
]
},
{
"n": 69,
"stem": "Which of the following does not affect the resolution of a video display image?",
"opts": [
"Bandwidth",
"Raster scan rate",
"Screen size",
"Vertical and horizontal lines of resolution"
]
},
{
"n": 70,
"stem": "Why is BCC used in an e-mail?",
"opts": [
"It allows the recipient to identify all the other recipients in the list when a group email address is used.",
"It allows sender to indicate who the email is for if there is more than one recipient.",
"It allows the sender of a message to conceal the recipient entered in the BCC field from the other recipients.",
"It allows recipients to be visible to all other recipients of the message."
]
}
]"""

KEY = {
    1: ("c", "dy/dx = 2ax; at x = 2 it is 4a."),
    2: ("c", "f′(x) = 2 − sin x ≥ 1 > 0 for all x, so f is increasing (no maximum or minimum)."),
    3: ("c", "∫₀² x² dx = [x³/3]₀² = 8/3."),
    4: ("a", "sin²x = (1 − cos 2x)/2; ∫₀^π = π/2."),
    5: ("d", "dy/dx = x/y → y dy = x dx → y² − x² = c, a (rectangular) hyperbola."),
    7: ("b", "Add element by element: [1+1, 2+1, 3+0; 9+2, 3+8, 6+1; 1+0, 0+2, 2+1] = [2, 3, 3; 11, 11, 7; 1, 2, 3]."),
    8: ("a", "Rows become columns: transpose of [2, −1; −3, 6] is [2, −3; −1, 6]."),
    9: ("c", "The highest derivative is d²y/dx², so the order is 2."),
    11: ("d", "The principal value of cos⁻¹x lies in [0, π]."),
    12: ("a", "6 x 8 x 5 = 240 combinations."),
    14: ("b", "x = 0 or x + 3 = 0, i.e. x = −3."),
    15: ("c", "3(4) − 5(2) − 2k = 0 → 2 − 2k = 0 → k = 1."),
    16: ("d", "sin⁻¹(−½) = −π/6, so sin(π/3 + π/6) = sin(π/2) = 1."),
    17: ("b", "8x² + 10x + 3 = 8x² + 6x + 4x + 3 = (4x + 3)(2x + 1)."),
    20: ("d", "Intersections x = −1, 2; area = ∫₋₁² [(x + 2)/4 − x²/4] dx = 9/8 sq. units."),
    21: ("a", "Tollens' (silver mirror) test is given by aldehydes - acetaldehyde and formaldehyde - not ketones."),
    23: ("a", "Acidified potassium dichromate (orange) is reduced by ethanol to green Cr³⁺."),
    24: ("a", "CCl₄ has no vacant orbitals on carbon and cannot accept electron pairs, so it is not a Lewis acid."),
    25: ("a", "Marine animals use dissolved carbonate (with calcium) to build CaCO₃ shells."),
    26: ("a", "H and Br are non-metals of different electronegativity: polar covalent; H-H and N-N are non-polar, Na-Br is ionic."),
    27: ("c", "Fe₂O₃ + 3CO → 2Fe + 3CO₂."),
    28: ("c", "Diamond is pure carbon; topaz, ruby and sapphire are compounds (aluminium silicate/ oxide)."),
    29: ("b", "Gd: [Xe] 4f⁷ 5d¹ 6s² (half-filled 4f is extra stable)."),
    30: ("c", "An aldohexose has 4 chiral carbons: 2⁴ = 16 optical isomers."),
    31: ("c", "Anhydrous CuSO₄ is white; with water it forms blue CuSO₄·5H₂O."),
    32: ("b", "Hydroxylamine adds to the C=O and water is eliminated, forming an oxime: a condensation (addition-elimination) reaction."),
    34: ("d", "H₃PO₄ is tribasic (3 replaceable H): N = 3 x M = 3.0 N."),
    36: ("c", "The results agree closely (small SD) but are far from the true value: precise but not accurate."),
    37: ("d", "Potassium hydrogen phthalate is a stable, pure, non-hygroscopic solid acid - the usual primary standard for bases."),
    38: ("d", "In strong acid Fe₂O₃ dissolves as the hexaaqua iron(III) ion, [Fe(H₂O)₆]³⁺."),
    39: ("a", "MgO has doubly charged small ions (Mg²⁺, O²⁻), giving the largest lattice enthalpy."),
    40: ("b", "In liquid ammonia the strongest base that can exist is the amide ion NH₂⁻ (levelling effect)."),
    41: ("c", "Electric field = force per unit charge (E = F/q)."),
    42: ("b", "The plastic scale gains electrons from the hair and becomes negatively charged."),
    43: ("c", "Work done against electrostatic force is stored as electric potential energy."),
    44: ("c", "C = ε₀εᵣA/d: capacitance increases with plate area."),
    45: ("a", "An ohmic conductor obeys Ohm's law: I proportional to V - a straight line through the origin."),
    46: ("c", "A generator works on electromagnetic induction; a motor and galvanometer work on the force on a current-carrying conductor."),
    47: ("b", "An a.c. generator (dynamo) produces alternating current."),
    49: ("d", "Light is guided along an optical fibre by repeated total internal reflection."),
    50: ("b", "Total internal reflection occurs when light goes from a denser to a rarer medium at more than the critical angle."),
    51: ("a", "A light year is the distance light travels in one year (9.46 x 10¹⁵ m)."),
    52: ("d", "Polaroids cut out glare by polarisation, reducing the intensity of unpolarised light by half."),
    53: ("d", "A laser beam is highly directional (very small angular spread), so it stays narrow over long distances."),
    54: ("c", "Gases are very poor conductors of electricity (few free charge carriers) unless ionised."),
    55: ("a", "Einstein's photoelectric equation hν = φ + KEmax expresses conservation of energy."),
    56: ("b", "Electrons are held by the electrostatic (Coulomb) attraction of the nucleus."),
    57: ("d", "Radioactive half-life is independent of pressure, temperature and density."),
    58: ("d", "Nuclei need very high kinetic energy to overcome their electrostatic repulsion and fuse."),
    59: ("d", "Atoms in Si/ Ge crystals are held by covalent bonds."),
    60: ("a", "A microphone converts sound into electrical signals (a loudspeaker does the reverse)."),
    61: ("c", "Group in threes from the point: 011 010 = 32; .101 100 = .54 → 32.54."),
    62: ("b", "Assembly language uses mnemonic codes and symbolic (variable) names instead of binary."),
    63: ("b", "In 1969 the first ARPANET message 'login' crashed after 'lo'."),
    64: ("b", "Sabeer Bhatia co-founded Hotmail (1996) and sold it to Microsoft in 1997."),
    65: ("b", "A data link content monitor analyses traffic on a data link to detect problems in protocols."),
    66: ("b", "Protecting data from natural disasters (backup, recovery) is a reliability issue of a network."),
    68: ("d", "'Intelligent' I/O devices have their own processing to support off-line and on-line tasks."),
    69: ("c", "Resolution depends on bandwidth, scan rate and lines of resolution, not on the physical screen size."),
    70: ("c", "Blind carbon copy hides the BCC recipients from the other recipients."),
}

NEW_MCQ = [
    ("The derivative of tan x with respect to x is", ["sec x tan x", "sec²x", "cosec²x", "−sec²x"], "b", "d/dx (tan x) = sec²x."),
    ("If A is a 2 x 3 matrix and B is a 3 x 4 matrix, the order of the product AB is", ["3 x 3", "2 x 4", "4 x 2", "not defined"], "b", "The inner dimensions (3) match; AB has the outer dimensions 2 x 4."),
    ("The value of lim (x → 0) (sin x)/x is", ["0", "1", "∞", "not defined"], "b", "A standard limit: (sin x)/x → 1 as x → 0 (x in radians)."),
    ("Two fair dice are thrown. The probability of getting a sum of 7 is", ["1/6", "1/12", "1/36", "7/36"], "a", "Six favourable outcomes out of 36: (1,6), (2,5), (3,4), (4,3), (5,2), (6,1)."),
    ("The number of sigma (σ) and pi (π) bonds in ethyne (C₂H₂) respectively are", ["2 and 3", "3 and 2", "4 and 1", "5 and 0"], "b", "H-C≡C-H: two C-H σ, one C-C σ (3 σ) and two π bonds in the triple bond."),
    ("The hybridisation of carbon in methane (CH₄) is", ["sp", "sp²", "sp³", "dsp²"], "c", "Four σ bonds in a tetrahedral arrangement: sp³."),
    ("Which of the following is a strong electrolyte in water?", ["Acetic acid", "Sodium chloride", "Ammonium hydroxide", "Glucose"], "b", "NaCl dissociates completely into ions; acetic acid and NH₄OH are weak, glucose is a non-electrolyte."),
    ("The SI unit of capacitance is", ["coulomb", "farad", "henry", "ohm"], "b", "C = Q/V, measured in farad (coulomb per volt)."),
    ("A wire of resistance R is stretched so that its length doubles (volume unchanged). Its new resistance is", ["R/2", "R", "2R", "4R"], "d", "R = ρL/A; doubling L halves A at constant volume, so R becomes 4 times."),
    ("Which logic gate gives an output of 1 only when all its inputs are 0?", ["OR", "AND", "NOR", "NAND"], "c", "NOR = NOT(OR): output is 1 only when every input is 0."),
]

SAQ = [
 dict(marks=3, stem="Find the area bounded by the curves y² = 4x and y = x. (3 marks)",
      kp=[("Points of intersection: x² = 4x → (0, 0) and (4, 4)", 1), ("Area = ∫₀⁴ (2√x − x) dx", 1), ("= [(4/3)x^(3/2) − x²/2]₀⁴ = 32/3 − 8 = 8/3 sq. units", 1)],
      model="Intersection: y = x in y² = 4x gives x² = 4x, so x = 0 or 4: points (0, 0) and (4, 4). Between them the parabola (upper branch y = 2√x) lies above the line y = x. Area = ∫₀⁴ (2√x − x) dx = [(4/3)x^(3/2) − x²/2]₀⁴ = (4/3)(8) − 8 = 32/3 − 24/3 = 8/3 square units."),
 dict(marks=3, stem="Compute dy/dx if y = √(sin x + y). (3 marks)",
      kp=[("Square: y² = sin x + y", 1), ("Differentiate: 2y y′ = cos x + y′", 1), ("y′(2y − 1) = cos x → dy/dx = cos x/(2y − 1)", 1)],
      model="Squaring both sides: y² = sin x + y. Differentiating with respect to x: 2y (dy/dx) = cos x + dy/dx. So (2y − 1) dy/dx = cos x, and dy/dx = cos x/(2y − 1)."),
 dict(marks=3, stem="The table gives Mathematics test scores and their frequencies: score 13 - frequency 5; 17 - 7; 20 - 4; 25 - 9.\na) Determine the median. (1.5 marks)\nb) Determine the mean. (1.5 marks)",
      kp=[("a) N = 25; cumulative frequencies 5, 12, 16, 25; the median is the 13th value → 20", 1.5),
          ("b) Σfx = 65 + 119 + 80 + 225 = 489; mean = 489/25 = 19.56", 1.5)],
      model="a) Total frequency N = 5 + 7 + 4 + 9 = 25 (odd), so the median is the (25 + 1)/2 = 13th value. Cumulative frequencies: 13 → 5, 17 → 12, 20 → 16, 25 → 25. The 13th value falls in the score 20, so the median = 20.\nb) Σfx = 13 x 5 + 17 x 7 + 20 x 4 + 25 x 9 = 65 + 119 + 80 + 225 = 489. Mean = 489/25 = 19.56."),
 dict(marks=3, stem="Answer the following questions. (3 x 1 = 3 marks)\na) Explain, in terms of molecular polarity, why N₂H₄ is very soluble in water. (1 mark)\nb) Explain, in terms of chemical activity, why copper is better than iron to make a bracelet. (1 mark)\nc) Explain, in terms of electrons, why the radius of a potassium atom is larger than the radius of a potassium ion in the ground state. (1 mark)",
      kp=[("a) Hydrazine is a polar molecule with N-H bonds and lone pairs; it forms hydrogen bonds with water (like dissolves like)", 1),
          ("b) Copper is less reactive (below hydrogen in the activity series): it does not corrode/ rust in air and moisture like iron, and does not react with sweat", 1),
          ("c) K (2,8,8,1) loses its single 4s electron to form K⁺ (2,8,8): one fewer shell, and the remaining electrons are pulled in more strongly", 1)],
      model="a) N₂H₄ is a polar molecule: the N-H bonds are polar and each N has a lone pair, so it forms strong hydrogen bonds with water molecules. Polar substances dissolve in polar solvents, so hydrazine is very soluble.\nb) Copper is much less chemically active than iron (it lies below hydrogen in the reactivity series). It does not readily react with oxygen, moisture or the acids in sweat, so it does not rust or corrode quickly the way iron does; the bracelet stays intact and does not stain the skin.\nc) A potassium atom (2, 8, 8, 1) has its outermost electron in the fourth shell. K⁺ (2, 8, 8) has lost that electron, so it has one shell fewer, and the same nuclear charge now pulls fewer electrons more tightly. Hence the atom is larger than the ion."),
 dict(marks=3, stem="Justify that the reaction 2Na(s) + H₂(g) → 2NaH(s) is an oxidation-reduction reaction. (3 marks)",
      kp=[("Oxidation numbers: Na 0 → +1 (in NaH); H 0 → −1 (hydride)", 1.5),
          ("Na loses electrons - oxidised (reducing agent); H gains electrons - reduced (oxidising agent); both occur together → redox", 1.5)],
      model="Assign oxidation numbers. In the reactants Na and H₂ are elements, oxidation number 0. In NaH (sodium hydride, an ionic compound Na⁺H⁻) Na is +1 and H is −1. Sodium's oxidation number increases from 0 to +1 - it loses an electron and is oxidised (Na → Na⁺ + e⁻), acting as the reducing agent. Hydrogen's decreases from 0 to −1 - it gains an electron and is reduced (H₂ + 2e⁻ → 2H⁻), acting as the oxidising agent. Since oxidation and reduction occur together, the reaction is an oxidation-reduction (redox) reaction."),
 dict(marks=3, image="/papers/me/tech2-eng-2022-titration.png", stem="The graph shows changes in pH for the titrations of equal volumes of solutions of two monoprotic acids, Acid 1 and Acid 2, with KOH(aq). Explain the differences between Acid 1 and Acid 2 in terms of their relative strengths and concentrations. (3 marks)",
      kp=[("Strength: Acid 1 starts at pH ≈ 1 with a long steep jump (≈ pH 3 to 11) - a strong acid; Acid 2 starts higher (pH ≈ 2-4), has a buffer region (pH ≈ 4-5) and a jump from ≈ 6 to 11 - a weak acid", 1.5),
          ("Concentration: equivalence needs ≈ 25 mL KOH for Acid 1 and ≈ 37 mL for Acid 2 → Acid 2 is more concentrated (≈ 1.5 times) since the volumes of acid are equal", 1.5)],
      model="Strength: Acid 1 has a very low starting pH (about 1), stays low and then shows a long, steep rise at equivalence from about pH 3 to 11 - typical of a strong acid that is fully ionised. Acid 2 starts at a higher pH (about 2-4) even though it is more concentrated, shows a gently rising buffer region around pH 4-5 (half-equivalence pH ≈ pKa ≈ 4.5) and a shorter jump starting near pH 6, with an equivalence point above 7 - typical of a weak acid that is only partly ionised.\nConcentration: the equivalence volume is about 25 mL of KOH for Acid 1 but about 37 mL for Acid 2. Since equal volumes of the two monoprotic acids were titrated, Acid 2 contains more moles of acid - it is about 37/25 ≈ 1.5 times more concentrated than Acid 1. So Acid 1 is stronger but more dilute; Acid 2 is weaker but more concentrated."),
 dict(marks=3, stem="To check over-speeding vehicles, police use a radar speed gun. Explain the physics behind the working of a radar speed gun. (3 marks)",
      kp=[("The gun emits radio/ microwaves of known frequency towards the vehicle, which reflect back to the gun", 1),
          ("Doppler effect: the reflected waves from a moving vehicle have a shifted frequency (higher if approaching, lower if moving away)", 1),
          ("The shift Δf ≈ 2vf/c is measured electronically and converted into the vehicle's speed v = cΔf/(2f)", 1)],
      model="A radar speed gun works on the Doppler effect. It transmits a beam of radio (microwave) waves of a known frequency f towards the vehicle. The waves reflect off the vehicle and return to the gun. If the vehicle is moving, the reflected waves come back with a different frequency: higher if it is approaching, lower if it is moving away. The frequency shift is proportional to the vehicle's speed: Δf ≈ 2vf/c (the factor 2 because the moving car both receives and re-emits the wave). The gun's electronics compare the transmitted and received frequencies, compute v = cΔf/(2f) and display the speed instantly."),
 dict(marks=3, stem="Explain the first and second laws of thermodynamics with an everyday example. (3 marks)",
      kp=[("First law: energy is conserved - heat supplied = increase in internal energy + work done (Q = ΔU + W); example: heat from fuel in a pressure cooker/ car engine converted to internal energy and work", 1.5),
          ("Second law: heat flows spontaneously from hot to cold only; no heat engine converts all heat into work (entropy of an isolated system increases); example: hot tea cools in a room, a refrigerator needs work to move heat out", 1.5)],
      model="First law: energy can neither be created nor destroyed, only converted. Heat Q supplied to a system goes partly to raise its internal energy and partly into work: Q = ΔU + W. Example: in a car engine the chemical energy of fuel becomes heat, part of which does work moving the car and the rest raises the temperature of the engine and exhaust - the total energy is conserved.\nSecond law: heat flows naturally from a hotter body to a colder one, never the reverse by itself, and no engine can convert all the heat it takes in into work; the entropy (disorder) of an isolated system always increases. Example: a cup of hot tea always cools to room temperature, never heats up by itself; a refrigerator can move heat from inside to the warmer room only because electrical work is supplied."),
 dict(marks=3, stem="Explain briefly how electricity is generated in a nuclear fission power plant. (3 marks)",
      kp=[("Fission: U-235 nuclei absorb slow neutrons and split, releasing large energy (heat) and 2-3 neutrons → controlled chain reaction (moderator slows neutrons, control rods absorb excess)", 1.5),
          ("Heat is carried by the coolant to a heat exchanger/ boiler to produce steam; steam drives a turbine coupled to a generator (electromagnetic induction); steam is condensed and recycled", 1.5)],
      model="In the reactor core, fuel rods of uranium-235 undergo fission: a nucleus absorbs a slow neutron, splits into two smaller nuclei and releases a large amount of energy as heat plus 2-3 neutrons, which cause further fissions - a chain reaction. A moderator (water or graphite) slows the neutrons, and control rods (boron/ cadmium) absorb extra neutrons to keep the reaction steady.\nThe heat is removed by a coolant (water under pressure) and used in a heat exchanger/ boiler to turn water into high-pressure steam. The steam spins a turbine connected to a generator, which produces electricity by electromagnetic induction. The used steam is condensed back to water in a condenser (cooled by a cooling tower or river) and pumped back - the same steam cycle as a thermal plant, with nuclear fission as the heat source."),
 dict(marks=3, stem="Answer the following questions on cyber security. (2 x 1.5 = 3 marks)\na) What is cyber security? (1.5 marks)\nb) Why is it a cause of concern these days? (1.5 marks)",
      kp=[("a) Protection of computers, networks, programs and data from unauthorised access, attacks, damage or theft (confidentiality, integrity, availability)", 1.5),
          ("b) Growing digitisation - online banking, e-government, e-commerce, social media; rising cyber crime: phishing, ransomware, hacking, identity theft, data breaches, attacks on critical infrastructure; financial loss and privacy risks", 1.5)],
      model="a) Cyber security is the practice of protecting computers, servers, mobile devices, networks, programs and data from digital attacks, unauthorised access, damage or theft. It aims to keep information confidential, accurate (integrity) and available, using measures such as strong passwords and authentication, firewalls, antivirus software, encryption, regular updates and backups, and user awareness.\nb) It is a major concern today because almost everything has moved online - banking and payments, government services, business, education and communication - and more personal data is stored digitally. Cyber crimes such as phishing, ransomware, hacking, identity theft, online fraud and large data breaches are increasing, and attacks can disrupt critical infrastructure like power, telecom and financial systems, causing financial loss, loss of privacy and threats to national security."),
]
Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
for q in Q:
    if q["type"] != "mcq":
        q["issues"] = list(q.get("issues", [])) + ["Model answer written by Claude: please check before publishing."]
