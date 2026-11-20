"""Write SQL that loads an ME batch (real past-paper questions + similar new ones) as drafts awaiting review,
with model answers, marking guides (key points), rubric criteria and the paper's pattern for personal mocks.
Usage: python3 -I scripts/me/build_me_questions.py <batch module> <out.sql>"""
import hashlib, importlib.util, json, random, re, sys

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
    m = re.search(r'\((\d+(?:\.\d+)?)\s*marks?\)\s*$', part, re.I)
    assert m, ('no marks at the end of part', part[:60])
    v = float(m.group(1))
    return int(v) if v.is_integer() else v


def scaled_rubric(marks):
    """The 20-mark rubric scaled to a part's marks (halves), adding up exactly."""
    total = sum(r[2] for r in b.RUBRIC)
    rows = [(l, d, round(mx * marks / total * 2) / 2) for l, d, mx in b.RUBRIC]
    rows = [r for r in rows if r[2] > 0]  # very small parts: drop criteria that round to 0
    rows[0] = (rows[0][0], rows[0][1], rows[0][2] + marks - sum(r[2] for r in rows))
    return rows


def expand(x):
    """One question per part (founder, 20 Nov 2026: one part per screen). Parts share passage_group = the RCSC question."""
    if x['type'] == 'mcq':
        return [dict(x, part=None, group=x.get('group'), pos=x.get('pos'), rubric=[], marks=x.get('marks', 1))]
    if x.get('group'):  # e.g. the questions of one case study: own stems, one shared passage
        return [dict(x, part=None, rubric=scaled_rubric(x.get('marks', 20)))]
    ctx, parts = split_parts(x['stem'])
    _, model_parts = split_parts(x['model'])
    if not parts:
        return [dict(x, part=None, group=None, pos=None, rubric=scaled_rubric(x.get('marks', 20)))]
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
    if x['type'] == 'mcq':
        assert len(x['opts']) == 4 and x['ans'] in range(4) and x.get('exp'), (x['key'], 'mcq needs 4 options, an answer and an explanation')
        assert len(set(x['opts'])) == 4, (x['key'], 'duplicate options')
        assert x.get('real') or x.get('parent') in keys or x.get('new'), x['key']
        continue
    marks = x.get('marks', 20)
    total = sum(m for _, m in x['key_points'])
    assert total == marks, (x['key'], total)
    assert sum(r[2] for r in scaled_rubric(marks)) == marks, 'rubric total'
    assert x['type'] in pattern_types, (x['key'], x['type'])
    assert x.get('real') or x.get('parent') in keys or x.get('new'), x['key']
    assert len(x['model'].split()) >= getattr(b, 'MIN_WORDS', 150) * marks / 20, (x['key'], 'model answer too short')
ROWS = [r for x in b.Q for r in expand(x)]
row_keys = {r['key'] for r in ROWS}
for r in ROWS:
    if r.get('parent') and r['parent'] not in row_keys:
        r['parent'] = next(k for k in row_keys if k.startswith(r['parent'][:-1]))  # parent has fewer parts: link to its first
ADDS = getattr(b, 'ADDS_TO_PAPER', False)  # an older year added to a paper whose pattern another batch set
for p in ([] if ADDS else b.PATTERN):
    n = len({x.get('group') or x['key'] for x in b.Q if x['type'] == p['type'] and (not p.get('topic') or slug(x['topic']) == p['topic'])})
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
GROUP = getattr(b, 'SUBJECT_GROUP', None)  # subject group code: the pattern, timing and questions belong to that group
group = f"(select id from public.subject_groups where code = {q(GROUP)})" if GROUP else 'null'
if not ADDS:
    out.append(f"delete from public.paper_blueprint_sections where paper_id = {paper} and subject_group_id is not distinct from {group};")
    if getattr(b, 'GROUP_TIMING', None):
        t = b.GROUP_TIMING
        out.append(f"insert into public.paper_group_settings (paper_id, subject_group_id, duration_minutes, reading_minutes, max_marks, source) "
                   f"values ({paper}, {group}, {t.get('duration') or 'null'}, {t.get('reading') or 'null'}, {t.get('max_marks') or 'null'}, {q(b.SOURCE['title'])}) "
                   f"on conflict (paper_id, subject_group_id) do update set duration_minutes = excluded.duration_minutes, "
                   f"reading_minutes = excluded.reading_minutes, max_marks = excluded.max_marks, source = excluded.source;")
