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
for x in sorted(b.Q, key=lambda x: 0 if x.get('real') else 1):
    review = {'verdict': 'pass', 'issues': x.get('issues', []), 'checker_notes': NOTE, 'batch': b.BATCH}
    if x.get('real'):
        review['source'] = b.SOURCE  # year kept here only, never shown to students
    else:
        review['what_changed'] = 'Same kind of question as the RCSC paper (same part, marks and skills), on a new topic.'
    kp = [{'point': p, 'marks': m} for p, m in x['key_points']]
    out.append(f"""with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review)
  values ('ME', {q(x['type'])}, {q(x['stem'].strip())}, {q(x['model'].strip())}, {q(json.dumps(kp, ensure_ascii=False))}::jsonb, {subject},
    (select t.id from public.topics t where t.subject_id = {subject} and t.slug = {q(slug(x['topic']))}), {paper}, 'standard', {x.get('marks', 20)},
    {x.get('marks', 20) * 108}, {q('historical_official' if x.get('real') else 'ai_variation')}, 'awaiting_review',
    {f"(select id from me_q where key = {q(x['parent'])})" if x.get('parent') else 'null'}, {q(x.get('kind')) if x.get('parent') else 'null'},
    {q(json.dumps(review, ensure_ascii=False))}::jsonb)
  returning id
)
insert into me_q select {q(x['key'])}, id from nq;""")
    for i, (label, desc, mx) in enumerate(b.RUBRIC):
        out.append(f"insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, {q(label)}, {q(desc)}, {mx}, {i + 1} from me_q where key = {q(x['key'])};")
out.append('commit;')
open(sys.argv[2], 'w').write('\n'.join(out) + '\n')
print(len(b.Q), 'questions,', len(b.PATTERN), 'pattern sections ->', sys.argv[2])
