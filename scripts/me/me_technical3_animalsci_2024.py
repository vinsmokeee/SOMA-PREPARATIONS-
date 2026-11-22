"""ME Technical Paper III (Subject Specialisation Paper), Animal Science, BCSE 2024 - real paper (PDF sent by the founder).
Same layout as the 2025 Animal Science paper (the latest): 30 MCQs, Part II any 5 of 6 short answers x 6, Section B any 2 of
4 long answers x 20 (Sections B and C in the 2024 paper). MCQs 14 (antibiotic growth promoters are banned in many countries),
16 (no single "main purpose" among the options) and 24 (the hormone regulating oviposition is arginine vasotocin, not listed)
replaced. Long answer 2 (dairy farm economics) uses illustrative figures: an expert should check current Bhutan prices.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Animal Science): BCSE 2024, batch 1"
GROUP_TAG = "animalsci2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "animal-science"
ADDS_TO_PAPER = True  # 2025 is the latest Animal Science paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Animal Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Animal Science"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following is the primary function of the rumen in ruminants?",
"opts": [
"Protein digestion",
"Fiber fermentation",
"Fat absorption",
"Water absorption"
]
},
{
"n": 2,
"stem": "What is the normal gestation period for a cow?",
"opts": [
"150 days",
"280 days",
"310 days",
"330 days"
]
},
{
"n": 3,
"stem": "Which of the following vitamins is essential for blood clotting?",
"opts": [
"Vitamin A",
"Vitamin D",
"Vitamin K",
"Vitamin C"
]
},
{
"n": 4,
"stem": "In poultry, what is the term used to describe the process of laying an egg?",
"opts": [
"Ovulation",
"Ovoposition",
"Oviposition",
"Incubation"
]
},
{
"n": 5,
"stem": "Which mineral is most important for bone development in animals?",
"opts": [
"Iron",
"Calcium",
"Sodium",
"Potassium"
]
},
{
"n": 6,
"stem": "Which of the following diseases is caused by a deficiency of Vitamin D in animals?",
"opts": [
"Rickets",
"Scurvy",
"Anemia",
"Osteoporosis"
]
},
{
"n": 7,
"stem": "Which hormone is primarily responsible for milk production in mammals?",
"opts": [
"Estrogen",
"Progesterone",
"Oxytocin",
"Prolactin"
]
},
{
"n": 8,
"stem": "Which of the following is the most energy-dense nutrient?",
"opts": [
"Carbohydrates",
"Proteins",
"Fats",
"Vitamins"
]
},
{
"n": 9,
"stem": "What is the primary site of digestion and nutrient absorption in monogastric animals?",
"opts": [
"Stomach",
"Small intestine",
"Large intestine",
"Cecum"
]
},
{
"n": 10,
"stem": "Which disease in cattle is caused by Mycobacterium bovis?",
"opts": [
"Foot-and-mouth disease",
"Tuberculosis",
"Brucellosis",
"Anthrax"
]
},
{
"n": 11,
"stem": "Which of the following is a zoonotic disease?",
"opts": [
"Rabies",
"Crimean Congo Hemorrhagic Fever",
"Avian influenza",
"All of the above"
]
},
{
"n": 12,
"stem": "Which of the following is an example of a micromineral?",
"opts": [
"Calcium",
"Phosphorus",
"Iron",
"Potassium"
]
},
{
"n": 13,
"stem": "Which part of the chicken’s digestive system is responsible for grinding food?",
"opts": [
"Crop",
"Proventriculus",
"Gizzard",
"Cloaca"
]
},
{
"n": 14,
"stem": "Which of the following is a common feed additive used to promote growth in livestock?",
"opts": [
"Antibiotics",
"Vitamins",
"Enzymes",
"Probiotics"
]
},
{
"n": 15,
"stem": "Which animal is known as the \"ship of the desert\"?",
"opts": [
"Horse",
"Camel",
"Donkey",
"Mule"
]
},
{
"n": 16,
"stem": "What is the main purpose of artificial insemination in livestock?",
"opts": [
"Improve animal health",
"Increase milk production",
"Enhance genetic diversity",
"Control animal population"
]
},
{
"n": 17,
"stem": "Which disease in sheep is caused by the bacterium Clostridium perfringens?",
"opts": [
"Blackleg",
"Tetanus",
"Pulpy kidney disease",
"Listeriosis"
]
},
{
"n": 18,
"stem": "Which of the following is a legume commonly used in animal feed?",
"opts": [
"Corn",
"Barley",
"Soybean",
"Wheat"
]
},
{
"n": 19,
"stem": "Surgical procedure in which a portion of a dog's ears is removed, typically to create an erect ear appearance.",
"opts": [
"Docking",
"Aligning",
"Cropping",
"Erecting"
]
},
{
"n": 20,
"stem": "Which of the following is NOT a function of water in the animal body?",
"opts": [
"Temperature regulation",
"Solvent for nutrients",
"Energy storage",
"Waste removal"
]
},
{
"n": 21,
"stem": "Which of the following parasites is known to cause significant economic losses in sheep farming?",
"opts": [
"Roundworms",
"Flies",
"Mites",
"Ticks"
]
},
{
"n": 22,
"stem": "Which process involves the breaking down of feed into simpler components for absorption?",
"opts": [
"Ingestion",
"Digestion",
"Metabolism",
"Excretion"
]
},
{
"n": 23,
"stem": "Which of the following feed components is most critical for optimizing the rumen microbial population in ruminants?",
"opts": [
"Simple sugars",
"Protein concentrates",
"Structural carbohydrates",
"Fats"
]
},
{
"n": 24,
"stem": "In poultry, which hormone is primarily involved in regulating oviposition?",
"opts": [
"Progesterone",
"Oxytocin",
"Prolactin",
"Luteinizing hormone"
]
},
{
"n": 25,
"stem": "Which metabolic disorder in dairy cows is commonly associated with low blood calcium levels post-calving?",
"opts": [
"Ketosis",
"Hypocalcemia",
"Acidosis",
"Laminitis"
]
},
{
"n": 26,
"stem": "What type of data in GIS is used to represent continuous surfaces, such as elevation or temperature?",
"opts": [
"Vector data",
"Raster data",
"Tabular data",
"Point data"
]
},
{
"n": 27,
"stem": "Which of the following is a primary factor contributing to infertility in dairy cattle?",
"opts": [
"Excessive energy intake",
"Low protein in the diet",
"Negative energy balance",
"High calcium intake"
]
},
{
"n": 28,
"stem": "Which of the following enzymes is essential for lipid digestion in monogastric animals?",
"opts": [
"Amylase",
"Trypsin",
"Lipase",
"Pepsin"
]
},
{
"n": 29,
"stem": "In which part of the gastrointestinal tract does microbial fermentation predominantly occur in horses?",
"opts": [
"Stomach",
"Small intestine",
"Cecum",
"Large intestine"
]
},
{
"n": 30,
"stem": "What is the function of the pampiniform plexus?",
"opts": [
"Thermoregulation",
"Nutrient absorption",
"Immunogenicity",
"Excretion"
]
}
]"""

