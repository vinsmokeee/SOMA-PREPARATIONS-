"""ME Dzongkha category Paper II (English Language and Current Affairs), batch 1: the RCSC BCSE 2025 paper plus a
second set of questions of the same kinds.

Pattern (RCSC BCSE 2025, Dzongkha category, Paper II): 100 marks, 3 hours writing + 15 minutes reading.
  Section I essay: choose 1 of 2 (300-350 words), 25.  Section II letter: choose 1 of 2 (about 150 words), 20.
  Section III comprehension: one passage, Question A (5 multiple-choice items, 1 mark each, written as letters) and
  Questions B, C, D (5 marks each), 20.  Section IV translation Dzongkha -> English, 25.
  Section V current affairs: 10 multiple-choice questions, 1 mark each.
Current-affairs questions 3, 4, 5, 6 and 8 of the real paper are left out: the answer could not be confirmed.
The real translation passage was extracted from a PDF whose font garbles some Dzongkha letters; it was cleaned by
scripts/me/dz_clean.py but MUST be compared with the RCSC PDF by a Dzongkha reader before publishing.
"""

BATCH = "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1"
GROUP_TAG = "2025b1"
PAPER = "me-dzongkha-2"
SUBJECT = "english-language-current-affairs"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper II", "year": 2025,
          "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-II.pdf"}

PATTERN = [
    {"title": "Section I: Essay writing", "type": "essay", "count": 2, "marks_each": 25, "answer_any": 1},
    {"title": "Section II: Letter writing", "type": "long_answer", "count": 2, "marks_each": 20, "answer_any": 1},
    {"title": "Section III: Comprehension", "type": "passage", "count": 1, "marks_each": 20, "answer_any": None},
    {"title": "Section IV: Translation (Dzongkha to English)", "type": "translation", "count": 1, "marks_each": 25, "answer_any": None},
    {"title": "Section V: Current affairs", "type": "mcq", "count": 10, "marks_each": 1, "answer_any": None},
]

# RCSC: essays "orderly and coherent presentation of materials, content, analytical ability, and use of appropriate
# features and general accuracy of spellings, punctuation and grammar".
RUBRIC = [
    ("Content and analysis", "Relevant, well-developed points that answer exactly what is asked.", 8),
    ("Organisation", "Orderly, coherent presentation; correct format for letters; paragraphs.", 5),
    ("Language accuracy", "Grammar, spelling, punctuation and appropriate vocabulary.", 7),
]

E, L, C, T, M = "essay", "long_answer", "passage", "translation", "mcq"
DZ_ISSUE = "Dzongkha text: please have a fluent Dzongkha reader check it before publishing."
PDF_ISSUE = "Real translation passage extracted from a PDF with a faulty font and cleaned automatically: compare it word by word with the RCSC PDF."

TRANSLATION_1 = '''@@TRANSLATION@@'''
