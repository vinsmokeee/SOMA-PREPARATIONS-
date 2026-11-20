"""ME Technical Paper III (Subject Specialisation Paper), Optometry, BCSE 2025 - real paper (PDF sent by the founder).
Standard pattern. Replaced MCQs: 4 (option c missing in the PDF), 10 (polycarbonate and Trivex both correct),
14 (no clear 'least helpful' option) and 17 (Prentice's rule gives 4 prism dioptres, not among the options). MCQ 9 shows
the instrument picture (Jackson cross cylinder). Ray diagrams are drawn and uploaded as photos.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Optometry): BCSE 2025, batch 1"
GROUP_TAG = "optom2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "optometry"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Optometry"

MCQ = r"""[
{
"n": 1,
"stem": "Which anterior segment condition is commonly associated with HLA-B27 positive spondyloarthropathies?",
"opts": [
"Episcleritis",
"Infectious keratitis",
"Anterior uveitis",
"Pterygium"
]
},
{
"n": 2,
"stem": "A 58-year-old patient on long term systemic medication complains of gradual visual blurring. Fundus reveals microaneurysms, hard exudates, and few dot-blot hemorrhages. What is the most likely diagnosis?",
"opts": [
"Hypertensive retinopathy",
"Non-proliferative diabetic retinopathy",
"Central serous chorioretinopathy",
"Retinal vein occlusion"
]
},
{
"n": 3,
"stem": "During low vision assessment, which is the most appropriate magnifier type for a patient with severe hand tremors?",
"opts": [
"Hand-held magnifier",
"Stand magnifier",
"Clip-on telescope",
"Dome lens"
]
},
{
"n": 4,
"stem": "A 26-year-old patient complains of haloes around lights, especially at night, after starting silicone hydrogel lenses. What is the most likely cause?",
"opts": [
"Lens decentration causing glare",
"Corneal infection",
"",
"Corneal neovascularization"
]
},
{
"n": 5,
"stem": "A visually impaired child with albinism and nystagmus benefits most from:",
"opts": [
"Cylindrical correction",
"Filters and high-contrast magnifiers",
"Tinted contact lenses",
"Pinhole occluder"
]
},
{
"n": 6,
"stem": "You are leading an eye health program in rural Bhutan. Which refractive service model is most cost-effective and scalable?",
"opts": [
"Mobile spectacle van with optometrist only",
"Free spectacles through hospital only",
"Vision technician-led screening with referral",
"Eye hospital-based full refraction for all"
]
},
{
"n": 7,
"stem": "A patient with myopia and high lag of accommodation may benefit from which management during near work?",
"opts": [
"Minus add",
"Cycloplegics",
"Concave prisms",
"Low plus addition lenses"
]
},
{
"n": 8,
"stem": "The Maddox rod test is primarily used to detect",
"opts": [
"Heterochromia",
"Heterophoria",
"Steropsis",
"Accommodative lag"
]
},
{
"n": 9,
"stem": "What is the use of the above instrument?",
"opts": [
"Perform objective refraction",
"Measure accommodation amplitude",
"Refine astigmatism axis and power",
"Confirm binocular vision"
]
},
{
"n": 10,
"stem": "Which material offers the best combination of high impact resistance and UV protection for pediatric patients?",
"opts": [
"Polycarbonate",
"CR-39",
"Trivex",
"Glass"
]
},
{
"n": 11,
"stem": "Which of the following conditions is most acceptable for elective corneal transplantation using stored tissue?",
"opts": [
"Fungal keratitis unresponsive to antifungals",
"Optical keratoplasty in pseudophakic bullous keratopathy",
"Traumatic full-thickness corneal laceration with iris prolapse",
"Peripheral ulcerative keratitis associated with rheumatoid arthritis"
]
},
{
"n": 12,
"stem": "Which drug is contraindicated in narrow-angle glaucoma?",
"opts": [
"Acetazolamide",
"Phenylephrine",
"Latanoprost",
"Timolol"
]
},
{
"n": 13,
"stem": "Which statement about accommodation-convergence relationship is CORRECT?",
"opts": [
"Increased accommodation reduces convergence",
"AC/A ratio is calculated using heterophoria method",
"All near tasks require positive fusional reserve",
"NRA testing isolates fusional convergence"
]
},
{
"n": 14,
"stem": "A patient undergoing vision rehabilitation is unable to manage near tasks due to concentric field loss. Which aid is LEAST helpful?",
"opts": [
"Illuminated stand magnifier",
"Hand-held telescope",
"Eccentric viewing training",
"Braille"
]
},
{
"n": 15,
"stem": "Which extraocular muscle originates from the anterior orbit, rather than the common tendinous ring?",
"opts": [
"Medial rectus",
"Inferior oblique",
"Superior rectus",
"Lateral rectus"
]
},
{
"n": 16,
"stem": "Which of the following is the primary treatment for corneal ulcer due to bacterial origin?",
"opts": [
"Lubricating drops",
"Topical steroids",
"Fortified antibiotics",
"Antiviral agents"
]
},
{
"n": 17,
"stem": "Using the Prentice’s Rule, calculate the prismatic effect induced at 10 mm below the optical center in a +4.00 D single vision lens?",
"opts": [
"0.2 prism diopters base up",
"0.4 prism diopters base down",
"0.2 prism diopters base down",
"No prismatic effect"
]
},
{
"n": 18,
"stem": "A patient complains of image swim and distorted peripheral vision with new progressives glasses. What is the most probable reason?",
"opts": [
"Incorrect monocular PD and fitting height",
"Incorrect lens material",
"Axis misalignment",
"Wrong base curve"
]
},
{
"n": 19,
"stem": "Bhutan recently launched the WHO SPECS 2030 initiative. What is the primary aim of the initiative?",
"opts": [
"Universal cataract coverage",
"Eliminate infectious blindness",
"Scale up effective refractive error overage",
"Eliminate childhood blindness by 2030"
]
},
{
"n": 20,
"stem": "Which of the following materials has the highest oxygen permeability among current lens options?",
"opts": [
"PMMA",
"Hydrogel",
"Silicone hydrogel",
"HEMA"
]
},
{
"n": 21,
"stem": "Which of the following is considered a true ocular emergency requiring same-day referral?",
"opts": [
"Non-proliferative diabetic retinopathy",
"Acute angle-closure glaucoma",
"Macular degeneration",
"Congenital cataract"
]
},
{
"n": 22,
"stem": "A 62-year-old diabetic patient presents with sudden, painless vision loss in one eye and sees “a curtain coming down.” What is the most likely diagnosis?",
"opts": [
"Central retinal artery occlusion",
"Retinal detachment",
"Optic neuritis",
"Macular edema"
]
},
{
"n": 23,
"stem": "In a population-based survey, the prevalence of myopia among 12-year-olds was 48%. Which term best describes this value?",
"opts": [
"Incidence",
"Hazard ratio",
"Prevalence",
"Odds ratio"
]
},
{
"n": 24,
"stem": "A 10-year-old boy with -3.00 D myopia progresses by -1.00 D per year. Which intervention is currently most evidence-based to slow progression?",
"opts": [
"Tinted glasses",
"Avoid reading",
"Orthokeratology lenses",
"Low-dose atropine (0.01%–0.05%)"
]
},
{
"n": 25,
"stem": "A patient using monthly replacement silicone hydrogel lenses reports discomfort and dryness after 8 hours. Slit lamp shows papillae on the upper tarsal conjunctiva. The most likely diagnosis is:",
"opts": [
"Allergic conjunctivitis",
"Giant papillary conjunctivitis (GPC)",
"Corneal abrasion",
"Pingueculitis"
]
},
{
"n": 26,
"stem": "A child with intermittent exotropia and normal VA is undergoing vision therapy. What is a sign of successful therapy progression?",
"opts": [
"Decreased NPC",
"Increasing accommodative lag",
"Improved fusional convergence amplitudes",
"Worsening of stereoacuity"
]
},
{
"n": 27,
"stem": "Which of the following statements about congenital nasolacrimal duct obstruction (CNLDO) is TRUE?",
"opts": [
"Most cases require surgical intervention within the first month of life",
"Over 90% of cases resolve spontaneously within the first year",
"The most common site of obstruction is the punctum",
"It typically presents with photophobia and redness"
]
},
{
"n": 28,
"stem": "While refracting a hyperopic patient, you notice that their visual acuity improves significantly with +1.00 DS. However, the patient complains of headache while reading. What is the likely issue?",
"opts": [
"Overcorrection",
"Latent nystagmus",
"Uncorrected accommodative strain",
"Incorrect axis of cylinder"
]
},
{
"n": 29,
"stem": "The optimal duration of full-time occlusion therapy for moderate amblyopia in a 6-year- old is generally:",
"opts": [
"2 hours per day",
"2 to 6 hours per day, depending on severity",
"Only during reading activities",
"10 to 12 hours continuously for all ages"
]
},
{
"n": 30,
"stem": "Which metabolic pathway is involved in the formation of sorbitol, contributing to diabetic cataract?",
"opts": [
"TCA cycle",
"Urea cycle",
"Polyol pathway",
"Pentose phosphate pathway"
]
}
]"""

KEY = {
    1: ("c", "Acute anterior uveitis is associated with HLA-B27 spondyloarthropathies."), 2: ("b", "Microaneurysms, hard exudates and dot-blot haemorrhages = non-proliferative diabetic retinopathy."),
    3: ("b", "A stand magnifier rests on the page, so tremor does not matter."), 5: ("b", "Filters for photophobia and high-contrast magnification help albinism."),
    6: ("c", "Vision technician-led screening with referral is scalable and cost-effective in rural areas."), 7: ("d", "A low plus add reduces accommodative demand and lag at near."),
    8: ("b", "The Maddox rod measures heterophoria."), 9: ("c", "The Jackson cross cylinder refines astigmatic axis and power."),
    11: ("b", "Optical keratoplasty for pseudophakic bullous keratopathy is an elective graft using stored tissue."), 12: ("b", "Phenylephrine dilates the pupil and can precipitate angle closure."),
    13: ("b", "The AC/A ratio can be calculated by the heterophoria (calculated) method."), 15: ("b", "The inferior oblique arises from the anterior orbital floor, not the annulus of Zinn."),
    16: ("c", "Bacterial corneal ulcers are treated with intensive fortified antibiotics."), 18: ("a", "Wrong PD or fitting height puts the eyes in the distorted periphery of progressives."),
    19: ("c", "SPECS 2030 aims to scale up effective refractive error coverage."), 20: ("c", "Silicone hydrogel has the highest oxygen permeability."),
    21: ("b", "Acute angle-closure glaucoma needs same-day treatment."), 22: ("b", "A curtain coming down suggests retinal detachment."),
    23: ("c", "Proportion with the condition at one point in time = prevalence."), 24: ("d", "Low-dose atropine has strong evidence for slowing myopia progression."),
    25: ("b", "Upper tarsal papillae with lens discomfort = giant papillary conjunctivitis."), 26: ("c", "Improved fusional convergence shows therapy is working."),
    27: ("b", "Over 90% of CNLDO resolves spontaneously in the first year."), 28: ("c", "Uncorrected latent hyperopia causes accommodative strain and headache at near."),
    29: ("b", "PEDIG: 2-6 hours of daily patching depending on severity."), 30: ("c", "Aldose reductase in the polyol pathway converts glucose to sorbitol."),
}
FIX = {9: {"stem": "What is the use of the instrument shown in the picture?", "image": "/papers/me/tech3-optom-2025-cross-cylinder.png"}}
T = TOPIC
Q = mcqs(MCQ, KEY, T, FIX) + [
    new_mcq(1, T, "A contact lens wearer sees haloes around lights at night after switching lenses. The most likely cause is", ["Corneal oedema from hypoxia or lens deposits/poor fit", "Retinal detachment", "Optic neuritis", "Cataract in a 26-year-old"], "a",
            "Haloes in contact lens wearers usually come from corneal oedema (hypoxia), deposits or poor lens fit."),
    new_mcq(2, T, "Using Prentice's rule, the prismatic effect 10 mm below the optical centre of a +4.00 D lens is", ["0.4 Δ base up", "4 Δ base up", "4 Δ base down", "40 Δ base down"], "b",
            "P = c(cm) x F = 1 x 4 = 4 Δ; below the centre of a plus lens the base is up."),
    new_mcq(3, T, "Which low vision device is most suitable for reading by a patient with a central scotoma from macular degeneration?", ["Illuminated stand magnifier with eccentric viewing training", "Reverse telescope", "Pinhole spectacles", "Plano tinted lenses only"], "a",
            "Magnification with good light and eccentric viewing helps central field loss."),
    new_mcq(4, T, "Which spectacle lens material is usually recommended for children because of its high impact resistance and built-in UV protection?", ["CR-39", "Crown glass", "Polycarbonate", "High-index glass"], "c",
            "Polycarbonate (or Trivex) is shatter-resistant and blocks UV, making it the standard choice for children."),
    saq(1, T, "Draw and label the structure of the lacrimal drainage system. What is the role of the valve of Hasner?",
        [("Labelled diagram: puncta, canaliculi (vertical/horizontal), common canaliculus, valve of Rosenmüller, lacrimal sac, nasolacrimal duct, valve of Hasner, inferior meatus", 3), ("Valve of Hasner: mucosal fold at lower end of NLD in inferior meatus; prevents reflux of air/ secretions from nose; imperforate valve causes congenital NLDO", 2)],
        """Diagram: tears drain from the lacrimal lake through the upper and lower puncta → vertical (2 mm) then horizontal (8 mm) canaliculi → common canaliculus → (valve of Rosenmüller) → lacrimal sac in the lacrimal fossa → nasolacrimal duct (about 12-18 mm) running down through the bony canal → opening under the inferior turbinate in the inferior meatus of the nose, guarded by the valve of Hasner.
