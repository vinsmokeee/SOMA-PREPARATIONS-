"""ME Technical Paper II (General Subject Knowledge), ICT group, BCSE 2022 - real paper (PDF sent by the founder).
Part I 70 MCQ x 1; Part II 7 short answers (4, 5, 5, 4, 4, 4, 4 = 30 marks), kept as printed.
Already loaded from BCSE 2023 (word-for-word repeats, recorded as appearances): MCQ 4, 8, 11, 13, 14, 20, 22, 23, 25, 38,
44 and 58. Left out: MCQ 42 (the stem is garbled - 'deleting data elements from and inserting at the rear'), 48 (BaaS is
also a cloud model), 59 (a touch screen is both an input and an output device). Three new MCQs replace them.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, ICT): BCSE 2022, batch 1"
GROUP_TAG = "ict2022"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "ict"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2022 Main Examination, Technical Paper II, ICT", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 6, "marks_each": 5, "answer_any": None},
]
TOPIC = "ICT: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "How much Simple Interest can a person get on Nu 8,200 at 17.5% per annum for a period of 2 years and 6 months?",
"opts": [
"Nu. 2,850",
"Nu. 3,587.50",
"Nu. 3,750",
"Nu. 3,770.50"
]
},
{
"n": 2,
"stem": "If one-third of one-fourth of a number is 15, then three-tenth of that number is:",
"opts": [
"35",
"36",
"45",
"54"
]
},
{
"n": 3,
"stem": "A two-digit number is such that the product of the digits is 8. When 18 is added to the number, then the digits are reversed. The number is:",
"opts": [
"18",
"24",
"42",
"81"
]
},
{
"n": 4,
"stem": "What is the correct HTML for adding a background color?",
"opts": [
"<body color = “green”>",
"<body bgcolor = “green”>",
"<background> green </background>",
"<body bg = “green”>"
]
},
{
"n": 5,
"stem": "In a certain code, TEACHER has been coded as VGCEJGT. How CHILDREN will be coded?",
"opts": [
"EJKNEGTP",
"EGKNFITP",
"EJKNFGTO",
"EJKNFTGP"
]
},
{
"n": 6,
"stem": "What is the full subnet mask for the address 172.16.5.10/28?",
"opts": [
"255.255.0.0",
"255.255.255.0",
"255.255.255.240",
"255.255.255.255"
]
},
{
"n": 7,
"stem": "What is the output of this C Program? int main() { int a=0; a = 4 + 5/2*10 + 5; printf(\"%d\", a); return 0; }",
"opts": [
"29",
"5",
"9.25",
"34"
]
},
{
"n": 8,
"stem": "What is the output of this C Program.? int main() { float a=10.0; a = a % 3; printf(\"%f\", a); return 0; }",
"opts": [
"0",
"1",
"1.000000",
"Compiler error"
]
},
{
"n": 9,
"stem": "URL stands for",
"opts": [
"Universal Resource Locator",
"Uniform Resource Locator",
"Universal Response Location",
"Universal Response Link"
]
},
{
"n": 10,
"stem": "Solve for x: (x + 2)² = (x − 5)² + 7",
"opts": [
"3",
"4",
"2",
"5"
]
},
{
"n": 11,
"stem": "Which of the following are the components of FQDN?",
"opts": [
"URL and URI",
"Host name and Domain name",
"DNS and DHCP",
"None of the above"
]
},
{
"n": 12,
"stem": "Why was the OSI model developed?",
"opts": [
"Manufacturers disliked the TCP/IP protocol suite",
"The rate of data transfer was increasing exponentially",
"Standards were needed to allow any two systems to communicate",
"None of the above"
]
},
{
"n": 13,
"stem": "The OSI model consists of _____________layers.",
"opts": [
"3",
"4",
"6",
"7"
]
},
{
"n": 14,
"stem": "The ______________ address uniquely defines a host on the Internet.",
"opts": [
"Physical",
"Port",
"IP",
"Specific"
]
},
{
"n": 15,
"stem": "Which of the following are commonly used tools for Microservices?",
"opts": [
"WireMock",
"Docker",
"Hystrix",
"All of the above"
]
},
{
"n": 16,
"stem": "Which are the advantages of microservices?",
"opts": [
"Technology diversity",
"Fault isolation",
"Independent deployment",
"All of the above"
]
},
{
"n": 17,
"stem": "Which one of the following is NOT the characteristic of Microservices?",
"opts": [
"Essential messaging frameworks",
"Centralized Governance",
"Independent deployment",
"None of the above"
]
},
{
"n": 18,
"stem": "Which of the following is not the Functional Testing?",
"opts": [
"Integration Testing",
"Unit Testing",
"Installation Testing",
"Regression Testing"
]
},
{
"n": 19,
"stem": "Which operation is used to create a new entry in a database or table?",
"opts": [
"Read",
"Update",
"Create",
"Make"
]
},
{
"n": 20,
"stem": "Which command is used to retrieve entries from a database using SQL?",
"opts": [
"COMMIT",
"QUERY",
"SELECT",
"INSERT"
]
},
{
"n": 21,
"stem": "How would you delete all records from a table called ‘users’?",
"opts": [
"DELETE * FROM TABLE users",
"DELETE * FROM users",
"DELETE FROM TABLE users",
"DELETE FROM users"
]
},
{
"n": 22,
"stem": "Which keyword is used in SQL query to retrieve a unique record?",
"opts": [
"UNIQUE",
"DISTINCT",
"PRIMARY",
"None of the above"
]
},
{
"n": 23,
"stem": "What type of testing is depicted in the following diagram?",
"opts": [
"Black Box Testing",
"Unit Testing",
"Regression Testing",
"White Box Testing"
]
},
{
"n": 24,
"stem": "Which of the following is NOT the main feature of OOPs?",
"opts": [
"Inheritance",
"Encapsulation",
"Polymorphism",
"Exception"
]
},
{
"n": 25,
"stem": "Which characteristic of the OOPs is shown by this diagram?",
"opts": [
"Inheritance",
"Encapsulation",
"Polymorphism",
"Data Abstraction"
]
},
{
"n": 26,
"stem": "What is the postfix expression for 2*3 + 4*5?",
"opts": [
"23*4+5*",
"234*+5*",
"23*45*+",
"2*34+5*"
]
},
{
"n": 27,
"stem": "What is the prefix notation for (a + b) * (c - d)?",
"opts": [
"+ab*c-d",
"*+ab-cd",
"+*abc-d",
"+*ab-cd"
]
},
{
"n": 28,
"stem": "If a − b = 3 and a² + b² = 29, find the value of ab.",
"opts": [
"15",
"12",
"10",
"25"
]
},
{
"n": 29,
"stem": "Tickets numbered 1 to 20 are mixed up and then a ticket is drawn at random. What is the probability that the ticket drawn has a number which is a multiple of 3 or 5?",
"opts": [
"7/20",
"2/5",
"8/15",
"9/20"
]
},
{
"n": 30,
"stem": "Which query will select all records with \"gang\" in their name?",
"opts": [
"SELECT * FROM table WHERE name = \"%gang%\";",
"SELECT * FROM table WHERE name LIKE \"%gang%\";",
"SELECT * FROM table WHERE name IN (\"gang\");",
"SELECT * FROM table WHERE name = \"gang\";"
]
},
{
"n": 31,
"stem": "What is the value of X in this conversion: (145)₁₀ = (X)₂?",
"opts": [
"11110001",
"10010001",
"10010011",
"11010001"
]
},
{
"n": 32,
"stem": "The hexadecimal digits are 1 to 0 and A to_______.",
"opts": [
"E",
"G",
"F",
"Z"
]
},
{
"n": 33,
"stem": "ASCII code is a 7 bit code for__________.",
"opts": [
"Letters",
"Numbers",
"Symbols",
"All of the above"
]
},
{
"n": 34,
"stem": "An OR gate has 6 inputs, how many input words are in its truth table?",
"opts": [
"32",
"12",
"64",
"128"
]
},
{
"n": 35,
"stem": "The binary equivalent of the octal Numbers 13.54 is:",
"opts": [
"1011.1011",
"1101.1110",
"1001.1110",
"None of these"
]
},
{
"n": 36,
"stem": "The octal equivalent of 111010 is:",
"opts": [
"73",
"71",
"74",
"72"
]
},
{
"n": 37,
"stem": "The binary system has the radix of:",
"opts": [
"0",
"1",
"2",
"3"
]
},
{
"n": 38,
"stem": "The parity bit is added for____________.",
"opts": [
"coding",
"indexing",
"error detection",
"control key"
]
},
{
"n": 39,
"stem": "The process of arranging the data in a given array is called:",
"opts": [
"Merging",
"Filtering",
"Ordering",
"Sorting"
]
},
{
"n": 40,
"stem": "Who is responsible for conducting the sprint meeting in the project execution?",
"opts": [
"Product owner",
"Scrum team",
"Scrum master",
"All of the above"
]
},
{
"n": 41,
"stem": "A_____________ is a collection of variables of the same type.",
"opts": [
"Program",
"Array",
"Constant",
"Variable"
]
},
{
"n": 42,
"stem": "Which data structures allow deleting data elements from and inserting at the rear?",
"opts": [
"Stakes",
"Dequeues",
"Queues",
"Binary search tree"
]
},
{
"n": 43,
"stem": "A light sensitive device that converts drawing, printed text or other images into digital form is:",
"opts": [
"Keyboard",
"Plotter",
"Scanner",
"OMR"
]
},
{
"n": 44,
"stem": "What is the loopback (localhost) ip address?",
"opts": [
"192.164.0.0",
"127.0.0.1",
"172.0.0.1",
"None of the above"
]
},
{
"n": 45,
"stem": "What is the maximum number of IP addresses that can be assigned to hosts on a local subnet that uses the 255.255.255.224 subnet mask?",
"opts": [
"14",
"15",
"29",
"30"
]
},
{
"n": 46,
"stem": "IEEE standard for Wi-Fi 6 is",
"opts": [
"802.11ac",
"802.11az",
"802.11ax",
"802.11.a6"
]
},
{
"n": 47,
"stem": "Which among the following is the least strong security encryption standard?",
"opts": [
"WEP",
"WPA",
"WPA2",
"QPA3"
]
},
{
"n": 48,
"stem": "Which of the following is NOT a model of cloud computing?",
"opts": [
"PaaS",
"IaaS",
"BaaS",
"SaaS"
]
},
{
"n": 49,
"stem": "Data Analytics uses___________________to get insights from data.",
"opts": [
"Statistical Figures",
"Numerical Aspects",
"Statistical Methods",
"None of the above"
]
},
{
"n": 50,
"stem": "What does DDoS stand for?",
"opts": [
"Data Denial-of-Service",
"Distributed Denial-of-Service",
"Distributed Data of Server",
"Distribution of Data Service"
]
},
{
"n": 51,
"stem": "You have been asked to create a subnet that supports 16 hosts. What subnet mask should you use?",
"opts": [
"255.255.255.252",
"255.255.255.248",
"255.255.255.240",
"255.255.255.224"
]
},
{
"n": 52,
"stem": "The default port for SSH client connections is:",
"opts": [
"23",
"21",
"22",
"20"
]
},
{
"n": 53,
"stem": "In computing, one nibble is equal to___________________.",
"opts": [
"4 bits",
"8 bits",
"6 bits",
"16 bits"
]
},
{
"n": 54,
"stem": "What is the mode of the following set of numbers: 1, 2, 3, 2, 1, 5, 6, 1",
"opts": [
"2",
"2.5",
"1",
"1.5"
]
},
{
"n": 55,
"stem": "Find the mean of the following set of numbers: 1, 1, 1, 2, 4, 5, 5, 7, 8, 12",
"opts": [
"4.5",
"4.0",
"4.6",
"5.0"
]
},
{
"n": 56,
"stem": "Which type of the following languages is Javascript?",
"opts": [
"Scripting",
"Programming",
"Markup",
"None of the above"
]
},
{
"n": 57,
"stem": "What is NOS?",
"opts": [
"Network Operating System",
"Novell Operating System",
"Network Operating Services",
"New Operating Services"
]
},
{
"n": 58,
"stem": "Which of the following is a valid IPv6 address format?",
"opts": [
"G412:AFFA:2001:0000:0000:0000:0000:0001",
"2001:8888:EEEE:1010:0000:0000:0000:0001",
"2001::8888::1",
"2010:2112:5440:1812:1867"
]
},
{
"n": 59,
"stem": "Which one of the following is NOT an output device?",
"opts": [
"Printer",
"Monitor",
"Plotter",
"Touch Screen"
]
},
{
"n": 60,
"stem": "Which of the following are forms of malicious attack?",
"opts": [
"Theft of information",
"Modification of data",
"Wiping of information",
"All of the above"
]
},
{
"n": 61,
"stem": "Which is NOT a common file permission?",
"opts": [
"Read",
"Write",
"Stop",
"Execute"
]
},
{
"n": 62,
"stem": "The SQL data-definition language includes commands to grant and__________________.",
"opts": [
"authorize",
"transfer privileges",
"transmit privileges",
"revoke privileges"
]
},
{
"n": 63,
"stem": "Which happens first -authorization or authentication?",
"opts": [
"Authorization",
"Authentication",
"Both are same",
"None of the above"
]
},
{
"n": 64,
"stem": "What are the characteristics of Authorization?",
"opts": [
"RADIUS and RSA",
"3-way handshaking with syn and fin",
"Multilayered protection for securing resources",
"Deals with privileges and rights"
]
},
{
"n": 65,
"stem": "The problem of being unable to represent some information, can be solved by introducing",
"opts": [
"0 value",
"Null values",
"Pointers",
"Null pointer"
]
},
{
"n": 66,
"stem": "If an attacker manages to get an application to execute an SQL query created by the attacker, then such attacks are called as ______________.",
"opts": [
"Pharming",
"SQL injection",
"Phishing",
"Spoofing"
]
},
{
"n": 67,
"stem": "A type of malicious software designed to block access to a computer system until a sum of money is paid:",
"opts": [
"Ransomware",
"Malware",
"Adware",
"Spyware"
]
},
{
"n": 68,
"stem": "An attack on a website that stores and displays text to a user is known as _____________.",
"opts": [
"SQL attack",
"XSS attack",
"XRP atack",
"None of the above"
]
},
{
"n": 69,
"stem": "What are phishing attacks?",
"opts": [
"Users are forced to use a second server which causes the attack.",
"Users are forced to divert to a fake site where the attack takes place.",
"Users are fooled by similar GUI and data is extracted from them.",
"None of the above"
]
},
{
"n": 70,
"stem": "Which of the following is a valid encryption technique?",
"opts": [
"Parallel key encryption",
"Public key encryption",
"Systematic key encryption",
"All of the above"
]
}
]"""

