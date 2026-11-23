"""ME Technical Paper II (General Subject Knowledge), ICT group, BCSE 2023 - real paper (PDF sent by the founder).
Part I 70 MCQ x 1; Part II 7 short answers (4, 5, 5, 4, 4, 4, 4 = 30 marks), kept as printed like BCSE 2024.
Figures for MCQ 18, 23 and 25 are cropped from the paper. MCQ 18 prints only 'Consider the following flow chart and
answer the question:' - the question line is missing, so it is completed as 'which outcome does the circle marked 1
represent?' (the options describe the four outcomes). Left out: MCQ 6 (options b and d are the same), 36 (10111011 is
octal 273 - not offered), 62 (password and key card both defensible). MCQ 45 is already on Soma (BCSE 2024) and is
recorded as an appearance. Most of BCSE 2022 Part I repeats here; those questions are loaded from 2023 and 2022 is
recorded as an appearance. Three new MCQs replace the left-out ones.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, ICT): BCSE 2023, batch 1"
GROUP_TAG = "ict2023"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "ict"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2023 Main Examination, Technical Paper II, ICT", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 6, "marks_each": 5, "answer_any": None},
]
TOPIC = "ICT: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Bhutan National Bank has given that simple interest on a certain sum of money is Nu. 4016.25 at 9% per annum in 5 years. Find the sum of money.",
"opts": [
"Nu. 8505",
"Nu. 8925",
"Nu. 9852",
"Nu. 8952"
]
},
{
"n": 2,
"stem": "The sum of one fourth of a number and 3 is 15. What is the number?",
"opts": [
"46",
"36",
"45",
"48"
]
},
{
"n": 3,
"stem": "A two-digit number is such that the product of its digits is 20. If 9 is added to the number, the digits interchange their places. Find the number?",
"opts": [
"35",
"50",
"45",
"54"
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
"stem": "If a given code SISTER is coded as 535301. UNCLE as 84670 and BOY as 129. How is RUSTIC written in the code?",
"opts": [
"633185",
"185336",
"363815",
"181363"
]
},
{
"n": 6,
"stem": "What is the full subnet mask for address 172.16.5.10/27?",
"opts": [
"255.255.0.0",
"255.255.255.224",
"255.255.255.240",
"255.255.255.224"
]
},
{
"n": 7,
"stem": "What is the output of this C Program? int main() { int a; a = 4%5 + 5; printf(\"%d\", a); return 0; }",
"opts": [
"9",
"5",
"5.8",
"4"
]
},
{
"n": 8,
"stem": "What is the output of this C Program? int main() { float a=10.0; a = a % 3; printf(\"%f\", a); return 0; }",
"opts": [
"0",
"1",
"1.000000",
"Compiler error"
]
},
{
"n": 9,
"stem": "The standard internet protocol is:",
"opts": [
"FTP",
"SSH",
"TCP/IP",
"UDP"
]
},
{
"n": 10,
"stem": "What comes next in the following series. 3, 4, 6, 9, 13, ____",
"opts": [
"16",
"17",
"18",
"19"
]
},
{
"n": 11,
"stem": "Which are the components of FQDN?",
"opts": [
"URL and URI",
"Host name and Domain name",
"DNS and DHCP",
"None of the above"
]
},
{
"n": 12,
"stem": "SMTP stands for",
"opts": [
"Switch mode Transfer Programming",
"Switch mode Transfer Protocol",
"Simple Mail Transfer Protocol",
"Simple Main Transfer Protocol"
]
},
{
"n": 13,
"stem": "The OSI model consists of _______ layers.",
"opts": [
"3",
"4",
"6",
"7"
]
},
{
"n": 14,
"stem": "The ____________address uniquely defines a host on the Internet",
"opts": [
"Physical",
"Port",
"IP",
"Specific"
]
},
{
"n": 15,
"stem": "What is a microservice?",
"opts": [
"A design used primarily in functional programming and object-oriented programming",
"A small program that represents discrete logic that executes within a well-defined boundary on dedicated hardware",
"A style of design for enterprise systems based on a loosely coupled component architecture.",
"A very small piece of code that never gets any bigger than 10 lines"
]
},
{
"n": 16,
"stem": "Which of the following topologies has the highest reliability??",
"opts": [
"Star topology",
"Bus topology",
"Ring topology",
"Mesh topology"
]
},
{
"n": 17,
"stem": "When would developers use microservices?",
"opts": [
"When they want to write cell phone applications that run quickly",
"When they work with ephemeral nano technology",
"When they need to create large, enterprise-level applications that are subject to changes on a frequent basis",
"When they create applications specifically for scientific test equipment"
]
},
{
"n": 18,
"stem": "Consider the following flow chart. Which description matches the outcome marked 1?",
"opts": [
"Married, with at least one son.",
"Unmarried, with at least one daughter.",
"Unmarried, with at least one son.",
"Unmarried, with no children."
],
"image": "/papers/me/tech2-ict-2023-flowchart.png"
},
{
"n": 19,
"stem": "Which of the following concepts of OOPS means exposing only necessary information to clients?",
"opts": [
"Encapsulation",
"Abstraction",
"Data hiding",
"Data binding"
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
"stem": "Which of the following statements about constructors is correct?",
"opts": [
"A constructor is called at the time of declaration of an object.",
"A constructor is called at the time of use of an object.",
"A constructor is called at the time of declaration of a class.",
"A constructor is called at the time of use of a class."
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
"stem": "What type of testing is depicted in the diagram?",
"opts": [
"Black Box Testing",
"Unit Testing",
"Regression Testing",
"White Box Testing"
],
"image": "/papers/me/tech2-ict-2023-testing.png"
},
{
"n": 24,
"stem": "Which is the correct SELECT statement to display all records with selected columns of a table?",
"opts": [
"SELECT * FROM table_name",
"SELECT column1, column2,... FROM table_name",
"SELECT FROM table_name",
"None of these"
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
],
"image": "/papers/me/tech2-ict-2023-inheritance.png"
},
{
"n": 26,
"stem": "What is the postfix representation of the following infix expression? (A + B) * C – D * E / F",
"opts": [
"AB+C*DE*F-",
"AB*C+DE*F/-",
"AB+C–DE*F/*",
"AB+C*DE*F/-"
]
},
{
"n": 27,
"stem": "The result evaluating the postfix expression 10 5 + 60 6 / * 8 − is",
"opts": [
"284",
"213",
"142",
"72"
]
},
{
"n": 28,
"stem": "If x - y = 4 and x² + y² = 58, find the value of xy.",
"opts": [
"15",
"12",
"21",
"25"
]
},
{
"n": 29,
"stem": "Tickets numbered 1 to 50 are mixed up and then a ticket is drawn at random. What is the probability that the ticket drawn has a number which is a multiple of 4 or 7?",
"opts": [
"7/25",
"19/50",
"8/25",
"9/25"
]
},
{
"n": 30,
"stem": "Which is the correct SELECT statement to display selected columns (based on the condition) from a table?",
"opts": [
"SELECT column1,column2,... FROM table_name WHERE condition",
"SELECT FROM table_name WHERE condition",
"SELECT ALL FROM table_name WHERE condition",
"SELECT * FROM table_name WHERE condition"
]
},
{
"n": 31,
"stem": "What is the value of X in this conversion: (1534)₈ = (X)₁₀?",
"opts": [
"650",
"860",
"840",
"680"
]
},
{
"n": 32,
"stem": "Which of the following is a graphical representation of the algorithm?",
"opts": [
"Programming",
"Software",
"Flow Chart",
"Pseudocode"
]
},
{
"n": 33,
"stem": "The statement T&&T || F&&T where T is true and F is False is:",
"opts": [
"False",
"True",
"Neutral",
"None of the above"
]
},
{
"n": 34,
"stem": "An OR gate has 5 inputs, how many input words are in its truth table?",
"opts": [
"32",
"12",
"64",
"128"
]
},
{
"n": 35,
"stem": "The binary equivalent of the Octal Numbers 4321 is:",
"opts": [
"100011101010",
"100011010001",
"111001011010",
"101001010001"
]
},
{
"n": 36,
"stem": "The octal equivalent of 10111011 is:",
"opts": [
"472",
"271",
"374",
"473"
]
},
{
"n": 37,
"stem": "C programs are converted into machine language with the help of",
"opts": [
"An Editor",
"An operating system",
"A Compiler",
"None of the above"
]
},
{
"n": 38,
"stem": "The parity bit is added for:",
"opts": [
"Coding",
"Indexing",
"Error detection",
"Control Key"
]
},
{
"n": 39,
"stem": "In a stack, if a user tries to remove an element from an empty stack it is called:",
"opts": [
"Underflow",
"Empty collection",
"Overflow",
"Garbage Collection"
]
},
{
"n": 40,
"stem": "With SQL, how do you select all the records from a table named “Persons” where the value of the column “FirstName” ends with an “a”?",
"opts": [
"SELECT * FROM Persons WHERE FirstName=’a’",
"SELECT * FROM Persons WHERE FirstName LIKE ‘a%’",
"SELECT * FROM Persons WHERE FirstName LIKE ‘%a’",
"SELECT * FROM Persons WHERE FirstName=’%a%’"
]
},
{
"n": 41,
"stem": "What does the ALTER TABLE clause do?",
"opts": [
"The SQL ALTER TABLE clause modifies a table definition by altering, adding, or deleting table columns and/or constraints",
"The SQL ALTER TABLE clause is used to insert data into database table",
"The SQL ALTER TABLE deletes data from database table",
"The SQL ALTER TABLE clause is used to delete a database table"
]
},
{
"n": 42,
"stem": "The UPDATE SQL clause can _____________",
"opts": [
"update only one row at a time.",
"update more than one row at a time.",
"delete more than one row at a time.",
"delete only one row at a time."
]
},
{
"n": 43,
"stem": "How can you change “Hansen” into “Nilsen” in the “LastName” column in the Persons table?",
"opts": [
"UPDATE Persons SET LastName=’Hansen’ INTO LastName=’Nilsen’",
"MODIFY Persons SET LastName=’Nilsen’ WHERE LastName=’Hansen’",
"MODIFY Persons SET LastName=’Hansen’ INTO LastName=’Nilsen’",
"UPDATE Persons SET LastName=’Nilsen’ WHERE LastName=’Hansen’"
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
"stem": "A malicious code hidden inside a seemingly harmless piece of Code is called:",
"opts": [
"Worm",
"Bomb",
"Trojan Horse",
"Virus"
]
},
{
"n": 46,
"stem": "A _______ is a unique piece of information that is used in encryption.",
"opts": [
"Cipher",
"Plain Text",
"Key",
"Cipher Text"
]
},
{
"n": 47,
"stem": "Another name for the Wireless Ethernet 802.11a is:",
"opts": [
"Wi-Fi",
"Wi-Fi4",
"Wi-Fi5",
"Wi-Fi6"
]
},
{
"n": 48,
"stem": "The process of transforming plain text into unreadable text:",
"opts": [
"Decryption",
"Encryption",
"Network Security",
"Information Hiding"
]
},
{
"n": 49,
"stem": "Choose the type of Wireless network threat would you classify, “When bogus reconfiguration commands are used to affect routers and switches to degrade network performance.”",
"opts": [
"Network Injection",
"Malicious Association",
"Man in the middle attack",
"Denial of Service"
]
},
{
"n": 50,
"stem": "VPN stands for:",
"opts": [
"Visual Performance Node",
"Virtual Private Network",
"Virtual Post Node",
"Virtual Post Network"
]
},
{
"n": 51,
"stem": "The network address of 172.16.0.0/19 provides how many subnets and hosts?",
"opts": [
"7 subnets, 30 hosts each",
"8 subnets, 8,190 hosts each",
"8 subnets, 30 hosts each",
"7 subnets, 8,190 hosts each"
]
},
{
"n": 52,
"stem": "The default port for FTP client connections is:",
"opts": [
"23",
"21",
"22",
"20"
]
},
{
"n": 53,
"stem": "You are asked to subnet a network that requires 5 subnets, each with at least 16 hosts. Which classful subnet mask would you use?",
"opts": [
"255.255.255.192",
"255.255.255.224",
"255.255.255.240",
"255.255.255.248"
]
},
{
"n": 54,
"stem": "In html, which tag is used to create the rows in a table?",
"opts": [
"<tr>",
"<th>",
"<frameset>",
"<td>"
]
},
{
"n": 55,
"stem": "Which tag is used in html to give paragraph?",
"opts": [
"<p>",
"<br>",
"<a>",
"<pre>"
]
},
{
"n": 56,
"stem": "Which of the following is not a Front end technologies?",
"opts": [
"Javascript",
"SQL",
"CSS",
"HTML"
]
},
{
"n": 57,
"stem": "CSS stands for:",
"opts": [
"Cascading style sheets",
"Cascading super sheets",
"Cascading style excel sheet",
"None of the above"
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
"stem": "What are the keys used in Database Design?",
"opts": [
"Candidate key",
"Primary key",
"Foreign key",
"All of the above"
]
},
{
"n": 60,
"stem": "Which of the following is not a RDBMS?",
"opts": [
"MySQL",
"MS SQL",
"MongoDB",
"Oracle"
]
},
{
"n": 61,
"stem": "What are the different levels of Testing?",
"opts": [
"Integration testing",
"Unit testing",
"System testing",
"All of the above"
]
},
{
"n": 62,
"stem": "Which of the following is the least secure method of authentication?",
"opts": [
"Facial recognition",
"Fingerprint",
"Key Card",
"Password"
]
},
{
"n": 63,
"stem": "When is the best time to perform Regression testing?",
"opts": [
"After the software has been modified",
"As frequently as possible",
"When the environment has been modified",
"Both option (a) & (c)"
]
},
{
"n": 64,
"stem": "Why is One Time password (OTP) used in many applications?",
"opts": [
"It is easy to generated",
"It cannot be shared",
"It is different for every access",
"It is a complex encrypted password"
]
},
{
"n": 65,
"stem": "Which of the following is a strong password?",
"opts": [
"B_hutan2023",
"b_hutan@2023",
"B_hutan@2023",
"b_hutan2023"
]
},
{
"n": 66,
"stem": "What are the advantages of MVC?",
"opts": [
"MVC segregates the project into a different segment",
"It is easy to edit or change part of the project that makes project less development and maintenance cost",
"MVC makes the project more systematic",
"All of the above"
]
},
{
"n": 67,
"stem": "Which of the following will help in preserving email security?",
"opts": [
"Create a strong password",
"Connect your email to a phone number",
"Use two-factor authentication",
"All of the above"
]
},
{
"n": 68,
"stem": "WPA2 is used for security in:",
"opts": [
"Ethernet",
"Bluetooth",
"Wi-Fi",
"E-mail"
]
},
{
"n": 69,
"stem": "An attempt to make a computer resource unavailable to its intended users is:",
"opts": [
"denial-of-service attack",
"virus attack",
"worms attack",
"botnet process"
]
},
{
"n": 70,
"stem": "Which of the following is the port number for HTTP?",
"opts": [
"79",
"80",
"81",
"82"
]
}
]"""

