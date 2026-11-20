"""ME Technical Paper III (Subject Specialisation Paper), Statistics, BCSE 2025 - real paper (PDF sent by the founder).
Standard pattern. MCQ 1 options were formula images and are re-typed (sampling distribution of the mean). MCQ 20
(PPS - two options are valid reasons) is replaced. SAQ 2 shows the survey figure. Normal probabilities use the standard
normal distribution (students use the tables printed with the paper).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Statistics): BCSE 2025, batch 1"
GROUP_TAG = "stat2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "statistics"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Statistics"

MCQ = r"""[
{
"n": 1,
"stem": "If X1, X2, ………, Xn are independent and identically distributed (iid) normal (µ,s), then",
"opts": [
")",
")",
") d)",
""
]
},
{
"n": 2,
"stem": "A company’s monthly profits (in Ngultrums millions) over six months are: 20, 25, 30, 35, 40, 150. Which statement is TRUE?",
"opts": [
"The mean is greater than the median.",
"The median is greater than the mean.",
"The mode is the best measure.",
"The range is not affected by outliers."
]
},
{
"n": 3,
"stem": "A survey shows 70% of people like tea, 40% like coffee, and 20% like both. What is the probability someone likes neither?",
"opts": [
"0%",
"10%",
"30%",
"50%"
]
},
{
"n": 4,
"stem": "A sample statistic is used to estimate",
"opts": [
"population statistic.",
"sample statistic.",
"sampling error.",
"population parameter."
]
},
{
"n": 5,
"stem": "A customer service team has a 70% success rate in resolving complaints. If they handle 10 cases today, how many are expected to be resolved successfully?",
"opts": [
"3",
"5",
"7",
"10"
]
},
{
"n": 6,
"stem": "What is the key difference between Bayesian and Frequentist approaches to unknown parameters?",
"opts": [
"The Bayesian approach treats the parameter as a random variable with a probability distribution, while the Frequentist treats it as a fixed but unknown constant.",
"The Bayesian approach treats the parameter as a fixed value, while the Frequentist treats it as a random variable.",
"The Frequentist approach updates the parameter as new data becomes available, while the Bayesian approach does not.",
"The Frequentist approach requires prior beliefs, while the Bayesian approach relies only on the observed data."
]
},
{
"n": 7,
"stem": "A researcher computes the interquartile range (IQR) to study variability. What does the IQR represent?",
"opts": [
"The range covering the middle 50% of the observations including extreme values.",
"The average deviation of all values from the median.",
"The difference between the 75th percentile and the 25th percentile values.",
"The total spread of the data excluding the top and bottom 25% values."
]
},
{
"n": 8,
"stem": "Which of the following is NOT an assumption of the classical linear regression model?",
"opts": [
"Linearity",
"Homoscedasticity",
"Multicollinearity",
"No autocorrelation"
]
},
{
"n": 9,
"stem": "Suppose a multiple linear regression model shows an R-squared = 0.92 and Adjusted R-squared = 0.45. What is the best interpretation?",
"opts": [
"Model is perfect.",
"Overfitting due to too many predictors.",
"Predictors are uncorrelated.",
"Residuals are normally distributed."
]
},
{
"n": 10,
"stem": "If a constant is multiplied to every value in a dataset, how does the standard deviation change?",
"opts": [
"It stays the same.",
"It increases by the square of the constant.",
"It increases by the same constant.",
"It becomes zero."
]
},
{
"n": 11,
"stem": "The distribution of wealth in a country is highly right-skewed. Which combination best describes it?",
"opts": [
"Mean < Median < Mode",
"Median = Mode < Mean",
"Mode > Mean > Median",
"Mean > Median > Mode"
]
},
{
"n": 12,
"stem": "Suppose consumer price index rose from 130 to 143 in a year. What is the approximate annual inflation rate?",
"opts": [
"10%",
"9%",
"8%",
"7%"
]
},
{
"n": 13,
"stem": "In a company, 70% of employees know Excel, 40% know Python, and 30% know both. What is the probability that a randomly chosen employee knows Python given that they know Excel?",
"opts": [
"0.30",
"0.40",
"0.43",
"0.70"
]
},
{
"n": 14,
"stem": "A survey reports a 95% confidence interval for a proportion as [0.45, 0.55]. What is the approximate standard error?",
"opts": [
"0.025",
"0.05",
"0.10",
"0.50 House rent varies considerably across regions and housing characteristics. A study is carried out to understand how house rent (in Ngultrum) is influenced by two key factors:"
]
},
{
"n": 15,
"stem": "What does the intercept term of approximately 3007 Ngultrum represent in this model?",
"opts": [
"Average rent in semi-urban areas with 1 room.",
"Predicted rent in rural areas when number of rooms is zero.",
"Starting value for urban houses.",
"Average rent for all areas combined."
]
},
{
"n": 16,
"stem": "If we increase the number of rooms by 3 in a house located in an urban area, what is the expected change in predicted rent compared to a rural house with the same original number of rooms?",
"opts": [
"933.0",
"3971.4",
"7,009.8",
"10,017.0"
]
},
{
"n": 17,
"stem": "If the average number of rooms in semi-urban areas is 4.5, what is the expected mean house rent in semi-urban areas?",
"opts": [
"8,450 Ngultrumss",
"9,533 Ngultrums",
"10,150 Ngultrums",
"12,000 Ngultrums"
]
},
{
"n": 18,
"stem": "In the regression model output, what is the estimated difference in average house rent between urban and rural areas, holding the number of rooms constant?",
"opts": [
"1012.8 Ngultrums",
"3971.4 Ngultrums",
"3007.2 Ngultrums",
"1968.6 Ngultrums"
]
},
{
"n": 19,
"stem": "Which is NOT part of time series components?",
"opts": [
"Trend",
"Seasonal",
"Irregular",
"Outliers"
]
},
{
"n": 20,
"stem": "In a two-stage cluster sample, why is probability proportionate to size (PPS) sampling often used at the first stage?",
"opts": [
"To control the final sample size by accounting for varying cluster sizes",
"To ensure every household has an equal chance of selection",
"To eliminate the need for stratification",
"To reduce the number of clusters needed Answer Question 21 using the boxplot given below."
]
},
{
"n": 21,
"stem": "A boxplot comparing exam scores for two classes shows one box much wider than the other. What does this imply?",
"opts": [
"The class with the wider box had more students.",
"The class with the wider box had higher average scores.",
"The class with the wider box had greater variability in scores.",
"The class with the wider box had more outliers."
]
},
{
"n": 22,
"stem": "If a survey estimate has a coefficient of variation (CV) of 10%, what does this indicate?",
"opts": [
"The estimate deviates from the true value by approximately ±10%.",
"The standard error amounts to 10% of the estimate value.",
"The total width of the confidence interval equals 10% of the estimate.",
"The sampling design has no effect on variance (design effect equals 1.0)."
]
},
{
"n": 23,
"stem": "A researcher increases the significance level (from 0.01 to 0.10). What is the most likely consequence?",
"opts": [
"Decrease in power of the test",
"Decreased chance of detecting real effect",
"Increased risk of Type I error",
"Increased risk of Type II error"
]
},
{
"n": 24,
"stem": "A car manufacturer tests the fuel efficiency (in km/L) of a new model. A sample of 25 cars shows a mean of 18 km/L with a standard deviation of 3 km/L. The company claims the true efficiency exceeds 16 km/L. Which hypothesis test conclusion aligns with a 95% confidence interval?",
"opts": [
"Accept the claim",
"Insufficient data to conclude",
"The CI is irrelevant for hypothesis testing",
"Reject the claim"
]
},
{
"n": 25,
"stem": "A policy analyst uses multivariate regression to assess the impact of education level on income, controlling for gender and location. What is the primary advantage of this approach?",
"opts": [
"Controls for confounding variables",
"Allows extrapolation beyond the sample",
"Avoids the need for sampling weights",
"Ensures normal distribution of residuals"
]
},
{
"n": 26,
"stem": "In a logistic regression predicting program participation (yes/no), What does an odds ratio of 2.0 for income indicate?",
"opts": [
"Higher income groups are twice as likely to participate.",
"Doubling income doubles participation probability.",
"Income has no effect.",
"The model is linear."
]
},
{
"n": 27,
"stem": "ZheyGo observes that delivery times follow a normal distribution with a mean 30 minutes and standard deviation of 10 minutes. What is the chance that a delivery exceeds 50 minutes?",
"opts": [
"About 2.5%",
"About 5%",
"About 16%",
"About 32%"
]
},
{
"n": 28,
"stem": "A survey uses stratified sampling to improve precision. What is a key assumption for stratification to be effective?",
"opts": [
"Strata should be as heterogeneous as possible.",
"Strata should be as homogeneous as possible internally.",
"Strata should have equal sample sizes.",
"Strata should be selected using PPS sampling."
]
},
{
"n": 29,
"stem": "If P(A) = 0.4 and P(B) = 0.5, and A and B are mutually exclusive, then P(A ∪ B) is",
"opts": [
"0.2",
"0.4",
"1.0",
"0.9"
]
},
{
"n": 30,
"stem": "A sampling expert was designing a national household survey is to measure unemployment rates. If urban and rural areas are treated as separate domains, what is the main implication for sample size?",
"opts": [
"The total sample size remains unchanged.",
"The sample size must be doubled.",
"The sample size can be reduced by 50%.",
"Only urban areas need to be sampled."
]
}
]"""

KEY = {
    1: ("d", "The mean of n iid N(µ, σ) variables is N(µ, σ/√n) (standard deviation σ/√n)."), 2: ("a", "The outlier 150 pulls the mean (50) above the median (32.5)."),
    3: ("b", "P(neither) = 1 - (0.7 + 0.4 - 0.2) = 0.1."), 4: ("d", "A sample statistic estimates a population parameter."),
    5: ("c", "Expected value = np = 10 x 0.7 = 7."), 6: ("a", "Bayesians treat parameters as random with a prior; frequentists treat them as fixed."),
    7: ("c", "IQR = Q3 - Q1 (75th minus 25th percentile)."), 8: ("c", "Multicollinearity is a problem, not an assumption (the assumption is no perfect multicollinearity)."),
    9: ("b", "A big gap between R² and adjusted R² suggests too many predictors (overfitting)."), 10: ("c", "SD is multiplied by the (absolute value of the) constant."),
    11: ("d", "Right skew: mean > median > mode."), 12: ("a", "(143 - 130)/130 = 10%."),
    13: ("c", "P(Python | Excel) = 0.30/0.70 = 0.43."), 14: ("a", "Half-width 0.05 = 1.96 x SE, so SE ≈ 0.025."),
    15: ("b", "The intercept is predicted rent for rural (reference) houses with zero rooms."), 16: ("c", "3 x 1012.8 + 3971.4 = 7009.8."),
    17: ("b", "3007.2 + 1012.8 x 4.5 + 1968.6 ≈ 9533."), 18: ("b", "The areaUrban coefficient: 3971.4 more than rural."),
    19: ("d", "Components are trend, seasonal, cyclical and irregular; outliers are not a component."), 21: ("c", "A wider box (larger IQR) means more variability."),
    22: ("b", "CV of an estimate = SE / estimate."), 23: ("c", "A higher alpha increases the risk of Type I error."),
    24: ("a", "95% CI = 18 ± 2.064 x 0.6 = 16.8 to 19.2, entirely above 16: support the claim."), 25: ("a", "Multiple regression controls for confounders."),
    26: ("a", "OR 2: odds of participation double per unit increase in income (higher income, about twice the odds)."), 27: ("a", "z = (50 - 30)/10 = 2; P ≈ 2.3%."),
    28: ("b", "Stratification works best when strata are internally homogeneous."), 29: ("d", "Mutually exclusive: 0.4 + 0.5 = 0.9."),
    30: ("b", "Each domain needs its own adequate sample, roughly doubling the total."),
}
FIX = {1: {"stem": "If X1, X2, ..., Xn are independent and identically distributed (iid) normal(µ, σ), then the sample mean X̄ is distributed as",
           "opts": ["X̄ ~ normal(µ, σ)", "X̄ ~ normal(µ, σ²)", "X̄ ~ normal(µ, σ/n)", "X̄ ~ normal(µ, σ/√n)"]}}
T = TOPIC
Q = mcqs(MCQ, KEY, T, FIX) + [
    new_mcq(1, T, "In a two-stage cluster sample, selecting clusters with probability proportional to size (PPS) and then a fixed number of households per cluster gives", ["Unequal probabilities for households in large clusters", "An approximately self-weighting sample with equal workload per cluster", "A simple random sample of clusters", "A sample with no design effect"], "b",
            "PPS at stage 1 with a fixed take at stage 2 gives every household about the same overall probability and a fixed workload per cluster."),
    saq(1, T, "Describe the advantages and disadvantages of stratified sampling compared with simple random sampling. Each supporting point earns 1 mark.",
        [("Advantages (e.g. more precise estimates when strata homogeneous, separate estimates for strata/ domains, ensures representation of subgroups, administrative convenience, different methods per stratum)", 3), ("Disadvantages (needs a sampling frame with stratification information, more complex design/ analysis and weighting, misclassification, poor gain if strata not homogeneous, costly)", 2)],
        """Advantages: 1. Greater precision (smaller standard errors) than SRS of the same size when strata are internally homogeneous. 2. Ensures every important subgroup (e.g. dzongkhag, urban/rural) is represented. 3. Gives separate estimates for each stratum (domain estimates). 4. Administrative convenience - fieldwork can be organised by stratum, and different sampling methods can be used in different strata.
