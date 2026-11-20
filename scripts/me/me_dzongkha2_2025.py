"""ME Dzongkha category Paper II (English Language and Current Affairs), batch 1: the RCSC BCSE 2025 paper plus a
second set of questions of the same kinds.

Pattern (RCSC BCSE 2025, Dzongkha category, Paper II): 100 marks, 3 hours writing + 15 minutes reading.
  Section I essay: choose 1 of 2 (300-350 words), 25.  Section II letter: choose 1 of 2 (about 150 words), 20.
  Section III comprehension: one passage, Question A (5 multiple-choice items, 1 mark each, written as letters) and
  Questions B, C, D (5 marks each), 20.  Section IV translation Dzongkha -> English, 25.
  Section V current affairs: 10 multiple-choice questions, 1 mark each.
Current-affairs questions 3, 4, 5, 6 and 8 of the real paper are left out: the answer could not be confirmed.
The real translation passage was extracted from a PDF whose font garbles some Dzongkha letters; it was cleaned by
scripts/me/dz_clean.py but MUST be compared with the RCSC PDF by a Dzongkha reader before publishing.
"""

BATCH = "ME Paper II (Dzongkha category): BCSE 2025 + similar, batch 1"
GROUP_TAG = "2025b1"
PAPER = "me-dzongkha-2"
SUBJECT = "english-language-current-affairs"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Dzongkha category, Paper II", "year": 2025,
          "url": "https://rcsc.gov.bt/wp-content/uploads/2026/01/Dzongkha-Paper-II.pdf"}

PATTERN = [
    {"title": "Section I: Essay writing", "type": "essay", "count": 2, "marks_each": 25, "answer_any": 1},
    {"title": "Section II: Letter writing", "type": "long_answer", "count": 2, "marks_each": 20, "answer_any": 1},
    {"title": "Section III: Comprehension", "type": "passage", "count": 1, "marks_each": 20, "answer_any": None},
    {"title": "Section IV: Translation (Dzongkha to English)", "type": "translation", "count": 1, "marks_each": 25, "answer_any": None},
    {"title": "Section V: Current affairs", "type": "mcq", "count": 10, "marks_each": 1, "answer_any": None},
]

# RCSC: essays "orderly and coherent presentation of materials, content, analytical ability, and use of appropriate
# features and general accuracy of spellings, punctuation and grammar".
RUBRIC = [
    ("Content and analysis", "Relevant, well-developed points that answer exactly what is asked.", 8),
    ("Organisation", "Orderly, coherent presentation; correct format for letters; paragraphs.", 5),
    ("Language accuracy", "Grammar, spelling, punctuation and appropriate vocabulary.", 7),
]

E, L, C, T, M = "essay", "long_answer", "passage", "translation", "mcq"
DZ_ISSUE = "Dzongkha text: please have a fluent Dzongkha reader check it before publishing."
PDF_ISSUE = "Real translation passage extracted from a PDF with a faulty font and cleaned automatically: compare it word by word with the RCSC PDF."

