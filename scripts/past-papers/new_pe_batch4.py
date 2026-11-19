# PE batch 4 (written by Claude, 20 Nov 2026) — modelled on the BCSE PE 2010/2011 papers, as one "paper":
# English 30 (ONE passage × 5), Aptitude 30, Data Interpretation 30 (chart pictures in the PE style), Dzongkha 30
# (ONE passage × 5). parent = (year, stem prefix) of the real question a twin is based on. Figures are illustrative.
BATCH = "pe-batch-4"
ENG, APT, DI, DZ = "english", "aptitude", "data", "dzongkha"
FILL = "Choose the word or phrase that correctly completes the sentence.\n\n"
CW = "Choose the word or phrase closest in meaning to the word in capitals.\n\n"
Q = []


def add(sec, topic, diff, stem, opts, ans, exp, parent=None, kind=None, **extra):
    d = dict(sec=sec, topic=topic, diff=diff, stem=stem, opts=opts, ans=ans, exp=exp, **extra)
    if parent:
        d["parent"], d["kind"] = parent, kind or "same_objective"
    Q.append(d)


# ======================= ENGLISH (30) =======================
PASSAGE = ("Read the passage and answer the question.\n\n"
           "Most of us know the feeling of leaving an important task for later. We tidy the desk, answer messages and make "
           "another cup of tea, yet the report stays unwritten. This habit, called procrastination, is often mistaken for "
           "laziness. Researchers who study it suggest a different explanation: people delay not because they dislike work, "
           "but because the task stirs an unpleasant feeling — boredom, self-doubt or the fear of doing it badly. Putting the "
           "task off brings quick relief, and that relief rewards the delay, so the habit grows stronger each time.\n\n"
           "The cost is real. Work done at the last minute is rushed, and the worry that hangs over an unfinished task can "
           "be more tiring than the task itself. The remedy, the same researchers argue, is not stricter discipline but a "
           "gentler start. Breaking a large job into a first step small enough to feel harmless — writing one paragraph, "
           "reading one page — takes away much of the dread. Once we begin, the task usually turns out to be less "
           "frightening than we imagined.\n\n")
PQ = [
    ("According to the passage, people mainly procrastinate because", ["they are lazy", "the task causes an unpleasant feeling they want to avoid", "they have too much free time", "they enjoy working under pressure"], 1,
     "The passage says people delay “not because they dislike work, but because the task stirs an unpleasant feeling”."),
    ("Why, according to the passage, does the habit of delay grow stronger?", ["The relief felt after putting a task off rewards the delay", "Tasks become harder over time", "Other people encourage it", "Deadlines are usually too long"], 0,
     "“Putting the task off brings quick relief, and that relief rewards the delay, so the habit grows stronger.”"),
    ("The word “remedy” in the second paragraph is closest in meaning to", ["reason", "punishment", "cure", "warning"], 2,
     "A remedy is something that cures or corrects a problem."),
    ("What does the passage recommend?", ["Working longer hours", "Stricter self-discipline", "Avoiding difficult tasks", "Starting with a very small first step"], 3,
     "The remedy is “a gentler start”: a first step “small enough to feel harmless”."),
    ("Which title best suits the passage?", ["Why We Put Things Off, and How to Start", "The Dangers of Hard Work", "How to Write a Report", "Laziness in the Modern Office"], 0,
     "The passage explains the cause of procrastination and a way to overcome it."),
]
for i, (s, o, a, e) in enumerate(PQ, 1):
    add(ENG, "Comprehension", "standard", PASSAGE + s, o, a, e, passage="soma-b4-english", pos=i,
        parent=(2010, "Read the passage and answer the question."), kind="same_objective")

add(ENG, "Grammar", "standard", "Which of the following words looks plural but is singular?", ["Measles", "Pliers", "Spectacles", "Police"], 0,
    "“Measles is a disease” takes a singular verb. Pliers and spectacles are plural nouns; police takes a plural verb.",
    parent=(2010, "Which of the following words looks plural but is not?"))
add(ENG, "Grammar", "standard", FILL + "The committee’s decision ______ the meeting until March surprised everyone.", ["to postpone", "postponing of", "to postponing", "postpone"], 0,
    "“Decision” is followed by a to-infinitive: “the decision to postpone”.", parent=(2011, "Choose the word or phrase that correctly completes the sentence.\n\nThe government"))
add(ENG, "Grammar", "standard", FILL + "The modern hospital ______ from a small dispensary that was opened in 1960.", ["has grown", "grew", "grown", "growing"], 1,
    "A completed past development with a past time reference takes the simple past: “grew from”.", parent=(2011, "Choose the word that correctly completes the sentence.\n\n“The political party"))
add(ENG, "Grammar", "standard", FILL + "Unemployment will fall only ______ create more jobs in the private sector.", ["if we", "unless we", "we will", "when will we"], 0,
    "The condition is positive: unemployment falls only if we create jobs.", parent=(2010, "Choose the word or phrase that will correctly complete the sentence.\n\nThe poverty rates"))
