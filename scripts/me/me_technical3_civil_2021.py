"""ME Technical Paper III (Subject Specialisation Paper), Civil Engineering, BCSE 2021 (written 31 October 2021) - real
paper (PDF sent by the founder). Standard pattern (30 MCQ, 4 short answers, 2 case studies), same as the 2025 Civil
Engineering paper (the latest), so it is ADDED to the paper's pattern. Many MCQs are GATE-style with figures.
Replaced: MCQ 4 (degree of indeterminacy of a frame with an internal hinge - the figure cannot be read with certainty),
7 (chlorine disinfection: Chick's law gives 19.93 min, which is not an option), 17 (two-peg test table can be read two
ways, giving 100 m or 101 m), 19 (options are pictures only), 26 (slip-circle soil properties missing from the figure).
Five new MCQs keep Part I at 30. MCQs 10, 16 and 23 had formula options printed as images: retyped. MCQ 30 is answered
from the curve shapes (K has a peak - general shear; J punching; L local) and was asked again in 2020 (2020 recorded).
Pictures: public/papers/me/tech3-civil-2021-*.png. Part II Q2: R's crash cost is printed as Nu 95000 (perhaps 9500);
the answer uses the printed value and notes the other.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1"
GROUP_TAG = "civil2021"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "civil-engineering"
ADDS_TO_PAPER = True  # 2025 is the latest Civil Engineering paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Civil Engineering"
PATTERN = STANDARD
IMG = "/papers/me/tech3-civil-2021-{}.png"

MCQ = r"""[
{
"n": 1,
"stem": "An inflow hydrograph is routed through a reservoir to produce an outflow hydrograph. The peak flow of the inflow hydrograph is PI and the time of occurrence of the peak if tI. The peak flow of the outflow hydrograph is Po and the time of occurrence of the peak is to. Which of the following statement is correct?",
"opts": [
"PI > Po and tI > to",
"PI > Po and tI < to",
"PI < Po and tI > to",
"PI < Po and tI < to"
]
},
{
"n": 2,
"stem": "The data from a closed traverse survey PQRS (run in the clockwise direction) are given in the table. The closing error of the traverse PQRS (in degrees) is",
"opts": [
"6",
"4",
"5",
"3"
]
},
{
"n": 3,
"stem": "Construction of a new building founded on a clayey soil was completed in January 2010. In January 2014, the average consolidation settlement of the foundation in clay was recorded as 10 mm. The ultimate consolidation settlement was estimated in design as 40 mm. Considering double drainage to occur at the clayey soil site, the expected consolidation settlement in January 2019 (in mm, round off to the nearest integer) will be",
"opts": [
"15",
"10",
"5",
"25"
]
},
{
"n": 4,
"stem": "The degree of static indeterminacy of the plane frame as shown in figure is",
"opts": [
"13",
"14",
"15",
"21"
]
},
{
"n": 5,
"stem": "The critical bending compressive stress in the extreme fibre of a structural steel section is 1000 Mpa. It is given that the yield strength of the steel is 250 Mpa, width of flange is 250 mm and thickness of flange is 15 mm. As per the provisions of IS : 800 -2007, the non-dimensional slenderness ratio of the steel cross-section is",
"opts": [
"0.50",
"0.25",
"0.75",
"2.00"
]
},
{
"n": 6,
"stem": "When a specimen of M25 concrete is loaded to a stress level of 12.5 Mpa, a strain of 500 × 10 −6 is recorded. If this load is allowed to stand for a long time, the strain increases to 1000 × 10 -6 . In accordance with the provisions of IS:456-2000, considering the long-term effects, the effective modulus of elasticity of the concrete (in Mpa) is",
"opts": [
"1250",
"250",
"12500",
"125"
]
},
{
"n": 7,
"stem": "Chlorine is used as the disinfectant in a municipal water treatment plant. It achieves 50 percent of disinfection efficiency measure in terms of killing the indicator microorganisms (E-coil) in 3 minutes. The minimum time required to achieve 99 percent disinfection efficiency would be",
"opts": [
"9.93 minutes",
"19.39 minutes",
"11.93 minutes",
"21.93 minutes"
]
},
{
"n": 8,
"stem": "For a plane stress problem, the state of stress at a point P is represented by the stress element as shown in figure. By how much angle ( ) in degrees the stress element should be rotated in order to get the planes of maximum shear stress?",
"opts": [
"31.7",
"48.3",
"26.6",
"13.3"
]
},
{
"n": 9,
"stem": "A series of perpendicular offsets taken from a curved boundary wall to a straight survey line at an interval of 6 m are 1.22, 1.67, 2.04, 2.34, 2.14, 1.87 and 1.15 m. The area (in m 2, round off to 2 decimal places) bounded by the survey line, curved boundary wall, the first and the last offsets, determined using Simpson’s rule is",
"opts": [
"78.5",
"60.5",
"88.5",
"68.5"
]
},
{
"n": 10,
"stem": "The frame below shows three beam elements OA, OB and OC with identical length L and flexural rigidity EI subjected to an external moment M applied at joint O. the correct set of sending moments that develop at O in the three beam elements OA, OB, and OC respectively is",
"opts": [
"b)",
"",
"d)",
""
]
},
{
"n": 11,
"stem": "In a soil investigation work at a site, Standard Penetration Test (SPT) was conducted at every 1.5 m interval up to 30 m depth. At 3 m depth, the observed number of hammer blows for three successive 150 mm penetrations were 8, 6 and 9 respectively. The SPTN-value at 3 m depth is",
"opts": [
"14",
"15",
"17",
"23"
]
},
{
"n": 12,
"stem": "A planar elastic structure is subjected to uniformly distributed load, as shown in the figure. Neglecting self-weight, the maximum bending moment generated in the structure (in kNm) is",
"opts": [
"48",
"192",
"96",
"24"
]
},
{
"n": 13,
"stem": "Velocity of flow is proportional to the first power of hydraulic gradient in Darcy’s law. The law is applicable to",
"opts": [
"laminar flow in porous media.",
"transitional flow in porous media.",
"turbulent flow in porous media.",
"laminar as well as turbulent flow in porous media."
]
},
{
"n": 14,
"stem": "A vertical retaining wall of 5 m height has to support soil having unit weight of 18 kN/m3, effective cohesion of 12 kN/m2, and effective friction angle of 30°. As per Rankine’s earth pressure theory and assuming that a tension crack has occurred, the lateral active thrust on the wall per meter length (in kN/m) is",
"opts": [
"16.144",
"21.714",
"32.288",
"65.265"
]
},
{
"n": 15,
"stem": "During the process of hydration of cement, due to increase in Dicalcium Silicate (C2S) content in cement clinker, the heat of hydration",
"opts": [
"does not change.",
"initially decreases and then increases.",
"increases.",
"decreases."
]
},
{
"n": 16,
"stem": "A cantilever beam PQ of uniform flexural rigidity (EI) is subjected to a concentrated moment M at R as shown in the figure. The deflection at the free end Q is",
"opts": [
"b)",
"",
"d)",
""
]
},
{
"n": 17,
"stem": "The following measurements were made during testing a levelling instrument. P1 is closed to P and Q1 is closed to Q. If the reduced level of station P is 100.0000 m, the reduced level of station Q is Staff reading at",
"opts": [
"101.000 m Instrument at A",
"99.000 m P1 Q1",
"100.000 m P 2.800 m 1.700 m",
"102.000 m Q 2.700 m 1.800 m"
]
},
{
"n": 18,
"stem": "The probability that a 50 year flood may NOT occur at all during 25 years life of a project is",
"opts": [
"0.5",
"0.6",
"0.7",
"0.8"
]
},
{
"n": 19,
"stem": "A rectangular RCC column with dimensions as (B x D) has been subjected to uni-axial bending moment M and axial load P. Characteristic strength of concrete is fck. Which among the following column design curves shows the relation between M (x-axis) and P (y-axis qualitatively?",
"opts": [
"",
"",
"",
""
]
},
{
"n": 20,
"stem": "The speed density relationship for a road section is shown in the figure. The shape of the flow- density relationship is",
"opts": [
"piecewise linear.",
"parabolic.",
"initially linear then parabolic.",
"initially parabolic then linear."
]
},
{
"n": 21,
"stem": "The width of a square footing and the diameter of circular footing are equal. If both the footings are placed on the surface of sandy soil, the ratio of the ultimate bearing capacity of circular footing to that of square footing will be",
"opts": [
"3/4",
"4/3",
"1",
"2/3"
]
},
{
"n": 22,
"stem": "A simply supported beam with a gradually varying load from zero at ‘B’ and ‘w’ per unit length at ‘A’ is shown in the figure below. The shear force at ‘B’ is equal to",
"opts": [
"wl/6",
"wl/3",
"wl",
"2wl/3"
]
},
{
"n": 23,
"stem": "The target mean strength fcm for concrete mix design obtained from the characteristic strength fck and standard deviation σ, as defined in IS:456-2000 is",
"opts": [
"b)",
"",
"d)",
""
]
},
{
"n": 24,
"stem": "The ratio of the plastic moment capacity of a beam section to its yield moment capacity is termed as",
"opts": [
"Aspect ratio",
"Load factor",
"Shape factor",
"Slenderness ratio"
]
},
{
"n": 25,
"stem": "The state of stress represented by Mohr’s circle shown in the figure is",
"opts": [
"hydrostatic stress",
"pure shear",
"uniaxial tension",
"biaxial tension of equal magnitude"
]
},
{
"n": 26,
"stem": "The critical slip circle for a slope is shown below along with the soil properties. The length of the arc of the slip circle is 15.6m and the area of soil within the slip circle is 82m 2. The radius of the slip circles is 10.3m. The factor of safety against the slip circle failure is nearly equal to",
"opts": [
"1.05",
"1.22",
"0.78",
"1.28"
]
},
{
"n": 27,
"stem": "For an open channel flow to take place between two sections",
"opts": [
"the total energy at the upstream end must be larger than the downstream end.",
"the channel bed must always slope in the direction of the flow.",
"the upstream depth must be larger than the downstream depth.",
"the upstream momentum must be larger than the downstream momentum."
]
},
{
"n": 28,
"stem": "A retaining wall of height H with smooth vertical back face supports a backfill inclined at an angle β with the horizontal. The backfill consists of cohesion less soil having angle of internal friction ϕ. If the active lateral thrust acting on the wall is Pa, which one of the following statements is TRUE?",
"opts": [
"Pa acts at a height H/3 from the base of the wall and at an angle ϕ with the horizontal.",
"Pa acts at a height H/2 from the base of the wall and at an angle ϕ with the horizontal",
"Pa acts at a height H/3 from the base of the wall and at an angle β with the horizontal",
"Pa acts at a height H/2 from the base of the wall and at an angle β with the horizontal"
]
},
{
"n": 29,
"stem": "The sketch shows a column with a pin at the base and rollers at the top. It is subjected to an axial force P and a moment M at mid-height. The reaction(s) at R is/are",
"opts": [
"a vertical force equal to P",
"a vertical force equal to P and a horizontal force equal to M/h",
"a vertical force equal to P/2",
"a vertical force equal to P/2 and a horizontal force equal to M/h"
]
},
{
"n": 30,
"stem": "Group I contains representative load-settlement curves for different modes of bearing capacity failures of sandy soil. Group II enlists the various failure characteristics. Match the load- settlement curves with the corresponding failure characteristics Group I Group II P Curve J 1 No apparent heaving of soil around the footing Q Curve K 2 Rankine's passive zone develops imperfectly R Curve L 3 Well defined slip surface extends to ground surface",
"opts": [
"P-1, Q-2, R-3",
"P-3, Q-2, R-1",
"P-3, Q-1, R-2",
"P-1, Q-3, R-2"
]
}
]"""

FIX = {
    2: {"stem": "The data from a closed traverse survey PQRS (run in the clockwise direction) are given below (line: included angle) - PQ: 88°, QR: 92°, RS: 94°, SP: 89°. The closing error of the traverse PQRS (in degrees) is"},
    8: {"image": IMG.format("m8")},
    10: {"opts": ["{3M/8, M/8, 4M/8}", "{3M/11, 4M/11, 4M/11}", "{M/3, M/3, M/3}", "{3M/7, 0, 4M/7}"], "image": IMG.format("m10"),
         "stem": "The frame shown in the figure has three beam elements OA, OB and OC with identical length L and flexural rigidity EI, subjected to an external moment M applied at joint O (A is pinned, B is free, C is fixed). The correct set of moments {MOA, MOB, MOC} that develop at O in the three elements OA, OB and OC respectively is"},
    12: {"image": IMG.format("m12")},
    16: {"opts": ["ML²/6EI", "ML²/4EI", "3ML²/8EI", "3ML²/4EI"], "image": IMG.format("m16")},
    20: {"image": IMG.format("m20")},
    22: {"image": IMG.format("m22")},
    23: {"opts": ["fck + 1.35σ", "fck + 1.45σ", "fck + 1.55σ", "fck + 1.65σ"]},
    25: {"image": IMG.format("m25")},
    29: {"image": IMG.format("m29")},
    30: {"image": IMG.format("m30"),
         "stem": "Group I contains representative load-settlement curves (see the figure) for different modes of bearing capacity failure of sandy soil. Group II lists the various failure characteristics. Match the load-settlement curves with the corresponding failure characteristics.\nGroup I: P - Curve J; Q - Curve K; R - Curve L.\nGroup II: 1 - No apparent heaving of soil around the footing; 2 - Rankine's passive zone develops imperfectly; 3 - Well defined slip surface extends to ground surface.",
         "opts": ["P-1, Q-2, R-3", "P-3, Q-2, R-1", "P-3, Q-1, R-2", "P-1, Q-3, R-2"]},
}
KEY = {
    1: ("b", "Reservoir storage attenuates and delays the flood: the outflow peak is lower and occurs later (PI > Po, tI < to)."),
    2: ("d", "Sum of interior angles of a 4-sided closed traverse = (2n - 4) x 90° = 360°; observed 88 + 92 + 94 + 89 = 363°, so the closing error is 3°."),
    3: ("a", "For U < 60 %, Tv = (π/4)U², so U ∝ √t. After 4 years U = 10/40 = 25 %; after 9 years U = 25 % x √(9/4) = 37.5 % → 0.375 x 40 = 15 mm."),
    5: ("a", "IS 800: λLT = √(fy/fcr,b) = √(250/1000) = 0.5."),
    6: ("c", "Long-term (effective) modulus = stress/total strain = 12.5/(1000 x 10⁻⁶) = 12 500 MPa (= Ec/(1 + θ) with creep coefficient θ = 1)."),
    8: ("a", "σx = 80 (tension), σy = -20 (compression), τ = 25 MPa: tan 2θp = 2τ/(σx - σy) = 0.5 → θp = 13.3°; maximum shear planes are at 45° from the principal planes: 13.3 - 45 = -31.7°, i.e. a rotation of 31.7°."),
    9: ("d", "Simpson's rule (6 intervals of 6 m): A = (6/3)[(1.22 + 1.15) + 4(1.67 + 2.34 + 1.87) + 2(2.04 + 2.14)] = 2 x 34.25 = 68.50 m²."),
    10: ("d", "Stiffness at O: OA pinned at A → 3EI/L; OB free at B → 0; OC fixed → 4EI/L. Distribution factors 3/7, 0, 4/7, so MOA = 3M/7, MOB = 0, MOC = 4M/7."),
    11: ("b", "The first 150 mm is seating drive and is ignored: N = 6 + 9 = 15."),
    12: ("c", "With HA = 0 (B on rollers) the arch acts as a simply supported curved beam: Mmax = wL²/8 = 12 x 8²/8 = 96 kNm."),
    13: ("a", "Darcy's law (v = ki) holds for laminar flow in porous media (Reynolds number below about 1)."),
    14: ("b", "Ka = 1/3; tension crack depth zc = 2c/(γ√Ka) = 2 x 12/(18 x 0.577) = 2.31 m; pressure at base = KaγH - 2c√Ka = 30 - 13.86 = 16.14 kPa; thrust = ½ x 16.14 x (5 - 2.31) = 21.71 kN/m."),
    15: ("d", "C2S hydrates slowly with low heat (about 260 J/g vs 500 J/g for C3S): more C2S lowers the heat of hydration."),
    16: ("c", "Moment M at mid-length R: θR = M(L/2)/EI, δR = M(L/2)²/2EI = ML²/8EI; δQ = δR + θR x L/2 = ML²/8EI + ML²/4EI = 3ML²/8EI."),
    18: ("b", "p = 1/50 = 0.02; probability of no occurrence in 25 years = (1 - 0.02)²⁵ = 0.603 ≈ 0.6."),
    20: ("c", "q = k v: while speed is constant q rises linearly with density; once speed falls linearly with density, q = k(a - bk) is a parabola."),
    21: ("a", "For a surface footing on sand qu depends on the Nγ term: square 0.4γBNγ, circular 0.3γBNγ → ratio 3/4."),
    22: ("a", "Total load wl/2 acts at l/3 from A: RB = (wl/2)(l/3)/l = wl/6, which is the shear force at B."),
    23: ("d", "IS 456 / IS 10262: target mean strength = fck + 1.65σ (5 % of results may fall below fck)."),
    24: ("c", "Shape factor = plastic moment Mp / yield moment My (= Zp/Ze; 1.5 for a rectangle, about 1.12-1.14 for I-sections)."),
    25: ("b", "A Mohr's circle centred at the origin has σ1 = -σ2 = τmax: the state of pure shear."),
    27: ("a", "Flow in an open channel always goes from higher to lower total energy; the bed may be adverse and the depth may increase downstream."),
    28: ("c", "For a smooth vertical wall with backfill sloping at β (Rankine), the active thrust acts at H/3 above the base, parallel to the backfill surface (at β to the horizontal)."),
    29: ("b", "The roller at Q gives only a horizontal reaction, so R carries the vertical force P; the applied moment M is balanced by equal and opposite horizontal reactions M/h at Q and R."),
    30: ("d", "Curve K has a clear peak - general shear (3); curve J (loose sand, low load, settlement keeps increasing) - punching shear, no heaving (1); curve L without a clear peak - local shear, passive zone imperfect (2)."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T, FIX) + [
    new_mcq(1, T, "As per IS 456:2000, the maximum strain in concrete at the outermost compression fibre in the limit state of collapse in flexure is taken as",
            ["0.002", "0.0035", "0.003", "0.0045"], "b", "IS 456 cl 38.1 (a): 0.0035 in bending (0.002 under axial compression)."),
    new_mcq(2, T, "In the IS soil classification system, a fine-grained soil with a liquid limit greater than 50 percent is described as having",
            ["low compressibility", "intermediate compressibility", "high compressibility", "no plasticity"], "c", "IS 1498: L < 35 %, I 35-50 %, H > 50 % liquid limit (e.g. CH, MH)."),
    new_mcq(3, T, "In the Greenshields traffic model with free-flow speed vf and jam density kj, the maximum flow (capacity) of the road is",
            ["vf kj", "vf kj / 2", "vf kj / 4", "2 vf kj"], "c", "q = vf k(1 - k/kj) is maximum at k = kj/2 and v = vf/2: qmax = vf kj/4."),
    new_mcq(4, T, "For a waste with ultimate first-stage BOD L0 and deoxygenation rate constant k (base e, per day), the 5-day BOD is",
            ["L0 e^(-5k)", "L0 (1 - e^(-5k))", "L0 (1 - e^(-k/5))", "5 k L0"], "b", "BOD exerted in t days: BODt = L0(1 - e^(-kt)); L0 e^(-kt) is the BOD remaining."),
    new_mcq(5, T, "For a beam fixed at both ends with span L carrying a central point load W, the fixed-end moment at each support is",
            ["WL/4", "WL/8", "WL/12", "WL/16"], "b", "Fixed-end moment = WL/8 (hogging) at each end and WL/8 sagging at mid-span; for a UDL w it is wL²/12."),
]

Q += [
    saq(1, T, "A circular log of timber has diameter D. Find the strongest section of the rectangular timber beam that can be cut from this piece of log to resist the moment.",
        [("Strength in bending ∝ section modulus Z = bd²/6, with b² + d² = D²", 1),
         ("Z = b(D² - b²)/6; dZ/db = (D² - 3b²)/6 = 0 → b = D/√3", 2),
         ("d = √(D² - b²) = √(2/3) D = 0.816 D; d/b = √2 (depth:breadth ≈ 1.41)", 1),
         ("Zmax = D³/(9√3) ≈ 0.064 D³", 1)],
        """The moment of resistance M = f Z, so the strongest beam has the largest section modulus Z = bd²/6, where b is the breadth and d the depth of the rectangle inscribed in the circle: b² + d² = D².
