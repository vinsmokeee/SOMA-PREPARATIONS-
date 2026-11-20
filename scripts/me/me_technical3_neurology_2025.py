"""ME Technical Paper III (Subject Specialisation Paper), Neurology, BCSE 2025 - real paper (PDF sent by the founder).
Own pattern from the paper: Part I 30 MCQ; Part II 4 short answers x 5 (five 1-mark parts each); Section B two compulsory
questions of 25 marks (no choice). Replaced MCQs with more than one defensible answer: 1 (mannitol vs hemicraniectomy),
6 (osmotic demyelination vs CLIPPERS), 10 (ALS gene), 12 (decrement with negative edrophonium), 13 (AQP4 vs MOG with
neutrophils) and 21 (RBD statements).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Neurology): BCSE 2025, batch 1"
GROUP_TAG = "neuro2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "neurology"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Neurology"

MCQ = r"""[
{
"n": 1,
"stem": "A 72-year-old man is admitted to the ICU with a dense left hemiparesis and neglect from a large right MCA infarct. On day 3, his level of consciousness declines rapidly. His pupils become unequal (right > left) and he develops extensor posturing. A stat CT head shows significant mass effect with subfalcine and uncal herniation. What is the most urgent intervention?",
"opts": [
"Intravenous mannitol and hypertonic saline",
"Emergent decompressive hemicraniectomy",
"Increase ventilator settings to hyperventilate to a PaCO2 of 25-30 mmHg",
"Insertion of an external ventricular drain (EVD)"
]
},
{
"n": 2,
"stem": "A 22-year-old boxer is hit with a powerful hook to the head. He remains standing but appears momentarily dazed and confused, though he does not lose consciousness. Minutes later, he develops a severe headache, nausea, and then a rapidly declining level of consciousness. What is the most likely neuropathology?",
"opts": [
"Acute subdural hematoma",
"Diffuse axonal injury",
"Epidural hematoma",
"Cerebral contusion"
]
},
{
"n": 3,
"stem": "A 64-year-old male with HIV (CD4 80), on no ART, presents with subacute headache, cranial nerve VI palsy, and low-grade fever for 2 weeks. CSF shows: • WBC 150 (lymphocytic predominance) • Protein 120 mg/dL • Glucose 30 mg/dL (serum glucose 90) • India ink stain positive. MRI reveals basilar meningeal enhancement and multiple small infarcts. What is the most likely causative organism?",
"opts": [
"Cryptococcus neoformans",
"Mycobacterium tuberculosis",
"Treponema pallidum",
"Listeria monocytogenes"
]
},
{
"n": 4,
"stem": "A 35-year-old woman presents with recurrent episodes of encephalopathy, psychosis, and seizures. MRI shows T2 hyperintensities in the medial temporal lobes. Serum anti-NMDA receptor antibodies are positive. What is the most likely underlying tumor?",
"opts": [
"Ovarian teratoma",
"Small cell lung cancer",
"Thymoma",
"Hodgkin’s lymphoma"
]
},
{
"n": 5,
"stem": "A 25-year-old man presents with acute psychosis, catatonia, and orofacial dyskinesias. MRI shows bilateral basal ganglia necrosis. Serum ceruloplasmin is low. What is the most likely copper metabolism defect?",
"opts": [
"Impaired copper incorporation into apoceruloplasmin",
"Defective ATP7A-mediated copper transport",
"Mutation in COMMD1 (Bedlington terrier mutation)",
"Zinc-induced metallothionein sequestration"
]
},
{
"n": 6,
"stem": "A 48-year-old woman presents with subacute onset of diplopia, dysarthria, and gait instability. Examination reveals bilateral horizontal gaze palsy, facial diplegia, and ataxia. MRI brain shows hyperintensity in the dorsal pons (central pontine myelinolysis pattern), but serum sodium was never deranged. CSF shows elevated protein without pleocytosis. What is the most likely diagnosis?",
"opts": [
"Wernicke’s encephalopathy",
"Osmotic demyelination syndrome",
"Pontine autosomal dominant microangiopathy with leukoencephalopathy",
"CLIPPERS (Chronic Lymphocytic Inflammation with Pontine Perivascular Enhancement Responsive to Steroids)"
]
},
{
"n": 7,
"stem": "25-year-old woman presents with acute-onset quadriplegia, areflexia, and respiratory failure. CSF shows albumin-cytologic dissociation. Nerve conduction studies reveal absent sensory responses and prolonged distal motor latencies. What is the most likely diagnosis?",
"opts": [
"Classic Guillain-Barré syndrome (AIDP)",
"Acute motor axonal neuropathy (AMAN)",
"Bickerstaff brainstem encephalitis",
"Acute Motor-Sensory Axonal Neuropathy (AMSAN)"
]
},
{
"n": 8,
"stem": "A 55-year-old man presents with progressive bulbar palsy, fasciculations, and respiratory failure. EMG shows chronic neurogenic changes. Genetic testing reveals a hexanucleotide repeat expansion in C9ORF72. Which histopathological finding is most expected on autopsy?",
"opts": [
"TDP-43 inclusions",
"Tau-positive neurofibrillary tangles",
"Lewy bodies",
"Amyloid plaques"
]
},
{
"n": 9,
"stem": "A 30-year-old woman presents with bilateral ptosis, ophthalmoplegia, and fatigable weakness. Repetitive nerve stimulation shows decrement. However, anti-AChR/MuSK antibodies are negative. What is the next best diagnostic test?",
"opts": [
"Anti-LRP4 antibodies",
"Anti-VGCC antibodies",
"Anti-GAD65 antibodies",
"Anti-GQ1b antibodies"
]
},
{
"n": 10,
"stem": "A 65-year-old man presents with progressive dysphagia, dysarthria, and tongue atrophy. EMG shows fibrillations and fasciculations in the tongue. MRI brain reveals bilateral T2 hyperintensities in the corticospinal tracts. What is the most likely genetic mutation?",
"opts": [
"SOD1",
"C9ORF72",
"FUS",
"TARDBP"
]
},
{
"n": 11,
"stem": "A 6-year-old with VP shunt for congenital hydrocephalus develops fever, shunt malfunction, and abdominal pain. CSF from shunt tap grows coagulase negative Staphylococcus (methicillin- resistant, biofilm producer).What is the most definitive management?",
"opts": [
"Vancomycin + rifampin for 14 days",
"Shunt removal + EVD placement + IV vancomycin",
"Intra-shunt vancomycin flushes + oral linezolid",
"Shunt externalization + intraventricular daptomycin"
]
},
{
"n": 12,
"stem": "A 60-year-old man presents with progressive dysphagia, ptosis, and fatigable weakness. EMG shows decrement on RNS. However, edrophonium test is negative. What is the most likely diagnosis?",
"opts": [
"Lambert-Eaton myasthenic syndrome (LEMS)",
"Congenital myasthenic syndrome",
"Botulism",
"Mitochondrial myopathy"
]
},
{
"n": 13,
"stem": "A 30-year-old man with HLA-B27+ ankylosing spondylitis develops acute bilateral optic neuritis and longitudinally extensive transverse myelitis (LETM). CSF shows neutrophilic pleocytosis. What is the most likely antibody?",
"opts": [
"Anti-AQP4",
"Anti-MOG",
"Anti-GFAP",
"Anti-NF155"
]
},
{
"n": 14,
"stem": "A 50-year-old man with smoldering multiple myeloma develops progressive polyneuropathy, organomegaly, and endocrinopathy. Serum VEGF is elevated. Nerve biopsy shows microvascular endothelial hyperplasia. What is the most likely diagnosis?",
"opts": [
"POEMS syndrome",
"AL amyloidosis",
"CIDP associated with paraproteinemia",
"Light chain deposition disease"
]
},
{
"n": 15,
"stem": "A 35-year-old woman with SLE develops refractory status epilepticus. MRI shows bilateral mesial temporal lobe T2 hyperintensities. CSF reveals lymphocytic pleocytosis and anti-NMDA receptor antibodies. What is the most appropriate treatment?",
"opts": [
"High-dose steroids + IVIg",
"Rituximab + cyclophosphamide",
"Plasmapheresis + anakinra",
"Tocilizumab + bortezomib"
]
},
{
"n": 16,
"stem": "A 50-year-old man presents with subacute dementia, myoclonus, and cortical blindness. EEG shows periodic sharp waves. CSF neurofilament light chain (NfL) is markedly elevated. What is the most likely diagnosis?",
"opts": [
"Sporadic CJD",
"Limbic encephalitis",
"Paraneoplastic encephalomyelitis",
"Primary CNS lymphoma"
]
},
{
"n": 17,
"stem": "A 45-year-old man with chronic alcoholism develops ophthalmoplegia, ataxia, and confusion. MRI shows bilateral medial thalamic and periaqueductal gray matter hyperintensities. Thiamine supplementation leads to partial improvement. What is the most likely underlying biochemical defect?",
"opts": [
"Impaired thiamine pyrophosphokinase (TPK) activity",
"Defective transketolase enzyme binding affinity",
"Mitochondrial pyruvate carrier (MPC) dysfunction",
"Glucose transporter 1 (GLUT1) deficiency"
]
},
{
"n": 18,
"stem": "A 54 years old chronic alcoholic man from Samtse presented with acute onset mental state change and double vision. Physical examination revealed disorientation to time place and person, decreased attention span and memory loss. Neurological examination revealed horizontal nystagmus and ataxia. Which of the following neurological findings is most likely to persist despite Thiamine replacement?",
"opts": [
"Ataxia",
"Memory loss",
"Ophthalmopathy",
"Disorientation"
]
},
{
"n": 19,
"stem": "A 55-year-old renal transplant recipient on long-term tacrolimus and prednisone presents with subacute cognitive decline, multifocal neurological deficits, and ring-enhancing periventricular lesions on MRI showing partial regression after high-dose dexamethasone. Immunohistochemistry reveals a CD20+ neoplasm with prominent angiocentric growth patterns.Given the tumor's predilection for immunocompromised hosts, periventricular tropism, and steroid-responsive biology, which of the following is the most likely diagnosis?",
"opts": [
"Ependymoma (WHO Grade II/III)",
"Medulloblastoma (WHO Grade IV)",
"Primary CNS Lymphoma (Diffuse Large B-Cell Type)",
"Glioblastoma (IDH-wildtype)"
]
},
{
"n": 20,
"stem": "All of the following regarding CJD are true except?",
"opts": [
"It is a neuro degenerative disease",
"It is caused by infectious prions",
"Myoclonus is rarely seen",
"Brain biopsy is specific for diagnosis."
]
},
{
"n": 21,
"stem": "A 68-year-old woman with Parkinson's disease presents with new-onset dream-enactment behavior, including yelling and thrashing at night. Her motor symptoms are controlled. What is the most accurate statement regarding the cause of this symptom?",
"opts": [
"It is an adverse effect of high-dose dopaminergic therapy and will resolve if the levodopa dose is reduced.",
"It is a precursor to the development of Parkinson's disease dementia and should be treated with an acetylcholinesterase inhibitor.",
"It is a core feature of a synucleinopathy and predicts a more rapid overall disease progression.",
"It is caused by the degeneration of the pedunculopontine nucleus and is best treated with clonazepam."
]
},
{
"n": 22,
"stem": "Distant systemic cancer most likely would produce which of the following neurologic syndrome?",
"opts": [
"Myasthenia gravis",
"Generalised neuropathy",
"Non-inflammatory myopathy",
"Cranial nerve palsies"
]
},
{
"n": 23,
"stem": "Cataracts, frontal baldness, testicular atrophy and muscle weakness and wasting occur in association with which condition?",
"opts": [
"Myotonia congenital",
"Fascioscapulohumeral dystrophy",
"Pseudohypertrophic dystrophy",
"Myotonic dystrophy"
]
},
{
"n": 24,
"stem": "A man has dyslexia without dysgraphia. Auditory comprehension is only slightly impaired. This man’s symptoms most likely are due to a lesion or lesions in",
"opts": [
"The left parietooccipital region",
"The left temporal lobe, near Wernicke’s area",
"The left frontal lobe, posterior to Broca’s area",
"Both temporal lobes"
]
},
{
"n": 25,
"stem": "A 60-year-old mildly obese lady complains of a very bothersome burning pain on the anterolateral aspect of the right thigh from the groin almost as far distally as the knee. Examination shows reduction of sensation to touch and pin prick in the affected area. There is no loss of muscle strength and reflexes are normal. What is the most likely doiagnosis?",
"opts": [
"Prolapsed intervertebral disc",
"Disruption of lumbosacral plexus",
"Compression of the lateral femoral cutaneous nerve",
"Nutritional neuropathy"
]
},
{
"n": 26,
"stem": "A 30-year-old man with a history of Hodgkin's lymphoma presents with acute confusion and focal seizures. MRI shows numerous punctate foci of diffusion restriction throughout the cerebral hemispheres. MRA of the intracranial vessels is normal. CSF is significant for 45 white blood cells/µL (predominantly lymphocytes) and elevated IgG index. What is the most likely underlying pathophysiology?",
"opts": [
"Direct neoplastic infiltration of the meninges",
"Paraneoplastic angiitis of the CNS",
"Chemotherapy-induced neurotoxicity",
"Progressive multifocal leukoencephalopathy (PML)"
]
},
{
"n": 27,
"stem": "A 45-year-old man with chronic alcohol use disorder is brought in with generalized tonic-clonic seizures. His initial labs show a serum magnesium level of 0.9 mg/dL (severely low) and a calcium level of 6.8 mg/dL (low). Despite receiving IV calcium gluconate, his seizures persist. Which electrolyte replacement is most critical to stop his seizures?",
"opts": [
"Intravenous potassium chloride",
"Intravenous magnesium sulphate",
"Vitamin D supplementation",
"Intravenous hypertonic sodium chloride"
]
},
{
"n": 28,
"stem": "A 12-year-old boy is brought for evaluation of worsening handwriting and a tendency to drop things with his right hand. On examination, he has a slow, twisting posture of his right arm that increases when he walks and disappears completely when he is asleep. His neurological exam is otherwise normal, including sensation. What is the most likely diagnosis?",
"opts": [
"Tardive dyskinesia",
"Juvenile Parkinson's disease",
"Focal dystonia",
"Conversion disorder"
]
},
{
"n": 29,
"stem": "A 28-year-old woman presents with a 6-month history of a continuous, unilateral, boring headache located behind her right eye. The pain is associated with ipsilateral conjunctival injection, lacrimation, and nasal congestion. Each attack lasts 45 minutes and occurs like clockwork at 2:00 AM, waking her from sleep. What is the most appropriate acute treatment?",
"opts": [
"Oral sumatriptan",
"High-flow inhaled oxygen",
"Oral naproxen sodium",
"Paracetamol, caffeine and Ergotamine containing analgeic"
]
},
{
"n": 30,
"stem": "A 45-year-old teacher describes brief episodes of vertigo (< 1 minute) that occur exclusively when she rolls over in bed to her left side or looks up to write on a whiteboard. The Dix-Hallpike test performed with her head turned to the left reproduces her symptoms with upbeat-torsional nystagmus. What is the first-line management?",
"opts": [
"Prescription of Betahistine/ Cinnarizine for symptomatic relief",
"A course of high-dose oral corticosteroids",
"The Epley maneuver",
"MRI brain with contrast to rule out a cerebellopontine angle tumor"
]
}
]"""

KEY = {
    2: ("c", "Brief confusion, lucid interval, then rapid decline = epidural haematoma (middle meningeal artery)."), 3: ("a", "India ink positive in advanced HIV = Cryptococcus neoformans."),
    4: ("a", "Anti-NMDA receptor encephalitis in young women is associated with ovarian teratoma."), 5: ("a", "Wilson disease (ATP7B): copper is not incorporated into apoceruloplasmin or excreted in bile."),
    7: ("a", "Prolonged distal motor latencies (demyelination) with absent sensory responses = AIDP."), 8: ("a", "C9ORF72 ALS/FTD shows TDP-43 inclusions."),
    9: ("a", "In seronegative myasthenia, test anti-LRP4 antibodies next."), 11: ("b", "Infected shunts with biofilm need removal, external drainage and IV vancomycin."),
    14: ("a", "Polyneuropathy, organomegaly, endocrinopathy, M-protein, high VEGF = POEMS syndrome."), 15: ("a", "First-line for anti-NMDA receptor encephalitis: high-dose steroids with IVIg (or plasma exchange)."),
    16: ("a", "Rapid dementia, myoclonus, cortical blindness (Heidenhain), periodic sharp waves = sporadic CJD."), 17: ("b", "A transketolase variant with reduced thiamine affinity predisposes to Wernicke-Korsakoff."),
    18: ("b", "Memory loss (Korsakoff amnesia) often persists despite thiamine; eye signs recover first."), 19: ("c", "Periventricular, steroid-responsive CD20+ tumour in an immunosuppressed host = primary CNS lymphoma."),
    20: ("c", "False: myoclonus is very common in CJD."), 22: ("b", "Peripheral neuropathy is the commonest remote (paraneoplastic) neurological effect of systemic cancer."),
    23: ("d", "Cataracts, frontal baldness, testicular atrophy and distal wasting = myotonic dystrophy."), 24: ("a", "Alexia without agraphia: left occipital (parieto-occipital) lesion with splenium involvement."),
    25: ("c", "Meralgia paraesthetica: compression of the lateral femoral cutaneous nerve."), 26: ("b", "Hodgkin's lymphoma with multifocal small infarcts and inflammatory CSF suggests paraneoplastic CNS angiitis."),
    27: ("b", "Hypocalcaemia will not correct until severe hypomagnesaemia is treated with IV magnesium."), 28: ("c", "Action-induced twisting posture that disappears in sleep = focal (writer's) dystonia."),
    29: ("b", "High-flow oxygen is first-line acute treatment for cluster headache."), 30: ("c", "Left posterior canal BPPV is treated with the Epley manoeuvre."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "In a patient with clinical signs of transtentorial herniation from cerebral oedema, which immediate medical measure lowers intracranial pressure fastest while definitive treatment is arranged?", ["Oral acetazolamide", "IV mannitol or hypertonic saline", "IV dexamethasone", "Lumbar puncture"], "b",
            "Osmotherapy (mannitol/hypertonic saline) rapidly reduces ICP; steroids do not help ischaemic oedema and LP can worsen herniation."),
    new_mcq(2, T, "Osmotic demyelination syndrome most classically follows", ["Too rapid correction of chronic hyponatraemia", "Slow correction of hypernatraemia", "Hypokalaemia", "Hypercalcaemia"], "a",
            "Rapid correction of chronic hyponatraemia causes central pontine and extrapontine myelinolysis."),
    new_mcq(3, T, "Which finding is most typical of amyotrophic lateral sclerosis?", ["A mix of upper and lower motor neuron signs with no sensory loss", "Sensory level on the trunk", "Ptosis and fatigable diplopia", "Areflexia with albuminocytological dissociation"], "a",
            "ALS combines UMN and LMN signs with preserved sensation."),
    new_mcq(4, T, "In Lambert-Eaton myasthenic syndrome, repetitive nerve stimulation characteristically shows", ["Decrement at low rates that worsens at high rates", "Marked increment after exercise or high-frequency stimulation", "Normal responses", "Myotonic discharges"], "b",
            "LEMS: low CMAP amplitudes with >100% increment after exercise or high-frequency stimulation (presynaptic VGCC antibodies)."),
    new_mcq(5, T, "Which antibody is the key diagnostic marker of neuromyelitis optica spectrum disorder?", ["Anti-aquaporin-4 IgG", "Anti-acetylcholine receptor", "Anti-GM1", "Anti-Hu"], "a",
            "AQP4-IgG targets astrocyte water channels and defines NMOSD."),
    new_mcq(6, T, "REM sleep behaviour disorder is most strongly associated with which group of diseases?", ["Synucleinopathies (Parkinson's disease, dementia with Lewy bodies, MSA)", "Tauopathies such as progressive supranuclear palsy only", "Prion diseases", "Muscular dystrophies"], "a",
            "RBD often precedes or accompanies alpha-synucleinopathies; it is treated with melatonin or clonazepam."),
    saq(1, T, """a) Name the two core neurological components required for normal consciousness. (1 mark)
