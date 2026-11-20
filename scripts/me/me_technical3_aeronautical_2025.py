"""ME Technical Paper III (Subject Specialisation Paper), Aeronautical Engineering, BCSE 2025 - real paper (PDF sent by the founder).
Pattern: Section A Part I 30 MCQ, Part II 4 short answers x 5; Section B one of two case studies (50). 150 min + 15 min reading.
Left out: MCQ 15 (proportionality wording unclear), 19 (equation lost in the PDF text), 23 (needs the streamline figure),
29 (statement R arguable); four new MCQs keep Part I at 30. MCQ 5 options retyped (square roots lost in the PDF).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1"
GROUP_TAG = "aero2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "aeronautical-engineering"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Aeronautical Engineering"

MCQ = r"""[
{
"n": 1,
"stem": "In computer architecture, a byte is defined as a collection of how many bits?",
"opts": [
"2ⁿ where n = 1",
"Equivalent to one hexadecimal digit",
"8",
"Half of a word in a 16-bit system"
]
},
{
"n": 2,
"stem": "Which one of the following engines should be used by a subsonic passenger transport airplane for minimum specific fuel consumption?",
"opts": [
"Turbojet engine with afterburner",
"Turbofan engine",
"Ramjet engine",
"Scramjet engine"
]
},
{
"n": 3,
"stem": "Total pressure at a point is defined as the pressure when the flow is brought to rest",
"opts": [
"Isobarically",
"Isothermally",
"Isentropically",
"adiabatically"
]
},
{
"n": 4,
"stem": "On which one of the following thermodynamic cycles does an ideal ramjet operate?",
"opts": [
"The Rankine cycle",
"The Brayton cycle",
"The Carnot cycle",
"The Otto cycle"
]
},
{
"n": 5,
"stem": "In steady, level turning flight of an aircraft at a load factor 'n', the ratio of the horizontal component of lift and aircraft weight is",
"opts": [
"√𝑛 − 1",
"√𝑛 + 1",
"√𝑛' − 1",
"√𝑛' + 1"
]
},
{
"n": 6,
"stem": "Which one of the following high lift device results in higher stalling angle?",
"opts": [
"Leading-edge flap",
"Plain flap",
"Fowler flap",
"Split flap"
]
},
{
"n": 7,
"stem": "A turbofan engine has a bypass ratio of 5 and a total mass flow rate of 120 kg/s. The mass flow rate through the bypass duct is",
"opts": [
"600 kg/s",
"120 kg/s",
"100 kg/s",
"20 kg/s"
]
},
{
"n": 8,
"stem": "Sam is going to assemble a computer by himself. He has the choice of chips from two brands, a hard drive from four, memory from three, and an accessory bundle from five local stores. How many different ways can Sam order the parts?",
"opts": [
"100",
"120",
"125",
"130"
]
},
{
"n": 9,
"stem": "At a certain point in a horizontal pipeline, the water’s speed is 2.50 m/s and the gauge pressure is 1.80 x 104 Pa. Find the gauge pressure at a second point in the line if the cross-sectional area at the second point is twice that at the first. (Take ρ = 1000 kg/m3)",
"opts": [
"1.95 x 104 Pa",
"1.80 x 104 Pa",
"2.20 x 104 Pa",
"2.03 x 104 Pa"
]
},
{
"n": 10,
"stem": "During reentry, the space shuttle creates a shock-wave cone that makes an angle of 58.0∘ with its direction of motion. If the speed of sound at this altitude is 331 m/s, what is the Mach number of the shuttle at this instant?",
"opts": [
"1.18",
"0.85",
"1.50",
"1.75"
]
},
{
"n": 11,
"stem": "Which of the following statements correctly distinguishes the Otto cycle from the Brayton cycle?",
"opts": [
"The Otto cycle is used for gas turbines with constant-pressure heat addition, while the Brayton cycle is used for spark-ignition engines with constant-volume heat addition.",
"Both the Otto and Brayton cycles operate with isothermal compression and expansion, but the Otto cycle has constant-pressure heat addition.",
"The Otto cycle is typically used in spark-ignition engines with constant-volume heat addition, whereas the Brayton cycle is used in gas turbines with constant-pressure heat addition.",
"The Brayton cycle is a practical cycle for internal combustion engines with adiabatic heat rejection, while the Otto cycle is idealized with isobaric processes."
]
},
{
"n": 12,
"stem": "For an airplane to be statically stable, its centre of gravity must always be",
"opts": [
"ahead of neutral point",
"aft of neutral point",
"ahead of wing aerodynamic centre",
"aft of the wing aerodynamic centre"
]
},
{
"n": 13,
"stem": "A main objective of by-pass in a turbo-fan engine is to increase",
"opts": [
"mass flow rate through engine inlet",
"turbine inlet temperature",
"mass flow rate through exhaust nozzle",
"compressor pressure ratio"
]
},
{
"n": 14,
"stem": "Thermodynamic cycle on which the jet engine operates can be",
"opts": [
"either open or closed Brayton cycle",
"open Brayton cycle only",
"either open or closed Rankine cycle",
"open Rankine cycle only"
]
},
{
"n": 15,
"stem": "Propulsion efficiency of a jet engine is",
"opts": [
"inversely proportional to both the thrust power and the air mass flow rate",
"directly proportional to both the thrust power and the air mass flow rate",
"inversely proportional to the thrust power and directly proportional to the air mass flow rate",
"directly proportional to the thrust power and inversely proportional to the air mass flow rate"
]
},
{
"n": 16,
"stem": "In an un-powered glide of an aircraft having weight W, lift L and drag D, the equilibrium glide angle is defined as",
"opts": [
"tan-1 (L/D)",
"tan-1 (D/L)",
"tan-1 (L/W)",
"tan-1 (W/L)"
]
},
{
"n": 17,
"stem": "Lift on an aircraft climbing vertically up is",
"opts": [
"equal to its weight",
"zero",
"equal to the drag",
"equal to the thrust"
]
},
{
"n": 18,
"stem": "In the context of Prandtl’s lifting line theory for a finite wing, which of the following combinations of statements is TRUE? P: The bound vortex is responsible for the lift force Q: The trailing vortices are responsible for the induced drag R: The bound vortex is responsible for the induced drag S: The trailing vortices are responsible for the lift force",
"opts": [
"P,Q",
"Q,R",
"R,S",
"P,S )*"
]
},
{
"n": 19,
"stem": "The general solution of the differential equation )+ − 2-𝑦 = 0 is",
"opts": [
"𝑦 − √𝑥 + 𝐶 = 0",
"𝑦 − 𝑥 + 𝐶 = 0",
"-𝑦 − √𝑥 + 𝐶 = 0",
"-𝑦 − 𝑥 + 𝐶 = 0"
]
},
{
"n": 20,
"stem": "Bernoulli’s equation is valid under steady state",
"opts": [
"between any two points in both inviscid flow and potential flow.",
"between any two points in inviscid flow, and only along a streamline in potential flow.",
"only along a streamline in inviscid flow, and between any two points in potential flow.",
"only along a streamline in both inviscid flow and potential flow."
]
},
{
"n": 21,
"stem": "The Mach angle for a flow at Mach 2.0 is",
"opts": [
"30°",
"45°",
"60°",
"90°"
]
},
{
"n": 22,
"stem": "Which one of the following is the most stable configuration of an airplane in roll?",
"opts": [
"Sweep back, anhedral and low wing",
"Sweep forward, dihedral and low wing",
"Sweep forward, anhedral and high wing",
"Sweep back, dihedral and high wing"
]
},
{
"n": 23,
"stem": "Streamline pattern of flow past a cylinder is shown in the figure below. The oncoming flow is steady, irrotational and incompressible. The flow is from left to right. Bernoulli’s equation CANNOT be applied between the points",
"opts": [
"5 and 6",
"3 and 4",
"1 and 5",
"1 and 2"
]
},
{
"n": 24,
"stem": "For a NACA 4415 airfoil, the location of maximum camber, as a fraction of the chord length from the leading edge, is",
"opts": [
"0.40",
"0.04",
"0.44",
"0.15"
]
},
{
"n": 25,
"stem": "At what bank angle must an aircraft fly to maintain a coordinated turn on a circular path of radius 120 m at a velocity of 53 m/s?",
"opts": [
"45°",
"60°",
"67°",
"75°"
]
},
{
"n": 26,
"stem": "A significant limitation of carbon-fibre-reinforced plastics (CFRP) that must be considered in aircraft design is:",
"opts": [
"Brittleness and susceptibility to invisible impact damage",
"Low stiffness compared to glass-reinforced plastic (GRP)",
"Plastic yielding under stress concentrations",
"High resistance to fatigue failure"
]
},
{
"n": 27,
"stem": "Which one of the following systems is most suitable for short range navigation of airplanes?",
"opts": [
"Distance Measuring Equipment (DME)",
"Instrument Landing System (ILS)",
"VHF Omni-directional Range (VOR)",
"Global Positioning System (GPS)"
]
},
{
"n": 28,
"stem": "Which of the following engines has no moving parts like compressors or turbines?",
"opts": [
"Ramjet only",
"Scramjet only",
"Both Ramjet and Scramjet",
"Neither Ramjet nor Scramjet"
]
},
{
"n": 29,
"stem": "Which of the following statements about adverse yaw of an airplane is/are correct? P. It is caused by flow separation resulting from large rudder deflection. Q. It is caused by dissimilar drag forces acting on the two halves of the wing resulting from aileron deflections of same magnitude. R. It can be eliminated by ensuring that the upward deflection of one aileron is greater than the downward deflection of the opposite aileron.",
"opts": [
"Q and R",
"P and R",
"P only",
"Q only"
]
},
{
"n": 30,
"stem": "Consider an airfoil in a flow of air, where far ahead (upstream) of the airfoil, the pressure, velocity, and density are 2116 lb/ft2, 146.7 ft/s, and 0.002377 slug/ft3, respectively. At a given point A on the airfoil, the pressure is 2070 lb/ft2. What is the velocity at point A ?",
"opts": [
"242.0 ft/s",
"245.4 ft/s",
"248.0 ft/s",
"250.5 ft/s"
]
}
]"""

KEY = {
    1: ("c", "A byte is 8 bits."), 2: ("b", "High-bypass turbofans give the lowest specific fuel consumption at subsonic speeds."),
    3: ("c", "Total (stagnation) pressure: flow brought to rest isentropically."), 4: ("b", "An ideal ramjet follows the Brayton cycle."),
    5: ("c", "Horizontal lift = W√(n² − 1) in a level turn, so the ratio is √(n² − 1)."), 6: ("a", "Leading-edge devices delay stall to a higher angle of attack."),
    7: ("c", "Bypass ratio 5: bypass flow = 120 × 5/6 = 100 kg/s."), 8: ("b", "2 × 4 × 3 × 5 = 120."),
    9: ("d", "v₂ = 1.25 m/s; p₂ = 1.80×10⁴ + ½(1000)(2.5² − 1.25²) = 2.03×10⁴ Pa."), 10: ("a", "sin μ = 1/M: M = 1/sin 58° = 1.18."),
    11: ("c", "Otto: spark ignition, constant-volume heat addition; Brayton: gas turbines, constant-pressure heat addition."),
    12: ("a", "For static longitudinal stability the CG must be ahead of the neutral point."),
    13: ("a", "Bypass raises the mass flow handled by the engine, improving propulsive efficiency."), 14: ("a", "Jet engines work on the Brayton cycle, open or closed."),
    16: ("b", "Glide angle γ = tan⁻¹(D/L)."), 17: ("b", "In a vertical climb thrust balances weight and drag; lift is zero."),
    18: ("a", "Bound vortex gives lift (P); trailing vortices give downwash and induced drag (Q)."),
    20: ("c", "Bernoulli holds along a streamline in inviscid flow, and between any two points in irrotational (potential) flow."),
    21: ("a", "μ = sin⁻¹(1/2) = 30°."), 22: ("d", "Sweep back, dihedral and a high wing all add roll stability."),
    24: ("a", "NACA 4415: second digit 4 → maximum camber at 0.4 chord."), 25: ("c", "tan φ = V²/(rg) = 53²/(120 × 9.81) = 2.39 → φ ≈ 67°."),
    26: ("a", "CFRP is brittle and can hide impact damage (barely visible impact damage)."), 27: ("c", "VOR is the standard short-range navigation aid."),
    28: ("c", "Ramjets and scramjets compress air by ram effect; no compressor or turbine."),
    30: ("b", "½ρ(V_A² − V∞²) = 46 → V_A² = 146.7² + 2(46)/0.002377 → V_A ≈ 245.4 ft/s."),
}
FIX = {5: {"opts": ["√(n − 1)", "√(n + 1)", "√(n² − 1)", "√(n² + 1)"]}}
T = TOPIC
Q = mcqs(MCQ, KEY, T, FIX) + [
    new_mcq(1, T, "What is the speed of sound in air at 288 K? (γ = 1.4, R = 287 J/kg·K)", ["300 m/s", "320 m/s", "340 m/s", "360 m/s"], "c", "a = √(γRT) = √(1.4 × 287 × 288) ≈ 340 m/s."),
    new_mcq(2, T, "According to thin airfoil theory, the lift-curve slope of a thin airfoil is", ["π per radian", "2π per radian", "π/2 per radian", "4π per radian"], "b", "dCl/dα = 2π per radian."),
    new_mcq(3, T, "The induced drag coefficient of a finite wing is given by", ["CL/AR", "CL²/(πeAR)", "πeAR/CL²", "CL × AR"], "b", "CDi = CL²/(πeAR): it falls as aspect ratio rises."),
    new_mcq(4, T, "Ailerons primarily control an aircraft's motion in", ["pitch", "yaw", "roll", "thrust"], "c", "Ailerons give roll control about the longitudinal axis."),
    saq(1, T, """a) A high-speed aircraft is cruising in still air. How will the temperature of air at the nose of the aircraft differ from the temperature of air at some distance from the aircraft? (2 marks)
