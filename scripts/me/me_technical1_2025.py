"""ME Technical category Paper I (Language and General Knowledge), batch 1: the RCSC BCSE 2025 paper plus a second
set of questions of the same kinds. PDF sent by the founder (20 Nov 2026; the RCSC site blocked downloads).

Pattern (RCSC BCSE 2025, Technical, Paper I): 3 hours writing + 15 minutes reading; cover: "100 [70 marks for English
and GK; 30 marks for Dzongkha]".
  Section I case study: one passage, ALL three questions, 10 marks each (30).
  Section II topical discussion: answer ANY TWO of three, 10 marks each (20).
  Section III general knowledge: 20 multiple choice, 1 mark each (20).
  Section IV Dzongkha comprehension: one passage; ka 4 short answers x 2 (8), kha 4 multiple choice x 1 (4),
  ga sentences (3), nga find and correct 5 spelling mistakes (5) = 20 as printed.
  Section V translation English -> Dzongkha, 15.
NOTE: the printed section marks add up to 105 (Dzongkha 20 + 15 = 35, not the 30 on the cover). Kept as printed;
the founder has been told.
Left out of Section III (answer not certain or question flawed): Q13 (ATP No. 1 changed during 2025), Q18 (there was no
2022 FIBA World Cup), Q20 (HDI rank). Section IV kha item 2 has no confirmed answer (marked in the guide).
The Dzongkha PDF font adds a stray subjoined YA (སོན -> སྱོན); cleaned with dz_fix.fix_extra_ya. Dzongkha needs a
fluent reader's check before publishing.
"""

BATCH = "ME Paper I (Technical): BCSE 2025 + similar, batch 1"
GROUP_TAG = "2025b1"
PAPER = "me-technical-1"
SUBJECT = "language-general-knowledge"
MIN_WORDS = 0
SOURCE = {"title": "BCSE 2025 Main Examination, Technical category, Paper I (Language and GK)", "year": 2025,
          "url": "https://rcsc.gov.bt/technical-paper-1/"}

CS, TOP, M, C, T = "analytical", "long_answer", "mcq", "passage", "translation"
PATTERN = [
    {"title": "Section I: Case study", "type": CS, "count": 1, "marks_each": 30, "answer_any": None},
    {"title": "Section II: Topical discussion", "type": TOP, "count": 3, "marks_each": 10, "answer_any": 2},
    {"title": "Section III: General knowledge", "type": M, "count": 20, "marks_each": 1, "answer_any": None},
    {"title": "Section IV: Dzongkha comprehension (གོ་བ་ལེན་ནི།)", "type": C, "count": 1, "marks_each": 20, "answer_any": None},
    {"title": "Section V: Translation (སྐད་སྒྱུར།)", "type": T, "count": 1, "marks_each": 15, "answer_any": None},
]
RUBRIC = [
    ("Content and relevance", "Answers exactly what is asked with correct, relevant points (and evidence from the passage where asked).", 8),
    ("Analysis and examples", "Explains reasons and effects, gives Bhutanese examples and practical suggestions.", 5),
    ("Language", "Correct grammar, spelling and vocabulary (Dzongkha items: spelling and honorifics).", 4),
    ("Organisation", "Logical order, paragraphs or points.", 3),
]
DZ = "Dzongkha: please have a fluent Dzongkha reader check it before publishing."
PDF = "Real RCSC Dzongkha text from a PDF whose font adds stray letters; cleaned automatically: compare with the PDF."

CASE_1 = """Read the following passage and answer ALL THREE questions.

The Threat of NCDs - Case Study

In our current society, a sense of complacency and invincibility where people think they have time or that their body can take a few more years or a decade more of unhealthy living, is costing us dearly. People should first come to know with this reality. The traditional Bhutanese diet removed from its physically active rural living style, is an NCD diet.

The popular ema datshi is high in butter and fat, and worse, it can take dollops of salt and taste even better for it. Our shakham and sikam are not only bad for our stomach but also our cholesterol levels. Traditional Bhutanese diet has very little vegetables incorporated in it, except for chillies and some dried greens.

If the above is not bad enough, we all eat extra quantities of rice even three times a day, and while it tastes good, rice is the most inferior of all the grains. Rice is also a sugar delivery mechanism to the body explaining how even Bhutanese without sweet tooth get diabetes. The high proportion of red meat diet in Bhutanese cuisine may also explain our high cancer rates.

The habit of chewing doma kills taste cells in the tongue and it increases the propensity for salt intake which contributes in a major way to kidney related issues. Add to this, the increasing consumption of junk food and fizzy drinks is also a catalyst to NCD.

As more and more Bhutanese moves to urban areas, there is less space and time to exercise, and people are confined to their apartments. Childrens of Thimphu may be among the unhealthiest in the country with no space to play and move, which also contributes to a drug abusive culture.

We may not have realized it yet, but we are in the middle of an NCD epidemic and it is only getting worse. Given our limited population and human resources, it is important to take care of the people we have. It is high time that a much more comprehensive approach be taken in dealing with NCDs, not just with screenings, but also with more awareness and better policy measures on the ground.

"Take care of your body, it's the only place you have to live." - Jim Rohn"""

CASE_2 = """Read the following passage and answer ALL THREE questions.

Road Safety on Bhutan's Highways - Case Study

Every year, road crashes in Bhutan take dozens of lives and leave many more injured, often young people in the most productive years of their lives. Behind each number is a family that loses a breadwinner, a student or a parent. With the number of vehicles growing faster than the population, the problem is likely to grow unless attitudes change.

Many crashes have the same causes. Drivers speed on winding mountain roads, overtake on blind curves and drive after drinking at social gatherings. Some drivers are tired after long journeys to deliver goods or passengers on time. Others are distracted by mobile phones. Heavy trucks carrying construction materials and boulders share narrow roads with taxis and private cars.

Road conditions add to the danger. Landslides, potholes and roadworks during the monsoon make driving difficult, and many stretches still have no crash barriers or proper signs. In winter, black ice and fog on high passes catch drivers by surprise.

Enforcement has improved, with checkpoints and alcohol tests, but traffic police cannot be everywhere. Some experts say that driving schools teach people how to pass the test rather than how to drive safely. Others point out that once a licence is issued, a driver may never be tested again.

Road safety is not only the job of the police or the road department. It begins with every driver, passenger and pedestrian choosing to follow the rules even when nobody is watching.

"Arrive alive: it is better to be late than never." """

def cs(key, pos, stem, kp, model, group, real=False, parent=None, passage=None):
    return dict(key=key, real=real, parent=parent, kind="new_scenario" if parent else None, type=CS, marks=10,
                topic="Case study", group=group, pos=pos, stem=(passage + "\n\n" + stem) if passage else stem,
                key_points=kp, model=model)

def mcq(key, stem, opts, ans, exp, real=False, topic="General knowledge"):
    return dict(key=key, real=real, new=not real, type=M, topic=topic, stem=stem, opts=opts, ans=ans, exp=exp)

