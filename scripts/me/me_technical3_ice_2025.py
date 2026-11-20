"""ME Technical Paper III (Subject Specialisation Paper), Instrumentation and Control Engineering, BCSE 2025 - real paper (PDF sent by the founder).
Standard pattern. All 30 MCQs kept (MCQ 21 options rewritten from the garbled PDF formulas). Case II Q1 asks for a
block diagram: students draw it and upload a photo.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1"
GROUP_TAG = "ice2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "instrumentation-control-engineering"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Instrumentation and Control Engineering"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following is NOT a primary element in a measurement system?",
"opts": [
"Sensor",
"Transducer",
"Signal conditioner",
"Controller"
]
},
{
"n": 2,
"stem": "The range of a 4 – 20 mA signal is chosen because:",
"opts": [
"It allows bidirectional transmission",
"It avoids zero current for fault detection",
"It’s cheaper than other ranges",
"It works only for digital systems"
]
},
{
"n": 3,
"stem": "A thermocouple works on which principle?",
"opts": [
"Piezoelectric effect",
"Seebeck effect",
"Hall effect",
"Doppler effect"
]
},
{
"n": 4,
"stem": "In a PID controller, the proportional term:",
"opts": [
"Eliminates steady-state error",
"Increases speed of response",
"Reduces overshoot",
"Filters noise"
]
},
{
"n": 5,
"stem": "What is the output of an LVDT proportional to?",
"opts": [
"Velocity",
"Acceleration",
"Displacement",
"Force"
]
},
{
"n": 6,
"stem": "Which sensor is most suitable for non-contact temperature measurement?",
"opts": [
"RTD",
"Thermocouple",
"Infrared thermometer",
"Thermistor ENGINEERING"
]
},
{
"n": 7,
"stem": "Which control strategy is best for processes with large dead time?",
"opts": [
"PID control",
"Cascade control",
"Smith predictor",
"Feedforward only"
]
},
{
"n": 8,
"stem": "In HART communication, the digital signal is superimposed on:",
"opts": [
"Voltage",
"Pressure",
"Current loop",
"Optical fiber"
]
},
{
"n": 9,
"stem": "Which of the following is a secondary transducer?",
"opts": [
"Bourdon tube with strain gauge",
"Thermistor",
"Thermocouple",
"LVDT"
]
},
{
"n": 10,
"stem": "Which is NOT a final control element?",
"opts": [
"Pneumatic control valve",
"Electric motor",
"Solenoid valve",
"RTD sensor"
]
},
{
"n": 11,
"stem": "In PLC programming, which instruction is used for counting events?",
"opts": [
"TON",
"CTU",
"PID",
"MOV"
]
},
{
"n": 12,
"stem": "The main advantage of a 3-wire RTD over a 2-wire RTD is:",
"opts": [
"Higher sensitivity",
"Better linearity",
"Compensation for lead wire resistance",
"Higher temperature range"
]
},
{
"n": 13,
"stem": "The Ziegler–Nichols tuning method is used for:",
"opts": [
"Measuring system gain",
"Tuning controller parameters",
"Designing sensors",
"Selecting actuators"
]
},
{
"n": 14,
"stem": "In a control loop, the actuator’s main function is to:",
"opts": [
"Measure the process variable",
"Convert control signal into physical action",
"Calculate error",
"Filter noise ENGINEERING"
]
},
{
"n": 15,
"stem": "Which sensor type uses a Wheatstone bridge for measurement?",
"opts": [
"Strain gauge",
"Thermocouple",
"Ultrasonic sensor",
"Hall effect sensor"
]
},
{
"n": 16,
"stem": "Dead time in a process can cause:",
"opts": [
"Faster response",
"More stability",
"Oscillation and instability",
"Lower process gain"
]
},
{
"n": 17,
"stem": "The term “span” in instrumentation refers to:",
"opts": [
"Maximum possible output signal",
"Difference between upper and lower range limits",
"Time delay in response",
"Measurement accuracy"
]
},
{
"n": 18,
"stem": "Which controller action produces the fastest response to sudden disturbances?",
"opts": [
"Proportional",
"Integral",
"Derivative",
"On/Off"
]
},
{
"n": 19,
"stem": "In SCADA systems, the RTU stands for:",
"opts": [
"Remote Transducer Unit",
"Remote Terminal Unit",
"Real-Time Unit",
"Remote Transfer Utility"
]
},
{
"n": 20,
"stem": "Which valve characteristic provides a linear relationship between flow rate and valve position?",
"opts": [
"Equal percentage",
"Linear",
"Quick opening",
"Globe"
]
},
{
"n": 21,
"stem": "The transfer function of a first-order system is:",
"opts": [
"Kτs+1\\frac{K}{\\tau s + 1}τs+1K",
"Ks2+1\\frac{K}{s^2 + 1}s2+1K",
"1s\\frac{1}{s}s1",
"Kτs\\frac{K}{\\tau s}τsK"
]
},
{
"n": 22,
"stem": "In a DCS, the control logic is generally executed in:",
"opts": [
"Operator workstation",
"Engineering workstation",
"Controller module",
"PLC only ENGINEERING"
]
},
{
"n": 23,
"stem": "Which parameter is NOT usually measured in process control?",
"opts": [
"Temperature",
"Flow",
"Pressure",
"Weightlifting capacity"
]
},
{
"n": 24,
"stem": "Which sensor type works based on change in inductance?",
"opts": [
"LVDT",
"Capacitive sensor",
"Hall effect sensor",
"Ultrasonic sensor"
]
},
{
"n": 25,
"stem": "The main purpose of a signal conditioner is to:",
"opts": [
"Filter noise and amplify signals",
"Convert electrical signals into mechanical signals",
"Change AC to DC",
"Control the process directly"
]
},
{
"n": 26,
"stem": "Which of the following is a non-contact displacement sensor?",
"opts": [
"Strain gauge",
"LVDT",
"Laser triangulation sensor",
"Potentiometer"
]
},
{
"n": 27,
"stem": "Cascade control is mainly used to:",
"opts": [
"Reduce dead time",
"Reduce effect of load disturbances",
"Increase process gain",
"Improve sensor accuracy"
]
},
{
"n": 28,
"stem": "A pneumatic signal standard range is:",
"opts": [
"3–15 psi",
"0–100 psi",
"4–20 psi",
"1–10 psi"
]
},
{
"n": 29,
"stem": "The sampling theorem states that the sampling frequency must be at least:",
"opts": [
"Twice the Nyquist rate",
"Twice the highest frequency component of the signal",
"Equal to the signal frequency",
"Half the signal frequency"
]
},
{
"n": 30,
"stem": "Which of the following is an example of a smart transmitter?",
"opts": [
"Analog-only 4–20 mA transmitter",
"HART-enabled pressure transmitter",
"Manual pressure gauge",
"Bimetallic thermometer ENGINEERING"
]
}
]"""