Z = b(D² - b²)/6. For a maximum, dZ/db = (D² - 3b²)/6 = 0 → b = D/√3 = 0.577 D.
Then d² = D² - D²/3 = 2D²/3 → d = √(2/3) D = 0.816 D. So d/b = √2 ≈ 1.414.
(d²Z/db² = -b < 0, confirming a maximum.)
Maximum section modulus Zmax = (D/√3)(2D²/3)/6 = D³/(9√3) ≈ 0.064 D³.
Answer: the strongest rectangular beam has breadth D/√3 and depth √(2/3) D (depth/breadth = √2)."""),
    saq(2, T, """The network of a small construction project awarded to a contractor is shown in the figure. The normal duration, crash duration, normal cost and crash cost of all activities are given below. The indirect cost incurred by the contractor is Nu 5000 per day. If the project is to be completed in sixteen (16) days, find the total cost that would be incurred by the contractor.
Activity (normal duration, crash duration in days; normal cost, crash cost in Nu): P (6, 4; 15000, 25000); Q (5, 2; 6000, 12000); R (5, 3; 8000, 95000); S (6, 3; 7000, 10000); T (3, 2; 6000, 9000); U (2, 1; 4000, 6000); V (4, 2; 20000, 28000).
Network: P precedes Q, R and S; U follows Q; T follows R; V follows S, T and U.""",
        [("Paths: P-Q-U-V = 17, P-S-V = 16, P-R-T-V = 18 days (critical); normal direct cost Nu 66 000", 1),
         ("Cost slopes (Nu/day): P 5000, Q 2000, R 43 500, S 1000, T 3000, U 2000, V 4000", 1),
         ("18 → 17 days: crash T by 1 day (cheapest on the critical path P-R-T-V) + Nu 3000; now P-R-T-V and P-Q-U-V both 17", 1),
         ("17 → 16 days: crash V by 1 day (common to both critical paths, Nu 4000 < R + Q/U = 45 500) + Nu 4000", 1),
         ("Total = direct 66 000 + 7000 + indirect 16 x 5000 = Nu 153 000 (if R's crash cost were Nu 9500: crash R twice + U, total Nu 149 500)", 1)],
        """1. Paths and durations: P-Q-U-V = 6 + 5 + 2 + 4 = 17 days; P-S-V = 6 + 6 + 4 = 16 days; P-R-T-V = 6 + 5 + 3 + 4 = 18 days (critical). Normal project duration = 18 days.
