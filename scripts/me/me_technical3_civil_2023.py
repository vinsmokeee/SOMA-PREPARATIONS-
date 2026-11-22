"""ME Technical Paper III (Subject Specialisation Paper), Civil Engineering, BCSE 2023 - real paper (PDF sent by the founder).
Standard pattern, same as the 2025 Civil Engineering paper (the latest), so it is ADDED to the paper's pattern.
Not loaded: MCQ 6 (asked again word for word as 2024 MCQ 4 - 2023 is recorded on that question,
supabase/data/me_technical3_repeats_civil_2019_2023.sql). Replaced (no single defensible answer): MCQ 13 ('permissible
compressive strength of M250' - none of the options matches IS 456 permissible stresses), 20 ('steel generally used in
RCC' - textbooks say mild steel, current practice is high-strength deformed bars), 24 ('very low pressure' - the
instrument normally meant, a micro-manometer, is not an option). Four new MCQs keep Part I at 30.
Pictures: Part II Q4 beam (public/papers/me/tech3-civil-2023-beam.png), Case I frame (tech3-civil-2023-frame.png). The
paper's IS 456 design-aid and IS 1893 extract pages are reference material, quoted in the case text where needed.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1"
GROUP_TAG = "civil2023"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "civil-engineering"
ADDS_TO_PAPER = True  # 2025 is the latest Civil Engineering paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Civil Engineering"
PATTERN = STANDARD
BEAM = "/papers/me/tech3-civil-2023-beam.png"
FRAME = "/papers/me/tech3-civil-2023-frame.png"

MCQ = r"""[
{
"n": 1,
"stem": "Formation of small patches of plaster, swelling out beyond the plastered surface is known as",
"opts": [
"Blistering",
"Cracking",
"Crazing",
"Flaking"
]
},
{
"n": 2,
"stem": "IS 456-2000 recommends to provide certain minimum steel in RCC beam to",
"opts": [
"ensure compression failure.",
"avoid rupture of steel in case a flexural failure occurs.",
"hold the stirrup steel in position.",
"provide enough ductility to the beam."
]
},
{
"n": 3,
"stem": "The shape of clay particle is usually",
"opts": [
"Angular",
"Flaky",
"Tubular",
"Rounded"
]
},
{
"n": 4,
"stem": "Sand and drain are used to",
"opts": [
"reduce the settlement.",
"accelerate the consolidation.",
"increase the permeability.",
"transfer the load."
]
},
{
"n": 5,
"stem": "Bitumen felt",
"opts": [
"is used as water proofing material.",
"is used as damp proofing material.",
"is made of bitumen and hessian fibres.",
"All of the above"
]
},
{
"n": 6,
"stem": "Hydrographic survey deal with the mapping of",
"opts": [
"large water bodies.",
"mountainous region.",
"canal system.",
"movement of clouds."
]
},
{
"n": 7,
"stem": "The principle of surveying is to work",
"opts": [
"from part to the whole.",
"from whole to the part.",
"from higher level to the lower level.",
"from lower level to the higher level."
]
},
{
"n": 8,
"stem": "In a mortar, the binding material is",
"opts": [
"Cement",
"Sand",
"Surkhi",
"Cinder"
]
},
{
"n": 9,
"stem": "________________is the method of surveying in which the field observations and plotting proceed simultaneously.",
"opts": [
"Chain surveying",
"Compass surveying",
"Plan table surveying",
"Tacheometric surveying"
]
},
{
"n": 10,
"stem": "To improve the earthquake resistance of a building, provide_________________.",
"opts": [
"roof band",
"plinth band",
"lintel band",
"All of the above"
]
},
{
"n": 11,
"stem": "For quality control of Portland Cement, the essential test done is",
"opts": [
"setting time",
"soundness",
"consistency",
"All of the above"
]
},
{
"n": 12,
"stem": "M20 grade of concrete approximates",
"opts": [
"1 : 1: 2 mix",
"1: 1.5 : 3 mix",
"1: 3: 6 mix",
"None of the above"
]
},
{
"n": 13,
"stem": "Permissible compressive strength of M250 concrete grade is",
"opts": [
"100 kg/cm2",
"150 kg/cm2",
"200 kg/cm2",
"250 kg/cm2"
]
},
{
"n": 14,
"stem": "Workability of concrete is measured by",
"opts": [
"Vicat apparatus test",
"Minimum void method",
"Talbot richard test",
"Slump test"
]
},
{
"n": 15,
"stem": "______________is the process of proper and accurate measurement of concrete ingredients for uniformity of proportion.",
"opts": [
"Batching",
"Curing",
"Grading",
"None of the above"
]
},
{
"n": 16,
"stem": "The lateral earth pressure on a retaining wall is",
"opts": [
"equal to mass of the soil retained.",
"proportional to the depth of the soil.",
"proportional to the internal friction of the soil.",
"None of the above"
]
},
{
"n": 17,
"stem": "A combine footing is adopted when",
"opts": [
"there is only one column.",
"number of columns is two and they are spaced close to each other.",
"number of columns is more than two and they are spaced far apart.",
"number of columns is two and they are spaced far apart."
]
},
{
"n": 18,
"stem": "In a cantilever of length L carrying a load whose intensity varies uniformly from zero at the free end to w per unit run at the fixed end, the maximum bending moment (BM) is",
"opts": [
"wl2/8",
"wl2/4",
"wl2/12",
"wl2/6"
]
},
{
"n": 19,
"stem": "The maximum net pressure intensity causing shear failure of soil, is known as",
"opts": [
"Safe bearing capacity",
"Net safe bearing capacity",
"Net ultimate bearing capacity",
"Ultimate bearing capacity"
]
},
{
"n": 20,
"stem": "The steel generally used in R.C.C works, is",
"opts": [
"Stainless",
"Mild steel",
"High carbon steel",
"High tension steel"
]
},
{
"n": 21,
"stem": "_________________is the ratio of shearing stress to the shearing strain within elastic limit.",
"opts": [
"Modulus of elasticity",
"Bulk modulus of elasticity",
"Tangant modulus of elasticity",
"Shear modulus of elasticity"
]
},
{
"n": 22,
"stem": "In rolled steel beams, shear force is mostly resisted by",
"opts": [
"Web only",
"Flanges only",
"Web and flanges together",
"None of the above"
]
},
{
"n": 23,
"stem": "Unit of kinematic viscosity is",
"opts": [
"newton sec/m2",
"m2/sec",
"newton sec/m3",
"kg sec/m2"
]
},
{
"n": 24,
"stem": "To measure very low pressure, we use",
"opts": [
"Barometers",
"Piezometers",
"Manometers",
"Differential manometers"
]
},
{
"n": 25,
"stem": "The item of steel work which is measured in square metre (sq.m) is",
"opts": [
"Collapsible door",
"Rolling shutters",
"Steel doors",
"All of the above"
]
},
{
"n": 26,
"stem": "In a compaction test, as the compaction effort is increased, the optimum moisture content",
"opts": [
"Decrease",
"Remains same",
"Increases",
"Increases first and thereafter decreases"
]
},
{
"n": 27,
"stem": "The point of contraflexure is the point where",
"opts": [
"bending moment changes sign.",
"bending moment is maximum.",
"bending moment is minimum.",
"shear force is zero."
]
},
{
"n": 28,
"stem": "The foundation are placed below ground level, to increase",
"opts": [
"Strength",
"Stability of the structures",
"Workability",
"All of the above"
]
},
{
"n": 29,
"stem": "The foundation in which a cantilever beam is provided to join two footings, is called as",
"opts": [
"Strip footing",
"Strap footing",
"Combined footing",
"Raft footing"
]
},
{
"n": 30,
"stem": "The brick laid with its breath parallel to the face of a wall, is known as",
"opts": [
"Header",
"Stretcher",
"Closer",
"None of the above"
]
}
]"""

KEY = {
    1: ("a", "Blistering is the formation of small patches of plaster swelling out beyond the plastered surface (from lime particles slaking after application)."),
    2: ("b", "IS 456 cl 26.5.1.1 sets minimum tension steel so that the beam does not fail suddenly: without it the steel could rupture as soon as the concrete cracks in flexure."),
    3: ("b", "Clay minerals (kaolinite, illite, montmorillonite) are plate-like: clay particles are flaky."),
    4: ("b", "Sand drains shorten the drainage path in soft clay, so they accelerate consolidation (they do not reduce the final settlement)."),
    5: ("d", "Bitumen felt is a hessian/ fibre base saturated with bitumen, used for water-proofing roofs and as a damp-proof course."),
    7: ("b", "The fundamental principle of surveying is to work from the whole to the part, so that errors are controlled and do not accumulate."),
    8: ("a", "In cement mortar the binding material is cement; sand is the fine aggregate (surkhi and cinder are adulterants/ fillers)."),
    9: ("c", "In plane table surveying the field observations and plotting are done simultaneously in the field."),
    10: ("d", "IS 4326 earthquake-resistant masonry: plinth, lintel and roof bands all improve earthquake resistance."),
    11: ("d", "Quality control of cement includes setting time, soundness and standard consistency tests (and fineness, strength)."),
    12: ("b", "Nominal mix M20 ≈ 1:1.5:3 (M15 1:2:4, M25 1:1:2)."),
    14: ("d", "Workability of concrete is measured by the slump test (also compacting factor, Vee-Bee, flow)."),
    15: ("a", "Batching is the accurate measurement (by weight or volume) of the concrete ingredients for each mix."),
    16: ("b", "Lateral earth pressure p = K γ z increases linearly with depth."),
    17: ("b", "A combined footing is used for two columns close together (or near a property line) whose isolated footings would overlap."),
    18: ("d", "Total load wL/2 acts at L/3 from the fixed end: Mmax = (wL/2)(L/3) = wL²/6."),
    19: ("c", "The net ultimate bearing capacity is the maximum net pressure intensity at which the soil fails in shear."),
    21: ("d", "Shear modulus (modulus of rigidity) G = shear stress / shear strain within the elastic limit."),
    22: ("a", "In rolled I-beams the shear force is resisted mainly by the web; the flanges resist bending."),
    23: ("b", "Kinematic viscosity ν = μ/ρ has units m²/s (stokes in CGS)."),
    25: ("d", "Collapsible gates, rolling shutters and steel doors are all measured in square metres (IS 1200)."),
    26: ("a", "Higher compaction energy gives a higher maximum dry density at a lower optimum moisture content."),
    27: ("a", "At a point of contraflexure the bending moment changes sign (passes through zero)."),
    28: ("b", "Foundations are taken below ground level to reach firm soil and give stability against overturning, sliding and scour."),
    29: ("b", "A strap footing joins two footings with a strap (cantilever) beam, usually where one column is at the property line."),
    30: ("a", "A header is laid with its breadth (end) parallel to the face of the wall; a stretcher shows its length."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "As per IS 456:2000, the minimum grade of concrete for reinforced concrete exposed to 'moderate' conditions is",
            ["M15", "M20", "M25", "M30"], "c", "IS 456 Table 5: minimum grade for RCC is M20 for mild, M25 for moderate, M30 for severe, M35 very severe and M40 extreme exposure."),
    new_mcq(2, T, "As per IS 456:2000, the minimum nominal cover to the longitudinal bars of a column is",
            ["25 mm", "40 mm", "50 mm", "75 mm"], "b", "IS 456 cl 26.4.2.1: longitudinal bars in a column - not less than 40 mm nor less than the bar diameter."),
    new_mcq(3, T, "The bulking of sand is maximum at a moisture content of about",
            ["0 - 1 percent", "4 - 6 percent", "10 - 12 percent", "15 - 20 percent"], "b", "Moist films on the grains push them apart; bulking peaks (20-40 % for fine sand) at about 4-6 % moisture and disappears when the sand is saturated."),
    new_mcq(4, T, "As per IS 456:2000, the short-term static modulus of elasticity of concrete (in N/mm²) is taken as",
            ["5000 √fck", "5700 √fck", "0.7 √fck", "1000 fck"], "a", "IS 456 cl 6.2.3.1: Ec = 5000 √fck N/mm²; 0.7 √fck is the flexural strength."),
]

Q += [
    saq(1, T, "What are the differences between red bricks and Autoclaved Aerated Cement (AAC) blocks?",
        [("Material and making: red brick - burnt clay, kiln fired; AAC - cement/ lime, fly ash/ sand, gypsum and aluminium powder, aerated and steam cured in an autoclave", 1),
         ("Size and weight: brick 190 x 90 x 90 mm, density ~1800-2000 kg/m³; AAC large blocks (e.g. 600 x 200 x 100-300 mm), 550-700 kg/m³ - lighter, less dead load", 1.5),
         ("Properties: AAC better thermal/ sound insulation and fire resistance, more uniform, faster laying with thin-bed mortar, less mortar and plaster; brick higher compressive strength per unit, more water absorption variation", 1.5),
         ("Use/ cost/ environment: bricks use topsoil and burning (emissions); AAC uses fly ash, eco-friendly; AAC needs care against moisture and fixing; cost comparison", 1)],
        """(Note: AAC is 'Autoclaved Aerated Concrete'.)
