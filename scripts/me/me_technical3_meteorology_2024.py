"""ME Technical Paper III (Subject Specialisation Paper), Meteorology and Climate Studies, BCSE 2024 - real paper (PDF sent by the founder).
Standard pattern. MCQs 7 and 16 (general knowledge), 13 and 23 (true/false) replaced. Short answers 1 and 2 use the pressure map and box plot.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1"
GROUP_TAG = "met2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "meteorology-hydrology"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Meteorology and Climate Studies"

MCQ = r"""[
{
"n": 1,
"stem": "The primary driving force of the Hadley cell",
"opts": [
"Rotation of the Earth",
"Air pressure variation across latitudes",
"Temperature difference between the equator and poles",
"Coriolis effect"
]
},
{
"n": 2,
"stem": "Adjacent land and water is heated by the sun on a calm day, after a few hours a surface wind develops. What is the direction of the winds?",
"opts": [
"Water to land",
"Land to water",
"Parallel to the land and water",
"Vertically from water to air"
]
},
{
"n": 3,
"stem": "Ozone layer is found in:",
"opts": [
"Troposphere",
"Stratosphere",
"Thermosphere",
"Mesosphere"
]
},
{
"n": 4,
"stem": "The approximate density of air at 15o C is:",
"opts": [
"1 g/cm3",
"0 g/cm3",
"1.225 kg/m3",
"1000kg/m3"
]
},
{
"n": 5,
"stem": "What amount of rainfall can you expect in Bhutan during El Nino year?",
"opts": [
"Normal rainfall",
"Wetter than normal",
"Drier than normal",
"United Nations Convention to Combat Desertification"
]
},
{
"n": 6,
"stem": "The Butterfly Effect can be defined as:",
"opts": [
"Feedback loop in climate change",
"Small change in starting conditions can lead to vastly different outcomes",
"Outcomes are independent of the changes in the starting conditions",
"Study of impact of butterflies"
]
},
{
"n": 7,
"stem": "Speaker of the fourth National Assembly of Bhutan.",
"opts": [
"Lungten Dorji",
"Wangchuk Namgyel",
"Namgyal Dorji",
"Prime Minister"
]
},
{
"n": 8,
"stem": "The formula for volume of a cylinder with given radius (r) and height (h):",
"opts": [
"π r2 h",
"2 π r2 h",
"π r h",
"None of the above"
]
},
{
"n": 9,
"stem": "By 2023, the global average temperature has warmed above the pre-industrial level by:",
"opts": [
"0.5 ° C",
"Less than 0.8 ° C",
"More than 1° C",
"More than 1.5 ° C"
]
},
{
"n": 10,
"stem": "Windward side of a mountain have a wet climate due to:",
"opts": [
"Rising air compresses and warms, causing evaporation of water vapour",
"Rising air compresses and cools, causing condensation of water vapour",
"Rising air expands and warms, causing condensation of water vapour",
"Rising air expands and cools, causing condensation of water vapour"
]
},
{
"n": 11,
"stem": "1 litre of water is equivalent to:",
"opts": [
"1 kg",
"1000 cm3",
"Both (a) and (b)",
"None of the above"
]
},
{
"n": 12,
"stem": "What is true about dew point?",
"opts": [
"Temperature of air at constant pressure to achieve 100% relative humidity",
"Temperature of water when relative humidity is 100%",
"Temperature of air at constant pressure when air is dry",
"Temperature when dew is formed"
]
},
{
"n": 13,
"stem": "Temperature increases with altitude in stratosphere and thermosphere, true or false:",
"opts": [
"True",
"False",
"",
""
]
},
{
"n": 14,
"stem": "Which weather is likely indicated by rapidly falling air pressure?",
"opts": [
"Skies are clearing",
"Storm approaching",
"Temperature is decreasing",
"Humidity is decreasing"
]
},
{
"n": 15,
"stem": "Convert 100 ° F (Fahrenheit) to ° C (Celsius)",
"opts": [
"36.7 ° C",
"37 ° C",
"37.7 ° C",
"38 ° C"
]
},
{
"n": 16,
"stem": "Bhutan Broadcasting Service Television is now aired in?",
"opts": [
"Standard definition (SD)",
"High definition (HD)",
"4K",
"8K"
]
},
{
"n": 17,
"stem": "Average temperature of a large city is warmer than the surrounding forest area, which phenomena describes this?",
"opts": [
"Urban heat island effect",
"Urban heating effect",
"Climate change",
"Cooling due to evaporation"
]
},
{
"n": 18,
"stem": "Intertropical Convergence Zone (ITCZ) is associated with:",
"opts": [
"Hurricanes",
"Drought",
"Calm weather",
"Heavy rainfall"
]
},
{
"n": 19,
"stem": "Surface winds blow around a high pressure system in the Northern Hemisphere, the direction of:",
"opts": [
"Clockwise and outward",
"Clockwise and inward",
"Anti-clockwise and outward",
"Anti-clockwise and inward"
]
},
{
"n": 20,
"stem": "Wind is caused by?",
"opts": [
"Fronts",
"Horizontal pressure difference",
"Rotation of the earth",
"Surface friction"
]
},
{
"n": 21,
"stem": "The radiation of the sun heats:",
"opts": [
"Air in the troposphere",
"Thermosphere which heats the other layers till the troposphere",
"Troposphere directly on a clear sky",
"Surface of earth which heats air in troposphere"
]
},
{
"n": 22,
"stem": "1 knot in km/hr is approximately:",
"opts": [
"1.5",
"1.8",
"2.1",
"2.4"
]
},
{
"n": 23,
"stem": "Weather near a large water body tend to be warmer in summer and colder in winter than the surrounding land area?",
"opts": [
"True",
"False",
"",
""
]
},
{
"n": 24,
"stem": "Oscillation of sea surface temperature",
"opts": [
"Intertropical convergence zone",
"Indian Ocean Dipole",
"Madden–Julian oscillation",
"None of the above"
]
},
{
"n": 25,
"stem": "What is the best method for finding the average annual precipitation of a catchment?",
"opts": [
"Thiessen’s mean method",
"Arithmetic method",
"Isohyetal method",
"Simple mean method"
]
},
{
"n": 26,
"stem": "The intensity of a cyclone decreases after land fall due to:",
"opts": [
"Friction due to obstruction at land",
"Cut off of moisture",
"Decrease in wind speed",
"Decrease in temperature on land"
]
},
{
"n": 27,
"stem": "Where are you likely to find strong winds close to the ground?",
"opts": [
"Centre of a low pressure system",
"Periphery of a high pressure system",
"In the transition zone between two air masses",
"Where the pressure difference is less"
]
},
{
"n": 28,
"stem": "Additional hazard to aircraft taking off or landing in or near thunderstorm:",
"opts": [
"Turbulence",
"Wind shear",
"Reduced speed",
"Compass error"
]
},
{
"n": 29,
"stem": "Which form of precipitation is most likely to fall, from clouds containing only water, in mid- latitudes?",
"opts": [
"Drizzle",
"Hail",
"Moderate rain with large drops",
"Heavy rain with large drops"
]
},
{
"n": 30,
"stem": "Which of the aviation weather charts can a pilot most find easily find a jet stream?",
"opts": [
"Wind/temperature chart",
"Significant weather chart",
"Surface chart",
"Meteorological Aerodrome Reports (METAR)"
]
}
]"""

KEY = {
    1: ("c", "The Hadley cell is driven by the temperature difference (differential heating) between the warm equator and cooler higher latitudes: warm air rises at the equator and sinks near 30°."),
    2: ("a", "On a sunny calm day the land heats faster, air rises over it and cooler air flows from water to land (sea breeze)."),
    3: ("b", "The ozone layer lies in the stratosphere (about 15-35 km)."),
    4: ("c", "Standard sea-level air density at 15 °C is 1.225 kg/m³."),
    5: ("c", "El Niño years usually weaken the South Asian monsoon, so Bhutan tends to be drier than normal."),
    6: ("b", "The butterfly effect: a small change in initial conditions can lead to very different outcomes (chaos theory)."),
    8: ("a", "Volume of a cylinder = πr²h."),
    9: ("c", "By 2023 the world had warmed about 1.1-1.45 °C above pre-industrial levels - more than 1 °C (but the long-term average is not yet above 1.5 °C)."),
    10: ("d", "Rising air expands and cools adiabatically; water vapour condenses, giving cloud and rain on the windward side."),
    11: ("c", "1 litre of water = 1000 cm³ and has a mass of about 1 kg."),
    12: ("a", "Dew point is the temperature to which air must be cooled at constant pressure (and moisture) to become saturated (100% RH)."),
    14: ("b", "Rapidly falling pressure indicates an approaching low-pressure system or storm."),
    15: ("c", "°C = (100 - 32) x 5/9 = 37.8 °C, closest to 37.7 °C."),
    17: ("a", "A city warmer than its surroundings is the urban heat island effect."),
    18: ("d", "The ITCZ is a belt of rising air, deep convection and heavy rainfall."),
    19: ("a", "In the Northern Hemisphere, surface winds blow clockwise and outward around a high."),
    20: ("b", "Wind is caused by horizontal pressure differences (pressure gradient force)."),
    21: ("d", "Sunlight mainly heats the Earth's surface, which then heats the air of the troposphere from below."),
    22: ("b", "1 knot = 1 nautical mile per hour = 1.852 km/h ≈ 1.8."),
    24: ("b", "The Indian Ocean Dipole is an oscillation of sea surface temperature between the western and eastern Indian Ocean."),
    25: ("c", "The isohyetal method, using lines of equal rainfall, gives the most accurate catchment average, especially in hilly areas."),
    26: ("b", "Over land a cyclone is cut off from its moisture (latent heat) supply, so it weakens (friction also helps)."),
    27: ("c", "Strong surface winds occur where the pressure gradient is steep, as in frontal zones between air masses; the centre of a low is fairly calm."),
    28: ("b", "Wind shear (sudden changes in wind speed or direction, microbursts) is the main extra hazard on take-off and landing near thunderstorms."),
    29: ("a", "Shallow warm (all-water) clouds such as stratus give drizzle."),
    30: ("a", "Upper-level wind/ temperature charts show the jet stream most easily."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "Which instrument measures relative humidity using wet-bulb and dry-bulb thermometers?", ["Psychrometer", "Anemometer", "Barometer", "Pyranometer"], "a",
            "A psychrometer compares dry-bulb and wet-bulb temperatures to give humidity; an anemometer measures wind, a pyranometer solar radiation."),
    new_mcq(2, T, "Which cloud type is most associated with thunderstorms, lightning and hail?", ["Cirrus", "Stratus", "Cumulonimbus", "Altostratus"], "c",
            "Cumulonimbus clouds are tall convective clouds producing thunder, lightning, heavy showers and hail."),
    new_mcq(3, T, "The average environmental lapse rate in the troposphere is about:", ["2.0 °C per km", "6.5 °C per km", "9.8 °C per km", "15 °C per km"], "b",
            "Temperature falls by about 6.5 °C per km on average; 9.8 °C/km is the dry adiabatic lapse rate."),
    new_mcq(4, T, "Bhutan receives most of its annual rainfall from the south-west monsoon during:", ["December to February", "March to May", "June to September", "October to November"], "c",
            "The south-west monsoon (June-September) brings most of Bhutan's rainfall."),
    saq(1, T, "The map shows sea level air pressure in millibars for an eastern coast of North America. Points A, B, C and D are sea-level locations on the Earth's surface. Which location would have recorded the highest wind speed? What would be the approximate air pressure at point D?",
        [("Highest wind speed at B - isobars most closely spaced there (steepest pressure gradient)", 2.5),
         ("Point D lies between the 1008 and 1012 mb isobars - approximately 1010 mb", 2.5)],
        """Highest wind speed: location B. Wind speed depends on the pressure gradient - the closer the isobars, the steeper the gradient and the stronger the wind. Around B the isobars are packed most closely (between the 1024 mb isobar and the low centred near C), while A lies in the middle of a high-pressure area with widely spaced isobars, C is near the calm centre of the low (996 mb), and D has wider spacing.
