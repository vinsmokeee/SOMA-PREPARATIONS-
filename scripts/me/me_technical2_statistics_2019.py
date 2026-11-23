"""ME Technical Paper II (General Subject Knowledge), STATISTICS group, BCSE 2019 - real paper. PDF sent by the founder.
Follows the latest (BCSE 2025) layout: Part I 70 MCQ x 1; Part II short answers at 5 marks each (mocks draw 6 x 5 = 30).
The 2019 Part II had 10 short answers x 3 marks; each is set to 5 marks (parts split in proportion), same as ICT 2019-2020.
Charts cropped from the paper (public/papers/me/tech2-stat-2019-*.png).
Repeats of BCSE 2020 questions (recorded as appearances, not loaded again): MCQ 7, 8, 16, 20, 27, 28, 31, 45, 46, 48, 59, 60.
Left out (more than one defensible answer or unclear): MCQ 12 (SD, variance and CV are all measures of dispersion),
14 (histogram or bar chart), 21 (all four means use every observation), 40 (beta vs type II error), 42 (garbled stem),
44 (stratified vs simple random is not a fixed order). Eighteen new MCQs keep Part I at 70.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Statistics): BCSE 2019, batch 1"
GROUP_TAG = "stat2019"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "statistics"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2019 Main Examination, Technical Paper II, Statistics", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 6, "marks_each": 5, "answer_any": None},
]
TOPIC = "Statistics: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following is NOT the subject of matter in statistics?",
"opts": [
"Appointment",
"Presentation of data",
"Analysis of data",
"Interpretation of data"
]
},
{
"n": 2,
"stem": "The statistical data in the original form before any statistical techniques are applied to refine, process or summarize is called",
"opts": [
"Secondary data.",
"Primary data.",
"Statistical information.",
"Data in general."
]
},
{
"n": 3,
"stem": "What statistics can we obtain by adding all numbers in a distribution and then total is divided by number of scores in that distribution?",
"opts": [
"Geometric mean",
"Arithmetic mean",
"Standard deviation",
"Variance"
]
},
{
"n": 4,
"stem": "The most frequently occurring score in a data set is",
"opts": [
"Mean",
"Median",
"Mode",
"Midpoint"
]
},
{
"n": 5,
"stem": "The median is always",
"opts": [
"the most frequently occurring score in a data set.",
"the middle score when results are ranked in order of magnitude.",
"the same as the mean.",
"the difference between the maximum and minimum scores."
]
},
{
"n": 6,
"stem": "The half of the observations in a data set are greater than the",
"opts": [
"Mean",
"Median",
"Mode",
"Standard deviation"
]
},
{
"n": 7,
"stem": "The mean, median and mode of the following set of five observations (4, 4, 5, 7, 10) are",
"opts": [
"Mean=6, median=5 and mode=4",
"Mean=6, median=4 and mode=5",
"Mean=6, median=5 and mode=7",
"Mean=6, median=4 and mode=4"
]
},
{
"n": 8,
"stem": "The mean, median and mode are part of",
"opts": [
"Measures of central tendency.",
"Measures of dispersion.",
"Logarithms.",
"Proportions."
]
},
{
"n": 9,
"stem": "The sum of deviations of values from their mean is always equal to",
"opts": [
"1",
"0",
"2",
"3"
]
},
{
"n": 10,
"stem": "Which of the following is the measure of the variation?",
"opts": [
"Mode",
"Mean",
"Hypothesis",
"Dispersion"
]
},
{
"n": 11,
"stem": "Summary statistics for two distributions A and B are: A - mean = 8 and variance = 22.8; B - mean = 8 and variance = 17.2. Which distribution has the larger spread of observations?",
"opts": [
"Distribution A.",
"Distribution B.",
"Neither; they have same spread.",
"There is not enough information to answer the question."
]
},
{
"n": 12,
"stem": "Which one of the following is a measure of dispersion?",
"opts": [
"Standard deviation",
"Variance",
"Co-efficient of variation",
"None of the above."
]
},
{
"n": 13,
"stem": "The mean of a distribution is 14 and the standard deviation is 5. What is the coefficient of variation?",
"opts": [
"60.4%",
"48.3%",
"35.7%",
"27.8%"
]
},
{
"n": 14,
"stem": "Suppose, the RCSC wants to know the number of students who appeared for the BCSE Main Exam. What kind of graph would be appropriate to present the frequency distributions of these data?",
"opts": [
"Histogram",
"Scatterplot",
"Bar chart",
"Box plot"
]
},
{
"n": 15,
"stem": "Normally distributed data are usually referred to as",
"opts": [
"Asymmetrical",
"Skewed",
"Bell-shaped",
"Peaked"
]
},
{
"n": 16,
"stem": "Which of the following would indicate that a dataset is NOT bell-shaped?",
"opts": [
"The range is equal to 5 standard deviation.",
"The range is larger than the interquartile range.",
"The mean is much smaller than the median.",
"There are no outliers."
]
},
{
"n": 17,
"stem": "The histogram shows the distribution of the weights (kg) of students in Bhutan; the percent is given on the vertical axis. What is the approximate shape of the distribution?",
"opts": [
"Nearly symmetric.",
"Skewed to the left.",
"Skewed to the right.",
"Bimodal (has more than one peak)."
],
"image": "/papers/me/tech2-stat-2019-histogram.png"
},
{
"n": 18,
"stem": "The histogram shows the distribution of the weights (kg) of students in Bhutan; the percent is given on the vertical axis. The median of the distribution is approximately",
"opts": [
"50 kg",
"60 kg",
"70 kg",
"80 kg"
],
"image": "/papers/me/tech2-stat-2019-histogram.png"
},
{
"n": 19,
"stem": "A bar chart constructed in which area of each bar is proportional to number of items in each group is known as",
"opts": [
"Pie chart",
"Histogram",
"Frequency distribution",
"Polygon"
]
},
{
"n": 20,
"stem": "The following is a diagram of a histogram. Which of the following is true about the above histogram?",
"opts": [
"The above histogram is unimodal.",
"The above histogram is bimodal.",
"The above is not a histogram.",
"None of the above."
]
},
{
"n": 21,
"stem": "Which of the following is not based on all the observations?",
"opts": [
"Arithmetic mean",
"Geometric mean",
"Harmonic mean",
"Weighted mean"
]
},
{
"n": 22,
"stem": "A researcher studies the factors that determine the number of children by married couples in future. The variable ‘number of children’ is a",
"opts": [
"Discrete variable",
"Continuous variable",
"Categorical variable",
"Ordinal variable"
]
},
{
"n": 23,
"stem": "A researcher asks respondents, ‘Do you believe the Government should introduce consumption tax? Yes No ’. The data produced is an example of:",
"opts": [
"Quantitative data",
"Time series data",
"Nominal data",
"Ordinal data"
]
},
{
"n": 24,
"stem": "Your height and weight are examples of which level of measurement?",
"opts": [
"Nominal",
"Ordinal",
"Discrete",
"Continuous"
]
},
{
"n": 25,
"stem": "Three points that divides the distribution into 4 equal groups are called",
"opts": [
"Deciles",
"Percentiles",
"Quartiles",
"None of the above."
]
},
{
"n": 26,
"stem": "The value of the [(n + 1)/4]th item is the formula for the",
"opts": [
"1st quartile",
"2nd quartile",
"Mode",
"3rd quartile"
]
},
{
"n": 27,
"stem": "The 1st quartile is also known as",
"opts": [
"Lower quartile",
"Median",
"Upper quartile",
"Geometric mean"
]
},
{
"n": 28,
"stem": "The 2nd quartile is also known as",
"opts": [
"Mode",
"Harmonic mean",
"Arithmetic mean",
"Median"
]
},
{
"n": 29,
"stem": "The nth root of the product of the values x₁, x₂, x₃, …, xₙ is called the",
"opts": [
"Arithmetic mean",
"Geometric mean",
"Variance",
"Harmonic mean"
]
},
{
"n": 30,
"stem": "In a week, the prices of a kilogram of rice from different stores are Nu.350, 280, 340, 290, 320, 310, 300. The range is",
"opts": [
"60",
"70",
"80",
"100"
]
},
{
"n": 31,
"stem": "Which one of these statistics is unaffected by outliers?",
"opts": [
"Mean",
"Interquartile range",
"Standard deviation",
"Range"
]
},
{
"n": 32,
"stem": "The square of standard deviation is called",
"opts": [
"Harmonic mean",
"Variance",
"Mode",
"2nd quartile"
]
},
{
"n": 33,
"stem": "The table which shows frequency of each score is called",
"opts": [
"Polygon",
"Pie chart",
"Histogram",
"Frequency distribution table"
]
},
{
"n": 34,
"stem": "In statistics, a population consists of",
"opts": [
"all people living in a country.",
"all people living in the area under the study.",
"all subjects or objects whose characteristics are being studied.",
"None of the above."
]
},
{
"n": 35,
"stem": "A summary measure calculated from population is called",
"opts": [
"a Sample",
"a Statistic",
"a Census",
"a Parameter"
]
},
{
"n": 36,
"stem": "A statistic is",
"opts": [
"a sample characteristic.",
"a population characteristic.",
"unknown.",
"normal normally distributed."
]
},
{
"n": 37,
"stem": "A parameter is",
"opts": [
"a sample characteristic.",
"a population characteristic.",
"unknown.",
"normal normally distributed."
]
},
{
"n": 38,
"stem": "Observational studies allow",
"opts": [
"Population inference.",
"Causal inference.",
"Both types of inference.",
"Neither type of inference."
]
},
{
"n": 39,
"stem": "What is the definition of the standard error?",
"opts": [
"Standard deviation of the sample.",
"Squared standard deviation.",
"Standard deviation of the sample mean.",
"Standard deviation of the population mean."
]
},
{
"n": 40,
"stem": "Failing to reject the null hypothesis when it is false is",
"opts": [
"Alpha",
"type I error",
"Beta",
"type II error"
]
},
{
"n": 41,
"stem": "Which one of the following is correct?",
"opts": [
"The probability of a type II error is (1-).",
"The probability of a type II error is .",
"The probability of a type I error is (1-).",
"None of the above."
]
},
{
"n": 42,
"stem": "A researcher selects a probability of 100 out of the total population. The process is called",
"opts": [
"a cluster sample",
"a systematic sample",
"a random sample",
"a stratified sample"
]
},
{
"n": 43,
"stem": "When asked questions concerning personal income, people normally tend to lie. This is an example of",
"opts": [
"sampling bias",
"confounding",
"non-response bias",
"response bias"
]
},
{
"n": 44,
"stem": "Select the order of sampling schemes from best to worst:",
"opts": [
"Simple random, stratified, convenience.",
"Simple random, convenience, stratified.",
"Stratified, simple random, convenience.",
"Stratified, convenience, simple random."
]
},
{
"n": 45,
"stem": "The graph of variables having linear relationship will be",
"opts": [
"curved",
"hyperbola",
"straight line",
"None of the above."
]
},
{
"n": 46,
"stem": "The coefficient of correlation will be always",
"opts": [
"more than 0",
"more than -1",
"less than -1",
"between -1 and +1."
]
},
{
"n": 47,
"stem": "When the correlation coefficient, r, is close to one:",
"opts": [
"There is no relationship between the two variables.",
"There is a strong linear relationship between the two variables.",
"It is impossible to tell if there is a relationship between the two variables.",
"The slope of the regression line will be close to one."
]
},
{
"n": 48,
"stem": "Suppose there is a correlation of r=0.9 between the number of hours per day a student study and GPA score. Which of the following is a reasonable conclusion?",
"opts": [
"90% of students who study receive high grades",
"90 of students who receive high grades study a lot.",
"90% of the variation in GPA scores can be explained by variation in number of study hours.",
"81% of the variation in GPA scores can be explained by variation in number of study hours per day."
]
},
{
"n": 49,
"stem": "What is the effect of an outlier on the value of a correlation coefficient?",
"opts": [
"An outlier will always decrease a correlation coefficient.",
"An outlier will always increase a correlation coefficient.",
"An outlier might either decrease or increase a correlation coefficient, depending on where it is in relation to the other points.",
"An outlier will have no effect on a correlation coefficient."
]
},
{
"n": 50,
"stem": "What does ANOVA stand for?",
"opts": [
"Analysis of values and averages.",
"Analysis of variability.",
"Analysis of non-ordinal values.",
"Analysis of variance."
]
},
{
"n": 51,
"stem": "IQ tests are standardized so that the mean score is 100 for the entire group of people who take the test. However, if you select a group of 50 who took the test, you probably would not get 100. What statistical concept explains the difference between the two means?",
"opts": [
"Statistical error",
"Inferential error",
"Residual error",
"Sampling error"
]
},
{
"n": 52,
"stem": "Sampling error can be reduced by",
"opts": [
"non-probability sampling.",
"increasing the population size.",
"decreasing the sample size.",
"increasing the sample size."
]
},
{
"n": 53,
"stem": "Which statistical test is used to identify whether there is a relationship between two categorial variables?",
"opts": [
"Student’s t-test.",
"Spearman’s correlation test.",
"Pearson’s chi-square test.",
"Mann-Whitney test."
]
},
{
"n": 54,
"stem": "A scatterplot shows:",
"opts": [
"The frequency with which values appear in the data.",
"The average value of groups of data.",
"Scores on one variable plotted against scores on a second variable.",
"The proportion of data falling into different categories."
]
},
{
"n": 55,
"stem": "The scatter plot shows the heights and weights of ten students, with a fitted line. The data in the scatter plot would have a correlation close to",
"opts": [
"-1.0",
"-0.5",
"+1.0",
"+0.5"
],
"image": "/papers/me/tech2-stat-2019-scatter.png"
},
{
"n": 56,
"stem": "A Pearson correlation of r=-0.6 indicates",
"opts": [
"an increase in X is accompanied by an increase in Y; the relationship is strong.",
"an increase in X is accompanied by an increase in Y; the relationship is moderate.",
"an increase in X is accompanied by a decrease in Y; the relationship is strong.",
"an increase in X is accompanied by a decrease in Y; the relationship is moderate."
]
},
{
"n": 57,
"stem": "r² is the notation for",
"opts": [
"the coefficient of correlation.",
"the coefficient of determination.",
"the coefficient of variation.",
"the coefficient of regression."
]
},
{
"n": 58,
"stem": "Suppose the correlation between the height and weight for adults is +0.80. What proportion of the variability in weight can be explained by the relationship with height?",
"opts": [
"20%",
"36%",
"64%",
"80%"
]
},
{
"n": 59,
"stem": "If a relationship between height and weight of a student is statistically significant, it means that the variables are",
"opts": [
"related in the sample due to chance alone.",
"not related in the population represented by the sample.",
"related in the population represented by the sample.",
"very important."
]
},
{
"n": 60,
"stem": "Simpson’s Paradox occurs when",
"opts": [
"no baseline risk is given, so it is not known whether or not a high relative risk has practical importance.",
"a confounding variable rather than the explanatory variable is responsible for a change in the response variable.",
"the direction of the relationship between two variables changes when the categories of a confounding variable are considered.",
"the results of a test are statistically significant but are really due to chance."
]
},
{
"n": 61,
"stem": "If three letters are to be put in three addressed envelopes randomly, the probability that none of the letters are in the correct envelope is",
"opts": [
"0",
"1/6",
"1/3",
"1/2"
]
},
{
"n": 62,
"stem": "For which of the following distributions, mean and variance are equal?",
"opts": [
"Normal distribution",
"Poisson distribution",
"Binomial distribution",
"Negative Binomial distribution"
]
},
{
"n": 63,
"stem": "The diagram shows three distributions (A), (B) and (C) with the positions of their mean, median and mode. Which diagram shows a positively skewed distribution?",
"opts": [
"Diagram A",
"Diagram B",
"Diagram C",
"None of the above."
],
"image": "/papers/me/tech2-stat-2019-skewness.png"
},
{
"n": 64,
"stem": "A coin is tossed five times in succession. What is the probability of getting at least four heads?",
"opts": [
"1/4",
"3/4",
"1/16",
"3/16"
]
},
{
"n": 65,
"stem": "According to the empirical rule, the bell or mound shaped distribution will have approximately 68% of the data within what number of standard deviations of the mean?",
"opts": [
"one standard deviation.",
"two standard deviations.",
"three standard deviations.",
"four standard deviations."
]
},
{
"n": 66,
"stem": "If a population A has a larger standard deviation than population B, which of the following is NOT true?",
"opts": [
"Population B has a smaller variance than population A.",
"The mean of a sample of 20 from population A has a larger standard deviation than the mean of a sample of 20 from population B.",
"A typical observation form population A will be farther from the mean of population A than a typical observation from B will be from the mean of population B.",
"The mean of a sample from population A will be on average be larger than the mean of a sample from population B."
]
},
{
"n": 67,
"stem": "A researcher is studying students of Bhutan. She takes a sample of 150 students from 10 schools. The average age of all students in Bhutan is",
"opts": [
"a statistic",
"a parameter",
"the median",
"a population"
]
},
{
"n": 68,
"stem": "We can measure the cause and effect relationship by the help of",
"opts": [
"Time series analysis",
"Regression analysis",
"Cross-sectional analysis",
"Correlation analysis"
]
},
{
"n": 69,
"stem": "The goodness of fit of a distribution is tested by",
"opts": [
"t-test.",
"chi-square test.",
"f-test.",
"None of the above."
]
},
{
"n": 70,
"stem": "F-test is used to test the significance of the difference between/among",
"opts": [
"Two sample means",
"More than two sample means",
"Variances of two samples",
"Both (b) and (c)"
]
}
]"""

