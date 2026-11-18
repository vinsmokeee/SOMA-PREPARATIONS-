# New PE Dzongkha practice questions, batch 1 (written by Claude, 18 Nov 2026).
# Sources (used as reference only; nothing copied beyond single words and meanings):
#  - Dzongkha–English Dictionary, 2nd ed., Dzongkha Development Commission 2013 ("dict. p." = printed page;
#    honorific = HON mark, opposite = OPP mark in the dictionary, checked on the page images).
#  - Karma Tshering & G. van Driem, The Grammar of Dzongkha (2019): genitive/ergative spelling rules
#    (གྱི/གྱིས after ན ར ལ མ; གི/གིས after ག ང; ཀྱི/ཀྱིས after བ ད ས).
# A fluent Dzongkha speaker must check these before they are published.
DZ = "dzongkha"
NOTE = ('Written by Claude from the DDC Dzongkha–English Dictionary (2013) and The Grammar of Dzongkha (2019); '
        'each answer checked against the book page. A fluent Dzongkha speaker must check the wording before publishing.')
Q = []


def add(topic, diff, stem, opts, ans, exp):
    Q.append(dict(sec=DZ, topic=topic, diff=diff, stem=stem, opts=opts, ans=ans, exp=exp))


# ---- Honorific words (ཞེ་ས) ----
HON = [  # word, honorific, three wrong options, English, printed dictionary page
    ("མགོ", "དབུ", ["ཞབས", "ཕྱག", "ཞལ"], "head", 149),
    ("གདོང", "ཞལ", ["དབུ", "ཞབས", "ཐུགས"], "face", 431),
    ("རྐང་པ", "ཞབས", ["ཕྱག", "དབུ", "ཞལ"], "leg, foot", "ix (guide page)"),
    ("སྐྲ", "དབུ་སྐྲ", ["ཞབས་སྐྲ", "ཕྱག་སྐྲ", "ཞལ་སྐྲ"], "hair", 49),
    ("གོ་ལ", "ན་བཟའ", ["ཕྱག་ཕྲེང", "ཞབས་ལྷམ", "གསོལ་ཇ"], "dress, clothes", 113),
    ("ཇ", "གསོལ་ཇ", ["ཞལ་ཇ", "ཕྱག་ཇ", "སྐུ་ཇ"], "tea", 267),
    ("ཉལ་ཁང", "གཟིམ་ཁང", ["གསོལ་ཁང", "ཕྱག་ཁང", "ཞལ་ཁང"], "bedroom", 287),
    ("ཐབ", "གསོལ་ཐབ", ["གཟིམ་ཐབ", "ཞལ་ཐབ", "ཕྱག་ཐབ"], "kitchen", 354),
    ("ཕ་མ", "ཡབ་ཡུམ", ["སྐུ་ཕ་མ", "ཞལ་ཕ་མ", "ཕྱག་ཕ་མ"], "father and mother, parents", 557),
    ("ཚ་བོ", "སྐུ་ཚ", ["ཞལ་ཚ", "ཕྱག་ཚ", "དབུ་ཚ"], "nephew, grandson", 751),
    ("མི་རབས", "གདུང་རབས", ["སྐུ་རབས", "ཞལ་རབས", "ཕྱག་རབས"], "generation", 681),
    ("མིང་གནས", "མཚན་གནས", ["ཞལ་གནས", "སྐུ་གནས", "ཕྱག་གནས"], "title, name", 688),
    ("ཕྲེང་བ", "ཕྱག་ཕྲེང", ["ཞལ་ཕྲེང", "དབུ་ཕྲེང", "སྐུ་ཕྲེང"], "rosary, string of beads", 587),
    ("ཁ་ཏ", "ཞལ་ཏ", ["ཕྱག་ཏ", "སྐུ་ཏ", "དབུ་ཏ"], "advice", 58),
    ("གཉིད་དཀྲོག", "མནལ་དཀྲོག", ["གཟིམ་དཀྲོག", "ཞལ་དཀྲོག", "སྐུ་དཀྲོག"], "wake (someone) up", 301),
    ("སྟོད་གོ", "སྐུ་སྟོད", ["དབུ་སྟོད", "ཞལ་སྟོད", "ཕྱག་སྟོད"], "jacket, upper garment", 342),
    ("བརྩེ་བ", "ཐུགས་བརྩེ", ["སྐུ་བརྩེ", "ཞལ་བརྩེ", "ཕྱག་བརྩེ"], "love, kindness", 747),
]
for i, (w, h, wrong, en, pg) in enumerate(HON):
    opts = list(wrong)
    pos = i % 4
    opts.insert(pos, h)
    add("Honorific words (ཞེ་ས)", "standard" if i % 3 else "foundation",
        f"{w} ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ག་ཅི་སྨོ?\n\n(Which is the honorific form of “{w}”?)", opts, pos,
        f"“{w}” means {en}; its honorific (ཞེ་ས) is “{h}”. Source: DDC Dzongkha–English Dictionary, p. {pg}.")