Pressure at D: D lies between the 1008 mb and 1012 mb isobars, so the pressure there is approximately 1010 mb (about 1009-1011 mb).""", image="/papers/me/tech3-met-2024-pressure-map.png"),
    saq(2, T, "Find the median, first and third quartile, interquartile range and range from the box plot.",
        [("Median = 31 (line inside the box)", 1), ("First quartile Q1 = 27, third quartile Q3 = 33 (edges of the box)", 2),
         ("Interquartile range = 33 - 27 = 6", 1), ("Range = maximum - minimum = 34 - 24 = 10", 1)],
        """Reading the box plot: minimum (left whisker end) = 24, first quartile Q1 (left edge of box) = 27, median (line inside the box) = 31, third quartile Q3 (right edge of box) = 33, maximum (right whisker end) = 34.
Median = 31
First quartile Q1 = 27; third quartile Q3 = 33
Interquartile range = Q3 - Q1 = 33 - 27 = 6
Range = maximum - minimum = 34 - 24 = 10""", image="/papers/me/tech3-met-2024-boxplot.png"),
    saq(3, T, "Explain the different stages of a hydrological cycle.",
        [("Evaporation (from oceans, lakes, soil) and transpiration (plants) - evapotranspiration; sublimation from snow/ ice", 1.5),
         ("Condensation into clouds (cooling of rising air, dew point, condensation nuclei); transport by winds (advection)", 1), ("Precipitation - rain, snow, hail, drizzle", 1),
         ("Interception, infiltration/ percolation to groundwater, surface runoff and streamflow back to oceans; storage in glaciers, lakes, aquifers", 1.5)],
        """The hydrological (water) cycle is the continuous movement of water between the oceans, atmosphere and land, driven by solar energy and gravity:
1. Evaporation and transpiration: the sun heats oceans, lakes, rivers and moist soil, turning water into water vapour; plants release water vapour through their leaves (transpiration) - together, evapotranspiration. Snow and ice can also sublimate directly into vapour.
2. Transport and condensation: winds carry the moist air; as it rises it expands and cools to its dew point, and the vapour condenses on tiny particles (condensation nuclei) to form clouds and fog.
3. Precipitation: when cloud droplets or ice crystals grow heavy enough they fall as rain, drizzle, snow, sleet or hail.
4. Interception, infiltration and percolation: some precipitation is caught by vegetation; some soaks into the soil (infiltration) and moves down to recharge groundwater (percolation), later feeding springs and rivers as baseflow.
5. Runoff and storage: the rest flows over the surface into streams and rivers (runoff) and back to the oceans; water may be stored for long periods in glaciers, snow, lakes, aquifers and oceans before the cycle repeats."""),
    saq(4, T, "Briefly describe the different meteorological observations and types of data collected.",
        [("Surface observations (manual and automatic weather stations): temperature (max/ min), rainfall, humidity, pressure, wind speed/ direction, sunshine/ solar radiation, cloud, visibility, present weather, soil temperature, evaporation", 2),
         ("Upper-air observations: radiosondes/ pilot balloons - temperature, humidity, pressure, wind profiles; aircraft reports (AMDAR)", 1),
         ("Remote sensing: weather radar (precipitation, storms), satellites (cloud imagery, SST, winds, moisture), lightning detection; hydrological (river level, discharge); aviation METAR/ SYNOP codes; climate records", 2)],
        """Meteorological observations are made in several ways:
1. Surface observations at manual and automatic weather stations (synoptic, agro-meteorological and climate stations, airports): air temperature (including maximum and minimum), rainfall and snowfall, relative humidity (dew point), atmospheric pressure, wind speed and direction, sunshine duration and solar radiation, cloud amount and type, visibility, present weather (fog, thunder, hail), soil temperature and evaporation. Data are reported in codes such as SYNOP and, at airports, METAR.
2. Upper-air observations: radiosondes carried by balloons measure vertical profiles of temperature, humidity, pressure and wind; pilot balloons give winds; aircraft automatically report temperature and winds (AMDAR).
3. Remote sensing: weather radar detects precipitation intensity and movement of storms; meteorological satellites provide cloud images, sea surface temperature, atmospheric moisture, winds and snow cover; lightning detection networks locate thunderstorms.
4. Related hydrological and marine observations: river water level and discharge, glacier and lake monitoring, ocean buoys.
These data are used for weather forecasting, warnings, aviation, agriculture, hydropower and climate studies."""),
]
C1 = """Case I
Weather forecasting is a challenging and complex problem owing to the chaotic nature of the atmosphere. Weather forecasting is the prediction of the weather by the application of principles of physics and the use of a number of empirical and statistical methods. Prediction of the future is made based on the initial conditions of the current state of the atmosphere and projecting into the future using physical laws and the understanding of atmospheric processes. In the context of weather forecasting, answer the following questions."""
C2 = """Case II
Climate change is widespread, rapid and intensifying according to the Intergovernmental Panel on Climate Change (IPCC). Climate change is projected to increase the temperature and the global water cycle. One of the main impacts of climate change is the rise of extreme weather events like heavy rainfall and severe floods. Bhutan is also highly vulnerable to the impacts of climate change due to its geographical location and fragile mountain ecosystem. In the light of the increase in extreme weather events, answer the following questions."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("met2024", 1, T, C1, items=[
    it("1. What are weather models and how are they used for forecasting? Suggest ways to improve weather forecasting accuracy. What kind of data is used in weather models?", 15,
       [("Weather (NWP) models: computer programs solving equations of atmospheric physics (motion, thermodynamics, continuity, moisture) on a 3-D grid; global (GFS, ECMWF) and regional/ limited-area (WRF) models", 4),
        ("Use: data assimilation gives initial state, model integrates forward in time steps, outputs (rain, temperature, wind) interpreted by forecasters; ensemble forecasts for uncertainty, downscaling, post-processing", 4),
        ("Improve accuracy: more and better observations (AWS, radar, upper air), better data assimilation, higher resolution, better physics/ parameterisation (convection, terrain), ensembles, supercomputing, AI/ ML, verification, local calibration, forecaster training", 4),
        ("Data: surface stations, radiosondes, aircraft, satellites (radiances, cloud winds), radar, ships/ buoys, topography, land use, SST, soil moisture", 3)],
       """Weather models (numerical weather prediction, NWP, models) are computer programs that represent the atmosphere on a three-dimensional grid and solve the physical equations that govern it - conservation of momentum (motion), mass (continuity), energy (thermodynamics) and moisture - together with parameterisations of processes too small for the grid (clouds and convection, radiation, boundary layer, land surface). There are global models (e.g. ECMWF IFS, NOAA GFS) and regional or limited-area models (e.g. WRF) run at higher resolution for a country like Bhutan.
How they are used: observations are combined with a previous forecast through data assimilation to produce the best estimate of the current state (initial conditions); the model then steps forward in time to predict future values of pressure, wind, temperature, humidity and rainfall at every grid point. Because the atmosphere is chaotic, ensembles of slightly different runs are used to give probabilities and uncertainty. Forecasters interpret and post-process model output, downscale it for local terrain and issue forecasts and warnings.
Improving accuracy: denser and better observations (automatic weather stations, radiosondes, weather radar, satellite data, especially in mountainous and data-poor areas such as Bhutan); improved data assimilation; higher model resolution to represent complex terrain; better physics (convection, microphysics, orography); ensemble and probabilistic forecasting; more computing power; use of AI/machine learning; bias correction and local calibration; regular forecast verification; and training of forecasters.
Data used: surface observations (pressure, temperature, humidity, wind, rainfall), upper-air radiosonde and pilot balloon data, aircraft reports, satellite radiances, cloud-motion winds and sea surface temperature, radar reflectivity, ship and buoy data, and static data such as topography, land use, soil moisture and snow cover."""),
    it("2. A flash flood occurred in Dechencholing, Thimphu on 10 August 2024. Investigation revealed that the flood was triggered by heavy rainfall caused by a convective thunderstorm. Describe what a convective thunderstorm is. What conditions make convective storms likely? What are the tools used to help detect convective thunderstorms?", 15,
       [("Convective thunderstorm: storm from strong vertical rising of warm, moist, unstable air forming cumulonimbus cloud; stages cumulus (updraft), mature (updraft + downdraft, heavy rain, lightning, hail), dissipating; localised, short, intense rainfall", 5),
        ("Conditions: moisture (monsoon), atmospheric instability (warm humid surface, cooler air aloft, high CAPE), lifting mechanism (surface heating in afternoon, orographic lift on mountain slopes, fronts, convergence), weak wind shear for slow-moving storms", 5),
        ("Detection tools: Doppler weather radar, satellites (IR/ visible imagery, cloud-top cooling), lightning detection networks, AWS and rain gauges, radiosondes/ instability indices (CAPE, K index), NWP models, nowcasting systems, cameras/ public reports", 5)],
       """A convective thunderstorm is a storm produced by strong vertical (convective) motion of warm, moist, unstable air. As the air rises it cools and its moisture condenses, releasing latent heat that makes it rise further, building a tall cumulonimbus cloud that produces thunder, lightning, very heavy short-duration rain, gusty winds and sometimes hail. It develops in three stages: the cumulus stage (updrafts dominate), the mature stage (strong updrafts and downdrafts, heaviest rain, lightning and hail) and the dissipating stage (downdrafts cut off the warm inflow). Such storms are localised and can drop large amounts of rain on a small catchment within an hour, causing flash floods like the one in Dechencholing.
Conditions that make convective storms likely: (1) plenty of moisture in the lower atmosphere - as during the monsoon; (2) atmospheric instability - warm, humid air near the surface under cooler air aloft (high convective available potential energy, CAPE); (3) a lifting mechanism - strong daytime heating of the ground (afternoon and evening storms), orographic lifting as air is forced up mountain slopes, convergence zones or fronts; and (4) slow storm movement (weak steering winds), so rain falls on the same place for a long time.
Tools used to detect them: Doppler weather radar (precipitation intensity, storm movement, rotation); meteorological satellites (rapidly cooling, high cloud tops in infrared imagery, cloud growth); lightning detection networks; automatic weather stations and rain gauges reporting rainfall intensity in real time; radiosonde soundings and instability indices (CAPE, lifted index, K index); high-resolution NWP models; nowcasting systems; and webcams and public reports."""),
    it("3. What is nowcasting? What tools are used for nowcasting?", 10,
       [("Nowcasting: detailed description of current weather and forecast for the next 0-6 hours (mainly 0-2 h) by extrapolating observed systems; for severe, local, fast-changing weather - thunderstorms, heavy rain, flash floods, fog, wind; warnings", 4),
        ("Tools: weather radar (reflectivity, Doppler velocity, extrapolation), satellite imagery (rapid scan), lightning detection, AWS/ rain gauges real-time, high-resolution rapid-update NWP, nowcasting software (e.g. SWIRLS, TITAN, pySTEPS), cameras, forecaster expertise, communication channels (SMS, apps)", 6)],
       """Nowcasting is the detailed description of the current weather together with forecasts for the very short range - from the present up to about 6 hours ahead (mostly 0-2 hours). It relies mainly on the latest observations and extrapolation of the movement and development of weather systems, and is used for rapidly developing, local, high-impact weather such as thunderstorms, heavy rainfall and flash floods, hail, strong winds, lightning and fog, so that warnings can be issued quickly (e.g. for aviation, roads, disaster management and the public).
Tools: weather radar (reflectivity and Doppler winds, with extrapolation of storm tracks); geostationary satellite imagery with rapid-scan updates (cloud growth, cloud-top temperature); lightning detection networks; real-time automatic weather stations and rain gauges; rapid-update, high-resolution numerical models blended with observations; nowcasting software systems (e.g. SWIRLS, TITAN, pySTEPS) that track and project storms; webcams and spotter reports; and the experience of forecasters, together with fast communication channels (SMS, apps, sirens, media) to deliver warnings."""),
    it("4. What are the impacts of El Niño-Southern Oscillation (ENSO) and the Indian Ocean Dipole (IOD) on rainfall of Bhutan?", 10,
       [("ENSO: El Niño (warm central/ eastern Pacific) weakens Walker circulation and South Asian monsoon - generally below-normal monsoon rainfall/ drier, higher temperatures in Bhutan, drought/ water stress, forest fires; La Niña - generally normal/ above-normal rainfall, floods/ landslides", 5),
        ("IOD: positive IOD (warmer western Indian Ocean) tends to enhance monsoon rainfall and can offset El Niño; negative IOD tends to reduce rainfall; combined phases matter; relationship not uniform - local topography, use in seasonal forecasts", 5)],
       """ENSO: during El Niño, waters in the central and eastern Pacific are unusually warm, the Walker circulation shifts and the South Asian summer monsoon tends to weaken. Bhutan therefore usually receives below-normal monsoon rainfall, with delayed onset, longer dry spells, higher temperatures, reduced river flows (affecting hydropower and irrigation), water shortages and a higher risk of forest fires and crop loss. During La Niña the monsoon tends to be stronger, so Bhutan often receives normal to above-normal rainfall, with more risk of floods, flash floods and landslides.
IOD: a positive IOD (warmer western Indian Ocean, cooler east) generally strengthens monsoon rainfall over South Asia and can partly cancel the drying effect of El Niño; a negative IOD tends to reduce monsoon rainfall and can worsen an El Niño drought.
The combined phases of ENSO and IOD, together with Bhutan's complex topography and local factors, determine the actual rainfall, so the relationship is not the same every year. NCHM uses ENSO and IOD forecasts in seasonal outlooks to help agriculture, hydropower and disaster management prepare."""),
])
Q += case("met2024", 2, T, C2, items=[
    it("1. What is an Early Warning System? Suggest how the early warning system can work efficiently during an extreme weather event.", 10,
       [("EWS: integrated system of hazard monitoring, forecasting, risk assessment, communication and preparedness that enables timely action to reduce harm (UNDRR); four elements - risk knowledge, monitoring and warning, dissemination/ communication, response capability", 4),
        ("Efficient working: accurate, timely impact-based forecasts; dense monitoring network (AWS, radar, river sensors); clear standard operating procedures and roles (NCHM, DDM, dzongkhags); multi-channel last-mile dissemination (sirens, SMS, media, apps, community focal persons, in local language); community awareness, drills, evacuation plans/ shelters; feedback and review; redundancy (power, communication)", 6)],
       """An Early Warning System (EWS) is an integrated system of hazard monitoring, forecasting and prediction, disaster risk assessment, communication and preparedness activities that enables individuals, communities, governments and businesses to take timely action to reduce disaster risk before a hazardous event (UNDRR definition). It has four key elements: (1) disaster risk knowledge, (2) detection, monitoring, analysis and forecasting, (3) warning dissemination and communication, and (4) preparedness and response capabilities.
For it to work efficiently during an extreme weather event: maintain a dense, reliable monitoring network (automatic weather stations, rain gauges, weather radar, river-level and GLOF sensors) with backup power and communication; produce accurate, timely and impact-based forecasts that say what the weather will do (e.g. which roads or villages may flood); have clear standard operating procedures and responsibilities linking NCHM, the Department of Disaster Management, dzongkhag and gewog disaster committees, police and other agencies; disseminate warnings quickly through many channels - sirens, SMS and cell broadcast, radio, TV, social media, apps and community focal persons - in simple language and Dzongkha; make sure the warning reaches the "last mile" including remote and vulnerable people; prepare communities through awareness, drills, evacuation routes and shelters; and review each event to improve the system."""),
    it("2. Write a short note on flood forecasting. The 'Early Warnings for All' initiative of the World Meteorological Organization aims to ensure that everyone on Earth is protected from hazardous weather, water or climate events through life-saving early warning systems by the end of 2027. What do you think are some challenges to this initiative?", 15,
       [("Flood forecasting: predicting timing, magnitude, location of floods using rainfall forecasts, real-time rainfall and river level/ discharge observations and hydrological/ hydraulic models (rainfall-runoff, routing), thresholds; lead time short for flash floods; GLOF monitoring; Bhutan - NCHM flood warning centre, hydro-met stations, sirens on Punatsangchhu/ Mangdechhu", 7),
        ("Challenges: gaps in observing networks especially in mountains/ LDCs, funding and sustainability, technical capacity/ trained staff, data sharing across borders/ transboundary rivers, last-mile communication (remote areas, connectivity, languages, power), short lead times of flash floods, coordination among agencies, public trust/ awareness and response, maintenance, climate change increasing extremes", 8)],
       """Flood forecasting is the prediction of when, where and how severe a flood will be, so that warnings can be issued in advance. It combines rainfall forecasts from weather models and radar/satellite estimates, real-time observations of rainfall and river water levels and discharge, and hydrological (rainfall-runoff) and hydraulic (flood routing and inundation) models, with warning thresholds for each river point. Lead time is usually hours to days for large rivers but very short (minutes to a few hours) for flash floods in small mountain catchments, which require rainfall-based warnings. In Bhutan, NCHM operates hydro-meteorological stations, a flood warning section and GLOF early warning systems with sensors and sirens along rivers such as the Punatsangchhu, Mangdechhu and Chamkharchhu.
Challenges to "Early Warnings for All" by 2027: (1) large gaps in observation networks, especially in mountainous, small and least developed countries; (2) limited funding and difficulty sustaining and maintaining equipment; (3) shortage of trained forecasters, hydrologists and technicians; (4) limited data sharing and cooperation on transboundary rivers; (5) reaching the "last mile" - remote communities without mobile coverage, electricity or internet, and people who speak different languages or have disabilities; (6) very short lead times of flash floods and landslides; (7) weak coordination among meteorological, disaster management and local agencies; (8) turning warnings into action - public awareness, trust and preparedness; and (9) climate change increasing the frequency and intensity of extremes, so the system must keep improving."""),
    it("3. Climate projections are simulations of Earth's climate for future decades based on assumed 'scenarios' for the concentrations of greenhouse gases, aerosols and other atmospheric constituents. Global Climate Models help in understanding the Earth's climate in the future. How does one use climate projections that run hundreds of years into the future?", 10,
       [("Nature: projections are not forecasts of specific weather/ years - conditional on scenarios (SSPs/ RCPs), give long-term trends and ranges; use multi-model ensembles and multiple scenarios; 30-year averages/ change relative to baseline", 4),
        ("Use: downscale (statistical/ dynamical, CORDEX) to local scale, bias-correct; assess impacts on water, glaciers, agriculture, hydropower, health; inform adaptation plans (NAP, NDC), infrastructure design standards, risk assessment, policy for mitigation; update as new models", 6)],
       """Climate projections are not predictions of the weather on a particular day or year; they show how the climate (long-term averages and the frequency of extremes) is likely to change under different assumed futures of greenhouse gas and aerosol emissions (scenarios such as the Shared Socioeconomic Pathways, SSP1-2.6 to SSP5-8.5). They are therefore used as "what if" information:
- Use many models (multi-model ensembles) and several scenarios to show the range of possible futures and the uncertainty, and look at changes in 20-30-year averages relative to a baseline period (e.g. 1981-2010) rather than single years.
- Downscale the coarse global model output to local or regional scale (statistical downscaling or regional climate models, e.g. CORDEX South Asia) and bias-correct it against observed data, because Bhutan's mountains are not resolved by global models.
- Feed the projected temperature and rainfall into impact models for water resources, glaciers and GLOF risk, agriculture, forests, hydropower, health and disasters.
- Use the results to plan adaptation (National Adaptation Plan), set design standards for long-lived infrastructure such as dams, bridges and drainage, guide land use and disaster risk reduction, and support mitigation policy (NDCs) by showing the benefit of lower-emission pathways.
- Update plans as newer models and observations become available, using projections as guidance for robust, flexible decisions rather than exact numbers."""),
    it("4. What are the long term impacts of climate change and how should countries like Bhutan prepare for the changing climate?", 15,
       [("Long-term impacts: rising temperatures, glacier retreat and GLOF risk, changed rainfall (more intense, erratic, longer dry spells), floods, flash floods, landslides, droughts/ water shortage (drying springs), forest fires, pests, biodiversity shifts (species moving upslope), agriculture and food security, hydropower generation, health (vector-borne disease), infrastructure damage, economy and livelihoods", 7),
        ("Preparation: strengthen hydro-met services and EWS, climate-resilient infrastructure and building codes, water management (spring-shed protection, storage, rainwater harvesting), climate-smart agriculture, forest and watershed conservation, GLOF risk reduction, disaster preparedness, diversified economy/ energy, research and data, integrate climate into plans (NAP, NDC), international finance and cooperation, awareness and capacity building; continue carbon neutrality/ mitigation", 8)],
       """Long-term impacts of climate change: rising temperatures, especially at high altitudes; retreat and loss of glaciers, growth of glacial lakes and higher GLOF risk; changes in rainfall - more intense downpours but also longer dry spells and erratic monsoons - leading to more floods, flash floods and landslides as well as droughts, drying springs and water shortages; more forest fires, pests and diseases; shifts of species and ecosystems upslope and loss of biodiversity; reduced crop yields and food security problems for farmers; variability in river flows affecting hydropower, the main source of national revenue; health risks such as vector-borne diseases spreading to higher areas and heat stress; damage to roads, bridges and settlements; and wider economic and livelihood losses.
How Bhutan should prepare: strengthen hydro-meteorological services, observation networks and multi-hazard early warning systems (including GLOF and flash-flood warnings); build climate-resilient infrastructure with updated design standards and risk-informed land-use planning; manage water carefully - protect spring-sheds and watersheds, build storage and rainwater harvesting, improve irrigation efficiency; promote climate-smart agriculture (drought-tolerant varieties, diversification, irrigation, crop insurance); conserve and sustainably manage forests and biodiversity; reduce GLOF risk through lake lowering, monitoring and hazard zoning; strengthen disaster preparedness at all levels; diversify the economy and energy sources (solar, wind) to reduce dependence on hydropower; invest in research, data and climate projections; mainstream climate change into national and local plans (NAP, NDC, Five-Year Plans); seek climate finance and international cooperation; raise public awareness and build capacity; and continue to stay carbon neutral to contribute to global mitigation."""),
])
PATTERN = STANDARD
