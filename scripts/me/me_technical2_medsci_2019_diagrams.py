"""ME Technical Paper II, MEDICAL SCIENCE group, BCSE 2019 - the paper's DIAGRAM questions (founder, 23 Nov 2026: diagram
questions repeat, so keep them with the photo from the actual paper). Images are cropped from the PDF pages. Added to the
same batch as me_technical2_medsci_2019.py; labels marked in 'issues' must be checked against an anatomy text.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Medical Science): BCSE 2019, batch 1"
GROUP_TAG = "medsci2019d"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "medical-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2019 Main Examination, Technical Paper II, Medical Science", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [  # the paper's pattern (already on Soma; ADDS_TO_PAPER keeps it unchanged)
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Medical Science: general subject knowledge"
IMG = "/papers/me/tech2-medsci-2019-{}.png"

MCQ = r'''[
{
"n": 11,
"stem": "Cell division takes place in four phases. Choose the correct phase of the cell division from the diagram provided.",
"opts": [
"Prophase",
"Metaphase",
"Anaphase",
"Telophase"
],
"image": "/papers/me/tech2-medsci-2019-mitosis.png"
}
]'''

KEY = {11: ("c", "The diagram shows the two sets of chromatids being pulled apart towards opposite poles by the spindle fibres - this is anaphase.")}

SAQ = [
 dict(marks=3, stem="Label the following diagram of the human ear numbered 1-9. (3 marks)", image=IMG.format("ear"),
      kp=[("1 Pinna (auricle); 9 External auditory canal; 8 Tympanic membrane (eardrum)", 1),
          ("2 Malleus; 3 Incus; 4 Stapes (the ear ossicles)", 1),
          ("5 Semicircular canals; 6 Cochlea; 7 Auditory (vestibulocochlear) nerve", 1)],
      issues=["Labels read from the diagram by Claude - check 2, 3 and 4 (order of the ossicles) against an anatomy text."],
      model="1 - Pinna (auricle); 2 - Malleus (hammer); 3 - Incus (anvil); 4 - Stapes (stirrup); 5 - Semicircular canals; 6 - Cochlea; 7 - Auditory (vestibulocochlear) nerve; 8 - Tympanic membrane (eardrum); 9 - External auditory canal (ear canal). The pinna and canal form the outer ear, the eardrum and three ossicles the middle ear, and the cochlea and semicircular canals the inner ear."),
]

Q = build_q(MCQ, KEY, TOPIC, [], SAQ)
