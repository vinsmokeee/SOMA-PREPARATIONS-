"""ME Technical Paper III (Subject Specialisation Paper), Architecture, BCSE 2025 - real paper (PDF sent by the founder).
Pattern: Section A Part I 30 MCQ, Part II 4 short answers x 5; Section B one of two case studies (50). 150 min + 15 min reading.
Left out: MCQ 19 (Bhutanese timber terms: Claude cannot confirm which pair is wrong), 25 (no option equals the worked cost,
Nu 27,400); two new MCQs keep Part I at 30. MCQ 9 options retyped (lettered e-h in the PDF). Drawing answers are
sketched on paper and uploaded as photos; the Case II site plan is in public/papers/me/tech3-arch-2025-site-plan.png.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Architecture): BCSE 2025, batch 1"
GROUP_TAG = "arch2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "architecture"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Architecture", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Architecture"

MCQ = r"""[
{
"n": 1,
"stem": "What does \"FAR\" (Floor Area Ratio) represent in site planning?",
"opts": [
"The ratio of open space to built area",
"The ratio of total building floor area to the size of the plot",
"The height restriction of a building",
"The percentage of parking space required"
]
},
{
"n": 2,
"stem": "Which principle of design emphasizes the visual weight and balance of elements in a composition?",
"opts": [
"Rhythm",
"Hierarchy",
"Symmetry",
"Contrast"
]
},
{
"n": 3,
"stem": "The \"Venturi Effect\" in building design is related to:",
"opts": [
"Natural ventilation through pressure differences",
"Structural load distribution",
"Acoustic performance",
"Fire resistance"
]
},
{
"n": 4,
"stem": "The pointed arch, ribbed vault, and flying buttress are key features of which architectural style?",
"opts": [
"Baroque",
"Romanesque",
"Gothic",
"Neoclassical"
]
},
{
"n": 5,
"stem": "The 'point of contraflexure' in a beam occurs where:",
"opts": [
"Shear force is maximum",
"Bending moment changes sign",
"Deflection is zero",
"Torsional stress peaks"
]
},
{
"n": 6,
"stem": "The Villa Savoye, a pioneering example of modernist architecture, was designed by:",
"opts": [
"Frank Lloyd Wright",
"Le Corbusier",
"Ludwig Mies van der Rohe",
"Walter Gropius"
]
},
{
"n": 7,
"stem": "The ziggurat was a monumental structure associated with which ancient civilization?",
"opts": [
"Egyptian",
"Mesopotamian",
"Greek",
"Indus Valley SUBJECT SPECIALISATION PAPER FOR ARCHITECTURE"
]
},
{
"n": 8,
"stem": "The Parthenon in Athens is a prime example of which architectural order?",
"opts": [
"Ionic",
"Corinthian",
"Composite",
"Doric"
]
},
{
"n": 9,
"stem": "A simply supported beam with UDL will have maximum deflection at: e) Supports f) Quarter span g) Midspan h) Any random point",
"opts": [
"",
"",
"",
""
]
},
{
"n": 10,
"stem": "The process of protecting steel reinforcement in concrete from corrosion is called:",
"opts": [
"Passivation",
"Galvanization",
"Curing",
"Carbonation"
]
},
{
"n": 11,
"stem": "The primary binder in Portland cement is:",
"opts": [
"Gypsum",
"Calcium silicate hydrate",
"Lime",
"Alumina"
]
},
{
"n": 12,
"stem": "Autoclaved Aerated Concrete (AAC) blocks are preferred for:",
"opts": [
"High-load-bearing walls",
"Thermal insulation and lightweight construction",
"Earthquake-resistant structures",
"Waterproofing applications"
]
},
{
"n": 13,
"stem": "To mitigate flanking noise in a building, the most effective strategy is:",
"opts": [
"Using double-glazed windows",
"Installing acoustic panels on walls",
"Creating structural discontinuities",
"Adding soft furnishings"
]
},
{
"n": 14,
"stem": "The primary purpose of a \"chiller\" in an HVAC system is to:",
"opts": [
"Filter airborne pollutants",
"Remove humidity from air",
"Cool water for air conditioning",
"Distribute warm air through ducts"
]
},
{
"n": 15,
"stem": "Which lighting strategy is most effective for reducing energy use while maintaining visual comfort in workspaces?",
"opts": [
"Uniform fluorescent lighting at 1000 lux",
"High-intensity discharge (HID) lamps in all areas",
"Decorative pendant lights at 200 lux",
"Task lighting combined with daylight harvesting SUBJECT SPECIALISATION PAPER FOR ARCHITECTURE"
]
},
{
"n": 16,
"stem": "What does a \"Bench Mark\" (BM) indicate in a site survey?",
"opts": [
"A permanent reference point with known elevation",
"A temporary survey point",
"The boundary between two properties",
"The center point of a construction site"
]
},
{
"n": 17,
"stem": "When introducing new services (e.g., electrical wiring) in a heritage building, the principle of \"reversibility\" mandates that:",
"opts": [
"All additions must match the historic aesthetic exactly",
"Modifications can be removed without damaging original fabric",
"Services should be hidden within false ceilings",
"Only traditional materials (e.g., clay conduits) be used"
]
},
{
"n": 18,
"stem": "What is the primary purpose of a \"Right of Supervision\" clause in an architect's contract?",
"opts": [
"To transfer design liability to the contractor",
"To allow periodic site visits to verify general compliance with design intent",
"To authorize the architect to hire subcontractors",
"To eliminate the need for building permits"
]
},
{
"n": 19,
"stem": "Which of the following combinations is NOT correct?",
"opts": [
"Kachen~zhu",
"Boh~phana",
"Mago~shathung",
"Pem~choetseg"
]
},
{
"n": 20,
"stem": "A simply supported beam of span 4m carries a point load of 10kN at its midspan. What is the maximum bending moment (M_max) developed in the beam?",
"opts": [
"5 kNm",
"10 kNm",
"15 kNm",
"20 kNm"
]
},
{
"n": 21,
"stem": "What is the primary function of a \"poché\" in architectural drawings?",
"opts": [
"To indicate glass/mirrored surfaces",
"To mark electrical conduits",
"To show landscaping elements",
"To represent solid mass with a filled pattern"
]
},
{
"n": 22,
"stem": "When using CAD software, what does the \"layer 0\" convention typically signify?",
"opts": [
"The default layer that should remain empty",
"The layer containing all dimensions",
"The base reference layer for blocks/xrefs",
"The layer reserved for temporary sketches"
]
},
{
"n": 23,
"stem": "The \"Incremental Housing\" approach advocates for:",
"opts": [
"Government-built high-rise apartments",
"Phased self-construction by residents with core infrastructure provided first",
"Luxury gated communities",
"Relocating slum dwellers to rural areas SUBJECT SPECIALISATION PAPER FOR ARCHITECTURE"
]
},
{
"n": 24,
"stem": "The \"Placemaking\" approach focuses on:",
"opts": [
"Maximizing floor area ratio (FAR) in developments",
"Standardized highway interchange designs",
"Privatization of urban parks",
"Community-driven design of public spaces to enhance social interaction"
]
},
{
"n": 25,
"stem": "A contractor estimates a 10m³ brick wall with 1:6 cement mortar. If the rate of bricks is Nu. 5,000 per 1,000 units and mortar cost is Nu. 800/m³, what is the total material cost (Assume 500 bricks/m³ and 30% mortar volume)",
"opts": [
"Nu. 25,400",
"Nu. 29,600",
"Nu. 27,200",
"Nu. 31,800"
]
},
{
"n": 26,
"stem": "A 15th-century rammed-earth Buddhist temple has developed hairline cracks on its rear wall. Which conservation method is MOST appropriate?",
"opts": [
"Wall stitching by inserting hardwood blocks into grooves",
"Complete dismantling and rebuilding with new rammed earth",
"Partial dismantling and reconstruction with stone masonry",
"Reconstruction of the structure from its base"
]
},
{
"n": 27,
"stem": "One feet = _____________",
"opts": [
"30.84 cm",
"31.48 cm",
"31.84 cm",
"30.48 cm"
]
},
{
"n": 28,
"stem": "In Bhutan, painter is traditionally referred to as _____________.",
"opts": [
"Zow",
"Lha-rib",
"Paap",
"Dozow"
]
},
{
"n": 29,
"stem": "Which traditional timber joint is primarily used to connect two members at right angles while resisting tension and compression?",
"opts": [
"Butt Joint",
"Dovetail Joint",
"Mortise and Tenon Joint",
"Lap Joint"
]
},
{
"n": 30,
"stem": "A residential project in a hot-arid climate prioritizes passive cooling. Which design principle is MOST effective to achieve thermal comfort?",
"opts": [
"High thermal mass walls and shaded courtyards",
"Large south-facing glazing",
"Cross-ventilation with operable windows",
"Lightweight steel construction"
]
}
]"""

KEY = {
    1: ("b", "FAR = total floor area of the building / plot area."), 2: ("c", "Symmetry is the principle of balancing visual weight about an axis."),
    3: ("a", "The Venturi effect speeds up air through narrowings - used for natural ventilation."), 4: ("c", "Pointed arches, rib vaults and flying buttresses are Gothic."),
    5: ("b", "At a point of contraflexure the bending moment changes sign (is zero)."), 6: ("b", "Villa Savoye (1931) is by Le Corbusier."),
    7: ("b", "Ziggurats were built in Mesopotamia."), 8: ("d", "The Parthenon is Doric."), 9: ("c", "Maximum deflection of a simply supported beam under UDL is at midspan."),
    10: ("a", "The alkaline concrete forms a passive film on the steel (passivation)."), 11: ("b", "Hydrated calcium silicates (C-S-H) give cement its binding strength."),
    12: ("b", "AAC blocks are light and insulate well."), 13: ("c", "Flanking sound travels through continuous structure; breaking it (discontinuity) works best."),
    14: ("c", "A chiller cools water that is circulated to air-handling units."), 15: ("d", "Task lighting with daylight harvesting saves energy and keeps comfort."),
    16: ("a", "A bench mark is a permanent point of known elevation."), 17: ("b", "Reversibility: additions can be removed without harming the original fabric."),
    18: ("b", "Supervision means periodic visits to check work follows the design intent."), 20: ("b", "M = PL/4 = 10 × 4/4 = 10 kNm."),
    21: ("d", "Poché is the solid fill showing cut walls and mass."), 22: ("c", "Objects in blocks are drawn on layer 0 so they take the layer they are inserted on."),
    23: ("b", "Incremental housing: core infrastructure first, residents extend in phases."), 24: ("d", "Placemaking is community-driven design of public space."),
    26: ("a", "Minimal intervention: stitch cracks with timber blocks rather than rebuild."), 27: ("d", "1 ft = 30.48 cm."), 28: ("b", "A traditional painter is called lha-rip (lha-drip)."),
    29: ("c", "Mortise and tenon joins members at right angles and resists tension and compression."), 30: ("a", "In hot-arid climates thermal mass and shaded courtyards work best."),
}
FIX = {9: {"stem": "A simply supported beam with UDL will have maximum deflection at:", "opts": ["Supports", "Quarter span", "Midspan", "Any random point"]}}
T = TOPIC
DRAW = ["Drawing answer: students sketch on paper and upload a photo; the model answer describes what the drawing should show."]
Q = mcqs(MCQ, KEY, T, FIX) + [
    new_mcq(1, T, "On a plan drawn to a scale of 1:100, a 4.5 cm line on the drawing represents", ["0.45 m", "4.5 m", "45 m", "450 m"], "b", "1 cm = 100 cm = 1 m, so 4.5 cm = 4.5 m."),
    new_mcq(2, T, "In the northern hemisphere, to receive the most winter sun a building's main glazing should face", ["north", "south", "east", "west"], "b", "The winter sun is low in the southern sky."),
    saq(1, T, "Explain any five fundamental principles of sustainable architecture, along with relevant examples. (5 marks)",
        [("Five principles with examples, 1 mark each (passive design/orientation, energy efficiency and renewables, water conservation, local and low-carbon materials, site and ecology/waste reduction, indoor environmental quality)", 5)],
        """1. Passive design and orientation - orient for sun and wind, shading, natural ventilation (e.g. south-facing living rooms in Thimphu).
