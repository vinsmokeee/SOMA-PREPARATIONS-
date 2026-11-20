"""ME Technical Paper III (Subject Specialisation Paper), Agriculture Engineering, BCSE 2025 - real paper (PDF sent by the founder).
Pattern: Section A Part I 30 MCQ, Part II 4 short answers x 5; Section B one of two case studies (50). 150 min + 15 min reading.
Left out: MCQ 5 (the right device, the differential, is not an option), 7 (greenhouse orientation: sources differ), 8 (two
options fit diesel compression ratios); three new MCQs keep Part I at 30.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Agriculture Engineering): BCSE 2025, batch 1"
GROUP_TAG = "agriengg2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "agriculture-engineering"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Agriculture Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Agriculture Engineering"

MCQ = r"""[
{
"n": 1,
"stem": "During the operation of farm machines, if the machine produces black smoke, it indicates",
"opts": [
"Burning of lubricant in the cylinder",
"Presence of water in fuel",
"Engine is overloaded",
"None of the above"
]
},
{
"n": 2,
"stem": "Process of adding vitamins to milk is known as",
"opts": [
"Flavouring",
"Fortification",
"Fermentation",
"Sterilization"
]
},
{
"n": 3,
"stem": "Muffler is provided on tractor to control",
"opts": [
"Noise",
"Vibration",
"Fuel consumption",
"Fuel supply system"
]
},
{
"n": 4,
"stem": "A normal plowing depth for agriculture practice is",
"opts": [
"15 cm",
"30 cm",
"40 cm",
"100 cm"
]
},
{
"n": 5,
"stem": "The device that permits one of the rear wheels of tractor to rotate faster than the other at the turning is called",
"opts": [
"Power train",
"Clutch",
"Differential lock",
"All of the above"
]
},
{
"n": 6,
"stem": "Soil water potential of permanent wilting point is",
"opts": [
"0.1 to 0.3 bar",
"15 bars",
"33 bars",
"60 bars"
]
},
{
"n": 7,
"stem": "In Bhutan, a free-standing green house should be oriented in",
"opts": [
"South-East direction",
"North-South direction",
"North-East direction",
"South-West direction"
]
},
{
"n": 8,
"stem": "The compression ratio of diesel engine is",
"opts": [
"4 to 8:1",
"14 to 20:1",
"14 to 22:1",
"1 to 20:1"
]
},
{
"n": 9,
"stem": "Lysimeter is used to measure",
"opts": [
"Evaporation",
"Evapotranspiration",
"Atmospheric pressure",
"None of these"
]
},
{
"n": 10,
"stem": "What is a draft required to pull a four bottom 30 cm tractor plough, working at a depth of 15 cm operated at speed of 6 km/h? (Soil resistance is 0.7 kg/cm2)",
"opts": [
"12.6 kg",
"126 kg",
"1260 kg",
"None of these"
]
},
{
"n": 11,
"stem": "The carburetor of an engine is used to mix fuel with",
"opts": [
"Oil",
"Air",
"Water",
"All of these"
]
},
{
"n": 12,
"stem": "The part of MB plough to which all other parts of plough bottom is attached, is",
"opts": [
"Mould board",
"Land side",
"Frog",
"Coulter"
]
},
{
"n": 13,
"stem": "A function of drawbar in tractors is to",
"opts": [
"Lift the load",
"Hitch the implements",
"Hold the load",
"Pull the load"
]
},
{
"n": 14,
"stem": "Choke controls the amount",
"opts": [
"Air",
"Fuel",
"Water",
"All are correct"
]
},
{
"n": 15,
"stem": "What power is necessary for pulling a harrow with 50 tines, each giving a resistance of 1 kg, when the speed of harrow is 5 km/h?",
"opts": [
"0.680 kW",
"680 kW",
"68 kW",
"6.8 kW"
]
},
{
"n": 16,
"stem": "The process of grain drying involves",
"opts": [
"Heat transfer",
"Heat and mass transfer",
"Mass transfer",
"None of these"
]
},
{
"n": 17,
"stem": "Pasteurization may be defined as heating every particle of milk at least _______________ temperature and holding it at that temperature for 30 minutes.",
"opts": [
"100 degree Celsius",
"81 degree Celsius",
"71 degree Celsius",
"61 degree Celsius"
]
},
{
"n": 18,
"stem": "…………………….. is the power delivered by the engine at the end of the crankshaft?",
"opts": [
"Indicated horsepower (IHP)",
"Brake horsepower (BHP)",
"Frictional horsepower (FHP)",
"Drawbar horsepower (DBHP)"
]
},
{
"n": 19,
"stem": "Watershed is defined as geohydrological unit",
"opts": [
"Draining to a common point/outlet",
"Receiving same amount of rainfall",
"Have similar land use",
"Have similar socioeconomic status of inhabitants"
]
},
{
"n": 20,
"stem": "Part of the tractor transmission system provided with the standard externally splined shaft at the rear end of the tractor used to attach a combine harvester, thresher, mover, etc is",
"opts": [
"PTO",
"Final drive",
"Rear axle",
"Differential gear"
]
},
{
"n": 21,
"stem": "…………. is the Minimum tillage wherein primary tillage is completely avoided.",
"opts": [
"Reduced tillage",
"Mulch tillage",
"Zero tillage",
"Rotational tillage"
]
},
{
"n": 22,
"stem": "Which of the following is a main objective of puddling in paddy?",
"opts": [
"Destroy insects and pests",
"Create an impermeable layer in the soil",
"Mix the fertilizer in the soil",
"Reduce the soil erosion"
]
},
{
"n": 23,
"stem": "The term “Black gold” and “Black diamond” are usually used for",
"opts": [
"Petroleum and coal",
"Graphite and carbon",
"Iron and mustard",
"Coal and carbon"
]
},
{
"n": 24,
"stem": "Which of the following affect the traction in a tractor?",
"opts": [
"Tyre width and diameter",
"Weight",
"Soil type and its condition",
"All of these"
]
},
{
"n": 25,
"stem": "How many Tension links and Compression links are there in Three-point hitch system?",
"opts": [
"2 tension link and 1 compression link",
"3 tension link and 2 compression links",
"1 tension link and 3 compression links",
"2 tension link and 0 compression link"
]
},
{
"n": 26,
"stem": "Detonation in an IC engine can be controlled using various methods such as (i) By maintaining correct mixture of fuel and air (ii) Proper spark setting (iii) Proper valve adjustment (iv) Using antiknock fuel Which is the correct method?",
"opts": [
"(i) and (ii)",
"(iii) and (iv)",
"(i), (ii) and (iii)",
"All of the above"
]
},
{
"n": 27,
"stem": "The process of uniting fuel chemically with oxygen for producing intense heat in an engine cylinder is",
"opts": [
"Ignition",
"Combustion",
"Charging",
"Mixing"
]
},
{
"n": 28,
"stem": "The critical design criteria for feasibility of farm machines in steep slopes of Bhutan is",
"opts": [
"Machine quality",
"Tilt angle of the machine",
"Tilt angle of plough",
"Center of gravity of the machine."
]
},
{
"n": 29,
"stem": "What is the recommended temperature of cooling tankers while transporting the milk?",
"opts": [
"1 degree Celsius",
"2 degree Celsius",
"3 degree Celsius",
"4 degree Celsius"
]
},
{
"n": 30,
"stem": "Sprinkle irrigation is suitable where the soil has",
"opts": [
"Clayey texture",
"Loamy Texture",
"Undulating topography",
"All of these"
]
}
]"""

KEY = {
    1: ("c", "Black smoke shows incomplete burning of excess fuel, typically when the engine is overloaded."), 2: ("b", "Adding vitamins/minerals is fortification."),
    3: ("a", "The muffler (silencer) reduces exhaust noise."), 4: ("a", "Normal ploughing depth is about 15 cm."), 6: ("b", "Permanent wilting point ≈ −15 bar."),
    9: ("b", "A lysimeter measures evapotranspiration."), 10: ("c", "4 × 30 × 15 = 1,800 cm² × 0.7 kg/cm² = 1,260 kg."), 11: ("b", "The carburettor mixes fuel with air."),
    12: ("c", "All parts of the mouldboard plough bottom are bolted to the frog."), 13: ("b", "The drawbar is used to hitch (attach) trailed implements."),
    14: ("a", "The choke restricts air to enrich the mixture."), 15: ("a", "50 kg × 9.81 = 490.5 N; × 1.389 m/s = 681 W ≈ 0.680 kW."),
    16: ("b", "Drying removes moisture: simultaneous heat and mass transfer."), 17: ("d", "Low-temperature long-time pasteurisation is about 61-63 °C for 30 minutes."),
    18: ("b", "Brake horsepower is measured at the crankshaft."), 19: ("a", "A watershed drains to a common outlet."), 20: ("a", "The power take-off (PTO) shaft drives implements."),
    21: ("c", "Zero tillage avoids primary tillage completely."), 22: ("b", "Puddling makes a hard, impermeable layer that holds water in the paddy."),
    23: ("a", "Black gold = petroleum, black diamond = coal."), 24: ("d", "Tyres, weight and soil all affect traction."),
    25: ("a", "The two lower links are in tension, the top link in compression."), 26: ("d", "All four help control detonation."),
    27: ("b", "Combustion is the chemical union of fuel with oxygen."), 28: ("d", "On steep slopes stability depends on the machine's centre of gravity."),
    29: ("d", "Milk is cooled and transported at about 4 °C."), 30: ("c", "Sprinklers suit undulating land where surface irrigation is hard."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "The tractor part that allows the two rear wheels to turn at different speeds while taking a turn is the", ["differential", "clutch", "power take-off", "gear box"], "a", "The differential divides power so the outer wheel can turn faster."),
    new_mcq(2, T, "One hectare is equal to", ["1,000 m²", "4,047 m²", "10,000 m²", "100,000 m²"], "c", "1 ha = 100 m × 100 m."),
    new_mcq(3, T, "Field capacity of a soil corresponds to a soil water potential of about", ["−0.1 bar", "−1/3 bar", "−15 bar", "−60 bar"], "b", "Field capacity ≈ −1/3 bar; wilting point ≈ −15 bar."),
    saq(1, T, """Explain the following agriculture terms:
