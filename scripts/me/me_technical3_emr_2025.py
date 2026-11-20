"""ME Technical Paper III (Subject Specialisation Paper), Emergency Medical Response, BCSE 2025 - real paper (PDF sent by the founder).
Pattern (own): Section A Part I 30 MCQ, Part II 4 short answers x 5; Section B three compulsory questions (20 + 20 + 10).
150 min + 15 min reading. ECG for MCQ 24 in public/papers/me/tech3-emr-2025-ecg.png.
Left out: MCQ 2 (amiodarone vs adrenaline after the third shock depends on the guideline used), 13 (cord-clamping timing
wording ambiguous); two new MCQs keep Part I at 30.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Emergency Medical Response): BCSE 2025, batch 1"
GROUP_TAG = "emr2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "emergency-medical-response"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Emergency Medical Response", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Emergency Medical Response"

MCQ = r"""[
{
"n": 1,
"stem": "Which intervention is most appropriate for the treatment of asystole?",
"opts": [
"Transcutaneous pacing",
"Defibrillation",
"Epinephrine",
"Atropine"
]
},
{
"n": 2,
"stem": "You arrive on scene to find CPR in progress. Nursing staff reports the patient was recovering from Pulmonary Embolism and suddenly collapsed. Three shocks have been delivered, and an IV has been initiated. What do you administer now?",
"opts": [
"Amiodarone 150 mg",
"Amiodarone 300 mg",
"Epinephrine 1 mg",
"Atropine 0.5 mg"
]
},
{
"n": 3,
"stem": "Which of the following statement regarding Pulseless Electrical Activity (PEA) is TRUE.",
"opts": [
"Amiodarone is the drug of choice in PEA.",
"Cardiac compression is only applied if the ventricular rate is less than 50 beats per minute.",
"Bicarbonate should not be administered in PEA.",
"Reversible causes of PEA includes hypovolaemia, hypoxia and acute coronary syndrome."
]
},
{
"n": 4,
"stem": "The most serious form of heat-related emergency is:",
"opts": [
"heat cramps.",
"heat exhaustion.",
"heat stroke.",
"hyperthermia."
]
},
{
"n": 5,
"stem": "What is the first step in using AED on an unresponsive patient?",
"opts": [
"Placing the pads on the patient’s chest.",
"Analyzing the heart rhythm.",
"Turning on the AED.",
"Delivering shock to the patient."
]
},
{
"n": 6,
"stem": "You and your friends are enjoying a nice lunch at the local restaurant when one of your friends begins to cough forcefully. Thinking that he is just playing around, you jokingly ask if he is choking, to which he frantically shakes his head yes and makes the universal choking sign. What type of obstruction does this patient have?",
"opts": [
"Mild.",
"Moderate.",
"Severe",
"None of the above."
]
},
{
"n": 7,
"stem": "If choking progresses to a complete airway obstruction and your patient becomes unresponsive, you should do all of the following EXCEPT:",
"opts": [
"Open the airway.",
"Provide artificial ventilations.",
"Perform chest compressions.",
"Perform back blows."
]
},
{
"n": 8,
"stem": "Which of the following components are not included in the primary assessment?",
"opts": [
"Form a general impression.",
"Assess the level of consciousness.",
"Investigate chief complaints.",
"Determine the priority of patient care and transport."
]
},
{
"n": 9,
"stem": "How does pneumothorax cause shortness of breath?",
"opts": [
"By compressing one or both lungs.",
"By obstructing the airway.",
"By causing damage to the alveoli.",
"By causing the lungs to fill with fluid."
]
},
{
"n": 10,
"stem": "You are dispatched to a nightclub for a man who cut his arm. On arrival, you find a man with an approximate 2 inches linear laceration to the medial aspect of his right forearm. You note the blood to be dark and flowing steadily. What type of bleeding is occurring?",
"opts": [
"Arterial.",
"Venous.",
"Capillary.",
"None of the above."
]
},
{
"n": 11,
"stem": "How many inches wide should the width of an improvised tourniquet be?",
"opts": [
"1",
"2",
"3",
"4"
]
},
{
"n": 12,
"stem": "When to start chest compression in a newborn?",
"opts": [
"Heart rate <80 bpm",
"Heart rate <70 bpm",
"Heart rate <60 bpm",
"Heart rate < 50 bpm"
]
},
{
"n": 13,
"stem": "You are conducting a normal delivery of a neonate inside an ambulance. Following are activities that must be done within one minute EXCEPT.",
"opts": [
"Pulsate the umbilical cord, clamp, and cut.",
"If the baby is not breathing, start PPV.",
"Administer oxytocin injection.",
"Dry the baby thoroughly."
]
},
{
"n": 14,
"stem": "You have delivered a pink baby boy, but his hands and legs are blue. His heart rate is approximately 90 beats per minute with slow and irregular respiration. He has a weak cry when stimulated and kicks while trying to hold his legs. His APGAR score is:",
"opts": [
"6",
"7",
"8",
"9"
]
},
{
"n": 15,
"stem": "All the NINE phases of an ambulance call are equally important. Cleaning, disinfection, high-level disinfection, sterilization, re-fill and re-stock of the ambulance shall be done during:",
"opts": [
"The dispatch phase.",
"The post-run phase.",
"The preparation phase.",
"The delivery phase."
]
},
{
"n": 16,
"stem": "You are the first medical personnel to arrive at a scene of mass casualty incident. Which of the following best describes your immediate roles and responsibilities?",
"opts": [
"Be an on-scene leader and assume the role of triaging casualties.",
"Ensure the safety of yourself, your partner, the patient, and bystanders.",
"Uphold medical and legal standards.",
"All of the above."
]
},
{
"n": 17,
"stem": "You respond to a 112 call of a road traffic accident with two casualties, you can visibly see both of them bleeding as you approach. What should be your first concern?",
"opts": [
"Mechanism of injury.",
"Control the bleeding.",
"Scene safety.",
"Extrication."
]
},
{
"n": 18,
"stem": "Approximately how many ventilations are given to an adult patient with an advanced airway in situ?",
"opts": [
"12-20",
"14-20",
"30-60",
"8-10"
]
},
{
"n": 19,
"stem": "The correct dose of Aspirin to administer to a 65 years old patient with chest pain or suspected MI is?",
"opts": [
"75 mg",
"300 mg",
"600 mg",
"150 mg"
]
},
{
"n": 20,
"stem": "Capillary refill time of a patient with good circulation and perfusion should be?",
"opts": [
"<5 seconds",
"<3 seconds",
"<1 second",
"<2 seconds"
]
},
{
"n": 21,
"stem": "Using the ‘rule of nine’ in calculating the burn surface area, what percentage is an adult patient’s back?",
"opts": [
"13.5 percent",
"18 percent",
"9 percent",
"5 percent"
]
},
{
"n": 22,
"stem": "You’re dispatched to a 55 years old man complaining of chest pain and shortness of breath. On your arrival, you find an obese man seated in the tripod position at the kitchen table. He states he has these symptoms for a few days and it is getting worse progressively. Your assessment of the patient reveals frothy pulmonary edema as well as rales bilaterally. If available, you should consider the use of:",
"opts": [
"Oropharyngeal airway",
"Nasopharyngeal airway",
"eFAST scan",
"Continuous positive airway pressure"
]
},
{
"n": 23,
"stem": "Following statements are about pelvic binder. Which of the following is not a true statement.",
"opts": [
"Pelvic binders are used to splint bony pelvis to reduce hemorrhage.",
"Pelvic binders should be light, made of soft material and easily applied by one person.",
"Pelvic binder is the definitive intervention for crushed injury of pelvis.",
"Pelvic binder should not occlude access to abdomen, perineum, anus and groin for examination."
]
},
{
"n": 24,
"stem": "Identify the above ECG rhythm:",
"opts": [
"Ventricular tachycardia (monomorphic).",
"Torsade.",
"Ventricular fibrillation.",
"Pulseless electrical activity."
]
},
{
"n": 25,
"stem": "Common causes of shock in pediatric and infant population:",
"opts": [
"Hypovolemia and sepsis.",
"Acute coronary syndrome.",
"Cerebrovascular accidents.",
"Anaphylaxis."
]
},
{
"n": 26,
"stem": "Single most significant factor that contributes to suicide is depression. Which of the following is not a risk factor for suicide.",
"opts": [
"Ideation or defined lethal plan that has been verbalized and/or written.",
"Anxiety, agitation, unable to sleep, or sleeping all the time.",
"Previous suicide attempt.",
"Migraine headache on medications."
]
},
{
"n": 27,
"stem": "A young teenager has taken several tablets of morphine which was prescribed for his grandfather for his stomach cancer. On your arrival, he was found unconscious with pin point pupils. Given the history, what drug you would consider to administer as soon as possible?",
"opts": [
"0.4 mg Naloxone.",
"1 mg adrenaline",
"0.5 mg atropine",
"1 mg Naloxone"
]
},
{
"n": 28,
"stem": "What is the most appropriate first aid for a chemical burn injury?",
"opts": [
"Apply an antibiotic ointment.",
"Cover the affected area with ice.",
"Flush with a large amount of water.",
"Apply a tight bandage to the area."
]
},
{
"n": 29,
"stem": "Which of the following is not a symptom of pre-eclampsia.",
"opts": [
"Seizure.",
"Anxiety.",
"Nausea and Vomiting",
"Headache."
]
},
{
"n": 30,
"stem": "Cardiac output is measured by:",
"opts": [
"Heart rate X Respiratory rate.",
"Blood pressure X Respiratory rate.",
"Stroke volume X Respiratory rate.",
"Stroke volume X Heart rate."
]
}
]"""

KEY = {
    1: ("c", "Asystole is non-shockable: adrenaline (epinephrine) 1 mg and CPR."), 3: ("d", "Reversible causes of PEA include hypovolaemia, hypoxia and coronary thrombosis (Hs and Ts)."),
    4: ("c", "Heat stroke is life-threatening."), 5: ("c", "First switch on the AED and follow prompts."), 6: ("a", "A forceful cough means mild (partial) obstruction."),
    7: ("d", "Once unresponsive: CPR (compressions, open airway, ventilations), not back blows."), 8: ("c", "Investigating the chief complaint belongs to the secondary assessment/history."),
    9: ("a", "Air in the pleural space collapses (compresses) the lung."), 10: ("b", "Dark, steadily flowing blood is venous."), 11: ("b", "An improvised tourniquet should be at least 2 inches wide."),
    12: ("c", "Start neonatal compressions if HR < 60/min despite effective ventilation."),
    14: ("a", "Appearance 1, Pulse 1 (<100), Grimace 1, Activity 2, Respiration 1 = 6."), 15: ("b", "Cleaning and restocking are done in the post-run phase."),
    16: ("d", "All of these are first-arriver responsibilities."), 17: ("c", "Scene safety first."), 18: ("d", "With an advanced airway: about 10 breaths/min (one every 6 s)."),
    19: ("b", "Aspirin 300 mg chewed for suspected ACS."), 20: ("d", "Normal capillary refill < 2 seconds."), 21: ("b", "Back = 18% in the adult rule of nines."),
    22: ("d", "CPAP for acute pulmonary oedema."), 23: ("c", "A pelvic binder is temporary, not the definitive treatment."), 24: ("c", "Chaotic irregular waveform with no QRS: ventricular fibrillation."),
    25: ("a", "Hypovolaemia (dehydration) and sepsis are commonest in children."), 26: ("d", "Migraine on medication is not a recognised suicide risk factor."),
    27: ("a", "Opioid overdose: naloxone 0.4 mg, repeat as needed."), 28: ("c", "Flush chemical burns with plenty of water."), 29: ("b", "Anxiety is not a typical pre-eclampsia symptom."),
    30: ("d", "Cardiac output = stroke volume × heart rate."),
}
FIX = {24: {"stem": "Identify the ECG rhythm shown in the figure:", "image": "/papers/me/tech3-emr-2025-ecg.png"}}
T = TOPIC
Q = mcqs(MCQ, KEY, T, FIX) + [
    new_mcq(1, T, "The recommended chest compression depth for an adult in CPR is", ["2-3 cm", "3-4 cm", "5-6 cm", "7-8 cm"], "c", "At least 5 cm but not more than 6 cm."),
    new_mcq(2, T, "The recommended rate of chest compressions in CPR is", ["60-80 per minute", "80-100 per minute", "100-120 per minute", "140-160 per minute"], "c", "100-120 compressions per minute."),
    saq(1, T, """a) What assessment can be done using the OPQRST mnemonic? (1 mark)
