"""ME Technical Paper II (General Subject Knowledge), CONSERVATOR group, BCSE 2025 - real paper. PDF sent by the founder.
Pattern: Part I 70 MCQ x 1; Part II answer ANY 6 of 9 short-answer questions x 5 (30). 90 min + 15 min reading.
Left out: MCQ 3 (first step of acquisition - two defensible answers), 10 (register vs inventory), 49 and 55 (same
question printed twice; moths vs carpet beetles both defensible), 62 (TMS vs CMS), 68 (repeat of 60); six new MCQs
keep Part I at 70.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Conservator): BCSE 2025, batch 1"
GROUP_TAG = "cons2025"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "conservator"
MIN_WORDS = 0
GROUP_TIMING = {"duration": 90, "reading": 15, "max_marks": 100}
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 9, "marks_each": 5, "answer_any": 6},
]
TOPIC = "Conservator: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following is an ethical obligation of a conservator?",
"opts": [
"Speed over documentation",
"Reversibility of treatment",
"Permanent alteration",
"Total restoration of missing parts"
]
},
{
"n": 2,
"stem": "A condition report is typically prepared:",
"opts": [
"After conservation only",
"When displaying objects",
"Before and after loans or treatments",
"During inventory checks only"
]
},
{
"n": 3,
"stem": "What is the first step in acquiring a new object into a collection?",
"opts": [
"Curatorial approval",
"Accessioning",
"Insurance",
"Valuation"
]
},
{
"n": 4,
"stem": "Who is primarily responsible for maintaining collections records?",
"opts": [
"Gallery assistant",
"Director",
"Front desk staff",
"Collections manager"
]
},
{
"n": 5,
"stem": "Which document legally records ownership transfer of an object?",
"opts": [
"Condition report",
"Deed of gift",
"Loan agreement",
"Accession record"
]
},
{
"n": 6,
"stem": "Inventory in museums is:",
"opts": [
"A funding report",
"A marketing tool",
"A complete list of all collections",
"A list of missing items"
]
},
{
"n": 7,
"stem": "Which field in a collection record is essential?",
"opts": [
"Object condition",
"Artist’s biography",
"Personal opinions",
"Entry ticket revenue"
]
},
{
"n": 8,
"stem": "What is an accession number?",
"opts": [
"Security code",
"Unique identifier for a collection item",
"Object size",
"Material type"
]
},
{
"n": 9,
"stem": "The purpose of cataloging is to:",
"opts": [
"Sell objects",
"Organize ticket sales",
"Provide detailed object descriptions",
"Promote exhibitions"
]
},
{
"n": 10,
"stem": "A master list of all objects in a collection is called:",
"opts": [
"Ledger",
"Catalog",
"Register",
"Inventory"
]
},
{
"n": 11,
"stem": "What is the main purpose of digitization in collections?",
"opts": [
"Increase physical storage",
"Provide online access and preservation",
"Improve ticketing systems",
"Enable e-commerce"
]
},
{
"n": 12,
"stem": "Who typically approves high-value acquisitions in a museum?",
"opts": [
"Guards",
"Conservators",
"Board or acquisition committee",
"Visitors"
]
},
{
"n": 13,
"stem": "The best place to store collection records is:",
"opts": [
"On paper only",
"In secure physical and digital formats",
"In open folders",
"In public galleries"
]
},
{
"n": 14,
"stem": "Which of the following helps ensure accurate collection tracking?",
"opts": [
"Random inspections",
"Loan agreements",
"Barcode or RFID tagging",
"Lighting checks"
]
},
{
"n": 15,
"stem": "Loan documentation includes:",
"opts": [
"Loan agreements and insurance details",
"Object recipes",
"Ticket sales",
"Artist payments"
]
},
{
"n": 16,
"stem": "Which of the following is not typically included in a condition report?",
"opts": [
"Object description",
"Loan terms",
"Damage notes",
"Photographs"
]
},
{
"n": 17,
"stem": "Relative humidity should ideally be maintained at:",
"opts": [
"90–95%",
"30–35%",
"45–55%",
"10–15%"
]
},
{
"n": 18,
"stem": "Which is NOT a preventive conservation measure?",
"opts": [
"Structural restoration",
"Fire safety systems",
"Pest control",
"Stable storage environment"
]
},
{
"n": 19,
"stem": "Museum pests include all except:",
"opts": [
"Silverfish",
"Termites",
"Carpet beetles",
"Earthworms"
]
},
{
"n": 20,
"stem": "Which material is most sensitive to humidity?",
"opts": [
"Ceramic",
"Textile",
"Stone",
"Metal"
]
},
{
"n": 21,
"stem": "Light damage is particularly severe for:",
"opts": [
"Bronze sculptures",
"Painted walls",
"Wooden masks",
"Paper, textile, and photographs"
]
},
{
"n": 22,
"stem": "How can pests be detected early in a museum?",
"opts": [
"Using light sensors",
"Conducting audience surveys",
"Using sticky traps and inspections",
"Painting galleries"
]
},
{
"n": 23,
"stem": "What is the function of silica gel in storage?",
"opts": [
"Pest repellent",
"Humidity control",
"Cleaning agent",
"Flame retardant"
]
},
{
"n": 24,
"stem": "Integrated Pest Management focuses on:",
"opts": [
"Killing all pests immediately",
"Biological collections",
"Monitoring and non-toxic controls",
"Using pesticides regularly"
]
},
{
"n": 25,
"stem": "Which of the following should NOT be used in storage?",
"opts": [
"Acid-free tissue",
"Wooden boxes with no sealant",
"Archival-quality boxes",
"Mylar sleeves"
]
},
{
"n": 26,
"stem": "Microclimate control is often used in:",
"opts": [
"Ticket counters",
"Display cases for sensitive materials",
"Outdoor exhibits",
"Museum gardens"
]
},
{
"n": 27,
"stem": "The ideal light level for paper-based items is:",
"opts": [
"1000 lux",
"500 lux",
"50 lux",
"100 lux"
]
},
{
"n": 28,
"stem": "Which of the following materials is most vulnerable to oxidation?",
"opts": [
"Metal",
"Textile",
"Ceramic",
"Stone"
]
},
{
"n": 29,
"stem": "Fluctuating environmental conditions can cause:",
"opts": [
"Better visitor experiences",
"Cracking, warping, and mold",
"Increased security",
"Staff fatigue"
]
},
{
"n": 30,
"stem": "Best practice for cleaning display cases is:",
"opts": [
"Daily with soap",
"Monthly with water",
"Regularly with appropriate dry methods",
"Annually with oils"
]
},
{
"n": 31,
"stem": "Which of the following is a major pollutant in museums?",
"opts": [
"Sulfur dioxide",
"Carbon monoxide",
"Oxygen",
"Inert gases"
]
},
{
"n": 32,
"stem": "Relative humidity below 30% can cause:",
"opts": [
"Mold growth",
"Rusting",
"Drying and cracking",
"Insect infestation"
]
},
{
"n": 33,
"stem": "Buffer zones in museum buildings help with:",
"opts": [
"Environmental stabilization",
"Visitor parking",
"Emergency exits",
"Object tagging"
]
},
{
"n": 34,
"stem": "Which principle requires that all conservation work be undoable?",
"opts": [
"Minimalism",
"Reversibility",
"Efficiency",
"Transparency"
]
},
{
"n": 35,
"stem": "The Royal Heritage Museum of Bhutan is located in:",
"opts": [
"Thimphu",
"Paro",
"Bumthang",
"Trongsa"
]
},
{
"n": 36,
"stem": "Conservation of sacred objects must also consider:",
"opts": [
"Only scientific values",
"Legal ownership",
"Age of the item",
"Ritual significance and community consultation"
]
},
{
"n": 37,
"stem": "Which Bhutanese authority regulates cultural heritage?",
"opts": [
"NEC",
"Department of Culture & Dzongkha Development",
"MoEA",
"Ministry of Labour"
]
},
{
"n": 38,
"stem": "Which material is used in traditional Bhutanese mural painting?",
"opts": [
"Natural earth pigments",
"Acrylic",
"Oil",
"Synthetic dyes"
]
},
{
"n": 39,
"stem": "Which of the following is NOT an ethical principle in conservation?",
"opts": [
"Documentation",
"Reversibility",
"Irreversible alteration",
"Minimum intervention"
]
},
{
"n": 40,
"stem": "Who must often be consulted before treating sacred artifacts in Bhutan?",
"opts": [
"Tour guides",
"Monastic representatives or lams",
"Insurance agents",
"Art dealers"
]
},
{
"n": 41,
"stem": "In Bhutan, heritage sites are considered:",
"opts": [
"Tourist zones",
"Ruins",
"Living cultural spaces",
"Commercial centers"
]
},
{
"n": 42,
"stem": "What is a “Salvage Priority List” in a Disaster Management Plan?",
"opts": [
"Budget allocation sheet",
"Ranking of collections by cultural and conservation value for rescue",
"List of pest control chemicals",
"Emergency contacts only"
]
},
{
"n": 43,
"stem": "Which of the following is a key component of emergency preparedness?",
"opts": [
"Audio guides",
"First-aid training",
"Climate survey",
"Catalog publication"
]
},
{
"n": 44,
"stem": "The most appropriate first step when a flood threatens museum collections is:",
"opts": [
"Remove objects to a secure dry area",
"Turn off lights",
"Inform the media",
"Close ticket counters"
]
},
{
"n": 45,
"stem": "The \"Triangle of Fire\" includes:",
"opts": [
"Fuel, oxygen, heat",
"Water, electricity, fuel",
"Smoke, light, gas",
"Flame, object, person"
]
},
{
"n": 46,
"stem": "Cellulose-based materials (e.g., paper and textiles) degrade mainly due to:",
"opts": [
"Microbial activity",
"Photochemical reactions",
"Acid hydrolysis",
"Salt accumulation"
]
},
{
"n": 47,
"stem": "Which of the following is the primary purpose of a museum?",
"opts": [
"Entertainment",
"Preservation and education",
"Commercial trade",
"Tourism only"
]
},
{
"n": 48,
"stem": "Copper artifacts commonly develop a green layer called:",
"opts": [
"Tannin",
"Carbonate",
"Patina",
"Silicate"
]
},
{
"n": 49,
"stem": "Which type of pest is most destructive to ethnographic textiles?",
"opts": [
"Silverfish",
"Carpet beetles",
"Termites",
"Moths"
]
},
{
"n": 50,
"stem": "What accelerates corrosion in iron artifacts?",
"opts": [
"Fluctuating RH and chlorides",
"Constant freezing",
"Humidity below 30%",
"Strong light"
]
},
{
"n": 51,
"stem": "Which chemical is used to detect acidic degradation in paper?",
"opts": [
"Acetone",
"Ethanol",
"pH indicator (methyl orange or phenolphthalein)",
"Vinegar"
]
},
{
"n": 52,
"stem": "Minimum intervention in conservation means:",
"opts": [
"Using modern synthetic coatings",
"Avoiding unnecessary treatment",
"Fully restoring damaged objects",
"Always replacing missing parts"
]
},
{
"n": 53,
"stem": "Which international body developed the 1970 Convention on cultural property?",
"opts": [
"ICOMOS",
"UNHCR",
"ICCROM",
"UNESCO"
]
},
{
"n": 54,
"stem": "What should be included in a conservation treatment report?",
"opts": [
"Steps taken, materials used, and photographs",
"Artist biography",
"Visitor numbers",
"Loan history"
]
},
{
"n": 55,
"stem": "Which type of pest is most destructive to ethnographic textiles?",
"opts": [
"Silverfish",
"Carpet beetles",
"Termites",
"Moths"
]
},
{
"n": 56,
"stem": "Ethics in conservation requires:",
"opts": [
"Secrecy of treatments",
"Artistic interpretation",
"Transparency and documentation",
"Fast treatments only"
]
},
{
"n": 57,
"stem": "Which document is referred to for the ethical return of looted cultural objects?",
"opts": [
"Paris Protocol",
"UNESCO 2003 Convention",
"Hague Convention",
"UNESCO 1970 Convention"
]
},
{
"n": 58,
"stem": "Bhutanese textiles are often dyed with:",
"opts": [
"Synthetic dyes only",
"Vegetable and mineral dyes",
"Animal blood",
"Plastic-based pigments"
]
},
{
"n": 59,
"stem": "When handling fragile textiles, one must:",
"opts": [
"Wear gloves and use support trays",
"Fold tightly for storage",
"Use plastic wrap",
"Wash before display"
]
},
{
"n": 60,
"stem": "The best way to store sacred textiles long-term is:",
"opts": [
"Hanging in direct light",
"Sealed in airtight plastic",
"Rolled on acid-free tubes in low light",
"Folded in wooden cabinets"
]
},
{
"n": 61,
"stem": "In digitization, which of the following is most important?",
"opts": [
"Color correction",
"Physical handling care and metadata entry",
"Selling online",
"Increasing ticket sales"
]
},
{
"n": 62,
"stem": "Which documentation system is most commonly used in museums for collections management?",
"opts": [
"SWOT",
"TMS",
"ISO",
"CMS"
]
},
{
"n": 63,
"stem": "The ideal temperature range for most museum storage is:",
"opts": [
"0–5°C",
"10–18°C",
"18–22°C",
"25–30°C"
]
},
{
"n": 64,
"stem": "Which of the following is a preventive conservation method?",
"opts": [
"Humidifying a painting",
"Using a conservation-grade mount board",
"Repainting flaked areas",
"Reweaving damaged textile areas"
]
},
{
"n": 65,
"stem": "A digital Collections Management System (CMS) helps museums to:",
"opts": [
"Display virtual exhibitions only",
"Store visitor data",
"Track, document, and manage collections efficiently",
"Print tickets"
]
},
{
"n": 66,
"stem": "UV light exposure primarily affects:",
"opts": [
"Stone",
"Metal",
"Ceramics",
"Organic materials like textiles and paper"
]
},
{
"n": 67,
"stem": "Ta Dzong, which houses the National Museum, is historically significant because:",
"opts": [
"It is the oldest palace in Bhutan",
"It served as a watchtower and has unique architecture",
"It is the seat of government",
"It was built by foreign conservators"
]
},
{
"n": 68,
"stem": "The best way to store sacred textiles long-term is:",
"opts": [
"Rolled on acid-free tubes in low light",
"Sealed in airtight plastic",
"Hanging in direct light",
"Folded in wooden cabinets"
]
},
{
"n": 69,
"stem": "Conservation of thangkas often requires:",
"opts": [
"Retouching the paint",
"Minimal handling and stabilized storage",
"Removing silk covers",
"Framing under glass"
]
},
{
"n": 70,
"stem": "Bronze disease in metal artifacts is caused by:",
"opts": [
"Fungus growth",
"Copper chlorides and moisture",
"Dust accumulation",
"High temperature"
]
}
]"""