Valve of Hasner: a mucosal fold at the lower end of the nasolacrimal duct where it opens into the inferior meatus. It allows tears to flow into the nose but prevents air and nasal secretions refluxing up into the duct (e.g. when blowing the nose). If it fails to open at birth (imperforate membrane), it causes congenital nasolacrimal duct obstruction with watering and discharge."""),
    saq(2, T, "What is computer vision syndrome? Explain the 20-20-20 rule.",
        [("CVS definition: group of eye and vision problems from prolonged digital screen use (digital eye strain); symptoms - eye strain, dryness, blur, headache, neck pain; causes - reduced blinking, accommodation demand, glare, uncorrected errors, posture", 3), ("20-20-20 rule: every 20 minutes look at something 20 feet (6 m) away for 20 seconds; relaxes accommodation, promotes blinking", 2)],
        """Computer vision syndrome (digital eye strain) is a group of eye and vision problems from prolonged use of computers, tablets and phones. Symptoms: eye strain and fatigue, dry or burning eyes, blurred vision, difficulty refocusing, headaches, and neck and shoulder pain. Causes: reduced blink rate (dry eye), sustained accommodation and convergence at near, glare and poor contrast, uncorrected refractive error or presbyopia, and poor posture and screen position.
The 20-20-20 rule: every 20 minutes, look at something about 20 feet (6 metres) away for at least 20 seconds. This relaxes accommodation and convergence, encourages blinking and reduces fatigue. Also: correct glasses, screen slightly below eye level at arm's length, reduce glare, and use lubricants if needed."""),
    saq(3, T, "A 12-year-old student with albinism has reduced distance vision (6/36 OU), nystagmus, photophobia and difficulty copying from the blackboard. He uses normal print books but struggles with contrast and glare. List and briefly explain five low vision interventions or adaptations you would recommend to improve his function in the classroom.",
        [("Five interventions explained (1 each): full refractive correction; tinted/ absorptive filters or photochromic lenses, cap/ visor; distance telescope (hand-held/ spectacle-mounted) or electronic magnifier/ phone camera for board; near magnifiers/ large print/ bold-line paper, CCTV; seating in front, away from windows, good task lighting; high-contrast materials, extra time, teacher copies of notes, null-point head posture allowed", 5)],
        "1. Full refractive correction (albinism often has high astigmatism) with polycarbonate lenses. 2. Tinted or photochromic filters, plus a cap or visor indoors near windows, to reduce photophobia and glare. 3. A hand-held or spectacle-mounted distance telescope, or a phone/tablet camera or electronic magnifier, to see the blackboard. 4. Seating at the front centre of the class, away from glare from windows, with the teacher giving printed copies of board notes and using high-contrast markers (black on white). 5. Near aids and adaptations: high-contrast or large-print materials, bold-lined paper, a stand or electronic magnifier if needed, good task lighting, extra time in exams, and allowing his preferred head posture (null point) for the nystagmus."),
    saq(4, T, "Define eREC and eCSC. How is the quality gap calculated?",
        [("eREC: effective refractive error coverage - proportion of people with refractive error who have adequate correction achieving good VA (e.g. 6/12) out of all who need it", 1.5), ("eCSC: effective cataract surgical coverage - proportion of people who had cataract surgery and achieved good outcome (VA 6/12) out of all needing surgery", 1.5), ("Quality gap = coverage (REC/CSC) - effective coverage (eREC/eCSC); relative quality gap = (REC - eREC)/REC x 100", 2)],
        """eREC (effective refractive error coverage) is a WHO indicator: the proportion of people with refractive error (distance, and near for presbyopia) who have received correction AND achieve good vision (e.g. 6/12 or better) with it, out of all who need correction: eREC = (met need with good outcome) / (met need + under-met need + unmet need).
eCSC (effective cataract surgical coverage) is the proportion of people who have had cataract surgery and have a good visual outcome (presenting VA 6/12 or better in the operated eye), out of all people needing or having had cataract surgery.
Quality gap: the difference between crude coverage and effective coverage - quality gap = REC - eREC (or CSC - eCSC); the relative quality gap = (REC - eREC) / REC x 100 (or (CSC - eCSC) / CSC x 100). It shows how many people received services that did not give good vision, e.g. due to poor prescriptions or surgical outcomes."""),
]
C1 = """Case I: Myopia in an 8-year-old girl
An 8-year-old girl presents with blurred distance vision and difficulty copying from the board. Her mother is -7.00 D and reports that her daughter reads a lot and spends little time outdoors.
On examination: uncorrected VA 6/18 (OU). Dry retinoscopy -2.00 DS (OU); cycloplegic refraction -1.75 DS (OU). AC/A ratio normal. Cover test: mild exophoria. Axial length 24.7 mm in both eyes. Corneal topography normal; fundoscopy shows tessellated fundus patterns.
The parents ask: "Can we stop her glasses from increasing every year?" They have heard about "blue-filter lenses" as myopia control lenses."""
C2 = """Case II: Sudden central vision loss in a 68-year-old
A 68-year-old retired school principal presents with sudden central vision loss in the right eye for 3 days - "a black spot right in the centre" with surrounding blur and mild distortion. He finds it difficult to read, recognise faces and pour tea. He has had diabetes and hypertension for over 20 years, both moderately controlled, with a recent increase in BP medication. He lives alone and is very worried.
Findings (OD / OS):
- Uncorrected distance VA: 6/60 / 6/9
- Refraction (post-cycloplegic): +0.50 / -0.25 x 180 / +1.25 DS
- Best corrected / pinhole VA: 6/60 / 6/9
- Slit lamp: anterior segment normal in both eyes
- IOP: 15 mmHg / 20 mmHg
- OCT OD: subretinal fluid; a small dome-shaped pigment epithelial detachment (PED) under the central retina; mild disruption of the outer retinal layers (photoreceptors). OS: normal.
- Fundoscopy OD: a fresh dark-red subretinal haemorrhage just below the central macula, and a grey-green area under the fovea suggesting choroidal neovascularisation (CNV). OS: normal fundus with mild RPE mottling."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("optom2025", 1, T, C1, items=[
    it("1. Based on axial length and refraction, classify the myopia. Is it physiological or pathological? Justify using refractive and structural clues.", 3,
       [("Low (-1.75 D) axial school-age (juvenile-onset) myopia", 1), ("Not pathological at present: low refraction, AL 24.7 (< 26 mm), no degenerative changes except tessellation, normal topography", 1), ("But high risk of progression: young onset, high-myopic parent, near work, little outdoor time, AL long for age", 1)],
       "This is low (-1.75 D), axial, juvenile-onset (school) myopia. It is physiological (simple) rather than pathological at present: the refraction is low, the axial length (24.7 mm) is below the pathological range (usually >26 mm or <-6 D with degenerative changes), the cornea is normal and there are no lesions such as lacquer cracks or atrophy - only mild tessellation. However, the early onset, a highly myopic mother, heavy near work, little outdoor time and an axial length long for her age mean a high risk of progression to high myopia."),
    it("2. Interpret the axial length findings. Is it concerning?", 3,
       [("24.7 mm is long for an 8-year-old (normal about 22.5-23.5) - explains myopia (axial)", 1.5), ("Concerning: above age norms/ percentile, predicts progression; needs baseline and 6-monthly monitoring, myopia control", 1.5)],
       "An axial length of 24.7 mm is long for an 8-year-old (typical about 22.5-23.5 mm), and it is the main cause of her myopia (normal corneal power). It is concerning: it lies above the expected growth curve for her age, which predicts faster progression and a higher lifetime risk of high myopia and its complications (retinal detachment, myopic maculopathy, glaucoma). It should be used as a baseline and measured every 6 months to monitor progression and the effect of myopia control."),
    it("3. Briefly describe current evidence-based interventions to slow the progression of myopia.", 10,
       [("Low-dose atropine (0.01-0.05%) - mechanism unclear, dose-dependent effect, side effects", 2), ("Orthokeratology - reshapes cornea overnight, peripheral myopic defocus, slows AL growth ~40-50%", 2), ("Myopia control spectacle lenses (DIMS, HAL) and soft multifocal/dual-focus contact lenses (MiSight) - peripheral myopic defocus", 2.5), ("Increased outdoor time (≥2 h/day) for prevention/ slowing; reduce near work, breaks", 2), ("Combination therapy and regular monitoring (AL, cycloplegic refraction 6-monthly)", 1.5)],
       "1. Low-dose atropine eye drops (0.01-0.05%) at night: reduce progression by roughly 30-60% in trials (0.05% most effective in LAMP study) with few side effects (mild photophobia, near blur). 2. Orthokeratology: rigid lenses worn overnight reshape the cornea, giving clear daytime vision and peripheral myopic defocus; slows axial elongation by about 40-50%. 3. Myopia control spectacle lenses (e.g. DIMS/defocus incorporated multiple segments, highly aspherical lenslets) - about 50% slowing - and soft dual-focus or multifocal contact lenses (e.g. MiSight), which create peripheral myopic defocus. 4. Behavioural measures: at least 2 hours a day outdoors (bright light releases retinal dopamine and delays onset), regular breaks from near work, good reading distance and lighting, and limited screen time. 5. Combination treatments (e.g. atropine with ortho-K or defocus lenses) for fast progressors, with 6-monthly monitoring of cycloplegic refraction and axial length. Under-correction and blue-filter lenses are not effective."),
    it("4. Draw a ray diagram to show the refractive status and how it can be corrected with a minus lens.", 5,
       [("Uncorrected: parallel rays from distance focus in front of retina (long eyeball), diverge to blur circle on retina", 2), ("Corrected: concave (minus) lens diverges parallel rays so they appear to come from far point and focus on retina", 2), ("Labels: lens, retina, focal point, far point", 1)],
       "Diagram 1 (uncorrected myopia): parallel rays from a distant object enter the eye, are refracted by the cornea and lens and focus at a point in front of the retina (the eyeball is too long), then diverge to form a blur circle on the retina. Diagram 2 (corrected): a concave (minus) lens placed in front of the eye diverges the parallel rays so they appear to come from the eye's far point; the eye then focuses them exactly on the retina. Label: incident rays, minus lens, cornea, crystalline lens, retina, focal point and far point."),
    it("5. What is the recommended screen time for children under 12 years?", 3,
       [("Under 2: no screen time (except video calls); 2-5 years: ≤1 hour/day (WHO/AAP)", 1.5), ("5-12: limit recreational screen time to ≤2 hours/day with breaks (20-20-20), balanced with ≥2 h outdoors", 1.5)],
       "Guidelines (WHO and paediatric associations): no recreational screen time for children under 2 (except video calls); for ages 2-5, no more than 1 hour a day of high-quality content; for school-age children (5-12), limit recreational screen time to about 2 hours a day or less, with breaks every 20-30 minutes (20-20-20 rule), good viewing distance and at least 2 hours outdoors daily."),
    it("6. Discuss prescribing strategy. Would you give full correction or under-correction? Justify.", 4,
       [("Full correction based on cycloplegic refraction (-1.75 DS), worn full time", 2), ("Justification: under-correction does not slow (may accelerate) progression; clear vision for school; consider myopia control lens design; review 6 months", 2)],
       "Prescribe full correction based on the cycloplegic refraction (-1.75 DS OU, the least minus giving best acuity), worn full time, preferably in a myopia control design (defocus spectacle lenses) or with another control method. Under-correction is not recommended: studies show it does not slow progression and may increase it, and it leaves her with blurred vision for the board. Review in 6 months with cycloplegic refraction and axial length."),
    it("7. What are 'blue-filter lenses'? Would you recommend them? Justify.", 3,
       [("Lenses with coating/ tint that filters part of blue-violet light from screens/ sunlight", 1), ("Not recommended for myopia control: no evidence they slow myopia; marketing claims; recommend proven methods instead", 2)],
       "Blue-filter lenses have a coating or tint that reduces part of the blue-violet light (about 400-450 nm) from screens and daylight. I would not recommend them for myopia control: there is no good evidence that they slow myopia progression (or prevent eye strain), and they could give false reassurance. Instead advise proven methods - myopia control spectacle or contact lenses, low-dose atropine and more outdoor time."),
    it("8. When should ortho-K be considered? What are its risks?", 4,
       [("Indications: progressing myopia (up to about -4 to -6 D, low astigmatism), motivated child and parents with good hygiene, wanting spectacle-free days, sports", 2), ("Risks: microbial keratitis (Acanthamoeba), corneal abrasion/ staining, discomfort, glare/ haloes, lens loss; need strict hygiene and follow-up", 2)],
       "Consider ortho-K for a child with progressing myopia (typically up to about -4.00 to -5.00 D with low astigmatism), normal cornea, good motivation and hygiene, and parents able to supervise lens care and attend regular follow-up; it suits active children who want to be glasses-free during the day. Risks: microbial keratitis (including Acanthamoeba from tap water), corneal staining or abrasion, discomfort, glare and haloes, variable vision if not worn regularly, and lens loss; strict hygiene, no tap water and regular aftercare reduce them."),
    it("9. What is the AC/A ratio? Briefly explain it.", 3,
       [("Definition: accommodative convergence per dioptre of accommodation (prism dioptres/D)", 1.5), ("Normal 3-5:1; measured by heterophoria (calculated) or gradient method; high causes esophoria at near, low exophoria/ convergence insufficiency; affects management", 1.5)],
       "The AC/A ratio is the amount of accommodative convergence (in prism dioptres) produced for each dioptre of accommodation. Normal is about 3-5 Δ/D. It is measured by the heterophoria (calculated) method - using the distance and near phorias and the interpupillary distance - or by the gradient method (change in near phoria with ±1.00 D lenses). A high AC/A causes more esophoria at near (e.g. convergence excess), a low one causes exophoria at near (convergence insufficiency); it helps decide whether plus adds or prisms will help."),
    it("10. You are invited to a BBS interview to talk about myopia. List important points you would make to the public.", 5,
       [("Myopia is increasing, causes, risk factors (genetics, near work, low outdoor time)", 1), ("Outdoor time ≥2 h/day, limit screen time, breaks, good lighting/ distance", 1.5), ("Regular eye checks for children (school screening), wear correct glasses", 1), ("Myopia control options available; high myopia risks (RD, glaucoma, maculopathy); avoid myths (eye exercises, blue light)", 1.5)],
       "Myopia (short-sightedness) is increasing rapidly among Bhutanese children; it is mostly caused by eyeball elongation linked to genes, long hours of near work and screens, and too little time outdoors. Prevention: at least 2 hours outdoors every day, limit recreational screen time, take breaks (20-20-20), hold books and phones at a good distance with good lighting. Get children's eyes checked every year or if they squint, hold things close or struggle with the board; school screening is available. Wear the prescribed glasses fully - they do not make eyes worse. Myopia control treatments (special lenses, low-dose atropine, ortho-K) can slow progression, so see an optometrist early. High myopia raises the risk of retinal detachment, glaucoma and blindness later, so regular check-ups matter. Avoid myths like eye exercises or blue-light lenses curing myopia."),
    it("11. Discuss the public health implications of the rising prevalence of myopia in Bhutan or South Asia, and how optometrists can support national eye health goals.", 5,
       [("Implications: more uncorrected refractive error/ visual impairment, school performance, productivity, cost, more high myopia complications/ blindness later, burden on limited services", 2.5), ("Optometrists' role: school screening, eREC/SPECS 2030, affordable spectacles, myopia control, health education, data/ research, referral pathways, training vision technicians, policy (outdoor time in schools)", 2.5)],
       "Implications: rising numbers of children with uncorrected refractive error, affecting learning and later productivity; a growing future burden of high myopia complications (retinal detachment, myopic maculopathy, glaucoma) and irreversible visual impairment; increased costs and demand on limited eye-care services and workforce, especially in rural areas. Optometrists can help by: leading school and community screening and providing affordable, quality spectacles to raise effective refractive error coverage (WHO SPECS 2030); offering myopia control and regular follow-up; educating parents, teachers and the public on outdoor time and screen habits; advocating for school policies (outdoor activity); training vision technicians and strengthening referral pathways; and collecting prevalence data for national planning."),
    it("12. Briefly describe the working principle of retinoscopy.", 2,
       [("Objective refraction: light reflected from retina (red reflex), movement of streak (with/against) observed while moving light; neutralised with lenses at working distance; correct for working distance", 2)],
       "Retinoscopy is an objective method of measuring refractive error. A streak of light is shone into the eye and the reflex from the retina is observed through the pupil while the light is moved. The reflex moves 'with' or 'against' the light depending on where the eye's far point lies relative to the examiner; lenses are added (plus for 'with', minus for 'against') until neutrality (the pupil fills with light). The working distance lens (e.g. +1.50 D at 67 cm) is then subtracted to give the refractive error."),
])
Q += case("optom2025", 2, T, C2, items=[
    it("1. Based on the history and findings, what is your provisional diagnosis? Classify the type of macular degeneration and justify it with clinical evidence.", 3,
       [("Neovascular (wet/ exudative) age-related macular degeneration, right eye", 1), ("Evidence: sudden central scotoma and distortion, age 68, CNV grey-green membrane, subretinal haemorrhage, subretinal fluid, PED on OCT; VA 6/60 not improving with pinhole", 2)],
       "Provisional diagnosis: neovascular (wet, exudative) age-related macular degeneration in the right eye, with early/dry AMD changes (RPE mottling) in the left. Evidence: age 68; sudden central scotoma with metamorphopsia; VA 6/60 not improved by pinhole or refraction (not refractive); OCT shows subretinal fluid, a pigment epithelial detachment and outer retinal disruption; fundus shows a grey-green choroidal neovascular membrane under the fovea with fresh subretinal haemorrhage. Dry AMD would cause gradual loss without fluid or haemorrhage."),
    it("2. Outline a referral protocol for this patient. Which specialist is involved and what additional diagnostics may be needed?", 5,
       [("Urgent referral (within days) to ophthalmologist/ retina specialist with referral letter (history, VA, findings, OCT images)", 2), ("Additional diagnostics: fluorescein angiography, OCT angiography, ICG angiography, Amsler grid, colour fundus photography; check BP/ blood sugar", 2), ("Communicate with patient, follow-up arranged, coordinate with physician for diabetes/ hypertension", 1)],
       "Refer urgently (same week, ideally within 1-2 weeks at most) to an ophthalmologist, preferably a medical retina specialist (e.g. at JDWNRH), because early anti-VEGF treatment preserves vision. Send a referral letter with history, VA, refraction, IOP, fundus and OCT findings and images. Additional diagnostics: fluorescein angiography and/or OCT angiography to confirm and classify the CNV, indocyanine green angiography if polypoidal choroidal vasculopathy is suspected, colour fundus photography, Amsler grid, and checks of blood pressure and blood sugar with his physician. Explain the urgency to the patient, help arrange transport/support since he lives alone, and book follow-up."),
    it("3. Briefly describe low vision aids suitable for his functional limitations (reading, pouring liquids, watching TV). Include optical and non-optical devices.", 5,
       [("Optical: hand-held/ stand illuminated magnifiers, high plus reading spectacles, telescopes for TV/ faces, electronic magnifiers (CCTV)", 2.5), ("Non-optical: good lighting, large print, high contrast items (dark cup), liquid level indicator, sitting closer to TV, talking devices, eccentric viewing training", 2.5)],
       "Optical: illuminated hand-held or stand magnifiers and high-plus reading spectacles for reading; a hand-held or spectacle-mounted telescope for TV and recognising faces; an electronic video magnifier (CCTV) or tablet with zoom for reading. Non-optical: good task lighting; large-print materials, books and phone; high-contrast items (e.g. a white cup on a dark tray, coloured tape on step edges); a liquid-level indicator or finger technique for pouring tea; sitting closer to the TV; talking watch, audiobooks and voice assistants; and training in eccentric viewing to use the healthy retina around the scotoma (the left eye currently carries most tasks)."),
    it("4. What is the role of an optometrist in early detection and co-management of AMD in ageing populations? Include education, surveillance and rehabilitation.", 5,
       [("Early detection: routine eye exams for older adults, fundus/ OCT, Amsler, identify drusen/ risk", 1.5), ("Education: risk factors (smoking, diet, UV), symptoms needing urgent attention, supplements (AREDS2) for intermediate AMD", 1.5), ("Surveillance/co-management: monitoring, prompt referral, follow-up between injections", 1), ("Rehabilitation: low vision services, aids, counselling, referral to support", 1)],
       "Early detection: regular eye examinations for people over 50 with dilated fundus examination or imaging (OCT), Amsler grid testing, identifying drusen and pigment changes and assessing risk. Education: explain risk factors (age, smoking, family history, diet, cardiovascular disease), advise stopping smoking, a diet rich in green leafy vegetables and fish, UV protection, AREDS2 supplements for intermediate AMD, and teach patients to use the Amsler grid and report sudden distortion or blur urgently. Surveillance and co-management: monitor dry AMD, refer wet AMD promptly, share care with ophthalmologists (checking VA/OCT between anti-VEGF injections). Rehabilitation: low vision assessment, magnifiers and lighting, training, counselling for anxiety/depression, and referral to social support."),
    it("5. List all the layers of the retina. What is the function of photoreceptors?", 7,
       [("Ten layers in order (outer to inner): RPE, photoreceptor layer (rods/cones), external limiting membrane, outer nuclear, outer plexiform, inner nuclear, inner plexiform, ganglion cell, nerve fibre layer, internal limiting membrane", 5), ("Photoreceptors: rods (dim light, scotopic, periphery) and cones (colour, fine detail, photopic, fovea) convert light into electrical signals (phototransduction)", 2)],
       "Layers from outer (choroid side) to inner (vitreous side): 1. retinal pigment epithelium; 2. photoreceptor layer (rod and cone outer and inner segments); 3. external limiting membrane; 4. outer nuclear layer; 5. outer plexiform layer; 6. inner nuclear layer; 7. inner plexiform layer; 8. ganglion cell layer; 9. nerve fibre layer; 10. internal limiting membrane. Photoreceptors convert light into electrical signals by phototransduction (light changes visual pigments such as rhodopsin, altering membrane potential). Rods work in dim light (scotopic, night and peripheral vision, motion); cones work in bright light, give colour vision and fine detail and are concentrated at the fovea."),
    it("6. List three causes of sudden loss of vision. Briefly describe one of them.", 5,
       [("Three causes: retinal detachment, central retinal artery/ vein occlusion, vitreous haemorrhage, wet AMD, acute angle-closure glaucoma, optic neuritis, ischaemic optic neuropathy, stroke", 2), ("One described: cause/ mechanism, symptoms, signs, urgency/ management", 3)],
       "Causes: central retinal artery occlusion, central retinal vein occlusion, retinal detachment, vitreous haemorrhage (e.g. proliferative diabetic retinopathy), wet AMD, acute angle-closure glaucoma, optic neuritis, anterior ischaemic optic neuropathy (including giant cell arteritis). Example - central retinal artery occlusion: an embolus (often from carotid plaque) or thrombus blocks the central retinal artery; the patient has sudden, painless, profound loss of vision in one eye; there is a relative afferent pupillary defect, a pale swollen retina with a 'cherry-red spot' at the fovea and narrowed arterioles. It is an emergency (eye stroke) needing immediate referral, and workup for stroke risk (carotids, heart, giant cell arteritis in older patients)."),
    it("7. What is anti-VEGF? Name one commonly used anti-VEGF.", 3,
       [("Drugs blocking vascular endothelial growth factor, which drives abnormal new vessel growth and leakage; given by intravitreal injection, stops CNV growth, reduces fluid", 2), ("Examples: ranibizumab, aflibercept, bevacizumab, faricimab", 1)],
       "Anti-VEGF agents are drugs that block vascular endothelial growth factor, the protein that stimulates abnormal new blood vessel growth and leakage (e.g. CNV in wet AMD, diabetic macular oedema). Given as repeated intravitreal injections, they stop new vessel growth and reduce fluid and bleeding, stabilising or improving vision. Examples: ranibizumab (Lucentis), aflibercept (Eylea), bevacizumab (Avastin) or faricimab."),
    it("8. Draw a ray diagram to show the type of refractive error in the left eye.", 3,
       [("Left eye +1.25 DS = hyperopia: parallel rays focus behind the retina (short eye), blur circle on retina", 2), ("Correction with convex (plus) lens converging rays onto retina; labels", 1)],
       "The left eye has hyperopia (+1.25 DS). Diagram: parallel rays from a distant object are refracted by the cornea and lens but come to a focus behind the retina (eyeball too short or too little refractive power), so a blur circle falls on the retina (accommodation may compensate). Correction: a convex (plus) lens in front of the eye converges the rays so they focus on the retina. Label rays, lens, retina and focal point."),
    it("9. What are the different parts of a slit lamp? Name two accessories that are or can be attached to a slit lamp.", 4,
       [("Parts: illumination system (lamp, slit width/height controls, filters), observation system (binocular microscope, magnification changer), mechanical system (joystick, base, chin rest/ forehead rest, coaxial mounting)", 2), ("Two accessories: Goldmann applanation tonometer, 90D/78D lens, gonioscopy lens, camera, Hruby lens, pachymeter, Hertel", 2)],
       "Parts: (a) illumination system - light source, condenser, slit width and height controls, filters (cobalt blue, red-free, diffuser), mirror/prism; (b) observation system - binocular stereomicroscope with eyepieces and a magnification changer; (c) mechanical system - joystick and base for movement and focusing, chin rest and forehead rest, fixation target and the common pivot that keeps illumination and microscope coupled. Accessories: Goldmann applanation tonometer; non-contact fundus lenses (90D/78D) and gonioscopy or three-mirror lenses; also a camera, Hruby lens or pachymeter attachment."),
    it("10. What is IOP? What is your observation on this patient's IOP?", 3,
       [("IOP: pressure of aqueous humour inside the eye, balance of production and outflow; normal 10-21 mmHg", 1.5), ("Observation: OD 15, OS 20 - both within normal limits, but asymmetry 5 mmHg and OS at upper normal - monitor, check optic disc/ CCT, glaucoma risk", 1.5)],
       "Intraocular pressure is the fluid pressure inside the eye, set by the balance between aqueous humour production (ciliary body) and outflow (trabecular meshwork and uveoscleral routes); normal is about 10-21 mmHg. Observation: OD 15 mmHg and OS 20 mmHg are both within the normal range, but the left is at the upper end and there is a 5 mmHg asymmetry, so the optic discs, central corneal thickness and visual fields should be checked and IOP monitored for glaucoma risk."),
    it("11. The patient asks: 'Will I go blind in the other eye?' How would you counsel him empathetically about prognosis, monitoring and lifestyle?", 4,
       [("Empathy: acknowledge fear, listen, honest reassurance - AMD rarely causes total blindness (peripheral vision kept)", 1), ("Prognosis: risk of fellow eye developing wet AMD (moderate), early treatment works", 1), ("Monitoring: daily Amsler grid self-check of left eye, regular reviews, urgent attention to new symptoms", 1), ("Lifestyle: stop smoking, diet, supplements, control BP/ sugar, UV protection, support since lives alone", 1)],
       "Acknowledge his fear, sit with him and listen. Explain honestly but reassuringly that AMD affects central vision and does not cause total darkness - side vision usually remains, so he will be able to move around independently. His left eye has early changes and has a higher risk of developing the same problem, but with early detection modern injections can protect vision. Teach daily Amsler grid checks of the left eye and ask him to come urgently if lines become wavy or a dark spot appears; arrange regular reviews. Advise not smoking, a diet rich in leafy greens and fish, AREDS2 supplements if advised, good control of blood pressure and sugar, and sun protection. Offer low vision help and involve family or community support since he lives alone."),
    it("12. What eye health message would you give the public about diabetes and hypertension?", 3,
       [("Both can damage the eyes silently (retinopathy, vein occlusion, etc.) and cause blindness", 1), ("Annual dilated eye examination even without symptoms", 1), ("Control sugar, BP, cholesterol, take medicine, healthy lifestyle; seek care for sudden vision change", 1)],
       "Diabetes and high blood pressure can silently damage the blood vessels of the eye (diabetic and hypertensive retinopathy, vein occlusions, macular swelling) and can lead to permanent blindness, often without early symptoms. Everyone with diabetes or hypertension should have a dilated eye examination at least once a year, even if vision seems fine. Keep blood sugar, blood pressure and cholesterol under control, take medicines regularly, eat healthily, exercise, avoid smoking and alcohol, and see an eye-care professional immediately if vision suddenly changes."),
])
PATTERN = STANDARD
