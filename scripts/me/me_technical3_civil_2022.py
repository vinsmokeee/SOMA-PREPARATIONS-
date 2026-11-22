"""ME Technical Paper III (Subject Specialisation Paper), Civil Engineering, BCSE 2022 - real paper (PDF sent by the founder).
Standard pattern, same as the 2025 Civil Engineering paper (the latest), so it is ADDED to the paper's pattern.
Not loaded: MCQ 19 (asked again as 2023 MCQ 10 - 2022 is recorded on that question,
supabase/data/me_technical3_repeats_civil_2019_2023.sql). Replaced (answer depends on the textbook): MCQ 14 ('elastic
load' vs 'limiting load'), 17 (AC or GI sheets as the 'most common' roof cover), 18 (minimum external plaster 15 or
20 mm), 24 (length of masonry wall needing an expansion joint). Five new MCQs keep Part I at 30.
Part II Q2 assumes A is a hinge and C a roller (as drawn); Q4 takes the origin at the bottom-left corner of the whole
section (web centred under the flange, as drawn). Case II frame: both column feet fixed (hatched), EI constant.
Pictures: public/papers/me/tech3-civil-2022-{truss1,truss2,tsection,beam,frame}.png.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1"
GROUP_TAG = "civil2022"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "civil-engineering"
ADDS_TO_PAPER = True  # 2025 is the latest Civil Engineering paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Civil Engineering"
PATTERN = STANDARD
IMG = "/papers/me/tech3-civil-2022-{}.png"

MCQ = r"""[
{
"n": 1,
"stem": "Zero hardness of water is achieved by",
"opts": [
"using excess alum dosage.",
"ion exchange method.",
"excess lime treatment.",
"using lime soda process."
]
},
{
"n": 2,
"stem": "For an area developed in haphazard way, the type of layout of water distribution system preferred is",
"opts": [
"radial system.",
"ring system.",
"grid iron system.",
"dead end system."
]
},
{
"n": 3,
"stem": "Which one of the following is NOT a groundwater?",
"opts": [
"From riverside radial collector wells.",
"From infiltration galleries.",
"Water from natural springs.",
"Rooftop water stored in underground tank."
]
},
{
"n": 4,
"stem": "Cross staff is an instrument used for",
"opts": [
"measuring bearings of the lines.",
"measuring approximate horizontal angles.",
"setting out right angles.",
"None of the above."
]
},
{
"n": 5,
"stem": "In surveying principle \"work from whole to part is recommended\" since",
"opts": [
"it localizes error.",
"it leads to errorless maps.",
"there is no chance of omitting any required measurement.",
"it is easy to use measurements for plotting."
]
},
{
"n": 6,
"stem": "For hilly region, the ideal method of contouring is",
"opts": [
"radial line method.",
"method of squares.",
"direct method.",
"cross section method."
]
},
{
"n": 7,
"stem": "To obtain good bonding in brick masonry",
"opts": [
"first class bricks are used.",
"vertical joints in alternate courses are kept in plumb line.",
"bats are used where necessary.",
"All of the above."
]
},
{
"n": 8,
"stem": "The best irrigation method that suits area scarcity of irrigation water is",
"opts": [
"drip irrigation.",
"furrow irrigation.",
"check flooding.",
"sprinkler irrigation."
]
},
{
"n": 9,
"stem": "Water logging is due to",
"opts": [
"inadequate drainage.",
"over irrigation.",
"impervious obstruction.",
"All of the above."
]
},
{
"n": 10,
"stem": "Cavity wall is generally provided for",
"opts": [
"heat insulation.",
"sound insulation.",
"prevention of dampness.",
"All of the above."
]
},
{
"n": 11,
"stem": "Hydraulic jump is used for",
"opts": [
"reducing the energy of flow.",
"reducing the velocity of flow.",
"reducing the flow rate.",
"increasing the flow rate."
]
},
{
"n": 12,
"stem": "The most economical section for a compression member is",
"opts": [
"hollow circular.",
"circular.",
"i-shaped.",
"rectangular."
]
},
{
"n": 13,
"stem": "Which one of the following is NOT a type of culvert?",
"opts": [
"Slab culvert",
"Through culvert",
"Pipe culvert",
"Box culvert"
]
},
{
"n": 14,
"stem": "The limiting load beyond which the material no longer behaves elastically is known as",
"opts": [
"breaking load.",
"elastic load.",
"limiting load.",
"load bearing capacity."
]
},
{
"n": 15,
"stem": "Maximum bearing capacity of soil is that of",
"opts": [
"fine sand.",
"sand clay mixture.",
"soft rock.",
"coarse sand."
]
},
{
"n": 16,
"stem": "Fire resistance is highest in case of",
"opts": [
"brick masonry.",
"timber structure.",
"stone masonry.",
"RCC works."
]
},
{
"n": 17,
"stem": "Very commonly used covering materials for steel trussed roof is",
"opts": [
"AC sheets.",
"GI sheets.",
"Tiles.",
"Shingles."
]
},
{
"n": 18,
"stem": "External walls should have a minimum thickness of plaster",
"opts": [
"12 mm",
"15 mm",
"20 mm",
"25 mm"
]
},
{
"n": 19,
"stem": "To improve earthquake resistance of a building, provide ____________.",
"opts": [
"roof band",
"lintel band",
"plinth band",
"All of the above"
]
},
{
"n": 20,
"stem": "A green building is the",
"opts": [
"structure that aims to reduce negative environmental effects.",
"building surrounded with garden.",
"one with green colour.",
"All of the above."
]
},
{
"n": 21,
"stem": "Suitable foundation for steel column is __________________.",
"opts": [
"grillage footing",
"strap footing",
"combined footing",
"mat foundation"
]
},
{
"n": 22,
"stem": "PVC pipes loosely fixed to walls",
"opts": [
"to allow longitudinal expansion.",
"to allow lateral expansion.",
"since tight fitting may damage them.",
"All of the above."
]
},
{
"n": 23,
"stem": "Development of fine wire cracks in plastered surface is known as",
"opts": [
"blistering.",
"cracking.",
"crazing.",
"flaking."
]
},
{
"n": 24,
"stem": "Expansion joints in masonry walls are provided if length exceeds",
"opts": [
"10 m",
"20 m",
"30 m",
"40 m"
]
},
{
"n": 25,
"stem": "Roof in which slab is directly supported by column is known as",
"opts": [
"flat slab.",
"two way slab.",
"grid floor.",
"beam and slab floor."
]
},
{
"n": 26,
"stem": "In cantilever retaining walls",
"opts": [
"toe slab bends up and heel slab bends down.",
"toe slab bends down and heel slab bends up.",
"both toe and heel slabs bend up.",
"both toe and heel slabs bend down."
]
},
{
"n": 27,
"stem": "IS 456-2000 recommends that the unsupported length of any column should not exceed ________times the least lateral dimension of the column.",
"opts": [
"20",
"40",
"60",
"70"
]
},
{
"n": 28,
"stem": "Advantage of pre-stressed concrete member over equivalent strength RCC member is",
"opts": [
"more durable.",
"deformation is much less.",
"dead weight is less.",
"All of the above."
]
},
{
"n": 29,
"stem": "For water retaining structures, minimum grade of concrete to be used is",
"opts": [
"M 15",
"M 25",
"M 30",
"M 35"
]
},
{
"n": 30,
"stem": "The ratio of voids to total volume of soil mass is called",
"opts": [
"water content ratio.",
"degree of saturation.",
"Porosity.",
"void ratio."
]
}
]"""

KEY = {
    1: ("b", "Ion exchange (zeolite/ resin) softening removes calcium and magnesium almost completely - zero hardness; lime-soda leaves 30-50 mg/L."),
    2: ("d", "Old towns that grew haphazardly, with irregular streets, are served by the dead-end (tree) system."),
    3: ("d", "Rooftop rainwater stored in a tank is surface (rain) water, not groundwater; wells, infiltration galleries and springs draw groundwater."),
    4: ("c", "A cross staff is used to set out right angles (offsets) in chain surveying."),
    5: ("a", "Working from the whole to the part localises errors and prevents them from accumulating."),
    6: ("a", "In hilly areas contours are located by the radial line method (radial lines from a central station, often with a tacheometer)."),
    7: ("d", "Good bond needs good bricks, vertical joints of alternate courses in plumb (no continuous vertical joints) and closers/ bats where needed to complete the bond."),
    8: ("a", "Drip irrigation delivers water to the root zone with 90 % or more efficiency - best where water is scarce."),
    9: ("d", "Water logging results from over-irrigation, seepage, inadequate drainage and impervious layers that stop water percolating."),
    10: ("d", "The air gap of a cavity wall gives heat and sound insulation and prevents dampness passing to the inner leaf."),
    11: ("a", "A hydraulic jump dissipates the excess kinetic energy of supercritical flow (e.g. below spillways)."),
    12: ("a", "A hollow circular (tube) section has the largest radius of gyration for its area in all directions, so it is the most economical in compression."),
    13: ("b", "Culverts are pipe, box, slab and arch culverts; 'through' describes a bridge type (deck/ through), not a culvert."),
    15: ("c", "Of these, soft rock has the highest safe bearing capacity (about 440 kN/m² or more vs 100-450 for soils)."),
    16: ("a", "Well-burnt brick masonry has the highest fire resistance; RCC spalls and loses strength, stone cracks, timber burns."),
    20: ("a", "A green building is designed, built and operated to reduce negative environmental impacts (energy, water, materials, waste)."),
    21: ("a", "Heavy steel columns on soils of low bearing capacity are founded on grillage footings (layers of steel joists in concrete)."),
    22: ("a", "PVC has a large coefficient of thermal expansion, so pipes are clipped loosely to allow longitudinal expansion."),
    23: ("c", "Crazing is the development of a network of fine hair cracks on a plastered surface."),
    25: ("a", "A flat slab is supported directly on columns (with or without drops and column heads), without beams."),
    26: ("a", "The toe is pushed up by soil pressure (bends up, tension at bottom); the heel is loaded down by the soil above (bends down, tension at top)."),
    27: ("c", "IS 456 cl 25.3.1: the unsupported length shall not exceed 60 times the least lateral dimension."),
    28: ("d", "Prestressed concrete is crack-free (more durable), deflects less and uses smaller, lighter sections than equivalent RCC."),
    29: ("c", "IS 3370 (Part 2): 2009 requires at least M30 for reinforced concrete water-retaining structures (M25 for PCC; older editions allowed M20)."),
    30: ("c", "Porosity n = volume of voids / total volume; void ratio e = Vv/Vs."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "As per IS 456:2000, a compression member is treated as a short column when the ratio of its effective length to its least lateral dimension is less than",
            ["8", "12", "15", "20"], "b", "IS 456 cl 25.1.2: short column if lex/D and ley/b are both less than 12; otherwise slender."),
    new_mcq(2, T, "As per IS 456:2000, the minimum area of longitudinal reinforcement in an RCC column is",
            ["0.4 percent of the gross area", "0.8 percent of the gross area", "1.0 percent of the gross area", "4.0 percent of the gross area"], "b",
            "IS 456 cl 26.5.3.1: longitudinal steel in a column is 0.8 % to 6 % of the gross area (4 % practical maximum)."),
    new_mcq(3, T, "In the standard Proctor (light compaction) test as per IS 2720 (Part 7), the rammer has a mass of",
            ["2.6 kg", "4.9 kg", "6.5 kg", "10 kg"], "a", "Light compaction: 2.6 kg rammer, 310 mm drop, 3 layers x 25 blows (heavy compaction: 4.9 kg, 450 mm, 5 layers)."),
    new_mcq(4, T, "The Le Chatelier apparatus is used to test cement for",
            ["fineness", "soundness", "setting time", "standard consistency"], "b", "Le Chatelier expansion (and the autoclave test) measure soundness; Vicat apparatus is for consistency and setting time."),
    new_mcq(5, T, "As per IS 456:2000, the final deflection of a beam or slab due to all loads, including temperature, creep and shrinkage, should not normally exceed",
            ["span/150", "span/250", "span/350", "span/500"], "b", "IS 456 cl 23.2 (a): final deflection ≤ span/250; deflection after partitions/ finishes ≤ span/350 or 20 mm."),
]

Q += [
    saq(1, T, "What are the reasons for drying of water sources in Bhutan? Any solutions you can think of to address this issue?",
        [("Reasons: climate change - erratic/ reduced rainfall, shorter monsoon, warmer temperature, glacier retreat", 1),
         ("Land use - deforestation, forest fires, road cutting and construction disturbing aquifers/ spring catchments, landslides, overgrazing", 1),
         ("Over-extraction and poor management - growing demand, unprotected sources, no catchment protection, poor maintenance", 0.5),
         ("Solutions: protect and restore spring catchments (plantation, fencing, no-construction zones, community/ Water Act protection), springshed management with hydrogeology mapping", 1),
         ("Recharge: contour trenches, recharge pits/ ponds, check dams; rainwater harvesting; water storage reservoirs", 1),
         ("Efficient use and governance: reduce leakage (NRW), metering and tariffs, inventory and monitoring of sources, awareness, integrated water resources management", 0.5)],
        """Reasons:
1. Climate change - more erratic and reduced winter/ pre-monsoon rainfall, longer dry spells, higher temperatures and evaporation, so springs and streams that depend on rainfall recharge dry up in the lean season.
2. Changes in land use in the catchments - deforestation and forest fires reduce infiltration; road construction, hydropower and building works cut across aquifers and divert or block spring flow; landslides bury sources; overgrazing compacts soil.
3. Increasing demand and over-abstraction - growing towns and irrigation draw more than the sources can sustain.
4. Poor source protection and management - sources not fenced or protected, catchments not identified, intakes and pipelines not maintained, no monitoring.
Solutions:
1. Springshed and catchment management - map sources and their recharge areas (hydrogeology), declare them protected under the Water Act, plant native trees, fence and restrict construction and grazing.
2. Artificial recharge - contour trenches, percolation pits and ponds, check dams and gully plugs in the recharge zone.
3. Rainwater harvesting at household and institutional level, and storage reservoirs to carry water through the dry season.
4. Efficient use - reduce leakage and non-revenue water, metering and fair tariffs, efficient irrigation (drip/ sprinkler), reuse of grey water.
5. Governance and awareness - an inventory and regular monitoring of sources, integrated water resources management with community participation (water user groups), environmental assessment of roads and projects near sources, public awareness."""),
    saq(2, T, "Given P1 = 200 N (vertical, downward at B) and P2 = 500 N (horizontal, at B), find the forces in each member of the truss shown in the figure (A hinged, C on rollers; B is 5 m above AC, 3 m from A and 4 m from C).",
        [("Reactions: ΣMA = 0: Cy x 7 = 200 x 3 + 500 x 5 → Cy = 442.9 N (up); Ay = 200 - 442.9 = -242.9 N (i.e. 242.9 N downward); Ax = 500 N (to the left)", 2),
         ("Joint C: FCB (5/√41) + 442.9 = 0 → FCB = -567.1 N (compression); FCA = 354.3 N (tension)", 1.5),
         ("Joint A: FAB (5/√34) = 242.9 → FAB = 283.2 N (tension); check ΣFx at A: -500 + 283.2 x 3/√34 + 354.3 = 0", 1.5)],
        """Geometry: A (0, 0), B (3, 5), C (7, 0) in metres. AB = √(3² + 5²) = 5.831 m; BC = √(4² + 5²) = 6.403 m.
