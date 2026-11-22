"""ME Technical Paper III (Subject Specialisation Paper), Environmental Science, BCSE 2024 - real paper (PDF sent by the founder).
Standard pattern, same as the 2025 Environmental Science paper (the latest).
Left out (answer depends on Bhutanese documents Claude cannot confirm): MCQ 19, 20, 22, 24, 30 and short answers 1 (Bhutan
Climate Fund) and 3 (Bhutan Waste Bank); five new MCQs and two new short answers keep the layout.
Case II question 1 has no marks printed: given 10 (the case totals 50).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Environmental Science): BCSE 2024, batch 1"
GROUP_TAG = "envsci2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "environmental-science"
ADDS_TO_PAPER = True  # 2025 is the latest Environmental Science paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Environmental Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Environmental Science"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following is the Global Warming Potential of carbon dioxide?",
"opts": [
"675",
"1",
"25",
"298"
]
},
{
"n": 2,
"stem": "A process whereby water bodies receive excess nutrients, especially N and P, which stimulate excessive growth of plants and algae, and eventually lead to degraded aquatic ecosystem, is termed as:",
"opts": [
"Biomagnification.",
"Acidification.",
"Eutrophication.",
"Salination."
]
},
{
"n": 3,
"stem": "The pH of the Standard Buffer Solutions to calibrate the pH Meter……………..",
"opts": [
"3.0, 6.0, 10.0",
"4.0, 7.0, 10.0",
"3.0, 7.0, 10.0",
"4.0, 6.0, 10.0"
]
},
{
"n": 4,
"stem": "The Secretariat to the National Environment Commission is:",
"opts": [
"Department of Water.",
"Department of Environment and Climate Change.",
"National Environment Commission Secretariat.",
"Department of Forest and Parks Services."
]
},
{
"n": 5,
"stem": "The effect of which air pollutant is described as “Lung Sunburns”?",
"opts": [
"Sulphur dioxide.",
"Nitrogen dioxide.",
"Carbon monoxide.",
"Ozone."
]
},
{
"n": 6,
"stem": "Proposed activity is subject to the Environmental Impact Assessment when:",
"opts": [
"It has a moderate or unknown impact on the environment.",
"Initial environmental examination of the proposed activity shows potential significant adverse impacts on the environment.",
"Completed project adversely impacted the environment.",
"The nature of the proposed activity is not known."
]
},
{
"n": 7,
"stem": "Which of the following statements gives FALSE information about the ‘Tragedy of Commons’?",
"opts": [
"Everyone tries to reap personal benefits from a shared resource base.",
"Depletion of natural resources is an example of the Tragedy of Commons.",
"Everyone takes responsibility for conserving the shared resource base.",
"The shared resource base is gradually depleted."
]
},
{
"n": 8,
"stem": "A strategic approach for sustainable management of solid wastes encompassing all sources and all aspects, including generation at source, segregation, transfer, sorting, treatment, recovery, and disposal including the emphasis on maximizing resource efficiency is:",
"opts": [
"Integrated solid waste management.",
"Solid waste management program.",
"Comprehensive waste management.",
"Maximum waste management."
]
},
{
"n": 9,
"stem": "The World Ozone Day is observed on:",
"opts": [
"22nd March.",
"5th June.",
"22nd April.",
"16th September."
]
},
{
"n": 10,
"stem": "Crusty lichens can grow in:",
"opts": [
"Polluted air.",
"Clean water.",
"Clean air.",
"Contaminated water."
]
},
{
"n": 11,
"stem": "A type of relationship where one of the organisms suffers and the other interacting species experiences no effect is called………….",
"opts": [
"Commensalism.",
"Parasitism.",
"Neutralism.",
"Amensalism."
]
},
{
"n": 12,
"stem": "Which of the following gives FALSE information on environmental DNA (eDNA)?",
"opts": [
"Generate information on species, populations, and communities.",
"Genetic material obtained directly from environmental samples without any obvious signs of biological source material.",
"Provide a universal framework to assess changing wildlife populations and inform real- time management decisions.",
"Collection of environmental samples such as soil, water, snow or air for further laboratory extraction is not required."
]
},
{
"n": 13,
"stem": "Angiosperms differ from gymnosperms in having:",
"opts": [
"Fruits.",
"Cotyledon.",
"Tracheids.",
"Broad leaves."
]
},
{
"n": 14,
"stem": "The International Day for Biodiversity is observed on………………..",
"opts": [
"22nd May.",
"25th May.",
"28th May.",
"5th June."
]
},
{
"n": 15,
"stem": "Which of the following is the correct order of 3R principle?",
"opts": [
"Reuse, Reduce, Recycle.",
"Reduce, Reuse, Recycle.",
"Recycle, Reuse, Reduce.",
"None of the above."
]
},
{
"n": 16,
"stem": "Montreal Protocol is related to:",
"opts": [
"Extinction of Species.",
"Loss of Genetic Resources.",
"Ozone layer.",
"Reduce Greenhouse Gas emissions."
]
},
{
"n": 17,
"stem": "An alluvial deposit is:",
"opts": [
"Amount of toxic chemicals in the soil, air, and water.",
"An area of sand, clay, or other similar material along a river bed or shore of a lake as a result of moving water.",
"Geological deposits and soils that are derived by in-situ weathering or gravitational movement or accumulation.",
"None of the above"
]
},
{
"n": 18,
"stem": "The practice of adding cultured microorganisms into the subsurface for biodegrading contaminant in the soil and groundwater is:",
"opts": [
"Biopurification.",
"Bioaugmentation.",
"Biocontainment.",
"Biostimulation."
]
},
{
"n": 19,
"stem": "According to Waste Prevention and Management Regulation, 2012, the wastes in Bhutan are generally categorized as Industrial waste, E- waste, Medical waste, and:",
"opts": [
"Plastic waste",
"Biodegradable waste",
"Hazardous waste",
"Municipal Waste"
]
},
{
"n": 20,
"stem": "The smallest wildlife Sanctuary in Bhutan is…………….",
"opts": [
"Bumdeling Wildlife Sanctuary",
"Sakteng Wildlife Sanctuary",
"Jomotsahangkha Wildlife Sanctuary",
"Phibsoo Wildlife Sanctuary"
]
},
{
"n": 21,
"stem": "A group of tigers is called:",
"opts": [
"Streak",
"Pride",
"Herd",
"Clowder"
]
},
{
"n": 22,
"stem": "The World Environment Day in Bhutan is observed on:",
"opts": [
"5th June",
"2nd June",
"4th June",
"None of the above"
]
},
{
"n": 23,
"stem": "Lignite is…………..",
"opts": [
"Wet soil.",
"Charcoal.",
"Carbon-rich soil.",
"Coal."
]
},
{
"n": 24,
"stem": "Bhutan adopted the Carbon Market Rules in:",
"opts": [
"2023",
"2021",
"2024",
"2022"
]
},
{
"n": 25,
"stem": "Asbestos is:",
"opts": [
"A gray, brittle, and highly poisonous metal.",
"Naturally occurring fibrous silicate minerals.",
"Shiny silver-white, odorless, and exceedingly bio-accumulative.",
"A highly volatile solvent."
]
},
{
"n": 26,
"stem": "Basel Convention is related to:",
"opts": [
"Persistent Organic Pollutant.",
"Radiation and radionuclides.",
"Transboundary movement of hazardous wastes and their disposal.",
"Disaster Management."
]
},
{
"n": 27,
"stem": "Which of the following produces Mycotoxins?",
"opts": [
"Algae.",
"Fungi.",
"Microbes.",
"Plants"
]
},
{
"n": 28,
"stem": "Which of the following is NOT a greenhouse gas?",
"opts": [
"Carbon dioxide.",
"Chlorofluorocarbon.",
"Ozone.",
"Nitrogen."
]
},
{
"n": 29,
"stem": "Number of Biodiversity hotspots in the world………….",
"opts": [
"33",
"36",
"34",
"30"
]
},
{
"n": 30,
"stem": "Which of the following is NOT the pollution control equipment of the Ferro Alloys Plant?",
"opts": [
"Ducting tube",
"Furnace hood",
"Screen house",
"Densification blower"
]
}
]"""

