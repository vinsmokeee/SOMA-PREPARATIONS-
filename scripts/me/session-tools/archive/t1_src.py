"""ME Technical category Paper I (Language and General Knowledge), batch 1: the RCSC BCSE 2025 paper plus a second
set of questions of the same kinds. PDF sent by the founder (20 Nov 2026; the RCSC site blocked downloads).

Pattern (RCSC BCSE 2025, Technical, Paper I): 3 hours writing + 15 minutes reading; cover: "100 [70 marks for English
and GK; 30 marks for Dzongkha]".
  Section I case study: one passage, ALL three questions, 10 marks each (30).
  Section II topical discussion: answer ANY TWO of three, 10 marks each (20).
  Section III general knowledge: 20 multiple choice, 1 mark each (20).
  Section IV Dzongkha comprehension: one passage; ka 4 short answers x 2 (8), kha 4 multiple choice x 1 (4),
  ga sentences (3), nga find and correct 5 spelling mistakes (5) = 20 as printed.
  Section V translation English -> Dzongkha, 15.
NOTE: the printed section marks add up to 105 (Dzongkha 20 + 15 = 35, not the 30 on the cover). Kept as printed;
the founder has been told.
Left out of Section III (answer not certain or question flawed): Q13 (ATP No. 1 changed during 2025), Q18 (there was no
2022 FIBA World Cup), Q20 (HDI rank). Section IV kha item 2 has no confirmed answer (marked in the guide).
The Dzongkha PDF font adds a stray subjoined YA (སོན -> སྱོན); cleaned with dz_fix.fix_extra_ya. Dzongkha needs a
fluent reader's check before publishing.
"""

BATCH = "ME Paper I (Technical): BCSE 2025 + similar, batch 1"
GROUP_TAG = "2025b1"
PAPER = "me-technical-1"
SUBJECT = "language-general-knowledge"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025,
          "url": "https://rcsc.gov.bt/technical-paper-1/"}

CS, TOP, M, C, T = "analytical", "long_answer", "mcq", "passage", "translation"
PATTERN = [
    {"title": "Section I: Case study", "type": CS, "count": 1, "marks_each": 30, "answer_any": None},
    {"title": "Section II: Topical discussion", "type": TOP, "count": 3, "marks_each": 10, "answer_any": 2},
    {"title": "Section III: General knowledge", "type": M, "count": 20, "marks_each": 1, "answer_any": None},
    {"title": "Section IV: Dzongkha comprehension (གོ་བ་ལེན་ནི།)", "type": C, "count": 1, "marks_each": 20, "answer_any": None},
    {"title": "Section V: Translation (སྐད་སྒྱུར།)", "type": T, "count": 1, "marks_each": 15, "answer_any": None},
]
RUBRIC = [
    ("Content and relevance", "Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).", 8),
    ("Analysis and examples", "Explains reasons and effects, gives Bhutanese examples and practical suggestions.", 5),
    ("Language", "Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).", 4),
    ("Organisation", "Logical order, paragraphs or points.", 3),
]
DZ = "Dzongkha: please have a fluent Dzongkha reader check it before publishing."
PDF = "Real RCSC Dzongkha text from a PDF whose font adds stray letters; cleaned automatically: compare with the PDF."

CASE_1 = """Read the following passage and answer ALL THREE questions.

The Threat of NCDs - Case Study

@@CASE@@"""

CASE_2 = """Read the following passage and answer ALL THREE questions.

Road Safety on Bhutan's Highways - Case Study

Every year, road crashes in Bhutan take dozens of lives and leave many more injured, often young people in the most productive years of their lives. Behind each number is a family that loses a breadwinner, a student or a parent. With the number of vehicles growing faster than the population, the problem is likely to grow unless attitudes change.

Many crashes have the same causes. Drivers speed on winding mountain roads, overtake on blind curves and drive after drinking at social gatherings. Some drivers are tired after long journeys to deliver goods or passengers on time. Others are distracted by mobile phones. Heavy trucks carrying construction materials and boulders share narrow roads with taxis and private cars.

Road conditions add to the danger. Landslides, potholes and roadworks during the monsoon make driving difficult, and many stretches still have no crash barriers or proper signs. In winter, black ice and fog on high passes catch drivers by surprise.

Enforcement has improved, with checkpoints and alcohol tests, but traffic police cannot be everywhere. Some experts say that driving schools teach people how to pass the test rather than how to drive safely. Others point out that once a licence is issued, a driver may never be tested again.

Road safety is not only the job of the police or the road department. It begins with every driver, passenger and pedestrian choosing to follow the rules even when nobody is watching.

"Arrive alive: it is better to be late than never." """

def cs(key, pos, stem, kp, model, group, real=False, parent=None, passage=None):
    return dict(key=key, real=real, parent=parent, kind="new_scenario" if parent else None, type=CS, marks=10,
                topic="Case study", group=group, pos=pos, stem=(passage + "\n\n" + stem) if passage else stem,
                key_points=kp, model=model)

def mcq(key, stem, opts, ans, exp, real=False, topic="General knowledge"):
    return dict(key=key, real=real, new=not real, type=M, topic=topic, stem=stem, opts=opts, ans=ans, exp=exp)

DZ_PASSAGE = """@@DZP@@"""
