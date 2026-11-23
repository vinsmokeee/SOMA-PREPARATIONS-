"""ME Technical Paper II (General Subject Knowledge), STATISTICS group, BCSE 2020 - real paper. PDF sent by the founder.
Follows the latest (BCSE 2025) layout: Part I 70 MCQ x 1; Part II short answers at 5 marks each (mocks draw 6 x 5 = 30).
The 2020 Part II had 10 short answers x 3 marks on one CEO salary data set; each is set to 5 marks with key points scaled
(same treatment as ICT 2019-2020).
Charts and the t-test output cropped from the paper (public/papers/me/tech2-stat-2020-*.png).
Repeat (recorded as an appearance of the BCSE 2021 question, not loaded again): MCQ 37 (95% CI, x-bar 122, sigma 20, n 25).
Left out (more than one defensible answer or no correct option): MCQ 12 (all four statements are true), 25 (SD vs CV),
29 (a is also true), 40 (1%, 5% and 10% are all used), 46 (failing to reject a true H0 is a correct decision),
47 (all four are categorical), 62 (sample and population SD both offered), 67 (b and c are not always true).
Nine new MCQs keep Part I at 70.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Statistics): BCSE 2020, batch 1"
GROUP_TAG = "stat2020"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "statistics"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2020 Main Examination, Technical Paper II, Statistics", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 6, "marks_each": 5, "answer_any": None},
]
TOPIC = "Statistics: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following is NOT true about statistics?",
"opts": [
"Statistics is a study of human disease, agriculture, evolution, ecology and biodiversity.",
"Statistics is the art of learning from data.",
"Statistics is a science of information.",
"Statistics is a collection of facts."
]
},
{
"n": 2,
"stem": "The population consists of the set of all measurements in which investigator is interested. The population is also called",
"opts": [
"A sample",
"The universe",
"The class",
"The group"
]
},
{
"n": 3,
"stem": "Which of the following is a set of measurements obtained on some variable?",
"opts": [
"Quantitative data",
"A data set",
"Qualitative data",
"Information"
]
},
{
"n": 4,
"stem": "A conclusion drawn about a population based on the information in a sample from the population is",
"opts": [
"Mean",
"Median",
"A statistical inference",
"A descriptive statistic"
]
},
{
"n": 5,
"stem": "Which of the following divides the data into two equal halves? The same is also called the 50 th percentile.",
"opts": [
"Mean",
"Median",
"Mode",
"Standard Deviation"
]
},
{
"n": 6,
"stem": "The 75th percentile of the dataset is also called",
"opts": [
"First quartile",
"Second quartile",
"Third quartile",
"Fourth quartile"
]
},
{
"n": 7,
"stem": "The mean, median and mode of the following set of observations (4, 4, 5, 7, 10) are",
"opts": [
"mean=5, median=6 and mode=4",
"mean=6, median=5 and mode=4",
"mean=6, median=5 and mode=5",
"mean=6, median=4 and mode=4"
]
},
{
"n": 8,
"stem": "The mean, median and mode are the measures of",
"opts": [
"Central tendency",
"Dispersion",
"Logarithms",
"Proportions"
]
},
{
"n": 9,
"stem": "Which of the following is resistant to extreme observations?",
"opts": [
"Mean",
"Median",
"Mode",
"Standard Deviation"
]
},
{
"n": 10,
"stem": "The average squared deviation of the data points from their mean is",
"opts": [
"Range",
"Variance",
"Standard Deviation",
"Inter-quartile Range"
]
},
{
"n": 11,
"stem": "A chart made of bars of different height and the height of each bar represents the frequency of values in the class. Which of the following fits the above description?",
"opts": [
"Histogram",
"Pie charts",
"Line charts",
"There is not enough information to answer the question"
]
},
{
"n": 12,
"stem": "Which of the following is NOT true about mandarin production in Bhutan?",
"opts": [
"About 20% of total mandarin production came from Samdrup Jongkhar dzongkhag in 2019.",
"About 13 dzongkhags contributed less than 10% of total mandarin production in 2019.",
"About 51% of total mandarin production came from the top three dzongkhags in 2019.",
"One of the southern dzongkhags was the highest mandarin producer in 2019."
]
},
{
"n": 13,
"stem": "The horizontal bar graph shows the production of mandarin (MT) in Bhutan by 17 dzongkhags as per the 2019 annual agriculture survey. What was the median mandarin production in 2019?",
"opts": [
"Approximately 750 MT",
"Approximately 780 MT",
"Approximately 797 MT",
"Approximately 1619MT"
],
"image": "/papers/me/tech2-stat-2020-mandarin.png"
},
{
"n": 14,
"stem": "The horizontal bar graph shows the production of mandarin (MT) in Bhutan by 17 dzongkhags as per the 2019 annual agriculture survey. Which of the following is NOT true about mandarin production in Bhutan?",
"opts": [
"Punakha dzongkhag was in the 25th percentile",
"Chhukha dzongkhag was in the 50th percentile",
"Samdrup Jongkhar dzongkhag was in the 55th percentile",
"Zhemgang dzongkhag was in the 75th percentile"
],
"image": "/papers/me/tech2-stat-2020-mandarin.png"
},
{
"n": 15,
"stem": "Which of the following is a measure of the degree of asymmetry of a distribution?",
"opts": [
"Standard deviation",
"Variance",
"Skewness",
"None of the above"
]
},
{
"n": 16,
"stem": "Which of the following statement is TRUE about a symmetric distribution?",
"opts": [
"The mean is to the right of the median and mode",
"The mean is to the left of the median and mode",
"Symmetric distribution with a single mode has mode=mean=median",
"None of the above"
]
},
{
"n": 17,
"stem": "Assume that in a study we found that the mean is 15.85 and the standard deviation is 4.46. According to Chebyshev’s theorem, at least three-quarters of the observations will lie within 2 standard deviations of the mean. Which of the following pair of points is TRUE?",
"opts": [
"(4.46, 15.85)",
"(4.46, 24.77)",
"(6.93, 24.77)",
"(15.85,24.77)"
]
},
{
"n": 18,
"stem": "A box-and-whisker plot is another way of looking at a data set. Which of the following is NOT true about a box-and-whisker plot?",
"opts": [
"We can determine the spread of the data set.",
"We can determine the skewness of the data set.",
"We can determine the central tendency of the data set.",
"We can’t determine the existence of the outliers of the data set."
]
},
{
"n": 19,
"stem": "Which of the following would indicate that a dataset is NOT bell-shaped?",
"opts": [
"The range is equal to 5 standard deviation.",
"The range is larger than the interquartile range.",
"The mean is much smaller than the median.",
"There are no outliers."
]
},
{
"n": 20,
"stem": "The geometric mean of 3, 6, x is 6. What is the value of x?",
"opts": [
"8",
"10",
"12",
"16"
]
},
{
"n": 21,
"stem": "A total of 25 students appeared for statistics exam and the average marks obtained was 75%. A total of 15 female students in the class obtained an average mark of 70%. What is the average mark of male students in the class?",
"opts": [
"63.0%",
"79.5%",
"79.6%",
"82.5%"
]
},
{
"n": 22,
"stem": "The box-and-whisker plot shows the distribution of marks (in percent) obtained by 10 students in a class. What is the range of marks obtained by students in the class?",
"opts": [
"45",
"50",
"74",
"95"
],
"image": "/papers/me/tech2-stat-2020-boxplot.png"
},
{
"n": 23,
"stem": "The box-and-whisker plot shows the distribution of marks (in percent) obtained by 10 students in a class. What is the approximate median mark obtained by students?",
"opts": [
"70",
"74",
"75",
"95"
],
"image": "/papers/me/tech2-stat-2020-boxplot.png"
},
{
"n": 24,
"stem": "The box-and-whisker plot shows the distribution of marks (in percent) obtained by 10 students in a class. The interquartile range (IQR) is the difference between the third (Q3) and first (Q1) quartiles. What is the IQR of the marks?",
"opts": [
"31",
"50",
"74",
"75"
],
"image": "/papers/me/tech2-stat-2020-boxplot.png"
},
{
"n": 25,
"stem": "Which of the following is TRUE about the mean monthly household food consumption expenditure in Bhutan?",
"opts": [
"The monthly food consumption expenditure for urban households is more variable.",
"The monthly food consumption expenditure for rural households is more variable.",
"The monthly food consumption expenditure for urban and rural households has approximately equal variability.",
"None of the above."
]
},
{
"n": 26,
"stem": "According to the 2012 Bhutan Living Standard Survey (BLSS), the mean monthly household food consumption expenditure was Nu 8,141 (SD 2,600) for urban and Nu 6,644 (SD 2,100) for rural households. The coefficient of variation (CV) is a relative measure of variability. Accounting for the difference in means, the variability in monthly food consumption expenditure in each area is approximately",
"opts": [
"30%",
"31%",
"32%",
"33%"
]
},
{
"n": 27,
"stem": "Which of the following is TRUE about the histogram shown?",
"opts": [
"The above histogram is unimodal.",
"The above histogram is bimodal.",
"The above is not a histogram.",
"None of the above."
],
"image": "/papers/me/tech2-stat-2020-histogram.png"
},
{
"n": 28,
"stem": "Which of the following is NOT true about the standard normal distribution?",
"opts": [
"The shape of the standard normal distribution has a smooth and bell-shaped curve.",
"The standard normal distribution was originally called the law of errors.",
"The standard normal distribution has mean=0 and standard deviation=1",
"The standard normal distribution has mean=1 and standard deviation=1"
]
},
{
"n": 29,
"stem": "Which of the following is NOT true about a random normal variable?",
"opts": [
"The probability that a normal random variable will be within 1 standard deviation from its median is approximately 68%.",
"The probability that a normal random variable will be within 1 standard deviation from its mean is approximately 68%.",
"The probability that a normal random variable will be within 2 standard deviation from its mean is approximately 95%.",
"The probability that a normal random variable will be within 3 standard deviation from its mean is approximately 99%."
]
},
{
"n": 30,
"stem": "A numerical measurement of the sample is called",
"opts": [
"Quantitative data.",
"Time series data.",
"Statistics.",
"Population."
]
},
{
"n": 31,
"stem": "The probability distribution of all possible values that statistics may take when computed from random sample of the same size, drawn from a specified population is",
"opts": [
"census of a population.",
"survey of a population.",
"sampling distribution of a population.",
"sampling distribution of a statistics."
]
},
{
"n": 32,
"stem": "Which of the following is NOT true about the Central Limit Theorem (CLT)?",
"opts": [
"The distribution of the sample mean tends to a normal distribution regardless of the distribution of the population from which the random sample is drawn.",
"The theorem allows us to make probability statements about the possible range of values that same mean can take.",
"It also allows us to compute probabilities of how far away the sample mean may be from the population mean it estimates.",
"The theorem also provides that the rate at which the distribution approaches a normal distribution does not depend on the shape of the distribution of the parent population."
]
},
{
"n": 33,
"stem": "If an estimator is said to be unbiased, which of the following is TRUE?",
"opts": [
"The expected value is equal to the population parameter.",
"There will be systematic deviation of the estimator from the parameter.",
"The distance between the expected value and the population parameter is large.",
"There is relatively large variance between the expected value and the population parameter."
]
},
{
"n": 34,
"stem": "The first quartile is called",
"opts": [
"Lower quartile",
"Median",
"Upper quartile",
"Geometric mean"
]
},
{
"n": 35,
"stem": "The second quartile is also known as",
"opts": [
"Mean",
"Median",
"Mode",
"Standard Deviation (SD)"
]
},
{
"n": 36,
"stem": "The concept of degrees of freedom (df) is important for understanding many statistical distributions. Which of the following is TRUE about the degrees of freedom?",
"opts": [
"It is the total measurements divided by the total number of restrictions on the measurements.",
"It is the total number of measurements less the total number of restrictions on the measurements.",
"It is the total measurements divided by the total number of measurements itself.",
"None of the above."
]
},
{
"n": 37,
"stem": "A 95% confidence interval for the unknown population mean ( ) with known sample mean ( ) of 122 and the population standard deviation ( ) of 20 for a sample size ( ) of 25 is",
"opts": [
"(114.16,122.00)",
"(114.16,120.89)",
"(114.16,129.89)",
"(122.00,129.89)"
]
},
{
"n": 38,
"stem": "Which one of these statistics is unaffected by outliers?",
"opts": [
"Mean",
"Range",
"Standard deviation",
"Interquartile range"
]
},
{
"n": 39,
"stem": "The level of significance of a statistical hypothesis test is denoted by",
"opts": [
"α",
"β",
"1 − α",
"1 − β"
]
},
{
"n": 40,
"stem": "In statistical hypothesis testing, the level of significance to reject or fail to reject the null hypothesis is set at",
"opts": [
"1%",
"5%",
"10%",
"15%"
]
},
{
"n": 41,
"stem": "Which of the following is NOT true about p-value in hypothesis testing?",
"opts": [
"The p-value is the level of significance that goes without value of the test statistics.",
"The p-value is the smallest level of significance at which a null hypothesis may be rejected using the obtained level of the test statistics.",
"The p-value is the probability of obtaining a value of the test statistics as extreme as, or more extreme than the actual value obtained when the null hypothesis is true.",
"The p-value is the probability of obtaining a value of the test statistics as extreme as, or more extreme than the actual value obtained when the alternative hypothesis is true."
]
},
{
"n": 42,
"stem": "The mean of a set of 35 numbers is 55. What is the sum of the 35 numbers?",
"opts": [
"35",
"1225",
"1925",
"3025"
]
},
{
"n": 43,
"stem": "Which of the following steps is NOT true while calculating standard deviation?",
"opts": [
"Subtract the mean from each term in the distribution to obtain a set of differences and square each sum difference and add the squares.",
"Divide the sum of the squared differences by the number of terms in the distribution.",
"Find the square root of the quotient just obtained; the positive square root is the standard deviation.",
"Find the square root of the quotient just obtained; the negative square root is the standard deviation."
]
},
{
"n": 44,
"stem": "The standard deviation of the sample mean is also called",
"opts": [
"Standard deviation.",
"Squared standard deviation.",
"Standard error.",
"Standard deviation of the population mean."
]
},
{
"n": 45,
"stem": "Which of the following is TRUE about the distribution affects of standard deviation and the variance?",
"opts": [
"If a constant is multiplied to each data point, it does not affect the variance or the standard deviation of the distribution.",
"If each data point is divided by a constant, it does not affect the variance or the standard deviation of the distribution.",
"If a constant is added or subtracted to each data point, it does not affect the variance or the standard deviation of the distribution.",
"If each data point is squared by itself, it does not affect the variance or the standard deviation of the distribution."
]
},
{
"n": 46,
"stem": "Failing to reject the null hypothesis when it is true is",
"opts": [
"Alpha",
"Beta",
"Type I error",
"Type II error"
]
},
{
"n": 47,
"stem": "All of the following are categorial variable EXCEPT",
"opts": [
"Study major (Statistics, Mathematics, Physics, Engineering).",
"Color (White, Black, Gray, Red).",
"Performance rating (Poor, Good, Very good, Outstanding).",
"Gender (Male, Female)."
]
},
{
"n": 48,
"stem": "Correlation provides association between two variables and it measures both the strength and direction of the linear relationship. If there is a positive relationship between two variables, what type of slope is expected in a scatterplot?",
"opts": [
"Fairly a straight line",
"An upward slope",
"A downward slope",
"None of the above"
]
},
{
"n": 49,
"stem": "Assume that Druk Pizza in Thimphu has a mean delivery time of 30 minutes and a standard deviation of 5 minutes. Using the standard normal distribution rule, what can you say about the delivery time of Druk Pizza in Thimphu?",
"opts": [
"95% are between 20-40 minutes",
"95% are between 22-35 minutes",
"95% are between 15-45 minutes",
"None of the above"
]
},
{
"n": 50,
"stem": "If two variables share linear relationship, the graph will be a",
"opts": [
"Curved",
"Hyperbola",
"Straight line",
"None of the above"
]
},
{
"n": 51,
"stem": "The values of correlation between two variables will be",
"opts": [
"More than 0",
"More than -1",
"Less than -1",
"Between -1 and +1"
]
},
{
"n": 52,
"stem": "If there is a strong linear relationship between two variables, which of the following is a reasonable conclusion?",
"opts": [
"The value of the correlation coefficient will be close to 0",
"The value of the correlation coefficient will be close to 1",
"The value of the correlation coefficient will be greater than 1",
"It is impossible to quantify their relationship"
]
},
{
"n": 53,
"stem": "Suppose there is a correlation of r=0.9 between the number of hours per day a student study and GPA score. Which of the following is a reasonable conclusion?",
"opts": [
"90% of students who study receive high grades.",
"90 of students who receive high grades study a lot.",
"90% of the variation in GPA scores can be explained by variation in number of study hours.",
"81% of the variation in GPA scores can be explained by variation in number of study hours per day."
]
},
{
"n": 54,
"stem": "Increasing the sample size in the survey can",
"opts": [
"reduce the residual error.",
"reduce the inferential error.",
"reduce the sampling error.",
"None of the above."
]
},
{
"n": 55,
"stem": "Data collected through survey, census and experiment approach is called",
"opts": [
"Administrative data.",
"Primary data.",
"Secondary data.",
"None of the above."
]
},
{
"n": 56,
"stem": "Which of the following is TRUE about the bar chart?",
"opts": [
"It is a simple tool to visualize the relative or absolute frequencies of observed data.",
"It is a simple tool to visualize the average value of groups of data.",
"It is a simple tool to visualize the relationship of average value of one variable plotted against a second variable.",
"None of the above."
]
},
{
"n": 57,
"stem": "The weighted average of 63, 47 and 98 with respective weights of 0.144, 0.305 and 0.551 is",
"opts": [
"208.00",
"77.41",
"69.33",
"25.80"
]
},
{
"n": 58,
"stem": "Any well-defined procedure that produces an observable outcome that could not be perfectly predicted in advance is called",
"opts": [
"A survey",
"A census",
"A random experiment",
"Administrative data source"
]
},
{
"n": 59,
"stem": "Suppose you interviewed 600 students who appeared for 2020 PE exam of the Royal Civil Service Commission. It was observed that 38 students found the exam was easy. What is the binomial proportion (binomial fraction)?",
"opts": [
"0.05%",
"0.06%",
"6.30%",
"6.50%"
]
},
{
"n": 60,
"stem": "If a relationship between height and weight of a student is found to be statistically significant, it means",
"opts": [
"variables are related in the sample due to chance alone.",
"variables are not-related in the population represented by the sample.",
"variables are related in the population represented by the sample.",
"variables are very important."
]
},
{
"n": 61,
"stem": "Simpson’s Paradox occurs when",
"opts": [
"no baseline risk is given, so it is not known whether or not a high relative risk has practical importance.",
"a confounding variable rather than the explanatory variable is responsible for a change in the response variable.",
"the direction of the relationship between two variables changes when the categories of a confounding variable are considered.",
"the results of a test are statistically significant but are really due to chance."
]
},
{
"n": 62,
"stem": "What is the standard deviation (SD) of the observations 75, 79, 82, 84?",
"opts": [
"3.39",
"3.92",
"11.5",
"15.33"
]
},
{
"n": 63,
"stem": "Which of the following is TRUE about Poisson distribution?",
"opts": [
"Distribution has greater mean than variance.",
"Distribution has equal mean and variance.",
"Distribution has unequal mean and variance.",
"None of the above."
]
},
{
"n": 64,
"stem": "The heights of students were recorded and found to be normally distributed with mean ( ) 175cm and standard deviation ( ) 10cm.How much a student with 190 cm tall is away from the mean in terms of standard deviation?",
"opts": [
"1.0 SD",
"1.5 SD",
"2.0 SD",
"2.5 SD"
]
},
{
"n": 65,
"stem": "Sampling frame is important for conducting any survey. Which of the following is TRUE about sampling frame?",
"opts": [
"The sampling frame is a smaller collection of units selected from the population.",
"The sampling frame is used to study about a system that is too large and costly to study in its entirety.",
"The sampling frame tells you how to gain access to the population units.",
"The sampling frame is defined as any number computed from your sample data."
]
},
{
"n": 66,
"stem": "In a survey, a pilot study is conducted before the real survey is run. Why is a pilot study important?",
"opts": [
"A pilot study is important to help you identify respondents before the real survey is run.",
"A pilot study is important to help you identify problems and fix them before the real survey is run.",
"A pilot study is important to help you build good relationship between enumerators and respondents before the real survey is run.",
"A pilot study is important to help respondents and enumerators know what kind of questions are in the survey before the real survey is run."
]
},
{
"n": 67,
"stem": "The basis for any sampling method is the random sampling or simple random sampling. Which of the following is TRUE about the simple random sampling?",
"opts": [
"In simple random sampling, each population unit has an equal probability of being chosen.",
"In simple random sampling, each population unit is chosen independently.",
"In simple random sampling, each population unit is chosen with/without replacement approach based on the objective of the survey.",
"All of the above."
]
},
{
"n": 68,
"stem": "A random sampling obtained by choosing a sample separately from each of the segments or groups of the population is called a",
"opts": [
"Stratified random sampling.",
"Systematic random sampling.",
"Circular random sampling.",
"Convenience random sampling."
]
},
{
"n": 69,
"stem": "National Statistics Bureau has randomly chosen a sample of 500 respondents in a survey. About 300 people chose to respond and 200 did not respond to that survey. Which of the following is NOT true about the 200 people who did not respond to the survey?",
"opts": [
"The 200 people who did not respond to the survey is called non-respondent.",
"The 200 people who did not respond to the survey are hard-core refusers and they should be penalized.",
"The 200 people who did not respond to the survey could be call-back and gather information.",
"The 200 people who did not respond to the survey will cause significant bias in the results of the survey."
]
},
{
"n": 70,
"stem": "Which of the following is NOT true about non-parametric tests?",
"opts": [
"Non-parametric tests do not require assumptions about the distributions of the populations of interest.",
"Non-parametric tests require assumptions about the distribution of the populations of interest.",
"Non-parametric tests do not deal with particular parameters of the population.",
"Non-parametric tests are often called distribution-free methods."
]
}
]"""