TRANSLATION_1 = '''སློབ་དཔོན་ཚུ་ དགོངས་ཞུ་འབད་ནི་ལས་ ག་དེ་སྦེ་ བསྒྱུར་བཅོས་འབད་ཚུགས་ག?

༉ སྤྱི་ལོ་༢༠༢༤ ལུ་ སློབ་དཔོན་དགོངས་ཞུ་འབད་མི་ ཡར་སེང་འགྱོ་མི་དེ་གིས་ ང་བཅས་རའི་ ཤེས་རིག་གི་ལམ་ལུགས་ནང་ དུམ་ གྲ་ཅིག་ འཛོལ་བ་ཞུགས་ཡོད་པའི་མངོན་གསལ་བྱུང་ཡོདཔ་ད་ ལོ་གཅིག་ནང་ སློབ་དཔོན་ ༡,༡༩༣ གྱིས་ཤེས་རིག་གི་ལཱ་ནང་ལས་ དགོངས་ཞུ་འབད་མི་དེ་ སྤྱི་ལོ་༢༠༢༣ དང་ཕྱདཔ་ད་ གསུམ་ལྟབ་སྦེ་ ཡར་འཕོར་སོང་ཡོདཔ་ལས་ དེ་འཕོ་ལས་ གྲོས་ཐག་གཅད་ དགོ་པའི་གནས་སྟངས་ཅིག་ཨིན་མས། དགོངས་ཞུ་འབད་མིའི་གྲས་ལས་ ཁག་འབག་སློབ་དཔོན་ ༦༤༨ དང་ དུས་རྒྱུན་གྱི་ལས་ བྱེདཔ་ ༥༤༥ ཡོདཔ་ད་ མི་མང་གི་སློབ་གྲྭ་ཚུ་ནང་ དགོངས་ཞུའི་ཚད་གཞི་ བརྒྱ་ཆ་ ༦.༩༠ འབད་མི་དེ་ ཧེ་མ་དང་ཕྱོདཔ་ད་ མཐོ་ ཤོས་ཅིག་ཨིནམ་ད་ དེ་ཡང་ ཟླཝ་རེ་ནང་ སློབ་དཔོན་ ༩༩ དེ་ཅིག་གིས་ དགོངས་ཞུ་འབད་མི་ལུ་ལྟཝ་ད་ འདས་པའི་ལོ་ ༥ འི་ ནང་ སློབ་དཔོན་ཚུ་གིས་ དགོངས་ཞུ་འབད་མིའི་གྱངས་ཁ་དེ་ མཐོ་ཤོས་ཅིག་ཨིན་མས། 

སྤྱི་ལོ་ ༢༠༢༠ ལུ་ སློབ་དཔོན་ ༡༦༣ དང་ སྤྱི་ལོ་༢༠༢༡ ལུ་ ༣༥༣ སྤྱི་ལོ་ ༢༠༢༢ ལུ་ ༤༧༨ དེ་ལས་ སྤྱི་ལོ་ ༢༠༢༣ ལུ་ ༣༧༡ གིས་ དགོངས་ཞུ་འབད་ཡོདཔ་ཨིན་པས། སྤྱི་ལོ་༢༠༢༤ ལུ་ སློབ་དཔོན་མང་རབས་ཅིག་གིས་ དགོངས་ཞུ་འབད་མའི་གནས་ སྟངས་དེ་ ཚབས་ཆེན་ ཅིག་ཨིན་རུང་ གནས་སྡུད་དེ་གིས་ གནས་ཚུལ་གྱི་ཆ་ཤས་ཅིག་རྐྱངམ་གཅིག་ སྟོན་དོ་ཡོདཔ་ད་ དགོངས་ཞུ་ འབད་བའི་རྒྱབ་ལས་ སློབ་དཔོན་ཚུ་གིས་ ཁོང་གི་རེ་བ་དང་ དགོས་མཁོ་ཚུ་འགྲུབ་ནི་ལུ་ རྒྱབ་སྐྱོར་མེད་པའི་ལམ་ལུགས་དེ་ལུ་ སེམས་ཕམ་བྱུང་སྟེ་ཡོད་ཟེར་ སྟོན་དོ་ཡོདཔ་ཨིན་མས། ང་བཅས་རའི་ སློབ་དཔོན་མང་རབས་ཅིག་ གནད་དོན་ག་ཅི་སྦེ་ ཐོན་འགྱོཝ་ ཨིན་ན? དེ་ཡང་ ལཱ་གི་ལྗིད་ཚད་ལྕི་མི་དང་ ཚེ་གཡོག་གི་གནས་ཚད་ ཡར་དྲག་འགྱོ་ནི་ལུ་ཐོགས་ལུས་མི་ ངོས་འཛིན་མེད་མི་ལུ་ བརྟེན་ཨིན་མས། 

དེ་ལས་ གྲོང་གསེབ་ཀྱི་ས་གནས་ཚུ་ནང་ གནས་སྤོར་བཏང་མི་དེ་གིས་ གནས་སྟངས་སྐྱོ་དྲགས་ བཟོ་དོ་ཡོདཔ་སྦེ་ ཨིན་མས། སློབ་ དཔོན་ཚུ་ འཕལ་འཕལ་སྦེ་ར་ དཔེ་ཆ་སྟོན་ནི་དང་ གྲོས་སྟོན་འབད་ནི་ དེ་ལས་ བདག་སྐྱོང་གི་འགན་ཁུར་ཚུ་ སྣ་མང་འབག་དགོཔ་ ལས་ ཁོང་ལུ་ ལཱ་གི་དཀའ་ངལ་བྱུང་དོ་ཡོད་པའི་ཁར་ བརྩི་མཐོང་ཆུང་སུ་ཅིག་ལས་མེདཔ་ཨིན་མས། གྲོང་གསེབ་ཀྱི་ས་ཁོངས་ཚུ་ནང་ གཞི་རྟེན་མཐུན་རྐྱེན་ཚུ་ ལེགས་ཤོམ་མེད་མི་དང་ བཟའ་ཚང་ཚུ་དང་ ཐག་རིང་ས་སྦེ་ སྤྲོད་དགོཔ་བྱུང་མི་ལུ་བརྟེན་ དཀའ་ངལ་དེ་ ཧེང་སྐལ་ར་ སྦོམ་འགྱོ་དོ་ཡོདཔ་ད་ དེ་དང་གཅིག་ཁར་ ལས་སྡེ་གཞན་ཚུ་དང་ ཡང་ན་ རྒྱལ་ཁབ་གཞན་ཁར་ འོང་འབབ་ལེགས་ ཤོམ་འཐོབ་ནིའི་ གོ་སྐབས་ཡོདཔ་ལས་ སློབ་དཔོན་གྱི་ལཱ་འབད་ནི་དེ་ གདམ་ཁ་ལེགས་ཤོམ་ཅིག་སྦེ་ མི་མཐོང་དོ་ཡོདཔ་ཨིན་མས། 

སློབ་གྲྭ་ཚུ་ནང་ སློབ་དཔོན་ལངམ་སྦེ་མེད་ནི་དེ་གིས་ སློབ་ཁང་ནང་ སློབ་ཕྲུག་གི་གྱངས་ཁ་ཡར་འཕར་འགྱོ་མི་དང་ ཤེས་རིག་གི་སྤུས་ ཚད་ མར་བབས་འགྱོ་དོ་ཡོདཔ་ད་ དམིགས་བསལ་དུ་ གྲོང་གསེབ་ཀྱི་ས་ཁོངས་ཚུ་ནང་ སློབ་དཔོན་མ་ལང་པའི་ དཀའ་ངལ་སྦོམ་ བྱུང་དོ་ཡོདཔ་ལས་ སློབ་ཕྲུག་ཚུ་ལུ་ ཤེས་རིག་གི་ཁྱད་པར་ སྦོམ་བཟོ་ནིའི་ཉེན་ཁ་འདུག། 

ལྷག་ལུས་སློབ་དཔོན་ཚུ་ལུ་ དེ་གིས་ ང་བཅས་རའི་ ལཱ་གི་ལྗིད་ཚད་ ཡར་སེང་འགྱོ་བའི་དཀའ་སྡུག་འབྱུང་ནིའི་ཉེན་ཁ་ཡོདཔ་ད་ ཤེས་རིག་ལམ་ལུགས་ཀྱི་གཞི་འགྱམ་དེ་ ཉམས་སུ་བཟོ་སྟེ་ དུས་ཚོད་འ་ནེམ་ཅིག་ཁར་ རྒྱལ་ཁབ་ཀྱི་མི་སྡེ་དཔལ་འབོར་གོང་འཕེལ་ལུ་ གནོད་ཉེན་འབྱུང་ནི་ཨིན་མས། ལམ་ལུགས་འདི་ བསྒྱུར་བཅོས་འབད་དགོ་པ་ཅིན་ བློ་ཁོག་སྦོམ་བཙུགས་ཏེ་ ལམ་ལུགས་ཀྱི་ བསྒྱུར་ བཅོས་ཚུ་འབད་དགོཔ་མ་ཚད་ སློབ་དཔོན་ཚུ་གི་དངུལ་ཕྱོགས་ཡང་ རྒྱལ་ཁབ་ཀྱི་མ་འོངས་སྒྲིང་སྒྲིང་བཟོ་ནི་ལུ་ དོ་འགྲན་ཅན་སྦེ་བཟོ་དགོཔ་ད་ འགན་འཁྲི་སྦོམ་འབག་དོ་ཡོདཔ་ལས་ དེ་ཡང་ སློབ་དཔོན་ཚུ་གིས་ ངེས་བརྟན་བལྟ་དགོཔ་འདུག། གྲོང་གསེབ་ཀྱི་ས་ ཁོངས་ཚུ་ནང་ གནས་སྤོར་བཏང་མི་ཚུ་ལུ་ སེམས་ཤུགས་མཐུན་རྐྱེན་ཚུ་བྱིན་དགོཔ་ད་ དེ་ཡང་ ཁྱིམ་གྱི་འཐུས་བྱིན་ནི་དང་ གནས་ ཡུན་མར་ཕབ་འབད་ནི་ དེ་ལས་ གཞི་རྟེན་མཐུན་རྐྱེན་ཚུ་ ལེགས་ཤོམ་བཟོ་དགོ་པའི་ཁར་ གོ་སྐབས་ཡར་སེང་དང་ ཁྱད་རིག་གི་གོ་ སྐབས་ཚུ་ བྱིན་ནིའི་དོན་ལུ་ ལཱ་གཡོག་གི་ལམ་ལུགས་ཚུ་ བསྐྱར་ཞིབ་འབད་དགོཔ་འདུག། ལྷག་པར་དུ་ ཁྱད་རིག་གོང་འཕེལ་གཏང་ ནི་ལུ་ གཙོ་རིམ་བཟུང་དགོཔ་ད་ དུས་རྒྱུན་གྱི་ སྦྱོང་བརྡར་དང་ གོ་བསྡུར་ཞལ་འཛོམས་ དེ་ལས་ དེང་སང་གི་ སློབ་སྟོན་ལག་ཆས་ ཚུ་ ལག་ལེན་འཐབ་ཚུགས་པ་ཅིན་ སློབ་དཔོན་ཚུ་ལུ་ ལྕོགས་གྲུབ་ཅན་བཟོ་ནི་དང་ ལཱ་གཡོག་ནང་འབད་རུང་ ངལ་རངས་བསྐྱེད་ནིའི་ ཕན་ཁྱད་འདུག།'''

