"""ME Technical Paper II (General Subject Knowledge), ICT group, BCSE 2025 - real paper. PDF sent by the founder.
Pattern: Part I 70 MCQ x 1; Part II 6 short-answer questions, all compulsory, with marks 6, 5, 5, 6, 3, 5 (30).
90 min + 15 min reading.
Left out (answer not certain / two options correct): MCQ 13 (192.0.2.x and 203.0.113.x are also non-routable test
ranges), 18 (DELETE and TRUNCATE both keep the table), 40 (CID generation), 69 (unclear); four new MCQs keep Part I at 70.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical2_common.py"))
RUBRIC, build_q = _c["RUBRIC"], _c["build_q"]

BATCH = "ME Paper II (Technical, ICT): BCSE 2025, batch 1"
GROUP_TAG = "ict2025"
PAPER = "me-technical-2"
SUBJECT = "general-subject-knowledge"
SUBJECT_GROUP = "ict"
MIN_WORDS = 0
GROUP_TIMING = {"duration": 90, "reading": 15, "max_marks": 100}
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper II, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}
PATTERN = [
    {"title": "Part I: Multiple choice questions", "type": "mcq", "count": 70, "marks_each": 1, "answer_any": None},
    {"title": "Part II: Short answer questions", "type": "short_answer", "count": 6, "marks_each": 5, "answer_any": None},
]
TOPIC = "ICT: general subject knowledge"

MCQ = r"""[
{
"n": 1,
"stem": "Present ages of Karma and Sonam are in the ratio 7:5 respectively. Five years hence, the ratio of their ages will become 9:7. What is Sonam’s present age in years?",
"opts": [
"12.5 years",
"14 years",
"9.6 years",
"12 years"
]
},
{
"n": 2,
"stem": "Tickets numbered 1 to 30 are mixed up. A ticket is drawn at random. What is the probability that the ticket drawn has a number which is a multiple of 4 or 6? Choose a simplified standard answer.",
"opts": [
"10/30",
"1/3",
"2/3",
"3/15"
]
},
{
"n": 3,
"stem": "From a group of 8 men and 5 women, five persons are to be selected to form a committee so that at least 3 men are there on the committee. In how many ways can it be done?",
"opts": [
"966",
"735",
"756",
"None of these"
]
},
{
"n": 4,
"stem": "In the HTML table below, which tag is responsible for defining a table row? <table border=\"1\"> <thead> <tr> <th>Dzongkhag</th> <th>Famous Dzong</th> </tr> </thead> <tbody> <tr> <td>Paro</td> <td>Rinpung Dzong</td> </tr> </tbody> </table>",
"opts": [
"<td>",
"<th>",
"<tr>",
"<table>"
]
},
{
"n": 5,
"stem": "Which HTTP method echoes back the received request, mainly used for diagnostic purposes?",
"opts": [
"TRACE",
"OPTIONS",
"HEAD",
"GET"
]
},
{
"n": 6,
"stem": "Which RAID level combines both disk mirroring and disk striping to provide high performance and fault tolerance?",
"opts": [
"RAID 0",
"RAID 1",
"RAID 5",
"RAID 10"
]
},
{
"n": 7,
"stem": "Which command erases a directory and its contents recursively and forcefully?",
"opts": [
"rm -rf",
"rm -r",
"delete -all",
"erase -rf"
]
},
{
"n": 8,
"stem": "Which malware is sometimes delivered through Trojans or worms and prevents normal access to files by encrypting them until payment is made?",
"opts": [
"Spyware",
"Ransomware",
"Adware",
"Virus"
]
},
{
"n": 9,
"stem": "What is the primary goal of a post-incident review?",
"opts": [
"Punish employees responsible",
"Restore network access immediately",
"Identify lessons learned and improve security measures",
"Ignore minor incidents"
]
},
{
"n": 10,
"stem": "Which protocol is primarily used to securely transfer files over the internet?",
"opts": [
"FTP",
"HTTP",
"SFTP",
"SMTP"
]
},
{
"n": 11,
"stem": "A network forensic analyst notices unusual outbound traffic on port 443. Which of the following is the most likely event?",
"opts": [
"Normal HTTPS web browsing",
"Possible data exfiltration over HTTPS",
"DNS query",
"FTP file transfer"
]
},
{
"n": 12,
"stem": "Which cryptographic hash algorithm has a digest size of 256 and is the most commonly recommended today to verify the integrity?",
"opts": [
"SHA-256",
"AES-256",
"RSA",
"MD5"
]
},
{
"n": 13,
"stem": "Which of the following IP addresses cannot be routed on the internet?",
"opts": [
"172.16.10.5",
"8.8.8.8",
"192.0.2.1",
"203.0.113.5"
]
},
{
"n": 14,
"stem": "_________ is predominantly used to prevent layer 2 loops and broadcast storms, and is also used for network redundancy.",
"opts": [
"RIP",
"STP",
"OSPF",
"ARP"
]
},
{
"n": 15,
"stem": "Which command would help you identify each hop and measure the path the packets follow to the destination?",
"opts": [
"ping",
"tracert / traceroute",
"nslookup",
"ipconfig / ifconfig"
]
},
{
"n": 16,
"stem": "Which type of machine learning algorithm is used when the output labels are known during training?",
"opts": [
"Supervised Learning",
"Unsupervised Learning",
"Reinforcement Learning",
"Deep Learning"
]
},
{
"n": 17,
"stem": "A short, time-boxed period when a scrum team works to complete a set amount of work is called:",
"opts": [
"Waterfall Phase",
"Milestone",
"Sprint",
"Iteration Backlog"
]
},
{
"n": 18,
"stem": "The command deletes the data inside a table, but not the table itself",
"opts": [
"DELETE",
"DROP",
"REMOVE",
"TRUNCATE"
]
},
{
"n": 19,
"stem": "Which type of JOIN returns all records from the left table and matched records from the right table?",
"opts": [
"INNER JOIN",
"LEFT JOIN",
"RIGHT JOIN",
"FULL OUTER JOIN"
]
},
{
"n": 20,
"stem": "In a many-to-many relationship, what type of table is typically required?",
"opts": [
"Junction/bridge table",
"Mapping Table",
"Foreign table",
"Lookup table"
]
},
{
"n": 21,
"stem": "Which normal form eliminates transitive dependencies?",
"opts": [
"1NF",
"2NF",
"3NF",
"4NF"
]
},
{
"n": 22,
"stem": "Which PHP function is used to connect to a MySQL database with improved functionality, security, and performance?",
"opts": [
"mysql_connect()",
"connect_db()",
"db_connect()",
"mysqli_connect()"
]
},
{
"n": 23,
"stem": "What is the output of print(2 ** 3) in Python?",
"opts": [
"5",
"6",
"8",
"9"
]
},
{
"n": 24,
"stem": "Virtual memory is used to:",
"opts": [
"Increase RAM speed",
"Store CPU instructions",
"Manage cache memory",
"Allow larger memory space than physical RAM"
]
},
{
"n": 25,
"stem": "What is Docker primarily used for?",
"opts": [
"Version control",
"Containerization of applications",
"Continuous integration",
"Cloud hosting"
]
},
{
"n": 26,
"stem": "Which metric is commonly used to evaluate classification models?",
"opts": [
"Mean Squared Error (MSE)",
"R-squared (R²)",
"Accuracy",
"Adjusted R²"
]
},
{
"n": 27,
"stem": "A centralized repository that ingests, stores, and allows for processing of large volumes of data in its original form is called:",
"opts": [
"Data Lake",
"Data Ocean",
"Hadoop",
"Data warehouse"
]
},
{
"n": 28,
"stem": "What does SaaS stand for?",
"opts": [
"Storage as a Service",
"Software as a Service",
"Service as a Software",
"Security as a Service"
]
},
{
"n": 29,
"stem": "A graphical method to show the distribution and spread of numerical data using quartiles is called:",
"opts": [
"Box Plot",
"Pie Chart",
"Line Chart",
"Bar Graph"
]
},
{
"n": 30,
"stem": "Which Excel function is used to look up a value in a table?",
"opts": [
"SUM",
"COUNTIF",
"CONCAT",
"VLOOKUP"
]
},
{
"n": 31,
"stem": "Which type of analytics focuses on predicting future outcomes?",
"opts": [
"Descriptive",
"Diagnostic",
"Predictive",
"Prescriptive"
]
},
{
"n": 32,
"stem": "What is the primary function of a hypervisor?",
"opts": [
"To manage cloud resources",
"To provide security for cloud storage",
"To store user data",
"To create and manage virtual machines"
]
},
{
"n": 33,
"stem": "In IPv6, how is an address written to shorten consecutive zeroes?",
"opts": [
"Replace them with a hyphen (-)",
"Remove them completely",
"Replace them with double colon (::)",
"Replace them with three dots (…)"
]
},
{
"n": 34,
"stem": "What does GDPR stand for?",
"opts": [
"General Data Protection Regulation",
"Global Data Privacy Rules",
"Government Data Protection Rights",
"General Database Protection Requirements"
]
},
{
"n": 35,
"stem": "Which cyber attack involves overwhelming a server with requests?",
"opts": [
"Phishing",
"DDoS",
"Man-in-the-Middle",
"SQL Injection"
]
},
{
"n": 36,
"stem": "What does ACID compliance ensure in database systems?",
"opts": [
"Automatic backup",
"Network security",
"Data integrity and transaction reliability",
"Fast query execution"
]
},
{
"n": 37,
"stem": "In computer storage hierarchy, which of the following is the fastest?",
"opts": [
"Hard Disk Drive (HDD)",
"Cache Memory",
"Solid State Drive (SSD)",
"Random Access Memory (RAM)"
]
},
{
"n": 38,
"stem": "In agile development, what is a sprint?",
"opts": [
"Fast coding session",
"Emergency bug fix",
"Performance optimization phase",
"Time-boxed iteration of development work"
]
},
{
"n": 39,
"stem": "What is the maximum number of hosts possible in a /24 subnet?",
"opts": [
"254",
"255",
"256",
"252"
]
},
{
"n": 40,
"stem": "Which generation of CID was recently launched in Bhutan?",
"opts": [
"First",
"Second",
"Third",
"Fourth"
]
},
{
"n": 41,
"stem": "What does it mean for a website to be “responsive”?",
"opts": [
"The website loads faster than 2 seconds",
"The website layout adapts to different screen sizes",
"The website has interactive animations",
"The website uses HTTPS"
]
},
{
"n": 42,
"stem": "In the context of data privacy, what does anonymization mean?",
"opts": [
"Hiding user names",
"Removing personally identifiable information",
"Encrypting all data",
"Creating user accounts"
]
},
{
"n": 43,
"stem": "Which cloud deployment model provides services exclusively for one organization?",
"opts": [
"Private Cloud",
"Public Cloud",
"Community Cloud",
"Hybrid Cloud"
]
},
{
"n": 44,
"stem": "Which of the following is true about mobile banking security?",
"opts": [
"Users should enable strong passwords, OTPs, and biometric authentication",
"Users can share their PINs freely without risk",
"Bank apps do not require updates",
"Security is irrelevant if the device is personal"
]
},
{
"n": 45,
"stem": "Which combination is an example of multi-factor authentication?",
"opts": [
"Using only a fingerprint scan for login",
"Entering a password and then verifying via SMS OTP",
"Entering a password twice",
"Logging in from a recognized IP without any additional verification"
]
},
{
"n": 46,
"stem": "Which category best describes a drone in modern technology?",
"opts": [
"IoT-enabled robotics device",
"Mainframe server",
"SaaS application",
"Biometric authentication system"
]
},
{
"n": 47,
"stem": "What is the primary goal of Bhutan's National Digital Identity (NDI)?",
"opts": [
"To provide free internet access nationwide",
"To give citizens a secure, verifiable digital identity for accessing services",
"To replace physical passports for international travel",
"To create a cryptocurrency for Bhutan"
]
},
{
"n": 48,
"stem": "What is the core principle behind \"Self-Sovereign Identity\" (SSI)?",
"opts": [
"Governments issue digital identities that citizens control",
"Individuals control their identity data without relying on centralized authorities",
"Identity verification requires multiple government-approved documents",
"Digital identities are automatically synchronized across all platforms"
]
},
{
"n": 49,
"stem": "Git is primarily used for:",
"opts": [
"Cloud storage",
"Printing code manually",
"Local spreadsheets",
"Version control and collaborative coding"
]
},
{
"n": 50,
"stem": "A major benefit of IT systems in organizations is:",
"opts": [
"Automatic elimination of all human tasks",
"Guaranteed zero downtime without maintenance",
"Improved efficiency, accuracy, and decision-making",
"Offline-only operations"
]
},
{
"n": 51,
"stem": "Role-based access control is used for:",
"opts": [
"Authorization",
"Authentication",
"Password generation",
"Encryption"
]
},
{
"n": 52,
"stem": "In networking, latency refers to:",
"opts": [
"Delay in data transmission",
"Total bandwidth capacity",
"Number of connected devices",
"Encryption level"
]
},
{
"n": 53,
"stem": "Which SQL clause is used to filter rows after aggregation?",
"opts": [
"GROUP BY",
"HAVING",
"ORDER BY",
"WHERE"
]
},
{
"n": 54,
"stem": "Which Linux command displays the current working directory?",
"opts": [
"pwd",
"ls",
"cd",
"dir"
]
},
{
"n": 55,
"stem": "Which connector is most commonly used for modern monitors for digital video and audio output?",
"opts": [
"VGA",
"HDMI",
"PS/2",
"RJ-45"
]
},
{
"n": 56,
"stem": "Which HTTP status code indicates a resource was not found?",
"opts": [
"200",
"301",
"404",
"500"
]
},
{
"n": 57,
"stem": "VPN is primarily used for:",
"opts": [
"Internet browsing",
"Secure remote connection",
"File storage",
"Virus protection"
]
},
{
"n": 58,
"stem": "Which backup strategy involves saving only the changes made since the last full backup?",
"opts": [
"Incremental Backup",
"Differential Backup",
"Mirror Backup",
"Snapshot Backup"
]
},
{
"n": 59,
"stem": "What is the main purpose of antivirus software?",
"opts": [
"Encrypt files",
"Detect and remove malware",
"Optimize network speed",
"Backup data"
]
},
{
"n": 60,
"stem": "Normalization in databases is used to:",
"opts": [
"Reduce redundancy",
"Increase storage",
"Encrypt tables",
"Backup database"
]
},
{
"n": 61,
"stem": "Checking a fingerprint to unlock a phone is:",
"opts": [
"Authorization",
"Authentication",
"Access control",
"Encryption"
]
},
{
"n": 62,
"stem": "Which of the following is NOT an operating system?",
"opts": [
"Linux",
"Windows",
"Kubernetes",
"macOS"
]
},
{
"n": 63,
"stem": "Which of these is the correct JSON format?",
"opts": [
"{name: \"Dorji\"}",
"{\"name\": \"Dorji\"}",
"{'name': 'Dorji'}",
"[name: \"Dorji\"]"
]
},
{
"n": 64,
"stem": "In a DNS server, which record type maps a domain name to an IP address?",
"opts": [
"MX",
"CNAME",
"TXT",
"A"
]
},
{
"n": 65,
"stem": "In the TCP/IP model, which layer is responsible for end-to-end communication?",
"opts": [
"Network Layer",
"Transport Layer",
"Application Layer",
"Data Link Layer"
]
},
{
"n": 66,
"stem": "Foreign key constraint ensures:",
"opts": [
"Data integrity across tables",
"Faster queries",
"Encryption",
"Indexing"
]
},
{
"n": 67,
"stem": "What feature distinguishes Web 3.0 from Web 2.0?",
"opts": [
"User-generated content",
"Centralized control",
"Data ownership and decentralization",
"Static HTML pages"
]
},
{
"n": 68,
"stem": "Which of these statements is TRUE about social media and deepfakes?",
"opts": [
"Social media platforms cannot host deepfakes",
"Social media amplifies the reach and impact of deepfakes",
"Deepfakes disappear immediately from social media",
"Social media automatically verifies all content"
]
},
{
"n": 69,
"stem": "Compared to traditional servers, microservers generally have:",
"opts": [
"Accelerate scalability",
"Improve fault isolation",
"Quicker deployment time",
"Tight coupling between modules"
]
},
{
"n": 70,
"stem": "Pi, Bitcoin, and Hamster are examples of:",
"opts": [
"Online games",
"Cryptocurrencies / Digital currencies",
"Physical commodities",
"Bank accounts"
]
}
]"""

KEY = {
 1: ("a", "(7x + 5)/(5x + 5) = 9/7 gives x = 2.5, so Sonam is 5 × 2.5 = 12.5 years."),
 2: ("b", "Multiples of 4 (7) + of 6 (5) − of 12 (2) = 10; 10/30 = 1/3."),
 3: ("a", "C(8,3)C(5,2) + C(8,4)C(5,1) + C(8,5) = 560 + 350 + 56 = 966."),
 4: ("c", "<tr> defines a table row."),
 5: ("a", "TRACE echoes the received request for diagnostics."),
 6: ("d", "RAID 10 = mirroring + striping."),
 7: ("a", "rm -rf removes a directory recursively and forcefully."),
 8: ("b", "Ransomware encrypts files and demands payment."),
 9: ("c", "Post-incident reviews identify lessons and improve security."),
 10: ("c", "SFTP transfers files securely over SSH."),
 11: ("b", "Unusual outbound HTTPS traffic can indicate data exfiltration."),
 12: ("a", "SHA-256 produces a 256-bit digest; AES and RSA are encryption, MD5 is broken."),
 14: ("b", "Spanning Tree Protocol prevents layer-2 loops."),
 15: ("b", "tracert/traceroute shows each hop."),
 16: ("a", "Known labels: supervised learning."),
 17: ("c", "A sprint is a short time-boxed period in Scrum."),
 19: ("b", "LEFT JOIN keeps all rows from the left table."),
 20: ("a", "Many-to-many needs a junction (bridge) table."),
 21: ("c", "3NF removes transitive dependencies."),
 22: ("d", "mysqli_connect() (MySQL improved)."),
 23: ("c", "2 ** 3 = 8."),
 24: ("d", "Virtual memory lets programs use more memory than physical RAM."),
 25: ("b", "Docker packages applications in containers."),
 26: ("c", "Accuracy evaluates classification; MSE and R² are for regression."),
 27: ("a", "A data lake stores raw data in its original form."),
 28: ("b", "SaaS = Software as a Service."),
 29: ("a", "A box plot shows quartiles and spread."),
 30: ("d", "VLOOKUP looks up a value in a table."),
 31: ("c", "Predictive analytics forecasts outcomes."),
 32: ("d", "A hypervisor creates and runs virtual machines."),
 33: ("c", "Consecutive zero groups are written as ::."),
 34: ("a", "General Data Protection Regulation (EU)."),
 35: ("b", "DDoS floods a server with requests."),
 36: ("c", "ACID ensures reliable transactions and data integrity."),
 37: ("b", "Cache is the fastest of these."),
 38: ("d", "A sprint is a time-boxed iteration."),
 39: ("a", "2^8 − 2 = 254 usable hosts."),
 41: ("b", "Responsive layouts adapt to screen sizes."),
 42: ("b", "Anonymisation removes personally identifiable information."),
 43: ("a", "A private cloud serves one organisation."),
 44: ("a", "Strong passwords, OTPs and biometrics protect mobile banking."),
 45: ("b", "Password (something you know) + SMS OTP (something you have)."),
 46: ("a", "Drones are IoT-enabled robotic devices."),
 47: ("b", "NDI gives citizens a secure, verifiable digital identity."),
 48: ("b", "SSI: individuals control their identity data."),
 49: ("d", "Git is a version-control system."),
 50: ("c", "IT improves efficiency, accuracy and decisions."),
 51: ("a", "RBAC decides what users are allowed to do (authorisation)."),
 52: ("a", "Latency is delay."),
 53: ("b", "HAVING filters after GROUP BY aggregation."),
 54: ("a", "pwd prints the working directory."),
 55: ("b", "HDMI carries digital video and audio."),
 56: ("c", "404 Not Found."),
 57: ("b", "A VPN gives a secure remote connection."),
 58: ("b", "Differential backup saves changes since the last full backup."),
 59: ("b", "Antivirus detects and removes malware."),
 60: ("a", "Normalisation reduces redundancy."),
 61: ("b", "A fingerprint verifies identity: authentication."),
 62: ("c", "Kubernetes orchestrates containers; it is not an OS."),
 63: ("b", "JSON keys and strings use double quotes."),
 64: ("d", "An A record maps a name to an IPv4 address."),
 65: ("b", "The transport layer provides end-to-end communication."),
 66: ("a", "Foreign keys keep referential integrity."),
 67: ("c", "Web 3.0 emphasises decentralisation and data ownership."),
 68: ("b", "Social media spreads deepfakes widely."),
 70: ("b", "They are cryptocurrencies / digital currencies."),
}

NEW_MCQ = [
 ("Which of the following is a private IPv4 address (RFC 1918)?", ("8.8.8.8", "192.168.1.10", "1.1.1.1", "142.250.0.1"), "b", "192.168.0.0/16 is a private range."),
 ("Which SQL command removes a table together with its structure?", ("DELETE", "TRUNCATE", "DROP TABLE", "UPDATE"), "c", "DROP TABLE removes the table itself."),
 ("Which device forwards packets between different networks using IP addresses?", ("Hub", "Switch", "Router", "Repeater"), "c", "Routers work at the network layer."),
 ("In cloud computing, IaaS mainly provides", ("ready-to-use applications", "virtual machines, storage and networks", "only e-mail services", "programming tutorials"), "b", "Infrastructure as a Service provides computing infrastructure."),
]

SAQ = [
 dict(marks=6, stem="Explain the difference between continuous integration, continuous delivery and continuous deployment. (6 marks)",
      kp=[("Continuous integration: developers merge code often into a shared repository; each commit triggers automated build and tests", 2), ("Continuous delivery: CI plus automated release pipeline; code is always deployable but release to production needs manual approval", 2), ("Continuous deployment: every change that passes tests is released to production automatically, no manual step; example/diagram of the pipeline", 2)],
      model="Continuous integration (CI): developers merge small code changes into the shared repository several times a day; every merge automatically triggers a build and automated tests, so integration errors are found early. Continuous delivery (CD): extends CI so that every change that passes the pipeline is automatically prepared and tested in staging and is always ready to release; the actual release to production is a manual business decision (one click). Continuous deployment: goes one step further: every change that passes all automated tests is deployed to production automatically, with no human approval. So CI is about building and testing, continuous delivery keeps software releasable, and continuous deployment releases automatically."),
 dict(marks=5, stem="What is a chatbot? Give a few examples and discuss its advantages and disadvantages. (5 marks)",
      kp=[("Definition: software that simulates conversation with users through text or voice, rule-based or AI/NLP-based", 1), ("Examples: ChatGPT, Siri, Alexa, bank / telecom customer-service bots", 1), ("Advantages: 24/7 service, instant replies, handles many users, lower cost, consistent answers", 1.5), ("Disadvantages: limited understanding, wrong or made-up answers, no empathy, privacy/security risks, job loss", 1.5)],
      model="A chatbot is a computer program that conducts a conversation with people through text or voice, either following fixed rules or using artificial intelligence and natural language processing. Examples: ChatGPT and Gemini, voice assistants like Siri and Alexa, and customer-service bots on bank, telecom and airline websites. Advantages: available 24/7; instant answers; can serve many users at once; reduces staff costs; gives consistent information. Disadvantages: may misunderstand complex or local-language questions; can give wrong or invented answers; lacks human empathy; raises privacy and data-security concerns; may replace some jobs."),
 dict(marks=5, stem="Explain the key role of /etc/passwd and /etc/shadow and cron jobs in Linux. (5 marks)",
      kp=[("/etc/passwd: world-readable list of user accounts - username, UID, GID, home directory, login shell (password field 'x')", 2), ("/etc/shadow: readable only by root; stores hashed passwords and password-ageing/expiry information", 1.5), ("cron jobs: scheduled tasks run automatically by the cron daemon at set times (crontab: minute hour day month weekday command), e.g. backups, log rotation", 1.5)],
      model="/etc/passwd contains one line per user account with the username, a placeholder 'x' for the password, user ID, group ID, comment, home directory and login shell; it is readable by all users because many programs need it. /etc/shadow stores the encrypted (hashed) passwords and password-ageing details such as last change and expiry; it is readable only by root, which protects the hashes from attackers. Cron jobs are tasks scheduled with the cron daemon; each crontab line gives minute, hour, day of month, month, day of week and the command (e.g. '0 2 * * * /backup.sh' runs a backup at 2 a.m. daily). They automate routine work such as backups, updates and log cleanup."),
 dict(marks=6, stem="A company tracks employee attendance using daily login hours. Write a program to count the number of employees who worked more than 8 hours in a day using any programming language. (6 marks)",
      kp=[("Input/representation of hours (list, file or user input)", 1.5), ("Loop over employees and compare with > 8 (strictly greater)", 2), ("Counter variable correctly incremented", 1.5), ("Output the count; correct syntax", 1)],
      model="""Python:
hours = [7.5, 9, 8, 10, 6.5, 8.5]      # login hours of each employee for the day
count = 0
for h in hours:
    if h > 8:
        count += 1
print("Employees who worked more than 8 hours:", count)   # prints 3

(Reading from input instead: n = int(input()); hours = [float(input()) for _ in range(n)].)"""),
 dict(marks=3, stem="You have just joined the office and you receive an email claiming to be from IT asking for your password to be entered in a shared link to resolve an urgent issue. Describe how you would identify whether it is a phishing email and prevent risks. (3 marks)",
      kp=[("Warning signs: asks for password (IT never does), urgency/threat, suspicious sender address or link (hover to check domain), spelling errors", 1.5), ("Do not click or reply; verify with IT through a known phone/channel; report to IT/security and delete", 1), ("Prevention: MFA, change password if entered, security awareness training, spam filters", 0.5)],
      model="Signs of phishing: genuine IT staff never ask for your password; the message creates false urgency; the sender's address or the link's real domain (seen by hovering) does not match the organisation; there may be spelling mistakes or a generic greeting. Response: do not click the link or reply; check with the IT department using a known phone number or in person; report the e-mail to IT/security and delete it. Prevention: use multi-factor authentication, change the password immediately if it was entered, keep spam filters on and attend security-awareness training."),
 dict(marks=5, stem="A company with a large open-office setup has deployed several Wi-Fi access points (APs). Employees complain that their Wi-Fi connections drop randomly, especially in high-density areas. Wired connections work perfectly. As the network administrator, identify possible causes and describe five systematic steps you would take to monitor and troubleshoot the Wi-Fi instability. (5 marks)",
      kp=[("Step 1: gather information - when, where, which devices; check AP/controller logs and client counts", 1), ("Step 2: wireless site survey / spectrum analysis for interference and channel overlap (2.4 GHz channels 1, 6, 11; use 5 GHz)", 1), ("Step 3: check AP capacity/load and placement; add APs or enable band steering and load balancing in dense areas", 1), ("Step 4: check power levels, roaming settings, DHCP lease/IP exhaustion and authentication (RADIUS) issues", 1), ("Step 5: update AP firmware/client drivers, apply changes, then monitor and document results", 1)],
      model="Possible causes: too many clients per access point, channel overlap and interference (neighbouring APs, microwaves, Bluetooth), poor AP placement or power settings, roaming problems, DHCP address exhaustion, or outdated firmware. Steps: 1. Collect information: which users, devices, places and times are affected; review AP/controller logs and client counts. 2. Perform a wireless site survey and spectrum analysis to find weak signal, interference and co-channel overlap; assign non-overlapping channels (1, 6, 11 on 2.4 GHz) and move clients to 5 GHz. 3. Check load on each AP; in dense areas add APs, enable band steering and client load balancing, and reposition APs. 4. Check transmit power and roaming thresholds, DHCP scope size and lease time, and authentication (RADIUS/WPA2-Enterprise) logs. 5. Update AP firmware and client drivers, apply the changes one at a time, then monitor performance and document the fix."),
]

Q = build_q(MCQ, KEY, TOPIC, NEW_MCQ, SAQ)
