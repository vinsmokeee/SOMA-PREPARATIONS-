"""ME Technical Paper III (Subject Specialisation Paper), Chemistry, BCSE 2024 - real paper (PDF sent by the founder).
Standard pattern (paper title: Chemist). All 30 MCQs kept.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Chemistry): BCSE 2024, batch 1"
GROUP_TAG = "chem2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "chemistry"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Chemistry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Chemistry"

MCQ = r"""[
{
"n": 1,
"stem": "The first credit of proposing “Atomic Theory” goes to:",
"opts": [
"Van Helmont",
"John Dalton",
"Proust",
"Boyle"
]
},
{
"n": 2,
"stem": "Chadwick discovered______________",
"opts": [
"Proton",
"Electron",
"Neutron",
"Positron"
]
},
{
"n": 3,
"stem": "Alkali metals belong to group_____________in the periodic table.",
"opts": [
"Group 0",
"Group 1",
"Group 2",
"Group 3"
]
},
{
"n": 4,
"stem": "The sum of the number of neutrons and protons in the isotope of hydrogen is:",
"opts": [
"6",
"5",
"4",
"3"
]
},
{
"n": 5,
"stem": "Which one of the following is a metalloid?",
"opts": [
"Carbon",
"Germanium",
"Bismuth",
"Lead"
]
},
{
"n": 6,
"stem": "The common property of transition metals is:",
"opts": [
"High melting point",
"Low density",
"High reactivity with water",
"Non-conductive in solid form"
]
},
{
"n": 7,
"stem": "The term for a substance that can act as both an acid and a base:",
"opts": [
"Amphoteric",
"Zwitterion",
"Electrolyte",
"Neutral compound"
]
},
{
"n": 8,
"stem": "Identify the error that results from improper eye alignment with the meniscus during a burette reading.",
"opts": [
"Parallax error",
"Systematic error",
"Random error",
"Calibration error"
]
},
{
"n": 9,
"stem": "In the Brønsted-Lowry theory, what is an acid?",
"opts": [
"A substance that donates a proton",
"A substance that accepts a proton",
"A substance that produces hydroxide ions",
"A substance that produces hydrogen gas"
]
},
{
"n": 10,
"stem": "Which acid mixtures are used in a 1:3 ratio to prepare aqua regia?",
"opts": [
"Hydrochloric acid and nitric acid",
"Nitric acid and hydrochloric acid",
"Acetic acid and nitric acid",
"Hydrochloric acid and citric acid"
]
},
{
"n": 11,
"stem": "A mineral acid known for its dehydrating properties:",
"opts": [
"Phosphoric acid",
"Hydrochloric acid",
"Nitric acid",
"Sulphuric acid"
]
},
{
"n": 12,
"stem": "In a redox reaction, what happens to the substance that is oxidized?",
"opts": [
"It gains electrons",
"It loses electrons",
"It gains protons",
"It loses protons"
]
},
{
"n": 13,
"stem": "A pH level will be lower if,",
"opts": [
"Concentration of the hydrogen ions is lower",
"Concentration of the hydrogen ions is greater",
"Concentration of the nitrogen ions is lower",
"None of the above"
]
},
{
"n": 14,
"stem": "Which region of the electromagnetic spectrum uses a deuterium arc lamp as a source?",
"opts": [
"Infrared",
"Visible",
"Ultraviolet",
"Microwave"
]
},
{
"n": 15,
"stem": "Most of the light re-emitted at the same wavelength as the incident light is called as:",
"opts": [
"Rayleigh scattering",
"Raman Scattering",
"Anti-Stokes scattering",
"Stokes scattering"
]
},
{
"n": 16,
"stem": "A graph showing detector response as a function of analyte concentration is:",
"opts": [
"Absorbance chart",
"Calibration curve",
"Quality control chart",
"None of the above"
]
},
{
"n": 17,
"stem": "According to Beer’s Law, what happens to the absorbance reading, if the concentration of the solution is halved??",
"opts": [
"The absorbance will double.",
"The absorbance will quadruple.",
"The absorbance will be halved",
"The absorbance will be quartered."
]
},
{
"n": 18,
"stem": "A student measures the mass of an object four times and records the values as 5.32 g, 5.33 g, 5.31 g, and 5.32 g. The true mass of the object is 5.50 g. Which of the following statements is correct?",
"opts": [
"The measurements are both accurate and precise",
"The measurements are accurate but not precise",
"The measurements are precise but not accurate",
"The measurements are neither accurate nor precise"
]
},
{
"n": 19,
"stem": "The most reactive of C is:",
"opts": [
"Diamond",
"Graphite",
"Coal",
"Charcoal"
]
},
{
"n": 20,
"stem": "All are Rare Earth Elements EXCEPT:",
"opts": [
"Yttrium",
"Neodymium",
"Cerium",
"Gold"
]
},
{
"n": 21,
"stem": "Which one of the following elements has the highest melting point?",
"opts": [
"Boron",
"Aluminium",
"Gallium",
"Thallium"
]
},
{
"n": 22,
"stem": "Bronze is an alloy of:",
"opts": [
"Copper and Zinc",
"Copper and Tin",
"Copper and Nickel",
"Copper and Aluminum"
]
},
{
"n": 23,
"stem": "The process of purifying metals by electrolysis is called:",
"opts": [
"Smelting",
"Electrorefining",
"Calcination",
"Roasting"
]
},
{
"n": 24,
"stem": "The chemical formula of ‘Plaster of Paris’ is:",
"opts": [
"CaSO4. 2H2O",
"CaSO4. ½ H2O",
"2CaSO4. H2O",
"CaSO4"
]
},
{
"n": 25,
"stem": "The primary purpose of high-performance liquid chromatography (HPLC) is:",
"opts": [
"To measure the pH of a solution",
"To separate, identify, and quantify compounds in a mixture",
"To determine the melting point of a compound",
"To analyze the thermal stability of a sample"
]
},
{
"n": 26,
"stem": "Solvent extraction is a type of________________ analytical technique.",
"opts": [
"Qualitative",
"Quantitative",
"Separating",
"Identification"
]
},
{
"n": 27,
"stem": "The purpose of adding limestone in the blast furnace during iron extraction is:",
"opts": [
"To reduce iron oxide to iron",
"To increase the carbon content",
"To act as fuel",
"To remove impurities in the form of slag"
]
},
{
"n": 28,
"stem": "The concentration of a solution in ppm (mg/L) made by dissolving 0.0074 gm of NaCl in 500 mL of solution.",
"opts": [
"13.2",
"14.4",
"14.8",
"13.7"
]
},
{
"n": 29,
"stem": "What is the percentage composition of oxygen in iron (III) sulphate? [Fe=56; S= 32; O=16]",
"opts": [
"24%",
"28%",
"50%",
"48%"
]
},
{
"n": 30,
"stem": "What is the molarity of 37.0 % HCl that has a density of 1.19 g/mL?",
"opts": [
"11.1",
"12.1",
"13.1",
"14.1"
]
}
]"""

KEY = {
    1: ("b", "John Dalton proposed the atomic theory (1808)."), 2: ("c", "Chadwick discovered the neutron (1932)."),
    3: ("b", "Alkali metals are in Group 1."), 4: ("d", "Tritium has 1 proton + 2 neutrons = 3 (the heaviest hydrogen isotope)."),
    5: ("b", "Germanium is a metalloid."), 6: ("a", "Transition metals typically have high melting points."),
    7: ("a", "Amphoteric substances act as both acids and bases."), 8: ("a", "Reading the meniscus at an angle causes parallax error."),
    9: ("a", "A Brønsted-Lowry acid donates a proton."), 10: ("b", "Aqua regia: 1 part nitric acid to 3 parts hydrochloric acid."),
    11: ("d", "Concentrated sulphuric acid is a strong dehydrating agent."), 12: ("b", "Oxidation is loss of electrons."),
    13: ("b", "Higher [H+] gives lower pH."), 14: ("c", "Deuterium lamps are UV sources."),
    15: ("a", "Elastic scattering at the same wavelength is Rayleigh scattering."), 16: ("b", "Response versus concentration is a calibration curve."),
    17: ("c", "A = εbc, so halving concentration halves absorbance."), 18: ("c", "Values agree closely (precise) but are far from 5.50 g (not accurate)."),
    19: ("d", "Amorphous carbon (charcoal) is the most reactive form."), 20: ("d", "Gold is not a rare earth element."),
    21: ("a", "Boron melts at about 2076 °C, far above the other group 13 elements."), 22: ("b", "Bronze is copper and tin."),
    23: ("b", "Purifying metals by electrolysis is electrorefining."), 24: ("b", "Plaster of Paris is CaSO4·½H2O."),
    25: ("b", "HPLC separates, identifies and quantifies compounds."), 26: ("c", "Solvent extraction is a separation technique."),
    27: ("d", "Limestone forms slag (CaSiO3) with silica impurities."), 28: ("c", "7.4 mg / 0.5 L = 14.8 mg/L."),
    29: ("d", "Fe2(SO4)3 = 400; O = 192/400 = 48%."), 30: ("b", "1190 x 0.37 / 36.46 ≈ 12.1 M."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    saq(1, T, """a) Define the 'true' value in analytical measurements. (1 mark)