MCQ = MCQ.replace(' ENGINEERING"', '"')
KEY = {
    1: ("d", "A controller is not part of the measurement system; sensor, transducer and signal conditioner are."), 2: ("b", "A live zero (4 mA) lets a broken loop (0 mA) be detected."),
    3: ("b", "Thermocouples use the Seebeck effect."), 4: ("b", "Proportional action speeds up response but leaves steady-state offset."),
    5: ("c", "LVDT output is proportional to core displacement."), 6: ("c", "Infrared thermometers measure without contact."),
    7: ("c", "The Smith predictor compensates for large dead time."), 8: ("c", "HART superimposes an FSK digital signal on the 4-20 mA current loop."),
    9: ("a", "The strain gauge on a Bourdon tube converts its displacement (from the primary element) into an electrical signal."), 10: ("d", "An RTD is a sensor, not a final control element."),
    11: ("b", "CTU (count up) counts events."), 12: ("c", "A 3-wire RTD compensates for lead-wire resistance."),
    13: ("b", "Ziegler-Nichols is a controller tuning method."), 14: ("b", "The actuator converts the control signal into physical action."),
    15: ("a", "Strain gauges are measured with a Wheatstone bridge."), 16: ("c", "Dead time causes oscillation and can destabilise the loop."),
    17: ("b", "Span = upper range value - lower range value."), 18: ("c", "Derivative action responds to the rate of change, so it reacts fastest."),
    19: ("b", "RTU = Remote Terminal Unit."), 20: ("b", "A linear characteristic gives flow proportional to valve position."),
    21: ("a", "A first-order system has G(s) = K / (τs + 1)."), 22: ("c", "DCS control logic runs in the controller modules."),
    23: ("d", "Weightlifting capacity is not a process variable."), 24: ("a", "The LVDT works on changing mutual inductance."),
    25: ("a", "Signal conditioners filter, amplify and convert sensor signals."), 26: ("c", "Laser triangulation measures displacement without contact."),
    27: ("b", "Cascade control rejects disturbances in the inner (secondary) loop before they affect the primary variable."), 28: ("a", "The standard pneumatic signal is 3-15 psi."),
    29: ("b", "Sampling frequency must be at least twice the highest frequency in the signal."), 30: ("b", "A HART-enabled pressure transmitter is a smart transmitter."),
}
FIX = {21: {"opts": ["K / (τs + 1)", "K / (s² + 1)", "1 / s", "K / (τs)"]}}
T = TOPIC
Q = mcqs(MCQ, KEY, T, FIX) + [
    saq(1, T, "Discuss the concept of feedback control and feedforward control in industrial processes. Give examples of situations where each control strategy is most effective.",
        [("Feedback: measures controlled variable, corrects error after it occurs; robust to unknown disturbances", 1.5), ("Feedforward: measures disturbance and acts before it affects output; needs process model; no correction of model error", 1.5), ("Examples for each (and combined feedforward + feedback)", 2)],
        """Feedback control measures the controlled (process) variable, compares it with the set point and acts on the error (e.g. PID). It corrects any disturbance or model error, but only after the output has already deviated, so it is slow for processes with long dead time. Most effective for: temperature, level or pressure loops with unmeasured disturbances, e.g. tank level control with a level transmitter and inlet valve.
Feedforward control measures a major disturbance and adjusts the manipulated variable before the output is affected, using a model of the process. It can cancel measured disturbances quickly but cannot correct unmeasured disturbances or model errors, so it is usually combined with feedback. Most effective where a large, measurable disturbance exists, e.g. boiler drum level (steam flow feedforward to feedwater: three-element control), or heat exchanger outlet temperature with feed-flow changes."""),
    saq(2, T, "What is a 4-20 mA current loop and why is it widely used in process control?",
        [("Definition: analogue signal transmission where current 4-20 mA represents 0-100% of range; loop with power supply, transmitter, receiver", 2), ("Reasons: immune to voltage drop/wire resistance and noise, live zero detects faults, long distance, two-wire powering, standard, HART", 3)],
        """A 4-20 mA current loop transmits an analogue measurement or control signal as a current: 4 mA = 0% (lower range value) and 20 mA = 100% (upper range value). A DC power supply (usually 24 V), the transmitter and the receiver (PLC/DCS input via a 250 Ω resistor giving 1-5 V) are connected in series, so the same current flows through all of them.
Reasons for wide use: current is the same everywhere in the loop, so it is not affected by wire resistance or voltage drops and works over long distances; it is less sensitive to electrical noise; the 'live zero' (4 mA) distinguishes a true 0% reading from a broken wire or failed device (0 mA or <3.6 mA alarms); the 4 mA minimum can power two-wire transmitters; it is a simple, cheap, universal standard and can carry HART digital communication on top."""),
    saq(3, T, "Explain the working principle of an RTD and mention its advantages over a thermocouple.",
        [("Principle: metal resistance increases with temperature; Pt100 R = R0(1 + αT), α = 0.00385; measured via bridge/constant current, 2/3/4-wire", 2.5), ("Advantages: higher accuracy, linearity, stability/repeatability, no cold-junction compensation, good at low-medium temperatures", 2.5)],
        """A resistance temperature detector (RTD) uses the fact that the electrical resistance of a pure metal (usually platinum) rises almost linearly with temperature: R_T = R0 (1 + αT), where for Pt100 R0 = 100 Ω at 0 °C and α = 0.00385 Ω/Ω/°C. A small constant current is passed (or a Wheatstone bridge is used) and the resistance is converted to temperature; 3- or 4-wire connections compensate for lead resistance.
Advantages over a thermocouple: higher accuracy and better linearity; better long-term stability and repeatability; no cold-junction compensation needed; stronger signal and less noise; ideal for precise measurement in the range about -200 to 600 °C. (Thermocouples are cheaper, faster and cover higher temperatures.)"""),
    saq(4, T, "Explain the concept of gain scheduling in process control and give one example where it is used.",
        [("Concept: controller parameters changed according to operating condition (scheduling variable) for nonlinear processes", 3), ("Example: pH control, level in conical tank, boiler at different loads, aircraft, valve with nonlinear characteristic", 2)],
        """Many processes are nonlinear: their gain, time constant or dead time change with operating point, so one set of PID settings is good at one load but sluggish or oscillatory at another. In gain scheduling, the controller parameters (gain, integral and derivative times) are changed automatically according to a measured scheduling variable (e.g. load, flow, level or set point), using a table of tunings found for different operating regions, with smooth interpolation between them.
Example: pH neutralisation, where process gain is very high near pH 7 and low far from it - lower controller gain is used near neutrality. Others: level control in a conical or spherical tank (gain varies with level), boiler or turbine control at different loads, and aircraft autopilots at different speeds and altitudes."""),
]
C1 = """Case I: Temperature control of a jacketed mixing tank
A food plant uses a jacketed mixing tank to heat a product to 70.0 °C. The control system has:
- A Pt100 RTD (3-wire) measuring product temperature, wired to a temperature transmitter (4-20 mA).
- A control valve actuated by an I/P converter (4-20 mA → 3-15 psi) controlling steam to the jacket.
- A PLC performing a single-loop PID (temperature control).
- Typical operating point: valve opening about 0.35 (35% fraction); product flow and feed composition are roughly steady.
During commissioning the following observations and test data were recorded:
1. The RTD/transmitter shows +0.6 °C higher than a calibrated reference thermometer at 70.0 °C.
2. A step test on valve opening from 0.30 → 0.40 (Δu = 0.10) produced a delayed rise in product temperature with approximately first-order-plus-dead-time (FOPDT) behaviour: steady change ΔT∞ = +3.0 °C, apparent time constant τ = 120 s and dead time θ = 8 s.
3. The I/P response test shows outputs slightly nonlinear near the low end (3-5 psi) but approximately linear over most of the span.
4. Operators report: when the set point is 70.0 °C, temperature oscillates between 68.5 and 71.5 °C; when the set point is raised to 71.0 °C the rise is slow, and it sometimes overshoots by 1.2 °C on cooling when the set point is reduced."""
C2 = """Case II: Batch reactor sequence control
A chemical plant uses a batch reactor to produce a specialty polymer. The process involves the following steps controlled by a PLC/DCS system:
1. Charging: raw materials are charged into the reactor.
2. Heating: reactor temperature is raised from ambient to 150 °C.
3. Reaction: maintain temperature at 150 °C for 2 hours.
4. Cooling: cool the reactor down to 50 °C.
5. Discharge: product is discharged from the reactor.
The PLC/DCS program must manage the following inputs and outputs:
Inputs: Start pushbutton; Emergency stop (E-Stop); temperature sensor (RTD) feedback; level sensor for charging and discharge confirmation; heater status (on/off); cooling valve position feedback.
Outputs: charging valve control; heater on/off; cooling valve actuator; discharge valve control; alarm indicator."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("ice2025", 1, T, C1, items=[
    it("1. List six likely causes (control, instrumentation and process) for the observed oscillations, slow rise and overshoots. For each cause give a one-line explanation. Give one priority corrective action you would do first and why.", 12,
       [("Six plausible causes with one-line explanations (1.5 each): aggressive gain / too short integral time, integral windup, dead time, valve stiction/hysteresis or I/P nonlinearity, sensor bias/lag (thermowell), noise with derivative, steam pressure fluctuation, poor mixing", 9), ("Priority action with justification (e.g. retune PID from FOPDT model, check valve stiction first)", 3)],
       """1. PID too aggressive (high gain or short integral time) for the process - causes sustained oscillation of ±1.5 °C. 2. Integral windup during large set-point changes - integral term keeps pushing, giving overshoot. 3. Dead time (8 s) plus sensor lag (RTD in thermowell) - delays feedback and reduces stability margin. 4. Control valve stiction/hysteresis or I/P nonlinearity at low openings - causes stick-slip limit cycles. 5. Transmitter bias (+0.6 °C) and noise amplified by derivative action - wrong measurement and jittery valve. 6. Steam supply pressure fluctuations or poor mixing in the tank - disturbance and uneven temperature. (Also: valve oversized so operation near 30-40% with high gain; slow cooling as process is asymmetric - heating by steam, cooling only by losses.)
