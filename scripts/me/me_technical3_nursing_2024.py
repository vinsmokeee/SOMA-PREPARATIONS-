"""ME Technical Paper III (Subject Specialisation Paper), Nursing, BCSE 2024 - real paper (PDF sent by the founder).
Standard pattern, same as the 2025 Nursing paper (the latest). MCQ 17's options (lost in the PDF text) re-typed.
Replaced MCQs (more than one option defensible): 12 (asthma: airway clearance vs gas exchange) and 26 (tonsillar abscess priority).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Nursing): BCSE 2024, batch 1"
GROUP_TAG = "nurse2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "nursing"
ADDS_TO_PAPER = True  # 2025 is the latest Nursing paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Nursing"

MCQ = r"""[
{
"n": 1,
"stem": "Which electrolyte imbalance most likely occurs in a patient with chronic kidney disease?",
"opts": [
"Hypocalcemia",
"Hypernatremia",
"Hypomagnesemia",
"Hyperkalemia"
]
},
{
"n": 2,
"stem": "A patient with myasthenia gravis is at risk for:",
"opts": [
"Respiratory failure",
"Hypertensive crisis",
"Hypoglycemia",
"Hypercalcemia"
]
},
{
"n": 3,
"stem": "The primary goal in the management of diabetic ketoacidosis (DKA) is to:",
"opts": [
"Lower blood glucose levels rapidly",
"Correct fluid and electrolyte imbalances",
"Reduce ketone production",
"Manage pain"
]
},
{
"n": 4,
"stem": "Which drug is used as an antidote for acetaminophen overdose?",
"opts": [
"Naloxone",
"Flumazenil",
"N-acetylcysteine",
"Atropine"
]
},
{
"n": 5,
"stem": "Which condition is characterized by the premature separation of the placenta from the uterine wall?",
"opts": [
"Placenta previa",
"Ectopic pregnancy",
"Molar pregnancy",
"Abruptio placentae"
]
},
{
"n": 6,
"stem": "The most common cause of postpartum hemorrhage is:",
"opts": [
"Uterine atony",
"Retained placenta",
"Lacerations",
"Coagulopathy"
]
},
{
"n": 7,
"stem": "The Apgar score includes all of the following parameters EXCEPT:",
"opts": [
"Heart rate",
"Respiratory effort",
"Muscle tone",
"Blood pressure"
]
},
{
"n": 8,
"stem": "The concept of \"informed consent\" is based on which ethical principle?",
"opts": [
"Nonmaleficence",
"Justice",
"Autonomy",
"Fidelity"
]
},
{
"n": 9,
"stem": "What is the normal pH range of blood?",
"opts": [
"7.25-7.35",
"7.35-7.45",
"7.45-7.55",
"7.55-7.65"
]
},
{
"n": 10,
"stem": "What is the most appropriate action if a patient is suspected of having a stroke?",
"opts": [
"Give aspirin",
"Administer oxygen",
"Perform a CT scan immediately",
"Start an IV line"
]
},
{
"n": 11,
"stem": "A patient presents with a sudden onset of severe chest pain, radiating to the back, and a difference in blood pressure between the arms. What is the most likely diagnosis?",
"opts": [
"Myocardial infarction",
"Pulmonary embolism",
"Aortic dissection",
"Pneumothorax"
]
},
{
"n": 12,
"stem": "What is the priority nursing diagnosis for a patient experiencing an acute asthma attack?",
"opts": [
"Impaired gas exchange",
"Ineffective airway clearance",
"Anxiety",
"Activity intolerance"
]
},
{
"n": 13,
"stem": "A nurse is assessing a patient with suspected meningitis. Which of the following findings would indicate a positive Brudzinski’s sign?",
"opts": [
"Pain and resistance when the neck is flexed",
"Flexion of the hips and knees when the neck is flexed",
"Inability to straighten the leg when the hip is flexed",
"Nuchal rigidity and photophobia"
]
},
{
"n": 14,
"stem": "A patient is receiving a blood transfusion and develops chills, fever, and back pain. What is the priority nursing action?",
"opts": [
"Stop the transfusion immediately",
"Slow the rate of infusion",
"Administer acetaminophen",
"Notify the physician"
]
},
{
"n": 15,
"stem": "A nurse is caring for a patient with hyperkalemia. Which of the following ECG changes is most indicative of this condition?",
"opts": [
"Prolonged QT interval",
"Depressed ST segment",
"Peaked T waves",
"Inverted P waves"
]
},
{
"n": 16,
"stem": "Packed red cells have been prescribed for a patient with low haemoglobin and hematocrit levels. The nurse takes the patient's temperature before handling the blood transfusion and records 100.8 degrees Fahrenheit. Which action should the nurse take?",
"opts": [
"Give an antipyretic and begin the transfusion.",
"Proceeds with the transfusion.",
"Administer an antihistamine and begin transfusion.",
"Delay hanging the blood and inform the physician."
]
},
{
"n": 17,
"stem": "A patient with a history of chronic urinary tract infections complains of urinary frequency and a burning sensation during urination. To determine if the issue involves the kidneys, where should the nurse assess for pain or discomfort?",
"opts": [
"Urinary meatus",
"Pain in the labium",
"Suprapubic area",
"Right or left costovertebral angle"
]
},
{
"n": 18,
"stem": "A nurse is assessing a patient for signs of renal dysfunction. Which clinical manifestation would most likely indicate that the patient is experiencing fluid overload due to impaired kidney function?",
"opts": [
"Edema in the extremities",
"Dry, flaky skin",
"Decreased blood pressure",
"Increased urine output"
]
},
{
"n": 19,
"stem": "Which of the following findings is the best indication that fluid replacement for the patient with hypovolemic shock is adequate?",
"opts": [
"Respiratory rate of 21",
"Diastolic Blood pressure greater than 90mmHg",
"Urine output greater than 30ml/hour",
"Systolic Blood pressure greater than 110mmHg"
]
},
{
"n": 20,
"stem": "Dorji, a patient with myasthenia gravis, is scheduled to receive immunosuppressive therapy. Which of the following explains why this therapy is expected to be effective in managing his condition?",
"opts": [
"Promotes the removal of antibodies that impair the transmission of impulses",
"Decreases the production of antibodies that attack the acetylcholine receptors",
"Stimulates the production of acetylcholine at the neuromuscular junction",
"Inhibits the breakdown of acetylcholine at the neuromuscular junction"
]
},
{
"n": 21,
"stem": "When faced with an ethical dilemma, the nursing code of ethics advises nurses to:",
"opts": [
"Make decisions independently",
"Ignore dilemma",
"Consult the ethics committee or other resources",
"Follow the physician’s order without questions"
]
},
{
"n": 22,
"stem": "According to the nursing code of ethics, the nurse’s role in a patient’s informed consent is to:",
"opts": [
"Make the decision for the patient",
"Provide all necessary information and support patient understanding",
"Document the physician’s explanation",
"Minimize patient questions"
]
},
{
"n": 23,
"stem": "A 25-year-old woman presents to the Emergency Room with acute gastritis and signs of moderate dehydration. What is the most appropriate nursing diagnosis?",
"opts": [
"Infection",
"Fluid volume deficit",
"Activity intolerance",
"Fluid volume excess"
]
},
{
"n": 24,
"stem": "A patient with blunt trauma underwent exploratory laparotomy for repair of an intra-abdominal injury. He develops oliguria and hypotension four hours post-surgery. Which is the priority nursing diagnosis?",
"opts": [
"Nausea",
"Risk for infection",
"Deficient fluid volume",
"Impaired urinary elimination"
]
},
{
"n": 25,
"stem": "Intrauterine growth curves classify a 32-week-old preterm newborn. Birth weight and gestational age show the infant’s growth rate falls below the 10th percentile. What is the priority nursing diagnosis for a newborn with a small for gestational age?",
"opts": [
"Risk for injury related to impaired gluconeogenesis.",
"Risk for impaired gas exchange related to meconium aspiration.",
"Risk for ineffective thermoregulation related to lack of subcutaneous fate.",
"Risk for altered nutrition less than body requirements related to increased metabolic needs."
]
},
{
"n": 26,
"stem": "A 14-year-old patient is admitted with a tonsillar abscess experiencing high fever, dysphagia and difficulty speaking. Which nursing problem needs attention first?",
"opts": [
"Acute pain related to throat inflammation",
"Imbalanced nutrition due to inadequate intake",
"Impaired swallowing related to dysphagia",
"Hyperthermia related to acute infection"
]
},
{
"n": 27,
"stem": "Which of the following offers the best way to set priority?",
"opts": [
"Assessing nursing needs and problems",
"Giving instructions on how nursing needs are to be met",
"Controlling and evaluating the delivery of nursing care",
"Assigning a safe nurse-to-patient ratio"
]
},
{
"n": 28,
"stem": "A patient is receiving a platelet transfusion. The nurse determines that the patient is gaining from this therapy if the patient exhibits which of the following?",
"opts": [
"Less frequent febrile episode",
"Increased level of hematocrit",
"Fewer episodes of bleeding",
"Increased level of haemoglobin"
]
},
{
"n": 29,
"stem": "A nurse is surveying to assess nurses’ attitudes towards pain management practices. What type of data will be collected through this survey?",
"opts": [
"Quantitative data",
"Qualitative data",
"Mixed method data",
"Meta-analysis data"
]
},
{
"n": 30,
"stem": "A four-year-old boy presented with a firm and non-tender mass that his mother had discovered in the right upper abdominal quadrant. He was admitted to the hospital and underwent a complete surgical excision of a renal tumour that had extended beyond the kidney. The child was then scheduled for radiation and chemotherapy treatment. Which stage was the tumour?",
"opts": [
"I",
"II",
"III",
"IV"
]
}
]"""

KEY = {
    1: ("d", "Failing kidneys cannot excrete potassium, so hyperkalaemia is the most common and dangerous imbalance in CKD."),
    2: ("a", "Weakness of respiratory muscles (myasthenic or cholinergic crisis) can cause respiratory failure."),
    3: ("b", "First priority in DKA is restoring fluid volume and correcting electrolytes (especially potassium); insulin then lowers glucose gradually."),
    4: ("c", "N-acetylcysteine replenishes glutathione and is the antidote for paracetamol (acetaminophen) poisoning."),
    5: ("d", "Abruptio placentae is premature separation of a normally implanted placenta."),
    6: ("a", "Uterine atony causes about 70-80% of postpartum haemorrhage."),
    7: ("d", "Apgar: Appearance (colour), Pulse, Grimace (reflex irritability), Activity (tone), Respiration - not blood pressure."),
    8: ("c", "Informed consent respects the patient's autonomy - the right to decide."),
    9: ("b", "Normal arterial blood pH is 7.35-7.45."),
    10: ("c", "An urgent non-contrast CT is needed first to exclude haemorrhage before any antiplatelet or thrombolytic treatment."),
    11: ("c", "Tearing chest pain radiating to the back with unequal arm blood pressures suggests aortic dissection."),
    13: ("b", "Brudzinski's sign: passive neck flexion causes involuntary flexion of the hips and knees."),
    14: ("a", "Chills, fever and back pain suggest a haemolytic reaction: stop the transfusion immediately, keep the IV open with saline, then notify."),
    15: ("c", "Tall, peaked T waves are the earliest typical ECG sign of hyperkalaemia."),
    16: ("d", "A fever before transfusion would mask a reaction: delay hanging the blood and inform the physician."),
    17: ("d", "Kidney (upper urinary tract) involvement causes costovertebral angle (flank) tenderness."),
    18: ("a", "Impaired kidneys retain sodium and water, causing peripheral oedema."),
    19: ("c", "Urine output above 30 mL/hour shows adequate renal perfusion and fluid replacement."),
    20: ("b", "Myasthenia gravis is autoimmune; immunosuppressants reduce production of antibodies against acetylcholine receptors."),
    21: ("c", "Ethical dilemmas should be resolved by consulting the ethics committee and other resources."),
    22: ("b", "The nurse ensures the patient has the necessary information and understands it (the physician explains the procedure)."),
    23: ("b", "Dehydration from gastritis (vomiting) = fluid volume deficit."),
    24: ("c", "Oliguria and hypotension after abdominal trauma surgery suggest bleeding/ hypovolaemia: deficient fluid volume."),
    25: ("a", "SGA infants have small glycogen stores and are at high risk of hypoglycaemia - the priority."),
    27: ("a", "Priorities are set from the assessment of the patients' nursing needs and problems."),
    28: ("c", "Platelets prevent and control bleeding, so fewer bleeding episodes show benefit."),
    29: ("a", "An attitude survey (rating scales) yields quantitative data."),
    30: ("b", "Wilms tumour extending beyond the kidney but completely excised is stage II."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "The best position for a conscious patient having an acute asthma attack is", ["Supine", "High Fowler's (sitting upright)", "Trendelenburg", "Left lateral"], "b",
            "Sitting upright lowers the diaphragm and eases breathing."),
    new_mcq(2, T, "The minimum acceptable urine output for an adult is about", ["0.1 mL/kg/hour", "0.5 mL/kg/hour", "2 mL/kg/hour", "5 mL/kg/hour"], "b",
            "Below 0.5 mL/kg/hour (about 30 mL/hour) is oliguria."),
]

SA = [
    ("Answer the following questions on End-of-Life Care.\na) Define the term 'advance directive'. (1 mark)\nb) Explain the role of advance directives in end-of-life care planning. (2 marks)\nc) Explain the ethical implications of respecting advance directives in cases where family members disagree with the patient's wishes. (2 marks)",
     [("a) Written/ legal statement made by a competent person about the treatment they want or refuse (and/or who decides for them) if they later lose capacity", 1),
      ("b) Guides care to match patient's values; avoids unwanted treatment (CPR, ventilation); names proxy; reduces family burden/ conflict; supports palliative planning", 2),
      ("c) Autonomy vs family wishes/ beneficence; directive generally prevails if valid and applicable; communication, family meetings, ethics committee, legal/ cultural sensitivity, documentation", 2)],
     "a) An advance directive is a written (legal) statement in which a competent adult states in advance what medical treatment they would want or refuse, and/or who should make decisions for them (a health-care proxy), if they later become unable to decide for themselves.\nb) It guides end-of-life care so that treatment matches the patient's values and wishes - for example decisions about CPR, mechanical ventilation, tube feeding and place of death; it names a decision-maker, prevents unwanted or futile treatment, supports timely palliative care, and reduces the burden and conflict on family and staff when the patient can no longer speak.\nc) Respecting a valid directive upholds autonomy even when family members disagree; overriding it would disrespect the patient, though family distress must be handled with compassion. The nurse should check that the directive is valid and applies to the situation, communicate openly, hold family meetings with the team, explain the patient's wishes and the plan, involve the ethics committee or legal advice where conflict persists, be sensitive to cultural and religious values, and document carefully. Beneficence and non-maleficence also support avoiding treatment the patient did not want."),
    ("Write short answers to the following questions on diabetic ketoacidosis (DKA).\na) What are the clinical manifestations of DKA? (1 mark)\nb) Explain the pathophysiology of DKA. (2 marks)\nc) Describe the nursing management for a patient with DKA. (2 marks)",
     [("a) Polyuria, polydipsia, dehydration, nausea/ vomiting, abdominal pain, Kussmaul breathing, fruity (acetone) breath, weakness, confusion/ coma; high glucose, ketones, metabolic acidosis", 1),
      ("b) Insulin deficiency + counter-regulatory hormones → hyperglycaemia → osmotic diuresis, dehydration, electrolyte loss; lipolysis → free fatty acids → ketone bodies → metabolic acidosis", 2),
      ("c) Airway/ monitoring, IV fluids (0.9% saline), IV insulin infusion, potassium replacement, monitor glucose hourly, electrolytes, ABG, input-output, neuro status, treat cause, education", 2)],
     "a) Polyuria, polydipsia, dehydration (dry mucosa, tachycardia, hypotension), nausea, vomiting and abdominal pain, Kussmaul (deep, rapid) breathing, fruity acetone breath, weakness, drowsiness, confusion and coma; blood glucose usually above 250 mg/dL, ketones in blood and urine, and metabolic acidosis (pH below 7.3, low bicarbonate).\nb) Absolute or relative insulin deficiency, with raised counter-regulatory hormones (glucagon, cortisol, adrenaline), means glucose cannot enter cells and the liver releases more glucose, causing hyperglycaemia. This produces osmotic diuresis, severe dehydration and loss of sodium, potassium and phosphate. Without insulin, fat is broken down (lipolysis) and the liver converts free fatty acids into ketone bodies (acetoacetate, beta-hydroxybutyrate), causing metabolic acidosis; the body compensates with Kussmaul breathing.\nc) Assess airway, breathing and circulation; establish IV access and give IV fluids (normal saline) as ordered to correct dehydration; start an IV insulin infusion per protocol; monitor and replace potassium (check before insulin); monitor blood glucose hourly, electrolytes, blood gases and ketones; strict intake-output and vital signs; cardiac monitoring for arrhythmias; neurological checks; add dextrose when glucose falls; identify and treat the cause (infection, missed insulin); and educate on sick-day rules and insulin adherence."),
    ("Write short answers on heart failure.\na) What is heart failure? (2 marks)\nb) List down the types of heart failure. (3 marks)",
     [("a) Condition in which the heart cannot pump enough blood to meet the body's needs (or only at high filling pressures), due to structural/ functional impairment", 2),
      ("b) Left-sided and right-sided; systolic (HFrEF) and diastolic (HFpEF); acute and chronic; congestive; high-output and low-output", 3)],
     "a) Heart failure is a clinical syndrome in which the heart is unable to pump enough blood to meet the body's metabolic needs, or can do so only with raised filling pressures, because of structural or functional impairment of ventricular filling or ejection. It causes fatigue, breathlessness and fluid retention (congestion).\nb) Types: left-sided heart failure (pulmonary congestion - dyspnoea, crackles) and right-sided heart failure (systemic congestion - oedema, raised JVP, hepatomegaly); systolic heart failure/ heart failure with reduced ejection fraction (HFrEF) and diastolic heart failure/ heart failure with preserved ejection fraction (HFpEF); acute and chronic heart failure; congestive heart failure; high-output and low-output failure."),
    ("Answer questions on pulse points/sites.\na) How many common pulse sites/points are there? List five of the common pulse sites. (3 marks)\nb) When assessing a patient's pulse rate, what should a nurse evaluate? (2 marks)",
     [("a) Nine common pulse sites: temporal, carotid, apical, brachial, radial, femoral, popliteal, posterior tibial, dorsalis pedis (any five)", 3),
      ("b) Rate, rhythm, volume/ strength (amplitude), equality/ symmetry on both sides, elasticity of the artery wall; compare with apical pulse/ baseline", 2)],
     "a) There are nine common pulse sites: temporal, carotid, apical, brachial, radial, femoral, popliteal, posterior tibial and dorsalis pedis (pedal). Any five, e.g. radial (wrist), carotid (neck), brachial (inner elbow), femoral (groin) and dorsalis pedis (top of the foot).\nb) The nurse evaluates the rate (beats per minute; normal adult 60-100), rhythm (regular or irregular - count for a full minute if irregular and check the apical pulse for a pulse deficit), volume or strength (bounding, normal, weak, thready), equality on both sides of the body, and the elasticity of the arterial wall, and compares the findings with the patient's baseline and condition."),
]
for i, (s, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=5, topic=T, stem=s, key_points=kp, model=mod))

C1 = """Case I
Patient background: Ms. Sumchum (pseudonym), a 65-year-old woman, is admitted to the emergency department with sudden onset of right-sided weakness, difficulty speaking and a severe headache that started about 2 hours ago. She has a history of hypertension and hyperlipidaemia and is on lisinopril and atorvastatin. She lives alone and did not recognise the symptoms as serious until her neighbour noticed her difficulty speaking and called for help.
Vital signs: BP 180/100 mmHg; HR 88 bpm; RR 20/min; temperature 98.6 °F.
Physical examination: right-sided hemiparesis with significant weakness of the right arm and leg; aphasia with difficulty forming coherent sentences; right facial droop; a severe headache described as 'the worst headache of my life'.
Neurological examination: GCS 14; NIH Stroke Scale (NIHSS) 12.
A non-contrast CT scan of the head shows an area of ischaemia in the left middle cerebral artery (MCA) territory, with no evidence of haemorrhage. Laboratory tests: normal blood glucose; elevated cholesterol; normal renal function."""
C2 = """Case II
Mr. Tshewang, a 57-year-old man, arrives at the Emergency Department with chest pain that began about one hour after dinner while he was working. He describes an intense 'crushing pressure' in the centre of his chest, extending down his left arm and towards his back, severity 7/10. He is diaphoretic and pale, with shortness of breath.
On assessment there is no jugular vein distension or oedema; heart sounds are normal (S1 and S2 present); the lungs are clear with scattered wheezes. Vital signs: BP 140/90 mmHg; HR 92 bpm; SpO2 90% on room air; RR 32/min; temperature 36.9 °C; weight 104 kg. A 12-lead ECG, chest X-ray and cardiac markers were ordered.
He was diagnosed with myocardial infarction (heart attack), and interventions were implemented to relieve the chest pain and improve oxygenation."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("nurse2024", 1, T, C1, items=[
    it("1. Describe how Ms. Sumchum's history of hypertension and hyperlipidaemia contributes to her stroke risk. What strategies should be implemented to manage these conditions in the context of her stroke treatment?", 10,
       [("Risk: hypertension damages vessel walls, accelerates atherosclerosis, small vessel disease; hyperlipidaemia → atherosclerotic plaques in carotid/ cerebral arteries → thrombosis/ embolism; combined effect", 5),
        ("Management: acute BP - permissive hypertension, lower only if >220/120, or to <185/110 before thrombolysis; then long-term target <130/80 with antihypertensives (ACE inhibitor); high-intensity statin, LDL target, diet, adherence, monitoring", 5)],
       "Contribution: long-standing hypertension damages the endothelium and arterial walls, speeds up atherosclerosis in the carotid and cerebral arteries and causes small-vessel disease, and is the single most important modifiable stroke risk factor. Hyperlipidaemia (high LDL cholesterol) deposits lipid in the arterial wall, forming atherosclerotic plaques that narrow vessels and can rupture, causing thrombosis in situ or emboli to the brain - here in the left MCA territory. Together they multiply the risk. Management in the acute phase: avoid lowering BP too fast - permissive hypertension maintains perfusion of the penumbra; if she is to receive thrombolysis, BP must be brought below 185/110 mmHg before and kept below 180/105 for 24 hours (e.g. IV labetalol), otherwise treat only if above 220/120. After the acute phase: long-term BP control to below about 130/80 with antihypertensives (continue/adjust lisinopril, add others), high-intensity statin therapy (atorvastatin 40-80 mg) to lower LDL, regular monitoring of BP and lipids, medication adherence (especially as she lives alone), diet low in salt and saturated fat, and lifestyle changes."),
    it("2. Discuss the importance of timing in stroke treatment and define the 'therapeutic window'. Is Ms. Sumchum still within this window based on her symptoms and onset time? How does this influence her treatment plan?", 10,
       [("'Time is brain' - about 1.9 million neurons lost per minute; penumbra salvageable only if reperfused early; therapeutic window: period after onset when treatment (IV thrombolysis up to 4.5 h; thrombectomy up to 6-24 h) is effective and safe", 5),
        ("She is at about 2 h, ischaemic, no haemorrhage → within the window for IV alteplase/ tenecteplase (check eligibility, BP <185/110); urgent door-to-needle <60 min; consider thrombectomy (CTA for large vessel occlusion); monitoring", 5)],
       "Timing is critical: 'time is brain' - roughly 1.9 million neurons die every minute of untreated large-vessel ischaemic stroke. Around the dead core is the ischaemic penumbra, tissue that can be saved only if blood flow is restored quickly. The therapeutic window is the period after symptom onset (last known well) in which reperfusion treatment is effective and its benefits outweigh the risks: IV thrombolysis with alteplase (or tenecteplase) within 4.5 hours, and mechanical thrombectomy for large-vessel occlusion within 6 hours (up to 24 hours in selected patients with imaging). Ms. Sumchum's symptoms began about 2 hours ago (onset time must be confirmed - the neighbour's report and last known well), and the CT shows ischaemia without haemorrhage, so she is within the window for thrombolysis. Her plan should therefore be urgent: rapid eligibility check (contraindications, anticoagulants, recent surgery, glucose normal), lower BP to below 185/110 mmHg before treatment, give IV thrombolysis aiming for door-to-needle time under 60 minutes, consider CT angiography for a large-vessel occlusion and thrombectomy, then close neurological and BP monitoring in a stroke unit. (Her severe headache warrants care, but the CT excluded haemorrhage.)"),
    it("3. Evaluate the role of CT imaging in the diagnosis and management of stroke. When might these be indicated for Ms. Sumchum?", 10,
       [("Non-contrast CT: first, fast, available - excludes haemorrhage (essential before thrombolysis), shows early ischaemic changes/ ASPECTS, other causes (tumour); limitation - early ischaemia may not show, MRI more sensitive", 5),
        ("CT angiography (large vessel occlusion for thrombectomy), CT perfusion (penumbra, extended window); for her: immediate non-contrast CT on arrival (done), CTA/ CTP now for thrombectomy decision, repeat CT at 24 h after thrombolysis or if deterioration (haemorrhagic transformation)", 5)],
       "Non-contrast CT is the first imaging test in suspected stroke because it is fast and widely available. Its main role is to exclude intracranial haemorrhage, which is essential before giving thrombolytics or antiplatelets; it can also show early ischaemic changes (loss of grey-white differentiation, hyperdense MCA sign, ASPECTS score) and other causes of symptoms such as tumour or subdural haematoma. Its limitation is that early ischaemia may not be visible in the first hours, and MRI (diffusion-weighted) is more sensitive for small or posterior strokes. CT angiography shows the site of arterial occlusion (large-vessel occlusion suitable for thrombectomy) and carotid disease; CT perfusion distinguishes the core from the salvageable penumbra, guiding treatment in extended windows. For Ms. Sumchum: the immediate non-contrast CT on arrival (already done) excluded haemorrhage and supports thrombolysis; CT angiography (with or without perfusion) should be done promptly given her NIHSS of 12 and MCA signs to look for a large-vessel occlusion for thrombectomy; a repeat CT is indicated 24 hours after thrombolysis before starting antiplatelets, and urgently if she deteriorates (headache worsening, falling GCS, rising BP) to look for haemorrhagic transformation or oedema."),
    it("4. Describe the typical clinical features of a stroke that Ms. Sumchum presents with and how they correlate with the ischaemic area identified in the CT scan.", 10,
       [("Features: sudden onset, right hemiparesis (arm > leg typical of MCA), right facial droop (upper motor neuron), aphasia, headache; FAST signs; NIHSS 12 moderate", 5),
        ("Correlation: left hemisphere controls right side (crossing of corticospinal tracts); left MCA supplies lateral motor cortex (face, arm), Broca's and Wernicke's areas in dominant hemisphere → aphasia; also possible sensory loss, visual field defect", 5)],
       "Ms. Sumchum shows the typical sudden-onset features of a stroke (the FAST signs - Face, Arm, Speech, Time): right-sided hemiparesis with weakness of the arm and leg, right facial droop, aphasia (difficulty forming coherent sentences) and headache, with an NIHSS of 12 (moderate stroke) and GCS 14. Correlation with the left MCA territory: the motor pathways (corticospinal tracts) cross at the medulla, so a lesion in the left hemisphere causes weakness of the right side of the body and lower face (upper motor neuron facial palsy sparing the forehead). The MCA supplies the lateral surface of the frontal, parietal and temporal lobes, including the motor and sensory cortex for the face and arm (so arm and face are usually more affected than the leg), and, in the dominant (usually left) hemisphere, Broca's area (expressive aphasia) and Wernicke's area (receptive aphasia). Other expected left-MCA features include right-sided sensory loss, right homonymous hemianopia and gaze preference to the left."),
    it("5. Describe the pathophysiology of ischaemic stroke. How does it differ from haemorrhagic stroke in terms of underlying causes and treatment approaches?", 5,
       [("Ischaemic: blocked artery (thrombosis on atherosclerotic plaque, embolism - AF, carotid) → reduced flow → energy failure, excitotoxicity, cell death; core and penumbra", 2),
        ("Haemorrhagic: rupture of vessel (hypertension, aneurysm, AVM, anticoagulants) → bleeding, raised ICP; treatment differs: ischaemic - thrombolysis/ thrombectomy, antiplatelets; haemorrhagic - no thrombolytics, BP lowering, reverse anticoagulation, surgery", 3)],
       "Ischaemic stroke (about 85% of strokes) occurs when an artery to the brain is blocked by a thrombus forming on an atherosclerotic plaque or by an embolus (e.g. from the heart in atrial fibrillation or from carotid plaque). Reduced blood flow deprives neurons of oxygen and glucose; energy failure leads to ion pump failure, glutamate excitotoxicity, calcium influx, free radicals and cell death in the core, surrounded by a salvageable penumbra. Haemorrhagic stroke is caused by rupture of a blood vessel - commonly from chronic hypertension (small penetrating arteries), aneurysm (subarachnoid haemorrhage), arteriovenous malformation, or anticoagulant use - with blood compressing brain tissue and raising intracranial pressure. Treatment: ischaemic stroke - restore flow with thrombolysis or thrombectomy, then antiplatelets and statins; haemorrhagic stroke - thrombolytics and antiplatelets are contraindicated; treatment is lowering BP, reversing anticoagulation, managing raised ICP and surgery (clot evacuation, aneurysm clipping or coiling)."),
    it("6. Evaluate the importance of lifestyle modifications in stroke prevention. What specific changes should be recommended to patients to reduce their risk of stroke recurrence?", 5,
       [("Importance: most strokes linked to modifiable risk factors; lifestyle lowers BP, lipids, glucose, weight and complements drugs; recurrence risk high", 2),
        ("Changes: stop smoking, limit alcohol, reduce salt, healthy diet (DASH/ Mediterranean, fruits, vegetables), regular exercise (150 min/ week), weight control, diabetes control, medication adherence, stress management, regular check-ups, know warning signs", 3)],
       "Lifestyle changes are central because most strokes are linked to modifiable risk factors (hypertension, high cholesterol, smoking, diabetes, obesity, inactivity, alcohol), and recurrence risk after a first stroke is high. Lifestyle measures lower BP, lipids and blood sugar and work together with medicines. Recommendations: stop smoking and avoid second-hand smoke; limit alcohol (no binge drinking, avoid local ara); reduce salt intake (less salty foods, suja and processed foods); eat a healthy diet rich in vegetables, fruit, whole grains and low in saturated fat; do regular physical activity (at least 150 minutes of moderate exercise a week, as able); maintain a healthy weight; control diabetes; take prescribed medicines (antihypertensives, statin, antiplatelets) regularly; manage stress and sleep; attend regular check-ups; and know the FAST warning signs to seek help immediately."),
])
Q += case("nurse2024", 2, T, C2, items=[
    it("1. What intervention should you, as the nurse, perform immediately? Why?", 5,
       [("Immediate: oxygen to keep SpO2 ≥ 94% (SpO2 90%), position upright, IV access, continuous ECG monitoring, 12-lead ECG within 10 min", 3),
        ("Rationale: improve myocardial oxygen supply, relieve pain/ hypoxia, detect arrhythmias/ STEMI; give aspirin 300 mg chewed and nitroglycerin/ morphine as ordered (MONA)", 2)],
       "Immediately: give oxygen (his SpO2 is 90%, below the 94% target) and sit him upright (semi-Fowler's) to ease breathing; attach a cardiac monitor and obtain a 12-lead ECG within 10 minutes; establish IV access; and, as ordered, give aspirin 300 mg to chew, sublingual nitroglycerin (BP is adequate) and IV morphine if pain persists. Why: oxygen increases oxygen supply to the ischaemic myocardium and corrects hypoxaemia; aspirin prevents further clot growth; nitrates and morphine relieve pain and reduce myocardial oxygen demand; the ECG identifies STEMI for urgent reperfusion; and monitoring detects life-threatening arrhythmias (ventricular fibrillation is the main early cause of death)."),
    it("2. What is myocardial infarction? List down the causes of MI.", 8,
       [("Definition: death (necrosis) of heart muscle due to prolonged ischaemia from blocked coronary blood flow; STEMI/ NSTEMI", 3),
        ("Causes: atherosclerotic plaque rupture with thrombosis (main), coronary spasm (cocaine), embolism, dissection, severe anaemia/ hypotension (supply-demand mismatch), arteritis; risk factors - smoking, hypertension, diabetes, hyperlipidaemia, obesity, age, male, family history, stress", 5)],
       "Myocardial infarction is the death (necrosis) of part of the heart muscle due to prolonged ischaemia, when blood flow through a coronary artery is blocked or severely reduced; it is classified as ST-elevation MI (STEMI) or non-ST-elevation MI (NSTEMI). Causes: (1) rupture or erosion of an atherosclerotic plaque with thrombus formation in a coronary artery - the most common cause; (2) coronary artery spasm (e.g. cocaine); (3) coronary embolism; (4) spontaneous coronary artery dissection; (5) supply-demand mismatch (type 2 MI) from severe anaemia, hypotension, arrhythmia or hypoxia. Risk factors: smoking, hypertension, diabetes, high cholesterol, obesity (he weighs 104 kg), physical inactivity, older age, male sex, family history and stress."),
    it("3. What is a cardiac marker? Name the cardiac markers which you anticipate would be advised by the doctor for Mr. Tshewang.", 7,
       [("Cardiac marker: substance (protein/ enzyme) released into blood when heart muscle is damaged, used to diagnose and monitor MI", 2),
        ("Markers: cardiac troponin I and T (high-sensitivity, most specific, rise 3-4 h, stay 7-14 days), CK-MB (rise 4-6 h, normal 48-72 h - reinfarction), myoglobin (early, not specific), also LDH, BNP for heart failure; serial testing", 5)],
       "A cardiac marker is a substance - an enzyme or protein - released into the blood when heart muscle cells are damaged; measuring it helps diagnose myocardial infarction and assess its size and timing. Expected markers for Mr. Tshewang: cardiac troponin I or T (preferably high-sensitivity troponin) - the most sensitive and specific, rises within 3-4 hours, peaks at 24-48 hours and stays raised for 7-14 days, measured serially (on arrival and repeated after 1-3 hours); CK-MB - rises in 4-6 hours and returns to normal in 48-72 hours, useful for detecting reinfarction; myoglobin - rises earliest (1-3 hours) but is not specific to the heart. Other tests that may be advised: lactate dehydrogenase (older test), BNP/NT-proBNP if heart failure is suspected, plus electrolytes, lipid profile, blood sugar and coagulation profile."),
    it("4. What are the complications of MI?", 5,
       [("Arrhythmias (VF, VT, heart block), cardiogenic shock, heart failure/ pulmonary oedema, recurrent ischaemia/ reinfarction", 3),
        ("Mechanical: papillary muscle rupture (mitral regurgitation), ventricular septal rupture, free wall rupture/ tamponade, ventricular aneurysm, mural thrombus/ embolism (stroke), pericarditis/ Dressler's syndrome, sudden death", 2)],
       "Complications: arrhythmias (ventricular fibrillation and tachycardia - the main cause of early death - bradycardia and heart blocks, atrial fibrillation); left ventricular failure and pulmonary oedema; cardiogenic shock; recurrent ischaemia and reinfarction; mechanical complications - papillary muscle rupture with acute mitral regurgitation, ventricular septal rupture, free wall rupture with cardiac tamponade; left ventricular aneurysm; mural thrombus with embolism (stroke); pericarditis and Dressler's syndrome; and sudden cardiac death."),
    it("5. What patient education topics would need to be covered with Mr. Tshewang?", 10,
       [("Disease and medicines: what MI is, warning signs and when to seek help/ call ambulance, medicines (aspirin, clopidogrel, statin, beta-blocker, ACE inhibitor, GTN use) - purpose, side effects, adherence", 4),
        ("Lifestyle: smoking cessation, heart-healthy diet (low salt/ fat), weight reduction (104 kg), alcohol limit, gradual activity/ cardiac rehabilitation, sexual activity/ return to work, stress management, control of BP/ diabetes/ lipids, follow-up", 6)],
       "Education topics: (1) what a heart attack is and its cause, in simple terms; (2) warning signs of another attack (chest pain, breathlessness, sweating) and what to do - rest, take sublingual GTN as instructed, and seek emergency help if pain lasts more than 5 minutes; (3) medicines - aspirin and a second antiplatelet, statin, beta-blocker, ACE inhibitor and nitrates: purpose, dose, side effects (bleeding, dizziness) and not stopping them without advice; (4) smoking cessation; (5) heart-healthy diet - less salt, saturated fat and sugar, more vegetables, fruit and fibre; (6) weight reduction, since he weighs 104 kg; (7) limiting alcohol; (8) gradual increase in physical activity and joining cardiac rehabilitation, with guidance on lifting, returning to work, driving and sexual activity; (9) stress management and adequate sleep; (10) controlling BP, blood sugar and cholesterol and attending follow-up appointments and tests."),
    it("6. Prepare a nursing care plan for this patient in relation to pain. Include the rationale against each intervention.", 15,
       [("Assessment and diagnosis: acute chest pain related to myocardial ischaemia as evidenced by crushing pain 7/10, radiation, diaphoresis, tachypnoea; goal - pain reduced (e.g. <3/10) within 30-60 min, stable vitals", 4),
        ("Interventions with rationale: assess pain (PQRST) regularly - baseline/ evaluate; bed rest, semi-Fowler's, calm environment - reduce oxygen demand; oxygen to SpO2 ≥94% - supply; aspirin, nitroglycerin, IV morphine as ordered - antiplatelet, vasodilation, analgesia/ reduce preload; monitor BP before nitrates/ morphine - hypotension; ECG monitoring - ischaemia/ arrhythmia; beta-blocker - reduce demand; reassurance/ anxiety reduction; prepare for reperfusion (PCI/ thrombolysis)", 9),
        ("Evaluation: pain score, vital signs, ECG changes, patient comfort; document and revise plan", 2)],
       "Assessment: crushing central chest pain radiating to the left arm and back, 7/10, with diaphoresis, pallor, tachypnoea (RR 32) and SpO2 90%. Nursing diagnosis: Acute pain related to myocardial ischaemia (imbalance between oxygen supply and demand) as evidenced by reported chest pain 7/10, diaphoresis and restlessness. Goal: the patient will report pain reduced to below 3/10 within 30-60 minutes, with stable vital signs and no further ischaemic changes. Interventions and rationale: (1) Assess pain using PQRST and a 0-10 scale every 5-15 minutes and after each intervention - gives a baseline and evaluates effectiveness. (2) Keep the patient on bed rest in a semi-Fowler's position in a quiet, calm environment - reduces cardiac workload and oxygen demand and eases breathing. (3) Give oxygen to keep SpO2 at least 94% - increases oxygen supply to the ischaemic myocardium. (4) Give aspirin 300 mg to chew as ordered - inhibits platelet aggregation and limits clot growth. (5) Give sublingual nitroglycerin every 5 minutes up to three doses, checking BP (systolic above 90 mmHg) - dilates coronary arteries and veins, improving blood flow and reducing preload. (6) Give IV morphine in small doses as ordered if pain continues, watching respiration and BP - relieves pain and anxiety and reduces preload and oxygen demand. (7) Give beta-blockers as ordered if no contraindication - reduce heart rate and oxygen demand. (8) Monitor vital signs and continuous ECG; record a 12-lead ECG during pain - detects ischaemia, extension of infarction and arrhythmias. (9) Explain procedures and reassure the patient and family - anxiety increases catecholamines and oxygen demand. (10) Prepare for reperfusion (PCI or thrombolysis) as ordered - restoring blood flow is the definitive relief of ischaemic pain. (11) Provide stool softeners and help with activities - avoids straining (Valsalva) and exertion. Evaluation: pain score below 3/10, patient relaxed, vital signs and SpO2 within normal limits, no new ECG changes; document and revise the plan if pain persists."),
])
PATTERN = STANDARD
