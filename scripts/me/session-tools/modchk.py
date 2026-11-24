"""usage: modchk.py outdir years... - dump loaded medsci module MCQs to outdir/y{year}.json for rep2m"""
import json, runpy, sys
d = sys.argv[1]
for y in sys.argv[2:]:
    b = runpy.run_path(f'/home/user/SOMA-PREPARATIONS-/scripts/me/me_technical2_medsci_{y}.py')
    json.dump({'mcq': [{'n': q['key'], 'stem': q['stem'], 'opts': q['opts']} for q in b['Q'] if q['type'] == 'mcq']}, open(f'{d}/y{y}.json', 'w'))
