"""ME Technical Paper III (Subject Specialisation Paper), Physiotherapy, BCSE 2025 - real paper (PDF sent by the founder).
Standard pattern. MCQ 7 (pressure relief: weight shifts and push-ups both taught; timing varies) is replaced. Case I Q5
does not name the goal categories: the model answer uses impairment, activity and participation. Case II Q4 says
'Mr. Matthews' (a slip in the paper); it means Mr Dorji.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1"
GROUP_TAG = "physio2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "physiotherapy"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Physiotherapy"

MCQ = r"""[
{
"n": 1,
"stem": "A 55-year-old patient presents with insidious onset of shoulder pain that is worse at night and difficulty lifting their arm. The most likely initial impairment to assess is:",
"opts": [
"Scapulothoracic rhythm",
"Rotator cuff muscle strength",
"Cervical active range of motion",
"Glenohumeral joint accessory mobility"
]
},
{
"n": 2,
"stem": "The primary muscle responsible for inspiration is:",
"opts": [
"Diaphragm",
"External oblique",
"Internal oblique",
"Rectus abdominis"
]
},
{
"n": 3,
"stem": "The center of gravity in a normal adult standing upright is located at:",
"opts": [
"At the umbilicus",
"Level of S1 vertebra",
"At the xiphoid process",
"Just anterior to S2 vertebra"
]
},
{
"n": 4,
"stem": "In stroke rehabilitation, the Brunnstrom approach describes recovery in:",
"opts": [
"3 stages",
"5 stages",
"6 stages",
"7 stages"
]
},
{
"n": 5,
"stem": "A common physiotherapy intervention for post-operative total knee replacement in the first week is",
"opts": [
"Plyometric training",
"Jogging and stair climbing",
"High-resistance strength training",
"Cryotherapy and passive ROM exercises"
]
},
{
"n": 6,
"stem": "During a squat assessment, you observe a patient's knees moving into significant valgus (knock- knee). Which of the following muscles is most likely weak and contributing to this movement fault?",
"opts": [
"Tensor Fascia Latae (TFL)",
"Gluteus Medius",
"Adductor Longus",
"Biceps Femoris"
]
},
{
"n": 7,
"stem": "A patient with a complete T6 spinal cord injury is learning wheelchair mobility. To prevent a pressure injury, what is the most effective technique you should teach them?",
"opts": [
"Shifting weight side-to-side every 15 minutes",
"Performing a full wheelchair push-up every 30 minutes",
"Leaning forward for 2 minutes every hour",
"Using a specialized cushion without the need to reposition"
]
},
{
"n": 8,
"stem": "The primary goal of pursed-lip breathing in a patient with severe COPD is to:",
"opts": [
"Strengthen the inspiratory muscles",
"Improve oxygenation by increasing FiO2",
"Prevent early airway closure and reduce air trapping",
"Facilitate a more effective cough"
]
},
{
"n": 9,
"stem": "A 22-year-old basketball player lands awkwardly after a jump. They report hearing a \"pop,\" immediate swelling, and a feeling of the knee \"giving way.\" The most likely injured structure is:",
"opts": [
"Medial Meniscus",
"Anterior Cruciate Ligament (ACL)",
"Patellar Tendon",
"Lateral Collateral Ligament (LCL)"
]
},
{
"n": 10,
"stem": "During a special test for shoulder impingement, the therapist passively flexes the patient's shoulder to 90° and then forcibly internally rotates the arm. This maneuver is known as:",
"opts": [
"Apprehension Test",
"Hawkins-Kennedy Test",
"Neer's Test",
"Empty Can Test"
]
},
{
"n": 11,
"stem": "A patient presents with loss of pain and temperature sensation on the left side of the body and loss of proprioception on the right side below the level of a cervical lesion. This presentation is most characteristic of:",
"opts": [
"Brown-Séquard Syndrome",
"Anterior Cord Syndrome",
"Central Cord Syndrome",
"Cauda Equina Syndrome"
]
},
{
"n": 12,
"stem": "For a patient in the early stages of Parkinson's disease, which of the following exercise interventions is MOST beneficial for improving gait amplitude and overcoming bradykinesia?",
"opts": [
"Repetitive, rhythmic rocking in sitting",
"High-intensity resistance training for the lower limbs",
"Use of external cues, such as walking to the beat of a metronome or over floor markers",
"Passive stretching of all major muscle groups"
]
},
{
"n": 13,
"stem": "On auscultation of a post-operative patient's lungs, you hear a continuous low-pitched, snoring sound over the trachea and main bronchi. This is most indicative of:",
"opts": [
"Wheeze",
"Stridor",
"Rhonchi",
"Fine Crackles"
]
},
{
"n": 14,
"stem": "The Active Cycle of Breathing Techniques (ACBT) is a cornerstone of airway clearance. What is the correct sequence of its components?",
"opts": [
"Breathing Control → Thoracic Expansion Exercises → Forced Expiration Technique",
"Thoracic Expansion Exercises → Breathing Control → Forced Expiration Technique",
"Forced Expiration Technique → Breathing Control → Thoracic Expansion Exercises",
"Thoracic Expansion Exercises → Forced Expiration Technique → Breathing Control"
]
},
{
"n": 15,
"stem": "According to the ICF (International Classification of Functioning, Disability and Health) model, \"the inability to climb stairs\" is classified as a(n):",
"opts": [
"Impairment",
"Activity Limitation",
"Participation Restriction",
"Health Condition"
]
},
{
"n": 16,
"stem": "A randomized controlled trial (RCT) shows that a new treatment is statistically significantly better than the current standard (p=0.04). To apply this to your patient, what is the MOST important next step?",
"opts": [
"Immediately adopt the new treatment for all relevant patients.",
"Dismiss the findings as the p-value is not less than 0.01.",
"Evaluate if your patient is similar to those in the study and consider the treatment alongside clinical expertise and their values.",
"Wait for a systematic review to be published before considering the treatment."
]
},
{
"n": 17,
"stem": "A 2-year-old child presents with hypertonia in a \"scissoring\" posture, persistent primitive reflexes, and delayed motor milestones. This clinical picture is MOST suggestive of:",
"opts": [
"Duchenne Muscular Dystrophy",
"Spastic Diplegic Cerebral Palsy",
"Down Syndrome",
"Brachial Plexus Palsy"
]
},
{
"n": 18,
"stem": "What is the primary respiratory physiotherapy goal for an infant with cystic fibrosis?",
"opts": [
"To strengthen inspiratory muscles",
"To mobilize and clear thickened pulmonary secretions",
"To provide postural drainage only during pulmonary exacerbations",
"To increase tidal volume through incentive spirometry"
]
},
{
"n": 19,
"stem": "Therapeutic handling in pediatric physiotherapy for a child with cerebral palsy should focus on:",
"opts": [
"Letting the child move freely to encourage independence",
"Using firm handling on distal parts to guide movement",
"Inhibiting abnormal patterns and facilitating normal alignment and movement sequences",
"Focusing solely on strengthening within the child's preferred movement patterns"
]
},
{
"n": 20,
"stem": "When treating a child with Osteogenesis Imperfecta (OI), the physiotherapist's primary precaution is to:",
"opts": [
"Avoid all weight-bearing activities",
"Prevent fractures by handling the child gently and avoiding excessive force during stretching or exercises",
"Focus intensely on high-impact activities to strengthen bones",
"Prioritize cardiovascular fitness over all other goals"
]
},
{
"n": 21,
"stem": "Multiple sclerosis (MS) primarily involves:",
"opts": [
"Demyelination of central nervous system neurons",
"Destruction of peripheral nerves",
"Muscle degeneration",
"Neuromuscular junction defect"
]
},
{
"n": 22,
"stem": "In motor relearning, feedback is most effective when:",
"opts": [
"Delayed and generalized",
"Immediate and specific",
"Absent",
"Random and inconsistent"
]
},
{
"n": 23,
"stem": "Which syndrome often results from a hyperextension injury in an elderly individual with cervical stenosis and typically presents with greater weakness in the upper limbs than the lower limbs?",
"opts": [
"Cauda Equina Syndrome",
"Anterior Cord Syndrome",
"Central Cord Syndrome",
"Posterior Cord Syndrome"
]
},
{
"n": 24,
"stem": "Neurogenic shock, which can occur immediately after a cervical or high thoracic SCI, is characterized by:",
"opts": [
"Hypertension and tachycardia",
"Hypertension and bradycardia",
"Hypotension and bradycardia",
"Hypotension and tachycardia"
]
},
{
"n": 25,
"stem": "A patient presents with pain and paresthesia in the lateral forearm and thumb, weakness in elbow flexion and forearm supination. The most likely involved cervical nerve root is:",
"opts": [
"C4",
"C5",
"C6",
"C7"
]
},
{
"n": 26,
"stem": "A patient with a complete T10 spinal cord injury will most likely have:",
"opts": [
"Full upper extremity strength and partial trunk control",
"Full upper extremity strength, no trunk or lower extremity control",
"Impaired hand function and impaired respiratory function",
"Flaccid paralysis of all four limbs"
]
},
{
"n": 27,
"stem": "Following a median sternotomy for Coronary Artery Bypass Graft (CABG) surgery, a patient should be advised to:",
"opts": [
"Avoid lifting anything heavier than 5-10 lbs for 6-8 weeks",
"Begin aggressive overhead exercises immediately",
"Focus only on lower limb exercises",
"Avoid deep breathing exercises to prevent pain"
]
},
{
"n": 28,
"stem": "The primary purpose of proprioceptive neuromuscular facilitation (PNF) diagonal patterns is to:",
"opts": [
"Isolate a single muscle group",
"Mimic natural, multi-joint functional movement",
"Provide a passive stretch only",
"Treat respiratory conditions"
]
},
{
"n": 29,
"stem": "The therapeutic ultrasound frequency of 3 MHz is typically used for:",
"opts": [
"Deep tissue heating (3-5 cm depth)",
"Superficial tissue heating (1-2 cm depth)",
"Phonophoresis of corticosteroids",
"Fracture healing"
]
},
{
"n": 30,
"stem": "The presence of coarse crackles on auscultation is most commonly associated with:",
"opts": [
"Secretions in the large airways",
"A completely collapsed lung (pneumothorax)",
"Bronchospasm (wheezing)",
"Pleural friction rub"
]
}
]"""

KEY = {
    1: ("b", "Night pain and difficulty lifting suggest rotator cuff pathology: assess cuff strength first."), 2: ("a", "The diaphragm is the main muscle of inspiration."),
    3: ("d", "The centre of gravity lies just anterior to S2."), 4: ("c", "Brunnstrom described six stages of motor recovery."),
    5: ("d", "Early after TKR: cryotherapy, passive/active-assisted ROM and early mobility."), 6: ("b", "Weak gluteus medius allows dynamic knee valgus."),
    8: ("c", "Pursed-lip breathing keeps airways open and reduces air trapping."), 9: ("b", "Pop, rapid swelling and giving way suggest an ACL tear."),
    10: ("b", "Shoulder flexed to 90° then internally rotated is the Hawkins-Kennedy test."), 11: ("a", "Contralateral pain/temperature loss with ipsilateral proprioception loss is Brown-Séquard syndrome."),
    12: ("c", "External cues improve step length and help overcome bradykinesia in Parkinson's."), 13: ("c", "Rhonchi are low-pitched, snoring sounds from large airways."),
    14: ("a", "ACBT: breathing control → thoracic expansion exercises → forced expiration technique (with breathing control between)."), 15: ("b", "Inability to climb stairs is an activity limitation."),
    16: ("c", "Evidence-based practice combines research with clinical expertise and patient values."), 17: ("b", "Scissoring, hypertonia and delayed milestones suggest spastic diplegic CP."),
    18: ("b", "Airway clearance of thick secretions is the main goal in CF."), 19: ("c", "Handling inhibits abnormal patterns and facilitates normal movement."),
    20: ("b", "In OI, handle gently and avoid excessive force to prevent fractures."), 21: ("a", "MS is demyelination of the central nervous system."),
    22: ("b", "Early in motor learning, immediate and specific feedback works best."), 23: ("c", "Central cord syndrome: hyperextension in cervical stenosis, arms weaker than legs."),
    24: ("c", "Neurogenic shock causes hypotension and bradycardia (loss of sympathetic tone)."), 25: ("c", "C6: lateral forearm and thumb, elbow flexion and supination."),
    26: ("a", "T10 complete: full upper limbs and partial trunk control; no lower limb function."), 27: ("a", "After sternotomy, avoid lifting more than about 5-10 lb for 6-8 weeks."),
    28: ("b", "PNF diagonals mimic natural multi-joint functional movement."), 29: ("b", "3 MHz ultrasound heats superficial tissues (1-2 cm)."),
    30: ("a", "Coarse crackles indicate secretions in larger airways."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "Which outcome measure is most commonly used to assess functional exercise capacity in a patient with COPD?", ["Berg Balance Scale", "Six-Minute Walk Test", "Modified Ashworth Scale", "Glasgow Coma Scale"], "b",
            "The 6MWT measures functional exercise capacity in chronic respiratory disease."),
    saq(1, T, """A patient with chronic low back pain tells you that a previous therapist said they "have the spine of an 80-year-old" and "must never lift anything heavy again". The patient is now fearful and avoids all physical activity.