KEY = {
    1: ("b", "The rumen is a fermentation vat where microbes break down fibre (cellulose) into volatile fatty acids."),
    2: ("b", "A cow's gestation is about 280-283 days (about 9 months)."),
    3: ("c", "Vitamin K is needed to make clotting factors (prothrombin)."),
    4: ("c", "Oviposition is the laying of the egg; ovulation is the release of the ovum."),
    5: ("b", "Calcium (with phosphorus) is the main mineral of bone."),
    6: ("a", "Vitamin D deficiency causes rickets in young animals (osteomalacia in adults)."),
    7: ("d", "Prolactin stimulates milk synthesis; oxytocin causes milk let-down."),
    8: ("c", "Fat gives about 9 kcal/g, more than twice carbohydrates or proteins (about 4 kcal/g)."),
    9: ("b", "Most digestion and absorption in monogastrics occurs in the small intestine."),
    10: ("b", "Mycobacterium bovis causes bovine tuberculosis."),
    11: ("d", "Rabies, CCHF and avian influenza all spread from animals to humans."),
    12: ("c", "Iron is a trace (micro) mineral; Ca, P and K are macrominerals."),
    13: ("c", "The muscular gizzard grinds food, often with grit."),
    15: ("b", "The camel is called the ship of the desert."),
    17: ("c", "Pulpy kidney (enterotoxaemia) is caused by Clostridium perfringens type D epsilon toxin."),
    18: ("c", "Soybean is a legume used as a protein source (soybean meal); corn, barley and wheat are cereals."),
    19: ("c", "Ear cropping removes part of the ear pinna to make the ears stand erect."),
    20: ("c", "Water regulates temperature, dissolves and transports nutrients and removes waste; it does not store energy."),
    21: ("a", "Gastro-intestinal roundworms (e.g. Haemonchus) cause the heaviest economic losses in sheep."),
    22: ("b", "Digestion breaks feed down into simple components that can be absorbed."),
    23: ("c", "Structural carbohydrates (fibre) keep rumination, rumen pH and a healthy microbial population."),
    25: ("b", "Hypocalcaemia (milk fever) occurs around calving when calcium demand for colostrum rises."),
    26: ("b", "Raster data (grid cells) represent continuous surfaces like elevation or temperature."),
    27: ("c", "Negative energy balance in early lactation delays return to oestrus and lowers conception."),
    28: ("c", "Lipase digests fats (lipids)."),
    29: ("c", "Horses are hindgut fermenters: microbial fermentation occurs mainly in the caecum (and colon)."),
    30: ("a", "The pampiniform plexus cools arterial blood going to the testis (counter-current heat exchange)."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "Which feed additive contains live beneficial microorganisms that improve gut health in livestock?", ["Probiotics", "Prebiotics", "Ionophores", "Antioxidants"], "a",
            "Probiotics (direct-fed microbials) are live beneficial microbes such as Lactobacillus and yeast."),
    new_mcq(2, T, "Which is the main advantage of artificial insemination for breed improvement?", ["Widespread use of semen from genetically superior bulls", "It removes the need to detect heat", "It prevents all reproductive diseases", "It increases the number of calves per cow per pregnancy"], "a",
            "One proven bull's semen can inseminate thousands of cows, spreading superior genes quickly (and avoiding keeping bulls)."),
    new_mcq(3, T, "In poultry, the hormone that stimulates ovulation is", ["Luteinizing hormone (LH)", "Insulin", "Thyroxine", "Prolactin"], "a",
            "A surge of LH triggers ovulation of the mature follicle about 6 hours before the hen lays."),
]

