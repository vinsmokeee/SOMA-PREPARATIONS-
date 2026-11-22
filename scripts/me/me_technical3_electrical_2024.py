"""ME Technical Paper III (Subject Specialisation Paper), Electrical Engineering, BCSE 2024 - real paper (PDF sent by the founder).
Standard pattern, same as the 2025 Electrical Engineering paper (the latest). MCQs 4 and 13 are word-for-word 2025
MCQs, so they are not loaded again (year 2024 recorded on the 2025 questions: supabase/data/me_technical3_repeats_2024_batch7.sql). Figures: MCQs 1, 15, 16 and
Part II questions 2 and 4 (public/papers/me/tech3-ee-2024-*.png). Case II question 1 (name of Bhutan's wiring regulation)
is FLAGGED for an expert: the exact title could not be confirmed.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1"
GROUP_TAG = "ee2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "electrical-engineering-2025"
ADDS_TO_PAPER = True  # 2025 is the latest Electrical Engineering paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Electrical Engineering"

MCQ = r"""[
{
"n": 1,
"stem": "For the closed loop system shown, the transfer function E(s)/R(s) is:",
"opts": [
"G/(1+GH)",
"GH/(1+GH)",
"1/(1+GH)",
"1/(1+G)"
],
"image": "/papers/me/tech3-ee-2024-mcq1.png"
},
{
"n": 2,
"stem": "Calculate the zeros and poles of the transfer function G(s) = 5(s+2)/(s² + 3s + 2), given as zero, (poles):",
"opts": [
"-2, (-1, -2)",
"2, (-1, 2)",
"2, (1, 2)",
"-2, (1, -2)"
]
},
{
"n": 3,
"stem": "The most powerful controller is:",
"opts": [
"PD controller",
"PI Controller",
"PID Controller",
"None of the above"
]
},
{
"n": 4,
"stem": "The Nyquist sampling rate is given by:",
"opts": [
"Fs = 2 Fm",
"Fs = 3 Fm",
"Fs = 4 Fm",
"Fs = Fm"
]
},
{
"n": 5,
"stem": "In a JK flip-flop, what happens when both J and K inputs are 1?",
"opts": [
"No change",
"Set",
"Reset",
"Toggle"
]
},
{
"n": 6,
"stem": "Convert the 127 decimal number into binary:",
"opts": [
"1100111",
"1111111",
"1111011",
"111111"
]
},
{
"n": 7,
"stem": "Charge stores in:",
"opts": [
"Resistor",
"Capacitor",
"Diode",
"Transistor"
]
},
{
"n": 8,
"stem": "For a frequency of 200 Hz, the time period will be:",
"opts": [
"0.005 S",
"0.5 S",
"0.0005 S",
"0.05 S"
]
},
{
"n": 9,
"stem": "When the gate signal from a thyristor is removed, it will remain in its forward conduction mode. This characteristics of thyristor is called…:",
"opts": [
"get-on",
"off-blocking",
"ever conducting",
"latching"
]
},
{
"n": 10,
"stem": "Which semiconductor power device, out of the following is not a current triggered device:",
"opts": [
"Thyristor",
"GTO",
"TRIAC",
"MOSFET"
]
},
{
"n": 11,
"stem": "You need to design a DC-DC converter to power a 5V microcontroller from a 9V battery. Which type of converter would be most suitable?",
"opts": [
"Buck Converter",
"Boost Converter",
"Buck-Boost Converter",
"Flyback Converter"
]
},
{
"n": 12,
"stem": "Linear Variable Differential Transformer has:",
"opts": [
"One primary coil and two secondary coils",
"Two primary coils and one secondary coil",
"One primary coil and one secondary coil",
"Two primary coils and two secondary coils"
]
},
{
"n": 13,
"stem": "A voltmeter is connected in a ……….with the circuit component across which potential difference is to be measured:",
"opts": [
"Parallel",
"Series",
"Series or parallel",
"None of the above"
]
},
{
"n": 14,
"stem": "Which of the following is a disadvantage of a proportional-only controller?",
"opts": [
"It cannot respond to changes in the setpoint",
"It cannot measure the process variable",
"It can result in a steady-state error",
"It is too complex to implement"
]
},
{
"n": 15,
"stem": "For the circuit shown (10 V DC source in series with a 5 Ω resistor and a 1 F capacitor), determine the steady-state current I flowing through the 5 Ω resistance:",
"opts": [
"2 A",
"0",
"0.5 A",
"20 A"
],
"image": "/papers/me/tech3-ee-2024-mcq15.png"
},
{
"n": 16,
"stem": "A network of resistors is connected as shown. Compute the equivalent resistance of the network:",
"opts": [
"7 Ω",
"8 Ω",
"23 Ω",
"22 Ω"
],
"image": "/papers/me/tech3-ee-2024-mcq16.png"
},
{
"n": 17,
"stem": "When short circuit occurs, current flow in circuit will be:",
"opts": [
"Zero",
"Very low",
"Normal",
"Infinite"
]
},
{
"n": 18,
"stem": "For a synchronous generator connected to a power station, increase in excitation will:",
"opts": [
"Decrease reactive power generation",
"Increase reactive power generation",
"Decrease active power generation",
"Increase active power generation"
]
},
{
"n": 19,
"stem": "Length of the cable is doubled, its capacitance C will be:",
"opts": [
"Doubled",
"One-half",
"One-fourth",
"Unchanged"
]
},
{
"n": 20,
"stem": "In an interconnected power system, what is the effect of a large increase in load on system frequency?",
"opts": [
"Increase in frequency",
"Decrease in frequency",
"No change in frequency",
"Oscillations in frequency"
]
},
{
"n": 21,
"stem": "A 800 kV transmission line has a maximum power transfer capacity of P. If it is operated at 400 kV with the series reactance unchanged, the new maximum power transfer capacity is approximately:",
"opts": [
"P",
"2P",
"P/2",
"P/4"
]
},
{
"n": 22,
"stem": "High voltage transmission line are transposed because:",
"opts": [
"Corona loss can be minimized",
"Computation of inductance becomes easier",
"Voltage drop in the lines can be minimized",
"Phase voltage imbalance can be minimized"
]
},
{
"n": 23,
"stem": "A transformer has a primary voltage of 110 kV and a secondary voltage of 11kV. If the transformer is supplying 100 A on the secondary side, what is the current on the primary side, assuming no losses?",
"opts": [
"10 A",
"1000 A",
"11 A",
"12 A"
]
},
{
"n": 24,
"stem": "The rating of a circuit breaker is generally determined on the basis of:",
"opts": [
"Line-to-line fault current",
"Symmetrical fault current",
"Single line to ground fault current",
"Double line to ground fault current"
]
},
{
"n": 25,
"stem": "Steady state stability of a power system is the ability of a power system to:",
"opts": [
"Maintain voltage at the rated voltage level",
"Maintain frequency exactly at 50 Hz",
"Maintain spinning reserves margin at all time",
"Maintain synchronism between machines and on external tie lines"
]
},
{
"n": 26,
"stem": "Buses for load flow studies are classified as (i) load bus, (ii) generator bus and (iii) slack bus. The correct quantities specified for (load bus; generator bus; slack bus) are:",
"opts": [
"P, |V|; P, Q; P, δ",
"P, Q; P, |V|; |V|, δ",
"|V|, Q; P, δ; P, Q",
"P, δ; |V|, Q; Q, δ"
]
},
{
"n": 27,
"stem": "A 6 pole, 50 Hz, 3-phase induction motor has a full load slip of 3%, what is the rotor speed at full load?",
"opts": [
"950 r.p.m.",
"970 r.p.m.",
"980 r.p.m.",
"1000 r.p.m"
]
},
{
"n": 28,
"stem": "An under-excited synchronous motor behaves as:",
"opts": [
"A resistor",
"An inductor",
"A capacitor",
"None of the above."
]
},
{
"n": 29,
"stem": "The field winding of an alternator is:",
"opts": [
"d.c. excited",
"a.c. excited",
"both d.c. and a.c. excited",
"none of the above."
]
},
{
"n": 30,
"stem": "The nameplate of a motor gives power = 15 kW and efficiency = 0.9. Using a power meter, the actual three-phase power drawn is found to be 8 kW. Find the loading of the motor.",
"opts": [
"48%",
"49%",
"50%",
"55%"
]
}
]"""

KEY = {
    1: ("c", "E = R - HC and C = GE, so E(1 + GH) = R and E/R = 1/(1 + GH)."),
    2: ("a", "Zero where s + 2 = 0: s = -2. Poles: s² + 3s + 2 = (s + 1)(s + 2) = 0, so s = -1 and -2."),
    3: ("c", "PID combines proportional, integral (removes steady-state error) and derivative (improves stability and speed) action."),
    5: ("d", "With J = K = 1 the JK flip-flop toggles on each clock pulse."),
    6: ("b", "127 = 64 + 32 + 16 + 8 + 4 + 2 + 1 = 1111111 (binary)."),
    7: ("b", "A capacitor stores electric charge (Q = CV)."),
    8: ("a", "T = 1/f = 1/200 = 0.005 s."),
    9: ("d", "Once the anode current exceeds the latching current, the thyristor stays on without gate signal - latching."),
    10: ("d", "A MOSFET is voltage controlled at the gate; thyristor, GTO and TRIAC are current triggered."),
    11: ("a", "A buck converter steps a DC voltage down, here 9 V to 5 V, efficiently."),
    12: ("a", "An LVDT has one primary winding and two secondary windings connected in series opposition."),
    14: ("c", "Proportional-only control leaves a steady-state error (offset)."),
    15: ("b", "With a DC source, the capacitor charges fully and blocks current: steady-state current = 0."),
    16: ("b", "6||6 = 3 Ω, 4||4 = 2 Ω; series total = 3 + 2 + 2 + 1 = 8 Ω."),
    17: ("d", "A short circuit has (ideally) zero impedance, so the current becomes very large - theoretically infinite."),
    18: ("b", "Raising the excitation of a grid-connected generator increases its reactive power output; active power depends on the prime mover."),
    19: ("a", "Cable capacitance is proportional to length, so doubling the length doubles C."),
    20: ("b", "A sudden load increase exceeds generation, generators slow down and frequency falls until governors respond."),
    21: ("d", "Pmax = V²/X (Vs Vr/X); halving the voltage gives one quarter: P/4."),
    22: ("d", "Transposition equalises the inductance and capacitance of the phases, reducing voltage unbalance (and interference)."),
    23: ("a", "Turns ratio 110/11 = 10, so primary current = 100/10 = 10 A."),
    24: ("b", "Breaking capacity is based on the symmetrical three-phase fault current at the location."),
    25: ("d", "Steady-state stability is the ability to keep the machines in synchronism after small, gradual changes."),
    26: ("b", "Load bus: P and Q specified; generator (PV) bus: P and |V|; slack bus: |V| and δ."),
    27: ("b", "Ns = 120 x 50/6 = 1000 rpm; N = 1000 x (1 - 0.03) = 970 rpm."),
    28: ("b", "An under-excited synchronous motor draws lagging current, behaving like an inductor."),
    29: ("a", "The field winding of an alternator is excited by direct current."),
    30: ("a", "Output = 8 x 0.9 = 7.2 kW; loading = 7.2/15 = 48%."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T)

SA = [
    ("Consider a circuit with three inputs (A, B, C) and an output Y. An XOR gate takes inputs A and B, and an AND gate takes the output of the XOR gate and input C. What will be the output Y for all possible input combinations of A, B and C? Construct the truth table.", None,
     [("Expression Y = (A ⊕ B)·C", 1), ("Truth table for all 8 combinations correct: Y = 1 only for A B C = 0 1 1 and 1 0 1", 4)],
     "The output is Y = (A ⊕ B) · C: it is 1 only when A and B are different and C = 1.\nA B C | A⊕B | Y\n0 0 0 | 0 | 0\n0 0 1 | 0 | 0\n0 1 0 | 1 | 0\n0 1 1 | 1 | 1\n1 0 0 | 1 | 0\n1 0 1 | 1 | 1\n1 1 0 | 0 | 0\n1 1 1 | 0 | 0\nSo Y = 1 for (A, B, C) = (0, 1, 1) and (1, 0, 1), and 0 for all other combinations."),
    ("Answer the following questions (see figure (a) and (b)):\na) Write the mesh equations using KVL for the circuit in figure (a). (2 marks)\nb) Use Thevenin's theorem to find the current through the 5 Ω resistance in the circuit in figure (b). (3 marks)", "/papers/me/tech3-ee-2024-saq2.png",
     [("a) Mesh 1: Vs = I1(R1 + R2) - I2 R2; Mesh 2: 0 = I2(R2 + R3) - I1 R2", 2),
      ("b) Remove 5 Ω: Vth = 10 x 20/(10 + 20) = 6.67 V; Rth = (10 || 20) + 15 = 21.67 Ω; I = 6.67/(21.67 + 5) = 0.25 A", 3)],
     "a) Taking clockwise mesh currents I1 (left mesh) and I2 (right mesh): Mesh 1: Vs - I1 R1 - (I1 - I2) R2 = 0, i.e. Vs = I1 (R1 + R2) - I2 R2. Mesh 2: -(I2 - I1) R2 - I2 R3 = 0, i.e. 0 = -I1 R2 + I2 (R2 + R3).\nb) Remove the 5 Ω load between A and B. Thevenin voltage: with no current in the 15 Ω resistor, VAB equals the voltage across the 20 Ω resistor: Vth = 10 x 20/(10 + 20) = 6.67 V. Thevenin resistance (source shorted): Rth = (10 || 20) + 15 = 6.67 + 15 = 21.67 Ω. Current through 5 Ω: I = Vth/(Rth + 5) = 6.67/26.67 = 0.25 A."),
    ("Answer the following questions:\na) Write the differences between an induction motor and a synchronous motor. (2.5 marks)\nb) Why can a 3-phase induction motor not run at synchronous speed? (2.5 marks)", None,
     [("a) Speed: induction runs below Ns (slip), synchronous at Ns constant; excitation: induction single (AC) supply, synchronous needs DC field; starting: induction self-starting, synchronous not; pf: induction lagging, synchronous adjustable (leading/lagging); cost/ use", 2.5),
      ("b) Torque needs relative motion: at Ns no relative speed between rotating field and rotor, no emf/ current induced in rotor, no torque; so rotor always slips behind", 2.5)],
     "a) Differences: (1) Speed - an induction motor runs slightly below synchronous speed (with slip) and its speed falls with load; a synchronous motor runs exactly at synchronous speed at all loads. (2) Excitation - the induction motor is singly excited (AC to the stator only); the synchronous motor is doubly excited (AC stator, DC rotor field). (3) Starting - the induction motor is self-starting; the synchronous motor is not and needs damper windings or another starting method. (4) Power factor - the induction motor always works at lagging power factor; the synchronous motor's power factor can be made lagging, unity or leading by changing excitation (synchronous condenser). (5) Cost and use - induction motors are cheaper, simpler and robust for general drives; synchronous motors are used for constant speed and power-factor correction.\nb) Torque in an induction motor is produced by currents induced in the rotor by the relative motion between the rotating magnetic field and the rotor conductors. If the rotor reached synchronous speed there would be no relative motion, so no emf, no rotor current and no torque; the rotor would slow down. Therefore it always runs below synchronous speed, with a small slip."),
    ("The system shown in the figure is initially on no load with the generators at rated voltage and their emfs in phase. The ratings and percentage reactances of the generators and the transformer are marked on the diagram; resistances are neglected. The line impedance is j160 Ω. A three-phase balanced fault occurs at the receiving end of the transmission line. Determine the short-circuit current and the short-circuit MVA.", "/papers/me/tech3-ee-2024-saq4.png",
     [("Base 100 MVA, 30 kV/ 400 kV: G1 0.24 x 100/60 = 0.4 pu; G2 0.24 x 100/40 = 0.6 pu; parallel 0.24 pu; transformer 0.16 pu", 2),
      ("Line base Z = 400²/100 = 1600 Ω; j160 = 0.1 pu; total X = 0.5 pu", 1),
      ("Isc = 1/0.5 = 2 pu; Ibase = 100 MVA/(√3 x 400 kV) = 144.3 A → Isc ≈ 289 A; SC MVA = 100/0.5 = 200 MVA", 2)],
     "Choose base 100 MVA, 30 kV on the generator side and 400 kV on the line. Generator 1: X = 0.24 x 100/60 = 0.40 pu. Generator 2: X = 0.24 x 100/40 = 0.60 pu. In parallel: 0.40 x 0.60/(0.40 + 0.60) = 0.24 pu. Transformer: 0.16 pu (already on 100 MVA). Line: base impedance = 400²/100 = 1600 Ω, so X = 160/1600 = 0.10 pu. Total reactance to the fault = 0.24 + 0.16 + 0.10 = 0.50 pu. Fault current = 1.0/0.50 = 2.0 pu; base current at 400 kV = 100 x 10⁶/(√3 x 400 x 10³) = 144.3 A, so Isc = 2 x 144.3 ≈ 289 A (at 400 kV). Short-circuit MVA = base MVA/X = 100/0.50 = 200 MVA."),
]
for i, (s, img, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=5, topic=T, stem=s, key_points=kp, model=mod, issues=[], image=img))

C1 = """Case I: Power evacuation for the Parochhu Integrated Multipurpose Hydropower Project
You are an electrical engineer in the Department of Energy, Ministry of Energy and Natural Resources. The Department is carrying out a feasibility study for a potential Integrated Multipurpose Hydropower Project (IMHP) in Tsento Gewog, Paro (intake about 45 minutes' walk from the road head at Shana). Salient features:
- Full reservoir level 2934 m; tail race outfall (TRT) 2715 m; river bed level 2929 m; powerhouse ground 2720 m; raised weir 5 m.
- Gross head 219 m; total head loss 10.95 m; net head 208.05 m; g = 9.81 m/s².
- Combined efficiency 0.906; environmental flow (E-flow) 0.32 cumec; design discharge 19.55 cumec; average lean-season flow in a 90% dependable year 2.53 cumec.
The power is to be pooled at the Olathang substation, 30 km from the pothead yard, and you must design the power evacuation arrangement."""
C2 = """Case II: Safe electrical installations in buildings
Accurate design of electrical installations in buildings prevents short circuits, overloading and other faults that cause fires. It involves selecting appropriate materials, following correct installation procedures and keeping to safety standards and regulations, so that exposed wires, faulty connections and inadequate earthing are avoided. In Bhutan a significant number of house fires are blamed on electrical faults. As an electrical engineer, answer the following."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("ee2024", 1, T, C1, items=[
    it("1. Calculate the installed capacity of the plant.", 2,
       [("P = ρ g Q H η = 1000 x 9.81 x 19.55 x 208.05 x 0.906 W ≈ 36.15 MW (≈ 36 MW installed)", 2)],
       "P = ρ g Q Hnet η = 1000 x 9.81 x 19.55 x 208.05 x 0.906 W = 36.15 x 10⁶ W ≈ 36 MW installed capacity (for example 2 x 18 MW units)."),
    it("2. Using this installed capacity, calculate the economical transmission voltage for a 3-phase AC system. Considering technical and economic factors, propose an appropriate voltage level and justify your choice.", 5,
       [("Still's formula V = 5.5 √(0.62 L + 3P/150), L = 30 km, P = 36 150 kW → ≈ 150 kV", 2),
        ("Propose standard 132 kV (Bhutan standard levels 66/132/220/400 kV); justification: losses, voltage regulation, capacity margin, future expansion, cost of line and substations; note Olathang is 66 kV - needs 132/66 kV transformation or alternative 66 kV double circuit compared economically", 3)],
       "Still's formula: V (kV) = 5.5 √(0.62 L + 3P/150), with L = 30 km and P = 36 150 kW: V = 5.5 √(18.6 + 723) = 5.5 x 27.2 ≈ 150 kV. The nearest standard voltage used in Bhutan (66, 132, 220, 400 kV) is 132 kV. Justification: at 132 kV the line current for 36 MW is only about 170 A, so I²R losses and voltage drop over 30 km are low; one single-circuit line has capacity for the plant with a margin for future units or nearby projects; insulation and tower costs are moderate compared with 220 kV. Because the Olathang substation is a 66/33 kV substation, the 132 kV option needs a 132/66 kV transformer bay there (or upgrading the substation); the alternative is a 66 kV double-circuit line directly into the 66 kV bus. The final choice should compare the cost of line, transformers and losses over the project life; 132 kV is proposed for lower losses and future expansion, with a cost check against 66 kV. [Expert: confirm against BPC/DGPC grid plans.]"),
    it("3. Assuming a catchment area of 613 km², average annual rainfall of 100 cm and 30% evaporation loss, calculate the average power that can be generated.", 5,
       [("Runoff volume = 613 x 10⁶ m² x 1.0 m x 0.7 = 429.1 x 10⁶ m³/year", 2),
        ("Average flow = 429.1 x 10⁶/(365 x 24 x 3600) = 13.6 m³/s", 1),
        ("Average power = 9.81 x 13.6 x 208.05 x 0.906 ≈ 25.2 MW (≈ 24.6 MW after releasing 0.32 cumec E-flow)", 2)],
       "Annual rainfall volume on the catchment = 613 x 10⁶ m² x 1.0 m = 613 x 10⁶ m³; after 30% evaporation loss the runoff is 0.7 x 613 x 10⁶ = 429.1 x 10⁶ m³ per year. Average flow = 429.1 x 10⁶/(365 x 24 x 3600) = 13.6 m³/s. Average power = ρ g Q H η = 1000 x 9.81 x 13.6 x 208.05 x 0.906 ≈ 25.2 MW. If the E-flow of 0.32 m³/s must be released, Q = 13.29 m³/s and the average power ≈ 24.6 MW - well below the 36 MW installed capacity, showing the effect of reduced rainfall."),
    it("4. What do you understand by E-flow and IMHP?", 3,
       [("E-flow: minimum environmental flow released downstream of the dam/ weir to sustain river ecology, aquatic life and downstream users (here 0.32 cumec)", 1.5),
        ("IMHP: Integrated Multipurpose Hydropower Project - storage/ hydropower project designed to give several benefits besides power: water supply, irrigation, flood control, recreation, drought resilience", 1.5)],
       "Environmental flow (E-flow) is the minimum quantity of water that must be released downstream of a dam or weir at all times to keep the river ecosystem healthy - aquatic life, water quality and downstream users and religious/cultural needs - here 0.32 m³/s. An Integrated Multipurpose Hydropower Project (IMHP) is a project, usually with storage, planned to provide several benefits together: electricity generation plus drinking water supply, irrigation, flood and drought management, and sometimes recreation and tourism - for example supplying water to Paro while generating power."),
    it("5. For a 3-phase overhead line with ACSR conductors of 15 mm diameter placed at the corners of an equilateral triangle of side 1.5 m, calculate the inductance and capacitance per phase.", 4,
       [("Inductance: L = 2 x 10⁻⁷ ln(D/r'), r' = 0.7788 x 7.5 mm = 5.84 mm; L = 2 x 10⁻⁷ ln(1500/5.84) = 1.11 x 10⁻⁶ H/m = 1.11 mH/km", 2),
        ("Capacitance: C = 2πε₀/ln(D/r) = 55.6 x 10⁻¹²/ln(200) = 10.5 x 10⁻¹² F/m = 0.0105 µF/km (to neutral)", 2)],
       "r = 7.5 mm, D = 1500 mm (equilateral spacing, so D is the equivalent spacing). Inductance per phase: L = 2 x 10⁻⁷ ln(D/r') H/m, with r' = 0.7788 r = 5.84 mm: L = 2 x 10⁻⁷ x ln(1500/5.84) = 2 x 10⁻⁷ x 5.548 = 1.11 x 10⁻⁶ H/m = 1.11 mH/km (33.3 mH for 30 km). Capacitance per phase to neutral: C = 2πε₀/ln(D/r) = 2π x 8.854 x 10⁻¹²/ln(200) = 55.6 x 10⁻¹²/5.298 = 10.5 x 10⁻¹² F/m = 0.0105 µF/km (0.315 µF for 30 km)."),
    it("6. Olathang substation has 2 x 20 MVA, 66/33 kV transformers, three outgoing 33 kV feeders (Drugyel, Shaba and Tshongdu) and an incoming 66 kV single-circuit line from Jamjee; the Parochhu IMHP will also be connected. Draw the single line diagram of the substation showing the equipment for protection, measurement and communication.", 10,
       [("66 kV side: two incoming bays (Jamjee line, Parochhu IMHP line) each with lightning arrester, CVT (line/ PLCC), wave trap, line isolator with earth switch, SF6 circuit breaker, CTs; 66 kV bus (with bus PT)", 3),
        ("Two 66/33 kV, 20 MVA transformer bays: isolators, 66 kV breaker, CTs, LAs, transformer (with differential, Buchholz, OTI/ WTI, REF protection), 33 kV breaker, CTs", 3),
        ("33 kV bus with PT; three feeder bays (Drugyel, Shaba, Tshongdu) each with breaker (VCB), CTs, isolators, LA, energy meter, overcurrent/ earth-fault relays; station transformer", 2),
        ("Measurement/ communication: CT/PT metering, relays (distance for lines, OC/EF), SCADA/ RTU, PLCC/ OPGW fibre, battery and charger; neat labelled diagram", 2)],
       "The single line diagram should show: 66 kV side - (1) incoming bay from Jamjee and (2) incoming bay from Parochhu IMHP, each with lightning arresters at the entry, capacitive voltage transformer (for metering, protection and PLCC), wave trap (if PLCC is used), line isolator with earth switch, current transformers and SF6 circuit breaker, connected to a single (or main and transfer) 66 kV bus with a bus PT. Transformer bays - two 20 MVA, 66/33 kV transformers, each with 66 kV isolator and breaker, CTs, lightning arresters, the transformer itself (protected by differential, restricted earth fault, Buchholz, oil and winding temperature and pressure relief devices, plus backup overcurrent/earth fault), 33 kV CTs and breaker. 33 kV side - a 33 kV bus with bus PT, and three outgoing feeder bays (Drugyel, Shaba, Tshongdu), each with isolator, vacuum circuit breaker, CTs, lightning arrester, energy meter and overcurrent/earth-fault relays; plus a station service transformer. Measurement and communication: CTs and PTs feeding meters (kWh, kVArh, ammeters, voltmeters), distance/differential protection for the lines, a SCADA RTU/ substation automation linked to the load dispatch centre over PLCC or OPGW fibre, and DC batteries with chargers for protection and control."),
    it("7. A medium-voltage (MV) industry connected to this substation operates at an average power factor of 0.72 with an average demand of 627 kW.\n(i) Explain power factor with the help of a diagram. (5 marks)\n(ii) What are the methods of power factor improvement? (5 marks)\n(iii) The industry is charged a demand charge of Nu 170/kVA/month. What will be the monthly saving if the power factor is improved to 0.95, and how many kVAr are required? (5 marks)", 15,
       [("(i) pf = cos φ = kW/kVA; power triangle (kW, kVAr, kVA) and phasor diagram with lagging current; low pf means more current, losses, larger equipment", 5),
        ("(ii) Methods: static capacitor banks (fixed/ automatic APFC), synchronous condensers, phase advancers for induction motors, avoiding lightly loaded motors/ transformers, use of energy-efficient equipment", 5),
        ("(iii) kVA at 0.72 = 870.8; at 0.95 = 660.0; saving = 210.8 kVA x Nu 170 ≈ Nu 35 840/month; kVAr = 627 (tan 43.9° - tan 18.2°) = 627 (0.964 - 0.329) ≈ 398 kVAr", 5)],
       "(i) Power factor is the ratio of real power (kW) to apparent power (kVA): pf = kW/kVA = cos φ, where φ is the angle between voltage and current. In the power triangle, kW is the horizontal side, kVAr (reactive power) the vertical side and kVA the hypotenuse; in the phasor diagram an inductive load's current lags the voltage by φ. A low power factor means more current for the same useful power, so higher losses, voltage drop, larger cables and transformers, and higher demand charges.\n(ii) Methods: installing static capacitor banks (fixed, or automatic power factor correction panels switched in steps) close to the loads; synchronous condensers (over-excited synchronous motors); phase advancers for large induction motors; avoiding lightly loaded motors and transformers; and using efficient equipment and variable-speed drives with good power factor.\n(iii) kVA at 0.72 = 627/0.72 = 870.8 kVA; at 0.95 = 627/0.95 = 660.0 kVA. Reduction in demand = 210.8 kVA, so the monthly saving = 210.8 x 170 ≈ Nu 35 840. Required compensation: kVAr = P (tan φ1 - tan φ2) = 627 x (0.964 - 0.329) ≈ 398 kVAr (a capacitor bank of about 400 kVAr)."),
    it("8. Draw the zero-sequence equivalent circuits for the following transformer winding arrangements and comment on the zero-sequence currents:\n(i) Star-star with isolated neutrals. (2 marks)\n(ii) Star-star with one neutral grounded. (2 marks)\n(iii) Star-delta with the neutral grounded on the star side. (2 marks)", 6,
       [("(i) Y-Y isolated: open circuit on both sides - no zero-sequence current can flow", 2),
        ("(ii) Y-Y with one neutral grounded: still open between sides (the other neutral isolated) - zero-sequence current cannot flow through the transformer; grounded side has no return path through windings", 2),
        ("(iii) Yg-Δ: grounded star side connected to reference through Z0; delta side open to line - zero-sequence current circulates in the delta, flows in grounded star side but not into delta-side lines", 2)],
       "(i) Star-star, both neutrals isolated: there is no path for zero-sequence currents on either side, so the equivalent circuit is open between both terminals and the reference - no zero-sequence current flows.\n(ii) Star-star with only one neutral grounded: zero-sequence current needs a return path on both sides to flow through the transformer; with the other neutral isolated, the circuit is still open between the two sides, so no zero-sequence current flows through the transformer (the series path is broken).\n(iii) Grounded star-delta: on the star side the zero-sequence impedance Z0 is connected from the terminal to the reference bus, so zero-sequence current can flow in the grounded star winding; on the delta side the terminal is open (isolated from the reference), because the induced zero-sequence currents circulate inside the delta and do not leave it into the lines."),
])
Q += case("ee2024", 2, T, C2, items=[
    it("1. Name the regulation that governs electrical wiring systems and electrical installations in Bhutan.", 2,
       [("Names the applicable Bhutan regulation/ code for electrical installations (expert to confirm the exact title) and mentions the standards it follows (e.g. IS 732 / IEC)", 2)],
       "Electrical installations in Bhutan are regulated by the Bhutan Electricity Authority under the Electricity Act of Bhutan, through its regulations for electrical installations and wiring (and the Bhutan Building Rules for buildings), which follow Indian and IEC standards such as IS 732 (Code of practice for electrical wiring installations). [Expert: confirm the exact title of the current regulation.]"),
    it("2. What are the different types of routine inspection and test that need to be carried out as per the regulation?", 4,
       [("Visual inspection: workmanship, sizes, protective devices, earthing, labelling, polarity of switches in phase", 1),
        ("Insulation resistance test (megger) between conductors and to earth; earth continuity and earth electrode resistance tests", 1.5),
        ("Polarity test, continuity of ring/ protective conductors, RCD operation test, verification of protective devices; periodic re-inspection and test certificate before energising", 1.5)],
       "Before a new installation is connected and at regular intervals afterwards: (1) visual inspection - quality of workmanship, cable sizes, correct rating of fuses/MCBs, switches in the phase conductor, earthing connections, labelling and absence of damage; (2) insulation resistance test with a megger, between conductors and between conductors and earth (not less than the required value, e.g. 1 MΩ at 500 V); (3) earth continuity test of protective conductors and earth electrode resistance test; (4) polarity test - all switches and fuses in the phase conductor; (5) testing the operation of RCCBs/ELCBs and checking protective devices; and (6) issuing a test certificate, with periodic inspection and testing thereafter."),
    it("3. What are the reasons for providing the fuse on the phase wire? What will be the effect on the wiring if a fuse wire of much higher rating is installed?", 3,
       [("Fuse on phase: when it blows the circuit beyond is disconnected from supply (dead), safe for maintenance; fuse in neutral would leave equipment live, shock risk", 1.5),
        ("Higher rating fuse: does not melt on overload/ some faults, cables overheat, insulation damage, fire, equipment damage - no protection", 1.5)],
       "The fuse is placed in the phase (live) wire so that when it blows, the whole circuit beyond it is disconnected from the supply and becomes dead, making it safe; if it were in the neutral, the appliance would stay connected to the live wire even after the fuse blows, creating a shock hazard. If a fuse wire of much higher rating is used, it will not melt on overloads or some faults, so excessive current keeps flowing: the cables overheat, the insulation deteriorates and may catch fire, and appliances may be damaged - the circuit is effectively unprotected."),
    it("4. A short-circuit current must be broken immediately, whereas an overload current is allowed to persist for some time before it is broken. Give a short explanation.", 4,
       [("Short circuit: very high current (many times rated), huge I²t heating and electromagnetic forces, arcing, fire, damage to cables/ equipment within milliseconds - must be cleared instantly (magnetic trip)", 2),
        ("Overload: modest excess current, heating is gradual; equipment can withstand for a time; allows normal temporary surges (motor starting) without nuisance tripping - inverse time (thermal) characteristic", 2)],
       "A short circuit produces a very large current - many times the rated current - which causes intense heating (proportional to I²t), arcing and strong electromagnetic forces; cables, switchgear and equipment can be destroyed and fires started within a fraction of a second, so it must be interrupted immediately (the magnetic/instantaneous trip of an MCB, or a fuse). An overload is only a moderate excess current; heating builds up slowly, and cables and machines can carry it for some time without damage. Short overloads occur normally, such as motor starting currents, so an inverse-time (thermal) characteristic lets them persist briefly and trips only if the overload continues long enough to cause harmful heating - avoiding unnecessary tripping."),
    it("5. Is it desirable to have a low or high earthing resistance? What measures will you adopt to achieve the desired value?", 5,
       [("Low earth resistance desirable (e.g. < 1-5 Ω per standard): fault current flows easily, protective devices operate, touch voltage low, lightning dissipation", 2),
        ("Measures: deeper/ longer electrodes or multiple electrodes in parallel, chemical earthing/ charcoal and salt/ bentonite treatment, keep soil moist (watering pipe), larger plate area, proper connections, locate in moist soil, periodic testing", 3)],
       "A low earthing resistance is desirable (typically less than about 1 Ω for substations and a few ohms for buildings, as per the standards), so that fault current flows easily to earth, fuses/MCBs/RCDs operate quickly, the touch voltage on metal parts stays low, and lightning and surge currents are dissipated safely. Measures: use a larger plate or pipe electrode and drive it deeper to reach moist soil; use several electrodes in parallel (spaced apart); treat the pit with charcoal and salt layers or bentonite/ chemical earthing compound to reduce soil resistivity; provide a watering pipe to keep the soil moist; choose a location with moist soil away from foundations; use proper size earth conductors with good, corrosion-free connections; and test the earth resistance periodically, especially in the dry season."),
    it("6. Explain the importance of load balancing in a three-phase system and the possible consequences of poor load distribution.", 3,
       [("Importance: equal phase currents, minimum neutral current, efficient use of transformer/ cables, balanced voltages", 1.5),
        ("Consequences: neutral current and overheating, voltage unbalance (some consumers low/ high voltage), overloaded phase tripping, motor heating and reduced life, higher losses, transformer derating", 1.5)],
       "In a three-phase system the single-phase loads should be shared equally among the three phases so that the phase currents are equal, the neutral current is minimal and the transformer and cables are used efficiently with balanced voltages. Poor distribution causes a large neutral current (overheating of the neutral), voltage unbalance (low voltage on the heavily loaded phase and over-voltage on lightly loaded ones, damaging appliances), one phase overloading and tripping while others are underused, overheating and reduced life of three-phase motors, higher losses, and the need to derate the transformer."),
    it("7. The owner of a building wants electrical connections with the following points: Verandah - 2 lamps (60 W), 1 fan (60 W), 1 socket (5 A, 100 W); Room 1 - 1 lamp, 1 fan, 1 fluorescent lamp (40 W), 1 socket (15 A, 1000 W); Room 2 - 1 lamp, 1 fan, 1 fluorescent lamp, 1 socket (5 A, 100 W).\n(i) Decide the number of final sub-circuits. (5 marks)\n(ii) Decide the ratings of the components on the main board, giving reasons. (5 marks)\n(iii) Write a short note on: isolator, MCB, RCCB, ELCB and RCBO. (5 marks)\n(iv) What is the standard wire size for light points and power points? (3 marks)", 18,
       [("(i) Lighting load: 4 lamps 240 W + 3 fans 180 W + 2 fluorescent 80 W + 2 x 5 A sockets 200 W = 700 W in 11 points; limit about 10 points/ 800 W per light sub-circuit → 2 lighting sub-circuits; 15 A socket on separate power sub-circuit → total 3 final sub-circuits", 5),
        ("(ii) Total ≈ 1700 W ≈ 7.4 A at 230 V; main: DP isolator/ main switch 32 A (or MCB 16-20 A), RCCB 25 A/ 30 mA, MCBs 6 A for each lighting circuit, 16 A for power circuit; reasons: load, cable rating, discrimination, safety", 5),
        ("(iii) Isolator: off-load disconnection; MCB: automatic overload and short-circuit protection; RCCB: trips on residual (earth leakage) current, no overcurrent; ELCB: earth leakage (voltage/ current operated, older); RCBO: RCCB + MCB combined", 5),
        ("(iv) Light points 1.5 mm² copper (1/1.13); power points 2.5-4 mm² copper (15 A sockets 4 mm² or 2.5 mm² as per code); earth conductor sizes", 3)],
       "(i) Lighting and small power load: lamps 4 x 60 = 240 W, fans 3 x 60 = 180 W, fluorescent 2 x 40 = 80 W, 5 A sockets 2 x 100 = 200 W - total 700 W in 11 points. Since a lighting sub-circuit is limited to about 10 points and 800 W (IS 732 practice), use 2 lighting sub-circuits (e.g. verandah and Room 2 on one, Room 1 on the other). The 15 A, 1000 W socket needs its own power sub-circuit. Number of final sub-circuits = 3.\n(ii) Total connected load ≈ 700 + 1000 = 1700 W, i.e. about 7.4 A at 230 V. Main board: a double-pole main switch/isolator of 32 A (or a 2-pole main MCB of 16-20 A) for safe isolation; an RCCB of 25 A, 30 mA sensitivity for protection against shock and earth leakage; 6 A MCBs for each lighting sub-circuit (matched to 1.5 mm² cable) and a 16 A MCB for the power sub-circuit (matched to its cable), so each circuit is protected and faults are isolated selectively; plus a neutral link and earth bar.\n(iii) Isolator - a manually operated switch used to disconnect a circuit for maintenance when no current flows (off-load); it gives no protection. MCB (miniature circuit breaker) - automatically trips on overload (thermal) and short circuit (magnetic), and can be reset. RCCB (residual current circuit breaker) - trips when the currents in phase and neutral differ by more than its rating (e.g. 30 mA), protecting people from shock and earth-fault fires; it does not protect against overload. ELCB (earth leakage circuit breaker) - older term for earth-leakage devices (voltage-operated types sense the earth wire voltage; current-operated types are RCCBs). RCBO (residual current breaker with overcurrent protection) - combines an RCCB and an MCB in one device, giving earth-leakage, overload and short-circuit protection for one circuit.\n(iv) Light points: 1.5 mm² copper (PVC insulated) cable; power points: 2.5 mm² copper for 5/6 A and general sockets and 4 mm² copper for 15/16 A power sockets and heavy loads, with an earth continuity conductor of appropriate size."),
    it("8. A residential consumer has 10 lamps of 40 W. The demand is: 12 midnight to 5 AM - 40 W; 5 AM to 6 PM - no load; 6 PM to 7 PM - 320 W; 7 PM to 9 PM - 360 W; 9 PM to 12 midnight - 160 W.\n(i) Find the average load, maximum load, load factor and energy consumption during the day. (6 marks)\n(ii) The tariff in Bhutan is Nu 1.28/kWh for 0-100 kWh and Nu 2.66/kWh above 100 kWh. Calculate the monthly bill. (5 marks)", 11,
       [("Energy = 40 x 5 + 320 x 1 + 360 x 2 + 160 x 3 = 1720 Wh = 1.72 kWh/day", 2),
        ("Average load = 1720/24 = 71.7 W; maximum load = 360 W; load factor = 71.7/360 = 19.9%", 4),
        ("Monthly (30 days) = 51.6 kWh, within 0-100 slab → bill = 51.6 x 1.28 ≈ Nu 66 (plus any fixed charges)", 5)],
       "(i) Energy in the day: 12-5 AM: 40 W x 5 h = 200 Wh; 5 AM-6 PM: 0; 6-7 PM: 320 W x 1 h = 320 Wh; 7-9 PM: 360 W x 2 h = 720 Wh; 9 PM-12: 160 W x 3 h = 480 Wh. Total = 1720 Wh = 1.72 kWh per day. Average load = 1720/24 = 71.7 W. Maximum load = 360 W. Load factor = average/maximum = 71.7/360 = 0.199, about 20%.\n(ii) Monthly consumption (30 days) = 1.72 x 30 = 51.6 kWh, which lies within the first slab (0-100 kWh), so the bill = 51.6 x 1.28 = Nu 66.05 (about Nu 66 per month, plus any fixed/meter charges). For a 31-day month: 53.3 kWh x 1.28 = Nu 68.25."),
])
for x in Q:
    if x.get("key") == "C2Q1":
        x["issues"] = ["Expert check: confirm the exact title of Bhutan's regulation for electrical wiring/installations."]
PATTERN = STANDARD