1. Raw material and manufacture: red bricks are made of clay moulded and burnt in a kiln at about 900-1100 °C; AAC blocks are made of cement, lime, fly ash or fine sand, gypsum and a little aluminium powder - the aluminium reacts to release hydrogen which aerates the mix - and are cured under high-pressure steam in an autoclave.
2. Size: bricks are small (modular 190 x 90 x 90 mm), so more joints and mortar; AAC blocks are large (typically 600 x 200 mm with thickness 100-300 mm), so one block replaces several bricks and work is faster.
3. Weight: red brick density about 1800-2000 kg/m³; AAC about 550-700 kg/m³ - roughly a third, which reduces dead load on frames and foundations and helps in earthquake design.
4. Strength: a good burnt brick is 3.5-10 N/mm² or more; AAC is about 3-4.5 N/mm², adequate for infill walls but used mainly for non-load-bearing walls.
5. Insulation and fire: AAC's closed air cells give much better thermal and sound insulation and good fire resistance.
6. Workability and finish: AAC is accurate and uniform, can be cut and grooved easily, laid with thin-bed adhesive mortar and needs thinner plaster; bricks vary in size and shape.
7. Water absorption: bricks absorb 15-20 %; AAC absorbs water slowly but must be protected from prolonged wetting.
8. Environment and cost: brick making uses fertile topsoil and burning (smoke, CO2); AAC uses fly ash (an industrial waste) and less energy. AAC costs more per block but saves mortar, plaster, labour and structural cost."""),
    saq(2, T, "What is concrete curing and describe briefly the various methods of concrete curing? Why the concrete curing is important?",
        [("Definition: keeping freshly placed concrete moist and at a suitable temperature for a period (min. 7 days OPC, 10 days with blended cement/ hot weather, IS 456) so that hydration continues", 1.5),
         ("Methods: water curing - ponding, spraying/ fogging, wet coverings (hessian, gunny bags, sand); membrane curing - polythene sheets, curing compounds; steam/ accelerated curing for precast; formwork left in place", 2),
         ("Importance: gains design strength, durability and impermeability, reduces plastic and drying shrinkage cracks, better abrasion resistance, protects reinforcement", 1.5)],
        """Curing is the process of maintaining satisfactory moisture and temperature in freshly placed concrete for a definite period immediately after placing and finishing, so that the hydration of cement continues and the concrete develops its intended properties. IS 456 requires the exposed surfaces to be kept continuously moist for at least 7 days with ordinary Portland cement and at least 10 days with mineral admixtures/ blended cements or in hot, dry weather.