b) Why is it important to compare measured values with the 'true' value? (2 marks)
c) Explain the difference between an analyte and a matrix in a sample. (2 marks)""",
        [("a) The actual value of the quantity, in practice the accepted/ certified reference value", 1), ("b) Assess accuracy/ bias, detect systematic errors, validate methods, ensure reliable decisions/ compliance", 2), ("c) Analyte: substance being measured; matrix: everything else in the sample that may interfere", 2)],
        """a) The true value is the actual value of the quantity being measured; since it can never be known exactly, an accepted reference value (e.g. a certified value of a reference material) is used in practice.
b) Comparing measured values with the true value shows the accuracy (bias) of a method, reveals systematic errors in instruments, reagents or procedures, validates new methods and analysts, and ensures results used for health, trade or regulatory decisions are reliable.
c) The analyte is the specific substance whose amount or presence is being determined (e.g. lead in water). The matrix is everything else in the sample (water, salts, organic matter) that surrounds the analyte and may interfere with its measurement (matrix effects)."""),
    saq(2, T, """a) Define 'interference' and 'masking' in titrimetric analysis. (1 mark)
b) What are the key differences between 'error' and 'uncertainty'? (2 marks)
c) State two characteristics of primary standards. (2 marks)""",
        [("a) Interference: another species that reacts with titrant/ indicator and affects result; masking: adding a reagent (masking agent) to tie up interfering ion so it does not react (e.g. cyanide, triethanolamine in EDTA titration)", 1), ("b) Error: difference between measured and true value (single value, may be corrected if systematic); uncertainty: range within which true value lies with stated confidence, quantifies doubt, always present", 2), ("c) Two: high purity, stable (not hygroscopic, not reacting with air), high molar mass, readily soluble, known stoichiometry, cheap/ available", 2)],
        """a) Interference is the effect of another substance in the sample that reacts with the titrant or indicator and causes a wrong result. Masking is adding a reagent (masking agent) that combines with the interfering ion so it no longer reacts, e.g. triethanolamine or cyanide to mask Fe3+ or Cu2+ in EDTA titrations.
