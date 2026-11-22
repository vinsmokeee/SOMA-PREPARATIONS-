"""ME Technical Paper III (Subject Specialisation Paper), Clinical Counselling, BCSE 2024 - real paper (PDF sent by the founder).
Same layout as the 2025 paper (the latest): Section A Part I 30 MCQ; Part II short questions (20 marks, one set);
Section B five compulsory questions x 10 (50). Section B sub-questions numbered 1, 2, ... are shown as a), b), ...; in question 1 the first two
one-mark parts (diagnosis, missing information) are combined into a) because of the five-part limit.
Left out: MCQs 1 (attachment - sources differ on option b), 16 (first step of crisis intervention - sources differ),
19 (screening tool in Bhutan's MCH Handbook - could not be confirmed), 24 (timing of peak synapse formation - sources
differ); four new MCQs keep Part I at 30.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1"
GROUP_TAG = "counsel2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "clinical-counselling"
ADDS_TO_PAPER = True  # 2025 is the latest Clinical Counselling paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Clinical Counselling"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following statements about attachment theory is INCORRECT?",
"opts": [
"Abused children do not develop attachments to their abusive parents.",
"The attachment of the first-born child is decreased by the birth of a second.",
"Separation anxiety occurs by 10–18 months of age.",
"Children brought up in extended families or with multiple caregivers are able to establish many attachments."
]
},
{
"n": 2,
"stem": "During a mental status examination, a patient states, “When I hear the news, the newscaster is talking about me.” This statement best represents which of the following?",
"opts": [
"Ideas of reference",
"Paranoia",
"Overvalued idea",
"Thought insertion"
]
},
{
"n": 3,
"stem": "Which of the following is a technique for automatic thought modification?",
"opts": [
"Guided discovery",
"Recognizing mood shifts",
"Checklists for automatic thoughts",
"Examining the evidence"
]
},
{
"n": 4,
"stem": "Which of the following statements is true with regard to factitious Disorder?",
"opts": [
"It is synonymous with malingering",
"The patient’s goal is to assume and maintain the sick role",
"The patient’s goal is to avoid unpleasant consequences or work",
"Patients visit to OPDs often but rarely are hospitalized"
]
},
{
"n": 5,
"stem": "Which of the following treatments is contraindicated in the initial treatment of a patient experiencing domestic violence?",
"opts": [
"Group psychotherapy",
"Individual psychotherapy",
"Conjoint marital therapy",
"Psychopharmacology"
]
},
{
"n": 6,
"stem": "Which of the following statements about the development and course of autism spectrum disorder (ASD) is false?",
"opts": [
"Symptoms of ASD are typically recognized during the second year of life (12–24 months of age).",
"Symptoms of ASD are usually not noticeable until 5–6 years of age or later.",
"First symptoms frequently involve delayed language development, often accompanied by lack of social interest or unusual social interactions.",
"ASD is not a degenerative disorder, and it is typical for learning and compensation to continue throughout life."
]
},
{
"n": 7,
"stem": "Social anxiety disorder (social phobia) differs from normative shyness in that the disorder leads to which of the following?",
"opts": [
"Social or occupational dysfunction.",
"Marked social reticence.",
"Avoidance of social situations.",
"Pervasive social deficits with poor insight."
]
},
{
"n": 8,
"stem": "A doctor who smokes, accepts that smoking is beneficial because it inhibits the development of obesity is which of the following “defence” mechanisms?",
"opts": [
"Dissociation",
"Intellectualization",
"Rationalization",
"Reaction formation"
]
},
{
"n": 9,
"stem": "Which of the following statements concerning suicide are correct?",
"opts": [
"The ratio of suicides with a fatal outcome decreases with age",
"Women die from suicide more often than men",
"A suicide can reliably be predicted by certain clinical features",
"A conversation with the patient about his / her ideals of suicide may protect the patient from being a potential victim"
]
},
{
"n": 10,
"stem": "Which of the following is NOT a facilitative message?",
"opts": [
"‘Run on’ question",
"Self-disclosure",
"Silence",
"Interpretation"
]
},
{
"n": 11,
"stem": "Which of the following is a supportive intervention during a clinical interview process?",
"opts": [
"Open-ended questions",
"Acknowledgement of affect",
"Taking a medical history",
"Summarization"
]
},
{
"n": 12,
"stem": "A therapist is assigned a new patient in his clinic. While looking at the materials the patient filled out in the waiting area, the therapist finds out that the patient has a substance abuse history. He immediately says, “Stupid drug addicts, they’re so annoying. They’re such a waste of time. They never want to get better.” This is an example of:",
"opts": [
"Projection",
"Transference",
"Countertransference",
"Confrontation"
]
},
{
"n": 13,
"stem": "One of your patients of the opposite sex begins to act seductively and proceeds to ask you out for dinner. Which one of the following would be an appropriate response?",
"opts": [
"Ignore the patient’s advances",
"Compliment the patient on the way she or he is dressed",
"Examine your own countertransference and explore the meaning of the patient’s behaviour",
"Have sex with the patient and then make the patient find a new doctor"
]
},
{
"n": 14,
"stem": "Which one of the following is not a major problem area addressed by interpersonal psychotherapy?",
"opts": [
"Cognitive distortions",
"Grief and loss",
"Role transitions",
"Relational role disputes"
]
},
{
"n": 15,
"stem": "Which of the following domains of cognition is tested by administering Serial Sevens Test?",
"opts": [
"Short-term memory",
"Attention",
"Registration",
"Recall"
]
},
{
"n": 16,
"stem": "Which of the following is the first step involved in crisis intervention?",
"opts": [
"Patient is encouraged to consider solutions",
"Assess the patient’s problems and assets",
"Reduce arousal",
"Consider future coping mechanisms"
]
},
{
"n": 17,
"stem": "A patient with a fear of spiders is put in a room with many spiders, and immediately a live tarantula is placed on his hand for as long as necessary until the dissipation of his anxiety. This behavioural technique is called:",
"opts": [
"Graded exposure",
"Aversion therapy",
"Flooding",
"Modeling"
]
},
{
"n": 18,
"stem": "Which of the following is considered to be the most important therapeutic factor in group psychotherapy?",
"opts": [
"Ventilation of affect",
"Pairing",
"Cohesion",
"Discussion"
]
},
{
"n": 19,
"stem": "Which of the following tools is included in the latest available version of the Maternal and Child Health Handbook to screen perinatal depression in Bhutan?",
"opts": [
"Patient Health Questionnaire (PHQ-9)",
"Center for Epidemiologic Studies Depression Scale (CES-D)",
"Beck Depression Inventory II (BDI-II).",
"The Edinburgh Postnatal Depression Scale (EPDS)"
]
},
{
"n": 20,
"stem": "Habit reversal is a type of therapy indicated for:",
"opts": [
"Developmental coordination disorder",
"Trichotillomania",
"OCD",
"Intermittent explosive disorder"
]
},
{
"n": 21,
"stem": "Which one of the following is not a feature of malingering?",
"opts": [
"Findings are compatible with self-inflicted injuries",
"Medical records may have been tampered with or altered",
"Family members are able to verify the consistency of symptoms",
"Symptoms are vague or ill defined"
]
},
{
"n": 22,
"stem": "Therapy that is focused on the measurement of autonomic processes and teaching patients to gain voluntary control over these physiological parameters through operant conditioning is called:",
"opts": [
"Stimulus–response therapy",
"Biofeedback",
"Relaxation training",
"Desensitization"
]
},
{
"n": 23,
"stem": "Which one of the Kübler-Ross stages of reaction to impending death corresponds to a period in which a patient goes through self-blame for his or her illness and asks “Why me?”",
"opts": [
"Shock and denial",
"Anger",
"Bargaining",
"Depression"
]
},
{
"n": 24,
"stem": "The highest rate of synapse formation in the brain takes place during which one of the following time periods?",
"opts": [
"Adolescence",
"Weeks 32 to 35 of gestation",
"Weeks 13 to 26 of gestation",
"As a toddler"
]
},
{
"n": 25,
"stem": "You are evaluating a 7-year-old patient who is brought in by his parents because of complaints they have been receiving from school. The child has been sexually provocative with other children, sexualizes play activities, and openly displays sexual behaviour. The most likely cause of this behaviour is:",
"opts": [
"Normal development",
"Early-onset puberty",
"Traumatic brain injury",
"Sexual abuse"
]
},
{
"n": 26,
"stem": "A patient presents to the emergency room because of alcohol withdrawal. He and his family describe a history of alcohol-induced blackouts. Which one of the following memory problems is most consistent with alcohol-induced blackouts?",
"opts": [
"Making up details of how he got to work 3 days ago",
"Retrograde amnesia",
"Anterograde amnesia",
"Loss of memories from his daughter’s birthday 5 years ago"
]
},
{
"n": 27,
"stem": "What is the best way to handle suicidal patients with borderline personality disorder?",
"opts": [
"Take the threats seriously and take whatever steps are necessary to protect these patients",
"Do not discuss suicide with them",
"Isolate these patients from friends and family",
"Make these patients promise not to hurt themselves (contract for safety)"
]
},
{
"n": 28,
"stem": "You are attending a ward round in the psychiatry ward. A patient with depression is planned for electroconvulsive therapy (ECT). Before initiating treatment, the psychiatrist obtains informed consent from the patient and her attendant. This is an example of which of the following ethical principles?",
"opts": [
"Competence",
"Justice",
"Autonomy",
"Nonmaleficence"
]
},
{
"n": 29,
"stem": "Habitual consumption of paracetamol to relieve headache is related to which one of the following phenomena?",
"opts": [
"Aversion",
"Positive reinforcement",
"Classical conditioning",
"Negative reinforcement"
]
},
{
"n": 30,
"stem": "After breaking up with her boyfriend, Yangchen says, “I don’t think I have control over what is happening in my life”. Which of the following statements would describe Yangchen?",
"opts": [
"She is a person with a great sense of direction",
"She is a person with an external locus of control",
"She is a person with an internal locus of control",
"She is a person who has achieved self-actualization"
]
}
]"""

