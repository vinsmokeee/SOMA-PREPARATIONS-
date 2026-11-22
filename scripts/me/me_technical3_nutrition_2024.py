"""ME Technical Paper III (Subject Specialisation Paper), Nutrition and Dietetics, BCSE 2024 - real paper (PDF sent by the founder).
Same layout as the 2025 paper (the latest): Part I 30 MCQ; Part II six short answers (2.5 x 4 + 5 x 2 = 20) as one group;
Section B two compulsory case questions of 25 marks.
Replaced MCQs: 6 (metabolic syndrome - options b and d are both criteria), 13 and 15 (more than one option defensible),
25 (NHS 2023 stunting figure - could not be confirmed).
Repeated in 2025 (not loaded again; 2024 recorded in me_technical3_repeats_2024_batch9.sql): MCQs 4, 10, 11 and short
answers 3 (DASH diet) and 5 (CKD nutrition); the two short answers are replaced by new ones so Part II keeps its 20 marks.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1"
GROUP_TAG = "nutri2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "nutrition-dietetics"
ADDS_TO_PAPER = True  # 2025 is the latest Nutrition and Dietetics paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Nutrition and Dietetics"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following amino acids is considered conditionally essential during periods of rapid growth, illness, or stress?",
"opts": [
"Valine",
"Glutamine",
"Leucine",
"Methionine"
]
},
{
"n": 2,
"stem": "Which enzyme is responsible for the initial breakdown of starch in the mouth?",
"opts": [
"Pepsin",
"Amylase",
"Lipase",
"Maltase"
]
},
{
"n": 3,
"stem": "Which vitamin is involved in the carboxylation of glutamic acid residues on proteins required for blood clotting?",
"opts": [
"Vitamin C",
"Vitamin E",
"Vitamin K",
"Vitamin B6"
]
},
{
"n": 4,
"stem": "Which hormone is primarily responsible for lowering blood glucose levels after a meal?",
"opts": [
"Glucagon",
"Insulin",
"Cortisol",
"Epinephrine"
]
},
{
"n": 5,
"stem": "What is the primary function of the urea cycle in the liver?",
"opts": [
"Detoxify ammonia",
"Convert glucose to glycogen",
"Synthesize fatty acids",
"Produce ketone bodies"
]
},
{
"n": 6,
"stem": "Which of the following is a key diagnostic criterion for metabolic syndrome?",
"opts": [
"Elevated HDL cholesterol",
"Elevated triglycerides",
"Low blood pressure",
"Increased waist circumference"
]
},
{
"n": 7,
"stem": "Which dietary pattern is most recommended for patients with chronic kidney disease to manage hyperkalemia?",
"opts": [
"High-protein diet",
"Low-potassium diet",
"High-fiber diet",
"Low-fat diet"
]
},
{
"n": 8,
"stem": "Which nutrient deficiency is commonly associated with the development of microcytic anemia?",
"opts": [
"Vitamin B12",
"Folate",
"Iron",
"Vitamin D"
]
},
{
"n": 9,
"stem": "In the management of type 1 diabetes, what is the primary benefit of continuous glucose monitoring (CGM)?",
"opts": [
"Reducing insulin resistance",
"Preventing ketoacidosis",
"Tracking blood glucose trends in real time",
"Increasing physical activity levels"
]
},
{
"n": 10,
"stem": "What is the recommended daily intake of protein for a patient undergoing hemodialysis?",
"opts": [
"0.8 g/kg body weight",
"1.0 g/kg body weight",
"1.2-1.5 g/kg body weight",
"2.0 g/kg body weight"
]
},
{
"n": 11,
"stem": "What is the purpose of conducting a Hazard Analysis Critical Control Point (HACCP) plan in a foodservice operation?",
"opts": [
"Reduce food cost",
"Ensure nutritional adequacy",
"Prevent foodborne illness",
"Improve employee satisfaction"
]
},
{
"n": 12,
"stem": "Which inventory management method involves tracking the expiration dates of perishable items and using the oldest items first?",
"opts": [
"FIFO (First In, First Out)",
"LIFO (Last In, First Out)",
"ABC method",
"JIT (Just In Time)"
]
},
{
"n": 13,
"stem": "In a hospital foodservice operation, what is the primary advantage of using a centralized meal delivery system?",
"opts": [
"Improved patient satisfaction",
"Increased food variety",
"Better portion control",
"Reduced labor costs"
]
},
{
"n": 14,
"stem": "What is the primary goal of a quality improvement program in a healthcare foodservice setting?",
"opts": [
"Increase revenue",
"Enhance patient outcomes",
"Reduce food waste",
"Improve employee morale"
]
},
{
"n": 15,
"stem": "Which of the following is a key component of the Nutrition Care Process (NCP)?",
"opts": [
"Meal planning",
"Nutrition screening",
"Budgeting",
"Inventory management"
]
},
{
"n": 16,
"stem": "Which of the following is an example of a water-soluble vitamin?",
"opts": [
"Vitamin A",
"Vitamin D",
"Vitamin E",
"Vitamin C"
]
},
{
"n": 17,
"stem": "Which foodborne pathogen is most commonly associated with undercooked poultry?",
"opts": [
"Salmonella",
"Listeria",
"Escherichia coli (E. coli)",
"Clostridium botulinum"
]
},
{
"n": 18,
"stem": "What is the primary purpose of blanching vegetables before freezing them?",
"opts": [
"Increase nutrient content",
"Improve flavour",
"Inactivate enzymes",
"Enhance texture"
]
},
{
"n": 19,
"stem": "Which of the following is a common food additive used to prevent oxidation in processed foods?",
"opts": [
"Ascorbic acid",
"Sodium chloride",
"High fructose corn syrup",
"Monosodium glutamate (MSG)"
]
},
{
"n": 20,
"stem": "Which nutrient is most susceptible to destruction during cooking and food processing?",
"opts": [
"Vitamin A",
"Vitamin C",
"Vitamin D",
"Vitamin K"
]
},
{
"n": 21,
"stem": "In a randomized controlled trial, what is the primary purpose of randomization?",
"opts": [
"Increase sample size",
"Ensure blinding",
"Reduce bias",
"Simplify data analysis"
]
},
{
"n": 22,
"stem": "Which statistical test is used to compare the means of two independent groups?",
"opts": [
"Chi-square test",
"T-test",
"ANOVA",
"Correlation"
]
},
{
"n": 23,
"stem": "What is the main function of lipoproteins in the body?",
"opts": [
"Store vitamins",
"Transport fats and cholesterol",
"Catalyze chemical reactions",
"Maintain fluid balance"
]
},
{
"n": 24,
"stem": "Which nutrient deficiency is commonly observed in Bhutan due to limited dietary diversity and reliance on staple foods like rice and maize?",
"opts": [
"Vitamin A",
"Iron",
"Vitamin C",
"Calcium"
]
},
{
"n": 25,
"stem": "The prevalence of child stunting in Bhutan from the NHS 2023 survey is",
"opts": [
"22.4%",
"21.2%",
"33.5%",
"17.9%"
]
},
{
"n": 26,
"stem": "Which of the following is the most appropriate initial step in assessing a patient with suspected malnutrition in a clinical setting?",
"opts": [
"Prescribing a high-protein diet",
"Conducting a comprehensive dietary recall",
"Measuring serum albumin levels",
"Initiating a nutrition care plan"
]
},
{
"n": 27,
"stem": "What disease is caused by SARS-CoV-2?",
"opts": [
"Middle East Respiratory Syndrome (MERS)",
"Severe Acute Respiratory Syndrome (SARS)",
"COVID-19",
"H1N1 Influenza"
]
},
{
"n": 28,
"stem": "Increased susceptibility to infection is a clinical impact of",
"opts": [
"Neurological effects",
"Endocrine system",
"Immune system",
"Gastrointestinal system"
]
},
{
"n": 29,
"stem": "Breast milk has almost no amount of",
"opts": [
"Potassium",
"Iron",
"Fluoride",
"Magnesium"
]
},
{
"n": 30,
"stem": "An index used to measure stunting or chronic malnutrition",
"opts": [
"Weight for height or length",
"MUAC for age, sex and height",
"Weight for age",
"Height for age"
]
}
]"""

