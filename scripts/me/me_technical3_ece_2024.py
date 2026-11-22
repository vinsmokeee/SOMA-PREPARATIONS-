"""ME Technical Paper III (Subject Specialisation Paper), Electronics and Communication Engineering, BCSE 2024 - real paper
(PDF sent by the founder). Standard pattern, same as the 2025 E&C paper (the latest). MCQs replaced: 20 (higher bandwidth and
immunity to interference are both main advantages of fibre) and 24 (none of the options fits "digital data over analog
systems"; it also repeats MCQ 5). Each case study is a single 50-mark question, as printed.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Electronics and Communication Engineering): BCSE 2024, batch 1"
GROUP_TAG = "ece2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "electronics-communication-engineering"
ADDS_TO_PAPER = True  # 2025 is the latest E&C paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Electronics and Communication Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Electronics and Communication Engineering"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following is a type of non-volatile memory?",
"opts": [
"RAM",
"ROM",
"Cache",
"Register"
]
},
{
"n": 2,
"stem": "What does \"LED\" stand for in electronics?",
"opts": [
"Light Emitting Device",
"Low Energy Device",
"Light Emitting Diode",
"Light Energy Diode"
]
},
{
"n": 3,
"stem": "Which of the following components is used to store electrical energy in an electric field?",
"opts": [
"Resistor",
"Inductor",
"Capacitor",
"Transformer"
]
},
{
"n": 4,
"stem": "In a transistor, the region between the emitter and collector is called:",
"opts": [
"Base",
"Gate",
"Drain",
"Source"
]
},
{
"n": 5,
"stem": "Which modulation technique is used for transmitting digital data over analog communication channels?",
"opts": [
"Amplitude Modulation (AM)",
"Frequency Modulation (FM)",
"Phase Modulation (PM)",
"Quadrature Amplitude Modulation (QAM)"
]
},
{
"n": 6,
"stem": "What is the primary purpose of a diode in electronic circuits?",
"opts": [
"To amplify signals",
"To rectify AC to DC",
"To filter signals",
"To oscillate signals"
]
},
{
"n": 7,
"stem": "Which of the following is a digital logic gate?",
"opts": [
"Transformer",
"Diode",
"AND gate",
"Capacitor"
]
},
{
"n": 8,
"stem": "Which type of memory is typically used for the main memory in a computer system?",
"opts": [
"ROM",
"EEPROM",
"SRAM",
"DRAM"
]
},
{
"n": 9,
"stem": "The speed of light in vacuum is approximately:",
"opts": [
"3 × 10^6 m/s",
"3 × 10^7 m/s",
"3 × 10^8 m/s",
"3 × 10^9 m/s"
]
},
{
"n": 10,
"stem": "In a frequency modulation (FM) system, the frequency deviation is proportional to:",
"opts": [
"Amplitude of the modulating signal",
"Frequency of the modulating signal",
"Phase of the modulating signal",
"None of the above"
]
},
{
"n": 11,
"stem": "What is the purpose of an operational amplifier in electronic circuits?",
"opts": [
"To amplify voltage",
"To store charge",
"To convert AC to DC",
"To regulate voltage"
]
},
{
"n": 12,
"stem": "In an AC circuit, the power factor is the ratio of:",
"opts": [
"Real power to apparent power",
"Apparent power to real power",
"Real power to reactive power",
"Reactive power to apparent power"
]
},
{
"n": 13,
"stem": "Which of the following is used to measure electrical resistance?",
"opts": [
"Voltmeter",
"Ammeter",
"Ohmmeter",
"Wattmeter"
]
},
{
"n": 14,
"stem": "Which device is used to increase or decrease AC voltage?",
"opts": [
"Diode",
"Capacitor",
"Transformer",
"Resistor"
]
},
{
"n": 15,
"stem": "In a digital communication system, what does the term \"bit rate\" refer to?",
"opts": [
"The number of bits transmitted per second",
"The number of bytes transmitted per second",
"The number of signals transmitted per second",
"The number of channels transmitted per second"
]
},
{
"n": 16,
"stem": "Which type of semiconductor is created by adding pentavalent impurities?",
"opts": [
"Intrinsic semiconductor",
"P-type semiconductor",
"N-type semiconductor",
"Compound semiconductor"
]
},
{
"n": 17,
"stem": "Which of the following communication modes allows data transmission in both directions simultaneously?",
"opts": [
"Simplex",
"Half-duplex",
"Full-duplex",
"Multiplex"
]
},
{
"n": 18,
"stem": "What is the primary function of a relay in an electronic circuit?",
"opts": [
"To store energy",
"To act as a switch",
"To amplify signals",
"To filter signals"
]
},
{
"n": 19,
"stem": "In an RC circuit, what does \"RC\" stand for?",
"opts": [
"Resistor-Capacitor",
"Reactive-Capacitive",
"Real-Current",
"Resistance-Conductance"
]
},
{
"n": 20,
"stem": "The main advantage of using fiber optic cables over copper cables is:",
"opts": [
"Lower cost",
"Higher bandwidth",
"Easier installation",
"Higher resistance to electrical interference"
]
},
{
"n": 21,
"stem": "Which of the following is a unipolar device?",
"opts": [
"Diode",
"Bipolar Junction Transistor (BJT)",
"Field-Effect Transistor (FET)",
"Thyristor"
]
},
{
"n": 22,
"stem": "In a communication system, noise is most likely to affect the signal during which of the following processes?",
"opts": [
"Modulation",
"Transmission",
"Reception",
"Demodulation"
]
},
{
"n": 23,
"stem": "What is the primary purpose of a capacitor in an electronic circuit?",
"opts": [
"To store energy in an electric field",
"To convert AC to DC",
"To amplify signals",
"To control the frequency of oscillation"
]
},
{
"n": 24,
"stem": "Which modulation technique is used for transmitting digital data over analog systems?",
"opts": [
"Amplitude Modulation (AM)",
"Frequency Modulation (FM)",
"Pulse Code Modulation (PCM)",
"Phase Modulation (PM)"
]
},
{
"n": 25,
"stem": "In a superheterodyne receiver, what is the function of the mixer?",
"opts": [
"To amplify the received signal",
"To filter the received signal",
"To convert the received signal to an intermediate frequency",
"To demodulate the received signal"
]
},
{
"n": 26,
"stem": "Which type of antenna is most commonly used for satellite communication?",
"opts": [
"Dipole antenna",
"Yagi-Uda antenna",
"Parabolic dish antenna",
"Loop antenna"
]
},
{
"n": 27,
"stem": "The Nyquist rate is defined as:",
"opts": [
"Twice the highest frequency present in the signal",
"Half the highest frequency present in the signal",
"The same as the highest frequency present in the signal",
"Four times the highest frequency present in the signal"
]
},
{
"n": 28,
"stem": "Which of the following components is used to isolate different sections of a circuit?",
"opts": [
"Resistor",
"Capacitor",
"Transformer",
"Inductor"
]
},
{
"n": 29,
"stem": "In an RC circuit, what is the time constant (τ) defined as?",
"opts": [
"R + C",
"R * C",
"R / C",
"C / R"
]
},
{
"n": 30,
"stem": "Which of the following describes the main function of an operational amplifier (op-amp)?",
"opts": [
"To rectify AC signals",
"To filter signals",
"To amplify voltage",
"To convert digital signals to analog"
]
}
]"""

