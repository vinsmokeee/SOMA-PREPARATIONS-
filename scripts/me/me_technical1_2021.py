"""ME Technical Paper I, BCSE 2021 (real questions only), batch 5. PDF sent by the founder (20 Nov 2026).
Questions join the 2025 bank (pattern from me_technical1_2025.py). 2021 had FOUR topical questions (any two).
Dzongkha 2021: comprehension ka 9, kha 3, ga 3 (15) + translation 15 = 30. Left out of GK (answer not certain):
Q3 (National Land Commission members), Q12 (endangered language), Q15 (order of Je Khenpos).
"""
import os, runpy
_base = runpy.run_path(os.path.join(os.path.dirname(__file__), "me_technical1_2025.py"))
PATTERN, RUBRIC = _base["PATTERN"], _base["RUBRIC"]
CS, TOP, M, C, T = "analytical", "long_answer", "mcq", "passage", "translation"

BATCH = "ME Paper I (Technical): BCSE 2021, batch 5"
GROUP_TAG = "2021b5"
PAPER = "me-technical-1"
SUBJECT = "language-general-knowledge"
MIN_WORDS = 0
ADDS_TO_PAPER = True
SOURCE = {"title": "BCSE 2021 Main Examination, Technical category, Paper I (Language and GK)", "year": 2021,
          "url": "https://rcsc.gov.bt/technical-paper-1/"}
DZ = "Dzongkha: please have a fluent Dzongkha reader check it before publishing."
PDF = "Real RCSC Dzongkha text from a PDF whose font drops letters; repaired automatically: compare with the PDF."
G1, D1 = "me-technical-1-2021b5-cs", "me-technical-1-2021b5-dz"

CASE = """Read the following passage (an excerpt from the book 'The Tipping Point') and answer ALL THREE questions.

Suicide, smoking, and the search for the unsticky cigarette: Case Study (by Malcolm Gladwell)

Not long ago, on the South Pacific islands of Micronesia, a seventeen-year-old boy named Sima got into an argument with his father. He was staying with his family at his grandfather's house when his father - a stern and demanding man - ordered him out of bed early one morning and told him to find a bamboo pole-knife to harvest breadfruit. Sima spent hours in the village, looking without success for a pole-knife, and when he returned empty-handed, his father was furious. “The family would now go hungry”, he told his son, waving a machete in rage. "Get out of here and go find somewhere else to live."

Sima left his grandfather's house and walked back to his home village. Along the way, he ran into his fourteen-year-old brother and borrowed a pen. Two hours later, curious about where Sima had gone, his brother went looking for him. He returned to the now empty family house and peered in the window. In the middle of a dark room, hanging slack and still from a noose, was Sima. He was dead. His suicide note read: My life is coming to an end at this time. Now today is a day of sorrow for myself, also a day of suffering for me. But it is a day of celebration for Papa. Today Papa sent me away. Thank you for loving me so little. Sima. Give my farewell to Mama. Mama, you won't have any more frustration or trouble from your boy. Much love from Sima.

In the early 1960s, suicide on the islands of Micronesia was almost unknown. But for reasons no one quite understands, it then began to rise, steeply and dramatically, by leaps and bounds every year, until by the end of the 1980s there were more suicides per capita in Micronesia than anywhere else in the world. For males between fifteen and twenty-four, the suicide rate in the United States is about 22 per 100,000. In the islands of Micronesia, the rate is about 160 per 100,000 - more than seven times higher. At that level, suicide is almost commonplace, triggered by the smallest of incidents. Sima took his own life because his father yelled at him. In the midst of the Micronesian epidemic, that was hardly unusual. Teens committed suicide on the islands because they saw their girlfriends with another boy, or because their parents refused to give them a few extra dollars for beer. One nineteen-year-old hanged himself because his parents didn't buy him a graduation gown. One seventeen-year-old hanged himself because he had been rebuked by his older brother for making too much noise. What, in Western cultures, is something rare, random, and deeply pathological, has become in Micronesia a ritual of adolescence, with its own particular rules and symbols. Virtually all suicides on the islands, in fact, are identical variations on Sima's story. The victim is almost always male. He is in his late teens, unmarried, and living at home. The precipitating event is invariably domestic: a dispute with girlfriends or parents. In three quarters of the cases, the victim had never tried - or even threatened - suicide before. The suicide notes tend to express not depression but a kind of wounded pride and self-pity, a protest against mistreatment. The act itself typically occurs on a weekend night, usually after a bout of drinking with friends. In all but a few cases, the victim observes the same procedure, as if there

were a strict, unwritten protocol about the correct way to take one's own life. He finds a remote spot or empty house. He takes a rope and makes a noose, but he does not suspend himself, as in a typical Western hanging. He ties the noose to a low branch or a window or a doorknob and leans forward, so that the weight of his body draws the noose tightly around his neck, cutting off the flow of blood to the brain. Unconsciousness follows. Death results from anoxia - the shortage of blood to the brain.

In Micronesia, the anthropologist Donald Rubinstein writes, these rituals have become embedded in the local culture. As the number of suicides has grown, the idea has fed upon itself, infecting younger and younger boys, and transforming the act itself so that the unthinkable has somehow been rendered thinkable. According to Rubinstein, who has documented the Micronesian epidemic in a series of brilliant papers: Suicide ideation among adolescents appears widespread in certain Micronesian communities and is popularly expressed in recent songs composed locally and aired on Micronesian radio stations, and in graffiti adorning T-shirts and high school walls. A number of young boys who attempted suicide reported that they first saw or heard about it when they were 8 or 10 years old. Their suicide attempts appear in the spirit of imitative or experimental play. One 11-year-old boy, for example, hanged himself inside his house and when found he was already unconscious and his tongue protruding. He later explained that he wanted to "try" out hanging. He said that he did not want to die, although he knew he was risking death. Such cases of imitative suicide attempts by boys as young as five and six have been reported recently from Truk. Several cases of young adolescent suicide deaths recently in Micronesia were evidently the outcome of such experiments. Thus, as suicide grows more frequent in these communities the idea itself acquires a certain familiarity if not fascination to young men, and the lethality of the act seems to be trivialized. Especially among some younger boys, the suicide acts appear to have acquired an experimental almost recreational element.

There is something very chilling about this passage. Suicide isn't supposed to be trivialized like this. But the truly chilling thing about it is how familiar it all seems. Here we have a contagious epidemic of self-destruction, engaged in by youth in the spirit of experimentation, imitation, and rebellion. Here we have a mindless action that somehow, among teenagers, has become an important form of self-expression. In a strange way, the Micronesian teen suicide epidemic sounds an awful lot like the epidemic of teenage smoking in the West.

Teenage smoking is one of the great, baffling phenomena of modern life. No one really knows how to fight it, or even, for that matter, what it is. The principal assumption of the anti-smoking movement has been that tobacco companies persuade teens to smoke by lying to them, by making smoking sound a lot more desirable and a lot less harmful than it really is. To address that problem, then, we've restricted and policed cigarette advertising, so it's a lot harder for tobacco companies to lie. We've raised the price of cigarettes and enforced the law against selling tobacco to minors, to try to make it much harder for teens to buy cigarettes. And we've run extensive public health campaigns on television and radio and in magazines to try to educate teens about the dangers of smoking.

It has become fairly obvious, however, that this approach isn't very effective. Why do we think, for example, that the key to fighting smoking is educating people about the risks of cigarettes? Harvard University economist W. Kip Viscusi recently asked a group of smokers to guess how many years of life, on average, smoking from the age of twenty-one onward would cost them. They guessed nine years. The real answer is somewhere around six or seven. Smokers aren't smokers because they underestimate the risks of smoking. They smoke even though they overestimate the risk of smoking.

At the same time, it is not clear how effective it is to have adults tell teenagers that they shouldn't smoke. As any parent of a teenage child will tell you, the essential contrariness of adolescents suggests that the more adults inveigh against smoking and lecture teenagers about its dangers, the more teens, paradoxically, will want to try it. Sure enough, if you look at smoking trends over the past decade or so, that is exactly what has happened. The anti-smoking movement has never been louder or more prominent. Yet all signs suggest that among the young the anti-smoking message is backfiring. Between 1993 and 1997, the number of college students who smoke jumped from 22.3 % to 28.5 %. Between 1991 and 1997, the number of high school students who smoke jumped to 32 %. Since 1988, in fact, the total number of teen smokers in the United States has risen an extraordinary 73 %. There are few public health programs in recent years that have fallen as short of their mission as the war on smoking.

The lesson here is not that we should give up trying to fight cigarettes. The point is simply that the way we have tended to think about the causes of smoking doesn't make a lot of sense. That's why the epidemic of suicide in Micronesia is so interesting and potentially relevant to the smoking problem. It gives us another way of trying to come to terms with youth smoking. What if smoking, instead of following the rational principles of the marketplace, follows the same kind of mysterious and complex social rules and rituals that govern teen suicide? If smoking really is an epidemic like Micronesian suicide, how does that change the way we ought to fight the problem?"""

