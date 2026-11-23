"""ME Technical Paper II (General Subject Knowledge), ICT group, BCSE 2020 (held February 2021) - real paper (PDF sent by
the founder). Part I 70 MCQ x 1; Part II 10 short answers x 3 (kept as printed). MCQ 15 (cubes) and 64 (circles) and
Part II Q6 (HTML table) keep the paper's figure; Part II Q3 gives the code as text. MCQ 38 '3-inout' read as 3-input.
Already on Soma (loaded from BCSE 2022, recorded as appearances): MCQ 2 and 8.
Left out: MCQ 19 (C++ structures also allow member functions), 25 (ROLLBACK after COMMIT - two readings), 51, 55
(multiprogramming/ multiprocessing both defensible), 62 (formula and function both defensible), 66 (SMTP is not a
transport-layer protocol; TCP also fits), 69 (two statements produce errors). Seven new MCQs replace them.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, ICT): BCSE 2020, batch 1"
GROUP_TAG = "ict2020"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "ict"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2020 Main Examination, Technical Paper II, ICT", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 6, "marks_each": 5, "answer_any": None},
]
TOPIC = "ICT: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Consider the following series: 26, 21, …, 11, 6. What is the missing number?",
"opts": [
"27",
"23",
"16",
"29"
]
},
{
"n": 2,
"stem": "Find the mean of the following set of numbers: 1,1,1,2,4,5,5,7,8,12",
"opts": [
"5",
"4.5",
"4",
"4.6"
]
},
{
"n": 3,
"stem": "What is the binary equivalent of the decimal number 35?",
"opts": [
"100011",
"110001",
"110101",
"101011"
]
},
{
"n": 4,
"stem": "SATA is the abbreviation of",
"opts": [
"Serial Advanced Technology Attachment.",
"Serial Advanced Technology Architecture.",
"Serial Advanced Technology Adapter.",
"Serial Advanced Technology Array."
]
},
{
"n": 5,
"stem": "Debugging is the Process of",
"opts": [
"rolling out a software program.",
"modifying a software program.",
"checking the design structure of the software program.",
"checking errors in a software program."
]
},
{
"n": 6,
"stem": "What is the maximum header size of an IP packet?",
"opts": [
"32 bits",
"32 bytes",
"60 bytes",
"60 bits"
]
},
{
"n": 7,
"stem": "Which one of the following converts assembly language into machine language?",
"opts": [
"Algorithm",
"Interpreter",
"Compiler",
"Assembler"
]
},
{
"n": 8,
"stem": "URL stands for",
"opts": [
"Uniform Resource Locator",
"Uniform Resource Library",
"United Resource Locators",
"United Resource Library"
]
},
{
"n": 9,
"stem": "class Vehicle { Protected String brand = “Toyota”; Public void honk() { System.out.println(“Tuut, tuut!”); } } Class Car extends Vehicle { Private String modelName = “Prado”; Public static void main (…..) { Car myCar = new Car(); myCar.honk(); } } This is an example of",
"opts": [
"Polymorphism",
"Inheritance",
"Encapsulation",
"All of the above."
]
},
{
"n": 10,
"stem": "IEEE Standard for Bluetooth technology is",
"opts": [
"IEEE 802.15.1",
"IEEE 802.15.2",
"IEEE 803.15.1",
"IEEE 801.15.1"
]
},
{
"n": 11,
"stem": "The processes that are residing in the main memory and are ready and waiting to execute are kept on a list called",
"opts": [
"Job queue",
"Ready queue",
"Execution queue",
"Process queue"
]
},
{
"n": 12,
"stem": "When is a destructor called?",
"opts": [
"After the end of object life.",
"Anytime in between object’s lifespan.",
"At end of whole program.",
"Just before the end of object life."
]
},
{
"n": 13,
"stem": "How is friction due to air reduced?",
"opts": [
"Streamlining",
"Lubrication",
"By using ball bearings",
"By polishing"
]
},
{
"n": 14,
"stem": "A hybrid computer is the one having the combined properties of",
"opts": [
"Super and microcomputers",
"Mini and microcomputers",
"Analog and digital computers",
"Super and minicomputers"
]
},
{
"n": 15,
"stem": "What is the volume of the figure given below? (Each small cube has sides of 5 cm.)",
"opts": [
"125 cm³",
"875 cm³",
"1000 cm³",
"500 cm³"
],
"image": "/papers/me/tech2-ict-2020-cubes.png"
},
{
"n": 16,
"stem": "DHCP is the abbreviation of",
"opts": [
"Dynamic Host Control Protocol",
"Dynamic Host Configuration Protocol",
"Dynamic Hyper Control Protocol",
"Dynamic Hyper Configuration Protocol"
]
},
{
"n": 17,
"stem": "fe80::aede:48ff:fe00:1122 is",
"opts": [
"Global IPv6 Address",
"Loopback IPv6 Address",
"Link-local IPv6 Address",
"Multicast IPv6 Address"
]
},
{
"n": 18,
"stem": "What is the process of writing down computer instructions known as?",
"opts": [
"Assembling",
"Coding",
"Executing",
"Compiling"
]
},
{
"n": 19,
"stem": "What is the additional feature in classes that was not in structures?",
"opts": [
"Data members",
"Member functions",
"Static data allowed",
"Public access specifier"
]
},
{
"n": 20,
"stem": "Which IEEE Identifier does Stateless Address autoconfiguration use in generating an IPv6 address in a node?",
"opts": [
"MAC Address",
"Multicast IPv6 Address",
"Loopback Address",
"IEEE 802.15.1"
]
},
{
"n": 21,
"stem": "Which of the following WiFi 802.11 standard has the highest data transmission rates in 5GHz channel?",
"opts": [
"IEEE 802.11a",
"IEEE 802.11ac",
"IEEE 802.11n",
"IEEE 802.11g"
]
},
{
"n": 22,
"stem": "Exclusive-OR (XOR) logic gates can be constructed from what other logic gates?",
"opts": [
"OR gates only",
"AND gates and NOT gates",
"AND gates, OR gates, and NOT gates",
"OR gates and NOT gates"
]
},
{
"n": 23,
"stem": "Which one of the following is not an output device?",
"opts": [
"Scanner",
"Printer",
"Plotter",
"Monitor"
]
},
{
"n": 24,
"stem": "Which join is SQL server default?",
"opts": [
"Outer",
"Inner",
"Equi",
"None of the above"
]
},
{
"n": 25,
"stem": "Considering the following action: What does the ROLLBACK action do?",
"opts": [
"Undo the transactions before commit.",
"Clears all transactions.",
"Redo the transactions before commit.",
"No action."
]
},
{
"n": 26,
"stem": "What will be the total minimum bandwidth of the channel required for 7 channels of 400 kHz bandwidth multiplexed together with each guard band of 20 kHz?",
"opts": [
"2800 khz",
"2600 khz",
"3600 khz",
"2920 khz"
]
},
{
"n": 27,
"stem": "Microprocessors can be used to make",
"opts": [
"Computer",
"Digital system",
"Both (a) and (b)",
"Neither (a) nor (b)"
]
},
{
"n": 28,
"stem": "What is software?",
"opts": [
"Software is a set of programs.",
"Software is documentation and configuration of data.",
"Software is a set of programs, documentations and configuration of data.",
"None of the above."
]
},
{
"n": 29,
"stem": "Which is the process of encoding information from a message source in suitable manner for transmission?",
"opts": [
"Modulation",
"Demodulation",
"Encryption",
"Decryption"
]
},
{
"n": 30,
"stem": "Advanced Encryption Standard (AES) is based on",
"opts": [
"Asymmetric key algorithm",
"Symmetric key algorithm",
"Public key algorithm",
"Key exchange"
]
},
{
"n": 31,
"stem": "A problem encountered in multitasking when a process is perpetually denied necessary resources is called",
"opts": [
"Deadlock",
"Starvation",
"Inversion",
"Aging"
]
},
{
"n": 32,
"stem": "How many prime numbers are there between1 to 20?",
"opts": [
"5",
"6",
"7",
"8"
]
},
{
"n": 33,
"stem": "Which of the following is NOT a type of IPv6 communication?",
"opts": [
"Loopback",
"Global",
"Multicast",
"Broadcast"
]
},
{
"n": 34,
"stem": "The Layer 3 of the Internet protocol suite is concerned with ___________ of data.",
"opts": [
"bits",
"packets",
"frames",
"bytes"
]
},
{
"n": 35,
"stem": "What is the Highest Common Factor of 26 and 91?",
"opts": [
"15",
"13",
"19",
"1"
]
},
{
"n": 36,
"stem": "The average score in a class of 15 is 86%. If one additional student scores 100%, what is the new average score?",
"opts": [
"93%",
"86.875%",
"87.4%",
"85.275%"
]
},
{
"n": 37,
"stem": "Which organization is responsible for developing Long-Term Evolution (LTE) standards?",
"opts": [
"UMTS",
"3GPP",
"4GPP",
"ISO"
]
},
{
"n": 38,
"stem": "If a 3-input NOR gate has eight input possibilities, how many of these possibilities will result in a HIGH output?",
"opts": [
"1",
"2",
"7",
"8"
]
},
{
"n": 39,
"stem": "Which of the following is the binary number for 132 in decimal?",
"opts": [
"10000000",
"10000110",
"10000100",
"10000101"
]
},
{
"n": 40,
"stem": "Which type of system can learn and adjust to new circumstances by themselves?",
"opts": [
"Database management system",
"Expert systems",
"Geographical systems",
"Neural networks"
]
},
{
"n": 41,
"stem": "What is the size of MAC Address?",
"opts": [
"16-bits",
"32-bits",
"48-bits",
"64-bits"
]
},
{
"n": 42,
"stem": "When a positive charge is released in an electric field, it moves",
"opts": [
"in a straight line.",
"from a higher to lower point of potential.",
"from a lower to higher point of potential.",
"None of the above"
]
},
{
"n": 43,
"stem": "The number of values a function can return at a time is",
"opts": [
"1",
"0",
"2",
"More than 2"
]
},
{
"n": 44,
"stem": "Specialized programs that allow particular input or output devices to communicate with the rest of the computer system are called",
"opts": [
"Operating systems",
"Utilities",
"Device drivers",
"Connectors"
]
},
{
"n": 45,
"stem": "An attribute A of datatype varchar(20) has the value “Bhutan”. The attribute B of datatype char(20) also has value “Bhutan”. How many spaces does attribute A and B have?",
"opts": [
"A has 20 and B has 20",
"A has 6 and B has 6",
"A has 6 and B has 20",
"A has 20 and B has 6"
]
},
{
"n": 46,
"stem": "In the given query below, which of the following keyword has to be inserted? INSERT INTO employee ___________ (1002, Sonam, 2020);",
"opts": [
"Table",
"Values",
"Relation",
"Field"
]
},
{
"n": 47,
"stem": "Which one of the following is the number of bits available for the host address if it is on a 16- bit network?",
"opts": [
"16",
"216",
"32",
"2(16-2)"
]
},
{
"n": 48,
"stem": "When a = 9, b = 12, c = 3 then output of x = a-b/3+c*2-1 is",
"opts": [
"8",
"10",
"12",
"15"
]
},
{
"n": 49,
"stem": "With reference to computers, which one of the following best describes phishing?",
"opts": [
"A malicious program installed on a system that stays concealed to avoid detection.",
"A method of bypassing normal authentication procedures over a connection to a network.",
"A type of unsolicited bulk email of identical message sent to numerous recipients.",
"An attempt to acquire sensitive information for malicious reason, by masquerading as a trustworthy entity."
]
},
{
"n": 50,
"stem": "In a top secret message, if LIVING is coded as QNANSL. How will BHUTAN be coded?",
"opts": [
"GNYXFS",
"GMZYFS",
"WCPOVI",
"FMZYFS"
]
},
{
"n": 51,
"stem": "System Requirement Studies (SRS) consists of",
"opts": [
"Problem statement",
"Product design",
"Problem statement and product design",
"None of the above"
]
},
{
"n": 52,
"stem": "Dechen prefers Economics to Maths, English to Social Studies, and Computer to History. If she prefers Maths to History, and Social Studies to Maths, which is her least preferred subject?",
"opts": [
"History",
"Maths",
"Social Studies",
"Computer"
]
},
{
"n": 53,
"stem": "In Pokemon Go app, people wander around the places to collect pokemon to score points which confine the game by interacting with the characters, and then making progress in virtual environments by going to real-life places. What type of technology was related to the game?",
"opts": [
"Artificial Intelligence",
"Sleeker",
"Virtual Reality",
"Augmented Reality"
]
},
{
"n": 54,
"stem": "What can be considered as basic building blocks of a digital circuit?",
"opts": [
"Logic Gate",
"Diode",
"Semi Conductor",
"CMOS"
]
},
{
"n": 55,
"stem": "If CPU executes multiple programs simultaneously, it will be known as",
"opts": [
"Multiprocessing",
"Multitasking",
"Timesharing",
"Multiprogramming"
]
},
{
"n": 56,
"stem": "Which one of the following statements is FALSE?",
"opts": [
"HTTP runs over TCP",
"HTTP describes the structure of web pages",
"HTTP allows information to be stored in a URL",
"HTTP can be used to test the validity of a hypertext link"
]
},
{
"n": 57,
"stem": "The percentage of times a page number is found in the Translation Lookaside Buffer (TLB) is called",
"opts": [
"Miss ratio",
"Hit ratio",
"Miss percent",
"None of the above"
]
},
{
"n": 58,
"stem": "A bag has 3 red balls and 5 green balls. If we take a ball from the bag, then what is the probability of getting red balls only?",
"opts": [
"3",
"8",
"3/8",
"1/8"
]
},
{
"n": 59,
"stem": "IPv4 address is made up of 32 bits. IPv6 address is",
"opts": [
"4 bytes",
"126 bits",
"64 bits",
"16 bytes"
]
},
{
"n": 60,
"stem": "If TOUR is written as 1234, CLEAR is written as 56784 and SPARE is written as 90847, what is the code for CARE?",
"opts": [
"1247",
"4847",
"5247",
"5847"
]
},
{
"n": 61,
"stem": "1024 bit is equal to how many byte?",
"opts": [
"1 Byte",
"128 Byte",
"32 Byte",
"64 Byte"
]
},
{
"n": 62,
"stem": "In excel application, =Sum (D4:D10) is an example of",
"opts": [
"Cell address",
"Formula",
"Function",
"Value"
]
},
{
"n": 63,
"stem": "If x = 5; y = x++ then the value of y and x would be?",
"opts": [
"y = 5 and x = 6",
"y = 6 and x = 6",
"y = 5 and x = 5",
"compile error"
]
},
{
"n": 64,
"stem": "Point out the letter which represents Indians and Historians but not Politicians on the basis of these three circles.",
"opts": [
"b",
"f",
"b and f",
"d and b"
],
"image": "/papers/me/tech2-ict-2020-venn.png"
},
{
"n": 65,
"stem": "The set of instructions and rules to design and use information system are called",
"opts": [
"Software",
"Data",
"Hardware",
"Procedures"
]
},
{
"n": 66,
"stem": "Which of the following transport layer protocols is used to support electronic mail?",
"opts": [
"SMTP",
"IP",
"TCP",
"UDP"
]
},
{
"n": 67,
"stem": "Which term of the Arithmetic Progression (AP) 3,8,13,18,…. is 78? [Hint: AP; an = a + (n-1)d ]",
"opts": [
"12th",
"13th",
"15th",
"16th"
]
},
{
"n": 68,
"stem": "The ratio of 2 km to 600 m is",
"opts": [
"2 : 6",
"1 : 300",
"10 : 3",
"100 : 3"
]
},
{
"n": 69,
"stem": "Below is the sql statement to create table and insert data: Idenitfy the statement which will produce an error:",
"opts": [
"INSERT INTO employee VALUES (1005, Rach, 0);",
"INSERT INTO employees VALUES (1007, Ross, );",
"INSERT INTO employees VALUES (1002, Joey, 335);",
"None of the above."
]
},
{
"n": 70,
"stem": "Why is BCC: used in an email?",
"opts": [
"BCC: allows the recipient to identify all the other recipients in the list when in a group email address is used.",
"BCC: allows the sender to indicate who the email is for if there is more than one recipient.",
"BCC: allows the sender of a message to conceal the recipient entered in the BCC: field from the other recipients.",
"BCC: allows recipients to be visible to all other recipients of the message."
]
}
]"""

