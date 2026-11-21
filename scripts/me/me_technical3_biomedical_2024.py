"""ME Technical Paper III (Subject Specialisation Paper), Biomedical Engineering, BCSE 2024 - real paper (PDF sent by the founder).
Standard pattern. Replaced MCQs: 11 (EEG range option misprinted) and 29 (IC testing with a multimeter - several selector
settings defensible). Case questions ask for block diagrams: students draw them and upload photos.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Biomedical Engineering): BCSE 2024, batch 1"
GROUP_TAG = "biomed2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "biomedical-engineering"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Biomedical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Biomedical Engineering"

MCQ = r"""[
{
"n": 1,
"stem": "Which equipment is used to heal many kind of cancers?",
"opts": [
"Magnetic Resonance Imaging",
"Computer tomography",
"Radiation therapy",
"Catheter Angiography"
]
},
{
"n": 2,
"stem": "The X-ray machines is used as diagnostic equipment in all health centers. The image on the X-ray film is ……………..",
"opts": [
"Rare image",
"Shadow image",
"Real image",
"All of the above"
]
},
{
"n": 3,
"stem": "In a human cardiovascular system the arteries carry",
"opts": [
"Oxygenated blood towards the heart",
"Deoxygenated blood towards the heart",
"Deoxygenated blood away from the heart",
"Oxygenated blood away from the heart"
]
},
{
"n": 4,
"stem": "From an equipment point of view the respiration system in the human body is …………….",
"opts": [
"Pneumatic system",
"Bidirectional system",
"Circulatory system",
"Exocrine system"
]
},
{
"n": 5,
"stem": "The source of biomedical signal for the pulse oximetry i. e pulmonary system is ………………..",
"opts": [
"Bio electric",
"Bio impedance",
"Bio optical",
"Bio mechanical"
]
},
{
"n": 6,
"stem": "……………. is used to convert one form of energy to another, this sensor is used in most of the medical equipment",
"opts": [
"Transducer",
"Transformer",
"Thermistor",
"All of the above"
]
},
{
"n": 7,
"stem": "Which method or principle does portable oxygen concentrator use to separate air from oxygen?",
"opts": [
"Pressure drop adsorption",
"Pressure swing adsorption",
"Pressure swing absorption",
"Pressurized air absorption"
]
},
{
"n": 8,
"stem": "LFT and RFT blood tests are processed in which machine?",
"opts": [
"Immunochemistry analyzer",
"Hematology analyzer",
"Electrolyte analyzer",
"Biochemistry analyzer"
]
},
{
"n": 9,
"stem": "The document 60601-1-1 standard developed under IEC is for",
"opts": [
"Safety of medical electrical equipment",
"Safety requirements for medical electrical system",
"Safety requirement for medical equipment",
"Safety requirement for medical system"
]
},
{
"n": 10,
"stem": "Non-isolated applied part based on degree of protection is",
"opts": [
"Type BF",
"Type B",
"Class I",
"Class II"
]
},
{
"n": 11,
"stem": "The normal EEG range is between",
"opts": [
"5-20Hz",
"5-30Hz",
"5-40Hz",
"5.50Hz"
]
},
{
"n": 12,
"stem": "Which kind of amplifier is used in the ECG recording system?",
"opts": [
"Isolation amplifier",
"Electronic amplifier",
"Differential amplifier",
"Bridge amplifier"
]
},
{
"n": 13,
"stem": "How do you maintain an MRI machine?",
"opts": [
"The magnet system is checked for condensation",
"Magnet pressure gauge is inspected",
"Helium level is inspected",
"All of the above"
]
},
{
"n": 14,
"stem": "What is used to measure respiratory volume?",
"opts": [
"Echo Cardiography",
"Ultrasound technique",
"Spirometry",
"Thermo-dilution technique"
]
},
{
"n": 15,
"stem": "The X-ray beam penetration through the patient can be increased by increasing",
"opts": [
"mAs",
"kV",
"Beam area",
"Kv and mAs"
]
},
{
"n": 16,
"stem": "Auto acoustic emission that are tested in OAE machine in audiology is sound emitted from the",
"opts": [
"Eardrum",
"Ossicles",
"Cochlea",
"Vestibular nerves"
]
},
{
"n": 17,
"stem": "In the air, at 20 degree Celsius and at sea level, sound travel at the speed of",
"opts": [
"340m per second",
"324m per second",
"344m per second",
"355m per second"
]
},
{
"n": 18,
"stem": "ABG machine in ICUs are used mainly to evaluate",
"opts": [
"Patient ventilation",
"Patient blood",
"patient consciousness",
"all of the above"
]
},
{
"n": 19,
"stem": "What are the anesthesia gas used in the anesthesia machine for the operating procedure?",
"opts": [
"Isoflurane",
"Sevoflurane",
"Halothane",
"All of the above"
]
},
{
"n": 20,
"stem": "The filter used to reject the 50Hz noise picked up from the power line is called?",
"opts": [
"Band stop filter",
"Notch filter",
"Band gate filter",
"All of the above"
]
},
{
"n": 21,
"stem": "In the medical equipment where the electrode paste or gel is used to ……..",
"opts": [
"Absorb contact impedance",
"Equate contact impedance",
"Reduce contact impedance",
"Increase contact impedance"
]
},
{
"n": 22,
"stem": "Optical fiber sensor are electrically……..",
"opts": [
"Passive",
"Active",
"Active as well as passive",
"Cannot be determined"
]
},
{
"n": 23,
"stem": "What are used as light sources in the skin reflectance oximeter?",
"opts": [
"Red and infrared LED",
"Photodiode",
"Infrared and ultra-red LED",
"Red and blue LED"
]
},
{
"n": 24,
"stem": "What is incorporated in the sensor to warm the tissue so as to increase local blood flow?",
"opts": [
"Thermostat",
"Heating plate",
"Heater",
"Thermometer"
]
},
{
"n": 25,
"stem": "………….uses high-frequency electromagnetic energy to generate heat",
"opts": [
"longwave diathermy machine",
"Shortwave diathermy machine",
"Diathermy machine",
"TENS Machine"
]
},
{
"n": 26,
"stem": "The PCR machine is used to detect COVID-19, what does PCR machine mean",
"opts": [
"Polyester chain reaction",
"Polymers Chain reaction",
"Polymerase Chain reaction",
"Polyser Chain reaction"
]
},
{
"n": 27,
"stem": "What does ND: YAG laser uses",
"opts": [
"Far infrared wavelength",
"Far micro wavelength",
"Near infrared wavelength",
"Near ultraviolet wavelength"
]
},
{
"n": 28,
"stem": "In which field the Orthopantomogram is used………………",
"opts": [
"Field of orthopedic",
"Field of radiology",
"Field of ophthalmology",
"Field of dentistry"
]
},
{
"n": 29,
"stem": "How do you check an IC by using a multi-meter",
"opts": [
"By placing the selector at ohm symbol",
"By placing the selector at continuity symbol",
"By placing the selector at DC voltage indicator",
"By placing the selector at capacitor symbol"
]
},
{
"n": 30,
"stem": "What causes metal artifact in CT",
"opts": [
"Photo starvation",
"Scattering",
"Edge effect",
"All of the above"
]
}
]"""

KEY = {
    1: ("c", "Radiation therapy treats many cancers."), 2: ("b", "An X-ray image is a shadow image of differing attenuation."),
    3: ("d", "Arteries carry oxygenated blood away from the heart (except pulmonary artery)."), 4: ("a", "Equipment-wise, respiration is a pneumatic system."),
    5: ("c", "Pulse oximetry uses bio-optical signals (light absorption)."), 6: ("a", "A transducer converts one form of energy to another."),
    7: ("b", "Oxygen concentrators use pressure swing adsorption (zeolite sieve)."), 8: ("d", "LFT and RFT are run on a biochemistry analyser."),
    9: ("b", "IEC 60601-1-1 covers safety requirements for medical electrical systems."), 10: ("b", "Type B applied parts are not isolated from earth."),
    12: ("c", "ECG uses differential (instrumentation) amplifiers to reject common-mode noise."), 13: ("d", "MRI maintenance checks condensation, pressure and helium level."),
    14: ("c", "Spirometry measures respiratory volumes."), 15: ("b", "Higher kV increases beam penetration."),
    16: ("c", "Otoacoustic emissions come from the cochlea's outer hair cells."), 17: ("c", "Sound travels about 343-344 m/s in air at 20 °C."),
    18: ("a", "ABG mainly evaluates ventilation (gas exchange) and acid-base status."), 19: ("d", "Isoflurane, sevoflurane and halothane are all used."),
    20: ("b", "A notch filter removes 50 Hz mains interference."), 21: ("c", "Electrode gel reduces skin-electrode contact impedance."),
    22: ("a", "Optical fibre sensors are electrically passive (no electrical connection to the patient)."), 23: ("a", "Reflectance oximeters use red and infrared LEDs."),
    24: ("c", "A heater warms the tissue (e.g. transcutaneous sensors) to increase local blood flow."), 25: ("b", "Shortwave diathermy uses high-frequency electromagnetic energy for heat."),
    26: ("c", "PCR = polymerase chain reaction."), 27: ("c", "Nd:YAG lasers emit near-infrared (1064 nm)."),
    28: ("d", "Orthopantomograms are panoramic dental X-rays."), 30: ("d", "Photon starvation, scatter and edge effects all contribute to metal artefacts."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "The main frequency bands of a normal human EEG lie roughly between", ["0.5 and 100 Hz", "500 and 1000 Hz", "1 and 5 kHz", "10 and 20 kHz"], "a",
            "EEG activity (delta to gamma) is mostly in about 0.5-100 Hz, with the main clinical bands up to about 30-40 Hz."),
    new_mcq(2, T, "To check whether a fuse is open with a digital multimeter, the selector should be set to", ["AC voltage", "Continuity (or resistance)", "Frequency", "Capacitance"], "b",
            "A good fuse shows continuity (near zero ohms); an open fuse shows no continuity."),
    saq(1, T, "Explain the different classifications of medical electrical equipment based on the method of protection against electric shock, with examples. (3 + 2 marks)",
        [("Classes by protection (IEC 60601): Class I (basic insulation + protective earth), Class II (double/ reinforced insulation, no earth), internally powered (battery) - explained", 3), ("Examples for each and/or applied part types (B, BF, CF) by degree of protection", 2)],
        "IEC 60601-1 classifies equipment by the method of protection against electric shock: Class I - basic insulation plus a protective earth conductor connected to accessible metal parts, so a fault current goes to earth and trips the protection (e.g. X-ray units, infusion pumps with metal casings, patient monitors with three-pin plugs). Class II - double or reinforced insulation with no reliance on earth (two-pin plug, double-square symbol), e.g. many small diagnostic devices and chargers. Internally powered equipment - runs on internal batteries without mains connection during use (e.g. portable pulse oximeters, battery ECG). By degree of protection of the applied part: Type B (not isolated - e.g. X-ray table), Type BF (floating, isolated - e.g. ECG monitor, blood pressure), Type CF (highest protection for direct cardiac contact - e.g. defibrillator, cardiac catheter monitoring)."),
    saq(2, T, "If an anaesthesia machine breaks down, how would you, as a field biomedical engineer, carry out maintenance and resolve the issue? Explain technically. (3 + 2 marks)",
        [("Systematic troubleshooting: safety first (take out of service, backup machine), gather fault info/ error codes, visual and functional check: gas supply (pipeline/ cylinder pressures, pin index), regulators, flowmeters, vaporisers, breathing circuit leak test, valves, ventilator, O2 sensor, power/ electronics; manual/ service guide", 3), ("Repair, replace parts, calibration (O2 sensor, flow), leak and performance test, safety test, documentation, user training, return to service", 2)],
        "1. Safety first: take the machine out of service, make sure a backup machine or manual ventilation is available, and get the fault description and error codes from users. 2. Systematic troubleshooting using the service manual: check gas supplies (pipeline pressure about 50 psi, cylinder contents, pin-index connections, regulators); flowmeters and the hypoxic guard; vaporisers (filling, leaks, settings); perform the low-pressure and breathing-circuit leak tests; inspect the APL valve, unidirectional valves, CO2 absorber and hoses; test the ventilator (bellows, drive gas, settings) and the oxygen sensor; check power supply, battery, fuses and electronic boards and alarms. 3. Repair: replace faulty parts (O-rings, seals, sensors, valves), clean and lubricate as per manufacturer, recalibrate the oxygen sensor and flow sensors. 4. Verify: full pre-use check, leak and performance tests, electrical safety test; document the work in the maintenance log; brief users and return the machine to service; plan preventive maintenance."),
    saq(3, T, "What is the significance of grounding for medical equipment? Explain its types technically. (2 + 3 marks)",
        [("Significance: provides low-impedance path for fault/ leakage current to earth, triggers protective devices, prevents shock (macro/ micro shock), reduces noise/ EMI, protects equipment", 2), ("Types: protective (safety) earth, functional earth, equipotential bonding/ grounding in patient areas (equipotential busbar), isolated power systems in OT/ ICU", 3)],
        "Significance: grounding gives fault and leakage currents a low-resistance path to earth, so the casing of a faulty Class I device does not become live and the fuse or RCD trips; this protects patients and staff from macroshock and, in critical areas, from dangerous microshock; it also reduces electrical noise and interference in sensitive signals (ECG, EEG) and protects equipment. Types: 1. Protective (safety) earth - the earth conductor in the power cord connecting the metal enclosure to earth. 2. Functional earth - used for proper operation (e.g. reference for signals, screening against interference), not for safety. 3. Equipotential bonding - all metal parts and equipment in the patient area connected to a common equipotential bus bar so they are at the same potential (important in OT, ICU, cardiac labs). 4. Isolated (IT) power systems with line isolation monitors in operating theatres, which keep supply ungrounded so a single fault does not cause a shock."),
    saq(4, T, "Explain the importance of medical equipment management and its impact. (2 + 3 marks)",
        [("Importance: ensures safe, functional, available equipment for diagnosis/ treatment; life-cycle management (planning, procurement, installation, training, maintenance, disposal)", 2), ("Impact: patient safety and quality of care, reduced downtime, cost savings/ longer lifespan, regulatory compliance/ accreditation, better planning/ inventory, staff competence, data for budgeting", 3)],
        "Medical equipment management (health technology management) covers the whole life cycle of equipment - needs assessment and planning, procurement, installation and commissioning, user training, preventive and corrective maintenance, calibration and safety testing, inventory records and decommissioning/disposal. It is important because hospitals depend on safe, accurate and available equipment for diagnosis and treatment. Impact: improves patient safety and quality of care (fewer equipment-related incidents); reduces breakdowns and downtime; extends equipment life and saves money on repairs and replacements; ensures compliance with standards and accreditation; supports better budgeting and replacement planning using data; improves staff competence and confidence; and in Bhutan helps keep scarce high-end equipment working across referral and district hospitals."),
]
C1 = """Case I: Imaging and ophthalmic equipment
As a newly appointed biomedical engineer in the hospital, you are expected to demonstrate the following skills in front of your supervisor."""
C2 = """Case II: OT and paediatric equipment
You are a newly appointed engineer in the Department of Biomedical Engineering. Your first assignment is a project on equipment in the OT and paediatric departments, so you must first know the following equipment in detail."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("biomed2024", 1, T, C1, items=[
    it("1. Explain the principles of digital radiography (DR) and computed radiography (CR) to a newly qualified technician, with the technical components and mechanisms and a block diagram.", 25,
       [("X-ray generation basics (tube, generator, collimator, patient, grid)", 4), ("CR: photostimulable phosphor (BaFBr:Eu) imaging plate in cassette, latent image, laser scanning reader, PMT, ADC, erasure; workflow", 7), ("DR: flat panel detectors - indirect (scintillator CsI + TFT photodiode array) and direct (a-Se + TFT), readout electronics, immediate image", 7), ("Block diagram (generator-tube-patient-detector-ADC-processing-display/PACS) and comparison (speed, dose, cost, image quality)", 7)],
       "Both start with an X-ray generator and tube producing a beam that passes through the collimator, patient and anti-scatter grid; the transmitted pattern is captured digitally instead of on film. Computed radiography (CR): a cassette contains an imaging plate coated with a photostimulable phosphor (e.g. BaFBr:Eu). X-ray energy excites electrons that are trapped, forming a latent image. In the CR reader, a red laser scans the plate line by line; trapped electrons are released and emit blue light (photostimulated luminescence), collected by a light guide and photomultiplier tube, converted to an electrical signal and digitised by an ADC; the plate is then erased with bright white light and reused. Digital radiography (DR): a flat-panel detector produces the image directly. Indirect DR uses a scintillator (caesium iodide or gadolinium oxysulphide) to convert X-rays to light, which an amorphous-silicon photodiode/thin-film transistor (TFT) array converts to charge; direct DR uses amorphous selenium to convert X-rays straight into charge, collected by the TFT array. Readout electronics digitise the signals and send them to the workstation within seconds. Block diagram: high-voltage generator → X-ray tube → collimator → patient → grid → detector (CR plate + reader with laser, PMT, ADC; or DR flat panel with TFT readout) → image processing computer → display/PACS/printer. Comparison: DR is faster, better workflow and dose efficiency but expensive; CR is cheaper, uses existing X-ray units, but slower with lower resolution."),
    it("2. You work in a hospital with many high-end ophthalmic devices. Your task is to carry out planned preventive maintenance (PPM) and component replacement for an A/B scan. Explain and describe it with PPM steps and a block diagram.", 25,
       [("A/B scan principle: ultrasound transducer (~10-20 MHz), A-scan amplitude for axial length (biometry), B-scan 2D brightness image", 6), ("Block diagram: pulser/ transmitter - probe (piezoelectric) - receiver/ amplifier - TGC - ADC - processor - display/ printer, power supply", 6), ("PPM steps: documentation, safety, visual inspection (probe cable, crystal face, housing), cleaning/ disinfection, functional tests (test block/ phantom, axial length accuracy), calibration, electrical safety test, software/ battery, printer, records", 9), ("Component replacement: probe, cables, membranes/ fluid, battery, footswitch, following manufacturer; verification after replacement", 4)],
       "Principle: an A/B scan uses high-frequency ultrasound (about 10 MHz for A-scan biometry, 10-20 MHz for B-scan) from a piezoelectric probe. Echoes from eye structures return to the probe; the A-scan shows them as amplitude spikes against time/distance (used to measure axial length for IOL power calculation), while the B-scan sweeps the beam to form a two-dimensional brightness image (for vitreous haemorrhage, retinal detachment, tumours when the media are opaque). Block diagram: power supply → pulser/transmitter → probe (transducer) → receiver and amplifier with time-gain compensation → filtering and ADC → digital signal processor/computer (measurement and IOL calculation software) → display, printer and storage; footswitch and keyboard as inputs. PPM steps: 1. Check the service history, manufacturer's schedule and safety precautions; inform users. 2. Visual inspection of the probe face, cable, connectors, housing, footswitch and power cord for cracks, wear or damage. 3. Cleaning and disinfection of probe and surfaces with approved agents. 4. Functional tests: power-on self-test, display, controls, footswitch, printer; check A-scan accuracy with the manufacturer's test block (known velocity/length) and B-scan image quality on a phantom. 5. Calibration as per manufacturer (sound velocity settings, gain). 6. Electrical safety test (earth resistance, leakage currents, BF applied part). 7. Check battery/UPS, software updates and data backup. 8. Record results, label with PPM date and next due date. Component replacement: replace a faulty probe, cable, footswitch, printer parts or battery with genuine parts as per the service manual, then repeat functional, accuracy and safety tests before returning to use and document everything."),
])
Q += case("biomed2024", 2, T, C2, items=[
    it("1. Explain the mechanism of CPAP used for neonates in hospital. Describe its benefits for neonates undergoing therapy.", 25,
       [("Principle: continuous positive airway pressure throughout breathing cycle (typically 4-8 cmH2O) keeps alveoli open, increases FRC", 6), ("Components/ mechanism: blended O2/air source (blender), flowmeter, heated humidifier, inspiratory tubing, interface (nasal prongs/ mask), expiratory limb with pressure generator (bubble CPAP water column, ventilator/ flow driver valve), pressure monitoring, alarms", 9), ("Benefits: prevents alveolar collapse (RDS), improves oxygenation, reduces work of breathing and apnoea, avoids intubation/ ventilator injury, reduces surfactant need, cheaper (bubble CPAP)", 7), ("Precautions/ care: nasal injury, gastric distension, pneumothorax, humidification, monitoring", 3)],
       "Mechanism: continuous positive airway pressure delivers a continuous flow of warmed, humidified air-oxygen mixture and keeps a set positive pressure (typically 4-8 cmH2O) in the airways throughout inspiration and expiration while the baby breathes spontaneously. Components: medical air and oxygen sources with an oxygen blender (to set FiO2) and flowmeter (about 5-10 L/min); a heated humidifier; inspiratory tubing; a nasal interface (short binasal prongs or nasal mask) with a bonnet to hold it; and an expiratory limb with a pressure generator - in bubble CPAP the expiratory tube is submerged in water to a depth equal to the desired pressure (e.g. 5 cm), while ventilator or flow-driver CPAP uses valves or a variable-flow generator; pressure monitoring and alarms. The positive pressure splints open the alveoli and small airways, increases functional residual capacity and stabilises the chest wall. Benefits: prevents alveolar collapse in respiratory distress syndrome (surfactant deficiency) and transient tachypnoea; improves oxygenation and reduces work of breathing; reduces apnoea of prematurity; avoids intubation and mechanical ventilation and their complications (ventilator lung injury, infection); may reduce the need for surfactant and bronchopulmonary dysplasia; bubble CPAP is low-cost and suitable for district hospitals. Care: correct prong size, protect the nasal septum, keep the mouth closed and humidification working, use an orogastric tube to vent the stomach, and monitor SpO2, breathing and signs of pneumothorax."),
    it("2. A new operating microscope has been installed for otolaryngology (ENT) procedures. After attending training, you must train your subordinates. Explain its principle and mechanism with a block diagram, so they understand its overall performance and clinical benefits.", 25,
       [("Principle: compound/ stereo microscope - objective lens (long working distance, e.g. 200-400 mm), magnification changer (Galilean/ zoom), binocular eyepieces giving stereoscopic magnified, illuminated view", 6), ("Components: illumination (halogen/ xenon/ LED via fibre optic, coaxial), objective, magnification changer, beam splitter, eyepieces, assistant scope/ camera, stand with balanced arm, brakes, foot/ hand controls, focus, power supply", 9), ("Block diagram: light source → fibre → illumination optics → surgical field; field → objective → zoom → beam splitter → binocular/ camera → display/ recording", 5), ("Clinical benefits/ performance: magnification (4-40x), depth perception, precision in ear/ larynx/ sinus surgery, documentation/ teaching, ergonomics; care/ maintenance", 5)],
       "Principle: the operating microscope is a stereoscopic compound microscope that gives the surgeon a magnified, brightly illuminated, three-dimensional view of a small, deep surgical field at a comfortable working distance. Mechanism and components: an objective lens with a long working distance (e.g. 200-400 mm, chosen for ear or larynx work) collects light from the field; a magnification changer (step Galilean system or motorised zoom) sets magnification (about 4-40x); binocular eyepieces (with dioptre and interpupillary adjustment) give stereoscopic vision; a beam splitter sends part of the image to an assistant's scope or a video camera for display and recording. Illumination comes from a halogen, xenon or LED source carried by fibre-optic cable and projected coaxially along the optical axis to light deep, narrow cavities without shadows. The optics are mounted on a floor or ceiling stand with counter-balanced arms, magnetic or electromagnetic brakes, fine focus and handle or foot-pedal controls. Block diagram: power supply → light source → fibre-optic cable → illumination optics → surgical field; surgical field → objective lens → magnification changer → beam splitter → binocular eyepieces / assistant scope / camera → monitor and recorder. Performance and clinical benefits: high magnification, bright shadow-free light and depth perception allow precise micro-surgery of the middle ear (tympanoplasty, stapedotomy), larynx (microlaryngeal surgery) and sinuses; smaller incisions, better outcomes and fewer complications; video for teaching and documentation; better surgeon ergonomics. Training should include balancing, focusing, light intensity safety (avoid burns), cleaning optics, draping and daily checks."),
])
PATTERN = STANDARD