b) Error is the difference between a single measured value and the true value - it can be systematic (correctable) or random. Uncertainty is a range around the result within which the true value is expected to lie with a stated confidence; it quantifies the doubt in a measurement, is always present and is reported with the result.
c) A primary standard must be of very high, known purity and stable (not hygroscopic, not reacting with air or CO2); it should also have a high molar mass (reducing weighing errors), be readily soluble and react stoichiometrically - e.g. anhydrous sodium carbonate, potassium hydrogen phthalate."""),
    saq(3, T, """a) What is spectrophotometry? (1 mark)
b) State Beer's law and its significance in spectrophotometry. (2 marks)
c) What is a monochromator and what are its functions? (2 marks)""",
        [("a) Measuring the absorption (or transmission) of light by a substance at particular wavelengths to identify/ quantify it", 1), ("b) A = εbc - absorbance proportional to concentration and path length; basis of quantitative analysis via calibration curve; valid for dilute solutions", 2), ("c) Device (prism/ grating with slits) that isolates a narrow band of wavelengths from the source; functions: select wavelength, improve selectivity/ sensitivity, scan spectra", 2)],
        """a) Spectrophotometry is the measurement of how much light a substance absorbs (or transmits) at particular wavelengths, used to identify substances and determine their concentration.
b) Beer's (Beer-Lambert) law: A = εbc - absorbance is directly proportional to the concentration of the absorbing species (c) and the path length (b), with molar absorptivity ε. It is the basis of quantitative analysis: a calibration curve of absorbance against standard concentrations gives the unknown concentration; it holds for dilute solutions and monochromatic light.
c) A monochromator is the part of the instrument (entrance slit, prism or diffraction grating, exit slit) that separates the light from the source into its wavelengths and selects a narrow band to pass through the sample. Functions: choosing the wavelength of maximum absorbance, improving selectivity and sensitivity, reducing stray light and allowing a spectrum to be scanned."""),
    saq(4, T, """a) Identify the types of hazards present in a laboratory. (1 mark)
