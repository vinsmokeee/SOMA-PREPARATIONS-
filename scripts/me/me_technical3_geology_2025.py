"""ME Technical Paper III (Subject Specialisation Paper), Geology, BCSE 2025 - real paper (PDF sent by the founder).
Standard pattern. MCQ 2 (weathering order: calcite vs olivine ambiguous), MCQ 5 (true/false with two empty options)
and MCQ 27 (imbricate thrusting: Lesser Himalaya and Siwaliks both defensible) are replaced by new MCQs. Case I: the
given FoS of 0.86 does not follow from the data given; the model answer shows the calculation and says so.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Geology): BCSE 2025, batch 1"
GROUP_TAG = "geo2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "geology"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Geology"

MCQ = r"""[
{
"n": 1,
"stem": "Basalts are composed of the following the minerals: i. Pyroxene ii. Plagioclase iii. Quartz iv. Orthoclase v. Olivine Chose the correct answer from the options given below:",
"opts": [
"i, ii and iii only",
"i, ii and iv only",
"i, ii and v only",
"All of the above"
]
},
{
"n": 2,
"stem": "Arrange the following minerals with increasing order of stability for weathering i. Illite ii. Olivine iii. Calcite iv. Ca rich feldspar v. Na rich feldspar Chose the correct answer from the options given below:",
"opts": [
"ii, iii, iv, v, i",
"ii, iii, v, iv, i",
"iii, ii, v, iv, i",
"iii, ii, iv, v, i"
]
},
{
"n": 3,
"stem": "Strike-slip faults are examples of plate movement which is",
"opts": [
"at 45° to the strike of the fault plane",
"perpendicular to the strike of the fault plane",
"parallel to the strike of the fault plane",
"None of above"
]
},
{
"n": 4,
"stem": "Exfoliation is a form of:",
"opts": [
"Chemical weathering",
"Physical weathering",
"Mass wasting",
"Biochemical weathering"
]
},
{
"n": 5,
"stem": "Rock outcrop is seen everywhere on Earth:",
"opts": [
"True",
"False",
"",
""
]
},
{
"n": 6,
"stem": "The study of spatial and temporal relationships between bodies of rock is called",
"opts": [
"Paleontology",
"Petrology",
"Stratigraphy",
"Geomorphology"
]
},
{
"n": 7,
"stem": "The most common rock stratigraphic unit is",
"opts": [
"Members",
"bed",
"Formation",
"group"
]
},
{
"n": 8,
"stem": "Dinosaurs evolved and became dominant during the",
"opts": [
"Cenozoic",
"Tertiary",
"Mesozoic",
"Paleozoic"
]
},
{
"n": 9,
"stem": "The geologic epoch that we currently live is called",
"opts": [
"Miocene",
"Eocene",
"Holocene",
"Pleistocene"
]
},
{
"n": 10,
"stem": "The valueless minerals present in an ore mineral is called?",
"opts": [
"Non-metallic minerals",
"Metallic minerals",
"Flux minerals",
"Gangue minerals"
]
},
{
"n": 11,
"stem": "Ore deposits which are formed simultaneously with the enclosing rocks are called:",
"opts": [
"Epigenetic",
"Syngenetic",
"Magmatic",
"Supergene"
]
},
{
"n": 12,
"stem": "The most common ore of Lead is:",
"opts": [
"Sphalerite",
"Chromite",
"Galena",
"Pyrite"
]
},
{
"n": 13,
"stem": "On the basis of which content igneous rocks are classified as acidic or basic rocks?",
"opts": [
"Calcium",
"Magnetite",
"Bauxite",
"Silica"
]
},
{
"n": 14,
"stem": "The ratio of the volume of voids to the total volume of the materials is known as",
"opts": [
"Permeability",
"Porosity",
"Specific retention",
"Conductivity"
]
},
{
"n": 15,
"stem": "A fold in which both limbs dip away from the center is called",
"opts": [
"Syncline",
"Monocline",
"Dome",
"Anticline"
]
},
{
"n": 16,
"stem": "Karst topography is mainly developed in",
"opts": [
"Granite",
"Gneiss",
"Sandstone",
"Limestone"
]
},
{
"n": 17,
"stem": "A cuesta is best described as",
"opts": [
"A symmetrical ridge",
"A dome-shaped hill",
"An asymmetrical ridge with a gentle and steep slope",
"A volcanic cone"
]
},
{
"n": 18,
"stem": "The angle of repose of a soil or rock mass is?",
"opts": [
"The angle of maximum slope at which materials remains stable",
"The angle of internal friction",
"The dip of bedding planes",
"None of the above"
]
},
{
"n": 19,
"stem": "Uniaxial Compressive Strength (UCS) test is used to measure",
"opts": [
"Tensile strength of rock",
"Shear strength of soil",
"Compressive strength of intact rock",
"All of the above"
]
},
{
"n": 20,
"stem": "Which of the following discontinuities is most critical for slope stability?",
"opts": [
"Vertical joints perpendicular to the slope",
"Joints dipping out of the slope",
"Fractures parallel to the slope",
"Bedding planes dipping into the slope"
]
},
{
"n": 21,
"stem": "Rock Mass Rating (RMR) system is used for",
"opts": [
"Identifying mineral composition",
"Estimating rock mass quality for engineering purposes",
"Measuring permeability of rock",
"None of the above"
]
},
{
"n": 22,
"stem": "Which soil is most susceptible to liquefaction during seismic shaking",
"opts": [
"Dense sand",
"Saturated loose sand",
"Clay",
"Gravel"
]
},
{
"n": 23,
"stem": "The presence of clay minerals in soil generally",
"opts": [
"Increases permeability",
"Decreases plasticity",
"Increases cohesion and plasticity",
"All of the above"
]
},
{
"n": 24,
"stem": "A joint is",
"opts": [
"A fracture with displacement",
"A type of unconformity",
"A fracture with no or negligible movement",
"None of the above"
]
},
{
"n": 25,
"stem": "The Main Central Thrust (MCT) in the Himalayas separates",
"opts": [
"The Tethyan Himalaya from the Higher Himalayas",
"The Siwalik from the Lesser Himalayas",
"The Lesser Himalayas from the Higher Himalayas",
"The Lesser Himalayas from the Indo-Gangetic plains"
]
},
{
"n": 26,
"stem": "The Tethyan Himalayan Sequence mainly comprises of",
"opts": [
"Crystalline basement",
"Metamorphic gneiss and schist",
"Recent fluvial deposits",
"Paleozoic-Mesozoic sedimentary rocks"
]
},
{
"n": 27,
"stem": "The imbricate thrusting is best observed in",
"opts": [
"The Higher Himalayas",
"The Lesser Himalayas",
"The Siwaliks",
"Tethyan Himalayas"
]
},
{
"n": 28,
"stem": "Which of the following structures is the youngest?",
"opts": [
"The Main Central Thrust (MCT)",
"The South Tibetan Detachment System (STDS)",
"The Main Boundary Thrust (MBT)",
"The Main Frontal Thrust (MFT)"
]
},
{
"n": 29,
"stem": "Which seismic waves cannot travel through liquid?",
"opts": [
"P-waves",
"S-waves",
"Rayleigh waves",
"Love waves"
]
},
{
"n": 30,
"stem": "A V-shaped pattern of contour lines pointing uphill usually represents:",
"opts": [
"Ridge",
"Valley",
"Cliff",
"Fault"
]
}
]"""

KEY = {
    1: ("c", "Basalt is mafic: plagioclase, pyroxene and often olivine; no quartz or orthoclase."), 3: ("c", "In a strike-slip fault movement is parallel to the strike of the fault plane."),
    4: ("b", "Exfoliation (sheeting) is physical weathering from pressure release and thermal changes."), 6: ("c", "Stratigraphy studies the spatial and temporal relationships of rock layers."),
    7: ("c", "The formation is the basic (most common) lithostratigraphic unit."), 8: ("c", "Dinosaurs evolved and dominated during the Mesozoic."),
    9: ("c", "We live in the Holocene epoch."), 10: ("d", "Gangue is the valueless material in an ore."),
    11: ("b", "Syngenetic deposits form at the same time as the host rock."), 12: ("c", "Galena (PbS) is the main lead ore."),
    13: ("d", "Silica content: acidic > 63% SiO2, basic 45-52%."), 14: ("b", "Porosity = volume of voids / total volume."),
    15: ("d", "In an anticline both limbs dip away from the centre (hinge)."), 16: ("d", "Karst develops in soluble limestone."),
    17: ("c", "A cuesta is an asymmetrical ridge: gentle dip slope and steep scarp."), 18: ("a", "The angle of repose is the steepest stable slope of loose material."),
    19: ("c", "UCS measures the compressive strength of intact rock."), 20: ("b", "Joints dipping out of (daylighting) the slope allow planar sliding."),
    21: ("b", "RMR classifies rock mass quality for engineering design."), 22: ("b", "Saturated loose sand liquefies most easily."),
    23: ("c", "Clay minerals raise cohesion and plasticity and lower permeability."), 24: ("c", "A joint is a fracture with no or negligible displacement."),
    25: ("c", "The MCT separates the Lesser Himalaya from the Higher (Greater) Himalaya."), 26: ("d", "The Tethyan Himalaya is mainly Paleozoic-Mesozoic sedimentary rocks."),
    28: ("d", "The Main Frontal Thrust is the youngest, southernmost active thrust."), 29: ("b", "S-waves (shear waves) cannot travel through liquids."),
    30: ("b", "Contour Vs point uphill (upstream) in valleys."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "Which of the following minerals is the most resistant to chemical weathering?", ["Olivine", "Calcium-rich plagioclase", "Biotite", "Quartz"], "d",
            "In the Goldich stability series quartz, the last mineral to crystallise in Bowen's series, is the most stable at the Earth's surface."),
    new_mcq(2, T, "Which of the following is NOT a sedimentary rock?", ["Sandstone", "Shale", "Conglomerate", "Marble"], "d",
            "Marble is a metamorphic rock formed from limestone or dolomite."),
    new_mcq(3, T, "In the Himalayas, the Main Boundary Thrust (MBT) separates", ["The Siwaliks from the Lesser Himalayas", "The Lesser Himalayas from the Higher Himalayas", "The Higher Himalayas from the Tethyan Himalayas", "The Siwaliks from the Indo-Gangetic plains"], "a",
            "The MBT carries the Lesser Himalaya over the Siwaliks; the MFT separates the Siwaliks from the plains."),
    saq(1, T, "List and briefly explain three physical properties used to identify minerals in hand specimen.",
        [("Three properties named (e.g. hardness, lustre, cleavage/fracture, colour/streak, crystal habit, specific gravity)", 2), ("Each briefly explained with how it is tested/example", 3)],
        """1. Hardness - resistance to scratching, measured on Mohs scale (1 talc to 10 diamond) using a fingernail (2.5), copper coin (3.5), steel knife (5.5) or glass; e.g. quartz (7) scratches glass, calcite (3) does not.