2. Energy efficiency and renewable energy - insulation, efficient lighting, solar water heaters and PV.
3. Water conservation - rainwater harvesting, low-flow fittings, greywater reuse.
4. Local, low-carbon and durable materials - stone, rammed earth, timber from sustainable sources (traditional Bhutanese houses).
5. Respect for site and ecology, and reduced waste - minimal cut and fill on slopes, keeping trees, recycling construction waste; good indoor air and daylight."""),
    saq(2, T, "Explain the key stages involved in preparing a conservation plan for a historic building, along with one challenge faced at each stage. Support your answer with suitable examples. (5 marks)",
        [("Stages: documentation/understanding; assessment of significance; condition survey and issues; conservation policies; implementation and monitoring", 3), ("A challenge for each stage with an example (e.g. a dzong or lhakhang)", 2)],
        """1. Understanding and documentation (history, measured drawings, photographs) - challenge: few written records, so oral history is needed (e.g. old lhakhangs).
2. Assessment of significance (historic, religious, architectural, social values) - challenge: different values of community, clergy and experts.
3. Condition survey and identifying issues (cracks, moisture, decay) - challenge: hidden damage and lack of testing equipment.
4. Conservation policies and plan (minimal intervention, reversibility, traditional materials and craftsmen) - challenge: balancing modern needs such as fire safety and electricity.
5. Implementation, maintenance and monitoring - challenge: funding and skilled craftsmen, e.g. restoration of Wangduephodrang Dzong after the 2012 fire."""),
    saq(3, T, """a) Describe the Parob Rabsel, a traditional architectural feature of Bhutan. (3 marks)
