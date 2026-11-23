"""ME Technical Paper II (General Subject Knowledge), ENGINEERING group, BCSE 2013 Main Examination (13 October 2013,
question paper series B) - real paper, PDF sent by the founder. Same layout as the latest (BCSE 2025) paper: Part I 70 MCQ
x 1 (Section A Mathematics 1-20, B Chemistry 21-40, C Physics 41-60, D General IT 61-70); Part II 10 short answers x 3 - so
no marks were changed. Mathematics retyped from the page images. Pictures: MCQ 16 shaded region, 48 lens box, Part II Q9 incline.
Repeat (recorded as an appearance, not loaded again): MCQ 65 (spyware, BCSE 2023).
Left out: MCQ 33 (Avogadro's law - a and 'both' are defensible), 60 (with the sound's travel time the height is about 56 m,
not an option). Three new MCQs (Chemistry, Physics, IT) keep Part I at 70.
Fixed: MCQ 5 printed '½ cos x + c' twice (option b shown as −½ cos x + c); MCQ 27 'Methene' spelt Methane and 'hydrocarbons'
changed to 'compounds' (glucose is not a hydrocarbon).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Engineering): BCSE 2013, batch 1"
GROUP_TAG = "eng2013"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "engineering"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Engineering: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Find the value of the determinant |2 5 7; 0 1 −8; 0 −3 4| (rows separated by semicolons).",
"opts": [
"47",
"– 40",
"2",
"-7"
]
},
{
"n": 2,
"stem": "In a box, there are 6 red socks and 4 blue socks, what is the probability of getting 3 red socks in a draw of three socks from the box?",
"opts": [
"3/10",
"3/6",
"1/6",
"1/10"
]
},
{
"n": 3,
"stem": "Evaluate sin(cos⁻¹(3/5)).",
"opts": [
"3/5",
"5/3",
"4/5",
"1"
]
},
{
"n": 4,
"stem": "Dorji can paint a room in 60 minutes, Karma can paint it in 30 minutes, and Wangmo can paint it in 20 minutes. How much time will they take to paint the same together?",
"opts": [
"5 minutes",
"10 minutes",
"24 minutes",
"36 minutes"
]
},
{
"n": 5,
"stem": "Evaluate ∫ cos 2x dx.",
"opts": [
"½ cos x + c",
"−½ cos x + c",
"½ cos 2x + c",
"½ sin 2x + c"
]
},
{
"n": 6,
"stem": "Lhamo spends 25% of her salary on housing, 25% on food, 10% on clothing, 20% on fuel and rest on miscellaneous items. If she spends Nu. 2500 on miscellaneous items, her salary is",
"opts": [
"Nu. 10,500",
"Nu. 11,500",
"Nu. 12,500",
"Nu. 13,500"
]
},
{
"n": 7,
"stem": "Using all the letters of the word \"BHUTAN\", how many words (arrangements) can be formed if every word must begin with the letter \"U\"?",
"opts": [
"720",
"540",
"120",
"60"
]
},
{
"n": 8,
"stem": "Which of the following fractions is less than 3/4?",
"opts": [
"2/3",
"5/6",
"7/8",
"8/9"
]
},
{
"n": 9,
"stem": "A worker is paid at a rate of US $ 10 per hour and ½ the rate for any hours worked over 7 hours in a day. If the consultant started working at 9:00 A.M. and left work at 8:18 P.M with 30 minutes lunch break in between. How much will he get paid for that day?",
"opts": [
"US $ 87",
"US $ 89",
"US $ 100",
"US $ 110"
]
},
{
"n": 10,
"stem": "A garment store sold 560 ghos on 1st day of school and 800 ghos on 2nd day of school. What is the percent increase in the number of ghos sold by the store?",
"opts": [
"30%",
"43%",
"70%",
"143%"
]
},
{
"n": 11,
"stem": "Factor and solve 2x² − 5x + 3 = 0.",
"opts": [
"x = 5, x = 3",
"x = 1, x = 3/2",
"x = −1, x = −3",
"x = −2, x = −3/2"
]
},
{
"n": 12,
"stem": "Convert 135° into radians.",
"opts": [
"2π",
"3π/4",
"4π/3",
"π/2"
]
},
{
"n": 13,
"stem": "The volume of a cylinder with a radius of 3 cm and height of 4 cm is",
"opts": [
"36 cm³",
"75.36 cm³",
"113.11 cm³",
"150.72 cm³"
]
},
{
"n": 14,
"stem": "A wire is bent to form a square of area 100 cm². If the same wire is then bent to form a circle, the radius of the circle will be",
"opts": [
"4.5 cm",
"5.6 cm",
"6.4 cm",
"10 cm"
]
},
{
"n": 15,
"stem": "Karma is 8 years older than his sister. If he is 29 years old in 2013, in which year was his sister born?",
"opts": [
"1984",
"1992",
"1994",
"2005"
]
},
{
"n": 16,
"stem": "Find the area of the shaded region in the figure (a 12 cm wide, 8 cm high figure with an unshaded 6 cm wide middle part, two shaded side strips and a shaded right triangle of base 6 cm and height 5 cm on top).",
"opts": [
"30 cm²",
"48 cm²",
"63 cm²",
"72 cm²"
],
"image": "/papers/me/tech2-eng-2013-shaded.png"
},
{
"n": 17,
"stem": "How many subsets does the set {a, e, i, o, u} have?",
"opts": [
"5",
"12",
"26",
"32"
]
},
{
"n": 18,
"stem": "The value of tan⁻¹(1) + cos⁻¹(−1/2) + sin⁻¹(−1/2) is",
"opts": [
"π/2",
"3π/4",
"2π/3",
"π"
]
},
{
"n": 19,
"stem": "The coordinates of the point which divides the line joining (1, 3, 7) and (6, 3, 2) internally in the ratio 2 : 3 are",
"opts": [
"(3,3,5)",
"(7,6,9)",
"(3,4,5)",
"(6,9,10)"
]
},
{
"n": 20,
"stem": "If y = 4x³ + 4x² + 3x + 10, the second derivative d²y/dx² is",
"opts": [
"24x + 8",
"12x² + 8x + 3",
"12x + 8",
"24x² + 3x"
]
},
{
"n": 21,
"stem": "Ba is the Chemical symbol of which element?",
"opts": [
"Boron",
"Beryllium",
"Barium",
"Bromine"
]
},
{
"n": 22,
"stem": "Atomic Number would refer to the",
"opts": [
"No. of Protons and Neutrons",
"Nucleon Number",
"Proton Number",
"All of the above"
]
},
{
"n": 23,
"stem": "Which of the following is not an Alkali Metal",
"opts": [
"Li",
"Na",
"K",
"I"
]
},
{
"n": 24,
"stem": "What is the value in place of the question mark in the chemical equation 2Fe + 3Cl₂ → ? FeCl₃",
"opts": [
"2",
"3",
"4",
"5"
]
},
{
"n": 25,
"stem": "When the electrons are either lost or gained, which type of chemical bonds form?",
"opts": [
"Metallic",
"Ionic",
"Covalent",
"Van Der Waal"
]
},
{
"n": 26,
"stem": "The pH value of pure dihydrogen monoxide (water) at 25 °C is generally considered to be:",
"opts": [
"More than 7",
"Less than 7",
"equal to 7",
"None of the above"
]
},
{
"n": 27,
"stem": "The formulas CH₄ and C₆H₁₂O₆ stand for which compounds?",
"opts": [
"Glucose and sucrose",
"Benzene and methane",
"Methane and glucose",
"Benzene and sucrose"
]
},
{
"n": 28,
"stem": "Which acid is used for manufacturing TNT and CAN (calcium ammonium nitrate) and for separating gold from silver impurities?",
"opts": [
"H₂SO₄",
"HNO₃",
"HCl",
"CH₃COOH"
]
},
{
"n": 29,
"stem": "In a chemical reaction, what is the role of a catalyst?",
"opts": [
"To change the Heat of Reaction",
"To change the Product of the Reaction",
"To change the Equilibrium Constant",
"To change the Activation Energy"
]
},
{
"n": 30,
"stem": "An isothermal process is best described by which of the following?",
"opts": [
"ΔT ≠ 0 but Q = 0",
"ΔT = 0 but Q ≠ 0",
"ΔT ≠ 0 and Q ≠ 0",
"All of the above"
]
},
{
"n": 31,
"stem": "Complete the reaction: H₂ + Cl₂ →",
"opts": [
"2HCl",
"H₂Cl₂",
"HCl + H",
"Cl₂H"
]
},
{
"n": 32,
"stem": "Molarity is usually denoted in which of the following units:",
"opts": [
"mol L⁻¹",
"mol × L",
"L/mol",
"L × mol"
]
},
{
"n": 33,
"stem": "According to the Avogadro's Law, which of the following statement is true?",
"opts": [
"Equal volumes of gases under the same conditions of temperature and pressure contain the same number of molecules.",
"The molar volume of all ideal gases at 0° C and a pressure of 1 atm. is 22.4 liters",
"Both option (a) and option (b)",
"Neither option (a) nor option (b)"
]
},
{
"n": 34,
"stem": "Which of the following dissolves in “King’s Water” or the “Aqua Regia”?",
"opts": [
"Tantalum and Osmium",
"Gold and Platinum",
"Titanium and Iridium",
"Ruthenium and rhodium"
]
},
{
"n": 35,
"stem": "The chemical equation H₂SO₄ + 2NH₄OH → (NH₄)₂SO₄ + 2H₂O represents which type of chemical reaction?",
"opts": [
"Combustion reaction",
"Synthesis reaction",
"Neutralization reaction",
"Decomposition reaction"
]
},
{
"n": 36,
"stem": "Which of the following has the highest boiling point?",
"opts": [
"Olive oil",
"Mercury",
"Water",
"Oxygen"
]
},
{
"n": 37,
"stem": "The process of evaporation of a liquid is accompanied by:",
"opts": [
"An increase in the “Randomness or the disorder of the system”",
"A decrease in the “Randomness or the disorder of the system”",
"No change in the free energy",
"An increase of “sum of the internal Energy”"
]
},
{
"n": 38,
"stem": "Bauxite, Corrundum and Cryolite are Important ores of which of the following metal",
"opts": [
"Gold",
"Silver",
"Tin",
"Aluminium"
]
},
{
"n": 39,
"stem": "If two organic compounds have same molecular formula but different structural formula, they are called?",
"opts": [
"Isotopes",
"Isomers",
"Polymers",
"Allotrops"
]
},
{
"n": 40,
"stem": "Which one of the following would give maximum energy in metabolic process?",
"opts": [
"Lipids",
"Proteins",
"Carbohydrates",
"Vitamins"
]
},
{
"n": 41,
"stem": "What force (in newtons) will produce an acceleration of 3.5 m/s² in a body of mass 12.5 kg?",
"opts": [
"40.15 N",
"41.15 N",
"42.75 N",
"43.75 N"
]
},
{
"n": 42,
"stem": "What type of electric charge would a glass rod develop, when it is rubbed with silk?",
"opts": [
"Negative charge",
"Positive charge",
"May be positive or negative",
"No electricity at all"
]
},
{
"n": 43,
"stem": "Calculate the work done in lifting a mass of 8 kg to a height of 2.5 m. Assume g = 9.8 m/s².",
"opts": [
"20 J",
"24.5 J",
"196 J",
"78.4 J"
]
},
{
"n": 44,
"stem": "Calculate the kinetic energy of a 20 kg mass moving with a speed of 4 m/s.",
"opts": [
"160 J",
"40 J",
"80 J",
"784 J"
]
},
{
"n": 45,
"stem": "The mechanical advantage of a machine is given by",
"opts": [
"Load x effort",
"Load/effort",
"Effort / load",
"All of the above"
]
},
{
"n": 46,
"stem": "Which is true about Class III levers?",
"opts": [
"Effort is in between fulcrum and the load",
"Fulcrum is in between load and the effort",
"Load is in between fulcrum and the effort",
"None of the above"
]
},
{
"n": 47,
"stem": "Which of the following statement is Not True about the liquid pressure?",
"opts": [
"Depends on depth",
"Is same in all directions about a point in a liquid",
"Is inversely proportional to density of the liquid",
"Is same at all points in a horizontal plane in a liquid"
]
},
{
"n": 48,
"stem": "A parallel beam of light enters a box through an opening, as shown in the diagram. Which device should be placed in the box (in place of the question mark) to produce a tiny spot of light on the screen?",
"opts": [
"A prism",
"A concave lens",
"A convex lens",
"An opaque sheet"
],
"image": "/papers/me/tech2-eng-2013-lens-box.png"
},
{
"n": 49,
"stem": "The unit of Resistivity is:",
"opts": [
"ohm-metre (Ω m)",
"ohm per metre (Ω/m)",
"ohm (Ω)",
"None of the above"
]
},
{
"n": 50,
"stem": "What potential difference is required to pass a current of 0.3 A through a copper wire of resistance 40 Ω?",
"opts": [
"0.0075 V",
"133.33 V",
"12 V",
"120 V"
]
},
{
"n": 51,
"stem": "A uniform magnetic field is represented by a set of lines which are:",
"opts": [
"Convergent",
"Divergent",
"Parallel",
"None of the above"
]
},
{
"n": 52,
"stem": "Which statement is true of an equipotential surface?",
"opts": [
"Work done in moving any charge from one point to the other on an equipotential surface is infinity",
"Work done in moving any charge from one point to the other on an equipotential surface is Zero",
"A line of force is always at parallel to an equipotential surface",
"All of the above"
]
},
{
"n": 53,
"stem": "In an electromagnetic wave, the electric and magnetic fields are :",
"opts": [
"Parallel to each other",
"Inclined at acute angle",
"Perpendicular to each other",
"Inclined at obtuse angle"
]
},
{
"n": 54,
"stem": "Which of the following does NOT support the wave nature of light?",
"opts": [
"Polarisation",
"Diffraction",
"Interference",
"Photoelectric effect"
]
},
{
"n": 55,
"stem": "The wavelength of an electromagnetic wave of frequency 100 Hz is (c = 3 × 10⁸ m/s):",
"opts": [
"5 × 10⁶ m",
"4 × 10⁶ m",
"3 × 10⁶ m",
"2 × 10⁶ m"
]
},
{
"n": 56,
"stem": "The focal length of a convex (glass) lens is 30 cm when measured in air. When it is measured in water, the focal length is",
"opts": [
"Less than 30 cm",
"Greater than 30 cm",
"Equal to 30 cm",
"None of the above"
]
},
{
"n": 57,
"stem": "Cathode rays are:",
"opts": [
"A beam of atoms moving towards the cathode",
"A beam of electrons emitted by the cathode",
"A beam of negatively charged ions moving towards the anode",
"Electromagnetic waves"
]
},
{
"n": 58,
"stem": "Which one of the following is used as fuel by the nuclear reactor?",
"opts": [
"Heavy water",
"Cadmium",
"Graphite",
"Uranium"
]
},
{
"n": 59,
"stem": "Which is true about semiconductors?",
"opts": [
"Their valence band is unfilled",
"They have a big gap between the conduction band and the valence band",
"They have a small gap between the conduction band and the valence band",
"None of the above"
]
},
{
"n": 60,
"stem": "You are dropping a wine glass from the window of your apartment. If you hear the sound of the glass breaking 3.55 seconds after being dropped. Determine the height of your window from the ground level?",
"opts": [
"65.30m",
"61.75m",
"34.79m",
"123.50m"
]
},
{
"n": 61,
"stem": "A URL is a formatted text string used by web browsers, e-mail clients and other software to identify a network resource on the Internet. URL stands for",
"opts": [
"Universal Resource Link",
"Uniform Resource Locator",
"Unlimited Resource Locator",
"Universal Reference Link"
]
},
{
"n": 62,
"stem": "A physical device that joins multiple networks together is called a",
"opts": [
"Router",
"Driver",
"Bluetooth",
"Cable"
]
},
{
"n": 63,
"stem": "……….is a technology that allows telephone calls to be made over computer networks like the Internet.",
"opts": [
"VoIP",
"GSM",
"Modem",
"CDMA"
]
},
{
"n": 64,
"stem": "To identify TCP/IP errors such as connection problems…….command can be used",
"opts": [
"FTP",
"Ping",
"POP3",
"STP"
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
"stem": "Software is a set of programs, which is designed to perform a well defined function and there are two types of software, application and system. The following are all application software except for",
"opts": [
"Microsoft Word",
"Microsoft Excel",
"Microsoft Power Point",
"Microsoft Windows"
]
},
{
"n": 67,
"stem": "1 gigabyte (GB) is equal to",
"opts": [
"1024 bytes",
"1024 KB",
"1024 MB",
"1024 TB"
]
},
{
"n": 68,
"stem": "The fourth generation computers are based on",
"opts": [
"Transistor",
"Integrated circuit",
"VLSI microprocessor",
"ULSI microprocessor"
]
},
{
"n": 69,
"stem": "All the following are computer input devices except for",
"opts": [
"Keyboard",
"Printer",
"Mouse",
"Joy Stick"
]
},
{
"n": 70,
"stem": "A CD-RW drive has a speed rating of 12x 10x 32x. What do the three numbers refer to, in order?",
"opts": [
"Write, rewrite, read",
"Read, write, rewrite",
"Rewrite, read, write",
"Write, read, rewrite"
]
}
]"""

