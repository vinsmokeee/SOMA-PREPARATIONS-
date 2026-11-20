"""ME Technical Paper III (Subject Specialisation Paper), Horticulture, BCSE 2025 - real paper (PDF sent by the founder).
Standard pattern (the paper says '5 short answers' but has 4 x 5 = 20). Replaced MCQs: 3 (tomato - botanically a fruit,
horticulturally a vegetable) and 26 (fall armyworm fecundity - sources differ). Case I Q1 asks for Bhutan citrus statistics:
the model answer does not state figures; examiners should check students' figures against the latest Bhutan RNR/
agriculture statistics.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Horticulture): BCSE 2025, batch 1"
GROUP_TAG = "hort2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "horticulture"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Horticulture", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Horticulture"

MCQ = r"""[
{
"n": 1,
"stem": "A monoecious plant has:",
"opts": [
"Male flowers and female flowers in separate structures on the same plant.",
"Male and female flowers on different plants.",
"Only imperfect flowers.",
"Only perfect flowers."
]
},
{
"n": 2,
"stem": "What is a perfect flower?",
"opts": [
"A flower which has male reproductive structures.",
"A flower which has female reproductive structures.",
"A flower which has both male and female reproductive structures.",
"A flower which has bright colours."
]
},
{
"n": 3,
"stem": "Tomato is a:",
"opts": [
"Fruit.",
"Vegetable.",
"Root.",
"Tuber."
]
},
{
"n": 4,
"stem": "The International Society for Horticultural Science (ISHS) is headquartered in:",
"opts": [
"Germany.",
"England.",
"Belgium.",
"India."
]
},
{
"n": 5,
"stem": "The edible part of potato is the",
"opts": [
"Root.",
"Tuber.",
"Rhizome.",
"Corm."
]
},
{
"n": 6,
"stem": "A seed achieves its maximum dry weight and has maximum germination potential and vigor during the stage of:",
"opts": [
"Physiological maturity.",
"Edible maturity.",
"Harvest maturity.",
"All of the above."
]
},
{
"n": 7,
"stem": "Ethylene plays a crucial role in which of the following plant processes?",
"opts": [
"Flowering.",
"Root elongation.",
"Fruit ripening.",
"Photosynthesis."
]
},
{
"n": 8,
"stem": "In cacti, photosynthesis primarily occurs in the?",
"opts": [
"Stem.",
"Roots.",
"Leaves.",
"None of the above."
]
},
{
"n": 9,
"stem": "Stratification is a technique by which:",
"opts": [
"Seeds are exposed to high temperature.",
"Seeds are exposed to low temperature.",
"Seeds are exposed to high humidity.",
"Seeds are exposed to low humidity."
]
},
{
"n": 10,
"stem": "Which irrigation system control weeds most effectively?",
"opts": [
"Sprinkler.",
"Furrow.",
"Basin.",
"Drip."
]
},
{
"n": 11,
"stem": "Plastic pipes for the conveyance of irrigation water are mainly made of:",
"opts": [
"LLDPE.",
"LDPE.",
"HDPE.",
"PP."
]
},
{
"n": 12,
"stem": "Which technique is used to rejuvenate old unproductive fruit trees?",
"opts": [
"Top working.",
"Bridge grafting.",
"Top crossing.",
"Approach grafting."
]
},
{
"n": 13,
"stem": "Which of the following is a bulb vegetable?",
"opts": [
"Garlic.",
"Asparagus.",
"Sweet potato.",
"Ginger."
]
},
{
"n": 14,
"stem": "Which of the following fruit is commonly propagated through seed?",
"opts": [
"Litchi.",
"Papaya.",
"Mango.",
"Guava."
]
},
{
"n": 15,
"stem": "How are acid soils reclaimed?",
"opts": [
"By liming.",
"By adding gypsum.",
"Both A and B.",
"By adding rock phosphate."
]
},
{
"n": 16,
"stem": "Expand the acronym “HLB” which is one of the most devastating citrus diseases globally:",
"opts": [
"Huanglongbing.",
"Helicobacter.",
"Highland Bush.",
"High Black."
]
},
{
"n": 17,
"stem": "The Great Irish Famine, also known as the “Great Hunger” affected which of the following crop?",
"opts": [
"Pumpkin.",
"Pear.",
"Ginger.",
"Potato."
]
},
{
"n": 18,
"stem": "Define adjuvants:",
"opts": [
"Adjuvants are pesticides.",
"Adjuvants are fungicides.",
"Adjuvants are a group of insecticides that target some variety of sucking insects.",
"Adjuvants are supplemental substances added to a spray mixture to enhance the performance and/or physical properties of the desired chemical."
]
},
{
"n": 19,
"stem": "The central chemical structure of chlorophyll has:",
"opts": [
"Magnesium.",
"Nitrogen.",
"Carbon.",
"hydrogen."
]
},
{
"n": 20,
"stem": "The edible part of a citrus fruit is the:",
"opts": [
"Endocarp.",
"Exocarp.",
"Pedicel.",
"Rind."
]
},
{
"n": 21,
"stem": "Asparagus is commonly propagated through?",
"opts": [
"Seeds.",
"Crowns.",
"Tubers.",
"Grafts."
]
},
{
"n": 22,
"stem": "The study of mushrooms is called:",
"opts": [
"Mycology.",
"Pomology.",
"Pathology.",
"None of the above."
]
},
{
"n": 23,
"stem": "Example of an aggregate fruit is:",
"opts": [
"Apple.",
"Mango.",
"Strawberry.",
"Mandarin."
]
},
{
"n": 24,
"stem": "Rice is predominantly a:",
"opts": [
"Cross pollinated crop.",
"Self-pollinated crop.",
"Vegetatively propagated crop.",
"None of the above."
]
},
{
"n": 25,
"stem": "Soil pH is important mainly because:",
"opts": [
"It determines water availability.",
"It gives vitamin D.",
"It significantly impacts nutrient availability to plants and microbial activity in the soil.",
"It prevents soil erosion."
]
},
{
"n": 26,
"stem": "The Fall Armyworm (FAW) is a polyphagous pest mainly affecting maize crop in Bhutan, the average fecundity of one FAW female is about:",
"opts": [
"250 eggs.",
"3000 eggs.",
"1000 eggs.",
"50 eggs."
]
},
{
"n": 27,
"stem": "Apple scab is caused by?",
"opts": [
"Venturia inaequalis.",
"Eriosoma lanigerum.",
"Puccinia spp.",
"All of the above."
]
},
{
"n": 28,
"stem": "Orthodox seeds:",
"opts": [
"Are traditional seeds.",
"Have the ability to endure extreme freezing and drying conditions during ex situ conservation.",
"Have the ability to endure extreme heat and moist conditions during ex situ conservation.",
"Have short life."
]
},
{
"n": 29,
"stem": "Topiary is:",
"opts": [
"The art of making bonsai.",
"Dormancy in temperate plants.",
"The horticultural practice of training perennial plants, typically evergreen shrubs and trees, into decorative shapes by clipping their foliage.",
"The practice of removing seed cover for better germination."
]
},
{
"n": 30,
"stem": "Example of macronutrient in plants:",
"opts": [
"Nitrogen.",
"Phosphorus.",
"Potassium.",
"All of the above."
]
}
]"""

KEY = {
    1: ("a", "Monoecious: separate male and female flowers on the same plant (e.g. cucurbits, maize)."), 2: ("c", "A perfect (bisexual) flower has both stamens and pistil."),
    4: ("c", "ISHS is headquartered in Leuven, Belgium."), 5: ("b", "The potato's edible part is a stem tuber."),
    6: ("a", "Seeds reach maximum dry weight, germination and vigour at physiological maturity."), 7: ("c", "Ethylene is the ripening hormone."),
    8: ("a", "In cacti, leaves are reduced to spines and the green stem photosynthesises."), 9: ("b", "Stratification exposes moist seeds to low temperature to break dormancy."),
    10: ("d", "Drip irrigation wets only the root zone, so fewer weeds grow."), 11: ("c", "Irrigation pipes are mainly HDPE (high-density polyethylene)."),
    12: ("a", "Top working rejuvenates old trees by grafting new scions on cut-back branches."), 13: ("a", "Garlic is a bulb crop."),
    14: ("b", "Papaya is commonly raised from seed."), 15: ("a", "Acid soils are reclaimed by liming; gypsum is used for sodic (alkali) soils."),
    16: ("a", "HLB = Huanglongbing (citrus greening)."), 17: ("d", "The Irish famine was caused by potato late blight."),
    18: ("d", "Adjuvants are added to sprays to improve the performance of the active chemical."), 19: ("a", "Chlorophyll has a magnesium atom at its centre."),
    20: ("a", "The juicy endocarp (segments with juice vesicles) is eaten."), 21: ("b", "Asparagus is usually propagated by crowns."),
    22: ("a", "Mycology is the study of fungi, including mushrooms."), 23: ("c", "Strawberry is an aggregate fruit."),
    24: ("b", "Rice is predominantly self-pollinated."), 25: ("c", "Soil pH governs nutrient availability and microbial activity."),
    27: ("a", "Apple scab is caused by the fungus Venturia inaequalis."), 28: ("b", "Orthodox seeds tolerate drying and freezing for long-term storage."),
    29: ("c", "Topiary is clipping shrubs and trees into decorative shapes."), 30: ("d", "N, P and K are all macronutrients."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "Botanically, a tomato is classified as a", ["Berry (fruit)", "Tuber", "Bulb", "Corm"], "a",
            "Botanically the tomato is a fleshy berry (a fruit), although it is grown and used as a vegetable."),
    new_mcq(2, T, "The fall armyworm (Spodoptera frugiperda), a serious pest of maize in Bhutan, causes most damage at which life stage?", ["Egg", "Larva (caterpillar)", "Pupa", "Adult moth"], "b",
            "The caterpillars (larvae) feed on leaves, whorls and cobs; the moths themselves do not damage the crop."),
    saq(1, T, "What is integrated pest management (IPM) in crops? List four management approaches commonly used in IPM.",
        [("Definition: ecosystem-based combination of methods keeping pests below economic threshold with minimal pesticide/risk, based on monitoring", 2), ("Four approaches: cultural, mechanical/physical, biological, chemical (judicious), plus host resistance, legal/quarantine", 3)],
        """IPM is an ecosystem-based approach that combines several compatible pest control methods to keep pest populations below the economic threshold level, with the least risk to people, crops and the environment. It relies on regular monitoring and uses chemical pesticides only when needed and in the safest way.
