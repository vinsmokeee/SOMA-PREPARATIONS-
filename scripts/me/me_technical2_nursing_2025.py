"""ME Technical Paper II (General Subject Knowledge), NURSING group, BCSE 2025 - real paper. PDF sent by the founder.
Pattern: Section A General health sciences 50 MCQ, Section B Problem solving 25 MCQ, Section C Data interpretation 25 MCQ,
1 mark each (100). 150 minutes + 15 minutes reading. Sections are kept apart by topic (topic_slug in the pattern).
Chart data for Section C is written into each question (the line graph is shown as a picture).
Left out (more than one defensible answer / rounding): A 2, 3, 12, 15, 16, 26, 34, 45; B 58, 62; C 87 (two options
false); eleven new MCQs keep the sections at 50 / 25 / 25.
"""
import os, json, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC = _c["RUBRIC"]

BATCH = "ME Paper II (Technical, Nursing): BCSE 2025, batch 1"
GROUP_TAG = "nurse2025"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "nursing"
MIN_WORDS = 0
GROUP_TIMING = {"duration": 150, "reading": 15, "max_marks": 100}
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper II, Nursing", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
TA, TB, TC = "Nursing: general health sciences", "Nursing: problem solving", "Nursing: data interpretation"
PATTERN = [
    {"title": "Section A: General health sciences", "type": "mcq", "count": 50, "marks_each": 1, "answer_any": None, "topic": "nursing-general-health-sciences"},
    {"title": "Section B: Problem solving", "type": "mcq", "count": 25, "marks_each": 1, "answer_any": None, "topic": "nursing-problem-solving"},
    {"title": "Section C: Data interpretation", "type": "mcq", "count": 25, "marks_each": 1, "answer_any": None, "topic": "nursing-data-interpretation"},
]

