# PE batch 5 (written by Claude, 20 Nov 2026) — one PE-style "paper": English 30 (ONE passage × 5), Aptitude 30,
# Data Interpretation 30 (chart pictures, illustrative figures), Dzongkha 30 (ONE passage × 5; needs a Dzongkha
# speaker's check). parent = (year, stem prefix) of the real BCSE question a twin is based on.
BATCH = "pe-batch-5"
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
           "Imagine a school canteen where nothing on the menu has changed, yet students begin choosing more fruit and fewer "
           "fried snacks. The only difference is where the food is placed: the fruit now sits at eye level near the till, "
           "while the snacks have moved to a lower shelf at the back. Nobody has been told what to eat, and every choice is "
           "still free.\n\n"
           "Economists who study behaviour call this kind of arrangement a “nudge”. Their argument is that people rarely make "
           "decisions in a vacuum; the way options are presented — what comes first, what is easiest to reach, what happens "
           "if we do nothing — quietly shapes what we choose. A form that enrols workers in a savings plan unless they opt "
           "out, for example, produces far more savers than one that asks them to opt in, although the choice is identical.\n\n"
           "Critics worry that nudges can be used to manipulate people. Supporters reply that some arrangement is unavoidable: "
           "food must be placed somewhere, and a form must have a default. The real question, they say, is whether those who "
           "design choices do so openly and in people’s own interest.\n\n")
PQ = [
    ("Why did the students in the canteen choose more fruit?", ["The fruit was placed where it was easiest to see and reach", "Fried snacks were banned", "The fruit became cheaper", "Teachers told them to eat fruit"], 0,
     "Only the placement changed: fruit at eye level near the till, snacks on a lower shelf at the back."),
    ("According to the passage, a “nudge” is", ["a rule that forbids certain choices", "a way of presenting choices that influences decisions without removing any option", "a reward for making healthy choices", "a tax on unhealthy food"], 1,
     "Nobody was told what to eat and “every choice is still free”, yet the arrangement shaped choices."),
    ("The phrase “in a vacuum” in the second paragraph most nearly means", ["in an empty room", "under pressure", "without any surrounding influence", "very quickly"], 2,
     "Deciding “in a vacuum” means deciding without being affected by surroundings or context."),
    ("Why does the savings-plan form that enrols workers automatically produce more savers?", ["It offers higher interest", "It is shorter", "It removes the choice to opt out", "Many people keep whatever happens if they do nothing"], 3,
     "The choice is identical; the difference is the default, which most people do not change."),
    ("What is the supporters’ main reply to the critics?", ["Some arrangement of choices cannot be avoided, so it should be designed openly and in people’s interest", "Nudges are never used to manipulate people", "People should not be given any choices", "Critics do not understand economics"], 0,
     "“Some arrangement is unavoidable… the real question is whether those who design choices do so openly and in people’s own interest.”"),
]
for i, (s, o, a, e) in enumerate(PQ, 1):
    add(ENG, "Comprehension", "standard", PASSAGE + s, o, a, e, passage="soma-b5-english", pos=i,
        parent=(2011, "Read the passage and answer the question."), kind="same_objective")

add(ENG, "Grammar", "standard", FILL + "The new director insisted ______ checking every file herself.", ["on", "at", "for", "to"], 0,
    "The verb “insist” is followed by “on” + -ing.", parent=(2011, "Choose the word or phrase that correctly completes the sentence.\n\nThe government"))
add(ENG, "Grammar", "advanced", FILL + "She is one of those officers who ______ always on time.", ["is", "are", "was", "has been"], 1,
    "“Who” refers to “those officers” (plural), so the verb is “are”.", parent=(2010, "Choose the word or phrase that will correctly complete the sentence.\n\nI asked the children"))
add(ENG, "Grammar", "advanced", FILL + "I would rather you ______ the report today than tomorrow.", ["submit", "will submit", "submitted", "had been submitting"], 2,
    "After “would rather + another subject”, the past form is used for a present or future wish: “I would rather you submitted…”.")
add(ENG, "Grammar", "standard", FILL + "Had I known about the meeting, I ______ it.", ["would attend", "will attend", "attended", "would have attended"], 3,
    "This is a third conditional with inversion: “Had I known…, I would have attended”.", parent=(2010, "Choose the word or phrase that will correctly complete the sentence.\n\nThe poverty rates"))
add(ENG, "Grammar", "standard", FILL + "Not only the students but also the teacher ______ present at the ceremony.", ["was", "were", "are", "have been"], 0,
    "With “not only … but also”, the verb agrees with the nearer subject, “the teacher” (singular).")
add(ENG, "Grammar", "standard", "Which sentence is grammatically correct?", ["The jury were divided in their opinions.", "The jury was divided in their opinions.", "The jury were divided in its opinions.", "The jury is dividing in its opinion."], 0,
    "When the members of a group act separately (divided opinions), the plural verb and “their” are used: “The jury were divided in their opinions.”")

