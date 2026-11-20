"""ME Technical Paper III (Subject Specialisation Paper), Mechatronic Engineering, BCSE 2025 - real paper (PDF sent by the founder).
Own pattern: Part II has 5 short answers (2.5+5+5+5+2.5 = 20), loaded as one 20-mark group. Section B instructions
contradict themselves ('any two of three, 25 each' and 'either Case I or II, 50 each'); the paper has two cases, so
students choose one (50). Both cases ask the same three questions with no part marks, so each case is one 50-mark
question. Replaced MCQs: 4 (unclear wording), 7 (exact repeat of 6), 13 (figure answer unclear), 21 (true/false),
22 (no clear answer).
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, Mechatronic Engineering): BCSE 2025, batch 1"
GROUP_TAG = "mtx2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "mechatronic-engineering"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechatronic Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "Mechatronic Engineering"

MCQ = r"""[
{
"n": 1,
"stem": "__________ robot allows a programmer to teach robot paths and positions.",
"opts": [
"Self monitored stop",
"Speed and separation monitoring",
"Power and force limiting",
"Hand guiding"
]
},
{
"n": 2,
"stem": "________ is the simplest method of collaborative robots and is used in applications when human interaction with robot is less.",
"opts": [
"Self monitored stop",
"Speed and separation monitoring",
"Power and force limiting",
"Hand guiding"
]
},
{
"n": 3,
"stem": "BAXTER is which type of robot?",
"opts": [
"Humanoid robot",
"Industrial robot",
"Hospital robot",
"Workspace robot"
]
},
{
"n": 4,
"stem": "Cobots function is to allow computer control of motion by ________",
"opts": [
"Motors",
"Human worker",
"Payload",
"Power"
]
},
{
"n": 5,
"stem": "Which generation robots are repeating, non-servo, pick-and-place, or point-to-point kind?",
"opts": [
"First generation",
"Second generation",
"Third generation",
"Fourth generation"
]
},
{
"n": 6,
"stem": "Which generation robots have sensing devices to exhibit path-control capabilities but lack artificial intelligence?",
"opts": [
"First generation",
"Second generation",
"Third generation",
"Fourth generation"
]
},
{
"n": 7,
"stem": "Which generation robots have sensing devices to exhibit path-control capabilities but lack artificial intelligence?",
"opts": [
"First generation",
"Second generation",
"Third generation",
"Fourth generation"
]
},
{
"n": 8,
"stem": "Which generation robots are acquired with artificial intelligence, self-learning, and conclusion- drawing capabilities by past experiences?",
"opts": [
"First generation",
"Second generation",
"Third generation",
"Fourth generation"
]
},
{
"n": 9,
"stem": "________ is a machine that has functions similar to human upper limbs, and moves the objects spatially.",
"opts": [
"Manipulator",
"Playback Robot",
"Intelligent Robot",
"Smart Device"
]
},
{
"n": 10,
"stem": "___________ is a robot that can determine its own behavior and conduct through its functions of sense and recognition.",
"opts": [
"Manipulator",
"Playback Robot",
"Intelligent Robot",
"Smart Device"
]
},
{
"n": 11,
"stem": "___________ is a manipulator that is able to perform an operation by reading off the memorized information for an operating sequence, which is learned beforehand.",
"opts": [
"Manipulator",
"Playback Robot",
"Intelligent Robot",
"Smart Device"
]
},
{
"n": 12,
"stem": "How many Degrees of freedom (DOF) does a prismatic and revolute joint have respectively?",
"opts": [
"1, 1",
"2, 1",
"1, 2",
"2, 2"
]
},
{
"n": 13,
"stem": "How many degrees of freedom does the following figure have?",
"opts": [
"2",
"3",
"6",
"9"
]
},
{
"n": 14,
"stem": "What is Artificial Intelligence?",
"opts": [
"Artificial Intelligence is a field that aims to make humans more intelligent",
"Artificial Intelligence is a field that aims to improve the security",
"Artificial Intelligence is a field that aims to develop intelligent machines",
"Artificial Intelligence is a field that aims to mine the data"
]
},
{
"n": 15,
"stem": "Which type of sensors are used for tracking the humanoid’s body and joints movement, its orientation, position and speed?",
"opts": [
"mpu6050",
"ECG monitoring sensor",
"Proprioceptive",
"Exteroceptive"
]
},
{
"n": 16,
"stem": "Which among the following is a home robot?",
"opts": [
"Vyommitra",
"Zenbo",
"Athlete",
"Valkyrie"
]
},
{
"n": 17,
"stem": "What is the workspace of SCARA (Selective Compliance Assembly Robot Arm)?",
"opts": [
"Cylindrical workspace",
"Cuboidal workspace",
"Spherical workspace",
"No workspace"
]
},
{
"n": 18,
"stem": "The workspace of an RPP manipulator is ___________",
"opts": [
"Cylindrical workspace",
"Cuboidal workspace",
"Spherical workspace",
"No workspace"
]
},
{
"n": 19,
"stem": "The workspace of a PPP manipulator is ______________",
"opts": [
"Cylindrical workspace",
"Cuboidal workspace",
"Spherical workspace",
"No workspace"
]
},
{
"n": 20,
"stem": "How many links does a kinematically redundant manipulator have?",
"opts": [
"Only one",
"Three",
"Five",
"More than Six"
]
},
{
"n": 21,
"stem": "Washing machine is a Robot. True or false?",
"opts": [
"True",
"False",
"",
""
]
},
{
"n": 22,
"stem": "In how many categories process of Artificial Intelligence is categorized?",
"opts": [
"categorized into 5 categories",
"processes are categorized based on the input provided",
"categorized into 3 categories",
"process is not categorized"
]
},
{
"n": 23,
"stem": "How many degrees of freedom does an object in 2D space have?",
"opts": [
"1",
"2",
"3",
"6"
]
},
{
"n": 24,
"stem": "How many degrees of freedom does a rigid body free in 3D space have?",
"opts": [
"3",
"6",
"9",
"12"
]
},
{
"n": 25,
"stem": "The ___________ of a manipulator is the total volume swept out by the end-eﬀector as the manipulator executes all possible motions.",
"opts": [
"Workspace",
"Work envelope",
"Work load",
"Workplace"
]
},
{
"n": 26,
"stem": "Collaborative robots are easily integrated into existing production environment. With __________ articulation points.",
"opts": [
"4",
"5",
"6",
"3"
]
},
{
"n": 27,
"stem": "The collaborative robot arms are designed to mimic the range of motion of a ________",
"opts": [
"Network",
"Machine arm",
"Device",
"Human arm"
]
},
{
"n": 28,
"stem": "In co – robot co represents?",
"opts": [
"Coordinative",
"Collaborative",
"Computer",
"Control"
]
},
{
"n": 29,
"stem": "The cobots assured human safety by having no internal source of ________",
"opts": [
"General Motors",
"Safe equipment",
"Industrial material",
"Motive power"
]
},
{
"n": 30,
"stem": "Which type of collaborative robot installation also uses traditional industrial robots?",
"opts": [
"Self monitored stop",
"Speed and separation monitoring",
"Power and force limiting",
"Hand guiding"
]
}
]"""

KEY = {
    1: ("d", "Hand guiding lets the programmer move the robot by hand to teach paths and positions."), 2: ("a", "Safety-rated monitored stop is the simplest collaborative mode, used where human interaction is rare."),
    3: ("b", "Baxter (Rethink Robotics) is an industrial collaborative robot."), 5: ("a", "First-generation robots are repeating, non-servo, pick-and-place/point-to-point."),
    6: ("b", "Second-generation robots have sensors and path control but no AI."), 8: ("c", "Third-generation robots have AI, self-learning and decision-making from experience."),
    9: ("a", "A manipulator mimics the human arm and moves objects spatially."), 10: ("c", "An intelligent robot decides its own behaviour through sensing and recognition."),
    11: ("b", "A playback robot repeats a memorised, previously taught sequence."), 12: ("a", "Prismatic and revolute joints each have 1 DOF."),
    14: ("c", "AI aims to develop intelligent machines."), 15: ("c", "Proprioceptive sensors measure the robot's own joint positions, orientation and speed."),
    16: ("b", "Zenbo (ASUS) is a home robot."), 17: ("a", "A SCARA robot has a cylindrical workspace."),
    18: ("a", "An RPP manipulator has a cylindrical workspace."), 19: ("b", "A PPP (Cartesian) manipulator has a cuboidal workspace."),
    20: ("d", "A kinematically redundant manipulator has more than six DOF/links."), 23: ("c", "A body in a plane has 3 DOF: two translations and one rotation."),
    24: ("b", "A free rigid body in 3D has 6 DOF."), 25: ("a", "The workspace is the total volume swept by the end-effector."),
    26: ("c", "Typical cobot arms have six articulation points (joints)."), 27: ("d", "Cobot arms mimic the motion of a human arm."),
    28: ("b", "Co-robot = collaborative robot."), 29: ("d", "Early cobots had no internal motive power; the human supplied it."),
    30: ("b", "Speed and separation monitoring can be used with traditional industrial robots."),
}
T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "In collaborative robotics, 'power and force limiting' means that", ["The robot stops whenever a person enters the cell", "Contact forces are limited so that touching a person does not cause injury", "The robot runs only at full speed behind fences", "The robot is moved only by hand guiding"], "b",
            "Power and force limiting keeps forces and power low enough that incidental contact with a human is safe."),
    new_mcq(2, T, "Which sensor is most commonly used to measure the angle of a robot joint?", ["Rotary encoder", "Thermocouple", "Light-dependent resistor", "Strain gauge"], "a",
            "Rotary encoders give joint angle (position) feedback to the controller."),
    new_mcq(3, T, "A planar robot arm with two links joined by two revolute joints (one at the base and one at the elbow) has how many degrees of freedom?", ["1", "2", "3", "6"], "b",
            "Each revolute joint adds one degree of freedom, so the arm has 2 DOF."),
    new_mcq(4, T, "Which actuator is most commonly used for precise position control of small robot joints?", ["Servo motor", "Induction motor without feedback", "Diesel engine", "Single-acting solenoid"], "a",
            "Servo motors with feedback give accurate position control."),
    new_mcq(5, T, "Inverse kinematics of a robot arm means", ["Finding the end-effector position from known joint angles", "Finding the joint angles needed to reach a given end-effector position", "Finding joint torques from motor currents", "Planning the layout of a robot cell"], "b",
            "Forward kinematics: joints → position; inverse kinematics: desired position → joint values."),
]
SA = [
    ("What is robotic engineering?", 2.5, [("Definition: branch of engineering combining mechanical, electrical/electronic and computer engineering to design, build, program and operate robots; purpose", 2.5)],
     "Robotic engineering is the interdisciplinary branch of engineering that designs, builds, programs, tests and maintains robots - machines that sense, decide and act to perform tasks automatically. It combines mechanical engineering (structure, kinematics, actuators), electrical and electronic engineering (sensors, drives, control circuits), and computer science (programming, control algorithms, AI), to make robots that carry out tasks that are repetitive, dangerous or need high precision."),
    ("What are the core components of robots? Explain each component.", 5, [("Components named and explained: mechanical structure/manipulator and end-effector, actuators/drives, sensors, controller, power supply, software/programming, (communication/HMI)", 5)],
     "1. Mechanical structure (manipulator) - links and joints that form the arm/body and give degrees of freedom. 2. End-effector - the tool at the end of the arm (gripper, welding torch, suction cup, screwdriver) that does the task. 3. Actuators/drives - electric servo or stepper motors, hydraulic or pneumatic cylinders that move the joints. 4. Sensors - internal (encoders, tachometers, IMUs) and external (vision cameras, force/torque, proximity, LiDAR) giving information about the robot and environment. 5. Controller - the 'brain' (computer/PLC/microcontroller) that runs programs, processes sensor data and commands actuators. 6. Power supply - electrical, hydraulic or pneumatic energy. 7. Software and user interface - programming (teach pendant, offline programming), algorithms and communication with other machines."),
    ("What are the types of robots? State their purpose.", 5, [("At least five types with purposes (industrial articulated/SCARA/Cartesian/delta, collaborative, mobile/AGV/AMR, service/medical, humanoid, drones, domestic)", 5)],
     "Industrial robots (articulated, SCARA, Cartesian/gantry, delta) - welding, painting, assembly, pick-and-place in factories. Collaborative robots (cobots) - work safely beside people in assembly, screwdriving, packaging. Mobile robots (AGVs, AMRs) - move materials in warehouses and factories. Service robots - cleaning, delivery, reception, hospitality. Medical robots - surgical robots, rehabilitation, pharmacy automation. Humanoid robots - human-like interaction and research. Field robots and drones (UAVs) - agriculture, inspection, mapping, disaster response. Domestic/educational robots - vacuum cleaners, toys and teaching tools."),
    ("List the applications of robotics and explain them.", 5, [("At least five application areas explained (manufacturing, medicine, agriculture, logistics, space/defence/hazardous, services, education/research)", 5)],
     "Manufacturing - welding, painting, assembly, machine tending, packaging and inspection with high speed and accuracy. Healthcare - minimally invasive surgery, rehabilitation, disinfection and medicine delivery. Agriculture - planting, harvesting, weeding, spraying with drones, milking robots. Logistics and warehousing - AGVs/AMRs for sorting and moving goods. Hazardous environments - bomb disposal, nuclear, mining, firefighting, underwater and space exploration. Services - cleaning, security patrols, hotel and restaurant service. Construction and inspection - bricklaying, 3D printing of buildings, pipeline and bridge inspection with drones. Education and research - teaching programming and STEM."),
    ("List five benefits of using robots in industry.", 2.5, [("Five benefits (0.5 each): productivity, quality/consistency, safety, cost reduction, 24/7 operation, flexibility, less waste", 2.5)],
     "1. Higher productivity - robots work fast and continuously (24/7). 2. Consistent quality and precision - fewer defects and rework. 3. Improved worker safety - robots take over dangerous, dirty and heavy tasks. 4. Lower operating costs over time - less labour cost, waste and scrap. 5. Flexibility - can be reprogrammed for new products; also better data collection and traceability."),
]
for i, (s, mk, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=mk, topic=T, group="me-technical-3-mtx2025-part2", pos=i + 1,
                  stem=f"Part II, question {i + 1}. {s} ({mk} marks)", key_points=kp, model=mod))
QS = """Answer the following questions:
1. Why have robots caught on in manufacturing? What knowledge do they require?
2. Can robots replace human workers in manufacturing? Explain your answer.
3. If you are considering introducing robots in your manufacturing plant, what management, organisation and technology issues would you need to address?"""
C1 = """Case I: Robots and people at Mercedes-Benz
Human involvement remains crucial in many manufacturing settings. For instance, current collaborative robots must often reduce speed or halt when people enter their workspace, causing interruptions in production. Baxter, a dual-armed collaborative robot from Rethink, has seen underwhelming sales as it primarily handles straightforward tasks like moving materials, picking parts, and packing or unpacking boxes. Its operational speed is limited by safety protocols. Despite technological progress, robots still fall short of replicating the delicate motor skills humans use to manipulate materials and small components. Handling soft or flexible items such as fabric or bundles of wires remains a significant challenge for robots.
While robots excel at performing repetitive, well-defined tasks with consistency, they struggle with adaptability. Mercedes-Benz had to reduce its reliance on robots in assembly lines because the high degree of customisation demanded by customers requires flexibility and dexterity that only humans can provide. Today's Mercedes buyers expect to personalise their vehicles extensively, selecting from options like carbon-fibre trim, four varieties of tyre valve caps, and heated or cooled cup holders across 30 different models. Robots cannot manage the vast array of customisation options available.
Mercedes has discovered that centring production around skilled human teams allows them to reconfigure assembly lines over a weekend, whereas reprogramming robots and adjusting workflows would take weeks, causing costly downtime. Although robots will continue to be part of Mercedes' manufacturing environment, they will be smaller, more adaptable, and work alongside human operators.
As robotic technology becomes more prevalent, the nature of human roles in manufacturing will evolve toward higher-level, more complex responsibilities. Workers will increasingly oversee and manage robotic systems, enhancing productivity and quality."""
C2 = """Case II: The new generation of easy-to-use robots
Robots are becoming easier to use, no longer requiring software engineers for programming. Many can learn tasks simply by guiding their arms and pressing a button.
At Renault's Cleon plant in France, Universal Robots from Denmark fasten screws in hard-to-reach engine parts. These robots have over 50-inch reach and six rotating joints, and verify correct assembly. Weighing about 64 pounds, they are portable and designed to work safely alongside humans, using sensors to avoid collisions.
This new robot generation is also entering other industries. ABB Ltd in Switzerland and others use them for assembling consumer electronics, while JCB Laboratories in Kansas employs robots to fill and cap syringes, working five to six times faster than humans.
Advanced robotics are transforming factories and global competition. By 2025, robots are expected to perform 25% of manufacturing tasks worldwide, up from 10%, with some sectors exceeding 40%. This could boost worker productivity by 30% and shift manufacturing leadership.
However, robots will not fully replace humans on production lines, as they still lack flexibility, precision and judgement."""
KP = [("1. Why robots caught on: productivity, consistency, safety, lower cost, 24/7, easier programming and cheaper cobots, competition, labour shortage (with case evidence)", 10),
      ("Knowledge required: task programming/teaching, sensors and vision, process knowledge, kinematics, safety standards, maintenance, data/AI; people with mechatronics skills", 8),
      ("2. Replace humans? Not fully: robots lack dexterity, flexibility, judgement (case examples: Mercedes customisation, soft materials); they replace repetitive tasks; human-robot collaboration; roles shift to supervision", 14),
      ("3. Management issues: cost-benefit/ROI, strategy, change management, job impacts", 6), ("Organisation issues: training/reskilling, new roles, workflows, labour relations, safety culture", 6), ("Technology issues: robot selection, integration with existing equipment/IT, safety (ISO 10218/TS 15066), maintenance, data, cybersecurity, flexibility", 6)]
MODEL = """1. Robots caught on because they work fast, accurately and continuously without fatigue, giving higher productivity and consistent quality; they take over dull, dirty and dangerous tasks, improving safety; costs of robots and sensors have fallen, and new collaborative robots are light, safe beside people and can be taught by guiding the arm, so they no longer need software engineers (e.g. Universal Robots at Renault, syringe filling five to six times faster); global competition and labour shortages push automation (robots expected to do 25% of manufacturing tasks by 2025, raising productivity by about 30%). Knowledge they require: the task sequence and positions (taught or programmed), process knowledge (torque for screws, quality checks), sensor and vision data to perceive parts and people, safety rules and limits, and integration with other machines and production systems; the plant needs staff skilled in programming, mechatronics, maintenance and data analysis.
2. Robots cannot fully replace human workers. They excel at repetitive, well-defined, high-volume tasks, but they lack human dexterity, adaptability and judgement: they struggle with soft or flexible materials (fabric, wire bundles), with high customisation (Mercedes reduced robots because of many options across 30 models and found human teams could reconfigure lines over a weekend while reprogramming robots took weeks), and cobots must slow down or stop near people. The likely future is human-robot collaboration: robots do repetitive or heavy tasks, while people handle complex assembly, problem-solving, quality judgement and supervising and maintaining robots, so jobs change rather than disappear.
3. Management issues: clear business case and return on investment, which tasks to automate, investment and running costs, phased implementation, change management, impact on jobs and communication with workers. Organisation issues: retraining and reskilling workers as robot operators, programmers and maintenance technicians; redesigning workflows and job roles; human-robot teamwork; labour relations; safety culture and procedures. Technology issues: choosing suitable robots (industrial vs collaborative, payload, reach, accuracy), end-effectors and sensors; integration with existing machines, PLCs and IT/ERP systems; safety standards (risk assessment, ISO 10218 and ISO/TS 15066 for cobots, guarding); flexibility and ease of reprogramming for product changes; maintenance and spare parts support; data, cybersecurity and reliability."""
Q += case("mtx2025", 1, T, C1, items=[(QS, 50, KP, MODEL)])
Q += case("mtx2025", 2, T, C2, items=[(QS, 50, KP, MODEL)])
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions (5 questions)", "type": "short_answer", "count": 1, "marks_each": 20, "answer_any": None},
    {"title": "Section B: Case study (answer either Case I or Case II)", "type": "passage", "count": 2, "marks_each": 50, "answer_any": 1},
]
