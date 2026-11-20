"""ME Technical Paper III (Subject Specialisation Paper), Cardiology, BCSE 2025 - real paper (PDF sent by the founder).
Pattern (own): Section A Part I 30 MCQ; Part II 13 short questions (20 marks, one set); Section B five compulsory clinical
cases x 10 (50). 150 min + 15 min reading. All 30 MCQs kept.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Cardiology): BCSE 2025, batch 1"
GROUP_TAG = "cardio2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "cardiology"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Cardiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Cardiology"

MCQ = r"""[
{
"n": 1,
"stem": "A patient with MS presents with irregularly irregular rhythm and no P waves. Most likely ECG diagnosis:",
"opts": [
"Atrial fibrillation",
"Atrial flutter",
"Sinus arrhythmia",
"Junctional rhythm"
]
},
{
"n": 2,
"stem": "Which finding is most specific for cardiac tamponade on echo?",
"opts": [
"Pleural effusion",
"Right atrial collapse in systole",
"LV hypertrophy",
"Dilated LA"
]
},
{
"n": 3,
"stem": "Which is an absolute contraindication to exercise stress testing?",
"opts": [
"Severe aortic stenosis with syncope",
"Controlled hypertension",
"Mild angina",
"Diabetes"
]
},
{
"n": 4,
"stem": "Target heart rate for maximal stress is calculated as:",
"opts": [
"220 – age",
"200 – age",
"220 + age",
"200 + age"
]
},
{
"n": 5,
"stem": "During an exercise stress test, which of the following findings is considered the most specific indicator of myocardial ischemia?",
"opts": [
"Downsloping ST-segment depression ≥1 mm at 80 ms after the J-point",
"Upsloping ST-segment depression <1 mm during peak exercise",
"Development of frequent premature ventricular contractions (PVCs)",
"Achievement of target heart rate without ST changes"
]
},
{
"n": 6,
"stem": "Contrast (bubble) echo is mainly used to detect:",
"opts": [
"LV systolic dysfunction",
"Aortic regurgitation",
"Intracardiac shunts (e.g., PFO/ASD)",
"Mitral stenosis"
]
},
{
"n": 7,
"stem": "Abdominal aortic aneurysm requiring elective repair in a 65-year-old man:",
"opts": [
"Diameter ≥5.5 cm",
"≥3 cm",
"≥4 cm",
"Any aneurysm"
]
},
{
"n": 8,
"stem": "Statins reduce risk of Acute Coronary Syndrome mainly by:",
"opts": [
"Lowering LDL, stabilizing plaque, anti-inflammatory effects",
"Increasing HDL only",
"Reducing BP",
"Vasodilation only"
]
},
{
"n": 9,
"stem": "In a patient with suspected diastolic dysfunction, which echocardiographic parameter is most reliable for estimating LV filling pressure?",
"opts": [
"E/A ratio alone",
"E/e’ ratio",
"Deceleration time only",
"LV wall thickness"
]
},
{
"n": 10,
"stem": "Initial pathological step in atherosclerosis:",
"opts": [
"Myocyte hypertrophy",
"Endothelial injury + lipid infiltration",
"Fibrous cap rupture",
"Myocardial infarction"
]
},
{
"n": 11,
"stem": "Regarding radiation safety in Cath Lab, ALARA principle means:",
"opts": [
"As Long As Radiation Allows",
"As Low As Reasonably Achievable",
"Avoid Lead And Radiation Always",
"Always Limit And Reduce Activity"
]
},
{
"n": 12,
"stem": "Which of the following practices reduces patient radiation exposure during fluoroscopy?",
"opts": [
"Using high magnification continuously",
"Collimating the X-ray beam to the area of interest",
"Using maximum frame rate for cine imaging",
"Standing closer to the X-ray tube"
]
},
{
"n": 13,
"stem": "Wedge pressure approximates:",
"opts": [
"RA pressure",
"LV systolic pressure",
"LA pressure",
"Pulmonary artery systolic pressure"
]
},
{
"n": 14,
"stem": "Classic components of TOF include all EXCEPT:",
"opts": [
"Ventricular septal defect (VSD)",
"Right ventricular outflow tract obstruction (RVOTO)",
"Overriding aorta",
"Left ventricular hypertrophy"
]
},
{
"n": 15,
"stem": "Which ECG finding is most characteristic of hyperkalemia?",
"opts": [
"U waves",
"Peaked tall T waves",
"ST depression",
"QT prolongation"
]
},
{
"n": 16,
"stem": "The PR interval is considered prolonged when it is:",
"opts": [
">0.12 sec",
">0.20 sec",
"<0.08 sec",
"<0.12 sec"
]
},
{
"n": 17,
"stem": "Heparin reversal in cath lab is achieved with:",
"opts": [
"Protamine sulphate",
"Vitamin K",
"FFP",
"Tranexamic acid"
]
},
{
"n": 18,
"stem": "Coronary blood flow to the left ventricle occurs predominantly during:",
"opts": [
"Early systole",
"Mid systole",
"Diastole",
"Isovolumetric contraction"
]
},
{
"n": 19,
"stem": "Which wave of the jugular venous pulse corresponds to atrial contraction?",
"opts": [
"a wave",
"c wave",
"v wave",
"y descent"
]
},
{
"n": 20,
"stem": "The Frank-Starling mechanism states that:",
"opts": [
"Increased preload → increased stroke volume",
"Increased afterload → increased stroke volume",
"Increased HR → increased contractility",
"Increased contractility → increased preload"
]
},
{
"n": 21,
"stem": "The hallmark echocardiographic feature of constrictive pericarditis is:",
"opts": [
"Global LV hypokinesia",
"Systolic anterior motion of mitral valve",
"Septal bounce with ventricular interdependence",
"Apical sparing"
]
},
{
"n": 22,
"stem": "Complication of femoral artery puncture ABOVE the inguinal ligament is:",
"opts": [
"Pseudoaneurysm",
"Retroperitoneal haemorrhage",
"AV fistula",
"Hematoma only"
]
},
{
"n": 23,
"stem": "A 50-year-old with chest pain shows ST elevation in V2–V4. The culprit vessel is most likely:",
"opts": [
"RCA",
"LAD",
"LCX",
"PDA"
]
},
{
"n": 24,
"stem": "Echo shows severe MR with eccentric jet hugging the LA wall. This is called:",
"opts": [
"Laminar flow",
"Coanda effect",
"Bernoulli phenomenon",
"Venturi effect"
]
},
{
"n": 25,
"stem": "The “pigtail” catheter in LV angiography is designed to:",
"opts": [
"Prevent endocardial injury by side holes",
"Deliver stents",
"Measure coronary flow reserve",
"Cross CTO lesions"
]
},
{
"n": 26,
"stem": "Pacemaker “capture” on ECG is defined as:",
"opts": [
"Presence of a pacing spike followed by ventricular depolarization",
"Only pacing spike without QRS",
"Narrow QRS with sinus P wave",
"Absence of T wave"
]
},
{
"n": 27,
"stem": "A 68-year-old patient with symptomatic bradycardia due to high-grade AV block undergoes DDD pacemaker implantation. Post-implantation ECG shows atrial pacing spikes followed by ventricular pacing spikes, maintaining AV synchrony. Which of the following statements BEST describes the function of a DDD pacemaker in this patient?",
"opts": [
"Paces only the atrium, ignoring intrinsic ventricular activity",
"Paces only the ventricle, without atrial sensing",
"Paces and sensed at both atrium and ventricle, while sensing intrinsic activity in both chambers to maintain AV synchrony",
"Only senses intrinsic cardiac activity without delivering pacing"
]
},
{
"n": 28,
"stem": "Hypertension accelerates atherosclerosis by:",
"opts": [
"Endothelial dysfunction, vascular remodeling",
"Increasing only cholesterol",
"Only decreasing HR",
"Vasodilation"
]
},
{
"n": 29,
"stem": "On echo, tricuspid regurgitation velocity is used to estimate:",
"opts": [
"Left Ventricular systolic pressure",
"Right Atrial pressure only",
"Pulmonary artery systolic pressure",
"Pulmonary Capillary Wedge Pressure"
]
},
{
"n": 30,
"stem": "Optimal BP target for most adults <65 years according to guidelines:",
"opts": [
"<130/80 mmHg",
"<140/90 mmHg",
"<120/70 mmHg",
"<150/90 mmHg"
]
}
]"""

KEY = {
    1: ("a", "Irregularly irregular rhythm without P waves = atrial fibrillation (common in mitral stenosis)."), 2: ("b", "Right atrial systolic collapse is the listed tamponade sign."),
    3: ("a", "Symptomatic severe aortic stenosis is an absolute contraindication."), 4: ("a", "Maximal predicted heart rate = 220 − age."),
    5: ("a", "Horizontal or downsloping ST depression ≥1 mm at 80 ms after J point."), 6: ("c", "Agitated saline crosses intracardiac shunts (PFO/ASD)."),
    7: ("a", "Elective repair of AAA in men at ≥5.5 cm."), 8: ("a", "LDL lowering, plaque stabilisation and pleiotropic anti-inflammatory effects."),
    9: ("b", "E/e' best estimates LV filling pressure."), 10: ("b", "Endothelial injury with lipid infiltration starts atherosclerosis."),
    11: ("b", "ALARA: as low as reasonably achievable."), 12: ("b", "Collimation limits the irradiated area."), 13: ("c", "PCWP approximates left atrial pressure."),
    14: ("d", "TOF has RV (not LV) hypertrophy."), 15: ("b", "Tall peaked T waves are typical of hyperkalaemia."), 16: ("b", "PR > 0.20 s is first-degree AV block."),
    17: ("a", "Protamine sulphate reverses heparin."), 18: ("c", "LV coronary flow occurs mainly in diastole."), 19: ("a", "The a wave is atrial contraction."),
    20: ("a", "More preload (stretch) → more stroke volume."), 21: ("c", "Septal bounce and ventricular interdependence."),
    22: ("b", "High puncture above the inguinal ligament risks retroperitoneal haemorrhage."), 23: ("b", "V2-V4 ST elevation: anterior MI, LAD."),
    24: ("b", "An eccentric jet hugging the atrial wall shows the Coanda effect."), 25: ("a", "The pigtail's curve and side holes protect the endocardium."),
    26: ("a", "Capture: a pacing spike followed by depolarisation."), 27: ("c", "DDD paces and senses both chambers to keep AV synchrony."),
    28: ("a", "Hypertension causes endothelial dysfunction and vascular remodelling."), 29: ("c", "4V² of the TR jet + RA pressure = PA systolic pressure."),
    30: ("a", "Current guidelines target <130/80 mmHg for most adults."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T)
SA = [
    ("Name the main branches of the right coronary artery (RCA).", 1, "Conus, SA nodal, right marginal (acute marginal), posterior descending (PDA, in right dominance), AV nodal and posterolateral branches."),
    ("Define preload and afterload.", 2, "Preload: the stretch of ventricular muscle at the end of diastole (end-diastolic volume/pressure). Afterload: the resistance the ventricle must overcome to eject blood (wall stress in systole; aortic pressure/systemic vascular resistance)."),
    ("Name two common indications for transesophageal echocardiography (TEE).", 2, "Any two: looking for left atrial appendage thrombus before cardioversion; suspected infective endocarditis/abscess; prosthetic valve assessment; aortic dissection; guidance of structural interventions; poor transthoracic windows."),
    ("What is capture and loss of capture in pacemaker function?", 2, "Capture: the pacing stimulus depolarises the chamber - spike followed by a P wave or QRS. Loss of capture: a pacing spike appears but no depolarisation follows (lead displacement, high threshold, battery/lead fault)."),
    ("What does DDD pacemaker mode stand for?", 1, "Dual chamber paced, dual chamber sensed, dual response (inhibited and triggered)."),
    ("Name two lab markers commonly used to support heart failure diagnosis.", 1, "BNP and NT-proBNP."),
    ("Give one echocardiographic sign of mitral stenosis.", 1, "Any one: thickened leaflets with diastolic doming (hockey-stick anterior leaflet); reduced valve area by planimetry; raised transmitral gradient; enlarged left atrium."),
    ("Name two target organs affected by chronic hypertension.", 2, "Any two: heart (LVH, heart failure), brain (stroke), kidneys (nephropathy), eyes (retinopathy), blood vessels."),
    ("What is TIMI flow grade 3 and grade 1?", 3, "TIMI 3: normal flow - contrast fills the distal vessel and clears normally. TIMI 1: penetration without perfusion - contrast passes the obstruction but does not fill the distal bed."),
    ("Name two complications of right heart catheterization.", 2, "Any two: arrhythmias, pulmonary artery rupture, pulmonary infarction, pneumothorax (subclavian/jugular access), bleeding/haematoma, infection, thrombosis, balloon rupture."),
    ("ECG sign of left ventricular hypertrophy?", 1, "Sokolow-Lyon voltage: S in V1 + R in V5 or V6 ≥ 35 mm (with strain pattern)."),
    ("What is P mitrale on ECG?", 1, "Broad, notched (bifid) P wave > 0.12 s in lead II - left atrial enlargement."),
    ("What is the role of an implantable cardioverter-defibrillator (ICD)?", 1, "Detects life-threatening ventricular tachycardia/fibrillation and treats it by anti-tachycardia pacing or shock, preventing sudden cardiac death."),
]
for i, (s, mk, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=mk, topic=T, group="me-technical-3-cardio2025-part2", pos=i + 1,
                  stem=f"Part II, question {i + 1}. {s} ({mk} mark{'s' if mk > 1 else ''})", key_points=[(mod, mk)], model=mod))
CASES = [
    ("""A 25-year-old female presents with exertional dyspnoea and fatigue. On examination, she has a wide fixed split of the second heart sound and a systolic ejection murmur at the left upper sternal border. Echocardiography shows a secundum atrial septal defect with left-to-right shunt and mild right atrial/ventricular dilation.
