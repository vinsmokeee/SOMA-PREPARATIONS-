"""Marks follow the latest (BCSE 2025) layout: every short answer is set to 5 marks by supabase/data/me_technical2_ict_marks_2025_layout.sql.
ME Technical Paper II (General Subject Knowledge), ICT group, BCSE 2021 - real paper (PDF sent by the founder).
Part I 70 MCQ x 1; Part II 10 short answers x 3 (kept as printed). Fractions, code and figures were read from the page
images: MCQ 31 (hypervisor) and 49 (AND gate) and Part II Q8 (HTML table) keep the paper's figure; MCQ 15 and 61 give
the code as text. MCQ 53 prints 'intmy_num' (missing space) - corrected to 'int my_num'.
Already on Soma (loaded from BCSE 2022, recorded as appearances): MCQ 3, 23, 24 and 44.
Left out: MCQ 25 and 65 (undefined behaviour in C - the result depends on the compiler), 30 (both ALTER TABLE forms are
valid in common databases), 36 (a and c both sensible), 58 (unclear), 60 (message digest and digital signature both
check integrity), 69 (opinion). Seven new MCQs replace them.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, ICT): BCSE 2021, batch 1"
GROUP_TAG = "ict2021"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "ict"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2021 Main Examination, Technical Paper II, ICT", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 6, "marks_each": 5, "answer_any": None},
]
TOPIC = "ICT: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "HTML is considered as _________________ language.",
"opts": [
"Higher Level Language",
"Markup Language",
"Programming Language",
"OOP Language"
]
},
{
"n": 2,
"stem": "A car travels 150 km in 3 hours. Then it travels 150 km in 2 hours. Find the average speed of the car?",
"opts": [
"62.5 km/hour",
"125 km/hour",
"60 km/hour",
"None of the above"
]
},
{
"n": 3,
"stem": "What is the subnet mask for address 172.16.5.10/28?",
"opts": [
"255.255.255.192",
"255.255.255.240",
"255.255.255.248",
"255.255.255.224"
]
},
{
"n": 4,
"stem": "The following C code can be rewritten as ______________ c = (n) ?a : b;",
"opts": [
"If (!n) c = b; Else c = a;",
"If (n < 0) c = b; Else c = a;",
"If (n > 0) c = a; Else c = b;",
"All of the above"
]
},
{
"n": 5,
"stem": "Sonam chooses a marble at random from a bowl which contains 3 red, 2 black, and 5 green marbles. What is the probability that Sonam does not choose a black marble? 𝟐",
"opts": [
"2/10",
"3/10",
"8/10",
"5/10"
]
},
{
"n": 6,
"stem": "Solve: 1/3 + 1¼ + 1/6",
"opts": [
"7/6",
"7/4",
"14/12",
"14/6"
]
},
{
"n": 7,
"stem": "There is always a time delay in the sending of data packets over any network connection. The variation in the packet arrival time is called",
"opts": [
"Random early detection",
"Delay difference",
"Jitter",
"Load shedding"
]
},
{
"n": 8,
"stem": "Identify the improper fraction.",
"opts": [
"11/12",
"21/12",
"1 1/12",
"0/12"
]
},
{
"n": 9,
"stem": "Given the mask 255.255.254.0, how many hosts per subnet does this create?",
"opts": [
"254",
"256",
"512",
"510"
]
},
{
"n": 10,
"stem": "Find the simple interest on Nu 5200 for 2 years at 6% per annum.",
"opts": [
"Nu 450",
"Nu 524",
"Nu 600",
"Nu 624"
]
},
{
"n": 11,
"stem": "How many /28 network can you build from a /24 IPv4 allocation?",
"opts": [
"16",
"4",
"2⁶",
"2^(4−2)"
]
},
{
"n": 12,
"stem": "The sum of ages of 5 children born at the intervals of 3 years each is 50 years. What is the age of the youngest child?",
"opts": [
"4 years",
"8 years",
"10 years",
"12 years"
]
},
{
"n": 13,
"stem": "When was the Internet introduced in Bhutan?",
"opts": [
"1996",
"1999",
"2003",
"2004"
]
},
{
"n": 14,
"stem": "Which of the following are alternate representations of the decimal number 227?",
"opts": [
"0x227",
"0x143",
"11100110",
"11100011"
]
},
{
"n": 15,
"stem": "What will be the output of the following program?\n\nvoid main()\n{\n    static int var = 5;\n    printf(\"%d \", var--);\n    if (var)\n        main();\n}",
"opts": [
"5 5 5 5 5",
"5 4 3 2 1",
"Infinite Loop",
"None of the above"
]
},
{
"n": 16,
"stem": "The most common operation used in constructors is",
"opts": [
"Addition",
"Overloading",
"Assignment",
"Polymorphism"
]
},
{
"n": 17,
"stem": "IPv6 address is made up of ________________.",
"opts": [
"32 bytes",
"128 bytes",
"16 bytes",
"64 bits"
]
},
{
"n": 18,
"stem": "Which one of the following uses UDP as the transport protocol?",
"opts": [
"DNS",
"HTTP",
"Telnet",
"HTTPS"
]
},
{
"n": 19,
"stem": "All of the following are components of a database, EXCEPT",
"opts": [
"User data",
"Metadata",
"Reports",
"Indexes"
]
},
{
"n": 20,
"stem": "The Layer 2 of the Internet protocol suite is concerned with ____________ of data.",
"opts": [
"bits",
"packets",
"bytes",
"frames"
]
},
{
"n": 21,
"stem": "Google Drive is a _________________.",
"opts": [
"file storage service",
"instant messaging service",
"web hosting service",
"video hosting service"
]
},
{
"n": 22,
"stem": "You have run an SQL statement that asked the DBMS to display data in a table named USER_TABLES. The results include columns of data labelled “TableName”, “NumberOfColumns” and “PrimaryKey”. You are looking at _________________.",
"opts": [
"user data",
"metadata",
"a report",
"indexes"
]
},
{
"n": 23,
"stem": "IEEE standard for Wi-Fi 6 is",
"opts": [
"802.11ac",
"802.11az",
"802.11ax",
"802.11.a6"
]
},
{
"n": 24,
"stem": "Which among the following is the least strong security encryption standard?",
"opts": [
"WEP",
"WPA",
"WPA2",
"WPA3"
]
},
{
"n": 25,
"stem": "What will be the output of the following C code?",
"opts": [
"12",
"20",
"4",
"Compilation error"
]
},
{
"n": 26,
"stem": "‘AS’ clause is used in SQL for",
"opts": [
"Selection operation",
"Join operation",
"Rename operation",
"Projection operation"
]
},
{
"n": 27,
"stem": "Which of the following is Cloud Platform by Amazon?",
"opts": [
"Azure",
"AWS",
"Cloudera",
"All of the above"
]
},
{
"n": 28,
"stem": "Which of the following protocols is used to support clock synchronization?",
"opts": [
"CTP",
"NTP",
"UTP",
"TCP"
]
},
{
"n": 29,
"stem": "Which of the following is the binary number for 255 in decimal?",
"opts": [
"11111111",
"10000110",
"10000100",
"10000101"
]
},
{
"n": 30,
"stem": "What SQL command can be used to add columns to a table?",
"opts": [
"ALTER TABLE TableName ADD COLUMN ColumnName",
"MODIFY TABLE TableName ADD ColumnName",
"ALTER TABLE TableName ADD ColumnName",
"MODIFY TABLE TableName ADD COLUMN ColumnName"
]
},
{
"n": 31,
"stem": "Which type of Hypervisor is shown in the following figure?",
"opts": [
"Type 1",
"Type 2",
"Type 3",
"Type 4"
],
"image": "/papers/me/tech2-ict-2021-hypervisor.png"
},
{
"n": 32,
"stem": "Which of the following is not known cloud service model?",
"opts": [
"SaaS",
"IaaS",
"PaaS",
"XaaS"
]
},
{
"n": 33,
"stem": "GSM stands for:",
"opts": [
"Global System for Monitoring",
"Graphical System for Mobile Telecommunications",
"Graphical System for Monitoring",
"Global System for Mobile Communications"
]
},
{
"n": 34,
"stem": "Which of the following SQL query is correct for selecting the name of staff from ‘staffinfo’ table where salary is 10,000 or 25,000?",
"opts": [
"SELECT name FROM staffinfo WHERE salary BETWEEN 10000 AND 25000;",
"SELECT name FROM staffinfo WHERE salary IN (10000, 25000);",
"SELECT name FROM staffinfo WHERE salary = 10000 OR 25000;",
"None of the above"
]
},
{
"n": 35,
"stem": "What is the technique used to hide information inside a picture?",
"opts": [
"Rootkits",
"Bitmapping",
"Steganography",
"Image Rendering"
]
},
{
"n": 36,
"stem": "Following question has four probable answers. Select the most appropriate alternative. At midnight you heard the voice of several persons shouting. “Fire, Fire,”. You would",
"opts": [
"ring to the Fire Brigade station and inform the officials there about the fire.",
"rush out of the room with bucket of water to extinguish the fire.",
"ensure where the fire had taken place and to what extent.",
"continue to sleep, till you are called for."
]
},
{
"n": 37,
"stem": "The default port number of HTTPS is",
"opts": [
"80",
"443",
"440",
"81"
]
},
{
"n": 38,
"stem": "What number will come at the place of question mark? 1, 9, 25, 49, ?, 121",
"opts": [
"100",
"91",
"64",
"81"
]
},
{
"n": 39,
"stem": "The total of the ages of Sonam, Pema and Tshering is 80 years. What was the total of their ages three years ago?",
"opts": [
"71 years",
"72 years",
"74 years",
"77 years"
]
},
{
"n": 40,
"stem": "A is 3 years older than B and 3 years younger than C, while B and D are twins. How many years is C older than D?",
"opts": [
"2",
"3",
"6",
"12"
]
},
{
"n": 41,
"stem": "What is the sequence of a TCP connection?",
"opts": [
"SYN-ACK-FIN",
"SYN-SYN ACK-ACK",
"SYN-ACK",
"SYN-SYN-ACK"
]
},
{
"n": 42,
"stem": "In a garden, there are 10 rows and 12 columns of apple trees. The distance between the two trees is 2 metres and a distance of one metre is left from all sides of the boundary of the garden. The length of the garden is:",
"opts": [
"20 m",
"22 m",
"24 m",
"26 m"
]
},
{
"n": 43,
"stem": "Phishing is a form of _________________.",
"opts": [
"Spamming",
"Impersonation",
"Identify Theft",
"Scanning"
]
},
{
"n": 44,
"stem": "In computing, one nibble is equal to",
"opts": [
"4 bits",
"8 bits",
"6 bits",
"16 bits"
]
},
{
"n": 45,
"stem": "What is the decimal equivalent of the binary number 100011?",
"opts": [
"35",
"70",
"17",
"128"
]
},
{
"n": 46,
"stem": "Keyloggers are a form of",
"opts": [
"Shoulder surfing",
"Trojan",
"Spyware",
"Social engineering"
]
},
{
"n": 47,
"stem": "The brain of any computing system is",
"opts": [
"ALU",
"Memory",
"CPU",
"Control Unit"
]
},
{
"n": 48,
"stem": "What is the encryption protocol used by the WiFi Protected Access (WPA)?",
"opts": [
"Shared key",
"LEAP",
"AES",
"TKIP"
]
},
{
"n": 49,
"stem": "The diagram below shows an AND gate. If the output wire is off (0), what are the possible states of the input wires?\nI = Input A is 0, input B is 1\nII = Both inputs are 1\nIII = Input A is 1, input B is 0\nIV = Both inputs are 0",
"opts": [
"I and III only",
"II only",
"I, II and III only",
"I, III and IV only"
],
"image": "/papers/me/tech2-ict-2021-and-gate.png"
},
{
"n": 50,
"stem": "Modern Computers are very reliable but they are not",
"opts": [
"Cheap",
"Fast",
"Powerful",
"Infallible"
]
},
{
"n": 51,
"stem": "Why is Requirement Elicitation a difficult task in Software Engineering?",
"opts": [
"Problem of scope",
"Problem of understanding",
"Problem of volatility",
"All of the above"
]
},
{
"n": 52,
"stem": "What is the number of bits available for the network address if the number of bits available for the host address is 10?",
"opts": [
"32",
"2¹⁰",
"22",
"2^(32−10)"
]
},
{
"n": 53,
"stem": "Which is valid C expression?",
"opts": [
"int my_num = 100,000;",
"int my_num = 100000;",
"int my num = 10000;",
"int $my_num = 10000;"
]
},
{
"n": 54,
"stem": "Which of the following principle is violated if computer system is not accessible?",
"opts": [
"Confidentiality",
"Integrity",
"Availability",
"Authentication"
]
},
{
"n": 55,
"stem": "Select the option that suits the Manifesto of Agile Software Development.",
"opts": [
"Individuals and interactions",
"Working software",
"Customer collaboration",
"All of the above mentioned"
]
},
{
"n": 56,
"stem": "Find the mode of the following set of numbers: 1, 1, 1, 2, 4, 5, 5, 7, 8, 12",
"opts": [
"1",
"4.5",
"5",
"4.6"
]
},
{
"n": 57,
"stem": "Which is the legal form of hacking based on which jobs are provided in IT industries and firms?",
"opts": [
"Underground hacking",
"Surface hacking",
"Ethical hacking",
"Whitebox hacking"
]
},
{
"n": 58,
"stem": "Which of the following characteristic of big data is relatively more concerned to data science?",
"opts": [
"Raw data is original source of data.",
"Pre-processed data is original source of data.",
"Raw data is the data obtained after processing steps.",
"None of the above."
]
},
{
"n": 59,
"stem": "Which one is a superset that includes the rest?",
"opts": [
"Data Analysis",
"Data Science",
"Business Analytics",
"Model Creation"
]
},
{
"n": 60,
"stem": "Which of the following technique is used to verify the integrity of the message?",
"opts": [
"Message digest",
"Digital signature",
"Decryption algorithm",
"AES"
]
},
{
"n": 61,
"stem": "Write the output of the following code.\n\nmain()\n{\n    int i = abc(10);\n    printf(\"%d\", --i);\n}\n\nint abc(int i)\n{\n    return (i++);\n}",
"opts": [
"10",
"9",
"11",
"Error"
]
},
{
"n": 62,
"stem": "A bootstrap is",
"opts": [
"a memory device.",
"a device to support the computer.",
"a small initialisation program to start up a computer or program.",
"an error correction technique."
]
},
{
"n": 63,
"stem": "In Software Development Life Cycle, requirements can be refined using the ______________.",
"opts": [
"prototyping model",
"evolutionary model",
"waterfall model",
"spiral model"
]
},
{
"n": 64,
"stem": "In relational database, an attribute is a",
"opts": [
"key of a table",
"two-dimensional table",
"row of a table",
"column of a table"
]
},
{
"n": 65,
"stem": "Determine output of the following:",
"opts": [
"45545",
"54544",
"45445",
"54554"
]
},
{
"n": 66,
"stem": "You are asked to participate in the survey. The question included in the survey questionnaire to record your response have set of alternatives. This type of question is classified as",
"opts": [
"Open ended questions",
"Closed ended questions",
"Multiple choices",
"Itemized question"
]
},
{
"n": 67,
"stem": "How will you select all data from student table starting the name from letter ‘r’?",
"opts": [
"SELECT * FROM student WHERE name LIKE ‘%r%’;",
"SELECT * FROM student WHERE name LIKE ‘%r’;",
"SELECT * FROM student WHERE name LIKE ‘r%’;",
"SELECT * FROM student WHERE name LIKE ‘_r%’;"
]
},
{
"n": 68,
"stem": "The Lowest Common Factor (LCM) of 9 and 6 is",
"opts": [
"3",
"6",
"9",
"18"
]
},
{
"n": 69,
"stem": "The reason for software bugs and failures is due to __________________.",
"opts": [
"software companies",
"software developers",
"both software companies and developers",
"None of the above"
]
},
{
"n": 70,
"stem": "In a race of 1000 m, A can beat B by 100 m. In a race of 800 m, B can beat C by 100 m. By how many meters will A beat C in a race of 600 m?",
"opts": [
"57.5 m",
"127.5 m",
"150.7 m",
"98.6 m"
]
}
]"""

