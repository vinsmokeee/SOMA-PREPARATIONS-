import re,json,sys
pages=open(sys.argv[1]).read().split('\f')
ents=[]
POS=r'(noun|verb|adj\.|adv\.|pron\.|conj\.|prep\.|excl\.|num\.)'
for i,p in enumerate(pages):
    txt=' '.join(l.strip() for l in p.split('\n'))
    for m in re.finditer(r'([ༀ-࿿]+)\s+'+POS+r'(.{0,160})',txt):
        hw=m.group(1); rest=m.group(3)
        rest=re.split(r'\s[ༀ-࿿་]+།\s+'+POS,rest)[0]
        d={'hw':hw,'pos':m.group(2),'page':i+12}
        for k,c in (('opp',''),('hon',''),('syn','')):
            mm=re.search(c+r'\s*([ༀ-࿿ ]+?)(?=\s*[-]|\s*[A-Za-z0-9(]|$)',rest)
            if mm: d[k]=mm.group(1).strip()
        d['en']=re.sub(r'[-]|[ༀ-࿿]','',rest).strip()[:70]
        ents.append(d)
json.dump(ents,open(sys.argv[2],'w'),ensure_ascii=False)
print(len(ents), sum('hon' in e for e in ents), sum('opp' in e for e in ents))