for i, p in enumerate([] if ADDS else b.PATTERN):
    out.append(f"insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) "
               f"values ({paper}, {group}, {q(p.get('topic'))}, {i + 1}, {q(p['title'])}, {q(p['type'])}, {p['count']}, {p['marks_each']}, {p.get('answer_any') or 'null'}, {q(b.SOURCE['title'])});")
def answer_positions(keys, seed):
    """Where the correct option goes for each MCQ, in order: A, B, C and D used about equally, shuffled,
    never the same letter more than twice in a row (founder, 20 Nov 2026: answers must look random)."""
    n = len(keys)
    pos = [i % 4 for i in range(n)]
    rnd = random.Random(seed)
    for _ in range(1000):
        rnd.shuffle(pos)
        if all(not (pos[i] == pos[i - 1] == pos[i - 2]) for i in range(2, n)):
            break
    return dict(zip(keys, pos))


MCQ_KEYS = [x['key'] for x in ROWS if x['type'] == 'mcq']
ANSWER_AT = answer_positions(MCQ_KEYS, b.BATCH)
PUBLISH_AS = sys.argv[3] if len(sys.argv) > 3 else None  # SQL for a verifier id: carry over an approval already given
for x in sorted(ROWS, key=lambda x: 0 if x.get('real') else 1):
    review = {'verdict': 'pass', 'issues': x.get('issues', []), 'checker_notes': NOTE, 'batch': b.BATCH}
    if x.get('real'):
        review['source'] = b.SOURCE  # year kept here only, never shown to students
    else:
        review['what_changed'] = 'Same kind of question as the RCSC paper (same part, marks and skills), on a new topic.'
    kp = [{'point': p, 'marks': m} for p, m in x.get('key_points', [])]
    out.append(f"""with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', {q(x['type'])}, {q(x['stem'].strip())}, {q(x['model'].strip()) if x.get('model') else 'null'}, {q(x.get('exp'))}, {q(json.dumps(kp, ensure_ascii=False))}::jsonb, {subject},
    (select t.id from public.topics t where t.subject_id = {subject} and t.slug = {q(slug(x['topic']))}), {paper}, 'standard', {x.get('marks', 20)},
    {60 if x['type'] == 'mcq' else int(x.get('marks', 20) * 108)}, {q('historical_official' if x.get('real') else 'ai_variation')}, {q('verified' if PUBLISH_AS else 'awaiting_review')},
    {f"(select id from me_q where key = {q(x['parent'])})" if x.get('parent') else 'null'}, {q(x.get('kind')) if x.get('parent') else 'null'},
    {q(json.dumps(review, ensure_ascii=False))}::jsonb, {q(x.get('group'))}, {x.get('pos') or 'null'}, {PUBLISH_AS or 'null'}, {group}, {q(x.get('image'))})
  returning id
)
insert into me_q select {q(x['key'])}, id from nq;""")
    if x['type'] == 'mcq':
        # Stored in a random order (seeded by the question), so answers are not always in the same position.
        # order[pos] = index of the option shown at position pos; the correct one goes where ANSWER_AT says.
        others = [i for i in range(4) if i != x['ans']]
        random.Random(int(hashlib.sha1(x['key'].encode()).hexdigest(), 16)).shuffle(others)
        order = others[:]
        order.insert(ANSWER_AT[x['key']], x['ans'])
        vals = ', '.join(f"({q('ABCD'[pos])}, {q(x['opts'][i])}, {'true' if i == x['ans'] else 'false'}, {pos + 1})" for pos, i in enumerate(order))
        out.append(f"insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values {vals}) as v(label, body, ok, pos) where me_q.key = {q(x['key'])};")
    for i, (label, desc, mx) in enumerate(x.get('rubric', b.RUBRIC)):
        out.append(f"insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, {q(label)}, {q(desc)}, {mx}, {i + 1} from me_q where key = {q(x['key'])};")
if PUBLISH_AS:
    out.append("update public.questions set status = 'published' where id in (select id from me_q);")
out.append('commit;')
open(sys.argv[2], 'w').write('\n'.join(out) + '\n')
print(len(b.Q), 'questions in', len(ROWS), 'parts,', len(b.PATTERN), 'pattern sections ->', sys.argv[2])