KEY = {
 1: ("a", "Statistics is the science of learning from data (collecting, analysing and interpreting information). It is not itself the study of disease, agriculture or ecology - those are fields where it is applied."),
 2: ("b", "The population (all measurements of interest) is also called the universe."),
 3: ("b", "A set of measurements obtained on some variable is a data set."),
 4: ("c", "A conclusion about a population drawn from a sample is a statistical inference."),
 5: ("b", "The median divides ordered data into two equal halves; it is the 50th percentile."),
 6: ("c", "The 75th percentile is the third quartile (Q3)."),
 7: ("b", "Mean = 30/5 = 6; the middle value of 4, 4, 5, 7, 10 is 5; 4 occurs twice, so the mode is 4."),
 8: ("a", "Mean, median and mode are measures of central tendency."),
 9: ("b", "The median depends only on the middle position, so extreme values do not affect it; the mean and SD are pulled by extremes."),
 10: ("b", "The average squared deviation from the mean is the variance."),
 11: ("a", "Adjacent bars whose heights show class frequencies form a histogram."),
 13: ("c", "With 17 dzongkhags the median is the 9th value in order: Chhukha, 797 MT."),
 14: ("c", "Samdrup Jongkhar is the largest producer, at the top (100th percentile) of the 17 values, not the 55th percentile. Chhukha (9th of 17) is the median."),
 15: ("c", "Skewness measures the degree of asymmetry of a distribution."),
 16: ("c", "In a symmetric, unimodal distribution mean = median = mode."),
 17: ("c", "Within 2 SD: 15.85 ± 2 × 4.46 = 15.85 ± 8.92 = (6.93, 24.77)."),
 18: ("d", "A box plot can show outliers (points beyond the whiskers), so 'we can't determine outliers' is not true."),
 19: ("c", "A bell-shaped (symmetric) distribution has mean ≈ median; a mean much smaller than the median shows left skew."),
 20: ("c", "GM = ∛(3 × 6 × x) = 6, so 18x = 216 and x = 12."),
 21: ("d", "Total = 25 × 75 = 1,875; females 15 × 70 = 1,050; males 825/10 = 82.5%."),
 22: ("a", "Range = 95 − 50 = 45."),
 23: ("c", "The median is the line inside the box, at 75 (the × at 74 marks the mean)."),
 24: ("a", "IQR = Q3 − Q1 = 90 − 59 = 31."),
 26: ("c", "CV(urban) = 2,600/8,141 × 100 ≈ 31.9%; CV(rural) = 2,100/6,644 × 100 ≈ 31.6% - about 32% in both areas."),
 27: ("b", "The histogram has two distinct peaks, so it is bimodal."),
 28: ("d", "The standard normal distribution has mean 0 and SD 1, not mean 1."),
 30: ("c", "A numerical measure computed from a sample is a statistic."),
 31: ("d", "The distribution of a statistic over all possible random samples of the same size is the sampling distribution of that statistic."),
 32: ("d", "How fast the sampling distribution approaches normal DOES depend on the shape of the parent population (skewed populations need larger n)."),
 33: ("a", "An unbiased estimator has expected value equal to the population parameter."),
 34: ("a", "The first quartile (Q1) is the lower quartile."),
 35: ("b", "The second quartile (Q2) is the median."),
 36: ("b", "Degrees of freedom = number of measurements minus the number of restrictions (parameters estimated) on them."),
 38: ("d", "The IQR uses only the middle 50% of the data, so outliers do not affect it; mean, range and SD all change."),
 39: ("a", "The level of significance is α (the probability of a Type I error); β is the Type II error probability and 1 − β is the power."),
 41: ("d", "The p-value is calculated assuming the NULL hypothesis is true, not the alternative."),
 42: ("c", "Sum = mean × n = 55 × 35 = 1,925."),
 43: ("d", "The standard deviation is the positive square root of the variance, never the negative root."),
 44: ("c", "The standard deviation of the sample mean is called the standard error."),
 45: ("c", "Adding or subtracting a constant shifts all values but not their spread, so variance and SD are unchanged; multiplying or dividing changes them."),
 48: ("b", "A positive relationship gives points rising from left to right - an upward slope."),
 49: ("a", "About 95% lie within 2 SD: 30 ± 2 × 5 = 20 to 40 minutes."),
 50: ("c", "A linear relationship plots as (approximately) a straight line."),
 51: ("d", "The correlation coefficient always lies between −1 and +1."),
 52: ("b", "A strong linear relationship gives |r| close to 1."),
 53: ("d", "The coefficient of determination is r² = 0.9² = 0.81, so 81% of the variation in GPA is explained by study hours."),
 54: ("c", "A larger sample reduces sampling error (the standard error falls as √n grows)."),
 55: ("b", "Data collected first-hand by survey, census or experiment are primary data."),
 56: ("a", "A bar chart shows the relative or absolute frequencies of categories."),
 57: ("b", "Weighted mean = 0.144 × 63 + 0.305 × 47 + 0.551 × 98 = 9.07 + 14.34 + 54.00 = 77.41 (the weights sum to 1)."),
 58: ("c", "A procedure with an observable outcome that cannot be predicted with certainty is a random experiment."),
 59: ("c", "p̂ = 38/600 = 0.0633, i.e. about 6.3%."),
 60: ("c", "Statistical significance means the relationship seen in the sample is unlikely to be due to chance, so the variables are related in the population sampled."),
 61: ("c", "Simpson's paradox: a relationship reverses direction when data are split by (or combined over) a confounding variable."),
 63: ("b", "A Poisson distribution has mean = variance = λ."),
 64: ("b", "z = (190 − 175)/10 = 1.5, i.e. 1.5 SD above the mean."),
 65: ("c", "The sampling frame (a list or map of population units) tells you how to reach the units from which the sample is drawn."),
 66: ("b", "A pilot study tests the questionnaire and procedures so problems can be fixed before the main survey."),
 68: ("a", "Sampling separately from each segment (stratum) of the population is stratified random sampling."),
 69: ("b", "Non-respondents should be followed up (call-backs) and non-response can cause bias, but they are not to be penalised."),
 70: ("b", "Non-parametric tests do NOT require assumptions about the population distribution - that is why they are called distribution-free."),
}