a) Identify TWO unprofessional or harmful elements in the previous therapist's communication. (2 marks)
b) Describe THREE key principles of your education and advice to this patient, based on a biopsychosocial approach. (3 marks)""",
        [("a) Two harmful elements: catastrophising/nocebo language ('spine of an 80-year-old'), unjustified absolute restriction ('never lift'), creating fear-avoidance, not evidence-based", 2), ("b) Three principles: reassure (pain ≠ damage, imaging findings normal with age), encourage graded activity and exercise, address fears/beliefs and self-management, shared goals", 3)],
        """a) 1. Threatening, catastrophic language ("spine of an 80-year-old") that is not evidence-based and creates fear (a nocebo effect). 2. An absolute, unjustified restriction ("never lift anything heavy") that encourages fear-avoidance and disability.
b) 1. Reassurance and pain education: back pain is common, the spine is strong, and pain does not equal damage; age-related changes are normal. 2. Stay active: graded exposure to feared activities, including lifting, with a progressive exercise programme. 3. Address beliefs and the psychosocial factors (fear, mood, work), set shared goals and promote self-management, with consistent, positive language."""),
    saq(2, T, """A 70-year-old patient with severe COPD (FEV1 <50% predicted) becomes severely breathless after walking 10 metres.
a) Name the validated outcome measure you would use to assess functional exercise capacity. (1 mark)
b) List TWO breathing techniques you would teach to manage breathlessness and state the purpose of EACH. (4 marks)""",
        [("a) Six-Minute Walk Test (or incremental shuttle walk test)", 1), ("b) Two techniques with purposes: pursed-lip breathing (prevents airway collapse, slows RR), breathing control/diaphragmatic breathing, positions of ease (forward lean), paced breathing/ recovery", 4)],
        """a) The Six-Minute Walk Test (6MWT); the incremental shuttle walk test is an alternative. With severe breathlessness, the 6MWT can be adapted (rests allowed) with SpO2 and Borg monitoring.
