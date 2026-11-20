"""ME Technical Paper III (Subject Specialisation Paper), Geographic Information System (GIS), BCSE 2025 - real paper (PDF sent by the founder).
Pattern: Section A Part I 30 MCQ, Part II 4 short answers x 5; Section B one of two case studies (50). 150 min + 15 min reading.
The paper gives no marks for the case-study sub-questions: Case I split 20/15/15 by Claude, Case II is one 50-mark question.
Left out: MCQ 5 and 6 (two options defensible), 14 (wording unclear); three new MCQs keep Part I at 30. MCQ 3 options
retyped (the PDF lettered two options 'a').
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1"
GROUP_TAG = "gis2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "gis"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Geographic Information System (GIS)"

MCQ = r"""[
{
"n": 1,
"stem": "Which spatial analysis technique is used to determine the visibility between two points?",
"opts": [
"Buffer Analysis",
"Viewshed Analysis",
"Network Analysis",
"Overlay Analysis"
]
},
{
"n": 2,
"stem": "What does the \"Fuzzy Logic\" approach in GIS deal with?",
"opts": [
"Precise binary classification",
"Handling Uncertainty in Spatial Data",
"3D Terrain Modelling",
"Network routing optimization"
]
},
{
"n": 3,
"stem": "Which of the following is a key advantage of using remote sensing technology?",
"opts": [
"Ability to gather data from inaccessible areas",
"High cost of implementation",
"Dependency on weather conditions",
""
]
},
{
"n": 4,
"stem": "The integration of Artificial Intelligence (AI) in GIS is most beneficial for",
"opts": [
"Automating map coloring",
"Predictive spatial modeling and pattern recognition",
"Reducing satellite image costs",
"Printing paper maps faster"
]
},
{
"n": 5,
"stem": "The fundamental requirement for integration of GIS datasets produced by different agencies is that",
"opts": [
"The datasets must have compatible accuracy standard",
"The datasets must have compatible coordinate system",
"The datasets must have compatible symbolization standards",
"All of the above"
]
},
{
"n": 6,
"stem": "In remote sensing, the term 'spectral resolution' refer to",
"opts": [
"The width of the electromagnetic spectrum that a sensor can capture",
"The size of the smallest feature that a sensor can detect",
"The number of bands in the electromagnetic spectrum captured by a sensor",
"The ability of a sensor to distinguish between different wavelengths"
]
},
{
"n": 7,
"stem": "Which of the following is a primary application of LIDAR technology?",
"opts": [
"Measuring sea surface temperatures",
"Monitoring atmospheric gases",
"Mapping topography",
"Analyzing land cover changes"
]
},
{
"n": 8,
"stem": "The term \"Digital Twin\" in geospatial science refers to",
"opts": [
"A 3D printed map",
"A virtual replica of a physical environment updated in real-time",
"A high-resolution satellite image",
"A drone-captured topographic model"
]
},
{
"n": 9,
"stem": "The map projection used in DRUKREF03 grid is",
"opts": [
"Polyconic",
"Transverse Mercator",
"Lamberts conformal conic",
"Conic"
]
},
{
"n": 10,
"stem": "Which satellite constellation provides high-temporal-resolution imagery for disaster monitoring?",
"opts": [
"Landsat",
"Planet Scope",
"MODIS",
"Sentinel-1"
]
},
{
"n": 11,
"stem": "In photogrammetry, what is an \"orthophoto\"?",
"opts": [
"A photo with an orthographic projection",
"An aerial photo taken with a drone",
"A photo taken from a satellite",
"A photo corrected for geometric distortions to create a map-like image"
]
},
{
"n": 12,
"stem": "Which band combination helps users identify healthy vegetation?",
"opts": [
"Red, Green, Blue",
"Near infrared, Red, Green",
"Panchromatic",
"Red, Green, Coastal"
]
},
{
"n": 13,
"stem": "Which image classification technique allows the algorithm to define classes during image classification?",
"opts": [
"Deep learning object-based",
"Unsupervised pixel-based",
"Supervised object-based",
"Supervised pixel-based"
]
},
{
"n": 14,
"stem": "Resampling of a raster image",
"opts": [
"Increases the accuracy",
"Increases the precision",
"Decreases data details",
"Increases data details"
]
},
{
"n": 15,
"stem": "The best approach for storing a large quantity of GIS dataset that need to be constantly revised, accessed, manipulated and updated by multiple users would be",
"opts": [
"Shape files",
"Personal Geodatabase",
"Raster files",
"Enterprise Geodatabase"
]
},
{
"n": 16,
"stem": "Which algorithm is commonly used for shortest path analysis in network datasets?",
"opts": [
"Kriging",
"Dijkstra’s Algorithm",
"Moran’s I",
"IDW (Inverse Distance Weighting)"
]
},
{
"n": 17,
"stem": "What is the process of assigning coordinates to the pixel values of an image known as?",
"opts": [
"Digitization",
"Georeferencing",
"Projection",
"Resampling"
]
},
{
"n": 18,
"stem": "Which open-source GIS software is widely used for machine learning-based spatial analysis?",
"opts": [
"QGIS with Python plugins",
"ArcGIS Online",
"Google Earth Pro",
"AutoCAD Map"
]
},
{
"n": 19,
"stem": "Which of the following best describes the concept of 'geocoding'?",
"opts": [
"Collecting geographic coordinates",
"Converting addresses into geographic coordinates",
"Projecting geographic data",
"Creating digital maps"
]
},
{
"n": 20,
"stem": "In disaster management, which GIS operation is typically used for evaluating flood risk areas?",
"opts": [
"Network analysis",
"Overlay analysis",
"Buffer analysis",
"Geostatistical analysis"
]
},
{
"n": 21,
"stem": "Which of the following techniques is commonly used for change detection in remote sensing?",
"opts": [
"Image classification",
"Principal Component Analysis (PCA)",
"Image differencing",
"Spectral unmixing"
]
},
{
"n": 22,
"stem": "Which of the following characteristic of a satellite imagery is most relevant for studying change detection over a period of time",
"opts": [
"Spatial resolution",
"Spectral resolution",
"Temporal resolution",
"All of the above"
]
},
{
"n": 23,
"stem": "What is the role of 'metadata' in geospatial data management?",
"opts": [
"To store the spatial coordinates",
"To describe the content, quality, condition, and other characteristics of data",
"To visualize the spatial data",
"To perform spatial analysis"
]
},
{
"n": 24,
"stem": "Which of the following is true?",
"opts": [
"While the contour map has height information, the DEM provides elevation information",
"Contour map represents height information discretely, while DEM provides it continuously",
"Contour is a raster dataset and DEM is a vector dataset",
"A contour map is more precise than a DEM"
]
},
{
"n": 25,
"stem": "The term \"GeoAI\" refers to:",
"opts": [
"Geographic Artificial Intelligence for spatial problem-solving",
"A new GPS satellite",
"A type of geodatabase",
"A drone mapping technique"
]
},
{
"n": 26,
"stem": "What is the role of blockchain in geospatial data management?",
"opts": [
"Ensuring data immutability and transparency",
"Reducing image resolution",
"Creating 3D maps",
"Replacing GPS systems"
]
},
{
"n": 27,
"stem": "Which emerging technology combines GIS with real-time sensor data for dynamic spatial analysis?",
"opts": [
"IoT-enabled GIS",
"Blockchain GIS",
"Quantum GIS",
"Augmented Reality GIS"
]
},
{
"n": 28,
"stem": "The term \"Spatial Data Infrastructure\" (SDI) refers to:",
"opts": [
"A framework for sharing geospatial data across organizations",
"A type of drone",
"A new map projection",
"A LiDAR sensor"
]
},
{
"n": 29,
"stem": "What is the purpose of \"geofencing\" in location-based services?",
"opts": [
"To create virtual boundaries for triggering alerts",
"To improve satellite resolution",
"To reduce GPS battery usage",
"To encrypt geospatial data"
]
},
{
"n": 30,
"stem": "What is the primary purpose of a \"Topology Rule\" in GIS?",
"opts": [
"To enhance map aesthetics",
"To enforce spatial relationships between features",
"To improve GPS accuracy",
"To compress raster data"
]
}
]"""

KEY = {
    1: ("b", "Viewshed analysis finds what is visible from a point."), 2: ("b", "Fuzzy logic handles uncertainty and gradual class boundaries."),
    3: ("b", "Remote sensing collects data from inaccessible areas."), 4: ("b", "AI helps predictive spatial modelling and pattern recognition."),
    7: ("c", "LiDAR is mainly used to map topography (high-resolution elevation)."), 8: ("b", "A digital twin is a virtual replica updated with real-time data."),
    9: ("b", "DRUKREF03 grid uses a Transverse Mercator projection (Bhutan TM)."), 10: ("b", "PlanetScope's large constellation images most land daily."),
    11: ("d", "An orthophoto is geometrically corrected so it has uniform scale like a map."), 12: ("b", "NIR-Red-Green false colour shows healthy vegetation in red."),
    13: ("b", "Unsupervised classification lets the algorithm form the classes."), 15: ("d", "An enterprise geodatabase supports large, multi-user, versioned editing."),
    16: ("b", "Dijkstra's algorithm finds shortest paths."), 17: ("b", "Georeferencing assigns coordinates to image pixels."), 18: ("a", "QGIS with Python (e.g. scikit-learn plugins) is open source."),
    19: ("b", "Geocoding converts addresses to coordinates."), 20: ("b", "Flood risk combines layers (elevation, slope, land use) by overlay."),
    21: ("c", "Image differencing is a standard change-detection method."), 22: ("c", "Change detection depends on repeat coverage - temporal resolution."),
    23: ("b", "Metadata describes content, quality, condition and other characteristics."), 24: ("b", "Contours are discrete lines; a DEM is a continuous surface."),
    25: ("a", "GeoAI = geographic artificial intelligence."), 26: ("a", "Blockchain gives immutable, transparent records."), 27: ("a", "IoT sensors feed real-time data to GIS."),
    28: ("a", "An SDI is the framework for sharing geospatial data."), 29: ("a", "Geofences are virtual boundaries that trigger alerts."), 30: ("b", "Topology rules enforce spatial relationships (no gaps, overlaps)."),
}
FIX = {3: {"opts": ["Inadequate temporal coverage", "Ability to gather data from inaccessible areas", "High cost of implementation", "Dependency on weather conditions"]}}
T = TOPIC
Q = mcqs(MCQ, KEY, T, FIX) + [
    new_mcq(1, T, "WGS 84 is best described as a", ["map projection", "geodetic datum and reference system", "file format", "satellite sensor"], "b", "WGS 84 is the global geodetic reference system used by GPS."),
    new_mcq(2, T, "In the vector data model, geographic features are represented as", ["pixels in a grid", "points, lines and polygons", "only contour lines", "spectral bands"], "b", "Vector data uses points, lines and polygons."),
    new_mcq(3, T, "The Normalised Difference Vegetation Index (NDVI) is calculated as", ["(Red − NIR)/(Red + NIR)", "(NIR − Red)/(NIR + Red)", "NIR/Red", "(Green − NIR)/(Green + NIR)"], "b", "NDVI = (NIR − Red)/(NIR + Red), from −1 to +1."),
    saq(1, T, """Explain the following terms used in spatial analysis:
a) Kriging (1 mark)
b) Moran's I (1 mark)
c) IDW (Inverse Distance Weighting) (1 mark)
d) Pixel (1 mark)
e) Resolution (1 mark)""",
        [("a) Geostatistical interpolation using spatial autocorrelation (semivariogram), gives prediction and error", 1), ("b) Measure of spatial autocorrelation (clustering vs dispersion), −1 to +1", 1),
         ("c) Interpolation where nearer points get more weight (weight ∝ 1/distanceᵖ)", 1), ("d) Smallest cell of a raster image holding one value", 1), ("e) Level of detail - spatial (cell size), spectral, temporal, radiometric", 1)],
        """a) Kriging: a geostatistical interpolation method that estimates unknown values from nearby samples using a model of spatial autocorrelation (semivariogram); it also gives the prediction error.
b) Moran's I: a statistic measuring spatial autocorrelation - whether similar values cluster (positive, up to +1), are random (≈0) or dispersed (negative).
c) IDW: a deterministic interpolation in which each known point influences the estimate in inverse proportion to its distance (closer points weigh more).
d) Pixel: the smallest cell (picture element) of a raster image, holding one value such as reflectance or a class.
e) Resolution: the level of detail - spatial (ground size of a pixel), spectral (number/width of bands), temporal (revisit time) and radiometric (bit depth)."""),
    saq(2, T, "How do topology rules improve GIS data quality? Explain with a few examples. (5 marks)",
        [("Topology rules define and enforce spatial relationships, find and fix errors, keep data consistent", 2), ("Examples: polygons must not overlap/ have no gaps (land parcels, dzongkhag boundaries); lines must not dangle/ must be connected (road network); points must be on lines; must be covered by", 3)],
        "Topology rules state how features must relate to each other (adjacency, connectivity, containment). Validating them finds errors automatically so they can be fixed, giving clean, consistent data for analysis. Examples: 'Must not overlap' and 'Must not have gaps' for land parcels or gewog boundaries (no double-counted or missing land); 'Must not have dangles' and connectivity rules for road or river networks so routing works; 'Point must be covered by line' for bus stops on roads; 'Boundary must be covered by' so gewogs nest exactly inside dzongkhags."),
    saq(3, T, "A researcher claims NDVI values from two different satellite images (for example Sentinel-2 and Landsat 8) are not directly comparable. Justify the claim. (5 marks)",
        [("Different sensors: band wavelengths/widths (spectral response) differ", 1.5), ("Different spatial resolution (10 m vs 30 m), radiometric calibration and processing levels", 1.5), ("Different acquisition date/time, sun angle, atmosphere; need atmospheric correction and cross-calibration/harmonisation", 2)],
        "The claim is valid. Sentinel-2 MSI and Landsat 8 OLI have different red and near-infrared band centres and widths, so the same surface reflects differently in each; spatial resolution differs (10 m vs 30 m), mixing different land covers in a pixel; radiometric calibration, processing level (top-of-atmosphere vs surface reflectance) and atmospheric correction differ; and acquisition dates, times, sun angles and atmospheric conditions are not the same. NDVI values must be harmonised - surface reflectance, cross-sensor calibration coefficients (e.g. the Harmonized Landsat-Sentinel product) and resampling - before comparison."),
    saq(4, T, "Discuss some of the major challenges and issues of land use and land cover classification using remotely sensed satellite images. Describe and propose solutions to address such issues to generate a reliable land use and land cover map of Bhutan. (5 marks)",
        [("Challenges: cloud cover, rugged terrain shadows, mixed pixels/small fields, spectral confusion between classes, lack of ground truth, seasonal variation", 2.5), ("Solutions: cloud-free composites/radar (Sentinel-1), terrain correction with DEM, higher resolution imagery, object-based/machine learning classification, field data and accuracy assessment, standard classification scheme", 2.5)],
        "Challenges in Bhutan: persistent monsoon cloud; steep terrain causing shadows and illumination differences; small, mixed and fragmented fields producing mixed pixels; spectral confusion (e.g. shrubs vs forest, settlements vs bare land); seasonal changes; and limited ground-truth data. Solutions: multi-date cloud-free composites and radar (Sentinel-1); topographic (illumination) correction with a DEM; higher-resolution imagery and object-based or machine-learning (random forest) classification with ancillary data (DEM, slope); a standard national legend; extensive field data collection; and accuracy assessment (confusion matrix, kappa) with validation by sector agencies."),
]
C1 = """CASE I
The National Land Commission (NLC), in collaboration with the Cabinet Secretariat, is implementing a National Framework for Integrated Land Use and Spatial Planning to harmonise sectoral spatial plans to support Bhutan's 10X Economic Roadmap. As a newly appointed GIS Officer, your role is critical in ensuring cross-sectoral alignment."""
C2 = """CASE II
To enhance health care services in the country, the Ministry of Health (MoH) wants to establish new hospitals or health care centres in the 20 Dzongkhags of Bhutan. However, the Ministry has no idea where the hospitals should be suitably located."""
Q += case("gis2025", 1, T, C1, items=[
    ("1. Technical approach: How would you use GIS and remote sensing to integrate disparate land-use datasets (e.g. forestry, urban, transport) into a unified spatial plan?", 20,
     [("Data inventory, standardisation: common coordinate system (DRUKREF03), scale, classification scheme, metadata", 6), ("Data cleaning, topology, updating with recent satellite imagery/LULC", 5), ("Integration in an enterprise geodatabase; overlay/conflict analysis, suitability analysis", 6), ("Outputs: unified zoning map, scenario analysis", 3)],
     "Inventory all sectoral datasets (forest management units, protected areas, urban plans, roads, mining leases, agricultural land, hydropower) and their metadata. Standardise them: one coordinate system and projection (DRUKREF03 / Bhutan TM), common scale, harmonised land-use classification and attribute schema. Clean and validate geometry with topology rules. Update with recent satellite imagery and a current land use/land cover map, and derive terrain layers from a DEM. Load everything into a central enterprise geodatabase. Use overlay analysis to find overlaps and conflicts, multi-criteria suitability analysis to identify best uses, and scenario modelling for the 10X Roadmap. Produce a unified, version-controlled spatial plan and maps."),
    ("2. Stakeholder coordination: What strategies would you employ to resolve conflicts between sectoral plans (e.g. mining vs conservation areas)?", 15,
     [("Map and quantify conflicts transparently and share with all agencies", 4), ("Inter-agency technical committee/working group under NLC; consultations including local governments and communities", 4), ("Decision rules: legal priorities (protected areas, 60% forest), trade-off and multi-criteria analysis, compensation/mitigation, EIA/SEA", 5), ("Escalate to Cabinet/policy level; document agreements", 2)],
     "Map every conflict area (e.g. mining leases overlapping protected areas or biological corridors) and share it transparently. Convene an inter-agency technical working group under the NLC with sectors, local governments and communities. Apply clear decision rules based on law and policy (Constitution's 60% forest cover, protected-area rules, GNH screening), and use multi-criteria and cost-benefit analysis to compare options, considering alternatives, buffer zones, phased use and mitigation or compensation. Use strategic environmental assessment for major plans. Unresolved issues go to the Cabinet Secretariat for decision, and agreements are recorded in the spatial plan."),
    ("3. Innovative solutions: Propose one digital tool or methodology (e.g. WebGIS, participatory mapping) to improve inter-agency collaboration.", 15,
     [("Tool proposed and described (e.g. national WebGIS / geoportal on the NSDI)", 5), ("How it works: shared layers, role-based editing, metadata, APIs, dashboards, mobile data collection", 6), ("Benefits and needs (training, data policy, security)", 4)],
     "A national WebGIS geoportal built on Bhutan's spatial data infrastructure: each agency publishes and maintains its authoritative layers as web services; users view, overlay and download data in a browser; role-based access allows controlled editing; conflict-detection tools and dashboards show overlaps in real time; mobile apps let field staff and gewogs add data (participatory mapping). Benefits: one source of truth, faster coordination, transparency and less duplication. It needs data-sharing agreements, metadata standards, training and secure hosting."),
])
Q += case("gis2025", 2, T, C2, items=[
    ("As a GIS professional, describe how you would use GIS to do a land suitability analysis to determine the best site for a new health care centre. Describe and explain the necessary steps and the methodology or framework that you would adopt to produce the desired output and guide informed decision-making.", 50,
     [("Define objective and criteria with MoH/experts (population, distance to existing facilities, road access, slope, hazards, land ownership, utilities)", 10), ("Data collection and preparation: population census, health facility locations, roads, DEM, hazard maps, land use, cadastre; common projection, rasterise", 10),
      ("Analysis: network/accessibility analysis (travel time), buffers, constraints (exclusion) layer, reclassify/standardise factors", 10), ("Weighting and combination: AHP/MCDA weighted overlay; suitability map and ranking of sites", 10), ("Validation (field visits, sensitivity analysis), outputs and decision support for each dzongkhag", 10)],
     """1. Define the objective and criteria with the Ministry and experts: serve the most under-served population; criteria such as population density and growth, distance or travel time to existing facilities, road accessibility, slope (< 15-20%), distance from hazards (floodplains, landslide and GLOF zones), land availability/ownership, access to water and electricity, and planning rules.
2. Collect and prepare data: census population (by chiwog), locations of existing hospitals and BHUs, road network, DEM (slope), hazard maps, land use/land cover, cadastral and land-ownership data, utilities. Bring all into one coordinate system (DRUKREF03), clip to each dzongkhag and convert to rasters of the same cell size.
3. Analysis: network analysis to compute travel time to the nearest facility and identify unserved populations; buffers around roads and hazards; build a constraints (exclusion) layer (protected areas, steep slopes, hazard zones, private or religious land); reclassify each factor to a common suitability scale (e.g. 1-5).
4. Weighting and overlay: use multi-criteria decision analysis with the Analytic Hierarchy Process (pairwise comparison with stakeholders, consistency check) to weight factors, then a weighted overlay to produce a suitability map; mask by constraints and rank candidate sites by population served.
5. Validate and decide: field verification of top sites, sensitivity analysis on the weights, location-allocation modelling to test coverage, and present maps, tables and a WebGIS dashboard so MoH can make an informed, transparent decision for each dzongkhag."""),
])
PATTERN = STANDARD
