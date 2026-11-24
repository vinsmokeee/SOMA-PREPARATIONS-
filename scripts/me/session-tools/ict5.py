import json, re, runpy, sys
from collections import defaultdict
RUBRIC = runpy.run_path('scripts/me/technical2_common.py')['RUBRIC']
h = lambda x: round(x * 2) / 2
def split(total, weights):
    """Half-mark shares proportional to weights (largest remainder), summing exactly to total, none below 0.5."""
    units = int(round(total * 2)); sw = sum(weights)
    raw = [w / sw * units for w in weights]; base = [max(1, int(r)) for r in raw]
    while sum(base) > units: i = max(range(len(base)), key=lambda j: base[j]); base[i] -= 1
    order = sorted(range(len(raw)), key=lambda j: -(raw[j] - int(raw[j])))
    k = 0
    while sum(base) < units: base[order[k % len(order)]] += 1; k += 1
    return [b / 2 for b in base]
def rubric(m):
    tot = sum(r[2] for r in RUBRIC); rows = [(l, d, h(mx * m / tot)) for l, d, mx in RUBRIC]; rows = [r for r in rows if r[2] > 0]
    rows[0] = (rows[0][0], rows[0][1], rows[0][2] + m - sum(r[2] for r in rows)); return rows
fmt = lambda x: str(int(x)) if float(x).is_integer() else str(x)
ANN = re.compile(r'([\(\[])\s*([^()\[\]]*?)\s*([Mm]arks?)\s*([\)\]])')
def restem(stem, old, new):
    anns = [m for m in ANN.finditer(stem) if re.search(r'\d', m.group(2))]
    if not anns: return stem.rstrip() + f" ({fmt(new)} marks)"
    if len(anns) == 1 and '=' in anns[0].group(2):  # (1.5 + 1.5 = 3 marks)
        parts = [float(x) for x in re.findall(r'[\d.]+', anns[0].group(2).split('=')[0])]
        np_ = split(new, parts); txt = " + ".join(fmt(x) for x in np_) + f" = {fmt(new)}"
        m = anns[0]; return stem[:m.start()] + f"({txt} marks)" + stem[m.end():]
    vals = []
    for m in anns:
        nums = re.findall(r'[\d.]+', m.group(2)); vals.append(float(nums[-1]) if len(nums) == 1 else None)
    if len(anns) == 1 or None in vals:  # one total annotation: replace the last, keep any others as is
        m = anns[-1]; return stem[:m.start()] + f"({fmt(new)} marks)" + stem[m.end():]
    nv = split(new, vals); out = stem
    for m, v in sorted(zip(anns, nv), key=lambda t: -t[0].start()):
        out = out[:m.start()] + f"({fmt(v)} marks)" + out[m.end():]
    return out
rows = json.load(open(sys.argv[1])); g = defaultdict(list)
for r in rows: g[r['passage_group'] or r['id']].append(r)
q = lambda s: "'" + s.replace("'", "''") + "'"
sql = ["-- ICT Technical Paper II short answers follow the latest (BCSE 2025) layout: Part II = 6 questions x 5 marks = 30",
       "-- (founder rule, 23 Nov 2026: every paper follows the latest year's style, format and marking). Each question (or",
       "-- multi-part question) is set to 5 marks; key points, marks shown in the stem and rubric are scaled to match.", "begin;"]
preview = []
for k, v in g.items():
    olds = [float(r['marks']) for r in v]; tot = sum(olds)
    if tot == 5: continue
    news = split(5, olds)
    for r, old, new in zip(v, olds, news):
        kp = r['key_points'] or []
        nk = split(new, [float(x['marks']) for x in kp]) if kp else []
        kp2 = [dict(x, marks=(int(m) if float(m).is_integer() else m)) for x, m in zip(kp, nk)]
        stem = restem(r['stem'], old, new)
        sql.append(f"update public.questions set marks = {new}, estimated_seconds = {int(new * 108)}, stem = {q(stem)}, key_points = {q(json.dumps(kp2, ensure_ascii=False))}::jsonb where id = '{r['id']}';")
        sql.append(f"delete from public.rubric_criteria where question_id = '{r['id']}';")
        for i, (l, d, mx) in enumerate(rubric(new)):
            sql.append(f"insert into public.rubric_criteria (question_id, label, description, max_marks, position) values ('{r['id']}', {q(l)}, {q(d)}, {mx}, {i + 1});")
        preview.append((old, new, [x['marks'] for x in kp], nk, ANN.findall(stem)[-2:] if ANN.findall(stem) else stem[-30:]))
sql.append("commit;")
open(sys.argv[2], 'w').write("\n".join(sql) + "\n")
for p in preview: print(p)
