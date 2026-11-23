"""ME Technical Paper II (General Subject Knowledge), MEDICAL SCIENCE group ('Medical Group'), BCSE 2011 - real paper, PDF sent
by the founder. Same layout as the latest (BCSE 2025) paper: Part I 70 MCQ x 1; Part II 10 short answers x 3 - so no marks
were changed (Part II Q2 and Q8 are split into parts that add to 3). Options retyped from the page layout. Picture: MCQ 25.
Left out (more than one defensible answer): MCQ 6 (ATP count depends on what is counted), 17 (DCT reabsorbs NaCl and, with
ADH, water), 31 ('select the correct alternatives' - two are right), 60 (P2O5 also dries HCl). Eleven new MCQs keep Part I at 70.
Repeats (recorded as appearances, not loaded again): MCQ 54, 55, 57, 59, 62, 63 (BCSE 2023) and 10 (BCSE 2018).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, Medical Science): BCSE 2011, batch 1"
GROUP_TAG = "medsci2011"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "medical-science"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2011 Main Examination, Technical Paper II, Medical Science", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 10, "marks_each": 3, "answer_any": None},
]
TOPIC = "Medical Science: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Xylem and phloem are ……… tissues:",
"opts": [
"ground",
"dermal",
"vascular",
"both (b) and (c)"
]
},
{
"n": 2,
"stem": "Annual rings in a tree trunk are the number of:",
"opts": [
"rings of vascular bundles in monocot stems",
"layers of secondary xylem in a stem",
"internodes in a stem",
"both (b) and (c)"
]
},
{
"n": 3,
"stem": "Plant roots function to:",
"opts": [
"anchor the plant",
"store the products of photosynthesis",
"produce hormones that stimulate shoot growth",
"all of the above"
]
},
{
"n": 4,
"stem": "Evaporation of water from the aerial parts of a plant is called:",
"opts": [
"translocation",
"transpiration",
"guttation",
"tension"
]
},
{
"n": 5,
"stem": "Which light is the most effective for photosynthesis?",
"opts": [
"Green",
"Yellow",
"Blue and red",
"Yellow and violet"
]
},
{
"n": 7,
"stem": "Fertilisation of the egg in a flowering plant takes place inside the:",
"opts": [
"anther",
"stigma",
"pollen tube",
"embryo sac"
]
},
{
"n": 8,
"stem": "Flowers emit fragrance mainly:",
"opts": [
"to purify the air",
"to attract insects",
"to drive away flies",
"to perform all the above functions"
]
},
{
"n": 9,
"stem": "Seedlings grown in darkness:",
"opts": [
"are smaller than those grown in light",
"are taller than those grown in light",
"are the same size",
"none of the above"
]
},
{
"n": 11,
"stem": "The largest number of nerve cell bodies (neurons) in the body is found in the:",
"opts": [
"Brain",
"Tongue",
"Kidneys",
"Stomach"
]
},
{
"n": 12,
"stem": "The sigmoid colon is a part of the:",
"opts": [
"large intestine",
"small intestine",
"pharynx",
"rectum"
]
},
{
"n": 13,
"stem": "During swallowing, food is prevented from entering the trachea by the:",
"opts": [
"larynx",
"epiglottis",
"pharynx",
"tongue"
]
},
{
"n": 14,
"stem": "The site of gaseous exchange in the lungs is the:",
"opts": [
"pulmonary chamber",
"trachea",
"bronchioles",
"alveoli"
]
},
{
"n": 15,
"stem": "Systole refers to the contraction of the:",
"opts": [
"major arteries",
"SA node",
"atria and ventricles (heart chambers)",
"all the above"
]
},
{
"n": 16,
"stem": "In which of the following structures would you be least likely to find urine?",
"opts": [
"Large intestine",
"Urethra",
"Ureter",
"Bladder"
]
},
{
"n": 18,
"stem": "The pancreatic cells that secrete insulin are called:",
"opts": [
"alpha cells",
"beta cells",
"chief cells",
"delta cells"
]
},
{
"n": 19,
"stem": "Which of the following is mismatched?",
"opts": [
"Semicircular canals - inner ear",
"Utricle and saccule - outer ear",
"Auditory canal - outer ear",
"Ossicles - middle ear"
]
},
{
"n": 20,
"stem": "Most of the history of life on earth concerns the evolution of:",
"opts": [
"prokaryotes",
"photosynthesisers",
"plants and animals",
"eukaryotes"
]
},
{
"n": 21,
"stem": "A manure made from a mixture of crop debris and cow dung is called:",
"opts": [
"green manure",
"farmyard manure",
"compost manure",
"bio-fertiliser"
]
},
{
"n": 22,
"stem": "HIV compromises the immune system mainly by infecting:",
"opts": [
"cytotoxic T cells",
"helper T cells",
"suppressor T cells",
"plasma cells"
]
},
{
"n": 23,
"stem": "Excessive intake of alcohol mainly damages the:",
"opts": [
"liver",
"lungs",
"kidneys",
"heart"
]
},
{
"n": 24,
"stem": "When a glass rod is rubbed with silk, it acquires a positive charge because:",
"opts": [
"protons are added to it",
"electrons are added to it",
"electrons are removed from it",
"protons are removed from it"
]
},
{
"n": 25,
"stem": "A spherical cavity has been removed from a solid sphere with charge distributed uniformly through its volume, as shown in the figure. The electric field inside the emptied space is:",
"opts": [
"zero everywhere",
"non-zero and uniform",
"non-uniform",
"zero only at its centre"
],
"image": "/papers/me/tech2-medsci-2011-sphere.png"
},
{
"n": 26,
"stem": "The anode (negative terminal) of a dry cell is made of:",
"opts": [
"zinc",
"carbon",
"copper",
"lead"
]
},
{
"n": 27,
"stem": "A moving electric charge produces:",
"opts": [
"both electric and magnetic fields",
"an electric field only",
"a magnetic field only",
"neither of these fields"
]
},
{
"n": 28,
"stem": "A vertical wire carries a current upwards. An electron beam is sent horizontally towards the wire. The beam will be deflected:",
"opts": [
"towards the right",
"towards the left",
"upwards",
"downwards"
]
},
{
"n": 29,
"stem": "The ozone layer:",
"opts": [
"blocks infrared radiation from the sun",
"blocks ultraviolet radiation from the sun",
"reflects radio waves",
"prevents infrared radiation from the earth escaping"
]
},
{
"n": 30,
"stem": "In an AC circuit, power is consumed (dissipated) in:",
"opts": [
"inductance only",
"capacitance only",
"resistance only",
"all three"
]
},
{
"n": 32,
"stem": "Heat radiations are:",
"opts": [
"gamma rays",
"microwaves",
"infrared radiations",
"radio waves"
]
},
{
"n": 33,
"stem": "Which of these waves has the highest frequency?",
"opts": [
"Ground waves",
"Sky waves",
"Television waves",
"Visible light waves"
]
},
{
"n": 34,
"stem": "Interference can take place in:",
"opts": [
"all waves",
"transverse waves only",
"longitudinal waves only",
"standing waves only"
]
},
{
"n": 35,
"stem": "Light appears to travel in straight lines in everyday situations because:",
"opts": [
"it is not absorbed by the atmosphere",
"it is reflected by the upper atmosphere",
"its wavelength is very small",
"its speed is very large"
]
},
{
"n": 36,
"stem": "Which of the following phenomena cannot take place with sound waves?",
"opts": [
"Reflection",
"Interference",
"Diffraction",
"Polarisation"
]
},
{
"n": 37,
"stem": "The condition for minimum spherical aberration with two thin lenses of focal lengths f₁ and f₂ separated by a distance d is:",
"opts": [
"d = f₁ + f₂",
"d = (f₁ + f₂)/2",
"d = (f₁ − f₂)/2",
"d = f₁ − f₂"
]
},
{
"n": 38,
"stem": "According to classical physics, the path of an electron in Rutherford's nuclear model of the atom would be:",
"opts": [
"circular",
"parabolic",
"spiral",
"straight"
]
},
{
"n": 39,
"stem": "Which quantity is the same for all hydrogen-like atoms and ions in the same energy state (same n)?",
"opts": [
"radius of orbit",
"speed of electron",
"energy of electron",
"angular momentum of electron"
]
},
{
"n": 40,
"stem": "In which region of the electromagnetic spectrum does the Lyman series of hydrogen lie?",
"opts": [
"Ultraviolet",
"Infrared",
"Visible",
"X-ray"
]
},
{
"n": 41,
"stem": "The X-ray region lies between:",
"opts": [
"short radio waves and the visible region",
"the visible and ultraviolet regions",
"gamma rays and the ultraviolet region",
"short radio waves and microwaves"
]
},
{
"n": 42,
"stem": "The nature of light waves is similar to that of:",
"opts": [
"cathode rays",
"beta rays",
"gamma rays",
"alpha rays"
]
},
{
"n": 43,
"stem": "An electric field can deflect:",
"opts": [
"X-rays",
"neutrons",
"alpha particles",
"gamma rays"
]
},
{
"n": 44,
"stem": "The atomic number of an atom is the:",
"opts": [
"number of protons in the nucleus",
"number of neutrons in the nucleus",
"number of nucleons in the nucleus",
"number of protons plus electrons"
]
},
{
"n": 45,
"stem": "The mass number of an atom is the:",
"opts": [
"number of protons in the nucleus",
"number of neutrons in the nucleus",
"total number of protons and neutrons in the nucleus",
"number of electrons in the atom"
]
},
{
"n": 46,
"stem": "In some substances charge can flow at ordinary temperature but not at very low temperature. These are called:",
"opts": [
"Conductors",
"Insulators",
"Semiconductors",
"Dielectrics"
]
},
{
"n": 47,
"stem": "In a good conductor, the energy gap between the valence and conduction bands is:",
"opts": [
"Infinite",
"Wide",
"Narrow",
"Zero (bands overlap)"
]
},
{
"n": 48,
"stem": "A 500 g sample of toothpaste contains 0.2 g of fluoride. What is the fluoride concentration in parts per million (ppm)?",
"opts": [
"250",
"200",
"400",
"1000"
]
},
{
"n": 49,
"stem": "A membrane which allows the passage of solvent but not of solute particles is called:",
"opts": [
"Permeable membrane",
"Semi-permeable membrane",
"Non-permeable membrane",
"(a) and (b)"
]
},
{
"n": 50,
"stem": "During the formation of a chemical bond, the potential energy of the system:",
"opts": [
"Increases",
"Decreases",
"Neither increases nor decreases",
"Remains constant"
]
},
{
"n": 51,
"stem": "KCl readily dissolves in water because:",
"opts": [
"it is a salt of potassium",
"it reacts with water",
"it is an electrovalent compound",
"its ions are easily solvated (hydrated)"
]
},
{
"n": 52,
"stem": "Which one is NOT a property of a crystalline solid?",
"opts": [
"Isotropy",
"Sharp melting point",
"Definite and regular geometry",
"Strong intermolecular forces"
]
},
{
"n": 53,
"stem": "Evaporation of water is:",
"opts": [
"a process in which heat is neither evolved nor absorbed",
"a process accompanied by a chemical reaction",
"an exothermic change",
"an endothermic change"
]
},
{
"n": 56,
"stem": "The metal present in chlorophyll is:",
"opts": [
"Zinc",
"Magnesium",
"Calcium",
"Sodium"
]
},
{
"n": 58,
"stem": "Which one is the strongest reducing agent?",
"opts": [
"HF",
"HCl",
"HBr",
"HI"
]
},
{
"n": 61,
"stem": "Transition elements belong to the:",
"opts": [
"s-block",
"p-block",
"d-block",
"none of these"
]
},
{
"n": 64,
"stem": "Carbolic acid is:",
"opts": [
"Phenol",
"Phenyl benzoate",
"Phenyl acetate",
"Salol"
]
},
{
"n": 65,
"stem": "The isocyanide (carbylamine) test is used to detect:",
"opts": [
"primary alcohols",
"primary amines",
"secondary amines",
"secondary alcohols"
]
},
{
"n": 66,
"stem": "The material used to coat non-stick pans is:",
"opts": [
"Polystyrene",
"Terylene",
"Teflon",
"PVC"
]
},
{
"n": 67,
"stem": "Which of the following are natural polymers?",
"opts": [
"Proteins",
"Cellulose",
"Natural rubber",
"All of the above"
]
},
{
"n": 68,
"stem": "The disease kwashiorkor is caused by deficiency of:",
"opts": [
"Enzymes",
"Essential amino acids (protein)",
"Non-essential amino acids",
"None of these"
]
},
{
"n": 69,
"stem": "Which of the following is NOT a reducing sugar?",
"opts": [
"Maltose",
"Sucrose",
"Lactose",
"Glucose"
]
},
{
"n": 70,
"stem": "Pernicious anaemia is caused by deficiency of vitamin:",
"opts": [
"B1",
"B2",
"B6",
"B12"
]
}
]"""