KEY = {
 1: ("a", "Statistics deals with the collection, presentation, analysis and interpretation of data; 'appointment' is not part of its subject matter."),
 2: ("b", "Data in their original form, collected first-hand before any processing, are primary (raw) data."),
 3: ("b", "Adding all the values and dividing by the number of values gives the arithmetic mean."),
 4: ("c", "The most frequently occurring value is the mode."),
 5: ("b", "The median is the middle value when the data are ranked in order of magnitude."),
 6: ("b", "Half of the observations lie above the median (and half below)."),
 9: ("b", "Σ(x − x̄) = Σx − n·x̄ = 0, always."),
 10: ("d", "Dispersion is the measure of variation (spread); mode and mean are measures of central tendency."),
 11: ("a", "With equal means, the larger variance (22.8) means the larger spread: distribution A."),
 13: ("c", "CV = SD/mean × 100 = 5/14 × 100 = 35.7%."),
 15: ("c", "The normal distribution is the symmetric bell-shaped curve."),
 17: ("a", "The bars rise to a single peak near 55-60 kg and fall away fairly evenly on both sides, close to the fitted normal curve - nearly symmetric."),
 18: ("a", "Adding the bar percents from the left (4 + 6 + 11 + 16 = 37%) the 50% point falls in the next bar, at about 50 kg."),
 19: ("b", "In a histogram the area of each bar is proportional to the frequency of its class."),
 22: ("a", "The number of children can only be a whole number (0, 1, 2, ...), so it is a discrete variable."),
 23: ("c", "Yes/No answers are categories with no order - nominal data."),
 24: ("d", "Height and weight can take any value within a range - continuous measurements (on a ratio scale)."),
 25: ("c", "The three quartiles Q1, Q2 and Q3 divide a distribution into four equal parts."),
 26: ("a", "Q1 is the [(n + 1)/4]th item; Q2 is the [(n + 1)/2]th and Q3 the [3(n + 1)/4]th."),
 29: ("b", "The nth root of the product of n values is the geometric mean."),
 30: ("b", "Range = 350 − 280 = Nu. 70."),
 32: ("b", "The square of the standard deviation is the variance."),
 33: ("d", "A table showing the frequency of each score (or class) is a frequency distribution table."),
 34: ("c", "A population is all the subjects or objects whose characteristics are being studied - not necessarily people."),
 35: ("d", "A summary measure calculated from a whole population is a parameter (from a sample, a statistic)."),
 36: ("a", "A statistic describes a sample."),
 37: ("b", "A parameter describes a population."),
 38: ("a", "Observational studies (with random samples) allow inference to the population, but not cause-and-effect conclusions - that needs a randomised experiment."),
 39: ("c", "The standard error is the standard deviation of the sampling distribution of the sample mean (σ/√n)."),
 41: ("d", "P(Type II error) = β and P(Type I error) = α, so options (a)-(c) are all wrong."),
 43: ("d", "Untruthful answers from people who do respond are response bias; non-response bias comes from people not responding."),
 47: ("b", "r close to 1 means a strong (positive) linear relationship. It says nothing about the slope's size."),
 49: ("c", "An outlier can raise or lower r depending on whether it lies along or away from the pattern of the other points."),
 50: ("d", "ANOVA stands for Analysis of Variance."),
 51: ("d", "A sample mean differs from the population mean because of sampling error - the natural variation from sample to sample."),
 52: ("d", "Sampling error falls as the sample size increases (SE = σ/√n)."),
 53: ("c", "Pearson's chi-square test of independence tests for a relationship between two categorical variables."),
 54: ("c", "A scatterplot plots scores on one variable against scores on a second variable."),
 55: ("c", "The points lie close to a rising straight line - a strong positive correlation close to +1."),
 56: ("d", "The negative sign means Y decreases as X increases; |r| = 0.6 is a moderate relationship."),
 57: ("b", "r² is the coefficient of determination - the proportion of variation in Y explained by X."),
 58: ("c", "r² = 0.80² = 0.64, so 64% of the variability in weight is explained by height."),
 61: ("c", "There are 3! = 6 arrangements; only 2 put no letter in its own envelope (the derangements BCA and CAB), so P = 2/6 = 1/3."),
 62: ("b", "In a Poisson distribution the mean and variance are both equal to λ."),
 63: ("c", "In (C) the long tail is on the right and mean > median > mode - positive (right) skew. (A) is negatively skewed and (B) symmetric."),
 64: ("d", "P(4 or 5 heads) = [C(5,4) + C(5,5)]/2⁵ = (5 + 1)/32 = 6/32 = 3/16."),
 65: ("a", "Empirical rule: about 68% within 1 SD, 95% within 2 SD and 99.7% within 3 SD."),
 66: ("d", "A larger SD does not mean a larger mean - spread and centre are separate, so (d) is not true. (a)-(c) follow from the larger SD."),
 67: ("b", "The average age of ALL students in Bhutan describes the population, so it is a parameter."),
 68: ("b", "Regression analysis models how a dependent variable changes with an explanatory variable; correlation only measures association."),
 69: ("b", "Goodness of fit of a distribution is tested with the chi-square test."),
 70: ("d", "The F-test compares more than two means (ANOVA) and also the variances of two samples. ('Variable of two sample' in the paper means the variances.)"),
}