Priority action: first retune the PID using the step-test FOPDT model (K = 3.0/0.10 = 30 °C per unit, τ = 120 s, θ = 8 s), e.g. with IMC/lambda tuning, add anti-windup and set-point ramping - because the measured process is easy to control (θ/τ ≈ 0.07), so the oscillation is most likely caused by poor tuning, and retuning is cheap, quick and safe. (Check valve stiction with a bump test at the same time.)"""),
    it("""2. Sensor calibration and its effect
(i) Compute the Pt100 resistance at 70.0 °C (use R0 = 100 Ω, α = 0.00385 Ω/Ω/°C).
(ii) Compute the resistance error corresponding to the +0.6 °C transmitter bias.
(iii) Explain qualitatively how this +0.6 °C bias affects the control loop behaviour.""", 12,
       [("(i) R = 100(1 + 0.00385 x 70) = 126.95 Ω", 4), ("(ii) ΔR = 100 x 0.00385 x 0.6 = 0.231 Ω (reads as 127.18 Ω)", 4), ("(iii) Bias makes controller hold actual product 0.6 °C lower (69.4 °C); offset not oscillation; quality/safety effect; fix by calibration/trim", 4)],
       """(i) R70 = R0 (1 + αT) = 100 x (1 + 0.00385 x 70.0) = 100 x 1.2695 = 126.95 Ω.