KEY = {
    1: ("b", "CO2 is the reference gas, so its Global Warming Potential is 1 (methane about 25-28, nitrous oxide about 265-298)."),
    2: ("c", "Eutrophication: nutrient enrichment (N, P) causes algal blooms, oxygen depletion and degraded water bodies."),
    3: ("b", "pH meters are usually calibrated with standard buffers of pH 4.0, 7.0 and 10.0."),
    4: ("b", "Since the 2022-23 restructuring, the Department of Environment and Climate Change (Ministry of Energy and Natural Resources) serves as the NEC Secretariat."),
    5: ("d", "Ground-level ozone irritates and inflames the airways, often described as a 'sunburn of the lungs'."),
    6: ("b", "An EIA is required when the initial environmental examination shows potential significant adverse impacts."),
    7: ("c", "In the tragedy of the commons no one takes responsibility for conserving the shared resource - so statement c is false."),
    8: ("a", "Integrated solid waste management covers all sources and stages, from generation to disposal, maximising resource efficiency."),
    9: ("d", "International Day for the Preservation of the Ozone Layer: 16 September (Montreal Protocol signed 16 Sept 1987)."),
    10: ("a", "Crusty (crustose) lichens tolerate pollution and can grow in polluted air; leafy and shrubby lichens need cleaner air."),
    11: ("d", "Amensalism: one species is harmed while the other is unaffected (0/-)."),
    12: ("d", "eDNA is obtained by collecting soil, water, snow or air samples and extracting DNA in the lab - so d is false."),
    13: ("a", "Angiosperm seeds are enclosed in fruits; gymnosperm seeds are naked."),
    14: ("a", "International Day for Biological Diversity: 22 May."),
    15: ("b", "Reduce first, then Reuse, then Recycle."),
    16: ("c", "The Montreal Protocol (1987) phases out ozone-depleting substances."),
    17: ("b", "Alluvium is sand, silt and clay deposited by moving water along rivers and lakes."),
    18: ("b", "Bioaugmentation adds cultured microbes; biostimulation adds nutrients to stimulate native microbes."),
    21: ("a", "A group of tigers is called a streak (or an ambush)."),
    23: ("d", "Lignite is low-rank brown coal."),
    25: ("b", "Asbestos is a group of naturally occurring fibrous silicate minerals."),
    26: ("c", "The Basel Convention controls transboundary movements of hazardous wastes and their disposal."),
    27: ("b", "Mycotoxins (e.g. aflatoxins) are produced by fungi (moulds)."),
    28: ("d", "Nitrogen (N2) does not absorb infrared radiation, so it is not a greenhouse gas."),
    29: ("b", "Conservation International recognises 36 biodiversity hotspots."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "The Ramsar Convention is concerned with the conservation of", ["wetlands", "migratory birds only", "deserts", "coral reefs only"], "a",
            "The Ramsar Convention (1971) is the treaty on the conservation and wise use of wetlands."),
    new_mcq(2, T, "Which pollutant is the main cause of acid rain?", ["Carbon monoxide", "Sulphur dioxide", "Methane", "Ozone"], "b",
            "Sulphur dioxide (and nitrogen oxides) form sulphuric (and nitric) acid in the atmosphere."),
    new_mcq(3, T, "Minamata disease is caused by poisoning with", ["lead", "cadmium", "mercury", "arsenic"], "c",
            "Methylmercury in fish from Minamata Bay, Japan, caused Minamata disease."),
    new_mcq(4, T, "According to the 10% law, roughly how much energy passes from one trophic level to the next?", ["1%", "10%", "50%", "90%"], "b",
            "Lindeman's 10% law: about 10% of energy is transferred; the rest is lost mainly as heat."),
    new_mcq(5, T, "At COP15 in Copenhagen (2009), Bhutan pledged to", ["remain carbon neutral", "ban all vehicles", "stop hydropower", "leave the UNFCCC"], "a",
            "Bhutan pledged to remain carbon neutral, its emissions never exceeding what its forests absorb."),
]