add(ENG, "Grammar", "standard", FILL + "The new Act ______ free basic health care for every citizen.", ["provides for", "provides with", "provides to", "provides by"], 0,
    "A law “provides for” something: it makes it possible or required.", parent=(2010, "Choose the word or phrase that will correctly complete the sentence.\n\nThe legislation"))
add(ENG, "Grammar", "standard", FILL + "No sooner had the bus left ______ it began to rain.", ["when", "than", "then", "that"], 1,
    "The fixed pattern is “No sooner … than”.")

add(ENG, "Vocabulary", "standard", "Which of the following usages of the word “judicious” is correct?",
    ["She made a judicious choice of words in a difficult meeting.", "The judicious rain flooded the fields.", "He felt judicious after the long walk.", "The road was judicious and full of bends."], 0,
    "Judicious means showing good judgement; it describes decisions and choices.", parent=(2010, "Which of the following usages of the word “tortuous” is correct?"))
add(ENG, "Vocabulary", "advanced", "Which of the following makes a correct distinction between “continual” and “continuous”?",
    ["Continual means happening again and again with breaks; continuous means without any break.", "Continual means without any break; continuous means happening again and again.", "They mean exactly the same.", "Continual is used only for time; continuous only for space."], 0,
    "Continual interruptions keep recurring; a continuous noise never stops.", parent=(2010, "Which of the following makes a correct distinction between the words “aggravate” and “irritate”"))
add(ENG, "Vocabulary", "advanced", "Which of the following makes a correct distinction between “imply” and “infer”?",
    ["A speaker implies something; a listener infers it.", "A listener implies something; a speaker infers it.", "Both words mean “to say directly”.", "Imply is formal and infer is informal; they mean the same."], 0,
    "To imply is to suggest without saying; to infer is to conclude from what is suggested.", parent=(2011, "Which of the following makes a correct distinction between “adverse” and “averse”?"))
add(ENG, "Vocabulary", "standard", "What does “arboreal” mean?", ["Living in or relating to trees", "Relating to the sea", "Living under the ground", "Relating to the desert"], 0,
    "Arboreal animals, such as many monkeys, live in trees.", parent=(2011, "What does “equestrian” mean?"))
add(ENG, "Vocabulary", "standard", FILL + "The old hermit lived a ______ life in a cave above the valley.", ["reclusive", "gregarious", "boisterous", "convivial"], 0,
    "Reclusive means avoiding the company of others; the other three describe sociable or lively people.", parent=(2010, "Choose the word that will correctly complete the sentence.\n\nShe was taking a"))
add(ENG, "Vocabulary", "standard", FILL + "The minister is ______ negotiator; she rarely loses an argument.", ["an astute", "a naive", "an indifferent", "a reluctant"], 0,
    "Astute means clever and quick to see an advantage.", parent=(2011, "Choose the word that correctly completes the sentence.\n\nThe professor is"))
add(ENG, "Vocabulary", "standard", FILL + "The ______ aroma of ema datshi filled the kitchen and made everyone hungry.", ["tantalising", "insipid", "bland", "odourless"], 0,
    "Tantalising means tempting; insipid and bland mean lacking flavour.", parent=(2011, "The _____ smell of Italian food"))

for w, sent, right, wrong, exp in [
    ("TACITURN", "The officer’s TACITURN manner made the interview difficult.", "reserved", ["talkative", "cheerful", "rude"], "Taciturn means saying very little; reserved."),
    ("SPURIOUS", "The report contained several SPURIOUS claims.", "false", ["important", "original", "careful"], "Spurious means false or fake, though it may look genuine."),
    ("UNPRECEDENTED", "The flood caused UNPRECEDENTED damage to the town.", "never seen before", ["expected", "minor", "repeated"], "Unprecedented means never done or known before."),
]:
    add(ENG, "Synonyms", "standard", CW + sent, [right] + wrong, 0, exp, parent=(2010, "Choose the word or phrase closest in meaning to the word in capitals."))
for w, right, wrong, exp in [
    ("cogent", "convincing", ["confusing", "careless", "costly"], "A cogent argument is clear and convincing."),
    ("pragmatic", "practical", ["dreamy", "dishonest", "idle"], "Pragmatic means dealing with things in a practical way."),
    ("lethargic", "sluggish", ["energetic", "angry", "curious"], "Lethargic means slow and lacking energy."),
]:
    add(ENG, "Synonyms", "standard", f"Which of the following words has the same meaning as “{w}”?", [right] + wrong, 0, exp,
        parent=(2010, "Which of the following words has the same meaning as “ubiquitous”?"))
for w, right, wrong, exp in [
    ("verbose", "concise", ["wordy", "lengthy", "talkative"], "Verbose means using too many words; concise is the opposite."),
    ("frivolous", "serious", ["silly", "playful", "trivial"], "Frivolous means not serious."),
    ("benign", "harmful", ["kind", "gentle", "mild"], "Benign means harmless or kind; harmful is the opposite."),
    ("obstinate", "flexible", ["stubborn", "rigid", "determined"], "Obstinate means refusing to change; flexible is the opposite."),
    ("scarcity", "abundance", ["shortage", "lack", "need"], "Scarcity means shortage; abundance means plenty."),
    ("ostentatious", "modest", ["showy", "flashy", "grand"], "Ostentatious means showy, designed to impress; modest is the opposite."),
]:
    add(ENG, "Antonyms", "standard", f"Which of the following words has the opposite meaning of “{w}”?", [right] + wrong, 0, exp,
        parent=(2010, "Which of the following has the opposite meaning of “impinge”?"))

