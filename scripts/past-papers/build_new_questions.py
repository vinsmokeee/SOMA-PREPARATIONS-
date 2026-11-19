"""Write SQL that loads Claude-written PE practice questions as drafts for the AI review queue.
Usage: python3 -I build_new_questions.py <batch module file> <out.sql>"""
import importlib.util, json, re, sys

SUBJ = {'english': 'english-communication', 'aptitude': 'logic-analytical-problem-solving', 'data': 'data-interpretation', 'dzongkha': 'dzongkha-communication'}
NOTE = 'Written by Claude; every answer worked out twice and the calculations re-checked by a script. This is not the in-app independent checker: please review before publishing.'

spec = importlib.util.spec_from_file_location('batch', sys.argv[1])
b = importlib.util.module_from_spec(spec)
spec.loader.exec_module(b)
NOTE = getattr(b, 'NOTE', NOTE)


def q(s):
    return "'" + s.replace("'", "''") + "'"


def slug(s):
    return re.sub(r'[^a-z0-9]+', '-', s.lower()).strip('-')


out = ['-- Claude-written PE practice questions, loaded as drafts (awaiting review) for /admin/ai/review.', 'begin;']
for s, t in sorted({(SUBJ[x['sec']], x['topic']) for x in b.Q}):
    out.append(f"insert into public.topics (subject_id, slug, name) select id, {q(slug(t))}, {q(t)} from public.subjects where slug = {q(s)} on conflict (subject_id, slug) do nothing;")
for x in b.Q:
    subj = SUBJ[x['sec']]
    parent = x.get('parent')
    parent_sql = (f"(select id from public.questions where origin = 'historical_official' and source_year = {parent[0]} and stem like {q(parent[1].replace('%', '\\%').replace('_', '\\_') + '%')} limit 1)"
                  if parent else 'null')
    review = {'verdict': 'pass', 'issues': [], 'checker_notes': NOTE}
    if getattr(b, 'BATCH', None):
        review['batch'] = b.BATCH
    if parent:
        review['what_changed'] = {'new_numbers': 'Same skill as the past-paper question, with new numbers or words.',
                                  'new_scenario': 'Same skill as the past-paper question, in a new situation.',
                                  'same_objective': 'Tests the same point as the past-paper question with a new example.'}[x['kind']]
    out.append(f"""with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, status,
                                parent_question_id, variation_type, ai_review)
  values ('PE', 'mcq', {q(x['stem'])}, {q(x['exp'])}, (select id from public.subjects where slug = {q(subj)}),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = {q(subj)} and t.slug = {q(slug(x['topic']))}),
    {q(x['diff'])}, 1, 90, {q('ai_variation' if parent else 'ai_generated')}, 'awaiting_review', {parent_sql}, {q(x['kind']) if parent else 'null'},
    {q(json.dumps(review, ensure_ascii=False))}::jsonb)
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position)
select nq.id, v.label, v.body, v.ok, v.pos from nq, (values {', '.join(f"({q('ABCD'[i])}, {q(o)}, {'true' if x['ans'] == i else 'false'}, {i + 1})" for i, o in enumerate(x['opts']))}) as v(label, body, ok, pos);""")
out.append('commit;')
open(sys.argv[2], 'w').write('\n\n'.join(out) + '\n')
print(len(b.Q), 'questions ->', sys.argv[2])