KEY = {
    1: ("c", "The series falls by 5: 26, 21, 16, 11, 6."),
    3: ("a", "35 = 32 + 2 + 1 = 100011₂."),
    4: ("a", "SATA = Serial Advanced Technology Attachment."),
    5: ("d", "Debugging is finding and fixing errors in a program."),
    6: ("c", "The IPv4 header is 20 to 60 bytes, so the maximum is 60 bytes."),
    7: ("d", "An assembler converts assembly language into machine code."),
    9: ("b", "Car extends Vehicle and uses its honk() method - inheritance."),
    10: ("a", "Bluetooth is IEEE 802.15.1."),
    11: ("b", "Processes in main memory that are ready and waiting for the CPU are kept in the ready queue."),
    12: ("d", "A destructor is called just before an object is destroyed (at the end of its life)."),
    13: ("a", "Streamlined shapes reduce air resistance (drag)."),
    14: ("c", "A hybrid computer combines analogue and digital computer features."),
    15: ("c", "Eight cubes of 5 cm make a 10 cm × 10 cm × 10 cm block: 1000 cm³."),
    16: ("b", "DHCP = Dynamic Host Configuration Protocol."),
    17: ("c", "Addresses beginning fe80:: are IPv6 link-local addresses."),
    18: ("b", "Writing program instructions is coding."),
    20: ("a", "Stateless autoconfiguration builds the interface ID from the MAC address (modified EUI-64)."),
    21: ("b", "802.11ac (Wi-Fi 5) gives the highest data rates of these in the 5 GHz band."),
    22: ("c", "XOR = (A AND NOT B) OR (NOT A AND B): it needs AND, OR and NOT gates."),
    23: ("a", "A scanner is an input device."),
    24: ("b", "JOIN without a type in SQL Server is an INNER JOIN."),
    26: ("d", "7 × 400 kHz + 6 guard bands × 20 kHz = 2800 + 120 = 2920 kHz."),
    27: ("c", "Microprocessors are used to build computers and other digital systems."),
    28: ("c", "Software is the programs together with their documentation and configuration data."),
    29: ("a", "Modulation prepares (encodes) the message signal on a carrier for transmission."),
    30: ("b", "AES is a symmetric-key (same key) block cipher."),
    31: ("b", "A process perpetually denied resources suffers starvation."),
    32: ("d", "Primes from 1 to 20: 2, 3, 5, 7, 11, 13, 17, 19 = 8."),
    33: ("d", "IPv6 has no broadcast; it uses unicast, multicast and anycast."),
    34: ("b", "Layer 3 (network/ Internet layer) handles packets."),
    35: ("b", "26 = 2 × 13 and 91 = 7 × 13: HCF = 13."),
    36: ("b", "(15 × 86 + 100)/16 = 1390/16 = 86.875%."),
    37: ("b", "LTE standards are developed by 3GPP."),
    38: ("a", "A NOR gate is HIGH only when all inputs are 0: 1 of the 8 combinations."),
    39: ("c", "132 = 128 + 4 = 10000100₂."),
    40: ("d", "Neural networks learn and adapt from data by themselves."),
    41: ("c", "A MAC address is 48 bits."),
    42: ("b", "A free positive charge moves from higher to lower potential."),
    43: ("a", "A function can return only one value at a time (it may return a structure or pointer to give more)."),
    44: ("c", "Device drivers let the OS communicate with particular hardware devices."),
    45: ("c", "varchar stores only the characters used (6); char(20) is fixed length (20)."),
    46: ("b", "INSERT INTO employee VALUES (...)."),
    47: ("a", "A 16-bit network part leaves 32 − 16 = 16 bits for hosts."),
    48: ("b", "x = 9 − 12/3 + 3×2 − 1 = 9 − 4 + 6 − 1 = 10."),
    49: ("d", "Phishing tries to obtain sensitive information by masquerading as a trustworthy entity."),
    50: ("b", "Each letter moves 5 places forward (L→Q, I→N, V→A...): BHUTAN → GMZYFS."),
    52: ("a", "Economics > Maths > History, Social Studies > Maths, English > Social Studies, Computer > History: History is least preferred."),
    53: ("d", "Pokémon Go overlays virtual characters on the real world - augmented reality."),
    54: ("a", "Logic gates are the basic building blocks of digital circuits."),
    56: ("b", "HTML, not HTTP, describes the structure of web pages."),
    57: ("b", "The percentage of TLB lookups that find the page number is the hit ratio."),
    58: ("c", "3 red out of 8 balls: P = 3/8."),
    59: ("d", "An IPv6 address is 128 bits = 16 bytes."),
    60: ("d", "C = 5, A = 8, R = 4, E = 7: CARE = 5847."),
    61: ("b", "1024 bits ÷ 8 = 128 bytes."),
    63: ("a", "y = x++ assigns 5 to y, then x becomes 6."),
    64: ("a", "Only region b lies inside Indian and Historian but outside Politician (d is in all three)."),
    65: ("d", "Procedures are the instructions and rules for designing and using an information system."),
    67: ("d", "78 = 3 + (n − 1) × 5 gives n − 1 = 15, n = 16: the 16th term."),
    68: ("c", "2 km = 2000 m; 2000 : 600 = 10 : 3."),
    70: ("c", "BCC hides the BCC recipients from the other recipients."),
}

