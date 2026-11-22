"""ME Technical Paper III (Subject Specialisation Paper), Civil Engineering, BCSE 2019 - real paper (PDF sent by the
founder). Standard pattern (30 MCQ, 4 short answers, 2 case studies), same as the 2025 Civil Engineering paper (the
latest), so it is ADDED to the paper's pattern.
Not loaded (asked again in later years - 2019 is recorded on those questions): MCQ 9 (= 2020 MCQ 14), 10 (= 2021 MCQ 22),
22 (= 2021 MCQ 20), 23 (= 2021 MCQ 1). Replaced: MCQ 12 (contour statements - option a is doubtful, so 'all of the
above' is not safe), 25 (option '265' is a misprint for 365, leaving no correct option as printed), 27 (answers printed
in kPa for a force, and the sign of the 'difference' is ambiguous), 29 (effective specific gravity works out to 2.64, not
the printed 2.63). Eight new MCQs keep Part I at 30.
Formula options printed as images (MCQs 1, 19) were retyped; MCQ 2 is read as two pipes of equal diameter d.
Case 2 Q1: the crest elevation is printed as 505.50 m, above the headwater (501.00 m) - no flow is possible; read as
500.50 m (head 0.50 m), which is consistent with the tailwater at 500.00 m. Case 1 Q1: seismic zone, importance and R are
not stated - the model answer states its assumptions (zone V, I = 1.5 for a Thromde office, SMRF R = 5).
Pictures: public/papers/me/tech3-civil-2019-*.png.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1"
GROUP_TAG = "civil2019"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "civil-engineering"
ADDS_TO_PAPER = True  # 2025 is the latest Civil Engineering paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Civil Engineering"
PATTERN = STANDARD
IMG = "/papers/me/tech3-civil-2019-{}.png"

MCQ = r"""[
{
"n": 1,
"stem": "For the beam shown below, the stiffness coefficient K22 can be written as",
"opts": [
"b)",
"",
"d)",
""
]
},
{
"n": 2,
"stem": "Two pipes of diameters d1 and d2 converge to form a pipe of diameter 2d. If the liquid flows with a velocity of v1 and v2 in the two pipes, what will be the flow velocity in the third pipe?",
"opts": [
"v1 + v2",
"v1 + v2/2",
"v1 + v2/4",
"2(v1 + v2)"
]
},
{
"n": 3,
"stem": "Which of the following statements are true? I. The displacement method is more useful when degree of kinematic indeterminacy is greater than the degree of static indeterminacy. II. The displacement method is more useful when degree of kinematic indeterminacy is less than the degree of static indeterminacy. III. The force method is more useful when degree of static indeterminacy is greater than the degree of kinematic indeterminacy. IV. The force method is more useful when degree of static indeterminacy is less than the degree of kinematic indeterminacy.",
"opts": [
"I and III",
"II and III",
"I and IV",
"II and IV"
]
},
{
"n": 4,
"stem": "The R.L, of the point A which is on the floor is 100 m and back sight reading on A is 2.455 m. If the foresight reading on the point B which is on the ceiling is 2.745 m, the R.L. of point B will be",
"opts": [
"94.80 m",
"105.20 m",
"99.71 m",
"100.29 m"
]
},
{
"n": 5,
"stem": "Rise of water table above the ground surface causes",
"opts": [
"equal increase in pore water pressure and total stress.",
"equal decrease in pore water pressure and total stress.",
"increase in pore water pressure but decrease in total stress.",
"decrease in pore water pressure but increase in total stress."
]
},
{
"n": 6,
"stem": "The design of horizontal and vertical alignments, super elevation, gradient is worst affected by",
"opts": [
"Length of vehicle",
"Width of vehicle",
"Speed of vehicle",
"Height of vehicle"
]
},
{
"n": 7,
"stem": "A vertically immersed surface is shown in the below figure. The distance of its centre of pressure from the water surface is",
"opts": [
"(bd²/12) + x̅",
"(d²/12 x̅ ) + x̅",
"b²/12 + x̅",
"d²/12 + x̅"
]
},
{
"n": 8,
"stem": "Slenderness of a column is zero when",
"opts": [
"Ends are firmly fixed.",
"Column is supported on all sides throughout the length.",
"Length is equal to radius of gyration.",
"Length is twice the radius of gyration."
]
},
{
"n": 9,
"stem": "If there are m unknown member forces, r unknown reaction components and j number of joints, then the degree of static indeterminacy of a pin-jointed plane frame is given by",
"opts": [
"m + r + 2j",
"m - r + 2j",
"m + r - 2j",
"m + r - 3j"
]
},
{
"n": 10,
"stem": "A simply supported beam with a gradually varying load from zero at ‘B’ and ‘w’ per unit length at ‘A’ is shown in the below figure. The shear force at ‘B’ is equal to",
"opts": [
"wl/6",
"wl/3",
"wl",
"2wl/3"
]
},
{
"n": 11,
"stem": "The most economical section of a rectangular channel is one which has hydraulic mean depth or hydraulic radius equal to",
"opts": [
"half the depth.",
"half the breadth.",
"twice the depth.",
"twice the breadth."
]
},
{
"n": 12,
"stem": "Select the correct statement:",
"opts": [
"A contour is not necessarily a closed curve.",
"A contour represents a ridge line if the concave side of lower value contour lies towards the higher value contour.",
"Two contours of different elevations do not cross each other except in case of an overhanging cliff.",
"All of the above statements are correct."
]
},
{
"n": 13,
"stem": "Wp and Wf are the weights of a cylinder containing partially compacted and fully compacted concrete. If the compaction factor (Wp/Wf) is 0.95, the workability of concrete is",
"opts": [
"extremely low.",
"high.",
"very low.",
"low."
]
},
{
"n": 14,
"stem": "Two different soil types (Soil 1 and Soil 2) are used as backfill behind a retaining wall as shown in the figure, where is total unit weight, and c' and φ' are effective cohesion and effective angle of shearing resistance. The resultant active earth force per unit length (in kN/m) acting on the wall is",
"opts": [
"31.7",
"35.2",
"51.8",
"57.0"
]
},
{
"n": 15,
"stem": "All the members of the planar truss (see figure), have the same properties in terms of area of cross-section (A) and modulus of elasticity (E). For the loads shown on the truss, the statement that correctly represents the nature of forces in the members of the truss is:",
"opts": [
"There are 3 members in tension, and 2 members in compression.",
"There are 2 members in tension, 2 members in compression, and 1 zero-force member.",
"There are 2 members in tension, 1 member in compression, and 2 zero-force members.",
"There are 2 members in tension, and 3 zero-force members."
]
},
{
"n": 16,
"stem": "The factor to be considered for the source of city water supply is",
"opts": [
"quantity and quality of the available water.",
"elevation of the source of water.",
"general terrain intervening the area.",
"All of the above."
]
},
{
"n": 17,
"stem": "When footings are to be placed adjacent to an existing structure, the line from the base of the new footing to the bottom edge of the existing footing should be",
"opts": [
"30 degree",
"45 degree",
"60 degree",
"90 degree"
]
},
{
"n": 18,
"stem": "In a combined footing for two columns carrying unequal loads, the maximum hogging bending moment occurs at",
"opts": [
"a point of zero shear force.",
"less loaded column.",
"more loaded column.",
"A point of the maximum shear force."
]
},
{
"n": 19,
"stem": "The figure shows a simply supported beam PQ of uniform flexural rigidity EI carrying two moments M and 2M. The slope at P will be",
"opts": [
"0",
"c) d)",
"",
""
]
},
{
"n": 20,
"stem": "The most commonly adopted method to provide super-elevation on roads is by pivoting the road surface about",
"opts": [
"outer edge do that the inner edge is lowered.",
"crown so that outer edge is raised and inner edge is lowered.",
"inner edge so that outer edge is raised.",
"None of the above."
]
},
{
"n": 21,
"stem": "Pick up the correct statement applicable to plate load test:",
"opts": [
"Width of the test pit for plate load test is made five times the width of the plate.",
"At the centre of the test pit, a hole is dug out whose size is kept equal to the size of the test plate.",
"Bottom level of the hole dug at the centre of the test pit is kept at the level of actual formation.",
"All of the above."
]
},
{
"n": 22,
"stem": "The speed-density relationship for a road section is shown in the figure below: The shape of the flow-density relationship is",
"opts": [
"piecewise linear",
"parabolic",
"initially linear then parabolic",
"initially parabolic then linear"
]
},
{
"n": 23,
"stem": "An inflow hydrograph is routed through a reservoir to produce an outflow hydrograph. The peak flow of the inflow hydrograph is PI and the time of occurrence of the peak is tI. The peak flow of the outflow hydrograph is P0 and the time of occurrence of the peak is t0. Which one of the following statements is correct?",
"opts": [
"PI < P0 and tI > t0",
"PI > P0 and tI > t0",
"PI < P0 and tI < t0",
"PI > P0 and tI < t0"
]
},
{
"n": 24,
"stem": "The equivalent axial tensile load Pe, which produces an average axial tensile stress in the section equivalent to the combined stress due to axial tension P and bending M, at the extreme fibre of the section, is given by (where Z is the section modulus of the section)",
"opts": [
"Pe = P + MA/Z",
"Pe = P - MA/Z",
"Pe = P - Z/MA",
"Pe = P + Z/MA"
]
},
{
"n": 25,
"stem": "If V is total consumption of water in liters for a population of N individuals, per capita consumption or water allowance for the water supply Q, is given by",
"opts": [
"Q = V/12N",
"Q = V/24N",
"Q = V/265N",
"None of the above"
]
},
{
"n": 26,
"stem": "The rigid-jointed plane frame QRS shown in the figure is subjected to a load P at the joint R. Let the axial deformations in the frame be neglected. If the support S undergoes a settlement of , the vertical reaction at the supports will become zero when β is equal to",
"opts": [
"0.1",
"7.5",
"3.0",
"48.0"
]
},
{
"n": 27,
"stem": "A rigid smooth retaining wall of height 7 m with vertical backface retains saturated clay as backfill. The saturated unit weight and un drained cohesion of the backfill are 17.2 kN/m3 and 20 kPa, respectively. The difference in the active lateral forces on the wall (in kN per meter length of wall, up to two decimal places), before and after the occurrence of tension cracks is",
"opts": [
"46.72 kpa",
"4.67 kpa",
"0.467 kpa",
"- 46.72 kpa"
]
},
{
"n": 28,
"stem": "At a construction site, a contractor plans to make an excavation as shown in the figure below. The water level in the adjacent river is at an elevation of +20.0 m. Unit weight of water is 10 kN/m3. The factor of safety (up to two decimal places) against sand boiling for the proposed excavation is",
"opts": [
"1.0",
"0.5",
"2.0",
"0.75"
]
},
{
"n": 29,
"stem": "In Marshall method of mix design, the coarse aggregate, fine aggregate, fines and bitumen having respective values of specific gravity 2.60, 2.70, 2.65 and 1.01, are mixed in the relative proportions (% by weight) of 55.0, 35.8, 3.7 and 5.5 respectively. The theoretical specific gravity of the mix and the effective specific gravity of the aggregates in the mix respectively are",
"opts": [
"2.42 and 2.78",
"2.42 and 2.93",
"2.42 and 2.63",
"2.64 and 2.78"
]
},
{
"n": 30,
"stem": "At the foot of a spill way, water flows at a depth of 23 cm with a velocity of 8.1 m/s, as shown in the figure. The flow enters as an M-3 profile in the long wide rectangular channel with bed slope and Manning's n = 0.015. A hydraulic jump is formed at a certain distance from the foot of the spillway. Assume the acceleration due to gravity, g = 9.81 m/s2. Just before the hydraulic jump, the depth of flow y1 (in m, round off to 2 decimal places) is",
"opts": [
"00.420",
"42.000",
"04.200",
"00.042"
]
}
]"""

FIX = {
    1: {"opts": ["6EI/L²", "12EI/L³", "3EI/L", "EI/6L²"], "image": IMG.format("m1"),
        "stem": "For the cantilever beam shown in the figure (fixed at the left end; degrees of freedom at the free end: 1 axial, 2 transverse, 3 rotation), the stiffness coefficient K22 can be written as"},
    2: {"stem": "Two pipes, each of diameter d, converge to form a pipe of diameter 2d. If the liquid flows with velocities v1 and v2 in the two pipes, what will be the flow velocity in the third pipe?",
        "opts": ["v1 + v2", "(v1 + v2)/2", "(v1 + v2)/4", "2(v1 + v2)"]},
    7: {"image": IMG.format("m7")},
    14: {"image": IMG.format("m14"), "stem": "Two different soil types are used as backfill behind a smooth vertical retaining wall as shown in the figure: Soil 1 (top 2 m): γt = 15 kN/m³, c' = 0, φ' = 30°; Soil 2 (next 2 m): γt = 20 kN/m³, c' = 0, φ' = 40°. The resultant active earth force per unit length (in kN/m) acting on the wall is"},
    15: {"image": IMG.format("m15")},
    19: {"opts": ["0", "ML/9EI", "ML/6EI", "ML/3EI"], "image": IMG.format("m19"),
         "stem": "The figure shows a simply supported beam PQ of uniform flexural rigidity EI and span L carrying two clockwise moments, M at L/3 and 2M at 2L/3 from P. The slope at P will be"},
    26: {"image": IMG.format("m26"), "stem": "The rigid-jointed plane frame QRS shown in the figure (QR horizontal, length L, fixed at Q; RS vertical, length L, fixed at S; EI constant) is subjected to a vertical load P at joint R. Neglect axial deformations. If the support S undergoes a settlement Δ = PL³/(βEI), the vertical reaction at S becomes zero when β is equal to"},
    28: {"image": IMG.format("m28")},
    30: {"image": IMG.format("m30"), "opts": ["0.42", "42.0", "4.20", "0.042"],
         "stem": "At the foot of a spillway, water flows at a depth of 23 cm with a velocity of 8.1 m/s, as shown in the figure. The flow enters as an M-3 profile in a long, wide rectangular channel with bed slope 1/1800 and Manning's n = 0.015. A hydraulic jump forms at some distance from the foot of the spillway. Take g = 9.81 m/s². Just before the hydraulic jump, the depth of flow y1 (in m, rounded to 2 decimal places) is"},
}
KEY = {
    1: ("b", "K22 is the transverse force at the free end for a unit transverse displacement with the other degrees of freedom held: 12EI/L³ (6EI/L² couples translation and rotation; 4EI/L is K33)."),
    2: ("c", "Continuity: (π/4)d²v1 + (π/4)d²v2 = (π/4)(2d)²v3 → v3 = (v1 + v2)/4."),
    3: ("d", "Use the method with fewer unknowns: the displacement method when kinematic indeterminacy < static indeterminacy (II), the force method when static < kinematic (IV)."),
    4: ("b", "For a point on the ceiling the staff is inverted, so its reading is added: RL B = 100 + 2.455 + 2.745 = 105.20 m."),
    5: ("a", "Water ponding above the ground adds the same γw x h to both total stress and pore pressure - the effective stress does not change."),
    6: ("c", "Design speed governs sight distances, curve radii, super-elevation, transition lengths and gradients."),
    7: ("b", "Centre of pressure depth h* = x̄ + IG/(A x̄) = x̄ + (bd³/12)/(bd x̄) = d²/(12x̄) + x̄."),
    8: ("b", "A column braced on all sides throughout its length cannot buckle - its effective length, and hence slenderness, is zero."),
    11: ("a", "Most economical rectangular section: b = 2y, so R = A/P = 2y²/4y = y/2 (half the depth)."),
    13: ("b", "Compaction factor 0.95 indicates high workability (about 0.78 very low, 0.85 low, 0.92 medium, 0.95 high)."),
    14: ("a", "Ka1 = 1/3, Ka2 = (1 - sin40°)/(1 + sin40°) = 0.217. Soil 1: ½ x (1/3)(15 x 2) x 2 = 10.0; soil 2: pressures 0.217 x 30 = 6.52 and 0.217 x 70 = 15.22 kPa → (6.52 + 15.22)/2 x 2 = 21.7; total ≈ 31.7 kN/m."),
    15: ("c", "Joint with the downward P (bottom right): the vertical member carries P in tension, the bottom member is zero. Joint with the horizontal P (top left): the top member is in tension, the left vertical is zero. Top-right joint (horizontal support): the diagonal carries √2P in compression. So 2 tension, 1 compression, 2 zero-force members."),
    16: ("d", "Selecting a source depends on the quantity and quality of water, its elevation (gravity vs pumping) and the intervening terrain (distance, cost)."),
    17: ("b", "The line joining the bottom edges of adjacent footings should not be steeper than 45° (1:1) so the new footing does not load the existing one."),
    18: ("a", "Between the columns the footing bends with tension at the top (hogging); the maximum moment occurs where the shear force is zero."),
    19: ("c", "Slope at the left support due to a clockwise moment M0 at distance b from the right end: θ = M0(L² - 3b²)/(6EIL). M at b = 2L/3: -ML/18EI; 2M at b = L/3: +4ML/18EI. Total = 3ML/18EI = ML/6EI."),
    20: ("b", "Super-elevation is most commonly obtained by rotating the pavement about the centre line (crown), raising the outer edge and lowering the inner edge."),
    21: ("d", "IS 1888: the test pit is at least five times the plate width; a central hole the size of the plate is dug to the actual foundation level."),
    24: ("a", "Extreme fibre stress = P/A + M/Z; the equivalent axial load giving this stress uniformly is Pe = A(P/A + M/Z) = P + MA/Z."),
    26: ("b", "For zero force in RS, the settlement must make QR carry all of P as a cantilever while RS only restrains the rotation at R. A stiffness analysis gives Δ = PL³/7.5EI, i.e. β = 7.5 (β = 3 would ignore the rotational restraint of RS)."),
    28: ("a", "Upward water pressure at the top of the sand (elevation 0) = 20 m x 10 = 200 kPa; downward weight of clay below the excavation = 10 m x 20 = 200 kPa; FS = 200/200 = 1.0."),
    30: ("a", "q = 0.23 x 8.1 = 1.863 m²/s; normal depth (wide channel) yn = (qn/√S)^(3/5) = 1.108 m = y2 of the jump; F2² = q²/(g y2³) = 0.26; y1 = (y2/2)(√(1 + 8F2²) - 1) = 0.42 m."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T, FIX) + [
    new_mcq(1, T, "As per IS 456:2000, the minimum area of tension reinforcement in a beam is given by As/(bd) =",
            ["0.85/fy", "0.12/fy", "0.4/fy", "0.04"], "a", "IS 456 cl 26.5.1.1 (a): As/(bd) = 0.85/fy (e.g. 0.17 % for Fe 500); maximum 4 % of bD."),
    new_mcq(2, T, "As per IS 875 (Part 1), the unit weight of reinforced cement concrete may be taken as",
            ["22 kN/m³", "24 kN/m³", "25 kN/m³", "78.5 kN/m³"], "c", "RCC 25 kN/m³; plain concrete 24 kN/m³; steel 78.5 kN/m³."),
    new_mcq(3, T, "Paving bitumen grades such as 60/70 and 80/100 are designated on the basis of the",
            ["ductility test", "penetration test", "softening point test", "flash and fire point test"], "b", "The numbers are the range of penetration (in 0.1 mm) at 25 °C; IS 73:2013 now grades bitumen by viscosity (VG-10, VG-30 ...)."),
    new_mcq(4, T, "The coefficient of consolidation (cv) of a clay is obtained from the",
            ["direct shear test", "time-settlement readings of the oedometer (consolidation) test", "unconsolidated undrained triaxial test", "standard Proctor test"], "b", "cv is found from oedometer time-settlement curves by Casagrande's log-time or Taylor's root-time fitting method."),
    new_mcq(5, T, "In a flow net for seepage through an isotropic soil, flow lines and equipotential lines intersect at",
            ["45°", "60°", "90°", "any angle"], "c", "In isotropic soil the flow lines and equipotential lines are orthogonal, forming curvilinear squares."),
    new_mcq(6, T, "The ratio of the moment of inertia of a rectangular section about its base to that about its centroidal axis parallel to the base is",
            ["2", "3", "4", "6"], "c", "Ibase = bd³/3 and Icentroid = bd³/12, so the ratio is 4 (parallel axis theorem: bd³/12 + bd(d/2)²)."),
    new_mcq(7, T, "The Muskingum method is used for",
            ["reservoir routing", "channel (flood) routing", "estimating groundwater recharge", "estimating evaporation"], "b", "Muskingum is a hydrologic channel-routing method using prism and wedge storage (S = K[xI + (1 - x)O])."),
    new_mcq(8, T, "In levelling, keeping the back-sight and fore-sight distances equal eliminates errors due to",
            ["tilt of the staff", "collimation and curvature/ refraction", "parallax", "incorrect staff readings"], "b", "Equal sight lengths cancel the collimation (line of sight not horizontal) error and the effects of curvature and refraction."),
]

Q += [
    saq(1, T, """A rectangular footing is founded at a depth of 2 m below ground level in a c-φ soil with: porosity n ≈ 40 %, G ≈ 2.67, c ≈ 15 kN/m², φ ≈ 30°. The water table is close to the ground surface. If the width of the footing is 3 m, what length is required to carry a gross allowable bearing pressure qa = 455 kN/m² with a factor of safety Fs = 3.0? Use Terzaghi's theory of general shear failure; for φ = 30° use Nc = 37.2, Nq = 22.5 and Nγ = 19.7.""",
        [("Unit weights: e = n/(1 - n) = 0.667; γsat = (G + e)γw/(1 + e) = 19.6 kN/m³; γ' = 9.83 kN/m³ (water table at ground level)", 1),
         ("Overburden q = γ' Df = 9.83 x 2 = 19.7 kN/m²", 0.5),
         ("Terzaghi rectangular: qu = cNc(1 + 0.3B/L) + qNq + 0.5γ'BNγ(1 - 0.2B/L)", 1),
         ("Required qu = Fs x qa = 3 x 455 = 1365 kN/m²; terms: 558 + 442 + 290.5 = 1290.8 plus (502.2 - 174.3)/L", 1.5),
         ("1365 = 1290.8 + 327.9/L → L ≈ 4.4 m (on the net-pressure basis, qu = 3(455 - 19.7) + 19.7 = 1326 gives L ≈ 9.4 m - state the basis)", 1)],
        """Soil properties: void ratio e = n/(1 - n) = 0.40/0.60 = 0.667. γsat = (G + e)γw/(1 + e) = (2.67 + 0.667) x 9.81/1.667 = 19.6 kN/m³. With the water table at the ground surface, the submerged unit weight γ' = 19.6 - 9.81 = 9.83 kN/m³ is used in both the q and Nγ terms.
Overburden pressure at founding level: q = γ' Df = 9.83 x 2 = 19.7 kN/m².
Terzaghi's equation for a rectangular footing (general shear): qu = c Nc (1 + 0.3 B/L) + q Nq + 0.5 γ' B Nγ (1 - 0.2 B/L).
Constant terms: c Nc = 15 x 37.2 = 558.0; q Nq = 19.7 x 22.5 = 442.3; 0.5 γ' B Nγ = 0.5 x 9.83 x 3 x 19.7 = 290.5; sum = 1290.8 kN/m².
Shape terms: 558.0 x 0.3 x 3/L = 502.2/L; -290.5 x 0.2 x 3/L = -174.3/L; net +327.9/L.
Taking the gross allowable pressure as qa = qu/Fs: qu = 3 x 455 = 1365 kN/m².
1365 = 1290.8 + 327.9/L → L = 327.9/74.2 = 4.42 m. Provide a footing about 3 m x 4.5 m.
(If the allowable pressure is defined on the net basis, qa = qnu/Fs + q, then qu = 3(455 - 19.7) + 19.7 = 1325.7 kN/m² and L ≈ 9.4 m - the answer must state which definition is used.)"""),
    saq(2, T, "A wooden beam 150 mm x 250 mm is simply supported over a span of 5 m. When a concentrated load W is placed at a distance a from the left support, the maximum bending stress in the beam is 11.2 N/mm² and the maximum shear stress is 0.7 N/mm². Determine the load W and the distance a (see the figure).",
        [("Z = bd²/6 = 150 x 250²/6 = 1.5625 x 10⁶ mm³ → Mmax = 11.2 x 1.5625 x 10⁶ = 17.5 kNm", 1.5),
         ("τmax = 1.5 V/(bd) → Vmax = 0.7 x 150 x 250/1.5 = 17.5 kN", 1.5),
         ("With a < L/2: Vmax = RA = W(L - a)/L and Mmax = RA x a → a = Mmax/Vmax = 1.0 m", 1),
         ("W = 17.5 x 5/(5 - 1) = 21.9 kN", 1)],
        """Section: b = 150 mm, d = 250 mm. Z = b d²/6 = 150 x 250²/6 = 1.5625 x 10⁶ mm³; area = 37 500 mm².
Maximum bending moment: Mmax = σ Z = 11.2 x 1.5625 x 10⁶ = 17.5 x 10⁶ Nmm = 17.5 kNm.
Maximum shear force (rectangular section, τmax = 1.5 V/(b d)): Vmax = 0.7 x 37 500/1.5 = 17 500 N = 17.5 kN.
With the load at a from A (a < L/2), the larger reaction is RA = W(L - a)/L; this is the maximum shear, and the maximum moment under the load is RA x a.
So a = Mmax/Vmax = 17.5/17.5 = 1.0 m from the left support.
W = RA x L/(L - a) = 17.5 x 5/4 = 21.9 kN.
(Check: RA = 21.9 x 4/5 = 17.5 kN; M = 17.5 x 1.0 = 17.5 kNm ✓.)""", image=IMG.format("beam")),
    saq(3, T, "A run-of-river hydel power plant with an installed capacity of 15 000 kW operates at 20 % load factor when it serves as a peak load station. What should be the minimum discharge in the stream so that it may serve as a base load station? The plant efficiency is 80 % under a head of 15 m. Also calculate the maximum load factor of the plant when the discharge in the stream is 30 m³/s.",
        [("Average load as peak station = 0.20 x 15 000 = 3000 kW", 1),
         ("As a base load station it must supply this continuously: P = ηρgQH → Q = 3000/(0.8 x 9.81 x 15) = 25.5 m³/s", 2),
         ("With Q = 30 m³/s: P = 0.8 x 9.81 x 30 x 15 = 3532 kW", 1),
         ("Maximum load factor = 3532/15 000 = 23.5 %", 1)],
        """Average power when working at 20 % load factor = 0.20 x 15 000 = 3000 kW.
To run as a base load station, the stream must continuously supply the energy needed for this average output: P = η γw Q H (kW, with γw = 9.81 kN/m³).
3000 = 0.80 x 9.81 x Q x 15 → Q = 3000/117.7 = 25.5 m³/s (minimum stream discharge).
With a stream discharge of 30 m³/s, the continuous power that can be generated = 0.80 x 9.81 x 30 x 15 = 3532 kW.
Maximum load factor = average power/installed capacity = 3532/15 000 = 0.235, i.e. about 23.5 %."""),
    saq(4, T, "A 100 m long concrete box-girder bridge rests on four supports - two abutments and two bents, as shown in the figure. The cross-sectional area of the deck is 11 m²; the weight of the bridge is idealised as lumped at deck level; the unit weight of concrete is 25 kN/m³; the weight of the bents may be neglected. Each bent has three 10 m tall circular columns with I = 1.122 x 10¹¹ mm⁴; E = 30 GPa. Calculate the natural vibration frequency of the bridge in the longitudinal direction.",
        [("Weight = 100 x 11 x 25 = 27 500 kN → mass m = 27 500/9.81 = 2803 t", 1),
         ("Each column clamped at base and to the (rigid) deck: k = 12EI/h³ = 12 x 30 x 10⁶ x 0.1122/10³ = 40 392 kN/m", 1.5),
         ("6 columns (longitudinal movement resisted by both bents, abutment bearings free): k = 242 352 kN/m", 1),
         ("ωn = √(k/m) = √(242 352/2803) = 9.30 rad/s → fn = 1.48 Hz (Tn ≈ 0.68 s)", 1.5)],
        """Mass: weight of the deck = 100 x 11 x 25 = 27 500 kN; m = 27 500/9.81 = 2803 kN s²/m (2803 tonnes).
Stiffness in the longitudinal direction: the deck moves as a rigid body; at the abutments it sits on bearings that allow longitudinal movement, so the lateral stiffness comes from the columns of the two bents. Each column is fixed at the base and rigidly connected to the deck, so k = 12EI/h³.
EI = 30 x 10⁶ kN/m² x 1.122 x 10⁻¹ m⁴ = 3.366 x 10⁶ kNm² (1.122 x 10¹¹ mm⁴ = 0.1122 m⁴).
k per column = 12 x 3.366 x 10⁶/10³ = 40 392 kN/m; 6 columns: k = 242 352 kN/m.
Natural circular frequency ωn = √(k/m) = √(242 352/2803) = 9.30 rad/s.
Natural frequency fn = ωn/2π = 1.48 Hz; natural period Tn = 1/fn ≈ 0.68 s.""", image=IMG.format("bridge")),
]