a) Sprayer (1 mark)
b) Combine harvester (1 mark)
c) Transplanter (1 mark)
d) Tillage (1 mark)
e) Milling (1 mark)""",
        [("a) Machine that applies liquid pesticide/fertiliser as fine droplets", 1), ("b) Machine that reaps, threshes and cleans grain in one operation", 1), ("c) Machine that plants seedlings (e.g. rice) into the field", 1),
         ("d) Mechanical working of soil to prepare a seedbed", 1), ("e) Processing grain - removing husk/bran and grinding into flour or polished grain", 1)],
        """a) Sprayer: a machine that breaks liquid chemicals (pesticides, herbicides, liquid fertilisers) into fine droplets and spreads them evenly on crops.
b) Combine harvester: a machine that cuts (reaps), threshes, separates and cleans grain in one pass.
c) Transplanter: a machine that plants nursery seedlings, such as rice, into puddled fields at set spacing.
d) Tillage: mechanical working of the soil (ploughing, harrowing) to make a good seedbed and control weeds.
e) Milling: processing harvested grain - removing husk and bran (e.g. rice) or grinding into flour (e.g. wheat, maize)."""),
    saq(2, T, """a) Clutch is one of the important components in a tractor. State its function. (2 marks)
b) The engine of a tractor is tested for its power. What is the commonly used equipment to do the test? (1 mark)
c) What is the difference between 2-stroke and 4-stroke cycle engines? (2 marks)""",
        [("a) Engages/disengages engine power to the gearbox; smooth start and gear change", 2), ("b) Dynamometer (PTO dynamometer)", 1), ("c) 2-stroke: power every revolution, ports; 4-stroke: power every two revolutions, valves", 2)],
        """a) The clutch connects and disconnects engine power to the transmission, so the tractor can start smoothly, gears can be changed and the tractor stopped without stopping the engine.
