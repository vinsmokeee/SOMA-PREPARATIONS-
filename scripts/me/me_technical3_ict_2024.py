"""ME Technical Paper III (Subject Specialisation Paper), ICT, BCSE 2024 - real paper (PDF sent by the founder).
Same layout as the 2025 ICT paper (the latest): Part II is six short answers totalling 20 marks, kept together as one group.
MCQs 5 (all four options are Big Data "V"s) and 22 (HTTPS and SSL/TLS are both correct) replaced. Case I says "Kuensel
Corporation" in the text and "ABC Corporation" in question 1; kept as printed, model answers use "the office".
Answer keys and model answers were written by Claude: please check before publishing.
"""
import os, runpy
_c = runpy.run_path(os.path.join(os.path.dirname(__file__), "technical3_common.py"))
RUBRIC, STANDARD, mcqs, new_mcq, saq, case = _c["RUBRIC"], _c["STANDARD"], _c["mcqs"], _c["new_mcq"], _c["saq"], _c["case"]

BATCH = "ME Paper III (Technical, ICT): BCSE 2024, batch 1"
GROUP_TAG = "ict2024"
PAPER = "me-technical-3"
SUBJECT = "subject-specialisation"
SPECIALISATION = "ict"
ADDS_TO_PAPER = True  # 2025 is the latest ICT paper: its layout stays (founder rule, 21 Nov 2026)
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}
TOPIC = "ICT"

MCQ = r"""[
{
"n": 1,
"stem": "In computing, one terabyte(TB) is equal to:",
"opts": [
"1024 GB",
"1000 GB",
"1024 MB",
"1000 MB"
]
},
{
"n": 2,
"stem": "Which of the following protocols is used for email transmission?",
"opts": [
"SNMP",
"HTTP",
"FTP",
"SMTP"
]
},
{
"n": 3,
"stem": "What does the hexadecimal color code #FFFFFF represent?",
"opts": [
"Black",
"Black and White",
"White",
"RBG"
]
},
{
"n": 4,
"stem": "Which of the following languages is commonly used for front-end web development?",
"opts": [
"SQL",
"PHP",
"JavaScript",
"Python"
]
},
{
"n": 5,
"stem": "What characteristic is NOT typically associated with Big Data?",
"opts": [
"Velocity",
"Volume",
"Veracity",
"Variability"
]
},
{
"n": 6,
"stem": "What is the primary goal of sentiment analysis?",
"opts": [
"To measure the sentiment or emotion expressed in textual data",
"To clean and prepare data",
"To store data",
"To predict future trends"
]
},
{
"n": 7,
"stem": "Convert the subnet mask 255.255.255.240 into CIDR notation.",
"opts": [
"/30",
"/29",
"/28",
"/27"
]
},
{
"n": 8,
"stem": "In Scrum, what is a \"sprint\"?",
"opts": [
"A set of user stories.",
"A fixed-duration iteration for completing a set of work.",
"A meeting to review project progress with management.",
"A user specification document."
]
},
{
"n": 9,
"stem": "What is Infrastructure as Code (IaC) in DevOps?",
"opts": [
"The process of integrating code into a central repository.",
"The process of documenting infrastructure manually.",
"Managing and provisioning infrastructure through code and automation tools",
"Writing code for software applications."
]
},
{
"n": 10,
"stem": "Which algorithm is commonly used for public key cryptography?",
"opts": [
"SHA-256",
"RSA",
"AES",
"DES"
]
},
{
"n": 11,
"stem": "Which version control system is widely used in DevOps practices?",
"opts": [
"Git",
"Apache",
"Asana",
"Oracle"
]
},
{
"n": 12,
"stem": "How is data typically managed in a microservices architecture?",
"opts": [
"All data is stored in files.",
"A single database shared by all services.",
"No databases are used.",
"Each microservice has its own independent database."
]
},
{
"n": 13,
"stem": "What is the main purpose of a subnet mask in networking?",
"opts": [
"To encrypt data being transmitted.",
"To assign IP addresses to devices.",
"To divide an IP address into network and host portions.",
"To identify the MAC address of a device."
]
},
{
"n": 14,
"stem": "Which type of network architecture typically uses a central server to manage network resources?",
"opts": [
"Mesh network.",
"Peer-to-peer network.",
"Client-server network.",
"Bus network."
]
},
{
"n": 15,
"stem": "What is the logical way to handle network congestion in a design?",
"opts": [
"Implement Quality of Service (QoS) to prioritize critical traffic.",
"Reduce the number of users on the network.",
"Only use wired connections.",
"Use Cat6 cables."
]
},
{
"n": 16,
"stem": "What is an \"agile methodology\" in the context of digital transformation?",
"opts": [
"A static approach to project management.",
"A method for business process reengineering.",
"A flexible and iterative approach to project management.",
"A method to include both software and hardware aspects."
]
},
{
"n": 17,
"stem": "Which protocol is commonly used for remote management of data center devices?",
"opts": [
"VPN",
"HTTP",
"HTTPS",
"SNMP"
]
},
{
"n": 18,
"stem": "What does the term \"edge computing\" refer to in the context of IoT?",
"opts": [
"Performing computation in the cloud.",
"Performing computation in mainframe computers.",
"Performing computation on local devices close to the source of data.",
"Performing computation at data centers."
]
},
{
"n": 19,
"stem": "Which feature of blockchain ensures that once data is recorded, it cannot be altered?",
"opts": [
"Decentralization",
"Immutability",
"Ledgers",
"Scalability"
]
},
{
"n": 20,
"stem": "Which of the following is a type of Machine Learning where the algorithm is trained on labeled data?",
"opts": [
"Reinforcement Learning",
"Unsupervised Learning",
"Supervised Learning",
"Both B and C"
]
},
{
"n": 21,
"stem": "Which of the following is a method of securing data in transit?",
"opts": [
"Encryption",
"Decryption",
"Firewall",
"Cloud storage"
]
},
{
"n": 22,
"stem": "Which security measure is commonly used by payment gateways to protect sensitive data?",
"opts": [
"HTTPS",
"Plain text data storage",
"Open access to transaction logs",
"SSL (Secure Socket Layer) encryption"
]
},
{
"n": 23,
"stem": "Which of the following formats is most commonly used to structure data in a RESTful API response?",
"opts": [
"CSV",
"HTML",
"JSON",
"XML"
]
},
{
"n": 24,
"stem": "What type of diagram can be used to complement a DFD by showing the structure of data within the system?",
"opts": [
"Sequence Diagram",
"Gantt Chart",
"Flowchart",
"Entity-Relationship Diagram (ERD)"
]
},
{
"n": 25,
"stem": "What will be the output of the following code snippet?\nfruits = [\"apple\", \"banana\", \"cherry\"]\nprint(len(fruits))",
"opts": [
"5",
"4",
"3",
"2"
]
},
{
"n": 26,
"stem": "Which chmod command will give read and write permissions to the owner, and read-only permissions to the group and others?",
"opts": [
"chmod 755",
"chmod 644",
"chmod 777",
"chmod 622"
]
},
{
"n": 27,
"stem": "Which of the following statements is correct?",
"opts": [
"A relation in 2NF is always in 3NF",
"A relation in 1NF is always in 2NF",
"A relation in BCNF is always in 3NF",
"A relation in 3NF is always in BCNF"
]
},
{
"n": 28,
"stem": "Which command is used to check connectivity or if a port is open on a network?",
"opts": [
"ping",
"traceroute",
"netstat",
"telnet"
]
},
{
"n": 29,
"stem": "The SQL WHERE clause:",
"opts": [
"Limits the column data that are returned.",
"Limits the row data that are returned.",
"Both A and B are correct.",
"Neither A nor B are correct."
]
},
{
"n": 30,
"stem": "Which of the following cloud computing service models provides the most comprehensive solution for end-users, including fully functional applications?",
"opts": [
"SaaS",
"IaaS",
"FaaS",
"PaaS"
]
}
]"""