a) Name three types of ASD and identify the most common type. (2 marks)
b) Explain the haemodynamic consequence of a left-to-right shunt in ASD. (2 marks)
c) List two echocardiographic features suggestive of ASD. (2 marks)
d) What ECG findings are commonly seen in secundum ASD? (2 marks)
e) Mention two treatment options for ASD. (2 marks)""",
     [("a) Ostium secundum (most common), ostium primum, sinus venosus (coronary sinus)", 2), ("b) Volume overload of RA, RV and pulmonary circulation; later pulmonary hypertension", 2), ("c) Septal dropout, shunt flow on colour Doppler, dilated RA/RV, bubble study", 2), ("d) Right axis deviation, incomplete RBBB (rsR' in V1), RVH", 2), ("e) Percutaneous device closure; surgical patch closure", 2)],
     """a) Ostium secundum (most common, about 70%), ostium primum, sinus venosus (and coronary sinus).
b) Blood flows from LA to RA, causing volume overload of the right atrium, right ventricle and pulmonary circulation; over years this can cause RV dilation, atrial arrhythmias, pulmonary hypertension and, rarely, shunt reversal (Eisenmenger).
c) Echo dropout in the interatrial septum; colour Doppler flow across the septum; dilated RA and RV with paradoxical septal motion; positive bubble study (and Qp:Qs > 1.5).
d) Right axis deviation and incomplete right bundle branch block (rsR' in V1), with RV hypertrophy/right atrial enlargement.
e) Percutaneous transcatheter device closure (suitable secundum defects); surgical patch closure."""),
    ("""A 55-year-old male with long-standing uncontrolled hypertension presents with dyspnoea, mild pedal oedema and blurred vision. ECG shows LVH. Echo reveals concentric hypertrophy and diastolic dysfunction. Fundoscopy shows arteriolar narrowing and AV nicking.
