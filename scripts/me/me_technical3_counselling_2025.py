"""ME Technical Paper III (Subject Specialisation Paper), Clinical Counselling, BCSE 2025 - real paper (PDF sent by the founder).
Pattern (own): Section A Part I 30 MCQ; Part II short questions (20 marks, one set); Section B five compulsory questions x 10 (50).
150 min + 15 min reading. Left out: MCQ 3 (Adler: two options defensible), 4 (learning theory of disulfiram: sources differ),
10 (more than one option arguable); three new MCQs keep Part I at 30.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Clinical Counselling): BCSE 2025, batch 1"
GROUP_TAG = "counsel2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "clinical-counselling"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Clinical Counselling", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Clinical Counselling"

MCQ = r"""[
{
"n": 1,
"stem": "A commercial sex worker receives an educational session regarding safe sexual practices from a health professional. She does not make any immediate change in her attitude or behavior but agrees with the importance of such safe practice. Which of the following phases of Prochaska’s Transtheoretical Model of Change is she in?",
"opts": [
"Preparation",
"Precontemplation",
"Contemplation",
"Maintenance"
]
},
{
"n": 2,
"stem": "All of the following are functions of ego EXCEPT",
"opts": [
"Accommodating the ego ideal",
"Control and regulation of instinctual drives",
"Rational judgement",
"Mediation between the internal world and external reality"
]
},
{
"n": 3,
"stem": "According to Adler, a sense of inadequacy and weakness that is universal and inborn is called?",
"opts": [
"Organ inferiority",
"Birth order theory",
"Inferiority complex",
"Masculine protest"
]
},
{
"n": 4,
"stem": "Which of the following best describes the learning theory behind the efficacy of supervised disulfiram treatment?",
"opts": [
"Aversion theory",
"Negative reinforcement",
"Punishment theory",
"Deterrence theory"
]
},
{
"n": 5,
"stem": "Pema is late for his supervision meeting with his supervisor. After waiting for half an hour at the bus stop, he realizes that all buses in this route have been cancelled due to sudden traffic congestion. He swears and kicks a can of Coke lying on the ground in anger. Which of the following would best explain this behavior?",
"opts": [
"Pema is angry with the litter on the ground",
"Pema is less polite when he is waiting for buses",
"Waiting for buses lead to an increase in blood pressure",
"Frustration is associated with arousal"
]
},
{
"n": 6,
"stem": "According to Maslow’s Hierarchy of Needs Theory, at the times of natural disasters which of the following will be the most appropriate intervention?",
"opts": [
"Provision of food and shelter",
"CBT to enhance self-esteem",
"Group therapy to enhance love and belongingness",
"Behavioral therapy to enhance safety behavior"
]
},
{
"n": 7,
"stem": "Choose the best explanation for the term spirituality:",
"opts": [
"Habitual practice of any religious activity",
"Submission to existence of supreme powers, for example God",
"Deeply held beliefs about the meaning of life",
"Religious orientation without discrimination"
]
},
{
"n": 8,
"stem": "Sick role includes all of the following EXCEPT",
"opts": [
"Taking blame and responsibility for the illness",
"Excuse from social responsibility",
"Expectation to seek help",
"Attempts to restore previous state of health"
]
},
{
"n": 9,
"stem": "Which one of the following is NOT a component of high expressed emotions?",
"opts": [
"Warmth",
"Over involvement",
"Critical comments",
"Enmeshment"
]
},
{
"n": 10,
"stem": "Stigma associated with mental illness could potentially be reduced by all of the following interventions EXCEPT",
"opts": [
"Destigmatization campaigns",
"Increasing community living of severely mentally ill people",
"Educating the public about mental illness",
"Improving broadcasting standards"
]
},
{
"n": 11,
"stem": "A child in school fails test after test. No matter how hard he studies, he fails. Over time he views himself as destined to fail and stops trying. Which one of the following theories best applies to this child’s situation?",
"opts": [
"The epigenetic principle",
"Cognition theory",
"Learned helplessness",
"Sensory deprivation"
]
},
{
"n": 12,
"stem": "Which of the following is not a goal of family therapy?",
"opts": [
"Improving communication",
"Improving agreement on roles of each member",
"Improving cognitive style",
"Decreasing distress in the member considered to be the patient"
]
},
{
"n": 13,
"stem": "Which of the following approaches have shown to be the most effective in bulimia nervosa?",
"opts": [
"Cognitive Behavioral Therapy",
"Interpersonal psychotherapy (IPT)",
"Psychodynamic psychotherapy",
"Family therapy"
]
},
{
"n": 14,
"stem": "Parent management training (used to help parents manage their child’s behavioral problems) is based on the principles of?",
"opts": [
"Psychoanalysis",
"Learning theory",
"Systems theory of family therapy",
"Object relations theory"
]
},
{
"n": 15,
"stem": "Which of the following is the first step in systematic desensitization?",
"opts": [
"Constructing a hierarchy",
"Relaxation training",
"Exposure in vivo",
"Exposure in vitro"
]
},
{
"n": 16,
"stem": "Habit reversal components include all the following EXCEPT:",
"opts": [
"Training to be aware of onset",
"Training in thought stopping",
"Training in initiating competing response",
"Relaxation"
]
},
{
"n": 17,
"stem": "Token economy programs are based on which of the following psychological principle?",
"opts": [
"Classical conditioning",
"Operant conditioning",
"Vicarious learning",
"Aversive conditioning"
]
},
{
"n": 18,
"stem": "A counselor at an early stage of his initial assessment interview asks the patient, ‘Can you tell me about your depression?’ Which of the following interview techniques is he utilizing?",
"opts": [
"Closed-ended questions",
"Reflecting",
"Open-ended questions",
"Facilitation"
]
},
{
"n": 19,
"stem": "Which of the following is the single best question to discern premorbid personality of a patient?",
"opts": [
"How would you describe yourself?",
"How would your friends describe you?",
"If we had met 10 years ago, what sort of person would I be talking to?",
"None of the above"
]
},
{
"n": 20,
"stem": "A patient looks disheveled, with unkempt hair and dirty, unwashed clothes. Self-neglect is commonly noted in all of the following EXCEPT",
"opts": [
"Alcoholism",
"Social phobia",
"Depression",
"Dementia"
]
},
{
"n": 21,
"stem": "During a clinical interview the following statement is made by the clinician: ‘So you have been anxious since these changes occurred at your work place.’ Which of the following interview technique best describes the above statement?",
"opts": [
"Reflecting",
"Facilitation",
"Closed-ended question",
"Interpretation"
]
},
{
"n": 22,
"stem": "Which one of the following is NOT an advisable first response when a patient discloses past sexual abuse at a clinical encounter?",
"opts": [
"Ask if she wants to say anything more about this now",
"Postpone discussing the issue",
"Ask if she has ever disclosed this to anyone",
"Ask if she sees a link between this and her current difficulties"
]
},
{
"n": 23,
"stem": "A counselor has been having sexual fantasies about one of his psychotherapy patients. He tells you this and gives you several reasons the prohibition of sex with patients does not apply to this situation. Which of the following would be the most ethical advice you could give him?",
"opts": [
"He should continue to discuss the situation with colleagues to better define his sexual boundaries",
"He should see the patient more frequently to use the strong feelings between them as a motivational tool for positive change in therapy",
"He should transfer the patient’s care to another counselor",
"He should stock his desk with condoms so that if they have sex in his office, she does not become pregnant"
]
},
{
"n": 24,
"stem": "Infantile secure attachment is associated with which of the following outcomes?",
"opts": [
"Higher intellectual ability in adolescence and adulthood",
"Educational success throughout childhood and adolescence",
"Physical coordination and later athletic ability",
"Emotional and social competence"
]
},
{
"n": 25,
"stem": "The acronym ‘FRAMES’ in brief intervention for alcohol dependence stands for all EXCEPT:",
"opts": [
"Feedback",
"Roll with resistance",
"Advice",
"Empathic interviewing"
]
},
{
"n": 26,
"stem": "Which of the following interventions has the most robust evidence for preventing suicide?",
"opts": [
"Restricting access to lethal methods",
"Media reporting guidelines for suicide",
"Public education campaigns about suicide",
"Screening interventions within high schools"
]
},
{
"n": 27,
"stem": "Which one of the following structures is most critical to the formation of memory?",
"opts": [
"Right frontal lobe",
"Right parietal lobe",
"Thalamus",
"Hippocampus"
]
},
{
"n": 28,
"stem": "Which of the following is not associated with attention-deficit hyperactivity disorder (ADHD)?",
"opts": [
"Reduced school performance.",
"Poorer occupational performance and attendance.",
"Higher probability of unemployment.",
"Reduced risk of substance use disorders"
]
},
{
"n": 29,
"stem": "All of the following are core pillars of the PEMA Secretariat EXCEPT:",
"opts": [
"Prevention and Engagement Programs",
"Response Services",
"Digital Innovation and Export Promotion",
"Reintegration and Aftercare Programs"
]
},
{
"n": 30,
"stem": "Closed questions are best avoided in which of the following scenarios?",
"opts": [
"A patient with suspected malingering",
"A guarded patient not answering spontaneously",
"A suggestible patient with learning difficulty",
"A psychotic patient who is actively hallucinating"
]
}
]"""

KEY = {
    1: ("c", "Agreeing change is important without acting yet = contemplation."), 2: ("a", "The ego ideal belongs to the superego."),
    5: ("d", "Frustration raises arousal and aggression (frustration-aggression)."), 6: ("a", "Basic physiological needs come first after disasters."),
    7: ("c", "Spirituality: deeply held beliefs about life's meaning."), 8: ("a", "The sick person is not blamed for the illness."),
    9: ("a", "Warmth is not part of high expressed emotion (criticism, hostility, over-involvement are)."), 11: ("c", "Repeated uncontrollable failure → learned helplessness."),
    12: ("c", "Family therapy works on communication, roles and distress, not individual cognitive style."), 13: ("a", "CBT (CBT-BN) has the best evidence for bulimia."),
    14: ("b", "Parent management training is based on learning theory."), 15: ("b", "Relaxation training comes first."), 16: ("b", "Thought stopping is not part of habit reversal."),
    17: ("b", "Token economies use operant conditioning."), 18: ("c", "An open-ended question."), 19: ("c", "Asking about the person years earlier taps premorbid personality."),
    20: ("b", "Self-neglect is not typical of social phobia."), 21: ("a", "Restating the feeling and content is reflecting."),
    22: ("b", "Postponing can feel dismissive; acknowledge and explore gently."), 23: ("c", "Transfer care and seek supervision to protect the patient."),
    24: ("d", "Secure attachment predicts emotional and social competence."), 25: ("b", "FRAMES: Feedback, Responsibility, Advice, Menu, Empathy, Self-efficacy - not 'roll with resistance'."),
    26: ("a", "Means restriction has the strongest evidence."), 27: ("d", "The hippocampus is central to forming memories."), 28: ("d", "ADHD increases, not reduces, substance-use risk."),
    29: ("c", "Digital innovation and export promotion is not a PEMA pillar."), 30: ("c", "Closed (leading) questions mislead suggestible patients."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "Which of the following is NOT one of Carl Rogers' core conditions for therapy?", ["Empathy", "Unconditional positive regard", "Congruence", "Interpretation"], "d", "Rogers' core conditions: empathy, unconditional positive regard, congruence."),
    new_mcq(2, T, "Cognitive therapy for depression was developed by", ["Sigmund Freud", "Aaron Beck", "Carl Jung", "B. F. Skinner"], "b", "Aaron Beck."),
    new_mcq(3, T, "In motivational interviewing, the skills summarised as OARS are", ["Open questions, Affirmations, Reflective listening, Summarising", "Observe, Advise, Refer, Support", "Orientation, Assessment, Review, Supervision", "Openness, Acceptance, Respect, Sympathy"], "a", "OARS = open questions, affirmations, reflections, summaries."),
]
P2 = [
    ("Part II 1(i). Discuss three ways to enhance the therapeutic relationship.", 3, "Any three: empathy and active listening; unconditional positive regard and a non-judgemental attitude; genuineness/congruence; confidentiality and clear boundaries; collaboration on goals; cultural sensitivity; consistency and reliability."),
    ("Part II 1(ii). List four risks you need to routinely assess for a psychiatric patient. (0.5 × 4)", 2, "Risk of suicide/self-harm; risk of harm to others (violence); risk of self-neglect; risk of vulnerability/exploitation or abuse (also absconding, substance misuse, non-adherence)."),
    ("Part II 2. Outline the general principles of administering psychotherapy.", 5, "Assessment and formulation; informed consent and clear goals; a safe therapeutic alliance (empathy, warmth, genuineness); confidentiality and boundaries; structured sessions with agreed frequency and duration; choosing an evidence-based approach suited to the client; collaboration and homework; monitoring progress and outcomes; managing transference/countertransference with supervision; planned ending and relapse prevention; cultural sensitivity."),
    ("Part II 3.1. Identify the most probable psychological process and describe how you would respond: \"Are you really a counselor? What are your qualifications?\"", 2, "Process: anxiety and mistrust/testing the therapist (possible resistance). Response: stay calm and non-defensive, briefly state your role and training, acknowledge it is reasonable to want to know, and explore what worries them about getting help."),
    ("Part II 3.2. Identify the most probable psychological process and describe how you would respond: \"Are you married? How many children do you have?\"", 2, "Process: curiosity, attempt to equalise the relationship/test boundaries (possible transference). Response: politely and warmly keep boundaries with limited or no self-disclosure, explore the meaning of the question, and redirect to the client's concerns."),
    ("Part II 3.3. Identify the most probable psychological process and describe how you would respond: \"You appear really attractive, how about meeting towards the evening for a coffee?\"", 2, "Process: erotic/positive transference and boundary violation. Response: clearly and kindly decline, restate professional boundaries, explore the feelings in therapy, document and seek supervision; transfer care if needed."),
    ("Part II 3.4. Identify the most probable psychological process and describe how you would respond: \"I don't think this is going to help. Nothing ever works for me.\"", 2, "Process: hopelessness, low motivation/resistance (possibly depressive cognition or learned helplessness). Response: empathise, explore past experiences, highlight small strengths and successes, set achievable goals collaboratively, use motivational interviewing, assess suicide risk."),
    ("Part II 3.5. Identify the most probable psychological process and describe how you would respond: \"You are so polite as a counselor. You remind me of my grandfather.\"", 2, "Process: positive transference (feelings about the grandfather transferred to the counsellor). Response: accept warmly, explore the relationship with the grandfather and what it means, use it therapeutically while keeping boundaries; watch your own countertransference."),
]
for i, (s, mk, mod) in enumerate(P2):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=mk, topic=T, group="me-technical-3-counsel2025-part2", pos=i + 1,
                  stem=f"{s} ({mk} marks)", key_points=[(mod, mk)], model=mod))
B = [
    ("""A 10-year-old boy is referred from school to you with poor scholastic performance. You suspect child abuse in this case.