Reactions (A hinge, C roller):
ΣMA = 0: Cy x 7 = P1 x 3 + P2 x 5 = 200 x 3 + 500 x 5 = 3100 → Cy = 442.86 N (upward).
ΣFy = 0: Ay = 200 - 442.86 = -242.86 N, i.e. 242.86 N acting downward at A.
ΣFx = 0: Ax = 500 N acting to the left.
Joint C (forces assumed tensile): vertical: 442.86 + FCB x 5/6.403 = 0 → FCB = -567.1 N (compression). Horizontal: -FCA - FCB x 4/6.403 = 0 → FCA = 567.1 x 0.6247 = 354.3 N (tension).
Joint A: vertical: -242.86 + FAB x 5/5.831 = 0 → FAB = 283.2 N (tension). Check horizontal: -500 + 283.2 x 3/5.831 + 354.3 = -500 + 145.7 + 354.3 = 0 ✓.
Answer: AB = 283.2 N tension, BC = 567.1 N compression, AC = 354.3 N tension.""", image=IMG.format("truss1")),
    saq(3, T, "Find the force in member GI of the truss shown in the figure (span AL = 6 x 5 m = 30 m, rise at F = 5.33 m; 1 kN at B, D, F, H, J; 5 kN at C, E, G; reactions 12.50 kN at A and 7.50 kN at L).",
        [("Method of sections: cut FH, GH and GI; take moments about H, where FH and GH meet", 1.5),
         ("Height of H = 5.33 x 10/15 = 3.553 m (top chord slope), H is 20 m from A (10 m from L)", 1),
         ("Right part: ΣMH = 0: 7.5 x 10 - 1 x 5 - FGI x 3.553 = 0", 1.5),
         ("FGI = 70/3.553 = 19.7 kN (tension); check with left part: 12.5 x 20 - [1(15 + 10 + 5) + 5(15 + 10 + 5)] = 70 kNm", 1)],
        """Use the method of sections. Cut the truss through members FH (top chord), GH (diagonal) and GI (bottom chord), and take moments about H, where the other two cut members meet, so only FGI appears.
