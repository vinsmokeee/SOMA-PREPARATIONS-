"""ME Technical Paper III (Subject Specialisation Paper), Survey Engineering, BCSE 2025 - real paper (PDF sent by the founder).
Own pattern from the paper: Part I 30 MCQ; Part II 5 short answers x 4 = 20 (the paper says 'choose five of six' but prints
only five); Section B answer any TWO of three cases (25 each). Replaced MCQs on Bhutan rule values that could not be
verified: 14, 20, 28, 29, 30. SAQ 4 gives no rover reading, so the model applies the corrections to the given coordinates.
Bhutan National Grid parameters in SAQ 5 should be checked by an expert.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1"
GROUP_TAG = "survey2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "survey-engineering"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Survey Engineering"

MCQ = r"""[
{
"n": 1,
"stem": "Which positioning method is used by GPS to determine location?",
"opts": [
"Triangulation",
"Trilateration",
"Traversing",
"Intersection"
]
},
{
"n": 2,
"stem": "Geoid is best described as…",
"opts": [
"Perfect sphere",
"An equipotential surface that approximates mean sea level",
"Mathematical Ellipsoid",
"Earth surface model"
]
},
{
"n": 3,
"stem": "Which ellipsoid is used for DrukRef03 datum?",
"opts": [
"WGS 1984",
"Everest 1981",
"GRS 1980",
"Bessel 1841"
]
},
{
"n": 4,
"stem": "Which of the following is a common error source that RTK surveying must correct for?",
"opts": [
"Ephemeris errors",
"Clock drift",
"Multi-path effects",
"All of above"
]
},
{
"n": 5,
"stem": "In GPS surveying, the ambiguity is resolved by?",
"opts": [
"Calculating Doppler shift from satellite signals",
"Using only the L2 frequency",
"Determining the integer number of carrier wave cycles",
"Averaging multiple pseudo-range positions"
]
},
{
"n": 6,
"stem": "Which error in surveying is not systematic?",
"opts": [
"Temperature effect.",
"Instrument miscalibration.",
"Collimation error.",
"Human error"
]
},
{
"n": 7,
"stem": "In which portion of the electromagnetic spectrum do GPS signals operate?",
"opts": [
"Infrared",
"Visible light",
"Radio wave",
"Ultraviolet"
]
},
{
"n": 8,
"stem": "Stereoscopic vision in photogrammetry is possible due to…",
"opts": [
"Digital image processing.",
"Camera distortion.",
"Color enhancement.",
"Overlap in successive images"
]
},
{
"n": 9,
"stem": "Orthophotos are generated to…",
"opts": [
"Reduce the image file size.",
"Remove image distortions and terrain relief.",
"Enhance 3D modeling.",
"Correct orientations."
]
},
{
"n": 10,
"stem": "What is 'parallax' refers to in photogrammetry?",
"opts": [
"Measurement error",
"Camera distortion",
"Refraction effect",
"Apparent displacement due to different viewpoints"
]
},
{
"n": 11,
"stem": "What are the transformation parameters?",
"opts": [
"Translations",
"Rotations",
"Scale factor",
"All above"
]
},
{
"n": 12,
"stem": "What type of data is produced directly by LIDAR?",
"opts": [
"Raster",
"Vector",
"Point cloud",
"Image"
]
},
{
"n": 13,
"stem": "For a map of 1:5000, what is the minimum size of the features that can be plotted in the map?",
"opts": [
"2 m",
"1.25 m",
"2.5 m",
"3.5 m"
]
},
{
"n": 14,
"stem": "In control network what is horizontal accuracy of the secondary control point in control network in Bhutan?",
"opts": [
"≤ 2 cm",
"≤ 4 cm",
"≤ 5 cm",
"≤ 8 cm"
]
},
{
"n": 15,
"stem": "The total station machine has the horizontal accuracy specification as 2 mm + 2 ppm. What would be the maximum potential error when the horizontal distance measured is 1 km?",
"opts": [
"±2 mm",
"±4 mm",
"±6 mm",
"±8 mm"
]
},
{
"n": 16,
"stem": "In surveying, trilateration refers to measuring…",
"opts": [
"Angle",
"Distance",
"Time",
"All above"
]
},
{
"n": 17,
"stem": "What does Dilution of Precision (DOP) in GPS surveying represent?",
"opts": [
"The number of visible satellites",
"The strength of satellite signal",
"The effect of satellite geometry on positional accuracy",
"The number of frequency bands used"
]
},
{
"n": 18,
"stem": "What is the main cause of systematic errors in surveying?",
"opts": [
"Random fluctuations in measurements",
"Instrumental imperfections or environmental factors",
"Human mistakes during data recording",
"Variations in the gravitational field"
]
},
{
"n": 19,
"stem": "Which map projection system is more accurate to be used for the cadastral mapping in Bhutan?",
"opts": [
"Local grid projection defined for every Dzongkhag",
"National grid projection",
"Universal Transverse Mercator (UTM)",
"Plane projection"
]
},
{
"n": 20,
"stem": "What is the maximum positional tolerance accepted for cadastral survey in Bhutan?",
"opts": [
"1 decimeter",
"0.1 decimeter",
"0.01 m",
"10 mm"
]
},
{
"n": 21,
"stem": "Which communication method is commonly used to transmit RTK corrections?",
"opts": [
"Bluetooth",
"UHF/VHF radio or NTRIP via Internet",
"Fiber optic cable",
"Infrared"
]
},
{
"n": 22,
"stem": "What measurement technique is primarily used in GNSS-RTK surveying to achieve centimeter- level accuracy?",
"opts": [
"Pseudo-range positioning",
"Doppler shift tracking",
"Carrier-phase measurement",
"code-based ranging"
]
},
{
"n": 23,
"stem": "Which part of the electromagnetic spectrum is typically emitted by Electronic Distance Measurement (EDM) instruments?",
"opts": [
"Gamma rays",
"Radio waves",
"Ultraviolet rays",
"Infrared and microwave signals"
]
},
{
"n": 24,
"stem": "EDM (Electronic Distance Measurement) works on the principle of…",
"opts": [
"Triangulation",
"Traversing",
"Resection",
"Travel time and phase shift of electromagnetic waves"
]
},
{
"n": 25,
"stem": "What is equivalent value of area in hectare for 1 acre plot?",
"opts": [
"0.405 ha",
"0.505 ha",
"0.605 ha",
"0.705 ha"
]
},
{
"n": 26,
"stem": "A GNSS receiver measures an ellipsoidal height of 2000 m at a survey point in Bhutan. Given the geoid height at that location is 35 m what is the orthometric height at the survey point?",
"opts": [
"2000",
"2035",
"1965",
"2010"
]
},
{
"n": 27,
"stem": "The Land Act 2007 of Bhutan mandates all the cadastral survey is conducted on National Geodetic reference datum. The current datum (DrukRef03) is realized at the tectonic plate epoch of ….",
"opts": [
"2000",
"2003",
"2005",
"2010"
]
},
{
"n": 28,
"stem": "To achieve a positional accuracy of a cadastral survey as per the Land Rules and Regulation 2007 of Bhutan, what would be the maximum recommended baseline distance when using a single-base CORS RTK setup?",
"opts": [
"20 km",
"30 km",
"40 km",
"50 km"
]
},
{
"n": 29,
"stem": "As per the Land Rules and Regulation 2007 of Bhutan, what is the frequency of all survey equipment must be calibrated….",
"opts": [
"Annually",
"Biannually",
"Quarterly",
"Every 3 years"
]
},
{
"n": 30,
"stem": "What is the significant digit of rounding area used for cadastral parcel in LISCAD?",
"opts": [
"0.001",
"0.005",
"0.01",
"0.05"
]
}
]"""

KEY = {
    1: ("b", "GPS finds position by trilateration (distances from satellites)."), 2: ("b", "The geoid is the equipotential surface approximating mean sea level."),
    3: ("c", "DrukRef03 is based on ITRF2000 with the GRS80 ellipsoid."), 4: ("d", "RTK corrects ephemeris, clock and atmospheric errors; multipath must be managed too."),
    5: ("c", "Ambiguity resolution finds the integer number of carrier cycles."), 6: ("d", "Human error (blunders/random) is not systematic."),
    7: ("c", "GPS signals are L-band radio waves."), 8: ("d", "Stereo viewing needs overlapping photos taken from different positions."),
    9: ("b", "Orthophotos remove relief displacement and tilt distortions."), 10: ("d", "Parallax is the apparent displacement of an object between two viewpoints."),
    11: ("d", "A 7-parameter transformation has translations, rotations and scale."), 12: ("c", "LiDAR produces a point cloud."),
    13: ("b", "Plottable error 0.25 mm x 5000 = 1.25 m."), 15: ("b", "2 mm + 2 ppm x 1 km (2 mm) = ±4 mm."),
    16: ("b", "Trilateration measures distances."), 17: ("c", "DOP describes how satellite geometry affects accuracy."),
    18: ("b", "Systematic errors come from instrument imperfections and environmental factors."), 19: ("a", "Dzongkhag local TM grids keep scale distortion small, best for cadastral work."),
    21: ("b", "RTK corrections are sent by UHF/VHF radio or NTRIP over the internet."), 22: ("c", "RTK uses carrier-phase measurements."),
    23: ("d", "EDMs use infrared (and microwave) signals."), 24: ("d", "EDM measures travel time or phase shift of electromagnetic waves."),
    25: ("a", "1 acre = 0.4047 ha."), 26: ("c", "Orthometric height H = h - N = 2000 - 35 = 1965 m."),
    27: ("b", "DrukRef03 is realised at epoch 2003.0."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "In single-base RTK, positional accuracy generally", ["Improves as the baseline gets longer", "Degrades as the distance from the base station increases", "Does not depend on baseline length", "Depends only on the number of satellites"], "b",
            "Atmospheric and orbit errors decorrelate with distance, so RTK accuracy falls as the baseline grows (typically kept within about 10-30 km)."),
    new_mcq(2, T, "Why must survey instruments be calibrated regularly?", ["To change the datum", "To detect and correct systematic instrument errors", "To remove random errors completely", "To increase battery life"], "b",
            "Calibration finds and corrects systematic errors such as collimation, index and EDM constant errors."),
    new_mcq(3, T, "A closed traverse has a perimeter of 2000 m and a linear misclosure of 0.20 m. Its relative precision is", ["1:1000", "1:10 000", "1:20 000", "1:400"], "b",
            "Relative precision = 0.20 / 2000 = 1:10 000."),
    new_mcq(4, T, "In a horizontal control network, the hierarchy from highest to lowest accuracy is", ["Secondary → primary → tertiary", "Primary (zero order/first order) → secondary → tertiary/detail", "Tertiary → secondary → primary", "All orders have equal accuracy"], "b",
            "Lower-order points are densified from higher-order control, so accuracy decreases down the hierarchy."),
    new_mcq(5, T, "The area of a land parcel on a map at 1:1000 scale measures 25 cm². The ground area is", ["25 m²", "250 m²", "2500 m²", "25 000 m²"], "c",
            "1 cm = 10 m, so 1 cm² = 100 m²; 25 x 100 = 2500 m²."),
]
SA = [
    ("Describe the difference between the carrier-phase and pseudo-range (code) techniques of GNSS measurement, including their principle, key features, advantages and limitations.", 4,
     [("Code: measures signal travel time using PRN code correlation x c = pseudo-range; metre-level, instant, simple/cheap receivers, no ambiguity; limited accuracy (1-5 m)", 2), ("Carrier phase: measures phase of carrier wave (19/24 cm) plus integer ambiguity; mm-cm accuracy (RTK, static), needs ambiguity resolution, continuous lock, cycle slips, costlier, longer", 2)],
     "Pseudo-range (code) technique: the receiver correlates the satellite's PRN code (C/A or P) with its replica to measure signal travel time; multiplied by the speed of light this gives a range biased by clock error (pseudo-range). Positions from four or more satellites. Features/advantages: simple, instant, cheap receivers, no ambiguity problem, works for navigation and GIS mapping. Limitations: accuracy about 1-5 m (or sub-metre with DGNSS), affected by multipath and atmosphere. Carrier-phase technique: measures the phase of the carrier wave (L1 wavelength about 19 cm, L2 about 24 cm) plus an unknown integer number of whole cycles (ambiguity) that must be resolved. Advantages: mm- to cm-level accuracy (static, RTK, PPP) - needed for geodetic control and cadastral surveys. Limitations: needs ambiguity resolution, continuous lock (cycle slips), dual-frequency/expensive receivers, base stations or CORS, and longer observation."),
    ("What is a scale factor? Explain how it acts as a multiplier with a total station and as a divider with GPS.", 4,
     [("Scale factor: ratio of grid distance to ground (ellipsoid) distance; combined scale factor = grid (projection) factor x elevation (height) factor", 2), ("Total station measures ground distance - multiply by CSF to get grid distance for computing grid coordinates; GPS gives grid coordinates - grid distance divided by CSF gives ground distance for setting out", 2)],
     "Scale factor is the ratio between a distance on the map projection (grid) and the corresponding distance on the ellipsoid; with the elevation (height) factor it forms the combined scale factor (CSF = grid scale factor x elevation factor), relating grid distance to true ground distance. A total station measures horizontal ground distances, so to compute coordinates on the national grid the ground distance is multiplied by the CSF (grid distance = ground distance x CSF). GNSS gives coordinates directly on the grid, so a distance computed from GPS coordinates is a grid distance; to set out or compare with ground measurements it is divided by the CSF (ground distance = grid distance / CSF). Example: CSF 0.9997 - a 1000 m ground distance is 999.70 m on the grid."),
    ("What are plottable error and map accuracy? Compute the plottable error and map accuracy for a map scale of 1:5000.", 4,
     [("Plottable error: smallest distance that can be plotted/ read on a map, about 0.25 mm (0.2-0.3 mm) at map scale", 1.5), ("Map accuracy: positional accuracy of features shown; commonly 0.5 mm (or 0.3 mm) x scale", 1), ("1:5000: plottable 0.25 mm x 5000 = 1.25 m; map accuracy 0.5 mm x 5000 = 2.5 m (or per standard used)", 1.5)],
     "Plottable error (graphical accuracy) is the smallest distance that can be plotted or distinguished on a map by eye, usually taken as 0.25 mm at map scale (0.2-0.3 mm). Map accuracy is the expected positional accuracy of well-defined features shown on the map, often taken as about 0.5 mm at map scale (or twice the plottable error). For 1:5000: plottable error = 0.25 mm x 5000 = 1.25 m on the ground, so features smaller than about 1.25 m cannot be shown to scale; map accuracy = 0.5 mm x 5000 = 2.5 m."),
    ("Describe the process of differential GNSS positioning and its advantages over standard GPS. The base station coordinates are known (X: 500 m, Y: 300 m, Z: 200 m). The rover receives correction values from the base station (ΔX: -5 m, ΔY: 3.0 m, ΔZ: -2.5 m). Calculate the corrected coordinates for the rover.", 4,
     [("Process: base receiver at known point computes errors (known minus observed), sends corrections (radio/ NTRIP) or post-processing; rover applies corrections; common errors cancel", 1.5), ("Advantages: removes common errors (satellite clock/orbit, ionosphere, troposphere), sub-metre to cm accuracy, real-time", 1), ("Calculation: X = 500 - 5 = 495 m, Y = 300 + 3 = 303 m, Z = 200 - 2.5 = 197.5 m (stating assumption)", 1.5)],
     "Differential GNSS: a base receiver is set on a point with known coordinates and observes the same satellites as the rover at the same time. Comparing its known position with the position it computes gives corrections (or pseudo-range corrections) for errors common to both receivers - satellite orbit and clock errors and ionospheric and tropospheric delays. These are sent to the rover by radio or internet (NTRIP), or applied later by post-processing, and the rover applies them to its own observations. Advantages over standalone GPS: accuracy improves from several metres to sub-metre (code DGNSS) or centimetres (carrier-phase RTK), in real time and reliably. Calculation (applying the given corrections to the given coordinates, since no separate rover reading is given): X = 500 + (-5) = 495.0 m; Y = 300 + 3.0 = 303.0 m; Z = 200 + (-2.5) = 197.5 m."),
    ("Explain the National Grid projection system of Bhutan. Discuss the role and impact of the scale factor in this system, with examples.", 4,
     [("System: Bhutan National Grid - Transverse Mercator projection on DrukRef03 datum (ITRF2000 epoch 2003, GRS80), central meridian about 90°E, false easting/northing, scale factor at CM; dzongkhag TM grids for cadastral", 2), ("Scale factor role: distortion increases away from CM; combined with elevation factor (large in Bhutan's mountains), grid vs ground differences; example calculation; need to apply CSF in surveys/ setting out", 2)],
     "Bhutan's National Grid is a Transverse Mercator projection based on the national datum DrukRef03 (ITRF2000 at epoch 2003.0, GRS80 ellipsoid), with a central meridian near 90°E through the middle of the country and false easting/northing so all coordinates are positive; separate dzongkhag TM grids with their own central meridians are used for cadastral work to keep distortion small. [Expert: check the exact grid parameters.] Scale factor: on a TM projection the scale is fixed at the central meridian and increases with distance east or west, so grid distances differ slightly from ellipsoid distances. In Bhutan, high elevations add a large elevation factor: at 2500 m the elevation factor is about 1 - 2500/6 371 000 ≈ 0.99961, so a 1000 m ground distance is about 0.39 m shorter on the grid. Ignoring the combined scale factor causes errors of decimetres per kilometre in setting out roads, hydropower tunnels or parcels, so surveyors apply the CSF or use local grids."),
]
for i, (s, mk, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=mk, topic=T, stem=s, key_points=kp, model=mod, issues=(["Check Bhutan National Grid parameters."] if i == 4 else [])))
C1 = """Case I: Modernising Bhutan's GNSS CORS network
Bhutan currently operates 14 GNSS Continuously Operating Reference Stations (CORS) to support geodetic and surveying applications. As lead survey engineer, you are tasked with proposing a national-level project to modernise and expand the GNSS-CORS network to meet growing demand for high-accuracy positioning and geospatial services across the country."""
C2 = """Case II: A high-accuracy geoid model for Bhutan
Accurate height information is crucial for infrastructure development, flood modelling, engineering design and sustainable land management. The current geoid model has accuracy issues of up to 25 cm. As lead geodetic engineer at the National Land Commission Secretariat (NLCS), you are tasked with proposing a comprehensive national project to develop a high-accuracy geoid model tailored to Bhutan's rugged terrain and geodetic infrastructure."""
C3 = """Case III: Large-scale topographic survey of Gelephu Mindfulness City
The government urgently needs a large-scale topographic survey of Gelephu Mindfulness City (GMC), which spans 2000 square kilometres. Requirements and deliverables:
- Detailed topographic data and information at 1:1000 scale.
- Land use and land cover detail.
- Vertical and horizontal accuracy of 0.5 m.
- Contour interval of 1 m.
- The area of interest includes urban areas, agricultural land, dense vegetation and hilly terrain.
- The project must be completed within two months."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("survey2025", 1, T, C1, items=[
    it("""Write the proposal. It should include:
- current limitations of the existing CORS network;
- proposed technical enhancements;
- expansion strategy, including optimal station density and location criteria;
- expected improvements in geodetic reference frame maintenance and real-time and post-processed positioning accuracy;
- applications and benefits in key sectors;
- resource and implementation plan.""", 25,
       [("Current limitations: sparse coverage (long baselines in mountains/ valleys), gaps in east/ north, single-frequency/ GPS-only or ageing receivers, communication/ power reliability, latency, lack of network RTK, data management, monitoring/ maintenance capacity", 4), ("Technical enhancements: multi-GNSS multi-frequency receivers/ antennas (GPS, GLONASS, Galileo, BeiDou), network RTK (VRS/MAC), NTRIP caster, redundant power (solar, UPS) and comms (fibre, 4G, VSAT), monitoring software, PPP-RTK, ITRF ties, IGS-standard monuments", 4), ("Expansion strategy: station spacing ~30-50 km (denser in valleys), coverage of all dzongkhags/ GMC/ hydropower; site criteria - stable bedrock monument, clear sky view, low multipath, power, internet, security, accessibility, geology", 5), ("Expected improvements: maintenance of DrukRef03 and link to latest ITRF, velocity/ deformation monitoring (tectonics), RTK cm accuracy nationwide, post-processed mm, faster surveys", 4), ("Applications: cadastre, infrastructure/ hydropower, construction, GMC, disaster monitoring (earthquake, landslide, GLOF), agriculture, transport, mapping/ drones, science", 4), ("Resource and implementation: phases, budget, staff/ training, partnerships, data policy/ user subscriptions, maintenance, timeline, M&E", 4)],
       """1. Current limitations: 14 stations cannot cover Bhutan's rugged terrain - many areas lie beyond 30-40 km of a station, so single-base RTK accuracy degrades, and deep valleys block signals; uneven distribution with gaps in remote north and east; some receivers are older, GPS-only or limited-frequency; unreliable power and internet links cause data gaps; no full network RTK solution; limited monitoring, data archiving and technical capacity; few users can access services easily.