KEY = {
 1: ('c', 'Xylem (water) and phloem (food) make up the vascular (conducting) tissue of plants.'),
 2: ('b', 'Each year the cambium adds a layer of secondary xylem (spring and autumn wood), forming one annual ring.'),
 3: ('d', 'Roots anchor the plant, store food (e.g. carrot) and produce hormones such as cytokinins, besides absorbing water and minerals.'),
 4: ('b', 'Transpiration is loss of water vapour, mainly through stomata; guttation is loss of liquid water drops.'),
 5: ('c', 'Chlorophyll absorbs mainly blue and red light; green is reflected.'),
 7: ('d', 'The pollen tube carries male gametes to the embryo sac in the ovule, where one fuses with the egg.'),
 8: ('b', 'Scent attracts insect pollinators.'),
 9: ('b', 'In darkness seedlings become etiolated - tall, thin and pale - as they elongate to search for light.'),
 11: ('a', 'The brain contains tens of billions of neurons.'),
 12: ('a', 'The sigmoid colon is the S-shaped last part of the colon (large intestine) before the rectum.'),
 13: ('b', 'The epiglottis, a flap of cartilage, covers the opening of the larynx during swallowing.'),
 14: ('d', 'Gas exchange takes place across the thin walls of the alveoli.'),
 15: ('c', 'Systole is contraction of the heart chambers; diastole is relaxation.'),
 16: ('a', 'Urine passes through the ureters, bladder and urethra; the large intestine carries faeces.'),
 18: ('b', 'Beta cells of the islets of Langerhans secrete insulin; alpha cells secrete glucagon.'),
 19: ('b', 'The utricle and saccule are part of the inner ear (vestibule), not the outer ear.'),
 20: ('a', 'Prokaryotes appeared about 3.5 billion years ago and were the only life for roughly 2 billion years.'),
 21: ('b', 'Farmyard manure is decomposed dung, urine and litter/crop residues from the farm.'),
 22: ('b', 'HIV infects and destroys CD4 helper T cells.'),
 23: ('a', 'Alcohol is metabolised in the liver; heavy drinking causes fatty liver, hepatitis and cirrhosis.'),
 24: ('c', 'Glass loses electrons to the silk; only electrons move in charging by friction.'),
 25: ('b', "By superposition the field in the cavity is (ρ/3ε₀) × (vector from the sphere's centre to the cavity's centre) - the same everywhere, so it is uniform and non-zero."),
 26: ('a', 'In a Leclanché dry cell the zinc container is the anode (negative) and the carbon rod is the cathode (positive).'),
 27: ('a', 'Every charge has an electric field; a moving charge (current) also produces a magnetic field.'),
 28: ('c', "The wire's magnetic field circles it. For an electron (negative) moving towards the wire, F = −e(v × B) points parallel to the current, i.e. upwards."),
 29: ('b', "Stratospheric ozone absorbs most of the sun's harmful ultraviolet radiation."),
 30: ('c', 'Ideal inductors and capacitors store and return energy each cycle; average power is dissipated only in resistance.'),
 32: ('c', 'Radiant heat is mainly infrared radiation.'),
 33: ('d', 'Visible light (about 10¹⁴ Hz) has a much higher frequency than radio and TV waves.'),
 34: ('a', 'Interference is a property of all waves (superposition), both transverse and longitudinal.'),
 35: ('c', 'Because its wavelength is tiny compared with everyday obstacles, light shows negligible diffraction.'),
 36: ('d', 'Sound in air is longitudinal, and only transverse waves can be polarised.'),
 37: ('d', 'Spherical aberration of a two-lens combination is minimised when the separation equals the difference of the focal lengths, d = f₁ − f₂.'),
 38: ('c', "An accelerating (orbiting) charge radiates energy classically, so the electron would spiral into the nucleus - a failure of Rutherford's model."),
 39: ('d', 'Angular momentum = nh/2π depends only on n; radius, speed and energy depend on the nuclear charge Z.'),
 40: ('a', 'Lyman lines (transitions to n = 1) are in the ultraviolet; Balmer lines are visible.'),
 41: ('c', 'X-rays have wavelengths between ultraviolet (longer) and gamma rays (shorter).'),
 42: ('c', 'Gamma rays, like light, are electromagnetic waves; cathode, alpha and beta rays are streams of particles.'),
 43: ('c', 'Only charged particles are deflected; alpha particles are positive, while X-rays, gamma rays and neutrons are uncharged.'),
 44: ('a', 'Atomic number Z = number of protons.'),
 45: ('c', 'Mass number A = protons + neutrons.'),
 46: ('c', 'Semiconductors behave as insulators near absolute zero and conduct at room temperature as electrons gain energy to cross the small band gap.'),
 47: ('d', 'In metals the valence and conduction bands overlap, so there is no gap.'),
 48: ('c', 'ppm = (0.2/500) × 10⁶ = 400 ppm.'),
 49: ('b', 'A semi-permeable membrane lets solvent molecules pass but blocks solute particles - the basis of osmosis.'),
 50: ('b', 'Energy is released when a bond forms, so the potential energy decreases and the system becomes more stable.'),
 51: ('d', 'The energy released when water molecules surround (hydrate) K⁺ and Cl⁻ ions overcomes the lattice energy.'),
 52: ('a', 'Crystalline solids are anisotropic (properties differ with direction); amorphous solids are isotropic.'),
 53: ('d', 'Evaporation absorbs latent heat from the surroundings - an endothermic physical change.'),
 56: ('b', 'A magnesium ion lies at the centre of the chlorophyll molecule.'),
 58: ('d', 'HI has the weakest bond and iodide gives up electrons most easily, so it is the strongest reducing agent.'),
 61: ('c', 'Transition elements fill d orbitals - the d-block of the periodic table.'),
 64: ('a', 'Phenol (C₆H₅OH) is called carbolic acid.'),
 65: ('b', 'Primary amines heated with chloroform and alcoholic KOH give foul-smelling isocyanides.'),
 66: ('c', 'Teflon (polytetrafluoroethylene) is heat-resistant and non-stick.'),
 67: ('d', 'Proteins, cellulose and natural rubber are all made by living organisms.'),
 68: ('b', 'Kwashiorkor results from severe protein (essential amino acid) deficiency in children.'),
 69: ('b', 'Sucrose has no free aldehyde or ketone group, so it is non-reducing.'),
 70: ('d', 'Lack of vitamin B12 (usually from lack of intrinsic factor) causes pernicious anaemia.'),
}