b) Illustrate the Parob Rabsel with a labelled sketch. (2 marks)""",
        [("a) Projecting timber window/bay on the upper floor, rich carving and painting; frame, sill, lintel and multiple cornice layers; status and light/ventilation", 3),
         ("b) Labelled sketch showing the projecting frame, window openings, cornice/bracket layers and decoration", 2)],
        """a) The rabsel is the large projecting timber window bay on the upper storey of Bhutanese houses, dzongs and lhakhangs. The parob type is a prominent multi-bay rabsel framed by heavy timber members with layered cornices (bracket and beam layers) above and a sill below, often richly carved and painted. It gives light, ventilation and views to the main room, displays the status of the household and is a defining element of Bhutanese architecture required by the traditional architecture guidelines.
b) Sketch: elevation of the bay projecting from the wall, showing sill beam, posts and window openings with traditional arched/cusped shapes, lintel, layered brackets and cornice above, and painted decoration; label each part.""", issues=DRAW),
    saq(4, T, "Design and sketch a floor plan of a powder room adjoining a living room with a maximum area of 2.5 square metres. Clearly label all fixtures, and provide accurate wall-to-wall measurements as well as the relative dimensions of the fixtures from the internal walls. (5 marks)",
        [("Area within 2.5 m² (e.g. 1.2 m × 2.0 m) with wall-to-wall dimensions", 1.5), ("Fixtures: WC and wash basin, door swing (door opening outwards/sliding), mirror", 1.5), ("Clearances: WC centre about 0.40-0.45 m from side wall, 0.6 m clear in front; basin clearances", 1.5), ("Labels, scale, link to living room", 0.5)],
        """Plan about 1.2 m × 2.0 m (2.4 m² internal). Door (0.75 m) from the living room on the short side, opening outward or sliding to save space. WC on the far wall, its centre-line 0.45 m from the side wall, with at least 0.60 m clear space in front. Wash basin (about 0.45 m wide) on the long side wall near the door, centre about 0.35 m from the corner, with mirror above and 0.60 m clear in front. Label fixtures, show wall-to-wall dimensions and distances of fixtures from walls, and give a scale and north point.""", issues=DRAW),
]
C1 = "CASE I (Bhutanese architecture and heritage)"
C2 = """CASE II: "Embodied Harmony: A Mindful Villa for Gelephu's Contoured Landscape"
Design Brief: Design a serene hillside villa nestled into the gentle 10-degree slope of a 600 sq. m (20 m × 30 m) property in Gelephu (see the site plan). The design should embrace the land's natural contours while framing panoramic views across the sweeping plains below. This peaceful home must thoughtfully express Bhutan's deep spiritual connection between the natural world, cultural traditions and mindful living through its architecture.
Area programme: (1) Main living areas - meditation room with viewing deck; combined living and dining area; modern kitchen. (2) Bedroom areas - three bedrooms, each with dressing area, relaxing bathroom and cosy sleeping area facing important views. (3) Special connecting spaces - welcoming entrance courtyard; outdoor sitting areas."""
Q += case("arch2025", 1, T, C1, issues=["Q1 and Q3 need sketches: uploaded as photos."], items=[
    ("Question 1: Analyse the defining characteristics of Dzong architecture in Bhutan. Discuss how these structures reflect the socio-political dynamics of the time and their historical significance. Support your answer with a labelled sketch highlighting key architectural elements.", 15,
     [("Characteristics: fortress plan, massive battered walls, utse central tower, dochey courtyards, rabsel, kachen, roof, strategic sites", 6), ("Socio-political: dual system (chhoesi) - monastic and administrative wings; defence; unification under Zhabdrung", 5), ("Labelled sketch (plan/elevation: utse, dochey, outer walls, rabsel, roof)", 4)],
     """Characteristics: built on strategic ridges or river confluences; massive tapering (battered) stone/rammed-earth walls, whitewashed with a red band (kemar) on sacred parts; few small windows low down and timber rabsels above; inward-looking courtyards (dochey); a central tower (utse) housing the main lhakhang; galleries, kachen pillars with bracket capitals; flying shingle/metal roofs with a gyaltshen; built without drawings by master carpenters.
