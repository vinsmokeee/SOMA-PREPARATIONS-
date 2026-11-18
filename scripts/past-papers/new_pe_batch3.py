# New PE practice questions, batch 3 (written by Claude, 18 Nov 2026), modelled on the BCSE PE 2010/2011 papers.
# Numeric answers re-computed in check_batch3(); Dzongkha items from the DDC Dzongkha–English Dictionary (2013),
# printed page = PDF page − 13 (HON/OPP marks checked in the dictionary text). Correct answers spread over A–D.
ENG, APT, DI, DZ = "english", "aptitude", "data", "dzongkha"
CW = "Choose the word closest in meaning to the word in capitals.\n\n"
FILL = "Choose the correct word or phrase to complete the sentence.\n\n"


def q(sec, topic, diff, stem, opts, ans, exp):
    return dict(sec=sec, topic=topic, diff=diff, stem=stem, opts=opts, ans=ans, exp=exp)


Q = [
 # ---------------- English (20) ----------------
 q(ENG, "Synonyms", "standard", CW + "The instructions in the circular were AMBIGUOUS.", ["Unclear", "Precise", "Lengthy", "Strict"], 0,
   "Ambiguous means open to more than one meaning; unclear."),
 q(ENG, "Synonyms", "foundation", CW + "Dorji is a DILIGENT officer.", ["Lazy", "Hard-working", "Talkative", "Young"], 1,
   "Diligent means careful and hard-working."),
 q(ENG, "Synonyms", "standard", CW + "It would be PRUDENT to save part of your salary.", ["Foolish", "Costly", "Wise", "Difficult"], 2,
   "Prudent means sensible and careful about the future; wise."),
 q(ENG, "Antonyms", "foundation", "Which word has the opposite meaning of “abundant”?", ["Plentiful", "Ample", "Rich", "Scarce"], 3,
   "Abundant means more than enough; the opposite is scarce."),
 q(ENG, "Antonyms", "foundation", "Which word has the opposite meaning of “optimistic”?", ["Pessimistic", "Hopeful", "Cheerful", "Confident"], 0,
   "Optimistic means expecting good things; pessimistic means expecting bad things."),
 q(ENG, "Antonyms", "foundation", "Which word has the opposite meaning of “permanent”?", ["Lasting", "Temporary", "Stable", "Fixed"], 1,
   "Permanent means lasting for ever; temporary means lasting only a short time."),
 q(ENG, "Grammar", "standard", FILL + "The number of students in the college ______ increasing every year.", ["are", "were", "is", "have been"], 2,
   "“The number of …” is singular, so it takes “is”. (Compare: “A number of students are …”.)"),
 q(ENG, "Grammar", "standard", FILL + "Hardly had he reached the office ______ it started to rain.", ["than", "then", "after", "when"], 3,
   "The fixed pattern is “Hardly … when” (and “No sooner … than”)."),
 q(ENG, "Grammar", "standard", FILL + "She prefers tea ______ coffee.", ["to", "than", "over than", "from"], 0,
   "We say “prefer A to B”, not “prefer A than B”."),
 q(ENG, "Grammar", "standard", FILL + "Neither of the two answers ______ correct.", ["are", "is", "were", "have been"], 1,
   "“Neither of” is followed by a singular verb in formal English: “Neither of the answers is correct.”"),
 q(ENG, "Grammar", "foundation", FILL + "He has lived in Paro ______ ten years.", ["since", "from", "for", "during"], 2,
   "Use “for” with a length of time (ten years) and “since” with a starting point (since 2015)."),
 q(ENG, "Grammar", "foundation", FILL + "If it rains tomorrow, we ______ the match.", ["cancelled", "would cancel", "had cancelled", "will cancel"], 3,
   "A real future possibility uses the first conditional: If + present, will + verb."),
 q(ENG, "Grammar", "foundation", "Choose the correct question tag.\n\nYou are coming to the meeting, ______?", ["aren’t you", "isn’t it", "don’t you", "are you"], 0,
   "A positive statement with “are” takes the negative tag “aren’t you?”."),
 q(ENG, "Grammar", "standard", "Choose the correct passive form of: “They are building a new bridge.”",
   ["A new bridge was built by them.", "A new bridge is being built.", "A new bridge has built.", "A new bridge is building."], 1,
   "Present continuous active (are building) becomes present continuous passive: is being + past participle."),
 q(ENG, "Grammar", "standard", "Choose the correct reported speech of: She asked me, “Where do you live?”",
   ["She asked me where do I live.", "She asked me where did I live.", "She asked me where I lived.", "She asked me where I live?"], 2,
   "In a reported question the word order becomes a statement (I lived), the tense moves back, and there is no question mark."),
 q(ENG, "Vocabulary", "foundation", "What does the idiom “to spill the beans” mean?", ["To waste food", "To make a mess", "To work carelessly", "To reveal a secret"], 3,
   "To spill the beans is to tell something that was meant to be secret."),
 q(ENG, "Vocabulary", "foundation", "What does the idiom “under the weather” mean?", ["Slightly ill", "Very happy", "Out in the rain", "Very busy"], 0,
   "Feeling under the weather means feeling slightly unwell."),
 q(ENG, "Vocabulary", "foundation", "Choose one word for: “a speech given without any preparation”.", ["Eulogy", "Impromptu", "Monologue", "Sermon"], 1,
   "An impromptu speech is made without preparation. A eulogy praises someone who has died."),
 q(ENG, "Vocabulary", "standard", "Which of these four spellings is correct?", ["Embarass", "Embarras", "Embarrass", "Embaras"], 2,
   "Embarrass has a double r and a double s."),
 q(ENG, "Vocabulary", "standard", FILL + "Please keep your ticket safe; don’t ______ it.", ["loose", "loss", "lost", "lose"], 3,
   "“Lose” (verb) means to be unable to find; “loose” (adjective) means not tight."),

 # ---------------- Aptitude (20) ----------------
 q(APT, "Interest", "standard", "A sum earns Nu. 2,000 simple interest in 4 years at 5% per year. What is the sum?", ["Nu. 10,000", "Nu. 8,000", "Nu. 12,000", "Nu. 40,000"], 0,
   "Interest = P × R × T ÷ 100, so P = 2,000 × 100 ÷ (5 × 4) = Nu. 10,000."),
 q(APT, "Percentages", "foundation", "30% of a number is 45. What is the number?", ["135", "150", "160", "175"], 1,
   "Number = 45 ÷ 0.30 = 150."),
 q(APT, "Percentages", "standard", "A price is raised by 20% and then the new price is reduced by 20%. What is the overall change?", ["No change", "4% increase", "4% decrease", "2% decrease"], 2,
   "1.20 × 0.80 = 0.96, so the final price is 4% lower than the start."),
 q(APT, "Profit and loss", "standard", "A trader buys 10 pens for Nu. 100 and sells 8 pens for Nu. 100. What is the profit percentage?", ["20%", "15%", "30%", "25%"], 3,
   "Cost per pen = Nu. 10; selling price per pen = Nu. 12.50. Profit = 2.50 ÷ 10 × 100 = 25%."),
 q(APT, "Speed and distance", "standard", "A bus travels 2 hours at 60 km/h and then 3 hours at 40 km/h. What is its average speed for the whole journey?", ["48 km/h", "50 km/h", "45 km/h", "52 km/h"], 0,
   "Distance = 120 + 120 = 240 km; time = 5 h; average speed = 240 ÷ 5 = 48 km/h (not the average of 60 and 40)."),
 q(APT, "Speed and distance", "standard", "Two vehicles 360 km apart drive towards each other at 50 km/h and 70 km/h. After how long do they meet?", ["2.5 hours", "3 hours", "3.5 hours", "4 hours"], 1,
   "They close the gap at 50 + 70 = 120 km/h; 360 ÷ 120 = 3 hours."),
 q(APT, "Work and time", "standard", "6 workers can build a wall in 12 days. How many days will 8 workers take, working at the same rate?", ["8 days", "10 days", "9 days", "16 days"], 2,
   "Total work = 6 × 12 = 72 worker-days; 72 ÷ 8 = 9 days."),
 q(APT, "Ratio and proportion", "foundation", "The ages of two sisters are in the ratio 4 : 5 and add up to 54 years. How old is the elder sister?", ["24 years", "27 years", "28 years", "30 years"], 3,
   "54 ÷ 9 = 6 per part; the elder has 5 parts = 30 years (the younger 24)."),
 q(APT, "Averages", "standard", "The average of four numbers is 25. A fifth number is added and the average becomes 28. What is the fifth number?", ["40", "28", "35", "45"], 0,
   "Total of four = 100; total of five = 140; the fifth number = 140 − 100 = 40."),
 q(APT, "Number series", "standard", "What number comes next?\n\n3, 8, 15, 24, 35, ?", ["46", "48", "49", "50"], 1,
   "The differences are 5, 7, 9, 11, so the next difference is 13: 35 + 13 = 48 (each term is n² − 1)."),
 q(APT, "Number series", "foundation", "What number comes next?\n\n1, 1, 2, 3, 5, 8, ?", ["11", "12", "13", "15"], 2,
   "Each number is the sum of the two before it: 5 + 8 = 13."),
 q(APT, "Letter series", "standard", "Which letter comes next?\n\nZ, X, U, Q, ?", ["M", "K", "N", "L"], 3,
   "The letters go back by 2, 3, 4, then 5: Z(26), X(24), U(21), Q(17), L(12)."),
 q(APT, "Coding", "foundation", "If TREE is written as USFF, how is BIRD written?", ["CJSE", "CHSE", "AJSE", "CJTE"], 0,
   "Each letter moves one place forward: B→C, I→J, R→S, D→E."),
 q(APT, "Directions", "standard", "Pema walks 6 km east and then 8 km north. How far is she from where she started (in a straight line)?", ["14 km", "10 km", "12 km", "2 km"], 1,
   "The two walks form a right angle: distance = √(6² + 8²) = √100 = 10 km."),
 q(APT, "Ordering and ranking", "standard", "In a class, Karma is 7th from the top and 18th from the bottom. How many students are in the class?", ["25", "23", "24", "26"], 2,
   "Total = 7 + 18 − 1 = 24 (Karma is counted in both)."),
 q(APT, "Time and calendars", "standard", "Today is Wednesday. What day of the week will it be 45 days from today?", ["Thursday", "Friday", "Sunday", "Saturday"], 3,
   "45 = 6 weeks + 3 days. Wednesday + 3 days = Saturday."),
 q(APT, "Analogies", "foundation", "Pen is to write as knife is to:", ["Cut", "Sharp", "Kitchen", "Steel"], 0,
   "A pen is used to write; a knife is used to cut."),
 q(APT, "Logical reasoning", "standard", "Statements: All roses are flowers. No flower is a tree.\n\nConclusions:\nI. No rose is a tree.\nII. Some trees are roses.\n\nWhich conclusion follows?",
   ["Both I and II", "Only I", "Only II", "Neither I nor II"], 1,
   "Every rose is a flower and no flower is a tree, so no rose is a tree (I). II contradicts I."),
 q(APT, "Probability", "standard", "Two fair coins are tossed. What is the probability of getting two heads?", ["1/2", "1/3", "1/4", "3/4"], 2,
   "The outcomes are HH, HT, TH, TT; only one of the four is HH, so 1/4."),
 q(APT, "Time and calendars", "standard", "How many times do the hour and minute hands of a clock point the same way in 12 hours?", ["12", "24", "10", "11"], 3,
   "They meet every 12/11 hours, so 11 times in 12 hours (the 11–12 o’clock meeting happens at 12)."),
]