a) Identify three target organs affected in this patient. (3 marks)
b) Describe two echocardiographic features of hypertensive heart disease. (2 marks)
c) List two lab investigations to assess secondary causes of hypertension. (2 marks)
d) Suggest first-line pharmacological therapy for this patient. (2 marks)
e) Name one lifestyle modification to control hypertension. (1 mark)""",
     [("a) Heart, eyes (retina), kidneys/vessels", 3), ("b) Concentric LVH, diastolic dysfunction (E/A, E/e'), LA enlargement", 2), ("c) Renal function/urine, electrolytes (K⁺), aldosterone-renin, TSH, cortisol", 2), ("d) ACE inhibitor/ARB, often with CCB or thiazide; diuretic for oedema", 2), ("e) Salt restriction, weight loss, exercise, less alcohol, stop smoking", 1)],
     """a) Heart (LVH, diastolic heart failure), eyes (hypertensive retinopathy), and kidneys/blood vessels (likely; check renal function and urine).
b) Concentric left ventricular hypertrophy with increased wall thickness; diastolic dysfunction (impaired relaxation, raised E/e'); left atrial enlargement.
c) Any two: serum creatinine/urinalysis and renal ultrasound; serum electrolytes (hypokalaemia); plasma aldosterone-renin ratio; thyroid function; urine metanephrines/cortisol.
d) An ACE inhibitor or ARB (for LVH regression and renal protection), combined with a calcium-channel blocker or thiazide-type diuretic; a loop diuretic if congestion.
e) Reduce salt intake (or weight loss, regular exercise, less alcohol, no smoking)."""),
    ("""A 58-year-old male presents with sudden retrosternal chest pain radiating to the left arm, diaphoresis and nausea. ECG shows ST-elevation in leads II, III, aVF. Troponin I is elevated.