Methods:
1. Ponding - small bunds of mortar/ clay on slabs and floors, filled with water.
2. Spraying or fogging - sprinkling water at intervals so the surface never dries.
3. Wet coverings - hessian, gunny bags, straw or sand kept continuously wet, used for columns, beams and walls.
4. Membrane curing - covering with polythene sheets or spraying a liquid curing compound that forms a film and seals in the mixing water; useful where water is scarce or on vertical and large surfaces (roads).
5. Steam or accelerated curing - for precast elements, to gain early strength.
6. Leaving the formwork in place longer also reduces moisture loss.
Importance: without curing the surface dries, hydration stops and the concrete may reach only 50-60 % of its potential strength. Curing (a) develops the design compressive strength, (b) improves durability and impermeability so reinforcement is protected from corrosion, (c) reduces plastic shrinkage and drying shrinkage cracks, (d) improves surface hardness and abrasion resistance, and (e) improves freeze-thaw and chemical resistance."""),
    saq(3, T, "What are the steps involved in the concreting process and explain each steps?",
        [("Batching - measuring ingredients by weight/ volume as per mix design", 0.75), ("Mixing - machine/ hand mixing to a uniform colour and consistency (time, sequence)", 0.75),
         ("Transporting - pans, wheelbarrows, buckets, chutes, transit mixers, pumps, without segregation or loss of slump", 0.75), ("Placing - in clean, oiled formwork, within initial setting time, layers, limited free fall (<1.5 m)", 0.75),
         ("Compacting - needle/ surface/ form vibrators or rodding to remove entrapped air", 0.75), ("Finishing - screeding, floating, trowelling", 0.5), ("Curing - keep moist for the specified period; formwork removal as per IS 456", 0.75)],
        """1. Batching: measuring cement, fine aggregate, coarse aggregate, water and admixtures in the correct proportions - preferably by weight (weigh batching) for accuracy, or by volume for small works - allowing for moisture in the aggregates.
