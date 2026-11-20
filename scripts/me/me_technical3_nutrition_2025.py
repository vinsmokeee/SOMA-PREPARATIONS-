"""ME Technical Paper III (Subject Specialisation Paper), Nutrition and Dietetics, BCSE 2025 - real paper (PDF sent by the founder).
Own pattern from the paper: Part I 30 MCQ; Part II six short answers (2.5 x 4 + 5 x 2 = 20) as one group; Section B two
compulsory questions of 25 marks. MCQs 3 and 11 ask nearly the same thing in the paper; both are kept as printed.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1"
GROUP_TAG = "nutri2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "nutrition-dietetics"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Nutrition and Dietetics"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following is the best source of heme iron?",
"opts": [
"Spinach",
"Chicken liver",
"Beans",
"Lentils"
]
},
{
"n": 2,
"stem": "What is the primary dietary recommendation for managing hypertension?",
"opts": [
"Increase saturated fat intake",
"Increase sodium intake",
"Follow the DASH diet",
"Consume high-cholesterol foods"
]
},
{
"n": 3,
"stem": "Which macronutrient is most calorie-dense?",
"opts": [
"Protein",
"Carbohydrates",
"Fat",
"Alcohol"
]
},
{
"n": 4,
"stem": "Which vitamin deficiency is most associated with night blindness?",
"opts": [
"Vitamin A",
"Vitamin B12",
"Vitamin D",
"Vitamin E"
]
},
{
"n": 5,
"stem": "A gluten-free diet is primarily indicated for which condition?",
"opts": [
"Crohn’s disease",
"Irritable bowel syndrome",
"Celiac disease",
"Ulcerative colitis"
]
},
{
"n": 6,
"stem": "Which of the following foods is contraindicated in a patient with galactosemia?",
"opts": [
"Soy milk",
"Cow’s milk",
"Rice",
"Bananas"
]
},
{
"n": 7,
"stem": "Which mineral is critical in preventing neural tube defects in newborns?",
"opts": [
"Calcium",
"Zinc",
"Iron",
"Folate"
]
},
{
"n": 8,
"stem": "Which is the most effective intervention to prevent iodine deficiency?",
"opts": [
"Promote eating seafood",
"Iodine injection",
"Universal salt iodization",
"Multivitamin distribution"
]
},
{
"n": 9,
"stem": "Stunting in children is best described as:",
"opts": [
"Low weight for height",
"Low weight for age",
"Low height for age",
"High BMI for age"
]
},
{
"n": 10,
"stem": "Which foodborne illness is most likely in improperly prepared fermented foods?",
"opts": [
"Typhoid",
"Botulism",
"Salmonella",
"Norovirus"
]
},
{
"n": 11,
"stem": "Which of the following macronutrients provides the most energy per gram?",
"opts": [
"Protein",
"Carbohydrate",
"Fat",
"Fiber"
]
},
{
"n": 12,
"stem": "Which vitamin is most sensitive to light exposure?",
"opts": [
"Vitamin A",
"Vitamin B12",
"Vitamin C",
"Riboflavin"
]
},
{
"n": 13,
"stem": "Which of the following is an essential fatty acid?",
"opts": [
"Palmitic acid",
"Oleic acid",
"Linoleic acid",
"Stearic acid"
]
},
{
"n": 14,
"stem": "The main function of dietary fiber includes:",
"opts": [
"Providing energy",
"Promoting calcium absorption",
"Supporting bowel movement",
"Enhancing iron uptake"
]
},
{
"n": 15,
"stem": "Vitamin K is primarily required for:",
"opts": [
"Vision",
"Wound healing",
"Bone formation",
"Blood clotting"
]
},
{
"n": 16,
"stem": "Basal Metabolic Rate (BMR) is influenced by all of the following EXCEPT:",
"opts": [
"Age",
"Gender",
"Sleep duration",
"Body composition"
]
},
{
"n": 17,
"stem": "Which type of diet is recommended for a patient with chronic kidney disease?",
"opts": [
"High-protein diet",
"Low-protein, low-potassium diet",
"High-sodium diet",
"Gluten-free diet"
]
},
{
"n": 18,
"stem": "Glycemic Index is a measure of:",
"opts": [
"Protein content in food",
"Blood sugar rise after carbohydrate intake",
"Fat content in food",
"Sodium content in food"
]
},
{
"n": 19,
"stem": "Enteral nutrition is preferred over parenteral nutrition because:",
"opts": [
"It is more expensive",
"It bypasses the gut",
"It maintains gut integrity",
"It reduces food allergies"
]
},
{
"n": 20,
"stem": "Diabetic patients should aim to include which type of carbohydrates?",
"opts": [
"Simple carbohydrates",
"High GI carbohydrates",
"Complex carbohydrates with fiber",
"Refined carbohydrates"
]
},
{
"n": 21,
"stem": "Which food helps improve iron absorption?",
"opts": [
"Tea",
"Milk",
"Lemon",
"Rice"
]
},
{
"n": 22,
"stem": "A patient recovering from surgery should have a diet rich in:",
"opts": [
"Carbohydrates",
"Proteins",
"Fats",
"Vitamins only"
]
},
{
"n": 23,
"stem": "The recommended daily salt intake for adults as per WHO guidelines is:",
"opts": [
"10 grams",
"8 grams",
"5 grams",
"3 grams"
]
},
{
"n": 24,
"stem": "Which of the following is a waterborne disease?",
"opts": [
"Tuberculosis",
"Dengue",
"Cholera",
"Influenza"
]
},
{
"n": 25,
"stem": "Which of the following best defines food fortification?",
"opts": [
"Adding flavor to food",
"Adding nutrients to food during processing",
"Removing calories from food",
"Replacing fat with protein"
]
},
{
"n": 26,
"stem": "What is the recommended daily intake of protein for a patient undergoing hemodialysis?",
"opts": [
"0.8 g/kg body weight",
"1.0 g/kg body weight",
"1.2-1.5 g/kg body weight",
"2.0 g/kg body weight"
]
},
{
"n": 27,
"stem": "What is the purpose of conducting a Hazard Analysis Critical Control Point (HACCP) plan in a foodservice operation?",
"opts": [
"Reduce food cost",
"Ensure nutritional adequacy",
"Prevent foodborne illness",
"Improve employee satisfaction"
]
},
{
"n": 28,
"stem": "Which lab value is most commonly monitored in iron deficiency anemia?",
"opts": [
"Serum calcium",
"Serum ferritin",
"Serum albumin",
"Serum bilirubin"
]
},
{
"n": 29,
"stem": "Refeeding syndrome is most likely to occur in:",
"opts": [
"A patient with high cholesterol",
"A well-nourished patient receiving supplements",
"A severely malnourished patient started on aggressive feeding",
"A patient with type 1 diabetes"
]
},
{
"n": 30,
"stem": "Which hormone is primarily responsible for lowering blood glucose levels after a meal?",
"opts": [
"Glucagon",
"Insulin",
"Cortisol",
"Epinephrine"
]
}
]"""

