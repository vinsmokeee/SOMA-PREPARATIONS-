import json, re, difflib, sys
D = sys.argv[1]
norm = lambda s: re.sub(r'\W+', ' ', s.lower()).strip()
live = json.load(open(f"{D}/live_me_mcq.json"))
pool = [("LIVE " + (e['batch'] or e['code'] or '') + " " + e['status'], norm(e['stem']), e['stem'][:90], norm(' '.join(e['opts'] or []))) for e in live]
out = []
for y in range(2019, 2024):
    qs = json.load(open(f"{D}/y{y}.json"))["mcq"]
    for q in qs:
        a = norm(q['stem']); ao = norm(' '.join(q['opts']))
        best = (0, None)
        sm = difflib.SequenceMatcher(None, "", a)
        for o in pool:
            sm.set_seq1(o[1])
            if sm.real_quick_ratio() <= best[0] or sm.quick_ratio() <= best[0]: continue
            r = sm.ratio()
            if r > best[0]: best = (r, o)
        if best[0] > 0.80:
            ro = difflib.SequenceMatcher(None, ao, best[1][3]).ratio()
            out.append(f"{y} Q{q['n']} stem {best[0]:.2f} opts {ro:.2f} ~ {best[1][0]}\n   {q['stem'][:90]}\n   {best[1][2]}")
        pool.append((f"Y{y} Q{q['n']}", a, q['stem'][:90], ao))
print("\n".join(out)); print(len(out))
