"""ME Technical Paper II (General Subject Knowledge), STATISTICS group, BCSE 2022 - real paper. PDF sent by the founder.
Follows the latest (BCSE 2025) layout: Part I 70 MCQ x 1; Part II 6 short answers x 5 = 30.
The 2022 Part II (one data set; Q1-Q4 5 marks each, Q5 10 marks) is kept as five 5-mark questions (Q5 scaled from 10 to 5);
one new short answer on the same data (mode, IQR and shape) makes six.
Tables retyped; the two stem plots and the regression output are cropped from the paper (public/papers/me/tech2-stat-2022-*.png).
Left out (more than one defensible answer or no correct option): MCQ 5 (margin-of-error options do not match 65 ± 10),
18 (asks for the variable but lists populations), 41 (both c and d are untrue), 56 (r = 0.80 is not an option),
66 (confounding vs common response). Five new MCQs keep Part I at 70.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Statistics): BCSE 2022, batch 1"
GROUP_TAG = "stat2022"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "statistics"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 6, "marks_each": 5, "answer_any": None},
]
TOPIC = "Statistics: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Which one of the following is TRUE about the Statistics?",
"opts": [
"It is the science of collecting data to assist in making more effective decisions.",
"It is the science of collecting and organizing data to assist in making more effective decisions.",
"It is the science of collecting, organizing and presenting data to assist in making more effective decisions.",
"It is the science of collecting, organizing, presenting, analysing and interpreting data to assist in making more effective decisions."
]
},
{
"n": 2,
"stem": "240 adults and children attended a show organized by Film Association of Bhutan in Thimphu. The ratio of adults to children was 5 to 1. How many children attended the show?",
"opts": [
"40",
"48",
"192",
"200"
]
},
{
"n": 3,
"stem": "Every month Sonam reads two new books and add them to her library. Which of the following types of functions best models the number of books in Sonam’s library as a function of time?",
"opts": [
"Increasing exponential",
"Decreasing exponential",
"Increasing linear",
"Decreasing linear"
]
},
{
"n": 4,
"stem": "In Maths test, the mean score is between 3 and 4. The large majority of scores are 3 and 4 with only a few scores of 0, 1, 2 and 5. In English test, the mean score is 2.5, and scores are evenly distributed across all possible scores, with many scores not close to the mean score. Which of the following is TRUE about the Maths and English test?",
"opts": [
"The standard deviation of test scores in Maths is less than that of test scores in English.",
"The standard deviation of test scores in Maths is greater than that of test scores in English.",
"The standard deviation of test scores in Maths is equal to that of test scores in English.",
"There is no enough information to compare the standard deviations."
]
},
{
"n": 5,
"stem": "A researcher selects 100 students at random from a school and finds that the mean weight of 65 kg with an associated margin of error of 10 kg. Which of the following is the most appropriate conclusion based on the data?",
"opts": [
"All the students randomly chosen that day have a weight between 35 kg and 165 kg.",
"All the students have a weight between 35 kg and 165 kg.",
"It is plausible that the mean weight of students randomly chosen that day is between 35 kg and 165 kg.",
"It is plausible that the mean weight of students in schools is not between 35 kg and 165 kg."
]
},
{
"n": 6,
"stem": "A school offers a Dzongkhag course. This year, all students in the course were offered additional grammar lessons. The students who took additional grammar lessons did better in the course than students who didn’t take the additional grammar lessons. Based on these results, which of the following is the most appropriate conclusion?",
"opts": [
"Taking additional grammar lessons will cause an improvement for any student who takes any foreign language course.",
"Taking additional grammar lessons will cause an improvement for any student who takes dzongkhag course.",
"Taking additional grammar lessons was the cause of the improvement for the students who took Dzongkhag course.",
"No conclusion about cause and effect can be made regarding students who took the additional grammar lessons and their performance in the Dzongkhag course."
]
},
{
"n": 7,
"stem": "What is the process called if you are using information from a sample to make generalization about the larger population?",
"opts": [
"Statistical inference",
"Statistical information",
"Statistical data",
"None of the above"
]
},
{
"n": 8,
"stem": "The average age of the students in the class is 22 years. Which of the following is TRUE about the statement?",
"opts": [
"The statement describes inferential statistics.",
"The statement describes descriptive statistics.",
"The statement does not describe inferential nor descriptive statistics.",
"The statement gives no detailed information."
]
},
{
"n": 9,
"stem": "What is the mean, median and mode of the observations: 9,6,10,8,10,8,4,8,3,8?",
"opts": [
"7.1, 8, 7",
"7.4, 8, 8",
"7.5, 8, 0",
"7, 8, 8"
]
},
{
"n": 10,
"stem": "Which of the following is NOT TRUE about the descriptive statistical problem?",
"opts": [
"Information revealed in a data set is summarised.",
"Predictions are made about a larger set of data.",
"Data are displayed visually in graphs.",
"Patterns in the data set are identified."
]
},
{
"n": 11,
"stem": "Wangmo secured 89 on her history exam and 81 on her maths exam. The mean score for history paper was 82 with a standard deviation of 5 while for maths the mean score was 76 with a standard deviation of 3. On which exam did she do better compare to the rest of the class?",
"opts": [
"She did better on her maths exam.",
"She did better on her history exam.",
"Her scores for maths and history were same although the mean scores and standard deviations were different.",
"None of the above"
]
},
{
"n": 12,
"stem": "Assume that the heights of Statistics graduates of 2022 are normally distributed, with a mean of 65 inches and standard deviation of 2.5 inches. What percentage of Statistics graduates are taller than 65 inches?",
"opts": [
"50%",
"25%",
"20%",
"10%"
]
},
{
"n": 13,
"stem": "Assume that the heights of Statistics graduates of 2022 are normally distributed, with a mean of 65 inches and standard deviation of 2.5 inches. What percentage of Statistics graduates are between 62.5 inches and 67.5 inches?",
"opts": [
"50%",
"65%",
"68%",
"75%"
]
},
{
"n": 14,
"stem": "Assume that the heights of Statistics graduates of 2022 are normally distributed, with a mean of 65 inches and standard deviation of 2.5 inches. What percentage of Statistics graduates are between 60 inches and 70 inches?",
"opts": [
"50%",
"68%",
"95%",
"100% Questions 15, 16 and 17. Given the following z-scores on a standard normal distribution, find the percent of the total area under the standard normal curve."
]
},
{
"n": 15,
"stem": "Using the standard normal distribution, what percent of the total area under the standard normal curve is to the left of z = 1.45?",
"opts": [
"50.65%",
"68.65%",
"92.65%",
"99.65%"
]
},
{
"n": 16,
"stem": "Using the standard normal distribution, what percent of the total area under the standard normal curve is to the right of z = −0.13?",
"opts": [
"45.00%",
"50.00%",
"55.17%",
"56.00%"
]
},
{
"n": 17,
"stem": "Using the standard normal distribution, what percent of the total area under the standard normal curve is between z = 1.37 and z = 2.98?",
"opts": [
"5.39%",
"7.39%",
"8.39%",
"8.49%"
]
},
{
"n": 18,
"stem": "National Statistics Bureau wants to conduct a study to estimate area under paddy cultivation in the country. The sample was randomly chosen from Renewable Natural Resources (RNR) Census data of 2019. What is the variable of interest in this study?",
"opts": [
"All paddy growers in the western regions.",
"All paddy growers in the central regions.",
"All paddy growers in the southern and eastern regions.",
"All paddy growers in the country irrespective of their locations."
]
},
{
"n": 19,
"stem": "There were 60 Dzongkha graduates, 56 Maths graduates, 40 Bio-science graduates and x Statistics graduates sitting for a free PE coaching class in Thimphu. The corresponding relative frequency for Dzongkha is 0.3, Maths 0.3, Bio-science 0.2 and Statistics 0.2. How many Statistics graduates were there in the PE coaching?",
"opts": [
"52",
"48",
"44",
"22"
]
},
{
"n": 20,
"stem": "A survey was conducted in the civil service to determine how subordinates feel about the leadership quality of their supervisor. Subordinates rated the overall quality from 0 (no quality at all) to 100 (extremely good quality); the ratings are shown in the stem-and-leaf plot. What percentage of the subordinates rated their supervisor as very good leadership (ratings 80 and above)?",
"opts": [
"1 %",
"4%",
"6%",
"24%"
],
"image": "/papers/me/tech2-stat-2022-stemleaf.png"
},
{
"n": 21,
"stem": "Which of the following is NOT a measure of central tendency?",
"opts": [
"Mean",
"Median",
"Mode",
"Range"
]
},
{
"n": 22,
"stem": "The summary statistics of high school dropout rates: 1998 - N = 51, mean = 28.15, median = 27.43; 2002 - N = 51, mean = 26.75, median = 25.65. Which of the following statements is TRUE about the shape of the distributions of the dropout rates in 1998 and 2002?",
"opts": [
"Both the 1998 and 2002 high school dropout rates have distributions that are skewed to the right.",
"The 1998 high school dropout rate has distribution skewed to the left and the 2002 has distribution skewed to the right.",
"The 1998 high school dropout rate has distribution skewed to the right and the 2002 has distribution skewed to the left.",
"None of the above"
]
},
{
"n": 23,
"stem": "Which of the following statements is TRUE about the mean and median?",
"opts": [
"The mean and median are useful measures of central tendency for both qualitative and quantitative data.",
"The mean and median are useful measures of central tendency for only qualitative data.",
"The mean and median are useful measures of central tendency for only quantitative data.",
"The mean and median are not useful measures of central tendency for both qualitative and quantitative data."
]
},
{
"n": 24,
"stem": "The following are the standardized test scores of 5 students in a class with a mean score of 500 points and a standard deviation of 100 points: Nima 575, Dawa 690, Karma 750, Sonam 280, Wangmo 440. Which of the students have scores within 2 standard deviations of the mean?",
"opts": [
"Karma, Sonam",
"Nima, Dawa, Wangmo",
"Nima, Dawa",
"Nima, Dawa, Karma, Wangmo"
]
},
{
"n": 25,
"stem": "Use the observations: 21, 9, 7, 6, 5, 2, 2, 0. What is the range of the observations?",
"opts": [
"21",
"9",
"7",
"6"
]
},
{
"n": 26,
"stem": "Use the observations: 21, 9, 7, 6, 5, 2, 2, 0. What is the interquartile range of the observations?",
"opts": [
"21",
"9",
"7",
"6"
]
},
{
"n": 27,
"stem": "Use the observations: 21, 9, 7, 6, 5, 2, 2, 0. What is the standard deviation of the observations? Consider these observations as a population.",
"opts": [
"5.69",
"6.14",
"6.50",
"6.54"
]
},
{
"n": 28,
"stem": "Summary statistics of 1,000 randomly sampled taxis in Thimphu, with the total number of passengers carried in 2021: Min 4,005; Q1 5,605; Average 7,005; Q3 8,605; Max 10,605; Std. dev. 1,400. What is the percentage of taxis in Thimphu with a total number of passengers between 5,605 and 8,605?",
"opts": [
"100%",
"75%",
"50%",
"25%"
]
},
{
"n": 29,
"stem": "The weights of pregnant women were measured in kg. The mean weight was obtained with 83 kg and the standard deviation was 5 kg. Which of the following weights would be classified as an outlier?",
"opts": [
"73 kg",
"78 kg",
"91 kg",
"99 kg"
]
},
{
"n": 30,
"stem": "Which of the following statements is TRUE about the presence of outlier in the data?",
"opts": [
"The measurement may be correct and from the same population as the rest but represent a rare event.",
"The measurement belongs to a population different from that from which the rest of the same was drawn.",
"The measurement is incorrect. It may have been observed, recorded, or entered incorrectly.",
"All of the above are explanations for outliers"
]
},
{
"n": 31,
"stem": "The weights of pregnant women were measured in kg. The lower quartile of the weights was recorded at 88 kg. Which of the following statements is TRUE?",
"opts": [
"25% of the pregnant women’s weights were 88 kg.",
"75% of the pregnant women’s weights were less than 88 kg.",
"75% of the pregnant women’s weights were greater than 88 kg.",
"88% of the pregnant women’s mean weight was 88 kg."
]
},
{
"n": 32,
"stem": "A, B, C and D are sample points and the only possible outcomes of an experiment. P(A) = 1/8, P(B) = 1/8 and P(C) = 1/8. What is the probability of the sample point D?",
"opts": [
"1/8",
"3/8",
"5/8",
"1/4"
]
},
{
"n": 33,
"stem": "An experiment was conducted: two dice were rolled and the resulting values were summed. Which of the following is NOT a sample point for this experiment?",
"opts": [
"1",
"2",
"6",
"7"
]
},
{
"n": 34,
"stem": "Use the following table. It shows the types of medals offered to winning participants of the national open championship by the Bhutan Olympic Committee (BoC):\nGold, Gold, Silver, Gold, Bronze, Silver, Silver,\nBronze, Gold, Silver, Silver, Bronze, Silver, Gold,\nGold, Silver, Silver, Bronze, Bronze, Gold, Silver,\nGold, Gold, Bronze, Bronze\nWhat is the sample space for the above championship?",
"opts": [
"{Gold, Silver, Bronze}",
"{Gold, Gold, Silver, Bronze}",
"{Gold, Silver, Silver, Bronze}",
"{Gold, Silver, Bronze, Bronze}"
]
},
{
"n": 35,
"stem": "Use the following table. It shows the types of medals offered to winning participants of the national open championship by the Bhutan Olympic Committee (BoC):\nGold, Gold, Silver, Gold, Bronze, Silver, Silver,\nBronze, Gold, Silver, Silver, Bronze, Silver, Gold,\nGold, Silver, Silver, Bronze, Bronze, Gold, Silver,\nGold, Gold, Bronze, Bronze\nWhat is the probability of offering the gold medal to the winning participants of the national open championship by BoC?",
"opts": [
"0.25",
"0.33",
"0.36",
"0.50"
]
},
{
"n": 36,
"stem": "Use the following table. It shows the types of medals offered to winning participants of the national open championship by the Bhutan Olympic Committee (BoC):\nGold, Gold, Silver, Gold, Bronze, Silver, Silver,\nBronze, Gold, Silver, Silver, Bronze, Silver, Gold,\nGold, Silver, Silver, Bronze, Bronze, Gold, Silver,\nGold, Gold, Bronze, Bronze\nWhat is the probability of offering the gold or silver medal to the winning participants of the national open championship by BoC?",
"opts": [
"0.50",
"0.66",
"0.72",
"0.75"
]
},
{
"n": 37,
"stem": "There are two bags containing sweets. Bag A contains 72 sweets with an estimated total mass of 852.4g while bag B contains 24 sweets with an estimated total mass of 282.8g. Using the information provided, what would be the mean mass of the sweets altogether?",
"opts": [
"15.767 g",
"11.783 g",
"11.839 g",
"11.825 g"
]
},
{
"n": 38,
"stem": "A survey of graduates in one of the universities in Bhutan revealed that the sum of the ages of 10 boys was 127 years 5 years ago, while the sum of the ages of 15 girls in 5 years' time will be 351 years. What is the mean age of the 10 boys today?",
"opts": [
"7.7 years",
"10.7 years",
"17.7 years",
"27.7 years"
]
},
{
"n": 39,
"stem": "A survey of graduates in one of the universities in Bhutan revealed that the sum of the ages of 10 boys was 127 years 5 years ago, while the sum of the ages of 15 girls in 5 years' time will be 351 years. What is the mean age of the 15 girls today?",
"opts": [
"28.4 years",
"18.4 years",
"11.4 years",
"10.4 years"
]
},
{
"n": 40,
"stem": "A survey of graduates in one of the universities in Bhutan revealed that the sum of the ages of 10 boys was 127 years 5 years ago, while the sum of the ages of 15 girls in 5 years' time will be 351 years. What is the mean age of the 10 boys and 15 girls combined?",
"opts": [
"17.70 years",
"18.12 years",
"18.40 years",
"28.40 years"
]
},
{
"n": 41,
"stem": "Which of the following statements is NOT TRUE about these students’ performance in the monthly Maths test?",
"opts": [
"The mean score in the monthly Maths test by Sonam and Dorji is the same",
"Sonam is a consistent performer compared to Dorji in the monthly Maths test",
"The patterns of the marks obtained by Dorji do not vary much compared to Sonam",
"Nothing can be said about Sonam and Dorjis’ performance in the monthly Math test"
]
},
{
"n": 42,
"stem": "Every Saturday, Dorji invites his sister Pema to the cinema or to lunch. 70% of his invitations are to the cinema and 90% of these are accepted. Pema rejects 40% of her brother's invitations to lunch. What is the probability that Dorji invites his sister Pema to lunch?",
"opts": [
"0.70",
"0.50",
"0.30",
"0.20"
]
},
{
"n": 43,
"stem": "Every Saturday, Dorji invites his sister Pema to the cinema or to lunch. 70% of his invitations are to the cinema and 90% of these are accepted. Pema rejects 40% of her brother's invitations to lunch. What is the probability that Dorji invites Pema to lunch and she rejects the invitation?",
"opts": [
"0.12",
"0.13",
"0.14",
"0.15"
]
},
{
"n": 44,
"stem": "Every Saturday, Dorji invites his sister Pema to the cinema or to lunch. 70% of his invitations are to the cinema and 90% of these are accepted. Pema rejects 40% of her brother's invitations to lunch. What is the probability that Dorji invites Pema to the cinema and she rejects the invitation?",
"opts": [
"0.02",
"0.04",
"0.05",
"0.07"
]
},
{
"n": 45,
"stem": "The probability distribution of X is: x = 0, 5, 15, 20 with P(X = x) = 1/12, 3/12, 5/12, 3/12. What is the expectation of the distribution?",
"opts": [
"11.5",
"12.5",
"13.5",
"14.5"
]
},
{
"n": 46,
"stem": "The probability distribution of X is: x = 0, 5, 15, 20 with P(X = x) = 1/12, 3/12, 5/12, 3/12. What is the variance of the distribution?",
"opts": [
"41.75",
"42.75",
"43.75",
"44.75"
]
},
{
"n": 47,
"stem": "The probability distribution of X is: x = 0, 5, 15, 20 with P(X = x) = 1/12, 3/12, 5/12, 3/12. What is the standard deviation of the distribution?",
"opts": [
"6.46",
"6.54",
"6.61",
"6.69"
]
},
{
"n": 48,
"stem": "The weight of newborn babies recorded by JDWNRH, Thimphu was found to be normally distributed with mean 3.35 kg and variance 0.085 kg². About how many of the 1,356 babies born last year had a weight of less than 3.5 kg?",
"opts": [
"943 newborn babies",
"843 newborn babies",
"743 newborn babies",
"643 newborn babies"
]
},
{
"n": 49,
"stem": "Given that X ~ N(11, 25), what is P(X < 18)?",
"opts": [
"0.619",
"0.719",
"0.819",
"0.919"
]
},
{
"n": 50,
"stem": "Given that X ~ N(20, 7), where 7 is the variance, what is P(X ≤ 16.6)?",
"opts": [
"0.0994",
"0.0884",
"0.0774",
"0.0664"
]
},
{
"n": 51,
"stem": "The back-to-back stem plot shows the recorded ages of students by gender in a school (stem = tens, leaf = units). Which of the following statements about the median ages is TRUE?",
"opts": [
"The median age of male is less than that of female",
"The median age of male is almost equal to that of female",
"The median age of male is greater than that of female",
"The median age of male is 25 years while that of female is 40 years"
],
"image": "/papers/me/tech2-stat-2022-stemplot.png"
},
{
"n": 52,
"stem": "The back-to-back stem plot shows the recorded ages of students by gender in a school (stem = tens, leaf = units). What is the range of ages for male and female?",
"opts": [
"Male=40 years; Female=25 years",
"Male=40 years; Female=26 years",
"Male=40 years; Female=27 years",
"Male=40 years; Female=28 years"
],
"image": "/papers/me/tech2-stat-2022-stemplot.png"
},
{
"n": 53,
"stem": "The back-to-back stem plot shows the recorded ages of students by gender in a school (stem = tens, leaf = units). Which of the following statements about the mean and median ages is TRUE?",
"opts": [
"The mean age of male is equal to the median age of female.",
"The mean age of male is equal to the median age of male.",
"The mean age of female is equal to the median age of male.",
"The mean age of female is equal to the median age of female."
],
"image": "/papers/me/tech2-stat-2022-stemplot.png"
},
{
"n": 54,
"stem": "A regression of milk output on the number of milking cows gave: Intercept - estimate 3.415, t = 4.932, p = 0.0004, SE 0.613; No. of milking cows - estimate 0.36, t = 0.84, p = 0.041, SE 0.028. Which of the following is the best-fit regression line?",
"opts": [
"y = 0.36 + 3.415x",
"y = 3.415 + 3.6x",
"y = 3.415 + 0.36x",
"y = 4.932 + 0.84x"
]
},
{
"n": 55,
"stem": "Suppose a simple random sample of size 50 is selected from a population. Which of the following is TRUE about the sample?",
"opts": [
"It is selected so that every set of 50 subjects in the population has an equal chance of being the sample chosen.",
"It is not drawn in such a way that every subject has the same chance of being selected.",
"Some members of the population have no chance of being selected, but those that can be selected have the same change of being selected.",
"None of the members have equal chance of being selected."
]
},
{
"n": 56,
"stem": "What is the value of the linear correlation coefficient?",
"opts": [
"0.50",
"0.65",
"0.75",
"0.78"
]
},
{
"n": 57,
"stem": "An accountant in the National Statistics Bureau investigated the association between GDP (million Nu.) and the population (million) of the country for 2009-2017, with the regression output shown. What is the equation of the regression line (x = population)?",
"opts": [
"ŷ = −694,533 + 228,729x",
"ŷ = −694,533 + 1,110,086x",
"ŷ = 228,729 + 315,562x",
"ŷ = −3.04 + 3.52x"
],
"image": "/papers/me/tech2-stat-2022-regression.png"
},
{
"n": 58,
"stem": "An accountant in the National Statistics Bureau investigated the association between GDP (million Nu.) and the population (million) of the country for 2009-2017, with the regression output shown. Using the fitted line, what will be the value of GDP when the population is close to 1 million in 2025?",
"opts": [
"465,804.00 million",
"415,553.30 million",
"544,290.80 million",
"0.48 million"
],
"image": "/papers/me/tech2-stat-2022-regression.png"
},
{
"n": 59,
"stem": "Which of the following is TRUE about the Central Limit Theorem for a sample of size n?",
"opts": [
"The standard deviation of the sample mean is greater than the population standard deviation.",
"The expectation of the sample mean is equal to the population mean μ when n is large.",
"The sampling distribution of the sample mean is always normal for any sample size n.",
"The standard deviation of the sample mean is equal to the population standard deviation σ."
]
},
{
"n": 60,
"stem": "A 95% confidence interval for the difference (treatment – control) in the mean activity levels were 2.5 and 4.7. Which of the following is TRUE about this interval?",
"opts": [
"We are 95% confident that the average decrease in activity level in the sample is 3.6 hours.",
"We are 95% confident that the increase in the mean decrease lies between 2.5 and 4.7",
"The activity level of 95% decreased between 2.5 and 4.7",
"We are 5% confident that the increase in the mean decrease lies between 2.5 and 4.7"
]
},
{
"n": 61,
"stem": "A 95% confidence interval for the difference (treatment – control) in the mean activity levels were 2.5 and 4.7. What will happen to the confidence interval if a 90% confidence interval is applied instead?",
"opts": [
"Confidence interval would be wider and involve a larger risk of being incorrect.",
"Confidence interval would be wider and involve a smaller risk of being incorrect.",
"Confidence interval would be narrower and involve a larger risk of being incorrect.",
"Confidence interval would be narrower and involve a smaller risk of being incorrect."
]
},
{
"n": 62,
"stem": "For the case of income distribution study, central tendency measure such as that of median is used instead of others. Which of the following statements is TRUE?",
"opts": [
"The income distributions generally have unequal class intervals.",
"The income distributions are generally symmetrical.",
"The income distributions are generally bimodal.",
"Income distributions are generally skewed."
]
},
{
"n": 63,
"stem": "Which of the following best describes the data?",
"opts": [
"For the case of left skewed distribution data, mean is less than median.",
"For the case of right skewed distribution data, mean is less than median.",
"For the case of symmetric distribution data, mean is greater than median.",
"For the case of symmetric distribution data, mean is less than median."
]
},
{
"n": 64,
"stem": "The correlation coefficient between the variables x and y is -0.94. Which of the following statements is TRUE?",
"opts": [
"x causes y",
"y causes x",
"low scores on x are associated with high scores on y",
"low scores on x are associated with low scores on y"
]
},
{
"n": 65,
"stem": "The average height of men is 71 inches with a standard deviation of 4 inches, while the average height of women is 66 inches with a standard deviation of 3 inches. What will be the mean and standard deviation for the difference in heights if we look at pairing up one man with one woman?",
"opts": [
"Mean of 5 inches with a standard deviation of 3.5 inch",
"Mean of 5 inches with a standard deviation of 1 inch",
"Mean of 5 inches with a standard deviation of 5 inch",
"Mean of 68.5 inches with a standard deviation of 1 inch"
]
},
{
"n": 66,
"stem": "Sonam says “There is a strong positive correlation between the number of firefighters at a fire and the amount of damage it does. So sending more firefighters just causes more damage.” Which of the following statements is TRUE about the conclusion made by Sonam?",
"opts": [
"The conclusion drawn is incorrect which is an example of a confounding variable.",
"The conclusion drawn is correct as it is an example of causation.",
"The conclusion drawn is incorrect as it is an example of common response.",
"The conclusion drawn is correct although it is influenced by a lurking variable."
]
},
{
"n": 67,
"stem": "The table shows the probability distribution of two characteristics: age and traffic violations in the last 12 months.\nAge | None | One | Two+\nUnder 18 | 0.23 | 0.12 | 0.05\n18 or older | 0.45 | 0.14 | 0.01\nWhat is the probability that a randomly selected person had no traffic violations in the last 12 months, given that he/she is 18 or older?",
"opts": [
"0.45",
"0.60",
"0.65",
"0.75"
]
},
{
"n": 68,
"stem": "The table shows the probability distribution of two characteristics: age and traffic violations in the last 12 months.\nAge | None | One | Two+\nUnder 18 | 0.23 | 0.12 | 0.05\n18 or older | 0.45 | 0.14 | 0.01\nWhat is the probability of being under 18 or having one violation?",
"opts": [
"0.12",
"0.26",
"0.54",
"0.66"
]
},
{
"n": 69,
"stem": "A distribution which is skewed to the right has mean 19 and mode 16. What would be value of median?",
"opts": [
"14",
"18",
"20",
"25"
]
},
{
"n": 70,
"stem": "Which of the following measures will be useful in deciding if a group of individuals varies more with respect to height or varies more with respect to weight?",
"opts": [
"Inter-quartile range",
"Standard deviation",
"Coefficient of variation",
"Correlation coefficient"
]
}
]"""