# ======================= APTITUDE (30) =======================
A = APT
add(A, "Ordering and ranking", "standard", "Tashi is taller than Dema but shorter than Karma. Sonam is shorter than Dema. Who is the shortest?", ["Sonam", "Dema", "Tashi", "Karma"], 0,
    "Karma > Tashi > Dema > Sonam, so Sonam is the shortest.", parent=(2011, "Deki is shorter than Pema"))
add(A, "Ordering and ranking", "standard", "In a race, Pema finished ahead of Dawa but behind Tshering. Karma finished ahead of Tshering but behind Sonam. Who came third?", ["Tshering", "Karma", "Pema", "Dawa"], 0,
    "Order: Sonam, Karma, Tshering, Pema, Dawa. Tshering is third.", parent=(2011, "In a horse race"))
add(A, "Ordering and ranking", "standard", "Five books stand on a shelf. Maths is at the left end and Dzongkha at the right end. Science is between Maths and English. History is to the right of English. Which book is in the middle?", ["English", "Science", "History", "Maths"], 0,
    "Left to right: Maths, Science, English, History, Dzongkha. English is in the middle.", parent=(2010, "Six electronic items are kept"))
add(A, "Percentages", "foundation", "In a class of 160 students, 96 are female. What percentage of the class is male?", ["40%", "60%", "36%", "64%"], 0,
    "Male = 64; 64 ÷ 160 × 100 = 40%.", parent=(2010, "In a class of 125 students"))
add(A, "Percentages", "foundation", "6 is 75% of what number?", ["8", "4.5", "7.5", "9"], 0, "6 ÷ 0.75 = 8.", parent=(2011, "3 is 80% of what number?"))
add(A, "Percentages", "foundation", "The price of a company share falls from Nu. 250 to Nu. 230. What is the percentage decrease?", ["8%", "20%", "9%", "10%"], 0,
    "Fall = 20; 20 ÷ 250 × 100 = 8%.", parent=(2011, "The value of a company share drops"))
add(A, "Percentages", "standard", "Pema spends 40% of her monthly income on rent and 30% on food, and saves the remaining Nu. 9,000. What is her monthly income?", ["Nu. 30,000", "Nu. 27,000", "Nu. 22,500", "Nu. 36,000"], 0,
    "Savings are 30% of income: 9,000 ÷ 0.30 = Nu. 30,000.", parent=(2010, "Tandin pays 50% of his monthly income"))
add(A, "Percentages", "standard", "A price rises from Nu. 40 to Nu. 50 and then falls back to Nu. 40. Which statement is true?",
    ["The percentage increase is greater than the percentage decrease.", "The percentage decrease is greater than the percentage increase.", "Both percentages are equal.", "Both are 10%."], 0,
    "Increase = 10/40 = 25%; decrease = 10/50 = 20%.", parent=(2011, "A number increases from 20 to 30"))
add(A, "Averages", "standard", "The average weight of 4 parcels is 12 kg. When a fifth parcel is added, the average becomes 13 kg. How heavy is the fifth parcel?", ["17 kg", "13 kg", "15 kg", "12.5 kg"], 0,
    "Total of five = 65 kg; total of four = 48 kg; the fifth = 17 kg.", parent=(2011, "The average age of a group of 5 students"))
add(A, "Averages", "foundation", "Five friends scored 6, 9, 7, 10 and 8 in a quiz. What is their mean score?", ["8", "7", "9", "7.5"], 0,
    "(6 + 9 + 7 + 10 + 8) ÷ 5 = 40 ÷ 5 = 8.", parent=(2011, "Dechen took a quiz with five friends"))
add(A, "Fractions", "foundation", "What is 1/3 of half of 1/4 of 480?", ["20", "40", "60", "30"], 0,
    "1/4 of 480 = 120; half = 60; 1/3 of 60 = 20.", parent=(2010, "What is 1/4 of half of 1/5 of 200?"))
add(A, "Fractions", "standard", "Karma ate 3/5 of a pizza and Dorji ate 2/3 of an identical pizza. Together they ate:", ["More than one pizza", "Exactly one pizza", "Less than one pizza", "Exactly half a pizza"], 0,
    "3/5 + 2/3 = 9/15 + 10/15 = 19/15, which is more than 1.", parent=(2010, "Sonam and Pema were each given an apple pie"))
add(A, "Ratio and proportion", "foundation", "In a class of 35 students, the ratio of boys to girls is 3 : 4. How many girls are there?", ["20", "15", "21", "28"], 0,
    "35 ÷ 7 = 5 per part; girls = 4 × 5 = 20.", parent=(2011, "There are 24 students in a class"))
