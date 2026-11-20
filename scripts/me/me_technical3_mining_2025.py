"""ME Technical Paper III (Subject Specialisation Paper), Mining, BCSE 2025 - real paper (PDF sent by the founder).
Own pattern from the paper: Part I 30 MCQ; Part II 5 short answers x 5 = 25; Section B choose Option I or II (45);
total 100. Replaced MCQs: 10 (bucket wheel excavator and dragline both defensible), 20 and 26 (Bhutan rule details not
verifiable; 26 also missing an option). Questions on Bhutan's mining law, ERB formula, royalty and accident reporting
are flagged: the model answers describe them in general and examiners must check against the current Act/Rules.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Mining): BCSE 2025, batch 1"
GROUP_TAG = "mine2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "mining"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Mining"

MCQ = r"""[
{
"n": 1,
"stem": "Minimum metal percentage, at which mining is profitable, is known as:",
"opts": [
"Average grade.",
"Cut-off grade.",
"Mill grade.",
"Economical grade."
]
},
{
"n": 2,
"stem": "What is Salting in Mine Valuation?",
"opts": [
"Adding high-grade mineral samples to lower-grade ore during sampling or core drilling to inflate the value of mining property",
"Adding low-grade mineral samples to high-grade ore during sampling or core drilling to inflate the value of mining property",
"Adding high-grade mineral samples to higher-grade ore during sampling or core drilling to inflate the value of mining property",
"Adding low-grade mineral samples to lower-grade ore during sampling or core drilling to inflate the value of mining property"
]
},
{
"n": 3,
"stem": "Project A has an internal rate of return (IRR) of 21 percent. Project B has an IRR of 7 percent. Project C has an IRR of 31 percent. Project D has an IRR of 25 percent. Which of these would be the BEST project?",
"opts": [
"Project B",
"Project C",
"Project D",
"Project A"
]
},
{
"n": 4,
"stem": "In a mine for one shovel, six trucks are assigned. The shovel loading time per truck is 5 minute, and truck cycle time is 20 minutes. Calculate the match factor.",
"opts": [
"0.7",
"1.2",
"1.0",
"1.5"
]
},
{
"n": 5,
"stem": "As per classification of mineral resources, “reserve “means",
"opts": [
"Identified resources",
"Identified and techno-economically viable resources",
"Hypothetical resources",
"Inferred resources"
]
},
{
"n": 6,
"stem": "If the Fig. A and B represents contour plots in a terrain then the correct statement is",
"opts": [
"Fig. A shows ridge and Fig. B shows valley",
"Fig. A shows anticline and Fig. B shows syncline",
"Fig. A shows syncline and Fig. B shows anticline",
"Fig. A shows valley and Fig. B shows ridge"
]
},
{
"n": 7,
"stem": "In the context of mine planning, match the following: Technique/Algorithm Preferred Applications",
"opts": [
"A -1, B-2, C-3, D-4",
"A-4, B-1, C-3, D-2",
"A-3, B-2, C-4, D-1",
"A-1, B-2, C-3, D-4"
]
},
{
"n": 8,
"stem": "A FMFS report is a document containing",
"opts": [
"In reasonable detail, the technical, financial, environmental and social impact analyses required prior to the approval of a mining lease.",
"An EIA report including all scoping and baseline studies",
"Mine plan but no environmental management plan",
"A detail of geological report"
]
},
{
"n": 9,
"stem": "The point beyond which the mineral cannot be economically extracted is called",
"opts": [
"Stripping ratio",
"Cost of stripping ratio",
"Break-even ratio",
"Limit of extraction"
]
},
{
"n": 10,
"stem": "Which of the following excavator is preferred to be used for a bench height of 30 m or more?",
"opts": [
"Bucket wheel excavator",
"Excavator",
"Dragline",
"Front end loader"
]
},
{
"n": 11,
"stem": "The ratio of weight per unit volume of solid rock mass in the bench is 162 and weight per unit volume of loose rock mass after blasting or loosening is called?",
"opts": [
"Bucket factor",
"Swing factor",
"Swell factor",
"Drill factor"
]
},
{
"n": 12,
"stem": "The term Representative Factor (RF) is associated with",
"opts": [
"Mine drainage",
"Mine plan",
"Mine ventilation",
"Mine air sampling"
]
},
{
"n": 13,
"stem": "Under what conditions blasting may not be carried out?",
"opts": [
"Thunderstorm",
"Strong wind",
"At temperatures exceeding 300Cᵒ",
"Heavy rain"
]
},
{
"n": 14,
"stem": "When explosive charges in a hole is separated by air gaps in stead stemming materials, then the process is known as",
"opts": [
"Deck charging’",
"Priming",
"Detonating",
"air decking"
]
},
{
"n": 15,
"stem": "In a mine deploying shovel and dumper, the distance from the crest of the bench to the centre of the dumper including safety berm and clearance is 7.5m, the dumping radius and the cutting radii of the shovel are 15m and 12m respectively. The width of the working bench of the mine in m is;",
"opts": [
"30.5",
"32.5",
"34.5",
"36.5"
]
},
{
"n": 16,
"stem": "The rocks that are formed by the cooling of molten material (called magma) at or relatively near the earth surface is called",
"opts": [
"Igneous rock",
"Metamorphic",
"Sedimentary rock",
"Crystalline"
]
},
{
"n": 17,
"stem": "VOD is the property of:",
"opts": [
"detonator",
"explosives",
"dumper",
"dragline"
]
},
{
"n": 18,
"stem": "As per the provisions of the MMMR 2002, under ‘Environmental restoration bond’ the lessee shall deposit an environmental bond to the Government as security for:-",
"opts": [
"Carrying out the mining/quarrying operations not as per the approved FMFS report and other relevant rules & regulations set up by the government",
"Mine reclamation and environmental restoration in the mine and for ensuring that the negative impacts on the surrounding environment are minimized.",
"Claiming the interest given on the security bond by the government for increasing the mining activities in the country.",
"Taking out loans from the financial institutions to carry out the mining/quarrying operations in the Country"
]
},
{
"n": 19,
"stem": "The boundary of a mine is plotted on a scale of 1:2000. If a planimeter measures the plotted area as 58 cm2 the actual mine area in m2 is",
"opts": [
"6800",
"11700",
"23200",
"28000"
]
},
{
"n": 20,
"stem": "Ad valorem royalty for export of minerals is levied at;",
"opts": [
"mine exit points",
"country exit point",
"the destination",
"the weighbridge"
]
},
{
"n": 21,
"stem": "In an open-pit mine design, the ultimate pit limit is primarily determined by",
"opts": [
"Drilling pattern",
"Bench height",
"Slope stability",
"Stripping ratio and economics"
]
},
{
"n": 22,
"stem": "Ultimate Pit slope is the angle made by the imaginary line joining the –",
"opts": [
"Average of the all bench angles.",
"Top most crest of the bench to bottom most toe of the bench.",
"Top most toe of the bench to the bottom most toe of the bench.",
"Top most crest of the bench to bottom most crest of the bench."
]
},
{
"n": 23,
"stem": "What are Contours in a topographic map?",
"opts": [
"Lines joining the point of same elevations.",
"Shows the level of depth of mine.",
"Used for calculating the area.",
"None of the above"
]
},
{
"n": 24,
"stem": "In the Moho’s Scale of hardness, the minerals in increasing order of hardness are;",
"opts": [
"Calcite, gypsum, topaz, diamond",
"Topaz, gypsum, calcite, diamond",
"Gypsum, calcite, topaz, diamond",
"Calcite, gypsum, diamond, topaz"
]
},
{
"n": 25,
"stem": "As per MMMA 1995, a mining lease shall be granted for a mining area",
"opts": [
"based on the approval of the FMFS report only",
"only after clearance of such area has been received from all concerned authorities of the Government",
"if the mining area is demarcated by the applicant",
"after putting an application for mining lease in Form A"
]
},
{
"n": 26,
"stem": "As per MMMR 2022, In case of accidents in the Mine, the lessee shall serve the",
"opts": [
"Notice of Accident in Form I within one week of the occurrence of the accident with copy to concerned Dzongdag",
"Notice of Accident in Form J within one week of the occurrence of the accident with copy to concerned Dzongdag",
"Notice of Accident in Form K within one week of the occurrence of the accident with copy to concerned Dzongdag",
""
]
},
{
"n": 27,
"stem": "Which of the following statement is NOT CORRECT?",
"opts": [
"Controlled blasting is done to avoid fly rock",
"Secondary blasting is done for big size boulders",
"Secondary blasting is done to avoid the toe formation",
"Stemming is required to avoid the blown-out shots"
]
},
{
"n": 28,
"stem": "The extension of all boundaries of the mining area shall be?",
"opts": [
"Downward, vertically without limit",
"Downward, vertically with the limit",
"Sideward, horizontally with the limit",
"Sideward, horizontally without limit"
]
},
{
"n": 29,
"stem": "Coal formation takes place in the following order",
"opts": [
"Peat- lignite – anthracite – bituminous",
"Peat – lignite – bituminous – anthracite",
"Bituminous – peat – lignite – anthracite",
"Lignite – peat – bituminous – anthracite"
]
},
{
"n": 30,
"stem": "Mineral levies in Bhutan are collected based on:",
"opts": [
"Volume of the material",
"Quantity in metric tons",
"Quantity in Kilograms",
"None of above"
]
}
]"""

KEY = {
    1: ("b", "Cut-off grade is the minimum grade at which mining is profitable."), 2: ("a", "Salting adds high-grade material to samples to inflate the property's value."),
    3: ("b", "With other things equal, the highest IRR (31%, Project C) is best."), 4: ("d", "Match factor = (trucks x loading time) / (shovels x truck cycle) = 6 x 5 / 20 = 1.5."),
    5: ("b", "A reserve is the identified part of a resource that is techno-economically mineable."), 6: ("a", "Contours bending towards lower values show a ridge (Fig. A); towards higher values, a valley (Fig. B)."),
    7: ("b", "Lerchs-Grossmann → ultimate pit limit; kriging → reserve estimation; Lane → cut-off grade; Taylor's rule → mine life."), 8: ("a", "A Final Mine Feasibility Study report covers technical, financial, environmental and social analyses before a lease."),
    9: ("c", "The break-even stripping ratio marks the limit of economic extraction."), 11: ("c", "In-situ density / loose density is the swell factor."),
    12: ("b", "The representative fraction (scale) is used on mine plans."), 13: ("a", "Blasting must not be done during thunderstorms (lightning can trigger detonators)."),
    14: ("d", "Separating charges by air gaps is air decking."), 15: ("c", "Bench width = 7.5 + 15 + 12 = 34.5 m."),
    16: ("a", "Rocks formed by cooling magma are igneous."), 17: ("b", "Velocity of detonation (VOD) is a property of explosives."),
    18: ("b", "The bond secures mine reclamation and environmental restoration."), 19: ("c", "58 cm² x (2000)² = 2.32 x 10⁸ cm² = 23 200 m²."),
    21: ("d", "The ultimate pit limit is set mainly by stripping ratio and economics."), 22: ("b", "Overall pit slope joins the topmost crest to the bottom toe."),
    23: ("a", "Contours join points of equal elevation."), 24: ("c", "Mohs order: gypsum (2), calcite (3), topaz (8), diamond (10)."),
    25: ("b", "A lease is granted only after clearances from all concerned authorities."), 27: ("c", "Not correct: secondary blasting breaks boulders; toe is avoided by proper primary blast design."),
    28: ("a", "The mining area boundaries extend vertically downward without limit."), 29: ("b", "Coalification: peat → lignite → bituminous → anthracite."),
    30: ("b", "Mineral levies are based on quantity in metric tonnes."),
}
FIX = {
    6: {"image": "/papers/me/tech3-mining-2025-contours.png"},
    7: {"stem": "In the context of mine planning, match the following techniques/algorithms (A-D) with their preferred applications (1-4): A. Lerchs-Grossmann algorithm, B. Kriging, C. Lane's theory, D. Taylor's rule; 1. Reserve estimation, 2. Mine life, 3. Cut-off grade optimisation, 4. Ultimate pit limit.",
        "opts": ["A-1, B-2, C-3, D-4", "A-4, B-1, C-3, D-2", "A-3, B-2, C-4, D-1", "A-2, B-4, C-1, D-3"]},
    11: {"stem": "The ratio of the weight per unit volume of solid rock in the bench to the weight per unit volume of loose rock after blasting is called the"},
}
T = TOPIC
Q = mcqs(MCQ, KEY, T, FIX) + [
    new_mcq(1, T, "Which surface mining equipment works mainly by casting overburden directly into the mined-out area, without trucks?", ["Front-end loader", "Dragline", "Rear dump truck", "Rotary drill"], "b",
            "A dragline digs overburden and casts it into the mined-out void (cast overburden), common in strip mining."),
    new_mcq(2, T, "Royalty that is charged as a percentage of the value of the mineral sold is called", ["Specific royalty", "Ad valorem royalty", "Dead rent", "Surface rent"], "b",
            "Ad valorem royalty is a percentage of value; specific royalty is a fixed amount per tonne."),
    new_mcq(3, T, "The first thing a mine manager must do immediately after a serious accident in a mine is to", ["Resume production to meet targets", "Rescue and give first aid to the injured and make the area safe", "Repair the damaged machinery", "Clean up the accident site"], "b",
            "Saving life and securing the area come first; the site is preserved for investigation and the authorities are informed."),
]
SA = [
    ("Why is it necessary to carry out break-even analysis in a mining business? The handling figures for the Pugli Limestone Mine for 2024-25 are: overburden (OB) handled = 5,00,000 MT; ore production = 2,00,000 MT; densities of OB and ore are 2.5 and 3 respectively. Find the stripping ratio for 2024-25.",
     [("Why break-even: shows minimum production/price to cover costs, viability, pit limit (break-even stripping ratio), planning, risk", 2), ("Volumes: OB 2,00,000 m³; ore 66,667 m³", 1.5), ("Stripping ratio 3:1 (m³/m³) or 1 m³ OB per tonne ore (2.5 t/t)", 1.5)],
     """Break-even analysis finds the level of production (or price/grade) at which revenue equals total cost. It is needed to know the minimum output or selling price for the mine to be viable, to judge profitability and risk of price or cost changes, to fix the break-even stripping ratio that sets the economic pit limit, and to plan production, pricing and investment.
