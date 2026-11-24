"""usage: medwrite.py year header.txt body.py out.py - writes a Technical Paper II Engineering module"""
import json, sys
y, head, body, out = sys.argv[1], open(sys.argv[2]).read(), open(sys.argv[3]).read(), sys.argv[4]
D = "/tmp/claude-0/-home-user-SOMA-PREPARATIONS-/1e5440e4-299a-59c5-8896-aa7b23e5c884/scratchpad/eng2"
mcq = json.load(open(f"{D}/y{y}.json"))["mcq"]
ns = {}
exec(body.split("#--FIX--")[0], ns)  # FIX = {n: {"stem": ..., "opts": [...]}}
import re
CUT = re.compile(r"\s+(Use the |Use information|The line graph|The scatter plot|The boxplot|The plot|The table|Suppose the|Read the|Study the|Refer to|Consider the following).*$", re.S)
for m in mcq:
    m["opts"] = [CUT.sub("", o).strip() for o in m["opts"]]
    f = ns.get("FIX", {}).get(m["n"], {})
    m.update(f)
src = f'''"""{head.strip()}
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Engineering): BCSE {y}, batch 1"
GROUP_TAG = "eng{y}"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "engineering"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {{"title": "BCSE {y} Main Examination, Technical Paper II, Engineering", "year": {y}, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}
PATTERN = [
    {{"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None}},
    {{"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None}},
]
TOPIC = "Engineering: general subject knowledge"

MCQ = r"""{json.dumps(mcq, ensure_ascii=False, indent=0)}"""

{body.split("#--FIX--")[1].strip()}

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
'''
open(out, "w").write(src)
print("wrote", out)
