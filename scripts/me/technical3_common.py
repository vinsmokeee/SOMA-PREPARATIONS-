"""Shared pieces for Technical Paper III (Subject Specialisation Paper) modules, one module per specialisation.
A module defines MCQ (parsed real questions, JSON), KEY {number: (letter, explanation)}, and uses saq(), case() and
new_mcq() to build Q. Real MCQs whose answer could not be confirmed are left out of KEY and replaced by new ones."""
import json, re

CLEAN = re.compile(r"\s*SUBJECT SPECIALISATION PAPER FOR [A-Z &]+\s*$")

RUBRIC = [
    ("Content", "Correct facts, terms, working and reasoning; answers exactly what is asked.", 12),
    ("Application", "Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.", 5),
    ("Expression", "Clear, organised answer; units and labels where needed.", 3),
]

STANDARD = [  # BCSE 2025 Paper III, most specialisations: 100 marks, 150 min + 15 min reading
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions", "type": "short_answer", "count": 4, "marks_each": 5, "answer_any": None},
    {"title": "Section B: Case study (answer either Case I or Case II)", "type": "passage", "count": 2, "marks_each": 50, "answer_any": 1},
]


def mcqs(mcq_json, key, topic, fix=None):
    out = []
    fix = fix or {}
    for m in json.loads(mcq_json):
        if m["n"] not in key:
            continue
        m = dict(m, stem=CLEAN.sub("", m["stem"]), opts=[CLEAN.sub("", o) for o in m["opts"]])
        m = dict(m, **fix.get(m["n"], {}))
        letter, exp = key[m["n"]]
        out.append(dict(key=f"M{m['n']}", real=True, type="mcq", topic=topic, stem=m["stem"], opts=m["opts"], ans="abcd".index(letter), exp=exp, image=m.get("image")))
    return out


def new_mcq(i, topic, stem, opts, letter, exp):
    return dict(key=f"N{i}", new=True, type="mcq", topic=topic, stem=stem, opts=list(opts), ans="abcd".index(letter), exp=exp)


def saq(n, topic, stem, kp, model, marks=5, issues=(), image=None):
    """Stem with parts 'a) ... (N marks)' on their own lines (split one part per screen); key points and model with
    the same 'a) ' prefixes. A stem with no parts is one question."""
    return dict(key=f"S{n}", real=True, type="short_answer", marks=marks, topic=topic, stem=stem, key_points=kp, model=model, issues=list(issues), image=image)


def case(paper_tag, c, topic, intro, items, issues=(), image=None):
    """One case study = one passage group; every question repeats the case text (folded in the exam room).
    items: (question text, marks, key points, model). Sub-parts inside a question use (i), (ii) - not a), b)."""
    g = f"me-technical-3-{paper_tag}-case{c}"
    return [dict(key=f"C{c}Q{i + 1}", real=True, type="passage", marks=m, topic=topic, group=g, pos=i + 1,
                 stem=f"{intro.strip()}\n\n{text.strip()} ({m} marks)", key_points=kp, model=model, issues=list(issues), image=image)
            for i, (text, m, kp, model) in enumerate(items)]