b) Which ascending subcortical network is primarily responsible for arousal? (1 mark)
c) Which widespread cortical network is primarily responsible for awareness? (1 mark)
d) A lesion in which specific brainstem region is most classically associated with coma? (1 mark)
e) What key clinical feature distinguishes a persistent vegetative state from a minimally conscious state? (1 mark)""",
        [("a) Arousal (wakefulness) and awareness (content)", 1), ("b) Ascending reticular activating system", 1), ("c) Bilateral cerebral cortex - frontoparietal (association) network", 1), ("d) Rostral brainstem (paramedian upper pons/midbrain tegmentum) reticular formation", 1), ("e) MCS shows reproducible though inconsistent signs of awareness (command following, visual pursuit); PVS none", 1)],
        """a) Arousal (wakefulness) and awareness (the content of consciousness).
b) The ascending reticular activating system (brainstem reticular formation projecting via thalamus and hypothalamus to the cortex).
c) The bilateral cerebral cortex, especially the frontoparietal association network (with thalamocortical connections).
d) The paramedian tegmentum of the upper pons and midbrain (rostral brainstem reticular formation).
e) In a minimally conscious state there are definite, reproducible (though inconsistent) signs of awareness - e.g. following simple commands, visual pursuit or purposeful responses; in a persistent vegetative state there is wakefulness without any sign of awareness."""),
    saq(2, T, """a) What is the term for diabetic autonomic neuropathy of the gastrointestinal tract causing delayed gastric emptying? (1 mark)
