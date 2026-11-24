import json, re
d = json.load(open('published.json'))
P = [
 ('repeat', r'\b(\w+)\s+\1\b'),
 ('a+vowel', r'\b[aA] (?!uni|use|usu|eu|one|once|European|U\b|user|utility|unit|union|uniform|useful|ut)[aeiouAEIOU]\w+'),
 ('an+cons', r'\b[aA]n (?!h(?:our|onest|onour|eir)|[aeiouAEIOU]|[A-Z]{2}|[FHLMNRSX]\b|MBA|NGO|NHS|SOS|LDL|HDL|RNA|MRI|NSS|FAQ|SME|NCD)[b-df-hj-np-tv-z]\w+'),
 ('nospace', r'[a-z]{2}[.,;:?!][A-Za-z]{2}'),
 ('space-punct', r'\w \s*[,.;:?!](?=\s|$)'),
 ('dblspace', r'\S  +\S'),
 ('lower-start', r'[.?!]\s+[a-z]{3,}'),
 ('i-alone', r'\si\s'),
]
hits = {}
for x in d:
    texts = [('stem', x['stem']), ('model', x['model_answer'] or ''), ('exp', x['explanation'] or '')] + [('opt', o['body']) for o in (x['opts'] or [])]
    for f, t in texts:
        if re.search(r'[ༀ-࿿]', t): continue
        for name, p in P:
            for m in re.finditer(p, t):
                s = t[max(0, m.start()-40): m.end()+40].replace('\n', ' ')
                if name == 'repeat' and m.group(1).lower() in ('that', 'had', 'is', 'very', 'bye', 'no', 'so', 'two', 'ha', 'la', 'ka', 'na'): continue
                if name == 'nospace' and re.search(r'(e\.g|i\.e|etc|www|\.com|\.bt|\.org|\d)', s): continue
                hits.setdefault(name, []).append(f"{x['paper']}/{x['id'][:8]}/{f}: …{s}…")
for k, v in hits.items():
    print(f'=== {k}: {len(v)}')
    for h in v[:400]: print(h[:200])
