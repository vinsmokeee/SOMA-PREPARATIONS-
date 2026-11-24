import json, sys
D, y = sys.argv[1], sys.argv[2]
skip = {int(l.split()[0].split('-')[1]) for l in open(f"{D}/rep2.txt") if l.startswith(y + '-')}
extra = {int(x) for x in sys.argv[3:]}
for q in json.load(open(f"{D}/y{y}.json"))['mcq']:
    if q['n'] in skip and q['n'] not in extra: continue
    print(q['n'], q['stem']); print('   ', ' | '.join('abcd'[i]+') '+o for i,o in enumerate(q['opts'])))
