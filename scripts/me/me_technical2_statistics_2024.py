"""ME Technical Paper II (General Subject Knowledge), STATISTICS group, BCSE 2024 - real paper. PDF sent by the founder.
Same layout as 2025 (Part I 70 MCQ x 1; Part II 6 questions x 5), so it is ADDED to the paper's existing pattern.
Part II in the paper: four 5-mark questions and a 10-mark true/false question with five statements; the true/false
question is split into two 5-mark questions (statements i-ii; iii-v) to keep the 2025 layout of 6 x 5.
Left out (more than one defensible answer or no correct option): MCQ 18, 32, 37 (trend vs irregular), 47, 50 (IQR,
range, SD and variance would all be low), 59 (scale change and shifting both leave r unchanged), 69 (correct answer
44 and 5 not offered), 70; eight new MCQs keep Part I at 70. MCQs 10, 38-39 and 54-55 show the paper's charts.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Statistics): BCSE 2024, batch 1"
GROUP_TAG = "stat2024"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "statistics"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper II, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 6, "marks_each": 5, "answer_any": None},
]
TOPIC = "Statistics: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "In a standard normal distribution, what is the mean and standard deviation?",
"opts": [
"Mean = 0, Standard Deviation = 1",
"Mean = 1, Standard Deviation = 0",
"Mean = 0, Standard Deviation = 0",
"Mean = 1, Standard Deviation = 1"
]
},
{
"n": 2,
"stem": "Which of the following is not a measure of dispersion?",
"opts": [
"Range",
"Mode",
"Standard deviation",
"Variance"
]
},
{
"n": 3,
"stem": "The probability of getting at least one tail if a coin is tossed two times is",
"opts": [
"½",
"¼",
"1",
"¾"
]
},
{
"n": 4,
"stem": "Which of the following is represented on the x-axis of a histogram?",
"opts": [
"Categories or ranges of data values",
"Frequency of data points",
"Mean values of data sets",
"Standard deviation of data points"
]
},
{
"n": 5,
"stem": "What is a characteristic of official statistics?",
"opts": [
"They are collected on an ad-hoc basis.",
"They are subject to rigorous quality control and standardization.",
"They are exclusively qualitative.",
"They are typically secret and not released to the public."
]
},
{
"n": 6,
"stem": "Which of the following is not a method for handling missing data?",
"opts": [
"Clustering",
"Deletion",
"Imputation",
"Substitution"
]
},
{
"n": 7,
"stem": "What is the main purpose of regression analysis?",
"opts": [
"To ascertain the distribution of variables",
"To determine causal relationship between variables",
"To determine the relationship between variables",
"To measure the central tendency"
]
},
{
"n": 8,
"stem": "Which of the following is not required when constructing a confidence interval for a population mean?",
"opts": [
"Sample mean",
"Population mean",
"Sample size",
"Standard error"
]
},
{
"n": 9,
"stem": "Which of the following is an example of administrative data?",
"opts": [
"Data from a market research survey",
"Responses to a public opinion poll",
"Results from a controlled experiment",
"Patient records from a hospital Use the density curve below to answer Question 10."
]
},
{
"n": 10,
"stem": "Use the density curve shown. What do you observe in the probability densities of 'Transformed 1' and 'Transformed 2' as compared to the original data?",
"opts": [
"The density curves are more flattened",
"The density curves have different mean",
"The density curves have different standard deviation",
"The density curves are more skewed"
],
"image": "/papers/me/tech2-stat-2024-density.png"
},
{
"n": 11,
"stem": "Which of the following represent the distribution of age of death from natural causes (heart disease, cancer, etc.)? Most such deaths happen at older ages, with fewer cases happening at younger ages.",
"opts": [
"Left-skewed distribution",
"Right-skewed distribution",
"Symmetrical distribution",
"Uniform distribution"
]
},
{
"n": 12,
"stem": "What does the term \"bias\" refer to in statistical analysis?",
"opts": [
"A systematic error introduced into sampling or testing.",
"The accuracy of the measurements.",
"The consistency of the measurements.",
"The variability of the data."
]
},
{
"n": 13,
"stem": "Which of the following best shows ‘data deprivation’ and its impact on public policy?",
"opts": [
"A country has good economic data but lacks details on specific industries, leading to ineffective sector-specific policies.",
"A city has demographic data but cannot share it between departments, causing inefficient service delivery and urban planning.",
"A region frequently hit by natural disasters lacks systematic data on their impacts, leading to poorly informed disaster response strategies.",
"A university has global health data but faces privacy concerns, limiting its ability to publish detailed studies."
]
},
{
"n": 14,
"stem": "Which of the following is a typical challenge in collecting official statistics?",
"opts": [
"High response rates",
"Data accuracy",
"Sufficient funding",
"Public awareness"
]
},
{
"n": 15,
"stem": "When reporting statistical results, it is ethical to",
"opts": [
"Adjust data points to fit the expected outcome",
"Hide the methodology used to prevent scrutiny",
"Only report results that support your hypothesis",
"Present all relevant findings, including those that contradict the hypothesis"
]
},
{
"n": 16,
"stem": "Which of the following examples would be most appropriately analysed using parametric test?",
"opts": [
"The heights of adult males in a specific country.",
"The number of daily visitors to a website.",
"The median household income in a city.",
"The ranks of students in a class."
]
},
{
"n": 17,
"stem": "In which scenario would a country’s real GDP be a better indicator of economic growth compared to nominal GDP?",
"opts": [
"When assessing changes in population size.",
"When comparing GDP between different countries.",
"When evaluating government fiscal policy.",
"When measuring the impact of inflation on economic growth."
]
},
{
"n": 18,
"stem": "A hospital system consolidates patient information from different departments, including radiology, pharmacy, and lab results, into a central repository. What data integration technique is most appropriate for ensuring that all patient records are correctly linked?",
"opts": [
"Data replication",
"Data warehousing",
"Data deduplication",
"Data federation"
]
},
{
"n": 19,
"stem": "In official statistics, what does the term \"data confidentiality\" mean?",
"opts": [
"Ensuring that individual responses cannot be traced back to respondents",
"Keeping the data hidden from the public",
"Publishing only aggregate data",
"Sharing all data with government agencies"
]
},
{
"n": 20,
"stem": "Which statement is not true about the sample mean?",
"opts": [
"A fixed quantity",
"A random quantity",
"An estimator of population mean",
"Has uncertainty"
]
},
{
"n": 21,
"stem": "A researcher is conducting a study on student performance across different schools and uses a convenience sampling method by choosing the schools that are easiest to access. What is a major limitation of this approach?",
"opts": [
"It guarantees that the sample is representative of all schools.",
"It introduces potential bias because the sample may not be representative of the entire population.",
"It ensures a higher level of precision in estimates.",
"It eliminates the need for a sampling frame"
]
},
{
"n": 22,
"stem": "Which of the following situations would likely produce a correlation coefficient closest to zero?",
"opts": [
"The number of hours studied and exam scores",
"The height of a person and their shoe size.",
"The amount of rainfall and the price of bread.",
"The weight of a car and its fuel efficiency."
]
},
{
"n": 23,
"stem": "Which of the following is an example of paradata?",
"opts": [
"Aggregate statistics from survey results",
"Survey respondents' answers to demographic questions",
"Summary of findings from survey analysis",
"The time taken by respondents to complete the survey"
]
},
{
"n": 24,
"stem": "Which type of variable best describes the variable \"Number of books read per month\"?",
"opts": [
"Nominal",
"Ordinal",
"Interval",
"Ratio"
]
},
{
"n": 25,
"stem": "In a time series plot, what does a spike at a lag of 12 in the autocorrelation function (ACF) suggest?",
"opts": [
"The presence of a trend in the data.",
"A possible seasonal effect occurring every 12 periods.",
"Random noise affecting the data.",
"A significant increase in data values every 12 periods."
]
},
{
"n": 26,
"stem": "Which of the following is an example of metadata?",
"opts": [
"The content of an email message",
"The author, date, and file size of a document",
"Survey responses from participants",
"The number of pages in a book"
]
},
{
"n": 27,
"stem": "A retailer calculates the average sales per day for a month. The mean sales per day is Nu 500, but one day had sales of Nu 5,000 due to a special promotion. What measure of central tendency should the retailer use to avoid the effect of this outlier?",
"opts": [
"Mean",
"Mode",
"Median",
"Range"
]
},
{
"n": 28,
"stem": "In a survey of 2,000 households, the average household income per month is found to be Nu 30,000 with a standard deviation of Nu 1,000. Which test should be used to examine if the average household income per month is significantly different from Nu 35,000?",
"opts": [
"Paired t-test",
"One-sample t-test",
"Independent t-test",
"Z-test for proportions"
]
},
{
"n": 29,
"stem": "A machine learning model is being trained to classify images using maximum likelihood estimation. During training, if the model frequently misclassifies images, what does this imply about the likelihood function?",
"opts": [
"The likelihood function is high.",
"The likelihood function is low.",
"The likelihood function is constant.",
"The likelihood function is irrelevant."
]
},
{
"n": 30,
"stem": "When analysing a time series, what does stationarity imply?",
"opts": [
"The time series data have no trend or seasonal components.",
"The mean and variance of the time series change over time.",
"The time series has periodic fluctuations.",
"The statistical properties of the time series remain constant over time."
]
},
{
"n": 31,
"stem": "Suppose the nominal GDP of Country Y is Nu 500 billion, and there is an annual inflation rate of 3%. What would be the primary factor if the nominal GDP rises to Nu 515 billion the next year?",
"opts": [
"Solely the increase in population",
"Solely the increase in prices due to inflation",
"Solely the increase in the production of goods and services",
"A combination of inflation and increased production"
]
},
{
"n": 32,
"stem": "In what sense the word ‘probability’ is used in statistical theory?",
"opts": [
"The degree of certainty that a specific event will occur.",
"The relative frequency of an event's occurrence in a large number of trials.",
"The likelihood of all possible outcomes occurring equally.",
"The belief in the occurrence of an event based on personal judgment."
]
},
{
"n": 33,
"stem": "Which of the following is an example of a discrete variable?",
"opts": [
"The weight of apples in a basket",
"The time it takes to commute to work",
"The number of pets owned by a family",
"The height of students in a classroom"
]
},
{
"n": 34,
"stem": "Which of the following is an example of official statistics?",
"opts": [
"A scientific research study published in a journal",
"Data from a social media platform",
"National census data",
"Survey results from a private market research firm"
]
},
{
"n": 35,
"stem": "If a distribution is positively skewed, where is the mean relative to the median?",
"opts": [
"Mean = Median",
"Mean < Median",
"Mean > Median",
"Mean and median are unrelated"
]
},
{
"n": 36,
"stem": "A retail store tracks the number of customers over five days: 150, 160, 170, 180, and 300. Which measure of dispersion is most affected by the outlier?",
"opts": [
"Interquartile Range (IQR)",
"Median",
"Mode",
"Range Use the following chart to answer Questions 37, 38 & 39"
]
},
{
"n": 37,
"stem": "What type of pattern is indicated in the chart?",
"opts": [
"Cyclical pattern",
"Seasonal pattern",
"Trend pattern",
"Irregular pattern"
]
},
{
"n": 38,
"stem": "Use the bar chart of the inflation rate in Country A (2017-2023). Which of the following statement about the inflation rate's variability can be inferred if the bar graph shows a large peak and low variability in other years?",
"opts": [
"The inflation rate is consistently high.",
"The inflation rate is very stable over time.",
"The peak year represents an anomaly or outlier in the data.",
"The inflation rate has a normal distribution."
],
"image": "/papers/me/tech2-stat-2024-inflation.png"
},
{
"n": 39,
"stem": "Use the bar chart of the inflation rate in Country A (2017-2023). What would have been the best graphical representation of the inflation rates data instead of the bar graph?",
"opts": [
"Dot/scatter plot",
"Line graph",
"Pie chart",
"Table"
],
"image": "/papers/me/tech2-stat-2024-inflation.png"
},
{
"n": 40,
"stem": "What is the primary purpose of Analysis of Variance (ANOVA) in statistical analysis?",
"opts": [
"To compare the means of two groups.",
"To determine the correlation between two variables.",
"To assess whether there are statistically significant differences between the means of three or more groups.",
"To estimate the probability of a single event occurring."
]
},
{
"n": 41,
"stem": "What is one benefit of using official statistics for research and analysis?",
"opts": [
"They are always current and up-to-date",
"They are collected through informal methods",
"They provide a reliable and standardized source of data",
"They are influenced by personal opinions"
]
},
{
"n": 42,
"stem": "In government agencies, the most common number of staff at the division level is typically around 6. What measure of central tendency does this represent?",
"opts": [
"Median",
"Mode",
"Mean",
"Standard deviation"
]
},
{
"n": 43,
"stem": "A market researcher computes the standard error of the mean height from a sample of 50 customers. If the standard error is small, what can be inferred?",
"opts": [
"The sample mean height is highly variable",
"The sample mean height is a precise estimate of the population mean",
"The sample size was too small",
"The heights of customers are distributed normally"
]
},
{
"n": 44,
"stem": "For a discrete random variable X, which of the following is true about the cumulative distribution function (CDF) F(x) = P(X ≤ x)?",
"opts": [
"F(x) decreases as x increases.",
"F(x) can have discontinuities at the values of x where P(X=x) is non-zero.",
"F(x) is always differentiable.",
"F(x) is equal to the probability density function (PDF) of X."
]
},
{
"n": 45,
"stem": "Which of the following scenarios would typically result in a random variable X being classified as discrete?",
"opts": [
"Measuring the time taken for a chemical reaction to complete.",
"Counting the number of defective items in a batch of products.",
"Recording the temperature of a liquid at various time intervals.",
"Measuring the distance between two points in a city."
]
},
{
"n": 46,
"stem": "A healthcare provider integrates patient records from multiple sources, such as electronic health records (EHRs), medical imaging, and genomic data. What big data challenge does this scenario exemplify?",
"opts": [
"Data integration",
"Data storage",
"Data visualization",
"Data security"
]
},
{
"n": 47,
"stem": "What does the probability of an event represent in statistical theory?",
"opts": [
"The number of times the event has occurred.",
"The chance that the event will occur in a single trial.",
"The proportion of times the event will occur in repeated trials.",
"The belief in the occurrence of the event."
]
},
{
"n": 48,
"stem": "What is the primary aim of the design of experiments (DOE)?",
"opts": [
"To minimize the number of trials needed to find the best outcome.",
"To identify and quantify the effects of different factors on a response variable.",
"To maximize the number of variables considered in a study.",
"To ensure that all possible combinations of factors are tested."
]
},
{
"n": 49,
"stem": "A researcher uses time series analysis to predict monthly electricity consumption and notices that consumption spikes during the summer and winter months. This pattern is most likely due to",
"opts": [
"A long-term trend",
"Seasonal effects",
"Random noise",
"Cyclical fluctuations"
]
},
{
"n": 50,
"stem": "A teacher finds that the scores of a test in a class are closely clustered around the mean. Which measure of dispersion would be low for this set of scores?",
"opts": [
"Interquartile Range (IQR)",
"Range",
"Standard Deviation",
"Variance"
]
},
{
"n": 51,
"stem": "In a study to estimate the average height of adults in a city, a researcher uses a stratified random sampling method where the city is divided into different age groups. Why might this approach be preferred over simple random sampling?",
"opts": [
"It ensures that all age groups are represented proportionally in the sample.",
"It eliminates the need for sampling altogether.",
"It guarantees that the sample size will be larger.",
"It reduces the variability within the sample."
]
},
{
"n": 52,
"stem": "If X and Y are independent random variables, which of the following statements is false?",
"opts": [
"E[X + Y] = E[X] + E[Y]",
"Var(X + Y) = Var(X) + Var(Y)",
"P(X > x and Y > y) = P(X > x) x P(Y > y)",
"Cov(X, Y) = 0 only if X and Y are normally distributed"
]
},
{
"n": 53,
"stem": "In a statistical experiment, the sample space S consists of 6 equally likely outcomes. If an event A is defined as a subset of S with 4 outcomes, what is the probability of the complementary event Ac?",
"opts": [
"1/3",
"1/6",
"2/3",
"4/6 Use the box plot below to answer Questions 54 and 55."
]
},
{
"n": 54,
"stem": "Use the box plot of mathematics scores by sex. When comparing box plots for male and female scores, which of the following statements could indicate that the female scores are more skewed than the male scores?",
"opts": [
"The median of female scores is higher than that of male scores.",
"The box for female scores is wider than the box for male scores.",
"The whiskers for female scores are longer on one side than for male scores.",
"The box for female scores is shorter than the box for male scores."
],
"image": "/papers/me/tech2-stat-2024-boxplot.png"
},
{
"n": 55,
"stem": "Use the box plot of mathematics scores by sex. In the given box plot, if the median score for males is higher than for females but the interquartile range (IQR) is larger for females, what can be inferred?",
"opts": [
"Males have more variability in their scores than females.",
"Females have a wider range of middle 50% of scores compared to males.",
"Males have a higher variance in their scores compared to females.",
"Females have a lower mean score compared to males."
],
"image": "/papers/me/tech2-stat-2024-boxplot.png"
},
{
"n": 56,
"stem": "A multinational corporation integrates financial data from subsidiaries located in different countries, each using different currencies. What is a key consideration in this data integration process?",
"opts": [
"Data encryption",
"Data latency",
"Data standardization",
"Data visualization"
]
},
{
"n": 57,
"stem": "If two events are mutually exclusive, what is the probability that both events occur?",
"opts": [
"0",
"1",
"It depends on the number of trials",
"It depends on the probability of each event"
]
},
{
"n": 58,
"stem": "An airline integrates data from its booking system, loyalty program, and flight operations to provide personalized offers to frequent flyers. What is the primary benefit of this data integration?",
"opts": [
"Improved data security",
"Enhanced customer experience",
"Reduced data storage costs",
"Simplified regulatory compliance"
]
},
{
"n": 59,
"stem": "Which of the following does not affect the correlation coefficient between two variables?",
"opts": [
"Changing the scale of measurement for one or both variables",
"Shifting the variables by adding or subtracting a constant",
"The presence of outliers",
"The linearity of the relationship between the variables"
]
},
{
"n": 60,
"stem": "Sex ratio is a basic measure to explain the sex composition of a population. It is defined as the number of males per 100 females. If a country reports sex ratio of 105, which of the following is correct interpretation?",
"opts": [
"There are 105 females for every 100 males in the population.",
"There are 5 more females than females in the population.",
"There are 105 males for every 100 females in the population.",
"There are 5 more males than females in the population."
]
},
{
"n": 61,
"stem": "A social media platform analyses millions of posts per second to identify trending topics in real- time. What aspect of big data does this scenario best represent?",
"opts": [
"Volume",
"Variety",
"Velocity",
"Value"
]
},
{
"n": 62,
"stem": "A company is analysing the effect of advertising spend (X) on sales (Y). They find a positive regression slope. Which of the following conclusions is correct?",
"opts": [
"Increasing advertising spend will always increase sales",
"There is a causal relationship between advertising spend and sales",
"Higher sales can be expected with higher advertising spend, holding other factors constant",
"Sales are independent of advertising spend"
]
},
{
"n": 63,
"stem": "If a random variable follows a chi-square distribution with k degrees of freedom, what happens to the shape of the distribution as k increases?",
"opts": [
"It becomes more skewed to the right.",
"It becomes more skewed to the left.",
"It becomes symmetric and approaches a normal distribution.",
"It remains unchanged regardless of k."
]
},
{
"n": 64,
"stem": "Suppose a company wants to predict the annual sales of its product based on the amount spent on advertising. However, the sales only increase up to a certain point and then start decreasing as the advertisement becomes overwhelming. Which type of regression model should be used?",
"opts": [
"Linear Regression",
"Polynomial Regression",
"Logistic Regression",
"Ridge Regression"
]
},
{
"n": 65,
"stem": "A race has 8 runners, and medals are awarded for 1st, 2nd, and 3rd places. How many different ways can the medals be awarded?",
"opts": [
"56",
"168",
"336",
"720"
]
},
{
"n": 66,
"stem": "If the confidence level increases from 95% to 99%, what happens to the width of the confidence interval?",
"opts": [
"The interval width decreases.",
"The interval width remains the same.",
"The interval width increases.",
"The effect on interval width cannot be determined without additional information."
]
},
{
"n": 67,
"stem": "The correlation between the height and weight of individuals is found to be 0.89. If we convert height from centimetres to inches (where 1 inch = 2.54 cm), the new correlation coefficient will be",
"opts": [
"0",
"0.35",
"0.5",
"0.89"
]
},
{
"n": 68,
"stem": "A researcher increases the sample size from 50 to 200 while keeping the confidence level the same. What will happen to the confidence interval for the mean?",
"opts": [
"It will become wider.",
"It will become narrower.",
"It will stay the same.",
"It will shift upwards."
]
},
{
"n": 69,
"stem": "The mean and standard deviation of 100 observations are 40 and 5, respectively. If 4 is added to each observation, the new mean and standard deviation will be",
"opts": [
"35, 5",
"40, 0",
"45, 5",
"45, 0"
]
},
{
"n": 70,
"stem": "A biologist is estimating the growth rate of a population of bacteria. She assumes that the population grows exponentially and collects data on population size over time. Which method should she use to estimate the growth rate parameter?",
"opts": [
"Method of Moments",
"Bayesian Estimation",
"Maximum Likelihood Estimation",
"Least Squares Estimation"
]
}
]"""

