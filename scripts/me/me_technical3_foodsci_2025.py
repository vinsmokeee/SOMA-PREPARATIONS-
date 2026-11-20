"""ME Technical Paper III (Subject Specialisation Paper), Food Science, BCSE 2025 - real paper (PDF sent by the founder).
Pattern (own): Section A Part I 30 MCQ, Part II 5 short answers x 4 (20); Section B one of two case studies (50).
150 min + 15 min reading. Left out: MCQ 11 (two options defensible), 17 (wording unclear); two new MCQs keep Part I at 30.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Food Science): BCSE 2025, batch 1"
GROUP_TAG = "foodsci2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "food-science"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Food Science"

MCQ = r"""[
{
"n": 1,
"stem": "Aseptic packaging can be defined as",
"opts": [
"The filling of a commercial sterile product into a sterile containers under aseptic conditions and hermetically sealing of the containers",
"The filling of commercial sterile product into containers under aseptic conditions and hermetically sealing of the containers",
"The filling of a commercial sterile product into sterile containers under aseptic conditions and sealing of the containers",
"The filling of commercial sterile product into sterile containers and hermetically sealing of the containers"
]
},
{
"n": 2,
"stem": "Monosodium glutamide is used as",
"opts": [
"Artificial sweetener",
"Flavour enhancer",
"Anticaking agent",
"Cleaning agent"
]
},
{
"n": 3,
"stem": "Quick bread is",
"opts": [
"A bread leavened with air, steam, and/ or CO2 from baking soda or baking powder",
"A cereal product made from rye flour and mimic wheat flour bread",
"A bread which is prepared very quickly- ready to eat bread",
"A bread which is easily digested"
]
},
{
"n": 4,
"stem": "Water content of apple and __________________ are similar",
"opts": [
"Wheat",
"Maize",
"Milk",
"Cucumber"
]
},
{
"n": 5,
"stem": "Sauerkraut is the __________________",
"opts": [
"Fermented radish.",
"Fermented cabbage.",
"Fermented carrot.",
"All of the above."
]
},
{
"n": 6,
"stem": "Which of the following statement is/are correct?",
"opts": [
"Class I preservatives are those which are prepared under hygienic conditions",
"Class I preservatives are those which are used for preservation of foods served in five-star hotels",
"Class I preservatives are those which are used prior to other ingredients",
"Class I preservatives are those which have no limit quantity to be added"
]
},
{
"n": 7,
"stem": "Psychrophiles would be expected to grow",
"opts": [
"In hot springs",
"On the human body",
"At refrigeration temperature",
"At low pH"
]
},
{
"n": 8,
"stem": "Bread mold is",
"opts": [
"Rhizopus stolonifer",
"Penicillium notatum",
"Aspergillus niger",
"Monilla sitophilla"
]
},
{
"n": 9,
"stem": "_________________ are most common causes of spoilage of fruits and vegetables",
"opts": [
"Yeasts",
"Molds",
"Viruses",
"Bacteria"
]
},
{
"n": 10,
"stem": "Egg quality is manually checked by seeing it through a lamp, it is called",
"opts": [
"Lightening",
"Candling",
"Lamping",
"Viewing"
]
},
{
"n": 11,
"stem": "The milk is generally pasteurized at 62.8°C for 30 minutes to eliminate",
"opts": [
"Mycobacterium tuberculosis",
"Listeria monocytogens",
"Coxiella burnetti",
"All of above"
]
},
{
"n": 12,
"stem": "Preservation of foods in sealed containers and which usually implies heat treatment as the principal factor in prevention of spoilage is called",
"opts": [
"Cold sterilization",
"Aseptic packaging",
"Simmering",
"Canning"
]
},
{
"n": 13,
"stem": "The separation of solids from suspension in liquid by gravity alone is called as",
"opts": [
"Flocculation",
"Sedimentation",
"Centrifugation",
"None of the above"
]
},
{
"n": 14,
"stem": "In crystallization",
"opts": [
"Mass transfer occurs from solid to liquid phase",
"Mass transfer occurs from solid to solid phase",
"Mass transfer occurs from liquid to liquid phase",
"Mass transfer occurs from liquid to solid phase"
]
},
{
"n": 15,
"stem": "Which dryer is commonly used for wet filter cakes and wet lumpy solids",
"opts": [
"Spray dryer",
"Roller dryer",
"Tray dryer",
"Drum dryer"
]
},
{
"n": 16,
"stem": "In case of oil in water emulsion, oil acts as",
"opts": [
"Dispersed phase",
"Emulsifier",
"Stabilizer",
"Dispersing medium"
]
},
{
"n": 17,
"stem": "We can call a steam generator, a boiler",
"opts": [
"When it is done only in open pan",
"When it is only under high pressure",
"When is done only under reduced pressure",
"Under any circumstances, only criteria is that it must generate steam"
]
},
{
"n": 18,
"stem": "A good refrigerant should have",
"opts": [
"High specific volume",
"Low conductivity",
"Low boiling point",
"High coefficient of performance"
]
},
{
"n": 19,
"stem": "Hurdle technology consists of",
"opts": [
"Mixture of different ingredients to form a uniform quality product",
"Mixture of different preservation technique",
"Using irradiation for increasing shelf life of meat",
"None of above"
]
},
{
"n": 20,
"stem": "Sterilization of high acid food is generally done in",
"opts": [
"Boiling water",
"Supercooled water",
"Superheated steam",
"Retort"
]
},
{
"n": 21,
"stem": "Phosphatase test is for the detection of",
"opts": [
"Adequacy of sterilization",
"Adequacy of pasteurization",
"Adequacy of churning",
"Degree of adulteration of milk by calcium phosphate"
]
},
{
"n": 22,
"stem": "Which of the following statement is correct on rigor mortis",
"opts": [
"There is no effect of rigor mortis on the texture of meat",
"The greater the degree of rigor mortis, the softer the meat",
"The lesser the degree of rigor mortis, the tougher the meat",
"The greater degree of rigor mortis, the tougher the meat"
]
},
{
"n": 23,
"stem": "Saffron is obtained from",
"opts": [
"Seed",
"Root",
"Fruit",
"Flower"
]
},
{
"n": 24,
"stem": "In food packaging, lamination is",
"opts": [
"The method of wrapping the food article with certain packaging material and sorting them at ambient temperature",
"Combination of two or more materials into a single homogeneous packaging web by means of adhesive, solvent or heat",
"A type of packaging where the material used for packaging is made from substance obtained from the middle of lamella of cell wall",
"Coating of zinc on the surface of iron to prevent it from rusting"
]
},
{
"n": 25,
"stem": "Which of these is NOT considered a food quality attribute?",
"opts": [
"Appearance (Size, shape, Colour)",
"Texture",
"Nutritional content",
"Packaging design"
]
},
{
"n": 26,
"stem": "HACCP defined as codex:",
"opts": [
"Identifies and evaluates hazards",
"Identifies and controls hazards",
"Identifies, evaluates and controls hazards",
"Identifies and controls hazards after verification"
]
},
{
"n": 27,
"stem": "Safety precaution and environment safety guideline is given under?",
"opts": [
"ISO 9001",
"ISO 14001",
"ISO 18000",
"ISO 23000"
]
},
{
"n": 28,
"stem": "The Codex Alimentarius covers food standards for",
"opts": [
"Only raw foods",
"Only processed foods",
"Processed, semi-processed, and raw foods",
"Only foods that are traded internationally"
]
},
{
"n": 29,
"stem": "____________ are code of good practices that comprises the fundamental principles, procedures, and means needed for safe food production",
"opts": [
"GMP",
"PRP",
"HACCP",
"None of these"
]
},
{
"n": 30,
"stem": "Basic objective of Consumer Act is",
"opts": [
"To provide the consumers their right to choose their products of their choice",
"To provide the consumers their right to file a complaint against any trader who is charging them more than the price displayed on the package of goods",
"To provide the consumers their right to buy the goods anywhere in Bhutan",
"All of the above"
]
}
]"""

KEY = {
    1: ("a", "Aseptic packaging: commercially sterile product filled into sterile containers aseptically and hermetically sealed."), 2: ("b", "MSG is a flavour enhancer."),
    3: ("a", "Quick breads are leavened by air, steam or CO₂ from baking soda/powder, not yeast."), 4: ("c", "Apple (~85%) and milk (~87%) have similar water content."),
    5: ("b", "Sauerkraut is fermented cabbage."), 6: ("d", "Class I (natural) preservatives such as salt and sugar have no quantity limit."),
    7: ("c", "Psychrophiles grow at refrigeration temperatures."), 8: ("a", "Black bread mould: Rhizopus stolonifer."), 9: ("b", "Moulds are the commonest spoilers of fruits and vegetables."),
    10: ("b", "Candling."), 12: ("d", "Canning: sealed containers with heat treatment."), 13: ("b", "Settling by gravity is sedimentation."),
    14: ("d", "Crystallisation transfers mass from liquid to solid."), 15: ("c", "Tray dryers suit wet filter cakes and lumpy solids."), 16: ("a", "Oil is the dispersed phase in an oil-in-water emulsion."),
    18: ("d", "A good refrigerant has a high coefficient of performance."), 19: ("b", "Hurdle technology combines preservation factors."),
    20: ("a", "High-acid foods (pH < 4.6) are processed in boiling water."), 21: ("b", "Phosphatase test checks pasteurisation."),
    22: ("d", "Greater rigor (cold shortening) gives tougher meat."), 23: ("d", "Saffron is the stigma of the crocus flower."),
    24: ("b", "Lamination combines materials into one web by adhesive, solvent or heat."), 25: ("d", "Packaging design is not a food quality attribute."),
    26: ("c", "Codex: HACCP identifies, evaluates and controls significant hazards."), 27: ("b", "ISO 14001 is the environmental management standard."),
    28: ("c", "Codex covers raw, semi-processed and processed foods."), 29: ("a", "GMP: good practices with the principles, procedures and means for safe food production."),
    30: ("d", "The Consumer Protection Act protects all these rights."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "Botulism is caused by the toxin of", ["Salmonella typhi", "Clostridium botulinum", "Staphylococcus aureus", "Bacillus cereus"], "b", "Clostridium botulinum, a concern in low-acid canned foods."),
    new_mcq(2, T, "Most spoilage bacteria cannot grow below a water activity (aw) of about", ["0.99", "0.91", "0.70", "0.30"], "b", "Most bacteria need aw above about 0.91; moulds grow down to about 0.80."),
]
SA = [
    ("Define enzymatic browning reactions in fruits and vegetables. What are the ways to prevent enzymatic browning in fruits and vegetables? (2+2 = 4 marks)",
     [("Definition: polyphenol oxidase oxidises phenols to quinones that polymerise to brown melanins when tissue is cut/bruised and exposed to oxygen", 2), ("Prevention: blanching, acidulants (citric/ascorbic acid), sulphites, salt/sugar solutions, excluding oxygen, cold storage", 2)],
     "Enzymatic browning is the browning of cut or bruised fruits and vegetables (apple, potato, banana) when the enzyme polyphenol oxidase, in the presence of oxygen, oxidises phenolic compounds to quinones, which polymerise into brown melanin pigments. Prevention: heat inactivation by blanching; lowering pH with citric or ascorbic acid (ascorbic acid also reduces quinones); sulphites; dipping in salt or sugar solution; excluding oxygen (water immersion, vacuum or modified-atmosphere packaging); and refrigeration."),
    ("Define amylose and amylopectin. What is the difference between amylose and amylopectin? (2+2 = 4 marks)",
     [("Amylose: linear α-1,4 glucose polymer; amylopectin: branched α-1,4 with α-1,6 branches", 2), ("Differences: structure, proportion (20-30% vs 70-80%), iodine colour (blue vs red-purple), retrogradation/gel vs viscosity, solubility", 2)],
     "Amylose is the linear fraction of starch - glucose units joined by α-1,4 glycosidic bonds; amylopectin is the branched fraction - α-1,4 chains with α-1,6 branch points every 20-30 units. Differences: amylose is linear, about 20-30% of starch, gives a deep blue colour with iodine, forms firm gels and retrogrades easily (staling); amylopectin is branched, about 70-80%, gives red-purple with iodine, gives viscous, sticky pastes and retrogrades less (waxy rice is almost all amylopectin)."),
    ("Explain the effect of temperature on the rate of an enzyme-catalysed reaction with a graphical representation. (2+2 = 4 marks)",
     [("Rate rises with temperature up to an optimum (more collisions)", 2), ("Above optimum the enzyme denatures and rate falls sharply; bell-shaped graph with optimum (≈ 35-40 °C for many)", 2)],
     "As temperature rises, molecules move faster and collide more often, so the reaction rate increases (roughly doubling per 10 °C) up to an optimum temperature (about 35-40 °C for many enzymes). Above the optimum, the enzyme's three-dimensional structure and active site are denatured, so the rate falls sharply until activity stops. At low temperatures enzymes are inactive but not destroyed. Graph: rate (y-axis) vs temperature (x-axis) - a curve rising gradually to a peak at the optimum, then dropping steeply (bell shape, skewed to the right)."),
    ("Define jelly and marmalade. List the differences between these two products. (2+2 = 4 marks)",
     [("Jelly: clear, set product from strained fruit juice, sugar, pectin and acid", 1), ("Marmalade: citrus jelly with suspended shreds of peel", 1), ("Differences: raw material (any fruit juice vs citrus), clarity, peel shreds present, bitterness/texture", 2)],
     "Jelly is a clear, sparkling, semi-solid product made by boiling strained fruit juice with sugar, pectin and acid until it sets, firm enough to hold its shape. Marmalade is a fruit jelly (usually citrus such as orange) in which slices or shreds of peel are suspended. Differences: jelly uses only clear juice and contains no fruit pieces, while marmalade contains peel shreds; jelly can be made from any pectin-rich fruit, marmalade mainly from citrus; marmalade has a slightly bitter flavour and less transparent appearance."),
    ("What are the four core principles of canning? (4 marks)",
     [("Destroy microorganisms by heat (sterilisation/commercial sterility)", 1), ("Inactivate enzymes", 1), ("Hermetic sealing to prevent recontamination", 1), ("Exclusion of air/vacuum and proper cooling and storage", 1)],
     "1. Heat processing to destroy spoilage and pathogenic micro-organisms (commercial sterility; low-acid foods in a retort at 121 °C to kill Clostridium botulinum spores). 2. Inactivation of enzymes that would cause quality changes. 3. Hermetic sealing of the container to prevent recontamination. 4. Exhausting air to create a vacuum (preventing oxidation and can corrosion), followed by rapid cooling and proper storage."),
]
for i, (s, kp, m) in enumerate(SA):
    Q.append(saq(i + 1, T, s, kp, m, marks=4))
C1 = "CASE I (food science and technology)"
C2 = "CASE II (cereals, pulses and baking)"
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("foodsci2025", 1, T, C1, items=[
    it("1. Write the differences between the following from the perspective of food science and technology: (i) thermoplastics and thermosets in the food industry; (ii) climacteric and non-climacteric fruits; (iii) Maillard reaction and caramelisation; (iv) lye peeling and brining; (v) drying and dehydration. (5 × 3 = 15 marks)", 15,
       [("(i) Thermoplastics soften on heating and can be reshaped/recycled (PE, PP, PET) vs thermosets set permanently (melamine, epoxy can linings)", 3), ("(ii) Climacteric: respiration and ethylene burst, ripen after harvest (mango, banana, apple) vs non-climacteric: ripen only on plant (citrus, grape, pineapple)", 3),
        ("(iii) Maillard: reducing sugar + amino acid, lower temp, flavour/colour (bread crust) vs caramelisation: sugar alone at high temp", 3), ("(iv) Lye peeling: hot NaOH solution loosens skin of fruits/vegetables vs brining: soaking in salt solution for preservation/flavour/fermentation", 3), ("(v) Drying: removal of moisture, often natural/sun drying to safe level vs dehydration: controlled artificial drying to very low moisture", 3)],
       """(i) Thermoplastics (polyethylene, polypropylene, PET) soften when heated and can be re-moulded and recycled - used for films, bottles and trays; thermosets (melamine, phenolic and epoxy resins) cure into a permanent rigid network that does not melt - used for heat-resistant tableware and can lacquers.