Geometry: the top chord rises uniformly from L (x = 30 m) to F (x = 15 m, height 5.33 m), so H at x = 20 m (10 m from L) is at height 5.33 x 10/15 = 3.553 m. GI lies along the bottom chord, so its lever arm about H is 3.553 m.
Right-hand part (joints H, I, J, K, L): forces are the reaction 7.50 kN at L (10 m to the right of H) and the 1 kN load at J (5 m to the right of H); the load at H has no moment.
ΣMH = 0: 7.50 x 10 - 1 x 5 - FGI x 3.553 = 0 → FGI = 70/3.553 = 19.70 kN.
FGI is positive when assumed pulling away from the cut, so GI is in tension: FGI ≈ 19.7 kN (tension).
Check with the left part: moment of the loads and reaction about H = 12.50 x 20 - 1 x (15 + 10 + 5) - 5 x (15 + 10 + 5) = 250 - 30 - 150 = 70 kNm, giving the same 19.7 kN.""", image=IMG.format("truss2")),
    saq(4, T, "Determine the cross-sectional area and the values x̄ and ȳ to locate the position of the centroid for the section shown in the figure (flange 2400 x 150 mm on top of a 100 mm thick, 3600 mm deep web). Take the origin at the bottom left-hand corner of the section.",
        [("Areas: flange 2400 x 150 = 360 000 mm²; web 100 x 3600 = 360 000 mm²; total A = 720 000 mm² (0.72 m²)", 1.5),
         ("x̄: section symmetric about the vertical axis of the web (web centred under the flange) → x̄ = 2400/2 = 1200 mm", 1.5),
         ("ȳ = (360 000 x 1800 + 360 000 x (3600 + 75))/720 000 = (648 + 1323) x 10⁶/720 000 = 2737.5 mm from the bottom", 2)],
        """Divide the T-section into two rectangles (origin at the bottom left-hand corner of the section's bounding box, i.e. level with the bottom of the web and the left end of the flange):
1. Web: 100 x 3600 = 360 000 mm², centroid at x = 1200 mm, y = 3600/2 = 1800 mm.
2. Flange: 2400 x 150 = 360 000 mm², centroid at x = 1200 mm, y = 3600 + 150/2 = 3675 mm.
Total area A = 720 000 mm² = 0.72 m².
x̄ = (360 000 x 1200 + 360 000 x 1200)/720 000 = 1200 mm (the section is symmetric about the centre line of the web).
ȳ = (360 000 x 1800 + 360 000 x 3675)/720 000 = (648.0 x 10⁶ + 1323.0 x 10⁶)/720 000 = 2737.5 mm from the bottom (i.e. 1012.5 mm below the top of the flange).""", image=IMG.format("tsection")),
]

C1 = """Case I: Overhanging beam - shear force and bending moment
Determine the values and draw the diagrams for shear force and bending moment due to the imposed load on the overhanging beam shown in the figure, and find the position of the points of contraflexure, if any.
Beam A-G (all distances in mm): AB = 7000, BC = 4000, CD = 7000, DE = 4000, EF = 4000, FG = 6000. Supports at B and F. Loads: 1 kN at A (free end), uniformly distributed load 5 kN/m on CD, 4 kN at E, 2 kN at G (free end)."""
C2 = """Case II: Analysis of a fixed-base portal frame
Determine the values and draw the bending moment diagram for the portal frame ABCD shown in the figure. Columns AB and DC are 4000 mm high with fixed bases at A and D; beam BC is 8000 mm long and carries a vertical point load of 80 kN at 5000 mm from B (3000 mm from C). All members have the same moment of inertia I (EI constant). All dimensions in mm."""


def it(q, m, kp, mod): return (q, m, kp, mod)


Q += case("civil2022", 1, T, C1, image=IMG.format("beam"), items=[
    it("1. Find the support reactions VB and VF.", 10,
       [("Total load = 1 + 5 x 7 + 4 + 2 = 42 kN; UDL resultant 35 kN at 14.5 m from A", 2),
        ("ΣMB = 0 (B at 7 m, F at 26 m): VF x 19 = -1 x 7 + 35 x 7.5 + 4 x 15 + 2 x 25 → VF = 365.5/19 = 19.24 kN", 4),
        ("VB = 42 - 19.24 = 22.76 kN; check by ΣMF = 0", 4)],
       """Positions from A (m): B = 7, C = 11, D = 18, E = 22, F = 26, G = 32. UDL on CD = 5 x 7 = 35 kN acting at 14.5 m (7.5 m right of B). Total load = 1 + 35 + 4 + 2 = 42 kN.
ΣMB = 0 (clockwise positive): -1 x 7 + 35 x 7.5 + 4 x 15 + 2 x 25 - VF x 19 = 0 → -7 + 262.5 + 60 + 50 = 365.5 = 19 VF → VF = 19.24 kN.
ΣFy = 0: VB = 42 - 19.24 = 22.76 kN.
Check, ΣMF = 0 (the 1 kN at A, the UDL and the 4 kN at E are left of F; the 2 kN at G is right of F): VB x 19 = 1 x 26 + 35 x 11.5 + 4 x 4 - 2 x 6 = 26 + 402.5 + 16 - 12 = 432.5 → VB = 22.76 kN ✓.
VB = 22.76 kN (upward), VF = 19.24 kN (upward)."""),
    it("2. Draw the shear force diagram.", 15,
       [("A to B: V = -1 kN", 2), ("Just right of B: -1 + 22.76 = +21.76 kN, constant to C", 3),
        ("C to D: falls at 5 kN/m from +21.76 to 21.76 - 35 = -13.24 kN; zero at 21.76/5 = 4.35 m from C (x = 15.35 m)", 4),
        ("D to E: -13.24 kN; E to F: -17.24 kN; F to G: -17.24 + 19.24 = +2 kN; closes to 0 at G", 4),
        ("Diagram drawn with values, steps at point loads/ supports and sloping line under UDL", 2)],
       """Shear force (taking upward forces on the left part as positive):
A to B: V = -1 kN (from the 1 kN load at A).
At B the reaction 22.76 kN: V = -1 + 22.76 = +21.76 kN, constant from B to C.
C to D (UDL 5 kN/m): V decreases linearly from +21.76 kN to 21.76 - 35 = -13.24 kN at D; V = 0 at 21.76/5 = 4.35 m from C, i.e. x = 15.35 m from A (maximum BM there).
D to E: V = -13.24 kN.
At E (4 kN): V = -17.24 kN from E to F.
At F (reaction 19.24 kN): V = -17.24 + 19.24 = +2.0 kN from F to G.
At G the 2 kN load brings V back to 0 ✓.
SFD: a small negative rectangle (-1) over AB; a positive rectangle (+21.76) over BC; a sloping straight line over CD crossing zero at 15.35 m; negative rectangles -13.24 (DE) and -17.24 (EF); a positive rectangle +2 over FG."""),
    it("3. Draw the bending moment diagram.", 15,
       [("MA = 0; MB = -1 x 7 = -7 kNm (hogging)", 3), ("MC = -1 x 11 + 22.76 x 4 = +80.05 kNm", 3),
        ("Maximum at x = 15.35 m: M = 80.05 + 21.76 x 4.35 - 5 x 4.35²/2 = +127.4 kNm (sagging)", 3),
        ("MD = +109.9 kNm; ME = +56.9 kNm; MF = -2 x 6 = -12 kNm (hogging); MG = 0", 4),
        ("Shape: straight lines A-B-C, parabola C-D, straight lines D-E-F-G", 2)],
       """Bending moments (sagging positive), x from A:
MA = 0.
MB = -1 x 7 = -7.0 kNm (hogging).
MC = -1 x 11 + 22.76 x 4 = 80.05 kNm.
Maximum (where V = 0, x = 15.35 m): M = 80.05 + 21.76 x 4.353 - 5 x 4.353²/2 = 80.05 + 94.73 - 47.37 = 127.4 kNm (sagging) - the maximum bending moment.
MD (x = 18): -1 x 18 + 22.76 x 11 - 35 x 3.5 = 109.9 kNm.
ME (x = 22): 109.9 - 13.24 x 4 = 56.9 kNm.
MF (x = 26): from the right, -2 x 6 = -12.0 kNm (hogging).
MG = 0.
BMD: straight line from 0 at A to -7 at B, rising linearly to +80.05 at C, parabolic curve over CD peaking at +127.4 kNm (x = 15.35 m) and falling to +109.9 at D, straight lines to +56.9 at E and -12.0 at F, then back to 0 at G. Hogging moments occur over both supports (the overhangs)."""),
    it("4. Find the points of contraflexure between BC and between EF.", 10,
       [("Between B and C: M = -1(x) + 22.76(x - 7) = 0 → x = 7.32 m from A, i.e. 0.32 m right of B", 5),
        ("Between E and F: M = 56.9 - 17.24(x - 22) = 0 → x = 25.30 m, i.e. 3.30 m right of E (0.70 m left of F)", 5)],
       """A point of contraflexure is where the bending moment changes sign.
Between B and C (7 ≤ x ≤ 11): M = -1 x x + 22.76 (x - 7) = 21.76 x - 159.3 = 0 → x = 7.32 m from A, i.e. about 0.32 m to the right of support B.
Between E and F (22 ≤ x ≤ 26): M = ME - 17.24 (x - 22) = 56.95 - 17.24 (x - 22) = 0 → x - 22 = 3.30 m → x = 25.30 m from A, i.e. 3.30 m right of E (about 0.70 m left of support F).
So there are two points of contraflexure: 0.32 m right of B and 0.70 m left of F."""),
])

Q += case("civil2022", 2, T, C2, image=IMG.format("frame"), items=[
    it("1. Analyse the portal frame (find the end moments).", 20,
       [("Fixed-end moments for BC: MFBC = -Wab²/L² = -80 x 5 x 3²/8² = -56.25 kNm; MFCB = +Wa²b/L² = +80 x 5² x 3/8² = +93.75 kNm; columns 0", 4),
        ("Unsymmetric load → sway; method: slope-deflection (unknowns θB, θC, Δ) or moment distribution with a sway correction; stiffness: columns 4EI/4 = EI, beam 4EI/8 = 0.5EI (DF at B and C: column 2/3, beam 1/3)", 5),
        ("Equations: joint B, joint C equilibrium and shear (sway) condition (MAB + MBA)/4 + (MCD + MDC)/4 = 0", 5),
        ("Results: MA = 34.7 kNm, MB = 55.3 kNm, MC = 64.7 kNm, MD = 25.3 kNm (magnitudes); horizontal reactions 22.5 kN each, inward; frame sways towards A (Δ = 37.5/EI)", 6)],
       """Fixed-end moments (clockwise positive) for beam BC (L = 8 m, a = 5 m from B, b = 3 m):
MFBC = -W a b²/L² = -80 x 5 x 9/64 = -56.25 kNm; MFCB = +W a² b/L² = +80 x 25 x 3/64 = +93.75 kNm. Columns carry no span load: MF = 0.
Because the load is not central, the frame sways. Using slope-deflection with unknowns θB, θC and sway Δ (columns L = 4 m, beam L = 8 m, EI constant):
MAB = (2EI/4)(θB - 3Δ/4); MBA = (2EI/4)(2θB - 3Δ/4); MBC = -56.25 + (2EI/8)(2θB + θC); MCB = 93.75 + (2EI/8)(2θC + θB); MCD = (2EI/4)(2θC - 3Δ/4); MDC = (2EI/4)(θC - 3Δ/4).
Conditions: MBA + MBC = 0; MCB + MCD = 0; shear condition (MAB + MBA)/4 + (MCD + MDC)/4 = 0 (no horizontal load).
Solving: EIθB = 41.25, EIθC = -78.75 (clockwise positive) and EIΔ = 37.5, the frame swaying towards A (to the left).
Final end moments (magnitudes): MA = 34.69 kNm, MB = 55.31 kNm, MC = 64.69 kNm, MD = 25.31 kNm.
Horizontal reactions: H = (MA + MB)/4 = (34.69 + 55.31)/4 = 22.5 kN at A and (64.69 + 25.31)/4 = 22.5 kN at D, equal and opposite (acting inwards).
(The same result is obtained by moment distribution: distribution factors at B and C are 2/3 to the column and 1/3 to the beam, carry-over 1/2, non-sway analysis plus a sway correction.)"""),
    it("2. Find the vertical reactions VA and VD.", 15,
       [("Beam BC as a free body with end moments MB = 55.31 (hogging) and MC = 64.69 (hogging)", 4),
        ("ΣMB = 0: VC x 8 = 80 x 5 + 64.69 - 55.31 → VC = 51.17 kN = VD", 5),
        ("VB = 80 - 51.17 = 28.83 kN = VA; check simple-beam reactions 30/50 kN corrected by (MC - MB)/L = 1.17 kN", 6)],
       """Take beam BC as a free body. The end moments are hogging: MB = 55.31 kNm and MC = 64.69 kNm.
ΣMB = 0: VC x 8 = 80 x 5 + 64.69 - 55.31 = 409.38 → VC = 51.17 kN.
VB = 80 - 51.17 = 28.83 kN.
The vertical forces pass down the columns, so VA = 28.83 kN and VD = 51.17 kN (both upward); ΣV = 80 kN ✓.
(Simple-beam reactions would be 80 x 3/8 = 30 kN and 80 x 5/8 = 50 kN; the unequal end moments shift (64.69 - 55.31)/8 = 1.17 kN towards D.)
Other reactions: HA = HD = 22.5 kN (inwards); MA = 34.69 kNm, MD = 25.31 kNm."""),
    it("3. Draw the bending moment diagram.", 15,
       [("Beam: hogging 55.31 at B and 64.69 at C; free (simply supported) moment under load 80 x 5 x 3/8 = 150 kNm", 4),
        ("Net sagging under the load: 150 - (55.31 x 3/8 + 64.69 x 5/8) = 88.8 kNm (check: -55.31 + 28.83 x 5 = 88.8)", 4),
        ("Columns: linear; AB from 34.69 at A to 55.31 at B, changing sign (contraflexure 1.54 m above A); DC from 25.31 at D to 64.69 at C (contraflexure 1.13 m above D)", 4),
        ("Sketch drawn on the frame with values and points of contraflexure in beam (≈1.92 m from B and ≈1.26 m from C)", 3)],
       """Beam BC: the end moments are hogging, 55.31 kNm at B and 64.69 kNm at C. The free bending moment of a simply supported span under the 80 kN load is W a b/L = 80 x 5 x 3/8 = 150 kNm. Net sagging moment under the load = 150 - (55.31 x 3/8 + 64.69 x 5/8) = 150 - 61.17 = 88.8 kNm (check: -55.31 + 28.83 x 5 = 88.8 kNm).
Points of contraflexure in the beam: from B, M = -55.31 + 28.83 x = 0 → x = 1.92 m; from C, M = -64.69 + 51.17 x = 0 → x = 1.26 m (both lie between the knees and the load).
Columns (no lateral load, so the BM varies linearly): AB - 34.69 kNm at A and 55.31 kNm at B on opposite faces, zero at 4 x 34.69/90 = 1.54 m above A; DC - 25.31 kNm at D and 64.69 kNm at C, zero at 4 x 25.31/90 = 1.13 m above D.
BMD: draw on the frame - straight lines on both columns crossing zero at the contraflexure points, hogging peaks at the knees B (55.3) and C (64.7), and a triangular sagging peak of 88.8 kNm under the load."""),
])

for q in Q:
    if q["type"] != "mcq":
        q["issues"] = list(q.get("issues", [])) + ["Calculations and model answers written by Claude: please check before publishing."]