KEY = {
    1: ("a", "The standard normal distribution has mean 0 and SD 1."), 2: ("b", "The mode is a measure of central tendency."),
    3: ("d", "P(at least one tail) = 1 - P(HH) = 1 - 1/4 = 3/4."), 4: ("a", "The x-axis of a histogram shows class intervals (ranges of values)."),
    5: ("b", "Official statistics follow rigorous quality standards and are published."), 6: ("a", "Clustering is a grouping technique, not a missing-data method."),
    7: ("c", "Regression models the relationship between a response and predictors; it does not by itself prove causation."),
    8: ("b", "The population mean is what we are estimating, so it is not needed."), 9: ("d", "Hospital patient records are administrative data, collected for operations, not statistics."),
    10: ("b", "Both transformed curves keep the same shape and spread but are shifted left and right: different means."),
    11: ("a", "Most deaths at older ages with a long tail towards younger ages = left (negatively) skewed."),
    12: ("a", "Bias is systematic error."), 13: ("c", "Lack of systematic data on disaster impacts is data deprivation leading to poor policy."),
    14: ("b", "Ensuring data accuracy is a typical challenge (along with non-response and limited funding)."),
    15: ("d", "Ethical reporting presents all relevant findings."), 16: ("a", "Adult heights are continuous and roughly normal - suited to parametric tests."),
    17: ("d", "Real GDP removes the effect of inflation, so it measures real growth."), 19: ("a", "Confidentiality means individual responses cannot be traced to respondents."),
    20: ("a", "The sample mean varies from sample to sample - it is not fixed."), 21: ("b", "Convenience sampling may not represent the population (selection bias)."),
    22: ("c", "Rainfall and the price of bread are essentially unrelated."), 23: ("d", "Paradata describe the data collection process, e.g. time taken."),
    24: ("d", "A count with a true zero is ratio-scale."), 25: ("b", "A spike at lag 12 in monthly data suggests yearly seasonality."),
    26: ("b", "Metadata are data about data - author, date, size."), 27: ("c", "The median is not affected by extreme values."),
    28: ("b", "Comparing one sample mean with a hypothesised value: one-sample t-test (z is similar for n = 2000)."),
    29: ("b", "Frequent misclassification means the model assigns low likelihood to the observed data."),
    30: ("d", "A stationary series has constant mean, variance and autocorrelation over time."),
    31: ("b", "500 x 1.03 = 515, so the whole rise equals inflation: real output is unchanged."),
    33: ("c", "The number of pets is a count - discrete."), 34: ("c", "National census data are official statistics."), 35: ("c", "In positive skew the mean is pulled above the median."),
    36: ("d", "The range uses the extreme values, so the outlier 300 affects it most."), 38: ("c", "A single high peak (2020) stands out as an unusual year."),
    39: ("b", "A line graph best shows change over time."), 40: ("c", "ANOVA tests differences among three or more means."),
    41: ("c", "Official statistics are reliable and standardised."), 42: ("b", "The most common value is the mode."),
    43: ("b", "A small standard error means the sample mean precisely estimates the population mean."),
    44: ("b", "A discrete CDF is a step function, jumping where P(X = x) > 0."), 45: ("b", "Counting defective items gives a discrete variable."),
    46: ("a", "Combining records from different sources is a data integration challenge."), 48: ("b", "DOE identifies and quantifies the effects of factors on a response."),
    49: ("b", "Regular summer and winter peaks are seasonal effects."), 51: ("a", "Stratification ensures all age groups are represented (and improves precision)."),
    52: ("d", "Independent variables always have zero covariance, whatever their distribution - d is false."),
    53: ("a", "P(Ac) = 1 - 4/6 = 1/3."), 54: ("c", "Unequal whiskers (and outliers on one side) indicate skewness."),
    55: ("b", "A larger IQR means the middle 50% of female scores is more spread out."), 56: ("c", "Different currencies require standardisation/ conversion."),
    57: ("a", "Mutually exclusive events cannot occur together: probability 0."), 58: ("b", "Integrated data allow personalised offers - better customer experience."),
    60: ("c", "Sex ratio 105 = 105 males per 100 females."), 61: ("c", "Processing millions of posts per second = velocity."),
    62: ("c", "A positive slope means higher expected sales with higher spend, other factors constant - not proof of causation."),
    63: ("c", "As k increases the chi-square distribution becomes more symmetric and approaches normal."),
    64: ("b", "A rise then fall (curved relationship) needs a polynomial (e.g. quadratic) model."), 65: ("c", "8P3 = 8 x 7 x 6 = 336."),
    66: ("c", "Higher confidence needs a larger critical value: a wider interval."), 67: ("d", "Correlation does not change with a change of units."),
    68: ("b", "Quadrupling n halves the standard error: a narrower interval."),
}
NEW_MCQ = [
    ("Which sampling method gives every possible sample of size n the same chance of being selected?", ["Systematic sampling", "Simple random sampling", "Quota sampling", "Snowball sampling"], "b", "That is the definition of simple random sampling."),
    ("The variance of a constant is", ["the constant itself", "1", "0", "undefined"], "c", "A constant does not vary."),
    ("If two events A and B are independent with P(A) = 0.5 and P(B) = 0.4, then P(A ∩ B) is", ["0.9", "0.2", "0.1", "0.45"], "b", "P(A ∩ B) = 0.5 x 0.4 = 0.2."),
    ("For a Poisson distribution with mean 4, the variance is", ["2", "4", "8", "16"], "b", "Mean = variance = λ."),
    ("Which measure is the square root of the variance?", ["Mean deviation", "Standard deviation", "Coefficient of variation", "Range"], "b", "SD = √variance."),
    ("In a box plot, the box itself represents", ["the full range of the data", "the middle 50% of the data (Q1 to Q3)", "the mean ± 1 SD", "the outliers"], "b", "The box spans the interquartile range."),
    ("The number of ways to choose 2 people from 5 (order does not matter) is", ["10", "20", "25", "60"], "a", "5C2 = 10."),
    ("A Type II error occurs when we", ["reject a true null hypothesis", "fail to reject a false null hypothesis", "reject a false null hypothesis", "accept the alternative correctly"], "b", "Type II: failing to reject a false H0 (probability β)."),
]
SAQ = [
 dict(marks=5, stem="In what ways can the central limit theorem be applied to real-world data analysis, and what are its limitations? (5 marks)",
      kp=[("Statement: sampling distribution of the mean approaches normal as n grows (n ≥ 30), mean μ, SE σ/√n, whatever the population shape", 1.5),
          ("Applications: confidence intervals and z/t tests for means and proportions, survey estimation (national surveys), quality control charts, A/B testing, approximating binomial/ Poisson", 2),
          ("Limitations: needs independent, identically distributed data and finite variance; large n for skewed/ heavy-tailed data; not for small samples, dependent (time series/ clustered) data, extremes/ medians; describes the mean not individual values", 1.5)],
      model="The central limit theorem states that, for independent observations from any population with finite mean μ and variance σ², the sampling distribution of the sample mean approaches a normal distribution with mean μ and standard error σ/√n as the sample size grows (usually n ≥ 30). Applications: it justifies confidence intervals and z- or t-tests for means and proportions even when the data are not normal (e.g. estimating average household income or poverty rates from national surveys); quality control charts that monitor sample means; A/B testing; and normal approximations to the binomial and Poisson distributions. Limitations: it needs independent, identically distributed observations and finite variance (it fails for very heavy-tailed distributions such as Cauchy); for strongly skewed data or rare events a much larger n is needed; it does not hold well for small samples or dependent data (time series, clustered samples without design adjustment); it applies to means/ sums, not to individual observations or statistics such as extremes; and it gives no protection against bias in sampling."),
 dict(marks=5, stem="How do confidence intervals provide more information than point estimates in statistical reporting? (5 marks)",
      kp=[("Point estimate gives a single value with no indication of precision/ uncertainty", 1),
          ("CI gives a range of plausible values with a stated confidence level; shows precision (width), effect of sample size and variability", 2),
          ("Helps practical interpretation and comparison: significance (whether CI includes null value/ overlap), practical importance, honest reporting, example (e.g. unemployment 4.5% with 95% CI 4.0-5.0)", 2)],
      model="A point estimate (e.g. sample mean or proportion) gives a single best guess but says nothing about how precise it is. A confidence interval gives a range of plausible values for the population parameter together with a stated confidence level (e.g. 95%), so it shows the uncertainty due to sampling. Its width shows precision - narrow intervals from large samples or low variability, wide ones from small samples. It also supports inference: if a 95% CI for a difference excludes zero the difference is significant at 5%, and comparing intervals across groups or years shows whether changes are meaningful. It helps judge practical importance, not only statistical significance, and prevents over-interpreting small differences. Example: reporting an unemployment rate of 4.5% (95% CI 4.0-5.0%) tells users the true rate is likely between 4% and 5%, which a bare 4.5% does not."),
 dict(marks=5, stem="What role do assumptions play in the application of statistical models, and how can violations of these assumptions affect the results? (5 marks)",
      kp=[("Role: models rely on assumptions (e.g. linearity, independence, normality, constant variance, random sampling, no multicollinearity) that justify estimates, standard errors and tests", 2),
          ("Effects of violations: biased/ inconsistent estimates, wrong standard errors, invalid p-values and CIs (Type I/ II errors), poor predictions, misleading conclusions - with examples (heteroscedasticity, autocorrelation, outliers, non-normal small samples)", 2),
          ("Response: check with diagnostics (residual plots, tests), transform data, robust SEs, non-parametric or other models", 1)],
      model="Every statistical model rests on assumptions - for example, in linear regression: a linear relationship, independent observations, constant error variance (homoscedasticity), normally distributed errors (for small-sample inference), no perfect multicollinearity, and data from a random sample. These assumptions justify the estimates, their standard errors, p-values and confidence intervals. When they are violated: non-linearity or omitted variables give biased estimates and poor predictions; heteroscedasticity or autocorrelation (common in time series) make standard errors wrong, so tests and intervals are invalid (too many false positives or missed effects); non-normal errors in small samples distort tests; outliers can dominate results; multicollinearity inflates standard errors and makes coefficients unstable; non-random samples bias all results. Therefore assumptions should be checked with diagnostics (residual plots, normality and heteroscedasticity tests, VIF) and handled by transformations, robust standard errors, weighting, non-parametric methods or more appropriate models."),
 dict(marks=5, stem="What are some challenges associated with the use of statistical learning in handling large-scale data sets? (5 marks)",
      kp=[("Computational: storage, processing time, memory, need for distributed/ parallel computing, scalable algorithms", 1.5),
          ("Data issues: data quality, missing values, noise, heterogeneity/ integration of sources (variety), high dimensionality (curse of dimensionality), velocity/ streaming", 1.5),
          ("Statistical/ ethical: overfitting, spurious correlations and multiple testing, interpretability ('black box'), bias in data/ algorithms, privacy and confidentiality, skills shortage", 2)],
      model="Challenges include: (1) computation - huge volumes need large storage, memory and processing power, and algorithms must scale (distributed computing, parallel processing, stochastic or online methods); (2) data quality - big data are often noisy, incomplete, duplicated or inconsistent, and cleaning takes much effort; (3) variety and integration - combining structured and unstructured data from different sources and formats; (4) velocity - streaming data that must be analysed in real time; (5) high dimensionality - many variables relative to observations cause the curse of dimensionality and need feature selection or regularisation; (6) overfitting and spurious correlations - with so many variables some patterns appear by chance, so validation and multiple-testing control are needed; (7) interpretability - complex models such as deep learning are hard to explain to policymakers; (8) bias and representativeness - big data (e.g. social media) may not represent the population, and algorithms can reproduce bias; (9) privacy, confidentiality and security of personal data; and (10) shortage of skilled staff and infrastructure."),
 dict(marks=5, stem="State True or False and then support your answer with a brief explanation.\na) In regression analysis, the correlation coefficient between the predictor and the response variable always accurately reflects the strength and direction of the causal relationship between them. (2.5 marks)\nb) In a large dataset, a correlation coefficient of 0.1 implies a strong relationship between two variables. (2.5 marks)",
      kp=[("a) False: correlation measures linear association, not causation; confounding, reverse causality, non-linearity and outliers can distort it", 2.5),
          ("b) False: r = 0.1 is a weak linear relationship (r² = 1%); large n may make it statistically significant but not strong", 2.5)],
      model="a) False. The correlation coefficient measures the strength and direction of the linear association between two variables, not causation. A confounding variable, reverse causation, a non-linear relationship or outliers can make r large without a causal effect (or small despite one).\nb) False. A correlation of 0.1 indicates a very weak linear relationship - the predictor explains only about 1% of the variation (r² = 0.01). In a large dataset it may be statistically significant, but statistical significance is not the same as a strong or practically important relationship."),
 dict(marks=5, stem="State True or False and then support your answer with a brief explanation.\na) Increasing the sample size of a study will always improve the accuracy of parameter estimates. (2 marks)\nb) A high R-squared value in a regression model always indicates that the model has good predictive power. (1.5 marks)\nc) In a dataset with a bimodal distribution, the mean and median will always be different. (1.5 marks)",
      kp=[("a) False: larger n reduces sampling error (improves precision) but not bias from poor design, measurement error or non-response", 2),
          ("b) False: high R² can come from overfitting, many predictors, spurious/ trending data; predictive power must be checked on new data (adjusted R², validation)", 1.5),
          ("c) False: a symmetric bimodal distribution has equal mean and median", 1.5)],
      model="a) False. A larger sample reduces random sampling error, so estimates become more precise, but it does not remove systematic error (bias) from a poor sampling frame, non-response, or measurement error - a large biased sample still gives inaccurate estimates.\nb) False. R-squared measures how well the model fits the sample data. It always rises when variables are added and can be high because of overfitting, spurious relationships or trending time series. Predictive power must be judged on new data (cross-validation, out-of-sample error) and with adjusted R-squared.\nc) False. If a bimodal distribution is symmetric (two equal peaks placed symmetrically), the mean and median are equal (both at the centre). They differ only when the distribution is asymmetric."),
]
Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