DZP = """ད་རེས་ནངས་པ་ དཔལ་འབོར་གོང་འཕེལ་འགྱོཝ་དང་གཅིག་ཁར་ མི་གི་བསམ་པ་དང་སྤྱོད་པ་ཡང་ འགྱུར་ཏེ་འགྱོ་མི་ཚུ་ ང་བཅས་ར་ཆོས་དང་ལམ་སྲོལ་ལས་བརྟེན་ཏེ་ བཅོས་ཁ་རྐྱབ་དགོཔ་འདི་ག་ཅི་དེ་ ཁག་ཆེ་བས་ཟེར་ཞུ་ནི་ཨིན། དཔེ་གཏམ་ལས་ འདོདཔ་ཆེནི་ཀུན་དང་བྲལ་ཟེར་སླབ་དོ་བཟུམ་སྦེ་ རྒྱུ་ནོར་ལུ་ཞན་ཆགས་བསྐྱེད་པ་ཅིན་ སེམས་ལུ་ཞི་བདེ་དང་དགའ་སྐྱིད་མེད་པའི་ཁར་ ཤིཝ་ད་ལུ་ཡང་དམྱལ་བར་ལུ་འགྱོ་ནིའི་ལཱ་ཨིནམ་ལས། ཆོས་དང་ལམ་སྲོལ་ལས་བརྟེན་པའི་ རང་གི་སེམས་ལུ་ དགའ་སྐྱིད་དང་ཞི་བདེ་ཐོབ་མི་ཚུགས།དཔེ་གཏམ་ལས་ཡང་ དཔེ་ཅིག་ཡོདན་ ཀུན་གྱིས་ཤེས། མཚམས་ཚོད་ཤེས་ན་མཁས་པའི་རྟགས་ ཟེར་སླབ་དོ་བཟུམ་སྦེ་ ནང་པའི་ཆོས་ལྡན་གྱི་རྒྱལ་ཁབ་ནང་ སྐྱེས་མིའི་མི་སེར་ཚུ་ འདོད་པ་མ་ཆེ་བར་ རྒྱུ་ནོར་ལུ་མཚམས་ཚོད་ཤེས་ཏེ་ མནོ་བསམ་གཏང་ཐངས་དང་བ་བ་སྤྱོད་ལམ་ལེགས་ཤོམ་གྱི་ཐོག་ལས་ གཞན་ལུ་གནོད་པའི་སེམས་འདི་སྤངས་ཞིནམ་ལས་ ཕན་པའི་མནོ་བསམ་གཏང་ཚུགས་པ་ཅིན་ལེགས་ཤོམ་འོང་ནི་ཨིན།

དཔལ་ལྡན་འབྲུག་པའི་རྒྱལ་ཁབ་འདི་ནང་ལུ་ ཆོས་དང་འཇིག་རྟེན་གཉིས་ཀྱི་ལམ་སྲོལ་ཚུ་ རྒྱལ་ཁབ་གཞན་དང་དང་རྩ་ལས་རང་མ་འདྲཝ་སྦེ་ སྔོན་བྱོན་རྒྱལ་བ་གོངམ་དང་ཕམ་བཟང་པོ་ཚུ་གི་མཛད་ཤུལ་ ཡ་མཚན་ཆེ་ཏོག་ཏོ་གི་རྒྱལ་ཡོངས་སྐད་ཡིག་རྫོང་ཁ་དང་ གྱོན་ཆས་གོ་དང་དཀྱི་ར་ སྒྲིག་ལམ་རྣམ་གཞག་ཚུ་ མ་ཉམས་པར་ཧེ་མ་ལས་ད་ལོ་ཚུན་ཚོད་ མི་རབས་བརྒྱུད་དེ་ གོངམ་གིས་འོགམ་ལུ་བྱམས་བརྩེ་དང་སྐྱིད་སྡུག་ འོགམ་གི་གོངམ་ལུ་དད་པ་དང་གུས་ཞབས། ཕམ་དང་བུ་གཞི་གི་འདུ་ཤེས་ སྤུན་ཆའི་བརྩེ་གདུང་། ཉེ་འཁོར་གྱི་ཆ་བཞག། གཉེན་གྲོགས་ཀྱི་དམ་ཚིག། དགའ་མཐུན་གྱི་དག་སྣང་། ཁྱིམ་ཚང་ངོ་ཤེས་འདྲིས་ཤེས་ཅན་གྱི་མི་ཚུ་ལུ་ བརྩེ་བའི་སེམས་རྒྱུན་ཆད་མེད་པར་བསྐྱེད་དགོ།

མི་དང་སེམས་ཅན་ཚུ་ལུ་ ཕན་པ་གཞན་འབད་མ་ཚུགསས་རུང་ ན་བ་ཅིན་ཤི་མ་བཅུག་ཟེར་བའི་བྱམས་པ་དང་ ཤི་བ་ཅིན་ཨའེ་ཚ་ཁ་མ་ཚུད་འབད་ ཟེར་བའི་སྙིང་རྗེ་ སེམས་ཀྱི་གདིང་ལས་རང་བསྐྱེད་དགོཔ་ཨིན། དཔེ་གཏམ་ལས་ཡང་ རོགས་ལུ་སྡུག་བསྔལ་བྱུང་དུས།།རང་ལུ་ཧིང་ཚིམ་མ་འབད།། སྡུག་བསྔལ་རང་ལུ་ འཁོར་ནི་ཡོད་ཟེར་མནོ་དགོཔ་མ་ཚད་ སངས་རྒྱས་རུང་མཉམ་གཅིག། དམྱལ་བར་འགྱོ་རུང་མཉམ་གཅིག། དགའ་ན་དགའ་བའི་ཆ་རོགས། སྐྱོ་ན་སྐྱོ་བའི་ཆ་རོགས། འབད་ནི་གི་མནོ་བསམ་གཏང་ཤེས་དགོ།

དེ་སྦེ་མེན་པར་ རང་བདེ་ཏོག་ཏོ་སྡོད་ནི་ཡོད་པ་ཅིན་ རོགས་དོག ་སར་ཚུད་པ་བལ་ནི་མེད་པའི་མི་ཚུ་གི་ཁ་ལུ་ཉན། རང་གི་གོངམ་དང་ཕམ་སྤུན་ཆ་ཚུ་ལུ་ཞེན་པ་ལོག། ལམ་ལུགས་སྲོལ་བཟང་པོ་ ཆོས་དང་འབྲེལ་བའི་ལཱ་གཞན་འབད་ནི་ཕར་ར་བཞག། ཐཱ་ན་རང་གི་ཕམ་གིས་ བསྟེན་པའི་ཆོས་སྐྱོང་ཚུ་ལུ་ གསོལ་མཆོད་ཕུལ་ཏེ་བསྟེན་མ་ཤེས། རང་གིས་འབད་མིའི་ལཱ་ཚུ་ཡང་ དགེ་བ་དང་སྡིག་པ་ ཕན་པ་དང་གནོད་པ་ག་ཅི་ཨིན་ན་ ཧ་མ་གོཝ་སྦེ་མ་སྡོད་པར་ རྒྱལ་ཁབ་ཀྱི་ཁྱད་ཆོས་བཟང་པོའི་ངོ་རྟགས་ ཆོས་དང་ལམ་སྲོལ་ སྐད་ཡིག་དང་གྱོན་ཆས་ཚུ་ལུ་ བདག་འཛིན་མ་འབད་བར་མར་ཉམས་སོང་པ་ཅིན་ རྒྱལ་ཁབ་ཀྱི་རང་དབང་རང་བཙན་དང་ སྲུང་སྐྱོབ་ལུ་ གནོད་ནི་ཨིནམ་ཤེས་ཏེ་ ཆོས་དང་ལམ་སྲོལ་ བདག་འཛིན་འཐབ་དགོཔ་འདི་ རང་གི་སྲོག་ལས་ལྷག་པའི་ཁག་ཆེཝ་སྦེ་བརྩི་ཤེས་དགོ།"""

