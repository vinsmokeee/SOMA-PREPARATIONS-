import json, re, collections
from spellchecker import SpellChecker
d = json.load(open('published.json'))
sp = SpellChecker()  # English
# field texts
def fields(x):
    yield 'stem', x['stem']
    for f in ('model_answer', 'explanation'):
        if x[f]: yield f, x[f]
    for k in (x['key_points'] or []):
        yield 'kp', k.get('point', '')
    for o in (x['opts'] or []):
        yield 'opt', o['body']
words = collections.Counter(); where = collections.defaultdict(set)
for x in d:
    for f, t in fields(x):
        for w in re.findall(r"[A-Za-z][A-Za-z']+[A-Za-z]|[A-Za-z]{2,}", t or ''):
            if w.isupper() or (w[0].isupper() and len(w) > 1 and not w[1:].islower()): continue  # acronyms, CamelCase
            lw = w.lower().strip("'")
            words[lw] += 1; where[lw].add(x['id'])
unknown = sp.unknown(words.keys())
rows = sorted(((words[w], w) for w in unknown), key=lambda r: (r[0], r[1]))
json.dump({w: sorted(where[w]) for _, w in rows}, open('unknown.json', 'w'))
print(len(unknown), 'unknown words')
print(' '.join(w for c, w in rows if c <= 2))
