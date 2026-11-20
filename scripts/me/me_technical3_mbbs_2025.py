"""ME Technical Paper III (Subject Specialisation Paper), MBBS / Medicine, BCSE 2025 - real paper (PDF sent by the founder).
Standard pattern. MCQ 6 (statin threshold: guideline value of 20% splits across two options) is replaced. Short-answer
sub-parts i/ii/iii are written a/b/c so each gets its own answer box. Each lettered case question is its own part.
Drug doses follow standard WHO/national obstetric and cardiology protocols - a clinician should confirm them.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1"
GROUP_TAG = "mbbs2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "mbbs-medicine"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "MBBS / Medicine"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following vaccine must be given within 24 hours of birth?",
"opts": [
"Oral Polio vaccine",
"Hepatitis B",
"BCG",
"Pentavalent"
]
},
{
"n": 2,
"stem": "Which one of the following is a Serious Adverse Event Following Immunization (AEF)?",
"opts": [
"Fever after vaccination",
"Pain at the site of vaccination",
"Seizure after vaccination",
"Redness of the skin at the site of vaccination."
]
},
{
"n": 3,
"stem": "Which of the following is used in the prevention of complications of measles?",
"opts": [
"Antibiotics",
"Antipyretics",
"Vitamin A",
"Analgesics"
]
},
{
"n": 4,
"stem": "Which test is designed to assess the body’s ability to metabolize blood glucose?",
"opts": [
"Postprandial glucose",
"Fasting Plasma Glucose",
"Oral Glucose tolerance test",
"Random blood glucose."
]
},
{
"n": 5,
"stem": "Side effect of metformin is",
"opts": [
"Weight gain",
"Hypoglycemia",
"Gastrointestinal disturbances",
"Weight loss"
]
},
{
"n": 6,
"stem": "According to WHO guidelines, at what level of 10-year cardiovascular disease (CVD) risk should statin therapy be initiated?",
"opts": [
"5% to <10%",
"10% to <20%",
"20% to 30%",
"More than or equal to 30%"
]
},
{
"n": 7,
"stem": "What is the recommended target blood pressure for patients receiving antihypertensive treatment, according to current guidelines?",
"opts": [
"120-130mmHg systolic and 70-80mmHg diastolic.",
"Less than 140mmHg systolic and 90mmg diastolic",
"120-130mmHg systolic and 80-90mmHg diastolic.",
"130-140mmHg systolic and 70-80mmHg diastolic."
]
},
{
"n": 8,
"stem": "The most common position of appendix is",
"opts": [
"Ileocecal",
"Retrocecal",
"Subcecal",
"Pre-ileal"
]
},
{
"n": 9,
"stem": "Most feared side effect of Anti snake venom is",
"opts": [
"Renal Failure",
"Paralysis",
"Congestive cardiac failure.",
"Anaphylaxis."
]
},
{
"n": 10,
"stem": "A 30-year-old woman has had headaches for 6 months, worsened over the past 5 days but improved after stopping analgesics. What is the likely diagnosis?",
"opts": [
"Medication overuse headache",
"Tension headache",
"Chronic migraine",
"Cluster headache"
]
},
{
"n": 11,
"stem": "Crohn’s disease",
"opts": [
"It is the disease of small intestine only",
"Can affect any part of the gastrointestinal tract",
"Mostly involve the colon",
"Spreads to the lymph nodes"
]
},
{
"n": 12,
"stem": "The most common organism causing urinary tract infection is",
"opts": [
"Escherichia Coli",
"Streptococcus aureus",
"Klebsiella",
"Proteus"
]
},
{
"n": 13,
"stem": "Which is true for ventricular tachycardia?",
"opts": [
"Responds to carotid sinus massage",
"Narrow QRS complex in ECG",
"Intravenous adenosine is the treatment of choice",
"There is atrioventricular dissociation."
]
},
{
"n": 14,
"stem": "A 36-week pregnant woman has breathlessness, excessive abdominal distension, a tense but non- tender abdomen, symphysis-fundal height of 41 cm, muffled fetal heart sounds, and difficulty palpating foetal parts.",
"opts": [
"Abruptio placenta",
"Hydrocephalus of foetus",
"Polyhydramnios",
"Fetal-maternal ascites"
]
},
{
"n": 15,
"stem": "A young man presents with a painless ulcer on the genital region, with non-tender swelling of the inguinal lymph nodes. What is the most likely diagnosis?",
"opts": [
"Chancroid",
"Syphilis",
"Herpes Genitalis",
"Granuloma inguinale"
]
},
{
"n": 16,
"stem": "A 30-year male presents to the emergency after a road traffic accident with thigh pain, swelling, and deformity. What is the most immediate life-threatening complication of femoral shaft fracture?",
"opts": [
"Pulmonary embolism",
"Fat embolism syndrome",
"Hemorrhagic shock",
"Deep vein thrombosis"
]
},
{
"n": 17,
"stem": "Which of the following red cell indices indicates the size of red blood cells?",
"opts": [
"Hemoglobin concentration",
"RDW",
"MCV",
"MCHC"
]
},
{
"n": 18,
"stem": "All vaccines should be stored within a specific temperature range of",
"opts": [
"+4°C to +10°C",
"+2°C to +8°C",
"0°C to 8°C",
"-2°C to -8°C"
]
},
{
"n": 19,
"stem": "How many antenatal visits are recommended by the WHO for a low-risk pregnancy?",
"opts": [
"2 visits",
"4 visits",
"6 visits",
"8 visits"
]
},
{
"n": 20,
"stem": "A patient presents to the outpatient department (OPD) with hand tremors, tachycardia, and significant weight loss. Which of the following thyroid function test profiles is most indicative of hyperthyroidism?",
"opts": [
"raised TSH, low T3 and T4",
"Low TSH, raised T3 and T4",
"Low TSH, T3 and T4",
"Normal TSH, normal T3, raised T4"
]
},
{
"n": 21,
"stem": "A patient stopped alcohol consumption for 3 days and presented with irritability, disorientation, paranoid delusions, agitation, visual hallucinations, and altered sensorium. What is the likely diagnosis in this case?",
"opts": [
"Delirium tremens",
"Wernicke’s encephalopathy",
"Korsakoff psychosis",
"Alcohol-induced psychosis"
]
},
{
"n": 22,
"stem": "Which of the following systemic disease is most commonly associated with early cataract formation?",
"opts": [
"Diabetes mellitus",
"Hypertension",
"Hyperthyroidism",
"Asthma"
]
},
{
"n": 23,
"stem": "On otoscopic examination, a classic finding in acute otitis media is",
"opts": [
"Retracted tympanic membrane",
"Bulging and erythematous tympanic membrane",
"Normal translucent tympanic membrane",
"Perforated tympanic membrane with granulation tissue"
]
},
{
"n": 24,
"stem": "Which of the following is the most common congenital heart defect?",
"opts": [
"Tetralogy of Fallot",
"Patent Ductus Arteriosus (PDA)",
"Ventricular Septal Defect (VSD)",
"Atrial Septal Defect (ASD)"
]
},
{
"n": 25,
"stem": "Beriberi is caused by deficiency of",
"opts": [
"Niacin",
"Vitamin A",
"Vitamin B1",
"Vitamin E alpha"
]
},
{
"n": 26,
"stem": "A newborn baby looked normal at birth but within few hours her lips are blue. A harsh murmur is heard on auscultation. What is the most likely cause of the cyanosis?",
"opts": [
"Atrial septal defect",
"Coaractation of aorta",
"Ebstein’s anomaly",
"Ventricular septal defect"
]
},
{
"n": 27,
"stem": "In females, Neisseria gonorrhoeae infection typically presents with which type of vaginal discharge?",
"opts": [
"Thick white and curd like",
"Mucupurulent discharge",
"Thin, scanty, white and frothy",
"Copious, yellow-green and frothy."
]
},
{
"n": 28,
"stem": "Screening of gestational diabetes mellitus should be performed between or at",
"opts": [
"First antenatal visit",
"First trimester",
"24th week and 28th week of gestation",
"12th week and 18th week of gestation"
]
},
{
"n": 29,
"stem": "Neonates die during resuscitation because of the failure to",
"opts": [
"oxygenate",
"intubate",
"preform CPR",
"diagnose the condition"
]
},
{
"n": 30,
"stem": "In a vaccine vial monitor (VVM) the active ingredient is in the",
"opts": [
"Outer grey circle",
"Inner white square",
"Outer white square",
"Inner grey circle"
]
}
]"""