RAIN = ("The table shows monthly rainfall in a town (illustrative figures).\n\n| Month | Jan | Feb | Mar | Apr | May | Jun |\n|---|---|---|---|---|---|---|\n"
        "| Rainfall (mm) | 10 | 15 | 30 | 85 | 160 | 320 |\n\n")
PASS = ("In a school of 200 students, the number who passed each subject was: English 170, Mathematics 150, Science 160. "
        "130 students passed all three subjects.\n\n")
Q += [
 # ---------------- Data interpretation (10) ----------------
 q(DI, "Tables", "foundation", RAIN + "What was the total rainfall from January to June?", ["620 mm", "600 mm", "640 mm", "580 mm"], 0,
   "10 + 15 + 30 + 85 + 160 + 320 = 620 mm."),
 q(DI, "Tables", "foundation", RAIN + "Between which two months did rainfall increase the most?", ["April to May", "May to June", "March to April", "February to March"], 1,
   "Increases: +5, +15, +55, +75, +160. May to June is the largest (+160 mm)."),
 q(DI, "Tables", "standard", RAIN + "About what percentage of the six months’ rainfall fell in June?", ["45%", "48%", "52%", "55%"], 2,
   "320 ÷ 620 × 100 ≈ 51.6%, so about 52%."),
 q(DI, "Tables", "standard", RAIN + "What was the average monthly rainfall over the six months (to the nearest mm)?", ["100 mm", "110 mm", "105 mm", "103 mm"], 3,
   "620 ÷ 6 ≈ 103.3, so 103 mm."),
 q(DI, "Tables", "foundation", RAIN + "May’s rainfall was how many times March’s rainfall?", ["About 5.3 times", "About 4 times", "About 6 times", "About 3.5 times"], 0,
   "160 ÷ 30 ≈ 5.3."),
 q(DI, "Percentages", "foundation", PASS + "What percentage of students passed Mathematics?", ["70%", "75%", "80%", "85%"], 1,
   "150 ÷ 200 × 100 = 75%."),
 q(DI, "Percentages", "foundation", PASS + "How many students failed English?", ["20", "50", "30", "40"], 2,
   "200 − 170 = 30."),
 q(DI, "Percentages", "standard", PASS + "How many students failed at least one subject?", ["30", "50", "60", "70"], 3,
   "200 − 130 (passed all three) = 70."),
 q(DI, "Statistics basics", "foundation", "The mean of eight numbers is 15. If 3 is added to each number, what is the new mean?", ["18", "15", "24", "21"], 0,
   "Adding the same amount to every number adds that amount to the mean: 15 + 3 = 18."),
 q(DI, "Statistics basics", "foundation", "What is the median of 12, 7, 9, 15 and 10?", ["9", "10", "11", "12"], 1,
   "In order: 7, 9, 10, 12, 15. The middle value is 10."),
]

