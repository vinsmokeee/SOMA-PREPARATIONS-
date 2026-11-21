"""ME Technical Paper III (Subject Specialisation Paper), Urban Planning, BCSE 2025 - real paper (PDF sent by the founder).
Standard pattern. All 30 MCQs kept as printed. 19 of them test Bhutan-specific rules (Bhutan Building Regulation 2018,
Spatial Planning Standards 2017, land pooling rules, Yenlag Thromdes, agency mandates) that could not be checked here:
their answer keys are Soma's best understanding and are FLAGGED; the batch name says to check them before publishing.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing"
GROUP_TAG = "urban2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "urban-planning"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Urban Planning"

MCQ = r"""[
{
"n": 1,
"stem": "The agency mandated to formulate policies related to housing and function as a Tenancy Authority in Bhutan is the:",
"opts": [
"National Housing Development Corporation Limited",
"Local Governments",
"Department of Human Settlement",
"National Pension and Provident Fund."
]
},
{
"n": 2,
"stem": "For adherence to approved land use in Bhutan, which of the following permit is required:",
"opts": [
"Building Permit",
"Notice from Local Government",
"Planning Permit",
"None of the above."
]
},
{
"n": 3,
"stem": "As per the Bhutan Building Regulation, an area of mezzanine floor shall not exceed:",
"opts": [
"30% of the plinth area",
"45% of the plinth area",
"25% of the plinth area",
"20% of the plinth area"
]
},
{
"n": 4,
"stem": "Which of the following is the Planning Model/Theory advocated by Charles E. Lindblom?",
"opts": [
"Synoptic planning",
"Advocacy planning",
"Incremental planning",
"Transactive planning"
]
},
{
"n": 5,
"stem": "As per the Bhutan Building Regulation 2018, the maximum allowable floor in rural areas is:",
"opts": [
"Two plus attic and Jamthog",
"Two plus Jamthog",
"Three plus Jamthog",
"Three plus attic and Jamthog"
]
},
{
"n": 6,
"stem": "The formula for calculating the Indicative Contribution Ratio (ICR) for land pooling is:",
"opts": [
"ICR = Infrastructure requirement (IR) +Area of proposed Reserve Plots (ARP) ×100 Area of Contributing Land (ACL)",
"ICR = Infrastructure requirement (IR) + Area of Contributing Land (ACL) ×100 Area of proposed Reserve Plots (ARP)",
"ICR = Area of proposed Reserve Plots (ARP) + Area of Contributing Land (ACL) ×100 Infrastructure requirement (IR)",
"ICR = Area of Contributing Land (ACL) - Area of proposed Reserve Plots (ARP) ×100 Infrastructure requirement (IR)"
]
},
{
"n": 7,
"stem": "As per Kevin Lynch, which of the following five elements form the image of a city?",
"opts": [
"Paths, Edges, Districts, Nodes & Landmarks",
"Paths, Edges, Rivers, Nodes & Landforms",
"Paths, Edges, Nodes, Monuments & Landmarks",
"Paths, Buildings, Nodes, Monuments & Landmarks"
]
},
{
"n": 8,
"stem": "The time horizon for a Structure Plan for implementation and review is:",
"opts": [
"30 years and 10 years",
"20 years, and 10 years",
"20 years and 5 years",
"25 years and 5 years"
]
},
{
"n": 9,
"stem": "The formula to calculate FAR is:",
"opts": [
"Gross Floor Area/Total lot size",
"Total lot size/ Gross Floor Area",
"Total Plinth Area x Gross Floor Area",
"Total lot size X Gross Floor area"
]
},
{
"n": 10,
"stem": "As per the Spatial Planning Standards 2017 of Bhutan, the population density 80-300 pph is considered as:",
"opts": [
"Very high",
"Low",
"Medium",
"High"
]
},
{
"n": 11,
"stem": "In Bhutan, the maximum limit of land pooling usually adopted is :",
"opts": [
"28%",
"32%",
"25%",
"30%"
]
},
{
"n": 12,
"stem": "Gentrification is a process of urban development in which:",
"opts": [
"A city neighborhood changes from low to high value.",
"A neighborhood's residents are often displaced.",
"There will be rising rents and living costs.",
"All of the above."
]
},
{
"n": 13,
"stem": "For the National Land Use Plan for Bhutan, for an urban area the:",
"opts": [
"Population in primary industry should be less than 50%.",
"Population in primary industry should be more than 50%.",
"Population in primary industry should be less than 25%.",
"Population in primary industry should be more than 25%."
]
},
{
"n": 14,
"stem": "Kerbed central island with diameter greater than or equal to 4m and flared approaches to allow multiple entry lanes is a description of:",
"opts": [
"Mini Roundabout",
"Conventional Roundabout",
"Raindrop Roundabout",
"None of the above"
]
},
{
"n": 15,
"stem": "What is the actual distance on ground equivalent to 2cm on a map of scale 1:25,000?",
"opts": [
"1 km",
"½ km",
"Quarter of a km",
"50m"
]
},
{
"n": 16,
"stem": "Under the Spatial Planning Framework, the tiers of spatial plans in Bhutan as per hierarchy are:",
"opts": [
"Regional Spatial Plan; National Spatial Plan; Valley Development Plan; and Local Area Plan.",
"Action Area Plan; Structure Plan; Local Area Plan; and National Spatial Plan.",
"National Spatial Plan; Regional Spatial Plan; Local Spatial Plan; and Action Area Plan.",
"National Spatial Plan; Structure Plan; Regional Spatial Plan; and Local Area Plan."
]
},
{
"n": 17,
"stem": "As per the Spatial Planning Standards of Bhutan, the parking space requirement for theatres, cinemas, concert halls, dance halls and similar places would be:",
"opts": [
"3 car parking space per 10 fixed seats",
"1 car parking space per 10 fixed seats",
"2 car parking space per 15 fixed seats",
"1 car parking space per 3 fixed seats"
]
},
{
"n": 18,
"stem": "Buffers of water courses, natural drainage and other sensitive areas shall be categorized as:",
"opts": [
"Zones",
"Precincts",
"Overlays",
"Setback"
]
},
{
"n": 19,
"stem": "What would be the FAR for a plot measuring 50 mx 30 m, has three floors measuring 15 mx10 m each and no restriction on coverage?",
"opts": [
"1",
"0.3",
"0.4",
"3.3"
]
},
{
"n": 20,
"stem": "Traditional Neighborhood Development (TND) means being able to walk somewhere within:",
"opts": [
"30 minutes",
"45 minutes",
"15 minutes",
"10 minutes"
]
},
{
"n": 21,
"stem": "An Action Area Plan is:",
"opts": [
"Strategic in nature",
"Regulatory in nature",
"General in nature",
"None of the above"
]
},
{
"n": 22,
"stem": "Which agency decides the type of building color to be adopted in Bhutan?",
"opts": [
"Department of Culture",
"Thromde",
"Dzongkhag",
"Department of Human Settlement"
]
},
{
"n": 23,
"stem": "How many Yenlag Thromdes are there in Bhutan?",
"opts": [
"20",
"40",
"4",
"24"
]
},
{
"n": 24,
"stem": "The Yenlag Thromde for Thimphu is:",
"opts": [
"Dagala",
"Namseling",
"Khasadrapchu",
"Lingzhi"
]
},
{
"n": 25,
"stem": "The Yenlag Thromde for Trashigang Dzongkhag is:",
"opts": [
"Kanglung",
"Khaling",
"Rangjung",
"Yonphula"
]
},
{
"n": 26,
"stem": "Bhutan has a Spatial Planning Act or Planning Act:",
"opts": [
"Not sure",
"False",
"True",
"I don’t know"
]
},
{
"n": 27,
"stem": "What would be the area of a neighborhood if it is to be within walk-able distance of 350 m radius?",
"opts": [
"Approximately 120 acres",
"Approximately 96 acres",
"Approximately 124 acres",
"Approximately 95 acres"
]
},
{
"n": 28,
"stem": "The City Beautiful Movement that flourished during 1890s and 1900s introduced beatification and monumental grandeur in cities. It also intended to create:",
"opts": [
"beautiful villages",
"awareness on beauty and heritage values",
"moral and civic virtue among urban populations",
"harmony between nature and infrastructure development"
]
},
{
"n": 29,
"stem": "_________is a thoroughfare that is lined with buildings. It has area defined for cars, human circulations and activity:",
"opts": [
"Street",
"Road",
"Footpath",
"Promenade"
]
},
{
"n": 30,
"stem": "____________is an international movement to reform the design of built environment and is about raising quality of life and standard of living by creating better places to live in. It is the revival of our lost art of place making:",
"opts": [
"New Urbanism",
"Contextualism",
"City Beautiful",
"Rationalism"
]
}
]"""

CHECK = "Answer key not verified: Bhutan-specific rule - an urban planner must confirm it against the current regulation/standard before publishing."
KEY = {
    1: ("c", "The Department of Human Settlement formulates housing policy and acts as Tenancy Authority (to be confirmed)."), 2: ("c", "A planning permit confirms the proposal follows the approved land use (to be confirmed)."),
    3: ("a", "Bhutan Building Regulation: mezzanine limited to a share of the plinth area (30% - to be confirmed)."), 4: ("c", "Lindblom advocated incremental planning ('muddling through')."),
    5: ("b", "BBR 2018 rural height limit (to be confirmed)."), 6: ("a", "ICR = (infrastructure requirement + reserve plots) / contributing land x 100."),
    7: ("a", "Lynch: paths, edges, districts, nodes and landmarks."), 8: ("c", "Structure plan horizon and review period (to be confirmed)."),
    9: ("a", "FAR = gross floor area / plot area."), 10: ("c", "Density band 80-300 pph per Spatial Planning Standards 2017 (to be confirmed)."),
    11: ("d", "Land pooling contribution usually up to 30% (to be confirmed)."), 12: ("d", "Gentrification raises values and rents and displaces residents."),
    13: ("a", "Urban areas: less than 50% of population in primary industry (to be confirmed)."), 14: ("b", "A kerbed central island ≥4 m with flared entries is a conventional (normal) roundabout."),
    15: ("b", "2 cm x 25 000 = 50 000 cm = 0.5 km."), 16: ("c", "National, regional, local spatial plans and action area plans (to be confirmed)."),
    17: ("b", "Parking standard for assembly halls per Spatial Planning Standards (to be confirmed)."), 18: ("c", "Buffers for water courses and sensitive areas are overlays (to be confirmed)."),
    19: ("b", "FAR = 3 x 150 / 1500 = 0.3."), 20: ("d", "TND: daily needs within a short walk (about 5-10 minutes) (to be confirmed)."),
    21: ("b", "An action area plan is detailed and regulatory (to be confirmed)."), 22: ("c", "Building colour decided locally (to be confirmed)."),
    23: ("a", "Number of Yenlag Thromdes (to be confirmed)."), 24: ("c", "Yenlag Thromde for Thimphu (to be confirmed)."),
    25: ("a", "Yenlag Thromde for Trashigang (to be confirmed)."), 26: ("c", "Bhutan's planning legislation (to be confirmed)."),
    27: ("d", "π x 350² = 384 845 m² ≈ 95 acres."), 28: ("c", "The City Beautiful movement aimed to instil moral and civic virtue."),
    29: ("a", "A street is a building-lined thoroughfare for people and vehicles."), 30: ("a", "New Urbanism revives place-making for better places to live."),
}
FLAG = {1, 2, 3, 5, 8, 10, 11, 13, 16, 17, 18, 20, 21, 22, 23, 24, 25, 26}
T = TOPIC
Q = mcqs(MCQ, KEY, T)
for q in Q:
    if int(q["key"][1:]) in FLAG: q["issues"] = [CHECK]
Q += [
    saq(1, T, """a) What is land pooling? (2 marks)