b) Elaborate each letter of OPQRST. (4 marks)""",
        [("a) Assessment of pain (chief complaint), e.g. chest pain", 1), ("b) Onset, Provocation/Palliation, Quality, Region/Radiation, Severity, Time - each explained", 4)],
        """a) OPQRST is used to assess pain or the chief complaint (e.g. chest or abdominal pain) during the history.
b) O - Onset: when and how it started (sudden or gradual, what were you doing). P - Provocation/Palliation: what makes it worse or better. Q - Quality: what it feels like (sharp, dull, crushing, burning). R - Region/Radiation: where it is and whether it spreads (e.g. to arm or jaw). S - Severity: pain score 0-10. T - Time: how long it has lasted, constant or comes and goes, changes over time."""),
    saq(2, T, """a) What is the mnemonic DCAP-BTLS used to assess? (1 mark)
b) Elaborate on what DCAP-BTLS stands for. (4 marks)""",
        [("a) Used in physical (trauma) assessment to look and feel for injuries", 1), ("b) Deformities, Contusions, Abrasions, Punctures/Penetrations, Burns, Tenderness, Lacerations, Swelling", 4)],
        """a) DCAP-BTLS is used during the physical (rapid trauma/secondary) assessment to inspect and palpate each body region for injuries.
b) D - Deformities, C - Contusions, A - Abrasions, P - Punctures/penetrations, B - Burns, T - Tenderness, L - Lacerations, S - Swelling."""),
    saq(3, T, """You are en route to a snake bite case. The road is blocked by a fallen rock and it will take at least 15 minutes to clear the debris.