KEY = {
 1: ("d", "Statistics is the science of collecting, organising, presenting, analysing and interpreting data to help make better decisions - all five stages."),
 2: ("a", "Adults : children = 5 : 1, so children are 1/6 of 240 = 40."),
 3: ("c", "Two books are added every month - a constant amount per unit time - so the number grows as an increasing linear function."),
 4: ("a", "Maths scores cluster tightly around the mean (mostly 3 and 4), while English scores are spread evenly with many far from the mean, so Maths has the smaller SD."),
 6: ("d", "This is an observational comparison - students chose whether to take the lessons - so other factors could explain the difference; no cause-and-effect conclusion can be made."),
 7: ("a", "Using a sample to generalise about a larger population is statistical inference."),
 8: ("b", "The statement only summarises the class it describes - descriptive statistics."),
 9: ("b", "Sum = 74, so mean = 7.4. Sorted: 3, 4, 6, 8, 8, 8, 8, 9, 10, 10 - median = (8 + 8)/2 = 8; 8 occurs most often, so mode = 8."),
 10: ("b", "Making predictions about a larger set of data is inferential, not descriptive, statistics."),
 11: ("a", "Compare z-scores: history (89 − 82)/5 = 1.4; maths (81 − 76)/3 = 1.67. Her maths score is further above the class, so she did better in maths."),
 12: ("a", "The normal distribution is symmetric about the mean (65), so 50% are taller than 65 inches."),
 13: ("c", "62.5 to 67.5 is the mean ± 1 SD, which covers about 68% (empirical rule)."),
 14: ("c", "60 to 70 is the mean ± 2 SD, which covers about 95%."),
 15: ("c", "From the z-table, Φ(1.45) = 0.92647, i.e. about 92.65%."),
 16: ("c", "Area to the right of −0.13 = area to the left of +0.13 = 0.55172, i.e. 55.17%."),
 17: ("c", "Φ(2.98) − Φ(1.37) = 0.99856 − 0.91466 = 0.0839, i.e. 8.39%."),
 19: ("c", "Dzongkha: 60 = 0.3 × N, so N = 200. x = 200 − (60 + 56 + 40) = 44 (≈ 0.2 × 200)."),
 20: ("b", "The plot has 25 ratings (2 + 8 + 7 + 5 + 2 + 0 + 1); only 96 is 80 or above: 1/25 = 4%."),
 21: ("d", "Range is a measure of dispersion (spread), not of central tendency."),
 22: ("a", "In both years the mean is greater than the median (28.15 > 27.43; 26.75 > 25.65), which indicates right (positive) skew."),
 23: ("c", "Mean and median need numerical values, so they are useful only for quantitative data; qualitative data use the mode."),
 24: ("b", "Within 2 SD means 300 to 700: Nima 575, Dawa 690 and Wangmo 440. Karma (750) and Sonam (280) are outside."),
 25: ("a", "Range = largest − smallest = 21 − 0 = 21."),
 26: ("d", "Sorted: 0, 2, 2, 5, 6, 7, 9, 21. Q1 = median of 0, 2, 2, 5 = 2; Q3 = median of 6, 7, 9, 21 = 8. IQR = 8 − 2 = 6."),
 27: ("b", "Mean = 52/8 = 6.5. Σ(x − 6.5)² = 302; population variance = 302/8 = 37.75; SD = √37.75 = 6.14."),
 28: ("c", "5,605 is Q1 and 8,605 is Q3, and the middle 50% of the data lies between the quartiles."),
 29: ("d", "99 kg is (99 − 83)/5 = 3.2 SD above the mean - beyond 3 SD, so it is an outlier. The others are within 2 SD (73 kg is exactly −2 SD)."),
 30: ("d", "An outlier can be a genuine rare value, come from a different population, or be an error in measuring or recording - all are possible explanations."),
 31: ("c", "The lower quartile (Q1) has 25% of values below it, so 75% of the weights were greater than 88 kg."),
 32: ("c", "Probabilities of all sample points sum to 1: P(D) = 1 − 3/8 = 5/8."),
 33: ("a", "The sum of two dice ranges from 2 to 12, so 1 cannot occur."),
 34: ("a", "The distinct possible outcomes are Gold, Silver and Bronze: S = {Gold, Silver, Bronze}."),
 35: ("c", "The table has 25 entries: 9 Gold, 9 Silver and 7 Bronze. P(Gold) = 9/25 = 0.36."),
 36: ("c", "P(Gold or Silver) = (9 + 9)/25 = 18/25 = 0.72."),
 37: ("d", "Total mass ÷ total number = (852.4 + 282.8)/(72 + 24) = 1,135.2/96 = 11.825 g."),
 38: ("c", "Each boy is 5 years older now: 127 + 10 × 5 = 177, so the mean age = 177/10 = 17.7 years."),
 39: ("b", "Each girl is 5 years younger now than in 5 years: 351 − 15 × 5 = 276, so the mean age = 276/15 = 18.4 years."),
 40: ("b", "Combined mean = (177 + 276)/25 = 453/25 = 18.12 years."),
 42: ("c", "70% of invitations are to the cinema, so 30% (0.30) are to lunch."),
 43: ("a", "P(lunch and rejected) = 0.30 × 0.40 = 0.12."),
 44: ("d", "P(cinema and rejected) = 0.70 × (1 − 0.90) = 0.70 × 0.10 = 0.07."),
 45: ("b", "E(X) = Σx·p = (0 × 1 + 5 × 3 + 15 × 5 + 20 × 3)/12 = 150/12 = 12.5."),
 46: ("c", "E(X²) = (0 + 25 × 3 + 225 × 5 + 400 × 3)/12 = 2,400/12 = 200. Var = 200 − 12.5² = 200 − 156.25 = 43.75."),
 47: ("c", "SD = √43.75 = 6.61."),
 48: ("a", "SD = √0.085 = 0.2915; z = (3.5 − 3.35)/0.2915 = 0.51; Φ(0.51) ≈ 0.695; 0.695 × 1,356 ≈ 943 babies."),
 49: ("d", "σ = √25 = 5; z = (18 − 11)/5 = 1.4; P(Z < 1.4) = 0.919."),
 50: ("a", "σ = √7 = 2.646; z = (16.6 − 20)/2.646 = −1.29; P(Z ≤ −1.29) ≈ 0.0994."),
 51: ("c", "Male ages: 20, 25, 30, 35, 40, 45, 50, 55, 60 - median 40. Female ages: 15, 15, 20, 25, 25, 30, 30, 35, 40 - median 25. The male median is greater."),
 52: ("a", "Male range = 60 − 20 = 40 years; female range = 40 − 15 = 25 years."),
 53: ("b", "Male mean = 360/9 = 40 = male median 40. Female mean = 235/9 ≈ 26.1, which differs from both medians."),
 54: ("c", "The fitted line uses the estimates: intercept 3.415 and slope 0.36, so y = 3.415 + 0.36x. (t values and SEs are not coefficients.)"),
 55: ("a", "In simple random sampling every possible set of 50 subjects has the same chance of being the sample (so every individual also has an equal chance)."),
 57: ("b", "The coefficients are −694,532.7 (constant) and 1,110,086 (population): ŷ = −694,533 + 1,110,086x."),
 58: ("b", "ŷ = −694,532.7 + 1,110,086 × 1 = 415,553.3 million Nu."),
 59: ("b", "E(X̄) = μ (true for any n). The SD of X̄ is σ/√n, smaller than σ, and X̄ is only approximately normal for large n unless the population is normal."),
 60: ("b", "A confidence interval is about the population parameter: we are 95% confident the true mean difference lies between 2.5 and 4.7."),
 61: ("c", "A lower confidence level needs a smaller critical value, so the interval is narrower but has a larger risk (10%) of missing the true value."),
 62: ("d", "Income distributions are usually right-skewed by a few very high incomes, so the median represents a typical income better than the mean."),
 63: ("a", "In a left (negatively) skewed distribution the long left tail pulls the mean below the median. In a symmetric distribution mean = median. (The paper printed option c twice; option d is shown as 'less than'.)"),
 64: ("c", "r = −0.94 is a strong negative association: low x goes with high y. Correlation does not show causation."),
 65: ("c", "Mean difference = 71 − 66 = 5 inches. For independent pairs, Var = 4² + 3² = 25, so SD = 5 inches."),
 67: ("d", "P(none | 18+) = 0.45/(0.45 + 0.14 + 0.01) = 0.45/0.60 = 0.75."),
 68: ("c", "P(under 18 or one) = P(under 18) + P(one) − P(both) = 0.40 + 0.26 − 0.12 = 0.54."),
 69: ("b", "Empirical relation: mean − mode = 3(mean − median): 19 − 16 = 3(19 − median), so median = 18."),
 70: ("c", "Height and weight have different units, so compare relative spread with the coefficient of variation (SD/mean × 100)."),
}

