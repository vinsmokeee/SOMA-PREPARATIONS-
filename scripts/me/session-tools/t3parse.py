"""Parse an RCSC Technical Paper III text (pdftotext -layout): MCQs of Part I, and the rest (Part II, Section B) as text."""
import re, sys, json
t = open(sys.argv[1]).read()
t = re.sub(r'\n[^\n]*Page \d+ of \d+[^\n]*\n', '\n', t)
t = re.sub(r'\n\s*PAPER III[^\n]*\n', '\n', t)
k = re.search(r'PART\s*(I|1)\b|Part\s*(I|1)\b[^I]', t[t.find('SECTION A', 1500):]).start() + t.find('SECTION A', 1500)
i = re.search(r'\n\s*PART\s*[-–:]?\s*II\b|\n\s*Part\s*II\b', t[k:]).start() + k
part1, rest = t[k:i], t[i:]
j = re.search(r'\n\s*1\s*[.)]\s', part1).start()
body = part1[j:]
qs = []
for m in re.finditer(r'\n\s*(\d{1,2})\s*[.)]\s(.*?)(?=\n\s*\d{1,2}\s*[.)]\s|\Z)', body, re.S):
    n, block = int(m.group(1)), m.group(2)
    parts = re.split(r'\n\s*\(?([a-dA-D])[).]\s+', block)
    stem = re.sub(r'\s+', ' ', parts[0]).strip()
    opts = {}
    for x in range(1, len(parts) - 1, 2):
        opts[parts[x].lower()] = re.sub(r'\s+', ' ', parts[x + 1]).strip()
    qs.append({'n': n, 'stem': stem, 'opts': [opts.get(x, '') for x in 'abcd']})
bad = [q['n'] for q in qs if not all(q['opts'])]
nums = [q['n'] for q in qs]
json.dump({'mcq': qs, 'rest': rest}, open(sys.argv[2], 'w'), ensure_ascii=False, indent=0)
print(sys.argv[1].split('/')[-1], len(qs), 'mcqs; missing options:', bad, '; numbers ok:', nums == list(range(1, len(qs) + 1)))
