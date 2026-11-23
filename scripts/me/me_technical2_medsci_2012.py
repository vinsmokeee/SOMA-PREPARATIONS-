"""ME Technical Paper II (General Subject Knowledge), MEDICAL SCIENCE group ('Medical & Health Group'), BCSE 2012 Main
Examination (13 October 2012) - real paper, PDF sent by the founder (a scanned copy: every question was typed from the page
images). Same layout as the latest (BCSE 2025) paper: Part I 70 MCQ x 1; Part II 10 short answers x 3 - so no marks were
changed. No figures in this paper.
Left out (more than one defensible answer or repeated elsewhere): MCQ 7 (plants take nutrients from soil and CO2 from the
atmosphere). Repeats of other years in this batch: 55 (2013 MCQ 31), 63 (2015 MCQ 46). Repeat recorded as an appearance: MCQ 45 (BCSE 2019). Four new MCQs keep Part I at 70.
Fixed: MCQ 12 option '.03%' shown as 0.03-0.04% (today about 0.04%); MCQ 65 option (c) reworded for clarity.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Medical Science): BCSE 2012, batch 1"
GROUP_TAG = "medsci2012"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "medical-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2012 Main Examination, Technical Paper II, Medical Science", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Medical Science: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "The myofilaments of muscle consist mainly of two proteins. These are:",
"opts": [
"Actin and myosin",
"Progesterone and testosterone",
"Progesterone and oestrogen",
"Actin and pectin"
]
},
{
"n": 2,
"stem": "Compared with the current in the white-hot filament of a lamp, the current in the connecting wire is:",
"opts": [
"Less",
"The same",
"More",
"None of the above"
]
},
{
"n": 3,
"stem": "A step-up transformer can step up:",
"opts": [
"Voltage",
"Energy",
"Both of these",
"None of these"
]
},
{
"n": 4,
"stem": "Research shows that cigarette smoking results in which of the following conditions?",
"opts": [
"Whooping cough",
"Cardiovascular stress",
"Hepatitis",
"Measles"
]
},
{
"n": 5,
"stem": "The equation E = mc² indicates that energy:",
"opts": [
"equals mass moving at the speed of light squared",
"equals moving mass",
"is fundamentally different from mass",
"and mass are closely related (equivalent)"
]
},
{
"n": 6,
"stem": "A job is done slowly, while an identical job is done quickly. Both jobs require the same amount of work but different amounts of:",
"opts": [
"Energy",
"Power",
"Both A and B",
"None of the above"
]
},
{
"n": 8,
"stem": "The work done by the tension in the string of a pendulum during one complete oscillation is:",
"opts": [
"the total energy of the pendulum",
"the potential energy of the pendulum",
"zero",
"the kinetic energy of the pendulum"
]
},
{
"n": 9,
"stem": "The molar concentration of pure water is about:",
"opts": [
"0.55 M",
"5.5 M",
"55 M",
"550 M"
]
},
{
"n": 10,
"stem": "Chromosomes responsible for characteristics other than sex are called:",
"opts": [
"Ribosomes",
"Lysosomes",
"Autosomes",
"Spermatocytes"
]
},
{
"n": 11,
"stem": "When there are no external forces, the shape of a liquid drop is determined by the:",
"opts": [
"density of the liquid",
"viscosity of the liquid",
"surface tension of the liquid",
"temperature of the air"
]
},
{
"n": 12,
"stem": "What is the approximate percentage of carbon dioxide in the atmosphere?",
"opts": [
"0.03-0.04%",
"1%",
"5%",
"7%"
]
},
{
"n": 13,
"stem": "The period of a simple pendulum is doubled when:",
"opts": [
"the length of the pendulum is doubled",
"the length is halved",
"the length is increased four times",
"the mass of the bob is doubled"
]
},
{
"n": 14,
"stem": "Ribosomal RNA is actively synthesised in the:",
"opts": [
"Nucleoplasm",
"Ribosomes",
"Lysosomes",
"Nucleolus"
]
},
{
"n": 15,
"stem": "When light bends as it enters a different medium, the process is called:",
"opts": [
"Diffusion",
"Contraction",
"Refraction",
"Retraction"
]
},
{
"n": 16,
"stem": "As far as present knowledge extends, hormones are NOT found in which category of substances?",
"opts": [
"Proteins",
"Peptides",
"Nucleic acids",
"Steroids"
]
},
{
"n": 17,
"stem": "The loss of water of crystallisation from a hydrate on exposure to air is called:",
"opts": [
"Efflorescence",
"Deliquescence",
"Quiescence",
"Anhydrogenation"
]
},
{
"n": 18,
"stem": "When a colour-blind man marries a woman with normal colour vision (non-carrier), which of the following is likely?",
"opts": [
"All the children will be colour blind",
"All the grandchildren will be colour blind",
"Only the sons will be colour blind",
"Half the grandsons (sons of their daughters) will be colour blind"
]
},
{
"n": 19,
"stem": "The unit of electrical resistance is the:",
"opts": [
"Hertz",
"Watt",
"Joule",
"Ohm"
]
},
{
"n": 20,
"stem": "A machine does 8 J of work in 2 seconds. What power does it deliver?",
"opts": [
"8 W",
"6 W",
"4 W",
"10 W"
]
},
{
"n": 21,
"stem": "Which of the following is an antiseptic?",
"opts": [
"Aspirin",
"Iodine (tincture/povidone-iodine)",
"Vitamin A",
"Dilute carbol fuchsin"
]
},
{
"n": 22,
"stem": "The first element in the periodic table is:",
"opts": [
"A halogen",
"Hydrogen",
"Nitrogen",
"Cadmium"
]
},
{
"n": 23,
"stem": "Which of the following is NOT an arachnid?",
"opts": [
"Lobster",
"Scorpion",
"Black widow spider",
"Tick"
]
},
{
"n": 24,
"stem": "By mass, the fourth most abundant element in the universe is:",
"opts": [
"Oxygen",
"Carbon",
"Hydrogen",
"Nitrogen"
]
},
{
"n": 25,
"stem": "Which of the following is NOT normally found in blood plasma?",
"opts": [
"Fibrinogen",
"Glucose",
"Urea",
"Glycogen"
]
},
{
"n": 26,
"stem": "A block of wood floats on water. If you push it down until it is completely submerged, the buoyant force on it:",
"opts": [
"Increases",
"Decreases",
"Remains the same",
"Depends on how far below the surface it is pushed"
]
},
{
"n": 27,
"stem": "During the first stage of carbohydrate metabolism (glycolysis), glucose is broken down to:",
"opts": [
"Pyruvic acid",
"Lactic acid",
"Hydrochloric acid",
"Citric acid"
]
},
{
"n": 28,
"stem": "A nuclear reaction in which the nucleus of an atom splits into smaller parts is called:",
"opts": [
"Nuclear fusion",
"Nuclear combustion",
"Nuclear fission",
"Nuclear blast"
]
},
{
"n": 29,
"stem": "The 'ozone hole' refers to:",
"opts": [
"a hole in the ozone layer",
"a decrease of ozone in the troposphere",
"a decrease in the thickness of the ozone layer in the stratosphere",
"an increase in ozone in the troposphere"
]
},
{
"n": 30,
"stem": "The only metal that is liquid at room temperature is:",
"opts": [
"Mercury",
"Chromium",
"Cadmium",
"Lead"
]
},
{
"n": 31,
"stem": "Animals with a built-in 'thermostat' that keeps their body temperature constant are called:",
"opts": [
"Biothermic",
"Poikilothermic",
"Oligothermic",
"Homeothermic"
]
},
{
"n": 32,
"stem": "Ordinary table sugar (sucrose) is a:",
"opts": [
"Monosaccharide",
"Disaccharide",
"Polysaccharide",
"Oligosaccharide"
]
},
{
"n": 33,
"stem": "A water vascular system is found in the:",
"opts": [
"Sea anemone",
"Sea horse",
"Sea cucumber",
"Sea pen"
]
},
{
"n": 34,
"stem": "A substance that reacts with both strong acids and strong bases is called:",
"opts": [
"Dimorphic",
"Dual reactive",
"Diphasic",
"Amphoteric"
]
},
{
"n": 35,
"stem": "Mosses and ferns are found in moist, shady places because both:",
"opts": [
"depend for nutrition on microorganisms that survive only at low temperatures",
"do not need sunlight for photosynthesis",
"require water for fertilisation",
"cannot compete with sun-loving plants"
]
},
{
"n": 36,
"stem": "Removal of two hydrogen atoms from a primary alcohol (dehydrogenation) gives:",
"opts": [
"an acetide",
"an aldehyde",
"a polyene",
"a keto-acetone"
]
},
{
"n": 37,
"stem": "In the first (light-dependent) stage of photosynthesis, light energy is used to:",
"opts": [
"move water molecules",
"denature chlorophyll",
"split water",
"produce carbohydrates"
]
},
{
"n": 38,
"stem": "When vinegar and baking soda are mixed, the gas formed is:",
"opts": [
"Oxygen",
"Nitrogen",
"Hydrogen",
"Carbon dioxide"
]
},
{
"n": 39,
"stem": "The cell walls of algae are made up of:",
"opts": [
"Hemicellulose, pectin and proteins",
"Cellulose, galactans and mannans",
"Cellulose, hemicellulose and pectins",
"Pectins, cellulose and proteins"
]
},
{
"n": 40,
"stem": "One end of a towel dips into a bucket of water and the other end hangs outside. After some time the whole towel becomes wet. This is due to:",
"opts": [
"the high viscosity of water",
"capillary action in the cotton threads",
"high gravitational force",
"evaporation of water upwards"
]
},
{
"n": 41,
"stem": "The skin receptors in humans that are sensitive to heat (warmth) are:",
"opts": [
"End organs of Krause",
"Meissner's corpuscles",
"End organs of Ruffini",
"Pacinian corpuscles"
]
},
{
"n": 42,
"stem": "The atoms in a sugar molecule are held together by:",
"opts": [
"Covalent bonds",
"Van der Waals bonds",
"Ionic bonds",
"Hydrogen bonds"
]
},
{
"n": 43,
"stem": "The process by which an amino acid loses its amino group is called:",
"opts": [
"Hydration",
"Deamination",
"Oxidoamination",
"Dehydration"
]
},
{
"n": 44,
"stem": "Which of the following statements about catalysts is NOT correct?",
"opts": [
"An enzyme is a catalyst that binds only certain substrates",
"An enzyme is a protein that is a highly efficient catalyst for reactions in a living system",
"Catalysts increase the rate of a reaction by altering the mechanism, thereby increasing the activation energy",
"Catalysts do not alter the equilibrium constant of a reaction"
]
},
{
"n": 46,
"stem": "A process in which substances are separated by differences in the rates at which they migrate is called:",
"opts": [
"Filtration",
"Chromatography",
"Elution",
"Titration"
]
},
{
"n": 47,
"stem": "Which of the following lacks a backbone?",
"opts": [
"Alligator",
"Baby panda",
"Eagle",
"Jellyfish"
]
},
{
"n": 48,
"stem": "The pascal is a unit of:",
"opts": [
"Pressure",
"Energy",
"Force",
"Work"
]
},
{
"n": 49,
"stem": "Which of the following is NOT a cell organelle?",
"opts": [
"Mitochondria",
"Lysosome",
"Cytoplasm",
"Endoplasmic reticulum"
]
},
{
"n": 50,
"stem": "A family has 7 boys and 1 girl. What is the chance that the next child will be a girl?",
"opts": [
"12.5%",
"50%",
"25%",
"100%"
]
},
{
"n": 51,
"stem": "The thin wire inside an electric bulb that glows is called the:",
"opts": [
"Tungsten",
"Filament",
"Electrowire",
"Electric transmitter"
]
},
{
"n": 52,
"stem": "A knee-jerk response to a sharp tap is an example of a:",
"opts": [
"Reflex",
"Habit",
"Learned response",
"Instinct"
]
},
{
"n": 53,
"stem": "Of the following liquids, which is the densest?",
"opts": [
"Water",
"Gasoline",
"Chloroform",
"Acetone"
]
},
{
"n": 54,
"stem": "The blood of a cockroach has no respiratory pigment (no role in carrying oxygen). This shows that:",
"opts": [
"the cockroach does not respire",
"its respiration is anaerobic",
"oxygen goes directly to the tissues",
"oxygen is not used in cell respiration"
]
},
{
"n": 56,
"stem": "DNA fingerprinting needs only a tiny sample of DNA, such as white cells in a blood stain, because:",
"opts": [
"a large quantity of DNA is present in WBCs",
"DNA contains nitrogenous bases",
"DNA can be amplified by PCR",
"DNA determines heredity"
]
},
{
"n": 57,
"stem": "Infrared light is not visible to the human eye because:",
"opts": [
"its wavelength is too long",
"its wavelength is too short",
"it is not made of visible colours",
"it travels too fast to be seen"
]
},
{
"n": 58,
"stem": "If a cell has twice as much DNA as a normal functional cell, it means the cell:",
"opts": [
"has completed its division",
"is preparing to divide",
"has ceased to function",
"has reached the end of its life span"
]
},
{
"n": 59,
"stem": "Crude oil is separated into its components by:",
"opts": [
"Chemical reaction",
"Simple distillation",
"Fractional distillation",
"Settling"
]
},
{
"n": 60,
"stem": "A common point of similarity between RNA and DNA is that:",
"opts": [
"both are double stranded",
"both have identical sugars",
"both have identical pyrimidine bases",
"both are polymers of nucleotides"
]
},
{
"n": 61,
"stem": "If the earth's radius shrank by 1% while its mass stayed the same, the acceleration due to gravity at its surface would:",
"opts": [
"increase",
"remain the same",
"decrease",
"none of these"
]
},
{
"n": 62,
"stem": "Which of the following lacks respiratory, excretory and circulatory systems?",
"opts": [
"Sponges",
"Threadworms",
"Liver flukes",
"Tapeworms"
]
},
{
"n": 64,
"stem": "Tachyglossus (the spiny anteater, echidna) is a connecting link between:",
"opts": [
"Reptiles and birds",
"Amphibians and reptiles",
"Birds and mammals",
"Reptiles and mammals"
]
},
{
"n": 65,
"stem": "When water is heated from 10 °C to 20 °C, its internal energy:",
"opts": [
"increases by 10 units",
"is doubled",
"increases only slightly (much less than doubled)",
"is more than doubled"
]
},
{
"n": 66,
"stem": "In the human body, the organ in which most digestion takes place is the:",
"opts": [
"Small intestine",
"Liver",
"Stomach",
"Large intestine"
]
},
{
"n": 67,
"stem": "Baking soda is chemically:",
"opts": [
"Potassium chloride",
"Potassium carbonate",
"Potassium hydroxide",
"Sodium bicarbonate"
]
},
{
"n": 68,
"stem": "Osmoregulation is concerned with:",
"opts": [
"Excretion",
"Ionic regulation",
"Control of the body's water content",
"Carbon dioxide regulation"
]
},
{
"n": 69,
"stem": "The pH of a solution that is 1000 times more acidic than pure water is:",
"opts": [
"10",
"7",
"6",
"4"
]
},
{
"n": 70,
"stem": "The Moon always shows the same face to the Earth. This means the Moon rotates about its axis about once per:",
"opts": [
"Day",
"Month",
"Year",
"None - the Moon does not rotate"
]
}
]"""