DZ_PASSAGE = """༉ ལས་རྒྱུ་འབྲས་ཟེར་མི་འདི་ རྒྱུ་ལཱ་དགེ་བ་དང་ མི་དགེ་བ་འབད་དེ་ དེའི་འབྲས་བུ་བདེ་བ་དང་ སྡུག་བསྔལ་ མྱོང་མི་ལུ་ སླབ་ཨིན།དཔེ་འབད་བ་ཅིན་ ས་ཁ་ལུ་ སོན་ག་ཅི་བཏབ་ཅིག་ ལྕུག་གུ་འདི་ཡང་ སོན་དང་འཁྲིལ་སྐྱེཝ་ཨིན། དེ་བཟུམ་ ལས་དགེ་བ་འབད་བ་ཅིན་ དེའི་འབྲས་བུ་ བདེ་བ་འོང་ནི་དང་ ལས་མི་དགེ་བ་འབད་བ་ཅིན་ དེའི་ འབྲས་བུ་ སྡུག་བསྔལ་འོང་ནི། ལས་དཀར་ནག་ ཟུང་འབྲེལ་འབད་བ་ཅིན་ དེའི་འབྲས་བུ་ཡང་ བདེ་སྡུག་ གཉིས་ཆ་ར་ འོང་ནི་དེ་ བསླུ་བ་མི་སྲིད། འདི་ཡང་ ལས་འབྲས་བསླུ་བ་མེད་པ་ནི།། ཐམས་ཅད་མཁྱེན་པའི་ཁྱད་ཆོས་ཡིན།། ཟེར་ གསུང་དོ་བཟུམ་དང་། ལས་བརྒྱ་པ་ལས། ལུས་ཅན་དག་གི་ལས་རྣམས་ནི།།བསྐལ་པ་བརྒྱར་ཡང་ཆུད་མི་ཟ།། ཚོགས་ཤིང་དུས་ལ་བབས་པ་ན།། འབྲས་བུ་ཉིད་དུ་སྨིན་པར་འགྱུར།། ཟེར་དོ་བཟུམ་ ལས་བསགས་པའི་ འབྲས་བུ་འདི་ ལས་གསག་མི་ལུ་ དུས་ཚོད་ག་དེམ་ཅིག་ ཡུན་རིང་སོང་རུང་ ཆུད་མི་ཟ་བར་སྨིན་ནི་ཨིན།

གཞན་ཡང་། ས་བླ་མཐོན་པོར་གཤེགས་པའི་མཁའ་ལྡིང་གི། གྲིབ་མ་རེ་ཞིག་བལྟ་བར་མི་མངོན་ཡང་།། ལས་ཅན་དག་དང་འདུ་འབྲས་སྤངས་པ་བཞིན།། ཚོགས་ཤིང་དུས་ལ་འབབ་ཚེ་ལྷག་པར་མངོན།། ཟེར་གསུང་དོ་བཟུམ་ དཔེ་འབད་བ་ཅིན་ བྱ་ནམ་མཁའ་ལུ་འཕུར་མི་འདི་ ནམ་མཁའི་དབྱིངས་མཐོན་པོ་ལུ་ལྷོད་པའི་ཚེ་ བྱ་དེའི་གྱིབ་མ་ ཚར་གཅིག་མ་མཐོང་རུང་ གྱིབ་མ་མེདཔ་མེན་པར། མཇུག་ལུ་བྱ་དེ་ག་ཏེ་ར་འབབ་རུང་ གྱིབ་མ་འདི་ནག་ཧྲིལ་འབད་འོང་དོ་བཟུམ། དགེ་སྡིག་གི་ ལས་གསག་མི་ལུ་འབྲས་བུ་ འདི་འཕྱོ་ ལས་ ཉམས་སུ་མ་མྱོང་རུང་ མཇུག་ལུ་ལས་ཀྱི་འབྲས་བུ་འདི་ ལས་གསག་མི་རང་གིས་ར་ མྱོང་དགོཔ་འདི་ ཐད་རི་བ་རི་ཨིན།

ང་བཅས་འགྲོ་བ་གེ་ར་ བདེ་བ་མ་གཏོགས་ སྡུག་བསྔལ་མྱོང་དགོ་མནོ་མི་ ག་ཡང་མེདཔ་ལས། ད་རེས་ རྟེན་དལ་འབྱོར་མི་ལུས་རིན་པོ་ཆེ་ གྲུ་ཆེན་དང་འདྲཝ་འདི་ཐོབ། བདེ་བའི་རྒྱུ་དང་སྡུག་བསྔལ་གྱི་རྒྱུ་ ག་ཅི་འགྲུབ་ནི་ཨིན་ན? རྟ་ཁ་སྲབ་ཀྱིས་སྒྱུར་དོ་བཟུམ་མའི་རང་དབང་འཐོབ་ད། ལས་རྒྱུ་འབྲས་ལུ་ རྩིས་བཞག་སོམ་བསྐྱེད་དེ་ སྡིག་པ་དང་དགེ་བ་ ཆུང་ཀུ་ཅིག་ཨིན་རུང་ སྤང་བླང་འབད་དགོཔ་འདི་ གནམ་མེད་ས་མེད་གལ་ཆེ་དྲགས་ཅིག་ཨིན།

སྡིག་པ་ཆུང་ཀུ་ཅིག་གིས་ གནོད་མི་ཚུགས། ཟེར་ འབད་ནི་དང་ དགེ་བ་ཆུང་ཀུ་ཅིག་གིས་ རང་ལུ་ཕན་མི་ཐོགས་མནོ་ མ་འབད་བར་བཀོ་བཞག་ནི་འདི་ འཛོལ་བ་ཨིན་མི་འདི་ཡང་། མདོ་མཛངས་བླུན་ལས། སྡིག་པ་ཆུང་ངུ་དག་ལ་ཡང་།། མི་གནོད་སྙམ་དུ་བརྙས་མི་བྱ།།མེ་མདག་ཆུང་ངུ་དག་གིས་ཀྱང་།། རྩ་ཕུང་རི་ཙམ་བསྲེག་པར་བྱེད།། ཟེར་གསུང་དོ་བཟུམ་ སྡིག་པ་ཆུང་ཀུ་ཅིག་གིས་ མི་གནོད་ཟེར་འབད་ནི་མེན་པར་ སྤང་དགོ། དགེ་བ་འདི་ཡང་། དགེ་བ་ཆུང་ངུ་དག་ལ་ཡང་།། མི་ཕན་སྙམ་དུ་བསྙས་མི་བྱ།། ཆུ་ཡི་ཐིགས་པ་བསགས་པ་ཡིས།། སོད་ཆེན་རིམ་གྱིས་གང་བར་འགྱུར།། ཟེར་གསུང་དོ་བཟུམ་ དགེ་བ་ཆུང་ཀུ་ཅིག་ཨིན་རུང་ མ་བཞག་པར་བསྒྲུབ་དགོཔ་འདི་ ག་ནི་ལས་ཡང་གལ་ཆེ། དེ་འབདཝ་ལས་ ང་བཅས་ག་ར་ ཚེ་འདི་ཕྱི་གཉིས་ལུ་ འབྲས་བུ་འདོད་པའི་ སྡུག་བསྔལ་དང་བྲལ་ཏེ་ བདེ་བ་དང་ ལྡནམ་འབད་ སོད་ཚུགས་ནི་གི་དོན་ལུ་ རྒྱུ་སྡིག་པ་སྤངས་ཏེ་ དགེ་བ་བསྒྲུབ་ནི་ལུ་བརྩོན་སྦེ་ ལས་རྒྱུ་འབྲས་བརྩིས་ཏེ་ འབད་བ་ཅིན་ རང་དང་གཞན་གཉིས་ཀའི་ བྱ་བ་ལམ་འགྲོ་ལེགས་ཤོམ་འགྱོ་བ་ལུ་ ཐེ་ཚོམ་མེདཔ་ཨིན་ནོ། །"""

G1, G2 = "me-technical-1-2025b1-cs", "me-technical-1-2025b1-cs2"
D1, D2 = "me-technical-1-2025b1-dz", "me-technical-1-2025b1-dz2"
DZI = [DZ, PDF]

DZ_PASSAGE_2 = """༉ ལཱ་གཡོག་ནང་ ཉིན་བསར་ ཆུ་ཚོད་ཀྱི་ དུས་ཚོད་ བརྩི་ནི་འདི་ ལཱ་ཤུལ་ལེགས་ཤོམ་ ཐོན་ནིའི་ རྩ་བ་ཨིན། ལཱ་ཁང་ནང་ དུས་ཚོད་ཁར་ འོང་ནི་དང་ བཀོད་ཡོད་པའི་ ལཱ་ཚུ་ དུས་ཚོད་ནང་འཁོད་ མཇུག་བསྡུ་ནི་ཚུ་གིས་ ལཱ་ཞབས་ཏོག་ལེན་མི་ མི་སེར་ཚུ་གི་ ཡིད་ཆེས་ ཐོབ་ཚུགསཔ་ཨིན།

དུས་ཚོད་ མ་བརྩི་བ་ཅིན་ ལཱ་ ཕྱི་འགྱང་ནི་མ་ཚད་ མི་གཞན་གྱི་ དུས་ཚོད་ཡང་ ཆུད་ཟད་ འགྱོཝ་ཨིན། ཡིག་ཚང་ནང་ ཞབས་ཏོག་ ལེན་བར་ འོང་མི་ མི་སེར་ཅིག་ ཐག་རིང་ས་ལས་ འོང་སྟེ་ ལཱ་གཡོག་པ་ མེད་པར་ ལོག་འགྱོ་དགོ་པ་ཅིན་ ཁོ་གི་ ཉིན་གཅིག་གི་ ལཱ་དང་ དངུལ་ ཆུད་ཟད་ འགྱོཝ་ཨིན།

དེ་འབདཝ་ལས་ ལཱ་གཡོག་པ་ རེ་རེ་གིས་ ལཱ་འདི་ རང་གི་ འགན་ཁུར་ཨིན་ཟེར་ མནོ་སྟེ་ དུས་ཚོད་ བརྩི་ཞིནམ་ལས་ དྲང་བདེན་གྱི་ ཐོག་ལས་ ལཱ་འབད་པ་ཅིན་ རྒྱལ་ཁབ་ཀྱི་ གོང་འཕེལ་ལུ་ ཕན་ཐོགས་ཆེཝ་ཨིན།"""