NEW_MCQ = [
    ("The mean of 5 observations is 12. Four of them are 10, 14, 9 and 15. The fifth observation is", ["10", "12", "14", "11"], "b",
     "Total = 5 × 12 = 60; the four known values sum to 48, so the fifth is 60 − 48 = 12."),
    ("For two events, P(A) = 0.6, P(B) = 0.5 and P(A ∩ B) = 0.3. What is P(A | B)?", ["0.3", "0.5", "0.6", "0.18"], "c",
     "P(A | B) = P(A ∩ B)/P(B) = 0.3/0.5 = 0.6 (here A and B happen to be independent)."),
    ("If every value in a data set is multiplied by 3, the standard deviation is", ["Unchanged", "Multiplied by 3", "Multiplied by 9", "Increased by 3"], "b",
     "Multiplying every value by a constant multiplies the SD by that constant (and the variance by its square, 9)."),
    ("The number of degrees of freedom for a chi-square test of independence on a 3 × 4 contingency table is", ["12", "7", "6", "5"], "c",
     "df = (rows − 1)(columns − 1) = (3 − 1)(4 − 1) = 6."),
    ("The mean of a continuous uniform distribution on the interval [2, 10] is", ["4", "6", "8", "5.33"], "b",
     "For a uniform distribution on [a, b], the mean = (a + b)/2 = (2 + 10)/2 = 6."),
]

