"""Shared pieces for Technical Paper II batch modules (one module per subject group).
A module defines MCQ (parsed real questions), KEY {number: (letter, explanation)}, optional NEW_MCQ and SAQ, and calls
build_q() to produce the builder's Q list. Real MCQs whose answer could not be confirmed are left out of KEY."""
import json

RUBRIC = [
    ("Content", "Correct facts, terms and reasoning; answers exactly what is asked.", 12),
    ("Explanation", "Explains clearly with examples, steps or a diagram description where useful.", 5),
    ("Expression", "Clear, concise and well-organised answer.", 3),
]


def build_q(mcq_json, key, topic, new_mcq=(), saq=()):
    mcqs = json.loads(mcq_json)
    q = []
    for m in mcqs:
        if m["n"] not in key:
            continue
        letter, exp = key[m["n"]]
        q.append(dict(key=f"M{m['n']}", real=True, type="mcq", topic=topic, stem=m["stem"], opts=m["opts"],
                      ans="abcd".index(letter), exp=exp))
    for i, (stem, opts, letter, exp) in enumerate(new_mcq):
        q.append(dict(key=f"N{i + 1}", new=True, type="mcq", topic=topic, stem=stem, opts=list(opts), ans="abcd".index(letter), exp=exp))
    for i, s in enumerate(saq):
        q.append(dict(key=f"S{i + 1}", real=s.get("real", True), new=not s.get("real", True), type="short_answer", marks=s["marks"],
                      topic=topic, stem=s["stem"], key_points=s["kp"], model=s["model"], issues=s.get("issues", []), image=s.get("image")))
    return q