KEY = {
    1: ("b", "Glutamine becomes conditionally essential in illness, trauma and rapid growth."),
    2: ("b", "Salivary amylase (ptyalin) begins starch digestion in the mouth."),
    3: ("c", "Vitamin K is the cofactor for gamma-carboxylation of glutamate residues in clotting factors II, VII, IX and X."),
    5: ("a", "The urea cycle converts toxic ammonia into urea for excretion."),
    7: ("b", "Hyperkalaemia in CKD is managed with a low-potassium diet."),
    8: ("c", "Iron deficiency causes microcytic, hypochromic anaemia (B12 and folate cause macrocytic anaemia)."),
    9: ("c", "CGM shows glucose levels and trends in real time, guiding insulin and food decisions."),
    12: ("a", "FIFO uses the oldest stock first."),
    14: ("b", "Quality improvement in healthcare foodservice aims at better patient outcomes and satisfaction."),
    16: ("d", "Vitamin C (and the B vitamins) are water-soluble; A, D, E and K are fat-soluble."),
    17: ("a", "Salmonella (and Campylobacter) are typically linked to undercooked poultry."),
    18: ("c", "Blanching inactivates enzymes that would degrade colour, flavour and nutrients during frozen storage."),
    19: ("a", "Ascorbic acid is an antioxidant additive."),
    20: ("b", "Vitamin C is water-soluble and easily destroyed by heat, oxygen and light."),
    21: ("c", "Randomisation reduces selection bias and confounding by balancing groups."),
    22: ("b", "An independent-samples t-test compares the means of two groups."),
    23: ("b", "Lipoproteins transport triglycerides and cholesterol in the blood."),
    24: ("b", "Iron deficiency anaemia is a major public health problem in Bhutan, linked to diets based on cereals with little animal food."),
    26: ("b", "Assessment starts with gathering data such as a comprehensive diet history/ recall before any plan or prescription; albumin is not a reliable marker of nutritional status."),
    27: ("c", "SARS-CoV-2 causes COVID-19."),
    28: ("c", "Malnutrition weakens the immune system, increasing susceptibility to infection."),
    29: ("c", "Breast milk contains almost no fluoride."),
    30: ("d", "Low height-for-age indicates stunting (chronic malnutrition)."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "Deficiency of which vitamin causes night blindness?", ["Vitamin A", "Vitamin B1", "Vitamin C", "Vitamin D"], "a",
            "Vitamin A is needed for rhodopsin in the retina."),
    new_mcq(2, T, "How much energy does 1 g of fat provide?", ["4 kcal", "7 kcal", "9 kcal", "12 kcal"], "c",
            "Fat gives about 9 kcal/g; carbohydrate and protein about 4 kcal/g; alcohol 7 kcal/g."),
    new_mcq(3, T, "Kwashiorkor is mainly associated with a diet deficient in", ["protein, with relatively adequate energy", "vitamin C", "iodine", "fat-soluble vitamins only"], "a",
            "Kwashiorkor: protein deficiency with oedema; marasmus: deficiency of both energy and protein."),
    new_mcq(4, T, "Which mineral is an essential part of thyroid hormones?", ["Iron", "Zinc", "Iodine", "Calcium"], "c",
            "Thyroxine (T4) and triiodothyronine (T3) contain iodine."),
]