(ii) ΔR = R0 x α x ΔT = 100 x 0.00385 x 0.6 = 0.231 Ω; i.e. the transmitter behaves as if it saw 127.18 Ω (equivalent to 70.6 °C).
(iii) The controller acts on the measured value, so with a +0.6 °C bias it holds the measured temperature at 70.0 °C while the actual product is about 69.4 °C - a steady offset in the true temperature that may affect product quality or pasteurisation. It does not cause the oscillation (a constant bias does not change loop gain or dynamics), but it shifts the whole operating point and makes the ±0.5 °C target meaningless relative to the true value. Correct it by calibrating/trimming the transmitter (or applying an offset in the PLC) against the reference thermometer, and check the 3-wire lead compensation."""),
    it("""3. I/P nonlinearity and valve
(i) Explain how moderate I/P nonlinearity near low pressure (3-5 psi) would affect small-signal control around low valve openings.
(ii) Propose two practical fixes (one instrumentation fix, one control/software fix) and explain the expected benefit.""", 12,
       [("(i) Local gain varies (lower/higher), dead band, hysteresis; controller tuned for linear range becomes sluggish or oscillatory near low openings; limit cycles; poor small corrections", 6), ("(ii) Instrumentation fix: valve positioner/ recalibrate or replace I/P, resize valve so operating point is mid-range", 3), ("Software fix: characterisation/linearisation curve in PLC or gain scheduling", 3)],
       """(i) Near 3-5 psi the I/P output does not change in proportion to the controller output, so the effective loop gain changes: small controller moves may produce too little (dead-band-like) or too much valve movement. A PID tuned for the linear region becomes sluggish (low gain) or oscillatory (high gain) there; together with valve friction this can create limit cycles and poor fine control at low openings (at low load or during cooling/start-up).