Disadvantages: 1. Needs a sampling frame with information on the stratification variable for every unit. 2. More complex design and analysis (weights for disproportionate allocation). 3. Little or no gain if strata are not homogeneous, and errors if units are misclassified."""),
    saq(2, T, """The figure was published in The New York Times. The data were from an online survey of 1495 young adults aged 18 to 34. Young adults who said they were not in contact with their living parents were screened out of the survey. The figure shows the percentage of young people who say they reach out to a parent at least once a day or a few times a week, by method (send texts, phone or video-chat, visit in person), for young men and young women.
a) What do you notice? (2 marks)
b) How does this relate to you and your community? (2 marks)
c) Create a catchy headline that captures the figure's main idea. (1 mark)""",
        [("a) Observations: texting most common (~50% men, ~70% women), then calls (~35% vs 55%), visits least (~20% vs 26%); women contact more by every method; gender gap largest for texting/calls; note survey limitations (online, screened out no-contact)", 2), ("b) Relating to own community: Bhutanese young people, migration to Thimphu/abroad (Australia), digital communication, family values, gender roles", 2), ("c) Catchy headline capturing gender gap/ texting", 1)],
        """a) Texting is the most common way young adults contact parents frequently (about 50% of young men and about 70% of young women), then phone or video calls (about 35% and 55%), while in-person visits are least common (about 20% and 26%). Young women reach out more than young men by every method, and the gap is largest for texting and calls, smallest for visits. Limitations: an online, self-reported survey that excluded those not in contact with parents, so it overstates contact for all young adults.
b) Many young Bhutanese live away from parents - in Thimphu, other towns or abroad (e.g. Australia) - so they rely on WeChat, WhatsApp and calls rather than visits; daughters often keep closer contact than sons, while family values encourage regular contact; a similar survey here could inform programmes for elderly parents living alone.
c) Example: "Thumbs over doorsteps: young women text Mum and Dad far more than young men - but few visit.\""""),
    saq(3, T, """A total of 3000 graduates sat the Bhutan Civil Service Examination 2024. Assuming the exam marks followed a normal distribution with mean 55 and standard deviation 8:
a) What proportion of graduates scored less than 60? (1 mark)
b) What proportion of graduates scored between 45 and 65? (2 marks)
c) If a 'High Achiever' tag is awarded to graduates scoring at least 70, how many examinees will receive it? (2 marks)""",
        [("a) z = 0.625, P ≈ 0.734 (73.4%)", 1), ("b) z = ±1.25, P ≈ 0.789 (78.9%)", 2), ("c) z = 1.875, P ≈ 0.0304, number ≈ 91", 2)],
        """a) z = (60 - 55)/8 = 0.625; P(Z < 0.625) ≈ 0.734, so about 73.4% scored below 60.
b) z1 = (45 - 55)/8 = -1.25, z2 = (65 - 55)/8 = 1.25; P(-1.25 < Z < 1.25) = 2 x 0.8944 - 1 ≈ 0.789, so about 78.9%.
c) z = (70 - 55)/8 = 1.875; P(Z ≥ 1.875) ≈ 0.0304; number = 0.0304 x 3000 ≈ 91 graduates."""),
    saq(4, T, """Consider a simple random sample of size n drawn from a large population in which the true proportion with a certain characteristic is p. Let p̂ = X/n be the sample proportion, where X is the number in the sample with the characteristic.
a) Derive E(p̂). (2 marks)
b) Derive Var(p̂). (2 marks)
c) If p = 0.3 and n = 200, calculate the standard error of p̂. (1 mark)""",
        [("a) X ~ Binomial(n, p), E(X) = np, so E(p̂) = np/n = p (unbiased)", 2), ("b) Var(X) = np(1 - p), Var(p̂) = Var(X)/n² = p(1 - p)/n", 2), ("c) SE = √(0.3 x 0.7/200) = √0.00105 ≈ 0.0324", 1)],
        """a) X is the number of successes in n independent trials with probability p, so X ~ Binomial(n, p) with E(X) = np (sum of n Bernoulli variables each with mean p). Then E(p̂) = E(X/n) = E(X)/n = np/n = p, so p̂ is an unbiased estimator of p.
b) Var(X) = np(1 - p) (sum of n independent Bernoulli variances p(1 - p)). Var(p̂) = Var(X/n) = Var(X)/n² = np(1 - p)/n² = p(1 - p)/n.
c) SE(p̂) = √(p(1 - p)/n) = √(0.3 x 0.7 / 200) = √0.00105 ≈ 0.0324."""),
]
C1 = """Case I: Public support for a ban on single-use plastics
The Department of Environment and Climate Change under the Ministry of Energy and Natural Resources (MoENR) has been advocating a nationwide ban on single-use plastics. It claims that at least 60% of residents support the measure. A local researcher surveyed 400 randomly selected residents, and only 226 supported the ban. The Department wants to check whether the survey data challenge its belief. Use the standard normal distribution where necessary."""
C2 = """Case II: Unemployment and crime
The National Statistics Bureau is studying whether unemployment in regions is related to the number of crimes reported, where Y = number of crimes reported and X = unemployment rate (%) in the region. A simple linear regression model is used at α = 0.05. Summary output (R):
lm(formula = crime_reported ~ unemployment_rate, data = data)
Residuals: Min -56.862, 1Q -14.015, Median 0.271, 3Q 13.115, Max 68.145
Coefficients: (Intercept) estimate 50.9485, SE 1.4837, t 34.34, p < 2e-16; unemployment_rate estimate 7.9352, SE 0.1225, t 64.77, p < 2e-16
Residual standard error: 20.04 on 998 degrees of freedom. Multiple R-squared: 0.8078, adjusted R-squared: 0.8076. F-statistic: ? on ? and ? DF, p-value < 2.2e-16."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("stat2025", 1, T, C1, items=[
    it("a) Formulate hypotheses for testing whether less than 60% of the population supports the ban. Is this a one-sided or two-sided test? Justify. (2 + 2 marks)", 4,
       [("H0: p = 0.60 (or ≥ 0.60); H1: p < 0.60", 2), ("One-sided (left-tailed) because the question is only whether support is less than 60%", 2)],
       "H0: p = 0.60 (support is at least 60%) versus H1: p < 0.60. It is a one-sided (left-tailed) test, because we only want to know whether support is lower than the Department's claim; values above 60% would not challenge it."),
    it("b) Use the survey data to test the hypotheses at the 5% significance level. Calculate the test statistic and compare it with its sampling distribution under H0 by calculating the p-value. (6 + 2 marks)", 8,
       [("p̂ = 226/400 = 0.565", 1), ("SE under H0 = √(0.6 x 0.4/400) = 0.0245", 2), ("z = (0.565 - 0.60)/0.0245 = -1.43", 3), ("p-value = P(Z < -1.43) ≈ 0.077 > 0.05", 2)],
       "Sample proportion p̂ = 226/400 = 0.565. Under H0, SE = √(p0(1 - p0)/n) = √(0.6 x 0.4 / 400) = √0.0006 = 0.0245. Test statistic z = (p̂ - p0)/SE = (0.565 - 0.600)/0.0245 = -1.43. (np0 = 240 and n(1 - p0) = 160 are large, so the normal approximation is valid.) p-value = P(Z < -1.43) ≈ 0.0766. Since 0.077 > 0.05, the result is not significant at 5%."),
    it("c) Based on (b), what do you conclude? Explain in plain language what this means for public support. (1 + 2 marks)", 3,
       [("Fail to reject H0 at 5%", 1), ("Plain language: the survey (56.5%) is lower than 60% but the difference could be due to chance; not enough evidence that support is below 60%; claim not disproved (though not proven)", 2)],
       "We fail to reject H0 at the 5% level. Although only 56.5% of the sample supported the ban, this shortfall from 60% could easily happen by chance in a sample of 400, so the survey does not give strong enough evidence that support is below 60%. The Department's claim is not disproved - but neither is it proven; the evidence is borderline (p ≈ 0.08)."),
    it("d) If the critical region approach is used, what do you conclude? Show your results. (3 marks)", 3,
       [("Critical value z = -1.645 for left-tailed 5%; rejection region z < -1.645", 1.5), ("z = -1.43 > -1.645, not in rejection region, fail to reject H0", 1.5)],
       "For a left-tailed test at α = 0.05 the critical value is z = -1.645, so the rejection region is z < -1.645. The calculated z = -1.43 does not fall in this region (-1.43 > -1.645), so we fail to reject H0 - the same conclusion as the p-value approach."),
    it("e) Construct a 95% confidence interval for the true population proportion supporting the ban. Interpret it. Does it support or contradict your decision in (c)? (6 + 3 + 1 marks)", 10,
       [("SE = √(0.565 x 0.435/400) = 0.0248", 2), ("CI = 0.565 ± 1.96 x 0.0248 = 0.565 ± 0.049 → (0.516, 0.614)", 4), ("Interpretation: 95% confident true support between about 51.6% and 61.4% (method captures p in 95% of samples)", 3), ("Contains 0.60 so consistent with failing to reject", 1)],
       "SE = √(p̂(1 - p̂)/n) = √(0.565 x 0.435 / 400) = √0.000614 = 0.0248. 95% CI = 0.565 ± 1.96 x 0.0248 = 0.565 ± 0.0486 → (0.516, 0.614), i.e. about 51.6% to 61.4%. Interpretation: we are 95% confident that between about 52% and 61% of all residents support the ban - if we repeated the survey many times, 95% of such intervals would contain the true proportion. Since the interval includes 0.60, it supports the decision not to reject the claim (a majority supports the ban, but it may be below 60%)."),
    it("f) Suppose a policymaker believes that actual support differs from 60%. Formulate the null and alternative hypotheses, recalculate the test statistic and p-value at the 5% level, and draw a conclusion. (2 + 6 + 2 marks)", 10,
       [("H0: p = 0.60; H1: p ≠ 0.60 (two-sided)", 2), ("z = -1.43 (same); two-sided p-value = 2 x 0.0766 ≈ 0.153; critical ±1.96", 6), ("Fail to reject H0 - no evidence support differs from 60%", 2)],
       "H0: p = 0.60; H1: p ≠ 0.60 (two-sided). The test statistic is unchanged: z = (0.565 - 0.60)/0.0245 = -1.43. Two-sided p-value = 2 x P(Z < -1.43) = 2 x 0.0766 ≈ 0.153 (critical values ±1.96). Since 0.153 > 0.05 (and |z| < 1.96), we fail to reject H0: there is no significant evidence that support differs from 60%."),
    it("""g) The sample of 400 was drawn from a small region with only 2000 adult residents (a 20% sampling fraction), so a finite population correction (FPC) should be applied to the standard error. Test again whether the true proportion is less than 60% at the 5% level.
