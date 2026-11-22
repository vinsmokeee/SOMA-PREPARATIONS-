"""ME Technical Paper III (Subject Specialisation Paper), Civil Engineering, BCSE 2024 - real paper (PDF sent by the founder).
Standard pattern, same as the 2025 Civil Engineering paper (the latest). MCQ 25 replaced (factor of safety against overturning
differs between IS 456 and textbook practice). Case II uses the frame figure (public/papers/me/tech3-civil-2024-frame.png);
the paper's IS 456 extract pages are reference material, not questions.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1"
GROUP_TAG = "civil2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "civil-engineering"
ADDS_TO_PAPER = True  # 2025 is the latest Civil Engineering paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Civil Engineering"
FRAME = "/papers/me/tech3-civil-2024-frame.png"

MCQ = r"""[
{
"n": 1,
"stem": "What is the meaning of soundness of cement?",
"opts": [
"Ability to flow when mixed",
"Ability to make ringing noise when struck",
"Ability to form strong and sound structure",
"Ability to retain volume after setting"
]
},
{
"n": 2,
"stem": "In frame structure, what transfers the load to columns?",
"opts": [
"Foundation",
"Beams",
"Slabs",
"Roofs"
]
},
{
"n": 3,
"stem": "In a truss structure, _________ bear tension.",
"opts": [
"Joints",
"Base",
"Bottom chords",
"Top chords"
]
},
{
"n": 4,
"stem": "Hydrographic survey deal with the mapping of",
"opts": [
"large water bodies",
"mountainous region",
"canal system",
"movement of clouds"
]
},
{
"n": 5,
"stem": "Which of the below is constructed above doors, windows?",
"opts": [
"Joist",
"Purlin",
"Lintel",
"Arch"
]
},
{
"n": 6,
"stem": "___________wall is used to resist lateral forces like severe wind.",
"opts": [
"Knee",
"Cavity",
"Infill",
"Shear"
]
},
{
"n": 7,
"stem": "Contours can be found in a __________ map.",
"opts": [
"Political",
"Topographical",
"Physical",
"Thematic"
]
},
{
"n": 8,
"stem": "The horizontal angle between the true meridian and magnetic meridian at a place is called",
"opts": [
"azimuth",
"declination",
"local attraction",
"magnetic bearing"
]
},
{
"n": 9,
"stem": "A critical path has",
"opts": [
"zero slack",
"minimum slack",
"maximum slack",
"infinite slack"
]
},
{
"n": 10,
"stem": "The term ___________ in construction is applied to the finishing of mortar joints in masonry (stone or brick). In exposed masonry, these are considered to be the weakest part.",
"opts": [
"painting",
"deteriorating",
"pointing",
"finishing"
]
},
{
"n": 11,
"stem": "M25 grade of concrete approximates",
"opts": [
"1 : 1: 2 mix",
"1: 1.5 : 3 mix",
"1: 3: 6 mix",
"none of the above"
]
},
{
"n": 12,
"stem": "Poisson's ratio is the ratio of:",
"opts": [
"Axial stress to axial strain",
"Lateral strain to axial strain",
"Shear stress to shear strain",
"Compressive stress to tensile stress"
]
},
{
"n": 13,
"stem": "What is the unit of discharge in hydrology?",
"opts": [
"Liters per minute (L/min)",
"Gallons per hour (gal/hr)",
"Cubic feet per minute (ft3/min)",
"Cubic meters per second (m3/s)"
]
},
{
"n": 14,
"stem": "Which of the following load is to be considered on liquid retaining structure?",
"opts": [
"dynamic load",
"earth pressure",
"hydrostatic load",
"wave and current load"
]
},
{
"n": 15,
"stem": "The last reading taken from the instrument is called:",
"opts": [
"End sight",
"Free sight",
"Fore sight",
"Back sight"
]
},
{
"n": 16,
"stem": "In PERT analysis, event means",
"opts": [
"start or finish of a task",
"time taken for a task",
"end of an activity",
"work involved in the project"
]
},
{
"n": 17,
"stem": "The point in the cross section of beam through which if load acts there will not be any twisting of the beam but there will be only bending is known as",
"opts": [
"centre of gravity",
"centroid",
"shear centre",
"all the above"
]
},
{
"n": 18,
"stem": "The main object of a preliminary survey",
"opts": [
"to collect the necessary physical information and details of topography, drainage and soil properties.",
"to estimate cost of alternative alignment.",
"to finalise the best alignment.",
"all the above."
]
},
{
"n": 19,
"stem": "Benchmark is established by",
"opts": [
"hypsometry",
"barometric leveling",
"spirit leveling",
"trigonometric leveling"
]
},
{
"n": 20,
"stem": "What is the initial setting time of cement?",
"opts": [
"1 hour",
"30 minutes",
"15 minutes",
"30 hours"
]
},
{
"n": 21,
"stem": "A channel section has",
"opts": [
"two webs one flange",
"one web two flanges",
"one web one flange",
"two webs and two flanges"
]
},
{
"n": 22,
"stem": "The centre of gravity of the volume of liquid displaced is called",
"opts": [
"centre of pressure",
"centre of buoyancy",
"metacentre",
"None of these"
]
},
{
"n": 23,
"stem": "The property of a material to resist scratching and abrasion is known as:",
"opts": [
"Toughness",
"Hardness",
"Elasticity",
"Plasticity"
]
},
{
"n": 24,
"stem": "Loss of prestress due to friction occurs",
"opts": [
"only in pre-tensioned beams",
"only in post-tensioned beams",
"in both pre-tensioned and post-tensioned beams",
"none of the above"
]
},
{
"n": 25,
"stem": "For the design of retaining walls, the minimum factor of safety against overturning is taken as",
"opts": [
"2",
"1.4",
"1.5",
"3.0"
]
},
{
"n": 26,
"stem": "Efflorescence in cement is caused due to an excess of",
"opts": [
"Alumina",
"Iron oxide",
"Silica",
"Alkalies"
]
},
{
"n": 27,
"stem": "If the modulus of elasticity is zero, the material is said to be",
"opts": [
"rigid",
"elastic",
"flexible",
"plastic"
]
},
{
"n": 28,
"stem": "What is the primary purpose of reinforcement in RCC?",
"opts": [
"To resist tensile forces",
"To increase concrete strength",
"To enhance thermal properties",
"To reduce construction cost"
]
},
{
"n": 29,
"stem": "What is the purpose of 'weep holes' in retaining walls?",
"opts": [
"Aesthetic appeal",
"Structural reinforcement",
"Drainage of accumulated water",
"Ventilation"
]
},
{
"n": 30,
"stem": "It is more often preferable that a beam section be designed as :",
"opts": [
"reinforced concrete section",
"balanced section",
"underreinforced section",
"overreinforced section"
]
}
]"""

KEY = {
    1: ("d", "Soundness is the ability of cement to keep its volume after setting (no undue expansion from free lime or magnesia), tested by Le Chatelier."),
    2: ("b", "In a framed structure slabs carry load to beams, and beams transfer it to the columns."),
    3: ("c", "In a simply supported truss under gravity loads the bottom chord is in tension and the top chord in compression."),
    4: ("a", "Hydrographic survey maps water bodies - rivers, lakes, reservoirs and seas (depths, banks, currents)."),
    5: ("c", "A lintel spans openings such as doors and windows to carry the wall above."),
    6: ("d", "Shear walls resist lateral forces from wind and earthquakes."),
    7: ("b", "Contours are shown on topographical maps."),
    8: ("b", "Magnetic declination is the horizontal angle between the true and magnetic meridians."),
    9: ("a", "Activities on the critical path have zero slack (float)."),
    10: ("c", "Pointing is finishing the mortar joints of exposed masonry."),
    11: ("a", "Nominal mix for M25 is about 1:1:2 (M20 1:1.5:3, M15 1:2:4)."),
    12: ("b", "Poisson's ratio = lateral strain / axial (longitudinal) strain."),
    13: ("d", "The SI unit of discharge is cubic metres per second (cumec)."),
    14: ("c", "Liquid retaining structures are designed for hydrostatic pressure of the liquid."),
    15: ("c", "The last staff reading before shifting the level is the fore sight."),
    16: ("a", "In PERT an event is a point in time - the start or completion of an activity."),
    17: ("c", "A load through the shear centre causes bending without twisting."),
    18: ("d", "A preliminary survey collects topography, drainage and soil data, compares the costs of alternative alignments and helps finalise the best one."),
    19: ("c", "Benchmarks are established by precise spirit levelling."),
    20: ("b", "Initial setting time of ordinary Portland cement is at least 30 minutes."),
    21: ("b", "A channel section has one web and two flanges."),
    22: ("b", "The centre of gravity of the displaced liquid is the centre of buoyancy."),
    23: ("b", "Hardness is resistance to scratching, abrasion and indentation."),
    24: ("b", "Friction loss occurs between tendons and ducts, which exist only in post-tensioned members."),
    26: ("d", "Efflorescence is caused by excess soluble alkalis (salts) leaching to the surface."),
    27: ("d", "With zero modulus of elasticity the material offers no elastic resistance and deforms permanently: it behaves as perfectly plastic."),
    28: ("a", "Concrete is weak in tension, so steel reinforcement resists the tensile forces."),
    29: ("c", "Weep holes drain water from behind the wall and relieve hydrostatic pressure."),
    30: ("c", "An under-reinforced section fails gradually by steel yielding, giving warning before collapse."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "In the design of a retaining wall, sliding is checked by comparing", ["The resisting friction force with the horizontal earth pressure", "The bending moment with the shear force", "The weight of the wall with the weight of the soil", "The bearing capacity with the settlement"], "a",
            "Factor of safety against sliding = resisting force (μ x total vertical load, plus passive pressure) / horizontal thrust; it is usually required to be at least about 1.4-1.5."),
]

SA = [
    ("What is the density of steel and why is density important for steel? Compute the weight of an MS plate of 250 mm x 250 mm x 10 mm.",
     [("Density of steel ≈ 7850 kg/m³ (78.5 kN/m³)", 1),
      ("Importance: self-weight/ dead load in design, estimating quantity and cost (by weight), transport and handling, unit weight of bars (d²/162)", 2),
      ("Volume = 0.25 x 0.25 x 0.01 = 0.000625 m³; weight = 0.000625 x 7850 = 4.91 kg (≈ 0.048 kN)", 2)],
     "The density of mild steel is about 7850 kg/m³ (unit weight 78.5 kN/m³). Density is important because it is used to calculate the self-weight (dead load) of steel members in structural design, to estimate quantities and costs (steel is bought and paid for by weight), to plan transport, lifting and handling, and to find the weight of bars per metre (d²/162 kg/m with d in mm, derived from 7850 kg/m³). Weight of the plate: volume = 0.250 m x 0.250 m x 0.010 m = 0.000625 m³; weight = 0.000625 x 7850 = 4.91 kg (about 0.048 kN)."),
    ("What is an RCC beam? Determine the self-weight of an RCC beam with a span of 8 m and a cross section of 400 mm x 800 mm.",
     [("RCC beam: horizontal flexural member of concrete with steel reinforcement (tension bars, stirrups) carrying loads from slabs/ walls to columns by bending and shear", 2),
      ("Unit weight of RCC 25 kN/m³; self-weight per metre = 0.4 x 0.8 x 25 = 8 kN/m; total = 8 x 8 = 64 kN (volume 2.56 m³)", 3)],
     "A reinforced cement concrete (RCC) beam is a horizontal structural member made of concrete with embedded steel reinforcement - main bars on the tension face (and sometimes compression face) and stirrups for shear - which carries loads from slabs, walls or other beams to columns or supports by bending and shear; concrete takes compression and steel takes tension. Self-weight: unit weight of RCC = 25 kN/m³ (IS 875 Part 1). Weight per metre = 0.40 x 0.80 x 25 = 8.0 kN/m. Total self-weight over 8 m = 8.0 x 8 = 64 kN (volume 0.4 x 0.8 x 8 = 2.56 m³)."),
    ("A simply supported beam of span 6 m carries a uniformly distributed load of 1.5 kN/m over the entire span and a point load of 2 kN at 2 m from the right support. Determine the reactions at the left and right supports and the bending moment at 2 m from the right support.",
     [("Total UDL = 9 kN at 3 m; point load 4 m from left; ΣM about A: RB x 6 = 9 x 3 + 2 x 4 → RB = 5.83 kN", 2),
      ("RA = 11 - 5.83 = 5.17 kN", 1),
      ("M at 2 m from right = RB x 2 - 1.5 x 2 x 1 = 11.67 - 3 = 8.67 kNm (sagging)", 2)],
     "Total UDL = 1.5 x 6 = 9 kN acting at 3 m from the left support A; the 2 kN point load is 2 m from the right support B, i.e. 4 m from A. Taking moments about A: RB x 6 = 9 x 3 + 2 x 4 = 27 + 8 = 35, so RB = 5.83 kN. Vertical equilibrium: RA + RB = 9 + 2 = 11, so RA = 11 - 5.83 = 5.17 kN. Bending moment at the point 2 m from B (under the point load), taking the right-hand part: M = RB x 2 - (1.5 x 2) x 1 = 11.67 - 3.00 = 8.67 kNm (sagging). Check from the left: M = 5.17 x 4 - 1.5 x 4 x 2 = 20.67 - 12 = 8.67 kNm."),
    ("What is the basic difference between the slump test and the compression test? Briefly explain the procedure of the slump test for concrete.",
     [("Slump test: workability/ consistency of fresh concrete on site; compression test: compressive strength of hardened concrete cubes/ cylinders (7/28 days) in a testing machine", 2),
      ("Procedure: clean moist mould (300 mm high, 200/100 mm dia) on flat base; fill in 4 layers each tamped 25 times with 16 mm rod; strike off; lift mould vertically; measure drop of top = slump (mm); note type (true, shear, collapse)", 3)],
     "Difference: the slump test measures the workability (consistency) of fresh, plastic concrete at site immediately after mixing; the compression test measures the compressive strength of hardened concrete by crushing cured cube (150 mm) or cylinder specimens in a compression testing machine, usually at 7 and 28 days. Slump test procedure (IS 1199): (1) clean the slump cone (frustum 300 mm high, 200 mm bottom and 100 mm top diameter) and place it on a smooth, level, non-absorbent base, held firmly; (2) fill it in four equal layers, tamping each layer 25 times with a 16 mm diameter, 600 mm long rounded tamping rod; (3) strike off the top level; (4) lift the cone vertically and slowly (within about 5 seconds); (5) measure the drop in height of the concrete from the top of the cone - this is the slump in mm; (6) note the shape: true slump, shear slump (repeat test) or collapse. Typical slump for RCC beams and slabs is about 25-100 mm."),
]
for i, (s, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=5, topic=T, stem=s, key_points=kp, model=mod, issues=[]))

C1 = """Case I: Seismic evaluation of an existing building
You are a civil engineer assigned to evaluate an existing building that does not fulfil the current seismic requirements and may suffer extensive damage or even collapse if shaken by severe ground motion."""
C2 = """Case II: Analysis and design of a portal frame
Analyse the frame shown in the figure with its loading and support conditions. The left column AB is 6 m high (pin support at A; a 10 kN horizontal load acts at G, 4 m above A). The beam BCDE is 5 m long: a 20 kN point load acts at C (1 m from B) and a UDL of 2 kN/m acts over DE (3 m, from 2 m to 5 m from B). The right column EF is 6 m high with a roller support at F."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("civil2024", 1, T, C1, items=[
    it("1. Elaborate and explain the methodology you will use to assess and evaluate the existing building.", 30,
       [("Preliminary: collect drawings, design basis, codes used, age, occupancy/ importance, site seismic zone (Bhutan zone V/ IV per NBC/ IS 1893), soil", 4),
        ("Visual/ rapid visual screening (RVS) and condition survey: structural system, irregularities (soft storey, short column, torsion, re-entrant corners), cracks, corrosion, deterioration, non-structural hazards", 6),
        ("Material and structural testing: NDT (rebound hammer, UPV), cores, rebar scanning/ cover, carbonation, half-cell; as-built dimensions and reinforcement detailing; soil/ foundation", 6),
        ("Detailed analysis: computer model (e.g. ETABS/ SAP), seismic loads per IS 1893:2016 (equivalent static/ response spectrum), load combinations, check capacity vs demand (DCR), drift, ductile detailing per IS 13920; or pushover/ performance-based (IS 15988, ASCE 41)", 8),
        ("Results and decision: performance level, deficiencies list, retrofit options (jacketing, shear walls, bracing, base isolation, FRP), cost-benefit, report and recommendations (retrofit/ restrict use/ demolish)", 6)],
       """1. Preliminary data: collect architectural and structural drawings, design calculations, codes used, construction year, alterations, occupancy and importance (e.g. school or hospital), and site conditions: Bhutan lies in a high seismic zone (zone V/IV of IS 1893, as used with the Bhutan Building Rules), and soil type and slope affect the demand.
2. Rapid visual screening and condition survey: inspect the structural system and identify vulnerability features - soft or weak storey (open ground floor), short columns, torsional and plan irregularities, re-entrant corners, heavy water tanks, pounding with adjacent buildings, poor foundations on slopes - and deterioration such as cracks, spalling, rebar corrosion, dampness, plus non-structural hazards (parapets, infill walls). Score the building (e.g. FEMA 154/ NDMA RVS) to decide whether a detailed evaluation is needed.
3. Material and as-built investigation: measure member sizes; locate reinforcement with a rebar scanner/ cover meter and occasional chipping; test concrete strength by rebound hammer and ultrasonic pulse velocity calibrated with cores; check carbonation depth and corrosion (half-cell potential); test reinforcement samples; check the foundation and soil (bore holes, SPT) if needed.
4. Detailed seismic evaluation: build a 3D analytical model (ETABS/SAP2000/STAAD) with the actual properties; compute seismic loads per IS 1893 (Part 1): 2016 by equivalent static and response spectrum methods with the correct zone, importance and response reduction factors; check member capacities against demands (demand-capacity ratios), storey drift, strong-column weak-beam, joint shear and ductile detailing to IS 13920; for important buildings use non-linear static (pushover) analysis to find the performance level (immediate occupancy, life safety, collapse prevention) per IS 15988/ ASCE 41.
5. Results and decision: list deficiencies; propose retrofit options - column and beam jacketing (RC, steel, FRP), adding shear walls or steel bracing, strengthening foundations, removing irregularities, base isolation - with costs; compare retrofit with demolition and reconstruction; and prepare a report with recommendations, priorities and any interim restrictions on use."""),
    it("2. What is non-destructive testing (NDT)? Explain the types of NDT for buildings and building materials.", 15,
       [("NDT: testing a structure/ material without damaging it, to assess strength, uniformity, defects and durability in place", 3),
        ("Rebound (Schmidt) hammer: surface hardness → estimated strength (IS 516 Part 5)", 2), ("Ultrasonic pulse velocity: quality, cracks, voids, homogeneity", 2),
        ("Cover meter/ rebar locator and GPR: reinforcement position, cover, size", 2), ("Half-cell potential, resistivity, carbonation test: corrosion risk", 2),
        ("Others: core (semi-destructive), radiography, infrared thermography, load test, penetration resistance, pull-out; steel: dye penetrant, magnetic particle, ultrasonic for welds", 4)],
       """Non-destructive testing (NDT) means examining a structure or material in place without damaging it or impairing its future use, to estimate strength, uniformity and quality and to detect cracks, voids, corrosion and other defects. Main types: (1) Rebound (Schmidt) hammer - the rebound of a spring-loaded mass gives surface hardness, correlated with compressive strength (IS 516 Part 5/ IS 13311 Part 2); quick but affected by surface condition. (2) Ultrasonic pulse velocity - the speed of an ultrasonic pulse through concrete indicates its quality, density, cracks and voids (IS 13311 Part 1). (3) Combined (SONREB) method of rebound and UPV for better strength estimates. (4) Cover meter/ rebar locator and ground-penetrating radar - locate reinforcement and measure cover and bar size. (5) Half-cell potential and resistivity tests - assess the probability of reinforcement corrosion; carbonation depth by phenolphthalein. (6) Infrared thermography - detects moisture, delamination and heat loss. (7) Radiography (X-ray/ gamma) - shows internal voids and reinforcement. (8) Penetration resistance (Windsor probe) and pull-out tests - near-surface strength. Partially destructive tests such as cores and load tests are used to calibrate NDT. For steel and welds: visual, dye penetrant, magnetic particle, ultrasonic and radiographic testing."""),
    it("3. What do you mean by a flood and its effects? Briefly explain how to reduce the impact of floods.", 5,
       [("Flood: overflow of water onto normally dry land (heavy rain, river overflow, GLOF, flash floods, dam failure)", 1),
        ("Effects: loss of life, damage to buildings, roads, bridges, farmland, erosion, landslides, disease, economic loss", 2),
        ("Reduction: hazard mapping and zoning (no building in flood plains), early warning (GLOF systems), embankments/ river training, drainage, afforestation, flood-resistant design, preparedness and insurance", 2)],
       """A flood is the overflow of water onto land that is normally dry, caused by heavy or prolonged rain, river overflow, flash floods, glacial lake outburst floods (GLOFs) in Bhutan, or dam failure. Effects: loss of life and livestock; damage to houses, roads, bridges, hydropower and water supply; erosion and landslides; loss of crops and farmland; water-borne diseases; and economic losses and displacement. Reducing impact: flood hazard mapping and land-use zoning so buildings avoid flood plains and river banks; early warning systems (e.g. GLOF warning on the Punatsangchhu and Chamkharchhu) and evacuation plans; structural measures such as embankments, gabion walls, check dams, river training and proper drainage and culverts; catchment protection by afforestation; flood-resistant building design (raised plinths); and community preparedness, insurance and emergency response."""),
])
Q += case("civil2024", 2, T, C2, image=FRAME, items=[
    it("1. Compute the support reactions at A and F. Draw the free body diagram, axial force diagram, shear force diagram and bending moment diagram for the frame.", 20,
       [("Reactions: ΣFx → Ax = 10 kN (acting left); ΣMA: 5Fy = 20 x 1 + 6 x 3.5 + 10 x 4 = 81 → Fy = 16.2 kN; Ay = 26 - 16.2 = 9.8 kN", 6),
        ("Axial: AB compression 9.8 kN; EF compression 16.2 kN; beam BE axial ≈ 0 (horizontal forces balance in AB)", 3),
        ("Shear: AB 10 kN from A to G, 0 from G to B; beam B-C +9.8, C-D -10.2, D-E -10.2 to -16.2; EF 0", 4),
        ("BM: AB 0 at A, 40 kNm at G, constant 40 to B; beam 40 at B, 49.8 at C (max), 39.6 at D, 0 at E (sagging, tension inside); EF 0 (roller, no horizontal force)", 5),
        ("Correct FBD and neat diagrams with values and signs", 2)],
       """Reactions (A pin: Ax, Ay; F roller: Fy only). ΣFx = 0: Ax + 10 = 0, so Ax = 10 kN acting to the left. ΣMA = 0 (anticlockwise positive): Fy x 5 - 20 x 1 - (2 x 3) x 3.5 - 10 x 4 = 0, so 5Fy = 20 + 21 + 40 = 81 and Fy = 16.2 kN upward. ΣFy = 0: Ay = 20 + 6 - 16.2 = 9.8 kN upward.
Free body diagram: the frame with Ax = 10 kN (left) and Ay = 9.8 kN (up) at A, Fy = 16.2 kN (up) at F, and the applied loads (10 kN at G, 20 kN at C, 2 kN/m on DE).
Axial forces: column AB - 9.8 kN compression; column EF - 16.2 kN compression; beam BE - the horizontal forces on AB balance (10 kN at A and 10 kN at G), so the axial force in the beam is zero.
Shear forces: column AB - 10 kN from A to G, zero from G to B; beam - +9.8 kN from B to C, -10.2 kN from C to D, varying linearly from -10.2 kN at D to -16.2 kN at E (so shear does not change sign within DE); column EF - zero (no horizontal force at the roller).
Bending moments: column AB - zero at A, increasing linearly to 10 x 4 = 40 kNm at G, constant 40 kNm from G to B; beam - 40 kNm at B, 40 + 9.8 x 1 = 49.8 kNm at C (maximum), 49.8 - 10.2 x 1 = 39.6 kNm at D, parabolic to zero at E (check from the right: at C, 16.2 x 4 - 6 x 2.5 = 49.8 kNm); the beam moments are sagging (tension on the inside/bottom) and the corner B carries 40 kNm; column EF - zero throughout. The diagrams are drawn on the frame outline with these values."""),
    it("2. Calculate the quantity of cement, sand and aggregate in members EF and BE. Take concrete grade M20, column EF 500 mm x 500 mm and beam BE 300 mm x 500 mm.", 10,
       [("Wet volumes: EF = 0.5 x 0.5 x 6 = 1.5 m³; BE = 0.3 x 0.5 x 5 = 0.75 m³ (total 2.25 m³); M20 nominal 1:1.5:3 (sum 5.5); dry volume factor 1.54", 3),
        ("EF: dry 2.31 m³ → cement 0.42 m³ = 605 kg ≈ 12 bags; sand 0.63 m³; aggregate 1.26 m³", 3.5),
        ("BE: dry 1.155 m³ → cement 0.21 m³ = 302 kg ≈ 6 bags; sand 0.315 m³; aggregate 0.63 m³ (state assumptions, e.g. joint counted once)", 3.5)],
       """Assumptions: nominal mix for M20 = 1 : 1.5 : 3 (sum of ratio = 5.5); dry volume = 1.54 x wet volume; density of cement 1440 kg/m³ (one bag = 50 kg); member lengths from the figure (EF 6 m, BE 5 m), the joint at E counted once in the column.
Column EF: wet volume = 0.5 x 0.5 x 6 = 1.50 m³; dry volume = 1.50 x 1.54 = 2.31 m³. Cement = 2.31 x 1/5.5 = 0.42 m³ = 0.42 x 1440 = 605 kg ≈ 12.1 bags; sand = 2.31 x 1.5/5.5 = 0.63 m³; coarse aggregate = 2.31 x 3/5.5 = 1.26 m³.
Beam BE: wet volume = 0.3 x 0.5 x 5 = 0.75 m³; dry volume = 0.75 x 1.54 = 1.155 m³. Cement = 1.155/5.5 = 0.21 m³ = 302 kg ≈ 6.1 bags; sand = 0.315 m³; coarse aggregate = 0.63 m³.
Total for both members: cement ≈ 907 kg (about 18.2 bags), sand ≈ 0.945 m³, aggregate ≈ 1.89 m³ (plus wastage of about 2-5%)."""),
    it("3. Design a rectangular reinforced concrete beam supported on 300 mm walls with a clear span of 6000 mm. Live load 12 kN/m, M20 concrete, Fe415 steel, clear cover 30 mm, beam width 300 mm.", 20,
       [("Trial depth: D = 500 mm, d ≈ 460 mm; effective span = least of clear span + d (6.46 m) and c/c of supports (6.3 m) → 6.3 m", 3),
        ("Loads: self-weight 0.3 x 0.5 x 25 = 3.75 kN/m + LL 12 = 15.75; wu = 1.5 x 15.75 = 23.63 kN/m; Mu = wu L²/8 = 117.2 kNm; Vu = 74.4 kN", 4),
        ("Depth check: Mu,lim = 0.138 fck b d² = 175.2 kNm > Mu → singly reinforced (d required ≈ 376 mm)", 3),
        ("Steel: Mu = 0.87 fy Ast d (1 - fy Ast/(fck b d)) → Ast ≈ 803 mm²; provide 3 nos 20 mm (942 mm²); check min/max steel; 2 nos 12 mm hanger bars", 4),
        ("Shear: τv = 0.54 N/mm²; τc (pt 0.68%) ≈ 0.54 → minimum stirrups: 2-legged 8 mm @ 300 mm c/c (closer near supports)", 3),
        ("Deflection: allowable L/d = 20 x MF (~1.2) ≈ 24 > 6300/460 = 13.7 OK; detailing sketch", 3)],
       """1. Dimensions: b = 300 mm. Trial overall depth D = 500 mm (about span/12); with 30 mm clear cover to the main bars and 20 mm bars, effective depth d = 500 - 30 - 10 = 460 mm. Effective span (IS 456 cl. 22.2): least of (clear span + d) = 6.0 + 0.46 = 6.46 m and centre-to-centre of supports = 6.0 + 0.3 = 6.3 m, so Leff = 6.3 m.
2. Loads: self-weight = 0.30 x 0.50 x 25 = 3.75 kN/m; live load = 12 kN/m; total w = 15.75 kN/m; factored load wu = 1.5 x 15.75 = 23.63 kN/m.
3. Design forces: Mu = wu L²/8 = 23.63 x 6.3²/8 = 117.2 kNm; Vu = wu L/2 = 74.4 kN.
4. Depth check: for Fe415, Mu,lim = 0.138 fck b d² = 0.138 x 20 x 300 x 460² = 175.2 kNm > 117.2 kNm, so a singly reinforced (under-reinforced) section is adequate; required d = √(117.2 x 10⁶ / (0.138 x 20 x 300)) = 376 mm < 460 mm.
5. Tension steel: Mu = 0.87 fy Ast d (1 - fy Ast/(b d fck)): 117.2 x 10⁶ = 0.87 x 415 x Ast x 460 (1 - 415 Ast/(300 x 460 x 20)), giving Ast = 803 mm². Provide 3 bars of 20 mm (Ast = 942 mm², pt = 0.68%). Minimum Ast = 0.85 b d/fy = 283 mm² and maximum 0.04 b D = 6000 mm² - OK. Provide 2 bars of 12 mm as hanger bars at the top.
6. Shear: τv = Vu/(b d) = 74.4 x 10³/(300 x 460) = 0.54 N/mm² (less at d from the support face); τc for M20 with pt = 0.68% ≈ 0.54 N/mm² (IS 456 Table 19); τc,max = 2.8 N/mm². Since τv ≈ τc, provide at least minimum shear reinforcement: 2-legged 8 mm stirrups (Asv = 100.5 mm²), sv = 0.87 fy Asv/(0.4 b) = 302 mm, limited to 0.75d = 345 mm and 300 mm, so 8 mm 2-legged stirrups at 300 mm c/c (closer, e.g. 200 mm, near the supports).
7. Deflection: basic span/d = 20 for simply supported beams; with fs = 0.58 x 415 x 803/942 ≈ 205 N/mm² and pt = 0.68%, the modification factor ≈ 1.2, so allowable L/d ≈ 24; actual 6300/460 = 13.7 - OK.
8. Detailing: 3-20 mm bottom bars full length with anchorage into the supports, 2-12 mm top hanger bars, 8 mm stirrups as above, 30 mm clear cover."""),
])
PATTERN = STANDARD