HOU = "The following are the monthly prices (in thousands of Ngultrum) of a random sample of 2-bedded houses in Thimphu:\n7, 9, 6, 6, 8, 8, 8, 8, 6, 9, 7, 5\n\n"
UNIT = "The paper's introduction says the prices are 'in hundreds' while its questions ask for answers 'in thousands'; the stem uses thousands, as the questions do."
SAQ = [
 dict(marks=5, stem=HOU + "Is this a sample or a population? Give a reason. (5 marks)", issues=[UNIT],
      kp=[("It is a sample", 2), ("Reason: only 12 randomly selected 2-bedded houses are included, not all 2-bedded houses in Thimphu", 2),
          ("So any mean or SD computed is a statistic used to estimate the population parameter", 1)],
      model="It is a sample. The data are the monthly prices of a random sample of 12 two-bedded houses, not of every 2-bedded house in Thimphu (which would be the population). Measures calculated from these data (mean, SD, etc.) are therefore sample statistics, used to estimate the corresponding population parameters for all 2-bedded houses in Thimphu."),
 dict(marks=5, stem=HOU + "What is the range of the monthly prices for 2-bedded houses (in thousands) in Thimphu? (5 marks)", issues=[UNIT],
      kp=[("Highest value = 9 and lowest value = 5", 2), ("Range = highest − lowest = 9 − 5 = 4", 2), ("Range = 4 thousand, i.e. Nu. 4,000", 1)],
      model="Highest price = 9 thousand; lowest price = 5 thousand.\nRange = maximum − minimum = 9 − 5 = 4.\nThe range of monthly prices is 4 thousand, i.e. Nu. 4,000."),
 dict(marks=5, stem=HOU + "What is the mean monthly price for 2-bedded houses (in thousands) in Thimphu? (5 marks)", issues=[UNIT],
      kp=[("Formula x̄ = Σx/n", 1), ("Σx = 87 and n = 12", 2), ("x̄ = 87/12 = 7.25 thousand, i.e. Nu. 7,250", 2)],
      model="x̄ = Σx/n.\nΣx = 7 + 9 + 6 + 6 + 8 + 8 + 8 + 8 + 6 + 9 + 7 + 5 = 87; n = 12.\nx̄ = 87/12 = 7.25.\nThe mean monthly price is 7.25 thousand, i.e. Nu. 7,250."),
 dict(marks=5, stem=HOU + "What can you say about the median monthly price for 2-bedded houses (in thousands) in Thimphu? (5 marks)", issues=[UNIT],
      kp=[("Data arranged in order: 5, 6, 6, 6, 7, 7, 8, 8, 8, 8, 9, 9", 1.5), ("n = 12 is even, so the median is the mean of the 6th and 7th values: (7 + 8)/2 = 7.5", 2),
          ("Interpretation: half the houses cost Nu. 7,500 or less and half cost more; the median (7.5) is slightly above the mean (7.25), suggesting a slight left skew", 1.5)],
      model="Ordered data: 5, 6, 6, 6, 7, 7, 8, 8, 8, 8, 9, 9 (n = 12).\nSince n is even, the median is the average of the 6th and 7th values = (7 + 8)/2 = 7.5.\nThe median monthly price is 7.5 thousand (Nu. 7,500): half of the sampled houses rent for Nu. 7,500 or less and half for more. The median is a little higher than the mean (7.25), so the data are slightly skewed to the left (a few cheaper houses pull the mean down)."),
 dict(marks=5, stem=HOU + "Calculate the sample standard deviation using the given monthly prices of 2-bedded houses (in thousands) in Thimphu. (5 marks)", issues=[UNIT],
      kp=[("Formula s = √[Σ(x − x̄)²/(n − 1)] with x̄ = 7.25", 1), ("Σ(x − x̄)² = 18.25 (or Σx² − (Σx)²/n = 649 − 630.75)", 2),
          ("s² = 18.25/11 = 1.659", 1), ("s = √1.659 ≈ 1.29 thousand (about Nu. 1,288)", 1)],
      model="Sample SD: s = √[Σ(x − x̄)²/(n − 1)], x̄ = 7.25, n = 12.\nDeviations squared: 5 → 5.0625; 6 (three times) → 3 × 1.5625 = 4.6875; 7 (twice) → 2 × 0.0625 = 0.125; 8 (four times) → 4 × 0.5625 = 2.25; 9 (twice) → 2 × 3.0625 = 6.125.\nΣ(x − x̄)² = 5.0625 + 4.6875 + 0.125 + 2.25 + 6.125 = 18.25.\n(Check: Σx² = 649 and (Σx)²/n = 87²/12 = 630.75; 649 − 630.75 = 18.25.)\ns² = 18.25/11 = 1.659; s = √1.659 = 1.288.\nThe sample standard deviation is about 1.29 thousand, i.e. about Nu. 1,288."),
 dict(real=False, marks=5, stem=HOU + "Find the mode and the interquartile range of the monthly prices, and comment on the shape of the distribution using the mean (7.25) and median (7.5). (5 marks)",
      kp=[("Mode = 8 (occurs four times)", 1), ("Q1 = 6 and Q3 = 8 (medians of the lower and upper halves)", 2), ("IQR = Q3 − Q1 = 2 thousand (Nu. 2,000)", 1),
          ("Mean (7.25) < median (7.5) < mode (8): the distribution is slightly negatively (left) skewed", 1)],
      model="Ordered data: 5, 6, 6, 6, 7, 7 | 8, 8, 8, 8, 9, 9.\nMode = 8 (it occurs most often - four times).\nQ1 = median of the lower half (5, 6, 6, 6, 7, 7) = (6 + 6)/2 = 6; Q3 = median of the upper half (8, 8, 8, 8, 9, 9) = (8 + 8)/2 = 8.\nIQR = 8 − 6 = 2 thousand (Nu. 2,000): the middle half of the houses rent within a Nu. 2,000 band.\nShape: mean (7.25) < median (7.5) < mode (8), so the distribution is slightly negatively (left) skewed - a few cheaper houses (such as the one at 5) pull the mean down."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