Approaches: 1. Cultural - crop rotation, resistant varieties, clean seed, proper spacing, timely sowing, field sanitation. 2. Mechanical/physical - hand picking, traps (pheromone, light, sticky), barriers, nets. 3. Biological - natural enemies such as predators, parasitoids (Trichogramma), and biopesticides (Bt, Trichoderma, NPV). 4. Chemical - selective, recommended pesticides at the right dose and time, respecting pre-harvest intervals. (Also legal/quarantine measures and host plant resistance.)"""),
    saq(2, T, "What is plant introduction? What are the two main types of plant introduction? Write briefly about each.",
        [("Definition: bringing plants/genotypes from their original area into a new area, for direct use or breeding", 2), ("Primary introduction: used directly as variety after testing/acclimatisation", 1.5), ("Secondary introduction: used as parent in breeding/selection to develop new varieties", 1.5)],
        """Plant introduction is the process of bringing plants or genotypes (seeds, cuttings, varieties) from one region or country, where they grow naturally or are cultivated, into a new area where they were not grown before - for direct cultivation or as material for breeding. It follows quarantine rules to avoid introducing pests.
1. Primary introduction - the introduced variety is well suited to the new environment and is released directly for cultivation after evaluation and acclimatisation, without change (e.g. a high-yielding apple or potato variety introduced and released).
2. Secondary introduction - the introduced material is not used directly but is used in selection or hybridisation with local varieties to develop new improved varieties (as a source of genes such as disease resistance)."""),
    saq(3, T, "What is plant propagation? What are the two primary forms of plant propagation? State one advantage and one disadvantage of each.",
        [("Definition: multiplying plants to produce new individuals", 1), ("Sexual (seed) with one advantage and one disadvantage", 2), ("Asexual/vegetative (cuttings, grafting, layering, tissue culture) with one advantage and one disadvantage", 2)],
        """Plant propagation is the multiplication of plants to produce new individuals for cultivation.
