"""ME Technical Paper III (Subject Specialisation Paper), Medical Laboratory Technology, BCSE 2025 - real paper (PDF sent by the founder).
Standard pattern. Replaced MCQs: 11 (microscope for cells/tissue layers - several defensible) and 17 (platelet-rich
plasma: 6 h and 8 h both used). Case II: the Levey-Jennings chart and Gaussian diagram are shown as pictures; the
accuracy/precision diagrams (labels printed in the paper) are described in words. The PDF's hint has CV = Mean/SD x 100;
the correct formula SD/Mean x 100 is used. EQA question assumes the 2 positives reported were true positives.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1"
GROUP_TAG = "mlt2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "medical-laboratory-technology"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Medical Laboratory Technology"

MCQ = r"""[
{
"n": 1,
"stem": "The gold standard laboratory test for diagnosis of leptospirosis is",
"opts": [
"Microscopic agglutination test",
"Enzyme-linked immunosorbent assays",
"Polymerase chain reaction",
"All the above"
]
},
{
"n": 2,
"stem": "All the following are correct statement regarding electron microscope EXCEPT:",
"opts": [
"Electrons beam is a source of illumination",
"Offers the highest resolution and magnification",
"First invented by Zacharias Janssen",
"employ electromagnetic lenses"
]
},
{
"n": 3,
"stem": "Choose the correct group of pathogens not linked with zoonosis:",
"opts": [
"Mycobacterium tuberculosis & Salmonella",
"Measles virus and Corynebacterium Diphtheria",
"Anthrax & vibrio cholera",
"Brucella & Staphylococcus"
]
},
{
"n": 4,
"stem": "Identify the incorrect statement regarding Viruses:",
"opts": [
"Virus has only either RNA or DNA.",
"They are the smallest living organism",
"They are obligate intracellular parasites",
"They are without metabolic mechanism"
]
},
{
"n": 5,
"stem": "The most vulnerable to the heat and chemical sterilization is:",
"opts": [
"Tubercle bacilli",
"Viruses",
"Spores",
"Prions"
]
},
{
"n": 6,
"stem": "Most accurate method of diagnosis of dengue during the first week of infection is:",
"opts": [
"RT-PCR",
"IgG only",
"IgM only",
"IgG & IgM"
]
},
{
"n": 7,
"stem": "The body's response to measles is example of:",
"opts": [
"Artificial active immunity",
"Artificial passive immunity",
"Natural passive immunity",
"Adaptive immunity"
]
},
{
"n": 8,
"stem": "Normal fasting blood sugar level in human adult is:",
"opts": [
"100-125 mg/dl",
"80-100 mg/dl",
"100-150 mg/dl",
"150-200 mg/dl"
]
},
{
"n": 9,
"stem": "The Primary Component of Gram Stain:",
"opts": [
"Eosin",
"Iodine",
"Alcohol",
"crystal violet"
]
},
{
"n": 10,
"stem": "Which of the following is not a Romanowsky stain:",
"opts": [
"Leishman’s stain",
"Giemsas stain",
"Jenner’s stain",
"Gram Stain"
]
},
{
"n": 11,
"stem": "Which of the following types of microscopy is valuable in the identification of cells and tissue layers?",
"opts": [
"Compound bright field",
"Dark field",
"Polarizing",
"Phase-contrast"
]
},
{
"n": 12,
"stem": "Choose the incorrect functions of fixatives for tissues and cells:",
"opts": [
"Arrests cell autolysis",
"Protect cells and tissues from osmotic damage",
"Hardening of the tissue",
"Enhance tissue impermeability"
]
},
{
"n": 13,
"stem": "What is the optimum concentration of the formalin used as fixatives:",
"opts": [
"5%",
"10%",
"15%",
"20%"
]
},
{
"n": 14,
"stem": "Which of the following is the best site for venipuncture:",
"opts": [
"basilica vein",
"cephalic vein",
"medial cubital vein",
"femoral vein"
]
},
{
"n": 15,
"stem": "A blood specimen collected in plain tube is centrifuged. It will separate into:",
"opts": [
"Serum and clot",
"Plasma and clot",
"Serum and plasma",
"Plasma, buffy coat, RBC"
]
},
{
"n": 16,
"stem": "All the following causes hemolysis during blood collection EXCEPT:",
"opts": [
"Using a 25-gauge needle on an adult",
"Vigorously shaking the blood specimen",
"Wrong concentration of anticoagulant",
"Using preservatives"
]
},
{
"n": 17,
"stem": "Platelet rich plasma is prepared in how much hour after collection?",
"opts": [
"24 hrs",
"8 hrs",
"6 hrs",
"Any time but should be refrigerate"
]
},
{
"n": 18,
"stem": "To make a 1:5 dilution of serum sample, dilute:",
"opts": [
"1.0 mL of serum + 5.0 mL of diluent",
"1.0 mL of serum + 4.0 mL of diluent",
"1.0 mL of serum + 6.0 mL of diluent",
"5.0 mL of serum + 1.0 mL of diluent"
]
},
{
"n": 19,
"stem": "What is the normality of a solution of sodium hydroxide (molecular weight=40) containing 20 grams in 100 mL of solution?",
"opts": [
"5.0N",
"1.0N",
"0.5N",
"0.4N"
]
},
{
"n": 20,
"stem": "Spreading of disease Worldwide is called as?",
"opts": [
"Epidemic",
"Endemic",
"Pandemic",
"Infection"
]
},
{
"n": 21,
"stem": "Sodium is responsible for the maintenance of:",
"opts": [
"Blood coagulation",
"Osmotic pressure of body fluids",
"Cardiac muscle contractions",
"Salt intake"
]
},
{
"n": 22,
"stem": "Method of sterilization used for glass wares and test tubes is:",
"opts": [
"Autoclave",
"Hot air oven",
"Pasteurization",
"None of the above"
]
},
{
"n": 23,
"stem": "Which type of urine sample is preferred for bacterial examination?",
"opts": [
"First-morning urine sample",
"Midstream clean-catch urine sample",
"Random urine sample",
"Last-night urine sample"
]
},
{
"n": 24,
"stem": "All the following causes systemic errors in the laboratory quality control system EXCEPT:",
"opts": [
"Calibration errors",
"Change in the reagent lot",
"Inappropriate pipetting",
"Expiring of reagents"
]
},
{
"n": 25,
"stem": "Choose the incorrect characteristic of lyophilized serum used as quality control material:",
"opts": [
"It is in solidified and powder form.",
"It needs to be reconstituted.",
"It is stable for longer period at 2-8oC",
"Easy to prepare like frozen serum"
]
},
{
"n": 26,
"stem": "All the following causes random errors in laboratory analysis EXCEPT:",
"opts": [
"Electrical fluctuation",
"Change in laboratory personal",
"Pipetting errors",
"Clog formation in the tubing of the analyzers."
]
},
{
"n": 27,
"stem": "Kinetic method of measurement involves:",
"opts": [
"Recording of absorbance at the certain interval of time during the chemical reactions.",
"Recording of absorbance at the fixed time when the reaction is about to be completed.",
"Recording of absorbance at the fixed time when the reaction is completed.",
"Recording of absorbance at the beginning of the reaction."
]
},
{
"n": 28,
"stem": "Which type of blood cell is reduced by Dengue virus?",
"opts": [
"Neutrophils",
"Platelets",
"Monocytes",
"Eosinophils"
]
},
{
"n": 29,
"stem": "Which of the following enzymes is responsible for the breakdown of starch into glucose?",
"opts": [
"Lipase",
"Amylase",
"Protease",
"Lactase"
]
},
{
"n": 30,
"stem": "Which of the following parameters can be used to calculate standard deviation in the Laboratory IQC?",
"opts": [
"Variance and mean",
"Median and variance",
"Standard deviation and the mean",
"Square root of Variance"
]
}
]"""

KEY = {
    1: ("a", "The microscopic agglutination test (MAT) is the gold standard for leptospirosis."), 2: ("c", "Zacharias Janssen is credited with the compound light microscope; the electron microscope was built by Knoll and Ruska."),
    3: ("b", "Measles virus and Corynebacterium diphtheriae infect only humans (not zoonotic)."), 4: ("b", "Viruses are not considered living organisms in the usual sense; the other statements are true."),
    5: ("b", "Viruses (especially enveloped ones) are the most easily killed; spores and prions are the most resistant."), 6: ("a", "In the first week (viraemia) RT-PCR (or NS1 antigen) is most accurate."),
    7: ("d", "Recovery from measles produces adaptive (natural active) immunity."), 8: ("b", "Normal fasting glucose is about 70-100 mg/dL; 80-100 is the best option."),
    9: ("d", "Crystal violet is the primary stain in Gram staining."), 10: ("d", "Gram stain is not a Romanowsky stain."),
    12: ("d", "Fixatives do not make tissue impermeable; they arrest autolysis, harden and preserve tissue."), 13: ("b", "10% (neutral buffered) formalin is the standard fixative."),
    14: ("c", "The median cubital vein is the preferred venipuncture site."), 15: ("a", "Clotted blood in a plain tube separates into serum and clot."),
    16: ("d", "Preservatives do not cause haemolysis; small needles, shaking and wrong anticoagulant ratio do."), 18: ("b", "1 part serum + 4 parts diluent = 1:5 (1 in 5 total)."),
    19: ("a", "20 g / 40 = 0.5 eq in 0.1 L = 5.0 N."), 20: ("c", "Worldwide spread is a pandemic."),
    21: ("b", "Sodium maintains osmotic pressure of extracellular fluid."), 22: ("b", "Dry glassware is sterilised in a hot air oven."),
    23: ("b", "A midstream clean-catch sample is used for bacterial culture."), 24: ("c", "Inappropriate pipetting gives random error; the others cause systematic error."),
    25: ("d", "Lyophilised material is not as easy to prepare as frozen serum (incorrect statement)."), 26: ("b", "A change of personnel tends to cause systematic shifts; the others cause random errors."),
    27: ("a", "Kinetic methods record absorbance at intervals during the reaction."), 28: ("b", "Dengue causes thrombocytopenia."),
    29: ("b", "Amylase breaks starch down to sugars."), 30: ("d", "SD = square root of the variance."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "Which type of microscopy is best for examining unstained living cells such as motile organisms in a wet mount?", ["Bright-field", "Phase-contrast", "Polarising", "Electron"], "b",
            "Phase-contrast microscopy increases contrast of transparent, unstained living cells."),
    new_mcq(2, T, "Blood components such as platelets should be prepared from whole blood and stored at", ["2-6 °C", "20-24 °C with continuous agitation", "-30 °C", "37 °C"], "b",
            "Platelets are stored at 20-24 °C with gentle agitation; refrigeration damages them."),
    saq(1, T, "Explain the types of specimens, the time of specimen collection and the laboratory tests performed for the diagnosis of leptospirosis.",
        [("Specimens and timing: first week (leptospiraemic phase) - blood (EDTA/heparin), CSF; after first week - urine; serum (acute and convalescent)", 2.5), ("Tests: MAT (gold standard), IgM ELISA/ rapid tests, PCR/ RT-PCR, dark-field microscopy, culture (EMJH medium)", 2.5)],
        """Specimens and timing: during the first week of illness (leptospiraemic/acute phase, days 1-7) - whole blood (EDTA or heparin) for PCR and culture, and CSF if meningitis is suspected; from the second week (immune/leptospiruric phase) - urine for PCR/culture, and serum for antibody tests; paired sera (acute and convalescent, 10-14 days apart) to show a rise in titre. Post-mortem tissues (kidney, liver) in fatal cases.
