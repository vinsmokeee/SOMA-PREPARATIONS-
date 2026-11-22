"""Load a Traditional Medicine (Drungtsho) Technical Paper II in Dzongkha as DRAFT questions with no answers
(founder, 22 Nov 2026: accuracy first - Sowa Rigpa answer keys need a Drungtsho, as for Paper III). The question text
is copied programmatically from the PDF text (pdftotext -layout) and repaired with dz_fix; the expert adds the correct
options, model answers and key points in admin.

Layout read from the 2024 paper: Section Ka = numbered MCQs '༡༽' with options ཀ ཁ ག ང; Section Kha (after
'༼སྡེ་ཚན་ཁ༽') = question blocks 'དྲི་བ་དང་པ།', 'དྲི་བ་གཉིས་པ།', ... The last block holds numbered written questions with
their marks in brackets; the blocks before it are single short-answer sets (fill-in, definitions, true/false).
Founder rule (21 Nov 2026): older years follow the LATEST paper's layout and marks (2025: short-answer sets 5 marks each,
written questions 3 marks each); a changed mark is noted in the stem. The 2025 layout itself is not touched.

Usage: python3 -I scripts/me/load_tradmed2_questions.py <paper.txt> <year> <out.sql>
"""
import json
import os
import re
import runpy
import sys

src, year, out_path = sys.argv[1], int(sys.argv[2]), sys.argv[3]
dz = runpy.run_path(os.path.join(os.path.dirname(__file__), 'dz_fix.py'))['fix']
TIB = str.maketrans('༠༡༢༣༤༥༦༧༨༩', '0123456789')
BATCH = f"ME Paper II (Technical, Traditional Medicine): BCSE {year} - questions only, Drungtsho to add answers"
SOURCE = {"title": f"BCSE {year} Main Examination, Technical Paper II, Traditional Medicine", "year": year, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
RUBRIC = [("Content", "Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.", 12),
          ("Application", "Applies the idea to the question with examples or steps.", 5),
          ("Expression", "Clear, organised answer in good Dzongkha.", 3)]
SET_MARKS, WRITTEN_MARKS = 5, 3


def q(s):
    return 'null' if s is None else "'" + str(s).replace("'", "''") + "'"


def clean(block):
    lines = [re.sub(r'\s+', ' ', ln).strip() for ln in block.split('\n')]
    keep = [ln for ln in lines if ln and not re.search(r'Page \d+ of \d+|PAPER II: GENERAL|བཀྲིས་བདེ་ལེགས', ln)]
    return dz('\n'.join(keep))


t = open(src).read()
start = t.index('༼སྡེ་ཚན་ཀ༽')
sec_b = t.index('༼སྡེ་ཚན་ཁ༽', start)
a, b = t[start:sec_b], t[sec_b:]

mcqs = []
for m in re.finditer(r'\n[ \t]*([༠-༩]+)༽\s(.*?)(?=\n[ \t]*[༠-༩]+༽\s|\Z)', a, re.S):
    body = clean(m.group(2))
    parts = re.split(r'\n(?=[ཀཁགང]་?\s)', '\n' + body)
    opts = [re.sub(r'^[ཀཁགང]་?\s+', '', p).strip() for p in parts[1:]]
    mcqs.append(dict(n=int(m.group(1).translate(TIB)), stem=parts[0].strip(), opts=opts))
assert [x['n'] for x in mcqs] == list(range(1, len(mcqs) + 1)), [x['n'] for x in mcqs]
assert all(len(x['opts']) == 4 for x in mcqs), [(x['n'], len(x['opts'])) for x in mcqs if len(x['opts']) != 4]

blocks = re.split(r'\n(?=དྲི་བ་[^\n]{1,12}པ།)', b)
blocks = [x for x in blocks if re.match(r'དྲི་བ་[^\n]{1,12}པ།', x.strip())]
*sets, written = blocks


def printed_total(block):
    m = re.search(r'=\s*([༠-༩0-9]+)\s*༽', block)
    return int(m.group(1).translate(TIB)) if m else None


NOTE = '\n\n(Marks: {new:g} - set to the latest RCSC layout; the {year} paper gave {old}.)'


def remark(s, old, new):
    return s if old == new else s + NOTE.format(new=new, old=old, year=year)


items = [dict(type='mcq', marks=1, stem=x['stem'], opts=x['opts']) for x in mcqs]
for s in sets:
    items.append(dict(type='short_answer', marks=SET_MARKS, stem=remark(clean(s), printed_total(s), SET_MARKS)))
head, *qs = re.split(r'\n(?=[ \t]*[༠-༩]+༽\s)', written)
qs = [x for x in qs if x.strip()]
intro = clean(head)
for x in qs:
    m = re.findall(r'\(\s*([༠-༩0-9]+)\s*\)', x)
    old = int(m[-1].translate(TIB)) if m else None
    items.append(dict(type='descriptive', marks=WRITTEN_MARKS, stem=remark(intro + '\n' + clean(x), old, WRITTEN_MARKS)))
print(f"{len(mcqs)} MCQ, {len(sets)} short-answer sets, {len(qs)} written questions")


def rubric(marks):
    rows = [(l, d, round(mx * marks / 20 * 2) / 2) for l, d, mx in RUBRIC]
    rows = [r for r in rows if r[2] > 0]
    rows[0] = (rows[0][0], rows[0][1], rows[0][2] + marks - sum(r[2] for r in rows))
    return rows


paper = "(select id from public.exam_papers where code = 'me-technical-2')"
subject = "(select id from public.subjects where slug = 'general-subject-knowledge')"
group = "(select id from public.subject_groups where code = 'traditional-medicine')"
out = [f'-- {BATCH}', 'begin;',
       # Re-running deletes this batch's drafts: do NOT re-run once the Drungtsho has started adding answers.
       f"delete from public.questions where subject_group_id = {group} and paper_id = {paper} and status = 'draft' and ai_review ->> 'batch' = {q(BATCH)};"]
review = {'verdict': 'needs_expert', 'issues': ['Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.',
                                                'Dzongkha text repaired automatically from a damaged PDF font: compare with the RCSC PDF.'],
          'batch': BATCH, 'source': SOURCE}
for x in items:
    out.append(f"""with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, subject_group_id)
  values ('ME', {q(x['type'])}, {q(x['stem'])}, '[]'::jsonb, {subject}, {paper}, 'standard', {x['marks']}, {60 if x['type'] == 'mcq' else x['marks'] * 108},
    'historical_official', 'draft', {q(json.dumps(review, ensure_ascii=False))}::jsonb, {group})
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, {year} from nq)""")
    if x['type'] == 'mcq':
        vals = ', '.join(f"({q('ABCD'[i])}, {q(o)}, false, {i + 1})" for i, o in enumerate(x['opts']))
        out.append(f"insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values {vals}) as v(label, body, ok, pos);")
    else:
        vals = ', '.join(f"({q(l)}, {q(d)}, {mx}, {i + 1})" for i, (l, d, mx) in enumerate(rubric(x['marks'])))
        out.append(f"insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values {vals}) as v(l, d, m, p);")
out.append('commit;')
open(out_path, 'w').write('\n'.join(out) + '\n')
print('->', out_path)