2. Cleavage and fracture - the way a mineral breaks: along flat planes of weakness (cleavage, e.g. mica in one direction, feldspar in two) or irregularly/conchoidally (fracture, e.g. quartz).
3. Lustre - how the surface reflects light: metallic (galena, pyrite) or non-metallic (vitreous quartz, pearly, silky, earthy).
(Also accepted: streak - colour of powder on unglazed porcelain, e.g. hematite red-brown; colour; crystal habit; specific gravity; magnetism; reaction with dilute HCl.)"""),
    saq(2, T, "What is the Principle of Superposition? Explain its significance with appropriate diagram.",
        [("Statement: in undisturbed sequence, oldest at bottom, youngest at top", 2), ("Significance: relative dating, correlation, reconstructing geological history; exceptions (overturned folds, thrusts)", 2), ("Diagram of layered sequence labelled oldest-youngest", 1)],
        """Principle (Nicolas Steno): in an undeformed sequence of sedimentary rocks (or lava flows), each layer is younger than the one below it and older than the one above - the oldest beds are at the bottom and the youngest at the top.
Significance: basis of relative dating and stratigraphy; lets geologists work out the order of events, correlate rock units and fossils between areas, build the geological time scale and reconstruct past environments. It must be used with way-up criteria (graded bedding, cross-bedding, mud cracks) because folding (overturned limbs) and thrust faulting can invert or repeat sequences.
Diagram: a stack of beds labelled from bottom 'Layer A - oldest' up to 'Layer D - youngest', with an arrow 'increasing age' pointing downward."""),
    saq(3, T, "Explain the term rock cycle with a simple diagram.",
        [("Definition: continuous processes transforming igneous, sedimentary, metamorphic rocks into one another", 2), ("Processes: melting, cooling/crystallisation, weathering/erosion, deposition, lithification, heat and pressure, uplift", 2), ("Labelled diagram (cycle with three rock types and arrows)", 1)],
        """The rock cycle is the continuous set of processes by which rocks are formed, broken down and re-formed, changing from one type to another over geological time, driven by Earth's internal heat (plate tectonics) and surface processes (sun, water, gravity).