Stripping ratio: OB volume = 5,00,000 / 2.5 = 2,00,000 m³; ore volume = 2,00,000 / 3 = 66,667 m³.
Stripping ratio (volume) = 2,00,000 / 66,667 = 3 : 1 (m³ of OB per m³ of ore). In other units: 2,00,000 m³ / 2,00,000 t = 1 m³ of OB per tonne of ore, or 5,00,000 / 2,00,000 = 2.5 t of OB per t of ore."""),
    ("Explain the Environment Restoration Bond (ERB) formula and its mode of payment. Calculate the upfront ERB from the following data: area = 9.66 acres; OB = 53,714 m³.",
     [("Purpose of ERB: security for reclamation and restoration, refunded/ released after satisfactory restoration", 1.5), ("Formula: based on disturbed area and overburden volume at rates prescribed in the current Mines and Minerals rules", 1.5), ("Calculation with prescribed rates, and mode of payment (upfront portion plus instalments/ bank guarantee or deposit)", 2)],
     """The Environment Restoration Bond is security deposited by the lessee with the Government (Department of Geology and Mines) to make sure the mine is reclaimed and the environment restored; it is released after satisfactory restoration, or forfeited and used by the Government if the lessee fails. The bond amount is worked out from the area disturbed and the volume of overburden to be handled and restored, at the rates prescribed in the current Mines and Minerals rules: ERB = (area in acres x rate per acre) + (OB volume in m³ x rate per m³). Part is paid upfront before operations begin and the rest as prescribed (e.g. instalments or bank guarantee/fixed deposit). For this lease: ERB = 9.66 x (rate per acre) + 53,714 x (rate per m³), applying the prescribed upfront percentage. [Examiner: use the rates in the rules in force.]"""),
    ("A shovel operates 300 days a year, 2 shifts a day and 4 hours a shift to achieve a target production of 30 million MT per annum. Find the number of shovels required, given: bucket capacity 15 m³; shovel cycle time 44 s; bucket fill factor 0.85; bulk density of the muck 3.00 t/m³.",
     [("Load per cycle 15 x 0.85 x 3 = 38.25 t; cycles per hour 81.8", 2), ("Output per hour ≈ 3130 t; hours per year 2400; per shovel ≈ 7.51 Mt/yr", 2), ("Number = 30/7.51 ≈ 3.99 → 4 shovels (plus standby)", 1)],
     """Load per cycle = 15 x 0.85 x 3.0 = 38.25 t. Cycles per hour = 3600 / 44 = 81.8. Output per hour = 38.25 x 81.8 ≈ 3130 t/h.