(ii) Climacteric fruits (mango, banana, apple, tomato, papaya) show a rise in respiration and ethylene at ripening and can ripen after harvest; non-climacteric fruits (citrus, grape, pineapple, strawberry) do not and must be harvested ripe.
(iii) Maillard reaction is non-enzymatic browning between reducing sugars and amino acids at moderate temperatures, giving flavour and colour (bread crust, roasted coffee); caramelisation is browning of sugars alone at high temperatures (above about 160 °C) without amino acids.
(iv) Lye peeling uses hot sodium hydroxide solution to loosen and remove skins of fruits and vegetables (peaches, tomatoes, potatoes) before washing; brining is immersing foods in salt solution to preserve, flavour or ferment them (pickles, olives, cheese).
(v) Drying usually means removing water under natural conditions (sun drying) to a safe moisture level; dehydration is controlled drying with artificial heat and air flow in dryers to a very low moisture content with better quality."""),
    it("2. What is fruit jam? What are the common problems during jam processing? Mention the name of the test to ensure the quality of the finished jam. (2+4+4 = 10 marks)", 10,
       [("Jam: fruit pulp/pieces boiled with sugar, pectin, acid to ≥ 68% TSS, set consistency", 2), ("Problems: crystallisation (sugar/ inversion), stickiness, premature/poor setting, syneresis (weeping), mould growth, colour change", 4), ("Tests: sheet/flake test, drop test, temperature test (105-106 °C), refractometer TSS ≥ 68%", 4)],
       "Jam is a product made by boiling fruit pulp or pieces with sugar, pectin and acid to a total soluble solids of at least 68%, giving a reasonably firm, spreadable set. Common problems: crystallisation of sugar (too little acid/inversion or over-concentration) or of glucose (too much inversion); stickiness or gumminess (too much inversion/ high TSS); premature setting or failure to set (wrong pectin/acid/sugar balance); syneresis or weeping (too much acid, too little pectin); mould growth (low TSS, poor sealing); browning and loss of colour (overcooking). Tests for end point and quality: sheet (flake) test, drop test in water, boiling-temperature test (about 105-106 °C) and measuring TSS with a refractometer (≥ 68%)."),
    it("3. By-product technology in the food industry plays a significant role in reducing food losses. List the by-products and their uses for the following fruits: (i) apple; (ii) mango; (iii) pineapple; (iv) banana; (v) grape. (5 × 2 = 10 marks)", 10,
       [("(i) Apple pomace - pectin, vinegar, cider, animal feed", 2), ("(ii) Mango peel and kernel - pectin, kernel fat/oil, starch, feed", 2), ("(iii) Pineapple peel/core - bromelain, vinegar, juice, feed", 2), ("(iv) Banana peel/pseudostem - fibre, flour, feed, compost", 2), ("(v) Grape pomace/seeds - grape seed oil, tartrates, polyphenols, alcohol, feed", 2)],
       "(i) Apple: pomace and peel - pectin extraction, cider vinegar, animal feed, dietary fibre. (ii) Mango: peel - pectin and fibre; kernel - mango kernel fat/oil (cocoa-butter substitute) and starch; also feed. (iii) Pineapple: peel and core - bromelain enzyme, vinegar, juice/syrup, animal feed, fibre. (iv) Banana: peel - flour, feed and compost; pseudostem and leaves - fibre for textiles/paper, plates. (v) Grape: pomace and seeds - grape seed oil, polyphenols/antioxidants, tartaric acid (cream of tartar), distilled spirits, animal feed."),
    it("4. Define sensory evaluation. What are the criteria for selection of a panel of judges? How do you prepare food samples for sensory evaluation? List and explain the types of sensory tests. (2+4+3+6 = 15 marks)", 15,
       [("Definition: scientific method to evoke, measure, analyse and interpret responses to food perceived by the senses", 2), ("Panel selection: health, no allergies, interest and availability, sensory acuity (screening tests), training, non-smokers, unbiased", 4), ("Sample preparation: uniform size/temperature, coded with random 3-digit numbers, random order, neutral containers, water/crackers between samples, controlled environment", 3), ("Tests: discrimination (triangle, duo-trio, paired comparison), descriptive (profile, QDA), affective (hedonic scale, preference, ranking)", 6)],
       "Sensory evaluation is a scientific discipline used to evoke, measure, analyse and interpret reactions to the characteristics of food as perceived by sight, smell, taste, touch and hearing. Panel selection: good health and no allergies or colds; non-smokers; interest, motivation and availability; normal sensory acuity shown in screening tests (basic tastes, odours, colour vision); ability to describe and repeat judgements; no bias (not product developers) and willingness to be trained. Sample preparation: identical size, shape, quantity and serving temperature; coded with random three-digit numbers; served in random/balanced order in identical neutral containers; water and plain crackers for rinsing; tests in a quiet booth with controlled lighting. Types of tests: discrimination/difference tests (paired comparison, duo-trio, triangle) to find whether products differ; descriptive tests (flavour profile, quantitative descriptive analysis) with trained panels to describe attributes; affective/consumer tests (hedonic 9-point scale, paired preference, ranking) to measure liking."),
])
Q += case("foodsci2025", 2, T, C2, items=[
    it("1. In the preparation of baked products, the dough and batter are leavened. List the leavening agents used in baked products and explain their step-by-step mechanisms of leavening.", 10,
       [("Biological: yeast fermentation - sugars → CO₂ + ethanol, gas trapped in gluten", 3), ("Chemical: baking soda + acid / baking powder (single and double acting) release CO₂ on moisture and heat", 3), ("Physical: air (creaming, whipping, sifting) and steam expanding in oven", 3), ("Gas expansion in oven, starch gelatinisation and protein coagulation set the structure", 1)],
       "Leavening agents: (1) Biological - yeast (and sourdough bacteria): yeast ferments sugars to carbon dioxide and ethanol; the CO₂ is trapped in the gluten network developed by kneading, the dough rises during proofing, and in the oven gas expands further before the crumb sets. (2) Chemical - baking soda (sodium bicarbonate) reacts with an acid (buttermilk, cream of tartar) to release CO₂; baking powder contains soda plus acid salts - single-acting releases gas when moistened, double-acting also releases gas when heated. (3) Physical - air incorporated by creaming fat and sugar, whipping eggs or sifting flour, and steam formed from water in the batter during baking (e.g. puff pastry, choux) expand in the heat. In the oven, the gases expand, then starch gelatinises and proteins (gluten, egg) coagulate to fix the light, porous structure."),
    it("2. Processing of pulses is important to eliminate toxic constituents. List two groups of thermolabile inhibitors/toxic constituents with examples. Define lathyrism and favism. Explain the step-by-step ways to eliminate the toxic constituents from pulses. (4+6+5 = 15 marks)", 15,
       [("Thermolabile groups: protease (trypsin/chymotrypsin) inhibitors - soybean, red gram; haemagglutinins (lectins) - kidney bean, soybean (also goitrogens, amylase inhibitors)", 4), ("Lathyrism: paralysis of lower limbs from excessive Lathyrus sativus (khesari dal) - neurotoxin BOAA/ODAP", 3), ("Favism: haemolytic anaemia after eating fava beans in G6PD-deficient people (vicine, convicine)", 3), ("Elimination: soaking and discarding water, dehulling, germination, fermentation, boiling/pressure cooking, roasting; parboiling khesari, steeping in hot water", 5)],
       "Thermolabile anti-nutritional factors: (1) protease (trypsin and chymotrypsin) inhibitors - soybean, red gram, chickpea - reduce protein digestion; (2) haemagglutinins (lectins/phytohaemagglutinins) - red kidney beans, soybean - agglutinate red blood cells and cause digestive upset; others include goitrogens and amylase inhibitors. Lathyrism: a crippling neurological disease (spastic paralysis of the legs) caused by eating large amounts of khesari dal (Lathyrus sativus) over a long period, due to the neurotoxin β-ODAP (BOAA). Favism: acute haemolytic anaemia in people with G6PD deficiency after eating fava (broad) beans, caused by vicine and convicine. Elimination: clean and soak pulses overnight and discard the soaking water; dehull; germinate (sprout) or ferment; boil thoroughly or pressure-cook (destroys inhibitors and lectins); roast; for khesari, steep in hot water and discard the water (removes most ODAP) and parboil; avoid fava beans if G6PD-deficient."),
    it("3. Explain/define the following: (i) dextrin; (ii) glycogen; (iii) cellulose; (iv) hemicellulose; (v) pectic substances. (5 × 2 = 10 marks)", 10,
       [("(i) Dextrin: low-molecular starch breakdown products (heat/acid/enzymes), e.g. toast crust", 2), ("(ii) Glycogen: highly branched animal storage polysaccharide in liver and muscle", 2), ("(iii) Cellulose: linear β-1,4 glucose polymer, plant cell walls, dietary fibre", 2), ("(iv) Hemicellulose: branched heteropolysaccharides (xylans, mannans) in cell walls", 2), ("(v) Pectic substances: galacturonic acid polymers in middle lamella - protopectin, pectin, pectic acid; gelling", 2)],
       """(i) Dextrins: partially hydrolysed starch fragments formed by dry heat (toasting, baking crusts), acid or amylase; soluble, slightly sweet, used as adhesives and thickeners.
