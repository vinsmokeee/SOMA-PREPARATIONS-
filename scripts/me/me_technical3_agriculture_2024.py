"""ME Technical Paper III (Subject Specialisation Paper), Agriculture, BCSE 2024 - real paper (PDF sent by the founder).
Standard pattern (cover page says 2 short answers, but the paper has 4 x 5). MCQs 13, 26, 28, 29 replaced (Bhutan figures that could not be confirmed); keys for 10 and 27 FLAGGED.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing"
GROUP_TAG = "agri2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "agriculture"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Agriculture"

MCQ = r"""[
{
"n": 1,
"stem": "Why is a soil pH range of 5.5 to 7.0 generally considered optimal for the availability of most nutrients to plants?",
"opts": [
"Because it promotes microbial activity",
"Because it reduces the leaching of nutrients",
"Because most nutrients are soluble in this pH range",
"Because it prevents soil compaction"
]
},
{
"n": 2,
"stem": "How does clayey soil compare to sandy and loamy soils regarding water-holding capacity?",
"opts": [
"It has the lowest water-holding capacity",
"It has a moderate water-holding capacity",
"It has the highest water-holding capacity",
"It does not retain water at all"
]
},
{
"n": 3,
"stem": "Why is drip irrigation considered the most efficient irrigation method, especially in areas with water scarcity?",
"opts": [
"Because it waters the entire field evenly",
"Because it uses the least amount of water by targeting only the root zones",
"Because it requires minimal maintenance",
"Because it increases evaporation rates"
]
},
{
"n": 4,
"stem": "How does contour plowing help in preventing soil erosion on agricultural land?",
"opts": [
"By increasing soil fertility",
"By reducing water runoff and retaining soil on the slopes",
"By allowing more water to infiltrate the soil",
"By decreasing the amount of tillage needed"
]
},
{
"n": 5,
"stem": "The enzyme secreted by the embryo of seeds which induces the germination process is",
"opts": [
"Auxin",
"Gibberellin",
"Cytokinin",
"Ethylene"
]
},
{
"n": 6,
"stem": "Why sustainable land management is considered crucial for maintaining and enhancing agricultural productivity in Bhutan?",
"opts": [
"Because it allows for the rapid expansion of agricultural land into forested areas",
"Because Bhutan's steep terrain increases the risk of soil erosion and land degradation",
"Because it enables the substitution of traditional farming methods with high-tech farming solutions",
"Because it ensures that all available land is converted into monoculture plantations"
]
},
{
"n": 7,
"stem": "Aflatoxin contamination in stored maize is a major issue. Which fungus is primarily responsible for producing aflatoxins?",
"opts": [
"Penicillium chrysogenum",
"Rhizopusstolonifer",
"Aspergillus flavus",
"Fusarium oxysporum"
]
},
{
"n": 8,
"stem": "How do the significant altitudinal variations across Bhutan's agricultural regions influence the design and implementation of irrigation systems?",
"opts": [
"They require the use of gravity-fed irrigation systems exclusively",
"They necessitate the adaptation of irrigation systems to prevent waterlogging in lower regions",
"They demand the integration of diverse irrigation methods tailored to specific altitude- related challenges",
"They allow for the uniform application of sprinkler systems across all regions"
]
},
{
"n": 9,
"stem": "Why is the implementation of climate-smart irrigation systems increasingly critical for the sustainability of agriculture in Bhutan?",
"opts": [
"To solely increase the country's agricultural exports to neighboring countries",
"To mitigate the impact of erratic monsoon patterns and reduce the dependence on seasonal rainfall",
"To replace all traditional irrigation methods that are now considered outdated",
"To decrease the energy consumption of irrigation systems by transitioning to entirely solar-powered systems"
]
},
{
"n": 10,
"stem": "Match the following research centers and their mandates correctly.",
"opts": [
"A-1; B-2; C-3; D-4",
"A-3; B-4; C-2; D-1",
"A-2; B-3; C-4; D-1",
"A-3; B-4; C-1; D-2"
]
},
{
"n": 11,
"stem": "The initial uptake of water by seed is called",
"opts": [
"Imbibition",
"Hydrolysis",
"Hydration",
"None of the above."
]
},
{
"n": 12,
"stem": "Why the Cation Exchange Capacity (CEC) of soil is considered a crucial factor in determining soil fertility?",
"opts": [
"It determines the soil's ability to drain excess water and prevent waterlogging.",
"It indicates the soil's capacity to retain and supply essential nutrients to plants.",
"It measures the soil's resistance to temperature fluctuations and climate changes.",
"It reflects the soil's ability to support microbial life through organic matter decomposition."
]
},
{
"n": 13,
"stem": "According to the RNR census 2019, the reported fallow agricultural land in the country is about __________ acres.",
"opts": [
"44000",
"55000",
"65000",
"75000"
]
},
{
"n": 14,
"stem": "Which of the following is the smallest order of class Insecta?",
"opts": [
"Hemiptera",
"Odonata",
"Zeroptera",
"Coleoptera"
]
},
{
"n": 15,
"stem": "De-hulled rice grain is called",
"opts": [
"Rachilla",
"Awn",
"Tegmen",
"Caryopsis"
]
},
{
"n": 16,
"stem": "Soils with cation exchange capacity in the range of 5-15 meq.100g-1 would be classified as having",
"opts": [
"Low CEC",
"Moderate CEC",
"High CEC",
"Very high CEC"
]
},
{
"n": 17,
"stem": "Suppose a tariff is put on the import of Indian rice, the demand curve for Bhutanese-grown rice will",
"opts": [
"shift to the left.",
"shift to the right.",
"move vertically up.",
"move vertically down."
]
},
{
"n": 18,
"stem": "The bulk density (dry mass per unit volume) of typical agricultural soils is near",
"opts": [
"1300 kg/m3",
"2000 kg/m3",
"3000 kg/m3",
"3500 kg/m3"
]
},
{
"n": 19,
"stem": "The interference exerted by a plant onto its neighbors by way of releasing chemical substances is termed as",
"opts": [
"Allelopathy",
"Antipathy",
"Encephalopathy",
"Enteropathy"
]
},
{
"n": 20,
"stem": "In Bhutan, which of the following is a key component of the Integrated Pest Management (IPM) strategy employed for controlling the infestation of the fall armyworm in maize crops?",
"opts": [
"Utilizing pheromone traps to monitor and reduce pest populations",
"Applying broad-spectrum chemical insecticides to eliminate all pest species",
"Introducing genetically modified maize varieties resistant to fall armyworm",
"Implementing monoculture farming practices to reduce pest spread"
]
},
{
"n": 21,
"stem": "If a farmer wants to apply 100 kg nitrogen, how much urea should be use?",
"opts": [
"40 kg",
"87 kg",
"115 kg",
"217 kg"
]
},
{
"n": 22,
"stem": "All the essential nutrients required by plants are taken up in",
"opts": [
"Organic form",
"Inorganic form",
"Mixture of organic and inorganic form",
"All of the above"
]
},
{
"n": 23,
"stem": "How can marginal analysis be used by farmers to optimize the allocation of resources on their farms?",
"opts": [
"By determining the total profit from the farm operation and dividing it equally among all resources.",
"By assessing the additional cost and revenue from using one more unit of a resource to decide whether it should be increased or decreased.",
"By ensuring that all available resources are used to their maximum capacity regardless of their individual costs.",
"By calculating the average productivity of all resources and focusing only on the most productive ones."
]
},
{
"n": 24,
"stem": "Which of the following best describes a major constraint faced by Bhutanese farmers in adopting organic farming practices on a large scale?",
"opts": [
"Excessive availability of certified organic seeds and planting materials",
"Insufficient knowledge and training in organic farming techniques among local farmers",
"An overabundance of organic certification bodies leading to confusion and excessive costs",
"High market demand for organic produce, which exceeds local production capacities"
]
},
{
"n": 25,
"stem": "Which of the following is a key principle of IFOAM's \"Basic Standards\" for organic farming that is designed to ensure environmental and social sustainability?",
"opts": [
"Use of genetically modified organisms (GMOs) to enhance crop resilience",
"Promotion of monoculture systems to increase agricultural efficiency",
"Integration of crop and livestock systems to enhance nutrient cycling and biodiversity",
"Reliance on synthetic chemical inputs to boost crop yields and protect against pests"
]
},
{
"n": 26,
"stem": "According to the Cost-sharing Mechanism Guideline of the Ministry of Agriculture and Livestock 2021, the cost-sharing (Government: Subsistence Farmer) applied for supporting farm machinery is",
"opts": [
"60:40",
"80:20",
"70:30",
"50:50"
]
},
{
"n": 27,
"stem": "The Department of Agriculture, during the preparation of the 13 FYP prioritized four major crops for providing chain-link fencing to protect from wild animals, based mainly on the Human-wildlife conflict ranking and the cultivated area. Which are the four prioritized crops?",
"opts": [
"Paddy, potato, vegetables, apple",
"Paddy, maize, potato, vegetables",
"Paddy, maize, quinoa, barley",
"Paddy, potato, vegetables, buckwheat"
]
},
{
"n": 28,
"stem": "According to the available information, what percentage of crop yield is lost to wild animal depredation?",
"opts": [
"44-55%",
"19-43%",
"11-18%",
"5-10%"
]
},
{
"n": 29,
"stem": "By the end of 13 FYP, the Ministry of Agriculture and Livestock targets to increase the country’s rice self-sufficiency from",
"opts": [
"35-30%",
"45-50%",
"25-30%",
"20-25%"
]
},
{
"n": 30,
"stem": "Ganoderma lucidum is a popular medicinal mushroom promoted by the National Mushroom Centre for export purposes. What are the common names of this mushroom used by the Chinese and the Japanese?",
"opts": [
"Reishi in China and Lingzhi in China",
"Lingzhi in China and Reishi in Japan",
"Lingzhi in both Japan and China",
"None of the above"
]
}
]"""

CHECK = "Answer key not verified: Bhutan-specific fact - an agriculture officer must confirm it against current MoAL information before publishing."
KEY = {
    1: ("c", "Between pH 5.5 and 7.0 most plant nutrients are in soluble, available forms."),
    2: ("c", "Clay has the most fine pores and surface area, so it holds the most water."),
    3: ("b", "Drip irrigation delivers water slowly to the root zone only, with very little evaporation or runoff."),
    4: ("b", "Ploughing across the slope makes ridges that slow runoff and keep soil on the slope."),
    5: ("b", "The embryo releases gibberellin, which triggers the aleurone layer to make amylase for germination (gibberellin is a hormone, not an enzyme)."),
    6: ("b", "Bhutan's steep terrain makes soil erosion and land degradation a major risk, so sustainable land management is crucial."),
    7: ("c", "Aspergillus flavus (and A. parasiticus) produce aflatoxins."),
    8: ("c", "Different altitudes have different water sources, slopes and climates, so a mix of irrigation methods is needed."),
    9: ("b", "Climate-smart irrigation reduces dependence on increasingly erratic monsoon rainfall."),
    10: ("d", "Yusipang - organic agriculture (National Centre for Organic Agriculture); Wengkhar - horticulture; Bajo - field crops; Samtenling - plantation crops."),
    11: ("a", "The first uptake of water by a dry seed is imbibition."),
    12: ("b", "CEC measures how many nutrient cations (Ca, Mg, K, NH4) the soil can hold and supply to plants."),
    14: ("c", "Zoraptera (spelt 'Zeroptera' in the paper) is the smallest insect order, with only a few dozen species."),
    15: ("d", "The rice grain without its husk (brown rice) is a caryopsis."),
    16: ("a", "On the common scale, CEC of 5-15 meq/100 g is low (15-25 medium, above 25 high)."),
    17: ("b", "A tariff makes imported rice dearer, so demand for its substitute, Bhutanese rice, increases - the curve shifts right."),
    18: ("a", "Typical agricultural soils have a bulk density of about 1.3 g/cm³ = 1300 kg/m³."),
    19: ("a", "Release of chemicals by a plant that affect its neighbours is allelopathy."),
    20: ("a", "Pheromone traps for monitoring and mass trapping are a key IPM tool against fall armyworm."),
    21: ("d", "Urea has 46% N: 100 / 0.46 ≈ 217 kg of urea."),
    22: ("b", "Plants take up nutrients in inorganic (ionic) forms such as NO3-, NH4+, H2PO4- and K+."),
    23: ("b", "Marginal analysis compares the extra cost and extra revenue of one more unit of input."),
    24: ("b", "Lack of knowledge and training in organic methods is a major constraint for Bhutanese farmers."),
    25: ("c", "IFOAM standards promote crop-livestock integration, nutrient cycling and biodiversity, and exclude GMOs and synthetic inputs."),
    27: ("b", "The four priority crops for chain-link fencing were paddy, maize, potato and vegetables."),
    30: ("b", "Ganoderma lucidum is called Lingzhi in China and Reishi in Japan."),
}
FIX = {14: {"opts": ["Hemiptera", "Odonata", "Zoraptera", "Coleoptera"]}}
FLAG = {10, 27}
T = TOPIC
Q = mcqs(MCQ, KEY, T, FIX)
for q in Q:
    if int(q["key"][1:]) in FLAG: q["issues"] = [CHECK]
Q += [
    new_mcq(1, T, "Apart from phosphorus and calcium, single super phosphate (SSP) also supplies which nutrient?", ["Sulphur", "Nitrogen", "Potassium", "Zinc"], "a",
            "SSP contains about 16% P2O5, about 20% calcium and about 12% sulphur (from gypsum)."),
    new_mcq(2, T, "Bordeaux mixture, a widely used fungicide, is prepared from:", ["Copper sulphate and lime", "Zinc sulphate and lime", "Copper sulphate and urea", "Sulphur and lime"], "a",
            "Bordeaux mixture is copper sulphate neutralised with hydrated (slaked) lime."),
    new_mcq(3, T, "The C:N ratio of well-decomposed (mature) compost is about:", ["10:1 to 20:1", "40:1", "60:1", "100:1"], "a",
            "Mature compost has a C:N ratio of about 10-20:1; fresh straw is 80-100:1."),
    new_mcq(4, T, "Which method is most commonly used to multiply apple varieties true to type?", ["Sowing seeds", "Grafting or budding onto rootstocks", "Stem cuttings", "Layering only"], "b",
            "Apples do not come true from seed, so scions of the variety are grafted or budded onto rootstocks."),
    saq(1, T, "Digital agriculture is gaining momentum in our country, gradually. What do you mean by digital agriculture?",
        [("Definition: use of digital technologies (ICT, mobile apps, internet, sensors, IoT, GIS/ remote sensing, drones, data analytics, AI) across the agricultural value chain to improve production, decisions, marketing and services", 2.5),
         ("Examples/ benefits in Bhutan: market information and e-marketing apps, advisory/ weather and pest alerts by SMS, precision farming, smart irrigation, farm records/ traceability, e-extension, digital payments; benefits - efficiency, productivity, reach youth, reduce labour; challenges - connectivity, cost, digital literacy", 2.5)],
        """Digital agriculture is the use of digital technologies - mobile phones and apps, the internet, sensors and the Internet of Things, GIS and remote sensing, drones, big data, artificial intelligence and digital platforms - throughout the agricultural value chain to collect, analyse and share information, so that farmers, extension staff, traders and policymakers can make better decisions and work more efficiently.
