"""Crop each Dzongkha question (stem + four options ཀ ཁ ག ང) as one image, joining page breaks.
A question starts at a line in the left margin that begins with a Tibetan numeral or a dash
(the numerals are sometimes extracted badly); questions are numbered in order from <first no.>.
A question ends at its last option line (options are indented), so headings in between are left out.
Usage: python3 dzcrop.py <pdf> <year> <first page> <last page> <out dir> <first no.>"""
import glob, json, re, subprocess, sys
from PIL import Image

pdf, year, p0, p1, OUT, N0 = sys.argv[1], sys.argv[2], int(sys.argv[3]), int(sys.argv[4]), sys.argv[5], int(sys.argv[6])
S = 200 / 72

lines = []  # (page, y0, y1, x0, text)
for p in range(p0, p1 + 1):
    h = subprocess.run(['pdftotext', '-f', str(p), '-l', str(p), '-bbox-layout', pdf, '-'], capture_output=True, text=True).stdout
    for m in re.finditer(r'<line xMin="([\d.]+)" yMin="([\d.]+)" xMax="([\d.]+)" yMax="([\d.]+)">(.*?)</line>', h, re.S):
        t = ' '.join(re.findall(r'>([^<]+)</word>', m.group(5)))
        y0, y1, x0 = float(m.group(2)), float(m.group(4)), float(m.group(1))
        if y0 < 45 or y0 > 735:  # page header and footer
            continue
        lines.append((p, y0, y1, x0, t))
lines.sort()

starts = [i for i, l in enumerate(lines) if l[3] < 75 and re.match(r'^([༠-༩]|-)', l[4])]
subprocess.run(['pdftoppm', '-f', str(p0), '-l', str(p1), '-r', '200', '-png', pdf, f'{OUT}/{year}_r'])


def page_img(p):
    return Image.open([g for g in glob.glob(f'{OUT}/{year}_r-*.png') if re.search(rf'-0*{p}\.png$', g)][0])


idx = []
for k, si in enumerate(starts):
    end = starts[k + 1] if k + 1 < len(starts) else len(lines)
    block = lines[si:end]
    # same-line fragments of the question line (number and text are separate "lines")
    opts = [l for l in block if 85 < l[3] < 175]
    last = max(opts, key=lambda l: (l[0], l[2])) if opts else block[-1]
    segs = {}
    for l in block:
        if len(opts) >= 4 and (l[0], l[1]) > (last[0], last[2]):
            continue
        s = segs.setdefault(l[0], [l[1], l[2]])
        s[0], s[1] = min(s[0], l[1]), max(s[1], l[2])
    if len(opts) < 4:
        # options without a text layer: take everything up to the next question (or the page end)
        nxt = lines[end] if end < len(lines) else None
        first_page = lines[si][0]
        last_page = nxt[0] if nxt else max(segs)
        for p in range(first_page, last_page + 1):
            s = segs.setdefault(p, [60.0, 60.0])
            if p == first_page:
                s[0] = lines[si][1]
            s[1] = (nxt[1] - 8) if (nxt and p == nxt[0]) else 730.0
        segs = {p: v for p, v in segs.items() if v[1] - v[0] > 12}
    parts = []
    for p in sorted(segs):
        y0, y1 = segs[p]
        im = page_img(p)
        parts.append(im.crop((80, int((y0 - 6) * S), im.width - 80, int((y1 + 8) * S))))
    W = max(x.width for x in parts)
    H = sum(x.height for x in parts)
    out = Image.new('RGB', (W, H), 'white')
    y = 0
    for x in parts:
        out.paste(x, (0, y))
        y += x.height
    n = N0 + k
    out.save(f'{OUT}/{year}_q{n}.png')
    idx.append(dict(n=n, page=lines[si][0], segs=len(parts), h=H))
json.dump(idx, open(f'{OUT}/{year}_index.json', 'w'))
print(len(idx), [(i['n'], i['page'], i['segs'], i['h']) for i in idx])
