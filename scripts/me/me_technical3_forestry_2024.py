"""ME Technical Paper III (Subject Specialisation Paper), Forestry, BCSE 2024 - real paper (PDF sent by the founder).
Standard pattern. MCQs 4, 14, 16 and 29 replaced (flawed or two right options); Bhutan-figure keys flagged. Case I uses the diameter-class figure.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing"
GROUP_TAG = "forest2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "forestry"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Forestry"

MCQ = r"""[
{
"n": 1,
"stem": "The interaction between individuals of the same species or different species at the same trophic level, in which the growth and survival of one or all species or individuals is adversely affected:",
"opts": [
"Compensation point",
"Competitive exclusion principle",
"Competitive release",
"Competition"
]
},
{
"n": 2,
"stem": "The region of the Earth where life can be found, including soil, water, and air is termed as:",
"opts": [
"Biome,",
"Biosphere,",
"Biosphere reserve",
"Ecosystem"
]
},
{
"n": 3,
"stem": "Bhutan’s protected area network comprises of National Parks, Wildlife Sanctuaries, Strict Nature Reserve, Botanical Park and Biological Corridors. The Protected Area network constituted;",
"opts": [
"51.44 % of the forest area,",
"52 % of the forest area,",
"60 % of the forest area,",
"51 % of the forest area,"
]
},
{
"n": 4,
"stem": "The biological corridors were introduced to connect all protected areas into a single uninterrupted area. The main purpose of biological corridor is to;",
"opts": [
"Increase or maintain the wildlife population,",
"Increase the protected area,",
"Provide free movement of wildlife,",
"All of the above"
]
},
{
"n": 5,
"stem": "A successional change, usually from an existing climax community, leading to a less diverse and less structurally complex community is called;",
"opts": [
"Retrogressive succession",
"Allogenic succession",
"Progressive succession",
"All of the above"
]
},
{
"n": 6,
"stem": "Which of the following natural polymer is used in paper making?",
"opts": [
"Chitin",
"Keratin",
"Cellulose",
"Elastin"
]
},
{
"n": 7,
"stem": "The national tiger survey report revealed the increase in Tiger numbers from 103 in 2015 to 131 tigers in 2023. The significant increase in Tiger population indicates;",
"opts": [
"Global warming,",
"Increased developmental activities,",
"Increased poaching activities,",
"Healthy ecosystems"
]
},
{
"n": 8,
"stem": "The natural rejection of plant organs such as leaves, flowers and fruits in order to help adapt to nutrient limitation is called:",
"opts": [
"Senescence",
"Die-back",
"Plant disease",
"Abscission"
]
},
{
"n": 9,
"stem": "Evolutionary mechanism that leads to adaptation is;",
"opts": [
"selection",
"mutation,",
"migration,",
"genetic drift,"
]
},
{
"n": 10,
"stem": "The forest fire damaged about 4 hectares of chirpine forest in Wangduephodrang dzongkhag. The 4 hectares of chirpine forest area is equivalent to:",
"opts": [
"4000 m2",
"45000 m2",
"40000 m2",
"20000 m2"
]
},
{
"n": 11,
"stem": "Selecting good seeds is critical in raising seedlings in the nursery. Seeds contain following:",
"opts": [
"Pollen grains & sporophytes",
"Male sporophyte and embryo",
"Embryo and nutritive tissue",
"Mature sporophyte and nutritive tissue"
]
},
{
"n": 12,
"stem": "Dey-sho (Traditional paper) is known for its durability and raw materials are locally available. The source of the raw material is bark from a shrub plant referred to as;",
"opts": [
"Daphne bholua",
"Edgeworthia gardneri",
"Pieris formosa",
"Morus alba"
]
},
{
"n": 13,
"stem": "A scientific instrument used to measure atmospheric pressure is:",
"opts": [
"Pressure meter,",
"Hydrometer",
"pH meter",
"Barometer"
]
},
{
"n": 14,
"stem": "Forest watersheds are the main sources of spring water in Bhutan. A sample from one of the spring water is collected and tested for its chemical properties. The holy water sample showed a pH of 0.8 and not fit for drinking.",
"opts": [
"The spring is slightly alkaline",
"The spring water is neutral",
"The spring water is slightly acidic",
"None of the above"
]
},
{
"n": 15,
"stem": "Forest Inventories are carried periodically to understand the status of forest coverage, health of the forest and its potential resources. The latest inventory result showed 2.68 million ha of forest area equivalent to;",
"opts": [
"70.0 % forest coverage,",
"71.5 % forest coverage,",
"72 % forest coverage,",
"69.71 % forest coverage"
]
},
{
"n": 16,
"stem": "Broad-leaved forest constitutes 67.99 % of the total forests and are mainly hardwood (angiosperm trees). The properties of hardwood are:",
"opts": [
"Non-porous and presences of vessels",
"Heartwood and non porous",
"Simple structure and porous wood",
"None of the above"
]
},
{
"n": 17,
"stem": "Starch and oxygen are the results of photosynthesis. What is the formula of plant photosynthesis?",
"opts": [
"C6H12O6+ 6O2 → 6CO2 + 6H2O",
"2Na+2H2O → 2NaOH + H2",
"6CO2 + 6H2O → C6H12O6+ 6O2",
"None of the above"
]
},
{
"n": 18,
"stem": "Pinus species normally colonized the abandoned and fallow land. The colonization pattern is called;",
"opts": [
"Primary succession",
"Regeneration succession",
"Secondary succession",
"Inhibition"
]
},
{
"n": 19,
"stem": "The Royal Government of Bhutan made a commitment at the 15th Conference of Parties (COP-15) of the United Nations Framework Convention on Climate Change (UNFCCC) in 2009;",
"opts": [
"to remain carbon neutral,",
"to remain carbon negative,",
"to reduce use of fossil fuel,",
"to increase forest cover"
]
},
{
"n": 20,
"stem": "The Ramsar Convention on Wetlands of International Importance was signed in 1971 in the city of Ramsar in Iran. Bhutan declared 3 RAMSAR sites;",
"opts": [
"Gantey-Phobji, Buli & Bumdeling",
"Peling-tsho, Gangtey-Phobji, Khotokha",
"Khotokha, Bumdeling & Gaytsa",
"Gangtey-Phobji, Khotokha & Bumdeling"
]
},
{
"n": 21,
"stem": "Bhutan with abundant fresh water resources with per capita availability of about 94,000 cubic meters per person annually, one of the highest in the world. However, recently there are reports of water shortage in many places in Bhutan. The reasons of water shortage are;",
"opts": [
"Drying up of springs and streams,",
"Flash floods and sediments due to intense rainfall,",
"Lack of design and climate proof infrastructure,",
"All of the above"
]
},
{
"n": 22,
"stem": "Environmental Impact Assessment (EIA) is one of the fundamental processes of developmental projects. EIA is carried out to;",
"opts": [
"Reduce the impacts on the environment,",
"Identify and propose mitigation measures,",
"Help protect critical resources from degradation,",
"All of the above"
]
},
{
"n": 23,
"stem": "A type of relationship where one of the organisms benefits greatly from the symbiosis. In other words, this is a one-sided symbiotic relationship;",
"opts": [
"Symbiosis",
"Commensalism",
"Parasitism",
"Mutualism"
]
},
{
"n": 24,
"stem": "Bhutan’s protected area network comprises of National Parks, Wildlife Sanctuaries, Strict Nature Reserves, Botanical Park and Biological Corridors. How many wildlife sanctuaries are established in Bhutan?",
"opts": [
"Three (3),",
"Five (5),",
"Two (2),",
"None of the above"
]
},
{
"n": 25,
"stem": "Forest fragmentation is a major issue in managing and conserving the forest resources resulting in;",
"opts": [
"Human-wildlife conflict,",
"Decrease biodiversity,",
"Encroachment of invasive species,",
"All of the above"
]
},
{
"n": 26,
"stem": "Blue pine is a coniferous evergreen needle leaved tree native to the Himalayas. Blue pine is known by the scientific name;",
"opts": [
"Pinus roxburghii,",
"Pinus bhutanica,",
"Pinus wallichiana,",
"Pinus patula"
]
},
{
"n": 27,
"stem": "Any disease that results in rapid decay or death of young succulent seedlings of both coniferous and broad-leaved species due to high humidity, moist soil, high organic matter and shade:",
"opts": [
"Leaf Spot,",
"Needle blight,",
"Die-back,",
"None of the above"
]
},
{
"n": 28,
"stem": "The lowest altitude of Bhutan is around 100 m a.s.l. along the southern foothills and highest peak is more than 7000 m a.s.l. in the northern high Himalayas. The distribution of trees is limited by the low temperature at higher altitudes. The generally accepted tree line is:",
"opts": [
"3500 m",
"4500 m",
"5000 m",
"4000 m"
]
},
{
"n": 29,
"stem": "Royal Government of Bhutan discouraged introducing exotic trees in the country due to its invasiveness characteristics. However, one of the following exotic tree species is introduced in past as valuable timber;",
"opts": [
"Thuja orientalis,",
"Tectona grandis,",
"Cryptomeria japonica",
"Eucalyptus"
]
},
{
"n": 30,
"stem": "How many biological corridors are established in Bhutan that connects the Protected Area network?",
"opts": [
"7",
"8",
"9",
"None of the above"
]
}
]"""

CHECK = "Answer key not verified: Bhutan-specific figure - a forester must confirm it against the latest DoFPS/ NFI data before publishing."
KEY = {
    1: ("d", "Competition is the interaction that harms the growth or survival of the individuals or species involved."),
    2: ("b", "The biosphere is the part of the Earth (land, water and air) where life is found."),
    3: ("a", "The protected area network covers about 51.44% of Bhutan (note: of the country's area, not of the forest area)."),
    5: ("a", "Succession that moves away from the climax to a simpler, less diverse community is retrogressive succession."),
    6: ("c", "Paper is made from cellulose fibres."),
    7: ("d", "A rising tiger population (an apex predator) indicates healthy ecosystems with enough prey and habitat."),
    8: ("d", "The natural shedding of leaves, flowers and fruits is abscission."),
    9: ("a", "Natural selection is the mechanism that leads to adaptation; mutation, migration and drift change gene frequencies at random."),
    10: ("c", "1 hectare = 10 000 m², so 4 ha = 40 000 m²."),
    11: ("c", "A seed contains the embryo and nutritive (storage) tissue inside a seed coat."),
    12: ("a", "Dey-sho is traditionally made from the bark of Daphne species (Daphne bholua)."),
    13: ("d", "A barometer measures atmospheric pressure."),
    15: ("d", "The NFI (2023) reported 69.71% forest cover."),
    17: ("c", "Photosynthesis: 6CO2 + 6H2O → C6H12O6 + 6O2 (in light, with chlorophyll)."),
    18: ("c", "Colonisation of abandoned or fallow land that still has soil is secondary succession."),
    19: ("a", "At COP15 in Copenhagen (2009) Bhutan pledged to remain carbon neutral."),
    20: ("d", "Bhutan's three Ramsar sites (2012) are Gangtey-Phobji, Khotokha and Bumdeling."),
    21: ("d", "Drying springs, flash floods with sediment and poorly designed infrastructure all cause water shortages."),
    22: ("d", "EIA identifies impacts, proposes mitigation and protects resources - all of the above."),
    23: ("b", "Commensalism: one partner benefits and the other is neither helped nor harmed - a one-sided relationship."),
    24: ("d", "Bhutan has four wildlife sanctuaries (Bumdeling, Sakteng, Phibsoo and Jomotsangkha), so none of the options."),
    25: ("d", "Fragmentation increases human-wildlife conflict, reduces biodiversity and helps invasive species spread."),
    26: ("c", "Blue pine is Pinus wallichiana."),
    27: ("d", "Rapid decay or death of young seedlings in damp, shaded nursery beds is damping-off, which is not listed."),
    28: ("d", "The tree line in the Bhutan Himalaya is generally taken as about 4000 m."),
}
FLAG = {3, 12, 24, 28}
T = TOPIC
Q = mcqs(MCQ, KEY, T)
for q in Q:
    if int(q["key"][1:]) in FLAG: q["issues"] = [CHECK]
Q += [
    new_mcq(1, T, "A forest that regenerates mainly from stump or root shoots after felling is called a:", ["High forest", "Coppice forest", "Plantation forest", "Seed orchard"], "b",
            "Coppice forest regrows vegetatively from stumps or roots; high forest regenerates from seed."),
    new_mcq(2, T, "Diameter at breast height (DBH) of a standing tree is normally measured at what height above ground (uphill side on slopes)?", ["1.0 m", "1.3 m", "1.5 m", "2.0 m"], "b",
            "DBH is measured at 1.3 m above ground, on the uphill side on sloping ground."),
    new_mcq(3, T, "Which tissue in a tree trunk conducts water and minerals from the roots to the leaves?", ["Phloem", "Xylem", "Cambium", "Cork"], "b",
            "Xylem (sapwood) carries water and minerals upward; phloem carries food downward."),
    new_mcq(4, T, "The basal area of a tree with a DBH of 40 cm is approximately:", ["0.126 m²", "0.251 m²", "0.503 m²", "1.257 m²"], "a",
            "Basal area = πd²/4 = 3.1416 x 0.40² / 4 ≈ 0.126 m²."),
    new_mcq(5, T, "A Shannon diversity index (H') value of 0 for a plot means that:", ["Only one species is present", "All species are equally abundant", "Diversity is very high", "The plot has many rare species"], "a",
            "H' = 0 when the community has a single species; H' rises with more species and more even abundance."),
    saq(1, T, """What do you understand by the following:
a. Afforestation
b. Reforestation""",
        [("Afforestation: establishing forest (planting/ seeding) on land that has not been forest for a long time (at least 50 years) or never was forest; e.g. barren land, degraded pastures", 2.5),
         ("Reforestation: re-establishing forest on land that was recently forest but was cleared (felling, fire, landslide), by planting or natural/ assisted regeneration; difference = previous land use", 2.5)],
        """a. Afforestation is the establishment of a forest, by planting trees or sowing seeds, on land that has not been under forest for a long time (commonly at least 50 years under UNFCCC definitions) or that was never forest - for example barren hillsides, degraded grazing land or mine spoil. It increases forest area and carbon storage, controls erosion and protects watersheds.
b. Reforestation is the re-establishment of forest on land that was forest until recently but was cleared by harvesting, fire, landslides or shifting cultivation - by planting, direct seeding or natural or assisted natural regeneration. In Bhutan, plantations after logging in Forest Management Units and replanting of burnt chir pine areas are reforestation.
The difference lies in the land's history: afforestation creates new forest, reforestation restores forest that was lost."""),
    saq(2, T, """Define the following:
a. Temperate forest
b. Watershed""",
        [("Temperate forest: forest of the temperate (mid-latitude/ mid-altitude) zone with distinct seasons, cool winters, moderate rainfall; broadleaved (oak, maple) and/ or conifers (fir, hemlock, spruce, blue pine); in Bhutan about 2000-3500 m (cool broadleaved, mixed conifer)", 2.5),
         ("Watershed: the land area drained by a stream/ river system to a common outlet, bounded by ridges (water divide); includes forests, soils, settlements; managed as a unit for water", 2.5)],
        """a. A temperate forest is a forest that grows in the temperate zone (mid-latitudes, or mid-altitudes in mountains) with four distinct seasons, cool to cold winters, warm summers and moderate, well-distributed rainfall. It may be broadleaved (deciduous or evergreen, e.g. oak, maple, rhododendron, walnut) or coniferous (fir, spruce, hemlock, blue pine). In Bhutan, temperate forests occur roughly between 2000 and 3500 m - cool broadleaved forest, blue pine, spruce, hemlock and mixed conifer forests.
b. A watershed (catchment) is the area of land from which all rainfall and snowmelt drain into a common stream, river, lake or outlet; its boundary is the ridge or water divide. A watershed includes its forests, soils, wetlands and settlements, and is managed as one unit to protect water quantity and quality - e.g. the forest watersheds that feed drinking water springs in Bhutan."""),
    saq(3, T, "What is forest thinning and why is it important in forest management?",
        [("Definition: silvicultural operation removing some trees from an immature/ even-aged stand to reduce density, leaving the best trees (crop trees); types - low, crown, mechanical, selective", 2),
         ("Importance: more light, water, nutrients for remaining trees - faster diameter growth, better quality timber, healthier stand (less pest/ disease), early yield/ income (poles, firewood), reduces fire risk, improves undergrowth/ biodiversity, stand stability", 3)],
        """Forest thinning is a silvicultural operation in which some trees are removed from an immature (usually even-aged) stand to reduce stand density, so that the remaining trees grow better; poor, diseased, suppressed or badly formed trees are removed first and the best "crop trees" are favoured. Types include low (from below), crown (from above), selective and mechanical (row) thinning.
Importance: it reduces competition for light, water and nutrients so the remaining trees grow faster in diameter and give better-quality timber in a shorter rotation; it improves stand health by removing diseased and weak trees, reducing pest and disease outbreaks; it gives an early yield of poles, posts and firewood for income and rural needs; it reduces fuel load and the risk of forest fires (important in chir pine and blue pine plantations); it lets more light reach the forest floor, improving undergrowth, regeneration and biodiversity; and it produces a more stable, wind-firm stand."""),
    saq(4, T, "Differentiate between primary succession and secondary succession.",
        [("Primary: starts on bare area with no soil/ life (rock, lava, glacial moraine, sand dune, landslide scar to bedrock); pioneers lichens/ mosses; soil formation needed; very slow (hundreds-thousands of years)", 2.5),
         ("Secondary: starts where existing community disturbed but soil/ seed bank remains (fire, logging, abandoned fields, shifting cultivation); pioneers grasses, herbs, shrubs, pines; faster (decades); e.g. pine on fallow land in Bhutan", 2.5)],
        """Primary succession begins in an area where there was no life and no soil - bare rock, new lava, glacial moraines exposed by retreating glaciers, sand dunes or landslides scoured to bedrock. Pioneer species such as lichens and mosses colonise first and slowly build soil, followed by herbs, shrubs and trees. Because soil must be formed, it is very slow (hundreds to thousands of years).
Secondary succession begins where an existing community has been disturbed or removed but the soil, seeds, roots and organisms remain - after forest fire, logging, landslides that leave soil, or on abandoned farmland and fallow shifting-cultivation (tseri) land. Grasses and herbs come first, then shrubs and fast-growing pioneer trees (e.g. pines colonising fallow land in Bhutan), leading back towards the climax forest. It is much faster (decades) because soil and seed bank are already present."""),
]
C1 = """Case Study I: Forest structural attributes
A forest inventory team carried out a vegetation survey in a sample plot measuring 40 m by 40 m. All individual trees within the plot with a height greater than 1.3 m (H ≥ 1.3 m) were identified, measured and recorded for total height (m) and diameter at breast height (DBH, at 1.3 m above ground). The measured attributes were analysed to understand the forest diversity, structural traits and forest types. The sample plot showed a Shannon diversity index (H') of 3 with diverse life-forms.
The diameter class distribution is shown in the figure (Figure 1: Diameter class distribution of a typical forest type - stem density per plot against diameter class, 0 to 85 cm). Study it carefully and answer the following questions."""
C2 = """Case Study II: Forest-water nexus
The National Forest Inventory report (2023) stated that Bhutan has a total forest coverage of 69.71%, of which 67.99% of the total forest area is broad-leaved forest and coniferous forest constitutes 32.01%. The cool broad-leaved forest is the most dominant forest type, accounting for 28.18%.
Similarly, the assessment and mapping of water sources in Bhutan (2021) collected data from 7399 water sources across the country. Of these, springs are the largest water source with 67.6% (5001), followed by streams with 25.7% (1898). The major rivers flow along the valleys.
Owing to the geographical terrain of the country, settlements are mostly located along the mountain slopes. Thus, there is a strong relationship between the forest and water sources originating from forest watersheds."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("forest2024", 1, T, C1, image="/papers/me/tech3-forest-2024-dbh.png", items=[
    it("Q1. Study and describe the type of forest depicted by the figure above.", 15,
       [("Reads figure: about 45 stems in 0.16 ha (≈ 280 stems/ ha); most stems in smallest classes (0-5 cm: 12, 5-10: 10) and few large trees up to 85 cm", 4),
        ("Reverse-J (inverse J/ negative exponential) diameter distribution", 4),
        ("Interpretation: uneven-aged, multi-storeyed, natural (not plantation) mixed forest - likely mixed broadleaved/ old-growth near-natural forest with continuous regeneration; with H' 3 = species-rich", 5),
        ("Gaps in some classes (35, 45, 55, 65-70, 80 cm) suggest past disturbance/ selective removal or irregular recruitment", 2)],
       """Reading the figure: the plot (40 m x 40 m = 0.16 ha) has about 45 stems - 12 in the 0-5 cm class, 10 in 5-10 cm, 4 in 10-15 cm, 5 in 15-20 cm, then only 1-3 stems in the larger classes up to 85 cm, with some classes (about 35, 45, 55, 65-70 and 80 cm) empty. This is roughly 280 stems per hectare, with about 22 of the 45 stems (nearly half) below 10 cm DBH and about 10 trees of 40 cm or more.