KEY = {
    1: ("b", "Chicken liver is rich in haem iron; plant foods give non-haem iron."), 2: ("c", "The DASH diet is the main dietary approach for hypertension."),
    3: ("c", "Fat gives 9 kcal/g, more than alcohol (7), protein or carbohydrate (4)."), 4: ("a", "Vitamin A deficiency causes night blindness."),
    5: ("c", "A gluten-free diet treats coeliac disease."), 6: ("b", "Galactosaemia: avoid lactose/galactose, e.g. cow's milk."),
    7: ("d", "Folate (folic acid) prevents neural tube defects."), 8: ("c", "Universal salt iodisation is the most effective strategy."),
    9: ("c", "Stunting = low height-for-age."), 10: ("b", "Improperly prepared fermented or preserved foods can cause botulism."),
    11: ("c", "Fat provides 9 kcal per gram."), 12: ("d", "Riboflavin is the vitamin most sensitive to light."),
    13: ("c", "Linoleic acid (omega-6) is an essential fatty acid."), 14: ("c", "Fibre supports regular bowel movements."),
    15: ("d", "Vitamin K is needed for clotting factors."), 16: ("c", "BMR depends on age, sex and body composition, not sleep duration."),
    17: ("b", "Non-dialysis CKD: controlled protein and restricted potassium (and phosphate, sodium)."), 18: ("b", "GI measures how quickly a carbohydrate food raises blood glucose."),
    19: ("c", "Enteral feeding maintains gut integrity and immunity."), 20: ("c", "Complex, high-fibre carbohydrates suit diabetes."),
    21: ("c", "Vitamin C (lemon) increases non-haem iron absorption."), 22: ("b", "Protein supports tissue repair after surgery."),
    23: ("c", "WHO: less than 5 g salt per day."), 24: ("c", "Cholera is waterborne."),
    25: ("b", "Fortification adds nutrients during processing."), 26: ("c", "Haemodialysis patients need about 1.2-1.5 g protein/kg/day."),
    27: ("c", "HACCP prevents foodborne illness."), 28: ("b", "Serum ferritin reflects iron stores."),
    29: ("c", "Refeeding syndrome occurs when severely malnourished patients are fed aggressively."), 30: ("b", "Insulin lowers blood glucose after meals."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T)
SA = [
    ("Discuss the role of diet in the prevention and management of type 2 diabetes mellitus.", 2.5,
     [("Prevention: healthy weight, high fibre/ whole grains, limit sugar and refined carbs, healthy fats, activity", 1), ("Management: carbohydrate control/ consistency, low GI, regular meals, portion control, weight loss, reduce saturated fat/ salt, avoid sugary drinks and alcohol, links to medication", 1.5)],
     "Prevention: maintaining a healthy weight (5-7% weight loss in overweight people reduces risk), a diet high in fibre, vegetables, pulses and whole grains (red rice, buckwheat), limiting sugar, sugary drinks and refined carbohydrates, choosing healthy fats, plus physical activity. Management: control the amount and type of carbohydrate (consistent portions spread through the day, low-GI foods, plate method with half vegetables), regular meal timing matched to medication, weight reduction, limiting saturated fat (butter, fatty meat) and salt to protect the heart and kidneys, avoiding alcohol and sweets, and monitoring blood glucose to adjust diet."),
    ("Discuss the nutritional management of a patient with chronic kidney disease (CKD).", 2.5,
     [("Protein control by stage (0.6-0.8 g/kg pre-dialysis, 1.2 g/kg on dialysis), adequate energy", 1), ("Restrict sodium, potassium, phosphorus as needed; fluid control; manage diabetes/ BP; vitamins; avoid malnutrition", 1.5)],
     "Aims: slow progression, control symptoms and prevent malnutrition. Protein: limit to about 0.6-0.8 g/kg/day before dialysis (mostly high-quality protein), increase to 1.2 g/kg on dialysis. Energy: adequate (30-35 kcal/kg) to prevent muscle breakdown. Sodium: less than about 2 g/day to control BP and fluid. Potassium and phosphorus: restrict when levels are high (limit bananas, potatoes, dairy, processed foods; leaching vegetables; phosphate binders). Fluid restriction in later stages. Control blood glucose and lipids, and give vitamin D/iron as needed under monitoring."),
    ("Explain the rationale behind the DASH diet for managing hypertension.", 2.5,
     [("DASH: rich in fruits, vegetables, whole grains, low-fat dairy, nuts/ legumes; low saturated fat, red meat, sweets, sodium", 1), ("Rationale: high potassium, magnesium, calcium, fibre help lower BP (vasodilation, natriuresis); low sodium reduces fluid volume; lowers SBP ~8-14 mmHg; weight/ lipid benefits", 1.5)],
     "DASH (Dietary Approaches to Stop Hypertension) emphasises fruits, vegetables, whole grains, low-fat dairy, legumes, nuts, fish and poultry, and limits saturated fat, red and processed meat, sugar and sodium. Rationale: it is rich in potassium, magnesium and calcium, which help blood vessels relax and the kidneys excrete sodium; high fibre and low saturated fat improve weight and lipids; with sodium restriction it reduces blood volume and pressure. Trials show DASH lowers systolic BP by about 8-14 mmHg, similar to a drug."),
    ("What dietary modifications are required for peptic ulcer disease?", 2.5,
     [("Balanced diet, small frequent meals, avoid late-night eating", 1), ("Avoid/ limit irritants that worsen symptoms: alcohol, smoking, coffee/ caffeine, very spicy foods (chilli) and acidic foods if they cause pain; NSAIDs; individual tolerance; fibre, fruits/ vegetables allowed", 1.5)],
     "There is no strict 'ulcer diet'; modifications are individual: eat a balanced diet with regular, small, frequent meals and avoid eating just before bed; avoid alcohol, smoking and excessive coffee/caffeine and carbonated drinks, which increase acid; limit very spicy foods (e.g. ema datshi with lots of chilli) and acidic foods if they cause pain; include fibre, fruits and vegetables; avoid milk as a 'remedy' (it can increase acid later); and take medicines (and avoid NSAIDs) as advised - H. pylori eradication is the main treatment."),
    ("Differentiate between high-density lipoprotein (HDL) and low-density lipoprotein (LDL) in terms of structure, function, health implications and dietary influences.", 5,
     [("Structure: HDL small, dense, high protein (apo A-I), low cholesterol; LDL larger, less dense, cholesterol-rich, apo B-100", 1.5), ("Function: HDL reverse cholesterol transport from tissues to liver; LDL delivers cholesterol to tissues", 1), ("Health: high HDL protective; high LDL atherogenic, CVD risk; targets", 1), ("Dietary influences: LDL raised by saturated/ trans fats, cholesterol; lowered by fibre, unsaturated fats, plant sterols; HDL raised by exercise, weight loss, unsaturated fats, not smoking; lowered by trans fats, refined carbs", 1.5)],
     "Structure: HDL is the smallest and densest lipoprotein, with a high proportion of protein (apolipoprotein A-I) and less cholesterol; LDL is larger, less dense and cholesterol-rich, carrying apolipoprotein B-100. Function: HDL carries excess cholesterol from tissues and artery walls back to the liver (reverse cholesterol transport); LDL delivers cholesterol from the liver to body cells. Health implications: high HDL ('good cholesterol') protects against heart disease; high LDL ('bad cholesterol') deposits in artery walls, causing atherosclerosis, heart attack and stroke - LDL is the main treatment target. Dietary influences: LDL rises with saturated fats (butter, ghee, fatty meat), trans fats and dietary cholesterol, and falls with soluble fibre (oats, pulses), unsaturated oils, nuts and plant sterols; HDL rises with regular exercise, weight loss, not smoking and unsaturated fats, and falls with trans fats, refined carbohydrates and obesity."),
    ("Describe the steps involved in assessing a client's nutritional needs and identifying any dietary restrictions.", 5,
     [("ABCD assessment: anthropometry (weight, height, BMI, MUAC, waist), biochemical (Hb, albumin, glucose, lipids, renal), clinical (signs, medical history, medications), dietary (24-h recall, food frequency, diet history)", 3), ("Estimate needs (energy, protein, fluid) and identify restrictions: allergies/ intolerances, disease-related (renal, diabetes), religious/ cultural/ preferences, drug-nutrient interactions, swallowing; nutrition diagnosis (PES) and plan, screening tools (MUST)", 2)],
     "1. Screening with a validated tool (e.g. MUST, NRS-2002) to identify risk. 2. Full assessment (ABCD): Anthropometry - weight, height, BMI, weight change, MUAC, waist circumference; Biochemistry - haemoglobin, albumin, glucose/HbA1c, lipids, kidney and liver function, electrolytes; Clinical - medical history, diagnosis, medications, physical signs of deficiency, appetite, chewing and swallowing, bowel function; Dietary - 24-hour recall, food frequency, diet history, eating pattern, culture and food security. 3. Estimate requirements - energy (e.g. 25-35 kcal/kg), protein, fluids and micronutrients according to age, activity and condition. 4. Identify restrictions - food allergies and intolerances, disease-related restrictions (salt, potassium, sugar), drug-nutrient interactions, religious or cultural practices (vegetarian, fasting), personal preferences and texture modifications. 5. Make a nutrition diagnosis (PES statement), set goals and a care plan, and monitor and evaluate."),
]
for i, (s, mk, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=mk, topic=T, group="me-technical-3-nutri2025-part2", pos=i + 1,
                  stem=f"Part II, question {i + 1}. {s} ({mk} marks)", key_points=kp, model=mod))