Q = [
# ---------------------------------------------------------------- Section I, real case study (3 questions)
cs("A1", 1, """Question 1
In what ways has urbanization contributed to the rise of non-communicable diseases (NCDs) in Bhutan? Identify two ways and elaborate how these challenges can be addressed. (10 marks)""",
   [("Way 1 with explanation from the passage: less space and time to exercise; people confined to apartments", 3),
    ("Way 2 with explanation: urban diet - junk food and fizzy drinks, traditional heavy diet without rural physical work; children with no place to play", 3),
    ("Practical solutions for each (parks, playgrounds and walking paths in town planning; workplace and school physical activity; healthy food rules near schools)", 4)],
   """Urbanization has contributed to NCDs in at least two ways.

First, it has reduced physical activity. As more Bhutanese move to towns, there is less space and time to exercise and people are confined to their apartments. Children in Thimphu have little space to play and move, so they become inactive from a young age. A traditional diet rich in butter, fat and rice was suited to hard physical work in villages; eaten by people who sit at desks all day, it becomes an "NCD diet".

Second, urban life has changed what we eat. Junk food and fizzy drinks are easily available in towns and are increasingly consumed, adding sugar, salt and fat to an already heavy diet.

These challenges can be addressed. Town planners should set aside parks, playgrounds, walking and cycling paths and open-air gyms in every neighbourhood, and offices and schools can make daily physical activity part of their routine. At the same time, the sale of junk food and fizzy drinks near schools can be restricted, healthier food labelling encouraged, and families taught to prepare traditional dishes with less butter, salt and rice and more vegetables.""",
   G1, real=True, passage=CASE_1),
cs("A2", 2, """Question 2
Discuss how traditional Bhutanese dietary habits, when removed from their original rural context, pose a threat to modern health. Mention and explain two culturally sensitive alternatives that can be promoted to encourage healthier eating patterns. (10 marks)""",
   [("Threat explained with evidence: diet was suited to physically active rural life; now high butter, fat and salt (ema datshi), shakam/sikam, large rice portions, red meat, few vegetables, doma", 5),
    ("Two culturally sensitive alternatives explained (e.g. red rice/buckwheat/millet in smaller portions; ema datshi with less butter and salt and more vegetables; local vegetables and fruit; less doma)", 5)],
   """In the past, Bhutanese families ate butter-rich ema datshi, dried meat, large portions of rice and salty dishes, but they also walked long distances and worked in the fields all day, so they burned what they ate. In towns today, the same diet is eaten by people who sit in offices and cars. As the passage explains, ema datshi is high in butter, fat and salt; shakam and sikam raise cholesterol; we eat large quantities of white rice three times a day, which acts as a sugar delivery mechanism and leads to diabetes; red meat is linked to cancer; and doma chewing kills taste cells, so people add more salt, which harms the kidneys. With few vegetables, this diet now causes high blood pressure, diabetes, heart, kidney disease and cancer.

Two culturally sensitive alternatives can be promoted. First, keep our favourite dishes but cook them in a healthier way: ema datshi with less butter and salt and more vegetables such as beans, mushrooms and spinach. Second, return to our own healthier grains and greens: red rice, buckwheat and millet in smaller portions, together with local vegetables and fruit grown in our kitchen gardens. Because these choices remain truly Bhutanese, families are more likely to accept them than foreign diet plans.""",
   G1, real=True),
cs("A3", 3, """Question 3
"Given our limited population and human resources, it is important to take care of the people we have. It is high time that a much more comprehensive approach be taken in dealing with NCDs, not just with screenings, but also more awareness and policy measures on the ground."

With reference to the above excerpt, mention to what extent the government should intervene in regulating traditional diets, junk food and lifestyle habits to curb the NCD epidemic, or should it be left to individuals' responsibility and awareness? Justify and explain with two reasons. (10 marks)""",
   [("Clear stand (e.g. a balance: the government regulates the environment, individuals choose; or either side argued well)", 2),
    ("Reason 1 explained with reference to the excerpt (e.g. small population and human resources: NCDs cost the nation, so prevention is the state's duty - taxes on junk food and sugary drinks, labelling, rules in schools)", 4),
    ("Reason 2 explained (e.g. traditional diet cannot be banned and needs awareness and personal choice; the state should educate and create conditions, not police kitchens)", 4)],
   """In my view, the government should intervene firmly where the market and environment are concerned, but leave personal food choices to well-informed individuals.

First, as the excerpt says, Bhutan has a small population and limited human resources, so every life lost or disabled by NCDs is a serious loss to the nation, and treatment of diabetes, kidney failure and cancer is very expensive for our free health system. The government is therefore justified in regulating junk food and fizzy drinks through higher taxes, clear labels on salt and sugar, and bans on selling them in and near schools, and in providing parks and sports facilities.

Second, traditional diets and lifestyle habits are part of our culture and daily life, and cannot be regulated in every kitchen. Here the best tool is awareness, not force: regular screening, health education in schools, campaigns on reducing butter, salt, rice and doma, and support from community leaders. When people understand the risks, they change more willingly and permanently.

So the government should regulate what is sold and create a healthy environment, while individuals take responsibility for their own eating and exercise.""",
   G1, real=True),
# ---------------------------------------------------------------- Section I, new case study
cs("A1s", 1, """Question 1
According to the passage, what are the main causes of road crashes in Bhutan? Identify two causes and explain how each can be addressed. (10 marks)""",
   [("Cause 1 explained (e.g. speeding and overtaking on blind curves; drink driving; fatigue; phone use)", 3),
    ("Cause 2 explained (e.g. road conditions: landslides, potholes, no barriers or signs; ice and fog)", 3),
    ("Practical solution for each", 4)],
   """The passage gives two broad kinds of causes. The first is driver behaviour: speeding on winding roads, overtaking on blind curves, drink driving after social gatherings, fatigue after long journeys and distraction by mobile phones. This can be addressed by stricter enforcement such as speed checks, random alcohol tests and heavy fines, by limiting the driving hours of truck and taxi drivers, and by awareness campaigns.

The second is road conditions: landslides, potholes and roadworks during the monsoon, stretches without crash barriers or signs, and black ice and fog on high passes in winter. The Department of Surface Transport can install crash barriers and warning signs at dangerous curves, clear landslides quickly, put sand or salt on icy passes and announce road conditions on radio and social media so that drivers can plan.""",
   G2, parent="A1", passage=CASE_2),
cs("A2s", 2, """Question 2
"Some experts say that driving schools teach people how to pass the test rather than how to drive safely." Discuss this statement and suggest two improvements to the way drivers are trained and licensed in Bhutan. (10 marks)""",
   [("Discussion of the statement (training focused on test routines, little practice on mountain roads, night, rain, defensive driving)", 4),
    ("Improvement 1 explained (e.g. compulsory practical hours on highways and in bad weather; defensive driving)", 3),
    ("Improvement 2 explained (e.g. periodic re-testing or refresher courses; probation licence; points system)", 3)],
   """The statement suggests that many learners practise only the fixed routines needed for the licence test, such as parking and a short drive in town. They rarely learn to drive on narrow mountain highways, at night, in rain, fog or ice, or to judge when overtaking is safe. As a result, new drivers may hold a licence but lack the judgement needed on real roads.

Two improvements could help. First, driving schools should be required to give a minimum number of practical hours on highways and in difficult conditions, including lessons on defensive driving, fatigue and the dangers of alcohol. Second, licensing should not be a one-time event: new drivers could hold a probation licence for two years with zero tolerance for alcohol, a penalty points system could suspend repeat offenders, and drivers of taxis, buses and trucks could take refresher courses and tests every few years.""",
   G2, parent="A2"),
cs("A3s", 3, """Question 3
"Road safety is not only the job of the police or the road department." To what extent do you agree? Justify your view with two reasons. (10 marks)""",
   [("Clear stand", 2), ("Reason 1 explained (e.g. police cannot be everywhere; drivers' choices decide most crashes)", 4),
    ("Reason 2 explained (e.g. passengers, families, employers and pedestrians share responsibility: seat belts, refusing to ride with a drunk driver, rest for drivers)", 4)],
   """I fully agree that road safety is everyone's responsibility.

First, as the passage notes, traffic police cannot be everywhere. Most crashes are caused by choices drivers make when nobody is watching: speeding, overtaking on blind curves, using phones or driving after drinking. Only drivers themselves can make the right choice at that moment.

Second, others also play a part. Passengers can wear seat belts and refuse to travel with a driver who has been drinking, families and friends can arrange a sober driver after gatherings, employers can give truck and taxi drivers enough rest, and pedestrians can use footpaths and crossings. Schools can teach road safety from an early age.

The police and road department must enforce rules and build safe roads, but crashes will only fall when every road user follows the rules.""",
   G2, parent="A3"),
# ---------------------------------------------------------------- Section II, real topical
dict(key="B1", real=True, type=TOP, marks=10, topic="Topical issues: economy", stem="""Does the recent tax revision of imposing income tax on interest earned from fixed deposits while simultaneously lowering taxes on the import of vehicles reflect a fair and progressive fiscal policy, or does it risk burdening low and middle-income savers while encouraging consumption and increasing the country's trade deficit? Give reasons to support your answer and include relevant examples. (10 marks)""",
     key_points=[("Clear stand", 2), ("Effect on savers explained (fixed deposits are the main saving tool of low/middle-income families and retirees; tax lowers returns, discourages saving)", 3),
                 ("Effect on consumption and trade deficit explained (cheaper imported vehicles, fuel imports, rupee outflow, congestion)", 3),
                 ("Balance or suggestions with examples (e.g. tax-free threshold for small deposits; target vehicle tax cuts to electric vehicles)", 2)],
     model="""In my view, the combination risks being unfair to ordinary savers and harmful to the economy, unless it is carefully adjusted.

Fixed deposits are the main way for low and middle-income families, civil servants and pensioners to save, because they are safe and simple. Taxing their interest lowers the small return they earn and discourages saving, while wealthier people can move money into other investments. This makes the tax regressive in effect.

At the same time, lowering taxes on imported vehicles encourages people to spend rather than save. Almost all vehicles and fuel are imported, mostly from India, so more vehicle purchases mean more outflow of rupees, a wider trade deficit and pressure on foreign currency reserves, as well as more traffic and pollution in Thimphu.

The policy could be made fairer by exempting interest on small deposits up to a threshold, and by limiting vehicle tax cuts to electric vehicles, which use our own hydropower. Then the revision would support both savers and sustainable growth."""),
dict(key="B2", real=True, type=TOP, marks=10, topic="Topical issues: employment", stem="""Given the rising concerns surrounding youth unemployment in Bhutan, recommend any three targeted policy interventions or collaborative initiatives between the government, private sector, and educational institutions that would be most effective in creating sustainable employment opportunities for young people. (10 marks)""",
     key_points=[("Intervention 1 explained (e.g. curriculum and TVET aligned with industry needs, apprenticeships and internships)", 3),
                 ("Intervention 2 explained (e.g. support for youth enterprise: start-up loans, incubation, mentoring by private sector)", 3),
                 ("Intervention 3 explained (e.g. wage subsidies or incentives for private firms that hire youth; jobs in GMC, agriculture, IT)", 3),
                 ("Collaboration among government, private sector and institutions shown", 1)],
     model="""Three interventions could create lasting jobs for young Bhutanese.

First, education should match the needs of the economy. Colleges and technical institutes should design courses together with employers, and every student should complete an internship or apprenticeship in a real workplace before graduating, so that graduates have practical skills employers want.

Second, young people should be helped to create their own jobs. The government can offer low-interest start-up loans and simplified licensing, while private companies and banks provide mentoring and incubation centres where young entrepreneurs in agriculture, IT, tourism and crafts can test their ideas.

Third, the government can give private firms incentives, such as wage subsidies or tax relief for a year, for hiring young people, and prepare youth for jobs in growing sectors such as Gelephu Mindfulness City, hydropower, construction and digital services.

Working together, these partners can turn young people from job seekers into skilled workers and job creators."""),
dict(key="B3", real=True, type=TOP, marks=10, topic="Topical issues: energy", stem="""Considering the economic costs, land-use requirements, and technological needs, do you agree or disagree that investing in solar power is a more sustainable long-term solution for Bhutan's energy security compared to continuing expansion in hydropower? Justify and explain with three reasons. (10 marks)""",
     key_points=[("Clear stand (agree, disagree or a reasoned mix)", 1),
                 ("Reason 1: economic costs compared (hydropower: large investment, debt, cost overruns; solar: falling costs, quicker to build; but lower output)", 3),
                 ("Reason 2: land use (solar needs large flat land, scarce in Bhutan; hydropower floods valleys but less land per unit)", 3),
                 ("Reason 3: technology and reliability (hydro is proven, but winter flow falls and climate change threatens glaciers; solar needs storage and imported panels)", 3)],
     model="""I believe solar power should complement, not replace, hydropower, so I partly disagree that it is a more sustainable long-term solution on its own.

First, on economic costs, large hydropower projects need huge loans and often face cost overruns and delays, as Punatsangchhu shows. Solar plants are cheaper per project and quicker to build, like the 17.38 MW Sephu solar plant, but each produces far less electricity, so solar alone cannot earn the export revenue that hydropower provides.

Second, on land use, Bhutan is mountainous and must keep at least 60 percent forest cover. Solar farms need large areas of flat, sunny land, which is scarce and valuable for farming, whereas hydropower produces much more energy from the same area, although reservoirs and tunnels also affect land and rivers.

Third, on technology, hydropower is proven and supplies power day and night, but its output falls in winter when rivers are low, and climate change threatens glacier-fed rivers. Solar produces most in the sunny dry winter, filling that gap, but needs battery storage and imported panels.

Therefore, the most sustainable path is to diversify: continue well-planned hydropower while expanding solar to secure supply in winter."""),
# ---------------------------------------------------------------- Section II, new topical
dict(key="B1s", parent="B1", kind="new_scenario", type=TOP, marks=10, topic="Topical issues: economy", stem="""Bhutan depends heavily on imports of fuel, food and consumer goods, mostly from India. Do you think promoting "Made in Bhutan" products can reduce the country's trade deficit? Give reasons to support your answer and include relevant examples. (10 marks)""",
     key_points=[("Clear stand", 2), ("Reason 1 with example (import substitution: vegetables, dairy, eggs, furniture, processed food)", 3),
                 ("Reason 2 with example (limits: small market, high costs, raw materials imported; need quality and scale)", 3), ("Suggestions to make it work", 2)],
     model="""Promoting "Made in Bhutan" products can help reduce the trade deficit, but only for some goods and only if quality and prices compete.

First, many things we import can be produced at home. Vegetables, eggs, dairy, rice, furniture, juice and handicrafts are already made in Bhutan; if more people buy them, less money leaves the country, and farmers and small businesses earn more.

Second, there are limits. Our market is small, production costs are high, and many raw materials, machines and packaging are themselves imported. Fuel and vehicles cannot be produced locally at all.

To make the campaign work, the government can support producers with credit, storage and marketing, schools and offices can buy local products, and producers must improve quality and packaging. Combined with exports such as hydropower and minerals, this can narrow the deficit."""),
dict(key="B2s", parent="B2", kind="new_scenario", type=TOP, marks=10, topic="Topical issues: employment", stem="""Many young Bhutanese leave for Australia and other countries to work and study. Recommend three measures that the government, private sector and communities could take to make staying and working in Bhutan more attractive for young people. (10 marks)""",
     key_points=[("Measure 1 explained (e.g. better pay and career paths in key professions)", 3), ("Measure 2 explained (e.g. private-sector growth, GMC and enterprise support)", 3),
                 ("Measure 3 explained (e.g. housing, recognition, links with diaspora and return schemes)", 3), ("Collaboration shown", 1)],
     model="""First, the government should improve pay, promotion and professional growth in the professions most affected, such as nursing, teaching and engineering, so that a career at home is a real option.

Second, the private sector, with government support, should create more attractive jobs. Projects like Gelephu Mindfulness City, digital services, tourism and modern agriculture can offer well-paid work, and young entrepreneurs can be supported with credit and mentoring.

Third, communities and the government can improve living conditions and recognition: affordable housing in towns, childcare, sports and cultural spaces, and public recognition of young achievers. Programmes that keep in touch with Bhutanese abroad and help returnees find jobs or start businesses would also encourage people to come back with new skills.

Together these measures can turn migration from a loss into a temporary stage that strengthens the nation."""),
dict(key="B3s", parent="B3", kind="new_scenario", type=TOP, marks=10, topic="Topical issues: energy", stem="""Do you agree that Bhutan should rapidly shift to electric vehicles (EVs) for both public and private transport? Justify and explain with three reasons. (10 marks)""",
     key_points=[("Clear stand", 1), ("Reason 1: energy and economy (own hydropower vs imported fuel; trade deficit)", 3),
                 ("Reason 2: environment and health (no exhaust, carbon neutrality)", 3), ("Reason 3: challenges (cost, charging network, mountain roads, battery disposal) and how to manage them", 3)],
     model="""I agree that Bhutan should shift to electric vehicles, but steadily rather than overnight.

First, EVs run on electricity from our own hydropower, while petrol and diesel are imported with scarce rupees. Using our own clean power would reduce fuel imports and the trade deficit.

Second, EVs produce no exhaust, improving air quality in towns like Thimphu and Phuentsholing and helping Bhutan remain carbon negative.

Third, there are real challenges: EVs cost more to buy, charging stations are still few on long highways, cold weather and steep roads reduce battery range, and old batteries must be disposed of safely. These can be managed by tax incentives, building chargers along national highways, starting with taxis and buses, and setting up battery recycling.

A planned shift will bring economic and environmental gains while avoiding hardship."""),
# ---------------------------------------------------------------- Section III, real MCQs (Q13, Q18, Q20 left out)
mcq("C1", "In which year did Bhutan compete in the Summer Olympics for the first time?", ["1972", "1984", "1992", "2000"], 1, "Bhutan first took part in the 1984 Los Angeles Olympics, in archery.", real=True),
mcq("C2", "Bhutan is NOT a member of which international organization?", ["ASEAN", "BIMSTEC", "SAARC", "UN"], 0, "Bhutan is a member of BIMSTEC, SAARC and the UN, but not of ASEAN.", real=True),
mcq("C3", "Bhutan's tourism fee per day (Sustainable Development Fee) is currently", ["$50", "$100", "$150", "$200"], 1, "The SDF was reduced from USD 200 to USD 100 per night in 2023.", real=True),
mcq("C4", "The Berlin Wall fell in", ["1987", "1989", "1990", "1991"], 1, "The Berlin Wall fell on 9 November 1989.", real=True),
mcq("C5", "Which empire built the Colosseum in Rome?", ["Byzantine", "Greek", "Roman", "Ottoman"], 2, "The Colosseum was built by the Roman Empire (completed in AD 80).", real=True),
mcq("C6", "Which country has the most time zones?", ["Russia", "United States", "France", "China"], 2, "France has 12 time zones because of its overseas territories.", real=True),
mcq("C7", "The river Nile flows into which sea?", ["Black Sea", "Red Sea", "Mediterranean Sea", "Arabian Sea"], 2, "The Nile flows north into the Mediterranean Sea.", real=True),
mcq("C8", "Which country is known as the Land of the Rising Sun?", ["China", "Japan", "Thailand", "South Korea"], 1, "Japan (Nihon) means 'origin of the sun'.", real=True),
mcq("C9", "The Great Barrier Reef is located off the coast of", ["India", "Australia", "New Zealand", "Indonesia"], 1, "The Great Barrier Reef lies off Queensland, Australia.", real=True),
mcq("C10", "What is the capital of Canada?", ["Toronto", "Montreal", "Vancouver", "Ottawa"], 3, "Ottawa is the capital of Canada.", real=True),
mcq("C11", "Which continent has the highest number of countries?", ["Europe", "Asia", "Africa", "South America"], 2, "Africa has 54 countries.", real=True),
mcq("C12", "The 2026 FIFA World Cup will be jointly hosted by", ["USA, Canada, Mexico", "USA, UK, Canada", "Mexico, Argentina, Brazil", "USA, Spain, Portugal"], 0, "The 2026 World Cup is hosted by the USA, Canada and Mexico.", real=True),
mcq("C14", "The headquarters of the World Bank is in", ["Geneva", "Washington D.C.", "Brussels", "New York"], 1, "The World Bank is headquartered in Washington D.C.", real=True),
mcq("C15", "NATO was established in", ["1945", "1949", "1955", "1960"], 1, "NATO was founded in April 1949.", real=True),
mcq("C16", "Which agency supports maternal and reproductive health in Bhutan?", ["UNICEF", "WHO", "UNFPA", "UN Women"], 2, "UNFPA, the UN Population Fund, works on maternal and reproductive health.", real=True),
mcq("C17", "What colours make up the Olympic rings?", ["Red, Blue, Green, Yellow, Black", "Red, White, Green, Blue, Black", "Blue, White, Red, Yellow, Black", "Red, Orange, Yellow, Green, Blue"], 0, "The five rings are blue, yellow, black, green and red.", real=True),
mcq("C19", "Which Formula 1 driver holds the record for most Grand Prix wins?", ["Max Verstappen", "Lewis Hamilton", "Michael Schumacher", "Sebastian Vettel"], 1, "Lewis Hamilton holds the record with more than 100 Grand Prix wins.", real=True),
# ---------------------------------------------------------------- Section III, new MCQs
mcq("C21", "The headquarters of the United Nations is located in", ["Geneva", "Paris", "New York", "Vienna"], 2, "The UN headquarters is in New York."),
mcq("C22", "Which is the longest river in Asia?", ["Ganges", "Yangtze", "Mekong", "Indus"], 1, "The Yangtze in China is Asia's longest river."),
mcq("C23", "The Paris Agreement, adopted in 2015, deals mainly with", ["world trade", "climate change", "nuclear weapons", "refugees"], 1, "The Paris Agreement aims to limit global warming."),
mcq("C24", "Bhutan joined the United Nations in", ["1962", "1971", "1985", "1990"], 1, "Bhutan became a UN member on 21 September 1971."),
mcq("C25", "Which planet is the largest in our solar system?", ["Saturn", "Earth", "Jupiter", "Neptune"], 2, "Jupiter is the largest planet."),
mcq("C26", "The currency of Japan is the", ["Yuan", "Won", "Yen", "Ringgit"], 2, "Japan's currency is the yen."),
mcq("C27", "The international organization that sets rules for trade between nations is the", ["WTO", "WHO", "IMF", "ILO"], 0, "The World Trade Organization (WTO) deals with the rules of trade."),
mcq("C28", "Mount Everest lies on the border of Nepal and", ["India", "Bhutan", "China", "Pakistan"], 2, "Everest lies on the border of Nepal and China (Tibet)."),
# ---------------------------------------------------------------- Section IV, real Dzongkha comprehension (one passage; ka, kha, ga, nga)
dict(key="D1", real=True, type=C, marks=8, topic="Dzongkha comprehension", issues=DZI, group=D1, pos=1, stem=DZ_PASSAGE + """

ལྟག་གི་ཡིག་རྒྱུགས་ལྷག་ཞིནམ་ལས་ དྲི་བ་ ཀ་ ཁ་ ག་ ང་ བཞི་གི་ལན་བྲིས།

དྲི་བ་ ཀ། ལན་ཐུང་ཀུ། འོག་གི་དྲི་བ་ག་ར་གི་ ལན་བྲིས། (སྐུགས་ ༤x༢=༨)
༡ ལས་རྒྱུ་འབྲས་འདི་ལུ་ ཁྱོད་ཀྱིས་ཡིད་ཆེ་བསྐྱེད་ཚུགས་པས་ག? ཁུངས་བཀལ།
༢ ལས་བརྒྱ་པ་ལས། ལུས་ཅན་དག་གི་ལས་རྣམས་ནི།། བསྐལ་པ་བརྒྱར་ཡང་ཆུད་མི་ཟ།། ཚོགས་ཤིང་དུས་ལ་བབས་པ་ན།། འབྲས་བུ་ཉིད་དུ་སྨིན་པར་འགྱུར།། ཟེར་བའི་ལུང་དྲང་གི་དོན་དག་བྲིས།
༣ ད་རེས་ རྟེན་དལ་འབྱོར་མི་ལུས་རིན་པོ་ཆེ་ གྲུ་ཆེན་དང་འདྲཝ་འདི་ཐོབ། ཟེར་བའི་སྐབས་ མི་ལུས་རིན་པོ་ཆེ་འདི་ དཔེ་གྲུ་ཆེན་ལུ་བཞག་དགོ་པའི་ཁུངས་ག་ཅི་སྨོ?
༤ ལས་རྒྱུ་འབྲས་ལུ་བརྩི་མཐོང་བསྐྱེད་དེ་ སྡིག་པ་སྤང་ནི་དང་ དགེ་བ་བསྒྲུབ་ནི་ལུ་ ག་དེ་སྦེ་ར་བརྩོན་ནི་སྨོ?""",
     key_points=[("༡ ཡིད་ཆེས་ བསྐྱེད་ཚུགས་ (སོན་དང་ ལྕུག་གུའི་ དཔེ་ ཡང་ན་ ལུང་) ཁུངས་དང་བཅས།", 2),
                 ("༢ ལས་བསགས་པའི་ འབྲས་བུ་ བསྐལ་པ་བརྒྱ་ སོང་རུང་ མ་ཆུད་ཟ་བར་ རྐྱེན་ཚོགས་ཏེ་ དུས་ལ་བབས་པའི་ཚེ་ ངེས་པར་དུ་ སྨིན།", 2),
                 ("༣ གྲུ་ཆེན་གྱིས་ ཆུ་བོ་ལས་ བརྒལ་བ་བཟུམ་ མི་ལུས་འདི་གིས་ འཁོར་བའི་ རྒྱ་མཚོ་ལས་ བརྒལ་ཏེ་ ཐར་པ་ཐོབ་ནིའི་ རྟེན་ཨིན།", 2),
                 ("༤ སྡིག་པ་ ཆུང་ཀུ་ཡང་ སྤང་ (མེ་མདག་གི་ དཔེ།) དགེ་བ་ ཆུང་ཀུ་ཡང་ བསྒྲུབ་ (ཆུ་ཐིགས་ཀྱི་ དཔེ།) ཉིན་བསར་ ལག་ལེན།", 2)],
     model="""༡ ཡིད་ཆེས་ བསྐྱེད་ཚུགས། ས་ཁ་ལུ་ སོན་ ག་ཅི་བཏབ་རུང་ ལྕུག་གུ་ཡང་ སོན་དང་འཁྲིལ་ སྐྱེཝ་བཟུམ་ དགེ་བ་འབད་བ་ཅིན་ བདེ་བ་དང་ མི་དགེ་བ་འབད་བ་ཅིན་ སྡུག་བསྔལ་ འོང་ནི་ ངེས་པར་ཨིན།
༢ ལུས་ཅན་ སེམས་ཅན་ཚུ་གིས་ བསགས་པའི་ ལས་ཚུ་ བསྐལ་པ་བརྒྱ་ སོང་རུང་ ཆུད་མི་ཟ། རྐྱེན་ཚོགས་ཏེ་ དུས་ལ་བབས་པའི་ཚེ་ འབྲས་བུ་ ངེས་པར་དུ་ སྨིན།
༣ གྲུ་ཆེན་གྱི་ རོགས་ཀྱིས་ ཆུ་བོ་ཆེན་པོ་ལས་ བརྒལ་ཚུགས་དོ་བཟུམ་ དལ་འབྱོར་གྱི་ མི་ལུས་འདི་གི་ རོགས་ཀྱིས་ འཁོར་བའི་ རྒྱ་མཚོ་ལས་ བརྒལ་ཏེ་ ཐར་པ་ ཐོབ་ཚུགསཔ་ལས་ དཔེ་ གྲུ་ཆེན་ལུ་ བཞག་ཨིན།
༤ སྡིག་པ་ ཆུང་ཀུ་ཅིག་ཨིན་རུང་ མེ་མདག་ཆུང་ཀུ་གིས་ རྩ་ཕུང་ བསྲེག་དོ་བཟུམ་ གནོད་ཚུགསཔ་ལས་ སྤང་། དགེ་བ་ ཆུང་ཀུ་ཡང་ ཆུ་ཐིགས་ བསགས་ཏེ་ སྣོད་ཆེན་ གང་དོ་བཟུམ་ མ་བཞག་པར་ བསྒྲུབ། ཉིན་བསར་ ལས་རྒྱུ་འབྲས་ བརྩི་སྟེ་ ཀུན་སྤྱོད་ བཟང་པོ་ བཞག།"""),
dict(key="D2", real=True, type=C, marks=4, topic="Dzongkha comprehension", issues=DZI + ["Item ༢ (meaning of སྨིན): Claude is not sure of the intended answer; a Dzongkha teacher must confirm."], group=D1, pos=2, stem="""དྲི་བ་ ཁ། ལན་གདམ་ཁ་ཅན། འོག་གི་དྲི་བ་རེ་ལུ་ ལན་ ཀ་ཁ་ག་ང་ ཡོད་ས་ལས་ ལན་ངོ་མ་འདི་གདམ་ཁ་རྐྱབ་སྟེ་ ཀ་རྟགས་དང་སྦྲགས་ཏེ་ བྲིས། (སྐུགས་ ༤x༡=༤)
༡ ལས་འབྲས་བསླུ་བ་མེད་པ་ནི།། ཐམས་ཅད་མཁྱེན་པའི་ཁྱད་ཆོས་ཡིན།། ཟེར་བའི་ལུང་དྲང་གི་ བཅུད་དོན་འདི་ ...
ཀ) ལས་རྒྱུ་འབྲས་འདི་མ་པ་ལས་མེད་ཟེར་ཨིན་པས།  ཁ) ལས་རྒྱུ་འབྲས་འདི་ངེས་པར་དུ་ཡོད་ཟེར་བའི་དོན་ཨིན་པས།  ག) ལས་རྒྱུ་འབྲས་འདི་སངས་རྒྱས་དང་ཁྱད་པར་མེད་ཟེར་ཨིན་པས།  ང) ལས་རྒྱུ་འབྲས་འདི་སངས་རྒྱས་ལུ་རྐྱངམ་གཅིག་ཡོད་ཟེར་ཨིན་པས།
༢ ཚོགས་ཤིང་དུས་ལ་བབས་པ་ན། ། འབྲས་བུ་ཉིད་དུ་སྨིན་པར་འགྱུར། ། ཟེར་བའི་སྐབས་ སྨིན་ཟེར་མིའི་ རྣམ་གྲངས་འདི་ ...
ཀ) མིན།  ཁ) ཤིང་འབྲས།  ག) འཚོ་འཚོཔ།  ང) བསགས་བསགསཔ།
༣ ས་བླ་མཐོན་པོར་གཤེགས་པའི་མཁའ་ལྡིང་གི། གྲིབ་མ་རེ་ཞིག་བལྟ་བར་མི་མངོན་ཡང་།། ཟེར་མི་འདི་ དཔེ་ཨིན་པས། འདི་གི་ དོན་འདི་ ...
ཀ) ལས་ཀྱི་འབྲས་བུ་འདི་ཐད་རི་བ་རི་མྱོང་དགོ་ཟེར་ཨིན་པས།  ཁ) བྱ་དེའི་གྲིབ་མ་མཐོང་མི་ཚུགས་ཟེར་ཨིན་པས།  ག) དགེ་བ་བསྒྲུབ་དགོ་ཟེར་ཨིན་པས།  ང) སྡིག་པ་སྤང་དགོ་ཟེར་ཨིན་པས།
༤ རང་དང་གཞན་གཉིས་ཀའི་ བྱ་བ་ལམ་འགྲོ་ལེགས་ཤོམ་འགྱོ་མི་འདི་ ...
ཀ) ལས་རྒྱུ་འབྲས་བརྩི་ཤེས་ནི་འདི་གིས་ཨིན།  ཁ) སྡུག་བསྔལ་དང་བྲལ་ནི་འདི་གིས་ཨིན།  ག) བདེ་བ་དང་ལྡན་ནི་འདི་གིས་ཨིན།  ང) སྤང་བླང་ཧ་གོ་ནི་འདི་གིས་ཨིན།""",
     key_points=[("༡ (ཁ)", 1), ("༢ (ག) - to be confirmed by a Dzongkha teacher", 1), ("༣ (ཀ)", 1), ("༤ (ཀ)", 1)],
     model="""༡ (ཁ)  ༢ (ག) [to confirm]  ༣ (ཀ)  ༤ (ཀ)
༡ ལས་འབྲས་ མི་བསླུ་བ་ ངེས་པར་དུ་ ཡོད།
༢ སྨིན་ = འབྲས་བུ་ ཚོས་ཏེ་ འཚོ་འཚོཔ་ (Claude's reading; confirm).
༣ བྱའི་གྲིབ་མ་ མཐོང་མ་ཚུགས་རུང་ མཇུག་ལུ་ མངོན་དོ་བཟུམ་ ལས་ཀྱི་འབྲས་བུ་ ཐད་རི་བ་རི་ མྱོང་དགོ།
༤ ལས་རྒྱུ་འབྲས་ བརྩི་ཤེས་པ་ཅིན་ རང་གཞན་གཉིས་ཀའི་ བྱ་བ་ ལེགས་ཤོམ་འགྱོ།"""),
dict(key="D3", real=True, type=C, marks=3, topic="Dzongkha comprehension", issues=DZI, group=D1, pos=3, stem="""དྲི་བ་ ག། འོག་གི་མིང་ཚིག་ཚུ་གི་ རྗོད་ཚིག་བྲིས། (ལྟག་གི་ཡིག་རྒྱུགས་ནང་ལས་ འདྲ་བཤུས་ཕབ་མི་ཆོག) (སྐུགས་ ༣)
༡༽ ཟུང་འབྲེལ།  ༢༽ ཆུད་མི་ཟ།  ༣༽ མཐོན་པོ།  ༤༽ སྤང་བླང་།  ༥༽ ཚེ་འདི་ཕྱི།  ༦༽ ཐེ་ཚོམ།""",
     key_points=[("ཚིག་ ༦ ལུ་ རྗོད་ཚིག་ ཀྲིག་ཀྲི་ (ཚིག་རེ་ལུ་ ༠.༥) ཡིག་རྒྱུགས་ལས་ འདྲ་བཤུས་ མེད།", 3)],
     model="""༡ ཤེས་རིག་དང་ ལམ་སྲོལ་ ཟུང་འབྲེལ་ཐོག་ལས་ སློབ་སྦྱོང་འབད་དགོ།
༢ ཁྱོད་ཀྱིས་ བཏང་མི་ དཀའ་ངལ་འདི་ ཆུད་མི་ཟ།
༣ ཇོ་མོ་ལྷ་རི་ ཧ་ཅང་ མཐོན་པོ་ཅིག་ཨིན།
༤ ལཱ་ག་ཅི་འབད་རུང་ སྤང་བླང་ ཧ་གོ་སྟེ་ འབད་དགོ།
༥ དགེ་བ་འདི་ ཚེ་འདི་ཕྱི་ གཉིས་ཆ་ར་ལུ་ ཕན།
༦ ང་ ཁོ་ ནངས་པ་ འོང་ནི་ཨིན་ན་ མེན་ན་ ཐེ་ཚོམ་ཟ་དོ།"""),
dict(key="D4", real=True, type=C, marks=5, topic="Dzongkha comprehension", issues=DZI, group=D1, pos=4, stem="""དྲི་བ་ ང་། འོག་གི་དོན་མཚམས་འདི་ལྷག་སྟེ་ ཡིག་སྡེབ་འཛོལ་བ་ ༥ ཡོད་མི་ཚུ་ ངོས་འཛིན་འབད་ཞིནམ་ལས་ སྡེབ་བཅོས་ཁ་རྐྱབ་སྟེ་ བྲིས། (སྐུགས་ ༡x༥=༥)
ཤེས་རིག་གི་འཆར་སང་འདི་ རྒྱལ་ཡོངས་དགའ་སྐྱིད་སྤེལ་འཛོམས་ཀྱི་ ལྟ་བ་འཛིན་པའི་ཤེས་ཡན་ཅན་དང་ འབྲུག་པའི་མཐུན་མོང་མ་ཡིན་པའི་ ཁྱད་ཆོས་ཐ་དམ་ཚིད་དང་ལས་རྒྱུ་འབྲས་ཚུ་འགྱུར་བ་མེད་པར་ བཙི་ཤེས་པའི་མི་སྡེ་ཅིག་ལུ་ འགྱུར་ཚུགས་ནི་འདི་ཨིན།""",
     key_points=[("འཆར་སང → འཆར་སྣང", 1), ("སྤེལ་འཛོམས → དཔལ་འཛོམས", 1), ("ཤེས་ཡན → ཤེས་ཡོན", 1), ("ཐ་དམ་ཚིད → ཐ་དམ་ཚིག", 1), ("བཙི → བརྩི", 1)],
     model="""འཆར་སང → འཆར་སྣང། སྤེལ་འཛོམས → དཔལ་འཛོམས། ཤེས་ཡན → ཤེས་ཡོན། ཐ་དམ་ཚིད → ཐ་དམ་ཚིག། བཙི → བརྩི།"""),
# ---------------------------------------------------------------- Section IV, new Dzongkha comprehension
dict(key="D1s", parent="D1", kind="new_scenario", type=C, marks=8, topic="Dzongkha comprehension", issues=[DZ], group=D2, pos=1, stem=DZ_PASSAGE_2 + """

ལྟག་གི་ཡིག་རྒྱུགས་ལྷག་ཞིནམ་ལས་ དྲི་བ་ ཀ་ ཁ་ ག་ ང་ བཞི་གི་ལན་བྲིས།

དྲི་བ་ ཀ། ལན་ཐུང་ཀུ། (སྐུགས་ ༤x༢=༨)
༡ ཡིག་རྒྱུགས་ནང་ ལཱ་ཤུལ་ལེགས་ཤོམ་ ཐོན་ནིའི་ རྩ་བ་ ག་ཅི་ཨིན་ཟེར་ བཀོད་ཡོད་ག?
༢ དུས་ཚོད་ མ་བརྩི་བ་ཅིན་ གནོད་པ་ ག་ཅི་ར་ འབྱུངམ་ཨིན་ན?
༣ ཡིག་རྒྱུགས་ནང་ མི་སེར་ཅིག་གི་ དཔེ་ ག་ཅི་སྦེ་ བཀོད་ཡོད་ག?
༤ ཁྱོད་ལཱ་གཡོག་པ་ཅིག་ ཨིན་པ་ཅིན་ དུས་ཚོད་ བརྩི་ནི་ལུ་ ག་ཅི་འབད་ནི་ཨིན་ན?""",
     key_points=[("༡ ཉིན་བསར་ དུས་ཚོད་ བརྩི་ནི།", 2), ("༢ ལཱ་ ཕྱི་འགྱང་ནི་དང་ མི་གཞན་གྱི་ དུས་ཚོད་ ཆུད་ཟད་འགྱོ་ནི།", 2),
                 ("༣ ཐག་རིང་ས་ལས་ འོང་མི་ མི་སེར་ ལཱ་གཡོག་པ་ མེད་པར་ ལོག་འགྱོ་དགོ་པ་ཅིན་ ཉིན་གཅིག་གི་ ལཱ་དང་ དངུལ་ ཆུད་ཟད།", 2), ("༤ རང་གི་ ཐབས་ལམ་ ༢ (དུས་ཚོད་ཁར་ འོང་ནི། ལཱ་ དུས་ནང་ མཇུག་བསྡུ་ནི།)", 2)],
     model="""༡ ཉིན་བསར་ དུས་ཚོད་ བརྩི་ནི་འདི་ ལཱ་ཤུལ་ ལེགས་ཤོམ་ ཐོན་ནིའི་ རྩ་བ་ཨིན།
༢ ལཱ་ ཕྱི་འགྱང་ནི་དང་ མི་གཞན་གྱི་ དུས་ཚོད་ཡང་ ཆུད་ཟད་ འགྱོཝ་ཨིན།
༣ ཐག་རིང་ས་ལས་ ཞབས་ཏོག་ལེན་བར་ འོང་མི་ མི་སེར་ཅིག་ ལཱ་གཡོག་པ་ མེད་པར་ ལོག་འགྱོ་དགོ་པ་ཅིན་ ཁོ་གི་ ཉིན་གཅིག་གི་ ལཱ་དང་ དངུལ་ ཆུད་ཟད་ འགྱོཝ་ཨིན།
༤ ལཱ་ཁང་ནང་ དུས་ཚོད་ཁར་ འོང་ནི། ལཱ་ཚུ་ ཉིན་རེ་བཞིན་ འཆར་གཞི་ བཟོ་སྟེ་ དུས་ཚོད་ནང་འཁོད་ མཇུག་བསྡུ་ནི།"""),
dict(key="D2s", parent="D2", kind="new_scenario", type=C, marks=4, topic="Dzongkha comprehension", issues=[DZ], group=D2, pos=2, stem="""དྲི་བ་ ཁ། ལན་གདམ་ཁ་ཅན། ལན་ངོ་མ་འདི་གདམ་ཁ་རྐྱབ་སྟེ་ ཀ་རྟགས་དང་སྦྲགས་ཏེ་ བྲིས། (སྐུགས་ ༤x༡=༤)
༡ ཡིག་རྒྱུགས་ཀྱི་ གནད་དོན་ གཙོ་བོ་འདི་ ...  ཀ) ལཱ་ཁང་གི་ བཟོ་བཀོད།  ཁ) དུས་ཚོད་ བརྩི་ནིའི་ གལ་གནད།  ག) མི་སེར་ཚུ་གི་ ཉོ་ཚོང་།  ང) ཡིག་ཚང་གི་ བཅའ་ཡིག།
༢ \"ཆུད་ཟད་\" ཟེར་མིའི་ དོན་འདི་ ...  ཀ) ཁེ་ཕན་ ཐོབ།  ཁ) ལེགས་ཤོམ་ འགྱོ།  ག) དོན་མེད་ དུ་ ཤོར།  ང) མང་སུ་ འགྱོ།
༣ མི་སེར་ཚུ་གི་ ཡིད་ཆེས་ ཐོབ་ཚུགས་ནི་འདི་ ...  ཀ) ལཱ་ དུས་ཚོད་ནང་འཁོད་ མཇུག་བསྡུ་བ་ལས།  ཁ) ཡིག་ཚང་ ཆེ་བ་ལས།  ག) ལཱ་གཡོག་པ་ མང་བ་ལས།  ང) གླ་ཆ་ མཐོ་བ་ལས།
༤ ཡིག་རྒྱུགས་ལྟར་ན་ ལཱ་གཡོག་པ་གིས་ ལཱ་འདི་ ...  ཀ) གཞན་གྱི་ ལཱ་ཨིན།  ཁ) རང་གི་ འགན་ཁུར་ཨིན།  ག) རྩེད་མོ་ཨིན།  ང) ལཱ་ཁག་ཨིན།""",
     key_points=[("༡ (ཁ)", 1), ("༢ (ག)", 1), ("༣ (ཀ)", 1), ("༤ (ཁ)", 1)], model="༡ (ཁ)  ༢ (ག)  ༣ (ཀ)  ༤ (ཁ)"),
dict(key="D3s", parent="D3", kind="new_scenario", type=C, marks=3, topic="Dzongkha comprehension", issues=[DZ], group=D2, pos=3, stem="""དྲི་བ་ ག། འོག་གི་མིང་ཚིག་ཚུ་གི་ རྗོད་ཚིག་བྲིས། (ཡིག་རྒྱུགས་ནང་ལས་ འདྲ་བཤུས་ཕབ་མི་ཆོག) (སྐུགས་ ༣)
༡༽ དུས་ཚོད།  ༢༽ ཞབས་ཏོག།  ༣༽ ཡིད་ཆེས།  ༤༽ འགན་ཁུར།  ༥༽ དྲང་བདེན།  ༦༽ གོང་འཕེལ།""",
     key_points=[("ཚིག་ ༦ ལུ་ རྗོད་ཚིག་ ཀྲིག་ཀྲི་ (ཚིག་རེ་ལུ་ ༠.༥)", 3)],
     model="""༡ ང་ ཨ་རྟག་ར་ དུས་ཚོད་ཁར་ སློབ་གྲྭ་ལུ་ འགྱོཝ་ཨིན།
༢ སྨན་པ་ཚུ་གིས་ ནད་པ་ཚུ་ལུ་ ཞབས་ཏོག་ ལེགས་ཤོམ་ བྱིནམ་ཨིན།
༣ ཨམ་ ཨ་པ་ཚུ་གིས་ ང་ལུ་ ཡིད་ཆེས་ བསྐྱེད་ཡི།
༤ མཐའ་འཁོར་ ཉམས་སྲུང་འདི་ ང་བཅས་ ག་ར་གི་ འགན་ཁུར་ཨིན།
༥ ཚོང་པ་འདི་ དྲང་བདེན་ཅན་ཅིག་ཨིན།
༦ ལམ་ཚུ་ བཟོ་ཞིནམ་ལས་ གཡུས་ཚན་ ནང་ གོང་འཕེལ་ བྱུང་ཡི།"""),
dict(key="D4s", parent="D4", kind="new_scenario", type=C, marks=5, topic="Dzongkha comprehension", issues=[DZ], group=D2, pos=4, stem="""དྲི་བ་ ང་། འོག་གི་དོན་མཚམས་འདི་ལྷག་སྟེ་ ཡིག་སྡེབ་འཛོལ་བ་ ༥ ཡོད་མི་ཚུ་ ངོས་འཛིན་འབད་ཞིནམ་ལས་ སྡེབ་བཅོས་ཁ་རྐྱབ་སྟེ་ བྲིས། (སྐུགས་ ༡x༥=༥)
ང་བཅས་རའི་ རྒྱལ་ཁབ་ཀྱི་ མཐའ་འཁོར་འདི་ ཉམས་སྲུང་འབད་ནི་འདི་ ང་བཅས་ ག་ར་གི་ འགན་ཁུར་ཨིན། ནགས་ཚལ་ཚུ་ ལེགས་ཤོམ་སྦེ་ སྲུང་སྐྱོབ་འབད་དེ་ ལྗོན་ཤིང་ཚུ་ བཙུགས་ནི་དང་ གད་སྙིགས་ཚུ་ ཁ་ཐོར་ མ་བཀོ་བར་ སྣོད་ནང་བླུགས་པ་ཅིན་ ཤུལ་མའི་ མི་རབས་ཚུ་ལུ་ ཕན་ཐོགས་ཡོདཔ་ཨིན།""".replace("ཉམས་སྲུང", "ཉམ་སྲུང").replace("སྲུང་སྐྱོབ", "སྲུང་སྐྱབ").replace("ལྗོན་ཤིང", "ལྗོན་ཤིན").replace("གད་སྙིགས", "གད་སྙིག").replace("ཕན་ཐོགས", "ཕན་ཐོག"),
     key_points=[("ཉམ་སྲུང → ཉམས་སྲུང", 1), ("སྲུང་སྐྱབ → སྲུང་སྐྱོབ", 1), ("ལྗོན་ཤིན → ལྗོན་ཤིང", 1), ("གད་སྙིག → གད་སྙིགས", 1), ("ཕན་ཐོག → ཕན་ཐོགས", 1)],
     model="ཉམ་སྲུང → ཉམས་སྲུང། སྲུང་སྐྱབ → སྲུང་སྐྱོབ། ལྗོན་ཤིན → ལྗོན་ཤིང། གད་སྙིག → གད་སྙིགས། ཕན་ཐོག → ཕན་ཐོགས།"),
# ---------------------------------------------------------------- Section V, translation English -> Dzongkha
dict(key="T1", real=True, type=T, marks=15, topic="Translation: English to Dzongkha", issues=[DZ], stem="""འོག་གི་ཨིང་སྐད་ནང་ཡོད་མི་དོན་མཚམས་འདི་ ལེགས་ཤོམ་སྦེ་ལྷག་ཞིནམ་ལས་ རྫོང་ཁའི་ཐོག་ལུ་ སྐད་སྒྱུར་འབད། (གནད་དོན་ཕོག་མ་ཕོག་དང་ གོ་རིམ་ སྡེབ་སྦྱོར་ཚུ་ལུ་ བལྟ་སྟེ་ སྐུགས་བྱིན་ནི་ཨིན།) (སྐུགས་ ༡༥)

Bhutan is making concerted efforts to position itself as a premium destination for holistic and high-quality education by 2035, according to the Industrial Development Roadmap 2025.

The goal is not only to improve education for citizens but also to attract international students and private investments into the sector.

Currently, 94 percent of students attend public institutions, while only 6 percent are enrolled in private schools and institutes. However, private sector participation increases at higher education levels.

With growing demand for diverse tertiary education, the Industrial Development Roadmap highlights the urgent need to expand infrastructure and strengthen both public and private education institutions.

According to the Bhutan Education Blueprint 2014-2025, private sector involvement is crucial, especially in diversifying and improving tertiary and technical education.""",
     key_points=[("གནད་དོན་ཕོག་མ་ཕོག་ - དོན་ཚན་ཆ་ཚང་ མ་ལུས་པར་ དོན་མ་འཛོལ་བར།", 7), ("ཨང་གྲངས་ (༢༠༣༥། ༩༤ ། ༦ ། ༢༠༡༤-༢༠༢༥) དང་ མིང་ (ཡིག་ཆ་) ཚུ་ ངོ་མ་བཟུམ།", 3),
                 ("གོ་རིམ་དང་ སྡེབ་སྦྱོར་ བརྡ་སྤྲོད།", 5)],
     model="""བཟོ་གྲྭ་གོང་འཕེལ་ལམ་སྟོན་ ༢༠༢༥ ལྟར་དུ་ འབྲུག་རྒྱལ་ཁབ་འདི་ སྤྱི་ལོ་ ༢༠༣༥ ཚུན་ ཆ་ཚང་དང་ སྤུས་ཚད་ལྡན་པའི་ ཤེས་རིག་གི་ གནས་ས་ མཐོ་ཤོས་ཅིག་སྦེ་ བཟོ་ནིའི་དོན་ལུ་ མཉམ་འབྲེལ་གྱི་ བརྩོན་ཤུགས་ བསྐྱེད་དེ་ཡོདཔ་ཨིན།

དམིགས་དོན་འདི་ མི་སེར་ཚུ་གི་ ཤེས་རིག་ ཡར་དྲག་གཏང་ནི་ རྐྱངམ་ཅིག་ མེན་པར་ ཕྱི་རྒྱལ་གྱི་ སློབ་ཕྲུག་ཚུ་དང་ སྒེར་གྱི་ མ་རྩ་བཙུགས་མི་ཚུ་ཡང་ ལས་སྡེ་འདི་ནང་ འདྲེན་ནི་ཨིན།

ད་ལྟོ་ སློབ་ཕྲུག་ བརྒྱ་ཆ་ ༩༤ གིས་ གཞུང་གི་ སློབ་གྲྭ་ཚུ་ནང་ སློབ་སྦྱོང་འབད་དོ་ཡོདཔ་ད་ བརྒྱ་ཆ་ ༦ རྐྱངམ་ཅིག་ སྒེར་གྱི་ སློབ་གྲྭ་དང་ ཚོགས་སྡེ་ཚུ་ནང་ ཐོ་བཀོད་འབད་དེ་ཡོད། ཨིན་རུང་ མཐོ་རིམ་ཤེས་རིག་གི་ གནས་རིམ་ཚུ་ནང་ སྒེར་སྡེའི་ མཉམ་ཞུགས་ ཡར་སེངམ་ཨིན།

མཐོ་རིམ་ཤེས་རིག་ སྣ་མང་གི་ དགོས་མཁོ་ ཡར་སེང་འགྱོ་མི་དང་བསྟུན་ བཟོ་གྲྭ་གོང་འཕེལ་ལམ་སྟོན་ནང་ གཞི་རྟེན་མཐུན་རྐྱེན་ རྒྱ་སྐྱེད་འབད་ནི་དང་ གཞུང་དང་ སྒེར་གྱི་ ཤེས་རིག་ཚོགས་སྡེ་ གཉིས་ཆ་ར་ ཤུགས་ཅན་བཟོ་ནིའི་ དགོས་མཁོ་ འཕྲལ་མཁོ་ཅན་ཅིག་ ཡོདཔ་སྦེ་ གསལ་སྟོན་འབད་དེ་ཡོད།

འབྲུག་གི་ཤེས་རིག་ཐག་ཡིག་ ༢༠༡༤-༢༠༢༥ ལྟར་དུ་ སྒེར་སྡེའི་ མཉམ་ཞུགས་འདི་ ལྷག་པར་དུ་ མཐོ་རིམ་དང་ བཟོ་རིག་ ཤེས་རིག་ སྣ་མང་དང་ ཡར་དྲག་གཏང་ནི་ལུ་ གལ་ཆེཝ་ཨིན།"""),
dict(key="T1s", parent="T1", kind="new_scenario", type=T, marks=15, topic="Translation: English to Dzongkha", issues=[DZ], stem="""འོག་གི་ཨིང་སྐད་ནང་ཡོད་མི་དོན་མཚམས་འདི་ ལེགས་ཤོམ་སྦེ་ལྷག་ཞིནམ་ལས་ རྫོང་ཁའི་ཐོག་ལུ་ སྐད་སྒྱུར་འབད། (སྐུགས་ ༡༥)

Bhutan aims to increase the use of digital services in government offices so that citizens can apply for documents and pay bills online without travelling to a Dzongkhag headquarters.

Today, many services are already available through online portals and mobile applications. However, people in rural areas still face problems because of weak internet connections and limited digital skills.

To address these challenges, the government plans to improve network coverage, train community members as digital helpers and make online forms available in Dzongkha.""",
     key_points=[("གནད་དོན་ཕོག་མ་ཕོག་ - དོན་ཚན་ཆ་ཚང་ མ་ལུས་པར།", 7), ("ཚིག་ (digital services, portals, network coverage) ཚུ་ རྫོང་ཁ་ནང་ ངོ་མ་སྦེ་ སྒྱུར་ཡོདཔ།", 3), ("གོ་རིམ་དང་ སྡེབ་སྦྱོར་ བརྡ་སྤྲོད།", 5)],
     model="""འབྲུག་རྒྱལ་ཁབ་ཀྱིས་ མི་སེར་ཚུ་ རྫོང་ཁག་གི་ ལྟེ་བ་ལུ་ འགྲུལ་བསྐྱོད་ མ་འབད་བར་ ཡིག་ཆ་ཚུ་གི་ ཞུ་ཡིག་ཕུལ་ནི་དང་ གླ་ཆ་ཚུ་ ཡོངས་འབྲེལ་ཐོག་ལས་ སྤྲོད་ཚུགས་ནིའི་དོན་ལུ་ གཞུང་གི་ ཡིག་ཚང་ཚུ་ནང་ ཨང་རྟགས་ཅན་གྱི་ ཞབས་ཏོག་ཚུ་ ལག་ལེན་ ཡར་སེང་གཏང་ནིའི་ དམིགས་དོན་ བཞག་ཡོདཔ་ཨིན།

ད་རིས་ ཞབས་ཏོག་ ལེ་ཤ་ཅིག་ ཡོངས་འབྲེལ་གྱི་ སྒོ་སྒྲིག་དང་ ཁ་པར་གྱི་ ལག་ལེན་ཐབས་རིག་ཚུ་བརྒྱུད་དེ་ ཐོབ་ཚུགས་ཏེ་ཡོད། ཨིན་རུང་ གཡུས་ཁའི་ ས་གནས་ཚུ་ནང་ ཡོངས་འབྲེལ་གྱི་ མཐུད་ལམ་ ཉམས་ཆུང་བ་དང་ ཨང་རྟགས་ལག་ཤེས་ ཉུང་བ་ལས་བརྟེན་ མི་ཚུ་ལུ་ དཀའ་ངལ་ ད་ལྟོ་ཡང་ ཡོདཔ་ཨིན།

དཀའ་ངལ་དེ་ཚུ་ སེལ་ནིའི་དོན་ལུ་ གཞུང་གིས་ བརྒྱུད་འཕྲིན་གྱི་ ཁྱབ་ཚད་ ཡར་དྲག་གཏང་ནི། མི་སྡེའི་ འཐུས་མི་ཚུ་ ཨང་རྟགས་རོགས་རམ་པ་སྦེ་ སྦྱོང་བརྡར་བྱིན་ནི། ཡོངས་འབྲེལ་གྱི་ འགེངས་ཤོག་ཚུ་ རྫོང་ཁ་ནང་ བཟོ་ནིའི་ འཆར་གཞི་ ཡོདཔ་ཨིན།"""),
]