b) 1. Pursed-lip breathing - breathing out slowly through pursed lips creates back-pressure that keeps small airways open, reduces air trapping, slows the breathing rate and eases breathlessness. 2. Breathing control in positions of ease (relaxed, low-chest/diaphragmatic breathing while leaning forward with arms supported) - reduces the work of breathing, uses the diaphragm efficiently and helps recovery from breathlessness. (Also accepted: paced/blow-as-you-go breathing during activity.)"""),
    saq(3, T, """A 55-year-old patient with right hemiparesis after a left middle cerebral artery stroke has marked spasticity in the right upper limb, with a flexed elbow, wrist and fingers.
a) Define spasticity. (1 mark)
b) List two non-pharmacological techniques to manage this spasticity. (2 marks)
c) Explain one functional implication of this spasticity pattern on daily activities. (2 marks)""",
        [("a) Velocity-dependent increase in tonic stretch reflexes (muscle tone) with exaggerated tendon jerks, from upper motor neuron lesion (Lance)", 1), ("b) Two techniques: sustained/prolonged stretching, positioning, splinting/serial casting, weight-bearing through limb, task-specific training, electrical stimulation", 2), ("c) One functional implication explained (difficulty reaching, grasping, hygiene of palm, dressing, eating, balance)", 2)],
        """a) Spasticity is a motor disorder from an upper motor neuron lesion, characterised by a velocity-dependent increase in tonic stretch reflexes (muscle tone) with exaggerated tendon jerks (Lance, 1980).