Tests: microscopic agglutination test (MAT) - gold standard; fourfold rise in titre or a single high titre (e.g. ≥1:400) confirms. IgM ELISA and rapid diagnostic tests - screening from about day 5. PCR/real-time PCR on blood (first week) or urine - early confirmation. Culture in EMJH or Fletcher's medium (slow, weeks). Dark-field microscopy of blood or urine (low sensitivity). Supportive tests: CBC, renal and liver function, urinalysis."""),
    saq(2, T, "Define and describe the principle of the Ziehl-Neelsen (ZN) staining technique, and give the interpretation and grading of AFB seen on the smear using the WHO grading scale.",
        [("Definition and principle: differential acid-fast stain; mycolic acid retains hot carbol fuchsin and resists decolourisation by acid-alcohol; counterstain methylene blue", 2), ("Steps and interpretation: AFB red rods on blue background", 1), ("WHO/IUATLD grading: negative, scanty (1-9/100 fields), 1+, 2+, 3+", 2)],
        """ZN staining is a differential stain used to detect acid-fast bacilli (AFB) such as Mycobacterium tuberculosis. Principle: the cell wall of mycobacteria is rich in mycolic acid (lipid); hot carbol fuchsin penetrates it and, once stained, the bacilli resist decolourisation with acid-alcohol (or 25% sulphuric acid), so they stay red; non-acid-fast cells and background lose the stain and take the methylene blue counterstain.
Steps: fixed smear flooded with carbol fuchsin and heated till steaming for 5 min, washed; decolourised with acid-alcohol/25% H2SO4; washed; counterstained with methylene blue 1 min; washed, dried, examined under oil immersion (100x).
Interpretation: AFB appear as red/pink slender, slightly curved rods on a blue background.
WHO/IUATLD grading (per field counts under oil immersion): no AFB in 100 fields - negative; 1-9 AFB in 100 fields - scanty (report exact number); 10-99 AFB in 100 fields - 1+; 1-10 AFB per field (examine 50 fields) - 2+; more than 10 AFB per field (examine 20 fields) - 3+."""),
    saq(3, T, "Explain the principle of the Leishman staining technique and describe the staining steps. Give the colour seen in each of the following: red cells; nuclei of leucocytes; cytoplasm of neutrophils; eosinophil granules; basophil granules; monocyte cytoplasm; small lymphocytes; large lymphocytes.",
        [("Principle: Romanowsky stain - eosin (acidic) stains basic components pink, methylene blue/azure (basic) stains acidic components (nuclei) blue-purple; methanol fixes; buffer pH 6.8", 1.5), ("Steps: thin smear, cover with stain 2 min (fixation), add double buffered water 7-10 min, wash, dry, examine", 1.5), ("Colours: RBC pink/ salmon; nuclei purple; neutrophil cytoplasm pale pink with fine lilac granules; eosinophil granules orange-red; basophil granules dark blue-purple; monocyte cytoplasm grey-blue; small lymphocyte dark purple nucleus, scanty sky-blue cytoplasm; large lymphocyte more pale blue cytoplasm", 2)],
        """Principle: Leishman stain is a Romanowsky stain - a mixture of eosin (acidic dye) and methylene blue/azure (basic dyes) dissolved in methanol. Methanol fixes the smear. Acidic cell components (nuclear DNA, RNA in cytoplasm, basophil granules) bind the basic dyes and stain blue-purple; basic components (haemoglobin, eosinophil granules) bind eosin and stain pink-orange. Staining depends on buffered water at pH 6.8.
Steps: make a thin smear and air-dry; cover with Leishman stain for 1-2 minutes (fixation); add about double the volume of buffered distilled water (pH 6.8), mix gently and leave 7-10 minutes; wash with buffered water until pinkish; air-dry and examine under oil immersion.
Colours: red cells - pink/salmon; nuclei of leucocytes - purple/violet; neutrophil cytoplasm - pale pink with fine violet-pink granules; eosinophil granules - bright orange-red; basophil granules - dark blue-black/purple; monocyte cytoplasm - pale greyish-blue ('ground glass'); small lymphocytes - dark purple nucleus with a thin rim of sky-blue cytoplasm; large lymphocytes - purple nucleus with more abundant pale/clear blue cytoplasm, sometimes a few azurophilic granules."""),
    saq(4, T, "Explain the human blood group systems.",
        [("ABO system: antigens A and B on RBC, natural antibodies in plasma, four groups, Landsteiner, transfusion importance", 2), ("Rh system: D antigen, Rh positive/negative, immune antibodies, HDN", 2), ("Other systems (ISBT recognises 40+): Kell, Duffy, Kidd, MNS, Lewis, Lutheran, P; clinical relevance", 1)],
        """Blood group systems are sets of inherited antigens on the red cell surface; the ISBT recognises more than 40 systems. The most important:
ABO system (Landsteiner, 1901): based on A and B antigens. Group A - A antigen, anti-B in plasma; Group B - B antigen, anti-A; Group AB - both antigens, no antibodies (universal recipient); Group O - no antigens, both anti-A and anti-B (universal red cell donor). The antibodies occur naturally (IgM), so ABO-incompatible transfusion causes acute haemolytic reactions.
Rh system: mainly the D antigen - Rh positive (D present) or Rh negative (D absent); also C, c, E, e. Anti-D is not naturally present but forms after exposure (transfusion or pregnancy), and can cause haemolytic disease of the foetus and newborn; prevented by anti-D immunoglobulin.
Other clinically significant systems: Kell (K - strong immunogen, HDFN), Duffy (Fya/Fyb; Fy(a-b-) resists P. vivax), Kidd (Jka/Jkb - delayed haemolytic reactions), MNS, Lewis, Lutheran and P. They matter in antibody screening and cross-matching."""),
]
C1 = """Case I: Poor specimen collection from the Emergency Department
In one of the laboratories in Bhutan, laboratory staff repeatedly receive samples from the Emergency Department (ED) of the hospital that are inappropriately labelled, with tubes and sample trays stained with blood, haemolysed blood, blood drawn in the wrong tube for the test requested, or with an insufficient quantity of blood. When laboratory staff call the nurse who drew the blood to ask for a resample, they occasionally experience hostility. In one instance, a ward boy delivered a tray of blood samples with three tubes and a requisition form, but the tubes were not labelled. When the laboratory technicians called the ED, the in-charge told them to trust that the blood tubes belonged to the patient on the requisition. The laboratory in-charge explained that the laboratory could not accept the specimen due to sampling issues. The nurse hung up the phone."""
C2 = """Case II: Internal quality control in clinical chemistry
A robust internal quality control (IQC) system has been established in clinical chemistry and haematology in all laboratories in Bhutan since 2011 to monitor the precision and accuracy of laboratory results. In the Biochemistry section at JDWNRH, Mr Jigme Tenzin establishes his IQC for ALT using control results for 11 consecutive days. The control results of 11 days are trimmed at ±2SD or by using the CLIA CV. Daily IQC results are plotted on a Levey-Jennings (LJ) chart and Westgard multi-rules are used to detect errors."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("mlt2025", 1, T, C1, items=[
    it("""1. The laboratory technician reported five important problems with blood samples collected by Emergency Department staff. List the five problems and, against each, give 2-3 key words for the major risks of these unprofessional practices to (i) patients and (ii) hospital staff (nurses and laboratory staff). Choose from these risks: wrong results; wrong diagnosis; infection transmission; wrong treatment; medico-legal cases; administrative actions; patient allegation.""", 20,
       [("Five problems identified: unlabelled/ wrongly labelled tubes; blood-stained tubes and trays; haemolysed samples; wrong tube for test; insufficient sample volume (also hostility/ poor communication)", 5), ("Risks to patients matched correctly for each (wrong results, wrong diagnosis, wrong treatment, infection transmission, delay/ resampling)", 8), ("Risks to staff matched correctly (infection transmission, medico-legal cases, administrative actions, patient allegation)", 7)],
       """1. Unlabelled or inappropriately labelled tubes - Patients: wrong results, wrong diagnosis, wrong treatment (sample mix-up). Staff: medico-legal cases, administrative actions, patient allegation.