2. Mixing: combining the ingredients until the concrete is uniform in colour and consistency - by machine mixer (usually 1.5-2 minutes after all materials are in) or by hand on a clean platform for small jobs (with 10 % extra cement).
3. Transporting: moving the concrete from the mixer to the place of deposit quickly, without segregation, loss of water or slump - by pans, wheelbarrows, buckets and cranes, chutes, belt conveyors, transit mixers or pumps.
4. Placing: depositing concrete in clean, wetted or oiled formwork around fixed and checked reinforcement, within the initial setting time, in layers of about 150-300 mm, with free fall limited (about 1.5 m) to avoid segregation; construction joints planned in advance.
5. Compaction: removing entrapped air to achieve maximum density, using needle (immersion) vibrators, surface or form vibrators, or rodding/ tamping for small works - avoiding over-vibration.
6. Finishing: levelling and smoothing the surface by screeding, floating and trowelling, or giving a textured/ broom finish as needed.
7. Curing: keeping the concrete moist and at suitable temperature for at least 7-10 days (ponding, wet hessian, membranes), then removing formwork after the periods in IS 456 (e.g. slab soffits 3-7 days with props, beams 7-14 days)."""),
    saq(4, T, "Determine the values of reactions at support A and D, maximum bending moment and draw the bending moment diagram (BMD) & shear force diagram (SFD) of the beam shown in the figure. (AD = 8 m simply supported; 4 kN point loads at B and C, 2 m from each support; UDL 2 kN/m on BC = 4 m.)",
        [("Total load = 4 + 4 + 2 x 4 = 16 kN; symmetric, so RA = RD = 8 kN (check by moments: RD x 8 = 4 x 2 + 8 x 4 + 4 x 6 = 64)", 1.5),
         ("SF: A-B +8 kN; just right of B +4 kN, falls linearly to 0 at mid-span (4 m) and -4 kN just left of C; C-D -8 kN", 1),
         ("BM: MA = 0, MB = 8 x 2 = 16 kNm, Mmax at mid-span (SF = 0) = 8 x 4 - 4 x 2 - 2 x 2 x 1 = 20 kNm, MC = 16 kNm, MD = 0", 1.5),
         ("Diagrams: SFD rectangles A-B and C-D with sloping line B-C; BMD straight lines A-B, C-D and parabola B-C peaking at 20 kNm", 1)],
        """Loads: point loads 4 kN at B (2 m) and C (6 m); UDL 2 kN/m over BC (4 m) = 8 kN acting at mid-span (4 m). Total = 16 kN.