NEW_MCQ = [
    ("In C, which of the following can a structure contain?", ["Only data members of the same type", "Data members of different types", "Only functions", "Only pointers"], "b",
     "A C structure groups members of different data types under one name."),
    ("Which SQL statement saves all changes made in the current transaction permanently?", ["ROLLBACK", "COMMIT", "SAVEPOINT", "SELECT"], "b",
     "COMMIT makes the transaction's changes permanent; ROLLBACK undoes changes made since the last COMMIT."),
    ("The document that describes what a software system must do, agreed before design starts, is the", ["test plan", "user manual", "Software Requirements Specification (SRS)", "source code"], "c",
     "The SRS records the functional and non-functional requirements of the system."),
    ("An operating system feature that lets a single CPU switch rapidly between several users' programs is called", ["time-sharing", "batch processing", "spooling", "booting"], "a",
     "Time-sharing gives each user a short time slice in turn, so many users seem to run at once."),
    ("In a spreadsheet, which of the following is a cell reference?", ["SUM", "B7", "=", "%"], "b",
     "B7 refers to the cell in column B, row 7."),
    ("Which transport-layer protocol does SMTP use to send email?", ["UDP", "TCP", "ICMP", "ARP"], "b",
     "SMTP runs over TCP (port 25), which provides reliable delivery."),
    ("A table is created with CREATE TABLE staff (id INT, name VARCHAR(20) NOT NULL). Which statement will produce an error?", ["INSERT INTO staff VALUES (1, 'Pema');", "INSERT INTO staff VALUES (2, NULL);", "INSERT INTO staff (id, name) VALUES (3, 'Dorji');", "SELECT * FROM staff;"], "b",
     "name is NOT NULL, so inserting NULL into it fails."),
]