(ii) Instrumentation fix: fit a smart valve positioner (closed-loop on actual stem position) or recalibrate/replace the I/P, and if needed resize/trim the valve so the normal operating point is in the linear mid-range - benefit: valve position follows the controller output accurately and repeatably. Control/software fix: add a characterisation (linearising) function in the PLC that inverts the measured I/P curve, or use gain scheduling of the PID at low output - benefit: constant effective loop gain over the whole span, so the same tuning works at all openings."""),
    it("4. Validation test and performance check: design a short validation test plan (3 steps) to confirm the loop meets ±0.5 °C stability around 70.0 °C after you apply your fixes/tuning. For each step state the purpose, action, expected result and what you will measure.", 14,
       [("Step 1: sensor/valve check (calibration vs reference, valve stroke test) - purpose, action, expected, measure", 4), ("Step 2: steady-state stability at 70 °C for a period - measure deviation, valve movement", 5), ("Step 3: set-point step and disturbance test - overshoot, settling time, recovery", 5)],
       """Step 1 - Instrument check. Purpose: confirm measurement and final element are correct. Action: compare the RTD/transmitter with the calibrated reference at 70 °C after calibration; stroke the valve 0-100% and small 1-2% steps around 35%. Expected: agreement within ±0.1-0.2 °C; valve moves smoothly with no stiction and linear response. Measure: temperature difference, valve position vs output, dead band.
