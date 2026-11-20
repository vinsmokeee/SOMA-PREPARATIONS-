"""ME Technical Paper III (Subject Specialisation Paper), Electronics and Communication Engineering, BCSE 2025 - real paper (PDF sent by the founder).
Pattern: Section A Part I 30 MCQ, Part II 4 short answers x 5; Section B one of two case studies (50). 150 min + 15 min reading.
The paper gives no marks for case sub-questions: split 20/15/15 by Claude. MCQ 3, 15 and 18 had formulas as pictures - retyped.
Left out: MCQ 1 (two options defensible), 7 and 8 (MATLAB wording allows two answers); three new MCQs keep Part I at 30.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Electronics and Communication Engineering): BCSE 2025, batch 1"
GROUP_TAG = "ece2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "electronics-communication-engineering"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Electronics and Communication Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Electronics and Communication Engineering"

MCQ = r"""[
{
"n": 1,
"stem": "The forbidden energy gap in semiconductors depends on:",
"opts": [
"Temperature",
"Doping concentration",
"Applied voltage",
"Crystal structure"
]
},
{
"n": 2,
"stem": "A Zener diode is primarily used as:",
"opts": [
"A rectifier",
"A voltage regulator",
"An amplifier",
"A switch"
]
},
{
"n": 3,
"stem": "The current gain (β) of a BJT in common-emitter mode is given by:",
"opts": [
"b)",
"",
"d)",
""
]
},
{
"n": 4,
"stem": "In a JFET, the drain current is controlled by:",
"opts": [
"Gate voltage",
"Drain voltage",
"Source voltage",
"Channel resistance"
]
},
{
"n": 5,
"stem": "The ripple factor of a full-wave rectifier is:",
"opts": [
"0.482",
"1.21",
"0.236",
"1.11"
]
},
{
"n": 6,
"stem": "AM demodulation is done using:",
"opts": [
"Envelope detector",
"Phase-locked loop (PLL)",
"Frequency discriminator",
"Schmitt trigger"
]
},
{
"n": 7,
"stem": "Given a signal x = [1, 2, 1, 0], what is the correct way to compute its 2-sided FFT in MATLAB?",
"opts": [
"x = fft (x)",
"x = fft (x, 4)",
"x = abs (fft (x))",
"x = fftshift(fft(x))"
]
},
{
"n": 8,
"stem": "To design a 4th-order Butterworth bandpass filter with passband 100=300 Hz (fs = 1000 Hz), which code is correct?",
"opts": [
"[b, a] = butter(4, [100 300]/1000, 'bandpass');",
"[b, a] = butter(2, [100 300]/500, 'bandpass');",
"[b, a] = butter(4, [100 300]/500, 'bandpass');",
"[b, a] = butter(4, [100 300], 'bandpass');"
]
},
{
"n": 9,
"stem": "In PCM, quantization noise can be reduced by:",
"opts": [
"Increasing the sampling rate",
"Increasing the number of bits",
"Decreasing bandwidth",
"Using companding"
]
},
{
"n": 10,
"stem": "Which digital modulation scheme is most bandwidth-efficient?",
"opts": [
"ASK",
"FSK",
"PSK",
"QAM"
]
},
{
"n": 11,
"stem": "Which MATLAB code snippet is correct to design a low-pass FIR filter with cutoff frequency = 500 Hz, sampling rate = 2000 Hz, order = 20.",
"opts": [
"h = fir1(20, 500/(2000/2), 'low');",
"h = fir1(20, 500/2000, 'high');",
"h = fir1(20, 500, 'low');",
"h = fir1(20, [500], 'low');"
]
},
{
"n": 12,
"stem": "A JK flip-flop in toggle mode occurs when:",
"opts": [
"J=0, K=0",
"J=1, K=1",
"J=1, K=0",
"J=0, K=1"
]
},
{
"n": 13,
"stem": "The number of flip-flops needed for a MOD-10 counter is:",
"opts": [
"2",
"3",
"4",
"5"
]
},
{
"n": 14,
"stem": "Which logic family has the lowest power dissipation?",
"opts": [
"TTL",
"ECL",
"CMOS",
"RTL"
]
},
{
"n": 15,
"stem": "The Boolean expression A + B simplifies to:",
"opts": [
"A",
"B",
"A + B",
"+ B"
]
},
{
"n": 16,
"stem": "The Fourier transform of a unit impulse function δ(t) is:",
"opts": [
"0",
"1",
"∞",
"-jωt"
]
},
{
"n": 17,
"stem": "A system is linear if it satisfies:ω",
"opts": [
"Homogeneity",
"Superposition",
"Both homogeneity and superposition",
"Time-invariance"
]
},
{
"n": 18,
"stem": "The Laplace transform of e-atu(t) is:",
"opts": [
"b)",
"",
"d)",
""
]
},
{
"n": 19,
"stem": "The region of convergence (ROC) of a causal signal is:",
"opts": [
"Left-side of the pole",
"Right-side of the pole",
"Entire s-plane",
"A circle"
]
},
{
"n": 20,
"stem": "The energy of a signal x(t) = e-2tu(t) is:",
"opts": [
"0.25 J",
"0.5 J",
"1 J",
"2 J"
]
},
{
"n": 21,
"stem": "The dominant mode in a rectangular waveguide is:",
"opts": [
"TE₁₀",
"TE₂₀",
"TM₁₁",
"TEM"
]
},
{
"n": 22,
"stem": "A parabolic reflector antenna is used for:",
"opts": [
"Omnidirectional radiation",
"High directivity",
"Low gain",
"Short-range comms"
]
},
{
"n": 23,
"stem": "The S-parameter S11 represents:",
"opts": [
"Forward gain",
"Input reflection coefficient",
"Reverse isolation",
"Transmission coefficient"
]
},
{
"n": 24,
"stem": "The frequency range of Ku-band is approximately:",
"opts": [
"1–2 GHz",
"4–8 GHz",
"12–18 GHz",
"30–40 GHz"
]
},
{
"n": 25,
"stem": "A circulator is a _____ port device.",
"opts": [
"2",
"3",
"4",
"5"
]
},
{
"n": 26,
"stem": "The gain margin is measured when phase is:",
"opts": [
"0°",
"90°",
"-180°",
"45°"
]
},
{
"n": 27,
"stem": "An ideal op-amp has:",
"opts": [
"Infinite input impedance",
"Zero output impedance",
"Infinite gain",
"All of the above"
]
},
{
"n": 28,
"stem": "The PID controller improves system response by:",
"opts": [
"Reducing rise time",
"Eliminating steady-state error",
"Reducing overshoot",
"All of the above"
]
},
{
"n": 29,
"stem": "The Barkhausen criterion for oscillation requires:",
"opts": [
"|A| = 1, phase shift = 0°",
"|A| > 1, phase shift = 180°",
"|A| < 1, phase shift = 90°",
"|A| = 0, phase shift = 360°"
]
},
{
"n": 30,
"stem": "A Schmitt trigger is used for:",
"opts": [
"Amplification",
"Noise immunity in switching",
"Frequency multiplication",
"Phase shifting"
]
}
]"""

KEY = {
    2: ("b", "Zener diodes regulate voltage in reverse breakdown."), 3: ("a", "β = IC/IB."), 4: ("a", "The gate voltage controls the channel width and drain current."),
    5: ("a", "Full-wave rectifier ripple factor = 0.482."), 6: ("a", "An envelope detector demodulates AM."), 9: ("b", "More bits per sample = smaller quantization steps."),
    10: ("d", "QAM carries several bits per symbol - most bandwidth efficient."), 11: ("a", "fir1 uses cutoff normalised to fs/2: 500/1000."),
    12: ("b", "J = K = 1 toggles."), 13: ("c", "2⁴ = 16 ≥ 10, so 4 flip-flops."), 14: ("c", "CMOS has the lowest static power."),
    15: ("c", "A + A̅B = A + B."), 16: ("b", "F{δ(t)} = 1."), 17: ("c", "Linearity = homogeneity + additivity (superposition)."), 18: ("a", "L{e^(−at)u(t)} = 1/(s + a)."),
    19: ("b", "A causal signal's ROC is to the right of the rightmost pole."), 20: ("a", "E = ∫₀^∞ e^(−4t) dt = 1/4 J."), 21: ("a", "TE₁₀ is the dominant mode."),
    22: ("b", "Parabolic reflectors give high directivity."), 23: ("b", "S11 is the input reflection coefficient."), 24: ("c", "Ku-band ≈ 12-18 GHz."),
    25: ("b", "A circulator is usually a 3-port device."), 26: ("c", "Gain margin is read at the −180° phase crossover."), 27: ("d", "An ideal op-amp has all three properties."),
    28: ("d", "P, I and D together reduce rise time, remove steady-state error and reduce overshoot."), 29: ("a", "Loop gain |Aβ| = 1 with 0° (360°) phase shift."),
    30: ("b", "Hysteresis gives noise immunity when switching."),
}
FIX = {3: {"opts": ["IC/IB", "IC/IE", "IE/IB", "IB/IC"]}, 15: {"stem": "The Boolean expression A + A̅B simplifies to:", "opts": ["A", "B", "A + B", "A̅ + B"]},
       17: {"stem": "A system is linear if it satisfies:"}, 18: {"stem": "The Laplace transform of e^(−at)u(t) is:", "opts": ["1/(s + a)", "1/(s − a)", "s/(s + a)", "a/(s + a)"]},
       20: {"stem": "The energy of the signal x(t) = e^(−2t)u(t) is:"}}
T = TOPIC
Q = mcqs(MCQ, KEY, T, FIX) + [
    new_mcq(1, T, "In an n-type semiconductor, the majority charge carriers are", ["holes", "electrons", "protons", "positive ions"], "b", "Donor impurities add free electrons."),
    new_mcq(2, T, "The Nyquist sampling rate for a signal with a maximum frequency of 4 kHz is", ["2 kHz", "4 kHz", "8 kHz", "16 kHz"], "c", "fs ≥ 2 fmax = 8 kHz."),
    new_mcq(3, T, "The 2's complement of the binary number 0101 is", ["1010", "1011", "0110", "1101"], "b", "Invert (1010) and add 1 = 1011."),
    saq(1, T, "Probability and statistics (reliability engineering): the time to failure (in hours) of a specific electronic component follows an exponential distribution with a mean of 1000 hours. What is the probability that the component will fail before 500 hours? (5 marks)",
        [("λ = 1/1000 per hour", 1), ("P(T < t) = 1 − e^(−λt)", 2), ("= 1 − e^(−0.5) ≈ 0.393 (39.3%)", 2)],
        "For an exponential distribution, λ = 1/mean = 1/1000 per hour. P(T < 500) = 1 − e^(−λt) = 1 − e^(−500/1000) = 1 − e^(−0.5) = 1 − 0.6065 ≈ 0.393, i.e. about 39.3%."),
    saq(2, T, "What is the primary purpose of each term in a PID controller (Proportional, Integral, Derivative)? (5 marks)",
        [("P: output proportional to present error - faster response, reduces error but leaves offset", 2), ("I: sums past error - eliminates steady-state error (may add overshoot)", 1.5), ("D: reacts to rate of change - damping, reduces overshoot, improves stability", 1.5)],
        "Proportional: produces an output proportional to the present error, giving a quick corrective action and reducing rise time, but alone it leaves a steady-state error. Integral: accumulates the error over time, removing steady-state error, though too much causes overshoot and oscillation. Derivative: responds to the rate of change of the error, anticipating future error, adding damping, reducing overshoot and improving stability."),
    saq(3, T, "A transmission line with characteristic impedance Z₀ = 50 Ω is terminated with a load Z_L = 100 + j50 Ω. What is the value of the normalised load impedance? If you were to use a single-stub tuner, would you place a shorted or open stub? Why? (5 marks)",
        [("z_L = Z_L/Z₀ = 2 + j1", 2), ("Shorted stub preferred", 1), ("Reasons: no radiation/fringing from the open end, easier to realise and adjust, stable; (open stub possible in microstrip)", 2)],
        "Normalised load impedance z_L = Z_L/Z₀ = (100 + j50)/50 = 2 + j1. A short-circuited stub is usually preferred: a shorted end is easy to make exactly, does not radiate, and has no fringing capacitance, so its reactance is predictable and stable; an open end radiates and has end effects (although open stubs are convenient in microstrip circuits). The stub length is chosen from the Smith chart to cancel the susceptance at the point where the real part of the admittance is 1."),
    saq(4, T, "A linearly polarised electromagnetic wave is incident upon a perfectly conducting ground plane at an angle. What happens to the polarisation of the reflected wave? Justify your answer. (5 marks)",
        [("Reflected wave remains linearly polarised (total reflection, |Γ| = 1)", 2), ("Justification: tangential E must be zero at a perfect conductor, so tangential components reverse phase; both perpendicular and parallel components reflect with equal magnitude", 2), ("Orientation mirrored; (circular would reverse handedness)", 1)],
        "The reflected wave is still linearly polarised. At a perfect conductor the tangential electric field must be zero, so all the energy is reflected (|Γ| = 1) and the tangential field components reverse phase (180°). Both the perpendicular (TE) and parallel (TM) components are reflected with equal magnitude and a fixed phase relation, so their combination stays linear; only the direction of the polarisation is mirrored about the plane of incidence. (By contrast, a circularly polarised wave would have its handedness reversed.)"),
]
C1 = """CASE I: AI in Telecommunications
A mobile network operator wants to reduce call drops and improve Quality of Service (QoS) using AI/ML solutions."""
C2 = """CASE II: Satellite Internet for Remote Areas
An ISP is exploring Low Earth Orbit (LEO) satellites to provide internet in remote mountainous regions."""
Q += case("ece2025", 1, T, C1, items=[
    ("What kind of network data should be collected for training AI models?", 20,
     [("Radio KPIs: RSRP, RSRQ, SINR, CQI, handover success/failure, call drop records", 6), ("Traffic and load: PRB utilisation, throughput, active users, time-of-day/location patterns", 6), ("Configuration, alarms/fault logs, topology, weather/events, user experience data", 5), ("Data quality, labelling, privacy and anonymisation", 3)],
     "Collect: radio measurements (RSRP, RSRQ, SINR, CQI, timing advance) and call records showing drops and failed handovers; traffic and load data per cell (PRB utilisation, throughput, number of active users, latency, packet loss) over time; network configuration, neighbour lists and topology; alarms, fault and maintenance logs; contextual data such as time of day, location, events and weather; and customer experience indicators (complaints, app QoE). Data must be cleaned, time-synchronised, labelled (e.g. drop/no-drop) and anonymised to protect subscriber privacy."),
    ("How can AI be used to predict network congestion and reroute traffic in real time?", 15,
     [("Forecasting models (time-series, LSTM, gradient boosting) on cell load to predict congestion ahead", 5), ("Anomaly detection and classification of drop causes", 3), ("Automated actions: load balancing, handover parameter tuning, traffic steering, SON, SDN rerouting, reinforcement learning", 5), ("Closed loop with monitoring", 2)],
     "Train time-series and machine-learning models (e.g. LSTM, gradient boosting) on historical load to forecast congestion per cell minutes or hours ahead, and anomaly-detection models to spot unusual drops. When congestion is predicted, a self-organising network (SON) or SDN controller acts automatically: adjusts handover thresholds and antenna tilt, steers users to less-loaded cells or frequency bands (load balancing), offloads to Wi-Fi, reroutes backhaul traffic, or prioritises voice. Reinforcement learning can learn the best actions; results are monitored in a closed loop."),
    ("Discuss trade-offs between centralised cloud AI and edge AI in telecom applications.", 15,
     [("Cloud AI: large compute and data, global view, easier model training/updating; but latency, bandwidth cost, privacy, dependence on backhaul", 7), ("Edge AI: low latency real-time decisions, less backhaul, privacy, resilience; but limited compute, harder management, smaller models", 6), ("Hybrid: train in cloud, infer at edge", 2)],
     "Centralised cloud AI has large computing power, sees the whole network and is easier to train and update, but adds latency, needs heavy backhaul bandwidth, raises data-privacy concerns and fails if the link is lost. Edge AI (at base stations or MEC servers) decides in milliseconds for real-time functions such as handover and scheduling, reduces backhaul traffic and keeps data local, but has limited compute and storage, smaller models and is harder to manage across many sites. A hybrid approach - train in the cloud, deploy lightweight models at the edge, federated learning - balances both."),
])
Q += case("ece2025", 2, T, C2, items=[
    ("Compare the pros and cons of LEO satellite internet versus terrestrial fixed wireless.", 20,
     [("LEO pros: coverage anywhere incl. mountains, quick deployment, low latency vs GEO, no terrain line-of-sight need", 7), ("LEO cons: terminal cost, subscription, weather/obstruction, capacity sharing, regulatory/sovereignty, dependence on foreign operator", 6), ("Fixed wireless pros/cons: cheaper per user, local control, high capacity; but needs towers, line-of-sight, difficult terrain, power", 7)],
     "LEO satellite internet: covers remote valleys and high mountains without building ground infrastructure, can be deployed quickly, latency (20-50 ms) far better than geostationary satellites, and is resilient to local disasters. Cons: expensive terminals and subscriptions for rural users, capacity shared in each cell, sensitivity to obstructions (trees, mountains) and heavy rain, dependence on foreign operators and licensing/data-sovereignty issues. Terrestrial fixed wireless: lower cost per user, local control, high capacity and easy upgrades; but needs towers with line-of-sight and power, which is hard and costly in Bhutan's mountainous terrain, and has limited range."),
    ("What key hardware challenges must be solved for user terminals (antennas, tracking, power efficiency)?", 15,
     [("Antennas: electronically steered phased arrays, low cost, gain", 5), ("Tracking fast-moving satellites and handover between satellites without mechanical parts", 5), ("Power consumption, heat, operation off-grid (solar/battery), ruggedness for cold, snow, altitude", 5)],
     "Antennas: low-cost electronically steered phased-array antennas with enough gain, since dish-type mechanical pointing is too slow and fragile. Tracking: satellites cross the sky in minutes, so terminals must track continuously and hand over seamlessly between satellites and beams using accurate positioning. Power efficiency: phased arrays and processing draw tens of watts; terminals must run on solar and battery in off-grid villages, manage heat, and withstand snow, cold, wind and altitude, while being affordable and easy to install."),
    ("How can latency be minimised to make services comparable to fibre networks?", 15,
     [("Low orbits and dense constellations, inter-satellite laser links", 5), ("Ground stations/gateways and points of presence close to users, edge caching/CDN", 5), ("Efficient routing, scheduling and protocol optimisation (TCP acceleration), QoS", 5)],
     "Use low orbits (about 550 km) and dense constellations to keep the path short; inter-satellite laser links to route traffic in space by the shortest path; place gateways and internet points of presence close to users (e.g. in or near Bhutan) with local caching and content delivery networks; optimise scheduling, beam handover and protocols (TCP acceleration, modern congestion control); and use QoS priority for real-time services. With these, latency of 20-40 ms is close to fibre for most applications."),
])
PATTERN = STANDARD
