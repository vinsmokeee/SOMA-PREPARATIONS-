import re, sys, json
t = open(sys.argv[1]).read()
t = re.sub(r"\n\s*Page \d+ of \d+\s*\n", "\n", t)
t = re.sub(r"\n\s*PAPER II:[^\n]*\s*\n", "\n", t)
i1 = re.search(r"Multiple Choice Questions\s*[(\[]70[^\n]*\n", t).end()
m2 = re.search(r"\n\s*PART\s+II\b[^\n]*\n|\n\s*Part\s+II\s*\n", t[i1:])
p1 = t[i1:i1 + m2.start()]; p2 = t[i1 + m2.end():]
qs = []; cur = None; opt = None
for line in p1.split("\n"):
    s = line.strip()
    if not s: continue
    mq = re.match(r"^(\d{1,2})\s*[.)]\s*(.*)$", s)
    mo = re.match(r"^([a-dA-D])\s*[).]\s*(.*)$", s)
    if mq and (cur is None or int(mq.group(1)) == cur["n"] + 1):
        cur = {"n": int(mq.group(1)), "stem": mq.group(2), "opts": []}; qs.append(cur); opt = None; continue
    if cur is None: continue
    if mo and len(cur["opts"]) < 4 and "abcd"[len(cur["opts"])] == mo.group(1).lower():
        cur["opts"].append(mo.group(2)); opt = True; continue
    if opt: cur["opts"][-1] += " " + s
    else: cur["stem"] += " " + s
for q in qs:
    q["stem"] = re.sub(r"\s+", " ", q["stem"]).strip(); q["opts"] = [re.sub(r"\s+", " ", o).strip() for o in q["opts"]]
bad = [q["n"] for q in qs if len(q["opts"]) != 4]
json.dump({"mcq": qs, "part2": p2}, open(sys.argv[2], "w"), ensure_ascii=False, indent=1)
print(sys.argv[1].split('/')[-1], "mcq:", len(qs), "last:", qs[-1]["n"] if qs else None, "bad:", bad)
