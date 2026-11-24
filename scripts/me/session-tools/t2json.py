"""usage: t2json.py dir year  - turns w/t{year}.py (T dict + NEW list) into y{year}.json and w/k{year}.txt"""
import json, sys
d, y = sys.argv[1], sys.argv[2]
ns = {}; exec(open(f'{d}/w/t{y}.py').read(), ns); T = ns['T']
print(y, 'real', len(T), 'missing', sorted(set(range(1, 71)) - set(T)), 'new', len(ns.get('NEW', [])))
json.dump({"mcq": [{"n": n, "stem": s, "opts": o} for n, (s, o, a, e) in sorted(T.items())], "part2": ""}, open(f'{d}/y{y}.json', 'w'), ensure_ascii=False, indent=1)
open(f'{d}/w/k{y}.txt', 'w').write("KEY = {\n" + "".join(f" {n}: ({a!r}, {e!r}),\n" for n, (s, o, a, e) in sorted(T.items())) + "}\n\nNEW_MCQ = [\n" + "".join(f"    ({s!r}, {o!r}, {a!r}, {e!r}),\n" for s, o, a, e in ns.get('NEW', [])) + "]\n")
