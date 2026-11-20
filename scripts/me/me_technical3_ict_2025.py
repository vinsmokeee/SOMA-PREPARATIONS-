"""ME Technical Paper III (Subject Specialisation Paper), ICT, BCSE 2025 - real paper (PDF sent by the founder).
Own pattern: Part II has 6 short answers of different marks (5+3+2+2+5+3 = 20), loaded as one 20-mark group; Section B
choose Case I or II (50). MCQ 9 (DNS: the 'correct' option is reversed) is replaced by a new MCQ; MCQ 12 option a gets
rel="stylesheet" so it is actually correct. Network and ER diagrams are drawn and uploaded as photos.
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, ICT): BCSE 2025, batch 1"
GROUP_TAG = "ict2025"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "ict"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "ICT"

MCQ = r"""[
{
"n": 1,
"stem": "Which of the following is the fastest type of memory?",
"opts": [
"Hard Disk",
"RAM",
"Cache",
"SSD"
]
},
{
"n": 2,
"stem": "You are designing a search feature for a large e-commerce platform. The search must handle millions of queries per day with low latency. Which data structure or approach is MOST efficient for prefix searches (e.g., autocomplete)?",
"opts": [
"Linked List",
"Hash Table",
"Trie",
"Stack"
]
},
{
"n": 3,
"stem": "You need to find the shortest path between nodes in a graph representing a city map with weighted edges. Which algorithm is MOST appropriate if weights are all non-negative?",
"opts": [
"Depth-First Search (DFS)",
"Dijkstra’s Algorithm",
"Prim’s Algorithm",
"BFS"
]
},
{
"n": 4,
"stem": "Which of these is an example of open-source software?",
"opts": [
"Microsoft Word",
"Google Chrome",
"Apache HTTP Server",
"Adobe Photoshop"
]
},
{
"n": 5,
"stem": "What is it called when IP address conversion is done when going to the internet over the local network?",
"opts": [
"Exchange",
"NAT",
"PAT",
"DHCP"
]
},
{
"n": 6,
"stem": "What is the tool used to distribute the traffic to the servers evenly?",
"opts": [
"Email Security Gateway",
"EDR",
"IDS",
"Load Balancer"
]
},
{
"n": 7,
"stem": "What is the network technology that provides a safe connection to a distant network?",
"opts": [
"Dynamic Host Configuration Protocol (DHCP)",
"Application Layer",
"Virtual Private Network (VPN)",
"Wireless LAN (WLAN)"
]
},
{
"n": 8,
"stem": "According to the OSI Reference model, in which layer are the “ATM, Token Ring, Frame Relay, and Ethernet” protocols located?",
"opts": [
"Application Layer",
"Datalink Layer",
"Transport Layer",
"Session Layer"
]
},
{
"n": 9,
"stem": "What is the primary function of DNS (Domain Name System)?",
"opts": [
"Convert IP addresses to domain names",
"Secure data transmission over the network",
"Assign IP addresses dynamically",
"Route packets across networks"
]
},
{
"n": 10,
"stem": "In Python, what does the following code do? def func(lst): return sum(lst) / len(lst) print(func([1, 2, 3, 4, 5]))",
"opts": [
"Returns the sum of the list",
"Returns the average of the list",
"Returns the median of the list",
"Returns the product of the list"
]
},
{
"n": 11,
"stem": "Suppose each hydropower project generates revenue (in Nu. million) and the following program has been written to aid analysis. What does the program print? #include <iostream> using namespace std; int main() { int revenue[5] = {500, 700, 800}; // Tala, Chukha, Mangdechhu int total = 0; for (int i = 0; i < 5; i++) total += revenue[i]; cout << total; return 0; }",
"opts": [
"0",
"2000",
"Garbage value",
"Compilation Error"
]
},
{
"n": 12,
"stem": "How can you include an external CSS file in an HTML document?",
"opts": [
"<link href=\"styles.css\">",
"<style src=\"styles.css\">",
"<css src=\"styles.css\">",
"<script src=\"styles.css\">"
]
},
{
"n": 13,
"stem": "What file contains user account information in most Linux systems?",
"opts": [
"/etc/shadow",
"/etc/users",
"/etc/passwd",
"/home/users"
]
},
{
"n": 14,
"stem": "You want to monitor a growing log file in real-time, showing only the last 50 lines and updating continuously. Which command is BEST?",
"opts": [
"cat /var/log/syslog",
"tail -n 50 -f /var/log/syslog",
"head -n 50 /var/log/syslog",
"grep ERROR /var/log/syslog"
]
},
{
"n": 15,
"stem": "A system admin notices that a particular process is consuming 95% of CPU constantly. Which command combination is BEST to identify and handle the problem?",
"opts": [
"ps aux | grep <process> and kill -9 <pid>",
"ls -l /var/log only",
"top or htop then kill or renice",
"chmod 777 on the binary"
]
},
{
"n": 16,
"stem": "How do you search for a pattern in a file using the terminal?",
"opts": [
"find",
"grep",
"locate",
"Search"
]
},
{
"n": 17,
"stem": "What is the main advantage of PaaS over IaaS?",
"opts": [
"More storage",
"Full control of OS",
"Abstracts infrastructure management",
"Cheaper data centers"
]
},
{
"n": 18,
"stem": "Your company runs a web app with unpredictable traffic spikes. Which cloud feature is MOST useful to handle sudden demand automatically?",
"opts": [
"Multi-tenancy",
"Elasticity",
"Virtualization",
"High Availability"
]
},
{
"n": 19,
"stem": "A cloud customer configures security groups incorrectly, causing a breach. Whose responsibility is this under the Shared Responsibility Model?",
"opts": [
"Cloud provider",
"Both provider and customer",
"Customer",
"Third-party vendor"
]
},
{
"n": 20,
"stem": "What is the key difference between a container and a VM?",
"opts": [
"VMs are lighter",
"Containers include full OS",
"Containers share the host kernel",
"Containers are slower"
]
},
{
"n": 21,
"stem": "Which SQL command is used to remove a table completely?",
"opts": [
"DELETE",
"DROP",
"REMOVE",
"ERASE"
]
},
{
"n": 22,
"stem": "You are tasked with running analytics on structured + semi-structured + unstructured data. Which is MOST suitable?",
"opts": [
"RDBMS",
"Data Warehouse",
"Data Lake",
"Cache DB"
]
},
{
"n": 23,
"stem": "Which of the following is a characteristic of Big Data’s 5Vs?",
"opts": [
"Velocity",
"Virtualization",
"Visualization",
"Versioning"
]
},
{
"n": 24,
"stem": "Which is NOT an example of AI chatbots?",
"opts": [
"ChatGPT",
"Google Bard",
"Cloud",
"Claude"
]
},
{
"n": 25,
"stem": "The role of a Certificate Authority (CA) is to",
"opts": [
"Encrypt all internet traffic",
"Issue and verify digital certificates",
"Generate public/private key pairs",
"Block insecure websites"
]
},
{
"n": 26,
"stem": "Which key does Bob use to decrypt Alice’s message encrypted with his public key?",
"opts": [
"Alice’s public key",
"Alice’s private key",
"Bob’s public key",
"Bob’s private key"
]
},
{
"n": 27,
"stem": "After the secure session is established in HTTPS, data is transmitted using",
"opts": [
"Public key encryption",
"Symmetric key encryption",
"Digital signatures only",
"Hashing only"
]
},
{
"n": 28,
"stem": "What is the name given to the output produced by the functions used for integrity check?",
"opts": [
"Public Key",
"Collision",
"Hash",
"Verification Number"
]
},
{
"n": 29,
"stem": "A public API endpoint allows search queries. You discover that an attacker can inject SQL commands through query parameters. What is the MOST appropriate fix?",
"opts": [
"Validate and sanitize input; use parameterized queries",
"Add API keys",
"Enable Cross-Origin Resource Sharing",
"Increase server CPU"
]
},
{
"n": 30,
"stem": "Which of the following is safer than the others?",
"opts": [
"SSL 3.0",
"TLS 1.3",
"TLS 1.0",
"SSL 2.0"
]
}
]"""

KEY = {
    1: ("c", "Cache memory is the fastest (after CPU registers)."), 2: ("c", "A trie gives fast prefix lookups for autocomplete."),
    3: ("b", "Dijkstra's algorithm finds shortest paths with non-negative weights."), 4: ("c", "Apache HTTP Server is open source."),
    5: ("b", "NAT translates private addresses to public ones."), 6: ("d", "A load balancer spreads traffic across servers."),
    7: ("c", "A VPN gives an encrypted connection to a remote network."), 8: ("b", "Ethernet, Token Ring, Frame Relay and ATM work at the data link layer."),
    10: ("b", "sum/len returns the average (3.0)."), 11: ("b", "Unlisted array elements are zero-initialised, so the total is 500 + 700 + 800 = 2000."),
    12: ("a", "<link rel=\"stylesheet\" href=\"...\"> includes an external CSS file."), 13: ("c", "/etc/passwd holds user account information (passwords hashes are in /etc/shadow)."),
    14: ("b", "tail -n 50 -f shows the last 50 lines and follows new lines."), 15: ("c", "top/htop identifies the process; then kill or renice it."),
    16: ("b", "grep searches for a pattern in a file."), 17: ("c", "PaaS abstracts infrastructure management."),
    18: ("b", "Elasticity scales resources automatically with demand."), 19: ("c", "Security group configuration is the customer's responsibility."),
    20: ("c", "Containers share the host kernel; VMs run a full guest OS."), 21: ("b", "DROP TABLE removes the table completely."),
    22: ("c", "A data lake stores structured, semi-structured and unstructured data."), 23: ("a", "Velocity is one of the 5 Vs (volume, velocity, variety, veracity, value)."),
    24: ("c", "'Cloud' is not a chatbot."), 25: ("b", "A CA issues and verifies digital certificates."),
    26: ("d", "Bob decrypts with his private key."), 27: ("b", "After the handshake HTTPS uses symmetric encryption."),
    28: ("c", "Integrity functions produce a hash (digest)."), 29: ("a", "Validate input and use parameterised queries to stop SQL injection."),
    30: ("b", "TLS 1.3 is the most secure."),
}
FIX = {12: {"opts": ['<link rel="stylesheet" href="styles.css">', '<style src="styles.css">', '<css src="styles.css">', '<script src="styles.css">']}}
T = TOPIC
Q = mcqs(MCQ, KEY, T, FIX) + [
    new_mcq(1, T, "What is the primary function of DNS (Domain Name System)?", ["Translate domain names into IP addresses", "Encrypt data sent over the network", "Assign IP addresses dynamically", "Route packets between networks"], "a",
            "DNS resolves names such as www.gov.bt to IP addresses; DHCP assigns addresses and routers route packets."),
]
SA = [
    ("""You are given a list of integers representing scores in a game, e.g. nums = [3, 1, 1, 4, -20, 0]. Write a program in the language of your choice to find the maximum score without using built-in max() or sorting. Explain how your code would behave if the list is empty, contains duplicates or contains all negative numbers.""", 5,
     [("Correct loop initialising with first element and comparing", 3), ("Edge cases: empty handled (None/error), duplicates fine, all negative works because not initialised to 0", 2)],
     """def find_max(nums):
    if not nums:
        return None          # or raise ValueError("empty list")
    best = nums[0]
    for x in nums[1:]:
        if x > best:
            best = x
    return best

