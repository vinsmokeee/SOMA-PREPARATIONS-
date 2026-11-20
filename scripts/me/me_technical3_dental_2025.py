"""ME Technical Paper III (Subject Specialisation Paper), Dental Surgery, BCSE 2025 - real paper (PDF sent by the founder).
Pattern: Section A Part I 30 MCQ, Part II 4 short answers x 5; Section B one of two case studies (50). 150 min + 15 min reading.
Left out: MCQ 29 (timing of crossbite correction: two options defensible); one new MCQ keeps Part I at 30.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1"
GROUP_TAG = "dental2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "dental-surgery"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Dental Surgery"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following bacteria is most commonly associated with dental caries?",
"opts": [
"Streptococcus pyogenes",
"Streptococcus mutans",
"Lactobacillus",
"Staphylococcus aureus"
]
},
{
"n": 2,
"stem": "Which tooth is most commonly involved in dens invaginatus?",
"opts": [
"Mandibular first molar",
"Maxillary central incisor",
"Maxillary lateral incisor",
"Mandibular canine"
]
},
{
"n": 3,
"stem": "The most common cause of pulpitis is:",
"opts": [
"Trauma",
"Periodontal disease",
"Dental caries",
"Attrition"
]
},
{
"n": 4,
"stem": "What is the safe dose of Lidocaine with epinephrine for an adult (mg/kg)?",
"opts": [
"3 mg/kg",
"5 mg/kg",
"7 mg/kg",
"10 mg/kg"
]
},
{
"n": 5,
"stem": "The key hormone in calcium homeostasis is:",
"opts": [
"Thyroxine",
"Parathyroid hormone",
"Calcitonin",
"Insulin"
]
},
{
"n": 6,
"stem": "The most common cyst found in the jaws is:",
"opts": [
"Dentigerous cyst",
"Radicular cyst",
"Odontogenic keratocyst",
"Nasopalatine cyst"
]
},
{
"n": 7,
"stem": "Which of the following is a sign of irreversible pulpitis?",
"opts": [
"Cold sensitivity that resolves",
"Pain on biting",
"Spontaneous pain",
"Thermal sensitivity only"
]
},
{
"n": 8,
"stem": "A butterfly-shaped rash is commonly seen in:",
"opts": [
"Psoriasis",
"Systemic lupus erythematosus",
"Eczema",
"Pemphigus vulgaris"
]
},
{
"n": 9,
"stem": "A primary tooth with furcal radiolucency likely has:",
"opts": [
"Enamel hypoplasia",
"Pulp necrosis",
"Pericoronitis",
"Physiologic root resorption"
]
},
{
"n": 10,
"stem": "Which cranial nerve supplies the muscles of mastication?",
"opts": [
"Facial nerve",
"Hypoglossal nerve",
"Trigeminal nerve",
"Glossopharyngeal nerve"
]
},
{
"n": 11,
"stem": "The most common cause of dry socket is:",
"opts": [
"Bacterial infection",
"Excessive bleeding",
"Loss of blood clot",
"Antibiotic overuse"
]
},
{
"n": 12,
"stem": "The pulp of the tooth originates from:",
"opts": [
"Ectoderm",
"Endoderm",
"Neural crest",
"Mesoderm"
]
},
{
"n": 13,
"stem": "A high-pitched metallic sound on percussion of a tooth may indicate:",
"opts": [
"Apical periodontitis",
"Hyper cementosis",
"Ankylosis",
"Reversible pulpitis"
]
},
{
"n": 14,
"stem": "Which vitamin deficiency causes scurvy?",
"opts": [
"Vitamin A",
"Vitamin B1",
"Vitamin C",
"Vitamin D"
]
},
{
"n": 15,
"stem": "The junction between the crown and the root is called:",
"opts": [
"Alveolar crest",
"Cemento-enamel junction",
"Apical foramen",
"Periodontal ligament"
]
},
{
"n": 16,
"stem": "The main function of the periodontal ligament is to:",
"opts": [
"Supply blood to the pulp",
"Anchor tooth to alveolar bone",
"Secrete dentin",
"Prevent caries"
]
},
{
"n": 17,
"stem": "The preferred antibiotic for odontogenic infection is:",
"opts": [
"Ciprofloxacin",
"Metronidazole",
"Amoxicillin",
"Tetracycline"
]
},
{
"n": 18,
"stem": "Taurodontism is best diagnosed by:",
"opts": [
"Clinical examination",
"Pulp testing",
"Radiograph",
"Tooth mobility test"
]
},
{
"n": 19,
"stem": "Which of the following has the highest fluoride concentration?",
"opts": [
"Fluoride varnish",
"Fluoridated water",
"Fluoride mouth rinse",
"Toothpaste"
]
},
{
"n": 20,
"stem": "Which is the most radiopaque dental material?",
"opts": [
"Composite",
"Gutta-percha",
"Zinc oxide eugenol",
"Amalgam"
]
},
{
"n": 21,
"stem": "The leeway space in permanent dentition is:",
"opts": [
"Greater in maxilla",
"Greater in mandible",
"Equal in both arches",
"Not clinically relevant"
]
},
{
"n": 22,
"stem": "Which malocclusion is characterized by anterior crossbite and prognathic mandible?",
"opts": [
"Class I",
"Class II div 1",
"Class II div 2",
"Class III"
]
},
{
"n": 23,
"stem": "The best method to diagnose a vertical root fracture is:",
"opts": [
"Thermal test",
"Radiograph",
"Cone beam CT",
"Percussion"
]
},
{
"n": 24,
"stem": "Which fluoride compound is commonly used in community water fluoridation?",
"opts": [
"Sodium fluoride",
"Calcium fluoride",
"Tin fluoride",
"Ammonium fluoride"
]
},
{
"n": 25,
"stem": "The most common cause of gingival bleeding is:",
"opts": [
"Vitamin K deficiency",
"Trauma",
"Plaque-induced gingivitis",
"Periodontitis"
]
},
{
"n": 26,
"stem": "The most reliable indicator of past caries experience is:",
"opts": [
"DMFT score",
"Saliva test",
"Fluoride intake",
"Oral hygiene index"
]
},
{
"n": 27,
"stem": "Which tooth is most commonly impacted?",
"opts": [
"Maxillary lateral incisor",
"Maxillary first premolar",
"Mandibular second premolar",
"Mandibular third molar"
]
},
{
"n": 28,
"stem": "The best time for oral health education is:",
"opts": [
"At the time of treatment",
"After treatment",
"Before disease occurs",
"When patient complains"
]
},
{
"n": 29,
"stem": "Crossbite correction is ideally done at:",
"opts": [
"Adult stage",
"Late mixed dentition",
"Primary dentition",
"Permanent dentition"
]
},
{
"n": 30,
"stem": "The pain from a cracked tooth is usually:",
"opts": [
"Constant and dull",
"Spontaneous",
"Sharp on biting pressure",
"Triggered only by cold"
]
}
]"""

