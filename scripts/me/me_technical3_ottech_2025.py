"""ME Technical Paper III (Subject Specialisation Paper), OT Technologist, BCSE 2025 - real paper (PDF sent by the founder).
Own pattern from the paper: Part I 50 MCQ x 1; Part II 3 short answers x 10 = 30; Section B choose Case I or II (20).
The paper is for Operation Theatre (OT) Technologists; it is linked to the 'Occupational Therapy Technology' entry, the
closest in the list - the founder should confirm or rename it. Replaced MCQs: 17 and 48 (answer options were pictures
that cannot be shown as text) and 33 (vaporiser question with more than one arguable answer). MCQ 49's stem is restored
from the garbled PDF text. SAQ 3: answer any five of six short notes.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1"
GROUP_TAG = "ot2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "occupational-therapy-technology"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "OT Technologist"

MCQ = r"""[
{
"n": 1,
"stem": "To what pressure an endotracheal tube must be inflated to produce an adequate seal between the cuff and the wall of the trachea?",
"opts": [
">40 mm Hg",
"20-30 mm Hg",
"10-15 mm Hg",
"<20 mm Hg"
]
},
{
"n": 2,
"stem": "Which method should be used to open the airway in case of suspected C spine injury?",
"opts": [
"Jaw thrust",
"Back thrust",
"Abdominal thrust",
"Head tilt and chin lift"
]
},
{
"n": 3,
"stem": "Which of the following is known as laughing gas?",
"opts": [
"B₂O",
"CO₂",
"NO₂",
"N₂O"
]
},
{
"n": 4,
"stem": "What is the colour of nitrous oxide gas cylinder?",
"opts": [
"White",
"Black",
"Gray",
"Blue"
]
},
{
"n": 5,
"stem": "An intravenous solution of 0.45% sodium chloride is_____.",
"opts": [
"hypotonic",
"isomeric",
"hypertonic",
"isotonic"
]
},
{
"n": 6,
"stem": "“First, do no harm” is based on which ethical principle of health care?",
"opts": [
"Non-malfeasance",
"Fidelity",
"Accountability",
"Beneficence"
]
},
{
"n": 7,
"stem": "Most health-care-associated infections are transmitted to patients:",
"opts": [
"From the hands of the health care workers.",
"It’s from dirty washrooms.",
"From hospital food.",
"By talking to each other."
]
},
{
"n": 8,
"stem": "What should be the rate of compressions per minute while providing chest compressions in CPR?",
"opts": [
"100-120-per minute",
"80-100 per minute",
"60-80 per minute",
"70-90 per minute"
]
},
{
"n": 9,
"stem": "What is nephrectomy?",
"opts": [
"Surgical removal of kidney",
"Surgical removal of necrotic tissues",
"The surgical repair of a nerve",
"Surgical removal of a nerve"
]
},
{
"n": 10,
"stem": "______ is the site of giving spinal anaesthesia.",
"opts": [
"LI – L2",
"L2 – L3",
"L5 – L6",
"L3 – L4"
]
},
{
"n": 11,
"stem": "Anal and perianal procedures should be performed in which of the following positions?",
"opts": [
"Lateral",
"Lithotomy",
"Dorsal recumbent",
"Trendelenburg"
]
},
{
"n": 12,
"stem": "A small artery forceps used to hold small bleeders is called:",
"opts": [
"Babcock’s tissue forceps",
"Non-toothed dissecting forceps",
"Mosquito forceps",
"Allis tissue forceps"
]
},
{
"n": 13,
"stem": "In hospital, the infectious non-sharp waste i.e. soiled bandage, dressings, soiled cotton are disposed of in which colored containers?",
"opts": [
"red",
"black",
"blue",
"yellow"
]
},
{
"n": 14,
"stem": "Which of the following is NOT true regarding pulse oximeter?",
"opts": [
"It is used to measure O2 saturation in blood.",
"It is used to measure the saturation of all the gases in the blood.",
"Sensor probe can be clipped on the finger, toe or earlobe.",
"It is a very sensitive monitor."
]
},
{
"n": 15,
"stem": "The process that kills live bacteria as well as spores is",
"opts": [
"Disinfection",
"Sterilization",
"High level disinfection",
"None of the above"
]
},
{
"n": 16,
"stem": "Grey colour injection port cap of I.V cannula represents which of the following?",
"opts": [
"14 G",
"16 G",
"18 G",
"20 G"
]
},
{
"n": 17,
"stem": "Which of the following will be a probable difficult intubation?",
"opts": [
"b) c) d) c )",
"",
"",
""
]
},
{
"n": 18,
"stem": "The oxygen flush valve delivers oxygen at what flow rate?",
"opts": [
"1-5 L/min",
"10-15 L/min",
"35-75 L/min",
"100 L/min"
]
},
{
"n": 19,
"stem": "The pressure in an oxygen cylinder is approximately:",
"opts": [
"500 psi",
"1000 psi",
"2000 psi",
"5000 psi"
]
},
{
"n": 20,
"stem": "The most common type of anesthesia breathing circuit used in adults is:",
"opts": [
"Mapleson A",
"Mapleson D",
"Circle system",
"T-piece"
]
},
{
"n": 21,
"stem": "The minimum oxygen concentration required in an anesthesia gas mixture is:",
"opts": [
"10%",
"21%",
"25%",
"30%"
]
},
{
"n": 22,
"stem": "The pressure in the pipeline supply for medical gases is:",
"opts": [
"50 psi",
"100 psi",
"200 psi",
"500 psi"
]
},
{
"n": 23,
"stem": "Which of the following is a closed anesthesia breathing system?",
"opts": [
"Mapleson A",
"Mapleson D",
"Circle system",
"T-piece"
]
},
{
"n": 24,
"stem": "The most common type of endotracheal tube cuff is:",
"opts": [
"Low-volume, high-pressure",
"High-volume, low-pressure",
"Foam cuff",
"Uncuffed"
]
},
{
"n": 25,
"stem": "The size of an endotracheal tube is measured by its:",
"opts": [
"Length in cm",
"Internal diameter in mm",
"External diameter in mm",
"French gauge"
]
},
{
"n": 26,
"stem": "Which of the following is not a part of the anesthesia circuit?",
"opts": [
"Breathing bag",
"CO₂ absorber",
"Vaporizer",
"Endotracheal tube"
]
},
{
"n": 27,
"stem": "The fail-safe valve in an anesthesia machine is designed to:",
"opts": [
"Stop nitrous oxide flow if oxygen pressure drops",
"Increase oxygen flow automatically",
"Measure end-tidal CO₂",
"Activate the ventilator"
]
},
{
"n": 28,
"stem": "The most common cause of anesthesia machine malfunction is:",
"opts": [
"Empty oxygen cylinder",
"Disconnected circuit",
"Faulty vaporizer",
"Power failure"
]
},
{
"n": 29,
"stem": "The most common complication of high-pressure oxygen delivery is:",
"opts": [
"Barotrauma",
"Hypoxia",
"Hypercapnia",
"Hypothermia"
]
},
{
"n": 30,
"stem": "The Bourdon gauge is most accurate for measuring:",
"opts": [
"Very low pressures (<5 cm H₂O)",
"High pressures (e.g., cylinder pressures)",
"Gas flow rates in laminar conditions",
"Negative pressures (e.g., suction)"
]
},
{
"n": 31,
"stem": "In a rotameter, the float rises with increasing gas flow because of:",
"opts": [
"Decreased viscosity of the gas",
"Increased pressure downstream",
"Increased velocity of gas lifting the float",
"Magnetic repulsion between the float and tube"
]
},
{
"n": 32,
"stem": "The Hagen-Poiseuille equation applies to which type of gas flow?",
"opts": [
"Turbulent flow",
"Laminar flow",
"Transitional flow",
"Supersonic flow"
]
},
{
"n": 33,
"stem": "The performance of a plenum vaporizer is most affected by changes in:",
"opts": [
"Atmospheric pressure",
"Fresh gas flow rate",
"Temperature of the operating room",
"Humidity of the carrier gas"
]
},
{
"n": 34,
"stem": "Which type of vaporizer is designed to be agent-specific and cannot be used interchangeably between different volatile anesthetics?",
"opts": [
"Copper kettle vaporizer",
"Tec vaporizer",
"Goldman vaporizer",
"Boyle’s bottle"
]
},
{
"n": 35,
"stem": "What is the purpose of the splitting ratio in a variable bypass vaporizer?",
"opts": [
"To divide fresh gas flow between bypass and vaporizing chambers",
"To regulate the pressure of delivered anesthetic",
"To prevent backflow of anesthetic into the pipeline",
"To measure the temperature of the liquid agent"
]
},
{
"n": 36,
"stem": "Which safety feature prevents the use of an incorrect anesthetic agent in the vaporizer?",
"opts": [
"Color-coded bottles",
"Pin-index system",
"Agent-specific filling adapters",
"Pressure relief valve"
]
},
{
"n": 37,
"stem": "Which of the following is a pressure-controlled ventilation (PCV) mode?",
"opts": [
"Tidal volume is fixed, pressure varies",
"Inspiratory pressure is fixed, volume varies",
"Flow rate is constant throughout inspiration",
"Ventilation is triggered only by the patient"
]
},
{
"n": 38,
"stem": "The bellows in an anesthesia ventilator ascend during which phase?",
"opts": [
"Inspiration",
"Expiration",
"Both inspiration and expiration",
"PEEP application"
]
},
{
"n": 39,
"stem": "PEEP (Positive End-Expiratory Pressure) is used to:",
"opts": [
"Increase peak inspiratory pressure",
"Prevent alveolar collapse at end-expiration",
"Reduce tidal volume delivery",
"Enhance volatile anesthetic uptake"
]
},
{
"n": 40,
"stem": "The ideal temperature range for an OT as per standards is:",
"opts": [
"18–22°C",
"20–24°C",
"22–26°C",
"24–28°C"
]
},
{
"n": 41,
"stem": "Critical temperature is important for cylinder storage because:",
"opts": [
"It determines the pressure needed to liquefy a gas (e.g., CO₂ at 31°C)",
"It indicates flammability risk",
"It correlates with gas density",
"It predicts oxygen analyzer accuracy"
]
},
{
"n": 42,
"stem": "If a pressure-reducing valve fails, the most likely consequence is:",
"opts": [
"Gradual decrease in gas flow",
"Uncontrolled high-pressure gas delivery to the machine",
"Complete cessation of gas supply",
"Automatic switch to pipeline supply"
]
},
{
"n": 43,
"stem": "The i-gel differs from other SADs because it:",
"opts": [
"Requires an inflatable cuff",
"Has a built-in gastric drainage channel",
"Is made of thermoplastic elastomer (non-inflatable cuff)",
"Can only be used in pediatric patients"
]
},
{
"n": 44,
"stem": "The first step in reprocessing reusable anesthetic equipment is:",
"opts": [
"Sterilization",
"High-level disinfection",
"Thorough cleaning with detergent and water",
"Drying with compressed air"
]
},
{
"n": 45,
"stem": "For heat-sensitive equipment (e.g., fiberoptic bronchoscopes), the preferred method of sterilization is:",
"opts": [
"Dry heat",
"Ethylene oxide (ETO) gas",
"Boiling at 100°C",
"UV radiation"
]
},
{
"n": 46,
"stem": "Which chemical is commonly used for high-level disinfection of anesthetic equipment?",
"opts": [
"70% ethanol",
"2% glutaraldehyde",
"Household bleach",
"Povidone-iodine"
]
},
{
"n": 47,
"stem": "The Spaulding classification defines laryngoscope handles as:",
"opts": [
"Critical (must be sterile)",
"Semi-critical (require high-level disinfection)",
"Non-critical (cleaning alone suffices)",
"Single-use only"
]
},
{
"n": 48,
"stem": "Below is the cylinder yoke of the e-cylinder of various gases. As per the pin index system diagram shown below, which one belongs to the oxygen cylinder",
"opts": [
"b) c) d) ) following circuits does not have valve",
"",
"",
""
]
},
{
"n": 49,
"stem": "Which of the",
"opts": [
"Bains circuit",
"Magill circuit",
"Closed circuit",
"Mapleson E"
]
},
{
"n": 50,
"stem": "Oxygen was first synthesized by",
"opts": [
"WTG Morton",
"Pristley",
"Oliver Wendell homes",
"Valerius Cordus"
]
}
]"""

KEY = {
    1: ("b", "ETT cuff pressure is kept about 20-30 (cmH2O/mmHg range) to seal without mucosal ischaemia."), 2: ("a", "Use jaw thrust (no head tilt) if cervical spine injury is suspected."),
    3: ("d", "Nitrous oxide (N2O) is laughing gas."), 4: ("d", "Nitrous oxide cylinders are blue."),
    5: ("a", "0.45% sodium chloride is hypotonic."), 6: ("a", "'First, do no harm' is non-maleficence."),
    7: ("a", "Most healthcare-associated infections spread via health workers' hands."), 8: ("a", "Compressions at 100-120 per minute."),
    9: ("a", "Nephrectomy is removal of a kidney."), 10: ("d", "Spinal anaesthesia is usually given at L3-L4 (below the end of the cord)."),
    11: ("b", "Anal and perianal surgery is done in lithotomy (or prone jackknife)."), 12: ("c", "Mosquito forceps hold small bleeders."),
    13: ("d", "Infectious non-sharp waste goes in yellow containers."), 14: ("b", "Not true: pulse oximetry measures oxygen saturation of haemoglobin only."),
    15: ("b", "Sterilisation kills all microbes including spores."), 16: ("b", "Grey cannula = 16 G."),
    18: ("c", "The oxygen flush delivers 35-75 L/min."), 19: ("c", "A full oxygen cylinder is about 2000 psi (≈137 bar)."),
    20: ("c", "The circle system is the commonest adult breathing system."), 21: ("c", "Machines ensure at least about 25% oxygen in the delivered mixture (hypoxic guard)."),
    22: ("a", "Pipeline pressure is about 50 psi (4 bar)."), 23: ("c", "The circle system can be used closed."),
    24: ("b", "Modern ETT cuffs are high-volume, low-pressure."), 25: ("b", "ETT size = internal diameter in mm."),
    26: ("d", "The ETT is the airway device, not part of the breathing circuit."), 27: ("a", "The fail-safe valve shuts off N2O if oxygen pressure falls."),
    28: ("b", "Circuit disconnection is the commonest cause of machine-related incidents."), 29: ("a", "High-pressure gas can cause barotrauma."),
    30: ("b", "The Bourdon gauge measures high pressures such as cylinder pressure."), 31: ("c", "Gas flowing through the annular gap lifts the float."),
    32: ("b", "Hagen-Poiseuille applies to laminar flow."), 34: ("b", "Tec vaporisers are agent-specific, calibrated variable-bypass vaporisers."),
    35: ("a", "The splitting ratio divides fresh gas between bypass and vaporising chamber."), 36: ("c", "Agent-specific (keyed) filling adapters prevent wrong agents."),
    37: ("b", "In PCV the inspiratory pressure is fixed and volume varies."), 38: ("b", "Ascending (standing) bellows rise during expiration."),
    39: ("b", "PEEP prevents alveolar collapse at end-expiration."), 40: ("b", "OT temperature is usually kept about 20-24 °C."),
    41: ("a", "Above its critical temperature a gas cannot be liquefied by pressure (CO2 31 °C)."), 42: ("b", "A failed regulator lets high pressure through to the machine."),
    43: ("c", "The i-gel has a non-inflatable thermoplastic elastomer cuff."), 44: ("c", "Cleaning with detergent and water always comes first."),
    45: ("b", "Heat-sensitive equipment is sterilised with ethylene oxide (or low-temperature plasma)."), 46: ("b", "2% glutaraldehyde is used for high-level disinfection."),
    47: ("c", "Laryngoscope handles are classed non-critical (blades are semi-critical)."), 49: ("d", "Mapleson E (Ayre's T-piece) has no valve."),
    50: ("b", "Joseph Priestley isolated oxygen in 1774 (Scheele independently)."),
}
FIX = {49: {"stem": "Which of the following circuits does not have a valve?"}}
T = TOPIC
Q = mcqs(MCQ, KEY, T, FIX) + [
    new_mcq(1, T, "A Mallampati class IV view (only the hard palate visible) predicts", ["Easy mask ventilation", "Possible difficult intubation", "Normal laryngoscopy", "Need for spinal anaesthesia"], "b",
            "Higher Mallampati classes (III-IV) predict difficult laryngoscopy and intubation."),
    new_mcq(2, T, "In the pin index safety system, the pin positions for an oxygen cylinder are", ["1 and 5", "2 and 5", "3 and 5", "1 and 6"], "b",
            "Oxygen 2-5; nitrous oxide 3-5; medical air 1-5; carbon dioxide 1-6."),
    new_mcq(3, T, "Modern variable-bypass vaporisers maintain a steady output when room temperature changes because they have", ["A pin index system", "Automatic temperature compensation (e.g. bimetallic strip)", "A pressure relief valve", "An oxygen failure alarm"], "b",
            "Temperature-compensating mechanisms alter the splitting ratio as the agent cools or warms."),
    saq(1, T, """The figure shows equipment used in the anaesthesia workstation.