b) What four processes make up the simple ideal Brayton cycle? (2 marks)
c) What is Reynolds number? Explain briefly why it is important in determining the type of flow over a wing. (1 mark)""",
        [("a) Higher at the nose: air is brought to rest, kinetic energy becomes heat (stagnation temperature T₀ = T + V²/2cp)", 2),
         ("b) Isentropic compression, constant-pressure heat addition, isentropic expansion, constant-pressure heat rejection", 2),
         ("c) Re = ρVL/μ, inertia/viscous forces; decides laminar or turbulent boundary layer", 1)],
        """a) The air at the nose is hotter. It is brought to rest (stagnation point), so its kinetic energy is converted to internal energy: T₀ = T + V²/(2cp). Away from the aircraft the air is at the ambient static temperature.
b) 1-2 isentropic compression (compressor); 2-3 constant-pressure heat addition (combustor); 3-4 isentropic expansion (turbine/nozzle); 4-1 constant-pressure heat rejection (to atmosphere).
c) Re = ρVL/μ, the ratio of inertial to viscous forces. Low Re gives a laminar boundary layer, high Re turbulent; it fixes transition, skin friction and separation (stall) behaviour of the wing."""),
    saq(2, T, """a) Explain why flow separation occurs more easily in a laminar boundary layer compared to a turbulent boundary layer, and discuss its impact on lift and drag characteristics of an airfoil at high angles of attack. (3 marks)