print(find_max([3, 1, 1, 4, -20, 0]))   # 4
Behaviour: empty list - returns None (or raises an error) instead of crashing on nums[0]; duplicates - no problem, the maximum value is returned once (e.g. [4, 4] gives 4); all negative - works correctly (e.g. [-5, -2, -9] gives -2) because best starts from the first element, not from 0. Time O(n), space O(1)."""),
    ("Your organisation's computers are frequently targeted by malware. Suggest three key measures to prevent malware infections. Explain briefly why each measure is important.", 3,
     [("Three measures with reasons (1 each): patching/updates, antivirus/EDR, user awareness/phishing training, email/web filtering, least privilege, backups", 3)],
     "1. Keep operating systems and software patched and updated - closes known vulnerabilities that malware exploits. 2. Install and update antivirus/endpoint detection and response (EDR) with email and web filtering - detects and blocks malicious files and links. 3. Train users on phishing and safe practices, and give least-privilege (non-admin) accounts - most malware arrives through users clicking links or attachments, and limited rights reduce the damage. (Also: firewall, application whitelisting, disabling macros/USB autorun, regular offline backups.)"),
    ("""Your company has an Employee table as shown below. Write an SQL query to count the number of employees in each department.
emp_id | name | dept | salary
101 | Alice | HR | 5000
102 | Bob | IT | 6000
103 | Charlie | HR | 5500
104 | David | IT | 6200
105 | Eva | Sales | 4500""", 2,
     [("SELECT dept, COUNT(*) ... GROUP BY dept", 2)],
     "SELECT dept, COUNT(*) AS num_employees\nFROM Employee\nGROUP BY dept;\nResult: HR 2, IT 2, Sales 1."),
    ("Explain machine learning and differentiate supervised and unsupervised learning.", 2,
     [("ML definition: systems learn patterns from data to make predictions without explicit programming", 1), ("Supervised uses labelled data (classification/regression); unsupervised unlabelled (clustering)", 1)],
     "Machine learning is a branch of AI in which computers learn patterns from data and improve at a task (predictions, decisions) without being explicitly programmed with rules. Supervised learning trains on labelled data (input with known output) to predict labels, e.g. spam vs not-spam classification, house price regression. Unsupervised learning uses unlabelled data to find hidden structure, e.g. clustering customers into groups, anomaly detection."),
    ("""You have joined a government office that has 200 devices including PCs, mobiles, printers and laptops, and the number is expected to grow. The subnet is 192.168.1.0/24.