add(ENG, "Vocabulary", "standard", "Which of the following usages of the word “fortuitous” is correct?",
    ["Their meeting in Paro was fortuitous; neither of them had planned it.", "He made a fortuitous plan for the whole year.", "The fortuitous building had twelve floors.", "She was fortuitous about her homework."], 0,
    "Fortuitous means happening by chance.", parent=(2010, "Which of the following usages of the word “tortuous” is correct?"))
add(ENG, "Vocabulary", "standard", "Which of the following makes a correct distinction between “complement” and “compliment”?",
    ["A complement completes something; a compliment is a remark of praise.", "A compliment completes something; a complement is a remark of praise.", "They mean the same thing.", "Complement is a verb only; compliment is a noun only."], 0,
    "A good sauce complements a dish; you pay someone a compliment.", parent=(2011, "Which of the following makes a correct distinction between “adverse” and “averse”?"))
add(ENG, "Vocabulary", "standard", "Which of the following makes a correct distinction between “stationary” and “stationery”?",
    ["Stationary means not moving; stationery means writing materials.", "Stationery means not moving; stationary means writing materials.", "Both mean writing materials.", "Both mean not moving."], 0,
    "A stationary bus is standing still; pens and paper are stationery.", parent=(2010, "Which of the following makes a correct distinction between the words “aggravate” and “irritate”"))
add(ENG, "Vocabulary", "standard", "What does “philatelist” mean?", ["A person who collects stamps", "A person who studies plants", "A lover of music", "A person who collects coins"], 0,
    "A philatelist collects and studies postage stamps (a coin collector is a numismatist).", parent=(2011, "What does “equestrian” mean?"))
add(ENG, "Vocabulary", "standard", "What does “altruistic” mean?", ["Showing unselfish concern for others", "Very ambitious", "Fond of travelling", "Easily angered"], 0,
    "An altruistic person helps others without expecting anything in return.", parent=(2011, "What does “equestrian” mean?"))
add(ENG, "Vocabulary", "standard", FILL + "The government took ______ measures to stop the disease from spreading.", ["stringent", "lenient", "frivolous", "casual"], 0,
    "Stringent means strict and precise; the situation needs strict measures.", parent=(2011, "Choose the word that correctly completes the sentence.\n\nThe geographical terrain"))
add(ENG, "Vocabulary", "standard", FILL + "His explanation was so ______ that nobody in the room could follow it.", ["convoluted", "lucid", "concise", "simple"], 0,
    "Convoluted means extremely complicated and difficult to follow.", parent=(2010, "Choose the word that will correctly complete the sentence.\n\nCultivation is"))

for sent, right, wrong, exp in [
    ("New irrigation channels will AMELIORATE the problems of the farmers.", "improve", ["worsen", "hide", "create"], "To ameliorate is to make something better."),
    ("He gave a PERFUNCTORY answer and left the room.", "hasty and careless", ["thoughtful", "angry", "detailed"], "Perfunctory means done without care or interest, as a duty."),
    ("The storm began to ABATE by the evening.", "lessen", ["strengthen", "begin", "return"], "To abate is to become less intense."),
]:
    add(ENG, "Synonyms", "standard", CW + sent, [right] + wrong, 0, exp, parent=(2011, "Choose the word closest in meaning to the word in capitals."))
for w, right, wrong, exp in [
    ("lucrative", "profitable", ["dangerous", "boring", "temporary"], "A lucrative job or business makes a lot of money."),
    ("dearth", "shortage", ["death", "plenty", "delay"], "A dearth is a lack or scarcity of something."),
    ("candour", "frankness", ["fear", "kindness", "pride"], "Candour is the quality of being open and honest."),
]:
    add(ENG, "Synonyms", "standard", f"Which of the following words has the same meaning as “{w}”?", [right] + wrong, 0, exp,
        parent=(2010, "Which of the following words has the same meaning as “disparage”?"))
for w, right, wrong, exp in [
    ("zenith", "nadir", ["peak", "summit", "climax"], "The zenith is the highest point; the nadir is the lowest."),
    ("prolific", "unproductive", ["fruitful", "creative", "abundant"], "Prolific means producing a lot."),
    ("austere", "luxurious", ["strict", "plain", "severe"], "Austere means very plain and simple; luxurious is the opposite."),
    ("magnanimous", "petty", ["generous", "noble", "forgiving"], "Magnanimous means generous and forgiving; petty means small-minded."),
    ("nebulous", "clear", ["vague", "hazy", "cloudy"], "Nebulous means unclear or vague."),
    ("gregarious", "unsociable", ["friendly", "outgoing", "sociable"], "Gregarious means fond of company."),
]:
    add(ENG, "Antonyms", "standard", f"Which of the following words has the opposite meaning of “{w}”?", [right] + wrong, 0, exp,
        parent=(2011, "Which of the following words has the opposite meaning of “presumptuous”?"))