b) Explain the engineering principles and design strategies used in modern aircraft to ensure protection against lightning strikes. (2 marks)""",
        [("a) Laminar layer has low momentum near the wall, cannot resist adverse pressure gradient; turbulent mixing re-energises it", 1.5),
         ("a) Separation at high AoA: loss of lift (stall) and large rise in pressure drag", 1.5),
         ("b) Conductive path (metal skin, mesh/foil in composites), bonding, static wicks, diverter strips, shielding, fuel-system protection", 2)],
        """a) In a laminar boundary layer the velocity near the wall is low and there is little mixing, so the fluid has little momentum to push against an adverse pressure gradient; it stops and reverses early. A turbulent layer mixes high-momentum air down to the wall, so it stays attached longer. At high angles of attack separation spreads forward over the upper surface: lift falls (stall) and pressure drag rises sharply.
b) Give the current a continuous low-resistance path through the airframe: metal skin, or copper/aluminium mesh and foil in composite parts; electrical bonding of panels and parts; diverter strips on radomes; static wicks; shielding and surge protection of wiring and avionics; fuel tanks and vents designed so no spark can ignite vapour; tested to lightning-zone certification standards."""),
    saq(3, T, """a) An aircraft is cruising at an altitude of 9 km. The free-stream static pressure and density at this altitude are 3.08 × 10⁴ N/m² and 0.467 kg/m³ respectively. A Pitot tube mounted on the wing senses a pressure of 3.31 × 10⁴ N/m². Ignoring compressibility effects, calculate the cruising speed of the aircraft. (3 marks)