KEY = {
    1: ("a", "In binary (computing) units 1 TB = 1024 GB."),
    2: ("d", "SMTP (Simple Mail Transfer Protocol) sends email."),
    3: ("c", "#FFFFFF has red, green and blue all at maximum (FF), giving white."),
    4: ("c", "JavaScript runs in the browser for front-end development (with HTML and CSS)."),
    6: ("a", "Sentiment analysis identifies the opinion or emotion (positive, negative, neutral) in text."),
    7: ("c", "240 = 11110000, so the mask has 24 + 4 = 28 one-bits: /28."),
    8: ("b", "A sprint is a fixed time-box (usually 1-4 weeks) in which the team completes a set of work."),
    9: ("c", "IaC defines and provisions infrastructure through code and automation tools (e.g. Terraform, Ansible)."),
    10: ("b", "RSA is a public-key (asymmetric) algorithm; AES and DES are symmetric, SHA-256 is a hash."),
    11: ("a", "Git is the most widely used version control system in DevOps."),
    12: ("d", "Each microservice owns its data (database-per-service) so services stay independent."),
    13: ("c", "A subnet mask separates the network portion of an IP address from the host portion."),
    14: ("c", "Client-server networks use central servers to manage resources and services."),
    15: ("a", "QoS prioritises critical traffic (voice, video) when the network is congested."),
    16: ("c", "Agile is a flexible, iterative approach delivering in small increments with feedback."),
    17: ("d", "SNMP is used to monitor and manage network and data-centre devices remotely."),
    18: ("c", "Edge computing processes data on or near the devices that produce it, reducing latency and bandwidth."),
    19: ("b", "Immutability: recorded blocks cannot be changed without breaking the hash chain."),
    20: ("c", "Supervised learning uses labelled training data."),
    21: ("a", "Encryption (e.g. TLS) protects data while it travels over the network."),
    23: ("c", "RESTful APIs most commonly return JSON."),
    24: ("d", "An ER diagram shows the data structure (entities, attributes, relationships) that a DFD's data stores hold."),
    25: ("c", "The list has three items, so len(fruits) prints 3."),
    26: ("b", "644 = owner rw- (6), group r-- (4), others r-- (4)."),
    27: ("c", "BCNF is stricter than 3NF, so every relation in BCNF is also in 3NF."),
    28: ("d", "telnet <host> <port> tests whether a TCP port is open (ping only tests reachability)."),
    29: ("b", "WHERE filters rows; the SELECT list limits columns."),
    30: ("a", "SaaS delivers complete, ready-to-use applications to end users."),
}