Type of forest: the diameter distribution has a reverse-J (inverse J, negative exponential) shape - many small trees and progressively fewer large trees. This is typical of an uneven-aged, multi-storeyed natural forest in which trees of all ages and sizes grow together and regeneration is continuous - not an even-aged plantation (which would show a bell-shaped curve around one diameter). Together with a high Shannon index (H' = 3) and diverse life-forms, it indicates a species-rich, mixed (most likely broadleaved or mixed broadleaved-conifer) near-natural or old-growth forest, such as the cool or warm broadleaved forests that dominate Bhutan. The empty diameter classes suggest irregular recruitment or past disturbance (selective felling, windthrow, landslides), but overall the stand is self-maintaining."""),
    it("Q2. Explain the regeneration structure and the diversity of the sample forest plot.", 15,
       [("Regeneration: abundant small stems (22 of 45 under 10 cm, ≈ 140/ ha) - good, continuous regeneration and recruitment; sufficient saplings/ poles to replace mature trees", 5),
        ("Some irregularity: drop at 10-15 then 15-20 and missing middle classes - recruitment gaps, mortality/ competition, possible grazing or past felling; need regeneration survey (seedlings < 1.3 m excluded)", 4),
        ("Diversity: H' = 3 is high (usual range 1.5-3.5), many species with fairly even abundance, diverse life-forms (trees, shrubs, climbers) - healthy, resilient, habitat value", 6)],
       """Regeneration structure: the largest numbers of stems are in the smallest classes (12 stems at 0-5 cm and 10 at 5-10 cm, about 140 stems per hectare below 10 cm DBH), with fewer poles and only scattered large trees. This reverse-J pattern means there are enough young trees and saplings to replace the mature trees as they die - regeneration and recruitment are good and continuous, which is the sign of a healthy, self-sustaining uneven-aged forest. However, the numbers fall sharply after 10 cm and several middle and large classes are empty, showing irregular recruitment, which may be caused by competition and natural mortality, browsing by cattle and wildlife, past selective logging or natural disturbances. Note also that seedlings below 1.3 m were not measured, so a separate regeneration survey (seedling plots) would complete the picture.
Diversity: a Shannon index (H') of 3 is high - values usually range from about 1.5 to 3.5 in forests - meaning many species are present and their abundances are fairly evenly distributed, with no single dominant species. Diverse life-forms (trees, shrubs, climbers, epiphytes) mean many niches and habitats for wildlife. High diversity makes the forest more resilient to pests, diseases and climate change, and gives important conservation value."""),
    it("Q3. What role can this type of forest play in a mountainous country?", 10,
       [("Watershed/ hydrological: protects springs and streams, regulates flow, recharges groundwater, reduces floods", 2.5), ("Soil and slope protection: multi-layered canopy and roots reduce erosion, landslides; protection forest on steep slopes", 2.5),
        ("Biodiversity and habitat (corridors, wildlife, tigers), climate change mitigation (carbon sink - carbon neutrality), climate resilience", 2.5), ("Livelihoods and economy: NWFPs, firewood, timber (sustainable), medicinal plants, ecotourism, cultural/ spiritual values, hydropower support", 2.5)],
       """A natural, uneven-aged, species-rich forest is very valuable in a mountainous country like Bhutan:
- Watershed protection: the multi-layered canopy, litter and deep roots intercept rain, increase infiltration and recharge groundwater, so springs and streams flow longer in the dry season; they reduce peak floods and keep water clean for drinking, irrigation and hydropower.
- Soil and slope stability: continuous cover and mixed root systems bind soil on steep slopes, reducing erosion, landslides and sedimentation of rivers and hydropower reservoirs; such forests act as protection forests for roads and settlements.
- Biodiversity: varied structure and high diversity provide habitat and corridors for wildlife (including tigers and their prey) and conserve plant genetic resources.
- Climate: large carbon stocks make them important carbon sinks helping Bhutan remain carbon neutral, and diverse forests are more resilient to climate change.
- Livelihoods and culture: sustainable supply of firewood, timber, fodder, non-wood forest products and medicinal plants; ecotourism; and cultural and spiritual values (sacred groves, community forests)."""),
    it("Q4. Is this type of forest potential for logging?", 10,
       [("Yes, but only selective/ sustainable logging (single-tree or group selection) - reverse-J uneven-aged stand suits selection system; no clear-felling", 3),
        ("Limited volume: only about 10 trees ≥ 40 cm in 0.16 ha (≈ 60/ ha), harvest mature/ over-mature and defective trees within allowable cut keeping the J-curve", 3),
        ("Conditions: approved FMU/ management plan, inventory, outside protected areas/ steep slopes/ watershed buffers, low-impact logging (cable cranes), regeneration and monitoring; high diversity/ watershed values may favour conservation", 4)],
       """The forest has some potential for logging, but only through careful, sustainable selective harvesting - not clear-felling.
Why it may be logged: the reverse-J structure of an uneven-aged forest is ideal for a selection system (single-tree or group selection), in which a few mature or over-mature trees are removed periodically and the abundant younger trees grow into the gaps. There are about 10 trees of 40 cm DBH and above in the 0.16 ha plot (about 60 per hectare), some of which (especially large, mature, defective or dying trees) could be harvested.
Conditions and limits: harvesting must follow an approved Forest Management Unit (FMU) or working scheme plan based on a proper inventory, with the annual allowable cut set so that removals do not exceed growth and the J-shaped distribution is maintained; it must be outside protected areas, biological corridors, watershed and drinking-water source protection zones, and very steep or unstable slopes; low-impact methods (cable cranes, directional felling) should be used, with follow-up regeneration and monitoring. Because the plot has very high diversity (H' = 3), many empty large-diameter classes and important watershed and habitat roles, the volume available is limited and in many cases conservation or very light selection is the better choice."""),
])
Q += case("forest2024", 2, T, C2, items=[
    it("Q1. What are the factors affecting water sources in Bhutan? What mitigation measures need to be incorporated into the plan?", 10,
       [("Factors: climate change (erratic rainfall, higher temperature, glacier retreat), forest degradation/ fire/ land-use change in source watersheds, infrastructure (roads, urbanisation) disturbing springs, landslides/ sediment, over-extraction and growing demand, grazing, poor management/ pollution", 5),
        ("Mitigation: protect and restore spring-shed/ watersheds (declare water source protection areas, plantation, fire control), recharge ponds/ trenches, climate-proof design, rainwater harvesting, storage, efficient distribution, community management (WUAs), monitoring/ mapping, integrated watershed management plans", 5)],
       """Factors affecting water sources: climate change - erratic, intense and shorter monsoon rainfall, longer dry spells and rising temperatures that dry up springs and reduce snow and glacier storage; degradation of forest watersheds through fire, unsustainable harvesting, grazing and land-use change (agriculture, settlements); road construction, urbanisation and mining that cut through slopes and disturb spring aquifers; landslides, flash floods and sediment that damage intakes and pipelines; rising demand and over-extraction for drinking, irrigation and industry; pollution; and weak or fragmented management of sources.
Mitigation measures in the plan: identify, map and protect critical water sources and their recharge areas (declare them watershed or water-source protection areas); restore degraded watersheds by planting native species and controlling fire and grazing; build recharge structures such as contour trenches, percolation pits and ponds; make climate-proof intakes, storage tanks and pipelines; promote rainwater harvesting and efficient water use; follow environmental safeguards and EIA for roads and projects near sources; integrated watershed management with community participation (water user groups) and payment for ecosystem services; and regular monitoring of spring discharge and water quality."""),
    it("Q2. High forest coverage means high evapo-transpiration ratio which ultimately leads to reduction in the ground water. Do you agree with this statement?", 10,
       [("Partly true: dense forests (esp. fast-growing, plantations like eucalyptus/ pines) use more water - interception and transpiration higher than grass/ crops, can reduce total runoff/ yield", 3),
        ("But disagree overall for Bhutan: forests increase infiltration via litter/ roots/ soil porosity, reduce surface runoff and erosion, recharge groundwater and sustain dry-season baseflow (springs); cloud/ fog interception in montane forests; regulate microclimate/ rainfall", 5),
        ("Conclusion: depends on species, age, climate and soil - native, healthy mixed forests are net beneficial; degraded land gives quick runoff, floods and dry springs; manage forests for water", 2)],
       """I only partly agree. It is true that forests use more water than grasslands or crops: their large leaf area intercepts rain (some evaporates before reaching the ground) and their deep roots transpire a lot, so in some studies afforestation - especially with fast-growing exotic species like eucalyptus or dense pine plantations - reduced total annual stream flow.
However, for Bhutan the statement is misleading overall. Natural forests build porous soils with deep litter and root channels, so rainfall infiltrates instead of running off; this recharges groundwater and releases water slowly, sustaining springs and stream baseflow during the dry season - the very springs (67.6% of water sources) that communities depend on. When forests are cleared or degraded, the soil compacts, runoff and erosion increase, floods become flashier and springs dry up in winter. Montane cloud forests also capture fog and cloud water, and forests influence local humidity and rainfall.
So the effect depends on species, age, density, climate and soil: healthy, native mixed forests are net beneficial for water regulation and quality, even if they use some water. The right approach is to manage forests for water - protect natural watershed forests, avoid water-hungry exotic plantations around sources and restore degraded land."""),
    it("Q3. The glaciers and glacier lakes store huge volume of water. Can the communities living downstream entirely depend on these water sources? Which river basin is highly vulnerable to Glacial Lake Outburst Flood?", 15,
       [("No - glaciers are retreating/ shrinking with warming; meltwater increases then declines (peak water), seasonal; most rural settlements are on slopes above rivers and depend on springs/ streams fed by rain and forests, not glaciers", 4),
        ("Rivers are in deep valleys - pumping costly; glacial water is seasonal, turbid/ sediment-laden, and glacier lakes are hazards (GLOF) not reliable supply; need diversified sources (springs, rainwater, storage)", 4),
        ("Most vulnerable basin: Punatsangchhu (Pho chhu/ Mo chhu) - Lunana lakes (Thorthormi, Raphstreng, Luggye); 1994 Luggye GLOF hit Punakha-Wangdue; also Chamkharchhu/ Mangdechhu basins at risk", 4),
        ("GLOF risk reduction: early warning systems, lake lowering (Thorthormi), hazard zoning, avoid settlements in flood plains", 3)],
       """No, downstream communities cannot depend entirely on glaciers and glacial lakes. Bhutan's glaciers are retreating and thinning because of rising temperatures; meltwater may increase for some years but will then decline ("peak water"), and many small glaciers may disappear. Glacier melt is also seasonal - high in summer when monsoon rain is plentiful, and low in winter when water is most needed. Most Bhutanese settlements are on mountain slopes far above the main rivers flowing in deep valleys, so they rely on springs and streams fed by rainfall and forest watersheds; lifting river water to them would need costly pumping. Glacial water is often turbid and sediment-laden, and glacial lakes are a hazard rather than a safe source, because moraine dams can burst. Communities therefore need diversified and protected sources - springs, streams, rainwater harvesting and storage - with protected forest watersheds.
The river basin most vulnerable to Glacial Lake Outburst Floods is the Punatsangchhu basin (Pho Chhu and Mo Chhu), fed by the Lunana glacial lakes such as Thorthormi, Raphstreng and Luggye Tsho; the 1994 Luggye Tsho GLOF caused deaths and damage downstream in Punakha and Wangdue, including to Punakha Dzong. Other basins with potentially dangerous lakes include the Chamkharchhu and Mangdechhu. Risk reduction includes early warning systems (sensors and sirens along the Punatsangchhu), artificial lowering of lakes (Thorthormi), hazard zoning and keeping settlements and infrastructure out of flood paths."""),
    it("Q4. How important are the forest watersheds and their relation to monsoon rain? Name at least five major rivers of Bhutan.", 15,
       [("Importance of forest watersheds: source of most springs/ streams, drinking water, irrigation, hydropower (main revenue), regulate flow, reduce sediment, biodiversity", 4),
        ("Relation to monsoon (June-September, 70-80% of annual rain): forests intercept heavy rain, increase infiltration, store water in soil/ groundwater and release slowly in dry season; reduce floods, landslides, erosion; recycle moisture/ influence local rainfall", 6),
        ("Five major rivers: Amochhu (Torsa), Wangchhu (Raidak), Punatsangchhu (Sankosh), Mangdechhu, Chamkharchhu, Kurichhu, Drangmechhu (Manas), Nyera Amachhu, Jaldhaka", 5)],
       """Forest watersheds are vital for Bhutan: almost all drinking water springs and streams originate in forested catchments; they supply water for drinking, irrigation and industry and feed the rivers that drive hydropower, Bhutan's largest source of revenue; they keep water clean by filtering sediment and pollutants; and they support biodiversity and livelihoods.
Relation to monsoon rain: Bhutan receives most (roughly 70-80%) of its annual rainfall from the south-west monsoon between June and September, often as intense downpours on steep slopes. Forest canopies intercept part of the rain and reduce its impact; the litter layer and root channels let water infiltrate into the soil and recharge groundwater instead of rushing off the surface. This stored water is released slowly through springs and baseflow during the dry winter months, so forests act like a sponge that spreads monsoon water through the year. Forest cover also reduces flash floods, landslides, soil erosion and sedimentation of rivers and hydropower reservoirs, and evapotranspiration from forests recycles moisture and helps sustain local rainfall. Where watersheds are degraded, monsoon rain causes floods and landslides while springs dry up in winter.
Major rivers of Bhutan (any five): Amochhu (Torsa), Wangchhu (Raidak), Punatsangchhu (Sankosh), Mangdechhu, Chamkharchhu, Kurichhu, Drangmechhu (Manas), Nyera Amachhu and Jaldhaka (Dichhu)."""),
])
PATTERN = STANDARD
