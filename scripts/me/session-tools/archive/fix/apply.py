"""Apply text fixes to published questions. FIXES files: lines 'id8 ||| old ||| new'. Every 'old' must be found
(in stem, model answer, explanation, key points or an option) of that question; prints SQL to stdout."""
import json, sys, glob
d = {x['id'][:8]: x for x in json.load(open(sys.argv[1]))}
def q(s): return "'" + s.replace("'", "''") + "'"
out, bad, n = ['begin;'], [], 0
fixes = []
for f in sorted(glob.glob(sys.argv[2])):
    for line in open(f):
        line = line.rstrip('\n')
        if not line.strip() or line.startswith('#'): continue
        k, old, new = [p.strip() for p in line.split('|||')]
        fixes.append((k, old, new))
for k, old, new in fixes:
    x = d.get(k)
    if not x: bad.append(('no question', k)); continue
    hit = False
    for col in ('stem', 'model_answer', 'explanation'):
        if x[col] and old in x[col]:
            x[col] = x[col].replace(old, new); hit = True
            out.append(f"update public.questions set {col} = replace({col}, {q(old)}, {q(new)}) where id = {q(x['id'])};")
    kp = x['key_points'] or []
    if any(old in (p.get('point') or '') for p in kp):
        for p in kp: p['point'] = p['point'].replace(old, new)
        out.append(f"update public.questions set key_points = {q(json.dumps(kp, ensure_ascii=False))}::jsonb where id = {q(x['id'])};"); hit = True
    for o in (x['opts'] or []):
        if old in o['body']:
            o['body'] = o['body'].replace(old, new); hit = True
            out.append(f"update public.question_options set body = replace(body, {q(old)}, {q(new)}) where id = {q(o['id'])};")
    if not hit: bad.append((k, old)); continue
    n += 1
out.append('commit;')
open(sys.argv[3], 'w').write('\n'.join(out) + '\n')
json.dump(list(d.values()), open(sys.argv[1].replace('.json', '.fixed.json'), 'w'), ensure_ascii=False)
print(n, 'fixes applied in SQL;', len(bad), 'not found:'); [print('  ', b) for b in bad]