2. Tubes and sample tray stained with blood - Patients: infection transmission. Staff: infection transmission (blood-borne HBV, HCV, HIV), administrative actions.
3. Haemolysed blood - Patients: wrong results (e.g. falsely high potassium, LDH), wrong diagnosis, wrong treatment. Staff: patient allegation, administrative actions.
4. Blood drawn in the wrong tube for the test - Patients: wrong results, wrong diagnosis, wrong treatment (or delay and repeat pricks). Staff: administrative actions, patient allegation.
5. Insufficient quantity of specimen - Patients: wrong results (wrong blood-to-anticoagulant ratio, e.g. coagulation tests), wrong diagnosis, wrong treatment/delay. Staff: patient allegation, administrative actions.
(The hostile communication and refusal to resample also increase risks of wrong treatment and medico-legal cases.)"""),
    it("""2. The laboratory HOD raised these issues with hospital management. The hospital director asked the HOD to plan a one-day training for nurses on good laboratory practice covering: blood collection procedures; identification of vials and tubes and blood collection sites; blood storage and transport; and communication skills.
From these topics, write the blood collection procedure in detail.""", 20,
       [("Preparation: check request form, gather equipment, hand hygiene, PPE, explain/ consent, identify patient with two identifiers", 5), ("Site selection and tourniquet (7-10 cm above, <1 min), clean with 70% alcohol and let dry", 4), ("Venipuncture technique: anchor vein, needle bevel up 15-30°, order of draw, fill to correct volume, gently invert tubes", 5), ("After: release tourniquet before withdrawing needle, pressure, sharps disposal, label tubes at bedside with ID/ date/ time/ initials, complete form, transport promptly; avoid haemolysis/ contamination", 6)],
       "1. Preparation: check the request form; gather equipment (correct tubes, needle/vacutainer, tourniquet, 70% alcohol swabs, gauze, plaster, sharps container, gloves); perform hand hygiene and wear gloves. 2. Patient identification: ask the patient to state full name and date of birth/CID and match with the form (two identifiers); explain the procedure and get consent; check fasting or special requirements. 3. Position the patient comfortably with arm extended. 4. Apply the tourniquet 7-10 cm above the site for no more than 1 minute; select a vein - median cubital preferred, then cephalic or basilic; avoid arms with IV infusions, haematoma, fistula or mastectomy side. 5. Clean the site with 70% alcohol in a circular motion and let it air-dry (prevents haemolysis and stinging); do not touch after cleaning. 6. Anchor the vein, insert the needle bevel up at 15-30°; collect tubes in the correct order of draw (blood culture → citrate → plain/serum → heparin → EDTA → fluoride), filling each to the marked volume. 7. Gently invert additive tubes 5-10 times (do not shake). 8. Release the tourniquet before withdrawing the needle; apply pressure with gauze; activate the safety device and discard the needle immediately into a sharps container (no recapping). 9. Label every tube at the bedside, in the patient's presence, with name, ID number, date, time and collector's initials; complete the requisition. 10. Check the patient, apply a plaster; clean any spills; send samples promptly in a closed, leak-proof container at the correct temperature with the form."),
    it("3. Name at least five types of coloured vials used for blood collection, describe their purposes, and name the anticoagulants or chemicals in each with their functions.", 10,
       [("Five tubes correctly with colour, additive, function and use (2 marks each): red/plain, yellow/gold SST gel, light blue citrate, green heparin, lavender/purple EDTA, grey fluoride-oxalate, blood culture bottles", 10)],
       "Red top (plain/clot activator) - no anticoagulant (or silica clot activator): blood clots to give serum for serology, biochemistry, blood bank. Yellow/gold top (SST) - clot activator with separator gel: gel forms a barrier between serum and cells; biochemistry and serology. Light blue top - 3.2% sodium citrate (1:9 ratio): binds calcium (reversible); coagulation tests (PT/INR, APTT). Green top - lithium or sodium heparin: activates antithrombin to inhibit thrombin; plasma chemistry, electrolytes, ammonia. Lavender/purple top - K2/K3 EDTA: chelates calcium, preserves cell morphology; CBC, blood film, HbA1c, blood grouping. Grey top - sodium fluoride with potassium oxalate: fluoride inhibits glycolysis (enolase), oxalate precipitates calcium; glucose and lactate. (Black top - sodium citrate 1:4 for ESR.)"),
])
Q += case("mlt2025", 2, T, C2, items=[
    it("""1. Using the following data, calculate (i) the mean, (ii) the standard deviation (SD), (iii) the coefficient of variation (CV), (iv) mean ± 2SD and (v) mean ± 3SD.