MCQ = r"""[
{
"n": 1,
"stem": "Before doctor’s round, you are following up the laboratory blood report of the patient with liver cirrhosis who is admitted in the medical ward. You observed that the albumin level was 2.5gm/dL. You will plan care for this patient to address the risk of developing:",
"opts": [
"Jaundice of the skin.",
"Prolonged blood coagulation.",
"Peripheral edema.",
"Vitamin A malabsorption."
]
},
{
"n": 2,
"stem": "The most important function of nursing assessment is for;",
"opts": [
"Patient needs identification",
"Clinical decision making",
"Legal requirements and documentation",
"Communication with patient and family"
]
},
{
"n": 3,
"stem": "The example of focused (Problem-Oriented) assessment is;",
"opts": [
"Checking location and intensity of pain using pain score.",
"Reassessing pain levels after medication.",
"Collecting history of pain and pain medication.",
"Monitoring vital signs including pain scoring and documentation."
]
},
{
"n": 4,
"stem": "Nursing process is a systematic patient-centered approach which requires nursing competencies in these sequential, interrelated steps:",
"opts": [
"Assessment, implementation, evaluation, planning and diagnosis.",
"Assessment, diagnosis, outcomes, implementation and evaluation.",
"Assessment, planning, diagnosis, implementation and evaluation",
"Assessment, diagnosis, planning, implementation and evaluation."
]
},
{
"n": 5,
"stem": "All are examples of primary prevention of diseases EXCEPT:",
"opts": [
"Hypertension screening.",
"Maintaining ideal weight.",
"Regular exercise program.",
"Nutritional counselling."
]
},
{
"n": 6,
"stem": "Which of the following nursing diagnoses is most appropriate to include in the plan of care for a patient experiencing shock?",
"opts": [
"Ineffective tissue perfusion.",
"Ineffective health maintenance.",
"Ineffective respiration rate.",
"Risk of organ failure."
]
},
{
"n": 7,
"stem": "As the only clinical nurse in a general ward, you were asked to teach the student nurses. Since your ward has many chronic bedridden patients with pressure ulcers, you decide to show them what a stage 3 pressure ulcer looks like. Which description fits?",
"opts": [
"The epidermis and part of underlying layer of dermis is exposed.",
"Loss of skin and the wound extends through the dermis to fatty subcutaneous tissues.",
"The wound has extended to muscles, tendons, ligaments and has reached the bone.",
"The base of the wound is covered by black necrotic tissues and bone was visible."
]
},
{
"n": 8,
"stem": "Using the Norton scoring system as the pressure ulcer risk calculator, which score shows the need for intensive nursing care to prevent pressure ulcers?",
"opts": [
"≤14 = at risk",
"<18 = at risk",
">14 = at risk",
"≥18 = at risk"
]
},
{
"n": 9,
"stem": "The nurse is administering medication to a patient with liver failure which resulted from end-stage cirrhosis. Which pharmacokinetic phase is the patient most likely to have a problem with?",
"opts": [
"Absorption",
"Distribution",
"Metabolism",
"Excretion"
]
},
{
"n": 10,
"stem": "During disaster and emergencies authoritative leadership is preferred because of these key traits:",
"opts": [
"Visionary thinking and long-term goal orientation.",
"Command and control.",
"Self-centered and cunning.",
"Effective communicator and influencer."
]
},
{
"n": 11,
"stem": "Choose the most appropriate statement for the importance of Clinical Nurse Leaders;",
"opts": [
"Managing the nurses and the nurse unit.",
"Leading nurses in clinical and academic learning.",
"Improving patient care outcomes at the bedside.",
"Advocating for patients’ rights, safety, and health equity."
]
},
{
"n": 12,
"stem": "Nurses use pain scores to understand the intensity of pain that the patient is suffering and provide timely relief. What is the range of pain score which should prompt the clinical nurse to consult with treating doctor to initiate the start of analgesics?",
"opts": [
"1 – 3",
"4 – 6",
"7 – 8",
"9 – 10"
]
},
{
"n": 13,
"stem": "Nurses have to be very careful during medication. A medication error happens when the nurse makes a mistake during medication preparation or administration. When does an “omission error” happen?",
"opts": [
"When the nurse gives the wrong drug.",
"When the nurse gives the wrong dose.",
"When the nurse gives the medicine at the wrong time.",
"When the nurse forgets to administer a dose."
]
},
{
"n": 14,
"stem": "All the following points are the objectives of the competency-based framework for the Clinical Nurse in Bhutan EXCEPT:",
"opts": [
"Define clear roles and responsibilities for service delivery.",
"Ensure training and development are effective and aligned to the goal.",
"Fulfill the vision and mandates of Royal Civil Service Commission (RCSC).",
"Provide quality healthcare service by qualified and competent clinical nurses."
]
},
{
"n": 15,
"stem": "The key roles of Clinical Nurse in Bhutan are;",
"opts": [
"Care provider, educator, communicator and nurse manager.",
"Care provider, researcher, educator and communicator.",
"Care provider, leader, researcher and nurse manager.",
"Care provider, patient advocator, educator and nurse manager."
]
},
{
"n": 16,
"stem": "As a care provider, professionalism and ethical practice is one of the competency areas of Clinical Nurse. The behavioral indicator which indicates you are a competent nurse is;",
"opts": [
"Engage patients, families and communities in making decisions about their health needs.",
"Keep abreast of national legal, ethical and code of conducts for effective nursing care.",
"Maintain clearly defined error prevention, reporting, and addressing mechanisms with proper documentation.",
"Communicate effectively with patients and family in clear, concise and respectful manner to facilitate the provision of care."
]
},
{
"n": 17,
"stem": "A patient is treated for severe diarrhea and vomiting. Laboratory investigation showed hypokalemia and the treatment was initiated. When you evaluate her response to potassium replacement therapy, which of the following changes should you observe?",
"opts": [
"Worsening constipation.",
"Increasing muscle strength.",
"Decreasing serum glucose.",
"Improving visual acuity."
]
},
{
"n": 18,
"stem": "During your shift in the pediatric ward, you see parents using cold water to lower the fever of their child. You have decided to provide group health education for behavioral change of the parents to start tepid sponging. What is the negative aspect of using cold water that you would say to the parents?",
"opts": [
"Cold water contains germs that would make the baby more ill.",
"Cold water is effective in lowering the temperature so they can continue with it.",
"Cold water causes vasoconstriction and traps heat inside the body.",
"Cold water makes the skin dry and causes discomfort to the child."
]
},
{
"n": 19,
"stem": "When you maintain a therapeutic environment, encourage your psychiatric patients to communicate with each other and promote growth through role modelling, it is a form of:",
"opts": [
"Group Therapy",
"Cognitive Behavioral Therapy",
"Individual Psychotherapy",
"Milieu Therapy"
]
},
{
"n": 20,
"stem": "Recognizing the verbal and nonverbal communication content of the various stages of grieving can help the nurse to select interventions that meet the patient’s psychological and physical needs. What are Kübler-Ross’s five stages of grieving, which explain what patients experience as they grieve and mourn?",
"opts": [
"Denial, anger, bargaining, depression and acceptance.",
"Anger, denial, acceptance, depression and bargaining.",
"Denial, bargaining, anger, depression and acceptance.",
"Depression, acceptance, denial, bargaining and anger."
]
},
{
"n": 21,
"stem": "Tetralogy of Fallot is a common congenital heart defect involving 50% to 70% of all cyanotic congenital heart diseases. It consists of a grouping of four abnormal conditions of heart defects. They are:",
"opts": [
"Pulmonary stenosis, atrial septal defect, patent ductus arteriosus and ventricular septal defect.",
"Ventricular septal defect, atrial septal defect, overriding aorta and ventricular hypertrophy.",
"Pulmonary stenosis, ventricular septal defect, overriding aorta and right ventricular hypertrophy.",
"None of the above."
]
},
{
"n": 22,
"stem": "While caring for paediatric patients, a nurse needs to understand the child’s developmental phases to give holistic and patient-centered care. Nursing care based on the oral, anal, phallic, latency and genital stages of child development is derived from:",
"opts": [
"Piaget’s theory of cognitive development.",
"Freud’s theory of psychosexual development.",
"Erikson’s theory of psychosocial development.",
"Kohlberg’s theory about development of moral reasoning."
]
},
{
"n": 23,
"stem": "A patient is rushed into the emergency room and you are informed to assess the patient and chart the “Glasgow Coma Scale”. What is your purpose of this assessment recording?",
"opts": [
"To report the motor function of the patient.",
"To report the orientation of the patient to the place and time.",
"To report the communication capacity of the patient.",
"To report the neurological status of the patient."
]
},
{
"n": 24,
"stem": "The nurse in charge has delegated you to manage a patient admitted with diabetic ketoacidosis. As team leader, which physiological change would you explain to the staff nurses (SNs) and assistant nurses (ANs) as this patient’s body attempts to restore acid-base balance?",
"opts": [
"Increasing the respiration rate.",
"Decreasing the respiration rate.",
"Increasing reabsorption of hydrogen ions.",
"None of the above."
]
},
{
"n": 25,
"stem": "Nurses have a critical role in antimicrobial stewardship (AMS). The goal of the nursing function in AMS is to:",
"opts": [
"Prevent overuse and misuse of antibiotics.",
"Adhere to nursing principles of infection management.",
"Control patient safety incidents.",
"Fulfill World Health Organization (WHO) mandates on antimicrobial use."
]
},
{
"n": 26,
"stem": "Before the nurse transfuse blood and blood components informed consent is obtained in a consent form with signature from the patient at the time the explanation for treatment is provided and the most appropriate rationale for getting the consent is;",
"opts": [
"Patient acknowledges that the nurse has explained pros and cons of blood transfusion.",
"Nurse records the documentation of the blood transfusion which serves as the legal evidence.",
"The nurse follows the standard operating procedure for blood transfusion so that there is no deviation from the protocol of treatment.",
"Patient gives nurse the right to deliver care and transfuse blood and blood components without fear of prosecution."
]
},
{
"n": 27,
"stem": "A decrease of parathyroid hormone (PTH), as in hypoparathyroidism, leads to:",
"opts": [
"Hyponatremia",
"Hypernatremia",
"Hypocalcemia",
"Hypercalcemia"
]
},
{
"n": 28,
"stem": "During the first antenatal care (ANC) the expectant mother is given information on the expected date of delivery (EDD) of the baby. The first day of the last menstrual period (LMP) is 20th March, 2025. Using obstetric wheel or calculator what is the EDD that the nurse should inform the expectant mother?",
"opts": [
"27th December, 2025.",
"20th December, 2025.",
"27th January, 2026.",
"20th January, 2026."
]
},
{
"n": 29,
"stem": "During your round in the maternity ward, you observe that an expectant mother has an intense urge to push and the baby’s head is crowning. For which stage of labour would you provide the appropriate nursing care?",
"opts": [
"Latent phase - First stage of labor.",
"Active phase - First stage of labor.",
"Second stage of labor.",
"Third stage of labor."
]
},
{
"n": 30,
"stem": "What is the first infection control monitoring criterion for nosocomial infections?",
"opts": [
"Complete Blood Count Parameters.",
"Urine analysis.",
"Admission in the hospital for more than 72 hours.",
"Temperature assessment."
]
},
{
"n": 31,
"stem": "At Jigme Dorji Wangchuck National Referral Hospital, nurses are incentivized with extended hour payment for the extra shift they work. This strategy is adopted to facilitate efficient accomplishment of the nursing task and cover the shortage of nurses in the inpatient wards. Which management theory best fits this strategy?",
"opts": [
"Taylor’s scientific management.",
"Fayol’s administrative management.",
"Weber’s bureaucratic Management.",
"McGregor’s theories X and Y on human relations–based management."
]
},
{
"n": 32,
"stem": "Which of the following risk factors can lead to osteoporosis?",
"opts": [
"Low body mass index (BMI)",
"Low calcium and vitamin D diet.",
"History of hip fracture.",
"All of the above."
]
},
{
"n": 33,
"stem": "Mistakes in the genetic code lead to mutations, which may kill the affected cells or irreversibly alter their functions so that they become malignant; this is the basis of cancer. Where is this code found?",
"opts": [
"Ribosomes in the cytoplasm.",
"Protein in the ribosomes.",
"RNA in the nucleus.",
"DNA in the chromosomes."
]
},
{
"n": 34,
"stem": "During your session of health education on insulin administration to the diabetic patients one of the patients asked you why insulin has to be administrated via subcutaneous. All the following reasons you have provided to the patient are correct except;",
"opts": [
"Injecting in the subcutaneous ensure gradual absorption and prolonged action similar to the body’s natural insulin release.",
"Insulin is a protein and cannot be administered orally because the gastric enzymes will break it down and it cannot serve its purpose.",
"Injecting in the subcutaneous ensure gradual absorption and prolonged action and prevent allergic reaction.",
"Injecting insulin via subcutaneous is effective, safe and convenient for self-administration."
]
},
{
"n": 35,
"stem": "A patient is brought to the emergency room of the district hospital with an overdose of an oral drug. The doctor advises you to prepare activated charcoal. Which of the following cannot be treated with activated charcoal?",
"opts": [
"Carbamazepine",
"Cyanide",
"Beta Blockers",
"Chloroquine"
]
},
{
"n": 36,
"stem": "What postoperative intervention would you suggest to the patient to help prevent atelectasis?",
"opts": [
"Coughing and deep breathing.",
"Pressing the surgical wound while coughing.",
"Leg exercise.",
"Passing flatus."
]
},
{
"n": 37,
"stem": "You are assigned a patient for whom you are making a decision about a future action with patient care. This critical thinking activity is equated with which of the following steps of the nursing process?",
"opts": [
"Assessment",
"Planning",
"Implementation",
"Evaluation"
]
},
{
"n": 38,
"stem": "In nursing practice, ‘Good Samaritan laws’ relate to:",
"opts": [
"Mandating nurses to be polite and empathetic towards patient during medical distress.",
"Defining the standard of care which a reasonable, prudent practitioner with similar education and experience would do or not do in similar circumstances.",
"Protecting nurses from civil liability for injuries when an attempt has been made to aid patient needing medical attention during emergency.",
"Assuring the patient that information obtained by the nurse while providing care will not be communicated to anyone who does not need to know."
]
},
{
"n": 39,
"stem": "In the orthopedic ward a patient is walking with a cane and is stable when ambulating and changing clothes. Which of the following assessment techniques was used by the nurse to collect this data?",
"opts": [
"Auscultation",
"Percussion",
"Palpation",
"Inspection"
]
},
{
"n": 40,
"stem": "While you are performing a nursing assessment, a patient tells you that she has just returned from another country and has had an upper respiratory infection for two weeks. How is this information beneficial to aid in the care of this patient?",
"opts": [
"It would help in understanding the type of patient’s occupation.",
"It will help in determining the patient’s socioeconomic status.",
"It might help to know whether there has been any recent outbreak of disease.",
"It could help in finding patient’s immunological status."
]
},
{
"n": 41,
"stem": "While monitoring an electrocardiogram (ECG) you identified that the PR interval was 0.24 seconds. How should you interpret this rhythm?",
"opts": [
"First-degree AV block",
"Sinus arrhythmia",
"Atrial Fibrillation",
"Ventricular tachycardia"
]
},
{
"n": 42,
"stem": "A patient with suspected pyelonephritis has urine sent for analysis and culture. Which result would you check to substantiate the diagnosis?",
"opts": [
"Negative for protein.",
"Casts in the urine.",
"High specific gravity",
"Low leukocyte count."
]
},
{
"n": 43,
"stem": "Which of the following nursing diagnoses is a priority for the patient recovering from an exploratory laparoscopy?",
"opts": [
"Pain, acute.",
"Nutrition, imbalanced.",
"Skin integrity, impaired.",
"Mobility, impaired."
]
},
{
"n": 44,
"stem": "The process of identifying, analysing, treating and evaluating real and potential hazards in Continuous Quality Improvement (CQI) is called:",
"opts": [
"Performance and Outcome management.",
"Actual Performance management.",
"Risk Management.",
"SWOT Analysis."
]
},
{
"n": 45,
"stem": "What will be your most appropriate response to the patient who recently had left above the knee amputation ask you to give him pain medicine for his left foot?",
"opts": [
"You will politely explain to the patient that you have no right to prescribe medicine.",
"You will assess the pain and manage it according to the pain score.",
"You will reassure the patient to get the doctor order pain medicine.",
"You will explain about the phantom limb sensation."
]
},
{
"n": 46,
"stem": "According to the international nursing diagnosis or NANDA-I a nursing diagnosis can be any of the following EXCEPT:",
"opts": [
"Self-care focused diagnosis.",
"Problem-focused diagnosis.",
"Risk diagnosis.",
"Health promotion diagnosis."
]
},
{
"n": 47,
"stem": "All the following statements are the objectives of patient admission to the ward EXCEPT:",
"opts": [
"Help new patient adjust to hospital environment and routines.",
"Get the patient to sign the rules and responsibilities form during admission.",
"Alleviate the patient’s fear and worry about the hospitalization.",
"Facilitate recovery of patient from his or her health-related problems."
]
},
{
"n": 48,
"stem": "The ethical principle of nonmaleficence requires that:",
"opts": [
"All patients are treated equally regardless of gender, sexual orientation, religion, ethnicity, disease, or social standing.",
"Good be done for the benefit of the patient.",
"No patient be misled or deceived by the nurse during care.e.e.",
"No harm be done to patient, either deliberately or unintentionally."
]
},
{
"n": 49,
"stem": "Nurses assess pulse for pulse rate (number of beats), rhythm (pattern and interval between the beats) and the volume (the force of blood with each beat). Select the correct site for the assessment of femoral pulse:",
"opts": [
"Behind the knee.",
"At the antecubital fossa.",
"Along the inguinal ligament.",
"Between the first and second metatarsal bones."
]
},
{
"n": 50,
"stem": "Which of the following is true about clinical decision-making for oxygen therapy in a patient with pneumonia and a patient with COPD?",
"opts": [
"Oxygen target (SpO₂) for pneumonia should be between 88–92% and for COPD >94%.",
"A COPD patient has a higher risk of CO₂ retention than a patient with pneumonia.",
"Patients with pneumonia rely on hypoxic drive (low oxygen) to breathe, whereas in COPD the patient’s respiratory drive is normal.",
"Oxygen can be administered freely depending on the severity for patient with COPD whereas for the patient with pneumonia oxygen has to be limited to 1-2 L/min. "
]
},
{
"n": 51,
"stem": "A patient has been prescribed a medication every 6 hours, starting at 6 am. What will be the next three administration times?",
"opts": [
"10 am, 2 pm, 6 pm",
"12 pm, 6 pm, 12 am",
"12 pm, 4 pm, 8 am",
"12 am, 6 am, 12 pm"
]
},
{
"n": 52,
"stem": "A patient is prescribed 750 mg of injection Acyclovir. The medicine is available as 500 mg/vial, to be reconstituted with 10 ml of sterile water. How many ml of the reconstituted solution should the nurse administer to the patient?",
"opts": [
"5 ml",
"10 ml",
"15 ml",
"20 ml"
]
},
{
"n": 53,
"stem": "A vial contains 30 ml of medicine. On day one, 10% of the total is used, and on day two another 10% of the total is used. On day three, 50% of the remaining medicine is used. How much medicine is left in the vial?",
"opts": [
"9 ml",
"10 ml",
"11 ml",
"12 ml"
]
},
{
"n": 54,
"stem": "A dose of 5 ml of antivenom is required for 150 ml of venom in a patient. What is the least amount of antivenom required if a patient has been bitten by a snake that can carry a maximum of 90 ml of venom?",
"opts": [
"2 ml",
"3 ml",
"4 ml",
"5 ml"
]
},
{
"n": 55,
"stem": "A roll of bandage is 30 metres long and costs Nu 120. Bandages can only be bought in whole rolls, not by length. With a budget of Nu 1,500, how many metres of bandage can you buy?",
"opts": [
"350 meters",
"360 meters",
"375 meters",
"400 meters"
]
},
{
"n": 56,
"stem": "A child weighs 20 kg. The doctor prescribes a drug at 10 mg/kg/day which is administered every 12 hours. How much will the nurse administer per dose?",
"opts": [
"200 mg",
"150 mg",
"100 mg",
"50 mg"
]
},
{
"n": 57,
"stem": "A patient is prescribed 500 ml of IV fluid to infuse over 4 hours. What is the flow rate in ml/hr?",
"opts": [
"100 ml/hr",
"125 ml/hr",
"150 ml/hr",
"200 ml/hr"
]
},
{
"n": 58,
"stem": "A patient in ICU is receiving infusion Noradrenaline at rate of 10ml/hour. The nurse on the previous shift mentioned that he has diluted Noradrenaline 16 mg in 50 ml of D5%. How much Noradrenaline is the patient receiving in mcg/kg/min if the patient weighs 60 kg (1mg= 1000 mcg).",
"opts": [
"53.3 mcg/kg/min",
"5.33 mcg/kg/min",
"0.8 mcg/kg/min",
"0.08 mcg/kg/min"
]
},
{
"n": 59,
"stem": "A patient’s medication dose needs to be reduced by 30%. If the current dose is 150 mg, what will be the new dose?",
"opts": [
"45 mg",
"105 mg",
"145 mg",
"195 mg"
]
},
{
"n": 60,
"stem": "A sliding scale insulin order requires 1 unit of insulin for every 10 mg/dl of blood glucose over 150 mg/dl. If a patient’s blood glucose level is 200 mg/dl, how many units of insulin should the nurse administer?",
"opts": [
"5 units",
"6 units",
"7 units",
"8 units"
]
},
{
"n": 61,
"stem": "A patient is ordered to receive 500 mL of Normal Saline solution containing Calcium gluconate 500 mg to be administered at 5 mg/min. How long will it take to finish the IV bag?",
"opts": [
"60 minutes",
"80 minutes",
"100 minutes",
"120 minutes"
]
},
{
"n": 62,
"stem": "A 6-year-old weighing 22 kg comes to the hospital with a fever and the doctors prescribes Tab Paracetamol 15 mg/kg/dose every 4 hours PRN. However, the parents have only 160 mg/5ml of paracetamol syrup at home. How many ml of the syrup should the parent administer per dose at the minimum?",
"opts": [
"5 ml",
"7 ml",
"9 ml",
"10 ml"
]
},
{
"n": 63,
"stem": "The doctor prescribes ceftazidime 0.3 g IM three times a day. Reconstitution instructions: For IM solution, add 1.5 ml diluent, which will give about 1.8 ml (280 mg/ml). What amount will you administer?",
"opts": [
"1 ml",
"1.1 ml",
"1.5 ml",
"1.9 ml"
]
},
{
"n": 64,
"stem": "A patient is prescribed 1200 ml of 0.9% NS solution at a rate of 125 ml/hr. The drop factor is 12 drops/ml. At how many drops per minute should the nurse set the flow rate to safely administer the prescribed solution?",
"opts": [
"10 drops per minute",
"15 drops per minute",
"20 drops per minute",
"25 drops per minute"
]
},
{
"n": 65,
"stem": "The doctor orders an infusion of 1000 ml of 0.9% NS over a period of 8 hours using a macrodrip set with a drop factor of 10 drops per ml for a patient with pneumonia. You initiated the IV at 1:00 PM during your shift. With the current rate, at what time will you hang the next bag?",
"opts": [
"9 PM the next day",
"10 PM the next day",
"9 PM of the same day",
"10 PM of the same day"
]
},
{
"n": 66,
"stem": "Your hospital has alcohol-based hand rub (500ml container) containing 7.5% chlorhexidine solution. You want to dilute the solution to 2% chlorhexidine, which is the recommended concentration. How much diluent (70% alcohol) will you add to make it the desired concentration?",
"opts": [
"580 ml",
"1250 ml",
"1375 ml",
"1875 ml"
]
},
{
"n": 67,
"stem": "You are teaching your support staff to make a bleaching solution for instrument decontamination. The hospital supplies sodium dichlorocyanurate tablets (available chlorine 1 g per tablet). How many tablets need to be added to 1 litre of water to make a 0.5% bleaching solution?",
"opts": [
"1 tablet",
"3 tablets",
"4 tablets",
"5 tablets"
]
},
{
"n": 68,
"stem": "A patient with septic shock is prescribed Noradrenaline at 0.53 mcg/kg/min. The patient weighs 50 kg. The label on the syringe reads: \"Injection Noradrenaline 1 ml = 160 mcg.\" At what rate should the infusion be administered?",
"opts": [
"0.9 ml/hr",
"5.6 ml/hr",
"9.4 ml/hr",
"10 ml/hr"
]
},
{
"n": 69,
"stem": "A lactulose enema solution is made with 1 part lactulose solution to 4 parts of 0.9% normal saline solution (NS). How much NS is required to make 250 ml of lactulose enema?",
"opts": [
"250 ml",
"200 ml",
"150 ml",
"100 ml"
]
},
{
"n": 70,
"stem": "A patient with atrial fibrillation is receiving Amiodarone infusion for 24 hours. The dose ordered is 1mg/min in the first 8 hours and 0.5mg/min in the next 16 hours. 900mg of amiodarone was diluted in 500ml of NS. At the 10th hour, what will be the rate of the infusion in ml/hour?",
"opts": [
"33.3 ml/hour",
"3.33 ml/hour",
"16.6 ml/hour",
"1.66 ml/hour"
]
},
{
"n": 71,
"stem": "How many grams of solute are in 200 ml of 20% human albumin solution?",
"opts": [
"2 grams",
"20 grams",
"4 grams",
"40 grams"
]
},
{
"n": 72,
"stem": "A 100ml solution contains 25% of a drug. How many ml of NS must you add to make it 20%?",
"opts": [
"10 ml",
"15 ml",
"25 ml",
"50 ml"
]
},
{
"n": 73,
"stem": "A candle has a length of 10 cm. When lit, it burns at a rate of 2 mm in 15 minutes. After being lit for 2.5 hours, how much of the candle is left?",
"opts": [
"9 cm",
"8.5 cm",
"8 cm",
"7.5 cm"
]
},
{
"n": 74,
"stem": "If a painting job is completed by 8 workers in 12 days, how long would it take 10 workers to do the same work?",
"opts": [
"8.4 days",
"9.6 days",
"12.2 days",
"15 days"
]
},
{
"n": 75,
"stem": "If all ICU patients are critically ill, and some critically ill patients are intubated, which of the following is definitely true?",
"opts": [
"All ICU patients are intubated",
"Some ICU patients are not critically ill",
"Some ICU patients may be intubated",
"All critically ill patients are in the ICU"
]
},
{
"n": 76,
"stem": "The number of patients Nurse Karma attended during her 7-day shift is as follows: [12, 15, 13, 16, 14, 15, 13]. What is the median number of patients attended?",
"opts": [
"13",
"14",
"15",
"13.5"
]
},
{
"n": 77,
"stem": "What type of graph is the most appropriate for showing the trend of patient admission over a 12-month period?",
"opts": [
"Pie Chart",
"Bar Graph",
"Line graph",
"Histogram"
]
},
{
"n": 78,
"stem": "Bar graph - total number of patients at a primary health care centre, January to June 2025: Jan 12, Feb 20, Mar 29, April 37, May 20, June 28.\n\nWhat is the total number of patients recorded in the second quarter of the year?",
"opts": [
"85",
"146",
"20",
"61"
]
},
{
"n": 79,
"stem": "Bar graph - total number of patients at a primary health care centre, January to June 2025: Jan 12, Feb 20, Mar 29, April 37, May 20, June 28.\n\nWhat is the average patient count of the 6-month period?",
"opts": [
"20",
"22",
"24",
"28"
]
},
{
"n": 80,
"stem": "Bar graph - total number of patients at a primary health care centre, January to June 2025: Jan 12, Feb 20, Mar 29, April 37, May 20, June 28.\n\nWhich month recorded the highest rise in the number of patients compared to previous month?",
"opts": [
"May",
"April",
"March",
"February"
]
},
{
"n": 81,
"stem": "Bar graph - total number of patients at a primary health care centre, January to June 2025: Jan 12, Feb 20, Mar 29, April 37, May 20, June 28.\n\nWhat is the percentage of increase for the month with the largest increase?",
"opts": [
"45%",
"50%",
"55%",
"60%"
]
},
{
"n": 82,
"stem": "Bar graph - total number of patients at a primary health care centre, January to June 2025: Jan 12, Feb 20, Mar 29, April 37, May 20, June 28.\n\nWhich statement cannot be interpreted from the graph?",
"opts": [
"There is a constant increase in the number of patients in first quarter",
"There are at least 10 patients in each month of the year",
"During the second quarter, patient count showed an increase after a decline for a month",
"The number of patients decreased after the introduction of new admission criteria."
]
},
{
"n": 83,
"stem": "Graph - total number of patients admitted in different wards (Male / Female): Ward A 76 / 51; Ward B 71 / 36; Ward C 22 / 84; Ward D 90 / 31; Ward E 54 / 55.\n\nWhich ward has the greatest number of patients?",
"opts": [
"A",
"B",
"C",
"D"
]
},
{
"n": 84,
"stem": "Graph - total number of patients admitted in different wards (Male / Female): Ward A 76 / 51; Ward B 71 / 36; Ward C 22 / 84; Ward D 90 / 31; Ward E 54 / 55.\n\nWhich ward has the greatest difference between the number of male and female patients?",
"opts": [
"B",
"C",
"D",
"E"
]
},
{
"n": 85,
"stem": "Graph - total number of patients admitted in different wards (Male / Female): Ward A 76 / 51; Ward B 71 / 36; Ward C 22 / 84; Ward D 90 / 31; Ward E 54 / 55.\n\nBy what percentage does the total number of male patients exceed that of female patients across all wards?",
"opts": [
"190%",
"49%",
"22%",
"16%"
]
},
{
"n": 86,
"stem": "Graph - total number of patients admitted in different wards (Male / Female): Ward A 76 / 51; Ward B 71 / 36; Ward C 22 / 84; Ward D 90 / 31; Ward E 54 / 55.\n\nWhat is the average number of female patients across all 5 wards?",
"opts": [
"62",
"51",
"114",
"54"
]
},
{
"n": 87,
"stem": "Graph - total number of patients admitted in different wards (Male / Female): Ward A 76 / 51; Ward B 71 / 36; Ward C 22 / 84; Ward D 90 / 31; Ward E 54 / 55.\n\nWhich of the following statement is falsely interpreted from the graph above?",
"opts": [
"Ward B has the least number of patients",
"Ward D has the greatest number of male patients",
"Ward A has highest number of patients",
"Ward D has nearly the same number of male and female patients."
]
},
{
"n": 88,
"stem": "Use the line graph (number of doctors working in hospitals A-E in 2005, 2010, 2015 and 2020) to answer.\n\nWhich hospital experienced a reduction in the number of doctors between 2010 and 2015?",
"opts": [
"B",
"C",
"D",
"E"
],
"image": "/papers/me/tech2-nursing-2025-doctors-line.png"
},
{
"n": 89,
"stem": "Use the line graph (number of doctors working in hospitals A-E in 2005, 2010, 2015 and 2020) to answer.\n\nBy what percent did the number of doctors at hospital C increase from 2005 to 2020?",
"opts": [
"213%",
"130%",
"56%",
"10%"
],
"image": "/papers/me/tech2-nursing-2025-doctors-line.png"
},
{
"n": 90,
"stem": "Use the line graph (number of doctors working in hospitals A-E in 2005, 2010, 2015 and 2020) to answer.\n\nWhich hospital experienced the largest percentage rise in its number of doctors over the time period 2005 to 2020?",
"opts": [
"A",
"B",
"C",
"D"
],
"image": "/papers/me/tech2-nursing-2025-doctors-line.png"
},
{
"n": 91,
"stem": "Use the line graph (number of doctors working in hospitals A-E in 2005, 2010, 2015 and 2020) to answer.\n\nWhich statement is TRUE as per the data shown in the graph???",
"opts": [
"None of the hospitals has lost more than 50% of their doctors",
"Two hospitals have more than tripled their number of doctors from 2005 to 2020",
"Hospital E has constantly lost doctors throughout the recorded years",
"More than 2 hospitals have fewer doctors in 2020 compared to 2005"
],
"image": "/papers/me/tech2-nursing-2025-doctors-line.png"
},
{
"n": 92,
"stem": "Pie chart - annual budget allocation of a hospital's departments: Dept A 13%, Dept B 25%, Dept C 11%, Dept D 35%, Dept E 16%.\n\nIf the total budget was Nu 540,000, how much did department E get?",
"opts": [
"86400",
"189000",
"59400",
"135000"
]
},
{
"n": 93,
"stem": "Pie chart - annual budget allocation of a hospital's departments: Dept A 13%, Dept B 25%, Dept C 11%, Dept D 35%, Dept E 16%.\n\nIf department B gets Nu 60,000, what was the total budget?",
"opts": [
"171428.6",
"240000",
"59400",
"135000"
]
},
{
"n": 94,
"stem": "Pie chart - annual budget allocation of a hospital's departments: Dept A 13%, Dept B 25%, Dept C 11%, Dept D 35%, Dept E 16%.\n\nIf department D receives Nu 78,500, how much does department E get?",
"opts": [
"78500",
"56071.5",
"50204",
"35885.7"
]
},
{
"n": 95,
"stem": "Pie chart - annual budget allocation of a hospital's departments: Dept A 13%, Dept B 25%, Dept C 11%, Dept D 35%, Dept E 16%.\n\nIf department E receives the entire budget of department C in addition to its own and department D receives Nu 78,500, what is the budget allocated to department D?",
"opts": [
"60557.14",
"24671.43",
"35885.71",
"78500"
]
},
{
"n": 96,
"stem": "Pie chart - annual budget allocation of a hospital's departments: Dept A 13%, Dept B 25%, Dept C 11%, Dept D 35%, Dept E 16%.\n\nWhich statement CANNOT be interpreted from the data graph above?",
"opts": [
"Department C receives the least budget",
"Department B receives a quarter of the total budget",
"Department D has the most patients and thus receives the highest budget",
"Department D receives more budget than departments A and E combined."
]
},
{
"n": 97,
"stem": "Table - medication rounds completed by nurses (Morning / Afternoon / Night): Monday 18 / 15 / 12; Tuesday 20 / 18 / 14; Wednesday 22 / 20 / 16; Thursday 19 / 17 / 15; Friday 21 / 19 / 17.\n\nHow many medication rounds were completed on Wednesday?",
"opts": [
"58",
"59",
"60",
"62"
]
},
{
"n": 98,
"stem": "Table - medication rounds completed by nurses (Morning / Afternoon / Night): Monday 18 / 15 / 12; Tuesday 20 / 18 / 14; Wednesday 22 / 20 / 16; Thursday 19 / 17 / 15; Friday 21 / 19 / 17.\n\nWhat is the average number of rounds in the night shift over the 5 days?",
"opts": [
"14.5",
"15",
"14.8",
"13.5"
]
},
{
"n": 99,
"stem": "Table - medication rounds completed by nurses (Morning / Afternoon / Night): Monday 18 / 15 / 12; Tuesday 20 / 18 / 14; Wednesday 22 / 20 / 16; Thursday 19 / 17 / 15; Friday 21 / 19 / 17.\n\nIf one nurse is allowed to do no more than 8 medication rounds per shift, how many nurses were needed for Wednesday’s total medication rounds?",
"opts": [
"6",
"7",
"8",
"9"
]
},
{
"n": 100,
"stem": "Table - medication rounds completed by nurses (Morning / Afternoon / Night): Monday 18 / 15 / 12; Tuesday 20 / 18 / 14; Wednesday 22 / 20 / 16; Thursday 19 / 17 / 15; Friday 21 / 19 / 17.\n\nWhat is the ratio of medication rounds on Monday between the morning shift and the night shift?",
"opts": [
"5:4",
"4:3",
"2:1",
"3:2"
]
}
]"""