C1 = """Case 1: Seismic loads on a Thromde office building, and a sign board
You are an engineer with a company that won a design competition for Thimphu Thromde infrastructure. One component is a Thromde office at Changangkha (plan and section in the figure: 4 bays of 5.0 m by 3 bays of 5.0 m, i.e. 20 m x 15 m; ground storey 4.2 m and three upper storeys of 3.2 m to the roof). The soil is medium stiff and the building is on a raft foundation. The RC frames have brick-masonry infill walls. The lumped dead load is 12 kN/m² on floors and 10 kN/m² on the roof; live load is 4 kN/m² on floors and 1.5 kN/m² on the roof.
Extracts given with the paper (IS 1893 (Part 1): 2016): Z = 0.10, 0.16, 0.24, 0.36 for zones II-V; Ta = 0.09h/√d for buildings with infill; Ah = (Z/2)(Sa/g)/(R/I); Sa/g for medium soil = 2.5 for T < 0.55 s, 1.36/T for 0.55-4.0 s; Qi = VB Wi hi²/ΣWj hj²; minimum ρ = 2.4 % (zone V); importance factor table; Dp = R(hx - hy)ΔaA/hsx with ΔaA/hsx = 0.004."""
C2 = """Case 2: 24 x 7 water supply - intake, channel and pipeline
The Royal Government of Bhutan has given top priority to 24 x 7 water supply in all 20 Dzongkhags. A water flagship project office has recruited you as a project engineer, and your first assignment has the following tasks."""


