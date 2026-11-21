"""Load a Traditional Medicine (Drungtsho) Technical Paper III in Dzongkha as DRAFT questions with no answers
(founder, 21 Nov 2026). Sowa Rigpa answer keys need a Drungtsho, so the question text is copied programmatically from
the PDF text (pdftotext -layout) and the expert adds the correct options, model answers and key points in admin.

Layout read from the paper itself:
  Section A: question 1 = multiple choice (options ཀ ཁ ག ང); questions 2.. = short answers with their printed marks.
  Section B (after the line containing 'སྡེ་ཚན་ཁ་པ'): long questions with their printed marks, all compulsory.
Mock pattern: MCQs x 1 mark; Section A short answers as one group; Section B as one group (all compulsory).

Usage: python3 -I scripts/me/load_drungtsho_questions.py <paper.txt> <year> <out.sql>
"""
import json
import re
import sys

src, year, out_path = sys.argv[1], int(sys.argv[2]), sys.argv[3]
TIB = str.maketrans('༠༡༢༣༤༥༦༧༨༩', '0123456789')
BATCH = f"ME Paper III (Technical, Traditional Medicine): BCSE {year} - questions only, Drungtsho to add answers"
SOURCE = {"title": f"BCSE {year} Main Examination, Technical Paper III, Traditional Medicine", "year": year, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
RUBRIC = [("Content", "Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.", 12),
          ("Application", "Applies the idea to the case or question with examples or steps.", 5),
          ("Expression", "Clear, organised answer in good Dzongkha.", 3)]


def q(s):
    return 'null' if s is None else "'" + str(s).replace("'", "''") + "'"


def clean(block):
    lines = [re.sub(r'\s+', ' ', ln).strip() for ln in block.split('\n')]
    keep = [ln for ln in lines if ln and not re.search(r'Page \d+ of \d+|PAPER III: SUBJECT', ln)]
    return '\n'.join(keep)


def marks_of(text):
    m = re.findall(r'\(\s*སྐུགས[^)]*?([༠-༩0-9]+)\s*\)', text)
    return int(m[-1].translate(TIB)) if m else None


t = open(src).read()
start = t.index('དྲི་བ་དང་པ།')                       # Section A, question 1 (MCQ)
sec_b = re.search(r'སྡེ་ཚན་ཁ་པ', t[start:]).start() + start
a, b = t[start:sec_b], t[sec_b:]

# Section A question 1: numbered MCQs '༡.' .. with options on lines starting ཀ ཁ ག ང
q2 = re.search(r'\nདྲི་བ་གཉིས་པ།', a).start()
mcq_block, sa_block = a[:q2], a[q2:]
mcqs = []
for m in re.finditer(r'\n\s*([༠-༩]+)\.\s(.*?)(?=\n\s*[༠-༩]+\.\s|\Z)', mcq_block, re.S):
    body = clean(m.group(2))
    parts = re.split(r'\n(?=[ཀཁགང]་?\s)', '\n' + body)
    stem = parts[0].strip()
    opts = [re.sub(r'^[ཀཁགང]་?\s+', '', p).strip() for p in parts[1:]]
    mcqs.append(dict(n=int(m.group(1).translate(TIB)), stem=stem.strip(), opts=opts))
assert all(len(x['opts']) == 4 for x in mcqs), [(x['n'], len(x['opts'])) for x in mcqs if len(x['opts']) != 4]


def split_questions(block):
    pieces = re.split(r'\n(?=དྲི་བ་[^\n]{1,12}པ།)', '\n' + block)
    return [clean(p) for p in pieces if re.match(r'དྲི་བ་[^\n]{1,12}པ།', p.strip())]


saqs = [(s, marks_of(s)) for s in split_questions(sa_block)]
longs = [(s, marks_of(s)) for s in split_questions(b[b.index('དྲི་བ་'):])]
longs = [(re.sub(r'\n?TASHI DELEK.*', '', s, flags=re.S), m) for s, m in longs]
assert all(m for _, m in saqs + longs), [s[:40] for s, m in saqs + longs if not m]
sa_total, b_total = sum(m for _, m in saqs), sum(m for _, m in longs)
print(f'{len(mcqs)} MCQ, {len(saqs)} short answers ({sa_total} marks), {len(longs)} long questions ({b_total} marks); total {len(mcqs) + sa_total + b_total}')


def rubric(marks):
    rows = [(l, d, round(mx * marks / 20 * 2) / 2) for l, d, mx in RUBRIC]
    rows = [r for r in rows if r[2] > 0]
    rows[0] = (rows[0][0], rows[0][1], rows[0][2] + marks - sum(r[2] for r in rows))
    return rows


items = [dict(type='mcq', marks=1, stem=x['stem'], opts=x['opts']) for x in mcqs]
items += [dict(type='short_answer', marks=m, stem=s, group=f'me-technical-3-tradmed{year}-sectiona', pos=i + 1) for i, (s, m) in enumerate(saqs)]
items += [dict(type='long_answer', marks=m, stem=s, group=f'me-technical-3-tradmed{year}-sectionb', pos=i + 1) for i, (s, m) in enumerate(longs)]

paper = "(select id from public.exam_papers where code = 'me-technical-3')"
subject = "(select id from public.subjects where slug = 'subject-specialisation')"
spec = "(select id from public.specialisations where code = 'drungtsho')"
out = [f'-- {BATCH}', 'begin;',
       f"delete from public.questions where specialisation_id = {spec} and paper_id = {paper} and status = 'draft' and ai_review ->> 'batch' = {q(BATCH)};",
       f"delete from public.paper_blueprint_sections where paper_id = {paper} and subject_group_id is null and specialisation_id = {spec};"]
pattern = [("Section A Part I: Multiple choice questions", 'mcq', len(mcqs), 1),
           ("Section A: Short answer questions", 'short_answer', 1, sa_total),
           ("Section B: Long answer questions (all compulsory)", 'long_answer', 1, b_total)]
for i, (title, ty, n, mk) in enumerate(pattern):
    out.append(f"insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) "
               f"values ({paper}, null, {spec}, null, {i + 1}, {q(title)}, {q(ty)}, {n}, {mk}, null, {q(SOURCE['title'])});")
review = {'verdict': 'needs_expert', 'issues': ['Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.'],
          'batch': BATCH, 'source': SOURCE}
for x in items:
    out.append(f"""with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', {q(x['type'])}, {q(x['stem'])}, '[]'::jsonb, {subject}, {paper}, 'standard', {x['marks']}, {60 if x['type'] == 'mcq' else x['marks'] * 108},
    'historical_official', 'draft', {q(json.dumps(review, ensure_ascii=False))}::jsonb, {q(x.get('group'))}, {x.get('pos') or 'null'}, {spec})
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
