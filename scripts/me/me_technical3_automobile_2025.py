"""ME Technical Paper III (Subject Specialisation Paper), Automobile Engineering, BCSE 2025 - real paper (PDF sent by the founder).
Pattern: Section A Part I 30 MCQ, Part II 4 short answers x 5; Section B one of two case studies (50). 150 min + 15 min reading.
Left out: MCQ 9 and 10 (picture-based, not readable enough), 18 (options c and d identical), 19 (two parts arguably do this),
22 (all four statements look correct); five new MCQs keep Part I at 30. Figures for MCQ 23, short answer 1 and Case II are
in public/papers/me/tech3-auto-2025-*.png.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Automobile Engineering): BCSE 2025, batch 1"
GROUP_TAG = "auto2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "automobile-engineering"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Automobile Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Automobile Engineering"

MCQ = r"""[
{
"n": 1,
"stem": "According to Heinrich’s Law, which of the following number combinations best completes the statement below? “Heinrich’s Law states that for every major or fatal accident, there are approximately (A) minor accidents and (B) near-miss incidents caused by the same underlying hazards.”",
"opts": [
"(A)19, (B)300",
"(A)19, (B)400",
"(A)29, (B)300",
"(A)29, (B)400"
]
},
{
"n": 2,
"stem": "Which of the following safety-related statements is inappropriate in an automotive workshop setting?",
"opts": [
"When drilling holes in parts with an electric drill, always wear gloves to prevent injury to your hands from the drill.",
"When moving a chain block or electric hoist, do so from a position away from the lifted object.",
"When jacking up a car with a garage jack, use wheel chocks appropriately, and do not move the jack while the car is jacked up.",
"When charging lead-acid batteries, hydrogen and oxygen gases are produced, so keep them away from open flames."
]
},
{
"n": 3,
"stem": "A technician accidentally spills sulfuric acid from a lead-acid battery onto their skin. What is the most appropriate immediate action to take?",
"opts": [
"Wipe the acid off with a dry cloth",
"Apply hand sanitizer to neutralize the acid",
"Rinse the affected area with plenty of water and seek medical attention if needed",
"Continue working and check for irritation later"
]
},
{
"n": 4,
"stem": "A workshop manager is preparing a risk assessment for welding tasks conducted near flammable materials. According to standard safety protocols, which of the following actions should be taken before starting the work?",
"opts": [
"Ensure the welder is wearing PPE and proceed without further action",
"Assign a fire extinguisher to the area and start work immediately",
"Remove or shield all flammable materials, implement a hot work permit system, and ensure fire watch procedures are in place",
"Inform employees to be cautious and proceed with normal operations"
]
},
{
"n": 5,
"stem": "Which physical law forms the basic principle behind the operation of hydraulic brake systems?",
"opts": [
"Pascal's law",
"Newton’s law",
"Law of conservation of energy",
"Law of conservation of momentum"
]
},
{
"n": 6,
"stem": "What is the consequence of excessive moisture absorption in brake fluid?",
"opts": [
"Increased brake pad wear",
"Decreased brake fluid pressure",
"Lower boiling point of the fluid",
"Lower freezing point of the fluid"
]
},
{
"n": 7,
"stem": "A vehicle pulls to the right while driving. Technician A claims the cause could be more positive camber on the right side than on the left. Technician B suggests it could be due to more toe-in on the left side than the right. Who is correct?",
"opts": [
"A only",
"B only",
"Both A and B",
"Neither A nor B"
]
},
{
"n": 8,
"stem": "A car needs 3 revolutions of the steering wheel to turn the wheel from the most right to the full left position. What is the steering ratio, if the front wheel has been turned 72°?",
"opts": [
"12:1",
"13:1",
"14:1",
"15:1"
]
},
{
"n": 9,
"stem": "When the right-side tire moves in the direction indicated by arrow ①, how do the stabilizer and torsion bars behave?",
"opts": [
"Left tire moves upward, both torsion bars twist inward",
"Left tire moves downward, both torsion bars twist outward",
"Left tire moves upward, both torsion bars twist to the right",
"Left tire moves downward, both torsion bars twist to the left"
]
},
{
"n": 10,
"stem": "In the diagram of a rear rigid axle suspension system, if the suspension shortens (the lateral rod length remains constant), which direction does the vehicle body move?",
"opts": [
"Direction a (Right)",
"Direction b (Bottom right)",
"Direction c (Left)",
"Direction d (Bottom left)"
]
},
{
"n": 11,
"stem": "What component in modern manual transmissions eliminates the need for double-clutching?",
"opts": [
"Equalizers",
"Motivators",
"Elite motor oil",
"Synchronizers"
]
},
{
"n": 12,
"stem": "If the propeller shaft is out of balance, engine speed is 3000 rpm, and the transmission gear ratio is 3.0, what is the resulting vibration frequency?",
"opts": [
"7.7 Hz",
"12.4 Hz",
"16.6 Hz",
"22.2 Hz"
]
},
{
"n": 13,
"stem": "The clutch release bearing is positioned between:",
"opts": [
"Flywheel and pressure plate",
"Clutch disc and pressure plate",
"Pressure plate and release fork",
"Clutch master cylinder"
]
},
{
"n": 14,
"stem": "Which of the following is the most probable cause of a diaphragm spring clutch failing to disengage?",
"opts": [
"Worn or broken damper spring in the clutch disc",
"Excessive clutch disc runout",
"Hardened or worn clutch disc friction material",
"Deteriorated clutch spring"
]
},
{
"n": 15,
"stem": "What problem may result from excessive bearing preload in a differential assembly?",
"opts": [
"Failure of Oil seal",
"Loose gear engagement",
"Noisy differential operation",
"Excessive heat and bearing failure"
]
},
{
"n": 16,
"stem": "Why is checking the gear mesh pattern important during differential setup?",
"opts": [
"To set pinion bearing clearance",
"To measure differential oil thickness",
"To align the axle shafts",
"To ensure optimal gear contact for smooth operation"
]
},
{
"n": 17,
"stem": "How is the alternator's output voltage regulated?",
"opts": [
"By cutting current to the rotor coil",
"By cutting current to the stator coil",
"By using a neutral diode",
"By shifting stator coil phases by 120°"
]
},
{
"n": 18,
"stem": "When a probe is connected between the alternator's B and E terminals and the waveform shown in Figure 2 is observed, what is the most likely fault?",
"opts": [
"One diode is open",
"One diode is shorted",
"One phase of the stator coil is open",
"One phase of the stator coil is open"
]
},
{
"n": 19,
"stem": "In a reduction-type starter motor, which part quickly disengages the pinion from the ring gear after the engine starts?",
"opts": [
"Magnetic switch",
"Overrunning clutch",
"Planetary gear",
"Pinion shaft thread spline"
]
},
{
"n": 20,
"stem": "Which statement about the starter motor's output characteristics is incorrect?",
"opts": [
"Current in the armature coil is highest when the pinion speed is zero",
"Drive torque increases with pinion speed",
"Drive torque is proportional to armature current",
"As speed increases, back EMF rises and armature current decreases"
]
},
{
"n": 21,
"stem": "What does a car alarm system typically detect?",
"opts": [
"Engine oil level",
"Tire pressure",
"Unauthorized access or impact",
"Coolant temperature"
]
},
{
"n": 22,
"stem": "Which statement about vehicles with immobilizers is incorrect?",
"opts": [
"Immobilizer verifies key code via transmitter and receiver",
"Unregistered key prevents engine start by disabling ignition signal",
"Lost keys can be replaced by registering new keys in the system",
"Replacing the ECU require key re-registration"
]
},
{
"n": 23,
"stem": "According to the light-off alarm circuit diagram, which switch positions will cause the buzzer to sound? \"The buzzer sounds when the light switch is ON, the key switch is (A), and the door switch is (B).\"",
"opts": [
"(A) OFF, (B) ON",
"(A) OFF, (B) OFF",
"(A) ON, (B) OFF",
"(A) ON, (B) ON"
]
},
{
"n": 24,
"stem": "A customer reports that the right headlight is not working (halogen bulb), while the left side is functional. The right headlight connector shows 12V, but the bulb does not light. What is the most likely cause?",
"opts": [
"Blown fuse for the headlight circuit",
"Open ground connection on right headlight",
"Faulty headlight switch",
"Failed alternator"
]
},
{
"n": 25,
"stem": "Which component converts electrical signals into sound in a car audio system?",
"opts": [
"Amplifier",
"Antenna",
"Speaker",
"Headlight relay"
]
},
{
"n": 26,
"stem": "After installing a new head unit, the radio works but loses saved settings when the ignition is turned off. What is the most likely cause?",
"opts": [
"Improper antenna grounding",
"Battery power (constant) wire not connected properly",
"Shorted speaker wires",
"Faulty ignition switch"
]
},
{
"n": 27,
"stem": "What is a correct description of the variable valve timing mechanism?",
"opts": [
"Inlet valve closes earlier to improve high-speed volumetric efficiency.",
"Inlet valve closes later to improve high-speed volumetric efficiency",
"Exhaust valve closes later to stabilize idle",
"Inlet valve opens earlier to stabilize idle"
]
},
{
"n": 28,
"stem": "A scan tool shows the coolant temperature sensor reads 140°C when the actual coolant temperature is 20°C. When the coolant temperature input line to the ECU was disconnected, the coolant temperature changed to -40°C.What is the most probable cause?",
"opts": [
"Faulty coolant temperature sensor",
"Signal wire disconnected",
"Faulty engine ECU",
"Ground line wire disconnected"
]
},
{
"n": 29,
"stem": "The Exhaust Gas Recirculation (EGR) system helps reduce:",
"opts": [
"CO2 emissions",
"CO emissions",
"NOX emissions",
"Particulate matters"
]
},
{
"n": 30,
"stem": "Which statement best describes a common rail high-pressure fuel injection system?",
"opts": [
"Storing pressurized fuel in the common rail ensures a fuel injection pressure that is appropriate for the engine's condition, improving engine performance.",
"Precise injection timing improves combustion temperature and reduces black smoke and nitrogen oxide emissions.",
"Pilot injection in the intake stroke before main injection reduces noise and vibration",
"Atomized fuel spray reduces surface area of fuel and improves combustion"
]
}
]"""

KEY = {
    1: ("c", "Heinrich: 1 major : 29 minor : 300 near misses."), 2: ("a", "Gloves must NOT be worn with rotating drills - they can be caught."),
    3: ("c", "Flush with plenty of water, then get medical help."), 4: ("c", "Remove/shield flammables, hot-work permit and fire watch."),
    5: ("a", "Hydraulic brakes work on Pascal's law."), 6: ("c", "Brake fluid is hygroscopic; water lowers its boiling point (vapour lock)."),
    7: ("a", "A vehicle pulls toward the side with more positive camber; toe mainly affects tyre wear."),
    8: ("d", "3 turns = 1,080° of steering wheel for 72° of road wheel: 15:1."), 11: ("d", "Synchronisers match gear speeds."),
    12: ("c", "Propeller shaft speed = 3000/3 = 1000 rpm = 16.7 Hz."), 13: ("c", "The release bearing sits between the pressure plate (fingers) and the release fork."),
    14: ("b", "Excessive disc run-out makes the disc drag (fail to release)."), 15: ("d", "Too much preload causes heat and early bearing failure."),
    16: ("d", "The contact pattern confirms correct gear mesh for quiet, long-lasting operation."), 17: ("a", "The regulator controls the rotor (field) current."),
    20: ("b", "Starter torque falls as pinion speed rises."), 21: ("c", "Alarms detect unauthorised entry or impact."),
    23: ("a", "The light-on reminder sounds with lights ON, key OFF and driver's door open (door switch ON)."),
    24: ("b", "Voltage present but no light: open ground (or bulb)."), 25: ("c", "Speakers convert electrical signals to sound."),
    26: ("b", "Memory needs the constant battery (+B) feed."), 27: ("b", "Closing the inlet valve later at high speed improves volumetric efficiency."),
    28: ("a", "−40 °C on disconnection shows wiring and ECU respond correctly; the sensor itself is faulty (shorted)."),
    29: ("c", "EGR lowers combustion temperature and NOx."), 30: ("a", "The rail stores high-pressure fuel so injection pressure suits engine conditions."),
}
FIX = {23: {"image": "/papers/me/tech3-auto-2025-buzzer-circuit.png"}}
T = TOPIC
Q = mcqs(MCQ, KEY, T, FIX) + [
    new_mcq(1, T, "The usual firing order of an inline four-cylinder engine is", ["1-2-3-4", "1-3-4-2", "1-4-2-3", "1-2-4-3"], "b", "1-3-4-2 (or 1-2-4-3 on some) - 1-3-4-2 is the most common."),
    new_mcq(2, T, "The main function of the thermostat in an engine cooling system is to", ["pump coolant through the engine", "regulate coolant flow to the radiator to keep operating temperature", "cool the engine oil", "pressurise the radiator"], "b", "It stays closed until the engine is warm, then opens."),
    new_mcq(3, T, "An anti-lock braking system (ABS) mainly", ["shortens pedal travel", "prevents wheel lock-up so steering control is kept", "increases brake fluid boiling point", "replaces the handbrake"], "b", "ABS modulates pressure to stop the wheels locking."),
    new_mcq(4, T, "A three-way catalytic converter reduces", ["CO₂, H₂O and N₂", "CO, HC and NOx", "only soot", "only NOx"], "b", "It oxidises CO and HC and reduces NOx."),
    new_mcq(5, T, "During charging, a lead-acid battery gives off an explosive gas, which is", ["oxygen", "nitrogen", "hydrogen", "carbon monoxide"], "c", "Hydrogen (with oxygen) is released - keep flames away."),
    saq(1, T, """A customer reports that a warning light has illuminated on their diesel vehicle dashboard, as shown in the figure.