(i) Recalculate the standard error using the FPC. (3 marks)
(ii) Compute the new z-statistic using the corrected standard error. (5 marks)
(iii) Does this change the decision to reject or fail to reject H0? (1 mark)
(iv) Briefly explain how the FPC changes the interpretation or reliability of the results. (3 marks)""", 12,
       [("(i) FPC = √((N - n)/(N - 1)) = √(1600/1999) = 0.8947; SE = 0.0245 x 0.8947 = 0.0219", 3), ("(ii) z = (0.565 - 0.60)/0.0219 = -1.60", 5), ("(iii) p ≈ 0.055 > 0.05 (or -1.60 > -1.645): still fail to reject, but borderline", 1), ("(iv) FPC reduces SE because a large fraction sampled gives more information; more precise, stronger evidence (p smaller), but decision unchanged; ignoring FPC is conservative", 3)],
       """(i) FPC = √((N - n)/(N - 1)) = √((2000 - 400)/1999) = √0.8004 = 0.8947. Corrected SE = 0.0245 x 0.8947 = 0.0219.
(ii) z = (0.565 - 0.600)/0.0219 = -1.60.
(iii) p-value = P(Z < -1.60) ≈ 0.055 (and -1.60 > -1.645), so we still fail to reject H0 at 5%, though it is now very close to the boundary.
(iv) When a large share of a small population is sampled, there is less uncertainty about the population, so the FPC reduces the standard error and gives a more precise, more reliable test; the z-statistic becomes larger in magnitude and the p-value smaller, making the evidence against the 60% claim stronger (borderline) even though the decision does not change. Ignoring the FPC overstates uncertainty (a conservative test)."""),
])
Q += case("stat2025", 2, T, C2, items=[
    it("a) What are the estimated coefficients of the regression model? Write the regression equation based on the fitted model. (2 + 5 marks)", 7,
       [("Intercept 50.9485, slope 7.9352", 2), ("Equation: predicted crimes = 50.9485 + 7.9352 x unemployment rate (%)", 5)],
       "Estimated intercept β0 = 50.9485; estimated slope β1 = 7.9352. Fitted equation: Ŷ (predicted number of crimes) = 50.9485 + 7.9352 X, where X is the unemployment rate (%)."),
    it("b) Interpret the estimated regression coefficients. Is the intercept meaningful in this context? (4 + 4 + 2 marks)", 10,
       [("Slope: each 1 percentage point increase in unemployment is associated with about 7.94 more crimes on average", 4), ("Intercept: predicted about 51 crimes when unemployment is 0%", 4), ("Meaningful? Only if 0% unemployment is within/near the data range; usually extrapolation, so limited meaning; association not causation", 2)],
       "Slope (7.9352): for each one-percentage-point increase in the unemployment rate, the number of crimes reported increases by about 7.9 on average (association, not necessarily causation). Intercept (50.9485): the predicted number of crimes in a region with 0% unemployment is about 51. Meaningfulness: the intercept is only meaningful if regions with near-zero unemployment exist in the data; since zero unemployment is unrealistic and likely outside the observed range, it is mainly a mathematical anchor for the line and should be interpreted with caution (extrapolation)."),
    it("c) How well does the model fit? Explain briefly in layperson's terms. (3 + 2 marks)", 5,
       [("R² = 0.808: about 81% of variation in crimes explained by unemployment; adjusted 0.8076; residual SE 20 crimes", 3), ("Layperson: unemployment is a strong predictor - knowing it lets us predict crime fairly well, though about 19% depends on other factors; typical prediction error about 20 crimes", 2)],
       "R-squared = 0.8078 (adjusted 0.8076): about 81% of the variation in crimes reported across regions is explained by the unemployment rate - a strong fit; the residual standard error is about 20 crimes. In plain words: regions with higher unemployment clearly tend to have more crime, and knowing a region's unemployment rate lets us predict its crime level fairly well, typically within about 20 crimes; the remaining 19% of differences are due to other factors."),
    it("""d) You wish to test whether there is a statistically significant relationship between unemployment and crime.