# ---- Opposites (འགལ་མིང) ----
OPP = [
    ("མགོ", "མཇུག", ["དབུ", "སྟོད", "མདུན"], "head / tail, end", 149),
    ("སྐམ་ཞིང", "ཆུ་ཞིང", ["སོ་ནམ", "ཞིང་ཁ", "སྐམ་ས"], "dry land / wet (paddy) land", 30),
    ("གླིང་ཆེན", "གླིང་ཕྲན", ["རྒྱལ་ཁབ", "ས་ཁོངས", "མཚོ"], "continent / island", 129),
    ("གྱེན", "ཐུར", ["ཡར", "སྟོད", "མཐོ་ས"], "ascent, uphill / downhill", 118),
    ("ཁེ", "གྱོང", ["ཕན", "ཐོབ", "ཁེ་ཕན"], "profit / loss", 118),
    ("བཅོས་མ", "ངོ་མ", ["རྫུན་མ", "ཟོལ", "བཟོ་བཅོས"], "artificial / genuine", 235),
    ("ཐོབ", "ཤོར", ["ལེན", "འཐོབ", "རྙེད"], "gain / lose", 367),
    ("མཐུན", "འགལ", ["འགྲིག", "མཐུན་འགྱུར", "འཆམ"], "agree / contradict", 374),
    ("སྡིག་པ", "དགེ་བ", ["ཉེས་པ", "ལས", "སྡུག་བསྔལ"], "sin / virtue", 465),
    ("ནང་ལོགས", "ཕྱི་ལོགས", ["ནང་ཁ", "བར་ལོགས", "སྟོད་ལོགས"], "inside / outside", 485),
    ("དཔོན", "གཡོག", ["རྒྱལ་པོ", "བླ་མ", "དྲུང"], "master / servant", 534),
    ("ཕམ", "རྒྱལ", ["ཤོར", "ཉེས", "འཐབ"], "defeat / victory", 563),
    ("བསྔགས་པ", "སྨད་པ", ["བསྟོད་པ", "དགའ་བ", "ཡིད་ཆེས"], "praise / blame", 226),
    ("སྟོད", "སྨད", ["གོང", "ཡར", "མགོ"], "upper part / lower part", 342),
    ("བརྩིག", "བཤིག", ["བཟོ", "བསྐྲུན", "སྤུང"], "build, pile up / demolish", 746),
    ("བརྩོན་འགྲུས", "ལེ་ལོ", ["དཀའ་སྤྱད", "ཤུགས", "སེམས་ཤུགས"], "diligence / laziness", 747),
    ("གཙང་ཏོག་ཏོ", "བཙོག་སི་སི", ["གཙང་མ", "དྭངས་ཏོག་ཏོ", "སྐམ་ཀྲོག་ཀྲོ"], "clean / dirty", 721),
]
for i, (w, o, wrong, en, pg) in enumerate(OPP):
    opts = list(wrong)
    pos = (i + 2) % 4
    opts.insert(pos, o)
    add("Opposites (འགལ་མིང)", "standard" if i % 3 else "foundation",
        f"{w} ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ག་ཅི་སྨོ?\n\n(Which word is the opposite of “{w}”?)", opts, pos,
        f"“{w}” and “{o}” are opposites ({en}). Source: DDC Dzongkha–English Dictionary, p. {pg}.")

