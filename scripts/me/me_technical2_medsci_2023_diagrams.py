"""ME Technical Paper II, MEDICAL SCIENCE group, BCSE 2023 - the paper's DIAGRAM questions (founder, 23 Nov 2026: diagram
questions repeat, so keep them with the photo from the actual paper). Images are cropped from the PDF pages. Added to the
same batch as me_technical2_medsci_2023.py; labels marked in 'issues' must be checked against an anatomy text.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Medical Science): BCSE 2023, batch 1"
GROUP_TAG = "medsci2023d"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "medical-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2023 Main Examination, Technical Paper II, Medical Science", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [  # the paper's pattern (already on Soma; ADDS_TO_PAPER keeps it unchanged)
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Medical Science: general subject knowledge"
IMG = "/papers/me/tech2-medsci-2023-{}.png"

MCQ = r'''[]'''

KEY = {}

SAQ = [
 dict(marks=3, stem="In the following diagram of the human heart, name the parts of the heart numbered 1-19. The diagram need not be drawn, but each number should be written correctly with its part. (3 marks)", image=IMG.format("heart"),
      kp=[("1 Arch of aorta; 2 Ascending aorta; 3 Pulmonary veins (left); 4 Openings of pulmonary veins; 5 Left atrium; 6 Mitral (bicuspid) valve; 7 Aortic (semilunar) valve", 1),
          ("8 Left ventricle; 9 Interventricular septum; 10 Descending aorta; 11 Inferior vena cava; 12 Right ventricle; 13 Pulmonary (semilunar) valve", 1),
          ("14 Tricuspid valve; 15 Right atrium; 16 Superior vena cava; 17 Pulmonary trunk; 18 Right pulmonary artery; 19 Left pulmonary artery", 1)],
      issues=["Labels read from the diagram by Claude - check 1, 2, 4, 17, 18 and 19 against an anatomy text."],
      model="1 - Arch of the aorta; 2 - Ascending aorta; 3 - Left pulmonary veins; 4 - Openings of the pulmonary veins into the left atrium; 5 - Left atrium; 6 - Mitral (bicuspid) valve; 7 - Aortic (semilunar) valve; 8 - Left ventricle; 9 - Interventricular septum; 10 - Descending aorta; 11 - Inferior vena cava; 12 - Right ventricle; 13 - Pulmonary (semilunar) valve; 14 - Tricuspid valve; 15 - Right atrium; 16 - Superior vena cava; 17 - Pulmonary trunk; 18 - Right pulmonary artery; 19 - Left pulmonary artery."),
]

Q = build_q(MCQ, KEY, TOPIC, [], SAQ)