2. Normal direct cost = 15 000 + 6000 + 8000 + 7000 + 6000 + 4000 + 20 000 = Nu 66 000.
3. Cost slope = (crash cost - normal cost)/(normal - crash duration): P = 10 000/2 = 5000; Q = 6000/3 = 2000; R = 87 000/2 = 43 500 (as printed); S = 3000/3 = 1000; T = 3000/1 = 3000; U = 2000/1 = 2000; V = 8000/2 = 4000 Nu/day.
4. Crash 18 → 17 days: only P-R-T-V is critical; the cheapest activity on it is T (Nu 3000/day), crash T by 1 day (to its limit of 2 days). Now P-R-T-V = 17 and P-Q-U-V = 17.
5. Crash 17 → 16 days: both paths must be shortened. Options: P (common, 5000), V (common, 4000), or R plus Q/U (43 500 + 2000). Cheapest is V by 1 day: Nu 4000. Durations: 16, 16, 15.
6. Direct cost = 66 000 + 3000 + 4000 = Nu 73 000. Indirect cost = 16 x 5000 = Nu 80 000.
Total cost for completion in 16 days = 73 000 + 80 000 = Nu 153 000. (Compared with the normal 18 days: 66 000 + 90 000 = Nu 156 000, so crashing to 16 days also saves money.)
Note: if R's crash cost is a misprint for Nu 9500 (slope 750), crash R twice and U once: direct 66 000 + 750 + 750 + 2000 = 69 500, total Nu 149 500.""", image=IMG.format("network")),
    saq(3, T, "A portal frame shown in the figure has a hinge support at joint P and a roller support at joint R. PQ is horizontal (5 m) and QR vertical (10 m). A point load of 50 kN acts at joint R in the horizontal direction. The flexural rigidity EI of each member is 1 x 10⁶ kNm². Under the applied load, find the horizontal displacement of joint R.",
        [("Reactions: HP = 50 kN; ΣMP = 0: VR x 5 + 50 x 10 = 0 → VR = 100 kN downward, VP = 100 kN upward", 1),
         ("BM: QR M = 50y (0 to 500 kNm at Q); PQ M = 100x (0 at P to 500 kNm at Q)", 1),
         ("Unit horizontal load at R: m = M/50 (QR: y; PQ: 2x)", 1),
         ("δ = Σ∫Mm dx/EI = [∫₀¹⁰ 50y² dy + ∫₀⁵ 200x² dx]/EI = (16 667 + 8333)/EI = 25 000/EI", 1.5),
         ("δR = 25 000/10⁶ = 0.025 m = 25 mm (in the direction of the load)", 0.5)],
        """Reactions: the roller at R gives only a vertical reaction, so the hinge at P takes the horizontal force: HP = 50 kN (opposite to the load). Taking moments about P (R is 5 m to the right of and 10 m below P): VR x 5 + 50 x 10 = 0 → VR = -100 kN (i.e. 100 kN downward); VP = 100 kN upward.
Bending moments: member RQ (y measured up from R): M = 50y, from 0 at R to 500 kNm at Q. Member PQ (x from P): M = 100x, from 0 at P to 500 kNm at Q (joint equilibrium ✓).
Unit load method: apply a unit horizontal load at R; the moments are m = M/50: RQ: m = y; PQ: m = 2x.
δR = Σ ∫ M m dx/EI = (1/EI)[∫₀¹⁰ (50y)(y) dy + ∫₀⁵ (100x)(2x) dx] = (1/EI)[50 x 1000/3 + 200 x 125/3] = (16 666.7 + 8333.3)/EI = 25 000/EI.
With EI = 1 x 10⁶ kNm²: δR = 0.025 m = 25 mm, in the direction of the 50 kN load.""", image=IMG.format("frame-pqr")),
    saq(4, T, "Three reservoirs P, Q and R are interconnected by pipes as shown in the figure. The piezometric head at the junction S of the pipes is 100 m. Take g = 9.81 m/s² and density of water 1000 kg/m³. The pipe from S to reservoir R is 180 m long and 45 cm in diameter; the pipes from P and Q are 30 cm in diameter with flow velocities 2.56 m/s and 1.98 m/s. Considering head loss due to friction only (friction factor 0.03 for all pipes), find the height of the water level in the lowermost reservoir R with respect to the datum.",
        [("P (109 m) and Q (106 m) are above the junction head (100 m), so both supply S; all flow goes to R", 1),
         ("QP = (π/4)(0.3)² x 2.56 = 0.181 m³/s; QQ = (π/4)(0.3)² x 1.98 = 0.140 m³/s; QR = 0.321 m³/s", 1.5),
         ("Velocity in SR: v = 0.321/((π/4)(0.45)²) = 2.02 m/s", 1),
         ("hf = f L v²/(2gD) = 0.03 x 180 x 2.02²/(2 x 9.81 x 0.45) = 2.49 m", 1),
         ("Water level in R = 100 - 2.49 = 97.51 m above datum", 0.5)],
        """Reservoirs P (water level 109 m) and Q (106 m) are both above the piezometric head at S (100 m), so both supply the junction and the combined flow goes to R (continuity at S).
Discharges: area of a 30 cm pipe = (π/4)(0.30)² = 0.0707 m². QP = 0.0707 x 2.56 = 0.181 m³/s; QQ = 0.0707 x 1.98 = 0.140 m³/s. QR = 0.181 + 0.140 = 0.321 m³/s.
Velocity in pipe SR (45 cm): area = (π/4)(0.45)² = 0.159 m²; v = 0.321/0.159 = 2.02 m/s.
Friction loss (Darcy-Weisbach): hf = f L v²/(2 g D) = 0.03 x 180 x 2.02²/(2 x 9.81 x 0.45) = 5.4 x 4.07/8.83 = 2.49 m.
Water level in R = piezometric head at S - hf = 100 - 2.49 = 97.51 m above the datum (exit loss neglected as only friction is considered).""", image=IMG.format("reservoirs")),
]

