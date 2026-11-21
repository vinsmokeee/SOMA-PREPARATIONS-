"""Traditional Medicine Technical Paper III, BCSE 2025 (Dzongkha) as DRAFT questions shown as pictures (founder, 21 Nov 2026).

The RCSC PDF uses the legacy DDC_Uchen font without Unicode mapping, so its text extracts garbled; retyping risks
spelling errors. Each question is therefore cut out of the page as a picture (like the PE 2010 Dzongkha questions)
and shown above a short stem; MCQ options are the letters ཀ ཁ ག ང. Positions come from `pdftotext -bbox-layout`.
No answers: a Drungtsho adds the correct options, model answers and key points (and may retype the text) in admin.

Layout (cover page): Section A - 30 MCQ x 1 (30) + short answers 4 x 5 (20, all); Section B - choose Case I or II (50),
each case = a scenario + 5 questions x 10.

Usage: python3 -I scripts/me/load_tradmed_2025_images.py <paper.pdf> <bbox.html> <out.sql>   (writes webp files under
public/papers/me/tm2025/)
"""
import html
import json
import os
import re
import subprocess
import sys
import tempfile

from PIL import Image

pdf, bbox, out_path = sys.argv[1:4]
YEAR = 2025
DPI = 150
OUT_DIR = 'public/papers/me/tm2025'
BATCH = "ME Paper III (Technical, Traditional Medicine): BCSE 2025 - questions as pictures, Drungtsho to add answers"
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Traditional Medicine", "year": YEAR, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TIB = str.maketrans('༠༡༢༣༤༥༦༧༨༩', '0123456789')
RUBRIC = [("Content", "Correct facts, terms and reasoning from Sowa Rigpa; answers exactly what is asked.", 12),
          ("Application", "Applies the idea to the case or question with examples or steps.", 5),
          ("Expression", "Clear, organised answer in good Dzongkha.", 3)]
TOP, BOTTOM, LEFT, RIGHT = 50, 770, 55, 565          # page area in PDF points (A4 595 x 842)


def q(s):
    return 'null' if s is None else "'" + str(s).replace("'", "''") + "'"


# question starts: (page, y) of lines beginning with a Tibetan number and ༽
starts = []
for pi, page in enumerate(re.split(r'<page ', open(bbox).read())[1:], 1):
    for m in re.finditer(r'<line xMin="([\d.]+)" yMin="([\d.]+)" xMax="[\d.]+" yMax="[\d.]+">(.*?)</line>', page, re.S):
        words = ' '.join(html.unescape(w) for w in re.findall(r'>([^<]*)</word>', m.group(3)))
        n = re.match(r'^([༠-༩]+)\s*༽', words)
        if n and float(m.group(1)) < 100:
            starts.append((pi, float(m.group(2)), int(n.group(1).translate(TIB))))
mcq = [s for s in starts if 2 <= s[0] <= 8 and not (s[0] == 8 and s[1] > 200)]
saq = [s for s in starts if s[0] == 8 and s[1] > 200]
case1 = [s for s in starts if s[0] == 9]
case2 = [s for s in starts if s[0] == 10]
assert [n for *_, n in mcq] == list(range(1, 31)), [n for *_, n in mcq]
assert len(saq) == 4 and len(case1) == 5 and len(case2) == 5, (len(saq), len(case1), len(case2))

tmp = tempfile.mkdtemp()
pages = {}


def page_img(p):
    if p not in pages:
        subprocess.run(['pdftoppm', '-f', str(p), '-l', str(p), '-r', str(DPI), '-png', '-singlefile', pdf, f'{tmp}/p{p}'], check=True)
        pages[p] = Image.open(f'{tmp}/p{p}.png').convert('L')
    return pages[p]


def crop(p, y0, y1, name):
    k = DPI / 72
    im = page_img(p).crop((int(LEFT * k), int(y0 * k), int(RIGHT * k), int(y1 * k)))
    # trim blank rows at the bottom (no empty space or page footer)
    px = im.load()
    bottom = im.height
    while bottom > 10 and all(px[x, bottom - 1] > 235 for x in range(0, im.width, 2)):
        bottom -= 1
    im = im.crop((0, 0, im.width, min(im.height, bottom + 12)))
    os.makedirs(OUT_DIR, exist_ok=True)
    path = f'{OUT_DIR}/{name}.webp'
    im.save(path, 'WEBP', quality=80)
    return '/' + path.removeprefix('public/')


def next_y(lst, i, page_end=BOTTOM):
    p, y, _ = lst[i]
    return lst[i + 1][1] if i + 1 < len(lst) and lst[i + 1][0] == p else page_end


