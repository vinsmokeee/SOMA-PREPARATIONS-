"""ME Technical Paper III (Subject Specialisation Paper), MBBS / Medicine, BCSE 2024 - real paper (PDF sent by the founder).
Standard pattern, same as the 2025 MBBS paper (the latest). Short-answer sub-parts i/ii/iii are written a/b/c; each
case question is its own part.
Repeated in 2025 (reworded; not loaded again, 2024 recorded in me_technical3_repeats_2024_batch10.sql): MCQs 3, 10.
Replaced (guidelines differ, so more than one option defensible): MCQs 2, 18, 19 (BP targets, ACEI vs ARB), 13 (most
common small-bowel malignancy), 27 (labetalol maximum dose), 30 (severe mitral stenosis in pregnancy).
FLAGGED: Case II xi (the four targets of Bhutan's National TB Control Programme) - check against the current NTCP manual.
Drug doses follow standard WHO/ national protocols - a clinician should confirm them.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1"
GROUP_TAG = "mbbs2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "mbbs-medicine"
ADDS_TO_PAPER = True  # 2025 is the latest MBBS paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "MBBS / Medicine"

MCQ = r"""[
{
"n": 1,
"stem": "Which is NOT a risk factor for coronary artery disease in patients with hyperlipidemia",
"opts": [
"Cigarette smoking",
"Hypertension",
"High HDL",
"Family history of premature CAD"
]
},
{
"n": 2,
"stem": "Target Blood pressure for hypertension treatment is",
"opts": [
"Systolic BP of 140 mmHg and diastolic BP 90 mmHg.",
"Systolic BP less than 140 mmHg and diastolic BP less than 90 mmHg.",
"Systolic BP less than 130 mmHg and diastolic BP less than 80 mmHg.",
"Systolic BP of 130 mmHg and diastolic BP of 80 mmHg."
]
},
{
"n": 3,
"stem": "Common symptom of Neisseria gonorrhoea in females is per vaginal secretion of",
"opts": [
"Thick white and curd like",
"Mucupurulent discharge",
"Thin, scanty, white and frothy",
"Copious, yellow-green and frothy."
]
},
{
"n": 4,
"stem": "Identify the live vaccines from the following",
"opts": [
"BCG and IPV",
"BCG and MMR",
"MMR and IPV",
"MMR and Pentavalent"
]
},
{
"n": 5,
"stem": "Common side effect of amlodipine is",
"opts": [
"Dry cough",
"Edema",
"Palpitation",
"Hepatitis"
]
},
{
"n": 6,
"stem": "Most common cause of death after acute MI is",
"opts": [
"Cardiac rupture",
"Pulmonary failure",
"Ventricular fibrillation",
"Ventricular septal rupture."
]
},
{
"n": 7,
"stem": "What part of the brain generates spontaneous breathing.",
"opts": [
"Cerebrum",
"Cerebellum",
"Pons",
"Medulla"
]
},
{
"n": 8,
"stem": "Chronic bronchitis is defined as",
"opts": [
"Productive cough for at least 3 consecutive months in 2 consecutive years.",
"Productive cough for at least 2 consecutive months in 3 consecutive years.",
"Productive cough for at least 2 consecutive months in 2 consecutive years.",
"Productive cough for at least 3 consecutive months in 3 consecutive years."
]
},
{
"n": 9,
"stem": "Sinusoidal cause of esophageal varices is",
"opts": [
"Portal vein thrombosis",
"Cirrhosis",
"Portal biliary thrombosis",
"Hepatic vein thrombosis."
]
},
{
"n": 10,
"stem": "Beriberi is due to the deficiency of",
"opts": [
"Thiamine",
"Niacin",
"Vitamin E",
"Vitamin A."
]
},
{
"n": 11,
"stem": "Vitamin B12 requires intrinsic factor for absorption produced by",
"opts": [
"Duodenum",
"Stomach",
"Small intestine",
"Caecum"
]
},
{
"n": 12,
"stem": "Normal BMI is",
"opts": [
"less than 18.5 Kg/m2",
"18.6 -24.9 gm/m2",
"18.6 -24.9 Kg/m2",
"25 -29.5 Kg/m2"
]
},
{
"n": 13,
"stem": "Most common malignant neoplasm of small intestine is",
"opts": [
"Carcinoid",
"Leimyosarcoma",
"Adenocarcinoma",
"Lymphoma"
]
},
{
"n": 14,
"stem": "For the treatment of Helicobacter pylori, the dose of amoxicillin is",
"opts": [
"1000 mg daily",
"500 mg twice a day",
"1000 mg twice daily",
"500 mg daily."
]
},
{
"n": 15,
"stem": "The most common cause of chronic pancreatitis is",
"opts": [
"Genetic",
"Alcohol",
"Metabolic",
"Autoimmune"
]
},
{
"n": 16,
"stem": "The most common gallstone is",
"opts": [
"Pigmented",
"Black calcium bilibrubinate",
"Cholesterol",
"Brown calcium salts."
]
},
{
"n": 17,
"stem": "Charcot’s triad comprise of",
"opts": [
"Right upper quadrant pain, jaundice and fever.",
"Right upper quadrant pain, jaundice and vomiting.",
"Right upper quadrant pain, diarrhoea and fever.",
"Right upper quadrant pain, hypotension and altered mental status."
]
},
{
"n": 18,
"stem": "The target blood pressure for diabetic patients without proteinuria is",
"opts": [
"< 140/90 mmHg",
"< 130/80 mmHg",
"< 125/75 mmHg",
"< 120/80 mmHg"
]
},
{
"n": 19,
"stem": "The drug of choice for treatment of hypertension in diabetic patients is",
"opts": [
"ARB",
"ACEI",
"Beta blockers",
"CCB"
]
},
{
"n": 20,
"stem": "The post renal cause of Acute Kidney Injury is",
"opts": [
"Hypotension",
"Ischemia",
"Obstruction due to strictures",
"Nephrotoxins"
]
},
{
"n": 21,
"stem": "A 25-year-old woman presented with hypotension, wheezing and urticaria, 10 minutes after a bee sting. What is the likely diagnosis?",
"opts": [
"Shock",
"Systemic anaphylaxis",
"Urticarial reaction",
"Hyperactive pain reaction to bee sting."
]
},
{
"n": 22,
"stem": "Which species of plasmodium have a dormant phase in the liver?",
"opts": [
"Plasmodium vivax and Plasmodium falciparum.",
"Plasmodium falciparum and Plasmodium ovale.",
"Plasmodium vivax and Plasmodium ovale.",
"Plasmodium malariae and Plasmodium ovale."
]
},
{
"n": 23,
"stem": "Hansen’s disease is caused by",
"opts": [
"Mycobacterium tuberculosis",
"Mycobacterium leprae",
"Mycobacterium bovis",
"Mycobacterium kansasii"
]
},
{
"n": 24,
"stem": "Condyloma lata is caused by",
"opts": [
"Human papillomavirus type 6",
"Treponema pallidum",
"Human papillomavirus type 11",
"Treponema pertenue"
]
},
{
"n": 25,
"stem": "What are the vitamin K dependent clotting factors?",
"opts": [
"Factors II, VII, IX and X",
"Factors II, VII, IX and XI",
"Factors V, VIII, IX and X",
"Factors V, VII, IX and XIII"
]
},
{
"n": 26,
"stem": "Which one is a diagnostic criterion for GDM after a 75 g OGTT (glucose value)?",
"opts": [
"Fasting >= 92mg%",
"1 hour >= 200mg%",
"2 hour >= 140mg%",
"2 hour >= 120mg%"
]
},
{
"n": 27,
"stem": "In the treatment of eclampsia, the maximum dose of labetalol is",
"opts": [
"120 mg",
"160 mg",
"200 mg",
"240 mg"
]
},
{
"n": 28,
"stem": "The drug of choice for treatment of Scrub typhus is",
"opts": [
"Doxycycline",
"Amoxycillin",
"Ciprofloxacin",
"Erythromycin"
]
},
{
"n": 29,
"stem": "A teenage boy presents with sudden onset of right testicular pain. Which one of the following options needs to be excluded first?",
"opts": [
"Orchitis",
"Epididymitis",
"Testicular torsion",
"Testicular trauma"
]
},
{
"n": 30,
"stem": "A 21-year-old primi with known mitral stenosis came for ANC. Her echocardiogram shows a mitral valve area of 1.0 cm2 and a mean gradient of 12 mmHg. What is most appropriate management plan for this patient?",
"opts": [
"No intervention required but to continue with regular ANC",
"Plan for early delivery by caesarean section",
"Immediate balloon valvuloplasty",
"Treat with Betablockers"
]
}
]"""

KEY = {
    1: ("c", "High HDL is protective; smoking, hypertension and family history are risk factors."),
    4: ("b", "BCG and MMR are live attenuated vaccines; IPV and pentavalent are inactivated/ subunit."),
    5: ("b", "Ankle oedema (peripheral vasodilatation) is the common side effect of amlodipine; dry cough is from ACE inhibitors."),
    6: ("c", "Ventricular fibrillation (arrhythmia) is the most common cause of death after acute MI, mostly early."),
    7: ("d", "The respiratory centres generating the basic rhythm are in the medulla (modulated by the pons)."),
    8: ("a", "Chronic bronchitis: productive cough for at least 3 months in each of 2 consecutive years."),
    9: ("b", "Cirrhosis is the sinusoidal cause of portal hypertension; portal vein thrombosis is pre-hepatic, hepatic vein thrombosis post-hepatic."),
    11: ("b", "Intrinsic factor is secreted by parietal cells of the stomach."),
    12: ("c", "Normal BMI is 18.5-24.9 kg/m²."),
    14: ("c", "Amoxicillin 1 g twice daily is used in standard H. pylori triple therapy."),
    15: ("b", "Alcohol is the most common cause of chronic pancreatitis."),
    16: ("c", "Cholesterol stones are the most common gallstones."),
    17: ("a", "Charcot's triad (cholangitis): RUQ pain, jaundice and fever."),
    20: ("c", "Post-renal AKI is due to urinary tract obstruction (strictures, stones, prostate)."),
    21: ("b", "Hypotension, wheeze and urticaria minutes after a sting = systemic anaphylaxis."),
    22: ("c", "P. vivax and P. ovale form dormant liver hypnozoites (relapse), needing primaquine."),
    23: ("b", "Hansen's disease (leprosy) is caused by Mycobacterium leprae."),
    24: ("b", "Condylomata lata are lesions of secondary syphilis (Treponema pallidum); condylomata acuminata are HPV 6/11."),
    25: ("a", "Vitamin K-dependent clotting factors: II, VII, IX and X."),
    26: ("a", "IADPSG/ WHO 2013: fasting ≥ 92 mg/dL (1 h ≥ 180, 2 h ≥ 153) diagnoses GDM."),
    28: ("a", "Doxycycline is the drug of choice for scrub typhus."),
    29: ("c", "Sudden testicular pain in a teenager is torsion until proven otherwise - a surgical emergency."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "The first-line drug for anaphylaxis in an adult is", ["IV hydrocortisone", "IM adrenaline 0.5 mg (1:1000)", "Oral antihistamine", "IV salbutamol"], "b",
            "Intramuscular adrenaline into the anterolateral thigh, repeated every 5 minutes if needed."),
    new_mcq(2, T, "Kussmaul breathing is characteristic of", ["metabolic acidosis such as diabetic ketoacidosis", "respiratory alkalosis", "opioid overdose", "pneumothorax"], "a",
            "Deep, rapid breathing compensates for metabolic acidosis."),
    new_mcq(3, T, "Koplik spots on the buccal mucosa are seen in", ["Measles", "Rubella", "Chickenpox", "Mumps"], "a",
            "Koplik spots appear before the rash of measles."),
    new_mcq(4, T, "The antidote used for organophosphate poisoning is", ["Naloxone", "Atropine", "Flumazenil", "Vitamin K"], "b",
            "Atropine blocks muscarinic effects (with pralidoxime where available)."),
    new_mcq(5, T, "The drug of choice for severe falciparum malaria is", ["Oral chloroquine", "IV artesunate", "Primaquine", "Oral doxycycline"], "b",
            "WHO recommends IV (or IM) artesunate for severe malaria."),
    new_mcq(6, T, "The most common bacterial cause of community-acquired pneumonia is", ["Streptococcus pneumoniae", "Klebsiella pneumoniae", "Staphylococcus aureus", "Pseudomonas aeruginosa"], "a",
            "Pneumococcus is the commonest cause."),
]

SA = [
    ("A 35-year-old man presents to the OPD with increased thirst, increased frequency of urine and polyphagia. His blood pressure is 120/80 mmHg. There is a hyperpigmented skin lesion on the neck. He is not on any medication.\na) What is the most probable diagnosis? (1 mark)\nb) How will you confirm the diagnosis? (2 marks)\nc) Mention three types of the disease. (2 marks)",
     [("a) Diabetes mellitus, probably type 2 with insulin resistance (acanthosis nigricans)", 1),
      ("b) Fasting plasma glucose ≥ 126 mg/dL, or 2-h OGTT ≥ 200, or HbA1c ≥ 6.5%, or random ≥ 200 with symptoms (repeat test if asymptomatic)", 2),
      ("c) Type 1, type 2, gestational diabetes (also other specific types - MODY, secondary)", 2)],
     "a) Diabetes mellitus - most likely type 2 diabetes with insulin resistance, shown by acanthosis nigricans (hyperpigmented velvety skin on the neck) and the classic symptoms of polyuria, polydipsia and polyphagia.\nb) By blood glucose testing (WHO/ ADA criteria): fasting plasma glucose ≥ 126 mg/dL (7.0 mmol/L), or 2-hour plasma glucose ≥ 200 mg/dL (11.1 mmol/L) in a 75 g OGTT, or HbA1c ≥ 6.5%, or a random plasma glucose ≥ 200 mg/dL with classic symptoms. In the absence of symptoms an abnormal result is repeated to confirm.\nc) Type 1 diabetes (autoimmune beta-cell destruction), type 2 diabetes (insulin resistance with relative deficiency) and gestational diabetes; other specific types include MODY and diabetes secondary to pancreatic disease or drugs."),
    ("A 25-year-old primigravida delivered a 3.5 kg male baby normally at 40 weeks. Immediately post-partum her blood pressure was 130/86 mmHg and pulse 88/min. The uterus was soft. The staff on duty massaged the uterus and there was torrential vaginal bleeding. Within 10 minutes the blood pressure dropped to 90/60 mmHg and the pulse rose to 120/min. The staff called for help.\na) What is this condition called? (1 mark)\nb) What is the most common cause of this condition? (1 mark)\nc) How will you manage the condition? (3 marks)",
     [("a) Primary postpartum haemorrhage with hypovolaemic shock", 1),
      ("b) Uterine atony", 1),
      ("c) Call for help, ABC, two large-bore IV lines, crystalloids, blood group/ cross-match, transfuse; uterine massage/ bimanual compression, oxytocin infusion, ergometrine, misoprostol, tranexamic acid; empty bladder; check placenta/ tears; if persists - balloon tamponade, surgery (B-Lynch, ligation, hysterectomy); monitor", 3)],
     "a) Primary postpartum haemorrhage (blood loss ≥ 500 mL within 24 hours of vaginal birth) complicated by hypovolaemic shock.\nb) Uterine atony (failure of the uterus to contract) - about 70-80% of cases ('tone' of the 4 Ts: tone, trauma, tissue, thrombin).\nc) Call for help and manage as an emergency: airway, breathing, oxygen; two large-bore IV cannulas, take blood for haemoglobin, grouping and cross-match and clotting; rapid IV crystalloids and blood transfusion; catheterise the bladder and monitor urine output and vital signs. Treat atony: continuous uterine massage and bimanual compression; oxytocin 10 IU IM/IV then infusion (e.g. 20-40 IU in 1 L); ergometrine 0.2 mg IM/IV if no hypertension; misoprostol 800 µg sublingually; IV tranexamic acid 1 g within 3 hours of birth. Check that the placenta is complete and examine for genital tract tears. If bleeding continues: uterine balloon tamponade, then surgery (compression sutures such as B-Lynch, uterine/ internal iliac artery ligation, hysterectomy as a last resort)."),
    ("A 45-year-old woman is brought to the emergency department with breathlessness for 2 hours. She has had fever for the past 2 days. She gets a cough especially on exposure to cold and dust. On examination: BP 130/96 mmHg, pulse 100/min, respiratory rate 36/min, mild central cyanosis and rhonchi on auscultation.\na) How will you manage this patient? (3 marks)\nb) What is your diagnosis? (1 mark)\nc) How will you confirm the diagnosis? (1 mark)",
     [("a) Sit upright, high-flow oxygen (SpO2 93-95%), nebulised salbutamol (repeated/ back-to-back) + ipratropium, systemic steroid (prednisolone/ IV hydrocortisone), IV magnesium if no response, antibiotics if infection, monitor SpO2/ PEF/ ABG, ICU/ ventilation if life-threatening", 3),
      ("b) Acute severe asthma (exacerbation) triggered by a respiratory infection", 1),
      ("c) PEF/ spirometry showing variable airflow obstruction with reversibility (≥ 12% and 200 mL FEV1 after bronchodilator); ABG/ chest X-ray to assess severity and exclude others", 1)],
     "a) Sit her upright; give high-flow oxygen to keep SpO2 93-95%; nebulised salbutamol 5 mg repeated every 15-20 minutes (or continuous) with ipratropium 0.5 mg; systemic corticosteroids - prednisolone 40-50 mg orally or IV hydrocortisone 100 mg; IV magnesium sulphate 2 g over 20 minutes if poor response; treat infection with antibiotics if bacterial infection is suspected; monitor SpO2, PEF, pulse, respiratory rate and arterial blood gases; get a chest X-ray to exclude pneumothorax or pneumonia; refer to ICU for possible ventilation if she tires, becomes drowsy, or has a rising PaCO2.\nb) Acute severe exacerbation of bronchial asthma (respiratory rate 36/min, cyanosis, tachycardia, rhonchi), triggered by a respiratory infection.\nc) By showing variable, reversible airflow obstruction: peak expiratory flow or spirometry with bronchodilator reversibility (FEV1 increase ≥ 12% and ≥ 200 mL), done when she is stable; in the acute setting PEF and arterial blood gases assess severity."),
    ("A 16-year-old student is brought to the emergency department after swallowing 30 tablets of paracetamol 30 minutes ago. She has vomiting and abdominal pain. She is drowsy; pulse 100/min, BP 110/80 mmHg, temperature 37 °C, respiratory rate 24/min.\na) What is the immediate treatment for the patient? (2 marks)\nb) Outline the long-term management of the patient. (3 marks)",
     [("a) ABC, protect airway (drowsy); activated charcoal 50 g within 1 h if airway safe; blood for paracetamol level at 4 h, LFT, INR, glucose, electrolytes; start IV N-acetylcysteine (large/ staggered ingestion ≈ 15 g if 500 mg tablets - above toxic dose); look for co-ingestion", 2),
      ("b) Complete NAC course, monitor LFT/ INR/ glucose/ renal function, refer liver unit if failure; psychiatric assessment of suicide risk before discharge, counselling, family involvement, safety plan/ limit access to medicines, follow-up", 3)],
     "a) Resuscitate - airway, breathing and circulation; she is drowsy, so protect the airway (recovery position, consider other co-ingested drugs or alcohol). Give activated charcoal 50 g as she presented within 1 hour, if the airway is safe. Take blood for paracetamol level (at 4 hours after ingestion), liver function tests, INR, blood glucose, renal function and electrolytes. Thirty tablets of 500 mg is about 15 g - well above the toxic dose (≥ 150 mg/kg) - so start IV N-acetylcysteine without waiting for the level (or as soon as the 4-hour level confirms toxicity, plotted on the nomogram).\nb) Complete the full N-acetylcysteine course and repeat liver function tests, INR, glucose and creatinine; treat hepatotoxicity and refer to a liver unit if there are signs of acute liver failure. Before discharge, a full psychiatric assessment of suicidal intent and underlying problems (depression, stress, abuse, exams); counselling and psychotherapy, involving her family with her consent; a safety plan with restricted access to medicines at home; school support; and regular follow-up with mental health services."),
]
for i, (s, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=5, topic=T, stem=s, key_points=kp, model=mod))

C1 = """Case I: Upper GI bleeding in a man who drinks alcohol
A 41-year-old man had three episodes of vomiting blood at home and one on arrival at the emergency department. He also gave a history of passing black stools. He regularly consumes alcohol. On examination he is conscious and pale, with ascites. Blood pressure 90/60 mmHg, pulse 100/min, respiratory rate 16/min. He has been on omeprazole for gastritis for one month."""
C2 = """Case II: Presumptive tuberculosis
A 35-year-old man presented to a district hospital OPD with a productive cough for 3 weeks. He also had mild fever, night sweats and unexplained weight loss. On examination: blood pressure 160/110 mmHg, pulse 88/min, mild pallor, no icterus. The cervical lymph nodes were not palpable and the chest was clear on auscultation. On these findings the medical officer made a diagnosis of presumptive tuberculosis."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("mbbs2024", 1, T, C1, items=[
    it("i. How will you manage this patient initially?", 10,
       [("Resuscitation: ABC, two large-bore IV lines, bloods (Hb, cross-match, LFT, INR, platelets, urea), crystalloids then restrictive transfusion (target Hb 7-8), correct coagulopathy, monitor (urine output, vitals), Glasgow-Blatchford score", 5),
        ("Suspected variceal bleed (alcohol, ascites): IV terlipressin or octreotide, IV antibiotics (ceftriaxone), IV PPI until endoscopy, urgent endoscopy within 12 h (band ligation), balloon tamponade/ TIPS if uncontrolled, avoid fluid overload, lactulose; NBM", 5)],
       "This is an upper GI bleed with haemodynamic compromise in a man with probable alcoholic cirrhosis (ascites) - suspect variceal bleeding. Initial management: airway (risk of aspiration with haematemesis), oxygen; two large-bore IV cannulas; send blood for haemoglobin, grouping and cross-match, platelets, INR, liver and renal function; give IV crystalloids cautiously and transfuse packed red cells with a restrictive target (Hb 7-8 g/dL - over-transfusion raises portal pressure); correct coagulopathy and low platelets (FFP, platelets, vitamin K); monitor pulse, BP, urine output (catheter) and assess risk (Glasgow-Blatchford score). Specific treatment: IV vasoactive drug - terlipressin 2 mg 4-hourly or octreotide infusion - started before endoscopy; prophylactic IV antibiotics (e.g. ceftriaxone 1 g daily) which reduce infection, rebleeding and death; IV PPI until the source is known; nil by mouth; urgent upper GI endoscopy within 12 hours for diagnosis and endoscopic variceal band ligation (or therapy for an ulcer); if bleeding is uncontrolled, balloon tamponade (Sengstaken-Blakemore) as a bridge and TIPS; lactulose to prevent hepatic encephalopathy; and alcohol withdrawal prophylaxis (thiamine, benzodiazepines as needed)."),
    it("ii. How is the site of the bleeding determined?", 5,
       [("Clinical: haematemesis/ coffee-ground vomit and melaena → upper GI (proximal to ligament of Treitz); raised urea; NG aspirate; fresh blood per rectum → lower (unless massive upper)", 2),
        ("Investigations: upper GI endoscopy (diagnostic and therapeutic - first line), colonoscopy for lower, CT angiography/ angiography, capsule endoscopy, radionuclide scan", 3)],
       "Clinically, haematemesis (fresh or coffee-ground) and melaena indicate bleeding proximal to the ligament of Treitz (upper GI); a raised blood urea relative to creatinine also suggests upper GI bleeding (digested blood); bright red blood per rectum suggests lower GI bleeding, unless the upper bleed is massive. Investigations: upper GI endoscopy (oesophagogastroduodenoscopy) is the key test - it identifies the site and cause (varices, ulcer, Mallory-Weiss tear) and allows treatment; colonoscopy for lower GI bleeding; CT angiography or catheter angiography when endoscopy cannot find a brisk bleed (also allows embolisation); capsule endoscopy for small-bowel bleeding; radionuclide red cell scan for slow intermittent bleeding."),
    it("iii. Name five common causes of upper GI bleeding.", 5,
       [("Any five: peptic ulcer (duodenal/ gastric), oesophageal/ gastric varices, erosive gastritis/ duodenitis (NSAIDs, alcohol), Mallory-Weiss tear, oesophagitis, malignancy (gastric/ oesophageal), Dieulafoy lesion, angiodysplasia", 5)],
       "Peptic ulcer disease (duodenal and gastric ulcers); oesophageal and gastric varices (portal hypertension); erosive gastritis and duodenitis (NSAIDs, alcohol); Mallory-Weiss tear; reflux oesophagitis; upper GI malignancy (gastric or oesophageal cancer); Dieulafoy lesion; angiodysplasia."),
    it("iv. List five common causes of lower GI bleeding.", 5,
       [("Any five: haemorrhoids, anal fissure, diverticular disease, angiodysplasia, colorectal carcinoma/ polyps, inflammatory bowel disease, infective colitis (dysentery), ischaemic colitis, post-polypectomy, Meckel's diverticulum (young)", 5)],
       "Haemorrhoids; anal fissure; diverticular disease; angiodysplasia; colorectal cancer and polyps; inflammatory bowel disease (ulcerative colitis, Crohn's); infective colitis (e.g. amoebic or bacillary dysentery); ischaemic colitis; radiation proctitis; Meckel's diverticulum in young people."),
    it("v. The patient's blood reports show haemoglobin 4 g%, normal WBC, grossly deranged liver enzymes and positive hepatitis B surface antigen. What is your decision?", 5,
       [("Urgent transfusion of packed red cells (Hb 4 with active bleeding) - HBsAg positivity is not a contraindication; universal precautions, infection control", 2),
        ("Treat as decompensated chronic liver disease (alcohol + HBV): continue variceal bleed management, correct coagulopathy, admit HDU/ ICU, refer to higher centre/ gastroenterology, HBV workup (HBeAg, HBV DNA) and antiviral (tenofovir/ entecavir), family screening and vaccination, stop alcohol", 3)],
       "With a haemoglobin of 4 g/dL and active bleeding, he needs urgent transfusion of packed red cells (to a target of about 7-8 g/dL) along with control of the bleeding; hepatitis B positivity is not a contraindication to transfusion or endoscopy - use standard precautions and infection control. The deranged liver enzymes with HBsAg positivity and alcohol use suggest decompensated chronic liver disease from hepatitis B and alcohol; admit him to HDU/ ICU, continue variceal bleeding treatment (vasoactive drugs, antibiotics, endoscopic ligation), correct coagulopathy, and refer to a higher centre (gastroenterology/ hepatology) if facilities are lacking. Further work-up: HBeAg, HBV DNA, ultrasound abdomen, AFP; start antiviral therapy (tenofovir or entecavir) as indicated; screen and vaccinate household contacts; strict alcohol abstinence."),
    it("vi. The patient complains of breathlessness and itching 5 minutes after the start of a blood transfusion. On examination there are urticarial rashes and swelling of the lips. What is your diagnosis? How will you manage it?", 10,
       [("Diagnosis: acute (anaphylactic/ severe allergic) transfusion reaction", 3),
        ("Management: stop transfusion immediately, keep IV line with normal saline, ABC, IM adrenaline 0.5 mg (repeat 5 min), oxygen, IV fluids, antihistamine (chlorpheniramine), hydrocortisone, nebulised salbutamol; check patient/ unit identity, return bag and blood samples to blood bank, report (haemovigilance), monitor; future transfusions - washed/ IgA-deficient products, premedication", 7)],
       "Diagnosis: anaphylactic (severe allergic) transfusion reaction - urticaria, lip swelling (angioedema) and breathlessness within minutes of starting transfusion (sometimes due to IgA deficiency with anti-IgA antibodies). Management: stop the transfusion immediately and keep the IV line open with normal saline; call for help; assess airway, breathing and circulation; give IM adrenaline 0.5 mg (0.5 mL of 1:1000) into the thigh, repeated every 5 minutes if needed; high-flow oxygen; IV fluids for hypotension; IV chlorpheniramine 10 mg and IV hydrocortisone 200 mg; nebulised salbutamol for bronchospasm; monitor vital signs and SpO2 closely. Check the patient's identity against the blood unit label and records; return the blood bag and send fresh blood and urine samples to the blood bank to exclude a haemolytic reaction; document and report the reaction (haemovigilance). For future transfusions use washed red cells or IgA-deficient products if IgA deficiency is confirmed, with premedication, and transfuse slowly under close observation, since he still needs blood."),
    it("vii. When will you discharge the patient? Detail the long-term management of the patient.", 10,
       [("Discharge when: no further bleeding for 48-72 h, stable haemodynamics and Hb, tolerating diet, ascites/ encephalopathy controlled, infection treated, follow-up arranged", 3),
        ("Long-term: secondary prophylaxis - non-selective beta blocker (propranolol/ carvedilol) + repeated band ligation until varices eradicated; antiviral therapy for HBV; total alcohol abstinence/ de-addiction support; ascites management (salt restriction, spironolactone ± furosemide); lactulose; nutrition; vaccination; HCC surveillance (USG + AFP 6-monthly); avoid NSAIDs; liver transplant evaluation; regular follow-up", 7)],
       "Discharge when there has been no rebleeding for at least 48-72 hours, haemoglobin and vital signs are stable, he is eating, ascites and any encephalopathy are controlled, infections are treated, he understands his medicines and warning signs, and follow-up (endoscopy and clinic) is arranged. Long-term management: (1) secondary prophylaxis of variceal bleeding - non-selective beta blocker (propranolol or carvedilol) plus repeated endoscopic band ligation every 2-4 weeks until varices are eradicated, then surveillance; (2) hepatitis B - antiviral therapy (tenofovir or entecavir) with monitoring of HBV DNA and liver function; screen and vaccinate family; (3) complete alcohol abstinence with counselling, de-addiction services and family support; (4) ascites - salt restriction (< 2 g sodium/ day), spironolactone with or without furosemide, monitoring electrolytes and weight; (5) prevention of encephalopathy with lactulose; (6) good nutrition (adequate protein and calories, late-evening snack); (7) avoid NSAIDs and unnecessary sedatives; (8) vaccination (hepatitis A, pneumococcal, influenza); (9) surveillance for hepatocellular carcinoma with ultrasound and AFP every 6 months; (10) assessment for liver transplantation if decompensation continues; regular follow-up."),
])
Q += case("mbbs2024", 2, T, C2, items=[
    it("i. How will you confirm the diagnosis?", 5,
       [("Sputum examination: rapid molecular test (Xpert MTB/RIF/ Truenat - also detects rifampicin resistance) on sputum; sputum smear microscopy (ZN/ LED fluorescence) 2 samples; culture and DST (gold standard)", 3),
        ("Supporting: chest X-ray, HIV test, CBC/ ESR, blood glucose; bacteriologically confirmed vs clinically diagnosed", 2)],
       "Collect two sputum samples (spot and early morning) and test with a WHO-recommended rapid molecular test such as Xpert MTB/RIF (or Truenat), which detects M. tuberculosis and rifampicin resistance within hours; sputum smear microscopy (Ziehl-Neelsen or LED fluorescence) where molecular tests are unavailable; sputum culture (liquid or solid) with drug-susceptibility testing is the gold standard and is done for resistance testing. Supporting tests: chest X-ray (cavities, infiltrates), HIV testing, blood glucose (diabetes), CBC and ESR. A positive test gives a bacteriologically confirmed diagnosis; if tests are negative but the clinician decides to treat based on X-ray and clinical features, it is a clinically diagnosed case."),
    it("ii. List the types of extrapulmonary TB.", 4,
       [("Any eight/ main types: lymph node (TB lymphadenitis), pleural (effusion), abdominal (intestinal/ peritoneal), skeletal/ spinal (Pott's), CNS (TB meningitis, tuberculoma), genitourinary, pericardial, miliary/ disseminated, cutaneous, ocular", 4)],
       "Tuberculous lymphadenitis (most common, cervical nodes); pleural TB (pleural effusion, empyema); abdominal TB (intestinal, peritoneal, mesenteric nodes); bone and joint TB including spinal TB (Pott's disease); central nervous system TB (TB meningitis, tuberculoma); genitourinary TB (renal, genital); pericardial TB; disseminated/ miliary TB; cutaneous TB (scrofuloderma, lupus vulgaris); ocular TB."),
    it("iii. Classify TB based on the history of previous TB treatment.", 7,
       [("New: never treated or < 1 month of anti-TB drugs", 1.5), ("Previously treated: relapse (cured/ completed, now again diagnosed)", 1.5),
        ("Treatment after failure", 1.5), ("Treatment after loss to follow-up (interrupted ≥ 2 months)", 1.5), ("Other previously treated; patients with unknown previous treatment history", 1)],
       "WHO classification (used in national guidelines): (1) New patients - never treated for TB or have taken anti-TB drugs for less than 1 month. (2) Previously treated patients - received 1 month or more of anti-TB drugs in the past, subdivided into: (a) relapse - previously treated, declared cured or treatment completed at the end of their last course, and now diagnosed with a recurrent episode; (b) treatment after failure - their most recent course ended in failure; (c) treatment after loss to follow-up - previously treated and declared lost to follow-up (treatment interrupted for 2 consecutive months or more); (d) other previously treated - outcome of the last course unknown or undocumented. (3) Patients with unknown previous TB treatment history."),
    it("iv. Define the treatment outcomes of a TB patient.", 7,
       [("Cured: bacteriologically confirmed at start, completed treatment, smear/ culture negative in last month and at least once before", 1.5),
        ("Treatment completed: completed treatment without evidence of failure but no record of cure test", 1), ("Treatment failed: smear/ culture positive at month 5 or later", 1),
        ("Died: dies for any reason before or during treatment", 1), ("Lost to follow-up: did not start or interrupted ≥ 2 consecutive months", 1),
        ("Not evaluated (no outcome/ transferred out); treatment success = cured + completed", 1.5)],
       "WHO/ national definitions: Cured - a pulmonary TB patient with bacteriologically confirmed TB at the start who completed treatment and was smear- or culture-negative in the last month of treatment and on at least one previous occasion. Treatment completed - completed treatment without evidence of failure, but without a record showing negative sputum results in the last month and at least one previous occasion. Treatment failed - sputum smear or culture positive at month 5 or later during treatment. Died - a patient who dies for any reason before starting or during treatment. Lost to follow-up - did not start treatment or whose treatment was interrupted for 2 consecutive months or more. Not evaluated - no treatment outcome assigned (including transferred out with unknown outcome). Treatment success - the sum of cured and treatment completed."),
    it("v. What are the aims of treating TB?", 5,
       [("Cure the patient and restore quality of life/ productivity; prevent death from active TB or its late effects; prevent relapse; reduce transmission to others; prevent development and transmission of drug resistance", 5)],
       "To cure the patient and restore quality of life and productivity; to prevent death from active TB or its late effects; to prevent relapse of TB; to reduce transmission of TB to others; and to prevent the development and transmission of drug-resistant TB."),
    it("vi. Mention three basic principles of TB treatment.", 3,
       [("Any three: combination of several drugs (prevent resistance), adequate duration (intensive + continuation phases), correct dosage by weight, regular uninterrupted intake with direct observation/ adherence support (DOT), standardised regimens/ free drugs, monitoring of response", 3)],
       "(1) Use a combination of several effective drugs - never a single drug - to prevent drug resistance; (2) give the correct dose by body weight for an adequate duration (an intensive phase to kill bacilli rapidly and a continuation phase to eliminate persisters); (3) ensure regular, uninterrupted intake with treatment adherence support such as directly observed treatment, using standardised regimens and monitoring response (sputum follow-up)."),
    it("vii. What are the advantages of FDC (fixed-dose combination) drugs?", 3,
       [("Fewer pills - better adherence, prevents monotherapy/ selective intake and resistance, fewer prescription/ dosing errors, simpler procurement, storage and distribution, easier DOT", 3)],
       "Fewer tablets to swallow, improving adherence; prevents monotherapy because the patient cannot take one drug and not the others, reducing the risk of drug resistance; fewer prescribing and dispensing errors with simple weight-band dosing; simpler procurement, storage and distribution, and easier directly observed treatment."),
    it("viii. Write the names, with strengths, of the drugs in 4FDC and 2FDC (adult).", 6,
       [("4FDC: isoniazid 75 mg + rifampicin 150 mg + pyrazinamide 400 mg + ethambutol 275 mg", 4), ("2FDC: isoniazid 75 mg + rifampicin 150 mg", 2)],
       "Adult 4FDC (HRZE) tablet: isoniazid 75 mg, rifampicin 150 mg, pyrazinamide 400 mg and ethambutol 275 mg. Adult 2FDC (HR) tablet: isoniazid 75 mg and rifampicin 150 mg. The number of tablets is given by weight band (e.g. 3 tablets for 38-54 kg, 4 for 55-70 kg, 5 for > 70 kg)."),
    it("ix. Name the treatment phases with their duration.", 4,
       [("Intensive phase: 2 months of HRZE (4FDC) daily", 2), ("Continuation phase: 4 months of HR (2FDC) daily - total 6 months (longer for TB meningitis/ bone TB)", 2)],
       "For drug-susceptible TB (new and previously treated without resistance): intensive phase - 2 months of isoniazid, rifampicin, pyrazinamide and ethambutol (2HRZE) daily; continuation phase - 4 months of isoniazid and rifampicin (4HR, ethambutol may be added in some guidelines) daily. Total 6 months; it is extended (9-12 months) for TB meningitis and bone and joint TB."),
    it("x. What is DOTS? Explain.", 2,
       [("Directly Observed Treatment, Short-course: WHO strategy - political commitment, quality diagnosis (sputum bacteriology), standardised treatment with direct observation and support, uninterrupted drug supply, recording/ reporting and monitoring", 2)],
       "DOTS (Directly Observed Treatment, Short-course) is the WHO strategy for TB control in which a trained health worker or treatment supporter watches the patient swallow every dose of a standardised short-course regimen. Its five components: political commitment with funding; case detection by quality-assured bacteriology; standardised treatment with supervision and patient support; an effective, uninterrupted drug supply; and a standard recording and reporting system to monitor outcomes."),
    it("xi. What are the four targets of the National TB Control Programme (NTCP)?", 2,
       [("The four national targets as stated in the current NTCP strategy/ manual (e.g. case detection, treatment success, reduction of incidence and deaths, no catastrophic costs) - aligned with End TB Strategy", 2)],
       "Answer from the current National TB Control Programme strategy (Ministry of Health). These are aligned with the WHO End TB Strategy targets: reduce TB deaths and TB incidence substantially (End TB: 90% fewer deaths and 80% lower incidence by 2030 compared with 2015), achieve high case detection, and achieve high treatment success (at least 90%) with no TB-affected family facing catastrophic costs. [Expert: check the exact four NTCP targets in the current national manual.]"),
    it("xii. What is latent TB?", 2,
       [("Persistent immune response to M. tuberculosis antigens without clinical, radiological or bacteriological evidence of active disease; not infectious; ~5-10% lifetime risk of reactivation; detected by TST/ IGRA; treated with TPT (e.g. isoniazid, 3HP) in high-risk groups", 2)],
       "Latent TB infection is a state of persistent immune response to Mycobacterium tuberculosis antigens without clinical, radiological or bacteriological evidence of active TB disease. The person has no symptoms and is not infectious, but about 5-10% will develop active TB in their lifetime (higher with HIV, diabetes, malnutrition, immunosuppression). It is detected with a tuberculin skin test or interferon-gamma release assay, and high-risk groups receive TB preventive treatment (e.g. 6 months of isoniazid or 3 months of weekly isoniazid-rifapentine)."),
])
for x in Q:
    if x.get("key") == "C2Q11":
        x["issues"] = ["Expert check: confirm the four targets of the National TB Control Programme."]
PATTERN = STANDARD
