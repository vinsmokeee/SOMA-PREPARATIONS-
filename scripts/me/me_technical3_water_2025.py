"""ME Technical Paper III (Subject Specialisation Paper), Water Engineering, BCSE 2025 - real paper (PDF sent by the founder).
Own pattern from the paper: Part I 30 MCQ; Part II 4 short answers x 5; Section B answer any 5 of 6 questions x 10 = 50.
All 30 MCQs kept. Q6 (iv) and (v) are interpreted with the paper's formula sheet (peak factor 1.5 on hourly demand).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Water Engineering): BCSE 2025, batch 1"
GROUP_TAG = "water2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "water-engineering"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Water Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Water Engineering"

MCQ = r"""[
{
"n": 1,
"stem": "The field of hydrology deals with:",
"opts": [
"surface and ground water",
"flood water",
"river water",
"rainwater"
]
},
{
"n": 2,
"stem": "What percentage of the world’s water is potable?",
"opts": [
"less than 3%",
"about 15%",
"about 25%",
"more than half"
]
},
{
"n": 3,
"stem": "Runoff is measured in:",
"opts": [
"cubic meters",
"cubic meters per sec",
"cubic meters per minute",
"cubic meters per hour"
]
},
{
"n": 4,
"stem": "The runoff is affected by:",
"opts": [
"rain intensity and duration",
"rain distribution",
"soil moisture",
"all of the above"
]
},
{
"n": 5,
"stem": "Pick up the correct equation from the following:",
"opts": [
"Run off = Surface run off + Ground water flow",
"Run off = Surface run off - Ground water flow",
"Run off = Surface run off / Ground water flow",
"Run off = Surface run off x Ground water flow"
]
},
{
"n": 6,
"stem": "In Bhutan, rainfall is recorded by:",
"opts": [
"National Biodiversity Center",
"National Center for Hydrology and Meteorology",
"Department of Water",
"Ministry of Infrastructure and Transport"
]
},
{
"n": 7,
"stem": "A hyetograph is a graphical representation of:",
"opts": [
"discharge and time",
"cumulative rainfall and time",
"rainfall intensity and time",
"rainfall depth and time"
]
},
{
"n": 8,
"stem": "A hydrograph is a graphical representation of:",
"opts": [
"rain fall",
"discharge flowing in the river",
"surface runoff",
"all of the above"
]
},
{
"n": 9,
"stem": "For determination of average annual precipitation in a catchment basin, the best method is:",
"opts": [
"Thiessen's mean method",
"Arithmetical method",
"Isohyetal method",
"none of the above"
]
},
{
"n": 10,
"stem": "The average mean velocity of a stream having depth h may be obtained by taking the readings of a current meter at a depth of:",
"opts": [
"0.1 h and 0.9 h",
"0.2 h and 0.8 h",
"0.3 h and 0.7 h",
"0.4 h and 0.6 h"
]
},
{
"n": 11,
"stem": "The time required by rainwater to reach the outlet of the drainage basin is generally called:",
"opts": [
"time of concentration",
"duration of rainfall",
"time of overland flow",
"detention time"
]
},
{
"n": 12,
"stem": "The following is NOT a geological factor governing the occurrence of groundwater.",
"opts": [
"porosity of the soil",
"permeability of the soil",
"transmissibility of the soil",
"elasticity of the soil"
]
},
{
"n": 13,
"stem": "The quantity of water available from an infiltration gallery depends upon the:",
"opts": [
"the yield of the aquifer source",
"size of gallery",
"the efficiency of the drain pipes",
"all of the above"
]
},
{
"n": 14,
"stem": "If the grain size of soil increases,",
"opts": [
"water supply in well increases",
"specific retention decreases",
"surface area decreases",
"all of the above"
]
},
{
"n": 15,
"stem": "Sharp crested weirs are generally used for:",
"opts": [
"small flows",
"large flows",
"streams carrying high sediment loads",
"rivers carrying floating debris"
]
},
{
"n": 16,
"stem": "Per capita demand of water is calculated in liters:",
"opts": [
"per person per year",
"per person per month",
"per person per day",
"none of the above"
]
},
{
"n": 17,
"stem": "Per capita water demand is defined as the liters of water consumed daily by each person over a period of:",
"opts": [
"24 hours",
"one month",
"one year",
"10 years"
]
},
{
"n": 18,
"stem": "Generally, the multiplying (peak) factor that is applied to compute the maximum daily water demand in relation to the average per capita daily demand is:",
"opts": [
"1.5",
"1.8",
"2.0",
"2.7"
]
},
{
"n": 19,
"stem": "In Water Supply Engineering “meters water column” is frequently used as a unit of pressure (head) expressed as “mwc’’ or “cm-wc”. 10 m water column (mwc) is equivalent to:",
"opts": [
"0.1 bar",
"1 bar",
"10 bar",
"100 bar"
]
},
{
"n": 20,
"stem": "The distribution system in a typical urban water supply is designed on the basis of::",
"opts": [
"average daily demand",
"peak hourly demand",
"maximum daily demand + fire demand",
"greater of (b) and (c)"
]
},
{
"n": 21,
"stem": "In a hydraulic system, there are Elevation Head, Pressure Head, and Velocity Head. The Total Energy Head in a hydraulic system is equal to:",
"opts": [
"Elevation Head - Pressure Head + Velocity Head",
"Elevation Head - Pressure Head - Velocity Head",
"Elevation Head + Pressure Head - Velocity Head",
"Elevation Head + Pressure Head + Velocity Head"
]
},
{
"n": 22,
"stem": "The formula which is most appropriate to the design of pressure pipes is:",
"opts": [
"Mannings formula",
"Darcy Weisbach formula",
"Dupuit’s formula",
"Chezy’s formula"
]
},
{
"n": 23,
"stem": "The Hydraulic Grade Line (HGL) is a graph of the pressure head _________ the pipe centerline.",
"opts": [
"along",
"below",
"above",
"near"
]
},
{
"n": 24,
"stem": "The energy loss due to viscosity and friction along the straight length of the pipeline is called _______ loss and accounts for most of the pressure drop.",
"opts": [
"major loss",
"minor loss",
"apparent loss",
"physical loss"
]
},
{
"n": 25,
"stem": "As the water flows through valves, bends, and other tube fittings, there are additional losses due to turbulence which is called ______ losses.",
"opts": [
"major loss",
"minor loss",
"apparent loss",
"physical loss"
]
},
{
"n": 26,
"stem": "Pressure pipes are exclusively used for carrying water supplies because:",
"opts": [
"such pipes can go up and down the hills and valleys thus requiring a lesser length",
"such pipes are closed and hence not exposed to pollution",
"since water runs under pressure, pollution from the outside surrounding cannot enter even if some joints are loose",
"all of the above"
]
},
{
"n": 27,
"stem": "Water hammer pressures can be reduced by using:",
"opts": [
"critically closing time valves",
"fast closing valves",
"slow closing valves",
"none of the above"
]
},
{
"n": 28,
"stem": "Air valves are special kinds of valves that are generally placed at the ______ along the pipeline.",
"opts": [
"summit",
"bottom",
"middle",
"none of the above"
]
},
{
"n": 29,
"stem": "Check valves are installed:",
"opts": [
"on the delivery side of the pump",
"at the interface connection between the treated water and raw water",
"both (a) and (b)",
"neither (a) nor (b)"
]
},
{
"n": 30,
"stem": "Which of the following system/type is used in a water distribution network?",
"opts": [
"dead end system",
"radial system",
"grid iron system",
"all of the above"
]
}
]"""

KEY = {
    1: ("a", "Hydrology deals with surface and ground water (the whole water cycle)."), 2: ("a", "Less than 3% of the world's water is fresh, and even less is potable."),
    3: ("b", "Runoff (discharge) is measured in cubic metres per second."), 4: ("d", "Rainfall intensity, duration, distribution and soil moisture all affect runoff."),
    5: ("a", "Total runoff = surface runoff + groundwater flow (base flow)."), 6: ("b", "The National Center for Hydrology and Meteorology records rainfall in Bhutan."),
    7: ("c", "A hyetograph plots rainfall intensity against time."), 8: ("b", "A hydrograph plots river discharge against time."),
    9: ("c", "The isohyetal method is the most accurate for average catchment rainfall."), 10: ("b", "Mean velocity = average of readings at 0.2h and 0.8h depth."),
    11: ("a", "Time of concentration: time for water to travel from the farthest point to the outlet."), 12: ("d", "Elasticity is not a geological factor for groundwater."),
    13: ("d", "Yield depends on the aquifer, gallery size and drain efficiency."), 14: ("d", "Coarser grains: more yield, less specific retention and less surface area."),
    15: ("a", "Sharp-crested weirs measure small, clean flows."), 16: ("c", "Per capita demand is litres per person per day."),
    17: ("c", "It is the average daily use per person over a year."), 18: ("b", "Maximum daily demand ≈ 1.8 x average daily demand."),
    19: ("b", "10 m of water column ≈ 1 bar (98.1 kPa)."), 20: ("d", "Design for the greater of peak hourly demand and maximum daily demand plus fire demand."),
    21: ("d", "Total head = elevation + pressure + velocity head."), 22: ("b", "Darcy-Weisbach is used for pressure pipes."),
    23: ("c", "The HGL plots pressure head above the pipe centreline."), 24: ("a", "Friction along straight pipes causes major losses."),
    25: ("b", "Losses at valves, bends and fittings are minor losses."), 26: ("d", "All the listed reasons apply."),
    27: ("c", "Slow-closing valves reduce water hammer."), 28: ("a", "Air valves are placed at summits (high points)."),
    29: ("a", "Check (non-return) valves go on the pump delivery side to stop backflow."), 30: ("d", "Dead-end, radial and grid-iron systems are all used."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    saq(1, T, "How is the design flood for a structure determined?",
        [("Design flood definition: flood magnitude adopted for design based on importance/ risk (return period e.g. 50-100 yr, PMF for dams)", 1.5), ("Methods: flood frequency analysis (Gumbel, log-Pearson III) of annual peaks, rational method/ empirical formulae for small catchments, unit hydrograph from design storm, PMP/PMF for large dams; historical floods, GLOF", 2.5), ("Factors: importance, consequence of failure, data availability, climate change", 1)],
        "The design flood is the peak discharge (or flood hydrograph) a structure is designed to pass safely, chosen according to the importance of the structure and the consequences of failure - e.g. 25-50 years return period for culverts and minor bridges, 100 years for major bridges and barrages, and the probable maximum flood (PMF) for large dams. It is determined by: 1. Flood frequency analysis of long records of annual maximum floods using statistical distributions (Gumbel, log-Pearson Type III) to estimate the flood for the chosen return period. 2. For small or ungauged catchments, the rational method or empirical formulae (Dickens, Ryves) using design rainfall intensity. 3. Unit hydrograph methods applying a design storm to derive a flood hydrograph. 4. Probable maximum precipitation converted to PMF for high-hazard dams. Historical flood marks, glacial lake outburst floods (important in Bhutan) and climate change allowances are also considered."),
    saq(2, T, "What is Manning's equation and where is it used? Calculate the flow rate in a rectangular channel with width 4 m, depth 2 m, slope 0.001 and Manning's n = 0.015.",
        [("Manning's equation V = (1/n) R^(2/3) S^(1/2); Q = A V; used for uniform open-channel flow (canals, rivers, drains, sewers part full)", 2), ("A = 8 m², P = 8 m, R = 1 m", 1.5), ("Q = (1/0.015) x 8 x 1 x 0.0316 ≈ 16.9 m³/s", 1.5)],
        "Manning's equation gives the mean velocity of uniform flow in open channels: V = (1/n) R^(2/3) S^(1/2), and discharge Q = A V, where n is Manning's roughness coefficient, R the hydraulic radius (A/P) and S the bed slope. It is used to design and analyse canals, rivers, drains, culverts and sewers flowing partly full. Calculation: A = 4 x 2 = 8 m²; wetted perimeter P = 4 + 2 x 2 = 8 m; R = 8/8 = 1 m; V = (1/0.015) x 1^(2/3) x √0.001 = 66.67 x 0.0316 = 2.11 m/s; Q = 8 x 2.11 ≈ 16.9 m³/s."),
    saq(3, T, "Compute the peak discharge using the rational method. Given: C = 0.7, rainfall intensity i = 60 mm/hr, catchment area A = 5 km².",
        [("Formula Q = CiA/3.6 (i in mm/h, A in km², Q in m³/s) or Q = CiA with consistent units", 2), ("Q = 0.7 x 60 x 5 / 3.6 = 58.3 m³/s", 3)],
        "Rational method: Q = C i A / 3.6, where Q is in m³/s, i in mm/hr and A in km² (or Q = 0.278 C i A). Q = 0.7 x 60 x 5 / 3.6 = 210 / 3.6 = 58.3 m³/s. (The intensity should be for a duration equal to the time of concentration; the method suits small catchments.)"),
    saq(4, T, "Water flows at 2 m/s in a 200 mm diameter pipe. The pipe narrows to 100 mm at a constriction. Determine the flow velocity in the constricted section and discuss the result.",
        [("Continuity A1V1 = A2V2", 1.5), ("V2 = V1 (D1/D2)² = 2 x 4 = 8 m/s (Q = 0.0628 m³/s)", 2), ("Discussion: halving diameter quarters area so velocity rises 4 times; by Bernoulli pressure drops at constriction (venturi effect), higher head loss, risk of cavitation/ erosion", 1.5)],
        "By continuity, Q = A1 V1 = A2 V2. A1 = π x 0.2²/4 = 0.0314 m², Q = 0.0314 x 2 = 0.0628 m³/s. A2 = π x 0.1²/4 = 0.00785 m². V2 = 0.0628 / 0.00785 = 8 m/s (equivalently V2 = V1 (D1/D2)² = 2 x 4 = 8 m/s). Discussion: halving the diameter reduces the area to one quarter, so the velocity increases four times. By Bernoulli's principle the pressure falls at the constriction (the venturi effect, used in venturi meters); the higher velocity also increases head losses and can cause noise, erosion or cavitation if the pressure falls too low."),
]
def it(q, m, kp, mod): return (q, m, kp, mod)
FORM = "\n\nFormulae given: Q = A C √(m i); hydraulic mean depth m = A/P (A = area of flow, P = wetted perimeter); C = (1/N) m^(1/6) (N = Manning's n); average daily demand = P x q; maximum daily demand = 1.8 x P x q; maximum hourly demand of the maximum day = 1.5 x maximum daily demand; geometric increase Pn = P0 (1 + r)^n; linear increase Pn = P0 (1 + r n); continuity Q1 = Q2 = v x A."
INTRO = "Section B: answer any five of the six questions (10 marks each)." + FORM
B = [
    ("Explain, with neat sketches, the various types of aquifers.",
     [("Unconfined (water table) aquifer: description and sketch", 2.5), ("Confined (artesian) aquifer between aquicludes, piezometric surface, flowing well", 2.5), ("Perched aquifer above local impermeable lens", 2), ("Others: leaky/ semi-confined, aquitard/ aquiclude/ aquifuge definitions; labelled sketches", 3)],
     "An aquifer is a saturated geological formation that stores and transmits enough water to supply wells and springs. 1. Unconfined (water-table) aquifer: the upper surface is the water table at atmospheric pressure, recharged directly from rainfall above; wells in it have water levels at the water table. Sketch: ground surface, unsaturated zone, water table, saturated zone resting on an impermeable layer. 2. Confined (artesian) aquifer: lies between two impermeable layers (aquicludes) and is under pressure greater than atmospheric; it is recharged where it outcrops; the water in a well rises to the piezometric surface, and if this is above ground it is a flowing artesian well. Sketch: sloping aquifer sandwiched between clay layers with a recharge area and a flowing well. 3. Perched aquifer: a local body of groundwater held above the main water table by an impermeable lens (e.g. clay). 4. Leaky (semi-confined) aquifer: bounded by aquitards that let some water leak through. Related terms: aquiclude (stores but does not transmit water, e.g. clay), aquitard (transmits slowly), aquifuge (neither stores nor transmits, e.g. solid granite)."),
    ("""The leakage in a water distribution system was 20 m³/h at an average pressure of 50 m. Given L = K P^1.5, where L = leakage and P = pressure:
(i) What will the leakage be at an average pressure of 40 m?
(ii) What average pressure is needed to reduce the leakage to 10 m³/h?
(iii) List the causes of high water losses in a distribution system.""",
     [("K = 20/50^1.5 = 0.0566", 2), ("(i) L = 0.0566 x 40^1.5 ≈ 14.3 m³/h", 2.5), ("(ii) P = (10/K)^(2/3) ≈ 31.5 m", 2.5), ("(iii) Causes: high pressure, old/ corroded pipes and poor joints, poor workmanship, illegal connections, meter under-registration, tank overflows, ground movement/ landslides, lack of maintenance and leak detection", 3)],
     "K = L / P^1.5 = 20 / 50^1.5 = 20 / 353.6 = 0.0566. (i) At P = 40 m: L = 0.0566 x 40^1.5 = 0.0566 x 253.0 ≈ 14.3 m³/h (a 20% pressure reduction cuts leakage by about 28%). (ii) For L = 10 m³/h: P^1.5 = 10 / 0.0566 = 176.8, so P = 176.8^(2/3) ≈ 31.5 m. (iii) Causes of high water losses: excessive pressure; old, corroded or poor-quality pipes and joints; poor workmanship and bedding; damage from traffic, landslides and earthquakes; leaking valves, service connections and reservoir overflows; illegal connections and meter under-registration (apparent losses); lack of district metering, leak detection and maintenance."),
    ("""(i) What production capacity (m³/h) does a treatment plant need to supply a city of 300 000 people with an average of 130 Lpcd?