KEY = {
 1: ("b", "Treatments should be reversible where possible."),
 2: ("c", "Condition reports are made before and after loans or treatments."),
 4: ("d", "The collections manager maintains collection records."),
 5: ("b", "A deed of gift legally transfers ownership."),
 6: ("c", "An inventory is a complete list of the collections."),
 7: ("a", "Object condition is an essential record field."),
 8: ("b", "The accession number uniquely identifies each item."),
 9: ("c", "Cataloguing gives detailed object descriptions."),
 11: ("b", "Digitisation gives online access and supports preservation."),
 12: ("c", "High-value acquisitions are approved by the board or acquisition committee."),
 13: ("b", "Keep records securely in both physical and digital form."),
 14: ("c", "Barcodes or RFID tags help track objects accurately."),
 15: ("a", "Loan files include the agreement and insurance details."),
 16: ("b", "Loan terms belong in the loan agreement, not the condition report."),
 17: ("c", "About 45-55% RH suits most mixed collections."),
 18: ("a", "Structural restoration is an interventive treatment, not preventive."),
 19: ("d", "Earthworms are not museum pests."),
 20: ("b", "Textiles (organic, hygroscopic) are most sensitive to humidity among these."),
 21: ("d", "Paper, textiles and photographs are most light-sensitive."),
 22: ("c", "Sticky (blunder) traps and regular inspection detect pests early."),
 23: ("b", "Silica gel buffers relative humidity."),
 24: ("c", "IPM relies on monitoring and non-toxic controls."),
 25: ("b", "Unsealed wood emits acids that damage objects."),
 26: ("b", "Microclimates are created inside display cases for sensitive objects."),
 27: ("c", "About 50 lux for light-sensitive paper."),
 28: ("a", "Metals oxidise (corrode)."),
 29: ("b", "Fluctuations cause cracking, warping and mould."),
 30: ("c", "Clean regularly with suitable dry methods."),
 31: ("a", "Sulphur dioxide is a major damaging pollutant."),
 32: ("c", "Very low RH dries out and cracks organic materials."),
 33: ("a", "Buffer zones stabilise the environment."),
 34: ("b", "Reversibility: treatments can be undone."),
 35: ("d", "The Royal Heritage Museum is in the Ta Dzong of Trongsa."),
 36: ("d", "Sacred objects need consideration of ritual significance and the community."),
 37: ("b", "The Department of Culture and Dzongkha Development regulates heritage."),
 38: ("a", "Traditional murals use natural earth (mineral) pigments."),
 39: ("c", "Irreversible alteration violates conservation ethics."),
 40: ("b", "Monastic representatives or lams must be consulted for sacred objects."),
 41: ("c", "Heritage sites in Bhutan are living cultural spaces."),
 42: ("b", "It ranks collections for rescue by value and vulnerability."),
 43: ("b", "First-aid and emergency training are part of preparedness."),
 44: ("a", "Move objects to a secure, dry area first."),
 45: ("a", "Fuel, oxygen and heat."),
 46: ("c", "Acid hydrolysis breaks cellulose chains (e.g. acidic paper)."),
 47: ("b", "Museums preserve heritage and educate."),
 48: ("c", "The green layer on copper is patina (copper carbonates)."),
 50: ("a", "Chlorides with fluctuating humidity accelerate iron corrosion."),
 51: ("c", "pH indicators reveal acidity in paper."),
 52: ("b", "Minimum intervention: avoid unnecessary treatment."),
 53: ("d", "The 1970 Convention on illicit trafficking is a UNESCO convention."),
 54: ("a", "Treatment reports record steps, materials and photographs."),
 56: ("c", "Ethics require transparency and documentation."),
 57: ("d", "The UNESCO 1970 Convention guides return of illicitly exported property."),
 58: ("b", "Traditional Bhutanese dyes are vegetable and mineral."),
 59: ("a", "Wear gloves and support fragile textiles on trays."),
 60: ("c", "Roll on acid-free tubes and keep in low light."),
 61: ("b", "Careful handling and good metadata matter most."),
 63: ("c", "About 18-22 °C."),
 64: ("b", "Conservation-grade mount board is a preventive measure."),
 65: ("c", "A CMS tracks, documents and manages collections."),
 66: ("d", "UV damages organic materials such as textiles and paper."),
 67: ("b", "Ta Dzong was a watchtower with distinctive round architecture."),
 69: ("b", "Thangkas need minimal handling and stable storage."),
 70: ("b", "Bronze disease is caused by copper chlorides with moisture."),
}