KEY = {
    1: ("b", "ROM keeps its contents without power (non-volatile); RAM, cache and registers are volatile."),
    2: ("c", "LED = Light Emitting Diode."),
    3: ("c", "A capacitor stores energy in its electric field (an inductor in its magnetic field)."),
    4: ("a", "The base lies between the emitter and collector of a bipolar transistor."),
    5: ("d", "QAM varies amplitude and phase to carry digital data over analog (passband) channels."),
    6: ("b", "A diode conducts in one direction, so it rectifies AC to DC."),
    7: ("c", "An AND gate is a digital logic gate."),
    8: ("d", "Main memory (RAM) is usually DRAM; SRAM is used for cache."),
    9: ("c", "c ≈ 3 x 10⁸ m/s."),
    10: ("a", "In FM the frequency deviation is proportional to the amplitude of the modulating signal."),
    11: ("a", "An op-amp is a high-gain voltage amplifier."),
    12: ("a", "Power factor = real power / apparent power (cos φ)."),
    13: ("c", "An ohmmeter measures resistance."),
    14: ("c", "A transformer steps AC voltage up or down."),
    15: ("a", "Bit rate is the number of bits transmitted per second (bps)."),
    16: ("c", "Pentavalent (donor) impurities give free electrons: N-type."),
    17: ("c", "Full-duplex allows simultaneous transmission in both directions."),
    18: ("b", "A relay is an electrically operated switch."),
    19: ("a", "RC = resistor-capacitor circuit."),
    21: ("c", "In a FET current is carried by one type of carrier (majority carriers) only: unipolar."),
    22: ("b", "Noise is mostly added in the channel during transmission."),
    23: ("a", "A capacitor stores energy in an electric field."),
    25: ("c", "The mixer shifts the received signal to the intermediate frequency (IF)."),
    26: ("c", "High-gain parabolic dish antennas are used for satellite links."),
    27: ("a", "Nyquist rate = twice the highest frequency in the signal."),
    28: ("c", "A transformer provides galvanic isolation between circuit sections."),
    29: ("b", "Time constant τ = R x C."),
    30: ("c", "The main function of an op-amp is voltage amplification (with feedback for many functions)."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "Optical fibre cables are immune to electromagnetic interference mainly because they", ["Carry signals as light in a dielectric (glass) core", "Are thicker than copper cables", "Use higher voltages", "Are always buried underground"], "a",
            "Light travelling in a non-conducting glass core is not affected by electromagnetic fields."),
    new_mcq(2, T, "Pulse code modulation (PCM) is used mainly to", ["Convert an analog signal into a digital bit stream by sampling, quantising and encoding", "Transmit digital data over a telephone line as tones", "Increase the amplitude of radio signals", "Modulate the phase of a carrier with an analog signal"], "a",
            "PCM digitises analog signals: sampling, quantisation and binary encoding."),
]

