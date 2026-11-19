"""Write SQL that loads an ME batch (real past-paper questions + similar new ones) as drafts awaiting review,
with model answers, marking guides (key points), rubric criteria and the paper's pattern for personal mocks.
Usage: python3 -I scripts/me/build_me_questions.py <batch module> <out.sql>"""
import importlib.util, json, re, sys

spec = importlib.util.spec_from_file_location('batch', sys.argv[1])
b = importlib.util.module_from_spec(spec)
spec.loader.exec_module(b)


def q(s):
    return 'null' if s is None else "'" + str(s).replace("'", "''") + "'"


def slug(s):
    return re.sub(r'[^a-z0-9]+', '-', s.lower()).strip('-')


PART = re.compile(r'^\s*([a-e])\)\s*', re.M)


def split_parts(text):
    """Split 'context, a) ..., b) ...' into (context, [(letter, part text), ...]); no parts -> (text, [])."""
    ms = list(PART.finditer(text))
    if not ms:
        return text.strip(), []
    ctx = text[:ms[0].start()].strip()
    parts = [(m.group(1), text[m.start():(ms[i + 1].start() if i + 1 < len(ms) else len(text))].strip()) for i, m in enumerate(ms)]
    return ctx, parts


def part_marks(part):
    m = re.search(r'\((\d+)\s*marks?\)\s*$', part, re.I)
    assert m, ('no marks at the end of part', part[:60])
    return int(m.group(1))


def scaled_rubric(marks):
    """The 20-mark rubric scaled to a part's marks (halves), adding up exactly."""
    total = sum(r[2] for r in b.RUBRIC)
    rows = [(l, d, round(mx * marks / total * 2) / 2) for l, d, mx in b.RUBRIC]
    rows[0] = (rows[0][0], rows[0][1], rows[0][2] + marks - sum(r[2] for r in rows))
    return rows


def expand(x):
    """One question per part (founder, 20 Nov 2026: one part per screen). Parts share passage_group = the RCSC question."""
    ctx, parts = split_parts(x['stem'])
    _, model_parts = split_parts(x['model'])
    if not parts:
        return [dict(x, part=None, group=None, pos=None, rubric=b.RUBRIC)]
    models = dict(model_parts)
    group = re.sub(r'[^a-z0-9-]+', '-', f"me-{b.PAPER.replace('me-', '')}-{getattr(b, 'GROUP_TAG', 'x')}-{x['key']}".lower())
    rows = []
    for i, (letter, text) in enumerate(parts):
        marks = part_marks(text)
        kp = [(re.sub(r'^[a-e]\)\s*', '', p), m) for p, m in x['key_points'] if p.startswith(letter + ')')]
        assert sum(m for _, m in kp) == marks, (x['key'], letter, sum(m for _, m in kp), marks)
        assert letter in models, (x['key'], 'model answer has no part', letter)
        rows.append(dict(x, key=f"{x['key']}{letter}", stem=(ctx + '\n\n' + text) if ctx else text, model=models[letter],
                         key_points=kp, marks=marks, part=letter, group=group, pos=i + 1, rubric=scaled_rubric(marks),
                         parent=(f"{x['parent']}{letter}" if x.get('parent') else None)))
    return rows


# ---- checks: every question has a full marking guide that adds up to its marks, parents exist, types match the pattern
keys = {x['key'] for x in b.Q}
pattern_types = {p['type'] for p in b.PATTERN}
for x in b.Q:
    marks = x.get('marks', 20)
    total = sum(m for _, m in x['key_points'])
    assert total == marks, (x['key'], total)
    assert sum(r[2] for r in b.RUBRIC) == marks, 'rubric total'
    assert x['type'] in pattern_types, (x['key'], x['type'])
    assert x.get('real') or x.get('parent') in keys, x['key']
    assert len(x['model'].split()) >= 150, (x['key'], 'model answer too short')