Step 2 - Steady-state stability test. Purpose: verify ±0.5 °C at set point under normal load. Action: run in automatic at SP 70.0 °C for at least 30-60 min (several time constants) with normal flow. Expected: PV within 69.5-70.5 °C, no sustained oscillation. Measure: max/min deviation, standard deviation, valve output variation (trend recording).
Step 3 - Set-point and disturbance response. Purpose: check dynamic performance and robustness. Action: step SP 70 → 71 → 70 °C, and apply a disturbance (e.g. 10% change in product flow or steam pressure). Expected: settles within ±0.5 °C in a few minutes, overshoot <0.5 °C, no windup, quick recovery from disturbance. Measure: rise time, overshoot, settling time, IAE, maximum deviation. Document results and sign off."""),
])
Q += case("ice2025", 2, T, C2, items=[
    it("1. Draw a block diagram of the batch reactor process control system showing major inputs, outputs, sensors and actuators.", 10,
       [("Central PLC/DCS controller block with HMI", 2), ("Inputs shown: Start, E-Stop, RTD (via transmitter), level sensor, heater status, cooling valve feedback", 3), ("Outputs/actuators: charging valve, heater, cooling valve, discharge valve, alarm", 3), ("Reactor with sensors and actuators connected, signal directions/arrows clear", 2)],
       "Diagram: a central PLC/DCS block (with HMI/operator station). Inputs on the left with arrows into the controller: Start pushbutton, E-Stop (hard-wired), RTD → temperature transmitter (4-20 mA), level sensor/switches, heater status contact, cooling valve position feedback. Outputs on the right with arrows from the controller to actuators: charging valve, heater contactor (on/off), cooling valve actuator, discharge valve, alarm horn/lamp. The reactor vessel is drawn in the middle with the charging line and valve at the top, heater and cooling jacket around it, RTD and level sensor in the vessel, and discharge valve at the bottom, each connected to the corresponding input/output."),
    it("2. Write a high-level logic sequence for the batch process, explaining each step's control action in the PLC/DCS program.", 10,
       [("Idle/permissives: E-Stop healthy, valves closed, sensors OK, Start pressed", 2), ("Charging: open charging valve until level high, close, confirm", 2), ("Heating to 150 °C (heater on, PID/on-off), transition at 150", 2), ("Reaction hold 2 h with temperature control; cooling to 50 °C via cooling valve, heater off", 2), ("Discharge until level low, close valve, batch complete, count, reset; alarms throughout", 2)],
       """Step 0 Idle: check permissives - E-Stop released, all valves closed, heater off, RTD and level signals healthy; wait for Start.