add(A, "Number series", "foundation", "Which number comes next in the series?\n\n2, 3, 5, 8, 12, 17, ?", ["23", "22", "24", "21"], 0,
    "The differences grow by one: +1, +2, +3, +4, +5, so next is +6: 17 + 6 = 23.", parent=(2010, "Which number comes next in the series?"))
add(A, "Number patterns", "advanced", "If:\n3, 4 = 21\n5, 2 = 35\n4, 6 = 40\nthen 6, 3 = ?", ["54", "18", "45", "36"], 0,
    "Rule: first × (first + second). 3 × 7 = 21, 5 × 7 = 35, 4 × 10 = 40, so 6 × 9 = 54.", parent=(2011, "If:\n2, 3 = 10"))
add(A, "Letter series", "foundation", "What is the missing letter in this series?\n\nc  f  i  l  o  ?  u", ["r", "q", "s", "p"], 0,
    "Each letter is three places after the one before: o (15) + 3 = r (18).", parent=(2011, "What is the missing letter in this series?\n\nb  e  h"))
add(A, "Letter series", "standard", "Which letter comes next in this series?\n\na  z  c  x  e  ?", ["v", "w", "g", "u"], 0,
    "Two series alternate: a, c, e (forward by 2) and z, x, v (back by 2). Next is v.", parent=(2011, "What is the missing letter in this series?\n\na  z  b"))
add(A, "Letter series", "foundation", "Which letter completes the series?\n\np  m  q  m  r  m  s  m  ?", ["t", "m", "u", "s"], 0,
    "The letters p, q, r, s alternate with m; next is t.", parent=(2011, "Which letter completes the series?"))
add(A, "Analogies", "standard", "Which choice makes the best comparison?\n\nTIGER is to REGIT as 58316 is to:", ["61385", "61358", "85316", "16385"], 0,
    "REGIT is TIGER written backwards; 58316 backwards is 61385.", parent=(2011, "Which choice makes the best comparison?\n\nPEACH"))
add(A, "Analogies", "foundation", "Which choice makes the best comparison?\n\nPetal is to flower as page is to:", ["Book", "Pen", "Word", "Library"], 0,
    "A petal is part of a flower; a page is part of a book.", parent=(2011, "Which choice makes the best comparison?\n\nFingers"))
add(A, "Word puzzles", "foundation", "If you unscramble the letters ANIDI, you get the name of a:", ["Country", "River", "Animal", "Fruit"], 0,
    "ANIDI unscrambles to INDIA.", parent=(2011, "If you unscramble the letters YKANE"))
add(A, "Word puzzles", "foundation", "If you unscramble the letters RGTEI, you get the name of an:", ["Animal", "City", "Country", "Instrument"], 0,
    "RGTEI unscrambles to TIGER.", parent=(2011, "If you unscramble the letters ITNKA"))
add(A, "Counting", "standard", "Seven schools play in a football league. Each school plays every other school once. How many matches are played?", ["21", "42", "14", "49"], 0,
    "7 × 6 ÷ 2 = 21 matches.", parent=(2010, "Five teams from Thimphu"))
add(A, "Counting", "standard", "In how many ways can the letters of the word DRUK be arranged, using each letter once?", ["24", "16", "12", "4"], 0,
    "4 different letters: 4 × 3 × 2 × 1 = 24.", parent=(2011, "In how many ways can the letters of SOLVING"))
add(A, "Ages", "standard", "Pema is 15 years old and three times as old as her brother. How old will Pema be when she is twice as old as her brother?", ["20", "25", "30", "18"], 0,
    "Brother is 5; the age gap is always 10. Pema is twice his age when he is 10 and she is 20.", parent=(2010, "Pema is sixteen years old"))
add(A, "Logical puzzles", "standard", "Sonam speaks Hindi and English. Dawa speaks Hindi and Nepali. Pema speaks Nepali and English. Who speaks both Nepali and English?", ["Pema", "Sonam", "Dawa", "Nobody"], 0,
    "Only Pema speaks both Nepali and English.", parent=(2011, "Penjore, Choki, Lhamo and Dorji speak many languages"))
add(A, "Directions", "foundation", "Dorji walks 4 km north, then turns left and walks 3 km. In which direction is he now from his starting point?", ["North-west", "North-east", "South-west", "West"], 0,
    "Turning left from north means walking west, so he ends up north and west of the start: north-west.", parent=(2010, "Which two statements are needed"))
add(A, "Time and calendars", "standard", "Bhutan’s time is 6 hours ahead of London’s (UTC). When it is 12 noon in Thimphu, what time is it in London?", ["6 AM", "6 PM", "12 midnight", "7 AM"], 0,
    "12 noon minus 6 hours = 6 AM.", parent=(2010, "I am a time of the day"))
add(A, "Quantitative comparison", "advanced", "Compare Column A and Column B.\n\nColumn A: 8⁴\nColumn B: 4⁶", ["The two quantities are equal", "Column A is greater", "Column B is greater", "The relationship cannot be determined"], 0,
    "8⁴ = 2¹² and 4⁶ = 2¹²; both are 4,096.", parent=(2010, "Compare Column A and Column B."))