TRANSLATION_1_MODEL = """How can teacher resignations be addressed?

In 2024, the rising number of teachers resigning showed that a crack has appeared in our education system. In one year, 1,193 teachers left the teaching profession, three times as many as in 2023, a situation that calls for decisions to be taken. Of those who resigned, 648 were regular teachers and 545 were on contract. The resignation rate of 6.90 percent in public schools is the highest so far: about 99 teachers resigned every month, the highest number of teacher resignations in the past five years.

In 2020, 163 teachers resigned; in 2021, 353; in 2022, 478; and in 2023, 371. Although the resignation of so many teachers in 2024 is serious, the data tells only part of the story: teachers say they resigned because they were frustrated with a system that does not support their hopes and needs. Why are so many of our teachers leaving? It is because of heavy workloads and a lack of recognition, which keep their standard of living from improving.

Transfers to rural places are also making the situation worse. Teachers often have to teach, counsel and carry many administrative responsibilities at short notice, so they face difficulties at work and receive little respect. In rural areas, poor infrastructure and having to live far away from their families make these difficulties even greater. At the same time, with chances of earning a better income in other sectors or abroad, teaching is not seen as a good choice.

The shortage of teachers in schools is increasing the number of students in each class and lowering the quality of education. The shortage is especially severe in rural areas, so there is a risk of a wide gap in the education students receive.

For the teachers who remain, the workload is likely to increase, which could weaken the foundation of the education system and, over time, harm the social and economic development of the nation. To change the system, bold reforms are needed, and teachers' salaries must be made competitive, since teachers carry a great responsibility in building the nation's future. Teachers transferred to rural areas should be given incentives such as housing allowances, shorter postings and better infrastructure, and employment policies should be reviewed to give opportunities for promotion and professional growth. Above all, professional development should be a priority: regular training, workshops and the use of modern teaching tools would make teachers more capable and bring them satisfaction in their work."""

TRANSLATION_2 = """འབྲུག་གི་གྲོང་སྡེ་ཚུ་ནང་ གད་སྙིགས་ལེན་སྟངས་ཀྱི་དཀའ་ངལ།

༉ ལོ་ཤས་ཀྱི་རིང་ལུ་ འབྲུག་གི་གྲོང་སྡེ་ཚུ་ནང་ མི་རློབས་ཡར་འཕར་འགྱོ་མི་དང་གཅིག་ཁར་ གད་སྙིགས་ཀྱི་གྱངས་ཁ་ཡང་ ལོ་བསྟར་དུ་ ཡར་སེང་འགྱོ་དོ་ཡོདཔ་ཨིན། ཐིམ་ཕུ་ཁྲོམ་རྐྱངམ་གཅིག་ནང་ ཉིན་རེ་ལུ་ གད་སྙིགས་ མེ་ཊིཀ་ཊཱན་ ༥༠ ལས་ལྷག་སྟེ་ བཏོན་དོ་ཡོདཔ་ཨིན་མས། གད་སྙིགས་དེ་ཚུ་ ལེགས་ཤོམ་སྦེ་ ལེན་ནི་མེད་པ་ཅིན་ ཆུ་དང་རླུང་ བཙོག་པ་བཟོ་ནི་མ་ཚད་ མི་ཚུ་གི་འཕྲོད་བསྟེན་ལུ་ཡང་ གནོད་ཉེན་འབྱུང་ནི་ཨིན།

གད་སྙིགས་ཀྱི་དཀའ་ངལ་འདི་ གཞུང་རྐྱངམ་གཅིག་གིས་ སེལ་མི་ཚུགས། ཁྱིམ་ཚང་རེ་རེ་གིས་ གད་སྙིགས་ཚུ་ རུལ་ཚུགས་མི་དང་ རུལ་མི་ཚུགས་མི་ སོ་སོ་སྦེ་ ཕྱེ་དགོཔ་ཨིན། ཕྱིར་ལོག་ལག་ལེན་འཐབ་ཚུགས་པའི་ ཅ་ལ་ཚུ་ བསྡུ་ལེན་འབད་དེ་ ཚོང་ནི་དང་ རུལ་ཚུགས་པའི་ གད་སྙིགས་ཚུ་ལས་ ལུད་བཟོ་ཚུགས། སློབ་གྲྭ་དང་ གཞོན་ནུའི་སྡེ་ཚན་ཚུ་གིས་ཡང་ གཙང་སྦྲ་གི་ལས་འགུལ་ཚུ་ འགོ་འདྲེན་འབད་དེ་ མི་མང་ལུ་ ཤེས་ཚོར་བྱིན་ཚུགས།

གལ་སྲིད་ ང་བཅས་ར་ མི་ངོ་རེ་རེ་གིས་ འགན་ཁུར་འབག་པ་ཅིན་ ང་བཅས་རའི་ རྒྱལ་ཁབ་འདི་ ཉམས་དགའ་ དེ་ལས་ གཙང་སྦྲ་ཅན་ཅིག་སྦེ་ ཤུལ་མའི་མི་རབས་ཚུ་ལུ་ སྤྲོད་ཚུགས།"""

TRANSLATION_2_MODEL = """The problem of waste management in Bhutan's towns

Over the past few years, as the population of Bhutan's towns has grown, the amount of waste has also been increasing every year. In Thimphu city alone, more than 50 metric tonnes of waste are produced every day. If this waste is not managed properly, it will not only pollute the water and air but also harm people's health.

The problem of waste cannot be solved by the government alone. Every household must separate its waste into biodegradable and non-biodegradable waste. Items that can be reused or recycled can be collected and sold, and manure can be made from biodegradable waste. Schools and youth groups can also lead cleanliness campaigns and raise awareness among the public.

If each one of us takes responsibility, we can hand over our country to future generations as a beautiful and clean place."""

COMP_PASSAGE_2 = """Read the passage below and then answer the question that follows.

The Return of the Village Bazaar

Every Sunday morning, the small bazaar in our gewog comes back to life. Farmers arrive before sunrise with baskets of chillies, cheese, eggs, beans and leafy greens. For most of the week the sheds stand empty, but on Sunday they are full of colour and noise. A few years ago, many people thought the village bazaar would disappear. Young people had moved to towns, roads made it easy to drive to the big shops in the Dzongkhag headquarters, and imported vegetables from across the border were often cheaper than our own.

Something changed during the pandemic. When travel was restricted, families discovered how much they depended on food grown by their neighbours. Farmers who had stopped selling began to bring their produce again, and customers who had always bought imported vegetables found that local ones tasted better and stayed fresh longer. Some young people who had lost their jobs in town returned home and started small farms, using greenhouses and drip irrigation they had learnt about on social media.

Today the bazaar is more than a market. Old friends meet over a cup of suja, children help their parents with the scales, and elderly farmers share advice with young ones about seeds and the weather. Money spent here stays in the village. Still, the bazaar faces problems. Prices fall sharply when everyone brings the same vegetables at the same time, and much of the produce is wasted because there is no cold storage. Some farmers complain that wild animals destroy their crops before harvest.

The future of the bazaar depends on whether farmers can plan together, grow a wider variety of crops and find ways to store and process what they cannot sell. If they can, the Sunday bazaar may become not only a place to buy food but a symbol of a self-reliant community."""

def cp2(key, pos, stem, kp, model, marks=5):
    return dict(key=key, parent=f"S3{'ABCD'[pos - 1]}", kind="new_scenario", type=C, marks=marks, topic="Comprehension",
                group="me-dzongkha-2-2025b1-s3-cp2", pos=pos, stem=stem, key_points=kp, model=model)

