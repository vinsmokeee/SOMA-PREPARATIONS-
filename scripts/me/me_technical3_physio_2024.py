"""ME Technical Paper III (Subject Specialisation Paper), Physiotherapy, BCSE 2024 - real paper (PDF sent by the founder).
Standard pattern, same as the 2025 Physiotherapy paper (the latest). Replaced MCQs (more than one option defensible): 9
(complication of subcutaneous burn), 14 (no spinal stenosis option), 25 (equinus with hindfoot position), 27 (twisting
repetitive movements: athetosis vs dystonia). Short answer 2 parts i/ii/iii are written a/b/c.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1"
GROUP_TAG = "physio2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "physiotherapy"
ADDS_TO_PAPER = True  # 2025 is the latest Physiotherapy paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Physiotherapy"

MCQ = r"""[
{
"n": 1,
"stem": "________________ is where the sternum projects forward and is held in a prominent position by the ribs and costal cartilages.",
"opts": [
"Barrel chest",
"Pectus arcuatum",
"Pectus carinatum",
"Pectus excavatum"
]
},
{
"n": 2,
"stem": "Which one of the following is the holistic model of patient care and treatment which takes into consideration a person’s physical abilities, emotional and psychological state and greater environmental factors?",
"opts": [
"Social model",
"Medical Model",
"Disability Model",
"Biopsychosocial Model"
]
},
{
"n": 3,
"stem": "Rapid shallow breathing is also known as____________",
"opts": [
"Hyperpnea",
"Tachypnea",
"Biot’s breathing",
"Hyperventilation"
]
},
{
"n": 4,
"stem": "_______________ is a continuous whistling sound produced by air passing through a narrowed airway.",
"opts": [
"Stertor",
"Stridor",
"Wheeze",
"Crackles"
]
},
{
"n": 5,
"stem": "While the extremity or joint(s) is held in a static position by the therapist, the patient is asked to describe the position verbally or to duplicate the position of the extremity or joint(s) with the contralateral extremity. What is being tested in the patient?",
"opts": [
"Barognosis",
"Kinesthesia",
"Stereognosis perception",
"Proprioceptive awareness"
]
},
{
"n": 6,
"stem": "Which cranial nerve supplies taste to the anterior two-thirds of the tongue?",
"opts": [
"Facial",
"Trigeminal",
"Oculomotor",
"Glossopharyngeal"
]
},
{
"n": 7,
"stem": "A patient presents with very painful, red and dry skin on their upper shoulders after spending the day outside gardening with no sun protection. What is this patient’s MOST likely diagnosis?",
"opts": [
"Superficial burn",
"Full thickness burn",
"Deep partial thickness burn",
"Superficial partial thickness burn"
]
},
{
"n": 8,
"stem": "When classifying a burn injury by depth, which ONE of the following extends through the entire dermis and into the hypodermis?",
"opts": [
"Superficial partial thickness",
"Deep partial thickness",
"Full thickness",
"Subcutaneous"
]
},
{
"n": 9,
"stem": "Which ONE of the following is the MOST LIKELY complication of subcutaneous burn?",
"opts": [
"Contracture",
"Amputation",
"Compartment syndrome",
"Increased tissue sensitivity"
]
},
{
"n": 10,
"stem": "Why is estimating the initial total body surface area affected after a burn injury important as a life-saving measure? Select the most appropriate answer.",
"opts": [
"To estimate amount of blanching on the skin",
"To work out the body surface area damaged",
"To improve the wound care and management",
"To calculate an accurate measurement for fluid resuscitation"
]
},
{
"n": 11,
"stem": "Which one of the following movements is used to assess the strength of the L3 myotome?",
"opts": [
"Ankle Dorsiflexion",
"Big toe Extension",
"Knee Extension",
"Hip Flexion"
]
},
{
"n": 12,
"stem": "Which ONE of the following repeated movement tests should you add to your assessment if a patient has a lateral shift?",
"opts": [
"Flexion",
"Extension",
"Rotation",
"Slide glides"
]
},
{
"n": 13,
"stem": "You are assessing a patient with low back pain. During the straight leg raise test, the patient starts to get symptoms at around 75-80 degrees of flexion. You think that this might be due to stretching of their hamstrings. Which ONE of the following tests could you perform to distinguish between hamstrings stretch and sciatic nerve tension?",
"opts": [
"Obers test",
"Slump test",
"Thomas test",
"Femoral nerve tension test"
]
},
{
"n": 14,
"stem": "A 69-year-old patient presents with persistent low back pain, which often radiates down his right leg into his hip. He has pain with prolonged sitting, and while he can walk short distances without pain, his pain worsens with longer distances. His pain is not worse at night, and his sleep is not affected. He also has no neurological symptoms. Based on this subjective history and the patient’s age, which ONE of the following conditions do you think is more likely?",
"opts": [
"Strain",
"Arthritis",
"Disc pathology",
"Spondylolisthesis"
]
},
{
"n": 15,
"stem": "A patient presents with low back pain. They appear to be in a lot of pain and have high fear avoidance. How would you approach the functional screen? Select the best answer.",
"opts": [
"Ask them to do a full squat to get an understanding of their general range of motion without them having to do too many movements",
"Ask them to complete a full functional screen, so you can objectively determine irritability.",
"Get a sense of what they are willing to do; for example, see if they can bend forward",
"Get them to visualize the movement and then perform it."
]
},
{
"n": 16,
"stem": "Complete the sentence with the correct answer. If just one nerve root is involved in a patient’s presentation, we will not see a huge sensory or strength loss. Comparing _________ can help us to pick up on subtle differences.",
"opts": [
"One repetitions maximum and ten repetition maximum",
"ROM and muscle strength",
"Proximal and distal",
"Left and right"
]
},
{
"n": 17,
"stem": "A 17-year-old cricket player presents with low back pain. Her pain has come on gradually, and it is worse when she is bowling. On examination, you observe that she has pain with extension. While palpating her lumbar spine, you notice a step-off. Based on this history, which ONE of the following conditions do you think is more likely?",
"opts": [
"Spondylolisthesis",
"Disc pathology",
"Back Strain",
"Instability"
]
},
{
"n": 18,
"stem": "What is the preferred term for spasticity approved by the European consensus on the concepts and measurement of the pathophysiological neuromuscular responses to passive muscle stretch? Select ONE answer.",
"opts": [
"Hypertonia",
"Rigidity",
"Hyperactivity",
"Hyper-resistance"
]
},
{
"n": 19,
"stem": "The neurological component of spasticity is characterized by disinhibition occurring at the ___________________ as a direct result of the neurological insult.",
"opts": [
"Medulla",
"Cervical plexus",
"Hypothalamus",
"Spinal reflex loop"
]
},
{
"n": 20,
"stem": "You are assessing a patient with a C6 spinal cord injury who has developed hyper-resistance to passive muscle stretch. You notice a marked increase in muscle tone through most of the range, but you can still easily move his lower extremities. Which Modified Ashworth Scale grade is this? Select ONE answer.",
"opts": [
"Grade 1+",
"Grade 1",
"Grade 2",
"Grade 3"
]
},
{
"n": 21,
"stem": "Complete the sentence with the correct answer. You are working with a 5- year- old-girl with cerebral palsy and her family. The girl’s parents mention that their daughter has difficulty communicating with her family and is unable to express her needs. This is an example of _______________________.",
"opts": [
"A body function",
"A body structure",
"An activity/participation",
"An environmental factor"
]
},
{
"n": 22,
"stem": "You are working with a 10-year-old boy who has cerebral palsy. He lives with his family in a rural area and does not have access to electricity for much of the day. Limited access to electricity is an example of which ONE of the following?",
"opts": [
"Body function",
"Body structure",
"Activity/participation",
"Environmental factor"
]
},
{
"n": 23,
"stem": "You are checking to see if 4-year-old Dema has a subluxed or dislocated hip. She is supine in a hook-lying position with her feet flat. You do not see any difference in height between her knees. How would you document the results of this special test? Select ONE answer.",
"opts": [
"Positive Galeazzi sign",
"Negative Galeazzi sign",
"Positive Ortolani sign",
"Negative Ortolani sign"
]
},
{
"n": 24,
"stem": "You are assessing the gait of a 10-year-old boy named Dorji. When he walks, you notice he has a left foot drop. Which muscle would you suspect is weak? Select ONE answer.",
"opts": [
"Soleus",
"Gastrocnemius",
"Tibialis anterior",
"Tibialis posterior"
]
},
{
"n": 25,
"stem": "What is ankle equinus?",
"opts": [
"Foot plantarflexed and hindfoot valgus",
"Foot plantarflexed and hindfoot varus",
"Foot dorsiflexed and hindfoot valgus",
"Foot dorsiflexed and hindfoot varus"
]
},
{
"n": 26,
"stem": "Which one of the following muscles would be impaired if you observed a Trendelenburg gait?",
"opts": [
"Gluteus maximus",
"Gluteus minmus",
"Gluteus medius",
"Multifidus"
]
},
{
"n": 27,
"stem": "Twisting and repetitive movement is also known as",
"opts": [
"Chorea",
"Athetosis",
"Dystonia",
"Dyskinesia"
]
},
{
"n": 28,
"stem": "____________________ is a physical disability caused by brain injury during pregnancy, birth, or shortly after birth. It affects movement, coordination, muscle tone, reflexes, posture and balance.",
"opts": [
"Spina Bifida",
"Cerebral palsy",
"Downs syndrome",
"Muscular dystrophy"
]
},
{
"n": 29,
"stem": "Osteoarthritis or degenerative joint disease, is a slowly evolving joint disease that appears to originate in the ____________________.",
"opts": [
"Cartilage",
"Soft tissue",
"Ligaments",
"Synovial fluid"
]
},
{
"n": 30,
"stem": "A cystic swelling of the dura and arachnoid, that protrudes through the neural tube defect is ____________________________.",
"opts": [
"Spina bifida occulta",
"Meningomyelocele",
"Meningocele",
"Myeloschisis"
]
}
]"""

KEY = {
    1: ("c", "Pectus carinatum (pigeon chest): the sternum projects forward."),
    2: ("d", "The biopsychosocial model considers biological, psychological and social/ environmental factors."),
    3: ("b", "Tachypnoea is rapid shallow breathing; hyperpnoea is deep breathing."),
    4: ("c", "A wheeze is a continuous musical/ whistling sound from narrowed airways."),
    5: ("d", "Describing or matching a static joint position tests position sense (proprioceptive awareness); kinaesthesia is sense of movement."),
    6: ("a", "Taste from the anterior two-thirds of the tongue is carried by the facial nerve (chorda tympani)."),
    7: ("a", "Sunburn - painful, red, dry skin without blisters - is a superficial (epidermal) burn."),
    8: ("c", "Full-thickness burns destroy the entire dermis and extend into the hypodermis."),
    10: ("d", "%TBSA is needed to calculate fluid resuscitation (e.g. Parkland formula)."),
    11: ("c", "The L3 myotome is tested by knee extension (L2: hip flexion; L4: ankle dorsiflexion; L5: big toe extension)."),
    12: ("d", "For a lateral shift, add side glides (McKenzie)."),
    13: ("b", "The slump test adds neural tension (neck flexion) to distinguish neural from hamstring symptoms."),
    15: ("c", "With high pain and fear-avoidance, adapt the screen to what the patient is willing to do."),
    16: ("d", "Comparing left and right sides reveals subtle sensory or strength differences."),
    17: ("a", "A young bowler with extension pain and a palpable step-off suggests spondylolysis/ spondylolisthesis."),
    18: ("d", "The European consensus recommends the term 'hyper-resistance' to passive stretch."),
    19: ("d", "Spasticity results from disinhibition of the spinal stretch reflex loop."),
    20: ("c", "MAS grade 2: more marked increase in tone through most of the ROM, but the part is easily moved."),
    21: ("c", "Difficulty communicating needs is an activity/ participation limitation (ICF)."),
    22: ("d", "Limited access to electricity is an environmental factor (ICF)."),
    23: ("b", "Equal knee heights in hook-lying = negative Galeazzi sign."),
    24: ("c", "Foot drop is due to weakness of the ankle dorsiflexors, mainly tibialis anterior."),
    26: ("c", "Trendelenburg gait is due to weakness of the hip abductors, mainly gluteus medius."),
    28: ("b", "Cerebral palsy: non-progressive brain injury before, during or shortly after birth."),
    29: ("a", "Osteoarthritis appears to originate in the articular cartilage."),
    30: ("c", "A meningocele is a cystic protrusion of dura and arachnoid without neural tissue."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "The lowest possible score on the Glasgow Coma Scale is", ["0", "1", "3", "5"], "c",
            "GCS ranges from 3 (deep coma) to 15."),
    new_mcq(2, T, "Wrist drop after a fracture of the shaft of the humerus is due to injury of the", ["median nerve", "ulnar nerve", "radial nerve", "axillary nerve"], "c",
            "The radial nerve runs in the spiral groove of the humerus."),
    new_mcq(3, T, "In the MRC (Oxford) scale, muscle grade 3 means", ["flicker of contraction only", "full range with gravity eliminated", "full range against gravity but not against resistance", "full range against strong resistance"], "c",
            "Grade 3: movement through full range against gravity only."),
    new_mcq(4, T, "Transcutaneous electrical nerve stimulation (TENS) is mainly used for", ["muscle strengthening", "pain relief", "wound healing", "bone union"], "b",
            "TENS relieves pain (gate control and endogenous opioid mechanisms)."),
]

SA = [
    ("List the various cortical sensations and how each is assessed. (5 marks)",
     [("Cortical (combined) sensations with test: stereognosis (identify object by touch), graphaesthesia (numbers traced on skin), two-point discrimination (calipers), tactile localisation, barognosis (weights), texture recognition, bilateral simultaneous stimulation/ extinction; vision occluded, compare sides, primary sensation intact first", 5)],
     "Cortical (combined/ discriminative) sensations depend on intact primary sensation and parietal cortex; test with the patient's vision occluded and compare sides. (1) Stereognosis - ability to recognise common objects (key, coin, pen) placed in the hand by touch. (2) Graphaesthesia - recognising numbers or letters traced on the palm or skin. (3) Two-point discrimination - distinguishing one from two points touched simultaneously using calipers, finding the smallest distance felt as two. (4) Tactile localisation - pointing to the exact spot touched. (5) Barognosis - recognising differences in weight of objects of the same size and shape. (6) Texture recognition - identifying materials such as cotton, wool or silk. (7) Bilateral simultaneous stimulation - touching identical sites on both sides at once to detect extinction/ neglect."),
    ("Dorji is a 7-year-old boy referred by the paediatrician with difficulty in walking. He walks with a waddling gait. His mother reports that he has had difficulty walking for the last few months; before that he was a typical child with no developmental delay and no falls. The onset was insidious and he has no pain. He has had frequent falls.\na) What is your impression of the boy? (1 mark)\nb) Which sign would you expect to be positive in this boy? (1 mark)\nc) What further assessment would you perform on him? (3 marks)",
     [("a) Duchenne muscular dystrophy (proximal muscle weakness)", 1),
      ("b) Gowers' sign (also calf pseudohypertrophy)", 1),
      ("c) Muscle strength (MMT - proximal), ROM/ contractures (tendo-Achilles, ITB, hip flexors), posture (lumbar lordosis), gait, functional tests (timed rise from floor, 6MWT, North Star Ambulatory Assessment), respiratory function, cardiac; refer for CK, genetic testing, EMG/ biopsy", 3)],
     "a) Duchenne muscular dystrophy - a progressive X-linked condition causing proximal muscle weakness in boys, typically presenting at 3-7 years with a waddling gait, frequent falls and difficulty running, climbing stairs and rising from the floor.\nb) Gowers' sign - the child 'climbs up' his legs with his hands to rise from the floor because of weak hip and knee extensors; calf pseudohypertrophy is also expected.\nc) Detailed history (family history, milestones) and assessment: manual muscle testing (proximal more than distal weakness); range of motion and contractures (tendo-Achilles, iliotibial band, hip flexors); posture (increased lumbar lordosis, wide base); gait analysis (toe-walking, Trendelenburg/ waddling); functional and timed tests (time to rise from the floor, 10-metre walk/run, stair climbing, 6-minute walk test, North Star Ambulatory Assessment); balance and falls; respiratory function (chest expansion, cough, spirometry) and cardiac screening; and refer for investigations - serum creatine kinase (very high), genetic testing for the dystrophin gene, and EMG or muscle biopsy if needed."),
    ("Assume you are about to begin a coordination examination. Which screening would be appropriate and why, and in what order would you perform it? (5 marks)",
     [("Screen first the systems that affect coordination so deficits are not misattributed: mental status/ cognition (arousal, attention, ability to follow commands, memory), sensation (proprioception, vision, vestibular), ROM, muscle strength, tone, balance", 3),
      ("Logical order: cognition/ communication → sensory (especially proprioception) → ROM → strength → tone/ spasticity → then coordination tests (non-equilibrium then equilibrium; gross then fine)", 2)],
     "Before testing coordination, screen the systems that contribute to coordinated movement, so that deficits are not wrongly attributed to cerebellar or basal ganglia dysfunction. Order: (1) mental status and cognition - arousal, attention, orientation, memory and ability to understand and follow commands; (2) sensory integrity - especially proprioception and kinaesthesia, vision and vestibular function, since sensory ataxia mimics coordination loss; (3) range of motion - limitations restrict movement; (4) muscle strength - weakness prevents accurate, smooth movement; (5) tone - spasticity or rigidity interferes with movement; and screening of balance and endurance. Only then perform coordination tests: non-equilibrium tests (finger-to-nose, heel-to-shin, alternating movements, tapping) and equilibrium tests (standing, tandem walking, Romberg), moving from gross to fine motor tasks."),
    ("Differentiate between the terms motor control and motor learning. How can impairments in motor control be distinguished from those of motor learning? (5 marks)",
     [("Motor control: ability to regulate/ direct the mechanisms essential for movement (posture, movement, sensory integration) - current performance; motor learning: set of processes associated with practice/ experience leading to relatively permanent changes in capability for skilled movement", 3),
      ("Distinguishing: control impairments seen in performance during a single task (abnormal tone, coordination, timing) vs learning impairments seen as failure to improve or retain/ transfer skills with practice - assessed by retention and transfer tests after practice", 2)],
     "Motor control is the ability to regulate or direct the mechanisms essential to movement - how the nervous system organises muscles and joints into coordinated, functional movement and posture, integrating sensory information - and is seen in a person's current performance. Motor learning is a set of internal processes associated with practice or experience that leads to relatively permanent changes in the capability for skilled movement; it is inferred from performance over time. Distinguishing: motor control impairments are seen during performance of a single task - e.g. abnormal tone, weakness, poor timing, incoordination or postural instability while the patient attempts the movement. Motor learning impairments are seen when, despite practice and feedback, the patient fails to improve, does not retain the improvement after a rest period (retention test), or cannot transfer it to a new context or variation (transfer test). Performance during practice may improve temporarily without true learning; learning is shown by retention and transfer."),
]
for i, (s, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=5, topic=T, stem=s, key_points=kp, model=mod))

C1 = """Case I: Traumatic brain injury
A 36-year-old man sustained a traumatic brain injury (TBI) in a motorcycle accident. On admission he had a left frontal laceration with an underlying linear skull fracture. CT revealed oedema, a right basal ganglia contusion and a left frontal contusion. He was comatose on admission. His acute hospital course was complicated by increased intracranial pressure and severe spasticity, which required casts and splints. A gastric tube was inserted. Illustrate with diagrams wherever necessary."""
C2 = """Case II: COPD after pneumonia
A 67-year-old woman was admitted to hospital with acute bacterial pneumonia. She was treated with mechanical ventilation for 5 days, steroids, antibiotics and bronchodilators. She has a history of COPD and is cared for by her daughter. She was discharged on day 7 and referred to physiotherapy."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("physio2024", 1, T, C1, items=[
    it("i. One of the pathophysiological mechanisms of TBI is diffuse axonal injury. Briefly describe diffuse axonal injury and its classification.", 5,
       [("DAI: widespread shearing/ stretching of axons from rotational acceleration-deceleration forces, especially at grey-white junction, corpus callosum, brainstem; secondary axonal disconnection; often coma with little on CT, best seen on MRI", 3),
        ("Classification (Adams/ Gennarelli): grade I - axonal injury in white matter of hemispheres; grade II - plus focal lesion in corpus callosum; grade III - plus brainstem lesion", 2)],
       "Diffuse axonal injury is widespread damage to axons caused by shearing and stretching forces from rapid rotational acceleration-deceleration of the brain (e.g. motorcycle crashes). Axons at the grey-white matter junction, corpus callosum and brainstem are most affected; damage to the cytoskeleton disrupts axonal transport, leading to swelling and secondary disconnection over hours to days. Patients are often in coma from the moment of injury, while CT may show little - MRI (diffusion, susceptibility-weighted) is more sensitive. Classification (Adams/ Gennarelli): Grade I - microscopic axonal injury in the white matter of the cerebral hemispheres; Grade II - grade I plus a focal lesion in the corpus callosum; Grade III - grade II plus a focal lesion in the dorsolateral brainstem. Clinically it is also graded as mild, moderate or severe by duration of coma."),
    it("ii. What is coup-contrecoup injury?", 3,
       [("Coup: contusion at site of impact as brain strikes skull; contrecoup: injury on opposite side as brain rebounds/ decelerates against skull; acceleration-deceleration; frontal and temporal poles", 3)],
       "Coup-contrecoup injury is a pair of brain contusions caused by acceleration-deceleration: the coup injury occurs directly under the site of impact as the brain strikes the inside of the skull; the contrecoup injury occurs on the opposite side as the brain rebounds and hits the skull on the other side (often the frontal and temporal poles against bony ridges). In this patient, the left frontal contusion with a right basal ganglia contusion reflects injury at and away from the impact site."),
    it("iii. Which measurement tool is used to measure the level of alertness/ consciousness to help define the severity of injury in patients with TBI? Explain the tool briefly.", 5,
       [("Glasgow Coma Scale", 1), ("Components: eye opening 1-4, verbal 1-5, motor 1-6; total 3-15", 2), ("Severity: 13-15 mild, 9-12 moderate, ≤ 8 severe (coma); limitations (intubation, sedation)", 2)],
       "The Glasgow Coma Scale (GCS). It scores three responses: eye opening (4 spontaneous, 3 to voice, 2 to pain, 1 none); best verbal response (5 oriented, 4 confused, 3 inappropriate words, 2 incomprehensible sounds, 1 none); and best motor response (6 obeys commands, 5 localises pain, 4 withdraws, 3 abnormal flexion - decorticate, 2 extension - decerebrate, 1 none). Total 3-15. TBI severity: 13-15 mild, 9-12 moderate, 3-8 severe (coma). It is repeated to monitor change; verbal scoring is limited in intubated or sedated patients (recorded as 'T')."),
    it("iv. Describe the CNS and its functions, with appropriate diagrams.", 5,
       [("Components: brain (cerebrum - lobes and functions: frontal motor/ executive, parietal sensory, temporal hearing/ memory, occipital vision; basal ganglia; diencephalon - thalamus, hypothalamus; cerebellum - coordination; brainstem - midbrain, pons, medulla, vital centres, cranial nerves) and spinal cord (tracts, reflexes); meninges, CSF", 4),
        ("Labelled diagram(s)", 1)],
       "The central nervous system consists of the brain and spinal cord, protected by the skull, vertebrae, meninges and CSF. Cerebrum - two hemispheres with lobes: frontal (voluntary movement in the primary motor cortex, planning, personality, executive function, Broca's speech area), parietal (somatosensory perception, spatial awareness), temporal (hearing, memory, language comprehension - Wernicke's area) and occipital (vision). Basal ganglia - regulate movement, tone and motor planning. Diencephalon - thalamus (sensory relay) and hypothalamus (autonomic, endocrine, temperature control). Cerebellum - coordination, balance, motor learning. Brainstem - midbrain, pons and medulla: cranial nerve nuclei, reticular activating system (consciousness), cardiorespiratory centres. Spinal cord - conducts ascending sensory and descending motor tracts and mediates spinal reflexes. (Diagram: lateral view of brain with lobes, cerebellum and brainstem; cross-section of spinal cord with grey and white matter.)"),
    it("v. During the acute stage of TBI, what common complications might arise, and what physiotherapy management prevents them?", 5,
       [("Complications: respiratory (pneumonia, atelectasis, aspiration), contractures/ spasticity, pressure ulcers, DVT, heterotopic ossification, deconditioning, raised ICP considerations", 2),
        ("PT: positioning (head up 30°, avoid ICP rises), chest physiotherapy/ suctioning carefully, passive ROM, splinting/ serial casting, regular turning, early mobilisation/ sitting/ tilt table, sensory stimulation, DVT prevention", 3)],
       "Common complications: respiratory - pneumonia, atelectasis and aspiration (with gastric tube, reduced consciousness); musculoskeletal - spasticity, contractures, heterotopic ossification; skin - pressure ulcers; vascular - deep vein thrombosis; general deconditioning and orthostatic intolerance. Physiotherapy: positioning with the head elevated about 30° and neutral neck to help ICP, regular turning (2-hourly) and pressure care; chest physiotherapy - positioning, gentle percussion/ vibration, suctioning and airway clearance while monitoring ICP; passive range of motion exercises and positioning in anti-spastic postures; splints and serial casting; early mobilisation - sitting out, tilt table - once stable; sensory and coma stimulation; and DVT prevention (exercises, compression with medical prophylaxis)."),
    it("vi. Which scale is used to examine cognitive and behavioural recovery in individuals with TBI?", 1,
       [("Rancho Los Amigos Levels of Cognitive Functioning Scale", 1)],
       "The Rancho Los Amigos Levels of Cognitive Functioning Scale (levels I to VIII/X)."),
    it("vii. What is shaken baby syndrome?", 1,
       [("Abusive head trauma in infants from violent shaking - subdural haemorrhage, retinal haemorrhages, brain injury (DAI)", 1)],
       "Shaken baby syndrome (abusive head trauma) is brain injury in an infant caused by violent shaking, producing acceleration-deceleration forces that cause subdural haemorrhages, retinal haemorrhages and diffuse brain injury, often with no external signs."),
    it("viii. Define neuroplasticity. What are the principles of neuroplasticity?", 5,
       [("Definition: ability of the nervous system to change structure and function in response to experience, learning or injury (reorganisation, new connections)", 1),
        ("Principles (Kleim and Jones): use it or lose it; use it and improve it; specificity; repetition matters; intensity matters; time matters; salience matters; age matters; transference; interference", 4)],
       "Neuroplasticity is the ability of the nervous system to change its structure and function - forming new connections and reorganising - in response to experience, learning, training or injury. Principles of experience-dependent plasticity (Kleim and Jones, 2008): 1. Use it or lose it; 2. Use it and improve it; 3. Specificity - the nature of training determines the change; 4. Repetition matters; 5. Intensity matters; 6. Time matters - different forms occur at different times after injury; 7. Salience matters - training must be meaningful; 8. Age matters - plasticity is greater in younger brains; 9. Transference - plasticity in one training can enhance related behaviours; 10. Interference - plasticity in response to one experience can interfere with acquiring others (e.g. compensation)."),
    it("ix. Since this patient has severe spasticity, which scale will be used to grade the spasticity? Explain the scale.", 5,
       [("Modified Ashworth Scale", 1), ("Grades: 0 no increase; 1 slight increase - catch and release or minimal resistance at end of ROM; 1+ slight increase - catch followed by minimal resistance through < half ROM; 2 more marked increase through most ROM, easily moved; 3 considerable increase, passive movement difficult; 4 rigid in flexion/ extension; method of testing", 4)],
       "The Modified Ashworth Scale (Bohannon and Smith, 1987). The limb is moved passively through its range over about one second, and resistance is graded: 0 - no increase in muscle tone; 1 - slight increase, shown by a catch and release or minimal resistance at the end of the range; 1+ - slight increase, shown by a catch followed by minimal resistance throughout the remainder (less than half) of the range; 2 - more marked increase through most of the range, but the part is easily moved; 3 - considerable increase in tone, passive movement difficult; 4 - affected part rigid in flexion or extension. (The Modified Tardieu Scale is an alternative that tests at different speeds.)"),
    it("x. What are the primitive postures that may be associated with TBI?", 4,
       [("Decorticate posture (flexion of upper limbs, extension of lower limbs - lesion above red nucleus/ cerebral hemispheres, internal capsule)", 2), ("Decerebrate posture (extension and internal rotation of upper limbs, extension of lower limbs - brainstem lesion, worse prognosis); also opisthotonus", 2)],
       "Abnormal (primitive) postures in severe TBI: decorticate rigidity - upper limbs flexed at elbows, wrists and fingers and held to the chest, lower limbs extended and internally rotated, feet plantarflexed - indicating damage above the red nucleus (cerebral hemispheres, internal capsule, thalamus); decerebrate rigidity - upper limbs extended, adducted and internally rotated with pronated forearms, lower limbs extended with plantarflexion, often with neck extension - indicating brainstem (midbrain/ pons) damage and a worse prognosis. Opisthotonus (arching of the back and neck) may also occur."),
    it("xi. During the rehabilitation process, list and explain the roles of the professionals in the multidisciplinary team.", 6,
       [("Any six with roles: physician/ neurosurgeon/ physiatrist (medical management, lead), nurse (care, skin, bladder/ bowel), physiotherapist (mobility, tone, respiratory), occupational therapist (ADLs, cognition, splints, home adaptation), speech-language therapist (communication, swallowing), clinical psychologist/ counsellor (cognition, behaviour, family), dietitian (nutrition via gastric tube), social worker (discharge, support), family/ caregivers", 6)],
       "Neurosurgeon/ physician or rehabilitation physician - medical management, coordinating the team and goals. Nurses - 24-hour care, pressure care, bladder and bowel, medication, tube feeding. Physiotherapist - respiratory care, tone management, mobility, balance, gait, strength and fitness. Occupational therapist - activities of daily living, upper-limb function, cognition and perception, splints, wheelchair and home adaptations. Speech and language therapist - communication, cognitive-communication and swallowing assessment for safe oral feeding. Clinical psychologist/ counsellor - cognitive and behavioural assessment, emotional support and family counselling. Dietitian - nutrition through the gastric tube and transition to oral diet. Social worker - discharge planning, financial and community support, return to work. The patient and family are central members, with orthotists and others as needed."),
    it("xii. What are some physiotherapy strategies to manage spasticity, besides the ones mentioned in the case?", 5,
       [("Any five: positioning (anti-spastic, RIP), sustained prolonged stretching, ROM exercises, weight-bearing (tilt table/ standing), cryotherapy/ heat, electrical stimulation (FES/ antagonist), inhibitory handling/ neurodevelopmental techniques, strengthening antagonists, task-oriented training, hydrotherapy, orthoses (dynamic), combined with botulinum toxin injections", 5)],
       "Besides casts and splints: correct positioning in anti-spastic patterns in bed and chair; slow, sustained prolonged stretching and daily passive/ active-assisted range of motion; weight-bearing through limbs (tilt table, supported standing); cold therapy (ice application) or warmth to reduce tone temporarily; electrical stimulation of antagonist muscles (FES) and TENS; neurodevelopmental (Bobath) inhibitory handling and rhythmic rotation; strengthening antagonists and task-specific functional training; hydrotherapy; dynamic orthoses; and working alongside medical treatments such as botulinum toxin injections, oral antispasticity drugs or intrathecal baclofen, with stretching after injections."),
])
Q += case("physio2024", 2, T, C2, items=[
    it("1. How does the clinical presentation of obstructive disease differ from restrictive disease?", 5,
       [("Obstructive (COPD, asthma): airflow limitation, difficulty expiring, prolonged expiration, wheeze, hyperinflation/ barrel chest, ↓FEV1/FVC (< 0.7), ↑TLC/ RV", 2.5),
        ("Restrictive (ILD, chest wall, neuromuscular): reduced lung volumes/ expansion, rapid shallow breathing, difficulty inspiring, fine crackles, normal/ ↑ FEV1/FVC, ↓TLC, ↓FVC", 2.5)],
       "Obstructive diseases (COPD, asthma, bronchiectasis) reduce airflow, especially during expiration: patients have difficulty breathing out, prolonged expiration, wheezing, cough and sputum, use of accessory muscles and pursed-lip breathing, hyperinflation with a barrel chest and flattened diaphragm; spirometry shows a reduced FEV1/FVC ratio (< 0.7) with normal or increased total lung capacity and increased residual volume. Restrictive diseases (interstitial lung disease, chest wall deformity, obesity, neuromuscular weakness) reduce lung expansion: patients have difficulty breathing in, rapid shallow breathing, reduced chest expansion, fine end-inspiratory crackles in fibrosis; spirometry shows reduced FVC and TLC with a normal or increased FEV1/FVC ratio."),
    it("2. What are breath sounds, and what kinds of abnormal breath sounds can be heard in a patient with COPD?", 5,
       [("Breath sounds: sounds generated by airflow in the airways heard on auscultation - normal vesicular, bronchial, bronchovesicular", 2),
        ("Abnormal in COPD: diminished/ reduced breath sounds (hyperinflation), prolonged expiration, wheezes (polyphonic), coarse crackles (secretions), rhonchi; bronchial breathing if pneumonia/ consolidation", 3)],
       "Breath sounds are the sounds produced by air moving through the tracheobronchial tree, heard with a stethoscope: normal vesicular sounds over most lung fields, bronchial sounds over the trachea, and bronchovesicular sounds over the main bronchi. Abnormal findings in COPD: diminished (reduced) breath sounds because of hyperinflation and air trapping; prolonged expiratory phase; expiratory wheezes (polyphonic) from narrowed airways; coarse (early inspiratory) crackles or rhonchi from secretions; and, after pneumonia, bronchial breath sounds or crackles over consolidated areas."),
    it("3. What would the physiotherapy goals be for this patient during the acute stage and after discharge from hospital?", 5,
       [("Acute: clear secretions, improve ventilation and oxygenation, reduce work of breathing/ dyspnoea, prevent complications (atelectasis, DVT, deconditioning), early mobilisation", 2.5),
        ("Post-discharge: improve exercise tolerance and functional capacity (pulmonary rehabilitation), strength, breathing control/ self-management, airway clearance independence, prevent exacerbations, educate patient and daughter, independence in ADLs, quality of life", 2.5)],
       "Acute stage: clear secretions and maintain airway patency; improve ventilation, lung expansion and oxygenation; reduce the work of breathing and dyspnoea (positioning, breathing control); prevent complications such as atelectasis, pressure sores, DVT and ICU-acquired weakness; begin early mobilisation and restore basic functional mobility. After discharge: improve exercise tolerance and functional capacity through pulmonary rehabilitation; increase muscle strength and endurance; teach breathing control, energy conservation and independent airway clearance; educate her and her daughter on self-management, inhaler use and recognition of exacerbations; prevent readmission; regain independence in daily activities and improve quality of life."),
    it("4. Name at least two exercise testing protocols used for patients with pulmonary disease.", 2,
       [("Any two: six-minute walk test, incremental shuttle walk test (and endurance shuttle walk test), cardiopulmonary exercise testing on cycle ergometer/ treadmill, sit-to-stand test", 2)],
       "Six-minute walk test (6MWT); incremental shuttle walk test (and endurance shuttle walk test); cardiopulmonary exercise testing on a cycle ergometer or treadmill (e.g. modified Bruce protocol); 1-minute sit-to-stand test."),
    it("5. What is dyspnoea, and how do you assess it?", 3,
       [("Definition: subjective experience of breathing discomfort/ shortness of breath", 1),
        ("Assessment: history (onset, triggers, activities), modified Borg scale (0-10) during exercise, mMRC dyspnoea scale (0-4), VAS, CAT/ CRQ; observation - RR, accessory muscles, speech, SpO2", 2)],
       "Dyspnoea is the subjective experience of breathing discomfort or shortness of breath, varying in quality and intensity. Assessment: history (onset, triggers, activities causing it, positions that relieve it); rating scales - the modified Borg (CR-10) scale during activity, the modified Medical Research Council (mMRC) dyspnoea scale for its effect on daily life, a visual analogue scale, and questionnaires such as the COPD Assessment Test; plus observation - respiratory rate, use of accessory muscles, pursed-lip breathing, ability to speak in full sentences and oxygen saturation."),
    it("6. Since this patient was ventilated, what would your physiotherapy management be while she was on the ventilator and after she came off it?", 5,
       [("On ventilator: positioning (head up, side-lying, regular turning), airway clearance (manual hyperinflation, vibrations, suctioning), lung expansion, passive/ active ROM, early mobilisation (sitting, edge of bed) when stable, inspiratory muscle training/ support weaning", 2.5),
        ("Off ventilator: breathing exercises (diaphragmatic, deep breathing, incentive spirometry), ACBT/ huffing and cough, positioning, progressive mobilisation and walking, strengthening, monitoring SpO2, education", 2.5)],
       "On the ventilator: monitor vital signs and ventilator settings; positioning (head of bed up 30-45°, side-lying, regular turning) to improve ventilation-perfusion and prevent aspiration and pressure sores; airway clearance - manual or ventilator hyperinflation, chest wall vibrations and shaking, closed suctioning; passive and active-assisted range of motion; early mobilisation when stable (sitting over the edge of the bed, sitting out); inspiratory muscle training to aid weaning. Off the ventilator: breathing control, deep breathing and diaphragmatic breathing, incentive spirometry, ACBT with huffing and supported coughing; positioning for dyspnoea relief; progressive mobilisation - standing, walking with oxygen as needed; strengthening of limbs; monitoring SpO2 and dyspnoea during activity; and education."),
    it("7. Which scale would you use to measure the functional limitation of this patient?", 2,
       [("e.g. mMRC dyspnoea scale (functional limitation due to breathlessness), or Barthel Index/ FIM for ADLs, CAT, London Chest ADL scale - one named and justified", 2)],
       "The modified Medical Research Council (mMRC) dyspnoea scale (grades 0-4), which rates the functional limitation caused by breathlessness in COPD; ADL limitation can also be measured with the London Chest Activity of Daily Living scale or the Barthel Index."),
    it("8. How do you determine the exercising heart rate to prescribe exercise intensity?", 3,
       [("Karvonen (heart rate reserve) method: THR = [(HRmax - HRrest) x intensity %] + HRrest; HRmax ≈ 220 - age (= 153 for 67 years); intensity 40-60% for COPD; or % HRmax (60-80%); worked example; with RPE/ dyspnoea (Borg 3-4) since beta-agonists/ COPD limit HR use", 3)],
       "Use the Karvonen (heart rate reserve) method: target heart rate = [(HRmax - HRrest) x intensity] + HRrest, where HRmax ≈ 220 - age = 220 - 67 = 153 beats/min. For example, with a resting HR of 80 and intensity 50%: THR = (153 - 80) x 0.5 + 80 ≈ 117 beats/min (range 40-60% for a deconditioned COPD patient). Alternatively, 60-80% of HRmax or heart rate at a given level from an exercise test. In COPD, heart rate may be affected by medication and ventilatory limitation, so intensity is also guided by the Borg dyspnoea or exertion rating (about 3-4 on the 0-10 scale) and SpO2 (keep ≥ 88-90%)."),
    it("9. What is aerobic training? Design an aerobic training protocol for this patient.", 5,
       [("Aerobic training: continuous/ rhythmic large-muscle exercise using oxidative metabolism to improve cardiorespiratory endurance", 1),
        ("FITT protocol: walking/ cycling, 3-5 days/ week, moderate intensity (40-60% HRR or 60-80% of 6MWT speed, Borg 3-4), 20-30 min (start with intervals 5-10 min), warm-up/ cool-down, progression, supplemental O2 if SpO2 < 88%, monitoring", 4)],
       "Aerobic (endurance) training is rhythmic, continuous exercise of large muscle groups that relies on aerobic (oxidative) metabolism, improving cardiorespiratory fitness and endurance. Protocol (FITT): Frequency - 3-5 sessions a week; Intensity - moderate, 40-60% of heart rate reserve or about 60-80% of the walking speed achieved on the 6MWT, guided by Borg dyspnoea 3-4/10 and SpO2 ≥ 88-90% (supplemental oxygen if needed); Time - start with 5-10 minute bouts or interval training (e.g. 1 minute work, 1 minute rest) and build up to 20-30 minutes continuous; Type - walking (ground or treadmill) and stationary cycling. Each session includes a 5-10 minute warm-up and cool-down with breathing control. Progress gradually every 1-2 weeks by increasing duration, then intensity; monitor symptoms, SpO2 and heart rate; continue for at least 8 weeks in a pulmonary rehabilitation programme, with a home walking programme supported by her daughter."),
    it("10. Explain the Active Cycle of Breathing Techniques (ACBT).", 5,
       [("ACBT: flexible cycle of three components - breathing control (relaxed tidal breathing between components), thoracic expansion exercises (deep inspirations with hold/ sniff, may add percussion/ vibration - mobilise secretions via collateral ventilation), forced expiration technique (1-2 huffs mixed with breathing control, from low to high lung volume, then cough)", 4),
        ("Use: airway clearance in COPD/ bronchiectasis, independent, can be done in any position (gravity-assisted), adapted to patient", 1)],
       "The Active Cycle of Breathing Techniques is a flexible airway clearance method combining three components repeated in cycles: (1) Breathing control - gentle, relaxed tidal breathing using the lower chest, between the other components, to prevent fatigue and bronchospasm; (2) Thoracic expansion exercises - 3-4 deep inspirations, with an inspiratory hold or sniff, and relaxed expiration, which increase collateral ventilation to get air behind secretions (percussion or vibration can be added); (3) Forced expiration technique - one or two huffs (forced expirations with an open glottis) from mid to low lung volume to move peripheral secretions, and from high lung volume to clear proximal ones, followed by a cough, always mixed with breathing control. It can be done in sitting or gravity-assisted positions, independently, and is used for COPD and bronchiectasis."),
    it("11. What is long COVID? List some of its symptoms.", 5,
       [("Definition (WHO): post COVID-19 condition - symptoms usually starting within 3 months of infection, lasting ≥ 2 months, not explained by another diagnosis", 2),
        ("Symptoms: fatigue, breathlessness, cough, chest pain, palpitations, cognitive dysfunction ('brain fog'), sleep problems, anxiety/ depression, joint/ muscle pain, loss of smell/ taste, post-exertional malaise, headache", 3)],
       "Long COVID (WHO: post COVID-19 condition) is the continuation or development of new symptoms, usually starting within 3 months of the initial SARS-CoV-2 infection and lasting at least 2 months, that cannot be explained by another diagnosis. Common symptoms: fatigue; shortness of breath; cough; chest pain or tightness; palpitations; cognitive problems ('brain fog', poor memory and concentration); post-exertional malaise; muscle and joint pain; headache; sleep disturbance; anxiety and depression; loss or change of smell and taste; dizziness."),
    it("12. Since this is a 67-year-old woman with COPD, what is she at risk of once she goes home? What would you assess, and how would you manage it?", 5,
       [("Risks: falls (weakness, deconditioning after ICU, steroids, hypoxia), re-exacerbation/ readmission, deconditioning/ sarcopenia, osteoporosis (steroids), reduced ADL independence, anxiety/ depression, social isolation", 2),
        ("Assess and manage: falls risk (TUG, Berg, home hazards), strength/ balance, SpO2/ dyspnoea, ADLs; manage with balance and strengthening, walking aids, home modification, pulmonary rehab, inhaler technique/ action plan, vaccination, caregiver (daughter) education, follow-up", 3)],
       "Risks at home: falls (muscle weakness after ICU stay and steroids, deconditioning, hypoxia, medications, age); further exacerbations and readmission; progressive deconditioning and loss of independence in daily activities; osteoporosis and fractures from steroids; anxiety, depression and social isolation. Assessment: falls risk (Timed Up and Go, Berg Balance Scale, 30-second sit-to-stand, history of falls), lower-limb strength, gait, home environment hazards, ADL function, SpO2 and dyspnoea during activity, and caregiver capacity. Management: balance and lower-limb strengthening exercises, gait training and walking aids if needed; home modifications (remove loose rugs, grab bars, lighting); a graded home walking programme or community pulmonary rehabilitation; breathing control and energy conservation; education on inhaler technique, a COPD action plan for early signs of exacerbation, smoking/ smoke avoidance, vaccination (influenza, pneumococcal); training her daughter; and regular follow-up."),
])
PATTERN = STANDARD
