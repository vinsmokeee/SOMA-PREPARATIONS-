"""usage: statcrop.py imgdir prefix page x0 y0 x1 y1 outname  (coords at viewing size 765 wide)"""
import sys
from PIL import Image
d, pre, pg, x0, y0, x1, y1, out = sys.argv[1], sys.argv[2], sys.argv[3], *map(int, sys.argv[4:8]), sys.argv[8]
im = Image.open(f"{d}/{pre}-{int(pg):02d}.png"); s = im.size[0] / float(__import__("os").environ.get("VW", "765"))
c = im.crop((int(x0 * s), int(y0 * s), int(x1 * s), int(y1 * s)))
if c.size[0] > 1000: c = c.resize((1000, int(c.size[1] * 1000 / c.size[0])), Image.LANCZOS)
c.save(f"/home/user/SOMA-PREPARATIONS-/public/papers/me/{out}.png", optimize=True); print(out, c.size)
