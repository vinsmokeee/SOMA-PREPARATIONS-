"""ME Technical Paper III (Subject Specialisation Paper), Civil Engineering, BCSE 2025 - real paper (PDF sent by the founder).
Pattern: Section A Part I 30 MCQ, Part II 4 short answers x 5; Section B one of two case studies (50). 150 min + 15 min reading.
Left out: MCQ 14 (curve type: more than one option defensible), 22 (needs the shear force figure), 30 (earthwork method:
more than one option defensible); three new MCQs keep Part I at 30. Design answers follow IS 456 limit state method;
numbers are Claude's worked solutions - an engineer should check them.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Civil Engineering): BCSE 2025, batch 1"
GROUP_TAG = "civil2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "civil-engineering"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Civil Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Civil Engineering"

MCQ = r"""[
{
"n": 1,
"stem": "In a suspension bridge, the main cables are subjected to",
"opts": [
"Bending",
"Shear",
"Compression",
"Tension"
]
},
{
"n": 2,
"stem": "In reinforce concrete, the primary purpose of stirrups is to",
"opts": [
"Resist axial tension",
"Prevent shrinkage cracks",
"Hold the bars in place",
"Resist shear"
]
},
{
"n": 3,
"stem": "The bearing capacity of a footing is maximum when",
"opts": [
"Water table is at surface",
"Water table is at footing base",
"Water table is below the footing",
"Soil is fully saturated"
]
},
{
"n": 4,
"stem": "The efficiency of a sedimentation tank increases with",
"opts": [
"Increase in depth",
"Increase in detention time",
"Decrease in surface area",
"Increase in inflow rate"
]
},
{
"n": 5,
"stem": "Float in CPM indicates",
"opts": [
"Leeway in activity start or finish",
"Unused budget",
"Delay in materials",
"Time saved"
]
},
{
"n": 6,
"stem": "A cantilever beam carries maximum bending moment at",
"opts": [
"Free end",
"Midpoint",
"Fixed support",
"Anywhere along span"
]
},
{
"n": 7,
"stem": "In RCC beams, the main reinforcement is provided to resist",
"opts": [
"Torsion",
"Shear",
"Bending tension",
"Axial compression"
]
},
{
"n": 8,
"stem": "Liquid limit of soil is determined using",
"opts": [
"Proctor test",
"Casagrande apparatus",
"Core cutter",
"Sand replacement method"
]
},
{
"n": 9,
"stem": "The shape of STOP signboard is",
"opts": [
"Circular",
"Triangular",
"Rectangular",
"Octagonal"
]
},
{
"n": 10,
"stem": "The unit of measurement for brickwork in cement mortar is",
"opts": [
"Square meter",
"Cubic meter",
"Running meter",
"Kilogram"
]
},
{
"n": 11,
"stem": "The rate analysis is done primarily to determine",
"opts": [
"Estimated cost per unit work",
"Quantity of materials",
"Labour charges",
"Market price"
]
},
{
"n": 12,
"stem": "For the same cross-sectional area which has the highest moment of inertia?",
"opts": [
"Square",
"Circle",
"Hollow circle",
"I-section"
]
},
{
"n": 13,
"stem": "Which one of the following tests is a non-destructive test for concrete?",
"opts": [
"Slump test",
"Rebound hammer test",
"Compression test",
"Flexural test"
]
},
{
"n": 14,
"stem": "What type of curve is used to connect two roads with different alignments?",
"opts": [
"Simple curve",
"Compound curve",
"Transition curve",
"Reverse curve"
]
},
{
"n": 15,
"stem": "Plastic hinge is formed when",
"opts": [
"The moment reaches plastic moment",
"The section cracks",
"The structure yields",
"Elastic limit is reached"
]
},
{
"n": 16,
"stem": "The quantity of cement required for 1m3 of 1:2:4 concrete (by volume, wet mix) is approximately",
"opts": [
"200 Kg",
"250 Kg",
"300 Kg",
"400 Kg"
]
},
{
"n": 17,
"stem": "Prestressing in concrete is done to",
"opts": [
"Increase deflection",
"Reduce tensile strength",
"To increase the weight of structures",
"Introduce compressive stresses"
]
},
{
"n": 18,
"stem": "Back sight is taken on",
"opts": [
"Staff at turning point",
"Bench mark",
"Foresight station",
"Next point"
]
},
{
"n": 19,
"stem": "Which is the correct sequence of treatment in a typical water treatment plant?",
"opts": [
"Screening-----Coagulation----Sedimentation----Filtration",
"Filtration----Coagulation-----Sedimentation-----Screening",
"Coagulation-----Filtration-----Sedimentation-----Disinfection",
"Sedimentation-----Screening-----Filtration------Disinfection"
]
},
{
"n": 20,
"stem": "For maximum deflection in a simply supported beam carrying a UDL, the point of contraflexure occurs at",
"opts": [
"Centre",
"Quarter span",
"At the support",
"There is no point of contraflexure"
]
},
{
"n": 21,
"stem": "A cantilever beam with a point load at free end deflects by what happens to deflection if span L is doubled?",
"opts": [
"Become 8x",
"Becomes 4x",
"Tripled",
"Doubled"
]
},
{
"n": 22,
"stem": "The shear force diagram of a beam is shown in the given figure. The absolute bending moment in the beam is",
"opts": [
"2P x a",
"5P x a",
"4P x a",
"7P x a"
]
},
{
"n": 23,
"stem": "Unit hydrograph represents runoff from",
"opts": [
"1mm rainfall",
"1cm rainfall",
"Peak flood only",
"Total rainfall"
]
},
{
"n": 24,
"stem": "Weepholes in retaining wall help reduce",
"opts": [
"Hydrostatic pressure",
"Flank pressure",
"Bearing pressure",
"Overturning moment"
]
},
{
"n": 25,
"stem": "Curtailment of reinforcement in RCC beams is done when",
"opts": [
"Shear is maximum",
"Bending moment reduces",
"Depth is constant",
"Load is variable"
]
},
{
"n": 26,
"stem": "In passive earth pressure, the soil must",
"opts": [
"Be completely dry",
"Move away from wall",
"Move towards wall",
"Have zero cohesion"
]
},
{
"n": 27,
"stem": "For a fluid flowing in pipe, the continuity equation is based on",
"opts": [
"Newton’s second law",
"Conservation of mass",
"Conservation of energy",
"Pascal’s law"
]
},
{
"n": 28,
"stem": "Soils having more than 50% passing through 75-microm sieve is classified as",
"opts": [
"Coarse soil",
"Fine soil",
"Organic soil",
"Gravel"
]
},
{
"n": 29,
"stem": "The admixture used to increase setting time of concrete is",
"opts": [
"Retarder",
"Accelerator",
"Plasticizer",
"Superplasticizer"
]
},
{
"n": 30,
"stem": "Which of the following methods is used to measure earthwork volume calculation in irregular terrain?",
"opts": [
"Mid-section method",
"End area method",
"Cross section method",
"Prismoidal formula"
]
}
]"""

KEY = {
    1: ("d", "Suspension bridge cables carry tension."), 2: ("d", "Stirrups resist shear (and hold bars)."), 3: ("c", "A low water table keeps full effective unit weight, so bearing capacity is highest."),
    4: ("b", "Longer detention time lets more particles settle."), 5: ("a", "Float is the leeway in an activity's start or finish."),
    6: ("c", "A cantilever's maximum moment is at the fixed support."), 7: ("c", "Main bars resist bending tension."), 8: ("b", "Casagrande apparatus finds the liquid limit."),
    9: ("d", "STOP signs are octagonal."), 10: ("b", "Brickwork is measured in cubic metres."), 11: ("a", "Rate analysis gives cost per unit of work."),
    12: ("d", "An I-section puts most area far from the axis."), 13: ("b", "Rebound hammer is non-destructive."), 15: ("a", "A plastic hinge forms when the plastic moment is reached."),
    16: ("c", "About 6.4 bags ≈ 320 kg for 1:2:4."), 17: ("d", "Prestressing introduces compression to offset tension."), 18: ("b", "The first back sight is taken on a bench mark."),
    19: ("a", "Screening, coagulation, sedimentation, filtration (then disinfection)."), 20: ("d", "A simply supported beam under UDL has no contraflexure."),
    21: ("a", "δ = PL³/3EI: doubling L gives 8 times the deflection."), 23: ("b", "A unit hydrograph is for 1 cm of effective rainfall."),
    24: ("a", "Weep holes drain water and cut hydrostatic pressure."), 25: ("b", "Bars are curtailed where bending moment reduces."),
    26: ("c", "Passive pressure develops when the wall moves toward the soil (soil compressed)."), 27: ("b", "Continuity = conservation of mass."),
    28: ("b", "More than 50% finer than 75 µm: fine-grained soil."), 29: ("a", "Retarders delay setting."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "The slump test of fresh concrete measures its", ["strength", "workability", "durability", "setting time"], "b", "Slump indicates workability/consistency."),
    new_mcq(2, T, "The modulus of elasticity of steel reinforcement is about", ["20 GPa", "70 GPa", "200 GPa", "2,000 GPa"], "c", "Es ≈ 200 GPa (2 × 10⁵ N/mm²)."),
    new_mcq(3, T, "As per IS 456:2000, the minimum grade of concrete for reinforced concrete in 'mild' exposure is", ["M15", "M20", "M25", "M30"], "b", "Table 5: RCC minimum M20 for mild exposure."),
    saq(1, T, "Describe the purpose of a bar bending schedule (BBS). What information does it contain? Provide a sample of a BBS for column reinforcement in a building drawing. (5 marks)",
        [("Purpose: quantities of steel, cutting and bending at site, estimation/billing, less waste", 2), ("Contents: member, bar mark, diameter, number, shape and dimensions, cutting length, total length, weight", 1.5), ("Sample BBS for a column (main bars and ties) with lengths and weights", 1.5)],
        """Purpose: a BBS lists every reinforcement bar of a member so steel can be ordered, cut and bent accurately; it helps estimating, billing and checking, and reduces wastage.
