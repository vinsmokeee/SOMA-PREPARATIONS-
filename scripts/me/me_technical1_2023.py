"""ME Technical Paper I, BCSE 2023 (real questions only), batch 3. PDF sent by the founder (20 Nov 2026).
Questions join the 2025 bank (pattern from me_technical1_2025.py). Dzongkha 2023: comprehension ka 8, kha 4, ga 3,
nga 5 (20) + translation 10 = 30. Left out of GK (answer not certain): Q5 (Bhutan Echoes patron), Q9 (Dratshang
move date), Q11 (FIFA member number), Q13 (Brunel Medal project).
"""
import os, runpy
_base = runpy.run_path(os.path.join(os.path.dirname(__file__), "me_technical1_2025.py"))
PATTERN, RUBRIC = _base["PATTERN"], _base["RUBRIC"]
CS, TOP, M, C, T = "analytical", "long_answer", "mcq", "passage", "translation"

BATCH = "ME Paper I (Technical): BCSE 2023, batch 3"
GROUP_TAG = "2023b3"
PAPER = "me-technical-1"
SUBJECT = "language-general-knowledge"
MIN_WORDS = 0
ADDS_TO_PAPER = True
SOURCE = {"title": "BCSE 2023 Main Examination, Technical category, Paper I (Language and GK)", "year": 2023,
          "url": "https://rcsc.gov.bt/technical-paper-1/"}
DZ = "Dzongkha: please have a fluent Dzongkha reader check it before publishing."
G1, D1 = "me-technical-1-2023b3-cs", "me-technical-1-2023b3-dz"

CASE = """Read the following passage and answer ALL THREE questions.

Six Pillars of Character-Case Study (published: 12/03/2021)

Maintenance of a commendable ethical character is essential to the work environment. In fact, Sanderse (2012) argues that lack of ethical character creates a non-conducive working atmosphere. As a result, it is essential for people to value the essence of ethics and respect for other people. In the case provided, we are presented with two parties that are a complete opposite of each other’s character. As much as mutual understanding is enhanced through the efforts of more than one party, it is worth acknowledging that Jeffrey Lyndell lacks essential characters that define good personality (Mintz & Morris, 2014). Primarily, he is untrustworthy. One would expect employees to be honest by not deceiving their workmate or the management. However, the same cannot be said for the abovementioned individual since he has a high appeal for deception and unreliability. This makes it impossible for Cindie to trust that he would be resourceful in the future.

Caring is an indispensable pillar in the formation of an all-round character. Lyndell is deficient in this virtue. He does not show any care for his workmate since he leaves work early with no contemplation that Cindie might be overwhelmed with work. In spite of that, he does not express any form of gratitude for the favours she grants him. Additionally, he is unfair because he does not play by the organizational rules. For instance, he is enrolled for the night shift and is expected to be at work until midnight. However, he does not follow this provision and he unfairly leaves the workload to his workmate by departing the restaurant before he is supposed to. Sanderse (2012) argues that responsible people ought to know what they are supposed to do and they should be diligent and perseverant. As such, Lyndell is irresponsible since he does not comprehend what is expected of him in the organization. Moreover, he does not respect other people’s values. This is largely attributed to the fact that he leaves work early and expects Cindie to cover for him. Collectively, he lacks the citizenship character since he does not make his work environment a better place.

On the other hand, Cindie is trustworthy. She is very reliable since she covers the entire store even when the situation is difficult. Additionally, she is fair since she plays by the rules of the establishment even in challenging situations. Her level of responsibility is uncompromised. Precisely, it was not easy to attend to ten people at once while keeping them calm and attending to phone calls. As such, one is justified to claim that she is Lyndell’s complete opposite. She is respectful since she accords other people the respect they deserve. For starters, she is tolerant of the workmate’s behaviour and anticipates that it would be better in the future. Her caring nature is exhibited by her initiative to explain the absence of her colleague when one of the clients makes an inquiry. Finally, she completes the six pillars of character through her citizenship nature. This is largely accredited to the fact that she seeks to make the community a better place. Sanderse (2012) argues that an all-round ethical being ought to embrace the six pillars of character.

Lawrence Kohlberg proposes three levels of moral development that encompass six stages. The former includes the pre-conventional, conventional and post conventional morality. It is worth mentioning that the level of internalization of the provisions of ethical character varies in these stages. As such, this ideology can be used to determine the actions of the parties presented in the case. Arguably, Cindie Rosen was compelled to give in to the demands of her workmate at first without raising any concerns. According to Killen and Smetana (2006) in obedience and punishment orientation, the first stage of moral development, an individual often maintains a good order with other people by avoiding conflict. As such, she accepted this demand since she wanted to maintain a good relationship with Lyndell. However, she is subjected to the second stage of moral development, individualism and exchange, when one of the Japanese clients makes an inquiry on the policies of the restaurant. Her internalization of the fact that rules are dispensed by more than one party completes the first level of moral development.

Cindie advances to the third stage when she decides to serve the clients and not inform the management through a phone call. Killen and Smetana (2006) argue that the third stage, good interpersonal relationships, compels people to act in ways that build their character and overall perception from other parties. In this case, the clients were pleased with her efforts. After closing the store, Cindie advances to the fourth stage of moral development, maintaining the social order, and she begins to accept that Lyndell’s actions are unethical and there is a need to remedy them. In the fifth stage, social contract and individual rights, she is engrossed in an ethical dilemma and is uncertain of what to do. She feels obliged to communicate with her workmate and debate about his character but is also torn about speaking to the management. The ethical dilemma leads her into the final stage of moral development, universal principles. She instead does what the larger population would have done, speak to the management.

This case scenario compels one to internalize the importance of maintaining ethical principles in a work environment. In other words, it is imperative to have moral values when dealing with fellow workmates and implementing the provisions of the management. For starters, Cindie’s behavior with regard to the interpretation of this scenario is somewhat pleasant. This is largely accredited to the fact that most of her actions are based on her personal beliefs and initiatives that are intentioned to make the work environment better. Nonetheless, it is worth acknowledging the fact that her approach is flawed. As much as one has to maintain their moral values, it is essential to compromise personal character for the betterment of situations. If this is not the case, people often take advantage of other individuals. This can be explained by the fact that Lyndell left work early on more than one occasion.

Arguably, if she had been intolerant of her workmate’s behavior in the first instance, it would have averted the problem of leaving work before time. Nonetheless, since she is easily manipulated due to her character, Lyndell makes the most out of her leniency to exploit her. To ensure that the chain of the abovementioned problems did not mature, she should have been firm at first when she was requested to cover for her workmate. Refusing to grant his request would have led to a minor disagreement that would have led to a more conducive work environment. For a fact, it is essential to compromise one’s character in place of ethical beliefs (Sanderse, 2012). Through this initiative, there would have been better communication and a more conducive work environment."""