KEY = {
 1: ('a', 'Thin filaments are actin and thick filaments are myosin; their sliding causes contraction.'),
 2: ('b', 'The filament and wire are in series, so the same current flows through both; the filament glows because of its higher resistance.'),
 3: ('a', 'A transformer raises voltage (lowering current); it cannot increase energy or power.'),
 4: ('b', 'Smoking damages blood vessels and the heart (hypertension, coronary heart disease); the others are infections.'),
 5: ('d', "Einstein's equation shows mass and energy are equivalent and interconvertible."),
 6: ('b', 'Power = work/time; the same work in less time needs more power.'),
 8: ('c', "The tension is always perpendicular to the bob's motion, so it does no work."),
 9: ('c', '1000 g/L ÷ 18 g/mol ≈ 55.5 mol/L.'),
 10: ('c', 'Humans have 22 pairs of autosomes and one pair of sex chromosomes.'),
 11: ('c', 'Surface tension minimises surface area, making a free drop spherical.'),
 12: ('a', 'CO₂ is about 0.04% (about 420 ppm today; about 0.03% in older textbooks).'),
 13: ('c', 'T = 2π√(l/g), so doubling T needs four times the length; mass has no effect.'),
 14: ('d', 'rRNA is transcribed and ribosomal subunits are assembled in the nucleolus.'),
 15: ('c', 'Bending of light at a boundary because its speed changes is refraction.'),
 16: ('c', 'Hormones are proteins/peptides (insulin), steroids (cortisol) or amino-acid derivatives (thyroxine) - not nucleic acids.'),
 17: ('a', 'Efflorescent salts such as washing soda lose water to the air; deliquescent ones absorb water and dissolve.'),
 18: ('d', 'All daughters are carriers and all sons normal; each carrier daughter passes the gene to half her sons.'),
 19: ('d', 'Resistance is measured in ohms.'),
 20: ('c', 'P = W/t = 8/2 = 4 W.'),
 21: ('b', 'Iodine preparations kill microbes on skin and wounds; aspirin is an analgesic and carbol fuchsin a stain.'),
 22: ('b', 'Hydrogen has atomic number 1.'),
 23: ('a', 'The lobster is a crustacean; scorpions, spiders and ticks are arachnids (eight legs).'),
 24: ('b', 'By mass the order is hydrogen, helium, oxygen, then carbon.'),
 25: ('d', 'Glycogen is stored inside liver and muscle cells; blood carries glucose.'),
 26: ('a', 'Buoyant force equals the weight of water displaced; as more of the block goes under, more water is displaced, so the force increases (until fully submerged).'),
 27: ('a', 'Glycolysis splits glucose into two pyruvate (pyruvic acid) molecules.'),
 28: ('c', 'Splitting a heavy nucleus is fission; joining light nuclei is fusion.'),
 29: ('c', 'The ozone hole is a seasonal thinning of stratospheric ozone, especially over Antarctica.'),
 30: ('a', 'Mercury melts at −39 °C. (Bromine, also liquid, is a non-metal.)'),
 31: ('d', 'Homeotherms (birds and mammals) keep a constant body temperature; poikilotherms vary with the surroundings.'),
 32: ('b', 'Sucrose is made of one glucose and one fructose unit - a disaccharide.'),
 33: ('c', 'The water vascular system is unique to echinoderms such as sea cucumbers and starfish.'),
 34: ('d', 'Amphoteric substances (e.g. Al₂O₃, ZnO, amino acids) react with both acids and bases.'),
 35: ('c', 'Their male gametes (sperm) must swim through water to reach the egg.'),
 36: ('b', 'Oxidation/dehydrogenation of a primary alcohol gives an aldehyde (secondary alcohols give ketones).'),
 37: ('c', 'Light energy drives photolysis of water, releasing oxygen and providing electrons and H⁺ for ATP and NADPH.'),
 38: ('d', 'CH₃COOH + NaHCO₃ → CH₃COONa + H₂O + CO₂.'),
 39: ('b', 'Algal cell walls contain cellulose together with galactans, mannans and minerals such as calcium carbonate.'),
 40: ('b', 'Water rises through the fine spaces between cotton fibres by capillary action.'),
 41: ('c', "Ruffini endings are traditionally linked with warmth, Krause bulbs with cold, Meissner's with light touch and Pacinian with pressure/vibration."),
 42: ('a', 'C, H and O atoms within a sugar molecule share electrons - covalent bonds (hydrogen bonds act between sugar molecules).'),
 43: ('b', 'Deamination (mainly in the liver) removes the amino group, which is converted to urea.'),
 44: ('c', 'Catalysts lower, not increase, the activation energy.'),
 46: ('b', 'In chromatography components move at different rates through a stationary phase and separate.'),
 47: ('d', 'The jellyfish is an invertebrate (cnidarian).'),
 48: ('a', '1 Pa = 1 N/m².'),
 49: ('c', 'Cytoplasm is the jelly-like matrix in which organelles lie; it is not itself an organelle.'),
 50: ('b', "Each birth is independent: the father's sperm carries X or Y with equal chance, so 50%."),
 51: ('b', 'The glowing coil is the filament (made of tungsten).'),
 52: ('a', 'The knee jerk is a spinal reflex - automatic and rapid, through a reflex arc.'),
 53: ('c', 'Chloroform has a density of about 1.48 g/cm³; water 1.0, acetone 0.79, gasoline about 0.75.'),
 54: ('c', 'Insects deliver oxygen straight to the tissues through a network of tracheae.'),
 56: ('c', 'The polymerase chain reaction makes millions of copies of the DNA from a few cells.'),
 57: ('a', "Infrared wavelengths (above about 700 nm) are longer than the eye's visible range (about 400-700 nm)."),
 58: ('b', 'DNA is replicated in the S phase before division, doubling the amount.'),
 59: ('c', 'Fractional distillation separates crude oil into fractions with different boiling ranges.'),
 60: ('d', 'Both are polynucleotides; they differ in sugar (ribose/deoxyribose), strands and a base (uracil/thymine).'),
 61: ('a', 'g = GM/R², so a smaller R gives a larger g (by about 2%).'),
 62: ('a', 'Sponges have no organ systems; water flowing through their pores serves these functions.'),
 64: ('d', 'This egg-laying mammal (monotreme) shows both reptilian and mammalian features.'),
 65: ('c', 'Internal energy depends on absolute temperature: 283 K → 293 K is only about a 3.5% rise, far less than doubling.'),
 66: ('a', 'Most chemical digestion and absorption occur in the small intestine.'),
 67: ('d', 'Baking soda is sodium hydrogen carbonate, NaHCO₃.'),
 68: ('c', 'Osmoregulation maintains the balance of water (and solutes) in the body, mainly by the kidneys.'),
 69: ('d', 'Each pH unit is a 10-fold change: 1000 = 10³, so pH = 7 − 3 = 4.'),
 70: ('b', "The Moon's rotation period equals its orbital period (about 27.3 days) - synchronous (tidal) locking."),
}