Contents: member name and location, bar mark, bar diameter, number of bars, shape with dimensions, cutting length (with bend and lap deductions/additions), total length, unit weight (d²/162 kg/m) and total weight.
Sample (column C1, 300 × 300, height 3.0 m + 0.6 m lap): Main bars - 4 nos 16 mm, cutting length 3.6 m, total 14.4 m × 1.58 kg/m = 22.8 kg. Ties - 8 mm @ 150 c/c, number = 3000/150 + 1 = 21, cutting length = 4 × 240 + 2 × 10d hooks − bend deductions ≈ 1.08 m, total 22.7 m × 0.395 kg/m ≈ 9.0 kg."""),
    saq(2, T, "Design a cantilever rectangular beam of span 3 m carrying a characteristic UDL of 20 kN/m. Assume that sufficient safety against overturning is there and reinforcement anchorages are available. Use M20 grade concrete and HYSD reinforcement of grade Fe 415. Draw the SFD and BMD and find the area of reinforcement required to resist the moment. (5 marks)",
        [("Factored load 30 kN/m; Vu = 90 kN; Mu = 135 kNm (hogging at support)", 1), ("SFD (linear 0 → 90 kN) and BMD (parabolic 0 → 135 kNm) sketched", 1), ("d required = √(Mu/0.138fck b) ≈ 404 mm (b = 300); adopt d = 450, D = 500", 1.5), ("Ast ≈ 980 mm² at the top; provide 4 bars of 18 mm (1,018 mm²)", 1.5)],
        """Factored load wu = 1.5 × 20 = 30 kN/m. Vu = 30 × 3 = 90 kN at the support; Mu = 30 × 3²/2 = 135 kNm (hogging, tension at top).
