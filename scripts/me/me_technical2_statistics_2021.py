"""ME Technical Paper II (General Subject Knowledge), STATISTICS group, BCSE 2021 - real paper. PDF sent by the founder.
Follows the latest (BCSE 2025) layout: Part I 70 MCQ x 1; Part II 6 short answers x 5 = 30.
The 2021 Part II (one t-test data set: Q1 3, Q2 2, Q3 10, Q4 10, Q5 5 marks) is kept as five questions set to 5 marks each,
with key points scaled; one new short answer on the same data (99% confidence interval) makes six.
Box plot, dot plot and scatter diagram cropped from the paper (public/papers/me/tech2-stat-2021-*.png); tables retyped.
Left out (more than one defensible answer, missing data or no correct option): MCQ 17 (n = 5 not an option), 19 (three of the
options are quartile-based measures), 24 (no data printed), 29 (Pearson -3..3 vs Bowley -1..1), 40 (0.20 not an option),
57 (no option matches the 95% interval), 62 (b and c both untrue). Seven new MCQs keep Part I at 70.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Statistics): BCSE 2021, batch 1"
GROUP_TAG = "stat2021"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "statistics"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2021 Main Examination, Technical Paper II, Statistics", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 6, "marks_each": 5, "answer_any": None},
]
TOPIC = "Statistics: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following is the science of collecting, organization, presenting, analysing, and interpreting data to assist in making more effective decisions?",
"opts": [
"Statistics",
"Population",
"Sample",
"Variable"
]
},
{
"n": 2,
"stem": "The method used to determine something about a population on the basis of a sample is called",
"opts": [
"Descriptive statistics",
"Inferential statistics",
"Population",
"Sample"
]
},
{
"n": 3,
"stem": "Which of the following is NOT TRUE about the quantitative variable?",
"opts": [
"Quantitative variable is numeric in nature.",
"Quantitative variable can either be discrete or continuous variable.",
"The information on marital status of an individual is a quantitative variable.",
"The amount of air pressure in a vehicle tire is a quantitative variable."
]
},
{
"n": 4,
"stem": "All of the following properties are about interval-level data, EXCEPT",
"opts": [
"Data classifications are mutually exclusive and exhaustive.",
"Data classifications are ordered according to the amount of characteristic they possess.",
"Data categories have no logical order.",
"Equal differences in the characteristic are represented by equal differences in the measurement"
]
},
{
"n": 5,
"stem": "One of the most common ways to portray a frequency distribution is",
"opts": [
"Column chart",
"Histogram",
"Pie chart",
"Line chart"
]
},
{
"n": 6,
"stem": "Any measurable characteristic of a population is called",
"opts": [
"Variable",
"Statistics",
"Parameter",
"None of the above"
]
},
{
"n": 7,
"stem": "For a set of raw data (ungrouped data), the ___________________ is the sum of all the sampled values divided by the total number of sampled observations.",
"opts": [
"sample mean",
"population mean",
"sample median",
"population median"
]
},
{
"n": 8,
"stem": "Which of the following is NOT TRUE about the characteristics of the arithmetic mean?",
"opts": [
"At least the interval scale of measurement is required.",
"The sum of deviations from the mean is not equal to 0.",
"All the data values are used in the calculation.",
"A set of data has only one mean."
]
},
{
"n": 9,
"stem": "The arithmetic mean of the squared deviations from the mean is called",
"opts": [
"Range",
"Variance",
"Standard Deviation",
"Inter-quartile Range"
]
},
{
"n": 10,
"stem": "For any set of observations (sample or population), the proportion of the values that lie within k standard deviations of the mean is at least:",
"opts": [
"1 + 1/k²",
"1 − 1/k²",
"1/k²",
"k²"
]
},
{
"n": 11,
"stem": "For a symmetrical, belled-shaped frequency distribution, approximately what percentage of the observations lie within plus and minus 1 standard deviation of the mean?",
"opts": [
"68% of the observations",
"95% of the observations",
"99% of the observations",
"99.7% of the observations"
]
},
{
"n": 12,
"stem": "The box-and-whisker plot shows the consumption of household electricity in 2020 by dzongkhags, based on Bhutan Power Corporation Ltd (BPCL) data, recorded in million Ngultrum. What was the range of household electricity consumption by dzongkhags?",
"opts": [
"About 38 Million Ngultrum",
"About 49 Million Ngultrum",
"About 80 Million Ngultrum",
"About 99 Million Ngultrum"
],
"image": "/papers/me/tech2-stat-2021-boxplot.png"
},
{
"n": 13,
"stem": "The box-and-whisker plot shows the consumption of household electricity in 2020 by dzongkhags, based on Bhutan Power Corporation Ltd (BPCL) data, recorded in million Ngultrum. What was the median household electricity consumption by dzongkhags?",
"opts": [
"Approximately 40 MT",
"Approximately 780 MT",
"Approximately 40 Million Ngultrum",
"Approximately 1619MT"
],
"image": "/papers/me/tech2-stat-2021-boxplot.png"
},
{
"n": 14,
"stem": "The box-and-whisker plot shows the consumption of household electricity in 2020 by dzongkhags, based on Bhutan Power Corporation Ltd (BPCL) data, recorded in million Ngultrum. What was the average (mean) household electricity consumption by dzongkhags?",
"opts": [
"About 12 Million Ngultrum",
"About 38 Million Ngultrum",
"About 49 Million Ngultrum",
"About 80 Million Ngultrum"
],
"image": "/papers/me/tech2-stat-2021-boxplot.png"
},
{
"n": 15,
"stem": "Which of the following is the formula for the calculation of geometric mean?",
"opts": [
"GM = Σx / n",
"GM = (w₁x₁ + w₂x₂ + … + wₙxₙ) / (w₁ + w₂ + … + wₙ)",
"GM = ⁿ√[(x₁)(x₂)…(xₙ)]",
"GM = Σ|x − x̄| / n"
]
},
{
"n": 16,
"stem": "Which of the following statement is NOT TRUE about the median?",
"opts": [
"At least the ordinal scale of measurement is required.",
"It is not influenced by extreme values.",
"It is not unique to a set of data.",
"Fifty percent of the observations are larger than the median."
]
},
{
"n": 17,
"stem": "What is the total number of observations if the total sum of square is 20 and the sample variance is 5?",
"opts": [
"4",
"15",
"25",
"35"
]
},
{
"n": 18,
"stem": "According to the empirical rule, the interval around the mean that covers approximately 99.7% of the data from a bell-shaped frequency distribution is",
"opts": [
"4μ ± 4σ",
"3μ ± 3σ",
"μ ± 3σ",
"2μ ± 2σ"
]
},
{
"n": 19,
"stem": "Which of the following measure of variation is useful for highly skewed distribution?",
"opts": [
"Interquartile deviation",
"Quartile deviation",
"Interquartile range",
"Quartile range"
]
},
{
"n": 20,
"stem": "The standard deviation of data is 12 and the mean is 72. What is the co-efficient of variation?",
"opts": [
"12.67%",
"14.67%",
"16.67%",
"18.67%"
]
},
{
"n": 21,
"stem": "The co-efficient of quartile deviation is 10.34% and the difference between the first and third quartile is 15. What is the sum of third and first quartile?",
"opts": [
"145",
"155",
"165",
"175"
]
},
{
"n": 22,
"stem": "Suppose you received a 5% increase in salary this year and a 15% increase next year. What is the average annual percent increase in salary?",
"opts": [
"9.89",
"10.00",
"1.09",
"1.10"
]
},
{
"n": 23,
"stem": "Kilograms of apple sold by a farmer between 9 am to 3 pm for 5 sample days were: 103, 97, 101, 106 and 103. What is the mean deviation of apple sold by a farmer?",
"opts": [
"102 kg",
"12 kg",
"2.4 kg",
"1.2 kg"
]
},
{
"n": 24,
"stem": "The interquartile range (IQR) is the difference between third (Q3) and first (Q1) quartiles. What is the IQR of marks obtained by students in a class?",
"opts": [
"31",
"50",
"74",
"75"
]
},
{
"n": 25,
"stem": "The dot plot shows land holding by size (in decimals) of 21 random households. What is the range of land holding in decimals?",
"opts": [
"90 decimals",
"50 decimals",
"48 decimals",
"10 decimals"
],
"image": "/papers/me/tech2-stat-2021-dotplot.png"
},
{
"n": 26,
"stem": "The dot plot shows land holding by size (in decimals) of 21 random households. How many households hold 50 decimals or more?",
"opts": [
"4 households",
"6 households",
"10 households",
"15 households"
],
"image": "/papers/me/tech2-stat-2021-dotplot.png"
},
{
"n": 27,
"stem": "The dot plot shows land holding by size (in decimals) of 21 random households. What is the median size of land holding?",
"opts": [
"40 decimals",
"48 decimals",
"50 decimals",
"90 decimals"
],
"image": "/papers/me/tech2-stat-2021-dotplot.png"
},
{
"n": 28,
"stem": "Which of the following is NOT TRUE about the symmetric set of observations?",
"opts": [
"The mean and median are equal.",
"The data values are evenly spread around mean and median.",
"The data values below the mean and median are the mirror image of those above.",
"The data values below the mean and median are not the mirror image of those above."
]
},
{
"n": 29,
"stem": "What is the range of the coefficient of skewness?",
"opts": [
"-3 up to 3",
"-1 up to 1",
"0 up to 3",
"0 up to 1"
]
},
{
"n": 30,
"stem": "A collection of one or more outcomes of an experiment is called",
"opts": [
"Experiment",
"Outcome",
"Event",
"Probability"
]
},
{
"n": 31,
"stem": "The probability of an event is the number of",
"opts": [
"favourable outcomes.",
"possible outcomes.",
"favourable outcomes divided by the number of possible outcomes.",
"favourable outcomes minus the number of possible outcomes."
]
},
{
"n": 32,
"stem": "Which of the following is TRUE about the small standard deviation for a set of values?",
"opts": [
"A small standard deviation for a set of values indicates that the values are close to mean.",
"A small standard deviation for a set of values indicates that the values are close to median.",
"A small standard deviation for a set of values indicates that the values are close to mode.",
"A small standard deviation for a set of values indicates that the values are close to standard deviation itself."
]
},
{
"n": 33,
"stem": "The mean income for a sample of 50 day-workers in Bhutan is Nu 500 per day and the standard deviation is Nu 20. According to the empirical rule, about what percent of incomes lie between Nu 460 and Nu 540 per day?",
"opts": [
"About 68 percent are between Nu 460 and Nu 540",
"About 95 percent are between Nu 460 and Nu 540",
"About 99.7 percent are between Nu 460 and Nu 540",
"About all of the percent (100 percent) are between Nu. 460 and Nu. 540"
]
},
{
"n": 34,
"stem": "The diagram shows the relationship between the number of bearing apple trees (thousands) and production (thousand MT) in Bhutan, according to the Ministry of Agriculture & Forests. What is the diagram called?",
"opts": [
"Scatter plot",
"Line chart",
"Column chart",
"Dot plot"
],
"image": "/papers/me/tech2-stat-2021-scatter.png"
},
{
"n": 35,
"stem": "The diagram shows the relationship between the number of bearing apple trees (thousands) and production (thousand MT) in Bhutan, according to the Ministry of Agriculture & Forests. How many observations were studied?",
"opts": [
"10 observations",
"9 observations",
"8 observations",
"7 observations"
],
"image": "/papers/me/tech2-stat-2021-scatter.png"
},
{
"n": 36,
"stem": "The diagram shows the relationship between the number of bearing apple trees (thousands) and production (thousand MT) in Bhutan, according to the Ministry of Agriculture & Forests. How would you characterize the relationship between the number of bearing apple trees and production?",
"opts": [
"There is no relationship between the bearing number of apple trees and production.",
"There is a positive relationship between the bearing number of apple trees and production.",
"There is a negative relationship between the bearing number of apple trees and production.",
"There is very weak relationship between the bearing number of apple trees and production."
],
"image": "/papers/me/tech2-stat-2021-scatter.png"
},
{
"n": 37,
"stem": "A 95% confidence interval for the unknown population mean (μ), with sample mean (x̄) of 122, population standard deviation (σ) of 20 and sample size (n) of 25, is",
"opts": [
"(114.16,122.00)",
"(114.16,120.89)",
"(114.16,129.89)",
"(122.00,129.89)"
]
},
{
"n": 38,
"stem": "A survey of graduates in one of the universities in Bhutan revealed the following majors of the students by gender:\nGender | Accounting | Management | Finance | Total\nMale | 100 | 150 | 50 | 300\nFemale | 100 | 50 | 50 | 200\nTotal | 200 | 200 | 100 | 500\nWhat is the probability of selecting a female student?",
"opts": [
"0.20",
"0.30",
"0.40",
"0.50"
]
},
{
"n": 39,
"stem": "A survey of graduates in one of the universities in Bhutan revealed the following majors of the students by gender:\nGender | Accounting | Management | Finance | Total\nMale | 100 | 150 | 50 | 300\nFemale | 100 | 50 | 50 | 200\nTotal | 200 | 200 | 100 | 500\nWhat is the probability of selecting a Finance or Accounting major?",
"opts": [
"0.20",
"0.40",
"0.50",
"0.60"
]
},
{
"n": 40,
"stem": "What is the probability of selecting a female student with Accounting major?",
"opts": [
"1.00",
"0.50",
"0.40",
"0.60"
]
},
{
"n": 41,
"stem": "Consider the experiment of rolling a six-sided die. What is the probability of the event \"an even number of spots appears face up\"?",
"opts": [
"1/6",
"2/6",
"3/6",
"4/6"
]
},
{
"n": 42,
"stem": "The Board of Directors of a company in Bhutan consists of 8 men and 4 women. A 4-person search committee is to be chosen at random to conduct a nationwide search for a new company President. What is the probability that all four members of the search committee will be women?",
"opts": [
"0.5",
"0.005",
"0.002",
"0.001"
]
},
{
"n": 43,
"stem": "The Board of Directors of a company in Bhutan consists of 8 men and 4 women. A 4-person search committee is to be chosen at random to conduct a nationwide search for a new company President. What is the probability that all four members of the search committee will be men?",
"opts": [
"0.1414",
"0.1515",
"0.5050",
"0.5000"
]
},
{
"n": 44,
"stem": "The Board of Directors of a company in Bhutan consists of 8 men and 4 women. A 4-person search committee is to be chosen at random to conduct a nationwide search for a new company President. Does the sum of the probabilities that all four members are women and that all four are men equal 1, and why?",
"opts": [
"Yes, because the sum of the probabilities for events equal 1.",
"No, there are other possibilities such as three women and one man.",
"May be, there are possibilities but I’m not sure about it.",
"I don’t know exactly what the question is talking about."
]
},
{
"n": 45,
"stem": "Bhutan Hyundai Motors sells the largest number of cars on Saturdays. The probability distribution of the number of cars it expects to sell on a particular Saturday is: x = 0, 1, 2, 3, 4 with P(x) = 0.1, 0.2, 0.3, 0.3, 0.1. What type of distribution is this?",
"opts": [
"Probability distribution",
"Discrete probability distribution",
"Continuous probability distribution",
"None of the above"
]
},
{
"n": 46,
"stem": "Bhutan Hyundai Motors sells the largest number of cars on Saturdays. The probability distribution of the number of cars it expects to sell on a particular Saturday is: x = 0, 1, 2, 3, 4 with P(x) = 0.1, 0.2, 0.3, 0.3, 0.1. On a typical Saturday, about how many new cars does Bhutan Hyundai Motors sell?",
"opts": [
"Approximately 4 cars a day",
"Approximately 3 cars a day",
"Approximately 2 cars a day",
"Approximately 1 car a day"
]
},
{
"n": 47,
"stem": "Bhutan Hyundai Motors sells the largest number of cars on Saturdays. The probability distribution of the number of cars it expects to sell on a particular Saturday is: x = 0, 1, 2, 3, 4 with P(x) = 0.1, 0.2, 0.3, 0.3, 0.1. What is the variance of the distribution?",
"opts": [
"1.210",
"1.250",
"1.290",
"1.295"
]
},
{
"n": 48,
"stem": "For a binomial distribution with n = 4 and π = 0.60, what is P(x = 2)?",
"opts": [
"0.246",
"0.346",
"0.446",
"0.546"
]
},
{
"n": 49,
"stem": "For a binomial distribution with n = 4 and π = 0.60, what is P(x ≤ 2)?",
"opts": [
"0.326",
"0.426",
"0.526",
"0.626"
]
},
{
"n": 50,
"stem": "For a binomial distribution with n = 4 and π = 0.60, what is P(x > 2)?",
"opts": [
"0.174",
"0.274",
"0.374",
"0.474"
]
},
{
"n": 51,
"stem": "Bhutan Jazaer Tours and Travel has 7 employees (consider them the population). Their hourly earnings (US$) are: Sonam 7, Yeshey 7, Sangay 8, Karma 8, Dorji 7, Namgay 8, Kinlay 9. What is the population mean?",
"opts": [
"9.71",
"8.71",
"7.00",
"7.71"
]
},
{
"n": 52,
"stem": "Bhutan Jazaer Tours and Travel has 7 employees (consider them the population). Their hourly earnings (US$) are: Sonam 7, Yeshey 7, Sangay 8, Karma 8, Dorji 7, Namgay 8, Kinlay 9. How many possible samples of size 2 (without replacement) make up the sampling distribution of the sample mean?",
"opts": [
"11 possible samples",
"21 possible samples",
"31 possible samples",
"41 possible samples"
]
},
{
"n": 53,
"stem": "Bhutan Jazaer Tours and Travel has 7 employees (consider them the population). Their hourly earnings (US$) are: Sonam 7, Yeshey 7, Sangay 8, Karma 8, Dorji 7, Namgay 8, Kinlay 9. What is the mean of the sampling distribution of the sample mean for samples of size 2?",
"opts": [
"4.71",
"5.71",
"6.71",
"7.71"
]
},
{
"n": 54,
"stem": "Bhutan Jazaer Tours and Travel has 7 employees (consider them the population). Their hourly earnings (US$) are: Sonam 7, Yeshey 7, Sangay 8, Karma 8, Dorji 7, Namgay 8, Kinlay 9. Which of the following is NOT TRUE about the population mean and the sampling distribution of the sample mean?",
"opts": [
"The mean of the sampling distribution is equal to the population mean.",
"The dispersion of the sampling distribution of the sample means is narrower than the population distribution.",
"The sampling distribution of the sample means tends to become bell-shaped and approximate to the normal probability distribution.",
"The mean of the sampling distribution is greater than the population mean."
]
},
{
"n": 55,
"stem": "A survey is conducted instead of census for all of the following reasons, EXCEPT",
"opts": [
"Contacting the entire population is too expensive",
"The cost of studying all items in the population is often too expensive",
"The sample results are usually inadequate",
"It is also impossible physically to check all items in the population"
]
},
{
"n": 56,
"stem": "The Prime Minister wants to know the mean income of the Bhutanese population. A random sample of 256 people reveals a sample mean of Nu 10,000 per month, with a sample standard deviation of Nu 2,050 per month. What is the mean income of the population per month?",
"opts": [
"The sample mean of Nu 10,000 is the point estimate of the population mean income per month.",
"In this case, we don’t know the population mean income per month. A census is required to conduct.",
"It is difficult to precisely tell the mean income of the population per month.",
"None of the above."
]
},
{
"n": 57,
"stem": "What is the reasonable range of values for the population mean income per month?",
"opts": [
"(6,950 to 10,000)",
"(7,950 to 12,050)",
"(10,000 to 12,050)",
"(10,950 to 12,050)"
]
},
{
"n": 58,
"stem": "The Prime Minister wants to know the mean income of the Bhutanese population. A random sample of 256 people reveals a sample mean of Nu 10,000 per month, with a sample standard deviation of Nu 2,050 per month. A 95% confidence interval for the population mean income per month is calculated from this sample. What does this range of values say?",
"opts": [
"The range of values says the mean income per month for the Bhutanese population is too low.",
"The range of values says that the government should raise the minimum pay.",
"If we selected many samples of 256 people, perhaps several hundred, we could expect about 95 percent of these confidence intervals to contain the population mean.",
"None of the above."
]
},
{
"n": 59,
"stem": "Which of the following is NOT TRUE about the F-distribution?",
"opts": [
"The F-distribution is continuous and it can assume an infinite number of values between zero and positive infinity.",
"It is positively skewed and the long tail of the distribution is to the right-hand side.",
"It is positively skewed and the long tail of the distribution is to the left-hand side.",
"It is asymptotic and as the value of x increases, the F curve approaches the X-axis."
]
},
{
"n": 60,
"stem": "The probability of rejecting the null hypothesis when it is true is called",
"opts": [
"Hypothesis testing",
"Null hypothesis",
"Level of significance",
"Alternative hypothesis"
]
},
{
"n": 61,
"stem": "What is the Type-I Error in hypothesis testing?",
"opts": [
"Type I error is the probability of rejection whether or not the null hypothesis, H₀, is true.",
"Type I error is the probability of acceptance whether or not the null hypothesis, H₀, is true.",
"Type I error is rejecting the null hypothesis, H₀, when it is true.",
"Type I error is rejecting the null hypothesis, H₀, when it is false."
]
},
{
"n": 62,
"stem": "All of the following are true about the p-value, EXCEPT",
"opts": [
"p-value is the probability of observing a sample value as extreme as, or more extreme than, the value observed, given that the null hypothesis is true.",
"A p-value is the way to express the likelihood that is false.",
"A p-value is the way to express the likelihood that is true.",
"If the p-value is small, then it is likely that is false."
]
},
{
"n": 63,
"stem": "Which of the following is NOT the assumption of ANOVA?",
"opts": [
"The population follow the normal distribution.",
"The populations are dependent.",
"The populations have equal standard deviation.",
"The populations are independent."
]
},
{
"n": 64,
"stem": "What is the total variation in ANOVA test?",
"opts": [
"The sum of the squared differences between each observation and the overall (grand) mean.",
"The sum of the squared differences between each observation and the treatment mean.",
"The sum of the squared differences between the treatment means.",
"The sum of the squared differences between the observations."
]
},
{
"n": 65,
"stem": "When studying characteristics of a population, there are many practical reasons why we prefer to select portions or samples of a population to study. All of the following are reasons for sampling, EXCEPT",
"opts": [
"The time to conduct study for the whole population may be prohibitive.",
"The cost to conduct study for the whole population may be prohibitive.",
"It may be difficult or almost impossible to study the whole population. For example, for the case of population study of fish varieties in Bhutan.",
"The sample results are not adequate and we always ignore sample survey."
]
},
{
"n": 66,
"stem": "In sampling, a sample to be selected from the population has the same chance of being selected. Which of the following is the considered the basis for any sampling method?",
"opts": [
"Simple Random Sampling",
"Systematic Random Sampling",
"Stratified Random Sampling",
"Cluster Sampling"
]
},
{
"n": 67,
"stem": "When a population can be clearly divided into groups based on the certain characteristics, the stratified random sampling method is used to ensure that each group is represented in the sample. The selected groups are called:",
"opts": [
"Cluster",
"Strata",
"Group",
"All of the above"
]
},
{
"n": 68,
"stem": "If the mean of sampling distribution is equal to population mean, then the sample statistics is often considered:",
"opts": [
"Unbiased estimator",
"Biased estimator",
"Interval estimator",
"Hypothesis estimator"
]
},
{
"n": 69,
"stem": "If the standard deviation of the population is 35 and the sample size is 9, which of the following is the standard deviation of sampling distribution?",
"opts": [
"11.67",
"12.67",
"13.67",
"14.67"
]
},
{
"n": 70,
"stem": "In statistical analysis, which of the following is true about the sample size?",
"opts": [
"The sample size is considered large if n ≥ 30",
"The sample size is considered large if n ≤ 30",
"The sample size is considered large if n ≥ 50",
"The sample size is considered large if n ≤ 50"
]
}
]"""

