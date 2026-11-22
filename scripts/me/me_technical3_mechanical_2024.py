"""ME Technical Paper III (Subject Specialisation Paper), Mechanical Engineering, BCSE 2024 - real paper (PDF sent by the founder).
Standard pattern, same as the 2025 Mechanical Engineering paper (the latest). Formula options of MCQs 2, 4, 15, 21, 25 and 29
were pictures in the PDF and are re-typed. MCQs replaced: 9 (soldering and brazing both melt a filler), 12 (the main pouring
channel is the sprue, not listed), 16 (a four-stroke engine has one power stroke every two revolutions - not listed) and 28
(plate and air-cooled are both used in cars). The paper prints the second case as "CASE I" again; it is Case II here.
Part II question 1 uses the screw-jack picture (public/papers/me/tech3-mech-2024-screwjack.png).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1"
GROUP_TAG = "mech2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "mechanical-engineering"
ADDS_TO_PAPER = True  # 2025 is the latest Mechanical Engineering paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Mechanical Engineering"

MCQ = r"""[
{
"n": 1,
"stem": "Topology optimization (printed as 'Typology') in modern engineering design refers to:",
"opts": [
"Reducing the number of components in a design",
"Enhancing the visual aesthetics of a product",
"Optimizing material distribution within a given design space",
"Simplifying the design process for a product"
]
},
{
"n": 2,
"stem": "The polar moment of inertia of a hollow shaft with inner and outer diameters di and do respectively is:",
"opts": [
"(π/32)(do - di)",
"(π/32)(do² - di²)",
"(π/32)(do³ - di³)",
"(π/32)(do⁴ - di⁴)"
]
},
{
"n": 3,
"stem": "Which of the following production system has the ability to produce highly customized products with minimal lead times?",
"opts": [
"Mass production system",
"Lean manufacturing system",
"Agile manufacturing system",
"Batch production system"
]
},
{
"n": 4,
"stem": "A man falling down from a height “h” starts rotating mid-way of his fall. The vertical velocity with which he will touch the ground will be:",
"opts": [
"= √(2gh)",
"< √(2gh)",
"> √(2gh)",
"= 0"
]
},
{
"n": 5,
"stem": "The process of removing oxygen from metal ores is called:",
"opts": [
"Smelting",
"Annealing",
"Tempering",
"Galvanizing"
]
},
{
"n": 6,
"stem": "The value of one bar (in SI units) is equal to:",
"opts": [
"100 N/m2",
"1×104 N/m2",
"1000 N/m2",
"1×105 N/m2"
]
},
{
"n": 7,
"stem": "The ratio of inertia force to viscous force is referred to as:",
"opts": [
"Reynolds Number",
"Prandtl Number",
"Nusselt Number",
"Froude Number"
]
},
{
"n": 8,
"stem": "With increase in pressure,",
"opts": [
"enthalpy of dry saturated steam increases",
"enthalpy of dry saturated steam decreases",
"enthalpy of dry saturated steam remains same",
"enthalpy of dry saturated steam first increases and then decreases"
]
},
{
"n": 9,
"stem": "In _______ process, metals are joined by melting a filler metal between them:",
"opts": [
"Soldering",
"Brazing",
"Welding",
"Riveting"
]
},
{
"n": 10,
"stem": "When a belt drive is transmitting maximum power:",
"opts": [
"effective tension is equal to the centrifugal tension",
"effective tension is half of the centrifugal tension",
"driving tension in slack side is equal to the centrifugal tension",
"driving tension in tight side is twice the centrifugal tension"
]
},
{
"n": 11,
"stem": "Which one of the following statements is correct?",
"opts": [
"Evaporative cooling and sensible cooling are the same",
"Evaporative cooling is a cooling and humidification process",
"Evaporative cooling is a cooling and dehumidification process",
"Evaporative cooling is not effective for hot and dry climates"
]
},
{
"n": 12,
"stem": "In a casting process, the main channel through which molten metal is poured is referred to as:",
"opts": [
"Runner",
"Riser",
"Vent",
"Cavity"
]
},
{
"n": 13,
"stem": "In SI units, the value of the universal gas constant is",
"opts": [
"8.314 J/mole/K",
"83.14 J/mole/K",
"831.4 J/mole/K",
"8314 J/mole/K."
]
},
{
"n": 14,
"stem": "In Programmable Logic Controller, the primary function of a ladder diagram is:",
"opts": [
"To control the physical layout of the system",
"To represent electrical connections",
"To provide a graphical representation of the control logic",
"To document the hardware specification"
]
},
{
"n": 15,
"stem": "Force required to punch a hole of diameter d in a metal plate of thickness t is equal to ________, where τu = ultimate shear strength of the plate material.",
"opts": [
"π·d·t·τu",
"π²·d·t·τu",
"(π/4)·d²·τu",
"(π/4)·d²·t·τu"
]
},
{
"n": 16,
"stem": "The number of power strokes per revolution of the crankshaft in a four-stroke engine is:",
"opts": [
"1",
"2",
"4",
"8"
]
},
{
"n": 17,
"stem": "Which of the following is a thermosetting plastic?",
"opts": [
"Polyethylene",
"Polystyrene",
"Bakelite",
"Polyvinyl chloride"
]
},
{
"n": 18,
"stem": "In Computer-Aided Design, parametric modeling refers to ___________.",
"opts": [
"Modelling based on fixed dimensions",
"Modelling where dimensions can be changed and the model updates accordingly",
"2D modelling only",
"Modelling without constraints"
]
},
{
"n": 19,
"stem": "Which type of sensor is most commonly used in automation for distance measurement?",
"opts": [
"Thermocouple",
"Ultrasonic sensor",
"Pressure sensor",
"Proximity sensor"
]
},
{
"n": 20,
"stem": "The term \"cyber-physical systems\" refers to?",
"opts": [
"The integration of software into physical machines",
"The use of AI in mechanical engineering",
"Systems where mechanical and electronic components are deeply integrated with networked software",
"Robotic systems that operate without human intervention"
]
},
{
"n": 21,
"stem": "In transverse fillet welded joint, the size of weld is equal to:",
"opts": [
"Throat of weld / √2",
"√(2 × Throat of weld)",
"√2 × Throat of weld",
"2 × Throat of weld"
]
},
{
"n": 22,
"stem": "What is the role of an actuator in automation?",
"opts": [
"To sense the environment",
"To process data",
"To convert electrical signals into mechanical movement",
"To control the flow of data"
]
},
{
"n": 23,
"stem": "A rivet is specified by",
"opts": [
"shank diameter",
"length of rivet",
"type of head",
"length of tail"
]
},
{
"n": 24,
"stem": "Which of the following manufacturing processes is classified as a subtractive process?",
"opts": [
"3D Printing",
"Casting",
"Machining",
"Forging"
]
},
{
"n": 25,
"stem": "For a typical disc clutch, W = axial force with which the friction surfaces are held together, μ = coefficient of friction and R = mean radius of the friction surfaces. The torque developed by the clutch is given by:",
"opts": [
"T = μ·W·R",
"T = ½·μ·W·R",
"T = ¾·μ·W·R",
"T = ¼·μ·W·R"
]
},
{
"n": 26,
"stem": "Which manufacturing technique involves the layer-by-layer addition of material to create a product?",
"opts": [
"Subtractive machining",
"Forging",
"Additive manufacturing",
"Casting"
]
},
{
"n": 27,
"stem": "The taper on cotter varies from:",
"opts": [
"1 in 15 to 1 in 10",
"1 in 32 to 1 in 24",
"1 in 24 to 1 in 20",
"1 in 48 to 1 in 24"
]
},
{
"n": 28,
"stem": "Which type of heat exchanger is commonly used in compact and efficient designs for automotive applications?",
"opts": [
"Shell and tube",
"Plate",
"Air-cooled",
"Double-pipe"
]
},
{
"n": 29,
"stem": "A flanged pipe joint will be leakproof if the circumferential pitch of the bolts is _______, where d is the diameter of the bolts.",
"opts": [
"< 20√d",
"> 20√d",
"between 20√d and 30√d",
"> 30√d"
]
},
{
"n": 30,
"stem": "________ are commonly used in the aerospace industry due to its high strength-to-weight ratio and resistance to fatigue?",
"opts": [
"Titanium alloys",
"Cast irons",
"Coppers",
"Polystyrenes"
]
}
]"""

KEY = {
    1: ("c", "Topology optimisation finds the best distribution of material within a design space for given loads and constraints."),
    2: ("d", "J = π(do⁴ - di⁴)/32 for a hollow circular shaft."),
    3: ("c", "Agile manufacturing responds quickly to customised demand with short lead times."),
    4: ("a", "Rotation does not change the vertical motion of the centre of mass: v = √(2gh)."),
    5: ("a", "Smelting reduces ore (removes oxygen) with heat and a reducing agent."),
    6: ("d", "1 bar = 10⁵ N/m² (100 kPa)."),
    7: ("a", "Reynolds number = inertia force / viscous force."),
    8: ("d", "The enthalpy of dry saturated steam rises with pressure up to about 30 bar, then falls."),
    10: ("d", "For maximum power, centrifugal tension Tc = T/3, so the tight-side driving tension T1 = T - Tc = 2Tc."),
    11: ("b", "Evaporative cooling lowers dry-bulb temperature while adding moisture: cooling and humidification."),
    13: ("a", "R = 8.314 J/(mol·K)."),
    14: ("c", "A ladder diagram represents the PLC control logic graphically, like relay circuits."),
    15: ("a", "Shear area = πdt, so F = π·d·t·τu."),
    17: ("c", "Bakelite is a thermosetting plastic; the others are thermoplastics."),
    18: ("b", "In parametric modelling, changing a dimension or parameter updates the model."),
    19: ("b", "Ultrasonic sensors measure distance from echo time."),
    20: ("c", "Cyber-physical systems tightly integrate physical machines and electronics with networked software."),
    21: ("c", "For a 45° fillet weld, throat = 0.707 x size, so size = √2 x throat."),
    22: ("c", "An actuator converts control (electrical) signals into mechanical motion."),
    23: ("a", "A rivet is specified by its shank diameter."),
    24: ("c", "Machining removes material, so it is subtractive."),
    25: ("a", "With uniform wear, T = μ·W·R (per pair of friction surfaces), R being the mean radius."),
    26: ("c", "Additive manufacturing (3D printing) builds parts layer by layer."),
    27: ("d", "The taper on a cotter is usually 1 in 48 to 1 in 24."),
    29: ("c", "For a leakproof flanged joint, the bolt pitch is kept between 20√d and 30√d."),
    30: ("a", "Titanium alloys have high strength-to-weight ratio and fatigue resistance."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "In which joining process is the filler metal melted above 450 °C, without melting the base metals?", ["Soldering", "Brazing", "Fusion welding", "Riveting"], "b",
            "Brazing uses a filler that melts above 450 °C but below the base metals' melting point; soldering is below 450 °C."),
    new_mcq(2, T, "In a sand casting gating system, the vertical channel through which molten metal first flows down from the pouring basin is the", ["Sprue", "Runner", "Riser", "Vent"], "a",
            "The sprue carries metal down from the pouring basin; runners distribute it horizontally to the gates."),
    new_mcq(3, T, "In a single-cylinder four-stroke engine, one power stroke occurs every", ["Half revolution", "One revolution", "Two revolutions", "Four revolutions"], "c",
            "The four-stroke cycle takes two crankshaft revolutions, with one power stroke."),
    new_mcq(4, T, "Car radiators are typically which type of heat exchanger?", ["Compact cross-flow (tube-and-fin) heat exchanger", "Shell and tube", "Double pipe", "Regenerative storage type"], "a",
            "Radiators are compact cross-flow tube-and-fin exchangers: coolant in tubes, air across the fins."),
]

SA = [
    ("Following are the data relating to the screw jack shown: pitch of the threaded screw = 8 mm; diameter of the threaded screw = 40 mm; coefficient of friction between screw and nut = 0.1; load = 20 kN. Assuming that the load rotates with the screw, determine:\na) The ratio of the torques required to raise and lower the load. (3 marks)\nb) The efficiency of the machine. (2 marks)", "/papers/me/tech3-mech-2024-screwjack.png",
     [("a) tan α = p/(πd) = 8/(π x 40) = 0.0637; μ = tan φ = 0.1; T raise = W tan(α + φ) d/2 = 65.9 N·m; T lower = W tan(φ - α) d/2 = 14.4 N·m (no collar friction as load rotates)", 2),
      ("a) Ratio = tan(α + φ)/tan(φ - α) = 0.1647/0.0361 ≈ 4.56", 1),
      ("b) η = tan α/tan(α + φ) = 0.0637/0.1647 ≈ 38.7%", 2)],
     "a) Taking 40 mm as the mean diameter: tan α = p/(π d) = 8/(π x 40) = 0.0637; tan φ = μ = 0.1. Because the load rotates with the screw, there is no collar friction. Torque to raise: T1 = W tan(α + φ) d/2, with tan(α + φ) = (0.0637 + 0.1)/(1 - 0.0637 x 0.1) = 0.1647, so T1 = 20 000 x 0.1647 x 0.020 = 65.9 N·m. Torque to lower: T2 = W tan(φ - α) d/2, with tan(φ - α) = (0.1 - 0.0637)/(1 + 0.0637 x 0.1) = 0.0361, so T2 = 20 000 x 0.0361 x 0.020 = 14.4 N·m. Ratio T1/T2 = 0.1647/0.0361 ≈ 4.56.\nb) Efficiency η = tan α/tan(α + φ) = 0.0637/0.1647 = 0.387, about 38.7% (less than 50%, so the screw is self-locking - φ > α)."),
    ("Answer the following:\na) What is meant by firing order in an internal combustion engine? (2 marks)\nb) What firing orders are used in 4- and 6-cylinder inline engines? (3 marks)", None,
     [("a) Firing order: sequence in which the cylinders deliver power strokes; chosen for balance, even torque, cooling, reduced vibration and crankshaft stress", 2),
      ("b) 4-cylinder inline: 1-3-4-2 (or 1-2-4-3); 6-cylinder inline: 1-5-3-6-2-4 (or 1-4-2-6-3-5)", 3)],
     "a) The firing order is the sequence in which the cylinders of a multi-cylinder engine fire (deliver their power strokes). It is chosen so that power impulses are evenly spaced, the engine is well balanced with less vibration, crankshaft and bearing loads are reduced, and heat is spread evenly for cooling.\nb) 4-cylinder inline engines: 1-3-4-2 (most common) or 1-2-4-3. 6-cylinder inline engines: 1-5-3-6-2-4 (most common) or 1-4-2-6-3-5."),
    ("Answer the following:\na) Explain the two types of dry friction. (2.5 marks)\nb) Explain two types of friction besides dry friction. (2.5 marks)", None,
     [("a) Static friction (limiting friction before motion starts, μs) and kinetic/ dynamic friction (sliding friction during motion, μk < μs); also rolling friction as a form", 2.5),
      ("b) Fluid (viscous) friction - between layers of fluid/ lubricated surfaces fully separated; boundary (thin-film) friction - partial lubrication; or internal/ skin friction", 2.5)],
     "a) Dry (Coulomb) friction between unlubricated surfaces is of two types: static friction - the resisting force before motion starts, up to the limiting value F = μs N; and kinetic (dynamic) friction - the resisting force while surfaces slide, F = μk N, usually smaller than static friction (rolling friction, the resistance when a body rolls, is also often listed).\nb) Besides dry friction: fluid (viscous) friction - when surfaces are completely separated by a lubricant film, resistance comes from the shearing of fluid layers, depending on viscosity and speed (as in hydrodynamic bearings); and boundary (greasy/ thin-film) friction - when only a very thin layer of lubricant is present, so asperities partly touch, giving friction between dry and fluid values."),
    ("A welded platform top is made of 20 mm steel plates requiring 10 joints of 1 m length each, welded from one side only with semi-automatic submerged arc welding using a 4 SWG electrode. Labour charges are Nu 50 per hour. The electrode length required per metre run is 2.5 m and it costs Nu 25 per metre. Power consumption is 6.0 kWh per metre of weld at Nu 5 per kWh. The time to weld 1 m is 18 minutes. Assuming overhead charges of Nu 25 per hour, electrode loss of 5% due to spatter and vaporisation, and a fatigue allowance of 30% for the welder, calculate the cost of welding.", None,
     [("Time: 10 m x 18 min = 180 min = 3 h; with 30% fatigue allowance 3.9 h → labour 3.9 x 50 = Nu 195; overhead 3.9 x 25 = Nu 97.5", 2),
      ("Electrode: 10 x 2.5 = 25 m; with 5% loss 25/0.95 = 26.3 m x Nu 25 = Nu 658 (≈ Nu 656 if 25 x 1.05)", 1.5),
      ("Power: 6 x 10 = 60 kWh x Nu 5 = Nu 300; total ≈ Nu 1250", 1.5)],
     "Total weld length = 10 joints x 1 m = 10 m. Time: 10 x 18 = 180 minutes = 3.0 h; with a 30% fatigue allowance, time = 3.0 x 1.30 = 3.9 h. Labour cost = 3.9 x 50 = Nu 195.00. Overhead = 3.9 x 25 = Nu 97.50. Electrode: 2.5 m per metre x 10 = 25 m needed in the weld; allowing 5% loss, electrode used = 25/0.95 = 26.32 m, cost = 26.32 x 25 = Nu 657.90. Power: 6.0 x 10 = 60 kWh x Nu 5 = Nu 300.00. Total cost of welding = 195.00 + 97.50 + 657.90 + 300.00 = Nu 1250.40 (about Nu 1249 if the loss is taken as 25 x 1.05 = 26.25 m)."),
]
for i, (s, img, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=5, topic=T, stem=s, key_points=kp, model=mod, image=img))

C1 = """Case I: Maintenance management
Maintenance management is one of the key responsibilities of a mechanical engineer recruited in industries and plants. Describe what you understand about each of the following, and their likely benefits and challenges in implementation."""
C2 = """Case II: Machining and inventory management
(i) Machining removes material from the workpiece to produce a specific geometry at a definite degree of accuracy and surface quality; the process has evolved significantly over time. (ii) Inventory management keeps the right materials and spares available at the lowest total cost."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("mech2024", 1, T, C1, items=[
    it("i. Types of maintenance system.", 10,
       [("Breakdown/ corrective (run-to-failure)", 2), ("Preventive/ scheduled (time- or usage-based)", 2), ("Predictive/ condition-based (vibration, oil, thermography)", 2), ("Others: proactive/ RCM, opportunistic, design-out", 1),
        ("Benefits and challenges of each (cost, downtime, data/ skills, spares)", 3)],
       """(1) Breakdown (corrective/ reactive) maintenance - equipment runs until it fails and is then repaired; low planning cost and suitable for cheap, non-critical items, but causes unplanned downtime, secondary damage and safety risks. (2) Preventive (scheduled) maintenance - inspection, lubrication, adjustment and part replacement at fixed time or usage intervals (e.g. every 500 hours); reduces breakdowns and extends life, but may replace parts too early and needs planning, spares and shutdown windows. (3) Predictive (condition-based) maintenance - condition monitoring (vibration analysis, oil analysis, thermography, ultrasonic, motor current) decides when to act; maximises component life and prevents failures, but needs instruments, data analysis skills and investment. (4) Proactive approaches - root-cause analysis and design-out maintenance eliminate repeated failures; opportunistic maintenance uses planned shutdowns. Challenges in implementing any system include management commitment, skilled manpower, reliable records (CMMS), spare parts availability and the cost of downtime for planned work."""),
    it("ii. RCM (reliability-centred maintenance).", 10,
       [("Definition: systematic process to decide the most effective maintenance for each asset based on its functions, failure modes and consequences (SAE JA1011)", 3),
        ("Process: functions and performance standards, functional failures, FMEA (failure modes, effects), consequences (safety, environment, operational), select tasks (predictive, preventive, run-to-failure, redesign)", 4),
        ("Benefits (reliability, safety, cost-effective task selection) and challenges (time, data, cross-functional team, training)", 3)],
       """Reliability-centred maintenance is a structured process for deciding what must be done to ensure each physical asset continues to do what its users want in its present operating context. It asks seven questions (SAE JA1011): what are the functions and performance standards; how can the asset fail to fulfil them (functional failures); what causes each failure (failure modes); what happens when it fails (effects); in what way does each failure matter (safety, environmental, operational, non-operational consequences); what can be done to predict or prevent it (proactive tasks - condition-based, scheduled restoration or discard); and what if no suitable task exists (run-to-failure, failure-finding, redesign). It uses FMEA/FMECA and decision logic, focusing effort on critical equipment. Benefits: higher reliability and availability, better safety and environmental compliance, cost-effective maintenance (no unnecessary tasks), better knowledge of equipment. Challenges: time-consuming analysis, need for good failure data, trained cross-functional teams, management support and keeping the analysis updated."""),
    it("iii. TPM (total productive maintenance).", 10,
       [("TPM: Japanese approach involving all employees to maximise overall equipment effectiveness (OEE = availability x performance x quality); zero breakdowns, defects, accidents", 3),
        ("Eight pillars: autonomous maintenance (operators clean, inspect, lubricate), planned maintenance, focused improvement, quality maintenance, early equipment management, training, office TPM, safety/ health/ environment; 5S foundation", 4),
        ("Benefits (OEE, fewer breakdowns, ownership, quality) and challenges (culture change, time, training, sustaining)", 3)],
       """Total productive maintenance (developed in Japan, Nakajima) involves everyone - from top management to operators - in maintaining equipment, aiming at zero breakdowns, zero defects and zero accidents and measuring success with overall equipment effectiveness (OEE = availability x performance rate x quality rate). Its foundation is 5S (sort, set in order, shine, standardise, sustain) and it has eight pillars: autonomous maintenance (operators do daily cleaning, inspection, lubrication and tightening), planned maintenance, focused improvement (kaizen on losses), quality maintenance, early equipment management, education and training, office (administrative) TPM, and safety, health and environment. Benefits: higher OEE and productivity, fewer breakdowns and defects, operators' ownership and skills, safer, cleaner workplaces and lower costs. Challenges: needs a culture change and long-term management commitment, training time, overcoming the 'I operate, you fix' mindset, and sustaining the programme beyond initial enthusiasm."""),
    it("iv. Kaizen.", 10,
       [("Kaizen: continuous, incremental improvement by everyone (Japanese 'change for better'); PDCA cycle, gemba, standardisation", 3),
        ("Application in maintenance: small improvements to reduce downtime, set-up times, waste (muda), 5S, suggestion schemes, kaizen events/ blitz", 4),
        ("Benefits (low cost, participation, cumulative gains, morale) and challenges (sustaining, management support, measuring, resistance)", 3)],
       """Kaizen (Japanese for 'change for the better') is a philosophy of continuous, small, incremental improvement involving everyone, from managers to shop-floor workers. It follows the Plan-Do-Check-Act cycle, focuses on the actual workplace (gemba), eliminates waste (muda) and standardises each improvement before the next. In maintenance it appears as operator suggestions to reduce minor stoppages, kaizen events to cut set-up and repair times (SMED), better lubrication points, visual controls, 5S housekeeping and simple tools that prevent recurring faults. Benefits: low-cost improvements, high employee participation and morale, cumulative gains in productivity, quality and safety, and a culture of problem solving. Challenges: results are gradual so support can fade; it needs management commitment, recognition of suggestions, time for teams, measurement of results and overcoming resistance to change."""),
    it("v. Application of big data and data analytics in maintenance management systems.", 10,
       [("Data sources: IoT sensors (vibration, temperature, pressure, current), SCADA/ PLC, CMMS work orders, ERP, operating logs", 2),
        ("Applications: condition monitoring, predictive maintenance with machine learning (remaining useful life, anomaly detection), digital twins, root-cause analysis, spare-parts forecasting, scheduling optimisation, KPIs (MTBF, MTTR, OEE)", 5),
        ("Benefits (fewer failures, lower cost, optimised spares) and challenges (sensor/ IT cost, data quality, integration, cybersecurity, skills)", 3)],
       """Modern plants generate large volumes of data from IoT sensors (vibration, temperature, pressure, flow, motor current), PLC/SCADA systems, computerised maintenance management systems (work orders, failure history), ERP (spares, costs) and operating logs. Big data platforms store and integrate these, and analytics turn them into decisions: real-time condition monitoring and alarms; predictive maintenance using machine-learning models that detect anomalies and estimate the remaining useful life of bearings, motors or pumps; digital twins to simulate equipment behaviour; root-cause and failure-pattern analysis across many machines; optimising maintenance schedules around production; forecasting spare-parts demand; and dashboards of KPIs such as MTBF, MTTR, availability and OEE. Benefits: fewer unplanned failures, longer equipment life, lower maintenance and inventory costs, better safety and data-driven decisions. Challenges: investment in sensors, connectivity and software; poor data quality and incompatible legacy systems; cybersecurity risks; and shortage of data-analytics and reliability skills, so implementation should start with critical assets and build capability step by step."""),
])
Q += case("mech2024", 2, T, C2, items=[
    it("i. (a) Give a brief history of machining. (5 marks)\n(b) Describe the principles of the various traditional machining processes, in particular machining by cutting and machining by abrasion and their types, with sketches. (10 marks)\n(c) Describe the principles of the various non-traditional machining processes, in particular single-action non-traditional machining and hybrid machining processes and their types. (10 marks)", 25,
       [("(a) History: hand tools → water/ steam-powered lathes, boring mills (Wilkinson 1775), Maudslay screw-cutting lathe, milling machine (Whitney), grinding; HSS/ carbide tools; NC (1950s), CNC, CAD/CAM; non-traditional processes from 1940s", 5),
        ("(b) Cutting: tool harder than work, chip formation by shear; turning, drilling, milling, shaping/ planing, boring, broaching, sawing - sketches; abrasion: grinding, honing, lapping, superfinishing, polishing - abrasive grains remove small chips, high finish/ accuracy", 10),
        ("(c) Non-traditional: mechanical (USM, AJM, WJM/ AWJM), thermal (EDM, wire EDM, LBM, EBM, PAM), chemical/ electrochemical (CHM, ECM); hybrid: ECG, EDG, ultrasonic-assisted EDM/ turning, laser-assisted machining - combine actions for hard materials/ complex shapes", 10)],
       """(a) History: machining began with hand tools for shaping wood, stone and metal; bow lathes were used in ancient Egypt. The Industrial Revolution brought power-driven machine tools - John Wilkinson's boring mill (1775) for steam-engine cylinders, Henry Maudslay's screw-cutting lathe (about 1800), Eli Whitney's milling machine and later grinding machines. High-speed steel (1900s), cemented carbide (1920s-30s) and ceramic and CBN tools increased cutting speeds. Numerical control (1950s) and CNC with CAD/CAM (1970s onwards) automated machining, and non-traditional processes (EDM, ECM, lasers) appeared from the 1940s for hard materials and complex shapes; today multi-axis CNC and hybrid machines are common.
(b) Traditional machining: (1) Machining by cutting - a tool with defined cutting edges, harder than the workpiece, moves relative to it and removes material as chips by shear deformation. Types: turning (single-point tool, rotating work, lathe - cylindrical surfaces), facing, boring, drilling (rotating twist drill making holes), milling (rotating multi-tooth cutter, flat and contoured surfaces), shaping and planing (reciprocating single-point tool, flat surfaces), broaching (multi-tooth broach for keyways), and sawing. (2) Machining by abrasion - hard abrasive grains (alumina, silicon carbide, diamond, CBN) with undefined cutting edges remove very small chips. Types: grinding (rotating bonded wheel - surface, cylindrical, centreless), honing (abrasive stones for bores), lapping (loose abrasive in a carrier), superfinishing and polishing; they give high accuracy and surface finish. [Sketches show the tool, workpiece and motions for turning, drilling, milling and grinding.]
(c) Non-traditional machining removes material without a conventional sharp tool, using mechanical, thermal, chemical or electrical energy. Single-action processes: mechanical - ultrasonic machining (USM: abrasive slurry hammered by a tool vibrating at about 20 kHz), abrasive jet machining (AJM) and water-jet/abrasive water-jet machining (WJM/AWJM); thermal - electrical discharge machining (EDM and wire EDM: sparks erode conductive material), laser beam (LBM), electron beam (EBM) and plasma arc machining (PAM); chemical and electrochemical - chemical machining/milling (CHM: etchant with masks) and electrochemical machining (ECM: anodic dissolution, reverse electroplating). Hybrid processes combine two actions to improve rate or finish: electrochemical grinding (ECG: abrasion plus electrochemical dissolution), electrical discharge grinding (EDG), ultrasonic-assisted EDM or turning, laser-assisted turning (laser softens hard material), and electrochemical discharge machining (ECDM) for glass and ceramics. They machine very hard, brittle or heat-resistant materials and complex shapes, without mechanical stress, but with lower removal rates and higher cost."""),
    it("ii. Explain the following concepts in inventory management: VEN, ABC, VED, SDE and EOQ. (5 marks each)", 25,
       [("VEN: Vital, Essential, Non-essential - criticality classification mainly for medicines/ health supplies; priority for vital", 5),
        ("ABC: by annual consumption value - A ~10-20% items ~70-80% value (tight control), B, C ~70% items ~5-10% value (simple control); Pareto", 5),
        ("VED: Vital, Essential, Desirable - criticality of spares to production; stock levels; combined ABC-VED matrix", 5),
        ("SDE: Scarce, Difficult, Easy - availability/ lead time in market; procurement strategy, safety stock", 5),
        ("EOQ: quantity minimising total ordering + carrying cost: EOQ = √(2DS/H); assumptions; example", 5)],
       """VEN analysis classifies items (especially medicines and health supplies) as Vital (life-saving, must always be available), Essential (important for routine care) and Non-essential (useful but can be done without); budgets and stock priority go to vital and essential items.
ABC analysis classifies items by annual consumption value (Pareto principle): A items - about 10-20% of items accounting for about 70-80% of value, controlled tightly with frequent review, accurate forecasting and low stocks; B items - about 20-30% of items, 15-20% of value, moderate control; C items - about 50-70% of items but only 5-10% of value, simple control with bulk ordering.
VED analysis classifies spares and materials by criticality to production: Vital (shortage stops production - keep adequate stock), Essential (shortage causes loss but can be managed briefly) and Desirable (little effect). It is often combined with ABC in a matrix to set stock policies (e.g. vital-C items generously stocked).
SDE analysis classifies items by availability in the market: Scarce (imported, long lead time, rationed - long-term contracts, safety stock), Difficult (available with effort or delay) and Easy (readily available locally - minimal stock). It is useful in landlocked Bhutan where many spares are imported.
EOQ (economic order quantity) is the order size that minimises the total of ordering cost and inventory carrying cost: EOQ = √(2DS/H), where D = annual demand, S = cost per order and H = carrying cost per unit per year; for example D = 1200 units, S = Nu 500, H = Nu 30 gives EOQ = √(2 x 1200 x 500/30) = 200 units per order. It assumes constant demand, fixed lead time, constant costs and no shortages."""),
])
PATTERN = STANDARD
