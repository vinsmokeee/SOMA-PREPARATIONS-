"""usage: repeats.py existing.json module.py [module.py ...] - flag stems similar to live questions or to each other"""
import json, re, sys, difflib, runpy, os
ex = json.load(open(sys.argv[1]))
norm = lambda s: re.sub(r'\W+', ' ', s.lower()).strip()
def core(stem):  # drop shared passages: use the last paragraph block (the question itself)
    parts = [p for p in stem.split('\n\n') if p.strip()]
    return norm(parts[-1] if parts else stem)[:400]
pool = [(e['c'] + ' (live)', core(e['stem']), e['stem'][:80]) for e in ex]
for m in sys.argv[2:]:
    b = runpy.run_path(m); name = os.path.basename(m)[:-3]
    mine = [(name + ' ' + q['key'], core(q['stem']), q['stem'][:80]) for q in b['Q']]
    for k, a, s in mine:
        if len(a) < 25: continue
        sm = difflib.SequenceMatcher(None, a, ''); best = (0, None)
        for o in pool:
            if o[0].split(' ')[0] == name: continue
            sm.set_seq2(o[1])
            if sm.real_quick_ratio() > best[0] and sm.quick_ratio() > best[0]:
                r = sm.ratio()
                if r > best[0]: best = (r, o)
        if best[0] > 0.72: print(f'{k}  {best[0]:.2f}  ~ {best[1][0]}\n    {s}\n    {best[1][2]}')
    pool += mine