Reactions: taking moments about A: RD x 8 = 4 x 2 + 8 x 4 + 4 x 6 = 8 + 32 + 24 = 64, so RD = 8 kN; RA = 16 - 8 = 8 kN (as expected from symmetry).
Shear force: from A to B, V = +8 kN; at B it drops by 4 to +4 kN; from B to C it decreases at 2 kN/m: V = 4 - 2(x - 2), which is zero at x = 4 m (mid-span) and -4 kN just left of C; at C it drops by 4 to -8 kN; from C to D, V = -8 kN, closed by RD = 8 kN.
Bending moment: MA = 0; MB = 8 x 2 = 16 kNm; maximum where SF = 0, at x = 4 m: M = 8 x 4 - 4 x 2 - 2 x 2 x 1 = 32 - 8 - 4 = 20 kNm; MC = 16 kNm; MD = 0.
SFD: horizontal line +8 from A to B, step to +4, straight sloping line to -4 at C (crossing zero at mid-span), step to -8, horizontal to D.
BMD: straight line 0 to 16 kNm on AB, parabola from 16 up to 20 kNm at mid-span and back to 16 kNm at C, straight line to 0 at D (all sagging). Maximum bending moment = 20 kNm at mid-span.""", image=BEAM),
]

C1 = """Case I: Seismic analysis of a four-storey RC frame (equivalent static method)
You are assigned to analyse a four-storey special RC building located in seismic zone IV with the equivalent static lateral force method. Assumed preliminary data for the analysis of the frame (see the figure: plan 2 bays of 5.0 m in the longitudinal direction and 2 x 2.5 m in the transverse direction; plane frame and its lumped-mass model):
1. Type of structure: special RC moment resisting frame
2. Seismic zone: IV
3. Number of storeys: 4 (G+3)
4. Floor to floor height: 3.5 m
5. Materials: concrete M20 and reinforcement Fe 500
6. Column size: 250 x 450 mm
7. Beam sizes: 250 x 400 mm longitudinal, 250 x 350 mm transverse
8. Slab depth: 100 mm
9. Specific weight of RCC: 25 kN/m³
10. Specific weight of infill: 20 kN/m³
11. Type of soil: rock
12. Infill wall thickness: 250 mm
13. Imposed load on 1st, 2nd and 3rd floor: 3.5 kN/m²
14. Imposed load on roof: 0
15. Response spectra: as per IS 1893 (Part 1): 2016
Extracts given with the paper (IS 1893 (Part 1): 2016): zone factor Z = 0.10 (II), 0.16 (III), 0.24 (IV), 0.36 (V); minimum design base shear ρ = 0.7 % (II), 1.1 % (III), 1.6 % (IV), 2.4 % (V) of the seismic weight; importance factor I = 1.5 (important buildings), 1.2 (residential/ commercial with more than 200 persons), 1.0 (all other buildings)."""
C2 = """Case II: Foundation and retaining wall design
Answer both questions. Data given with the paper: shear strength of concrete in punching τc = 0.25 √fck; design shear strength of concrete τc (N/mm²) for M20 against 100As/bd: ≤0.15 - 0.28, 0.25 - 0.36, 0.50 - 0.48, 0.75 - 0.56, 1.00 - 0.62, 1.25 - 0.67, 1.50 - 0.72, 1.75 - 0.75, 2.00 - 0.79, 2.25 - 0.81, ≥2.50 - 0.82; and the SP 16 table of reinforcement percentage for singly reinforced sections (fck = 20 N/mm²)."""


def it(q, m, kp, mod): return (q, m, kp, mod)


Q += case("civil2023", 1, T, C1, image=FRAME, items=[
    it("1. Convert the given weights (1st floor 632.43 kN, 2nd floor 632.43 kN, 3rd floor 632.43 kN and roof 363.82 kN) of each floor into masses and calculate the seismic weight of the building.", 5,
       [("Mass = W/g: M1 = M2 = M3 = 632.43/9.81 = 64.47 t (64 468 kg); M4 (roof) = 363.82/9.81 = 37.09 t", 3),
        ("Seismic weight W = 3 x 632.43 + 363.82 = 2261.11 kN (total mass ≈ 230.5 t); floor weights include full DL + 25 % of imposed load ≤ 3 kN/m² (IS 1893 cl 7.3.1), roof imposed load not included", 2)],
       """Masses (m = W/g, g = 9.81 m/s²):
1st, 2nd and 3rd floors: m = 632.43/9.81 = 64.47 t (64 468 kg) each.
Roof: m = 363.82/9.81 = 37.09 t (37 087 kg).
Seismic weight of the building W = sum of floor seismic weights = 632.43 x 3 + 363.82 = 2261.11 kN (total seismic mass ≈ 230.5 t).
(Each floor seismic weight is the full dead load plus the appropriate part of the imposed load - 25 % for imposed loads up to 3 kN/m² and 50 % above 3 kN/m² as per IS 1893 cl 7.3.1; imposed load on the roof is not considered.)"""),
    it("2. Determine the fundamental natural period.", 7,
       [("Height h = 4 x 3.5 = 14 m", 1),
        ("RC MRF with masonry infill (IS 1893:2016 cl 7.6.2 c): Ta = 0.09 h / √d", 2),
        ("Longitudinal (frame shown, d = 10 m): Ta = 0.09 x 14/√10 = 0.398 s; transverse (d = 5 m): 0.563 s", 3),
        ("Note: as a bare RC MRF, Ta = 0.075 h^0.75 = 0.543 s (accept with reason)", 1)],
       """Height of the building above the base h = 4 x 3.5 = 14 m.
The building is an RC moment resisting frame with 250 mm brick infill walls, so IS 1893 (Part 1): 2016 cl 7.6.2 (c) applies: Ta = 0.09 h/√d, where d is the base dimension in the direction of the earthquake.
Longitudinal direction (the plane frame shown, d = 2 x 5 = 10 m): Ta = 0.09 x 14/√10 = 1.26/3.162 = 0.398 s.
Transverse direction (d = 2 x 2.5 = 5 m): Ta = 0.09 x 14/√5 = 0.563 s.
(If the infill is ignored and the frame treated as a bare RC MRF, cl 7.6.2 (a): Ta = 0.075 h^0.75 = 0.075 x 14^0.75 = 0.543 s.)
The design below uses Ta = 0.398 s for the longitudinal plane frame."""),
    it("3. What is base shear of the structure and what does the base shear acting on a building depend on?", 8,
       [("Base shear: total design lateral (horizontal) seismic force at the base of the structure, VB = Ah W, distributed to floor levels", 3),
        ("Depends on: seismic weight/ mass (W) and its distribution", 1),
        ("Zone factor Z (seismicity of site)", 1), ("Importance factor I (use/ consequences of failure)", 1),
        ("Response reduction factor R (ductility, redundancy of the system)", 1), ("Natural period T and soil type → Sa/g (spectrum, 5 % damping)", 1)],
       """Base shear (design seismic base shear VB) is the total design lateral force that an earthquake is assumed to apply at the base of a structure. It is the sum of the lateral inertia forces at all floor levels and is used to design the lateral load resisting system: VB = Ah x W (IS 1893 cl 7.5.3), where Ah = (Z/2)(I/R)(Sa/g).