SA = [
    ("What is an Environmental Impact Assessment (EIA)? Outline its main stages. (5 marks)",
     [("Definition: process of predicting and evaluating environmental (and social) impacts of a proposed project before approval, to avoid/ mitigate harm", 2),
      ("Stages: screening, scoping, impact analysis/ prediction, mitigation and EMP, EIA report, public consultation, review and decision (environmental clearance), monitoring/ compliance", 3)],
     "An Environmental Impact Assessment is a systematic process of identifying, predicting and evaluating the likely environmental, social and economic impacts of a proposed project before a decision is made, so that adverse impacts can be avoided, reduced or mitigated. Main stages: (1) screening - deciding whether the project needs a full EIA; (2) scoping - identifying the key issues and impacts to study; (3) baseline study and impact prediction and analysis; (4) mitigation measures and an environmental management plan; (5) preparation of the EIA report; (6) public consultation; (7) review and decision - environmental clearance with conditions; (8) monitoring and compliance during construction and operation."),
    ("What is Sustainable Consumption and Production? (5 marks)",
     [("Definition: using goods and services that meet basic needs and improve quality of life while minimising use of natural resources, toxic materials, waste and pollution over the life cycle, so future generations' needs are not jeopardised (SDG 12)", 2),
      ("Elements/ examples: resource and energy efficiency, cleaner production, eco-labelling, green public procurement, reducing food waste, circular economy/ 3Rs, sustainable lifestyles and tourism, corporate sustainability reporting", 3)],
     "Sustainable Consumption and Production (SCP) means 'the use of services and related products which respond to basic needs and bring a better quality of life while minimising the use of natural resources and toxic materials as well as the emissions of waste and pollutants over the life cycle, so as not to jeopardise the needs of future generations'. It aims to do more and better with less, decoupling economic growth from environmental degradation; it is SDG 12. It covers both sides: production - resource- and energy-efficient, cleaner production, less waste, circular design; consumption - informed consumer choices, eco-labelling, sustainable lifestyles. Examples: green public procurement, reducing food loss and waste, recycling and reuse (3Rs), sustainable tourism (Bhutan's high-value, low-volume policy), and companies reporting on sustainability."),
    ("What is a carbon footprint? Give ways in which it can be reduced. (5 marks)",
     [("Definition: total greenhouse gas emissions (CO2-equivalent) caused directly and indirectly by an individual, organisation, product or country", 2),
      ("Ways: energy efficiency, renewable energy, public transport/ walking/ EVs, less meat/ local food, reduce-reuse-recycle, less waste/ flying, tree planting/ offsets", 3)],
     "A carbon footprint is the total amount of greenhouse gases - expressed as tonnes of CO2-equivalent - emitted directly and indirectly by an individual, organisation, event, product or country over a period or life cycle (from energy use, transport, food, goods and waste). Ways to reduce it: use energy efficiently (LED lights, efficient appliances, insulation); switch to renewable energy such as hydropower and solar; use public transport, walk, cycle, car-pool or use electric vehicles; eat more local and plant-based food and waste less food; reduce, reuse and recycle; fly less; and plant trees or support certified carbon-offset projects."),
    ("What is natural capital accounting? (5 marks)",
     [("Definition: measuring stocks of natural assets (forests, water, soil, minerals, biodiversity) and flows of ecosystem services, integrated with national/ economic accounts (UN SEEA framework)", 3),
      ("Purpose: show economy's dependence on nature, track depletion/ degradation, guide policy, beyond GDP (e.g. Bhutan's GNH, forests/ hydropower/ water accounts)", 2)],
     "Natural capital accounting is the process of measuring and valuing a country's (or company's) stocks of natural assets - forests, water, soils, minerals, energy resources, biodiversity and ecosystems - and the flows of benefits (ecosystem services) they provide, and recording them in a systematic way linked to the national economic accounts. The international standard is the UN System of Environmental-Economic Accounting (SEEA). It shows how much the economy depends on nature, tracks depletion and degradation that GDP ignores, and supports better decisions on land use, investment and conservation. For Bhutan, where forests, water and hydropower drive the economy and GNH values the environment, natural capital accounts (e.g. forest, water and energy accounts) help ensure development does not run down natural wealth."),
]
for i, (s, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=5, topic=T, stem=s, key_points=kp, model=mod))