NEW_MCQ = [
    ("The median of 12, 5, 9, 15, 7, 10 is", ["9", "9.5", "10", "9.67"], "b", "Ordered: 5, 7, 9, 10, 12, 15. With 6 values the median is (9 + 10)/2 = 9.5."),
    ("A sample of 100 has mean 50 and the population standard deviation is 10. The 95% confidence interval for μ (z = 1.96) is", ["(48.04, 51.96)", "(30.4, 69.6)", "(49.02, 50.98)", "(46.08, 53.92)"], "a",
     "SE = 10/√100 = 1; 50 ± 1.96 × 1 = (48.04, 51.96)."),
    ("A and B are mutually exclusive events with P(A) = 0.3 and P(B) = 0.45. What is P(A ∪ B)?", ["0.135", "0.75", "0.615", "0.45"], "b",
     "Mutually exclusive events cannot occur together, so P(A ∪ B) = P(A) + P(B) = 0.75."),
    ("If every value in a data set is increased by 10, the mean", ["Is unchanged", "Increases by 10", "Is multiplied by 10", "Increases by 100"], "b",
     "Adding a constant to every value adds the same constant to the mean (the SD does not change)."),
    ("Which of the following is a probability (random) sampling method?", ["Quota sampling", "Convenience sampling", "Snowball sampling", "Systematic sampling"], "d",
     "Systematic sampling (every k-th unit after a random start) gives each unit a known chance of selection; quota, convenience and snowball sampling are non-probability methods."),
    ("A random variable X has E(X) = 5 and E(X²) = 29. The standard deviation of X is", ["4", "2", "24", "5.39"], "b", "Var(X) = E(X²) − [E(X)]² = 29 − 25 = 4, so SD = 2."),
    ("In how many ways can a committee of 3 be chosen from 7 people?", ["210", "343", "35", "21"], "c", "Order does not matter: C(7, 3) = 7!/(3! × 4!) = 35."),
    ("The class mark (mid-value) of the class 20-30 is", ["20", "25", "30", "10"], "b", "Class mark = (lower limit + upper limit)/2 = (20 + 30)/2 = 25."),
    ("The probability of success in each trial is 0.2. The expected number of successes in 50 independent trials is", ["10", "8", "2.5", "40"], "a", "For a binomial distribution E(X) = np = 50 × 0.2 = 10."),
    ("The standard deviation of the values 5, 5, 5, 5, 5 is", ["5", "1", "0", "25"], "c", "All values equal the mean, so every deviation is 0 and the SD is 0."),
    ("An ogive is the graph of", ["Frequencies", "Cumulative frequencies", "Relative frequencies", "Class marks"], "b",
     "An ogive plots cumulative frequency against the class boundaries; it is used to read medians and quartiles."),
    ("A z-score of −2 means that the observation is", ["2 units below the mean", "2% below the mean", "Twice the mean", "2 standard deviations below the mean"], "d",
     "z = (x − μ)/σ counts standard deviations from the mean; −2 means 2 SDs below the mean."),
    ("The correlation coefficient between X and Y is −0.8. The coefficient of determination is", ["−0.64", "0.64", "0.8", "0.16"], "b",
     "r² = (−0.8)² = 0.64: 64% of the variation in Y is explained by X. It is never negative."),
    ("In a hypothesis test the p-value is 0.03 and the level of significance is 0.05. The decision is to", ["Reject H₀", "Accept H₁ without a test", "Not reject H₀", "Increase the sample size"], "a",
     "The p-value (0.03) is less than α (0.05), so H₀ is rejected at the 5% level."),
    ("Which graph is most suitable for showing the parts of a whole as percentages?", ["Pie chart", "Histogram", "Ogive", "Scatter plot"], "a",
     "A pie chart divides a circle into sectors proportional to each part's share of the whole."),
    ("The odds in favour of an event are 3 : 2. The probability of the event is", ["3/2", "2/5", "3/5", "2/3"], "c", "Odds a : b in favour give P = a/(a + b) = 3/(3 + 2) = 3/5."),
    ("A binomial distribution has mean 8 and variance 6. The value of p is", ["0.75", "0.25", "0.5", "0.2"], "b",
     "np = 8 and npq = 6, so q = 6/8 = 0.75 and p = 1 − 0.75 = 0.25 (n = 32)."),
    ("Which of the following is a continuous variable?", ["Number of students in a class", "Number of cars sold", "Time taken to finish a race", "Number of goals scored"], "c",
     "Time can take any value within a range (e.g. 12.37 s); the others are counts, so they are discrete."),
]

