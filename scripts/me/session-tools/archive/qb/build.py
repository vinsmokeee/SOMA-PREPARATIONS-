"""Build past-paper question images (public/papers/...) and the SQL that loads the questions as drafts.
Run from the scratchpad: python3 -I qb/build.py <repo dir>"""
import hashlib, importlib.util, json, re, sys
from pathlib import Path
from PIL import Image

REPO = Path(sys.argv[1])
HERE = Path(__file__).resolve().parent
PAPERS = HERE.parent / 'papers'
FOUNDER = '324cdca7-eed3-47a2-876f-587d20a478dd'
SUBJ = {'english': 'english-communication', 'dzongkha': 'dzongkha-communication', 'aptitude': 'logic-analytical-problem-solving', 'data': 'data-interpretation'}
DZ_TOPIC = [(26, 30, 'Comprehension'), (31, 35, 'Grammar and spelling'), (36, 40, 'Word usage'), (41, 45, 'Synonyms'), (46, 50, 'Antonyms')]
DZ_STEM = 'Read the question in the picture (from the original paper) and choose the correct answer: ཀ, ཁ, ག or ང.'
DZ_STEM_PASSAGE = 'Read the passage and the question in the picture (from the original paper) and choose the correct answer: ཀ, ཁ, ག or ང.'


def load(name):
    spec = importlib.util.spec_from_file_location(name, HERE / f'{name}.py')
    m = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(m)
    return m


def q(s):
    return "'" + s.replace("'", "''") + "'"


def slug(s):
    return re.sub(r'[^a-z0-9]+', '-', s.lower()).strip('-')


rendered = {}


def page(year, p):
    key = (year, p)
    if key not in rendered:
        g = sorted(PAPERS.glob(f'r{year}/p{p}-*.png')) or sorted(PAPERS.glob(f'dzq/{year}_r-*{p:02d}.png'))
        if not g:
            import subprocess
            (PAPERS / f'r{year}').mkdir(exist_ok=True)
            subprocess.run(['pdftoppm', '-f', str(p), '-l', str(p), '-r', '200', '-png', str(PAPERS / f'pe{year}.pdf'), str(PAPERS / f'r{year}/p{p}')], check=True)
            g = sorted(PAPERS.glob(f'r{year}/p{p}-*.png'))
        rendered[key] = Image.open(g[0]).convert('RGB')
    return rendered[key]


def save(img, year, name):
    out = REPO / 'public' / 'papers' / f'pe-{year}'
    out.mkdir(parents=True, exist_ok=True)
    w = 1100
    if img.width > w:
        img = img.resize((w, round(img.height * w / img.width)), Image.LANCZOS)
    img.save(out / f'{name}.webp', 'WEBP', quality=82, method=6)
    return f'/papers/pe-{year}/{name}.webp'


def stack(imgs):
    W = max(i.width for i in imgs)
    H = sum(i.height for i in imgs) + 24 * (len(imgs) - 1)
    o = Image.new('RGB', (W, H), 'white')
    y = 0
    for i in imgs:
        o.paste(i, (0, y))
        y += i.height + 24
    return o


def trim(img):
    from PIL import ImageOps
    b = ImageOps.invert(img.convert('L')).point(lambda v: 255 if v > 30 else 0).getbbox()
    return img.crop((max(0, b[0] - 16), max(0, b[1] - 16), min(img.width, b[2] + 16), min(img.height, b[3] + 16))) if b else img


questions = []  # dicts ready for SQL
for year in (2010, 2011):
    eng = load(f'q{year}_english')
    psdi = load(f'q{year}_ps_di')
    passage = (HERE / f'{eng.P}.txt').read_text().strip()
    for d in eng.Q:
        stem = d['stem']
        if d.get('passage'):
            stem = f"Read the passage and answer the question.\n\n{passage}\n\nQuestion: {stem}"
        questions.append(dict(year=year, n=d['n'], page=d['page'], subject='english', topic=d['topic'], stem=stem, opts=d['opts'], ans=d['ans'], conf=d['conf'], exp=d['exp'], note=d.get('note'), image=None))
    figs = {}
    for d in psdi.Q:
        img = None
        if d.get('fig'):
            f = d['fig']
            if f not in figs:
                figs[f] = save(trim(page(year, f[0]).crop(f[1:])), year, f'fig-p{f[0]}-{hashlib.md5(str(f).encode()).hexdigest()[:6]}')
            img = figs[f]
        questions.append(dict(year=year, n=d['n'], page=d['page'], subject=d['sec'], topic=d['topic'], stem=d['stem'], opts=d['opts'], ans=d['ans'], conf=d['conf'], exp=d['exp'], note=d.get('note'), image=img))
    # Dzongkha: original print as pictures; comprehension questions get the passage above them
    dz = load(f'dz{year}')
    pimg = trim(stack([trim(page(year, p).crop(box)) for p, box in dz.PASSAGE]))
    for n in range(26, 51):
        qi = trim(Image.open(PAPERS / 'dzq' / f'{year}_q{n}.png').convert('RGB'))
        comp = n <= 30
        img = save(stack([pimg, qi]) if comp else qi, year, f'dz-q{n}')
        a = dz.ANS.get(n)
        questions.append(dict(year=year, n=n, page=dz.PAGE[n], subject='dzongkha', topic=next(t for lo, hi, t in DZ_TOPIC if lo <= n <= hi),
                              stem=(DZ_STEM_PASSAGE if comp else DZ_STEM) + f'\n\n(BCSE {year} Preliminary Examination, Dzongkha question {n})', opts=['ཀ', 'ཁ', 'ག', 'ང'], ans=a[0] if a else None, conf=a[1] if a else 'none',
                              exp=a[2] if a else None,
                              note=('Dzongkha answer chosen by AI: a Dzongkha speaker must confirm it.' if a else 'No answer set yet: a Dzongkha speaker must choose the correct option.'),
                              image=img))