C1 = """Case I: Approximate lateral-load analysis of a building frame
You are recruited by a structural design consultancy as an assistant structural designer. The immediate task is to analyse a building frame and verify the results with software. Analyse the given building frame (see the figure) for lateral load by an approximate method.
Frame: three bays of 6.0 m (column lines A, B, C, D); two storeys - ground storey 5.0 m (columns I-E, J-F, K-G, L-H, fixed at the base) and first storey 4.0 m (E-A, F-B, G-C, H-D). Lateral loads: 120 kN at first-floor level (E) and 60 kN at roof level (A). Columns 450 x 450 mm, beams 275 x 450 mm; RC slab 175 mm thick at both floors. Concrete M25, Ec = 5000 √fck."""
C2 = """Case II: Sway analysis of a portal frame with an inclined leg (moment distribution)
You are directed to analyse a portal frame (see the figure) to compare with the results of a computer model, using the moment distribution method and superimposing the responses from non-sway and sway analyses. Assume EIΔ = 100 to get the moments from the sway analysis.
Frame: A and D fixed. Column AB vertical, 4.0 m; beam BC horizontal, 4.0 m, with a 10 kN vertical point load at its mid-point; leg CD inclined - D is 2.0 m to the right of C and 4.0 m below it (length √20 = 4.472 m). A horizontal load of 50 kN acts at B. EI is the same for all members. Clockwise moments are taken as positive below."""