KEY = {
    2: ("a", "Believing that unrelated external events (the news) refer to oneself is an idea of reference."),
    3: ("d", "Examining the evidence for and against a thought is a core technique to modify automatic thoughts (guided discovery and checklists help identify them)."),
    4: ("b", "In factitious disorder the goal is to assume the sick role, not external gain (that is malingering)."),
    5: ("c", "Conjoint (couples) therapy is contraindicated early in domestic violence: it can endanger the victim and implies shared blame."),
    6: ("b", "ASD symptoms are usually recognised in the second year of life, not first at 5-6 years - so b is false."),
    7: ("a", "Social anxiety disorder causes clinically significant distress or social/occupational dysfunction; shyness does not."),
    8: ("c", "Giving a plausible but false justification for unacceptable behaviour is rationalisation."),
    9: ("d", "Asking directly about suicidal ideas does not increase risk and can be protective; men die by suicide more often and risk rises with age."),
    10: ("a", "A 'run-on' (multiple, stacked) question confuses the patient and is not facilitative."),
    11: ("b", "Acknowledging the patient's emotions is a supportive intervention."),
    12: ("c", "The therapist's own negative emotional reaction to the patient is countertransference."),
    13: ("c", "Maintain boundaries: examine your countertransference and explore the meaning of the behaviour with the patient."),
    14: ("a", "IPT focuses on grief, role disputes, role transitions and interpersonal deficits - not cognitive distortions (CBT)."),
    15: ("b", "Serial sevens tests attention and concentration."),
    17: ("c", "Immediate, prolonged exposure to the most feared stimulus is flooding."),
    18: ("c", "Group cohesion is considered the most important therapeutic factor (Yalom)."),
    20: ("b", "Habit reversal training is a first-line therapy for trichotillomania (and tics)."),
    21: ("c", "In malingering, family members usually cannot confirm consistent symptoms - so c is not a feature."),
    22: ("b", "Biofeedback measures autonomic signals and teaches voluntary control using operant conditioning."),
    23: ("b", "In the anger stage the patient asks 'Why me?', directing anger at self or others."),
    25: ("d", "Age-inappropriate sexualised behaviour in a young child strongly suggests sexual abuse."),
    26: ("c", "Alcohol blackouts are anterograde amnesia - inability to form new memories during intoxication."),
    27: ("a", "Suicidal threats in borderline personality disorder must always be taken seriously with steps to ensure safety; no-harm contracts are not reliable."),
    28: ("c", "Informed consent respects the patient's autonomy."),
    29: ("d", "Taking paracetamol removes the unpleasant headache, so the behaviour is strengthened by negative reinforcement."),
    30: ("b", "Believing life is controlled by outside forces is an external locus of control."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "Logotherapy, which helps clients find meaning in life, was developed by", ["Viktor Frankl", "Albert Ellis", "Fritz Perls", "Eric Berne"], "a",
            "Viktor Frankl founded logotherapy ('Man's Search for Meaning')."),
    new_mcq(2, T, "Selective serotonin reuptake inhibitors (SSRIs) mainly increase the availability of", ["dopamine", "serotonin", "GABA", "acetylcholine"], "b",
            "SSRIs block serotonin reuptake, increasing serotonin in the synapse."),
    new_mcq(3, T, "Systematic desensitisation, pairing relaxation with a graded hierarchy of feared situations, was developed by", ["Joseph Wolpe", "Ivan Pavlov", "Aaron Beck", "Carl Rogers"], "a",
            "Joseph Wolpe developed systematic desensitisation based on reciprocal inhibition."),
    new_mcq(4, T, "Rational Emotive Behaviour Therapy (REBT), using the ABC model, was developed by", ["Albert Ellis", "Sigmund Freud", "Abraham Maslow", "Donald Meichenbaum"], "a",
            "Albert Ellis: Activating event - Beliefs - Consequences."),
]
P2 = [
    ("Part II 1. List four common myths and facts about suicide. (0.5 × 4)", 2,
     "Myth: talking about suicide puts the idea in someone's head - Fact: asking directly reduces risk and opens help. Myth: people who talk about suicide won't do it - Fact: most people who die by suicide gave warning signs. Myth: suicide happens without warning - Fact: there are usually signs (talk of death, giving away belongings, withdrawal). Myth: once suicidal, always suicidal / nothing can be done - Fact: suicidal crises are often temporary and suicide is preventable with help. (Also: myth that only people with mental illness die by suicide; myth that improvement means the danger has passed.)"),
    ("Part II 2. List four common clinical features of antisocial personality disorder. (0.5 × 4)", 2,
     "Any four: repeated violation of the rights of others and of laws (repeated arrests); deceitfulness and lying, conning others; impulsivity and failure to plan; irritability and aggressiveness, fights and assaults; reckless disregard for the safety of self or others; consistent irresponsibility (work, finances); lack of remorse; onset with conduct disorder before age 15, diagnosed at age 18 or above."),
    ("Part II 3. Define transference.", 1,
     "Transference is the unconscious redirection by a client onto the therapist of feelings, attitudes and expectations originally felt towards important people in the client's past (e.g. a parent)."),
    ("Part II 4. Discuss some of the salient points you need to consider in a psychiatric interview.", 5,
     "Setting: private, quiet, safe room with seating arrangement allowing safety; introduce yourself, explain purpose, confidentiality and its limits, and obtain consent. Build rapport with empathy, respect and a non-judgemental attitude; use open-ended questions first, then closed questions to clarify; active listening, facilitation, summarising; avoid leading and multiple questions. Cover: presenting complaints, history of present illness, past psychiatric and medical history, substance use, family history, personal and social history, premorbid personality, forensic history; mental status examination; risk assessment (suicide, harm to others, self-neglect, vulnerability); collateral history from family. Be culturally sensitive (beliefs, language), attend to non-verbal cues, manage time, handle sensitive topics tactfully, and document carefully. End by summarising, giving feedback, planning management and follow-up."),
    ("Part II 5. Define culture-bound syndrome. Give TWO examples of culture-bound syndromes. (1 + 1)", 2,
     "A culture-bound syndrome is a pattern of unusual behaviour and experience recognised as an illness within a particular culture or locality, with local explanations, that does not fit neatly into standard psychiatric categories (now 'cultural concepts of distress' in DSM-5). Examples: koro (fear that the genitals are retracting into the body - South and East Asia); dhat syndrome (anxiety about loss of semen - South Asia); amok (sudden violent outburst - Malaysia); latah; ataque de nervios; spirit possession states."),
    ("Part II 6. Enlist the steps of progression of substance use. Using an example of 'alcohol use', describe the steps of progression briefly.", 3,
     "Steps: experimentation/ initiation → social or recreational (regular) use → risky/ problematic use (abuse/ harmful use) → dependence (addiction). Alcohol example: a young person first tastes ara or beer at a festival out of curiosity (experimentation); then drinks with friends at weekends and celebrations (social use); drinking becomes frequent and heavy, with binges, hangovers, missed work and family quarrels (harmful use); finally he craves alcohol, needs more for the same effect (tolerance), has withdrawal tremors in the morning, drinks to relieve them and cannot cut down despite liver problems (dependence)."),
    ("Part II 7. Discuss some of the mental health promotion activities you can carry out in districts as clinical counsellors.", 3,
     "Awareness and anti-stigma campaigns (World Mental Health Day, Suicide Prevention Day) through community meetings, radio and social media; school and college programmes on life skills, stress management, bullying, substance use and suicide prevention; workplace wellbeing sessions; training gatekeepers (teachers, religious figures, local leaders, health workers) in psychological first aid and identifying people at risk; screening camps (PHQ-9, GAD-7, AUDIT) with referral; parenting and family programmes; support groups for people with alcohol use problems and caregivers; promoting help-seeking and information on available services and helplines; collaboration with Dzongkhag administration, schools, police and NGOs."),
    ("Part II 8. List four common causes of school refusal in children and adolescents. (0.5 × 4)", 2,
     "Any four: separation anxiety (younger children); social anxiety or specific fears at school; bullying or peer conflict; depression; academic difficulties or learning disorders; family problems (parental conflict, illness, domestic violence); problems with a teacher; trauma; positive reinforcement of staying home (screen time, attention)."),
]
for i, (s, mk, mod) in enumerate(P2):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=mk, topic=T, group="me-technical-3-counsel2024-part2", pos=i + 1,
                  stem=f"{s} ({mk} marks)", key_points=[(mod, mk)], model=mod))