a) Identify the equipment. (1 mark)
b) Describe where it is used and its mechanism. (4 marks)
c) What are the problems in its use, and its safety features? (5 marks)""",
        [("a) Pressure regulator (pressure-reducing valve)", 1), ("b) Use: between cylinder and machine (also pipeline/ second stage) to reduce high, variable cylinder pressure to constant low pressure (~45-60 psi); mechanism: spring force on diaphragm balances outlet pressure, valve opens/closes (P x A = F)", 4), ("c) Problems: failure/ leak, high pressure delivery, ice formation, fire (oil/grease), diaphragm rupture, wrong regulator; safety: relief valve, gauge, pin index/ gas-specific, oil-free, sintered filter, colour coding", 5)],
        """a) A pressure regulator (pressure-reducing valve).
b) It is fitted between a gas cylinder and the anaesthetic machine (on the machine yoke or cylinder head), and as second-stage regulators within the machine. It reduces the high and falling cylinder pressure (e.g. about 2000 psi for oxygen) to a constant low working pressure (about 45-60 psi/4 bar) so flowmeters receive a steady supply. Mechanism: high-pressure gas enters through a valve controlled by a diaphragm attached to a spring. The spring force (F) pushes the valve open; gas pressure in the low-pressure chamber (P) acts on the diaphragm area (A). When P x A exceeds F, the diaphragm rises and closes the valve; as gas is used and pressure falls, the spring reopens it - so outlet pressure stays constant (P = F/A).
c) Problems: diaphragm rupture or valve failure can pass high pressure to the machine (barotrauma, damage); leaks; ice formation from cooling as gas expands; fire or explosion if oil or grease contacts high-pressure oxygen; dust blocking the valve; wrong regulator on a cylinder. Safety features: pressure relief (safety) valve on the low-pressure side; pressure gauge; gas-specific connections and pin index system; colour coding; non-interchangeable fittings; oil-free design and sintered filter at the inlet; regular servicing."""),
    saq(2, T, """On anaesthesia breathing systems:
a) Describe the Mapleson classification of breathing systems and their uses. (5 marks)
b) Describe the properties of an ideal breathing system. (3 marks)
c) List the components of a breathing system. (2 marks)""",
        [("a) Mapleson A (Magill/ Lack) - best for spontaneous breathing; B and C (rarely used, C for transport/ resuscitation); D (Bain) - best for controlled ventilation; E (Ayre's T-piece) - children; F (Jackson-Rees) - paediatric; with FGF requirements", 5), ("b) Ideal: low resistance and dead space, efficient (low FGF, no rebreathing of CO2), humidify/ warm, light, simple, safe, allow spontaneous and controlled ventilation, scavenging, easy to sterilise, adult and paediatric", 3), ("c) Components: fresh gas inlet, reservoir bag, corrugated tubing, APL (expiratory) valve, connectors/ catheter mount, face mask/ ETT connection; circle adds CO2 absorber and unidirectional valves", 2)],
        """a) Mapleson classified semi-open (non-rebreathing) systems by the position of the fresh gas inlet, reservoir bag, tubing and APL valve: A (Magill; coaxial Lack) - most efficient for spontaneous breathing (FGF about equal to minute volume, ~70-80 mL/kg/min) but poor for controlled ventilation. B and C - fresh gas and valve near the patient; inefficient; C (Waters) is used for short-term manual ventilation and resuscitation/transport. D (Bain coaxial) - most efficient for controlled ventilation (FGF about 70 mL/kg/min); needs 2-3 times minute volume for spontaneous breathing. E (Ayre's T-piece) - no valve or bag, low resistance, for children under about 20-25 kg. F (Jackson-Rees modification of E with an open-tailed bag) - paediatric anaesthesia, allows monitoring and assisting ventilation.
b) An ideal system: delivers the intended gas mixture accurately; is efficient (low fresh gas flow without CO2 rebreathing); has low resistance and dead space; conserves heat and humidity; is lightweight, simple and safe (no disconnection, little leak); suits both spontaneous and controlled ventilation and both adults and children; allows scavenging of waste gases; and is easy to clean or disposable.
c) Fresh gas inlet/flow, reservoir (breathing) bag, corrugated breathing tubing, adjustable pressure-limiting (expiratory) valve, connectors and catheter mount to the face mask or tracheal tube; a circle system also has a CO2 absorber and unidirectional inspiratory and expiratory valves (plus filters/HME)."""),
    saq(3, T, """Write short notes on any FIVE of the following six. Each carries 2 marks.