KEY = {
    1: ("b", "SI = 8200 × 17.5 × 2.5 / 100 = Nu. 3,587.50."),
    2: ("d", "(1/3)(1/4)n = 15 gives n = 180; 3/10 of 180 = 54."),
    3: ("b", "Digit product 8 and reversal after adding 18 (difference of digits 2): 24 + 18 = 42."),
    5: ("d", "Each letter moves 2 places forward (T→V, E→G...); CHILDREN → EJKNFTGP."),
    6: ("c", "/28 = 28 network bits; the last octet is 11110000 = 240, so 255.255.255.240."),
    7: ("a", "Integer division: 5/2 = 2, 2 × 10 = 20; 4 + 20 + 5 = 29."),
    9: ("b", "URL = Uniform Resource Locator."),
    10: ("c", "x² + 4x + 4 = x² − 10x + 25 + 7, so 14x = 28 and x = 2."),
    12: ("c", "The OSI model was developed as a standard so that any two different systems could communicate."),
    15: ("d", "WireMock (mocking), Docker (containers) and Hystrix (fault tolerance) are all common microservices tools."),
    16: ("d", "Microservices allow different technologies per service, isolate faults and can be deployed independently."),
    17: ("b", "Microservices use decentralised governance; centralised governance is a feature of monoliths."),
    18: ("c", "Installation testing is non-functional; unit, integration and regression testing check functions."),
    19: ("c", "Create (as in CRUD) adds a new entry; in SQL this is INSERT."),
    21: ("d", "DELETE FROM users removes all rows (the table remains)."),
    24: ("d", "The main features of OOP are inheritance, encapsulation, polymorphism and abstraction; exception handling is not one of them."),
    26: ("c", "2*3 → 23*, 4*5 → 45*, then add: 23*45*+."),
    27: ("b", "(a + b) → +ab, (c − d) → −cd, then multiply: *+ab-cd."),
    28: ("c", "(a − b)² = a² + b² − 2ab, so 9 = 29 − 2ab and ab = 10."),
    29: ("d", "Multiples of 3: 6; of 5: 4; of 15: 1. (6 + 4 − 1)/20 = 9/20."),
    30: ("b", "LIKE '%gang%' matches 'gang' anywhere in the name."),
    31: ("b", "145 = 128 + 16 + 1 = 10010001₂."),
    32: ("c", "Hexadecimal digits are 0-9 and A-F."),
    33: ("d", "7-bit ASCII codes letters, numbers, symbols and control characters (128 characters)."),
    34: ("c", "A truth table for 6 inputs has 2^6 = 64 rows."),
    35: ("a", "1 → 001, 3 → 011, 5 → 101, 4 → 100: 001011.101100 = 1011.1011."),
    36: ("d", "111 = 7, 010 = 2, so 111010₂ = 72₈."),
    37: ("c", "Binary has radix (base) 2."),
    39: ("d", "Arranging data in a given order is sorting."),
    40: ("c", "The Scrum Master facilitates (conducts) the sprint meetings and events."),
    41: ("b", "An array is a collection of variables of the same type."),
    43: ("c", "A scanner converts drawings, text and images on paper into digital form."),
    45: ("d", "255.255.255.224 = /27: 2^5 − 2 = 30 usable host addresses."),
    46: ("c", "Wi-Fi 6 is IEEE 802.11ax."),
    47: ("a", "WEP is the oldest and weakest Wi-Fi encryption standard."),
    49: ("c", "Data analytics applies statistical methods to data to find insights."),
    50: ("b", "DDoS = Distributed Denial-of-Service."),
    51: ("d", "16 hosts need more than 14 addresses, so /27 (255.255.255.224, 30 hosts) is needed."),
    52: ("c", "SSH uses port 22."),
    53: ("a", "A nibble is 4 bits (half a byte)."),
    54: ("c", "1 occurs three times, more than any other value."),
    55: ("c", "Sum = 46, n = 10, mean = 4.6."),
    56: ("a", "JavaScript is a scripting language."),
    57: ("a", "NOS = Network Operating System."),
    60: ("d", "Theft, modification and wiping of information are all malicious attacks."),
    61: ("c", "Common file permissions are read, write and execute."),
    62: ("d", "SQL DDL/DCL commands GRANT and REVOKE privileges."),
    63: ("b", "Authentication (proving who you are) comes before authorisation (what you may do)."),
    64: ("d", "Authorisation deals with privileges and access rights."),
    65: ("b", "Null values represent missing or unknown information in a database."),
    66: ("b", "Running attacker-supplied SQL through an application is SQL injection."),
    67: ("a", "Ransomware locks or encrypts a system and demands payment."),
    68: ("b", "Injecting script into a site that stores and shows text to users is cross-site scripting (XSS)."),
    69: ("c", "Phishing fools users with a look-alike site or message to extract their data."),
    70: ("b", "Public-key (asymmetric) encryption is a valid technique."),
}

