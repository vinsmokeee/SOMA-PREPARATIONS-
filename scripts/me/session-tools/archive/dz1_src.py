"""ME Dzongkha category Paper I (Dzongkha Language and General Knowledge), batch 1: the RCSC BCSE 2025 paper plus a
second set of questions of the same kinds.

Pattern (RCSC BCSE 2025, Dzongkha category, Paper I): 100 marks, 3 hours writing + 15 minutes reading.
  Q1 essay (འབྲི་རྩོམ།): choose 1 of 2, 450-500 words, 20 marks.
  Q2 formal writing (ཡིག་བསྐུར་རྣམ་གཞག།): choose 1 of 2, 15 marks.
  Q3 comprehension (གོ་བ་ལེན་ནི།): one passage, 5 questions of 3 marks (15).
  Q4 translation Chöke to Dzongkha (སྐད་སྒྱུར།): 20 marks.
  Q5 general knowledge (སྤྱིར་བཏང་ཤེས་ཡོན།): (a) 10 short questions x 2 marks; (b) 10 multiple choice x 1 mark (30).
Left out of the real paper because the answer could not be confirmed: Q5(a) 1, 4, 6 and 8; Q5(b) 2 and 4.
The RCSC PDF font drops letters from some Dzongkha words; the real text was repaired with scripts/me/dz_fix.py.
All Dzongkha MUST be checked by a fluent Dzongkha reader before publishing.
"""

BATCH = "ME Paper I (Dzongkha category): BCSE 2025 + similar, batch 1"
GROUP_TAG = "2025b1"
PAPER = "me-dzongkha-1"
SUBJECT = "dzongkha-language-general-knowledge"
MIN_WORDS = 0  # Dzongkha is not separated by spaces; length is checked by eye
SOURCE = {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper I", "year": 2025,
          "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-I.pdf"}
DZ_ISSUE = "Dzongkha: please have a fluent Dzongkha reader check the question wording, model answer and marking guide before publishing."
PDF_ISSUE = "Real RCSC text extracted from a PDF whose font drops letters; repaired automatically: compare it with the RCSC PDF."

PATTERN = [
    {"title": "Question 1: Essay (འབྲི་རྩོམ།)", "type": "essay", "count": 2, "marks_each": 20, "answer_any": 1},
    {"title": "Question 2: Formal writing (ཡིག་བསྐུར་རྣམ་གཞག།)", "type": "long_answer", "count": 2, "marks_each": 15, "answer_any": 1},
    {"title": "Question 3: Comprehension (གོ་བ་ལེན་ནི།)", "type": "passage", "count": 1, "marks_each": 15, "answer_any": None},
    {"title": "Question 4: Translation (སྐད་སྒྱུར།)", "type": "translation", "count": 1, "marks_each": 20, "answer_any": None},
    {"title": "Question 5 (a): General knowledge (སྤྱིར་བཏང་ཤེས་ཡོན།)", "type": "short_answer", "count": 10, "marks_each": 2, "answer_any": None},
    {"title": "Question 5 (b): General knowledge, multiple choice", "type": "mcq", "count": 10, "marks_each": 1, "answer_any": None},
]

RUBRIC = [
    ("Content (ནང་དོན།)", "Answers what is asked with relevant, correct and well-developed points.", 8),
    ("Structure (འབྲི་བཀོད།)", "Correct format for the task (essay, letter, agreement), logical order and paragraphs.", 5),
    ("Language and spelling (སྐད་ཡིག་དང་ཡིག་སྦྱོར།)", "Correct Dzongkha grammar, honorifics, spelling and punctuation.", 7),
]

E, L, C, T, G, M = "essay", "long_answer", "passage", "translation", "short_answer", "mcq"
REAL = [DZ_ISSUE, PDF_ISSUE]
NEW = [DZ_ISSUE]

E_INSTR = """@@E_INSTR@@ (སྐུགས་ ༢༠)"""
L_INSTR = """@@L_INSTR@@ (སྐུགས་ ༡༥)"""
COMP_1 = """འོག་གི་ཡིག་རྒྱུགས་འདི་ལྷག་ཞིནམ་ལས་ དྲི་བ་ག་ར་ལུ་ལན་བྲིས། དྲི་བ་རེ་ལུ་སྐུགས་ ༣ རེ།

@@COMP@@"""
CQ = """@@CQ@@"""
TR_1 = """@@TR@@"""