SA = [
    ("Describe key differences between Type 1 and Type 2 diabetes.", 2.5,
     [("Type 1: autoimmune destruction of beta cells, absolute insulin deficiency, usually young, lean, abrupt onset, ketoacidosis prone, needs insulin", 1.5),
      ("Type 2: insulin resistance with relative deficiency, adults/ obesity, gradual, strong lifestyle/ family link, managed by diet, exercise, oral drugs, later insulin", 1)],
     "Type 1 diabetes is caused by autoimmune destruction of the pancreatic beta cells, giving absolute insulin deficiency; it usually starts in children or young adults, often lean, with abrupt onset and a tendency to ketoacidosis, and always needs insulin. Type 2 diabetes is caused by insulin resistance with relative insulin deficiency; it usually occurs in adults, is strongly linked to obesity, inactivity and family history, develops gradually (often found on screening), rarely causes ketoacidosis, and is managed with diet, physical activity and oral drugs, with insulin later if needed. It accounts for about 90% of diabetes."),
    ("Discuss the impact of insulin on glucose metabolism in the body.", 2.5,
     [("Increases glucose uptake into muscle and fat (GLUT4), glycogenesis in liver/ muscle, glycolysis", 1.5),
      ("Inhibits glycogenolysis and gluconeogenesis; promotes fat and protein synthesis, inhibits lipolysis/ ketogenesis → lowers blood glucose", 1)],
     "Insulin, released by beta cells after a meal, lowers blood glucose. It increases glucose uptake into muscle and adipose tissue by moving GLUT4 transporters to the cell membrane; stimulates glycogen synthesis (glycogenesis) in liver and muscle and glucose use (glycolysis); inhibits glycogen breakdown (glycogenolysis) and new glucose production (gluconeogenesis) in the liver; and promotes conversion of excess glucose to fat while inhibiting lipolysis and ketone formation, and promotes protein synthesis. Lack of insulin or resistance to it causes hyperglycaemia."),
    ("Explain the role of dietary fibre in health.", 2.5,
     [("Types: soluble (oats, pulses, fruit - forms gel) and insoluble (bran, whole grains, vegetables - adds bulk)", 1),
      ("Benefits: prevents constipation/ diverticular disease, lowers LDL cholesterol, slows glucose absorption (diabetes), satiety/ weight control, feeds gut bacteria (short-chain fatty acids), lower colorectal cancer risk; recommended ~25-30 g/day", 1.5)],
     "Dietary fibre is the part of plant foods that human enzymes cannot digest. Soluble fibre (oats, barley, pulses, fruits such as apples) forms a gel in the gut; insoluble fibre (wheat bran, whole grains, vegetables, red rice) adds bulk. Roles: increases stool bulk and speeds transit, preventing constipation, haemorrhoids and diverticular disease; soluble fibre binds bile acids and lowers LDL cholesterol; slows glucose absorption, improving blood sugar control in diabetes; increases satiety, helping weight control; is fermented by gut bacteria to short-chain fatty acids that nourish the colon and support a healthy microbiota; and is linked to lower risk of colorectal cancer and heart disease. Adults need about 25-30 g a day, with adequate fluid."),
    ("Explain the role of gut microbiota in the development of obesity.", 2.5,
     [("Dysbiosis (e.g. altered Firmicutes:Bacteroidetes) increases energy harvest from food via fermentation to short-chain fatty acids, fat storage", 1.5),
      ("Increased gut permeability/ endotoxin (LPS) → low-grade inflammation, insulin resistance; effects on appetite hormones (GLP-1, PYY); diet (high fibre) shapes microbiota", 1)],
     "The gut microbiota can influence obesity in several ways. An altered microbial balance (dysbiosis - for example a higher Firmicutes to Bacteroidetes ratio, reported in some studies) increases the energy harvested from food by fermenting undigested carbohydrates into short-chain fatty acids, and promotes fat storage (e.g. by suppressing an inhibitor of lipoprotein lipase). Dysbiosis can increase gut permeability, letting bacterial endotoxin (lipopolysaccharide) into the blood, causing low-grade inflammation and insulin resistance. Microbes also affect appetite and satiety hormones (GLP-1, PYY) and bile acid metabolism. Transferring microbiota from obese mice to germ-free mice increased fat gain. Diet shapes the microbiota: high-fibre, plant-rich diets support beneficial bacteria, while high-fat, high-sugar diets promote dysbiosis."),
    ("Discuss the nutritional management of a patient with acute and chronic liver disease (e.g. cirrhosis).", 5,
     [("Goals: prevent/ treat malnutrition and muscle wasting, support liver regeneration, prevent complications (ascites, encephalopathy, hypoglycaemia); stop alcohol", 1),
      ("Energy 30-35 kcal/kg; protein 1.2-1.5 g/kg (do not restrict protein in encephalopathy; vegetable/ dairy protein, BCAA if intolerant); small frequent meals and late-evening carbohydrate snack", 2),
      ("Sodium restriction (<2 g/day) for ascites/ oedema, fluid restriction only if severe hyponatraemia; vitamins and minerals (thiamine, folate, zinc, vitamin D), soft foods if varices, monitoring weight/ muscle, enteral feeding if intake poor", 2)],
     "Goals: prevent and treat malnutrition and muscle wasting (very common in cirrhosis), support liver regeneration, and prevent complications such as ascites, hepatic encephalopathy and hypoglycaemia; complete abstinence from alcohol. Energy: about 30-35 kcal/kg/day. Protein: 1.2-1.5 g/kg/day - protein should not be restricted even in hepatic encephalopathy; spread it through the day and use vegetable and dairy proteins, with branched-chain amino acid supplements if intolerant. Meal pattern: small, frequent meals (4-6 a day) and a late-evening carbohydrate-rich snack to shorten overnight fasting and reduce muscle breakdown. Sodium: restrict to about 2 g a day (no added salt, avoid salty processed foods) for ascites and oedema; restrict fluid only when there is severe hyponatraemia. Micronutrients: replace thiamine (especially in alcohol use), folate, zinc, vitamin D and other deficiencies. Soft foods for those with oesophageal varices; oral nutritional supplements or tube feeding if oral intake is inadequate. Monitor weight (allowing for fluid), muscle mass, intake and laboratory values."),
    ("Describe the process and significance of using the Nutrition Care Process (NCP) in dietetic practice.", 5,
     [("Steps: (1) nutrition assessment (ABCDE - anthropometry, biochemical, clinical, dietary, client history); (2) nutrition diagnosis (PES statement); (3) nutrition intervention (planning and implementation); (4) nutrition monitoring and evaluation; screening/ referral before", 3),
      ("Significance: systematic, standardised, evidence-based, critical thinking, standard terminology (IDNT), documentation and communication, outcome measurement, quality and accountability", 2)],
     "The Nutrition Care Process is a systematic, standardised four-step framework for providing nutrition care: (1) Nutrition assessment - collecting and interpreting data on anthropometry, biochemical tests, clinical findings, diet history and client history (often after screening and referral); (2) Nutrition diagnosis - identifying the specific nutrition problem that dietetics can treat, written as a PES statement (Problem related to Etiology as evidenced by Signs/Symptoms); (3) Nutrition intervention - planning and implementing actions (food and nutrient delivery, education, counselling, coordination of care) aimed at the cause of the problem; (4) Nutrition monitoring and evaluation - measuring progress against goals and outcome indicators and revising the plan. Significance: it promotes critical thinking and evidence-based practice, provides consistent quality care, uses standard terminology for clear documentation and communication across the team, allows outcomes to be measured and researched, and demonstrates the value and accountability of dietitians."),
]
for i, (s, mk, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=mk, topic=T, group="me-technical-3-nutri2024-part2", pos=i + 1,
                  stem=f"Part II, question {i + 1}. {s} ({mk} marks)", key_points=kp, model=mod))

