"""ME Technical Paper III (Subject Specialisation Paper), Architecture, BCSE 2024 - real paper (PDF sent by the founder).
Standard pattern, same as the 2025 Architecture paper (the latest). MCQ 16 uses its photo. MCQs replaced because the answer
could not be confirmed (traditional Bhutanese architecture terms and pictures - an architect should check them and may restore
them with keys): 9 (rabsey typologies), 12 (order of pillar parts), 19 (heritage site categories), 20 (craftsman for the tools
pictured), 26 (carpentry tool pictured), 28 (traditional measurement pictured), 29 (lhakhang pictured), 30 (term pairs).
Part II question 1 prints "(2+5 marks)" for a 5-mark question; marked out of 5. Case II uses the site plan
(public/papers/me/tech3-arch-2024-siteplan.png).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Architecture): BCSE 2024, batch 1"
GROUP_TAG = "arch2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "architecture"
ADDS_TO_PAPER = True  # 2025 is the latest Architecture paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Architecture"
SITE = "/papers/me/tech3-arch-2024-siteplan.png"

MCQ = r"""[
{
"n": 1,
"stem": "Which architectural style is characterized by pointed arches, ribbed vaults, and flying buttresses?",
"opts": [
"Romanesque",
"Gothic",
"Baroque",
"Renaissance"
]
},
{
"n": 2,
"stem": "What is the function of a lintel in a building structure?",
"opts": [
"To provide additional floor space",
"To serve as a decorative element",
"To support the load above openings like doors and windows",
"To enhance ventilation"
]
},
{
"n": 3,
"stem": "Which timber joint is known for its strength and is typically used in traditional woodworking to join a horizontal member to a vertical member?",
"opts": [
"Dovetail joint",
"Scarf joint",
"Mortise and tenon joint",
"Finger joint"
]
},
{
"n": 4,
"stem": "What is the primary relationship described by Hooke's Law?",
"opts": [
"Stress is inversely proportional to strain",
"Stress is directly proportional to strain within the elastic limit",
"Strain is independent of stress",
"Stress is equal to strain"
]
},
{
"n": 5,
"stem": "In sustainable architecture, how does thermal mass contribute to indoor comfort in a climate with high diurnal temperature variation?",
"opts": [
"By allowing rapid cooling during the night",
"By storing heat during the day and releasing it at night",
"By preventing any temperature fluctuations",
"By reflecting sunlight away from the building"
]
},
{
"n": 6,
"stem": "Which construction method involves the use of components assembled on-site?",
"opts": [
"Cast-in-place concrete",
"Masonry construction",
"Prefabrication",
"Timber framing"
]
},
{
"n": 7,
"stem": "Which orientation is generally best for a building in a temperate climate to optimize passive solar heating?",
"opts": [
"North-South",
"East-West",
"Diagonal to prevailing winds",
"Facing directly into prevailing winds"
]
},
{
"n": 8,
"stem": "In the context of structural materials, what does the term \"ductility\" refer to?",
"opts": [
"The ability to withstand compression",
"The ability to deform under tensile stress",
"The ability to resist shear forces",
"The ability to return to original shape after deformation"
]
},
{
"n": 9,
"stem": "Which of the following is not the typology of rabsey in traditional Bhutanese architecture?",
"opts": [
"Gomang Gocham",
"Parop Rabsey",
"Gyesargo Rabsey",
"Zhubor rabsel"
]
},
{
"n": 10,
"stem": "Which of the following materials is most effective at absorbing sound and reducing noise within a space?",
"opts": [
"Glass",
"Concrete",
"Carpet",
"Metal"
]
},
{
"n": 11,
"stem": "Which typology is predominant vernacular houses in western part of Bhutan?",
"opts": [
"Stone masonry walls with internal timber frames and openings",
"Timber frame structure",
"Rammed earth walls with internal timber frames and openings",
"None of the above"
]
},
{
"n": 12,
"stem": "The architectural order from the base to top of kachen is:",
"opts": [
"Phue-Raep-Chem-Drey-Zhu-Kaden",
"Kadhen-Raep-Chem-Drey-Phue-Zhu",
"Kadhen-Chem-Raep-Drey-Zhu-Phue",
"Kadhen-Chem-Drey-Zhu-Phue-Raep"
]
},
{
"n": 13,
"stem": "The Parthenon, a famous temple in Athens, Greece, is an example of which architectural order?",
"opts": [
"Doric",
"Ionic",
"Corinthian",
"Tuscan"
]
},
{
"n": 14,
"stem": "Which of the following is NOT a passive design strategy for managing solar heat gain?",
"opts": [
"Using deciduous trees for seasonal shading",
"Incorporating deep roof overhangs",
"Installing photovoltaic panels on the roof",
"Orienting windows to avoid direct sunlight"
]
},
{
"n": 15,
"stem": "Which component of an HVAC system is responsible for removing heat from indoor air?",
"opts": [
"Air handler",
"Furnace",
"Condenser",
"Evaporator coil"
]
},
{
"n": 16,
"stem": "What style of architecture is the building shown in the photo?",
"opts": [
"Gothic",
"Renaissance",
"Neoclassical",
"Postmodern"
],
"image": "/papers/me/tech3-arch-2024-mcq16.jpg"
},
{
"n": 17,
"stem": "1 inch = ___________ cm",
"opts": [
"3.54",
"2.54",
"3.45",
"2.45"
]
},
{
"n": 18,
"stem": "In structural engineering, what does the term \"factor of safety\" refer to?",
"opts": [
"The ratio of the maximum load to the allowable load",
"The ratio of the dead load to the live load",
"The ratio of the material strength to the design strength",
"The ratio of the ultimate load to the yield load"
]
},
{
"n": 19,
"stem": "Which of the following is not the category of heritage sites in Bhutan?",
"opts": [
"Cultural landscape",
"Heritage building",
"Cultural site",
"Archaeological sites"
]
},
{
"n": 20,
"stem": "The tools shown in the picture are used by which of the following craftsman?",
"opts": [
"Zow",
"Paap",
"Do-zo",
"Jizo"
]
},
{
"n": 21,
"stem": "In painting a surface, the first coat applied is:",
"opts": [
"Primer",
"Undercoat",
"Topcoat",
"Base"
]
},
{
"n": 22,
"stem": "How does the concept of \"defensible space\" in architecture aim to influence social behaviour within a community?",
"opts": [
"By creating private areas that prevent social interactions",
"By designing spaces that promote territoriality and natural surveillance",
"By minimizing the use of public spaces to reduce interaction",
"By focusing solely on aesthetic appeal without considering social dynamics"
]
},
{
"n": 23,
"stem": "Which of the following is a sustainable building material known for its ability to regulate indoor humidity and reduce energy consumption?",
"opts": [
"Gypsum board",
"Bamboo",
"PVC",
"Aluminium"
]
},
{
"n": 24,
"stem": "The significance of heritage sites is determined by the assessment of ______________",
"opts": [
"Authenticity",
"Cultural Heritage Value",
"Integrity",
"Buffer zone"
]
},
{
"n": 25,
"stem": "Which property of bricks makes them particularly suitable for use in load-bearing walls?",
"opts": [
"High thermal insulation",
"Low compressive strength",
"High compressive strength and durability",
"Flexibility and light weight"
]
},
{
"n": 26,
"stem": "The traditional carpentry tool shown in the picture is ________",
"opts": [
"Taam",
"Daw",
"Tari",
"Ara"
]
},
{
"n": 27,
"stem": "What type of stress is produced when a material is subjected to axial loading?",
"opts": [
"Shear stress",
"Bending stress",
"Torsional stress",
"Normal stress"
]
},
{
"n": 28,
"stem": "What is the name of the traditional measurement shown in the picture?",
"opts": [
"Lalep-gang",
"Chatho-gang",
"Gi-gang",
"Tho-gang"
]
},
{
"n": 29,
"stem": "What is the name of the heritage sites shown in the picture?",
"opts": [
"Kyichu Lhakhang",
"Jambay Lhakhang",
"Tamzhing Lhakhang",
"Jangsa Lhakhang"
]
},
{
"n": 30,
"stem": "Which of the following combinations is not correct?",
"opts": [
"Kachen~zhu.",
"Boh~phana.",
"Mago~shamig.",
"Pem~chotseg."
]
}
]"""

KEY = {
    1: ("b", "Pointed arches, ribbed vaults and flying buttresses define Gothic architecture."),
    2: ("c", "A lintel spans an opening and carries the load of the wall above it."),
    3: ("c", "The mortise and tenon joint is the classic strong joint between horizontal and vertical members."),
    4: ("b", "Within the elastic limit, stress is directly proportional to strain."),
    5: ("b", "Heavy materials absorb heat by day and release it at night, evening out temperature swings."),
    6: ("c", "Prefabricated components are made off-site and assembled on site."),
    7: ("b", "A building elongated on an east-west axis exposes its long (south in the northern hemisphere) facade to the winter sun."),
    8: ("b", "Ductility is the ability to deform plastically under tensile stress without breaking."),
    10: ("c", "Soft, porous carpet absorbs sound; glass, concrete and metal reflect it."),
    11: ("c", "Western Bhutan's vernacular houses typically have rammed-earth walls with internal timber frames and openings."),
    13: ("a", "The Parthenon is the classic example of the Doric order."),
    14: ("c", "Photovoltaic panels generate electricity (active system); they are not a passive shading strategy."),
    15: ("d", "The evaporator coil absorbs heat from indoor air."),
    16: ("b", "The building shown (St Peter's Basilica, Vatican) is a landmark of Renaissance architecture."),
    17: ("b", "1 inch = 2.54 cm."),
    18: ("a", "Factor of safety = failure (ultimate) load / allowable (working) load."),
    21: ("a", "The primer is the first coat, sealing the surface and improving adhesion."),
    22: ("b", "Defensible space (Oscar Newman) uses territoriality and natural surveillance to discourage crime."),
    23: ("b", "Bamboo is renewable, low-energy and hygroscopic, helping moderate indoor humidity."),
    24: ("b", "Significance is established by assessing a site's cultural heritage value (with authenticity and integrity as conditions)."),
    25: ("c", "Bricks' high compressive strength and durability suit load-bearing walls."),
    27: ("d", "Axial loading produces normal (tensile or compressive) stress."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "In traditional Bhutanese buildings, the projecting timber bay window on the upper floor is called a", ["Rabsel", "Kachen", "Dangchu", "Chhoesham"], "a",
            "The rabsel (rabsey) is the cantilevered timber window bay typical of upper floors of Bhutanese houses."),
    new_mcq(2, T, "The main structural function of a column capital (bracket) above a pillar is to", ["Spread the beam load onto the pillar and reduce the beam span", "Decorate the floor", "Provide ventilation", "Anchor the foundation"], "a",
            "Brackets/capitals widen the bearing area, transfer beam loads into the column and shorten the effective span of the beam."),
    new_mcq(3, T, "Which international charter is the key reference for the conservation and restoration of monuments and sites?", ["Venice Charter (1964)", "Athens Charter for urban planning (1933)", "Kyoto Protocol (1997)", "Paris Agreement (2015)"], "a",
            "The Venice Charter (1964) sets the principles for conserving and restoring monuments and sites; ICOMOS was founded on it."),
    new_mcq(4, T, "In heritage conservation, 'authenticity' mainly refers to", ["The genuineness of a site's form, materials, workmanship and setting", "The age of the building only", "The size of the buffer zone", "The number of visitors"], "a",
            "Authenticity is the credibility of the information sources about a site - its form, materials, techniques, use and setting."),
    new_mcq(5, T, "A 'buffer zone' around a heritage site is meant to", ["Protect the site's setting by controlling development around it", "Store construction materials", "Provide parking only", "Increase the plot area for new buildings"], "a",
            "Buffer zones control development in the surroundings to protect the site's setting and values."),
    new_mcq(6, T, "Which joint is used to join two timber members end to end to make a longer member?", ["Scarf joint", "Mortise and tenon joint", "Dovetail joint", "Halving corner joint"], "a",
            "A scarf joint lengthens timber by joining members end to end with overlapping sloped cuts."),
    new_mcq(7, T, "Which type of chisel has a curved (U-shaped) cutting edge used for carving hollows?", ["Gouge", "Firmer chisel", "Mortise chisel", "Paring chisel"], "a",
            "A gouge has a curved blade for carving hollows and rounded shapes; the others have flat edges."),
    new_mcq(8, T, "On a drawing at a scale of 1:100, a wall measuring 4.5 cm represents a real length of", ["4.5 m", "45 m", "0.45 m", "450 m"], "a",
            "At 1:100, 1 cm on the drawing = 100 cm = 1 m, so 4.5 cm = 4.5 m."),
]

SA = [
    ("Explain your understanding of sustainable architecture. Identify two sustainable design strategies you would incorporate into a residential project and support your explanation with sketches. (printed as 2+5 marks; marked out of 5)",
     [("Sustainable architecture: designing to minimise environmental impact across the life cycle - energy, water, materials, site, health - while meeting needs and context", 2),
      ("Two strategies explained with sketches, e.g. passive solar design (south glazing, thermal mass, overhangs, insulation) and rainwater harvesting/ greywater reuse; or cross ventilation, local materials, green roof", 3)],
     "Sustainable architecture is designing and constructing buildings that meet people's needs while minimising environmental impact over the whole life cycle - using less energy and water, choosing low-impact, local and durable materials, protecting the site and ecology, creating healthy indoor environments and respecting local culture and climate. Strategies for a house: (1) Passive solar design - orient the long side to the south, with larger double-glazed windows on the south and small ones on the north, thermal mass (stone or rammed earth walls/floor) to store daytime heat, roof overhangs sized to shade the summer sun but admit winter sun, and good insulation and airtightness [sketch: section showing sun angles in summer and winter with the overhang]. (2) Rainwater harvesting - collect roof water through gutters and downpipes into a storage tank with first-flush filter for gardening, toilets and washing, with low-flow fixtures and permeable paving to recharge ground water [sketch: roof, gutters, filter, tank and overflow to a soak pit]."),
    ("Discuss the significance of site analysis in architectural design. What key factors do you consider during a site analysis, and how do they affect design decisions? Include a graphic representation.",
     [("Significance: understands constraints and opportunities, fits building to context, saves cost, sustainability, regulations", 2),
      ("Factors and impact: topography/ slope and contours, orientation/ sun path, wind, climate, soil/ geology, drainage, access/ roads, views, vegetation, neighbours/ context, utilities, zoning/ setbacks - with diagram", 3)],
     "Site analysis is the study of the site's physical, environmental, legal and cultural conditions before design. It is significant because it reveals the constraints and opportunities that shape the building - its siting, orientation, form, access and services - leading to a design that fits its context, is comfortable and energy-efficient, safe and economical, and complies with regulations. Key factors and their impact: topography and contours (stepping the building, cut and fill, drainage); sun path and orientation (placing living rooms and windows for daylight and solar gain); prevailing wind (ventilation, sheltering entrances); climate and rainfall (roof form, overhangs); soil and geology (foundations, slope stability); hydrology and drainage; access, roads and parking (entrance location); views and vistas; existing vegetation; neighbouring buildings, noise and privacy; utilities (water, power, sewer); and zoning rules (setbacks, coverage, height). [Graphic: site plan with north arrow, sun path arc, wind arrows, contours, access road, views and noise sources.]"),
    ("Describe and sketch the characteristics of a traditional vernacular house in Bhutan.",
     [("Characteristics: two/ three storeys; rammed earth (west) or stone masonry walls, timber frame; ground floor for animals/ storage; upper floors living, kitchen, choesham (shrine room); rabsel windows; open attic (jathang) under pitched shingle/ CGI roof on trusses for drying; small openings below, larger above; painted motifs; built without nails; orientation and slope", 3),
      ("Labelled sketch (elevation/ section)", 2)],
     "A traditional Bhutanese farmhouse is usually two or three storeys, built on sloping ground facing south or east. Walls: thick rammed-earth walls in western Bhutan or random-rubble stone masonry elsewhere, tapering upwards, sometimes with timber-framed (ekra wattle and daub) upper walls. The ground floor houses animals and storage, with few small openings; the upper floors contain the living rooms, kitchen with hearth, bedrooms and the choesham (altar room), which is the most decorated room. Elaborate timber rabsel (bay windows) with multi-foil arches project on the upper floor, and the timber frame, floors and staircases are joined with traditional joinery without nails. Above the top floor an open attic (jathang) under a gently pitched roof on timber trusses - traditionally shingles held by stones, now often CGI sheets - is used for drying and storing grain and fodder and for ventilation. The facades are painted with traditional motifs and colours. [Labelled sketch: elevation and section showing walls, rabsel, floors, attic space and roof.]"),
    ("Design and sketch a floor plan for a toilet in a low-income housing unit with a maximum area of 2.8 m². Clearly label all fixtures and give accurate wall-to-wall measurements and the positions of fixtures from the internal walls.",
     [("Overall internal size within 2.8 m², e.g. 1.6 m x 1.75 m (or 1.4 x 2.0); door 0.7-0.75 m width, swing not blocking WC", 1.5),
      ("Fixtures: WC (centre ~0.4-0.45 m from side wall, 0.6 m clear in front), washbasin (~0.5 x 0.4 m), shower area (~0.9 x 0.9 m) with floor trap and slope; ventilation/ window", 2.5),
      ("Neat labelled plan with dimensions", 1)],
     "Example plan: internal size 1.60 m x 1.75 m = 2.80 m². Door: 0.75 m wide on the 1.60 m wall, opening inwards along the wall (or outwards to save space). Shower: 0.90 m x 0.90 m in the far corner opposite the door, with a floor trap and 1:60 slope, and a curtain or low kerb. WC (European or Indian pan): on the long wall next to the shower, centreline 0.45 m from the side wall, with at least 0.60 m clear space in front. Washbasin (about 0.50 x 0.40 m): on the wall beside the door, its centre 0.35 m from the corner, height 0.80 m. A high window or exhaust vent (0.45 x 0.30 m) above the shower for ventilation and light. [The sketch shows the plan with all wall-to-wall dimensions and the distances of each fixture from the internal walls.]"),
]
for i, (s, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=5, topic=T, stem=s, key_points=kp, model=mod))

C1 = """Case I: Bhutanese architecture and heritage conservation
Dzongs, as the pinnacle of Bhutanese architecture, embody the spirit and values of different historical phases. Traditional farmhouses and heritage sites carry the knowledge and identity of Bhutanese building culture, and conservation begins with careful documentation and research."""
C2 = """Case II: Design competition - a green duplex residence in Bebena, Thimphu
You are invited to a design competition. Project: Design of a Green Duplex Residence in Bebena, Thimphu (UV-2 zoning area). Plot: 600 m² (20 m x 30 m; see the site plan - road along the south side, contours falling from 129.5 to 128 m towards the north, prevailing wind shown).
Programme: 2 master bedrooms with en-suite bathrooms, 2 bedrooms, 1 guest room; a spacious sitting room, a dining area, an open-plan kitchen, two common toilets; and a choeshum for spiritual practice.
Design considerations: green design (passive solar design, natural ventilation, high-performance insulation; rainwater harvesting, low-flow fixtures, sustainable landscaping; local, low-impact materials); biophilic design (maximum natural light, indoor plants, green walls, views, seamless indoor-outdoor flow especially from the sitting room to an open terrace); site-specific design (suitable for UV-2 zoning, sensitive to local culture and aesthetics with modern elements).
Deliverables: concept description (100-200 words), concept sketches, basic drawings (site plan with site and building dimensions, floor plans, at least 2 sections and 4 elevations) and descriptions of other features."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("arch2024", 1, T, C1, items=[
    it("Question 1. Sketch the section of a traditional gable roof of a farmhouse in Bhutan and label all the elements.", 15,
       [("Correct section: top masonry/ rammed earth wall, wall plate, floor/ ceiling joists, open attic space (jathang)", 4),
        ("Roof frame: posts/ struts on joists, purlins, ridge, rafters, battens; free-standing roof raised above the walls", 6),
        ("Roof covering: wooden shingles (dranshing) held by stones or CGI sheets, eaves overhang; labels neat", 5)],
       "The section shows: the thick top wall (rammed earth or stone) with a timber wall plate; the top-floor ceiling/floor joists spanning the walls with planks or mud-and-bamboo topping; above them the open attic (jathang) that is not enclosed by walls, allowing air to flow for drying grain; short timber posts and struts standing on the joists supporting the purlins and the ridge beam; rafters and battens on the purlins forming a low-pitched gable roof, raised clear above the walls; the roof covering of wooden shingles weighed down by stones (traditionally) or corrugated iron sheets; and wide eaves overhangs protecting the walls from rain. All elements are labelled (wall, wall plate, joist, ceiling, post/strut, purlin, ridge, rafter, batten, shingle/CGI, stones, eave, attic space). [Expert: Dzongkha terms for each element may be added.]"),
    it("Question 2. Describe the process of documentation and research in heritage conservation, emphasising the methods and tools used to document a site before conservation work. Give examples of how documentation helps deduce the cultural heritage value of sites, with case examples and illustrations.", 10,
       [("Research: archives, history, oral history from community/ elders, previous records, religious and social significance", 3),
        ("Documentation methods/ tools: measured drawings (plans, sections, elevations), photography, photogrammetry, laser scanning, total station/ drone, condition survey and material analysis, inventory forms/ GIS database", 4),
        ("How it deduces value: reveals historic phases, craftsmanship, authenticity, integrity; guides intervention; case examples (e.g. a lhakhang or dzong restoration, Wangduephodrang Dzong after the 2012 fire)", 3)],
       "Before conservation, a site is researched and documented so that its significance is understood and the work respects it. Research includes archival sources (historical texts, namthars, old photographs, previous drawings), oral history from the community, lams and elders about its origin, rituals and changes, and comparison with similar sites. Documentation methods: measured drawings (plans, sections, elevations, details) by hand and with total stations; systematic photography; photogrammetry and 3D laser scanning (and drones for roofs and settings) to produce accurate models; condition surveys mapping cracks, decay and alterations; material and paint analysis; and recording everything in inventory forms and a database/GIS. Documentation helps deduce cultural heritage value by revealing construction phases, original materials and craftsmanship, layout and use of spaces, alterations over time, and the site's associations with people and rituals - establishing its authenticity and integrity and identifying the most significant elements to protect. Example: the detailed documentation of Wangduephodrang Dzong before and after the 2012 fire enabled its faithful reconstruction; documentation of old rammed-earth houses and lhakhangs by the Department of Culture records their historic value before repair. [Illustrations: measured plan and photographic record.]"),
    it("Question 3. Ludwig Mies van der Rohe said, 'Architecture is the will of an epoch translated into space.' Discuss the role of dzong architecture in unifying Bhutan, focusing on its design, form and architectural expression. Give a chronological overview of how dzong architecture evolved with changes in the country's socio-political system. Highlight three distinct typologies with examples of specific dzongs and sketches of their layouts, identifying key spaces.", 25,
       [("Role in unification: Zhabdrung Ngawang Namgyal's 17th-century dzongs as fortress + monastery + administration (dual system, Chhoesi), symbols of authority and identity; strategic locations; unified style", 7),
        ("Design/ form/ expression: massive battered white walls, red band (khemar), central utse tower, courtyards (dochey), rabsels, single entrance, strategic sites (ridges, river confluences), no nails", 5),
        ("Chronology: early fortified temples/ pre-Zhabdrung; 17th century Zhabdrung era (Simtokha 1629, Punakha 1637, Trongsa); later penlops/ desi era expansions; monarchy (1907) - dzongs as seats of dzongkhag administration; modern era renovations, separate administrative buildings, new dzongs (e.g. Tashichho Dzong rebuilt 1960s-70s)", 7),
        ("Three typologies with examples and layout sketches labelling utse, courtyards, lhakhangs, administrative wings, monastic quarters: e.g. ridge-type (Trongsa/ Dagana), confluence/ valley-floor type (Punakha, Wangduephodrang), single-courtyard compact (Simtokha) vs double-courtyard (Punakha/ Paro)", 6)],
       """Role in unification: in the 17th century Zhabdrung Ngawang Namgyal unified Bhutan and established the dual system of governance (chhoesi), with religious and secular authority side by side. Dzongs were his instruments: each was a fortress for defence against Tibetan invasions and local rivals, a monastery for the state clergy and an administrative seat for the penlop or dzongpon. Built at strategic points controlling valleys and routes, with a recognisable architecture, they projected central authority and a shared Drukpa identity across the country, and they still house the dzongkhag administration and monastic body today.
Design, form and expression: massive inward-sloping (battered) white-washed walls of stone or rammed earth with few openings at lower levels; a broad red band (khemar) near the top marking sacred status; a single fortified entrance; courtyards (dochey) dividing the administrative and monastic sections; a central tower (utse) housing the main lhakhangs; tiers of timber rabsels, galleries and painted woodwork on the inner facades; and pitched roofs raised over the walls with gilded finials - all built traditionally without nails or drawings, guided by master builders (zochen).
Chronology: (1) pre-Zhabdrung fortified monasteries and temples (13th-16th centuries) built by religious lineages; (2) the Zhabdrung era (1616-1651): Simtokha (1629, the first dzong combining monastic and administrative functions), Punakha (1637, the winter seat), Wangduephodrang (1638), Paro Rinpung (1646), Trongsa (expanded 1640s); (3) the period of penlops and desis (17th-19th centuries) - dzongs enlarged as regional power centres, rebuilt after fires and earthquakes; (4) the monarchy from 1907 - dzongs became seats of the government and dzongkhag administration; Tashichho Dzong was greatly enlarged in the 1960s-70s as the seat of government; (5) modern times - conservation and reconstruction (Wangduephodrang after the 2012 fire), new dzongs for new dzongkhags, and offices sometimes moved to separate buildings while dzongs keep their religious and symbolic role.
Typologies (with layout sketches labelling entrance, courtyards, utse, lhakhangs, administrative wing, monks' quarters): (a) compact single-courtyard dzong around a central utse - Simtokha Dzong; (b) linear ridge or spur dzong following a ridge with several courtyards in a row - Trongsa Dzong, Wangduephodrang Dzong on its ridge; (c) valley-floor/ river-confluence dzong with two or more courtyards separating administrative (dzong) and monastic (utse) sections - Punakha Dzong at the confluence of the Pho and Mo Chhu, and Paro Rinpung Dzong. Each typology reflects the site and the political needs of its time, translating the will of the epoch - unification, defence and the dual system - into space."""),
])
Q += case("arch2024", 2, T, C2, image=SITE, items=[
    it("Prepare your competition submission: (a) a brief concept description (100-200 words); (b) sketches supporting the concept; (c) basic drawings - site plan with site and building dimensions, floor plans, at least two sections and four elevations; (d) descriptions of any other features.", 50,
       [("Concept (100-200 words) clear, linked to green, biophilic and Bhutanese cultural principles", 8),
        ("Site response: setbacks per UV-2 rules, building on 20 x 30 m plot with access from south road, use of slope (contours 129.5→128 m), orientation for sun (main living to south/ sun) and prevailing wind for cross ventilation, parking, landscaping", 8),
        ("Programme and planning: all required spaces (2 master + en-suite, 2 bedrooms, guest room, sitting, dining, open kitchen, 2 common toilets, choeshum) logically zoned in duplex floors; circulation; choeshum on upper floor in a quiet, respected position", 10),
        ("Green features: passive solar, thermal mass, insulation, double glazing, natural ventilation, rainwater harvesting tank, low-flow fixtures, solar water heating/ PV, local materials (stone, timber, rammed earth/ CSEB)", 8),
        ("Biophilic features: daylight, skylights, indoor plants/ green wall, views, terrace and indoor-outdoor flow, natural materials", 6),
        ("Drawings quality: site plan, plans, 2 sections, 4 elevations with traditional elements (rabsel, roof, cornice) and modern expression; labelled and dimensioned", 10)],
       """Concept (example): "Dragon's Breath House" sits gently on the gentle north-falling slope of the Bebena plot, opening its long south face to the winter sun and its terraces to the views. The duplex steps with the contours, reducing excavation, and is built of local stone, rammed earth and timber with high-performance insulation and double glazing. Living spaces flow onto a sun terrace and garden through large south windows, while a central skylit stair with a green wall brings daylight and greenery into the heart of the home. The upper floor holds the private bedrooms and a quiet choeshum facing east. Rainwater from the roof fills an underground tank, and solar panels and a solar water heater sit discreetly on the traditional raised roof. Rabsel windows, painted cornices and a modern glazed terrace combine Bhutanese identity with contemporary living (about 150 words).
Site and planning: the building footprint (about 12 m x 15 m) is placed within the UV-2 setbacks (e.g. about 3-5 m front setback and required side setbacks - to be checked with Thimphu Thromde rules), with the entrance and parking from the road on the south, the long axis east-west so the main rooms face south, and the garden and terrace on the sunnier side; cross-ventilation openings align with the prevailing wind. Ground floor: entrance foyer, spacious sitting room opening to the terrace, dining area and open-plan kitchen, guest room with access to a common toilet, store and stair. First floor: two master bedrooms with en-suite bathrooms on the south side, two bedrooms, a second common toilet, family lounge and the choeshum in a quiet, elevated east-facing position. Green features: passive solar gain with thermal-mass floors and walls, roof overhangs sized for summer shading, insulation and airtightness, natural cross and stack ventilation through the skylit stair, rainwater harvesting tank, low-flow fixtures, greywater reuse for the garden, solar water heating and PV, LED lighting, and local stone, timber and compressed earth blocks. Biophilic features: maximum daylight, skylights, indoor planting and a green wall, views to the landscape, natural materials and a seamless sitting room-terrace-garden connection. Drawings: site plan with plot (20 x 30 m) and building dimensions, contours, setbacks, access and landscaping; ground- and first-floor plans with labelled, dimensioned rooms; two sections (through the stair/skylight and through the living area showing sun angles and the raised traditional roof); and four elevations showing the stone base, white walls, rabsel windows, cornice band and roof. Other features: drainage swales following the slope, permeable paving, and a small vegetable garden."""),
])
PATTERN = STANDARD