It depends on:
1. Seismic weight (mass) of the building W - heavier buildings attract larger inertia forces; and how the mass is distributed over the height.
2. Seismic zone factor Z - the expected peak ground acceleration of the zone (0.24 for zone IV).
3. Importance factor I - use and consequences of failure (1.0 to 1.5).
4. Response reduction factor R - ductility, redundancy and overstrength of the lateral system (5 for SMRF, 3 for OMRF).
5. Fundamental natural period T (stiffness and height of the building) and soil type, which together give the spectral acceleration coefficient Sa/g from the design spectrum (5 % damping).
6. It may not be less than the minimum ρ W of cl 7.2.2 (1.6 % in zone IV)."""),
    it("4. Determine the value of the design seismic base shear.", 10,
       [("Z = 0.24 (zone IV), I = 1.0 (ordinary building), R = 5 (SMRF)", 2),
        ("Rock (Type I/ A soil), T = 0.398 s in 0.10-0.40 s → Sa/g = 2.5", 2),
        ("Ah = (Z/2)(I/R)(Sa/g) = 0.12 x 0.2 x 2.5 = 0.06", 3),
        ("VB = Ah W = 0.06 x 2261.11 = 135.7 kN; check ≥ ρW = 0.016 x 2261 = 36.2 kN - OK", 3)],
       """Z = 0.24 (zone IV); I = 1.0 (not in the 'important' list); R = 5.0 (special RC moment resisting frame); soil: rock (Type I/ A).
For rock, Sa/g = 2.5 for 0.10 s ≤ T ≤ 0.40 s. With Ta = 0.398 s, Sa/g = 2.5.
Design horizontal seismic coefficient Ah = (Z/2) x (I/R) x (Sa/g) = (0.24/2) x (1.0/5.0) x 2.5 = 0.12 x 0.2 x 2.5 = 0.06.
Design seismic base shear VB = Ah x W = 0.06 x 2261.11 = 135.67 kN ≈ 135.7 kN.
Minimum (cl 7.2.2, zone IV): ρ W = 0.016 x 2261.11 = 36.2 kN < 135.7 kN, so VB = 135.7 kN governs.
(With the bare-frame period 0.543 s, Sa/g = 1/T = 1.842, Ah = 0.0442 and VB ≈ 100 kN.)"""),
    it("5. Determine the design lateral forces at various floor levels and draw the loading diagram and shear diagram.", 20,
       [("Qi = VB Wi hi² / Σ Wj hj² (IS 1893 cl 7.6.3)", 4),
        ("Wi hi²: 632.43 x 3.5² = 7747; 632.43 x 7² = 30 989; 632.43 x 10.5² = 69 725; 363.82 x 14² = 71 309; Σ = 179 770", 5),
        ("Q1 = 5.85 kN, Q2 = 23.39 kN, Q3 = 52.62 kN, Q4 (roof) = 53.81 kN; ΣQ = 135.67 kN", 5),
        ("Storey shears: 4th 53.81, 3rd 106.43, 2nd 129.82, 1st (ground) storey 135.67 kN", 3),
        ("Loading diagram (arrows at each floor, increasing upwards) and stepped shear diagram increasing downwards to VB", 3)],
       """Vertical distribution (IS 1893 cl 7.6.3): Qi = VB x Wi hi² / Σ Wj hj², with VB = 135.67 kN.
Level | Wi (kN) | hi (m) | Wi hi² | Qi (kN) | storey shear Vi (kN)
Roof | 363.82 | 14.0 | 71 308.7 | 135.67 x 71 308.7/179 770.5 = 53.81 | 53.81 (4th storey)
3rd floor | 632.43 | 10.5 | 69 725.4 | 52.62 | 106.43 (3rd storey)
2nd floor | 632.43 | 7.0 | 30 989.1 | 23.39 | 129.82 (2nd storey)
1st floor | 632.43 | 3.5 | 7 747.3 | 5.85 | 135.67 (ground storey)
Σ Wi hi² = 179 770.5; ΣQi = 135.67 kN = VB (check).
Loading diagram: horizontal arrows at each floor level of the frame/ lumped-mass model - 5.85 kN at 1st floor, 23.39 kN at 2nd, 52.62 kN at 3rd and 53.81 kN at roof (forces increase with height, roughly parabolically).
Shear diagram: storey shear is constant within each storey and steps up going down - 53.81 kN in the top storey, 106.43 kN, 129.82 kN, and 135.67 kN in the ground storey (= base shear). For one plane frame, these forces are shared among the parallel frames in proportion to their stiffness."""),
])

Q += case("civil2023", 2, T, C2, items=[
    it("""1. A design for a five-storeyed RCC building was completed, but the client proposes one additional floor (six storeys), so the foundation must be redesigned before construction. Re-determine the size and depth of the isolated square footing with the data below, and check for one-way and two-way shear.