a) What first aid will you advise via phone call? (4 marks)
b) Name at least two venomous snakes found in Bhutan. (1 mark)""",
        [("a) Keep calm and still, immobilise limb at heart level, remove rings/tight items, pressure bandage/immobilisation, no cutting/sucking/tourniquet/ice, note time and snake features, nothing by mouth/no traditional remedies, monitor breathing, prepare for transport", 4), ("b) Two of: king cobra, monocled/ Indian cobra, banded krait, common krait, pit vipers (e.g. green pit viper), Russell's viper", 1)],
        """a) Reassure the patient and keep them calm and still (movement spreads venom); lay them down; remove rings, watches and tight clothing near the bite; immobilise the bitten limb with a splint, keeping it at about heart level (pressure-immobilisation bandage for neurotoxic bites such as kraits/cobras); do not cut, suck, apply a tight tourniquet, ice or herbal remedies; do not give alcohol or food; note the time of the bite and a description or photo of the snake (do not try to catch it); watch breathing and consciousness and start CPR if needed; prepare to move to the ambulance/hospital for antivenom.
b) Venomous snakes in Bhutan include the king cobra, monocled cobra, banded krait, greater black krait and pit vipers (e.g. green pit viper)."""),
    saq(4, T, """a) What heart rhythms does an AED defibrillate? (2 marks)