b) Any two: prolonged/sustained stretching of the elbow, wrist and finger flexors; positioning the limb in extension (supported on a pillow); resting hand or wrist splints/serial casting; weight-bearing through the extended arm; functional electrical stimulation of the extensors; task-specific active training.
c) The flexed elbow, wrist and fingers make it hard to open the hand to grasp and release objects and to reach, so tasks like eating, dressing (putting the arm into a sleeve) and washing are difficult; the clenched hand is also hard to keep clean, causing skin problems, and the flexed arm can affect balance and walking."""),
    saq(4, T, """A 25-year-old long-distance runner presents with a 6-week history of insidious anterior knee pain, worse on descending stairs and prolonged sitting.
a) What is the most likely diagnosis? (1 mark)
b) Describe TWO key subjective history questions you would ask to confirm your hypothesis. (2 marks)
c) Outline TWO key components of your initial exercise management plan. (2 marks)""",
        [("a) Patellofemoral pain syndrome", 1), ("b) Two questions: training load changes, aggravating activities (squatting, stairs, running downhill, 'movie sign'), location (peripatellar), swelling/locking/ giving way to exclude others, footwear", 2), ("c) Two components: hip abductor/external rotator strengthening, quadriceps strengthening (closed chain), load management/relative rest, flexibility", 2)],
        """a) Patellofemoral pain syndrome (runner's knee).
b) 1. "Have you recently changed your training - distance, speed, hills or footwear?" (overload). 2. "Where exactly is the pain, and is it worse with squatting, kneeling, stairs or after sitting with knees bent ('movie-goer's sign')?" Also ask about swelling, locking or giving way to rule out meniscal or ligament injury.
c) 1. Strengthening of hip abductors and external rotators (e.g. side-lying hip abduction, clams) and quadriceps (e.g. wall squats, step-downs in a pain-free range). 2. Load management - temporarily reduce running volume and downhill running, then return gradually; plus education and flexibility work for quadriceps, hamstrings and iliotibial band."""),
]
C1 = """Case I: Rehabilitation after stroke
Patient: Mrs Pema Choden, 72, retired school teacher. Past history: type 2 diabetes (well controlled), osteoarthritis of both knees (right more than left). Lives with her husband in a two-storey house with 12 stairs to the bedroom. Independent in basic ADLs but stopped her daily walks due to knee pain. Right-hand dominant.
Admitted 5 days ago with a right-sided cerebrovascular accident: left hemiplegia, facial asymmetry and slurred speech. CT confirmed an ischaemic infarct in the right middle cerebral artery (MCA) territory.
Day 5 status:
- Cognition and communication: alert, oriented to person and place; difficulty with attention and concentration; mild expressive dysphasia but understands simple commands.
- Sensation: diminished light touch and proprioception in the left upper and lower limbs.
- Tone: flaccid (hypotonic) left upper limb; emerging spasticity (Modified Ashworth 1+) in the left plantarflexors and hamstrings.
- Motor: left upper limb no volitional movement (0/5) at shoulder, elbow, wrist and fingers; shoulder subluxation of about 1 finger width. Left lower limb: hip 2/5, knee 2/5, ankle 1/5, no toe movement. Right side 4+/5.
- Balance and function: needs moderate support to sit upright, leans markedly to the right, no protective extension on the left. Bed-to-chair transfer needs maximal assistance of two with a sliding board. Not yet walking.
- Goal: frustrated but highly motivated: "I want to go back home and be able to make tea in my kitchen without falling.\""""
C2 = """Case II: Acute low back pain with leg symptoms
Patient: Mr Dorji, 45, bus driver. Hypertension (controlled). Two previous episodes of low back pain in 10 years, each resolving within a week with rest. Married with two children; sedentary outside work; smokes 10 cigarettes a day; moderate work-related stress.
Presenting: 7-day history of severe low back pain that began gradually after two days building a shed (much bending, twisting and lifting heavy timber).
Subjective: central and left low lumbar pain (L4-S1); highly irritable - 3/10 at rest rising to 8/10 with minimal provocation; worse with sitting (especially driving), forward bending, coughing/sneezing; better lying on his right side with knees bent; stiff and very painful for about 30 minutes in the morning; worse towards the end of a driving shift. Vague intermittent tingling in the left lateral calf and dorsum of the foot; no reported leg weakness; bladder and bowel normal. Off work for 3 days; struggles to put on socks and shoes; avoiding all lifting. Goals: return to work soon and play with his children without pain.
Objective: antalgic lean to the right; reduced lumbar lordosis; moves cautiously. Flexion limited to 20% by severe central pain (fingers to mid-thigh); extension 50% (local pain); right side flexion 70%; left side flexion 30% (sharp left pain). Repeated extension in lying centralises and reduces central and leg symptoms; repeated flexion in sitting increases left calf symptoms (peripheralisation). Neuro: left ankle dorsiflexion 4/5 (right 5/5), other myotomes 5/5; left Achilles reflex 1+ (right 2+); subtle reduced light touch in the web space between the left 1st and 2nd toes. Palpation: severe tenderness and guarding over left L5/S1 paraspinals. Slump test positive on the left (reproduces calf pain); SLR negative for neural pain but limited to 60° by hamstring tightness; femoral nerve test negative."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("physio2025", 1, T, C1, items=[
    it("1. Based on the motor presentation, identify the type of motor deficit Mrs Pema Choden is exhibiting and explain why it has occurred.", 3,
       [("Left hemiplegia/hemiparesis (upper motor neuron), arm more affected than leg", 1.5), ("Explanation: right MCA infarct damages motor cortex/corticospinal tracts (internal capsule) on right, which control left side (decussation); MCA supplies arm/face area more than leg", 1.5)],
       "She has a left hemiplegia (upper motor neuron lesion) - more severe in the arm than the leg - currently with flaccidity in the arm and emerging spasticity in the leg. It occurred because the right MCA infarct damaged the right motor cortex and corticospinal tract fibres (and internal capsule); these fibres cross at the medulla (pyramidal decussation) to control the left side. The MCA supplies the lateral cortex where the face and arm are represented, so the arm and face are affected more than the leg (supplied by the anterior cerebral artery)."),
    it("2. List THREE specific assessment tools you would use to objectively measure her current status and justify each choice. (Do not use the Modified Ashworth Scale.)", 6,
       [("Three appropriate tools (e.g. Fugl-Meyer, Motor Assessment Scale, Trunk Impairment Scale/ Trunk Control Test, Berg Balance (later), Postural Assessment Scale for Stroke, Functional Independence Measure/Barthel, Star cancellation for neglect)", 3), ("Justification for each linked to her problems", 3)],
       "1. Fugl-Meyer Assessment (upper and lower extremity) - valid, reliable measure of motor recovery after stroke; tracks change from 0/5 in the arm and 2/5 in the leg. 2. Trunk Control Test or Postural Assessment Scale for Stroke (PASS) - she cannot sit unsupported and leans to the right; these measure sitting balance and trunk control at this early stage (Berg Balance Scale would have a floor effect now). 3. Barthel Index or Functional Independence Measure - measures dependence in ADLs and transfers (two-person assist), relevant to her goal of returning home; repeated to show progress. (Also accepted: Motor Assessment Scale, Star Cancellation Test for left neglect, Nottingham Sensory Assessment.)"),
    it("3. Identify TWO key impairments and TWO activity limitations Mrs Pema Choden is experiencing.", 4,
       [("Two impairments: left limb weakness/paralysis, flaccid arm with shoulder subluxation, reduced sensation/proprioception, poor sitting balance/trunk control, emerging spasticity, attention deficit", 2), ("Two activity limitations: unable to transfer independently, unable to walk, unable to sit unsupported, difficulty with ADLs (dressing, making tea)", 2)],
       "Impairments (body structure/function): left-sided weakness/paralysis (arm 0/5, leg 1-2/5) with flaccid upper limb and shoulder subluxation; reduced light touch and proprioception on the left; poor trunk control and sitting balance with lean to the right; emerging spasticity in plantarflexors and hamstrings; reduced attention. Activity limitations: unable to sit unsupported; needs maximal assistance of two to transfer; unable to stand or walk; dependent in personal ADLs and unable to prepare a drink."),
    it("4. What is the most significant potential complication regarding her left upper limb at this stage? Describe ONE strategy to prevent it.", 2,
       [("Hemiplegic shoulder pain due to subluxation/ soft tissue trauma (also shoulder-hand syndrome)", 1), ("One strategy: supported positioning (pillows, lap tray, arm trough), correct handling - never pull on the arm, shoulder strapping/sling during upright, education", 1)],
       "The most significant complication is hemiplegic shoulder pain from the subluxed, flaccid shoulder (soft tissue damage, possibly complex regional pain syndrome/shoulder-hand syndrome). Prevention: support the arm at all times - in sitting on a pillow or lap tray/arm trough with the shoulder in a neutral position, in lying with the shoulder protracted and supported - and train all staff and family never to pull on the affected arm during transfers or repositioning (taping or a supportive sling may be used when upright)."),
    it("5. Outline your physiotherapy goals for Mrs Pema Choden for the first week of rehabilitation, including ONE short-term goal for each category.", 6,
       [("Goals SMART and realistic for week 1", 2), ("Impairment-level goal (e.g. sitting balance/ trunk control, shoulder protection, active hip/knee movement)", 1.5), ("Activity-level goal (e.g. sit unsupported 2 min, transfer with assistance of one)", 1.5), ("Participation/ education goal (e.g. patient and husband trained in positioning/ handling; sit out of bed for meals)", 1)],
       "SMART goals for week 1: Impairment: (a) maintain a pain-free left shoulder with no increase in subluxation, and (b) achieve active knee extension and hip extension against gravity in bridging. Activity: (a) sit on the edge of the bed with feet supported and close supervision for 2 minutes without leaning to the right; (b) transfer bed to chair with a sliding board and moderate assistance of one person. Participation/education: (a) Mrs Choden and her husband correctly position and support her left arm and leg, and (b) she sits out of bed for meals and tea with her husband for 30 minutes twice daily, linking to her goal of returning to her kitchen."),
    it("""6. Design a treatment plan for your FIRST TWO treatment sessions with Mrs Pema Choden.