Socio-political meaning: dzongs were built from the 17th century (e.g. Punakha, Simtokha) under Zhabdrung Ngawang Namgyal to defend against Tibetan invasions and unify the country; they housed both the monastic body and the civil administration (chhoesi, dual system), so the plan has separate courtyards for each, with the utse between. They remain district administrative and religious centres and symbols of national identity.
Sketch: plan showing outer walls, entrance, two dochey courtyards, the utse, temples and offices, plus an elevation showing battered walls, rabsel and roof - all labelled."""),
    ("Question 2: Explain the concept of adaptive reuse in heritage conservation, highlighting its significance in contemporary architecture. Discuss key considerations an architect must address while adapting a historic building for modern use, supported by relevant examples. Evaluate the challenges and benefits of this approach.", 15,
     [("Definition and significance (keeps heritage alive, sustainable, embodied energy)", 4), ("Considerations: significance and authenticity, structural safety, services, codes/fire, accessibility, reversibility, community", 5), ("Examples (e.g. old houses as heritage hotels/museums in Bhutan, Tate Modern)", 2), ("Benefits and challenges evaluated", 4)],
     """Adaptive reuse gives a historic building a new use while keeping its significance - for example a traditional farmhouse turned into a homestay or museum, Tate Modern in a former power station. It saves embodied energy and materials, keeps heritage in use and maintained, and adds character to towns.
