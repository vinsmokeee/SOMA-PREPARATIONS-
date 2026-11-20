"""ME Technical Paper III (Subject Specialisation Paper), Nursing, BCSE 2025 - real paper (PDF sent by the founder).
Standard pattern. MCQ 27 (confirming TB in an asymptomatic client - Mantoux and culture both arguable) is replaced.
Case II: heavy bleeding with shock at 10 weeks is answered as incomplete/inevitable miscarriage, with ruptured ectopic
pregnancy as the key differential to exclude by ultrasound.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Nursing): BCSE 2025, batch 1"
GROUP_TAG = "nurse2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "nursing"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Nursing", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Nursing"

MCQ = r"""[
{
"n": 1,
"stem": "What is the priority nursing intervention for a patient experiencing a seizure?",
"opts": [
"Place a tongue depressor in the mouth",
"Restrain the patient",
"Maintain airway and ensure safety",
"Give antiepileptics immediately"
]
},
{
"n": 2,
"stem": "Which laboratory result should be monitored closely in a patient receiving warfarin therapy?",
"opts": [
"INR",
"Sodium",
"Creatinine",
"Hemoglobin"
]
},
{
"n": 3,
"stem": "Which electrolyte imbalance is commonly associated with renal failure?",
"opts": [
"Hypokalemia",
"Hypernatremia",
"Hyperkalemia",
"Hypocalcemia"
]
},
{
"n": 4,
"stem": "A nurse should withhold digoxin if:",
"opts": [
"The potassium level is 4.2 mEq/L",
"The respiratory rate is 20",
"The apical pulse is 56 bpm",
"The blood pressure is 110/70"
]
},
{
"n": 5,
"stem": "Which of the following diseases is transmitted through the fecal-oral route?",
"opts": [
"HIV",
"Malaria",
"Hepatitis A",
"Tuberculosis"
]
},
{
"n": 6,
"stem": "Which condition involves alternating episodes of mania and depression?",
"opts": [
"Schizophrenia",
"Bipolar disorder",
"Major depressive disorder",
"Anxiety disorder"
]
},
{
"n": 7,
"stem": "Which of the following is a quantitative research method?",
"opts": [
"Case study",
"Ethnography",
"Experimental study",
"Phenomenology"
]
},
{
"n": 8,
"stem": "A post-op patient develops tachypnea, restlessness, and cyanosis. The nurse suspects hypoxia. Which ABG result confirms this?",
"opts": [
"pH 7.33, PaCO₂ 50, HCO₃ 24, PaO₂ 60",
"pH 7.47, PaCO₂ 30, HCO₃ 23, PaO₂ 90",
"pH 7.40, PaCO₂ 40, HCO₃ 25, PaO₂ 92",
"pH 7.36, PaCO₂ 42, HCO₃ 22, PaO₂ 98"
]
},
{
"n": 9,
"stem": "In a patient with head injury, what indicates early signs of increased intracranial pressure?",
"opts": [
"Bradycardia, irregular respiration",
"Dilated pupils, decerebrate posturing",
"Headache and decreasing level of consciousness",
"Bounding pulse and hypertension"
]
},
{
"n": 10,
"stem": "A patient at 32 weeks of gestation presents with painless vaginal bleeding. What is the nurse’s priority action?",
"opts": [
"Perform vaginal exam",
"Administer oxytocin",
"Monitor FHR and prepare for ultrasound",
"Allow ambulation and hydration"
]
},
{
"n": 11,
"stem": "A patient with schizophrenia tells the nurse, “I am the King of the Universe.” This is an example of:",
"opts": [
"Hallucination",
"Delusion of persecution",
"Delusion of grandeur",
"Disorganized thought"
]
},
{
"n": 12,
"stem": "Which of the following is most appropriate when managing a violent psychiatric patient?",
"opts": [
"Engage in physical restraint immediately",
"Call security and leave the room",
"Use a calm voice and maintain a safe distance",
"Yell for help and confront the patient"
]
},
{
"n": 13,
"stem": "A nurse falsifies a patient's vital signs in the record. This is a violation of:",
"opts": [
"Ethical principles only",
"Legal, ethical, and professional standards",
"Hospital policy only",
"Patient's autonomy only"
]
},
{
"n": 14,
"stem": "Which situation best reflects the concept of moral distress?",
"opts": [
"Refusing to participate in a procedure",
"Disagreeing with a colleague's practice",
"Being forced to provide care perceived as unethical",
"Being unaware of ethical protocols"
]
},
{
"n": 15,
"stem": "Which statistical test compares means of three or more independent groups?",
"opts": [
"t-test",
"Chi-square",
"ANOVA",
"Pearson correlation"
]
},
{
"n": 16,
"stem": "Which fetal position is most favorable for vaginal delivery?",
"opts": [
"Left occiput posterior",
"Right sacral anterior",
"Left occiput anterior",
"Frank breech"
]
},
{
"n": 17,
"stem": "A premature baby born at 32 weeks requires surfactant therapy primarily to prevent:",
"opts": [
"Hypoglycemia",
"Apnea of prematurity",
"Respiratory distress syndrome",
"Retinopathy of prematurity"
]
},
{
"n": 18,
"stem": "The most effective method for preventing catheter-associated urinary tract infections (CAUTI) is:",
"opts": [
"Using antiseptic lubricants during insertion",
"Routine bladder irrigation",
"Maintaining a closed drainage system",
"Flushing catheter daily with saline"
]
},
{
"n": 19,
"stem": "Which is the most appropriate site for IM injection in infants under 1 year?",
"opts": [
"Deltoid muscle",
"Vastus lateralis",
"Dorsogluteal muscle",
"Ventrogluteal site"
]
},
{
"n": 20,
"stem": "Which symptom is most indicative of pulmonary embolism?",
"opts": [
"Sudden onset of chest pain and dyspnea",
"Productive cough with yellow sputum",
"Bradycardia and dizziness",
"Gradual shortness of breath over weeks"
]
},
{
"n": 21,
"stem": "Which of the following best describes autonomy in nursing ethics?",
"opts": [
"Acting in the patient’s best interest",
"Being honest with patients",
"Respecting the patient’s right to make decisions",
"Maintaining confidentiality"
]
},
{
"n": 22,
"stem": "The primary reason for rotating insulin injection sites is to:",
"opts": [
"Increase absorption",
"Prevent hypoglycemia",
"Prevent lipodystrophy",
"Reduce pain"
]
},
{
"n": 23,
"stem": "The term “sentinel event” refers to:",
"opts": [
"A medication side effect",
"An unexpected event causing death or serious injury",
"A minor hospital-acquired infection",
"A fall without injury"
]
},
{
"n": 24,
"stem": "Which vitamin deficiency is associated with neural tube defects in newborns?",
"opts": [
"Vitamin D",
"Vitamin A",
"Folic acid",
"Vitamin C"
]
},
{
"n": 25,
"stem": "In a disaster triage scenario, a client with open fracture and respiratory distress is tagged as:",
"opts": [
"Green (minor)",
"Yellow (delayed)",
"Red (immediate)",
"Black (expectant)"
]
},
{
"n": 26,
"stem": "What is the recommended rate of chest compressions per minute for adult CPR?",
"opts": [
"60–80",
"80–100",
"100–120",
"120–140"
]
},
{
"n": 27,
"stem": "Which test confirms tuberculosis in an asymptomatic client?",
"opts": [
"Chest X-ray",
"Mantoux test",
"Sputum culture for AFB",
"ESR"
]
},
{
"n": 28,
"stem": "A newborn is delivered with meconium-stained amniotic fluid and has poor muscle tone. What is the first nursing action?",
"opts": [
"Suction the mouth and nose",
"Initiate chest compressions",
"Dry and stimulate",
"Provide blow-by oxygen"
]
},
{
"n": 29,
"stem": "Which of the following conditions requires contact precautions?",
"opts": [
"Influenza",
"Clostridium difficile",
"Tuberculosis",
"Measles"
]
},
{
"n": 30,
"stem": "Which symptom is a hallmark of neurogenic shock?",
"opts": [
"Hypertension and bradycardia",
"Hypotension and bradycardia",
"Hypotension and tachycardia",
"Warm, moist skin"
]
}
]"""

KEY = {
    1: ("c", "Protect the airway and keep the patient safe; never force objects into the mouth or restrain."), 2: ("a", "Warfarin is monitored with the INR."),
    3: ("c", "Kidneys cannot excrete potassium in renal failure, causing hyperkalaemia."), 4: ("c", "Withhold digoxin if the apical pulse is below 60 in adults."),
    5: ("c", "Hepatitis A spreads by the faecal-oral route."), 6: ("b", "Bipolar disorder has alternating mania and depression."),
    7: ("c", "Experimental studies are quantitative."), 8: ("a", "PaO2 60 mmHg with raised CO2 confirms hypoxaemia."),
    9: ("c", "Early raised ICP: headache and falling level of consciousness; Cushing's triad is late."), 10: ("c", "Painless bleeding suggests placenta praevia: no vaginal exam; monitor the foetus and arrange ultrasound."),
    11: ("c", "Believing oneself to be King of the Universe is a delusion of grandeur."), 12: ("c", "De-escalate with a calm voice and keep a safe distance first."),
    13: ("b", "Falsifying records breaches legal, ethical and professional standards."), 14: ("c", "Moral distress: knowing the right action but being constrained from doing it."),
    15: ("c", "ANOVA compares means of three or more groups."), 16: ("c", "Left occiput anterior is the most favourable position."),
    17: ("c", "Surfactant prevents respiratory distress syndrome in preterm babies."), 18: ("c", "A closed sterile drainage system is key to preventing CAUTI."),
    19: ("b", "Vastus lateralis is the preferred IM site in infants."), 20: ("a", "Sudden chest pain and breathlessness suggest pulmonary embolism."),
    21: ("c", "Autonomy is respecting the patient's right to decide."), 22: ("c", "Rotating sites prevents lipodystrophy."),
    23: ("b", "A sentinel event is an unexpected event causing death or serious harm."), 24: ("c", "Folic acid deficiency causes neural tube defects."),
    25: ("c", "Respiratory distress with a survivable injury is red (immediate)."), 26: ("c", "Adult chest compressions: 100-120 per minute."),
    28: ("c", "Current neonatal resuscitation guidance: no routine suctioning for meconium; dry, warm, stimulate and ventilate if needed."), 29: ("b", "C. difficile needs contact precautions (and soap-and-water hand hygiene)."),
    30: ("b", "Neurogenic shock: hypotension with bradycardia (loss of sympathetic tone)."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "Which test confirms active pulmonary tuberculosis (disease) in a client who can produce sputum?", ["Mantoux tuberculin skin test", "Sputum smear/culture or GeneXpert for M. tuberculosis", "ESR", "Full blood count"], "b",
            "Mantoux shows infection, not active disease; sputum microbiology (GeneXpert, smear, culture) confirms TB disease."),
    saq(1, T, """Answer the following questions on labour and delivery.