(ii) If the population grows geometrically at 2% per year, estimate the increase in production capacity needed after 15 years if (a) the per capita demand stays at 130 Lpcd, and (b) the per capita demand increases linearly by 1% per year.""",
     [("(i) 300 000 x 130 = 39 000 m³/d = 1625 m³/h", 3), ("Population after 15 years = 300 000 x 1.02^15 ≈ 403 760", 2), ("(a) 403 760 x 130 = 52 489 m³/d = 2187 m³/h; increase ≈ 562 m³/h", 2.5), ("(b) q = 130 x (1 + 0.01 x 15) = 149.5 Lpcd; 60 362 m³/d = 2515 m³/h; increase ≈ 890 m³/h", 2.5)],
     "(i) Demand = 300 000 x 130 L/day = 39 000 000 L/day = 39 000 m³/day; capacity = 39 000 / 24 = 1625 m³/h. (ii) Population after 15 years: P15 = 300 000 x (1.02)^15 = 300 000 x 1.3459 ≈ 403 760. (a) Constant demand: 403 760 x 130 / 1000 = 52 489 m³/day = 2187 m³/h; increase = 2187 - 1625 ≈ 562 m³/h. (b) Demand rising linearly 1% per year: q15 = 130 x (1 + 0.01 x 15) = 149.5 Lpcd; demand = 403 760 x 149.5 / 1000 = 60 362 m³/day = 2515 m³/h; increase = 2515 - 1625 ≈ 890 m³/h."),
    ("Determine the discharge of water through the channel shown in the figure (rectangular upper part 1.2 m deep and 3 m wide above a semicircular bottom of radius 1.5 m; total depth 2.7 m). Take Chezy's constant C = 60 and bed slope 1 in 2000.",
     [("Area = 3 x 1.2 + π x 1.5²/2 = 3.6 + 3.53 = 7.13 m²", 3), ("Wetted perimeter = 2 x 1.2 + π x 1.5 = 7.11 m; m = 1.003 m", 3), ("Q = A C √(m i) = 7.13 x 60 x √(1.003/2000) ≈ 9.59 m³/s", 4)],
     "Flow area: rectangle 3 m x 1.2 m = 3.6 m² plus semicircle π x 1.5² / 2 = 3.534 m²; A = 7.134 m². Wetted perimeter: two vertical sides 2 x 1.2 = 2.4 m plus semicircular arc π x 1.5 = 4.712 m; P = 7.112 m. Hydraulic mean depth m = A/P = 7.134/7.112 = 1.003 m. Chezy: Q = A C √(m i) = 7.134 x 60 x √(1.003 x 1/2000) = 428.0 x 0.02239 ≈ 9.59 m³/s."),
    ("Find the diameter of a circular sewer laid at a slope of 1 in 8000 that carries 800 L/s when flowing half full. Take Manning's N = 0.02 (see figure).",
     [("Half full: A = πD²/8, P = πD/2, m = D/4", 3), ("C = (1/N) m^(1/6); Q = A C √(m i) = (πD²/8)(1/0.02)(D/4)^(2/3)(1/8000)^(1/2)", 3), ("Solve 0.8 = ... → D ≈ 2.30 m", 4)],
     "For a pipe flowing half full: A = πD²/8, P = πD/2, so m = A/P = D/4. With C = (1/N) m^(1/6), Q = A C √(m i) = (πD²/8) x (1/0.02) x (D/4)^(2/3) x (1/8000)^(1/2). Substituting Q = 0.8 m³/s: 0.8 = 0.3927 D² x 50 x 0.3969 D^(2/3) x 0.01118 = 0.0871 D^(8/3). D^(8/3) = 9.18, so D = 9.18^(3/8) ≈ 2.30 m. A sewer of about 2.3 m diameter is needed (the very flat slope makes it large)."),
    ("""A town of 100 000 people has a total per capita water demand of 100 Lpcd. Calculate:
(i) annual average daily demand (m³/day)
(ii) maximum daily demand (m³/day)
(iii) average hourly demand (m³/hour)
(iv) maximum hourly demand (m³/hour)
(v) maximum hourly demand of the maximum day (m³/hour).""",
     [("(i) 100 000 x 100 L = 10 000 m³/d", 2), ("(ii) 1.8 x 10 000 = 18 000 m³/d", 2), ("(iii) 10 000/24 ≈ 416.7 m³/h", 2), ("(iv) 1.5 x average hourly ≈ 625 m³/h", 2), ("(v) 1.5 x 18 000/24 = 1125 m³/h (= 2.7 x average hourly)", 2)],
     "(i) Average daily demand = 100 000 x 100 L = 10 000 000 L = 10 000 m³/day. (ii) Maximum daily demand = 1.8 x 10 000 = 18 000 m³/day. (iii) Average hourly demand = 10 000 / 24 = 416.7 m³/h. (iv) Maximum hourly demand (peak hour on an average day) = 1.5 x 416.7 ≈ 625 m³/h. (v) Maximum hourly demand of the maximum day = 1.5 x (18 000 / 24) = 1.5 x 750 = 1125 m³/h (2.7 times the average hourly demand) - used to design the distribution network."),
]
for i, (s, kp, mod) in enumerate(B):
    Q += case("water2025", i + 1, T, INTRO, items=[(s, 10, kp, mod)])
for q in Q:
    if q["key"] == "C4Q1": q["image"] = "/papers/me/tech3-water-2025-channel.png"
    if q["key"] == "C5Q1": q["image"] = "/papers/me/tech3-water-2025-sewer.png"
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions", "type": "short_answer", "count": 4, "marks_each": 5, "answer_any": None},
    {"title": "Section B: Answer any FIVE of six questions", "type": "passage", "count": 6, "marks_each": 10, "answer_any": 5},
]