b) How should you position your hands when performing chest compressions on a 4-year-old child? (3 marks)""",
        [("a) Ventricular fibrillation and pulseless ventricular tachycardia (shockable rhythms)", 2), ("b) Heel of one hand (or two hands for a large child) on the lower half of the sternum, centre of chest, arm straight, compress 1/3 depth (~5 cm), avoid ribs/xiphoid", 3)],
        """a) An AED shocks only ventricular fibrillation and pulseless ventricular tachycardia; it does not shock asystole or PEA.
b) For a 4-year-old: kneel beside the child, place the heel of one hand (or both hands for a larger child) on the lower half of the breastbone in the centre of the chest, avoiding the xiphoid and ribs; keep the arm straight with shoulders over the hand; compress at least one-third of the chest depth (about 5 cm) at 100-120 per minute, allowing full recoil."""),
]
B = [
    ("""Question 1: Your ambulance is dispatched to a village home for a pregnant woman reporting severe abdominal pain. On arrival, you find a 17-year-old (56 kg) woman lying in a fetal position on the floor. She states that she is pregnant and was cutting grass when she felt a tearing sensation, followed by severe abdominal pain. She presents as cool, pale and clammy.
a) What is shock and how does it relate to perfusion? (7 marks)
b) What factors does perfusion depend on? (5 marks)
c) How much IV fluid should this patient receive? Does this patient require a second IV line, and why? (5 marks)
d) How should the patient be positioned on the stretcher for transport? (3 marks)""", 20, "Clinical cases 20",
     [("a) Shock: inadequate tissue perfusion/oxygen delivery to meet needs → cellular hypoxia, organ failure; types; signs here (hypovolaemic from ruptured ectopic/abruption)", 7), ("b) Perfusion depends on heart (pump), blood volume, vessels (tone/container), plus oxygenation/blood pressure", 5),
      ("c) Permissive fluid: 250 ml boluses (or 20 ml/kg ≈ 1 L crystalloid) titrated to radial pulse/SBP ~90; yes, second large-bore line for rapid fluids/blood", 5), ("d) Left lateral tilt (left side) / supine with uterus displaced to left, legs raised; avoid supine hypotension", 3)],
     """a) Shock (hypoperfusion) is a state in which the circulatory system fails to deliver enough oxygenated blood to the tissues to meet their needs, leading to cellular hypoxia, anaerobic metabolism, organ damage and death if uncorrected. Perfusion is the circulation of blood through the tissues; shock is inadequate perfusion. This patient - tearing pain, pale, cool, clammy - likely has hypovolaemic (haemorrhagic) shock, e.g. ruptured ectopic pregnancy or placental abruption/uterine rupture.
