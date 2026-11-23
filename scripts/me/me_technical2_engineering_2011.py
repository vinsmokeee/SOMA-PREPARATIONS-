"""ME Technical Paper II (General Subject Knowledge), ENGINEERING group, BCSE 2011 (written 29 October 2011) - real paper,
PDF sent by the founder. Same layout as the latest (BCSE 2025) paper: Part I 70 MCQ x 1 (Section A Mathematics 1-20,
B Chemistry 21-40, C Physics 41-60, D General IT 61-70); Part II 10 short answers x 3 - so no marks were changed.
The PDF's maths and option columns do not convert cleanly, so every question was retyped from the page images.
Picture: MCQ 8 square with quarter circles.
Left out (more than one defensible answer / no correct option): MCQ 24 (H2SO4 bond types - textbooks differ), 28 (NaOH + I2:
none of the products is right), 67 (1 MB = 1000 KB and 1 KB = 1000 bytes are also correct in SI units).
Three new MCQs (2 Chemistry, 1 IT) keep Part I at 70.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Engineering): BCSE 2011, batch 1"
GROUP_TAG = "eng2011"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "engineering"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Engineering: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "(a + b + c)³ is equal to:",
"opts": [
"a³ + b³ + c³ + 3(a + b)(b + c)(c + a)",
"a³ + b³ + 3ab(a + b)",
"a² + 2ab³ + c²",
"(a − b)(a² + b² + c²)"
]
},
{
"n": 2,
"stem": "[ ( ⁴√(x^(−3/4)) )^(−4/3) ]⁴ equals:",
"opts": [
"x²",
"x⁻²",
"x^(1/3)",
"x"
]
},
{
"n": 3,
"stem": "The determinant of the matrix A = [1 3 −2; 4 1 −1; 5 −3 2] (rows separated by semicolons) is:",
"opts": [
"−10",
"−8",
"5",
"−6"
]
},
{
"n": 4,
"stem": "π/3 radians is the same as:",
"opts": [
"60°",
"270°",
"45°",
"90°"
]
},
{
"n": 5,
"stem": "Evaluate lim (x → 0) of cos x/(x + 2).",
"opts": [
"1",
"½",
"3",
"2"
]
},
{
"n": 6,
"stem": "Let y = x^(2/3) + 2x². Then dy/dx is equal to:",
"opts": [
"x^(−1/3) + 4x",
"x + 4x^(2/3)",
"5x + x^(2/3)",
"(2/3)x^(−1/3) + 4x"
]
},
{
"n": 7,
"stem": "If log_a √2 = 1/6, then a is equal to:",
"opts": [
"4",
"6",
"8",
"0"
]
},
{
"n": 8,
"stem": "A square plot 40 m × 40 m has a quarter circle of radius 14 m shaded at each corner, as shown. The total area of the unshaded part will be:",
"opts": [
"1000 m²",
"984 m²",
"780 m²",
"1300 m²"
],
"image": "/papers/me/tech2-eng-2011-square.png"
},
{
"n": 9,
"stem": "If 3[x y; z w] = [4 x+y; z+w 3] + [x 6; −1 2w] (2 × 2 matrices, rows separated by semicolons), x is equal to:",
"opts": [
"4",
"12",
"8",
"2"
]
},
{
"n": 10,
"stem": "A line passes through (−3, 2) and is perpendicular to the line x + 3y − 5 = 0. Its equation is:",
"opts": [
"y − x − 10 = 0",
"y − 5x + 1 = 0",
"y − 3x − 11 = 0",
"y + 2x − 3 = 0"
]
},
{
"n": 11,
"stem": "The mean of 100 observations is 50. If one observation of 50 is replaced by 150, the new mean is:",
"opts": [
"57",
"151",
"101",
"51"
]
},
{
"n": 12,
"stem": "If a = 1 − √2, the value of (a − 1/a)³ is:",
"opts": [
"16",
"8",
"12",
"9"
]
},
{
"n": 13,
"stem": "Karma and Mindu appear in an interview for 2 vacancies. The probability of Karma's selection is 1/3 and of Mindu's 1/5. The probability that only one of them is selected is:",
"opts": [
"2/3",
"3/5",
"2/5",
"1/7"
]
},
{
"n": 14,
"stem": "The modulus of the complex number (2 + 3i)/(3 + 2i) is:",
"opts": [
"1",
"7",
"2",
"3"
]
},
{
"n": 15,
"stem": "Differentiating y = e^(sin x) with respect to x gives:",
"opts": [
"sin x",
"sin x · e^(cos x)",
"cos x · e^(sin x)",
"cos x · eˣ"
]
},
{
"n": 16,
"stem": "∫ 1/√x dx is equal to (C is a constant):",
"opts": [
"1/(2x) + C",
"2√x + C",
"√x + 2",
"2√x"
]
},
{
"n": 17,
"stem": "∫₀^(π/2) cos x dx is equal to:",
"opts": [
"2",
"sin x",
"1",
"0"
]
},
{
"n": 18,
"stem": "If ω and ω² are the complex cube roots of unity, (2 − ω + 2ω²)(2 + 2ω − ω²) is equal to:",
"opts": [
"5",
"7ω",
"9",
"ω"
]
},
{
"n": 19,
"stem": "The value of the determinant |cos A sin A; −sin A cos A| is:",
"opts": [
"1",
"2/3",
"2",
"1/3"
]
},
{
"n": 20,
"stem": "The radius and height of a cylinder are in the ratio 2 : 3. If the volume of the cylinder is 1617 cm³, the radius of its base is (π = 22/7):",
"opts": [
"3.5 cm",
"4 cm",
"11 cm",
"7 cm"
]
},
{
"n": 21,
"stem": "Sn is the chemical symbol of",
"opts": [
"Silicon",
"Antimony",
"Tin",
"Strontium"
]
},
{
"n": 22,
"stem": "Which of the following is used as a moderator in nuclear reactors?",
"opts": [
"Carbon dioxide",
"Boron steel",
"Aluminium",
"Graphite"
]
},
{
"n": 23,
"stem": "Heating rubber with sulphur is known as",
"opts": [
"Galvanisation",
"Vulcanisation",
"Bessemerisation",
"Sulphonation"
]
},
{
"n": 25,
"stem": "The pH of a solution whose hydrogen ion concentration is 0.005 mol/L is",
"opts": [
"Below 7",
"7",
"Above 7",
"None of the above"
]
},
{
"n": 26,
"stem": "Which law states that the amounts of different substances liberated by the same quantity of electricity are proportional to their equivalent weights?",
"opts": [
"Hess's law",
"Faraday's first law of electrolysis",
"Faraday's second law of electrolysis",
"Faraday's third law of electrolysis"
]
},
{
"n": 27,
"stem": "Concentrated nitric acid does not react with",
"opts": [
"Aluminium",
"Tin",
"Copper",
"Silver"
]
},
{
"n": 29,
"stem": "The functional group of an aldehyde is",
"opts": [
"−OH",
"−X (R−X)",
"−CHO",
"−COOH"
]
},
{
"n": 30,
"stem": "The common name of the compound C₂H₅OH is",
"opts": [
"methyl alcohol",
"propyl alcohol",
"ethyl alcohol",
"butanol"
]
},
{
"n": 31,
"stem": "Biogas is produced by the anaerobic digestion or fermentation of biodegradable materials such as biomass, manure, sewage, municipal and green waste, plant material and crops. Biogas consists primarily of",
"opts": [
"Ethane",
"Methane",
"Butane",
"Octane"
]
},
{
"n": 32,
"stem": "Natural rubber is a",
"opts": [
"polyester",
"polyamide",
"polyisoprene",
"polysaccharide"
]
},
{
"n": 33,
"stem": "A buffer solution is a mixture of a",
"opts": [
"weak base and weak acid",
"weak base and strong acid",
"weak acid and conjugate acid",
"weak acid and its conjugate base"
]
},
{
"n": 34,
"stem": "The correct name for NH₄ClO₄ is",
"opts": [
"Ammonium perchlorate",
"Ammonium chloric acid",
"Ammonium chlorate",
"Ammonium chloric oxide"
]
},
{
"n": 35,
"stem": "Isomers have the same",
"opts": [
"structural formula",
"chemical properties",
"molecular formula",
"physical properties"
]
},
{
"n": 36,
"stem": "Phenol is also called",
"opts": [
"salicylic acid",
"benzyl alcohol",
"carbolic acid",
"salol"
]
},
{
"n": 37,
"stem": "The oxidising power of the halogens is in the order:",
"opts": [
"Cl < Br < I < F",
"Cl < I < Br < F",
"I < F < Cl < Br",
"I < Br < Cl < F"
]
},
{
"n": 38,
"stem": "Which one of the following is the weakest base?",
"opts": [
"NaOH",
"KOH",
"Ca(OH)₂",
"Zn(OH)₂"
]
},
{
"n": 39,
"stem": "The free energy change (ΔG) of a spontaneous reaction is",
"opts": [
"= 0",
"> 0",
"< 0",
"None of the above"
]
},
{
"n": 40,
"stem": "The reaction of H₂ and Cl₂ over the surface of water in the presence of sunlight is an example of a",
"opts": [
"Zero order reaction",
"First order reaction",
"Second order reaction",
"Third order reaction"
]
},
{
"n": 41,
"stem": "Which of the following properties of a solid would change if it were taken from the earth to the moon?",
"opts": [
"mass",
"weight",
"density",
"volume"
]
},
{
"n": 42,
"stem": "Force per unit mass is equivalent to:",
"opts": [
"Thrust",
"Pressure",
"Density",
"Acceleration"
]
},
{
"n": 43,
"stem": "A stone of mass 0.2 kg is projected by a catapult with a velocity of 20 m/s. The kinetic energy of the stone will be:",
"opts": [
"60 J",
"40 J",
"55 J",
"70 J"
]
},
{
"n": 44,
"stem": "Two plane mirrors are placed with their surfaces at right angles and a small object is placed between them. How many reflected images of the object can be seen?",
"opts": [
"1",
"2",
"3",
"4"
]
},
{
"n": 45,
"stem": "A ray of light is shone onto a prism. The light cannot be:",
"opts": [
"deviated",
"dispersed",
"focused",
"reflected"
]
},
{
"n": 46,
"stem": "Which one of the following electromagnetic radiations has the shortest wavelength?",
"opts": [
"Radio waves",
"Infrared",
"Ultraviolet",
"X-rays"
]
},
{
"n": 47,
"stem": "Aap Dorji sees 'steam' start to come from a factory whistle and hears the sound 3 seconds later. If the speed of sound in air is 360 m/s, the distance from Aap Dorji to the whistle (in metres) is:",
"opts": [
"1080",
"120",
"780",
"960"
]
},
{
"n": 48,
"stem": "Many tall buildings are protected from lightning by lightning conductors. Which of the following about a lightning conductor is NOT true?",
"opts": [
"It has a point at its top",
"It is made of copper",
"It is insulated from the building",
"Its lower end is buried in the earth"
]
},
{
"n": 49,
"stem": "The current flowing through a 4 Ω resistor when a potential difference of 6 V is applied across it is:",
"opts": [
"1.5 A",
"3 A",
"5 A",
"2 A"
]
},
{
"n": 50,
"stem": "The e.m.f. of a cell is quoted as 1.5 V. This means that the cell can supply:",
"opts": [
"1.5 A of current",
"1.5 coulombs of charge",
"1.5 Ω of resistance",
"1.5 joules of energy per coulomb of charge"
]
},
{
"n": 51,
"stem": "The depolariser used in a dry cell is:",
"opts": [
"ammonium chloride",
"manganese(IV) oxide",
"zinc chloride",
"carbon"
]
},
{
"n": 52,
"stem": "An atom of lithium contains 3 electrons, 3 protons and 4 neutrons. Its mass number is:",
"opts": [
"3",
"4",
"7",
"6"
]
},
{
"n": 53,
"stem": "Certain atoms emit gamma radiation because:",
"opts": [
"they have a large nucleon number",
"their nuclei emit electrons",
"their nuclei contain protons and neutrons",
"their nuclei are unstable"
]
},
{
"n": 54,
"stem": "How do the frequency and wavelength change when waves in a ripple tank pass through a narrow gap in a barrier?",
"opts": [
"They increase",
"They decrease",
"They are unchanged",
"One increases and the other decreases"
]
},
{
"n": 55,
"stem": "A leaf which contains only a green pigment is illuminated with monochromatic red light. The leaf will appear to be:",
"opts": [
"black",
"green",
"yellow",
"red"
]
},
{
"n": 56,
"stem": "A concave mirror may be used for all but one of the following. Which one?",
"opts": [
"A magnifying (shaving) mirror",
"A car wing mirror",
"A dentist's mirror",
"A torch reflector"
]
},
{
"n": 57,
"stem": "When a capacitor is connected to a battery:",
"opts": [
"no current flows in the circuit at all",
"a current flows but soon decreases to zero",
"alternating current flows through the circuit",
"the current increases to a maximum when the capacitor is fully charged"
]
},
{
"n": 58,
"stem": "Light appears to travel in straight lines because:",
"opts": [
"it is not absorbed by the atmosphere",
"its speed is very high",
"it is reflected by the upper part of the atmosphere",
"its wavelength is very small"
]
},
{
"n": 59,
"stem": "The conductivity of semiconductors:",
"opts": [
"does not depend on temperature",
"decreases with rise of temperature",
"increases with rise of temperature",
"increases with decrease of temperature"
]
},
{
"n": 60,
"stem": "The core used in transformers is laminated because it:",
"opts": [
"increases the magnetic field",
"increases the magnetic saturation level of the core",
"decreases the residual magnetism of the core",
"decreases the eddy current loss in the core"
]
},
{
"n": 61,
"stem": "The information stored in ……… is erased when the computer is turned off.",
"opts": [
"ROM",
"RAM",
"BIOS",
"CPU"
]
},
{
"n": 62,
"stem": "Laptop computers fall under which computer hardware generation?",
"opts": [
"First generation",
"Second generation",
"Third generation",
"Fourth generation"
]
},
{
"n": 63,
"stem": "USB is used to connect devices and to store data (USB drives). USB stands for",
"opts": [
"Unlimited Service Band",
"Unlimited Serial Bus",
"Universal Serial Bus",
"Universal Service Bus"
]
},
{
"n": 64,
"stem": "Software or hardware that checks information coming from the Internet or a network and then either blocks it or allows it to pass through to your computer, depending on its settings, is called a",
"opts": [
"Antivirus",
"Firewall",
"Security system",
"Spyware"
]
},
{
"n": 65,
"stem": "Every computer connected to the Internet is identified by a unique four-part string, known as its",
"opts": [
"IP address",
"Host name",
"Domain name",
"None of the above"
]
},
{
"n": 66,
"stem": "ENIAC was the first general-purpose electronic computer. ENIAC stands for",
"opts": [
"Electronic Network Interactive Analytic Computer",
"Electronic Numerical Integrator And Computer",
"Electronic Network Integrated Analytical Computer",
"Electronic Numerical Integrated Automatic Computer"
]
},
{
"n": 68,
"stem": "Which of the following memories must be refreshed many times per second?",
"opts": [
"Static RAM",
"Dynamic RAM",
"EPROM",
"ROM"
]
},
{
"n": 69,
"stem": "A .PNG file is what kind of file?",
"opts": [
"Image file",
"Movie/animation file",
"Audio file",
"MS Office document"
]
},
{
"n": 70,
"stem": "A network whose elements may be far apart, usually joining two or more smaller networks by dedicated high-speed telephone lines, is known as a",
"opts": [
"Local Area Network",
"Wide Area Network",
"World Wide Web",
"Metropolitan Area Network"
]
}
]"""