b) What public facilities and amenities can be developed on the pooled land? Where necessary, explain why they are included in land pooling. (3 marks)""",
        [("a) Land readjustment tool: landowners contribute a share of land for infrastructure/ public facilities, plots reconfigured and returned smaller but serviced and more valuable; no compensation, voluntary/ statutory", 2), ("b) Facilities with reasons: roads, footpaths, drains, water/ sewer networks, open spaces/ parks, schools, health units, community halls, markets, utilities, reserve plots for cost recovery/ affordable housing", 3)],
        """a) Land pooling (land readjustment) is a planning tool in which owners of many small, irregular plots pool their land; the government (e.g. thromde) replans the area, takes a share of each owner's land (the contribution ratio) for roads, drains and public facilities, and returns smaller but regular, serviced and more valuable plots - so infrastructure is built without large land acquisition costs, and owners share costs and benefits fairly.
b) Roads, footpaths and parking; storm-water drains, water supply, sewerage and power lines; open spaces, parks and playgrounds; schools, health units, community centres, religious structures and markets; and reserve plots that the authority can sell or lease to recover infrastructure costs or use for affordable housing. These are included because a planned, liveable neighbourhood needs them, and pooling secures the land at the start instead of buying it later."""),
    saq(2, T, "Describe the types of spatial plans in Bhutan.",
        [("Hierarchy: National Spatial Plan (e.g. NSP 2030), regional/ dzongkhag plans, structure plans for thromdes, local area plans, action area plans", 2), ("Purpose/ scale and content of each", 3)],
        "Bhutan's spatial plans work in tiers [check details against the current Spatial Planning framework]: 1. National Spatial Plan (e.g. NSP 2030) - long-term national framework for settlements, land use, infrastructure corridors, environment and growth centres. 2. Regional/dzongkhag-level plans (including valley development plans) - coordinate development across a region or valley. 3. Structure plans for thromdes/towns (e.g. Thimphu Structure Plan) - long-term (about 20-25 years) strategic plans for land use, transport, density and growth areas. 4. Local area plans (LAPs) - detailed plans for neighbourhoods within the structure plan with plots, roads, precincts and development control. 5. Action area plans - detailed, short-term plans for specific areas needing priority development or redevelopment.",
        issues=["Check against Bhutan's current spatial planning framework."]),
    saq(3, T, "Which is the lead agency responsible for urban planning and for developing the related rules and regulations in Bhutan? List some of its mandates.",
        [("Lead agency: Department of Human Settlement, Ministry of Infrastructure and Transport (formerly MoWHS) (with thromdes implementing)", 2), ("Mandates: spatial planning policies, standards and regulations (building regulations, planning standards), national/ structure plans, land pooling guidance, housing policy, urban development and capacity building, monitoring, guidelines for traditional architecture", 3)],
        "The Department of Human Settlement under the Ministry of Infrastructure and Transport (formerly the Ministry of Works and Human Settlement) leads urban and spatial planning nationally, while thromdes and dzongkhags implement plans locally [confirm current structure]. Mandates include: formulating human settlement and housing policies; preparing the National Spatial Plan and supporting structure and local area plans; developing planning and building regulations, standards and guidelines (e.g. Bhutan Building Regulation, Spatial Planning Standards, land pooling rules); guiding land use and development control; promoting affordable housing; preserving traditional architecture and settlement character; capacity building for local governments; and monitoring urban development.",
        issues=["Agency names changed in the 2022-2023 civil service reform: confirm."]),
    saq(4, T, "What transformation is needed in Thimphu to enhance liveability? Describe briefly.",
        [("Transport: walkability, footpaths, public transport, parking management, reduce congestion", 1.5), ("Green and open spaces, riverfront, environment, drainage, waste", 1.5), ("Housing affordability, mixed-use, density near nodes, services, heritage character, smart/ inclusive city, disaster resilience", 2)],
        "Thimphu needs: better mobility - safe, continuous footpaths and cycle routes, reliable city buses, parking management and reduced car dependence; more green and open spaces - protected riverfronts (Wang Chhu), parks and playgrounds, protecting forests and ridges; affordable housing and mixed-use neighbourhoods with services within walking distance (local area plans), with higher density along transport corridors and controlled sprawl on slopes; reliable water, drainage, sewerage and waste management; preserving Bhutanese architectural character and heritage; disaster resilience (earthquakes, landslides, flash floods); inclusive public spaces for children, the elderly and disabled; and participatory, digitally supported planning."),
]
C1 = """Case I: Reviewing the Thimphu City Design Code 2024
The Thimphu City Design Code 2024, part of the revised Thimphu Structure Plan, was developed by international experts to streamline development activities and designate land uses that ensure good growth in the right places. As an urban planner tasked with reviewing the code, answer the following."""
C2 = """Case II: Planning Samtse as the fifth Thromde
Samtse town is proposed to be developed as the fifth Thromde. As an urban planner, learning from the experiences of other thromdes such as Thimphu and Phuentsholing, how would you plan Samtse Thromde? Your proposals must include, but are not limited to, the parts below."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("urban2025", 1, T, C1, items=[
    it("a) List five objectives of the Design Code. Describe how these objectives can improve the existing capital city.", 15,
       [("Five objectives (e.g. walkable, people-friendly streets; context-sensitive built form/ Bhutanese character; protecting natural landscape/ slopes and rivers; appropriate density and mixed use at right places; quality public realm/ open spaces; climate/ disaster resilience; clear, predictable rules)", 7.5), ("How each improves Thimphu (congestion, sprawl, loss of character, flooding, lack of public space)", 7.5)],
       "Objectives (as an urban design code typically sets out): 1. Create walkable, people-friendly streets with active frontages - improving safety and reducing car dependence in a congested city. 2. Ensure context-sensitive built form that respects Bhutanese architecture, heights and skyline - stopping out-of-character blocks and protecting identity. 3. Protect the natural landscape - river corridors, ridges, forests and slopes, minimising cut and fill - reducing landslides and flooding and keeping Thimphu's green setting. 4. Guide density and mixed use to the right places (nodes and corridors) - reducing sprawl up the slopes and making services and public transport viable. 5. Deliver a quality public realm and open spaces - plazas, parks and setbacks that support community life. Also: climate and disaster resilience, and clear, predictable rules for developers. Together these would make Thimphu more liveable, attractive, safer and better organised as the capital grows."),
    it("b) Carry out a SWOT analysis of the Design Code.", 15,
       [("Strengths: clear standards, international expertise, holistic vision, links to structure plan, protects environment/ character", 4), ("Weaknesses: possibly complex/ technical, international view may miss local context, enforcement capacity, cost to comply, limited consultation", 4), ("Opportunities: better investment, tourism/ GMC links, liveability, climate resilience, capacity building, digital permitting", 3.5), ("Threats: weak enforcement/ political pressure, land prices/ fragmented ownership, resistance from owners/ developers, funding gaps, rapid migration, disasters", 3.5)],
       "Strengths: a clear, illustrated set of rules for built form and land use; based on international best practice; integrated with the revised structure plan; promotes walkability, open space and environmental protection; preserves Bhutanese character; gives predictability to developers. Weaknesses: may be complex and technical for owners and small builders; prepared by outsiders so some rules may not fit local topography, culture or construction costs; limited consultation; heavy demands on thromde enforcement capacity; compliance may raise costs. Opportunities: better-quality development attracting investment and tourism; improved liveability and public health; climate and disaster resilience; capacity building for local planners; digital permit systems; aligning with Gelephu Mindfulness City ideas. Threats: weak enforcement, exemptions and political pressure; high land prices and fragmented ownership; resistance from landowners and developers; lack of funding for public realm works; rapid rural-urban migration and informal development; earthquakes and floods."),
    it("c) For the concept shown (development on a slope: one large flat platform made by deep cut and fill versus smaller, stepped development platforms that minimise cut and fill), list three pros and three cons of each proposal with justification. Which would you recommend for Thimphu, and why?", 15,
       [("Large single platform - pros (easy construction/ layout, larger floor plates, cheaper per unit on paper) and cons (high cut/fill, slope instability, tall retaining walls, drainage/ visual scars)", 5), ("Stepped platforms - pros (follow contours, less earthwork, stability, natural drainage, views, landscape) and cons (more complex design/ access, higher structural detailing, smaller floor plates)", 5), ("Recommendation: stepped platforms for Thimphu's steep, landslide-prone terrain with justification", 5)],
       "Large single cut-and-fill platform - pros: simple layout and construction; large flat area for parking and bigger buildings; easier access and services. Cons: massive excavation and fill, high retaining walls and costs; destabilised slopes, landslide and erosion risk; disrupted natural drainage and ugly scars on the hillside. Smaller stepped platforms - pros: follow the natural contours, reducing earthworks, cost of retaining structures and slope failure risk; preserve natural drainage, vegetation and views; better visual integration with the hillside and traditional settlement patterns. Cons: more complex design, levels and access (steps, ramps); smaller platforms and floor plates; higher design and detailing effort. Recommendation: stepped platforms, because Thimphu's steep, seismic, landslide- and flood-prone terrain needs minimal cut and fill; this is safer, more sustainable and keeps the valley's character.",
       ),
    it("d) What are some front setback treatments for residential ground floors?", 5,
       [("Treatments: landscaped front gardens/ planting strips, low fences or hedges, raised ground floor/ privacy step-up, porches/ verandas, permeable paving, street trees, no parking in front setbacks, bins/ services screening, active frontage with windows", 5)],
       "Landscaped front gardens or planting strips; low walls, hedges or transparent fences that give privacy while keeping eyes on the street; ground floors slightly raised above street level or set behind a small porch or veranda for privacy; permeable paving and rain gardens for drainage; street trees and seating; screened areas for bins and meters; and avoiding car parking or blank walls in the front setback so the frontage stays active and pedestrian-friendly."),
])
Q += case("urban2025", 2, T, C2, items=[
    it("""a) Analyses: study of the existing scenario; identification of issues; and SWOT analysis.""", 15,
       [("Existing scenario: location (southern border, Samtse dzongkhag, near India), population and growth, land use, topography/ rivers, economy (trade, industry, agriculture), infrastructure, services, institutions (college)", 5), ("Issues: flooding/ river erosion, unplanned growth, border trade/ security, infrastructure gaps, land tenure, connectivity, heat/ disease, employment", 5), ("SWOT: strengths, weaknesses, opportunities, threats specific to Samtse", 5)],
       "Existing scenario: Samtse is a southern border town in a warm, low-lying area next to India, with a growing population, trade links, small industries, agriculture (cardamom, areca nut, oranges), institutions such as the Samtse College of Education, and road links to Phuentsholing and the planned Gelephu-related corridors. Survey land use, topography, rivers and flood zones, existing roads, water, sewerage and drainage, housing, services, land ownership and economic activities. Issues: flash floods and river bank erosion; unplanned, ribbon development along roads; inadequate water, drainage, sewerage and solid waste systems; traffic and parking at border points; informal settlements and land tenure problems; limited jobs; heat and vector-borne diseases; security and cross-border trade management. SWOT - Strengths: flat and gently sloping land, border trade location, educational institution, agricultural hinterland. Weaknesses: poor infrastructure and services, flood exposure, limited planning capacity. Opportunities: becoming a regional trade and logistics hub, industrial estates, education and tourism, learning from Phuentsholing and Thimphu, connection to national highways. Threats: floods, climate change and earthquakes, uncontrolled growth and speculation, cross-border risks, funding gaps."),
    it("b) Visioning exercise and the planning principles to be adopted.", 10,
       [("Visioning: participatory (residents, business, LG, agencies), vision statement e.g. 'A resilient, green and prosperous southern gateway'", 4), ("Principles: GNH/ sustainability, compact mixed-use growth, resilience/ flood-safe, walkable and transit, green-blue network, inclusive/ affordable, Bhutanese character, economic growth/ border trade, phased infrastructure-led development, learn from Thimphu/ Phuentsholing mistakes", 6)],
       "Visioning: run a participatory process - community meetings, business and youth groups, local government, agencies and border authorities - to agree a shared vision such as \"Samtse: a resilient, green and prosperous southern gateway town\". Planning principles: GNH and sustainability; compact, mixed-use growth instead of sprawl; flood- and disaster-resilient development (no building in flood zones, river buffers); walkable neighbourhoods with good public transport; a connected green and blue network (rivers, parks, trees for shade); inclusive and affordable housing; infrastructure-led, phased development (land pooling before plots are sold); preserving Bhutanese architectural identity; supporting trade, logistics, education and agro-industry for jobs; and learning from Thimphu's slope sprawl and Phuentsholing's density and border congestion."),
    it("c) Proposals to address the problems: set out at least five strategies, with simple sketches to illustrate your ideas.", 25,
       [("At least five relevant strategies explained (5 marks each max), e.g.: land-use zoning with growth nodes and flood-free development areas; river protection/ green buffers and flood management; land pooling for planned neighbourhoods with infrastructure; road hierarchy, bypass/ logistics hub for trucks at border, public transport and walkability; water, sewerage, drainage and solid waste systems; affordable housing; economic zones; heritage/ public spaces; governance and phasing", 20), ("Simple sketches (zoning plan, river buffer section, street section, neighbourhood layout)", 5)],
       "1. Land-use plan and zoning: define a compact urban core with mixed-use commercial streets, residential neighbourhoods, an institutional zone around the college, and an industrial/logistics zone away from homes; mark no-build flood zones. (Sketch: zoning map with core, neighbourhoods, logistics area and river buffers.) 2. Flood and river management: river training, embankments and green buffers along rivers and streams, retention ponds and a storm-water drainage network; parks and sports fields in the buffers. (Sketch: river cross-section showing buffer, embankment and park.) 3. Land pooling for planned neighbourhoods: pool fragmented plots to provide roads, drains, open spaces, schools and reserve plots before development; affordable housing on reserve plots. (Sketch: before-and-after plot layout.) 4. Transport and border logistics: a road hierarchy with a truck bypass and a dry port/logistics hub near the border to keep heavy vehicles out of the town centre; continuous shaded footpaths, cycle lanes and a bus terminal. (Sketch: street section with footpath, trees, lanes.) 5. Utilities and services: phased water supply, sewer and treatment plant, solid waste management and power; health, education and market facilities at neighbourhood centres. Also: preserve Bhutanese architecture with design guidelines; a green network of parks and street trees for shade in the hot climate; and strong thromde governance, phasing and public participation, with lessons from Thimphu and Phuentsholing."),
])
for q in Q:
    if q["key"] == "C1Q3": q["image"] = "/papers/me/tech3-urban-2025-stepped-platforms.png"
PATTERN = STANDARD
