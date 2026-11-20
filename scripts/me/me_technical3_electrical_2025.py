"""ME Technical Paper III (Subject Specialisation Paper), Electrical Engineering, BCSE 2025 - real paper (PDF sent by the founder).
Pattern: Section A Part I 30 MCQ, Part II 4 short answers x 5; Section B one of two case studies (50). 150 min + 15 min reading.
Figures in public/papers/me/tech3-ee-2025-*.png. Left out: MCQ 1 (open-loop wording ambiguous), 6 (logic diagram copied
from a third-party site with its watermark), 30 (planning agency: Claude cannot confirm); three new MCQs keep Part I at 30.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1"
GROUP_TAG = "ee2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "electrical-engineering-2025"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Electrical Engineering"

MCQ = r"""[
{
"n": 1,
"stem": "In an open loop control system:",
"opts": [
"Output is independent of control input",
"Output is dependent on control input",
"Only system parameters have effect on the control output",
"None of the above"
]
},
{
"n": 2,
"stem": "A system with poles at -1, -2, and +3 is:",
"opts": [
"Marginally stable",
"Unstable",
"Stable",
"Conditionally stable"
]
},
{
"n": 3,
"stem": "The Nyquist sampling rate is given by:",
"opts": [
"Fs = 2 Fm",
"Fs = 3 Fm",
"Fs = 4 Fm",
"Fs = Fm"
]
},
{
"n": 4,
"stem": "Which of the following is a universal gate:",
"opts": [
"NAND",
"NOT",
"OR",
"AND"
]
},
{
"n": 5,
"stem": "The resulting logic circuit obtained when both inputs of NOR and NAND gates are connected together is:",
"opts": [
"AND",
"XOR",
"OR",
"NOT"
]
},
{
"n": 6,
"stem": "The output of logic circuit given below represent ………….gate:",
"opts": [
"OR",
"NOR",
"AND",
"NAND"
]
},
{
"n": 7,
"stem": "How much time is the output power of a full bridge inverter to a half bridge inverter?",
"opts": [
"Four times",
"One time",
"Two times",
"Three times"
]
},
{
"n": 8,
"stem": "In a Boost converter, the output voltage is always:",
"opts": [
"Equal to the input voltage",
"Greater than the input voltage",
"Less than the input voltage",
"200 Volts"
]
},
{
"n": 9,
"stem": "The power electronic converter shown in the figure below has a single-pole double-throw switch. The pole 𝑃 of the switch is connected alternately to throw 𝐴 and 𝐵. The converter shown is a:",
"opts": [
"Buck converter",
"Boost converter",
"Half wave rectifier",
"Chopper converter"
]
},
{
"n": 10,
"stem": "Which of the following devices is used to measure relatively high temperatures, such as encountered in furnaces:",
"opts": [
"Barometer",
"Ammeter",
"Pyrometer",
"Fluxmeter"
]
},
{
"n": 11,
"stem": "A voltmeter is connected in a ………. with the circuit component across which potential difference is to be measured:",
"opts": [
"Parallel",
"Series",
"Series or parallel",
"None of the above"
]
},
{
"n": 12,
"stem": "A heater is rated as 230 V, 10 kW, A.C. The value 230 V refers to:",
"opts": [
"Average voltage",
"peak voltage",
"r.m.s. voltage",
"none of the above"
]
},
{
"n": 13,
"stem": "Four capacitors each of 40 µF are connected in parallel, the equivalent capacitance of the system will be:",
"opts": [
"160 µF",
"10 µF",
"40 µF",
"5 µF"
]
},
{
"n": 14,
"stem": "Find the Thevenin equivalent (VTH and RTH) between terminals A and B of the circuit given below.",
"opts": [
"4.16 V, 120 Ω",
"41.6 V, 120 Ω",
"4.16 V, 70 Ω",
"41.67 V, 70 Ω"
]
},
{
"n": 15,
"stem": "When short circuit occurs, voltage in circuit will be:",
"opts": [
"Nearly Zero",
"Rated supply voltage",
"Cannot be determined",
"Infinite"
]
},
{
"n": 16,
"stem": "Which variables are specified by slack bus in the load flow studies:",
"opts": [
"|V|, P",
"|V|, δ",
"P, Q",
"Q, δ"
]
},
{
"n": 17,
"stem": "Four identical alternators each are rated as 20 MVA, 11 kV having a subtransient reactance of 16% are working in parallel. The short circuit level at the busbar is:",
"opts": [
"500 MVA",
"400 MVA",
"125 MVA",
"100 MVA"
]
},
{
"n": 18,
"stem": "If the fault current is 2000 A, the relay setting is 50% and CT ratio is 400 : 5, then plug setting multiplier will be:",
"opts": [
"10",
"15",
"25",
"50"
]
},
{
"n": 19,
"stem": "Over excitation synchronous phase modifier works as:",
"opts": [
"Series capacitor",
"Shunt reactor",
"Shunt capacitor",
"None of the above"
]
},
{
"n": 20,
"stem": "The transmission voltage levels in Bhutan are:",
"opts": [
"765 kV, 400 kV, 220 kV, 132 kV",
"400 kV, 220 kV, 132 kV, 66 kV",
"800 kV, 400 kV, 220 kV, 132 kV",
"800kV, 765 kV, 400 kV, 220 kV"
]
},
{
"n": 21,
"stem": "The zero-sequence current flows in a power system during:",
"opts": [
"Line to line fault",
"Double line to ground fault",
"Symmetrical three phase fault",
"Open conductor fault"
]
},
{
"n": 22,
"stem": "The main purpose of a tap-changing transformer is to:",
"opts": [
"Increase fault current",
"Reduce harmonics",
"Improve power factor",
"Regulate voltage"
]
},
{
"n": 23,
"stem": "The back EMF in a DC motor is given by:",
"opts": [
"Eb = V + Ia Ra",
"Eb = V − IaRa",
"Eb = V × Ia",
"Eb = V/Ia"
]
},
{
"n": 24,
"stem": "The slip of a 4-pole, 50 Hz induction motor running at 1440 rpm is:",
"opts": [
"2 %",
"4 %",
"6 %",
"8 %"
]
},
{
"n": 25,
"stem": "A synchronous motor operates at unity power factor when:",
"opts": [
"Field current is adjusted for zero reactive power",
"It is under-excited",
"It is over-excited",
"Load torque is maximum"
]
},
{
"n": 26,
"stem": "Why does an induction motor never run at synchronous speed?",
"opts": [
"Rotor windings would burn out",
"No relative motion means no induced current/torque",
"Back EMF would exceed supply voltage",
"This is incorrect, induction motors can reach synchronous speed"
]
},
{
"n": 27,
"stem": "A transformer works on the principle of:",
"opts": [
"Self – induction",
"Mutual – induction",
"Electrostatic induction",
"Electromagnetic conduction"
]
},
{
"n": 28,
"stem": "The frequency of electrical grid in Bhutan is:",
"opts": [
"50 Hz",
"55 Hz",
"60 Hz",
"100 Hz"
]
},
{
"n": 29,
"stem": "What percentage of Bhutan's total electricity generation comes from hydropower?",
"opts": [
"50 – 60 %",
"70 – 80 %",
"99 – 100 %",
"30 – 40 %"
]
},
{
"n": 30,
"stem": "The agency responsible for overall power system planning in Bhutan is:",
"opts": [
"Bhutan Power Corporation Limited",
"Bhutan Power System Operator",
"Department of Energy",
"Druk Green Power Corporation Limited"
]
}
]"""

KEY = {
    2: ("b", "A pole in the right half-plane (+3) makes the system unstable."), 3: ("a", "Nyquist rate Fs = 2Fm."), 4: ("a", "NAND is a universal gate."),
    5: ("d", "Tying both inputs of NAND or NOR together gives NOT."), 7: ("a", "Full bridge gives twice the output voltage, so four times the power."),
    8: ("b", "A boost converter steps voltage up."), 9: ("a", "Switching between Vin and ground into an L-R output is a buck converter."),
    10: ("c", "Pyrometers measure high furnace temperatures."), 11: ("a", "A voltmeter is connected in parallel."), 12: ("c", "AC ratings are r.m.s. values."),
    13: ("a", "Parallel capacitors add: 4 × 40 = 160 µF."), 14: ("d", "VTH = 100 × 120/288 = 41.67 V; RTH = 120 ∥ 168 = 70 Ω."),
    15: ("a", "At the short-circuit point the voltage falls to nearly zero."), 16: ("b", "The slack bus specifies |V| and δ."),
    17: ("a", "Four 20 MVA, 16% machines in parallel: X = 0.04 pu on 20 MVA; SC level = 20/0.04 = 500 MVA."),
    18: ("a", "Secondary = 2000 × 5/400 = 25 A; setting 50% × 5 = 2.5 A; PSM = 10."), 19: ("c", "An over-excited synchronous condenser supplies reactive power like a shunt capacitor."),
    20: ("b", "Bhutan's grid uses 400, 220, 132 and 66 kV transmission."), 21: ("b", "Zero-sequence current flows only in faults involving ground (e.g. LLG)."),
    22: ("d", "Tap changers regulate voltage."), 23: ("b", "Eb = V − IaRa."), 24: ("b", "Ns = 1500 rpm; s = (1500 − 1440)/1500 = 4%."),
    25: ("a", "Unity pf when excitation gives zero reactive power."), 26: ("b", "At synchronous speed there is no relative motion, so no induced current or torque."),
    27: ("b", "Transformers work by mutual induction."), 28: ("a", "Bhutan's grid frequency is 50 Hz."), 29: ("c", "Almost all (≈ 99%+) of Bhutan's generation is hydropower."),
}
FIX = {9: {"image": "/papers/me/tech3-ee-2025-converter.png"}, 14: {"image": "/papers/me/tech3-ee-2025-thevenin.png"}}
T = TOPIC
Q = mcqs(MCQ, KEY, T, FIX) + [
    new_mcq(1, T, "The SI unit of magnetic flux is the", ["tesla", "weber", "henry", "gauss"], "b", "Magnetic flux is measured in webers (Wb)."),
    new_mcq(2, T, "Power factor of an AC circuit is", ["P/Q", "Q/S", "P/S = cos φ", "S/P"], "c", "Power factor = real power/apparent power = cos φ."),
    new_mcq(3, T, "In a balanced star-connected three-phase system, the line voltage equals", ["the phase voltage", "√3 × phase voltage", "3 × phase voltage", "phase voltage/√3"], "b", "V_L = √3 V_ph in star."),
    saq(1, T, "Power is exported to India from a hydropower plant through a three-phase, 50 Hz, completely transposed 400 kV, 150 km transmission line with positive-sequence constants z = 0.032 + j0.35 Ω/km and y = j4.2 × 10⁻⁶ S/km. Full load at the receiving end is 700 MW at 0.99 power factor leading and at 95% of rated voltage. Assuming a medium-length line (nominal π), compute the A, B, C and D parameters. (5 marks)",
        [("Z = (0.032 + j0.35) × 150 = 4.8 + j52.5 Ω; Y = j6.3 × 10⁻⁴ S", 1), ("A = D = 1 + ZY/2 ≈ 0.9835 + j0.0015", 1.5), ("B = Z = 4.8 + j52.5 Ω (≈ 52.7∠84.8° Ω)", 1), ("C = Y(1 + ZY/4) ≈ −4.8 × 10⁻⁷ + j6.25 × 10⁻⁴ S", 1.5)],
        """Total series impedance Z = (0.032 + j0.35) × 150 = 4.8 + j52.5 Ω; total shunt admittance Y = j4.2 × 10⁻⁶ × 150 = j6.3 × 10⁻⁴ S.