b) Air enters an aircraft engine at a velocity of 180 m/s with a flow rate of 94 kg/s. The engine combustor requires 9.2 kg/s of air to burn 1 kg/s of fuel. The velocity of gas exiting from the engine is 640 m/s. Calculate the momentum thrust (in N) developed by the engine. (2 marks)""",
        [("a) p₀ − p = ½ρV²: 2300 = ½(0.467)V²", 1.5), ("a) V ≈ 99.2 m/s", 1.5),
         ("b) fuel = 94/9.2 = 10.22 kg/s; F = (94 + 10.22)(640) − 94(180)", 1), ("b) F ≈ 49,800 N", 1)],
        """a) p₀ − p = 3.31×10⁴ − 3.08×10⁴ = 2,300 N/m² = ½ρV², so V = √(2 × 2300 / 0.467) = √9,850 ≈ 99.2 m/s.
b) Fuel flow = 94/9.2 = 10.22 kg/s. Momentum thrust F = (ṁa + ṁf)Ve − ṁaVi = (104.22)(640) − (94)(180) = 66,700 − 16,920 ≈ 49,780 N (about 49.8 kN)."""),
    saq(4, T, """a) In a converging duct, area and velocity at section P are 1 m² and 15 m/s respectively. The temperature of the fluid is 300 K. Air flow through the nozzle can be assumed to be inviscid and isothermal. Characteristic gas constant is 287 J/(kg·K) and ratio of specific heats is 1.4 for air. To ensure that the air flow remains incompressible (Mach number M ≤ 0.3) in the duct, calculate the minimum area required at section Q. (3 marks)