(i) List FOUR different treatment techniques or activities you would include. (4 marks)
(ii) For EACH technique, give a brief rationale linking it to her specific problems. (8 marks)""", 12,
       [("(i) Four appropriate techniques: positioning and shoulder protection; sitting balance/trunk control training; sit-to-stand/ transfer practice; active-assisted LL exercises (bridging, knee/hip); sensory stimulation/ weight-bearing through left side; patient/family education", 4), ("(ii) Rationale for each linked to her problems (2 marks each)", 8)],
       "1. Positioning and shoulder protection (arm supported, correct bed/chair positioning, handling education) - flaccid arm with subluxation and emerging leg spasticity; prevents shoulder pain and contractures. 2. Sitting balance and trunk control training (sitting at the edge of the bed, weight shift towards the left, reaching tasks, mirror feedback) - she leans to the right and lacks protective reactions; trunk control is the foundation for transfers, standing and kitchen tasks. 3. Transfer and sit-to-stand practice with assistance (weight-bearing through the left leg, facilitation at the knee) - she needs two people to transfer; task-specific practice drives recovery and increases independence. 4. Active-assisted exercises for the left leg (bridging, hip and knee flexion/extension, ankle dorsiflexion) plus sensory input through weight-bearing - leg muscles are 1-2/5 with reduced proprioception; repetition promotes neuroplasticity and strength and prevents spasticity-related shortening. Education throughout on attention, safety and goals keeps her motivated."),
    it("""7. As Mrs Pema's recovery progresses, spasticity is likely to increase.