b) Perfusion depends on the 'perfusion triangle': a working heart (pump - rate and contractility), adequate blood volume (fluid), and intact, appropriately toned blood vessels (container); also adequate oxygenation and blood pressure to drive flow.
c) Give oxygen and start IV crystalloid with large-bore cannulae: boluses of about 250-500 ml (up to about 20 ml/kg ≈ 1 litre initially), titrated to a palpable radial pulse/systolic BP about 90 mmHg (permissive hypotension) while rushing to hospital; avoid over-infusion. Yes - a second large-bore line is needed because she is in haemorrhagic shock and may need rapid fluids and blood transfusion; if one line fails, access is maintained.
d) Transport on her left side (left lateral tilt about 15-30°, or manual displacement of the uterus to the left) to prevent supine hypotensive syndrome from the uterus compressing the vena cava; keep her warm, legs slightly raised if possible, and monitor continuously."""),
    ("""Question 2: Your ambulance is dispatched to a road traffic accident 15 km from your hospital. On arrival you find multiple cars involved. You think it is a mass casualty incident.
a) What scene size-up considerations should you bear in mind as you approach the scene? (5 marks)
b) How do you notify your hospital's incident commander or head of hospital about the incident? (7 marks)
c) What roles do you assume before the arrival of backup teams? Elaborate the rationale behind the role you assumed. (5 marks)
d) What triage do you use in mass casualty incidents for adult and paediatric populations? (3 marks)""", 20, "Clinical cases 20",
     [("a) Scene safety (traffic, fire, fuel, electricity), standard precautions/PPE, number of patients, mechanism of injury, need for additional resources (police, fire, extra ambulances)", 5), ("b) Structured report e.g. METHANE: Major incident declared, Exact location, Type, Hazards, Access, Number/severity of casualties, Emergency services present/needed - via radio/phone to control", 7),
      ("c) First crew: incident commander and triage officer until relieved - safety, triage, communication, resource requests; rationale: do the most good for most, avoid getting tied to one patient", 5), ("d) START triage for adults, JumpSTART for children (colour codes red/yellow/green/black)", 3)],
     """a) Scene size-up: park safely upwind and away from hazards; assess scene safety (traffic, fuel leaks, fire, unstable vehicles, electricity, weather/landslides); use PPE and standard precautions; determine the number of vehicles and casualties; identify the mechanism of injury; decide on the need for more resources (additional ambulances, police, fire and rescue, extrication) and request them early.