KEY = {
    1: ("b", "The hepatitis B birth dose should be given within 24 hours of birth."), 2: ("c", "Seizures after vaccination are a serious AEFI; local reactions and fever are minor."),
    3: ("c", "Vitamin A reduces complications and deaths from measles."), 4: ("c", "The oral glucose tolerance test assesses glucose metabolism."),
    5: ("c", "Gastrointestinal upset is the commonest side effect of metformin."), 7: ("b", "WHO recommends a target below 140/90 mmHg for most treated patients."),
    8: ("b", "The retrocaecal position is the most common."), 9: ("d", "Anaphylaxis is the most feared reaction to anti-snake venom."),
    10: ("a", "Headache improving after stopping analgesics suggests medication-overuse headache."), 11: ("b", "Crohn's disease can affect any part of the GI tract from mouth to anus."),
    12: ("a", "E. coli is the commonest cause of UTI."), 13: ("d", "AV dissociation is characteristic of VT (wide QRS; does not respond to vagal manoeuvres)."),
    14: ("c", "Large-for-dates, tense uterus, muffled heart sounds and hard-to-feel parts suggest polyhydramnios."), 15: ("b", "A painless ulcer with non-tender nodes suggests primary syphilis."),
    16: ("c", "Haemorrhagic shock (blood loss up to 1-1.5 L) is the most immediate threat."), 17: ("c", "MCV indicates red cell size."),
    18: ("b", "Vaccines are stored at +2 °C to +8 °C."), 19: ("d", "WHO (2016) recommends at least eight antenatal contacts."),
    20: ("b", "Hyperthyroidism: low TSH with raised T3 and T4."), 21: ("a", "Delirium tremens occurs 2-4 days after stopping alcohol."),
    22: ("a", "Diabetes causes early cataract."), 23: ("b", "Acute otitis media shows a bulging, red tympanic membrane."),
    24: ("c", "VSD is the commonest congenital heart defect."), 25: ("c", "Beriberi is thiamine (vitamin B1) deficiency."),
    26: ("c", "Of the options, only Ebstein's anomaly causes early cyanosis with a murmur."), 27: ("b", "Gonorrhoea causes mucopurulent cervical discharge."),
    28: ("c", "GDM screening is done at 24-28 weeks (earlier if high risk)."), 29: ("a", "Failure to oxygenate/ventilate is the main reason neonates die during resuscitation."),
    30: ("b", "The heat-sensitive active material is in the inner square of the VVM."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "Which drug is used first-line to prevent and treat eclamptic seizures?", ["Diazepam", "Phenytoin", "Magnesium sulphate", "Phenobarbitone"], "c",
            "Magnesium sulphate is the drug of choice for preventing and treating eclampsia."),
    saq(1, T, """A 45-year-old man presents to the OPD with fever, productive cough and right-sided pleuritic chest pain for 3 days. On examination he is febrile, has a respiratory rate of 28/min, and crepitations are heard in the lower zone of the right lung.
a) What is the most likely diagnosis? (1 mark)
b) Mention two common causative organisms. (2 marks)
c) How will you treat the patient? (2 marks)""",
        [("a) Community-acquired pneumonia (right lower lobe)", 1), ("b) Streptococcus pneumoniae, Haemophilus influenzae (also Mycoplasma, Staph aureus, Klebsiella)", 2), ("c) Assess severity (CURB-65); antibiotics (amoxicillin/ co-amoxiclav ± macrolide; ceftriaxone if severe), supportive: oxygen, fluids, antipyretics, chest X-ray", 2)],
        """a) Community-acquired pneumonia of the right lower lobe.
b) Streptococcus pneumoniae (commonest) and Haemophilus influenzae; also Mycoplasma pneumoniae, Staphylococcus aureus, Klebsiella.
c) Confirm with chest X-ray and blood tests; assess severity (CURB-65 - RR ≥30 or other features may need admission). Give antibiotics: oral amoxicillin (plus a macrolide such as azithromycin for atypical cover) for mild disease; IV ceftriaxone or co-amoxiclav plus a macrolide if moderate/severe. Supportive care: oxygen if SpO2 low, fluids, paracetamol for fever and pain, rest, and review response in 48-72 hours."""),
    saq(2, T, """A 25-year-old man is hit by a car and brought to the emergency department within 10 minutes. Vital signs on arrival: BP 90/60 mmHg, pulse 140/min, respiratory rate 30/min, temperature 37 °C.
a) Is this patient critically ill? If so, why? (2 marks)
b) On further examination, the pulse oximeter reading is 85% and the patient responds only to pain. The skin is cool and pale, the pulse weak and thready, and capillary refill time is 5 seconds. What is the immediate management of the airway to prevent complications? (2 marks)
c) What life-threatening condition may the patient be suffering from? (1 mark)""",
        [("a) Yes - hypotension, tachycardia 140, tachypnoea 30 after major trauma: signs of shock/ triage red", 2), ("b) Airway with cervical spine protection: jaw thrust, suction, airway adjunct, high-flow oxygen; definitive airway (intubation) as GCS low (responds to pain)", 2), ("c) Haemorrhagic (hypovolaemic) shock", 1)],
        """a) Yes. After high-energy trauma he is hypotensive (90/60), very tachycardic (140/min) and tachypnoeic (30/min) - signs of shock and possible respiratory compromise, so he is a priority (red) emergency.
b) Airway with cervical spine protection: manual in-line stabilisation/collar; jaw thrust (no head tilt); suction blood/secretions; oropharyngeal airway; high-flow oxygen (15 L/min via non-rebreather mask); because he responds only to pain (GCS ≤8 likely) and SpO2 is 85%, secure a definitive airway by endotracheal intubation (rapid sequence induction) to prevent aspiration and hypoxia.
c) Haemorrhagic (hypovolaemic) shock, class III-IV, from internal or external bleeding (possibly with head injury)."""),
    saq(3, T, """A 40-year-old man comes to the OPD with headache and blurred vision for one month. His BP is 160/100 mmHg. He is not a known case of any chronic disease and is not on any medication.
a) What is your next step? (1 mark)
b) What type of hypertension is the patient suffering from? (1 mark)
c) Mention the basic investigations required for the patient. (2 marks)
d) Name one angiotensin receptor blocker used to treat hypertension. (1 mark)""",
        [("a) Confirm BP with repeat measurements (correct technique, both arms) and fundoscopy/ assess target organ damage", 1), ("b) Stage 2 (grade 2) hypertension; likely primary (essential) - symptomatic", 1), ("c) Urine routine (protein), serum creatinine/ electrolytes, blood glucose, lipid profile, ECG, fundoscopy (± echo, TSH)", 2), ("d) Losartan / telmisartan / olmesartan", 1)],
        """a) Confirm the BP by repeated measurements (after rest, correct cuff, both arms) and examine the fundi and other target organs; since he has symptoms (blurred vision), look for hypertensive retinopathy/urgency.
b) Stage 2 (grade 2) hypertension (≥160/100), most likely primary (essential) hypertension; secondary causes should be excluded in a young patient.
c) Urine routine (protein, blood), serum creatinine and electrolytes (urea, Na, K), fasting blood glucose/HbA1c, lipid profile, ECG (LVH), fundoscopy; if indicated, echocardiography, TSH and renal ultrasound.
d) Losartan (or telmisartan, valsartan, olmesartan)."""),
    saq(4, T, """A 35-year-old woman working in a hotel feels tired easily, is intolerant to cold and has menstrual irregularities. A few days ago her friends noticed hoarseness of her voice. On examination her heart rate is 60/min, BP 120/80 mmHg, and she has dry skin and cold hands.
a) What is the most likely diagnosis? (1 mark)
b) How would you confirm the diagnosis? (1 mark)
c) How would the test report confirm the diagnosis? (2 marks)
d) Name the drug used to treat the condition. (1 mark)""",
        [("a) Hypothyroidism", 1), ("b) Thyroid function test (TSH, free T4)", 1), ("c) Raised TSH with low free T4 (primary); ± anti-TPO antibodies for Hashimoto's", 2), ("d) Levothyroxine", 1)],
        """a) Hypothyroidism (most likely primary, e.g. Hashimoto's thyroiditis).
b) Thyroid function tests - serum TSH and free T4 (± T3).
c) Primary hypothyroidism: raised TSH with low free T4 (subclinical if TSH high but T4 normal); positive anti-TPO antibodies suggest autoimmune (Hashimoto's) thyroiditis.
d) Levothyroxine (L-thyroxine), taken once daily on an empty stomach, dose adjusted by TSH."""),
]
C1 = """Case I: Hypertension in pregnancy and postpartum haemorrhage
A 29-year-old woman, gravida 3, had a blood pressure of 160/110 mmHg at her first antenatal visit at 24 weeks of gestation. She is not a known hypertensive. On examination the fundal height was 22 weeks. The foetal heart was present. There was no pallor or pedal oedema."""
C2 = """Case II: Chest pain in a smoker
A 41-year-old male smoker presented to the emergency department with chest pain of 5 hours' duration. He also had breathlessness and a dry cough. On examination his pulse rate was 110/min, BP 139/89 mmHg and SpO2 80%. He was sweating. The chest was clear. On further history taking, the patient says the chest pain radiates to the left hand."""
PPH = "\n\nTwo hours later the patient delivered a 2 kg baby boy. The placenta was delivered normally but there was per vaginal bleeding of about 1000 mL. The blood pressure was 90/60 mmHg, pulse rate 100/min, and the uterus was soft."
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("mbbs2025", 1, T, C1, items=[
    it("a) What condition is the patient suffering from?", 1, [("Pre-eclampsia (severe range BP) - new hypertension after 20 weeks (gestational hypertension/ pre-eclampsia)", 1)],
       "Pre-eclampsia with severe-range blood pressure (new-onset hypertension after 20 weeks in a previously normotensive woman; if no proteinuria or features, gestational hypertension - severe). Fundal height smaller than dates also suggests foetal growth restriction."),
    it("b) How is the condition diagnosed?", 2, [("BP ≥140/90 on two occasions ≥4 h apart after 20 weeks", 1), ("Plus proteinuria (≥300 mg/24 h, PCR ≥0.3, dipstick ≥2+) or maternal organ dysfunction/ uteroplacental dysfunction", 1)],
       "Blood pressure ≥140/90 mmHg on two occasions at least 4 hours apart (≥160/110 confirmed within minutes) after 20 weeks of gestation, plus proteinuria (≥300 mg/24 h, protein/creatinine ratio ≥0.3, or dipstick ≥2+), or, without proteinuria, maternal organ dysfunction (raised creatinine, raised liver enzymes, low platelets, neurological symptoms, pulmonary oedema) or uteroplacental dysfunction (foetal growth restriction)."),
    it("c) List the severe (fulminant) features of the condition.", 3, [("Any six: BP ≥160/110, severe headache/visual disturbance, epigastric/RUQ pain, platelets <100,000, raised liver enzymes (HELLP), creatinine >1.1/ oliguria, pulmonary oedema, eclampsia, FGR/ abruption", 3)],
       "Systolic BP ≥160 or diastolic ≥110 mmHg; severe persistent headache or visual disturbances; epigastric or right upper quadrant pain; thrombocytopenia (<100,000/µL); raised liver enzymes (twice normal) - HELLP syndrome; renal impairment (creatinine >1.1 mg/dL or doubling) or oliguria; pulmonary oedema; seizures (eclampsia); foetal growth restriction or placental abruption."),
    it("d) When the condition is accompanied by seizures, what is it called?", 1, [("Eclampsia", 1)], "Eclampsia."),
    it("e) What is the target blood pressure with treatment?", 1, [("About 140-150/90-100 mmHg (avoid sudden drop; e.g. <150/100, diastolic 85-100)", 1)],
       "Aim for about 140-150 / 90-100 mmHg (e.g. below 150/100, diastolic 85-100), lowering gradually to protect placental perfusion; urgent treatment if ≥160/110."),
    it("f) How will you manage the seizures (the second condition)?", 10,
       [("Call for help, left lateral position, protect from injury, airway, suction, oxygen, IV access, do not leave alone", 3), ("Magnesium sulphate loading and maintenance (Pritchard or Zuspan), monitoring", 3), ("Control BP (labetalol/ hydralazine/ nifedipine)", 2), ("Delivery after stabilisation, fluid balance, monitoring/ investigations, foetal monitoring, postpartum care", 2)],
       "Call for help; place the woman in the left lateral position; protect her from injury (do not restrain); maintain airway, suction secretions, give oxygen; insert IV line and send bloods (CBC, platelets, LFT, RFT, coagulation, urine protein); catheterise and monitor fluid intake/output (restrict fluids to about 80 mL/h). Give magnesium sulphate - loading dose 4 g IV over 5-15 minutes plus 10 g IM (5 g in each buttock) (Pritchard), then 5 g IM 4-hourly in alternate buttocks (or 1 g/h IV infusion - Zuspan) for 24 hours after delivery or the last seizure, monitoring for toxicity. Control severe BP with labetalol IV, hydralazine IV or oral nifedipine to 140-150/90-100. Monitor BP, pulse, RR, reflexes, SpO2 and urine output, and the foetus. Stabilise, then plan delivery (eclampsia is an indication for delivery regardless of gestation - vaginal or caesarean as indicated); give steroids if preterm and time permits. Continue monitoring postpartum, as seizures can occur after delivery."),
    it("g) How will you prepare the loading dose of the drug?", 5, [("IV: 4 g = 8 mL of 50% MgSO4 diluted with 12 mL sterile water/saline to 20 mL (20% solution), given slowly over 5-15 min", 3), ("IM: 10 g = 20 mL of 50% solution, 5 g (10 mL) deep IM in each buttock with 1 mL 2% lignocaine, aseptic technique", 2)],
       "Intravenous part: take 4 g magnesium sulphate = 8 mL of the 50% solution and dilute with 12 mL of sterile water or normal saline to make 20 mL of a 20% solution; give slowly IV over 5-15 minutes. Intramuscular part (Pritchard regimen): 10 g = 20 mL of 50% solution; give 5 g (10 mL) by deep IM injection into the upper outer quadrant of each buttock, each mixed with 1 mL of 2% lignocaine, using aseptic technique."),
    it("h) Mention three things you will check for toxicity of the drug.", 3, [("Patellar (knee) reflex present", 1), ("Respiratory rate ≥16/min (≥12)", 1), ("Urine output ≥30 mL/h (≥100 mL in 4 h)", 1)],
       "Before each dose and regularly: 1. Patellar (knee-jerk) reflex must be present. 2. Respiratory rate must be at least 16 breaths/min (stop if below 12). 3. Urine output must be at least 30 mL/hour (100 mL in 4 hours). (Serum magnesium if available: therapeutic 4-7 mEq/L.)"),
    it("i) Name the antidote for the drug.", 1, [("Calcium gluconate", 1)], "Calcium gluconate (10%)."),
    it("j) How will you give the antidote?", 2, [("10 mL of 10% calcium gluconate (1 g) IV slowly over 10 minutes; support breathing/ventilation, stop magnesium", 2)],
       "Give 1 g calcium gluconate = 10 mL of 10% solution IV slowly over about 10 minutes, stop the magnesium sulphate, and support breathing (oxygen, bag-mask ventilation or intubation if respiratory arrest)."),
    it("k) The seizures continue after the loading dose. How much of the drug will you give and by what route?", 2, [("Further 2 g MgSO4 (4 mL of 50% diluted to 20%) IV over 5 minutes (2-4 g)", 2)],
       "Give an additional 2 g of magnesium sulphate IV (4 mL of 50% solution diluted to a 20% solution) slowly over 5 minutes (2 g if under 70 kg, up to 4 g if heavier)."),
    it("l) What is this condition called?" + PPH, 1, [("Primary postpartum haemorrhage (due to uterine atony)", 1)], "Primary postpartum haemorrhage (PPH) - blood loss ≥500 mL within 24 hours of vaginal delivery (here 1000 mL with shock: severe PPH), most likely due to uterine atony."),
    it("m) Mention three causes of the condition." + PPH, 3, [("4 Ts: Tone (atony), Trauma (tears, rupture, inversion), Tissue (retained placenta/ products), Thrombin (coagulopathy, e.g. HELLP/ DIC) - any three", 3)],
       "The '4 Ts': Tone - uterine atony (most common; e.g. after magnesium sulphate, prolonged labour, grand multiparity, overdistension); Trauma - tears of the cervix, vagina or perineum, uterine rupture or inversion; Tissue - retained placenta or membranes; Thrombin - coagulation disorders such as DIC or HELLP in pre-eclampsia."),
    it("n) Differentiate between placenta praevia and abruptio placentae.", 5, [("Definition: praevia - placenta implanted in lower segment; abruption - premature separation of normally sited placenta", 1), ("Bleeding: praevia painless, causeless, recurrent, bright red, revealed; abruption painful, may be concealed, dark", 1), ("Uterus: praevia soft, non-tender, malpresentation/high head; abruption tense, tender, woody hard", 1), ("Shock proportional to visible loss in praevia; out of proportion in abruption; foetal heart usually normal vs distressed/ absent", 1), ("Associations and diagnosis: praevia - USG, no PV exam; abruption - hypertension/ pre-eclampsia, trauma, DIC risk", 1)],
       "Placenta praevia: placenta implanted wholly or partly in the lower uterine segment; painless, causeless, recurrent, bright red bleeding (revealed); uterus soft and non-tender; foetal parts easily felt, malpresentation or high head common; maternal condition in proportion to visible blood loss; foetal heart usually normal; diagnosed by ultrasound; vaginal examination is contraindicated. Abruptio placentae: premature separation of a normally situated placenta; painful bleeding, dark blood, may be concealed; uterus tense, tender, 'woody hard', foetal parts difficult to feel; shock out of proportion to visible bleeding; foetal distress or death common; associated with hypertension/pre-eclampsia, trauma, smoking; risk of DIC and renal failure."),
    it("o) How will you manage the patient?" + PPH, 10,
       [("Call for help, ABC, oxygen, two large-bore IV cannulae, bloods (cross-match, CBC, coagulation), crystalloids, blood transfusion, catheterise, monitor", 3), ("Uterine massage and uterotonics: oxytocin 10 IU IM/IV then infusion 20-40 IU; misoprostol 800 µg; carboprost; avoid ergometrine (pre-eclampsia)", 3), ("Tranexamic acid 1 g IV within 3 h; examine placenta, explore for tears/ retained tissue; bimanual/aortic compression, balloon tamponade", 2), ("If fails: surgical - uterine compression sutures (B-Lynch), artery ligation, hysterectomy; post-PPH monitoring; continue MgSO4 cautiously", 2)],
       "Call for help (senior obstetrician, anaesthetist); assess and resuscitate - airway, breathing (oxygen), circulation: two large-bore IV cannulae, send blood for grouping and cross-match, CBC, coagulation; rapid crystalloids and transfuse blood early; keep warm; catheterise and monitor urine output, BP and pulse. Stop bleeding: rub up the uterus (fundal massage) and give uterotonics - oxytocin 10 IU IM/IV then infusion (20-40 IU in 1 L at about 40-60 drops/min); misoprostol 800 µg sublingual/rectal; carboprost (15-methyl PGF2α) 250 µg IM if needed (caution in asthma). Avoid ergometrine because she has pre-eclampsia (hypertension). Give tranexamic acid 1 g IV over 10 minutes within 3 hours of birth (repeat once if bleeding continues). Check the placenta for completeness and examine the genital tract for tears; repair tears and remove retained tissue. If bleeding continues: bimanual uterine compression, external aortic compression, uterine balloon tamponade, then surgery (B-Lynch sutures, uterine/internal iliac artery ligation, hysterectomy as a last resort). Correct coagulopathy (FFP, platelets). After control, monitor closely in HDU, continue magnesium sulphate with dose monitoring, and treat anaemia."),
])
Q += case("mbbs2025", 2, T, C2, items=[
    it("a) Mention the causes of chest pain.", 10, [("Cardiac: ACS/MI, stable angina, pericarditis, myocarditis, aortic dissection, aortic stenosis", 3), ("Pulmonary: PE, pneumonia, pneumothorax, pleurisy", 3), ("GI: GERD, oesophageal spasm/rupture, peptic ulcer, gallbladder, pancreatitis", 2), ("Musculoskeletal/ others: costochondritis, rib fracture, herpes zoster, anxiety", 2)],
       "Cardiovascular: acute coronary syndrome (STEMI, NSTEMI, unstable angina), stable angina, aortic dissection, pericarditis, myocarditis, aortic stenosis, hypertrophic cardiomyopathy. Respiratory: pulmonary embolism, pneumothorax, pneumonia and pleurisy, pulmonary hypertension. Gastrointestinal: gastro-oesophageal reflux, oesophageal spasm or rupture, peptic ulcer, biliary colic/cholecystitis, pancreatitis. Musculoskeletal: costochondritis, muscle strain, rib fracture. Others: herpes zoster, anxiety/panic attack."),
    it("b) What could be the cause of this patient's chest pain? Justify.", 5, [("Acute coronary syndrome, most likely acute myocardial infarction (STEMI)", 2), ("Justification: smoker, 5 h pain radiating to left arm, sweating, tachycardia, breathlessness, hypoxia; clear chest", 3)],
       "Acute coronary syndrome, most likely acute myocardial infarction. Justification: male smoker (risk factor); chest pain for 5 hours (longer than angina) radiating to the left arm; sweating (sympathetic activation); breathlessness and tachycardia; low SpO2 (possible left ventricular dysfunction); clear chest makes pneumonia or pneumothorax less likely. Pulmonary embolism and aortic dissection should still be considered."),
    it("c) What urgent investigations would you request to confirm the diagnosis?", 7, [("12-lead ECG within 10 minutes, serial ECGs", 3), ("Cardiac biomarkers: high-sensitivity troponin I/T (serial), CK-MB", 3), ("Supporting: echocardiography, chest X-ray, ABG, electrolytes", 1)],
       "A 12-lead ECG within 10 minutes of arrival (repeated serially, with right-sided/posterior leads if needed); cardiac biomarkers - high-sensitivity troponin I or T (at presentation and repeated at 1-3 or 3-6 hours), CK-MB; bedside echocardiography for wall-motion abnormality; plus chest X-ray, arterial blood gas, CBC, electrolytes, renal function, glucose and lipids."),
    it("d) What findings in the reports would confirm the cause of the pain?", 7, [("ECG: ST elevation ≥1 mm in two contiguous limb leads (≥2 mm chest leads), new LBBB; reciprocal depression; later Q waves, T inversion; or ST depression/ T inversion in NSTEMI", 4), ("Troponin rise above 99th percentile with rise/fall", 2), ("Echo regional wall motion abnormality", 1)],
       "ECG: ST-segment elevation of ≥1 mm in two contiguous limb leads or ≥2 mm in contiguous chest leads (or new left bundle branch block) with reciprocal ST depression - STEMI; hyperacute T waves early; later pathological Q waves and T inversion. (ST depression or T-wave inversion with raised troponin indicates NSTEMI.) The leads involved localise the infarct (e.g. V1-V4 anterior, II, III, aVF inferior). Troponin: raised above the 99th percentile upper reference limit with a rising and/or falling pattern confirms myocardial necrosis. Echo: new regional wall-motion abnormality."),
    it("e) How will you manage the patient?", 10, [("Immediate: monitor, oxygen (SpO2 80%), IV access, aspirin 300 mg chewed, P2Y12 inhibitor (clopidogrel 300-600 mg/ ticagrelor), nitrates if BP allows, morphine for pain", 4), ("Reperfusion: primary PCI within 120 min if available, else thrombolysis (streptokinase/ tenecteplase/ alteplase) within 12 h, check contraindications", 3), ("Anticoagulation (heparin/ enoxaparin), high-dose statin, beta-blocker, ACE inhibitor when stable; CCU care, smoking cessation, rehab", 3)],
       "Admit to the resuscitation area/CCU with continuous ECG monitoring and defibrillator ready; give oxygen to keep SpO2 above 90-94%; IV access; aspirin 300 mg chewed; a P2Y12 inhibitor (clopidogrel 300-600 mg or ticagrelor 180 mg); sublingual/IV nitrates for pain if BP adequate; IV morphine for persistent pain with an antiemetic. Reperfusion for STEMI within 12 hours of onset: primary PCI if available within 120 minutes, otherwise thrombolysis (e.g. streptokinase 1.5 million units over 60 minutes or tenecteplase) after checking contraindications, followed by transfer for angiography. Anticoagulation with unfractionated heparin or enoxaparin. Then high-intensity statin (atorvastatin 80 mg), beta-blocker and ACE inhibitor once stable; treat complications; strict smoking cessation, risk-factor control, cardiac rehabilitation and long-term dual antiplatelet therapy."),
    it("f) What are the complications if the condition is not treated or treatment is delayed?", 8, [("Arrhythmias (VF/VT - sudden death, heart block, AF)", 2), ("Heart failure, cardiogenic shock", 2), ("Mechanical: papillary muscle rupture/ mitral regurgitation, VSD, free wall rupture/ tamponade, LV aneurysm", 2), ("Pericarditis/ Dressler's, mural thrombus and embolism/ stroke, reinfarction, death", 2)],
       "Arrhythmias - ventricular fibrillation/tachycardia (sudden death), heart block, atrial fibrillation; acute left ventricular failure, pulmonary oedema and cardiogenic shock; mechanical complications - papillary muscle rupture with acute mitral regurgitation, ventricular septal rupture, free wall rupture with cardiac tamponade; left ventricular aneurysm; mural thrombus with systemic embolism and stroke; pericarditis and later Dressler's syndrome; recurrent ischaemia/reinfarction; chronic heart failure and death."),
    it("g) What additional investigations would you request once the patient is stabilised?", 3, [("Echocardiography (LV function), coronary angiography, lipid profile, HbA1c/ glucose, renal function, stress testing as indicated", 3)],
       "Echocardiography to assess left ventricular function and complications; coronary angiography (for PCI or CABG planning); fasting lipid profile, HbA1c/blood glucose, renal and liver function, thyroid function if indicated; and later exercise stress testing or Holter monitoring as needed."),
])
PATTERN = STANDARD