b) Name one specific test of cardiovascular autonomic reflex function. (1 mark)
c) What sweating abnormality is a common feature of diabetic autonomic neuropathy? (1 mark)
d) What urological complication commonly arises from autonomic neuropathy? (1 mark)
e) Why is hypoglycaemia unawareness a dangerous consequence of autonomic neuropathy? (1 mark)""",
        [("a) Diabetic gastroparesis", 1), ("b) Heart rate variability to deep breathing / Valsalva ratio / postural BP (orthostatic) / 30:15 ratio", 1), ("c) Distal anhidrosis with compensatory truncal hyperhidrosis or gustatory sweating", 1), ("d) Neurogenic (atonic) bladder - retention, overflow incontinence, UTIs (also erectile dysfunction)", 1), ("e) Loss of adrenergic warning symptoms (sweating, tremor, palpitations) so severe hypoglycaemia, seizures, coma, death can occur without warning", 1)],
        """a) Diabetic gastroparesis.
b) Heart rate variation with deep breathing (or Valsalva ratio, heart rate response to standing (30:15 ratio), or postural blood pressure fall).
c) Distal anhidrosis (loss of sweating in the feet and legs) with compensatory hyperhidrosis of the trunk, or gustatory sweating.
d) Neurogenic (atonic) bladder - incomplete emptying, urinary retention, overflow incontinence and recurrent UTIs.
e) Because the sympathetic warning symptoms (sweating, tremor, palpitations, hunger) are lost, glucose can fall to dangerous levels without the patient noticing, leading to confusion, seizures, coma or death."""),
    saq(3, T, """In Duchenne muscular dystrophy (DMD):
