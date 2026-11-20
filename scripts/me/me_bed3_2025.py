"""ME B.Ed. Paper III (Teacher Aptitude Test), common to all B.Ed. graduates, BCSE 2025 - real paper (PDF sent by the
founder). 100 MCQs of 1 mark, 3 h + 15 min reading. Sections A logical reasoning, B basic data interpretation,
C problem solving, D general awareness (25 each).
Charts and figures were cut from the PDF into public/papers/me/bed3-2025-*.png. Left out (flawed, ambiguous or
needing a figure that cannot be shown as options, or an answer Claude cannot confirm): Q3, 5, 6, 10, 28, 36, 37, 38
(no option matches 669 x 336/413 = 544), 76, 78, 80, 81, 96. 13 new questions of the same kinds keep each section at 25.
Q8's picture options were turned into words. Answer keys are Claude's: please check before publishing.
"""
BATCH = "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1"
GROUP_TAG = "bed3y2025"
PAPER = "me-bed-3"
SUBJECT = "teacher-aptitude"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}
LR, DI, PS, GA = "Logical reasoning", "Basic data interpretation", "Problem solving", "General awareness"
PATTERN = [
    {"title": "Section A: Logical reasoning", "type": "mcq", "count": 25, "marks_each": 1, "answer_any": None, "topic": "logical-reasoning"},
    {"title": "Section B: Basic data interpretation", "type": "mcq", "count": 25, "marks_each": 1, "answer_any": None, "topic": "basic-data-interpretation"},
    {"title": "Section C: Problem solving", "type": "mcq", "count": 25, "marks_each": 1, "answer_any": None, "topic": "problem-solving"},
    {"title": "Section D: General awareness", "type": "mcq", "count": 25, "marks_each": 1, "answer_any": None, "topic": "general-awareness"},
]
RUBRIC = [("Correct answer", "One mark for the correct option.", 20)]
IMG = "/papers/me/bed3-2025-"
CHECK = ["Answer key written by Claude: please check before publishing."]

def m(key, topic, stem, opts, ans, exp, real=True, image=None):
    d = dict(key=key, real=real, new=not real, type="mcq", topic=topic, stem=stem, opts=opts, ans="ABCD".index(ans), exp=exp, issues=CHECK)
    if image:
        d["image"] = IMG + image + ".png"
    return d

TEMP = "The plot shows global temperature anomalies from 1900 to 2025 (how much the global temperature deviates from a long-term average). "
PIE = "The pie chart shows the average IQ scores of five schools: Phuntsholing HSS 115, Mongar HSS 98, Nangkhor HSS 102, Yangchenphu HSS 105, Zhemgang HSS 110. "
BAR = "The bar plot shows the population of Bhutan by region and gender (total 810,000): Central female 60%, Eastern female 43.75%, Southern male 50%, Western male 46.67%. "
SC = "The plot shows average study hours per week (x-axis) against average academic performance (y-axis) across 15 schools. "
MAP = "The map shows literacy rates by dzongkhag in Bhutan (darker patterns = higher literacy rates). "
COE = """CoE enrolment (Annual Education Statistics 2024), F = female, M = male:
Year | Samtse F | Samtse M | Samtse total | Paro F | Paro M | Paro total
2020 | 457 | 456 | 913 | 856 | 733 | 1,589
2021 | 336 | 413 | 749 | 861 | 669 | 1,530
2022 | 303 | 277 | 580 | 889 | 646 | 1,535
2023 | 176 | 244 | 420 | 587 | 711 | 1,298
2024 | 325 | 185 | 581 | 692 | 525 | 1,217
"""