KEY = {
 1: ('a', 'Standard identity: (a + b + c)³ = a³ + b³ + c³ + 3(a + b)(b + c)(c + a).'),
 2: ('d', '⁴√(x^(−3/4)) = x^(−3/16); raised to −4/3 gives x^(1/4); raised to 4 gives x.'),
 3: ('d', '1(2 − 3) − 3(8 + 5) + (−2)(−12 − 5) = −1 − 39 + 34 = −6.'),
 4: ('a', 'π radians = 180°, so π/3 = 60°.'),
 5: ('b', 'The function is continuous at 0: cos 0/(0 + 2) = 1/2.'),
 6: ('d', 'd/dx x^(2/3) = (2/3)x^(−1/3) and d/dx 2x² = 4x.'),
 7: ('c', 'a^(1/6) = 2^(1/2), so a = 2³ = 8.'),
 8: ('b', 'Four quarter circles make one full circle: π × 14² ≈ 616 m². 1600 − 616 ≈ 984 m².'),
 9: ('d', 'Comparing the top-left entries: 3x = 4 + x, so x = 2.'),
 10: ('c', 'The given line has slope −1/3, so the perpendicular slope is 3: y − 2 = 3(x + 3), i.e. y − 3x − 11 = 0.'),
 11: ('d', 'The total rises from 5000 to 5100, so the mean = 5100/100 = 51.'),
 12: ('b', '1/a = 1/(1 − √2) = −(1 + √2), so a − 1/a = (1 − √2) + (1 + √2) = 2, and 2³ = 8.'),
 13: ('c', 'P = (1/3)(4/5) + (2/3)(1/5) = 4/15 + 2/15 = 6/15 = 2/5.'),
 14: ('a', '|2 + 3i| = |3 + 2i| = √13, so the modulus of the quotient is 1.'),
 15: ('c', 'Chain rule: dy/dx = e^(sin x) × cos x.'),
 16: ('b', '∫x^(−1/2) dx = 2x^(1/2) + C = 2√x + C.'),
 17: ('c', '[sin x] from 0 to π/2 = 1 − 0 = 1.'),
 18: ('c', 'Using 1 + ω + ω² = 0: 2 − ω + 2ω² = −3ω and 2 + 2ω − ω² = −3ω². Product = 9ω³ = 9.'),
 19: ('a', 'cos²A − (−sin²A) = cos²A + sin²A = 1.'),
 20: ('d', 'r = 2k, h = 3k: (22/7)(4k²)(3k) = 1617, so k³ = 42.875, k = 3.5 and r = 7 cm.'),
 21: ('c', 'Sn (stannum) is tin; silicon is Si, antimony Sb, strontium Sr.'),
 22: ('d', 'Graphite (or heavy water) slows neutrons down; boron steel absorbs them (control rods); CO₂ is a coolant.'),
 23: ('b', 'Vulcanisation cross-links rubber with sulphur, making it harder and more elastic.'),
 25: ('a', 'pH = −log 0.005 ≈ 2.3 - acidic, below 7.'),
 26: ('c', "This is Faraday's second law of electrolysis (the first: mass ∝ charge passed)."),
 27: ('a', 'Concentrated HNO₃ makes aluminium passive by forming a protective oxide layer.'),
 29: ('c', 'Aldehydes contain −CHO; −OH is alcohol, −COOH carboxylic acid, R−X alkyl halide.'),
 30: ('c', 'C₂H₅OH is ethanol - ethyl alcohol.'),
 31: ('b', 'Biogas is mostly methane (50-70%) with carbon dioxide.'),
 32: ('c', 'Natural rubber is cis-1,4-polyisoprene.'),
 33: ('d', 'An acidic buffer is a weak acid with its conjugate base (salt), e.g. CH₃COOH/CH₃COONa.'),
 34: ('a', 'ClO₄⁻ is perchlorate (ClO₃⁻ is chlorate), so NH₄ClO₄ is ammonium perchlorate.'),
 35: ('c', 'Isomers share a molecular formula but differ in structure and properties.'),
 36: ('c', 'Phenol (C₆H₅OH) is commonly called carbolic acid.'),
 37: ('d', 'Oxidising power decreases down the group: F > Cl > Br > I.'),
 38: ('d', 'Zn(OH)₂ is amphoteric and only slightly soluble - the weakest base; NaOH and KOH are strong.'),
 39: ('c', 'A reaction is spontaneous when ΔG is negative; ΔG = 0 at equilibrium.'),
 40: ('a', 'This photochemical reaction is the classic example of a zero-order reaction: its rate depends on light intensity, not on reactant concentrations.'),
 41: ('b', 'Weight = mg depends on gravity; mass, density and volume do not change.'),
 42: ('d', "F/m = a (Newton's second law)."),
 43: ('b', 'KE = ½ × 0.2 × 20² = 40 J.'),
 44: ('c', 'Number of images = 360°/90° − 1 = 3.'),
 45: ('c', 'A prism deviates, disperses and can reflect light, but it does not bring light to a focus like a lens.'),
 46: ('d', 'Order of wavelength: radio > infrared > ultraviolet > X-rays.'),
 47: ('a', 'Light arrives almost instantly, so d = 360 × 3 = 1080 m.'),
 48: ('c', 'A lightning conductor is a pointed copper strip running down the building to an earth plate; being insulated is not a requirement.'),
 49: ('a', 'I = V/R = 6/4 = 1.5 A.'),
 50: ('d', '1 volt = 1 joule per coulomb, so the e.m.f. is the energy supplied per unit charge.'),
 51: ('b', 'MnO₂ oxidises the hydrogen formed at the carbon rod, preventing polarisation.'),
 52: ('c', 'Mass number = protons + neutrons = 3 + 4 = 7.'),
 53: ('d', 'Gamma rays are emitted when unstable (excited) nuclei lose energy.'),
 54: ('c', 'In diffraction the waves spread out but frequency, wavelength and speed are unchanged.'),
 55: ('a', 'A green pigment reflects only green and absorbs red, so under red light nothing is reflected and the leaf looks black.'),
 56: ('b', 'Car wing (rear-view) mirrors are convex, for a wide field of view.'),
 57: ('b', 'A charging current flows at first and falls to zero as the capacitor charges to the battery voltage.'),
 58: ('d', "Light's very small wavelength means diffraction around everyday objects is negligible, so it appears to travel in straight lines."),
 59: ('c', 'More electrons are excited across the band gap at higher temperature, so conductivity increases.'),
 60: ('d', 'Thin insulated laminations break up eddy-current paths, reducing eddy-current loss.'),
 61: ('b', 'RAM is volatile: it loses its contents without power.'),
 62: ('d', 'Laptops use VLSI microprocessors - fourth-generation technology.'),
 63: ('c', 'USB = Universal Serial Bus.'),
 64: ('b', 'A firewall filters network traffic according to rules.'),
 65: ('a', 'An IPv4 address has four numbers separated by dots, e.g. 192.168.1.1.'),
 66: ('b', 'ENIAC = Electronic Numerical Integrator And Computer (1945).'),
 68: ('b', 'DRAM stores bits as charge on tiny capacitors that leak, so it must be refreshed constantly.'),
 69: ('a', 'PNG (Portable Network Graphics) is an image format.'),
 70: ('b', 'A WAN covers a large area, linking LANs over leased lines.'),
}