NEW_MCQ = [
    ("Which of the following is the 'energy currency' of the cell?", ['DNA', 'ATP', 'Glucose', 'Insulin'], 'b', 'ATP stores and releases energy for cell activities when its phosphate bonds are broken.'),
    ('Which of the following animals is a mammal?', ['Shark', 'Whale', 'Crocodile', 'Frog'], 'b', 'Whales breathe air, are warm-blooded and suckle their young - they are mammals.'),
    ('Which of the following is a non-renewable source of energy?', ['Solar', 'Wind', 'Coal', 'Hydropower'], 'c', 'Coal is a fossil fuel formed over millions of years and cannot be replaced on a human time scale.'),
    ('The main function of red blood cells is to:', ['fight infection', 'transport oxygen', 'help blood clot', 'produce antibodies'], 'b', 'Red cells contain haemoglobin and carry oxygen from the lungs to the tissues.'),
]

SAQ = [
 dict(marks=3, stem="What is an axon reflex? (3 marks)",
      kp=[("A local response in which an impulse in one branch of a sensory nerve fibre travels antidromically (backwards) down other branches of the same axon, without passing through the spinal cord/CNS", 1.5),
          ("Not a true reflex - there is no reflex arc or synapse", 0.5), ("Example: the flare of the triple response - injury/scratch causes branches to release substance P/CGRP, producing local vasodilatation and redness around the injury", 1)],
      model="An axon reflex is a local nervous response in which an impulse set up in one branch of a sensory nerve fibre travels up to a branching point and then back down (antidromically) along the other branches of the same axon, without passing through the spinal cord or brain. It is therefore not a true reflex, as there is no reflex arc or synapse.\nExample: when the skin is scratched or injured, the impulse spreads along the branches of the sensory nerve, which release substance P and CGRP, causing the surrounding arterioles to dilate - the red 'flare' of Lewis's triple response. Axon reflexes also explain some sweating and piloerection responses used in tests of autonomic nerve function."),
 dict(marks=3, stem="What is an electric fuse? Explain its functions briefly. (3 marks)",
      kp=[("A safety device: a short piece of thin wire of low melting point (tin-lead alloy) connected in series with the circuit/appliance (live wire)", 1),
          ("Works on the heating effect of current: when current exceeds the rated value (short circuit or overload), the wire heats and melts, breaking the circuit", 1),
          ("Function: protects wiring and appliances from damage and prevents fires; rating chosen slightly above normal current (e.g. 5 A, 15 A); MCBs now often used instead", 1)],
      model="An electric fuse is a safety device consisting of a short, thin wire made of a material with a low melting point (such as a tin-lead alloy), placed in a holder and connected in series with the live wire of a circuit or appliance.\nIt works on the heating effect of electric current. When the current rises above the safe value - because of a short circuit, an overload or a fault - the fuse wire heats up and melts, breaking the circuit and stopping the current.\nFunctions: it protects the wiring and appliances from damage due to excess current and prevents electrical fires and shocks. Each fuse has a rating slightly above the normal working current of the circuit (e.g. 5 A for lighting, 15 A for power); after a fault it must be replaced. Modern installations often use miniature circuit breakers (MCBs), which can be reset."),
 dict(marks=3, stem="Write two differences between vitamins and hormones. Give one example of each. (3 marks)",
      kp=[("Source: vitamins must be obtained from the diet (mostly not made by the body); hormones are made by endocrine glands in the body", 1),
          ("Action: vitamins act mainly as coenzymes/regulators of metabolism; hormones are chemical messengers carried in blood to target organs; deficiency vs. over- or under-secretion diseases", 1),
          ("Examples: vitamin C (or A, D, B1); hormone insulin (or thyroxine, adrenaline)", 1)],
      model="1. Source: vitamins are organic substances needed in small amounts that the body cannot make in sufficient quantity, so they must come from food (except vitamin D, made in skin, and vitamin K, made by gut bacteria). Hormones are made inside the body by endocrine glands.\n2. Mode of action: vitamins act mainly as coenzymes or cofactors in metabolic reactions within cells; hormones are chemical messengers secreted into the blood and carried to distant target organs, where they regulate growth, metabolism and reproduction.\n3. Disorders: vitamin problems are mainly deficiency diseases (scurvy, rickets); hormone problems arise from over- or under-secretion (diabetes, goitre, gigantism).\nExamples: vitamin - vitamin C (ascorbic acid); hormone - insulin."),
 dict(marks=3, stem="What is a balanced diet? (3 marks)",
      kp=[("A diet that contains all nutrients - carbohydrates, proteins, fats, vitamins, minerals, water and fibre - in the right proportions/amounts", 1),
          ("Meets the energy and nutrient needs of the individual according to age, sex, activity, pregnancy/illness, maintaining health and normal weight", 1),
          ("Examples/guidance: cereals (rice/maize) for energy, pulses/meat/eggs/dairy for protein, vegetables and fruits for vitamins and minerals, limited fat, salt and sugar (e.g. avoid excess salt/butter tea, chilli-cheese)", 1)],
      model="A balanced diet is one that provides all the nutrients the body needs - carbohydrates, proteins, fats, vitamins, minerals, water and dietary fibre - in the correct proportions and amounts to meet the person's energy and nutritional requirements.\nThe amount needed varies with age, sex, body size, physical activity and conditions such as pregnancy, breastfeeding or illness. A balanced diet maintains good health, normal growth and a healthy body weight and protects against both under-nutrition and non-communicable diseases.\nIn practice it means: cereals such as rice, maize or buckwheat for energy; pulses, meat, fish, eggs and dairy for protein; plenty of vegetables and fruits for vitamins, minerals and fibre; small amounts of fats and oils; and limiting salt, sugar and fatty foods (e.g. salty butter tea and very cheesy dishes)."),
 dict(marks=3, stem="What is the meaning of amalgamation with reference to chemistry? Give examples. (3 marks)",
      kp=[("Amalgamation: formation of an alloy of mercury with another metal (an amalgam)", 1),
          ("Examples: dental amalgam (mercury + silver, tin, copper) for tooth fillings; sodium amalgam (reducing agent); gold/silver amalgam", 1),
          ("Use in metallurgy: extraction of gold and silver from ores by amalgamation, then heating to drive off mercury (mercury is toxic - environmental concern)", 1)],
      model="In chemistry, amalgamation is the process of forming an amalgam - an alloy of mercury with another metal. Mercury dissolves many metals such as gold, silver, tin, zinc and sodium.\nExamples: dental amalgam (mercury with silver, tin and copper) used to fill teeth; sodium amalgam, used as a reducing agent in the laboratory; gold and silver amalgams.\nIn metallurgy, amalgamation is used to extract gold and silver from crushed ores: the precious metal dissolves in mercury, and the amalgam is then heated so that the mercury evaporates, leaving the metal. Because mercury vapour is toxic, this method causes health and environmental hazards."),
 dict(marks=3, stem="Briefly describe the blood groups of human beings. (3 marks)",
      kp=[("ABO system (Landsteiner): groups A, B, AB and O according to A/B antigens on red cells; plasma has the opposite antibodies (A - anti-B, B - anti-A, O - both, AB - none)", 1.5),
          ("Rh system: Rh positive (D antigen present) or Rh negative; anti-D forms after exposure (transfusion/pregnancy)", 0.75),
          ("Importance: matching for transfusion (O negative universal donor, AB positive universal recipient), Rh incompatibility in pregnancy", 0.75)],
      model="Human blood groups are based on antigens on the surface of red blood cells. The two most important systems are:\nABO system (discovered by Landsteiner): group A has antigen A and anti-B antibodies in the plasma; group B has antigen B and anti-A; group AB has both antigens and no anti-A or anti-B; group O has no A or B antigens but both antibodies.\nRh system: people whose red cells carry the D antigen are Rh positive; those without it are Rh negative. Anti-D antibodies form only after exposure to Rh-positive blood, through transfusion or pregnancy.\nImportance: blood must be cross-matched before transfusion to avoid clumping and haemolysis - O negative is the universal donor of red cells and AB positive the universal recipient. Rh incompatibility between an Rh-negative mother and Rh-positive baby can cause haemolytic disease of the newborn."),
 dict(marks=3, stem="What is the chemical name of vitamin B1? Name the disease caused by its deficiency in human beings. (3 marks)",
      kp=[("Vitamin B1 = thiamine (thiamin)", 1), ("Deficiency disease: beriberi (dry - nerves/paralysis, wet - heart failure/oedema); also Wernicke-Korsakoff syndrome in alcoholics", 1),
          ("Sources/prevention: whole grains, unpolished/parboiled rice, pulses, meat; deficiency linked to polished rice diets and alcohol (outbreaks reported in Bhutanese monastic schools)", 1)],
      model="The chemical name of vitamin B1 is thiamine (thiamin). It acts as a coenzyme (thiamine pyrophosphate) in carbohydrate metabolism.\nIts deficiency causes beriberi: dry beriberi affects the nerves (numbness, muscle weakness, difficulty walking), and wet beriberi affects the heart (breathlessness, swelling of the legs, heart failure). In heavy drinkers, deficiency causes Wernicke-Korsakoff syndrome (confusion, memory loss).\nThiamine is found in whole grains, parboiled or unpolished rice, pulses, nuts and meat. Diets based on highly polished white rice, and alcoholism, lead to deficiency; outbreaks have occurred in boarding schools and monastic institutions in Bhutan, where thiamine supplements are now given."),
 dict(marks=3, stem="Name the bacterium that causes tetanus. Name the vaccine that prevents tetanus. (3 marks)",
      kp=[("Clostridium tetani - a Gram-positive, anaerobic, spore-forming bacillus found in soil and animal dung; enters through wounds", 1),
          ("Its toxin (tetanospasmin) causes muscle stiffness and spasms - lockjaw", 0.5),
          ("Prevented by tetanus toxoid vaccine - given as DPT/pentavalent in infancy with boosters (Td) and to pregnant women (prevents neonatal tetanus); TT/anti-tetanus immunoglobulin after dirty wounds", 1.5)],
      model="Tetanus is caused by Clostridium tetani, a Gram-positive, anaerobic, spore-forming bacillus found in soil, dust and animal dung. Its spores enter the body through wounds (rusty nails, burns, unclean delivery or cord care), germinate and produce the toxin tetanospasmin, which causes painful muscle stiffness and spasms, starting with lockjaw.\nTetanus is prevented by the tetanus toxoid vaccine (an inactivated toxin). In Bhutan it is given in infancy as part of the pentavalent (DPT-HepB-Hib) vaccine, with boosters as Td in childhood and adulthood, and to pregnant women to prevent neonatal tetanus. After a dirty wound, a booster dose of tetanus toxoid (and anti-tetanus immunoglobulin if not immunised) is given."),
 dict(marks=3, stem="What are the five functions of the skeletal system in the body? (3 marks)",
      kp=[("Support - framework that gives shape to the body; Protection of organs (skull - brain, ribs - heart and lungs, vertebrae - spinal cord)", 1.2),
          ("Movement - bones act as levers for muscles at joints; Blood cell formation (haemopoiesis) in red bone marrow", 1.2), ("Storage of minerals (calcium, phosphate) and fat (yellow marrow)", 0.6)],
      model="1. Support - the skeleton forms a rigid framework that gives the body its shape and supports soft tissues.\n2. Protection - bones protect delicate organs: the skull protects the brain, the rib cage the heart and lungs, and the vertebral column the spinal cord.\n3. Movement - bones act as levers; muscles attached to them by tendons pull on them at joints to produce movement.\n4. Blood cell formation (haemopoiesis) - red bone marrow in flat bones and the ends of long bones produces red cells, white cells and platelets.\n5. Storage - bones store minerals, especially calcium and phosphate, releasing them into the blood when needed, and yellow marrow stores fat."),
 dict(marks=3, stem="A wire of length L and resistance R is stretched so that its length is doubled. Explain how (i) its resistance and (ii) its resistivity change. (3 marks)",
      kp=[("Volume stays constant: doubling the length halves the cross-sectional area (A → A/2)", 1), ("(i) R = ρL/A → ρ(2L)/(A/2) = 4R: resistance becomes four times", 1),
          ("(ii) Resistivity is unchanged - it depends only on the material and temperature, not on dimensions", 1)],
      model="When the wire is stretched its volume stays the same (V = A × L). If the length doubles to 2L, the cross-sectional area must halve to A/2.\n(i) Resistance: R = ρL/A. New resistance R' = ρ(2L)/(A/2) = 4ρL/A = 4R. The resistance becomes four times the original.\n(ii) Resistivity: ρ is a property of the material (and temperature) only, not of its length or thickness, so the resistivity does not change."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
