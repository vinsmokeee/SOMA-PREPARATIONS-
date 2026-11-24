"""usage: p1emit.py <parts.json> <fixes.json> <answers.py> <out module>: write a General Paper I module with the
question texts embedded as literals (after extra font fixes) and the answers from answers.py"""
import json, sys
parts = json.load(open(sys.argv[1])); fixes = json.load(open(sys.argv[2]))
for k in parts:
    for a, b in fixes: parts[k] = parts[k].replace(a, b)
ans = open(sys.argv[3]).read()
head = ans.split('#@@BODY@@')[0]; body = ans.split('#@@BODY@@')[1]
lits = '\n'.join(f'TXT_{k} = {json.dumps(v, ensure_ascii=False)}' for k, v in parts.items())
open(sys.argv[4], 'w').write(head + '\n# ---- question texts copied from the RCSC PDF (pdftotext + dz_fix + the fixes below)\n' + lits + '\n' + body)
