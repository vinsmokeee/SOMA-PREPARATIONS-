"""Write UPDATE statements that change the text of already-loaded ME questions in place (old module -> new module)."""
import runpy, sys, json
def rows(mod):
    sys.argv = ['x', mod, '/dev/null']
    g = runpy.run_path('scripts/me/build_me_questions.py')
    return g['ROWS'], g['b']
def q(s): return 'null' if s is None else "'" + str(s).replace("'", "''") + "'"
ARGS = list(sys.argv)
old, ob = rows(ARGS[1]); new, nb = rows(ARGS[2])
sys.argv = ARGS
assert [r['key'] for r in old] == [r['key'] for r in new]
out = ['begin;']
batch = q(nb.BATCH)
for o, n in zip(old, new):
    kp = lambda r: json.dumps([{'point': p, 'marks': m} for p, m in r.get('key_points', [])], ensure_ascii=False)
    if (o['stem'], o.get('model'), kp(o)) == (n['stem'], n.get('model'), kp(n)) and o.get('rubric') == n.get('rubric'):
        continue
    w = f"ai_review->>'batch' = {batch} and stem = {q(o['stem'].strip())}"
    out.append(f"update public.questions set stem = {q(n['stem'].strip())}, model_answer = {q(n['model'].strip()) if n.get('model') else 'null'}, key_points = {q(kp(n))}::jsonb where {w};")
    for i, ((ol, od, _), (nl, nd, _)) in enumerate(zip(o.get('rubric', []), n.get('rubric', []))):
        if (ol, od) != (nl, nd):
            out.append(f"update public.rubric_criteria set label = {q(nl)}, description = {q(nd)} where position = {i+1} and question_id = (select id from public.questions where ai_review->>'batch' = {batch} and stem = {q(n['stem'].strip())});")
for i, (op, np_) in enumerate(zip(ob.PATTERN, nb.PATTERN)):
    if op['title'] != np_['title']:
        out.append(f"update public.paper_blueprint_sections set title = {q(np_['title'])} where sort_order = {i+1} and paper_id = (select id from public.exam_papers where code = {q(nb.PAPER)});")
out.append('commit;')
open(sys.argv[3], 'w').write('\n'.join(out) + '\n')
print(len(out) - 2, 'statements')
