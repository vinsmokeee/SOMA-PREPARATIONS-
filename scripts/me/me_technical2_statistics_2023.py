"""ME Technical Paper II (General Subject Knowledge), STATISTICS group, BCSE 2023 - real paper. PDF sent by the founder.
Follows the latest (BCSE 2025) layout: Part I 70 MCQ x 1; Part II 6 short answers x 5 = 30.
The 2023 paper's Part II (Q1 a 4+4, b 4, c 6; Q2 6; Q3 6 = 30) is set out as five 5-mark questions with the marks scaled;
one new short answer of the same kind (a z-test) makes six.
Formulas, tables and charts retyped from the page images; charts cropped from the paper (public/papers/me/tech2-stat-2023-*.png).
Repeat (recorded as an appearance, not loaded again): MCQ 23 (unit of variance, BCSE 2024).
Left out (more than one defensible answer): MCQ 38 (boxplot: Mango and Peach both show outliers), 50 (simple event / sample point),
66 (line graph / historigram). Four new MCQs keep Part I at 70.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Statistics): BCSE 2023, batch 1"
GROUP_TAG = "stat2023"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "statistics"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2023 Main Examination, Technical Paper II, Statistics", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 6, "marks_each": 5, "answer_any": None},
]
TOPIC = "Statistics: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "The purpose of statistics is to use the information contained in a sample to ____ about the population from which the sample is taken.",
"opts": [
"Make tables",
"Make inferences",
"Make graphical representations",
"Make predictions"
]
},
{
"n": 2,
"stem": "The mean and median of data set given below were 9 and 9 respectively. It was noticed later that instead of 15, the correct figure was 29. What is the new mean and median? 3,5,7,9,11,13,15",
"opts": [
"Mean = 9 and median = 11",
"Mean = 11 and median = 11",
"Mean = 11 and median = 9",
"Mean = 9 and median = 9"
]
},
{
"n": 3,
"stem": "The rating of teacher as “good/very good/outstanding” is an example of",
"opts": [
"Discrete data",
"Nominal data",
"Continuous data",
"Ordinal data"
]
},
{
"n": 4,
"stem": "The data collected by government departments and other organizations for the purposes of registration, transaction and record keeping usually during the delivery of a service is",
"opts": [
"Web data",
"Survey data",
"Transaction data",
"Administrative data"
]
},
{
"n": 5,
"stem": "Which of the following time series components represents the repeating patterns that occur within a fixed period?",
"opts": [
"Trend",
"Seasonality",
"Noise",
"Cyclical Variation"
]
},
{
"n": 6,
"stem": "For any constant c, the summation Σᵢ₌₁ⁿ c is",
"opts": [
"c",
"n × c",
"n × c²",
"c / n"
]
},
{
"n": 7,
"stem": "Which of the following is an example of inferential statistics?",
"opts": [
"Computing mean of a data set",
"Describing variability of data",
"Finding range of a data set",
"Testing hypothesis to compare two groups"
]
},
{
"n": 8,
"stem": "Which of the following statistic can have more than one value in a single sample?",
"opts": [
"Mean",
"Median",
"Mode",
"Range"
]
},
{
"n": 9,
"stem": "Which statement is NOT TRUE about the population mean?",
"opts": [
"A parameter",
"A fixed quantity",
"A function of the data (X’s)",
"Unknown, but we want to know"
]
},
{
"n": 10,
"stem": "A set of observations recorded at an equal interval of time is:",
"opts": [
"Geometric series",
"Array data",
"Tabular data",
"Time series data"
]
},
{
"n": 11,
"stem": "The data Y come from some distribution f(Y|θ), with parameter θ. There are two possibilities for θ: either θ = θ₀ or θ ≠ θ₀. What do we call the case θ = θ₀?",
"opts": [
"Type I error",
"Alternative hypothesis",
"Null hypothesis",
"Type II error"
]
},
{
"n": 12,
"stem": "The Human Resource Officer wants to determine the number of staff by sex, what would be the appropriate measure of central tendency?",
"opts": [
"Mean",
"Median",
"Mode",
"Range"
]
},
{
"n": 13,
"stem": "The purpose of random sampling in inferential statistics is to",
"opts": [
"Ensure that the sample size is large enough",
"Make the sample representative of the population",
"Reduce the standard error of the sample mean",
"Increase the variability in the sample"
]
},
{
"n": 14,
"stem": "If X₁, X₂, …, Xₙ are independent and identically distributed (iid) with mean μ and SD σ and the sample size n is large, then the approximate distribution of X̄ is",
"opts": [
"X̄ ≈ normal(μ, σ/√n)",
"X̄ ≈ normal(μ, σ/n)",
"X̄ ≈ normal(μ, σ)",
"X̄ ≈ normal(μ, σ²/√n)"
]
},
{
"n": 15,
"stem": "If we conduct a census of the population, then our estimator will have",
"opts": [
"Small sampling variance",
"Zero sampling variance",
"Big sampling variance",
"Unit sampling variance"
]
},
{
"n": 16,
"stem": "If a die is fair, then",
"opts": [
"The occurrence of 4, 5, & 6 sided will be more than 1,2 & 3 sided",
"All possible distinct outcomes have different probabilities",
"The occurrence of 1,2 & 3 sided will be more than 4, 5 & 6 sided",
"All possible distinct outcomes are equally likely"
]
},
{
"n": 17,
"stem": "The diagram shows four target figures (shots on a target). Which figure indicates high bias and low variance?",
"opts": [
"Figure 1",
"Figure 2",
"Figure 3",
"Figure 4"
],
"image": "/papers/me/tech2-stat-2023-targets.png"
},
{
"n": 18,
"stem": "If mean of a data set is smaller than the median, then data set is likely to be",
"opts": [
"Positively skewed",
"Negatively skewed",
"Symmetrically distributed",
"Uniformly distributed"
]
},
{
"n": 19,
"stem": "A good hypothesis test will have",
"opts": [
"Small size and high power",
"High size and high power",
"Small size and small power",
"High size and small power"
]
},
{
"n": 20,
"stem": "It is reported that the average household income per year is Nu. 140,000. The household income data mostly falls within the range of Nu. 30,000 and Nu. 300,000. What would be the approximate standard deviation?",
"opts": [
"Nu. 67,000",
"Nu. 70,000",
"Nu. 67,500",
"Nu. 75,000"
]
},
{
"n": 21,
"stem": "The average height of the National Statistics Bureau’s staff, μ is 165 cm. This is an example of",
"opts": [
"Point estimate",
"Fixed estimate",
"Interval estimate",
"Class estimate"
]
},
{
"n": 22,
"stem": "Karma selects a random sample of men and a random sample of women to assess if men are taller than women. What test is Karma looking for?",
"opts": [
"Testing for dependent samples",
"Testing for independent samples",
"Testing for two population proportions",
"Testing for two population variances"
]
},
{
"n": 23,
"stem": "The unit for variance is",
"opts": [
"Unitless",
"Original unit",
"Original unit squared",
"None of above"
]
},
{
"n": 24,
"stem": "Which correlation represents the strongest relationship?",
"opts": [
"+0.76",
"-0.11",
"-0.83",
"+0.45"
]
},
{
"n": 25,
"stem": "Which one of the following assumptions is NOT TRUE about errors in regression model?",
"opts": [
"Normality",
"Independence",
"Homoscedasticity",
"Heteroscedasticity"
]
},
{
"n": 26,
"stem": "Wangchuk is trying to predict sales of a product using the relationship between sales and the amount spent on advertising, with the model Sales = β₀ + β₁·Advertisement + ε, where ε ~ (0, σ²). How many parameters does Wangchuk need to estimate from the above model?",
"opts": [
"1",
"2",
"3",
"4"
]
},
{
"n": 27,
"stem": "Wangchuk is trying to predict sales of a product using the relationship between sales and the amount spent on advertising, with the model Sales = β₀ + β₁·Advertisement + ε, where ε ~ (0, σ²). Which part of the regression function is non-random?",
"opts": [
"β₀ + β₁·Advertisement and ε",
"β₀ + β₁·Advertisement",
"Sales and β₀ + β₁·Advertisement",
"Sales and ε"
]
},
{
"n": 28,
"stem": "Wangchuk is trying to predict sales of a product using the relationship between sales and the amount spent on advertising, with the model Sales = β₀ + β₁·Advertisement + ε, where ε ~ (0, σ²). The expectation of sales, E(Sales), is equal to",
"opts": [
"β₀ + β₁·Advertisement",
"β₀ + β₁·Advertisement + σ",
"β₁·Advertisement",
"β₀"
]
},
{
"n": 29,
"stem": "In logistic regression, the dependent variable is",
"opts": [
"Continuous",
"Ordinal",
"Categorical",
"Interval"
]
},
{
"n": 30,
"stem": "Which of the following is NOT TRUE about the normal distribution?",
"opts": [
"Bell-shaped",
"Tends to 0 as y → ±∞",
"Different mean, median and mode",
"Symmetric about mean μ"
]
},
{
"n": 31,
"stem": "The number of car accidents in Thimphu within a month is an example of",
"opts": [
"Discrete data",
"Nominal data",
"Continuous data",
"Ordinal data"
]
},
{
"n": 32,
"stem": "The line graph shows unemployment rates (in %) for 10 different countries (A to J). Instead of the line graph, which pictorial representation would be the most appropriate to illustrate the data?",
"opts": [
"Pie chart",
"Bar chart",
"Stacked bar chart",
"Histogram"
],
"image": "/papers/me/tech2-stat-2023-unemployment.png"
},
{
"n": 33,
"stem": "Individuals or objects on which the experiment is done is called",
"opts": [
"Sampling unit",
"Experimental unit",
"Response",
"Levels"
]
},
{
"n": 34,
"stem": "Which statement is TRUE about the sample mean?",
"opts": [
"A random quantity",
"An estimator of population mean",
"Has uncertainty",
"All of above"
]
},
{
"n": 35,
"stem": "For the probability mass function f(y) = C(n, y) pʸ (1 − p)ⁿ⁻ʸ, 0 ≤ p ≤ 1, the value of y ranges from",
"opts": [
"y = 0, 1, 2, …, n",
"y = 1, 2, …, n",
"y = 0, 1, 2, …, n − 1",
"y = 1, 2, …, n − 1"
]
},
{
"n": 36,
"stem": "The scatter plots show the relationship between variables Y and X. Which figure represents correlation coefficient r = 0?",
"opts": [
"Figure 1",
"Figure 2",
"Figure 3",
"Figure 4"
],
"image": "/papers/me/tech2-stat-2023-scatter.png"
},
{
"n": 37,
"stem": "The boxplots display the distribution of standardized weight for four fruits. The distribution of standardized weight for which fruit is left-skewed?",
"opts": [
"Orange",
"Apple",
"Mango",
"Peach"
],
"image": "/papers/me/tech2-stat-2023-boxplot.png"
},
{
"n": 38,
"stem": "Which distribution is normal but contains outliers?",
"opts": [
"Orange",
"Apple",
"Mango",
"Peach"
]
},
{
"n": 39,
"stem": "The National Statistics Bureau (NSB) is organizing a departmental football tournament in December 2023. Approximately 20 departments initially showed interest, but only 15 teams officially registered for the tournament. Each team will play two matches against the same opponent, and the top two teams will advance to the final. How many matches should the NSB coordinate in order to determine the winner?",
"opts": [
"211",
"31",
"106",
"41"
]
},
{
"n": 40,
"stem": "Which sampling scheme partitions the population into mutually exclusive and exhaustive subpopulation?",
"opts": [
"Custer sampling",
"Stratified sampling",
"Simple random sampling",
"Systematic sampling"
]
},
{
"n": 41,
"stem": "The p-value in hypothesis testing represents",
"opts": [
"The probability of making a Type I error",
"The probability of making a Type II error",
"The probability that the null hypothesis is true",
"The probability of obtaining the observed results or more extreme results if the null hypothesis is true"
]
},
{
"n": 42,
"stem": "Sex ratio is a basic measure to explain the sex composition of a population. It is defined as the number of males per 100 females. If a country reports sex ratio of 110, which of the following is correct interpretation?",
"opts": [
"There are 110 females for every 100 males in the population",
"There are 10 more females than females in the population",
"There are 110 males for every 100 females in the population",
"There are 10 more males than females in the population"
]
},
{
"n": 43,
"stem": "The plot shows the density curves of three data sets: the original data and two transformed versions. What change do you observe in the probability densities of Transformed 1 and Transformed 2 as compared to the original data?",
"opts": [
"The density curves are more flattened",
"The density curves have different mean",
"The density curves are more peaked",
"The density curves are more skewed"
],
"image": "/papers/me/tech2-stat-2023-density.png"
},
{
"n": 44,
"stem": "The table below gives total exports (in Nu. million) for the 12 months of 2021 and 2022.\nMonth | 2021 | 2022\nJanuary | 123 | 178\nFebruary | 118 | 198\nMarch | 134 | 177\nApril | 167 | 190\nMay | 156 | 201\nJune | 189 | 211\nJuly | 155 | 266\nAugust | 144 | 266\nSeptember | 178 | 254\nOctober | 147 | 219\nNovember | 198 | 222\nDecember | 144 | 213\nWhat was the annual profit in 2022 if the total annual imports for the same year were Nu. 1.5 billion?",
"opts": [
"Nu. 2.595 billion",
"Nu. 1.095 billion",
"Nu. 742 million",
"Nu. 4.095 billion"
]
},
{
"n": 45,
"stem": "The table below gives total exports (in Nu. million) for the 12 months of 2021 and 2022.\nMonth | 2021 | 2022\nJanuary | 123 | 178\nFebruary | 118 | 198\nMarch | 134 | 177\nApril | 167 | 190\nMay | 156 | 201\nJune | 189 | 211\nJuly | 155 | 266\nAugust | 144 | 266\nSeptember | 178 | 254\nOctober | 147 | 219\nNovember | 198 | 222\nDecember | 144 | 213\nWhat was the annual growth rate of exports from 2021 to 2022?",
"opts": [
"40.04%",
"28.59%",
"−40.04%",
"−28.59%"
]
},
{
"n": 46,
"stem": "Dorji went to a factory outlet to buy jackets. He took 10 jackets and examined whether the items were defective. Since it has two possible outcomes, it can be represented with the help of a binomial distribution. If Dorji took just one jacket and examine it for defects, what distribution does it represent?",
"opts": [
"Poisson distribution",
"binomial distribution",
"Normal distribution",
"Bernoulli distribution"
]
},
{
"n": 47,
"stem": "Two sets, A and B are said to be disjoint, and mutually exclusive if",
"opts": [
"A ∪ B = ∅",
"A ∩ B = ∅",
"A ∩ B ≠ ∅",
"A ∪ B ≠ ∅"
]
},
{
"n": 48,
"stem": "For the probability density function f(y) = (1 / (σ√(2π))) e^(−(y − μ)² / (2σ²)), σ > 0 and −∞ < y < ∞: if μ = 0 and σ² = 1, then the distribution will be",
"opts": [
"Standard exponential distribution",
"Standard uniform distribution",
"Standard normal distribution",
"Standard gamma distribution"
]
},
{
"n": 49,
"stem": "The quantity √n(Ȳ − μ)/σ ~ N(0, 1). If σ is unknown, it is estimated by the sample standard deviation S. What will be the distribution of √n(Ȳ − μ)/S?",
"opts": [
"Student's t distribution with n df",
"χ² distribution with n df",
"Student's t distribution with (n − 1) df",
"F distribution with (n, n − 1) df"
]
},
{
"n": 50,
"stem": "A possible distinct outcome of the experiment is called",
"opts": [
"Event",
"Sample space",
"Simple event",
"Sample point"
]
},
{
"n": 51,
"stem": "In Simple Random Sampling without Replacement, the selection probability of the first sample from population of size N is 1/N. What will be the selection probability of third sample?",
"opts": [
"1/(N − 3)",
"1/(N − 1)",
"1/(N − 2)",
"1/N"
]
},
{
"n": 52,
"stem": "The number of ways of selecting 2 applicants out of 5 is",
"opts": [
"20",
"15",
"25",
"10"
]
},
{
"n": 53,
"stem": "In a statistical experiment of tossing a single die, let A = the event of an odd number and B = the event of an even number. Then A ∩ B will be",
"opts": [
"Finite set",
"Null set",
"Infinite set",
"Universal set"
]
},
{
"n": 54,
"stem": "The parameters are treated as random variables in which field",
"opts": [
"Frequentist inference",
"Bayesian inference",
"Both",
"None of above"
]
},
{
"n": 55,
"stem": "A trend line is best-fitted when its sum of squares of residuals or errors is",
"opts": [
"Positive",
"Maximum",
"Negative",
"Minimum"
]
},
{
"n": 56,
"stem": "Samdrup is a health-conscious man. Every day he goes for a walk for one or two hours. Sometimes he plays football and misses his regular walk. Let Y be the number of hours Samdrup spends walking in a day, with probability distribution: y = 0, 1, 2 with f(y) = 1/2, 1/4, 1/4. The expected value of Y is",
"opts": [
"3/4",
"1/2",
"1/4",
"2/3"
]
},
{
"n": 57,
"stem": "Let Y be a discrete random variable with probability mass function f(y). Which one of the following expressions is TRUE?",
"opts": [
"E[αg(Y) + β] = αE[g(Y)] + β, where α and β are constants and g(Y) is a function of Y",
"E(c) = nc, where c is a constant",
"E(Y²) = y² Σ f(y)",
"E[g(Y) + h(Y)] = g(Y) × h(Y)"
]
},
{
"n": 58,
"stem": "If Y is a random variable with mean E(Y) = μ, then the standard deviation of a random variable Y is",
"opts": [
"√Var(Y)",
"√E[(Y − μ)²]",
"√(E(Y²) − μ²)",
"All of the above"
]
},
{
"n": 59,
"stem": "What is the primary characteristic of big data?",
"opts": [
"High variety",
"Low volume",
"Limited velocity",
"Small complexity"
]
},
{
"n": 60,
"stem": "All statistics have probability distributions called",
"opts": [
"Normal distributions",
"Standard normal distributions",
"Population distributions",
"Sampling distributions"
]
},
{
"n": 61,
"stem": "The following examples are statistical bias examples. Which one is the followings is an example sampling bias?",
"opts": [
"The university researcher examines the students in his class and draws conclusions about human behaviour",
"Respondents tends to provide responses in a survey that present themselves in a positive light rather providing truthful answers",
"Over 80% of registered voters refused to participate in a political survey, causing the survey to not truly reflect voters’ opinions",
"A sports medicine researcher forgot to calibrate their scale so it consistently underestimates the weight of the study’s participants by 0.3 lbs"
]
},
{
"n": 62,
"stem": "Which one of the following distributions is a continuous probability distribution?",
"opts": [
"Geometric Distribution",
"Hypergeometric distribution",
"Negative binomial distribution",
"Normal distribution"
]
},
{
"n": 63,
"stem": "The survey weights are used for following purposes, except",
"opts": [
"For poststratification",
"To compensate for nonresponse",
"To compensate for unequal selection probabilities",
"To compensate for equal selection probabilities"
]
},
{
"n": 64,
"stem": "Data collected from a household survey, where Y = 1 if the household has a washing machine and 0 otherwise:\nPSU | Household | y | Base weight (W) | W*y\n1 | 1 | 0 | 50 | 0\n1 | 2 | 1 | 50 | 50\n2 | 1 | 1 | 20 | 20\n2 | 2 | 1 | 20 | 20\n3 | 1 | 0 | 25 | 0\n3 | 2 | 1 | 25 | 25\nWhat is the estimated total number of households from the survey?",
"opts": [
"190",
"6",
"9",
"115"
]
},
{
"n": 65,
"stem": "Data collected from a household survey, where Y = 1 if the household has a washing machine and 0 otherwise:\nPSU | Household | y | Base weight (W) | W*y\n1 | 1 | 0 | 50 | 0\n1 | 2 | 1 | 50 | 50\n2 | 1 | 1 | 20 | 20\n2 | 2 | 1 | 20 | 20\n3 | 1 | 0 | 25 | 0\n3 | 2 | 1 | 25 | 25\nWhat is the estimated proportion of households having a washing machine?",
"opts": [
"60.5%",
"66.7%",
"44.4%",
"55.6%"
]
},
{
"n": 66,
"stem": "The graphical representation used for time series data is",
"opts": [
"Line graph",
"Historigram",
"Bar graph",
"Trend"
]
},
{
"n": 67,
"stem": "Which of the following statements accurately describes a stationary time series?",
"opts": [
"The data exhibits a consistent, predictable pattern over time",
"The data shows a constant mean and variance over time",
"The data is characterized by a linear trend over time",
"The data displays random fluctuations with no discernible pattern"
]
},
{
"n": 68,
"stem": "The data which describes or defines other data is called",
"opts": [
"Big data",
"Descriptive data",
"Metadata",
"Microdata"
]
},
{
"n": 69,
"stem": "In surveys, the choice of sample size basically depends on, except",
"opts": [
"Fixed percentage on population size",
"Sample design",
"Level of precision",
"Variable of interest"
]
},
{
"n": 70,
"stem": "What is the primary purpose of experimental design in scientific purpose?",
"opts": [
"To gather data randomly",
"To control confounding variables and establish causality",
"To rely solely on observational studies",
"To eliminate the need for statistical analysis"
]
}
]"""