(i) Describe ONE stretching technique and ONE positioning strategy to manage spasticity in her left plantarflexors. (4 marks)
(ii) Explain the neurophysiological rationale for using sustained stretching. (3 marks)""", 7,
       [("(i) Stretch: prolonged passive/ standing stretch of gastrocnemius-soleus (e.g. tilt table, standing on wedge, 20-30 min or 30-60 s holds) with knee straight", 2), ("Positioning: ankle at neutral (90°) with foot supported, ankle-foot orthosis/ resting splint, avoid pressure on ball of foot", 2), ("(ii) Rationale: sustained stretch reduces muscle spindle sensitivity/ alpha motor neuron excitability (autogenic inhibition via Golgi tendon organs), viscoelastic changes, prevents sarcomere loss/contracture", 3)],
       "(i) Stretch: a slow, prolonged stretch of the gastrocnemius and soleus - e.g. standing on a tilt table or wedge with the knee straight and heel down for 20-30 minutes, or manual slow sustained stretches held 30-60 seconds and repeated, avoiding fast stretches that trigger the stretch reflex. Positioning: keep the ankle at neutral (90°) - in lying with the foot supported and no heavy bedclothes pushing it into plantarflexion, and in sitting with the foot flat on the floor; an ankle-foot orthosis or resting night splint can hold the position.\n(ii) Sustained stretch reduces the excitability of the stretch reflex: prolonged tension activates Golgi tendon organs (autogenic inhibition) and the muscle spindle adapts, lowering alpha motor neurone excitability, so tone falls. It also produces viscoelastic lengthening of muscle and connective tissue and maintains sarcomere number, preventing contracture."),
    it("8. Considering her goal of making tea, describe the THREE main components of kitchen-related function you would need to assess and rehabilitate before a safe discharge home.", 3,
       [("Standing balance and safe mobility in the kitchen (including turning, reaching, with/without aid)", 1), ("Upper limb/ one-handed function: reaching, grasping, carrying (hot liquids) with adaptations", 1), ("Cognition and safety: attention, sequencing, neglect, hazard awareness (hot water, stove)", 1)],
       "1. Standing balance and mobility - standing for several minutes, turning, reaching to cupboards and walking short distances in the kitchen safely (with or without an aid). 2. Upper limb function and one-handed techniques - reaching, grasping, pouring and carrying (often with the right hand, using adaptive equipment such as a kettle tipper, non-slip mats and a trolley for carrying). 3. Cognition and safety awareness - attention, sequencing the task, left-sided neglect, and safe handling of hot water and the stove (assessed jointly with occupational therapy in a kitchen assessment)."),
    it("9. What is the recommended gait aid for initial ambulation in a patient with left hemiplegia and poor balance? Justify your answer.", 2,
       [("Hemi-walker or quad (broad-based) stick in right hand (or parallel bars initially)", 1), ("Justification: wide stable base, used with one (right) hand as left arm non-functional; frame cannot be used", 1)],
       "A hemi-walker or broad-based quadripod stick held in the right (unaffected) hand, after initial practice in parallel bars. A standard frame cannot be used because her left arm is non-functional; a quad stick or hemi-walker gives a wide, stable base of support for her poor balance while allowing one-handed use."),
    it("10. List FIVE essential considerations for discharge planning to ensure Mrs Pema's safety and continued progress at home.", 5,
       [("Five considerations (1 each): home environment/ stairs (12 steps) - bedroom downstairs or rails; equipment (gait aid, shower chair, raised toilet, kitchen aids); carer training/ husband's ability and support; follow-up community/outpatient rehab and home exercise programme; falls prevention, medication/ diabetes and secondary stroke prevention, knee OA management, communication/ referral", 5)],
       "1. Home environment and access - 12 stairs to the bedroom: assess stair climbing, install rails or move the bed downstairs; home visit by OT/PT. 2. Equipment - walking aid, shower chair, raised toilet seat, grab rails and kitchen aids. 3. Carer support and training - her husband's capacity, training in safe transfers, positioning and exercises; need for extra help. 4. Continued rehabilitation - referral to outpatient/community physiotherapy and a clear home exercise programme with goals. 5. Health and safety - falls prevention, management of diabetes and knee osteoarthritis, medication adherence and secondary stroke prevention, plus an emergency plan and follow-up appointments."),
])
Q += case("physio2025", 2, T, C2, items=[
    it("1. Based on the subjective and objective findings, what is your primary clinical hypothesis? Give THREE key pieces of evidence to support it.", 5,
       [("Hypothesis: acute lumbar disc herniation (posterolateral, L4/5 or L5/S1) with left L5 radiculopathy", 2), ("Three pieces of evidence: mechanism (repeated flexion/ lifting), worse with sitting/ flexion/ cough-sneeze, leg tingling in dermatome, neuro deficits, positive slump, centralisation with extension", 3)],
       "Primary hypothesis: acute posterolateral lumbar disc herniation (left L4/5 or L5/S1) with left lumbar radiculopathy (nerve root irritation and mild compression). Evidence: 1. Mechanism - repeated bending, twisting and heavy lifting; pain aggravated by flexion, sitting and coughing/sneezing (raised intradiscal pressure). 2. Neurological signs - tingling in the left lateral calf and dorsum of foot, weak dorsiflexion, reduced Achilles reflex and reduced sensation in the 1st web space, with a positive left slump test. 3. Directional preference - repeated extension centralises symptoms while repeated flexion peripheralises them, typical of a discogenic derangement; antalgic lateral shift is also common."),
    it("""2. (i) Identify the most likely spinal nerve root involved. (1 mark)