b) A dynamometer (usually a PTO dynamometer) measures the engine's power.
c) A 2-stroke engine completes the cycle in two strokes (one crankshaft revolution), giving a power stroke every revolution, uses ports and is light but less fuel-efficient. A 4-stroke engine needs four strokes (two revolutions) - suction, compression, power, exhaust - uses valves, and is more efficient and durable."""),
    saq(3, T, "Differentiate petrol engine and diesel engine. (5 marks)",
        [("Ignition: spark plug vs compression ignition", 1), ("Compression ratio: about 6-10 vs 14-22", 1), ("Fuel supply: carburettor/injection with air vs fuel injector into hot air", 1), ("Efficiency and fuel economy, torque", 1), ("Weight, cost, use (light vehicles vs tractors, heavy duty)", 1)],
        """Petrol (SI) engine: fuel-air mixture prepared outside the cylinder (carburettor or port injection) and ignited by a spark plug; low compression ratio (6-10:1); lighter, cheaper, smoother and quieter, but lower efficiency and torque; used in cars, motorcycles, small machines.
Diesel (CI) engine: only air is compressed; fuel is injected and ignites from the heat of compression; high compression ratio (14-22:1); heavier and costlier but more fuel-efficient with high torque; used in tractors, trucks and heavy machinery."""),
    saq(4, T, "Calculate the seed rate per hectare of a 7 × 17 cm seed drill (7 furrow openers spaced 17 cm apart), whose main drive wheel is 124 cm in diameter and the total weight of grain collected in 20 revolutions is 0.423 kg. (5 marks)",
        [("Width = 7 × 0.17 = 1.19 m", 1), ("Distance = π × 1.24 × 20 = 77.9 m", 1), ("Area = 1.19 × 77.9 = 92.7 m²", 1), ("Seed rate = 0.423 × 10,000 / 92.7", 1), ("≈ 45.6 kg/ha", 1)],
        """Width covered = 7 × 0.17 = 1.19 m. Distance travelled = π × 1.24 × 20 = 77.9 m. Area = 1.19 × 77.9 = 92.7 m². Seed rate = 0.423 kg / 92.7 m² × 10,000 = 45.6 kg per hectare."""),
]
C1 = """CASE I
A farmer in Bumthang purchased a tractor of 45 HP at a total cost of Nu 300,000, aiming to operate it for 1,000 hours in a year at an interest rate of 10% after purchase. The life span of the tractor is 10 years and the salvage value is 10% of the initial cost. The housing cost, insurance and taxes were each 1% of the initial cost of the tractor. Fuel consumption of the tractor is 6 litres per hour and it requires a lubricant costing 30% of the fuel cost. In the Bumthang area, the cost of diesel is Nu 24 per litre. The repair and maintenance cost is assumed to be 6% of the initial cost yearly. The machine is operated by an operator paid Nu 150 for 8 hours daily."""
C2 = "CASE II (agricultural machinery and post-harvest)"
Q += case("agriengg2025", 1, T, C1, [
    ("Question 1: What should be the: (i) depreciation cost; (ii) salvage value; (iii) total fixed costs per hour; (iv) total operating cost per hour; (v) overall cost of using the tractor?", 30,
     [("(i) Depreciation = (300,000 − 30,000)/10 = Nu 27,000/yr = Nu 27/h", 6), ("(ii) Salvage value = 10% × 300,000 = Nu 30,000", 4),
      ("(iii) Interest 10% × (P+S)/2 = 16.5/h; housing, insurance, taxes 3% = 9/h; fixed = 27 + 16.5 + 9 = Nu 52.5/h", 8),
      ("(iv) Fuel 144 + lubricant 43.2 + repair 18 + operator 18.75 = Nu 223.95/h", 8), ("(v) Overall = 52.5 + 223.95 ≈ Nu 276.45/h", 4)],
     """(ii) Salvage value S = 10% of 300,000 = Nu 30,000.