(i) Sellick's manoeuvre
(ii) IV fluids
(iii) Prevention of fire in the OR
(iv) Supraglottic airway
(v) Blood groups
(vi) Bispectral index (BIS)""",
        [("Any five short notes, 2 marks each: accurate definition/ purpose plus key points (technique, types, precautions)", 10)],
        """(i) Sellick's manoeuvre (cricoid pressure): backward pressure on the cricoid cartilage (about 10 N while awake, 30 N after loss of consciousness) to compress the oesophagus against the vertebra during rapid sequence induction, to reduce regurgitation and aspiration; released if it hinders intubation or if the patient is actively vomiting.
(ii) IV fluids: crystalloids (normal saline, Ringer's lactate/Hartmann's, dextrose solutions) and colloids (gelatins, starches, albumin) used for maintenance, replacement of losses and resuscitation; isotonic, hypotonic or hypertonic; monitor volume, electrolytes and signs of overload; warm fluids in major surgery.
(iii) Prevention of fire in the OR: the fire triangle - oxidiser (oxygen, N2O), ignition (diathermy, lasers, light sources) and fuel (drapes, alcohol preps, hair); reduce oxygen near the field, let alcohol preps dry, use wet sponges and laser-safe tubes, place diathermy correctly and keep fire extinguishers ready with a fire drill plan.
(iv) Supraglottic airway: devices that sit above the glottis to maintain an airway without entering the trachea, e.g. LMA classic, ProSeal, i-gel; used for routine anaesthesia and difficult airway rescue; quick to insert, but limited protection against aspiration.
(v) Blood groups: ABO system (A, B, AB, O with natural antibodies) and Rh (D) system; group O negative is the universal red cell donor and AB the universal plasma donor/recipient; grouping and cross-matching before transfusion prevent haemolytic reactions.
(vi) Bispectral index (BIS): a processed EEG monitor giving a number 0-100 for depth of anaesthesia; 40-60 indicates adequate general anaesthesia; helps reduce awareness and excessive anaesthetic dosing; affected by artefacts and some drugs (ketamine, N2O)."""),
]
C1 = """Case I: Preparing the theatre for an emergency laparotomy
You are the senior OT Technologist on duty when a 45-year-old man, Mr Hodo, is rushed into the emergency department with signs of septic shock and acute abdominal rigidity. A provisional diagnosis of a perforated viscus (likely duodenal ulcer) is made, and the surgical team declares an emergency exploratory laparotomy. The patient is being resuscitated and will be transferred to the OT within 30 minutes. Detail the comprehensive, systematic preparation you would undertake in the operating theatre."""
C2 = """Case II: Contaminated gauze during laparoscopic cholecystectomy
You are the senior OT Technologist in a busy general surgery theatre. During a laparoscopic cholecystectomy, a stack of sterile gauze (intended for the procedure) falls onto the visibly soiled floor near the scrub nurse's feet. The circulating nurse quickly picks it up, places it back on the sterile instrument table and says, "It's fine, we'll use it if needed." The surgeon and anaesthetist are focused on the patient and do not notice. The patient has a BMI of 35 and a history of diabetes."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("ot2025", 1, T, C1, items=[
    it("a) Preoperative theatre readiness", 6,
       [("Theatre/ table ready: clean OT, positioning aids, warming (warm room, warming blanket/ fluid warmer)", 2), ("Anaesthesia: machine and suction checked, airway equipment for RSI (cuffed tubes, bougie, video laryngoscope), drugs (induction, vasopressors, antibiotics), monitoring (arterial line, CVP), IV lines/ pressure bags", 2), ("Surgical: laparotomy set, instruments, sutures, diathermy, suction, warm saline for lavage, swabs counted; blood products requested", 2)],
       "Prepare a clean, ready theatre: check the anaesthesia machine (leak test, gases, vaporisers, ventilator, suction working), airway equipment for rapid sequence induction (range of cuffed tubes, bougie, video laryngoscope, suction, difficult airway trolley), and monitoring (ECG, SpO2, NIBP, EtCO2, temperature, invasive arterial and central venous lines). Prepare drugs - induction agents, muscle relaxants for RSI, vasopressors (noradrenaline, adrenaline), antibiotics, fluids and warmers, and confirm cross-matched blood is ready. Surgical side: major laparotomy set, retractors, suction, diathermy, sutures, warm saline for peritoneal lavage, drains, swabs and instruments counted. Set up the operating table with positioning aids, warming mattress and forced-air warmer, and raise room temperature to prevent hypothermia in a septic patient."),
    it("b) Infection control and sterilisation", 4,
       [("Sterile instruments verified (indicators, packs intact, expiry), aseptic technique, scrubbing/ gowning", 2), ("Theatre cleanliness, traffic control, prophylactic/ therapeutic antibiotics timing, skin prep, handling contaminated (dirty case) waste/ instruments afterwards, terminal cleaning", 2)],
       "Use only sterile instruments and supplies - check sterility indicators, pack integrity and expiry dates; maintain strict aseptic technique with surgical hand scrub, gowns and gloves, and a correctly laid-out sterile field. Limit traffic and keep doors closed; ensure skin preparation and draping; give antibiotics as prescribed before incision. As a contaminated (dirty) case, plan safe handling and disposal of peritoneal fluid, waste and linen, separate soiled instruments for decontamination, and carry out thorough terminal cleaning of the theatre afterwards."),
    it("c) Team coordination and communication", 4,
       [("Brief the team: surgeon, anaesthetist, nurses, technicians - roles, plan, equipment, anticipated problems; WHO surgical safety checklist (sign in, time out, sign out)", 2), ("Communication with ED/ ICU, blood bank, lab; closed-loop communication; handover; documentation", 2)],
       "Hold a quick team briefing with surgeon, anaesthetist, scrub and circulating nurses and technicians to agree roles, the plan, special equipment and anticipated problems (shock, difficult airway, massive bleeding). Use the WHO Surgical Safety Checklist (sign in, time out, sign out). Keep in contact with the emergency department about the patient's condition and arrival time, with the blood bank and laboratory, and with the ICU for a post-operative bed. Use clear, closed-loop communication during the case, and give a structured handover (e.g. SBAR) and complete documentation."),
    it("d) Safety and contingency measures", 6,
       [("Patient safety: identification, consent, allergies, aspiration risk (RSI, NG tube), positioning/ pressure care, diathermy pad, counts", 2), ("Haemodynamic contingency: vasopressors, massive transfusion/ rapid infuser, defibrillator, emergency drugs; difficult airway plan", 2), ("Equipment/ system backup: backup oxygen cylinders, power (UPS), suction, spare equipment; ICU plan, staff safety (PPE, sharps)", 2)],
       "Patient safety: confirm identity, procedure and consent; check allergies; plan rapid sequence induction for aspiration risk (NG tube, cricoid pressure); careful positioning and pressure-area care; correct diathermy pad placement; swab, sharp and instrument counts. Haemodynamic contingencies: vasopressors and inotropes ready, defibrillator and resuscitation trolley, rapid infuser/pressure bags, a massive transfusion plan, and a difficult/failed airway plan. Equipment backups: spare oxygen cylinders, backup suction, UPS/generator power, spare laryngoscope and monitoring cables. Staff safety: PPE, safe sharps handling, and exposure precautions. Plan post-operative ICU care and arrange extra staff if needed."),
])
Q += case("ot2025", 2, T, C2, items=[
    it("a) Identify THREE immediate risks to the patient arising from this situation.", 6,
       [("Surgical site infection (contaminated gauze), especially with obesity and diabetes", 2), ("Contamination of the whole sterile field/ instruments - intra-abdominal infection, sepsis", 2), ("Others: retained foreign body/ count errors (gauze added/ removed), delayed healing, delay/ prolonged anaesthesia if field must be re-set", 2)],
       "1. Surgical site infection - contaminated gauze carries microorganisms from the floor into the wound or abdomen; obesity (BMI 35) and diabetes greatly increase infection risk and impair healing. 2. Contamination of the whole sterile field - the gauze has touched the sterile table and other instruments, risking intra-abdominal infection, abscess or sepsis. 3. Swab count errors and retained foreign body - items moved on and off the table outside procedure upset the count; also longer operation and anaesthesia time if the field must be re-set, adding risk."),
    it("b) Describe FOUR specific actions you would take to mitigate these risks.", 6,
       [("Speak up immediately (stop the use), inform the surgeon/ team - 'stop the line'", 1.5), ("Remove the gauze and anything it touched; consider re-setting/ replacing sterile table items, change gloves", 1.5), ("Recount swabs/ instruments and document; replace with new sterile packs", 1.5), ("Report incident (incident reporting system), monitor patient for infection, inform team for post-op antibiotics/ wound surveillance", 1.5)],
       "1. Speak up immediately and assertively - tell the scrub nurse, circulating nurse and surgeon that the gauze is contaminated and must not be used ('stop' principle). 2. Remove the contaminated gauze and treat everything it contacted as contaminated - replace affected instruments or re-drape/re-set the instrument table area, and have the scrub team change gloves if they handled it. 3. Open fresh sterile gauze, adjust and verify the swab count and record it so no item is lost or retained. 4. Document and report the incident through the incident reporting system and inform the surgeon so post-operative wound monitoring (and prophylactic antibiotic review) can be planned for this high-risk patient."),
    it("c) Explain ONE long-term strategy to prevent similar incidents.", 4,
       [("Strategy explained: regular aseptic technique/ infection control training and competency assessment, culture of safety (speaking up, no-blame), clear SOPs (dropped items never reused), audits and feedback, checklist use", 4)],
       "Introduce regular training and competency assessment for all theatre staff on aseptic technique and sterile field management, with a clear written policy that anything dropped is never returned to the sterile field, supported by a culture of safety in which everyone - whatever their rank - is encouraged to speak up without blame. Reinforce it through regular audits of practice, incident review with feedback, and use of the WHO Surgical Safety Checklist and team briefings."),
    it("d) Justify your decisions using evidence-based guidelines.", 4,
       [("Cites guidelines: WHO SSI prevention guidelines, AORN/ CDC aseptic technique (items below table level/ dropped are unsterile), WHO Surgical Safety Checklist, patient safety/ incident reporting principles", 2), ("Links to evidence: contaminated items increase SSI; obesity/ diabetes risk factors; speaking up reduces errors; counts prevent retained items", 2)],
       "AORN and CDC/WHO guidance on aseptic technique state that any sterile item that falls below table level or touches an unsterile surface is contaminated and must not be returned to the sterile field. WHO Global Guidelines for the Prevention of Surgical Site Infection identify contamination, obesity and diabetes (hyperglycaemia) as major risk factors, so strict asepsis is essential. The WHO Surgical Safety Checklist and patient safety principles support speaking up, team communication and accurate counts to prevent retained items. Incident reporting and learning systems (WHO patient safety framework) help prevent recurrence. Therefore removing the gauze, re-establishing sterility, recounting and reporting are evidence-based and protect the patient."),
])
for q in Q:
    if q["key"] in ("S1", "S2", "S3"): q["marks"] = 10
    if q["key"] == "S1": q["image"] = "/papers/me/tech3-ot-2025-regulator.png"
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 50, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions", "type": "short_answer", "count": 3, "marks_each": 10, "answer_any": None},
    {"title": "Section B: Case study (answer either Case I or Case II)", "type": "passage", "count": 2, "marks_each": 20, "answer_any": 1},
]