# ======================= APTITUDE (30) =======================
A = APT
add(A, "Ordering and ranking", "standard", "In a queue, Pema is 8th from the front and 13th from the back. How many people are in the queue?", ["20", "21", "19", "22"], 0,
    "8 + 13 − 1 = 20 (Pema is counted twice).", parent=(2011, "In a horse race"))
add(A, "Ordering and ranking", "standard", "Dorji is heavier than Sonam. Tashi is lighter than Sonam but heavier than Pema. Who is the lightest?", ["Pema", "Tashi", "Sonam", "Dorji"], 0,
    "Dorji > Sonam > Tashi > Pema.", parent=(2010, "Karma is heavier than Sonam"))
add(A, "Ordering and ranking", "standard", "Four friends sit in a row. Dawa is at the left end. Chimi sits between Dawa and Ap. Bumpa sits to the right of Ap. Who is at the right end?", ["Bumpa", "Ap", "Chimi", "Dawa"], 0,
    "Left to right: Dawa, Chimi, Ap, Bumpa.", parent=(2010, "Four defenders, A, B, C and D"))
add(A, "Odd one out", "foundation", "Which of these places is the odd one out?", ["Phuentsholing", "Paro", "Punakha", "Haa"], 0,
    "Paro, Punakha and Haa are dzongkhags; Phuentsholing is a town (in Chhukha Dzongkhag).", parent=(2010, "Which letter combination is the odd one out?"))
add(A, "Percentages", "foundation", "A jacket marked at Nu. 1,200 is sold at a 15% discount. What is the selling price?", ["Nu. 1,020", "Nu. 1,080", "Nu. 1,050", "Nu. 1,185"], 0,
    "15% of 1,200 = 180; 1,200 − 180 = Nu. 1,020.")
add(A, "Percentages", "foundation", "15% of a number is 45. What is the number?", ["300", "675", "450", "250"], 0, "45 ÷ 0.15 = 300.", parent=(2011, "3 is 80% of what number?"))
add(A, "Percentages", "foundation", "The population of a village rose from 800 to 920. What is the percentage increase?", ["15%", "12%", "13%", "120%"], 0,
    "Increase = 120; 120 ÷ 800 × 100 = 15%.", parent=(2011, "The value of a company share drops"))
add(A, "Rates and cost", "standard", "Find the simple interest on Nu. 12,000 at 10% per year for 2½ years.", ["Nu. 3,000", "Nu. 2,400", "Nu. 2,500", "Nu. 3,600"], 0,
    "12,000 × 10 × 2.5 ÷ 100 = Nu. 3,000.")
add(A, "Averages", "standard", "The average age of 6 students is 15 years. When their teacher joins them, the average becomes 16 years. How old is the teacher?", ["22", "16", "21", "25"], 0,
    "7 × 16 − 6 × 15 = 112 − 90 = 22.", parent=(2011, "The average age of a group of 5 students"))
add(A, "Fractions", "standard", "Dema needs 3/4 cup of flour for bread and 2/3 cup for a cake. She has 1½ cups. Which is true?", ["She has enough, with 1/12 cup left over", "She is short by 1/12 cup", "She has exactly enough", "She is short by 1/6 cup"], 0,
    "3/4 + 2/3 = 17/12 cups; 1½ = 18/12, so 1/12 cup is left.", parent=(2010, "Dema needs to bake a cake"))
add(A, "Fractions", "foundation", "What is 2/5 of 3/4 of 400?", ["120", "150", "160", "300"], 0, "3/4 of 400 = 300; 2/5 of 300 = 120.", parent=(2010, "What is 1/4 of half of 1/5 of 200?"))
add(A, "Ratio and proportion", "foundation", "Nu. 900 is shared among three friends in the ratio 2 : 3 : 4. How much does the third friend get?", ["Nu. 400", "Nu. 300", "Nu. 450", "Nu. 360"], 0,
    "900 ÷ 9 = 100 per part; 4 × 100 = Nu. 400.", parent=(2011, "There are 24 students in a class"))
add(A, "Number series", "standard", "Which number comes next in the series?\n\n4, 9, 19, 39, 79, ?", ["159", "158", "160", "119"], 0,
    "Each term is doubled and 1 is added: 79 × 2 + 1 = 159.", parent=(2010, "Which number comes next in the series?"))
add(A, "Number series", "standard", "Which number comes next in the series?\n\n3, 6, 11, 18, 27, ?", ["38", "36", "37", "39"], 0,
    "The differences are 3, 5, 7, 9, so the next is 11: 27 + 11 = 38.", parent=(2010, "Which number comes next in the series?"))
add(A, "Number patterns", "advanced", "If:\n2, 5 = 29\n3, 4 = 25\n6, 1 = 37\nthen 4, 3 = ?", ["25", "12", "19", "49"], 0,
    "Rule: square both numbers and add. 4 + 25 = 29, 9 + 16 = 25, 36 + 1 = 37, so 16 + 9 = 25.", parent=(2011, "If:\n2, 3 = 10"))