SFD: straight line from 0 at the free end to 90 kN at the fixed end. BMD: parabola from 0 at the free end to 135 kNm at the fixed end.
Take b = 300 mm. Mu,lim = 0.138 fck b d² → d = √(135 × 10⁶ / (0.138 × 20 × 300)) ≈ 404 mm. Adopt d = 450 mm, D = 500 mm (under-reinforced).
Ast from Mu = 0.87 fy Ast d (1 − Ast fy/(b d fck)): 135 × 10⁶ = 162,473 Ast − 24.97 Ast² → Ast ≈ 978 mm². Provide 4 nos 18 mm bars (1,018 mm²) at the TOP, with nominal bottom bars and stirrups for Vu = 90 kN."""),
    saq(3, T, "What is the role of bracing in steel structures? Briefly explain its purpose and mention two commonly used types of bracing. (5 marks)",
        [("Role: resist lateral loads (wind, earthquake), transfer them to foundations, provide stability and stiffness", 2), ("Purpose: reduce sway/drift, prevent buckling by reducing effective length, stability during erection", 1), ("Two types: X (cross), K, V/inverted V (chevron), diagonal, eccentric/knee bracing", 2)],
        """Bracing members form triangulated systems that carry lateral loads (wind, earthquake) to the foundations and give stability and stiffness to steel frames. They limit sway and drift, reduce the effective length of columns and compression members (preventing buckling), and keep the structure stable during erection. Common types: X (cross) bracing, single diagonal bracing, K-bracing, V or inverted-V (chevron) bracing, and eccentric/knee bracing for ductility in earthquakes."""),
    saq(4, T, "What is meant by batching of concrete? Explain the different types of batching and discuss their significance in concrete production. Which method is generally recommended, and why? (5 marks)",
        [("Batching: measuring the quantities of cement, aggregates, water and admixtures for a mix", 1), ("Volume batching - simple, for small/nominal mixes, less accurate (bulking)", 1.5), ("Weigh batching - accurate, consistent quality, used for design mixes/RMC", 1.5), ("Recommended: weigh batching because it is accurate and gives uniform strength", 1)],
        """Batching is measuring the correct proportions of cement, sand, coarse aggregate, water and admixtures for each mix of concrete.
