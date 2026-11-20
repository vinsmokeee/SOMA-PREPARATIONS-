"""ME Technical Paper II (General Subject Knowledge), STATISTICS group, BCSE 2025 - real paper. PDF sent by the founder.
Pattern: Part I 70 MCQ x 1; Part II 6 compulsory questions x 5 (some in parts). 90 min + 15 min reading.
Left out (more than one defensible answer): MCQ 8 (definition of bias), 13, 24, 46, 61; five new MCQs keep Part I at 70.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Statistics): BCSE 2025, batch 1"
GROUP_TAG = "stat2025"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "statistics"
MIN_WORDS = 0
GROUP_TIMING = {"duration": 90, "reading": 15, "max_marks": 100}
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper II, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 6, "marks_each": 5, "answer_any": None},
]
TOPIC = "Statistics: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following best defines high-quality data in statistical practice?",
"opts": [
"Data that is consistent with previous studies and expectations.",
"Data that is large in volume, regardless of how it was collected.",
"Data that is fit for purpose.",
"Data that has minimal variation and outliers."
]
},
{
"n": 2,
"stem": "A company records the time (in seconds) taken by employees to complete a task. Which level of measurement does this represent?",
"opts": [
"Nominal",
"Ordinal",
"Interval",
"Ratio"
]
},
{
"n": 3,
"stem": "Which of the following is NOT true about the population “mean”?",
"opts": [
"A fixed quantity",
"A parameter",
"A random quantity",
"Unknown, but what we want to know"
]
},
{
"n": 4,
"stem": "How can \"Information is Power\" be misused statistically?",
"opts": [
"By using small sample sizes to misrepresent trends",
"By ensuring transparent data analysis",
"By always using median over mean",
"By avoiding data visualization."
]
},
{
"n": 5,
"stem": "A researcher submits a formal request to the National Statistics Office for access to individual-level census data, including names and addresses, for a housing study. The office rejects the request because",
"opts": [
"disclosing identifiable data would breach confidentiality obligations.",
"the census was funded by government, and only officials can use the data.",
"only aggregated data has legal standing in academic publications.",
"the data may not yet be cleaned or processed for public use."
]
},
{
"n": 6,
"stem": "Which of the following cannot be used to calculate a meaningful average?",
"opts": [
"Age",
"Monthly income",
"Blood group type",
"Exam score"
]
},
{
"n": 7,
"stem": "Suppose the scores of the 10 graduates in the Bhutan Civil Service Examination 2024 are independent and identically distributed, following a normal distribution with a mean of 55 and a standard deviation of 4. Then, the Pr(X̄ > 57) is",
"opts": [
"approximately 5.7%",
"approximately 30.9%",
"approximately 69.2%",
"approximately 94.3%"
]
},
{
"n": 8,
"stem": "Which of the following is TRUE about the Bias in statistics?",
"opts": [
"Bias is the difference between sample standard deviation and the population mean.",
"Bias is the difference between the estimate and the estimand.",
"Bias is the average estimation error across infinitely many random samples.",
"Bias is the average deviation of an individual data point from the sample mean."
]
},
{
"n": 9,
"stem": "P-hacking is an example of",
"opts": [
"ethical use of information.",
"misusing statistical significance for false conclusions.",
"always using p < 0.05.",
"ignoring data entirely."
]
},
{
"n": 10,
"stem": "A researcher observes a strong correlation between ice cream sales and drowning deaths. However, a reviewer points out that both tend to rise during hotter months. What type of bias is most likely present in this analysis?",
"opts": [
"Measurement error — drowning deaths may be inaccurately reported.",
"Omitted variable bias — temperature influences both variables.",
"Selection bias — the dataset may exclude colder months.",
"Survivorship bias — only summer incidents are being analyzed."
]
},
{
"n": 11,
"stem": "You are preparing for a nationwide household Labour Force Survey. During a stakeholder consultation, Dzongkhag Planning Officers request data disaggregated by dzongkhag to support evidence-based planning and monitoring. What key factor must be ensured in the sample design to meet this request?",
"opts": [
"Assign only open-ended questions to allow for diverse responses at the dzongkhag level.",
"Design longer questionnaires specifically tailored for each dzongkhag.",
"Include dzongkhag-level stratification in sample design.",
"Use a two-phase sampling method to reduce the sample size while improving coverage."
]
},
{
"n": 12,
"stem": "If A and B are mutually exclusive events, then P(A ∩ B) is",
"opts": [
"0",
"0.5",
"1",
"None of above"
]
},
{
"n": 13,
"stem": "A scatter plot of ‘Car Weight vs. Fuel Efficiency’ shows a downward trend. A student concludes heavier cars are less efficient. What is wrong?",
"opts": [
"Correlation does not imply causation.",
"The plot does not account for differences in car types (e.g., SUVs vs. sedans).",
"The observed trend could be due to model year differences rather than weight alone.",
"The fuel efficiency axis might be measured differently (e.g., city vs. highway), affecting the interpretation."
]
},
{
"n": 14,
"stem": "In a survey of shoe sizes among staff at the National Statistics Bureau, the most common shoe size was 40. This value is best described as",
"opts": [
"mean.",
"median.",
"mode.",
"range."
]
},
{
"n": 15,
"stem": "Why is it important to pretest a survey questionnaire?",
"opts": [
"To determine the final survey cost and allocate budget accordingly",
"To detect unclear wording and ensure questions are interpreted as intended by respondents",
"To replace the need for interviewer training through practice during pretesting",
"To verify if respondents can complete the survey within the expected time limit"
]
},
{
"n": 16,
"stem": "You want to compare two variables: household size and level of satisfaction with local services. What are their respective data types?",
"opts": [
"Ratio and Nominal",
"Interval and Ordinal",
"Ordinal and Nominal",
"Ratio and Ordinal"
]
},
{
"n": 17,
"stem": "A policymaker questions the purpose behind government investment in national statistical systems. You responded by emphasizing that official statistics are not just technical outputs but play a vital role in democratic governance. What is the primary reason for compiling and disseminating official statistics?",
"opts": [
"To collect data solely for academic use",
"To ensure government ministries have access to tax records",
"To uphold citizens’ right to access public information",
"To minimize the cost of maintaining administrative data systems"
]
},
{
"n": 18,
"stem": "Which of the following is NOT TRUE about unbiasedness in statistical inference?",
"opts": [
"An unbiased estimator always has the smallest possible variance.",
"Unbiasedness is silent on how close the estimate is to the truth in any given sample.",
"For a nonlinear function of a parameter, an unbiased estimator is typically not unbiased for that function.",
"Unbiasedness does not guarantee accuracy in every sample, only on average across repeated samples."
]
},
{
"n": 19,
"stem": "Which of the following cannot be directly interpreted from a boxplot?",
"opts": [
"Median",
"Presence of outliers",
"Spread of middle 50%",
"Mean"
]
},
{
"n": 20,
"stem": "A policy analyst uses a 95% confidence interval for the difference in crime rates between two neighborhoods: [−2.1, 0.8]. What should they conclude?",
"opts": [
"Crime is significantly higher in the first neighborhood.",
"Crime is significantly lower in the first neighborhood.",
"There is no significant difference.",
"The sample size is too small."
]
},
{
"n": 21,
"stem": "Two dzongkhags have the same mean household size of 4, but dzongkhag A has a standard deviation of 0.5 and dzongkhag B has 2. What can be inferred?",
"opts": [
"District A has more variation in family sizes.",
"District B has more consistent household sizes.",
"District A has more consistent household sizes.",
"Both districts have identical distributions."
]
},
{
"n": 22,
"stem": "A histogram is constructed using very wide class intervals. What is the most likely consequence?",
"opts": [
"The histogram may falsely suggest a uniform distribution.",
"Extreme values will become more prominent.",
"The shape will appear more symmetrical than it actually is.",
"Important patterns or data variation may be obscured."
]
},
{
"n": 23,
"stem": "What is the main limitation of using administrative records as a data source for household surveys?",
"opts": [
"They are always up-to-date.",
"They may lack standardized definitions and have coverage gaps.",
"They eliminate the need for sampling.",
"They are more accurate than survey data."
]
},
{
"n": 24,
"stem": "A health ministry observes that areas with more hospitals also report higher numbers of illnesses. Which of the following interpretation best explains this pattern?",
"opts": [
"Areas with more hospitals tend to have better reporting systems for illnesses.",
"Higher population density may contribute to both more hospitals and more reported illnesses.",
"Hospitals are likely placed in areas with greater demand for healthcare.",
"Hospitals increase disease detection, inflating reported illness rates"
]
},
{
"n": 25,
"stem": "Which of the following is NOT a component of data stewardship?",
"opts": [
"Data acquisition",
"Data de-identification",
"Data storage",
"Data marketing strategies"
]
},
{
"n": 26,
"stem": "An e-commerce platform aims to recommend products based on customer behavior. Which method best supports this goal?",
"opts": [
"Analyzing overall monthly revenue to adjust stock.",
"Broadcasting identical promotions to all customers.",
"Ranking items based on sporadic user reviews.",
"Examining clickstreams and browsing history to suggest tailored products."
]
},
{
"n": 27,
"stem": "A policymaker noticed that higher literacy rates tend to coincide with lower poverty levels across districts. Which statistical concept is most appropriate to examine this relationship?",
"opts": [
"Autocorrelation",
"Correlation",
"Extrapolation",
"Regression"
]
},
{
"n": 28,
"stem": "A company tests a new pricing strategy in Region A but not Region B. Sales rise in Region A. The CEO claims that the strategy worked. What is the key counterfactual question to assess causality?",
"opts": [
"What would Region A’s sales have been without the strategy?",
"Did Region B’s sales also rise?",
"Is the strategy cost-effective?",
"Are the regions statistically identical?"
]
},
{
"n": 29,
"stem": "A farmer is evaluating different fertilizers. She records the number of plants that survive out of 100 trials. What is the random variable?",
"opts": [
"Number of surviving plants",
"Brand of fertilizer",
"Type of crop",
"Weather condition"
]
},
{
"n": 30,
"stem": "Suppose the Gini index remains unchanged, but the poverty rate declines. What does this imply about income distribution?",
"opts": [
"Income inequality has improved.",
"The poor are benefiting equally with others.",
"The gap between rich and poor has widened.",
"The poor are earning more, but inequality persists."
]
},
{
"n": 31,
"stem": "A survey shows an increase in mobile phone ownership but a drop in school enrollment. Which statement is most accurate?",
"opts": [
"Living standard is increasing due to digital access.",
"Poverty is decreasing since gadgets are affordable.",
"There may be inequality in dimensions of well-being.",
"Unemployment is likely falling."
]
},
{
"n": 32,
"stem": "In order to build public trust and ensure the effective use of official statistics, why is it essential for statistical agencies to openly disclose their methods and procedures?",
"opts": [
"To comply with international treaties that mandate transparency and data sharing",
"To enable users to correctly interpret and assess the quality of the data provided",
"To minimize the time and effort required from survey respondents during data collection",
"To safeguard confidential information and prevent unauthorized access or leaks"
]
},
{
"n": 33,
"stem": "In an increasingly interconnected world, why is it important for national statistical agencies to adopt internationally recognized methodologies when producing official statistics?",
"opts": [
"To align with global standards for comparability and efficiency",
"To simplify translation of reports for global audiences",
"To reduce reliance on domestic data sources",
"To delegate statistical work to international organizations"
]
},
{
"n": 34,
"stem": "A study estimates average travel time to the nearest hospital as 75 minutes with a 95% confidence interval of (50, 100). The policy goal is to reduce time to under 60 minutes. What is the implication?",
"opts": [
"The mean meets the goal.",
"The interval suggests the goal is not certainly achieved.",
"The sample overestimated true travel time.",
"Travel time varies due to measurement error."
]
},
{
"n": 35,
"stem": "A researcher includes ZIP codes as a numeric variable in a regression model to predict income levels. What is the primary concern with this approach?",
"opts": [
"ZIP codes are interval data and may not be linear.",
"ZIP codes lack a natural zero, making interpretation difficult.",
"ZIP codes are ordinal and should be analyzed as rankings.",
"ZIP codes are categorical identifiers, not quantitative values."
]
},
{
"n": 36,
"stem": "If all values in a dataset are increased by 5, how does the standard deviation change?",
"opts": [
"Increases",
"Decreases",
"Stays the same",
"Becomes zero"
]
},
{
"n": 37,
"stem": "The sum of deviations from the mean is always",
"opts": [
"maximum.",
"minimum.",
"negative.",
"zero."
]
},
{
"n": 38,
"stem": "A national statistics office is planning a nationwide Labour Force Survey but faces constraints in both budget and time. To ensure cost-effectiveness without compromising data quality, which of the following approaches should they adopt?",
"opts": [
"Conduct a census covering all topics.",
"Extend the questionnaire to reduce variance.",
"Limit survey to large urban areas only.",
"Use a probability-based household survey."
]
},
{
"n": 39,
"stem": "In the aftermath of a natural disaster, which technique would best support real-time emergency response?",
"opts": [
"Downloading weather updates once a day",
"Reviewing historical disaster records for trends",
"Summarizing satellite images on a weekly basis",
"Using live sensor data and satellite streams for immediate decision-making"
]
},
{
"n": 40,
"stem": "If the consumer price index of a country is consistently rising, what economic phenomenon is most likely occurring?",
"opts": [
"Deflation",
"Depression",
"Inflation",
"Recession"
]
},
{
"n": 41,
"stem": "According to the axioms of probability, the probability of any event is",
"opts": [
"always greater than 1.",
"always less than 0.",
"equal to zero only.",
"between 0 and 1 inclusive."
]
},
{
"n": 42,
"stem": "A survey manager wants to ensure that interviewers do not skip sensitive questions near the end of the questionnaire. What should be done to help reduce item non-response?",
"opts": [
"Train interviewers to follow skip patterns.",
"Leave sensitive items blank to avoid discomfort.",
"Make all sensitive questions open-ended.",
"Use only mail-in questionnaires for such items."
]
},
{
"n": 43,
"stem": "Sonam scored within the top 25% of the Preliminary Examinations 2024. This means Sonam’s score is",
"opts": [
"above the mean.",
"above the median.",
"above the first quartile.",
"above the third quartile."
]
},
{
"n": 44,
"stem": "A data entry operator mistakenly enters “35” instead of “53” for a respondent’s age. What is the most appropriate term for this error?",
"opts": [
"Processing error",
"Entry bias",
"Interviewer bias",
"Sampling error"
]
},
{
"n": 45,
"stem": "Civil service statistics show the following age distribution of civil servants: Mean = 50, Median = 45, Mode = 40. What is the likely shape of the distribution?",
"opts": [
"Symmetric",
"Right-skewed",
"Left-skewed",
"Uniform"
]
},
{
"n": 46,
"stem": "A statistician compares the mean monthly expenditure of two regions. Region A has a lower mean but much higher standard deviation. What does this suggest?",
"opts": [
"Region A’s spending amounts are generally closer to the average despite lower mean.",
"Region B’s expenditures are more consistently spread around a higher mean.",
"The comparison is inconclusive without knowing the median values.",
"Region A has higher inequality in spending."
]
},
{
"n": 47,
"stem": "A retailer observes a consistent increase in sales every November and December over the past five years. Which component of time series is most likely responsible for this pattern?",
"opts": [
"Cyclical variation",
"Irregular variation",
"Random noise",
"Seasonal variation"
]
},
{
"n": 48,
"stem": "In a survey, the income of households is used to predict education attainment. Which statistical tool is most suitable for this?",
"opts": [
"Chi-square test",
"Correlation matrix",
"Linear regression",
"T-test for proportions"
]
},
{
"n": 49,
"stem": "A program evaluation found an average reduction in stunting from 35% to 25%. What would help determine if this change is due to the program or random chance?",
"opts": [
"Hypothesis testing",
"Confidence level",
"Experimental design",
"Sampling fraction"
]
},
{
"n": 50,
"stem": "In a survey, a respondent gives answers they believe the interviewer wants to hear. This is an example of",
"opts": [
"frame error.",
"measurement bias.",
"sampling error.",
"systematic variance."
]
},
{
"n": 51,
"stem": "Events A, B, and C are mutually exclusive if and only if",
"opts": [
"all three events occur at the same time.",
"at least two of the events occur simultaneously.",
"the occurrence of any one event prevents all others from occurring.",
"exactly one of the events occurs."
]
},
{
"n": 52,
"stem": "A coffee machine dispenses liquid with mean 200 ml and SD 5 ml. What proportion of cups contain between 190 ml and 210 ml?",
"opts": [
"Approximately 34%",
"Approximately 68%",
"Approximately 95%",
"Exactly 100%"
]
},
{
"n": 53,
"stem": "In surveys, what does the process of “data cleaning” primarily involve?",
"opts": [
"Discarding entries with partial or missing responses to ensure a clean dataset",
"Reviewing and resolving anomalies, inconsistencies, and potential entry errors to improve data quality",
"Filtering the dataset to a smaller, more reliable subset for quicker analysis",
"Preparing hard copies of the survey forms in an organized format for archival and reporting purposes"
]
},
{
"n": 54,
"stem": "The National Statistics Bureau wants to estimate the average monthly income of citizens using survey data. Which statistical concept is most appropriate for this task?",
"opts": [
"Correlation analysis",
"Hypothesis testing",
"Time-series modeling",
"Parameter estimation"
]
},
{
"n": 55,
"stem": "When estimating the poverty rate for planning, the sample standard error is 1.2%. What does this standard error represent?",
"opts": [
"The average amount by which the estimated poverty rate varies from the poverty rate across repeated samples.",
"The percentage of poor households in the sample.",
"The probability that poverty rate is exactly 1.2%.",
"The amount of variability in poverty levels among households."
]
},
{
"n": 56,
"stem": "A dzongkhag education survey has a confidence interval of (52%, 66%) for primary school attendance. What happens if confidence level increases from 95% to 99%?",
"opts": [
"Interval becomes narrower.",
"Interval becomes wider.",
"Mean estimate decreases.",
"Sample size increases automatically."
]
},
{
"n": 57,
"stem": "An investor finds a correlation of r = 0.65 between Company X’s stock price and gold prices. What should the investor avoid assuming?",
"opts": [
"Further analysis is needed to understand the underlying connection.",
"Gold prices can help predict Company X’s stock movements.",
"Investing in gold will automatically increase Company X’s stock value.",
"The relationship implies that Company X is a gold mining firm."
]
},
{
"n": 58,
"stem": "The Royal Bhutan Police evaluates whether installing speed cameras reduces traffic accidents. After analysis, they fail to reject the null, but accidents actually decreased due to cameras. This is an example of",
"opts": [
"confirmation bias.",
"measurement bias",
"type I error.",
"type II error."
]
},
{
"n": 59,
"stem": "A monitoring team estimates the average yield per acre is 850 kg with confidence interval (810, 890). A new fertilizer claims to increase yield by 50 kg. How would you interpret this in light of the confidence interval?",
"opts": [
"New fertilizer effect is definitely visible.",
"The yield is already high, so fertilizer won't help.",
"The observed difference may not be statistically significant.",
"We must lower the confidence level to test fertilizer."
]
},
{
"n": 60,
"stem": "A civil service analyst models the relationship between education level in years and income in Ngultrum (Nu). The R² of the simple linear regression is 0.45. What does this mean?",
"opts": [
"45% of variation in education is explained by income.",
"45% of variation in income is explained by education.",
"Education and income have a 45% correlation.",
"Income increases by Nu 45 for every year of education."
]
},
{
"n": 61,
"stem": "In a multiple regression model predicting student performance using study hours, teacher experience, and school facilities, the coefficient for study hours is found to be statistically insignificant. Which of the following is the most plausible explanation for this result?",
"opts": [
"Study hours are irrelevant and add no unique information to the model.",
"Study hours duplicate information already captured by another variable.",
"The effect of study hours is masked by model misspecification.",
"The data quality for study hours is poor and introduces noise into the model."
]
},
{
"n": 62,
"stem": "A factory has 0.5 defects per 100 items. In 10,000 items, what’s the most likely number of defects?",
"opts": [
"0",
"25",
"50",
"100"
]
},
{
"n": 63,
"stem": "A stadium tracks the number of fans entering through a gate per minute and uses a Poisson distribution to model the arrivals. Which of the following situations violates a key assumption?",
"opts": [
"Fans enter randomly throughout the game.",
"Fans come in large groups at specific times.",
"The total average per hour remains stable.",
"Fans enter independently of each other."
]
},
{
"n": 64,
"stem": "A national statistical agency wants to identify households vulnerable to poverty in urban areas. Which indicator is most appropriate?",
"opts": [
"Access to mobile internet",
"Crowding index or persons per room",
"Number of children per household",
"Total area of household land"
]
},
{
"n": 65,
"stem": "In a study of rural households, owning a television was found to be positively correlated with household income. Which of the following statements best explains this finding?",
"opts": [
"Higher-income households are more likely to afford televisions.",
"Households with televisions earn more due to access to information.",
"Television ownership directly results in increased household earnings.",
"Watching television motivates people to pursue better-paying jobs."
]
},
{
"n": 66,
"stem": "A bank uses a normal distribution to model daily customer transaction amounts, with an average of Nu 5,000. To design an alert system for unusual spending, the bank needs to understand how transaction amounts are distributed. What is the probability that a randomly selected transaction exceeds Nu 5,000?",
"opts": [
"0%",
"25%",
"50%",
"75%"
]
},
{
"n": 67,
"stem": "During a cabinet meeting, the unemployment rate is cited as \"rising slightly\". What does this indicate?",
"opts": [
"Fewer people are joining the labor force.",
"More people are retired.",
"The population has increased.",
"More people are actively seeking but not finding jobs."
]
},
{
"n": 68,
"stem": "A country with high Gross Domestic Product but low Human Development Index is under scrutiny. What could be a likely explanation?",
"opts": [
"Economic growth is highly equitable.",
"Investments in health and education are low.",
"The population is mostly elderly.",
"The unemployment rate is zero."
]
},
{
"n": 69,
"stem": "A teacher writes the word \"DATA\" on the board and asks students to rearrange all its letters to form different 4-letter sequences. How many unique arrangements are possible?",
"opts": [
"12",
"18",
"24",
"48"
]
},
{
"n": 70,
"stem": "If the poverty rate decreases from 18% to 12% over five years, what can reasonably be inferred?",
"opts": [
"Food prices have fallen significantly.",
"Incomes have improved for all households.",
"Living conditions improved for the poorest.",
"Unemployment has reached zero"
]
}
]"""