2. Technical enhancements: replace or upgrade to multi-GNSS (GPS, GLONASS, Galileo, BeiDou), multi-frequency geodetic receivers with choke-ring antennas; build a network RTK system (VRS/MAC/FKP) with a central processing centre and NTRIP caster; provide redundant solar power and UPS, and redundant communication (fibre, 4G, VSAT); integrity monitoring and automatic alerts; long-term archive of RINEX data; regular ties to the latest ITRF and the IGS network; consider PPP-RTK services.
3. Expansion strategy: add stations to reach about 30-50 km spacing (denser around towns, GMC, hydropower and highway corridors); about 30-40 stations nationally depending on terrain. Site criteria: stable monument on bedrock or a solid building, open sky above 10-15° elevation, low multipath and radio interference, reliable power and internet, security, easy access for maintenance, away from landslide-prone slopes, and good geometry with neighbouring stations and cross-border stations.
4. Expected improvements: continuous maintenance of the national reference frame (DrukRef03) and its link to ITRF, with station velocities to monitor tectonic plate motion and deformation (Himalayan seismicity); real-time network RTK of about 1-3 cm horizontal and 3-5 cm vertical nationwide; post-processed static accuracy of millimetres; faster, cheaper surveys without local control.
5. Applications and benefits: cadastral surveys and land records; roads, bridges, hydropower and urban planning (GMC); machine control and construction; drone mapping and GIS; disaster monitoring (earthquakes, landslides, glacial lakes); agriculture and forestry; transport and navigation; scientific research and the geoid model.
6. Resource and implementation plan: phase 1 (year 1) - needs assessment, design, site selection and procurement; phase 2 (years 1-2) - installation, network software, testing; phase 3 - service launch, user registration and training. Resources: budget for equipment, monuments, communications and software (government with development partners), trained geodesists and IT staff, maintenance contracts, a data and pricing policy, and monitoring and evaluation of uptime and accuracy."""),
])
Q += case("survey2025", 2, T, C2, items=[
    it("""Write the proposal. It should cover:
- the need and significance of a local geoid model and its benefits for surveying and national development;
- data requirements and methods of acquisition;
- the methodology for geoid computation and fitting;
- validation and accuracy assessment procedures;
- implementation and applications, including institutional responsibilities and data dissemination.
Justify your approach with reference to Bhutan's topography, CORS network and geodetic capacity.""", 25,
       [("Need/significance: convert GNSS ellipsoidal heights to orthometric (H = h - N), current 25 cm errors too large for engineering/ flood modelling, rugged terrain with large geoid variations, enables GNSS levelling replacing costly levelling", 5), ("Data: terrestrial/ airborne gravity (airborne essential in rugged/ inaccessible terrain), GNSS/levelling benchmarks, high-resolution DEM, global gravity models (EGM2008/ XGM), satellite gravity (GRACE/GOCE), density data, CORS heights", 5), ("Methodology: remove-compute-restore, terrain corrections (RTM), Stokes integration/ LSC, gravimetric geoid, fitting to GNSS/levelling (hybrid geoid) with corrector surface", 5), ("Validation: independent GNSS/levelling checkpoints, statistics (RMS, mean), cross-validation, comparison with global models; target 3-5 cm", 4), ("Implementation/applications: NLCS lead with partners (DGM, universities, international e.g. NGS, Survey of India), training, timeline, budget; dissemination - grid files, online converter, integration with CORS/ RTK software, regular updates; applications - infrastructure, flood/ GLOF, hydropower, mapping", 6)],
       """Need and significance: GNSS gives ellipsoidal heights (h), but engineering, drainage and flood work need orthometric heights (H ≈ h - N, where N is the geoid height). With geoid errors up to 25 cm, GNSS heights cannot replace spirit levelling for roads, canals, hydropower, sewers or flood models. Bhutan's extreme relief (100 m to over 7000 m) causes large, rapid geoid variations that global models (e.g. EGM2008) do not capture well. A local geoid of about 3-5 cm accuracy would allow fast GNSS/CORS heighting anywhere, unify the national height datum, cut survey costs and support GMC, hydropower, disaster risk management and mapping.
Data and acquisition: gravity data - existing ground gravity, new terrestrial gravity along roads, and an airborne gravity survey covering inaccessible mountains (the most practical method for Bhutan's terrain); GNSS/levelling benchmarks (precise levelling lines tied to the national vertical datum, observed with static GNSS from CORS); a high-resolution digital elevation model (e.g. 30 m or better, LiDAR where available) for terrain corrections; satellite gravity models (GRACE/GOCE-based global models such as XGM2019/EGM2008); rock density information; cross-border data sharing.
Methodology: remove-compute-restore - remove the global model and terrain (residual terrain model) effects from gravity anomalies, grid the residuals, compute the residual geoid by Stokes integration (or least-squares collocation / KTH method), and restore the global model and terrain effects to obtain a gravimetric geoid; then fit it to GNSS/levelling points with a corrector surface to produce a hybrid geoid consistent with the national height datum and DrukRef03.
Validation: hold back independent GNSS/levelling checkpoints across different terrain; compare computed and observed N; report mean, standard deviation and RMS (target ≤5 cm, ideally 2-3 cm in populated areas); cross-validation and comparison with global models; peer review by international geodesy experts.
Implementation and applications: NLCS as lead agency with the Department of Geology and Mines, universities and international partners (e.g. US NGS, Survey of India, technical assistance projects); a 2-3 year plan with budget for airborne gravity, gravimeters, levelling and training; build staff capacity in physical geodesy. Dissemination: publish the model as grid files and an online height conversion tool, integrate it into CORS/RTK services and survey software, with documentation and regular updates. Applications: infrastructure and hydropower design, flood and GLOF modelling, drainage and irrigation, mapping, construction at GMC and scientific studies."""),
])
Q += case("survey2025", 3, T, C3, items=[
    it("Formulate a comprehensive project proposal addressing these requirements, explaining your methodology, technical approach, strategic considerations, required resources and project deliverables.", 25,
       [("Methodology choice: airborne LiDAR + high-resolution aerial imagery (or UAV for small areas) given 2000 km², vegetation, 2-month deadline; ground control/ CORS; field survey for gaps", 6), ("Technical approach: planning (flight lines, overlap, point density ≥ 8-10 pts/m², GSD ≤ 10 cm), GCPs/ check points, DrukRef03/ national grid, geoid, processing (classification, DTM/DSM, contours 1 m, orthophotos, feature extraction, LULC classification)", 6), ("Accuracy: QA/QC plan to meet 0.5 m H/V, checkpoints, RMSE reporting", 3), ("Strategic considerations: weather/ monsoon windows, flight permissions, security, phasing/ parallel teams, terrain, vegetation penetration, data volume, stakeholders/ community", 4), ("Resources: aircraft/ LiDAR sensor (contract), GNSS receivers, total stations, drones, software, staff, budget, timeline (Gantt)", 3), ("Deliverables: 1:1000 topo maps, DTM/DSM, contours, orthophotos, LULC map, GIS database, metadata, accuracy report", 3)],
       """Methodology: 2000 km² at 1:1000 within two months, including dense vegetation and hills, cannot be done by ground surveying. Use airborne LiDAR (for terrain under vegetation and 1 m contours) combined with high-resolution aerial photography (for orthophotos, features and land use), supported by GNSS ground control from CORS and targeted ground surveys (total station/RTK) in dense urban or obstructed areas. UAV surveys can supplement small priority sites.
Technical approach: (1) Planning - define AOI blocks, flight lines with 30-60% side overlap, LiDAR density of at least 8-10 points/m² (higher in forest), image GSD of about 5-10 cm, flight height and timing; obtain flight permissions. (2) Ground control - establish GCPs and independent checkpoints by static GNSS/CORS on DrukRef03 and the national grid, with heights converted using the geoid model and tied to benchmarks. (3) Data capture - parallel aircraft or sensors to meet the timeline, flying in dry-season windows. (4) Processing - LiDAR strip adjustment, classification (ground, vegetation, buildings), DTM and DSM generation, 1 m contours; aerial triangulation and true orthophoto mosaics; feature extraction (roads, buildings, rivers, utilities) at 1:1000; land use/land cover classification from imagery (object-based) with field verification. (5) QA/QC - compare with checkpoints, report horizontal and vertical RMSE to show ≤0.5 m accuracy at 95% confidence, edge-matching and topology checks.
Strategic considerations: monsoon cloud and rain (schedule early, have contingency); airspace and security clearances; rugged terrain and access for ground teams; vegetation penetration; managing very large data volumes; phasing priority zones first; coordination with GMC authority, NLCS and communities; possibly contracting an experienced international firm with local partners and knowledge transfer.
Resources: aircraft with LiDAR and medium-format camera (contracted), GNSS receivers, total stations, drones, processing workstations and software (LiDAR and photogrammetry, GIS), field and processing teams, project manager, QA staff, budget and a two-month Gantt chart (week 1 planning and control, weeks 2-5 acquisition, weeks 3-8 processing and delivery in phases).
Deliverables: 1:1000 topographic maps and GIS database, DTM and DSM, 1 m contours, orthophoto mosaics, land use/land cover maps, classified point cloud, control point register, metadata and an accuracy and QA report."""),
])
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions", "type": "short_answer", "count": 5, "marks_each": 4, "answer_any": None},
    {"title": "Section B: Case studies (answer any TWO)", "type": "passage", "count": 3, "marks_each": 25, "answer_any": 2},
]