def it(q, m, kp, mod): return (q, m, kp, mod)


Q += case("civil2021", 1, T, C1, image=IMG.format("case1"), items=[
    it("1. The stiffness of the structural frame.", 7,
       [("Ec = 5000√25 = 25 000 MPa; Icol = 450⁴/12 = 3.42 x 10⁹ mm⁴", 2),
        ("Column lateral stiffness (fixed ends, rigid beams) k = 12EI/h³", 2),
        ("Ground storey (h = 5 m): 8201 kN/m per column → 4 columns 32 805 kN/m", 1.5),
        ("First storey (h = 4 m): 16 018 kN/m per column → 64 072 kN/m", 1.5)],
       """Modulus of elasticity Ec = 5000 √fck = 5000 √25 = 25 000 N/mm² (2.5 x 10⁷ kN/m²).
Column moment of inertia I = b d³/12 = 450 x 450³/12 = 3.417 x 10⁹ mm⁴ (3.417 x 10⁻³ m⁴).
Assuming the floors (beams with slab) are rigid in their own plane and much stiffer than the columns (shear-building idealisation), the lateral stiffness of a column fixed at both ends is k = 12 EI/h³.
EI = 2.5 x 10⁷ x 3.417 x 10⁻³ = 85 430 kNm².
Ground storey (h = 5 m): k = 12 x 85 430/125 = 8201 kN/m per column; storey stiffness K1 = 4 x 8201 = 32 805 kN/m.
First storey (h = 4 m): k = 12 x 85 430/64 = 16 018 kN/m per column; storey stiffness K2 = 4 x 16 018 = 64 072 kN/m.
(The actual stiffness is lower because the beams are flexible; this is an upper bound used for the approximate analysis.)"""),
    it("2. The fundamental natural period of the building frame.", 7,
       [("Height h = 5 + 4 = 9 m; RC moment resisting frame without infill (IS 1893:2016 cl 7.6.2 a)", 2),
        ("Ta = 0.075 h^0.75 = 0.075 x 9^0.75 = 0.39 s", 3),
        ("Note: a dynamic estimate T = 2π√(m/k) needs the floor masses (slab, beams, columns, finishes), which are not given in full; the code formula is used", 2)],
       """The frame is a bare RC moment resisting frame (no infill shown). By IS 1893 (Part 1): 2016 cl 7.6.2 (a): Ta = 0.075 h^0.75, with h = 5 + 4 = 9 m.
Ta = 0.075 x 9^0.75 = 0.075 x 5.196 = 0.39 s.
(A dynamic estimate from T = 2π√(m/k) with the storey stiffnesses above would need the seismic masses of each floor - slab 0.175 x 25 = 4.4 kN/m² plus beams, columns, finishes and part of the live load over the tributary width - which are not fully defined in the case, so the code formula is used.)"""),
    it("3. Shear force in each structural member (portal method).", 14,
       [("Portal method: points of contraflexure at mid-height of columns and mid-span of beams; interior columns take twice the shear of exterior columns", 3),
        ("Storey shears: top 60 kN, ground 60 + 120 = 180 kN; shares 1:2:2:1 (÷6)", 2),
        ("Column shears: top storey - exterior 10 kN, interior 20 kN; ground storey - exterior 30 kN, interior 60 kN", 4),
        ("Beam shears: roof beams 20 x 2/6 = 6.67 kN; first-floor beams (20 + 75) x 2/6 = 31.67 kN", 3),
        ("Column axial forces: exterior columns ±6.67 kN (top) and ±38.33 kN (ground) (tension windward, compression leeward); interior columns 0", 2)],
       """Portal method assumptions: (1) points of contraflexure at mid-height of all columns and at mid-span of all beams; (2) each interior column takes twice the horizontal shear of an exterior column (each bay acts as a portal).
Storey shears: first (top) storey V2 = 60 kN; ground storey V1 = 60 + 120 = 180 kN. With 3 bays, exterior : interior : interior : exterior = 1 : 2 : 2 : 1 (total 6 parts).
Column shears:
Top storey: exterior columns AE, DH = 60/6 = 10 kN; interior columns BF, CG = 20 kN.
Ground storey: exterior EI, HL = 180/6 = 30 kN; interior FJ, GK = 60 kN.
Column end moments (= shear x h/2) are needed for the beam shears: top storey exterior 10 x 2 = 20 kNm, interior 40 kNm; ground storey exterior 30 x 2.5 = 75 kNm, interior 150 kNm.
Beam shears (beam end moment x 2/L):
Roof beams AB, BC, CD: end moment at A = 20 kNm → shear = 20/3 = 6.67 kN (each roof beam).
First-floor beams EF, FG, GH: end moment at E = 20 + 75 = 95 kNm → shear = 95/3 = 31.67 kN (each).
Axial forces: exterior columns carry the accumulated beam shears - top storey 6.67 kN, ground storey 6.67 + 31.67 = 38.33 kN (tension on the windward side A-E-I, compression on the leeward side D-H-L); interior columns 0 (beam shears cancel)."""),
    it("4. Bending moment in the structural members.", 14,
       [("Column moments = shear x h/2 at top and bottom: top storey exterior 20 kNm, interior 40 kNm", 4),
        ("Ground storey: exterior 75 kNm, interior 150 kNm (also the base moments at I, J, K, L)", 4),
        ("Roof beams: end moments 20 kNm at every joint (joint equilibrium: interior joints 40 = 20 + 20)", 3),
        ("First-floor beams: end moments 95 kNm (exterior joint 20 + 75; interior joint 40 + 150 = 190 = 95 + 95)", 3)],
       """Columns (moment = column shear x half the storey height, equal at top and bottom, zero at mid-height):
Top storey (h/2 = 2 m): exterior AE, DH = 10 x 2 = 20 kNm; interior BF, CG = 20 x 2 = 40 kNm.
Ground storey (h/2 = 2.5 m): exterior EI, HL = 30 x 2.5 = 75 kNm; interior FJ, GK = 60 x 2.5 = 150 kNm. The base moments at I and L are 75 kNm and at J and K 150 kNm.
Beams (from joint equilibrium, beam moments are zero at mid-span):
Roof: at A, beam AB = column moment 20 kNm; at B, 40 kNm is shared 20 + 20; so every roof beam end moment = 20 kNm.
First floor: at E, beam EF = 20 (column above) + 75 (column below) = 95 kNm; at F, 40 + 150 = 190 = 95 + 95; so every first-floor beam end moment = 95 kNm."""),
    it("5. Draw the bending moment diagram for the building frame.", 8,
       [("Columns: straight lines, zero at mid-height, with the values above at the top and bottom of each column (opposite faces)", 3),
        ("Beams: straight lines, zero at mid-span; 20 kNm at roof beam ends, 95 kNm at first-floor beam ends", 3),
        ("Antisymmetric pattern consistent with sway to the right; larger moments in interior columns and the ground storey", 2)],
       """The BMD under lateral load is antisymmetric in every member:
Columns: each column moment varies linearly from +value at one end to -value at the other, passing through zero at mid-height - top storey exterior ±20, interior ±40 kNm; ground storey exterior ±75, interior ±150 kNm (base moments 75/150/150/75 kNm).
Beams: each beam moment varies linearly from one end to the other through zero at mid-span - roof beams ±20 kNm, first-floor beams ±95 kNm.
Draw on the tension faces: with the loads acting to the right, the windward face of each column is in tension at the base and the leeward face at the top in each storey, giving the familiar 'zig-zag' sway pattern. Maximum moments occur at the bases of the interior columns (150 kNm) and at the first-floor beam ends (95 kNm)."""),
])

