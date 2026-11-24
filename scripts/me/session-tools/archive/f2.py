import sys,re
pages=open(sys.argv[1]).read().split('\f')
for w in sys.argv[2:]:
    out=[]
    for i,p in enumerate(pages):
        L=p.split('\n')
        for j,l in enumerate(L):
            if l.strip().startswith(w+'། ') or l.strip()==w+'།':
                out.append(f"p{i+12}: "+' '.join(x.strip() for x in L[j:j+3])[:150])
    print(w,'=>',out[:2])