SA = [
    ("Explain the concept of herd immunity and its importance in livestock populations.",
     [("Herd immunity: when a high proportion of animals is immune (vaccination/ recovery), transmission is interrupted and susceptible animals are indirectly protected", 3),
      ("Importance: controls/ eradicates epidemics (FMD, HS, rabies), protects young/ unvaccinated, reduces losses and zoonoses, guides vaccination coverage (e.g. ≥ 80%)", 3)],
     "Herd immunity is the indirect protection of a population when a large enough proportion of animals is immune - through vaccination or previous infection - so that an infectious agent cannot spread efficiently from animal to animal; even non-immune animals (young calves, unvaccinated or sick ones) are protected because chains of transmission are broken. The required coverage depends on how contagious the disease is (often 70-90%). Importance: it controls outbreaks of contagious diseases such as foot-and-mouth disease, haemorrhagic septicaemia, PPR and rabies; reduces deaths, production losses and treatment costs; lowers the risk of zoonoses for people; supports eradication programmes; and makes mass vaccination campaigns (e.g. annual FMD and rabies vaccination in Bhutan) cost-effective."),
    ("Identify and describe three common methods of administering medication in livestock.",
     [("Oral: drench, bolus, in feed/ water - easy, mass medication, slower, rumen effects", 2), ("Parenteral injections: IM (neck/ thigh), SC, IV (jugular) - rapid, accurate dose; hygiene, withdrawal times", 2), ("Topical/ others: pour-on, spray, dip, intramammary, intrauterine, eye/ ear", 2)],
     "(1) Oral administration - drenching liquids with a drench gun or bottle, giving boluses with a balling gun, or adding drugs to feed or drinking water (e.g. dewormers, mineral supplements); easy and suitable for mass treatment, but slower and less precise, with care to avoid aspiration. (2) Parenteral injection - intramuscular (neck or hind-limb muscles), subcutaneous (under loose skin of the neck) or intravenous (jugular vein) using sterile needles and correct doses; gives rapid, accurate drug levels (antibiotics, vaccines), observing withdrawal periods for milk and meat. (3) Topical and local routes - pour-on, spray or dipping for external parasites, intramammary infusion for mastitis, intrauterine pessaries, and eye or wound applications, acting directly at the site."),
    ("Discuss the concept of biosecurity in livestock farming. Provide three key biosecurity measures producers can implement to prevent disease outbreaks and maintain herd health.",
     [("Biosecurity: measures to prevent entry (bio-exclusion) and spread (bio-containment) of pathogens on and between farms", 2),
      ("Three measures: quarantine/ isolation of new and sick animals; control of visitors, vehicles, equipment (footbaths, disinfection, protective clothing); cleaning and disinfection, all-in-all-out, rodent/ bird control, safe disposal of carcasses; vaccination, records", 4)],
     "Biosecurity is the set of management practices that prevent disease-causing agents from entering a farm (bio-exclusion) and from spreading within or out of it (bio-containment), protecting animal health, productivity and public health. Key measures: (1) Isolation and quarantine - buy animals from healthy sources, keep new animals separate for 2-4 weeks and test or vaccinate them, and isolate sick animals. (2) Traffic control - fence the farm, limit visitors and vehicles, provide footbaths and disinfectant, protective clothing and boots, and clean and disinfect equipment shared with other farms. (3) Hygiene and sanitation - regular cleaning and disinfection of sheds, all-in-all-out systems in poultry and pigs, control of rodents, wild birds and flies, clean feed and water, and safe disposal of dead animals and manure. Supporting measures: vaccination and deworming programmes, health records and prompt reporting of suspected outbreaks."),
    ("Differentiate between probiotics and prebiotics.",
     [("Probiotics: live beneficial microorganisms (Lactobacillus, Bifidobacterium, Bacillus, yeast) given in adequate amounts", 2),
      ("Prebiotics: non-digestible feed ingredients (FOS, MOS, inulin) that selectively feed beneficial gut bacteria", 2),
      ("Differences: living vs non-living, mode of action, stability/ storage; both improve gut health, immunity, growth; synbiotics combine", 2)],
     "Probiotics are live beneficial microorganisms - such as Lactobacillus, Bifidobacterium, Bacillus species and yeast (Saccharomyces) - which, when fed in adequate amounts, colonise the gut, compete with pathogens, produce lactic acid and improve digestion and immunity. Prebiotics are non-living, non-digestible feed ingredients - such as fructo-oligosaccharides (FOS), mannan-oligosaccharides (MOS) and inulin - that pass undigested to the hind gut and selectively feed the beneficial bacteria already present (MOS also binds pathogens). So probiotics add good microbes while prebiotics are food for them; probiotics are sensitive to heat and storage, prebiotics are stable. Both improve gut health, feed efficiency and resistance to disease and are alternatives to antibiotic growth promoters; a mix of both is called a synbiotic."),
    ("Discuss the role of genetic selection in improving livestock productivity.",
     [("Genetic selection: choosing superior animals (high breeding value) as parents so desirable traits increase in following generations - permanent, cumulative gain", 2),
      ("Methods/ tools: performance and progeny testing, pedigree, breeding values (EBV), genomic selection, AI/ ET to spread superior genes, crossbreeding (Jersey/ HF with local)", 2),
      ("Benefits: milk yield, growth rate, feed efficiency, fertility, disease resistance, adaptation; Bhutan's breeding programmes; caution on inbreeding and local breed conservation", 2)],
     "Genetic selection means choosing animals with the best genetic merit (breeding value) for desired traits to be parents of the next generation, so the herd's average performance improves permanently and cumulatively in each generation. It relies on performance recording, pedigree and progeny testing, estimated breeding values and now genomic selection, with artificial insemination and embryo transfer spreading superior genes widely; crossbreeding (e.g. Jersey or Holstein Friesian with local Siri/Thrabum cattle in Bhutan) combines productivity with local adaptation. Selection increases milk yield, growth rate, feed conversion efficiency, fertility and disease resistance, and can target adaptation to climate and local feeds. It must be planned to avoid inbreeding and to conserve valuable local breeds."),
    ("What is HACCP? Explain the role of HACCP in meat inspection and how it contributes to food safety.",
     [("HACCP: Hazard Analysis and Critical Control Points - preventive, science-based food safety system; 7 principles (hazard analysis, CCPs, critical limits, monitoring, corrective actions, verification, records)", 3),
      ("Role in meat: identify biological/ chemical/ physical hazards from farm to slaughter and processing; CCPs e.g. ante/ post-mortem inspection, carcass chilling temperature, decontamination, hygiene; prevents contamination; complements traditional inspection; consumer protection, trade", 3)],
     "HACCP stands for Hazard Analysis and Critical Control Points - a preventive, science-based system for food safety that identifies hazards and controls them at specific points rather than relying only on testing the final product. Its seven principles are: conduct a hazard analysis; identify critical control points (CCPs); set critical limits; monitor CCPs; take corrective actions; verify the system; and keep records. In meat inspection, HACCP covers biological (Salmonella, E. coli, parasites), chemical (drug residues) and physical (metal, bone) hazards along the chain: CCPs include ante-mortem and post-mortem inspection, hygienic slaughter and evisceration, carcass washing/decontamination, chilling to below about 4-7 °C and cold-chain temperatures, and sanitation of equipment. Monitoring and corrective action at these points prevent contaminated meat reaching consumers, reduce food-borne illness, improve accountability and support meat trade and consumer confidence."),
]
for i, (s, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=6, topic=T, stem=s + " (6 marks)", key_points=kp, model=mod))

