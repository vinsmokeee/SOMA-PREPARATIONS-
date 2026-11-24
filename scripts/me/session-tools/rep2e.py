import json, re, difflib, sys
D, GROUPKW = sys.argv[1], sys.argv[2]
n = lambda s: re.sub(r'\W+', ' ', (s or '').lower()).strip()
live = [e for e in json.load(open(f"{D}/live_me_mcq.json")) if GROUPKW in (e['batch'] or '')]
pool = [("LIVE " + re.sub(r'.*BCSE (\d{4}).*', r'\1', e['batch']), n(e['stem']), sorted(n(o) for o in (e['opts'] or [])), e['ans']) for e in live]
res = {}
for y in (2016, 2015, 2013, 2011):
    for q in json.load(open(f"{D}/y{y}.json"))["mcq"]:
        a = n(q['stem']); ao = sorted(n(o) for o in q['opts']); best = None
        for o in pool:
            r = difflib.SequenceMatcher(None, a, o[1]).ratio()
            if r < 0.9: continue
            ro = difflib.SequenceMatcher(None, ' | '.join(ao), ' | '.join(o[2])).ratio()
            if best is None or r + ro > best[0] + best[1]: best = (r, ro, o[0], o[3])
        if best: res[f"{y}-{q['n']}"] = best
        pool.append((f"Y{y} Q{q['n']}", a, ao, None))
for k, v in res.items(): print(k, f"stem {v[0]:.2f} optset {v[1]:.2f}", v[2], ("ans: " + v[3][:40]) if v[3] else "")
