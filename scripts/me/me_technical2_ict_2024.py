"""Marks follow the latest (BCSE 2025) layout: every short answer is set to 5 marks by supabase/data/me_technical2_ict_marks_2025_layout.sql.
ME Technical Paper II (General Subject Knowledge), ICT group, BCSE 2024 - real paper. PDF sent by the founder.
Part I 70 MCQ x 1 as in 2025. Part II in 2024 has 7 questions (six x 4 marks and one x 6 = 30) where 2025 has 6
(6, 5, 5, 6, 3, 5 = 30); the same 30 marks, so the 2024 questions are kept as printed (merging unrelated questions would
change them). Q7 says 'six-month period' but gives five months; read as five.
Left out: MCQ 70 (year 5G was launched in Bhutan - could not be confirmed); one new MCQ keeps Part I at 70.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, ICT): BCSE 2024, batch 1"
GROUP_TAG = "ict2024"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "ict"
ADDS_TO_PAPER = True
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper II, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 6, "marks_each": 5, "answer_any": None},
]
TOPIC = "ICT: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Find the missing number in the sequence: 2, 5, 10, 17, __, 37.",
"opts": [
"25",
"26",
"27",
"28"
]
},
{
"n": 2,
"stem": "What is the longest length a CAT5e Ethernet cable can be for maintaining proper signal quality",
"opts": [
"50 meters",
"100 meters",
"125 meters",
"150 meters"
]
},
{
"n": 3,
"stem": "What is the key difference between IMAP and POP3?",
"opts": [
"POP3 stores emails on the server, IMAP stores emails on the client",
"POP3 deletes emails from the server after retrieval, IMAP keeps emails on the server",
"IMAP does not support folders, POP3 does",
"IMAP is used for sending emails, POP3 is used for receiving emails"
]
},
{
"n": 4,
"stem": "Which technology is often used to create augmented reality experiences?",
"opts": [
"Computer Vision",
"GPS",
"3D rendering",
"All of the above"
]
},
{
"n": 5,
"stem": "A malicious code hidden inside a seemingly harmless piece of code is called _________",
"opts": [
"Trojan Horse",
"Virus",
"Worm",
"Malware"
]
},
{
"n": 6,
"stem": "Which HTTP method is used to submit data to be processed to a specified resource?",
"opts": [
"POST",
"GET",
"PUT",
"PATCH"
]
},
{
"n": 7,
"stem": "What is the purpose of virtual hosting on a web server?",
"opts": [
"To increase storage",
"To increase server response time",
"To provide database services",
"To run multiple websites on single server"
]
},
{
"n": 8,
"stem": "Which of the following languages is commonly used for server-side scripting?",
"opts": [
"HTML",
"PHP",
"CSS",
"JavaScript"
]
},
{
"n": 9,
"stem": "What is inheritance in the context of object-oriented programming?",
"opts": [
"The process of hiding data",
"The ability to create new classes based on existing classes",
"The mechanism to share data between different classes",
"The process of creating functions within a class"
]
},
{
"n": 10,
"stem": "What does cardinality in an ERD indicate?",
"opts": [
"The number of attributes in an entity",
"The number of relationships between entities",
"The number of instances of one entity that can or must be associated with instances of another entity",
"The total number of entities in the diagram"
]
},
{
"n": 11,
"stem": "Which type of attack involves intercepting and altering communications between two parties without their knowledge?",
"opts": [
"Man-in-the-Middle Attack",
"Denial of Service Attack",
"Brute Force Attack",
"SQL Injection"
]
},
{
"n": 12,
"stem": "Which normal form requires that all attributes contain atomic values?",
"opts": [
"1NF",
"2NF",
"3NF",
"BCNF"
]
},
{
"n": 13,
"stem": "Which type of data analytics focuses on understanding historical data and trends?",
"opts": [
"Diagnostic analytics",
"Prescriptive analytics",
"Predictive analytics",
"Descriptive analytics"
]
},
{
"n": 14,
"stem": "Which of the following is a popular tool for data visualization?",
"opts": [
"MySQL",
"R",
"Tableau",
"Python"
]
},
{
"n": 15,
"stem": "What is the function of the HAVING clause in SQL?",
"opts": [
"To filter records before grouping",
"To filter aggregated records after grouping",
"To sort the results of a query",
"To join two tables together"
]
},
{
"n": 16,
"stem": "Which data structure is used for implementing a breadth-first search (BFS) in a graph?",
"opts": [
"Stack",
"Linked List",
"Array",
"Queue"
]
},
{
"n": 17,
"stem": "Which of the following IP address classes is used for multicast in IPv4?",
"opts": [
"Class A",
"Class B",
"Class C",
"Class D"
]
},
{
"n": 18,
"stem": "Which port number is used for SSH (Secure Shell)?",
"opts": [
"22",
"23",
"24",
"25"
]
},
{
"n": 19,
"stem": "Which command is used to display the files and folders in the current directory?",
"opts": [
"SHOWDIR",
"DIR",
"PATH",
"DIRECTORY"
]
},
{
"n": 20,
"stem": "What type of database architecture uses a single database server to serve multiple client applications?",
"opts": [
"Centralized architecture",
"Cloud architecture",
"Distributed architecture",
"Federated architecture"
]
},
{
"n": 21,
"stem": "At which layer of the OSI model does routing occur?",
"opts": [
"Data Link layer",
"Network layer",
"Physical layer",
"Transport layer"
]
},
{
"n": 22,
"stem": "Which technology is commonly used for secure online transactions?",
"opts": [
"SSL (Secure Sockets Layer)",
"RFID (Radio Frequency Identification)",
"QR codes",
"NFC (Near Field Communication)"
]
},
{
"n": 23,
"stem": "What does the term \"single sign-on\" (SSO) refer to in digital identity management?",
"opts": [
"A process that requires multiple usernames and passwords for different services",
"A mechanism that allows users to authenticate once and gain access to multiple applications",
"A method of logging in using biometric data",
"A technique for managing physical access to buildings"
]
},
{
"n": 24,
"stem": "Which of the following frameworks is commonly used for enterprise architecture?",
"opts": [
"Agile",
"Six Sigma",
"Waterfall",
"TOGAF (The Open Group Architecture Framework)"
]
},
{
"n": 25,
"stem": "Which document outlines the detailed specifications for a project, including functional and non- functional requirements?",
"opts": [
"BRD",
"SRS (Software Requirements Specification)",
"Project Charter",
"Feasibility Study"
]
},
{
"n": 26,
"stem": "A man took a loan from a bank at the rate of 8% p.a. simple interest. After 5 years, he had to pay Nu. 4000 interest only for the period. The principal amount borrowed by him was:",
"opts": [
"Nu. 8,000",
"Nu. 1,000",
"Nu. 12,000",
"Nu. 10,000"
]
},
{
"n": 27,
"stem": "What is the primary purpose of a VPN (Virtual Private Network)?",
"opts": [
"To provide secure and encrypted communication over a less secure network",
"To increase the speed of internet connections",
"To filter and block unwanted websites",
"To manage network bandwidth usage"
]
},
{
"n": 28,
"stem": "In an election between two candidates, one got 60% of the total valid votes, and 10% of the votes were invalid. If the total number of votes was 10,000, the number of valid votes that the other candidate got was:",
"opts": [
"3400",
"3600",
"3800",
"4000"
]
},
{
"n": 29,
"stem": "Which command is used to delete a table from a database?",
"opts": [
"REMOVE TABLE CUSTOMER;",
"DROP TABLE CUSTOMER;",
"DELETE TABLE CUSTOMER;",
"UPDATE TABLE CUSTOMER;"
]
},
{
"n": 30,
"stem": "Which government agency is mandated to carry out all functions related to ICT in the country?",
"opts": [
"DITT",
"GovTech Agency",
"MOIC",
"Department of Information Technology"
]
},
{
"n": 31,
"stem": "What does API stand for?",
"opts": [
"Application Programming Interface",
"Advanced Programming Interface",
"Automated Program Integration",
"Application Process Integration"
]
},
{
"n": 32,
"stem": "Which clause is used to sort the results of a query?",
"opts": [
"SORT BY",
"ORDER BY",
"GROUP BY",
"None of the above"
]
},
{
"n": 33,
"stem": "The sum of the first 20 natural numbers is:",
"opts": [
"180",
"190",
"200",
"210"
]
},
{
"n": 34,
"stem": "What is the difference between a digital signature and an eSignature?",
"opts": [
"A digital signature is a handwritten signature scanned into a digital format, while an eSignature is an encrypted signature used for secure transactions.",
"A digital signature is a type of eSignature that uses encryption to provide security, while an eSignature is any electronic method of signing a document.",
"A digital signature is used exclusively for government documents, while an eSignature is used for commercial transactions.",
"A digital signature requires a physical device to create, while an eSignature can be created on any digital device."
]
},
{
"n": 35,
"stem": "What is the primary function of a firewall?",
"opts": [
"To monitor network traffic",
"To block unauthorized access",
"To manage user permissions",
"To store data securely"
]
},
{
"n": 36,
"stem": "A candy store owner had some apples. She sells 20% of the apples and still has 80 apples left. How much did she have originally?",
"opts": [
"90 apples",
"100 apples",
"120 apples",
"140 apples"
]
},
{
"n": 37,
"stem": "Which HTML tag is used to define an internal style sheet?",
"opts": [
"<style>",
"<css>",
"<stylesheet>",
"<script>"
]
},
{
"n": 38,
"stem": "Which of the following is a benefit of using cloud storage?",
"opts": [
"Limited accessibility",
"High maintenance cost",
"Scalability and flexibility",
"Restricted data sharing"
]
},
{
"n": 39,
"stem": "Which of the following is a NoSQL database?",
"opts": [
"MySQL",
"Oracle",
"MongoDB",
"PostgreSQL"
]
},
{
"n": 40,
"stem": "In cybersecurity, what is a 'phishing' attack?",
"opts": [
"An attack that tries to trick users into revealing personal information",
"An attack that floods a network with traffic",
"An attack that infects computers with malware",
"An attack that decrypts sensitive data"
]
},
{
"n": 41,
"stem": "If a file is 4MB in size and the upload speed is 1Mbps, how long will it take to upload the file?",
"opts": [
"32 seconds",
"4 seconds",
"8 seconds",
"16 seconds"
]
},
{
"n": 42,
"stem": "A user is experiencing slow performance on their computer. Which of the following is least likely to be the cause?",
"opts": [
"Insufficient RAM",
"Malware infection",
"Fragmented hard drive",
"High-speed internet connection"
]
},
{
"n": 43,
"stem": "Which network topology is most resilient to a single point of failure, and why?",
"opts": [
"Star Topology",
"Bus Topology",
"Ring Topology",
"Mesh Topology"
]
},
{
"n": 44,
"stem": "In a binary tree, what is a 'leaf' node?",
"opts": [
"A node that has no children",
"A node that has one child",
"A node that has two children",
"A node that is the root of the tree"
]
},
{
"n": 45,
"stem": "What is the primary purpose of RAID in computer storage?",
"opts": [
"To provide data redundancy and improve performance",
"To reduce storage costs",
"To compress data",
"To encrypt data"
]
},
{
"n": 46,
"stem": "Which of the following is an open-source operating system?",
"opts": [
"Windows 10",
"macOS",
"Linux",
"Solaris"
]
},
{
"n": 47,
"stem": "A company's network performance is degrading during peak hours. What is the best course of action to identify the issue?",
"opts": [
"Increase the bandwidth",
"Monitor network traffic to identify the source of congestion",
"Upgrade the network hardware",
"Limit the number of users on the network"
]
},
{
"n": 48,
"stem": "What is the primary function of a compiler?",
"opts": [
"To execute program code",
"To translate source code into machine code",
"To debug program code",
"To edit program code"
]
},
{
"n": 49,
"stem": "What is the main advantage of using cloud storage?",
"opts": [
"Increased physical storage space",
"Easy data sharing and access from anywhere",
"Faster data retrieval",
"Improved data security"
]
},
{
"n": 50,
"stem": "Which of the following is an example of a web server?",
"opts": [
"Apache",
"MySQL",
"Oracle",
"MongoDB"
]
},
{
"n": 51,
"stem": "What does the term 'open source' refer to?",
"opts": [
"Software that is free to use",
"Software whose source code is available for modification or enhancement by anyone",
"Software that runs on multiple platforms",
"Software that is not proprietary"
]
},
{
"n": 52,
"stem": "What is the main function of a proxy server?",
"opts": [
"To act as an intermediary for requests from clients seeking resources from other servers",
"To store data",
"To execute program code",
"To compile application programs"
]
},
{
"n": 53,
"stem": "What is the primary purpose of cache memory?",
"opts": [
"To store frequently accessed data and instructions",
"To increase the permanent storage capacity",
"To protect data from unauthorized access",
"To manage network connections"
]
},
{
"n": 54,
"stem": "In which layer of the OSI model does the HTTP protocol operate?",
"opts": [
"Network layer",
"Transport layer",
"Data link layer",
"Application layer"
]
},
{
"n": 55,
"stem": "What is the purpose of the 'ping' command in networking?",
"opts": [
"To test the reachability of a host on an IP network",
"To measure the speed of a network connection",
"To configure network settings",
"To encrypt data"
]
},
{
"n": 56,
"stem": "What does SEO stand for and what is its purpose?",
"opts": [
"Secure Email Operation; To secure email communications.",
"Search Engine Operation; To manage search engines.",
"Search Engine Optimization; To improve website visibility in search engines.",
"System Engine Optimization; To optimize system performance."
]
},
{
"n": 57,
"stem": "Which of the following is not a common HTTP method used in RESTful APIs?",
"opts": [
"SEND",
"GET",
"POST",
"DELETE"
]
},
{
"n": 58,
"stem": "Which protocol operates at the Network layer of the OSI model?",
"opts": [
"FTP",
"IP",
"HTTP",
"TCP"
]
},
{
"n": 59,
"stem": "What is the default port for PostgreSQL?",
"opts": [
"3306",
"1433",
"1521",
"5432"
]
},
{
"n": 60,
"stem": "What does ETL stand for in the context of data processing?",
"opts": [
"Extract, Transform, Load",
"Encode, Transfer, Load",
"Extract, Transfer, Link",
"Encode, Transform, Link"
]
},
{
"n": 61,
"stem": "What is \"ransomware\"?",
"opts": [
"A form of social engineering attack.",
"Software used to monitor network traffic.",
"Malware that encrypts a user's files and demands payment for the decryption key.",
"A type of phishing attack."
]
},
{
"n": 62,
"stem": "Which layer of the OSI model is responsible for establishing, managing, and terminating connections between applications?",
"opts": [
"Physical Layer",
"Data Link Layer",
"Network Layer",
"Session Layer"
]
},
{
"n": 63,
"stem": "Which of the following is a subfield of AI focused on enabling computers to understand human language?",
"opts": [
"Machine Learning",
"Natural Language Processing",
"Autonomous AI",
"Computer vision"
]
},
{
"n": 64,
"stem": "Which of the following keys combines two or more attributes to uniquely identify a record?",
"opts": [
"Primary key",
"Foreign key",
"Composite key",
"Unique key"
]
},
{
"n": 65,
"stem": "Which of the following is an example of artificial intelligence (AI)?",
"opts": [
"A database management system",
"A weather forecasting model",
"A digital camera",
"An email client"
]
},
{
"n": 66,
"stem": "Which of the following is a well-known platform for accessing open data?",
"opts": [
"Data lake",
"Data warehouse",
"Data.gov",
"Amazon Cloud Service"
]
},
{
"n": 67,
"stem": "What does \"BCC\" stand for in an email header?",
"opts": [
"Blind Carbon Copy.",
"Blind Continuous Copy.",
"Blind Contact Copy.",
"Blind Central Copy."
]
},
{
"n": 68,
"stem": "Which of the following data structures is a LIFO (Last In, First Out) structure?",
"opts": [
"Linked List",
"Queue",
"Stack",
"Binary Tree"
]
},
{
"n": 69,
"stem": "What technology underpins Bitcoin and other cryptocurrencies?",
"opts": [
"Cloud computing",
"Blockchain",
"Quantum computing",
"Artificial Intelligence"
]
},
{
"n": 70,
"stem": "In which year was 5G launched in Bhutan?",
"opts": [
"2023",
"2022",
"2021",
"2020"
]
}
]"""