Volume batching: materials measured by gauge boxes; simple and cheap for small works and nominal mixes, but inaccurate because of bulking of moist sand and loose filling.
Weigh batching: materials weighed (manually or in automatic batching plants); accurate and consistent, needed for design mixes, ready-mix plants and large projects.
Weigh batching is recommended (IS 456) because it gives accurate proportions, uniform strength and durability and less material waste; cement should always be measured by weight (whole bags)."""),
]
C1 = """CASE I
You have been appointed as a Designer in the Design Division for Infrastructure Development. Your first assignment is to design an office building for the Regional Office for Infrastructure Development (RoID) at Mongar."""
FOOT = """Design an isolated footing to support a building column (Column C1) subjected to an axial load, in accordance with IS 456:2000, with these parameters: column size 300 × 300 mm; axial service load on column 1,000 kN; dead load of footing 10% of column load; safe bearing capacity of soil 150 kN/m²; concrete M25; steel Fe500; unit weight of concrete 25 kN/m³; depth of foundation below ground level 1,500 mm."""
C2 = """CASE II
As part of your first assignment you are asked to visit a site for a road widening project along the Mongar-Lhuentse Secondary National Highway."""
Q += case("civil2025", 1, T, C1, items=[
    (FOOT + "\n(i) Determine the required area of footing and check the net upward pressure.", 10,
     [("Total load = 1,000 + 10% = 1,100 kN; area = 1,100/150 = 7.33 m²", 4), ("Adopt 2.75 m × 2.75 m = 7.56 m²", 3), ("Net upward pressure: factored 1,500/7.56 ≈ 198 kN/m² (service 132 kN/m² < 150 OK)", 3)],
     """Load on soil = 1,000 + 0.10 × 1,000 = 1,100 kN. Area required = 1,100/150 = 7.33 m². Adopt a square footing 2.75 m × 2.75 m = 7.56 m².
