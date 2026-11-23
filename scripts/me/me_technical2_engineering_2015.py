"""ME Technical Paper II (General Subject Knowledge), ENGINEERING group, BCSE 2015 (written 10 October 2015) - real paper,
PDF sent by the founder. Same layout as the latest (BCSE 2025) paper: Part I 70 MCQ x 1 (Section A Mathematics 1-20,
B Chemistry 21-40, C Physics 41-60, D General IT 61-70); Part II 10 short answers x 3 - so no marks were changed.
The PDF's options do not convert to text in order, so every question was retyped from the page images.
Pictures: MCQ 4 line, 8 rectangle, 18 triangle, 51 circuit, Part II Q9 plank.
Left out (unclear / more than one defensible answer): MCQ 20 (the derivative mark is missing from 'f (x)'), 66 (debugger,
editor and spooler are all utilities in some texts), 69 (light pen / touch), 70 (software tool / utility program).
Four new MCQs (1 Mathematics, 3 IT) keep Part I at 70. Typo fixed: MCQ 34 option 'Fe3OH4' shown as Fe₃O₄.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Engineering): BCSE 2015, batch 1"
GROUP_TAG = "eng2015"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "engineering"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2015 Main Examination, Technical Paper II, Engineering", "year": 2015, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Engineering: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "What name is given to the longest side of a right-angled triangle?",
"opts": [
"Angle",
"Hypotenuse",
"Isosceles",
"Tangent"
]
},
{
"n": 2,
"stem": "3x + y = 19 and x + 3y = 1. Find the value of 2x + 2y.",
"opts": [
"20",
"18",
"11",
"10"
]
},
{
"n": 3,
"stem": "Thinley's coin collection contains US, Indian and Norwegian coins. If the ratio of US to Indian coins is 5 to 2 and the ratio of Indian to Norwegian coins is 5 to 1, what is the ratio of US to Norwegian coins?",
"opts": [
"5 : 1",
"10 : 5",
"15 : 2",
"25 : 2"
]
},
{
"n": 4,
"stem": "Line L passes through the points (0, a) and (3a, 0), as shown in the figure. What is the slope of line L?",
"opts": [
"−3",
"−1/3",
"0",
"1/3"
],
"image": "/papers/me/tech2-eng-2015-line.png"
},
{
"n": 5,
"stem": "Six years ago Tashi was P times as old as Dorji was. If Tashi is now 17 years old, how old is Dorji now in terms of P?",
"opts": [
"11/P + 6",
"P/11 + 6",
"17 − P/6",
"17/P"
]
},
{
"n": 6,
"stem": "If f(3) = 15 and f(5) = 45, which of the following could be f(x)?",
"opts": [
"4x + 3",
"2x² − 2x",
"2x² − x",
"2x² − 5"
]
},
{
"n": 7,
"stem": "Volunteers are needed to prepare for the upcoming events. Each volunteer can dig either 2 large holes per hour or 35 small holes per hour to hoist different size flags. The volunteers are given 3 hours within which they need to dig 20 large holes and 700 small holes. How many volunteers are required?",
"opts": [
"10",
"15",
"20",
"25"
]
},
{
"n": 8,
"stem": "Rectangle ABCD has a perimeter of 26. The half circle with diameter AD (shaded) has an area of 8π. What is the perimeter of the part of the figure that is not shaded?",
"opts": [
"26 + 4π",
"18 + 8π",
"18 + 4π",
"14 + 4π"
],
"image": "/papers/me/tech2-eng-2015-rectangle.png"
},
{
"n": 9,
"stem": "The average IQ of 4 people is 110. If three of them each have an IQ of 105, what is the IQ of the fourth person?",
"opts": [
"125",
"105",
"115",
"110"
]
},
{
"n": 10,
"stem": "76967. This sequence of numbers is called a:",
"opts": [
"Palindrome",
"Unique number",
"Whole number",
"Prime number"
]
},
{
"n": 11,
"stem": "(√2 − √3)² =",
"opts": [
"5 − 2√6",
"5 − √6",
"1 − 2√6",
"1 − √2"
]
},
{
"n": 12,
"stem": "Which of the following could be a solution of the equation |x| = |4x − 3|?",
"opts": [
"−1",
"−0.6",
"0",
"0.6"
]
},
{
"n": 13,
"stem": "The table shows the bonuses paid to the employees of a firm: Nu. 500 to 7 employees, Nu. 1000 to 37, Nu. 1500 to 4 and Nu. 2000 to 2. The average bonus per employee was:",
"opts": [
"Nu. 810.00",
"Nu. 910.00",
"Nu. 1000.00",
"Nu. 1010.00"
]
},
{
"n": 14,
"stem": "After being dropped, a certain ball always bounces back to 2/5 of the height of its previous bounce. After the first bounce it reaches a height of 125 cm. How high (in cm) will it reach after its fourth bounce?",
"opts": [
"20",
"15",
"8",
"5"
]
},
{
"n": 15,
"stem": "At what point does the graph of 5x + 4y = 12 intersect the y-axis?",
"opts": [
"(0, 3)",
"(3, 0)",
"(0, −3)",
"(5, 0)"
]
},
{
"n": 16,
"stem": "Tashi covered a distance of 50 km on his first trip. On a later trip he travelled 300 km while going three times as fast. His new time compared with the old time was:",
"opts": [
"three times as much",
"twice as much",
"the same",
"half as much"
]
},
{
"n": 17,
"stem": "The percentage profit earned by selling a stack of books for Nu. 1920 is equal to the percentage loss incurred by selling the same stack for Nu. 1280. At what price should the stack be sold to make a 25% profit?",
"opts": [
"Nu. 2000",
"Nu. 2200",
"Nu. 2400",
"Nu. 3000"
]
},
{
"n": 18,
"stem": "In the right-angled triangle ABC shown (right angle at C, BC = 12 cm, AC = x cm, angle θ at A), find the length of side x given that sin θ = 0.6.",
"opts": [
"17 cm",
"16 cm",
"14 cm",
"8 cm"
],
"image": "/papers/me/tech2-eng-2015-triangle.png"
},
{
"n": 19,
"stem": "The missing number in the Fibonacci series 21, 34, 55, 89, …, 233 is:",
"opts": [
"95",
"102",
"144",
"201"
]
},
{
"n": 20,
"stem": "If f(x) = sin x, what is f",
"opts": [
"",
"",
"",
"(x)? Cos x Tan x – Sin x Cos x Tan x"
]
},
{
"n": 21,
"stem": "The gas used for artificial ripening of green fruit is:",
"opts": [
"Ethylene",
"Ethane",
"Carbon dioxide",
"Acetylene"
]
},
{
"n": 22,
"stem": "Sucrose, ordinary table sugar, may be classified as a",
"opts": [
"Monosaccharide",
"Disaccharide",
"Polysaccharide",
"Oligosaccharide"
]
},
{
"n": 23,
"stem": "The atoms in a sugar molecule are bound by what type of bond?",
"opts": [
"Ionic",
"Hydrogen",
"Covalent",
"Van der Waals"
]
},
{
"n": 24,
"stem": "Steel is an alloy of iron and",
"opts": [
"Lead",
"Copper",
"Aluminium",
"Carbon"
]
},
{
"n": 25,
"stem": "Which gas is produced by rotting vegetation in marshes?",
"opts": [
"Oxygen",
"Carbon monoxide",
"Carbon dioxide",
"Methane"
]
},
{
"n": 26,
"stem": "A dilute solution of acetic acid is commonly known as",
"opts": [
"Baking soda",
"Washing soda",
"Vinegar",
"Aspirin"
]
},
{
"n": 27,
"stem": "Heavy water (D₂O) freezes at:",
"opts": [
"0 °C",
"3.8 °C",
"0.38 °C",
"−0.38 °C"
]
},
{
"n": 28,
"stem": "The chemical symbol for tin is:",
"opts": [
"Tn",
"Sn",
"Ti",
"Nt"
]
},
{
"n": 29,
"stem": "The monomer of polythene is:",
"opts": [
"Vinyl chloride",
"Ethylene",
"Ethyl alcohol",
"None of the above"
]
},
{
"n": 30,
"stem": "The number of water molecules present in a drop of water of volume 0.0018 ml at room temperature is:",
"opts": [
"1.568 × 10³",
"6.023 × 10¹⁹",
"4.84 × 10¹⁷",
"6.023 × 10²³"
]
},
{
"n": 31,
"stem": "In the chemical equation COCl₂ + 4NH₃ → (NH₂)₂CO + 2NH₄Cl, identify the product (NH₂)₂CO, which is used mostly in farming.",
"opts": [
"Isocyanic acid",
"Biuret",
"Ammonium carbamate",
"Carbamide"
]
},
{
"n": 32,
"stem": "The number of electrons present in H⁺ is",
"opts": [
"Zero",
"One",
"Two",
"Three"
]
},
{
"n": 33,
"stem": "The isomerism which exists between CH₃CHCl₂ and CH₂Cl−CH₂Cl is:",
"opts": [
"Chain isomerism",
"Functional group isomerism",
"Positional isomerism",
"Metamerism"
]
},
{
"n": 34,
"stem": "The iron ore magnetite consists of:",
"opts": [
"Fe₂O₃",
"Fe₃O₄",
"FeCO₃",
"2Fe₂O₃·3H₂O"
]
},
{
"n": 35,
"stem": "After balancing the equation Mg(OH)₂ + HCl → MgCl₂ + H₂O, the number of hydrogen atoms on each side of the equation is:",
"opts": [
"2",
"4",
"3",
"6"
]
},
{
"n": 36,
"stem": "______ + 6O₂ → 6CO₂ + 6H₂O + Energy. The missing compound is:",
"opts": [
"C₆H₁₂O₆",
"C₂H₅OH",
"C₁₂H₂₂O₁₁",
"C₂H₄"
]
},
{
"n": 37,
"stem": "During an acid-base titration, phenolphthalein is used as an indicator. If the solution turns pink with this indicator, the solution is:",
"opts": [
"Basic",
"Acidic",
"Neutral",
"The titrant"
]
},
{
"n": 38,
"stem": "The names of the scientists Newlands, Mendeleev and Meyer are associated with the development of the",
"opts": [
"Atomic structure",
"Periodic table",
"Metallurgy",
"Discovery of elements"
]
},
{
"n": 39,
"stem": "Which types of solid are typically hard, have high melting points and poor electrical conductivity? I. Ionic II. Metallic III. Covalent-network",
"opts": [
"I and II only",
"II and III only",
"I and III only",
"I, II and III"
]
},
{
"n": 40,
"stem": "What is the best definition of electronegativity?",
"opts": [
"The energy required for a gaseous atom to gain an electron",
"The attraction of an atom for a bonding pair of electrons",
"The attraction between the nucleus and the valence electrons of an atom",
"The ability of an atom to attract electrons from another atom"
]
},
{
"n": 41,
"stem": "The absorption of ink by blotting paper involves:",
"opts": [
"Viscosity of the ink",
"Capillary action",
"Diffusion of ink through the blotting paper",
"Siphon action"
]
},
{
"n": 42,
"stem": "Large transformers become very hot after use and are cooled by circulating oil. The heating of the transformer is due to",
"opts": [
"the heating effect of current alone",
"both the heating effect of current and hysteresis loss",
"hysteresis loss alone",
"intense sunlight at noon"
]
},
{
"n": 43,
"stem": "Lux is the SI unit of",
"opts": [
"intensity of illumination (illuminance)",
"luminous efficiency",
"luminous flux",
"luminous intensity"
]
},
{
"n": 44,
"stem": "The distribution of energy in the spectrum of a black body is correctly represented by",
"opts": [
"Wien's law",
"Planck's law",
"Stefan's law",
"Kirchhoff's law"
]
},
{
"n": 45,
"stem": "When work is done on a body by an external force, its",
"opts": [
"only kinetic energy increases",
"only potential energy increases",
"kinetic and potential energy may both increase",
"sum of kinetic and potential energy remains constant"
]
},
{
"n": 46,
"stem": "A body of mass 10 kg is dropped to the ground from a height of 10 m. The work done by the gravitational force is (g = 9.8 m/s²)",
"opts": [
"−490 J",
"−980 J",
"+490 J",
"+980 J"
]
},
{
"n": 47,
"stem": "A stone is thrown vertically upward and returns to the ground. Its potential energy is maximum",
"opts": [
"during the upward journey",
"during the return journey",
"at the maximum height",
"at the bottom"
]
},
{
"n": 48,
"stem": "An electric lamp is connected to a 220 V, 50 Hz supply. The peak value of the voltage is",
"opts": [
"210 V",
"311 V",
"211 V",
"320 V"
]
},
{
"n": 49,
"stem": "Radioactivity is a(n)",
"opts": [
"irreversible process",
"spontaneous process",
"self-disintegration process",
"All of the above"
]
},
{
"n": 50,
"stem": "The phenomenon by which light travels in an optical fibre is",
"opts": [
"Reflection",
"Total internal reflection",
"Refraction",
"Transmission"
]
},
{
"n": 51,
"stem": "In the circuit shown (15 V battery with 0.5 Ω internal resistance, 2 Ω and 8 Ω in series, then 6 Ω between A and B in parallel with 7 Ω + 1 Ω + 10 Ω), the current from the battery is",
"opts": [
"1 A",
"1.5 A",
"2 A",
"3 A"
],
"image": "/papers/me/tech2-eng-2015-circuit.png"
},
{
"n": 52,
"stem": "Two wires are made of the same material. The first wire is twice as long as the second and has twice its diameter. The resistance of the first will be",
"opts": [
"twice that of the second",
"equal to that of the second",
"half that of the second",
"four times that of the second"
]
},
{
"n": 53,
"stem": "Hooke's law defines",
"opts": [
"Stress",
"Modulus of elasticity",
"Strain",
"Elastic limit"
]
},
{
"n": 54,
"stem": "When an NPN transistor is used as an amplifier,",
"opts": [
"electrons move from base to collector",
"electrons move from collector to base",
"holes move from emitter to base",
"holes move from base to emitter"
]
},
{
"n": 55,
"stem": "Which of the following logic gates is a universal gate?",
"opts": [
"OR",
"AND",
"NOT",
"NOR"
]
},
{
"n": 56,
"stem": "A body is just floating on the surface of a liquid; its density is the same as that of the liquid. The body is slightly pushed down. What will happen to it?",
"opts": [
"It will slowly come back to its earlier position",
"It will sink",
"It will remain submerged where it is left",
"It will come out violently"
]
},
{
"n": 57,
"stem": "Work done by a frictional force can be",
"opts": [
"Negative",
"Zero",
"Positive",
"All of the above"
]
},
{
"n": 58,
"stem": "The value of g at a particular point is 9.8 m/s². Suppose the earth suddenly shrinks uniformly to half its present size without losing any mass. The value of g at the same point (its distance from the centre of the earth does not change) will now be",
"opts": [
"4.9 m/s²",
"9.8 m/s²",
"3.1 m/s²",
"19.6 m/s²"
]
},
{
"n": 59,
"stem": "A spring balance is attached to the ceiling of a lift. A bag hung on it reads 49 N when the lift is stationary. If the lift moves downward with an acceleration of 5 m/s², the reading will be (g = 9.8 m/s²)",
"opts": [
"49 N",
"74 N",
"24 N",
"15 N"
]
},
{
"n": 60,
"stem": "In which process is the rate of heat transfer maximum?",
"opts": [
"Conduction",
"Convection",
"Radiation",
"Heat is transferred at the same speed in all of these"
]
},
{
"n": 61,
"stem": "A computer program that converts assembly language to machine language is a(n)",
"opts": [
"Compiler",
"Interpreter",
"Assembler",
"Comparator"
]
},
{
"n": 62,
"stem": "Hard disks are formatted in the same manner as floppy disks. However, before a hard disk can be formatted, it must first be",
"opts": [
"Partitioned",
"Write-protected",
"Inter-sectioned",
"Deleted"
]
},
{
"n": 63,
"stem": "The most common format for a home video recorder is VHS. VHS stands for",
"opts": [
"Video Home System",
"Very High Speed",
"Voltage House Standard",
"Video Horizontal Standard"
]
},
{
"n": 64,
"stem": "The binary system uses powers of",
"opts": [
"2",
"10",
"8",
"16"
]
},
{
"n": 65,
"stem": "Frames from one LAN can be transmitted to another LAN via a",
"opts": [
"Router",
"Bridge",
"Repeater",
"Modem"
]
},
{
"n": 66,
"stem": "Which of the following program is not a utility?",
"opts": [
"",
"",
"",
"Debugger Editor Spooler All of the above"
]
},
{
"n": 67,
"stem": "On the PC side, the (parallel) printer port is a",
"opts": [
"25-pin female serial connector",
"15-pin female parallel connector",
"25-pin female parallel connector",
"25-pin male serial connector"
]
},
{
"n": 68,
"stem": "How many digits of the DNIC (Data Network Identification Code) identify the country?",
"opts": [
"First three",
"First four",
"First five",
"First six"
]
},
{
"n": 69,
"stem": "Which device of computer operation dispenses with the use of the keyboard?",
"opts": [
"",
"",
"",
"Joystick Light pen Mouse Touch"
]
},
{
"n": 70,
"stem": "A program that is employed in the development, repair or enhancement of other programs is known as",
"opts": [
"",
"",
"",
"System software Software tool Applications program Utility program"
]
}
]"""

