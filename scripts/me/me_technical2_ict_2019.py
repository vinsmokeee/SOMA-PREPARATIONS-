"""Marks follow the latest (BCSE 2025) layout: every short answer is set to 5 marks by supabase/data/me_technical2_ict_marks_2025_layout.sql.
ME Technical Paper II (General Subject Knowledge), ICT group, BCSE 2019 - real paper (PDF sent by the founder).
Part I 70 MCQ x 1; Part II 10 short answers x 3 (kept as printed). MCQ 5 '0.59 × 104' read as 0.59 × 10⁴.
Already on Soma (recorded as appearances, not loaded again): MCQ 44 (BCSE 2022 MCQ 57) and 49 (BCSE 2020 MCQ 43); MCQ 64
asks the same question as MCQ 11 of this paper, so it is not loaded twice.
Left out: MCQ 19 (unclear), 61 (One-Time Password and One-Time Passcode are both used), 67 (word-wrap and word-break both
fit), 69 (scope definition and scope statement both fit). Four new MCQs replace them.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, ICT): BCSE 2019, batch 1"
GROUP_TAG = "ict2019"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "ict"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2019 Main Examination, Technical Paper II, ICT", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 6, "marks_each": 5, "answer_any": None},
]
TOPIC = "ICT: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "In a data set, the most frequent occurring observation in data is named as",
"opts": [
"Mode",
"Mean",
"Median",
"Standard deviation"
]
},
{
"n": 2,
"stem": "If U = {1,2,3,4,5} and X = {2,4} then X' should be",
"opts": [
"{2,4,5}",
"{1,2,3,4,5}",
"{2,4}",
"{1,3,5}"
]
},
{
"n": 3,
"stem": "Which is not involved in debugging?",
"opts": [
"Identifying",
"Isolating",
"Test",
"Fixing"
]
},
{
"n": 4,
"stem": "In which layer of OSI, does the circuit switching takes place?",
"opts": [
"Physical layer.",
"Session layer",
"Application layer",
"Data link layer"
]
},
{
"n": 5,
"stem": "What would be the decimal form of 0.59 × 10⁴?",
"opts": [
"590",
"5900",
"59000",
"590000"
]
},
{
"n": 6,
"stem": "The matrices A and B can be subtracted if their",
"opts": [
"Elements are same.",
"Rows are same.",
"Columns are same.",
"Order is same."
]
},
{
"n": 7,
"stem": "The single logarithmic form of log 15 + log 7 is ___________________.",
"opts": [
"log (15 - 7)",
"log 22",
"log(15 × 7)",
"log (15 + 7)"
]
},
{
"n": 8,
"stem": "Which of the following would be the three arithmetic means between 11 and 19?",
"opts": [
"13, 15, 17",
"12, 14, 15",
"13, 14, 15",
"14, 15, 17"
]
},
{
"n": 9,
"stem": "The following is the syntax for: _______________ (condition) action",
"opts": [
"Else",
"Elif",
"If",
"Switch"
]
},
{
"n": 10,
"stem": "If the perimeter of an equilateral triangle is 15cm. What would be the length of one side?",
"opts": [
"3cm",
"45cm",
"15cm",
"5cm"
]
},
{
"n": 11,
"stem": "The software ___________ of a program or a computing system is the structure or structures of the system, which comprise software components, the externally visible properties of those components, and the relationships among them.",
"opts": [
"Design",
"Architecture",
"Process",
"Requirement"
]
},
{
"n": 12,
"stem": "Why there is a possibility of collision still exists in Carrier Sense Multiple Access (CSMA)?",
"opts": [
"Because of sender-receiver delay.",
"Because of sense delay.",
"Because of propagation delay.",
"Because of transmit delay."
]
},
{
"n": 13,
"stem": "Where do we use Super High frequency (SHF) for?",
"opts": [
"FM radio",
"Satellite communication",
"AM radio",
"Cellular phones"
]
},
{
"n": 14,
"stem": "What term is used to increase speed of switches to handle data?",
"opts": [
"Switching routes",
"Switching data",
"Switching frames",
"Switching fabric"
]
},
{
"n": 15,
"stem": "_______________ is a well-defined collection of objects.",
"opts": [
"Set",
"Population",
"Fraction",
"Equation"
]
},
{
"n": 16,
"stem": "How many bytes does IPv4 header of datagram has?",
"opts": [
"0 to 20 bytes",
"20 to 40 bytes",
"20 to 60 bytes",
"20 to 80 bytes"
]
},
{
"n": 17,
"stem": "What do we obtain by adding two successive class limits and dividing sum by 2?",
"opts": [
"Arithmetic mean",
"Class boundary",
"Frequency",
"Range"
]
},
{
"n": 18,
"stem": "How do we define a sine wave?",
"opts": [
"Amplitude",
"Frequency",
"Phase",
"All of the above."
]
},
{
"n": 19,
"stem": "Which one of the following is used for creating and translating program?",
"opts": [
"Software system",
"Hardware system",
"Compiler",
"Interpreter"
]
},
{
"n": 20,
"stem": "What is known as a queue holding data while data are waiting to be written in memory?",
"opts": [
"Read buffer",
"Queue buffer",
"Write buffer",
"Data buffer"
]
},
{
"n": 21,
"stem": "What happens to the datagram when one machine is using some other version of IPv4 in version field of IPv4 header?",
"opts": [
"Discarded",
"Accepted",
"Interpreted",
"Interpreted incorrectly"
]
},
{
"n": 22,
"stem": "How many address spaces will be there in a system with 8-bit addresses?",
"opts": [
"32",
"256",
"720",
"65535"
]
},
{
"n": 23,
"stem": "How do you represent the distribution function F(A)?",
"opts": [
"P(A=a)",
"P(A)",
"P(A>a)",
"P(A≤a)"
]
},
{
"n": 24,
"stem": "Which of the following scheduling algorithms is non-preemptive?",
"opts": [
"Round Robin",
"First-In First-Out",
"Multilevel Queue Scheduling",
"Multilevel Queue Scheduling with Feedback"
]
},
{
"n": 25,
"stem": "How does numbering starts in Transmission Control Protocol (TCP)?",
"opts": [
"1 always",
"Randomly assigned node",
"Randomly generated number",
"\"0\" Always"
]
},
{
"n": 26,
"stem": "Which one of the following term is used to create Web Pages?",
"opts": [
"TCP/IP",
"HTML",
"WWW",
"FTP"
]
},
{
"n": 27,
"stem": "What is known as the terms that control flow and errors in full duplex switched Ethernet?",
"opts": [
"LLC Sub layer",
"MAC Sub layer",
"LLC Control Layer",
"MAC Control Layer"
]
},
{
"n": 28,
"stem": "In which testing strategy requirements established during requirements analysis are validated against developed software?",
"opts": [
"Validation testing",
"Integration testing",
"Regression testing",
"System testing"
]
},
{
"n": 29,
"stem": "Why do we use rectifiers?",
"opts": [
"To convert high voltage to low voltage.",
"To convert low voltage to high voltage.",
"To convert alternating current to direct current.",
"To convert direct current to alternating current."
]
},
{
"n": 30,
"stem": "______________ sound has frequency below 20 Hz.",
"opts": [
"Audio sounds",
"Infrasonic",
"Ultrasonic",
"Supersonics"
]
},
{
"n": 31,
"stem": "What is the name of the unit used to express the nuclear size?",
"opts": [
"Fermi",
"Angstrom",
"Newton",
"Tesla"
]
},
{
"n": 32,
"stem": "Male or female, true or false are the examples of __________________.",
"opts": [
"Non-functional events",
"Non complementary events",
"Functional events",
"Complementary events"
]
},
{
"n": 33,
"stem": "If value of interval X is 2.5 and value of interval Y is 3.5 then what would be the value of mean for uniform distribution?",
"opts": [
"0.5",
"2.5",
"3",
"3.5"
]
},
{
"n": 34,
"stem": "_______________________ is a BSS without an AP.",
"opts": [
"Adhoc network",
"Infrastructure network",
"Connectionless network",
"Channelization network"
]
},
{
"n": 35,
"stem": "Dorji throws a total of 5 on a toss of two dice, then what will be the probability that he will throw another 5 before he throws 7?",
"opts": [
"1/9",
"2/5",
"1/6",
"5/36"
]
},
{
"n": 36,
"stem": "Sangay covers a distance at a speed of 24 km/hr in 6 min. If he wants to take 8 minutes to cover the same distance, what should be his speed?",
"opts": [
"21 km/hr",
"30 km/hr",
"48 km/hr",
"18 km/hr"
]
},
{
"n": 37,
"stem": "Working software is not available until late in the process in",
"opts": [
"Waterfall model",
"Prototyping model",
"Incremental model",
"Evolutionary Development model"
]
},
{
"n": 38,
"stem": "The greatest fractions from the given 5/8, 2/3, 7/9, 3/5 is _____.",
"opts": [
"5/8",
"2/3",
"7/9",
"3/5"
]
},
{
"n": 39,
"stem": "Which of the following requires a device driver?",
"opts": [
"Register",
"Cache",
"Main memory",
"Disk"
]
},
{
"n": 40,
"stem": "What would be increase in area of circle when the radius of a circle is increased by 6%?",
"opts": [
"12%",
"12.36%",
"12.64%",
"6%"
]
},
{
"n": 41,
"stem": "A Logical address refers to the address that is generated by the______________.",
"opts": [
"CPU",
"Memory Unit",
"Hard Drive",
"Graphics Card"
]
},
{
"n": 42,
"stem": "What allows the user to run several applications at the same time?",
"opts": [
"Multithreading",
"Multitasking",
"Multiprocessing",
"Multiprogramming"
]
},
{
"n": 43,
"stem": "What is maximum length of 1000BaseSX?",
"opts": [
"25 m",
"100 m",
"550 m",
"1000 m"
]
},
{
"n": 44,
"stem": "What is NOS?",
"opts": [
"Network Operating System",
"Novell Operating System",
"Network Operating Services",
"New Operating Services"
]
},
{
"n": 45,
"stem": "While running DOS on a PC, which command would be used to duplicate the entire diskette?",
"opts": [
"Hardcopy",
"Softcopy",
"Diskcopy",
"None"
]
},
{
"n": 46,
"stem": "Approximately, how long does the light take to reach the earth surface?",
"opts": [
"5 minutes",
"8 minutes",
"15 minutes",
"16 minutes"
]
},
{
"n": 47,
"stem": "What is the correct syntax of for the given statement?",
"opts": [
"For (initialization; condition; update)",
"For (initialization, condition, update)",
"For (condition; initialization; update)",
"For (initialization; condition;)"
]
},
{
"n": 48,
"stem": "Which of the following operator is incorrect in c programming?",
"opts": [
"> =",
"< =",
"< >",
"= ="
]
},
{
"n": 49,
"stem": "The number of values a function can return at a time is",
"opts": [
"1",
"0",
"2",
"more than 2"
]
},
{
"n": 50,
"stem": "A program that reads each of the instructions in mnemonic form and translates it into the machine-language equivalent is",
"opts": [
"Machine language",
"Assembler",
"Interpreter",
"C program"
]
},
{
"n": 51,
"stem": "Each byte of character is stored as its ASCII value in _________.",
"opts": [
"Binary",
"Octal",
"Decimal",
"Hexadecimal"
]
},
{
"n": 52,
"stem": "A program that can execute high-level language programs is",
"opts": [
"Compiler",
"Interpreter",
"Sensor",
"Circuitry"
]
},
{
"n": 53,
"stem": "Which of the following is a common testing conducted by the developers?",
"opts": [
"Unit testing",
"Entry testing",
"Phrase testing",
"Code testing"
]
},
{
"n": 54,
"stem": "A __________ is a set of instructions which is prepared to perform a specific assignment if executed by a computer.",
"opts": [
"Browser",
"Internet",
"Program",
"Code"
]
},
{
"n": 55,
"stem": "To get the result of 192, a number is multiplied by its one-third. What would be the number?",
"opts": [
"16",
"20",
"28",
"24"
]
},
{
"n": 56,
"stem": "A relational database consists of a collection of",
"opts": [
"Tables",
"Fields",
"Records",
"Keys"
]
},
{
"n": 57,
"stem": "The _________ operation allows the combining of two relations by merging pairs of tuples, one from each relation, into a single tuple.",
"opts": [
"Select",
"Join",
"Union",
"Intersection"
]
},
{
"n": 58,
"stem": "Address FE80::12 is a __________________.",
"opts": [
"Link local address",
"Site local address",
"Multicast address",
"Loop back address"
]
},
{
"n": 59,
"stem": "An attribute A of datatype varchar(20) has the value “Avi”. The attribute B of datatype char(20) has value ”Reed”. Here attribute A has ____ spaces and attribute B has ____ spaces.",
"opts": [
"3, 20",
"20, 4",
"20, 20",
"3, 4"
]
},
{
"n": 60,
"stem": "We can test for the nonexistence of tuples in a subquery by using the _____ construct.",
"opts": [
"Not exist",
"Not exists",
"Exists",
"Exist"
]
},
{
"n": 61,
"stem": "What is OTP?",
"opts": [
"One-Time Passcode",
"On-Time Passcode",
"One-Time Password",
"On-Time Password"
]
},
{
"n": 62,
"stem": "An attribute in a relation is a foreign key if the _________ key from one relation is used as an attribute in that relation.",
"opts": [
"Candidate",
"Primary",
"Super",
"Sub"
]
},
{
"n": 63,
"stem": "Testing of software with actual data and in actual environment is called",
"opts": [
"Alpha testing",
"Regression testing",
"None of the above",
"Beta testing"
]
},
{
"n": 64,
"stem": "The _________________ of a program or computing system is the structure or structures of the system, which comprise software components, the externally visible properties of these components, and the relationship among them.",
"opts": [
"E-R diagram",
"Data flow diagram",
"Software architecture",
"Software design"
]
},
{
"n": 65,
"stem": "The organized process or set of steps that needs to be followed to develop an information system is known as",
"opts": [
"Analytical cycle",
"Design cycle",
"Program specification",
"System development life cycle"
]
},
{
"n": 66,
"stem": "When is the acceptance testing performed in Agile development?",
"opts": [
"On request of customer.",
"At the end of each iteration.",
"After system is ready.",
"Daily."
]
},
{
"n": 67,
"stem": "Which of the following CSS property allows long words to be able to be broken and wrap onto the next line?",
"opts": [
"Line-wrap",
"Break-word",
"Word-wrap",
"Word-break"
]
},
{
"n": 68,
"stem": "The process mapping is a ____________ diagram.",
"opts": [
"Data flow",
"Workflow",
"Circular",
"Audit"
]
},
{
"n": 69,
"stem": "What should a project manager do or follow to ensure clear boundaries for project completion?",
"opts": [
"Scope verification",
"Scope definition",
"Risk management plan",
"Completing a scope statement"
]
},
{
"n": 70,
"stem": "A pseudocode is _____________________________.",
"opts": [
"an easy way to communicate the logic of a program, in English¬like statements",
"a protocol used in data communication",
"a computer generated random number",
"a machine code"
]
}
]"""