# ---------------- Dzongkha (10): honorifics and opposites ----------------
HON = [("རྐང་རྗེན", "ཞབས་རྗེན", ["ཕྱག་རྗེན", "དབུ་རྗེན", "ཞལ་རྗེན"], "barefoot", 21),
       ("རྐང་གདན", "ཞབས་གདན", ["ཕྱག་གདན", "དབུ་གདན", "སྐུ་གདན"], "foot mat, doormat", 21),
       ("ང་རྒྱལ", "ཐུགས་རྒྱལ", ["སྐུ་རྒྱལ", "ཞལ་རྒྱལ", "ཕྱག་རྒྱལ"], "pride", 201),
       ("ཐང་ཀ", "ཞལ་ཐང", ["ཕྱག་ཐང", "སྐུ་ཐང", "དབུ་ཐང"], "scroll painting (thangka)", 352),
       ("ཁ་མཁས་པ", "ཞལ་མཁས་པ", ["ཕྱག་མཁས་པ", "ཐུགས་མཁས་པ", "སྐུ་མཁས་པ"], "eloquent", 56)]
OPP = [("ཕན་སེམས", "གནོད་སེམས", ["བྱམས་སེམས", "དགའ་སེམས", "དྲང་སེམས"], "kind intention / harmful intention", 562),
       ("སྤྱི་དོན", "སྒེར་དོན", ["རྒྱལ་དོན", "མི་དོན", "དོན་ཚན"], "public interest / private interest", 544),
       ("བུད་མེད", "སྐྱེས་པ", ["ཨམ་སྲུ", "བུམོ", "ཨ་ཞེ"], "woman / man", 606),
       ("ཕྱི་མི", "ནང་མི", ["མགྲོན་པོ", "གྲོགས་པོ", "ཁྱིམ་མཚེས"], "outsider, foreigner / insider", 578),
       ("གནོད", "ཕན", ["ཉེས", "སྡུག", "འཐབ"], "harm / benefit", 507)]