KEY = {
 1: ("c", "Quality data is fit for its intended purpose."), 2: ("d", "Time has a true zero: ratio scale."),
 3: ("c", "The population mean is a fixed (unknown) parameter, not random."), 4: ("a", "Small samples can be used to misrepresent trends."),
 5: ("a", "Identifiable census data is confidential."), 6: ("c", "Blood group is nominal; it has no meaningful average."),
 7: ("a", "SE = 4/√10 = 1.265; z = 2/1.265 = 1.58; P(Z > 1.58) ≈ 5.7%."), 9: ("b", "P-hacking misuses significance."),
 10: ("b", "Temperature is an omitted (confounding) variable."), 11: ("c", "Stratify by dzongkhag for dzongkhag estimates."),
 12: ("a", "Mutually exclusive: they cannot occur together, so P(A ∩ B) = 0."), 14: ("c", "Most frequent value: mode."),
 15: ("b", "Pretesting finds unclear wording."), 16: ("d", "Household size is ratio; satisfaction is ordinal."),
 17: ("c", "Official statistics serve citizens' right to public information."), 18: ("a", "Unbiased estimators need not have minimum variance."),
 19: ("d", "A boxplot shows the median, quartiles and outliers, not the mean."), 20: ("c", "The interval contains 0: no significant difference."),
 21: ("c", "Smaller SD: more consistent sizes in A."), 22: ("d", "Wide classes hide detail."),
 23: ("b", "Administrative records can have coverage gaps and different definitions."), 25: ("d", "Marketing is not data stewardship."),
 26: ("d", "Clickstreams and browsing history personalise recommendations."), 27: ("b", "Correlation measures association."),
 28: ("a", "Counterfactual: what would A's sales have been without the strategy?"), 29: ("a", "The count of surviving plants varies randomly."),
 30: ("d", "Poverty fell but inequality (Gini) is unchanged."), 31: ("c", "Mixed signals suggest inequality across well-being dimensions."),
 32: ("b", "Disclosing methods lets users interpret and judge quality."), 33: ("a", "International standards give comparability."),
 34: ("b", "The interval includes values above 60, so the goal is not certainly met."), 35: ("d", "ZIP codes are labels, not quantities."),
 36: ("c", "Adding a constant does not change spread."), 37: ("d", "Deviations from the mean sum to zero."),
 38: ("d", "A probability household survey is cost-effective and representative."), 39: ("d", "Live sensor and satellite data support real-time response."),
 40: ("c", "A rising CPI means inflation."), 41: ("d", "0 ≤ P(E) ≤ 1."), 42: ("a", "Trained interviewers reduce item non-response."),
 43: ("d", "Top 25% means above the third quartile."), 44: ("a", "A data-entry mistake is a processing error."),
 45: ("b", "Mean > median > mode: right (positively) skewed."), 47: ("d", "A November-December rise every year is seasonal."),
 48: ("c", "Regression predicts one variable from another."), 49: ("a", "Hypothesis testing checks whether the change is beyond chance."),
 50: ("b", "Social desirability is a measurement bias."), 51: ("c", "Mutually exclusive: one occurring prevents the others."),
 52: ("b", "190-210 is mean ± 2 SD? No: ± 10 ml = ± 2 SD gives 95%. See explanation."),
 53: ("b", "Data cleaning resolves anomalies and inconsistencies."), 54: ("d", "Estimating a population mean is parameter estimation."),
 55: ("a", "The standard error is the typical variation of the estimate across repeated samples."), 56: ("b", "Higher confidence gives a wider interval."),
 57: ("c", "Correlation does not mean gold causes the stock to rise."), 58: ("d", "Failing to reject a false null is a type II error."),
 59: ("c", "The claimed 50 kg gain may not be distinguishable statistically."), 60: ("b", "R² = 0.45: 45% of variation in income is explained by education."),
 62: ("c", "0.5 per 100 × 10,000 = 50."), 63: ("b", "Group arrivals break independence."), 64: ("b", "Crowding (persons per room) is an urban poverty indicator."),
 65: ("a", "Higher income allows buying a TV (reverse direction)."), 66: ("c", "Half of a normal distribution lies above the mean."),
 67: ("d", "More people seeking but not finding work."), 68: ("b", "Low HDI with high GDP: low investment in health and education."),
 69: ("a", "4!/2! = 12 (two As)."), 70: ("c", "Fewer people below the poverty line: conditions improved for the poorest."),
}
KEY[52] = ("c", "190-210 ml is the mean ± 2 SD (10 ml = 2 × 5 ml), so about 95% of cups.")