(ii) Glycogen: the storage polysaccharide of animals ('animal starch'), a highly branched glucose polymer (α-1,4 with frequent α-1,6 branches) stored in liver and muscle.
(iii) Cellulose: a linear polymer of glucose with β-1,4 bonds, the main structural component of plant cell walls; insoluble dietary fibre not digested by humans.
(iv) Hemicellulose: a group of branched heteropolysaccharides (xylans, arabinoxylans, mannans, glucans) found with cellulose in cell walls; partly soluble, a source of dietary fibre.
(v) Pectic substances: polymers of galacturonic acid in the middle lamella and cell walls of fruits - protopectin (unripe), pectin and pectic acid (over-ripe); pectin forms gels with sugar and acid in jams and jellies."""),
    it("4. What is parboiling of paddy? What are the advantages and disadvantages of parboiling? Elaborate the milling operations, cooking and nutritive value of rice. List the processed products from rice. (4+5+4+2 = 15 marks)", 15,
       [("Parboiling: soaking, steaming and drying paddy before milling - starch gelatinised, nutrients move inward", 4), ("Advantages: less breakage, higher milling yield, retains B-vitamins/minerals, better keeping quality, less stickiness; disadvantages: cost, energy, colour/odour, longer cooking, mould risk", 5), ("Milling: cleaning, dehusking, separation, whitening/polishing, grading; cooking: water absorption, gelatinisation; nutrition: carbohydrate ~78%, protein 6-8%, B vitamins lost in polishing", 4), ("Products: flakes (beaten rice), puffed/popped rice, rice flour, noodles, bran oil, rice wine/ara, idli/dosa batter", 2)],
       """Parboiling is the hydrothermal treatment of paddy before milling: soaking in water, steaming and then drying. Starch gelatinises and water-soluble vitamins and minerals from the husk and bran move into the endosperm.