Q += case("civil2021", 2, T, C2, image=IMG.format("case2"), items=[
    it("1. Fixed end moments from the external loading.", 2.5,
       [("Only BC is loaded: FEM = WL/8 = 10 x 4/8 = 5 kNm: MFBC = -5 kNm, MFCB = +5 kNm; AB, CD zero (the 50 kN joint load causes no FEM)", 2.5)],
       """Only beam BC carries a span load (10 kN at mid-span, L = 4 m): MFBC = -WL/8 = -10 x 4/8 = -5.0 kNm; MFCB = +5.0 kNm.
Members AB and CD carry no span loads, so their FEMs are zero; the 50 kN load acts at joint B and is handled in the sway analysis."""),
    it("2. Relative stiffness and distribution factors.", 2.5,
       [("Stiffness k = 4EI/L: AB = EI, BC = EI, CD = 4EI/4.472 = 0.894EI (relative I/L: 0.25, 0.25, 0.224)", 1),
        ("DF at B: BA 0.5, BC 0.5; at C: CB 1/1.894 = 0.528, CD 0.472; fixed ends A, D: 0", 1.5)],
       """Lengths: AB = 4 m, BC = 4 m, CD = √(2² + 4²) = 4.472 m. All far ends are fixed or continuous, so k = 4EI/L: kAB = EI, kBC = EI, kCD = 0.894 EI (relative I/L = 0.25 : 0.25 : 0.224).
Distribution factors:
Joint B: DFBA = 1/(1 + 1) = 0.5, DFBC = 0.5.
Joint C: DFCB = 1/(1 + 0.894) = 0.528, DFCD = 0.894/1.894 = 0.472.
Joints A and D are fixed (DF = 0); carry-over factor = 1/2."""),
    it("3. Non-sway moments from moment distribution.", 7.5,
       [("Balance and carry over (sway prevented by a horizontal restraint at C/B level) until converged", 3),
        ("Results (clockwise +): MAB = +1.69, MBA = +3.38, MBC = -3.38, MCB = +3.16, MCD = -3.16, MDC = -1.58 kNm", 4.5)],
       """With a horizontal restraint preventing sway, distribute the FEMs (-5 at B on BC, +5 at C on CB):
Cycle 1: balance B (+5 x 0.5 → BA +2.5, BC +2.5) and C (-5 → CB -2.64, CD -2.36); carry over half to the far ends (AB +1.25, CB +1.25, BC -1.32, DC -1.18); repeat balancing until the joint unbalances are negligible.
Converged non-sway moments (kNm, clockwise positive):
MAB = +1.69, MBA = +3.38, MBC = -3.38, MCB = +3.16, MCD = -3.16, MDC = -1.58.
(Joint checks: MBA + MBC = 0, MCB + MCD = 0.)"""),
    it("4. Compute the imaginary force 'P' required to prevent sway (keep the support at the beam level 'C' intact).", 5,
       [("Column shears from the non-sway moments: HA = (MAB + MBA)/4; inclined leg: horizontal reaction at D from moments about C including the vertical reaction (leg is inclined)", 2),
        ("Restraint force due to the 10 kN load ≈ 2.39 kN (acting to the right, i.e. the frame would sway left)", 2),
        ("With the 50 kN at B, the net restraint = 50 - 2.39 = 47.61 kN, which must be released in the sway analysis", 1)],
       """From the non-sway moments, find the horizontal reactions: column AB: HA = (MAB + MBA)/4 = (1.69 + 3.38)/4 = 1.27 kN. For the inclined leg CD the horizontal reaction at D is found from moments about C using both the vertical reaction at D (from the beam end shear) and the leg moments, because the leg is inclined.
Horizontal equilibrium of the whole restrained frame then gives the imaginary holding force due to the 10 kN load: P ≈ 2.39 kN (the restraint pushes to the right; without it the frame would sway to the left).
Since the actual frame also carries 50 kN to the right at B, the net force that the restraint would have to resist is 50 - 2.39 = 47.61 kN; this force is applied in the reverse direction in the sway analysis (the frame sways to the right)."""),
    it("5. Fixed end moments due to deflection of the frame by an amount Δ (EIΔ = 100).", 7.5,
       [("Sway Δ of B and C to the right: C moves perpendicular to DC, so C also rises Δ/2 (relative to B)", 2),
        ("AB: FEM = -6EIΔ/L² = -6 x 100/16 = -37.5 kNm at both ends", 2),
        ("CD: relative perpendicular displacement = Δ√(1 + 0.25) = 1.118Δ; FEM = -6EI(1.118Δ)/4.472² = -33.54 kNm at both ends", 2),
        ("BC: relative displacement Δ/2 (C up): FEM = +6EI(Δ/2)/16 = +18.75 kNm at both ends", 1.5)],
       """Let B and C sway horizontally by Δ (to the right). B moves perpendicular to AB (horizontally). C must move perpendicular to DC: DC has direction (-2, 4), so C moves along (4, 2), i.e. horizontally Δ and vertically Δ/2 (upwards). Hence:
AB: relative transverse displacement Δ over 4 m (chord rotates clockwise): MFAB = MFBA = -6EIΔ/L² = -6 x 100/16 = -37.5 kNm.
CD: C moves Δ√(1² + 0.5²) = 1.118Δ perpendicular to CD (length 4.472 m, L² = 20): MFCD = MFDC = -6 EI(1.118Δ)/20 = -0.3354 x 100 = -33.54 kNm.
BC: C rises Δ/2 relative to B (chord rotates anticlockwise): MFBC = MFCB = +6EI(0.5Δ)/16 = +18.75 kNm."""),
    it("6. Sway moments from moment distribution.", 10,
       [("Distribute the sway FEMs with the same DFs and carry-over factors until converged", 4),
        ("Sway moments (EIΔ = 100, clockwise +): MAB = -33.53, MBA = -29.55, MBC = +29.55, MCB = +28.43, MCD = -28.43, MDC = -30.99 kNm", 6)],
       """Distribute the sway fixed-end moments (AB -37.5/-37.5, BC +18.75/+18.75, CD -33.54/-33.54) using the same distribution factors (B: 0.5/0.5; C: 0.528/0.472) and carry-over 1/2, with the joints free to rotate but the sway held at Δ.
Converged sway moments (kNm, clockwise positive, for EIΔ = 100):
MAB = -33.53, MBA = -29.55, MBC = +29.55, MCB = +28.43, MCD = -28.43, MDC = -30.99."""),
    it("7. Imaginary horizontal force from the sway analysis on the frame.", 5,
       [("Horizontal force needed to produce this sway = sum of horizontal reactions from the sway moments (inclined leg includes the vertical-reaction effect)", 2),
        ("P' ≈ 37.87 kN for EIΔ = 100", 2),
        ("Correction factor k = 47.61/37.87 = 1.257", 1)],
       """From the sway moments, the horizontal shear in AB is (33.53 + 29.55)/4 = 15.77 kN; the inclined leg's horizontal reaction is found from moments about C including the vertical reactions induced by the beam shear (the beam BC carries shear (29.55 + 28.43)/4 = 14.50 kN). Horizontal equilibrium of the frame gives the force required to hold the sway: P' ≈ 37.87 kN (for EIΔ = 100).
The actual unbalanced horizontal force is 47.61 kN, so the sway moments must be scaled by k = 47.61/37.87 = 1.257 (the true sway is EIΔ ≈ 125.7)."""),
    it("8. Superimposed final moments.", 5,
       [("Final = non-sway + k x sway, k = 1.257", 2),
        ("MAB = -40.46, MBA = -33.77, MBC = +33.77, MCB = +38.90, MCD = -38.90, MDC = -40.54 kNm (clockwise +)", 3)],
       """Final moment = non-sway moment + 1.257 x sway moment (kNm, clockwise positive):
MAB = 1.69 + 1.257(-33.53) = -40.46
MBA = 3.38 + 1.257(-29.55) = -33.77
MBC = -3.38 + 1.257(29.55) = +33.77
MCB = 3.16 + 1.257(28.43) = +38.90
MCD = -3.16 + 1.257(-28.43) = -38.90
MDC = -1.58 + 1.257(-30.99) = -40.54
(These agree with an exact stiffness-matrix analysis.)"""),
    it("9. Final bending moment diagram for the frame.", 5,
       [("Column AB: 40.5 kNm at A and 33.8 kNm at B on opposite faces, contraflexure about 2.2 m above A", 1.5),
        ("Beam BC: end moments 33.8 (B) and 38.9 kNm (C) of opposite sense due to sway, plus the 10 x 4/4 = 10 kNm free moment under the load (≈ 7.4 kNm at mid-span)", 2),
        ("Leg CD: 38.9 kNm at C and 40.5 kNm at D, opposite faces, contraflexure about 2.2 m from C along the leg", 1.5)],
       """Draw on the tension faces:
Column AB: linear from 40.5 kNm at A to 33.8 kNm at B on the opposite face; zero at 4 x 40.46/(40.46 + 33.77) = 2.18 m above A.
Beam BC: the sway gives moments of opposite sense at the two ends (33.8 kNm at B, 38.9 kNm at C); the 10 kN load adds a triangular free moment of WL/4 = 10 kNm at mid-span, so the moment at mid-span is about (33.77 - 38.90)/2 + 10 ≈ 7.4 kNm.
Leg CD: linear from 38.9 kNm at C to 40.5 kNm at D on opposite faces; zero about 4.472 x 38.90/(38.90 + 40.54) = 2.19 m from C along the leg.
The diagram shows the typical sway shape: the 50 kN lateral load dominates, with the largest moments at the fixed bases A and D."""),
])

for q in Q:
    if q["type"] != "mcq":
        q["issues"] = list(q.get("issues", [])) + ["Calculations and model answers written by Claude: please check before publishing."]