(i) Can all devices be assigned IPs in this subnet?
(ii) Should you keep it this way?
(iii) If not, propose a better solution with justification.""", 5,
     [("(i) Yes: /24 has 254 usable addresses ≥ 200", 1), ("(ii) No: little room for growth (54), one large broadcast domain, mixed device types, security", 1.5), ("(iii) Better: segment into VLANs/subnets per device type or department (e.g. /25 or /26 each) or larger range e.g. /23 or 10.x; DHCP; justify growth, performance, security", 2.5)],
     """(i) Yes. A /24 has 2^8 - 2 = 254 usable host addresses (192.168.1.1-192.168.1.254), which is more than 200.
(ii) It is not advisable to keep it this way: only 54 spare addresses remain for growth, all devices share one large broadcast domain (more broadcast traffic), and PCs, guest mobiles and printers are mixed with no separation, which is a security risk.
(iii) Use a larger private range and segment it with VLANs and subnets, e.g. 10.10.0.0/16 or 192.168.0.0/22, divided into: staff PCs/laptops 192.168.0.0/24, Wi-Fi mobiles 192.168.1.0/24, printers and IoT 192.168.2.0/26, servers/management 192.168.2.64/27, with inter-VLAN routing and firewall rules, and DHCP with reservations for printers. Justification: room for growth, smaller broadcast domains for better performance, and access control between groups for security and easier management."""),
    ("A company installs smart sensors to monitor energy usage and adjust lighting automatically. What technology is being used here? Explain the technology.", 3,
     [("Internet of Things (IoT) (smart building automation)", 1), ("Explanation: sensors, connectivity, gateway/cloud processing, actuators, automation/analytics; benefits", 2)],
     "This is the Internet of Things (IoT), used for smart building/energy management. IoT connects physical devices - sensors (occupancy, light level, energy meters) and actuators (smart switches, dimmers) - to a network (Wi-Fi, Zigbee, LoRaWAN) and a gateway or cloud platform. Data are collected and analysed in real time, rules or AI decide actions (e.g. dim lights when daylight is enough or switch off when a room is empty), and actuators carry them out automatically, with dashboards for monitoring. Benefits: energy savings, lower costs and remote control; risks include security and privacy."),
]
for i, (s, mk, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=mk, topic=T, group="me-technical-3-ict2025-part2", pos=i + 1,
                  stem=f"Part II, question {i + 1}. {s} ({mk} marks)", key_points=kp, model=mod))
C1 = """Case I: Network for a new government branch office
You are hired as a network engineer for the Department of Public Records (DPR), a fictional government agency, which is setting up a new branch office in Gelephu Mindfulness City. The office provides services such as document verification, digital ID issuance and public record access. You are required to build and operate a secure, scalable and resilient network infrastructure."""
C2 = """Case II: Hospital Management System for the National Referral Hospital
The National Referral Hospital (NRH) is the largest healthcare institution in the country, providing comprehensive medical services including emergency care, specialised treatments, surgical procedures and outpatient services. It serves patients from across the nation and operates 24/7 with departments including Emergency, Surgery, Paediatrics, Cardiology, Oncology, Radiology and Laboratory Services.
To improve operational efficiency and patient care, NRH wants to implement a Hospital Management System (HMS). The HMS should capture:
- Patient information: Patient ID, Name, Age, Gender, Contact Number, Emergency Contact, Address (Village, Gewog, Dzongkhag), Blood Group, Medical History, Registration Date, Status (Active/Discharged/Deceased)
- Appointment information: Appointment ID, Date, Time, Type (Consultation/Follow-up/Emergency), Status (Scheduled/Completed/Cancelled), Remarks
- Medical procedure information: Procedure ID, Procedure Type (Surgery/Diagnostic/Therapeutic), Name, Date, Duration, Cost, Equipment Used, Outcome, Complications (if any)
- Staff information: Staff ID, Name, Specialisation, Department, Shift Timings, Contact Details, Qualification, Experience, Employment Status (Active/On Leave/Terminated)
Note: this data is a baseline. You may add attributes or tables if required to model the HMS database accurately."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("ict2025", 1, T, C1, items=[
    it("""1. Network design: draw a simple network diagram for the DPR branch office. Label the main components and briefly explain each component's role. Keep in mind:
(i) There are two types of users (staff and citizens).
(ii) There are two departments (IT and Service Centre).
(iii) There are on-premises servers.""", 15,
       [("Diagram with ISP/internet, edge router, firewall, core/L3 switch, access switches, wireless APs, server zone/DMZ", 5), ("Segmentation: separate VLANs for IT, Service Centre, citizen Wi-Fi/guest, servers; citizens isolated from internal", 5), ("Roles explained for each component; redundancy (dual ISP/links), WLAN controller, NAC", 5)],
       "Diagram (top to bottom): ISP links (preferably two for redundancy) → edge router → next-generation firewall (with VPN) → core Layer-3 switch → access switches and wireless access points. Server zone (on-premises servers: records database, web/application, AD/DNS/DHCP) connected to the firewall/core in its own VLAN (public-facing services in a DMZ). VLANs: IT department, Service Centre staff, citizen access (guest Wi-Fi/kiosks, isolated and internet-only or limited to public services), servers, management. Roles: router - connects to ISP and routes traffic, NAT; firewall - filters traffic between zones and internet, IPS, VPN; core switch - inter-VLAN routing, high-speed backbone; access switches - connect end devices with PoE, port security; access points/WLAN controller - staff and guest SSIDs; servers - host services, with backups; network management/monitoring server and UPS for power."),
    it("""2. IPv4 subnetting design for the branch office, which has:
(i) the IT department with 10 devices
(ii) the Service Centre with 100 devices
(iii) up to 240 citizens accessing the services at the same time
(iv) 3 on-premises servers.
Present your answer in a table: subnet, subnet mask, network address, broadcast address, usable IP range and number of usable IPs per subnet. Consider scalability for future growth.""", 10,
       [("Correct VLSM sizing with growth (e.g. citizens /23 or /24, service /24 or /25, IT /27 or /28, servers /28 or /29)", 4), ("Correct mask, network, broadcast, ranges and counts in table", 5), ("Non-overlapping, scalability justified", 1)],
       """Using private block 10.10.0.0/22 with VLSM, largest first and room for growth:
Citizens | /23, 255.255.254.0 | network 10.10.0.0 | broadcast 10.10.1.255 | usable 10.10.0.1 - 10.10.1.254 | 510
Service Centre | /24, 255.255.255.0 | 10.10.2.0 | 10.10.2.255 | 10.10.2.1 - 10.10.2.254 | 254
IT department | /27, 255.255.255.224 | 10.10.3.0 | 10.10.3.31 | 10.10.3.1 - 10.10.3.30 | 30
Servers | /28, 255.255.255.240 | 10.10.3.32 | 10.10.3.47 | 10.10.3.33 - 10.10.3.46 | 14
Remaining 10.10.3.48 - 10.10.3.255 is kept for management, future departments and growth. Each subnet is larger than today's need (240 → 510, 100 → 254, 10 → 30, 3 → 14), so devices can be added without renumbering. (A minimum-size answer - /24, /25, /28, /29 - is acceptable if growth is discussed.)"""),
    it("""3. Network performance issue: after a few days of operation, staff in the Service Centre report slow internet speeds.
(i) What tools and methods would you use to identify the root cause of this performance issue? (5 marks)
(ii) How would you optimise the network to improve speed and reliability? (5 marks)""", 10,
       [("(i) Tools: ping/traceroute, speed tests, SNMP monitoring (PRTG/Zabbix), NetFlow/top talkers, Wireshark, interface errors, Wi-Fi analyser; layered approach", 5), ("(ii) Optimisation: QoS, bandwidth upgrade/load balancing, block/limit non-business use, separate citizen traffic, fix duplex/cabling, caching, Wi-Fi channel planning", 5)],
       "(i) Work through the layers: check whether the problem is in one department, all users or the ISP link. Use ping and traceroute to find latency/loss; speed tests at different points; SNMP monitoring of link utilisation, CPU and interface errors on router, firewall and switches; NetFlow/sFlow to find top talkers and applications (e.g. citizen Wi-Fi or video streaming consuming bandwidth); Wireshark packet capture for retransmissions, broadcast storms or DNS delays; Wi-Fi analyser for interference; check duplex mismatches, faulty cables and firewall logs. (ii) Apply QoS to prioritise service applications; rate-limit the citizen VLAN; block non-business traffic; upgrade bandwidth or add a second ISP with load balancing/failover; fix faulty cabling and duplex; optimise Wi-Fi (channels, power, more APs); use local DNS caching/proxy; keep firmware updated and monitor continuously."),
    it("""4. Remote server management: a system administrator needs to remotely manage both Windows and Unix servers from home. The servers must remain secure while allowing full access for administrative tasks. Propose a solution, with an explanation, for each condition:
(i) The administrator must securely connect to the office network from home, with all traffic encrypted.
(ii) For Windows servers, the administrator needs remote access to the graphical interface.
(iii) For Unix servers, the administrator needs to manage the system via the command line.
(iv) Ensure the person connecting really is the authorised administrator, even if the password is stolen.
(v) Restrict which network traffic can reach the servers, minimising exposure to attacks.""", 10,
       [("(i) VPN (IPsec/SSL, WireGuard) to firewall", 2), ("(ii) RDP over VPN with NLA (or bastion/RD Gateway)", 2), ("(iii) SSH with key-based authentication, root login disabled", 2), ("(iv) Multi-factor authentication", 2), ("(v) Firewall rules/ACLs allowing only VPN admin subnet to RDP/SSH ports, jump host, no direct internet exposure", 2)],
       "(i) Site-to-client VPN (SSL VPN, IPsec or WireGuard) terminating on the office firewall, so all traffic between home and office is encrypted. (ii) Remote Desktop Protocol (RDP) over the VPN (or through an RD Gateway/jump server) with Network Level Authentication - gives the Windows graphical desktop. (iii) SSH (Secure Shell) over the VPN with key-based authentication, root login and password login disabled - encrypted command-line access. (iv) Multi-factor authentication (password plus OTP app or hardware token/certificate) on the VPN and jump host, so a stolen password alone is not enough. (v) Firewall rules/ACLs that allow RDP (3389) and SSH (22) only from the VPN admin address pool or a bastion host, block them from the internet, keep servers in a separate VLAN, and log/monitor all sessions."),
    it("5. Centralised network management with SDN: after a year, DPR plans to centralise the management of all branch office networks. You propose SDN. Explain to management what Software-Defined Networking (SDN) is and its benefits in streamlining network management across multiple branch offices.", 5,
       [("SDN: separates control plane from data plane; centralised software controller programs devices via APIs (OpenFlow); SD-WAN for branches", 2), ("Benefits: central policy/config, automation, faster deployment, visibility, consistent security, cost/agility, traffic optimisation", 3)],
       "Software-Defined Networking separates the control plane (decisions about where traffic goes) from the data plane (the switches and routers forwarding packets). A central software controller holds the network-wide view and programs all devices through open interfaces (e.g. OpenFlow, APIs); for branch offices this is often SD-WAN. Benefits: one central place to configure and monitor all branches; policies (security, QoS) applied consistently everywhere; automation and zero-touch provisioning of new branches, reducing errors and travel; faster changes and troubleshooting with full visibility; intelligent use of multiple links (internet, MPLS) and lower costs."),
])
Q += case("ict2025", 2, T, C2, items=[
    it("""1. Entity-relationship model
(i) Identify the entities, their attributes and relationships for the HMS database. (3 marks)
(ii) Explain the difference between a composite key and a candidate key. (2 marks)
(iii) Develop an ER model illustrating the relationships, cardinalities and constraints. (5 marks)""", 10,
       [("(i) Entities Patient, Appointment, Procedure, Staff, Department (+ others) with attributes and relationships", 3), ("(ii) Composite key: key made of two or more attributes; candidate key: minimal attribute set uniquely identifying a row, one chosen as primary", 2), ("(iii) ER diagram: Patient 1-M Appointment, Staff 1-M Appointment, Patient 1-M Procedure, Staff M-N Procedure, Department 1-M Staff; PK/FK, NOT NULL, CHECK constraints", 5)],
       """(i) Entities: Patient (PatientID PK, Name, Age/DOB, Gender, Contact, EmergencyContact, Village, Gewog, Dzongkhag, BloodGroup, MedicalHistory, RegistrationDate, Status); Appointment (AppointmentID PK, Date, Time, Type, Status, Remarks, PatientID FK, StaffID FK); Procedure (ProcedureID PK, Type, Name, Date, Duration, Cost, Outcome, Complications, PatientID FK); Staff (StaffID PK, Name, Specialisation, DepartmentID FK, Shift, Contact, Qualification, Experience, EmploymentStatus); Department (DepartmentID PK, Name); Equipment (EquipmentID, Name) and a link table Procedure_Staff and Procedure_Equipment. Relationships: a patient has many appointments and procedures; a staff member attends many appointments; a department has many staff; procedures involve many staff and equipment.
(ii) A candidate key is any minimal set of attributes that uniquely identifies a row (e.g. StaffID, or CID number); one candidate key is chosen as the primary key. A composite key is a key made of two or more attributes together, e.g. (ProcedureID, StaffID) in Procedure_Staff. A composite key can be a candidate key if it is minimal.
(iii) ER model: Patient 1 - N Appointment; Staff 1 - N Appointment; Patient 1 - N Procedure; Procedure M - N Staff (via Procedure_Staff with Role); Procedure M - N Equipment; Department 1 - N Staff. Constraints: PKs unique and not null; FKs enforce referential integrity; CHECK on Status, Type, Gender, Cost ≥ 0; total participation of Appointment in Patient (each appointment must have a patient)."""),
    it("""2. Normalisation
(i) Differentiate between 1NF, 2NF and 3NF with examples. (3 marks)
(ii) Normalise the following table into 3NF. List the steps and the final tables. (5 marks)
AppointmentID | PatientName | PatientContact | StaffName | StaffDepartment | Date | Time | Type""", 8,
       [("(i) 1NF atomic values no repeating groups; 2NF no partial dependency on composite key; 3NF no transitive dependency - with examples", 3), ("(ii) Identify transitive dependencies AppointmentID → PatientID → contact, StaffID → department; introduce IDs", 2), ("Final tables: Patient(PatientID, Name, Contact), Department, Staff(StaffID, Name, DeptID), Appointment(AppointmentID, PatientID, StaffID, Date, Time, Type)", 3)],
       """(i) 1NF: every column holds atomic values and there are no repeating groups (e.g. not 'Phone: 17xx, 77xx' in one cell). 2NF: in 1NF and every non-key attribute depends on the whole primary key, not part of a composite key (e.g. in (PatientID, ProcedureID) → PatientName, PatientName depends only on PatientID, so move it out). 3NF: in 2NF and no transitive dependency - non-key attributes depend only on the key (e.g. StaffID → DepartmentID → DepartmentName; move department details to their own table).
(ii) Step 1 (1NF): the table already has atomic values with key AppointmentID. Step 2 (2NF): single-column key, so no partial dependencies, but patient and staff details repeat. Step 3 (3NF): remove transitive dependencies AppointmentID → Patient → PatientContact and AppointmentID → Staff → StaffDepartment by giving patients and staff their own IDs. Final tables: Patient(PatientID PK, PatientName, PatientContact); Department(DepartmentID PK, DepartmentName); Staff(StaffID PK, StaffName, DepartmentID FK); Appointment(AppointmentID PK, PatientID FK, StaffID FK, Date, Time, Type)."""),
    it("""3. Write SQL for the following (2 marks each):
(i) Register a new patient.
(ii) Schedule an appointment.
(iii) Update the contact number of an existing patient.
(iv) Fetch all surgical procedures performed in the last 30 days.
(v) List all staff members on leave in the Surgery department.""", 10,
       [("(i) INSERT INTO Patient ...", 2), ("(ii) INSERT INTO Appointment ...", 2), ("(iii) UPDATE Patient SET ... WHERE PatientID", 2), ("(iv) SELECT ... WHERE Type='Surgery' AND date >= current date - 30", 2), ("(v) SELECT staff JOIN department WHERE status 'On Leave' AND department 'Surgery'", 2)],
       """(i) INSERT INTO Patient (PatientID, Name, Age, Gender, Contact, EmergencyContact, Village, Gewog, Dzongkhag, BloodGroup, RegistrationDate, Status)
VALUES (1001, 'Karma Wangmo', 34, 'F', '17123456', '17654321', 'Babesa', 'Chang', 'Thimphu', 'O+', CURRENT_DATE, 'Active');
(ii) INSERT INTO Appointment (AppointmentID, PatientID, StaffID, Date, Time, Type, Status)
VALUES (5001, 1001, 201, '2025-11-25', '10:30', 'Consultation', 'Scheduled');
(iii) UPDATE Patient SET Contact = '77112233' WHERE PatientID = 1001;
(iv) SELECT * FROM MedicalProcedure
WHERE ProcedureType = 'Surgery' AND ProcedureDate >= CURRENT_DATE - INTERVAL '30 days';
(v) SELECT s.StaffID, s.Name FROM Staff s JOIN Department d ON d.DepartmentID = s.DepartmentID
WHERE d.Name = 'Surgery' AND s.EmploymentStatus = 'On Leave';
(If Department is a text column in Staff: WHERE Department = 'Surgery' AND EmploymentStatus = 'On Leave'.)"""),
    it("""4. Database transactions and concurrency
(i) Define a transaction and explain ACID with an HMS example. (4 marks)
(ii) Two doctors update the same record at the same time: explain concurrency control. (2 marks)""", 6,
       [("(i) Transaction definition and A, C, I, D each explained with HMS example (e.g. procedure + billing)", 4), ("(ii) Locking (pessimistic) or optimistic version checks, isolation levels, to prevent lost updates", 2)],
       "(i) A transaction is a group of database operations treated as one logical unit that either completes fully or not at all. Example: recording a surgery inserts the procedure, updates the patient's status and adds a bill. Atomicity - all three steps succeed or all are rolled back. Consistency - rules (foreign keys, cost ≥ 0) hold before and after. Isolation - concurrent transactions do not see each other's partial work (another user doesn't see the procedure without its bill). Durability - once committed, the data survive power failure (write-ahead log). (ii) If two doctors edit the same patient record, one update could overwrite the other (lost update). Concurrency control prevents this: pessimistic locking (row lock with SELECT ... FOR UPDATE - the second doctor waits) or optimistic control (version number/timestamp checked at save; if changed, the second doctor is told to reload), with suitable isolation levels."),
    it("""5. Software development life cycle
(i) What is the SDLC? Name three methodologies. (2 marks)
(ii) Differentiate functional and non-functional requirements. Identify two of each for the HMS. (4 marks)
(iii) Explain unit, integration, system and user acceptance testing. (4 marks)""", 10,
       [("(i) SDLC definition/phases; three methodologies (Waterfall, Agile/Scrum, Spiral, V-model, iterative)", 2), ("(ii) Functional = what system does; non-functional = how well; two HMS examples each", 4), ("(iii) Four testing levels explained", 4)],
       "(i) The SDLC is a structured process for building software: planning, requirements analysis, design, implementation (coding), testing, deployment and maintenance. Methodologies: Waterfall, Agile (Scrum/Kanban), Spiral (also V-model, iterative/incremental, DevOps). (ii) Functional requirements describe what the system must do - e.g. register patients and generate unique IDs; schedule, reschedule and cancel appointments; record procedures and generate bills. Non-functional requirements describe how well it must do it - e.g. availability 99.9% 24/7; response time under 2 seconds; data encrypted and access logged (security, privacy); usability; scalability. (iii) Unit testing - individual functions/modules tested in isolation by developers. Integration testing - checks that modules work together (e.g. appointment module with patient and staff modules, database, interfaces). System testing - the complete system is tested against all requirements, including performance and security. User acceptance testing (UAT) - real users (doctors, nurses, clerks) test the system in realistic scenarios to confirm it meets their needs before go-live."),
    it("""6. System security and data protection
(i) Explain what RBAC is and how it simplifies access management in the HMS. Give an example showing how different staff roles would have different permissions. (3 marks)
(ii) List and briefly describe three critical security measures that should be implemented in the HMS to safeguard sensitive patient data and ensure secure operation. (3 marks)""", 6,
       [("(i) RBAC: permissions assigned to roles, users assigned roles; simplifies management; example roles doctor/nurse/receptionist/admin", 3), ("(ii) Three measures: encryption at rest/in transit, MFA/strong authentication, audit logs, backups/DR, patching, least privilege, network security", 3)],
       "(i) Role-Based Access Control assigns permissions to roles rather than to individual users; each user gets one or more roles. When staff join, move or leave, only their role assignment changes, so management is simpler, consistent and auditable, and least privilege is enforced. Example: Doctor - view and update medical history, order procedures; Nurse - view patient records, record vitals, cannot change diagnoses; Receptionist - register patients and book appointments, no access to medical history; Billing - view procedures and costs only; System administrator - manage accounts but not read clinical data. (ii) 1. Encryption - TLS for data in transit and encryption of the database/backups at rest, so stolen data cannot be read. 2. Strong authentication - unique accounts, multi-factor authentication and automatic session time-outs. 3. Audit logging and monitoring - record who accessed or changed which record, with alerts for unusual access. (Also: regular backups and disaster recovery, patching, firewalls and network segmentation, data privacy policy and staff training.)"),
])
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions (6 questions)", "type": "short_answer", "count": 1, "marks_each": 20, "answer_any": None},
    {"title": "Section B: Case study (answer either Case I or Case II)", "type": "passage", "count": 2, "marks_each": 50, "answer_any": 1},
]
