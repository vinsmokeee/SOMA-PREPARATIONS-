"""ME Technical Paper III (Subject Specialisation Paper), Food Science, BCSE 2024 - real paper (PDF sent by the founder).
Fitted to the 2025 Food Science layout (the latest): Part II short answers are 4 marks each (5 in 2024). MCQ 14's options are
re-lettered (the PDF prints two "b"). MCQs replaced: 7 (the major muscle protein is myosin, not listed) and 11 (ultrafiltration
pore range differs between sources). Case I uses the Tetra Pak layers picture (public/papers/me/tech3-food-2024-tetrapak.jpg).
FLAGGED: Case I question 4 (Bhutan Food and Drug Authority organic labelling requirements) - an expert should check.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Food Science): BCSE 2024, batch 1"
GROUP_TAG = "foodsci2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "food-science"
ADDS_TO_PAPER = True  # 2025 is the latest Food Science paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Food Science"
TETRA = "/papers/me/tech3-food-2024-tetrapak.jpg"

MCQ = r"""[
{
"n": 1,
"stem": "What is the name of water that is trapped in a crystal?",
"opts": [
"Absorbed water",
"Adsorbed water",
"Free water",
"Bound water"
]
},
{
"n": 2,
"stem": "After slaughtering the stored glycogen in animal is converted into:",
"opts": [
"Glucose",
"Lactic acid",
"Citric acid",
"Acetic acid"
]
},
{
"n": 3,
"stem": "Which of the following is an example for hermetic packaging?",
"opts": [
"Cans",
"Wood baskets",
"Nets",
"Polyethylene cover"
]
},
{
"n": 4,
"stem": "The process of separation of suspended particle from fluid by passing it through a porous medium is:",
"opts": [
"Centrifugation",
"Filtration",
"Sedimentation",
"Extraction"
]
},
{
"n": 5,
"stem": "Development of unstable fat crystal on the surface of chocolate is called:",
"opts": [
"Fat blush",
"Fat crack",
"Fat bloom",
"Fat dot"
]
},
{
"n": 6,
"stem": "Which from the following is a primary additive used in whole egg mayonnaise.",
"opts": [
"Humectant",
"Antioxidant",
"Emulsifier",
"Acidulant"
]
},
{
"n": 7,
"stem": "____________ is the major component of meat muscle",
"opts": [
"Myoglobin",
"Hemoglobin",
"Xanthophyl",
"Collagen"
]
},
{
"n": 8,
"stem": "The yellow coloration of milk fat is due to the presence of:",
"opts": [
"Curcumin",
"Chlorophyl",
"Anthocyanin",
"Carotenoid"
]
},
{
"n": 9,
"stem": "Two different type of fermentation is involved in the production of:",
"opts": [
"Yoghurt",
"Pickle",
"Vinegar",
"Wine"
]
},
{
"n": 10,
"stem": "What is the third HACCP step?",
"opts": [
"Conduct hazard analysis",
"Determine Critical Control Points",
"Set critical limit",
"Establish a monitoring system"
]
},
{
"n": 11,
"stem": "The membrane pore diameter in ultrafiltration to filter solute of molecular weight 4000-10,000 is",
"opts": [
"0.05-5 micrometre",
"0.005-0.1 micrometre",
"0.0005-0.01 micrometre",
"0.0001-0.001 micrometre"
]
},
{
"n": 12,
"stem": "In Controlled Atmosphere storage for apples, the recommended oxygen content in the cold storage room should be:",
"opts": [
"3%",
"4%",
"5%",
"6%"
]
},
{
"n": 13,
"stem": "Food heats up in a microwave oven primarily due to vibration of:",
"opts": [
"Water",
"Fat",
"Protein",
"Carbohydrate"
]
},
{
"n": 14,
"stem": "A food that contains 3 grams of fat, 4 grams of protein and 5 grams of carbohydrate would have calories equal to:",
"opts": [
"48",
"63",
"83",
"68"
]
},
{
"n": 15,
"stem": "What happens to the boiling point of water when it is heated at high altitudes?",
"opts": [
"It increases",
"It decreases",
"It stays the same",
"Water doesn’t boil at high altitude"
]
},
{
"n": 16,
"stem": "Degumming is an initial purification stage of refining process in oil to remove:",
"opts": [
"Water",
"Dirt",
"Free fatty acid",
"Phosphatides"
]
},
{
"n": 17,
"stem": "Adulteration of wheat flour with sand and stones can be inferred by:",
"opts": [
"Total Ash",
"Acid Insoluble Ash",
"Crude fibre",
"Total Solids"
]
},
{
"n": 18,
"stem": "A toxin commonly found in corn and peanuts is:",
"opts": [
"Solanine",
"Protease",
"Goitrogens",
"Aflatoxins"
]
},
{
"n": 19,
"stem": "Which of the following pertains to the misuse of additives:",
"opts": [
"To deceive the consumers into a false sense of assurance on the sensory attributes",
"To disguise the use of faulty processing and handling techniques",
"To disguise the use of inferior quality of raw materials",
"All of the above"
]
},
{
"n": 20,
"stem": "Which among the following is NOT a change that take place during baking?",
"opts": [
"Gas vaporization with increase in temperature",
"Dough-crumb transition",
"Starch gelatinization",
"Moisture adsorption"
]
},
{
"n": 21,
"stem": "______ interaction between muscle proteins is responsible for muscle contraction.",
"opts": [
"Globulin",
"Actomyosin",
"Collagen",
"Elastin"
]
},
{
"n": 22,
"stem": "Which is stated by the First Law of Thermodynamics?",
"opts": [
"Energy can be created or destroyed by physical processes",
"Entropy always increases",
"Energy cannot be created or destroyed",
"The organization of the universe is steadily increasing"
]
},
{
"n": 23,
"stem": "Which of the following food ingredient can be used for both emulsification and aeration:",
"opts": [
"Flour",
"Egg",
"Corn flour",
"Vinegar"
]
},
{
"n": 24,
"stem": "Fibre is a type of",
"opts": [
"Sugar",
"Protein",
"Carbohydrate",
"Fat"
]
},
{
"n": 25,
"stem": "As per the Bhutan Mandatory Standard for Labelling of Prepackaged Food (BMS-12:2017), exemption from mandatory labeling requirement relating to ingredient declaration applies when:",
"opts": [
"Irradiated food",
"Functional food",
"Small units where the package surface area is less than 10cm2",
"Quantity of food is less than 250gm/ml."
]
},
{
"n": 26,
"stem": "To control crystal size when making candy, an interfering agent such as ______ is added.",
"opts": [
"Salt",
"Sugar",
"Water",
"Cream of tartar"
]
},
{
"n": 27,
"stem": "Non-essential amino acids are:",
"opts": [
"Not essential for the body",
"Naturally produced in animals and can be found in meant",
"Naturally produced by the human body",
"All of the above"
]
},
{
"n": 28,
"stem": "Viscoelastic nature of wheat dough is due to",
"opts": [
"Gliadin",
"Glutenin",
"Both",
"None"
]
},
{
"n": 29,
"stem": "The main advantage of MAP in case of bakery products is",
"opts": [
"Lowered respiration",
"Mold growth inhibition",
"Inhibition of ripening",
"All of above"
]
},
{
"n": 30,
"stem": "Which of the following is the correct pairing of essential fatty acids?",
"opts": [
"Linolenic acid and Oleic acid",
"Lenoleic acid and Linolenic acid",
"Linolenic acid and Laurie acid",
"Oleic acids and Lenoleic acid"
]
}
]"""

KEY = {
    1: ("d", "Water held in crystals (water of crystallisation) is bound water, not available for microbes or reactions."),
    2: ("b", "After slaughter, glycogen is broken down anaerobically to lactic acid, lowering meat pH."),
    3: ("a", "Cans are hermetically sealed - airtight against gases and microbes."),
    4: ("b", "Filtration separates suspended particles by passing the fluid through a porous medium."),
    5: ("c", "Fat bloom is the greyish-white layer of unstable fat crystals on chocolate."),
    6: ("c", "Mayonnaise is an oil-in-water emulsion stabilised by egg yolk lecithin - an emulsifier."),
    8: ("d", "Carotenoids (mainly β-carotene) from the feed give milk fat its yellow colour."),
    9: ("c", "Vinegar needs alcoholic fermentation by yeast, then acetic fermentation by Acetobacter."),
    10: ("c", "HACCP principles: 1 hazard analysis, 2 determine CCPs, 3 establish critical limits."),
    12: ("a", "Apples are commonly stored at low oxygen (about 2-3%) in controlled atmosphere."),
    13: ("a", "Microwaves make water molecules (dipoles) rotate and vibrate, generating heat."),
    14: ("b", "3 x 9 + 4 x 4 + 5 x 4 = 27 + 16 + 20 = 63 kcal."),
    15: ("b", "Lower air pressure at altitude lowers the boiling point of water."),
    16: ("d", "Degumming removes phosphatides (gums) such as lecithin."),
    17: ("b", "Acid-insoluble ash is mainly silica, showing sand or dirt."),
    18: ("d", "Aflatoxins from Aspergillus moulds contaminate maize and groundnuts."),
    19: ("d", "Additives must not be used to deceive consumers, disguise faulty processing or hide inferior raw materials."),
    20: ("d", "Baking loses moisture by evaporation; moisture adsorption is not a baking change."),
    21: ("b", "Actin and myosin form actomyosin during contraction."),
    22: ("c", "Energy cannot be created or destroyed, only converted (conservation of energy)."),
    23: ("b", "Egg emulsifies (yolk lecithin) and aerates (white proteins form foams)."),
    24: ("c", "Dietary fibre is a carbohydrate (non-starch polysaccharides) that humans cannot digest."),
    25: ("c", "Small units with a largest surface area below 10 cm² may be exempt from listing ingredients (as in Codex)."),
    26: ("d", "Cream of tartar (or corn syrup) interferes with sucrose crystallisation, keeping crystals small."),
    27: ("c", "Non-essential amino acids can be made by the body, so they need not come from food."),
    28: ("c", "Gliadin gives extensibility and glutenin elasticity: together gluten gives viscoelastic dough."),
    29: ("b", "Modified atmosphere packaging (high CO2) mainly inhibits mould growth in bakery products."),
    30: ("b", "Linoleic (omega-6) and linolenic (omega-3) acids are the essential fatty acids."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "The most abundant myofibrillar protein in meat muscle is", ["Myosin", "Collagen", "Myoglobin", "Elastin"], "a",
            "Myosin (with actin) makes up most of the myofibrillar protein; myoglobin is a pigment and collagen is connective tissue."),
    new_mcq(2, T, "Which membrane process removes mainly water and small ions, retaining almost all solutes, as in desalination?", ["Reverse osmosis", "Microfiltration", "Ultrafiltration", "Sieving"], "a",
            "Reverse osmosis membranes have the smallest pores and retain salts and sugars, passing mainly water."),
]

SA = [
    ("Explain hydrogenation of fat and give a practical application of this process in the food industry. Despite being bad for health, give two reasons why hydrogenated fats are so popular in the food industry. (printed 2+1+2 = 5 marks; marked out of 4)",
     [("Hydrogenation: adding H2 to unsaturated fatty acid double bonds with nickel catalyst, heat and pressure, turning liquid oils into semi-solid fats; partial hydrogenation forms trans fats", 1.5),
      ("Application: vanaspati/ margarine/ shortening for bakery and frying", 1), ("Popularity: longer shelf life/ oxidative stability, desired solid texture/ plasticity for baking, cheap, high smoke point/ reuse in frying", 1.5)],
     "Hydrogenation is the addition of hydrogen to the double bonds of unsaturated fatty acids in oils, using a nickel catalyst at about 150-200 °C under pressure. It converts liquid oils into semi-solid or solid fats with higher melting points; partial hydrogenation also forms trans fatty acids, which raise LDL cholesterol. Application: making vanaspati, margarine and bakery shortening from vegetable oils. Popular because: (1) they resist oxidation and rancidity, giving long shelf life and stable frying oils; (2) they provide the solid, plastic texture needed for flaky pastries, biscuits and creams at a low cost compared with butter."),
    ("What is the isoelectric point of a protein and what factor is responsible for it? What is its significance in food processing? Give an example of a processed product resulting from this phenomenon. (printed 2+1+1+1 = 5 marks; marked out of 4)",
     [("Isoelectric point: pH at which protein has zero net charge, minimum solubility, proteins aggregate/ precipitate", 1.5),
      ("Factor: the pH and the protein's amino acid composition (acidic and basic side-chain groups)", 1), ("Significance and example: protein precipitation/ separation, texture, functionality; cheese/ curd, paneer, yoghurt, tofu, casein production (casein pI ~4.6)", 1.5)],
     "The isoelectric point (pI) is the pH at which a protein carries no net electric charge - its positive and negative charges balance - so repulsion between molecules is lowest, solubility is minimum and the protein tends to aggregate and precipitate. It depends on the protein's amino acid composition (the proportion of acidic and basic side groups) and is reached by changing the pH. Significance: used to precipitate and separate proteins, and it affects water-holding, emulsifying, foaming and texture of foods. Example: casein precipitates at about pH 4.6 - the basis of acid curd, paneer, cottage cheese and yoghurt gel formation (and acid casein production)."),
    ("What do a rheometer and a viscometer specifically measure? State one important difference between Newtonian and non-Newtonian fluids. (printed 3+2 = 5 marks; marked out of 4)",
     [("Viscometer: viscosity (resistance to flow) at a set shear condition; rheometer: full flow and deformation behaviour - viscosity vs shear rate, viscoelastic properties (storage/ loss modulus), yield stress", 2.5),
      ("Difference: Newtonian - viscosity constant regardless of shear rate (water, oil); non-Newtonian - viscosity changes with shear rate/ time (ketchup, dough)", 1.5)],
     "A viscometer measures viscosity - a fluid's resistance to flow - usually at one or a few shear conditions (e.g. capillary, falling-ball or rotational viscometers). A rheometer measures the wider rheological behaviour: how viscosity changes with shear rate and time, yield stress, and the viscoelastic properties of semi-solids such as dough and gels (storage and loss moduli) under controlled stress or strain. Difference: a Newtonian fluid (water, milk, vegetable oil) has a constant viscosity whatever the shear rate, whereas a non-Newtonian fluid's viscosity changes with shear rate or time - shear-thinning (ketchup, yoghurt), shear-thickening (cornstarch slurry) or with a yield stress (mayonnaise)."),
    ("Define thermal death time, D value and Z value. (printed 1+2+2 = 5 marks; marked out of 4)",
     [("Thermal death time: time at a given temperature to kill all microorganisms/ spores of a given population", 1),
      ("D value: time at a constant temperature to reduce the population by 90% (one log cycle)", 1.5),
      ("Z value: temperature change needed to change the D value by a factor of 10 (one log cycle)", 1.5)],
     "Thermal death time (TDT, F value at a reference temperature) is the time needed at a specified temperature to destroy a given number of microorganisms or spores completely. D value (decimal reduction time) is the time at a constant temperature needed to destroy 90% of the population, i.e. to reduce it by one log cycle (e.g. D121 of Clostridium botulinum ≈ 0.21 min). Z value is the change in temperature (°C) required to change the D value by a factor of 10 (one log cycle) - it shows how sensitive the organism is to temperature (often about 10 °C for spores). Together they are used to design canning and sterilisation processes."),
]
for i, (s, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=4, topic=T, stem=s, key_points=kp, model=mod))

C1 = """Case I: Food chemistry, packaging and labelling
Answer the following questions on food chemistry, packaging materials and food labelling."""
C2 = """Case II: Extrusion, sensory evaluation and frying
Answer the following questions on extrusion processing, sensory evaluation and the quality of fried foods."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("foodsci2024", 1, T, C1, items=[
    it("1. Explain or define the following with one example each, and their implication for the quality of a food product: 1.1 Dextrinisation; 1.2 Gelatinisation; 1.3 Use of shortening in baked products. (4 marks each)", 12,
       [("1.1 Dextrinisation: dry heat breaks starch into dextrins - browning, flavour, crust/ toast colour; example toast, roux", 4),
        ("1.2 Gelatinisation: starch granules swell and burst in water with heat, viscosity/ thickening, digestibility; example custard, rice cooking, sauces", 4),
        ("1.3 Shortening: fat coats gluten strands, shortens them - tender, flaky, crumbly texture, aeration, moistness, shelf life; example biscuits, pastry, cakes", 4)],
       "1.1 Dextrinisation is the breakdown of starch into shorter chains (dextrins) by dry heat (or acid/enzymes), e.g. toasting bread or browning flour for a roux; it produces a brown colour, toasted flavour and slightly sweet taste and reduces thickening power. 1.2 Gelatinisation is the swelling and bursting of starch granules when heated in water (about 55-80 °C), so they absorb water and leach amylose, thickening the liquid; e.g. custard, cooked rice, sauces - it gives viscosity, smooth texture and better digestibility, and on cooling may set to a gel. 1.3 Shortening (fat) in baked products coats flour proteins and starch, preventing gluten strands from forming long networks ('shortening' them); e.g. biscuits, pie crust, cakes - giving a tender, crumbly or flaky texture, trapping air during creaming for volume, improving moistness and extending shelf life."),
    it("2. Write two differences between each of the following: 2.1 HDL and LDL; 2.2 HDPE and LDPE; 2.3 density and grammage of packaging material; 2.4 plate heat exchanger and tubular heat exchanger; 2.5 flavouring substances and flavour enhancers; 2.6 climacteric and non-climacteric fruit. (3 marks each)", 18,
       [("2.1 HDL: high protein, carries cholesterol to liver, 'good', protective; LDL: more cholesterol, carries to tissues, deposits in arteries, 'bad'", 3),
        ("2.2 HDPE: linear, dense (0.94-0.97), stiff, opaque, higher melting, better barrier - bottles; LDPE: branched, flexible, clear, lower melting - films, bags", 3),
        ("2.3 Density: mass per unit volume (g/cm³), material property; grammage: mass per unit area (g/m²), used for paper/ board, relates to thickness/ strength", 3),
        ("2.4 Plate: thin corrugated plates, large area, compact, efficient, easy cleaning, low-viscosity liquids (milk pasteurisation); tubular: tubes, handles viscous/ particulate foods, higher pressure, less efficient, more space", 3),
        ("2.5 Flavouring substances impart flavour themselves (vanillin, essences); flavour enhancers have little flavour but intensify existing flavours (MSG, nucleotides)", 3),
        ("2.6 Climacteric: respiration and ethylene burst during ripening, ripen after harvest (banana, mango, apple, tomato); non-climacteric: no burst, must ripen on plant (citrus, grapes, strawberry)", 3)],
       "2.1 HDL (high-density lipoprotein) has more protein and carries cholesterol from tissues back to the liver - 'good' cholesterol that protects the heart; LDL (low-density lipoprotein) is richer in cholesterol and carries it to tissues, where excess deposits in arteries - 'bad' cholesterol raising heart-disease risk. 2.2 HDPE has linear chains, higher density (0.94-0.97 g/cm³), is stiffer, opaque, with higher melting point and better moisture barrier (milk and oil bottles); LDPE has branched chains, lower density (0.91-0.93), is flexible, transparent and easily heat-sealed (films, bags, liners). 2.3 Density is mass per unit volume (g/cm³) of a material; grammage is mass per unit area (g/m²) used for paper and board, indicating its weight and strength. 2.4 A plate heat exchanger has thin corrugated plates giving a large area in a small space, high efficiency and easy cleaning, suited to low-viscosity liquids like milk; a tubular heat exchanger uses tubes, handles viscous and particulate products and higher pressures but is less compact and efficient. 2.5 Flavouring substances give their own flavour (vanillin, fruit essences, spices); flavour enhancers have little flavour themselves but intensify existing flavours (monosodium glutamate, inosinate). 2.6 Climacteric fruits show a sharp rise in respiration and ethylene during ripening and can ripen after harvest (banana, mango, apple, tomato); non-climacteric fruits have no such rise and do not ripen further after harvest (citrus, grapes, strawberries)."),
    it("3. Tetra Pak cartons are an example of composite packaging; their multiple layers keep food shelf-stable for months at ambient temperature without refrigeration. The picture shows the layers.\n3.1 Four different types of packaging material are used. Explain their functional roles based on their properties and how the materials are arranged in six layers. (9 marks)\n3.2 Give two advantages and two disadvantages of Tetra Pak cartons for packing milk instead of glass bottles. (3 marks)", 12,
       [("3.1 Six layers outside to inside: polyethylene (moisture/ print protection), paperboard (strength, stiffness, printing), polyethylene (lamination/ adhesion), aluminium foil (barrier to light, oxygen, odours), adhesion polymer/ PE (binds foil), polyethylene (inner food-contact, liquid barrier, heat seal) - roles explained", 9),
        ("3.2 Advantages: light, unbreakable, aseptic long shelf life without refrigeration, space-efficient/ cheaper transport; disadvantages: hard to recycle (composite), not reusable, opaque (cannot see product), dependence on specialised plant", 3)],
       "3.1 The four materials are polyethylene, paperboard, aluminium foil and an adhesion polymer (a polyethylene-based tie layer). From outside to inside: (1) outer polyethylene - protects against outside moisture and scuffing and protects the print; (2) paperboard - about 75% of the carton, gives stiffness, strength and shape and is the printing surface; (3) polyethylene - laminating layer bonding the paperboard to the foil; (4) aluminium foil (about 6 µm) - the barrier against light, oxygen and odours, essential for long ambient shelf life of aseptically packed products; (5) adhesion polymer - bonds the foil to the inner plastic; (6) inner polyethylene - food-contact layer that keeps the liquid in and allows heat sealing.\n3.2 Advantages over glass bottles: light and unbreakable, so cheaper and safer to transport and store (rectangular shape saves space); with UHT aseptic filling the milk keeps for months without refrigeration. Disadvantages: the composite layers are difficult to separate and recycle (less recycling capacity, especially in Bhutan); cartons are single-use whereas glass can be reused, and the product cannot be seen."),
    it("4. Organic farming and products are gaining momentum as consumers become aware of the benefits of products free from chemicals. As per the Bhutan Food and Drug Authority, list four labelling requirements for ingredients, origin and declaration on the label of organic products.", 8,
       [("Four requirements explained (2 marks each), e.g.: 'organic' claim only if ingredients meet organic standard (≥95% organic ingredients, rest permitted); list of ingredients with organic ones identified; name/ code of the certification body and certification mark; country/ place of origin; name and address of producer/ packer; no misleading claims", 8)],
       "Labelling requirements (following the national organic standard and labelling regulations, aligned with Codex): (1) The term 'organic' may be used only when the product is certified and at least 95% of agricultural ingredients (by weight, excluding water and salt) are organically produced; products with less may only identify the organic ingredients in the ingredient list. (2) Ingredients must be listed in descending order of weight, with organic ingredients clearly identified. (3) The name or code number of the certification/inspection body and the certification mark (e.g. Bhutan Organic logo) must appear. (4) The country of origin and the name and address of the producer, processor or packer must be declared, along with the usual mandatory information (product name, net quantity, date marking, lot number), without any misleading claims. [Expert: check against the current BFDA/ Bhutan Organic Standard text.]"),
])
for x in Q:
    if x["key"] == "C1Q3":
        x["image"] = TETRA
    if x["key"] == "C1Q4":
        x["issues"] = ["Expert check: confirm the BFDA organic labelling requirements."]