1. Sexual propagation (by seed): advantage - easy, cheap, produces many plants and vigorous, long-lived root systems (also genetic variation for breeding); disadvantage - offspring are not true to type in cross-pollinated crops, and plants take longer to bear fruit.
2. Asexual (vegetative) propagation - cuttings, layering, grafting, budding, division, tissue culture: advantage - plants are true to type (identical to the parent) and bear earlier; disadvantage - more skill and cost needed, and diseases (especially viruses) can be passed on; no new variation."""),
    saq(4, T, "What is the seed replacement rate (SRR)? List four benefits of SRR.",
        [("Definition: percentage of area sown with certified/quality seed instead of farm-saved seed in a season", 2), ("Four benefits: higher yield, better quality/uniformity, disease-free/pest resistance, adoption of new varieties, higher income, maintains genetic purity", 3)],
        """Seed replacement rate (SRR) is the percentage of a crop's total area that is sown with certified or quality seed (rather than farm-saved seed) in a season. SRR = area sown with certified/quality seed / total area under the crop x 100.
Benefits of a high SRR: 1. Higher yields and productivity (quality seed alone can raise yields substantially). 2. Better crop uniformity and produce quality. 3. Healthier crops - certified seed is free from seed-borne diseases, weeds and pests. 4. Faster adoption of new improved varieties (higher yield, climate resilience). 5. Maintains genetic purity, and raises farm income and food security."""),
]
C1 = """Case I: Citrus and HLB in Bhutan
Citrus is one of the most widely grown fruit plants in Bhutan, along with a variety of other horticultural crops. The most common and widely grown citrus type in Bhutan is the local mandarin (Citrus reticulata).
HLB/citrus greening is one of the most devastating citrus diseases globally. There is no known cure; it probably entered Bhutan in the 1960s and has become the most serious threat to citrus cultivation and production in Bhutan."""
C2 = """Case II: Pesticide residues in chilli
Chilli is a very important crop in Bhutan and a significant part of Bhutanese cuisine and culture. It is consumed as a vegetable and not a spice. Many varieties of chilli are grown on a good acreage in the country, but significant quantities are also imported each year.
In recent years, there have been import bans on chilli due to the presence of residues beyond the maximum residue limit (MRL). Such bans have economic effects: imported chillies are generally cheaper and more affordable, but pesticide residues exceeding the MRLs are a health and safety concern."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("hort2025", 1, T, C1, issues=["Q1 asks for Bhutan citrus statistics; check figures against the latest official RNR/agriculture statistics when evaluating."], items=[
    it("1. Do you think citrus (especially mandarin) is an important cash crop for Bhutanese farmers? Explain why. Data on estimated domestic acreage, production areas, annual production and export value, and any supporting evidence, are desirable.", 15,
       [("Clear position: yes, major cash crop, among top horticultural exports", 3), ("Production areas: southern and eastern foothills/ subtropical dzongkhags (e.g. Tsirang, Dagana, Sarpang, Samtse, Samdrup Jongkhar, Pemagatshel, Zhemgang, Mongar, Punakha, Wangdue)", 3), ("Data from official statistics: acreage/trees, production (tonnes), export volumes and value, main markets (Bangladesh, India)", 5), ("Supporting points: income for rural households, low input, winter harvest, employment, foreign exchange; challenges (HLB, decline, ageing orchards)", 4)],
       "Yes. Mandarin is one of Bhutan's most important cash crops and one of its leading agricultural exports. It is grown mainly in the warm subtropical belt of the south and east and in mid-valley areas - e.g. Tsirang, Dagana, Sarpang, Samtse, Samdrup Jongkhar, Pemagatshel, Zhemgang, Mongar and parts of Punakha and Wangdue. Students should quote the latest official figures (Agriculture/RNR statistics) on the number of bearing trees or area, annual production in tonnes and export volume and value; most of the crop is exported to Bangladesh and India through auction yards and exporters, earning foreign exchange. Importance: a major source of cash income for thousands of rural households, with low input requirements; harvested in winter when other income is scarce; creates jobs in transport, grading and export; and supports rural livelihoods and food security. However, production has fluctuated or declined in many areas due to HLB, fruit drop, pests, ageing orchards and poor management, which is why disease management and orchard rejuvenation are national priorities."),
    it("2. What are the typical symptoms produced by HLB? HLB symptoms are often confused with other diseases or conditions; list any five such conditions.", 10,
       [("Symptoms: blotchy mottle (asymmetric yellowing) of leaves, yellow shoots, small upright leaves, vein corking, twig dieback, small lopsided bitter fruits with poor colour (green at stylar end), aborted seeds, fruit drop, root decline", 5), ("Five look-alikes: zinc/iron/manganese/nitrogen/magnesium deficiencies, citrus tristeza virus, phytophthora root rot/gummosis, water logging/root damage, citrus stubborn, natural senescence", 5)],
       "Symptoms: asymmetric 'blotchy mottle' yellowing of leaves (not symmetrical about the midrib); yellow shoots (huanglongbing = 'yellow dragon disease'); small, thick, upright leaves, sometimes with corky veins; sparse foliage, twig dieback and general decline; off-season flowering; small, lopsided fruits that stay green at the stylar end (colour inversion), taste bitter/sour and have aborted seeds; heavy fruit drop; root decay and eventual death of the tree. Conditions often confused with HLB: zinc deficiency; iron or manganese deficiency; magnesium or nitrogen deficiency; citrus tristeza virus; Phytophthora root rot/foot rot (gummosis); waterlogging or root damage; citrus stubborn disease; girdling or trunk injury."),
    it("3. Write briefly on the HLB disease biology.", 5,
       [("Causal agent: phloem-limited, gram-negative bacterium Candidatus Liberibacter asiaticus (Asian form); not cultured", 2), ("Spread by Asian citrus psyllid Diaphorina citri and infected budwood/planting material; long latent period; uneven distribution in tree; no cure", 3)],
       "HLB is caused by a phloem-limited, gram-negative bacterium, 'Candidatus Liberibacter asiaticus' (the Asian form found in Bhutan; African and American forms also exist), which has not been cultured on artificial media. It lives in the sieve tubes, blocking nutrient transport. It is spread by the Asian citrus psyllid (Diaphorina citri), which picks it up while feeding on infected trees and transmits it to healthy ones, and by grafting infected budwood or using infected nursery plants. Infected trees may stay symptomless for months to years (latent period) and the bacterium is unevenly distributed in the tree, so diagnosis needs PCR; there is no cure."),
    it("4. Write in detail on management practices for HLB disease.", 20,
       [("Healthy planting material: certified disease-free saplings from protected (insect-proof) nurseries, budwood from indexed mother plants, quarantine/movement control", 5), ("Vector control: psyllid monitoring, insecticides at flushing, biological control (Tamarixia radiata), kaolin, removal of alternate hosts (Murraya)", 5), ("Removal of infected trees (rogueing) after PCR confirmation, replanting, area-wide/community approach", 4), ("Orchard management: nutrition (foliar micronutrients), irrigation, pruning, sanitation; monitoring/surveys, farmer training, research (tolerant rootstocks), policy/regulation", 6)],
       "1. Exclusion and clean planting material - plant only certified HLB-free saplings from insect-proof screen-house nurseries; take budwood from PCR-indexed mother plants; restrict movement of citrus plants and budwood from infected areas (domestic quarantine). 2. Vector (psyllid) management - monitor psyllids with yellow sticky traps and flush inspection; spray recommended insecticides (e.g. systemic insecticides or mineral oils) during new flush periods; conserve and release natural enemies such as Tamarixia radiata and lady beetles; remove alternate hosts like orange jasmine (Murraya paniculata) near orchards. 3. Rogueing - survey orchards, confirm suspected trees by PCR and promptly uproot infected trees to remove the source of inoculum, then replant with healthy plants. 4. Area-wide (community) management - coordinated action by all growers in a locality, because psyllids move between orchards. 5. Good orchard management - balanced fertilisation including foliar zinc, manganese and iron, irrigation, pruning, weed control and sanitation to keep trees vigorous and productive for longer. 6. Monitoring, surveillance and diagnosis by NPPC/ARDC laboratories. 7. Farmer training and awareness on symptoms and vector control. 8. Research and policy - tolerant rootstocks/varieties, new orchard establishment in suitable areas, support schemes and enforcement of nursery certification."),
])
Q += case("hort2025", 2, T, C2, items=[
    it("1. What is an MRL? Why are MRLs important? What factors determine the setting of MRLs? How would you advise Bhutanese farmers so that the fruits and vegetables they grow meet MRL standards?", 15,
       [("Definition: maximum legally tolerated concentration of pesticide residue in/on food (mg/kg) when applied per GAP", 3), ("Importance: consumer health protection, trade/export standards, checks GAP compliance", 3), ("Factors: supervised field trials under GAP, toxicology (ADI, ARfD), dietary intake, analytical methods, Codex", 4), ("Advice: IPM, only registered pesticides at recommended dose, observe pre-harvest interval, proper equipment, records, training, organic/biopesticides, GAP certification (BhutanGAP)", 5)],
       "A maximum residue limit (MRL) is the highest concentration of a pesticide residue (mg/kg) legally permitted in or on a food or feed when the pesticide is used correctly according to good agricultural practice (GAP). Importance: protects consumers' health; provides standards for food safety testing and enforcement; is required for trade, since importing countries reject produce over the MRL; and shows whether farmers use pesticides correctly. Factors in setting MRLs: residue data from supervised field trials at the approved dose, number of sprays and pre-harvest interval; toxicology - acceptable daily intake (ADI) and acute reference dose (ARfD); dietary consumption patterns (how much of the crop people eat - e.g. Bhutanese eat large amounts of chilli); the lowest level that can be measured; and international Codex standards. Advice to farmers: follow IPM and use pesticides only when needed; use only registered pesticides recommended for the crop, at the correct dose; strictly observe pre-harvest intervals; calibrate and maintain sprayers; avoid spraying just before harvest or mixing unknown chemicals; keep spray records; use biopesticides, organic practices and resistant varieties; wash produce; join training and certification schemes such as Bhutan GAP."),
    it("2. What is your opinion on such import bans? Write the pros and cons of this management strategy.", 10,
       [("Opinion with justification (balanced)", 2), ("Pros: protects public health, enforces standards, signals exporters, encourages domestic production and food self-sufficiency", 4), ("Cons: price rise and shortages, hardship for consumers/ low-income, smuggling and informal trade, trade relations/ WTO-SPS concerns, short-term not addressing root causes", 4)],
       "Opinion: temporary bans are justified when residues are dangerous, but they should be science-based, proportionate and combined with long-term measures such as testing and certification. Pros: protects public health from harmful residues; enforces food safety standards and the Pesticide and Food Acts; pressures exporters and suppliers to comply; creates opportunities and better prices for domestic chilli growers and encourages self-sufficiency. Cons: chilli prices rise sharply and supplies become scarce, especially in winter, hurting low-income consumers; illegal and informal imports (smuggling) may increase, bringing untested produce; strains trade relations and may be questioned under WTO SPS rules if not risk-based; affects traders and vendors' livelihoods; and does not solve the root problem if domestic production cannot meet demand or local produce is also untested."),
    it("3. You work in the Department of Agriculture and, with frequent incidences of consignments of fruits and vegetables exceeding MRLs, you have been asked to develop a strategy to deal with this issue, with policy recommendations. Write in the context of protecting public health, market stability and promoting sustainable production, regional cooperation with neighbouring countries, and any other factors you feel must be considered.", 25,
       [("Public health: risk-based border and market testing (BFDA lab capacity, rapid tests, accredited labs), traceability, recall, awareness", 5), ("Market stability: graded measures (consignment rejection, enhanced testing, approved suppliers) instead of blanket bans; buffer stocks, storage, price monitoring", 5), ("Sustainable domestic production: increase chilli production (protected cultivation, winter production, irrigation), IPM, organic/GAP certification, farmer training, residue monitoring", 6), ("Regional cooperation: harmonised MRLs/Codex, mutual recognition, pre-shipment certification, info sharing with India, SAARC/BIMSTEC", 5), ("Other: legislation and enforcement, pesticide regulation (registration, banned list, sale control), coordination (BAFRA/BFDA, NPPC, DoA, MoICE), research, monitoring and evaluation", 4)],
       """Strategy and recommendations:
1. Protect public health: strengthen risk-based residue monitoring at entry points and markets by the Bhutan Food and Drug Authority (rapid screening kits at borders, accredited laboratory confirmation); require pesticide residue test certificates; build a traceability system for importers and suppliers; reject or destroy non-compliant consignments and run consumer awareness on washing and safe food.
2. Market stability: use graded, targeted measures - reject individual consignments, impose enhanced testing on repeat offenders, and register approved importers/suppliers - instead of sudden blanket bans; announce measures in advance; monitor prices; build cold storage and drying capacity; and plan supply during lean seasons.
3. Sustainable domestic production: raise self-sufficiency in chilli and vegetables through winter and off-season production (protected cultivation, polyhouses), irrigation, quality seed and market linkages; promote IPM, biopesticides and organic farming; Bhutan GAP certification; train farmers on safe pesticide use and pre-harvest intervals; and monitor residues in local produce too.
4. Regional cooperation: work with Indian authorities (FSSAI, state agriculture departments) for harmonised MRLs based on Codex, pre-export testing and certification, mutual recognition of laboratories and rapid alert/information sharing; use SAARC and BIMSTEC platforms for capacity building and regional standards.
5. Policy, regulation and institutions: update regulations on pesticide registration, banned chemicals and licensing of pesticide dealers; enforce penalties; set up a national residue monitoring programme; coordinate DoA, NPPC, BFDA, the trade ministry and dzongkhags; invest in laboratory capacity and skilled staff; fund research on residues and alternatives; and review the policy regularly with monitoring and evaluation."""),
])
PATTERN = STANDARD