a) Define child abuse. (2 marks)
b) List four common types of child abuse. (2 marks)
c) List four clinical features that would suggest child abuse in this case. (2 marks)
d) Discuss how you would manage this case. (4 marks)""",
     [("a) Any act or failure to act by a caregiver causing actual or potential harm to a child's health, development or dignity (WHO)", 2), ("b) Physical, sexual, emotional/psychological abuse, neglect", 2), ("c) Unexplained injuries, fearfulness/withdrawal, sudden school decline, regression, sexualised behaviour, poor hygiene", 2), ("d) Safety first, child-friendly interview, document, medical exam, report to child protection/police per law, MDT, counselling and family work, follow-up", 4)],
     """a) Child abuse is any form of physical, sexual or emotional ill-treatment, neglect or exploitation by a parent, caregiver or other person in a position of trust that results in actual or potential harm to the child's health, survival, development or dignity (WHO).
b) Physical abuse, sexual abuse, emotional (psychological) abuse and neglect (also exploitation).
c) Any four: unexplained or repeated injuries (bruises, burns); fearfulness, withdrawal or aggression; sudden drop in school performance and attendance; regression (bed-wetting), sleep problems; age-inappropriate sexual knowledge or behaviour; poor hygiene, hunger, untreated illness.
d) Ensure the child's immediate safety; build rapport and interview gently in a child-friendly way without leading questions; document findings accurately; arrange medical examination; follow mandatory reporting - inform the child protection system (e.g. NCWC/RENEW/police as per Bhutan's Child Care and Protection Act); involve a multidisciplinary team (doctor, school, social worker); provide trauma-focused counselling and support to the child and non-abusing family; safety plan and follow-up."""),
    ("""a) As a clinical counsellor working in a district, you plan to screen people in your community. List the most appropriate screening tools for: (i) depression; (ii) anxiety disorder; (iii) postpartum depression; (iv) autism; (v) attention deficit hyperactivity disorder. (5 marks)