Serviceable axial load 2500 kN; moment about z-axis Mz = 100 kNm; moment about x-axis Mx = 120 kNm; load factor 1.5; column 600 mm x 600 mm; unit weight of soil 18 kN/m³; fck = 20 MPa (M20); fy = 500 MPa (Fe 500); safe bearing capacity 150 kN/m².""", 25,
       [("Depth of foundation (Rankine, assume φ ≈ 30° as φ is not given): Df = (q/γ)((1 - sinφ)/(1 + sinφ))² = (150/18)(1/9) = 0.93 m → about 1.0-1.5 m", 3),
        ("Size: load + 10 % self-weight = 2750 kN; with biaxial moments q = P/A + 6Mx/B³ + 6Mz/B³ ≤ 150: B = 4.5 m gives 150.3 (just over); adopt B = 4.6 m → qmax 143.5, qmin 116.4 kN/m² (no tension)", 6),
        ("Factored net upward pressure: qu = 1.5 x 2500/4.6² + 6 x 1.5(120 + 100)/4.6³ = 177.2 + 20.3 = 197.6 kN/m² (max, used conservatively)", 3),
        ("Bending at column face: cantilever 2.0 m, Mu = 197.6 x 2²/2 = 395 kNm/m; d (flexure) = √(Mu/0.133 fck b) = 385 mm", 3),
        ("Two-way (punching) at d/2: τc = 0.25√20 = 1.118 MPa; d = 700: Vu = 197.6(4.6² - 1.3²) = 3847 kN ≤ 1.118 x 4 x 1300 x 700 = 4070 kN - OK (d = 650 fails)", 4),
        ("One-way at d from face: Vu = 197.6(2.0 - 0.7) = 256.9 kN/m, τv = 0.367 MPa → need pt ≈ 0.27 % (τc 0.36 at 0.25 %)", 3),
        ("Adopt d = 700, D ≈ 760 mm; Ast = 0.27 % = 1890 mm²/m (> flexure 0.195 %) → 20 mm @ 160 c/c both ways; footing 4.6 x 4.6 m at ≈ 1.5 m depth", 3)],
       """1. Depth of foundation: φ of the soil is not given; assuming φ = 30°, Rankine's formula gives Df = (q/γ) x ((1 - sin φ)/(1 + sin φ))² = (150/18) x (0.5/1.5)² = 8.33 x 0.111 = 0.93 m. Adopt a founding depth of about 1.5 m below ground (≥ 0.93 m, below topsoil and frost/ scour).
2. Plan size: service load P = 2500 kN; add about 10 % for self-weight of footing and backfill: 2750 kN. For a square footing with biaxial moments, qmax = P/B² + 6Mx/B³ + 6Mz/B³.
Try B = 4.5 m: 2750/20.25 + 6 x 120/91.13 + 6 x 100/91.13 = 135.8 + 7.9 + 6.6 = 150.3 kN/m² > 150 (marginally).
Adopt B = 4.6 m: 2750/21.16 + 720/97.34 + 600/97.34 = 130.0 + 7.4 + 6.2 = 143.5 kN/m² < 150 OK; qmin = 130.0 - 13.6 = 116.4 kN/m² > 0 (no tension).
3. Factored net upward pressure (self-weight excluded): Pu = 1.5 x 2500 = 3750 kN, Mux = 180 kNm, Muz = 150 kNm.
qu,max = 3750/21.16 + 6 x 180/97.34 + 6 x 150/97.34 = 177.2 + 11.1 + 9.2 = 197.6 kN/m². For simplicity it is taken as uniform (conservative).
4. Depth for bending: projection from column face = (4.6 - 0.6)/2 = 2.0 m. Mu = 197.6 x 2.0²/2 = 395.2 kNm per metre width. For Fe 500, Mu,lim = 0.133 fck b d², so d = √(395.2 x 10⁶/(0.133 x 20 x 1000)) = 385 mm. Shear will govern.
5. Two-way (punching) shear at d/2 from the column face: allowable τc = ks x 0.25√fck = 1.0 x 0.25 x √20 = 1.118 N/mm².
Try d = 650 mm: critical square side = 600 + 650 = 1250 mm; Vu = 197.6 x (4.6² - 1.25²) = 3872 kN; capacity = 1.118 x 4 x 1250 x 650 = 3634 kN < 3872 - not OK.
Try d = 700 mm: side 1300 mm; Vu = 197.6 x (21.16 - 1.69) = 3847 kN; capacity = 1.118 x 4 x 1300 x 700 = 4070 kN > 3847 - OK.
6. One-way shear at d from the column face: Vu = 197.6 x (2.0 - 0.70) x 1 = 256.9 kN/m; τv = 256.9 x 10³/(1000 x 700) = 0.367 N/mm². From the table, τc = 0.36 at pt = 0.25 % and 0.48 at 0.50 %, so pt ≥ about 0.27 % is required.
7. Reinforcement: Mu/bd² = 395.2 x 10⁶/(1000 x 700²) = 0.81 → pt = 0.195 % from the SP 16 table (Fe 500, M20); shear needs 0.27 %, so provide pt = 0.27 %: Ast = 0.0027 x 1000 x 700 = 1890 mm²/m → 20 mm bars @ 160 mm c/c (1963 mm²/m) in both directions.
Result: square footing 4.6 m x 4.6 m, overall depth about 760 mm (d = 700 mm, 50 mm clear cover), 20 mm @ 160 c/c both ways, founded at about 1.5 m depth. (Development length and bearing at the column-footing junction should also be checked.)"""),
    it("""2. A cantilever retaining wall is required to retain earth 3.8 m high above the ground level. Determine the depth of the foundation, width of the footing and thickness of the base slab and stem. Also check the stability: factor of safety (FOS) against sliding and against overturning. Sketch the retaining wall with dimensions.