NEW_MCQ = [
    ('Which of the following is a noble gas?', ['Nitrogen', 'Chlorine', 'Argon', 'Hydrogen'], 'c', 'Argon (Group 18) has a full outer shell; the others are reactive non-metals.'),
    ('The valency of carbon in most of its compounds is', ['1', '2', '3', '4'], 'd', 'Carbon has 4 valence electrons and forms 4 covalent bonds (e.g. CH₄).'),
    ('Which of the following file extensions is used for a Microsoft Excel workbook?', ['.docx', '.xlsx', '.pptx', '.txt'], 'b', '.xlsx is Excel; .docx Word, .pptx PowerPoint, .txt plain text.'),
]

SAQ = [
 dict(marks=3, stem="Differentiate the following function with respect to x: (4x³ − 5x² + 1)⁴ (3 marks)",
      kp=[("Chain rule: d/dx[u⁴] = 4u³ · du/dx with u = 4x³ − 5x² + 1", 1), ("du/dx = 12x² − 10x", 1), ("dy/dx = 4(4x³ − 5x² + 1)³(12x² − 10x) = 8x(6x − 5)(4x³ − 5x² + 1)³", 1)],
      model="Let u = 4x³ − 5x² + 1, so y = u⁴.\ndy/dx = 4u³ × du/dx = 4(4x³ − 5x² + 1)³ × (12x² − 10x) = 8x(6x − 5)(4x³ − 5x² + 1)³."),
 dict(marks=3, stem="Solve the integral ∫ sin³x cos x dx. (3 marks)",
      kp=[("Substitute u = sin x, du = cos x dx", 1), ("∫u³ du = u⁴/4", 1), ("= sin⁴x/4 + C", 1)],
      model="Let u = sin x, so du = cos x dx. Then ∫sin³x cos x dx = ∫u³ du = u⁴/4 + C = (sin⁴x)/4 + C."),
 dict(marks=3, stem="From Paro, Druk Air flies 200 km in the direction S 52°12' E towards Bangkok via Kolkata. How far south and how far east of the starting point is the plane? (3 marks)",
      kp=[("S 52°12' E means 52.2° from south towards east", 1), ("South component = 200 cos 52.2° ≈ 122.6 km", 1), ("East component = 200 sin 52.2° ≈ 158.0 km", 1)],
      model="The bearing S 52°12' E is measured from the south direction, 52.2° towards the east.\nDistance south = 200 cos 52.2° = 200 × 0.613 ≈ 122.6 km.\nDistance east = 200 sin 52.2° = 200 × 0.790 ≈ 158.0 km.\n(Check: √(122.6² + 158.0²) ≈ 200 km.)"),
 dict(marks=3, stem="Monochromatic light of wavelength λ = 589 × 10⁻⁹ m is incident from air on a water surface. What are the wavelength, frequency and speed of (i) the reflected light and (ii) the refracted light? The refractive index of water is 1.33. (3 marks)",
      kp=[("Frequency is unchanged in both: f = c/λ = 3 × 10⁸/589 × 10⁻⁹ ≈ 5.09 × 10¹⁴ Hz", 1), ("(i) Reflected light stays in air: λ = 589 nm, v = 3 × 10⁸ m/s", 1),
          ("(ii) Refracted light in water: v = c/n = 2.26 × 10⁸ m/s, λ = 589/1.33 ≈ 443 nm", 1)],
      model="Frequency depends only on the source, so it is the same for reflected and refracted light: f = c/λ = 3 × 10⁸/(589 × 10⁻⁹) ≈ 5.09 × 10¹⁴ Hz.\n(i) Reflected light (still in air): speed 3 × 10⁸ m/s, wavelength 589 nm, frequency 5.09 × 10¹⁴ Hz.\n(ii) Refracted light (in water): speed v = c/n = 3 × 10⁸/1.33 ≈ 2.26 × 10⁸ m/s; wavelength λ = 589/1.33 ≈ 443 nm; frequency 5.09 × 10¹⁴ Hz."),
 dict(marks=3, stem="A metal piece and a stone of the same size and shape are dropped from the same height near the earth's surface. Which one will reach the ground earlier, and why? (3 marks)",
      kp=[("Without air resistance both reach together: acceleration g is the same for all masses", 1), ("In air, both meet the same air resistance (same size and shape) at the same speed", 1),
          ("The metal piece is heavier (denser), so the resistance slows it relatively less: it reaches slightly earlier", 1)],
      model="If air resistance is negligible (or in a vacuum), both fall with the same acceleration g = 9.8 m/s², independent of mass, and reach the ground together (Galileo).\nIn real air, both objects have the same size and shape, so they experience the same air resistance at a given speed. The metal piece is denser and heavier, so this resistance is a smaller fraction of its weight; its net acceleration (g − F/m) is larger. The metal piece therefore reaches the ground slightly earlier, though over a short height the difference is very small."),
 dict(marks=3, stem="A brass ball is dropped from the top of a tower 60 m high. With what velocity will it strike the ground, and how long will it take to reach the ground? (g = 9.8 m/s²) (3 marks)",
      kp=[("v² = u² + 2gh with u = 0", 1), ("v = √(2 × 9.8 × 60) ≈ 34.3 m/s", 1), ("t = v/g = 34.3/9.8 ≈ 3.5 s (or h = ½gt²)", 1)],
      model="u = 0, h = 60 m, g = 9.8 m/s².\nv² = 2gh = 2 × 9.8 × 60 = 1176, so v ≈ 34.3 m/s (downwards).\nt = v/g = 34.3/9.8 ≈ 3.5 s (check: h = ½gt² = ½ × 9.8 × 3.5² ≈ 60 m)."),
 dict(marks=3, stem="What are some of the important applications of electrolysis? Explain briefly. (3 marks)",
      kp=[("Extraction of reactive metals: aluminium from alumina in molten cryolite; sodium, magnesium from molten chlorides", 1),
          ("Electroplating (coating with Ni, Cr, Ag, Au to prevent corrosion/decorate) and electrorefining (purifying copper)", 1),
          ("Manufacture of chemicals: NaOH, chlorine and hydrogen from brine; also anodising aluminium, electrotyping", 1)],
      model="1. Extraction of reactive metals: metals such as aluminium (Hall-Héroult process, alumina in molten cryolite), sodium and magnesium cannot be obtained by carbon reduction and are extracted by electrolysis of their molten compounds.\n2. Electroplating: a thin layer of a metal (chromium, nickel, silver, gold) is deposited on an object made the cathode, to prevent corrosion or improve appearance.\n3. Electrorefining: impure copper is made the anode and pure copper deposits on the cathode, giving 99.9% pure copper for wiring.\n4. Manufacture of chemicals: electrolysis of brine (chlor-alkali process) produces sodium hydroxide, chlorine and hydrogen.\nOther uses: anodising aluminium, producing hydrogen and oxygen from water."),
 dict(marks=3, stem="State three differences between nuclear fission and nuclear fusion. (3 marks)",
      kp=[("Fission splits a heavy nucleus (U-235, Pu-239) into two lighter nuclei; fusion joins light nuclei (hydrogen isotopes) into a heavier one (helium)", 1),
          ("Fission is started by neutron bombardment as a chain reaction at ordinary temperatures; fusion needs extremely high temperature and pressure (millions of degrees, as in the sun)", 1),
          ("Fission products are radioactive waste; fusion releases more energy per unit mass and gives little radioactive waste; fission is used in power reactors/atom bombs, fusion powers stars and hydrogen bombs", 1)],
      model="1. Process: fission is the splitting of a heavy nucleus (e.g. U-235) into two medium-sized nuclei plus neutrons; fusion is the joining of light nuclei (e.g. deuterium and tritium) to form a heavier nucleus (helium).\n2. Conditions: fission is triggered by slow neutrons and proceeds as a chain reaction at normal temperatures; fusion needs extremely high temperatures (about 10⁷ K) and pressures to overcome the repulsion between nuclei.\n3. Energy and products: fusion releases more energy per kilogram of fuel and produces little long-lived radioactive waste; fission produces highly radioactive waste.\nUses: fission is used in nuclear power stations and atom bombs; fusion powers the sun and stars and the hydrogen bomb (controlled fusion power is still experimental)."),
 dict(marks=3, stem="Explain what superconductivity is. Give examples of substances which possess superconductivity. (3 marks)",
      kp=[("Superconductivity: the electrical resistance of certain materials falls to exactly zero below a critical temperature Tc", 1), ("The superconductor also expels magnetic fields (Meissner effect), so a current can flow without loss", 1),
          ("Examples: mercury (Tc ≈ 4.2 K), lead, niobium, niobium-titanium alloy; high-Tc ceramics such as YBa₂Cu₃O₇ (≈ 92 K)", 1)],
      model="Superconductivity is the property of certain materials whose electrical resistance drops suddenly to zero when they are cooled below a critical temperature (Tc). A current set up in a superconducting loop flows indefinitely without energy loss, and the material expels magnetic fields from its interior (the Meissner effect), which allows magnetic levitation.\nExamples: mercury (the first, discovered by Kamerlingh Onnes in 1911, Tc ≈ 4.2 K), lead (7.2 K), niobium and niobium-titanium alloy (used in MRI magnets), and ceramic 'high-temperature' superconductors such as yttrium barium copper oxide YBa₂Cu₃O₇ (Tc ≈ 92 K, above the boiling point of liquid nitrogen)."),
 dict(marks=3, stem="What is a hyperlink? How is it created? Give an example. (3 marks)",
      kp=[("A hyperlink is clickable text or an image in a document/web page that takes the user to another page, file or place when clicked", 1),
          ("Created in HTML with the anchor tag <a href=\"URL\">text</a> (or Insert → Link in Word/web editors)", 1), ("Example: <a href=\"https://www.rcsc.gov.bt\">RCSC website</a>", 1)],
      model="A hyperlink is a word, phrase or image in a web page or document that, when clicked, takes the user to another web page, a file, an e-mail address or another part of the same document. Links are usually shown underlined or in a different colour.\nIt is created in HTML with the anchor tag <a> and its href attribute: <a href=\"address\">link text</a>. In programs such as MS Word or a web editor you select the text and choose Insert → Link (Ctrl + K) and type the address.\nExample: <a href=\"https://www.rcsc.gov.bt\">Royal Civil Service Commission</a> shows the words 'Royal Civil Service Commission', which open the RCSC website when clicked."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