Q = [
# ---------------------------------------------------------------- Section I, real essays
dict(key="E1", real=True, type=E, marks=25, topic="Essay: education and national development", stem="""Write an essay of about 300-350 words on the following topic.

The colleges under the Royal University of Bhutan offer courses in diverse fields such as engineering, sciences, arts, Bhutanese language and literature, and social sciences.

Discuss how these courses can prepare graduates to meaningfully contribute to the development of Gelephu Mindfulness City in the future. (25 marks)""",
     key_points=[("Introduction: what Gelephu Mindfulness City (GMC) is and why it needs skilled Bhutanese graduates", 3),
                 ("Engineering and sciences: infrastructure, green energy, technology and sustainable building", 5),
                 ("Arts, Bhutanese language and literature: culture, identity, mindfulness and tourism in the city", 5),
                 ("Social sciences: planning, governance, economics, social services and community wellbeing", 5),
                 ("What graduates themselves must add: values, entrepreneurship, lifelong learning, discipline", 4),
                 ("Conclusion that links the courses back to the vision of GMC", 3)],
     model="""Graduates of the Royal University: builders of Gelephu Mindfulness City

Gelephu Mindfulness City (GMC), announced by His Majesty The King on National Day in 2023, is meant to become a green, mindful and economically vibrant city that creates opportunities for young Bhutanese. A city of this scale cannot be built by foreign investors and experts alone. Its success depends on Bhutanese graduates, and the colleges of the Royal University of Bhutan already offer the range of courses it needs.

Graduates in engineering and the sciences will be needed first. Civil and electrical engineers can design roads, bridges, buildings and power systems that use clean hydropower and solar energy. Information technology graduates can build the digital systems that run a modern city, from online services to data centres. Science graduates can monitor air, water and forests so that the city grows without harming its rich natural environment.

GMC is meant to be mindful, not just modern. Graduates in Bhutanese language and literature, arts and culture can make sure that our identity is visible in its architecture, festivals and education. They can guide visitors, translate, teach, and create books, films and art that show the values of Gross National Happiness to the world.

Social science graduates have an equally important role. Economists, planners and business graduates can attract investment, run enterprises and manage public finances. Graduates in sociology, psychology and social work can support the families who move to the new city with counselling, health and community services.

However, a degree alone is not enough. Graduates must bring integrity, discipline and a willingness to keep learning new skills, especially in technology and foreign languages. They should be ready to start their own enterprises instead of waiting only for government jobs.

In conclusion, the courses offered by our colleges give graduates the knowledge GMC needs. If they combine that knowledge with strong values and hard work, our graduates can turn the vision of a mindful city into reality and build a better future for the nation."""),
dict(key="E2", real=True, type=E, marks=25, topic="Essay: technology and society", stem="""Write an essay of about 300-350 words on the following topic.

According to the Bhutan Media Foundation, Bhutanese spend an average of 163 minutes online each day, which is higher than the global average of 145 minutes per day. Intensive social media users include Generation Z (ages 13-29), Millennials (ages 30-44), university graduates, and employed citizens, each spending four or more hours daily on these platforms.

Discuss the impact of spending significant time on social media on mental health, time management, and social connections in the era of rapid technological advancement. (25 marks)""",
     key_points=[("Introduction using the figures given (163 minutes against a global 145; heavy users)", 3),
                 ("Mental health: comparison, anxiety, sleep loss, cyberbullying; and the positive side (support, information)", 6),
                 ("Time management: distraction, lost study and work time, procrastination", 5),
                 ("Social connections: staying in touch abroad versus weaker face-to-face relationships at home", 5),
                 ("Balanced suggestions: limits, digital literacy, offline activities, role of families and schools", 3),
                 ("Conclusion", 3)],
     model="""Living online: the cost of 163 minutes a day

According to the Bhutan Media Foundation, Bhutanese spend an average of 163 minutes online every day, more than the global average of 145 minutes. Young people, university graduates and employed citizens often spend four hours or more on social media. In an age of rapid technological change, this habit is shaping our mental health, our use of time and our relationships.

The effect on mental health is mixed. Social media lets people find information, share their talents and look for support. However, scrolling through pictures of other people's perfect lives can make users feel that they are not good enough. Many young people suffer from anxiety, loneliness and loss of sleep because they stay online late into the night, and cyberbullying can cause deep hurt.

Time management also suffers. A quick look at a phone often turns into an hour. Students lose time meant for study, and employees are distracted at work, which lowers productivity. Constant notifications make it difficult to concentrate on one task for long, and people postpone important work.

Social connections are affected in two ways. Social media helps families stay in touch with relatives studying or working in Australia and elsewhere, and it brings people with common interests together. Yet at home, family members often sit together while each looks at a separate screen. Face-to-face conversation, visits to neighbours and community activities are becoming less common.

Technology itself is not the problem; the way we use it is. Each person can set time limits, switch off notifications and keep phones away at meals and before sleep. Schools and parents can teach digital literacy and encourage sports, reading and volunteering.

In conclusion, social media can inform and connect us, but too much of it harms our minds, our time and our relationships. If we use it mindfully, in the spirit of Gross National Happiness, we can enjoy its benefits without losing what matters most."""),
# ---------------------------------------------------------------- Section I, new essays
dict(key="E1s", parent="E1", kind="new_scenario", type=E, marks=25, topic="Essay: education and national development", stem="""Write an essay of about 300-350 words on the following topic.

Every year thousands of young Bhutanese leave the country to study and work abroad, while many sectors at home face a shortage of skilled workers.

Discuss the reasons why young people choose to go abroad and suggest ways in which Bhutan can encourage them to contribute to the nation. (25 marks)""",
     key_points=[("Introduction: the situation and why it matters", 3),
                 ("Reasons: higher income, further studies, limited jobs and career growth at home, peer influence", 6),
                 ("Effects on Bhutan: shortage of skilled workers, ageing villages, but also remittances and new skills", 5),
                 ("Practical suggestions: better pay and careers, GMC and private-sector jobs, diaspora links, returning-skills schemes", 6),
                 ("Conclusion", 3), ("Language and organisation of a well-paragraphed essay", 2)],
     model="""Going abroad: loss or opportunity for Bhutan?

In recent years, thousands of young Bhutanese have left for Australia, Canada and other countries to study and work. At the same time, hospitals, schools and the construction sector at home are short of skilled people. This trend deserves careful thought because the future of the nation depends on its youth.

There are several reasons why young people leave. The most important is income: a few years of work abroad can earn more than many years at home. Some want higher studies and international experience. Others feel that jobs in Bhutan are limited, promotions are slow and the private sector is small. Many are also influenced by friends and relatives who have already gone and share their success on social media.

The effects are both negative and positive. The departure of nurses, teachers and engineers leaves gaps in public services, and villages are left with mostly elderly people. On the other hand, those abroad send money home, which supports families and the economy, and they learn new skills and work habits.

Bhutan can turn this trend into an opportunity. Pay and career paths in key professions should be improved so that staying is a reasonable choice. Projects such as Gelephu Mindfulness City and a growing private sector can create attractive jobs. The government can keep strong links with Bhutanese abroad, invite them to invest and share their skills, and make it easy for returnees to start businesses or rejoin service. Schools can also prepare students for entrepreneurship rather than only for government jobs.

Young people who go abroad do not stop being Bhutanese. With wise policies, their skills, savings and experience can come back home. If we create opportunities and keep them connected to their roots, those who leave today can become the builders of a stronger Bhutan tomorrow."""),
dict(key="E2s", parent="E2", kind="new_scenario", type=E, marks=25, topic="Essay: technology and society", stem="""Write an essay of about 300-350 words on the following topic.

Artificial intelligence tools that can write, translate and answer questions are now freely available on mobile phones.

Discuss how these tools can help and harm students and young workers in Bhutan, and how they should be used responsibly. (25 marks)""",
     key_points=[("Introduction: what AI tools are and how widely they are used", 3),
                 ("Benefits: learning support, translation, faster work, access to information", 7),
                 ("Harms: copying and plagiarism, weaker thinking and writing skills, wrong information, privacy", 7),
                 ("Responsible use: honesty, checking facts, rules in schools and offices, digital literacy", 5),
                 ("Conclusion", 3)],
     model="""Artificial intelligence: a helper, not a replacement

Only a few years ago, artificial intelligence (AI) seemed like science fiction. Today, any Bhutanese student with a mobile phone can ask an AI tool to explain a lesson, translate a paragraph or draft a letter in seconds. These tools bring great opportunities, but they also carry real risks.

AI can be a patient tutor. A student in a remote school who has no one to ask can get an explanation of a difficult mathematics problem or practise English conversation. Young workers can use AI to summarise long reports, prepare presentations and write emails faster, leaving more time for important tasks. Small businesses can use it for advertising and accounts without hiring experts.

However, the same tools can do harm. Some students simply copy AI answers for assignments, which is dishonest and stops them from learning to think and write for themselves. AI tools sometimes give wrong or invented information in a confident way, and users who do not check may spread errors. Sharing personal or official information with these tools can also put privacy and security at risk.

AI should therefore be used responsibly. Students should use it to understand, not to copy, and should always be honest about where help came from. Every answer should be checked against reliable sources. Schools, colleges and offices need clear rules about when AI may be used, and teachers can design tasks that test real understanding. Above all, digital literacy should be taught so that young people understand both the power and the limits of these tools.

In conclusion, AI is like any powerful tool: it can build or destroy depending on how it is used. If young Bhutanese use it with honesty and good judgement, it can help them learn faster and work better, while their own thinking remains their greatest strength."""),
# ---------------------------------------------------------------- Section II, real letters
dict(key="L1", real=True, type=L, marks=20, topic="Letter writing: formal letters", stem="""Write a letter of about 150 words on the following topic.

Your name is Sonam, an educated farmer from Mendrelgang Gewog, Punakha Dzongkhag. As a farmer, you are initiating a new agricultural project in your gewog.

Write a letter to the Dzongkhag Agriculture and Livestock Officer setting out a clear problem statement, well-defined objectives, methods and a comprehensive budget for your new project. (20 marks)""",
     key_points=[("Correct formal format: sender's address, date, receiver's address, subject, salutation, closing and name", 4),
                 ("Clear problem statement", 4), ("Well-defined objectives", 4), ("Methods: how the project will be carried out", 4),
                 ("Budget with items and a total, and a polite request", 4)],
     model="""Sonam
Mendrelgang Gewog
Punakha Dzongkhag

12 March 2025

The Dzongkhag Agriculture and Livestock Officer
Punakha Dzongkhag Administration
Punakha

Subject: Proposal for a community vegetable greenhouse project in Mendrelgang

Sir/Madam,

I am an educated farmer from Mendrelgang Gewog and I would like to submit a proposal for a new agricultural project.

Problem: Farmers in our gewog grow vegetables only in summer. In winter, vegetables are brought from outside at high prices, and many of our young people remain without work.

Objectives: (1) to grow vegetables throughout the year; (2) to reduce dependence on imported vegetables; (3) to create jobs for ten young people.

Methods: We will form a group of ten farmers, build five greenhouses with drip irrigation, use organic manure and sell the produce at the Punakha and Wangdue markets.

Budget: greenhouses Nu. 250,000; drip irrigation Nu. 60,000; seeds and manure Nu. 40,000; training Nu. 30,000. Total Nu. 380,000. Our group will contribute labour and Nu. 50,000.

I request your office to support us with technical guidance and funding. I look forward to your kind consideration.

Yours faithfully,
Sonam"""),
dict(key="L2", real=True, type=L, marks=20, topic="Letter writing: formal letters", stem="""Write a letter of about 150 words on the following topic.

You are Dorji, the student counsellor of the College of Science and Technology, Phuntsholing, Chukha. Your college is organizing a symposium on "Buddhism in the 21st Century" during winter vacation.

Write a letter to the President of your college requesting permission to participate. In your letter, explain why you are interested in organizing this event, and explain its importance to the students and college, and how it can benefit the society. (20 marks)""",
     key_points=[("Correct formal format: addresses, date, subject, salutation, closing and name", 4),
                 ("Clear request for permission", 3), ("Why the writer is interested in organising the event", 4),
                 ("Importance to the students and the college", 5), ("Benefit to society", 4)],
     model="""Dorji
Student Counsellor
College of Science and Technology
Phuntsholing, Chukha

2 December 2025

The President
College of Science and Technology
Phuntsholing, Chukha

Subject: Request for permission to take part in organising the symposium on "Buddhism in the 21st Century"

Respected Sir/Madam,

I would like to request your kind permission to participate in organising the college symposium on "Buddhism in the 21st Century" during the winter vacation.

As the student counsellor, I meet many students who face stress, anxiety and confusion about their future. Buddhist teachings on mindfulness, compassion and the nature of the mind offer practical ways to handle these problems, so I am keen to help bring them to our students.

The symposium will help students see that science and Buddhism can complement each other, build their values and confidence, and show that our college cares for the wellbeing of its students as well as their academic results.

It will also benefit society, because graduates who are mindful and ethical will become better engineers, leaders and citizens, and the event will promote our culture and Gross National Happiness.

I hope you will kindly grant me permission.

Yours faithfully,
Dorji"""),
# ---------------------------------------------------------------- Section II, new letters
dict(key="L1s", parent="L1", kind="new_scenario", type=L, marks=20, topic="Letter writing: formal letters", stem="""Write a letter of about 150 words on the following topic.

Your name is Pema, a youth from Khaling Gewog, Trashigang Dzongkhag. You want to start a small dairy processing unit that makes cheese and butter with other young people of your village.

Write a letter to the Manager of the Bhutan Development Bank, Trashigang branch, applying for a loan. Mention the problem your project will solve, its objectives, how it will work, and the budget. (20 marks)""",
     key_points=[("Correct formal format: addresses, date, subject, salutation, closing and name", 4),
                 ("Clear problem statement", 4), ("Objectives", 4), ("How the project will work", 4),
                 ("Budget with a total and the amount of loan requested", 4)],
     model="""Pema
Khaling Gewog
Trashigang Dzongkhag

5 April 2025

The Manager
Bhutan Development Bank Limited
Trashigang Branch
Trashigang

Subject: Application for a loan to start a dairy processing unit

Sir/Madam,

I am a youth from Khaling Gewog and I am writing to apply for a loan to start a small dairy processing unit with four other young people of my village.

Problem: Farmers in our village produce plenty of milk, but much of it is wasted or sold cheaply because there is no place to process it, and many young people here are unemployed.

Objectives: to process local milk into cheese and butter, to give farmers a fair price, and to create jobs for five young people.

Plan: We will collect milk from 30 households every morning, process it in a small rented building and sell our products in Trashigang and Samdrup Jongkhar.

Budget: equipment Nu. 300,000; building repairs Nu. 80,000; packaging Nu. 40,000; working capital Nu. 80,000. Total Nu. 500,000. We will contribute Nu. 100,000 and request a loan of Nu. 400,000.

I kindly request you to consider our application.

Yours faithfully,
Pema"""),
dict(key="L2s", parent="L2", kind="new_scenario", type=L, marks=20, topic="Letter writing: formal letters", stem="""Write a letter of about 150 words on the following topic.

You are Karma, the president of the Nature Club of a higher secondary school in Bumthang. Your club wants to organise a clean-up campaign and tree-planting day along the river near your school.

Write a letter to the Principal of your school requesting permission to organise the event. Explain why the club wants to organise it, its importance to the students and the school, and how it can benefit the community. (20 marks)""",
     key_points=[("Correct formal format: addresses, date, subject, salutation, closing and name", 4),
                 ("Clear request for permission (with date and plan)", 3), ("Why the club wants to organise the event", 4),
                 ("Importance to the students and the school", 5), ("Benefit to the community", 4)],
     model="""Karma
President, Nature Club
Chumey Higher Secondary School
Bumthang

10 May 2025

The Principal
Chumey Higher Secondary School
Bumthang

Subject: Request for permission to organise a river clean-up and tree-planting day

Respected Sir/Madam,

On behalf of the Nature Club, I request your kind permission to organise a clean-up campaign and tree-planting day along the river near our school on Saturday, 7 June, which is World Environment Day week.

Our club members have noticed plastic bottles, wrappers and other waste along the river bank, and some parts of the bank are losing soil because there are few trees. We want to take action instead of only talking about the problem.

The event will teach students responsibility and teamwork, give them practical experience of caring for nature, and show that our school takes its role in protecting the environment seriously.

The community will benefit from a cleaner river, safer drinking water downstream and stronger river banks. We also hope to inspire villagers to join us.

We will arrange gloves, bags and saplings with help from the Dzongkhag forestry office. I hope you will kindly grant us permission.

Yours faithfully,
Karma"""),
# ---------------------------------------------------------------- Section III, real comprehension (one passage, questions A-D)
dict(key="S3A", real=True, type=C, marks=5, topic="Comprehension", group="me-dzongkha-2-2025b1-s3-cp", pos=1, stem="""Read the passage below and then answer the questions that follow.

The Future of the Buddhadharma: Dzongsar Khyentse Rinpoche

Whenever we are talking about the future of Buddhism, I think we need to talk about a few things. One - I have been trying to get the right word, and the best I can come up with is 'hillbilly Buddhist'. By this, I am talking about people who don't even know the Four Noble Truths, though they kind of know who the Buddha is. They may not know where the Buddha came from, but they are Buddhist by birth, culturally Buddhist, born in a Buddhist place; they are not intellectual. We have been paying attention to academics, and there is a lot of activity on science and Buddhism, psychology and Buddhism, Buddhist institutes, Buddhist scholarships. But I think those hillbilly Buddhists are so important because where do you get cream if you don't have milk? They are the milk.

Connected to hillbilly Buddhists, we need to be aware of geopolitics. Of course, ours is not a political organization, of course not, but politics are part of our life. The water you drink, the food you eat, will always have some sort of political aspect; it's something that you cannot avoid. And geopolitics is very big, and it's getting more astute, more pronounced, sharper. And it's just going to get - 'worse' is maybe not the right word - it's just going to get quicker and whatever...

And religion plays an important role because, as I have been saying recently, identity crisis is on the rise, and it's just going to rise more and more. We now know why the Heart Sutra is so important, because here, actually, Buddha is saying there is no identity - if only people can get that. Identity crisis is going to be really, really strong. And religion always fuels that identity crisis. Politicians will use it. Nations will use this. Yes, I rejoice that the United States government recognized Buddha Jayanti recently. I rejoice in this very much, but the intention of the United States government may not necessarily be to propagate the Buddha dharma. But that is fine. I think the stakeholders need to know that, and if we can reap profit and not become the tool of politics, I think we should. Whatever profit - geographical profit, space profit, money profit, influence profit - we should.

And then also, when we talk about the future of Buddhism, I think demography and population demographics are all related. Just the other day I was going to Bloomingdale's. Right outside there were so many Sherpas, so many Nepali - like food delivery workers - I was thinking, 'Wow!' It can have a positive effect too. For instance, Buddhism in Australia: the first-ever influence of Buddhism was brought by Chinese. The Chinese people brought a Guanyin statue. That's how the religion sort of ends up moving around. Not necessarily always just because a Rinpoche taught, or a Rinpoche set up a dharma center. These are important - these hillbilly Buddhists are so important.

But, for instance, as a Bhutanese, I am thinking that a lot of Bhutanese have moved to Australia and Canada. We are talking about 100,000. And they are all educated Bhutanese. And they are sort of hillbilly Buddhists. And they are going to have their children, and most of them may never go back to Bhutan. And their children are going to be exposed to a different culture - different altogether - a different world. And they may not speak their language, they may not understand Buddha dharma, and they may end up becoming Mormon, whatever - it doesn't matter, this is what happens.

And then connected to that, migration. So basically what I am saying is, when we are talking about the future of Buddhism, I think we should also be aware of how people are migrating and to where. For instance, I am going to New York in a few weeks, and there are a lot of Bhutanese there, a lot of Himalayan people. And they are going to be migrating there, most likely. So, should we, Khyentse Foundation, have Sunday schools there for these people, who probably are there for economic reasons, not because of anything else? And when they go there, I am sure they also have this insecurity of losing their identity, and a big part of this identity, for them, is Buddha dharma. But there is no facility, so should we step in?

And again, very related, Taiwan. Until recently, it was one of the strongest Buddhist-influenced places, but from what I hear, people going to the Buddhist temples, people becoming monks and nuns - the ratio is dwindling. And perhaps because the local Taiwanese Mahayana masters are not really knowing how to package it. So maybe this is where we, Khyentse Foundation - not like going in and as Buddhists - maybe we can assist with this. And so on and so forth.

Question A (5 x 1 = 5 marks)
Write the correct option for each question, for example: 1 (A).

1. The term 'hillbilly Buddhist' primarily refers to
(A) culturally born Buddhists with little formal knowledge.  (B) rural monks and nuns.  (C) Buddhism rejecters.  (D) Buddhist scholars.

2. What role does geopolitics play in the future of Buddhism, as described in the passage?
(A) Geopolitics affects daily life and influences how Buddhism is perceived and practised.  (B) Buddhist leaders always avoid any political involvement.  (C) Geopolitics is irrelevant to Buddhism and its practice.  (D) Buddhism controls all political decisions worldwide.

3. The passage suggests that an 'identity crisis' is rising because
(A) religion often fuels identity conflicts, which politicians can exploit.  (B) the Heart Sutra promotes a strong fixed identity.  (C) Buddhism clearly defines people's identities.  (D) people have lost interest in all religions.

4. Who brought the first influence of Buddhism to Australia according to the passage?
(A) Bhutanese monks  (B) Tibetan Rinpoches  (C) Nepalese Sherpas  (D) Chinese people

5. The speaker shows how Buddhism spreads beyond formal teachings and dharma centres with the example of
(A) Bhutanese monks establishing monasteries abroad.  (B) Chinese people bringing a Guanyin statue to Australia.  (C) Taiwanese masters teaching meditation online.  (D) Nepalese Sherpas opening Buddhist schools.""",
     key_points=[("1 (A)", 1), ("2 (A)", 1), ("3 (A)", 1), ("4 (D)", 1), ("5 (B)", 1)],
     model="""1 (A)  2 (A)  3 (A)  4 (D)  5 (B)

1: hillbilly Buddhists are "Buddhist by birth, culturally Buddhist" who "don't even know the Four Noble Truths".
2: "politics are part of our life... the water you drink, the food you eat, will always have some sort of political aspect".
3: "religion always fuels that identity crisis. Politicians will use it."
4: "the first-ever influence of Buddhism was brought by Chinese".
5: "The Chinese people brought a Guanyin statue. That's how the religion sort of ends up moving around.\""""),
dict(key="S3B", real=True, type=C, marks=5, topic="Comprehension", group="me-dzongkha-2-2025b1-s3-cp", pos=2, stem="""How does geopolitics influence the practice and future of Buddhism according to the speaker? Explain with reference to identity crisis and political intentions. (5 marks)""",
     key_points=[("Politics is part of daily life and cannot be avoided; geopolitics is growing sharper and faster", 2),
                 ("Identity crisis is rising and religion fuels it; politicians and nations use religion", 2),
                 ("Governments may support Buddhism (US and Buddha Jayanti) for their own intentions; Buddhists should benefit without becoming a tool of politics", 1)],
     model="""According to the speaker, Buddhism cannot stay away from geopolitics, because politics is part of everyday life: even the water we drink and the food we eat have a political side, and geopolitics is becoming sharper and faster.

He links this to a growing identity crisis. People are increasingly anxious about who they are, and religion "always fuels that identity crisis", so politicians and nations will use religion for their own purposes. This is why he finds the Heart Sutra's teaching that there is no fixed identity so important.

He gives the example of the United States government recognising Buddha Jayanti. He welcomes it, but warns that its intention may not be to spread the dharma. Buddhists should be aware of such intentions, accept whatever benefit (money, space, influence) they can gain, but never become a tool of politics."""),
dict(key="S3C", real=True, type=C, marks=5, topic="Comprehension", group="me-dzongkha-2-2025b1-s3-cp", pos=3, stem="""Explain the speaker's concern about Bhutanese people migrating to countries like Australia and other countries. How might this affect the future of Buddhism and Bhutanese culture? (5 marks)""",
     key_points=[("About 100,000 educated Bhutanese have moved to Australia and Canada; most may never return", 1),
                 ("Their children grow up in a different culture and may lose the language and the dharma, or change religion", 2),
                 ("Effect: fewer people carrying Buddhism and Bhutanese culture forward; loss of identity; need for support such as Sunday schools (own view)", 2)],
     model="""The speaker is concerned that about 100,000 educated Bhutanese have moved to Australia and Canada, and that most of them may never return. They are "hillbilly Buddhists", Buddhist by culture rather than by study.

His main worry is about their children. Growing up in a completely different culture, the children may not speak Dzongkha or their parents' language, may not understand the Buddha dharma and may even adopt another religion.

This could weaken the future of Buddhism, because the ordinary cultural Buddhists he calls "the milk" are the base from which the religion grows. It could also weaken Bhutanese culture and identity, as language, customs and values are not passed on. In my view, this is why he asks whether organisations like the Khyentse Foundation should start Sunday schools abroad, and why families and Bhutanese communities abroad should keep teaching their children their language and faith."""),
dict(key="S3D", real=True, type=C, marks=5, topic="Comprehension", group="me-dzongkha-2-2025b1-s3-cp", pos=4, stem="""In what ways can contemporary Buddhism adapt to rapid technological change without compromising its fundamental teachings and cultural traditions? Support your answer with ideas from the passage and your own views. (5 marks)""",
     key_points=[("From the passage: the teaching must be 'packaged' well (Taiwan example) and reach ordinary and migrant Buddhists (e.g. Sunday schools)", 2),
                 ("Own views: online teachings, apps, videos and social media in simple language and local languages", 2),
                 ("Keep the core: authentic teachers, practice and ethics, culture and language preserved", 1)],
     model="""The passage suggests that Buddhism declines when it is not presented in a way people can relate to: in Taiwan, temple attendance is dwindling perhaps because masters do not know "how to package it". The speaker also wants to reach ordinary and migrant Buddhists, for example through Sunday schools abroad.

Technology can help with both. Teachings can be shared through online classes, short videos, podcasts and mobile apps in simple English and in Dzongkha, so that young people and Bhutanese living abroad can learn wherever they are. Meditation apps and social media can show how mindfulness and compassion help with stress and modern life.

However, the core must not change. Teachings should come from qualified teachers, practice and ethics should matter more than popularity, and rituals, language and festivals should be preserved. Technology should be the vehicle, not the message."""),
# ---------------------------------------------------------------- Section III, new comprehension (one passage, questions A-D)
cp2("S3As", 1, COMP_PASSAGE_2 + """

Question A (5 x 1 = 5 marks)
Write the correct option for each question, for example: 1 (A).

1. Why did many people think the village bazaar would disappear?
(A) The gewog closed the bazaar.  (B) Young people moved away, shops in town were easy to reach and imports were cheap.  (C) Farmers stopped growing vegetables.  (D) The bazaar was moved to the Dzongkhag headquarters.

2. According to the passage, what did customers discover during the pandemic?
(A) Imported vegetables were safer.  (B) Local vegetables were more expensive and less fresh.  (C) Local vegetables tasted better and stayed fresh longer.  (D) Supermarkets were cheaper than the bazaar.

3. Which of these is NOT given as a problem the bazaar faces?
(A) Prices fall when everyone sells the same vegetables.  (B) Produce is wasted for lack of cold storage.  (C) Wild animals destroy crops.  (D) Customers refuse to pay in cash.

4. The phrase "Money spent here stays in the village" means that
(A) the bazaar does not accept money from outsiders.  (B) spending at the bazaar supports local farmers and families.  (C) villagers save all their money.  (D) prices are fixed by the gewog.

5. The writer suggests that the bazaar could become a symbol of
(A) modern shopping.  (B) foreign trade.  (C) a self-reliant community.  (D) government support.""",
    [("1 (B)", 1), ("2 (C)", 1), ("3 (D)", 1), ("4 (B)", 1), ("5 (C)", 1)],
    """1 (B)  2 (C)  3 (D)  4 (B)  5 (C)

1: young people moved to towns, roads made the big shops easy to reach, and imports were cheaper.
2: local vegetables "tasted better and stayed fresh longer".
3: falling prices, no cold storage and wild animals are all mentioned; refusing to pay in cash is not.
4: the money goes to local farmers and stays in the local economy.
5: "a symbol of a self-reliant community"."""),
cp2("S3Bs", 2, """How did the pandemic change the village bazaar, according to the passage? (5 marks)""",
    [("Families realised how much they depended on food from neighbours when travel was restricted", 2),
     ("Farmers began selling again and customers preferred local vegetables", 2),
     ("Some young people returned and started small farms using new methods", 1)],
    """When travel was restricted during the pandemic, families realised how much they depended on food grown by their neighbours. Farmers who had stopped selling started bringing their produce to the bazaar again, and customers who used to buy imported vegetables found that local ones tasted better and stayed fresh longer. Some young people who had lost their jobs in town returned home and started small farms, using greenhouses and drip irrigation that they had learnt about on social media. As a result, the bazaar that many expected to disappear came back to life."""),
cp2("S3Cs", 3, """Explain why the writer says that "the bazaar is more than a market". (5 marks)""",
    [("It is a social meeting place: friends meet over suja", 2),
     ("It passes knowledge between generations: elders advise the young; children help parents", 2),
     ("It supports the local economy: money stays in the village", 1)],
    """The writer means that the bazaar does much more than allow people to buy and sell food. It is a social meeting place where old friends meet and talk over a cup of suja, which keeps the community close. It is also a place of learning between generations: children help their parents with the scales, and elderly farmers share their knowledge of seeds and weather with young farmers. Finally, it supports the local economy, because the money spent there stays in the village instead of going to shops elsewhere or across the border."""),
cp2("S3Ds", 4, """Suggest ways in which farmers and the community can solve the problems faced by the bazaar. Support your answer with ideas from the passage and your own views. (5 marks)""",
    [("Plan together and grow a wider variety of crops so that prices do not fall (from the passage)", 2),
     ("Storage and processing: cold storage, drying, pickles, cheese; sell to schools and institutions (own views)", 2),
     ("Protect crops from wild animals, e.g. electric fencing, with support from the gewog", 1)],
    """First, as the passage suggests, farmers should plan together through a cooperative or farmers' group, deciding who grows what and when, so that the bazaar is not flooded with the same vegetables and prices stay fair. Growing a wider variety of crops, including off-season vegetables in greenhouses, would also help.

Second, the community could ask the gewog and agriculture office for a small cold store and learn to process surplus produce into dried chillies, pickles, cheese and other products that keep longer. Farmers could also sell regularly to schools, hospitals and hotels.

Third, to stop wild animals destroying crops, farmers can use electric fencing and guard their fields together, with support from the gewog. With these steps the bazaar can become stronger and more reliable."""),
# ---------------------------------------------------------------- Section IV, translation
dict(key="T1", real=True, type=T, marks=25, topic="Translation: Dzongkha to English", issues=[PDF_ISSUE, DZ_ISSUE], stem="""Read the following passage carefully and translate it into English. (25 marks)

""" + TRANSLATION_1,
     key_points=[("Accuracy: the meaning of every sentence is kept, with no additions or omissions", 10),
                 ("Completeness: all paragraphs and all figures (years, numbers, percentages) translated correctly", 6),
                 ("Clarity and natural English expression", 5),
                 ("Correct spelling, grammar and punctuation", 4)],
     model=TRANSLATION_1_MODEL),
dict(key="T1s", parent="T1", kind="new_scenario", type=T, marks=25, topic="Translation: Dzongkha to English", issues=[DZ_ISSUE], stem="""Read the following passage carefully and translate it into English. (25 marks)

""" + TRANSLATION_2,
     key_points=[("Accuracy: the meaning of every sentence is kept, with no additions or omissions", 10),
                 ("Completeness: all paragraphs and figures translated correctly", 6),
                 ("Clarity and natural English expression", 5),
                 ("Correct spelling, grammar and punctuation", 4)],
     model=TRANSLATION_2_MODEL),
# ---------------------------------------------------------------- Section V, real current-affairs MCQs (Q3, Q4, Q5, Q6, Q8 left out)
dict(key="V1", real=True, type=M, topic="Current affairs: Bhutan", stem="What is the budget allocation for the 13th Five Year Plan in Bhutan?",
     opts=["Nu. 500 billion", "Nu. 456 billion", "Nu. 400 billion", "Nu. 512.283 billion"], ans=3,
     exp="The 13th Five Year Plan (2024-2029) has an outlay of Nu. 512.283 billion."),
dict(key="V2", real=True, type=M, topic="Current affairs: Bhutan", stem="Who became the first Bhutanese in over sixty years to receive the Ramon Magsaysay Award in 2024 for \"his invaluable and enduring contributions towards harmonizing the richness of Bhutan's past with the diverse challenges and opportunities of its present, and for inspiring young Bhutanese to be proud of their identity while embracing the future\"?",
     opts=["Dasho Karma Ura", "Dr. Lotay Tshering", "Dr. Karma Phuntsho", "Dr. Dorji Wangchuk"], ans=2,
     exp="Historian Dr. Karma Phuntsho of the Loden Foundation received the 2024 Ramon Magsaysay Award."),
dict(key="V7", real=True, type=M, topic="Current affairs: Bhutan", stem="According to His Majesty, what values form the foundation of the Gyalsung National Service?",
     opts=["Wealth, power, and influence", "Strength, intelligence, and competitiveness", "Economic growth and technological innovation", "Courage, resilience, humility, and righteousness"], ans=3,
     exp="Gyalsung is built on values such as courage, resilience, humility and righteousness."),
dict(key="V9", real=True, type=M, topic="Current affairs: world", stem="Which company announced the launch of its first mass-market AR smart glasses, named \"Specs\", scheduled for 2026?",
     opts=["Google", "Apple", "Meta", "Snap"], ans=3,
     exp="Snap Inc. announced consumer AR glasses called Specs for 2026."),
dict(key="V10", real=True, type=M, topic="Current affairs: culture", stem="When was Zhungdra (traditional Bhutanese folk music) first performed to commemorate the victories over the Tibetans and as a gesture of appreciation to the protective deities Yeshey Gonpo and Pelden Lhamo?",
     opts=["17th century", "18th century", "19th century", "20th century"], ans=0,
     exp="Zhungdra dates from the 17th century, the time of Zhabdrung Ngawang Namgyal and the victories over Tibetan invasions."),
# ---------------------------------------------------------------- Section V, new current-affairs MCQs (stable facts)
dict(key="V11", new=True, type=M, topic="Current affairs: Bhutan", stem="In which year did Bhutan graduate from the United Nations list of Least Developed Countries (LDCs)?",
     opts=["2019", "2021", "2023", "2025"], ans=2, exp="Bhutan graduated from the LDC category on 13 December 2023."),
dict(key="V12", new=True, type=M, topic="Current affairs: Bhutan", stem="Gelephu Mindfulness City was first announced by His Majesty The King on:",
     opts=["17 December 2023, National Day", "21 June 2023, International Day of Yoga", "11 November 2022, His Majesty the Fourth King's birthday", "2 June 2024, Coronation Day"], ans=0,
     exp="His Majesty announced the Gelephu Mindfulness City in the National Day address on 17 December 2023."),
dict(key="V13", new=True, type=M, topic="Current affairs: Bhutan", stem="Which political party formed the government after the National Assembly elections of January 2024?",
     opts=["Druk Nyamrup Tshogpa", "People's Democratic Party", "Druk Phuensum Tshogpa", "Bhutan Tendrel Party"], ans=1,
     exp="The People's Democratic Party won 30 of 47 seats; Bhutan Tendrel Party became the opposition."),
dict(key="V14", new=True, type=M, topic="Current affairs: Bhutan", stem="Who became the Prime Minister of Bhutan in January 2024?",
     opts=["Dr. Lotay Tshering", "Dasho Tshering Tobgay", "Lyonchhen Jigmi Y. Thinley", "Pema Chewang"], ans=1,
     exp="Dasho Tshering Tobgay of the People's Democratic Party became Prime Minister for the second time in January 2024."),
dict(key="V15", new=True, type=M, topic="Current affairs: Bhutan", stem="Bhutan's first utility-scale solar power plant, commissioned recently, is located in:",
     opts=["Sephu, Wangdue Phodrang", "Gelephu, Sarpang", "Phuentsholing, Chhukha", "Jakar, Bumthang"], ans=0,
     exp="The 17.38 MW Sephu Solar Project is in Wangdue Phodrang."),
dict(key="V16", new=True, type=M, topic="Current affairs: Bhutan", stem="Gelephu Mindfulness City is being developed in which Dzongkhag?",
     opts=["Samtse", "Sarpang", "Samdrup Jongkhar", "Zhemgang"], ans=1, exp="Gelephu is in Sarpang Dzongkhag, on the southern border."),
dict(key="V17", new=True, type=M, topic="Current affairs: Bhutan", stem="The Constitution of Bhutan requires the country to maintain at least what share of its total land under forest cover for all time?",
     opts=["50 percent", "60 percent", "70 percent", "72 percent"], ans=1,
     exp="Article 5 of the Constitution requires a minimum of 60 percent of land under forest cover for all time."),
dict(key="V18", new=True, type=M, topic="Current affairs: Bhutan", stem="The 13th Five Year Plan of Bhutan covers the period:",
     opts=["2023-2028", "2024-2029", "2025-2030", "2019-2024"], ans=1, exp="The 13th Five Year Plan runs from July 2024 to June 2029."),
dict(key="V19", new=True, type=M, topic="Current affairs: Bhutan", stem="The National Day of Bhutan, celebrated on 17 December, commemorates:",
     opts=["the signing of the Constitution", "the coronation of the first King, Gongsar Ugyen Wangchuck, in 1907", "the founding of the Dratshang", "the first democratic elections"], ans=1,
     exp="National Day marks the enthronement of Gongsar Ugyen Wangchuck as the first King on 17 December 1907."),
dict(key="V20", new=True, type=M, topic="Current affairs: Bhutan", stem="The first full batch of young Bhutanese began Gyalsung National Service training in:",
     opts=["2022", "2023", "2024", "2026"], ans=2, exp="The first Gyalsung batch began training in September 2024."),
]
