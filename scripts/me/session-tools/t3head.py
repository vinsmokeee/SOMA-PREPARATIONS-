"""Write the head of a Technical Paper III module: docstring, settings, embedded MCQ JSON. Usage: t3head.py <parsed.json> <module.py> <spec-code> <tag> <Name> <doc>"""
import json, sys
src, out, spec, tag, name, doc = sys.argv[1:7]
mcq = json.dumps(json.load(open(src))['mcq'], ensure_ascii=False, indent=0)
open(out, 'w').write(f'''"""ME Technical Paper III (Subject Specialisation Paper), {name}, BCSE 2025 - real paper (PDF sent by the founder).
{doc}
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, {name}): BCSE 2025, batch 1"
GROUP_TAG = "{tag}2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "{spec}"
MIN_WORDS = 0
SOURCE = {{"title": "BCSE 2025 Main Examination, Technical Paper III, {name}", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}
TOPIC = "{name}"

MCQ = r"""{mcq}"""
''')