KEY = {
 1: ("b", "Expand along the first column: 2 × (1 × 4 − (−8)(−3)) = 2 × (4 − 24) = −40."),
 2: ("c", "P = C(6, 3)/C(10, 3) = 20/120 = 1/6."),
 3: ("c", "If cos θ = 3/5 (θ acute) then sin θ = √(1 − 9/25) = 4/5."),
 4: ("b", "Combined rate = 1/60 + 1/30 + 1/20 = (1 + 2 + 3)/60 = 1/10 room per minute, so 10 minutes."),
 5: ("d", "∫cos 2x dx = (1/2) sin 2x + c."),
 6: ("c", "Miscellaneous = 100 − (25 + 25 + 10 + 20) = 20% of salary = Nu. 2500, so salary = 2500/0.20 = Nu. 12,500."),
 7: ("c", "BHUTAN has 6 different letters. With U fixed first, the other 5 can be arranged in 5! = 120 ways."),
 8: ("a", "2/3 ≈ 0.667 < 0.75; 5/6, 7/8 and 8/9 are all greater than 3/4."),
 9: ("b", "9:00 A.M. to 8:18 P.M. = 11 h 18 min; minus 30 min lunch = 10.8 h. First 7 h × $10 = $70; 3.8 h × $5 = $19. Total $89."),
 10: ("b", "Increase = 240; 240/560 × 100 ≈ 42.9% ≈ 43%."),
 11: ("b", "2x² − 5x + 3 = (2x − 3)(x − 1) = 0, so x = 1 or x = 3/2."),
 12: ("b", "135 × π/180 = 3π/4."),
 13: ("c", "V = πr²h = π × 9 × 4 = 36π ≈ 113.1 cm³."),
 14: ("c", "Side = 10 cm, so the wire is 40 cm. 2πr = 40 gives r = 40/(2π) ≈ 6.37 ≈ 6.4 cm."),
 15: ("b", "The sister is 29 − 8 = 21 in 2013, so she was born in 1992."),
 16: ("c", "Side strips: (12 − 6)/2 = 3 cm wide, so 2 × 3 × 8 = 48 cm²; triangle ½ × 6 × 5 = 15 cm². Total = 63 cm²."),
 17: ("d", "A set with n elements has 2ⁿ subsets: 2⁵ = 32."),
 18: ("b", "tan⁻¹1 = π/4, cos⁻¹(−1/2) = 2π/3, sin⁻¹(−1/2) = −π/6. Sum = (3π + 8π − 2π)/12 = 9π/12 = 3π/4."),
 19: ("a", "Section formula (m : n = 2 : 3): x = (2·6 + 3·1)/5 = 3, y = (2·3 + 3·3)/5 = 3, z = (2·2 + 3·7)/5 = 5. Point (3, 3, 5)."),
 20: ("a", "dy/dx = 12x² + 8x + 3; d²y/dx² = 24x + 8."),
 21: ("c", "Ba is barium (boron B, beryllium Be, bromine Br)."),
 22: ("c", "Atomic number = number of protons (the proton number)."),
 23: ("d", "I (iodine) is a halogen; Li, Na and K are alkali metals."),
 24: ("a", "2Fe + 3Cl₂ → 2FeCl₃ (2 Fe and 6 Cl on each side)."),
 25: ("b", "Transfer (loss and gain) of electrons forms ionic bonds; sharing forms covalent bonds."),
 26: ("c", "Pure water is neutral: pH = 7 at 25 °C."),
 27: ("c", "CH₄ is methane and C₆H₁₂O₆ is glucose (sucrose is C₁₂H₂₂O₁₁, benzene C₆H₆)."),
 28: ("b", "Nitric acid nitrates toluene to TNT, makes ammonium nitrate for CAN, and dissolves silver (not gold) in 'parting' gold from silver."),
 29: ("d", "A catalyst lowers the activation energy; it does not change ΔH, the products or the equilibrium constant."),
 30: ("b", "Isothermal means constant temperature (ΔT = 0) while heat is exchanged (Q ≠ 0)."),
 31: ("a", "H₂ + Cl₂ → 2HCl."),
 32: ("a", "Molarity = moles of solute per litre of solution: mol L⁻¹."),
 34: ("b", "Aqua regia (3 HCl : 1 HNO₃) dissolves the noble metals gold and platinum."),
 35: ("c", "Acid + base → salt + water: a neutralisation reaction."),
 36: ("b", "Mercury boils at 357 °C; water at 100 °C, oxygen at −183 °C, and olive oil decomposes (smokes) before boiling."),
 37: ("a", "Evaporation turns an ordered liquid into a disordered gas, so randomness (entropy) increases."),
 38: ("d", "Bauxite, corundum (Al₂O₃) and cryolite (Na₃AlF₆) are aluminium minerals."),
 39: ("b", "Same molecular formula, different structures - isomers."),
 40: ("a", "Lipids (fats) give about 9 kcal/g, more than carbohydrates or proteins (about 4 kcal/g); vitamins give no energy."),
 41: ("d", "F = ma = 12.5 × 3.5 = 43.75 N."),
 42: ("b", "Glass loses electrons to silk, so the glass rod becomes positively charged."),
 43: ("c", "W = mgh = 8 × 9.8 × 2.5 = 196 J."),
 44: ("a", "KE = ½mv² = ½ × 20 × 16 = 160 J."),
 45: ("b", "Mechanical advantage = load/effort."),
 46: ("a", "In a class III lever (e.g. tweezers, forearm) the effort is between the fulcrum and the load."),
 47: ("c", "Liquid pressure p = hρg is directly (not inversely) proportional to density."),
 48: ("c", "A convex (converging) lens brings the parallel beam to a focus - a tiny bright spot on the screen."),
 49: ("a", "ρ = RA/L, so the unit is Ω × m²/m = ohm-metre."),
 50: ("c", "V = IR = 0.3 × 40 = 12 V."),
 51: ("c", "A uniform field is shown by parallel, equally spaced lines."),
 52: ("b", "All points on an equipotential surface are at the same potential, so no work is done moving a charge along it; field lines are perpendicular to it."),
 53: ("c", "In an electromagnetic wave E and B are perpendicular to each other (and to the direction of travel)."),
 54: ("d", "The photoelectric effect shows the particle (photon) nature of light; the others are wave effects."),
 55: ("c", "λ = c/f = 3 × 10⁸/100 = 3 × 10⁶ m."),
 56: ("b", "In water the lens bends light less (smaller relative refractive index), so its focal length becomes longer than 30 cm."),
 57: ("b", "Cathode rays are streams of electrons emitted from the cathode."),
 58: ("d", "Uranium (U-235) is the fuel; heavy water and graphite are moderators and cadmium absorbs neutrons in control rods."),
 59: ("c", "Semiconductors have a small band gap (about 1 eV) between the valence and conduction bands."),
 61: ("b", "URL = Uniform Resource Locator."),
 62: ("a", "A router joins (routes traffic between) different networks."),
 63: ("a", "VoIP (Voice over Internet Protocol) carries telephone calls over IP networks."),
 64: ("b", "Ping tests whether a host can be reached over TCP/IP and measures the round-trip time."),
 66: ("d", "Microsoft Windows is an operating system (system software); Word, Excel and PowerPoint are applications."),
 67: ("c", "1 GB = 1024 MB."),
 68: ("c", "Fourth-generation computers use VLSI microprocessors."),
 69: ("b", "A printer is an output device."),
 70: ("a", "CD-RW speed ratings are given as write × rewrite × read: 12x write, 10x rewrite, 32x read."),
}