KEY = {
 1: ("b", "The longest side of a right-angled triangle, opposite the right angle, is the hypotenuse."),
 2: ("d", "Adding the equations: 4x + 4y = 20, so x + y = 5 and 2x + 2y = 10."),
 3: ("d", "US : Indian = 5 : 2 = 25 : 10 and Indian : Norwegian = 5 : 1 = 10 : 2, so US : Norwegian = 25 : 2."),
 4: ("b", "Slope = (0 − a)/(3a − 0) = −1/3."),
 5: ("a", "Six years ago Tashi was 11 and Dorji was D − 6: 11 = P(D − 6), so D = 11/P + 6."),
 6: ("c", "2x² − x: f(3) = 18 − 3 = 15 and f(5) = 50 − 5 = 45. The other options fail at least one value."),
 7: ("a", "Large holes need 20/2 = 10 volunteer-hours, small holes 700/35 = 20 volunteer-hours: 30 volunteer-hours ÷ 3 hours = 10 volunteers."),
 8: ("c", "πr²/2 = 8π gives r = 4, so AD = BC = 8; perimeter 26 gives AB = CD = 5. Unshaded boundary = AB + BC + CD + semicircle arc = 5 + 8 + 5 + 4π = 18 + 4π."),
 9: ("a", "Total = 4 × 110 = 440; 440 − 3 × 105 = 125."),
 10: ("a", "76967 reads the same forwards and backwards - a palindrome."),
 11: ("a", "(√2 − √3)² = 2 − 2√6 + 3 = 5 − 2√6."),
 12: ("d", "x = 4x − 3 gives x = 1; x = −(4x − 3) gives x = 0.6. Only 0.6 is offered."),
 13: ("d", "Total = 7(500) + 37(1000) + 4(1500) + 2(2000) = 50,500 for 50 employees: Nu. 1010."),
 14: ("c", "125 → 50 → 20 → 8 cm after the fourth bounce (× 2/5 each time)."),
 15: ("a", "On the y-axis x = 0: 4y = 12, y = 3, so (0, 3)."),
 16: ("b", "Old time = 50/v; new time = 300/(3v) = 100/v - twice as much."),
 17: ("a", "1920 − CP = CP − 1280 gives CP = 1600; for 25% profit sell at 1.25 × 1600 = Nu. 2000."),
 18: ("b", "sin θ = BC/AB = 0.6, so AB = 12/0.6 = 20 cm; x = AC = √(20² − 12²) = 16 cm."),
 19: ("c", "Each term is the sum of the two before: 55 + 89 = 144 (and 89 + 144 = 233)."),
 21: ("a", "Ethylene (ethene) is the plant hormone used to ripen fruit artificially (calcium carbide, which releases acetylene, is a banned shortcut)."),
 22: ("b", "Sucrose is glucose + fructose joined together - a disaccharide."),
 23: ("c", "The C, H and O atoms within a sugar molecule are held by covalent bonds."),
 24: ("d", "Steel is iron with a small amount of carbon (up to about 2%)."),
 25: ("d", "Anaerobic decay of vegetation (in marshes) produces methane - marsh gas."),
 26: ("c", "Vinegar is a dilute (about 5%) solution of acetic acid."),
 27: ("b", "Heavy water melts/freezes at 3.8 °C (and boils at 101.4 °C)."),
 28: ("b", "Tin's symbol is Sn, from the Latin stannum."),
 29: ("b", "Polythene (polyethylene) is made by polymerising ethylene."),
 30: ("b", "0.0018 ml ≈ 0.0018 g of water = 0.0018/18 = 1 × 10⁻⁴ mol; × 6.023 × 10²³ = 6.023 × 10¹⁹ molecules."),
 31: ("d", "(NH₂)₂CO is urea, also called carbamide - a nitrogen fertiliser."),
 32: ("a", "A hydrogen atom has one electron; H⁺ has lost it, so it has none."),
 33: ("c", "1,1-dichloroethane and 1,2-dichloroethane differ only in the position of the Cl atoms - positional isomerism."),
 34: ("b", "Magnetite is Fe₃O₄ (haematite is Fe₂O₃, siderite FeCO₃, limonite 2Fe₂O₃·3H₂O)."),
 35: ("b", "Mg(OH)₂ + 2HCl → MgCl₂ + 2H₂O: 2 + 2 = 4 H on the left and 2 × 2 = 4 H on the right."),
 36: ("a", "Respiration: C₆H₁₂O₆ + 6O₂ → 6CO₂ + 6H₂O + energy."),
 37: ("a", "Phenolphthalein is colourless in acid and pink in basic solution (pH above about 8.2)."),
 38: ("b", "Newlands (law of octaves), Mendeleev and Lothar Meyer developed the periodic table."),
 39: ("c", "Ionic and covalent-network solids are hard, high-melting and poor conductors; metals conduct well."),
 40: ("b", "Electronegativity (Pauling) is the tendency of an atom in a molecule to attract the shared (bonding) pair of electrons."),
 41: ("b", "Ink rises through the fine pores of blotting paper by capillary action."),
 42: ("b", "Transformers heat up from copper (I²R) losses and core (hysteresis and eddy-current) losses."),
 43: ("a", "Lux (lumen per m²) is the unit of illuminance - intensity of illumination."),
 44: ("b", "Planck's radiation law correctly gives the energy distribution over all wavelengths; Wien's and Rayleigh-Jeans laws fit only parts."),
 45: ("c", "Work done by an external force can increase kinetic energy, potential energy or both."),
 46: ("d", "Gravity acts in the direction of motion: W = mgh = 10 × 9.8 × 10 = +980 J."),
 47: ("c", "PE = mgh is greatest where h is greatest - at the maximum height."),
 48: ("b", "V_peak = √2 × V_rms = 1.414 × 220 ≈ 311 V."),
 49: ("d", "Radioactive decay is spontaneous, irreversible self-disintegration of unstable nuclei."),
 50: ("b", "Light stays inside an optical fibre by repeated total internal reflection."),
 51: ("a", "7 + 1 + 10 = 18 Ω in parallel with 6 Ω = 4.5 Ω. Total = 0.5 + 2 + 8 + 4.5 = 15 Ω, so I = 15/15 = 1 A."),
 52: ("c", "R = ρL/A: doubling L doubles R; doubling the diameter makes A four times as large. Net R = 2/4 = 1/2."),
 53: ("b", "Hooke's law (stress ∝ strain within the elastic limit) defines the modulus of elasticity, E = stress/strain."),
 54: ("a", "In an NPN transistor electrons flow from emitter into the base and on to the collector."),
 55: ("d", "NOR (and NAND) are universal gates - any logic function can be built from them alone."),
 56: ("c", "With equal densities, weight equals buoyancy at any depth (neutral equilibrium), so it stays where it is left."),
 57: ("d", "Friction usually does negative work, but it does zero work when there is no displacement and positive work when it drives motion (e.g. a box on an accelerating truck)."),
 58: ("b", "g = GM/r²; M and r are unchanged, so g is still 9.8 m/s²."),
 59: ("c", "Mass = 49/9.8 = 5 kg; reading = m(g − a) = 5 × (9.8 − 5) = 24 N."),
 60: ("c", "Radiation travels at the speed of light and needs no medium - the fastest mode of heat transfer."),
 61: ("c", "An assembler translates assembly language into machine code."),
 62: ("a", "A hard disk must be partitioned before each partition is formatted."),
 63: ("a", "VHS = Video Home System."),
 64: ("a", "Binary place values are powers of 2."),
 65: ("b", "A bridge forwards frames between LAN segments at the data-link layer."),
 67: ("c", "The PC parallel (LPT) printer port is a 25-pin female DB-25 connector."),
 68: ("a", "A DNIC has four digits: the first three are the Data Country Code; the fourth identifies the network."),
}