ZY = (4.8 + j52.5)(j6.3 × 10⁻⁴) = −0.03308 + j0.00302.
A = D = 1 + ZY/2 = 0.9835 + j0.0015 (≈ 0.9835∠0.09°).
B = Z = 4.8 + j52.5 Ω (≈ 52.72∠84.8° Ω).
C = Y(1 + ZY/4) = j6.3 × 10⁻⁴ × (0.9917 + j0.00076) ≈ −4.8 × 10⁻⁷ + j6.248 × 10⁻⁴ S. (Check: AD − BC ≈ 1.) The load data are not needed for A, B, C, D."""),
    saq(2, T, "Draw an impedance diagram for the power system shown, with all impedances in per unit on a 100 MVA base. Choose 20 kV as the voltage base for the generators. Ratings: G1 90 MVA, 20 kV, X = 9%; T1 80 MVA, 20/200 kV, X = 16%; T2 80 MVA, 200/20 kV, X = 20%; G2 90 MVA, 18 kV, X = 9%; line 200 kV, X = 120 Ω; load 200 kV, S = 48 MW + j64 Mvar. (5 marks)",
        [("G1 = 0.09 × 100/90 = 0.1 pu; T1 = 0.16 × 100/80 = 0.2 pu; T2 = 0.2 × 100/80 = 0.25 pu", 2), ("G2 = 0.09 × (18/20)² × 100/90 = 0.081 pu", 1), ("Line: Z_base = 200²/100 = 400 Ω → 0.3 pu; load Z = V²/S* = 300 + j400 Ω → 0.75 + j1.0 pu", 1), ("Correct diagram connecting the per-unit reactances", 1)],
        """Bases: 100 MVA; 20 kV at the generators, 200 kV on the line (Z_base line = 200²/100 = 400 Ω).