# ---- Word meanings ----
MEAN = [
    ("གླིང་ཕྲན", "Island", ["Continent", "Valley", "Lake"], 130),
    ("ཚོགས་ཁང", "Assembly hall", ["Kitchen", "Classroom", "Storeroom"], 767),
    ("མི་རབས", "Generation", ["Population", "Citizen", "Family name"], 681),
    ("ཆུ་ཞིང", "Paddy field (wet land)", ["Dry land", "Riverbank", "Water tank"], 253),
    ("བཅོས་མ", "Artificial", ["Genuine", "Ancient", "Expensive"], 235),
    ("ཕྱི་མི", "Foreigner, outsider", ["Neighbour", "Relative", "Guest of honour"], 578),
    ("བརྩོན་འགྲུས", "Diligence, hard work", ["Patience", "Laziness", "Honesty"], 747),
    ("སྔོན་ཤེས", "Foresight, foreknowledge", ["Memory", "Regret", "Ignorance"], 226),
]
for i, (w, en, wrong, pg) in enumerate(MEAN):
    opts = list(wrong)
    pos = (i + 1) % 4
    opts.insert(pos, en)
    add("Vocabulary", "foundation", f"What does the Dzongkha word “{w}” mean?", opts, pos,
        f"“{w}” means {en.lower()}. Source: DDC Dzongkha–English Dictionary, p. {pg}.")

# ---- Particles: genitive and ergative (ཚིག་ཕྲད) ----
RULE_G = {"གྱི": "after ན, ར, ལ and མ", "གི": "after ག and ང", "ཀྱི": "after བ, ད and ས"}
GEN = [  # first word, rest of phrase, answer, English
    ("རྒྱལ་ཁབ་", "མི་སེར།", "ཀྱི", "citizens of the country"),
    ("ཁྱིམ་", "སྒོ།", "གྱི", "the door of the house"),
    ("འབྲུག་", "ལོ་རྒྱུས།", "གི", "the history of Bhutan"),
    ("ཆོས་", "དཔེ་དེབ།", "ཀྱི", "a religious book (book of dharma)"),
    ("ཡུལ་", "མི་སེར།", "གྱི", "the people of the village"),
    ("གཞུང་", "ལཱ།", "གི", "government work"),
    ("ནགས་ཚལ་", "ཤིང་།", "གྱི", "the trees of the forest"),
    ("དུས་", "ཡུན་ཚད།", "ཀྱི", "the length of time"),
]
for i, (a, b, ans, en) in enumerate(GEN):
    opts = ["གི", "གྱི", "ཀྱི", "འི"]
    last = a.rstrip('་')[-1]
    add("Particles (ཚིག་ཕྲད)", "standard",
        f"སྟོང་ས་ནང་ འབྲེལ་སྒྲ་ཏག་ཏག་ག་ཅི་བཙུགས་དགོཔ་སྨོ?\n\n{a}______་{b}\n\n(Choose the correct genitive particle: “{en}”.)",
        opts, opts.index(ans),
        f"The genitive particle is written {ans} {RULE_G[ans]}. “{a.rstrip('་')}” ends in {last}, so: {a}{ans}་{b} "
        "(rule from The Grammar of Dzongkha, Tshering & van Driem 2019, ch. 4).")

ERG = [
    ("སློབ་དཔོན་", "སློབ་ཕྲུག་ཚུ་ལུ་ སློབ་སྟོན་འབདཝ་ཨིན།", "གྱིས", "The teacher teaches the students."),
    ("ཁོང་", "ཡི་གུ་བྲི་ཡི།", "གིས", "They wrote a letter."),
    ("གཞུང་", "ཁྲིམས་གསརཔ་ཅིག་ བཏོན་ཡི།", "གིས", "The government issued a new law."),
    ("ལས་ཁུངས་", "བརྡ་བསྐུལ་འབད་ཡི།", "ཀྱིས", "The office gave a notice."),
]
RULE_E = {"གྱིས": "after ན, ར, ལ and མ", "གིས": "after ག and ང", "ཀྱིས": "after བ, ད and ས"}
for a, b, ans, en in ERG:
    opts = ["གིས", "གྱིས", "ཀྱིས", "ཡིས"]
    last = a.rstrip('་')[-1]
    add("Particles (ཚིག་ཕྲད)", "standard",
        f"སྟོང་ས་ནང་ བྱེད་སྒྲ་ཏག་ཏག་ག་ཅི་བཙུགས་དགོཔ་སྨོ?\n\n{a}______་{b}\n\n(Choose the correct ergative particle: “{en}”)",
        opts, opts.index(ans),
        f"The ergative particle follows the same spelling rule as the genitive: {ans} {RULE_E[ans]}. "
        f"“{a.rstrip('་')}” ends in {last}, so: {a}{ans}་{b} (The Grammar of Dzongkha, ch. 5).")