(i) Depreciation (straight line) = (300,000 − 30,000)/10 = Nu 27,000 per year = Nu 27 per hour (1,000 h/yr).
(iii) Interest on average investment = 10% × (300,000 + 30,000)/2 = Nu 16,500/yr = Nu 16.5/h. Housing + insurance + taxes = 3% × 300,000 = Nu 9,000/yr = Nu 9/h. Total fixed cost = 27 + 16.5 + 9 = Nu 52.5 per hour.
(iv) Fuel = 6 L × Nu 24 = Nu 144/h. Lubricant = 30% × 144 = Nu 43.2/h. Repair and maintenance = 6% × 300,000 = Nu 18,000/yr = Nu 18/h. Operator = 150/8 = Nu 18.75/h. Total operating cost = 144 + 43.2 + 18 + 18.75 = Nu 223.95 per hour.
(v) Overall cost = 52.5 + 223.95 = Nu 276.45 per hour of use (about Nu 276,450 per year)."""),
    ("Question 2: Describe the maintenance practices required on a tractor before it is put to daily use.", 20,
     [("Engine oil, coolant/radiator, fuel level and water in fuel", 5), ("Air cleaner, fan belt, battery and leaks", 5), ("Tyre pressure, wheel nuts, brakes, clutch and steering", 5), ("Greasing points, lights, hitch/PTO, log book and warm-up", 5)],
     """Daily (10-hour) checks before work: check engine oil level and top up; check radiator coolant; check fuel and drain water/sediment from the fuel filter; clean the air cleaner (oil-bath or dry element) especially in dusty work; check fan-belt tension; check battery terminals and electrolyte; look for oil, fuel and water leaks; check tyre pressure and wheel nuts; test brakes, clutch free play and steering; grease all grease nipples (front axle, steering, linkages); check lights, horn and hydraulic oil; inspect the three-point hitch, drawbar and PTO guard; warm up the engine and listen for abnormal noise; record the hours in the log book."""),
])
Q += case("agriengg2025", 2, T, C2, [
    ("Question 1: Describe the components of the transmission system of a tractor.", 10,
     [("Clutch", 2), ("Gear box", 2), ("Differential and differential lock", 2), ("Final drive and rear axle/wheels", 2), ("PTO and power flow sequence", 2)],
     """Power flows from the engine through: the clutch (engages and disengages power); the gear box (gives several speeds and reverse, matching speed and torque to the job); the differential (lets the rear wheels turn at different speeds on turns, with a differential lock for slippery fields); the final drive (further speed reduction and torque increase) and rear axles to the wheels; and the power take-off (PTO) shaft that drives implements such as threshers and rotavators."""),
    ("Question 2: If a driven pulley is made to rotate at 350 rev/min by a driving pulley of 0.3 m diameter running at 1,400 rev/min, determine: (i) the diameter of the driven pulley; (ii) the length of the open belt when the pulleys are 2 m apart; (iii) the length of a cross belt when the pulleys are 2 m apart.", 15,
     [("(i) D₂ = D₁N₁/N₂ = 0.3 × 1400/350 = 1.2 m", 5), ("(ii) L = π(D₁+D₂)/2 + (D₂−D₁)²/4C + 2C = 2.356 + 0.101 + 4 ≈ 6.46 m", 5), ("(iii) L = π(D₁+D₂)/2 + (D₁+D₂)²/4C + 2C = 2.356 + 0.281 + 4 ≈ 6.64 m", 5)],
     """(i) N₁D₁ = N₂D₂, so D₂ = 0.3 × 1400/350 = 1.2 m.