KEY = {
 1: ("b", "Statistics uses a sample to make inferences (generalisations) about the population it was drawn from."),
 2: ("c", "Corrected data 3, 5, 7, 9, 11, 13, 29: sum = 77, so mean = 77/7 = 11. The middle (4th) value is still 9, so the median is unchanged at 9."),
 3: ("d", "Good / very good / outstanding are categories with a natural order but no fixed distance between them - ordinal data."),
 4: ("d", "Records kept by government and other bodies while delivering a service (registration, transactions, record keeping) are administrative data."),
 5: ("b", "Seasonality is the pattern that repeats within a fixed period (e.g. every year or quarter). Cyclical variation has no fixed period."),
 6: ("b", "Adding the constant c to itself n times gives Σc = n × c."),
 7: ("d", "Testing a hypothesis to compare two groups draws conclusions beyond the data - inferential statistics. The others only describe the data."),
 8: ("c", "A sample can have more than one mode (bimodal, multimodal). Mean, median and range each have exactly one value."),
 9: ("c", "The population mean is a fixed, usually unknown parameter. It is not a function of the sample data - that is the sample mean (a statistic)."),
 10: ("d", "Observations recorded at equal intervals of time form a time series."),
 11: ("c", "θ = θ₀ is the null hypothesis (H₀); θ ≠ θ₀ is the alternative hypothesis."),
 12: ("c", "Sex is a nominal (categorical) variable, so the only suitable average is the mode - the most frequent category."),
 13: ("b", "Random sampling gives every unit a known chance of selection, which makes the sample representative and inference valid."),
 14: ("a", "By the Central Limit Theorem, for large n the sample mean is approximately normal with mean μ and standard deviation σ/√n (the standard error)."),
 15: ("b", "A census covers every unit, so there is no sampling error and the sampling variance is zero (non-sampling errors can still exist)."),
 16: ("d", "A fair die gives every face the same probability, 1/6 - all outcomes are equally likely."),
 17: ("c", "Figure 3: the shots are tightly grouped (low variance) but far from the centre (high bias). Figure 1 is low bias, low variance; Figure 2 is low bias, high variance; Figure 4 is high bias, high variance."),
 18: ("b", "When the mean is less than the median, the long tail is on the left - the data are negatively (left) skewed."),
 19: ("a", "A good test has a small size (low Type I error rate, α) and high power (1 − β, a high chance of rejecting a false H₀)."),
 20: ("c", "Range rule of thumb: most data lie within about ±2 SD of the mean, so SD ≈ range/4 = (300,000 − 30,000)/4 = Nu. 67,500."),
 21: ("a", "A single value (165 cm) given for the average is a point estimate; an interval estimate would give a range."),
 22: ("b", "Men and women are separate random samples, so this is a test for two independent samples (e.g. a two-sample t test)."),
 24: ("c", "Strength depends on the size of r regardless of sign: |−0.83| is the largest."),
 25: ("d", "Regression assumes errors are normal, independent and homoscedastic (constant variance). Heteroscedasticity is a violation, not an assumption."),
 26: ("c", "Three parameters: the intercept β₀, the slope β₁ and the error variance σ². (The paper prints ε ~ (μ, σ²); regression errors have mean 0.)"),
 27: ("b", "β₀ + β₁·Advertisement is fixed for a given advertising amount; ε (and therefore Sales) is random."),
 28: ("a", "E(Sales) = β₀ + β₁·Advertisement + E(ε) = β₀ + β₁·Advertisement, because E(ε) = 0."),
 29: ("c", "Logistic regression models a categorical (usually binary) dependent variable."),
 30: ("c", "In a normal distribution the mean, median and mode are equal. It is bell-shaped, symmetric about μ and tends to 0 in both tails."),
 31: ("a", "A count of accidents takes whole-number values only - discrete data."),
 32: ("b", "Countries A to J are separate categories, not a time sequence, so a bar chart is most appropriate. A line graph suggests a trend over time."),
 33: ("b", "The individuals or objects on which an experiment is performed are experimental units."),
 34: ("d", "The sample mean is a random quantity (it changes from sample to sample), it estimates the population mean, and it has uncertainty (its standard error)."),
 35: ("a", "This is the binomial pmf: the number of successes in n trials can be 0, 1, 2, …, n."),
 36: ("a", "Figure 1 is a shapeless cloud with no upward or downward pattern, so r ≈ 0. Figure 2 is r = 1, Figure 3 positive and Figure 4 negative correlation."),
 37: ("c", "Mango has its long tail and outliers on the lower side, so it is left (negatively) skewed. Apple and Peach have long upper tails (right-skewed)."),
 39: ("a", "15 teams each play every other team twice: 2 × C(15, 2) = 2 × 105 = 210 matches, plus 1 final = 211."),
 40: ("b", "Stratified sampling divides the population into mutually exclusive and exhaustive strata and samples from each."),
 41: ("d", "The p-value is the probability, assuming H₀ is true, of getting results as extreme as or more extreme than those observed."),
 42: ("c", "Sex ratio = males per 100 females, so 110 means 110 males for every 100 females."),
 43: ("b", "The transformed curves have about the same shape and spread but are shifted left and right - their means differ."),
 44: ("b", "2022 exports = 178 + 198 + 177 + 190 + 201 + 211 + 266 + 266 + 254 + 219 + 222 + 213 = Nu. 2,595 million. Profit (trade surplus) = 2.595 − 1.5 = Nu. 1.095 billion."),
 45: ("a", "2021 total = Nu. 1,853 million; 2022 total = Nu. 2,595 million. Growth = (2,595 − 1,853)/1,853 × 100 = 742/1,853 × 100 = 40.04%."),
 46: ("d", "A single trial with two outcomes (defective or not) is a Bernoulli trial; n such trials give a binomial distribution."),
 47: ("b", "Disjoint (mutually exclusive) sets have no common element: A ∩ B = ∅."),
 48: ("c", "The normal pdf with μ = 0 and σ² = 1 is the standard normal distribution N(0, 1)."),
 49: ("c", "Replacing σ with the sample SD S gives Student's t distribution with n − 1 degrees of freedom."),
 51: ("c", "Without replacement, two units have already been drawn, so N − 2 remain and each has probability 1/(N − 2) of being the third selection."),
 52: ("d", "C(5, 2) = 5!/(2! × 3!) = 10."),
 53: ("b", "No number is both odd and even, so A ∩ B has no elements - a null set."),
 54: ("b", "In Bayesian inference parameters are random variables with prior and posterior distributions; frequentists treat them as fixed."),
 55: ("d", "The least-squares line minimises the sum of squared residuals."),
 56: ("a", "E(Y) = 0 × 1/2 + 1 × 1/4 + 2 × 1/4 = 1/4 + 1/2 = 3/4."),
 57: ("a", "Expectation is linear: E[αg(Y) + β] = αE[g(Y)] + β. E(c) = c (not nc), and E(Y²) = Σ y² f(y)."),
 58: ("d", "SD = √Var(Y), and Var(Y) = E[(Y − μ)²] = E(Y²) − μ², so all three expressions are equal."),
 59: ("a", "Big data is characterised by high volume, high velocity and high variety; of the options only high variety fits."),
 60: ("d", "Every statistic varies from sample to sample; its probability distribution is called its sampling distribution."),
 61: ("a", "Using only the students in one class to draw conclusions about all human behaviour is sampling (selection) bias. (b) is response bias, (c) non-response bias and (d) measurement bias."),
 62: ("d", "The normal distribution is continuous; geometric, hypergeometric and negative binomial are discrete."),
 63: ("d", "Survey weights compensate for unequal selection probabilities and non-response, and are adjusted by post-stratification. Equal probabilities need no compensation."),
 64: ("a", "Estimated total = sum of the base weights = 50 + 50 + 20 + 20 + 25 + 25 = 190 households."),
 65: ("a", "Estimated proportion = Σ(W·y)/ΣW = (0 + 50 + 20 + 20 + 0 + 25)/190 = 115/190 = 60.5%."),
 67: ("b", "A stationary time series has a constant mean, variance (and autocorrelation) over time - no trend."),
 68: ("c", "Data that describes other data (definitions, sources, methods) is metadata."),
 69: ("a", "Sample size depends on the design, required precision and the variable of interest - not on a fixed percentage of the population."),
 70: ("b", "Experimental design controls confounding variables (through randomisation, control groups) so that cause and effect can be established."),
}