a) What is the normal foetal heart rate range? (1 mark)
b) List two signs of true labour. (1 mark)
c) Explain two priority nursing interventions during the second stage of labour. (2 marks)
d) What does the term 'effacement' mean in labour? (1 mark)""",
        [("a) 110-160 beats per minute", 1), ("b) Two signs: regular contractions increasing in frequency/ intensity/ duration not relieved by rest; progressive cervical dilatation and effacement; show; pain from back to front", 1), ("c) Two interventions explained: monitor FHR/ maternal vitals and contractions, support pushing and positioning, perineal care/ prevent tears, prepare for delivery, emotional support", 2), ("d) Thinning and shortening of the cervix (taken up), expressed as a percentage", 1)],
        """a) 110-160 beats per minute.
b) Regular contractions that become stronger, longer and more frequent and are not relieved by rest or change of position; progressive cervical dilatation and effacement (also a 'show' and pain starting in the back and radiating to the abdomen).
c) 1. Monitor the foetal heart rate (every 5 minutes or after each contraction) and maternal vital signs and contractions, to detect foetal distress or maternal complications early. 2. Support effective pushing and comfortable upright or lateral positions, give encouragement, keep the bladder empty and protect the perineum (controlled delivery of the head) to prevent tears; prepare for delivery and newborn care.
d) Effacement is the progressive thinning and shortening of the cervix as it is drawn up into the lower uterine segment, measured as a percentage (0-100%)."""),
    saq(2, T, """Answer the following questions on legal and ethical nursing practice.
