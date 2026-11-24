"""saqrep.py body.py 'stem prefix' newdict.txt - replace the SAQ dict whose stem starts with prefix"""
import sys
p, pre, newf = sys.argv[1], sys.argv[2], sys.argv[3]
s = open(p).read(); new = open(newf).read().rstrip() + '\n'
k = s.index('stem="' + pre) if ('stem="' + pre) in s else s.index(pre)
i = s.rindex('\n dict(', 0, k) + 1
j = s.find('\n dict(', k); j = s.index('\n]', k) if j == -1 else j
s = s[:i] + new + s[j + 1:]
open(p, 'w').write(s); print('replaced', pre[:40])