KEY = {
 1: ("a", "Statistics is the science of collecting, organising, presenting, analysing and interpreting data to make better decisions."),
 2: ("b", "Inferential statistics uses a sample to draw conclusions about a population."),
 3: ("c", "Marital status is a category (single, married, ...), so it is qualitative, not quantitative."),
 4: ("c", "Interval data are ordered with equal differences; categories with no logical order describe nominal data."),
 5: ("b", "A histogram is the standard graph of a frequency distribution."),
 6: ("c", "A measurable characteristic of a population is a parameter; of a sample, a statistic."),
 7: ("a", "For sampled (raw) data, the sum of the values divided by the number of observations is the sample mean."),
 8: ("b", "The sum of deviations from the arithmetic mean is always exactly 0, so (b) is not true."),
 9: ("b", "Variance is the mean of the squared deviations from the mean; the SD is its square root."),
 10: ("b", "Chebyshev's theorem: at least 1 − 1/k² of the values lie within k standard deviations of the mean, for any data set (k > 1)."),
 11: ("a", "For a bell-shaped distribution about 68% of observations lie within ±1 SD of the mean (95% within ±2, 99.7% within ±3)."),
 12: ("d", "Range = maximum − minimum = 105 − 6 = 99 million Ngultrum."),
 13: ("c", "The median is the line inside the box, at about 38-40 million Ngultrum."),
 14: ("c", "The × marker in a box plot shows the mean: 49 million Ngultrum."),
 15: ("c", "The geometric mean is the n-th root of the product of n values. (a) is the arithmetic mean, (b) the weighted mean, (d) the mean deviation."),
 16: ("c", "A data set has exactly one median, so 'it is not unique' is false. The median needs at least ordinal data and resists extreme values."),
 18: ("c", "Empirical rule: μ ± 1σ ≈ 68%, μ ± 2σ ≈ 95%, μ ± 3σ ≈ 99.7%."),
 20: ("c", "CV = SD/mean × 100 = 12/72 × 100 = 16.67%."),
 21: ("a", "Coefficient of quartile deviation = (Q3 − Q1)/(Q3 + Q1). So Q3 + Q1 = 15/0.1034 ≈ 145."),
 22: ("a", "Use the geometric mean of the growth factors: √(1.05 × 1.15) = √1.2075 = 1.0989, i.e. about 9.89% a year."),
 23: ("c", "Mean = 510/5 = 102. Absolute deviations: 1, 5, 1, 4, 1 = 12. Mean deviation = 12/5 = 2.4 kg."),
 25: ("a", "Smallest holding 10, largest 100: range = 100 − 10 = 90 decimals."),
 26: ("c", "At 50 or more: 4 (at 50) + 1 (60) + 1 (70) + 1 (80) + 2 (90) + 1 (100) = 10."),
 27: ("a", "21 values, so the median is the 11th: 10 (1), 20 (3), 30 (3) make 7; the 40s are the 8th-11th values. Median = 40 decimals."),
 28: ("d", "In a symmetric data set the values below the mean/median ARE a mirror image of those above, so (d) is not true."),
 30: ("c", "A collection of one or more outcomes of an experiment is an event."),
 31: ("c", "Classical probability = number of favourable outcomes ÷ number of possible outcomes."),
 32: ("a", "The standard deviation measures spread about the mean, so a small SD means the values are close to the mean."),
 33: ("b", "460 to 540 is 500 ± 2 × 20, i.e. the mean ± 2 SD, which covers about 95%."),
 34: ("a", "Paired values plotted as points against two axes form a scatter plot (here with a trend line)."),
 35: ("b", "There are 9 plotted points, so 9 observations."),
 36: ("b", "The points and the trend line slope upward: more bearing trees go with higher production - a positive relationship."),
 37: ("c", "122 ± 1.96 × 20/√25 = 122 ± 7.84 = (114.16, 129.84); option (c) is the matching interval (the paper prints 129.89)."),
 38: ("c", "P(female) = 200/500 = 0.40."),
 39: ("d", "The majors do not overlap: P(Finance or Accounting) = (100 + 200)/500 = 0.60."),
 41: ("c", "Even faces are 2, 4 and 6: 3 of 6 equally likely outcomes, so 3/6."),
 42: ("c", "C(4, 4)/C(12, 4) = 1/495 = 0.002."),
 43: ("a", "C(8, 4)/C(12, 4) = 70/495 = 0.1414."),
 44: ("b", "0.002 + 0.1414 ≠ 1, because the committee could also be 3 women and 1 man, 2 and 2, or 1 and 3."),
 45: ("b", "The number of cars takes whole-number values with probabilities summing to 1 - a discrete probability distribution."),
 46: ("c", "E(x) = 0(0.1) + 1(0.2) + 2(0.3) + 3(0.3) + 4(0.1) = 2.1, so about 2 cars."),
 47: ("c", "E(x²) = 0 + 0.2 + 1.2 + 2.7 + 1.6 = 5.7. Variance = 5.7 − 2.1² = 5.7 − 4.41 = 1.29."),
 48: ("b", "P(2) = C(4, 2)(0.6)²(0.4)² = 6 × 0.36 × 0.16 = 0.3456."),
 49: ("c", "P(0) = 0.0256, P(1) = 0.1536, P(2) = 0.3456; total = 0.5248 ≈ 0.526 (the closest option)."),
 50: ("d", "P(x > 2) = 1 − 0.5248 = 0.4752 ≈ 0.474 (the closest option); directly, P(3) + P(4) = 0.3456 + 0.1296 = 0.4752."),
 51: ("d", "μ = (7 + 7 + 8 + 8 + 7 + 8 + 9)/7 = 54/7 = 7.71."),
 52: ("b", "The number of samples of size 2 from 7 is C(7, 2) = 21."),
 53: ("d", "The mean of the sampling distribution of the sample mean equals the population mean, 7.71."),
 54: ("d", "The mean of the sampling distribution equals (not exceeds) the population mean; the other statements are true."),
 55: ("c", "Sample results are usually adequate; cost, time and physical impossibility are the real reasons for sampling."),
 56: ("a", "The population mean is unknown; the sample mean of Nu 10,000 is its point estimate."),
 58: ("c", "A 95% confidence level means that about 95% of intervals built this way from repeated samples would contain the true population mean."),
 59: ("c", "The F-distribution is positively skewed with its long tail to the right, so (c) is not true."),
 60: ("c", "The probability of rejecting a true null hypothesis is α, the level of significance (the Type I error rate)."),
 61: ("c", "A Type I error is rejecting H₀ when it is actually true."),
 63: ("b", "ANOVA assumes normal populations with equal standard deviations and independent samples; dependent populations are not an assumption."),
 64: ("a", "Total variation (SS total) = Σ(each observation − grand mean)²."),
 65: ("d", "Sample results are adequate when sampling is done properly; time, cost and the difficulty of covering everyone are the real reasons."),
 66: ("a", "Simple random sampling, where every unit has the same chance of selection, is the basis of the other probability sampling methods."),
 67: ("b", "In stratified random sampling the groups are called strata."),
 68: ("a", "A statistic whose sampling distribution has mean equal to the parameter is an unbiased estimator."),
 69: ("a", "Standard error = σ/√n = 35/√9 = 35/3 = 11.67."),
 70: ("a", "By convention (for the Central Limit Theorem), a sample of n ≥ 30 is considered large."),
}