NEW_MCQ = [
    ("If A and B are independent events with P(A) = 0.5 and P(B) = 0.4, then P(A ∪ B) is", ["0.9", "0.7", "0.2", "0.1"], "b",
     "For independent events P(A ∩ B) = 0.5 × 0.4 = 0.2, so P(A ∪ B) = 0.5 + 0.4 − 0.2 = 0.7."),
    ("The variance of a binomial distribution with n = 20 and p = 0.3 is", ["6", "4.2", "14", "2.05"], "b",
     "Var = np(1 − p) = 20 × 0.3 × 0.7 = 4.2 (the mean is np = 6)."),
    ("A data set has a mean of 50 and a standard deviation of 10. Its coefficient of variation is", ["5%", "20%", "40%", "500%"], "b",
     "CV = (SD / mean) × 100 = (10 / 50) × 100 = 20%."),
    ("The sample variance (using the divisor n − 1) of the observations 2, 4, 6, 8, 10 is", ["8", "40", "10", "3.16"], "c",
     "Mean = 6; squared deviations 16 + 4 + 0 + 4 + 16 = 40; s² = 40/(5 − 1) = 10."),
]

PEN = "Penjor and his family want to rent an apartment in Thimphu next year. Penjor randomly sampled 60 apartments advertised on social media and found that the mean monthly rent was Nu. 8,000. Assume a population standard deviation of Nu. 1,100.\n\n"
SAQ = [
 dict(marks=5, stem=PEN + "Construct a 95% confidence interval for the mean monthly rent and interpret it. (2.5 + 2.5 = 5 marks)",
      kp=[("Correct formula x̄ ± z(σ/√n) with z = 1.96; SE = 1,100/√60 = 142.0", 1), ("Margin of error = 1.96 × 142.0 ≈ Nu. 278.3; CI ≈ (Nu. 7,721.7, Nu. 8,278.3)", 1.5),
          ("Interpretation: we are 95% confident the true mean monthly rent of the apartments (advertised on social media) lies between about Nu. 7,722 and Nu. 8,278", 1.5),
          ("Meaning of 95%: if many such samples were taken, about 95% of the intervals built this way would contain the true mean (not a 95% probability for this one interval)", 1)],
      model="Given n = 60, x̄ = Nu. 8,000, σ = Nu. 1,100, 95% confidence so z = 1.96.\nStandard error = σ/√n = 1,100/√60 = 1,100/7.746 = 142.0.\nMargin of error = 1.96 × 142.0 = 278.3.\n95% CI = 8,000 ± 278.3 = (Nu. 7,721.7, Nu. 8,278.3).\nInterpretation: we are 95% confident that the true mean monthly rent of the apartments in this population lies between about Nu. 7,722 and Nu. 8,278. The 95% refers to the method: if we repeated the sampling many times and built an interval each time, about 95% of those intervals would contain the true population mean."),
 dict(marks=5, stem=PEN + "To what population of apartments can Penjor appropriately infer, and to what population should he not infer from the sample? (5 marks)",
      kp=[("Can infer: to the population that was sampled - apartments in Thimphu advertised on social media (at the time of sampling)", 2),
          ("Should not infer: to all apartments in Thimphu, e.g. those rented through agents, word of mouth or not advertised online", 1.5),
          ("Should not infer: to other towns/dzongkhags, or (without caution) to next year's rents; reason - the sample is random only from the social-media listings, so other groups may differ (coverage/selection bias)", 1.5)],
      model="Inference is valid only for the population from which the random sample was drawn - the sampling frame. Penjor sampled apartments advertised on social media in Thimphu, so he can appropriately infer about the mean monthly rent of apartments in Thimphu that are advertised on social media (around the time of his sample).\nHe should not infer about all apartments in Thimphu, because many are rented through agents, notice boards, relatives or word of mouth and never appear on social media; these may be cheaper or dearer, so his sample does not cover them (coverage bias). He should also not generalise to other towns or dzongkhags, and should be careful applying the result to next year, because rents change over time."),
 dict(marks=5, stem=PEN + "How large a sample of apartments would be needed to estimate the population mean within plus or minus Nu. 200 with a 95% confidence level? (5 marks)",
      kp=[("Formula n = (z σ / E)²", 1.5), ("Substitution: z = 1.96, σ = 1,100, E = 200 → (1.96 × 1,100/200)² = (10.78)²", 1.5),
          ("= 116.2", 1), ("Round up: n = 117 apartments", 1)],
      model="Required sample size for estimating a mean with margin of error E:\nn = (z × σ / E)²\nHere z = 1.96 (95%), σ = 1,100 and E = 200.\nn = (1.96 × 1,100 / 200)² = (2,156/200)² = (10.78)² = 116.2.\nSample sizes are always rounded up, so Penjor needs at least 117 apartments."),
 dict(marks=5, stem="Identify the population of interest, the inferential objective and the variable type in the statement given below:\nAn economist wants to estimate the monthly average household consumption of those dwelling in Thimphu Thromde. (5 marks)",
      kp=[("Population of interest: all households dwelling in Thimphu Thromde", 1.5), ("Inferential objective: to estimate the population mean (average) monthly household consumption in Thimphu Thromde from a sample", 2),
          ("Variable: monthly household consumption (expenditure) - quantitative, continuous (ratio scale)", 1.5)],
      model="Population of interest: all the households living in Thimphu Thromde (the unit is the household).\nInferential objective: to estimate a parameter - the mean (average) monthly consumption per household in Thimphu Thromde - using data from a sample of households, ideally with a confidence interval.\nVariable and type: the variable is monthly household consumption (spending, in Nu.). It is a quantitative variable, continuous, measured on a ratio scale (it has a true zero and amounts can be compared as ratios)."),
 dict(marks=5, stem="What are some ways for a country to effectively utilize administrative data in statistics production? (5 marks)",
      kp=[("Legal and institutional framework: a statistics act / data-sharing agreements (MoUs) giving the NSO access to administrative records, with confidentiality protected", 1),
          ("Common standards: unique identifiers (e.g. CID), standard classifications, definitions and codes across agencies so records can be linked", 1),
          ("Improve data quality: coverage, timeliness, accuracy checks, validation and documentation (metadata) at source", 1),
          ("Integrate and link with surveys and censuses: use admin data as sampling frames, to replace or shorten survey questions, for small-area estimates and to cut cost and respondent burden", 1),
          ("Build capacity and systems: digital registers/IT systems, trained staff, regular coordination between NSO and line ministries, and regular release of statistics from admin sources", 1)],
      model="Administrative data are records collected by agencies while delivering services (civil registration, school enrolment, health records, tax, trade). A country can use them well by:\n1. Legal and institutional arrangements - a statistics law and data-sharing MoUs that give the National Statistics Bureau access while protecting confidentiality.\n2. Standardisation - common definitions, classifications and unique identifiers (such as the citizenship ID) so that records from different agencies can be linked.\n3. Quality improvement - checking coverage, completeness, timeliness and accuracy at source, with good metadata.\n4. Integration with surveys and censuses - using registers as sampling frames, replacing some survey questions, producing small-area and more frequent statistics at lower cost and with less respondent burden.\n5. Capacity and systems - digitised registers, trained staff and regular coordination between the statistics office and line ministries, with regular publication of statistics derived from administrative sources."),
 dict(real=False, marks=5, stem="A utility company claims that the mean monthly electricity bill of households in Paro is Nu. 1,200. A random sample of 49 households gave a mean bill of Nu. 1,260. The population standard deviation is Nu. 210. Test at the 5% level of significance whether the mean bill differs from Nu. 1,200. (5 marks)",
      kp=[("Hypotheses: H₀: μ = 1,200; H₁: μ ≠ 1,200 (two-tailed)", 1), ("Test statistic z = (x̄ − μ₀)/(σ/√n) = (1,260 − 1,200)/(210/7) = 60/30 = 2.0", 1.5),
          ("Critical value ±1.96 at 5% (or p-value = 2 × (1 − 0.97725) ≈ 0.046)", 1), ("Decision: |z| = 2.0 > 1.96 (p < 0.05), reject H₀; conclusion in context - the mean bill differs from Nu. 1,200", 1.5)],
      model="H₀: μ = 1,200 and H₁: μ ≠ 1,200 (two-tailed test), α = 0.05.\nσ is known and n = 49, so use the z test:\nz = (x̄ − μ₀)/(σ/√n) = (1,260 − 1,200)/(210/√49) = 60/30 = 2.0.\nCritical values at 5% (two-tailed) are ±1.96. Since 2.0 > 1.96 we reject H₀. (p-value = 2 × (1 − 0.97725) = 0.0455 < 0.05.)\nConclusion: at the 5% level there is sufficient evidence that the mean monthly electricity bill in Paro differs from Nu. 1,200; the sample suggests it is higher."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