a) Identify the type of MI and the infarcted territory. (2 marks)
b) Name the likely culprit coronary artery. (1 mark)
c) Which initial management steps are indicated in the first hour? (3 marks)
d) Explain the role of TIMI flow grade in post-PCI assessment. (2 marks)
e) Name two complications of inferior MI. (2 marks)""",
     [("a) STEMI, inferior wall", 2), ("b) Right coronary artery (or LCX if left dominant)", 1), ("c) Aspirin, P2Y12 inhibitor, anticoagulant, oxygen if hypoxic, analgesia, nitrates if no RV infarct/hypotension, primary PCI/thrombolysis; right-sided ECG", 3), ("d) Grades reperfusion success; TIMI 3 = good flow, prognosis", 2), ("e) Bradycardia/AV block, RV infarction/hypotension, papillary muscle rupture/MR", 2)],
     """a) ST-elevation myocardial infarction (STEMI) of the inferior wall.
b) Right coronary artery (in about 80%; the left circumflex in left-dominant circulation).
c) Call for reperfusion: primary PCI within 90-120 minutes (or fibrinolysis if PCI is not available within that time); aspirin loading, a P2Y12 inhibitor and heparin; oxygen only if SpO₂ < 90%; pain relief; nitrates with caution (avoid if RV infarct or hypotension - take a right-sided ECG, V4R); monitor for arrhythmias.
d) TIMI grade describes coronary flow after PCI: TIMI 3 means full reperfusion and better outcome; lower grades (no-reflow) indicate microvascular obstruction and worse prognosis.
e) Any two: sinus bradycardia and AV block; right ventricular infarction with hypotension; papillary muscle dysfunction/rupture with mitral regurgitation."""),
    ("""A 28-year-old female presents with fatigue, palpitations and exertional dyspnoea. Echocardiography shows thickened mitral valve leaflets with restricted opening, diastolic doming and moderate mitral stenosis.