Q = [
# ---------------- Section A
m("A1", LR, "Which 3 of the 8 letter bits can be combined to create a word to describe a large reptile that lives throughout the tropics in Africa and Asia? i. ILE, ii. DRE, iii. CRO, iv. FIS, v. HUN, vi. COD, vii. MET, viii. HER", ["i, iii and vi", "ii, iv and v", "v, vi and viii", "i, iii and viii"], "A", "CRO + COD + ILE = CROCODILE."),
m("A2", LR, "A clock reads 3:00 AM. How many degrees will the short (hour) hand have turned when the time reaches 6:00 AM?", ["30 degrees", "90 degrees", "360 degrees", "1,080 degrees"], "B", "The hour hand turns 30 degrees an hour: 3 x 30 = 90."),
m("A4", LR, "What decimal of an hour is a second?", ["0.0025", "0.0256", "0.00027", "0.000126"], "C", "1/3600 = 0.000277..."),
m("A7", LR, "Select the correctly spelled word.", ["Neccessary", "Necesary", "Necessary", "Necesssary"], "C", "Necessary: one c, double s."),
m("A8", LR, "A glass of oil and water is left untouched for a while. How will they settle?", ["Oil at the bottom, water on top", "Oil on top, water at the bottom", "Oil spread as droplets all through the water", "Oil droplets collected at the bottom of the water"], "B", "Oil is less dense than water and does not mix with it, so it floats as a layer on top. (Picture options of the RCSC paper written as words.)"),
m("A9", LR, "If today's date is January 25th, what date will it be in 14 days' time?", ["February 8th", "February 7th", "February 5th", "February 4th"], "A", "January has 31 days: 6 days to Jan 31, then 8 more = February 8."),
m("A11", LR, "What is the number that is one half of one quarter of one tenth of 800?", ["20", "12", "10", "5"], "C", "800/10 = 80; 80/4 = 20; 20/2 = 10."),
m("A12", LR, "Select the statement that logically follows: 'He drinks Pepsi, only if she drinks Coke.'", ["She drinks Coke implies he does not drink Pepsi", "He drinks Pepsi implies she drinks Coke", "Both (a) and (b)", "None of the above"], "B", "'P only if Q' means P implies Q."),
m("A13", LR, "A flight leaves the airport at 9:10 am. It is a 3 hour 55 minute flight. The destination is 1 hour ahead. What time will the flight arrive (local time)?", ["02:05 pm", "02:10 pm", "11:05 pm", "11:10 pm"], "A", "9:10 + 3:55 = 1:05 pm; + 1 hour = 2:05 pm."),
m("A14", LR, "A sequence goes 2, 4, 8, 16, 32, __. What is the next number?", ["36", "40", "48", "64"], "D", "Each number doubles."),
m("A15", LR, "If all Bloops are Razzies and all Razzies are Lazzies, then", ["No Lazzies are Bloops.", "Some Bloops are Lazzies.", "Some Razzies are not Lazzies.", "All Bloops are definitely Lazzies."], "D", "All Bloops are Razzies, all Razzies are Lazzies, so all Bloops are Lazzies."),
m("A16", LR, "A coat and a hat cost Nu 110 in total. The coat costs Nu 100 more than the hat. How much does the hat cost?", ["Nu 105", "Nu 100", "Nu 10", "Nu 5"], "D", "h + (h + 100) = 110, so h = 5."),
m("A17", LR, "'Import' is related to 'Export' in the same way as 'Expenditure' is related to", ["Deficit", "Income", "Debt", "Tax"], "B", "Opposites: money going out vs coming in."),
m("A18", LR, "Which of the following is not a millennial (internet slang) word?", ["lit", "ootd", "slang", "trolls"], "C", "lit, ootd and trolls are slang words; 'slang' is the name for such language."),
m("A19", LR, "Karma started from point A and walked 15 m south. He turned left and walked 20 m, turned left and walked 15 m, then turned left again and walked 35 m to reach point B. How far is B from A?", ["10 metres", "15 metres", "20 metres", "30 metres"], "B", "After the first three legs he is 20 m east of A; 35 m west puts him 15 m west of A."),
m("A20", LR, "Karma started from point A and walked 15 m south. He turned left and walked 20 m, turned left and walked 15 m, then turned left again and walked 35 m to reach point B. In which direction is B from A?", ["East", "West", "North", "South"], "B", "B is 15 m west of A."),
m("A21", LR, "If it takes Chencho 3.5 minutes to walk 0.5 km, how long does it take him to walk 12 km?", ["42 mins", "1 hour", "1 hour 21 mins", "1 hour 24 mins"], "D", "12/0.5 = 24; 24 x 3.5 = 84 min = 1 h 24 min."),
m("A22", LR, "What fraction makes up the shaded parts? (see the diagram)", ["3 1/2", "3 1/4", "3 3/4", "3"], "B", "Three whole circles and one quarter are shaded.", image="shaded-circles"),
m("A23", LR, "You own a restaurant and receive complaints about slow service. What should you prioritise to improve customer satisfaction?", ["Redecorating the restaurant", "Offering more menu choices", "Hiring additional servers", "Cutting food costs"], "C", "More servers address slow service directly."),
m("A24", LR, "Express a speed of 36 km/h in metres per second.", ["10 m/s", "12 m/s", "14 m/s", "17 m/s"], "A", "36 x 1000 / 3600 = 10."),
m("A25", LR, "Who is located at north-east? (see the diagram; note where N is marked)", ["Kinley", "Tandin", "Tsheyang", "Yoedsel"], "C", "N is at the bottom of the diagram, so north is down and east is to the left: north-east is bottom-left, Tsheyang. Claude's reading of the figure: please check.", image="compass"),
m("AN1", LR, "If CAT is coded as DBU, how is DOG coded?", ["EPH", "EPG", "FPH", "DPH"], "A", "Each letter moves one place forward.", real=False),
m("AN2", LR, "Find the next number: 3, 6, 11, 18, 27, ?", ["36", "38", "39", "40"], "B", "Differences 3, 5, 7, 9, 11: 27 + 11 = 38.", real=False),
m("AN3", LR, "Pointing to a man, Sonam said, 'He is the son of my mother's only brother.' How is the man related to Sonam?", ["Brother", "Uncle", "Cousin", "Nephew"], "C", "Mother's brother is Sonam's uncle; his son is Sonam's cousin.", real=False),
m("AN4", LR, "Book : Library :: Painting : ?", ["Artist", "Gallery", "Canvas", "Frame"], "B", "Books are kept in a library; paintings in a gallery.", real=False),
# ---------------- Section B
m("B26", DI, TEMP + "The chart shows", ["a sudden rise in global temperature anomaly.", "a gradual increase in global temperature anomaly.", "a sudden increase followed by a return to normal.", "a decrease in global temperature anomaly."], "B", "The anomaly rises over the whole period with ups and downs.", image="temperature"),
m("B27", DI, TEMP + "Which 30-year period experienced the highest increase in temperature anomaly?", ["1900-1930", "1930-1960", "1960-1990", "1990-2010"], "C", "From about 0.4 to about 1.0 between 1960 and 1990.", image="temperature"),
m("B29", DI, PIE + "What percentage of the total average IQ score does Phuntsholing HSS contribute?", ["24.0%", "21.7%", "22.8%", "20.7%"], "B", "Total 530; 115/530 = 21.7%.", image="iq-pie"),
m("B30", DI, PIE + "What is the difference between the percentage shares of the school with the highest IQ score and the one with the lowest?", ["About 7%", "About 10%", "About 12%", "About 3%"], "D", "115/530 = 21.7% and 98/530 = 18.5%: about 3 percentage points.", image="iq-pie"),
m("B31", DI, PIE + "If the average IQ scores of all schools increase by 5 points, what will be the new percentage contribution of Nangkhor HSS?", ["20.0%", "19.2%", "18.9%", "20.2%"], "B", "107/555 = 19.3%, closest 19.2%.", image="iq-pie"),
m("B32", DI, "The box plot shows the distribution of annual exam marks by gender. Which gender demonstrates better overall performance?", ["Male, because their marks have fewer outliers.", "Female, because their median marks are higher.", "Male, because their interquartile range is larger.", "Female, because they have no outliers."], "B", "The female median is higher.", image="boxplot"),
m("B33", DI, "Group summary statistics: Group A mean 72, median 74, standard deviation 5; Group B mean 70, median 65, standard deviation 12. Which conclusion is most accurate?", ["Group A performed better on average, and the scores are more consistent.", "Group B performed better overall because their median is lower.", "Group A shows greater variability in performance due to the higher median.", "Group B is more consistent since the standard deviation is higher."], "A", "Higher mean and smaller standard deviation."),
m("B34", DI, BAR + "Which region has the highest proportion of male population?", ["Eastern", "Central", "Western", "Southern"], "A", "Male shares: Central 40%, Eastern 56.25%, Southern 50%, Western 46.67%.", image="population-bar"),
m("B35", DI, BAR + "If the population of the western region is 3 lakhs, the number of females there is", ["426,640", "140,010", "159,990", "271,983"], "C", "Female 53.33% of 300,000 = 159,990.", image="population-bar"),
m("B39", DI, COE + "In which year was the difference between female enrolment in Paro and Samtse the greatest?", ["2020", "2023", "2024", "2022"], "D", "Differences: 399, 525, 586, 411, 367 - greatest in 2022."),
m("B40", DI, COE + "The ratio of female to male students enrolled in Samtse in 2024 is", ["1.76", "1.33", "0.57", "1.92"], "A", "325/185 = 1.76."),
m("B41", DI, SC + "True or false: the findings suggest that schools where students study more tend to achieve higher academic performance.", ["False", "True", "Cannot be told from a plot", "Only for schools above 20 hours"], "B", "The points rise from left to right. (RCSC gave only True/False; two options added.)", image="study-hours"),
m("B42", DI, SC + "Which school appears to perform better than expected based on study hours?", ["School C", "School D", "School J", "School O"], "C", "School J has about 99% with only about 15 hours, well above the trend.", image="study-hours"),
m("B43", DI, SC + "Which school has both the highest study hours and one of the highest academic performances?", ["School G", "School A", "School L", "School I"], "C", "School L is furthest right (about 22 hours) at about 102%.", image="study-hours"),
m("B44", DI, SC + "Which statement best describes the correlation between average study hours and academic performance?", ["There is a strong negative correlation.", "There is no observable correlation.", "There is a moderate to strong positive correlation.", "The correlation is perfectly positive."], "C", "Points rise together but do not lie on a line.", image="study-hours"),
m("B45", DI, "A survey of 100 teachers found that two-fifths prefer online training and three-fifths prefer in-person training. How many more teachers prefer in-person to online training?", ["20", "10", "40", "60"], "A", "60 - 40 = 20."),
m("B46", DI, "In a class survey 40% chose videos, 30% textbooks, 20% group discussions and 10% games as their preferred learning method. Which conclusion is most accurate?", ["Most students dislike games as a learning method.", "Videos are twice as popular as group discussions.", "Textbooks are the least preferred learning method.", "Students prefer videos and textbooks equally."], "B", "40% is twice 20%."),
m("B47", DI, MAP + "Which statement is most accurate?", ["All northern dzongkhags have the lowest literacy rates.", "Some western dzongkhags show higher literacy rates compared to eastern dzongkhags.", "Literacy rates are uniform across all dzongkhags.", "All eastern dzongkhags have the highest literacy rates."], "B", "The darkest patterns are in the west.", image="literacy-map"),
m("B48", DI, MAP + "After 10 years, if an eastern dzongkhag shows a pattern as dark as the darkest pattern on the map, which conclusion is most likely true?", ["The district has a literacy rate below 50%.", "The district has a very low population.", "The district has a literacy rate of more than 90%.", "The district has very few schools."], "C", "The darkest pattern is the highest literacy band.", image="literacy-map"),
m("B49", DI, MAP + "What does the density of the pattern on the map represent?", ["The size of the dzongkhag", "The population density of the dzongkhag", "The average age of teachers in the dzongkhag", "The literacy rate in the dzongkhag"], "D", "The legend: darker patterns = higher literacy rates.", image="literacy-map"),
m("B50", DI, "As of 2024, the median age of Bhutan is about 29.9 years. What does this mean?", ["The average age of all people in Bhutan is 29.9 years.", "Half of Bhutan's population is younger than 29.9 years and half is older.", "The most common age in Bhutan is 29.9 years.", "Everyone in Bhutan is exactly 29.9 years old."], "B", "The median splits the population into two halves."),
m("BN1", DI, "A class's test scores are 45, 52, 60, 60 and 73. What is the median?", ["58", "60", "52", "73"], "B", "Middle value of the ordered list.", real=False),
m("BN2", DI, "A class's test scores are 45, 52, 60, 60 and 73. What is the mean?", ["56", "58", "60", "62"], "B", "290/5 = 58.", real=False),
m("BN3", DI, "A school's enrolment rose from 400 to 460. What is the percentage increase?", ["6%", "12%", "15%", "60%"], "C", "60/400 = 15%.", real=False),
m("BN4", DI, "In a pie chart, a category that is 25% of the data has a central angle of", ["25 degrees", "45 degrees", "90 degrees", "100 degrees"], "C", "25% of 360 = 90.", real=False),
# ---------------- Section C
m("C51", PS, "Which one of the following fractions is greatest?", ["1/2", "2/3", "3/4", "4/5"], "D", "0.5, 0.67, 0.75, 0.8."),
m("C52", PS, "Which of the following numbers is farthest from 1 on the number line?", ["-10", "-5", "5", "10"], "A", "Distance 11."),
m("C53", PS, "If n = 2³, what is the value of nⁿ?", ["2⁶", "2⁹", "2¹¹", "2²⁴"], "D", "8⁸ = (2³)⁸ = 2²⁴."),
m("C54", PS, "There are 40 students; 25 of them are girls. What percent of the class is boys?", ["25.0%", "37.5%", "62.0%", "62.5%"], "B", "15/40 = 37.5%."),
m("C55", PS, "Arjun borrowed Nu 12,000 at simple interest for 5 years and paid Nu 3,600 interest. What is the rate per annum?", ["4%", "5%", "6%", "8%"], "C", "3600 / (12000 x 5) = 6%."),
m("C56", PS, "40% of a number is 1,992. What is 95% of that number?", ["4,731", "4,800", "4,900", "4,980"], "A", "Number 4,980; 95% = 4,731."),
m("C57", PS, "Pema, who is 16, is four times as old as her brother Sonam. How old will Pema be when she is twice as old as Sonam?", ["18", "20", "22", "24"], "D", "Sonam 4, gap 12: Pema is twice Sonam when Sonam is 12, Pema 24."),
m("C58", PS, "How many minutes does Dechen take to cover 400 m running at 20 km/h?", ["1.0 minute", "1.2 minutes", "1.5 minutes", "2.0 minutes"], "B", "20 km/h = 333.3 m/min; 400/333.3 = 1.2."),
m("C59", PS, "x < 0. Compare Quantity A: 0.2% of x, and Quantity B: (1/5)x.", ["Quantity A is greater.", "Quantity B is greater.", "The two quantities are equal.", "The relationship cannot be determined."], "A", "0.002x > 0.2x when x is negative."),
m("C60", PS, "What percentage of 2/7 is 1/35?", ["10%", "12%", "14%", "16%"], "A", "(1/35)/(2/7) = 1/10."),
m("C61", PS, "About 1/7 of Bhutan's population lives in Punakha. Haa has about 3/4 of Punakha's population. What fraction of Bhutan's population lives in Haa?", ["1/4", "3/28", "3/11", "21/28"], "B", "1/7 x 3/4 = 3/28."),
m("C62", PS, "A shopkeeper sells a watch for Nu 3,800 at a 5% loss. At what price should it be sold for a 5% profit?", ["Nu 3,980", "Nu 4,000", "Nu 4,200", "Nu 4,400"], "C", "Cost 4,000; +5% = 4,200."),
m("C63", PS, "The average of 4 and A is 12 and the average of 6 and B is 20. What is the average of A and B?", ["27", "28", "29", "30"], "A", "A = 20, B = 34, average 27."),
m("C64", PS, "In the figure, the area of triangle ABC is 20 cm², BD = 4 cm is the height, and AD = BD. What is the length of DC?", ["2 cm", "2√2 cm", "4√2 cm", "6 cm"], "D", "AC = 2 x 20 / 4 = 10; AD = 4, so DC = 6.", image="triangle"),
m("C65", PS, "A fast car leaves Thimphu for Paro at 80 km/h. At the same time a slow car leaves Paro for Thimphu at 30 km/h. When they meet, which one is farther from Thimphu?", ["The slow car", "The fast car", "Both are equally far from Thimphu", "Cannot be determined"], "C", "When they meet they are at the same place."),
m("C66", PS, "The sum of the ages of 5 children born at intervals of 3 years is 50 years. What is the age of the eldest child?", ["15 years", "16 years", "17 years", "18 years"], "B", "5x + 30 = 50, x = 4; eldest 4 + 12 = 16."),
m("C67", PS, "How many bricks of 25 cm x 11.25 cm x 6 cm are needed for a wall 8 m x 6 m x 22.5 cm?", ["5,600", "6,000", "6,400", "7,200"], "C", "10,800,000 / 1,687.5 = 6,400."),
m("C68", PS, "At a factory in Pasakha, the ratio of workers who take the bus to those who drive is 2:5. If 120 drive, how many workers are there in total?", ["140", "150", "168", "180"], "C", "Bus 48, total 168."),
m("C69", PS, "A phone costs Nu 17,500. The shopkeeper gives a 20% discount and then increases the price by 10%. What is the new price?", ["Nu 15,400", "Nu 15,600", "Nu 16,000", "Nu 16,200"], "A", "17,500 x 0.8 x 1.1 = 15,400."),
m("C70", PS, "Dorji and Dema can do a piece of work in 10 days; Dorji alone in 12 days. In how many days can Dema alone do it?", ["50 days", "55 days", "60 days", "65 days"], "C", "1/10 - 1/12 = 1/60."),
m("C71", PS, "10 roommates share a monthly rent of Nu x equally. If y of them move out, what is the additional rent paid by each remaining roommate?", ["10x/y", "x/(10-y)", "x/(10(10-y))", "xy/(10(10-y))"], "D", "x/(10-y) - x/10 = xy/(10(10-y))."),
m("C72", PS, "Norbu, Sharmila and Tenzin can do a piece of work in 20, 30 and 60 days. In how many days can Norbu do the work if helped by the other two every third day?", ["12 days", "15 days", "18 days", "20 days"], "B", "Every 3 days: 2/20 + 1/10 = 1/5 of the work; 15 days."),
m("C73", PS, "A rectangular prism has a square base of side 8 cm and height 21 cm. What is one-fourth of its volume in cm³?", ["312", "324", "336", "348"], "C", "8 x 8 x 21 = 1,344; /4 = 336."),
m("C74", PS, "Money was deposited in a bank at simple interest for 2 years. At 1% higher rate it would have earned Nu 24 more. What is the principal?", ["Nu 1,000", "Nu 1,200", "Nu 1,400", "Nu 1,600"], "B", "P x 1% x 2 = 24, P = 1,200."),
m("C75", PS, "A bus takes 6 hours from Thimphu to Bumthang at 50 km/h and 7 hours 30 minutes for the return trip. What is the average speed for the whole trip?", ["48.2 km/h", "46.8 km/h", "45.3 km/h", "44.4 km/h"], "D", "600 km / 13.5 h = 44.4."),
# ---------------- Section D
m("D77", GA, "In which year did Bhutan introduce the New Approach to Primary Education (NAPE)?", ["1968", "1986", "1990", "2003"], "B", "NAPE began in 1986."),
m("D79", GA, "Which Nobel Peace Prize laureate worked for children's right to education?", ["Kailash Satyarthi", "Albert Einstein", "Amartya Sen", "Nelson Mandela"], "A", "Kailash Satyarthi, Nobel Peace Prize 2014."),
m("D82", GA, "According to Bronfenbrenner (1989), which ecological system is 'a pattern of activities, roles, and interpersonal relations experienced by the developing person in a given face-to-face setting'?", ["Microsystem", "Mesosystem", "Exosystem", "Macrosystem"], "A", "Face-to-face settings form the microsystem."),
m("D83", GA, "When teachers in Bhutan emphasise Tha Damtsi (trustworthiness) and Ley Judrey (cause and effect) in class, which approach are they reinforcing?", ["Moral education", "Holistic education", "Behaviorist approach", "Constructivist pedagogy"], "A", "These are moral and ethical values."),
m("D84", GA, "In 2024 MoESD revised guidelines introduced selective and functional learning pathways so that students with significant learning challenges can study a mix of general curriculum and functional, interest-aligned subjects, with IEPs and equivalency certification (Kuensel). Which principle of inclusive education does this reflect?", ["Ensuring all students follow the same curriculum for equality and equity.", "Creating alternative pathways suited to students' abilities and interests.", "Focusing on academic readiness for board exams.", "Segregating students with special needs."], "B", "Flexible pathways matched to ability and interest."),
m("D85", GA, "The Bhutan Professional Standards for Teachers (BPST) aims to", ["guide teachers in improving practice and quality.", "ensure discipline among teachers.", "assess teachers' proficiency.", "enhance teacher workforce."], "A", "BPST sets standards to guide professional practice."),
m("D86", GA, "'Schools are restructuring curriculum, pedagogy and assessment to prepare students for a knowledge-based society, creating globally competent, locally rooted citizens grounded in Bhutan's culture and values.' This aligns with", ["National Education Policy 2020", "Education Transformation Initiative 2021", "Teacher Professional Standards (2019)", "Bhutan Education Blueprint (2014-2024)"], "B", "The education transformation launched in 2021."),
m("D87", GA, "A teacher lets students submit assignments as essays, videos or podcasts. Which UDL principle is this?", ["Multiple means of representation", "Multiple means of engagement", "Multiple means of action and expression", "Universal means of standardization"], "C", "Different ways for students to show learning."),
m("D88", GA, "A teacher gives a student with hearing difficulties visual aids and peer support to take part fully in group work. Which principle is shown?", ["Segregated instruction", "Integrated instruction", "Uniform teaching method", "Reasonable accommodations"], "D", "Adjustments that let the learner participate."),
m("D89", GA, "A teacher asks students to explore objects of different shapes and classify them. Which Piagetian strategy is this?", ["Rote learning", "Guided discovery", "Direct instruction", "Lecture-based teaching"], "B", "Learning by active exploration."),
m("D90", GA, "A Grade III student cannot solve two-step word problems alone but succeeds with the teacher's guiding questions. This is an example of", ["Operant conditioning", "ZPD scaffolding", "Independent practice", "Guided memorization"], "B", "Support within the zone of proximal development."),
m("D91", GA, "Teacher A: 'I repeat important information several times.' Teacher B: 'I make sure my first explanation is accurate, because students retain what they learn first.' Which laws of learning are these?", ["B: Law of Effect; A: Law of Readiness", "B: Law of Primacy; A: Law of Exercise", "B: Law of Readiness; A: Law of Effect", "B: Law of Exercise; A: Law of Primacy"], "B", "First impressions = primacy; repetition = exercise."),
m("D92", GA, "Asking students to compare evaporation with condensation promotes which cognitive process?", ["Remembering", "Applying", "Creating", "Analyzing"], "D", "Comparing is analysing."),
m("D93", GA, "Which scenario best distinguishes the actual and potential developmental levels in the ZPD?", ["Solving multiplication alone vs. solving division alone", "Reading a simple story independently vs. reading a complex story with a peer's support", "Memorizing a poem vs. writing an original poem", "Taking a test vs. preparing for the test"], "B", "Alone vs. with support."),
m("D94", GA, "Which activity BEST promotes active citizenship in a civic education curriculum?", ["Organizing debates on local governance issues and proposing solutions.", "Memorizing articles of the Constitution.", "Conducting multiple-choice tests on democracy.", "Assigning textbook readings without reflection."], "A", "Active participation and problem solving."),
m("D95", GA, "MoESD proposes replacing high-stakes examinations with more continuous assessment. Which argument supports this MOST strongly?", ["Exams are less stressful than projects.", "Continuous assessment reduces teacher workload.", "Continuous assessment guarantees higher scores.", "It aligns with the holistic values of GNH and promotes equity in learning."], "D", "Holistic, fair assessment."),
m("D97", GA, "'The State shall provide free education to all children of school going age up to tenth standard ...' is in which Article of the Constitution of Bhutan?", ["Article 6: Citizenship", "Article 7: Fundamental Rights", "Article 9: Principles of State Policy", "Article 34: National Referendum"], "C", "Article 9, Section 16."),
m("D98", GA, "All of the following zorig chusum terms are correct EXCEPT", ["Carpentry - Shingzo", "Painting - Lhazo", "Sculpting - Jinzo", "Blacksmithing - Troeko"], "D", "Blacksmithing is Garzo; Troeko is gold and silver smithing."),
m("D99", GA, "What does PISA (the OECD study of 15-year-olds) stand for?", ["Programme for International Student Assessment", "Performance for International Student Assessment", "Percentage for International Student's Assessment", "Problems for International Student's Assessment"], "A", "Programme for International Student Assessment."),
m("D100", GA, "The author of the book 'To Live or Not to Live' is", ["Alexandre Dumas", "Nirad C. Chaudhuri", "George Eliot", "V S Naipaul"], "B", "Nirad C. Chaudhuri."),
m("DN1", GA, "In the revised Bloom's taxonomy, the highest level is", ["Evaluating", "Creating", "Analysing", "Applying"], "B", "Creating is at the top.", real=False),
m("DN2", GA, "'Assessment for learning' is mainly", ["summative assessment", "formative assessment", "norm-referenced testing", "placement testing"], "B", "Ongoing feedback during learning.", real=False),
m("DN3", GA, "The Zone of Proximal Development was proposed by", ["Jean Piaget", "Lev Vygotsky", "B. F. Skinner", "Jerome Bruner"], "B", "Vygotsky.", real=False),
m("DN4", GA, "Operant conditioning is most associated with", ["Ivan Pavlov", "B. F. Skinner", "Albert Bandura", "Edward Thorndike"], "B", "Skinner.", real=False),
m("DN5", GA, "How many pillars does Gross National Happiness have?", ["3", "4", "9", "33"], "B", "Four pillars, nine domains, 33 indicators.", real=False),
]