KEY = {
    1: ("a", "The mode is the most frequently occurring value."),
    2: ("d", "X' = U − X = {1, 3, 5}."),
    3: ("c", "Debugging is identifying, isolating and fixing errors; testing is a separate activity that finds them."),
    4: ("a", "Circuit switching sets up a dedicated physical path - the physical layer."),
    5: ("b", "0.59 × 10,000 = 5,900."),
    6: ("d", "Matrices can be added or subtracted only if they have the same order (rows × columns)."),
    7: ("c", "log a + log b = log (a × b): log (15 × 7)."),
    8: ("a", "Common difference (19 − 11)/4 = 2: 13, 15, 17."),
    9: ("c", "if (condition) action is the syntax of the if statement."),
    10: ("d", "15 ÷ 3 = 5 cm."),
    11: ("b", "This is the standard definition of software architecture."),
    12: ("c", "Even after sensing the channel idle, a station may transmit before another's signal arrives because of propagation delay."),
    13: ("b", "SHF (3-30 GHz) is used for satellite communication and microwave links."),
    14: ("d", "The switching fabric moves data from input to output ports; faster fabric speeds up a switch."),
    15: ("a", "A set is a well-defined collection of objects."),
    16: ("c", "The IPv4 header is 20 to 60 bytes."),
    17: ("b", "Adding the upper limit of one class and the lower limit of the next and halving gives the class boundary."),
    18: ("d", "A sine wave is defined by its amplitude, frequency and phase."),
    20: ("c", "A write buffer holds data waiting to be written to memory."),
    21: ("a", "A datagram with a different version number is discarded."),
    22: ("b", "8-bit addresses give 2^8 = 256 addresses."),
    23: ("d", "The distribution function is F(a) = P(A ≤ a)."),
    24: ("b", "FIFO (First-Come First-Served) is non-preemptive; round robin and the multilevel queues preempt."),
    25: ("c", "TCP's initial sequence number is a randomly generated number."),
    26: ("b", "Web pages are created with HTML."),
    27: ("d", "Flow and error control in full-duplex switched Ethernet is done by the MAC control layer."),
    28: ("a", "Validation testing checks the developed software against the requirements from analysis."),
    29: ("c", "A rectifier converts alternating current to direct current."),
    30: ("b", "Sound below 20 Hz is infrasonic."),
    31: ("a", "Nuclear sizes are expressed in fermi (1 fm = 10^-15 m)."),
    32: ("d", "Outcomes such as male/female or true/false that exclude each other and cover all cases are complementary events."),
    33: ("c", "Mean of a uniform distribution = (a + b)/2 = (2.5 + 3.5)/2 = 3."),
    34: ("a", "A BSS without an access point is an ad hoc network."),
    35: ("b", "P(5) = 4/36, P(7) = 6/36; the chance 5 comes before 7 = 4/(4 + 6) = 2/5."),
    36: ("d", "Distance = 24 × 6/60 = 2.4 km; speed = 2.4 ÷ (8/60) = 18 km/hr."),
    37: ("a", "In the waterfall model working software appears only near the end."),
    38: ("c", "As decimals: 0.625, 0.667, 0.778, 0.6 - 7/9 is the greatest."),
    39: ("d", "A disk is a peripheral device that needs a device driver."),
    40: ("b", "Area ∝ r²: 1.06² = 1.1236, an increase of 12.36%."),
    41: ("a", "The CPU generates logical (virtual) addresses."),
    42: ("b", "Multitasking lets a user run several applications at the same time."),
    43: ("c", "1000BASE-SX on multimode fibre reaches up to about 550 m."),
    45: ("c", "DISKCOPY duplicates an entire diskette in DOS."),
    46: ("b", "Sunlight takes about 8 minutes (8 min 20 s) to reach the Earth."),
    47: ("a", "for (initialization; condition; update)."),
    48: ("c", "C uses != for 'not equal'; <> is not a C operator."),
    50: ("b", "An assembler translates mnemonic (assembly) instructions into machine language."),
    51: ("a", "Characters are stored as their ASCII values in binary."),
    52: ("b", "An interpreter executes high-level programs directly, line by line."),
    53: ("a", "Developers commonly carry out unit testing of their own code."),
    54: ("c", "A program is a set of instructions for a computer to perform a task."),
    55: ("d", "n × n/3 = 192 gives n² = 576, n = 24."),
    56: ("a", "A relational database is a collection of tables (relations)."),
    57: ("b", "A join combines pairs of tuples from two relations into single tuples."),
    58: ("a", "FE80::/10 addresses are IPv6 link-local addresses."),
    59: ("a", "varchar(20) stores only 'Avi' (3); char(20) is padded to 20."),
    60: ("b", "NOT EXISTS tests that a subquery returns no rows."),
    62: ("b", "A foreign key is the primary key of one relation used as an attribute in another."),
    63: ("d", "Beta testing uses real users, real data and the actual environment."),
    65: ("d", "The organised set of steps to develop an information system is the system development life cycle (SDLC)."),
    66: ("b", "In Agile, acceptance testing is done at the end of each iteration."),
    68: ("b", "Process mapping produces a workflow diagram."),
    70: ("a", "Pseudocode describes program logic in simple English-like statements."),
}