(i) State the null and alternative hypotheses for the slope. (2 marks)
(ii) Using the summary output, give the p-value and interpret it at the 5% level. (2 marks)
(iii) State your conclusion. (1 mark)""", 5,
       [("(i) H0: β1 = 0; H1: β1 ≠ 0", 2), ("(ii) p < 2e-16 (t = 64.77), far below 0.05 - extremely unlikely if no relationship", 2), ("(iii) Reject H0: significant positive relationship", 1)],
       "(i) H0: β1 = 0 (no linear relationship); H1: β1 ≠ 0. (ii) The p-value for the slope is < 2 x 10^-16 (t = 64.77), far below 0.05 - such a strong relationship would almost never be seen by chance if there were truly none. (iii) Reject H0: there is a statistically significant positive relationship between unemployment rate and crimes reported."),
    it("e) Predict the number of crimes in region A with a 10% unemployment rate. If the actual number of crimes was 130, calculate the residual and interpret it. (3 + 5 marks)", 8,
       [("Prediction: 50.9485 + 7.9352 x 10 = 130.30", 3), ("Residual = 130 - 130.30 = -0.30", 3), ("Interpretation: actual crimes slightly fewer (by 0.3) than predicted - model very accurate for this region", 2)],
       "Predicted Ŷ = 50.9485 + 7.9352 x 10 = 130.30 crimes. Residual = actual - predicted = 130 - 130.30 = -0.30. The region had about 0.3 fewer crimes than the model predicts - a very small error, so the model fits this region very well (it is almost exactly on the regression line)."),
    it("f) List any two key assumptions of simple linear regression. Explain briefly how you would check them using diagnostic plots.", 7,
       [("Two assumptions named (linearity, independence, homoscedasticity, normality of residuals)", 3), ("Diagnostic checks explained: residuals vs fitted (no pattern = linear, constant spread), normal Q-Q plot (points on line), scale-location plot, residuals vs leverage/ order for independence", 4)],
       "1. Linearity and constant variance (homoscedasticity): the relationship between X and Y is linear and the residual spread is the same at all fitted values. Check with a residuals-versus-fitted plot (and scale-location plot): residuals should scatter randomly around zero with no curve and no funnel shape. 2. Normality of residuals: check with a normal Q-Q plot - points should lie close to the straight line (or a histogram of residuals should be bell-shaped). (Also independence of errors - residuals vs order/Durbin-Watson; and influential points - residuals vs leverage with Cook's distance.)"),
    it("""g) Fill in the ANOVA table using the summary output (hint: use the summary output). Response: crime_reported.
