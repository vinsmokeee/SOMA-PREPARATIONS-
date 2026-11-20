"""ME Technical Paper III (Subject Specialisation Paper), Environmental Science, BCSE 2025 - real paper (PDF sent by the founder).
Pattern: Section A Part I 30 MCQ, Part II 4 short answers x 5; Section B one of two case studies (50). 150 min + 15 min reading.
Left out (answer depends on Bhutanese documents Claude cannot confirm): MCQ 3, 12, 15, 21, 22; five new MCQs keep Part I at 30.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1"
GROUP_TAG = "envsci2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "environmental-science"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Environmental Science"

MCQ = r"""[
{
"n": 1,
"stem": "The Global Theme for World Environment Day 2025 was ……………",
"opts": [
"Solutions to Plastic Pollution",
"Beat Plastic Pollution",
"Land Restoration, Desertification, and Drought Resilience",
"Only One Earth"
]
},
{
"n": 2,
"stem": "Which of the following is NOT a designated Ramsar site of Bhutan?",
"opts": [
"Shingkhar wetland, Bumthang",
"Bumdeling wetland, Tashiyangtse",
"Gangtey-Phobji wetland, Wangdue Phodrang",
"Khotokha wetland, Wangdue Phodrang"
]
},
{
"n": 3,
"stem": "Which of the following is NOT a category of waste according to the Waste Prevention and Management Regulation of Bhutan, 2012?",
"opts": [
"Industrial waste",
"Medical waste",
"Biodegradable waste",
"Municipal Waste"
]
},
{
"n": 4,
"stem": "Which of the following is an indicator of biological water pollution?",
"opts": [
"Macroinvertebrates",
"Fish",
"Algae",
"All of the above"
]
},
{
"n": 5,
"stem": "Bhutan ratified the Paris Agreement on…………….",
"opts": [
"August 19, 2017",
"September 19, 2017",
"August 17, 2017",
"September 15, 2017"
]
},
{
"n": 6,
"stem": "According to the Environmental Assessment Act of Bhutan, 2000, environmental assessment means…….",
"opts": [
"All procedures required under Bhutanese law to identify the impacts of mining activity for ensuring scientific mining.",
"All procedures required under Bhutanese law to identify means to ensure that the activities of a project are managed in an environmentally sound and sustainable way.",
"All procedures required under Bhutanese law to ensure sustainable forest management.",
"All procedures required under the Bhutanese law to uphold the carbon neutrality pledge of the country."
]
},
{
"n": 7,
"stem": "Bhutan acknowledges water resources as state property and the state’s rights. In this regard, arrange i) water for energy; ii) water for agriculture; iii) water for drinking and sanitation; and iv) water for industry, according to water use priorities/order of priorities observed by the government as per the Water Act of Bhutan, 2011.",
"opts": [
"iii, ii, iv, and i",
"iii, i, iv, and ii",
"iii, i, ii, and iv",
"iii, ii, i, and iv"
]
},
{
"n": 8,
"stem": "According to the National Environment Protection Act (2007), which statement below is not true about the “Polluter Pays Principle”?",
"opts": [
"Where there are threats of serious or irreversible damage, lack of full scientific certainty shall not be used as a reason for postponing measures to prevent environmental degradation.",
"A person polluting the environment or causing ecological harm is responsible for the costs of containment, avoidance, abatement, medical compensation, mitigation, remediation, and restoration.",
"State authorities and local governments, institutions, persons, businesses, and organizations shall cooperate for the protection of the environment. The right and responsibility to cooperate shall extend to all aspects of achieving the environmental objectives.",
"The uniformity of the system of environmental protection shall be guaranteed by the Government, the local governments, and the private sector through appropriate policies, plans, and programs such as environmental assessment processes, regulations, incentives, fiscal policies, and other instruments."
]
},
{
"n": 9,
"stem": "Chlorophyta is …………………",
"opts": [
"Heterotroph",
"Decomposer",
"Autotroph",
"None of the above"
]
},
{
"n": 10,
"stem": "According to the Environmental Standards of Bhutan (2020), which of the following is one of the parameters for incineration emission standards?",
"opts": [
"Hydrogen Chloride (HCl)",
"Ozone (O3)",
"Stack height",
"Poly Aromatic Hydrocarbon"
]
},
{
"n": 11,
"stem": "A river is a…………",
"opts": [
"Wetland ecosystem",
"Lentic ecosystem",
"Lotic ecosystem",
"None of the above"
]
},
{
"n": 12,
"stem": "According to the Water Act of Bhutan and its Regulation, which statement below is NOT TRUE regarding minimum environmental flow?",
"opts": [
"The water regime provided within a river, wetland, or other water bodies to maintain ecosystems and their benefits, where flows are regulated.",
"Develop and maintain inventories on river hydrology, aquatic habitat, river ecology, and morphology to enable scientific determination of minimum environmental flow to be maintained in glacier-fed rivers.",
"The minimum environmental flow to be maintained in a watercourse to sustain its water ecology and environment will be based on the findings of the Environmental Impact Assessment.",
"Where scientific study reports are unable to determine the minimum environmental flow to be maintained in a watercourse, at least 30 % of the lean season flow shall be maintained."
]
},
{
"n": 13,
"stem": "Memelakha Compost Plant is “Turning Waste into Wealth” using Takakura Composting Method. It adopts ……………….. composting technique.",
"opts": [
"Aerobic composting",
"Vermicomposting",
"Anaerobic digestion",
"Biogas"
]
},
{
"n": 14,
"stem": "Which of the following does NOT describe the characteristic of hazardous waste?",
"opts": [
"Corrodes metals",
"Destroys living tissue",
"Unstable",
"Easily catches fire under extreme conditions"
]
},
{
"n": 15,
"stem": "Bhutan launched the Bhutan Climate Fund in ………….",
"opts": [
"2024",
"2021",
"2023",
"2022"
]
},
{
"n": 16,
"stem": "The National Adaptation Plan (NAP) of the Kingdom of Bhutan was submitted to the United Nations Framework Convention on Climate Change (UNFCCC) in 2023. Which of the following is NOT a sector identified for the NAP?",
"opts": [
"Water",
"Health",
"Energy",
"Mining"
]
},
{
"n": 17,
"stem": "Which article of the Paris Agreement governs the development of the global carbon markets?",
"opts": [
"Article 6",
"Article 7",
"Article 4",
"Article 5"
]
},
{
"n": 18,
"stem": "What is an environmental clearance according to the Environmental Assessment Act of Bhutan, 2000?",
"opts": [
"Program of systematic, objective, and quantitative measurements, observations, and reporting of projects that may have environmental impacts.",
"A document that specifies the environmental, health, and safety terms for the design, construction, operation, and decommissioning of a project.",
"The requirements and conditions that the project must comply.",
"The decision issued in writing to let a project proceed, which includes terms to ensure that the project is managed in an environmentally sound and sustainable way."
]
},
{
"n": 19,
"stem": "In 2025, Bhutan joined the world in observing the first World Day for Glaciers. The United Nations declared ……………. as World Day of Glaciers.",
"opts": [
"21st April",
"21st May",
"21st March",
"21st February"
]
},
{
"n": 20,
"stem": "Which of the following is the CORRECT definition of “Deforestation”?",
"opts": [
"Clearing an area of forest on a non-temporary basis for another use.",
"Clear-cutting followed by reforestation for forestry purposes.",
"Felling of trees and the extraction of their stems or other usable parts from the forest.",
"A gradual decline in the health, biodiversity, and ecological function of a forest."
]
},
{
"n": 21,
"stem": "The Greenhouse Gas (GHG) emissions of Bhutan in 2022, according to Bhutan’s first Biennial Transparency Report (BTR 1.0) submitted to the UNFCCC was ……………..",
"opts": [
"3,306.05 Gg CO2e",
"1,742.51 Gg CO2e",
"3,814.098 Gg CO2e",
"2,723.28 Gg CO2e"
]
},
{
"n": 22,
"stem": "According to the National Waste Management Strategy (2019) of Bhutan, which of the following is NOT an identified “Strategic Tool”?",
"opts": [
"Incineration of municipal waste",
"National Waste Management Fund",
"Extended Producer Responsibility (EPR) Scheme",
"School Waste Bank"
]
},
{
"n": 23,
"stem": "Which of the following is a form of land degradation?",
"opts": [
"Agroforestry",
"Expansion of forest cover",
"Salinization",
"Crop rotation"
]
},
{
"n": 24,
"stem": "Which of the following statement is relevant to the goal of Climate Change Policy of the Kingdom of Bhutan, 2020?",
"opts": [
"Bhutan’s pledge to remain carbon neutral.",
"Meaningful participation of all relevant stakeholders in climate change actions.",
"Challenges and opportunities of climate change are addressed at all appropriate levels, through adequate finance, technology, and capacity building.",
"All of the above."
]
},
{
"n": 25,
"stem": "Which of the following is a substance that blocks the action of acetylcholine, a key neurotransmitter in the central and peripheral nervous systems in the nervous system?",
"opts": [
"Anticholinergic",
"Inhibitor",
"Hepatotoxin",
"Organophosphate"
]
},
{
"n": 26,
"stem": "Systematic process for evaluating the environmental consequences of a proposed policy, plan or program is known as………………..",
"opts": [
"Environmental Impact Assessment",
"Strategic Environmental Assessment",
"Policy Gap Analysis",
"Sound Environmental Management"
]
},
{
"n": 27,
"stem": "“Cradle-to-Grave” analysis describes …….",
"opts": [
"Sustainable Consumption and Production",
"Circular Economy",
"Regenerative Model",
"Life Cycle Assessment"
]
},
{
"n": 28,
"stem": "Which of the following is one of the spheres of the environment?",
"opts": [
"Hemisphere",
"Anthrosphere",
"Stratosphere",
"Ozonosphere"
]
},
{
"n": 29,
"stem": "Moles of solute per kilogram of solvent is",
"opts": [
"Normality",
"Molarity",
"Molality",
"Formality"
]
},
{
"n": 30,
"stem": "Which of the following is an example of a one-way ecological cycle?",
"opts": [
"Carbon cycle",
"Water cycle",
"Energy cycle",
"Nitrogen cycle"
]
}
]"""

KEY = {
    1: ("b", "World Environment Day 2025 (host Republic of Korea) focused on ending plastic pollution - #BeatPlasticPollution."),
    2: ("a", "Bhutan's Ramsar sites are Bumdeling, Gangtey-Phobji and Khotokha."), 4: ("d", "Macroinvertebrates, fish and algae are all biological indicators."),
    5: ("b", "Bhutan ratified the Paris Agreement on 19 September 2017."), 6: ("b", "EA Act 2000: procedures to ensure a project is managed in an environmentally sound and sustainable way."),
    7: ("d", "Water Act 2011 priority: drinking and sanitation, agriculture, energy, industry."), 8: ("a", "Statement (a) is the precautionary principle, not polluter pays."),
    9: ("c", "Green algae (Chlorophyta) photosynthesise - autotrophs."), 10: ("a", "HCl is a standard incinerator stack-emission parameter."),
    11: ("c", "Running water is a lotic ecosystem."), 13: ("a", "Takakura is an aerobic composting method."),
    14: ("d", "Ignitable hazardous waste catches fire easily under normal conditions, not only extreme ones."), 16: ("d", "Mining is not a NAP sector."),
    17: ("a", "Article 6 covers cooperative approaches and carbon markets."), 18: ("d", "Environmental clearance is the written decision allowing a project to proceed, with terms."),
    19: ("c", "World Day for Glaciers: 21 March (first observed 2025)."), 20: ("a", "Deforestation: clearing forest for another land use, not temporarily."),
    23: ("c", "Salinization degrades land."), 24: ("d", "All three reflect the Climate Change Policy 2020."), 25: ("a", "Anticholinergics block acetylcholine."),
    26: ("b", "SEA evaluates policies, plans and programmes."), 27: ("d", "Cradle-to-grave is life cycle assessment."), 28: ("b", "The anthroposphere is one of the environment's spheres."),
    29: ("c", "Molality = moles of solute per kg of solvent."), 30: ("c", "Energy flows one way through ecosystems."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "The Kyoto Protocol was adopted in", ["1987", "1992", "1997", "2015"], "c", "Adopted in Kyoto in 1997."),
    new_mcq(2, T, "Most of the Earth's ozone layer lies in the", ["troposphere", "stratosphere", "mesosphere", "thermosphere"], "b", "About 90% of ozone is in the stratosphere."),
    new_mcq(3, T, "The Montreal Protocol deals with", ["greenhouse gas trading", "ozone-depleting substances", "hazardous waste trade", "wetland protection"], "b", "It phases out ozone-depleting substances."),
    new_mcq(4, T, "A high Biochemical Oxygen Demand (BOD) in a river indicates", ["clean water", "high organic pollution", "high dissolved oxygen", "low temperature"], "b", "Microbes use more oxygen to break down organic matter."),
    new_mcq(5, T, "The Constitution of Bhutan requires the country to maintain forest cover of at least", ["50%", "60%", "70%", "72%"], "b", "Article 5: a minimum of 60% of total land under forest for all time."),
    saq(1, T, "What is climate finance? Elaborate with ONE example in the context of Bhutan. (5 marks)",
        [("Definition: local, national or international finance (public, private, alternative) for climate mitigation and adaptation", 2), ("One Bhutanese example explained (e.g. Green Climate Fund projects, Bhutan for Life, Bhutan Climate Fund, GEF/LDCF adaptation projects)", 3)],
        "Climate finance is money - from public, private and international sources - used to support actions that reduce greenhouse gas emissions (mitigation) or help people and ecosystems cope with climate impacts (adaptation). Example: Bhutan has received Green Climate Fund support for climate-resilient agriculture and water projects, and the 'Bhutan for Life' fund (project finance for permanence) secures long-term financing for the protected-area network, protecting forests that keep Bhutan carbon negative."),
    saq(2, T, "What is green hydrogen? Elaborate in the context of climate change. (5 marks)",
        [("Hydrogen produced by electrolysis of water using renewable electricity - no CO₂", 2), ("Climate relevance: replaces fossil fuels in transport, industry (steel, fertiliser), storage of surplus renewable power; Bhutan's hydropower potential", 3)],
        "Green hydrogen is hydrogen made by splitting water (electrolysis) with renewable electricity such as hydropower or solar, so no carbon dioxide is released, unlike 'grey' hydrogen from natural gas. It helps fight climate change because it can replace fossil fuels in hard-to-electrify sectors - heavy transport, steel, fertiliser and other industries - and store surplus renewable energy. Bhutan, with clean hydropower (and partnerships to explore green hydrogen), could use it to cut fuel imports and transport emissions and even export clean fuel."),
    saq(3, T, "Elaborate on \"waste as a water pollutant\" with an appropriate example in the context of Bhutan. (5 marks)",
        [("How waste pollutes water: leachate, plastics, sewage, nutrients, pathogens, chemicals; lowers oxygen, harms aquatic life and health", 3), ("Bhutanese example (e.g. waste and sewage in Wang Chhu / Olarongchhu in Thimphu, leachate from landfills, waste dumped in streams)", 2)],
        "Solid and liquid waste dumped near rivers, or leachate from poorly managed dumps, carries plastics, organic matter, nutrients, pathogens and chemicals into water. Organic waste raises BOD and lowers dissolved oxygen, killing fish and invertebrates; nutrients cause algal growth; pathogens cause waterborne diseases. Example: in Thimphu, untreated sewage and waste entering streams such as the Olarongchhu and the Wang Chhu have polluted them, and plastic waste collects along river banks in towns."),
    saq(4, T, "What is carbon negative? Explain the key drivers that made Bhutan achieve it. (5 marks)",
        [("Carbon negative: removes more CO₂ from the atmosphere than it emits", 2), ("Drivers: over 70% forest cover sink, constitutional 60% mandate, hydropower clean energy (and exports offsetting emissions abroad), conservation policies/protected areas, GNH, low industrialisation", 3)],
        "A carbon-negative country absorbs more carbon dioxide than it emits. Bhutan emits about 2-3 million tonnes of CO₂ equivalent a year while its forests absorb far more. Key drivers: forest cover above 70% with the constitutional requirement to keep at least 60%; about half the country in protected areas and biological corridors; electricity almost entirely from hydropower, and exports of clean power that replace fossil power in India; GNH-based policies that put environmental conservation first; and a small, low-industry economy."),
]
C1 = """Case I
For the first time since meteorological records were maintained in 1996, Bhur Meteorological Station in Sarpang Dzongkhag has recorded a staggering 40°C in 2025, marking the highest daily maximum temperature of 2024. This extreme temperature surpasses the highest recorded temperature in recent years, signalling the intensifying impacts of global warming on the Himalayan region."""
C2 = """Case II
The 13th Five Year Plan (FYP) strategically prioritises "Waste Management Enterprise Development" as a cornerstone initiative to modernise and strengthen the waste management system in the country. By explicitly encouraging private sector engagement, the plan opens a pathway for innovative, market-driven solutions to address increasing issues of waste. This approach not only fosters entrepreneurship in the waste management landscape but also aligns with Bhutan's long-term vision of achieving a Zero Waste Society, where sustainability, circular economy principles and community participation converge to protect the country's pristine environment through an improved waste management system."""
Q += case("envsci2025", 1, T, C1, items=[
    ("1. Elaborate on the key causes of the rise in global temperature commonly referred to as global warming.", 10,
     [("Enhanced greenhouse effect explained", 3), ("Causes: fossil fuel burning (CO₂), deforestation, agriculture (CH₄, N₂O), industry/F-gases, waste", 5), ("Feedbacks (ice-albedo, permafrost) and examples", 2)],
     "Global warming is caused mainly by the enhanced greenhouse effect: greenhouse gases trap outgoing heat, and human activities have raised their concentrations. Key causes: burning coal, oil and gas for power, transport and industry (CO₂); deforestation and land-use change, which release carbon and reduce sinks; agriculture - livestock and rice paddies (methane), fertilisers (nitrous oxide); industrial processes such as cement and fluorinated gases; and waste in landfills (methane). Feedbacks such as melting ice reducing albedo and thawing permafrost amplify warming. Global temperature is now about 1.2-1.5 °C above pre-industrial levels."),
    ("2. What specific geographic, ecological and socio-economic factors make Bhutan especially vulnerable to rising temperatures?", 10,
     [("Geographic: young fragile mountains, glaciers and GLOF risk, steep slopes, monsoon", 4), ("Ecological: high biodiversity and altitude-limited species, forests, water sources", 3), ("Socio-economic: hydropower-dependent economy, rain-fed agriculture, rural poverty, limited resources/infrastructure", 3)],
     "Geographic: steep, young and fragile Himalayan mountains; many glaciers and glacial lakes with GLOF risk; heavy monsoon rain causing floods and landslides; a hot southern belt such as Sarpang. Ecological: rich biodiversity with species confined to narrow altitude bands, alpine ecosystems that cannot move higher, and forests at risk of fire and pests. Socio-economic: the economy depends on hydropower (river flow) and tourism; most rural people depend on rain-fed farming; settlements, roads and hydropower plants lie in river valleys; limited finance, technology and data constrain adaptation."),
    ("3. What ecological or societal risks does this pose for Bhutan? Elaborate with specific examples.", 10,
     [("Ecological risks with examples: species shifts, forest fires, pests, drying springs, glacier retreat", 5), ("Societal risks with examples: GLOFs/floods (e.g. 1994 Lugge Tsho), crop loss, water scarcity, heat stress and vector-borne disease spreading to higher areas, hydropower loss", 5)],
     "Ecological: shifting and shrinking habitats for alpine species; more forest fires and pest outbreaks; drying springs and wetlands; glacier retreat changing river flow. Societal: glacial lake outburst floods (as in 1994 from Lugge Tsho) and flash floods threatening lives, homes and hydropower plants (e.g. Punatsangchhu valley); crop failure and new pests reducing food security; drying drinking-water sources in many villages; heat stress in the south; malaria and dengue spreading to higher districts; and loss of hydropower revenue in dry seasons."),
    ("4. What comprehensive climate mitigation and adaptation strategies should Bhutan prioritise to safeguard its ecological integrity and socio-economic resilience in the face of accelerating climate change?", 10,
     [("Mitigation: keep forest cover, diversify renewables (solar, wind, green hydrogen), electric transport, energy efficiency, low-emission agriculture and waste", 5), ("Adaptation: GLOF early warning and lake lowering, climate-resilient agriculture and water storage, disaster risk management, health, climate-smart infrastructure, finance and research", 5)],
     "Mitigation: maintain forest cover and the protected-area network; diversify renewable energy (solar, wind, small hydro, green hydrogen) and reduce diesel use through electric vehicles and public transport; energy efficiency in buildings and industry; low-emission agriculture and waste-to-resource systems. Adaptation: early warning systems and artificial lowering of dangerous glacial lakes; climate-resilient crops, irrigation and rainwater harvesting; spring-shed and watershed protection; climate-proof roads, buildings and hydropower; disaster preparedness; health surveillance for vector-borne diseases; insurance and social protection; and mobilising climate finance, research and community participation."),
    ("5. What collective actions must the global community undertake, across governments, industries and civil society, to effectively confront the increasing climate crisis to ensure a sustainable future?", 10,
     [("Governments: ambitious NDCs, phase out fossil fuels, carbon pricing, honour climate finance and loss-and-damage commitments", 4), ("Industries: decarbonise, renewable energy, green technology, sustainable supply chains", 3), ("Civil society/individuals: awareness, sustainable lifestyles, advocacy, accountability; international cooperation and technology transfer", 3)],
     "Governments must strengthen and implement NDCs in line with 1.5 °C, phase down coal and fossil-fuel subsidies, price carbon, protect forests and deliver promised climate finance (including loss-and-damage funds) to vulnerable countries like Bhutan. Industries should decarbonise operations, invest in renewable energy, efficiency and clean technology, and adopt sustainable supply chains and disclosure. Civil society, media and individuals can raise awareness, change consumption (energy, transport, food, waste), advocate and hold leaders accountable. International cooperation in technology transfer, research and capacity building is essential."),
])
Q += case("envsci2025", 2, T, C2, items=[
    ("1. In what ways can embracing circular economy principles accelerate Bhutan's transition toward a Zero Waste Society?", 10,
     [("Circular economy explained (reduce, reuse, repair, recycle; design out waste; keep materials in use)", 3), ("Ways: segregation at source, composting organic waste, recycling enterprises, reuse/repair, eco-design and EPR, bans on single-use plastics", 5), ("Benefits: less landfill, jobs, less import dependence", 2)],
     "A circular economy keeps materials in use for as long as possible by designing out waste, reusing, repairing, recycling and returning organic matter to the soil, instead of 'take-make-dispose'. For Bhutan: compulsory segregation at source; composting the large organic share of waste (e.g. Memelakha Takakura composting); recycling enterprises for paper, PET, metal and glass; repair and reuse businesses; deposit-refund and EPR schemes; bans and alternatives for single-use plastics; and green procurement. This reduces landfill and open burning, creates jobs and enterprises, and cuts dependence on imported materials."),
    ("2. Critically assess the potential benefits and limitations of adopting the Public-Private Partnership (PPP) model as a strategic approach to foster private sector involvement in waste management services, particularly in the context of enhancing efficiency, accountability and sustainability.", 10,
     [("Benefits: private investment, efficiency, technology and innovation, shared risk, better service", 5), ("Limitations: profit motive vs public good, small market/low volumes in Bhutan, weak contracts and monitoring, cost to users, dependence on one operator", 4), ("Balanced conclusion with safeguards", 1)],
     "Benefits: PPPs bring private investment, management skills and technology; performance-based contracts can improve efficiency and service quality; risks are shared; government can focus on regulation; entrepreneurship and jobs grow (e.g. private collection and recycling companies in Thimphu). Limitations: firms seek profit, so poor or remote areas may be neglected; Bhutan's small waste volumes limit economies of scale; weak contract design, monitoring and enforcement reduce accountability; user fees may rise; a single contractor can become a monopoly. PPPs work when contracts are clear, performance is monitored, fees are fair and communities are involved."),
    ("3. What is Extended Producer Responsibility (EPR)? Elaborate on its advantages and disadvantages in the context of the waste management system in Bhutan.", 10,
     [("Definition: producers/importers responsible for products through post-consumer stage (take-back, recycling, fees)", 3), ("Advantages: shifts cost from government, encourages eco-design, funds collection and recycling, reduces plastic/e-waste", 4), ("Disadvantages in Bhutan: mostly imported goods, small market, enforcement and monitoring difficulty, higher prices", 3)],
     "EPR makes producers and importers responsible for their products after use - for take-back, collection, recycling or safe disposal, usually through fees or schemes. Advantages: shifts costs from municipalities to producers; funds collection and recycling of packaging, plastics, e-waste and batteries; encourages less packaging and recyclable design; supports a circular economy. Disadvantages in Bhutan: most products are imported, so the 'producer' is a small importer; the small market makes schemes costly; monitoring and enforcement capacity is limited; costs may be passed to consumers; informal traders may avoid it."),
    ("4. In what ways can an effective waste management system help mitigate or reduce greenhouse gas emissions?", 10,
     [("Diverting organics from landfill (methane) through composting/anaerobic digestion and biogas", 4), ("Recycling and reuse save energy and raw materials; reducing waste generation", 3), ("Landfill gas capture, ending open burning, efficient collection transport", 3)],
     "Organic waste rotting in landfills produces methane, a powerful greenhouse gas; composting or anaerobic digestion (with biogas used as energy) avoids it. Landfill gas can be captured and flared or used. Recycling and reuse save the energy and emissions of producing new materials. Waste reduction at source avoids emissions across the life cycle. Stopping open burning cuts CO₂ and black carbon. Efficient collection routes and electric vehicles reduce transport emissions."),
    ("5. How can advocacy, awareness and education programmes contribute to Bhutan's pursuit of a Zero Waste Society?", 10,
     [("Change attitudes and behaviour: segregation, reduce, reuse, refuse plastics", 4), ("Channels: schools and curricula, school waste banks, media/social media, religious and community leaders, campaigns (e.g. Clean Bhutan)", 4), ("Builds participation, compliance with rules and demand for green enterprises", 2)],
     "Awareness and education change attitudes and daily habits - reducing, reusing, refusing single-use plastics and segregating waste at source - and build a sense of shared responsibility linked to Bhutanese values of respect for nature. Channels include school curricula and eco-clubs, school waste banks, media and social media campaigns, religious and community leaders, and national movements such as cleaning campaigns. Informed citizens comply with waste rules, pay fees, support recycling enterprises and pressure businesses, making policies effective."),
])
PATTERN = STANDARD
