import json, collections, sys
D=sys.argv[1]
sec=json.load(open(D+'/sec.json')); qs=json.load(open(D+'/q.json')); nm=json.load(open(D+'/names.json'))
spec_name={r['id']:r['name'] for r in nm if r['k']=='spec'}; spec_grp={r['id']:r['grp'] for r in nm if r['k']=='spec'}
grp_name={r['id']:r['name'] for r in nm if r['k']=='group'}
papers={}
for s in sec: papers.setdefault(s['code'],{'title':s['title'],'scope':s['bank_scope'],'num':s['paper_number'],'secs':[]})['secs'].append(s)
def audiences(code,P):
    specs=set(); grps=set()
    for q in qs:
        if q['code']!=code: continue
        if q['spec']: specs.add(q['spec'])
        if q['grp']: grps.add(q['grp'])
    for s in P['secs']:
        if s['spec']: specs.add(s['spec'])
        if s['grp']: grps.add(s['grp'])
    if P['scope']=='specialisation' or specs: return [('spec',x) for x in sorted(specs, key=lambda i: spec_name.get(i,''))]
    if P['scope']=='subject_group' or grps: return [('grp',x) for x in sorted(grps, key=lambda i: grp_name.get(i,''))]
    return [('shared',None)]
def sections_for(P,kind,x):
    g = spec_grp.get(x) if kind=='spec' else (x if kind=='grp' else None)
    if kind=='spec':
        own=[s for s in P['secs'] if s['spec']==x]
        if own: return own,g
    gs=[s for s in P['secs'] if not s['spec'] and g and s['grp']==g]
    if gs: return gs,g
    return [s for s in P['secs'] if not s['spec'] and not s['grp']],g
def fits(q,kind,x,g):
    if q['spec'] and not (kind=='spec' and q['spec']==x): return False
    if q['grp'] and q['grp']!=g: return False
    return True
def mocks(secs,code,kind,x,g,col):
    pool=collections.Counter()
    for q in qs:
        if q['code']==code and fits(q,kind,x,g): pool[(q['t'],q['topic'])]+=q[col]
    need=collections.Counter(); 
    for s in secs: need[(s['t'],s['topic'])]+=s['n']
    k=0
    while k<999:
        kk=k+1; ok=True
        for t in {t for t,_ in need}:
            spec_topics={tp:n for (tt,tp),n in need.items() if tt==t and tp}
            for tp,n in spec_topics.items():
                if pool[(t,tp)]<kk*n: ok=False
            nnull=need.get((t,None),0)
            if nnull:
                avail=sum(v for (tt,tp),v in pool.items() if tt==t) - sum(kk*n for tp,n in spec_topics.items())
                if avail<kk*nnull: ok=False
        if not ok: break
        k=kk
    # limiting section
    lim=None
    return k
out=[]
for code,P in sorted(papers.items()):
    for kind,x in audiences(code,P):
        secs,g=sections_for(P,kind,x)
        if not secs: continue
        who= spec_name.get(x) if kind=='spec' else grp_name.get(x) if kind=='grp' else ''
        out.append((code,P['title'],who,mocks(secs,code,kind,x,g,'pub'),mocks(secs,code,kind,x,g,'allq')))
json.dump(out,open(D+'/out.json','w'),indent=0)
for r in out: print(f"{r[0]:<18} {r[2][:34]:<34} now {r[3]:>3}  after-publish {r[4]:>3}")
