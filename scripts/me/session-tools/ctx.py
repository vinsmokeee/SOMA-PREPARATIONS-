import json, re, sys
d = {x['id']: x for x in json.load(open('published.json'))}
u = json.load(open('unknown.json'))
for w in sys.argv[1:]:
    for qid in u.get(w, []):
        x = d[qid]
        texts = [('stem', x['stem']), ('model', x['model_answer'] or ''), ('exp', x['explanation'] or '')] + [('opt', o['body']) for o in (x['opts'] or [])] + [('kp', k.get('point','')) for k in (x['key_points'] or [])]
        for f, t in texts:
            for m in re.finditer(r'(?i)\b' + re.escape(w) + r'\b', t):
                s = t[max(0, m.start()-70): m.end()+50].replace('\n', ' ')
                print(f"[{w}] {x['paper']}/{qid[:8]}/{f}: …{s}…")