G1: X = 0.09 × (100/90) = 0.1 pu. T1: 0.16 × (100/80) = 0.2 pu. T2: 0.20 × (100/80) = 0.25 pu. G2 (rated 18 kV on a 20 kV base): 0.09 × (18/20)² × (100/90) = 0.081 pu. Line: 120/400 = 0.3 pu.
Load (as constant impedance): Z = V²/S* = 200²/(48 − j64) = 300 + j400 Ω → (300 + j400)/400 = 0.75 + j1.0 pu.
Diagram: source E1 - j0.1 - j0.2 - bus 1 (load 0.75 + j1.0 to reference) - j0.3 - bus 2 - j0.25 - j0.081 - source E2.""", image="/papers/me/tech3-ee-2025-power-system.png"),
    saq(3, T, "Reduce the circuit between terminals a and b (see the figure) to a single resistor. (5 marks)",
        [("2 ∥ 3 ∥ 6 Ω = 1 Ω between c and d", 2), ("Series a-c-d-e: 1 + 1 + 6 = 8 Ω, in parallel with 8 Ω → 4 Ω", 2), ("Plus 16 Ω: R_ab = 20 Ω", 1)],
        "Between c and d: 2 ∥ 3 ∥ 6 → 1/(1/2 + 1/3 + 1/6) = 1 Ω. Path a-c-d-e: 1 + 1 + 6 = 8 Ω, in parallel with the 8 Ω from a to e: 8 ∥ 8 = 4 Ω. Then 4 + 16 (e to b) = 20 Ω. So R_ab = 20 Ω.", image="/papers/me/tech3-ee-2025-resistors.png"),
    saq(4, T, "In a factory, a three-phase, 4 kV, 400 kVA synchronous machine is installed along with induction motors. Loads: induction motors 500 kVA at 0.8 power factor lagging; synchronous motor 300 kVA at unity power factor. Determine the overall power factor of the factory loads. (5 marks)",
        [("Induction motors: P = 400 kW, Q = 300 kvar lagging", 2), ("Synchronous motor: P = 300 kW, Q = 0", 1), ("Total P = 700 kW, Q = 300 kvar, S = 761.6 kVA; pf = 0.919 lagging", 2)],
        "Induction motors: P = 500 × 0.8 = 400 kW, Q = 500 × 0.6 = 300 kvar (lagging). Synchronous motor at unity pf: P = 300 kW, Q = 0. Total: P = 700 kW, Q = 300 kvar, S = √(700² + 300²) = 761.6 kVA. Overall pf = 700/761.6 ≈ 0.92 lagging."),
]
C1 = """CASE I
Bhutan has officially launched the National Energy Policy 2025 (NEP 2025) with the vision of transforming the country's power sector through modernisation, diversification and sustainability. The policy sets ambitious targets of achieving 25,000 MW installed capacity by 2040, of which 20,000 MW is expected from hydropower and 5,000 MW from solar. The policy also emphasises private and foreign investment, promotion of pumped storage and hybrid systems, and adoption of energy efficiency, grid flexibility and smart technologies."""
C2 = """CASE II
A 220 kV double-circuit transmission line connects a large hydropower plant (600 MW) to a regional load centre. The system recently experienced multiple disturbances: a single line-to-ground fault causing relay misoperation; power swings during sudden load rejection; and voltage instability during peak demand. As an electrical engineer in the transmission utility, you are tasked with analysing the situation."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("ee2025", 1, T, C1, items=[
    it("1. Explain how integrating solar PV and pumped storage with hydropower enhances grid reliability and addresses winter shortages.", 5,
       [("Winter: river flows low, hydro output drops; solar is strong in dry sunny winters - complementary", 2), ("Pumped storage stores surplus energy (solar/summer) and supplies peaks and night demand", 2), ("Hydro reservoirs balance solar variability → reliability, less imports", 1)],
       "In winter, river flows fall and run-of-river hydropower output drops sharply, so Bhutan imports power; but winter days are dry and sunny, so solar PV output is high - the two are complementary. Pumped storage stores surplus solar energy by pumping water uphill and releases it at night and during peaks. Hydropower's fast ramping smooths solar variability. Together they give firm, reliable supply, reduce winter imports and use the grid more fully."),
    it("2. Define grid inertia. How does large-scale integration of inverter-based solar PV affect system inertia and stability?", 5,
       [("Inertia: kinetic energy in rotating synchronous machines that resists frequency change", 2), ("PV inverters have no rotating mass → lower inertia, faster RoCoF, larger frequency deviations, stability and protection issues", 2), ("Mitigation: synthetic/virtual inertia, grid-forming inverters, BESS, keep hydro units", 1)],
       "Grid inertia is the kinetic energy stored in the rotating masses of synchronous generators and motors, which resists sudden changes in frequency after a disturbance. Inverter-based solar PV has no rotating mass, so displacing synchronous hydro units lowers total inertia: frequency changes faster (higher rate of change of frequency) and dips deeper after a generator trip, risking under-frequency load shedding, protection mis-operation and instability. Remedies include grid-forming inverters with synthetic inertia, battery storage for fast frequency response, keeping enough hydro units online, and synchronous condensers."),
    it("3. Describe how black-start capability could be affected in a grid with high solar penetration.", 5,
       [("Black start needs units that can start without grid power and energise lines - usually hydro", 2), ("Solar inverters are grid-following: need a voltage reference, no output at night, low fault current/inertia", 2), ("So keep hydro black-start units, add grid-forming BESS/inverters, update restoration plans", 1)],
       "Black start is restoring the grid after a total blackout using units that can start without external power and energise lines - in Bhutan typically hydro units with diesel/auxiliary supplies. Conventional PV inverters are grid-following: they need an existing voltage and frequency, provide little fault current or inertia, cannot help at night, and their output varies with weather, so a solar-heavy grid has fewer black-start resources. Black-start capability must be kept by retaining hydro black-start units, adding grid-forming batteries/inverters, and updating restoration procedures."),
    it("4. Propose two strategies to address seasonal variation of hydropower generation in line with NEP 2025.", 5,
       [("Strategy 1 explained (e.g. reservoir/pumped-storage projects to store summer water)", 2.5), ("Strategy 2 explained (e.g. solar/wind diversification, cross-border trade/banking, demand-side management)", 2.5)],
       "1. Build storage: reservoir and pumped-storage hydropower to store summer water and generate in winter, as NEP 2025 promotes. 2. Diversify: large-scale solar (and wind) plants that peak in the dry winter, combined with hybrid hydro-solar operation. Other options: cross-border power trade and energy banking with India (export in summer, import in winter), energy efficiency and demand-side management, and battery storage."),
    it("5. Total Harmonic Distortion (THD) at the substation bus was measured as 7%. State the IEEE-recommended limits for THD and suggest two mitigation measures.", 5,
       [("IEEE 519-2014 voltage THD: ≤ 8% (≤ 1 kV), 5% (1-69 kV), 2.5% (69-161 kV), 1.5% (> 161 kV); so 7% exceeds the limit at substation level", 2.5), ("Two mitigations: passive/active harmonic filters, multi-pulse converters, proper inverter design/PWM, phase-shifting transformers, detuned capacitor banks", 2.5)],
       "IEEE 519-2014 limits voltage THD at the point of common coupling to 8% for ≤ 1 kV, 5% for 1-69 kV, 2.5% for 69-161 kV and 1.5% above 161 kV (individual harmonics about 3%), so 7% at a substation bus is too high. Mitigation: install passive tuned or active harmonic filters near the sources; use multi-pulse (12/18-pulse) converters or phase-shifting transformers; require inverters with low-harmonic PWM control; and use detuned reactors with capacitor banks to avoid resonance."),
    it("6. The PV modules are rated at 400 W each at STC. (i) Estimate the total number of modules required for a 100 MWp solar plant. [3 marks] (ii) If the modules are connected in strings of 25, how many strings are needed? [2 marks]", 5,
       [("(i) 100,000,000/400 = 250,000 modules", 3), ("(ii) 250,000/25 = 10,000 strings", 2)],
       "(i) Number of modules = 100 MWp/400 W = 100,000,000/400 = 250,000 modules. (ii) Strings = 250,000/25 = 10,000 strings."),
    it("7. The 100 MWp plant is planned with an inverter loading ratio (ILR) of 1.2. (i) Calculate the required AC inverter capacity (MW). [2 marks] (ii) If each inverter is rated at 2.5 MW, how many inverters are needed? [3 marks]", 5,
       [("(i) AC capacity = 100/1.2 ≈ 83.3 MW", 2), ("(ii) 83.3/2.5 = 33.3 → 34 inverters", 3)],
       "(i) AC capacity = DC capacity/ILR = 100/1.2 ≈ 83.3 MW. (ii) 83.3/2.5 = 33.3, so 34 inverters (rounding up)."),
    it("8. Explain how phasor measurement units (PMUs) can improve monitoring of renewable-rich grids.", 5,
       [("PMUs measure voltage/current phasors, frequency and RoCoF, GPS time-synchronised, many samples per second", 2), ("Wide-area monitoring: real-time visibility of oscillations, frequency events, renewable variability, stability margins", 2), ("Better protection/control, fault location, model validation", 1)],
       "PMUs measure voltage and current phasors, frequency and rate of change of frequency at 25-50 samples per second, time-stamped by GPS, so measurements from across the grid can be compared directly. In a grid with variable solar, they give real-time wide-area visibility of power swings, oscillations, low-inertia frequency events and voltage problems that SCADA (every few seconds) misses; enable early warnings and automatic control; help locate faults and post-event analysis; and validate dynamic models of inverter-based plants."),
    it("9. Describe one example of how artificial intelligence (AI) could support Bhutan's grid operations under NEP 2025.", 5,
       [("A concrete AI application (e.g. forecasting solar/hydro inflows and demand)", 3), ("How it improves operation (dispatch, storage scheduling, trade, fewer outages)", 2)],
       "Example: machine-learning forecasting of solar output (using weather and satellite data), river inflows (using rainfall and snow data) and electricity demand. Better forecasts let the system operator schedule hydro reservoirs and pumped storage, plan exports and winter imports, keep reserves and reduce curtailment. Other uses: predictive maintenance of transformers and lines, fault detection and smart outage management."),
    it("10. Suggest one policy-oriented research area universities in Bhutan could focus on to strengthen NEP 2025 implementation.", 5,
       [("A clear research area (e.g. optimal hydro-solar-storage mix and pricing/market design; grid codes for inverter-based resources; energy efficiency policy)", 3), ("Why it matters and how findings feed policy", 2)],
       "Example: research on the least-cost mix and siting of hydropower, solar and pumped storage for winter energy security, including tariff and market design for private investment (feed-in tariffs, power purchase agreements, cross-border trading). Findings would guide licensing, investment incentives and grid planning under NEP 2025; other areas include grid codes for inverter-based generation, energy-efficiency standards and the impact of climate change on hydrology."),
])
Q += case("ee2025", 2, T, C2, items=[
    it("1. Define power system stability and differentiate between transient, dynamic and steady-state stability.", 6,
       [("Definition: ability to regain equilibrium after a disturbance with variables within limits", 1.5), ("Steady-state: small gradual changes", 1.5), ("Transient: large sudden disturbances, first swing", 1.5), ("Dynamic: small disturbances over longer time with controls (oscillations)", 1.5)],
       "Power system stability is the ability of the system to remain in synchronism and regain an acceptable equilibrium after a disturbance, with voltages and frequency within limits. Steady-state stability: ability to stay in synchronism under small, gradual changes in load (limit P_max = EV/X). Transient stability: ability to remain in synchronism after large, sudden disturbances such as faults, line trips or loss of generation, judged over the first swing (a few seconds). Dynamic (small-signal) stability: ability to damp small oscillations over a longer period, including the effect of governors, excitation systems and PSS."),
    it("2. Explain the equal area criterion and its application in transient stability analysis.", 5,
       [("Based on swing equation and power-angle curve for a machine-infinite bus", 1.5), ("Accelerating area A1 (Pm > Pe during fault) must equal decelerating area A2 for stability", 2), ("Application: critical clearing angle/time, effect of fault clearing speed", 1.5)],
       "For a single machine connected to an infinite bus, the swing equation relates rotor acceleration to the difference between mechanical input Pm and electrical output Pe = (EV/X) sin δ. During a fault Pe falls, the rotor accelerates and δ increases (accelerating area A1). After clearing, Pe > Pm and the rotor decelerates (decelerating area A2). The system is stable if A2 can equal A1 before δ passes the maximum angle. It is used to find the critical clearing angle and critical clearing time, showing why fast protection and auto-reclosing improve stability."),
    it("3. What is the role of system inertia in power system stability?", 4,
       [("Inertia stores kinetic energy, slows rate of frequency change after imbalance", 2), ("Gives time for governors/controls; higher inertia improves frequency and transient stability", 2)],
       "Inertia of rotating generators stores kinetic energy that is released or absorbed instantly when generation and load become unbalanced, slowing the rate of change of frequency and limiting how far frequency falls or rises. This gives governors and other controls time to respond and reduces rotor-angle swings, so higher inertia improves frequency and transient stability; low inertia makes the system more sensitive to disturbances such as load rejection."),
    it("4. If the line reactance is 0.3 pu on a 100 MVA base and the sending- and receiving-end voltages are equal, determine the maximum power transfer capability using the power-angle equation.", 5,
       [("P = (V_s V_r/X) sin δ; maximum at δ = 90°", 2), ("P_max = 1 × 1/0.3 = 3.33 pu", 2), ("= 333 MW on 100 MVA base", 1)],
       "P = (V_s V_r/X) sin δ, maximum when δ = 90°. With V_s = V_r = 1 pu: P_max = 1/0.3 = 3.33 pu = 3.33 × 100 = 333 MVA ≈ 333 MW."),
    it("5. A fault occurs at 90% of the line length from the sending end. Explain how a distance relay determines the fault location using impedance measurement and time delay.", 6,
       [("Relay measures V/I = apparent impedance proportional to distance to fault", 2), ("Zones: Zone 1 ≈ 80-85% instantaneous; Zone 2 ≈ 120% with delay (0.3-0.4 s); Zone 3 backup with longer delay", 2), ("Fault at 90% is beyond Zone 1, so tripped by Zone 2 after delay (or instantly with carrier/communication scheme)", 2)],
       "A distance (impedance) relay measures voltage and current at its location and computes the apparent impedance Z = V/I, which is proportional to the line length up to the fault. It compares Z with set zones: Zone 1 covers about 80-85% of the line and trips instantly; Zone 2 covers about 120% (the rest of the line plus part of the next) with a time delay of about 0.3-0.4 s; Zone 3 is remote backup with a longer delay. A fault at 90% of the line is outside Zone 1 (to avoid overreach due to errors) but inside Zone 2, so the sending-end relay trips after the Zone 2 delay - unless a communication-aided scheme (permissive/inter-trip) gives instantaneous tripping; the receiving-end relay sees it in its Zone 1."),
    it("6. Explain the difference between radial and ring distribution systems. Discuss their reliability and fault isolation characteristics.", 4,
       [("Radial: single path from source, simple and cheap; a fault interrupts all downstream consumers", 2), ("Ring: closed loop, two paths; faulted section isolated by breakers and supply maintained - more reliable, costlier, complex protection", 2)],
       "Radial: feeders run outward from the substation in one path; simple, cheap and easy to protect, but any fault or maintenance interrupts all consumers beyond that point - low reliability. Ring (loop): feeders form a closed loop so each point can be fed from two directions; a faulted section can be isolated by switches/breakers while the rest stays supplied - higher reliability and voltage regulation, but more cost and more complex protection."),
    it("7. During a three-phase fault at the middle of the line, the measured fault current was 10 kA. If the CT ratio is 1000:1, calculate the secondary current entering the relay.", 4,
       [("I_sec = 10,000/1000", 2), ("= 10 A", 2)],
       "Secondary current = 10,000 A/1000 = 10 A."),
    it("8. Define the concept of voltage stability margin and describe how it can be monitored using P-V and Q-V curves.", 6,
       [("Margin: distance (MW or Mvar) from current operating point to voltage collapse point", 2), ("P-V curve: voltage vs load; nose point = maximum loadability; margin = P_max − P_operating", 2), ("Q-V curve: reactive power needed vs voltage; bottom of curve = reactive reserve margin; monitored in real time with SCADA/PMUs", 2)],
       "Voltage stability margin is how far the system is from voltage collapse - the extra load (MW) or reactive demand (Mvar) it can take before voltages can no longer be maintained. P-V curve: bus voltage plotted against load; the 'nose' is the maximum loadability, and the MW margin is the distance from the operating point to the nose. Q-V curve: reactive power injection needed at a bus versus its voltage; the minimum of the curve shows the reactive power reserve margin (positive minimum means unstable). Operators compute these curves with continuation load flow and monitor margins in real time using SCADA/PMU data, adding reactive support or shedding load before the margin is too small."),
    it("9. Compare the use of SVC and STATCOM for reactive power support on this line. Which is better and why?", 5,
       [("SVC: thyristor-controlled reactors/switched capacitors, reactive output falls with V² at low voltage, slower, larger, harmonics", 2), ("STATCOM: VSC-based, constant current at low voltage, faster response, smaller footprint, better for voltage instability", 2), ("Conclusion: STATCOM better for this case (voltage instability, transients), SVC cheaper", 1)],
       "SVC (static var compensator) uses thyristor-controlled reactors and thyristor-switched capacitors; it is mature and cheaper, but its reactive output falls with the square of voltage, so support weakens exactly when voltage collapses, it responds more slowly and produces harmonics. STATCOM uses a voltage-source converter; it can supply near-rated reactive current even at low voltage, responds faster, has a smaller footprint and can help damp oscillations. For voltage instability during peak demand and disturbances, a STATCOM is better, though more expensive."),
    it("10. A generator is operating at 0.85 lagging power factor. Explain the impact of this condition on reactive power demand and voltage regulation.", 5,
       [("Lagging pf: generator supplies reactive power (over-excited) to inductive loads: Q = P tan(cos⁻¹0.85) ≈ 0.62 P", 2), ("Higher current, losses, reduced real power capability", 1.5), ("Voltage drop along lines larger; generator supports voltage but nearing excitation limits; need compensation", 1.5)],
       "At 0.85 lagging pf the generator is over-excited and supplies reactive power to inductive loads: Q = P tan(cos⁻¹ 0.85) ≈ 0.62 P (about 62 Mvar for every 100 MW). This raises current for the same real power, increasing I²R losses and heating, and reduces the real-power capability within the machine's rating. The large reactive flow causes bigger voltage drops along the 220 kV line, so voltage regulation at the load end worsens; the generator's excitation supports voltage but may hit its field-current limit, so local reactive compensation (capacitors, STATCOM) near the load centre is needed."),
])
PATTERN = STANDARD