SA = [
    ("What is the purpose of a rectifier in an electronic circuit? How does an analog-to-digital converter (ADC) work?",
     [("Rectifier: converts AC to (pulsating) DC using diodes - half-wave, full-wave, bridge; with filter for power supplies", 2.5),
      ("ADC: samples analog input (sample and hold), quantises into levels, encodes as binary; types (successive approximation, flash, sigma-delta); resolution and sampling rate", 2.5)],
     "A rectifier converts alternating current (AC) into direct current (DC) using diodes (or thyristors) that conduct in one direction only: a half-wave rectifier passes one half-cycle, while full-wave centre-tapped and bridge rectifiers use both half-cycles; a filter capacitor and regulator then smooth the pulsating DC for power supplies and chargers. An ADC converts a continuous analog voltage into digital numbers: (1) the signal is sampled at regular intervals (at least twice the highest frequency) and held by a sample-and-hold circuit; (2) each sample is quantised - compared with reference levels to find the nearest of 2ⁿ levels (n = resolution in bits); (3) the level is encoded as a binary code. Common types are successive-approximation (a comparator and DAC test bits from MSB to LSB), flash (parallel comparators, very fast) and sigma-delta (high resolution)."),
    ("What is the function of an inductor in an electronic circuit? How does a capacitor store energy?",
     [("Inductor: opposes change of current, stores energy in magnetic field (½LI²); uses: filters/ chokes, tuned LC circuits, energy storage in switching regulators, blocks AC passes DC", 2.5),
      ("Capacitor: two plates separated by dielectric; voltage moves charge, electric field in dielectric stores energy E = ½CV²; releases when discharged", 2.5)],
     "An inductor (coil) opposes changes in current by inducing a back emf (V = L di/dt) and stores energy in its magnetic field (E = ½LI²). It passes DC but opposes high-frequency AC, so it is used as a choke and in filters, in tuned LC circuits for oscillators and radios, and for energy storage in switching power supplies (buck/boost converters). A capacitor consists of two conducting plates separated by an insulator (dielectric). When a voltage is applied, electrons collect on one plate and leave the other, so equal and opposite charges build up (Q = CV) and an electric field forms in the dielectric; the energy is stored in this electric field, E = ½CV², and is released when the capacitor discharges into the circuit."),
    ("What is a transistor used for in electronic circuits? How does an operational amplifier (op-amp) work?",
     [("Transistor: amplifier (small base/ gate signal controls larger current) and electronic switch (digital logic, drivers); BJT/ FET types; building block of ICs", 2.5),
      ("Op-amp: differential amplifier with very high open-loop gain, high input impedance, low output impedance; output = A(V+ - V-); used with negative feedback to set gain (inverting -Rf/Rin, non-inverting 1 + Rf/Rin), comparators, filters, integrators", 2.5)],
     "A transistor (BJT or FET) is a semiconductor device in which a small input (base current or gate voltage) controls a larger current between collector-emitter or drain-source. It is used as an amplifier (radios, audio, sensors) and as a fast electronic switch (digital logic, motor and LED drivers), and billions of transistors form integrated circuits and processors. An op-amp is an integrated differential amplifier with two inputs (inverting - and non-inverting +), very high open-loop gain (about 10⁵-10⁶), very high input impedance and low output impedance; its output is Vo = A(V+ - V-). Because the gain is so large, it is used with negative feedback resistors that set a precise gain: inverting amplifier gain = -Rf/Rin, non-inverting gain = 1 + Rf/Rin. It is also used as a comparator, summing amplifier, integrator, differentiator and active filter."),
    ("What is an oscillator used for in electronics? How do you measure the frequency of a signal using an oscilloscope?",
     [("Oscillator: produces periodic signal (sine, square) without input using positive feedback (Barkhausen criteria); uses: clocks, carriers in transmitters, local oscillators, timers; types RC, LC, crystal", 2.5),
      ("Oscilloscope: connect probe, set time/div and volts/div, trigger for stable trace; measure period T = divisions x time/div; f = 1/T (or built-in frequency measurement/ cursors)", 2.5)],
     "An oscillator generates a repetitive signal (sine, square or triangular wave) from a DC supply without an input signal, using an amplifier with positive feedback that satisfies the Barkhausen criteria (loop gain = 1, phase shift 0° or 360°). Oscillators provide clock signals in computers and microcontrollers, carrier and local-oscillator signals in radio transmitters and receivers, and timing signals; types include RC (phase-shift, Wien bridge), LC (Colpitts, Hartley) and crystal oscillators for high stability. To measure frequency with an oscilloscope: connect the probe (with correct attenuation) to the signal and ground; adjust volts/div so the waveform fits the screen and time/div so one or more complete cycles are visible; set the trigger level so the trace is stable; count the horizontal divisions for one complete cycle and multiply by the time/div to get the period T (e.g. 4 div x 0.5 ms/div = 2 ms); then frequency f = 1/T = 500 Hz. Modern oscilloscopes can also show the frequency directly using cursors or automatic measurements."),
]
for i, (s, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=5, topic=T, stem=s, key_points=kp, model=mod))