a) What is the pattern of inheritance? (1 mark)
b) Which specific protein is absent from the sarcolemma? (1 mark)
c) What is a classic early clinical sign on examination? (1 mark)
d) What is the pathological significance of a markedly raised serum creatine kinase (CK)? (1 mark)
e) Name one common and serious cardiac manifestation of DMD. (1 mark)""",
        [("a) X-linked recessive", 1), ("b) Dystrophin", 1), ("c) Gowers' sign (or calf pseudohypertrophy, waddling gait)", 1), ("d) Ongoing muscle fibre membrane damage and necrosis leaking CK; raised from birth before symptoms", 1), ("e) Dilated cardiomyopathy (and arrhythmias/ heart failure)", 1)],
        """a) X-linked recessive (affects boys; one-third new mutations).
b) Dystrophin.
c) Gowers' sign (using the hands to climb up the legs when rising from the floor); also calf pseudohypertrophy and a waddling gait.
d) It shows ongoing damage and necrosis of muscle fibres - without dystrophin the sarcolemma is fragile and leaks CK into the blood; CK is very high (10-100 times normal) from birth, before weakness appears.
e) Dilated cardiomyopathy (with heart failure and arrhythmias)."""),
    saq(4, T, """A 72-year-old man presents to the Emergency Department with acute vertigo and gait instability. MRI confirms an acute ischaemic stroke in the superior cerebellar artery (SCA) territory.