NEW_MCQ = [
    ("The value of sin 30° + cos 60° is", ["0", "1/2", "1", "√3"], "c", "sin 30° = 1/2 and cos 60° = 1/2, so the sum is 1."),
    ("Which of the following is volatile memory?", ["ROM", "RAM", "Hard disk", "Flash drive"], "b", "RAM loses its contents when the power is switched off; the others keep data."),
    ("One kilobyte (KB) in computer memory is equal to", ["1000 bytes", "512 bytes", "1024 bytes", "2048 bytes"], "c", "In binary units 1 KB = 2¹⁰ = 1024 bytes."),
    ("Which protocol is used to send e-mail?", ["FTP", "SMTP", "HTTP", "SNMP"], "b", "SMTP (Simple Mail Transfer Protocol) sends e-mail; POP3/IMAP retrieve it."),
]

SAQ = [
 dict(marks=3, stem="Find the particular solution of the differential equation dy/dx = xy + x which satisfies y = 3 when x = 0. Show your work. (3 marks)",
      kp=[("Separate variables: dy/(y + 1) = x dx", 1), ("Integrate: ln|y + 1| = x²/2 + C; y = 3 at x = 0 gives C = ln 4", 1), ("Particular solution: y = 4e^(x²/2) − 1", 1)],
      model="dy/dx = x(y + 1), so dy/(y + 1) = x dx.\nIntegrating: ln|y + 1| = x²/2 + C.\nAt x = 0, y = 3: ln 4 = C.\nSo ln(y + 1) = x²/2 + ln 4, y + 1 = 4e^(x²/2), and y = 4e^(x²/2) − 1."),
 dict(marks=3, stem="A man has $10,000 to invest. He invests $4,000 at 5% and $3,500 at 4%. In order to have a yearly income of $500, at what rate does he need to invest the remainder? (3 marks)",
      kp=[("Income so far: 5% of 4,000 = $200 and 4% of 3,500 = $140 - total $340", 1), ("Remainder = 10,000 − 7,500 = $2,500 must earn 500 − 340 = $160", 1), ("Rate = 160/2,500 × 100 = 6.4%", 1)],
      model="Income from the first two investments: 0.05 × 4,000 = $200 and 0.04 × 3,500 = $140, total $340.\nRemainder invested = 10,000 − 4,000 − 3,500 = $2,500, which must earn 500 − 340 = $160.\nRate = 160/2,500 × 100 = 6.4% per year."),
 dict(marks=3, stem="Dorji sold two pens at Nu. 1.20 each. Based on the cost, his profit on one was 20% and his loss on the other was 20%. What was his overall loss or profit? (3 marks)",
      kp=[("Cost of the first pen = 1.20/1.20 = Nu. 1.00", 1), ("Cost of the second pen = 1.20/0.80 = Nu. 1.50", 1), ("Total cost 2.50, total sale 2.40: loss of Nu. 0.10 (4%)", 1)],
      model="First pen (20% profit): cost = 1.20/1.20 = Nu. 1.00.\nSecond pen (20% loss): cost = 1.20/0.80 = Nu. 1.50.\nTotal cost = Nu. 2.50; total selling price = Nu. 2.40.\nOverall he made a loss of Nu. 0.10, i.e. 0.10/2.50 × 100 = 4% loss."),
 dict(marks=3, stem="If ammonium nitrate is heated, what does it decompose to? Write a balanced equation for this reaction. State two uses of ammonium nitrate. (3 marks)",
      kp=[("On gentle heating it gives dinitrogen oxide (nitrous oxide, N₂O) and water", 1), ("NH₄NO₃ → N₂O + 2H₂O", 1), ("Uses (any two): nitrogen fertiliser; explosives (e.g. ANFO for mining/blasting); making N₂O (laughing gas); instant cold packs", 1)],
      model="When heated gently (about 200-250 °C), ammonium nitrate decomposes to dinitrogen oxide (nitrous oxide, 'laughing gas') and water:\nNH₄NO₃ → N₂O + 2H₂O.\n(At higher temperatures it can decompose explosively: 2NH₄NO₃ → 2N₂ + O₂ + 4H₂O.)\nUses: (1) a nitrogen fertiliser; (2) in explosives such as ANFO for mining and road construction; also to prepare N₂O and in instant cold packs."),
 dict(marks=3, stem="What are the four main points of the kinetic molecular theory of ideal gases? Which two gases behave most like ideal gases? (3 marks)",
      kp=[("Gases are made of tiny particles in constant, random, straight-line motion; the volume of the particles is negligible compared with the container", 1),
          ("There are no attractive/repulsive forces between particles, and collisions are perfectly elastic; average kinetic energy is proportional to the absolute temperature", 1),
          ("Hydrogen and helium behave most like ideal gases (small molecules, very weak intermolecular forces)", 1)],
      model="Kinetic molecular theory of ideal gases:\n1. A gas consists of a very large number of tiny particles in constant, random, straight-line motion.\n2. The volume of the particles themselves is negligible compared with the volume of the container.\n3. There are no attractive or repulsive forces between the particles, and their collisions (with each other and the walls) are perfectly elastic.\n4. The average kinetic energy of the particles is directly proportional to the absolute (Kelvin) temperature.\nHydrogen and helium behave most like ideal gases, because their particles are very small and the forces between them are very weak (best at high temperature and low pressure)."),
 dict(marks=3, stem="What is the molarity of the solution made by dissolving 2.5 g of NaCl in enough water to make 125 ml of solution? (3 marks)",
      kp=[("Molar mass of NaCl = 23 + 35.5 = 58.5 g/mol", 1), ("Moles = 2.5/58.5 = 0.0427 mol; volume = 0.125 L", 1), ("Molarity = 0.0427/0.125 = 0.34 M", 1)],
      model="Molar mass of NaCl = 23 + 35.5 = 58.5 g/mol.\nMoles of NaCl = 2.5/58.5 = 0.0427 mol.\nVolume = 125 ml = 0.125 L.\nMolarity = moles/litres = 0.0427/0.125 = 0.342 M (about 0.34 mol/L)."),
 dict(marks=3, stem="An object is placed 10 cm in front of a concave mirror of radius of curvature 15 cm. Calculate the position, nature and magnification of the image. (3 marks)",
      kp=[("f = R/2 = 7.5 cm; mirror formula 1/f = 1/u + 1/v (real-is-positive) gives 1/v = 1/7.5 − 1/10 = 1/30", 1), ("v = 30 cm in front of the mirror", 1), ("Real and inverted; m = −v/u = −3 (three times enlarged)", 1)],
      model="f = R/2 = 15/2 = 7.5 cm (concave mirror).\nUsing 1/f = 1/u + 1/v with distances in front of the mirror positive: 1/v = 1/7.5 − 1/10 = (4 − 3)/30 = 1/30, so v = 30 cm.\n(New Cartesian signs: u = −10, f = −7.5 give v = −30 cm - the same position.)\nThe image is 30 cm in front of the mirror (on the same side as the object): it is real and inverted.\nMagnification m = −v/u = −30/10 = −3: the image is three times the size of the object and inverted. (The object lies between F and C, so the image lies beyond C.)"),
 dict(marks=3, stem="A student with a mass of 80 kg runs up three flights of stairs in 12 s. The student has gone up a vertical distance of 8 m. Determine the amount of work done by the student to raise his body to this height. Assume his speed is constant. (3 marks)",
      kp=[("At constant speed the work done equals the gain in potential energy: W = mgh", 1), ("W = 80 × 9.8 × 8", 1), ("W = 6,272 J (≈ 6.3 kJ); (power = 6,272/12 ≈ 523 W)", 1)],
      model="At constant speed there is no change in kinetic energy, so the work done equals the gain in gravitational potential energy:\nW = mgh = 80 × 9.8 × 8 = 6,272 J ≈ 6.3 kJ.\n(The time is needed only for power: P = 6,272/12 ≈ 523 W.)"),
 dict(marks=3, image="/papers/me/tech2-eng-2015-plank.png", stem="A plank of negligible mass is supported by two supports A and B, a distance d apart, as shown. A mass m rests on the plank at a distance x from A.\na) Draw the forces that act on the plank. (1.5 marks)\nb) What would happen if x becomes greater than d? Could the arrangement be stable? (1.5 marks)",
      kp=[("a) Weight mg acting downward at distance x from A", 0.5), ("a) Upward normal reactions R_A at A and R_B at B (R_A + R_B = mg)", 1),
          ("b) With x > d the load is beyond B: taking moments about B, R_A would have to pull downward, which a simple support cannot do", 1), ("b) So R_A becomes zero, the plank tips about B and the arrangement is not stable (unless the plank is fixed down at A)", 0.5)],
      model="a) Forces on the plank: the weight of the mass, mg, acting vertically downward at distance x from A; the upward reaction R_A at support A; and the upward reaction R_B at support B. For equilibrium R_A + R_B = mg and, taking moments about A, R_B = mg·x/d and R_A = mg(1 − x/d).\nb) If x > d the mass is beyond support B. Then R_A = mg(1 − x/d) would be negative - A would have to pull the plank down. A simple support can only push, so R_A becomes zero, the plank rotates (tips) about B and the mass falls. The arrangement cannot be stable unless the end at A is fixed (bolted or weighed down) to provide a downward force."),
 dict(marks=3, stem="What is a cookie? Why has it become a privacy concern that prompted European and US lawmakers to take action in 2011? (3 marks)",
      kp=[("A cookie is a small text file that a website stores in the user's browser to remember information (log-in, preferences, cart)", 1),
          ("Concern: third-party/tracking cookies follow users across sites, build profiles of browsing habits for advertising, often without the user knowing or consenting", 1),
          ("Action: the EU 'cookie law' (ePrivacy Directive, in force 2011) required informed consent before storing cookies; US lawmakers proposed 'Do Not Track' bills in 2011", 1)],
      model="A cookie is a small text file that a website saves in the user's web browser so it can recognise the user later - for example to keep them logged in, remember settings or hold items in a shopping cart.\nPrivacy concern: cookies, especially third-party (tracking) cookies placed by advertisers, can follow a person across many websites and build a detailed profile of their browsing habits and interests, which is used or sold for targeted advertising - usually without the person knowing or agreeing.\nIn 2011 the EU's amended ePrivacy Directive (the 'cookie law') came into force, requiring websites to obtain users' informed consent before storing non-essential cookies, and US lawmakers introduced 'Do Not Track' bills to let users opt out of online tracking."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