DZP = """༈ “ཕ་རྒས་པར་བལྟ་སྟེ་བུ་གསོ།།” ཟེར་བའི་དཔེ་གཏམ་འདི་ལུ་དཔྱད་པ་ཅིན་ དང་པ་རང་གི་ཕམ་འདི་ རང་ལུ་དྲིན་ཆེ་བའི་དོན་དང་། གཉིས་པ་བུ་གཞི་ཚུ་གིས་ཡང་ ཕམ་ལུ་དྲིན་ལན་འཇལ་དགོ་པའི་ དོན་དག་སྟོན་མས་ཟེར་ཞུ་ནི་ཨིན། ཕམ་དྲིན་ཆེ་དགོ་པའི་ཁུངས་དེ་ཡང་ རང་གི་ཕམ་འདི་ རང་ལུ་འཛམ་གླིང་ནང་ ནོར་བུ་རིན་པོ་ཆེ་ལས་ལྷག་པའི་ མིའི་ལུས་རྟེན་བྱིན་མིའི་དྲིན་ཅན་ཅིག་དང་། རང་འཛམ་བུ་གླིང་ནང་ སྐྱེས་ཚར་བའི་ཤུལ་ལུ་འབད་རུང་ ལྟོཝ་བཀྱེས་ ཁ་སྐོམ་ལུས་མ་བཅུག། དེ་བཟུམ་སྦེ་ ཚཝ་མེ་ནང་མ་བཙུགས། གྱངམ་ཆུ་ནང་མ་བཙུགས། བཅུད་པའི་ཨོམ་བྱིན། བརྩེ་བའི་སེམས་ཀྱིས་སྐྱོང། བྱམས་པའི་མིག་ཏོ་གིས་བལྟ། དགའ་བའི་འཛུམ་གྱིས་བསུ་སྟེ་ གཅེས་གཅེས་ཕངས་ཕངས་སྦེ་གསོ། དེ་ལས་རིམ་པ་བཞིན་དུ་ ཁ་སླབ་ཤེསཔ་ཙམ་ཅིག་འགྱོ་བའི་བསྒང་ལས་ ཟ་ཐངས་འཐུང་ཐངས་དང་ འགྱོ་ཐངས་སྡོད་ཐངས་ལས་འགོ་བཙུགས་ཏེ་ ལམ་སྟོན་བསླབ་བྱ་ཆ་ཚང་ཅིག་སྟོན་བྱིནམ་མ་ཚད། ཨ་ལུ་འདི་སློབ་གྲྭ་ནང་འགྱོ་ཚུགས་པའི་ནམ་དུས་ལས་ རོགས་དང་འདྲན་འདྲ་ཤེས་ཡོན་བྱིན་ནིའི་དོན་ལུ་ རང་ལུ་མེད་རུང་རོགས་ལས་འཚོལ་ཏེ་ དྲོ་པ་དཀར་གྱིས་བཅད་ ཕྱི་རུ་གནག་གིས་བཅད་དེ།ཉལ་རུང་གཉིད་མེད་ ཟ་རུང་བཅུད་མེད་པར་དཀའཝ་སྤྱད། མཐའ་མར་བུ་གཞི་རྐང་ཐང་འདྲོངས་ཏེ་ མི་གྲལ་ཚུད་སོ་རུང་ཕམ་ཁོང་ར་གིས་མི་ཚེ་གཅིག་ དཀའཝ་སྤྱད་དེ་བསྒྲུབས་བསྒྲུབས་པའི་ རྒྱུ་ནོར་ལོངས་སྤྱོད་ལྷག་ལུས་ཡོད་མི་ཚུ་ཡང་ ག་ར་སེར་སྣ་དང་ཕངས་སེམས་མེད་པར་ བུ་གཞི་ལུ་སྐལཝ་བགོ་བཤའ་སྦེ་ བགོ་བྱིནམ་ཨིནམ་ལས་ རང་ལུ་བཀའ་དྲིན་བསམ་གྱིས་མི་ཁྱབ་པ་ཅིག་ཨིན།

རྒྱུ་མཚན་དེ་ལས་བརྟེན་ སྟོན་པ་རྫོགས་པའི་སངས་རྒྱས་ ལྷ་ཡུལ་སུམ་ཅུ་རྩ་གསུམ་ལུ་འབྱོན་དགོ་མི་དེ་ཡང་ ཕམ་དྲིན་ཆེ་བའི་རྒྱུ་མཚན་དང་། སྐྱབས་རྗེ་མཆོག་གིས་ རྒྱལ་བ་ལྷ་ལས་བབས་པའི་དུས་ཆེན་འདི་ ཕ་མའི་དུས་ཆེན་སྦེ་བརྩི་སྲུང་མཛད་དགོ་མི་འདི་ཡང་ ཕམ་དྲིན་ཆེ་བའི་རྒྱུ་མཚན་ལས་བརྟེན་ཏེ་ ཨིན་མས་ཟེར་ཞུ་ནི་ཨིན། ང་བཅས་ར་འཇིག་རྟེན་འདི་ནང་ རང་ལུ་གནས་སྐབས་ཅིག་ ཕན་བཏགས་མིའི་མི་ལུ་ཡང་ ལོག་དགའ་ཚོར་བསྐྱེད་དེ་དྲིན་ལན་འཇལ་སྲོལ་ཡོད་པ་ཅིན་ རང་གི་ཕམ་འདི་ དེ་གི་དོ་མེནམ་ལས་ ངེས་པར་དུ་དྲིན་ལན་འཇལ་དགོཔ་ཨིན། དྲིན་ལན་འཇལ་ཐངས་དེ་ཡང་ གཙོ་བོ་ར་ ཁོང་ཕམ་ཚུ་ལོ་ན་རྒས་པའི་སྐབས་སུ་ བུ་གཞི་ཚུ་གིས་སྣང་མེད་སྦེ་ རྒྱབ་ཁར་བཀོ་མ་བཞག་པར་ བདག་འཛིན་འཐབ། ངོ་རྒོལ་མ་འབད་བར་ གུས་ཞབས་དང་བརྩི་བཀུར་གྱི་ཐོག་ལས་ ཅི་ལྕོགས་གང་ལྕོགས་སྦེ་ ཞབས་ཏོག་ཞུ་དགོཔ་ཨིན།

ཨིན་རུང་ དུས་ཀྱི་འགྱུར་བ་དང་བསྟུན་ ལེགས་བཤད་ལས། “ཇི་ལྟར་ཕ་མས་བུར་བྱམས་པ། །དེ་ལྟ་བུ་ཚས་ཕ་མར་མིན། །ཕ་མས་བུ་ཚ་བསྐྱངས་བསྐྱངས་ནས། །ཕ་མ་རྒས་ནས་བུ་ཚས་བརྙས།།” ཟེར་གསུང་དོཝ་བཟུམ་སྦེ་ ད་རེས་ནངས་པ་མི་རིགས་གཞན་གྱི་ ལྟ་བ་དང་ལམ་སྲོལ་ལུ་ཤུགས་ཐལ་ཞིནམ་ལས་ རང་གི་ཕ་མའི་བཀའ་དྲིན་སེམས་ཁར་དྲན་ཏེ་ དྲིན་ལན་འཇལ་ནི་

ཕར་བཞག་ “རྟ་གསོ་བའི་དྲིན་ལན་རྡོག་པས་འཇལ།།” ཟེར་བའི་དཔེ་བཟུམ་སྦེ་ དྲིན་ལན་ཚུལ་བཞིན་མ་འཇལ་བར་ ཕམ་ལུ་ངོ་རྒོལ་འབད་ནི་དང་། དེ་བཟུམ་སྦེ་ ཕམ་ལོ་ན་རྒས་པའི་སྐབས་ལུ་ ཁྱིམ་ནང་གོ་དོག་སྟེ་ རྒན་གསོ་ཁང་ཚུ་ནང་བསྐྱལ་བཞག་ནི། ལ་ལུ་ཅིག་གིས་ ཁྱིམ་ནང་བཞག་རུང་ “ཕ་རྒས་ན་ནོར་རྫི། །མ་རྒས་ན་བུ་རྫི།།” ཟེར་བའི་དཔེ་བཟུམ་སྦེ་ ཨ་པ་ནོར་འཚོ་བཅུག་ ཨའི་ཨ་ལུ་བལྟ་བཅུག་སྦེ་ ལོག་སྟེ་ཕམ་དཀའཝ་སྤྱད་དགོ་པའི་གནས་སྟངས་དང་། མཆོད་རྟེན་དང་ལྷ་ཁང་ལ་སོགས་པའི་ས་ཁོངས་ཚུ་ནང་ ཕམ་རྒན་རྒས་བདག་མེད་སྦེ་ བཀོ་བཞག་སྟེ་དཀའ་སྡུག་མྱོངས་པའི་གནས་སྟངས། ལ་ལུ་ཅིག་གིས་རང་གི་ཕམ་ལུ་ ཕམ་ཨིན་ཟེར་སླབ་ནི་ལུ་ཡང་ ངོ་ཚ་བའི་གནས་སྟངས། ལ་ལུ་ཅིག་གིས་ “གོ་རང་གིས་མ་ཆོད། །ཡུས་ཕ་མར་བདར།།” ཟེར་བའི་དཔེ་བཟུམ་སྦེ་ ཕམ་ལུ་སྡུག་རྩུབ་སྟོན་ཏེ་ དཀའ་ངལ་བྱིན་པའི་གནས་སྟངས། ལ་ལུ་ཅིག་གིས་རང་གི་ཕམ་ལུ་ གུས་བཀུར་དང་བརྩི་མཐོང་མེད་པའི་ གནས་སྟངས་རྣམ་པ་སྣ་ཚོགས་ཚུ་ལུ་བལྟ་བ་ཅིན་ ང་བཅས་རའི་མི་སྡེ་ནང་ དཀའ་ངལ་སྦོམ་ཅིག་དང་ བློ་ཕམ་བསྐྱེད་དགོ་པའི་ གཞི་ཅིག་ལུ་གྱུར་དེས་ཟེར་ཞུ་ནི་ཨིན།

དཀའ་ངལ་དེ་ཡང་ དང་པ་ཕམ་གིས་སླབ་མི་ བུ་གཞི་གིས་ཉན་མ་བཏུབ་པའི་ དུས་ངན་སྙིགས་མ་ལྔ་བདོ་ཨིན་པའི་རྟགས་མཚན་དང་། གཉིས་པ་རང་གི་རྒྱལ་ཁབ་ནང་ མི་རིགས་གཞན་དང་གཞན་གྱི་ ལྟ་བ་དང་ལམ་སྲོལ་དར་བའི་ཤུགས་རྐྱེན།གསུམ་པ་ཕྱི་དངོས་པོའི་དཔལ་འབྱོར་ལུ་ ཆགས་སེམས་ཆེ་བའི་སྐྱོན། བཞི་པ་རང་གི་སྔར་སྲོལ་ལམ་ལུགས་ཚུ་ རྒྱབ་ཁར་བཞག་སྟེ་ བརྩི་མཐོང་དང་ལག་ལེན་མེད་པའི་སྐྱོན། ལྔ་པ་ཟེརཝ་ད་ རང་གི་ཆོས་དང་རིག་གཞུང་ལུ་སྦྱང་བརྩོན་ཆུང་བ་དང་ལམ་སྟོན་བསླབ་བྱ་ཚུ་ མ་ཐོབ་པའི་སྐྱོན་ལས་བརྟེན་ཏེ་ ཨིན་མས་ཟེར་ཞུ་ནི་ཨིན།།"""