a) Explain the pathophysiology of mitral stenosis in RHD. (2 marks)
b) Name two ECG findings associated with mitral stenosis. (2 marks)
c) Describe one Doppler measurement used to assess mitral valve area. (2 marks)
d) What medical therapy is indicated for symptomatic relief? (2 marks)
e) Mention one interventional/surgical option for severe MS. (2 marks)""",
     [("a) Rheumatic inflammation → commissural fusion, leaflet thickening, chordal shortening → narrowed orifice, raised LA pressure", 2), ("b) P mitrale, atrial fibrillation, right axis deviation/RVH", 2), ("c) Pressure half-time (MVA = 220/PHT) or mean gradient / continuity", 2), ("d) Beta-blocker or rate control, diuretics, anticoagulation if AF; penicillin prophylaxis", 2), ("e) Percutaneous balloon mitral valvotomy, or surgical commissurotomy/valve replacement", 2)],
     """a) After rheumatic fever, repeated inflammation causes fusion of the commissures, thickening and calcification of the leaflets and shortening of the chordae, narrowing the mitral orifice. Left atrial pressure rises, the LA enlarges, pulmonary venous congestion causes dyspnoea and later pulmonary hypertension; tachycardia (shorter diastole) worsens symptoms.
b) P mitrale (left atrial enlargement) and atrial fibrillation (also right axis deviation, RV hypertrophy).
c) Pressure half-time: MVA (cm²) = 220/PHT (ms). (Alternatively the continuity equation or mean transmitral gradient.)
d) Heart-rate control with beta-blockers (or calcium-channel blockers/digoxin in AF), diuretics for congestion, anticoagulation if AF or LA thrombus, and secondary penicillin prophylaxis.
e) Percutaneous balloon mitral valvotomy (if suitable anatomy), otherwise surgical commissurotomy or mitral valve replacement."""),
    ("""A 60-year-old male collapses in the cath lab recovery room. He is unresponsive and pulseless. ECG monitor shows ventricular fibrillation (VF). CPR is started immediately.
