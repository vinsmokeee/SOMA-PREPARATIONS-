"""Parse an RCSC Technical Paper II text (pdftotext -layout) into MCQs (Part I) and the Part II text."""
import re, sys, json
t = open(sys.argv[1]).read()
t = re.sub(r'\n\s*Page \d+ of \d+\s*\n(\s*PAPER II[^\n]*\n)?', '\n', t)
k = t.find('PART I')
i = t.find('PART II', k + 7)
part1, part2 = t[k:i], t[i:]
j = re.search(r'\n\s*1\.\s', part1).start()
body = part1[j:]
qs = []
for m in re.finditer(r'\n\s*(\d{1,2})\.\s(.*?)(?=\n\s*\d{1,2}\.\s|\Z)', body, re.S):
    n, block = int(m.group(1)), m.group(2)
    parts = re.split(r'\n\s*([a-d])\)\s*', '\n' + block.strip() if False else block)
    stem = re.sub(r'\s+', ' ', parts[0]).strip()
    opts = {}
    for k in range(1, len(parts) - 1, 2):
        opts[parts[k]] = re.sub(r'\s+', ' ', parts[k + 1]).strip()
    qs.append({'n': n, 'stem': stem, 'opts': [opts.get(x, '') for x in 'abcd']})
bad = [q['n'] for q in qs if not all(q['opts'])]
nums = [q['n'] for q in qs]
json.dump({'mcq': qs, 'part2': part2}, open(sys.argv[2], 'w'), ensure_ascii=False, indent=0)
print(len(qs), 'mcqs; missing options:', bad, '; numbers ok:', nums == list(range(1, len(qs) + 1)))