(ii) Give TWO objective findings that support this. (2 marks)""", 3,
       [("(i) Left L5 nerve root (note S1 features from reflex)", 1), ("(ii) Two findings: weak ankle dorsiflexion (and EHL), reduced sensation in 1st-2nd toe web space, (positive slump); diminished Achilles suggests S1 overlap", 2)],
       "(i) The left L5 nerve root. (ii) Weak left ankle dorsiflexion (4/5) - L5 myotome (with extensor hallucis longus); reduced light touch in the web space between the 1st and 2nd toes - L5 dermatome (plus tingling in the lateral calf and dorsum of the foot). The diminished Achilles reflex is an S1 sign, suggesting some S1 involvement too (e.g. an L5/S1 disc affecting both roots)."),
    it("""3. The concepts of centralisation and peripheralisation are crucial.
(i) Define both terms. (2 marks)
(ii) Why is centralisation a positive prognostic indicator? (2 marks)""", 4,
       [("(i) Centralisation: distal/referred symptoms move towards midline/ spine (abolished) with repeated movements; peripheralisation: symptoms spread distally", 2), ("(ii) Indicates mechanically responsive (reducible) disc derangement, outer annulus intact; predicts good outcome with directional preference exercises, lower surgery need, faster recovery", 2)],
       "(i) Centralisation: with repeated movements or sustained positions, referred symptoms in the leg retreat towards the midline of the spine and lessen or disappear (central pain may briefly increase). Peripheralisation: symptoms spread further down the limb (distally) with a movement. (ii) Centralisation shows the problem is mechanically responsive (a reducible derangement with an intact annulus) and that a directional preference exists - here extension. Research shows centralisers have a good prognosis with conservative care, recover faster, have less disability and are less likely to need surgery."),
    it("4. List THREE key impairments and TWO key activity limitations for Mr Dorji. (The paper says 'Mr. Matthews', a slip for Mr Dorji.)", 5,
       [("Three impairments: pain, reduced lumbar ROM (flexion, left side flexion), neurological deficit (weak dorsiflexion, reflex, sensation), muscle guarding/ spasm, lateral shift/ altered posture, reduced neural mobility", 3), ("Two activity limitations: sitting/ driving, bending to dress (socks and shoes), lifting, playing with children, working", 2)],
       "Impairments: severe low back and left leg pain; reduced lumbar range (flexion 20%, left side flexion 30%) with antalgic lateral shift; neurological deficit - weak left dorsiflexion, reduced Achilles reflex and sensation; paraspinal muscle guarding; reduced neural mobility (positive slump) and hamstring tightness. Activity limitations: unable to sit and drive for long; difficulty bending to put on socks and shoes; unable to lift; difficulty playing with his children; currently unable to work."),
    it("5. Identify TWO 'yellow flags' present in this case.", 2,
       [("Two yellow flags: fear-avoidance (avoiding all lifting/ activity), belief that rest is the cure (previous episodes resolved with rest), work-related stress, off work, sedentary/ smoking", 2)],
       "Any two: fear-avoidance behaviour (avoiding all lifting and moving very cautiously); the belief that rest is the treatment (previous episodes 'resolved with rest'); moderate work-related stress; being off work with a physically demanding, sedentary job; low physical activity outside work."),
    it("6. What is the single most important 'red flag' to rule out in this presentation, and how did the case information provide reassurance?", 2,
       [("Cauda equina syndrome", 1), ("Reassurance: normal bladder and bowel function, no saddle anaesthesia reported, unilateral symptoms, no bilateral weakness", 1)],
       "Cauda equina syndrome. Reassurance: he reports normal bladder and bowel function, symptoms are one-sided with only mild single-root signs, and there is no reported saddle anaesthesia or bilateral leg weakness (these should still be specifically checked and he should be told to seek urgent help if they appear)."),
    it("7. Outline your physiotherapy management goals for the first 1-2 weeks (acute phase).", 6,
       [("Pain and irritability reduction, centralise symptoms", 1.5), ("Restore lumbar movement (extension, flexion), correct lateral shift", 1.5), ("Reassure/ educate, reduce fear, stay active, independent home programme", 1.5), ("Function: dressing, sitting tolerance, graded return to work/ driving; monitor neuro status", 1.5)],
       "1. Reduce pain and irritability and centralise and abolish leg symptoms (e.g. leg tingling gone, pain at rest ≤2/10). 2. Restore movement - correct the lateral shift and improve extension, then gradually flexion. 3. Education and reassurance - understand the condition, reduce fear-avoidance, stay active and avoid bed rest; perform an independent home programme of extension exercises several times a day. 4. Function - put on socks and shoes independently, sit 30 minutes with lumbar support, walk regularly, and plan graded return to driving/work. 5. Monitor neurological status (myotomes, reflexes, sensation) at each session."),
    it("""8. Design a treatment plan for the first two sessions.