Net upward pressure (service) = 1,000/7.56 = 132 kN/m² < 150 kN/m² - OK. Factored net upward pressure for design qu = 1.5 × 1,000/7.56 ≈ 198 kN/m²."""),
    (FOOT + "\n(ii) Determine the area of steel required and prepare a sketch of the reinforcement detailing.", 15,
     [("Cantilever from column face = (2.75 − 0.30)/2 = 1.225 m; Mu = 198 × 2.75 × 1.225²/2 ≈ 409 kNm", 4), ("Depth: d for bending ≈ 212 mm; adopt D = 600, d = 540 mm (shear governs)", 3), ("Ast ≈ 1,785 mm² but minimum 0.12% bD = 1,980 mm²; provide 10 nos 16 mm (2,010 mm²) each way ≈ 290 mm c/c", 5), ("Sketch: plan and section, bars both ways, cover 50 mm, column starter bars", 3)],
     """Projection from column face = (2.75 − 0.30)/2 = 1.225 m. Mu = 198 × 2.75 × 1.225²/2 ≈ 409 kNm.
d for bending = √(Mu / (0.133 fck b)) = √(409 × 10⁶ / (0.133 × 25 × 2,750)) ≈ 212 mm; one-way and punching shear govern, so adopt D = 600 mm, d = 540 mm (50 mm cover + bar).
Ast: 409 × 10⁶ = 0.87 × 500 × Ast × 540 × (1 − 500 Ast/(2,750 × 540 × 25)) → Ast ≈ 1,785 mm². Minimum steel = 0.12% × 2,750 × 600 = 1,980 mm² governs.
Provide 10 nos 16 mm bars (2,010 mm²) in each direction at about 290 mm c/c (≤ 300 mm).
Sketch: plan of the 2.75 m square footing with a 16 mm mesh both ways; section showing 600 mm depth, 50 mm bottom cover, column bars with L-bends resting on the mesh, PCC levelling course."""),
    (FOOT + "\n(iii) Check for one-way shear and design bearing pressure.", 10,
     [("Critical section at d from face: 1.225 − 0.54 = 0.685 m; Vu = 198 × 2.75 × 0.685 ≈ 374 kN", 3), ("τv = 374 × 10³/(2,750 × 540) ≈ 0.25 N/mm² < τc ≈ 0.29 N/mm² (pt ≈ 0.135%) - safe", 3), ("Bearing: 0.45 fck √(A1/A2) ≤ 0.9 fck = 22.5 N/mm²; actual 1,500 × 10³/90,000 = 16.7 N/mm² - safe", 4)],
     """One-way shear at d from the column face: x = 1.225 − 0.54 = 0.685 m. Vu = 198 × 2.75 × 0.685 ≈ 374 kN. τv = 374 × 10³/(2,750 × 540) ≈ 0.25 N/mm². pt = 100 × 2,010/(2,750 × 540) ≈ 0.135%, τc (M25) ≈ 0.29 N/mm² > τv - safe.
Bearing at column base: permissible = 0.45 fck √(A1/A2) with √(A1/A2) limited to 2 → 0.45 × 25 × 2 = 22.5 N/mm². Actual = 1.5 × 1,000 × 10³/(300 × 300) = 16.7 N/mm² < 22.5 - safe (no dowels needed beyond the minimum starter bars)."""),
    ("Question 2: What key features will you incorporate in the structural design of a building to make it earthquake-resistant in Bhutan, Seismic Zone V? Mention at least three structural provisions in accordance with IS 1893 and IS 4326.", 5,
     [("Three or more provisions (regular plan and elevation, strong column-weak beam ductile detailing IS 13920, seismic bands/lintel bands IS 4326, shear walls, avoid soft storey, closely spaced ties/135° hooks, proper foundation, design for zone factor 0.36)", 5)],
     """Design for Zone V (Z = 0.36) with response spectrum/seismic coefficient method (IS 1893); regular, symmetrical plan and elevation and no soft or weak storeys; ductile detailing (IS 13920) - strong column-weak beam, closely spaced stirrups with 135° hooks near joints, confined columns; shear walls or bracing for lateral stiffness; for masonry, lintel, roof and plinth bands and vertical bars at corners (IS 4326); good foundations tied with plinth beams; light roofs and separation joints between blocks."""),
    ("""Question 3: For a project with the following activities (times in days: optimistic a, pessimistic b, most likely m), construct a PERT network. Find the critical path and the variance for each event.