NEW_MCQ = [
 ("The bias of an estimator is", ("the difference between its expected value and the true parameter", "its standard deviation", "always zero", "the sample size"), "a", "Bias = E(estimate) − true value."),
 ("When two predictors in a regression are highly correlated with each other, the problem is called", ("heteroscedasticity", "multicollinearity", "autocorrelation", "overfitting"), "b", "Multicollinearity inflates standard errors."),
 ("The coefficient of variation is used to compare", ("means only", "relative variability of data sets with different units or means", "medians only", "sample sizes"), "b", "CV = SD/mean × 100."),
 ("In simple random sampling, every unit of the population has", ("no chance of selection", "an equal chance of selection", "a chance depending on its size", "a chance chosen by the interviewer"), "b", "SRS gives equal selection probability."),
 ("Which measure of central tendency is most affected by extreme values?", ("Mean", "Median", "Mode", "Quartile"), "a", "The mean uses every value, so outliers pull it."),
]

SAQ = [
 dict(marks=5, stem="""In a Likert-scale survey assessing employee engagement, the responses to a particular statement were: Strongly Disagree 10%, Disagree 15%, Neutral 20%, Agree 40%, Strongly Agree 15%.
a) Interpret what this distribution suggests about employee perception. (2 marks)
b) What could be the possible impact on survey results if the Neutral option is removed from the Likert scale? (2 marks)
c) What type of central tendency measure would be most appropriate? (1 mark)""",
      kp=[("a) 55% agree or strongly agree vs 25% disagree: generally positive engagement", 1), ("a) but 20% neutral and a quarter negative: room for improvement", 1),
          ("b) Neutral respondents forced to choose a side: may inflate agreement or disagreement", 1), ("b) Loss of valid 'no opinion' responses; possible non-response or measurement bias", 1),
          ("c) Median or mode (ordinal data), not the mean", 1)],
      model="""a) Most employees (40% + 15% = 55%) agree, so perception is generally positive; however 25% disagree and 20% are neutral, so a sizeable group is unconvinced or disengaged and needs attention.
b) Without a neutral option, undecided respondents are forced to choose agree or disagree (a forced-choice scale). This may inflate one side, distort the true distribution and introduce measurement bias, or cause some respondents to skip the item.
c) Because Likert data are ordinal, the median (or mode) is the appropriate measure of central tendency; here the median and mode are both 'Agree'."""),
 dict(marks=5, stem="Explain the importance of minimizing proxy respondents in household surveys. What are some challenges in achieving self-reported data from all adult members? (2 + 3 marks)",
      kp=[("Importance: proxies may not know details (income, work hours, health, opinions); self-reports are more accurate, reduce bias, needed for individual attitudes", 2), ("Challenges: members absent at work/migrants, need repeated callbacks, higher cost and time", 1.5), ("Challenges: privacy and sensitive topics, household head insists on answering, language/literacy, respondent fatigue", 1.5)],
      model="Proxy respondents answer on behalf of other household members. Minimising them matters because proxies often do not know the exact details of another person's work, earnings, health or time use, and cannot report another person's attitudes; proxy answers therefore add measurement error and bias, especially in labour-force and health surveys. Challenges in getting self-reports: adults may be away at work, studying, migrated or travelling, so interviewers must make several callbacks at different times, raising cost and time; the household head may insist on answering for everyone; sensitive topics need privacy; language, literacy or disability can limit participation; and long interviews cause fatigue and refusals."),
 dict(marks=5, stem="Explain why a strong metadata and dissemination system is essential for the effective use of survey microdata. (5 marks)",
      kp=[("Metadata (questionnaires, definitions, sampling design, weights, codes, methods) lets users understand and correctly interpret variables", 2), ("Ensures correct analysis (use of weights, design effects), comparability across rounds and countries, reproducibility", 1.5), ("Dissemination system: controlled access, anonymised files, licensing, user support, catalogues (e.g. NADA/DDI) - wider use, trust, confidentiality protection", 1.5)],
      model="Microdata are only useful if users understand how they were produced. Metadata - questionnaires, concepts and definitions, sampling design, weights, variable labels, codes and processing notes (e.g. documented in DDI format) - allow users to interpret variables correctly, apply weights and design effects, compare survey rounds and reproduce published figures. A good dissemination system (for example a NADA microdata catalogue) makes anonymised files easy to find and access under clear licences, protects respondents' confidentiality through tiered access, provides user support and citations, and increases the use of the data for research and policy, which builds trust in the statistical office and returns value on the survey investment."),
 dict(marks=5, stem="Do you think we can rely solely on administrative data instead of conducting surveys? Discuss with supporting arguments, highlighting both the advantages and limitations. (5 marks)",
      kp=[("Clear stand (no - complement, not replace)", 1), ("Advantages of admin data: low cost, already collected, complete coverage of registered units, frequent/timely, small-area detail", 2), ("Limitations: coverage gaps (informal sector, unregistered), definitions set for administration, quality issues, no data on attitudes/well-being, access/privacy issues", 2)],
      model="Administrative data alone cannot replace surveys; the two should complement each other. Advantages of administrative data: they are already collected for administration (civil registration, tax, school and health records), so they are cheap, cover all registered units, are updated frequently and allow detailed small-area statistics without respondent burden. Limitations: they cover only people in contact with the system (missing the informal sector, unregistered or migrant people), use administrative definitions that may not match statistical concepts, can have errors and delays, and do not record many topics such as income from informal work, opinions, time use or well-being. Surveys are still needed for these topics and to check the quality of administrative sources."),
 dict(marks=5, stem="What are the key dimensions used to assess the quality of administrative data? Provide a brief description of each aspect. (5 marks)",
      kp=[("Relevance and coverage: whether concepts and population covered meet statistical needs", 1), ("Accuracy and reliability: errors, completeness of records, consistency", 1), ("Timeliness and punctuality: delay between reference period and availability", 1), ("Coherence/comparability: consistent definitions and classifications over time and with other sources", 1), ("Accessibility/interpretability: access, metadata/documentation, legal arrangements", 1)],
      model="1. Relevance and coverage: whether the concepts, definitions and population covered by the administrative source meet statistical needs (e.g. does the register include everyone?). 2. Accuracy and reliability: how close records are to reality, including missing values, duplicates and coding errors. 3. Timeliness and punctuality: how soon after the reference period the data are available and whether delivery is regular. 4. Coherence and comparability: whether definitions and classifications are consistent over time and with other sources and standards. 5. Accessibility and interpretability: whether the statistical office can access the data under legal agreements and whether there is enough documentation (metadata) to understand them."),
 dict(marks=5, stem="""State True or False and then support your answer with a brief explanation.
a) In a two-tailed hypothesis test, doubling the p-value from a one-tailed test always yields the correct p-value for the two-tailed test. (2.5 marks)
b) The Central Limit Theorem guarantees that the sampling distribution of the sample mean is normal for any sample size regardless of the population distribution. (2.5 marks)""",
      kp=[("a) False", 1), ("a) Doubling works only for symmetric test distributions (z, t) and when the one-tailed p is computed in the direction of the observed effect; not for asymmetric distributions (chi-square, F, exact binomial) or p > 0.5", 1.5),
          ("b) False", 1), ("b) The CLT gives approximate normality only for large samples (often n ≥ 30); for small n the sampling distribution follows the population shape unless the population itself is normal", 1.5)],
      model="""a) False. Doubling the one-tailed p-value gives the two-tailed p-value only when the test statistic has a symmetric distribution (such as z or t) and the one-tailed p was taken in the direction of the observed effect. For asymmetric distributions (exact binomial, chi-square, F) or when the one-tailed p exceeds 0.5, simple doubling is wrong.
b) False. The Central Limit Theorem says the sampling distribution of the mean approaches normality as the sample size becomes large (a common rule of thumb is n ≥ 30, more for very skewed populations), provided the variance is finite. For small samples it is exactly normal only if the population itself is normal."""),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