a) Define informed consent. (1 mark)
b) List two elements that make consent legally valid. (1 mark)
c) Explain two nurse's responsibilities when obtaining or witnessing informed consent. (2 marks)
d) What should a nurse do if a patient refuses treatment? (1 mark)""",
        [("a) Voluntary agreement by a competent person to a procedure after receiving adequate information on nature, benefits, risks and alternatives", 1), ("b) Two elements: capacity/ competence, voluntariness (no coercion), adequate disclosure/ understanding, documented/ signed, specific", 1), ("c) Two responsibilities: verify patient understands (doctor explains), witness signature/ identity, ensure voluntary and competent, refer questions to doctor, use interpreter/ language, document", 2), ("d) Respect the decision, ensure informed of consequences, report to doctor, document refusal (sign refusal form), continue other care", 1)],
        """a) Informed consent is a competent person's voluntary agreement to a treatment or procedure after receiving and understanding adequate information about its nature, purpose, benefits, risks and alternatives (including no treatment).
b) Any two: the patient has capacity (adult, mentally competent); consent is voluntary (no coercion); adequate information has been given and understood; it is specific to the procedure and documented (signed and witnessed).
c) 1. Check that the patient (or legal guardian) has been informed by the doctor and understands, in a language they understand (use an interpreter if needed); if not, inform the doctor before signing. 2. Witness the signature - confirming the patient's identity and that they are signing voluntarily and are competent - and document correctly; the nurse does not explain the procedure in place of the doctor.
d) Respect the patient's right to refuse, make sure they understand the consequences, inform the doctor, document the refusal (and have a refusal form signed), and continue providing other care and support."""),
    saq(3, T, """Answer the following questions on palliative care nursing.
a) Define palliative care. (1 mark)
b) List two symptoms commonly managed in palliative care. (1 mark)
c) Explain two nursing strategies to improve quality of life for palliative patients. (2 marks)
d) Why is effective communication essential in palliative care? (1 mark)""",
        [("a) WHO: approach improving quality of life of patients and families facing life-threatening illness through prevention and relief of suffering (physical, psychosocial, spiritual)", 1), ("b) Two symptoms: pain, breathlessness, nausea/vomiting, constipation, fatigue, anorexia, anxiety/ depression, delirium", 1), ("c) Two strategies: effective pain/ symptom management, comfort care (positioning, mouth/ skin care), psychosocial/ spiritual support, family involvement, advance care planning, dignity", 2), ("d) Builds trust, understands wishes/ goals, shares prognosis honestly, supports decisions and family, reduces fear", 1)],
        """a) Palliative care (WHO) is an approach that improves the quality of life of patients and their families facing problems associated with life-threatening illness, through prevention and relief of suffering by early identification, assessment and treatment of pain and other physical, psychosocial and spiritual problems.
b) Any two: pain, breathlessness, nausea and vomiting, constipation, fatigue, loss of appetite, anxiety and depression, delirium.
c) 1. Effective symptom control - regular pain assessment and analgesia (WHO ladder, including morphine), and comfort measures such as positioning, mouth and skin care. 2. Holistic support - psychological, social and spiritual care (respecting Buddhist or other beliefs, involving lamas if wished), involving the family, supporting the patient's wishes and dignity, and advance care planning.
d) Honest, compassionate communication builds trust, helps understand the patient's goals and wishes, allows shared decisions about care, prepares the patient and family for what lies ahead and reduces fear and distress."""),
    saq(4, T, """Answer the following questions on neonatal care.
a) Define neonatal jaundice. (1 mark)
b) List two common causes of neonatal jaundice. (1 mark)
c) Explain two nursing care priorities for a newborn receiving phototherapy. (2 marks)
d) Why is breastfeeding encouraged during phototherapy? (1 mark)""",
        [("a) Yellow discolouration of skin and sclera due to raised serum bilirubin (> about 5 mg/dL) in newborn", 1), ("b) Two causes: physiological jaundice, breastfeeding/ breast milk jaundice, ABO/Rh incompatibility (haemolysis), G6PD deficiency, prematurity, infection/ sepsis", 1), ("c) Two priorities: eye protection, maximum skin exposure/ turning, monitor temperature, hydration/ feeding/ output, skin care, monitor bilirubin, keep with mother/ breaks for feeding", 2), ("d) Provides fluids and calories, prevents dehydration, promotes bowel movements to excrete bilirubin, bonding", 1)],
        """a) Neonatal jaundice is yellow discolouration of the skin and sclera in a newborn caused by raised serum bilirubin (visible above about 5 mg/dL).
b) Any two: physiological jaundice (immature liver, short red cell life), breastfeeding or breast milk jaundice, haemolytic disease (ABO or Rh incompatibility), G6PD deficiency, prematurity, infection/sepsis.
c) 1. Protect the eyes with eye shields and cover the genitals, while exposing as much skin as possible and turning the baby regularly for effective treatment. 2. Monitor temperature, hydration (feeds, urine and stools, weight), skin condition and bilirubin levels; keep the baby warm, check the light distance, and allow breaks for feeding and maternal bonding.
d) Breastfeeding provides fluids and calories, prevents dehydration from phototherapy, and promotes frequent stools so bilirubin is excreted from the gut (reducing reabsorption); it also supports bonding."""),
]
C1 = """Case I: Acute exacerbation of COPD
Mr Karma, a 60-year-old man with chronic obstructive pulmonary disease (COPD), is admitted with increased shortness of breath, productive cough with green sputum and fever for 3 days. Vital signs on admission: BP 135/80 mmHg, HR 110 bpm, RR 28/min, temperature 38.5 °C, SpO2 85% on room air."""
C2 = """Case II: Heavy bleeding in early pregnancy
Mrs Sonam, a 29-year-old woman, presents to the emergency department with severe abdominal pain and heavy vaginal bleeding at 10 weeks of pregnancy. She reports dizziness and weakness. Vital signs: BP 90/60 mmHg, HR 120 bpm, RR 22/min, temperature 36.8 °C."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("nurse2025", 1, T, C1, items=[
    it("1. Define COPD exacerbation and list three common triggers.", 5,
       [("Definition: acute worsening of respiratory symptoms (dyspnoea, cough, sputum volume/ purulence) beyond day-to-day variation needing change in treatment", 2), ("Three triggers: respiratory infections (bacterial/ viral), air pollution/ smoke (biomass, tobacco), cold weather, non-adherence to medication, allergens", 3)],
       "A COPD exacerbation is an acute event in which respiratory symptoms (breathlessness, cough, sputum volume and purulence) worsen beyond normal day-to-day variation and require a change in treatment. Common triggers: respiratory infections (viral, or bacterial - suggested by his fever and green sputum); air pollution and smoke (tobacco smoking, indoor wood-fire/biomass smoke, dust); cold weather; and poor adherence to inhalers (also heart failure or pulmonary embolism)."),
    it("2. Identify five clinical manifestations in Mr Karma and explain their significance.", 5,
       [("Five manifestations with significance (1 each): dyspnoea/ RR 28 (respiratory distress, increased work), SpO2 85% (hypoxaemia), HR 110 (compensatory/ hypoxia, fever), fever 38.5 (infection), productive green sputum (bacterial infection), BP normal", 5)],
       "1. Increased breathlessness with RR 28/min - respiratory distress and increased work of breathing (risk of fatigue and respiratory failure). 2. SpO2 85% on room air - significant hypoxaemia needing controlled oxygen. 3. Tachycardia (HR 110) - compensation for hypoxia, fever and stress (also effect of bronchodilators). 4. Fever 38.5 °C - indicates infection as the likely trigger. 5. Productive cough with green (purulent) sputum - suggests bacterial infection, needing sputum culture and antibiotics; BP 135/80 shows he is not yet in shock."),
    it("3. Describe five priority nursing interventions to manage an acute exacerbation of COPD.", 10,
       [("Positioning (high Fowler's/ tripod) and maintaining airway", 2), ("Controlled oxygen to target SpO2 88-92% with monitoring (ABG)", 2), ("Administer prescribed bronchodilators (nebulised), steroids, antibiotics; IV access", 2), ("Monitor vitals, SpO2, work of breathing, LOC, ABG, signs of CO2 retention/ fatigue; prepare NIV", 2), ("Airway clearance (cough, chest physiotherapy, sputum sample), hydration/ nutrition, rest, anxiety reduction, fever management", 2)],
       "1. Position upright (high Fowler's or leaning forward on a table) to ease breathing and improve lung expansion. 2. Give controlled oxygen via Venturi mask (24-28%) or nasal cannula to keep SpO2 88-92%, monitoring for CO2 retention. 3. Give prescribed nebulised bronchodilators (salbutamol, ipratropium), corticosteroids and antibiotics; establish IV access. 4. Monitor closely - respiratory rate, SpO2, heart rate, temperature, level of consciousness, use of accessory muscles, ABGs - and report deterioration (drowsiness, rising PaCO2) early; prepare for non-invasive ventilation if needed. 5. Promote airway clearance and comfort - encourage controlled coughing and deep breathing, chest physiotherapy, collect sputum for culture, ensure fluids (unless restricted) and small frequent meals, manage fever, allow rest and reduce anxiety with calm reassurance and breathing techniques (pursed-lip breathing)."),
    it("4. Describe the goals of oxygen therapy and the precautions in COPD patients.", 5,
       [("Goals: correct hypoxaemia, target SpO2 88-92% (PaO2 ~60-70 mmHg), reduce work of breathing, prevent tissue hypoxia", 2.5), ("Precautions: controlled low-flow (Venturi 24-28%, nasal 1-2 L), risk of hypercapnia/ CO2 narcosis with high O2, monitor ABG/ LOC, humidification, fire safety/ no smoking, prescribed as drug", 2.5)],
       "Goals: correct hypoxaemia and prevent tissue hypoxia, aiming for SpO2 88-92% (PaO2 about 60-70 mmHg), and reduce the work of breathing and breathlessness. Precautions: give controlled, low-concentration oxygen (Venturi mask 24-28% or nasal cannula 1-2 L/min) because high-flow oxygen can worsen hypercapnia and cause respiratory acidosis and CO2 narcosis in patients who retain CO2; prescribe oxygen like a drug; monitor SpO2, ABGs, respiratory rate and level of consciousness; humidify if used for long; check equipment; no smoking or open flames near oxygen (fire risk)."),
    it("5. Explain the role of pharmacological management in an acute COPD exacerbation, including two common medications and their nursing considerations.", 5,
       [("Role: relieve bronchospasm, reduce inflammation, treat infection, improve oxygenation, shorten exacerbation", 1), ("Two medications with nursing considerations (2 each): salbutamol/ ipratropium nebulisers (tachycardia, tremor, hypokalaemia, technique), prednisolone/ hydrocortisone (hyperglycaemia, fluid, GI, short course), antibiotics (allergy, culture first, full course)", 4)],
       "Medicines relieve bronchospasm, reduce airway inflammation, treat infection and so improve breathing and shorten the exacerbation. 1. Short-acting bronchodilators - salbutamol (beta-2 agonist) with ipratropium (anticholinergic) by nebuliser: monitor heart rate (tachycardia), tremor and potassium (hypokalaemia); drive nebulisers with air if CO2 retention is a concern; assess breath sounds and response. 2. Systemic corticosteroids - prednisolone 30-40 mg orally for 5 days (or IV hydrocortisone): give with food, monitor blood glucose, BP, fluid retention and mood; short course. Antibiotics (e.g. amoxicillin or doxycycline) are given for purulent sputum: check allergies, send sputum before the first dose and ensure the full course is taken."),
    it("6. Outline patient education topics for Mr Karma to prevent future exacerbations.", 10,
       [("Smoking cessation and avoid smoke/ biomass, dust", 2), ("Correct inhaler technique and adherence to maintenance therapy", 2), ("Vaccination: influenza, pneumococcal", 1.5), ("Recognising early signs of exacerbation and action plan/ when to seek care", 1.5), ("Breathing exercises, pulmonary rehabilitation/ exercise, nutrition, hydration, infection prevention (hand hygiene), follow-up", 3)],
       "1. Stop smoking (offer counselling and support) and avoid second-hand smoke, wood/biomass smoke (use ventilation, improved stoves) and dust. 2. Use inhalers correctly (check technique, use spacer) and take maintenance medicines regularly even when well. 3. Vaccination - yearly influenza and pneumococcal vaccines. 4. Recognise early warning signs of an exacerbation (more breathlessness, change in sputum colour or amount, fever) and follow a written action plan - start rescue medicines and seek care early. 5. Breathing techniques (pursed-lip and diaphragmatic breathing) and energy conservation. 6. Regular physical activity and pulmonary rehabilitation. 7. Good nutrition (small frequent meals, adequate protein) and adequate fluids to thin secretions. 8. Infection prevention - hand-washing, avoid sick contacts, keep warm in cold weather. 9. Safe use of home oxygen if prescribed. 10. Regular follow-up at the health centre."),
    it("7. Prepare a nursing care plan for this patient related to decreased tissue perfusion. Include rationales for each intervention.", 10,
       [("Nursing diagnosis with related factor and evidence (ineffective/ decreased tissue perfusion related to hypoxaemia/ impaired gas exchange as evidenced by SpO2 85%, tachycardia, cyanosis)", 2), ("Goal/ expected outcome (SpO2 88-92%, HR < 100, warm extremities, alert within 24-48 h)", 2), ("Interventions with rationales (at least 4): oxygen, positioning, monitoring perfusion signs (capillary refill, colour, LOC, urine output), medications, fluid balance, activity/ rest, reduce oxygen demand (fever control)", 5), ("Evaluation", 1)],
       "Nursing diagnosis: ineffective peripheral/tissue perfusion related to hypoxaemia from impaired gas exchange (COPD exacerbation with infection), as evidenced by SpO2 85%, tachycardia 110/min, breathlessness (and possible cyanosis, cool extremities). Goal: within 24-48 hours SpO2 88-92%, HR below 100, warm extremities with capillary refill under 2 seconds, alert and oriented, urine output at least 0.5 mL/kg/h. Interventions and rationales: 1. Give controlled oxygen as prescribed - raises arterial oxygen to improve tissue oxygen delivery while avoiding CO2 retention. 2. Position upright - improves ventilation and gas exchange. 3. Monitor SpO2, vital signs, skin colour, temperature, capillary refill, level of consciousness and urine output hourly - detects early worsening of perfusion. 4. Give bronchodilators, steroids and antibiotics as ordered - treat the cause of hypoxaemia. 5. Control fever with antipyretics and cooling, and plan rest periods - reduce oxygen demand. 6. Maintain fluid balance (IV/oral fluids, intake-output chart) - supports circulating volume and thins secretions. 7. Encourage gentle leg exercises and prevent DVT - promotes circulation. Evaluation: compare outcomes with goals and revise the plan."),
])
Q += case("nurse2025", 2, T, C2, items=[
    it("1. What is the likely diagnosis? Define it.", 5,
       [("Likely diagnosis: incomplete/ inevitable abortion (spontaneous miscarriage) with haemorrhagic (hypovolaemic) shock; ruptured ectopic pregnancy to be excluded", 3), ("Definition: spontaneous loss of pregnancy before 20 (or 28) weeks; incomplete - part of products retained with bleeding, open os", 2)],
       "Likely diagnosis: incomplete (or inevitable) spontaneous abortion (miscarriage) with hypovolaemic (haemorrhagic) shock - heavy vaginal bleeding, severe cramping pain, hypotension and tachycardia at 10 weeks. A ruptured ectopic pregnancy must be excluded urgently (it also causes pain and shock, though vaginal bleeding is usually lighter). Definition: abortion is the loss of a pregnancy before the foetus is viable (before 20 weeks in WHO terms, 28 weeks in some national definitions); an incomplete abortion is when some products of conception have been expelled but part remains in the uterus, with an open cervical os and continuing bleeding."),
    it("2. List five immediate nursing assessments to prioritise in this patient.", 5,
       [("Five assessments (1 each): ABC and vital signs (BP, HR, RR, SpO2, LOC), amount/ character of bleeding (pad count, clots, tissue), pain assessment (site, severity), signs of shock (skin, capillary refill, urine output), obstetric history/ LMP/ pregnancy test, blood group/ Hb", 5)],
       "1. Airway, breathing and circulation with vital signs every 15 minutes - BP, pulse, respiratory rate, SpO2, temperature and level of consciousness. 2. Amount and nature of vaginal bleeding - pad count, clots, passage of tissue. 3. Pain - site, character, severity and shoulder-tip pain (suggesting intra-abdominal bleeding/ectopic). 4. Signs of shock and perfusion - skin colour, temperature, sweating, capillary refill, urine output. 5. History - last menstrual period, pregnancy confirmation, previous pregnancies or miscarriages, allergies, blood group and Rh status."),
    it("3. Describe five emergency nursing interventions to stabilise Mrs Sonam.", 10,
       [("Call for help, position supine with legs elevated, keep warm, oxygen", 2), ("Two large-bore IV cannulae, bloods (CBC, grouping and cross-match), rapid crystalloid infusion, blood transfusion as ordered", 2), ("Administer uterotonics (oxytocin/ misoprostol) and analgesia/ antibiotics as ordered", 2), ("Monitor vitals, bleeding, urine output (catheter), fluid balance", 2), ("Prepare for uterine evacuation (MVA/ D&C) or surgery; psychological support; keep products for examination; anti-D if Rh negative", 2)],
       "1. Call for help and alert the doctor; lay her flat with legs elevated, keep her warm and give oxygen. 2. Insert two large-bore IV cannulae, take blood for haemoglobin, grouping and cross-matching, and give rapid IV crystalloids (normal saline/Ringer's lactate) as ordered; arrange blood transfusion. 3. Give prescribed medicines - uterotonics (oxytocin infusion or misoprostol) to reduce bleeding, analgesia, and antibiotics if infection is suspected; anti-D immunoglobulin if Rh negative. 4. Monitor closely - vital signs every 15 minutes, bleeding (pad count), urine output via catheter, fluid balance chart and level of consciousness. 5. Prepare for evacuation of retained products (manual vacuum aspiration or D&C) or laparotomy if ectopic - keep nil by mouth, obtain consent, and keep any expelled tissue for examination; provide reassurance and stay with her."),
    it("4. Describe possible complications of the condition and nursing preventive measures.", 5,
       [("Complications: haemorrhagic shock, infection/ septic abortion, retained products, uterine perforation (procedure), DIC, Rh isoimmunisation, anaemia, psychological distress/ infertility", 2.5), ("Prevention: early fluid/ blood replacement and monitoring, aseptic technique and antibiotics, complete evacuation, anti-D for Rh negative, iron, monitor for signs of infection/ bleeding, emotional support", 2.5)],
       "Complications: haemorrhagic shock and death; infection (septic abortion) leading to sepsis or pelvic inflammatory disease; retained products and continuing bleeding; uterine perforation or injury during evacuation; disseminated intravascular coagulation; anaemia; Rh isoimmunisation (if Rh negative); later infertility; grief, anxiety and depression. Nursing prevention: early recognition and replacement of fluid and blood with close monitoring; strict asepsis and prescribed antibiotics, monitoring temperature, discharge and pain; ensuring complete evacuation and observing bleeding afterwards; anti-D within 72 hours for Rh-negative women; iron supplements and nutrition; and early emotional support and counselling."),
    it("5. Outline patient education and psychological support strategies after stabilisation.", 5,
       [("Education: warning signs (heavy bleeding, fever, foul discharge, severe pain) to report, rest, hygiene, avoid intercourse/ tampons ~2 weeks, iron/ nutrition, follow-up, contraception/ future pregnancy timing, folic acid", 2.5), ("Psychological: acknowledge grief, explain it was not her fault, involve husband/ family, cultural/ religious support, counselling referral, privacy", 2.5)],
       "Education: report warning signs at once - heavy bleeding, fever, foul-smelling discharge, severe abdominal pain or dizziness; rest and gradual return to activities; perineal hygiene, using pads not tampons and avoiding intercourse for about two weeks; take iron and a nutritious diet; attend follow-up; discuss family planning and timing of the next pregnancy, folic acid before conceiving, and early antenatal care next time. Psychological support: acknowledge her loss and grief, listen with empathy, reassure her that most miscarriages are not caused by anything she did, involve her husband and family as she wishes, respect religious practices and rituals, maintain privacy and confidentiality, and refer for counselling if she shows prolonged distress or depression."),
    it("6. Identify and explain two priority diagnostic investigations that may be ordered.", 5,
       [("Pelvic/ transvaginal ultrasound - confirm intrauterine pregnancy, retained products, viability, free fluid/ ectopic", 2.5), ("Blood tests: Hb/ CBC (blood loss), blood group and Rh, cross-match; serum beta-hCG (ectopic/ follow-up), coagulation", 2.5)],
       "1. Pelvic (transvaginal or abdominal) ultrasound - shows whether the pregnancy is intrauterine, whether products of conception are retained, foetal viability, and free fluid in the abdomen suggesting a ruptured ectopic pregnancy; it guides management (evacuation or surgery). 2. Blood tests - full blood count/haemoglobin to assess blood loss and need for transfusion, blood grouping, Rh typing and cross-matching (anti-D if Rh negative), with serum beta-hCG (helps diagnose ectopic and confirm completion later) and coagulation profile if heavy bleeding."),
    it("7. Discuss the nurse's role in preparing the patient for possible surgical intervention, including preoperative responsibilities.", 5,
       [("Consent: ensure informed consent signed, explanation in her language", 1), ("Physical preparation: NPO, IV fluids/ blood available, vital signs, remove jewellery/ dentures, catheter/ empty bladder, ID band, allergies, pre-medication as ordered, site preparation", 2), ("Documentation and checklist, lab results (Hb, group, cross-match), handover to theatre", 1), ("Psychological support, family informed", 1)],
       "Ensure informed consent is obtained by the doctor and signed, explained in a language she understands. Physical preparation: keep her nil by mouth, maintain IV fluids and ensure cross-matched blood is available; record baseline vital signs; check identity band, allergies and the preoperative checklist; remove jewellery, dentures, nail polish and make-up; empty the bladder or insert a catheter; give prescribed premedication and antibiotics; prepare the perineal area. Ensure investigation results (Hb, blood group, cross-match, ultrasound) are in the file and hand over clearly to the theatre team. Provide reassurance, explain what will happen and keep her family informed."),
    it("8. As a nurse, how would you provide culturally sensitive care to Mrs Sonam during this crisis?", 5,
       [("Respect beliefs and religious practices (Buddhist rituals, prayers, lama/ astrologer, handling of foetal remains per wishes)", 2), ("Communication in Dzongkha/ her language, privacy and modesty (female staff), involve husband/ family as she wishes", 2), ("Non-judgemental, respect decisions and dignity, avoid stigma, support grieving customs", 1)],
       "Communicate in Dzongkha or her preferred language and explain simply. Respect privacy and modesty - use screens, female staff where possible and limit exposure. Ask about and respect her beliefs and practices, such as prayers, butter lamps, consulting a lama or astrologer, and wishes about the remains of the pregnancy, within hospital policy. Involve her husband and family in decisions and support as she wishes, while respecting her confidentiality. Be non-judgemental and compassionate, avoid blame or stigma, and support culturally appropriate grieving rituals."),
    it("9. Develop a nursing care plan related to fluid volume deficit for this patient.", 5,
       [("Nursing diagnosis: deficient fluid volume related to active blood loss as evidenced by BP 90/60, HR 120, dizziness", 1), ("Goal: stable vitals (SBP > 100, HR < 100), urine output ≥ 30 mL/h, bleeding controlled within hours", 1), ("Interventions with rationale: IV fluids/ blood, monitor vitals/ bleeding/ urine output, position, oxygen, uterotonics, intake-output chart, lab monitoring", 2), ("Evaluation", 1)],
       "Nursing diagnosis: deficient fluid volume related to active vaginal blood loss, as evidenced by BP 90/60 mmHg, pulse 120/min, dizziness and weakness. Goal: within 2-4 hours, systolic BP above 100 mmHg, pulse below 100/min, urine output at least 30 mL/hour, bleeding controlled and alert. Interventions and rationales: give IV crystalloids and blood as prescribed - restores circulating volume; position flat with legs raised - improves venous return to vital organs; give uterotonics as ordered - contracts the uterus to reduce bleeding; monitor vital signs every 15 minutes, pad count and urine output with an intake-output chart - assesses response and detects ongoing loss; give oxygen - improves tissue oxygenation; monitor haemoglobin - guides transfusion. Evaluation: vital signs stable, adequate urine output, bleeding minimal - goals met; otherwise escalate."),
])
PATTERN = STANDARD