T = TOPIC
Q = mcqs(MCQ, KEY, T) + [
    new_mcq(1, T, "Which of the following is a characteristic of Big Data that refers to the different forms of data (structured, semi-structured and unstructured)?", ["Volume", "Velocity", "Variety", "Value"], "c",
            "Variety refers to the many types and formats of data, such as tables, text, images and sensor streams."),
    new_mcq(2, T, "Which standard must organisations that store, process or transmit card payment data comply with?", ["PCI DSS", "ISO 9001", "IEEE 802.11", "ITIL"], "a",
            "PCI DSS (Payment Card Industry Data Security Standard) sets security rules for handling card data."),
]

SA = [
    ("What is the principle of least privilege in network security and why is it needed?", 2,
     [("Definition: users, programs and devices get only the minimum access rights needed for their task, for the minimum time", 1), ("Need: limits damage from compromised accounts, insider misuse and malware spread; reduces attack surface; supports compliance", 1)],
     "The principle of least privilege means that every user, program, process or device is given only the minimum access rights it needs to do its job, and only for as long as needed (e.g. a finance clerk can read and update finance records but cannot change server settings). It is needed because it limits the damage if an account is compromised or misused, stops malware spreading with high privileges, reduces the attack surface and insider threats, and helps auditing and compliance."),
    ("What is cloud computing? State briefly any two types of cloud service models.", 3,
     [("Cloud computing: on-demand delivery of computing resources (servers, storage, software) over the internet, pay-as-you-go, scalable, managed by provider", 1),
      ("Two models explained, e.g. IaaS (virtual machines, storage, networks - AWS EC2), PaaS (platform to build/deploy apps - Google App Engine), SaaS (ready applications - Gmail, Microsoft 365)", 2)],
     "Cloud computing is the on-demand delivery of computing resources - servers, storage, databases, networking and software - over the internet from a provider's data centres, with rapid scaling and pay-as-you-go pricing instead of owning the hardware. Service models: (1) Infrastructure as a Service (IaaS) - the provider supplies virtual machines, storage and networks and the user manages the operating system and applications (e.g. AWS EC2, Azure VMs); (2) Software as a Service (SaaS) - complete applications used through a browser, managed fully by the provider (e.g. Gmail, Microsoft 365). (Platform as a Service, PaaS, supplies a ready platform for developing and deploying applications, e.g. Google App Engine.)"),
    ("Briefly state what descriptive analytics, predictive analytics and prescriptive analytics are.", 3,
     [("Descriptive: what happened - summarises past data (reports, dashboards, averages)", 1), ("Predictive: what is likely to happen - statistical/ ML models forecast future", 1), ("Prescriptive: what should be done - recommends actions/ optimisation", 1)],
     "Descriptive analytics summarises historical data to show what has happened, using reports, dashboards and statistics (e.g. monthly sales or number of patients last year). Predictive analytics uses statistical models and machine learning on past data to forecast what is likely to happen (e.g. predicting demand or which customers may leave). Prescriptive analytics goes further and recommends what should be done, using optimisation and simulation to choose the best action (e.g. the best route or stock level)."),
    ("For the following Java code, write the output:\npublic class Main {\n  public static void main(String[] args) {\n    int[][] matrix = { {1, 2, 3}, {4, 5, 6}, {7, 8, 9} };\n    int sum = 0;\n    for (int i = 0; i < matrix.length; i++) {\n      sum += matrix[i][i];\n    }\n    System.out.println(\"Output is : \" + sum);\n  }\n}", 3,
     [("Loop adds diagonal elements matrix[0][0] + matrix[1][1] + matrix[2][2] = 1 + 5 + 9", 2), ("Output: Output is : 15", 1)],
     "The loop runs for i = 0, 1, 2 (matrix.length = 3) and adds the main-diagonal elements matrix[i][i]: 1 + 5 + 9 = 15. The program prints: Output is : 15"),
    ("How many hosts can be addressed in a Class C network, and what is the subnet mask for a network with 4 subnets each capable of hosting up to 30 devices?", 4,
     [("Class C /24: 2^8 - 2 = 254 usable hosts", 1.5),
      ("30 hosts need 5 host bits (2^5 - 2 = 30) → /27 = 255.255.255.224 (gives 8 subnets of 30 hosts; 4 are used, rest for growth); (4 subnets only, using 2 bits → /26 = 255.255.255.192 with 62 hosts each)", 2.5)],
     "A Class C network (/24, default mask 255.255.255.0) has 8 host bits: 2^8 = 256 addresses, of which 254 are usable hosts (network and broadcast addresses excluded). For subnets of up to 30 devices: 30 hosts need 5 host bits (2^5 - 2 = 30), leaving 3 bits for subnets, so the mask is /27 = 255.255.255.224; this gives 8 subnets of 30 usable hosts each - the 4 needed subnets (e.g. .0, .32, .64, .96) plus 4 spare for growth. (If exactly 4 subnets are made by borrowing 2 bits, the mask would be /26 = 255.255.255.192 with 62 hosts each, wasting addresses; /27 matches the 30-host requirement.)"),
    ("Explain the importance of multi-factor authentication (MFA) in enhancing cybersecurity. How does it improve security compared with password-only authentication?", 5,
     [("MFA: two or more independent factors - something you know (password/ PIN), have (phone, token, OTP), are (biometric)", 1.5),
      ("Importance: protects against stolen/ weak/ reused passwords, phishing, brute force, credential stuffing; protects sensitive systems, compliance", 1.5),
      ("Compared to password-only: attacker needs a second factor too; single point of failure removed; alerts on login attempts; examples (OTP, authenticator app, fingerprint)", 2)],
     "Multi-factor authentication requires a user to prove identity with two or more independent factors: something they know (password or PIN), something they have (a phone receiving an OTP, an authenticator app or hardware token) and something they are (fingerprint or face). It is important because passwords are often weak, reused, guessed, or stolen through phishing, malware and data breaches; MFA protects email, banking, government systems and cloud accounts against these attacks and supports compliance. Compared with password-only login, a stolen password alone is no longer enough: the attacker would also need the user's device or biometric, so brute-force, credential-stuffing and most phishing attacks fail; users are also alerted by unexpected OTP requests. The password stops being a single point of failure."),
]
for i, (s, mk, kp, mod) in enumerate(SA):
    Q.append(dict(key=f"S{i + 1}", real=True, type="short_answer", marks=mk, topic=T, group="me-technical-3-ict2024-part2", pos=i + 1,
                  stem=f"Part II, question {i + 1}. {s} ({mk} marks)", key_points=kp, model=mod))