Examples relevant to Bhutan: mobile apps and online platforms for market prices and selling produce (e-marketing); SMS and app-based advice on crops, weather, pests and diseases; digital extension services and farmer databases; sensor-based smart irrigation and greenhouses; drones for spraying and crop monitoring; GIS mapping of land and crops; traceability and farm records; and digital payments and credit.
Benefits include higher productivity and efficiency, lower costs and less labour, timely information, better market access and making farming more attractive to youth. Challenges are poor connectivity in remote areas, cost of technology, digital literacy and data management."""),
    saq(2, T, "Why do you think it is important to enhance food self-sufficiency?",
        [("Food and nutrition security: less vulnerability to import disruptions (border closure, COVID-19, export bans by India, price shocks), stable supply", 2),
         ("Economic: reduce imports and outflow of rupees/ trade deficit, income and jobs for farmers/ youth, rural development, reduce poverty, add value", 2),
         ("Other: national sovereignty/ GNH, healthier, safer and fresh food, preserve farming culture and land use, climate resilience", 1)],
        """Food self-sufficiency is important for Bhutan because:
1. Food and nutrition security: Bhutan imports a large share of its rice, vegetables, meat and other foods, mainly from India. Producing more at home reduces the risk from border closures (as during COVID-19), export bans, transport disruptions, natural disasters and price rises, ensuring a stable supply of food.
2. Economy: it reduces food imports and the outflow of Indian rupees and foreign exchange, narrowing the trade deficit; it keeps money in the rural economy, raises farm incomes, creates jobs for youth and supports agro-processing and rural development, reducing poverty and rural-urban migration.
3. Health and quality: locally grown food is fresher, safer (fewer chemical residues) and supports better nutrition.
4. National and cultural values: it strengthens self-reliance and sovereignty, contributes to GNH, keeps land productive (reducing fallow land) and preserves farming traditions and biodiversity, while building resilience to climate change."""),
    saq(3, T, "How can the Ministry of Agriculture and Livestock ensure that the youth stay on the farm?",
        [("Make farming profitable: assured markets/ buy-back, minimum support prices, value addition, credit/ loans (low interest), insurance, land access/ land leasing, inputs and subsidies", 2),
         ("Reduce drudgery and modernise: farm mechanisation, irrigation, technology/ digital and commercial farming, protected cultivation, HWC fencing", 1.5),
         ("Skills and status: training/ incubation, youth groups/ cooperatives, start-up support, extension and mentoring, recognition, rural infrastructure and services (roads, internet), awareness to change mindset", 1.5)],
        """The Ministry can keep youth in farming by making it profitable, modern and respected:
1. Profitability and markets: assured markets and buy-back schemes, minimum support prices, links to schools, hotels and exports, support for value addition and agro-processing, easy and low-interest credit, crop and livestock insurance, and access to land through land leasing and use of fallow land.
2. Modernisation and less drudgery: farm mechanisation and hiring centres, reliable irrigation, greenhouses and protected cultivation, improved seeds and breeds, digital tools, and protection from wildlife (chain-link/electric fencing).
3. Skills and support: training, internships and agri-business incubation, start-up grants, youth farming groups and cooperatives, mentoring by extension officers and successful farmers, and commercial and specialised farming opportunities.
4. Rural living and recognition: better rural infrastructure (roads, electricity, internet, services), recognition and awards for young farmers, and awareness programmes that present farming as a dignified, rewarding career."""),
    saq(4, T, "What do you mean by climate-smart agriculture? How is it different from climate-resilient agriculture?",
        [("Climate-smart agriculture (FAO): approach with three pillars - sustainably increase productivity and incomes, adapt and build resilience to climate change, and reduce/ remove greenhouse gas emissions where possible; examples - SRI, conservation agriculture, agroforestry, efficient irrigation, improved varieties, manure management", 3),
         ("Difference: climate-resilient agriculture focuses mainly on adaptation - ability of farms/ systems to withstand, recover from and adapt to climate shocks (drought, floods, pests) - e.g. drought-tolerant varieties, diversification, water harvesting, insurance; CSA is broader, adding productivity and mitigation goals", 2)],
        """Climate-smart agriculture (CSA), as defined by FAO, is an integrated approach to managing farms, crops, livestock, forests and fisheries that addresses food security and climate change together through three pillars: (1) sustainably increasing agricultural productivity and incomes; (2) adapting and building resilience to climate change; and (3) reducing or removing greenhouse gas emissions where possible. Examples include improved and stress-tolerant varieties, efficient irrigation (drip, sprinkler), conservation agriculture, agroforestry, the System of Rice Intensification (less methane), integrated nutrient and manure management, and climate information services.