(i) List THREE specific treatment strategies you would use. (3 marks)
(ii) For EACH strategy, give a clear physiological or clinical rationale. (6 marks)""", 9,
       [("(i) Three strategies: McKenzie directional preference - repeated extension in lying (after lateral shift correction), education/reassurance and activity advice, pain relief (positioning, ice/heat), walking programme, posture with lumbar roll; gentle manual therapy", 3), ("(ii) Rationale for each (2 marks each)", 6)],
       "1. Directional preference exercises (McKenzie) - lateral shift correction then repeated prone extension (press-ups) every 2-3 hours. Rationale: extension centralised his symptoms; repeated end-range extension is thought to reduce the posterior disc displacement and relieve nerve root irritation, giving rapid pain relief. 2. Education and advice - explain the condition and good prognosis, stay active, avoid prolonged sitting and flexion for now, use a lumbar roll when sitting, walk regularly. Rationale: reduces fear-avoidance and catastrophising (yellow flags), improves self-efficacy and outcomes; avoiding flexion prevents peripheralisation. 3. Pain-relieving modalities and positioning - heat or ice, rest positions of ease (side-lying, or prone if tolerated), gentle walking. Rationale: reduces muscle guarding and pain via pain-gate and circulatory effects, so he can do his exercises; walking keeps the spine moving and aids disc nutrition. (Also accepted: gentle mobilisation in extension.)"),
    it("9. Mr Dorji's job as a bus driver is a major aggravating factor. Describe THREE specific pieces of advice to manage his pain at work on his return.", 3,
       [("Three pieces of advice (1 each): lumbar roll/ seat adjustment (lordosis, seat close, upright backrest), regular breaks every 30-60 min to walk and do standing extensions, avoid lifting/ bending after long sitting, graded return/ shorter shifts, manage stress", 3)],
       "1. Adjust the driving seat and use a lumbar roll to keep his lumbar lordosis (backrest slightly reclined, seat close enough to reach pedals without slouching). 2. Take regular breaks (e.g. every 30-60 minutes at stops) to get out, walk and do 5-10 standing back extensions. 3. Avoid lifting or bending immediately after a long drive (discs are more vulnerable after prolonged sitting), and agree a graded return with shorter shifts at first; manage stress and keep up his home exercises."),
    it("10. As he moves into the sub-acute phase (weeks 2-4), his programme must evolve. Describe TWO key exercise progressions you would implement, specifying their purpose.", 4,
       [("Two progressions with purpose: gradual reintroduction of flexion once centralised (restore full ROM); core/ trunk stabilisation and strengthening (motor control, load tolerance); graded lifting/ functional training; neural mobilisation (slump sliders); aerobic walking", 4)],
       "1. Restore flexion and full movement - once symptoms are centralised and stable, reintroduce flexion gradually (flexion in lying, then sitting, then standing), always followed by extension, to regain normal range without provoking leg symptoms. 2. Progressive strengthening and functional training - trunk and hip strengthening (bridging, bird-dog, planks) progressing to graded lifting technique and work-specific tasks, to build load tolerance, prevent recurrence and return him to work and playing with his children. (Also: neural mobility sliders and aerobic conditioning such as brisk walking; smoking cessation advice.)"),
    it("11. Despite 4 weeks of physiotherapy, the neurological deficit (reduced reflex and sensation) persists and leg pain is unchanged. What is your next step in management?", 2,
       [("Re-assess and refer to doctor/ spinal specialist (orthopaedic/ neurosurgery) for medical review, MRI and consideration of further management (e.g. epidural injection or surgery); monitor progressive deficit", 2)],
       "Re-assess thoroughly and refer him back to his doctor for review by a spinal (orthopaedic or neurosurgical) specialist, with MRI to confirm the level and degree of nerve root compression and to consider options such as nerve root/epidural injection or surgical discectomy; any progressive weakness or cauda equina signs need urgent referral."),
    it("12. Explain why a course of NSAIDs (e.g. ibuprofen) might be prescribed for this condition and what their main mechanism of action is.", 2,
       [("Why: reduce pain and inflammation around irritated nerve root/ disc, allow activity and exercise", 1), ("Mechanism: inhibit cyclo-oxygenase (COX-1/COX-2), reducing prostaglandin synthesis", 1)],
       "NSAIDs reduce the inflammatory reaction around the irritated nerve root and disc and relieve pain, helping him stay active and do his exercises. They act by inhibiting the cyclo-oxygenase enzymes (COX-1 and COX-2), reducing the production of prostaglandins that cause inflammation and sensitise pain receptors (with caution because of his hypertension and gastric side effects)."),
    it("13. Describe the key differences in presentation between neurogenic claudication (from lumbar spinal stenosis) and Mr Dorji's symptoms.", 3,
       [("Age/onset: stenosis older (>60), gradual; Dorji 45, acute after lifting", 1), ("Aggravating/easing: stenosis worse with walking/standing/extension, relieved by sitting/flexion (shopping trolley sign); Dorji worse with sitting/flexion, better with extension", 1), ("Symptoms: stenosis often bilateral, diffuse, heaviness/ cramping, few neuro signs at rest; Dorji unilateral dermatomal, specific root signs", 1)],
       "Neurogenic claudication usually affects older people (over 60) with gradual onset; symptoms are often bilateral and diffuse (aching, heaviness, cramping or numbness in the buttocks and legs), brought on by walking or standing (extension narrows the canal) and relieved by sitting or bending forward (e.g. leaning on a shopping trolley), with few neurological signs at rest. Mr Dorji is 45 with acute onset after lifting; his symptoms are one-sided and follow a specific root (L5), are worse with sitting and flexion and better with extension, with clear neurological signs - typical of disc-related radiculopathy."),
])
PATTERN = STANDARD