Considerations: understand and protect significant fabric; compatibility of the new use; structural assessment and strengthening (earthquake); new services (electricity, plumbing, fire safety) inserted with minimal, reversible intervention; accessibility; building codes; traditional craftsmen and materials; involving the community and owners.
Benefits: sustainability, cost saving compared to new building, cultural continuity, tourism. Challenges: meeting modern codes, higher uncertainty and cost of repair, risk of losing authenticity, finding a suitable use and funding."""),
    ("Question 3: Bhutan's traditional settlements stand as embodiments of sustainable coexistence between human habitation and the natural world, where every architectural element, agricultural practice and social space reflects a deep-rooted Buddhist ethos of harmony. Describe how Bhutan's vernacular architecture, shaped by local topography and climate, creates a dialogue with its surrounding environment. Examine the relationship between cultivated landscapes and wild ecosystems, highlighting how centuries-old farming techniques have sustained biodiversity while meeting community needs. Explore the role of sacred spaces in weaving spiritual consciousness into daily life and shaping collective identity. Finally, illustrate through a sketch how these elements converge in a typical Bhutanese settlement. Support your analysis with specific examples from different regions of Bhutan.", 20,
     [("Vernacular architecture and climate/topography (rammed earth in west, stone in centre/east, bamboo/stilts in south; orientation, slopes)", 5), ("Cultivated vs wild: terraces, shifting/tseri, orchards, community forests, sokshing", 5), ("Sacred spaces: lhakhangs, chortens, prayer flags, sacred groves/lakes, rituals shaping identity", 5), ("Labelled settlement sketch and regional examples", 5)],
     """Architecture: houses follow the slope and face the sun; materials come from the place - rammed earth in Paro, Punakha and Thimphu, stone in Bumthang and the east, bamboo and timber houses on stilts in the hot, wet south, low stone houses with small openings in the cold north (Laya, Merak). Thick walls store heat, attics store hay and dry food, and roofs with shingles or slates shed rain and snow.