TR = """Today I speak on behalf of our teachers and students – our teachers will always be committed and dedicated teachers – our students will always be diligent and loyal students – but it is the duty of parents, policy makers and the government to put the right tools in their hands – the right books, the right curriculum, the right direction. For this we must first ask ourselves where do we want to go as an economy, as a democracy, as a nation. In other words, what is the Vision for Bhutan? Then we must build an education system that nurtures people with the right skills, knowledge and training to fulfill this Vision. The sooner we realize this the better. The word Vision is such a profound word and yet one that is so commonly mis-used. I feel that there is no better reason to use this word than to describe the importance of education. For if our Vision for the nation is not contained in the pages of the books that our young children hold, in the words of our teachers as they lead their classrooms, and in the education policies of our governments, then let it be said– we have no Vision.

An excerpt from Address of His Majesty The King during 3rd convocation of the Royal University of Bhutan."""


def mcq(key, stem, opts, ans, exp):
    return dict(key=key, real=True, type=M, topic="General knowledge", stem=stem, opts=opts, ans=ans, exp=exp)


def top(key, topic, stem, kp, model):
    return dict(key=key, real=True, type=TOP, marks=10, topic=topic, stem=stem + " (10 marks)", key_points=kp, model=model)


Q = [
dict(key="A1", real=True, type=CS, marks=10, topic="Case study", group=G1, pos=1, stem=CASE + """

Question 1
What are the similarities between the two cases: the Micronesian epidemic and the smoking epidemic in the US? (10 marks)""",
     key_points=[("Both are 'epidemics' among youth that spread by imitation and contagion, not reasoning", 3),
                 ("Both are acts of experimentation, rebellion and self-expression among teenagers", 3),
                 ("Both follow social rules/rituals; information and adult warnings do not stop them (smokers overestimate risks; anti-smoking messages backfire)", 4)],
     model="""The author sees several similarities.

First, both are epidemics that mainly affect young people and spread from person to person. In Micronesia, suicide spread as boys heard about it, imitated it and even "tried it out"; teenage smoking in the US also spreads through imitation of peers.

Second, both are acts of experimentation, rebellion and self-expression. Micronesian suicides were a protest against parents or girlfriends; smoking is a way for teenagers to show independence from adults.

Third, both follow social rules and rituals rather than rational thinking. Micronesian suicides followed an almost fixed protocol, and smoking follows its own social codes. As a result, rational approaches fail: smokers smoke even though they overestimate the risks, and the louder adults lecture against smoking, the more teenagers want to try it, just as warnings did not stop suicide from becoming "thinkable" in Micronesia."""),
dict(key="A2", real=True, type=CS, marks=10, topic="Case study", group=G1, pos=2, stem="""Question 2
How does the author suggest that the Micronesian epidemic is deeply rooted in the day-to-day practice and culture of the Micronesian youth? (10 marks)""",
     key_points=[("Suicide became a 'ritual of adolescence' with set rules: typical victim, trigger, weekend night after drinking, same method", 4),
                 ("Embedded in local culture: songs on radio, graffiti on T-shirts and school walls; children hear of it at 8-10", 3),
                 ("Imitative 'experimental play' by young boys; the act trivialised and made thinkable", 3)],
     model="""The author shows that suicide had become part of everyday youth culture in Micronesia.

It had become "a ritual of adolescence, with its own particular rules and symbols". The victim is almost always a young unmarried male living at home; the trigger is a domestic quarrel; it happens on a weekend night after drinking with friends; and the method follows an unwritten protocol with a noose tied to a low branch or doorknob.

Anthropologist Donald Rubinstein notes that the idea had become embedded in local culture: it appeared in locally composed songs on the radio and in graffiti on T-shirts and school walls. Boys first heard about it at eight or ten, and even five- and six-year-olds attempted it in "imitative or experimental play". As it became familiar, the act was trivialised, so that "the unthinkable has somehow been rendered thinkable"."""),
dict(key="A3", real=True, type=CS, marks=10, topic="Case study", group=G1, pos=3, stem="""Question 3
How do you relate the Micronesian epidemic and the smoking epidemic of the US to the smoking habit and the suicide trend among the youth of Bhutan? (10 marks)""",
     key_points=[("Smoking/tobacco and substance use among Bhutanese youth spread through peers and imitation despite the Tobacco Control Act and awareness", 3),
                 ("Youth suicide in Bhutan: rising concern; triggers (family conflict, relationships, exams, unemployment, alcohol); risk of imitation via social media", 3),
                 ("Lessons: approaches beyond lectures - peer influencers, counselling, family support, responsible media reporting, helplines", 4)],
     model="""Similar patterns can be seen in Bhutan.

Smoking and chewing tobacco remain common among young people even though Bhutan has strict tobacco control laws and awareness campaigns. Many young people start because friends do, to look mature or to rebel, just as in the US. Bans and lectures alone have not stopped it; tobacco is still smuggled and shared among peers.

Suicide is a growing concern among Bhutanese youth too. Triggers are often domestic or personal - family conflict, relationships, exam failure, unemployment, often combined with alcohol - and news and social media posts can spread the idea among vulnerable young people, as in Micronesia.

The lesson is that we must treat these as social epidemics: use positive peer leaders, school counsellors and helplines, strengthen family communication, train teachers to spot warning signs, and ensure responsible media reporting that does not glamorise suicide or smoking."""),
top("B1", "Topical issues: health and governance", """Both formal media and social media seem to praise the way Bhutan managed the Covid-19 pandemic so far. In your opinion, did Bhutan succeed or fail in managing and containing the pandemic so far? What are the factors contributing to either the success or the failure story?""",
    [("Clear view (success)", 2), ("Leadership of His Majesty and quick government action (border control, quarantine, lockdowns, testing)", 3),
     ("Vaccination campaign (very high coverage in days) and support from friendly countries", 2), ("Desuups, frontline workers and public cooperation; Druk Gyalpo's Relief Kidu", 3)],
    """In my view Bhutan clearly succeeded in managing the pandemic, recording very few deaths compared with most countries.

The most important factor was the leadership of His Majesty The King, who travelled across the country to guide preparations and personally supported frontline workers. The government acted early: borders were closed, mandatory quarantine and testing were introduced, and lockdowns were imposed quickly when cases appeared.

The vaccination campaign was among the fastest in the world, vaccinating most adults within days, with vaccines from India, the USA and other friends.

De-suups, health workers and volunteers worked tirelessly at borders and quarantine centres, and the Druk Gyalpo's Relief Kidu supported people who lost incomes. Finally, Bhutanese people cooperated, followed protocols and trusted their leaders. Although the economy suffered, protecting lives was achieved."""),
top("B2", "Topical issues: environment and agriculture", """In the past, the human-wildlife conflict was limited to loss of agricultural produce and domestic animals. However, in recent times, the conflict has taken human lives. Suggest practical strategies to solve this human-wildlife conflict.""",
    [("Physical protection: electric/solar fencing, chain-link fencing, guarding huts, lighting and noise devices", 3), ("Compensation and insurance schemes (crop and livestock insurance)", 2),
     ("Land use and habitat: protect forest food and corridors, avoid farming in wildlife paths, relocate high-risk fields", 2), ("Awareness, early-warning and rapid response teams; safe practices for people", 3)],
    """Several practical strategies can reduce the conflict.

First, protect fields and homes physically: electric (solar) fencing and chain-link fences around villages and fields, community guarding schedules, lights and noise alarms, and secure sheds for livestock at night.

Second, support farmers financially through crop and livestock insurance and timely compensation, so that losses do not push families to retaliate against animals.

Third, manage land wisely: keep wildlife corridors and forest food sources intact, avoid cultivating crops that attract animals near forest edges, and encourage alternative crops or relocation of high-risk fields.

Finally, protect people's lives with awareness on how to behave around bears, elephants and tigers, early-warning systems such as phone alerts when elephants are nearby, and rapid response teams from the forestry department."""),
top("B3", "Topical issues: skills and economy", """During the Covid-19 pandemic, the construction sector in Bhutan has suffered due to lack of foreign technical manpower. This went on to show that Bhutan is still dependent on foreign technical skill in the construction sector. How can Bhutan improve technical skill in future?""",
    [("Strengthen TVET: modern technical training institutes, apprenticeships, certification", 3), ("Change attitudes: dignity of blue-collar work, better pay and safety, career paths", 3),
     ("Incentives: Build Bhutan Project-type programmes, contractor quotas for local workers, mechanisation", 2), ("Partnerships with industry and foreign experts for skills transfer", 2)],
    """Bhutan can build its own technical workforce in several ways.

First, strengthen technical and vocational education: modernise TTIs, offer practical courses in masonry, carpentry, plumbing, electrical work and machine operation, and link training with real apprenticeships on construction sites, followed by national certification.

Second, change attitudes towards manual work: improve wages, safety, insurance and career paths so that young people see construction as a respectable profession, not a last resort.

Third, provide incentives: programmes like the Build Bhutan Project, requirements for contractors to employ and train a share of Bhutanese workers, and support for mechanisation that needs fewer but more skilled workers.

Finally, use partnerships with foreign firms and experts so that every large project transfers skills to Bhutanese workers."""),
top("B4", "Topical issues: youth and society", """Young people worldwide today have trendy perceptions of beauty and body standards that could be detrimental to their health, psychological wellbeing, and social behaviour. Discuss the reality of the situation in Bhutan.""",
    [("Reality in Bhutan with examples (social media and K-pop influence, fairness creams, dieting, cosmetics, gym/supplement use)", 4),
     ("Effects on health (eating disorders, unsafe products), mind (low self-esteem, anxiety, comparison) and behaviour (spending, bullying)", 4), ("Suggestions", 2)],
    """Bhutanese youth are not immune to global beauty trends. Through social media, films and K-pop, many young people admire very slim, fair-skinned, "perfect" looks. Fairness creams, cosmetics, hair colouring and fashion are increasingly popular, and some young people diet excessively or use supplements to change their bodies.

These standards can harm health when young people skip meals, take unsafe products or develop eating disorders. They also affect mental wellbeing: comparing themselves with edited photos online leads to low self-esteem, anxiety and depression. Socially, they can lead to body-shaming, bullying and spending money on appearance rather than essentials.

However, many Bhutanese youth still value traditional dress and inner qualities. Schools, parents and media should promote healthy body image, media literacy, sports and the idea that beauty lies in character and kindness."""),
mcq("C1", "The International Day of Happiness is celebrated every year on", ["20th March", "21st March", "20th April", "21st April"], 0, "The UN International Day of Happiness is 20 March."),
mcq("C2", "The first country to launch an automated (self-driving) train sharing tracks with regular trains is", ["USA", "UK", "Germany", "Japan"], 2, "Germany (Hamburg S-Bahn, 2021)."),
mcq("C4", "Who is the author of the book 'A Promised Land'?", ["J.K. Rowling", "Barack Obama", "Shashi Tharoor", "Mahatma Gandhi"], 1, "'A Promised Land' (2020) is Barack Obama's memoir."),
mcq("C5", "What do the five Olympic rings represent?", ["Values", "Ethnicity", "Diversity", "Continents"], 3, "The rings stand for the five inhabited continents united by the Olympics."),
mcq("C6", "All of the following countries have embassies in Bhutan EXCEPT", ["India", "Bangladesh", "Thailand", "Kuwait"], 2, "India, Bangladesh and Kuwait have embassies in Thimphu; Thailand does not."),
mcq("C7", "The 2021 Nobel Peace Prize was awarded to the field of", ["Chemistry", "Journalism", "Literature", "Medicine"], 1, "Journalists Maria Ressa and Dmitry Muratov received the 2021 Nobel Peace Prize."),
mcq("C8", "Lumbini, the birthplace of Gautama Buddha, is in", ["Bihar", "Sikkim", "Nepal", "Sri Lanka"], 2, "Lumbini is in southern Nepal."),
mcq("C9", "The national flag of Bhutan was first used during", ["the signing of the Indo-Bhutan Treaty in 1949", "Prime Minister Nehru's visit to Bhutan in 1958", "the signing of the Treaty of Sinchula in 1865", "Bhutan's admission to the UN in 1971"], 0, "The first national flag was designed for the signing of the 1949 Indo-Bhutan Treaty."),
mcq("C10", "The DOGE-1 mission to the Moon was to be launched by which company?", ["ISRO", "NASA", "Roscosmos", "SpaceX"], 3, "DOGE-1 was announced as a SpaceX rideshare mission."),
mcq("C11", "From which country did the United States withdraw its troops in 2021?", ["Afghanistan", "Iran", "Iraq", "Yemen"], 0, "US troops left Afghanistan in August 2021."),
mcq("C13", "All of the following are Scandinavian countries EXCEPT", ["Denmark", "Canada", "Sweden", "Norway"], 1, "Scandinavia is Denmark, Norway and Sweden."),
mcq("C14", "G-77 is a group of", ["the most developed countries", "developed countries", "developing countries", "underdeveloped countries"], 2, "The Group of 77 is a coalition of developing countries at the UN."),
mcq("C16", "Which of the following is NOT an official language of the UN?", ["Arabic", "Chinese", "French", "German"], 3, "German is not one of the six official UN languages."),
mcq("C17", "Peace is symbolised by which of the following?", ["Blue light", "Lotus", "Olive branch", "Candle flame"], 2, "The olive branch is a traditional symbol of peace."),
mcq("C18", "How many Opposition Party members were there in the National Assembly in 2008-2013?", ["2", "3", "7", "8"], 0, "The PDP won only 2 of 47 seats in 2008."),
mcq("C19", "The capital of Sweden is", ["Vienna", "Helsinki", "Ottawa", "Stockholm"], 3, "Stockholm is Sweden's capital."),
mcq("C20", "UNIDO stands for", ["The United Nations Infrastructure Development Organization", "The United Nations Industrial Development Organization", "The United Nations Innovation Development Organization", "The United Nations Immunology Development Organization"], 1, "UNIDO is the UN Industrial Development Organization."),
dict(key="D1", real=True, type=C, marks=9, topic="Dzongkha comprehension", issues=[DZ, PDF], group=D1, pos=1, stem=DZP + """

ལྟག་གི་ཡིག་རྒྱུགས་ལྷག་ཞིནམ་ལས་ དྲི་བ་ ཀ་ ཁ་ ག་ གསུམ་གྱི་ལན་བྲིས།

ཀ༽ འོག་གི་དྲི་བ་ཚུ་གི་ལན་བྲིས། (སྐུགས་ ༩)
༡ དཔལ་འབོར་གོང་འཕེལ་འགྱོཝ་དང་གཅིག་ཁར་ མིའི་བསམ་སྤྱོད་འགྱུར་ཏེ་འགྱོ་མི་ཚུ་ བཅོས་ཁ་རྐྱབ་དགོ་པ་ཅིན་ ག་ཅི་གིས་རྐྱབ་དགོཔ་སྦེ་ བཀོད་ནུག་གོ? (༡)
༢ རྒྱུ་ནོར་ལུ་སེམས་ཆགས་པ་ཅིན་ རང་གི་མི་ཚེ་ནང་ལུ་ གནོད་པ་ག་ཅི་རང་འདུག་གོ? གནད་དོན་ ༢ བྲིས། (༢)
༣ རྒྱལ་ཁབ་གཞན་དང་མ་འདྲཝ་སྦེ་ཡོད་པའི་ ཕམ་བཟང་པོའི་མཛད་ཤུལ་གྱི་ལམ་སྲོལ་ ཡིག་རྒྱུགས་འདི་ནང་ཡོད་མི་ ༢ ཐོ་བཀོད་འབད། (༢)
༤ མི་དང་སེམས་ཅན་ཚུ་ལུ་ ཕན་པའི་ལཱ་གཞན་འབད་མ་ཚུགས་རུང་ ག་ཅི་འབད་དགོཔ་སྦེ་ བཀོད་དེ་འདུག་གོ? (༢)
༥ ཁྱོད་ཀྱིས་འབད་བ་ཅིན་ ང་བཅས་རའི་ཆོས་དང་ལམ་སྲོལ་ཚུ་ བདག་འཛིན་འབད་དགོཔ་ཁག་ཆེ་བས་ག? ག་ཅི་འབད? (༢)""",
     key_points=[("༡ ཆོས་དང་ལམ་སྲོལ་གྱིས།", 1), ("༢ སེམས་ལུ་ ཞི་བདེ་དང་ དགའ་སྐྱིད་མེད། ཤི་བའི་ཤུལ་ལུ་ དམྱལ་བར་འགྱོ་ནིའི་ལཱ།", 2),
                 ("༣ རྒྱལ་ཡོངས་སྐད་ཡིག་ རྫོང་ཁ། གྱོན་ཆས་ གོ་དང་ ཀི་ར། སྒྲིག་ལམ་རྣམ་གཞག། (གཉིས་)", 2), ("༤ ན་བ་ཅིན་ ཤི་མ་བཅུག་ཟེར་བའི་ བྱམས་པ་དང་ ཤི་བ་ཅིན་ … ཟེར་བའི་ སྙིང་རྗེ་ སེམས་ཀྱི་གདིང་ལས་ བསྐྱེད་དགོ།", 2),
                 ("༥ ཁག་ཆེ་ - རྒྱུ་མཚན་ (རང་དབང་རང་བཙན་དང་ སྲུང་སྐྱོབ། ངོ་རྐྱང་།)", 2)],
     model="""༡ ཆོས་དང་ ལམ་སྲོལ་ལས་ བརྟེན་ཏེ་ བཅོས་ཁ་ རྐྱབ་དགོ།
༢ སེམས་ལུ་ ཞི་བདེ་དང་ དགའ་སྐྱིད་ མེད་པའི་ཁར་ ཤི་བའི་ཤུལ་ལུ་ཡང་ དམྱལ་བར་ འགྱོ་ནིའི་ལཱ་ ཨིན།
༣ རྒྱལ་ཡོངས་སྐད་ཡིག་ རྫོང་ཁ་དང་ གྱོན་ཆས་ གོ་དང་ ཀི་ར། སྒྲིག་ལམ་རྣམ་གཞག།
༤ ཕན་པ་ གཞན་ འབད་མ་ཚུགས་རུང་ ན་བ་ཅིན་ ཤི་མ་བཅུག་ ཟེར་བའི་ བྱམས་པ་དང་ ཤི་བ་ཅིན་ ངན་སོང་ལུ་ མ་ཚུད་འབད་ ཟེར་བའི་ སྙིང་རྗེ་ སེམས་ཀྱི་ གདིང་ལས་ བསྐྱེད་དགོ།
༥ ཁག་ཆེ། ཆོས་དང་ ལམ་སྲོལ་ སྐད་ཡིག་ གྱོན་ཆས་འདི་ རྒྱལ་ཁབ་ཀྱི་ ངོ་རྟགས་ཨིནམ་ལས་ ཉམས་པ་ཅིན་ རང་དབང་རང་བཙན་དང་ སྲུང་སྐྱོབ་ལུ་ གནོད་ནི་ཨིན།"""),
dict(key="D2", real=True, type=C, marks=3, topic="Dzongkha comprehension", issues=[DZ], group=D1, pos=2, stem="""ཁ༽ འོག་གི་མིང་ཚིག་ཚུ་གི་ རྗོད་ཚིག་བཟོ། (ཡིག་རྒྱུགས་ནང་ལས་ འདྲ་བཤུས་རྐྱབ་མི་ཆོག) (སྐུགས་ ༦x༠.༥=༣)
༡) ངོ་ཤེས་འདྲིས་ཤེས།  ༢) བརྩེ་གདུང་།  ༣) དཔེ་གཏམ།  ༤) གསོལ་མཆོད།  ༥) འཇིག་རྟེན།  ༦) དགའ་སྐྱིད།""",
     key_points=[("ཚིག་ ༦ ལུ་ རྗོད་ཚིག་ ཀྲིག་ཀྲི་ (ཚིག་རེ་ལུ་ ༠.༥)", 3)],
     model="""༡ གཡུས་ཚན་འདི་ནང་ མི་ག་ར་ ངོ་ཤེས་འདྲིས་ཤེས་ཅན་ཨིན།
༢ ཨམ་གྱིས་ ཨ་ལུ་ལུ་ བརྩེ་གདུང་ ཆེ་ཏོག་ཏོ་ ཡོད།
༣ རྒན་ཤོས་ཚུ་གིས་ དཔེ་གཏམ་ ལེ་ཤ་ ཤེས།
༤ ལོ་གསར་ནང་ ཆོས་སྐྱོང་ལུ་ གསོལ་མཆོད་ ཕུལཝ་ཨིན།
༥ འཇིག་རྟེན་འདི་ནང་ རྟག་པ་ ག་ནི་ཡང་ མེད།
༦ བཟའ་ཚང་ ག་ར་ དགའ་སྐྱིད་ཀྱི་ ངང་ལུ་ སྡོད་ཡི།"""),
dict(key="D3", real=True, type=C, marks=3, topic="Dzongkha comprehension", issues=[DZ, "Synonyms: a Dzongkha teacher should confirm the expected words from the passage."], group=D1, pos=3, stem="""ག༽ འོག་གི་མིང་ཚིག་ཚུ་གི་ རྣམ་གྲངས་ ཡིག་རྒྱུགས་ནང་ལས་འཚོལ་ཏེ་བྲིས། (སྐུགས་ ༦x༠.༥=༣)
༡) ལེགས་ཤོམ་བཟོ།  ༢) གོ་ལ།  ༣) ཧ་ལས་སི་སི།  ༤) འབད་གཞག་བཅའ་གཞག།  ༥) དགོ་འདོད་ཆེ།  ༦) རྨགཔ་དང་ཨམ་སྲུ།""",
     key_points=[("ལེགས་ཤོམ་བཟོ → བཅོས་ཁ་རྐྱབ། གོ་ལ → གྱོན་ཆས། ཧ་ལས་སི་སི → ཡ་མཚན་ཆེ། འབད་གཞག་བཅའ་གཞག → བྱ་བ་སྤྱོད་ལམ། དགོ་འདོད་ཆེ → འདོདཔ་ཆེ། རྨགཔ་དང་ཨམ་སྲུ → ཁྱིམ་ཚང་ / གཉེན་གྲོགས (to confirm) (ཚིག་རེ་ལུ་ ༠.༥)", 3)],
     model="ལེགས་ཤོམ་བཟོ = བཅོས་ཁ་རྐྱབ། གོ་ལ = གྱོན་ཆས། ཧ་ལས་སི་སི = ཡ་མཚན་ཆེ། འབད་གཞག་བཅའ་གཞག = བྱ་བ་སྤྱོད་ལམ། དགོ་འདོད་ཆེ = འདོདཔ་ཆེ། རྨགཔ་དང་ཨམ་སྲུ = ཁྱིམ་ཚང་ (to confirm)"),
dict(key="T1", real=True, type=T, marks=15, topic="Translation: English to Dzongkha", issues=[DZ], stem="""འོག་ལུ་ ཨིང་སྐད་ནང་ཡོད་མི་ གསུང་བཤད་འདི་ རྫོང་ཁའི་ཐོག་ལུ་ སྐད་སྒྱུར་འབད་དེ་བྲིས། (སྐུགས་ ༡༥)

""" + TR,
     key_points=[("གནད་དོན་ཕོག་མ་ཕོག་ - དོན་ཚན་ཆ་ཚང་ མ་ལུས་པར།", 7), ("ཞེ་ས་ (མི་དབང་མངའ་བདག་རིན་པོ་ཆེའི་ གསུང་བཤད་) ཀྲིག་ཀྲི།", 3), ("གོ་རིམ་དང་ སྡེབ་སྦྱོར་ བརྡ་སྤྲོད།", 5)],
     model="""ད་རིས་ ང་གིས་ ང་བཅས་རའི་ སློབ་དཔོན་དང་ སློབ་ཕྲུག་ཚུ་གི་ ཚབ་ལུ་ སླབ་ནི་ཨིན། ང་བཅས་རའི་ སློབ་དཔོན་ཚུ་ ནམ་ར་ཨིན་རུང་ དམ་འཆའ་དང་ བརྩོན་ཤུགས་ཅན་གྱི་ སློབ་དཔོན་ཨིནམ་དང་ སློབ་ཕྲུག་ཚུ་ ནམ་ར་ཨིན་རུང་ བརྩོན་འགྲུས་ཅན་དང་ དམ་ཚིག་ཅན་གྱི་ སློབ་ཕྲུག་ཨིན། ཨིན་རུང་ ཁོང་གི་ ལགཔ་ནང་ ལག་ཆས་ ངོ་མ་ - དཔེ་དེབ་ ངོ་མ་ སློབ་རིམ་ ངོ་མ་ ཕྱོགས་ ངོ་མ་ - བཞག་ནི་འདི་ ཕ་མ་ སྲིད་བྱུས་བཟོ་མི་ དང་ གཞུང་གི་ འགན་ཁུར་ཨིན།

དེ་གི་དོན་ལུ་ དང་པ་ ང་བཅས་ཀྱིས་ དཔལ་འབྱོར་ དམངས་གཙོ་ རྒྱལ་ཁབ་ཅིག་སྦེ་ ག་ཏེ་ འགྱོ་ནི་ཨིན་ན་ ཟེར་ རང་ལུ་རང་ དྲི་དགོ། དེ་ཡང་ འབྲུག་གི་ མཐོང་སྣང་ ག་ཅི་ཨིན་ན? དེ་ལས་ མཐོང་སྣང་འདི་ འགྲུབ་ནིའི་དོན་ལུ་ ལག་ཤེས་ ཤེས་ཡོན་ སྦྱོང་བརྡར་ ངོ་མ་ཡོད་པའི་ མི་ཚུ་ གསོ་སྐྱོང་འབད་ཚུགས་པའི་ ཤེས་རིག་ ལམ་ལུགས་ཅིག་ བཟོ་དགོ། འདི་ ཧ་གོ་ནི་ མགྱོགས་དྲགས་ ཅིན་ ལེགས།

མཐོང་སྣང་ ཟེར་མི་ ཚིག་འདི་ དོན་ཟབ་ཏོག་ཏོ་ཅིག་ཨིན་རུང་ ཨ་རྟག་ར་ ལོག་ལག་ལེན་ འཐབ་དོ་ཡོདཔ་ཨིན། ཤེས་རིག་གི་ གལ་གནད་ བཤད་ནི་ལུ་ ཚིག་འདི་ ལག་ལེན་འཐབ་ནི་ལས་ ལྷག་པའི་ རྒྱུ་མཚན་ མེད། གལ་སྲིད་ ང་བཅས་ཀྱི་ རྒྱལ་ཁབ་ཀྱི་ མཐོང་སྣང་འདི་ ང་བཅས་རའི་ ཨ་ལུ་ཚུ་གིས་ བཟུང་བའི་ དཔེ་དེབ་ཀྱི་ ཤོག་ལེབ་ནང་ མེད་པ་ཅིན་ སློབ་ཁང་ འགོ་འདྲེན་འཐབ་བའི་ སློབ་དཔོན་ཚུ་གི་ ཚིག་ནང་ མེད་པ་ཅིན་ དེ་ལས་ གཞུང་གི་ ཤེས་རིག་ སྲིད་བྱུས་ནང་ མེད་པ་ཅིན་ ང་བཅས་ལུ་ མཐོང་སྣང་ མེད་ཟེར་ བཤད་དགོ། (མི་དབང་མངའ་བདག་རིན་པོ་ཆེའི་ རྒྱལ་འཛིན་གཙུག་ལག་སློབ་སྡེའི་ ཤེས་ཚད་སྤྲོད་ཐེངས་ ༣ པའི་ གསུང་བཤད་ལས།)"""),
]
