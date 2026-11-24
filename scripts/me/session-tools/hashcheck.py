"""usage: hashcheck.py module.py [module.py ...] - list stems that already exist live (same content_hash)"""
import sys, runpy, json, hashlib, re, subprocess, os
A = "https://api.supabase.com/v1/projects/ihmyqurrogrodtodxfef/database/query"
def h(s): return hashlib.md5(re.sub(r'\s+', ' ', s.strip()).lower().encode()).hexdigest()
for m in sys.argv[1:]:
    b = runpy.run_path(m)
    hs = {h(q['stem']): q['key'] for q in b['Q']}
    q = "select content_hash, left(stem,80) s from public.questions where status <> 'archived' and content_hash in (%s)" % ",".join("'%s'" % x for x in hs)
    r = subprocess.run(["curl", "-sS", "-X", "POST", A, "-H", "Authorization: Bearer proxy-injected", "-H", "Content-Type: application/json", "--data", json.dumps({"query": q})], capture_output=True, text=True).stdout
    rows = json.loads(r)
    print(os.path.basename(m), "clashes:", [(hs[x['content_hash']], x['s']) for x in rows] if isinstance(rows, list) else rows)