a) His examination shows a striking intention tremor in his left arm on finger-nose testing. Which deep cerebellar nucleus, typically infarcted in SCA strokes, is mainly responsible for this tremor? (1 mark)
b) He also shows profound dysdiadochokinesia. Describe the neuroanatomical pathway (including the specific cerebellar peduncle) that is disrupted. (1 mark)
c) The ocular examination shows ipsilesional gaze-evoked nystagmus. Explain the failure of the neural integrator (a cerebellar function) that causes it. (1 mark)
d) Despite the vertigo, his gait is only mildly wide-based. Contrast this with the expected gait disturbance if the stroke were in the anterior inferior cerebellar artery (AICA) territory, and give the reason. (1 mark)
e) Motor deficits are expected on the ipsilateral side. What pathological development, often with large cerebellar strokes, could later cause contralateral motor deficits, and why? (1 mark)""",
        [("a) Dentate nucleus", 1), ("b) Dentato-rubro-thalamo-cortical pathway via superior cerebellar peduncle, decussating to contralateral red nucleus/ VL thalamus/ motor cortex", 1), ("c) Flocculus/ paraflocculus (with brainstem integrators) fails to hold eccentric gaze; eyes drift back to centre with corrective saccades towards target", 1), ("d) AICA affects flocculonodular/ vestibular nuclei and middle cerebellar peduncle, labyrinth: severe truncal/ gait ataxia, vertigo, hearing loss; SCA mainly affects superior hemisphere/ dentate - limb ataxia more than gait", 1), ("e) Cerebellar oedema causing mass effect: brainstem compression of corticospinal tracts (above decussation) and/or obstructive hydrocephalus - contralateral deficits; needs decompression", 1)],
        """a) The dentate nucleus.