a) Identify the initial steps of ACLS in this patient. (2 marks)
b) What is the first-line defibrillation protocol for VF? (2 marks)
c) Name two medications used in ACLS for refractory VF/pulseless VT. (2 marks)
d) Explain post-resuscitation care once ROSC (return of spontaneous circulation) is achieved. (2 marks)
e) List two reversible causes ("Hs and Ts") of cardiac arrest. (2 marks)""",
     [("a) Call for help/code, high-quality CPR 30:2, attach defibrillator, airway and oxygen, IV access", 2), ("b) Immediate unsynchronised shock (biphasic 120-200 J), resume CPR 2 min, rhythm check, repeat", 2), ("c) Adrenaline (epinephrine) 1 mg every 3-5 min; amiodarone 300 mg then 150 mg (or lidocaine)", 2), ("d) Airway/ventilation, haemodynamic support, 12-lead ECG and coronary angiography, targeted temperature, glucose, monitoring in ICU", 2), ("e) Any two: hypoxia, hypovolaemia, hypo/hyperkalaemia, hypothermia, H⁺; tension pneumothorax, tamponade, toxins, thrombosis", 2)],
     """a) Call the arrest team, start high-quality CPR (30:2, minimal interruptions), attach the defibrillator/monitor, give oxygen and secure the airway, establish IV/IO access.
b) Give an immediate unsynchronised shock (biphasic 120-200 J, or maximum monophasic 360 J), resume CPR for 2 minutes, then check rhythm and shock again if VF persists.
c) Adrenaline (epinephrine) 1 mg IV every 3-5 minutes; amiodarone 300 mg IV after the third shock, then 150 mg (lidocaine as alternative).
d) Optimise airway and ventilation (normal oxygen and CO₂), keep blood pressure up (fluids/vasopressors), 12-lead ECG and urgent coronary angiography if a cardiac cause is suspected, targeted temperature management, control glucose and seizures, ICU monitoring.
e) Any two: hypoxia, hypovolaemia, hypo-/hyperkalaemia, hypothermia, hydrogen ions (acidosis); tension pneumothorax, tamponade, toxins, thrombosis (coronary or pulmonary)."""),
]
for i, (s, kp, mod) in enumerate(CASES):
    Q.append(dict(key=f"B{i + 1}", real=True, type="long_answer", marks=10, topic=T, stem=f"Section B, case {i + 1}. " + s, key_points=kp, model=mod))
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions (13 questions)", "type": "short_answer", "count": 1, "marks_each": 20, "answer_any": None},
    {"title": "Section B: Clinical cases (all five compulsory)", "type": "long_answer", "count": 5, "marks_each": 10, "answer_any": None},
]