add(A, "General awareness", "foundation", "Which of the following is one of the four pillars of Gross National Happiness?", ["Preservation and promotion of culture", "Rapid industrialisation", "Growth in GDP above all else", "Military strength"], 0,
    "The four pillars are sustainable and equitable socio-economic development, environmental conservation, preservation and promotion of culture, and good governance.",
    parent=(2010, "Progress that meets the needs"))

# ======================= DATA INTERPRETATION (30) =======================
V = "Study the bar chart (illustrative figures) and answer the question.\n\n"
add(DI, "Bar charts", "foundation", V + "Which dzongkhag had fewer visitors in 2023 than in 2022?", ["Punakha", "Paro", "Bumthang", "Haa"], 0, "Punakha fell from 35 to 30 thousand; all others rose.", image="/papers/soma/b4-visitors.png")
add(DI, "Bar charts", "foundation", V + "What was the total number of visitors to the five dzongkhags in 2023?", ["203 thousand", "172 thousand", "198 thousand", "210 thousand"], 0, "55 + 72 + 30 + 32 + 14 = 203 thousand.", image="/papers/soma/b4-visitors.png")
add(DI, "Bar charts", "standard", V + "Which dzongkhag had the largest percentage increase in visitors from 2022 to 2023?", ["Haa", "Paro", "Bumthang", "Thimphu"], 0, "Haa +40% (10→14), Paro +31%, Bumthang +28%, Thimphu +20%.", image="/papers/soma/b4-visitors.png")
add(DI, "Bar charts", "foundation", V + "In 2022, how many more visitors went to Thimphu than to Paro?", ["18 thousand", "12 thousand", "17 thousand", "25 thousand"], 0, "60 − 42 = 18 thousand.", image="/papers/soma/b4-visitors.png")
add(DI, "Bar charts", "standard", V + "What was the average number of visitors per dzongkhag in 2022?", ["34.4 thousand", "40.6 thousand", "35 thousand", "32.8 thousand"], 0, "(42 + 60 + 35 + 25 + 10) ÷ 5 = 172 ÷ 5 = 34.4 thousand.", image="/papers/soma/b4-visitors.png")
L = "Study the line graph (illustrative figures) and answer the question.\n\n"
add(DI, "Line charts", "foundation", L + "In which month did the school use the least electricity?", ["May", "April", "June", "March"], 0, "May shows the lowest value, 700 units.", image="/papers/soma/b4-electricity.png")
add(DI, "Line charts", "standard", L + "By about what percentage did use fall from January to May?", ["About 42%", "About 50%", "About 30%", "About 58%"], 0, "Fall = 500 units; 500 ÷ 1,200 × 100 ≈ 41.7%.", image="/papers/soma/b4-electricity.png")
add(DI, "Line charts", "standard", L + "What was the average monthly use over the six months (to the nearest unit)?", ["942 units", "950 units", "900 units", "1,000 units"], 0, "Total = 5,650; 5,650 ÷ 6 ≈ 941.7, so 942.", image="/papers/soma/b4-electricity.png")
add(DI, "Line charts", "foundation", L + "In how many months was use above 900 units?", ["3", "4", "2", "5"], 0, "January (1,200), February (1,100) and March (950). June is exactly 900, not above.", image="/papers/soma/b4-electricity.png")
add(DI, "Line charts", "standard", L + "By what percentage did use rise from May to June?", ["About 29%", "About 22%", "About 20%", "About 33%"], 0, "Rise = 200; 200 ÷ 700 × 100 ≈ 28.6%.", image="/papers/soma/b4-electricity.png")
P = "Study the pie chart and answer the question.\n\n"
add(DI, "Pie charts", "foundation", P + "How much does Karma spend on books each month?", ["Nu. 1,200", "Nu. 900", "Nu. 1,500", "Nu. 2,000"], 0, "20% of 6,000 = Nu. 1,200.", image="/papers/soma/b4-allowance.png")
add(DI, "Pie charts", "standard", P + "What angle at the centre does the Transport slice make?", ["54°", "45°", "60°", "36°"], 0, "15% of 360° = 54°.", image="/papers/soma/b4-allowance.png")
add(DI, "Pie charts", "standard", P + "How much more does Karma spend on food than he saves?", ["Nu. 1,500", "Nu. 2,400", "Nu. 900", "Nu. 1,200"], 0, "Food 40% − savings 15% = 25% of 6,000 = Nu. 1,500.", image="/papers/soma/b4-allowance.png")
add(DI, "Pie charts", "standard", P + "If his allowance rises to Nu. 7,500 and the shares stay the same, how much will he spend on his phone?", ["Nu. 750", "Nu. 600", "Nu. 900", "Nu. 1,125"], 0, "10% of 7,500 = Nu. 750.", image="/papers/soma/b4-allowance.png")
add(DI, "Pie charts", "foundation", P + "What is the ratio of spending on food to spending on books?", ["2 : 1", "4 : 1", "1 : 2", "3 : 2"], 0, "40% : 20% = 2 : 1.", image="/papers/soma/b4-allowance.png")
B = "Study the bar chart (illustrative figures) and answer the question.\n\n"
add(DI, "Bar charts", "foundation", B + "How many new businesses were registered in the six towns altogether?", ["168", "158", "172", "148"], 0, "48 + 36 + 30 + 24 + 18 + 12 = 168.", image="/papers/soma/b4-businesses.png")
add(DI, "Bar charts", "standard", B + "About what percentage of all the new businesses were in Thimphu?", ["About 29%", "About 25%", "About 33%", "About 48%"], 0, "48 ÷ 168 × 100 ≈ 28.6%.", image="/papers/soma/b4-businesses.png")
add(DI, "Bar charts", "foundation", B + "What is the ratio of new businesses in Phuentsholing to those in Bumthang?", ["3 : 1", "2 : 1", "4 : 1", "1 : 3"], 0, "36 : 12 = 3 : 1.", image="/papers/soma/b4-businesses.png")
add(DI, "Bar charts", "standard", B + "How many towns had more new businesses than the average of the six towns?", ["3", "2", "4", "1"], 0, "Average = 168 ÷ 6 = 28. Thimphu, Phuentsholing and Gelephu are above 28.", image="/papers/soma/b4-businesses.png")
add(DI, "Bar charts", "standard", B + "Gelephu registered how many percent more new businesses than Paro?", ["25%", "20%", "6%", "30%"], 0, "(30 − 24) ÷ 24 × 100 = 25%.", image="/papers/soma/b4-businesses.png")
G = "Study the distance–time graph and answer the question.\n\n"
add(DI, "Distance–time graphs", "foundation", G + "What was the bus’s speed during the first two hours?", ["50 km/h", "100 km/h", "40 km/h", "25 km/h"], 0, "100 km in 2 hours = 50 km/h.", image="/papers/soma/b4-bus.png", parent=(2010, "A student walks to a bus stop"))
add(DI, "Distance–time graphs", "foundation", G + "For how long did the bus stop?", ["30 minutes", "1 hour", "15 minutes", "2 hours"], 0, "The graph is flat from 2 h to 2.5 h: half an hour.", image="/papers/soma/b4-bus.png")
add(DI, "Distance–time graphs", "foundation", G + "How far did the bus travel in total?", ["160 km", "100 km", "180 km", "60 km"], 0, "The graph ends at 160 km.", image="/papers/soma/b4-bus.png")
add(DI, "Distance–time graphs", "standard", G + "What was the average speed for the whole journey, including the stop?", ["40 km/h", "50 km/h", "45 km/h", "32 km/h"], 0, "160 km in 4 hours = 40 km/h.", image="/papers/soma/b4-bus.png", parent=(2010, "Using the same graph"))
add(DI, "Distance–time graphs", "standard", G + "What was the bus’s speed after the stop?", ["40 km/h", "60 km/h", "50 km/h", "30 km/h"], 0, "60 km (100→160) in 1.5 hours = 40 km/h.", image="/papers/soma/b4-bus.png")
TB = ("The table shows how many students sat and passed practice tests at a study centre (illustrative figures).\n\n"
      "| Year | 2019 | 2020 | 2021 | 2022 | 2023 |\n|---|---|---|---|---|---|\n| Sat | 120 | 150 | 160 | 140 | 180 |\n| Passed | 54 | 72 | 80 | 77 | 108 |\n\n")