Cultivated and wild: terraced paddy fields (Punakha, Paro) follow contours, controlling erosion and water; sokshing (leaf-litter forests), community forests, pastures and orchards link farms to forests; crop rotation, mixed farming and seed saving keep biodiversity; villages sit below forests that protect water sources.
Sacred spaces: the lhakhang, chortens at entrances and bridges, prayer flags and wheels, sacred groves, lakes and mountains (nye) protected by belief; tshechus and rituals bring the community together and shape identity.
Sketch: a slope with forest and sacred site at the top, lhakhang and chorten, clustered houses, terraces and irrigation channels below, river at the bottom - labelled."""),
])
Q += case("arch2025", 2, T, C2, image="/papers/me/tech3-arch-2025-site-plan.png", issues=DRAW, items=[
    ("Deliverable 1 - Design concept: drawings/sketches showing your main concepts and a short explanation of your design choices.", 10,
     [("Clear concept linking mindfulness, nature and Bhutanese culture (e.g. journey from courtyard to meditation deck)", 4), ("Response to slope and views, zoning (public-private), orientation", 4), ("Concept sketches and explanation", 2)],
     """A strong answer explains one clear idea - for example "a mindful journey" from the entrance courtyard (arrival, letting go) through living spaces to the meditation room and deck at the edge of the slope facing the plains. The building steps down the 10° slope in terraces so it sits in the land with little cutting; public spaces (courtyard, living/dining, kitchen) near the entrance, private bedrooms on a lower terrace with views; courtyards and verandas bring nature inside; Bhutanese elements (rabsel windows, timber, stone, a small altar/choesham) and passive design for Gelephu's hot, humid climate (deep eaves, cross-ventilation, shading). Concept sketches: bubble diagram, section diagram of terraces, view lines."""),
    ("Deliverable 2 - Site plan: a drawing showing the location of the building in relation to site boundaries and topography, eco-friendly features, and sun movement and shadows.", 10,
     [("Building located within 20 m × 30 m with setbacks, following contours, access from road", 4), ("Eco features: rainwater harvesting, solar, trees retained, permeable paving, drainage", 3), ("Sun path (east-west, south) and shadow casting, north point, scale", 3)],
     """The site plan should show the 20 m × 30 m plot with contours, the road and entrance, setbacks from boundaries and the building footprint stepping along the contours; the entrance courtyard near the access, the meditation deck at the lower edge facing the view; existing trees kept; rainwater tank, solar panels on roof, permeable paving and swales for storm water; sun path from east to west passing south, shadows of the building, prevailing wind; north point and scale."""),
    ("Deliverable 3 - Technical drawings: floor plans, a section along the slope and the main elevation, indicating and explaining the integration of your design concept, sustainable systems, cultural elements and nature connectivity.", 30,
     [("Floor plans meeting the full programme, sensible sizes, circulation, furniture, dimensions", 12), ("Section along the slope: terraces, levels, structure, roof, ventilation/sun angles", 9), ("Main elevation: Bhutanese architectural character, materials, openings", 6), ("Annotations on sustainability, culture, nature connection; drawing quality", 3)],
     """Floor plans (about 1:100): entrance courtyard, living-dining (about 30-35 m²), kitchen with store, meditation room with deck facing the plains, three bedrooms each with dressing area and bathroom, outdoor sitting areas; clear circulation, furniture, dimensions and levels on the terraces.
Section along the slope: the building stepping down the 10° slope, floor levels, foundations and retaining walls, roof with deep eaves, stack and cross-ventilation arrows, sun angles, rainwater collection.
Main elevation: traditional proportions with stone/rammed-earth base, timber upper parts, rabsel windows, cornice, traditional roof; materials noted.
Annotations should explain how the design expresses mindfulness, Bhutanese culture and connection with nature, and how passive cooling, solar and water systems work."""),
])
PATTERN = STANDARD