- Magma cools and crystallises to form igneous rocks.
- Uplift exposes rocks; weathering and erosion produce sediment, which is transported, deposited, compacted and cemented (lithification) into sedimentary rocks.
- Burial with heat and pressure changes igneous or sedimentary rocks into metamorphic rocks.
- Further heating melts rocks into magma, and the cycle continues; any rock type can also be weathered or metamorphosed again.
Diagram: three boxes (igneous, sedimentary, metamorphic) and magma/sediment, joined by labelled arrows: cooling, weathering and erosion, deposition and lithification, heat and pressure, melting."""),
    saq(4, T, "Explain the difference between porosity and permeability in rocks.",
        [("Porosity defined: ratio of void volume to total volume (%), storage capacity", 2), ("Permeability defined: ability to transmit fluids, depends on connected pores (Darcy)", 2), ("Contrast/example: clay high porosity low permeability; sandstone/gravel both high; fractured granite", 1)],
        """Porosity is the proportion of a rock's total volume that is empty space (pores, fractures): n = Vv / Vt x 100%. It measures how much fluid a rock can store.
Permeability is the ability of a rock to let fluids flow through it; it depends on the size, shape and connectivity of pores and fractures, not just their total volume (measured in darcies; hydraulic conductivity in m/s, from Darcy's law).
A rock can be porous but not permeable: clay and shale have high porosity (40-60%) but tiny, poorly connected pores, so very low permeability (aquitards). Well-sorted sandstone and gravel have both high porosity and high permeability (good aquifers and reservoirs). Crystalline rocks like granite have low porosity but can be permeable where fractured."""),
]
C1 = """Case I: Slope stability assessment near a proposed hydropower project
You are assigned to perform a preliminary slope stability assessment of a hillside located near a recently proposed hydropower project site. The slope has shown signs of minor rockfall and shallow landslides during the last monsoon season. Your task is to evaluate the stability conditions and provide appropriate stabilisation measures.

Data provided:
- Slope angle: 35°
- Rock type: para-gneiss with foliation dipping 40° towards NE
- Soil overburden thickness: 1.5 m, classified as silty clay
- Water table depth: 3 m below the slope surface
- Rainfall intensity during monsoon: 120 mm/day
- Cohesion (c) of soil: 15 kPa
- Internal angle of friction (φ): 25°
- Bulk unit weight of soil: 18 kN/m³
- Estimated factor of safety (FoS) from simple infinite slope model: 0.86 (unstable if FoS < 1.0)

Write a preliminary slope stability assessment report for the site based on the above data."""
C2 = """Case II: Geological mapping for base metal exploration
You are tasked to conduct a geological mapping study in an area of 10 km² of a known mineralised belt to prospect for potential base metal mineralisation. The region consists of metamorphosed volcanic and sedimentary rocks with quartz veins and sulfide mineralisation occurrences.

Data provided:
- Rock types: amphibolite, schist, quartzite and quartz veins
- Known mineral occurrences: chalcopyrite and pyrite in quartz veins
- Structural data: foliation strikes N45°E and dips 60° SE; several brittle faults trending NW-SE
- Geochemical soil anomaly data: elevated Cu and Fe concentration in the southern part of the area
- Previous drilling shows alteration zones near quartz veins

Prepare a geological mapping report."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("geo2025", 1, T, C1, issues=["The given FoS of 0.86 does not follow from the data (the infinite slope formula gives about 1.85 dry and 1.49 fully saturated); the model answer shows this."], items=[
    it("Introduction: Describe the objective and importance of slope stability assessment at the site.", 5,
       [("Objective: evaluate stability, identify failure mechanisms, recommend measures", 2), ("Importance: safety of hydropower structures, roads, workers, communities; monsoon landslides common in Bhutan; cost of failure", 3)],
       "The objective is to make a preliminary evaluation of the stability of the hillside above/near the proposed hydropower site, identify likely failure mechanisms (rockfall, shallow translational slides in the soil cover, structurally controlled failure in gneiss) and recommend stabilisation measures and further investigation. It matters because slope failure could damage the headworks, access roads, penstock or powerhouse, endanger workers and nearby communities, block the river and cause costly delays; Bhutan's steep terrain, young Himalayan geology, earthquakes and intense monsoon rain make such failures common, as shown by last monsoon's rockfall and shallow slides."),
    it("Data Collection: Summarise the geological and geotechnical data available for the site and any assumptions you made.", 8,
       [("Summary of data: slope 35°, para-gneiss foliation 40° NE, 1.5 m silty clay, water table 3 m, rainfall 120 mm/day, c 15 kPa, φ 25°, γ 18 kN/m³", 4), ("Assumptions: infinite slope, slip plane at soil/rock contact, homogeneous soil, parameters representative, slope dip direction relative to foliation, groundwater cases (dry vs saturated)", 4)],
       "Data: slope angle β = 35°; bedrock para-gneiss with foliation dipping 40° towards NE; overburden 1.5 m of silty clay; water table 3 m below surface (i.e. below the soil cover in the dry season); monsoon rainfall 120 mm/day; soil c = 15 kPa, φ = 25°, γ = 18 kN/m³; reported FoS 0.86; evidence of rockfall and shallow landslides. Assumptions: the soil layer is uniform and the potential slip surface is parallel to the slope at the soil-rock contact (z = 1.5 m), so the infinite slope model applies; strength parameters are representative and effective; γw = 9.81 kN/m³; two groundwater cases are checked - dry (water table below the slip surface, u = 0) and fully saturated during heavy monsoon rain (seepage parallel to slope, m = 1); the slope face is assumed to face roughly NE (same direction as foliation dip), which needs field confirmation."),
    it("Analysis and Discussion: Calculate the factor of safety using an infinite slope model and discuss the implications of the results for slope stability, considering geological features.", 15,
       [("Correct formula: FoS = [c + (γz cos²β - u) tanφ] / (γz sinβ cosβ), u = m γw z cos²β", 3), ("Correct calculation: dry ≈ 1.85; saturated ≈ 1.49 (or c = 0 cases ≈ 0.67 / 0.30)", 4), ("Comparison with given 0.86 - explains discrepancy (loss of cohesion, deeper/weaker zones, rainfall infiltration, seepage) and that slope is marginal/unstable in the worst case", 4), ("Geological discussion: foliation vs slope (40° > 35° - not daylighting if same direction, wedges/joints), weathering of gneiss, rockfall, rainfall, seismicity, toe erosion", 4)],
       """Infinite slope: FoS = [c + (γ z cos²β - u) tan φ] / (γ z sin β cos β), with pore pressure u = m γw z cos²β.
γz = 18 x 1.5 = 27 kPa; cos 35° = 0.819, cos²35° = 0.671, sin 35° = 0.574; tan 25° = 0.466.
Driving stress = 27 x 0.574 x 0.819 = 12.7 kPa.
Dry (water table 3 m deep, below the slip surface, u = 0): normal stress = 27 x 0.671 = 18.1 kPa; FoS = (15 + 18.1 x 0.466) / 12.7 = (15 + 8.45) / 12.7 ≈ 1.85.
Fully saturated during monsoon (m = 1): u = 9.81 x 1.5 x 0.671 = 9.9 kPa; FoS = (15 + (18.1 - 9.9) x 0.466) / 12.7 = 18.8 / 12.7 ≈ 1.49.
If cohesion is lost when the silty clay is softened/saturated (c ≈ 0): FoS = tanφ / tanβ = 0.67 dry and about 0.30 saturated.
Discussion: with the given c and φ the soil cover is stable on paper, so the reported FoS of 0.86 does not follow from the data; it implies much lower strength (loss of cohesion, residual strength), a deeper or weaker slip surface, or a rising perched water table during 120 mm/day rain. The observed shallow landslides support the low value: rainfall infiltration saturates the silty clay, removes apparent cohesion and builds seepage pressure, and with c near zero the 35° slope is steeper than φ = 25°, so it is unstable. Geologically, foliation dipping 40° NE is steeper than the slope; if the slope faces NE the foliation does not daylight and planar sliding on foliation is less likely, but intersecting joints can form wedges and toppling, and weathered gneiss releases blocks that cause rockfall. Seismic shaking, toe cutting by the river or roads, and deforestation further reduce stability. Overall the slope should be treated as marginally stable to unstable in the monsoon."""),
    it("Recommendation: Suggest at least three mitigation or stabilisation measures appropriate for this slope.", 10,
       [("Drainage: surface drains, cut-off/catch drains, horizontal/sub-horizontal drains to lower pore pressure", 3), ("Slope geometry/reinforcement: regrading/benching, soil nails, rock bolts, retaining/toe walls, gabions", 3), ("Rockfall protection: scaling, wire mesh/drapery, catch fences, ditches", 2), ("Bioengineering/vegetation and monitoring (piezometers, inclinometers, rain gauges)", 2)],
       "1. Drainage - the most important measure: surface catch drains above the crest, lined berm drains, horizontal drains and sealing cracks to stop infiltration and reduce pore pressure in the monsoon. 2. Regrading and support - benching or flattening the slope where possible, toe retaining walls or gabion walls, and soil nails or rock bolts/anchors to tie the soil and weathered gneiss to sound rock. 3. Rockfall protection - scaling loose blocks, draped wire mesh or shotcrete on fractured faces, and catch fences or ditches to protect structures and roads. 4. Bioengineering - planting deep-rooted grasses, shrubs and trees with jute or coir netting to reduce erosion and strengthen the surface. 5. Monitoring and warning - rain gauges, piezometers, inclinometers and visual inspections with thresholds for alerts during the monsoon."),
    it("Limitation of the Study: Discuss limitations related to the data and methodology used in your assessment.", 5,
       [("Data: few parameters, no lab/field test details, single values, no discontinuity survey, slope orientation unknown, seasonal water levels", 3), ("Method: infinite slope is simplistic (only shallow planar failure, ignores rockfall, wedges, 3D, seismic loading)", 2)],
       "Data limitations: single values of c, φ and γ without test details or variability; no borehole logs, no joint/discontinuity survey and no slope aspect, so the relation between foliation and slope is assumed; water table measured once, not during the monsoon; no seismic data; and the given FoS is inconsistent with the parameters. Method limitations: the infinite slope model only covers shallow planar slides parallel to the surface and assumes uniform soil and seepage; it ignores rockfall, wedge and toppling failure in the gneiss, deep-seated failure, seismic loading and 3D effects, so detailed investigation and analysis (limit equilibrium/numerical, kinematic analysis) are needed."),
    it("Conclusion: Summarise your findings and final remarks on the slope condition.", 7,
       [("Summary: slope marginally stable when dry, unstable when saturated/with cohesion loss; given FoS 0.86 indicates failure risk", 3), ("Key controls: rainfall/groundwater, weak silty clay, fractured gneiss, rockfall", 2), ("Final remarks: urgent drainage and protection, detailed investigation before construction, monitoring", 2)],
       "The 35° slope with 1.5 m of silty clay over para-gneiss is marginally stable in dry conditions but becomes unstable when saturated and when cohesion is lost during intense monsoon rain, consistent with the reported FoS of 0.86 and the recent rockfall and shallow landslides (the formula with the given c and φ gives higher values, so parameters must be checked). Rainfall infiltration and groundwater are the main triggers, with fractured, weathered gneiss supplying rockfall. The slope poses a risk to the hydropower project; drainage, rockfall protection and slope support should be designed before construction, supported by detailed site investigation (boreholes, lab tests, discontinuity survey) and long-term monitoring."),
])
Q += case("geo2025", 2, T, C2, items=[
    it("Introduction: Importance of geological mapping in mineral exploration.", 5,
       [("Mapping is the foundation: lithology, structure, alteration and mineral occurrences on a map", 2), ("Guides targeting: controls on mineralisation, where to sample/drill, reduces cost and risk; base for 3D models and resource estimation", 3)],
       "Geological mapping is the foundation of mineral exploration: it records the distribution of rock types, structures (foliation, folds, faults, veins), alteration and mineral showings on a map. It shows how mineralisation is controlled by lithology and structure, guides geochemical and geophysical surveys and the siting of trenches and drill holes, reduces exploration cost and risk, and provides the base for 3D geological models, resource estimates and environmental planning."),
    it("Data Collection: Outline the types of data collected during field mapping and laboratory analyses.", 7,
       [("Field: lithology, contacts, structural measurements (strike/dip, faults, veins, lineations), alteration, mineralisation, GPS locations, photos", 3), ("Sampling: rock chips, channel, soil, stream sediment", 2), ("Laboratory: petrography/thin sections, ore microscopy, geochemical assay (Cu, Pb, Zn, Au, Ag), XRD/XRF, density", 2)],
       "Field data: base maps and GPS positions of outcrops; lithology and contacts; structural data (foliation strike and dip, fold axes, lineations, fault orientations and sense of movement, vein orientation and thickness); alteration types and intensity (silicification, sericite, chlorite, carbonate, gossans); visible sulphides (chalcopyrite, pyrite) and their style; photographs and sketches. Sampling: rock chip, channel and grab samples of veins and wall rock; systematic soil and stream sediment samples; drill core logs from earlier holes. Laboratory: thin-section petrography and ore microscopy, multi-element geochemical assays (Cu, Pb, Zn, Fe, Au, Ag), XRD/XRF for alteration minerals, and density measurements; results are compiled in a GIS database."),
    it("Analysis and Discussion: (i) Interpret the structural controls on mineralisation in the area. (ii) Correlate lithology, alteration zones and geochemical anomalies to identify potential target zones for further exploration.", 20,
       [("(i) Foliation N45°E/60° SE as pathway; NW-SE brittle faults cross-cutting foliation as fluid conduits; intersections and dilational sites host quartz-sulphide veins", 7), ("Competency contrast: quartzite/amphibolite brittle vs schist ductile; veins in fractures", 3), ("(ii) Correlation: chalcopyrite-pyrite veins + alteration halos + Cu-Fe soil anomaly in south", 5), ("Targets ranked: southern zone where NW-SE faults cut foliation/veins and alteration coincide with anomaly; extensions along strike", 5)],
       """(i) Structural controls: the foliation (strike N45°E, dip 60° SE) is the main planar fabric; hydrothermal fluids would have moved along foliation planes and lithological contacts, so veins and sulphides are likely elongated NE-SW and dip SE. The NW-SE brittle faults cut across the foliation at a high angle; they are likely later conduits that tapped fluids and created open spaces (dilational jogs, fracture zones). Where these faults intersect favourable layers and foliation-parallel veins, permeability is highest and quartz-chalcopyrite-pyrite veins are expected to be thickest and richest. Competent units (quartzite, amphibolite) fracture brittlely and host veins, while schist deforms ductilely and may act as a seal.
(ii) Correlation: chalcopyrite and pyrite occur in quartz veins; drilling found alteration halos (e.g. silicification, sericite/chlorite) around these veins, showing that hydrothermal fluids altered the wall rock; the soil anomaly of elevated Cu and Fe in the south indicates weathering of sulphide-bearing rock beneath. The amphibolite (metavolcanic, Fe-Mg rich) may be the chemical trap/source for copper. Targets: Priority 1 - the southern area where the Cu-Fe soil anomaly overlaps NW-SE faults, quartz veins and mapped alteration, especially at fault-foliation intersections and contacts between amphibolite and quartzite/schist. Priority 2 - NE-SW strike extensions of known veins along the foliation and down-dip to the SE. Priority 3 - other NW-SE faults with weaker anomalies, to be tested by more sampling. The anomaly should be checked for transport down-slope so that targets are placed upslope of the peak."""),
    it("Recommendation: Propose next steps for detailed exploration or drilling programmes.", 8,
       [("Detailed mapping (1:2,000-1:5,000), infill soil/rock sampling, trenching across anomalies", 3), ("Geophysics: IP/resistivity, magnetics, EM to detect sulphides", 2), ("Drilling: diamond drill holes oriented to cross veins/foliation (towards NW), stepped out, core logging and assays", 3)],
       "Do detailed mapping (1:2,000-1:5,000) and infill soil and rock-chip sampling over the southern anomaly; open trenches across the anomaly and veins to expose and channel-sample mineralisation. Run ground geophysics - induced polarisation (IP)/resistivity for disseminated sulphides, magnetics and electromagnetics (EM) for massive sulphides and structures. Integrate all data in GIS to rank targets. Then drill diamond core holes on the best targets, oriented to cut the SE-dipping foliation and veins at a high angle (holes inclined towards the NW) and to test fault intersections, starting with scout holes and stepping out along strike and down-dip; log and assay the core, measure density and study metallurgy. Include environmental baseline, community consultation and permits."),
    it("Limitation of the Study: Identify challenges or gaps in data that may affect exploration success.", 5,
       [("Data gaps: limited outcrop/thick soil and vegetation, few structural measurements, sparse soil sampling, limited drilling, no geophysics, unknown grades/depth", 3), ("Challenges: transported anomalies, steep terrain/access, weather, deformation complexity, cost, environmental/social constraints", 2)],
       "Gaps: poor outcrop under soil and forest cover; limited structural data and uncertain fault displacement; soil anomalies that may be displaced down-slope or caused by barren pyrite (Fe); sparse sampling density; few drill holes with no information on grade, continuity or depth; no geophysics. Challenges: complex multiple deformation in metamorphic rocks makes vein geometry hard to predict; steep terrain, monsoon weather and access limits; budget; and environmental and community constraints."),
    it("Conclusion: Provide a concise summary of mapping results and exploration potential.", 5,
       [("Summary: Cu sulphides in quartz veins controlled by foliation and NW-SE faults, with alteration and Cu-Fe anomaly in south", 3), ("Potential: good for vein/shear-hosted base metal (Cu) mineralisation; southern zone priority, needs follow-up", 2)],
       "Mapping shows a metamorphosed volcano-sedimentary belt (amphibolite, schist, quartzite) with chalcopyrite-pyrite quartz veins, wall-rock alteration and a Cu-Fe soil anomaly in the south. Mineralisation appears to be controlled by NE-SW foliation and cross-cutting NW-SE faults, with the best potential at their intersections near the southern anomaly. The area has good potential for vein/shear-hosted copper (base metal) mineralisation, which should be tested by detailed sampling, geophysics and drilling."),
])
PATTERN = STANDARD
