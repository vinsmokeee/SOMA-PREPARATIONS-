"""ME Technical Paper II, MEDICAL SCIENCE group, BCSE 2022 - the paper's DIAGRAM questions (founder, 23 Nov 2026: diagram
questions repeat, so keep them with the photo from the actual paper). Images are cropped from the PDF pages. Added to the
same batch as me_technical2_medsci_2022.py; labels marked in 'issues' must be checked against an anatomy text.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Medical Science): BCSE 2022, batch 1"
GROUP_TAG = "medsci2022d"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "medical-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2022 Main Examination, Technical Paper II, Medical Science", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [  # the paper's pattern (already on Soma; ADDS_TO_PAPER keeps it unchanged)
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Medical Science: general subject knowledge"
IMG = "/papers/me/tech2-medsci-2022-{}.png"

MCQ = r'''[
{
"n": 65,
"stem": "The following logic symbol is equivalent to:",
"opts": [
"AND gate",
"OR gate",
"NOT gate",
"NAND gate"
],
"image": "/papers/me/tech2-medsci-2022-gates.png"
}
]'''

KEY = {65: ("a", "A NAND gate followed by a NOT gate (a NAND with its inputs joined) inverts the NAND output again, giving Y = A·B: an AND gate.")}

SAQ = [
 dict(marks=3, stem="Name the structural parts of the human ear numbered 1-9 in the following diagram. You need not draw the diagram; list the name of each part with its number. (3 marks)", image=IMG.format("ear"),
      kp=[("1 Malleus; 2 Incus; 3 Stapes", 1), ("4 Semicircular canals; 5 Cochlea; 6 Auditory (vestibulocochlear) nerve", 1),
          ("7 Round window; 8 Tympanic membrane (eardrum); 9 Pinna (auricle)", 1)],
      issues=["Labels read from the diagram by Claude - check 7 (round window or oval window) and 8 against an anatomy text."],
      model="1 - Malleus (hammer); 2 - Incus (anvil); 3 - Stapes (stirrup); 4 - Semicircular canals; 5 - Cochlea; 6 - Auditory (vestibulocochlear) nerve; 7 - Round window; 8 - Tympanic membrane (eardrum); 9 - Pinna (auricle)."),
 dict(marks=3, stem="From the diagram given below, write down the names of the parts of the human eye in the correct sequence of the numbers 1-9 (the diagram need not be drawn). (3 marks)", image=IMG.format("eye"),
      kp=[("1 Aqueous humour (anterior chamber)/ pupil; 2 Cornea; 3 Lens", 1), ("4 Iris; 5 Vitreous humour; 6 Fovea (yellow spot)", 1),
          ("7 Optic nerve; 8 Retina; 9 Choroid (sclera outermost)", 1)],
      issues=["Labels read from the diagram by Claude - check 1 (aqueous humour or pupil), 6 (fovea or blind spot) and 9 (choroid or sclera)."],
      model="1 - Aqueous humour in the anterior chamber (the opening behind it is the pupil); 2 - Cornea; 3 - Lens; 4 - Iris; 5 - Vitreous humour; 6 - Fovea centralis (yellow spot); 7 - Optic nerve; 8 - Retina; 9 - Choroid (the outermost white coat is the sclera)."),
 dict(marks=3, stem="From the diagram given below, write down the names of the parts of the human heart in the correct sequence of the numbers 1-13 (the diagram need not be drawn). (3 marks)", image=IMG.format("heart"),
      kp=[("1 Right ventricle; 2 Tricuspid valve; 3 Inferior vena cava; 4 Right atrium; 5 Superior vena cava", 1),
          ("6 Pulmonary (semilunar) valve; 7 Aortic arch; 8 Pulmonary artery; 9 Pulmonary veins", 1),
          ("10 Left atrium; 11 Aortic (semilunar) valve; 12 Mitral (bicuspid) valve; 13 Left ventricle", 1)],
      issues=["Labels read from the diagram by Claude - check 1, 6, 8 and 11 against an anatomy text."],
      model="1 - Right ventricle; 2 - Tricuspid valve; 3 - Inferior vena cava; 4 - Right atrium; 5 - Superior vena cava; 6 - Pulmonary (semilunar) valve; 7 - Arch of the aorta; 8 - Pulmonary artery (trunk); 9 - Pulmonary veins; 10 - Left atrium; 11 - Aortic (semilunar) valve; 12 - Mitral (bicuspid) valve; 13 - Left ventricle."),
]

Q = build_q(MCQ, KEY, TOPIC, [], SAQ)