COMP_2 = """འོག་གི་ཡིག་རྒྱུགས་འདི་ལྷག་ཞིནམ་ལས་ དྲི་བ་ག་ར་ལུ་ལན་བྲིས། དྲི་བ་རེ་ལུ་སྐུགས་ ༣ རེ།

རྫོང་ཁ་འདི་ རྒྱལ་ཁབ་ཀྱི་ངོ་རྐྱང་ཨིན།

༉ རྫོང་ཁ་འདི་ འབྲུག་རྒྱལ་ཁབ་ཀྱི་རྒྱལ་ཡོངས་སྐད་ཡིག་ཨིནམ་སྦེ་ རྩ་ཁྲིམས་ཆེན་མོ་ནང་ཁ་གསལ་སྦེ་བཀོད་དེ་ཡོདཔ་ཨིན། སྔོན་མ་ རྫོང་ཁག་ཚུ་ནང་ ཆོས་དང་སྲིད་ཀྱི་ལཱ་ཚུ་ ཆོས་སྐད་དང་ རྫོང་ཁ་ནང་ལས་ར་འབད་སྲོལ་ཡོདཔ་ལས་ རྫོང་ཁ་ཟེར་བའི་མིང་ཡང་ དེ་ལས་ར་བྱུང་ཡོདཔ་ཨིན་ཟེར་ བཤདཔ་ཨིན། སྤྱི་ལོ་ ༡༩༧༡ ལུ་ རྫོང་ཁ་འདི་ སློབ་གྲྭ་ཚུ་ནང་ རྒྱལ་ཡོངས་སྐད་ཡིག་སྦེ་ སློབ་སྟོན་འབད་འགོ་བཙུགས་ཡོདཔ་ད་ སྤྱི་ལོ་ ༡༩༨༦ ལུ་ རྫོང་ཁ་གོང་འཕེལ་ལྷན་ཚོགས་ གཞི་བཙུགས་གནང་ཡོདཔ་ཨིན།

དེང་སང་ འཛམ་གླིང་གཅིག་འགྱུར་དང་ བརྒྱུད་འཕྲིན་གྱི་ལག་ལེན་ ཡར་སེང་འགྱོ་མི་དང་གཅིག་ཁར་ ན་གཞོན་མང་ཤོས་ཅིག་གིས་ ཁ་སླབ་ནི་དང་ ཡི་གུ་བྲི་ནི་ཚུ་ ཨིང་ལིཤ་སྐད་ནང་ལས་ འབད་དགའཝ་སྦེ་འདུག། དེ་གིས་ རྫོང་ཁ་གི་ཡིག་སྦྱོར་དང་ ཞེ་ས་ཚུ་ ཉམས་འགྱོ་ནིའི་ཉེན་ཁ་ཡོདཔ་ཨིན། འདི་བཟུམ་མའི་གནས་སྟངས་ནང་ ཁྱིམ་ནང་ ཕ་མ་ཚུ་གིས་ ཨ་ལུ་ཚུ་དང་གཅིག་ཁར་ རྫོང་ཁ་ནང་ཁ་སླབ་ནི་དང་ སློབ་གྲྭ་ཚུ་ནང་ རྫོང་ཁ་གི་རྩེད་འགྲན་དང་ དཔེ་ཀློག་གི་ལས་རིམ་ཚུ་ འགོ་འདྲེན་འཐབ་དགོཔ་ཨིན།

སྐད་ཡིག་ཅིག་ཉམས་པ་ཅིན་ ལོ་རྒྱུས་ ལམ་སྲོལ་ དེ་ལས་ ཤེས་ཡོན་ཚུ་ཡང་ མཉམ་སྦེ་ཉམས་འགྱོཝ་ཨིན། དེ་འབདཝ་ལས་ རྫོང་ཁ་འདི་ ཡིག་ཚང་རྐྱངམ་ཅིག་གི་ལཱ་མེན་པར་ འབྲུག་མི་ག་ར་གི་འགན་ཁུར་ཨིནམ་ལས་ ཉིན་བསར་གྱི་མི་ཚེ་ནང་ ཧ་ལམ་ཅིག་ ལག་ལེན་འཐབ་ཐོག་ལས་ མ་འོངས་མི་རབས་ཚུ་ལུ་ ཉམས་མེད་སྦེ་ སྤྲོད་དགོཔ་ཨིན།"""

TR_2 = """འོག་ལུ་ཆོས་སྐད་ནང་ཡོད་མི་འདི་ རྫོང་ཁ་ཉག་རྐྱང་ནང་སྐད་སྒྱུར་འབད།

༄༅། ། སྔོན་རྒྱལ་པོ་ཞིག་གི་བློན་པོ་མཁས་ཤིང་བཙུན་པ་ཞིག་ཡོད་དོ། ། དུས་ཤིག་ན་རྒྱལ་པོས་བློན་པོ་ལ། འཇིག་རྟེན་ན་རིན་ཐང་ཆེ་ཤོས་ཅི་ཡིན་ཞེས་དྲིས་པས། བློན་པོས་ལན་དུ། གསེར་དངུལ་ནོར་བུ་རྣམས་རིན་ཐང་ཆེ་མོད། འོན་ཀྱང་ཡོན་ཏན་དང་ཀུན་སྤྱོད་བཟང་པོ་ནི་དེ་བས་ཀྱང་རིན་ཐང་ཆེའོ། ། ནོར་ནི་ཆོམ་རྐུན་གྱིས་འཕྲོག་ཏུ་རུང་། ཡོན་ཏན་ནི་སུས་ཀྱང་འཕྲོག་མི་ནུས། ཞེས་ཞུས་སོ། ། རྒྱལ་པོ་ཡི་རངས་ནས་ཡུལ་གྱི་བུ་ཕྲུག་རྣམས་ལ་ཡོན་ཏན་སློབ་པའི་སློབ་གྲྭ་མང་པོ་བཙུགས་སོ། །"""