KEY = {
    1: ("b", "HTML (HyperText Markup Language) is a markup language."),
    2: ("c", "Total distance 300 km in total time 5 h: average speed 60 km/h."),
    4: ("a", "c = (n) ? a : b gives a when n is non-zero, else b; 'if (!n) c = b; else c = a;' is the same. Option c fails for negative n."),
    5: ("c", "8 of the 10 marbles are not black: 8/10."),
    6: ("b", "1/3 + 5/4 + 1/6 = 4/12 + 15/12 + 2/12 = 21/12 = 7/4."),
    7: ("c", "Variation in packet arrival (delay) time is jitter."),
    8: ("b", "An improper fraction has a numerator greater than or equal to its denominator: 21/12."),
    9: ("d", "255.255.254.0 = /23, leaving 9 host bits: 2^9 − 2 = 510 hosts."),
    10: ("d", "SI = 5200 × 6 × 2 / 100 = Nu 624."),
    11: ("a", "/24 to /28 borrows 4 bits: 2^4 = 16 networks."),
    12: ("a", "x + (x+3) + (x+6) + (x+9) + (x+12) = 5x + 30 = 50, so x = 4 years."),
    13: ("b", "The Internet was introduced in Bhutan in June 1999 (with television), during the Silver Jubilee."),
    14: ("d", "227 = 128 + 64 + 32 + 2 + 1 = 11100011₂ (= 0xE3)."),
    15: ("b", "var is static, so its value is kept between the recursive calls: it prints 5 4 3 2 1 and stops when var is 0."),
    16: ("c", "Constructors mostly assign initial values to data members."),
    17: ("c", "An IPv6 address is 128 bits = 16 bytes."),
    18: ("a", "DNS queries normally use UDP (port 53); HTTP, Telnet and HTTPS use TCP."),
    19: ("c", "A database contains user data, metadata, indexes and application metadata; reports are produced from it, not part of it."),
    20: ("d", "Layer 2 (the link/ data link layer) handles data as frames."),
    21: ("a", "Google Drive is a cloud file storage and sharing service."),
    22: ("b", "Table names, numbers of columns and keys are data about data - metadata."),
    26: ("c", "AS gives a temporary name (alias) - the rename operation."),
    27: ("b", "AWS (Amazon Web Services) is Amazon's cloud platform; Azure is Microsoft's."),
    28: ("b", "NTP (Network Time Protocol) synchronises computer clocks."),
    29: ("a", "255 = 11111111₂."),
    31: ("a", "The hypervisor runs directly on the system hardware with no host OS underneath: a Type 1 (bare-metal) hypervisor."),
    32: ("d", "The standard cloud service models are SaaS, PaaS and IaaS; 'XaaS' is a general term, not a defined model."),
    33: ("d", "GSM = Global System for Mobile Communications."),
    34: ("b", "IN (10000, 25000) selects salaries equal to either value; BETWEEN includes everything in between."),
    35: ("c", "Steganography hides information inside another file such as a picture."),
    37: ("b", "HTTPS uses port 443."),
    38: ("d", "These are squares of odd numbers 1², 3², 5², 7², 9², 11²: the missing one is 81."),
    39: ("a", "Three years ago each was 3 years younger: 80 − 9 = 71 years."),
    40: ("c", "C = A + 3 = B + 6, and D = B, so C is 6 years older than D."),
    41: ("b", "A TCP connection opens with the three-way handshake SYN → SYN-ACK → ACK."),
    42: ("c", "12 trees along the length have 11 gaps of 2 m = 22 m, plus 1 m on each side: 24 m."),
    43: ("b", "Phishing is a form of impersonation - pretending to be a trusted entity."),
    45: ("a", "100011₂ = 32 + 2 + 1 = 35."),
    46: ("c", "Keyloggers secretly record keystrokes - a form of spyware."),
    47: ("c", "The CPU is called the brain of the computer."),
    48: ("d", "WPA uses TKIP (Temporal Key Integrity Protocol); WPA2 uses AES."),
    49: ("d", "An AND gate outputs 1 only when both inputs are 1, so output 0 means I, III or IV."),
    50: ("d", "Computers are reliable but not infallible - errors come from bad data, bugs and faults."),
    51: ("d", "Requirement elicitation is hard because of problems of scope, understanding and volatility."),
    52: ("c", "IPv4 has 32 bits: 32 − 10 = 22 bits for the network."),
    53: ("b", "A valid declaration needs a legal identifier and no comma inside the number: int my_num = 100000;"),
    54: ("c", "If a system cannot be accessed, availability is violated."),
    55: ("d", "The Agile Manifesto values individuals and interactions, working software, customer collaboration and responding to change."),
    56: ("a", "1 occurs most often (three times)."),
    57: ("c", "Ethical hacking is legal, authorised hacking done to find weaknesses."),
    59: ("b", "Data science includes data analysis, business analytics and model creation."),
    61: ("b", "return (i++) returns 10 (post-increment happens after the value is taken); --i then prints 9."),
    62: ("c", "A bootstrap (loader) is a small program that starts up a computer or program."),
    63: ("a", "Prototyping lets users see a working model so requirements can be refined."),
    64: ("d", "An attribute is a column of a table."),
    66: ("b", "Questions with a fixed set of alternatives are closed-ended questions."),
    67: ("c", "LIKE 'r%' matches names starting with r."),
    68: ("d", "The LCM of 9 and 6 is 18."),
    70: ("b", "A:B = 1000:900, B:C = 800:700, so A:C = 1000:787.5. In 600 m C covers 472.5 m: A wins by 127.5 m."),
}

