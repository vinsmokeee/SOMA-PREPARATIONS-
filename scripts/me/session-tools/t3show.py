import json, sys
d = json.load(open(sys.argv[1]))
for q in d['mcq']:
    print(f"{q['n']}. {q['stem']} | " + ' | '.join(f"{'abcd'[i]}) {o}" for i, o in enumerate(q['opts'])))
if len(sys.argv) > 2:
    import re
    print('=====REST'); print(re.sub(r'\n\s*\n', '\n', d['rest']))