KEY = {
    1: ("b", "Streptococcus mutans is the main cariogenic organism."), 2: ("c", "Dens invaginatus most often affects the maxillary lateral incisor."), 3: ("c", "Caries is the commonest cause of pulpitis."),
    4: ("c", "Lidocaine with adrenaline: about 7 mg/kg (max 500 mg)."), 5: ("b", "PTH is the key calcium-regulating hormone."), 6: ("b", "Radicular (periapical) cyst is the commonest jaw cyst."),
    7: ("c", "Spontaneous, lingering pain suggests irreversible pulpitis."), 8: ("b", "Malar butterfly rash: SLE."), 9: ("b", "Furcation radiolucency in a primary molar indicates pulp necrosis."),
    10: ("c", "The mandibular division of the trigeminal nerve supplies the muscles of mastication."), 11: ("c", "Dry socket follows loss/breakdown of the blood clot."),
    12: ("c", "Pulp comes from neural crest-derived ectomesenchyme (dental papilla)."), 13: ("c", "A metallic percussion note suggests ankylosis."), 14: ("c", "Vitamin C deficiency causes scurvy."),
    15: ("b", "The crown meets the root at the cemento-enamel junction."), 16: ("b", "The PDL anchors the tooth to the alveolar bone."), 17: ("c", "Amoxicillin is first choice for odontogenic infections."),
    18: ("c", "Taurodontism (enlarged pulp chamber) is seen on radiographs."), 19: ("a", "Varnish (about 22,600 ppm) has the highest fluoride concentration."), 20: ("d", "Amalgam is the most radiopaque."),
    21: ("b", "Leeway space is greater in the mandible (about 1.7 mm per side vs 0.9 mm)."), 22: ("d", "Anterior crossbite with a prognathic mandible is Class III."), 23: ("c", "CBCT best shows vertical root fractures."),
    24: ("a", "Of the options, sodium fluoride is used in water fluoridation."), 25: ("c", "Plaque-induced gingivitis is the commonest cause."), 26: ("a", "DMFT records past caries experience."),
    27: ("d", "Mandibular third molars are most often impacted."), 28: ("c", "Education is best before disease occurs (prevention)."), 30: ("c", "Cracked tooth: sharp pain on biting/release."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "The number of teeth in the complete primary dentition is", ["16", "20", "24", "32"], "b", "20 primary (deciduous) teeth."),
    saq(1, T, "What do you understand by \"morsicatio buccarum\"? State the aetiologies of morsicatio buccarum. Explain the consequences of such an untreated condition. (5 marks)",
        [("Definition: chronic cheek biting/chewing causing frayed, white, shaggy buccal mucosa along the occlusal line", 2), ("Aetiology: habit, stress/anxiety, malocclusion, sharp teeth/restorations, psychological conditions", 1.5), ("Consequences: ulceration, pain, infection, hyperkeratosis, possible confusion with leukoplakia, TMJ/psychological effects", 1.5)],
        "Morsicatio buccarum is chronic biting or chewing of the cheek mucosa, giving white, shaggy, frayed patches with small erosions along the occlusal plane. Aetiology: a habit linked to stress, anxiety or boredom; psychological disorders; malocclusion, sharp teeth, broken restorations or ill-fitting dentures. If untreated: repeated trauma causes ulcers, pain and secondary infection, hyperkeratosis that can be mistaken for leukoplakia (causing anxiety and unnecessary biopsy), and a persistent habit; management includes reassurance, removing sharp edges, a night guard and counselling."),
    saq(2, T, "What is removable orthodontics? List three common conditions that can be treated with removable orthodontics and the appliances used. (5 marks)",
        [("Definition: appliances the patient can insert and remove, applying light forces for simple tooth movements/growth modification", 2), ("Three conditions with appliances (e.g. anterior crossbite - Hawley with Z-spring; spacing/diastema - Hawley with labial bow; habits - habit breaker/crib; space maintenance; Class II growth - functional appliance (twin block))", 3)],
        "Removable orthodontics uses appliances that the patient can take out and put back, made of an acrylic baseplate with clasps (e.g. Adams) and active springs or bows, for simple tipping movements, habit breaking, retention and growth modification. Examples: anterior crossbite of a single incisor - upper removable appliance with a Z-spring (double cantilever) and posterior bite plane; spacing or a midline diastema - Hawley appliance with active labial bow/finger springs; thumb-sucking or tongue-thrust habit - habit-breaker (tongue crib); Class II skeletal pattern in a growing child - functional appliance such as a twin block; and retention after treatment - Hawley retainer."),
    saq(3, T, "A patient with persistent oozing from an infected mandibular first molar presents with a draining sinus on the cheek. What would be your differential diagnosis and how will you approach its management? (5 marks)",
        [("Differential: cutaneous odontogenic sinus tract from chronic periapical abscess; also osteomyelitis, infected cyst, actinomycosis, skin lesions (furuncle, BCC), TB", 2), ("Investigations: vitality test, periapical radiograph/OPG, gutta-percha sinus tracing", 1.5), ("Management: remove source - root canal treatment or extraction; antibiotics if systemic signs; sinus heals; scar revision if needed", 1.5)],
        "Most likely a cutaneous sinus tract of odontogenic origin from a chronic apical abscess of the necrotic first molar. Differentials: osteomyelitis of the mandible, infected odontogenic cyst, actinomycosis, tuberculosis, and primary skin lesions (furuncle, infected epidermoid cyst, basal cell carcinoma). Approach: history and examination, pulp vitality testing, periapical radiograph/OPG and tracing the sinus with a gutta-percha point to locate the source. Treat the cause: root canal treatment if restorable, otherwise extraction with curettage; antibiotics only if spreading infection or systemic signs; the skin sinus usually heals within weeks once the source is removed, scar revision if needed. Avoid treating with antibiotics alone or excising the skin lesion only."),
    saq(4, T, "What is a \"dentifrice\"? Have you heard of \"fluoride\"? If yes, does it have any role in caries prevention, and how? What are the different forms of fluoride available in the world and in Bhutan? (5 marks)",
        [("Dentifrice: paste/powder/gel used with a toothbrush to clean teeth", 1), ("Fluoride role: fluorapatite formation, enhances remineralisation, inhibits demineralisation and bacterial enzymes", 2), ("Forms: fluoridated toothpaste, varnish, gels, mouth rinses, water/salt/milk fluoridation, tablets/drops, SDF; in Bhutan mainly toothpaste, varnish in school programmes", 2)],
        "A dentifrice is a substance (paste, gel or powder) used with a toothbrush to clean the teeth and deliver agents such as fluoride. Fluoride prevents caries by forming more acid-resistant fluorapatite, promoting remineralisation of early lesions and reducing demineralisation, and inhibiting bacterial enzymes and acid production. Forms worldwide: fluoridated toothpaste (1000-1500 ppm), water, salt and milk fluoridation, fluoride tablets and drops, mouth rinses, gels/foams, varnish (22,600 ppm) and silver diamine fluoride. In Bhutan the main sources are fluoridated toothpaste and professionally applied fluoride varnish (e.g. in school oral health programmes); community water fluoridation is not used."),
]
C1 = """CASE I
A 70-year-old man comes to your clinic with blistering mouth and skin lesions that started suddenly 10 days ago and increased progressively over time. He states that it started as blisters and vesicles in the mouth and on the skin of the trunk, thighs and genitalia. No intact blisters were found in the oral cavity as they had already ruptured, leaving only ulcerations. He thinks that he has oral cancer and will not be able to live a normal life again. He gives a history of hypertension, type 2 diabetes mellitus and rheumatoid arthritis and has taken medicines like systemic steroid (prednisolone) and methotrexate for many years. He stopped all the medicines 2 years ago (not on any medication now). Answer the questions based on this complaint (complaint-based treatment)."""
C2 = """CASE II
A young woman came to your clinic for a wisdom tooth extraction. After taking her dental history, you examined her and advised extraction as the tooth might give her repeated problems later on. She agreed. A little over 5 minutes after giving her the required lignocaine local anaesthetic block, she became unresponsive and fainted in the dental chair."""
Q += case("dental2025", 1, T, C1, items=[
    ("1. Name some common vesiculo-bullous lesions/diseases (autoimmune, inflammatory and infectious).", 5,
     [("Autoimmune: pemphigus vulgaris, mucous membrane/bullous pemphigoid, linear IgA disease, epidermolysis bullosa acquisita", 2), ("Inflammatory/immune: erythema multiforme, SJS/TEN, lichen planus (bullous)", 1.5), ("Infectious: herpes simplex, varicella-zoster, hand-foot-mouth disease, herpangina, bullous impetigo", 1.5)],
     "Autoimmune: pemphigus vulgaris, bullous and mucous membrane pemphigoid, linear IgA disease, epidermolysis bullosa acquisita, paraneoplastic pemphigus. Inflammatory/hypersensitivity: erythema multiforme, Stevens-Johnson syndrome/TEN, bullous lichen planus, drug eruptions. Infectious: primary herpetic gingivostomatitis and recurrent herpes, varicella and herpes zoster, hand-foot-and-mouth disease, herpangina, bullous impetigo."),
    ("2. Give your differential diagnosis with justifications in this patient.", 5,
     [("Pemphigus vulgaris most likely: elderly, oral lesions first, flaccid blisters rupture to erosions, skin involvement, previous immunosuppression masked disease", 2.5), ("Others: bullous pemphigoid (elderly, tense skin blisters), mucous membrane pemphigoid, erythema multiforme/SJS (drug), herpes zoster/HSV (immune-compromised), paraneoplastic pemphigus", 2.5)],
     "1. Pemphigus vulgaris - most likely: oral and skin blisters that rupture quickly leaving erosions, involvement of trunk, thighs and genitalia, progressive course; previous long-term steroids/methotrexate may have suppressed it and stopping them may have unmasked it. 2. Bullous pemphigoid - common in the elderly, but skin blisters are tense and oral involvement is less common. 3. Mucous membrane pemphigoid - mucosal predominance, but genital and skin spread less typical. 4. Erythema multiforme/SJS - sudden onset, but needs a trigger (drug, infection) and target lesions. 5. Viral (disseminated herpes/zoster) in an older diabetic patient. 6. Paraneoplastic pemphigus - exclude malignancy given his fear of cancer."),
    ("3. Give a detailed history relevant to this patient.", 5,
     [("Presenting complaint: onset, sites, sequence, pain, eating difficulty, weight loss, fever", 1.5), ("Medical history: diabetes and BP control, RA, previous diagnosis for which steroids/methotrexate given, why stopped, any new drugs (ACE inhibitors, penicillamine), infections", 2), ("Family, social (smoking, alcohol, diet), allergy, malignancy symptoms, psychological impact", 1.5)],
     "Presenting complaint: when and where lesions started, whether mouth or skin first, blisters intact or bursting, pain, burning, bleeding, difficulty eating and swallowing, eye, nose or genital symptoms, fever, weight loss. Past medical history: control of diabetes and hypertension, rheumatoid arthritis, what condition the prednisolone and methotrexate were prescribed for (possibly earlier bullous disease), why and how they were stopped, any recent new drugs (e.g. ACE inhibitors, penicillamine, NSAIDs, antibiotics), infections or vaccinations, symptoms of malignancy. Drug allergies, family history of autoimmune disease, social history (smoking, alcohol, doma), diet and nutrition, and the patient's anxiety about cancer."),
    ("4. What investigations will you do for this patient? Give justifications for your investigations.", 10,
     [("Incisional biopsy of perilesional tissue for histopathology (acantholysis, intraepithelial split vs subepithelial)", 3), ("Perilesional biopsy for direct immunofluorescence; serum for indirect IF/ELISA (desmoglein 1 and 3, BP180/230)", 3), ("Tzanck smear (acantholytic cells); viral PCR/culture to exclude herpes", 2), ("Baseline bloods before steroids: CBC, blood glucose/HbA1c, renal and liver function, electrolytes, BP; chest X-ray/TB screen, bone density", 2)],
     "1. Incisional biopsy of the edge of a fresh lesion for histopathology - shows suprabasal (intraepithelial) split with acantholysis in pemphigus, subepithelial split in pemphigoid. 2. Perilesional biopsy in Michel's medium for direct immunofluorescence - the gold standard to confirm the type. 3. Serum indirect immunofluorescence and ELISA for anti-desmoglein 3/1 (pemphigus) or BP180/230 (pemphigoid) antibodies - confirm diagnosis and monitor activity. 4. Tzanck smear for acantholytic cells; viral swab/PCR to exclude herpes infection. 5. Baseline tests before steroid/immunosuppressive therapy: complete blood count, fasting glucose and HbA1c (diabetic), renal and liver function, electrolytes, blood pressure, chest X-ray and TB screening, hepatitis B status, bone density if feasible. 6. Screening for malignancy if paraneoplastic pemphigus is suspected."),
    ("5. What is Nikolsky's sign? How do you do it? What is the gold standard investigation to establish the proper diagnosis in such a case? Have you heard of immunofluorescence studies - what can you see? How is direct immunofluorescence (DIF) done?", 10,
     [("Nikolsky's sign: lateral pressure on normal-looking mucosa/skin causes separation of epithelium (positive in pemphigus)", 2), ("How: firm sliding pressure with finger/blunt instrument near a lesion", 1), ("Gold standard: perilesional biopsy with DIF (plus histopathology)", 2), ("IF findings: pemphigus - intercellular IgG/C3 'chicken-wire/fishnet'; pemphigoid - linear band at basement membrane", 2.5), ("DIF method: perilesional biopsy in Michel's medium, frozen sections, fluorescein-labelled anti-human IgG/IgA/IgM/C3, fluorescence microscopy", 2.5)],
     "Nikolsky's sign: firm lateral (sliding) pressure with a finger or blunt instrument on apparently normal skin or mucosa near a lesion causes the epithelium to slide off or a new blister to form - positive in pemphigus vulgaris (also SJS/TEN), showing loss of cell adhesion. Gold standard: perilesional biopsy for direct immunofluorescence together with routine histopathology. Immunofluorescence shows where antibodies are deposited: in pemphigus, IgG and C3 between epidermal cells in a 'fishnet/chicken-wire' pattern; in pemphigoid, a linear band along the basement membrane zone. DIF technique: take a biopsy of clinically normal-looking perilesional mucosa, transport fresh/frozen or in Michel's medium (not formalin), cut cryostat sections, incubate with fluorescein-labelled anti-human IgG, IgA, IgM and C3, and examine under a fluorescence microscope. (Indirect IF uses the patient's serum on a substrate to detect circulating antibodies.)"),
    ("6. Enlist your management protocol in this patient.", 10,
     [("Reassure (not cancer), explain; refer/co-manage with dermatologist/physician", 2), ("Systemic therapy after confirmation: corticosteroids with steroid-sparing agents (azathioprine, mycophenolate) or rituximab", 3), ("Local oral care: topical steroids, analgesic/anaesthetic rinses, chlorhexidine, antifungal, soft diet, hydration, nutrition", 3), ("Control diabetes/BP during steroids, monitor side effects (glucose, BP, infection, bone), regular follow-up and tapering", 2)],
     "1. Reassure the patient that this appears to be a treatable autoimmune blistering disease, not cancer, and refer to/co-manage with a dermatologist and physician. 2. Confirm the diagnosis (biopsy, DIF, serology) and obtain baseline investigations. 3. Systemic treatment: corticosteroids (e.g. prednisolone) with a steroid-sparing agent (azathioprine, mycophenolate) or rituximab, as advised by the specialist. 4. Oral care: topical steroids (clobetasol/triamcinolone in adhesive base), benzydamine or lignocaine viscous rinses for pain, chlorhexidine mouthwash, antifungal prophylaxis, soft bland diet, fluids and nutrition, gentle oral hygiene. 5. Skin care, infection control and pain relief. 6. Tight control of diabetes and blood pressure; monitor for steroid side effects (hyperglycaemia, hypertension, infection, osteoporosis - calcium, vitamin D, gastric protection). 7. Regular follow-up, slow tapering and education about relapse."),
    ("7. Will you manage this patient with corticosteroids? If so, what type of steroids will you use? Mention your treatment plan.", 5,
     [("Yes - corticosteroids are first-line, but with caution because of diabetes and hypertension", 1.5), ("Systemic prednisolone (about 0.5-1 mg/kg/day) in the morning with steroid-sparing agent; topical potent steroids for oral lesions", 2), ("Plan: induction until no new lesions, then gradual taper; monitor glucose, BP, infection; gastric and bone protection; specialist supervision", 1.5)],
     "Yes - corticosteroids are the first-line treatment of pemphigus, but used cautiously because he is elderly, diabetic and hypertensive, under physician/dermatologist supervision. Plan: systemic prednisolone about 0.5-1 mg/kg/day taken in the morning (possibly with an early steroid-sparing agent such as azathioprine or mycophenolate, or rituximab) until no new blisters form for about 2 weeks, then taper slowly over months; topical potent steroids (e.g. clobetasol 0.05% in orabase) for oral lesions. Monitor blood glucose (adjust diabetic drugs/insulin), blood pressure, weight, infection and bone health; give calcium, vitamin D and gastric protection; never stop steroids abruptly."),
])
Q += case("dental2025", 2, T, C2, items=[
    ("1. What is this condition commonly called?", 2, [("Vasovagal syncope (simple faint)", 2)], "Vasovagal syncope - a simple faint, the commonest medical emergency in the dental chair (anxiety, pain, fasting)."),
    ("2. What is the percentage of lignocaine used for dental local anaesthesia, and what is the maximum dose you can administer to your patient?", 2,
     [("2% lignocaine (20 mg/ml)", 1), ("Max with adrenaline about 7 mg/kg (≤ 500 mg); plain about 4.4 mg/kg (≤ 300 mg)", 1)],
     "Dental lignocaine is 2% (20 mg/ml; a 2.2 ml cartridge contains 44 mg). Maximum dose: with adrenaline about 7 mg/kg up to 500 mg (often quoted 4.4 mg/kg up to 300 mg for plain lignocaine) - e.g. about 350 mg for a 50 kg adult."),
    ("3. What is the ratio of adrenaline to lignocaine commonly used in dental local anaesthesia?", 2,
     [("Adrenaline 1:80,000 (or 1:100,000/1:200,000) with 2% lignocaine", 2)],
     "2% lignocaine with adrenaline 1:80,000 (12.5 µg/ml) is commonly used; 1:100,000 and 1:200,000 are also available."),
    ("4. What do you understand by \"exodontia\"? Explain.", 2,
     [("Exodontia: the art and science of removing teeth painlessly with minimal trauma; branch of oral surgery; includes simple and surgical extraction", 2)],
     "Exodontia is the branch of oral surgery concerned with the extraction (removal) of teeth - the painless removal of a whole tooth or root with minimal trauma to surrounding tissues, by simple (forceps) or surgical methods, with proper indications, technique and aftercare."),
    ("5. Was the history taking complete? If not, what else should have been taken additionally?", 2,
     [("No - full medical history was needed: cardiac/respiratory disease, epilepsy, diabetes, bleeding disorders, drugs, allergies (to LA), pregnancy/LMP, previous fainting/anxiety, last meal", 2)],
     "No - only dental history was taken. A full medical history was needed: cardiovascular and respiratory disease, epilepsy, diabetes, bleeding disorders, current medicines and allergies (including to local anaesthetics), pregnancy and last menstrual period, previous fainting or reactions to dental treatment, anxiety level, and whether she had eaten - plus baseline vital signs."),
    ("6. How do you manage the above case of fainting?", 5,
     [("Stop procedure, call for help, place supine with legs raised (Trendelenburg)", 2), ("Loosen tight clothing, maintain airway, oxygen, monitor pulse/BP/breathing", 1.5), ("Recovery: reassure, sugary drink if conscious; if no quick recovery - consider other causes, BLS/CPR, emergency referral", 1.5)],
     "Stop the procedure and remove instruments from the mouth; lay her flat with legs raised (supine/Trendelenburg) to improve blood flow to the brain; loosen tight clothing; open and maintain the airway; give oxygen; monitor pulse, breathing and blood pressure. Recovery is usually within 1-2 minutes; then reassure, give a sweet drink once fully conscious, and postpone or continue treatment only when she is well and less anxious. If she does not recover quickly, consider other causes (hypoglycaemia, anaphylaxis, LA toxicity, cardiac event), call emergency help and start BLS/CPR if there is no pulse or breathing; record the event."),
    ("7. What sort of complications do you need to rule out in this patient immediately?", 5,
     [("Anaphylaxis/allergic reaction to LA", 1), ("LA toxicity/intravascular injection (CNS excitation, seizures, arrhythmia) and adrenaline reaction", 1), ("Hypoglycaemia, seizure/epilepsy", 1), ("Cardiac events (arrhythmia, MI, cardiac arrest), hyperventilation, airway obstruction/aspiration", 1), ("Pregnancy-related causes; check vitals to differentiate", 1)],
     "Rule out: anaphylaxis/allergic reaction to the anaesthetic (rash, wheeze, hypotension); local anaesthetic toxicity or accidental intravascular injection (tingling, confusion, seizures, arrhythmia) and adrenaline reaction (palpitations, hypertension); hypoglycaemia (if fasting); epileptic seizure; cardiac events (arrhythmia, angina/MI, cardiac arrest); hyperventilation syndrome; airway obstruction or aspiration; pregnancy-related hypotension. Check pulse, blood pressure, breathing, oxygen saturation and blood glucose."),
    ("8. What are the complications of extraction? Mention all the complications that can occur (i) pre-operatively, (ii) during the operation and (iii) post-operatively.", 15,
     [("(i) Pre-operative: syncope, LA complications (toxicity, allergy, needle breakage, haematoma, trismus, facial nerve palsy), medical emergencies, wrong tooth/patient", 5), ("(ii) Intra-operative: fracture of tooth/root/alveolar bone/tuberosity/mandible, damage to adjacent teeth, soft tissue injury, oro-antral communication, root displacement, haemorrhage, nerve injury, TMJ dislocation, swallowing/aspiration", 5), ("(iii) Post-operative: pain, swelling, bleeding, dry socket, infection, trismus, paraesthesia, sinus problems, osteomyelitis, osteonecrosis", 5)],
     "(i) Pre-operative: vasovagal syncope and other medical emergencies; local anaesthetic complications - toxicity, allergy, needle breakage, haematoma, trismus, transient facial nerve palsy; wrong patient or wrong tooth.\n(ii) During operation: fracture of the crown or root, alveolar bone, maxillary tuberosity or (rarely) mandible; damage to adjacent teeth or restorations; soft-tissue lacerations; displacement of roots into the maxillary sinus or tissue spaces; oro-antral communication; haemorrhage; injury to the inferior alveolar or lingual nerve; dislocation of the TMJ; swallowing or aspiration of tooth/instruments.\n(iii) Post-operative: pain, swelling and bruising; reactionary or secondary haemorrhage; dry socket (alveolar osteitis); infection and abscess; trismus; paraesthesia; oro-antral fistula and sinusitis; osteomyelitis; osteoradionecrosis or medication-related osteonecrosis in at-risk patients."),
    ("9. How do you manage a post-extraction bleeding case that comes to you about one to two hours after extraction? What prophylaxis would you give if your patient has a mitral valve prosthesis?", 5,
     [("Assess (history, vitals, anticoagulants), clean clot, local pressure with gauze for 10-20 min", 2), ("Local measures: LA with adrenaline, haemostatic agents (oxidised cellulose/gelatin sponge, tranexamic acid), suturing; investigations/referral if persistent", 1.5), ("Prosthetic valve: antibiotic prophylaxis against infective endocarditis - amoxicillin 2 g orally 30-60 min before (clindamycin if allergic); check INR on warfarin", 1.5)],
     "Reassure the patient, check vitals and history (anticoagulants, bleeding disorders, liver disease). Clean the mouth and remove the loose clot to locate the bleeding; apply firm pressure with damp gauze for 10-20 minutes. If bleeding continues: inject LA with adrenaline, place a haemostatic agent (oxidised cellulose, gelatin sponge) and suture the socket; tranexamic acid mouthwash or soaked gauze; give post-op instructions. Refer for blood tests (INR, CBC) if persistent. For a patient with a prosthetic mitral valve (high risk of infective endocarditis): antibiotic prophylaxis before the extraction - amoxicillin 2 g orally 30-60 minutes before (clindamycin/azithromycin if allergic), and check the INR on the day if on warfarin (do not stop it without the physician; extraction is usually done if INR is within the safe range)."),
    ("10. Classify the different types of third molar impactions (with diagrams if required). State the mechanism of action of local anaesthesia.", 5,
     [("Winter's classification by angulation: mesioangular, distoangular, vertical, horizontal (also buccal/lingual, inverted)", 1.5), ("Pell and Gregory: ramus relationship Class I, II, III; depth Position A, B, C", 1.5), ("LA mechanism: blocks voltage-gated Na⁺ channels, preventing depolarisation and nerve impulse conduction (un-ionised form crosses membrane)", 2)],
     "Classification of mandibular third molar impaction: Winter's (angulation) - mesioangular (commonest), vertical, horizontal, distoangular, plus buccoangular, linguoangular and inverted; Pell and Gregory - relation to the ramus (Class I, II, III, by space available) and depth relative to the occlusal plane (Position A, B, C); also by soft-tissue or bony impaction. Mechanism of local anaesthesia: the un-ionised (lipid-soluble) form crosses the nerve membrane, becomes ionised inside and blocks voltage-gated sodium channels, preventing sodium influx and depolarisation, so nerve impulses are not conducted and pain is not felt."),
    ("11. What is alveolar osteitis? Is it manageable in our set-up? Explain how you manage a case of post-extraction dry socket.", 5,
     [("Alveolar osteitis: dry socket - breakdown/loss of clot, exposed bone, severe pain 2-4 days after extraction, bad smell", 2), ("Yes, manageable in any dental clinic", 1), ("Management: irrigate with warm saline/chlorhexidine, gentle debridement, medicated dressing (e.g. Alvogyl/ZOE), analgesics, review every 2-3 days; antibiotics only if infection; prevention", 2)],
     "Alveolar osteitis (dry socket) is breakdown or loss of the blood clot (fibrinolysis), leaving exposed bone in the socket, with severe radiating pain 2-4 days after extraction and bad taste/odour; it is commoner after lower molar extraction, in smokers and women on oral contraceptives. Yes, it is easily managed in our clinics: give LA if needed, irrigate gently with warm saline or chlorhexidine, remove debris without curetting the bone, place a medicated obtundent dressing (e.g. Alvogyl or zinc oxide-eugenol on iodoform gauze), prescribe analgesics, advise warm saline rinses and no smoking, and review every 2-3 days changing the dressing until pain settles; antibiotics only if there are signs of infection."),
])
PATTERN = STANDARD