b) A Drukair Airbus A320 aircraft is cruising at a standard altitude of 30,000 ft with a velocity of 550 mi/h. At this altitude the standard temperature is 411.86 °R. Take the gas constant for air as 1716 ft·lb/(slug·°R) and the ratio of specific heats as 1.4 (1 mile = 5280 feet). Calculate its Mach number. (2 marks)""",
        [("a) a = √(1.4 × 287 × 300) = 347 m/s; V_max = 0.3a = 104 m/s", 1.5), ("a) A_Q = A_P V_P / V_Q = 15/104 ≈ 0.144 m²", 1.5),
         ("b) V = 550 × 5280/3600 = 806.7 ft/s; a = √(1.4 × 1716 × 411.86) ≈ 994.7 ft/s", 1), ("b) M ≈ 0.81", 1)],
        """a) Speed of sound a = √(γRT) = √(1.4 × 287 × 300) = 347.2 m/s (same throughout, isothermal). Largest allowed speed V_Q = 0.3 × 347.2 = 104.2 m/s. Continuity (incompressible): A_Q = A_P V_P / V_Q = (1 × 15)/104.2 ≈ 0.144 m².
b) V = 550 × 5280 / 3600 = 806.7 ft/s. a = √(1.4 × 1716 × 411.86) = √989,450 ≈ 994.7 ft/s. M = 806.7/994.7 ≈ 0.81."""),
]
C1 = """CASE I: Certification and Airworthiness Challenges of eVTOL Aircraft
The Civil Aviation Authority (CAA) of Bhutan has received an application from an operator proposing to introduce electric vertical take-off and landing (eVTOL) capable powered-lift aircraft for short-range urban air mobility (UAM). These aircraft are intended for passenger transport between key urban and semi-urban areas. The proposed design is a fully electric, tilt-rotor eVTOL capable of carrying 4 passengers with a range of 100 km per charge.
The operator claims the aircraft is safe, sustainable, and compliant with international standards. However, eVTOL technology introduces unique challenges in terms of airworthiness certification, battery reliability, maintenance, continuing airworthiness management, and integration into existing airspace.
As an Airworthiness Officer/Flight Safety Officer in the CAA, you are required to evaluate the application and assess the potential risks, compliance aspects, and regulatory requirements."""
C2 = """CASE II: Airworthiness and Technical Challenges of Heavy-Payload UAS (Cargo Drones)
A private operator in Bhutan has proposed the use of a large Unmanned Aircraft System (UAS) for cargo transportation in remote and mountainous regions. The system is designed with a maximum take-off weight of 250 kg, a payload capacity of 100 kg, and is powered by twin electric motors supported by swappable lithium battery packs. It has a composite airframe with fixed landing gear, can operate autonomously with ground station override, and offers an endurance of 2.5 hours with a range of up to 200 km, including beyond visual line of sight (BVLOS) capability.
The operator highlights that this UAS could reduce costs and environmental impacts compared to short-haul manned cargo flights. However, introducing such heavy-payload drones presents significant engineering, airworthiness and operational challenges. Key concerns include structural integrity of the airframe, reliability of the propulsion and power systems, handling of loss-of-link scenarios, and ensuring safe integration into controlled civil airspace."""
Q += case("aero2025", 1, T, C1, [
    ("Question 1 (Design and propulsion fundamentals): Explain how lift, thrust-to-weight ratio, and stability requirements differ between a conventional fixed-wing aircraft and a tilt-rotor eVTOL design.", 10,
     [("Lift: wing lift in cruise vs rotor thrust in hover and transition", 3), ("Thrust-to-weight: fixed-wing T/W < 1; eVTOL needs T/W > 1 (about 1.2+) to hover, with margin for engine-out", 4), ("Stability: aerodynamic stability vs active fly-by-wire stabilisation, critical transition phase", 3)],
     """Lift: a fixed-wing aircraft gets lift only from the wing, so it needs forward speed and a runway. A tilt-rotor eVTOL gets lift from rotor thrust in hover, from a mix of rotor and wing in transition, and from the wing in cruise.