Climate-resilient agriculture focuses mainly on adaptation - the ability of farming systems and farmers to withstand, cope with, recover from and adapt to climate shocks and stresses such as droughts, floods, erratic rainfall, heat, pests and diseases (e.g. drought-tolerant crops, crop diversification, water harvesting, flood-proof infrastructure, insurance).
Difference: climate resilience is one of the three goals of climate-smart agriculture; CSA is broader because it also aims to increase productivity and to reduce emissions (mitigation), not only to cope with climate change."""),
]
C1 = """Case I
The shortage of farm labour is a critical issue impacting agriculture in our country. Various strategies are being implemented to tackle this problem, including the import of foreign workers for seasonal farm tasks, which is presently under process."""
C2 = """Case II
Human-wildlife conflict (HWC) has been identified as a significant issue in agriculture in Bhutan. Various mitigation strategies have been employed to protect crops from wildlife damage, including crop guarding, electric fencing and, recently, chain-link fencing. The 13th Five-Year Plan (FYP) of the Ministry of Agriculture and Livestock has allocated Nu. 5.1 billion for the installation of chain-link fencing."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("agri2024", 1, T, C1, items=[
    it("1. How will the hiring of foreign farm labour differ from hiring construction workers?", 10,
       [("Nature of work: farm work is seasonal, short and time-critical (planting, harvesting), scattered across many small farms/ remote villages; construction is continuous, project-based, at one site with contractor", 3),
        ("Employer and management: many small individual farmers/ groups as employers vs. contractors/ companies; housing, supervision, wages (lower farm incomes, ability to pay), contracts, movement between farms", 4),
        ("Skills and risks: farm work needs knowledge of local crops/ practices, biosecurity (pest/ disease, plant quarantine), interaction with households/ culture, social impact in villages; different regulation/ permits (MoAL vs MoLHR/ MoICE), monitoring", 3)],
       """Hiring foreign farm labour differs from hiring construction workers in several ways:
1. Nature and timing of work: farm work is seasonal and time-critical (land preparation, transplanting, weeding and harvesting must be done within short windows), whereas construction work is continuous and project-based for months or years.
2. Location: construction workers stay at one site or camp under a contractor; farm workers would be spread over many small, scattered farms in remote villages, and may need to move from farm to farm or village to village, which is harder to manage and monitor.
3. Employers and ability to pay: construction workers are hired by companies and contractors with project budgets; farm workers would be hired by many smallholder farmers or farmer groups with low and uncertain incomes, so wages, housing, food and recruitment costs need cost-sharing or support schemes.
4. Skills: farm work needs familiarity with local crops, terraces, tools and practices, and care with animals; construction requires building skills.
5. Biosecurity and social aspects: farm workers move between fields and may carry pests, diseases or seeds, so plant and animal quarantine rules apply; they live closely with rural households, so cultural and social integration matters.
6. Regulation: different permits, contracts, work duration and monitoring systems are needed, involving the agriculture ministry, labour authorities and local governments."""),
    it("2. If the recruitment of farm labour is approved and implemented, what are the advantages and disadvantages of this approach?", 20,
       [("Advantages: fills seasonal labour gap, timely operations, higher production and food self-sufficiency, reduces fallow land, farmers can expand/ commercialise, income, reduces crop losses, transfer of skills", 10),
        ("Disadvantages: cost to farmers (wages, recruitment, housing), dependency on foreign labour and outflow of money, does not address root causes (youth migration, low profitability), social/ cultural/ security issues, biosecurity risks, management/ monitoring difficulty, may discourage mechanisation and local employment, legal/ welfare issues", 10)],
       """Advantages: (1) fills the critical seasonal labour gap so that planting, weeding and harvesting are done on time; (2) increases crop production and supports food self-sufficiency, especially rice and vegetables; (3) brings fallow land back into cultivation; (4) lets farmers expand and commercialise their farms and increase incomes; (5) reduces losses from late operations and unharvested crops; (6) relieves elderly farmers and women of heavy work; (7) foreign workers from agricultural backgrounds may bring skills and practices; (8) supports agro-based enterprises and the rural economy.
Disadvantages: (1) high cost for smallholders - wages, recruitment, travel, housing and food - which many cannot afford without subsidy; (2) outflow of money (rupees) from the country; (3) creates dependence on foreign workers and does not solve the root causes - youth leaving rural areas, low profitability, drudgery and wildlife damage; (4) may discourage mechanisation and the employment of local youth; (5) social, cultural and security concerns in rural communities, and the risk that workers stay illegally or move to other jobs; (6) biosecurity risks (pests, diseases, plant material); (7) difficulty in managing, supervising and monitoring workers scattered across farms, and ensuring their welfare and fair treatment; (8) seasonal demand means workers may be idle or need to be moved, complicating contracts."""),
    it("3. As a new agricultural professional, how would you address the issue of farm labour shortages differently?", 20,
       [("Mechanisation: appropriate small machines (power tillers, transplanters, reapers, mini-harvesters), custom hiring centres, farm road/ land development, terracing for machines", 5),
        ("Make farming attractive to youth/ locals: profitability, markets, value addition, commercial farming, land leasing, credit, youth groups, training, recognition", 5),
        ("Labour-saving practices and organisation: direct seeding, herbicides/ mulching where suitable, labour sharing (traditional ''la'' exchange), cooperatives/ farmer groups, crop choice (less labour-intensive, high value), protected cultivation", 5),
        ("Reduce losses and other measures: control HWC so guarding not needed, land consolidation, digital/ precision agriculture, engaging de-suups/ students/ seasonal local labour, policy support and research", 5)],
       """As a new agricultural professional I would focus on long-term solutions within the country:
1. Farm mechanisation: promote appropriate small machines suited to Bhutan's terraces - power tillers, mini-tillers, paddy transplanters, reapers, threshers and mini combine harvesters - through farm machinery hiring centres and cost-sharing, with farm roads, land development and terrace consolidation so machines can be used.
2. Labour-saving technologies and practices: direct seeding of rice, mulching and appropriate weed control, drip irrigation, protected cultivation, improved post-harvest equipment, and choosing high-value, less labour-intensive crops and enterprises.
3. Organising farmers: strengthen farmers' groups and cooperatives to share labour and machinery, revive traditional labour exchange systems, and encourage group or contract farming and land leasing so that fallow land is farmed by those who want to.
4. Making farming attractive to youth and local people: ensure profitability with assured markets, value addition, credit and insurance; youth agri-entrepreneurship programmes, training and incubation; and recognition of farming as a respected career. Engage local seasonal labour such as students during vacations and volunteer programmes during peak seasons.
5. Reducing extra labour needs: control human-wildlife conflict with fencing so that night crop guarding is no longer needed; use digital tools for advice and marketing; and support research on labour-saving technologies.
Foreign labour may be used only as a short-term, supplementary measure while these structural solutions are implemented."""),
])
Q += case("agri2024", 2, T, C2, items=[
    it("1. What is meant by human-wildlife conflict, and what are the consequences of failing to address it?", 20,
       [("Definition: negative interactions when needs/ behaviour of wildlife and people overlap - wildlife damaging crops, killing livestock, injuring people, and people retaliating/ killing wildlife; causes in Bhutan - high forest cover, conservation success, farms near forests, habitat change, fallow land; animals wild boar, deer, monkeys, porcupine, elephant, bear, tiger/ leopard", 8),
        ("Consequences: crop and livestock losses, food insecurity and lower income, labour/ sleep lost to crop guarding, injuries/ deaths, fallow land and abandonment, rural-urban migration, poverty, conflict with conservation goals - retaliatory killing, loss of support for conservation, threat to endangered species, compensation costs to government, failure of self-sufficiency targets", 12)],
       """Human-wildlife conflict (HWC) is the negative interaction that occurs when the needs and behaviour of wild animals overlap with those of people, causing costs to people or to wildlife: animals damage crops, kill livestock, destroy property or injure people, and people in turn harm or kill wildlife in retaliation or defence. In Bhutan, high forest cover (about 70%), strong conservation laws, farms bordering forests, fallow land and habitat changes bring farmers into frequent contact with wild boar, deer, monkeys, porcupines, bears, elephants, and tigers, leopards and wild dogs (livestock).
Consequences of not addressing it:
1. Large crop and livestock losses, reducing household food security and income and pushing families into poverty.
2. Farmers spend many nights guarding crops, losing sleep, time and labour, and risking injury from animals and exposure.
3. Injuries and loss of human lives.
4. Farmers stop cultivating fields near forests, increasing fallow land, and young people migrate to towns, worsening labour shortages and rural decline.
5. National goals of food self-sufficiency and rural development are undermined, and imports rise.
6. Conservation suffers: farmers may kill wildlife in retaliation (poisoning, snares), threatening endangered species, and public support for conservation and protected areas falls.
7. Increased government spending on compensation, relief and food imports, and social conflict between communities and conservation agencies."""),
    it("2. Do you believe that the provision of chain-link fencing is the ultimate solution to mitigating crop damage caused by wild animals? Justify your answer with reasons.", 20,
       [("Position: effective and important but not the ultimate/ only solution", 2),
        ("Benefits: durable (long life), works without electricity, keeps out wild boar, deer, porcupine etc., reduces guarding, allows farming of fallow land, increases production", 6),
        ("Limitations: does not stop monkeys, birds, bears/ elephants (climbing/ breaking), porcupines digging under; high cost (Nu 5.1 billion) and maintenance; gates left open, damage by landslides/ falling trees; only priority crops/ areas covered; blocks wildlife movement/ corridors, fragmentation; dependency; scattered farms difficult", 7),
        ("Need integrated approach: combine with community management/ maintenance, electric fencing, land use planning/ clustering farms, crop insurance and compensation, habitat management, deterrents, alternative crops, research, monitoring of effectiveness", 5)],
       """I believe chain-link fencing is an effective and important tool, but not the ultimate or only solution.
Why it helps: chain-link fences are durable (lasting many years), work without electricity and solar batteries (unlike electric fences), and effectively keep out major crop raiders such as wild boar, deer, sambar and cattle; they reduce the need for night guarding, allow farmers to cultivate fallow land again and increase production and income, supporting food self-sufficiency.
Why it is not the ultimate solution:
1. It does not stop all animals - monkeys and birds climb or fly over, porcupines and wild pigs may dig under, and bears and elephants can damage fences.
2. It is very expensive (Nu. 5.1 billion in the 13th FYP), so it can cover only priority crops and areas; scattered fields are costly to fence.
3. Its effectiveness depends on maintenance and community discipline - gates left open, damage from landslides, falling trees and rust reduce protection, and responsibilities for repair must be clear.
4. Long fences can block wildlife movement and corridors, fragmenting habitats and pushing animals to unfenced fields.
5. It does not address the root causes such as habitat change, land use near forests, and the economic viability of farming.
Therefore an integrated HWC strategy is needed: chain-link fencing combined with electric fencing where suitable, community-based maintenance and ownership, land-use planning and clustering of farms, crop and livestock insurance and compensation, habitat and food management in forests, deterrents and early warning, choice of less palatable crops, research and monitoring of fence effectiveness."""),
    it("3. 'For a large agrarian country like India, crop damage by wild animals is not a significant issue.' To what extent do you agree with this statement regarding crop damage by wild animals? Do you think Bhutan could ever make a similar statement?", 10,
       [("Disagree largely: in India, crop raiding by nilgai, wild boar, elephants, monkeys, deer is a serious local problem in many states, causing big losses to smallholders, deaths (elephants), and farmer protests; nationally its share of total production may be small due to huge farm area mostly away from forests, so partly agree only at aggregate level", 5),
        ("Bhutan: unlikely - small, fragmented farms bordering forests, about 70% forest cover, constitution mandate of 60% forest, strong conservation, high wildlife density; HWC among top farmer constraints; only possible if integrated measures (fencing, land use, insurance) greatly reduce losses", 5)],
       """I largely disagree. At the national level, crop losses to wildlife may look small compared with India's huge total farm production, because most Indian farmland lies in plains far from forests. But crop damage is a serious problem in many states: nilgai (blue bull) and wild boar in Uttar Pradesh, Bihar, Rajasthan and Madhya Pradesh; elephants in Assam, West Bengal, Odisha, Jharkhand, Karnataka and Kerala; monkeys in Himachal Pradesh and Uttarakhand. Smallholders near forests lose large shares of their crops, elephants kill hundreds of people each year, and several states have declared some species vermin or paid large compensation. So the statement is true only at the aggregate level, not for affected farmers.
Bhutan is unlikely ever to make a similar statement. Farms are small, scattered and surrounded by forests; forest cover is about 70% (with a constitutional mandate to keep at least 60%); conservation is strong and wildlife populations are healthy and growing; and HWC is consistently ranked among farmers' top problems, causing fallow land and rural migration. Only if integrated measures - fencing, land-use planning, insurance, compensation and commercial clustered farming - greatly reduce losses could crop damage become a minor issue in Bhutan."""),
])
PATTERN = STANDARD