add(A, "Letter series", "standard", "Which letter comes next in this series?\n\nb  d  g  k  p  ?", ["v", "u", "w", "t"], 0,
    "The gaps grow by one: +2, +3, +4, +5, +6. p (16) + 6 = v (22).", parent=(2011, "What is the missing letter in this series?\n\nb  e  h"))
add(A, "Letter series", "foundation", "Which letter comes next in this series?\n\nz  x  v  t  r  ?", ["p", "q", "o", "s"], 0,
    "The letters go back by two each time: r − 2 = p.", parent=(2011, "What is the missing letter in this series?\n\na  z  b"))
add(A, "Letter series", "foundation", "Which letter comes next in this series?\n\na  b  x  c  d  x  e  f  x  ?", ["g", "x", "h", "e"], 0,
    "Pairs of letters in order (ab, cd, ef) each followed by x; next is g.", parent=(2011, "What is the missing letter in this series?\n\ng  ?  d"))
add(A, "Analogies", "standard", "Which choice makes the best comparison?\n\nBHUTAN is to NATUHB as 724193 is to:", ["391427", "391472", "724391", "193724"], 0,
    "NATUHB is BHUTAN written backwards; 724193 backwards is 391427.", parent=(2011, "Which choice makes the best comparison?\n\nPEACH"))
add(A, "Analogies", "foundation", "Which choice makes the best comparison?\n\nJudge is to court as farmer is to:", ["Field", "Crop", "Tractor", "Village"], 0,
    "A judge works in a court; a farmer works in a field.", parent=(2011, "Which choice makes the best comparison?\n\nFingers"))
add(A, "Word puzzles", "foundation", "If you unscramble the letters ELPAP, you get the name of a:", ["Fruit", "Country", "Animal", "Colour"], 0, "ELPAP unscrambles to APPLE.", parent=(2011, "If you unscramble the letters YKANE"))
add(A, "Word puzzles", "foundation", "If you unscramble the letters ANHIC, you get the name of a:", ["Country", "Fruit", "River", "Bird"], 0, "ANHIC unscrambles to CHINA.", parent=(2011, "If you unscramble the letters ITNKA"))
add(A, "Counting", "standard", "Eight people meet, and each person shakes hands once with every other person. How many handshakes are there?", ["28", "56", "64", "16"], 0,
    "8 × 7 ÷ 2 = 28.", parent=(2010, "Five teams from Thimphu"))
add(A, "Counting", "standard", "How many two-digit numbers can be made from the digits 1, 2, 3 and 4 if no digit is repeated?", ["12", "16", "8", "24"], 0,
    "4 choices for the tens digit × 3 for the units digit = 12.", parent=(2011, "In how many ways can the letters of SOLVING"))
add(A, "Logical puzzles", "advanced", "In a family, each son has as many brothers as sisters, and each daughter has twice as many brothers as sisters. How many sons and daughters are there?",
    ["4 sons and 3 daughters", "3 sons and 4 daughters", "3 sons and 3 daughters", "5 sons and 2 daughters"], 0,
    "With 4 sons and 3 daughters: a son has 3 brothers and 3 sisters; a daughter has 4 brothers and 2 sisters (twice as many).", parent=(2011, "Pema Dorji and Kesang Choden are two children"))
add(A, "Logical puzzles", "foundation", "All teachers in the school are graduates. Pema is a teacher in the school. Which statement must be true?", ["Pema is a graduate.", "All graduates are teachers.", "Pema is not a graduate.", "Some teachers are not graduates."], 0,
    "If every teacher there is a graduate and Pema is one of those teachers, Pema must be a graduate.")
add(A, "Directions", "foundation", "From his house, Tashi walks 5 km east, then 3 km north, then 5 km west. Where is he now from his house?", ["3 km north", "3 km south", "5 km east", "8 km north-west"], 0,
    "The east and west walks cancel out, leaving 3 km north.", parent=(2010, "Which two statements are needed"))
add(A, "Time and calendars", "foundation", "A meeting starts at 10:45 AM and lasts 2 hours 35 minutes. When does it end?", ["1:20 PM", "1:10 PM", "12:80 PM", "1:30 PM"], 0,
    "10:45 + 2 h = 12:45; + 35 min = 1:20 PM.", parent=(2010, "I am a time of the day"))
add(A, "Quantitative comparison", "advanced", "If x < 0, compare Column A and Column B.\n\nColumn A: x²\nColumn B: x³", ["Column A is greater", "Column B is greater", "The two quantities are equal", "The relationship cannot be determined"], 0,
    "For a negative x, x² is positive and x³ is negative, so Column A is greater.", parent=(2010, "If y > 2, compare Column A and Column B."))
add(A, "General awareness", "standard", "Which of the following best describes the difference between inflation and deflation?",
    ["Inflation is a general rise in prices; deflation is a general fall in prices.", "Inflation is a fall in prices; deflation is a rise in prices.", "Inflation affects only food; deflation affects only fuel.", "They are two names for the same thing."], 0,
    "Inflation means the general price level is rising; deflation means it is falling.", parent=(2010, "Which of the following best describes the difference between Gross Domestic Product"))