C1 = """Case I: An integrated communication system for a smart city
Smart cities depend on reliable communication networks that connect people, government services, sensors and utilities."""
C2 = """Case II: An IoT-based smart parking system
Finding parking in growing urban areas wastes time and fuel and adds to congestion. An IoT-based smart parking system can show and manage available spaces in real time."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("ece2024", 1, T, C1, items=[
    it("Describe in detail the implementation of an integrated communication system for a smart city.", 50,
       [("Objectives and needs assessment: services (e-governance, transport, utilities, safety, health, education), stakeholders, existing infrastructure, standards/ policy (e.g. GMC/ Thimphu context)", 8),
        ("Architecture: layered - sensing/ devices layer, access network (fibre FTTx, 4G/5G, Wi-Fi, LPWAN LoRa/ NB-IoT), backbone/ core (fibre ring, MPLS/ SD-WAN), data centre/ cloud, platform (IoT, analytics), applications", 12),
        ("Integration: common platform/ city operation centre, interoperability (open standards, APIs, MQTT), shared ducts and poles, emergency communication, public safety network, redundancy", 8),
        ("Applications: smart traffic, CCTV, smart meters/ grid, water, waste, street lighting, e-services, public Wi-Fi, disaster warning", 8),
        ("Security and privacy: encryption, IAM, segmentation, SOC, data governance; reliability: power backup, redundant paths", 7),
        ("Implementation plan: phases (pilot, rollout), PPP/ financing, regulation (spectrum, licences), capacity building, O&M, KPIs, sustainability", 7)],
       """1. Planning and needs assessment: identify the services the city needs - e-governance, intelligent transport, public safety (CCTV, emergency response), utilities (smart electricity, water and waste), health, education and public Wi-Fi - consult stakeholders (municipality, telecom operators, utilities, police), survey existing fibre, towers and data centres, and set policies, standards and budgets (e.g. for a new city such as Gelephu Mindfulness City or for Thimphu).