items = []
for i, (p, y, n) in enumerate(mcq):
    end = 178 if n == 30 else next_y(mcq, i) - 6      # MCQ 30 is followed by the Part II heading on page 8
    img = crop(p, y - 1, end, f'mcq{n:02d}')
    items.append(dict(type='mcq', marks=1, stem=f'དྲི་བ་ {n} - Read the question and its options in the picture, then choose ཀ, ཁ, ག or ང.',
                      opts=['ཀ', 'ཁ', 'ག', 'ང'], image=img))
for i, (p, y, n) in enumerate(saq):
    end = next_y(saq, i, 445)
    img = crop(p, y - 1, end - 2, f'saq{n}')
    items.append(dict(type='short_answer', marks=5, stem=f'Section A, short answer question {n} (5 marks): read the question in the picture and write your answer.',
                      image=img))
# Section B: each case is one picture (scenario + its five questions); each question is a part of the case.
for c, (p, qs, top, bottom) in enumerate([(9, case1, 82, 765), (10, case2, 52, 750)], 1):
    img = crop(p, top, bottom, f'case{c}')
    for j, (_, _, n) in enumerate(qs):
        items.append(dict(type='passage', marks=10, group=f'me-technical-3-tradmed2025-case{c}', pos=j + 1, image=img,
                          stem=f'Case {"I" * c} (choose Case I or Case II), question {n} (10 marks): read the case and question {n} in the picture and write your answer.'))


def rubric(marks):
    rows = [(l, d, round(mx * marks / 20 * 2) / 2) for l, d, mx in RUBRIC]
    rows = [r for r in rows if r[2] > 0]
    rows[0] = (rows[0][0], rows[0][1], rows[0][2] + marks - sum(r[2] for r in rows))
    return rows


paper = "(select id from public.exam_papers where code = 'me-technical-3')"
subject = "(select id from public.subjects where slug = 'subject-specialisation')"
spec = "(select id from public.specialisations where code = 'drungtsho')"
out = [f'-- {BATCH}', 'begin;',
       f"delete from public.questions where specialisation_id = {spec} and paper_id = {paper} and status = 'draft' and ai_review ->> 'batch' = {q(BATCH)};",
       f"delete from public.paper_blueprint_sections where paper_id = {paper} and subject_group_id is null and specialisation_id = {spec};"]
pattern = [("Section A Part I: Multiple choice questions", 'mcq', 30, 1, None),
           ("Section A Part II: Short answer questions", 'short_answer', 4, 5, None),
           ("Section B: Case study (answer either Case I or Case II)", 'passage', 2, 50, 1)]
for i, (title, ty, n, mk, any_) in enumerate(pattern):
    out.append(f"insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) "
               f"values ({paper}, null, {spec}, null, {i + 1}, {q(title)}, {q(ty)}, {n}, {mk}, {any_ or 'null'}, {q(SOURCE['title'])});")
review = {'verdict': 'needs_expert', 'issues': ['Question shown as a picture of the RCSC paper. Answers not written by Soma: a Drungtsho must add the correct option / model answer and key points before publishing.'],
          'batch': BATCH, 'source': SOURCE}
for x in items:
    out.append(f"""with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id, image_url)
  values ('ME', {q(x['type'])}, {q(x['stem'])}, '[]'::jsonb, {subject}, {paper}, 'standard', {x['marks']}, {60 if x['type'] == 'mcq' else x['marks'] * 108},
    'historical_official', 'draft', {q(json.dumps(review, ensure_ascii=False))}::jsonb, {q(x.get('group'))}, {x.get('pos') or 'null'}, {spec}, {q(x['image'])})
  returning id
), yr as (insert into public.question_appearances (question_id, year) select id, {YEAR} from nq)""")
    if x['type'] == 'mcq':
        vals = ', '.join(f"({q('ABCD'[i])}, {q(o)}, false, {i + 1})" for i, o in enumerate(x['opts']))
        out.append(f"insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values {vals}) as v(label, body, ok, pos);")
    else:
        vals = ', '.join(f"({q(l)}, {q(d)}, {mx}, {i + 1})" for i, (l, d, mx) in enumerate(rubric(x['marks'])))
        out.append(f"insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.d, v.m, v.p from nq, (values {vals}) as v(l, d, m, p);")
out.append('commit;')
open(out_path, 'w').write('\n'.join(out) + '\n')
print(f'{len(items)} questions ({len(mcq)} MCQ, {len(saq)} short answers, {len(case1) + len(case2)} case parts) ->', out_path)