b) Inform the hospital/emergency control by radio or phone using a structured report such as METHANE: M - declare a Major incident/MCI; E - Exact location; T - Type of incident (multi-vehicle RTA); H - Hazards present/potential; A - Access and egress routes; N - Number and severity of casualties (estimated by triage category); E - Emergency services present and needed. Give updates as the situation changes so the hospital can activate its mass casualty/disaster plan.
c) As the first crew, assume the roles of incident commander and triage officer until senior help arrives: ensure safety, set up command, perform rapid triage, direct bystanders, establish treatment and loading areas, and keep communicating. Rationale: in an MCI the aim is to do the greatest good for the greatest number, so the first crew must organise and triage rather than spend all its time treating one patient.
d) START (Simple Triage and Rapid Treatment) for adults and JumpSTART for children, with colour categories: red (immediate), yellow (delayed), green (minor/walking wounded), black (dead/expectant)."""),
    ("""Question 3: At 01:30 am your ambulance is dispatched to an unresponsive elderly man who was circumambulating the memorial chorten on New Year's Eve. A policeman says the patient was unresponsive and they believe he was trying to sleep under a tree in the snow. The patient has a weak, irregular pulse and no shivering.
a) What are the five methods of heat loss? (5 marks)
b) What stage of hypothermia does this patient present in? (1 mark)
c) What are the methods of rewarming hypothermic patients? (2 marks)
d) How can warmed supplemental oxygen be provided to a hypothermic patient? (2 marks)""", 10, "Clinical case 10",
     [("a) Radiation, conduction, convection, evaporation, respiration", 5), ("b) Severe hypothermia (no shivering, unresponsive, irregular pulse; core < 28-30 °C)", 1), ("c) Passive (remove wet clothes, blankets, warm environment) and active external (heat packs to trunk, warm air) / active internal (warm IV fluids) in hospital; handle gently", 2), ("d) Humidified oxygen warmed to about 40-42 °C via heated humidifier / warmed oxygen bag/ hot packs around tubing", 2)],
     """a) Radiation (heat from the body to colder surroundings), conduction (direct contact with cold objects such as snow or wet ground), convection (moving air or water carrying heat away - wind), evaporation (sweat or wet clothes), and respiration (warm air breathed out).
b) Severe hypothermia - unresponsive, no shivering and a weak, irregular pulse (core temperature probably below about 28-30 °C).
c) Handle very gently (risk of VF); remove wet clothing, insulate with blankets, protect from wind and move to a warm ambulance (passive rewarming); active external rewarming with heat packs or warm-air blankets to the trunk, armpits and groin (not limbs first); in hospital, active internal rewarming (warm IV fluids, warmed humidified oxygen, extracorporeal methods).
d) Give humidified oxygen warmed to about 40-42 °C using a heated humidifier; if not available, warm the oxygen tubing/bag with heat packs or keep the cylinder in the heated ambulance."""),
]
for i, (s, mk, top, kp, m) in enumerate(B):
    Q.append(dict(key=f"B{i + 1}", real=True, type="long_answer", marks=mk, topic=top, stem=s, key_points=kp, model=m))
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions", "type": "short_answer", "count": 4, "marks_each": 5, "answer_any": None},
    {"title": "Section B: Questions 1 and 2 (compulsory)", "type": "long_answer", "count": 2, "marks_each": 20, "answer_any": None, "topic": "clinical-cases-20"},
    {"title": "Section B: Question 3 (compulsory)", "type": "long_answer", "count": 1, "marks_each": 10, "answer_any": None, "topic": "clinical-case-10"},
]