add(DI, "Tables", "standard", TB + "In which year was the pass rate highest?", ["2023", "2022", "2021", "2020"], 0, "Pass rates: 45%, 48%, 50%, 55%, 60%. The highest is 2023.")
add(DI, "Tables", "foundation", TB + "What was the pass rate in 2019?", ["45%", "54%", "40%", "50%"], 0, "54 ÷ 120 × 100 = 45%.")
add(DI, "Tables", "foundation", TB + "How many students passed over the five years altogether?", ["391", "381", "401", "750"], 0, "54 + 72 + 80 + 77 + 108 = 391.")
add(DI, "Tables", "standard", TB + "By what percentage did the number of students sitting the test rise from 2019 to 2023?", ["50%", "60%", "40%", "33%"], 0, "(180 − 120) ÷ 120 × 100 = 50%.")
add(DI, "Tables", "standard", TB + "What was the average number of students who passed per year?", ["78.2", "75", "80", "77"], 0, "391 ÷ 5 = 78.2.")

# ======================= DZONGKHA (30) — a Dzongkha speaker must check before publishing =======================
DZP = ("ཚིག་ཚན་འདི་ལྷག་སྟེ་ དྲི་བ་ལུ་ལན་བྲིས།\n\n(Read the passage and answer the question.)\n\n"
       "དཀར་མོ་ སྤ་རོ་ལུ་ སྡོདཔ་ཨིན། ཁོ་མོའི་ཁྱིམ་ནང་ མི་ལྔ་ཡོད། ཁོ་མོའི་ཨ་པ་ ཞིང་པ་ཨིན། ཁོ་མོའི་ཨ་མ་ སློབ་དཔོན་ཨིན། "
       "དཀར་མོ་ འཛིན་རིམ་བཅུ་པ་ནང་ སློབ་སྦྱོང་འབདཝ་ཨིན། ཁོ་མོ་ ཤུལ་མ་ སྨན་པ་ཅིག་ འབད་ནི་མནོཝ་ཨིན།\n\n")