(ii) Open belt: L = (π/2)(D₁ + D₂) + (D₂ − D₁)²/(4C) + 2C = 1.571 × 1.5 + 0.81/8 + 4 = 2.356 + 0.101 + 4 ≈ 6.46 m.
(iii) Cross belt: L = (π/2)(D₁ + D₂) + (D₁ + D₂)²/(4C) + 2C = 2.356 + 2.25/8 + 4 = 2.356 + 0.281 + 4 ≈ 6.64 m."""),
    ("Question 3: A four-bottom, 40 cm mouldboard plough has a ploughing depth of 17.5 cm and a draft of 1,700 kg. If it is working at a speed of 5.5 km/h and has a field efficiency of 75%, calculate: (i) unit draft; (ii) actual power requirement; (iii) area covered per hour.", 15,
     [("(i) Unit draft = 1700/(4 × 40 × 17.5 = 2,800 cm²) ≈ 0.61 kg/cm²", 5), ("(ii) P = 1700 × 9.81 × (5.5/3.6) ≈ 25.5 kW (≈ 34 hp)", 5), ("(iii) 1.6 m × 5.5 km/h × 0.75 = 0.66 ha/h", 5)],
     """(i) Cross-section = 4 × 40 × 17.5 = 2,800 cm²; unit draft = 1,700/2,800 ≈ 0.61 kg/cm².
(ii) Draft force = 1,700 × 9.81 = 16,677 N; speed = 5.5/3.6 = 1.528 m/s; power = 16,677 × 1.528 ≈ 25,480 W ≈ 25.5 kW (about 34 hp).
(iii) Width = 4 × 0.40 = 1.6 m. Theoretical capacity = 1.6 × 5,500 / 10,000 = 0.88 ha/h; effective = 0.88 × 0.75 = 0.66 ha/h."""),
    ("Question 4: What are the factors affecting grain storage? What could be some of the probable ideas to improve grain storage in order to help Bhutanese farmers?", 10,
     [("Factors: grain moisture, temperature, humidity, insects, rodents, fungi/moulds, storage structure, hygiene", 5), ("Ideas: proper drying, hermetic bags/metal bins, improved stores, community storage, training, cold/dry storage, pest management", 5)],
     """Factors: moisture content of the grain (above about 12-14% causes moulds and heating), temperature and relative humidity, insects (weevils), rodents and birds, fungi and aflatoxin, the condition of the store (leaks, ventilation), cleanliness and storage time.
Ideas for Bhutan: dry grain properly (solar dryers, tarpaulins) before storage; use hermetic bags and metal or plastic silos instead of open baskets; improve traditional stores with rat guards and sealed floors; community storage and warehouses in each gewog; train farmers in hygiene, safe fumigants and botanical pest control; regular inspection; link to FCB/markets so grain is not stored too long."""),
])
PATTERN = STANDARD
