"""usage: p1parts.py <clean.txt> <out.json> <spec.json>: spec maps part name -> [start marker, end marker or null]"""
import re, json, sys
t = open(sys.argv[1]).read()
t = re.sub(r'\nPage \d+ of \d+\n(PAPER I: DZONGKHA)?', '\n', t)
spec = json.load(open(sys.argv[3]))
BUL = '•ü'
def seg(a, b):
    i = t.index(a); j = t.index(b, i + len(a)) if b else len(t); return t[i:j].strip()
def join(s):
    out = []
    for ln in s.split('\n'):
        ln = ln.strip()
        for b in BUL: ln = ln.replace(b, '-')
        if not ln: continue
        new = re.match(r'^([༠-༩0-9]+[༽\-\.)]|\(|[ཀ-ཉ]༽|དྲི་བ|དོན་ཚན|-|༉|[A-Z“"])', ln)
        if out and not new and not out[-1].endswith(('།', '?', '༎', '.', '”')):
            out[-1] += ('' if out[-1].endswith('་') else ' ') + ln
        else:
            out.append(ln)
    return '\n'.join(out)
parts = {k: join(seg(a, b)) for k, (a, b) in spec.items()}
json.dump(parts, open(sys.argv[2], 'w'), ensure_ascii=False, indent=1)
for k, v in parts.items(): print('=====', k, len(v)); print(v if len(v) < 1500 else v[:700] + ' ... ' + v[-300:])