# ======================= DATA INTERPRETATION (30) =======================
V = "Study the bar chart (illustrative figures) and answer the question.\n\n"
IMG = "/papers/soma/b5-apples.png"
add(DI, "Bar charts", "foundation", V + "Which dzongkhag sold fewer apples in 2023 than in 2022?", ["Thimphu", "Paro", "Haa", "Bumthang"], 0, "Thimphu fell from 25 to 20 tonnes; the others rose.", image=IMG)
add(DI, "Bar charts", "foundation", V + "How many tonnes of apples did the four dzongkhags sell in 2023?", ["123", "110", "118", "128"], 0, "46 + 20 + 21 + 36 = 123 tonnes.", image=IMG)
add(DI, "Bar charts", "standard", V + "Which dzongkhag had the largest percentage increase in apple sales?", ["Haa", "Paro", "Bumthang", "Thimphu"], 0, "Haa +40% (15→21), Bumthang +20%, Paro +15%; Thimphu fell.", image=IMG)
add(DI, "Bar charts", "foundation", V + "What were the average apple sales per dzongkhag in 2022?", ["27.5 tonnes", "30 tonnes", "25 tonnes", "28.5 tonnes"], 0, "(40 + 25 + 15 + 30) ÷ 4 = 110 ÷ 4 = 27.5 tonnes.", image=IMG)
add(DI, "Bar charts", "foundation", V + "In 2023, how many more tonnes did Bumthang sell than Haa?", ["15", "6", "9", "16"], 0, "36 − 21 = 15 tonnes.", image=IMG)
L = "Study the line graph (illustrative figures) and answer the question.\n\n"
IMG = "/papers/soma/b5-temperature.png"
add(DI, "Line charts", "foundation", L + "How much warmer was Phuentsholing than Thimphu in March?", ["12 °C", "10 °C", "22 °C", "8 °C"], 0, "22 − 10 = 12 °C.", image=IMG)
add(DI, "Line charts", "standard", L + "Between which two months did Thimphu’s temperature rise the most?", ["February to March", "January to February", "March to April", "May to June"], 0, "Rises: +2, +4, +3, +3, +2. February to March (+4) is the largest.", image=IMG)
add(DI, "Line charts", "standard", L + "What was Phuentsholing’s average temperature over the six months (to one decimal place)?", ["22.7 °C", "22.0 °C", "23.5 °C", "21.8 °C"], 0, "(16 + 18 + 22 + 25 + 27 + 28) ÷ 6 = 136 ÷ 6 ≈ 22.7 °C.", image=IMG)
add(DI, "Line charts", "standard", L + "In how many of the six months was Phuentsholing at least 10 °C warmer than Thimphu?", ["6", "5", "4", "3"], 0, "Differences: 12, 12, 12, 12, 11, 10. All six are at least 10 °C.", image=IMG)
add(DI, "Line charts", "foundation", L + "Thimphu’s June temperature was how many times its January temperature?", ["4.5 times", "4 times", "3 times", "14 times"], 0, "18 ÷ 4 = 4.5.", image=IMG)
P = "Study the pie chart and answer the question.\n\n"
IMG = "/papers/soma/b5-landuse.png"
add(DI, "Pie charts", "foundation", P + "How many acres of the village are forest?", ["160", "140", "40", "200"], 0, "40% of 400 = 160 acres.", image=IMG)
add(DI, "Pie charts", "standard", P + "What angle at the centre does the Houses slice make?", ["36°", "40°", "10°", "54°"], 0, "10% of 360° = 36°.", image=IMG)
add(DI, "Pie charts", "standard", P + "How many more acres are farmland than pasture?", ["80", "20", "60", "100"], 0, "35% − 15% = 20% of 400 = 80 acres.", image=IMG)
add(DI, "Pie charts", "standard", P + "If a quarter of the forest is cleared, how many acres of forest remain?", ["120", "40", "100", "150"], 0, "Forest = 160 acres; a quarter is 40; 160 − 40 = 120 acres.", image=IMG)
add(DI, "Pie charts", "foundation", P + "What is the ratio of forest to houses?", ["4 : 1", "1 : 4", "2 : 1", "8 : 1"], 0, "40% : 10% = 4 : 1.", image=IMG)
B = "Study the bar chart (illustrative figures) and answer the question.\n\n"
IMG = "/papers/soma/b5-colleges.png"
add(DI, "Bar charts", "foundation", B + "How many students are there in the five colleges altogether?", ["6,000", "600", "5,400", "6,600"], 0, "18 + 12 + 9 + 15 + 6 = 60 hundred = 6,000.", image=IMG)
add(DI, "Bar charts", "standard", B + "What percentage of all the students are in College A?", ["30%", "18%", "25%", "36%"], 0, "18 ÷ 60 × 100 = 30%.", image=IMG)
add(DI, "Bar charts", "foundation", B + "How many colleges have more than 1,000 students?", ["3", "2", "4", "5"], 0, "A (1,800), B (1,200) and D (1,500). C has 900 and E 600.", image=IMG)
add(DI, "Bar charts", "foundation", B + "What is the ratio of students in College A to College E?", ["3 : 1", "2 : 1", "6 : 1", "1 : 3"], 0, "18 : 6 = 3 : 1.", image=IMG)
add(DI, "Bar charts", "foundation", B + "How many more students does College B have than College C?", ["300", "3", "30", "1,200"], 0, "(12 − 9) hundred = 300 students.", image=IMG)
S = "Study the graph (illustrative figures) and answer the question.\n\n"
IMG = "/papers/soma/b5-study.png"
add(DI, "Line and scatter charts", "foundation", S + "What mark did a student who studied 4 hours a day get?", ["63", "55", "70", "60"], 0, "The point at 4 hours shows 63.", image=IMG)
add(DI, "Line and scatter charts", "foundation", S + "By how many marks did the score rise from 1 hour to 6 hours of study?", ["38", "78", "40", "36"], 0, "78 − 40 = 38 marks.", image=IMG)
add(DI, "Line and scatter charts", "standard", S + "On average, how many marks were gained for each extra hour of study (to one decimal place)?", ["7.6", "6.3", "8.0", "7.0"], 0, "38 marks over 5 extra hours = 7.6.", image=IMG)
add(DI, "Line and scatter charts", "foundation", S + "What does the graph show about hours studied and marks?", ["More hours studied go with higher marks", "More hours studied go with lower marks", "There is no link", "Marks stay the same"], 0, "The line rises steadily: a positive relationship.", image=IMG)
add(DI, "Line and scatter charts", "standard", S + "Estimate the mark for 3½ hours of study.", ["About 59", "About 52", "About 65", "About 70"], 0, "Halfway between 55 (3 h) and 63 (4 h) is 59.", image=IMG)
TB = ("The table shows bus fares from Thimphu (illustrative figures).\n\n"
      "| To | Distance (km) | Fare (Nu.) |\n|---|---|---|\n| Paro | 55 | 75 |\n| Punakha | 72 | 105 |\n| Phuentsholing | 160 | 240 |\n| Bumthang | 270 | 400 |\n\n")
