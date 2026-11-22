"""ME Technical Paper III (Subject Specialisation Paper), Survey Engineering, BCSE 2024 - real paper (PDF sent by the founder).
Fitted to the 2025 Survey Engineering layout (the latest paper): Part II short answers are 4 marks each (5 in 2024; the 2024
paper asked any 4 of 6), Section B any 2 of 3 cases x 25. MCQ 1 replaced (the name of Bhutan's latest geoid model could not
be confirmed). REPEAT: Case 1 (Gelephu Mindfulness City topographic survey, 1:1000) is the same as 2025 Case III, so it is
not loaded again; the year 2024 is recorded on the 2025 question (question_appearances).
MCQs 4, 7 and 19 are 2025 MCQs (MCQ 7 with slightly different options), so they are not loaded again either (year 2024 recorded on the 2025 questions:
supabase/data/me_technical3_repeats_2024_batch7.sql).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1"
GROUP_TAG = "survey2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "survey-engineering"
ADDS_TO_PAPER = True  # 2025 is the latest Survey Engineering paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Survey Engineering"

MCQ = r"""[
{
"n": 1,
"stem": "The latest national vertical geodetic datum realized through ground gravimetric observation of Bhutan is defined as …..",
"opts": [
"DrukGeoid2000",
"DrukGeoid2010",
"DrukGeoid2015",
"DrukGeoid2020"
]
},
{
"n": 2,
"stem": "One degree of latitude is approximately ….. kilometers.",
"opts": [
"111",
"222",
"333",
"444"
]
},
{
"n": 3,
"stem": "The distance value of one degree of longitude varies depending on the latitude. The distance decreases as you move towards the poles, following the…….",
"opts": [
"Cosine of the latitude",
"Cosine of the longitude",
"Sine of the latitude",
"Sine of the longitude"
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
"stem": "In RTK surveying, what is the significance of ambiguity resolution?",
"opts": [
"It determines the base station location.",
"It calculates the initial position of the rover.",
"It resolves the integer number of wavelengths between the satellite and receiver.",
"It corrects for clock errors in the GPS system."
]
},
{
"n": 6,
"stem": "Why is a dual-frequency receiver preferred over a single-frequency receiver in RTK surveying?",
"opts": [
"It is less expensive.",
"It can mitigate ionospheric errors more effectively.",
"It requires fewer satellites for a fix.",
"It provides faster processing speeds"
]
},
{
"n": 7,
"stem": "In which portion of the electromagnetic spectrum do GPS signals operate?",
"opts": [
"Infrared",
"Visible light",
"Microwave",
"Ultraviolet"
]
},
{
"n": 8,
"stem": "Which statement is true regarding the L5 GPS frequency (1176.45 MHz)?",
"opts": [
"It has been in use since the inception of GPS.",
"It is primarily used for nuclear detonation detection.",
"It was introduced as part of the GPS modernization effort for high-precision and safety-of- life applications.",
"It is the primary frequency used by civilian GPS devices."
]
},
{
"n": 9,
"stem": "What is the primary difference between GPS and GNSS?",
"opts": [
"GPS is a global system, while GNSS is a regional system.",
"GNSS includes multiple satellite systems, while GPS is one specific system.",
"GPS is used for navigation, while GNSS is used for surveying.",
"GNSS is more accurate than GPS."
]
},
{
"n": 10,
"stem": "What does the term \"multipath\" refer to in GPS surveying?",
"opts": [
"Using multiple satellites for positioning",
"Errors caused by GPS signals reflecting off surfaces before reaching the receiver",
"Using multiple receivers to improve accuracy",
"Interference from multiple GPS signals"
]
},
{
"n": 11,
"stem": "Datum transformation require transformation parameters that define the mathematical relationship between the old and new datums. What are the transformation parameters?",
"opts": [
"Translations",
"Rotations",
"Scale factor",
"All above"
]
},
{
"n": 12,
"stem": "What is the value of latitude of origin for the National Grid projection of Bhutan ‘DrukRef 03’?",
"opts": [
"0°",
"90°",
"180°",
"360°"
]
},
{
"n": 13,
"stem": "For a map of 1:5000, what is the plottable error of the map?",
"opts": [
"1.25 m",
"2 m",
"3.5 m",
"4 m"
]
},
{
"n": 14,
"stem": "The total station machine has the horizontal accuracy specification as 2 mm + 2 ppm. What would be the maximum potential error when the horizontal distance measured is 5 km?",
"opts": [
"±10 mm",
"±11 mm",
"±12 mm",
"±13 mm"
]
},
{
"n": 15,
"stem": "The precision total station machine has the horizontal accuracy specification as 1 mm + 1 ppm. What is distance dependent error when horizontal distance measured is 5 km?",
"opts": [
"±1 mm",
"±1.5 mm",
"±3 mm",
"±5 mm"
]
},
{
"n": 16,
"stem": "In surveying, which method involves determining the location of a point by measuring distances from known points rather than angles?",
"opts": [
"Trilateration",
"Triangulation",
"Rectification",
"Refracting"
]
},
{
"n": 17,
"stem": "In GPS, which Dilution of Precision (DOP) represents the geometric quality of the satellite constellation specifically in determining the horizontal position (latitude and longitude)?",
"opts": [
"PDOP",
"HDOP",
"VDOP",
"TDOP"
]
},
{
"n": 18,
"stem": "What is the key difference between triangulation and trilateration in surveying?",
"opts": [
"Triangulation uses distance measurements from known points, while trilateration uses angle measurements.",
"Triangulation uses angle measurements from known points, while trilateration uses distance measurements.",
"Triangulation forms circles from known points, while trilateration forms triangles.",
"Triangulation is used only in 2D surveying, while trilateration is used only in 3D surveying."
]
},
{
"n": 19,
"stem": "What is the main cause of systematic errors in surveying?",
"opts": [
"Random fluctuations in measurements",
"Instrumental imperfections or environmental factors",
"Human mistakes during data recording",
"Variations in the gravitational field"
]
},
{
"n": 20,
"stem": "Which method is commonly used to minimize random errors in surveying?",
"opts": [
"Using more advanced equipment",
"Repeating measurements multiple times",
"Calibrating instruments before each use",
"Adjusting data based on known error patterns"
]
},
{
"n": 21,
"stem": "What is the purpose of a \"closing error\" adjustment in a traverse?",
"opts": [
"To calibrate the surveying instruments",
"To compensate for angular errors only",
"To ensure the sum of angles in a polygon equals the theoretical value",
"To determine the accurate lengths of traverse lines"
]
},
{
"n": 22,
"stem": "What is the process of aligning geographic data to a known coordinate system called?",
"opts": [
"Spatial analysis",
"Geocoding",
"Georeferencing",
"Remote Sensing"
]
},
{
"n": 23,
"stem": "What does high precision in measurements indicate?",
"opts": [
"Measurements are spread out over a large range",
"Measurements are consistently close to each other",
"Measurements are always accurate",
"Measurements are taken quickly"
]
},
{
"n": 24,
"stem": "What is the main function of a theodolite?",
"opts": [
"Measuring vertical distances",
"Measuring horizontal and vertical angles",
"Measuring atmospheric pressure",
"Measuring time intervals"
]
},
{
"n": 25,
"stem": "How does NTRIP enhance GNSS-RTK performance?",
"opts": [
"By reducing the need for a base station",
"By providing real-time correction data via the internet, extending the range beyond traditional radio communication",
"By eliminating the need for satellite signals",
"By increasing the battery life of GNSS receivers"
]
},
{
"n": 26,
"stem": "Which frequency band is commonly used for radio communication in GNSS-RTK?",
"opts": [
"VHF (Very High Frequency)",
"UHF (Ultra High Frequency)",
"SHF (Super High Frequency)",
"EHF (Extremely High Frequency)"
]
},
{
"n": 27,
"stem": "What is the primary principle behind Electronic Distance Measurement (EDM) in total stations?",
"opts": [
"Measurement of angles using optical instruments",
"Calculation of distances based on the travel time of electromagnetic waves",
"Determination of positions using satellite signals",
"Measurement of elevations using laser beams"
]
},
{
"n": 28,
"stem": "What is a common source of error in EDM measurements?",
"opts": [
"Magnetic declination",
"Atmospheric conditions affecting wave propagation",
"Inaccurate angle measurement",
"Incorrect calibration of the optical scope"
]
},
{
"n": 29,
"stem": "How does EDM in a total station typically deal with the curvature of the Earth?",
"opts": [
"By using high-frequency waves that are unaffected by curvature",
"By applying a curvature correction factor to the measured distance",
"By measuring only very short distances",
"By aligning the total station with the Earth's magnetic field"
]
},
{
"n": 30,
"stem": "The unique identifier or primary key that is used to link cadastral data to Thram data is",
"opts": [
"Plot ID",
"Thram number",
"Plot area",
"CID"
]
}
]"""

KEY = {
    2: ("a", "One degree of latitude is about 111 km (the meridian arc is nearly constant)."),
    3: ("a", "Length of 1° of longitude ≈ 111.32 km x cos(latitude), so it shrinks towards the poles."),
    5: ("c", "Ambiguity resolution finds the unknown integer number of carrier wavelengths between satellite and receiver, giving centimetre accuracy (a 'fixed' solution)."),
    6: ("b", "Two frequencies let the receiver estimate and remove the ionospheric delay, and help faster, more reliable ambiguity fixing."),
    8: ("c", "L5 was added in GPS modernisation (first on Block IIF satellites, 2010) for safety-of-life and high-precision use."),
    9: ("b", "GNSS is the general term for all satellite navigation systems (GPS, GLONASS, Galileo, BeiDou ...); GPS is one of them."),
    10: ("b", "Multipath is the error from signals reflected by buildings, water or ground before reaching the antenna."),
    11: ("d", "A 7-parameter (Helmert) transformation uses three translations, three rotations and one scale factor."),
    12: ("a", "Bhutan's national grid (DrukRef 03, Transverse Mercator) uses the equator, 0°, as latitude of origin."),
    13: ("a", "Plottable error ≈ 0.25 mm x 5000 = 1.25 m."),
    14: ("c", "2 mm + 2 ppm x 5 km = 2 mm + 10 mm = ±12 mm."),
    15: ("d", "Distance-dependent part only: 1 ppm x 5 km = 5 mm."),
    16: ("a", "Trilateration fixes points from measured distances (sides) of triangles."),
    17: ("b", "HDOP is the dilution of precision for the horizontal position."),
    18: ("b", "Triangulation measures angles from known points; trilateration measures distances."),
    20: ("b", "Random errors are reduced by repeating measurements and taking the mean."),
    21: ("c", "Angular closing error is adjusted so the sum of the angles of the closed polygon equals its theoretical value, (n-2) x 180° for interior angles."),
    22: ("c", "Georeferencing assigns map coordinates to data (e.g. a scanned map or image) in a known coordinate system."),
    23: ("b", "Precision means repeated measurements agree closely with each other (not necessarily with the true value)."),
    24: ("b", "A theodolite measures horizontal and vertical angles."),
    25: ("b", "NTRIP streams corrections over the internet (mobile data), so the rover is not limited by radio range."),
    26: ("b", "RTK radio modems usually work in the UHF band (about 400-470 MHz)."),
    27: ("b", "EDM measures the travel time or phase shift of an electromagnetic (infrared/laser) signal to the reflector."),
    28: ("b", "Temperature, pressure and humidity change the speed of the wave, so an atmospheric correction (ppm) is applied."),
    29: ("b", "The total station applies earth-curvature (and refraction) corrections to long distances and heights."),
    30: ("a", "The unique Plot ID links each cadastral parcel to its Thram (land record)."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "A geoid model is used in GNSS heighting mainly to", ["Convert ellipsoidal heights to orthometric (mean sea level) heights", "Convert latitude to longitude", "Remove multipath errors", "Calculate the scale factor of the projection"], "a",
            "GNSS gives ellipsoidal height h; orthometric height H = h - N, where N (geoid undulation) comes from the geoid model."),
]

SA = [
    ("Describe the relationship between satellite image resolution and the scale of mapping. How would you choose the appropriate resolution for a mapping project focused on urban planning at a scale of 1:10,000? Justify your choice with examples.",
     [("Relationship: finer ground resolution (GSD) supports larger map scale; rule of thumb pixel ≈ 0.1-0.2 mm at map scale (or map accuracy ≈ 2-3 x GSD); detail visible depends on resolution", 2),
      ("1:10 000: 0.25 mm x 10 000 = 2.5 m plottable; choose about 0.5-1 m imagery (e.g. Pleiades 0.5 m, WorldView 0.3-0.5 m) to identify buildings, roads, plots; coarser (Sentinel-2 10 m) only for land cover; consider cost, cloud, date, stereo for heights", 2)],
     "Image resolution (ground sample distance, GSD) decides the smallest feature that can be seen and mapped, so it limits the largest scale that can be mapped: the finer the resolution, the larger the possible scale. A common rule is that the pixel size should be about 0.1-0.2 mm at map scale, or that achievable map accuracy is about 2-3 times the GSD. For an urban-planning map at 1:10 000 the plottable error is 0.25 mm x 10 000 = 2.5 m, so imagery of about 0.5-1 m resolution is appropriate: it shows individual buildings, roads, footpaths, drains and plot boundaries clearly, e.g. Pleiades (0.5 m), WorldView-3 (0.3 m) or aerial/drone orthophotos. Coarser imagery such as Sentinel-2 (10 m) or Landsat (30 m) suits only regional land-cover mapping, while very fine imagery (5-10 cm drone) is more costly than needed at this scale. The choice also considers cost, recent acquisition date, cloud cover, stereo availability for heights, and ground control for accurate georeferencing."),
    ("During a detailed topographic survey with a drone, you need to determine the flying height for capturing images with a resolution of 10 cm per pixel. The camera has a pixel size of 5.6 micrometres (0.0056 cm) and a focal length of 18 mm (1.8 cm). Explain the steps and find the flying height.",
     [("GSD = pixel size x H / f, so H = GSD x f / pixel size; use consistent units", 2),
      ("H = 10 cm x 1.8 cm / 0.0056 cm = 3214 cm ≈ 32.1 m above ground; plan above-ground height, overlap, terrain", 2)],
     "Ground sample distance (GSD) relates to flying height by similar triangles: GSD / pixel size = H / f, so H = GSD x f / pixel size. Steps: (1) write the required GSD, pixel size and focal length in the same units (10 cm, 0.0056 cm, 1.8 cm); (2) substitute: H = 10 x 1.8 / 0.0056 = 3214.3 cm; (3) convert: H ≈ 32.1 m above the ground. The drone should fly about 32 m above ground level (with terrain following in hilly areas, since height above ground changes with the terrain), with about 70-80% forward and 60-70% side overlap and ground control points for accuracy."),
    ("In a GNSS-based survey you must determine precise coordinates using Differential GPS (DGPS). Describe the process of DGPS and its advantages over standard GPS. The base station coordinates are known (X: 500,000 m, Y: 300,000 m, Z: 200,000 m) and the rover receives correction values from the base station (ΔX: -2.5 m, ΔY: 3.0 m, ΔZ: -1.5 m). Calculate the corrected coordinates for the rover.",
     [("Process: base on known point compares known and computed positions, sends corrections (radio/ NTRIP) or post-processing; rover applies; common errors cancel", 1.5),
      ("Advantages: removes satellite clock/orbit and atmospheric errors, metre to sub-metre/cm accuracy, real time", 1),
      ("Calculation (applying the corrections to the given coordinates): X = 499 997.5 m, Y = 300 003.0 m, Z = 199 998.5 m", 1.5)],
     "In DGPS a base receiver is set up on a point with known coordinates and tracks the same satellites as the rover at the same time. The difference between its known position and the position it computes (or between true and measured ranges) gives corrections for errors common to both receivers: satellite orbit and clock errors and ionospheric and tropospheric delays. The corrections are sent to the rover by radio or internet (NTRIP) in real time, or applied later by post-processing, and the rover applies them to its own observations. Advantages over standalone GPS: accuracy improves from several metres to sub-metre (code DGPS) or centimetres (carrier-phase RTK), reliably and in real time. Calculation (the question gives only the corrections, so they are applied to the given coordinates): X = 500 000 + (-2.5) = 499 997.5 m; Y = 300 000 + 3.0 = 300 003.0 m; Z = 200 000 + (-1.5) = 199 998.5 m."),
    ("You are conducting a topographic survey using a total station. Describe the process of measuring distances and angles with a total station and explain how to correct the measured slope distance to a horizontal distance. The measured slope distance is 500 m, the vertical angle is 5° and the instrument and target heights are equal. Calculate the horizontal distance.",
     [("Process: set up, centre and level over station, orient/ backsight to known point, set heights, prism constant, atmospheric ppm; EDM measures slope distance, encoders measure horizontal and vertical angles; record/ compute coordinates", 2),
      ("Correction: HD = SD x cos(vertical angle) (or SD x sin(zenith angle)); HD = 500 x cos 5° = 498.10 m; equal heights so no height correction", 2)],
     "Process: the total station is set up over the station point, centred (optical/laser plummet) and levelled; instrument and target (prism) heights, prism constant and atmospheric correction (temperature, pressure) are entered; it is oriented by sighting a backsight point of known coordinates. For each target, the EDM measures the slope distance by the phase shift or travel time of an infrared/laser signal, and the electronic encoders read the horizontal and vertical (or zenith) angles; the instrument stores the readings and can compute coordinates and heights. Slope to horizontal: the horizontal distance is the slope distance times the cosine of the vertical angle (or the sine of the zenith angle): HD = SD cos α. Because the instrument and target heights are equal, no height correction is needed. HD = 500 x cos 5° = 500 x 0.99619 = 498.10 m (vertical difference = 500 sin 5° = 43.58 m)."),
    ("Explain what differential levelling is and how it is carried out, and how instrument and target heights are handled. A backsight (BS) on a benchmark of known elevation 100 m reads 2.50 m and the foresight (FS) on the new point reads 1.75 m. Calculate the elevation of the new point.",
     [("Differential levelling: finds height difference between points with a level and staff; BS on known point, FS on unknown; line of collimation horizontal; change points for long distances; equal BS/FS distances cancel collimation and curvature errors", 2),
      ("HI = 100 + 2.50 = 102.50 m; RL = 102.50 - 1.75 = 100.75 m (rise 0.75 m)", 2)],
     "Differential levelling determines the difference in elevation between two or more points using a level and a levelling staff. The level gives a horizontal line of sight. A backsight is taken on a point of known elevation (benchmark) to find the height of instrument (HI = RL of BM + BS), and a foresight on the new point gives its reduced level (RL = HI - FS). Over long distances or steep ground, change points are used and the process repeated, with the line closed back on a known benchmark to check. Keeping backsight and foresight distances equal cancels collimation, curvature and refraction errors; the staff must be vertical and the instrument height itself does not appear, because the height of instrument is found from the benchmark. Calculation: HI = 100.00 + 2.50 = 102.50 m; elevation of new point = 102.50 - 1.75 = 100.75 m (a rise of 0.75 m)."),
    ("Explain what a scale factor is and its significance in surveying. Describe how a grid distance is converted to a ground distance and explain geoid separation. Given: grid distance 1200 m, scale factor 0.9996, geoid separation -25 m. Calculate the true ground distance and explain the height difference due to geoid separation.",
     [("Scale factor: ratio of grid (projection) distance to ellipsoid distance; combined with elevation factor (CSF); needed so total station and GNSS/ map distances agree", 1.5),
      ("Ground = grid / scale factor = 1200 / 0.9996 = 1200.48 m", 1),
      ("Geoid separation N = height of geoid above ellipsoid; H = h - N; N = -25 m: orthometric heights are 25 m greater than ellipsoidal heights at this point", 1.5)],
     "A scale factor is the ratio of a distance on the map projection (grid) to the corresponding distance on the ellipsoid; multiplied by the elevation factor it gives the combined scale factor relating grid and ground distances. It matters because GNSS and maps work in grid coordinates while tapes and total stations measure ground distances, so ignoring it causes errors of centimetres to decimetres per kilometre in setting out. Grid to ground: ground distance = grid distance / scale factor (ideally the combined scale factor). Here: 1200 / 0.9996 = 1200.48 m, i.e. the ground distance is 0.48 m longer than the grid distance. Geoid separation (undulation) N is the height of the geoid above the ellipsoid; orthometric (mean sea level) height H = ellipsoidal height h - N. With N = -25 m the geoid lies 25 m below the ellipsoid, so H = h + 25 m: heights above sea level are 25 m greater than the GNSS ellipsoidal heights at this point."),
]
for i, (s, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=4, topic=T, stem=s + " (4 marks; 5 marks in the 2024 paper)", key_points=kp, model=mod, issues=[]))

C2 = """Case: A high-precision geodetic network for a new urban centre
You lead a geodetic team establishing a high-precision geodetic network for a new urban centre that will develop rapidly. It must support new transport routes, utility installations and high-rise buildings. Requirements:
- A geodetic control network with horizontal accuracy of ±2 cm and vertical accuracy of ±1 cm.
- The network must cover 20 square kilometres.
- Integration with existing national geodetic frameworks.
- The project must be completed within 10 months."""
C3 = """Case: National road infrastructure mapping
Accurate and up-to-date road network data is essential for transport planning, disaster management and suitability analysis, and Bhutan lacks precise, current spatial road data. As a surveying professional, you must prepare a project proposal to map roads across the whole country:
- Area of interest: whole country.
- Estimated road length: 12,000 km.
- Road categories based on material, use and location.
- Timeline: 6 months.
- Required accuracy: 10 cm horizontal and 1 m vertical."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("survey2024", 1, T, C2, items=[
    it("1. Which surveying methods, techniques and instruments will you use to achieve the required accuracy?", 8,
       [("Network design: primary monuments (e.g. 15-25 forced-centring pillars/ deep monuments) well distributed, intervisible pairs, stable ground, redundancy", 2),
        ("Horizontal: static GNSS (dual-frequency geodetic receivers, long sessions 2-6 h, multiple sessions, CORS ties), processed with precise ephemerides, least-squares adjustment; total station densification", 3),
        ("Vertical ±1 cm: precise (first-order) digital levelling with invar staffs from national benchmarks, double-run, closure limits (e.g. 4√K mm); GNSS heights with geoid only as check", 3)],
       """Network design: about 15-25 permanent monuments (concrete pillars with forced-centring plates or deep-set marks) spread over the 20 km², on stable ground away from planned construction, with intervisible pairs for total-station users and good sky view for GNSS, forming well-shaped figures with redundant observations. Horizontal control (±2 cm): static GNSS with dual/multi-frequency geodetic receivers, observing sessions of 2-6 hours, at least two independent occupations per station, connected to nearby national CORS/control; processed with precise orbits, fixed ambiguities and a minimally-constrained then constrained least-squares network adjustment, with error ellipses checked. Lower-order points densified by total-station traverses (1" instruments, forced centring). Vertical control (±1 cm): GNSS heights are not accurate enough, so precise (first-order) levelling with digital levels and invar bar-coded staffs from national benchmarks, double-run (forward and back) with closure limits such as 4√K mm (K in km); GNSS/geoid heights used only as an independent check. Calibration of all instruments before field work."""),
    it("2. How will you integrate the new network with the existing national geodetic framework?", 5,
       [("Connect to national CORS and DrukRef03 control/ benchmarks; observe ties to several existing points; check their stability", 2),
        ("Adjust in national datum (DrukRef03/ ITRF epoch), compute transformation parameters if needed, national grid coordinates and scale factors; heights to national vertical datum/ geoid", 2),
        ("Metadata, documentation, submit to NLCS for approval and inclusion in national database", 1)],
       """The network will be tied to the national framework maintained by NLCS: GNSS sessions will include the nearest CORS and at least three or four existing national control points, whose stability will first be checked. The adjustment will be done in the national datum (DrukRef03, ITRF-based, at its reference epoch), so coordinates are compatible; if the existing local survey works use another datum, transformation parameters (7-parameter or grid-based) will be computed and published. Coordinates will be given on the national grid (with combined scale factors for local users), and heights on the national vertical datum by levelling from national benchmarks, with geoid separations recorded. All station descriptions, sketches, photographs, coordinates and accuracy reports will be documented and submitted to NLCS for approval and inclusion in the national geodetic database, so that all agencies and contractors use the same control."""),
    it("3. Give the project timeline and management plan for the 10 months.", 6,
       [("Phased timeline: month 1 planning, reconnaissance, design, procurement; months 2-3 monumentation; months 4-6 GNSS and levelling observations; months 7-8 processing, adjustment, QC; month 9 documentation, database; month 10 handover, training", 3),
        ("Management: team structure, roles, budget, equipment, coordination with city authority/ NLCS, progress monitoring (Gantt, milestones), risk register, reporting", 3)],
       """Timeline: Month 1 - planning, reconnaissance, network design, permissions, procurement and instrument calibration. Months 2-3 - construction of monuments and allowing them to settle. Months 4-6 - static GNSS campaigns and precise levelling (before the monsoon where possible). Months 7-8 - data processing, least-squares adjustment, quality control and any re-observation. Month 9 - computation of final coordinates, scale factors, documentation and geodatabase. Month 10 - handover, user training and final report. Management: a project manager with a geodetic engineer, GNSS team, levelling team, data processing and GIS staff; a budget for staff, equipment, vehicles and monuments; coordination with NLCS, the city development authority and land owners; a Gantt chart with milestones, weekly progress reports and a risk register; and quality checkpoints at the end of each phase."""),
    it("4. What challenges do you expect and how will you mitigate them?", 6,
       [("Challenges: weather/ monsoon, terrain/ access, obstructions and multipath, monument disturbance by construction, ionosphere, equipment failure, staff, land access", 3),
        ("Mitigation: schedule dry season, site selection and protection, redundancy, longer sessions, spare equipment, coordination with developers, documentation and re-observation plan, community awareness", 3)],
       """Challenges: monsoon rain and cloud delaying field work; rugged terrain and limited access; trees, buildings and slopes causing GNSS obstruction and multipath; monuments being destroyed or disturbed by the rapid construction; ionospheric activity; equipment failure; staff shortage; and land-owner objections. Mitigation: schedule observations in the dry season with buffer time; choose open, stable, protected sites (public land, away from construction corridors) with reference marks and protective covers; observe longer and repeated GNSS sessions with redundancy and good DOP; keep spare receivers and batteries; coordinate with developers and the city authority so marks are protected, with legal notices; train staff and use clear procedures; and keep a quality-control and re-observation plan so any weak station is re-measured before handover."""),
])
Q += case("survey2024", 2, T, C3, items=[
    it("1. Outline efficient methods and techniques for acquiring and processing the road data.", 7,
       [("Mobile mapping system (vehicle-mounted LiDAR + cameras + GNSS/IMU) on motorable roads; achieves cm-level horizontal accuracy with GNSS/CORS and control points", 3),
        ("Supplement: drone photogrammetry/ LiDAR for difficult sections, high-resolution satellite imagery for farm roads, GNSS-RTK for checks; processing: trajectory with CORS, point-cloud classification, feature extraction (centreline, edges, bridges), attributes", 3),
        ("Plan teams by region and season to cover 12,000 km in 6 months", 1)],
       """The most efficient method for 12 000 km in six months is a vehicle-mounted mobile mapping system: LiDAR scanners and 360° cameras with dual-frequency GNSS and an inertial unit (IMU), driven along the roads, collecting point clouds and imagery at traffic speed. Trajectories are processed against the national CORS network and checked with surveyed ground control points every few kilometres, which gives about 5-10 cm horizontal and better than 1 m vertical accuracy. Sections that vehicles cannot drive (farm roads, washed-out roads) are mapped by drone photogrammetry or LiDAR, or digitised from recent high-resolution satellite imagery with RTK checks. Processing: GNSS/IMU trajectory adjustment, point-cloud classification, automatic and manual extraction of the centreline, edges, width, bridges, culverts and retaining walls, and attributing each segment (surface material, class, ownership, name, location). Several teams (e.g. one per region) work in parallel, scheduled around the monsoon."""),
    it("2. Describe the quality control and checks you will use to ensure accuracy and reliability.", 5,
       [("Accuracy checks: independent GNSS-RTK check points along routes, RMSE vs 10 cm/ 1 m spec, overlap/ repeat runs comparison, trajectory quality reports", 2),
        ("Data checks: topology (connectivity, no gaps/ overlaps), attribute completeness and validity (domains), standards, review by second operator, field verification sample, documentation/ metadata", 3)],
       """Positional checks: independent check points surveyed by GNSS-RTK along each route (not used in processing); root-mean-square errors computed and compared with the 10 cm horizontal and 1 m vertical requirements; repeated runs and overlapping sections compared; and GNSS/IMU trajectory quality reports reviewed so weak segments (tunnels, forest) are re-driven or controlled. Data checks: topology rules (roads connected at junctions, no gaps, overlaps or dangles), attribute completeness and allowed values (domains for road class and surface), naming and coding standards, a second operator reviewing a sample of each block, and field verification of a random sample. All checks are recorded in quality reports and metadata, and data are accepted only when they pass."""),
    it("3. Explain how you will build a reliable geodatabase to store and manage the road network.", 5,
       [("Data model/ schema: feature classes (centreline, edges, bridges, culverts, junctions), attributes and domains, unique road IDs, linear referencing (chainage), national datum/ grid", 3),
        ("Platform: enterprise geodatabase (e.g. PostGIS/ ArcGIS), topology rules, metadata standards, versioning, access rights, backups, web services", 2)],
       """A national road data model will be agreed with the Department of Surface Transport and NLCS: feature classes for road centrelines, edges, bridges, culverts, tunnels and junctions; attributes such as unique road ID, name, class (national highway, dzongkhag, thromde, farm road), surface material, width, number of lanes, ownership, condition and date; domains and subtypes to keep values consistent; and linear referencing (chainage) so events like landslides or repairs can be located. Data will be stored in an enterprise geodatabase (e.g. PostgreSQL/PostGIS or ArcGIS Enterprise) in the national datum and grid, with topology rules, metadata to national standards, versioning and edit tracking, user access rights, regular backups, and web map/feature services so agencies can view and use the data."""),
    it("4. How will you integrate and use existing road data to enhance the project?", 4,
       [("Collect existing data (DoST road inventory, NLCS topographic maps, OpenStreetMap, dzongkhag data, imagery), assess quality and coverage", 2),
        ("Use for planning routes, attributes (names, class), gap filling; conflate/ update with new accurate geometry; keep IDs; avoid duplication", 2)],
       """Existing data - the road inventory of the Department of Surface Transport, NLCS topographic maps and databases, dzongkhag and thromde road layers, OpenStreetMap and recent imagery - will be collected and assessed for accuracy, currency and coverage. They will be used to plan survey routes and team logistics, to supply attributes that mobile mapping cannot capture (official road names, classes, ownership, construction year), and to fill gaps for roads that cannot be surveyed in time. Their geometry will be replaced by, or conflated with, the new accurate survey, keeping existing road IDs where possible so other systems still link, and avoiding duplicate features."""),
    it("5. Provide a framework for the long-term maintenance and updating of the road network data.", 4,
       [("Custodian agency and data-sharing policy; update procedures: new road construction submitted as-built surveys in standard format; periodic imagery/ mobile mapping updates", 2),
        ("Capacity building, budget, standards, version control, feedback from users, integration with national SDI/ geoportal", 2)],
       """A custodian (for example the Department of Surface Transport with NLCS) will be named, with a data-sharing policy under the national spatial data infrastructure. Every new or upgraded road will have to submit as-built survey data in the agreed format before completion certificates are issued, and the database will be updated continuously from these, with periodic checks from new satellite imagery or repeat mobile mapping (e.g. every 3-5 years). Staff will be trained, a recurrent budget provided, standards and versioning maintained, users given a channel to report errors, and the data published on the national geoportal so it stays used and therefore maintained."""),
])
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions", "type": "short_answer", "count": 5, "marks_each": 4, "answer_any": None},
    {"title": "Section B: Case studies (answer any TWO)", "type": "passage", "count": 3, "marks_each": 25, "answer_any": 2},
]