NEW_MCQ = [
    ("Which data structure follows the First-In, First-Out (FIFO) principle?", ["Stack", "Queue", "Tree", "Graph"], "b",
     "In a queue, elements are inserted at the rear and removed from the front, so the first in is the first out."),
    ("In cloud computing, providing a complete application to users over the Internet is called", ["IaaS", "PaaS", "SaaS", "NaaS"], "c",
     "Software as a Service delivers ready-to-use applications (e.g. Gmail) over the Internet."),
    ("Which of the following is an input device only?", ["Monitor", "Printer", "Keyboard", "Speaker"], "c",
     "A keyboard only sends data into the computer; monitors, printers and speakers are output devices."),
]

SAQ = [
 dict(marks=4, stem="Write a C program to calculate the sum of the even numbers up to a given number n. (4 marks)",
      kp=[("Header, main() and reading n with scanf", 1), ("Loop from 1 (or 2) to n checking i % 2 == 0, or stepping by 2", 1.5), ("Accumulate the sum and print it", 1.5)],
      model="#include <stdio.h>\nint main() {\n    int n, i, sum = 0;\n    printf(\"Enter n: \");\n    scanf(\"%d\", &n);\n    for (i = 2; i <= n; i += 2)   /* even numbers 2, 4, ..., n */\n        sum += i;\n    printf(\"Sum of even numbers up to %d = %d\\n\", n, sum);\n    return 0;\n}\nFor n = 10 the output is 30 (2 + 4 + 6 + 8 + 10)."),
 dict(marks=5, stem="Write HTML code to display the following data in tabular format:\nSl# | Name | Agency | Department | Division\n1 | Sonam | MoIC | DITT | HR (5 marks)",
      kp=[("Page structure and a <table> element with border", 1), ("Header row with <tr> and five <th> cells: Sl#, Name, Agency, Department, Division", 2), ("Data row with <tr> and five <td> cells: 1, Sonam, MoIC, DITT, HR; tags closed", 2)],
      model="<!DOCTYPE html>\n<html>\n<body>\n<table border=\"1\">\n  <tr>\n    <th>Sl#</th><th>Name</th><th>Agency</th><th>Department</th><th>Division</th>\n  </tr>\n  <tr>\n    <td>1</td><td>Sonam</td><td>MoIC</td><td>DITT</td><td>HR</td>\n  </tr>\n</table>\n</body>\n</html>"),
 dict(marks=5, stem="Write a C program to print the following shape:\n*\n**\n***\n****\n*****\n****** (5 marks)",
      kp=[("#include <stdio.h> and main() correctly written", 1), ("Outer loop for 6 rows (i = 1 to 6)", 2), ("Inner loop printing i stars, then a newline after each row", 2)],
      model="#include <stdio.h>\nint main() {\n    int i, j;\n    for (i = 1; i <= 6; i++) {      /* row i has i stars */\n        for (j = 1; j <= i; j++)\n            printf(\"*\");\n        printf(\"\\n\");\n    }\n    return 0;\n}"),
 dict(marks=4, stem="Convert the following:\n(a) 100 - decimal to binary\n(b) 254 - decimal to binary\n(c) 10101010 - binary to decimal\n(d) 01100111 - binary to decimal (4 marks)",
      kp=[("(a) 100₁₀ = 1100100₂", 1), ("(b) 254₁₀ = 11111110₂", 1), ("(c) 10101010₂ = 170₁₀", 1), ("(d) 01100111₂ = 103₁₀", 1)],
      model="(a) 100 = 64 + 32 + 4 → 1100100. (b) 254 = 128 + 64 + 32 + 16 + 8 + 4 + 2 → 11111110. (c) 10101010 = 128 + 32 + 8 + 2 = 170. (d) 01100111 = 64 + 32 + 4 + 2 + 1 = 103."),
 dict(marks=4, stem="Write a program in C to print the first 100 natural numbers using recursion. (4 marks)",
      kp=[("A recursive function with a parameter n and a base case (stop when n > 100)", 2), ("Prints n and calls itself with n + 1; main() calls it with 1", 2)],
      model="#include <stdio.h>\nvoid printNum(int n) {\n    if (n > 100)          /* base case */\n        return;\n    printf(\"%d \", n);\n    printNum(n + 1);      /* recursive call */\n}\nint main() {\n    printNum(1);\n    return 0;\n}"),
 dict(marks=4, stem="What do the following acronyms stand for? (a) KYC; (b) OTP; (c) SMTP; (d) TTL. (4 marks)",
      kp=[("(a) Know Your Customer", 1), ("(b) One-Time Password", 1), ("(c) Simple Mail Transfer Protocol", 1), ("(d) Time To Live", 1)],
      model="(a) KYC - Know Your Customer. (b) OTP - One-Time Password. (c) SMTP - Simple Mail Transfer Protocol. (d) TTL - Time To Live (the limit on how long or how many hops a packet or cached record lasts)."),
 dict(marks=4, stem="What are the four main operations performed in database systems? (4 marks)",
      kp=[("Create - insert new records (INSERT)", 1), ("Read - retrieve records (SELECT)", 1), ("Update - modify existing records (UPDATE)", 1), ("Delete - remove records (DELETE)", 1)],
      model="The four basic operations are CRUD: (1) Create - add new records, using INSERT in SQL; (2) Read (retrieve) - query and view records, using SELECT; (3) Update - change existing records, using UPDATE; (4) Delete - remove records, using DELETE."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
