"""ME Technical Paper III (Subject Specialisation Paper), Beautification Officer, BCSE 2024 - real paper (PDF sent by the founder).
Standard pattern. Replaced MCQs: 16 ('Queen of the Night' fits two options), 19 (storage range contradicts Q24 in the same
paper) and 26 (two options defensible). Bhutan-specific facts (Dzongkha post title, supervisor, post creation date,
'Queen of Bhutan' plant, market figures) are FLAGGED for checking.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Beautification Officer): BCSE 2024 - check flagged answer keys before publishing"
GROUP_TAG = "beauty2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "beautification-officer"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Beautification Officer", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Beautification Officer"

MCQ = r"""[
{
"n": 1,
"stem": "The Dzongkha translation for the Dzongkhag Beautification Officer is:",
"opts": [
"Dzongkhag Zeycha Gopoen",
"Dzongkhag Zeydhen Gopoen",
"Dzongkhag Dumrai Gopoen",
"Dzongkhag Dumrig Gopoen"
]
},
{
"n": 2,
"stem": "The Global Floriculture market hit a value of approximately _____ in the year 2023.",
"opts": [
"US $ 60 billion",
"US $ 70 billion",
"US $ 80 billion",
"US $ 90 billion"
]
},
{
"n": 3,
"stem": "Which country is the largest producer of cut flowers?",
"opts": [
"China",
"United States of America",
"France",
"Netherlands"
]
},
{
"n": 4,
"stem": "The direct supervisor of the Dzongkhag Beautification Officer is:",
"opts": [
"Hon’ble Secretary, Ministry of Agriculture and Livestock",
"Dasho Dzongdag",
"Dzongkhag Agriculture Officer",
"Director, Department of Agriculture"
]
},
{
"n": 5,
"stem": "The Dzongkhag Beautification Sector was established under the Royal Command. When did the Royal Civil Service Commission create the post of Dzongkhag Beautification Officer?",
"opts": [
"3rd September, 2018",
"4th September, 2018",
"5th September, 2018",
"6th September, 2018"
]
},
{
"n": 6,
"stem": "The “Queen of Bhutan” is a name of ____developed and named in honor of Her Majesty the Gyaltsuen, offered by the United Kingdom.",
"opts": [
"Rose",
"Tulip",
"Chrysanthemum",
"Marigold"
]
},
{
"n": 7,
"stem": "According to the basic rule of floral arrangements, a 12-inch flower vase should have flowers of:",
"opts": [
"12-14 inches tall",
"14-16 inches tall",
"18-24 inches tall",
"25-30 inches tall"
]
},
{
"n": 8,
"stem": "What is the purpose of landscape architecture?",
"opts": [
"Designing buildings",
"Creating functional and aesthetic outdoor spaces",
"Cultivating crops",
"Managing indoor plant care"
]
},
{
"n": 9,
"stem": "What is the term for flowers that are harvested for use in floral arrangements?",
"opts": [
"Potted plants",
"Cut flowers",
"Wildflowers",
"Ground cover"
]
},
{
"n": 10,
"stem": "Which part of the flower is typically removed to extend the vase life of cut flowers?",
"opts": [
"Petals",
"Leaves",
"Stamens",
"Sepals"
]
},
{
"n": 11,
"stem": "Which plant is commonly grown for its ornamental foliage?",
"opts": [
"Tomato",
"Maple",
"Grass",
"Lavender"
]
},
{
"n": 12,
"stem": "Which of the following is an example of an annual ornamental plant?",
"opts": [
"Tulip",
"Petunia",
"Rose",
"Oak"
]
},
{
"n": 13,
"stem": "Which type of garden is designed to require minimal water?",
"opts": [
"Rock Garden",
"Xeriscape Garden",
"Formal Garden",
"Tropical Garden"
]
},
{
"n": 14,
"stem": "Which garden style is known for its symmetry and order?",
"opts": [
"Japanese Garden",
"Cottage Garden",
"Formal Garden",
"Wildflower Garden"
]
},
{
"n": 15,
"stem": "What is a key feature of a Japanese Garden?",
"opts": [
"Bright, colorful flowers",
"Water elements and minimalism",
"Vegetable plots",
"Desert plants"
]
},
{
"n": 16,
"stem": "Which flower is often called the \"Queen of the Night\"?",
"opts": [
"Dahlia",
"Jasmine",
"Epiphyllum",
"Night-blooming cereus"
]
},
{
"n": 17,
"stem": "Which of the following is NOT a landscape design principle?",
"opts": [
"Unity",
"Balance",
"Proportion",
"Complexity"
]
},
{
"n": 18,
"stem": "Which garden style is characterized by asymmetry, rocks, and a focus on natural beauty and simplicity?",
"opts": [
"French Formal Garden",
"English Landscape Garden",
"Japanese Zen Garden",
"Persian Garden"
]
},
{
"n": 19,
"stem": "What is the optimal temperature range for storing most cut flowers to prolong their freshness?",
"opts": [
"0-2°C",
"3-5°C",
"6-8°C",
"9-12°C"
]
},
{
"n": 20,
"stem": "Photoperiodism in floriculture is essential for regulating flowering times. Which statement best explains its significance in commercial flower production?",
"opts": [
"It helps in pest control by altering the light cycle.",
"It enables synchronization of flowering with market demands and holidays.",
"It maximizes leaf production for ornamental foliage.",
"It enhances soil nutrient absorption through light exposure."
]
},
{
"n": 21,
"stem": "In landscape architecture, unity is a critical design principle. How does the principle of unity most effectively contribute to the aesthetic appeal of a garden?",
"opts": [
"By ensuring that no single element stands out",
"By creating a harmonious relationship between all parts of the landscape",
"By using a wide variety of plant species",
"By emphasizing symmetry and formal arrangements"
]
},
{
"n": 22,
"stem": "Japanese Zen Gardens are renowned for their minimalist design. Which cultural and philosophical beliefs primarily influence their design principles?",
"opts": [
"Shintoism and industrial efficiency",
"Zen Buddhism and the concept of wabi-sabi",
"Confucianism and social hierarchy",
"Taoism and dynamic balance"
]
},
{
"n": 23,
"stem": "Post-harvest treatments are crucial for cut flowers. How does silver thiosulfate (STS) treatment specifically benefit cut flowers?",
"opts": [
"It enhances photosynthesis in vase conditions.",
"It inhibits ethylene action, thereby delaying senescence.",
"It improves water uptake by modifying stem structure.",
"It promotes the growth of flower buds."
]
},
{
"n": 24,
"stem": "Storage temperature is critical for cut flowers. Why is the range of 3-5°C (37-41°F) optimal for most cut flowers?",
"opts": [
"It prevents the freezing of cell sap.",
"It slows down metabolic processes without causing chill damage.",
"It enhances the uptake of floral preservatives.",
"It increases the diffusion of ethylene."
]
},
{
"n": 25,
"stem": "Tagetes spp., known for their vibrant colors, are annual plants. What is a significant ecological benefit of incorporating Tagetes spp. in ornamental horticulture?",
"opts": [
"Attracting pollinators and beneficial insects",
"Fixing nitrogen in the soil",
"Enhancing the growth of neighboring plants",
"Reducing the need for irrigation"
]
},
{
"n": 26,
"stem": "Colombia's dominance in the export of cut flowers, particularly roses and carnations, can be attributed to which combination of factors?",
"opts": [
"High domestic consumption and advanced breeding programs",
"Ideal climatic conditions and extensive greenhouse infrastructure",
"Large labor force and proximity to major markets",
"Government subsidies and high-tech farming methods"
]
},
{
"n": 27,
"stem": "Zen Gardens incorporate specific design elements to create tranquility. How do the elements of rocks and water feature in these gardens to enhance the sense of peace?",
"opts": [
"Rocks symbolize permanence and water represents the flow of life, together creating a balanced environment.",
"Rocks are used for seating, and water is used for irrigation purposes.",
"Rocks represent wealth, and water symbolizes prosperity.",
"Rocks are used to create barriers, and water serves as a decorative element."
]
},
{
"n": 28,
"stem": "The symbolic use of flowers in various cultures often conveys specific meanings. Which analytical approach best explains the persistence of floral symbolism across different societies?",
"opts": [
"Biological determinism",
"Cultural diffusion and shared human experiences",
"Random cultural development",
"Geographic isolation and unique cultural practices"
]
},
{
"n": 29,
"stem": "In Buddhist practice, offering flowers is a ritual symbolizing impermanence. How does this practice relate to the core Buddhist concept of Anicca?",
"opts": [
"It represents the eternal nature of the Buddha's teachings.",
"It symbolizes the accumulation of material wealth.",
"It reflects the transient nature of life and all things.",
"It denotes the pursuit of personal enlightenment."
]
},
{
"n": 30,
"stem": "The lotus flower holds significant meaning in Buddhism. What does the growth of a lotus from muddy water to bloom symbolize in the context of Buddhist teachings?",
"opts": [
"The journey from ignorance to enlightenment",
"The importance of material prosperity",
"The benefits of ritual purity",
"The power of the natural environment"
]
}
]"""

CHECK = "Answer key not verified (Bhutan-specific or statistical fact) - confirm before publishing."
KEY = {
    1: ("d", "Dzongkha title of the post (to be confirmed)."), 2: ("c", "Global floriculture market value 2023 (to be confirmed)."),
    3: ("d", "The Netherlands is the leading cut-flower producer and trader (to be confirmed)."), 4: ("b", "The Dzongkhag Beautification Officer reports to the Dzongdag (to be confirmed)."),
    5: ("c", "Date the RCSC created the post (to be confirmed)."), 6: ("a", "'Queen of Bhutan' plant offered by the UK (to be confirmed)."),
    7: ("c", "Flowers should be about 1.5-2 times the vase height: 18-24 inches for a 12-inch vase."), 8: ("b", "Landscape architecture creates functional, aesthetic outdoor spaces."),
    9: ("b", "Flowers harvested for arrangements are cut flowers."), 10: ("b", "Leaves below the water line are removed to prevent rot and bacteria."),
    11: ("b", "Maples (e.g. Japanese maple) are grown for ornamental foliage."), 12: ("b", "Petunia is an annual."),
    13: ("b", "Xeriscaping needs minimal water."), 14: ("c", "Formal gardens are symmetrical and ordered."),
    15: ("b", "Japanese gardens feature water elements and minimalism."), 17: ("d", "Complexity is not a design principle; unity, balance and proportion are."),
    18: ("c", "Japanese Zen gardens: asymmetry, rocks and natural simplicity."), 20: ("b", "Photoperiod control times flowering for markets and festivals."),
    21: ("b", "Unity creates harmony between all parts of the landscape."), 22: ("b", "Zen Buddhism and wabi-sabi shape Zen gardens."),
    23: ("b", "STS blocks ethylene action, delaying senescence."), 24: ("b", "Cool storage slows metabolism without chilling injury."),
    25: ("a", "Marigolds attract pollinators and beneficial insects (and deter some pests)."), 27: ("a", "Rocks symbolise permanence; water (or raked gravel) the flow of life."),
    28: ("b", "Cultural diffusion and shared human experience explain common floral symbolism."), 29: ("c", "Fading flowers reflect anicca - impermanence."),
    30: ("a", "The lotus rising from mud symbolises the path from ignorance to enlightenment."),
}
FLAG = {1, 2, 3, 4, 5, 6}
T = TOPIC
Q = mcqs(MCQ, KEY, T)
for q in Q:
    if int(q["key"][1:]) in FLAG: q["issues"] = [CHECK]
Q += [
    new_mcq(1, T, "Ethylene is harmful to many cut flowers because it", ["Speeds up wilting, petal drop and senescence", "Increases vase life", "Improves stem water uptake", "Deepens flower colour"], "a",
            "Ethylene hastens ageing; ethylene inhibitors (STS, 1-MCP) protect sensitive flowers."),
    new_mcq(2, T, "Re-cutting the stems of cut flowers under water before placing them in a vase mainly helps to", ["Prevent air blockage (embolism) and improve water uptake", "Reduce flower colour", "Kill all bacteria", "Increase stem thickness"], "a",
            "Cutting under water avoids air entering the xylem, keeping water flowing to the flower."),
    new_mcq(3, T, "A floral preservative added to vase water usually contains", ["Sugar, an acidifier and a biocide", "Salt and vinegar only", "Fertiliser and lime", "Only bleach"], "a",
            "Sugar feeds the flower, the acidifier improves water uptake and the biocide controls microbes."),
    saq(1, T, "Among the various types of gardens, describe five gardens briefly.",
        [("Five garden types described (1 each): formal, informal/ English landscape, Japanese/ Zen, rock garden, xeriscape, herb/ kitchen, rose garden, cottage, water garden, terrace/ vertical/ roof garden, monastery/ Bhutanese courtyard garden", 5)],
        "1. Formal garden - symmetrical layout with geometric beds, straight paths, clipped hedges and topiary (e.g. French gardens). 2. Informal/English landscape garden - natural curves, rolling lawns, groups of trees, lakes, imitating nature. 3. Japanese/Zen garden - minimalist, asymmetrical, with rocks, raked gravel, water, moss and pruned trees for contemplation. 4. Rock garden - rocks and alpine or succulent plants on slopes; suits Bhutan's hilly terrain. 5. Xeriscape garden - drought-tolerant plants and mulch needing little water. Others: herb/kitchen garden, rose garden, water garden with ponds and aquatic plants, cottage garden, vertical/roof gardens in towns."),
    saq(2, T, "What are the prospects for floriculture in Bhutan?",
        [("Favourable agro-climatic diversity (subtropical to alpine), clean environment, native flora (orchids, rhododendrons, blue poppy)", 1.5), ("Market: domestic demand (religious offerings, festivals, weddings, hotels, tourism, GMC), import substitution (flowers imported from India), export potential", 1.5), ("Opportunities: income/ employment for youth and women, protected cultivation, value chain (bulbs, seeds), government support; challenges briefly (cold chain, transport, skills)", 2)],
        "Bhutan's varied climates (subtropical south to temperate and alpine north), clean environment and rich native flora (orchids, rhododendrons, primulas, blue poppy) suit many flowers - cut flowers like roses, gerberas, carnations, lilies, chrysanthemums and orchids, and bulbs. Demand is growing for religious offerings, festivals (tshechus), weddings, hotels and tourism, events and urban landscaping (including GMC); most cut flowers are now imported from India, so domestic production can replace imports and save foreign exchange; organic and niche products (orchids, bulbs, seeds) have export potential. Floriculture gives high income per unit area and jobs for youth and women, especially in greenhouses near towns. Challenges to address: cold chain and transport, quality planting material, technical skills, market linkages and small scale - but with government support and protected cultivation the prospects are good."),
    saq(3, T, "As a Beautification Officer, how would you promote urban gardening?",
        [("Awareness and training (workshops, demonstrations), community/ school gardens", 1.5), ("Space strategies: rooftop, balcony, vertical, container gardening, public spaces, allotments", 1.5), ("Support: seedlings/ inputs, competitions/ awards, partnerships with thromde, MoAL, schools, private sector, policy incentives, composting/ rainwater", 2)],
        "Raise awareness of the benefits (beauty, fresh food, mental well-being, cleaner air) through campaigns and social media; run training and demonstrations on container, balcony, rooftop and vertical gardening, composting and rainwater use; set up demonstration and community gardens in public spaces, schools, institutions and dzong premises; supply seedlings, seeds and pots at low cost through nurseries; organise competitions and awards for the best gardens and cleanest neighbourhoods; work with the thromde, Ministry of Agriculture and Livestock, schools, NGOs and businesses (sponsorship); encourage building regulations that include green spaces and roof gardens; and monitor and maintain public plantings."),
    saq(4, T, "From a Buddhist point of view, why is offering flowers to the Könchog Sum (Triple Gem) considered an act of generosity?",
        [("Generosity (jinpa/ dana) as first paramita - giving without attachment to the Buddha, Dharma, Sangha", 2), ("Flowers as one of the outer offerings; offering accumulates merit, purifies mind, counters attachment/ miserliness, expresses devotion; impermanence reflection", 3)],
        "Generosity (jinpa, dana) is the first of the six perfections (paramitas). Offering flowers to the Könchog Sum - the Buddha, Dharma and Sangha - is giving something beautiful without expecting anything in return, so it trains the mind to let go of attachment and miserliness. Flowers are among the traditional outer offerings (with water, incense, light, food and music); offering them with devotion accumulates merit, purifies negative karma and develops respect and faith in the Triple Gem. As the flowers fade, they also remind the giver of impermanence (anicca), supporting wisdom alongside generosity."),
]
C1 = """Case I: Landscaping for Gelephu Mindfulness City
Every Bhutanese is aware of the upcoming developments in Gelephu Mindfulness City (GMC). In developed countries, landscaping and beautification are integral to urban planning and environmental management."""
C2 = """Case II: The Royal Bhutan Flower Exhibition
The Royal Bhutan Flower Exhibition (RBFE) is an annual event organised by the Ministry of Agriculture and Livestock. The first RBFE, held in 2016, reportedly cost over Nu. 20 million. The Ministry plans to resume the event next year."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("beauty2024", 1, T, C1, items=[
    it("1. What are some key aspects of aesthetic interventions in developed cities?", 15,
       [("Green infrastructure: parks, street trees, green corridors, roof/ vertical gardens", 3), ("Public spaces and streetscape: plazas, walkable streets, furniture, lighting, public art", 3), ("Water features/ blue infrastructure, rain gardens, riverfronts", 3), ("Native/ seasonal planting, floral displays, maintenance and cleanliness, heritage/ identity", 3), ("Planning integration: design codes, sustainability, accessibility, community participation", 3)],
       "Key aspects: green infrastructure - parks, tree-lined streets, green corridors, roof and vertical gardens that cool the city and improve air; attractive public spaces and streetscapes - plazas, wide footpaths, benches, lighting, signage and public art; blue infrastructure - riverfronts, ponds, fountains and rain gardens combining beauty with storm-water management; seasonal and native planting with colourful floral displays at entrances, roundabouts and civic buildings; preserving heritage and local identity in landscape design; cleanliness, waste management and regular maintenance; accessibility for all; integration with urban planning through design codes and green-space standards; and community participation in caring for spaces."),
    it("2. In your opinion, how would Gelephu Mindfulness City (GMC) contribute to the growth of the floral industry?", 20,
       [("Demand: large-scale landscaping, parks, streets, hotels, events, residents, tourism, corporate/ hospitality sector", 5), ("Production/ supply: commercial nurseries, greenhouses in warm southern climate, tropical flowers/ orchids, import substitution, export via GMC logistics/ airport", 5), ("Jobs/ enterprises: landscaping firms, florists, youth employment, training, value chain (seeds, bulbs, potting, cold chain)", 5), ("Investment/ policy: FDI, technology, research, branding (mindfulness, sustainability), linkages with farmers", 5)],
       "GMC will create large, steady demand for ornamental plants and flowers: landscaping of parks, streets, campuses and residential areas; hotels, resorts, wellness centres, offices, events and conferences; and residents and tourists buying flowers for homes, offerings and gifts. Gelephu's warm subtropical climate suits tropical flowers, orchids, foliage plants and year-round production, encouraging commercial nurseries and greenhouses nearby and reducing imports from India. GMC's investment-friendly policies, logistics hub and planned airport could attract foreign investment, modern greenhouse technology and export of high-value flowers and plants to regional markets. It would create businesses and jobs - landscaping firms, florists, nursery workers and designers - especially for youth, with training and research links. Branding linked to mindfulness, sustainability and Bhutan's natural beauty would add value. Farmers in Sarpang and neighbouring dzongkhags could supply through contract farming and cooperatives, building a full value chain (planting material, inputs, cold chain, packaging)."),
    it("3. What challenges do you anticipate in implementing urban landscaping in GMC?", 15,
       [("Climate: heat, monsoon floods, pests/ diseases, invasive species, plant selection", 3), ("Resources: funding, maintenance costs, skilled landscape professionals, planting material supply", 3), ("Planning: land use conflicts, coordination among agencies/ investors, design standards, scale/ speed", 3), ("Environment: water management, biodiversity/ elephants/ wildlife corridors, sustainability, waste", 3), ("Social: public participation, ownership, vandalism, long-term upkeep", 3)],
       "Climate and site: hot, humid summers, heavy monsoon rain and flooding, pests and diseases, and the need to choose plants that suit the subtropical climate and avoid invasive species. Resources: high costs of establishment and long-term maintenance; shortage of trained landscape architects, horticulturists and gardeners; limited supply of quality planting material locally. Planning and coordination: rapid, large-scale development by many investors and agencies may outpace landscape planning; land-use conflicts; need for clear design codes and enforcement. Environmental: balancing landscaping with water use and drainage, protecting existing forests, biodiversity and wildlife corridors (elephants), managing green waste. Social: getting public participation and a sense of ownership, preventing damage and vandalism, and sustaining maintenance after the initial investment."),
])
Q += case("beauty2024", 2, T, C2, items=[
    it("1. Why do you think organising the RBFE is important?", 15,
       [("Promotes floriculture/ horticulture as livelihood, showcases Bhutan's flora/ innovation", 4), ("Tourism and national image, celebrating royal occasions/ national pride, cultural values (flowers in Buddhist practice)", 4), ("Knowledge sharing, training, market linkages, inspiring citizens/ youth, beautification culture", 4), ("Boost local economy of host dzongkhag (infrastructure, business)", 3)],
       "The RBFE promotes floriculture and horticulture as a source of income and jobs, showcasing Bhutan's rich flora, local growers and new techniques; it encourages citizens, schools and institutions to grow flowers and beautify homes and towns; it attracts domestic and international visitors, supporting tourism and Bhutan's image as a green, beautiful country; it celebrates royal occasions and national pride and connects to cultural and Buddhist values of flower offerings; it brings knowledge exchange, training, competitions and market linkages for growers and florists; and it develops lasting infrastructure (parks, gardens) and boosts the local economy of the host dzongkhag."),
    it("2. If you, as a Dzongkhag Beautification Officer, were asked to host the next RBFE, how would you host it differently?", 20,
       [("Cost-effective planning: budget control, use local materials/ plants, sponsorships/ PPP, reuse infrastructure", 5), ("Sustainability: permanent gardens/ parks as legacy, native plants, zero-waste, water-wise", 5), ("Inclusive and engaging: community/ schools/ farmers participation, competitions, workshops, market stalls, digital/ virtual tours", 5), ("Economic linkage: trade fair for growers, buyer-seller meets, tourism packages; monitoring and evaluation", 5)],
       "I would focus on lower cost and lasting benefit: plan early with a clear budget and seek sponsorship from businesses and partners (public-private partnership); use locally grown plants and materials, and involve local farmers, schools, monasteries and communities as growers months in advance; design the venue as a permanent park or public garden so the exhibition leaves a lasting legacy for the town; feature native and climate-suited plants and water-wise, zero-plastic, zero-waste practices; include workshops, competitions, a flower and plant market, buyer-seller meetings and value-chain exhibits so growers earn income; promote it digitally (virtual tours, social media) and link it with tourism packages; ensure accessibility and cultural programmes; and evaluate costs, visitors and economic impact afterwards."),
    it("3. Considering the significant cost and resources needed for the RBFE, how would you develop a more sustainable floristry strategy for your dzongkhag?", 15,
       [("Local production: community/ school nurseries, greenhouses, farmer groups/ cooperatives, native and perennial plants", 4), ("Market and livelihood: link to hotels, events, dzongs/ lhakhangs offerings, import substitution", 4), ("Resource efficiency: composting, water harvesting, seed/ bulb banks, reuse, low-maintenance landscapes", 4), ("Capacity and partnerships: training, PPP, budgeting, monitoring; smaller annual dzongkhag shows", 3)],
       "Build year-round local capacity instead of one costly event: establish dzongkhag and community nurseries (with schools, youth and farmer groups) producing seedlings, perennials and native plants; promote small greenhouses and cooperatives for cut flowers to supply local offices, hotels, weddings and lhakhang offerings, replacing imports; favour perennial, native and low-maintenance plants and water-wise designs; practise composting, rainwater harvesting and seed and bulb saving to cut input costs; train growers and maintenance staff; partner with businesses and institutions to adopt and maintain public gardens; hold smaller, low-cost dzongkhag flower shows and competitions; and plan budgets with clear targets and monitoring."),
])
PATTERN = STANDARD