NEW_MCQ = [
    ("The mode of the data 3, 7, 7, 2, 9, 7, 3, 2, 3, 7 is", ["3", "7", "2", "9"], "b", "7 occurs four times, more often than any other value (3 occurs three times)."),
    ("If the regression line of y on x is y = 4 + 2.5x, the predicted value of y when x = 6 is", ["15", "19", "24", "25"], "b", "y = 4 + 2.5 × 6 = 4 + 15 = 19."),
    ("The correlation coefficient between weight X and weight Y (both in kg) is 0.6. If both are converted to grams, the correlation coefficient becomes", ["0.6", "600", "0.0006", "360"], "a",
     "Correlation has no units and does not change when variables are multiplied by positive constants, so r stays 0.6."),
    ("A fair coin is tossed 3 times. The probability of getting exactly 2 heads is", ["1/8", "3/8", "1/2", "2/3"], "b",
     "There are 8 equally likely outcomes; HHT, HTH and THH give exactly 2 heads: 3/8."),
    ("In a normal distribution, approximately what percentage of values lie more than 2 standard deviations above the mean?", ["16%", "5%", "0.15%", "2.5%"], "d",
     "About 95% lie within ±2 SD, leaving 5% in the two tails - about 2.5% in each tail."),
    ("The sum of the squared deviations of a set of values is smallest when the deviations are taken from the", ["Median", "Mode", "Mean", "Geometric mean"], "c",
     "Σ(x − a)² is minimised when a is the arithmetic mean (the sum of absolute deviations is minimised at the median)."),
    ("Laspeyres' price index uses as weights the quantities of the", ["Current year", "Base year", "Average of base and current years", "Any chosen year"], "b",
     "Laspeyres' index weights prices by base-year quantities: Σp₁q₀/Σp₀q₀ × 100 (Paasche's index uses current-year quantities)."),
    ("Two fair dice are rolled. The probability that the sum is 7 is", ["7/36", "5/36", "1/6", "1/12"], "c",
     "Six of the 36 outcomes sum to 7 - (1,6), (2,5), (3,4), (4,3), (5,2), (6,1) - so 6/36 = 1/6."),
    ("For a sample of n = 10 with Σx = 50 and Σx² = 290, the sample variance is", ["2.11", "4.00", "29", "4.44"], "d",
     "s² = [Σx² − (Σx)²/n]/(n − 1) = (290 − 2,500/10)/9 = 40/9 = 4.44."),
]