B = [
    ("""A 34-year-old father of two children was brought to the psychiatry outpatient department (OPD) for assessment by his daughter. He expressed, 'I don't know what has happened to me; I have to wash my hands repeatedly upon the slightest contact with contaminants.' The patient had been apparently well until two years ago. Since then, he began noticing increasing anxiety and distress related to contamination. He became bothered by the faeces of his cows and dirt in his house. Gradually, he realised that washing his hands with soap after any contact with dirt lowered his anxiety. He spent about 10-15 minutes washing his hands each time and washed them approximately ten times a day. The frequency of hand washing has been increasing and has started affecting his daily routines.
a) What is the most probable diagnosis with the available information, and what other relevant information is missing from the above history to come to a diagnosis? (2 marks)
b) Describe the learning theorist's perspective on the causation of the above disorder. (2 marks)
c) List two defence mechanisms significantly associated with the above disorder. (1 mark)
d) What is the psychotherapy of choice for the above disorder? Discuss how you would apply it in this case. (4 marks)
e) Describe the prognosis of this disorder. (1 mark)""",
     [("a) Obsessive-compulsive disorder (contamination obsessions with washing compulsions)", 1),
      ("a) Missing: whether thoughts are intrusive/ unwanted and recognised as own (insight), resistance, other obsessions/ compulsions, time >1 h/day, depression/ other comorbidity, substance/ medical causes, family history, psychotic features", 1),
      ("b) Two-factor (Mowrer): classical conditioning pairs neutral stimulus (dirt) with anxiety; washing reduces anxiety → negative reinforcement (operant) maintains compulsions; avoidance prevents extinction", 2),
      ("c) Isolation of affect, undoing (also reaction formation)", 1),
      ("d) CBT with exposure and response prevention (ERP): psychoeducation, hierarchy of contamination triggers (cow dung, dirt), graded exposure while preventing washing, homework, family involvement, relapse prevention", 4),
      ("e) Chronic, waxing and waning course; about 20-30% marked improvement, 40-50% moderate, 20-40% remain ill or worsen; better with good insight, early treatment, precipitating event, episodic course", 1)],
     """a) Obsessive-compulsive disorder (OCD), predominantly contamination obsessions with washing compulsions. Missing information: whether the thoughts are intrusive, unwanted and recognised as his own (ego-dystonic), his degree of insight and attempts to resist; other obsessions or compulsions (checking, counting); time taken (more than 1 hour a day) and impairment; comorbid depression or anxiety; absence of psychotic features; substance use or medical causes; family history; past episodes and treatment.
b) Learning theory (Mowrer's two-factor theory): through classical conditioning, a neutral stimulus (dirt, cow faeces) becomes associated with anxiety; through operant conditioning, washing reduces the anxiety, so the compulsion is negatively reinforced and repeated. Avoidance and washing prevent him from learning that the feared outcome does not occur, so the anxiety never extinguishes and the cycle strengthens.
c) Isolation (of affect) and undoing (also reaction formation).
d) Cognitive behavioural therapy with exposure and response prevention (ERP) is the psychotherapy of choice. Application: build rapport and give psychoeducation about OCD and the obsession-compulsion cycle; assess and rate severity (Y-BOCS); create a hierarchy of contamination triggers from least to most anxiety-provoking (touching a door handle, the floor, the cowshed gate, cow dung); expose him gradually to each item while he refrains from washing (or delays and shortens washing), staying with the anxiety until it falls; set daily homework and self-monitoring; address cognitive distortions (overestimation of threat, intolerance of uncertainty); involve his family to stop reassurance and accommodation; and plan relapse prevention. Combine with an SSRI if severe.
e) OCD is usually chronic with a waxing and waning course; about 20-30% improve markedly, 40-50% moderately, and 20-40% remain ill or worsen. Better prognosis: good insight, early treatment, a precipitating event, episodic symptoms and good social functioning."""),
    ("""You are assessing a 14-year-old girl. You realise that she has post-traumatic stress disorder (PTSD), likely resulting from rape by her stepfather. When you discuss this with her mother, she explains that the stepfather is the sole breadwinner of the family, and they cannot afford to lose his financial support to run the household.
a) As a clinical counsellor, what should you do regarding the information you obtained about the rape? (1 mark)
b) Name 2 agencies where you can possibly seek clarification or report such cases. (2 marks)
c) Discuss how victims (children and adolescents) of rape would present to hospitals. (2 marks)
d) List 2 risk factors for PTSD. (1 mark)
e) Discuss the psychosocial aspect of the management of this case. (4 marks)""",
     [("a) Child sexual abuse overrides confidentiality: ensure her immediate safety and report to the police/ child protection authority as required by law; document; inform the treating team", 1),
      ("b) Any two: Royal Bhutan Police (Women and Child Protection Desk/ Unit), the national child protection agency (formerly NCWC) and Dzongkhag protection officers, RENEW, hospital one-stop crisis centre, legal aid", 2),
      ("c) Presentations: genital injury/ bleeding/ pain, STIs, pregnancy, abdominal pain, somatic complaints; behavioural: fear, withdrawal, nightmares, sexualised behaviour, school decline, running away, self-harm, substance use, depression/ PTSD", 2),
      ("d) Any two: severity/ interpersonal (sexual) nature of trauma, repeated trauma, female sex, young age, prior trauma or mental illness, poor social support, ongoing exposure to perpetrator", 1),
      ("e) Safety (separate from perpetrator, shelter), trauma-focused CBT, supportive counselling, support mother (financial/ social welfare support, legal aid), family therapy, school liaison, coordination with police/ courts, follow-up", 4)],
     """a) Because she is a child and is being sexually abused, her safety comes before confidentiality: explain this to her and her mother sensitively, ensure she is not left in danger, report the case to the police and child protection authorities as required by law, arrange a medical examination and document carefully. The mother's financial worry cannot justify leaving the child exposed to ongoing abuse.
b) Royal Bhutan Police (Women and Child Protection Desk/ Unit); the national child protection agency (formerly the National Commission for Women and Children) and Dzongkhag protection officers; RENEW (Respect, Educate, Nurture and Empower Women); the hospital's one-stop crisis centre or social worker.
c) Physical: genital or anal injury, bleeding, pain, urinary infections, sexually transmitted infections, pregnancy, recurrent abdominal pain, headaches and other somatic complaints. Psychological and behavioural: fear, withdrawal, nightmares, flashbacks, sleep problems, sudden drop in school performance, school refusal, running away, sexualised behaviour, self-harm or suicide attempts, substance use, depression and anxiety. Many present late or only with non-specific complaints.
d) Interpersonal and sexual trauma, especially repeated abuse by a trusted person; female sex; young age; previous trauma or mental illness; lack of social support; continued exposure to the perpetrator.
e) Ensure safety - removal from the perpetrator through child protection services, temporary shelter if needed. Provide trauma-focused CBT (psychoeducation, relaxation, emotional regulation, trauma narrative, cognitive processing, safety planning) and supportive counselling; work with the mother - support her emotionally, link the family with social welfare and financial support, livelihood help and legal aid so she can protect the child; family therapy when appropriate; liaise with the school for academic support and reduced stigma; coordinate with police and court processes (child-friendly procedures); screen for depression and suicide risk, with referral to a psychiatrist if needed; and regular follow-up."""),
    ("""Sonam is a 40-year-old man who is undergoing alcohol detox in the hospital. During a session, he made the following statement: 'I know drinking alcohol is a problem and that it is causing disharmony in my family. But I tell you that I can control it. After detox treatment, I am confident now to stop it completely.'
a) According to Prochaska and DiClemente's Transtheoretical Model of Change, what stage of change is Sonam in? (1 mark)
b) List 2 characteristics of the stage of change Sonam is in. (2 marks)
c) Discuss how you would motivate him using the principles and techniques of motivational interviewing. (5 marks)
d) List 4 common mental health consequences of alcohol use disorder. (2 marks)""",
     [("a) Preparation (determination) stage - recognises problem and intends to stop soon (some ambivalence: 'I can control it')", 1),
      ("b) Intends to act in near future, recognises problem, some planning/ small steps, confidence, residual ambivalence", 2),
      ("c) MI principles (express empathy, develop discrepancy, roll with resistance, support self-efficacy) and OARS/ change talk, decisional balance, eliciting goals, collaborative change plan", 5),
      ("d) Any four: depression, anxiety, suicide/ self-harm, alcohol-induced psychosis/ hallucinosis, delirium tremens, Wernicke-Korsakoff syndrome/ dementia, sleep problems, other substance use", 2)],
     """a) Preparation (determination) stage: he recognises that drinking is a problem and plans to stop completely after detox. (His statement 'I can control it' shows some remaining ambivalence from contemplation.)
b) He acknowledges the problem and its consequences; he intends to change in the near future (within the next month); he has started planning or taking small steps (detox); he expresses confidence, though ambivalence and over-confidence may remain.
c) Use motivational interviewing's spirit (collaboration, evocation, autonomy, compassion) and principles: express empathy through reflective listening ('Your family's harmony matters a lot to you'); develop discrepancy between his values (family, health) and his drinking; roll with resistance - don't argue about 'I can control it', explore it; support self-efficacy by affirming his decision and past strengths. Techniques - OARS: open questions ('What would be different if you stopped?'), affirmations, reflections and summaries; elicit and reinforce change talk; explore the decisional balance (pros and cons of drinking and stopping); use importance and confidence rulers; then build a concrete change plan together - goal of abstinence, coping with triggers and cravings, avoiding drinking situations, support from family and groups (AA), medication if prescribed and follow-up - and plan for possible lapses without shame.
d) Depression, anxiety disorders, suicide and self-harm, alcohol-induced psychotic disorder (alcoholic hallucinosis), delirium tremens, Wernicke-Korsakoff syndrome and alcohol-related dementia, sleep disorders, and other substance use."""),
    ("""Zangmo is a dedicated high school teacher who loves her job. However, over the past few weeks, she has felt increasingly overwhelmed. She spends long hours preparing lesson plans, grading papers and dealing with administrative tasks because she has been handed extra responsibilities after her friends resigned to go to Australia, and the school is facing human resource constraints. Zangmo experiences fatigue, headaches and difficulty sleeping due to stress. She feels irritable, detached from her students and lacks enthusiasm for teaching. She has become less patient with her students, and her performance evaluations have declined. Despite these challenges, she does not yet qualify for any major psychiatric diagnosis.
a) What is the most likely phenomenon that Zangmo is suffering from? (1 mark)
b) Describe the pathophysiology of her symptoms. (2 marks)
c) List 4 probable causes of this phenomenon. (2 marks)
d) If Zangmo does not receive timely help, list 2 common psychiatric disorders that she is at risk for. (1 mark)
e) As a clinical counsellor, how would you address her issue? (4 marks)""",
     [("a) Burnout (occupational burnout from chronic workplace stress)", 1),
      ("b) Chronic stress → sustained HPA axis and sympathetic activation, cortisol dysregulation, inflammation → fatigue, headaches, insomnia, irritability; psychological: emotional exhaustion, depersonalisation, reduced accomplishment", 2),
      ("c) Any four: excessive workload/ extra responsibilities, staff shortage, lack of control, insufficient reward/ recognition, lack of support, role conflict/ ambiguity, poor work-life balance, value mismatch", 2),
      ("d) Depression and anxiety disorders (also insomnia, substance use)", 1),
      ("e) Assessment (rule out depression), psychoeducation, stress management (relaxation, mindfulness, sleep hygiene, exercise), CBT/ problem solving, time management, boundaries, social support, liaise with school for workload/ HR support (with consent), leave, follow-up, referral if needed", 4)],
     """a) Burnout - an occupational phenomenon resulting from chronic workplace stress that has not been managed (WHO ICD-11), with exhaustion, mental distance/ cynicism and reduced professional efficacy.
b) Prolonged stress keeps the stress response switched on: the hypothalamic-pituitary-adrenal axis and sympathetic nervous system are chronically activated, cortisol rhythms become dysregulated and inflammatory cytokines rise. This leads to fatigue, tension headaches, poor sleep, irritability and reduced concentration. Psychologically, resources are depleted, causing emotional exhaustion, then depersonalisation (detachment from students) as a coping response, and reduced sense of accomplishment and performance.
c) Excessive workload and extra responsibilities; staff shortage after colleagues resigned; lack of control over work demands; insufficient recognition or reward; lack of support from administration; role conflict and ambiguity; poor work-life balance; perfectionism and high dedication.
d) Depression and anxiety disorders (also insomnia and harmful use of alcohol or other substances).
e) Build rapport and assess thoroughly (stress, sleep, mood, suicide risk, substance use) to rule out depression; give psychoeducation about burnout and validate her experience; teach stress management - relaxation and breathing exercises, mindfulness, regular exercise, sleep hygiene, healthy diet; use CBT and problem-solving to address perfectionist thoughts and prioritise tasks, time management and setting boundaries (saying no, delegating); encourage social support and enjoyable activities; with her consent, liaise with the principal or Dzongkhag education office to reduce workload, share responsibilities or arrange relief staff and leave; schedule follow-up sessions and refer to a psychiatrist if symptoms worsen."""),
    ("""Gem is a 26-year-old woman who has a history of multiple non-suicidal self-injuries (cutting her arms and legs) since her teenage years. She experiences chronic suicidal ideation, finding relief in thoughts of suicide as a 'way out'. She struggles with her identity and is impulsive. She frequently changes her job due to repeated interpersonal conflicts. Her relationship with her partner is volatile, swinging between intense affection and moments of disdain.
a) What is the most probable diagnosis with the available information? Why? (2 marks)
b) What is the psychotherapy of choice for Gem? List its components. (3 marks)
c) Describe any 2 of the components you mentioned in b). (3 marks)
d) How would you manage it if Gem presented to you with active suicidal ideation? (2 marks)""",
     [("a) Borderline personality disorder: recurrent self-harm, chronic suicidal ideation, identity disturbance, impulsivity, unstable intense relationships (idealisation-devaluation), long-standing since adolescence", 2),
      ("b) Dialectical behaviour therapy (DBT); components: individual therapy, group skills training (mindfulness, distress tolerance, emotion regulation, interpersonal effectiveness), telephone coaching, therapist consultation team", 3),
      ("c) Two components described accurately (e.g. skills training modules, individual therapy with diary cards and chain analysis, phone coaching)", 3),
      ("d) Risk assessment (plan, means, intent), ensure safety (not alone, remove means), collaborative safety plan, involve family and psychiatrist, hospitalise if high risk, follow-up", 2)],
     """a) Borderline personality disorder: a long-standing pattern since adolescence of recurrent self-harm and chronic suicidal ideation, identity disturbance, impulsivity, and unstable, intense relationships alternating between idealisation and devaluation, with repeated interpersonal conflicts.
b) Dialectical behaviour therapy (DBT, Marsha Linehan). Components: individual therapy; group skills training (four modules - mindfulness, distress tolerance, emotion regulation, interpersonal effectiveness); telephone coaching between sessions; and a therapist consultation team.
c) Skills training: in weekly groups patients learn mindfulness (observing and describing without judgement), distress tolerance (surviving crises without self-harm - TIPP, distraction, self-soothing, radical acceptance), emotion regulation (identifying and changing emotions, reducing vulnerability) and interpersonal effectiveness (asking for needs and saying no while keeping relationships and self-respect, e.g. DEAR MAN). Individual therapy: weekly sessions use diary cards and chain analysis of self-harm and other target behaviours, prioritising life-threatening behaviour, then therapy-interfering and quality-of-life behaviours, balancing acceptance and change. (Telephone coaching helps generalise skills to real-life crises.)
d) Take it seriously: assess risk immediately - current plan, means, intent, recent self-harm, substance use, protective factors; ensure safety - do not leave her alone, remove means; stay calm and validating; make a collaborative safety plan (warning signs, coping skills, people and helplines to contact); involve family or partner with her consent; refer urgently to a psychiatrist and arrange hospital admission if risk is high or imminent; follow up closely and document."""),
]
for i, (s, kp, mod) in enumerate(B):
    Q.append(dict(key=f"B{i + 1}", real=True, type="long_answer", marks=10, topic=T, stem=f"Section B, question {i + 1}. " + s, key_points=kp, model=mod))
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions", "type": "short_answer", "count": 1, "marks_each": 20, "answer_any": None},
    {"title": "Section B: Five compulsory questions", "type": "long_answer", "count": 5, "marks_each": 10, "answer_any": None},
]
