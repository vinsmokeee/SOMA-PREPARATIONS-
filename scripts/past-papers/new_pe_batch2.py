# New PE practice questions, batch 2 (written by Claude, 18 Nov 2026), modelled on the BCSE PE 2010/2011 papers.
# Every numeric answer is re-computed in check_batch2() below. Figures in data sets are illustrative.
ENG, APT, DI = "english", "aptitude", "data"


def E(topic, diff, stem, opts, ans, exp):
    return dict(sec=ENG, topic=topic, diff=diff, stem=stem, opts=opts, ans=ans, exp=exp)


def A(topic, diff, stem, opts, ans, exp):
    return dict(sec=APT, topic=topic, diff=diff, stem=stem, opts=opts, ans=ans, exp=exp)


def D(topic, diff, stem, opts, ans, exp):
    return dict(sec=DI, topic=topic, diff=diff, stem=stem, opts=opts, ans=ans, exp=exp)


CW = "Choose the word closest in meaning to the word in capitals.\n\n"
FILL = "Choose the correct word to complete the sentence.\n\n"
Q = [
 # ---------------- English (20) ----------------
 E("Synonyms", "foundation", CW + "The old lady was known for her BENEVOLENT nature.", ["Cruel", "Kind", "Wealthy", "Clever"], 1,
   "Benevolent means kind and wanting to help others."),
 E("Synonyms", "standard", CW + "The engineer kept METICULOUS records of the work.", ["Careless", "Brief", "Very careful", "Secret"], 2,
   "Meticulous means showing great attention to detail; very careful."),
 E("Synonyms", "standard", CW + "She gave a CANDID answer to the panel.", ["Frank", "Rude", "Confused", "Short"], 0,
   "Candid means honest and direct; frank."),
 E("Antonyms", "foundation", "Which word has the opposite meaning of “scarce”?", ["Rare", "Limited", "Plentiful", "Costly"], 2,
   "Scarce means not enough; the opposite is plentiful. Rare and limited are close in meaning to scarce."),
 E("Antonyms", "standard", "Which word has the opposite meaning of “transparent”?", ["Clear", "Opaque", "Bright", "Visible"], 1,
   "Transparent means you can see through it; opaque means you cannot."),
 E("Antonyms", "foundation", "Which word has the opposite meaning of “humble”?", ["Modest", "Polite", "Simple", "Arrogant"], 3,
   "Humble means modest; the opposite is arrogant (thinking too highly of oneself)."),
 E("Grammar", "standard", FILL + "Each of the students ______ given a certificate.", ["were", "was", "are", "have been"], 1,
   "“Each” is singular, so it takes a singular verb: “Each of the students was given…”."),
 E("Grammar", "standard", FILL + "I look forward to ______ you at the interview.", ["meet", "met", "meeting", "be meeting"], 2,
   "In “look forward to”, “to” is a preposition, so it is followed by the -ing form: “look forward to meeting”."),
 E("Grammar", "standard", FILL + "He is senior ______ me in the office.", ["than", "to", "from", "over"], 1,
   "Senior, junior, superior and inferior are followed by “to”, not “than”."),
 E("Grammar", "standard", FILL + "By the time we reached the hall, the meeting ______.", ["has started", "started", "had started", "starts"], 2,
   "The meeting started before we reached the hall: the earlier past action uses the past perfect, “had started”."),
 E("Grammar", "standard", "Choose the correct passive form of: “The committee approved the plan.”",
   ["The plan is approved by the committee.", "The plan was approved by the committee.", "The plan has approved the committee.", "The plan was approving by the committee."], 1,
   "Simple past active (approved) becomes simple past passive: was + past participle → “The plan was approved by the committee.”"),
 E("Grammar", "standard", "Choose the correct indirect speech of: He said, “I am tired.”",
   ["He said that he is tired.", "He said that I was tired.", "He said that he was tired.", "He says that he was tired."], 2,
   "With a past reporting verb (said), “am” changes to “was” and “I” changes to “he”."),
 E("Vocabulary", "standard", "Which of these four words is spelt correctly?", ["Neccessary", "Necessary", "Necesary", "Neccesary"], 1,
   "Necessary has one c and double s: n-e-c-e-s-s-a-r-y."),
 E("Vocabulary", "standard", "What does the idiom “to hit the nail on the head” mean?",
   ["To hurt someone", "To say exactly the right thing", "To work very hard", "To make a mistake"], 1,
   "To hit the nail on the head is to describe exactly what is causing a situation or problem."),
 E("Vocabulary", "foundation", "What does the idiom “once in a blue moon” mean?", ["Every night", "Very rarely", "At midnight", "Very quickly"], 1,
   "Once in a blue moon means very rarely."),
 E("Vocabulary", "foundation", "Choose one word for: “a person who cannot read or write”.", ["Illegal", "Illiterate", "Illegible", "Ignorant"], 1,
   "Illiterate = unable to read or write. Illegible describes writing that cannot be read."),
 E("Vocabulary", "foundation", "Choose one word for: “a list of items to be discussed at a meeting”.", ["Minutes", "Agenda", "Memo", "Notice"], 1,
   "The agenda lists what will be discussed; the minutes record what was discussed."),
 E("Grammar", "standard", "Which sentence shows correct subject–verb agreement?",
   ["One of my friends live in Paro.", "One of my friend lives in Paro.", "One of my friends lives in Paro.", "One of my friend live in Paro."], 2,
   "“One of” is followed by a plural noun (friends), and the verb agrees with “one”: “lives”."),
 E("Grammar", "foundation", FILL + "He is ______ honest man.", ["a", "an", "the", "no article"], 1,
   "“Honest” begins with a vowel sound (the h is silent), so we use “an”."),
 E("Grammar", "foundation", FILL + "She is very good ______ mathematics.", ["in", "on", "at", "with"], 2,
   "We say “good at” a subject or skill."),

 # ---------------- Aptitude (20) ----------------
 A("Interest", "standard", "Find the simple interest on Nu. 20,000 at 8% per year for 3 years.", ["Nu. 4,200", "Nu. 4,800", "Nu. 5,000", "Nu. 5,400"], 1,
   "Simple interest = P × R × T ÷ 100 = 20,000 × 8 × 3 ÷ 100 = Nu. 4,800."),
 A("Interest", "standard", "Nu. 10,000 is deposited at 10% per year, compounded yearly. What is the amount after 2 years?", ["Nu. 12,000", "Nu. 12,100", "Nu. 12,200", "Nu. 11,000"], 1,
   "Year 1: 10,000 + 1,000 = 11,000. Year 2: 11,000 + 1,100 = Nu. 12,100."),
 A("Profit and loss", "foundation", "A shopkeeper buys a radio for Nu. 800 and sells it for Nu. 1,000. What is the profit percentage?", ["20%", "25%", "30%", "15%"], 1,
   "Profit = 200. Profit % = 200 ÷ 800 × 100 = 25% (always on the cost price)."),
 A("Profit and loss", "standard", "A chair is sold for Nu. 1,080 at a loss of 10%. What was its cost price?", ["Nu. 1,188", "Nu. 1,200", "Nu. 1,180", "Nu. 1,100"], 1,
   "Selling price = 90% of cost price, so cost price = 1,080 ÷ 0.9 = Nu. 1,200."),
 A("Percentages", "foundation", "A jacket marked Nu. 2,500 is sold at a 20% discount. What is the selling price?", ["Nu. 2,000", "Nu. 2,100", "Nu. 2,300", "Nu. 1,900"], 0,
   "Discount = 20% of 2,500 = 500. Selling price = 2,500 − 500 = Nu. 2,000."),
 A("Speed and distance", "standard", "A train 240 m long passes a pole in 12 seconds. What is its speed?", ["60 km/h", "72 km/h", "80 km/h", "86 km/h"], 1,
   "Speed = 240 ÷ 12 = 20 m/s. To change to km/h multiply by 18/5: 20 × 18 ÷ 5 = 72 km/h."),
 A("Work and time", "standard", "Pipe A can fill a tank in 4 hours. Pipe B can empty the full tank in 6 hours. If both are opened together on an empty tank, how long will it take to fill?",
   ["10 hours", "12 hours", "2.4 hours", "5 hours"], 1,
   "In one hour: 1/4 − 1/6 = 3/12 − 2/12 = 1/12 of the tank. So it takes 12 hours."),
 A("Ages", "standard", "A father is three times as old as his son. In 10 years he will be twice as old as his son. How old is the son now?", ["8 years", "10 years", "12 years", "15 years"], 1,
   "Let the son be s: 3s + 10 = 2(s + 10) → s = 10. Check: 30 and 10 now; 40 and 20 in 10 years."),
 A("Number series", "standard", "What number comes next?\n\n5, 11, 23, 47, ?", ["94", "95", "96", "71"], 1,
   "Each term is doubled and 1 is added: 47 × 2 + 1 = 95."),
 A("Number series", "standard", "What number comes next?\n\n2, 5, 10, 17, 26, ?", ["35", "36", "37", "38"], 2,
   "The terms are n² + 1: 1+1, 4+1, 9+1, 16+1, 25+1, so next is 36 + 1 = 37."),
 A("Number series", "standard", "What number comes next?\n\n120, 60, 20, 5, ?", ["1", "2", "0", "2.5"], 0,
   "Divide by 2, then 3, then 4, then 5: 5 ÷ 5 = 1."),
 A("Letter series", "standard", "Which letter comes next?\n\nA, C, F, J, O, ?", ["T", "U", "V", "S"], 1,
   "The gaps grow by one: +2, +3, +4, +5, +6. O is the 15th letter; 15 + 6 = 21 = U."),
 A("Coding", "standard", "If CAT is coded as 24 (C = 3, A = 1, T = 20), what is the code for DOG?", ["24", "26", "25", "27"], 1,
   "Add the letter positions: D = 4, O = 15, G = 7; 4 + 15 + 7 = 26."),
 A("Relationships", "standard", "Pointing to a man, Dechen said, “He is the only son of my mother’s father.” How is the man related to Dechen?",
   ["Father", "Maternal uncle", "Grandfather", "Brother"], 1,
   "The only son of her mother’s father is her mother’s brother, that is, her maternal uncle."),
 A("Directions", "foundation", "Karma faces north. He turns 90° clockwise and then turns 180°. Which direction is he facing now?", ["East", "South", "West", "North"], 2,
   "North → 90° clockwise = East → 180° = West."),
 A("Logical reasoning", "standard", "Statements: All doctors are graduates. Some graduates are teachers.\n\nConclusions:\nI. Some doctors are teachers.\nII. Some teachers are graduates.\n\nWhich conclusion follows?",
   ["Only I", "Only II", "Both I and II", "Neither I nor II"], 1,
   "II follows: if some graduates are teachers, then some teachers are graduates. I does not follow: the teachers may be graduates who are not doctors."),
 A("Time and calendars", "standard", "15 August 2024 was a Thursday. What day of the week was 15 August 2025?", ["Thursday", "Friday", "Saturday", "Wednesday"], 1,
   "There are 365 days between them (no 29 February in that period). 365 = 52 weeks + 1 day, so the day moves on by one: Friday."),
 A("Time and calendars", "standard", "What is the angle between the hour and minute hands of a clock at 3:30?", ["60°", "75°", "90°", "105°"], 1,
   "Minute hand at 180°. Hour hand at 3 × 30 + 30 × 0.5 = 105°. Difference = 75°."),
 A("Ratio and proportion", "standard", "A 40-litre mixture contains milk and water in the ratio 3 : 1. How much water must be added to make the ratio 1 : 1?", ["10 litres", "20 litres", "30 litres", "15 litres"], 1,
   "Milk = 30 L, water = 10 L. For 1 : 1 water must be 30 L, so add 20 L."),
 A("Odd one out", "foundation", "Which is the odd one out?\n\n121, 169, 200, 225", ["121", "169", "200", "225"], 2,
   "121 = 11², 169 = 13², 225 = 15² are perfect squares; 200 is not."),
]