(1-2) a 1, b 5, m 1.5; (2-3) 1, 3, 2; (2-4) 1, 5, 3; (3-5) 3, 5, 4; (4-5) 2, 4, 3; (4-6) 3, 7, 5; (5-7) 4, 6, 5; (6-7) 6, 8, 7; (7-8) 2, 6, 4; (7-9) 5, 8, 6; (8-10) 1, 3, 2; (9-10) 3, 7, 5.""", 10,
     [("te = (a + 4m + b)/6 and σ² = ((b − a)/6)² for every activity", 3), ("Network and earliest event times (E10 = 28.17 days)", 3), ("Critical path 1-2-4-6-7-9-10, 28.17 days", 2), ("Event variances along the critical path (E10 ≈ 2.14, σ ≈ 1.46)", 2)],
     """te and σ²: 1-2: 2.0, 0.444; 2-3: 2.0, 0.111; 2-4: 3.0, 0.444; 3-5: 4.0, 0.111; 4-5: 3.0, 0.111; 4-6: 5.0, 0.444; 5-7: 5.0, 0.111; 6-7: 7.0, 0.111; 7-8: 4.0, 0.444; 7-9: 6.17, 0.25; 8-10: 2.0, 0.111; 9-10: 5.0, 0.444.
Earliest event times: E1 0, E2 2, E3 4, E4 5, E5 8, E6 10, E7 17, E8 21, E9 23.17, E10 28.17.
Critical path: 1-2-4-6-7-9-10, project duration 28.17 days.
Event variances (along the longest path to each event): E2 0.444, E3 0.555, E4 0.888, E5 0.999, E6 1.332, E7 1.443, E8 1.887, E9 1.693, E10 2.137 (σ ≈ 1.46 days)."""),
])
WALL = """Design a retaining wall to retain the cut slope with these details (assume wall geometry as per the design): height of wall H = 3.0 m; density of backfill γ = 18 kN/m³; angle of internal friction φ = 30°; cohesion c = 0 (granular soil); angle of wall friction δ = 20°; bearing capacity of soil 200 kN/m²; masonry density 22 kN/m³; coefficient of friction µ = 0.6."""
Q += case("civil2025", 2, T, C2, items=[
    (WALL + "\n(i) What type of retaining wall will you propose for this design? List any other four types of retaining wall with rough sketches.", 10,
     [("Proposal: gravity (stone masonry) wall - suitable for 3 m height, local stone, hill roads", 4), ("Four other types: cantilever RCC, counterfort, buttress, gabion, crib, reinforced earth/sheet pile, with sketches", 6)],
     """Propose a gravity stone-masonry retaining wall: economical for a height of 3 m, uses local stone and labour, common on Bhutan's hill roads, and needs no reinforcement.
Other types (with rough sketches): cantilever RCC wall (L or inverted T); counterfort wall (counterforts on the backfill side, for 6-8 m+); buttress wall (supports on the front); gabion wall (wire baskets of stone - flexible and draining); crib wall; reinforced-earth wall; sheet-pile wall."""),
    (WALL + "\n(ii) Design the proposed wall and check against overturning, sliding and bearing pressure.", 10,
     [("Ka = 1/3 (Rankine); Pa = ½ Ka γ H² = 27 kN/m at H/3 = 1 m", 3), ("Section: top 0.6 m, base 1.8 m, front battered; W = 79.2 kN/m, resisting moment ≈ 91 kNm", 2), ("Overturning FOS ≈ 3.4 > 2; sliding FOS ≈ 1.76 > 1.5", 3), ("e ≈ 0.09 m < B/6; pmax ≈ 57 kN/m² < 200 - safe", 2)],
     """Earth pressure (Rankine, ignoring δ conservatively): Ka = (1 − sin 30°)/(1 + sin 30°) = 1/3. Pa = ½ × 1/3 × 18 × 3² = 27 kN/m, acting at H/3 = 1.0 m above base.