Assume unit weight of soil γs = 18 kN/m³, angle of repose φ = 30°, backfill surface inclined at θ = 15°, coefficient of friction μ = 0.5, safe bearing capacity q0 = 150 kN/m², fck = 20 MPa and fy = 500 MPa.""", 25,
       [("Ka for sloping backfill = cosθ (cosθ - √(cos²θ - cos²φ))/(cosθ + √(cos²θ - cos²φ)) = 0.373", 3),
        ("Depth of foundation Df = (q0/γ)((1 - sinφ)/(1 + sinφ))² = 0.93 → 1.0 m; total height H = 4.8 m", 3),
        ("Proportions: base width ≈ 0.6H → 3.0 m; toe ≈ B/3 = 1.0 m; base slab ≈ H/12 → 400 mm; stem 400 mm at base, 200 mm at top; heel 1.6 m", 4),
        ("Stem check: h = 4.4 m, P = Ka γ h²/2 = 65.0 kN, horizontal 62.8 kN, M = 92.1 kNm, Mu = 138 kNm → d = √(Mu/0.133 fck b) = 228 mm < 350 provided - OK", 3),
        ("Earth pressure on the whole wall (vertical plane through heel, H' = 4.8 + 1.6 tan15° = 5.23 m): P = 91.8 kN, Ph = 88.6 kN at H'/3 = 1.74 m, Pv = 23.8 kN", 3),
        ("Weights and moments about toe: stem 22.0 + 11.0, base 30.0, soil on heel 126.7 + 6.2, Pv 23.8 → ΣW = 219.6 kN, MR = 451.3 kNm; MO = 88.6 x 1.74 = 154.5 kNm", 4),
        ("FOS overturning = 451.3/154.5 = 2.9 > 1.55-2 OK; FOS sliding = 0.5 x 219.6/88.6 = 1.24 < 1.5 → provide a shear key (or wider base); pressure: e = 0.15 m < B/6, qmax = 95, qmin = 51.5 kN/m² < 150 OK; sketch", 5)],
       """1. Earth pressure coefficient for sloping backfill (Rankine): Ka = cos θ x (cos θ - √(cos²θ - cos²φ))/(cos θ + √(cos²θ - cos²φ)), with θ = 15°, φ = 30°: cos 15° = 0.966, √(0.933 - 0.75) = 0.428, Ka = 0.966 x 0.538/1.394 = 0.373.
2. Depth of foundation: Df = (q0/γ) x ((1 - sin φ)/(1 + sin φ))² = (150/18) x (1/3)² = 0.93 m → adopt 1.0 m. Total height of the wall H = 3.8 + 1.0 = 4.8 m.
3. Preliminary proportions: base width B ≈ 0.5-0.7 H → adopt 3.0 m; toe projection ≈ B/3 → 1.0 m; base slab thickness ≈ H/12 → 400 mm; stem 400 mm thick at the base tapering to 200 mm at the top; heel = 3.0 - 1.0 - 0.4 = 1.6 m.
4. Stem thickness check: height of stem h = 4.8 - 0.4 = 4.4 m. P = Ka γ h²/2 = 0.373 x 18 x 4.4²/2 = 65.0 kN (parallel to the slope); horizontal component = 65.0 cos 15° = 62.8 kN at h/3; M = 62.8 x 4.4/3 = 92.1 kNm; Mu = 1.5 x 92.1 = 138.1 kNm. Required d = √(138.1 x 10⁶/(0.133 x 20 x 1000)) = 228 mm; provided d ≈ 400 - 50 = 350 mm - OK.
5. Stability (per metre run, concrete 25 kN/m³; soil over the toe neglected):
Earth pressure acts on the vertical plane through the heel end: H' = 4.8 + 1.6 tan 15° = 4.8 + 0.43 = 5.23 m; P = 0.373 x 18 x 5.23²/2 = 91.8 kN; Ph = 88.6 kN at H'/3 = 1.74 m above the base; Pv = 91.8 sin 15° = 23.8 kN.
Loads and lever arms from the toe:
stem rectangular part 0.2 x 4.4 x 25 = 22.0 kN at 1.30 m → 28.6 kNm
stem triangular part 0.5 x 0.2 x 4.4 x 25 = 11.0 kN at 1.13 m → 12.5 kNm
base slab 3.0 x 0.4 x 25 = 30.0 kN at 1.50 m → 45.0 kNm
soil on heel 1.6 x 4.4 x 18 = 126.7 kN at 2.20 m → 278.8 kNm
sloping soil wedge 0.5 x 1.6 x 0.43 x 18 = 6.2 kN at 2.47 m → 15.2 kNm
vertical component Pv = 23.8 kN at 3.0 m → 71.3 kNm
ΣW = 219.6 kN; resisting moment MR = 451.3 kNm. Overturning moment MO = 88.6 x 1.74 = 154.5 kNm.
FOS against overturning = 451.3/154.5 = 2.92 > 2.0 (and > 1.4 with 0.9 DL per IS 456) - safe.
FOS against sliding = μ ΣW/Ph = 0.5 x 219.6/88.6 = 1.24 < 1.5 (1.4) - not safe: provide a shear key below the stem (e.g. 300 mm wide x 450 mm deep) so that passive resistance in front of the key raises the FOS above 1.5, or widen the base.
Base pressure: x = (MR - MO)/ΣW = (451.3 - 154.5)/219.6 = 1.35 m; e = 1.5 - 1.35 = 0.15 m < B/6 = 0.5 m; qmax = (219.6/3)(1 + 6 x 0.15/3) = 95.0 kN/m², qmin = 51.5 kN/m² - both less than 150 kN/m² and no tension.
Sketch: section showing a 4.8 m high wall - stem 200 mm at top, 400 mm at base; base slab 3.0 m wide x 400 mm thick founded 1.0 m below ground; toe 1.0 m, heel 1.6 m; backfill sloping at 15°; shear key below the stem; weep holes and drainage behind the stem."""),
])

for q in Q:
    if q["type"] != "mcq":
        q["issues"] = list(q.get("issues", [])) + ["Calculations and model answers written by Claude: please check before publishing."]