C1 = """Case 1: Mr. Dorji Tshering
Patient information: 65-year-old man; height 170 cm; weight 70 kg; BMI 24.2 kg/m² (normal weight).
Medical history: chronic kidney disease (stage 3); hypertension; gout.
Lifestyle: moderate physical activity, enjoys walking; diet high in red meats and salty foods, and low in fruits and vegetables."""
C2 = """Case 2: Ms. Yeshi Choden
Patient information: 30-year-old woman; height 160 cm; weight 60 kg; BMI 23.4 kg/m² (normal weight).
Medical history: polycystic ovary syndrome (PCOS); irregular menstrual cycles; history of mild anxiety; family history of type 2 diabetes.
Lifestyle: moderately active, practises yoga 3 times a week; diet high in refined carbohydrates and sugary snacks; drinks alcohol occasionally (1-2 drinks per week); limited fruit and vegetable intake.
Laboratory results: fasting blood glucose 102 mg/dL; HbA1c 5.7%; total cholesterol 190 mg/dL; LDL 120 mg/dL; HDL 45 mg/dL; triglycerides 140 mg/dL."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("nutri2024", 1, T, C1, items=[
    it("1. Identify two dietary concerns based on Mr. Dorji Tshering's current diet.", 2,
       [("High red meat: excess protein (CKD load) and purines (gout)", 1), ("High salt: worsens hypertension/ fluid retention and CKD; low fruit/ vegetables - low fibre/ antioxidants", 1)],
       "1. High intake of red meat - excess protein increases the workload on his damaged kidneys and urea production, and red meat is high in purines, raising uric acid and gout attacks. 2. High intake of salty foods - raises blood pressure and fluid retention, speeding CKD progression. (Also: low fruit and vegetable intake gives little fibre, vitamins and antioxidants.)"),
    it("2. Explain why it is important to monitor Mr. Dorji Tshering's protein intake given his chronic kidney disease.", 3,
       [("Protein metabolism produces urea/ nitrogenous wastes the failing kidney cannot excrete → uraemia; high protein causes hyperfiltration and faster decline; also phosphorus/ acid load", 2),
        ("Too little causes muscle wasting/ malnutrition; target 0.55-0.8 g/kg (≈40-55 g/day), half high biological value", 1)],
       "Breakdown of protein produces urea and other nitrogenous wastes, which the kidneys at stage 3 cannot clear well, leading to uraemia. A high protein intake also increases glomerular pressure (hyperfiltration), speeding the decline of kidney function, and adds phosphorus and acid load. Monitoring allows a moderate restriction - about 0.55-0.8 g/kg/day, i.e. roughly 40-55 g/day for his 70 kg, with at least half from high biological value sources - while avoiding too little protein, which would cause muscle wasting and malnutrition in an older man."),
    it("3. Write one PES (Problem, Etiology, Signs/Symptoms) statement for Mr. Dorji Tshering's chronic kidney disease.", 3,
       [("Correct PES format: Problem (e.g. excessive protein intake / excessive sodium intake) related to etiology (food- and nutrition-related knowledge deficit, preference for red meat/ salty foods) as evidenced by signs (diet history high in red meat/ salty foods, CKD stage 3, hypertension)", 3)],
       "Excessive protein intake related to food preferences and lack of knowledge about protein needs in chronic kidney disease, as evidenced by a diet history high in red meat and a diagnosis of CKD stage 3. (Alternative: Excessive sodium intake related to frequent consumption of salty foods, as evidenced by diet history and hypertension with CKD stage 3.)"),
    it("4. Write one PES statement related to his gout.", 3,
       [("Correct PES: Problem (e.g. excessive intake of purine-rich foods / food- and nutrition-related knowledge deficit) related to etiology (frequent red meat, lack of knowledge about purines) as evidenced by signs (diet history, gout diagnosis/ raised uric acid)", 3)],
       "Excessive intake of purine-rich foods (excessive bioactive substance intake) related to limited knowledge of the link between diet and gout, as evidenced by frequent red meat intake in the diet history and a diagnosis of gout. (Alternative: Food- and nutrition-related knowledge deficit related to no previous nutrition education, as evidenced by a diet high in red meat despite gout.)"),
    it("5. Suggest two dietary changes to help manage Mr. Dorji Tshering's chronic kidney disease.", 4,
       [("Reduce protein to about 0.6-0.8 g/kg (≈ 40-55 g/day): smaller portions of meat, replace some red meat with eggs, fish, chicken, legumes in moderation", 2),
        ("Reduce sodium to <2 g/day (≈5 g salt): cook with less salt, avoid salty snacks, pickles, processed meats, instant noodles, salty cheese/ suja; use herbs, spices, lemon", 2)],
       "1. Reduce protein to about 0.6-0.8 g/kg/day (about 40-55 g/day): eat smaller portions of meat (a palm-sized portion once a day), replace red meat with eggs, fish or chicken, and fill the plate with rice, vegetables and other low-protein foods. 2. Reduce sodium to less than 2 g a day (about one teaspoon of salt): cook with less salt, avoid salty snacks, pickles, processed and dried salted meats, instant noodles and salty cheese, and flavour food with herbs, ginger, garlic, chilli and lemon. (If potassium or phosphorus rise, these will also need limiting.)"),
    it("6. Recommend two dietary changes to help manage Mr. Dorji Tshering's gout.", 4,
       [("Limit purine-rich foods: red meat, organ meats, shellfish/ some fish, meat gravies; choose low-fat dairy, plant proteins in moderation", 2),
        ("Avoid alcohol (especially beer, ara) and sugary drinks/ fructose; drink plenty of fluids (as kidney function allows); maintain weight", 2)],
       "1. Limit purine-rich foods - red meat, organ meats (liver, kidney), meat extracts and gravies, and shellfish and oily fish - replacing them with low-fat milk and curd (which lower uric acid), eggs and moderate plant proteins. 2. Avoid alcohol, especially beer and spirits such as ara, and sugar-sweetened drinks high in fructose, which increase uric acid; drink adequate water (about 2 litres a day, unless the doctor restricts fluids for his kidneys) to help excrete uric acid, and avoid crash dieting or fasting."),
    it("7. Propose one strategy to increase Mr. Dorji Tshering's intake of fruits and vegetables.", 3,
       [("A practical strategy explained, e.g. half-plate vegetables at each meal, add vegetables to curries/ soups, fruit as snack replacing salty snacks; choose lower-potassium options (apple, pear, cabbage, beans) because of CKD", 3)],
       "Use the 'half-plate' method: at lunch and dinner fill half his plate with vegetables (e.g. cabbage, beans, cauliflower, cucumber, green leaves cooked with less salt), and replace salty snacks with a piece of fruit between meals (e.g. apple, pear, guava or a few slices of papaya). Because he has CKD, choose lower-potassium options and soak and boil high-potassium vegetables (potatoes) if blood potassium is raised, and involve the person who cooks for him."),
    it("8. Identify one short-term and one long-term goal for Mr. Dorji Tshering's nutrition care plan.", 3,
       [("Short-term: e.g. within 2-4 weeks reduce red meat to small portions and sodium to <2 g/day, add vegetables to meals", 1.5),
        ("Long-term: e.g. over 6-12 months maintain BP <130/80, stable eGFR, uric acid <6 mg/dL, no gout flares, healthy weight", 1.5)],
       "Short-term: within 2-4 weeks, limit red meat to small portions (no more than 3 times a week), keep salt below one teaspoon a day, and include vegetables at two meals daily. Long-term: over 6-12 months, keep his BP below 130/80 mmHg, slow CKD progression (stable eGFR), keep serum uric acid below 6 mg/dL with no gout attacks, and maintain a healthy weight and good nutritional status."),
])
Q += case("nutri2024", 2, T, C2, items=[
    it("1. Identify two dietary concerns based on Ms. Yeshi Choden's current diet.", 3,
       [("High refined carbohydrates and sugary snacks: worsen insulin resistance, PCOS and prediabetes", 1.5),
        ("Low fruit and vegetable intake (low fibre, micronutrients); alcohol adds empty calories", 1.5)],
       "1. High intake of refined carbohydrates and sugary snacks - causes rapid rises in blood glucose and insulin, worsening insulin resistance, which drives PCOS symptoms and her prediabetes. 2. Low fruit and vegetable intake - gives little fibre, vitamins, minerals and antioxidants, which help glucose control, weight and heart health. (Also: alcohol adds empty calories and can affect blood sugar and anxiety.)"),
    it("2. Explain the significance of Ms. Yeshi Choden's HbA1c level in the context of her family history of type 2 diabetes.", 3,
       [("HbA1c 5.7% = prediabetes (5.7-6.4%), with fasting glucose 102 (impaired fasting glucose 100-125); reflects 2-3 months average glucose", 1.5),
        ("With family history and PCOS (insulin resistance) high risk of progressing to type 2 diabetes; lifestyle changes can prevent/ delay (≈58%); needs regular monitoring", 1.5)],
       "An HbA1c of 5.7% reflects her average blood glucose over the past 2-3 months and lies in the prediabetes range (5.7-6.4%); her fasting glucose of 102 mg/dL also shows impaired fasting glucose (100-125). Combined with a family history of type 2 diabetes and PCOS, which involves insulin resistance, she is at high risk of developing type 2 diabetes (and gestational diabetes in pregnancy). This is an important warning: lifestyle changes - healthy diet, physical activity and avoiding weight gain - can prevent or delay diabetes (by about 58% in prevention trials), and she needs yearly monitoring."),
    it("3. Discuss two potential dietary strategies to help manage Ms. Yeshi Choden's polycystic ovary syndrome (PCOS).", 4,
       [("Low glycaemic index, high-fibre carbohydrates (whole grains, red rice, legumes, vegetables) and reduced refined sugar → lower insulin, improved ovulation/ androgens", 2),
        ("Balanced meals with lean protein and healthy fats (anti-inflammatory/ Mediterranean pattern, omega-3), regular meal timing, limit alcohol; maintain weight", 2)],
       "1. Low glycaemic index, high-fibre carbohydrate pattern: replace white rice, sweets, biscuits and sugary drinks with whole grains (red rice, buckwheat, oats), legumes and plenty of vegetables, and spread carbohydrates evenly through the day. This lowers post-meal glucose and insulin; lower insulin reduces ovarian androgen production and can improve cycle regularity and ovulation. 2. Balanced, anti-inflammatory meals: include lean protein at each meal (eggs, fish, chicken, dal, tofu), healthy fats (nuts, seeds, oily fish, vegetable oils rich in omega-3 and mono-unsaturated fats) and limit saturated fat and alcohol - similar to a Mediterranean pattern. This improves satiety, insulin sensitivity and lipids, and helps maintain a healthy weight."),
    it("4. Propose a full diet plan for Ms. Yeshi Choden that addresses her PCOS, prediabetic status and lifestyle. Include calculations of her estimated daily calorie requirements and macronutrient distribution (carbohydrates, proteins and fats) based on these needs.", 10,
       [("Energy: Mifflin-St Jeor BMR = 10(60) + 6.25(160) - 5(30) - 161 = 1289 kcal; x 1.55 (moderately active) ≈ 2000 kcal (maintenance; or ~1800-2000)", 3),
        ("Macronutrients e.g. carbohydrate 45% (≈225 g, low GI), protein 20% (≈100 g), fat 35% (≈78 g, mainly unsaturated), fibre ≥25-30 g", 3),
        ("Sample day: meals and snacks with whole grains, vegetables, lean protein, fruit, healthy fats, no sugary snacks, limited alcohol; practical/ cultural foods", 4)],
       """Energy (Mifflin-St Jeor for women): BMR = 10 x 60 + 6.25 x 160 - 5 x 30 - 161 = 600 + 1000 - 150 - 161 = 1289 kcal. Activity factor 1.55 (moderately active, yoga 3 times a week): 1289 x 1.55 ≈ 2000 kcal/day. Her BMI is normal, so this is for weight maintenance (a small deficit of about 200 kcal can be used if she gains weight).