LA = [
    ("Fracture is one of the most common cases in veterinary clinics.\na) What is a fracture? (1 mark)\nb) Describe the different types of fracture, with diagrams. (9 marks)\nc) Describe the process of fracture healing. (10 marks)",
     [("a) Fracture: complete or incomplete break in the continuity of a bone", 1),
      ("b) Types: closed/ open (compound); complete/ incomplete (greenstick, fissure); by line - transverse, oblique, spiral, comminuted, segmental, avulsion, impacted, compression, epiphyseal (Salter-Harris), pathological; labelled sketches", 9),
      ("c) Healing stages: haematoma and inflammation (days), soft callus/ granulation tissue and fibrocartilage (1-3 weeks), hard (bony) callus (weeks), remodelling (months); primary vs secondary healing; factors: immobilisation, blood supply, age, nutrition, infection", 10)],
     """a) A fracture is a complete or incomplete break in the continuity of a bone, usually caused by trauma (or by disease weakening the bone).
b) Types: by skin - closed (simple: skin intact) and open (compound: bone communicates with a wound, high infection risk). By extent - complete (bone broken into separate pieces) and incomplete: greenstick (one cortex bends, common in young animals) and fissure (crack). By fracture line - transverse (at right angles to the long axis), oblique (at an angle), spiral (twisting force), comminuted (more than two fragments), segmental (a separate middle segment), avulsion (a fragment pulled off by a tendon or ligament), impacted (fragments driven into each other), compression (vertebrae) and physeal/epiphyseal fractures of the growth plate in young animals (Salter-Harris types I-V); and pathological fractures through diseased bone. [Each type is drawn as a simple labelled sketch of a long bone showing the fracture line.]
c) Fracture healing (secondary, with callus): (1) Haematoma and inflammation (first days) - bleeding forms a clot between the fragments; inflammatory cells clear debris and release growth factors. (2) Soft callus (about 1-3 weeks) - fibroblasts and new blood vessels form granulation tissue, and chondroblasts lay down fibrocartilage bridging the gap. (3) Hard callus (about 3-12 weeks) - osteoblasts replace cartilage with woven bone (endochondral ossification), uniting the fragments; the fracture becomes clinically stable. (4) Remodelling (months to years) - woven bone is replaced by lamellar bone and the callus is reshaped by osteoclasts and osteoblasts along stress lines, restoring the medullary canal. Primary (direct) healing occurs when fragments are rigidly fixed in close contact (plates), with little callus. Healing depends on good reduction and immobilisation (casts, splints, pins, plates), blood supply, age, nutrition (calcium, phosphorus, vitamin D, protein), absence of infection and the animal's health."""),
    ("Dairy farming is a growing enterprise in Bhutan; besides improving rural livelihoods and reducing poverty, it substitutes imports.\na) Outline the key considerations for starting a 10-cattle dairy farm, including infrastructure, feed and health management and labour. (10 marks)\nb) Analyse the economics of running such a farm by estimating costs, potential revenue and profitability over the first year. (10 marks)",
     [("a) Site, breed choice (Jersey/ HF cross), shed design (space ~3.5-4 m²/ cow, ventilation, drainage, feeding/ water troughs, calf pens, dung/ biogas, milk room, fodder storage), water, electricity, market access", 4),
      ("a) Feed: green fodder (improved pasture, fodder trees, silage), concentrate by yield, minerals, clean water, fodder land; health: vaccination (FMD, HS, BQ), deworming, mastitis control, biosecurity, AI/ breeding, records", 4),
      ("a) Labour: 2-3 workers (milking, feeding, cleaning), training; registration, credit, insurance", 2),
      ("b) Costs: capital (cows, shed, equipment) and recurring (feed, labour, vet, AI, electricity, transport); revenue: milk (yield x price), calves, manure/ cull cows; profit = revenue - costs, with stated assumptions; break-even/ payback", 10)],
     """a) Key considerations: Planning and site - a well-drained, accessible site near a milk collection centre or market, with water, electricity and land for fodder; a business plan and registration with the livestock office. Animals - 10 healthy, high-yielding crossbred cows (Jersey or Holstein Friesian crosses suited to the area), bought from disease-free sources with health certificates. Infrastructure - a cow shed of about 3.5-4 m² per cow plus feeding alley, with concrete sloped floor, drainage, mangers and water troughs, good ventilation, a calf pen, milking area and milk room, fodder and concentrate store, dung pit or biogas plant, and equipment (milk cans, chaff cutter, possibly a milking machine). Feed management - green fodder from improved pasture, fodder trees and silage for winter, plus concentrate (about 1 kg per 2-2.5 litres of milk above maintenance), mineral mixture and clean water ad lib. Health management - vaccination against FMD, HS and black quarter, regular deworming, mastitis prevention (clean milking, teat dipping), biosecurity, AI with good bulls, calving care and records. Labour - about 2-3 workers for feeding, milking twice daily, cleaning and fodder work, trained in hygiene. Also: market linkage (cooperative or dairy plant), credit and livestock insurance.
b) Example economics (illustrative figures - adjust to current local prices): Capital costs - 10 cows x Nu 60 000 = Nu 600 000; shed and store Nu 500 000; equipment Nu 100 000; total Nu 1 200 000 (depreciated: shed over 10 years = Nu 50 000/year, equipment 5 years = Nu 20 000/year; cows' value retained). Annual running costs - concentrate: 10 cows x 4 kg x 300 days x Nu 30 = Nu 360 000; fodder/silage and minerals Nu 150 000; labour 2 x Nu 12 000 x 12 = Nu 288 000; veterinary, AI and insurance Nu 50 000; electricity, transport and miscellaneous Nu 50 000; total about Nu 900 000 plus depreciation Nu 70 000 and interest on a loan (e.g. 10% of Nu 1 200 000 = Nu 120 000) = Nu 1 090 000. Revenue - milk: 10 cows x 10 litres/day x 300 lactation days = 30 000 litres x Nu 45 = Nu 1 350 000; calves sold Nu 60 000; manure Nu 20 000; total Nu 1 430 000. Profit in the first year ≈ Nu 1 430 000 - Nu 1 090 000 = Nu 340 000 (about Nu 28 000 per month), a return of about 28% on capital and a payback of about 3.5 years. Profitability depends mainly on milk yield per cow, the share of home-grown fodder (cheaper than concentrate), the milk price and calving interval; the first year may be lower if cows are dry or still adapting."""),
    ("Proximate analysis is a fundamental method used in animal nutrition to determine the basic composition of feed ingredients.\na) Describe the process of proximate analysis and explain the significance of each component measured. (10 marks)\nb) How does proximate analysis help in evaluating the nutritional value of animal feed, and what are its limitations? (10 marks)",
     [("a) Weende system: moisture/ dry matter (oven 105 °C), crude protein (Kjeldahl N x 6.25), ether extract (Soxhlet), crude fibre (acid and alkali digestion), total ash (550-600 °C), NFE by difference", 6),
      ("a) Significance of each: DM - nutrient concentration/ storage; CP - protein supply; EE - energy; CF - fibre/ digestibility; ash - minerals; NFE - soluble carbohydrates/ energy", 4),
      ("b) Uses: compare feeds, formulate rations, quality control/ adulteration, estimate energy (TDN), price feeds", 5),
      ("b) Limitations: CF does not measure true fibre (lignin, hemicellulose lost into NFE; Van Soest better); CP includes NPN; EE includes non-nutritive lipids; ash no individual minerals; NFE by difference accumulates errors; no digestibility, vitamins, amino acids", 5)],
     """a) Proximate (Weende) analysis divides a feed into six fractions: (1) Moisture and dry matter - a weighed sample is dried at about 100-105 °C to constant weight; dry matter shows the true nutrient concentration and keeping quality (high moisture spoils). (2) Crude protein - nitrogen is measured by the Kjeldahl method (digestion with sulphuric acid, distillation, titration) and multiplied by 6.25; it shows the protein supply for growth and milk. (3) Ether extract (crude fat) - extracted with ether or petroleum ether in a Soxhlet apparatus; indicates energy-rich fats and oils. (4) Crude fibre - the fat-free residue is boiled with dilute acid (1.25% H2SO4) then dilute alkali (1.25% NaOH), and the dried residue minus ash is crude fibre; indicates the less digestible structural carbohydrate, important for ruminants and for limiting intake in monogastrics. (5) Total ash - the sample is burnt in a muffle furnace at about 550-600 °C; the residue indicates total mineral content (and sand contamination). (6) Nitrogen-free extract (NFE) - calculated by difference: 100 - (moisture + CP + EE + CF + ash); represents soluble carbohydrates such as sugars and starch, a main energy source.
b) Uses: it gives a quick, cheap and standard picture of feed composition, so feeds can be compared and ranked, rations formulated to meet protein and energy needs, energy values estimated (e.g. TDN from the fractions), feed quality checked against standards and adulteration detected, and feeds priced and traded on their composition. Limitations: crude fibre does not represent true fibre - part of the lignin and hemicellulose dissolves and is wrongly counted in NFE, so the detergent system (NDF, ADF, ADL by Van Soest) is better for forages; crude protein includes non-protein nitrogen and says nothing about amino acids or protein quality; ether extract includes non-nutritive substances such as waxes and pigments; ash gives no information on individual minerals; NFE is obtained by difference and accumulates all errors; and the method gives no information on digestibility, vitamins, energy availability or anti-nutritional factors, so it must be complemented by other analyses and feeding trials."""),
    ("Artificial insemination is a widely used breed improvement technology in Bhutan.\na) Discuss the process of artificial insemination (AI) in livestock, including its advantages and limitations. (10 marks)\nb) Explain the key steps in the AI procedure, the factors affecting its success, and the role of AI in improving livestock genetics and productivity. (10 marks)",
     [("a) Process: semen collection from proven bulls (artificial vagina), evaluation, dilution/ extension, freezing in straws, liquid nitrogen storage, heat detection, thawing, deposition in uterus", 4),
      ("a) Advantages: superior bulls' genes widely used, no need to keep bulls, disease control (venereal), cheaper, records, crossbreeding; limitations: skilled technicians, heat detection, liquid nitrogen logistics in remote areas, possible inbreeding, lower conception if poor technique", 6),
      ("b) Steps: detect heat, timing (am-pm rule, 12-18 h after onset), thaw straw at 37 °C for ~30 s, load gun, rectovaginal method, deposit in uterine body, records, pregnancy diagnosis at 60-90 days", 4),
      ("b) Success factors: semen quality and handling, timing, technician skill, cow nutrition/ BCS, health, heat stress; role: genetic gain, milk yield, crossbreeding programmes, breed conservation (sexed semen)", 6)],
     """a) Process: semen is collected from genetically superior, disease-free bulls (in Bhutan at the National Livestock Breeding Programme centres) using an artificial vagina; it is evaluated for volume, concentration and motility, diluted with an extender, packed in straws, frozen and stored in liquid nitrogen at -196 °C. Straws are distributed to AI centres and technicians, who detect cows in heat, thaw the semen and deposit it into the cow's reproductive tract. Advantages: semen from one proven bull can inseminate thousands of cows, spreading superior genetics quickly and allowing planned crossbreeding (e.g. Jersey and Holstein Friesian); farmers do not need to keep bulls; venereal diseases are controlled; semen can be stored and transported over long distances and used even after the bull's death; and records support breeding programmes. Limitations: it needs trained technicians, accurate heat detection and a liquid nitrogen supply chain, which is difficult in remote areas of Bhutan; poor handling or timing lowers conception; overuse of a few bulls can increase inbreeding; and initial costs for equipment and training.
b) Key steps: (1) detect oestrus - standing to be mounted, mucus discharge, restlessness, bellowing; (2) time the insemination - by the am-pm rule (a cow seen in heat in the morning is inseminated that evening, one seen in the evening the next morning, about 12-18 hours after onset); (3) thaw the straw in water at about 35-37 °C for 30-45 seconds, dry it, cut the end and load the AI gun with a sheath; (4) restrain the cow, clean the vulva, and by the recto-vaginal method guide the gun through the cervix and deposit the semen in the uterine body; (5) record the date and bull, and confirm pregnancy by rectal palpation or ultrasound at about 60-90 days. Factors affecting success: semen quality, storage and thawing; correct timing; technician skill and hygiene; the cow's nutrition and body condition, reproductive health (no infections or cysts), heat stress and good heat detection by farmers. Role: AI is the main tool for genetic improvement, raising milk yield and growth through crossbreeding and progeny-tested sires; it enables national breeding programmes, conservation of local breeds (Nublang, Mithun crosses) and, with sexed semen, more female calves - increasing productivity and farmers' income."""),
]
for i, (s, kp, mod) in enumerate(LA):
    Q.append(dict(key=f"L{i + 1}", real=True, type="long_answer", marks=20, topic=T, stem=s, key_points=kp, model=mod,
                  issues=(["Illustrative cost and price figures: an expert should check current Bhutan prices."] if i == 1 else [])))
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions (answer any 5 of 6)", "type": "short_answer", "count": 6, "marks_each": 6, "answer_any": 5},
    {"title": "Section B: Long answer questions (answer any 2 of 4)", "type": "long_answer", "count": 4, "marks_each": 20, "answer_any": 2},
]