Advantages: grain becomes harder, so fewer broken grains and higher head-rice yield; better retention of thiamine and minerals; resistance to insects and better keeping quality; less loss of solids and stickiness in cooking. Disadvantages: extra cost, water and energy; darker colour and sometimes off-odour; longer cooking time; risk of mould if drying is poor; bran oil quality changes.
Milling: cleaning, dehusking (rubber-roll huller) to give brown rice, paddy separation, whitening/polishing to remove bran, then grading and sorting. Cooking: rice absorbs water and starch gelatinises; the amylose content decides texture (high amylose - fluffy, low - sticky). Nutritive value: about 78% carbohydrate, 6-8% protein (lysine limiting), little fat; brown and parboiled rice keep more B vitamins and minerals, while highly polished rice loses much thiamine (risk of beriberi).
Processed products: beaten/flaked rice (zaw/sip), puffed and popped rice, rice flour, noodles and vermicelli, rice bran oil, rice-based fermented foods and beverages (ara, rice wine), idli/dosa batters, baby foods."""),
])
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions", "type": "short_answer", "count": 5, "marks_each": 4, "answer_any": None},
    {"title": "Section B: Case study (answer either Case I or Case II)", "type": "passage", "count": 2, "marks_each": 50, "answer_any": 1},
]