Step 1 Charging: open charging valve; when level sensor reaches charge level, close it (alarm if not reached within a time limit).
Step 2 Heating: heater ON (temperature controller with set point 150 °C, cooling valve closed); when T ≥ 150 °C go to step 3; alarm if heating takes too long or overshoots a high limit.
Step 3 Reaction: hold 150 °C ±tolerance by switching/controlling the heater; start 2-hour timer; when done, go to step 4.
Step 4 Cooling: heater OFF, open cooling valve (confirm by position feedback); when T ≤ 50 °C, close cooling valve.
Step 5 Discharge: open discharge valve until level low/empty confirmed, then close it.
Step 6 Complete: increment batch counter, record batch data, reset sequence to Idle. Any fault or E-Stop sends the sequence to a safe hold state with alarm."""),
    it("3. Explain how you would implement safety interlocks in the PLC program to handle emergency stop and sensor failures.", 10,
       [("E-Stop: hard-wired, normally-closed, safety relay cuts heater and closes valves; PLC latches stop state, manual reset required", 3), ("Sensor failure detection: RTD open/short/out of range, 4-20 mA <3.6 or >21 mA, level sensor disagreement, valve feedback mismatch, heater status mismatch with timers", 4), ("Fail-safe actions: heater off, cooling on if overtemperature, hold sequence, alarm; high-temperature independent trip; bypass control/ permissives", 3)],
       "E-Stop: wired as a normally-closed contact through a safety relay that directly de-energises the heater contactor and closes the charging/discharge valves independently of the PLC; the PLC also reads it, latches an emergency state, stops the sequence and sounds the alarm; restart only after the E-Stop is reset and the operator acknowledges. Sensor failures: monitor the RTD signal for open/short or out-of-range values (<3.6 mA or >21 mA, rate-of-change limits); compare output commands with feedback (heater status, cooling valve position) using discrepancy timers; check that the level changes as expected during charging/discharge. Actions on fault: fail-safe outputs - heater OFF, and if overtemperature, open cooling; hold the step; raise alarms; prevent moving to the next step until healthy. Add an independent high-high temperature switch that trips the heater, design outputs to fail safe on loss of power, and protect interlocks from bypass (password, logging)."),
    it("4. Describe how the PLC/DCS can use timers and counters to control the reaction hold time and the batch count.", 10,
       [("Hold time: retentive timer (RTO/TON) preset 2 h = 7200 s, enabled only when T within band; pause/hold behaviour on deviation", 5), ("Batch count: CTU incremented at end of each batch (rising edge), preset target, reset, stored for reports; step watchdog timers", 5)],
       "Reaction hold time: when the reactor reaches 150 °C in step 3, enable a timer with preset 2 h (7200 s). A retentive timer (RTO) is best: it accumulates time only while the temperature is within the allowed band (e.g. 148-152 °C) and pauses (without resetting) if the temperature drops out, so the batch gets a full 2 hours at temperature; its done bit moves the sequence to cooling, then it is reset. Timers are also used as watchdogs for each step (e.g. alarm if charging or heating takes too long) and for delays (valve travel). Batch count: an up-counter (CTU) is incremented by a one-shot (rising edge) when step 6 'batch complete' is reached; its accumulated value shows batches produced, and a preset can stop production or request maintenance after a target number of batches; it is reset by the operator or at the shift/day change, and the value is logged to the HMI/historian."),
    it("5. Discuss the advantages of using a DCS over a PLC for this batch reactor process, and situations where a PLC might be preferred.", 10,
       [("DCS advantages: integrated HMI, historian, alarm management, built-in batch management (ISA-88), recipes, many PID loops, redundancy, plant-wide", 6), ("PLC preferred: small/stand-alone unit, fast discrete logic, lower cost, simpler maintenance, packaged equipment", 4)],
       "Advantages of a DCS: integrated engineering, operator HMI, alarm management and historian in one system; built-in batch management (ISA-88 recipes, phases, batch records and reports) suited to specialty polymer production; strong continuous/regulatory control with many PID loops and advanced control; high availability with redundant controllers, networks and I/O; easier plant-wide expansion and coordination of several reactors. A PLC may be preferred for a small, stand-alone reactor or packaged skid with mostly discrete on/off logic; when cost and budget are limited; when fast scan times for interlocks are needed; when local technicians are familiar with PLCs; or as part of a hybrid (PLC for equipment control, SCADA for supervision)."),
])
PATTERN = STANDARD