Thrust-to-weight: a fixed-wing airliner cruises with T/W well below 1 (thrust only overcomes drag). An eVTOL must lift its full weight vertically, so T/W must exceed 1 (about 1.2 or more) with margin for a failed motor; this drives large motors and battery power peaks.
Stability: a fixed-wing aircraft is stable by design (CG ahead of neutral point, tail, dihedral). In hover the eVTOL has almost no aerodynamic stability and depends on fast flight-control computers varying rotor speed/tilt; the transition between hover and wing-borne flight is the most demanding phase and must be shown to be controllable after failures."""),
    ("Question 2 (Certification and compliance challenges): List and explain five key airworthiness requirements that should be considered during the certification of an eVTOL aircraft.", 10,
     [("Five requirements, 2 marks each, e.g. certification basis (special conditions such as EASA SC-VTOL / FAA powered-lift)", 2), ("Battery and electric propulsion safety (thermal runaway, containment)", 2), ("Flight control / software and avionics assurance (DO-178C, DO-254)", 2), ("Structural strength, crashworthiness, bird strike, lightning, HIRF", 2), ("Performance, controllability after failure, continued safe flight and landing; noise and emissions", 2)],
     """1. Certification basis: no conventional category fits, so CAA should adopt a special condition (e.g. EASA SC-VTOL or FAA powered-lift rules) as the basis and validate the foreign type certificate.