def it(q, m, kp, mod): return (q, m, kp, mod)


Q += case("civil2019", 1, T, C1, image=IMG.format("plan"), items=[
    it("1 (i). Determine the total seismic weight of the structure by the equivalent static method.", 5,
       [("Plan area = 20 x 15 = 300 m²", 1),
        ("Floors (1st-3rd): DL 12 x 300 = 3600 + 50 % of LL (LL 4 kN/m² > 3) = 0.5 x 4 x 300 = 600 → 4200 kN each", 2),
        ("Roof: 10 x 300 = 3000 kN (roof live load not included)", 1),
        ("Total W = 3 x 4200 + 3000 = 15 600 kN", 1)],
       """Plan area = 20 m x 15 m = 300 m².
Seismic weight of each floor = full dead load + a percentage of the imposed load (IS 1893 (Part 1): 2016 cl 7.3.1: 25 % for imposed loads up to 3 kN/m², 50 % above 3 kN/m²); imposed load on the roof is not considered.
Floors (1st, 2nd, 3rd): 12 x 300 + 0.50 x 4 x 300 = 3600 + 600 = 4200 kN each.
Roof: 10 x 300 = 3000 kN.
Total seismic weight W = 3 x 4200 + 3000 = 15 600 kN.
(The ground-floor slab rests on the raft and is not included.)"""),
    it("1 (ii). Determine the design base shear.", 10,
       [("Assumptions (not given): Thimphu zone V, Z = 0.36; I = 1.5 (Thromde office - critical governance building); R = 5 (special RC MRF)", 3),
        ("h = 4.2 + 3 x 3.2 = 13.8 m; Ta = 0.09h/√d: d = 20 m → 0.28 s; d = 15 m → 0.32 s", 2),
        ("Medium soil, T < 0.55 s → Sa/g = 2.5", 1),
        ("Ah = (0.36/2)(1.5/5)(2.5) = 0.135; VB = 0.135 x 15 600 = 2106 kN (> ρW = 0.024 x 15 600 = 374 kN)", 4)],
       """Assumptions (the case does not state them): Thimphu taken in seismic zone V, Z = 0.36; importance factor I = 1.5 (a Thromde office is a critical governance building, Table 8); special RC moment resisting frame with infill, R = 5.
Height h = 4.2 + 3 x 3.2 = 13.8 m. With brick infill: Ta = 0.09h/√d.
Longitudinal (d = 20 m): Ta = 0.09 x 13.8/√20 = 0.28 s. Transverse (d = 15 m): Ta = 0.09 x 13.8/√15 = 0.32 s.
Medium stiff soil: Ta < 0.55 s → Sa/g = 2.5 in both directions.
Ah = (Z/2) x (Sa/g)/(R/I) = 0.18 x 2.5/(5/1.5) = 0.135.
Design base shear VB = Ah W = 0.135 x 15 600 = 2106 kN (both directions here).
Minimum (zone V): ρ W = 0.024 x 15 600 = 374 kN < 2106 kN ✓.
(With zone IV, Z = 0.24: Ah = 0.09 and VB = 1404 kN.)"""),
    it("1 (iii). Determine the lateral force on each floor.", 15,
       [("Qi = VB Wi hi²/Σ Wj hj²; heights 4.2, 7.4, 10.6, 13.8 m", 3),
        ("Wi hi²: 74 088; 229 992; 471 912; 571 320; Σ = 1 347 312", 4),
        ("Q1 = 115.8, Q2 = 359.5, Q3 = 737.7, Q(roof) = 893.0 kN (Σ = 2106 kN)", 5),
        ("Storey shears: 893.0, 1630.7, 1990.2, 2106.0 kN (top to bottom); loading and shear diagrams", 3)],
       """Vertical distribution (IS 1893 cl 7.6.3): Qi = VB x Wi hi²/Σ Wj hj².
Level | Wi (kN) | hi (m) | Wi hi² | Qi (kN) | storey shear (kN)
1st floor | 4200 | 4.2 | 74 088 | 2106 x 74 088/1 347 312 = 115.8 | 2106.0 (ground storey)
2nd floor | 4200 | 7.4 | 229 992 | 359.5 | 1990.2
3rd floor | 4200 | 10.6 | 471 912 | 737.7 | 1630.7
Roof | 3000 | 13.8 | 571 320 | 893.0 | 893.0 (top storey)
Σ Wi hi² = 1 347 312; Σ Qi = 2106 kN ✓.
The lateral forces increase with height (largest at the roof); the storey shear increases downwards to the base shear. The forces are shared among the frames in proportion to their stiffness (4 frames in one direction, 5 in the other), plus accidental torsion as per the code."""),
    it("2. A neon sign board is attached to a 5-storey building in Thimphu by two anchors at heights of 12.0 m and 8.0 m. From the elastic analysis under the design seismic load, the deflections of the upper and lower attachments are 35.0 mm and 25.0 mm. Find the design relative displacement.", 20,
       [("Non-structural element connected at two levels of the same building: Dp = R (δxA - δyA) (IS 1893 Part 1 cl 7.13 / non-structural provisions)", 5),
        ("R = 5 (assumed, same as the building): Dp = 5 x (35 - 25) = 50 mm", 6),
        ("Upper limit: Dp ≤ R (hx - hy) ΔaA/hsx = 5 x (12 000 - 8000) x 0.004 = 80 mm", 6),
        ("Design relative displacement = 50 mm (less than the 80 mm limit); the anchors/ sign must accommodate this movement", 3)],
       """For a non-structural element attached at two levels x and y of the same building, the design relative displacement is Dp = R (δxA - δyA), where δxA and δyA are the elastic deflections at the two attachment levels under the design seismic load, and R is the response reduction factor of the building (the elastic analysis uses forces reduced by R).
Taking R = 5 (special RC moment resisting frame, as assumed for this building):
Dp = 5 x (35.0 - 25.0) = 50 mm.
This need not exceed Dp = R (hx - hy) ΔaA/hsx, where ΔaA/hsx = 0.004 is the allowable storey drift ratio:
Dp,max = 5 x (12 000 - 8000) x 0.004 = 80 mm.
Design relative displacement = 50 mm (< 80 mm). The sign board, its frame and the anchor connections must be detailed (e.g. slotted holes or flexible connection at one anchor) to accommodate 50 mm of relative movement without failure."""),
])