ALT control results (IU/L), days 1-11: 26, 27, 28, 28, 29, 28, 28, 26, 26, 27, 28.
Hint: variance V = Σ(x - mean)² / (n - 1); SD = √V; CV = SD / mean x 100.""", 20,
       [("(i) Mean = 301/11 = 27.36 IU/L", 4), ("(ii) Σ(x - x̄)² = 10.55; V = 1.055; SD = 1.03", 6), ("(iii) CV = 1.03/27.36 x 100 = 3.75%", 4), ("(iv) Mean ± 2SD = 25.31 - 29.42", 3), ("(v) Mean ± 3SD = 24.28 - 30.44", 3)],
       """(i) Mean = Σx / n = 301 / 11 = 27.36 IU/L.
(ii) Deviations squared: 26 → 1.86 (x3 = 5.58); 27 → 0.13 (x2 = 0.26); 28 → 0.40 (x5 = 2.02); 29 → 2.68. Σ(x - mean)² = 10.55. Variance = 10.55 / 10 = 1.055. SD = √1.055 = 1.03 IU/L.
(iii) CV = SD / mean x 100 = 1.03 / 27.36 x 100 = 3.75%.
(iv) Mean ± 2SD = 27.36 ± 2.05 → 25.31 to 29.42 IU/L.
(v) Mean ± 3SD = 27.36 ± 3.08 → 24.28 to 30.44 IU/L.
(No value lies outside ±2SD, so all 11 results are kept when trimming.)"""),
    it("2. In the control chart shown (Levey-Jennings chart, AST level I, days 1-27), identify the control rule violations. For each violation state the possible causes and suggest corrective actions.", 10,
       [("Day 8: 1-3s (single value > +3SD) - random error: pipetting, bubbles, sample/control handling, electrical fluctuation; action reject run, repeat with fresh control, troubleshoot", 3), ("Days 11-17: values consecutively below -1SD/ mean - 4-1s (and run below mean) - systematic shift: reagent/ calibration/ lot change, deteriorating control; recalibrate, new reagent/control", 3), ("Days 18-27: steady downward trend; 2-2s at days 25-26 and 1-3s at day 27; 4-1s days 23-27 - systematic drift: reagent deterioration, lamp ageing, temperature, evaporation; stop reporting, maintenance, recalibrate, new reagents, repeat patient samples", 4)],
       "Day 8 - one result above +3SD: 1-3s violation (random error, possibly gross). Causes: pipetting error, air bubble or clot in the analyser, wrong control or reconstitution error, electrical fluctuation. Action: reject the run, repeat with a fresh control; if within limits, continue; check pipettes and the sample probe. Days 11-17 - seven consecutive results below -1SD (and below the mean): 4-1s violation (and a shift if continued to 10x) - systematic error. Causes: new reagent or calibrator lot, calibration drift, deteriorating control material, change in technique/personnel, temperature changes. Action: stop reporting, recalibrate, check reagent and control lots and storage, perform maintenance, re-run control and affected patient samples. Days 18-27 - a steady downward trend over ten days, with days 25-26 below -2SD (2-2s), day 27 below -3SD (1-3s) and days 23-27 beyond -1SD (4-1s): systematic error (drift). Causes: gradual reagent deterioration or evaporation, ageing photometer lamp, dirty cuvettes, drift in incubator temperature, deteriorating control. Action: reject runs, recalibrate, replace reagents/controls, perform maintenance (lamp, cuvettes), verify with fresh control, and re-test patient samples since the trend began; document all actions."),
    it("3. Use the diagram (normal Gaussian distribution and control chart) to state the THREE most important properties of the normal Gaussian distribution applied in the internal quality control system.", 5,
       [("Symmetrical bell-shaped curve around the mean (mean = median = mode)", 1.5), ("68.2% within ±1SD, 95.5% within ±2SD, 99.7% within ±3SD", 2), ("Results outside ±2SD (4.5%)/±3SD (0.3%) are unlikely by chance - basis of warning/ rejection limits", 1.5)],
       "1. The distribution is symmetrical and bell-shaped about the mean (mean = median = mode), so control results scatter equally above and below the mean. 2. A fixed proportion of results falls within each SD band: about 68.2% within ±1SD, 95.5% within ±2SD and 99.7% within ±3SD. 3. Therefore results outside ±2SD (about 1 in 20) or ±3SD (about 3 in 1000) are unlikely to happen by chance, so they are used as warning and rejection limits on the Levey-Jennings chart; patterns such as many points on one side of the mean indicate systematic error."),
    it("""4. Four frequency distributions of repeated control results are described below, each relative to the true (target) value. For each, choose the most appropriate pair of terms: accurate and precise; inaccurate and precise; inaccurate and imprecise; accurate and imprecise.