add(DI, "Tables", "standard", TB + "Which route has the lowest fare per kilometre?", ["Thimphu–Paro", "Thimphu–Punakha", "Thimphu–Phuentsholing", "Thimphu–Bumthang"], 0, "Per km: Paro 1.36, Punakha 1.46, Bumthang 1.48, Phuentsholing 1.50.")
add(DI, "Tables", "foundation", TB + "How much does a return trip from Thimphu to Punakha cost?", ["Nu. 210", "Nu. 105", "Nu. 180", "Nu. 144"], 0, "2 × 105 = Nu. 210.")
add(DI, "Tables", "foundation", TB + "How much more is the fare to Phuentsholing than to Paro?", ["Nu. 165", "Nu. 105", "Nu. 185", "Nu. 315"], 0, "240 − 75 = Nu. 165.")
add(DI, "Tables", "standard", TB + "About how much does the Bumthang fare cost per kilometre?", ["Nu. 1.48", "Nu. 1.35", "Nu. 2.70", "Nu. 0.68"], 0, "400 ÷ 270 ≈ Nu. 1.48.")
add(DI, "Tables", "foundation", TB + "If all fares rise by 10%, what will the fare to Phuentsholing be?", ["Nu. 264", "Nu. 250", "Nu. 254", "Nu. 280"], 0, "240 × 1.1 = Nu. 264.")

# ======================= DZONGKHA (30) — a Dzongkha speaker must check before publishing =======================
DZP = ("ཚིག་ཚན་འདི་ལྷག་སྟེ་ དྲི་བ་ལུ་ལན་བྲིས།\n\n(Read the passage and answer the question.)\n\n"
       "པདྨ་ བུམ་ཐང་ལུ་ སྡོདཔ་ཨིན། ཁོ་ ཞིང་ཁ་ནང་ ལཱ་འབདཝ་ཨིན། ཁོ་ལུ་ བ་གསུམ་དང་ རྟ་གཅིག་ཡོད། "
       "ཁོའི་ཡུལ་ཁར་ ལོ་ལྟར་ ཚེས་བཅུ་ཡོདཔ་ཨིན། ཚེས་བཅུ་ནང་ མི་ཚུ་ འཆམ་བལྟ་བར་ འོངམ་ཨིན།\n\n")