b) Design a psychoeducation session plan for the general public on anxiety that clearly explains the differences between normal anxiety and anxiety disorder. Include objectives, key messages and teaching methods. (5 marks)""",
     [("a) PHQ-9, GAD-7, EPDS, M-CHAT(-R), Vanderbilt/Conners (1 each)", 5), ("b) Objectives, key messages (normal anxiety vs disorder: intensity, duration, impairment; treatment works; where to get help), methods (talk, stories, role play, leaflets, Q&A), evaluation", 5)],
     """a) (i) Depression - PHQ-9; (ii) anxiety - GAD-7; (iii) postpartum depression - Edinburgh Postnatal Depression Scale (EPDS); (iv) autism - M-CHAT-R/F (for toddlers); (v) ADHD - Vanderbilt ADHD rating scales (or Conners).
b) Objectives: participants can describe anxiety, tell normal anxiety from an anxiety disorder, use simple coping skills and know where to seek help. Key messages: anxiety is a normal, short-lived response to stress that can help us; it becomes a disorder when it is excessive, lasts weeks to months, is out of proportion and disrupts daily life (sleep, work, relationships), sometimes with panic attacks; anxiety disorders are common and treatable (counselling/CBT, medicines); healthy habits help - breathing and relaxation, exercise, sleep, less alcohol and caffeine; seek help at the nearest health centre or helpline. Methods: short talk with local examples, stories/case vignettes, demonstration of breathing exercise, group discussion, leaflets in Dzongkha/English, Q&A; evaluate with a short quiz or feedback (about 45-60 minutes)."""),
    ("""A 28-year-old man presents to you two weeks after the sudden death of his younger brother. During the interview, he expresses intense irritability and anger, blaming the hospital staff for not doing enough to save his brother. He frequently lashes out at family members and co-workers, saying, "No one understands what I'm going through."