NEW_MCQ = [
 ("The process of formally recording an object as part of a museum's permanent collection is called", ("deaccessioning", "accessioning", "conservation", "exhibition"), "b", "Accessioning formally adds an object to the collection."),
 ("The book in which accession numbers and basic details of all accessioned objects are written in order is the", ("visitor book", "accession register", "loan agreement", "condition report"), "b", "The accession register is the permanent master record."),
 ("Which insect is a major pest of wool and silk textiles in museums?", ("Termite", "Clothes moth", "Housefly", "Mosquito"), "b", "Larvae of clothes moths feed on keratin in wool and silk."),
 ("Which of the following is NOT an agent of deterioration?", ("Light", "Pests", "Incorrect relative humidity", "Proper documentation"), "d", "Documentation protects collections; the others damage them."),
 ("Removing an object permanently from a museum collection is called", ("accessioning", "cataloguing", "deaccessioning", "digitisation"), "c", "Deaccessioning is the formal removal of an object."),
 ("Acid-free materials are used in storage mainly to", ("make boxes heavier", "prevent acid migration and yellowing", "attract pests", "increase humidity"), "b", "Acid-free materials do not release acids into objects."),
]

def sa(stem, kp, model):
    return dict(marks=5, stem=stem + " (5 marks)", kp=kp, model=model)