b) The dentato-rubro-thalamo-cortical pathway: fibres from the dentate nucleus leave through the superior cerebellar peduncle, cross in the midbrain to the contralateral red nucleus and ventrolateral thalamus, then project to the motor cortex, which controls the limb on the side of the cerebellar lesion (via the crossing corticospinal tract). Its disruption prevents smooth alternating movements.
c) The cerebellum (flocculus/paraflocculus) normally tunes the brainstem neural integrator that converts velocity commands into a sustained position signal to hold the eyes in eccentric gaze. When it fails ('leaky integrator'), the eyes drift back towards the centre and a corrective saccade brings them back, producing nystagmus beating towards the direction of gaze.
d) An AICA stroke involves the middle cerebellar peduncle, the flocculus and vestibular nuclei (and inner ear), causing severe vertigo, truncal and gait ataxia, nystagmus and often hearing loss and facial weakness. The SCA supplies the superior cerebellar hemisphere and dentate (limb coordination) and largely spares the vestibulocerebellum and midline vermis, so limb ataxia predominates over gait ataxia.
e) Cerebellar oedema with mass effect (malignant cerebellar swelling, usually days 2-4): it compresses the brainstem, including the corticospinal tracts before they cross, causing contralateral weakness, and can block the fourth ventricle causing obstructive hydrocephalus and decline in consciousness; it may need ventricular drainage or suboccipital decompression."""),
]
C1 = """Question 1: Chronic meningitis and neurosyphilis
As a neurologist at Jigme Dorji Wangchuck National Referral Hospital, you are consulted by a medical officer from a Primary Health Centre about a 60-year-old man with headache for more than two months. He also has a change in personality, neck and back pain, double vision and clumsiness while walking. He is suspected to have chronic meningitis."""
SYPH = "\n\nOn further enquiry, you learn the patient had significant unprotected sexual exposure and treatment for genital sores many years ago. You suspect neurosyphilis."
C2 = """Question 2: Longitudinally extensive myelitis in a woman with SLE
A 32-year-old woman from Tsirang presents with a 5-day history of rapidly ascending sensory and motor deficit, now involving all four limbs, with urinary retention. 18 months ago she had a similar but less severe episode of unilateral visual loss that partially resolved with oral steroids. She has well-controlled systemic lupus erythematosus (SLE) treated with hydroxychloroquine.
Examination: alert and oriented. Cranial nerves: relative afferent pupillary defect on the right; fundoscopy shows pale optic discs bilaterally. Motor: flaccid quadriparesis (power 2/5 legs, 3/5 arms). Sensory: sensory level to pinprick at C5; profound loss of proprioception and vibration in all limbs. Reflexes absent throughout; plantar responses mute.
Investigations: ESR/CRP raised. MRI cervico-thoracic spine: T2-hyperintense, gadolinium-enhancing lesion from the medulla to T3. CSF: WCC 45/µL (80% lymphocytes), protein 1.2 g/L, glucose normal, oligoclonal bands negative. Serum AQP4-IgG pending (sample sent to India). MOG-IgG negative."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("neuro2025", 1, T, C1, items=[
    it("a. How do you define chronic meningitis? What are the other symptoms and signs of chronic meningitis?", 3,
       [("Definition: meningeal inflammation with symptoms and CSF abnormality (pleocytosis) persisting ≥4 weeks", 1), ("Symptoms/signs: headache, fever, neck stiffness, confusion/ cognitive change, cranial nerve palsies, seizures, hydrocephalus, radiculopathy, weight loss, focal deficits, papilloedema", 2)],
       "Chronic meningitis is inflammation of the meninges with clinical features and CSF abnormalities (pleocytosis) that persist or progress for at least 4 weeks. Other features: chronic headache, low-grade fever, neck stiffness, nausea and vomiting, confusion, memory and personality change, cranial nerve palsies (especially VI, VII, VIII), seizures, hydrocephalus (gait disturbance, papilloedema), radiculopathy or cauda equina symptoms, focal deficits from vasculitic infarcts, and systemic features such as weight loss and night sweats."),
    it("b. Which two classic signs of meningeal irritation would you ask the medical officer to elicit? Describe how to elicit each.", 4,
       [("Kernig's sign: hip and knee flexed to 90°, knee extended - pain/resistance in hamstrings/ back", 2), ("Brudzinski's (neck) sign: passive neck flexion causes involuntary flexion of hips and knees (also neck stiffness test)", 2)],
       "1. Kernig's sign: patient supine, flex the hip and knee to 90°, then try to straighten the knee; it is positive if extension is limited by resistance or pain in the back/hamstrings. 2. Brudzinski's neck sign: patient supine, passively flex the neck towards the chest; it is positive if this causes involuntary flexion of the hips and knees. (Neck stiffness - resistance to passive neck flexion - and the jolt accentuation test are also useful.)"),
    it("c. Name at least five categories of disease that account for most cases of chronic meningitis.", 3,
       [("Five categories: infections (TB, fungal - cryptococcal, syphilis, brucella, Lyme), neoplastic (carcinomatous/ lymphomatous meningitis), autoimmune/ inflammatory (sarcoidosis, Behçet's, SLE, vasculitis, IgG4), chemical/ drug-induced (NSAIDs, IVIG, intrathecal agents), parameningeal infections (abscess), idiopathic", 3)],
       "1. Chronic infections - tuberculosis (most common in Bhutan), fungal (Cryptococcus, especially with HIV), syphilis, brucellosis, Lyme disease, partially treated bacterial meningitis. 2. Neoplastic - carcinomatous or lymphomatous (leptomeningeal) meningitis. 3. Autoimmune/inflammatory - neurosarcoidosis, Behçet's disease, SLE and vasculitis, IgG4-related disease, Vogt-Koyanagi-Harada. 4. Chemical/drug-induced - NSAIDs, IVIG, intrathecal drugs, ruptured epidermoid cyst. 5. Parameningeal infections (epidural or brain abscess). 6. Idiopathic (no cause found)."),
    it("d. How would you approach this case once he is referred to you at JDWNRH?", 5,
       [("History (TB contacts, HIV/ STI risk, travel, cancer, autoimmune, drugs) and full neuro/ systemic exam", 1), ("Neuroimaging: contrast MRI brain and spine before LP (meningeal enhancement, hydrocephalus, infarcts)", 1), ("LP: opening pressure, cells, protein, glucose ratio, Gram/ AFB, cultures, GeneXpert, India ink/ CrAg, VDRL, cytology/ flow, repeat large-volume taps", 1.5), ("Blood: HIV, syphilis serology, CBC, ESR/CRP, ACE, ANA, cultures, CXR/ CT chest; meningeal biopsy if undiagnosed", 1), ("Empirical treatment considerations (anti-TB if suspected), manage hydrocephalus/ symptoms", 0.5)],
       "Take a full history (TB exposure, HIV and sexual risk, travel, cancer, autoimmune disease, drugs, immunosuppression) and examine thoroughly (cranial nerves, cognition, fundi, skin, lymph nodes, lungs). Imaging: contrast MRI of the brain and spine (basal meningeal enhancement, hydrocephalus, infarcts, masses) before lumbar puncture. LP: opening pressure, cell count and differential, protein, glucose (with serum glucose), Gram and Ziehl-Neelsen stains, bacterial, TB and fungal cultures, GeneXpert MTB/RIF, India ink and cryptococcal antigen, CSF VDRL, cytology and flow cytometry (repeat large-volume taps if negative). Blood tests: HIV, syphilis serology (RPR/VDRL and TPHA), CBC, ESR/CRP, ACE, ANA, blood cultures; chest X-ray or CT for TB/sarcoid/malignancy. If still undiagnosed, consider meningeal biopsy. Manage hydrocephalus and symptoms, and start empirical treatment (e.g. anti-TB therapy) if TB is likely while awaiting results."),
    it("e. What are the different types of serological tests for syphilis? Describe them." + SYPH, 2,
       [("Non-treponemal (VDRL, RPR): detect anti-cardiolipin antibodies, quantitative, used for screening/ monitoring, false positives", 1), ("Treponemal (TPHA, TPPA, FTA-ABS, EIA/CLIA): specific antibodies to T. pallidum, confirm, stay positive for life", 1)],
       "1. Non-treponemal tests - VDRL and RPR: detect antibodies to cardiolipin-lecithin antigen; cheap, quantitative titres used for screening and to monitor treatment response; can give false positives (pregnancy, SLE, other infections) and may become negative over time. 2. Treponemal tests - TPHA/TPPA, FTA-ABS and EIA/CLIA: detect antibodies specific to Treponema pallidum; used to confirm infection; usually remain positive for life, so they cannot show treatment response."),
    it("f. What co-infections would you rule out in this case?" + SYPH, 2,
       [("HIV (most important), hepatitis B and C, other STIs (gonorrhoea, chlamydia), TB (especially with HIV)", 2)],
       "HIV (the most important - shares the same route and changes the course and treatment of neurosyphilis), hepatitis B and C, other sexually transmitted infections (gonorrhoea, chlamydia, herpes), and tuberculosis, especially if HIV positive."),
    it("g. What CSF studies would you request and what findings do you expect?" + SYPH, 2,
       [("Studies: cell count, protein, glucose, CSF-VDRL, CSF FTA-ABS/TPHA", 1), ("Expected: lymphocytic pleocytosis (>5 cells), raised protein, normal/ slightly low glucose, CSF-VDRL positive (specific but insensitive); CSF FTA-ABS negative helps exclude", 1)],
       "Request CSF cell count and differential, protein, glucose, CSF-VDRL, and CSF treponemal test (FTA-ABS/TPHA). Expected: lymphocytic pleocytosis (>5 cells/µL), raised protein, normal or mildly low glucose; a reactive CSF-VDRL is highly specific (diagnostic) but insensitive; a non-reactive CSF FTA-ABS makes neurosyphilis unlikely."),
    it("h. How will you treat this case?" + SYPH, 1,
       [("IV aqueous crystalline penicillin G 18-24 million units/day (3-4 MU 4-hourly) for 10-14 days (alternative procaine penicillin + probenecid, or ceftriaxone)", 1)],
       "Intravenous aqueous crystalline penicillin G 18-24 million units per day (3-4 million units every 4 hours or continuous infusion) for 10-14 days; alternatives are procaine penicillin IM with probenecid or ceftriaxone if penicillin allergic (desensitise if possible). Follow up CSF at 6 months, and treat any HIV infection."),
    it("i. Describe the clinical manifestations of general paresis and tabes dorsalis." + SYPH, 3,
       [("General paresis: progressive dementia, personality change, psychosis/ grandiose delusions, mood change, dysarthria, tremor, seizures, Argyll Robertson pupils", 1.5), ("Tabes dorsalis: lightning pains, sensory ataxia, positive Romberg, loss of proprioception/ vibration, areflexia, Argyll Robertson pupils, Charcot joints, bladder dysfunction, optic atrophy", 1.5)],
       "General paresis (parenchymal brain involvement, years after infection): progressive dementia with memory loss, poor judgement and personality change, psychiatric features (grandiose delusions, mania, depression, psychosis), dysarthria, tremor of face and tongue, seizures, hyperreflexia and Argyll Robertson pupils. Tabes dorsalis (dorsal columns and dorsal roots): lightning (lancinating) pains, sensory ataxia with a wide-based stamping gait and positive Romberg sign, loss of vibration and position sense, areflexia, Argyll Robertson pupils, optic atrophy, bladder dysfunction, impotence and Charcot (neuropathic) joints."),
])
Q += case("neuro2025", 2, T, C2, items=[
    it("a. List three distinct neuro-immunological mechanisms that could explain this presentation, citing a specific condition for each.", 3,
       [("Three mechanisms with conditions (1 each): antibody (AQP4-IgG) complement-mediated astrocytopathy - NMOSD; SLE-related vasculopathy/ antiphospholipid thrombotic myelopathy or lupus myelitis; MOG antibody oligodendrocytopathy - MOGAD; T-cell mediated demyelination - MS; paraneoplastic/ post-infectious ADEM", 3)],
       "1. Antibody-mediated, complement-dependent astrocytopathy - aquaporin-4 IgG neuromyelitis optica spectrum disorder (NMOSD), which is associated with SLE. 2. Immune-complex vasculopathy or antiphospholipid antibody-related thrombotic/inflammatory myelopathy - lupus myelitis in SLE. 3. Antibody-mediated oligodendrocytopathy - MOG antibody-associated disease (MOGAD; MOG negative here but can be repeated). (Alternatively: T-cell mediated inflammatory demyelination - multiple sclerosis, or post-infectious ADEM.)"),
    it("b. Given the MRI finding of longitudinally extensive transverse myelitis (LETM), which single test result would you consider most critical to await before starting long-term immunotherapy? Justify.", 2,
       [("AQP4-IgG (cell-based assay)", 1), ("Justification: confirms NMOSD, guides choice - MS drugs (interferon, natalizumab, fingolimod) can worsen NMOSD; positive = lifelong relapse prevention", 1)],
       "The serum AQP4-IgG result (by cell-based assay). It confirms NMOSD and determines long-term treatment: AQP4-positive NMOSD needs indefinite relapse-preventing immunosuppression (e.g. rituximab, eculizumab, satralizumab), while some MS disease-modifying drugs (interferon-beta, natalizumab, fingolimod) can worsen NMOSD. A positive result also predicts a high relapse risk."),
    it("c. What fundamental immunopathological process do oligoclonal bands represent in MS?", 1,
       [("Intrathecal synthesis of IgG by clonally expanded B cells/ plasma cells within the CNS (compartmentalised humoral immunity)", 1)],
       "Oligoclonal bands show intrathecal (CNS) synthesis of immunoglobulin G by a limited number of clonally expanded B cells/plasma cells within the CNS - compartmentalised humoral immune activity - detected as bands in CSF but not in matched serum."),
    it("d. Discuss the prognostic significance of a negative OCB result in this specific clinical context.", 2,
       [("Negative OCB makes MS unlikely (OCB positive in >90-95% MS) and supports NMOSD/ MOGAD/ lupus myelitis", 1), ("Prognosis: points to relapsing antibody-mediated disease with severe attacks and poor recovery unless prevented; avoid MS drugs; in MS negative OCB may predict milder course", 1)],
       "OCBs are present in over 90-95% of people with MS but only in about 15-30% of NMOSD, so a negative result makes MS unlikely and supports NMOSD, MOGAD or lupus-related myelitis. Prognostically this suggests an antibody-mediated, relapsing disease in which attacks are severe with incomplete recovery (as already seen in her optic neuritis), so long-term immunosuppression is needed to prevent disability; it also warns against MS drugs that can worsen NMOSD."),
    it("e. While awaiting the AQP4-IgG result you must decide on acute management. Argue for and against using plasma exchange (PLEX) now.", 3,
       [("For: severe disabling attack (quadriparesis, C5 level, bladder, risk of respiratory failure), early PLEX improves outcome in NMOSD/ steroid-refractory attacks, benefit greater if early; can be given with IV methylprednisolone; diagnosis likely antibody-mediated", 1.5), ("Against: invasive (central line, infection, bleeding, haemodynamic instability, hypocalcaemia), availability/cost in Bhutan, diagnosis unconfirmed, usual practice IV steroids first then PLEX if no response in 3-5 days", 1.5)],
       "For: this is a severe, disabling attack (flaccid quadriparesis, C5 level extending to the medulla, urinary retention, risk of respiratory failure); evidence shows early PLEX (within days) improves outcome in severe NMOSD and other antibody-mediated CNS demyelination, especially if steroids are not enough, and the clinical picture strongly suggests an antibody-mediated disease - delay waiting for an overseas result risks permanent disability. Against: PLEX is invasive and needs central access, with risks of infection, bleeding, hypotension and electrolyte problems; it is resource-intensive and may not be available locally; the diagnosis is not yet confirmed; and standard practice is high-dose IV methylprednisolone first, adding PLEX if there is no improvement after 3-5 days. Reasonable approach: start IV methylprednisolone immediately and arrange early PLEX given the severity."),
    it("f. Would your argument change if the patient were AQP4-IgG positive? Explain the pathophysiological basis for the efficacy of PLEX in that scenario.", 2,
       [("Yes - stronger case for early PLEX (even first-line with steroids)", 1), ("Basis: removes circulating AQP4-IgG, complement components and other mediators that cause complement-dependent astrocyte injury", 1)],
       "Yes - the case for early PLEX becomes stronger, and it is often used early (alongside or soon after steroids) in AQP4-positive NMOSD attacks. PLEX removes circulating pathogenic AQP4-IgG, complement components and inflammatory cytokines from the blood, reducing ongoing antibody binding to astrocyte AQP4 and complement-mediated astrocyte damage, so lesions can recover."),
    it("g. Contrast the typical histopathological findings of an MS plaque and an NMOSD lesion, focusing on complement, astrocytes and eosinophils.", 3,
       [("MS: primary demyelination with T-cell/ macrophage infiltrate, relative axonal preservation, astrocytes preserved/ reactive gliosis, AQP4 preserved, little complement/ eosinophils, perivenular", 1.5), ("NMOSD: primary astrocytopathy - loss of AQP4 and GFAP, perivascular IgG and complement (MAC) deposition in rim/ rosette pattern, eosinophils and neutrophils, necrosis, secondary demyelination and axonal loss, vascular hyalinisation", 1.5)],
       "MS plaque: primary inflammatory demyelination with T cells and macrophages around veins, relative preservation of axons, astrocytes preserved and forming reactive gliosis (AQP4 and GFAP preserved or increased), and usually little complement deposition or granulocyte infiltration (except some pattern II lesions). NMOSD lesion: primary astrocytopathy - early loss of AQP4 and GFAP from astrocytes; IgG and activated complement (membrane attack complex) deposited in a perivascular rim and rosette pattern; prominent eosinophils and neutrophils; necrosis and cavitation with secondary demyelination and axonal loss; thickened hyalinised vessel walls."),
    it("h. How does eculizumab's mechanism of action directly counter the pathophysiology you described for NMOSD?", 2,
       [("Eculizumab is a monoclonal antibody against complement C5, blocking its cleavage into C5a and C5b", 1), ("Prevents membrane attack complex formation and C5a-driven granulocyte recruitment, stopping AQP4-IgG-triggered complement-mediated astrocyte lysis - reduces relapses", 1)],
       "Eculizumab is a humanised monoclonal antibody that binds complement protein C5 and prevents its cleavage into C5a and C5b. In NMOSD, AQP4-IgG binds astrocytes and activates complement; blocking C5 stops formation of the membrane attack complex (C5b-9) that lyses astrocytes and stops C5a-driven recruitment of neutrophils and eosinophils, so the inflammatory cascade cannot destroy tissue; this greatly reduces relapses in AQP4-positive NMOSD."),
    it("i. This patient's first event was optic neuritis. Describe the key differentiating features on optical coherence tomography (OCT) between post-acute optic neuritis in MS and NMOSD.", 2,
       [("NMOSD: severe RNFL and GCIPL thinning (often >40 µm loss, RNFL < 60 µm), diffuse incl. superior/ inferior quadrants, microcystic macular oedema more common, poorer VA", 1), ("MS: milder thinning (about 15-20 µm), predominantly temporal (papillomacular bundle), better recovery", 1)],
       "After NMOSD optic neuritis, OCT typically shows severe thinning of the peripapillary retinal nerve fibre layer (often losing >40 µm, average RNFL <60 µm) and ganglion cell-inner plexiform layer, affecting all quadrants including superior and inferior, often with microcystic macular oedema and poor visual recovery. After MS optic neuritis thinning is milder (about 15-20 µm loss), mostly in the temporal sector (papillomacular bundle), with better recovery; subclinical thinning may also occur in the fellow eye in MS."),
    it("j. A different patient presents with bilateral optic neuritis and negative AQP4-IgG. What clinical and MRI feature of the optic nerves would strongly suggest MOGAD rather than NMOSD?", 1,
       [("Marked optic disc swelling (papillitis) clinically with long anterior optic nerve involvement and perineural (optic sheath) enhancement on MRI, sparing chiasm", 1)],
       "Prominent optic disc swelling (papillitis) on fundoscopy, with MRI showing longitudinally extensive involvement of the anterior (intraorbital) optic nerves with perineural (optic nerve sheath) enhancement, typically sparing the chiasm (NMOSD more often affects the posterior nerve and chiasm)."),
    it("k. Name two evidence-based first-line long-term immunosuppressive agents for NMOSD and their main mechanism of action.", 2,
       [("Two agents with mechanisms (1 each): rituximab (anti-CD20 B-cell depletion), inebilizumab (anti-CD19 B-cell/ plasmablast depletion), satralizumab or tocilizumab (IL-6 receptor blockade), eculizumab/ ravulizumab (C5 inhibition), azathioprine/ mycophenolate (purine synthesis inhibitors reducing lymphocyte proliferation)", 2)],
       "Rituximab - a monoclonal antibody against CD20 that depletes B cells, reducing production of AQP4-antibody-secreting cells and B-cell antigen presentation. Satralizumab (or tocilizumab) - blocks the interleukin-6 receptor, reducing plasmablast survival and AQP4-IgG production and inflammation. (Also: inebilizumab - anti-CD19 depletion of B cells and plasmablasts; eculizumab/ravulizumab - C5 complement inhibition; azathioprine or mycophenolate - inhibit purine synthesis and lymphocyte proliferation, used where newer agents are unavailable.)"),
    it("l. Her SLE is managed with hydroxychloroquine. Explain the potential challenges and considerations in adding a powerful immunosuppressant on top of her existing autoimmune disease and its treatment.", 2,
       [("Infection risk from combined immunosuppression (screen TB, hepatitis B, HIV; vaccinations; meningococcal vaccine for eculizumab)", 1), ("Other: drug interactions/ toxicity, monitoring SLE activity, choose agent treating both (rituximab, mycophenolate), steroid side effects, hydroxychloroquine retinal toxicity confounding vision, pregnancy planning, cost/ access in Bhutan, coordination with rheumatology", 1)],
       "Adding strong immunosuppression increases infection risk (TB is common in Bhutan, hepatitis B reactivation with rituximab, meningococcal infection with eculizumab), so screen for TB, hepatitis B/C and HIV, vaccinate and give prophylaxis where needed. Choose agents that may treat both diseases (e.g. rituximab or mycophenolate) and coordinate with rheumatology; monitor blood counts, liver and kidney function and drug interactions; watch for steroid side effects (osteoporosis, diabetes). Hydroxychloroquine can be continued but its retinal toxicity must be monitored and distinguished from optic nerve damage. Consider pregnancy plans (some drugs are teratogenic), cost and availability of drugs in Bhutan, and her adherence."),
])
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions", "type": "short_answer", "count": 4, "marks_each": 5, "answer_any": None},
    {"title": "Section B: Two compulsory questions", "type": "passage", "count": 2, "marks_each": 25, "answer_any": None},
]