KEY = {
 1: ("c", "Low albumin lowers plasma oncotic pressure, causing oedema."), 4: ("d", "Assessment, diagnosis, planning, implementation, evaluation."),
 5: ("a", "Screening is secondary prevention (early detection)."), 6: ("a", "Shock is inadequate tissue perfusion."),
 7: ("b", "Stage 3: full-thickness skin loss into subcutaneous fat."), 8: ("a", "Norton score of 14 or less = at risk."),
 9: ("c", "Cirrhosis impairs hepatic drug metabolism."), 10: ("b", "Emergencies need command and control."),
 11: ("c", "Clinical nurse leaders improve outcomes at the bedside."), 13: ("d", "Omission: a dose is not given."),
 14: ("c", "Fulfilling RCSC's vision is not an objective of the clinical nursing competency framework."),
 17: ("b", "Correcting hypokalaemia restores muscle strength."), 18: ("c", "Cold water causes vasoconstriction and shivering, trapping heat."),
 19: ("d", "A therapeutic community environment is milieu therapy."), 20: ("a", "Denial, anger, bargaining, depression, acceptance."),
 21: ("c", "Pulmonary stenosis, VSD, overriding aorta, right ventricular hypertrophy."), 22: ("b", "Oral-anal-phallic-latency-genital stages are Freud's."),
 23: ("d", "GCS records neurological (consciousness) status."), 24: ("a", "Kussmaul breathing blows off CO2 to compensate for acidosis."),
 25: ("a", "AMS aims to prevent overuse and misuse of antibiotics."), 27: ("c", "Low PTH causes hypocalcaemia."),
 28: ("a", "Naegele's rule: LMP + 7 days − 3 months + 1 year = 27 Dec 2025."), 29: ("c", "Urge to push and crowning: second stage."),
 30: ("c", "Infections appearing after the first days of admission (here >72 h) are hospital-acquired."),
 31: ("a", "Paying for output reflects Taylor's scientific management."), 32: ("d", "All are risk factors for osteoporosis."),
 33: ("d", "Mutations occur in DNA."), 35: ("b", "Activated charcoal binds cyanide poorly."),
 36: ("a", "Coughing and deep breathing re-expand alveoli."), 37: ("b", "Deciding future actions is planning."),
 38: ("c", "Good Samaritan laws protect those who help in emergencies."), 39: ("d", "Observation is inspection."),
 40: ("c", "Travel history helps identify outbreaks."), 41: ("a", "PR > 0.20 s: first-degree AV block."),
 42: ("b", "White-cell casts suggest pyelonephritis."), 43: ("a", "Acute pain is the priority after surgery."),
 44: ("c", "Identifying and treating hazards is risk management."), 46: ("a", "NANDA-I types: problem-focused, risk, health promotion, syndrome."),
 47: ("b", "Signing a rules form is not an admission objective."), 48: ("d", "Nonmaleficence: do no harm."),
 49: ("c", "Femoral pulse: below the inguinal ligament."), 50: ("b", "COPD patients risk CO2 retention."),
 51: ("b", "Every 6 h after 6 am: 12 pm, 6 pm, 12 am."), 52: ("c", "750/500 × 10 ml = 15 ml."),
 53: ("d", "30 − 3 − 3 = 24 ml; half used leaves 12 ml."), 54: ("b", "90/150 × 5 ml = 3 ml."),
 55: ("b", "Nu 1,500 buys 12 whole rolls = 360 m."), 56: ("c", "200 mg/day in two doses = 100 mg."),
 57: ("b", "500 ml/4 h = 125 ml/h."), 59: ("b", "150 − 30% = 105 mg."), 60: ("a", "(200 − 150)/10 = 5 units."),
 61: ("c", "500 mg at 5 mg/min = 100 min."), 63: ("b", "300 mg ÷ 280 mg/ml ≈ 1.1 ml."), 64: ("d", "125 × 12/60 = 25 drops/min."),
 65: ("c", "8 hours after 1 PM: 9 PM the same day."), 66: ("c", "7.5 × 500 = 2 × V; V = 1875 ml; add 1375 ml."),
 67: ("d", "0.5% = 5 g chlorine per litre = 5 tablets."), 68: ("d", "0.53 × 50 × 60 = 1590 mcg/h ÷ 160 ≈ 9.9 ≈ 10 ml/h."),
 69: ("b", "1:4 means 4/5 of 250 ml = 200 ml NS."), 70: ("c", "At 10 h: 0.5 mg/min = 30 mg/h; 900 mg/500 ml = 1.8 mg/ml; 30/1.8 = 16.6 ml/h."),
 71: ("d", "20 g per 100 ml × 2 = 40 g."), 72: ("c", "25 g drug in 125 ml = 20%, so add 25 ml."), 73: ("c", "2.5 h = 10 × 15 min; 10 × 2 mm = 2 cm; 8 cm left."),
 74: ("b", "8 × 12/10 = 9.6 days."), 75: ("c", "Only 'some ICU patients may be intubated' follows."),
 76: ("b", "Sorted: 12, 13, 13, 14, 15, 15, 16: median 14."), 77: ("c", "Trends over time: line graph."),
 78: ("a", "April + May + June = 37 + 20 + 28 = 85."), 79: ("c", "146/6 ≈ 24."), 80: ("c", "March rose by 9 (20 → 29)."),
 81: ("a", "9/20 = 45%."), 82: ("d", "The graph says nothing about admission criteria."),
 83: ("a", "Ward A has 127 patients."), 84: ("b", "Ward C: 84 − 22 = 62."), 85: ("c", "Male 313 vs female 257: 56/257 ≈ 22%."),
 86: ("b", "257/5 ≈ 51."), 88: ("d", "Hospital E fell from 45 to 12."), 89: ("a", "15 → 47 is a 213% increase."),
 90: ("d", "Hospital D: 12 → 38 (217%), the largest."), 91: ("b", "C (15 → 47) and D (12 → 38) more than tripled."),
 92: ("a", "16% of 540,000 = 86,400."), 93: ("b", "60,000/0.25 = 240,000."), 94: ("d", "78,500 × 16/35 ≈ 35,885.7."),
 95: ("d", "D's own share is given as Nu 78,500."), 96: ("c", "The chart shows no patient numbers."),
 97: ("a", "22 + 20 + 16 = 58."), 98: ("c", "(12 + 14 + 16 + 15 + 17)/5 = 14.8."), 99: ("c", "58/8 = 7.25, so 8 nurses."), 100: ("d", "18:12 = 3:2."),
}