KEY = {
    1: ("b", "Terms are n² + 1: 2, 5, 10, 17, 26, 37."), 2: ("b", "Cat5e Ethernet is specified up to 100 m."),
    3: ("b", "POP3 usually downloads and deletes mail from the server; IMAP keeps it on the server and syncs."),
    4: ("d", "AR combines computer vision, GPS/ sensors and 3D rendering."), 5: ("a", "A Trojan horse hides malicious code inside apparently harmless software."),
    6: ("a", "POST submits data to be processed."), 7: ("d", "Virtual hosting runs multiple websites on one server."),
    8: ("b", "PHP is a server-side scripting language."), 9: ("b", "Inheritance creates new classes from existing ones."),
    10: ("c", "Cardinality gives how many instances of one entity relate to instances of another (1:1, 1:N, M:N)."),
    11: ("a", "Man-in-the-middle attacks intercept and alter communications."), 12: ("a", "1NF requires atomic values."),
    13: ("d", "Descriptive analytics summarises historical data."), 14: ("c", "Tableau is a dedicated data visualisation tool."),
    15: ("b", "HAVING filters groups after aggregation; WHERE filters rows before grouping."), 16: ("d", "BFS uses a queue."),
    17: ("d", "Class D (224.0.0.0-239.255.255.255) is for multicast."), 18: ("a", "SSH uses port 22."),
    19: ("b", "DIR lists directory contents (Windows command prompt)."), 20: ("a", "A single central server serving many clients is centralised architecture."),
    21: ("b", "Routing happens at the network layer (layer 3)."), 22: ("a", "SSL/ TLS secures online transactions."),
    23: ("b", "SSO: authenticate once to access many applications."), 24: ("d", "TOGAF is an enterprise architecture framework."),
    25: ("b", "The SRS details functional and non-functional requirements."), 26: ("d", "P = I x 100/(R x T) = 4000 x 100/(8 x 5) = Nu 10,000."),
    27: ("a", "A VPN gives encrypted, secure communication over a public network."), 28: ("b", "Valid votes 9,000; the other candidate got 40% = 3,600."),
    29: ("b", "DROP TABLE removes the table."), 30: ("b", "The GovTech Agency (2022) is mandated for ICT functions in Bhutan."),
    31: ("a", "Application Programming Interface."), 32: ("b", "ORDER BY sorts results."), 33: ("d", "20 x 21/2 = 210."),
    34: ("b", "A digital signature is an encrypted, certificate-based type of electronic signature."),
    35: ("b", "A firewall's primary function is to block unauthorised access by filtering traffic."), 36: ("b", "80 is 80% of 100."),
    37: ("a", "The <style> tag defines an internal style sheet."), 38: ("c", "Cloud storage offers scalability and flexibility."),
    39: ("c", "MongoDB is a NoSQL document database."), 40: ("a", "Phishing tricks users into revealing information."),
    41: ("a", "4 MB = 32 megabits; at 1 Mbps that takes 32 seconds."), 42: ("d", "A fast internet connection does not slow a computer."),
    43: ("d", "Mesh topology has multiple paths, so no single point of failure."), 44: ("a", "A leaf node has no children."),
    45: ("a", "RAID provides redundancy and/ or performance."), 46: ("c", "Linux is open source."),
    47: ("b", "Monitor traffic first to find the cause."), 48: ("b", "A compiler translates source code into machine code."),
    49: ("b", "Cloud storage allows easy sharing and access from anywhere."), 50: ("a", "Apache is a web server."),
    51: ("b", "Open source: source code available to view, modify and share."), 52: ("a", "A proxy acts as an intermediary for client requests."),
    53: ("a", "Cache stores frequently used data and instructions for fast access."), 54: ("d", "HTTP is an application-layer protocol."),
    55: ("a", "Ping tests reachability using ICMP echo."), 56: ("c", "Search Engine Optimisation improves visibility in search results."),
    57: ("a", "SEND is not an HTTP method."), 58: ("b", "IP operates at the network layer."), 59: ("d", "PostgreSQL's default port is 5432."),
    60: ("a", "Extract, Transform, Load."), 61: ("c", "Ransomware encrypts files and demands payment."), 62: ("d", "The session layer manages sessions."),
    63: ("b", "Natural language processing."), 64: ("c", "A composite key combines two or more attributes."),
    65: ("b", "A weather forecasting model using learned patterns is an AI/ ML application; the others are conventional software or devices."),
    66: ("c", "Data.gov is a well-known open data portal."), 67: ("a", "Blind carbon copy."), 68: ("c", "A stack is LIFO."), 69: ("b", "Blockchain."),
}
NEW_MCQ = [
    ("Which protocol automatically assigns IP addresses to devices on a network?", ["DNS", "DHCP", "FTP", "SMTP"], "b", "DHCP (Dynamic Host Configuration Protocol) assigns IP configuration."),
]
SAQ = [
 dict(marks=4, stem="What is a Web Application Firewall (WAF)? State two differences between a WAF and a traditional network firewall. (4 marks)",
      kp=[("WAF: filters, monitors and blocks HTTP/ HTTPS traffic to and from a web application, protecting against attacks such as SQL injection, XSS, CSRF (OWASP Top 10)", 2),
          ("Differences (any two): layer 7 vs layers 3-4; inspects content of HTTP requests vs filters by IP/ port/ protocol; protects web apps vs whole network; rules on application attacks vs access rules", 2)],
      model="A Web Application Firewall is a security control placed in front of a web application that monitors, filters and blocks HTTP/HTTPS traffic, protecting against application-layer attacks such as SQL injection, cross-site scripting (XSS), CSRF and other OWASP Top 10 threats. Differences: (1) a WAF works at the application layer (layer 7) and inspects the content of web requests and responses, whereas a traditional network firewall works mainly at the network and transport layers (3-4), filtering by IP address, port and protocol; (2) a WAF protects specific web applications from application attacks, whereas a network firewall controls access to and from the whole network (it would allow a malicious request on port 443 that a WAF can block)."),
 dict(marks=4, stem="Given a table named complaints with columns user_id, complaint_id and complaint_date, write an SQL query that returns only the users who have made more than three complaints. (4 marks)",
      kp=[("SELECT user_id (with COUNT) FROM complaints GROUP BY user_id", 2), ("HAVING COUNT(complaint_id) > 3 (not WHERE); correct syntax", 2)],
      model="SELECT user_id, COUNT(complaint_id) AS total_complaints\nFROM complaints\nGROUP BY user_id\nHAVING COUNT(complaint_id) > 3;\nGROUP BY collects each user's complaints, and HAVING filters the groups after counting, keeping only users with more than three complaints (WHERE cannot be used with an aggregate)."),
 dict(marks=4, stem="Explain the differences between native and hybrid mobile applications. (4 marks)",
      kp=[("Native: built for one platform with its language/ SDK (Swift/ Kotlin), best performance, full access to device features, separate codebases, higher cost", 2),
          ("Hybrid: web technologies (HTML, CSS, JS) in a native wrapper (Ionic, Cordova) or cross-platform frameworks; one codebase for many platforms, faster/ cheaper development, lower performance/ limited native access, store distribution", 2)],
      model="Native apps are developed for a specific platform using its own language and tools - Swift/Objective-C for iOS, Kotlin/Java for Android. They give the best performance and user experience, full access to device features (camera, GPS, sensors) and work well offline, but require separate codebases for each platform, so development and maintenance cost more. Hybrid apps are built with web technologies (HTML, CSS, JavaScript) running inside a native container (e.g. Ionic, Cordova), so a single codebase runs on several platforms and is faster and cheaper to build and update; however, performance and smoothness are lower and access to some device features depends on plugins. Both are distributed through app stores."),
 dict(marks=4, stem="What is Web 3.0? List any three key characteristics of Web 3.0. (4 marks)",
      kp=[("Definition: the next generation of the web, decentralised, built on blockchain, giving users ownership of data, also semantic/ intelligent web", 1),
          ("Three characteristics (1 each): decentralisation, blockchain and cryptocurrencies/ tokens, user ownership and control of data/ digital identity, trustless and permissionless, semantic web/ AI, smart contracts, interoperability, ubiquity (IoT)", 3)],
      model="Web 3.0 is the proposed next generation of the World Wide Web, which aims to be decentralised - built on blockchain and peer-to-peer networks rather than large central platforms - so users control their own data, identity and digital assets; it also includes the 'semantic web', where machines understand the meaning of data using AI. Key characteristics: (1) decentralisation - data and applications are distributed across networks instead of central servers; (2) blockchain, cryptocurrencies and tokens, with smart contracts and decentralised apps (dApps); (3) user ownership and control of data and identity; (4) trustless and permissionless interaction without intermediaries; (5) semantic web and artificial intelligence for more intelligent, personalised services; (6) ubiquity and interoperability across devices, including IoT."),
 dict(marks=4, stem="Explain the difference between black-box testing and white-box testing. (4 marks)",
      kp=[("Black-box: tests functionality from the user's view without knowledge of internal code - inputs/ outputs against requirements; techniques: equivalence partitioning, boundary value analysis; done by testers; e.g. system/ acceptance testing", 2),
          ("White-box: tests internal structure, logic and code paths with knowledge of code - statement/ branch/ path coverage; done by developers; e.g. unit testing", 2)],
      model="Black-box testing checks what the software does without looking at its internal code: the tester gives inputs and compares outputs with the requirements, using techniques such as equivalence partitioning, boundary value analysis and decision tables. It is usually done by testers or users (system and acceptance testing) and needs no programming knowledge. White-box (glass-box) testing checks how the software works internally: the tester, usually a developer, knows the code and designs tests to exercise statements, branches, conditions and paths (code coverage), loops and data flow. It is used mainly in unit and integration testing and finds logic errors, while black-box testing finds missing or incorrect functionality."),
 dict(marks=4, stem="What is an API key, and how is it used for authentication? (4 marks)",
      kp=[("API key: a unique identifier/ secret token issued to a client application by an API provider", 1.5),
          ("Use: sent with each request (header/ query parameter) - server checks it to identify and authorise the client, apply permissions, rate limits, track usage and billing; keep secret, use HTTPS, rotate/ revoke; not strong user authentication (combine with OAuth)", 2.5)],
      model="An API key is a unique string (token) that an API provider issues to a developer or client application to identify it when it calls the API. Use for authentication: the client includes the key with every request, usually in an HTTP header (e.g. 'x-api-key' or 'Authorization') or sometimes as a query parameter; the server checks the key against its records and, if valid, allows the request, applying the permissions, rate limits and quotas linked to that key and logging usage for monitoring and billing. Invalid or revoked keys are rejected. API keys must be kept secret (not in public code), sent only over HTTPS, restricted and rotated; they identify the application rather than a user, so stronger methods such as OAuth tokens are used for user-level access."),
 dict(marks=6, stem="For the following sales data (Nu.), answer the questions. Jan: sales 10,000, expenses 7,000; Feb: sales 11,000, expenses 13,000; Mar: sales 8,000, expenses 6,000; Apr: sales 9,000, expenses 15,500; May: sales 15,000, expenses 12,000.\na) Which type of graph would you use to compare the monthly sales over the five-month period? Explain your choice. (2 marks)\nb) To visualise the proportion of total sales contributed by each month, which type of chart would you choose and why? (2 marks)\nc) How would you graphically represent the overall comparison of total sales and total expenses over the five-month period? Explain your reasoning. (2 marks)",
      kp=[("a) Line graph (shows trend over time) or column/ bar chart (compares months) - with reason", 2),
          ("b) Pie chart (or 100% stacked bar/ donut): shows each month's share of total sales (total 53,000; e.g. May ≈ 28%)", 2),
          ("c) Clustered (side-by-side) bar/ column chart of totals - sales 53,000 vs expenses 53,500 - or a combined line chart of monthly sales and expenses; reasoning", 2)],
      model="a) A line graph (or a column chart) - months on the x-axis and sales on the y-axis; a line graph clearly shows the trend over time (dip in March, rise to May), while columns make month-to-month comparison easy.\nb) A pie chart (or donut chart) - total sales are Nu 53,000, and each slice shows a month's share (Jan 18.9%, Feb 20.8%, Mar 15.1%, Apr 17.0%, May 28.3%), making the part-to-whole relationship clear.\nc) A clustered (side-by-side) bar chart with two bars - total sales Nu 53,000 and total expenses Nu 53,500 - shows at a glance that expenses slightly exceeded sales overall; alternatively, a clustered column or dual-line chart of monthly sales and expenses shows both the totals and the months (Feb and Apr) where expenses were higher than sales."),
]
Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