Diagram 1: a wide, flat curve centred away from the target value.
Diagram 2: a narrow, tall curve centred away from the target value.
Diagram 3: a wide, flat curve centred on the target value.
Diagram 4: a narrow, tall curve centred on the target value.""", 5,
       [("1 inaccurate, imprecise; 2 inaccurate, precise; 3 accurate, imprecise; 4 accurate, precise; with reasoning (accuracy = closeness to true value, precision = spread)", 5)],
       "Diagram 1 - inaccurate and imprecise (mean away from the target, wide spread). Diagram 2 - inaccurate but precise (results agree closely but are biased). Diagram 3 - accurate but imprecise (mean on target, wide spread). Diagram 4 - accurate and precise (centred on target, narrow spread). Accuracy is closeness of the mean to the true value; precision is the closeness of repeated results to each other."),
    it("""5. The Royal Centre for Disease Control (RCDC) evaluates district laboratories every year using sputum panel slides. RCDC sent 50 unstained slides to Trashigang hospital: 45 AFB negative and 5 positive. The Trashigang laboratory technician reported 48 negative and 2 positive. Complete a 2 x 2 table (Trashigang result against RCDC result) and calculate: (i) sensitivity, (ii) specificity, (iii) false positive rate, (iv) false negative rate.""", 10,
       [("Table: TP 2, FP 0, FN 3, TN 45; totals 5/45/50 (assuming the 2 reported positives were true positives)", 4), ("Sensitivity 2/5 = 40%; specificity 45/45 = 100%", 3), ("FPR 0/45 = 0%; FNR 3/5 = 60%; comment on poor performance and retraining", 3)],
       """Assuming the two slides reported positive were truly positive:
Trashigang positive: RCDC positive 2 (TP), RCDC negative 0 (FP) - total 2.
Trashigang negative: RCDC positive 3 (FN), RCDC negative 45 (TN) - total 48.
Totals: RCDC positive 5, RCDC negative 45, overall 50.
(i) Sensitivity = TP / (TP + FN) = 2/5 = 40%.
(ii) Specificity = TN / (TN + FP) = 45/45 = 100%.
(iii) False positive rate = FP / (FP + TN) = 0/45 = 0%.
(iv) False negative rate = FN / (FN + TP) = 3/5 = 60%.
Three missed positives (major errors) show unacceptable performance; the laboratory needs retraining in smear staining and reading, checking of reagents and microscope, and follow-up EQA."""),
])
for q in Q:
    if q["key"] == "C2Q2": q["image"] = "/papers/me/tech3-mlt-2025-lj-chart.png"
    if q["key"] == "C2Q3": q["image"] = "/papers/me/tech3-mlt-2025-gaussian.png"
PATTERN = STANDARD