Working hours per year = 300 x 2 x 4 = 2400 h. Output per shovel per year = 3130 x 2400 ≈ 7.51 million t.
Number of shovels = 30 / 7.51 = 3.99 → 4 shovels (one more as standby is advisable for breakdowns and maintenance)."""),
    ("Draw a simple risk matrix. How would you manage risk in mines when posted to a regional office of the department as Regional Coordinator?",
     [("Risk matrix: likelihood vs consequence (e.g. 5x5), risk levels low/medium/high/extreme colour bands", 2), ("Risk management: hazard identification, risk assessment, controls hierarchy, inspections, enforcement, training, emergency plans, monitoring and review", 3)],
     """Risk matrix: a grid with likelihood on one axis (rare, unlikely, possible, likely, almost certain - 1 to 5) and consequence on the other (insignificant, minor, moderate, major, catastrophic - 1 to 5). Risk = likelihood x consequence, banded as low (green, 1-4), medium (yellow, 5-9), high (orange, 10-16) and extreme (red, 20-25).
As Regional Coordinator: 1. Identify hazards in mines of the region (slope failure, blasting, heavy vehicles, dust, landslides, unsafe workings) through regular inspections. 2. Assess and rank risks with the matrix. 3. Require controls using the hierarchy - eliminate, substitute, engineering controls (benches, berms, haul road design), administrative (permits, SOPs, blasting procedures), PPE. 4. Check compliance with approved mine plans and safety rules; issue notices and enforce. 5. Train lessees, managers and workers; ensure emergency response plans and drills. 6. Record and investigate accidents and near misses, monitor and review regularly, and report to the department."""),
    ("Describe the different environmental problems associated with surface mining operations.",
     [("At least five problems explained: land degradation/ loss of vegetation and habitat, soil erosion/ landslides, water pollution/ sedimentation/ altered drainage, air pollution/ dust, noise and vibration/ fly rock, waste dumps, loss of biodiversity, social impacts", 5)],
     "Land degradation - removal of vegetation, topsoil and forests, changing the landscape and destroying habitats. Soil erosion and slope instability - landslides and debris flows from dumps and benches, especially in the monsoon. Water pollution - sediment, suspended solids and chemicals entering streams; changed drainage and lowered water tables; acid mine drainage in some deposits. Air pollution - dust from blasting, loading, haul roads and crushing, and vehicle emissions, affecting health and crops. Noise, ground vibration and fly rock from blasting and machines. Waste dumps and overburden occupying land. Loss of biodiversity and wildlife disturbance. Visual impact and conflicts with communities, agriculture and water sources."),
]
for i, (s, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=5, topic=T, image=None, stem=s, key_points=kp, model=mod, issues=(["Uses Bhutan's ERB rates: check against the rules in force."] if i == 1 else [])))
C1 = """Option I: Mine planning, stability, technology and royalty
Answer all the questions in this option."""
C2 = """Option II: Mine safety, equipment and costs
Answer all the questions in this option."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("mine2025", 1, T, C1, issues=["Q5 on Bhutan's royalty systems: check against the current Mines and Minerals Act/Rules."], items=[
    it("1. Discuss the factors influencing the choice between open-pit and underground mining methods.", 10,
       [("Depth and geometry of deposit, stripping ratio vs break-even", 3), ("Grade, tonnage, ore value and costs (capital/operating), productivity, recovery/dilution", 3), ("Geotechnical, hydrology, environment and land use, safety, technology, regulations, social", 4)],
       "Depth, size, shape and attitude of the ore body - shallow, large, massive or flat deposits suit open-pit; deep, narrow or steeply dipping ones suit underground. Stripping ratio compared with the break-even stripping ratio - when overburden removal becomes uneconomic, change to underground. Grade and value - high-grade ore can bear higher underground costs. Costs and productivity - open-pit has lower cost per tonne, higher production rates and recovery, and large equipment; underground has higher cost but less waste. Recovery and dilution. Geotechnical and hydrological conditions - rock strength, slope stability, groundwater. Environmental and land use - surface disturbance, forests, communities, visual impact, waste dumps; underground has smaller footprint. Safety, availability of skilled labour and technology, regulations and lease conditions, infrastructure and terrain (in Bhutan, steep terrain and environmental rules matter)."),
    it("2. What is mine planning? Explain mine planning and its components. Explain the difference between geological reserve and mineable reserve.", 10,
       [("Definition: systematic process of designing how a deposit will be developed, extracted and closed safely and economically", 2), ("Components: exploration/ geological model, reserve estimation, method selection, pit/ mine design, production scheduling, equipment selection, infrastructure, waste/ dumps, environmental plan, economics, closure", 5), ("Geological reserve: total estimated mineral in the deposit; mineable reserve: part that can be economically and legally extracted after losses, dilution, pit limits", 3)],
       "Mine planning is the systematic process of deciding how a mineral deposit will be developed, extracted, processed and closed in a safe, economic and environmentally responsible way over its life. Components: geological modelling and exploration data; resource and reserve estimation (e.g. kriging, block models); selection of mining method; mine/pit design (ultimate pit limit, benches, haul roads, slopes); production scheduling (short- and long-term) and cut-off grade; equipment selection and fleet sizing; infrastructure (power, water, roads, dumps, drainage); environmental management, reclamation and closure plan; cost estimation and financial evaluation; safety and statutory approvals (FMFS). Geological reserve (resource) is the total quantity and grade of mineral estimated in the ground from exploration, without considering economics. Mineable reserve is the part of it that can be extracted economically, technically and legally with the chosen method - after applying pit limits, cut-off grade, pillars and barriers, mining losses, dilution and regulatory constraints."),
    it("3. A bench in an open-pit mine is 15 m high with a bench face angle of 65°. If the factor of safety against sliding is calculated as 1.1, discuss whether the bench is safe and what corrective measures may be required.", 5,
       [("FoS 1.1 > 1 so marginally stable but below normal design values (1.2-1.5); risky with water, blasting, earthquakes", 2), ("Measures: flatten face angle/reduce height, benches/berms, drainage, controlled blasting, bolting/ netting, monitoring", 3)],
       "A factor of safety of 1.1 means resisting forces only slightly exceed driving forces: the bench is marginally stable but not adequately safe, since design standards usually require about 1.2-1.3 for benches and 1.3-1.5 for long-term or overall slopes. Rain, groundwater, blast vibration or an earthquake could push it below 1. Corrective measures: reduce the face angle (e.g. to 55-60°) or bench height; provide wider berms and catch benches; improve drainage (surface drains, drain holes) to reduce pore pressure; use controlled blasting (pre-splitting, smooth blasting); scale loose rock and install rock bolts or wire mesh where needed; and monitor with prisms or inspections."),
    it("4. Discuss the role of automation and AI in modern mining operations.", 10,
       [("Automation: autonomous haulage, drilling, remote-operated equipment, tele-remote, control rooms", 3), ("AI: predictive maintenance, ore grade control, blast optimisation, scheduling, safety analytics, drones, digital twins", 3), ("Benefits: safety, productivity, cost, precision, environment", 2), ("Challenges: cost, skills, jobs, connectivity, cybersecurity; relevance for Bhutan", 2)],
       "Automation: autonomous haul trucks and drills, remote-controlled and tele-operated loaders, automated conveyors and crushers, all supervised from central control rooms; drones for surveying, stockpile measurement and inspection. AI and data: predictive maintenance from equipment sensor data; optimisation of blasting, fragmentation and fleet dispatch; machine learning for ore-grade modelling and grade control; production scheduling; real-time monitoring of slope stability, dust and gas; fatigue and collision-avoidance systems; digital twins of the mine. Benefits: removes workers from hazardous areas, higher productivity and equipment utilisation, lower fuel and maintenance cost, better recovery and less dilution, and better environmental monitoring. Challenges: high investment, need for skilled staff, job displacement, reliable connectivity, cybersecurity and data quality. In Bhutan, drones, GPS fleet management and predictive maintenance are practical first steps."),
    it("5. What are the two mineral royalty systems of Bhutan? Explain the process of levying the domestic and export mineral royalty. List the advantages and disadvantages of having a mixed royalty system in the country.", 10,
       [("Two systems: specific (fixed rate per tonne) and ad valorem (percentage of value)", 3), ("Levying process: domestic - based on quantity (MT) dispatched/ weighbridge records at prescribed rates; export - percentage of export value/ price at the point prescribed, collected by the department", 4), ("Advantages and disadvantages of mixed mode", 3)],
       "Bhutan uses a specific royalty (a fixed rate per metric tonne of mineral) and an ad valorem royalty (a percentage of the value of the mineral). Domestic sales are charged on quantity: the lessee records dispatches (weighbridge, transit permits), declares the quantity in metric tonnes and pays the prescribed rate per tonne to the Department of Geology and Mines. Exports are charged on value: the royalty is a percentage of the declared export value/price, verified against export documents, collected at the point and in the manner prescribed in the rules. Advantages of the mixed system: specific royalty is simple, predictable and easy to administer for low-value domestic minerals; ad valorem royalty lets the government share in higher international prices and captures more revenue from exports. Disadvantages: more complex administration; risk of under-valuation or transfer pricing for exports; ad valorem revenue fluctuates with prices; specific rates lose value with inflation unless revised; and possible inconsistency between domestic and export users. [Examiner: check rates and collection points against the current rules.]"),
])
Q += case("mine2025", 2, T, C2, issues=["Q1 on accident reporting: check form names and time limits against the current Mines and Minerals rules."], items=[
    it("1. When an accident takes place in a mine area, what is the lessee or the mine manager supposed to do with respect to the department?", 5,
       [("Immediate: rescue, first aid, medical evacuation, make area safe, stop operations in area", 2), ("Inform the department (and Dzongkhag, police) immediately; written notice of accident in the prescribed form within the prescribed time", 2), ("Preserve site, cooperate with investigation, records, corrective measures", 1)],
       "Immediately rescue and give first aid to the injured, arrange medical evacuation, make the area safe and stop work there. Inform the Department of Geology and Mines (and the Dzongkhag administration and police for serious or fatal accidents) at once by the fastest means, then submit a written notice of accident in the prescribed form within the prescribed time, with a copy to the Dzongdag. Preserve the accident site undisturbed until inspection (except for rescue and safety), cooperate with the department's investigation, keep accident records and register, and implement the corrective measures directed."),
    it("2. A shovel with a 2 m³ bucket (fill factor 0.85, material density 2.2 t/m³) loads trucks of 35 t capacity at 90% fill. Shovel cycle time = 40 s. Haul road = 2.5 km (loaded speed 25 km/h, empty speed 35 km/h). Spot/loading time = 2.8 min, dumping time = 1.2 min. Find the number of trucks required if the shovel works continuously.", 10,
       [("Load per pass 2 x 0.85 x 2.2 = 3.74 t; truck payload 31.5 t; passes 8.4 → 9", 3), ("Loading time 9 x 40 s = 6 min; haul 6 min, return 4.3 min", 3), ("Cycle ≈ 20.3 min (adding spot 2.8 and dump 1.2)", 2), ("Trucks = cycle/loading time ≈ 3.4 → 4", 2)],
       """Load per shovel pass = 2 x 0.85 x 2.2 = 3.74 t. Truck payload = 35 x 0.9 = 31.5 t. Passes = 31.5 / 3.74 = 8.4 → 9 passes.
Loading time = 9 x 40 s = 360 s = 6.0 min.
Haul (loaded) = 2.5/25 h = 6.0 min; return (empty) = 2.5/35 h = 4.29 min.
Truck cycle = loading 6.0 + haul 6.0 + return 4.29 + spot 2.8 + dump 1.2 = 20.3 min.
Trucks needed = cycle time / loading time = 20.3 / 6.0 = 3.4 → 4 trucks (so the shovel is never idle).
(If the 2.8 min is taken as including loading, cycle = 14.3 min and trucks = 14.3 / 2.8 ≈ 5.1 → 6; state the assumption.)"""),
    it("3. Briefly describe the various operations involved in surface mining. Classify surface mining methods in relation to the equipment used.", 10,
       [("Unit operations: site clearing/topsoil removal, drilling, blasting, excavation/loading, haulage, dumping, (crushing), ancillary (dewatering, road maintenance, reclamation)", 5), ("Classification by equipment: shovel-dumper, dragline, bucket wheel excavator, scraper, surface miner, dozer-ripper, hydraulic excavator/ front-end loader, in-pit crushing-conveying", 5)],
       "Operations: (1) site preparation - clearing vegetation and removing and storing topsoil; (2) drilling of blast holes; (3) blasting to fragment rock; (4) excavation and loading of overburden and ore by shovels, excavators or loaders; (5) haulage by dumpers, conveyors or rail; (6) dumping of waste on dumps and ore at stockpiles/crushers; (7) ancillary operations - dozing, haul road maintenance, dewatering, dust suppression, slope monitoring; (8) reclamation and backfilling. Classification by equipment: shovel-dumper (truck) systems (most common, e.g. limestone and dolomite quarries); dragline mining (cast overburden in strip mines); bucket wheel excavator with conveyors (continuous mining of soft material); scraper mining; dozer-ripper systems; surface miners (blast-free cutting); hydraulic excavator/front-end loader systems; and in-pit crushing and conveying."),
    it("4. Find the cost per cubic metre of rock to be blasted from the following data: explosive cost = ₹250/kg; consumption = 8 kg/m³; burden = 3 m; spacing = 4 m; bench height = 10 m.", 10,
       [("Volume per hole = 3 x 4 x 10 = 120 m³", 3), ("Explosive per hole = 8 x 120 = 960 kg; cost per hole = ₹2,40,000", 3), ("Cost per m³ = 8 x 250 = ₹2000/m³ (explosive cost); note 8 kg/m³ is unusually high (typical 0.3-0.8)", 4)],
       """Volume of rock per hole = burden x spacing x bench height = 3 x 4 x 10 = 120 m³.
Explosive per hole = 8 kg/m³ x 120 m³ = 960 kg. Explosive cost per hole = 960 x 250 = ₹2,40,000.
Cost per m³ = 2,40,000 / 120 = ₹2000 per m³ (= 8 x 250).
Note: a powder factor of 8 kg/m³ is far higher than normal bench blasting (about 0.3-0.8 kg/m³), so the data may contain a typo; with 0.8 kg/m³ the cost would be ₹200/m³. Accessories (detonators, cord) and drilling costs would be added to get the total blasting cost."""),
    it("5. What is productivity in mining? Elaborate on overall mining operations with respect to machines and drilling operations.", 10,
       [("Productivity definition: output per unit input (t per man-shift, t per machine hour, OMS), factors", 3), ("Machine productivity: availability, utilisation, efficiency, OEE, matching shovel-truck, maintenance", 4), ("Drilling: drill rate, hole quality, pattern, fragmentation effects on loading/ crushing; improvement measures", 3)],
       "Productivity in mining is the ratio of output (tonnes of ore/overburden) to the inputs used - labour, machines, energy and capital - e.g. output per man-shift (OMS), tonnes per machine hour, or cost per tonne. Machines: productivity depends on availability (mechanical readiness), utilisation (time actually worked), operating efficiency and rated capacity; overall equipment effectiveness improves with good maintenance (preventive/predictive), skilled operators, well-maintained haul roads, correct shovel-truck matching (match factor near 1), dispatch systems and less waiting. Drilling: productivity is measured as metres drilled per hour and holes per shift; it depends on rock type, bit selection, drill condition and operator skill. Accurate drilling to the planned burden, spacing and depth gives good fragmentation, which raises shovel loading rates, truck payloads and crusher throughput and reduces secondary blasting and toe problems. Overall mine productivity therefore comes from integrating drilling, blasting, loading, hauling and maintenance, with monitoring of key performance indicators."),
])
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions", "type": "short_answer", "count": 5, "marks_each": 5, "answer_any": None},
    {"title": "Section B: Case study (answer either Option I or Option II)", "type": "passage", "count": 2, "marks_each": 45, "answer_any": 1},
]