SAQ = [
 sa("Explain the principle of preventive conservation with two practical examples.",
    [("Principle: indirect measures that slow deterioration of whole collections by controlling the environment and risks, rather than treating individual objects", 2), ("Example 1 explained (e.g. RH/temperature control with dehumidifiers, silica gel)", 1.5), ("Example 2 explained (e.g. light control, IPM, proper storage and handling, disaster preparedness)", 1.5)],
    "Preventive conservation means taking indirect measures to avoid or slow deterioration of whole collections by controlling the agents of deterioration (light, relative humidity, temperature, pests, pollutants, handling, disasters), instead of waiting to treat damaged objects. It is cheaper and less invasive than interventive treatment. Example 1: controlling the environment, e.g. keeping relative humidity around 45-55% and temperature 18-22 °C using dehumidifiers, silica gel and sealed cases, which prevents mould, cracking and corrosion. Example 2: integrated pest management - regular inspection, sticky traps, good housekeeping and quarantine of new objects - and limiting light to about 50 lux with UV filters for textiles, thangkas and paper."),
 sa("What are the main components of a Conservation Guideline Policy, and why are they important?",
    [("Purpose, scope and ethical principles (minimum intervention, reversibility, respect for cultural/religious value)", 1.5), ("Preventive conservation standards (environment, storage, handling, pest, emergency) and treatment procedures/approval", 1.5), ("Documentation, responsibilities/qualified staff, training, review", 1), ("Importance: consistency, accountability, protects collections long term, guides decisions", 1)],
    "A Conservation Guideline Policy usually includes: (1) purpose, scope and ethical principles such as minimum intervention, reversibility and respect for the cultural and religious significance of objects; (2) preventive conservation standards for environment, storage, display, handling, pest management and emergency preparedness; (3) procedures for examination, treatment proposals, approval and use of qualified conservators; (4) documentation requirements; (5) roles, training, resources and periodic review. It is important because it ensures all staff follow the same standards, makes decisions transparent and accountable, prevents harmful or unauthorised treatments, and protects collections for future generations."),
 sa("Define Collections Management Policy and outline its key impacts on museum operations.",
    [("Definition: formal document approved by the governing body stating how the museum acquires, documents, cares for, uses, lends and disposes of its collections", 2), ("Impacts: guides acquisition and deaccession decisions; standardises documentation and loans; access/use rules; risk and care standards", 2), ("Accountability, legal/ethical compliance, planning and resource allocation", 1)],
    "A Collections Management Policy is a formal document, approved by the museum's governing body, that sets out the museum's purpose and the rules for acquiring, accessioning, documenting, caring for, using, lending and deaccessioning its collections. Impacts: it guides what may be acquired and how objects are disposed of; it standardises documentation, inventory and loan procedures; it sets standards for storage, conservation and security; it defines access for research, exhibitions and communities; and it ensures legal and ethical compliance and accountability, helping management plan resources and avoid inappropriate decisions."),
 sa("Explain how environmental factors (temperature, humidity, light) affect collections.",
    [("Temperature: high temperature speeds chemical decay and pest activity; fluctuations cause expansion/contraction", 1.5), ("Humidity: high RH - mould, corrosion, swelling; low RH - drying, cracking, brittleness; fluctuation - warping, flaking", 2), ("Light (visible and UV): fading, yellowing, embrittlement of organic materials; damage is cumulative", 1.5)],
    "Temperature: heat speeds up chemical reactions such as oxidation and acid hydrolysis and encourages insects and mould; rapid changes make materials expand and contract, causing cracks. Relative humidity: high RH (above about 65%) causes mould, corrosion of metals and swelling of wood and textiles; low RH (below about 30%) dries and cracks wood, paint, leather and paper; fluctuating RH causes warping and flaking of paint layers. Light: visible and especially ultraviolet light fade dyes and pigments, yellow paper and weaken textiles; the damage is cumulative and irreversible, so light levels and exposure time must be limited."),
 sa("Describe the key components of a Conservation Guideline Policy and its impact on the long-term preservation of museum collections.",
    [("Components: ethics and principles, preventive conservation standards, treatment procedures and approval, documentation, emergency planning, roles and training", 3), ("Impact: consistent care, fewer damaging interventions, early risk control, records for future, sustained preservation", 2)],
    "Key components: statement of ethical principles (minimum intervention, reversibility, respect for sacred and cultural values); standards for environment, storage, display and handling; integrated pest management; procedures for condition surveys, treatment proposals and approval by qualified conservators; documentation of all examinations and treatments; emergency and disaster planning; and staff roles and training. Impact: the policy ensures consistent, ethical care; reduces risky or unnecessary treatments; controls agents of deterioration before damage occurs; and keeps records that guide future conservators, so collections survive longer for future generations."),
 sa("Outline the steps involved in assessing and treating a fragile textile object in a heritage museum. Include ethical considerations.",
    [("Assessment: examination, condition report, photographs, identify fibres/dyes, causes of damage; research significance", 1.5), ("Treatment plan agreed (with curator/community); minimal, reversible methods: surface cleaning (low suction), humidification, support stitching onto fabric, padded mounts", 1.5), ("Storage/display after treatment: acid-free, rolled or flat, low light, stable RH", 1), ("Ethics: minimum intervention, reversibility, documentation, respect for religious significance and consult monastic body", 1)],
    "1. Examine and document: handle minimally with gloves and support; record condition with notes and photographs; identify fibres, dyes and earlier repairs; assess causes of damage. 2. Research significance and consult the curator and, for sacred textiles, the monastic body or community. 3. Prepare a treatment proposal and obtain approval. 4. Treat using the least invasive, reversible methods: gentle surface cleaning with low-suction vacuum through screening, controlled humidification to relax creases, and stabilising tears by stitching onto a dyed support fabric with fine silk thread rather than replacing missing parts. 5. Re-house on acid-free supports, rolled or flat, in low light and stable RH, and record the full treatment. Ethics: minimum intervention, reversibility, honesty (no disguised additions), full documentation and respect for the object's ritual meaning."),
 sa("What are the essential elements of a Disaster Management Plan for museums, especially those housed in heritage buildings like Ta Dzongs?",
    [("Risk assessment of hazards (fire, earthquake, flood, theft) and building vulnerabilities; prevention measures (fire detectors, extinguishers, wiring, seismic strengthening)", 1.5), ("Emergency response: team roles, contact list, evacuation routes for people, salvage priority list and grab kits", 1.5), ("Recovery: salvage procedures, documentation, insurance, conservation of damaged objects", 1), ("Training, drills, coordination with fire services/Dzongkhag, regular review", 1)],
    "Essential elements: (1) risk assessment of hazards such as fire (butter lamps, old wiring, wooden structures), earthquakes, floods, storms and theft; (2) prevention and mitigation: fire detection and suppression, safe electrical wiring, lightning protection, seismic strengthening, secure storage; (3) an emergency response plan with an emergency team, clear roles, contact lists, evacuation routes for visitors and staff, and a salvage priority list of the most important objects with emergency kits; (4) recovery procedures for drying, stabilising and documenting damaged objects, insurance and conservation; (5) regular training and drills, coordination with fire services, Desuups and the Dzongkhag, and periodic review of the plan."),
 sa("Discuss the role of preventive conservation in museum collections care. Give examples relevant to Bhutan's climate and materials.",
    [("Role: slows deterioration of whole collections, cost-effective, reduces need for treatment", 1.5), ("Bhutan climate: humid monsoon (mould, insects) and dry cold winters (cracking); altitude and temperature swings; earthquakes, fire from butter lamps", 1.5), ("Examples for Bhutanese materials: thangkas, textiles, wooden masks, manuscripts - dehumidifiers/silica gel, IPM, low light, acid-free storage, fire safety", 2)],
    "Preventive conservation protects whole collections by controlling risks before damage happens, which is more effective and cheaper than repairing objects later. In Bhutan, the summer monsoon brings high humidity that causes mould on thangkas, textiles and manuscripts and encourages insects, while dry, cold winters cause wooden masks, painted objects and leather to crack; daily temperature swings, earthquakes and fire from butter lamps are further risks. Examples: using dehumidifiers, silica gel and sealed cases during the monsoon; integrated pest management with traps and inspections for textiles and paper; limiting light and UV for thangkas; storing manuscripts and textiles in acid-free boxes; keeping butter lamps away from collections and installing fire detection; and securing objects against earthquakes."),
 sa("Explain the importance of documentation in conservation treatments. How does it support accountability and future decision-making?",
    [("Documentation records condition before, during and after treatment: photographs, analysis, methods, materials, dates, conservator", 1.5), ("Accountability: proves what was done and why, by whom; transparency to owners, curators, communities; meets ethics", 1.5), ("Future decisions: shows previous materials so they can be reversed/avoided; tracks change over time; supports research, loans, insurance", 2)],
    "Documentation is a permanent record of an object's condition before, during and after treatment, including photographs, test results, the treatment steps, materials and methods used, dates and the conservator's name. It supports accountability because it shows exactly what was done, why and by whom, so owners, curators and religious communities can check that ethical standards were followed and that no undisclosed changes were made. It supports future decisions because later conservators know which materials were added and can reverse or avoid them, can compare condition over time to judge whether deterioration is continuing, and can use the information for research, loans, insurance and disaster recovery."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