NEW_MCQ = [
    ("A car travels 60 km at 30 km/h and returns the same 60 km at 60 km/h. What is its average speed for the whole journey?", ["45 km/h", "40 km/h", "42.4 km/h", "50 km/h"], "b",
     "Use the harmonic mean for equal distances: 2/(1/30 + 1/60) = 2/(3/60) = 40 km/h (check: 120 km in 2 + 1 = 3 hours)."),
    ("In how many ways can a President, a Secretary and a Treasurer be chosen from 8 members (one person cannot hold two posts)?", ["56", "336", "512", "24"], "b",
     "Order matters, so use permutations: ⁸P₃ = 8 × 7 × 6 = 336."),
    ("If Var(X) = 4, then Var(3X + 5) is", ["12", "17", "36", "41"], "c",
     "Var(aX + b) = a²Var(X) = 9 × 4 = 36; adding a constant does not change the variance."),
    ("Which of the following measures the peakedness of a distribution?", ["Skewness", "Kurtosis", "Dispersion", "Correlation"], "b",
     "Kurtosis describes how peaked (or flat, and how heavy-tailed) a distribution is; skewness describes its lack of symmetry."),
    ("For a Poisson distribution with mean 3, P(X = 0) is approximately", ["0.0498", "0.1494", "0.2240", "0"], "a",
     "P(X = 0) = e^(−3) × 3⁰/0! = e^(−3) ≈ 0.0498."),
    ("1% of a population has a disease. A test is positive for 90% of people with the disease and for 5% of people without it. What is the probability that a randomly chosen person tests positive?", ["0.0585", "0.0950", "0.0090", "0.9000"], "a",
     "Total probability: 0.01 × 0.90 + 0.99 × 0.05 = 0.009 + 0.0495 = 0.0585."),
    ("Using the median of the upper half, the upper quartile (Q3) of 2, 4, 6, 8, 10, 12, 14, 16 is", ["12", "14", "13", "15"], "c",
     "Upper half: 10, 12, 14, 16; its median is (12 + 14)/2 = 13."),
]