KEY = {
    1: ("b", "SI = PRT/100, so P = 4016.25 × 100 / (9 × 5) = Nu. 8,925."),
    2: ("d", "n/4 + 3 = 15 gives n/4 = 12, so n = 48."),
    3: ("c", "Digit product 20 with tens digit one less than units: 45; 45 + 9 = 54 (digits reversed)."),
    4: ("b", "The (old) HTML attribute for the page background colour is bgcolor: <body bgcolor=\"green\">."),
    5: ("b", "From the examples R=1, U=8, S=5, T=3, I=3, C=6, so RUSTIC = 185336."),
    7: ("a", "4 % 5 = 4, so a = 4 + 5 = 9."),
    8: ("d", "The % operator needs integer operands in C; using it on a float is a compile-time error."),
    9: ("c", "TCP/IP is the standard protocol suite of the Internet."),
    10: ("c", "Differences 1, 2, 3, 4, so the next difference is 5: 13 + 5 = 18."),
    11: ("b", "A fully qualified domain name = host name + domain name (e.g. www.example.bt)."),
    12: ("c", "SMTP = Simple Mail Transfer Protocol."),
    13: ("d", "The OSI model has 7 layers."),
    14: ("c", "The IP address uniquely identifies a host on the Internet."),
    15: ("c", "Microservices is an architectural style that builds an application as a set of small, loosely coupled, independently deployable services."),
    16: ("d", "In a mesh every node has multiple paths, so one failed link does not cut off communication - the most reliable topology."),
    17: ("c", "Microservices suit large, complex enterprise applications that change often, because each service can be changed and deployed alone."),
    18: ("c", "Outcome 1 follows Is Married? = No, Has children? = Yes, Is a child male? = Yes: unmarried with at least one son."),
    19: ("b", "Abstraction exposes only the essential features and hides implementation details."),
    20: ("c", "SELECT retrieves rows from a database."),
    21: ("a", "A constructor runs automatically when an object is declared (created)."),
    22: ("b", "SELECT DISTINCT returns only unique (non-duplicate) values."),
    23: ("d", "The tester sees the internal structure (paths through the code) between input and output - white-box testing."),
    24: ("b", "SELECT column1, column2 FROM table_name returns all rows with only the chosen columns."),
    25: ("a", "Car and bicycle inherit from Wheeled Vehicle, which inherits from Vehicle - a class hierarchy shows inheritance."),
    26: ("d", "(A+B)*C → AB+C*; D*E/F → DE*F/; then subtract: AB+C*DE*F/-."),
    27: ("c", "10 5 + = 15; 60 6 / = 10; 15 × 10 = 150; 150 − 8 = 142."),
    28: ("c", "(x − y)² = x² + y² − 2xy, so 16 = 58 − 2xy and xy = 21."),
    29: ("d", "Multiples of 4: 12; of 7: 7; of both (28): 1. (12 + 7 − 1)/50 = 18/50 = 9/25."),
    30: ("a", "SELECT column1, column2 FROM table_name WHERE condition."),
    31: ("b", "1×512 + 5×64 + 3×8 + 4 = 512 + 320 + 24 + 4 = 860."),
    32: ("c", "A flowchart is the graphical representation of an algorithm."),
    33: ("b", "T && T = T and F && T = F; T || F = True."),
    34: ("a", "A truth table for n inputs has 2^n rows: 2^5 = 32."),
    35: ("b", "Each octal digit is 3 bits: 4 = 100, 3 = 011, 2 = 010, 1 = 001 → 100011010001."),
    37: ("c", "A compiler translates a C program into machine language."),
    38: ("c", "A parity bit is added to detect errors in transmitted data."),
    39: ("a", "Removing from an empty stack causes underflow (adding to a full stack is overflow)."),
    40: ("c", "LIKE '%a' matches values that end with 'a'."),
    41: ("a", "ALTER TABLE changes a table definition - adding, modifying or dropping columns and constraints."),
    42: ("b", "UPDATE changes every row that matches the WHERE condition, so it can update many rows at once."),
    43: ("d", "UPDATE Persons SET LastName='Nilsen' WHERE LastName='Hansen'."),
    44: ("b", "127.0.0.1 is the IPv4 loopback (localhost) address."),
    46: ("c", "A key is the secret value an encryption algorithm uses to encrypt and decrypt."),
    47: ("a", "IEEE 802.11a is one of the original Wi-Fi standards, marketed simply as Wi-Fi (Wi-Fi 4, 5 and 6 are 802.11n, ac and ax)."),
    48: ("b", "Encryption turns plain text into unreadable cipher text."),
    49: ("a", "Injecting bogus reconfiguration commands to disrupt routers and switches is a network injection attack."),
    50: ("b", "VPN = Virtual Private Network."),
    51: ("b", "Class B default /16; /19 borrows 3 bits → 2³ = 8 subnets, each with 2^13 − 2 = 8,190 hosts."),
    52: ("b", "FTP clients connect to the server's control port 21 (port 20 carries data in active mode)."),
    53: ("b", "/27 (255.255.255.224) gives 8 subnets of 30 usable hosts; /28 gives only 14 hosts."),
    54: ("a", "<tr> creates a table row; <td> and <th> create cells."),
    55: ("a", "<p> defines a paragraph."),
    56: ("b", "SQL is a database (back-end) language; HTML, CSS and JavaScript are front-end technologies."),
    57: ("a", "CSS = Cascading Style Sheets."),
    58: ("b", "Eight groups of four hex digits is a valid IPv6 address; G is not hex, '::' may appear only once, and option d has five groups."),
    59: ("d", "Candidate, primary and foreign keys are all used in database design."),
    60: ("c", "MongoDB is a NoSQL document database, not a relational DBMS."),
    61: ("d", "Levels of testing include unit, integration, system and acceptance testing."),
    63: ("d", "Regression testing is done after the software or its environment has been modified."),
    64: ("c", "An OTP is valid for only one login or transaction, so a stolen one cannot be reused."),
    65: ("c", "B_hutan@2023 mixes upper and lower case letters, a number and special characters."),
    66: ("d", "MVC separates concerns, so projects are more systematic and easier and cheaper to change and maintain."),
    67: ("d", "Strong passwords, a linked phone for recovery and two-factor authentication all protect email."),
    68: ("c", "WPA2 secures Wi-Fi networks."),
    69: ("a", "A denial-of-service attack makes a resource unavailable to its intended users."),
    70: ("b", "HTTP uses port 80 (HTTPS uses 443)."),
}

