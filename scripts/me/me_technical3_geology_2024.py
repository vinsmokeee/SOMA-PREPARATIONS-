"""ME Technical Paper III (Subject Specialisation Paper), Geology, BCSE 2024 - real paper (PDF sent by the founder).
Standard pattern; Section B cases are report-style (marks per report section). MCQs 5 (true/false), 8 and 16 replaced. MCQ 14 uses the fault figure.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Geology): BCSE 2024, batch 1"
GROUP_TAG = "geo2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "geology"
ADDS_TO_PAPER = True  # 2025 is the latest Geology paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Geology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Geology"

MCQ = r"""[
{
"n": 1,
"stem": "According to the principle of uniformitarianism,",
"opts": [
"geologic processes we observe today have operated in the past",
"geologic processes in the past operated at the same rate as they do today",
"early Earth was covered with a uniform magma ocean",
"all of the planets were formed from a uniform solar nebula"
]
},
{
"n": 2,
"stem": "Which of the following minerals exhibits perfect cleavage in one direction?",
"opts": [
"Quartz",
"Mica",
"Calcite",
"Feldspar"
]
},
{
"n": 3,
"stem": "Metamorphic rocks are rocks that have undergone changes. Which of the following could be the parent of a metamorphic rock?",
"opts": [
"Igneous",
"Metamorphic",
"Sedimentary",
"All of above"
]
},
{
"n": 4,
"stem": "One of geology’s greatest contribution to human thought is:",
"opts": [
"the realization that the world is round",
"the recognition that the Earth is the center of the solar system",
"the recognition of the long span of time involved in Earth history",
"the realization that sun is the center of the solar system"
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
"stem": "The branch of geology which deals with the morphology, classification, mechanism and causes of development of rock structures such as folds, faults, joints, etc is called:",
"opts": [
"Lithology",
"Petrology",
"Structural Geology",
"Geomorphology"
]
},
{
"n": 7,
"stem": "The type of fold in which the limbs dip away from each other at the crest is,",
"opts": [
"Syncline",
"Anticline",
"Countercline",
"None of the above"
]
},
{
"n": 8,
"stem": "A fold in which the folding continues in the direction of the axis of the fold is,",
"opts": [
"Plunging fold",
"Similar fold",
"Non-plunging fold",
"None of the above"
]
},
{
"n": 9,
"stem": "Faulting is a_____________process.",
"opts": [
"tectonic",
"non-tectonic",
"both tectonic and non-tectonic",
"precipitation"
]
},
{
"n": 10,
"stem": "What is the maximum angle that a fault plane can make with the horizontal?",
"opts": [
"45 degrees",
"60 degrees",
"90 degrees",
"180 degrees"
]
},
{
"n": 11,
"stem": "The bearing of a line of intersection of fault plane and horizontal is called:",
"opts": [
"Dip",
"Strike",
"Hade",
"Rake"
]
},
{
"n": 12,
"stem": "The vertical component of dip separation is called:",
"opts": [
"Offset",
"Heave",
"Throw",
"Strike gap"
]
},
{
"n": 13,
"stem": "The finely pulverized, clay-like powdered rock material is,",
"opts": [
"Mylonite",
"Gouge",
"Breccia",
"Illite"
]
},
{
"n": 14,
"stem": "Identify the type of slip from the figure below",
"opts": [
"Dip slip",
"Right-lateral strike slip",
"Oblique slip",
"Left-lateral strike slip"
]
},
{
"n": 15,
"stem": "Fractures along which there has been no relative displacement is called?",
"opts": [
"Faults",
"Folds",
"Intrusion",
"Joints"
]
},
{
"n": 16,
"stem": "Joints in metamorphic rocks are due to",
"opts": [
"Indirect stresses",
"Regional stresses",
"Local stresses",
"Local and regional stresses"
]
},
{
"n": 17,
"stem": "Hardness of a mineral depends upon",
"opts": [
"Chemical composition",
"Atomic constitution",
"Chemical composition and atomic constitution",
"Physical makeup"
]
},
{
"n": 18,
"stem": "Which of the following minerals can scratch Topaz?",
"opts": [
"Quartz",
"Gypsum",
"Corundum",
"Calcite"
]
},
{
"n": 19,
"stem": "Quartz is found in which type of rock?",
"opts": [
"Metamorphic rock",
"Igneous rock",
"Sedimentary rock",
"All of above"
]
},
{
"n": 20,
"stem": "What are the two conditions believed to be required for the formation of igneous rocks?",
"opts": [
"Low temperature and molten state",
"Molten state and high temperature",
"Molten state and moderate temperature",
"Crystallized state and moderate temperature"
]
},
{
"n": 21,
"stem": "What is the texture called when large-sized crystals are embedded in fine grained matrix?",
"opts": [
"Granitic texture",
"Porphyritic texture",
"Directive texture",
"Poiklitic texture"
]
},
{
"n": 22,
"stem": "The non-clastic sedimentary rock chiefly made of carbonate of calcium is",
"opts": [
"Sandstone",
"Shale",
"Limestone",
"Conglomerate"
]
},
{
"n": 23,
"stem": "The metamorphic rocks showing granulose structure is",
"opts": [
"Gneiss",
"Slate",
"Marble",
"Schist"
]
},
{
"n": 24,
"stem": "Slate is originated from which rock?",
"opts": [
"Sandstone",
"Granite",
"Shale",
"Marble"
]
},
{
"n": 25,
"stem": "High grade schist is formed under what conditions?",
"opts": [
"Local metamorphism",
"Regional metamorphism",
"Displacement metamorphism",
"Contact metamorphism"
]
},
{
"n": 26,
"stem": "Gneiss formed from sedimentary rock is called",
"opts": [
"Orthogneiss",
"Paragneiss",
"Banded gneiss",
"Augen gneiss"
]
},
{
"n": 27,
"stem": "Quartzite is formed from which rock",
"opts": [
"Shale",
"Andesite",
"Basalt",
"Sandstone"
]
},
{
"n": 28,
"stem": "The most destructive wave during earthquake is?",
"opts": [
"P-waves",
"S-waves",
"Surface waves",
"None of the above"
]
},
{
"n": 29,
"stem": "Which waves have helped geologists understand the nature of the earth’s core?",
"opts": [
"P-waves",
"S-waves",
"Rayleigh waves",
"Love waves"
]
},
{
"n": 30,
"stem": "A valley formed primarily through the process of incision by a river, characterized by steep sides and a V-shaped profile, is known as:",
"opts": [
"Glacial valley",
"Gorge",
"Peneplain",
"Basin"
]
}
]"""

KEY = {
    1: ("a", "Uniformitarianism: the processes we see today also operated in the past ('the present is the key to the past'); rates may have differed."),
    2: ("b", "Mica has perfect basal cleavage in one direction (it splits into thin sheets)."),
    3: ("d", "Any rock - igneous, sedimentary or metamorphic - can be the parent (protolith) of a metamorphic rock."),
    4: ("c", "Geology revealed 'deep time' - the very long span of Earth history."),
    6: ("c", "Structural geology studies folds, faults, joints and other rock structures."),
    7: ("b", "In an anticline the limbs dip away from each other (from the crest)."),
    9: ("a", "Faulting is a tectonic process - rocks break and are displaced by crustal stresses."),
    10: ("c", "Dip angles range from 0° to 90°, so a fault plane can be at most vertical (90°)."),
    11: ("b", "The bearing of the line where the fault plane meets the horizontal is its strike."),
    12: ("c", "Throw is the vertical component of dip separation; heave is the horizontal component."),
    13: ("b", "Fault gouge is finely pulverised, clay-like rock material in a fault zone."),
    14: ("b", "Movement is horizontal along the strike; looking across the fault, the far block has moved to the right - right-lateral (dextral) strike slip."),
    15: ("d", "Joints are fractures with no relative displacement; faults have displacement."),
    17: ("c", "Hardness depends on both chemical composition and atomic structure (bonding) - e.g. diamond and graphite are both carbon."),
    18: ("c", "Corundum (hardness 9) scratches topaz (8); quartz (7), calcite (3) and gypsum (2) cannot."),
    19: ("d", "Quartz is common in igneous (granite), sedimentary (sandstone) and metamorphic (quartzite) rocks."),
    20: ("b", "Igneous rocks form from molten material (magma/ lava) at high temperature as it cools and crystallises."),
    21: ("b", "Large crystals (phenocrysts) in a fine-grained groundmass form a porphyritic texture."),
    22: ("c", "Limestone is a non-clastic (chemical/ biochemical) rock made mainly of calcium carbonate."),
    23: ("c", "Marble (and quartzite) show granulose (granoblastic) structure; gneiss is banded, schist schistose, slate slaty."),
    24: ("c", "Slate forms by low-grade metamorphism of shale."),
    25: ("b", "High-grade schists form under regional metamorphism (high temperature and pressure)."),
    26: ("b", "Gneiss formed from sedimentary rock is paragneiss; from igneous rock, orthogneiss."),
    27: ("d", "Quartzite forms by metamorphism of quartz sandstone."),
    28: ("c", "Surface waves (Love and Rayleigh) have the largest amplitude and cause most damage."),
    29: ("b", "S-waves cannot pass through liquid; the S-wave shadow zone showed that the outer core is liquid."),
    30: ("b", "A deep, steep-sided V-shaped valley cut by river incision is a gorge."),
}
FIX = {14: {"image": "/papers/me/tech3-geo-2024-slip.png"}}
T = TOPIC
Q = mcqs(MCQ, KEY, T, FIX) + [
    new_mcq(1, T, "On the Mohs scale of hardness, which mineral has a hardness of 7?", ["Quartz", "Orthoclase feldspar", "Topaz", "Calcite"], "a",
            "Mohs scale: talc 1, gypsum 2, calcite 3, fluorite 4, apatite 5, orthoclase 6, quartz 7, topaz 8, corundum 9, diamond 10."),
    new_mcq(2, T, "A fold whose hinge line (fold axis) is inclined to the horizontal is called a:", ["Plunging fold", "Non-plunging fold", "Recumbent fold", "Isoclinal fold"], "a",
            "An inclined fold axis means the fold plunges; a horizontal axis gives a non-plunging fold."),
    new_mcq(3, T, "In a normal fault, the hanging wall:", ["Moves down relative to the footwall", "Moves up relative to the footwall", "Moves only horizontally along the strike", "Does not move"], "a",
            "Normal faults form under tension: the hanging wall moves down; in a reverse/ thrust fault it moves up."),
    saq(1, T, "The orientation of a plane in space is expressed by its attitude, a term consisting of two components, strike and dip. Define strike and dip with proper example and illustration.",
        [("Strike: direction (bearing) of the line of intersection of the inclined plane with a horizontal plane, measured from north, e.g. N45°E or 045°", 2),
         ("Dip: maximum angle of inclination of the plane below the horizontal, measured perpendicular to strike, with dip direction, e.g. 30° towards SE; apparent dip is less", 2),
         ("Example/ illustration: block diagram showing strike line, dip angle and direction; notation e.g. N45°E/30°SE or 135/30; measured with Brunton/ clinometer compass; map symbol", 1)],
        """Strike is the compass direction (bearing) of the line formed by the intersection of an inclined plane (bed, fault, joint, foliation) with an imaginary horizontal plane. It is a horizontal line on the plane and is measured from north, e.g. N45°E (or 045°).
Dip is the angle of maximum inclination of the plane below the horizontal, measured in the vertical plane perpendicular to the strike, together with the direction in which the plane slopes down (dip direction), e.g. 30° towards SE. Any dip measured in another direction (apparent dip) is smaller than the true dip.
Example: a sandstone bed striking N45°E and dipping 30° towards the south-east is written N45°E/30°SE (or as dip direction/dip, 135/30). Strike and dip are measured in the field with a Brunton or clinometer compass and shown on maps by a T-shaped symbol (long line = strike, short tick = dip direction, with the dip angle).
Illustration: a block diagram showing an inclined bed, a horizontal plane cutting it along the strike line, an arrow perpendicular to strike pointing down-slope (dip direction) and the angle between the bed and the horizontal (dip angle)."""),
    saq(2, T, "Briefly explain the concept of plate tectonics and its role in orogeny.",
        [("Plate tectonics: lithosphere broken into rigid plates moving over the asthenosphere (mantle convection, ridge push, slab pull); boundaries - divergent, convergent, transform with associated earthquakes, volcanoes", 2.5),
         ("Role in orogeny: mountains form at convergent boundaries - ocean-continent subduction (Andes), ocean-ocean (island arcs), continent-continent collision (Himalaya: India-Eurasia ~50 Ma) by folding, thrust faulting, crustal thickening, metamorphism, uplift", 2.5)],
        """Plate tectonics is the theory that the Earth's rigid outer shell (lithosphere) is broken into large and small plates that move slowly (a few cm per year) over the weak, partly molten asthenosphere, driven by mantle convection, ridge push and slab pull. Plates interact at three kinds of boundaries: divergent (plates move apart - mid-ocean ridges, rift valleys), convergent (plates move towards each other - subduction zones and collision zones) and transform (plates slide past each other - e.g. San Andreas Fault). Most earthquakes, volcanoes and mountain belts occur along these boundaries.
Role in orogeny (mountain building): mountains form mainly at convergent boundaries. Where oceanic crust subducts under a continent, compression and volcanism build mountains like the Andes; ocean-ocean subduction forms island arcs; and where two continents collide, neither subducts easily, so the crust is folded, thrust faulted, thickened, metamorphosed and uplifted into great ranges - the Himalaya formed by the collision of the Indian Plate with the Eurasian Plate from about 50 million years ago, and are still rising as India keeps moving north."""),
    saq(3, T, "Differentiate between weathering and erosion. Provide examples of each process.",
        [("Weathering: in-situ breakdown/ decomposition of rocks at or near surface without significant transport; physical (frost wedging, exfoliation, thermal), chemical (oxidation, hydrolysis, carbonation/ solution of limestone), biological (roots, lichens)", 2.5),
         ("Erosion: removal and transport of weathered material by agents - running water, glaciers, wind, waves, gravity (mass wasting); examples gullies, river valleys/ gorges, glacial valleys, landslides; weathering prepares material, erosion moves it", 2.5)],
        """Weathering is the breaking down or chemical alteration of rocks and minerals in place (in situ), at or near the Earth's surface, by contact with the atmosphere, water and organisms - there is no significant movement of the material. Examples: physical weathering such as frost wedging (water freezing in cracks, common at high altitude in Bhutan), exfoliation and thermal expansion; chemical weathering such as oxidation of iron minerals (rusting), hydrolysis of feldspar to clay and carbonation/solution of limestone; biological weathering by plant roots and lichens.
Erosion is the removal and transport of the weathered material from one place to another by agents such as running water, glaciers, wind, waves and gravity. Examples: rivers cutting valleys and gorges and carrying sediment, gully erosion on bare slopes, glaciers carving U-shaped valleys, wind removing dust, and landslides and debris flows moving material downslope.
Difference: weathering breaks rock down without moving it; erosion moves the products. Weathering usually prepares material for erosion, and both together shape the landscape."""),
    saq(4, T, "Explain what you understand by the term foliation in metamorphic rocks and state its significance.",
        [("Foliation: planar, layered/ parallel arrangement of platy/ elongated minerals (mica, chlorite, amphibole) or banding produced by directed pressure during (regional) metamorphism, perpendicular to maximum stress", 2),
         ("Types with increasing grade: slaty cleavage (slate), phyllitic, schistosity (schist), gneissic banding (gneiss); non-foliated: marble, quartzite", 1),
         ("Significance: indicates direction of stress and metamorphic grade/ deformation history, used in rock classification; plane of weakness - affects slope stability, tunnelling, landslides, foundations, permeability; slate splits for roofing", 2)],
        """Foliation is the planar fabric in metamorphic rocks formed when platy or elongated minerals (micas, chlorite, amphiboles) grow or rotate parallel to each other, or when minerals segregate into light and dark bands, under directed pressure (differential stress) during metamorphism - usually regional metamorphism in mountain belts. The foliation forms roughly perpendicular to the direction of maximum compression.
Types, with increasing metamorphic grade: slaty cleavage (slate), phyllitic texture (phyllite), schistosity (schist) and gneissic banding (gneiss). Rocks formed without directed stress, such as marble and quartzite, are non-foliated.
Significance: (1) it helps classify and name metamorphic rocks and indicates the metamorphic grade; (2) it records the direction of stress and the deformation history, useful in structural mapping (e.g. in the Himalaya); (3) foliation planes are planes of weakness along which rocks split, so they control slope stability, landslides, rock falls, tunnelling, excavation and foundation design - slopes where foliation dips out of the slope are unstable; (4) they affect permeability and groundwater flow; (5) practical use - slate splits along cleavage into roofing slabs."""),
]
INTRO1 = """Case I: Preliminary landslide study
Landslides are one of the most significant natural hazards affecting mountainous and hilly terrains globally, affecting the environment, infrastructure and human safety. Bhutan, located in the eastern Himalayas, has rugged topography, fragile geology and heavy precipitation, especially during the monsoon, and faces tremendous challenges from landslides.
Scenario: A major landslide has occurred in the southern part of the country, an area of mixed soil and rock types of the Lesser Himalaya with steep and rugged topography and heavy monsoon rainfall averaging over 4000 mm per year. The landslide has caused significant damage to local infrastructure, including roads and residential areas. As a geologist, you have been assigned to conduct a preliminary study of the landslide and prepare a preliminary report outlining the key findings and recommendations.
Information you may use: describe the site visit methodology and data collected (geological formations, soil properties, slope geometry, hydrological conditions), the extent of the landslide and affected infrastructure, vegetation and landscape changes; characterise the site (rock types, soils, slope angles, structures; rainfall, groundwater, seepage; vegetation and land use); analyse triggering factors (rainfall, seismic activity, slope stability, human activities), failure mechanisms and a qualitative stability assessment; and give preliminary recommendations (stabilisation, drainage, land use changes), immediate actions including further detailed studies, and long-term measures.
Write the following section of your report:"""
INTRO2 = """Case II: The Himalayas - formation, geology and mineral potential of Bhutan
The Himalayas, one of the most prominent and geologically significant mountain ranges in the world, have a complex formation history and play a crucial role in regional geology and tectonics. You are tasked to prepare a report that explains the formation of the Himalayas, describes their geological and tectonic features, and discusses their potential for mineral resources in the Kingdom of Bhutan.
Information you may use: the geological processes and plate tectonics (collision of the Indian and Eurasian plates); the timeline from initial plate movements to the present, including major uplift phases and faulting; the major geological formations, units and rock types of the Bhutan Himalaya; structural features and major tectonic faults; current tectonic activity (seismicity, ongoing deformation); and mineral resource potential - metallic (copper, tungsten, gold, lead-zinc) and industrial minerals (talc, limestone, dolomite), known deposits, exploration, economic potential and challenges in Bhutan.
Write the following section of your report:"""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("geo2024", 1, T, INTRO1, items=[
    it("Introduction: overview of the landslide event and objectives of the study.", 5,
       [("Overview: location (southern Bhutan, Lesser Himalaya), date/ timing (monsoon), type and approximate size, damage to roads and houses, people affected", 2.5),
        ("Objectives: document event, identify causes/ triggers and failure mechanism, assess current stability and risk, recommend immediate and long-term measures, identify further studies", 2.5)],
       """Overview: during the peak of the monsoon, after several days of heavy rainfall, a large landslide occurred on a steep slope in southern Bhutan, in the Lesser Himalayan zone characterised by weathered phyllites, schists and quartzites with thick colluvial soil, and annual rainfall exceeding 4000 mm. The slide (approximately described by its length, width and estimated volume) blocked and damaged a section of the national/feeder road, destroyed or damaged several houses and threatens other homes, farmland and utilities (water supply, power lines). Residents were evacuated as a precaution.
Objectives of the preliminary study: (1) document the extent and characteristics of the landslide and the damage; (2) describe the geological, geomorphological and hydrological conditions of the site; (3) identify the triggering and causative factors and the probable failure mechanism; (4) carry out a qualitative assessment of present slope stability and risk to people and infrastructure; and (5) recommend immediate safety measures, further detailed investigations and long-term mitigation."""),
    it("Site description and data collection: detailed description of the observed site conditions and data collection methodologies.", 10,
       [("Methodology: desk study (topographic/ geological maps, satellite images, rainfall records, past events), field reconnaissance and mapping, GPS/ drone survey, slope measurements (clinometer, compass), discontinuity data, soil sampling/ logging, interviews with residents", 4),
        ("Site description: geology (rock types - phyllite, schist, quartzite, weathered/ fractured; colluvium/ soil type and thickness), structures (foliation, joints, faults - orientation relative to slope), slope geometry (angle 35-45°, height, aspect), hydrology (springs, seepage, saturated zones, drainage), vegetation/ land use (cleared, road cut, farms)", 4),
        ("Extent of slide: crown, scarp, main body, toe, length/ width/ depth/ volume, cracks, tilted trees, affected road/ houses", 2)],
       """Data collection methodology:
- Desk study: topographic and geological maps (e.g. DGM maps), satellite images and Google Earth before and after the event, rainfall records from the nearest NCHM station, records of earlier slides and road maintenance.
- Field reconnaissance and engineering geological mapping: walking the slide from toe to crown, mapping the crown, main scarp, flanks, main body and toe, tension cracks, bulging and seepage points; GPS points and, if possible, drone (UAV) photogrammetry for a topographic model; measuring dimensions (length, width, depth) to estimate volume.
- Slope and structural data: slope angles with a clinometer, orientation (strike/dip) of foliation, joints and faults with a Brunton compass, rock mass description (weathering, fracture spacing, RQD where exposures allow).
- Soil and hydrological observations: test pits or hand augers, soil description (texture, colour, moisture, density), samples for laboratory index tests (grain size, Atterberg limits, moisture content, shear strength); location of springs, seepage, wet zones, drainage lines, blocked culverts.
- Damage survey and interviews with residents about the timing, cracks or noises before failure and previous movement.
Site description (typical observations): the slope is steep (about 35-45°) with a south-facing aspect and road cuts at its lower part; bedrock is highly weathered and fractured phyllite and schist of the Lesser Himalaya with foliation dipping out of the slope, overlain by several metres of colluvial and residual soil (clayey-silty gravel with boulders); springs and seepage emerge along the soil-rock contact and the road drains were blocked; vegetation had been partly cleared for farming and the road; the slide has a curved main scarp a few metres high with fresh tension cracks above the crown, a disturbed main body and a debris toe that covers the road and has reached the stream below."""),
    it("Landslide assessment: analysis of triggering factors and qualitative stability assessment.", 15,
       [("Preparatory (causal) factors: steep slope, weak, weathered/ fractured phyllite-schist, foliation/ joints dipping out of slope, thick colluvium, proximity to MBT/ MCT faults, toe cutting by road/ stream, deforestation, poor drainage", 5),
        ("Triggering factor: intense/ prolonged monsoon rainfall raising pore water pressure, saturating soil, reducing shear strength; possibly earthquake; human activity (excavation, blocked drains, irrigation)", 4),
        ("Failure mechanism: rotational/ translational slide in soil-weathered rock, planar slide along foliation, transforming into debris flow; type classification (Varnes)", 3),
        ("Qualitative stability: currently marginally stable/ unstable - fresh cracks above crown, seepage, steep scarp, active toe erosion - risk of retrogression and further failure in rains; hazard ranking high; Factor of Safety near 1", 3)],
       """Causative (preparatory) factors: (1) steep, rugged slopes; (2) weak Lesser Himalayan rocks - phyllite, schist and slate that weather deeply to clay and are highly fractured; (3) foliation and joints dipping out of the slope (adverse orientation), forming sliding planes; (4) thick, loose colluvium over bedrock; (5) closeness to major thrusts such as the Main Boundary Thrust, which crush the rocks; (6) toe cutting by the road and erosion by the stream; (7) poor surface and sub-surface drainage (blocked drains, uncontrolled road runoff); and (8) removal of vegetation.
Triggering factor: the main trigger was intense and prolonged monsoon rainfall (over 4000 mm per year, with heavy rain in the preceding days). Infiltration saturated the soil and weathered rock, raised groundwater and pore-water pressure, added weight and reduced effective shear strength, especially along the soil-rock contact. Earthquakes are a possible secondary trigger in this seismically active zone; human activities (road excavation, irrigation channels, blocked culverts) increased instability.
Failure mechanism: the features suggest a rotational to translational slide in the colluvium and weathered rock, with a planar component along foliation, which turned into a debris flow at the toe after saturation (Varnes classification: complex slide-flow).
Qualitative stability assessment: the slope is presently marginally stable to unstable (factor of safety close to 1): fresh tension cracks above the crown, the steep unsupported main scarp, continuing seepage and active toe erosion indicate that the slide may retrogress upslope and that further failures are likely in the coming rains. The hazard to the road and to houses near the crown and along the debris path is therefore high, and the site should be treated as an active landslide."""),
    it("Recommendations: suggested measures for immediate (including additional detailed studies) and long-term mitigation measures.", 10,
       [("Immediate: evacuate/ restrict access to danger zone, warning signs, monitoring (cracks, pegs, rain gauge), divert surface water/ seal cracks with tarpaulin, clear blocked drains, temporary road diversion, community early warning", 3),
        ("Further detailed studies: topographic survey/ drone, boreholes and geophysics (ERT, seismic refraction), lab tests (shear strength), groundwater monitoring (piezometers), inclinometers, quantitative slope stability analysis (FoS, numerical), hazard/ risk mapping, rainfall thresholds", 3),
        ("Long-term: surface and subsurface drainage (catch drains, horizontal drains), slope regrading/ benching, retaining structures (gabions, RCC walls), toe protection/ check dams, soil nails/ anchors, bioengineering and reforestation, land-use zoning/ relocation, road realignment, regular maintenance and monitoring", 4)],
       """Immediate measures: keep people out of the danger zone (relocate households at the crown and in the debris path), put up warning signs and restrict traffic with a safe temporary road diversion; divert surface water away from the slide with temporary lined drains, clear blocked road drains and culverts, cover open tension cracks with plastic sheets; begin simple monitoring - crack pegs, survey points, a rain gauge - with a community early-warning arrangement for heavy rainfall.
Additional detailed studies: detailed topographic survey (drone/total station); subsurface investigation with boreholes, test pits and geophysics (electrical resistivity, seismic refraction) to find the depth of the slip surface and bedrock; laboratory testing of soil and rock (shear strength, index properties); installation of piezometers and inclinometers to monitor groundwater and movement; quantitative slope stability analysis (limit equilibrium/numerical, factor of safety under saturated and seismic conditions); hazard and risk mapping and rainfall thresholds for early warning.
Long-term mitigation: comprehensive surface drainage (catch drains above the crown, lined cascades) and sub-surface drainage (horizontal drains, trench drains) to lower groundwater; slope re-profiling and benching to reduce slope angle and load at the crown; retaining structures (gabion and reinforced concrete walls), toe protection and check dams in the stream; soil nailing or rock anchors where needed; bio-engineering with grasses, shrubs and native trees and reforestation of the catchment; land-use zoning that avoids construction in high-hazard zones and relocation of exposed houses; possible road realignment; and regular maintenance and long-term monitoring."""),
    it("Limitations of the study: point out the important limitations of the study and suggest means to address these shortcomings.", 5,
       [("Limitations: short field time/ preliminary visual assessment, unsafe access to parts of slide, no subsurface data, no lab testing, limited rainfall/ groundwater/ seismic records, lack of high-resolution maps, monsoon weather", 3),
        ("Address: detailed investigation with boreholes/ geophysics, lab tests, instrumentation and monitoring over seasons, high-resolution survey/ remote sensing, multidisciplinary team, data from NCHM/ DGM", 2)],
       """Limitations: the study was preliminary and based mainly on a short field visit and visual observation; parts of the slide (the scarp and toe) could not be accessed safely; there was no subsurface information (depth of slip surface, groundwater level) and no laboratory testing of soil and rock strength, so stability could only be judged qualitatively; long-term rainfall, groundwater and seismic data near the site were limited; high-resolution pre-event topographic maps were not available; and continuing monsoon rain limited field work.
Addressing them: carry out a detailed investigation with boreholes, test pits and geophysical surveys; laboratory testing of samples; install instruments (piezometers, inclinometers, extensometers, rain gauges) and monitor through at least one full monsoon; use drone and satellite remote sensing (InSAR) for high-resolution topography and movement; obtain rainfall and seismic data from NCHM and DGM; and involve a multidisciplinary team (geologists, geotechnical and civil engineers, hydrologists)."""),
    it("Conclusion: summary of key findings and implications for future studies or interventions.", 5,
       [("Summary: slide caused by steep slope, weak weathered Lesser Himalayan rocks and adverse structure, triggered by heavy monsoon rain and pore pressure, worsened by road cutting/ poor drainage; still active and high risk", 3),
        ("Implications: urgent safety and drainage measures, detailed investigation before design of permanent works, hazard mapping and land-use planning, early warning, integrate geological input in road/ settlement planning in southern Bhutan", 2)],
       """The preliminary study shows that the landslide is a rotational-translational slide-debris flow in deeply weathered, fractured Lesser Himalayan phyllite and schist and the overlying colluvium. The slope was predisposed to failure by its steepness, weak rocks, foliation dipping out of the slope, thick soil cover, road cutting at the toe and poor drainage, and it was triggered by prolonged, intense monsoon rainfall that raised pore-water pressure. The slide remains active, with tension cracks above the crown, so the risk to the road and nearby houses is high.
Implications: immediate safety, drainage and monitoring measures are urgent; a detailed geotechnical investigation and quantitative stability analysis are needed before designing permanent stabilisation works; landslide hazard mapping, rainfall-based early warning and risk-informed land-use planning should be extended to similar slopes in southern Bhutan; and geological input should be built into the planning and maintenance of roads and settlements to reduce future landslide disasters."""),
])
Q += case("geo2024", 2, T, INTRO2, items=[
    it("Introduction: overview of the Himalayas and objectives of the report.", 5,
       [("Overview: youngest, highest mountain range, ~2400 km arc from Nanga Parbat to Namche Barwa, highest peaks (Everest), formed by India-Eurasia collision, still rising and seismically active; Bhutan in eastern Himalaya", 3),
        ("Objectives: explain formation and timeline, describe geology/ tectonics of Bhutan Himalaya, assess mineral potential, identify limitations and future work", 2)],
       """The Himalayas are the youngest and highest mountain range on Earth, forming an arc about 2400 km long from Nanga Parbat in the west to Namche Barwa in the east, with the world's highest peaks including Mount Everest. They were formed by the collision of the Indian Plate with the Eurasian Plate and are still rising and seismically active. They control the climate of South Asia (monsoon barrier), are the source of major rivers, and contain important mineral, water and hydropower resources. Bhutan lies in the eastern Himalaya, where all the main tectonic zones of the range are exposed.
Objectives of this report: (1) explain the geological processes and timeline of Himalayan formation; (2) describe the geological units, rock types, structures and present tectonic activity of the Bhutan Himalaya; (3) assess the mineral resource potential and exploration status in Bhutan; and (4) point out limitations and directions for future research and resource development."""),
    it("Formation of the Himalayas: explanation of the geological processes and timeline of the Himalayas' formation.", 10,
       [("Processes: break-up of Gondwana, India drifting north, subduction of Neo-Tethys oceanic crust beneath Eurasia (Andean-type margin, Trans-Himalayan batholith), continent-continent collision, crustal thickening, folding, thrusting, metamorphism, uplift", 5),
        ("Timeline: India separates ~130-90 Ma, fast northward drift (~15 cm/ yr), initial collision ~50-55 Ma (Eocene), Tethys closed (Indus-Tsangpo Suture); MCT active ~23-15 Ma (Miocene) with leucogranites; MBT ~10-5 Ma; MFT (Siwaliks) active today; India still converging ~4-5 cm/ yr", 5)],
       """Geological processes: India was part of the southern supercontinent Gondwana. After Gondwana broke up, the Indian Plate drifted rapidly northward (up to 15-20 cm per year), while the oceanic crust of the Neo-Tethys Ocean in front of it subducted beneath the southern margin of Eurasia, producing an Andean-type volcanic arc and the Trans-Himalayan (Gangdese) batholith. When the ocean closed, the continental crust of India collided with Eurasia; because continental crust is too buoyant to subduct deeply, the northern edge of India was scraped off, folded, stacked into great thrust sheets, thickened, metamorphosed and uplifted, while Tibet was raised into a high plateau. Deformation then propagated southward over time on successively younger thrust faults.
Timeline: India rifted from Gondwana about 130-90 million years ago (Ma); initial collision began about 50-55 Ma (Eocene), marked by the Indus-Tsangpo Suture Zone; crustal thickening and metamorphism followed, with the Main Central Thrust (MCT) and the South Tibetan Detachment active about 23-15 Ma (Miocene), producing high-grade Greater Himalayan rocks and leucogranites; the Main Boundary Thrust (MBT) became active about 10-5 Ma, and the Siwalik foothills were folded along the Main Frontal Thrust (MFT) in the last few million years, which is still active today. India continues to move north at about 4-5 cm per year, with about 2 cm/yr absorbed across the Himalaya, so the mountains are still rising and earthquakes continue."""),
    it("Geology and tectonics of the Bhutan Himalayas: description of the geological units, rock types and structural features; analysis of tectonic processes, current activity and plate interactions.", 15,
       [("Units south to north: Siwalik Group (sandstone, shale, conglomerate - southern foothills) / MFT; Lesser Himalayan Sequence (phyllite, quartzite, slate, dolomite, limestone; Buxa, Daling-Shumar, Jaishidanda units) / MBT; Greater Himalayan Sequence (gneiss, migmatite, schist, leucogranites; most of Bhutan) / MCT; Tethyan Himalaya (sedimentary, fossiliferous, north and klippen e.g. Ura, Lingshi) / STDS", 7),
        ("Structures: MFT, MBT, MCT, STD, Kakhtang thrust, klippen (Ura, Lingshi), folds, foliation, duplexes; significance - stacked thrust sheets, crustal shortening, structural control of landslides/ minerals", 4),
        ("Current activity: ongoing convergence ~2 cm/ yr across Bhutan Himalaya, moderate seismicity, paleo-earthquakes (1714 M8 event), Shillong Plateau effect, seismic zone, GPS/ seismic monitoring, uplift/ erosion", 4)],
       """Geological units (from south to north), separated by major north-dipping fault zones:
1. Siwalik Group (sub-Himalaya) - Miocene-Pliocene sandstone, siltstone, mudstone and conglomerate deposited by rivers in the foreland, exposed in the southern foothills (e.g. Samtse, Gelephu, Samdrup Jongkhar), thrust over the plains along the Main Frontal Thrust (MFT).
2. Lesser Himalayan Sequence - low-grade Proterozoic to Palaeozoic metasediments: phyllite, slate, quartzite, schist, dolomite and limestone, and the Gondwana and Buxa/Baxa groups (including coal, dolomite, limestone, talc), and the Daling-Shumar and Jaishidanda units; bounded below by the Main Boundary Thrust (MBT). These weak, weathered rocks are very landslide-prone.
3. Greater Himalayan Sequence - the high-grade crystalline core that covers most of Bhutan: gneisses, migmatites, schists, quartzites, marbles and Miocene leucogranites, thrust south over the Lesser Himalaya along the Main Central Thrust (MCT); it includes internal thrusts such as the Kakhtang Thrust.
4. Tethyan Himalayan Sequence - weakly metamorphosed to unmetamorphosed fossiliferous sedimentary rocks (limestone, shale, sandstone), found in the north and as klippen (outliers) resting on the Greater Himalaya (e.g. around Ura and Lingshi), separated by the South Tibetan Detachment System (a normal fault zone).
Structural features: the MFT, MBT and MCT are the main thrusts that stack the units like sheets, together with the South Tibetan Detachment, out-of-sequence thrusts, klippen, duplexes, large folds and pervasive foliation. They record over 500 km of crustal shortening and control topography, river courses, landslides, springs and mineralisation.
Tectonic processes and current activity: the Indian Plate continues to under-thrust Eurasia; GPS measurements show convergence of about 1.5-2 cm per year across the Bhutan Himalaya, accumulating strain on the Main Himalayan Thrust. Bhutan lies in a high seismic zone with frequent small and moderate earthquakes (e.g. the 2009 Mongar earthquake of about magnitude 6.1) and evidence of great past earthquakes (e.g. about 1714). The Shillong Plateau to the south takes up part of the shortening. Ongoing uplift combined with intense monsoon erosion produces deep valleys, steep slopes and high landslide and earthquake hazard."""),
    it("Mineral resources potential: assessment of mineral resources potential and current exploration status.", 10,
       [("Potential based on geology: Lesser Himalaya - dolomite, limestone, gypsum, coal, talc, quartzite, iron ore, graphite, slate, marble; Greater Himalaya/ leucogranite - tungsten, tin, beryl, rare metals, gemstones; metallic - copper, lead-zinc, gold, tungsten occurrences", 4),
        ("Known deposits/ status: dolomite (Pugli/ Samtse, Pemagatshel), gypsum (Pemagatshel - Khothakpa), limestone (Gomdar, Dungsum, Samtse - cement), coal (Samdrup Jongkhar), talc (Samtse), quartzite, marble/ stone; metallic largely unexploited, exploration by DGM/ GMC; Mines and Minerals Act/ policy 2017, state-owned mining (SMCL)", 3),
        ("Economic potential and challenges: export (dolomite, gypsum, ferrosilicon raw), cement, ferro-alloys, revenue; challenges - rugged terrain, access/ transport costs, environmental and social impacts, forest/ protected areas, small deposit size, limited exploration data/ skilled manpower, policy, landslides", 3)],
       """Assessment of potential: the geology of Bhutan favours mainly industrial minerals. The Lesser Himalayan sequence and Buxa/Gondwana groups host large deposits of dolomite, limestone, gypsum, talc, quartzite, coal, marble and slate; the Greater Himalayan crystalline rocks and Miocene leucogranites have potential for tungsten, tin, beryl, rare metals, mica and gemstones; and occurrences of copper, lead-zinc, gold and tungsten are known in parts of the Lesser and Greater Himalaya, although most are small or not yet evaluated.
Known deposits and exploration status: dolomite in Samtse and Pemagatshel (mined and exported); gypsum at Khothakpa in Pemagatshel; limestone for cement in Samtse, Pemagatshel (Dungsum) and Gomdar; coal in Samdrup Jongkhar (Gondwana); talc in Samtse; quartzite used for ferro-silicon; marble, slate and stone quarries in several districts; and base metal (lead-zinc, copper) and tungsten occurrences under exploration. The Department of Geology and Mines (DGM, now under the Ministry of Energy and Natural Resources) carries out geological mapping and exploration; mining is regulated under the Mines and Minerals Management Act, and state-owned enterprises (e.g. State Mining Corporation Limited) now operate strategic mines in line with the Mineral Development Policy.
Economic potential and challenges: minerals support cement, ferro-alloy and other industries, exports, revenue and employment, and could diversify the economy beyond hydropower. Challenges include rugged terrain and poor access raising extraction and transport costs; small or poorly known deposits and limited detailed exploration data; environmental and social impacts (forest loss, dust, water pollution, landslides), high forest cover and protected areas, and the constitutional mandate to conserve the environment; limited skilled manpower, technology and capital; and the need for sustainable, value-added and equitable mineral development."""),
    it("Limitations: state some of the major limitations of the study and propose key means to address these constraints.", 5,
       [("Limitations: limited detailed geological mapping (large-scale maps, remote/ inaccessible areas), little subsurface/ geochemical/ geophysical data, uncertain ages and fault activity, limited seismic network/ GPS stations, confidential or old exploration data", 3),
        ("Address: systematic large-scale mapping, remote sensing/ LiDAR, geochemical and geophysical surveys, drilling, geochronology, denser seismic/ GPS networks, collaboration with international institutions, capacity building, open data", 2)],
       """Limitations: much of Bhutan has only regional-scale geological maps, and remote high-altitude areas are poorly studied because of rugged terrain, snow, dense forest and difficult access; there is little subsurface, geochemical, geophysical and drilling data, so resource estimates are uncertain; the ages and activity of faults and the history of past large earthquakes are not well known; the national seismic and GPS networks are still limited; and some exploration data are old, unpublished or confidential.
Means to address them: systematic large-scale geological mapping supported by remote sensing (satellite imagery, LiDAR, drones); regional geochemical and geophysical (magnetic, gravity) surveys followed by drilling of promising targets; geochronology and palaeo-seismology studies; expansion of seismic and GPS monitoring networks; collaboration with international universities and geological surveys; training of national geologists; and a national geoscience database with open access to data."""),
    it("Conclusion: summary of key findings and implications for future research or resource development.", 5,
       [("Summary: Himalaya formed by India-Eurasia collision since ~50 Ma, still active; Bhutan exposes Siwalik, Lesser, Greater, Tethyan units separated by MFT, MBT, MCT, STD; high seismic and landslide hazard", 3),
        ("Implications: mainly industrial mineral potential with some metallic occurrences, need detailed exploration, sustainable mining with environment safeguards, hazard-sensitive planning, more research and monitoring", 2)],
       """The Himalayas formed through the collision of the Indian and Eurasian plates beginning about 50 million years ago, and continued convergence keeps them rising and seismically active. In Bhutan, all the main tectonic units are exposed - Siwalik, Lesser Himalayan, Greater Himalayan and Tethyan sequences - stacked along the MFT, MBT, MCT and South Tibetan Detachment, which gives the country complex geology, high earthquake hazard and widespread landslide-prone slopes. Bhutan's mineral wealth lies mainly in industrial minerals (dolomite, limestone, gypsum, talc, quartzite, coal), with some potential for metallic minerals such as tungsten, copper, lead-zinc and gold.
Implications: further detailed mapping, exploration and research are needed to define resources and understand active faults; mineral development should be sustainable, value-adding and environmentally responsible; and geological knowledge must be used in planning hydropower, roads and settlements, and in earthquake and landslide risk reduction."""),
])
PATTERN = STANDARD