TOUR = ("The table shows tourist arrivals at a hotel by quarter (illustrative figures).\n\n| Year | Q1 | Q2 | Q3 | Q4 |\n|---|---|---|---|---|\n"
        "| 2023 | 1,800 | 2,400 | 1,500 | 3,300 |\n| 2024 | 2,100 | 2,700 | 1,800 | 3,900 |\n\n")
COLL = ("The table shows the number of students in four colleges (illustrative figures).\n\n| College | Male | Female |\n|---|---|---|\n"
        "| A | 420 | 380 |\n| B | 350 | 450 |\n| C | 600 | 400 |\n| D | 270 | 330 |\n\n")
SPEND = ("A government’s spending of Nu. 60 billion is divided as follows (illustrative figures).\n\n| Sector | Nu. billion |\n|---|---|\n"
         "| Health | 9 |\n| Education | 12 |\n| Infrastructure | 18 |\n| Agriculture | 6 |\n| Others | 15 |\n\n")
Q += [
 # ---------------- Data interpretation (20) ----------------
 D("Tables", "foundation", TOUR + "What were the total arrivals in 2024?", ["10,200", "10,500", "9,000", "11,000"], 1,
   "2,100 + 2,700 + 1,800 + 3,900 = 10,500."),
 D("Tables", "standard", TOUR + "By what percentage did total arrivals increase from 2023 to 2024?", ["15.0%", "16.7%", "14.3%", "20.0%"], 1,
   "2023 total = 9,000; 2024 total = 10,500. Increase = 1,500 ÷ 9,000 × 100 ≈ 16.7%."),
 D("Tables", "foundation", TOUR + "Which quarter had the largest increase in arrivals from 2023 to 2024?", ["Q1", "Q2", "Q3", "Q4"], 3,
   "Q1, Q2 and Q3 each rose by 300; Q4 rose by 600."),
 D("Tables", "standard", TOUR + "Approximately what share of 2024 arrivals came in Q4?", ["33%", "37%", "40%", "30%"], 1,
   "3,900 ÷ 10,500 × 100 ≈ 37.1%."),
 D("Tables", "foundation", TOUR + "What was the average number of arrivals per quarter in 2023?", ["2,250", "2,100", "2,400", "2,625"], 0,
   "9,000 ÷ 4 = 2,250."),
 D("Bar charts", "standard", COLL + "Which college has the highest proportion of female students?", ["A", "B", "C", "D"], 1,
   "Female share: A 47.5%, B 56.25%, C 40%, D 55%. B is highest."),
 D("Bar charts", "foundation", COLL + "How many students are there in the four colleges altogether?", ["3,000", "3,200", "3,400", "3,100"], 1,
   "800 + 800 + 1,000 + 600 = 3,200."),
 D("Bar charts", "standard", COLL + "What is the ratio of all male students to all female students?", ["41 : 39", "39 : 41", "4 : 3", "21 : 19"], 0,
   "Males = 420 + 350 + 600 + 270 = 1,640. Females = 380 + 450 + 400 + 330 = 1,560. 1,640 : 1,560 = 41 : 39."),
 D("Bar charts", "foundation", COLL + "What percentage of College C’s students are female?", ["40%", "60%", "35%", "45%"], 0,
   "400 ÷ 1,000 × 100 = 40%."),
 D("Bar charts", "standard", COLL + "In College D, the number of female students is greater than the number of male students by about what percentage?", ["18.2%", "22.2%", "20.0%", "25.0%"], 1,
   "(330 − 270) ÷ 270 × 100 = 60 ÷ 270 × 100 ≈ 22.2% (compare with the male figure)."),
 D("Pie charts", "standard", SPEND + "In a pie chart of this spending, what angle would the Education slice have?", ["60°", "72°", "80°", "54°"], 1,
   "12 ÷ 60 × 360° = 72°."),
 D("Pie charts", "foundation", SPEND + "What percentage of the spending goes to Infrastructure?", ["25%", "30%", "18%", "35%"], 1,
   "18 ÷ 60 × 100 = 30%."),
 D("Pie charts", "foundation", SPEND + "What is the ratio of Health spending to Agriculture spending?", ["2 : 3", "3 : 2", "3 : 1", "9 : 4"], 1,
   "9 : 6 = 3 : 2."),
 D("Pie charts", "standard", SPEND + "Next year the total rises by 10% and each sector keeps the same share. How much will Education receive?", ["Nu. 13.2 billion", "Nu. 13.0 billion", "Nu. 12.1 billion", "Nu. 14.0 billion"], 0,
   "Education’s share is 12 ÷ 60 = 20%. New total = 66 billion; 20% of 66 = Nu. 13.2 billion."),
 D("Pie charts", "standard", SPEND + "Health and Education together receive what fraction of the total?", ["1/3", "7/20", "2/5", "3/10"], 1,
   "9 + 12 = 21; 21 ÷ 60 = 7/20."),
 D("Statistics basics", "standard", "In a class, 30 students have an average mark of 60 and 20 students have an average mark of 70. What is the average mark of all 50 students?", ["65", "64", "66", "62"], 1,
   "(30 × 60 + 20 × 70) ÷ 50 = (1,800 + 1,400) ÷ 50 = 3,200 ÷ 50 = 64."),
 D("Statistics basics", "standard", "The average of five numbers is 20. When one number is removed, the average of the remaining four is 18. Which number was removed?", ["26", "28", "22", "30"], 1,
   "Total of five = 100; total of four = 72; the removed number = 100 − 72 = 28."),
 D("Statistics basics", "foundation", "What is the range of 14, 8, 23, 5, 17 and 11?", ["18", "17", "15", "23"], 0,
   "Range = largest − smallest = 23 − 5 = 18."),
 D("Statistics basics", "foundation", "What is the median of 4, 9, 2, 7, 5 and 8?", ["6", "5.5", "6.5", "7"],0,
   "In order: 2, 4, 5, 7, 8, 9. The middle two are 5 and 7, so the median is (5 + 7) ÷ 2 = 6."),
 D("Statistics basics", "standard", "A salary of Nu. 25,000 is increased by 12%. What is the new salary?", ["Nu. 27,500", "Nu. 28,000", "Nu. 28,500", "Nu. 27,000"], 1,
   "12% of 25,000 = 3,000. New salary = Nu. 28,000."),
]