NEW_MCQ = [
    ('Which hormone controls the reabsorption of water in the collecting ducts of the kidney?', ['Insulin', 'Antidiuretic hormone (ADH)', 'Thyroxine', 'Glucagon'], 'b', 'ADH (vasopressin) from the posterior pituitary makes the collecting ducts permeable to water.'),
    ('Which gas is released when an acid reacts with a carbonate?', ['Hydrogen', 'Oxygen', 'Carbon dioxide', 'Nitrogen'], 'c', 'Acid + carbonate → salt + water + carbon dioxide.'),
    ('The process by which green plants make glucose using sunlight takes place in the:', ['Mitochondria', 'Chloroplasts', 'Ribosomes', 'Nucleus'], 'b', 'Photosynthesis occurs in chloroplasts, which contain chlorophyll.'),
    ('Which electrode is negative in an electrolytic cell?', ['Anode', 'Cathode', 'Both', 'Neither'], 'b', 'In electrolysis the cathode is connected to the negative terminal; cations move to it and gain electrons.'),
    ('The liver converts excess glucose into which storage form?', ['Starch', 'Glycogen', 'Cellulose', 'Sucrose'], 'b', 'Insulin stimulates the liver and muscles to store glucose as glycogen.'),
    ('Which of the following is an example of a noble metal used in jewellery and dentistry because it does not corrode?', ['Iron', 'Gold', 'Sodium', 'Zinc'], 'b', 'Gold is very unreactive (noble), so it does not tarnish or corrode.'),
    ('The process of conversion of sugar into alcohol by yeast is called:', ['Hydrolysis', 'Fermentation', 'Distillation', 'Saponification'], 'b', 'Yeast ferments glucose anaerobically into ethanol and carbon dioxide.'),
    ('Which acid is present in the human stomach?', ['Sulphuric acid', 'Nitric acid', 'Hydrochloric acid', 'Acetic acid'], 'c', 'Parietal cells secrete hydrochloric acid, which activates pepsin and kills microbes.'),
    ('Which of the following is a strong electrolyte?', ['Glucose solution', 'Acetic acid', 'Sodium chloride solution', 'Distilled water'], 'c', 'NaCl ionises completely in water; acetic acid is weak and glucose is a non-electrolyte.'),
    ('The functional group present in alcohols is:', ['−CHO', '−COOH', '−OH', '−NH₂'], 'c', 'Alcohols contain the hydroxyl (−OH) group.'),
    ('Which of the following is used as a local anaesthetic?', ['Lignocaine (lidocaine)', 'Paracetamol', 'Penicillin', 'Insulin'], 'a', 'Lignocaine blocks sodium channels in nerves, numbing a small area for minor procedures.'),
]