for i, (s, en, o, a, exp) in enumerate([
    ("པདྨ་ ག་ཏེ་ སྡོདཔ་སྨོ?", "Where does Pema live?", ["བུམ་ཐང", "སྤ་རོ", "ཐིམ་ཕུ", "ཧཱ"], 0, "The passage says Pema lives in Bumthang (བུམ་ཐང)."),
    ("པདྨ་ ག་ཏེ་ ལཱ་འབདཝ་སྨོ?", "Where does Pema work?", ["ཞིང་ཁ་ནང", "སློབ་གྲྭ་ནང", "ཚོང་ཁང་ནང", "སྨན་ཁང་ནང"], 0, "He works in the field (ཞིང་ཁ་ནང)."),
    ("པདྨ་ལུ་ བ་ ག་དེམ་ཅིག་ཡོད་ག?", "How many cows does Pema have?", ["གསུམ", "གཅིག", "གཉིས", "བཞི"], 0, "He has three cows (བ་གསུམ)."),
    ("ཁོའི་ཡུལ་ཁར་ ལོ་ལྟར་ ག་ཅི་ཡོདཔ་སྨོ?", "What happens in his village every year?", ["ཚེས་བཅུ", "ལོ་གསར", "འཛོམས་ཚོགས", "རྩེད་འགྲན"], 0, "There is a tshechu (ཚེས་བཅུ) every year."),
    ("ཚེས་བཅུ་ནང་ མི་ཚུ་ ག་ཅི་ བལྟ་བར་ འོངམ་སྨོ?", "What do people come to watch at the tshechu?", ["འཆམ", "རྩེད་མོ", "གློག་བརྙན", "ཚོང"], 0, "People come to watch the mask dances (འཆམ)."),
], 1):
    add(DZ, "Comprehension", "foundation", DZP + s + f"\n\n({en})", o, a, exp, passage="soma-b5-dzongkha", pos=i,
        parent=(2011, "Read the passage and the question in the picture"), kind="same_objective")
for w, h, wrong, en, pg in [
    ("བགོ་སྐལ", "སྐུ་སྐལ", ["ཞལ་སྐལ", "ཕྱག་སྐལ", "དབུ་སྐལ"], "share, portion", 146),
    ("ཆོ་ག", "གསུང་ཆོག", ["སྐུ་ཆོག", "ཕྱག་ཆོག", "ཞལ་ཆོག"], "ritual", 258),
    ("བྱེལཝ", "ཐུགས་བྱེལ", ["སྐུ་བྱེལ", "ཞལ་བྱེལ", "ཕྱག་བྱེལ"], "busyness, hassle", 616),
    ("སྐེ་རྒྱན", "མགུལ་རྒྱན", ["ཕྱག་རྒྱན", "དབུ་རྒྱན", "ཞལ་རྒྱན"], "necklace", 36),
    ("འབད་ཐངས", "མཛད་ཐངས", ["གནང་ཐངས", "བཞེས་ཐངས", "གསུང་ཐངས"], "way of doing, method", 637),
    ("ཁ་མང", "ཞལ་མང", ["ཕྱག་མང", "སྐུ་མང", "དབུ་མང"], "talkative", 62),
    ("སྐྱེས་ལྷ", "འཁྲུངས་ལྷ", ["སྐུ་ལྷ", "ཞལ་ལྷ", "ཕྱག་ལྷ"], "birth deity", 45),
    ("ཆུ་འཁྱུ་ས", "ཁྲུས་ཁང", ["གཟིམ་ཁང", "གསོལ་ཁང", "ཞལ་ཁང"], "bathing place", 250),
]:
    add(DZ, "Honorific words (ཞེ་ས)", "standard", f"“{w}” ཟེར་བའི་ཚིག་དེ་གི་ ཞེ་ས་ ག་ཅི་སྨོ?\n\n(Which is the honorific form of “{w}”?)", [h] + wrong, 0,
        f"“{w}” means {en}; its honorific (ཞེ་ས) is “{h}”. Source: DDC Dzongkha–English Dictionary, p. {pg}.")
for w, o, wrong, en, pg in [
    ("སྐུ་རྒྱབ", "སྐུ་མདུན", ["སྐུ་སྟོད", "སྐུ་སྨད", "སྐུ་གཡས"], "behind (honorific) / in front (honorific)", 32),
    ("ཁམས་དྭངས་ཏོག་ཏོ", "ཁམས་ལོག་སི་སི", ["ཁམས་བཟང་", "ཁམས་ལེགས་", "ཁམས་བདེ་"], "feeling fresh and well / feeling unwell", 67),
    ("སྟུག་པོ", "སྲབ", ["མཐུག", "ལྕི", "སྦོམ"], "thick / thin", 340),
    ("ཆུང", "ཆེ", ["ཆུང་ཀུ", "ཆུང་བ", "ཉུང"], "small / big", 255),
    ("དམའ་ས", "མཐོ་ས", ["ཐུར་ས", "དམའ་ཤོས", "གཤམ"], "low place / high place", 708),
    ("མོ་གདོང", "ཕོ་གདོང", ["མོ་རྐྱང", "བུ་གདོང", "མི་གདོང"], "female look / male look", 698),
    ("བཙུགས", "བཏོན", ["བཙུགས་ཡོད", "བཞག", "བསྐྱལ"], "put in, plant / take out", 727),
    ("མེད", "ཡོད", ["མིན", "མི", "མ"], "is not / is", 695),
]:
    add(DZ, "Opposites (འགལ་མིང)", "foundation" if w in ("ཆུང", "མེད") else "standard", f"“{w}” ཟེར་བའི་ཚིག་དེ་གི་ འགལ་མིང་ ག་ཅི་སྨོ?\n\n(Which word is the opposite of “{w}”?)", [o] + wrong, 0,
        f"“{w}” and “{o}” are opposites ({en}). Source: DDC Dzongkha–English Dictionary, p. {pg}.")
