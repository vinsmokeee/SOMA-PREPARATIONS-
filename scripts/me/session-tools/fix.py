import sys
p=sys.argv[1]; L=open(p).read().split("\n")
L[4]='i1 = re.search(r"Multiple Choice Questions[^\\n]*\\n", t, re.I).end()'
L[5]='m2 = re.search(r"\\n\\s*PART\\s+II\\b[^\\n]*\\n|\\n\\s*Part\\s+II\\s*\\n", t[i1:])'
open(p,"w").write("\n".join(L))