NEW_MCQ = [
    ("In C, what is printed by: int a = 7; printf(\"%d\", a / 2);", ["3.5", "3", "4", "Error"], "b",
     "Both operands are integers, so 7 / 2 uses integer division and gives 3."),
    ("Which SQL command removes a whole table, including its structure, from the database?", ["DELETE", "DROP TABLE", "TRUNCATE", "REMOVE"], "b",
     "DROP TABLE deletes the table and its definition; DELETE and TRUNCATE remove rows but keep the table."),
    ("If you see smoke coming from a computer in your office, the first thing you should do is", ["open the case to look inside", "switch off the power at the socket and alert others", "pour water on it", "continue working"], "b",
     "Cut the electricity safely and warn others; never use water on electrical equipment."),
    ("Which of the following is an example of structured data?", ["A video file", "Rows in a relational database table", "A social media post", "An audio recording"], "b",
     "Structured data has a fixed format such as rows and columns in a relational table."),
    ("A hash function such as SHA-256 is mainly used to", ["speed up downloads", "check that data has not been altered", "compress images", "assign IP addresses"], "b",
     "A hash (message digest) changes completely if the data changes, so it is used to verify integrity."),
    ("What does printf(\"%d\", 5 > 3 && 2 > 4); print in C?", ["1", "0", "true", "false"], "b",
     "5 > 3 is 1 and 2 > 4 is 0, and 1 && 0 = 0; C prints logical results as 1 or 0."),
    ("The process of finding and correcting errors in a program is called", ["compiling", "debugging", "executing", "linking"], "b",
     "Debugging is locating and fixing bugs (errors) in a program."),
]