for w, en, wrong in [
    ("ཆུ", "Water", ["Fire", "Wind", "Earth"]),
    ("མེ", "Fire", ["Water", "Smoke", "Light"]),
    ("རི", "Mountain", ["River", "Valley", "Forest"]),
    ("ཤིང", "Tree, wood", ["Stone", "Grass", "Flower"]),
    ("ཁྱི", "Dog", ["Cat", "Horse", "Cow"]),
    ("ཟླ་བ", "Moon, month", ["Sun, day", "Star", "Year"]),
    ("ཉི་མ", "Sun", ["Moon", "Star", "Cloud"]),
    ("ལམ", "Road, path", ["Bridge", "House", "Field"]),
    ("ཁྱིམ", "House, home", ["School", "Temple", "Shop"]),
]:
    add(DZ, "Vocabulary", "foundation", f"What does the Dzongkha word “{w}” mean?\n\n(“{w}” ཟེར་བའི་ཚིག་དེ་གི་ དོན་ ག་ཅི་སྨོ?)", [en] + wrong, 0, f"“{w}” means {en.lower()}.")


# ---- correct answer at a random place in each question (seeded; no A-B-C-D pattern)
def _balance():
    import random
    for k, x in enumerate(Q):
        rng = random.Random(f"{BATCH}-{k}-{x['stem'][:40]}")
        right = x["opts"][x["ans"]]
        rng.shuffle(x["opts"])
        x["ans"] = x["opts"].index(right)


_balance()


def check_batch5():
    from fractions import Fraction as F
    a, b = [40, 25, 15, 30], [46, 20, 21, 36]
    assert sum(b) == 123 and sum(a) / 4 == 27.5 and 36 - 21 == 15
    inc = {k: (y - x) / x for k, x, y in zip(["Paro", "Thimphu", "Haa", "Bumthang"], a, b)}
    assert max(inc, key=inc.get) == "Haa" and min(inc, key=inc.get) == "Thimphu"
    t, p = [4, 6, 10, 13, 16, 18], [16, 18, 22, 25, 27, 28]
    rises = [t[i + 1] - t[i] for i in range(5)]
    assert p[2] - t[2] == 12 and rises.index(max(rises)) == 1 and round(sum(p) / 6, 1) == 22.7 and all(y - x >= 10 for x, y in zip(t, p)) and 18 / 4 == 4.5
    assert 400 * .4 == 160 and 360 * .1 == 36 and 400 * .2 == 80 and 160 * .75 == 120
    c = [18, 12, 9, 15, 6]
    assert sum(c) * 100 == 6000 and 18 / 60 == .3 and sum(v > 10 for v in c) == 3 and (12 - 9) * 100 == 300
    m = [40, 48, 55, 63, 70, 78]
    assert m[5] - m[0] == 38 and 38 / 5 == 7.6 and (55 + 63) / 2 == 59
    fares = {"Paro": (55, 75), "Punakha": (72, 105), "Phuentsholing": (160, 240), "Bumthang": (270, 400)}
    assert min(fares, key=lambda k: fares[k][1] / fares[k][0]) == "Paro" and round(400 / 270, 2) == 1.48 and round(240 * 1.1) == 264 and 240 - 75 == 165
    assert 8 + 13 - 1 == 20 and 1200 * .85 == 1020 and round(45 / .15) == 300 and 120 / 800 == .15 and 12000 * 10 * 2.5 / 100 == 3000
    assert 7 * 16 - 6 * 15 == 22 and F(3, 4) + F(2, 3) == F(17, 12) and F(3, 2) - F(17, 12) == F(1, 12) and 400 * F(3, 4) * F(2, 5) == 120
    assert 900 // 9 * 4 == 400 and 79 * 2 + 1 == 159 and 27 + 11 == 38 and 4 ** 2 + 3 ** 2 == 25 and chr(ord("p") + 6) == "v" and chr(ord("r") - 2) == "p"
    assert "724193"[::-1] == "391427" and sorted("ELPAP") == sorted("APPLE") and sorted("ANHIC") == sorted("CHINA")
    assert 8 * 7 // 2 == 28 and 4 * 3 == 12 and (4 - 1 == 3 and 3 == 3) and (4 == 2 * (3 - 1))
    assert len(Q) == 120 and all(len(set(x["opts"])) == 4 for x in Q)


check_batch5()