SAQ = [
 dict(marks=5, stem="Find the arithmetic means of the following distributions.\na) Distribution A: x = 1, 2, 3, 4, 5, 6, 7 with frequencies f = 5, 9, 12, 17, 14, 10, 6. (2.5 marks)\nb) Distribution B: Marks 0-10, 10-20, 20-30, 30-40, 40-50, 50-60 with numbers of students 12, 18, 27, 20, 17, 6. (2.5 marks)",
      kp=[("a) Σf = 73 and Σfx = 299", 1.5), ("a) Mean = 299/73 = 4.10", 1), ("b) Class mid-points 5, 15, 25, 35, 45, 55; Σf = 100, Σfm = 2,800", 1.5), ("b) Mean = 2,800/100 = 28 marks", 1)],
      model="a) Mean = Σfx/Σf. Σf = 5 + 9 + 12 + 17 + 14 + 10 + 6 = 73. Σfx = 5 + 18 + 36 + 68 + 70 + 60 + 42 = 299. Mean = 299/73 = 4.10.\nb) For grouped data use the class mid-points m = 5, 15, 25, 35, 45, 55. Σf = 12 + 18 + 27 + 20 + 17 + 6 = 100. Σfm = 60 + 270 + 675 + 700 + 765 + 330 = 2,800. Mean = 2,800/100 = 28 marks."),
 dict(marks=5, stem="Consider the following sample data set: 8, 2, 6, x, 5. You are told that the sample mean is 6. Find:\na) The value of x. (2 marks)\nb) The sample variance. (3 marks)",
      kp=[("a) Σx = 5 × 6 = 30, so 21 + x = 30", 1), ("a) x = 9", 1), ("b) Deviations from 6: 2, −4, 0, 3, −1; squares sum to 4 + 16 + 0 + 9 + 1 = 30", 2), ("b) s² = 30/(5 − 1) = 7.5", 1)],
      model="a) Sample mean = Σx/n, so Σx = 6 × 5 = 30. 8 + 2 + 6 + 5 = 21, so x = 30 − 21 = 9.\nb) Data: 8, 2, 6, 9, 5 with x̄ = 6. Squared deviations: (8 − 6)² = 4, (2 − 6)² = 16, (6 − 6)² = 0, (9 − 6)² = 9, (5 − 6)² = 1; total = 30. Sample variance s² = 30/(n − 1) = 30/4 = 7.5."),
 dict(marks=5, stem="The average salary of male employees in a firm is Nu 5,200 and that of female employees is Nu 4,200. The mean salary of all the employees is Nu 5,000. Find the percentage of male and female employees. (5 marks)",
      kp=[("Let p = proportion of males: combined mean 5,200p + 4,200(1 − p) = 5,000", 2), ("1,000p = 800, so p = 0.8", 1.5), ("Males 80%, females 20%", 1.5)],
      model="Let the proportion of male employees be p, so females are (1 − p).\nCombined mean: 5,200p + 4,200(1 − p) = 5,000 → 4,200 + 1,000p = 5,000 → p = 0.8.\nSo 80% of the employees are male and 20% are female. (Check: 0.8 × 5,200 + 0.2 × 4,200 = 4,160 + 840 = 5,000.)"),
 dict(marks=5, stem="In a factory employing 3,000 persons, 5 percent earn less than Nu 3 per hour, 580 earn from Nu 3.01-4.50 per hour, 30 percent earn from Nu 4.51-6.00 per hour, 500 earn from Nu 6.01-7.50 per hour, 20 percent earn from Nu 7.51-9.00 per hour, and the rest earn Nu 9.01 or more per hour. What is the median wage? (5 marks)",
      kp=[("Frequencies: 150, 580, 900, 500, 600, 270 (total 3,000)", 1.5), ("N/2 = 1,500; cumulative 150, 730, 1,630 → median class 4.51-6.00", 1.5),
          ("Median = L + [(N/2 − cf)/f] × h = 4.505 + (1,500 − 730)/900 × 1.5", 1), ("Median ≈ Nu 5.79 per hour", 1)],
      model="Frequencies: below 3.00 → 5% of 3,000 = 150; 3.01-4.50 → 580; 4.51-6.00 → 30% = 900; 6.01-7.50 → 500; 7.51-9.00 → 20% = 600; 9.01 and above → 3,000 − 2,730 = 270.\nCumulative frequencies: 150, 730, 1,630, 2,130, 2,730, 3,000.\nN/2 = 1,500, which falls in the class 4.51-6.00 (cf before it = 730, f = 900).\nUsing the class boundary L = 4.505 and width h = 1.5:\nMedian = L + [(N/2 − cf)/f] × h = 4.505 + (770/900) × 1.5 = 4.505 + 1.283 = 5.79.\nThe median wage is about Nu 5.79 per hour."),
 dict(marks=5, stem="24 patients had a blood test and the results are:\nA, B, B, AB, AB, B, O, O, AB, O, B, A, AB, A, O, O, AB, B, O, A, AB, O, B, A\na) Construct a frequency distribution for the data and find the mode of the distribution. (2.5 marks)\nb) If a person is selected at random from the group of 24 patients, what is the probability that his/her blood type is not O? (Round your answer to 2 decimal places.) (2.5 marks)",
      kp=[("a) Frequencies: A = 5, B = 6, AB = 6, O = 7 (total 24)", 1.5), ("a) Mode = blood group O", 1), ("b) P(not O) = 1 − 7/24 = 17/24", 1.5), ("b) = 0.71", 1)],
      model="a) Frequency distribution:\nBlood type | Frequency\nA | 5\nB | 6\nAB | 6\nO | 7\nTotal | 24\nThe mode is blood type O (the most frequent, 7 patients).\nb) P(not O) = 1 − P(O) = 1 − 7/24 = 17/24 = 0.71."),
 dict(marks=5, image="/papers/me/tech2-stat-2019-mileage.png", stem="The bar graph shows the efficiency level (km per litre of petrol) of 110 cars: (0-5) 15 cars, (5-10) 20, (15-20) 35, (20-25) 25, (25-30) 15. Using the diagram, answer:\na) How many cars have an efficiency between 15 and 20 per litre of petrol? (1.5 marks)\nb) How many cars have an efficiency of more than 20 per litre of petrol? (1.5 marks)\nc) What percentage of cars have an efficiency of less than 20 per litre of petrol? (2 marks)",
      issues=["The graph title says km per litre while the paper's questions say miles; the stem drops the unit word in the parts."],
      kp=[("a) 35 cars", 1.5), ("b) 25 + 15 = 40 cars", 1.5), ("c) 15 + 20 + 35 = 70 cars; 70/110 × 100", 1), ("c) ≈ 63.6%", 1)],
      model="a) The (15-20) bar shows 35 cars.\nb) More than 20: (20-25) 25 + (25-30) 15 = 40 cars.\nc) Less than 20: 15 + 20 + 35 = 70 cars out of 110, so 70/110 × 100 = 63.6% of the cars."),
 dict(marks=5, stem="Two coins are tossed simultaneously. Let X be the number of heads. Find:\na) The mean of X. (2.5 marks)\nb) The variance of X. (2.5 marks)",
      kp=[("a) Distribution: X = 0, 1, 2 with P = 1/4, 1/2, 1/4", 1), ("a) E(X) = 0 + 1/2 + 2/4 = 1", 1.5), ("b) E(X²) = 0 + 1/2 + 4/4 = 1.5", 1.5), ("b) Var(X) = 1.5 − 1² = 0.5", 1)],
      model="a) Sample space: HH, HT, TH, TT. X (number of heads) = 0, 1, 2 with probabilities 1/4, 2/4, 1/4.\nMean E(X) = Σx·P(x) = 0 × 1/4 + 1 × 1/2 + 2 × 1/4 = 1.\nb) E(X²) = 0 × 1/4 + 1 × 1/2 + 4 × 1/4 = 1.5. Var(X) = E(X²) − [E(X)]² = 1.5 − 1 = 0.5. (Check: binomial with n = 2, p = 0.5 gives np = 1 and npq = 0.5.)"),
 dict(marks=5, stem="The variable X takes the values 1, 2, 3 and 5 with P(X = x) = 0.1, 0.3, 0.4 and 0.2 respectively.\na) What is the probability that X is negative? (1.5 marks)\nb) Find E(X), the expected value of X. (2 marks)\nc) Find the probability that X² > 8. (1.5 marks)",
      kp=[("a) X takes no negative values, so P(X < 0) = 0", 1.5), ("b) E(X) = 1(0.1) + 2(0.3) + 3(0.4) + 5(0.2)", 1), ("b) = 0.1 + 0.6 + 1.2 + 1.0 = 2.9", 1),
          ("c) X² > 8 when X = 3 or 5: P = 0.4 + 0.2 = 0.6", 1.5)],
      model="a) All possible values (1, 2, 3, 5) are positive, so P(X < 0) = 0.\nb) E(X) = Σx·P(x) = 1(0.1) + 2(0.3) + 3(0.4) + 5(0.2) = 0.1 + 0.6 + 1.2 + 1.0 = 2.9.\nc) X² = 1, 4, 9, 25. X² > 8 when X = 3 or X = 5, so P(X² > 8) = 0.4 + 0.2 = 0.6."),
 dict(marks=5, image="/papers/me/tech2-stat-2019-height-weight.png", stem="A statistical officer in the National Statistics Bureau studied the relationship between the height (x) and the weight (y) of 10 employees:\nx: 63, 64, 66, 69, 69, 71, 71, 72, 73, 75\ny: 127, 121, 142, 157, 162, 156, 169, 165, 181, 208\nThe scatterplot of the data is shown. Find the simple correlation coefficient between heights and weights of the 10 employees. (5 marks)",
      kp=[("Means: x̄ = 69.3, ȳ = 158.8", 1), ("Σ(x − x̄)² = 138.1; Σ(y − ȳ)² = 5,799.6", 1.5), ("Σ(x − x̄)(y − ȳ) = 847.6", 1), ("r = 847.6/√(138.1 × 5,799.6) ≈ 0.947", 1.5)],
      model="r = Σ(x − x̄)(y − ȳ)/√[Σ(x − x̄)² Σ(y − ȳ)²].\nx̄ = 693/10 = 69.3; ȳ = 1,588/10 = 158.8.\nΣ(x − x̄)² = 138.1; Σ(y − ȳ)² = 5,799.6; Σ(x − x̄)(y − ȳ) = 847.6.\nr = 847.6/√(138.1 × 5,799.6) = 847.6/√800,924.8 = 847.6/894.9 ≈ 0.95."),
 dict(marks=5, image="/papers/me/tech2-stat-2019-height-weight.png", stem="A statistical officer in the National Statistics Bureau studied the relationship between the height (x) and the weight (y) of 10 employees:\nx: 63, 64, 66, 69, 69, 71, 71, 72, 73, 75\ny: 127, 121, 142, 157, 162, 156, 169, 165, 181, 208\nThe correlation coefficient between heights and weights is about 0.95. How do you interpret this result? (5 marks)",
      kp=[("Positive sign: taller employees tend to be heavier (weight increases with height)", 1.5), ("Size 0.95 is close to 1: a very strong linear relationship, as the scatterplot shows", 1.5),
          ("r² ≈ 0.90: about 90% of the variation in weight is associated with height", 1), ("Correlation does not prove causation; only 10 employees, so generalise with care", 1)],
      model="r ≈ 0.95 shows a very strong positive linear relationship between height and weight: taller employees tend to be heavier, and the points in the scatterplot lie close to a rising straight line. r² ≈ 0.90, so about 90% of the variation in weight among these employees is associated with variation in height. Correlation alone does not prove that height causes weight, and with only 10 employees the result should be generalised to all employees with caution."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