C1 = """Case I: Network design for a corporate office
You are a network consultant designing a comprehensive, secure and efficient network for the new office of Kuensel Corporation (called "ABC Corporation" in question 1). The office will have 200 employees in Marketing, HR, Finance, IT and Sales over three floors. Each department needs dedicated resources and services: file sharing, permissions management, high-speed internet and secure internal communication. The network must support high-bandwidth applications such as video conferencing and data transfers while keeping data secure. The office needs centralised storage for file sharing and backup, effective user access controls, scalability for future growth, and secure connectivity to a branch office in another city."""
C2 = """Case II: Employee Management System for the Department of Forests and Park Services
The Department of Forests and Park Services (DoFPS) manages, conserves and sustainably uses Bhutan's forest resources and protected areas, with many employees stationed across the country. It wants an Employee Management System (EMS) recording:
- Employee: Employee ID, Name, Contact Number, Email, Employee Type (Regular/Contract), Address (Village, Gewog, Dzongkhag), Job Title, Department and Role, Status (Active/Resigned).
- Leave: Leave Type, Total Number of Days Eligible, Availed Leave and Leave Balance.
- Training: Training Type (STT, LTT, Workshop, Conference), Name, Start date, End date, Organizer, Place.
- Patrolling: Date, Location, Purpose, Duration and Remarks."""
def it(q, m, kp, mod): return (q, m, kp, mod)
Q += case("ict2024", 1, T, C1, items=[
    it("1. Propose a suitable network topology for the new office over three floors, considering departmental segregation, scalability and fault tolerance. Justify your choice and describe physical and logical network diagrams.", 8,
       [("Hierarchical star (extended star): core/ collapsed core in server room, distribution and access switches per floor, redundant uplinks (fibre)", 3),
        ("Logical: VLANs per department, inter-VLAN routing at core L3 switch, server/ DMZ, management VLAN, Wi-Fi", 2),
        ("Justification: segregation, scalability (add switches/ ports), fault tolerance (redundant core, link aggregation, STP, dual power/ ISP); diagrams labelled", 3)],
       """Topology: a hierarchical (extended) star - a collapsed core of two redundant Layer-3 switches in the ground-floor server room, connected by fibre uplinks to access switches on each of the three floors (each access switch dual-homed to both core switches, with link aggregation and rapid spanning tree), plus wireless access points on each floor, the firewall/router and internet links, and a server/storage segment. Physical diagram: internet (two ISPs) → firewall pair → core switches → floor access switches (stacked) → PCs, phones, printers and APs; servers and NAS connected to the core. Logical diagram: separate VLANs for Marketing, HR, Finance, IT, Sales, servers, management, Wi-Fi staff and guest, with inter-VLAN routing and ACLs on the core switches and firewall. Justification: VLANs segregate departments for security and smaller broadcast domains; the star is easy to expand by adding switches or ports; redundancy (dual core, dual uplinks, dual power and ISPs) removes single points of failure; fault isolation and management are simple."""),
    it("2. Design an IP addressing scheme for the office network, allocating subnets for each department and floor with future growth. Specify subnet masks and IP ranges and explain your rationale.", 8,
       [("Private range e.g. 10.10.0.0/16 (or 172.16.0.0/16); one VLAN/ subnet per department, sized with growth (e.g. /24 each or /25-/26 by size)", 3),
        ("Table: e.g. Marketing 10.10.10.0/24 (10.10.10.1-254), HR 10.10.20.0/24, Finance 10.10.30.0/24, IT 10.10.40.0/24, Sales 10.10.50.0/24, servers 10.10.100.0/24, management 10.10.99.0/24, Wi-Fi/ guest separate; gateway .1, DHCP ranges, static for servers", 3),
        ("Rationale: growth, summarisation, easy identification, security policies by subnet, branch uses different range (10.20.0.0/16) for VPN", 2)],
       """Use the private block 10.10.0.0/16 for the head office (and 10.20.0.0/16 for the branch so VPN routes do not overlap). Give each department its own VLAN and /24 subnet (254 hosts each, far above current needs of about 40 per department, leaving room for growth): Marketing VLAN 10 - 10.10.10.0/24 (hosts 10.10.10.1-10.10.10.254, gateway .1); HR VLAN 20 - 10.10.20.0/24; Finance VLAN 30 - 10.10.30.0/24; IT VLAN 40 - 10.10.40.0/24; Sales VLAN 50 - 10.10.50.0/24; Servers VLAN 100 - 10.10.100.0/24 (static addresses); Management VLAN 99 - 10.10.99.0/24 (switches, APs, firewall); Staff Wi-Fi - 10.10.60.0/23; Guest Wi-Fi - 10.10.70.0/24 (internet only); Voice/video - 10.10.80.0/24. If a department sits on several floors, the same VLAN is extended across floors (or third-octet blocks per floor, e.g. 10.10.1x.0 for floor 1). Rationale: easy to identify departments from addresses, ample growth, firewall rules per subnet, route summarisation (one /16 per site), DHCP with reservations for printers and static addresses for servers."""),
    it("3. Identify and describe at least four essential network devices for the new office network and explain the role of each.", 8,
       [("Router/ firewall (NGFW): internet/ WAN, NAT, security policies, VPN", 2), ("Core Layer-3 switch: high-speed backbone, inter-VLAN routing", 2),
        ("Access switches (PoE): connect end devices, VLANs, power APs/ IP phones", 2), ("Wireless access points + controller; servers/ NAS; others (load balancer, UPS)", 2)],
       """(1) Edge router/next-generation firewall - connects the office to the internet and branch (WAN), performs NAT, routing and security inspection (firewall rules, IPS, web filtering) and terminates site-to-site and remote-access VPNs. (2) Core Layer-3 switches - the high-speed backbone joining all floors and servers, routing between VLANs with access control lists, with redundancy. (3) Access switches (managed, PoE) on each floor - connect PCs, printers and phones to the network, assign VLANs, provide port security and power Wi-Fi access points and IP phones. (4) Wireless access points with a controller - give secure staff and guest Wi-Fi with roaming across floors. Also: servers and NAS/SAN for file sharing and storage, a domain controller for user accounts, and UPS for power protection."""),
    it("4. Outline any three security technologies for the new office network and explain why. Also describe how you would securely connect the branch office in another location.", 8,
       [("Three technologies explained: next-generation firewall/ UTM with IPS; VLAN segmentation + ACLs/ NAC (802.1X); endpoint protection/ antivirus/ EDR; MFA; encryption; SIEM/ logging", 5),
        ("Branch connectivity: site-to-site IPsec VPN over internet (or SD-WAN/ leased line), strong encryption, authentication, redundant links", 3)],
       """(1) Next-generation firewall with intrusion prevention - controls traffic between internet, departments and servers, blocks malware and attacks and filters websites, because the perimeter and internal segments must be protected. (2) Network access control (802.1X with RADIUS) and VLAN segmentation with ACLs - only authenticated users and devices join, and departments such as Finance and HR are isolated, limiting damage from a compromised device. (3) Endpoint protection (antivirus/EDR) with patch management, plus multi-factor authentication for logins and VPN - because most attacks begin at user devices and stolen passwords. (Encrypted Wi-Fi WPA3-Enterprise and central logging/SIEM also help.) Branch connection: a site-to-site IPsec VPN between the head-office firewall and the branch firewall over the internet, using strong encryption (AES-256), certificate or pre-shared key authentication and the firewall's access rules; for reliability, SD-WAN over two ISPs (or a leased line with VPN backup), with monitoring."""),
    it("5. Identify any three technologies you would implement so the network can handle high-bandwidth applications and maintain optimal performance for all users.", 6,
       [("Quality of Service (QoS) to prioritise voice/ video", 2), ("High-capacity links: 10 Gbps fibre uplinks, Gigabit/ multi-gig to desktops, link aggregation; Wi-Fi 6", 2), ("Load balancing/ dual ISP/ SD-WAN, VLAN segmentation, caching, bandwidth monitoring (NetFlow/ SNMP)", 2)],
       """(1) Quality of Service (QoS) - classify and prioritise real-time traffic such as video conferencing and voice over bulk downloads, so calls stay clear during busy periods. (2) High-capacity infrastructure - 10 Gbps fibre uplinks between floors and core, Gigabit (or multi-gigabit) access ports, link aggregation for extra bandwidth and redundancy, and Wi-Fi 6 access points. (3) Dual internet links with load balancing or SD-WAN, plus monitoring tools (SNMP/NetFlow) to find bottlenecks; VLAN segmentation reduces broadcast traffic, and local caching of updates saves bandwidth."""),
    it("6. Explain how you would set up file sharing within the network and manage user permissions effectively. What tools or protocols would you use?", 6,
       [("Central file server/ NAS with departmental shared folders; SMB/ CIFS (Windows) or NFS; mapped drives", 2),
        ("Permissions via directory service (Active Directory/ LDAP) groups per department, NTFS/ share permissions, least privilege, role-based access", 3), ("Auditing, quotas, versioning/ shadow copies, encryption", 1)],
       """Set up a central file server or NAS with a shared folder per department and a common folder, accessed over SMB/CIFS (Windows clients) or NFS (Linux) and mapped automatically as network drives by group policy. Users authenticate against a directory service (Active Directory or LDAP); create security groups for each department and role, and give permissions to groups, not individuals (e.g. Finance group: modify on Finance share; managers: read on all; others: no access), following least privilege with NTFS and share permissions. Add auditing of access, storage quotas, shadow copies/versioning for accidental deletion and encryption of sensitive folders."""),
    it("7. Recommend storage solutions for the office network, considering backup, scalability and data redundancy. Justify your recommendations.", 6,
       [("NAS (or SAN for virtualisation) with RAID (RAID 5/6/10) for redundancy, expandable", 2),
        ("Backup: 3-2-1 rule - local backup appliance + offsite/ cloud or branch replication, scheduled, tested", 2), ("Scalability: add drives/ shelves, cloud tiering; snapshots; justification (availability, recovery, cost)", 2)],
       """Primary storage: a NAS with RAID 6 or RAID 10 (or a SAN if servers are virtualised) holding the file shares, giving redundancy against disk failure, snapshots for quick recovery, and the ability to add disks or expansion shelves as data grows. Backup: follow the 3-2-1 rule - daily incremental and weekly full backups to a separate backup appliance, plus a copy offsite (replicated to the branch office or encrypted cloud backup), with regular restore tests. Justification: RAID keeps data available when a disk fails, snapshots and backups protect against deletion and ransomware, offsite copies protect against fire or disaster, and modular storage scales with the company at reasonable cost."""),
])
Q += case("ict2024", 2, T, C2, items=[
    it("Question 1: Entity-relationship model.\n(i) Identify the entities and their attributes for the DoFPS EMS database. (3 marks)\n(ii) What is the difference between a primary key and a foreign key? (2 marks)\n(iii) Develop an ER model showing the relationships between these entities. State any assumptions and indicate all relationships and constraints. (7 marks)", 12,
       [("(i) Entities: Employee, Department, Leave (LeaveType/ LeaveRecord), Training, Patrolling with listed attributes", 3),
        ("(ii) Primary key uniquely identifies each row, not null; foreign key refers to primary key of another table, enforces referential integrity", 2),
        ("(iii) Relationships: Department 1-N Employee; Employee 1-N LeaveRecord (N-1 LeaveType); Employee M-N Training (via EmployeeTraining); Employee 1-N/ M-N Patrolling; cardinalities, participation, assumptions; diagram", 7)],
       """(i) Entities and attributes: Employee (EmployeeID, Name, ContactNumber, Email, EmployeeType, Village, Gewog, Dzongkhag, JobTitle, Role, Status, DepartmentID); Department (DepartmentID, DepartmentName); LeaveType (LeaveTypeID, LeaveTypeName, TotalDaysEligible); EmployeeLeave (EmployeeID, LeaveTypeID, Year, AvailedLeave, LeaveBalance); Training (TrainingID, TrainingType, Name, StartDate, EndDate, Organizer, Place); Patrolling (PatrolID, Date, Location, Purpose, Duration, Remarks).
(ii) A primary key uniquely identifies each record in a table and cannot be null or duplicated (e.g. EmployeeID). A foreign key is a column in one table that refers to the primary key of another table, linking them and enforcing referential integrity (e.g. DepartmentID in Employee referring to Department).
(iii) ER model (assumptions: one employee belongs to one department; a training may have many employees and an employee many trainings; a patrol may involve several employees): Department 1 — N Employee (each employee must have a department). Employee 1 — N EmployeeLeave N — 1 LeaveType (leave records per employee per type and year). Employee M — N Training, resolved by EmployeeTraining (EmployeeID, TrainingID, Status) with composite primary key. Employee M — N Patrolling, resolved by PatrolMember (PatrolID, EmployeeID, Role). Constraints: primary keys underlined, foreign keys referencing parents, Status in (Active, Resigned), EmployeeType in (Regular, Contract), TrainingType in (STT, LTT, Workshop, Conference), EndDate ≥ StartDate, LeaveBalance = TotalDaysEligible - AvailedLeave ≥ 0, email unique."""),
    it("Question 2: Normalisation.\n(i) What is normalisation and why is it carried out? (2 marks)\n(ii) Explain the process of normalising the schema you created in Question 1, so that the final design is at least in 3NF. Give examples and explain each step. (6 marks)", 8,
       [("(i) Organising tables to reduce redundancy and update/ insert/ delete anomalies, ensure integrity", 2),
        ("(ii) 1NF: atomic values, no repeating groups (address split into village, gewog, dzongkhag; one row per training attended)", 2),
        ("2NF: remove partial dependencies on part of composite key (training details in Training, not EmployeeTraining)", 2),
        ("3NF: remove transitive dependencies (department name in Department table, leave eligibility in LeaveType; balance derived)", 2)],
       """(i) Normalisation is the process of organising data into well-structured tables, based on functional dependencies, to remove redundancy and avoid insertion, update and deletion anomalies, so that data stay consistent and storage is efficient.
(ii) Start from a single unnormalised record: Employee(EmployeeID, Name, ..., Address, Department, LeaveTypes..., Trainings..., Patrols...). 1NF: make every value atomic and remove repeating groups - split Address into Village, Gewog, Dzongkhag; move repeating leave, training and patrol data into separate rows/tables (EmployeeLeave, EmployeeTraining, PatrolMember) with keys. 2NF: remove partial dependencies on part of a composite key - in EmployeeTraining(EmployeeID, TrainingID, TrainingName, StartDate...), training details depend only on TrainingID, so they move to Training(TrainingID, Type, Name, StartDate, EndDate, Organizer, Place), leaving EmployeeTraining(EmployeeID, TrainingID). Similarly patrol details move to Patrolling. 3NF: remove transitive dependencies - DepartmentName depends on DepartmentID, not on EmployeeID, so Department is a separate table; TotalDaysEligible depends on the leave type, so it goes to LeaveType; LeaveBalance can be derived (eligible - availed) rather than stored. The final tables (Employee, Department, LeaveType, EmployeeLeave, Training, EmployeeTraining, Patrolling, PatrolMember) are in 3NF."""),
    it("Question 3: SQL queries. Write SQL queries to:\n- Add a new employee. (2 marks)\n- Assign a training to the above employee. (2 marks)\n- Update the contact number and email of an employee. (2 marks)\n- Retrieve a list of all workshops attended by employees. (2 marks)\n- Retrieve records of employees who have left the organisation. (2 marks)", 10,
       [("INSERT INTO Employee (...) VALUES (...)", 2), ("INSERT INTO EmployeeTraining (EmployeeID, TrainingID) VALUES (...)", 2),
        ("UPDATE Employee SET ContactNumber = ..., Email = ... WHERE EmployeeID = ...", 2),
        ("SELECT ... FROM Employee JOIN EmployeeTraining JOIN Training WHERE TrainingType = 'Workshop'", 2), ("SELECT * FROM Employee WHERE Status = 'Resigned'", 2)],
       """INSERT INTO Employee (EmployeeID, Name, ContactNumber, Email, EmployeeType, Village, Gewog, Dzongkhag, JobTitle, Role, Status, DepartmentID)
VALUES ('E1001', 'Karma Dorji', '17123456', 'karma.dorji@dofps.gov.bt', 'Regular', 'Changjiji', 'Chang', 'Thimphu', 'Forest Ranger', 'Field', 'Active', 'D01');

INSERT INTO EmployeeTraining (EmployeeID, TrainingID) VALUES ('E1001', 'T205');

UPDATE Employee SET ContactNumber = '77123456', Email = 'k.dorji@dofps.gov.bt' WHERE EmployeeID = 'E1001';

SELECT e.EmployeeID, e.Name, t.Name AS Workshop, t.StartDate, t.EndDate, t.Place
FROM Employee e JOIN EmployeeTraining et ON et.EmployeeID = e.EmployeeID
JOIN Training t ON t.TrainingID = et.TrainingID
WHERE t.TrainingType = 'Workshop';

SELECT * FROM Employee WHERE Status = 'Resigned';"""),
    it("Question 4: ACID transactions. What does ACID stand for in database transactions? Explain each briefly.", 4,
       [("Atomicity: all or nothing", 1), ("Consistency: valid state to valid state, constraints", 1), ("Isolation: concurrent transactions do not interfere", 1), ("Durability: committed changes survive failures", 1)],
       """ACID stands for Atomicity, Consistency, Isolation and Durability. Atomicity - a transaction is all or nothing: if any step fails, all its changes are rolled back (e.g. leave availed and balance updated together). Consistency - a transaction takes the database from one valid state to another, respecting all constraints and rules. Isolation - concurrent transactions do not interfere; each behaves as if it ran alone (no dirty reads). Durability - once committed, changes are permanent and survive crashes or power failures (written to logs/disk)."""),
    it("Question 5: Software development life cycle.\n(i) What is a software development life cycle (SDLC)? Give some examples. (2 marks)\n(ii) Explain briefly the major phases of the SDLC. (4 marks)\n(iii) Differentiate between functional and non-functional requirements. Specify two functional and two non-functional requirements from the case study. (4 marks)", 10,
       [("(i) Structured process for planning, building, testing and maintaining software; models: Waterfall, Agile/ Scrum, Spiral, V-model, iterative", 2),
        ("(ii) Phases: planning/ feasibility, requirements analysis, design, implementation/ coding, testing, deployment, maintenance", 4),
        ("(iii) Functional = what the system does; non-functional = how well (performance, security, usability); examples: record leave and compute balance, assign training/ list workshops; secure role-based access, available 24/7, responsive within 3 s, works on mobile", 4)],
       """(i) The SDLC is a structured process for planning, developing, testing, deploying and maintaining software so that it meets requirements on time and within budget. Examples of SDLC models: Waterfall, V-model, Iterative/Incremental, Spiral, and Agile (Scrum).
(ii) Phases: planning and feasibility (scope, cost, schedule); requirements analysis (gathering and documenting what users need); design (architecture, database and interface design); implementation (coding); testing (unit, integration, system and user acceptance testing); deployment (installation, data migration, training); and maintenance (fixing bugs, updates and enhancements).
(iii) Functional requirements describe what the system must do - its features and behaviour; non-functional requirements describe how well it must do it - quality attributes such as performance, security, usability and reliability. Functional (from the case): the system shall record leave availed and calculate leave balance for each employee; the system shall assign trainings to employees and list all workshops attended. Non-functional: only authorised HR staff can edit records, with role-based access and encrypted passwords (security); the system shall be available from field offices across Bhutan and respond within 3 seconds (availability/performance)."""),
    it("Question 6: Authentication and security.\n(i) What does SSO stand for? Explain its concept and give an example where you have used it. (3 marks)\n(ii) Discuss three measures to ensure the security of the DoFPS EMS database. (3 marks)", 6,
       [("(i) Single Sign-On: one authentication (identity provider) gives access to multiple related systems; tokens (SAML/ OAuth/ OpenID Connect); example: Google account for Gmail, Drive, YouTube; government single login", 3),
        ("(ii) Three measures: role-based access control/ least privilege + MFA; encryption at rest and in transit (TLS), hashed passwords; backups, patching, auditing/ logging, input validation against SQL injection, firewall", 3)],
       """(i) SSO stands for Single Sign-On. The user logs in once with a central identity provider and is then trusted by several related applications without logging in again; the identity provider issues a secure token (using SAML, OAuth 2.0 or OpenID Connect) that the applications accept. Example: logging in once to a Google account gives access to Gmail, Google Drive and YouTube (or one government login for several e-services).
(ii) Security measures for the EMS database: (1) access control - role-based permissions with least privilege (HR officers edit, managers view their staff), strong passwords and MFA; (2) encryption - TLS for data in transit, encryption of the database/backups at rest and hashing of passwords; (3) protection and monitoring - parameterised queries to prevent SQL injection, firewall restricting database access to the application server, regular patches, audit logs of changes and regular tested backups."""),
])
PATTERN = [
    {"title": "Section A Part I: Multiple choice questions", "type": "mcq", "count": 30, "marks_each": 1, "answer_any": None},
    {"title": "Section A Part II: Short answer questions (6 questions)", "type": "short_answer", "count": 1, "marks_each": 20, "answer_any": None},
    {"title": "Section B: Case study (answer either Case I or Case II)", "type": "passage", "count": 2, "marks_each": 50, "answer_any": 1},
]