SAQ = [
 dict(marks=3, stem="With reference to human dentition, explain the term diphyodont. What is the dental formula of an adult human? State the function of each type of tooth. (3 marks)",
      kp=[("Diphyodont: two sets of teeth in a lifetime - 20 deciduous (milk) teeth replaced by 32 permanent teeth", 1),
          ("Adult dental formula (each half jaw, upper/lower): I 2/2, C 1/1, PM 2/2, M 3/3 = 2123/2123 × 2 = 32 (milk teeth 2102/2102 = 20)", 1),
          ("Functions: incisors cut/bite, canines tear, premolars and molars crush and grind", 1)],
      model="Diphyodont dentition means that two successive sets of teeth develop in a lifetime: 20 deciduous (milk) teeth, which are later shed and replaced by 32 permanent teeth.\nDental formula of an adult human (for one half of the upper and lower jaw): incisors 2/2, canines 1/1, premolars 2/2, molars 3/3, written 2123/2123; multiplied by 2 this gives 32 teeth. (Milk teeth: 2102/2102 = 20.)\nFunctions: incisors - cutting and biting; canines - tearing and holding food; premolars - crushing and grinding; molars - grinding and chewing food finely."),
 dict(marks=3, stem="Explain the following terms:\na) ECG (electrocardiograph) (1 marks)\nb) EMG (electromyography) (1 marks)\nc) EEG (electroencephalograph) (1 marks)",
      kp=[("a) ECG: records the electrical activity of the heart (P, QRS, T waves) from skin electrodes; used to diagnose arrhythmias, heart attack", 1),
          ("b) EMG: records the electrical activity of skeletal muscles (and their nerve supply) with needle or surface electrodes; used in nerve-muscle disorders", 1),
          ("c) EEG: records the electrical activity of the brain from scalp electrodes (brain waves); used in epilepsy, sleep studies, brain death", 1)],
      model="a) ECG (electrocardiograph/electrocardiogram): a recording of the electrical activity of the heart made with electrodes on the chest and limbs. It shows the P wave, QRS complex and T wave and is used to diagnose arrhythmias, heart attacks and conduction defects.\nb) EMG (electromyography): a recording of the electrical activity of skeletal muscles, using surface or needle electrodes, at rest and during contraction. It helps diagnose muscle diseases and nerve problems (e.g. nerve injury, myopathy, motor neurone disease).\nc) EEG (electroencephalograph/electroencephalogram): a recording of the electrical activity (brain waves) of the brain from electrodes on the scalp. It is used to diagnose epilepsy, study sleep and assess brain death or encephalopathy."),
 dict(marks=3, stem="Name three Gram-positive organisms and one clinical disease that each causes. (3 marks)",
      kp=[("Staphylococcus aureus - boils, abscesses, wound infections, food poisoning", 1), ("Streptococcus pyogenes - sore throat (pharyngitis), rheumatic fever; or Streptococcus pneumoniae - pneumonia", 1),
          ("Clostridium tetani - tetanus; or Corynebacterium diphtheriae - diphtheria, Bacillus anthracis - anthrax, Mycobacterium (acid-fast, Gram-positive-type wall) - TB", 1)],
      model="1. Staphylococcus aureus - skin boils and abscesses, wound infections, food poisoning, osteomyelitis.\n2. Streptococcus pyogenes - sore throat (streptococcal pharyngitis), scarlet fever, rheumatic fever; Streptococcus pneumoniae - lobar pneumonia, meningitis.\n3. Clostridium tetani - tetanus (other examples: Corynebacterium diphtheriae - diphtheria; Bacillus anthracis - anthrax; Clostridium perfringens - gas gangrene)."),
 dict(marks=3, stem="What is the causative agent of tuberculosis (TB)? What laboratory tests would you do to confirm the diagnosis? What do you understand by the term acid-fast bacilli? (3 marks)",
      kp=[("Causative agent: Mycobacterium tuberculosis", 0.5),
          ("Tests: sputum smear microscopy with Ziehl-Neelsen stain (2 samples), GeneXpert (CBNAAT) which also detects rifampicin resistance, sputum culture; supported by chest X-ray (Mantoux/IGRA for infection)", 1.5),
          ("Acid-fast bacilli: bacteria (mycobacteria) with waxy mycolic acid cell walls that retain carbol fuchsin stain even after washing with acid-alcohol, appearing red/pink on a blue background", 1)],
      model="Causative agent: Mycobacterium tuberculosis, a slow-growing, rod-shaped bacterium.\nLaboratory tests: (1) sputum smear microscopy - two sputum samples stained by the Ziehl-Neelsen method and examined for acid-fast bacilli; (2) GeneXpert (cartridge-based nucleic acid amplification), which detects TB DNA within hours and also shows rifampicin resistance; (3) sputum culture (Löwenstein-Jensen medium or liquid culture) with drug-sensitivity testing. Chest X-ray supports the diagnosis; the Mantoux test or IGRA shows infection, not active disease.\nAcid-fast bacilli (AFB): bacteria such as mycobacteria whose cell walls contain waxy mycolic acids. Once stained with hot carbol fuchsin they resist decolourisation with acid-alcohol, so in the Ziehl-Neelsen stain they appear as red rods against a blue background."),
 dict(marks=3, stem="Define the terms digestion and assimilation. Name the enzyme that digests fats. Why are proteases generally released in an inactive form? (3 marks)",
      kp=[("Digestion: breakdown of large insoluble food molecules into small soluble ones by enzymes (and mechanical action) so they can be absorbed", 0.75),
          ("Assimilation: use of absorbed food molecules by body cells to build new tissue/release energy (becoming part of the body)", 0.75), ("Enzyme digesting fats: lipase (pancreatic lipase), helped by bile salts", 0.5),
          ("Proteases are released as inactive zymogens (pepsinogen, trypsinogen) so they do not digest the cells and glands that make them (autodigestion); they are activated only in the gut lumen", 1)],
      model="Digestion is the process by which large, complex, insoluble food molecules are broken down - mechanically and by enzymes - into small, soluble molecules (glucose, amino acids, fatty acids and glycerol) that can be absorbed.\nAssimilation is the process by which the absorbed food molecules are taken up and used by body cells - to build new protoplasm, for growth and repair, or to release energy - so they become part of the body.\nThe enzyme that digests fats is lipase (mainly pancreatic lipase; bile salts emulsify fat first).\nProteases are secreted as inactive precursors (zymogens), such as pepsinogen and trypsinogen, because in active form they would digest the proteins of the very cells and ducts that produce them (autodigestion). They are activated only in the lumen of the stomach (pepsinogen by HCl) or intestine (trypsinogen by enterokinase)."),
 dict(marks=3, stem="Name three important zoonotic diseases prevalent in Bhutan. How would you prevent rabies in your community? (3 marks)",
      kp=[("Zoonoses in Bhutan (any three): rabies, scrub typhus, brucellosis, anthrax, cysticercosis/taeniasis, avian influenza, leptospirosis", 1),
          ("Rabies prevention (animal side): mass dog vaccination, dog population control/sterilisation (e.g. nationwide accelerated dog population management), responsible pet ownership, control of stray dogs", 1),
          ("Rabies prevention (human side): immediate washing of bite wounds with soap and water for 15 min, timely post-exposure prophylaxis (anti-rabies vaccine ± immunoglobulin), awareness, reporting bites, pre-exposure vaccine for high-risk workers", 1)],
      model="Important zoonotic diseases in Bhutan: rabies (especially in the southern border districts), scrub typhus, brucellosis, anthrax, taeniasis/cysticercosis and avian influenza.\nPrevention of rabies in the community:\n• Mass vaccination of dogs (and cats), registration and responsible pet ownership.\n• Control of the stray-dog population through sterilisation and the national dog population management programme; proper waste disposal so dogs are not attracted.\n• Public awareness: avoid stray dogs, report suspected rabid animals and all bites.\n• After any bite or scratch: wash the wound immediately with soap and running water for 15 minutes, apply an antiseptic, and go to the nearest health centre for post-exposure prophylaxis (anti-rabies vaccine, plus rabies immunoglobulin for severe bites) - completing the full course.\n• Pre-exposure vaccination of high-risk groups such as veterinary staff and dog catchers; coordination between health and livestock sectors (One Health)."),
 dict(marks=3, stem="Define refractive error. What are short-sightedness and long-sightedness? How is each corrected? (3 marks)",
      kp=[("Refractive error: the eye fails to focus light rays exactly on the retina, so the image is blurred (due to eyeball length or lens/cornea power)", 1),
          ("Short-sightedness (myopia): distant objects blurred; image forms in front of the retina (eyeball too long/lens too strong); corrected with a concave (diverging) lens", 1),
          ("Long-sightedness (hypermetropia): near objects blurred; image forms behind the retina (eyeball too short/lens too weak); corrected with a convex (converging) lens", 1)],
      model="Refractive error is a condition in which the eye cannot bring parallel light rays to a sharp focus on the retina, so vision is blurred. It is due to the shape of the eyeball or the focusing power of the cornea and lens.\nShort-sightedness (myopia): near objects are seen clearly but distant objects are blurred, because the image of a distant object forms in front of the retina - the eyeball is too long or the lens too powerful. It is corrected with a concave (diverging) lens.\nLong-sightedness (hypermetropia): distant objects are clear but near objects are blurred, because the image forms behind the retina - the eyeball is too short or the lens too weak. It is corrected with a convex (converging) lens.\n(Contact lenses or refractive laser surgery can also correct these errors.)"),
 dict(marks=3, stem="Differentiate between:\na) CT scan and PET scan (1 marks)\nb) ECG and EEG (1 marks)\nc) Implants and prostheses (1 marks)",
      kp=[("a) CT uses X-rays to give detailed cross-sectional anatomical images; PET uses an injected radioactive tracer (e.g. FDG) to show metabolic/functional activity (cancer, brain)", 1),
          ("b) ECG records the electrical activity of the heart; EEG records the electrical activity of the brain", 1),
          ("c) Implants are devices placed inside the body (pacemaker, artificial joint, dental implant, lens); prostheses replace a missing body part, often external (artificial limb, eye)", 1)],
      model="a) CT (computed tomography) scan uses X-rays taken from many angles and a computer to produce cross-sectional images showing the structure (anatomy) of organs. PET (positron emission tomography) uses an injected radioactive tracer such as fluorodeoxyglucose; it shows the function or metabolic activity of tissues, e.g. spread of cancer or brain activity.\nb) ECG records the electrical activity of the heart (P, QRS, T waves); EEG records the electrical activity of the brain (brain waves).\nc) Implants are medical devices placed inside the body, partly or wholly, to replace or support a structure or function - e.g. pacemaker, intraocular lens, hip joint, dental implant. Prostheses are artificial substitutes for a missing body part, often external and removable - e.g. artificial leg or arm, artificial eye, denture."),
 dict(marks=3, stem="Differentiate between isometric and isotonic exercise. Outline one use of ultrasound and one use of infrared rays in physiotherapy. (3 marks)",
      kp=[("Isometric: muscle contracts without change in length and no joint movement (e.g. pushing against a wall, static quadriceps); isotonic: muscle changes length and moves the joint against constant load (e.g. lifting weights, squats)", 1.5),
          ("Ultrasound therapy: deep heating/micro-massage to reduce pain and promote healing of soft-tissue injuries (sprains, tendinitis)", 0.75),
          ("Infrared therapy: superficial heating to relieve pain and muscle spasm and improve circulation before exercise/massage", 0.75)],
      model="Isometric exercise: the muscle contracts and produces tension but its length does not change and the joint does not move - e.g. pressing against a wall, static quadriceps contractions in a patient with a knee injury. Isotonic exercise: the muscle shortens (concentric) or lengthens (eccentric) and moves the joint through a range of motion against a constant load - e.g. lifting weights, squats, walking.\nUltrasound in physiotherapy: high-frequency sound waves produce deep heating and micro-massage of tissues, used to relieve pain, reduce swelling and speed healing of soft-tissue injuries such as sprains, tendinitis and bursitis.\nInfrared rays in physiotherapy: an infrared lamp gives superficial heat, used to relieve pain and muscle spasm, improve blood circulation and relax tissues before exercise or massage (e.g. in back pain, arthritis)."),
 dict(marks=3, stem="Write short notes on telemedicine and video-conferencing and their application in patient care in the Bhutanese context. (3 marks)",
      kp=[("Telemedicine: delivery of healthcare at a distance using ICT - remote consultation, diagnosis (tele-radiology, tele-ECG), referral and follow-up", 1),
          ("Video-conferencing: real-time audio-video link allowing doctors/specialists to see and talk to patients and health workers in remote places, plus training and case discussions", 1),
          ("Bhutanese context: mountainous terrain and few specialists - links BHUs/district hospitals with JDWNRH and regional referral hospitals, reduces travel and cost, speeds emergency advice and referral, continuing medical education; challenges - connectivity, equipment, training", 1)],
      model="Telemedicine is the use of information and communication technology (internet, phone, digital imaging) to provide healthcare at a distance - remote consultation, diagnosis (e.g. sending X-rays, ECGs or photographs to a specialist), treatment advice, referral and follow-up.\nVideo-conferencing is a real-time audio and video link that lets doctors, specialists, health workers and patients at different places see and talk to each other; it is also used for training, case discussions and meetings.\nApplication in Bhutan: Bhutan's mountainous terrain, scattered villages and shortage of specialists make travel to referral hospitals difficult and costly. Telemedicine and video-conferencing link Basic Health Units and district hospitals with JDWNRH and the regional referral hospitals so that health assistants can get specialist advice, emergencies can be managed and referred faster, unnecessary travel is avoided, and staff in remote areas receive continuing medical education. Challenges include internet connectivity, equipment, power supply and training of staff."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
