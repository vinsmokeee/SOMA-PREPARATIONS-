"""Load an RCSC Technical Paper III as DRAFT questions with no answers (founder, 20 Nov 2026).

Used for papers whose answers Claude could not write (Biotechnology, Microbiology): the founder's subject expert adds
the correct MCQ options and model answers in the admin question editor, then publishes. The question text is copied
programmatically from the parsed PDF (scratchpad t3parse.py output), so nothing is retyped.

Layout = the standard Paper III pattern: Part I 30 MCQ x 1, Part II 4 short answers x 5, Section B choose Case I or
Case II (50). Each case is one 50-mark question holding the whole case (scenario and all its sub-questions).

Usage: python3 -I scripts/me/load_questions_only.py <parsed.json> <specialisation code> <tag> <Subject name> <out.sql>
"""
import json
import re
import sys

src, spec_code, tag, name, out_path = sys.argv[1:6]
d = json.load(open(src))
CLEAN = re.compile(r"\s*SUBJECT SPECIALISATION PAPER FOR [A-Z &]+\s*$")
BATCH = f"ME Paper III (Technical, {name}): BCSE 2025 - questions only, expert to add answers"
SOURCE = {"title": f"BCSE 2025 Main Examination, Technical Paper III, {name}", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
RUBRIC = [
    ("Content", "Correct facts, terms, working and reasoning; answers exactly what is asked.", 12),
    ("Application", "Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.", 5),
    ("Expression", "Clear, organised answer; units and labels where needed.", 3),
]


def q(s):
    return 'null' if s is None else "'" + str(s).replace("'", "''") + "'"


def tidy(block):
    """Keep line structure, drop layout indentation, page furniture and the closing greeting."""
    lines = [re.sub(r'\s+', ' ', ln).strip() for ln in block.split('\n')]
    lines = [ln for ln in lines if ln and not re.match(r'^(TASHI DELEK|Page \d+ of \d+)$', ln, re.I) and not CLEAN.fullmatch(' ' + ln)]
    return '\n'.join(lines)


def rubric(marks):
    rows = [(l, t, round(mx * marks / 20 * 2) / 2) for l, t, mx in RUBRIC]
    rows = [r for r in rows if r[2] > 0]
    rows[0] = (rows[0][0], rows[0][1], rows[0][2] + marks - sum(r[2] for r in rows))
    return rows


# --- split the written part: Part II questions, then Case I and Case II
rest = d['rest']
sec_b = re.search(r'\n\s*SECTION\s*B', rest).start()
part2, section_b = rest[:sec_b], rest[sec_b:]
p2_body = part2[re.search(r'\n\s*1\s*\.\s', part2).start():]
saqs = [tidy(m.group(1)) for m in re.finditer(r'\n\s*\d\s*\.\s(.*?)(?=\n\s*\d\s*\.\s|\Z)', p2_body, re.S)]
c1 = re.search(r'\n\s*CASE\s+I\s*\n', section_b, re.I)
c2 = re.search(r'\n\s*CASE\s+II\s*\n', section_b, re.I)
cases = [tidy(section_b[c1.end():c2.start()]), tidy(section_b[c2.end():])]
mcqs = d['mcq']
assert all(all(o for o in m['opts']) for m in mcqs), 'every MCQ needs 4 options'
# A number the RCSC paper skips (Biotechnology 2025 has no question 19) becomes a blank MCQ for the expert to write,
# so the paper keeps its 30 marks.
have = {m['n'] for m in mcqs}
for n in sorted(set(range(1, 31)) - have):
    mcqs.append({'n': n, 'stem': f"[Question {n} is missing from the RCSC paper. Expert: write a new multiple choice question here.]",
                 'opts': ['Option A', 'Option B', 'Option C', 'Option D']})
mcqs.sort(key=lambda m: m['n'])
assert len(mcqs) == 30, len(mcqs)
assert len(saqs) == 4, ('expected 4 short answers', len(saqs))
assert all(len(c) > 200 for c in cases), 'case text too short'

items = []
for m in mcqs:
    items.append(dict(type='mcq', marks=1, stem=CLEAN.sub('', m['stem']), opts=[CLEAN.sub('', o) for o in m['opts']]))
for i, s in enumerate(saqs):
    items.append(dict(type='short_answer', marks=5, stem=s))
for i, c in enumerate(cases):
    items.append(dict(type='passage', marks=50, stem=f"Case {'I' * (i + 1)}\n{c}", group=f"me-technical-3-{tag}-case{i + 1}", pos=1))

paper = "(select id from public.exam_papers where code = 'me-technical-3')"
subject = "(select id from public.subjects where slug = 'subject-specialisation')"
spec = f"(select id from public.specialisations where code = {q(spec_code)})"
out = [f'-- {BATCH}: question text only, as DRAFTS; a subject expert adds answers in the admin editor.', 'begin;',
       f"do $$ begin if {spec} is null then raise exception 'unknown specialisation {spec_code}'; end if; end $$;",
       f"delete from public.questions where specialisation_id = {spec} and paper_id = {paper} and status = 'draft' and ai_review ->> 'batch' = {q(BATCH)};",
       f"delete from public.paper_blueprint_sections where paper_id = {paper} and subject_group_id is null and specialisation_id = {spec};"]
pattern = [("Section A Part I: Multiple choice questions", 'mcq', 30, 1, None),
           ("Section A Part II: Short answer questions", 'short_answer', 4, 5, None),
           ("Section B: Case study (answer either Case I or Case II)", 'passage', 2, 50, 1)]
for i, (title, t, n, mk, any_) in enumerate(pattern):
    out.append(f"insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) "
               f"values ({paper}, null, {spec}, null, {i + 1}, {q(title)}, {q(t)}, {n}, {mk}, {any_ or 'null'}, {q(SOURCE['title'])});")
review = {'verdict': 'needs_expert', 'issues': ['Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing.'],
          'batch': BATCH, 'source': SOURCE}
for x in items:
    out.append(f"""with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', {q(x['type'])}, {q(x['stem'])}, '[]'::jsonb, {subject}, {paper}, 'standard', {x['marks']}, {60 if x['type'] == 'mcq' else x['marks'] * 108},
    'historical_official', 'draft', {q(json.dumps(review, ensure_ascii=False))}::jsonb, {q(x.get('group'))}, {x.get('pos') or 'null'}, {spec})
  returning id
)""")
    if x['type'] == 'mcq':
        vals = ', '.join(f"({q('ABCD'[i])}, {q(o)}, false, {i + 1})" for i, o in enumerate(x['opts']))
        out.append(f"insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values {vals}) as v(label, body, ok, pos);")
    else:
        vals = ', '.join(f"({q(l)}, {q(t)}, {mx}, {i + 1})" for i, (l, t, mx) in enumerate(rubric(x['marks'])))
        out.append(f"insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.t, v.m, v.p from nq, (values {vals}) as v(l, t, m, p);")
out.append('commit;')
open(out_path, 'w').write('\n'.join(out) + '\n')
print(name, ':', len(mcqs), 'MCQ,', len(saqs), 'short answers,', len(cases), 'cases ->', out_path)