def check_batch2():
    import datetime
    from fractions import Fraction as F
    assert 20000 * 8 * 3 / 100 == 4800 and round(10000 * 1.1 ** 2) == 12100 and 200 / 800 == .25
    assert round(1080 / .9) == 1200 and 2500 * .8 == 2000 and 240 / 12 * 18 / 5 == 72
    assert F(1, 4) - F(1, 6) == F(1, 12) and 3 * 10 + 10 == 2 * (10 + 10)
    assert 47 * 2 + 1 == 95 and 6 ** 2 + 1 == 37 and 5 / 5 == 1 and chr(64 + 15 + 6) == 'U' and 4 + 15 + 7 == 26
    assert datetime.date(2024, 8, 15).strftime('%A') == 'Thursday' and datetime.date(2025, 8, 15).strftime('%A') == 'Friday'
    assert abs(180 - (3 * 30 + 30 * .5)) == 75 and 30 - 10 == 20
    t23, t24 = [1800, 2400, 1500, 3300], [2100, 2700, 1800, 3900]
    assert sum(t24) == 10500 and round((sum(t24) - sum(t23)) / sum(t23) * 100, 1) == 16.7
    assert [b - a for a, b in zip(t23, t24)] == [300, 300, 300, 600] and round(3900 / 10500 * 100) == 37 and sum(t23) / 4 == 2250
    c = {'A': (420, 380), 'B': (350, 450), 'C': (600, 400), 'D': (270, 330)}
    assert max(c, key=lambda k: c[k][1] / sum(c[k])) == 'B' and sum(map(sum, c.values())) == 3200
    m, f = sum(v[0] for v in c.values()), sum(v[1] for v in c.values())
    assert F(m, f) == F(41, 39) and round(60 / 270 * 100, 1) == 22.2
    assert 12 / 60 * 360 == 72 and 18 / 60 == .3 and F(9, 6) == F(3, 2) and round(66 * .2, 1) == 13.2 and F(21, 60) == F(7, 20)
    assert (30 * 60 + 20 * 70) / 50 == 64 and 100 - 72 == 28 and 23 - 5 == 18 and (5 + 7) / 2 == 6 and 25000 * 112 // 100 == 28000


check_batch2()


# Spread the correct answer evenly over A–D (options are not shuffled in every exam). Option lists with a natural
# order (labels, quarters, conclusions, the odd-one-out list) keep their order.
def _balance():
    fixed = lambda x: x['opts'] in (["A", "B", "C", "D"], ["Q1", "Q2", "Q3", "Q4"], ["Only I", "Only II", "Both I and II", "Neither I nor II"],
                                    ["121", "169", "200", "225"], ["a", "an", "the", "no article"])
    k = 0
    for x in Q:
        if fixed(x):
            continue
        target = k % 4
        k += 1
        shift = (target - x['ans']) % 4
        x['opts'] = x['opts'][-shift:] + x['opts'][:-shift] if shift else x['opts']
        x['ans'] = target


_balance()