CEO = ("The National Statistics Bureau surveyed the monthly salary and bonus (Nu) paid to the Chief Executive Officers (CEOs) of 21 private firms in 2020 (table shown). Sorted, the values run from Nu 40,000 to Nu 140,000 in steps of Nu 5,000.\n"
       "Female CEOs (11): 40,000; 45,000; 50,000; 65,000; 70,000; 75,000; 85,000; 90,000; 110,000; 125,000; 130,000.\n"
       "Male CEOs (10): 55,000; 60,000; 80,000; 95,000; 100,000; 105,000; 115,000; 120,000; 135,000; 140,000.\n\n")
IMG = "/papers/me/tech2-stat-2020-ceo.png"
SAQ = [
 dict(marks=5, image=IMG, stem=CEO + "What is the median salary paid to CEOs? (5 marks)",
      kp=[("Data arranged in order; n = 21 (odd)", 1.5), ("Median position = (n + 1)/2 = 11th value", 1.5), ("Median = Nu 90,000", 2)],
      model="The 21 values are already in order (40,000 to 140,000). With n = 21 (odd), the median is the (21 + 1)/2 = 11th value, which is Nu 90,000. Half the CEOs earn Nu 90,000 or less a month and half earn more."),
 dict(marks=5, image=IMG, stem=CEO + "What is the salary and bonus difference between the CEO at the 75th percentile and the CEO at the 25th percentile? (5 marks)",
      kp=[("25th percentile position = (n + 1)/4 = 5.5 → Q1 = (60,000 + 65,000)/2 = Nu 62,500", 2), ("75th percentile position = 3(n + 1)/4 = 16.5 → Q3 = (115,000 + 120,000)/2 = Nu 117,500", 2),
          ("Difference (IQR) = 117,500 − 62,500 = Nu 55,000 (Nu 50,000 accepted using Q1 = 65,000, Q3 = 115,000 by another method)", 1)],
      model="Using position = p(n + 1):\nQ1 (25th percentile): 0.25 × 22 = 5.5th value = (60,000 + 65,000)/2 = Nu 62,500.\nQ3 (75th percentile): 0.75 × 22 = 16.5th value = (115,000 + 120,000)/2 = Nu 117,500.\nDifference = Q3 − Q1 = 117,500 − 62,500 = Nu 55,000 (the interquartile range).\n(Other percentile conventions give Q1 = 65,000 and Q3 = 115,000, a difference of Nu 50,000; either is accepted when the method is shown.)"),
 dict(marks=5, image=IMG, stem=CEO + "What is the standard deviation of the salary and bonus of CEOs? (5 marks)",
      kp=[("Mean = 1,890,000/21 = Nu 90,000", 1), ("Σ(x − x̄)² = 5,000² × (1² + 2² + … + 10²) × 2 = 19,250,000,000", 2),
          ("s² = 19,250,000,000/20 = 962,500,000", 1), ("s = √962,500,000 ≈ Nu 31,024 (population SD 30,277 accepted if stated)", 1)],
      model="Mean x̄ = Σx/n = 1,890,000/21 = Nu 90,000.\nThe values are 90,000 ± 5,000k for k = 1 to 10 (plus 90,000 itself), so Σ(x − x̄)² = 2 × 5,000² × (1² + 2² + … + 10²) = 2 × 25,000,000 × 385 = 19,250,000,000.\nSample variance s² = 19,250,000,000/(21 − 1) = 962,500,000.\ns = √962,500,000 ≈ Nu 31,024 (this matches the 'combined' Std. Dev. 31,024.18 in the t-test output). Treated as a population, σ = √(19,250,000,000/21) ≈ Nu 30,277."),
 dict(marks=5, image=IMG, stem=CEO + "What is the range of salary and bonus for CEOs? (5 marks)",
      kp=[("Highest = Nu 140,000; lowest = Nu 40,000", 2), ("Range = 140,000 − 40,000", 1.5), ("= Nu 100,000", 1.5)],
      model="Range = highest value − lowest value = 140,000 − 40,000 = Nu 100,000."),
 dict(marks=5, image=IMG, stem=CEO + "Is there any outlier in the data distribution? Suggest a way to detect outliers in the data distribution. (5 marks)",
      kp=[("No outlier: values are evenly spaced (every Nu 5,000) from 40,000 to 140,000", 1.5),
          ("Method: IQR rule - fences Q1 − 1.5 × IQR and Q3 + 1.5 × IQR, e.g. 62,500 − 82,500 = −20,000 and 117,500 + 82,500 = 200,000", 2),
          ("All values lie inside the fences (or all |z| < 2-3: largest z = 50,000/31,024 ≈ 1.6), so there are no outliers; a box plot shows the same", 1.5)],
      model="There is no outlier. The salaries are evenly spread in steps of Nu 5,000 from 40,000 to 140,000, with no value far from the rest.\nOne way to detect outliers is the IQR (box-plot) rule: Q1 = 62,500, Q3 = 117,500, IQR = 55,000. Lower fence = Q1 − 1.5 × IQR = 62,500 − 82,500 = −20,000; upper fence = Q3 + 1.5 × IQR = 117,500 + 82,500 = 200,000. Any value outside the fences is an outlier; all 21 values lie inside.\nAnother way is z-scores: z = (x − x̄)/s; values with |z| > 3 (or > 2 for small data sets) are suspect. Here the largest |z| = 50,000/31,024 ≈ 1.6, so none qualifies."),
 dict(marks=5, image=IMG, stem=CEO + "What is the mean salary and bonus for male and female CEOs respectively? (5 marks)",
      kp=[("Male: Σ = 1,005,000, n = 10", 1), ("Male mean = Nu 100,500", 1.5), ("Female: Σ = 885,000, n = 11", 1), ("Female mean = Nu 80,454.55", 1.5)],
      model="Male: Σx = 55,000 + 60,000 + 80,000 + 95,000 + 100,000 + 105,000 + 115,000 + 120,000 + 135,000 + 140,000 = 1,005,000; mean = 1,005,000/10 = Nu 100,500.\nFemale: Σx = 40,000 + 45,000 + 50,000 + 65,000 + 70,000 + 75,000 + 85,000 + 90,000 + 110,000 + 125,000 + 130,000 = 885,000; mean = 885,000/11 = Nu 80,454.55.\nOn average, male CEOs received about Nu 20,045 more per month."),
 dict(marks=5, image=IMG, stem=CEO + "Whose salary and bonus are more variable and why? (5 marks)",
      kp=[("Female SD ≈ Nu 31,021; male SD ≈ Nu 28,911", 1.5), ("Because the means differ, compare CV = SD/mean × 100", 1),
          ("CV female ≈ 38.6%; CV male ≈ 28.8%", 1.5), ("Female CEOs' salaries are more variable (higher SD and higher CV)", 1)],
      model="Standard deviations (from the data or the t-test output): female ≈ Nu 31,021, male ≈ Nu 28,911.\nBecause the two groups have different means, relative variability is compared with the coefficient of variation:\nCV(female) = 31,021/80,455 × 100 ≈ 38.6%; CV(male) = 28,911/100,500 × 100 ≈ 28.8%.\nFemale CEOs' salary and bonus are more variable - both the absolute spread (SD) and the relative spread (CV) are larger."),
 dict(marks=5, image=IMG, stem=CEO + "When conducting a hypothesis test, we begin by specifying the null and alternative hypotheses. State the null and alternative hypotheses to test the difference in salary and bonus between male and female CEOs. (5 marks)",
      kp=[("H₀: μ_F = μ_M (or μ_F − μ_M = 0) - no difference in mean salary and bonus", 2), ("H₁: μ_F ≠ μ_M (or μ_F − μ_M ≠ 0) - there is a difference (two-tailed)", 2),
          ("Hypotheses are about population means (μ), not sample means", 1)],
      model="Let μ_F and μ_M be the population mean monthly salary and bonus of female and male CEOs.\nNull hypothesis H₀: μ_F = μ_M (μ_F − μ_M = 0): there is no difference in mean salary and bonus between male and female CEOs.\nAlternative hypothesis H₁: μ_F ≠ μ_M (μ_F − μ_M ≠ 0): there is a difference (two-tailed test)."),
 dict(marks=5, image=IMG, stem=CEO + "What level of significance do we use to test the hypothesis, and how do you relate it to the p-value? (5 marks)",
      kp=[("Usually α = 0.05 (5%); 0.01 or 0.10 may be chosen - it is set before the test", 1.5), ("α is the probability of a Type I error (rejecting a true H₀) we are willing to accept", 1.5),
          ("Decision rule: reject H₀ if p-value ≤ α; do not reject if p-value > α", 2)],
      model="We normally use a 5% level of significance (α = 0.05); 1% or 10% may be used, but α must be fixed before looking at the results. α is the maximum probability of a Type I error (rejecting H₀ when it is true) that we accept.\nThe p-value is the probability, assuming H₀ is true, of getting a test statistic as extreme as the one observed. Decision rule: if p-value ≤ α, reject H₀ (the result is statistically significant); if p-value > α, do not reject H₀."),
 dict(marks=5, image="/papers/me/tech2-stat-2020-ttest.png", stem=CEO + "The results of the two-sample t-test of whether there is a significant difference in salary and bonus between male and female CEOs are shown. (Female mean 80,454.55, male mean 100,500; diff = mean(Female) − mean(Male) = −20,045.45, SE 13,125.27; t = −1.5272, df = 19; 95% CI of diff (−47,516.95, 7,426.04); Ha: diff ≠ 0, Pr(|T| > |t|) = 0.1432.) What can you say about the results? Justify your statements. (5 marks)",
      kp=[("Female mean is about Nu 20,045 lower than male mean (t = −1.53, df = 19)", 1), ("Two-tailed p-value = 0.1432 > 0.05", 1.5),
          ("Do not reject H₀: no statistically significant difference in mean salary and bonus at 5%", 1.5), ("Supported by the 95% CI of the difference (−47,517 to 7,426), which contains 0", 1)],
      model="The sample shows female CEOs earning on average Nu 20,045 less than male CEOs (80,455 vs 100,500). The t statistic is −1.53 with 19 degrees of freedom, and the two-tailed p-value (Ha: diff ≠ 0) is 0.1432.\nSince 0.1432 > 0.05, we do not reject H₀: at the 5% level there is no statistically significant difference between the mean salary and bonus of male and female CEOs. The 95% confidence interval for the difference, −47,517 to 7,426, contains 0, which confirms this. The observed gap may be due to sampling variation (the samples are small); even the one-sided test (p = 0.0716) is not significant at 5%."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