Source | Degrees of freedom | Sum of squares | Mean square | F statistic
Model (regression) | i | iv | vi | viii
Residual (error) | ii | v | vii |
Total | iii | 2 085 123 | |""", 8,
       [("df: i = 1, ii = 998, iii = 999", 2), ("SS: iv (model) = R² x SST ≈ 1 684 362; v (residual) ≈ 400 761 (or 20.04² x 998 ≈ 400 798)", 3), ("MS: vi = 1 684 362; vii ≈ 401.6", 2), ("F: viii ≈ 4195 (= t² = 64.77²)", 1)],
       """i) Model df = 1 (one predictor); ii) residual df = 998 (given); iii) total df = 999 (n = 1000).
iv) Model SS = R² x total SS = 0.8078 x 2 085 123 ≈ 1 684 362.
v) Residual SS = 2 085 123 - 1 684 362 ≈ 400 761 (check: 20.04² x 998 ≈ 400 798).
vi) Model MS = 1 684 362 / 1 = 1 684 362.
vii) Residual MS = 400 761 / 998 ≈ 401.6 (= 20.04²).
viii) F = 1 684 362 / 401.6 ≈ 4195 on 1 and 998 df (equal to t² = 64.77² ≈ 4195), p < 2.2e-16."""),
])
for q in Q:
    if q["key"] == "S2": q["image"] = "/papers/me/tech3-stat-2025-parents-contact.png"
PATTERN = STANDARD