NEW_MCQ = [
    ("The number of moles in 22 g of carbon dioxide (CO₂) is", ["0.25", "0.5", "1", "2"], "b", "Molar mass of CO₂ = 12 + 2 × 16 = 44 g/mol; 22/44 = 0.5 mol."),
    ("A body of mass 2 kg moving at 3 m/s has a momentum of", ["1.5 kg m/s", "5 kg m/s", "6 kg m/s", "18 kg m/s"], "c", "Momentum p = mv = 2 × 3 = 6 kg m/s."),
    ("Which number system has base 16?", ["Binary", "Octal", "Decimal", "Hexadecimal"], "d", "Hexadecimal uses 16 symbols: 0-9 and A-F."),
]

SAQ = [
 dict(marks=3, stem="Divide the number 10 into 2 parts so that the product of the square of the first number and the cube of the second number is the greatest possible. (3 marks)",
      kp=[("Let the parts be x and 10 − x; maximise P = x²(10 − x)³", 1), ("dP/dx = x(10 − x)²(20 − 5x) = 0 gives x = 4 (second derivative/sign check shows a maximum)", 1), ("Parts 4 and 6; maximum product 4² × 6³ = 3,456", 1)],
      model="Let the first part be x and the second 10 − x. P = x²(10 − x)³.\ndP/dx = 2x(10 − x)³ − 3x²(10 − x)² = x(10 − x)²[2(10 − x) − 3x] = x(10 − x)²(20 − 5x).\nSetting dP/dx = 0 (with 0 < x < 10) gives x = 4. P increases for x < 4 and decreases for x > 4, so x = 4 gives the maximum.\nThe parts are 4 and 6, and the greatest product is 4² × 6³ = 16 × 216 = 3,456."),
 dict(marks=3, stem="If y = √(1 + x²), find dy/dx. (3 marks)",
      kp=[("Write y = (1 + x²)^(1/2) and use the chain rule", 1), ("dy/dx = ½(1 + x²)^(−1/2) × 2x", 1), ("dy/dx = x/√(1 + x²)", 1)],
      model="y = (1 + x²)^(1/2). By the chain rule, dy/dx = ½(1 + x²)^(−1/2) × d/dx(1 + x²) = ½(1 + x²)^(−1/2) × 2x = x/√(1 + x²)."),
 dict(marks=3, stem="Given that log₉(x) = 15, find the value of log₃(x/9). (3 marks)",
      kp=[("x = 9¹⁵ = 3³⁰ (or log₃x = 2 log₉x = 30)", 1), ("log₃(x/9) = log₃x − log₃9", 1), ("= 30 − 2 = 28", 1)],
      model="log₉x = 15 means x = 9¹⁵ = (3²)¹⁵ = 3³⁰, so log₃x = 30.\nlog₃(x/9) = log₃x − log₃9 = 30 − 2 = 28."),
 dict(marks=3, stem="List three important differences between atoms and ions. (3 marks)",
      kp=[("Charge: an atom is electrically neutral (protons = electrons); an ion carries a positive or negative charge (protons ≠ electrons)", 1),
          ("Formation/stability: ions form when atoms lose or gain electrons, usually reaching a stable (noble-gas) configuration; most atoms (except noble gases) are reactive", 1),
          ("Size: a cation is smaller and an anion larger than its parent atom (also: ions can exist in solution/lattices and conduct electricity when free; atoms of most elements do not exist independently)", 1)],
      model="1. Charge: an atom has equal numbers of protons and electrons and is neutral; an ion has more or fewer electrons than protons, so it is charged (cation +, anion −).\n2. Stability and reactivity: ions are formed when atoms lose or gain electrons, generally achieving a stable noble-gas configuration, so many ions are more stable than their atoms (e.g. Na⁺ vs Na).\n3. Size: a cation is smaller than its atom (fewer electrons, same nuclear charge) and an anion is larger than its atom.\nAlso: ions in solution or molten salts conduct electricity, and ions have different chemical properties from their atoms (Cl⁻ is harmless, Cl₂ is toxic)."),
 dict(marks=3, stem="When 5.5 g of a substance is dissolved in 50 g of water, it lowers the freezing point of water by 1.15 °C. Calculate the relative molecular mass of the substance. (Kf for water = 1.86 °C kg mol⁻¹) (3 marks)",
      kp=[("ΔTf = Kf × m, so molality m = 1.15/1.86 = 0.618 mol/kg", 1), ("Moles of solute = 0.618 × 0.050 kg = 0.0309 mol", 1), ("M = 5.5/0.0309 ≈ 178 g/mol (relative molecular mass ≈ 178)", 1)],
      model="ΔTf = Kf × m, where m is the molality.\nm = 1.15/1.86 = 0.618 mol per kg of water.\nMoles of solute in 50 g (0.050 kg) of water = 0.618 × 0.050 = 0.0309 mol.\nMolar mass = 5.5/0.0309 ≈ 178 g/mol.\n(In one line: M = Kf × w × 1000/(ΔTf × W) = 1.86 × 5.5 × 1000/(1.15 × 50) ≈ 178.)"),
 dict(marks=3, stem="What is the first law of thermodynamics? Based on this law, briefly explain the terms (i) isochoric process and (ii) adiabatic process. (3 marks)",
      kp=[("First law: energy is conserved - heat supplied to a system = increase in internal energy + work done by the system (Q = ΔU + W)", 1),
          ("Isochoric: volume constant, so no work is done (W = 0) and all heat changes the internal energy: ΔU = Q", 1),
          ("Adiabatic: no heat exchange (Q = 0), so ΔU = −W: work done by the gas lowers its internal energy (it cools), work done on it heats it", 1)],
      model="First law of thermodynamics: energy can neither be created nor destroyed. Heat Q supplied to a system goes into increasing its internal energy ΔU and doing work W: Q = ΔU + W.\n(i) Isochoric process: the volume stays constant, so the system does no work (W = 0). Then ΔU = Q - all heat supplied raises the internal energy (temperature), e.g. heating gas in a rigid closed container.\n(ii) Adiabatic process: no heat enters or leaves (Q = 0), e.g. a well-insulated or very fast process. Then ΔU = −W: when the gas expands and does work its internal energy falls and it cools; when it is compressed it heats up (as in a bicycle pump)."),
 dict(marks=3, stem="The half-life of one isotope of radium is about 1,600 years. In a given sample of this isotope, about how long will it take for 15/16 of the radium atoms to decay? (3 marks)",
      kp=[("If 15/16 decays, 1/16 remains", 1), ("1/16 = (1/2)⁴, so 4 half-lives have passed", 1), ("Time = 4 × 1,600 = 6,400 years", 1)],
      model="If 15/16 of the atoms decay, 1/16 remains. After n half-lives the fraction left is (1/2)ⁿ; (1/2)⁴ = 1/16, so n = 4.\nTime = 4 × 1,600 = 6,400 years."),
 dict(marks=3, stem="Two bulbs have these ratings: bulb (a) 100 W / 220 V and bulb (b) 1000 W / 220 V. If the two bulbs are connected in series, which one will glow more brightly? Explain. (3 marks)",
      kp=[("R = V²/P: R_a = 220²/100 = 484 Ω; R_b = 220²/1000 = 48.4 Ω", 1), ("In series the same current flows through both, so power P = I²R is larger in the larger resistance", 1), ("Bulb (a), the 100 W bulb, glows more brightly", 1)],
      model="Resistance of each bulb: R = V²/P.\nR_a = 220²/100 = 484 Ω; R_b = 220²/1000 = 48.4 Ω.\nIn series the same current I flows through both, so the power in each is P = I²R. Since R_a is ten times R_b, bulb (a) dissipates ten times as much power.\nSo the 100 W bulb (a) glows more brightly (and the 1000 W bulb glows only dimly)."),
 dict(marks=3, image="/papers/me/tech2-eng-2013-incline.png", stem="The diagram shows the free-body diagram of an object of mass 100 kg on a very smooth inclined surface at 45°. Using vector resolution, find the weight (F_gravity) and the net force (F_net) on the object. (Assume negligible friction and air resistance; g = 9.8 m/s².) (3 marks)",
      kp=[("F_gravity = mg = 100 × 9.8 = 980 N, vertically downward", 1), ("Resolve: component perpendicular to the slope mg cos 45° ≈ 693 N is balanced by the normal reaction", 1),
          ("F_net = mg sin 45° = 980 × 0.707 ≈ 693 N down the slope (acceleration g sin 45° ≈ 6.93 m/s²)", 1)],
      model="Weight: F_gravity = mg = 100 × 9.8 = 980 N, acting vertically downward.\nResolve the weight along and perpendicular to the incline (angle 45°):\n• perpendicular to the surface: mg cos 45° = 980 × 0.707 ≈ 693 N, balanced by the normal reaction of the surface;\n• along the surface: mg sin 45° = 980 × 0.707 ≈ 693 N.\nWith no friction, the net force is F_net = mg sin 45° ≈ 693 N, directed down the slope, giving an acceleration of g sin 45° ≈ 6.93 m/s²."),
 dict(marks=3, stem="Spam is unsolicited e-mail from an unknown source which can create problems for your computer. Mention two ways of preventing spam. (3 marks)",
      kp=[("Use spam filters / junk-mail settings in the e-mail service and keep antivirus/anti-malware updated", 1.5),
          ("Do not publish your address openly or reply to/click links in unknown mail; block senders, use unsubscribe only for genuine senders, use a separate address for sign-ups", 1.5)],
      model="1. Use spam filters: switch on the junk-mail/spam filter of the e-mail service or client and keep antivirus and anti-malware software updated, so suspicious mail is moved aside automatically.\n2. Protect your address and behave carefully: do not post your e-mail address openly on websites, never reply to or click links/attachments in unknown mail, block persistent senders, and use a separate address for online sign-ups.\n(Also: report spam to the e-mail provider; use 'unsubscribe' only for genuine companies.)"),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
