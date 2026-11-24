import sys
pages=open(sys.argv[1]).read().split('\f')
for w in sys.argv[2:]:
    hits=[i+1 for i,p in enumerate(pages) for l in p.split('\n') if l.strip().startswith(w+'།')]
    print(w, sorted(set(hits))[:4])