for i, (s, en, o, a, exp) in enumerate([
    ("དཀར་མོ་ ག་ཏེ་ སྡོདཔ་སྨོ?", "Where does Karmo live?", ["སྤ་རོ", "ཐིམ་ཕུ", "སྤུ་ན་ཁ", "བུམ་ཐང"], 0, "The passage says Karmo lives in Paro (སྤ་རོ)."),
    ("དཀར་མོའི་ཁྱིམ་ནང་ མི་ ག་དེམ་ཅིག་ཡོད་ག?", "How many people are in Karmo's house?", ["ལྔ", "གསུམ", "བཞི", "དྲུག"], 0, "The passage says five people (མི་ལྔ)."),
    ("དཀར་མོའི་ཨ་པ་ ལཱ་ ག་ཅི་ འབདཝ་སྨོ?", "What is Karmo's father's work?", ["ཞིང་པ", "སློབ་དཔོན", "སྨན་པ", "ཚོང་པ"], 0, "Her father is a farmer (ཞིང་པ)."),
    ("དཀར་མོ་ འཛིན་རིམ་ ག་དེམ་ཅིག་ནང་ ཨིན་ན?", "Which class is Karmo in?", ["བཅུ་པ", "དགུ་པ", "བཅུ་གཅིག་པ", "བརྒྱད་པ"], 0, "She studies in class ten (འཛིན་རིམ་བཅུ་པ)."),
    ("དཀར་མོ་ ཤུལ་མ་ ག་ཅི་ འབད་ནི་ མནོཝ་ཨིན་ན?", "What does Karmo want to become?", ["སྨན་པ", "སློབ་དཔོན", "ཞིང་པ", "དྲུང་ཆེན"], 0, "She wants to become a doctor (སྨན་པ)."),
], 1):
    add(DZ, "Comprehension", "foundation", DZP + s + f"\n\n({en})", o, a, exp, passage="soma-b4-dzongkha", pos=i,
        parent=(2010, "Read the passage and the question in the picture"), kind="same_objective")
for w, h, wrong, en, pg in [
    ("ཁ་མཐུན", "ཞལ་མཐུན", ["ཕྱག་མཐུན", "སྐུ་མཐུན", "དབུ་མཐུན"], "agreement", 59),
    ("གེགས", "སྐུ་གེགས", ["ཞལ་གེགས", "ཕྱག་གེགས", "དབུ་གེགས"], "obstacle, hindrance", 109),
    ("མི་ཚེ་གང", "སྐུ་རིང", ["ཞལ་རིང", "ཕྱག་རིང", "དབུ་རིང"], "lifetime", 680),
    ("མི་སེར", "ཆབ་འབངས", ["སྐུ་འབངས", "ཞལ་འབངས", "ཕྱག་འབངས"], "citizen, subject", 683),
    ("སྒེར", "སྐུ་སྒེར", ["ཞལ་སྒེར", "ཕྱག་སྒེར", "དབུ་སྒེར"], "private, personal", 185),
    ("སྐྱེས་སྐར", "འཁྲུངས་སྐར", ["སྐུ་སྐར", "ཞལ་སྐར", "ཕྱག་སྐར"], "birth star", 45),
    ("འགོ་འདྲེན", "དབུ་འདྲེན", ["ཞལ་འདྲེན", "ཕྱག་འདྲེན", "སྐུ་འདྲེན"], "leadership", 155),
    ("ཚོགས་ཁང", "ཞལ་འཛོམས་ཁང", ["སྐུ་འཛོམས་ཁང", "ཕྱག་འཛོམས་ཁང", "དབུ་འཛོམས་ཁང"], "assembly hall", 767),
]:
    add(DZ, "Honorific words (ཞེ་ས)", "standard", f"“{w}” ཟེར་བའི་ཚིག་གི་ ཞེ་ས་ ག་ཅི་སྨོ?\n\n(Which is the honorific form of “{w}”?)", [h] + wrong, 0,
        f"“{w}” means {en}; its honorific (ཞེ་ས) is “{h}”. Source: DDC Dzongkha–English Dictionary, p. {pg}.")
for w, o, wrong, en, pg in [
    ("ག་ར", "ལ་ལུ", ["ཆ་མཉམ", "ཡོངས་རྫོགས", "ཧྲིལ་བུ"], "all / some", 104),
    ("གྱང", "དྲོ", ["གྲང", "ཁྱགས", "བསིལ"], "cold / warm", 116),
    ("ངག་བརྗོད", "ཡིག་ཐོག", ["ཁ་ཐོག", "གསུང་ཐོག", "སྐད་ཐོག"], "oral / written", 201),
    ("མངོན་གྱུར", "ལྐོག་གྱུར", ["གསལ་གྱུར", "ཕྱི་གྱུར", "ཐོན་གྱུར"], "visible, manifest / hidden", 219),
    ("གཏོར", "སྤུང", ["ཐོར", "བཀྲམ", "གཡུགས"], "scatter / gather into a pile", 325),
    ("བསྟེན", "སྤང", ["བཟུང", "ལེན", "བསྐྱེད"], "adopt, rely on / give up", 347),
    ("བདེ་བ", "སྡུག་བསྔལ", ["སྐྱིད་པ", "དགའ་བ", "ཞི་བ"], "happiness / suffering", 439),
    ("འབོལ་དྲགས", "དཀོན་དྲགས", ["མང་དྲགས", "ལངམ་དྲགས", "ཡོད་དྲགས"], "plentiful / scarce", 642),
    ("མ་རིག་པ", "རིག་པ", ["མི་ཤེས་པ", "བླུན་པོ", "གཏི་མུག"], "ignorance / knowledge", 669),
]:
    add(DZ, "Opposites (འགལ་མིང)", "standard", f"“{w}” ཟེར་བའི་ཚིག་གི་ འགལ་མིང་ ག་ཅི་སྨོ?\n\n(Which word is the opposite of “{w}”?)", [o] + wrong, 0,
        f"“{w}” and “{o}” are opposites ({en}). Source: DDC Dzongkha–English Dictionary, p. {pg}.")