a) What actions should be taken to resolve this issue? (2.5 marks)
b) What precautions or guidelines should be followed when taking action? (2.5 marks)""",
        [("a) Identify water-in-fuel warning; drain water from fuel filter/sedimenter, replace filter if needed, bleed air, check fuel source", 2.5), ("b) Engine off, cool; follow manual; catch and dispose of fuel/water properly; no flames; bleed system; check light goes off; avoid driving long with light on", 2.5)],
        """a) The light is the water-in-fuel (fuel filter/sedimenter) warning. Stop the engine, drain the water from the fuel filter/water separator using the drain plug or priming pump, replace the filter if it is old or clogged, bleed air from the fuel system, restart and check the light goes out; if water keeps coming, check the fuel tank and the fuel supplier.
b) Do it with the engine off and cool, following the owner's/service manual; wear gloves and goggles; no smoking or flames; collect the fuel-water mixture in a container and dispose of it properly; tighten the drain plug and check for leaks; bleed air fully; do not keep driving with the light on, because water damages the high-pressure pump and injectors.""", image="/papers/me/tech3-auto-2025-warning-light.png"),
    saq(2, T, """A customer owns a turbocharged diesel-engine vehicle that complies with BS6 (Bharat Stage 6) emission standards.
a) Which type of engine oil would you recommend for this vehicle? (2.5 marks)
b) What are the reasons for your recommendation? (2.5 marks)""",
        [("a) Low-SAPS (low ash, sulphur, phosphorus) synthetic diesel oil meeting OEM spec, e.g. API CK-4 / ACEA C3, typical grade 5W-30", 2.5), ("b) Protects DPF/SCR/catalysts from ash, withstands turbo heat, cleanliness and soot control, fuel economy, warranty", 2.5)],
        """a) A fully synthetic, low-SAPS diesel engine oil approved by the manufacturer - for example API CK-4 or ACEA C2/C3 - usually of a low viscosity grade such as 5W-30 (or the grade in the owner's manual).
b) BS6 vehicles have a diesel particulate filter and SCR/catalysts; low sulphated ash, phosphorus and sulphur oil prevents clogging and poisoning of these devices. The turbocharger runs very hot and fast, so it needs oil that resists breakdown and coking. Good detergency keeps soot suspended, low viscosity gives quick protection at cold start and better fuel economy, and the correct spec keeps the warranty valid."""),
    saq(3, T, """Describe the basic function of the ignition system in a petrol engine.
a) What is the main purpose of the ignition system? (2 marks)
b) Name three main components of a conventional ignition system (distributor type) and describe their roles. (3 marks)""",
        [("a) Produce a high-voltage spark at the right time to ignite the air-fuel mixture", 2), ("b) Three components with roles: ignition coil (steps up 12 V to thousands of volts), contact breaker/distributor (times and distributes spark), spark plug (makes the spark); also condenser, battery", 3)],
        """a) To produce a high-voltage spark (about 15-30 kV) at the spark plug at exactly the right moment in the compression stroke, so the compressed air-fuel mixture is ignited in each cylinder in the correct firing order.
b) Ignition coil - transforms battery 12 V into high voltage. Distributor with contact breaker (and condenser) - switches the coil's primary current to time the spark and sends the high voltage to each cylinder in firing order. Spark plug - creates the spark across its gap inside the combustion chamber."""),
    saq(4, T, "A customer who drives a passenger car reports that their car frequently overheats. Write at least five actions to be taken to resolve this issue. (5 marks)",
        [("Five actions, 1 mark each: check coolant level and leaks; radiator (blocked/clean fins), cap; thermostat; water pump and drive belt; cooling fan/fan switch/relay; hoses; head gasket test; correct coolant mix", 5)],
        """1. Check coolant level and look for leaks (hoses, radiator, water pump, heater core); top up with the correct coolant mix.
2. Inspect the radiator - clean blocked fins, flush a clogged core, test the radiator cap pressure.
3. Test the thermostat and replace it if it sticks closed.
4. Check the water pump and its drive belt (tension, wear, leakage).
5. Check the cooling fan, fan motor, relay, fuse and temperature switch/sensor.
6. Check for a blown head gasket (combustion gas in coolant) and correct ignition timing; road-test and confirm the temperature stays normal."""),
]
C1 = """CASE I
Prepare a 500-word case study that critically examines the significance of maintaining clean and organised work environments in automotive workshops. Your case study should begin by identifying three specific risks commonly associated with poor housekeeping and explain how each risk affects worker safety, equipment durability and operational efficiency. Structure your case study in a coherent and professional format, balancing technical insight with clarity and engagement."""
C2 = """CASE II
Write a 500-word case study that critically evaluates the suitability of green technology vehicles (such as electric vehicles) versus conventional internal combustion engine vehicles, including hybrids and plug-in hybrids, for achieving a sustainable society. Consider the environmental implications throughout the entire vehicle life cycle, including resource extraction, manufacturing processes, energy consumption, emissions during use, maintenance, and end-of-life disposal. Present balanced arguments, supported by evidence or examples, that compare the strengths and limitations of both vehicle types in terms of sustainability. Conclude with a reasoned perspective on which category better supports long-term environmental goals, taking into account technological trends, infrastructure readiness and real-world viability. (You may refer to the chart of electricity generation by source in different countries, 2022.)"""
Q += case("auto2025", 1, T, C1, items=[
    ("Question 1 (Risk factors and consequences): (i) Identify three risks commonly caused by poor housekeeping in an automotive workshop. (ii) Explain how each risk affects worker safety, equipment durability, or workflow efficiency.", 25,
     [("Risk 1, e.g. slips, trips and falls (oil spills, tools, cables) - effects", 8), ("Risk 2, e.g. fire and explosion (oily rags, fuel, batteries) - effects", 8), ("Risk 3, e.g. damaged/lost tools and equipment, blocked exits, chemical exposure - effects on durability and efficiency", 7), ("Structure and clarity", 2)],
     """Risk 1 - Slips, trips and falls: oil and coolant spills, parts and tools left on the floor, trailing air hoses and cables. Workers fall and get injured; a dropped component or jack can damage vehicles; time is lost to injuries and clean-up.
Risk 2 - Fire and explosion: oily rags, open fuel containers, solvents and batteries near welding or grinding sparks. Danger to life, destruction of equipment and customer vehicles, insurance and legal costs, workshop shutdown.
Risk 3 - Damaged, lost or contaminated tools and equipment, and blocked access: tools left in the open rust or get run over; dust and grit enter engines and precision parts; blocked aisles and exits slow work and hinder evacuation. Equipment wears out faster, mechanics waste time searching, job times and comebacks increase and customer satisfaction drops.
A clean, organised workshop therefore protects people, extends equipment life and raises productivity and quality."""),
    ("Question 2 (5S method application): Describe the 5S method (Sort, Set in order, Shine, Standardize, Sustain) and explain how it can be applied specifically in a vehicle repair environment to reduce hazards and improve operational quality.", 10,
     [("Each S explained with a workshop example, 2 marks each", 10)],
     """Sort - remove unneeded parts, old tyres and broken tools from bays. Set in order - a place for everything: shadow boards for tools, labelled racks for parts, marked walkways and lift areas. Shine - clean bays, wipe spills immediately, clean tools and equipment after each job (also an inspection for leaks and damage). Standardize - written checklists, colour codes and daily cleaning schedules so everyone works the same way. Sustain - training, audits and leadership so the habits continue. Result: fewer slips and fires, less search time, fewer lost or damaged tools, better job quality and a professional image."""),
    ("Question 3 (Sustainability and environmental impact): (i) Explain how proper housekeeping contributes to environmental sustainability in a garage. (ii) Include examples such as waste segregation, fluid management and spill prevention.", 15,
     [("Housekeeping reduces pollution of soil/water, saves resources, legal compliance", 5), ("Waste segregation (oil, filters, batteries, tyres, metal, hazardous vs general) and recycling", 4), ("Fluid management (drain pans, labelled containers, used-oil recycling, coolant recovery)", 3), ("Spill prevention (bunded storage, spill kits, oil-water separators, drip trays)", 3)],
     """Good housekeeping keeps hazardous substances under control, so they do not reach soil, drains and rivers; it saves materials and energy and helps the garage meet NEC (National Environment Commission) rules.
Waste segregation: separate used oil, oil filters, batteries, tyres, scrap metal, plastics and general waste in labelled bins; send batteries and oil for recycling; dispose of hazardous waste through approved handlers.
Fluid management: drain oil, coolant and brake fluid into drip pans and sealed, labelled containers; recycle used oil and coolant; store chemicals in bunded areas.
Spill prevention: drip trays under vehicles, spill kits with absorbents, oil-water separators on floor drains, no washing oil into drains, regular inspection of tanks and lines."""),
])
Q += case("auto2025", 2, T, C2, image="/papers/me/tech3-auto-2025-electricity-mix.png", items=[
    ("Question 1: Choose one country and explain whether electric vehicles or internal combustion engine vehicles are more suitable for that country based on the types and proportions of power plants used there.", 10,
     [("Correct reading of the chosen country's power mix (e.g. Bhutan/Norway/Brazil mostly hydro; India/China/Australia coal-heavy)", 4), ("Reasoning: EV emissions depend on the grid; clean grid favours EVs, coal grid reduces benefit (hybrids may compete)", 4), ("Clear conclusion", 2)],
     """Example - Bhutan (or a high-renewable country such as Brazil/Canada from the chart): almost all electricity comes from hydropower, so charging an EV produces very little CO₂; EVs also cut fuel imports and use domestic power, so EVs are more suitable. By contrast, in a coal-heavy grid such as India (about 70% coal in 2022) or Australia, an EV's life-cycle emissions can be close to those of an efficient hybrid, so hybrids or a gradual EV shift with grid decarbonisation may be more suitable for now. The suitability of EVs rises as the share of renewables in the grid increases."""),
    ("Question 2 (Automobile life cycle assessment): Describe the environmental impact of automobile manufacturing, automobile operation and automobile disposal.", 20,
     [("Manufacturing: mining of metals and battery minerals, energy-intensive production; EVs higher manufacturing emissions", 7), ("Operation: tailpipe CO₂, NOx, PM for ICE; grid emissions for EVs; tyres/brakes, maintenance fluids", 7), ("Disposal: scrap, oils, batteries, plastics; recycling and hazardous waste", 6)],
     """Manufacturing: extraction of iron, aluminium, copper and, for EVs, lithium, cobalt and nickel causes land damage, water use and pollution; making steel, aluminium and battery cells is energy-intensive, so an EV starts life with a larger carbon footprint (often 30-60% more than an ICE car).
Operation: ICE and hybrid vehicles emit CO₂, CO, HC, NOx and particulates and use oil, filters and coolants; EVs have no tailpipe emissions, their emissions depend on electricity generation, and they need less maintenance; all vehicles produce tyre and brake dust.
Disposal: end-of-life vehicles leave scrap metal, plastics, fluids and tyres; batteries contain hazardous materials but valuable metals; proper dismantling, recycling and safe disposal reduce impact, while dumping pollutes soil and water.
Over the full life cycle EVs usually have lower total emissions, especially with clean electricity."""),
    ("Question 3 (Reusing electric vehicle batteries): Describe ideas for reusing discarded electric vehicle batteries and the safety measures needed.", 20,
     [("Second-life ideas: stationary energy storage (solar/hydro, homes, off-grid villages, telecom towers), backup power, EV charging buffers, low-speed vehicles", 10), ("Then recycling to recover lithium, cobalt, nickel", 3), ("Safety: testing and grading, BMS, thermal management, fire protection, safe handling/transport, standards, trained staff", 7)],
     """Ideas: EV batteries retired at about 70-80% capacity can be tested, graded and repackaged as stationary storage - storing solar or off-peak hydro power for homes, schools and hospitals, backup power for telecom towers and offices, off-grid electrification in remote villages, buffer storage at EV charging stations, and power for small vehicles, forklifts or tools. At the true end of life, recycle them to recover lithium, cobalt, nickel and copper.
Safety: test each module for capacity, internal resistance and damage; use a proper battery management system; provide cooling and ventilation; fire-resistant enclosures, smoke/heat detection and suitable extinguishing; protect from water and physical damage; follow standards for handling, storage and transport of lithium batteries; trained, protected staff; clear labelling and take-back systems."""),
])
PATTERN = STANDARD