Macronutrients (2000 kcal): carbohydrate 45% = 900 kcal = 225 g (mainly low-GI, high-fibre); protein 20% = 400 kcal = 100 g (about 1.7 g/kg); fat 35% = 700 kcal ≈ 78 g (mostly unsaturated, saturated fat below 10%); fibre at least 25-30 g; added sugar below 5% of energy.
Sample day:
- Breakfast: oats or buckwheat porridge made with low-fat milk + 1 boiled egg + a handful of nuts.
- Mid-morning: 1 apple or guava + green tea.
- Lunch: 1 cup red rice + dal + chicken or fish curry (palm-sized) + half plate of vegetables (ema datshi with little cheese, beans, spinach) + salad.
- Afternoon: plain curd with seeds, or roasted chickpeas.
- Dinner: 1 cup red rice or 2 whole-wheat chapatis + egg or paneer or tofu curry + mixed vegetables + vegetable soup.
- Bedtime (if hungry): warm low-fat milk without sugar.
Guidance: no sugary snacks, biscuits or sweet drinks; drink water; limit alcohol (preferably avoid); eat regular meals; continue yoga and add 150 minutes a week of brisk walking, plus stress management for her anxiety."""),
    it("5. Identify one short-term and one long-term nutritional goal for Ms. Yeshi Choden.", 3,
       [("Short-term: e.g. within 4 weeks replace sugary snacks with fruit/ nuts and eat ≥5 servings of vegetables and fruit daily", 1.5),
        ("Long-term: e.g. within 6-12 months bring HbA1c below 5.7% and fasting glucose below 100 mg/dL, regular cycles, maintain healthy weight", 1.5)],
       "Short-term: within 4 weeks, stop sugary snacks (replace with fruit, nuts or curd), switch to whole grains at least once a day, and eat at least 5 servings of vegetables and fruit daily. Long-term: within 6-12 months, return HbA1c to below 5.7% and fasting glucose below 100 mg/dL, improve lipid levels, achieve more regular menstrual cycles and maintain a healthy weight."),
    it("6. Mention one way to monitor Ms. Yeshi Choden's progress in managing her PCOS and prediabetic status.", 2,
       [("One method explained: repeat HbA1c/ fasting glucose every 3-6 months; or food diary, weight/ waist, menstrual cycle record", 2)],
       "Repeat her HbA1c and fasting blood glucose every 3-6 months to check that they return to the normal range, together with a record of her menstrual cycles, weight and waist circumference, and a food diary reviewed at follow-up visits."),
])
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions (6 questions)", "type": "short_answer", "count": 1, "marks_each": 20, "answer_any": None},
    {"title": "Section B: Two compulsory case questions", "type": "passage", "count": 2, "marks_each": 25, "answer_any": None},
]