for w, en, wrong in [
    ("ཞིང་པ", "Farmer", ["Teacher", "Trader", "Doctor"]),
    ("སློབ་དཔོན", "Teacher", ["Student", "Monk", "Farmer"]),
    ("སྨན་པ", "Doctor", ["Nurse", "Teacher", "Farmer"]),
    ("རྣ་བ", "Ear", ["Eye", "Nose", "Mouth"]),
    ("ཉིནམ", "Day", ["Night", "Week", "Month"]),
    ("ལྕི་བ", "Heavy", ["Light", "Long", "Hot"]),
    ("གླིང་ཆེན", "Continent", ["Island", "Mountain", "Ocean"]),
    ("སྐམ་ཞིང", "Dry land (dry field)", ["Paddy field", "Forest", "Riverbank"]),
]:
    add(DZ, "Vocabulary", "foundation", f"What does the Dzongkha word “{w}” mean?\n\n(“{w}” ཟེར་བའི་ཚིག་གི་ དོན་ ག་ཅི་སྨོ?)", [en] + wrong, 0,
        f"“{w}” means {en.lower()}. Source: DDC Dzongkha–English Dictionary.")


# ---- spread the correct answers over A–D (passage and natural-order lists keep their order where it matters)
def _balance():
    for k, x in enumerate(Q):
        t = k % 4
        if x["ans"] != 0:
            continue
        x["opts"] = x["opts"][-t:] + x["opts"][:-t] if t else x["opts"]
        x["ans"] = t


_balance()


def check_batch4():
    from fractions import Fraction as F
    assert 55 + 72 + 30 + 32 + 14 == 203 and (42 + 60 + 35 + 25 + 10) / 5 == 34.4 and 60 - 42 == 18
    inc = {k: (b - a) / a for k, a, b in [("Paro", 42, 55), ("Thimphu", 60, 72), ("Punakha", 35, 30), ("Bumthang", 25, 32), ("Haa", 10, 14)]}
    assert max(inc, key=inc.get) == "Haa"
    e = [1200, 1100, 950, 800, 700, 900]
    assert round(500 / 1200 * 100) == 42 and round(sum(e) / 6) == 942 and sum(v > 900 for v in e) == 3 and round(200 / 700 * 100) == 29
    assert 6000 * .2 == 1200 and 360 * .15 == 54 and 6000 * .25 == 1500 and 7500 * .1 == 750
    b = [48, 36, 30, 24, 18, 12]
    assert sum(b) == 168 and round(48 / 168 * 100) == 29 and sum(v > sum(b) / 6 for v in b) == 3 and (30 - 24) / 24 == .25
    assert 100 / 2 == 50 and 160 / 4 == 40 and 60 / 1.5 == 40
    sat, passed = [120, 150, 160, 140, 180], [54, 72, 80, 77, 108]
    rates = [p / s for p, s in zip(passed, sat)]
    assert rates.index(max(rates)) == 4 and sum(passed) == 391 and (180 - 120) / 120 == .5 and sum(passed) / 5 == 78.2 and 54 / 120 == .45
    assert 64 / 160 == .4 and 6 / .75 == 8 and 20 / 250 == .08 and round(9000 / .3) == 30000 and 10 / 40 > 10 / 50
    assert 13 * 5 - 12 * 4 == 17 and (6 + 9 + 7 + 10 + 8) / 5 == 8 and 480 / 4 / 2 / 3 == 20 and F(3, 5) + F(2, 3) > 1 and 35 // 7 * 4 == 20
    assert 17 + 6 == 23 and 6 * (6 + 3) == 54 and 3 * 7 == 21 and 5 * 7 == 35 and 4 * 10 == 40 and chr(ord("o") + 3) == "r"
    assert "58316"[::-1] == "61385" and sorted("ANIDI") == sorted("INDIA") and sorted("RGTEI") == sorted("TIGER")
    assert 7 * 6 // 2 == 21 and 4 * 3 * 2 == 24 and 8 ** 4 == 4 ** 6 and (12 - 6) == 6
    assert len(Q) == 120 and all(len(set(x["opts"])) == 4 for x in Q)


check_batch4()