for i, (w, h, wrong, en, pg) in enumerate(HON):
    Q.append(q(DZ, "Honorific words (ཞེ་ས)", "standard",
               f"{w} ཟེར་བའི་ཚིག་འདི་གི་ ཞེ་ས་ག་ཅི་སྨོ?\n\n(Which is the honorific form of “{w}”?)", [h] + wrong, 0,
               f"“{w}” means {en}; its honorific (ཞེ་ས) is “{h}”. Source: DDC Dzongkha–English Dictionary, p. {pg}."))
for i, (w, o, wrong, en, pg) in enumerate(OPP):
    Q.append(q(DZ, "Opposites (འགལ་མིང)", "standard",
               f"{w} ཟེར་བའི་ཚིག་འདི་གི་ འགལ་མིང་ག་ཅི་སྨོ?\n\n(Which word is the opposite of “{w}”?)", [o] + wrong, 0,
               f"“{w}” and “{o}” are opposites ({en}). Source: DDC Dzongkha–English Dictionary, p. {pg}."))
_k = 0
for x in Q[-10:]:  # spread the Dzongkha answers over A–D
    t = _k % 4
    _k += 1
    x['opts'] = x['opts'][-t:] + x['opts'][:-t] if t else x['opts']
    x['ans'] = t


def check_batch3():
    from fractions import Fraction as F
    import math
    assert 2000 * 100 / (5 * 4) == 10000 and 45 / .3 == 150 and round(1.2 * .8, 2) == .96 and (12.5 - 10) / 10 == .25
    assert (2 * 60 + 3 * 40) / 5 == 48 and 360 / 120 == 3 and 6 * 12 / 8 == 9 and 54 // 9 * 5 == 30 and 140 - 100 == 40
    assert 6 ** 2 - 1 == 35 and 7 ** 2 - 1 == 48 and 5 + 8 == 13 and chr(64 + 17 - 5) == 'L' and 'CJSE' == ''.join(chr(ord(c) + 1) for c in 'BIRD')
    assert math.hypot(6, 8) == 10 and 7 + 18 - 1 == 24 and ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][(2 + 45) % 7] == 'Sat' and F(1, 4) == F(1, 4)
    r = [10, 15, 30, 85, 160, 320]
    assert sum(r) == 620 and max(range(5), key=lambda i: r[i + 1] - r[i]) == 4 and round(320 / 620 * 100) == 52 and round(620 / 6) == 103 and round(160 / 30, 1) == 5.3
    assert 150 / 200 == .75 and 200 - 170 == 30 and 200 - 130 == 70 and sorted([12, 7, 9, 15, 10])[2] == 10


check_batch3()
assert all(len(set(x['opts'])) == 4 for x in Q)