Q += case("foodsci2024", 2, T, C2, items=[
    it("1. Extrusion processing is widely used for snacks, breakfast cereals, pasta and more.\n1.1 Define extrusion processing and explain the principle of hot extrusion. (4 marks)\n1.2 Food extruders have five main parts - pre-conditioning, feeding system, screw, barrel or sleeves, and die and cutting mechanism. Explain each part and its function. (10 marks)\n1.3 List four properties of the feed materials that strongly influence product texture and colour. (4 marks)\n1.4 What are the four most important operating parameters of an extruder? (4 marks)", 22,
       [("1.1 Extrusion: forcing material through a die after mixing, kneading, shearing, heating; hot extrusion (HTST): high temperature, pressure, shear cook starch/ proteins, sudden pressure drop at die flashes water to steam → expansion/ puffing", 4),
        ("1.2 Five parts with functions: pre-conditioning (moistening/ steam heating), feeding (controlled feed rate), screw (conveying, compressing, shearing, mixing), barrel (houses screw, heating/ cooling jackets, grooves), die and cutter (shape, pressure, expansion, length)", 10),
        ("1.3 Feed factors: moisture content, starch content/ type (amylose:amylopectin), protein content, fat/ oil content, sugar, fibre, particle size, pH", 4),
        ("1.4 Operating parameters: barrel temperature, screw speed, feed rate, moisture/ water addition (also die size/ pressure, specific mechanical energy)", 4)],
       "1.1 Extrusion is a continuous process in which moistened ingredients are mixed, kneaded, sheared, heated and forced through a shaped die. In hot (high-temperature short-time) extrusion, mechanical shear and barrel heating raise the dough to about 120-180 °C under high pressure, gelatinising starch and denaturing proteins into a viscous melt; when it exits the die, the sudden pressure drop flashes superheated water to steam, expanding (puffing) the product, which is then cut and dried.\n1.2 Pre-conditioning: raw materials are mixed with water and steam to hydrate and partly pre-cook them, improving uniformity and reducing wear. Feeding system: a hopper with a volumetric or gravimetric feeder supplies material at a constant rate. Screw: rotates to convey, compress, knead and shear the material, generating heat and pressure (flights and pitch vary along its length). Barrel or sleeves: the cylinder enclosing the screw, often grooved, with heating/cooling jackets that control temperature. Die and cutting mechanism: the die shapes the product and creates back-pressure, controlling expansion; a rotating knife cuts it to length.\n1.3 Feed properties: moisture content, starch content and type (amylose:amylopectin ratio), protein content, fat/oil content, sugar and fibre content, and particle size - they determine expansion, crispness, density and browning (Maillard reaction).\n1.4 Operating parameters: barrel temperature, screw speed, feed rate and moisture (water/steam addition); die geometry and specific mechanical energy also matter."),
    it("2. Sensory evaluation is important in food product development; different methods assess consumers' acceptance.\n2.1 Write four objectives of sensory evaluation. (4 marks)\n2.2 Discuss how the duo-trio test and the triangle test are conducted. (4 marks)\n2.3 Which test method is superior and why? (2 marks)", 10,
       [("2.1 Objectives: product development/ improvement, quality control, shelf-life testing, consumer acceptance/ preference, matching competitors, effect of ingredient/ process changes", 4),
        ("2.2 Duo-trio: reference given, then two coded samples (one same as reference), panelist picks the one matching reference; triangle: three coded samples, two identical, one different, panelist identifies odd one; randomised, statistical tables", 4),
        ("2.3 Triangle test superior statistically: chance probability 1/3 vs 1/2, more sensitive/ efficient; (but more tiring)", 2)],
       "2.1 Objectives: to develop new products and improve existing ones; to check quality and consistency in production (quality control); to find whether a change in ingredients, process or packaging is noticeable; to determine shelf life; and to measure consumer acceptance and preference compared with competitors.\n2.2 Duo-trio test: the panelist first tastes a labelled reference sample, then two coded samples - one identical to the reference and one different - and identifies which coded sample matches the reference. Triangle test: the panelist receives three coded samples, two identical and one different, presented in randomised order, and identifies the odd sample. In both, many panelists are used and the number of correct answers is compared with statistical tables to decide if a difference exists.\n2.3 The triangle test is superior statistically: the chance of guessing correctly is 1/3 instead of 1/2 in the duo-trio test, so it is more sensitive and needs fewer panelists to detect a difference (though it causes more fatigue with strong-flavoured samples)."),
    it("3. Fried foods are widely consumed snacks, but because they are heated in oil at high temperature they are not a healthy option.\n3.1 Discuss two adverse effects of fried food on human health. (2 marks)\n3.2 List and discuss five factors that control the quality of fried food. (5 marks)\n3.3 Define the following values and their significance: (i) anisidine value; (ii) peroxide value; (iii) acid value. (6 marks)", 13,
       [("3.1 Two effects: high fat/ calories → obesity, heart disease; trans fats/ oxidised and polymerised compounds, acrylamide (carcinogen), cholesterol", 2),
        ("3.2 Five factors: oil type and quality, frying temperature, frying time, food moisture/ composition/ surface, oil-to-food ratio/ turnover and replenishment, reuse/ filtration, coating/ batter", 5),
        ("3.3 Anisidine value: secondary oxidation products (aldehydes) - past oxidation/ rancidity; peroxide value: primary oxidation (hydroperoxides, meq O2/kg) - early rancidity; acid value: mg KOH to neutralise free fatty acids in 1 g - hydrolysis/ oil deterioration, discard limit (2 marks each)", 6)],
       "3.1 Fried foods are high in fat and calories, contributing to obesity, high blood cholesterol and heart disease; repeatedly heated oil forms trans fats, oxidised and polymerised compounds and, in starchy foods, acrylamide (a probable carcinogen).\n3.2 Factors: (1) type and quality of oil (stability, smoke point, fatty acid profile); (2) frying temperature (about 170-190 °C - too low causes greasy food, too high burns and degrades oil); (3) frying time; (4) the food's moisture, composition, size and surface (batter or coating affects oil uptake); (5) oil turnover and handling - food-to-oil ratio, topping up with fresh oil, filtering and limiting reuse.\n3.3 (i) Anisidine value measures secondary oxidation products, mainly aldehydes (2-alkenals) - it shows the past oxidation history and rancid flavour potential of an oil. (ii) Peroxide value measures primary oxidation products (hydroperoxides) in milliequivalents of oxygen per kg - an indicator of early oxidation and freshness. (iii) Acid value is the mg of KOH needed to neutralise the free fatty acids in 1 g of fat - it shows hydrolytic breakdown; a high value means deteriorated oil that should be discarded."),
    it("4. The table shows changes in physical parameters of oil during deep-fat frying and their causes. Fill in the blanks following the example in row 1:\nRow 1: Refractive index/UV - increases - accumulation of conjugated fatty acids (example)\nRow 2: Density - ______ - polymerised triacylglycerols\nRow 3: ______ - becomes more intense and darker - Maillard reaction products\nRow 4: Smoke point - ______ - volatile oxidised decomposition products\nRow 5: Specific heat - increases - ______\nRow 6: Viscosity - increases - ______", 5,
       [("Density increases; Colour (becomes darker); Smoke point decreases; Specific heat increases due to polymerised/ oxidised products (polar compounds); Viscosity increases due to polymerised triacylglycerols/ dimers - one mark each", 5)],
       "Row 2: density increases (polymerised triacylglycerols are denser). Row 3: the parameter is colour - it becomes more intense and darker due to Maillard reaction products and oxidation. Row 4: smoke point decreases, because volatile oxidised decomposition products and free fatty acids smoke at lower temperatures. Row 5: specific heat increases because of the accumulation of polar and polymerised compounds (dimers, polymers). Row 6: viscosity increases due to polymerisation - formation of high-molecular-weight dimers and polymers of triacylglycerols."),
])
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions", "type": "short_answer", "count": 5, "marks_each": 4, "answer_any": None},
    {"title": "Section B: Case study (answer either Case I or Case II)", "type": "passage", "count": 2, "marks_each": 50, "answer_any": 1},
]