TR = """Her Majesty the Gyalyum Sangay Choden Wangchuck, the Royal Patron of RENEW (Respect, Educate, Nurture and Empower Women) concluded a two-day advocacy on women and girl’s empowerment, and public health in Tsirang.

Over 400 people from 12 gewogs of Tsirang, including local government officials attended the advocacy programme.

The objective of the advocacy was to create awareness on women and girl’s empowerment, and public health including sexual and reproductive health and rights.

Health ministry officials presented public health concerns around communicable, non-communicable diseases, and mental health.

The Director of the Department of Public Health, Karma Jamtsho, said that major risk factors are alcohol, tobacco, unhealthy diet and physical inactivity. The public was sensitized on how to live a healthy life and encouraged to seek support from relevant healthcare providers."""


def mcq(key, stem, opts, ans, exp):
    return dict(key=key, real=True, type=M, topic="General knowledge", stem=stem, opts=opts, ans=ans, exp=exp)


Q = [
dict(key="A1", real=True, type=CS, marks=10, topic="Case study", group=G1, pos=1, stem=CASE + """

Question 1
Take a close reference to the six pillars of character and explain any four pillars that best fit your personality. The explanation must translate your daily conduct either from professional practice or personal life. (10 marks)""",
     key_points=[("Four pillars correctly named from the six (trustworthiness, respect, responsibility, fairness, caring, citizenship)", 2),
                 ("Each of the four explained with a concrete example from own work or life (2 marks each)", 8)],
     model="""The six pillars of character are trustworthiness, respect, responsibility, fairness, caring and citizenship. Four that best describe me are:

Trustworthiness: I keep my word. If I promise a colleague to finish a report by Friday, I finish it, and I never cover up my mistakes; I tell my supervisor honestly.

Responsibility: I arrive on time, complete my share of team work and do not leave it to others, unlike Lyndell in the case. When I make an error, I accept it and correct it.

Respect: I listen to the views of colleagues and elders, speak politely to everyone who comes to the office, and respect rules and other people's time.

Caring: I notice when a friend or colleague is overloaded and offer to help, as Cindie did, and I thank people who help me.

These values guide my conduct both at work and at home."""),
dict(key="A2", real=True, type=CS, marks=10, topic="Case study", group=G1, pos=2, stem="""Question 2
One of the lines in the last paragraph reads 'Refusing to grant his request would have led to a minor disagreement that would have led to a more conducive work environment'.
How does minor disagreement lead to a conducive working ambience? Examine TWO values that are common in Bhutanese leaders which would lead to positive behavioural change in their staff. (10 marks)""",
     key_points=[("Explains how a small, honest disagreement early sets boundaries, prevents exploitation and resentment, improves communication and fairness", 4),
                 ("Value 1 explained with how it changes staff behaviour (e.g. leading by example / integrity - tha damtshig, ley jumdrey)", 3),
                 ("Value 2 explained (e.g. compassion and care; fairness and accountability; humility)", 3)],
     model="""A minor disagreement, handled politely, clears the air early. Had Cindie refused at once, Lyndell would have known that leaving early was unacceptable. The small conflict would have set clear boundaries, prevented him from exploiting her again and again, and avoided the resentment and overwork that built up later. Honest communication creates fairness and trust, which is what a conducive workplace needs.

Two values common among Bhutanese leaders can change staff behaviour:

Leading by example (integrity, tha damtshig): when leaders arrive on time, follow the rules and serve with honesty, staff see that values are practised, not only preached, and they follow.

Compassion with accountability: good Bhutanese leaders care for their staff like family, listen to their problems and support them, but also hold them responsible for their work. Staff who feel cared for are motivated, and clear accountability stops behaviour like Lyndell's."""),
dict(key="A3", real=True, type=CS, marks=10, topic="Case study", group=G1, pos=3, stem="""Question 3
What ethical reasoning does the author develop from this case with regards to individual behaviour at the workplace? (10 marks)""",
     key_points=[("Ethical character (six pillars) is essential to a conducive workplace; lack of it harms colleagues", 3),
                 ("Moral development stages (Kohlberg) explain how Cindie moved from avoiding conflict to doing what is right - speaking to management", 3),
                 ("Personal values must sometimes give way to firmness: being too lenient lets others exploit you; be firm early, communicate", 4)],
     model="""The author's reasoning has three parts.

First, ethical character is essential at work. Using the six pillars, the author shows that Lyndell is untrustworthy, uncaring, unfair, irresponsible and disrespectful, and that this creates a poor work environment, while Cindie shows all six pillars.

Second, using Kohlberg's stages of moral development, the author explains how Cindie's thinking matured: at first she obeyed to avoid conflict, then she recognised the rules, worked to please the customers, saw that Lyndell's actions were wrong and, after a dilemma, did what was right by speaking to the management.

Third, the author argues that good values alone are not enough: being too tolerant allowed Lyndell to exploit Cindie repeatedly. Individuals should be firm from the start, communicate openly and accept a small disagreement for the sake of fairness. In short, ethical behaviour means both living by good values and standing up for them."""),
dict(key="B1", real=True, type=TOP, marks=10, topic="Topical issues: culture and media", stem="""The Bhutan InfoComm and Media Authority (BICMA) recently notified about the process of selecting a film for submission to the Academy Awards (Oscars) in the category of "International Feature Film Award". Discuss if the Bhutanese film industry is competent to contest in the international awards. (10 marks)""",
     key_points=[("Clear stand", 2), ("Evidence of competence (Lunana: A Yak in the Classroom Oscar nomination 2022; The Monk and the Gun; unique stories, landscapes, culture)", 4),
                 ("Limitations (small market, funding, technical skills, few cinemas, commercial focus)", 2), ("Suggestions to compete better", 2)],
     model="""I believe the Bhutanese film industry is competent to contest, though it still needs support.

Bhutanese films have already proved themselves: "Lunana: A Yak in the Classroom" was nominated for the Oscar for Best International Feature Film in 2022, and "The Monk and the Gun" premiered at international festivals. Our unique culture, values and landscapes give Bhutanese filmmakers stories that the world has not seen.

However, the industry is small. Most local films are made on very small budgets for a limited domestic market, there are few cinemas, and training in scripting, cinematography, sound and editing is limited.

To compete regularly, the government and private sector could provide film funds, training and co-productions with international studios, and filmmakers should focus on authentic stories and high technical quality. With such support, Bhutanese films can continue to win international recognition."""),
dict(key="B2", real=True, type=TOP, marks=10, topic="Topical issues: environment", stem="""As per Kuensel dated 15 December 2022, fines and penalties for waste offences have been revised. To what extent do you agree that increasing fines has encouraged people to manage their own waste and made them more cautious of waste management policy? Give reasons for your answer and include any relevant examples from your own knowledge or experience. (10 marks)""",
     key_points=[("Clear stand (e.g. partly agree)", 2), ("How fines help (deterrence, awareness, examples such as littering fines, segregation rules)", 3),
                 ("Limits of fines (weak enforcement, lack of bins/collection, attitude, rural areas)", 3), ("Other measures needed with examples", 2)],
     model="""I agree only partly.

Higher fines do make people think twice before throwing waste on roads or into rivers, especially in towns where officials and desuups monitor public places. News of fines also spreads awareness of the Waste Prevention and Management rules.

However, fines alone cannot change habits. Enforcement is difficult because officials cannot watch every place, and littering still continues on highways, picnic spots and riversides. In many areas there are not enough bins, segregation facilities or regular collection, so even willing people struggle to dispose of waste properly.

Lasting change needs more than fines: segregation at source, regular collection and recycling businesses, deposit schemes for bottles, cleaning campaigns by schools and communities, and teaching children that keeping Bhutan clean is part of our values. Fines work best as a backup to these measures."""),
dict(key="B3", real=True, type=TOP, marks=10, topic="Topical issues: international relations", stem="""One topic recently discussed at the United Nations is the promotion of international peace and security. As a member of the UN, how has Bhutan contributed towards both national and international peacekeeping? Justify with two valid reasons. (10 marks)""",
     key_points=[("Contribution 1: UN peacekeeping missions (RBA and RBP personnel since 2014, e.g. in Africa and the Middle East)", 4),
                 ("Contribution 2: peaceful national policies and diplomacy (GNH, Gyalsung/De-suung service, peaceful foreign policy, support for UN resolutions)", 4), ("Justification/conclusion", 2)],
     model="""Bhutan contributes to peace in two main ways.

First, internationally, Bhutan has sent officers of the Royal Bhutan Army and Royal Bhutan Police to UN peacekeeping missions since 2014, serving in places such as South Sudan, the Central African Republic and Lebanon. Our personnel are known for discipline and compassion, and this shows Bhutan's commitment as a responsible UN member despite its small size.

Second, at home and in diplomacy, Bhutan promotes peace through its values and policies: the philosophy of Gross National Happiness, a peaceful foreign policy based on friendship with all nations, and national service programmes such as De-suung and Gyalsung that build volunteers ready to help in disasters and emergencies. Bhutan also supports UN resolutions on peace, disarmament and climate security.

These contributions show that even a small country can promote peace and security at home and abroad."""),
mcq("C1", "How many permanent members does the UN Security Council have?", ["Fifteen", "Five", "Ten", "Eight"], 1, "The five permanent members are China, France, Russia, the UK and the USA."),
mcq("C2", "An octopus has", ["one heart.", "two hearts.", "three hearts.", "eight hearts."], 2, "An octopus has three hearts."),
mcq("C3", "In 2022, the Asahi Glass Foundation of Japan awarded __________ to His Majesty Jigme Singye Wangchuck.", ["the Nobel Laureate", "the Nobel Peace Prize", "the Liberation War Honour", "the Blue Planet Prize"], 3, "His Majesty the Fourth Druk Gyalpo received the Blue Planet Prize in 2022."),
mcq("C4", "The book 'The Tibetan Book of Living and Dying' was written by", ["Dzongsar Khyentse Rinpoche", "Kalu Rinpoche", "Dalai Lama", "Sogyal Rinpoche"], 3, "It was written by Sogyal Rinpoche (1992)."),
mcq("C6", "Name the currency of South Korea.", ["Yen", "Won", "Taka", "Kyat"], 1, "South Korea's currency is the won."),
mcq("C7", "With the transformation of the civil service, the number of ministries in the civil service is", ["7", "8", "9", "10"], 2, "After the 2022 restructuring there are nine ministries."),
mcq("C8", "Who looks after the legal matters pertaining to the Government?", ["The Royal Civil Service Commission", "The Anti-Corruption Commission", "His Majesty's Secretariat", "The Office of the Attorney General"], 3, "The Office of the Attorney General is the government's legal adviser and representative."),
mcq("C10", "Which of the following is NOT an international organisation?", ["ASEAN", "NATO", "FIFA", "FBI"], 3, "The FBI is a US national agency."),
mcq("C12", "The movie 'The Monk and the Gun' made its premiere at the", ["Oscar", "Smithsonian", "Telluride", "Cannes"], 2, "It premiered at the Telluride Film Festival in 2023."),
mcq("C14", "What is the official slogan of the Olympic and Paralympic Games Paris 2024?", ["For the game. For the World", "Games wide open", "United by Emotion", "Living the Future"], 1, "Paris 2024's slogan was 'Games Wide Open' (Ouvrons grand les Jeux)."),
mcq("C15", "The summer Olympic Games of 2024, 2028 and 2032 are held, in order, in", ["USA, France and Australia", "Australia, USA and France", "France, USA and Australia", "France, Australia and USA"], 2, "Paris 2024, Los Angeles 2028, Brisbane 2032."),
mcq("C16", "His Holiness Trulku Jigme Chhoeda was enthroned as the 70th Je Khenpo in the year", ["1995", "1996", "1997", "1998"], 1, "His Holiness was enthroned as the 70th Je Khenpo in 1996."),
mcq("C17", "Which of these currencies has the highest value against the Ngultrum / Indian Rupee?", ["Euro", "Pound Sterling", "Kuwaiti Dinar", "United States Dollar"], 2, "The Kuwaiti dinar is the highest-valued currency unit in the world."),
mcq("C18", "His Majesty the First King introduced western education by sending 46 boys to Dr. Graham's Homes, Kalimpong, and by opening a school in Haa in the year", ["1900", "1910", "1914", "1947"], 2, "The first western-style schools, including Haa, were started in 1914."),
mcq("C19", "The CEO of the social media platform TikTok (2023) is", ["Ma Huateng", "Shou Zi Chew", "Evan Spiegel", "Jan Koum"], 1, "Shou Zi Chew has been TikTok's CEO since 2021."),
mcq("C20", "Edwin Howard Armstrong was the inventor of", ["Television", "Compact discs", "FM radio", "Broadband"], 2, "Armstrong invented FM (frequency modulation) radio."),
dict(key="D1", real=True, type=C, marks=8, topic="Dzongkha comprehension", issues=[DZ], group=D1, pos=1, stem=DZP + """

ལྟག་གི་ཡིག་རྒྱུགས་ལྷག་ཞིནམ་ལས་ དྲི་བ་ ཀ་ ཁ་ ག་ ང་ བཞི་གི་ལན་བྲིས།

དྲི་བ་ ཀ། ལན་ཐུང་ཀུ། འོག་གི་དྲི་བ་ག་ར་གི་ ལན་བྲིས། (སྐུགས་ ༨)
༡༽ རང་གི་ཕམ་གཉིས་ དྲིན་ཆེ་བའི་གནད་དོན་གཉིས་ཐོ་བཀོད་འབད། (༡)
༢༽ ཕམ་ལོ་ན་རྒས་པའི་སྐབས་ལུ་ བུ་གཞི་ལ་ལུ་ཅིག་གིས་ རྒན་གསོ་ཁང་ཚུ་ནང་བསྐྱལ་དགོ་པའི་རྒྱུ་མཚན་ག་ཅི་སྨོ? (༡)
༣༽ "དྲོ་པ་དཀར་གྱིས་བཅད། ཕྱི་རུ་གནག་གིས་བཅད།" ཟེར་བའི་དོན་དག་ཁ་གསལ་སྦེ་བྲིས། (༢)
༤༽ ཨ་ལུ་ཚུ་གིས་ ཕམ་ལུ་ངོ་རྒོལ་འབད་མི་འདི་ ལམ་སྟོན་བསླབ་བྱ་ཚུ་མ་ཐོབ་པའི་སྐྱོན་ལས་བརྟེན་ཏེ་ཨིན་ཟེར་མི་ལུ་ ཁྱོད་ཀྱིས་ངོས་ལེན་ཡོད་ག? ག་ཅི་སྦེ? (༢)
༥༽ འཇིག་རྟེན་འདི་ནང་ལུ་ ཕམ་གཉིསཔོ་འདི་ ག་ནི་བ་དྲིན་ཅན་ཅིག་ཨིན། ཁྱོད་ཀྱིས་ དྲིན་ལན་ག་དེ་སྦེ་འཇལ་ནིའི་རེ་བ་ཡོད་གོ? གནད་དོན་གཉིས་ཐོ་བཀོད་འབད་དེ་ བཤད་པ་རྐྱབ། (༢)""",
     key_points=[("༡ མིའི་ལུས་རྟེན་ བྱིན་མི། བྱམས་བརྩེ་གིས་ གསོ་སྟེ་ ཤེས་ཡོན་ བྱིན་མི། (གཉིས་)", 1), ("༢ ཁྱིམ་ནང་ གོ་དོག་པ་ (མི་རིགས་གཞན་གྱི་ ལམ་སྲོལ་ལུ་ ཤུགས་ཐལ།)", 1),
                 ("༣ ཉིན་མཚན་མེད་པར་ (སྔ་དྲོ་ལས་ ཕྱི་རུ་ཚུན་) དཀའཝ་སྤྱད་ཡོདཔ་ཨིན།", 2), ("༤ ངོས་ལེན་ཡོད/མེད་ རྒྱུ་མཚན་དང་བཅས།", 2), ("༥ དྲིན་ལན་འཇལ་ཐངས་ གཉིས་ བཤད་པ་དང་བཅས།", 2)],
     model="""༡ མིའི་ལུས་རྟེན་ རིན་པོ་ཆེ་ བྱིན་མི་དང་། བྱམས་བརྩེ་གིས་ གསོ་སྟེ་ ཤེས་ཡོན་ བྱིན་མི།
༢ ཁྱིམ་ནང་ གོ་དོག་ནི་དང་ མི་རིགས་གཞན་གྱི་ ལྟ་བ་དང་ ལམ་སྲོལ་ལུ་ ཤུགས་ཐལ་ཏེ་ ཕམ་གྱི་ བཀའ་དྲིན་ མ་དྲན་པའི་ རྒྱུ་མཚན་ལས་ཨིན།
༣ ཕམ་གྱིས་ བུ་གཞི་གི་དོན་ལུ་ སྔ་དྲོ་ ནམ་མ་ལངས་པའི་ཧེ་མ་ལས་ ཕྱི་རུ་ མུན་ནག་ཚུན་ཚོད་ ཉིན་མཚན་མེད་པར་ ལཱ་འབད་དེ་ དཀའཝ་སྤྱད་ཡོདཔ་ཨིན།
༤ ངོས་ལེན་ཡོད། ཨ་ལུ་ཚུ་ལུ་ ཆུང་ཀུ་ལས་ ཆོས་དང་ རིག་གཞུང་གི་ ལམ་སྟོན་བསླབ་བྱ་ མ་ཐོབ་པ་ཅིན་ ཕམ་གྱི་ བཀའ་དྲིན་ ཧ་མི་གོ་བར་ ངོ་རྒོལ་འབདཝ་ཨིན།
༥ (༡) ཕམ་ལོ་ན་རྒས་པའི་སྐབས་ ཁྱིམ་ནང་ བདག་འཛིན་འཐབ་སྟེ་ ཞབས་ཏོག་ཞུ་ནི། (༢) ཕམ་གྱི་ བཀའ་ ཉན་ཏེ་ གུས་ཞབས་དང་ བརྩི་བཀུར་གྱི་ ཐོག་ལས་ ཀུན་སྤྱོད་ བཟང་པོ་ བཞག་ནི།"""),
dict(key="D2", real=True, type=C, marks=4, topic="Dzongkha comprehension", issues=[DZ, "Items ༢ and ༤: Claude is not certain of the intended answers; a Dzongkha teacher must confirm."], group=D1, pos=2, stem="""དྲི་བ་ ཁ། ལན་གདམ་ཁ་ཅན། ལན་ངོ་མ་འདི་གདམ་ཁ་རྐྱབ་སྟེ་ ཀ་རྟགས་དང་སྦྲགས་ཏེ་ བྲིས། (སྐུགས་ ༤x༡=༤)
༡༽ "སེར་སྣ་དང་ཕངས་སེམས་" ཟེར་བའི་སྐབས་ སེར་སྣ་ཟེར་བའི་དོན་དག་འདི་ གཞན་ ...
ཀ) གྱི་གསེར་བདག་འཛིན་འབད་དེ་བཞག་མི་ལུ་སླབ་ཨིན།  ཁ) ལུ་བྱིན་མ་ནུམ་པར་བསྡམས་བཞག་མི་ལུ་སླབ་ཨིན།  ག) ལུ་ཡོད་མི་རང་ལུ་དགོ་པའི་སེམས་ལུ་སླབ་ཨིན།  ང) ལུ་ཕངས་སེམས་བསྐྱེད་མི་ལུ་སླབ་ཨིན།
༢༽ གོང་གི་འབྲི་རྩོམ་འདི་ལུ་ འོས་འབབ་ཡོད་པའི་ མིང་ཅིག་བཏགས་པ་ཅིན་ ...
ཀ) ཕམ་དང་བུ་གཞིའི་མཐུན་འབྲེལ།  ཁ) ཕ་རྒས་པར་བལྟ་སྟེ་བུ་གསོ།  ག) ཕ་མའི་དཀའ་སྡུག།  ང) ཕ་མའི་ཞབས་ཏོག།
༣༽ སྟོན་པ་རྫོགས་པའི་སངས་རྒྱས་ ལྷ་ཡུལ་སུམ་ཅུ་རྩ་གསུམ་ལུ་ འབྱོན་དགོ་པའི་རྒྱུ་མཚན་འདི་ ...
ཀ) ཡུམ་ཐུགས་དགྱེས་བཅུག་ནིའི་དོན་ལུ་ཨིན་པས།  ཁ) ཕ་མའི་དྲིན་ལན་འཇལ་ནིའི་དོན་ལུ་ཨིན་པས།  ག) ལྷ་ཚུ་ལུ་ཆོས་གནང་ནིའི་དོན་ལུ་ཨིན་པས།  ང) ལྷ་ཚུ་གི་དོན་མཛད་ནིའི་དོན་ལུ་ཨིན་པས།
༤༽ མི་སྡེའི་ནང་ལུ་ དཀའ་ངལ་དང་ བློ་ཕམ་སི་སི་ཅིག་ལུ་ཐུག་དགོ་མི་འདི་ ...
ཀ) རྒན་གཞོན་བར་ན་གུས་བཀུར་དང་བརྩི་མཐོང་ཞནམ་ལས་བརྟེན་ཨིན་པས།  ཁ) གོངམ་དང་འོགམ་གི་བར་ན་ཐ་དམ་ཚིག་ཆུངམ་ལས་བརྟེན་ཨིན་པས།  ག) དྲིན་ལན་ལོག་པ་སྦེ་འཇལཝ་ལས་བརྟེན་ཨིན་པས།  ང) བཀའ་དྲིན་བསམ་མ་ཤེསཔ་ལས་བརྟེན་ཨིན་པས།""",
     key_points=[("༡ (ཁ)", 1), ("༢ (ཁ) - to confirm", 1), ("༣ (ཁ)", 1), ("༤ (ཀ) - to confirm", 1)],
     model="༡ (ཁ)  ༢ (ཁ) [to confirm]  ༣ (ཁ)  ༤ (ཀ) [to confirm]"),
dict(key="D3", real=True, type=C, marks=3, topic="Dzongkha comprehension", issues=[DZ], group=D1, pos=3, stem="""དྲི་བ་ ག། འོག་གི་མིང་ཚིག་ཚུ་གི་ རྗོད་ཚིག་བྲིས། (ལྟག་གི་ཡིག་རྒྱུགས་ནང་ལས་ འདྲ་བཤུས་ཕབ་མི་ཆོག) (སྐུགས་ ༣)
༡༽ སྣང་མེད།  ༢༽ བྱམས་བརྩེ།  ༣༽ བརྩི་སྲུང་།  ༤༽ བརྩི་བཀུར།  ༥༽ གོ་དོག།  ༦༽ ཤན་ཞུགས།""",
     key_points=[("ཚིག་ ༦ ལུ་ རྗོད་ཚིག་ ཀྲིག་ཀྲི་ (ཚིག་རེ་ལུ་ ༠.༥)", 3)],
     model="""༡ སློབ་ཕྲུག་ལ་ལུ་གིས་ སློབ་དཔོན་གྱི་ བསླབ་བྱ་ལུ་ སྣང་མེད་སྦེ་ བཞགཔ་ཨིན།
༢ ཨམ་གྱིས་ ཨ་ལུ་ལུ་ བྱམས་བརྩེ་ ཆེ་ཏོག་ཏོ་སྦེ་ བལྟཝ་ཨིན།
༣ ང་བཅས་ཀྱིས་ ལོ་ལྟར་ རྒྱལ་ཡོངས་དུས་ཆེན་ བརྩི་སྲུང་ཞུཝ་ཨིན།
༤ ན་གཞོན་ཚུ་གིས་ རྒན་ཤོས་ཚུ་ལུ་ བརྩི་བཀུར་ འབད་དགོ།
༥ ཁྱིམ་འདི་ མི་ལེ་ཤ་ཅིག་གི་དོན་ལུ་ གོ་དོག་སོ་ཡི།
༦ ཁྲིམས་ཀྱི་ གནད་དོན་ནང་ ཕྱི་མི་གིས་ ཤན་ཞུགས་ འབད་མི་ཆོག།"""),
dict(key="D4", real=True, type=C, marks=5, topic="Dzongkha comprehension", issues=[DZ, "The paragraph shows six likely mistakes for five marks; accept any five of the six listed."], group=D1, pos=4, stem="""དྲི་བ་ ང་། འོག་གི་དོན་མཚམས་འདི་ལྷག་སྟེ་ ཡིག་སྡེབ་འཛོལ་བ་ ༥ ཡོད་མི་ཚུ་ ངོས་འཛིན་འབད་ཞིནམ་ལས་ སྡེབ་བཅོས་ཁ་རྐྱབ་སྟེ་ བྲིས། (སྐུགས་ ༡x༥=༥)
མི་དབང་མངའ་བདག་རིན་པོ་ཆེའི་ཐུགས་ཀྱི་མཁྱེན་བྱ་ཆེ་བའི་ སྲིད་རྒྱུས་བཟང་པོ་ལས་བརྟེན་ ང་བཅས་རའི་རྒྱལ་ཁབ་ཀྱི་རང་དབང་རང་བཙན་དང་བསྲུང་སྐྱོབ་དེ་ ད་རེས་བཟུམ་མའི་མཐའ་བཙན་ཏོག་ཏོ་འདི་ འབྲུག་རྒྱལ་ཁབ་འདི་གི་འདས་པའི་བརྒྱལ་རབས་ནང་ དུས་ནམ་ཡང་མ་འབྱུང་པས། དེ་ལས་བརྟེན་ཏེ་ མི་སྡེའི་སྤེལ་འབྱོར་གོང་འཕེལ་གྱི་གྲུབ་འབྲས་ཚུ་ གཞུང་དང་མི་སེར་གྱི་ཐུགས་ཀྱི་རེ་བ་ལྟར་དུ་ འགྲུབ་ཚུགས་མི་འདི་ཡང་ གཙོ་བོ་ར་མི་དབང་མཆོག་གིས་ རྒྱལ་ཁབ་ཀྱི་རང་དབང་སྲུང་སྐྱོབ་འདི་མཐའ་བཙན་ཏོག་ཏོ་བཟོ་གནང་བའི་བཀའ་དྲིན་ཁོ་ན་ལས་བརྟེན་ཏེ་ཨིན།""",
     key_points=[("མཁྱེན་བྱ → མཁྱེན་རྒྱ", 1), ("སྲིད་རྒྱུས → སྲིད་བྱུས", 1), ("བསྲུང་སྐྱོབ → སྲུང་སྐྱོབ", 1), ("བརྒྱལ་རབས → རྒྱལ་རབས", 1), ("སྤེལ་འབྱོར → དཔལ་འབྱོར (also accept མ་འབྱུང → མ་བྱུང)", 1)],
     model="མཁྱེན་བྱ → མཁྱེན་རྒྱ། སྲིད་རྒྱུས → སྲིད་བྱུས། བསྲུང་སྐྱོབ → སྲུང་སྐྱོབ། བརྒྱལ་རབས → རྒྱལ་རབས། སྤེལ་འབྱོར → དཔལ་འབྱོར། (མ་འབྱུང → མ་བྱུང)"),
dict(key="T1", real=True, type=T, marks=10, topic="Translation: English to Dzongkha", issues=[DZ], stem="""འོག་གི་ཨིང་སྐད་ནང་ཡོད་མི་དོན་མཚམས་འདི་ ལེགས་ཤོམ་སྦེ་ལྷག་ཞིནམ་ལས་ རྫོང་ཁའི་ཐོག་ལུ་ སྐད་སྒྱུར་འབད། (གནད་དོན་ཕོག་མ་ཕོག་དང་ གོ་རིམ་ སྡེབ་སྦྱོར་ཚུ་ལུ་ བལྟ་སྟེ་ སྐུགས་བྱིན་ནི་ཨིན།) (སྐུགས་ ༡༠)

""" + TR,
     key_points=[("གནད་དོན་ཕོག་མ་ཕོག་ - དོན་ཚན་ཆ་ཚང་ མ་ལུས་པར།", 5), ("མཚན་ ཞེ་ས་ ཨང་གྲངས་ (༤༠༠། རྒེད་འོག་ ༡༢) ངོ་མ་བཟུམ།", 2), ("གོ་རིམ་དང་ སྡེབ་སྦྱོར་ བརྡ་སྤྲོད།", 3)],
     model="""RENEW (བུད་མེད་ལུ་ བརྩི་མཐོང་ ཤེས་ཡོན་ གསོ་སྐྱོང་ ནུས་ཤུགས་སྤྲོད་) གི་ རྒྱལ་ཡོངས་རྒྱབ་སྐྱོར་པ་ རྒྱལ་ཡུམ་ སངས་རྒྱས་ཆོས་སྒྲོན་དབང་ཕྱུག་མཆོག་གིས་ རྩི་རང་ལུ་ བུད་མེད་དང་ བུམོ་ཚུ་ལུ་ ནུས་ཤུགས་སྤྲོད་ནི་དང་ མི་མང་འཕྲོད་བསྟེན་གྱི་ སྐོར་ལས་ ཉིན་གཉིས་ཀྱི་ ཤེས་ཚོར་ལས་རིམ་ མཇུག་བསྡུ་གནང་ཡི།

ཤེས་ཚོར་ལས་རིམ་དེ་ནང་ རྩི་རང་གི་ རྒེད་འོག་ ༡༢ ལས་ ས་གནས་གཞུང་གི་ འགོ་དཔོན་ཚུ་ བརྩིས་ཏེ་ མི་ ༤༠༠ ལྷག་ཞུགས་ཡི།

ལས་རིམ་གྱི་ དམིགས་དོན་འདི་ བུད་མེད་དང་ བུམོ་ཚུ་ལུ་ ནུས་ཤུགས་སྤྲོད་ནི་དང་ སྐྱེ་མཆེད་འཕྲོད་བསྟེན་དང་ ཐོབ་དབང་ བརྩིས་པའི་ མི་མང་འཕྲོད་བསྟེན་གྱི་ སྐོར་ལས་ ཤེས་ཚོར་བྱིན་ནི་ཨིན།

འཕྲོད་བསྟེན་ལྷན་ཁག་གི་ འགོ་དཔོན་ཚུ་གིས་ འགོ་བའི་ནད་དང་ འགོ་མེད་ནད་ དེ་ལས་ སེམས་ཁམས་འཕྲོད་བསྟེན་གྱི་ དཀའ་ངལ་ཚུ་ གསལ་སྟོན་འབད་ཡི།

མི་མང་འཕྲོད་བསྟེན་ལས་ཁུངས་ཀྱི་ ལས་ཁུངས་འགོ་དཔོན་ ཀརྨ་འཇམ་མཚོ་གིས་ ཉེན་ཁ་ཅན་གྱི་ རྒྱུ་རྐྱེན་ གཙོ་བོ་ཚུ་ ཆང་ ཏ་མ་ཁུ་ བཟའ་འཐུང་ ཕན་མེད་ དང་ ལུས་སྦྱོང་ མེདཔ་ཚུ་ཨིན་ཟེར་ སླབ་ཡི། མི་མང་ལུ་ འཕྲོད་བསྟེན་ཅན་གྱི་ འཚོ་བ་ ག་དེ་སྦེ་ སྐྱོང་ནི་ཨིན་ན་ ཤེས་ཚོར་བྱིན་ཏེ་ འཕྲོད་བསྟེན་ཞབས་ཏོག་པ་ཚུ་ལས་ རྒྱབ་སྐྱོར་ ཞུ་དགོ་ཟེར་ ཧུར་སྐུལ་འབད་ཡི།"""),
]
