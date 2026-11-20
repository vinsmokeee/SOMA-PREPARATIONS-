"""ME Technical Paper III (Subject Specialisation Paper), Conservator, BCSE 2025 - real paper (PDF sent by the founder).
The cover instructions are inconsistent (they mention 50 MCQ, 10 short answers and 50 minutes); the questions themselves
follow the standard pattern used here: Section A Part I 30 MCQ, Part II 4 short answers x 5; Section B one of two case
studies (50); 150 min + 15 min reading. All 30 MCQs kept.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Conservator): BCSE 2025, batch 1"
GROUP_TAG = "cons2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "conservator"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Conservator"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following is NOT a function of a museum?",
"opts": [
"Conservation",
"Tax collection",
"Exhibition",
"Education"
]
},
{
"n": 2,
"stem": "In Bhutan, the primary purpose of heritage conservation is to:",
"opts": [
"Boost tourism revenue only",
"Modernize all historical structures",
"Replace outdated buildings",
"Preserve cultural identity and spiritual values"
]
},
{
"n": 3,
"stem": "Which of the following is an intangible cultural heritage?",
"opts": [
"Bronze statue",
"Religious manuscript",
"Mask dance",
"Stone pillar"
]
},
{
"n": 4,
"stem": "Which of the following best defines a museologist?",
"opts": [
"A person who builds museums",
"A researcher of ancient texts",
"A conservation architect",
"A specialist in museum theory and practice"
]
},
{
"n": 5,
"stem": "What is the primary goal of preventive conservation?",
"opts": [
"Minimizing deterioration before damage occurs",
"Displaying only newly acquired objects",
"Restoring damaged artifacts",
"Reproducing lost artifacts"
]
},
{
"n": 6,
"stem": "Accessioning an object means:",
"opts": [
"Selling the object",
"Entering it into the museum's collection with a unique ID",
"Disposing of duplicate objects",
"Creating replicas for education"
]
},
{
"n": 7,
"stem": "Which of the following is an appropriate material for archival storage?",
"opts": [
"Newspaper",
"Plastic bags",
"Acid-free tissue paper",
"Colored cardboard"
]
},
{
"n": 8,
"stem": "What does an exhibition label typically contain?",
"opts": [
"Object title, date, material, and brief context",
"Full research article on the object",
"Artist’s personal history only",
"Price of the object"
]
},
{
"n": 9,
"stem": "Which of the following systems is used for digital documentation of collections?",
"opts": [
"Photoshop",
"Microsoft Word",
"Collections Management System (CMS)",
"Excel only"
]
},
{
"n": 10,
"stem": "The term “deaccession” in museums refers to:",
"opts": [
"Removal of an object from the collection",
"Temporary loans for exhibition",
"Purchasing a new artifact",
"Importing items from abroad"
]
},
{
"n": 11,
"stem": "Which international organization provides guidelines for museum ethics and professional standards?",
"opts": [
"UNESCO (United Nations Educational, Scientific, and Cultural Organization).",
"ICOM (International Council of Museums).",
"UNDP (United Nations Development Programme).",
"ICCROM (International Center for the Study of Preservation and Restoration of Cultural Property)."
]
},
{
"n": 12,
"stem": "Which of the following best describes the use of UV fluorescence in the conservation of heritage objects?",
"opts": [
"To measure temperature fluctuations in storage rooms",
"To detect biological growths, overpainting, or varnish layers not visible to the naked eye.",
"To assess the weight and density of organic artifacts.",
"To clean delicate surfaces without physical contact."
]
},
{
"n": 13,
"stem": "Which of the following environments is ideal for storing organic materials like textiles and paper?",
"opts": [
"High humidity and warm temperature",
"Dry with temperature above 35°C",
"Moderate relative humidity (45–55%) and stable temperature (~20°C)",
"Uncontrolled outdoor environment."
]
},
{
"n": 14,
"stem": "The term \"intangible cultural heritage\" includes:",
"opts": [
"Manuscripts",
"Songs, dances, and rituals",
"Historic buildings",
"Weaponry"
]
},
{
"n": 15,
"stem": "What does “provenance” refer to in museum practice?",
"opts": [
"The artistic style of an object",
"The display method",
"The material used",
"The history of ownership and origin of an object"
]
},
{
"n": 16,
"stem": "Relative humidity (RH) is important because:",
"opts": [
"It affects how clean a museum looks",
"It determines ticket pricing",
"Higher RH helps preserve all materials.",
"Fluctuations can cause physical stress and damage to organic and inorganic materials"
]
},
{
"n": 17,
"stem": "What is the best cleaning method for dusty textile surfaces?",
"opts": [
"Rinsing with water",
"Rubbing with alcohol",
"Gently vacuuming through a protective screen",
"Using a wire brush."
]
},
{
"n": 18,
"stem": "An object infested by insects should first be:",
"opts": [
"Washed with detergent",
"Isolated and assessed for pest control treatment",
"Displayed immediately",
"Sent abroad"
]
},
{
"n": 19,
"stem": "What is the purpose of a condition report?",
"opts": [
"To list visitor feedback",
"To record the display position of objects",
"To check employee performance",
"To document the physical state of an object before and after handling or loan."
]
},
{
"n": 20,
"stem": "Which of the following light sources is least harmful to sensitive materials?",
"opts": [
"Natural daylight",
"LED lighting with UV filters",
"Incandescent spotlight",
"Halogen lamp"
]
},
{
"n": 21,
"stem": "In the event of a mold outbreak, the first step is to:",
"opts": [
"Vacuum all objects",
"Close the room and increase temperature.",
"Remove affected objects to a dry, ventilated space and reduce RH",
"Repaint the room."
]
},
{
"n": 22,
"stem": "Preventive conservation involves:",
"opts": [
"Repairing broken statues",
"Environmental monitoring, storage, and pest control",
"Redesigning labels",
"Increasing footfall in galleries"
]
},
{
"n": 23,
"stem": "The most suitable gloves for handling metal artifacts are:",
"opts": [
"Cotton gloves",
"Rubber gloves",
"Nitrile or powder-free gloves",
"Woolen gloves"
]
},
{
"n": 24,
"stem": "Tarnishing of silver is caused primarily by:",
"opts": [
"Oxygen",
"Dust",
"Sulphur compounds in the air",
"Water exposure"
]
},
{
"n": 25,
"stem": "The ideal way to store a thangka is:",
"opts": [
"Rolled tightly and tied with string",
"Hung in direct light",
"Rolled with acid-free tissue on an archival tube in a dark, stable environment",
"Folded into a box"
]
},
{
"n": 26,
"stem": "Which of the following is an ethical principle in conservation?",
"opts": [
"Use of synthetic paints to modernize artwork",
"Repainting ancient murals for clarity",
"Minimum intervention and full reversibility of treatment",
"Changing the object's appearance to suit exhibition"
]
},
{
"n": 27,
"stem": "A good educational program in a museum:",
"opts": [
"Focuses only on students",
"Engages all age groups and learning levels",
"Replaces exhibitions",
"Uses only lectures"
]
},
{
"n": 28,
"stem": "A museum’s code of ethics ensures that:",
"opts": [
"Staff follow office dress code",
"Operations are profit-oriented",
"Professional behavior upholds public trust and stewardship",
"Loans are made freely without agreements."
]
},
{
"n": 29,
"stem": "Which of the following is a non-invasive method of conservation?",
"opts": [
"Using adhesive on artifacts",
"Applying varnish",
"Regulating temperature and humidity",
"Repainting missing areas"
]
},
{
"n": 30,
"stem": "During an emergency like a flood or fire, the first step in collections response is to:",
"opts": [
"Call the press",
"Evacuate staff and assess the situation",
"Turn on heating systems",
"Relabel objects"
]
}
]"""