NEW_MCQ = [
    ("What is the subnet mask for a /26 network?", ["255.255.255.128", "255.255.255.192", "255.255.255.224", "255.255.255.240"], "b",
     "/26 means 26 network bits: the last octet is 11000000 = 192, so the mask is 255.255.255.192."),
    ("The octal equivalent of the binary number 110101 is", ["65", "56", "53", "35"], "a",
     "Group into threes from the right: 110 = 6, 101 = 5, so the octal number is 65."),
    ("Which of the following combines two different factors of authentication?", ["A password and a PIN", "A password and a one-time code sent to your phone", "Two different passwords", "A username and a password"], "b",
     "Two-factor authentication uses two different kinds of factor - something you know (password) and something you have (phone/OTP)."),
]

SAQ = [
 dict(marks=4, stem="Write a function that takes an array of integers as an argument and returns a value based on the sums of the even and odd numbers in the array. Let X = the sum of the odd numbers in the array and let Y = the sum of the even numbers. The function should return X − Y. (4 marks)",
      kp=[("Correct function header taking an array (and its size) and returning an int; variables for X and Y initialised to 0", 1),
          ("Loop through every element and test odd/even with % 2", 1.5), ("Add odd values to X and even values to Y; return X − Y", 1.5)],
      model="int oddMinusEven(int arr[], int n) {\n    int x = 0, y = 0;            /* x = sum of odd, y = sum of even */\n    for (int i = 0; i < n; i++) {\n        if (arr[i] % 2 != 0) x += arr[i];   /* odd (also works for negatives) */\n        else y += arr[i];                    /* even */\n    }\n    return x - y;\n}\nFor example, for {1, 2, 3, 4, 5}: X = 1 + 3 + 5 = 9, Y = 2 + 4 = 6, and the function returns 3."),
 dict(marks=5, stem="Write HTML code to display the following data in tabular format:\nCode | Name | Agency | Department | Division\nA001 | Karma | MoIT | DHS | HR (5 marks)",
      kp=[("Basic page structure (<html>, <body>) and a <table> element, with border", 1), ("Header row using <tr> and five <th> cells: Code, Name, Agency, Department, Division", 2),
          ("Data row using <tr> and five <td> cells: A001, Karma, MoIT, DHS, HR; tags correctly closed", 2)],
      model="<!DOCTYPE html>\n<html>\n<body>\n<table border=\"1\">\n  <tr>\n    <th>Code</th><th>Name</th><th>Agency</th><th>Department</th><th>Division</th>\n  </tr>\n  <tr>\n    <td>A001</td><td>Karma</td><td>MoIT</td><td>DHS</td><td>HR</td>\n  </tr>\n</table>\n</body>\n</html>"),
 dict(marks=5, stem="Write a C program to print the following shape:\n******\n*****\n****\n***\n**\n* (5 marks)",
      kp=[("#include <stdio.h> and main() correctly written", 1), ("Outer loop for 6 rows counting down (i = 6 to 1)", 2), ("Inner loop printing i stars, then a newline after each row", 2)],
      model="#include <stdio.h>\nint main() {\n    int i, j;\n    for (i = 6; i >= 1; i--) {      /* 6 rows, from 6 stars down to 1 */\n        for (j = 1; j <= i; j++)\n            printf(\"*\");\n        printf(\"\\n\");\n    }\n    return 0;\n}"),
 dict(marks=4, stem="Convert the following:\n(a) 210 - decimal into binary\n(b) 41 - octal into binary\n(c) 11110000 - binary into decimal\n(d) 1228 - decimal into hexadecimal (4 marks)",
      kp=[("(a) 210₁₀ = 11010010₂", 1), ("(b) 41₈ = 100 001 = 100001₂", 1), ("(c) 11110000₂ = 128 + 64 + 32 + 16 = 240₁₀", 1), ("(d) 1228₁₀ = 4CC₁₆ (1228 = 4×256 + 12×16 + 12)", 1)],
      model="(a) 210 = 128 + 64 + 16 + 2 → 11010010. (b) Each octal digit becomes 3 bits: 4 = 100, 1 = 001 → 100001. (c) 11110000 = 128 + 64 + 32 + 16 = 240. (d) 1228 ÷ 16 = 76 remainder 12 (C); 76 ÷ 16 = 4 remainder 12 (C); 4 → 4CC (check: 4×256 + 12×16 + 12 = 1024 + 192 + 12 = 1228)."),
 dict(marks=4, stem="Write a function to reverse an integer using numeric operators and without using any arrays or other data structures. (4 marks)",
      kp=[("Function takes an int and returns an int; result initialised to 0", 1), ("Loop while n != 0: take the last digit with n % 10", 1),
          ("Build the result with rev = rev * 10 + digit and drop the digit with n = n / 10; return rev", 2)],
      model="int reverse(int n) {\n    int rev = 0;\n    while (n != 0) {\n        int digit = n % 10;      /* last digit */\n        rev = rev * 10 + digit;  /* append it */\n        n = n / 10;              /* remove it */\n    }\n    return rev;\n}\nFor example reverse(1234) = 4321 (it also works for negative numbers in C, e.g. -123 → -321)."),
 dict(marks=4, stem="Write the full forms of the following acronyms: (a) HTTP; (b) API; (c) SDLC; (d) ERP. (4 marks)",
      kp=[("(a) HyperText Transfer Protocol", 1), ("(b) Application Programming Interface", 1), ("(c) Software Development Life Cycle", 1), ("(d) Enterprise Resource Planning", 1)],
      model="(a) HTTP - HyperText Transfer Protocol. (b) API - Application Programming Interface. (c) SDLC - Software Development Life Cycle. (d) ERP - Enterprise Resource Planning."),
 dict(marks=4, stem="Give any four key features of object-oriented programming. (4 marks)",
      kp=[("Encapsulation - data and methods bundled in a class, with data hidden behind an interface", 1), ("Inheritance - a class reuses and extends another class", 1),
          ("Polymorphism - the same method name behaves differently for different objects (overloading/ overriding)", 1), ("Abstraction - showing only essential features and hiding details (also accepted: classes and objects)", 1)],
      model="(1) Encapsulation: data and the functions that work on it are bundled inside a class, and the data is hidden (private) and accessed through methods. (2) Inheritance: a new (child) class acquires the properties and methods of an existing (parent) class, allowing reuse, e.g. Car inherits from Vehicle. (3) Polymorphism: one interface, many forms - the same method name works differently for different objects, through overloading and overriding. (4) Abstraction: only the essential features are shown and the complex implementation is hidden, e.g. through abstract classes and interfaces. Classes and objects are the basic building blocks of all these features."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