SAQ = [
 dict(marks=3, stem="Write a function to calculate and print the area of a rectangle with sides 2 m by 5 m.\nclass calcArea( ) {\n ......\n System.out.println(...);\n} (3 marks)",
      kp=[("Correct class/ method structure (e.g. public static void main or a method) in Java", 1), ("Variables length = 2 and breadth = 5; area = length * breadth", 1), ("System.out.println printing the area (10 square metres)", 1)],
      model="public class CalcArea {\n    public static void main(String[] args) {\n        double length = 2, breadth = 5;      // metres\n        double area = length * breadth;\n        System.out.println(\"Area of rectangle = \" + area + \" square metres\");\n    }\n}\nOutput: Area of rectangle = 10.0 square metres."),
 dict(marks=3, stem="What are the differences between single-mode fibre and multimode fibre? Mention three differences. (3 marks)",
      kp=[("Core size: single-mode has a very small core (about 8-10 µm) carrying one light path; multimode has a larger core (50 or 62.5 µm) carrying many paths", 1),
          ("Distance and bandwidth: single-mode goes much further (tens of km) with higher bandwidth; multimode is for short distances (up to about 550 m) because of modal dispersion", 1),
          ("Light source and cost: single-mode uses lasers and is more expensive equipment; multimode uses LEDs/ VCSELs and is cheaper", 1)],
      model="(1) Core size and light paths: single-mode fibre has a very thin core (about 8-10 µm) that carries a single mode (ray) of light; multimode fibre has a larger core (50 or 62.5 µm) that carries many modes. (2) Distance and bandwidth: single-mode has little dispersion, so it carries data over long distances (tens of kilometres) at high bandwidth; multimode suffers modal dispersion and is used for short links (up to a few hundred metres, e.g. inside buildings). (3) Light source and cost: single-mode uses laser sources and costlier transceivers; multimode uses cheaper LEDs or VCSELs. (Colour coding: single-mode jackets are usually yellow, multimode orange or aqua.)"),
 dict(marks=3, stem="Write the output of the following C code.\n\n#include <stdio.h>\nvoid main()\n{\n    int i = 0, j = 0;\n    for (i = 0; i < 5; i++)\n    {\n        for (j = 0; j < 4; j++)\n        {\n            if (i > 1)\n                break;\n        }\n        printf(\"Hi \\n\");\n    }\n} (3 marks)",
      kp=[("The printf is outside the inner loop, so it runs once per outer-loop pass", 1), ("The break only ends the inner loop; the outer loop runs for i = 0 to 4 (5 times)", 1), ("Output: 'Hi' printed 5 times, each on a new line", 1)],
      model="Output:\nHi\nHi\nHi\nHi\nHi\nExplanation: the outer loop runs 5 times (i = 0 to 4). The inner loop does nothing visible - for i = 0 and 1 it simply runs 4 times, and for i > 1 the break ends only the inner loop. printf(\"Hi \\n\") is after the inner loop, inside the outer loop, so 'Hi' is printed once for each value of i: 5 times."),
 dict(marks=3, stem="There are seven layers in the OSI model starting with the Physical Layer. Write the six other layers. (3 marks)",
      kp=[("Data Link (layer 2), Network (layer 3)", 1), ("Transport (layer 4), Session (layer 5)", 1), ("Presentation (layer 6), Application (layer 7)", 1)],
      model="Above the Physical layer (1) are: (2) Data Link layer, (3) Network layer, (4) Transport layer, (5) Session layer, (6) Presentation layer and (7) Application layer."),
 dict(marks=3, stem="What is cryptojacking? Explain how it works. (3 marks)",
      kp=[("Definition: unauthorised use of someone's computer, phone or server to mine cryptocurrency", 1),
          ("How: malicious script/ malware installed through phishing links, infected websites or ads (browser-based JavaScript) or compromised servers/ cloud accounts", 1),
          ("It runs silently using CPU/ GPU power, sending mined coins to the attacker; signs - slow device, overheating, high electricity/ cloud bills; prevention - ad/ script blockers, updates, antivirus, monitoring", 1)],
      model="Cryptojacking is the secret, unauthorised use of another person's computing power - computers, phones, servers or cloud accounts - to mine cryptocurrency for the attacker. It works in two main ways: (1) the victim is tricked into installing mining malware, for example through a phishing email or infected download; or (2) a mining script is injected into a website or online advert, and it runs in the browser of anyone who visits (browser-based cryptojacking). Attackers may also break into poorly secured servers or cloud accounts. The code runs quietly in the background, using the victim's CPU/ GPU to solve the mining calculations, and the rewards go to the attacker's wallet. Victims notice slow performance, overheating, short battery life and higher electricity or cloud bills. Prevention includes updated software, antivirus, ad and script blockers and monitoring of CPU use."),
 dict(marks=3, stem="Write HTML code to generate the following output (shown in the figure). Put table border as 1. (3 marks)", image="/papers/me/tech2-ict-2020-table.png",
      kp=[("<table border=\"1\"> with a caption or first row 'Monthly Savings' spanning 3 columns", 1), ("Header row with <th>: Month, Savings, Savings for holiday!", 1),
          ("Rows January $100 and February $80, with '$50' in one cell spanning both rows (rowspan=\"2\")", 1)],
      model="<table border=\"1\">\n  <caption>Monthly Savings</caption>\n  <tr><th>Month</th><th>Savings</th><th>Savings for holiday!</th></tr>\n  <tr><td>January</td><td>$100</td><td rowspan=\"2\">$50</td></tr>\n  <tr><td>February</td><td>$80</td></tr>\n</table>\n(A first row <tr><td colspan=\"3\">Monthly Savings</td></tr> is also accepted instead of the caption.)"),
 dict(marks=3, stem="Explain the TCP three-way handshake process. (3 marks)",
      kp=[("Step 1 SYN: the client sends a segment with the SYN flag and its initial sequence number (x)", 1), ("Step 2 SYN-ACK: the server replies with SYN and ACK, its own sequence number (y) and acknowledgement x + 1", 1),
          ("Step 3 ACK: the client sends ACK (acknowledgement y + 1); the connection is established and data transfer begins", 1)],
      model="TCP is connection-oriented, so a connection is set up with three messages before data is sent: (1) SYN - the client sends a segment with the SYN flag set and a random initial sequence number, say x, asking to open a connection; (2) SYN-ACK - the server, if willing, replies with both SYN and ACK flags set, its own initial sequence number y and an acknowledgement number x + 1; (3) ACK - the client replies with ACK and acknowledgement number y + 1. Both sides now know each other's sequence numbers and the connection is ESTABLISHED, so reliable data transfer can begin. (A connection is closed with FIN and ACK messages.)"),
 dict(marks=3, stem="What are the key differences between TCP and UDP? (3 marks)",
      kp=[("TCP is connection-oriented (three-way handshake); UDP is connectionless", 1), ("TCP is reliable - acknowledgements, retransmission, ordering, flow and congestion control; UDP has no guarantee of delivery or order", 1),
          ("TCP is slower with a larger header (20+ bytes) - used for web, email, file transfer; UDP is faster with an 8-byte header - used for DNS, streaming, VoIP, games", 1)],
      model="(1) Connection: TCP is connection-oriented and sets up a connection with a three-way handshake; UDP is connectionless and just sends datagrams. (2) Reliability: TCP guarantees delivery with acknowledgements, retransmission of lost segments, in-order delivery, and flow and congestion control; UDP gives no guarantee of delivery, order or duplicate protection. (3) Speed and overhead: TCP has a larger header (at least 20 bytes) and more delay; UDP has an 8-byte header and is faster. (4) Uses: TCP for web (HTTP/HTTPS), email (SMTP) and file transfer (FTP); UDP for DNS, live video/ audio streaming, VoIP and online games."),
 dict(marks=3, stem="Car A starts driving at a speed of 50 km/hr. A second car B starts 30 minutes later and catches car A after 30 minutes. What is the speed of car B? (3 marks)",
      kp=[("When B catches A, A has driven 1 hour (30 + 30 minutes): distance = 50 × 1 = 50 km", 1.5), ("B covers the same 50 km in 30 minutes (0.5 h): speed = 50 / 0.5 = 100 km/hr", 1.5)],
      model="When car B catches car A, A has been driving for 30 + 30 = 60 minutes = 1 hour, so A has covered 50 × 1 = 50 km. Car B covers the same 50 km in 30 minutes = 0.5 hour, so its speed = 50 ÷ 0.5 = 100 km/hr."),
 dict(marks=3, stem="What do you mean by a hypervisor? What is the main difference between Type 1 and Type 2 hypervisors? Give one example of each. (3 marks)",
      kp=[("Hypervisor (virtual machine monitor): software that creates and runs virtual machines, sharing physical hardware between several guest operating systems", 1),
          ("Type 1 (bare-metal) runs directly on the hardware; Type 2 (hosted) runs on top of a host operating system - Type 1 is faster and used in data centres", 1),
          ("Examples: Type 1 - VMware ESXi, Microsoft Hyper-V, Xen, KVM; Type 2 - Oracle VirtualBox, VMware Workstation, Parallels", 1)],
      model="A hypervisor (virtual machine monitor) is software that creates and runs virtual machines: it divides one physical computer's CPU, memory and storage among several guest operating systems and keeps them isolated. Main difference: a Type 1 (bare-metal) hypervisor is installed directly on the hardware with no host operating system, so it is faster and more secure and is used in servers and data centres; a Type 2 (hosted) hypervisor runs as an application on top of a host operating system such as Windows or Linux, which is easier to set up but slower. Examples: Type 1 - VMware ESXi, Microsoft Hyper-V, Xen or KVM; Type 2 - Oracle VirtualBox or VMware Workstation."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