C1 = """Question 1: Nutrition support after stroke in a man with diabetes
Patient: Mr Sonam Wangchuk, 68-year-old man. Height 165 cm, weight 75 kg, BMI 27.5 kg/m² (overweight).
Medical history: type 2 diabetes mellitus, ischaemic stroke (ICU admission), hypertension, dyslipidaemia.
Current condition: unconscious and receiving nasogastric (NG) tube feeding; blood glucose 240 mg/dL; HbA1c 8.5%; creatinine normal.
Lifestyle before the stroke: sedentary; diet high in refined carbohydrates and saturated fats; poor glycaemic control and irregular meal times."""
C2 = """Question 2: Nutrition after colorectal surgery
Patient: Mr Sangay Dorji, 60 years. Height 168 cm, weight 64 kg, BMI 22.7 kg/m².
Surgery: right hemicolectomy for colorectal cancer. Complications: wound dehiscence and signs of infection (fever, raised CRP, high WBC).
Oral intake: less than 30% of estimated needs; nausea and early satiety. Labs: albumin 2.8 g/dL, haemoglobin 10.5 g/dL."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("nutri2025", 1, T, C1, items=[
    it("1. Identify two dietary concerns based on Mr Sonam Wangchuk's lifestyle and medical history.", 2,
       [("Two concerns: poor glycaemic control/ hyperglycaemia (high refined carbohydrates, HbA1c 8.5%, BG 240); high saturated fat - dyslipidaemia/ atherosclerosis and stroke risk; overweight; sodium/ hypertension; irregular meals", 2)],
       "1. Poor glycaemic control - a diet high in refined carbohydrates with irregular meals, reflected in blood glucose 240 mg/dL and HbA1c 8.5%. 2. High saturated fat intake with overweight and sedentary lifestyle, worsening dyslipidaemia, hypertension and atherosclerosis - the cause of his ischaemic stroke (also likely high salt intake)."),
    it("2. Explain why it is important to monitor carbohydrate intake in Mr Sonam Wangchuk's nutrition therapy.", 3,
       [("Carbohydrate is main determinant of blood glucose; hyperglycaemia (240) worsens stroke outcome, infection, healing", 1.5), ("Consistent controlled amount in feeds matched to insulin avoids hyper/ hypoglycaemia; target 140-180 mg/dL in ICU; diabetes-specific formula", 1.5)],
       "Carbohydrate has the greatest effect on blood glucose. In the acute stroke and ICU setting, hyperglycaemia (240 mg/dL) is linked to larger brain damage, worse neurological outcome, infections and poor wound healing, while hypoglycaemia is also dangerous in an unconscious patient who cannot report symptoms. Monitoring the amount and type of carbohydrate in the tube feed (e.g. a diabetes-specific, low-GI, higher-fibre formula given continuously or at regular times) and matching it with insulin keeps glucose in the target range (about 140-180 mg/dL)."),
    it("3. Write one PES (problem, aetiology, signs/symptoms) statement for his diabetes.", 3,
       [("Problem: e.g. altered nutrition-related laboratory values (glucose) / excessive carbohydrate intake / inconsistent carbohydrate intake", 1), ("Aetiology: related to high refined carbohydrate diet, irregular meals, insulin resistance", 1), ("Signs: as evidenced by BG 240 mg/dL, HbA1c 8.5%", 1)],
       "Altered nutrition-related laboratory values (blood glucose) related to a diet high in refined carbohydrates, irregular meal timing and insulin resistance, as evidenced by blood glucose of 240 mg/dL and HbA1c of 8.5%."),
    it("4. Write one PES statement related to his ICU admission and feeding status.", 3,
       [("Problem: inadequate oral intake / swallowing difficulty / need for enteral nutrition", 1), ("Aetiology: related to unconsciousness after ischaemic stroke", 1), ("Signs: as evidenced by unconscious state, NG tube feeding, ICU admission", 1)],
       "Inadequate oral intake (inability to eat) related to unconsciousness and impaired swallowing following ischaemic stroke, as evidenced by ICU admission and the need for nasogastric tube feeding to meet nutritional needs."),
    it("5. Suggest two considerations when starting nutrition support via NG tube for Mr Sonam Wangchuk.", 4,
       [("Formula choice and requirements: diabetes-specific/ standard formula, energy ~25 kcal/kg (adjusted for overweight), protein 1.2-1.5 g/kg, fluids", 2), ("Safety: confirm tube position, head elevation 30-45° to prevent aspiration, start slowly and advance, monitor glucose, tolerance (residuals, diarrhoea), refeeding risk, electrolytes", 2)],
       "1. Requirements and formula - estimate needs (about 20-25 kcal/kg, around 1500-1800 kcal/day, protein 1.2-1.5 g/kg) and choose a diabetes-specific or standard high-fibre formula; start at a low rate and increase gradually to target within 48-72 hours, adjusting insulin to keep glucose 140-180 mg/dL. 2. Safety and tolerance - confirm tube position (pH/X-ray) before feeding, keep the head of the bed raised 30-45° to prevent aspiration pneumonia, flush the tube regularly, and monitor gastric residuals, vomiting, diarrhoea, blood glucose, electrolytes and fluid balance."),
    it("6. Recommend two dietary modifications to support stroke recovery and prevent recurrence.", 4,
       [("Two modifications with reasons: reduce sodium (<5 g salt) for BP; reduce saturated/ trans fat, increase unsaturated fats, omega-3 for lipids; increase fruits/ vegetables/ whole grains/ fibre (DASH/ Mediterranean); controlled carbohydrate/ weight loss; adequate protein for recovery; texture modification for dysphagia", 4)],
       "1. Follow a DASH/Mediterranean-style heart-healthy diet: limit salt to less than 5 g/day (less suja, ezay and processed food) to control blood pressure; replace saturated fats (butter, fatty pork) with unsaturated oils, nuts and fish to lower LDL cholesterol. 2. Increase fruits, vegetables, whole grains and pulses (fibre) with controlled, consistent carbohydrate portions to improve glycaemic control and support gradual weight loss. Also: adequate protein for muscle recovery and texture-modified food if swallowing is impaired, and no alcohol or smoking."),
    it("7. Propose one strategy to improve his glycaemic control after discharge.", 3,
       [("One strategy explained: structured meal plan with carbohydrate counting/ plate method and regular meal times, with diabetes education for patient and family, glucose self-monitoring, medication adherence, follow-up with dietitian; physical activity as tolerated", 3)],
       "Give structured diabetes nutrition education to Mr Sonam Wangchuk and his family (who will prepare his food): a written meal plan using the plate method (half vegetables, a quarter protein, a quarter whole-grain carbohydrate such as red rice), three regular meals with planned snacks at consistent times matched to his medicines, limiting sweets and sugary drinks, with home blood glucose monitoring and regular follow-up with the dietitian and diabetes clinic to adjust the plan."),
    it("8. Identify one short-term and one long-term nutrition goal for Mr Sonam Wangchuk.", 3,
       [("Short-term: e.g. meet 80-100% of energy/ protein needs via NG within 3-5 days with BG 140-180 mg/dL, no aspiration", 1.5), ("Long-term: e.g. HbA1c < 7%, gradual 5-7% weight loss, LDL/ BP targets, safe oral diet, prevent recurrent stroke", 1.5)],
       "Short-term: within 3-5 days, receive at least 80-100% of estimated energy and protein needs by NG tube with blood glucose kept between 140 and 180 mg/dL and no aspiration. Long-term: over 3-6 months, achieve HbA1c below 7%, a 5-7% weight reduction and controlled BP and LDL cholesterol, and transition safely to an oral heart-healthy diabetic diet to prevent another stroke."),
])
Q += case("nutri2025", 2, T, C2, items=[
    it("1. Identify two dietary concerns based on Mr Sangay Dorji's post-operative condition.", 3,
       [("Inadequate energy and protein intake (<30% needs, nausea, early satiety) - risk of malnutrition", 1.5), ("Increased requirements for wound healing and infection (hypermetabolism), low albumin and anaemia - protein, micronutrients (zinc, vitamin C, iron)", 1.5)],
       "1. Inadequate oral intake - eating less than 30% of needs because of nausea and early satiety, putting him at high risk of post-operative malnutrition. 2. Increased requirements - infection and wound dehiscence raise energy and protein needs (hypermetabolism), while low albumin and haemoglobin indicate protein depletion, inflammation and anaemia (also needs for zinc, vitamin C and iron for healing)."),
    it("2. Explain the significance of his low albumin level for post-operative recovery.", 3,
       [("Albumin 2.8 g/dL low (<3.5) - marker of inflammation/ illness severity and nutritional risk (negative acute phase protein), not just intake", 1.5), ("Associated with poor wound healing, oedema, infection, complications, longer stay, mortality; monitor with other markers", 1.5)],
       "An albumin of 2.8 g/dL (normal 3.5-5.0) indicates high risk. Albumin falls during infection and inflammation (it is a negative acute-phase protein) as well as in protein malnutrition, so it reflects illness severity more than recent intake. Low albumin is associated with poor wound healing, tissue oedema (including at the bowel anastomosis), reduced drug binding, more infections and complications, longer hospital stay and higher mortality - so it signals the need for aggressive nutrition support, monitored with weight, intake and prealbumin/CRP."),
    it("3. Discuss two potential dietary strategies to improve Mr Sangay Dorji's nutritional status.", 4,
       [("Strategy 1: small, frequent, energy- and protein-dense meals and snacks; oral nutritional supplements (high-protein); manage nausea (antiemetics, cold/ dry foods)", 2), ("Strategy 2: if intake remains < 60% for several days, enteral tube feeding (or parenteral if gut not usable); micronutrient support (zinc, vitamin C, iron, multivitamin)", 2)],
       "1. Food fortification and oral nutritional supplements - offer six small, frequent, energy- and protein-dense meals and snacks (eggs, milk, curd, lentils, fortified porridge, soups with added protein), plus high-protein oral supplements 2-3 times a day; manage nausea with antiemetics, cold or bland foods and avoiding large or greasy meals. 2. Escalate nutrition support if oral intake stays below about 60% of needs for 3-5 days - nasogastric/nasojejunal enteral feeding (or parenteral nutrition if the gut cannot be used), with micronutrient supplements (zinc, vitamin C, iron, multivitamin) for wound healing."),
    it("4. Propose a full diet plan for Mr Sangay Dorji, including energy and macronutrient calculations, to support wound healing and recovery.", 10,
       [("Energy: 30-35 kcal/kg x 64 kg ≈ 1920-2240 kcal (e.g. ~2200 kcal)", 2), ("Protein: 1.5-2.0 g/kg ≈ 96-128 g (e.g. ~110 g, ~20% energy)", 2), ("Fat ~30% (~70-75 g), carbohydrate remainder (~270-300 g); fluids ~30-35 mL/kg (~2 L); micronutrients", 2), ("Meal plan: 6 small meals with local foods and supplements, distributing protein; texture/ low-residue initially as needed", 3), ("Practical points: nausea management, monitoring, progression", 1)],
       """Calculations (weight 64 kg): energy 30-35 kcal/kg = 1920-2240 kcal → about 2200 kcal/day. Protein 1.5-1.8 g/kg = 96-115 g → about 110 g (440 kcal, 20% of energy). Fat about 30% of energy = 660 kcal → about 73 g. Carbohydrate the remainder = 2200 - 440 - 660 = 1100 kcal → about 275 g. Fluids about 30-35 mL/kg ≈ 2-2.2 L/day (more with fever). Micronutrients: multivitamin and mineral with vitamin C, zinc and iron (for Hb 10.5).