SAQ = [
 dict(marks=3, stem="Write a program to determine whether a given number is ODD or EVEN, and print the output accordingly. (3 marks)",
      kp=[("Read the number (input)", 1), ("Test with the modulus operator: number % 2 == 0", 1), ("Print 'EVEN' or 'ODD' using if-else", 1)],
      model="#include <stdio.h>\nint main() {\n    int num;\n    printf(\"Enter a number: \");\n    scanf(\"%d\", &num);\n    if (num % 2 == 0)\n        printf(\"%d is EVEN\\n\", num);\n    else\n        printf(\"%d is ODD\\n\", num);\n    return 0;\n}"),
 dict(marks=3, stem="What is DNS? State at least two types of DNS servers. (3 marks)",
      kp=[("DNS (Domain Name System) translates human-readable domain names into IP addresses (and back); a distributed, hierarchical system using port 53", 1),
          ("Two types, e.g. recursive resolver, root name server, TLD (top-level domain) server, authoritative name server (primary/ secondary), caching server", 2)],
      model="DNS (Domain Name System) is the Internet's distributed directory that translates domain names such as www.rcsc.gov.bt into IP addresses that computers use (and IP addresses back into names); it works hierarchically and uses port 53. Types of DNS servers: (1) recursive resolver (caching server) - receives the client's query and finds the answer by asking other servers; (2) root name server - points to the right top-level domain server; (3) TLD server - handles domains such as .bt or .com; (4) authoritative name server - holds the actual records for a domain (primary and secondary)."),
 dict(marks=3, stem="What do the following acronyms stand for? (a) ASCII; (b) SNMP; (c) SSH. (3 marks)",
      kp=[("(a) American Standard Code for Information Interchange", 1), ("(b) Simple Network Management Protocol", 1), ("(c) Secure Shell", 1)],
      model="(a) ASCII - American Standard Code for Information Interchange. (b) SNMP - Simple Network Management Protocol. (c) SSH - Secure Shell."),
 dict(marks=3, stem="Write a simple program (function) to swap the values of two given variables num1 and num2:\nvoid swap(int num1, int num2)\n{\n ...\n} (3 marks)",
      kp=[("Use a temporary variable: temp = num1", 1), ("num1 = num2; num2 = temp", 1), ("Print the swapped values (or use pointers so the caller sees the change)", 1)],
      model="void swap(int num1, int num2)\n{\n    int temp;\n    temp = num1;\n    num1 = num2;\n    num2 = temp;\n    printf(\"num1 = %d, num2 = %d\\n\", num1, num2);\n}\nBecause C passes arguments by value, the swap is visible only inside the function; to change the caller's variables, pass pointers: void swap(int *a, int *b) { int t = *a; *a = *b; *b = t; }."),
 dict(marks=3, stem="Specify the transport layer protocol and default port number used by the following application layer protocols: (a) Telnet; (b) HTTP; (c) SMTP. (3 marks)",
      kp=[("(a) Telnet - TCP, port 23", 1), ("(b) HTTP - TCP, port 80", 1), ("(c) SMTP - TCP, port 25", 1)],
      model="(a) Telnet uses TCP on port 23. (b) HTTP uses TCP on port 80 (HTTPS uses 443). (c) SMTP uses TCP on port 25 (587 for mail submission)."),
 dict(marks=3, stem="(a) Write an SQL statement to create a table 'Employee' with the fields: EmployeeID of type int; FirstName, LastName, Address and City of type varchar with a maximum length of 255 characters. (1.5 marks)\n(b) Write an SQL query to insert the following data into the table 'Employee': EmployeeID = 2001, FirstName = Karma, Address = Bhutan, City = Thimphu. (1.5 marks)",
      kp=[("(a) CREATE TABLE Employee (EmployeeID int, FirstName varchar(255), LastName varchar(255), Address varchar(255), City varchar(255));", 1.5),
          ("(b) INSERT INTO Employee (EmployeeID, FirstName, Address, City) VALUES (2001, 'Karma', 'Bhutan', 'Thimphu');", 1.5)],
      model="(a)\nCREATE TABLE Employee (\n    EmployeeID int,\n    FirstName varchar(255),\n    LastName varchar(255),\n    Address varchar(255),\n    City varchar(255)\n);\n(b)\nINSERT INTO Employee (EmployeeID, FirstName, Address, City)\nVALUES (2001, 'Karma', 'Bhutan', 'Thimphu');\n(LastName is not given, so it is left out of the column list and becomes NULL.)"),
 dict(marks=3, stem="There are two black counters and one white counter in a bag. Pema draws a counter from the bag without looking. He then replaces it and draws a second counter without looking.\n(a) What is the probability that he draws two black counters? (1.5 marks)\n(b) What is the probability that he draws at least one black counter? (1.5 marks)",
      kp=[("(a) P(black) = 2/3 each time (with replacement), so P(two black) = 2/3 × 2/3 = 4/9", 1.5), ("(b) P(at least one black) = 1 − P(no black) = 1 − (1/3 × 1/3) = 8/9", 1.5)],
      model="Because the counter is replaced, the draws are independent and P(black) = 2/3, P(white) = 1/3 each time. (a) P(two black) = 2/3 × 2/3 = 4/9. (b) P(at least one black) = 1 − P(both white) = 1 − 1/3 × 1/3 = 1 − 1/9 = 8/9."),
 dict(marks=3, stem="Write HTML code to generate the following output (shown in the figure). Indicate table border as 1. (3 marks)", image="/papers/me/tech2-ict-2021-table.png",
      kp=[("<table border=\"1\"> with a header row: Library, jQuery, Bootstrap, Modernizr (<th>)", 1), ("Rows for Market Share (96.1%, 17.0%, 14.3%) and Absolute Usage (70.4%, 12.4%, 10.5%)", 1),
          ("Last row: one cell spanning 4 columns (colspan=\"4\") with 'This exercise' in bold (<b>) followed by 'is to demonstrate HTML skills.'", 1)],
      model="<table border=\"1\">\n  <tr><th>Library</th><th>jQuery</th><th>Bootstrap</th><th>Modernizr</th></tr>\n  <tr><td>Market Share</td><td>96.1%</td><td>17.0%</td><td>14.3%</td></tr>\n  <tr><td>Absolute Usage</td><td>70.4%</td><td>12.4%</td><td>10.5%</td></tr>\n  <tr><td colspan=\"4\"><b>This exercise</b> is to demonstrate HTML skills.</td></tr>\n</table>"),
 dict(marks=3, stem="What is deadlock in an operating system? How can you resolve a deadlock when you detect it? (1.5 + 1.5 = 3 marks)",
      kp=[("Deadlock: two or more processes wait forever for resources held by each other; conditions - mutual exclusion, hold and wait, no preemption, circular wait", 1.5),
          ("Recovery after detection: terminate (abort) one or all deadlocked processes, or preempt resources from a process (choose a victim, roll back to a safe state, avoid starvation)", 1.5)],
      model="A deadlock is a situation in which two or more processes are blocked forever because each holds a resource and waits for a resource held by another (e.g. P1 holds the printer and waits for the scanner while P2 holds the scanner and waits for the printer). It occurs when four conditions hold together: mutual exclusion, hold and wait, no preemption and circular wait. Once a deadlock is detected (e.g. with a wait-for graph), it is resolved by: (1) process termination - aborting all deadlocked processes, or aborting them one at a time until the cycle is broken; or (2) resource preemption - taking resources away from a selected victim process, rolling it back to a safe state and restarting it later, making sure the same process is not always chosen (starvation)."),
 dict(marks=3, stem="Write three advantages of CSS. (3 marks)",
      kp=[("Separates content (HTML) from presentation, making code cleaner", 1), ("One style sheet styles many pages - consistent look, saves time and easier maintenance", 1),
          ("Faster page loading/ less code, plus responsive design and more styling options (any one)", 1)],
      model="(1) Separation of content and design: HTML holds the content while CSS controls the look, so code is cleaner and easier to read. (2) Reusability and easy maintenance: one external style sheet can style a whole website, giving a consistent look, and a change in one place updates every page. (3) Faster pages and better design: less repeated code means smaller, faster-loading pages, and CSS supports responsive layouts for different screen sizes and richer styling than HTML attributes."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