# ---------------------------------------------------------------- SQL
topics = sorted({(SUBJ[x['subject']], x['topic']) for x in questions})
sql = ["-- Past papers: BCSE 2010 and 2011 Preliminary Examination (RCSC), loaded as drafts awaiting review.",
       "-- Generated by scripts from the founder's PDFs. Students cannot see these until a reviewer verifies and publishes them.",
       "begin;"]
sql.append("""insert into public.source_documents (title, publisher, document_type, exam_year, stage, origin, original_filename, page_count, processing_status, usage_status, usage_notes, created_by)
select 'BCSE 2010 Preliminary Examination paper', 'Royal Civil Service Commission', 'past_paper', 2010, 'PE', 'upload', 'BCSE-2010-PE.pdf', 35, 'processed', 'unknown',
       'Published on the RCSC website; copy supplied by the founder.', %s
where not exists (select 1 from public.source_documents where document_type = 'past_paper' and exam_year = 2010 and stage = 'PE');""" % q(FOUNDER))
sql.append("""update public.source_documents set processing_status = 'processed', page_count = coalesce(page_count, 29)
where document_type = 'past_paper' and exam_year = 2011 and stage = 'PE';""")
for y, title, n, date in ((2010, 'BCSE 2010 Preliminary Examination (Series A)', 100, None), (2011, 'BCSE 2011 Preliminary Examination (Series A)', 100, '2011-08-28')):
    sql.append(f"""insert into public.historical_papers (source_document_id, exam_year, stage, original_title, exam_date, question_count, has_official_key, processing_status, attribution_text, created_by)
select id, {y}, 'PE', {q(title)}, {('date ' + q(date)) if date else 'null'}, {n}, false, 'processed', 'Royal Civil Service Commission, Bhutan', {q(FOUNDER)}
from public.source_documents where document_type = 'past_paper' and exam_year = {y} and stage = 'PE'
on conflict do nothing;""")
for s, t in topics:
    sql.append(f"insert into public.topics (subject_id, slug, name) select id, {q(slug(t))}, {q(t)} from public.subjects where slug = {q(s)} on conflict (subject_id, slug) do nothing;")

for x in questions:
    subj = SUBJ[x['subject']]
    hp = f"(select h.id from public.historical_papers h join public.source_documents d on d.id = h.source_document_id where h.exam_year = {x['year']} and h.stage = 'PE' and d.document_type = 'past_paper' limit 1)"
    sql.append(f"""with nq as (
  insert into public.questions (stage, question_type, stem, explanation, subject_id, topic_id, difficulty, marks, estimated_seconds, origin, historical_paper_id, status, source_year, source_page, image_url, created_by)
  values ('PE', 'mcq', {q(x['stem'])}, {q(x['exp']) if x['exp'] else 'null'},
    (select id from public.subjects where slug = {q(subj)}),
    (select t.id from public.topics t join public.subjects s on s.id = t.subject_id where s.slug = {q(subj)} and t.slug = {q(slug(x['topic']))}),
    'standard', 1, 90, 'historical_official', {hp}, 'awaiting_review', {x['year']}, {x['page']}, {q(x['image']) if x['image'] else 'null'}, {q(FOUNDER)})
  returning id
), o as (
  insert into public.question_options (question_id, label, body, is_correct, position)
  select nq.id, v.label, v.body, v.ok, v.pos from nq, (values {', '.join(f"({q('ABCD'[i])}, {q(b)}, {'true' if x['ans'] == i else 'false'}, {i + 1})" for i, b in enumerate(x['opts']))}) as v(label, body, ok, pos)
  returning 1
), r as (
  insert into public.question_references (question_id, source_document_id, citation)
  select nq.id, (select source_document_id from public.historical_papers where id = {hp}), {q(f"BCSE {x['year']} Preliminary Examination (RCSC), question {x['n']}, page {x['page']}")} from nq
  returning 1
)
insert into public.content_reviews (entity_type, entity_id, reviewer_id, action, to_status, comment)
select 'question', nq.id, {q(FOUNDER)}, 'comment', 'awaiting_review',
  {q(f"Past paper {x['year']} Q{x['n']}. Answer confidence: {x['conf']}." + (f" {x['note']}" if x['note'] else ''))} from nq;""")
sql.append("commit;")
out = REPO / 'supabase' / 'data' / 'past_papers_pe_2010_2011.sql'
out.parent.mkdir(exist_ok=True)
out.write_text('\n\n'.join(sql) + '\n')
summary = {}
for x in questions:
    k = (x['year'], x['subject'])
    s = summary.setdefault(k, {'n': 0, 'high': 0, 'medium': 0, 'low': 0, 'none': 0, 'images': 0})
    s['n'] += 1
    s[x['conf']] += 1
    s['images'] += bool(x['image'])
print(len(questions), 'questions')
for k, v in sorted(summary.items()):
    print(k, v)
json.dump([{k: v for k, v in x.items() if k != 'stem'} for x in questions], open(HERE / 'questions.json', 'w'), ensure_ascii=False, indent=1)