2. Architecture (layered): (a) device/sensing layer - sensors, meters, cameras, smart lights and citizens' phones; (b) access networks - fibre to the home/building (GPON FTTx), 4G/5G mobile, public and municipal Wi-Fi, and low-power wide-area networks (LoRaWAN, NB-IoT) for battery sensors; (c) backbone/core - a redundant fibre-optic ring linking districts, with IP/MPLS or SD-WAN routing and microwave backup; (d) data centre and cloud - computing and storage, with edge computing for low latency; (e) platform layer - an IoT/data platform with analytics, GIS and dashboards; (f) applications and a city operations centre.
3. Integration: one shared infrastructure (common ducts, poles and towers), open standards and APIs (MQTT, REST) for interoperability between agencies, a single city operations/command centre that combines data from traffic, utilities and safety, and integration with emergency and disaster-warning systems.
4. Applications: adaptive traffic signals and smart parking, CCTV and emergency response, smart meters and grid automation, leak detection in water networks, smart street lighting, waste-bin sensors, e-government services and public Wi-Fi.
5. Security and reliability: encryption, identity and access management, network segmentation, firewalls and a security operations centre, data-protection and privacy rules; redundant paths, power backup (UPS, generators, solar) and disaster recovery.
6. Implementation: phased roll-out (pilot zone, then expansion), financing through public-private partnership, regulation (spectrum, licences, right-of-way), training local engineers, operation and maintenance contracts, and performance indicators (coverage, uptime, response times) with periodic review."""),
])
Q += case("ece2024", 2, T, C2, items=[
    it("How can an IoT-based smart parking system be implemented in an urban area? Include the assessment, infrastructure requirements and applications.", 50,
       [("Assessment: parking demand and supply survey (on-street/ off-street), occupancy patterns, problems (congestion, illegal parking), stakeholders (thromde, police, operators), budget, feasibility, policy (pricing)", 12),
        ("Infrastructure - sensing: ultrasonic/ magnetometer/ IR in-ground sensors or cameras with ANPR per bay; edge gateways", 8),
        ("Infrastructure - communication: LoRaWAN/ NB-IoT/ Wi-Fi/ 4G to cloud; power (battery/ solar)", 6),
        ("Infrastructure - platform and user side: cloud server, database, analytics, mobile app, LED guidance signs, payment (e-payment, mBoB/ cards), enforcement interface", 8),
        ("Applications: real-time availability, guidance/ navigation, reservation, dynamic pricing, cashless payment, enforcement alerts, data for planning, EV charging integration", 10),
        ("Implementation steps (pilot, scale-up), security/ privacy, maintenance, benefits and challenges", 6)],
       """Assessment: survey on-street and off-street parking supply and demand, occupancy by time of day, search times, congestion and illegal parking hot spots (e.g. Thimphu's core area); consult the thromde, traffic police, parking operators and drivers; review pricing policy and budget; and run a feasibility and cost-benefit study, choosing a pilot area.
Infrastructure: (1) sensing - a vehicle detector for each bay (in-ground magnetometer or ultrasonic/infrared sensors) or camera-based detection with automatic number-plate recognition at parking lots; (2) communication - low-power networks such as LoRaWAN or NB-IoT (or Wi-Fi/4G for cameras) through gateways to the internet, with batteries or solar power for sensors; (3) back end - a cloud server and database receiving occupancy updates, analytics and a management dashboard; (4) user interfaces - a mobile app and website showing free spaces, variable message/LED signs at entrances and junctions guiding drivers, and payment integration (e-wallets, mobile banking, cards); (5) enforcement tools for parking attendants; (6) security (encrypted communication, access control) and a maintenance plan.
Applications: real-time display of available spaces and navigation to them; advance reservation; cashless payment and automatic time-based billing; dynamic pricing to spread demand; alerts for overstay and illegal parking to enforcement staff; reserved bays for disabled users and EV charging management; and data analytics for urban and transport planning.
Implementation: pilot in one zone, evaluate, then scale; train staff and inform the public. Benefits: less congestion, fuel use and emissions, saved time, better revenue collection and planning data. Challenges: installation and maintenance cost, sensor accuracy in snow/rain, connectivity, data privacy and public acceptance."""),
])
PATTERN = STANDARD