C1 = """Case I
Waste Prevention and Management Act of Bhutan, 2009 is the legal instrument to protect and sustain human health through the protection of the environment by reducing the generation of waste at source; promoting the segregation, reuse, and recycling of wastes; disposal of waste in an environmentally sound manner; and effective functioning and coordination among implementing agencies."""
C2 = """Case II
Bhutan will experience a drastic increase in heat and rainfall over the coming decades, which will result in an increased number of flash floods, affecting agriculture, hydropower, and forestry - the most climate-sensitive sectors. This is according to the 'Climate Change Projection' report launched recently by the National Centre for Hydrology and Meteorology (NCHM). As per the NCHM data, Bhutan receives an average annual rainfall of 1,800 millimeters (mm), with maximum temperatures averaging around 23 degree Celsius and a minimum of about 12 degree Celsius."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("envsci2024", 1, T, C1, items=[
    it("1. What are hazardous and non-hazardous wastes? Explain with two examples each.", 10,
       [("Hazardous: wastes that are toxic, flammable, corrosive, reactive or infectious and harm health/ environment - need special handling; examples: used batteries, waste oil, pesticides containers, medical sharps, e-waste components, chemicals", 5),
        ("Non-hazardous: do not pose such risks, can be managed as ordinary waste/ recycled; examples: food/ kitchen waste, paper, cardboard, garden waste, glass, PET bottles", 5)],
       "Hazardous wastes are wastes that, because of their toxic, flammable, corrosive, reactive or infectious properties, can cause harm to human health or the environment if not properly handled, stored, transported, treated or disposed of; they need special segregation and treatment. Examples: used lead-acid batteries, waste oil and solvents, pesticide containers, infectious medical waste such as used syringes, and mercury-containing fluorescent tubes. Non-hazardous wastes do not have these properties and can be managed through normal collection, composting, recycling or sanitary landfill. Examples: kitchen and food waste, garden waste, paper and cardboard, glass bottles and PET bottles. Separating the two at source prevents contamination of the whole waste stream and protects waste workers."),
    it("2. Explain the principle of 3Rs and the waste minimisation hierarchy.", 10,
       [("3Rs: Reduce (avoid generating waste - less packaging, buy durable), Reuse (use items again - bottles, bags), Recycle (process into new materials - paper, metal, PET) with examples", 5),
        ("Hierarchy from most to least preferred: prevention/ reduction → reuse → recycling/ composting → energy recovery → treatment → disposal (landfill); aim is minimise waste to landfill, resource efficiency; inverted pyramid", 5)],
       "The 3R principle: Reduce - avoid or cut the amount of waste generated at source (buying only what is needed, less packaging, durable products, cloth bags instead of plastic); Reuse - use items again for the same or another purpose (refilling bottles, reusing containers, repairing goods, donating clothes); Recycle - collect and process waste into new raw materials or products (paper, cardboard, metals, PET and glass). The waste minimisation hierarchy ranks options from most to least preferred, usually drawn as an inverted pyramid: prevention/reduction at the top, then reuse, then recycling and composting, then recovery of energy (e.g. waste-to-energy), then treatment, and finally disposal in a sanitary landfill as the last resort. The aim is to keep resources in use, minimise the waste reaching landfills and reduce pollution - the basis of the Waste Prevention and Management Act and Bhutan's Zero Waste goal."),
    it("3. What is the polluter pays principle?", 10,
       [("Definition: whoever produces pollution/ waste should bear the costs of managing it and of damage to health/ environment (internalising external costs); Rio Declaration principle 16, OECD 1972", 4),
        ("Application: waste collection fees, fines/ penalties, environmental taxes, deposit-refund, EPR, clean-up and compensation liabilities, permits; in Bhutan's NECA/ WPM Act - penalties, fees; benefits: incentive to reduce pollution, fairness, revenue", 6)],
       "The polluter pays principle states that the person or organisation that causes pollution or generates waste should bear the costs of preventing, controlling and cleaning up that pollution and of any damage it causes to human health and the environment, instead of the public or government paying. It internalises environmental costs into the price of goods and services. It was adopted by the OECD (1972) and is Principle 16 of the Rio Declaration (1992), and it is reflected in Bhutan's environmental laws such as the Waste Prevention and Management Act. Applications: waste collection and tipping fees based on the amount of waste, fines and penalties for illegal dumping or pollution, environmental taxes and levies (e.g. on plastics or fuel), deposit-refund schemes, extended producer responsibility, and liability for clean-up and compensation. Benefits: creates an incentive to reduce pollution and waste, is fair because those who benefit pay, and raises funds for environmental management. Challenges: identifying polluters, valuing damage and enforcement."),
    it("4. What is E-waste? Explain with examples.", 10,
       [("Definition: discarded electrical and electronic equipment and parts at end of life (WEEE) - computers, mobile phones, TVs, refrigerators, batteries, printers", 4),
        ("Hazards (lead, mercury, cadmium, brominated flame retardants, CFCs) and value (gold, copper, rare metals); management: segregated collection, take-back/ EPR, authorised dismantling/ recycling, no open burning/ dumping", 6)],
       "E-waste (waste electrical and electronic equipment) is any discarded electrical or electronic device or its parts that the owner no longer uses - examples: old computers, laptops and monitors, mobile phones and chargers, televisions, printers, refrigerators and air conditioners, washing machines, batteries and fluorescent lamps. It is one of the fastest-growing waste streams. It contains hazardous substances - lead and cadmium in circuit boards and batteries, mercury in lamps and screens, brominated flame retardants in plastics, and CFCs in old fridges - which can pollute soil and water and harm health if dumped or burned. It also contains valuable materials such as gold, silver, copper and rare metals. Proper management: separate collection points, take-back and extended producer responsibility schemes, repair and reuse, and dismantling and recycling by authorised facilities (in Bhutan, e-waste is mostly collected and exported for recycling), never mixing it with household waste or burning it."),
    it("5. What is incineration?", 10,
       [("Definition: controlled high-temperature combustion (about 850-1100 °C) of waste, converting it to ash, flue gas and heat; reduces volume ~90%, mass ~75%", 4),
        ("Uses: medical/ hazardous waste, energy recovery; advantages (volume reduction, pathogen destruction, energy); disadvantages (air pollution - dioxins, furans, heavy metals, toxic ash, high cost, discourages recycling) and need for air pollution control", 6)],
       "Incineration is a waste treatment method in which waste is burned in a controlled, enclosed furnace at high temperatures (typically 850-1100 °C, higher for hazardous waste) with sufficient oxygen and residence time, converting it into ash, flue gases and heat. It reduces waste volume by about 90% and mass by about 75%. Uses: treating infectious medical waste (as in hospital incinerators in Bhutan) and some hazardous wastes, and waste-to-energy plants that use the heat to produce steam and electricity. Advantages: large volume reduction, saving landfill space; destroys pathogens and many toxic organic compounds; energy recovery. Disadvantages: emissions of air pollutants such as dioxins, furans, particulates, acid gases and heavy metals unless advanced air-pollution control (scrubbers, filters) is used; toxic fly ash that must be disposed of safely; high capital and operating costs; and it can discourage waste reduction and recycling, so it should come low in the waste hierarchy."),
])
Q += case("envsci2024", 2, T, C2, items=[
    it("1. Why is Bhutan more vulnerable to extreme weather events such as floods, landslides and seasonal droughts?", 10,
       [("Physical: young, fragile Himalayan mountains, steep slopes, high relief, active seismic zone, glaciers and glacial lakes, intense monsoon rainfall, narrow valleys", 5),
        ("Socio-economic: settlements, roads, hydropower in river valleys, economy dependent on climate-sensitive sectors (agriculture, hydropower, forestry), subsistence farmers, limited resources/ early warning, rising temperatures", 5)],
       "Bhutan is highly vulnerable because: (1) its terrain is young, fragile Himalayan mountain with steep slopes and high relief, making it prone to landslides and flash floods; (2) it lies in a seismically active zone; (3) the monsoon brings intense rainfall concentrated in a few months, causing floods and landslides, while the dry winter can bring droughts and forest fires; (4) many glaciers are retreating and glacial lakes expanding, with the risk of GLOFs; (5) warming in the Himalayas is faster than the global average; (6) most settlements, farmland, roads and hydropower plants are in narrow river valleys; (7) the economy depends on climate-sensitive sectors - hydropower, agriculture and forestry - and many rural households are subsistence farmers with limited capacity to cope; and (8) limited financial and technical resources and difficult access hamper early warning and response."),
    it("2. What are GLOFs?", 10,
       [("Definition: Glacial Lake Outburst Flood - sudden release of large volume of water from a glacial lake when moraine/ ice dam fails", 4),
        ("Triggers (ice/ rock avalanches, heavy rain, melt, earthquakes, dam seepage), impacts downstream (floods, debris, loss of life, hydropower/ infrastructure), Bhutan examples (Lugge Tsho 1994, Thorthormi), mitigation (lake lowering, early warning systems, hazard mapping)", 6)],
       "A Glacial Lake Outburst Flood (GLOF) is a sudden release of a large volume of water from a glacial lake when the natural dam holding it - usually a loose moraine or ice - fails. Glacial lakes form and grow as glaciers retreat due to warming. Triggers include ice or rock avalanches into the lake that create displacement waves, heavy rainfall and rapid snow/ice melt, earthquakes, and seepage or melting of buried ice in the moraine dam. The flood travels far downstream with mud and debris, destroying lives, homes, farmland, roads, bridges and hydropower plants. In Bhutan, the 1994 outburst of Lugge Tsho flooded the Punatsangchhu valley and damaged Punakha Dzong; Thorthormi lake was partially drained to reduce risk. Mitigation: monitoring glacial lakes, artificially lowering lake levels, automatic early warning systems along vulnerable rivers (e.g. Punakha-Wangdue valley), hazard zoning and community preparedness."),
    it("3. What are adaptation and resilience to climate change? Explain with examples.", 10,
       [("Adaptation: adjustments in natural/ human systems in response to actual or expected climate impacts to reduce harm or exploit opportunities; examples: climate-resilient crops, irrigation/ water harvesting, early warning, river protection, building codes", 5),
        ("Resilience: capacity of systems/ communities to absorb, cope with, recover from and adapt to shocks while maintaining functions; examples: diversified livelihoods, insurance, strong infrastructure, ecosystem-based approaches, disaster preparedness", 5)],
       "Adaptation is the process of adjustment in natural or human systems in response to actual or expected climate change and its effects, to reduce harm or take advantage of opportunities. Examples: introducing drought- or flood-tolerant crop varieties, irrigation and rainwater harvesting, building river embankments and check dams, relocating settlements away from flood-prone areas, climate-proof roads and bridges, GLOF early warning systems and protecting watersheds and springs. Resilience is the capacity of a community, ecosystem or system to absorb a climate shock, cope with it, recover quickly and continue to function, while adapting and transforming for the future. Examples: diversified livelihoods so a farmer does not depend on one crop, crop and property insurance, strong disaster-preparedness and response plans (e.g. trained community volunteers like De-suung), healthy forests that reduce landslides and regulate water, and resilient infrastructure. Adaptation actions build resilience; resilience is the outcome."),
    it("4. State some examples of recent incidences of extreme events in the country. What were the likely causes of these events?", 10,
       [("Examples: flash floods/ landslides in monsoon (e.g. 2021-2024 floods and landslides damaging roads, hydropower sites and homes - Sarpang, Samdrup Jongkhar, Trashigang; 2023 Kurjongchhu flash flood at a hydropower site), windstorms, forest fires, GLOF threats, droughts/ drying water sources", 5),
        ("Likely causes: intense/ erratic rainfall linked to climate change, glacial melt, fragile geology and steep slopes, deforestation and road cutting, unplanned construction, poor drainage", 5)],
       "Examples (candidates should give recent events they know): monsoon flash floods and landslides that block highways and damage homes, farmland and hydropower projects in districts such as Sarpang, Samdrup Jongkhar, Chukha and Trashigang; the July 2023 flash flood (debris flow) in Lhuentse that swept away workers at a hydropower project site; windstorms damaging roofs and crops; forest fires during dry winters; and drying of springs and water sources causing seasonal water shortages. Likely causes: more intense and erratic rainfall and higher temperatures linked to climate change; rapid melting of glaciers and snow; fragile geology and steep slopes; human activities such as road cutting without proper slope protection, deforestation, quarrying and construction on unstable slopes or flood plains; and poor drainage. (Marks are given for any accurate recent examples with sound reasoning.)"),
    it("5. What strategic interventions should the government undertake to prevent and reduce the adverse impacts of extreme events on the local communities?", 10,
       [("Policy/ planning: climate risk mapping and hazard zoning, land-use planning, building codes, integrating climate risk in five-year plans and NAP, DRM Act implementation", 4),
        ("Measures: early warning systems and monitoring (NCHM), resilient infrastructure, watershed/ forest protection, river training, climate-smart agriculture, insurance/ relief funds, community awareness and preparedness, capacity building, international climate finance", 6)],
       "Strategic interventions: (1) risk assessment and hazard mapping of floods, landslides and GLOFs, with land-use planning and zoning that keeps settlements and infrastructure out of high-risk areas; (2) strengthening early warning systems and weather and glacier monitoring by NCHM, with timely communication to communities; (3) building climate-resilient infrastructure - roads with proper drainage and slope protection, safe bridges, river training works and enforcing building codes; (4) protecting forests and watersheds and promoting ecosystem-based adaptation to reduce landslides and conserve water sources; (5) climate-smart agriculture - resilient crops, irrigation and water harvesting; (6) disaster preparedness - community disaster management plans, drills, trained volunteers and emergency supplies, under the Disaster Management Act; (7) financial protection - insurance, relief and recovery funds; (8) integrating climate risk into national plans (National Adaptation Plan, five-year plans) and accessing international climate finance; and (9) awareness, education and research."),
])
PATTERN = STANDARD