b) What essential safety measures should be taken to minimise risks in a chemical laboratory? (2 marks)
c) Explain the importance of safety data sheets (SDS) and how they support laboratory safety protocols. (2 marks)""",
        [("a) Chemical (toxic, corrosive, flammable, reactive), physical (fire, electrical, glass, heat, pressure), biological, radiological, ergonomic", 1), ("b) PPE, fume hoods/ ventilation, labelling and proper storage/ segregation, training/ SOPs, no food, waste disposal, emergency equipment (eyewash, shower, extinguisher), spill kits", 2), ("c) SDS give hazards, safe handling, storage, PPE, first aid, spill/ fire measures, disposal; used for risk assessment, training, emergencies, GHS compliance", 2)],
        """a) Chemical hazards (toxic, corrosive, flammable, explosive or reactive chemicals), physical hazards (fire, electricity, hot surfaces, broken glass, compressed gases), biological hazards (microorganisms, samples), radiation, and ergonomic hazards.
b) Wear PPE (lab coat, goggles, gloves); work with volatile or toxic chemicals in a fume hood; label, store and segregate chemicals correctly (acids from bases, oxidisers from flammables); follow SOPs and training; never eat or drink in the laboratory; dispose of waste properly; keep eyewash stations, safety showers, fire extinguishers, first-aid and spill kits ready; and know emergency procedures.
c) A safety data sheet (in 16 standard GHS sections) gives each chemical's hazards, safe handling and storage, required PPE, first-aid measures, fire-fighting and spill procedures, stability and disposal. SDS are used for risk assessments, training, labelling and emergency response, so everyone knows how to work safely and act quickly in an accident."""),
]
C1 = """Case I: Titrimetric analysis
Titrimetric analysis (titration) is a quantitative analytical technique in which a known volume of a solution (the titrant) is gradually added to an unknown solution (the analyte) until the reaction is complete. The volume of titrant used is then measured to determine the concentration or amount of the substance. The end point is usually marked by a colour change, often produced by an auxiliary reagent called an indicator."""
C2 = """Case II: Standard reference materials
Inaccurate laboratory measurements can lead to wasted time, energy and materials, manufacturing rejects and product liability. To minimise errors, recognised international standards organisations distribute standard reference materials (SRMs) - metals, chemicals, plastics and environmental samples - that can be used to test the accuracy of analytical procedures in laboratories worldwide. SRMs are essential for detecting and correcting errors, ensuring consistent and reliable results across laboratories."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("chem2024", 1, T, C1, items=[
    it("1. What is the main application of titration in analytical chemistry? Why is titration a significant technique in volumetric analysis?", 10,
       [("Main application: determining unknown concentration/ amount of a substance; examples (acidity of foods, hardness of water, assay of drugs, chloride, vitamin C)", 5), ("Significance: accurate and precise, simple, cheap equipment, fast, versatile (many reaction types), absolute method using stoichiometry, standardisation, used in QC and teaching", 5)],
       "Titration is mainly used to determine the unknown concentration or amount of a substance in a sample by reacting it with a standard solution of known concentration - e.g. acidity of milk, vinegar or soil, total hardness of water (EDTA), chloride in water (Mohr's method), vitamin C in juice, iron in ores, assay of pharmaceuticals, and standardising solutions. Significance in volumetric analysis: it is accurate and precise (often better than 0.1-0.2%) when done well; needs only simple, inexpensive glassware; is fast and versatile, covering acid-base, redox, complexometric and precipitation reactions; it is an absolute method based on reaction stoichiometry (no calibration curve needed); and it is widely used in quality control, food, water, environmental and pharmaceutical laboratories and in teaching."),
    it("2. What are the different types of titration? Discuss each with examples.", 10,
       [("Acid-base (neutralisation) - HCl vs NaOH, phenolphthalein/ methyl orange", 2.5), ("Redox - KMnO4 vs Fe2+/ oxalate, iodometry with thiosulphate", 2.5), ("Complexometric - EDTA for Ca/Mg hardness with Eriochrome Black T", 2.5), ("Precipitation - AgNO3 for chloride (Mohr/ Volhard); also back titration, non-aqueous", 2.5)],
       "1. Acid-base (neutralisation) titration: an acid reacts with a base, e.g. HCl titrated with NaOH using phenolphthalein, or Na2CO3 with HCl using methyl orange; used for acidity and alkalinity. 2. Redox titration: electron transfer between oxidant and reductant, e.g. KMnO4 with Fe2+ or oxalic acid (self-indicating), K2Cr2O7 with Fe2+, and iodometry (iodine liberated and titrated with sodium thiosulphate using starch). 3. Complexometric titration: formation of a stable complex, e.g. EDTA with Ca2+ and Mg2+ for water hardness using Eriochrome Black T at pH 10. 4. Precipitation titration: formation of an insoluble precipitate, e.g. AgNO3 with chloride (Mohr's method with chromate indicator, Volhard's back titration with thiocyanate). Others: back titration (when the reaction is slow or the sample insoluble, e.g. CaCO3 in antacids) and non-aqueous titrations for weak acids/bases."),
    it("3. Explain the key steps in a titration. How can you ensure accurate measurement and transfer of both the titrant and the analyte solution?", 10,
       [("Steps: prepare/ standardise titrant, rinse burette with titrant, fill, remove air bubbles, read initial volume; pipette analyte into flask, add indicator; titrate with swirling, dropwise near end point; record final volume; repeat for concordant results; calculate", 5), ("Accuracy: calibrated class A glassware, rinse with solution not water, read meniscus at eye level, white tile, pipette filler, correct draining/ touch-off, temperature, avoid bubbles, concordant titres within 0.1 mL", 5)],
       "Steps: 1. Prepare and standardise the titrant against a primary standard. 2. Rinse the burette with a little titrant, fill it, remove air bubbles from the tip and record the initial reading. 3. Rinse the pipette with the analyte solution and transfer an exact volume (e.g. 25.00 mL) into a clean conical flask; add a few drops of indicator. 4. Add titrant while swirling, quickly at first then dropwise near the end point, until the colour change persists. 5. Record the final reading; repeat until concordant titres (within about 0.1 mL) are obtained; calculate using the reaction stoichiometry. Ensuring accuracy: use clean, calibrated class A burettes, pipettes and volumetric flasks; rinse with the solution to be used, not water; read the bottom of the meniscus at eye level against a white card (avoid parallax); use a pipette filler and let the pipette drain correctly, touching off the last drop; avoid air bubbles and leaks; work at a constant temperature; place the flask on a white tile to see the colour change; and use the same indicator amount each time."),
    it("4. What are common sources of error in titration experiments, and how can they be minimised?", 10,
       [("Sources: parallax/ reading errors, air bubbles/ leaks, incorrect end point (over-titration, colour judgement), impure/ unstandardised titrant, contaminated/ wet glassware, temperature, indicator error, pipetting errors, CO2 absorption", 5), ("Minimisation: proper reading technique, standardise titrant, rinse correctly, dropwise near end point, blank titration, suitable indicator, replicate/ concordant results, calibrated glassware, protect from air", 5)],
       "Common errors: parallax error in reading the burette; air bubbles in the burette tip or leaks from the tap; over-shooting the end point or misjudging the colour change; using an impure or unstandardised titrant (or a solution that changed concentration, e.g. NaOH absorbing CO2); wet or contaminated glassware diluting solutions; incorrect pipetting (draining, blowing out); wrong or excess indicator (indicator error); temperature effects on volume. Minimisation: read at eye level using a white card; remove air bubbles and check the tap; titrate dropwise near the end point with constant swirling and a white tile; standardise the titrant regularly and store it properly; rinse glassware with the solutions used; use calibrated class A glassware; choose an indicator whose colour change matches the equivalence point and use only a few drops; run a blank titration; repeat until concordant results and use the mean."),
    it("5. Discuss the 'end point' and 'equivalence point' in a titration. What role does an indicator play, and why must it be used in small quantities?", 10,
       [("Equivalence point: stoichiometrically equivalent amounts reacted (theoretical); end point: observed signal (colour change) - ideally coincide; difference = titration error", 4), ("Indicator role: shows end point by colour change near equivalence (weak acid/ base dyes change with pH, metal ion, redox potential), choose to match pH range", 3), ("Small quantity: indicator is itself an acid/ base or reacts with titrant, consumes titrant and shifts end point, dull/ blurred colour change", 3)],
       "The equivalence point is the theoretical point at which the amount of titrant added is chemically equivalent to the analyte according to the reaction stoichiometry. The end point is the point actually observed in the experiment - usually a colour change of an indicator (or a change in an instrumental signal). Ideally they coincide; the small difference is the titration (indicator) error, which is minimised by choosing a suitable indicator. Role of the indicator: an indicator is a substance (often a weak organic acid or base, or a metal-ion or redox indicator) whose colour changes over a narrow range of pH, metal-ion concentration or potential close to the equivalence point, making the end point visible - e.g. phenolphthalein for strong base-weak acid titrations, methyl orange for strong acid-weak base. Use in small quantities: indicators are themselves acids, bases or reactive species, so excess indicator consumes titrant and shifts the end point, and a high concentration makes the colour change gradual and harder to see; a few drops give a sharp, accurate end point."),
])
Q += case("chem2024", 2, T, C2, items=[
    it("1. What types of experimental error can occur in a laboratory? Discuss their potential sources.", 10,
       [("Systematic (determinate) errors - instrumental, method, personal - with sources", 4), ("Random (indeterminate) errors - uncontrollable fluctuations (noise, temperature, reading) ", 3), ("Gross errors/ blunders - mistakes (wrong sample, calculation, contamination)", 3)],
       "1. Systematic (determinate) errors - affect all results in the same direction and cause bias: instrumental errors (uncalibrated balances, glassware or instruments, drift), method errors (incomplete reactions, interferences, side reactions, indicator error), and personal errors (consistent misjudging of colour changes, parallax). 2. Random (indeterminate) errors - small, unpredictable variations in both directions that affect precision: electronic noise, fluctuations in temperature, pressure or power, limits of reading scales, small differences in technique. 3. Gross errors (blunders) - occasional mistakes such as using the wrong sample or reagent, contamination, spills, recording or calculation mistakes; they produce outliers and must be identified and discarded."),
    it("2. What measures can reduce errors and improve accuracy in laboratory experiments?", 10,
       [("Calibration of instruments/ glassware, use of SRMs/ CRMs, method validation", 3), ("Good technique and training, SOPs, replicate measurements, blanks, controls, standard additions", 3), ("Quality control: control charts, proficiency testing, maintenance, environmental control, clean reagents, careful recording/ double-checking, data review", 4)],
       "Calibrate instruments and volumetric glassware regularly against traceable standards; analyse standard or certified reference materials alongside samples to check accuracy; validate methods (accuracy, precision, linearity, detection limits); run blanks to correct for reagent contributions and use internal standards or standard additions for matrix effects; perform replicate measurements and use the mean; train staff and follow written SOPs; use pure reagents and clean glassware; control temperature and environment; maintain equipment; use quality control samples with control charts and take part in inter-laboratory proficiency testing; record data carefully and check calculations independently."),
    it("3. What is a standard reference material (SRM)? What is its significance in analytical chemistry?", 10,
       [("Definition: material with certified property values (composition/ concentration) and stated uncertainty, traceable, issued by recognised body (e.g. NIST), homogeneous and stable", 4), ("Significance: check accuracy/ trueness, calibrate, validate methods, establish metrological traceability, compare labs, quality assurance/ accreditation (ISO 17025)", 6)],
       "A standard reference material is a material - such as an alloy, chemical, soil, water or food sample - that is sufficiently homogeneous and stable and whose properties (e.g. element concentrations) are certified, with stated uncertainty and metrological traceability, by a recognised body such as NIST (the term SRM is NIST's trademark; generally called certified reference materials, CRMs). Significance: they are the yardstick for accuracy - analysing an SRM shows whether a method gives the correct result; they are used to calibrate instruments, validate new methods, establish traceability of results to SI units, compare results between laboratories and over time, train analysts, and meet quality assurance and accreditation requirements (ISO/IEC 17025), giving confidence in results used for health, trade and regulation."),
    it("4. What are the benefits of using SRMs regularly in a laboratory? How do SRMs support quality control?", 10,
       [("Benefits: early detection of bias/ drift, confidence in results, comparability, traceability, accreditation, reduces rework/ disputes/ cost", 5), ("QC support: run with each batch as control sample, control charts and acceptance limits, method validation, instrument calibration check, proficiency, corrective action when out of limits", 5)],
       "Benefits: regular use detects bias, instrument drift and method problems early; gives confidence that results are accurate and comparable with other laboratories and over time; provides traceability required by customers, regulators and accreditation bodies; reduces costly repeat analyses, rejected products and disputes; and supports staff training and competence. Quality control: an SRM (or a matrix-matched CRM) is analysed with each batch of samples as a control; its result must fall within the certified value plus or minus acceptable limits; results are plotted on control charts to monitor trends; out-of-limit results trigger investigation and corrective action before reporting; SRMs are also used in method validation, calibration checks and proficiency testing."),
    it("5. State the key similarities and differences between standard reference materials (SRMs) and in-house reference standards with respect to their uses and certification.", 10,
       [("Similarities: both homogeneous, stable, characterised materials used for QC, calibration checks, monitoring precision", 4), ("Differences: SRMs certified by accredited/ national body with uncertainty and traceability, expensive, limited supply, used for accuracy/ validation; in-house standards prepared and characterised by the lab (often against SRM), not formally certified, cheaper, matrix-matched, used for routine QC/ control charts", 6)],
       "Similarities: both are homogeneous and stable materials with known (characterised) values, used to check analytical performance, calibrate or verify instruments, and monitor accuracy and precision in quality control. Differences: SRMs/CRMs are produced and certified by a recognised national or international body, with certified values, stated uncertainties and documented traceability, and certificates of analysis; they are expensive and available in limited quantities, so are used mainly for method validation, calibration and periodic accuracy checks. In-house reference standards are prepared by the laboratory itself (often characterised against an SRM), are not formally certified, have no official uncertainty statement, are cheaper and available in larger amounts and can be matched closely to the laboratory's own sample matrix - so they are used for routine, day-to-day quality control and control charts."),
])
PATTERN = STANDARD