Sample plan (six small meals, soft, low-fat, initially lower residue):
- Early morning: milk tea with milk powder added + 2 biscuits.
- Breakfast: rice or wheat porridge made with milk + 1 boiled egg + banana.
- Mid-morning: high-protein oral supplement (about 300 kcal, 15-20 g protein).
- Lunch: soft rice (1 cup) + dal (1 bowl) + chicken or fish stew (60-90 g) + cooked vegetables (pumpkin, carrot) + curd.
- Afternoon: oral supplement or milk with fortified flour porridge + egg/paneer.
- Dinner: soft rice or noodles + egg curry or minced meat + vegetable soup + fruit stewed.
- Bedtime: warm milk.
This provides about 2200 kcal and 105-115 g protein. Practical points: eat small amounts slowly, cold or room-temperature foods when nauseated, liquids between meals, antiemetics before meals; progress fibre as tolerated; monitor intake and adjust; move to tube feeding if targets are not met."""),
    it("5. Identify one short-term and one long-term nutrition goal for Mr Sangay Dorji.", 3,
       [("Short-term: e.g. increase intake to ≥75% of energy and protein needs within 5-7 days; nausea controlled", 1.5), ("Long-term: e.g. complete wound healing, maintain/ regain weight, normal albumin/ Hb, tolerate oncology treatment, healthy diet for cancer survivorship", 1.5)],
       "Short-term: within 5-7 days, meet at least 75% of estimated energy (about 2200 kcal) and protein (about 110 g) needs through food and supplements, with nausea controlled. Long-term: over the next 2-3 months, achieve complete wound healing, maintain or regain body weight, normalise albumin and haemoglobin, and be well-nourished to tolerate any further cancer treatment, then follow a healthy, high-fibre diet for colorectal cancer survivorship."),
    it("6. Mention one way to monitor Mr Sangay Dorji's progress in nutritional recovery.", 2,
       [("One method explained: daily food intake/ calorie count charts, weekly weight, wound healing, labs (albumin/ prealbumin, CRP, Hb), handgrip strength", 2)],
       "Keep a daily food and supplement intake chart (calorie and protein count) to check that he meets at least 75% of targets, together with weekly weight, wound healing progress and laboratory markers (prealbumin/albumin with CRP, haemoglobin) - for example prealbumin rising as CRP falls shows recovery."),
])
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions (6 questions)", "type": "short_answer", "count": 1, "marks_each": 20, "answer_any": None},
    {"title": "Section B: Two compulsory case questions", "type": "passage", "count": 2, "marks_each": 25, "answer_any": None},
]