a) Identify the psychological stage of grief this patient is experiencing. (1 mark)
b) Describe the key features of this stage of grief. (2 marks)
c) How would you therapeutically approach and manage a person in this stage of grief? (4 marks)
d) Explain transference and countertransference with the help of an example each. (3 marks)""",
     [("a) Anger (Kübler-Ross)", 1), ("b) Irritability, blame of others/self/God, feelings of injustice, outbursts, isolation", 2), ("c) Empathic listening, normalise anger, safe expression, no arguing, support coping and routines, involve family, assess risk, follow-up/referral if complicated", 4), ("d) Transference: client's feelings toward past figures directed at therapist (example); countertransference: therapist's feelings toward client (example)", 3)],
     """a) The anger stage (Kübler-Ross: denial, anger, bargaining, depression, acceptance).
b) Strong irritability and anger; blaming others (doctors, family, God) or self; feelings of injustice ("why him?"); outbursts and conflicts; feeling misunderstood and withdrawing.
c) Provide a safe, non-judgemental space and listen empathically; normalise anger as part of grief without taking it personally or arguing; help him express it safely (talking, writing, physical activity, rituals); explore the loss and memories of his brother; encourage family and social support, sleep and routine; help him direct concerns about care through proper channels if needed; assess for risk (aggression, self-harm, substance use) and for complicated grief or depression; arrange follow-up and refer if needed.
d) Transference: the client unconsciously directs feelings about important past people onto the counsellor - e.g. he becomes angry with the counsellor as he is with the hospital staff, or treats a counsellor like his late brother. Countertransference: the counsellor's own emotional reaction to the client - e.g. feeling defensive or irritated by his anger, or over-protective because the counsellor also lost a sibling; recognised and handled through self-reflection and supervision."""),
    ("""You are part of a multidisciplinary team conducting a screening programme for non-communicable diseases. Patient A is a chronic tobacco user who wishes to quit but has had several unsuccessful attempts. Patient B is a chronic tobacco user who is not willing to quit at this time. Using the 5As and 5Rs tobacco cessation intervention models, answer the following:
a) Discuss the appropriate management plan for Patient A. (5 marks)
b) Discuss the appropriate management plan for Patient B. (5 marks)""",
     [("a) 5As: Ask, Advise, Assess readiness, Assist (quit date, plan, NRT/medication, coping, learn from past attempts), Arrange follow-up", 5), ("b) 5Rs motivational: Relevance, Risks, Rewards, Roadblocks, Repetition; respect autonomy, leave door open, revisit at every visit", 5)],
     """a) Patient A (ready to quit) - 5As: Ask about tobacco use at every visit; Advise clearly and personally to quit; Assess readiness (willing now) and dependence; Assist - set a quit date, review why past attempts failed and plan for triggers and withdrawal, offer pharmacotherapy (nicotine replacement and other medicines where available), behavioural counselling, family support and quitline; Arrange follow-up within the first week and regularly after, treating slips as learning.
b) Patient B (not ready) - 5Rs motivational intervention: Relevance (why quitting matters to him personally - health, family, money); Risks of continuing (cancer, heart disease, harm to family); Rewards of quitting (health, savings, smell and taste, example to children); Roadblocks (withdrawal, stress, peers) and how to overcome them; Repetition at every contact. Use a respectful motivational-interviewing style, avoid argument, give information, and offer help whenever he is ready."""),
    ("""A 35-year-old female has been admitted to the psychiatric ward with mania. She is a diagnosed case of bipolar disorder who had defaulted treatment for the past two weeks. After initial stabilisation, she has improved, and you are now conducting a psychoeducation session with her and her family members.
a) Define psychoeducation. (1 mark)
b) Outline the steps involved in providing psychoeducation to this patient and her family members. (4 marks)
c) Discuss five key points you would convey to this patient and her family members during the session. (2.5 marks)
d) Discuss the role of counsellors in the initial management of mania. (2.5 marks)""",
     [("a) Structured education about the illness and its treatment to patients and families to improve coping and adherence", 1), ("b) Steps: rapport and assessment of knowledge; explain illness; treatment and adherence; early warning signs and relapse plan; involve family; check understanding and follow-up", 4), ("c) Five points (0.5 each): nature of bipolar disorder; medicines must be continued; early warning signs; avoid alcohol/drugs, regular sleep; stress management and family support, follow-up", 2.5), ("d) Calm, low-stimulation environment, de-escalation, safety and risk assessment, support adherence, involve family, liaise with team", 2.5)],
     """a) Psychoeducation is a structured, two-way educational intervention that gives patients and families information about the illness, its treatment and self-management, to improve understanding, adherence and coping and to prevent relapse.
b) Build rapport and assess what they already know and believe; explain bipolar disorder (mood episodes, causes, chronic but treatable course); explain treatment (mood stabilisers, why defaulting led to relapse, side effects); teach early warning signs and agree a relapse-prevention plan; discuss lifestyle and the family's role; answer questions, check understanding, give written material and arrange follow-up sessions.
c) Bipolar disorder is a medical illness, not anyone's fault; medicines must be taken regularly even when well - stopping causes relapse; early warning signs (reduced sleep, overactivity, irritability, overspending) need early contact with the team; regular sleep, no alcohol or drugs, stress management; family support without criticism, and regular follow-up.
d) In acute mania counsellors help create a calm, low-stimulation environment, use de-escalation and simple, clear communication, assess risk (aggression, sexual disinhibition, overspending, self-harm), support medication adherence, support and educate the family, and communicate observations to the psychiatric team; formal therapy waits until the patient is stable."""),
]
for i, (s, kp, mod) in enumerate(B):
    Q.append(dict(key=f"B{i + 1}", real=True, type="long_answer", marks=10, topic=T, stem=f"Section B, question {i + 1}. " + s, key_points=kp, model=mod))
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions", "type": "short_answer", "count": 1, "marks_each": 20, "answer_any": None},
    {"title": "Section B: Five compulsory questions", "type": "long_answer", "count": 5, "marks_each": 10, "answer_any": None},
]
