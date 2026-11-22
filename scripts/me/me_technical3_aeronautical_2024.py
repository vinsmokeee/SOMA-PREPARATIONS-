"""ME Technical Paper III (Subject Specialisation Paper), Aeronautical Engineering, BCSE 2024 - real paper (PDF sent by the founder;
titled "Aeronautical/Avionic Engineering" in 2024). Standard pattern, same as the 2025 Aeronautical Engineering paper (the latest).
MCQs 4 and 9 re-typed (maths lost in the PDF text); MCQ 9 uses the spring figure (public/papers/me/tech3-aero-2024-springs.png).
MCQ 5 replaced (options a and c are the same line, so two answers are correct).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Aeronautical Engineering): BCSE 2024, batch 1"
GROUP_TAG = "aero2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "aeronautical-engineering"
ADDS_TO_PAPER = True  # 2025 is the latest Aeronautical Engineering paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Aeronautical/Avionic Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Aeronautical Engineering"

MCQ = r"""[
{
"n": 1,
"stem": "Which certification confirms that an aircraft's design adheres to all regulatory safety and performance standards?",
"opts": [
"Production Certificate",
"Certificate of Airworthiness",
"Supplemental Type Certificate",
"Type Certificate"
]
},
{
"n": 2,
"stem": "As per International Civil Aviation Organization (ICAO) standards, which common mark or nationality mark is designated for aircraft registered in Bhutan?",
"opts": [
"A4-",
"A5-",
"A6-",
"A7-"
]
},
{
"n": 3,
"stem": "Which organization is responsible for being the custodian of all civil aviation regulatory matters in Bhutan?",
"opts": [
"Bhutan Civil Aviation Authority",
"Department of Air Transport",
"Bhutan Construction and Transport Authority",
"Drukair Corporation Limited"
]
},
{
"n": 4,
"stem": "If x² + 2xy = y², then dy/dx is",
"opts": [
"(x + y)/(y - x)",
"2x + 2y",
"(x + 1)/y",
"-x"
]
},
{
"n": 5,
"stem": "The equation of the straight line representing the tangent to the curve 𝑦 = 𝑥 2 at the point (1,1) is",
"opts": [
"𝑦 = 2𝑥 – 1",
"𝑥 = 2𝑦 – 1",
"𝑦 – 1 = 2(𝑥 – 1)",
"𝑥 – 1 = 2(𝑦 – 1)"
]
},
{
"n": 6,
"stem": "In isometric projection, how are the principal edges of an object oriented with respect to the projection plane?",
"opts": [
"They form 90° angles with the projection plane",
"They form equal angles of 120° with each other and are equally foreshortened",
"They vary in length based on the object's orientation",
"They are aligned parallel to the projection plane"
]
},
{
"n": 7,
"stem": "The barrier potential across a P-N junction",
"opts": [
"Decreases with increasing doping concentration",
"Increases with decreasing band gap",
"Does not depend on the doping concentration",
"Increases with increase in doping concentration"
]
},
{
"n": 8,
"stem": "Transform the hexadecimal value D5 into its corresponding binary form",
"opts": [
"10100101",
"11010010",
"11010101",
"10101011"
]
},
{
"n": 9,
"stem": "A system consists of two springs and a mass m = 1 kg as shown in the figure (one spring above the mass fixed to the ceiling, one below fixed to the floor, each of stiffness k). If m is displaced slightly vertically and released, the system oscillates with a period of 2 s. The spring constant k is:",
"opts": [
"π²/2",
"π²/4",
"π²/6",
"π²/8"
],
"image": "/papers/me/tech3-aero-2024-springs.png"
},
{
"n": 10,
"stem": "The maximum thickness to chord ratio for the NACA 24012 airfoil is",
"opts": [
"0.01",
"0.12",
"0.24",
"0.40"
]
},
{
"n": 11,
"stem": "Laminar flow airfoils are used to reduce",
"opts": [
"wave drag",
"trim drag",
"induced drag",
"skin friction drag"
]
},
{
"n": 12,
"stem": "An aircraft is cruising at a true air speed (TAS) of 100 m/s under ISA conditions, where the free-stream air density is 0.526 kg/m³. What is the equivalent air speed (EAS)? (ISA: ρ0 = 1.225 kg/m³, p0 = 1 atm = 1.0132 x 10⁵ N/m², T0 = 288.16 K)",
"opts": [
"65.5 m/s",
"72.5 m/s",
"110.5 m/s",
"152.7 m/s"
]
},
{
"n": 13,
"stem": "The primary function of the fin in the vertical tail of an aircraft is to provide",
"opts": [
"roll stability",
"roll damping",
"yaw stability",
"yaw control"
]
},
{
"n": 14,
"stem": "Which of the following statements is TRUE as the altitude increases in stratosphere of lnternational Standard Atmosphere?",
"opts": [
"Temperature increases and dynamic viscosity decreases",
"Temperature remains constant and pressure increases",
"Temperature decreases and sound speed decreases",
"Temperature remains constant and density decreases"
]
},
{
"n": 15,
"stem": "A turbojet engine is operating with afterburner off. If the afterburner is switched on, then",
"opts": [
"both thrust and sfc increase",
"both thrust and sfc decrease",
"thrust increases and sfc decreases",
"thrust decreases and sfc increases"
]
},
{
"n": 16,
"stem": "How does regeneration affect the efficiency of a Brayton cycle, and what is the primary mechanism by which it accomplishes this improvement?",
"opts": [
"Regeneration increases the thermal efficiency by increasing the pressure of the air entering the combustion chamber.",
"Regeneration has no effect on the thermal efficiency and only serves to reduce fuel consumption.",
"Regeneration increases the thermal efficiency by using exhaust heat to preheat the air before it enters the combustion chamber.",
"Regeneration decreases the thermal efficiency by cooling the exhaust gases before they leave the cycle."
]
},
{
"n": 17,
"stem": "Which of the following gases is commonly used to charge the accumulator in an aircraft hydraulic system?",
"opts": [
"Nitrogen",
"Oxygen",
"Carbon dioxide",
"Helium"
]
},
{
"n": 18,
"stem": "Winglets are used on wings to minimize",
"opts": [
"wave drag",
"skin friction drag",
"induced drag",
"profile drag"
]
},
{
"n": 19,
"stem": "In a semi-monocoque construction of an aircraft wing, the skin and spar webs are the primary carriers of",
"opts": [
"shear stresses due to an aerodynamic moment component alone.",
"normal (bending) stresses due to aerodynamic forces.",
"shear stresses due to aerodynamic forces alone.",
"shear stresses due to aerodynamic forces and a moment component."
]
},
{
"n": 20,
"stem": "Which one of the following flight instruments is used on an aircraft to determine its attitude in flight?",
"opts": [
"Vertical speed indicator",
"Altimeter",
"Artificial Horizon",
"Turn-bank indicator"
]
},
{
"n": 21,
"stem": "In the structural design of an aircraft wing, which primary component serves as the main load- bearing element, running spanwise and providing essential support against bending forces?",
"opts": [
"Spar",
"Longerons",
"Stringer",
"Skin"
]
},
{
"n": 22,
"stem": "The critical Mach number (Mcr) of an airfoil is defined as:",
"opts": [
"The Mach number at which the flow remains entirely subsonic over the surface of the airfoil.",
"The Mach number at which the entire flow field over the airfoil surface becomes sonic.",
"The free-stream Mach number at which sonic conditions are first reached at any point on the airfoil surface.",
"The Mach number at which aerodynamic drag on the airfoil is at its minimum."
]
},
{
"n": 23,
"stem": "If an aircraft is in pitching, rolling, and yawing moment equilibrium, then its flight is said to be in:",
"opts": [
"Trim",
"Equilibrium",
"Steady state flight",
"Neutral flight"
]
},
{
"n": 24,
"stem": "If an aircraft battery is rated at 24V and has a capacity of 40Ah, what is the maximum power it can supply for 1 hour?",
"opts": [
"24 W",
"1200 W",
"28 W",
"960 W"
]
},
{
"n": 25,
"stem": "Which of the following best describes the primary influence of the wheel base (B) on an aircraft with a tricycle landing gear?",
"opts": [
"The wheel base primarily affects the aircraft's aerodynamic stability.",
"The wheel base impacts the load distribution between the main and nose gear, as well as ground controllability and stability.",
"The wheel base is most critical for determining the aircraft's take-off speed.",
"The wheel base only affects the structural integrity of the landing gear."
]
},
{
"n": 26,
"stem": "Shock waves are very thin regions of the flow, across which some very severe changes in the flow properties take place. Specifically, as a fluid element flows through a shock wave, the:",
"opts": [
"Mach number decreases",
"static pressure decreases",
"flow velocity increases",
"Mach number remains same"
]
},
{
"n": 27,
"stem": "The design aspect ratio for a conventional airplane is a compromise between:",
"opts": [
"materials and structures",
"thrust and lift",
"aerodynamics and structures",
"weight and lift"
]
},
{
"n": 28,
"stem": "In a turbo jet engine, subsequent to heat addition to compressed air, to get the power output, the working substance is expanded in",
"opts": [
"turbine blades, which is essentially an isentropic process",
"turbine blades, which is a constant volume process",
"exit nozzle, which is essentially an isentropic process",
"exit nozzle, which is a constant volume process"
]
},
{
"n": 29,
"stem": "For a wing-body combination, the aerodynamic centre lies 0.05 chord length ahead of the centre of gravity. The moment coefficient about the aerodynamic centre is -0.016. If the lift coefficient is 0.45, calculate the moment coefficient about the centre of gravity.",
"opts": [
"−0.025",
"−0.0065",
"0.0065",
"0.025"
]
},
{
"n": 30,
"stem": "In a radar system, a modulator:",
"opts": [
"separate two frequencies",
"impress the information on to radar frequency carrier",
"extract information from the carrier",
"amplify the radar frequency signal"
]
}
]"""

KEY = {
    1: ("d", "The Type Certificate approves the aircraft design as meeting airworthiness standards; the Certificate of Airworthiness is for an individual aircraft."),
    2: ("b", "Bhutan's ICAO nationality mark is A5- (e.g. A5-JSW)."),
    3: ("a", "The Bhutan Civil Aviation Authority is the civil aviation regulator."),
    4: ("a", "Differentiate: 2x + 2y + 2x y' = 2y y', so y'(2y - 2x) = 2x + 2y and dy/dx = (x + y)/(y - x)."),
    6: ("b", "In isometric projection the three principal axes are at 120° to each other and equally foreshortened."),
    7: ("d", "Higher doping increases the built-in (barrier) potential."),
    8: ("c", "D = 1101, 5 = 0101: D5 = 11010101."),
    9: ("a", "Both springs act in parallel on the mass: keq = 2k; T = 2π√(m/2k) = 2 gives 2k = π², so k = π²/2."),
    10: ("b", "The last two digits (12) give maximum thickness = 12% of chord: 0.12."),
    11: ("d", "Laminar-flow airfoils keep the boundary layer laminar longer, reducing skin-friction drag."),
    12: ("a", "EAS = TAS √(ρ/ρ0) = 100 x √(0.526/1.225) = 65.5 m/s."),
    13: ("c", "The fin provides directional (yaw) stability; the rudder gives yaw control."),
    14: ("d", "In the lower stratosphere (11-20 km) temperature is constant while pressure and density fall with altitude."),
    15: ("a", "Afterburning increases thrust but burns much more fuel per unit thrust, so sfc rises."),
    16: ("c", "A regenerator uses exhaust heat to preheat compressed air, reducing fuel needed and raising efficiency."),
    17: ("a", "Dry nitrogen pre-charges hydraulic accumulators (inert, no fire risk)."),
    18: ("c", "Winglets reduce wing-tip vortices and hence induced drag."),
    19: ("d", "In semi-monocoque wings, skin and spar webs carry shear from aerodynamic forces and torsion (moment); flanges and stringers carry bending."),
    20: ("c", "The artificial horizon (attitude indicator) shows pitch and bank attitude."),
    21: ("a", "Spars run spanwise and carry the main bending loads."),
    22: ("c", "Mcr is the free-stream Mach number at which sonic flow first appears somewhere on the airfoil."),
    23: ("a", "With pitching, rolling and yawing moments all zero, the aircraft is trimmed."),
    24: ("d", "Energy = 24 V x 40 Ah = 960 Wh, i.e. 960 W for 1 hour."),
    25: ("b", "Wheel base affects load sharing between nose and main gear and ground handling/ stability."),
    26: ("a", "Across a normal shock the Mach number falls (supersonic to subsonic) while pressure, density and temperature rise."),
    27: ("c", "High aspect ratio reduces induced drag (aerodynamics) but increases wing bending and weight (structures)."),
    28: ("a", "In the ideal Brayton cycle, expansion in the turbine is isentropic, producing the shaft power."),
    29: ("c", "Cm,cg = Cm,ac + CL x (distance) = -0.016 + 0.45 x 0.05 = +0.0065."),
    30: ("b", "The modulator turns the transmitter on and off with pulses, impressing the information on the RF carrier."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "The slope of the tangent to the curve y = x³ at the point (1, 1) is", ["1", "2", "3", "6"], "c",
            "dy/dx = 3x² = 3 at x = 1."),
]

SA = [
    ("a) Explain the differences between monocoque and semi-monocoque structures in aircraft. (2 marks)\nb) Discuss the concepts of 'safe life' and 'fail-safe' structures in aircraft design. How do these approaches reduce the risk of catastrophic fatigue failure? Give examples of components typically designed with each approach. (3 marks)",
     [("a) Monocoque: skin carries all loads, few internal members, light but sensitive to dents/ buckling; semi-monocoque: skin reinforced by frames, stringers, longerons/ spars sharing loads, damage tolerant - used in most aircraft", 2),
      ("b) Safe life: component designed/ tested to last a set life with no cracks, then retired (landing gear, engine discs, helicopter rotor parts); fail-safe: multiple load paths/ crack stoppers so failure of one member is carried by others until detected in inspection (wing skin/ stringers, fuselage frames, multi-spar wings); both prevent catastrophic fatigue failure", 3)],
     "a) In a monocoque structure the thin outer skin carries all loads (bending, torsion, shear), with only a few formers to keep the shape; it is simple and light but easily buckles or dents and cannot tolerate damage, so it is used only in small parts or early aircraft. In a semi-monocoque structure the skin is reinforced by frames/bulkheads, stringers, longerons and spars, which share the loads with the skin - stiffer, more damage-tolerant and efficient; it is used in almost all modern fuselages and wings.\nb) Safe-life design gives a component a fixed service life (hours, cycles or landings) determined by analysis and fatigue testing with a large scatter factor, during which it is not expected to develop a crack; it is then retired regardless of condition - e.g. landing-gear legs, engine turbine discs and helicopter rotor hubs. Fail-safe design provides redundancy - multiple load paths, crack stoppers and splices - so that if one member cracks or fails, the remaining structure carries the limit load until the damage is found in a scheduled inspection - e.g. multi-spar wings, wing skin-stringer panels, fuselage frames and window surrounds. (Damage tolerance adds inspection intervals based on crack-growth rates.) Both approaches stop fatigue cracks from causing catastrophic failure: safe life by retiring parts before cracking, fail-safe by ensuring a single failure is survivable and detected."),
    ("a) Calculate the slant range given by distance measuring equipment (DME) for an aircraft 10 NM from the DME ground station (ground distance) at a height of 1 NM. Also find the height of an aircraft above the ground if the DME displays 6.1 NM and the ground distance from the DME station is 6 NM. (3 marks)\nb) Explain briefly the following terms in aircraft weight and balance: (i) datum; (ii) basic empty weight; (iii) mean aerodynamic chord; (iv) useful load. (2 marks)",
     [("a) Slant range = √(10² + 1²) = √101 = 10.05 NM; height = √(6.1² - 6²) = √1.21 = 1.1 NM (≈ 6680 ft)", 3),
      ("b) Datum: reference plane from which arms are measured; basic empty weight: airframe, engines, fixed equipment, unusable fuel, full oil/ hydraulic fluid; MAC: chord of an equivalent rectangular wing, CG expressed as % MAC; useful load: payload + usable fuel + crew = max weight - BEW", 2)],
     "a) DME measures slant range, the straight-line distance from aircraft to station. With ground distance 10 NM and height 1 NM: slant range = √(10² + 1²) = √101 = 10.05 NM. If the DME reads 6.1 NM and the ground distance is 6 NM: height = √(6.1² - 6²) = √(37.21 - 36) = √1.21 = 1.1 NM ≈ 6680 ft.\nb) (i) Datum - an imaginary vertical reference plane chosen by the manufacturer (e.g. the nose or firewall) from which all horizontal distances (arms) for weight and balance are measured. (ii) Basic empty weight - the weight of the airframe, engines, all permanently installed equipment, unusable fuel, full engine oil and hydraulic fluid. (iii) Mean aerodynamic chord (MAC) - the chord of an imaginary rectangular wing with the same aerodynamic characteristics as the actual wing; the CG and its limits are often expressed as a percentage of MAC. (iv) Useful load - the difference between the maximum take-off weight and the basic empty weight: crew, passengers, cargo and usable fuel."),
    ("a) Describe the distinction between the Minimum Equipment List (MEL) and the Configuration Deviation List (CDL), and outline the categories within the MEL. (2 marks)\nb) Distinguish between the centre of pressure and the aerodynamic centre of an airfoil. Explain why the pitching moment about the quarter-chord point is nominally constant in subsonic flight. (3 marks)",
     [("a) MEL: operator's list (from MMEL) of equipment that may be inoperative for dispatch with conditions; CDL: allows missing secondary airframe/ engine parts (panels, fairings) with performance penalties; MEL categories A, B, C, D with rectification intervals (A as specified, B 3 days, C 10 days, D 120 days)", 2),
      ("b) Centre of pressure: point where resultant aerodynamic force acts, zero moment, moves with angle of attack; aerodynamic centre: point where moment is independent of angle of attack, about c/4 subsonic; thin airfoil theory: lift increment acts at c/4, so Cm,c/4 constant (= Cm,0) for unstalled subsonic flow", 3)],
     "a) The Minimum Equipment List is an operator-specific list, based on the manufacturer's Master MEL and approved by the authority, of instruments and equipment that may be inoperative at dispatch, with operational and maintenance conditions. The Configuration Deviation List lists secondary airframe and engine parts (e.g. access panels, fairings, seals) that may be missing at dispatch, usually with performance penalties. MEL rectification categories: A - interval stated in the item's remarks; B - within 3 consecutive calendar days; C - within 10 days; D - within 120 days.\nb) The centre of pressure is the point on the chord where the resultant aerodynamic force acts, so the moment about it is zero; its position moves as the angle of attack changes (forward as lift increases), which makes it inconvenient for analysis. The aerodynamic centre is the point about which the pitching moment does not change with angle of attack; in subsonic flow it is at about the quarter chord. Thin-airfoil theory shows that the additional lift due to an increase in angle of attack acts at c/4, so only the constant camber-related moment remains about that point: Cm,c/4 = Cm,0, nominally constant until stall or compressibility effects."),
    ("a) A hypersonic vehicle with a spherical nose flies at Mach 20 at a standard altitude of 150 000 ft, where the ambient temperature and pressure are 500 °R and 3.06 lb/ft². At the point on the nose surface 20° from the stagnation point, estimate the (i) pressure, (ii) temperature, (iii) Mach number and (iv) velocity of the flow. Take γ = 1.4. (4 marks)\nb) The Northrop F-5 has a wing area of 170 ft². The wing generates 18 000 lb of lift at 250 mi/h at standard sea level (ρ = 0.002377 slug/ft³; 1 mile = 5280 ft). Calculate the lift coefficient. (1 mark)",
     [("a) Modified Newtonian: Cp,max = (p02 - p∞)/q∞ with Rayleigh pitot p02 ≈ 1577 lb/ft², q∞ = (γ/2)p∞M² = 856.8 → Cp,max ≈ 1.837; surface inclination θ = 70°, Cp = Cp,max sin²70° ≈ 1.62 → p ≈ 1393 lb/ft²", 2),
      ("a) T0 = 500(1 + 0.2 x 400) = 40 500 °R; isentropic from stagnation: M ≈ 0.425, T ≈ 39 100 °R, V = M√(γRT) ≈ 4120 ft/s (calorically perfect gas)", 2),
      ("b) V = 366.7 ft/s; q = ½ρV² = 159.8 lb/ft²; CL = L/(qS) = 18 000/(159.8 x 170) ≈ 0.66", 1)],
     "a) Using modified Newtonian theory: free-stream dynamic pressure q∞ = (γ/2) p∞ M² = 0.7 x 3.06 x 400 = 856.8 lb/ft². Stagnation pressure behind the normal shock (Rayleigh pitot formula) p02 ≈ 1577 lb/ft², so Cp,max = (1577 - 3.06)/856.8 ≈ 1.837. At 20° from the stagnation point the surface is inclined at θ = 90° - 20° = 70° to the free stream: Cp = Cp,max sin²θ = 1.837 x 0.883 ≈ 1.62. (i) p = p∞ + Cp q∞ ≈ 3.06 + 1.62 x 856.8 ≈ 1393 lb/ft². Total temperature T0 = T∞(1 + 0.2M²) = 500 x 81 = 40 500 °R (calorically perfect gas, a rough assumption at this speed). Isentropic expansion from p02 to p: (p02/p)^(0.2857) = 1 + 0.2M², giving (iii) M ≈ 0.425; (ii) T = T0/(1 + 0.2M²) ≈ 39 100 °R; (iv) V = M√(γRT) = 0.425 x √(1.4 x 1716 x 39 100) ≈ 4120 ft/s.\nb) V = 250 x 5280/3600 = 366.7 ft/s; q = ½ x 0.002377 x 366.7² = 159.8 lb/ft²; CL = L/(qS) = 18 000/(159.8 x 170) ≈ 0.66."),
]
for i, (s, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=5, topic=T, stem=s, key_points=kp, model=mod))

C1 = """Case I: The impact of emerging technologies on aviation maintenance
As an airworthiness officer or flight safety officer you ensure the safety, reliability and efficiency of aircraft operations. New tools and methods are rapidly changing aviation maintenance. Your task is to analyse these emerging technologies and propose how they can be integrated into current maintenance processes to improve safety, efficiency and cost-effectiveness."""
C2 = """Case II: Mitigating aircraft noise and emissions
XYZ Airline operates mid-sized commercial jets on regional and intercontinental routes. Its noise near airports (especially at take-off and landing) and its CO2 and NOx emissions are under scrutiny, with stricter regulations. The airline has started an environmental initiative:
- Technological upgrades: quieter, more fuel-efficient engines with advanced materials and aerodynamics; noise-reducing technologies (chevron nozzles, acoustic liners, modified wing and landing-gear designs); emissions control with cleaner fuels, advanced exhaust systems and Sustainable Aviation Fuels (SAFs).
- Operational changes: optimised flight paths including continuous descent approaches; schedules limiting night flights in noise-sensitive areas; commitment to exceed current environmental regulations."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("aero2024", 1, T, C1, items=[
    it("1. Explain how the Internet of Things (IoT) can be used in aviation maintenance to improve real-time monitoring and predictive maintenance. Discuss the benefits and challenges of implementing IoT in aviation.", 10,
       [("Uses: sensors on engines, APU, landing gear, structures (vibration, temperature, pressure, oil debris), ACARS/ datalinks, health and usage monitoring (HUMS/ EHM); cloud analytics, predictive models, parts tracking with RFID", 5),
        ("Benefits: fewer unscheduled removals, AOG reduction, condition-based tasks, cost savings, safety; challenges: data volume/ quality, cybersecurity, certification of sensors/ software, integration with legacy fleet, cost, skills", 5)],
       "IoT connects sensors on aircraft systems - engines (vibration, exhaust gas temperature, oil pressure and debris), APU, landing gear, brakes, tyres, structures and cabin systems - to ground systems through ACARS, satellite or gate-link datalinks. Engine health and usage monitoring transmits data in flight, so maintenance control sees problems before landing; cloud analytics and machine-learning models detect trends and predict failures (e.g. bearing wear), allowing parts and technicians to be ready; RFID tags track parts, tools and life-limited components. Benefits: fewer unscheduled removals and aircraft-on-ground events, condition-based instead of fixed-interval tasks, better reliability and safety, and lower costs and spares inventory. Challenges: huge data volumes and data quality, cybersecurity of aircraft and ground networks, certification of new sensors and software, retrofitting older fleets, high initial cost, data ownership among operator, OEM and MRO, and the need for data-analytics skills."),
    it("2. Augmented reality (AR) is increasingly used in aviation maintenance. Discuss how AR can assist technicians and its impact on training and operational efficiency, with examples of scenarios where AR is most beneficial.", 10,
       [("Assistance: overlays of manuals/ task cards, step-by-step instructions, wiring/ hidden component visualisation, remote expert support, hands-free documentation", 4),
        ("Training/ efficiency: realistic practice without aircraft, faster learning, fewer errors, shorter task times, standardisation", 3),
        ("Examples: engine borescope/ component changes, wiring troubleshooting, NDT inspection guidance, cabin/ line maintenance at outstations (remote support - e.g. Paro), training on new types", 3)],
       "AR devices (smart glasses, tablets) overlay digital information on the real aircraft: the relevant maintenance manual pages and task cards appear step by step, components hidden behind panels or wiring routes are visualised, torque values and warnings are displayed, and technicians can work hands-free and record completion automatically. Remote experts can see what the technician sees and guide them. Training: trainees practise procedures on virtual or augmented models without taking aircraft out of service, learn faster and retain more; standardised guidance reduces human error. Operational efficiency: shorter task times, fewer mistakes and re-work, better documentation and quicker troubleshooting. Examples: engine component replacement and borescope inspections; complex wiring fault-finding; guided non-destructive inspections; line maintenance at remote outstations (such as Paro or regional airports) with remote OEM support; and type training for new aircraft."),
    it("3. Robotics and artificial intelligence (AI) are transforming inspections and repairs. Propose a strategy for integrating them into an existing aircraft maintenance organisation, covering: the tasks to automate; the potential risks and how to mitigate them; and training requirements for personnel.", 10,
       [("Tasks: repetitive/ hazardous inspections - drone/ robotic visual inspections of fuselage after lightning strikes, automated NDT (ultrasonic/ eddy current crawlers), borescope image analysis by AI, paint stripping/ painting, predictive analytics, records digitisation", 4),
        ("Risks and mitigation: false positives/ negatives, data bias, cybersecurity, regulatory approval, over-reliance, safety around robots - human verification, validation trials, certification, cybersecurity, change management, phased pilot", 3),
        ("Training: data and AI literacy, robot operation and maintenance, new NDT procedures, human factors, updated authorisations; phased plan with KPIs", 3)],
       "Strategy: start with a needs assessment and a phased pilot. Tasks to automate: repetitive, time-consuming or hazardous inspections - drones and crawler robots for external visual inspection after lightning or bird strikes, automated ultrasonic and eddy-current NDT scanning of composites and fuselage panels, AI analysis of borescope and inspection images to detect cracks and corrosion, robotic paint stripping and painting, and AI predictive maintenance on fleet data, plus digitising maintenance records. Risks and mitigation: wrong AI results (false positives or missed defects) - validate against traditional methods and keep human sign-off; poor or biased training data - use quality, representative data; cybersecurity - secure networks and access control; regulatory acceptance - work with the authority and OEM for approved procedures; over-reliance and skill loss - keep manual competence; workplace safety around robots - safety zones and procedures; cost - business case and gradual investment. Training: AI and data literacy for engineers, operating and maintaining robots and drones, new NDT and inspection procedures, interpreting AI outputs, human factors and updated licences/authorisations; measure success with KPIs (inspection time, findings, delays) before scaling up."),
    it("4. Identify and analyse the key ethical and regulatory challenges of adopting AI and robotics in aviation maintenance. How would you address them as an airworthiness or flight safety officer?", 10,
       [("Challenges: certification/ approval of AI (non-deterministic, explainability), accountability/ liability for decisions, data privacy and ownership, bias, cybersecurity, job displacement/ deskilling, human oversight, standards lagging", 5),
        ("Response: risk-based acceptance with regulator (EASA/ ICAO guidance), human-in-the-loop sign-off, validation and audit trails, data governance, cybersecurity requirements, training/ reskilling, SMS hazard analysis, gradual approval, reporting culture", 5)],
       "Challenges: (1) certification - AI systems learn from data and are not fully deterministic or explainable, so traditional software assurance (DO-178C) does not fit easily; (2) accountability - who is responsible if an AI misses a defect: the engineer, operator, software supplier or regulator; (3) data issues - quality, bias, privacy and ownership of maintenance and crew data; (4) cybersecurity of connected tools; (5) workforce - job displacement, deskilling and over-reliance on automation; (6) regulations lagging behind technology and differing between states. As an airworthiness or flight safety officer I would: apply a risk-based approach through the safety management system (hazard identification for each AI application); require human-in-the-loop decisions and certifying staff sign-off; demand validation evidence, explainability and audit trails; follow ICAO and EASA AI guidance and develop national requirements with BCAA; set data governance and cybersecurity rules; ensure training and reskilling; start with low-risk applications and expand after evidence; and promote a just reporting culture to learn from issues."),
    it("5. An AI system predicts a potential failure in an aircraft component, but traditional inspection methods do not confirm it. As an airworthiness officer, how would you approach this? Discuss the steps you would take to ensure safety while considering the reliability of emerging technologies.", 10,
       [("Safety first: treat prediction as a potential hazard - risk assessment of component criticality; if safety-critical, consider grounding/ restriction or precautionary replacement", 3),
        ("Investigate: review AI data/ model inputs, sensor validity, repeat/ additional inspections with more sensitive NDT, OEM consultation, trend monitoring, component tear-down/ shop analysis", 4),
        ("Decision and learning: document, decide with engineering/ OEM, feedback to improve AI, record false/ true positive, update procedures, report under SMS; balance trust in new tech with evidence", 3)],
       "Steps: (1) Treat the AI warning as a possible hazard - assess the component's criticality and the consequences of failure; for a safety-critical part, apply a precautionary measure (restrict operations, increase inspection, or replace the part) until resolved. (2) Verify the data - check sensor health, data quality and the AI model's inputs and confidence, and whether similar alerts were reliable before. (3) Investigate further - repeat the inspection with more sensitive or different methods (e.g. eddy current or ultrasonic instead of visual, borescope, oil analysis), consult the OEM and reliability engineers, and if the part is removed, perform a shop tear-down to find the truth. (4) Decide and document - make a risk-based decision with engineering and quality, recording the rationale. (5) Learn - feed the outcome back to improve the AI (true or false positive), update procedures and thresholds, report through the safety management system and share with the regulator. Safety is never compromised: an unverified prediction is not ignored, but emerging technology is validated against evidence before it alone drives decisions."),
])
Q += case("aero2024", 2, T, C2, items=[
    it("1. Analyse the engineering principles behind redesigning aircraft engines to reduce noise and emissions. Discuss the benefits, challenges and overall environmental impact of these engines in the airline's fleet.", 10,
       [("Principles: high bypass ratio (lower jet velocity → less jet noise, better propulsive efficiency), geared turbofan, advanced fan blades/ materials (composites, CMCs), higher overall pressure ratio/ temperatures, lean-burn/ staged combustors for NOx, acoustic design", 5),
        ("Benefits (15-25% fuel/ CO2 cut, lower noise footprint), challenges (cost, weight/ drag of large nacelles, NOx-efficiency trade-off, maintenance, durability, certification), environmental impact", 5)],
       "Principles: (1) high bypass ratio turbofans move a larger mass of air at lower velocity - thrust ≈ ṁΔV - improving propulsive efficiency and greatly reducing jet noise, which scales strongly with jet velocity; geared turbofans let the fan turn slower than the turbine, reducing fan noise and improving efficiency; (2) higher overall pressure ratios and turbine temperatures with advanced materials (composite fan blades, ceramic matrix composites, single-crystal alloys) raise thermal efficiency, cutting fuel burn and CO2; (3) lean-burn or staged (TAPS) combustors reduce flame temperature peaks and NOx; (4) acoustic design - swept fan blades, optimised blade counts and acoustic liners. Benefits: about 15-20% lower fuel burn and CO2 per seat, large reductions in noise footprints around airports, lower operating costs and better public image. Challenges: high purchase cost, larger heavier nacelles and installation drag, the trade-off between higher combustion temperature (efficiency) and NOx, new maintenance demands and early reliability issues, and certification. Overall, fleet renewal with such engines is one of the most effective ways to reduce the airline's environmental impact, though growth in traffic can offset gains."),
    it("2. Using the data below, calculate the thrust generated by the redesigned engine and explain how the new design affects thrust-to-weight ratio, fuel efficiency and emissions, and how these calculations influence the aircraft's performance and environmental footprint.\nData: bypass ratio 10:1; inlet air velocity 300 m/s; exhaust gas velocity 600 m/s; mass flow rate of air through the engine 500 kg/s; mass flow rate of fuel 10 kg/s.", 5,
       [("Thrust (single-stream momentum, pressure thrust neglected): F = (ṁa + ṁf)Ve - ṁa Vi = 510 x 600 - 500 x 300 = 156 000 N = 156 kN (state assumption on bypass)", 3),
        ("Interpretation: TSFC = 10/156 000 = 6.4 x 10⁻⁵ kg/(N·s) ≈ 0.23 kg/(N·h); high bypass gives more thrust per fuel; lighter engine improves T/W; lower fuel → lower CO2 (3.16 kg CO2 per kg fuel), NOx depends on combustor", 2)],
       "Assuming the 500 kg/s is the total air flow and treating the exhaust as one stream with no pressure thrust: F = (ṁa + ṁf)Ve - ṁa Vi = (500 + 10) x 600 - 500 x 300 = 306 000 - 150 000 = 156 000 N ≈ 156 kN. (With a bypass ratio of 10:1, about 455 kg/s would pass through the fan and 45 kg/s through the core; separate stream velocities would be needed for an exact answer.) Thrust-specific fuel consumption = 10/156 000 = 6.4 x 10⁻⁵ kg/(N·s) ≈ 0.23 kg/(N·h). A high bypass ratio produces large thrust with a modest exhaust velocity, so propulsive efficiency is high and fuel burn per unit thrust is low; if engine weight is not given, thrust-to-weight cannot be calculated, but lighter materials raise it. Lower fuel burn directly cuts CO2 (about 3.16 kg CO2 per kg of jet fuel) and costs, giving better range and payload; NOx depends mainly on combustor design and temperature."),
    it("3. Evaluate the effectiveness of advanced noise-reducing materials and design principles used in aircraft, considering cost, weight, maintenance and compliance with noise regulations in real-world use.", 10,
       [("Technologies: chevron nozzles (mixing, jet noise ↓ 2-3 dB), acoustic liners (Helmholtz resonators/ honeycomb in nacelles, fan noise), fan design, landing gear fairings, slat/ flap edge treatments, quieter APUs", 5),
        ("Evaluation: noise reductions vs small thrust/ drag penalties, weight added, cost, maintenance of liners (damage, contamination), certification to ICAO Annex 16 chapters, airport curfews/ charges benefits", 5)],
       "Technologies: chevron (serrated) nozzles mix core, bypass and ambient air more gradually, reducing jet noise by about 2-3 dB at take-off with a small thrust loss (about 0.25%); acoustic liners - perforated honeycomb panels acting as Helmholtz resonators in the inlet and bypass duct - absorb fan tones; optimised fan blades and stator spacing reduce fan noise; landing-gear fairings and slat/flap edge treatments reduce airframe noise on approach; quieter APUs. Evaluation: together they make modern aircraft meet ICAO Annex 16 Chapter 4/14 noise standards and avoid airport noise charges, curfews and restrictions, improving community relations. Costs and penalties: added weight (liners, fairings) and slight drag or thrust losses increase fuel burn a little; development and retrofit costs are high; liners need inspection and repair (damage, contamination by fluids) and gear fairings add maintenance. Overall they are cost-effective for new aircraft and engines, but retrofitting old aircraft is less attractive; noise abatement procedures add further benefit at low cost."),
    it("4. Discuss the impact of optimising flight paths on noise pollution and fuel efficiency, and analyse the challenges of implementing these changes, including possible conflicts with air traffic control and the implications for the airline's environmental performance and public perception.", 10,
       [("Impact: continuous descent approaches (idle thrust, less level flight → lower noise, 100-300 kg fuel saved per approach), noise-preferential routes avoiding residential areas, PBN/ RNP direct routing, optimal cruise altitudes/ speeds", 5),
        ("Challenges: ATC capacity and separation in busy airspace, need for PBN/ RNP procedures and equipment, airspace redesign/ approvals, concentrating noise on certain communities, mountainous terrain (e.g. Paro); implications: lower emissions and better public image if communicated", 5)],
       "Optimised flight paths reduce both noise and fuel: continuous descent approaches keep engines near idle and avoid level segments at low altitude, reducing noise under the approach by several decibels and saving about 100-300 kg of fuel per approach; noise-preferential routes and steeper, curved RNP approaches avoid residential areas; performance-based navigation allows more direct routes and optimal climb and cruise profiles, cutting fuel burn and CO2. Challenges: in busy airspace ATC must keep separation and capacity, so CDAs and preferred routes are not always possible at peak times; procedures must be designed, approved and published, and aircraft and crews need PBN/RNP capability and training; concentrating flights on fixed tracks can shift noise to new communities and cause complaints; terrain and weather (e.g. mountainous approaches like Paro) limit options; coordination with airports, ATC and regulators is needed. Implications: when implemented well, the airline lowers fuel costs and emissions and shows visible action, improving public perception; poor communication or shifting noise can harm relations, so community engagement and transparent reporting are important."),
    it("5. Analyse the potential of Sustainable Aviation Fuels (SAFs) to reduce the airline's carbon footprint. Discuss their benefits, challenges, impact on overall emissions and long-term sustainability.", 10,
       [("SAF: drop-in fuels from biomass/ waste oils (HEFA), alcohol-to-jet, Fischer-Tropsch, power-to-liquid e-fuels; blended up to 50% (certified ASTM D7566); life-cycle CO2 cut up to ~80%", 4),
        ("Benefits: no aircraft/ infrastructure change, lower particulates/ sulphur, energy security; challenges: cost 2-5x, limited supply/ feedstock sustainability, land use, certification, policy support needed; impact and long-term role (mandates, CORSIA, net-zero 2050)", 6)],
       "Sustainable aviation fuels are drop-in jet fuels made from renewable or waste feedstocks - used cooking oil and fats (HEFA), agricultural and forestry residues, municipal waste (Fischer-Tropsch), alcohols (alcohol-to-jet) and synthetic e-fuels from green hydrogen and captured CO2 (power-to-liquid). Certified under ASTM D7566, they can currently be blended up to 50% with conventional fuel without changes to engines or airports. Because the carbon was recently absorbed from the atmosphere, life-cycle CO2 can be cut by up to about 80% (more for e-fuels), and they also emit fewer particulates and sulphur. Challenges: SAF costs two to five times more than kerosene, supply is very limited (well under 1% of jet fuel today), feedstocks must be truly sustainable (avoiding food competition and deforestation), production needs large investment and policy support (mandates, incentives, CORSIA credits), and certification of new pathways takes time. For the airline, SAF is a key long-term route to decarbonise existing fleets alongside efficient aircraft; its impact grows as supply scales up under mandates towards net-zero by 2050."),
    it("6. Based on your analysis, propose areas for further research or technological development to help the airline achieve greater environmental sustainability, and discuss how future aeronautical innovations could influence the industry's approach to noise and emissions.", 5,
       [("Research areas: open-rotor/ ultra-high bypass engines, hybrid-electric and hydrogen propulsion, blended-wing body, lighter composites, SAF/ e-fuel production, contrail avoidance, AI flight optimisation, noise-shielding designs", 3),
        ("Influence: shift from incremental to radical designs, new infrastructure, regulations, zero-emission regional aircraft, data-driven operations", 2)],
       "Areas for development: ultra-high-bypass and open-rotor engines; hybrid-electric and hydrogen (fuel cell or combustion) propulsion for regional aircraft; new airframes such as blended-wing bodies and high-aspect-ratio truss-braced wings with engine noise shielding; lighter composite and additive-manufactured structures; scaling up SAF and e-fuel production; contrail-avoidance routing and AI-based flight optimisation. Influence: these could move the industry from incremental improvements to step changes - zero-emission regional flights, much quieter aircraft and new airport infrastructure (hydrogen, charging) - while regulations and carbon pricing will push faster adoption; airlines that invest early in research partnerships and fleet planning will lead in sustainability."),
])
PATTERN = STANDARD