NEW_MCQ = [
    ("Which software translates an entire high-level program into machine code before it is run?", ["Interpreter", "Compiler", "Assembler", "Loader"], "b",
     "A compiler translates the whole source program into machine code first; an interpreter translates and runs it line by line."),
    ("Which of the following is the strongest example of multi-factor authentication?", ["A long password", "A password plus a fingerprint scan", "Two security questions", "A username and a PIN"], "b",
     "It combines something you know (password) with something you are (fingerprint)."),
    ("Which HTML tag creates a hyperlink?", ["<link>", "<a>", "<href>", "<url>"], "b",
     "<a href=\"...\"> creates a hyperlink; <link> connects external resources such as style sheets."),
    ("Which document clearly states what work is included and excluded in a project?", ["Risk register", "Scope statement", "Gantt chart", "Budget"], "b",
     "The project scope statement defines the deliverables and boundaries (what is in and out of scope)."),
]

SAQ = [
 dict(marks=3, stem="Outline any three prerequisites to configure a server. (3 marks)",
      kp=[("Suitable hardware and network: server hardware with enough CPU/RAM/storage, power backup (UPS), network connection", 1),
          ("Operating system and software: server OS installed and updated, required roles/ services (web, DNS, DHCP, database), licences", 1),
          ("Network and security settings: static IP address, hostname and DNS, firewall rules, administrator accounts and strong passwords, backup plan", 1)],
      model="(1) Hardware and environment: server hardware with enough processor, memory and storage for the expected load, RAID/ backup storage, a stable power supply with UPS and a cooled, secure room. (2) Operating system and software: a server operating system (e.g. Windows Server or Linux) installed and patched, plus the required services or roles (web, DNS, DHCP, database) and valid licences. (3) Network and security configuration: a static IP address, hostname and DNS records, gateway settings, firewall rules and open ports, administrator accounts with strong passwords and a backup and recovery plan."),
 dict(marks=3, stem="Differentiate between communication and transmission. (3 marks)",
      kp=[("Communication: the whole process of exchanging meaningful information between a sender and receiver, involving message, sender, receiver, medium and protocol (understanding)", 1.5),
          ("Transmission: the physical sending of signals/ data over a medium from one point to another (one part of communication), concerned with signals, bandwidth and media", 1.5)],
      model="Communication is the complete process of exchanging meaningful information between a sender and a receiver; it has five components - message, sender, receiver, medium and protocol - and succeeds only when the receiver understands the message (it can be two-way, with feedback). Transmission is the physical act of sending data as signals (electrical, light or radio) through a medium such as cable, fibre or air from one point to another; it is one part of communication and deals with signals, bandwidth, speed and transmission media rather than meaning."),
 dict(marks=3, stem="Why do we need to implement a fault-tolerant system? State some of its limitations. (3 marks)",
      kp=[("Need: keeps the system working when a component fails - high availability, no data loss, continuity of critical services (banking, hospitals, government), reliability", 1.5),
          ("Limitations: higher cost (redundant hardware, software, power), more complexity to design and maintain, extra space/ energy, may not cover every failure (common-mode failures), reduced performance from replication", 1.5)],
      model="A fault-tolerant system continues to operate correctly even when some of its components fail, using redundancy such as RAID disks, backup servers, dual power supplies and failover clustering. It is needed for critical services (banking, hospitals, e-government, data centres) to ensure high availability, prevent data loss and downtime, and keep users' trust. Limitations: it is costly because hardware, software and power are duplicated; design, testing and maintenance are more complex; it needs more space and energy; replication and checking can reduce performance; and it cannot protect against every fault - for example a design bug or a disaster affecting all copies at once."),
 dict(marks=3, stem="In what ways do fibre optics have advantages over other transmission media? (3 marks)",
      kp=[("Much higher bandwidth and data rates over longer distances with low signal loss (attenuation)", 1), ("Immune to electromagnetic interference and lightning; no crosstalk", 1),
          ("More secure (hard to tap), light weight and thin, no corrosion/ sparks; any one", 1)],
      model="Optical fibre carries data as light, which gives several advantages over copper cable and radio: (1) very high bandwidth and data rates (gigabits to terabits per second); (2) low attenuation, so signals travel tens of kilometres without repeaters; (3) immunity to electromagnetic interference, radio noise and lightning, and no crosstalk between cables; (4) better security, because it is difficult to tap without being detected; and (5) thin, light, flexible cables that do not corrode or spark, making them safe in hazardous areas."),
 dict(marks=3, stem="How does the Dynamic Host Configuration Protocol (DHCP) help in network administration? (3 marks)",
      kp=[("DHCP automatically assigns IP addresses and configuration (subnet mask, default gateway, DNS) to devices from a pool", 1),
          ("Saves administrators manual work and prevents errors such as duplicate IP addresses; easy to add/ move devices", 1),
          ("Central management: leases reuse addresses, reservations for servers/ printers, changes made once at the server (DORA process)", 1)],
      model="DHCP automatically gives each device that joins the network an IP address and other settings - subnet mask, default gateway and DNS server - from a pool managed by the DHCP server, using the Discover-Offer-Request-Acknowledge (DORA) exchange. This helps administrators because: (1) they no longer configure every computer by hand, saving time when devices are added or moved; (2) it prevents errors such as duplicate or wrong IP addresses; and (3) management is central - addresses are leased and reused when devices leave, fixed addresses can be reserved for servers and printers, and a change (e.g. a new DNS server) is made once on the DHCP server."),
 dict(marks=3, stem="Briefly explain the terms unicasting, multicasting and broadcasting. (3 marks)",
      kp=[("Unicasting: one-to-one - data sent from one sender to a single specific receiver (e.g. web browsing)", 1), ("Multicasting: one-to-many - data sent to a selected group of receivers that joined a multicast group (e.g. IPTV, video conferencing)", 1),
          ("Broadcasting: one-to-all - data sent to every device on the network segment (e.g. ARP request, 255.255.255.255)", 1)],
      model="Unicasting is one-to-one communication: a packet is sent from one sender to one specific receiver, as in normal web browsing or email. Multicasting is one-to-many: a single stream is sent to a group of interested receivers that have joined a multicast group (e.g. IPTV, live streaming and video conferences), saving bandwidth compared with many unicasts. Broadcasting is one-to-all: a packet is sent to every device on the local network segment, for example an ARP request or a DHCP Discover sent to 255.255.255.255."),
 dict(marks=3, stem="Provide some advantages of IPv6 over IPv4. (3 marks)",
      kp=[("Much larger address space: 128-bit addresses (about 3.4 × 10^38) vs 32-bit, ending address shortage and the need for NAT", 1),
          ("Simpler, more efficient header and routing; no broadcast (multicast/ anycast instead); built-in stateless auto-configuration", 1),
          ("Built-in security (IPsec), better quality of service (flow label) and mobility support", 1)],
      model="(1) Huge address space: IPv6 uses 128-bit addresses (about 3.4 × 10^38) compared with IPv4's 32 bits (about 4.3 billion), so every device can have a unique global address and NAT is no longer needed. (2) Efficiency: a simpler fixed-length header and no router fragmentation make routing faster; broadcast is replaced by multicast and anycast. (3) Easier configuration: stateless address auto-configuration lets devices configure themselves. (4) Security and services: IPsec support is built in, and the flow label improves quality of service, with better support for mobile devices."),
 dict(marks=3, stem="What is the equivalent code of the following statement in WHILE LOOP format? Write the output of the program when executed.\nfor (a = 1; a <= 10; a++)\n    printf(\"%d\\n\", a * a); (3 marks)",
      kp=[("Initialisation before the loop: a = 1; while (a <= 10)", 1), ("Body prints a * a and then increments a (a++)", 1), ("Output: the squares 1, 4, 9, 16, 25, 36, 49, 64, 81, 100, each on a new line", 1)],
      model="a = 1;\nwhile (a <= 10)\n{\n    printf(\"%d\\n\", a * a);\n    a++;\n}\nOutput (one per line): 1 4 9 16 25 36 49 64 81 100."),
 dict(marks=3, stem="Name 3 relationships of a database. (3 marks)",
      kp=[("One-to-one (1:1) - e.g. one person has one passport", 1), ("One-to-many (1:M) - e.g. one department has many employees", 1), ("Many-to-many (M:N) - e.g. students and courses (implemented with a junction table)", 1)],
      model="(1) One-to-one (1:1): one record in a table relates to only one record in another, e.g. a citizen and their CID card. (2) One-to-many (1:M): one record relates to many records in another table, e.g. one department has many employees. (3) Many-to-many (M:N): many records in one table relate to many in another, e.g. students and courses, implemented with a linking (junction) table."),
 dict(marks=3, stem="Write the 6 stages of the Software Development Life Cycle (SDLC). (3 marks)",
      kp=[("Planning/ requirement analysis; system analysis (requirements specification)", 1), ("Design; implementation (coding)", 1), ("Testing; deployment and maintenance", 1)],
      model="The six stages of the SDLC are: (1) Planning and requirement gathering - feasibility, scope and goals; (2) Analysis - detailed requirements documented in the SRS; (3) Design - system architecture, database and interface design; (4) Implementation (coding) - writing the programs; (5) Testing - unit, integration, system and acceptance testing to find and fix defects; (6) Deployment and maintenance - installing the system for users and then correcting, updating and improving it."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