NEW = {
 TA: [("Which stage of pressure injury involves intact skin with non-blanchable redness?", ("Stage 1", "Stage 2", "Stage 3", "Stage 4"), "a", "Stage 1: non-blanchable erythema of intact skin."),
      ("Which of the following is a secondary prevention activity?", ("Immunisation", "Health education on diet", "Pap smear screening", "Physiotherapy after a stroke"), "c", "Screening detects disease early."),
      ("The first step of the nursing process is", ("planning", "assessment", "evaluation", "implementation"), "b", "Assessment comes first."),
      ("A pain score of 7-10 on a 0-10 numeric scale indicates", ("no pain", "mild pain", "moderate pain", "severe pain"), "d", "7-10 is severe pain."),
      ("Which vital sign is most directly measured with a sphygmomanometer?", ("Pulse", "Blood pressure", "Temperature", "Respiration"), "b", "A sphygmomanometer measures blood pressure."),
      ("Hand hygiene with alcohol rub should take about", ("2-5 seconds", "20-30 seconds", "2 minutes", "5 minutes"), "b", "WHO recommends 20-30 seconds for hand rub."),
      ("The normal adult respiratory rate is", ("6-10 per minute", "12-20 per minute", "25-35 per minute", "40-60 per minute"), "b", "12-20 breaths per minute."),
      ("Which position is best for a patient with breathing difficulty?", ("Prone", "Trendelenburg", "Fowler's (sitting up)", "Lithotomy"), "c", "Fowler's position eases breathing.")],
 TB: [("A drug is ordered at 4 mg/kg for a 25 kg child. The dose is", ("75 mg", "100 mg", "125 mg", "50 mg"), "b", "4 × 25 = 100 mg."),
      ("1 litre of fluid is to run over 10 hours. The rate is", ("50 ml/h", "100 ml/h", "150 ml/h", "200 ml/h"), "b", "1000/10 = 100 ml/h.")],
 TC: [("Ward patients (Male / Female): A 40 / 60, B 50 / 50. What percentage of all patients are female?", ("45%", "50%", "55%", "60%"), "c", "110 of 200 = 55%.")],
}

def mk():
    out = []
    for m in json.loads(MCQ):
        if m["n"] not in KEY:
            continue
        letter, exp = KEY[m["n"]]
        topic = TA if m["n"] <= 50 else TB if m["n"] <= 75 else TC
        out.append(dict(key=f"M{m['n']}", real=True, type="mcq", topic=topic, stem=m["stem"], opts=m["opts"], ans="abcd".index(letter), exp=exp, image=m.get("image")))
    for t, items in NEW.items():
        for i, (stem, opts, letter, exp) in enumerate(items):
            out.append(dict(key=f"N{t[9:12]}{i}", new=True, type="mcq", topic=t, stem=stem, opts=list(opts), ans="abcd".index(letter), exp=exp))
    return out

Q = mk()
