"""ME Technical Paper III (Subject Specialisation Paper), Medical Laboratory Technology, BCSE 2024 - real paper (PDF sent by the founder).
Standard pattern, same as the 2025 MLT paper (the latest). Replaced MCQs (more than one option defensible): 1 (who first
developed the microscope), 5 (H. pylori: culture vs histopathology), 7 (normal sperm count ranges differ), 11 (tissue:
fixative 1:10 vs 1:20), 15 (several causes of haemolysis), 18 (fixation vs embedding), 22 (reflected light), 25 (several
incorrect statements). MCQ 26's rule names are re-typed (8x read as 10x). Short answer 3 shows the two enzyme graphs;
Case II shows the L-J chart. The PDF labels glucose control values g/dl; the chart's mg/dl is used.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1"
GROUP_TAG = "mlt2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "medical-laboratory-technology"
ADDS_TO_PAPER = True  # 2025 is the latest MLT paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Medical Laboratory Technology"

MCQ = r"""[
{
"n": 1,
"stem": "Correct statement regarding microscope is:",
"opts": [
"Electrons are used as a source of illumination in Electron microscope",
"Antonie Van Leeuwenhoek developed microscope first time",
"Knoll & Ruska developed electron microscope",
"All the above"
]
},
{
"n": 2,
"stem": "All of the following are acid-fast organisms EXCEPT:",
"opts": [
"Mycobacterium tuberculosis",
"Nocardia",
"Isospora belli",
"Staphylococcus"
]
},
{
"n": 3,
"stem": "Identify correct statement regarding bacteria:",
"opts": [
"Respiration, cell division and sporulation are the functions of mesosome in bacteria.",
"Capsule in bacteria enables adherence to surface and protection against phagocytosis",
"Heterotrophs are the bacteria that are unable to synthesize their own food materials.",
"All the above"
]
},
{
"n": 4,
"stem": "Which of the following is most resistant to sterilization?",
"opts": [
"Tubercle bacilli",
"Viruses",
"Spores",
"Prions"
]
},
{
"n": 5,
"stem": "Most accurate method of diagnosis of Helicobacter pylori is:",
"opts": [
"Culture",
"Biopsy urease test",
"Histopathology",
"Urea breath test"
]
},
{
"n": 6,
"stem": "Anti-D given to a Rh negative pregnant woman with Rh- positive fetus, before delivery is an example of:",
"opts": [
"Artificial active immunity",
"Artificial passive immunity",
"Natural passive immunity",
"Adaptive immunity"
]
},
{
"n": 7,
"stem": "Normal sperm count human being is",
"opts": [
"80 - 160 millions / ml",
"40 - 80 millions / ml",
"100 - 120 millions / ml",
"140 - 200 millions / ml"
]
},
{
"n": 8,
"stem": "The basic component of Leishman's stain is:",
"opts": [
"Eosin",
"Malachite green",
"Methylene blue",
"None of the above"
]
},
{
"n": 9,
"stem": "Which of the following is a Romanowsky stain",
"opts": [
"Leishman’s stain",
"Giemsas stain",
"Jenners stain",
"All the above"
]
},
{
"n": 10,
"stem": "Which of the following types of microscopy is valuable in the identification of crystals that are able to rotate light?",
"opts": [
"Compound bright field",
"Dark field",
"Polarizing",
"Phase-contrast"
]
},
{
"n": 11,
"stem": "What should be the ratio between the volume of the tissue and the fixative:",
"opts": [
"1:5",
"1:10",
"1:20",
"1:100"
]
},
{
"n": 12,
"stem": "What is the usual concentration of the commercial formaldehyde available:",
"opts": [
"7 to 10%",
"17 to 27%",
"37 to 40%",
"40 to 50%"
]
},
{
"n": 13,
"stem": "What vein/veins is not used to obtain a venous blood sample:",
"opts": [
"basilica vein",
"cephalic vein",
"medial cubital vein",
"femoral vein"
]
},
{
"n": 14,
"stem": "A blood specimen collected in a heparinized tube is centrifuged. It will separate into:",
"opts": [
"Serum and clot",
"Plasma and clot",
"Serum and plasma",
"Plasma, buffy coat, RBC"
]
},
{
"n": 15,
"stem": "Hemolysis may result from:",
"opts": [
"Using a 25-gauge needle on an adult",
"Vigorously shaking the blood specimen",
"Refrigerating the vacutainer before use",
"All the above"
]
},
{
"n": 16,
"stem": "Which statement is false when setting up an ESR:",
"opts": [
"it must be read in exactly one hour",
"it should be set up near a centrifuge",
"the blood level must be at exactly zero",
"it should be performed on fresh blood"
]
},
{
"n": 17,
"stem": "Which microscope makes things appear three dimensional?",
"opts": [
"Simple microscope",
"Compound microscope",
"Phase contrast microscope",
"Dissection microscope"
]
},
{
"n": 18,
"stem": "During the preparation of a routine H&E slide, what allows the tissue to hold its form?",
"opts": [
"Fixation",
"Embedding in paraffin",
"Staining",
"Slicing"
]
},
{
"n": 19,
"stem": "During the window period of patient with AIDS, best diagnostic test is:",
"opts": [
"ELISA",
"Western Blot",
"Rapid test",
"RT-PCR"
]
},
{
"n": 20,
"stem": "Method of sterilization used for culture media is:",
"opts": [
"Autoclave",
"Hot air oven",
"Pasteurization",
"None of the above"
]
},
{
"n": 21,
"stem": "Temperature range used for autoclaving is:",
"opts": [
"100°C for 10 min",
"100°C for 30 min",
"121°C for 15 min",
"121°C for 30 min"
]
},
{
"n": 22,
"stem": "Reflected light is used in",
"opts": [
"Light microscope",
"Phase contrast microscope",
"Dark field microscope",
"Electron microscope"
]
},
{
"n": 23,
"stem": "The 'word' which refers to the 'closeness of a result on repeated analysis' is",
"opts": [
"Accuracy",
"Sensitivity",
"Precision",
"Specificity"
]
},
{
"n": 24,
"stem": "Choose the most correct cause of random laboratory errors from the following:",
"opts": [
"Calibration errors",
"Change in the reagent lot",
"Inappropriate pipetting",
"Expiring of reagents"
]
},
{
"n": 25,
"stem": "Choose the incorrect characteristic of frozen serum used as quality control material:",
"opts": [
"It is in liquid form which is ready made to be used.",
"It can be stored at room temperature",
"It is stable for longer period at 2-8oC",
"Doesn’t effect by the light"
]
},
{
"n": 26,
"stem": "All the following Westgard control rules detect systematic error except:",
"opts": [
"R4s rule",
"10x rule",
"7T rule",
"3(1s) rule"
]
},
{
"n": 27,
"stem": "End point method of measurement involves:",
"opts": [
"Recording of absorbance at the certain interval of time during the chemical reactions.",
"Recording of absorbance at the fixed time when the reaction is about to be completed.",
"Recording of absorbance at the fixed time when the reaction is completed.",
"Recording of absorbance at the beginning of the reaction."
]
},
{
"n": 28,
"stem": "All the following are incorrect statement of the Beer’s-Lambert Law Except:",
"opts": [
"Absorbance is indirectly proportional to the concentration of the solution in the cuvette.",
"Absorbance is indirectly proportional to the intensity of the monochromatic light striking the cuvette with solution.",
"Absorbance is directly proportional to the thickness of the cuvette.",
"Absorbance is indirectly proportional to the temperature of the solution."
]
},
{
"n": 29,
"stem": "All the following tests are lipid panels EXCEPT:",
"opts": [
"Triglyceride",
"Cholesterol",
"LDL/HDL",
"LDH"
]
},
{
"n": 30,
"stem": "Choose any of the following parameters which can be used to calculate coefficient variation in the Laboratory IQC:",
"opts": [
"Variance and mean",
"Median and variance",
"Standard deviation and the mean",
"Square root of Variance"
]
}
]"""

KEY = {
    2: ("d", "Mycobacteria, Nocardia (weakly) and Isospora oocysts are acid-fast; Staphylococcus is not."),
    3: ("d", "All three statements are standard textbook facts (mesosome functions, capsule roles, heterotrophs)."),
    4: ("d", "Prions are the most resistant infectious agents to standard sterilisation."),
    6: ("b", "Giving preformed antibody (anti-D immunoglobulin) is artificial passive immunity."),
    8: ("c", "Methylene blue (and its oxidation products, azures) is the basic component of Romanowsky stains such as Leishman's; eosin is the acidic dye."),
    9: ("d", "Leishman, Giemsa and Jenner are all Romanowsky-type stains."),
    10: ("c", "Polarising microscopy identifies birefringent crystals (e.g. urate, CPPD)."),
    12: ("c", "Commercial formalin is 37-40% formaldehyde gas in water."),
    13: ("d", "The femoral vein is not used for routine venous sampling."),
    14: ("d", "Heparin prevents clotting, so centrifuged blood separates into plasma, buffy coat and red cells."),
    16: ("b", "An ESR must be set up away from vibration, e.g. not near a centrifuge - so b is false."),
    17: ("d", "A dissection (stereo) microscope gives a three-dimensional view."),
    19: ("d", "In the window period antibodies are not yet detectable; RT-PCR detects viral RNA."),
    20: ("a", "Culture media are sterilised by autoclaving."),
    21: ("c", "Standard autoclaving: 121 °C (15 psi) for 15 minutes."),
    23: ("c", "Precision is the closeness of repeated results (reproducibility)."),
    24: ("c", "Inconsistent pipetting causes random error; calibration, reagent lot change and expired reagents cause systematic error."),
    26: ("a", "The R4s rule detects random error; 10x, 7T and 3(1s) detect systematic error."),
    27: ("c", "End-point methods read absorbance once the reaction is complete."),
    28: ("c", "Beer-Lambert: A = εlc - absorbance is directly proportional to path length (cuvette thickness) and concentration."),
    29: ("d", "LDH is an enzyme (cardiac/ tissue damage), not part of the lipid panel."),
    30: ("c", "CV = SD / mean x 100."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "The anticoagulant of choice for a complete blood count (CBC) is", ["Sodium citrate", "EDTA", "Heparin", "Sodium fluoride"], "b",
            "EDTA (lavender top) preserves cell morphology for haematology."),
    new_mcq(2, T, "After Gram staining, Gram-positive bacteria appear", ["Pink/ red", "Purple/ violet", "Green", "Colourless"], "b",
            "Gram-positive cells retain the crystal violet-iodine complex."),
    new_mcq(3, T, "The primary stain in the Ziehl-Neelsen method is", ["Crystal violet", "Carbol fuchsin", "Safranin", "Methylene blue"], "b",
            "Hot carbol fuchsin, decolourised with acid-alcohol, counterstained with methylene blue."),
    new_mcq(4, T, "Coagulation tests such as PT and APTT are done on blood collected in", ["EDTA", "3.2% sodium citrate", "Sodium fluoride", "Plain tube"], "b",
            "Citrate (light-blue top, 9:1 blood to anticoagulant) binds calcium reversibly."),
    new_mcq(5, T, "Which is a non-treponemal screening test for syphilis?", ["VDRL", "TPHA", "FTA-ABS", "Widal"], "a",
            "VDRL and RPR are non-treponemal screening tests; TPHA and FTA-ABS are confirmatory."),
    new_mcq(6, T, "The universal red cell donor blood group is", ["AB positive", "A negative", "O negative", "B positive"], "c",
            "O negative red cells lack A, B and D antigens."),
    new_mcq(7, T, "Which enzyme is the most specific marker of liver cell injury?", ["ALT", "AST", "ALP", "Amylase"], "a",
            "ALT is found mainly in the liver; AST is also in heart and muscle."),
    new_mcq(8, T, "Blood glucose samples are collected in tubes containing sodium fluoride because it", ["prevents clotting only", "inhibits glycolysis", "preserves cell morphology", "activates platelets"], "b",
            "Fluoride inhibits enolase, stopping glycolysis by blood cells."),
]

SA = [
    ("Following are the categories of biochemistry tests performed routinely at Jigme Dorji Wangchuck National Referral Hospital (JDWNRH). Write at least three laboratory tests in each category: (1) diabetic profile tests; (2) liver function tests; (3) renal function tests; (4) serum electrolytes; (5) lipid profile tests; (6) cardiac profile tests; (7) protein panel; (8) hormone tests; (9) tumour markers. (5 marks)",
     [("Correct tests for each of the nine categories (about 0.5 mark per category, 3 tests each)", 5)],
     "(1) Diabetic profile: fasting and random blood glucose, post-prandial glucose/ OGTT, HbA1c (urine microalbumin). (2) Liver function: total and direct bilirubin, ALT, AST, ALP, GGT, total protein and albumin. (3) Renal function: urea (BUN), creatinine, uric acid (eGFR). (4) Serum electrolytes: sodium, potassium, chloride (bicarbonate). (5) Lipid profile: total cholesterol, triglycerides, HDL-cholesterol, LDL-cholesterol (VLDL). (6) Cardiac profile: troponin I/T, CK-MB, CK, LDH (myoglobin, NT-proBNP). (7) Protein panel: total protein, albumin, globulin, A/G ratio. (8) Hormones: TSH, free T3, free T4 (also beta-hCG, prolactin, cortisol). (9) Tumour markers: AFP, CEA, PSA, CA-125 (CA 19-9)."),
    ("Explain the principle, procedure and clinical significance of the indirect Coombs test performed in the blood bank. (5 marks)",
     [("Principle: detects in vitro sensitisation - patient's serum incubated with reagent red cells; antibodies (IgG) coat cells, antihuman globulin (Coombs reagent) bridges them → agglutination", 2),
      ("Procedure: patient serum + O screening cells (or donor cells), incubate 37 °C, wash 3x with saline, add AHG, centrifuge, read agglutination; check negatives with Coombs control cells", 1.5),
      ("Significance: antibody screening and cross-matching before transfusion, antenatal screening (anti-D) for HDFN, identifying alloantibodies, weak D", 1.5)],
     "Principle: the indirect antiglobulin (Coombs) test detects free IgG antibodies in the patient's serum against red cell antigens. In the first stage, serum is incubated with red cells so that any antibody coats (sensitises) the cells in vitro; in the second stage antihuman globulin (Coombs reagent) is added, which bridges the antibody-coated cells and causes visible agglutination. Procedure: mix 2 drops of patient serum with 1 drop of 3-5% suspension of reagent (group O screening) or donor red cells; incubate at 37 °C for 30-60 minutes (or with LISS for 15 minutes); wash the cells three times with saline to remove unbound globulins; add 2 drops of AHG reagent, centrifuge and read for agglutination; confirm negative results by adding IgG-coated (Coombs control) cells, which should agglutinate. Clinical significance: antibody screening and the compatibility cross-match before transfusion (prevents haemolytic transfusion reactions); antenatal screening of mothers (e.g. Rh-negative women) for anti-D and other antibodies that cause haemolytic disease of the fetus and newborn; antibody identification; and weak D and red cell phenotyping."),
    ("Explain what you understand from the two graphs shown regarding the catalytic action of enzymes (an energy diagram of a reaction with and without enzyme, and a curve of initial velocity against substrate concentration). Explain Vmax and Km, and write some important characteristics of a catalyst. (5 marks)",
     [("Graph 1: enzyme lowers activation energy (lower peak) without changing overall energy released (ΔG) or the reactant/ product energy levels - reaction faster", 1.5),
      ("Graph 2: Michaelis-Menten hyperbola - velocity rises with substrate then plateaus as enzyme saturates; Vmax = maximum rate at saturation; Km = substrate concentration at ½Vmax, inverse measure of affinity", 2),
      ("Catalyst characteristics: speeds reaction, not consumed, small amounts, does not change equilibrium/ ΔG, specific (enzymes), affected by temperature, pH, inhibitors", 1.5)],
     "Graph 1 (energy diagram): reactants must pass an energy barrier (activation energy) to become products. The enzyme provides an alternative pathway with a much lower activation energy (lower peak), so more molecules can react and the rate increases greatly; the energy of reactants and products and the overall energy released (ΔG) are unchanged. Graph 2 (Michaelis-Menten curve): at low substrate concentration the initial velocity rises almost linearly (first order); as substrate increases the enzyme's active sites become saturated and the curve levels off towards a maximum (zero order). Vmax is the maximum velocity when all enzyme molecules are saturated with substrate; it depends on enzyme amount. Km (Michaelis constant) is the substrate concentration at which the velocity is half of Vmax; a low Km means high affinity of the enzyme for its substrate. Characteristics of a catalyst: increases the rate of reaction by lowering activation energy; is not consumed or permanently changed; acts in small amounts; does not change the equilibrium or ΔG, only how fast it is reached; enzymes are highly specific, are proteins, and are affected by temperature, pH, cofactors and inhibitors."),
    ("Explain the difference between DNA and RNA in terms of location, structure and function. (5 marks)",
     [("Location: DNA mainly nucleus (also mitochondria); RNA made in nucleus, functions mainly in cytoplasm/ ribosomes", 1.5),
      ("Structure: DNA double-stranded helix, deoxyribose, bases A, T, G, C, long, stable; RNA usually single-stranded, ribose, uracil instead of thymine, shorter, less stable", 2),
      ("Function: DNA stores and transmits genetic information (replication); RNA expresses it - mRNA (message), tRNA (carries amino acids), rRNA (ribosomes), regulatory RNAs", 1.5)],
     "Location: DNA is found mainly in the nucleus (chromosomes), with small amounts in mitochondria; RNA is synthesised in the nucleus (nucleolus for rRNA) and works mainly in the cytoplasm and ribosomes. Structure: DNA is a double-stranded helix of two antiparallel strands held by hydrogen bonds, with deoxyribose sugar and the bases adenine, guanine, cytosine and thymine (A-T, G-C pairing); it is very long and chemically stable. RNA is usually single-stranded (may fold), contains ribose sugar and uracil instead of thymine, is much shorter and less stable. Function: DNA stores the genetic information and passes it on through replication; RNA carries out gene expression - messenger RNA carries the code from DNA to ribosomes, transfer RNA brings amino acids, ribosomal RNA forms ribosomes and catalyses peptide bonds, and small RNAs regulate genes."),
]
for i, (s, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=5, topic=T, stem=s, key_points=kp, model=mod,
                  image=("/papers/me/tech3-mlt-2024-michaelis.png" if i == 2 else None)))

C1 = """Case I: Jaundice in a woman who drinks alcohol
A 30-year-old woman came to the emergency department with a shabby look and abnormal behaviour, complaining of acute abdominal pain, nausea and fever. On examination her skin and eyes appeared yellowish and pale, and there was swelling of the legs and ankles. The attendant revealed that she is a regular alcohol drinker. She was kept under observation for 24 hours.
Vital signs (reference in brackets): BP 130/90 mmHg (≤120/≤80); temperature 40 °C (36.1-37.2 °C); heart rate 120/min (60-100); respiration 25/min (12-20).
Blood/ serum results (reference): lipase 53 U/L (0-60); amylase 130 U/L (30-150); AST 300 U/L (<40); ALT 150 U/L (<40); ALP 530 U/L (30-130); total bilirubin 9.5 mg/dL (<1); direct bilirubin 2.0 mg/dL (0.1-0.3); LDH 250 U/L (100-225); K+ 5.0 mmol/L (3.3-4.8); Na+ 130 mmol/L (133-146); Cl- 92 mmol/L (96-109); Ca2+ 2.3 mmol/L (2.1-2.6); total protein 4.6 g/dL (6-7.8); albumin 2.4 g/dL (3.5-5.5); fasting blood glucose 122 mg/dL (80-140); urea 8 mg/dL (7-18); creatinine 0.9 mg/dL (0.6-1.2); alpha-fetoprotein 60 ng/mL (0-40); rapid tests for HBsAg, HCV and HIV negative."""
C2 = """Case II: Internal quality control for glucose
Internal quality control for glucose has been established using the results of control level I for 12 consecutive days: day 1: 98; day 2: 101; day 3: 88; day 4: 89; day 5: 95; day 6: 87; day 7: 96; day 8: 91; day 9: 96; day 10: 93; day 11: 94; day 12: 86 (mg/dL). The control results are trimmed at ±2SD or by using the CLIA CV. Daily IQC results are plotted on a Levey-Jennings (L-J) chart and Westgard's multi-rules are used to detect errors. The L-J chart shown was generated from control level I over 31 days (mean 92.84; ±1SD 88.15/97.53; ±2SD 83.46/102.22; ±3SD 78.77/106.91 mg/dL)."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("mlt2024", 1, T, C1, items=[
    it("1. What is the primary disease diagnosed by the doctor from the clinical symptoms supported by the laboratory results?", 5,
       [("Alcoholic hepatitis/ alcoholic liver disease (hepatocellular jaundice) with hypoalbuminaemia; reasoning (alcohol, jaundice, AST:ALT 2:1, viral tests negative)", 5)],
       "Alcoholic hepatitis (alcoholic liver disease) causing hepatocellular jaundice, with features of chronic liver damage (low albumin and oedema). Supporting points: regular alcohol use, jaundice, fever, abdominal pain, AST raised about twice ALT (AST:ALT 2:1 is typical of alcohol), raised ALP and bilirubin, low albumin and total protein, and negative hepatitis B, C and HIV tests. (The mildly raised AFP fits regeneration/ inflammation, but hepatocellular carcinoma should be excluded by imaging and follow-up.)"),
    it("2. List all the clinical symptoms and abnormal tests which supported the doctor's diagnosis of the primary disease for this patient.", 10,
       [("Clinical: alcohol history, jaundice (yellow skin/ eyes), pallor, abdominal pain, nausea, fever 40 °C, tachycardia 120, tachypnoea 25, raised BP, leg/ ankle oedema, abnormal behaviour (possible encephalopathy)", 4),
        ("Abnormal tests: AST 300, ALT 150 (AST:ALT 2:1), ALP 530, total bilirubin 9.5, direct 2.0, LDH 250, low total protein 4.6 and albumin 2.4, Na 130, Cl 92, K 5.0, AFP 60", 6)],
       "Clinical: history of regular alcohol drinking; yellowish skin and eyes (jaundice); pallor; acute abdominal pain and nausea; high fever (40 °C); tachycardia (120/min) and tachypnoea (25/min); raised BP (130/90); swelling of legs and ankles (oedema from low albumin); shabby look and abnormal behaviour (possible hepatic encephalopathy or alcohol effects). Abnormal laboratory results: AST 300 U/L and ALT 150 U/L (hepatocellular injury, AST:ALT ratio 2:1 typical of alcoholic liver disease); ALP 530 U/L (cholestasis); total bilirubin 9.5 mg/dL and direct bilirubin 2.0 mg/dL (jaundice); LDH 250 U/L (tissue damage); total protein 4.6 g/dL and albumin 2.4 g/dL (reduced liver synthesis, malnutrition - causing oedema); sodium 130 and chloride 92 mmol/L (hyponatraemia, hypochloraemia, common in liver disease and fluid retention); potassium 5.0 mmol/L (slightly high); AFP 60 ng/mL (mildly raised)."),
    it("3. List all the tests advised by the doctor which were normal, and explain why you think the doctor prescribed those tests.", 10,
       [("Normal tests: lipase, amylase, calcium, fasting glucose, urea, creatinine, HBsAg/ HCV/ HIV negative", 4),
        ("Reasons: lipase/ amylase - exclude acute pancreatitis (alcohol, abdominal pain); urea/ creatinine - kidney function (hepatorenal syndrome, drug dosing); glucose - diabetes/ hypoglycaemia in liver disease, altered behaviour; calcium - pancreatitis/ nutrition; viral markers - exclude viral hepatitis and HIV as causes/ co-infection", 6)],
       "Normal tests: lipase (53 U/L), amylase (130 U/L), calcium (2.3 mmol/L), fasting blood glucose (122 mg/dL), urea (8 mg/dL), creatinine (0.9 mg/dL), and negative rapid tests for HBsAg, HCV and HIV. Reasons: lipase and amylase - an alcoholic with acute abdominal pain, nausea and fever may have acute pancreatitis, so these exclude it; calcium - falls in severe pancreatitis and reflects nutrition; urea and creatinine - assess kidney function, which can fail in severe liver disease (hepatorenal syndrome) and dehydration, and guide drug dosing; fasting glucose - liver disease can cause hypoglycaemia or diabetes, and low glucose can explain abnormal behaviour; HBsAg, HCV and HIV - viral hepatitis is a common cause of jaundice and liver damage and HIV may co-exist, so they were tested to exclude infectious causes."),
    it("4. Which type of bilirubin is increased in this patient? Explain the general causes of increased bilirubin.", 5,
       [("Both raised: total 9.5, direct (conjugated) 2.0 → indirect (unconjugated) 7.5 mg/dL predominantly; mixed pattern of hepatocellular jaundice", 2),
        ("Causes: pre-hepatic (haemolysis - unconjugated), hepatic (hepatitis, cirrhosis, alcohol, drugs, Gilbert's, neonatal - mixed), post-hepatic (obstruction: gallstones, tumours - conjugated)", 3)],
       "Both fractions are raised: total bilirubin 9.5 mg/dL with direct (conjugated) 2.0 mg/dL, so indirect (unconjugated) bilirubin = 9.5 - 2.0 = 7.5 mg/dL - mainly unconjugated with raised conjugated bilirubin, a mixed picture typical of hepatocellular (hepatic) jaundice, where damaged liver cells cannot take up, conjugate and excrete bilirubin well. General causes of raised bilirubin: (1) pre-hepatic - excess bilirubin production from haemolysis (haemolytic anaemias, transfusion reactions, malaria) - unconjugated; (2) hepatic - liver cell damage or defective conjugation: viral, alcoholic and drug-induced hepatitis, cirrhosis, Gilbert's and Crigler-Najjar syndromes, physiological neonatal jaundice - unconjugated or mixed; (3) post-hepatic (obstructive) - blocked bile flow by gallstones, tumours of the pancreas head or bile ducts, strictures - conjugated, with pale stools and dark urine."),
    it("5. Explain the steps of bilirubin metabolism with a flow diagram, in terms of its formation, storage, transport and excretion.", 20,
       [("Formation: senescent RBCs broken down in reticuloendothelial system (spleen) → haemoglobin → haem + globin; haem oxygenase → biliverdin + Fe + CO; biliverdin reductase → unconjugated bilirubin (~80% from RBCs)", 5),
        ("Transport: unconjugated bilirubin (water-insoluble) bound to albumin in blood to liver; uptake into hepatocytes by carrier, binds ligandin (storage/ intracellular binding)", 5),
        ("Conjugation and excretion: UDP-glucuronyl transferase conjugates with glucuronic acid → bilirubin diglucuronide (water-soluble) → actively secreted into bile → intestine; bacteria → urobilinogen; most → stercobilinogen/ stercobilin (faeces); some reabsorbed (enterohepatic) → urine urobilin", 6),
        ("Clear labelled flow diagram showing sequence", 4)],
       """Formation: about 80% of bilirubin comes from old red blood cells (life span about 120 days), which are destroyed by macrophages of the reticuloendothelial system, mainly in the spleen (also liver and bone marrow); the rest comes from other haem proteins (myoglobin, cytochromes) and ineffective erythropoiesis. Haemoglobin is split into globin (amino acids reused) and haem; haem oxygenase opens the haem ring to form biliverdin, releasing iron (stored as ferritin and reused) and carbon monoxide; biliverdin reductase reduces biliverdin to unconjugated (indirect) bilirubin, about 250-300 mg a day.
Transport: unconjugated bilirubin is insoluble in water, so it is carried in the blood tightly bound to albumin to the liver (drugs such as sulphonamides can displace it).
Uptake and storage in the liver: at the hepatocyte membrane bilirubin is separated from albumin and taken up by carrier-mediated transport; inside the cell it binds to ligandin (glutathione S-transferase) and other proteins, which hold (store) it and prevent it flowing back to the blood.
Conjugation: in the smooth endoplasmic reticulum, the enzyme UDP-glucuronyl transferase conjugates bilirubin with glucuronic acid to form bilirubin diglucuronide (conjugated, direct bilirubin), which is water-soluble.
Excretion: conjugated bilirubin is actively secreted (the rate-limiting step) into the bile canaliculi and passes with bile through the bile ducts (stored and concentrated in the gall bladder) into the intestine. In the large intestine bacterial β-glucuronidases remove glucuronic acid and bacteria reduce bilirubin to colourless urobilinogen. Most urobilinogen is oxidised to stercobilin, which gives faeces their brown colour; about 10-20% is reabsorbed into the portal blood (enterohepatic circulation), mostly re-excreted by the liver, and a small amount is excreted by the kidneys in urine as urobilinogen, oxidised to urobilin (yellow colour of urine).
Flow diagram: old RBCs → (spleen, RE cells) haemoglobin → haem + globin → (haem oxygenase) biliverdin + Fe + CO → (biliverdin reductase) unconjugated bilirubin → bound to albumin in blood → liver uptake, bound to ligandin → (UDP-glucuronyl transferase) conjugated bilirubin diglucuronide → bile → intestine → (bacteria) urobilinogen → stercobilinogen → stercobilin in faeces; part of urobilinogen → reabsorbed → liver (enterohepatic) / kidney → urobilin in urine."""),
])
C2Q = case("mlt2024", 2, T, C2, image="/papers/me/tech3-mlt-2024-ljchart.png", items=[
    it("1. Complete the table (Xi - X̄ and (Xi - X̄)² for each day) and calculate the following parameters, showing correct steps and units: (a) standard deviation (SD); (b) coefficient of variation (CV); (c) mean ± 2SD; (d) mean ± 3SD.", 25,
       [("Mean = ΣXi/n = 1114/12 = 92.83 mg/dL; table of deviations and squared deviations completed (Σ(Xi - X̄)² = 241.67)", 7),
        ("(a) SD = √[Σ(Xi - X̄)²/(n - 1)] = √(241.67/11) = √21.97 = 4.69 mg/dL", 6),
        ("(b) CV = SD/mean x 100 = 4.69/92.83 x 100 = 5.05%", 4),
        ("(c) Mean ± 2SD = 92.83 ± 9.37 = 83.46 to 102.21 mg/dL", 4),
        ("(d) Mean ± 3SD = 92.83 ± 14.06 = 78.77 to 106.89 mg/dL", 4)],
       """Mean X̄ = ΣXi / n = (98 + 101 + 88 + 89 + 95 + 87 + 96 + 91 + 96 + 93 + 94 + 86)/12 = 1114/12 = 92.83 mg/dL.
Table (Xi; Xi - X̄; (Xi - X̄)²): day 1: 98; 5.17; 26.69 | day 2: 101; 8.17; 66.69 | day 3: 88; -4.83; 23.36 | day 4: 89; -3.83; 14.69 | day 5: 95; 2.17; 4.69 | day 6: 87; -5.83; 34.03 | day 7: 96; 3.17; 10.03 | day 8: 91; -1.83; 3.36 | day 9: 96; 3.17; 10.03 | day 10: 93; 0.17; 0.03 | day 11: 94; 1.17; 1.36 | day 12: 86; -6.83; 46.69. Σ(Xi - X̄)² = 241.67.
(a) SD = √[Σ(Xi - X̄)²/(n - 1)] = √(241.67/11) = √21.97 = 4.69 mg/dL.
(b) CV = (SD / mean) x 100 = (4.69/92.83) x 100 = 5.05%.
(c) Mean ± 2SD = 92.83 ± 2(4.69) = 92.83 ± 9.37 → 83.46 to 102.21 mg/dL.
(d) Mean ± 3SD = 92.83 ± 3(4.69) = 92.83 ± 14.06 → 78.77 to 106.89 mg/dL.
These limits match the L-J chart (±2SD 83.46/102.22, ±3SD 78.77/106.91)."""),
    it("2a. Name the control rule violations seen in the L-J chart.", 10,
       [("4(1s): four or more consecutive values above +1SD (days 4-7 onwards); 10x: ten or more consecutive values on the same side of the mean (days 4-14)", 4),
        ("7T: seven or more consecutive points steadily increasing (days 15-23); 2(2s): two consecutive values beyond +2SD (days 21-22)", 4),
        ("1(3s): value beyond +3SD (day 23) and below -3SD (day 27); 1(2s) warnings (e.g. day 13, 21)", 2)],
       "Violations: (1) 1(2s) warning - a single value at/beyond ±2SD (e.g. days 13 and 21), which triggers inspection with the other rules. (2) 4(1s) - four consecutive values above +1SD (days 4-7, continuing to day 14). (3) 10x - ten or more consecutive values on the same side (above) of the mean (days 4-14). (4) 7T - seven or more consecutive results steadily increasing (days 15 to 23). (5) 2(2s) - two consecutive values beyond +2SD (days 21 and 22, with day 23 also high). (6) 1(3s) - a value at/beyond +3SD (day 23) and a value below -3SD (day 27)."),
    it("2b. For each rule violation, state the possible causes and suggest corrective actions.", 15,
       [("Systematic error rules (4(1s), 10x, 7T, 2(2s)): causes - calibration drift/ wrong calibrator, new reagent or control lot, reagent deterioration, instrument drift (lamp ageing, temperature, pipette/ probe), change in technique; actions - stop reporting, recalibrate, check/ replace reagents and controls, maintenance, rerun controls and patient samples", 9),
        ("Random error rule (1(3s)) and 1(2s): causes - pipetting/ sampling error, bubbles, clots, mislabelling, transcription error, electrical fluctuation, improperly mixed/ reconstituted control; actions - rerun control, check sample handling, fresh control, then if confirmed troubleshoot and repeat patient results since last good run; document corrective action", 6)],
       "Systematic error rules - 4(1s), 10x, 7T and 2(2s): possible causes include calibration drift or an incorrect calibrator; a change of reagent or control lot; deterioration of reagents or controls (improper storage, expiry, evaporation); gradual instrument problems such as an ageing photometer lamp, temperature changes in the incubator, a partly blocked or misaligned sample probe or pipette; and changes in technique or operator. Corrective action: stop releasing patient results; check reagent and control lots, expiry and storage; recalibrate the assay; perform instrument maintenance (lamp, probe, temperature); rerun the controls, and when in control, repeat patient samples analysed since the last acceptable run; document everything. A 7T trend especially suggests progressive deterioration (lamp, reagent), while 10x and 4(1s) suggest a shift (new lot, calibration). Random error rule - 1(3s) (and 1(2s) warning): possible causes include pipetting or sampling errors, air bubbles or clots, improperly mixed or reconstituted control, a mislabelled or wrong sample, transcription errors, and electrical or power fluctuations. Corrective action: reject the run; check for obvious errors; prepare fresh control and repeat; if the problem persists troubleshoot the instrument and procedure; repeat affected patient samples; and record the event and corrective action in the QC log."),
])
Q += C2Q
PATTERN = STANDARD