KEY = {i + 1: (l, e) for i, (l, e) in enumerate([
    ("b", "Tax collection is not a museum function."), ("d", "Conservation in Bhutan preserves cultural identity and spiritual values."), ("c", "Mask dance (cham) is intangible heritage."),
    ("d", "A museologist specialises in museum theory and practice."), ("a", "Preventive conservation minimises deterioration before damage."), ("b", "Accessioning formally enters an object into the collection with a unique number."),
    ("c", "Acid-free tissue is archival quality."), ("a", "Labels give title, date, material and brief context."), ("c", "A Collections Management System documents collections digitally."),
    ("a", "Deaccession is formal removal from the collection."), ("b", "ICOM sets the Code of Ethics for Museums."), ("b", "UV fluorescence reveals biological growth, retouching and varnish."),
    ("c", "Stable moderate RH (45-55%) and about 20 °C suit organic materials."), ("b", "Songs, dances and rituals are intangible heritage."), ("d", "Provenance is the history of ownership and origin."),
    ("d", "RH fluctuations cause swelling, shrinking, cracking and corrosion."), ("c", "Low-suction vacuuming through a screen is safest for textiles."), ("b", "Isolate infested objects, then assess and treat."),
    ("d", "A condition report records an object's physical state before and after handling or loans."), ("b", "UV-filtered LED is least harmful."), ("c", "Isolate mouldy objects in a dry, ventilated space and lower RH."),
    ("b", "Preventive conservation: environment, storage, pest control."), ("c", "Nitrile, powder-free gloves - cotton can snag and lets moisture through to metal."), ("c", "Silver tarnishes from sulphur compounds (H₂S)."),
    ("c", "Roll thangkas loosely with acid-free tissue on an archival tube, dark and stable."), ("c", "Minimum intervention and reversibility are core ethics."), ("b", "Good programmes engage all ages and learning levels."),
    ("c", "A code of ethics upholds professional conduct, public trust and stewardship."), ("c", "Controlling temperature and humidity is non-invasive."), ("b", "People's safety first: evacuate, then assess."),
])}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    saq(1, T, """a) Identify and briefly explain three core functions of a museum. (1 mark)
b) Explain how museums in Bhutan can actively contribute to community engagement and public education. Include one or two specific examples. (2 marks)
c) Name two museums of Bhutan and their thematic focus. (2 marks)""",
        [("a) Collect/acquire, preserve/conserve, research, exhibit/educate (any three)", 1), ("b) Community engagement and education with examples (school programmes, festivals, workshops with artisans, travelling exhibitions, digital outreach)", 2), ("c) Two museums with focus (e.g. National Museum Paro - art/history; Royal Heritage Museum Trongsa - monarchy; Textile Museum Thimphu - textiles; Folk Heritage Museum - rural life)", 2)],
        """a) Collecting and documenting objects of significance; preserving and conserving them for future generations; researching, exhibiting and interpreting them to educate and inspire the public.
b) By holding school visits and curriculum-linked programmes, workshops with weavers and artisans, special exhibitions during national days and tshechus, travelling or digital exhibitions to rural areas, and involving communities in collecting oral histories. Example: the Folk Heritage Museum's demonstrations of traditional rural life and crafts; the Textile Museum's weaving demonstrations and programmes for students.
c) National Museum of Bhutan (Ta Dzong, Paro) - Bhutanese art, history, religion and natural history; Royal Heritage Museum (Ta Dzong, Trongsa) - history of the Wangchuck dynasty and the Trongsa Penlop; also the Royal Textile Academy/Textile Museum (Thimphu) - textiles and weaving, and the Folk Heritage Museum (Thimphu) - traditional rural life."""),
    saq(2, T, """a) Define the difference between tangible and intangible cultural heritage. Support your explanation with one relevant example of each from Bhutan. (2 marks)
b) What is a Collections Management System in the context of museum operations? Explain its role and significance in the preservation, documentation and accessibility of museum collections. (3 marks)""",
        [("a) Tangible: physical objects/places (dzongs, thangkas); intangible: practices, knowledge, expressions (cham dances, zhungdra, driglam namzha)", 2), ("b) CMS: database/software for records of all objects; roles: accession, location tracking, condition and conservation history, loans, images, search/online access, security", 3)],
        """a) Tangible heritage is physical - objects, buildings and sites (e.g. Punakha Dzong, thangkas, textiles); intangible heritage is living practice, knowledge and expression passed between generations (e.g. mask dances (cham) at tshechus, zhungdra and boedra songs, driglam namzha, traditional crafts knowledge).
b) A Collections Management System is a database (software) holding the complete record of every object: accession number, description, images, provenance, location, condition and conservation history, loans and exhibitions. It supports preservation (condition and treatment history, monitoring), documentation and accountability (knowing what the museum holds and where), security and insurance, research and planning, and accessibility - staff, researchers and the public can search and view collections online."""),
    saq(3, T, """a) Write a brief press release announcing the opening of a new gallery at the Royal Heritage Museum, Trongsa. The release should highlight the gallery's theme, the significance of the launch, and its expected impact on cultural preservation and public engagement. (3 marks)
b) Draft a concise exhibition label (40-50 words) for a 19th-century handwoven Kishuthara kira. Your label should include the object's title, period, region of origin, material and cultural significance. (2 marks)""",
        [("a) Press release format (headline, date/place, theme, significance, impact, opening details, contact)", 3), ("b) Label 40-50 words with title, period, region (Kurtoe/Lhuentse), material (silk/cotton), significance", 2)],
        """a) FOR IMMEDIATE RELEASE - Trongsa, [date]. Royal Heritage Museum opens new gallery on 'The Path to Unity'. The Royal Heritage Museum, Trongsa, will open a new gallery tracing the role of the Trongsa Penlops and the founding of the Wangchuck dynasty. Featuring historic objects, documents and textiles, the gallery celebrates the heritage that shaped modern Bhutan. It will strengthen cultural preservation through improved care and display of royal collections and offer school programmes and guided tours for visitors. Opening on [date] at [time]; open to the public daily. Contact: [name, phone, email].
b) Kishuthara Kira. Late 19th century, Kurtoe, Lhuentse Dzongkhag. Handwoven silk supplementary-weft patterns on a cotton/silk ground. Kishuthara, with its intricate, colourful motifs, is among Bhutan's most prestigious textiles, worn by women on festive and formal occasions and reflecting the mastery of Kurtoe weavers. (about 45 words)"""),
    saq(4, T, """a) Identify and briefly describe three key preventive conservation measures used to safeguard museum collections, and explain how each contributes to long-term preservation. (3 marks)
b) A visitor accidentally knocks over and damages an object on display. Outline the immediate actions a museum professional should take, including object handling, documentation and communication procedures. (2 marks)""",
        [("a) Three measures with contribution: environmental control (RH/temperature/light), integrated pest management, proper storage/handling/security/disaster preparedness", 3), ("b) Secure area, ensure visitor safety, do not attempt repair, collect all fragments, photograph, condition/incident report, inform conservator/management, insurer, review display", 2)],
        """a) 1. Environmental control - keeping relative humidity (45-55%), temperature and light (low lux, UV-filtered) stable slows chemical and physical decay. 2. Integrated pest management - monitoring with sticky traps, good housekeeping and quarantine of new objects prevents insect and rodent damage. 3. Proper storage, handling and security - acid-free materials, supports, gloves and trained staff, plus disaster plans, reduce physical damage and loss.
b) Secure the area and check the visitor is unhurt; stop people touching the object; do not try to repair it; carefully collect all fragments in labelled containers; photograph the scene and object; complete an incident and condition report; inform the conservator, curator and management (and insurer if relevant); move the object to the conservation lab; review the display and barriers to prevent recurrence."""),
]
C1 = """Case I: Conservation of an 18th-century wall mural in a community lhakhang
You have been assigned to assess and advise on the conservation of an 18th-century mural in a remote lhakhang. The mural shows signs of deterioration, and the local lam and community members request that it be restored to its original appearance. You must balance professional conservation principles with community expectations."""
C2 = """Case II: Handling a donated artefact and developing an exhibit
The National Museum of Bhutan has received a donation of a rare 18th-century ritual object, a phurba (ritual dagger), believed to have belonged to Terton Pema Lingpa. The object shows minor corrosion on the metal tip, and there is limited accompanying documentation. No archival records exist to verify its provenance. The donor, a private collector from Thimphu, wishes the object to be publicly exhibited as part of Bhutan's sacred heritage. You are tasked with leading the documentation, conservation and exhibition planning process for this artefact."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("cons2025", 1, T, C1, items=[
    it("1. Describe the key steps you would take to document and assess the condition of the mural, including any tools or techniques you would use.", 10,
       [("Permission and consultation with lam/community; history and research", 2), ("Photographic documentation (overall, detail, raking light, UV), measured drawings/mapping", 3), ("Condition survey: map losses, flaking, cracks, salts, soot, water damage; tools - magnifier, moisture meter, data logger, UV lamp", 3), ("Written condition report with damage maps and priorities", 2)],
       "Seek permission and consult the lam and community, and research the lhakhang's history and any past repairs. Document the mural: overall and detailed photography with a scale and colour chart, raking-light photography to show flaking and relief, UV fluorescence to reveal overpaint and varnish, measured drawings or photogrammetry. Carry out a condition survey, mapping on drawings the losses, flaking and lifting paint, cracks, plaster detachment (tap test), salts, soot from butter lamps, water staining and biological growth; use a magnifier, moisture meter and temperature/RH data logger. Prepare a written condition report with damage maps, photos and priorities."),
    it("2. How would you identify the primary causes of deterioration?", 5,
       [("Environmental monitoring (RH, temperature, moisture sources - roof leaks, rising damp)", 2), ("Human/ritual factors: butter lamps, incense soot, touching, previous repairs; structural movement, salts, pests", 2), ("Analysis of samples/expert advice; link patterns of damage to causes", 1)],
       "Monitor temperature and relative humidity over seasons with data loggers; inspect the building for roof leaks, rising damp and cracks; map where damage is worst and relate it to sources (damp walls, near butter lamps, near doors). Look at human and ritual factors - soot from butter lamps and incense, touching, earlier repainting with incompatible paints - plus structural movement (earthquakes), salt efflorescence, insects and rodents. Where possible, analyse small samples of plaster, pigments and salts and consult specialists."),
    it("3. Based on your assessment, recommend either a preventive or an interventive conservation approach and justify your choice.", 10,
       [("Clear recommendation (usually preventive first, minimal interventive stabilisation)", 3), ("Justification: authenticity, minimum intervention, reversibility, causes must be fixed first, community/ritual use", 5), ("What it involves", 2)],
       "Recommend mainly preventive conservation with minimal interventive stabilisation, rather than full repainting to the 'original' look. Justification: authenticity and historic value lie in the original 18th-century paint; repainting would destroy it; damage will continue unless causes (leaks, damp, soot) are fixed; minimal treatment keeps the mural safe and respects reversibility. Actions: repair the roof and drainage, control damp and soot, then stabilise flaking paint with compatible, reversible consolidants, secure detached plaster, gently clean soot by trained conservators, and fill losses only to make them visually less disturbing without inventing imagery."),
    it("4. How would you explain key conservation principles, such as minimum intervention and reversibility, to the lam and community in a culturally respectful manner?", 10,
       [("Respectful approach: meet with lam, listen to spiritual concerns, use Dzongkha/ local language, auspicious timing", 3), ("Explain minimum intervention and reversibility simply using analogies and Buddhist values (impermanence, merit, care)", 4), ("Show examples, involve them in decisions, agree compromises (e.g. new thangka/replica for ritual use)", 3)],
       "Meet the lam and community respectfully, listen to their spiritual reasons for wanting restoration, and speak in Dzongkha or the local language. Explain simply: minimum intervention means doing only what is needed to keep the original painting by the old masters alive - like caring for an elder rather than replacing them; reversibility means using materials that can later be removed without harm, so future generations have options. Link to Buddhist values of merit and care for sacred objects, show before-and-after examples from other lhakhangs, involve them in decisions and ceremonies, and agree acceptable compromises (e.g. consecration rituals, a newly painted mural or thangka elsewhere for worship)."),
    it("5. Recommend preventive measures to reduce further deterioration of the mural. Describe how you would support the development of local capacity for regular monitoring and basic care of the site.", 15,
       [("Preventive measures: roof/drainage repair, damp control, ventilation, move butter lamps/incense away, barriers, light control, pest control, avoid touching", 7), ("Capacity: train caretakers/konyer and monks in inspection, cleaning, documentation, simple RH monitoring, reporting", 5), ("Guidelines, checklist, schedule and support from the Department of Culture", 3)],
       "Preventive measures: repair the roof and drainage and remove sources of damp; improve ventilation; move butter lamps and incense away from the walls or use enclosures/alternative lamps; prevent touching with barriers; control direct sunlight; manage pests and birds; and avoid new paint or nails on the walls. Capacity: train the caretaker (konyer), monks and community volunteers to inspect the mural regularly, record changes with photographs, read simple temperature/RH meters, clean the room safely, recognise warning signs (flaking, damp, cracks) and report to the Department of Culture and Dzongkha Development; provide a simple illustrated guideline and checklist in Dzongkha, a monitoring schedule and follow-up visits by conservators."),
])
Q += case("cons2025", 2, T, C2, items=[
    it("1. What systematic steps would you take to document the artefact, assess its historical context, and verify its authenticity and provenance, especially in the absence of formal records?", 10,
       [("Accession procedure: deed of gift, temporary receipt, unique number, photography, measurements, condition report", 3), ("Research: style, iconography, inscriptions, metal analysis (XRF), tool marks, comparison with known Pema Lingpa objects", 4), ("Oral history from donor and religious lineages, consult scholars; record uncertainty honestly", 3)],
       "Receive it with a temporary receipt, then a deed of gift; give it an accession number; photograph it from all sides with a scale; measure and weigh it; prepare a detailed description and condition report (corrosion on the tip). Assess history: examine style, iconography, inscriptions and workmanship; compare with documented phurbas of Pema Lingpa's lineage (e.g. at Tamshing, Kurjey); scientific analysis such as XRF of the metal and study of tool marks; interview the donor about how and from whom it was obtained; consult religious authorities, the Pema Lingpa lineage holders and scholars; check that it was not stolen from a lhakhang. Record all findings and state clearly where provenance remains unverified."),
    it("2. How would you approach curating an exhibition around this phurba? What central theme or narrative would you explore to frame the object within Bhutan's spiritual and historical traditions?", 10,
       [("Curatorial process: research, concept, object selection, design, conservation and security, consultation", 4), ("Theme e.g. 'Pema Lingpa and the treasure tradition' / the phurba as a tool to overcome obstacles (Vajrakilaya)", 4), ("Supporting objects, media and respectful display (sacred setting, height, lighting)", 2)],
       "Process: research, develop a concept with religious and scholarly advisers, select related objects (texts, thangkas, cham costumes), plan design, labels, multimedia, conservation, mounting and security. Theme: 'Pema Lingpa and the Terma (hidden treasure) tradition' - presenting the phurba as a ritual implement of Vajrakilaya for subduing obstacles, linked to Pema Lingpa's discoveries, the Peling cham dances and his descendants including the Wangchuck dynasty. Display it respectfully - elevated, well-lit, in a secure case with stable RH - perhaps in a shrine-like setting."),
    it("3. How would you interpret the object meaningfully for both Bhutanese and international audiences?", 10,
       [("Layered interpretation: bilingual labels (Dzongkha/English), simple main text plus deeper content", 3), ("Explain meaning, symbolism and use, context of Pema Lingpa; avoid exoticising", 4), ("Media: images/video of rituals, audio guides, guided tours, catalogues, online", 3)],
       "Use layered interpretation: a short, clear main label in Dzongkha and English, with deeper information panels. For Bhutanese visitors, connect to lived faith, Pema Lingpa's legacy and festivals; for international visitors, explain what a phurba is, its symbolism (three-sided blade cutting through ignorance, attachment and aversion; Vajrakilaya), how it is used in ritual and the terma tradition, without exoticising or treating it as a weapon. Add photographs or film of rituals, audio guides, guided tours, a catalogue and online content, and note honestly what is known and uncertain about its history."),
    it("4. How would you involve relevant stakeholders such as religious authorities, cultural scholars and local communities in the decision-making process?", 10,
       [("Identify stakeholders: Zhung Dratshang/ Central Monastic Body, Pema Lingpa lineage holders, DoC&DD, scholars, donor, Bumthang communities", 3), ("Consultation methods: advisory committee, meetings, review of interpretation and display, rituals", 4), ("Shared decisions on display, handling, ritual access, documentation of agreements", 3)],
       "Identify stakeholders: the Zhung Dratshang (Central Monastic Body), lamas of the Pema Lingpa lineage (e.g. Gangtey, Tamshing), the Department of Culture and Dzongkha Development, historians and scholars, the donor and communities in Bumthang. Form an advisory committee; hold consultations to share research findings; ask religious authorities about appropriate display, handling and any rituals before and during exhibition; let scholars review the labels; agree whether the object may be shown publicly or only in certain ways; document all decisions and give acknowledgement."),
    it("5. Identify any ethical considerations that may arise in displaying or interpreting a sacred object like the phurba.", 10,
       [("Sacredness and respect: appropriate placement, handling by monks, consecration/rituals, possible restrictions on display", 3), ("Provenance and legality: unverified ownership, possibility of theft from a lhakhang, due diligence; ICOM code", 3), ("Accurate interpretation: avoid unverified claims (attribution to Pema Lingpa), cultural sensitivity", 2), ("Conservation ethics: minimal intervention on corrosion, community wishes vs museum standards", 2)],
       "Respect for its sacred nature - religious authorities may require rituals, restricted handling, appropriate height and placement, or that it is not displayed at all. Provenance and legality - with no records, the museum must do due diligence to ensure it was not removed illegally from a lhakhang (ICOM Code of Ethics, 1970 UNESCO Convention principles) and be ready to return it. Honest interpretation - do not present the attribution to Terton Pema Lingpa as fact without evidence. Cultural sensitivity in images and text, avoiding sensationalism. Conservation ethics - treat corrosion minimally and reversibly without 'polishing' away history, and balance donor wishes with museum standards."),
])
PATTERN = STANDARD