Q += case("civil2019", 2, T, C2, items=[
    it("""1. Compute the discharge in L/s from a rectangular intake weir to be constructed across a running stream at the water source: headwater elevation = 501.00 m; crest elevation = 505.50 m (as printed); tailwater elevation = 500.00 m; weir coefficient = 1.84; crest length = 6.00 m; number of end contractions = 0.""", 15,
       [("Note the data error: the printed crest (505.50 m) is above the headwater (501.00 m), so no flow is possible as printed; read the crest as 500.50 m → head H = 501.00 - 500.50 = 0.50 m", 4),
        ("Tailwater (500.00) is below the crest → free (unsubmerged) flow", 2),
        ("Francis formula (SI): Q = C L H^1.5 = 1.84 x 6.0 x 0.5^1.5 (no end contractions, L effective = 6.0 m)", 5),
        ("Q = 3.90 m³/s = 3903 L/s", 4)],
       """Head on the weir: H = headwater - crest. As printed, the crest (505.50 m) is 4.5 m above the headwater (501.00 m), which means no flow over the weir - the crest is evidently meant to be 500.50 m. Then H = 501.00 - 500.50 = 0.50 m.
The tailwater (500.00 m) is below the crest, so the weir flows free (not submerged).
With no end contractions the effective crest length is the full 6.00 m. Francis formula (SI units, C = 1.84): Q = C L H^(3/2) = 1.84 x 6.00 x 0.50^1.5 = 1.84 x 6.00 x 0.3536 = 3.90 m³/s.
Discharge ≈ 3903 L/s.
(If there were n end contractions, L would be reduced to L - 0.1nH.)"""),
    it("""2. If a discharge of 1000 L/s is to be carried in a trapezoidal channel, calculate the normal depth (in mm) using Manning's formula: n = 0.013; bed slope = 0.001; side slopes 1H:1V on both sides; bottom width = 1.20 m. Also state the type of flow.""", 15,
       [("A = (b + zy)y = (1.2 + y)y; P = b + 2y√(1 + z²) = 1.2 + 2.828y; R = A/P", 3),
        ("Manning: Q = (1/n) A R^(2/3) S^(1/2) → 1.0 = (1/0.013)(1.2 + y)y R^(2/3)(0.0316); solve by trial", 4),
        ("Normal depth yn ≈ 0.506 m = 506 mm (A = 0.864 m², R = 0.328 m, V = 1.16 m/s)", 4),
        ("Froude number = V/√(gA/T) = 0.59 < 1 → subcritical (tranquil) flow; critical depth ≈ 0.37 m < yn; uniform flow", 4)],
       """Q = 1.0 m³/s, n = 0.013, S = 0.001, b = 1.20 m, z = 1.
A = (b + z y) y = (1.2 + y) y; P = b + 2y√(1 + z²) = 1.2 + 2.828 y; R = A/P.
Manning: Q = (1/n) A R^(2/3) S^(1/2). AR^(2/3) = Qn/√S = 1.0 x 0.013/0.03162 = 0.411.
Trial: y = 0.50 m → A = 0.85, P = 2.614, R = 0.325, AR^(2/3) = 0.402; y = 0.51 m → A = 0.872, R = 0.330, AR^(2/3) = 0.416. Interpolating, yn ≈ 0.506 m.
Normal depth ≈ 506 mm (A = 0.864 m², P = 2.632 m, R = 0.328 m, V = Q/A = 1.16 m/s).
Type of flow: top width T = b + 2zy = 2.21 m; hydraulic depth D = A/T = 0.39 m; Froude number F = V/√(gD) = 1.16/√(9.81 x 0.39) = 0.59 < 1 → subcritical (tranquil) flow; it is steady uniform flow at normal depth on a mild slope (critical depth ≈ 0.37 m < 0.506 m)."""),
    it("""3. Calculate the frictional loss, residual pressure and hydraulic gradient at chainages 0, 100, 200, ..., 1000 m if 150 L/s is conveyed through a plastic pipe (inner diameter 315 mm, friction loss 0.002 m/m). The ground elevation at the start (chainage 0) is 500.00 m, descending at a uniform slope of 1 in 100. Neglect other losses.""", 20,
       [("Velocity = 0.15/((π/4)0.315²) = 1.92 m/s; friction loss = 0.002 x chainage (0.2 m per 100 m; 2.0 m at 1000 m)", 4),
        ("Hydraulic grade line from 500.00 m at chainage 0 (pressure head 0 at the start): HGL = 500 - 0.002x", 4),
        ("Ground = 500 - 0.01x; residual pressure head = HGL - ground = 0.008x m (0.8 m per 100 m)", 4),
        ("Table: ch 0 - loss 0, HGL 500.0, ground 500.0, pressure 0; ch 100 - 0.2, 499.8, 499.0, 0.8 m; ... ch 1000 - 2.0, 498.0, 490.0, 8.0 m", 6),
        ("Hydraulic gradient = 0.002 (2 m/km) constant; pressure increases downhill", 2)],
       """Velocity in the pipe: V = Q/A = 0.150/((π/4) x 0.315²) = 0.150/0.0779 = 1.92 m/s (acceptable, < 2-3 m/s).
Friction loss: hf = 0.002 m per m of pipe, so cumulative loss = 0.002 x chainage. Hydraulic gradient = 0.002 (2 m per km) throughout.
Taking the hydraulic grade line to start at the ground level of 500.00 m at chainage 0 (zero residual pressure at the start), HGL = 500 - 0.002x, ground level = 500 - 0.01x, and residual pressure head = HGL - ground = 0.008x (m of water).
Chainage (m) | friction loss (m) | HGL (m) | ground (m) | residual pressure (m)
0 | 0.0 | 500.0 | 500.0 | 0.0
100 | 0.2 | 499.8 | 499.0 | 0.8
200 | 0.4 | 499.6 | 498.0 | 1.6
300 | 0.6 | 499.4 | 497.0 | 2.4
400 | 0.8 | 499.2 | 496.0 | 3.2
500 | 1.0 | 499.0 | 495.0 | 4.0
600 | 1.2 | 498.8 | 494.0 | 4.8
700 | 1.4 | 498.6 | 493.0 | 5.6
800 | 1.6 | 498.4 | 492.0 | 6.4
900 | 1.8 | 498.2 | 491.0 | 7.2
1000 | 2.0 | 498.0 | 490.0 | 8.0
The ground falls faster (1 in 100) than the hydraulic gradient (0.002), so the residual pressure rises steadily to 8.0 m (about 78 kPa) at 1000 m. (If the source had a higher water level, add that head to every residual pressure.)"""),
])

for q in Q:
    if q["type"] != "mcq":
        q["issues"] = list(q.get("issues", [])) + ["Calculations and model answers written by Claude: please check before publishing."]
