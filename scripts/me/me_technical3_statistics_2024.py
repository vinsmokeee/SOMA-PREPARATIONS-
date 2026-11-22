"""ME Technical Paper III (Subject Specialisation Paper), Statistics, BCSE 2024 - real paper (PDF sent by the founder).
Standard pattern, same as the 2025 Statistics paper (the latest). The survey table (MCQs 8-9) and regression output
(MCQs 12-14) are written into the stems; MCQ 23 shows the boxplot (public/papers/me/tech3-stat-2024-boxplot.png).
Replaced: MCQ 11 (the data do not fit: with the given numbers no option matches the normal-curve answer). Normal
probabilities use the standard normal distribution (students use the tables printed with the paper).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Statistics): BCSE 2024, batch 1"
GROUP_TAG = "stat2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "statistics"
ADDS_TO_PAPER = True  # 2025 is the latest Statistics paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Statistics"

MCQ = r"""[
{
"n": 1,
"stem": "Given a dataset with a mean of 100 and a variance of 100, what is the z-score for a value of 90?",
"opts": [
"1",
"-2",
"-1",
"2"
]
},
{
"n": 2,
"stem": "What is the value of variance if the sample mean is 80 and the coefficient of variation (CV) is 5%?",
"opts": [
"4",
"5",
"16",
"25"
]
},
{
"n": 3,
"stem": "In a simple linear regression model, which of the following is true if the slope β1 is zero?",
"opts": [
"The predictor variable is perfectly correlated with the response variable.",
"The response variable has no variation.",
"The predictor variable has no impact on the response variable.",
"The intercept β0 must also be zero."
]
},
{
"n": 4,
"stem": "Suppose the average income of civil servants in Bhutan is Nu. 30,000 with a standard deviation of Nu 3,000. If all civil servants receive a 10% raise in the coming year, what will be the new mean income and standard deviation?",
"opts": [
"Nu 30,000 and Nu 3,000",
"Nu 33,000 and Nu 3,000",
"Nu 30,000 and Nu 3,300",
"Nu 33,000 and Nu 3,300"
]
},
{
"n": 5,
"stem": "If X is normally distributed with mean 8 and standard deviation 4, what is P(5 ≤ X ≤ 10)?",
"opts": [
"0.2266",
"0.4649",
"0.6915",
"0.9181"
]
},
{
"n": 6,
"stem": "In a hypothesis test for the difference between two means, what does a 95% confidence interval that includes zero imply about the null hypothesis?",
"opts": [
"There is strong evidence against the null hypothesis.",
"There is weak evidence against the null hypothesis.",
"The null hypothesis should be rejected.",
"The null hypothesis should not be rejected."
]
},
{
"n": 7,
"stem": "In a multiple regression analysis, which of the following scenarios is most likely to lead to multicollinearity?",
"opts": [
"High correlation between the dependent variable and independent variables",
"High correlation among the independent variables",
"Inclusion of a categorical variable with many levels",
"Use of too many dummy variables Suppose the following data were collected from household survey. Use the information in the table to answer Questions 8 and 9. Primary Sampling Unit Household serial number y Base Weight (W) 1 1 1 120 1 2 1 120 2 1 1 40 2 2 1 40 3 1 0 50 3 2 1 50 4 1 1 80 4 2 0 80 4 3 1 80"
]
},
{
"n": 8,
"stem": "Suppose the following data were collected from a household survey (Y = 1 if the household has at least one smart phone, 0 otherwise):\nPSU 1: household 1, y = 1, W = 120; household 2, y = 1, W = 120\nPSU 2: household 1, y = 1, W = 40; household 2, y = 1, W = 40\nPSU 3: household 1, y = 0, W = 50; household 2, y = 1, W = 50\nPSU 4: household 1, y = 1, W = 80; household 2, y = 0, W = 80; household 3, y = 1, W = 80\n(W = base weight)\n\nWhat is the estimated total households from the survey?",
"opts": [
"9",
"660",
"15",
"530"
]
},
{
"n": 9,
"stem": "Suppose the following data were collected from a household survey (Y = 1 if the household has at least one smart phone, 0 otherwise):\nPSU 1: household 1, y = 1, W = 120; household 2, y = 1, W = 120\nPSU 2: household 1, y = 1, W = 40; household 2, y = 1, W = 40\nPSU 3: household 1, y = 0, W = 50; household 2, y = 1, W = 50\nPSU 4: household 1, y = 1, W = 80; household 2, y = 0, W = 80; household 3, y = 1, W = 80\n(W = base weight)\n\nWhat is the estimated proportion of household having at least one smart phone?",
"opts": [
"77.8%",
"79.5%",
"80.3%",
"81.6%"
]
},
{
"n": 10,
"stem": "If the CPI for the current year is 120 and the CPI for the previous year was 115, what is the inflation rate?",
"opts": [
"4.35%",
"5.00%",
"4.17%",
"5.22%"
]
},
{
"n": 11,
"stem": "The height distribution of 80 staff members at the National Statistics Bureau follow a normal distribution with mean 165 cm and standard deviation 25 cm. If 15 staff have their height between 160 cm and 170cm, the number of staff whose height is less than 160 cm is?",
"opts": [
"b)",
"",
"31",
"The summary output of the regression model studying effect of gender (two factors: male and female) on test scores is presented below. Use the output to answer Question 12, 13 and 14. Coefficients: Estimate Std. Error t value Pr(>|t|) (Intercept) 76.464 1.295 59.045 < 2e-16 *** GenderMale -6.120 1.831 -3.342 0.00118 **"
]
},
{
"n": 12,
"stem": "The summary output of a regression model studying the effect of gender (two factors: male and female) on test scores:\n(Intercept): estimate 76.464, std. error 1.295, t value 59.045, Pr(>|t|) < 2e-16\nGenderMale: estimate -6.120, std. error 1.831, t value -3.342, Pr(>|t|) 0.00118\n\nWhat does the intercept represent in this regression model?",
"opts": [
"The average score for males",
"The average score for females",
"The difference between male and female scores",
"The overall average score across all participants"
]
},
{
"n": 13,
"stem": "The summary output of a regression model studying the effect of gender (two factors: male and female) on test scores:\n(Intercept): estimate 76.464, std. error 1.295, t value 59.045, Pr(>|t|) < 2e-16\nGenderMale: estimate -6.120, std. error 1.831, t value -3.342, Pr(>|t|) 0.00118\n\nWhat is the predicted score for a male participant according to this model?",
"opts": [
"76.464",
"70.344",
"82.584",
"Cannot be determined from the given information"
]
},
{
"n": 14,
"stem": "The summary output of a regression model studying the effect of gender (two factors: male and female) on test scores:\n(Intercept): estimate 76.464, std. error 1.295, t value 59.045, Pr(>|t|) < 2e-16\nGenderMale: estimate -6.120, std. error 1.831, t value -3.342, Pr(>|t|) 0.00118\n\nIf another factor, such as age, were added to this model, under what condition might the coefficient for 'GenderMale' change significantly, and what would that imply?",
"opts": [
"If age is correlated with gender, indicating a potential confounding effect.",
"If age is independent of gender, indicating no impact on the gender coefficient.",
"If the sample size increases, leading to more accurate estimates.",
"If the variance of the residuals increases, indicating a poorer fit of the model."
]
},
{
"n": 15,
"stem": "Which of the following statements is not the property of Bernoulli distribution?",
"opts": [
"The experiment consists of n repeated trials.",
"Each trials results in an outcome that may be classified under two mutually exclusive categories as a success or as a failure.",
"The repeated trials are independent.",
"The probability of success denoted by p, changes from trail to trail."
]
},
{
"n": 16,
"stem": "In the context of time series forecasting, what is the \"Box-Cox transformation\" primarily used for?",
"opts": [
"Handling missing data",
"Stabilizing variance",
"Identifying seasonality",
"Reducing autocorrelation"
]
},
{
"n": 17,
"stem": "In a two-tailed hypothesis test, if the p-value is 0.04, what is the probability of observing a test statistic as extreme or more extreme than the observed one in the opposite direction?",
"opts": [
"0.04",
"0.08",
"0.02",
"0.96"
]
},
{
"n": 18,
"stem": "Suppose a continuous random variable X has a PDF given by f(x) = 3x² for x ∈ [0, 1]. What is the expected value E[X]?",
"opts": [
"1/2",
"3/4",
"2/3",
"3/5"
]
},
{
"n": 19,
"stem": "Suppose you have two different samples from the same population. The first sample has a size of 25, and the second sample has a size of 100. If the standard deviation of the population is known, how does the standard error of the mean for the first sample compare to that of the second sample?",
"opts": [
"The first sample’s standard error is twice as large.",
"The first sample’s standard error is four times as large.",
"The first sample’s standard error is half as large.",
"The first sample’s standard error is equal to that of the second sample."
]
},
{
"n": 20,
"stem": "A dataset has a mean of 50 and standard deviation of 7. If every data point is reduced by 5, what are the new mean and standard deviation?",
"opts": [
"45 and 7",
"50 and 7",
"45 and 2",
"55 and 2"
]
},
{
"n": 21,
"stem": "In the context of experimental design, what is a \"confounding variable\"?",
"opts": [
"A variable that is deliberately manipulated by the researcher.",
"A variable that is held constant throughout the experiment to isolate the effect of the treatment.",
"A variable that influences both the independent and dependent variables, potentially distorting the observed effect.",
"A variable that is randomly assigned to subjects to ensure unbiased results."
]
},
{
"n": 22,
"stem": "For a binomial distribution with n = 8 and p = 0.2, what is the standard deviation?",
"opts": [
"0.12",
"2.24",
"1.28",
"1.13"
]
},
{
"n": 23,
"stem": "In the boxplot of monthly household expenses shown, what can be inferred about the skewness of the data?",
"opts": [
"The data is symmetric.",
"The data is positively skewed.",
"The data is negatively skewed.",
"The data is normally distributed."
],
"image": "/papers/me/tech3-stat-2024-boxplot.png"
},
{
"n": 24,
"stem": "A bag contains 25 balls marked 1 to 25. One ball is drawn at random. What is the probability that it is marked with a number that is a multiple of 5 or 7?",
"opts": [
"5/25",
"3/25",
"6/25",
"8/25"
]
},
{
"n": 25,
"stem": "In hypothesis testing, what is the main difference between a Type I error and a Type II error?",
"opts": [
"Type I error is failing to reject a false null hypothesis; Type II error is rejecting a true null hypothesis.",
"Type I error is rejecting a true null hypothesis; Type II error is failing to reject a false null hypothesis.",
"Type I error occurs when the sample size is too large; Type II error occurs when the sample size is too small.",
"Type I error occurs in one-tailed tests; Type II error occurs in two-tailed tests."
]
},
{
"n": 26,
"stem": "Which of the following is true about the posterior distribution in Bayesian statistics?",
"opts": [
"It is the same as the prior distribution.",
"It is the likelihood function alone.",
"It is obtained by updating the prior distribution with the likelihood function.",
"It is the prior distribution multiplied by the data."
]
},
{
"n": 27,
"stem": "What is the main purpose of using a control group in an experimental design?",
"opts": [
"To increase the sample size of the experiment",
"To ensure that the experimental procedure is standardized",
"To provide a baseline for comparison and measure the effect of the treatment",
"To reduce the cost of the experiment"
]
},
{
"n": 28,
"stem": "In a multiple regression model, adding more independent variables to the model will always",
"opts": [
"Increase the R² value",
"Improve the model's predictive accuracy",
"Reduce the variance of the error term",
"Increase the multicollinearity in the model"
]
},
{
"n": 29,
"stem": "The unit for variance is",
"opts": [
"Unitless",
"Original unit",
"Original unit squared",
"None of above"
]
},
{
"n": 30,
"stem": "A city reports a CPI of 200 this year. If the CPI last year was 180, what is the percentage change in the purchasing power of the currency?",
"opts": [
"11.11%",
"10.00%",
"12.00%",
"8.89%"
]
}
]"""

KEY = {
    1: ("c", "SD = √100 = 10; z = (90 - 100)/10 = -1."),
    2: ("c", "SD = CV x mean = 0.05 x 80 = 4; variance = 16."),
    3: ("c", "A zero slope means the predictor has no (linear) effect on the response."),
    4: ("d", "Multiplying by 1.1 multiplies both the mean and the SD by 1.1: Nu 33,000 and Nu 3,300."),
    5: ("b", "z = (5 - 8)/4 = -0.75 and (10 - 8)/4 = 0.5; P = 0.6915 - 0.2266 = 0.4649."),
    6: ("d", "If the 95% CI for the difference includes 0, the difference is not significant at 5%: do not reject H0."),
    7: ("b", "Multicollinearity is high correlation among the independent variables."),
    8: ("b", "Estimated total = sum of weights = 2(120) + 2(40) + 2(50) + 3(80) = 660."),
    9: ("c", "Weighted proportion = (120 + 120 + 40 + 40 + 50 + 80 + 80)/660 = 530/660 = 80.3%."),
    10: ("a", "Inflation = (120 - 115)/115 x 100 = 4.35%."),
    12: ("b", "Female is the reference category, so the intercept is the mean score for females."),
    13: ("b", "Predicted male score = 76.464 - 6.120 = 70.344."),
    14: ("a", "If age is correlated with gender (and affects scores), adjusting for it changes the gender coefficient - confounding."),
    15: ("d", "In a Bernoulli process the probability of success p stays constant from trial to trial."),
    16: ("b", "The Box-Cox transformation stabilises variance (and makes data closer to normal)."),
    17: ("c", "A two-tailed p-value of 0.04 splits equally: 0.02 in each tail."),
    18: ("b", "E[X] = ∫ x·3x² dx from 0 to 1 = 3/4."),
    19: ("a", "SE = σ/√n: √(100/25) = 2, so the first sample's SE is twice as large."),
    20: ("a", "Subtracting a constant lowers the mean by 5 but leaves the SD unchanged: 45 and 7."),
    21: ("c", "A confounder is associated with both the exposure (independent variable) and the outcome."),
    22: ("d", "SD = √(npq) = √(8 x 0.2 x 0.8) = √1.28 = 1.13."),
    23: ("b", "Outliers and the longer whisker are on the high side, so the data are positively (right) skewed."),
    24: ("d", "Multiples of 5: 5, 10, 15, 20, 25 (5); of 7: 7, 14, 21 (3); none common: 8/25."),
    25: ("b", "Type I: rejecting a true H0; Type II: failing to reject a false H0."),
    26: ("c", "Posterior ∝ prior x likelihood: the prior is updated with the data."),
    27: ("c", "The control group provides the baseline to measure the treatment effect."),
    28: ("a", "R² never decreases when variables are added (adjusted R² can fall)."),
    29: ("c", "Variance is in squared units of the original data."),
    30: ("b", "Purchasing power changes by 180/200 - 1 = -10%: a 10% fall."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "If A and B are independent events with P(A) = 0.3 and P(B) = 0.5, then P(A ∩ B) is", ["0.15", "0.2", "0.8", "0.65"], "a",
            "For independent events P(A ∩ B) = P(A) x P(B) = 0.15."),
]

SA = [
    ("A company wants to estimate the average time (in hours) its employees spend on training per month. A random sample of 40 employees shows that the average training time is 8 hours with a standard deviation of 2 hours.\na) Calculate a 95% confidence interval for the true average training time. (3 marks)\nb) Interpret it. (2 marks)",
     [("a) SE = 2/√40 = 0.316; t(39, 0.025) = 2.023 (or z = 1.96); margin ≈ 0.64 (0.62); CI ≈ 7.36 to 8.64 hours (7.38 to 8.62)", 3),
      ("b) We are 95% confident the true mean monthly training time of all employees lies between about 7.4 and 8.6 hours; 95% of such intervals would contain μ", 2)],
     "a) Standard error = s/√n = 2/√40 = 2/6.325 = 0.316. With σ unknown, use t with 39 df: t = 2.023, margin of error = 2.023 x 0.316 = 0.64. 95% CI = 8 ± 0.64 = (7.36, 8.64) hours. (Using z = 1.96 for a large sample: 8 ± 0.62 = (7.38, 8.62).)\nb) We are 95% confident that the true average monthly training time of all the company's employees lies between about 7.4 and 8.6 hours. That is, if many samples of 40 were taken and an interval built from each, about 95% of those intervals would contain the true mean."),
    ("A researcher wants to estimate the average monthly expenditure on healthcare with a margin of error of Nu 50 and a confidence level of 95%. From a preliminary study, the standard deviation of expenditure is estimated to be Nu 500. What sample size is needed? (5 marks)",
     [("Formula n = (zσ/E)² with z = 1.96, σ = 500, E = 50", 2), ("n = (1.96 x 500/50)² = 19.6² = 384.16 → round up to 385", 3)],
     "For estimating a mean: n = (z x σ / E)². With z = 1.96 (95%), σ = Nu 500 and E = Nu 50: n = (1.96 x 500 / 50)² = (19.6)² = 384.16. Always round up, so the required sample size is 385 (before allowing for non-response)."),
    ("A problem in Statistics is given to five students - Sonam, Karma, Penjor, Choki and Tashi. Their chances of solving it are 1/6, 1/5, 1/4, 1/3 and 1/2 respectively. What is the probability that the problem will be solved? (5 marks)",
     [("P(solved) = 1 - P(none solves), assuming independence; failure probabilities 5/6, 4/5, 3/4, 2/3, 1/2", 2), ("P(none) = 5/6 x 4/5 x 3/4 x 2/3 x 1/2 = 1/6; P(solved) = 5/6 ≈ 0.833", 3)],
     "The problem is solved if at least one student solves it. Assuming the students work independently, P(solved) = 1 - P(no one solves it). Probabilities of failing: Sonam 5/6, Karma 4/5, Penjor 3/4, Choki 2/3, Tashi 1/2. P(no one) = 5/6 x 4/5 x 3/4 x 2/3 x 1/2 = 120/720 = 1/6. Therefore P(solved) = 1 - 1/6 = 5/6 ≈ 0.833."),
    ("Assume X1, X2, ..., Xn are independent and identically distributed (iid) random variables with E(Xi) = μ and Var(Xi) = σ². Write/derive the distribution of the sample mean X̄. (5 marks)",
     [("E(X̄) = (1/n)ΣE(Xi) = μ", 1.5), ("Var(X̄) = (1/n²)ΣVar(Xi) = σ²/n (independence)", 1.5),
      ("Distribution: if Xi normal, X̄ ~ N(μ, σ²/n) exactly; otherwise by the Central Limit Theorem X̄ is approximately N(μ, σ²/n) for large n (standard error σ/√n)", 2)],
     "X̄ = (1/n)(X1 + X2 + ... + Xn). Mean: E(X̄) = (1/n) Σ E(Xi) = (1/n)(nμ) = μ, so X̄ is unbiased for μ. Variance: because the Xi are independent, Var(X̄) = (1/n²) Σ Var(Xi) = (1/n²)(nσ²) = σ²/n, so the standard error is σ/√n. Distribution: if the Xi are normally distributed, X̄ is exactly normal, X̄ ~ N(μ, σ²/n) (a linear combination of independent normals is normal). For any distribution with finite variance, the Central Limit Theorem gives that, for large n (usually n ≥ 30), X̄ is approximately N(μ, σ²/n), i.e. (X̄ - μ)/(σ/√n) → N(0, 1)."),
]
for i, (s, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=5, topic=T, stem=s, key_points=kp, model=mod))

C1 = """Case I: Testing customer preference for a new product
A company wants to assess whether the proportion of customers who prefer their new product is different from the proportion of customers who preferred their previous product. They conducted a survey with a sample of 400 customers. Of these, 180 indicated a preference for the new product. The company previously reported that 40% of their customers preferred the old product.
You are required to perform hypothesis testing on the proportion of customers who prefer the new product."""
C2 = """Case II: Survey of customer satisfaction with a mobile banking app
You are tasked with designing a survey to evaluate customer satisfaction for a newly launched mobile banking app by a financial institution. The goal of the survey is to gather feedback on user experience, identify areas for improvement and assess overall satisfaction. You may adopt the following structure."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("stat2024", 1, T, C1, items=[
    it("1. Formulate the hypothesis. Specify the significance level for this test.", 10,
       [("H0: p = 0.40 (proportion preferring new product equals old)", 3), ("H1: p ≠ 0.40 (two-tailed, since 'different')", 3),
        ("Significance level α = 0.05 (stated and justified), critical values ±1.96; conditions np0 = 160, n(1-p0) = 240 ≥ 10, random sample", 4)],
       "Let p be the true proportion of customers who prefer the new product. Null hypothesis H0: p = 0.40 (no difference from the old product). Alternative hypothesis H1: p ≠ 0.40 (the proportion is different - a two-tailed test, because the company asks whether it is 'different', not specifically higher). Significance level: α = 0.05, the conventional level balancing Type I and Type II errors; critical values z = ±1.96. Conditions: the sample is random, and np0 = 400 x 0.4 = 160 and n(1 - p0) = 240 are both at least 10, so the normal approximation to the binomial is valid."),
    it("2. Calculate the test statistic and compare it to its sampling distribution under the null hypothesis by calculating the p-value. What do you conclude at the level of significance decided? (15 + 5 marks)", 20,
       [("p̂ = 180/400 = 0.45", 3), ("SE under H0 = √(0.4 x 0.6/400) = √0.0006 = 0.0245", 4), ("z = (0.45 - 0.40)/0.0245 = 2.04", 4),
        ("p-value = 2 x P(Z > 2.04) = 2 x 0.0207 ≈ 0.041", 4), ("Conclusion: p-value 0.041 < 0.05 (|z| > 1.96) → reject H0; evidence that preference for the new product (45%) differs from 40% - higher; would not reject at α = 0.01", 5)],
       "Sample proportion p̂ = 180/400 = 0.45. Under H0 the standard error is √(p0(1 - p0)/n) = √(0.40 x 0.60/400) = √0.0006 = 0.0245. Test statistic: z = (p̂ - p0)/SE = (0.45 - 0.40)/0.0245 = 2.04. Under H0, z follows approximately the standard normal distribution. p-value (two-tailed) = 2 x P(Z > 2.04) = 2 x (1 - 0.9793) = 2 x 0.0207 ≈ 0.041. Conclusion: since the p-value 0.041 is less than α = 0.05 (equivalently |z| = 2.04 > 1.96), we reject H0. There is statistically significant evidence at the 5% level that the proportion of customers preferring the new product differs from 40%; the sample suggests it is higher (about 45%). The evidence is moderate - at α = 0.01 we would not reject H0."),
    it("3. Construct a 95% confidence interval for the proportion of customers who prefer the new product. Interpret the confidence interval in the context of the study.", 10,
       [("SE = √(0.45 x 0.55/400) = 0.0249; margin = 1.96 x 0.0249 = 0.0488; CI = 0.45 ± 0.049 = (0.401, 0.499)", 6),
        ("Interpretation: 95% confident the true proportion preferring the new product is between about 40.1% and 49.9%; interval just excludes 0.40, consistent with the test", 4)],
       "Using the sample proportion: SE = √(p̂(1 - p̂)/n) = √(0.45 x 0.55/400) = √0.000619 = 0.0249. Margin of error = 1.96 x 0.0249 = 0.0488. 95% CI = 0.45 ± 0.049 = (0.401, 0.499), i.e. about 40.1% to 49.9%. Interpretation: we are 95% confident that the true proportion of all the company's customers who prefer the new product lies between about 40% and 50%. The interval lies (just) above 0.40, which agrees with the test result that the preference differs from 40%, but the lower limit is very close to 40%, so the improvement may be small."),
    it("4. Discuss how increasing the sample size would affect the test statistic and the confidence interval. Also explain why larger sample sizes generally provide more reliable results. (5 + 5 marks)", 10,
       [("Larger n reduces SE (∝ 1/√n): for the same p̂, z becomes larger (more likely significant, more power), CI becomes narrower (more precise)", 5),
        ("Reliability: less sampling variability, estimates closer to true value (law of large numbers), better normal approximation (CLT), higher power/ lower Type II error, more representative - but does not remove bias", 5)],
       "Effect: the standard error √(p(1 - p)/n) falls in proportion to 1/√n. With the same sample proportion of 0.45, a larger n gives a smaller SE and therefore a larger test statistic z (e.g. with n = 1600, SE under H0 = 0.0122 and z ≈ 4.1), a smaller p-value and a more powerful test; the confidence interval becomes narrower (with n = 1600 the margin is about ±0.024 instead of ±0.049), giving a more precise estimate. Why larger samples are more reliable: sampling variability is lower, so estimates are closer to the true population value (law of large numbers); the normal approximation and Central Limit Theorem work better; the test has higher power (lower chance of a Type II error); and the sample is more likely to represent the population's variety. However, a larger sample does not correct bias from poor sampling design or non-response, and very large samples can make tiny, practically unimportant differences statistically significant."),
])
Q += case("stat2024", 2, T, C2, items=[
    it("1. Define the key objectives of the survey.", 5,
       [("Clear objectives: measure overall satisfaction (e.g. CSAT/ NPS), assess user experience (ease of use, speed, reliability, security, features), identify problems/ improvement areas, compare satisfaction across user groups, measure usage patterns and likelihood to recommend", 5)],
       "Objectives: (1) measure overall customer satisfaction with the app (e.g. satisfaction score and Net Promoter Score); (2) assess user experience - ease of registration and navigation, speed, reliability, security and trust, and usefulness of features (transfers, bill payments, QR payments); (3) identify problems and areas for improvement; (4) compare satisfaction across user groups (age, gender, urban/rural, device type, frequency of use); (5) understand usage patterns and reasons for non-use or drop-out; (6) provide evidence for decisions on app updates and customer support."),
    it("2. Design a sampling strategy for the survey: identify the target population; describe the sampling method you would use and justify your choice; explain how you would ensure the sample is representative.", 20,
       [("Target population: all registered/ active users of the app over a defined period (sampling frame from the bank's user database), possibly also inactive users", 5),
        ("Method: stratified random sampling (strata by region, age group, gender, frequency of use/ customer type) with proportional or optimal allocation; justification - frame available, precision, subgroup estimates; sample size calculation (e.g. n = z²p(1-p)/E² = 385, adjusted for non-response)", 10),
        ("Representativeness: complete updated frame, random selection within strata, adequate sample size, follow-ups to reduce non-response, weighting/ post-stratification, compare sample profile with user database", 5)],
       "Target population: all customers registered on the mobile banking app who used it at least once in, say, the last three months (active users), with a separate small sample of registered but inactive users to learn why they stopped. Sampling frame: the bank's database of registered users, which has contact details and characteristics (branch/ region, age, gender, transaction frequency). Method: stratified random sampling - divide users into strata by region (or branch), age group and usage frequency (light, medium, heavy), then select a simple random sample within each stratum with proportional allocation (and oversample small groups such as rural or older users if separate estimates are needed). Justification: the frame exists, so probability sampling is possible; stratification improves precision and guarantees all important groups are included; it is cheaper and faster than a census. Sample size: for a proportion with 95% confidence and ±5% margin, n = 1.96² x 0.5 x 0.5/0.05² ≈ 385; allowing for about 30% non-response and stratum analysis, select about 550-600 users. Ensuring representativeness: use an up-to-date, complete frame; random selection; adequate sample size; multiple reminders and follow-ups to reduce non-response; compare respondents with the user database; and apply weights (design weights and post-stratification) to correct imbalances."),
    it("3. Discuss the potential biases that might affect the survey results and suggest strategies to minimise them.", 5,
       [("Biases: non-response, self-selection, coverage/ frame (excluding inactive or non-smartphone users), response/ social desirability, question wording/ order, recall, interviewer bias", 3),
        ("Strategies: random sampling, reminders/ incentives, weighting, neutral pre-tested questions, anonymity, multiple modes, interviewer training", 2)],
       "Possible biases: non-response bias (dissatisfied or busy customers may not reply); self-selection bias if the survey is just posted in the app; coverage bias (frame missing some users or excluding those who uninstalled); response bias such as social desirability or acquiescence; question wording and order effects; recall bias; and interviewer bias in phone interviews. Strategies: use random probability sampling rather than volunteers; send reminders, use short questionnaires and small incentives; follow up non-respondents and weight the data; pre-test neutral, clear questions with balanced scales; guarantee anonymity and confidentiality; use mixed modes (in-app, SMS link, phone) and train interviewers."),
    it("4. Data collection and analysis plan: explain how you would collect the data; discuss data collection tools; discuss the data entry and pre-processing steps required before performing statistical analysis.", 10,
       [("Collection: mode (online/ in-app questionnaire via link, phone interviews for non-respondents), period, pre-testing/ pilot, structured questionnaire with Likert scales and open questions", 3),
        ("Tools: CAPI/ CATI/ CAWI software (KoboToolbox, ODK, Survey Solutions, Google Forms), with validation checks; analysis software (SPSS, Stata, R)", 3),
        ("Pre-processing: data entry/ export, checking completeness, cleaning (duplicates, out-of-range, inconsistencies), coding open answers, handling missing data, weighting, creating variables/ indices, reliability check (Cronbach's alpha); then descriptive and inferential analysis", 4)],
       "Data collection: a structured questionnaire with sections on usage, satisfaction (5-point Likert scales), specific features, problems faced, likelihood to recommend (0-10 NPS) and open-ended suggestions; pilot-test it on about 30 users and revise. Send the survey link by SMS/email/in-app notification to the sampled users, with telephone interviews for those who do not respond after reminders, over a fixed 3-4 week period. Tools: computer-assisted web interviewing (CAWI) and telephone interviewing (CATI) software such as KoboToolbox, ODK, Survey Solutions or Google Forms, with built-in skip logic and range/consistency checks; analysis in SPSS, Stata, R or Excel. Data entry and pre-processing: export data from the platform (or double-enter paper forms); check completeness and response rates; remove duplicates; check for out-of-range values, inconsistencies and straight-lining; code open-ended responses into themes; handle missing data (imputation or exclusion rules); recode and create derived variables (satisfaction index, NPS categories); apply sampling weights; check scale reliability (Cronbach's alpha); then analyse with descriptive statistics, cross-tabulations by subgroup, chi-square tests or t-tests/ANOVA, and regression to find drivers of satisfaction."),
    it("5. Ethical considerations.", 5,
       [("Informed consent and voluntary participation, confidentiality/ anonymity and data protection (customer data, secure storage), no harm/ no pressure, transparency of purpose, use data only for stated purpose, approval/ permissions, honest reporting", 5)],
       "Ethical considerations: obtain informed consent - explain the purpose, time needed and that participation is voluntary, with the right to skip questions or withdraw; protect confidentiality and anonymity - do not link answers to account details in reports, store data securely with restricted access and follow data protection rules on customer information; avoid harm or pressure (participation must not affect their banking services); use the data only for the stated purpose; obtain the institution's approval; never ask for passwords or PINs (and warn users against phishing); and report results honestly."),
    it("6. Outline an overall work plan for survey administration.", 5,
       [("Phases with timeline and responsibilities: planning (objectives, budget, team), questionnaire design and pre-test, sampling, training, fieldwork/ data collection with monitoring, data processing, analysis, reporting and dissemination (e.g. Gantt chart over ~3 months)", 5)],
       "Work plan (about 12 weeks): Weeks 1-2 - planning: objectives, budget, team and approvals; Weeks 3-4 - questionnaire design, sampling frame and sample selection, programming the tool; Week 5 - pilot test and revision, training of enumerators; Weeks 6-8 - data collection with reminders, phone follow-ups and daily quality monitoring; Weeks 9-10 - data cleaning, weighting and analysis; Weeks 11-12 - report writing, presentation of findings and recommendations to management, and dissemination. Responsibilities, resources and milestones are set out in a Gantt chart."),
])
PATTERN = STANDARD