ROWS = [r for x in b.Q for r in expand(x)]
row_keys = {r['key'] for r in ROWS}
for r in ROWS:
    if r.get('parent') and r['parent'] not in row_keys:
        r['parent'] = next(k for k in row_keys if k.startswith(r['parent'][:-1]))  # parent has fewer parts: link to its first
for p in b.PATTERN:
    n = sum(1 for x in b.Q if x['type'] == p['type'])
    assert n >= p['count'], ('not enough questions for', p['title'], n)

NOTE = ('Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is '
        'widely published, but please read before publishing. Real past-paper questions keep RCSC wording.')
out = [f'-- {b.BATCH}: ME questions loaded as drafts (awaiting review) for /admin/ai/review.', 'begin;',
       'create temp table me_q (key text primary key, id uuid not null) on commit drop;']
paper = f"(select id from public.exam_papers where code = {q(b.PAPER)})"
subject = f"(select id from public.subjects where slug = {q(b.SUBJECT)})"
for t in sorted({x['topic'] for x in b.Q}):
    out.append(f"insert into public.topics (subject_id, slug, name) select {subject}, {q(slug(t))}, {q(t)} on conflict (subject_id, slug) do nothing;")
# Pattern for personal mocks (replaces any earlier pattern of this paper)
out.append(f"delete from public.paper_blueprint_sections where paper_id = {paper};")
for i, p in enumerate(b.PATTERN):
    out.append(f"insert into public.paper_blueprint_sections (paper_id, sort_order, title, question_type, question_count, marks_each, answer_any, source) "
               f"values ({paper}, {i + 1}, {q(p['title'])}, {q(p['type'])}, {p['count']}, {p['marks_each']}, {p.get('answer_any') or 'null'}, {q(b.SOURCE['title'])});")
PUBLISH_AS = sys.argv[3] if len(sys.argv) > 3 else None  # SQL for a verifier id: carry over an approval already given
for x in sorted(ROWS, key=lambda x: 0 if x.get('real') else 1):
    review = {'verdict': 'pass', 'issues': x.get('issues', []), 'checker_notes': NOTE, 'batch': b.BATCH}
    if x.get('real'):
        review['source'] = b.SOURCE  # year kept here only, never shown to students
    else:
        review['what_changed'] = 'Same kind of question as the RCSC paper (same part, marks and skills), on a new topic.'
    kp = [{'point': p, 'marks': m} for p, m in x['key_points']]
    out.append(f"""with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by)
  values ('ME', {q(x['type'])}, {q(x['stem'].strip())}, {q(x['model'].strip())}, {q(json.dumps(kp, ensure_ascii=False))}::jsonb, {subject},
    (select t.id from public.topics t where t.subject_id = {subject} and t.slug = {q(slug(x['topic']))}), {paper}, 'standard', {x.get('marks', 20)},
    {int(x.get('marks', 20) * 108)}, {q('historical_official' if x.get('real') else 'ai_variation')}, {q('verified' if PUBLISH_AS else 'awaiting_review')},
    {f"(select id from me_q where key = {q(x['parent'])})" if x.get('parent') else 'null'}, {q(x.get('kind')) if x.get('parent') else 'null'},
    {q(json.dumps(review, ensure_ascii=False))}::jsonb, {q(x.get('group'))}, {x.get('pos') or 'null'}, {PUBLISH_AS or 'null'})
  returning id
)
insert into me_q select {q(x['key'])}, id from nq;""")
    for i, (label, desc, mx) in enumerate(x.get('rubric', b.RUBRIC)):
        out.append(f"insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, {q(label)}, {q(desc)}, {mx}, {i + 1} from me_q where key = {q(x['key'])};")
if PUBLISH_AS:
    out.append("update public.questions set status = 'published' where id in (select id from me_q);")
out.append('commit;')
open(sys.argv[2], 'w').write('\n'.join(out) + '\n')
print(len(b.Q), 'questions in', len(ROWS), 'parts,', len(b.PATTERN), 'pattern sections ->', sys.argv[2])