Trial section: top width 0.6 m, base width 1.8 m, vertical back, battered front. Weights: rectangle 0.6 × 3 × 22 = 39.6 kN at 1.5 m from toe; triangle ½ × 1.2 × 3 × 22 = 39.6 kN at 0.8 m from toe. W = 79.2 kN; resisting moment = 39.6 × 1.5 + 39.6 × 0.8 = 91.1 kNm.
Overturning: FOS = 91.1/27 = 3.4 > 2.0 - safe. Sliding: FOS = 0.6 × 79.2/27 = 1.76 > 1.5 - safe.
Bearing: x̄ = (91.1 − 27)/79.2 = 0.81 m; e = 0.9 − 0.81 = 0.09 m < B/6 = 0.3 m (no tension). p = (79.2/1.8)(1 ± 6 × 0.09/1.8) = 57 and 31 kN/m², both < 200 kN/m² - safe."""),
    (WALL + "\n(iii) Sketch a rough drawing, with dimensions, of the proposed design to be implemented at site.", 10,
     [("Cross-section with 3.0 m height, 0.6 m top, 1.8 m base, battered face, foundation depth", 5), ("Weep holes (e.g. 75-100 mm @ 1-1.5 m c/c), filter/backfill drainage, coping, ground levels", 5)],
     """Cross-section: 3.0 m high stone-masonry wall, 0.6 m wide at top, 1.8 m at base, vertical back and battered front (1.2 m in 3 m), founded at least 0.6-1.0 m below ground on firm strata with a PCC/levelling course; coping at top; weep holes 75-100 mm diameter at about 1-1.5 m c/c with a graded filter/ granular backfill behind; drain at the toe; road level and cut slope shown."""),
    ("""Question 2: The ordinates of a 6-hour unit hydrograph (m³/s) at 3-hour intervals from 0 to 54 h are: 0, 200, 500, 1000, 1600, 2400, 3500, 4200, 5200, 4400, 3100, 2300, 1500, 1000, 650, 400, 250, 150, 0. Derive the 12-hour unit hydrograph of the same unit volume.""", 10,
     [("Method: 12-h UH = average of the 6-h UH and the same UH lagged 6 h (since 12 = 2 × 6)", 4), ("Correct tabulation of lagged ordinates and averaging", 4), ("Resulting ordinates (0, 100, 250, 600, 1050, 1700, 2550, 3300, 4350, 4300, 4150, 3350, 2300, 1650, 1075, 700, 450, 275, 125, 75, 0), peak ≈ 4,350 at 24 h", 2)],
     """Because 12 h is twice 6 h, add the 6-h UH to the same UH lagged by 6 h and divide by 2.
t (h): 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60
12-h UH (m³/s): 0, 100, 250, 600, 1050, 1700, 2550, 3300, 4350, 4300, 4150, 3350, 2300, 1650, 1075, 700, 450, 275, 125, 75, 0.
(Lagged values used: 0 until 6 h, then 0, 200, 500 … shifted by 6 h.) The base length grows by 6 h and the peak falls to about 4,350 m³/s at 24 h. (The S-curve method gives the same result.)"""),
    ("Question 3: Differentiate between flexible and rigid pavements based on structural behaviour and layers. Draw a cross-section of both pavement types.", 10,
     [("Structural behaviour: flexible - load spread grain to grain through layers, depends on subgrade; rigid - slab action, flexural strength, load over a wide area", 4), ("Layers: flexible - surface course, binder, base, sub-base, subgrade; rigid - concrete slab, base/sub-base (DLC), subgrade, joints and dowels", 3), ("Labelled cross-sections of both", 3)],
     """Flexible pavement: layered bituminous system; load is transmitted grain-to-grain and spread downward through layers, so performance depends on subgrade strength; low flexural strength; design by CBR (IRC:37); shorter life, easier repair. Layers: bituminous surface/wearing course, binder course, granular base (WMM/WBM), granular sub-base, compacted subgrade.
Rigid pavement: cement concrete slab carries load by slab (beam) action and flexural strength, distributing it over a wide area; less dependent on subgrade; needs joints, dowel and tie bars; design by IRC:58; long life, high initial cost. Layers: PQC slab, dry lean concrete base, granular sub-base/drainage layer, subgrade.
Cross-sections: draw both with the layers and typical thicknesses labelled."""),
])
PATTERN = STANDARD
