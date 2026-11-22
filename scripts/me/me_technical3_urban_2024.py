"""ME Technical Paper III (Subject Specialisation Paper), Urban Planning, BCSE 2024 - real paper (PDF sent by the founder).
Standard pattern, same as the 2025 Urban Planning paper (the latest).
Repeated in 2025 (not loaded again; 2024 recorded in me_technical3_repeats_2024_batch9.sql): MCQs 1, 2, 4, 9, 10, 14, 15, 20, 24, 30.
Left out (Bhutan rules/ figures that could not be confirmed, or no correct option): MCQs 3 (setback - no option is 'B' alone),
5, 6, 7, 18, 21, 22, 23, 29 and short answer 1 (Thimphu Structure Plan 2023-2048 concepts); nine new MCQs and one new short answer.
MCQ 8 and 11 show the paper's figures (public/papers/me/tech3-urban-2024-{far,roads}.png).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1"
GROUP_TAG = "urban2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "urban-planning"
ADDS_TO_PAPER = True  # 2025 is the latest Urban Planning paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Urban Planning"

MCQ = r"""[
{
"n": 1,
"stem": "The agency responsible for formulating policies related to housing and functioning as a Tenancy Authority in Bhutan is the:",
"opts": [
"National Housing Development Corporation Limited",
"Department of Human Settlement",
"Tenancy unit under each Local Government",
"National Pension and Provident Fund"
]
},
{
"n": 2,
"stem": "The formula for calculating the Indicative Contribution Ratio (ICR) for land pooling is:",
"opts": [
"ICR = Infrastructure requirement (IR) +Area of proposed Reserve Plots (ARP) ×100 Area of Contributing Land (ACL)",
"ICR = Infrastructure requirement (IR) + Area of Contributing Land (ACL) ×100 Area of proposed Reserve Plots (ARP)",
"ICR = Area of proposed Reserve Plots (ARP) + Area of Contributing Land (ACL) ×100 Infrastructure requirement (IR)",
"ICR = Area of Contributing Land (ACL) - Area of proposed Reserve Plots (ARP) ×100 Infrastructure requirement (IR)"
]
},
{
"n": 3,
"stem": "“Setback” in a building can be defined as: A the distance between the building wall and the roof eave board B the distance between the plot boundary and building C the distance between two or more buildings D the distance between the building wall and the plinth protection",
"opts": [
"A",
"B and D",
"B and C",
"D"
]
},
{
"n": 4,
"stem": "The maximum allowable floor in rural areas is:",
"opts": [
"One",
"Two",
"Three",
"Four"
]
},
{
"n": 5,
"stem": "Which document guides the urban planners in assessing the building height, setback, and the coverage while preparing a spatial plan in rural areas in Bhutan?",
"opts": [
"National Human Settlement Policy",
"Land Pooling and Readjustment Regulations",
"Bhutan Building Regulations",
"Construction Industry Policy"
]
},
{
"n": 6,
"stem": "How many Dzongkhag and Yenlag Thromdes are there?",
"opts": [
"40 Dzongkhag Thromdes and 40 Yenlag Thromdes",
"20 Dzongkhag Thromdes and 20 Yenlag Thromdes",
"4 Dzongkhag Thromdes and 20 Yenlag Thromdes",
"64 Dzongkhag Thromdes and 4 Yenlag Thromdes"
]
},
{
"n": 7,
"stem": "The time horizon for a Local Area Plan for implementation and review is:",
"opts": [
"10 years and 8 years respectively",
"20 years, and 10 years respectively",
"20 years and 5 years respectively",
"10 years and 5 years respectively"
]
},
{
"n": 8,
"stem": "The FAR and coverage for the building in the figure below (four equal floors; the building footprint covers one quarter of the plot) will be:",
"opts": [
"1 and 25%",
"1 and 50",
"0.5 and 100%",
"1 and 200%"
],
"image": "/papers/me/tech3-urban-2024-far.png"
},
{
"n": 9,
"stem": "Buffers of water courses, natural drainage and other sensitive areas shall be categorized as:",
"opts": [
"Setback",
"Precincts",
"Overlays",
"Zones"
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
"stem": "In the figure below, the road network in blue is classified as:",
"opts": [
"Tertiary road",
"Primary road",
"Secondary road",
"Access road"
],
"image": "/papers/me/tech3-urban-2024-roads.png"
},
{
"n": 12,
"stem": "“Human Scale” is a principle of which of the following urban planning theory:",
"opts": [
"Smart Growth",
"Intelligent Urbanism",
"Eco City Model",
"New Urbanism"
]
},
{
"n": 13,
"stem": "Who is the author of the award-winning book “A Well Tempered City”?",
"opts": [
"Ann Rand",
"Le Corbusier",
"Jonathan F.P.Rose",
"Ebenezer Howard"
]
},
{
"n": 14,
"stem": "The formula to calculate FAR is:",
"opts": [
"Total lot size X Gross Floor area",
"Gross Floor Area/Total lot size",
"Total lot size/ Gross Floor Area",
"Total Plinth Area x Gross Floor Area"
]
},
{
"n": 15,
"stem": "The hierarchical tiers of spatial plans in Bhutan as per the Spatial Planning Framework are:",
"opts": [
"Action Area Plan; Structure Plan; Local Area Plan; and National Spatial Plan",
"National Spatial Plan; Structure Plan; Regional Spatial Plan; and Local Area Plan",
"Regional Spatial Plan; National Spatial Plan; Valley Development Plan; and Local Area Plan",
"National Spatial Plan; Regional Spatial Plan; Local Spatial Plan; and Action Area Plan"
]
},
{
"n": 16,
"stem": "What would be the FAR for a plot measuring 30 m x 20 m that has one floor measuring 15 m x 10 m and no restriction on coverage?",
"opts": [
"1",
"4",
"0.25",
"1.5"
]
},
{
"n": 17,
"stem": "The total land area of Bhutan is:",
"opts": [
"37,500 sq.km",
"37,252 sq.km",
"38,494 sq.km",
"38,394 sq.km"
]
},
{
"n": 18,
"stem": "The target scale of maps for a Local Area Plan in Bhutan is:",
"opts": [
"1:2500",
"1:5000",
"1:500",
"1:10000"
]
},
{
"n": 19,
"stem": "The founder of the Garden City Movement is:",
"opts": [
"Raymond Unwin",
"Ebenezer Howard",
"Henry George",
"Edward Bellamy"
]
},
{
"n": 20,
"stem": "In Bhutan, the maximum limit of land pooling is:",
"opts": [
"25%",
"40%",
"28%",
"30%"
]
},
{
"n": 21,
"stem": "The Local Spatial Plans comprise:",
"opts": [
"National Spatial Plan, Regional Spatial Plan, and Structure Plan",
"Action Area Plan and National Spatial Plan",
"Valley Development Plan and Regional Spatial Plan",
"Valley Development Plan, Structure Plan, and Local Area Plan"
]
},
{
"n": 22,
"stem": "The National Housing Policy of Bhutan aims to achieve the following vision:",
"opts": [
"Promote livability",
"Increase housing stock",
"Promote community vitality",
"Enhanced human dignity through safe and affordable housing for all citizens"
]
},
{
"n": 23,
"stem": "The vision of the Comprehensive National Development Plan for Bhutan 2030 is:",
"opts": [
"Promote regionally balanced development and reduction of disparity between urban and rural areas",
"Promote housing development and regionally balanced development",
"Control rural-urban migration",
"Promote smart cities"
]
},
{
"n": 24,
"stem": "For the National Land Use Plan for Bhutan, for an urban area the:",
"opts": [
"Population in primary industry should be more than 50%",
"Population in primary industry should be less than 25%",
"Population in primary industry should be less than 50%",
"Population in primary industry should be more than 25%"
]
},
{
"n": 25,
"stem": "The percentage of urban population of Bhutan in 2017 was:",
"opts": [
"41%",
"35.7%",
"37.8%",
"39.3%"
]
},
{
"n": 26,
"stem": "Application of proceeds in Land Pooling means:",
"opts": [
"Application to the local government for construction",
"The proceeds of the sale of a reserve plot or residual land",
"Building Tax",
"Building and Planning Permit"
]
},
{
"n": 27,
"stem": "One or more areas where common land uses and activities are anticipated are called:",
"opts": [
"Zones",
"Overlays",
"Community",
"Land Use Plans"
]
},
{
"n": 28,
"stem": "Distance to be kept from landfills is an example of:",
"opts": [
"Overlays",
"Zones",
"Precinct",
"Protected areas"
]
},
{
"n": 29,
"stem": "As per the Spatial Planning Standards 2017, for new development or extension of existing settlement, the land allocation (sqm/pp) required for parking:",
"opts": [
"1.5",
"2",
"2.5",
"0.5"
]
},
{
"n": 30,
"stem": "Gentrification is a process of urban development in which:",
"opts": [
"A city neighborhood changes from low to high value",
"A city neighborhood changes from high to low value",
"There will be low rents and living costs",
"All of the above."
]
}
]"""

KEY = {
    8: ("a", "Gross floor area = 4 x (plot/4) = plot area, so FAR = 1; footprint = a quarter of the plot, so coverage = 25%."),
    11: ("a", "The legend shows blue lines as tertiary roads."),
    12: ("b", "Human scale is one of the principles of Intelligent Urbanism (Christopher Benninger), used in Thimphu's planning."),
    13: ("c", "'The Well-Tempered City' (2016) was written by Jonathan F. P. Rose."),
    16: ("c", "FAR = gross floor area / plot area = (15 x 10)/(30 x 20) = 150/600 = 0.25."),
    17: ("d", "Bhutan's area is usually given as 38,394 sq. km."),
    19: ("b", "Ebenezer Howard founded the Garden City movement ('To-morrow: A Peaceful Path to Real Reform', 1898)."),
    25: ("c", "PHCB 2017: about 37.8% of Bhutan's population lived in urban areas."),
    26: ("b", "Proceeds are the money from the sale of reserve plots or residual land, applied to the project's costs."),
    27: ("a", "Zones are areas where common land uses and activities are anticipated."),
    28: ("a", "Buffer distances such as from landfills are overlays applied on top of zones."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "Clarence Perry is best known for the concept of the", ["Garden City", "Neighbourhood Unit", "Radiant City", "Linear City"], "b",
            "Clarence Perry proposed the Neighbourhood Unit (1929), centred on an elementary school within walking distance."),
    new_mcq(2, T, "Transit-Oriented Development (TOD) mainly promotes", ["low-density housing far from transit", "compact, mixed-use, walkable development around public transport stations", "large car parks at city centres", "industrial zones along highways"], "b",
            "TOD concentrates mixed uses and density within walking distance of transit stops."),
    new_mcq(3, T, "Ground coverage of a building is", ["gross floor area divided by plot area", "building footprint (plinth) area as a percentage of plot area", "total height divided by road width", "number of floors times plot area"], "b",
            "Coverage = footprint area / plot area x 100; FAR uses total floor area."),
    new_mcq(4, T, "A 400 m² plot has a building with three floors of 200 m² each. Its FAR is", ["0.5", "1.0", "1.5", "3.0"], "c",
            "FAR = 3 x 200 / 400 = 1.5 (coverage 50%)."),
    new_mcq(5, T, "'Broadacre City', a decentralised low-density vision, was proposed by", ["Frank Lloyd Wright", "Le Corbusier", "Patrick Geddes", "Daniel Burnham"], "a",
            "Frank Lloyd Wright proposed Broadacre City in the 1930s."),
    new_mcq(6, T, "Who wrote 'The Death and Life of Great American Cities' (1961)?", ["Lewis Mumford", "Jane Jacobs", "Kevin Lynch", "Jan Gehl"], "b",
            "Jane Jacobs' book criticised modernist planning and championed mixed-use, lively streets."),
    new_mcq(7, T, "A regulation that controls the physical form of buildings and public spaces, rather than mainly separating land uses, is a", ["Euclidean zoning code", "form-based code", "tax code", "land pooling scheme"], "b",
            "Form-based codes regulate building form, frontage and public realm."),
    new_mcq(8, T, "The planning method 'survey before plan' (survey - analysis - plan) is associated with", ["Patrick Geddes", "Ebenezer Howard", "Robert Moses", "Clarence Stein"], "a",
            "Patrick Geddes, father of regional planning, advocated civic survey before planning."),
    new_mcq(9, T, "'Ville Radieuse' (Radiant City), with tall towers set in open green space, was proposed by", ["Le Corbusier", "Ebenezer Howard", "Jane Jacobs", "Arturo Soria y Mata"], "a",
            "Le Corbusier proposed the Radiant City in 1930."),
]

SA = [
    ("Explain the concept of Transit-Oriented Development (TOD) and list four of its principles. (5 marks)",
     [("Concept: compact, mixed-use, higher-density development within walking distance (400-800 m) of public transport stations, reducing car dependence", 2),
      ("Principles (any four): walkability, cycling, connectivity/ short blocks, mixed use, density near transit, quality public transport, limited parking, shift to sustainable modes, public spaces", 3)],
     "Transit-Oriented Development is the planning of compact, mixed-use, higher-density neighbourhoods within walking distance (about 400-800 m) of public transport stations or stops, so that people can live, work and shop near transit and rely less on private cars. Principles (ITDP TOD Standard): 1. Walk - safe, active, comfortable streets for pedestrians; 2. Cycle - priority networks for non-motorised transport; 3. Connect - dense, short-block street networks; 4. Transit - development located near high-quality public transport; 5. Mix - mixed land uses and incomes; 6. Densify - density matched to transit capacity; 7. Compact - short distances, infill rather than sprawl; 8. Shift - reduce road and parking space to encourage sustainable modes."),
    ("What are the different land mobilisation techniques adopted in Bhutan for urban development? Describe briefly. (5 marks)",
     [("Land pooling/ readjustment: owners contribute a share of land for roads, services and reserve plots and receive smaller serviced plots back (e.g. Thimphu LAPs)", 2),
      ("Land acquisition with compensation/ land substitution; guided land development; land exchange/ lease of government land; brief description", 3)],
     "1. Land pooling (land readjustment) - the main technique in Bhutan's urban local area plans: landowners pool their land, a percentage is contributed for roads, drains, open spaces, public facilities and reserve plots (sold to recover costs), and owners receive back regular, serviced plots of higher value. It avoids large compensation costs and keeps owners on their land. 2. Land acquisition - the government acquires private land for public purposes under the Land Act, paying compensation in cash or giving substitute land (land substitution) elsewhere. 3. Guided land development - the authority plans and provides basic infrastructure (road and service corridors) on private land, guiding owners to develop according to the plan. 4. Use of government land - allotment or lease of state land for housing, institutions and infrastructure, and land exchange where needed."),
    ("List down five components/principles of a resilient city. (5 marks)",
     [("Any five principles with brief meaning: reflective, robust, redundant, flexible, resourceful, inclusive, integrated (Rockefeller 100RC); or risk assessment, resilient infrastructure, ecosystem protection, preparedness/ early warning, governance, social cohesion", 5)],
     "A resilient city can withstand, adapt to and recover quickly from shocks (floods, earthquakes, pandemics) and stresses. Principles (Rockefeller Foundation's resilience qualities): 1. Reflective - learns from past experience; 2. Robust - well-designed infrastructure that does not fail catastrophically; 3. Redundant - spare capacity and alternative systems (e.g. multiple road and water connections); 4. Flexible - can change and adapt strategies; 5. Resourceful - finds alternative ways to meet needs during a crisis; 6. Inclusive - involves all communities, especially the vulnerable; 7. Integrated - systems and agencies work together. Components include hazard and risk mapping, risk-informed land use, resilient infrastructure, protecting natural buffers (rivers, forests), early warning and emergency preparedness, and good governance."),
    ("List down any five principles of Smart Growth. (5 marks)",
     [("Any five of the ten principles: mixed land uses; compact building design; range of housing choices; walkable neighbourhoods; distinctive communities with sense of place; preserve open space, farmland, natural beauty; strengthen existing communities (infill); variety of transport choices; predictable, fair, cost-effective decisions; community and stakeholder collaboration", 5)],
     "Smart Growth principles (US Smart Growth Network): 1. Mix land uses; 2. Take advantage of compact building design; 3. Create a range of housing opportunities and choices; 4. Create walkable neighbourhoods; 5. Foster distinctive, attractive communities with a strong sense of place; 6. Preserve open space, farmland, natural beauty and critical environmental areas; 7. Strengthen and direct development towards existing communities (infill); 8. Provide a variety of transport choices; 9. Make development decisions predictable, fair and cost-effective; 10. Encourage community and stakeholder collaboration in development decisions."),
]
for i, (s, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=5, topic=T, stem=s, key_points=kp, model=mod))

C1 = """Case I: Planning a mindfulness city in Gelephu
The first ever mindfulness city in the world is being planned in Gelephu. The city is expected to integrate cultural promotion, mindfulness and economic development, among others. You have been recruited as the Lead Planner to plan the city. Explain some of the concepts/proposals and the implementation framework that you will adopt for the city. The proposals must include, but are not limited to, the parts below. Use simple sketches to illustrate your ideas."""
C2 = """Case II: Making Thimphu liveable and affordable
Thimphu is the most populated city in Bhutan. Despite continuous interventions, the city still lacks the desired liveable quality of a capital city. You have been tasked to review the issues and come up with strategies to improve the image of the city and ensure that it becomes affordable for all sections of society. Describe some of the strategies/interventions you would propose. The proposals must include, but are not limited to, the parts below."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("urban2024", 1, T, C1, items=[
    it("a) Analyses.", 10,
       [("Site and context analysis: location (southern border, plains, connectivity to India/ Assam, airport, rail), topography, rivers/ floodplains, forests, wildlife corridors, climate and hazards (floods, heat)", 5),
        ("Socio-economic and institutional: existing town and villages, land ownership, population projections, economy, infrastructure gaps; SWOT analysis", 5)],
       "Analyses would include: (1) regional context and connectivity - Gelephu's location on the southern border with access to India's markets, road, rail and air links; (2) physical analysis - topography, rivers and floodplains, forests, wildlife corridors and agricultural land, soils and geology; (3) hazards and climate - flooding from rivers and streams, heat and humidity, earthquakes, climate change projections; (4) existing settlements - the current town, villages and land ownership, land use and infrastructure (water, sewerage, power, roads); (5) socio-economic study - population and migration projections, employment, skills and potential economic sectors (green industries, services, education, health, tourism, agriculture); (6) cultural and heritage assets; (7) institutional and legal framework; and (8) a SWOT analysis summarising strengths (location, land, national vision), weaknesses (infrastructure, floods, skills), opportunities (investment, connectivity, green economy) and threats (environmental damage, speculation, social displacement). Analyses use GIS mapping, field surveys and stakeholder consultations."),
    it("b) Visioning exercise and planning principles to be adopted.", 10,
       [("Visioning: participatory process (citizens, local government, experts, investors), shared vision statement reflecting GNH, mindfulness, culture, economy, sustainability", 4),
        ("Principles: GNH and mindfulness, nature first (protect rivers, forests, corridors - development in harmony), compact walkable mixed use, carbon neutral/ green infrastructure, culture and heritage, inclusive and affordable, resilience, smart/ economic opportunity", 6)],
       "Visioning: a participatory process involving residents and landowners, local government, national agencies, experts, youth and investors through workshops and surveys, leading to a shared vision such as 'a mindful, green and prosperous city where people, culture and nature thrive together'. Planning principles: (1) Gross National Happiness and mindfulness as the guiding values - wellbeing, community and contemplative spaces; (2) nature first - protect rivers, floodplains, forests and wildlife corridors as a blue-green network and build in harmony with nature; (3) carbon-neutral, climate-resilient development - renewable energy, green buildings, flood-sensitive design; (4) compact, walkable, mixed-use neighbourhoods with public and non-motorised transport; (5) cultural promotion - Bhutanese architecture and identity, spaces for festivals, arts and spiritual practice; (6) inclusive and affordable - housing and services for all incomes; (7) a vibrant, sustainable economy - clean industries, knowledge, services and agriculture; (8) good governance and smart, efficient services."),
    it("c) Concepts/ proposals for the city.", 15,
       [("Spatial concept: compact nodes/ neighbourhoods linked by transit along a spine, separated by green and blue corridors; zoning of economic, residential, cultural/ spiritual, education/ health districts", 6),
        ("Specific proposals: mindfulness and cultural centres, meditation parks, riverfront parks, flood-resilient design, green buildings, renewable energy, walkable streets/ cycling/ e-transit, affordable housing, eco-industrial and knowledge zones, agriculture belts, smart infrastructure", 6),
        ("Coherence with vision and principles; justification and feasibility", 3)],
       "Spatial concept: a network of compact, walkable neighbourhoods and mixed-use nodes connected by a public transit spine (electric buses or light rail), set within a continuous blue-green network of rivers, wetlands, forests and farmland that also acts as flood protection and wildlife corridors. Proposals: (1) a cultural and mindfulness core with a dzong-inspired civic centre, meditation and retreat centres, monasteries, cultural institutes and public squares for festivals; (2) riverfront parks and floodplain parks that absorb floods, with buildings set back and raised; (3) economic districts - clean industry and logistics near the border and rail, a knowledge and education hub, health and wellness tourism, IT and green finance; (4) agricultural belts and urban farming for food security; (5) mixed-income housing neighbourhoods with schools, clinics and markets within a 10-minute walk; (6) green buildings using Bhutanese architecture, local materials and passive design for the hot, humid climate; (7) renewable energy (hydro, solar), rainwater harvesting, decentralised wastewater treatment, zero-waste management; (8) walkable shaded streets, cycle lanes and limited car use in the centre; (9) smart city systems for services and governance. These proposals realise the vision of a city combining mindfulness, culture, nature and prosperity."),
    it("d) Implementation framework.", 10,
       [("Institutions and governance: special authority/ development agency, roles of national and local agencies, legal framework (special laws, development control regulations)", 4),
        ("Phasing (short, medium, long term), land mobilisation (land pooling, acquisition with fair compensation), financing (PPP, investors, green bonds, land value capture), monitoring and evaluation, stakeholder participation, capacity building", 6)],
       "Implementation framework: (1) institutions - a dedicated city development authority with clear powers, coordinating national ministries, the Dzongkhag and Thromde, utility agencies and private developers; (2) legal and regulatory - the master plan, zoning and development control regulations, design codes and environmental safeguards, with streamlined permitting; (3) land mobilisation - land pooling for urban areas, land acquisition with fair compensation or land substitution, and protecting landowners' interests; (4) phasing - Phase 1 (0-5 years): trunk infrastructure, flood protection, the first neighbourhood and core facilities; Phase 2 (5-15 years): expansion of economic districts and housing; Phase 3 (15+ years): full build-out, reviewed periodically; (5) financing - public investment, public-private partnerships, foreign direct investment, green bonds and climate finance, land value capture from serviced land; (6) monitoring and evaluation - indicators for wellbeing (GNH), environment, economy and housing affordability, with regular plan reviews; (7) participation and capacity building - community engagement and training of local planners and workers."),
    it("e) Sketches: use simple sketches to illustrate your ideas.", 5,
       [("Clear, labelled simple sketches (concept plan of nodes, transit spine, blue-green network; section of a street or riverfront) consistent with proposals", 5)],
       "Expected sketches (drawn and labelled): (1) a concept plan showing the river and green corridors, compact neighbourhood nodes, the transit spine, the cultural and mindfulness core and economic districts; (2) a typical neighbourhood showing a 10-minute walking radius with a school, market, park and homes; (3) a street or riverfront cross-section showing pedestrian paths, cycle lanes, trees, transit lane, raised buildings and floodable parkland. Marks are given for clarity, labelling and relevance to the proposals."),
])
Q += case("urban2024", 2, T, C2, items=[
    it("a) Analyses.", 10,
       [("Issues: narrow linear valley, steep slopes, limited land; rapid migration and population growth; high land and rent prices, housing shortage; traffic congestion, parking, weak public transport; loss of open spaces, haphazard/ out-of-character buildings, informal settlements; flooding/ landslides; waste, water supply, air quality", 6),
        ("Methods and SWOT: review of Thimphu Structure Plan/ LAPs, surveys, data; strengths (setting, heritage, capital), weaknesses, opportunities, threats", 4)],
       "Analyses: review of the existing Thimphu Structure Plan, local area plans and regulations, field surveys, data on population, housing, transport and services, and consultations. Key issues: (1) Thimphu lies in a narrow valley with steep slopes and limited developable land; (2) rapid rural-urban migration and population growth; (3) high land prices and rents, a shortage of affordable housing, and a large share of income spent on rent; (4) traffic congestion, parking shortage, weak public transport and poor pedestrian facilities; (5) loss of green and open spaces, encroachment on river buffers, and out-of-character, bulky buildings that weaken the city's image; (6) infrastructure gaps - water supply, sewerage, drainage, solid waste; (7) hazards - flash floods, landslides, earthquakes; (8) slow implementation of LAPs. SWOT: strengths - beautiful natural setting, heritage, capital city functions; weaknesses - land constraints, congestion, affordability; opportunities - new technologies, structure plan revision, Gelephu reducing migration pressure, public transport and housing programmes; threats - unregulated growth, climate hazards, speculation."),
    it("b) Visioning exercise and planning principles to be adopted.", 10,
       [("Visioning: participatory (residents, Thromde, agencies, businesses, youth), shared vision e.g. 'a liveable, affordable, green capital reflecting Bhutanese identity'", 4),
        ("Principles: affordability and inclusion, compact mixed-use nodes (polycentric), walkability and public transport, protect natural environment/ river and green network, Bhutanese identity and heritage, resilience, good governance (Intelligent Urbanism)", 6)],
       "Visioning: a participatory process with residents, tenants and landowners, the Thromde, national agencies, businesses, youth and experts (workshops, surveys, public displays) to agree a vision such as 'Thimphu - a liveable, affordable and green capital that reflects Bhutanese identity and wellbeing'. Planning principles: (1) affordability and inclusion - housing and services for all income groups; (2) polycentric, compact, mixed-use development around urban nodes to reduce travel; (3) people first - walkable streets and efficient public transport over private cars; (4) protect the natural environment - Wang Chhu and stream corridors, forested slopes and open spaces as a green network; (5) Bhutanese identity - human-scale buildings and Bhutanese architecture, protecting heritage and views; (6) resilience to floods, landslides and earthquakes; (7) efficient infrastructure; (8) participatory and accountable governance - principles of Intelligent Urbanism that guided Thimphu's earlier plan."),
    it("c) Proposals to address the problems: set out at least three strategies, with simple sketches to illustrate your ideas.", 30,
       [("Strategy on affordable housing: public/ rental housing (NHDCL), mixed-income and inclusionary zoning, incentives/ rent regulation, land pooling reserve plots, densification near nodes, housing finance", 8),
        ("Strategy on mobility and public realm: reliable bus system/ BRT, pedestrianisation, footpaths, cycle lanes, parking management, streetscapes and public spaces, green and river corridors", 8),
        ("Strategy on image, identity and environment/ infrastructure: urban design codes, building heights/ form, facade and heritage control, greening, waste and water management, decentralised nodes and services, resilience", 8),
        ("Sketches and justification: clear sketches (street section, node plan, housing block) and link to issues; feasibility and implementation", 6)],
       "Strategy 1 - Affordable housing for all: expand public and affordable rental housing by the National Housing Development Corporation and the Thromde; use land pooling reserve plots and government land for mixed-income housing; require a share of affordable units in large developments (inclusionary zoning) with FAR incentives; densify sensibly near urban nodes and transit; support housing cooperatives and affordable housing finance; strengthen tenancy rules to protect tenants. Sketch: a mixed-income housing block around a shared courtyard near a bus stop. Strategy 2 - Mobility and public realm: a frequent, reliable city bus network (possibly bus rapid transit along Norzin Lam-Babesa corridor), park-and-ride at entry points, continuous wide footpaths, pedestrian streets in the core, cycle lanes, parking management and pricing, and attractive streetscapes with trees, seating and lighting. Sketch: a street section with footpaths, trees, cycle lane, bus lane and traffic lanes. Strategy 3 - Image, identity and environment: urban design codes controlling building height, bulk, setbacks, colours and Bhutanese architectural features; protect and enhance the Wang Chhu riverfront and stream corridors as linear parks; create plazas and neighbourhood parks; plant trees on slopes; improve water supply, sewerage, drainage and zero-waste management; and develop self-contained urban nodes (e.g. in north and south Thimphu) with markets, schools, clinics and offices to reduce congestion in the core. Sketch: a node plan showing mixed-use centre, park and riverfront. Implementation: integrate the strategies into the structure plan and LAPs, phase investments, use public-private partnerships, and monitor liveability and affordability indicators."),
])
PATTERN = STANDARD