2. Energy storage and electric propulsion: battery cell and pack safety, prevention and containment of thermal runaway, state-of-charge monitoring, reserves for diversion.
3. Flight control systems and software: fly-by-wire with development assurance (DO-178C software, DO-254 hardware), redundancy and failure analysis.
4. Structures and crashworthiness: strength, fatigue, bird strike, lightning and HIRF protection, occupant protection and emergency exits.
5. Performance and handling: hover and transition performance in Bhutan's high-altitude, mountainous conditions, controllability with one rotor/motor failed, continued safe flight and landing; noise for urban use."""),
    ("Question 3 (Continuing airworthiness and maintenance): Define the Aircraft Maintenance Programme (AMP) and formulate a structured framework for the approval of a Maintenance Programme specific to eVTOL aircraft, with focused considerations on battery systems, electric propulsion units, the airframe, associated systems, and software update management.", 10,
     [("Definition: approved document of scheduled maintenance tasks, intervals and procedures for continuing airworthiness", 2), ("Framework: based on manufacturer data (MRB/MPD), operator's environment, reliability programme, CAA review and approval, periodic revision", 3),
      ("Battery and propulsion: cycle/health checks, thermal, cell balancing, motor/inverter inspections and life limits", 3), ("Airframe/systems and software: composite inspections, tilt mechanisms; configuration control of software updates", 2)],
     """AMP: the operator's approved document listing the scheduled maintenance tasks, their intervals and procedures needed to keep each aircraft airworthy.
Framework for approval: (1) the operator submits an AMP based on the manufacturer's maintenance planning data and the type certificate; (2) tailor it to local conditions (altitude, weather, utilisation); (3) CAA reviews tasks, intervals and the reliability programme; (4) approval with conditions and periodic review using in-service data.
Battery systems: charge-cycle counting, state-of-health tests, thermal-management checks, cell balancing, connector inspection, storage and disposal rules.
Electric propulsion units: motor and inverter inspection, bearing and vibration monitoring, cooling, life-limited parts.
Airframe and systems: composite damage inspections (impact, delamination), tilt-mechanism and actuator checks, landing gear, avionics.
Software: configuration control, approved service bulletins, testing before release, records of each version installed."""),
    ("Question 4 (Safety and risk assessment): Analyze how system redundancy and fail-safe architecture in eVTOL designs influence certification decisions. Provide two practical examples.", 10,
     [("Redundancy lets the aircraft meet failure-probability targets (catastrophic ≤ 10⁻⁹/h); no single failure catastrophic", 4), ("Influence on certification: system safety assessment (FHA, FMEA, fault trees), tests, approval of limitations", 2), ("Two examples, e.g. distributed propulsion with motor-out capability; triple-redundant flight computers / dual battery buses", 4)],
     """Certification requires that no single failure is catastrophic and that catastrophic failure conditions are extremely improbable (about 10⁻⁹ per flight hour). Redundant, independent systems and fail-safe design are how an eVTOL meets this, and the regulator judges them through the safety assessment (functional hazard assessment, FMEA, fault trees, common-cause analysis) and ground/flight tests. Strong redundancy can allow approval for passenger flights; weak redundancy leads to limitations or refusal.
Example 1: distributed electric propulsion - several rotors, so the aircraft can still hover and land with one motor or inverter failed.
Example 2: triple-redundant flight-control computers and sensors with voting, and separate battery packs/buses so one battery fault does not cut all power."""),
    ("Question 5 (Personnel licensing): Considering that eVTOL aircraft may operate in piloted, remotely piloted, or autonomous modes, and that they also require routine maintenance and inspection, how should the CAA define the licensing and training requirements for both pilots and maintenance engineers?", 10,
     [("Pilots: powered-lift category/type rating, training on transition, energy management, emergencies; simulator", 4), ("Remote pilots/operators of autonomous systems: remote pilot licence, C2-link and ground station training", 2), ("Engineers: AME licence with electrical/battery/software modules, type training, high-voltage safety", 3), ("Recurrent training, competency checks, alignment with ICAO", 1)],
     """Pilots: create a powered-lift category and eVTOL type rating; training on hover, transition and wing-borne flight, battery energy management, failures and emergency landing; simulator training; medical and recurrent checks.
Remote pilots and supervisors of autonomous flights: a remote pilot licence covering the ground control station, command-and-control link loss, airspace and BVLOS procedures, and monitoring automation.
Maintenance engineers: AME licence with added modules on high-voltage electrical systems, batteries, electric motors, composites and software loading; manufacturer type training and safe work with high voltage.
For all: recurrent training, competency assessment, and rules aligned with ICAO and the state of design."""),
])
Q += case("aero2025", 2, T, C2, [
    ("Question 1 (Structural and aerodynamic considerations): (i) What do you understand by the term 'Drones'? [2 marks] (ii) Analyze the aerodynamic challenges associated with mounting heavy payloads on large UAS. In your answer, discuss effects on stability, control authority, center of gravity shifts, induced drag, and potential flow disturbances, and how these factors influence the overall airworthiness of the drone. [8 marks]", 10,
     [("(i) Aircraft without a pilot on board, flown remotely or autonomously (UAV/UAS)", 2), ("(ii) CG shifts and stability/trim margins; control authority limits", 3), ("(ii) Higher weight → higher CL and induced drag; external payload drag and flow disturbance on tail/propellers", 3), ("(ii) Effect on airworthiness: envelope limits, load/CG checks", 2)],
     """(i) A drone is an unmanned aircraft - flown without a pilot on board, either remotely from a ground station or autonomously - and with its control station and link it forms an unmanned aircraft system (UAS).
(ii) A 100 kg payload on a 250 kg aircraft moves the CG; if it moves aft the static margin falls and the drone may become unstable, if forward the elevator may lack authority for take-off and landing. Dropping or shifting cargo changes the CG in flight. The higher weight needs a higher lift coefficient, so induced drag (∝ CL²) rises and endurance falls. External pods add parasite drag and disturb the flow over the tail and propellers, reducing control effectiveness and causing vibration. These factors set the certified weight and CG envelope, require load and balance checks before each flight and flight testing at the limits."""),
    ("Question 2 (Propulsion systems): Propose two alternative propulsion or energy solutions to improve endurance or payload capacity of the drone. For each solution, analyze its feasibility, engineering trade-offs, and integration challenges with the existing airframe and autonomous systems.", 10,
     [("Solution 1, e.g. hybrid-electric (engine-generator + battery): feasibility, trade-offs (range vs weight, noise, emissions), integration", 5), ("Solution 2, e.g. hydrogen fuel cell or higher-energy batteries: feasibility, trade-offs, integration (storage, cooling, safety, CG)", 5)],
     """1. Hybrid-electric: a small engine-generator charges batteries in flight. Feasible with today's technology and gives 2-4 times the range/endurance. Trade-offs: extra weight, fuel system, noise, emissions and maintenance; integration needs space, cooling, vibration isolation, CG re-balancing and power-management software linked to the autopilot.
2. Hydrogen fuel cell (or higher-energy-density batteries such as lithium-sulphur/solid-state): much higher specific energy, quiet, no CO₂. Trade-offs: cost, hydrogen supply and storage in Bhutan, high-pressure tank safety, slower response (needs a buffer battery). Integration: tank placement and CG, thermal management, new failure modes for the flight computer to monitor, certification of the new system."""),
    ("Question 3 (Flight control and autonomy): Discuss the role of redundancy in sensors, communication links, and actuators in ensuring flight safety.", 10,
     [("Sensors: multiple GNSS, IMU, air-data, altimeters with voting / cross-checking", 3), ("Communication: dual C2 links (radio + satellite/4G), lost-link procedures", 3), ("Actuators/servos and power: duplicated, failure detection and reconfiguration", 3), ("No single failure causes loss of control; safe return/landing", 1)],
     """Redundancy means that one failure does not cause loss of control. Sensors: duplicated GNSS, IMUs, air-data and altitude sensors cross-checked by the flight computer, which rejects a faulty one (important in mountains where GNSS may be blocked). Communication: two independent command-and-control links (for example radio line-of-sight and satellite or mobile network), so the ground pilot keeps override; if both fail, a pre-programmed lost-link procedure (return home, hold, land at a safe point). Actuators and power: duplicated servos or split control surfaces, separate power buses, with failure detection and automatic reconfiguration. Together these allow the drone to continue or end the flight safely and are key evidence for BVLOS approval."""),
    ("Question 4 (Safety and risk mitigation): Assess the consequences of in-flight propulsion failure and discuss various mitigation strategies.", 10,
     [("Consequences: loss of thrust/power, loss of altitude, crash in terrain, cargo loss, third-party risk", 4), ("Mitigation: twin-motor redundancy and engine-out capability, battery isolation", 3), ("Mitigation: health monitoring, emergency landing sites, parachute, route planning away from people, maintenance", 3)],
     """Consequences: with one motor lost the drone has asymmetric thrust and reduced climb; losing both (or the battery) means no thrust - it can only glide, which in Bhutan's mountains may mean impact with terrain, loss of the cargo and risk to people and property below.
Mitigation: design so the drone can fly and land on one motor; separate battery packs and power buses so a single fault cannot stop both motors; real-time monitoring of motor temperature, current and battery health with automatic return or landing; pre-planned emergency landing sites along the route; a ballistic parachute; routes over unpopulated areas; strict pre-flight checks and maintenance; and operating limits for weather and altitude."""),
    ("Question 5 (Continuing airworthiness and operational safety): (i) Recommend six critical inspection, maintenance, or monitoring tasks for ensuring continuing airworthiness of heavy-payload UAS. Include both structural and system-level checks. [6 marks] (ii) Explain how engineering and operational data such as flight logs, battery cycle life, structural fatigue monitoring, etc. can support decisions regarding continuing airworthiness. [4 marks]", 10,
     [("(i) Six tasks, 1 mark each (composite airframe/landing gear inspection, payload mounts, motors/propellers, battery health and connectors, wiring/avionics, C2 link and software/firmware checks)", 6), ("(ii) Data trends → condition-based maintenance, retire batteries, adjust intervals, detect faults early, evidence for regulator", 4)],
     """(i) 1. Inspect the composite airframe for cracks, delamination and impact damage. 2. Check landing gear and payload attachment points for wear and loose fasteners. 3. Inspect motors, mounts and propellers (balance, nicks, vibration). 4. Test battery packs - state of health, cycle count, swelling, connector condition. 5. Check wiring, connectors and avionics, including the flight controller and sensors calibration. 6. Test command-and-control links, failsafe functions and confirm approved software/firmware versions.
(ii) Flight logs show hours, loads, hard landings and fault messages; battery data (cycles, capacity loss, temperatures) shows when packs must be retired; fatigue and vibration monitoring reveals structural or motor wear early. Trends let the operator move to condition-based maintenance, change inspection intervals, find recurring defects and give the CAA evidence that the fleet remains airworthy."""),
])
PATTERN = STANDARD