PLT = "The mean height of a plant is 43 millimetres. A researcher is concerned about the growth of the plants in his garden. He selects a random sample of 12 plants and measures each. The results (in mm) are:\n42, 39, 42, 45, 43, 40, 39, 41, 40, 42, 43, 42\n\n"
SAQ = [
 dict(marks=5, stem=PLT + "State the null hypothesis and the alternative hypothesis. (5 marks)",
      kp=[("H₀: μ = 43 mm - the mean height of the plants is as expected", 2), ("H₁: μ ≠ 43 mm - the mean height differs from 43 mm (two-tailed)", 2),
          ("Hypotheses are about the population mean μ, not the sample mean; (H₁: μ < 43 accepted if justified as a concern about poor growth)", 1)],
      model="Null hypothesis H₀: μ = 43 mm (the mean height of the plants in the garden is the expected 43 mm).\nAlternative hypothesis H₁: μ ≠ 43 mm (the mean height is different from 43 mm) - a two-tailed test, since part 5 asks whether growth is 'as expected'.\nThe hypotheses are statements about the population mean μ. (If the researcher's concern is specifically that the plants are shorter, H₁: μ < 43 mm, a one-tailed test, can be justified.)"),
 dict(marks=5, stem=PLT + "How many degrees of freedom are there? (5 marks)",
      kp=[("For a one-sample t test, df = n − 1", 2), ("n = 12", 1), ("df = 12 − 1 = 11", 2)],
      model="For a one-sample t test the degrees of freedom are df = n − 1. Here n = 12 plants, so df = 12 − 1 = 11. (One degree of freedom is lost because the sample mean is used to estimate μ when calculating s.)"),
 dict(marks=5, stem=PLT + "Calculate the sample standard deviation. (5 marks)",
      kp=[("x̄ = 498/12 = 41.5 mm", 1.5), ("Σ(x − x̄)² = 35 (or Σx² − (Σx)²/n = 20,702 − 20,667 = 35)", 1.5), ("s² = 35/11 = 3.18", 1), ("s = √3.18 ≈ 1.78 mm", 1)],
      model="Mean: x̄ = Σx/n = 498/12 = 41.5 mm.\nSquared deviations from 41.5: 42 → 0.25 (×4 = 1.0); 39 → 6.25 (×2 = 12.5); 45 → 12.25; 43 → 2.25 (×2 = 4.5); 40 → 2.25 (×2 = 4.5); 41 → 0.25.\nΣ(x − x̄)² = 1.0 + 12.5 + 12.25 + 4.5 + 4.5 + 0.25 = 35.\n(Check: Σx² = 20,702; (Σx)²/n = 498²/12 = 20,667; 20,702 − 20,667 = 35.)\ns² = 35/(12 − 1) = 3.18; s = √3.18 = 1.78 mm."),
 dict(marks=5, stem=PLT + "Compute the value of the t-statistic. (5 marks)",
      kp=[("Formula t = (x̄ − μ₀)/(s/√n)", 1.5), ("Standard error = 1.78/√12 = 1.78/3.464 = 0.515", 1.5), ("t = (41.5 − 43)/0.515 = −1.5/0.515 ≈ −2.91", 2)],
      model="t = (x̄ − μ₀)/(s/√n).\nx̄ = 41.5, μ₀ = 43, s = 1.784, n = 12.\nStandard error = s/√n = 1.784/√12 = 1.784/3.464 = 0.515.\nt = (41.5 − 43)/0.515 = −1.5/0.515 = −2.91 (with 11 degrees of freedom)."),
 dict(marks=5, stem=PLT + "What is the decision regarding the null hypothesis? Is it reasonable to conclude that the mean growth of a plant is as expected at the 0.01 level of significance? (5 marks)",
      kp=[("Critical value for a two-tailed test at α = 0.01 with 11 df: t = ±3.106", 1.5), ("|t| = 2.91 < 3.106, so do not reject H₀", 2),
          ("Conclusion: at the 1% level there is not enough evidence that the mean height differs from 43 mm - it is reasonable to conclude growth is as expected (note: a one-tailed test, critical −2.718, would reject)", 1.5)],
      model="Decision rule (two-tailed, α = 0.01, df = 11): reject H₀ if |t| > 3.106.\nComputed t = −2.91, so |t| = 2.91 < 3.106: we do not reject H₀ (fail to reject).\nConclusion: at the 0.01 level of significance there is not enough evidence that the mean height differs from 43 mm, so it is reasonable to conclude that the plants' mean growth is as expected. (If the researcher had used a one-tailed test, H₁: μ < 43, the critical value would be −2.718 and H₀ would be rejected - the choice of test should be made before seeing the data.)"),
 dict(real=False, marks=5, stem=PLT + "Construct a 99% confidence interval for the mean height of the plants and explain how it agrees with the decision on the null hypothesis. (5 marks)",
      kp=[("Formula x̄ ± t(0.005, 11) × s/√n with t = 3.106", 1.5), ("41.5 ± 3.106 × 0.515 = 41.5 ± 1.60", 1.5), ("99% CI ≈ (39.9 mm, 43.1 mm)", 1),
          ("43 lies inside the interval, which agrees with not rejecting H₀: μ = 43 at the 1% level", 1)],
      model="99% CI = x̄ ± t(0.005, 11) × s/√n = 41.5 ± 3.106 × 0.515 = 41.5 ± 1.60.\nCI ≈ (39.9 mm, 43.1 mm).\nWe are 99% confident that the true mean plant height lies between about 39.9 mm and 43.1 mm. The hypothesised value 43 mm lies inside this interval, which agrees with the two-tailed test at α = 0.01: H₀: μ = 43 is not rejected. (A two-tailed test at level α rejects H₀ exactly when μ₀ falls outside the (1 − α) confidence interval.)"),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
