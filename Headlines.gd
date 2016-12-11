extends Node

var _headlines
var _published_headlines

func get_random_headline():
	randomize()
	var _random_headlines_array_index = randi() % _headlines.size()
	var _new_headline = _headlines[_random_headlines_array_index]
	_headlines.remove(_random_headlines_array_index)
	return _new_headline

func add_published_headline(headline):
	_published_headlines.append(headline)

func get_published_headline_text():
	var _published_headlines_string = ""
	for _published_headline in _published_headlines:
		_published_headlines_string += " " + _published_headline.text + " ||"
	return _published_headlines_string;
	

func _ready():
	var RAW_HEADLINES = """
2|2|Election Night 2016 Live Blog - It's Finally Here!
2|5|Glenn Beck Just Made His Most Shocking Comment About President Obama Yet
2|5|Politics And Reality Radio: Sam Wang Talks Polling; The Coming GOPocalypse
2|3|Ben Carson: Clinton Shouldn't Mention Trump's KKK Support Because Dems Were Party Of Slavery And Jim Crow
2|3|"Clintons And Obamas Rally Together With Bruce Springsteen, Bon Jovi In Philly"
2|2|Lyin' Ryan Joins Trump's Fickle Campaign Strategery
2|1|Trump Claims Blacks Breaking Big For Him Even Though Few Show Up At Rallies
2|2|Disabled Child Kicked Out By Trump Is Welcomed By Obama
2|1|The Trump Campaign's Answer To Beyonce Is... Sarah Palin
2|2|CNN Host To Trump Advisor: 'You Love Transparency When It's Not You Guys'
2|1|Fox Pundits Dismiss Reports On Russian Interference In Election As Partisan Sour Grapes
2|5|"The Apprentice Conflict Of Interest Is Hardly Trump's Worst, But It Got America's Attention"
2|5|Periods Are Awesome! Time For Some Bloody R.E.S.P.E.C.T.
2|4|Harry Reid On Russiagate: James Comey Is J. Edgar Hoover
2|5|"Trump: 'Lock Her Up' Played Great Before Election, Now 'We Don't Care'"
2|2|Rudy Giuliani Tells Fox News Why He Dropped Out Of Secretary Of State Contention
2|5|McConnell Covered Up CIA Reports That Russian Hacks Were Aimed At Electing Trump
2|1|Russians Actively Worked To Elect Trump; McConnell Knew And Sat On It
2|3|Olbermann: Trump's Cabinet More Evil Than 'Batman Villains'
2|1|Kellyanne Conway Defends Trump's TV Producer Conflict: Obama Played Golf!
2|5|Sen. Harry Reid: FBI Deliberately Held Info On Russia To Help Trump
2|1|Trump Tells Michigan Rally: 'Lock Her Up' Was For Election
2|2|Rachel Maddow Reacts To Transition Statement On Russia
2|1|Newt Gingrich Flip Flops On James Comey: He Caved
2|1|Watch: Chris Wallace Throws 'Drain The Swamp' Meme In Pence's Face For Backing Christie
2|3|Louie Gohmert Is Livid That Hillary Clinton Won't Face Charges
2|3|"The Spin On Comey's Latest Letter: Dems Mad, GOP Sad"
2|4|Reince Priebus: Email Scandals? IOKIYAR!
2|3|New York Times Catches Trump Aides Plotting Strategy On 270towin Website In Trump Tower Grill
2|4|Obama Taunts Trump About Campaign Taking Away His Twitter Account
2|3|Jake Tapper Shoots Down Kellyanne Conway's Hopeless Spin: 'It Wasn't An Assassination Attempt'
2|1|"FBI Director On New Emails: Nothing To See Here, July Conclusion Stands"
2|3|Mike Pence Is Coy About Whether Trump Will Accept Election Results
2|3|Famed Holocaust Attorney Sues Over FBI Electioneering: It Could 'Lead To Impeachment'
2|5|Support For United Steelworker's Chuck Jones Is Trending
2|5|"NY Giants Football Player Home Vandalized, Tagged With KKK And Nazi Graffiti"
2|5|Mitch McConnell Doesn't Seem Particularly Worried About ACA Repeal Consequences
2|3|Peter Thiel Associate Considered For FDA Head
2|3|Rep. Peter King Agrees With Intel Community: Russia Hacked Election Process
2|1|We Can't Sneak Judge Garland In Through The Back Door
2|1|That Boeing Tweet Was All About Trump's Ego
2|3|Trumps EPA Pick Scott Pruitt Literally Built The Swamp
2|5|THIS Is Why Merrick Garland's Appointment Is Imperative: Ohio Passes 'Fetal Heartbeat' Bill
2|4|Trump Blocks Million Women's March At Lincoln Memorial
2|1|"Yup, Not A Dime's Worth Of Difference"
2|2|Joe Biden: World Will Look To Trudeau/Merkel For Leadership
2|5|All New And Improved! Trumpcare!
2|3|Tulsi Gabbard Scolds Critics Of Trump's Military Cabinet
2|2|Open Thread - Here Ya Go...
2|2|Trump Will Remain As Executive Producer Of 'The Apprentice' Post-Inaugural
2|1|Dictionary.com's Word Of The Year Is...
2|3|Secretary Of Labor-To-Be Is Either A Wife Beater Or A Drunk Driver -- Or Both
2|1|"Firefighter Charged With Arson, Blames Black Lives Matter"
2|5|WATCH: Ted Cruz Scurries When Asked If He Thinks Trump Is Still A 'Pathological Liar'
2|5|WSJ White House Reporter: Trump Business Conflicts 'Will Be A Narrative That Dogs His Presidency'
2|2|LA GOP Admits To Sexting Underage Boy But Swears He Is Not Gay So It's Ok
2|1|Rubio Recommends Trump Allow DACA Permits To Expire
2|1|Chuck Todd Rips Conway For Dodging Questions: 'Every Knee-Jerk Push Back' Is 'Blame The Media'
2|1|Texas Judge 'Apologizes' For 'Time For A Tree And A Rope' Facebook Comment
2|5|Fox Guest: U.S. Surgeon General Must Go To Cuba 'Just To Make Sure Fidel Castro Is Really Dead'
2|5|"New Trump Adviser: Homophobe, Paranoid, Electoral Felon?"
2|1|Mike's Blog Round Up
2|5|Trump Admits To Self-Dealing With Trump Foundation
2|4|Open Thread - The First Family. Our First Family.
2|5|Caught On Video: Trump Promised To Keep Medicare And Social Security As They ARE
2|3|Blue America Candidate Jamie Raskin Delivers Verbal Knockout Punch To Bannon
2|5|Carrier Denies Local Reporter Access To Trump 'Celebration'
2|3|Elizabeth Warren Tees Off On Trump's Wall Street Picks
2|2|How Democrats Will Be Blamed For What Republicans Do To Healthcare
2|1|Trump Booster Scottie Nell Hughes Declares Facts Dead; Twitter Is Truth
2|5|"Fired Arizona Social Services Chief Had Own Police Force, Armory"
2|5|Hilarious Hashtag 'Breitbart Cereals' Makes Uncle Liberty Mad
2|4|"Kris Kobach, With No Evidence, Backs Up Trumps' Claim That Millions Voted Illegally "
2|1|AG Alberto Gonzales On Comey's Actions: 'Breached Protocol' 'You Have To Question The Decision'
2|3|Rep. Cummings Says Republican Thuggery Influenced FBI Director
2|3|Did Comeys October 28 Letter Violate The Rules Of Professional Conduct For Lawyers?
2|3|Fareed Zakaria Likens Comey's Actions To Banana Republic
2|1|Paul Manafort Staged Airplane Malfunction To Trick Trump Into Picking Pence Over Christie
2|2|Nothing Matters Now But Getting Out The Vote
2|3|Politics And Reality Radio: Rick Perlstein On The GOP After Trump
2|5|Trump Lied About Donating To AIDS Charity Just For The Photo Op
2|5|Fox's Jeanine Pirro: Comey Disgraced And Politicized The FBI
2|4|'Christian' Haunted House Banned From Chicago School Over Depiction Of Orlando Mass Shooting
2|3|Wife Of Putin Aide Performs Holocaust-Themed Skate Routine
2|1|"If Dems Ever Want To Win Again, They Need To Find A Spine"
2|3|Delta Bans 'Hillary Bi#ches' Passenger For Life
2|2|Conway: Clinton Better Watch Out Or Trump Will Lock Her Up
2|5|Store Manager Calls Man A 'F*ggot That Voted For Hillary' In Front Of His 4-Year-Old Son
2|2|GOP Congressman: Mitt Romney Is A Self-serving Egomaniac
2|2|"Church Speaks In Tongues To Praise Trump's Win: 'Thank You, Lord, For Bringing Jezebel Down'"
2|5|The 'Politics Of Resentment' Propelled Trump Into Office
2|1|Sheriff Clarke To 'Interview' With Trump Today
2|1|How Much Racism Is Mathematically Baked Into The Electoral College? Quite A Bit.
2|1|Open Thread: Why Hillary Has To Try So Hard To Make People Like Her
2|5|Colorado Lunatic Legislator Worries Hillary Might Kill Him If She Wins
2|1|A Look At Trump's 'Good Old Days' ...for Women
2|1|Sarah Palin's Nonsensical Facebook Rant On 'Rigged Election'
2|2|Trump Goes After Michelle Obama In Latest Tirade
2|1|Former RNC Head Michael Steele Will Not Vote For Trump
2|2|CNN's McEnany: It's Trump Supporters Versus Black Panthers With Guns At The Polling Places!
2|1|Texas Republican Congressman: 'Ladies Need To Be Told When They're Nasty'
2|5|Trump Booed At Al Smith Dinner; Clinton Slays
2|5|Oregon Takes On Corporations' Money And Politics With Measure 97
2|3|"Obama: Regulate Marijuana Like Cigarettes, Alcohol"
2|5|Nancy Pelosi Wins Re-election As Top Dem In The House
2|2|"Sean Hannity: Trumps Staff Can Tweet Out News, He Doesnt Need A White House Press Office"
2|1|About Those Carrier Jobs Trump Promised He'd Save
2|2|Bernie Sanders Challenges Trump To Admit He's A Liar Or Nominate A Decent HHS Secretary
2|4|The Internet Reacts To That Awkward Trump/Romney Dinner Photo
2|1|"Ex-Goldman Sachs Banker, Hollywood Producer Tapped For Treasury Secretary"
2|5|"Is Fox 'News' Instructing Trump On Policy, Including Flag Burning?"
2|3|Press Pool Didn't Recognize Dan Quayle Arriving At Trump Tower
2|2|Reaction To Tom Price As HHS Secretary Is Near Universal Horror
2|5|Marco Rubio: Don't 'Indulge Wikileaks' - It's A Foreign Govt Interfering In Our Election
2|5|Blue America 'Punches' Republicans On The Street. Won't You Help?
2|1|Trump Is Even Losing His Idiot Troll Skills
2|1|Chris Christie Throws Trump Campaign Under The Bus
2|1|"Uh Oh, Don't Tell Hannity: Donald Trump Is Now Claiming Even Fox News Is Against Him"
2|2|Renee Ellmers Whines At CNN For Accurately Quoting 'Rigged Election' Claim
2|5|Steve Schmidt's Excellent Recap Of The 'Now Over' 2016 Election
2|5|"Trump Voter Vows To 'Take Country Back' By Pitchfork, If Necessary"
2|1|Sen. John McCain Flees Reporters After His Vow To Obstruct Clinton SCOTUS Nominees
2|5|Obama Tells Trump To 'Stop Whining And Go Make His Case To Get Votes'
2|5|Trump Sends A Video Message From His Gilded Tower
2|4|Alec Baldwin Slams Trump For Taking To Twitter To Whine About SNL
2|4|Tulsi Gabbard And Right-Wing Big Donor - Partners In 'Bipartisanship'
2|1|"Neo-Nazi Richard Spencer: 'Are They People At All, Or Instead Soulless Golem?'"
2|5|Kris Kobach Seen Carrying Plan For Homeland Security Into Trump Meeting
2|5|Keith Olbermann On How To Resist
2|3|"Argentinian Payday? In Call, Trump Reportedly Asked Prime Minister To Approve His Building"
2|3|"Rep. Peter King: 'I Support Waterboarding, It Is Not Torture'"
2|3|'Democrat' Looking For A Job In Trump's Cabinet
2|3|DC Meeting Ends With Nazi Salute; NY Times Calls Them 'Alt-Right'
2|5|Hillary's Closing Argument Ad: ROAR!
2|1|Deadspin Asks: 'You Make The Call!'
2|1|Joy Ann Reid Makes A Brilliant Analogy: Obama Is Beyonce
2|4|President Obama Interviewed By Bill Maher
2|1|Giuliani's So Deep In His Own Web Of Lies He's Forgetting What To Say
2|5|Obama Preps Response To Pre-Election Cyber Attacks
2|3|Latinos In Nevada And Florida Are Building A Wall -- Against Trump
2|3|Obama Stops Crowd From Shouting Down Heckler At Hillary Rally
2|1|Brilliant! If Congress Was Your Co-Worker
2|3|Trump Campaign Manager Admits Damage Already Done By FBI Leaks
2|2|Texas AG Commissioner Calls Hillary A C**t In A Tweet
2|5|Reports: Trump's Ties To Russia Are Deep And Ongoing - Updated
2|2|Donald Trump Admitted Knowing Putin In 2013: 'I Do Have A Relationship With Him'
2|3|"Sources Say Comey Declined In Early October To Link Trump Campaign, Russia To DNC Hack"
2|4|'Give Me A Break': Kellyanne Conway Compares Trump Child Rape Case To His Tax Returns
2|1|Trump Campaign Manager: 'Fine With Us' If FBI Doesn't Release Emails Before Election
2|1|Hacking The Vote: Is Voter Fraud The Only Worry We Have?
2|1|"Watch Out, Donald, There May Be Another October Surprise"
2|3|What? Trey Gowdy: Comey Didn't Violate Hatch Act Since Obama Is Campaigning
2|5|Enough About The Damn Emails!
2|3|WWE Head Linda McMahon Named To Head Small Business Administration
2|5|Shocking! Carson Did NOT Live In Government Housing
2|3|Reporter Discovers Wi-fi Named 'N*gger Genocide' At Texas A&M White Nationalist Event
2|4|Here's Another Way To Get Merrick Garland On SCOTUS (Updated)
2|4|Carrier's Union: 'Trump Lied His A** Off'
2|4|"Flynn Jr Has Been Fired Over Fake News, What About Flynn Sr?"
2|5|Louie Gohmert Bought Himself (Another) Car With Campaign Funds
2|5|An Exhaustive List Of Ben Carsons Qualifications For HUD Secretary
2|5|"In Final Address To U.S. Troops, Obama Sends Warning Shot To Trump"
2|4|CNN's Jake Tapper Is Frustrated With Pence's Dodgy Ways
2|2|It's Time For The 'Commission On Public Debates' To Go
2|1|Reports: Major Trump Staffer Jumping Ship
2|1|Another True Tale From The Real America
2|2|Governor Greg Abbott Is A Stupid Sumbitch
2|4|"Donald Trump Jr: My Dad Is Too Good For You, America (VIDEO)"
2|3|Trump's Foundation Funded James O'Keefe's Project Veritas
2|3|Keith Olbermann Unleashes Blistering Condemnation Of Trump's Rigged Election Claim
2|5|Trump: I'll Accept Election Results If I Win
2|3|Trump Incorrectly Blames Clinton Campaign For Rally Violence
2|1|Donald Trump's Refusal To Accept Election Results Mars Final Presidential Debate
2|1|Former New Hampshire Governor Mocks Hillary Clinton's Sex Life During Trump Rally
2|1|Rudy Giuliani Admits FBI Leaked Information To The Donald Trump Campaign
2|4|BRIDGEGATE VERDICT: Guilty On All Charges
2|2|Trump Tower In Toronto Goes Bust
2|3|Did Rudy Guiliani Take A Selfie At The House He Was Robbing?
2|1|Seth Meyers Blasts GOP For Promising More Obstruction
2|5|Hillary VS. The Undead
2|2|New Report: The FBI Has Become Trumpland!
2|2|WATCH: Unhinged White Supremacist Senate Candidate Loses His Sh*t In Mid-Debate
2|2|A Readers' Mini-Guide To International Press On America's Election
2|1|Giuliani Ghoulishly Cackles Anticipating Jail Time For Hillary Clinton Over Latest Emails
2|1|"In The Supreme Court Battle, Will GOP Senators Argue That Clinton Wasn't Really Elected?"
2|5|The Saturday Morning Song You Won't Be Able To Get Out Of Your Head
2|3|Dear Women Trump Supporters: Olbermann Has A Question
2|5|HA HA! AM Joy Panel Laughs Hard At Trump Surrogate
2|5|MAKE AMERICA GREAT AGAIN (Music Video)
2|2|"Koch Brothers Running Scared: Behind The Scenes, Koch Empire Crumbling"
2|4|The Viral And Funny 'Please Re-Elect Gerald' Ad
2|5|How The Government Lost Its Case Against Y'All Qaeda
2|3|Of Course Comey's Motivation Was Political!
2|5|Is John Bolton Really A Trump Choice For Secretary Of State?
2|3|Political Zombies: Clinton Emails
2|2|Video: NSA Chief Confirms DNC Hack Was 'Conscious Effort' By Russia To Achieve 'A Specific Effect'
2|1|We Desperately Need The Media To Investigate Trumps Ties To Russia And Other Murky Business Dealings
2|5|Ben Carson Rejects Job In Trump White House: 'Feels He Has No Government Experience'
2|3|Rachel Maddow Not About To Wear Ivanka Trump Jewelry? Traitor!
2|1|"Counterterrorism Expert Tells CNN's Cuomo: 'Be Quiet Son, I'll Give You An Education'"
2|1|Last Word: 'Bannon Is Going To Eat Reince Priebus For Lunch'
2|2|Even Glenn Beck Says Stephen Bannon Is 'Terrifying'
2|5|The Years Of Living Dangerously
2|5|President Obama Gives His Final Veteran's Day Address
2|5|"Whoomp, There It Is. Paul Ryan Wants To Privatize Medicare!"
2|5|Harry Reid's Statement To 'President' Trump Is Delicious
2|2|Bernie Sanders Vows To Become Trumps' 'Worst Nightmare' If He Uses Anger Towards Minorities
2|3|We Love Keith Ellison Too Much To Wish Him For DNC Chair
2|5|Trumpster Rick Scott Cant Explain How Hed Replace ObamaCare For The 20 Million Whose Health Insurance He Wants To Destroy
2|3|Confirmed: Trump Campaign Was In Regular Contact With Russians
2|4|The Chorus Girl And Her Proud Troops Of Wounded Vets
2|2|Senator Jeff Merkley Explains How Republicans Are Stealing The Supreme Court
2|4|Election 2016: Can We Find Hope In A Hopeless World?
2|4|Ron Johnson Flings Poo In Latest Ad
2|1|Goin' Mobile-- A More Progressive Congress For 2017?
2|2|"Adult Film Star: Trump Offered To Pay Her $10K For Sex, Use Of Private Jet"
2|2|I Wouldn't Want To Be A State Election Official On November 9th
2|1|Bernie Sanders Explains Why A Vote For Clinton Helps 'Our Revolution'
2|1|Former PA State Senator Dumps Trump: Hes 23 Cans Short Of A Full Case Its A Damn Shame
2|4|AM Joy: GOP Has A Consent Decree To Stop Intimidating Voters
2|1|Wanna Watch Chris Christie Implode?
2|1|This Video Is Everything - Meet Martha And Sara
2|4|Accurate Assessment Of Where The Race Stands?
2|4|Why It's Not All Doom And Gloom Around Here
2|3|"Video: Hillary Clinton Gave A Poignant, Moving, Amazing Speech Tonight"
2|5|Gun Nuts Have Knife Fight
2|1|"Republican Electors Are Being Called Upon To Vote Their Conscience, Not For Trump"
2|3|Trump Spox Whitewashes Bannon: Breitbart Is Like MSNBC For 'The Other Side'
2|1|Rep. Steve King Serves Up More Republican White Man Crazy
2|3|Barack Obama Will Not Save Us From Trump
2|3|Democratic Coalition Files FBI Election Complaint Against Stephen Bannon
2|5|Trump Tells Women To Go To Another State For An Abortion
2|4|Is Trump Angling For Jared Kushner To Be Shadow President?
2|5|Three Election Day Tweets To Make You Smile
2|5|Sheriff Clarke Continues To Be A National Embarrassment
2|2|This Judge Shutting Down Trump Lawsuit Over Early Voting Is Best Thing Today (So Far)
2|1|Trump Is At Odds With The Congressional Gop: The Zombie Lie That Won't Die
2|2|Time To Vote! Election Day Live Blog
2|3|Beltway Media Predicts The Country Will Not Be Behind Clinton If She Wins
2|5|"Donald Trump Considers Election 'A Tremendous Waste Of Time, Energy, And Money' If He Loses"
2|2|Voting For Human Dignity
2|4|Open Thread: The Lost Hillary Campaign Commercial (Satire)
2|1|Trump's Unreleased Tax Returns Are The True 2016 Election Scandal
2|3|What Megyn Kellys Bout With Newt Gingrich Reveals About The Bigger Fox News/GOP Picture
2|5|Hillary Clinton Announces Major Anti-Bullying Policy
2|1|VIDEO: Mark Kirk Launches Racist Attack On Tammy Duckworth During Senate Debate
2|4|Donald Trump Wants To 'Cancel The Election And Give It To Trump!'
2|3|"Jury Acquits Bundy Gang On Firearms, Conspiracy Charges Connected To Malheur Occupation"
2|3|The Bengaaazi Boys Are All Ready To Pre-Impeach Clinton
2|4|Donald Trump: 'Ill Teach [Military Expert] A Couple Of Things'
2|3|Is The Trump Campaign A Grift To Sell Hats?
2|2|Watch Live: Hillary Clinton And Michelle Obama In North Carolina
2|5|Sen. Ted Cruz: 'A Long Historical Precedent For A Supreme Court With Fewer Justices'
2|1|"Congratulations, Trump Voters: Here's What You've Won!"
2|3|"Elizabeth Warren Roars Over Possible CFPB Dissolution, Steve Bannon's Appointment"
2|5|Teacher Threatens Students: 'Don't Make Me Call Trump To Get You Sent Back To Africa'
2|1|It's True: The Trump Vote Was A Hate Crime
2|3|Why Is Mike Pence Trying To Bury His Emails?
2|3|Reince Priebus Begins Process To Normalize Steve Bannon
2|3|"Trump Considering Nut Job, Violence-Endorsing, Anti-Free Speech Sheriff David Clarke For DHS Secretary"
2|2|This Is No Time For Progressives To Get Wobbly
2|4|Can Trump Abolish The EPA?
2|5|Newt Gingrich Denies Alt-Right Influence On Trump As 'Garbage'
2|5|Fox News Guest: Hillary Clinton Voters Are 'Aiding And Abetting A Felon'
2|2|No Exaggeration: This Election Is About The Survival Of Mankind
2|5|Reince Priebus: 'He Is Not Willing To Not Concede If He Loses And There's No Fraud'
2|5|Conservative Figures Out Libs Were Right All Along: The Alt-Right Is Scary
2|4|RoJo: I Don't Respect Feingold
2|1|Trump Supporter Wants America To Great Again Like Before 'The Homosexuals' And 'The Abortions'
2|3|Kellyanne Conway Pushed By Wallace To Answer Rumors She's Grown Uncomfortable With Trump
2|5|Eric Trump Tells ABC News He's Not 'Living In Bubble' Of Their Own Support
2|3|Jan Brewer: Groping Victims 'Waterboarded' Donald Trump By Telling Their Stories
2|3|Awkward: Tapper Digs Up Video Of Kellyanne Conway Saying Trump 'Whines' About Rigged Elections
2|5|Is Reince Priebus Spilling More FBI Probe Secrets On Hillary's Emails Or Blowing Smoke?
2|4|Chris Wallace To Pence: 'You Think All Those Hispanics Are Coming Out To Vote Trump And Not Clinton? Really?'
2|1|Jake Tapper Takes On Kellyanne Conway Over Conspiracy Theories About Polling Places Staying Open
2|4|Kellyanne Conway Suggests Trump Protester Deserved Beating Because He Was 'Probably A Plant'
2|4|Donald Trump Dangerously Takes Baby On Stage At Tampa Rally
2|2|You May Get In Trouble If You Take A Selfie In Voting Booth
2|4|Why It Seems Like We're Watching Trump 'Get Stupider Before Our Eyes'
2|5|You'll Be Amused To Know Who In The Media Got That Al Qaeda Warning First
2|1|Jon Ralston Declares: Trump Is Dead In Nevada
2|2|Paul Ryan Overlooks Supporter Shouting For Hillary Clinton's Assassination
2|1|Van Jones Rips Trump Surrogates: 'You Guys Need To Back Off!'
2|1|Trump's Rehabilitation: Preparing The Ground
2|1|Some Good News - Progressives Win Key Ballot Initiatives
2|1|"We Broke It, Now We Must Fix It"
2|5|"America, What Have You Done?"
2|2|Kelly Ayotte Concedes To Maggie Hassan In A Squeaker Of A Race
2|1|Anti-Trump Protests Break Out In Cities Across The USA
2|2|What Do We Tell The Children About Their Country Now?
2|2|"From Russia, With Loathing "
2|5|Elizabeth Warren: My Sincere Hope [Trump] Will Respect Every Single Person In This Country'
2|4|NC Gov. McCrory Is Trying To Steal Back The Office He Lost
2|5|Popular Vote Enters Landslide Territory For Hillary Clinton
2|3|Kellyanne Conway 'Confident' Trump Isn't Breaking Any Laws Since He Has Lawyers And Advisors
2|3|Sheriff David Clarke: If You're Upset At Being Called 'Boy' You're Hypersensitve
2|4|CNN's Chris Cuomo On Trump: 'He Shows Them (Neo-Nazis) A Respect He Shows No One Else'
2|5|Donald Trumps Infrastructure Plan Is An Expensive Bridge To Nowhere
2|2|Trump Decides To Not 'Lock Her Up' Anymore
2|1|So Will Trump Settle Conflicts Of Interest? Absolutely Not
2|4|Fox Host Eric Bolling Being Considered For Trump Commerce Department?
2|3|Louie Gohmert Demands That Mitch McConnell Commit Political Suicide
2|5|Sunday Morning Bobblehead Thread
2|4|Protests Against Donald Trump Continue Across US
2|5|White Supremacist Website Urges Readers To Harass Clinton Supporters To Kill Themselves
2|4|"No, Donald Trump Will Not Be Impeached"
2|3|Is He Gonna Make Sarah Palin Head Of Interior Department?
2|4|"Trump's Post-Election Back Tracks, Part 2"
2|2|AM Joy: Anti-Obamacare Sentiment Is About Racism
2|1|Paul Ryan Flirts With Privatizing Medicare
2|3|"No, Donald Trump Is NOT Going To 'Keep Parts Of Obamacare'"
2|1|Congress Introduces Legislation To Destroy Social Security
2|1|Trump Punch Down Strategy Endangers Local Union Leader
2|4|Will GOP Shut Down Government Rather Than Fund Coal Miners' Pensions?
2|5|Michael Steele Admits GOP Has Dumbed Down The Past Couple...Weeks?
2|3|Rigging The Election: Trump Voter Arrested In Iowa On Voter Fraud Charges
2|3|"Come Clean, Comey! Emails Weren't From Hillary Clinton Or Her Email Server: UPDATED"
2|5|"New Video Surfaces Of Trump Sexually Humiliating, Forcing Kiss On 2004 Miss Universe "
2|4|Jesse Gets The 'Watters Treatment' From Comedian Jason Selvig
2|1|Is FBI Director Comey's Blatant Election Interference Meant To Save GOP Congress Or Trump?
2|5|Newt Gingrich Is The Worst Person To Bring On Air About Sex
2|1|CNN's Chris Cuomo Calls Joe Walsh Out On Violent Rhetoric: 'Words Matter'
2|3|Dem Finally Draws A Line On Katrina Pierson: 'I Could Sue You' For Lying
2|5|Lord Cheeto Is 'Winning' Because Of Facebook Mentions!?
2|3|FBI Comes Up With Lame Excuse For Document Dump; Toobin Scoffs
2|1|Texas Ag Commissioner Sends Tweet Calling Hillary Clinton A C*nt
2|1|"David Corn Dishes Some Truth About Russia, Trump And The Election"
2|4|"FBI Officially Goes Rogue, Dumps 15-Year Old Records Of Clinton Foundation Inquiry Online"
2|4|GOP Donor Foster Friess: Evangelicals Who Don't Forgive Trump Aren't Practicing Their Faith
2|4|Paul Ryan: I Voted For Stupid
2|4|Sen. Richard Burr Suggests Clinton Should Be Shot
2|4|"Because They're Having Sex, Sex I Tell You, And They're Not Letting Greg Abbott Watch"
2|4|"Trump Already Screwing Campaign Vendors, Starting With His Own Pollster"
2|2|Comeys Innuendo Will Be Democrats Ultimate Inspiration
2|3|Heartland America Has Never Really Given A Crap About Trump's Tax Evasion
2|4|Gen. Michael Flynn Scolds MSNBC Host Being Mean To Putin: 'Stop It With That Kind Of Stuff'
2|2|Trump Supporters Behaving Badly: Assault Victims Should 'Grow A Set'
2|5|Libertarian VP Candidate Praises Clinton: 'She Deserves To Have People Vouch For Her'
2|1|Video Shows Trump With Mobster He Denied Knowing
2|3|"CNN: Not Only Unethical, But Pretty Stupid, Too"
2|1|Samantha Bee's Lovely Fourteen Names For The Alt-Right
2|1|China Issues A Rebuke To Donald Trump; Buffett Says A Monkey Would Have Higher Returns
2|4|Early Voting? That'll Be 'Rigging' Too
2|5|KKK Newspaper Officially Endorses Donald Trump For President
2|4|"BREAKING: Reince Priebus Named As Trump's Chief Of Staff; Bannon Is Special Counsel, Strategist"
2|2|'Trump Nation Whites Only': Maryland Church Hit With Racist Graffiti During Hispanic Outreach
2|3|Sign In Predominately-Black California City Calls For Lynchings Instead Of 'Equal Rights'
2|3|Trump Plans To Deport Up To 2-3 Million Immediately
2|4|Paul Ryan: 'We Are Not Planning On Erecting A Deportation Force'
2|3|Van Jones Clashes With Mary Matalin: 'You Should Be Ashamed To Say That To My Face'
2|5|'Little Nitty-Gritty Details': Paul Ryan Says Access To Birth Control Is Not Worth Talking About
2|5|Trump's Campaign Manager Waffles On Repealing Obamacare: 'We Don't Know'
2|5|Jake Tapper Grills Paul Ryan Over Hate Crimes Spawned By Trump Win: 'Americans Are Terrified'
2|1|Donald 'I Love The Veterans' Trump Didn't Attend A Single Veteran's Day Event
2|2|Evan McMullin Forces CNBC Host To Start Yelling 'Brexit! Brexit!'
2|5|"Profile In Cowardice, Jason Chaffetz"
2|3|Desperate Joe Scarborough Demands 'Equal Shut Down' Of Clinton Foundation
2|2|A Readers Guide To Secret Service Dogs
2|4|How Paul Ryan Will De-Cuck Himself
2|1|Ha! Twitter Goes After Newt Gingrich
2|3|Samantha Bee Celebrates Hillary's Debate Answer On Late-Term Abortion
2|2|"On Early Florida Voting As On Every Other Subject, Republicans Prefer Their Own Facts"
2|4|Democrats! Take Back The Senate!
2|3|Tedious House Republicans Promise To Continue Being Tedious
2|1|What Did Jason Chaffetz Know And When Did He Know It?
2|2|NC Governor Who Signed Racist Voter Suppression Law Brags Democrats Are 'Not Coming Out'
2|3|Mike Pence Twists Into A Pretzel Defending Trump's Previous Attacks On The FBI
2|3|Football Fans Sport Offensive Trump Lynching Obama-Clinton Costume
2|2|Former WH Ethics Lawyer Files Hatch Act Violation Complaint Against Comey
2|5|Kellyanne Conway Snaps At Jake Tapper: Asking About Racism Is 'Evidence We're Going To Win'
2|3|Chuck Todd: 'Don't You Wait To Tell Congress After You Know You Have Evidence?'
2|3|Eichenwald: James Comey's Letter Could Damage The Reputation Of The FBI For Years To Come
2|1|Thug: Trump Throws His Own Black Supporter Out Of Rally (VIDEO)
2|3|Comey Resets America's Doomsday Clock
2|4|"Dear Mike Pence, Gen. Petraeus Didn't Just 'Mishandle' Classified Information"
2|2|Kellyanne Conway Defends Trump's Shameful Tweets: 'He's President-Elect So That's Presidential'
2|3|Stephanopoulos Rips Pence For Defending Trump's Voter Fraud Claim 'Whether It's True Or Not'
2|2|Why Trump Would Almost Certainly Be Violating The Constitution If He Continues To Own His Businesses
2|3|The Coming Government-Military-Industrial Complex
2|3|"Open Thread: Burn, Baby, Burn"
2|1|The Promise Most Wanted By Trump Voters Is 'Lock Her Up.'
2|1|Why Are Trump Supporters So Angry? Acute Discrimination Envy!
2|3|What Kind Of Damage Can A Trump Cabinet Do?
2|3|Donald Trump Isn't Draining The Swamp - He Is The Swamp
2|3|Bernie Sanders Highlights Sinister Intent Behind Trump's Tweets
2|1|Is Trump Hiring The Entire Fox 'News' Team? UPDATED
2|5|"Yes, Many Trump Voters Are Going To Lose Their Healthcare. No, They're Not Going To Blame Him. "
2|2|'Petraeus Would Have To Notify Probation Officer If Named Secretary Of State'
2|2|Fox News Worries About Islamic Groups Arming Themselves Against Trump
2|1|"As Swamp Dwellers Empowered, Some Trump Voters Disillusioned"
2|5|"As Tennessee Burns, State Law Lets Teachers Lie About Climate Change's Role In Wildfires "
2|3|Trump Invites The Swamp Monsters To His Inaugural -- For A Price
2|2|Office Of Government Ethics Twitter Account Hacked? Or Infiltrated?
2|3|Samantha Bee Tries Imagining Pence In Power (Web Extra)
2|1|Election Day 'KKK' Marchers On NC Bridge Turn Out To Be Trump Supporters Instead
2|1|"Van Jones: Trump's Win Was A ""White-lash""
2|5|President Obama Speaks To The Nation
2|1|Kellyanne Conway On Trump's Special Prosecutor Plan: All In Good Time
2|5|Keith Olbermann: The Terrorists Have Won
2|3|Hillary Clinton Speaks To The Nation
2|4|Canadas Immigration Website Appears To Have Crashed Amid U.S. Election Results
2|3|The Night America Lost Its Mind
2|4|"WTF, America?"
2|2|Hillary Clinton Concedes To Donald Trump
2|5|Megyn Kelly: Trump Was The One Who Said 'Lock Her Up'
2|3|New York Times' Trump Interview: Cotton Candy Fluff
2|3|The Battlefield Is Medicare
2|3|The Normalizing: Fun With Numbers
2|4|"No, We Can Never Just Ignore Them Away"
2|4|The Trump Interview: Give The Audience What They Want
2|5|"In NY Times Meeting, Trump Insists He Can Run His Businesses From White House"
2|2|"Voting Rights Activists Urge Clinton To Challenge PA, MI And WI Vote Counts"
2|4|CNN Host Cuts Off Guest After He Uses The N-Word On- Air (UPDATED)
2|5|Trump On Clinton: 'Such A Nasty Woman'
2|1|Trump Refuses To Agree To Abide By Election Results - UPDATE 2
2|3|WATCH: The Third And Final Debate Open Thread
2|5|Rudy Giuliani Tells CNN Bill Clinton 'May Have Had' Illegitimate Children
2|3|Trump's Campaign: Full Breitbart Steam Ahead!
2|2|Kellyanne Conway Is A Tremendous Liar
2|4|No One Respects Women More Than Trump Calling Condi Rice The 'B' Word In 2006
2|5|Donald Trump Whines To Michael Savage: Hillary Talks Too 'Tough' To Putin
2|5|Keith Olbermann On How To Survive Tonight's Debate
2|5|Kellyanne Conway: Trump Charges False Because He Denies Them And His Wife Agrees
2|2|The Difference? Hillary Supporters Are Actually Happy
2|4|Michael Moore Battles View's Candace Cameron Bure: 'Don't Get Gay Married -- You Won't Like It'
2|1|Elizabeth Warren Warns Trump: 'Nasty Women Vote!'
2|3|Donald Trump: WSJ Is Part Of Rigged System Putting Out 'Dark Polls' Against Him
2|1|"Trump Trolls Now Shouting Nazi Slurs At Reporters, Targeting On Twitter"
2|3|AM Joy On Political Comedy And The SNL Effect
2|3|CNN Hosts To RNC's Sean Spicer: 'Which One Is It' Are You Winning Or Losing?
2|4|Donald Trump Wants Libel Laws Changed To Sue The Press
2|5|Clinton Strategist Questions Authenticity Of Wikileaks' 'October Surprise'
2|5|Trump Shifts From 'Mexico Will Pay For Wall' To 'Mexico Will Pay Us Back'
2|5|"Hillary, You Need To Stop Attacking Trump"
2|2|Trumpster Georgia Governor Nathan Deal Slips 'Colored People' Into Speech
2|4|Oklahoma Republican Calls For Hillary Clinton To Be Shot To Death
2|5|Office Of Personnel Management Publicly Warns FBI About Violating The Hatch Act
2|5|"In A Mocking Speech, Obama Goes After GOP For Supreme Court Hypocrisy"
2|3|Fox News' Judge Napolitano Blasts James Comey: FBI Had No Duty Or Right To Violate Due Process
2|2|Katy Tur Explains Trump's Personal Attacks Against Her: 'It's A Wild Ride'
2|2|Kellyanne Conway Refuses To Address Trump's Incitement On Katy Tur
2|4|Republican Partisans In The FBI Aren't Even Afraid Of A Clinton Win
2|2|NJ Businessman Told Trump's 'Take It Or Leave It'? Leave It.
2|1|Trump's Attacks On Media Are Downright Nixonian
2|5|Trump Flips Out On CNN's Jeff Zeleny For Challenging Him On Voter Fraud
2|3|Karl Rove: Kellyanne Conway's Public Attacks On Romney Make Trump Look Weak
2|5|California Mosques Receive Hate Letters Re 'New Sheriff' Trump
2|3|Right-Wing Clinton Stalker Seeks Funds So Clintons Can Be 'Dead And Buried'
2|3|"Trump Is Trump, But Who Are We?"
2|2|Trump's Absurd Plan To Dismantle Government's Protections
2|3|Author Of ACA Repeal Likely To Be Director Of HHS
2|5|Politics And Reality Radio: Is The Emerging Democratic Majority Still A Thing?
2|2|FAA Restricts Drones Flying Over Pipeline Protests
2|3|'The Big Short' Author Michael Lewis Sounds Alarm On Trump And Wall Street
2|5|"No, Paul Ryan IS Accountable For Trump Tweets And Fake News"
2|2|Congressman Takes To House Floor: 'Stop Tweeting!'
2|2|Trump Team Dumps Son Of Gen. Michael Flynn Over Pizzagate
2|2|"Louisiana Sheriff Reads Bigoted Slurs, Cut Off By MSNBC"
2|5|Trump Now 'Cancelling' Military Contracts Via Twitter
2|3|Mike Huckabee Calls Utterly Unqualified Dr. Ben Carson A Terrific Choice For HUD Secretary
2|2|The Al Gore Meeting: Again Trumps Use Transition Process To Try To Make Money
2|3|Texas Governor: Obama's Still Comin' For Your Guns!
2|1|Samantha Bee Looks At Trump Transition: He's Taking A Dump In The Potomac
2|5|Reince Priebus 'Not Ruling Out' Muslim Registry -- But Says It's Not 'Based On Religion'
2|3|Alveda King Praises Jeff Sessions By Comparing Him To George Wallace
2|4|"Preibus Downplays Trump's Conflict Of Interest, Pay-To-Play Accusations"
2|1|It Wasn't Economic Anxiety That Elected Donald Trump; It Was White Grievance
2|3|The Trump Theory Of Racism: Go Big Or Go Home
2|1|The Transition Is A Mess -- And The Trump Base Is Unfazed
2|2|Trump's America: Federal Judge Tells New Citizens To Like Trump Or Leave
2|4|Rachel Maddow Interviews Dems' Last Hope For Senate: Louisiana's Foster Campbell
2|2|Can Trump Break The Rules (and Laws And Regulations)?
2|2|Top 10 ACTIONS You Can Take To Stop Trump
2|4|Frank Luntz: 'There's Going To Be A Lot Of Recrimination After Election Day'
2|4|'Women Are Having Sex Dreams About Trump': Alt-Right Host Promises 'White Baby Boom' After Election
2|3|Donald Trump Refuses Interview Because He Was Denied The Questions
2|3|Trump Proves Himself A Fool: 'I Don't Use Much ObamaCare'
2|2|Anderson Cooper Challenges RNC Spokesman Over 'Phony Polls' Claims
2|1|Barack Obama Reads Mean Tweets
2|3|Watch Martin OMalley Leave Fox Hosts Sputtering As He Destroys Donald Trump
2|4|President Obama In A New Ad Says 'Vote Early'
2|3|The New York Times' Amazing List Of 281 Angry Trump Tweet Targets
2|1|"'If It Flies, It Dies:' A Readers' Guide To The Navy's Best"
2|3|Kellyanne Conway Tries To 'Make A Deal' On Inciting Violence Against Reporters?
2|4|Deadbeat Dad Joe Walsh Promises To 'Grab His Musket' If Trump Loses
2|2|Donald Trump To Dana Bash: An 'Insulting' And Very Rude Question'
2|4|Trump Strokes Gingrich For His 'Amazing Interview' With Megyn Kelly
2|2|"Libertarian Candidate Gives Up, Tells Supporters They Must Defeat Trump"
2|1|Trump Biographer: 'Rigged Election' Is Cover For Humiliation Trump's 'Losing To A Woman'
2|5|State Police Raids On Voter Registration In Mike Pence's Indiana
2|1|Enough With The 'Voter Fraud' B.S.! (Not Work Safe)
2|4|Oregon Federal Jury Deliberating In Malheur Trial Of Bundy Militants
2|5|The Press Shouldn't Quit Trump After The Election
2|4|Donald Trump On Paul Ryan: 'Maybe He Wants To Run In Four Years'
2|2|Twitter Cracks Up Over Melania Trump CNN Interview
2|5|Is Darrell Issa Going Down?
2|1|"Coincidence? NC Democrats' Office Vandalized On Sunday, Too"
2|4|Women And Donald Trump: Watch Us Take Him Down
2|1|Clinton Emails And The FBI/State Classification Waltz
2|3|Surrogates' Effort To Cool Trump's Rhetoric? Fail. Again.
2|5|Trump Supporter: Let's Take Hillary Out
2|3|John McCain Promises That GOP Will Block Any Clinton SCOTUS Nominee - Or Maybe Not
2|5|John Oliver Slays Gary Johnson And Jill Stein
2|1|"Let's Review Trump's Shifting Positions On Campaign Promises, Shall We?"
2|5|Trumpista Yells 'We Got Some Hillary Bitches On Here!' At Women On Flight
2|2|Women In Science Pledge To Fight Trump's 'Anti-Knowledge'
2|3|"Castro's Dead, How Long Before 'Trump Tower Havana'?"
2|5|Rob Reiner On AM Joy: Media And Celebrity Culture To Blame For Trump
2|3|House Republicans Throw Cold Water On Infrastructure Plans
2|1|Can Trump Create The Terminator Rule?
2|3|Dr. Ben Carson: Running HUD Would Be A Cinch For A Guy Like Me!
2|3|The Recount Is On In Wisconsin!
2|5|The One Man Who Counts (Not Trump)
2|4|Gaslight Nation: Trump Pretends He Saved Kentucky Auto Jobs (He Didn't)
2|3|"And Now, We Remake The Democratic Party. Into What? "
2|2|Harry Reid Blasts Comey As 'Republican Operative' Who 'Threw The Election To Trump'
2|4|(UPDATED) UC Davis Campus Warned Of Possible Razor Blades In White Supremacist Fliers
2|4|Bernie Sanders Slams Bannon; Lays 'Accountability' Trap For Trump
2|5|Did Corey Lewandowski Admit To Contact With James Comey Ahead Of The Election?
2|5|Did Jared Kushner Screw Chris Christie On Transition Team Ouster?
2|1|"Megyn Kelly To Trump Supporter: 'You're Not Proposing The Days Of Internment Camps, I Hope'"
2|4|Trump Rumored To Favor Lt. Gen. Michael Flynn For National Security Advisor
2|4|Who Will Lose Most If Obamacare Repealed? Big Republican States
2|1|Ben Carson's Incoherence On Public Housing Desegregation
2|3|"Ivanka Trump, Who's Moving To DC, Meets With Al Gore"
2|5|One Juror Deadlocks Jury In Trial Of Officer Who Killed Walter Scott
2|4|Vandals Shatter Middle Eastern Bakery Windows In Phoenix; Community Rallies
2|2|How To Make Republicans Own Their Destruction Of The ACA
2|1|"Hey, Senate Dems, More Of This, Please!"
2|5|Senate Democrats Have One Shot At Saving SCOTUS - Will They?
2|1|Online Nazi Propagandists Turn Up Volume On Pizzagate Lies (Updated)
2|4|BREAKING: Pat McCrory Finally Concedes NC Governor's Race
2|3|"Drain The Swamp: Trump Team Loaded With Lobbyists, Jamie Dimon Floated For Treasury Secretary"
2|4|Trump Floats Steve Bannon For Chief Of Staff
2|4|Students Proudly Shout 'White Power' While Marching With Trump Sign At Pennsylvania School
2|5|Trump Is Brexit 2.0: Election Promises Go In The Trash
2|5|CNN Shocked Trump Didn't Ask For Obama's Birth Certificate At White House Meeting
2|1|Al Franken: Repeal The ACA? 'We Will Stop That.'
2|4|"Fox News Trump Supporter: 'President Obama, Himself Was A Racist'"
2|2|Sen. Tom Cotton: 'Waterboarding Isn't Torture'
2|2|The Damage From Free Trade Helped Elect Trump
2|1|Putting Obstacles In King Trump's Path
2|5|Is Trump Working To Dislodge A Democratic Senate Seat?
2|3|"One Down, 62 Million Trump Voters To Go"
2|5|Man Threatens To 'Shoot All Spanish-Speaking People' At Store Because 'This Is Our Country'
2|3|Corey Lewandowski: 'Media Took What Donald Trump Said So Literally!'
2|5|"For Keith Olbermann, The Hacked Election Is Personal"
2|2|"Birds Of A Feather, Flocking Together"
2|4|Post-Election Forum: Trump's Team Have 'Ax To Grind'
2|4|Kellyanne Conway Gets Flustered Refusing To Answer Whether Trump's Voter Fraud Tweet Was True
2|4|The Trump Faithful Are Already Expressing Buyer's Remorse
2|1|"Trump Transition Rep: Never Mind Wall Street's Past, Look Ahead! "
2|3|Former CIA Chief Michael Hayden Lies About The Effectiveness Of Torture: UPDATED
2|1|Serious Questions Arise About Trump Vote Totals In Key Swing States
2|5|Jeanine Pirro Accuses Black 'Hamilton' Actor Of 'Reverse Racism' Against Mike Pence
2|5|Trump's 'Hamilton' Meltdown Stuns CNN Host: 'I'm Speechless'
2|4|Face The Conservative Nation: Economy Edition
2|2|Trump: America's First Part-Time President
2|4|"Mike Pence 'Wasn't Offended' By Cast Of Hamilton, Then Waffles On If He's Owed Apology"
2|3|Rep. Katherine Clark (D-MA) Introduces Legislation To Stop Trump From Profiting Off The Presidency
2|4|John McCain: 'I Don't Give A Damn. We Will Not Waterboard. We Will Not Torture People'
2|1|Elizabeth Warren Taunts Romney: 'Bring Your Binders Full Of Women!'
2|4|David Axelrod: Welcome To Trump's 'Monster's Ball' Of Administration Picks
2|5|They're Coming For Medicare -- Be Ready
2|1|Trump University Lawsuit Quickly Settled For $25 Million
2|3|Keith Olbermann's New-Old GQ Web Show Is Called 'The Resistance'
2|1|CNN Commentator Reminds Us All: We Live In A Post-Truth Society Now
2|2|Ford Motor Company Rolls Over Like A Puppy For Trump Lies
2|5|Ana Navarro On Trump's Attorney General Pick: 'Not Sure There's A Statute Of Limitation For Racism'
2|3|Morning Joe Says Bigot Sessions Will Get Confirmed Because Beltway Takes Care Of Its Own
2|2|General Flynn's Axis Of Evil Is Even Bigger Than Bush's
2|5|Schumer: GOP Wants To 'Overhaul Medicare'? 'Make Our Day!'
2|2|Trump Says Elton John Will Perform At His Inauguration: Elton Says 'Hell No'
2|3|Trump National Security Advisor A Clear And Present Danger To National Security
2|3|Trump's Outreach To Carrier: Smoke And Mirrors
2|1|The Return Of The Grinch-Walker
2|3|Burned Out On Trump? So Are We...
2|3|Two Women And One Man Does Not Suggest A Diverse Cabinet
2|3|Trump Surrogates Want Romney To Apologize To Trump
2|1|Dr. Ben Carsons Terrifying Qualifications To Serve As HUD Secretary
2|5|Obama Awards His Final Presidential Medals Of Freedom
2|3|"The Paris Pact Might Save The Planet, Despite Trump"
2|1|Reports: Ayn Rand Devotee John Allison Under Consideration For Treasury
2|4|Keith Olbermann To Trump: 'America Will Kick Your Ass!'
2|3|Betsy DeVos Tapped For Secretary Of Education
2|3|"Russian Collaborator: Trump, Jr. Met With Russians To Discuss Syrian 'Solution' In October"
2|3|How Will You Survive Thanksgiving With Trump-Loving Relatives?
2|2|Another GOP Never-Trumper Sells Out: Nikki Haley
2|4|What Happens When Trump Business Interests Tangle With Diplomacy?
2|5|"Chris Cuomo, Darryl Issa Fight Over Trump's 'Illegals' Lie"
2|3|Joe Scarborough Rips Apart Gen. Michael Flynn For Promoting Racist And Fake News On Twitter
2|1|"Crazy Ben Carson Named HUD Secretary, Because, Ya Know"
2|4|"When It Comes To Reporting On Nasty Demagogues, We Have No Idea What Works Anymore"
2|1|Trump's Taiwan Phone Call Was Planned Long In Advance
2|2|Ministry Of Propaganda: Dick Cheney Tells CNN 'We Don't Need You Guys Anymore' Because Trump Has Twitter
2|4|"Woman Takes On Trump's 'Embarrassing' Tweets In Epic Rant: 'Pick Your F*cking Battles, Man' "
2|5|Rep. Elijah Cummings Criticizes Rep. Jason Chaffetz's Sudden Timidity On Investigations
2|5|Gen. Petraeus On Making False Statements To The FBI: 'At The Time I Didn't Think It Was False'
2|2|Trump May Be The First President-Elect To Not Submit A Budget
2|2|The Debates Real Winner? Resting Hillary Face
2|3|Hillary Clinton Saved the Bombshells for Round 2
2|1|Skittish GOP Doesnt Want to Talk Donald Trump
2|1|Al Gore Poised to Rejoin Clintons With Earth and Election in the Balance
2|2|Everyone Knows Donald Trump Is RacistExcept for Donald Trump
2|1|Pentagon Cringes at Donald Trump and Hillary Clintons War Talk
2|4|Why Did CNN Make Lester Holt Invisible During Last Nights Presidential Debate?
2|1|"Heroic Ambulance Volunteers While Donald Trump, Hillary Clinton Blather"
2|5|Donald Trump Told Miss Universe Alicia Machado: Do Sit-Ups or Youre Fired
2|3|The Word America Spelled Wrong on Trumps D.C. Hotel Menu
2|5|"No, U.S. Immigration and Customs Enforcement Did Not Endorse Trump"
2|3|Post-Debate Reading List: When Trump Wouldnt Rent to Black Families and More
2|1|"Latina Miss Universe, Insulted by Trump, Thanks Hillary for Debate Shout-Out"
2|2|Hillary Clintons Pitch to End Private Prisons Is the Surprise Hit of the Presidential Debate
2|5|Cranky Gary Johnson: Should We Just Drop Out Then?
2|3|"Body-Language Expert: Trump in Defensive Crouch, Hillary in Command"
2|3|Donald Trumps Online Trolls Turn on Their God Emperor
2|4|Donald Trump Comes Up Small on His Biggest Stage Yet
2|5|Hillary Clinton Goes the Distance As Donald Trump Punches Himself Out
2|3|Trevor Noah: Donald Trump Was Sniffing All the Bulls**t He Was Saying at Debate
2|2|Donald Trump Triples Down on Lie That Hed Always Opposed Iraq War
2|1|Unrepentant Donald Trump: My Birther Lies Were Awesome
2|2|Donald Trump Bungles Hillary Clintons Tax Returns Attack
2|1|Donald Trump Raves On As Hillary Clinton Speaks
2|5|Right-Wing Gala Gave Freddie Gray Cops Standing Ovation
2|4|"Bo Dietl, Roger Ailess Top Detective, Files Papers to Run for NYC Mayor"
2|5|"Hillary Clinton, Reform Candidate? Yes She Canand Must"
2|2|Glenn Beck Breaks Up With Ted Cruz Over His Donald Trump Endorsement
2|3|Watch: Saturday Night Lives Best Fake Debates
2|3|How the 9/11 Families Could Force the First-Ever Override of an Obama Veto
2|2|"What 21 Primary Debates Tell You About Historys Most Disliked Candidates, Donald Trump and Hillary Clinton"
2|1|Does Hillary Clinton Want to Shut Down Fracking?
2|2|How to Watch the First 2016 Presidential Debate Live Stream
2|2|Heres Hillarys Debate Knockout PunchWill She Use It?
2|2|Trump Campaign Struggles to Explain Gennifer Flowers Invite
2|1|How to Moderate a Presidential Debate
2|5|"Hey, Hillary Clinton: Heres How to Debate a Narcissist"
2|2|"As American Education Collapses, Democracys Foundation Shakes"
2|5|Watch for Media Bias in Debate Coverage
2|4|Will Bill Clinton Become Hillary's Eleanor Roosevelt?
2|4|Trump Makes a Bunch of Clark Kents Feel Like Supermen
2|4|How Truman Reinvented Campaigning
2|1|"Ted Cruz Chooses Donald Trump Over Wife, Dad"
2|2|Silicon Valley Money Floods to Hillary After Facebook Fat Cat Revealed as Secret Trumpkin
2|1|"Donald Trump & Hillary Clinton Finally Face Off, With Democracy Itself at Stake"
2|4|Three More Hillary Clinton Witnesses Were Given Immunity by FBI
2|3|"Facebook, Stop Messing With the Election"
2|3|Americas Mosques Say Hell No to Hosting Donald Trump
2|5|How the Women of the Obama White House Fought Gender Inequalityand We Can Too
2|1|Dont Panic! Why Hillary Clinton Is Still Going to Win
2|4|Palmer Luckey: The Facebook Near-Billionaire Secretly Funding Trumps Meme Machine
2|3|Watch: All the Awkward Cameos Presidential Candidates Have Made on Comedy Shows
2|5|Donald Trumps Black-Outreach Trainwreck Is Getting Worse by the Day
2|2|Is a North Carolina Law-and-Order Backlash Inevitable?
2|5|Donald Trump: Hillary Clinton Will Be in Jail if Im Elected
2|5|Trump Goes Into Full Meltdown in Second Debate
2|4|"Donald Trump Brings Four Bill Clinton Accusers to Debate, Definitely Not Sorry About Tape"
2|4|Billy Bush Suspended From Today After Lewd Trump Tape Scandal
2|2|Theres Still Time to Replace Donald Trump as the GOP Nominee
2|2|Breitbart Creates Alternate Reality for Donald Trump on His Worst Weekend
2|4|Donald Trump to GOP: This Means War
2|5|"Legitimate Rape to Grab Them By The P---y, Is Donald Trump the GOPs New Todd Akin?"
2|2|Forcible Toucher Donald Trump Wont Take the Presidencys No For An Answer
2|4|This Quiz Predicts Whether You Love or Hate Trump
2|3|A Newt Ally and Republican Revolutionary Considers Hillary
2|2|The Sad Surrogates Still Spinning for Trump
2|5|"Republican Senators, Representatives, and More Leap From Trump Train Crash"
2|5|Every Woman in America Knows Donald Trump and Billy Bush
2|1|"Donald Trump Said in 2012 Gloria Allred Would Be 'Very, Very Impressed' With His Penis"
2|5|How to Watch the Second 2016 Presidential Debate Live Stream
2|1|Comic Con Takes NYC (Photos)
2|5|Why President Trump Will Have Us All Carrying Federal ID Cards
2|3|Donald Trump Just Revealed His Next Debate Strategy
2|2|Donald Trump Just Lost The Election
2|3|"Donald Trump Is Exposed, And So Are the Republicans Who Are Sticking With Him"
2|5|The Top 10 Ways 2016 Presidential Politics Are So 1840
2|4|A Pro-Trump Art ShowBut the Artists Are...Interesting
2|4|Know-Nothing Bigot Who Won Big
2|4|Leaked Podesta Emails Show Bernie Was Right
2|2|Donald Trump Tried to Fire Nancy ODell After She Rejected His Sexual Advances
2|4|Republicans Condemn Trumps Disgusting Remarks About Women
2|3|Republicans Hold Hillarys IT Guy in Contempt of Congress for Refusing to Testify
2|5|"Spiritual Healing With Marla Maples, Donald Trumps Ex-Wife"
2|1|Tale of Two Charities: Trumps Helps Trump While the Clintons Is the Real Deal.
2|2|The Myth of a Democratic Electoral Lock
2|2|Bill Clinton to His Foundation: Remember the Good Times
2|4|Don King Drops N-Bomb for Donald Trump
2|1|Chris Christie Made First Responders the Butt of His Nasty 9/11 Joke
2|3|Donald Trump Can Legally Run His Company From the Oval Office
2|1|Your Alma Maters Biggest Rival? Stingy State Government
2|4|"Elizabeth Warren Grills Wells Fargo CEO, Hillary Clinton Feels the Heat"
2|5|"Hey, Mike TysonYour BFF, Donald Trump, Wants to Profile You"
2|4|"Ted Nugent Wants to Elect Trump and Kill Hillary Clinton, Barack Obama"
2|3|Watch: All the Times Trump Campaigned for His Own Products
2|3|An Open Letter to Swing Voters Still Considering Donald Trump
2|1|Stephen Colbert Hammers Donald Trump for Birther Lies: Were Not Crazy!
2|2|Trump: Make America Scared Again
2|3|Hillary Clinton Invites Millennials to Vote & Chill
2|2|Hillary Clinton: Im the Only Candidate With Experience on Terror
2|5|Did Salmonella at Trumps Restaurant Kill Her Dad?
2|1|Debate Commish to Millions of Americans: Screw You
2|3|Team Trump Spooked by Charity Probe
2|5|Donald Trump Claims He Finished Birtherism. Fact Check: Pants on Fire
2|4|Could a Terror Attack Elect Donald Trump?
2|2|My Hunt for Hillarys Radical Thesis
2|3|Catholic Leaders Smite Tim Kaines Gay Marriage Hope
2|4|Colin Kaepernicks Protest Splits the Pentagon
2|5|"Compared to Trump, Goldwater Was a Sensible Moderate"
2|5|"Down Ballot, Democrats Fight to Retake Senate and Rebalance Supreme Court"
2|2|WikiLeaks Latest Find Is a Conspiracy Theory From Trumps Subreddit
2|2|"Melania Trump, Wife of a Bully, Promises Shed Be Tough on Bullying as FLOTUS"
2|1|What a President Donald Trump Actually Would Do in Office
2|3|The Donald Trump Sign at the Cop-Killers House
2|2|Meet Donald Trumps Top FBI Fanboy
2|3|Trump: In Florida Man I Trust
2|2|Is Martin Babinec the Mike Bloomberg of the House?
2|5|Why Hillary Clinton Could Actually Win Alaska Over Donald Trump
2|3|Despicable David Duke Does His Best Donald Trump Imitation
2|1|Trumps Teen Jane Doe Rape Accuser Disappears Again
2|4|Get an IUD Before Its Too Late
2|3|"Barack Obama Smacks Down His Own FBI Chief, James Comey"
2|5|Five Reasons Not to Panic About Hillary Clinton Right Now
2|2|Senior Superlatives: Political Ads of 2016
2|5|Fraudsters Plague Fraud Candidate Donald Trump
2|1|Why Hillary Clintons Fate Rests in Ex-Republican Charlie Crists Hands
2|4|Donald Trump Is a Role Model for Childrenof What Not to Be When They Grow Up
2|1|Donald Trump Cant Merely Be DefeatedHe and His Deplorables Must Be Crushed
2|5|Mark Burnett Clamps Down on The Apprentice Staff Over Donald Trump Leaks
2|2|The System Is Rigged. Heres How to Fix It.
2|3|Why Donald Trump May Never Pay Federal Income Tax Again
2|5|Trump Is Banking on Wisconsin Being Racist Enough to Go Red for the First Time Since 1984
2|4|WikiLeaks Reveals Team Hillarys Libya Spin: It Would Be Syria Without Clintons War
2|5|The Party Girl Who Brought Trump to His Knees
2|4|Trump Place Residents Fear Low-Class Name Is Costing Them a Fortune
2|5|Mike Pences Halloween Rally in Florida Turns Spooky
2|4|Meet The Man Who Is Spinning For Donald Trump In Russia
2|2|What in the World Got Into Matt Lauer at the Commander-in-Chief Forum?
2|3|Watch: John Avlon on Why Trumps Pro-Putin Comments Are Insane
2|2|Watch: The Moments When Presidential Campaigns Lost Their Sh*t
2|5|I Asked Gary Johnson About Aleppo. I Dont Blame Him For Not Knowing
2|3|Hillary Clinton Did Not Wear an Earpiece: Here Are Close-Up Pictures to Prove It
2|4|Its Time for the Media to Step Up and Call Out Donald Trumps Many Lies
2|4|"Gary Johnson Wants to Be President, Doesnt Know What Aleppo Is"
2|4|"Donald Trump Dreams of an Endless, Bloody, Costly American War "
2|5|Seth Meyers: Trump Foundation Way Worse Than Hillary Clintons Scandals
2|1|Donald Trumps Campaign Guru: Bill Clinton Did 9/11
2|3|"In New Hampshire and Other States, Democrats Seem Just Fine With Dark Money"
2|2|Hillary Clinton and Donald Trump Self-Destruct at Commander-in-Chief Forum
2|2|The Origin of Julian Assanges War on Hillary Clinton
2|1|"Donald Trumps America: Bigger, Badder and Broke"
2|4|Mitt Romneys Rich Backers Turn to Hillary Clinton
2|3|Heres How Hillary Clinton Can Make the Press Do a Better Job Covering the Election
2|4|Did Donald Trumps Tweets Imperil a Marine Jailed in Mexico?
2|2|"Now That Courts Have Destroyed Voter ID Laws, the GOP Is in a Panic to Suppress the Vote"
2|2|The Daily Shows Trevor Noah Rips Donald Trumps Scripted Black Church Speech
2|3|The Disgraced and Little-Known Generals Backing Donald Trump
2|4|The Fact That Hillary Clinton and Donald Trump Are Even Close in Texas Is Amazing
2|1|Newt Gingrich Has Coughing Fit While Touting Hillary Clinton Cough Story
2|3|Donald Trump Stumbles and Lies His Way Through Vets Town Hall
2|4|USA Freedom Girls Sue Trump Campaign for Stiffing Them
2|2|A Republican Candidate Said He Hoped I Got Raped
2|5|The Man Who Made Donald Trump Hate Mexico
2|1|Top Trump Aide on Campaign Syria Plan: I Dont Know the Answer.
2|2|Watch: Mike Pence Shakes His Head at Things That Are True
2|4|Mike Pence Recycles Anti-Hillary Clinton Abortion Lie for VP Debate
2|2|Rudy Giuliani Used to Know Better
2|4|Donald Trumps Charity Scandal Is About to Go National
2|5|"Mike Pence Ditches Donald Trump, Starts His 2020 Run at VP Debate"
2|2|Rude Tim Kaine Uses Donald Trumps Words to Corner Mike Pence
2|1|Mike Pence Pinky-Swears: Trump and I Will Stand Up to Putin
2|5|Vanilla Vice Presidential Debate Turns Nasty on Taxes
2|2|Tim Kaine to Mike Pence: You Are Donald Trumps Apprentice
2|5|The Clinton Campaigns Secret Weapon: Tim Kaine Thirst Trap Photos
2|1|Clinton Foundation: Those Hacked Files Arent Ours
2|1|"President Obama, Drug Czar Host 9/11-Truther Macklemore, Again"
2|1|Straight Talk About Crooked Hillary Clinton
2|4|How to Watch Tim Kaine and Mike Pence in the 2016 Vice Presidential Debate Live Stream
2|3|"WikiLeaks Trolls Trump World, Delivers Nothing on Hillary"
2|3|Mike Pence Pushes Guns as Indiana Bleeds
2|5|Mike Pence vs. Tim Kaine: Can Two Nice Guys Kill Each Other With Kindness?
2|5|How Melrose Place Was Reborn as a New York Art Show
2|5|Lessons for Tim Kaine: How Dick Cheney Outfoxed Joe Lieberman in 2000
2|2|Donald Trump Forced to Spill Charity Secrets Weeks Before Election Day
2|3|RNC Brags About Willie Horton Attack That Was So Racist Its Creator Disavowed It
2|4|Draft-Dodger Donald Trump Implies PTSD Sufferers Are Weak
2|5|The Trump Campaigns Legal Bills Are YUGE
2|1|Art of the Steal: This Is How Trump Lost $916M and Avoided Tax
2|3|Tim Kaines Time With a Marxist Priest
2|3|"Mike Pence, Postmodern Evangelical Catholic Conservative"
2|2|Porn and Pot Win Big in Trumpocalypse
2|3|Why the Latino Vote Didnt Save America
2|3|Trump: The First President Who Is Hated in His Hometown
2|3|Trump Shocks the World
2|5|Markets Plummet on Trump Victory
2|3|The Biggest Stories You Missed During the Last 100 Days of the Election
2|2|Republican Senate Wont Lie Down for President Trump
2|5|Hillary Clinton Destroyed Her Own Campaign
2|1|The Smart Set Takes Its Lumps as Trumps Americans Roar
2|2|How The Daily Beast Will Stand Up to President Donald Trump
2|4|Heartbroken Never Trumpers Mourn for the Party of Lincoln
2|1|Putin TV Hails The Trump Administration
2|1|Alt-Right Declares Total Victory: Were the Establishment Now
2|4|Nail-Biting Night Ends in Trump Victory
2|4|Eyewitness to the Los Angeles Shooting That Shook the Election
2|3|"The Man Behind Journalist, Rope, Tree"
2|1|The Weather Channels Epic Election Escape Might Really Stress You Out
2|4|"For a Few Moments Today, You Could Make Trumps Site Say Whatever You Wanted"
2|1|The Strangest Places for Americans to Vote
2|4|"Americans on Twitter, Reddit and 4Chan: Apparently You Have to Register to Vote?"
2|2|Judge Destroys Trump Campaigns Lawyer Attacking Early Voting
2|2|How America is Voting Right Now On Election Day
2|3|Hundreds Put I Voted Stickers on Susan B. Anthonys Grave
2|5|The GOPs Top Two Hypocrites: Issa and Toomey
2|2|Decision Day for Americas Family Feud: The Strongman vs. Stronger Together
2|5|All 50 States Ask Feds to Help Them Stop Election Day Hackers
2|3|#ImWithHer... but Dont Tell Anyone: Inside the Heart and Mind of the Secret Hillary Clinton Voter
2|4|Libertarians to America: Dont Blame Us for Trump
2|4|The Pro Wrestling Promoter Helping Women Fight Back in Trump's America
2|3|Get Ready For The Most Sued President in History
2|2|Elizabeth Warren Faces President Trump with Rachel Maddow: No Compromise on Bigotry
2|4|President-Elect Trump Attacks Media on Twitter for Inciting Protests
2|3|Pentagon Waits for Team Trump to Show Up
2|4|President Trump and the GOP May Cut Health Insurance for 16 Million People
2|1|"Raging Trump Protesters Threaten Violence, Blame Hillary"
2|5|75 Lawsuits Against President-Elect Trump
2|3|Donald Trumps Next Victims Watched Him: Undocumented Immigrants
2|1|Nervous Pentagon Wonders if It Can Slow Down Commander in Chief Trump
2|3|The Steel Mill Fire That Reminds Us Why Donald Trump Won
2|5|A Muslims Pep Talk for Fellow Progressives
2|3|Muslim Americans: Democracy Will Protect Us From Trump
2|3|Will Trump Put LGBTQ Equality in Peril?
2|3|"Donald Trumps Supreme Court Wont Just Overturn Gay Marriage and Abortion Cases, It Will Strangle the Federal Government"
2|2|Team Bernie on Trump: We Told You So
2|4|Donald Trump Foes Kiss the Kings Ring
2|2|Why Voters Elected President Donald J. Trumpand Why Theyll Regret It
2|4|Team Trump Struggling to Fill National-Security Jobs
2|4|Why Catholics Crucified Clinton
2|5|Wake the Children? And Tell Them What?
2|1|Hillary Clinton Concedes After a Night of Broken Hearts for Her Supporters
2|2|A Muted Farewell to Hillary Clinton
2|2|"Legal Weed, a Gay Governor: The Election Wasnt Completely Terrible for Liberals"
2|4|Trump Victory Sparks Nationwide Protests (PHOTOS)
2|4|President-Elect Trump Could Make a World of Trouble Worse. Much Worse.
2|1|Donald Trumps Pollster Says the Election Came Down to Five Counties
2|4|The Alt-Right Is a Movement Distinct From White SupremacismSo Call It What It Is
2|4|Trump Cant Stop Complaining About Hillary Clinton
2|1|Trump Picks James Mad Dog Mattis as Secretary of Defense
2|4|Trump & Hillary Aides Get in Goddamn Foodfight Shouting Match
2|5|Donald Trumps Carrier Victory Speech Shows Were Stuck With the Crazy Candidate
2|4|Ben Carson Still Doesnt Have a Job
2|2|"Why Is My Sister Dead, Sheriff Clarke?"
2|1|Democrats Target Trump Hotel as Federal Government Shrugs
2|3|Trump Feeds Your Kids to D.C. Swamp
2|2|Its Time the Good Trumpers Denounce Hate by Radical Trumpists
2|3|Why Salem State University Is Hiding This Ku Klux Klan Picture Behind a Curtain
2|4|Paul Manafort Is Back and Advising Donald Trump on Cabinet Picks
2|5|"Cheating Men Get a Second Life in Politics, Cheating Women Get a Scarlet Letter"
2|2|"House Dems Lose Big, Change Nothing As Pelosi is Re-Elected"
2|2|The View Grills Jill Stein on Recount: What Are You Trying to Prove?
2|2|Does Mitt Romney Have Enough Dignity to Turn Down Donald Trump?
2|4|How the GOP Won Big in 2016 and Lost All Control
2|5|The New Battle in Americas Culture War
2|4|Trump Picks Foreclosure King Mnuchin for Treasury Secretary
2|1|Trump Health Czar Tom Price Is a Nightmare for Women
2|2|Mika Brzezinski Turns on Elizabeth Warren: Im Getting Tired of This Act
2|3|Donald Trumps Call to Jail Flag-Burners Is the Latest Example That He Hates Free Speech
2|2|Trump Trolls Cheer Trans Woman's Suicide Note
2|3|The Decorated Marine Who Called Trump a Draft-Dodging Bastard to His Face
2|1|How Macomb County Created and Killed the Clinton Machine
2|4|Recount Fight Continues Amid Conspiracy Theories
2|5|Happy Constitution Day. Here are the Three Most Unconstitutional Things the Government is Doing Right Now
2|4|Trump Tells the Truth About Obamas Birth to Lie About Hillary
2|1|Pro-Life Leaders Finally Embrace Donald Trump
2|5|Donald Trump to Jimmy Fallon: I Know Nothing About Vladimir Putin
2|2|Donald Trump Again Plays Birther Card; Then Has Spokesman Take It Back
2|1|Blame Millennials for President Trump
2|2|Bill Clinton on The Daily Show: Donald Trumps Fans Are Getting Played
2|3|Donald Trump Jr. Is the Trump Campaigns Worst Surrogate
2|3|Donald Trump: The Federal Reserve Is Rigged!
2|3|Trump: Stop Regulating Poisoned Dog Food
2|1|Donald Trump to Dr. Oz: Im as Strong as Tom Brady
2|3|"Donald Trump Didnt Keep His Word in Flint, Pastor Says"
2|5|Why Its Impossible for Democrats to Win the House
2|1|Donald Trump Dances to His Billionaire Backers Tune on School Choice
2|1|Putin TV Stars Pump for Trump
2|4|Colin Powell: Bill Clinton Is Still Dicking Bimbos
2|2|"Crooked, Dead Republican Wins Reelection"
2|2|Why We Dont Need a Ninth Supreme Court Justice
2|2|Donald Trumps Bogus 9/11 Rescue
2|2|Conversation Becomes Shouting in a Society Without Authority
2|5|The Clinton Foundation Youve Never Heard Of
2|4|Stephen Colbert Takes on Hillary Clintons Pneumonia: Even Her Immune System Turned Against Her
2|3|"Campaign Ailing, Donald Trump Turns to Muslim Doctor Mehmet Oz"
2|1|"Obama Torches Trump on Transparency, Fitness to Lead"
2|4|Good News! Were Almost as Rich as 15 Years Ago
2|4|"Mike Pence Says No to the Alt-Right, but Wont Call David Duke Deplorable"
2|3|The Secret Heiress Funding the Right-Wing Media
2|4|Team Trump Not Backing Down on Assassination Attempt
2|4|Trumps Russia Towers: He Just Cant Get Them Up
2|1|Lets Make 2016 the Last Endless American Election
2|3|How Donald Trump Brought (Some of) Us Together
2|2|Hillary Clintons Closing Argument Is RightAnd Is Probably Enough
2|5|How the Right Destroyed the Truth
2|3|"Vivian Ziegler Paid Her Taxes, Told Her Story, Voted for Hillary Clinton, and Died."
2|5|"In Missouri, Perfect GOP Candidate Sees Donald Trump as a Means to an End"
2|2|Bernie Sanders Tells Kids to Drag Friends To Vote
2|4|From Samuel Tilden to Al Gore: A History of Contested Presidential Elections
2|4|Donald Trumps Billionaire-Backed Super-PAC Also Paying Rudy Giulianis Law Firms
2|3|Early Voters Give Hillary Clinton Much Needed Firewall in Swing States
2|4|Donald Trump Trash-Talks Jay Z for Supporting Hillary Clinton
2|2|Trump Calls Obama's Protester Reaction a 'Disgrace'
2|1|An Oral History of Dumpster Fire
2|1|"Meet Dennis Hof, Nevadas Latest Pimp To Try and Make the Leap Into Politics"
2|4|Why We Should All Fear the Rot Inside the FBI
2|5|Mike Pence Says Trump Is Like Reagan. Mike Pence Is Bonkers.
2|2|Vladimir Putin Wins the Election No Matter Who The Next President Is
2|1|The State That Will Pick the President
2|2|"Investigate FBI Leaks to Rudy Giuliani, Top Democrats Tell Justice Department"
2|3|Hannity and Drudge Cite WikiLeaks to Claim Clinton Campaign Worships Satan
2|1|What if FBI Rogues Subvert the Election?
2|1|"Liberal Hollywood Power Players Working for Breitbart and Trump Campaign CEO Steve Bannon, Too"
2|4|MyPillow Mogul Michael Lindell Sees Self in Donald Trump
2|1|Donald Trump: The Worst of Baby Boomers
2|3|Hissing Feline Stars at #GOPHandsOffMe Protest Outside Trump Tower
2|1|Donald Trump Doesnt Understand What It Means to Make America Energy Independent
2|3|They Put Politics Aside to Scrub Anti-Trump Graffiti After Riots
2|4|Seven Reasons Why Hillary Clinton Lost and Donald Trump Won
2|1|White House Battle: The Establishment vs. Alt-Right Icon
2|4|"The Hate After Trumps Election: Swastikas, Deportation Threats, and Racist Graffiti"
2|5|Steve Bannons Dream: A Worldwide Ultra-Right
2|3|An Open Letter to Celebrities Threatening to Leave the Nation
2|3|Democrats Put on Brave Face for Sunday Shows
2|2|"Like It or Not, Donald Trump Saw the Economic Crisis the Others Didnt"
2|3|Anarchist for Trump: Time For Liberals To See America As It Really Is
2|4|This Election Had Medical ConsequencesAnd I Gave Them a Name
2|5|Reagan Redux. But Worse.
2|2|When a Country Elects a Celebrity Populist
2|5|This Wont Do For Democracy
2|2|An Open Letter to President-Elect Trump: Live Up to the Values Youve Mocked
2|4|Who Will Run Trump Organization Now that His Kids Are on the Transition Team?
2|4|North Dakota Pipeline Protesters Win a Battle but Lose the War
2|3|"Hey, Mark Zuckerberg, Fix Your Broken Website"
2|2|"You Cant Sit With Us, Ivanka"
2|5|Mexican-American Trump Voters: Pulling Up the Ladder
2|5|"No, Bernie Sanders Would Not Have Won"
2|5|Heres How China and Russia Will Test Trump
2|1|Will Italys Leader Fall to Trumps Hate Contagion?
2|2|"Immigrants Gave Their Info to Obama, Now Trump Could Use It to Deport Them"
2|3|Trump Is Proof: Feminism Isnt Free
2|3|The NRAs Big Gun in the White House
2|1|Colin Kaepernick Didnt Vote. Cant Complain.
2|2|"Donald Trumps Disgusting, Pathetic Don Draper Imitation"
2|5|Erin Ryan Talks Lewd Trump Tape
2|1|Evangelical Leaders Shrug At Donald Trumps Lewd Comments
2|2|Corey Lewandowski Previews Trump Campaigns Defense of Lewd Tape
2|5|All the Times Donald Trump Defended Sexual PredatorsIncluding Himself
2|1|"Donald Trumps Sorry He Offended You, Not Sorry for What He Did"
2|5|Donald Trump Keeps Smearing the Long-Since Exonerated Central Park Five
2|3|Womens Groups Slam Predator Donald Trump for Lewd Video
2|4|How to Register to Vote in the 2016 Presidential Election
2|4|Russias Senior-Most officials Ordered DNC Hack
2|1|Donald Trump Brags About Nonconsensually Groping Women In Newly Uncovered Recording
2|4|Did Floridas Gov. Create a Voting Rights Disaster?
2|2|Why We Need an LGBT Census
2|5|"If Donald Trump Wins, the GOP Will Rein Him In, Right? Uh, Yeah"
2|4|Can Someone Please Make the Candidates Talk About Social Security?
2|4|"Starting Today, the Muslims Are Comingto Vote!"
2|4|Prisoners Texted Guards for Drugs and Paid Them With PayPal
2|5|Louisiana Governor Sues His Attorney General Over Anti-Trans Crusade
2|5|The Daily Shows Ronny Chieng Destroys Fox News Jesse Watters: You Ignorant Sack of Sh*t!
2|3|Donald Trump Holds Make-Believe Town Hall to Prep for Real Debate
2|4|Donald Trumps Corporate Biography Claims John McCain Was a Birther
2|1|Lethal Coal King Don Blankenship: Im an American Political Prisoner
2|4|Donald Trump Is Now Going Full-On Pickup Artist
2|4|President Donald Trumps Team of Terribles Would Bring Bridgegate to Oval Office
2|5|Hillary Clinton Went to Bat for Chevron
2|5|Is This How a Hillary Clinton Tell-All Gets Made?
2|3|Take This Quiz Before You Vote
2|1|"Blackwater Founder Erik Prince, Who Got Rich Off Of Iraq, Now Backs 'Anti-War' Donald Trump"
2|3|Porn Star Jessica Drake Accuses Buffoon Donald Trump of Sexual Misconduct
2|3|Donald Trump Vows to Sue Female Accusers After Election
2|5|"Trump Will Go Away, but the Anger Hes Stirred Up Is Just Getting Started"
2|2|Hillary Clinton Stays Undefeated Against the Alpha Males
2|2|The Election Is a Choice Between Fatherland and Motherland America
2|1|The Awkward T-Shirts of Trump Supporters
2|5|Curt Schilling Launches Senate Bid with Brutal Jake Tapper Interview
2|5|Neither Candidate Has Any Real Plan For Our National Debt
2|1|How Ivanka Sank From Millennial Womens Icon to Alt-Right Fellow Traveler
2|4|Newt Gingrich and Dick Gephardt Back Trumps Wait-and-See Election Stance
2|4|Al Smith Charity Dinner Crowd Rains Boos on Donald Trump
2|2|"Donald Trump, Son of a Catholic Hater, Disgraces Al Smith Dinner"
2|2|Nevada: The One State Where Latinos Dont Hate Donald Trump
2|3|Watching the Fight for America
2|4|Why Has the Trump Campaign Spent Over $3 Million on Lawyers?
2|2|Prisons Are Erupting and Why It Matters
2|1|Colbert Hits Trumps Fake-Out: I Actually Believed You Had a Shred of Integrity
2|1|President Trump Would Create More Bad Hombres
2|3|Did Russian Hackers Tip Off Donald Trump?
2|5|Why Its Tough Being a Woman Named Trump
2|5|New Yorks Biggest Party Is a Trump Protest
2|3|How Hillarys Fans Turned Nasty Around
2|1|Beaten Up Protesters Sue Trump Campaign for $1 Million
2|1|Donald Trumps Election Threat Sickens the Pentagon
2|2|Heres What Somebody Whos Still Betting Cash on Trump Looks Like
2|3|New Trump Accuser Karena Virginia: I Blamed Myself for Trumps Grope for Years
2|4|Sexism: The Only Thing Donald Trump Hasnt Lied About
2|1|Did Right-Wing Group Citizens United Target Dementia Sufferers for Fundraising?
2|4|"Democrats Say WikiLeaks Is a Russian Front, U.S. Intelligence Isnt So Sure"
2|5|Donald Trump Attacks Help Hillary Clinton Forge Truce in Her Long War With the Media
2|2|"Voter-ID Laws, From Sea to Racist Sea"
2|1|"#NeverTrump: We Told You He Would Kill Us, but You Didnt Listen"
2|4|Spy Comes Back From the Dead to Torment Donald Trump
2|2|Breitbart Boss Stephen Bannon Bragged in 2015: Im Trumps Campaign Manager
2|4|What Do You Call Donald Trump and Other Rich People Who Dont Pay Tax? Heres a HINT.
2|4|The Republican Party Made Donald Trump. Now Donald Trump Is Destroying the Republican Party.
2|2|"Paul LePage Compares Everything to the Holocaust, Wants Donald Trump to Be Authoritarian"
2|2|Donald Trumps Lackeys Blame Women and Blacks for How He Talks About Women
2|5|Former Donald Trump Executive: Hes a Supreme Sexist
2|1|Mike Pences Fellow Parishioners Are Furious at Donald Trump
2|3|GOP Civil War Goes Nuclear
2|2|Wikileaked Emails Show Team Hillary Comparing Rubio to Obama
2|1|Notorious Troll Chuck C. Johnson: I Sent a Clinton Accuser to the Debate
2|1|2016: The Year of the Pussy
2|4|Powerful Evangelical Women Split From Male Church Leaders to Slam Trump
2|5|"Donald Trump Tries to Drag Hillary Clinton, America, Down Into His Gutter"
2|2|Watch: Trump Defends His 'Tremendously Respectful' Words on Women
2|1|Mike Pence Throws Himself Under Donald Trumps Bus
2|5|Veteran Posts Signs at Colleges Telling Whites to Be Great Again
2|1|Donald Trump Goes Full Rage-Monster on Hillary and Bill Clinton
2|5|"Everything Donald Trump Says About Syria Is Crazy, Wrong, or Both"
2|3|Donald Trump Invades Hillary Clintons Personal Space
2|4|Trump Cops to Not Paying Taxes in Second Presidential Debate
2|4|Latinos to the Rescuebut Whats in It for Us?
2|4|Hillary Clintons Journeyand Ours
2|4|Bitter Trump Runs Out of Energy
2|4|2016s Best Election Memes
2|3|Trumps Alt-Right Conspiracy Theorists Run Out of Magic Bullets
2|1|White Nationalists Swear They Wont Riot if Donald Trump Goes Down
2|1|50 Moments That Defined the 2016 Election Cycle
2|5|"Im Young, Black, and Male. I Live in Fear of a Trump Presidency."
2|4|Musicians Get Political: Campaign Concerts in 2016
2|1|2016 Election: Find Your Polling Place and Live Stream Election Results
2|2|North Carolina GOP Brags Racist Voter Suppression Is Workingand Theyre Right
2|2|What Did You Expect? Donald Trumps Final 48-Hour Hate-and-Lie-a-Thon.
2|3|Joe Bidenthe CloserIs on the Mound
2|5|Chaotic Midnight Rally Is Peak Trump
2|1|The Flat-Earth Set Helped Donald Trump Hijack the GOP and Crash It Into the Ground
2|4|Will New Hampshire Make Donald Trump a Winner Again?
2|3|Who the Hell Is Still Undecided Between Trump and Clinton?
2|2|I Was With Bernie Till the End; Now We All Must Vote Hillary
2|1|"Trump Ends His CampaignSurprise, Surpriseby Insulting Latinos"
2|1|Will Independent Voters Back Donald Trump or Hillary Clinton?
2|3|Hillary Clinton vs. The Huge Lie
2|3|Trump Claims Obama Screamed at Protester. Fact Check: Pants on Fire
2|4|LeBron James Tries to Save Clinton in Ohio
2|1|Donald Trumps Campaign Could Revive the Lost Art of Ticket-Splitting
2|1|Donald Trump Tantrums Over Hispanics Voting Legally in Nevada
2|1|Pastors to God: Make This Horrible Election End
2|1|FBI Chief Jim Comey Clears Hillary Clintonand Puts Himself in the Crosshairs
2|2|"The GOPs Anti-LGBT, Anti-Women Religious Freedom Law on Steroids"
2|4|Is Trumps Man Steve Bannon Too Shady to Handle Secrets?
2|2|48 Hours in Facebooks Unreality
2|4|"2016, Meet 1877: Trumps Ascendance Is Creepily Like the End of Reconstruction"
2|1|Mike Pence Once Mocked Transition Process He Now Leads
2|4|Trump Cant Legally Make New Staff Sign NDAsYet
2|4|U.S. Officials Fear Trump Is Playing Into Terrorists Hands
2|4|Texas Floats Radical New Abortion Laws
2|2|Paul Ryan Readies to Work With Enemy Steve Bannon
2|1|"Was Steve Bannon, Donald Trumps Attack Dog, Paid Illegally?"
2|4|Trumpkins Love It When You Cry
2|4|Keith Ellison Is a Muslimand the Man to Lead the Democrats Into the Future
2|3|Why Glenn Beck Really Hates Steve Bannon
2|1|Why Obama Is Taking the High Road on Trump
2|3|Shot in the Back at Standing Rock
2|1|Reports: Donald Trump Wants His Adult Kids to See Americas Most Carefully Kept Secrets
2|2|Farewell to the Irreplaceable Gwen Ifill
2|2|Donald Trump Tries to Delay Fraud Trial
2|1|Trump Backer Pushes for New CIA Enhanced Interrogation
2|5|Memes: Joe Biden Prepares for Donald Trumps Arrival to the White House
2|2|John Avlon on News Coverage During Trumps Presidency
2|2|Watch Live Stream: Obama Press Conference Before Final Foreign Trip
2|5|Obamas Imperial Presidency Now Is Trumps
2|4|Get Ready for the Worst Thanksgiving Ever
2|3|Is the First Muslim Elected to Congress the DNCs Answer to Donald Trumps Hate?
2|2|Nothing About President-Elect Donald Trumps America Is Normal
2|2|Donald Trumps Transition Team Wants to End Net Neutrality
2|3|Is a Muslim Registry Really Possible?
2|2|Kellyanne Conway: Its Sexist to Say Mitt Romney Attacks Are Going Rogue
2|5|Trump Team Backs Up Voter-Fraud Lie
2|1|"Ben Carson, Trumps HUD Pick, Once Called Fair Housing Communism"
2|1|"Zoe Kazan on Fighting Donald Trump, Living With Anorexia, and Her Relationship With Paul Dano"
2|4|"How Stars, Christians, and Hackers Could Avoid Climate Disaster Under Trump"
2|4|Amazons Moving New Ad Is a Total Repudiation of Trumpism
2|4|Donald Trumps False Cry-Baby Election Recount Tweet
2|2|The People Chose Hillary Clinton. Now We Need To Stop Donald Trump From Trashing Our Democracy.
2|3|Kellyanne Conway Escalates War on Mitt Romney
2|1|How I Grew With Obama in the White House
2|3|Already Happening: Media Normalization of Trumpism
2|1|Will Donald Trump's White House Be Ready to Handle the Campus Rape Debate?
2|1|A Biracial Woman Reflects on Building Bridges in the Time of Trump
2|4|Conservative Talk Radio Sees Golden Opportunity in Trump Administration
2|3|Obama Must Save the Courts to Save America From Trump
2|5|#NeverRomney Campaign Reopens GOP Wounds
2|5|A Better Way to Pick the Next President: The National Popular Vote Compact
2|2|Why Did Team Obama Try to Take Down Its NSA Chief?
2|3|"Steve Bannons Deep, Weird Adoration of Sarah Palin"
2|5|Today Show Awkwardly Ignores Trump Butlers Sinister Social Media History
2|1|Can Trump Really Deport Millions? Bet: He Wont
2|1|"It's Storytelling, Stupid: What Made Donald Trump Smarter Than Hillary Clinton"
2|4|"Sorry, Hillary Clinton Fans. Theres Zero Evidence of Election Hacking."
2|3|"What, Me Torture? Donald Trumps Week of Wild WTF Reversals"
2|1|Why Did Donald Trump Take Money From This Sketchy Ukrainian Oligarch?
2|4|"As Campaign Implodes, Donald Trump Says Hillary Clinton Is on Drugs"
2|1|When Was The Last Day You Didnt Think About Donald Trump?
2|5|"Donald Trump Abused His Power for Sex, Claims New Accuser"
2|5|Donald Trump Kept Calling Lil Jon an Uncle Tom on Celebrity Apprentice
2|4|How Powerful Men Get Away With It
2|1|GOP Mailer: Well Tell Your Neighbors If You Vote Democratic
2|1|How to Carve Your Own #Trumpkin Pumpkin
2|3|Clinton Camp: Roger Stone Knew About Wikileaks Email Hack
2|2|Sean Hannity Throws a Hail Mary for Donald Trump
2|5|Only Black Apprentice Winner: Trump Has Learned Nothing
2|4|Ivanka Trump Silent as Women Allege Donald Trump Inappropriately Touched Them
2|5|Trumps Speech: Dog Whistles to the Sovereign-Citizen Set
2|4|Emails: Apologies Are Hillarys Achilles Heel
2|1|"Donald Trump Called Deaf Apprentice Marlee Matlin Retarded, Three Staffers Say"
2|1|Michelle Obama vs. Donald Trump: Does Going High Matter to His Kamikaze Campaign?
2|5|"If Donald Trump Sued the New York Times or His Accusers, It Would Be a Suicide Mission "
2|2|Michelle Obama Obliterated Donald Trump Without Once Saying His Name
2|2|Trump Supporters: Women Are Liars and Deserve to Have Voting Rights Taken Away!
2|4|"Trump Dragged Hillary, and All of Us, Down"
2|5|Republican Governor of Oklahoma Says God Created Oil
2|4|"Watch: Erin Ryan on Trumps Long, Long, Gross History of Misogyny"
2|3|Team Hillary Was Obsessed With Jeb!
2|5|Donald Trumps Collapse Gives Gary Johnson an Opening
2|4|How Can the Trumps Possibly Understand Paid Family Leave?
2|1|"Utah Rejects Donald Trumps Advances, as Evan McMullin Emerges as the Conservative Alternative"
2|4|Kellyanne Conway Goes Head-to-Head with CNNs Brianna Keilar: Stop Taking Donald Trump Literally
2|4|"In Donald Trump, I See My Own Attacker"
2|3|"Amy Schumer, Meryl Streep and More Condemn Trumps Misogyny "
2|3|Sexual Assault Survivors Lead Trump Tower Protest Against Cheeto Voldemort
2|1|The Battleground State Voters Speak (Photos)
2|5|George Takei: An Open Letter to Americas Young Voters
2|3|"Yes, Im a Needy Latino, and Heres What I Need"
2|5|"The Women of America Thank You, Donald"
2|1|"Keep Spotlight on the Weak Little Republicans in Donald Trumps Big, Ugly Shadow"
2|5|"Where Afghan Voters Showed Heart, Donald Trump Shows His Tail"
2|3|"Kathleen Willey Is #ForeverTrump, Even if the Sex Assault Allegations Are True"
2|3|Apprentice Staffer Claims Gary Busey Groped Her. And Then Donald Trump Laughed.
2|4|Melania Trump Compares Donald to Teenage Boy on CNN
2|4|"Drudge, Limbaugh Fall for Twitter Joke About Postal Worker Destroying Trump Ballots"
2|3|Trump Wants a Clean Debate? LOL.
2|2|Obamas General Lied in Leaks Case
2|3|"FBI Staffer Felt Pressure to Declassify Hillary Email, Documents Say"
2|4|Paula Jones to Penthouse: The Right Used Me
2|3|"Father, Husbandand Proud, Pro-Hillary Feminist"
2|5|Democrats Worry About Hillary Clintons Ground Game
2|4|Donald Trumps Deplorables Wage a War on Muslims
2|4|Confessions of an Elector: Only 270 Voters Really Get To Decide Who Our Next President Will Be
2|2|Meet the Women Who Are Forever Trump
2|1|The Vigilante Faking WikiLeaks Docs to Dupe Trump Trolls
2|3|Did Qatar Really Pay $1 Million for Five Minutes With Bill Clinton?
2|5|Pence and Kaine Stuck Defending Toxic Campaigns on Sunday Shows
2|4|Falwell Jr. Deepens Rift With Anti-Trump Liberty U Students
2|2|Election Hackers Could Erase You
2|4|Hillary Clinton Encouraged Rich Bankers to Influence Politics
2|1|Donald Trumps Air Force One Math Doesnt Add Up
2|2|Mike Pence Gets Entangled in Pizzagate
2|3|"In New York, Heroes in Hijabs Face Trump-Loving Haters"
2|4|These Brave Souls Complained About Pussygate to the FCC
2|4|Cornell Belcher: The Real Racial Crisis Is Aversion
2|5|Donald Trumps Incredible Cabinet of Deplorables Takes Shape
2|2|Can Bipartisanship Exist in a Trump Era?
2|5|"#Pizzagate Is the Satanic Panic of Our Agebut This Time, the Presidents Men Believe It"
2|2|Trumps Al Gore Meeting Likely to Rankle His Rich Climate-Denying Donors
2|4|Fake News Purveyors and Trumps Conspiracy Theorists Have Real World Consequences
2|4|Red Cross Poll: Americans Warm to Torture and Indiscriminate Bombing
2|4|The Intra-Latino Rifts Revealed by the Electionand by Castro
2|4|How David Clarke Bridges Donald Trumps Gun Nuts and Vladimir Putins Kleptocrats
2|4|Trump Team Wants You to See the Iran Nuke Documents Obamas Kept From View
2|4|The French Ideologues Who Inspired the Alt-Right
2|3|"Yes, Trump Did Win More Counties Than Any Republican Since Reagan"
2|4|Trump Team Scrambles on Taiwan
2|1|Pizzagate Gunman Liked Alex Jones
2|4|SNL Goes Into the Woods to Search for Hillary Clinton: The Most Elusive Legend of All
2|3|"Trump Should Demand More of Cuba, But Keep the Opening in Place"
2|1|How the Left and Right Can Learn to Love Localism: The Constitutional Cure for polarization
2|1|SNL: Alec Baldwins Donald Trump Goes Twitter Crazy
2|1|How Donald Trumps Top Guy Steve Bannon Wrote a Hollywood Sex Scene Set in Outer Space
2|1|The Best Way to Stop Trump Is at the Local Level
2|3|"Donald Trump, Groper-In-Chief, Trafficks in Cut-Rate Souls"
2|4|Squabble Over Keith Ellison Reveals Dilemma for Democrats on Israel
2|3|"Four More Years of Corey Lewandowski, God Help Us"
2|1|"Cmon, Liberals, Give Your Trump-Voting Relatives Some Love on Thanksgiving"
2|5|Ben Carson Spokesman Says Donald Trump Has Asked Him to Run HUD
2|5|"Donald Trump Drags Media Into His Parallel, Paranoid Universe"
2|4|Hillary for Prison Crew Turns on Donald Trump
2|1|"Germans Watch, Aghast, as Trumps America Begins to Take Shape"
2|2|White Nationalist to Alt-Right Leader: Knock It Off! With the Nazi Stuff
2|1|Texas Republican Wants to Out LGBT Kids in School
2|4|Muslims at the Pentagon Brace for Trump Administration
2|1|Ben Carson: Nothing Hateful About Steve Bannon
2|5|Texas Jail Wont Give Immigrant Kids Crayons
2|3|Megyn Kelly Tears Into Trump and GOPs Lock Her Up Hypocrisy
2|5|Stephen Colbert Addresses Trump University Grads: Youve Been Conned by a Master
2|1|Dems Cant Afford to Say Yes to Trump
2|4|Democratic Rep. Tulsi Gabbard Goes to Trump Tower to Defend Assad
2|1|Kobach Accidentally Reveals Anti-Muslim Plan
2|4|Zionist Gala Toasts Donald Trumps Divine Election Victory
2|1|Christies Transition to No Mans Land?
2|3|Ive Been Making Viral Fake News for the Last Six Months. Its Way Too Easy to Dupe the Right on the Internet.
2|3|Trumps Win Was About Culture. Understand This.
2|4|World Leaders Gather to Worry About Trump
2|2|Democrats Answer Is Always the Same: Move More Left
2|4|Liberals Keep Falling for Donald Trumps Tricks
2|3|Trump Team Defends Controversial Appointments on Sunday Shows
2|4|Heres How Donald Trump Could End Americas New Feudalism
2|3|Black Lives Matter Wont to Trump DOJ
2|5|Donald Trump Deletes Follow Up Attack on Hamilton
2|4|Did NSA Chief Run to Trump to Save His Job?
2|5|"In 1992, Bill Clinton Launched a Manhattan Project to Win Voters Trust. Now Its Hillarys Turn."
2|3|Meet Muslim Refugees Turned American Political Candidates Ilhan Omar and Ahmad Rafah
2|1|She Put Her Late-Term Abortion on Facebook to Prove Donald Trump Wrong
2|5|Trump Finally Pissed Off the Wrong Women. All of Them.
2|4|Donald Trump Calls In to Rush Limbaughs Paranoia Bubble
2|4|Colin Powell Picks Hillary Clinton Over National Disgrace Donald Trump
2|3|Hillary Clinton Private Email Created Internal Rift
2|5|Cant Wait for It to Be Over? Dont Kid Yourself
2|4|A New Target for Old Spies: Congress
2|3|"Democrat Assembles Gun, Flips Script"
2|4|Obama Fires Back at Trumps Mean Tweets on Jimmy Kimmel Live
2|3|"Sean Hannity Gives Platform to Man Who Claims Hillary Is Evil, Bisexual Secret Sex Freak"
2|2|Donald Trumps $100 Million Money Bomb Is a Dud
2|2|Trump TVs First Nightly News Report Was Unwatchableand Addictive
2|1|Samantha Bee Gets Nasty for Hillary: Trump Confused Abortions With Bear Attacks
2|4|Sheldon Adelsons Newspaper Goes All-In for Donald Trump
2|3|Inside Donald Trumps One-Stop Parties: Attendees Recall Cocaine and Very Young Models
2|5|How Katy Perry Checkmated Taylor Swift
2|2|WE FOUND THE PLAN: Donald Trumps Axis of Tinfoil Hats Duped Again
2|5|"Yes, America, Hillary Clinton Is a Chicago Cubs Fan"
2|5|How Dan Rather Became the Only Good Newsman on Facebook
2|4|Do Celebrity Endorsements Really Matter?
2|3|Donald Trump Made Apprentice Staff Work Through Hurricane Sandy Chaos
2|2|Were the Clinton Campaign Emails Leaked by WikiLeaks Doctored?
2|3|Donald Trump Campaign Manager Kellyanne Conways Super-Sad Sunday
2|1|Bill Murray Could Teach Hillary Clinton a Lot
2|2|Donald Trump Goes Through the Looking Glass
2|4|The Ancient Greeks Warned Us About Trump
2|1|Donald Trump Is A Professional Dominatrix and the GOP Cant Get Enough Of His Humiliation
2|4|"With Russia Probe, Obama Finally Hacks the Hearts of Defense Hawks "
2|3|"NBC Dumped Donald Trump Over His Bigotry, but Now Theyre Back Together"
2|3|"Trumps Labor Secretary Pick, Andrew Puzder, Is Swamped in His Own Workplace Lawsuits"
2|2|Thiel-Backed PAC May Have Made Illegal Payments to Bannon Company
2|1|"Hey, White Working Class, Donald Trump Is Already Screwing You Over"
2|2|Donald J. Trumps Gangster Capitalism
2|3|Unions See Through Donald Trumps Sham After He Attacks Chuck Jones
2|5|"In Andy Puzder, Donald Trump Makes the Worst Possible Pick for Secretary of Labor"
2|1|How Donald Trumps Presidential Tweets Will Quash Dissentand Maybe Worse
2|5|Is the Department of Homeland Security Too Tough for a General to Manage?
2|3|Ivanka Trumps White House Bind
2|4|"Steve Bannons Biggest Fan Was Jesus Himself, Jim Caviezel"
2|1|Everyones a Target to the NSA. Heres How the Courts Can Stop It.
2|1|Donald Trumps Huge Conflict of Interest in Turkey
2|2|Inside the Chinese Factory Making Ivanka Trumps Shoes
2|3|Conservative Group Keeps Up Fight to End Same-Day Registration Used by Many Black Voters
2|1|"Scott Pruitt, Trumps Climate-Denying EPA Pick, Is Worse Than You Think"
2|3|Seth Meyers to Media: Time to Retire Alt-Right and Just Say Nazis
2|4|Donald Trump Supports Immigration Amnestyfor Now
2|1|Watch Franklin D. Roosevelts Day of Infamy Speech After Pearl Harbor Attacks
2|5|We Must Fight the Most Anti-Muslim Administration Ever
2|4|What Democrats Can Learn From Hillary Clintons Tragedy
2|5|"Ohios Insane Guns Everywhere Bill Covers Airports, Childcare Centers, and Even Police Stations"
2|4|"Pat Buchanan Celebrates Donald Trumps Win, Has the Last Laugh"
2|1|Joe Biden to Stephen Colbert: I Dont Plan on Running in 2020 but Never Say Never
2|4|"White Nationalists and Nazi-Saluting Tila Tequila Toast Emperor Trump in Washington, DC"
2|3|Donald Trumps First Feud as President-Elect Is With Broadway Actors
2|4|Trump Attorney General Pick Jeff Sessions Argued For A Religious Test To Ban Muslims
2|5|The Last of the Great Old-School New York Trial Lawyers
2|3|"Donald Trump Is the First Brand President, and Thats Dangerous"
2|5|Mad Dog Mattis Front Runner for DOD
2|1|Donald Never Settle Trump Settles Trump University Fraud Lawsuit for $25 Million
2|4|"Trumps Chief Strategist Steve Bannon: Im a Nationalist, Totally Not Racist!"
2|4|"Gen. Mike Flynns Office Told Women to Wear Makeup, Heels, and Skirts"
2|5|The Tea Party Now Controls the Drones: Firebrand Congressman Mike Pompeo Tapped for CIA Chief
2|4|"With Jeff Sessions, Donald Trump Begins Dismantling Barack Obamas Justice Department"
2|2|"Donald Trump Puts the White Back in White House, Taps Jeff Sessions For Attorney General"
2|4|Women Hit the Gym Before Trump Gets In
2|4|Erica Lafferty Lost Her Mother in Sandy Hook. Trumps Ties to Truther Alex Jones Disgust Her.
2|5|Why Does This D.A. Let Accused Violent Felons Walk Free?
2|4|How Dems Should Oppose President Trump
2|1|"The Task Now for Conservatives: Hope for the Best, Assume the Worst, Rebuild Our Movement"
2|2|"Dems Launch First Strike on Trumps Top Gun, Lt. Gen. Michael Flynn"
2|3|Vladimir Putin Knows More About Donald Trumps Plans Than U.S. Officials Do
2|3|Could This Man Be Donald Trumps Future Secretary of Outsourcing?
2|2|How Pro-Trump Twitter Bots Spread Fake News
2|2|Can Trumps Hair Survive Inauguration Day?
2|5|"Trumps Chief Strategist Steve Bannon Is Scared for His Job, Playing Nice With Capitol Hill"
2|1|Democrats Dig Deep After Being Trumpd
2|2|President-Elect Donald Trump Gets to Work Betraying His Backers
2|3|Americas Enemies Cheer Donald Trumps Bigoted Transition Team
2|2|"Banned Alt-Right Twitter Users Flee to Invite-Only, Press-Free Safe Space"
2|2|The Ancient Greeks Warned Us About Trump
2|3|Donald Trump Is A Professional Dominatrix and the GOP Cant Get Enough Of His Humiliation
2|3|"With Russia Probe, Obama Finally Hacks the Hearts of Defense Hawks "
2|5|"NBC Dumped Donald Trump Over His Bigotry, but Now Theyre Back Together"
2|3|"Trumps Labor Secretary Pick, Andrew Puzder, Is Swamped in His Own Workplace Lawsuits"
2|2|Thiel-Backed PAC May Have Made Illegal Payments to Bannon Company
2|1|"Hey, White Working Class, Donald Trump Is Already Screwing You Over"
2|5|Donald J. Trumps Gangster Capitalism
2|5|Unions See Through Donald Trumps Sham After He Attacks Chuck Jones
2|2|"In Andy Puzder, Donald Trump Makes the Worst Possible Pick for Secretary of Labor"
2|5|How Donald Trumps Presidential Tweets Will Quash Dissentand Maybe Worse
2|5|Is the Department of Homeland Security Too Tough for a General to Manage?
2|1|Ivanka Trumps White House Bind
2|1|"Steve Bannons Biggest Fan Was Jesus Himself, Jim Caviezel"
2|3|Everyones a Target to the NSA. Heres How the Courts Can Stop It.
2|1|Donald Trumps Huge Conflict of Interest in Turkey
2|3|Inside the Chinese Factory Making Ivanka Trumps Shoes
2|3|Conservative Group Keeps Up Fight to End Same-Day Registration Used by Many Black Voters
2|5|"Scott Pruitt, Trumps Climate-Denying EPA Pick, Is Worse Than You Think"
2|5|Seth Meyers to Media: Time to Retire Alt-Right and Just Say Nazis
2|1|Donald Trump Supports Immigration Amnestyfor Now
2|1|Watch Franklin D. Roosevelts Day of Infamy Speech After Pearl Harbor Attacks
2|1|We Must Fight the Most Anti-Muslim Administration Ever
2|1|What Democrats Can Learn From Hillary Clintons Tragedy
2|2|"Ohios Insane Guns Everywhere Bill Covers Airports, Childcare Centers, and Even Police Stations"
2|1|"Pat Buchanan Celebrates Donald Trumps Win, Has the Last Laugh"
2|1|Joe Biden to Stephen Colbert: I Dont Plan on Running in 2020 but Never Say Never
2|4|How Donald Trump Wins Even When He Loses
2|5|Latinos for Trump? Like Chickens for Colonel Sanders
2|5|Merrick Garlands Lonely Road to Purgatory
2|3|Is a Cryptic Tweet by Marla Maples a Clue as to Source Behind Trump Tax Leak?
2|3|"Rudy Giuliani Gets It Wrong on Hillary Clintons Feminism, New York Times Coverage"
2|4|What News Needs to Do Now
2|3|Donald Trump Backers Say Trump Is Smart For Avoiding Taxes
2|2|Donald Trump Cant Shut Down New York Times Tax-Leak Showing He Lost Nearly $1 Billion in 1995
2|3|"Despite Donald Trump, Many Bernie Sanders Supporters Wont Forgive Hillary Clinton"
2|2|When Donald Trump Tried to Crash Chelsea Clintons Wedding
2|2|Did Hillary Insult Sanderistas as Basement Dwellers? NoJust the Opposite
2|2|"In Deposition, Donald Trump Unrepentant About Mexican Remarks"
2|4|Eric Trump Charity Spent $880K at Family-Owned Golf Resorts
2|2|Sex Tapes Didnt Used to Disgust Donald Trump
2|1|Which Group of People Does Trump Hate the Most?
2|2|"Trump Slut-Shames Alicia Machado, Urges People to Watch Nonexistent Sex Tape"
2|2|Harvey Keitel: Real Tough Guys Dont Vote Trump
2|5|GOP Blocks Probes Into Trump-Russia Ties
2|1|Donald Trump Charity Gave to Jenny McCarthys Anti-Vaxx Crusade
2|5|Democrat-Backed Beauty Queens to Troll GOP
2|4|"Get Angry: Breitbart Crosses Another Line, Calls Writer Polish, Jewish, American Elitist"
2|5|Why No One Should Vote for Gary Johnson or Jill Stein
2|4|Lawsuit: Donald Trump Is the Illuminati King
2|4|Is Donald Trump Private Prison Companies Last Hope?
2|1|"Obama on Trump Claiming America Is Weaker Now: Blah Blah, Its Nonsense"
2|5|"The Race to Smear Miss Universe Alicia Machado as a Bloodthirsty, Drug Lord-Loving Porn Star"
2|1|Trump Mocks Clinton for Her 9/11 Memorial Medical Episode
2|2|Why Hillary Clinton Is Likeand UnlikeJackie Robinson
2|3|Right Wing Conspiracies Swirl After Clinton Email Revelation
2|3|"Hillary Haunted By Big, Stupid Weiners"
2|3|Anthony Weiners Sexts Steer FBI Back to Hillary Clinton
2|5|"This Conservative News Site Trended on Facebook, Showed Up on Fox News... and Duped the World"
2|4|"Did Big Business Cozy Up to Bill Clinton, Inc. to Get to Hillary?"
2|3|Will Donald Trumps Failure Take Out Reince Priebus?
2|5|Michael Moore to Megyn Kelly: Trump Totally Mischaracterized TrumpLand Film
2|5|Even Trumps Kids Havent Donated to His Campaign
2|3|"We Shouldve Seen DNC Hacks Coming, Says Former NatSec Official"
2|5|Khizr Khan Returns to Finish Off Donald Trump
2|3|"Ted Cruz Wants to Block a Supreme Court Justice Forever, Start Constitutional Crisis"
2|1|Even Michael Moore Is Fed Up With the Bernie-Or-Bust Nuts
2|5|A Trump Victory? The British Have Seen This Kind of Horror Show
2|2|Donald Trumps March to Loserland Is Only Beginning
2|2|The U.S. Cyberwar With Russia Will Wait for President Hillary Clinton
2|3|The Democrat Who Might Keep Georgia Red
2|4|Meet the Professor Whose Primary Model Says Trump Has 87% Chance to Win
2|4|"Stephen Colbert to Newt Gingrich: Grabbing a Woman is Not Sex, Its Assault"
2|4|Married Donald Trump Kept Proposing to Celebrity Apprentice and Playboy Model Brande Roderick
2|2|The Power of Megyn Kellys FeminismEven if She Doesnt Call It That
2|5|Jill Steins Ideology Says One ThingHer Investment Portfolio Says Another
2|4|"Hillary Clintons Team Knew Her Private Server Was Going to Be a Scandal, New Emails Show"
2|5|"Trumps Already Part of the D.C. Swamp, Whether He Knows It or Not"
2|5|Victoria Gotti: King Con Donald Trump Should Take His Pig Self Back to Dump Tower
2|5|Model Paula Patrice: Trump Shoved His Tongue Down My Throat
2|3|"Inside Trumps Runner-Up White House: A Glitzy, Empty Hotel on Pennsylvania Ave."
2|2|All of Donald Trumps Accusers: A Timeline of Every Alleged Grope and Assault
2|1|Donald J. Trumps Concession Speech
2|4|Inside Team Trumps Vegas Afterparty
2|3|Donald Trumps Final Insult to American Democracy
2|2|"Donald Trump Hits Nasty Hillary Clinton, Democracy"
2|2|The Supreme Court Is a Winning Debate Issue for Donald Trump
2|2|Donald Trumps Abortion Fanfic
2|5|Donald Trump: I Might Not Accept Election Results
2|2|Donald Trump Pledges to Deport Bad Hombres and Praises... Obama?
2|3|Trump: I Didnt Apologize to Melania
2|2|Hillary Clinton Slams Donald Trump as Vladimir Putins Puppet
2|4|"Donald Trump: Hillary Clinton Will Take Guns, Babies"
2|3|Mark Cuban and Rudy Giuliani Go at It on CNN Before Third Debate
2|1|"Ivanka Trump and Anita Hill: No Catfight, Had a Very Nice, Quick Chat"
2|2|"National Enquirers New Bombshell: Hillarys an Evil, Bisexual Secret Sex Freak"
2|4|Trump Invites Obama Bro as Birther Bait
2|4|Your Handy Guide to Translating Trump in the Debate
2|4|Obamas Charisma May Not Be Enough to Save Renzi
2|2|Will WikiLeaks Catch Up With Hillary Clinton Tonight?
2|5|The Drug Trafficker Donald Trump Risked His Casino Empire to Protect
2|2|The Unforgivables: Trumps Top Collaborators
2|5|How to Watch the Final 2016 Presidential Debate Live Stream Online
2|3|A Trump-Pence Presidency Would Be a Disaster for LGBT People
2|2|Laura Benantis Melania Trump Endorses Hillary on Colbert
2|5|Student: Jerry Falwell Jr. Axed Anti-Trump Story from Liberty Universitys School Newspaper
2|4|The Mystery of the Artist Behind Naked Hillary
2|5|Donald Trump Isnt Who We Are and He Doesnt Care About You
2|4|"Donald Trumps Huge, Horrible Halloween Nightmare"
2|5|The Hell of Being Huma Abedin
2|2|"No, Hillary Clintons Emails Arent Like Watergate. Nothing Is."
2|4|North Carolina GOP Senator Jokes About Shooting Hillary Clinton
2|2|Print Your Precinct Before the Web Gets Hacked
2|2|Peter Thiel Hits Hawkish Dems for Undeclared Wars While Aiming to Cash In on Military Contracts
2|3|White Nationalist William Johnsons Pro-Trump Robocall: Evan McMullin Is Gay
2|1|The Trump Campaign Is Allegedly Dodging $767k Polling Bill
2|5|The Scariest Political Ads of 2016
2|4|"James Comey Puts Thumb on Scale, Brings Third World-Style Election to America"
2|1|Troll Daddies Roger Stone and Chuck Johnson Fight Over Bill Clintons Son
2|2|Right-Wing Group Citizens United Again May Have Tried to Trick the Elderly Into Giving It Cash
2|4|Top Dems to FBI: Spill on Trumps Russia Ties
2|4|Imagine if James Comey Had Kept QuietThen Thank Him for Speaking Up
2|5|"Will Zombie Voters Tip the Scales in 2016? No, but They Have in the Past"
2|4|Everything You Need To Know About The Latest Hillary Clinton Email Controversy
2|4|Clinton Campaign Asks Ex-Prosecutors to Criticize FBI Director James Comey
2|3|Presidential Campaigns Demand Answers From FBI on Sunday Shows
2|3|Why Do Men Treat Megyn Kelly Like A Malfunctioning Westworld Host?
2|5|Donald Trump in 1990: Adultery is Not a Sin
2|2|"Vladimir Putins Campaign to Seduce, Subvert and Screw Over Western DemocraciesIncluding Ours"
2|3|What Holden Caulfield Could Teach Trump
2|1|"James Comey Stands Tall, and Alone, in a Tight Corner in Clinton Email Mess"
2|1|Republicans Weaponize James Comeys FBI To Kneecap Hillary Clinton
2|5|Huma Abedin Swore Under Oath She Gave Up All the Devices With State Dept. Emails
2|5|Oregon Verdict Gives Anti-Government Movement Hope
2|1|The Ultimate 11th Hour Clinton Scandal
2|1|Mexican Billionaire Tried to Buy U.S. Election
2|5|Military Brass Not Impressed by Trump
2|4|"Samantha Bee Mocks Hillarys Health Scare, Proves Basket of Deplorables Right"
2|4|Trump Family Donated to D.C. Politicians Who Helped Pave Way for Trump Hotel
2|1|"Donald Trumps New D.C. Hotel Is Fancy, Expensive, and Probably Doomed"
2|5|Watch: Michael Daly Calls Out Trumps 9/11 Lies
2|1|Hillary Clinton Isnt Sick. You Are.
2|1|Obamas 9/11 Veto Threat Jams Up Hillary Clinton
2|3|Trump Camps Pepe Meme First Appeared on White Supremacist Sites
2|5|Hillary Clintons Body Double Speaks!
2|5|11 Private Security Firms Guarding Donald Trump
2|5|Zika Exploded While Congress Went on Vacation
2|2|Hillary Clinton Overheated. Dont Hyperventilate.
2|2|Officials: 15 Years After 9/11 And We Arent Much Safer
2|3|Hillary Clinton Appears to Faint at 9/11 Ceremony
2|5|Time To Take a Silicon Valley Hammer To the Two-Party Duopoly
2|1|Team Trump Goes Full Attack Mode over Hillarys Basket of Deplorables
2|1|Donald Trumps Most Despicable Tweets About 9/11
2|3|Black Millennials: Dont Help Donald Trump
2|1|"Alt-Right Leaders: We Arent Racist, We Just Hate Jews"
2|1|"Donald Trump, Jon Voight Vow to Save Christianity"
2|3|Facebook Promotes Poll of Doctors Who Say Hillary Clinton Is a Flaming Sociopath
2|1|Watch: Gary Johnson on Jeopardy
2|2|"Donald Trump, Vladimir Putin and the Thug Theory of Leadership"
2|4|Five Hard Questions About Donald Trumps Pay-for-Play Arrangement With Pam Bondi
2|2|"15 Years of Donald Trumps 9/11 Lies, Insults, and Slights"
2|1|The Daily Shows Trevor Noah Tears Into Matt Lauer: What the F*ck Was He Doing?
3|5|"Trump fills homeland security, environment, China ambassador jobs"
3|5|Senate joins House to pass sweeping new health bill
3|5|Koch Industries takes aim at House Republican tax reform plan
3|5|"One-time Trump adviser Page to meet businessmen, politicians in Moscow: RIA"
3|5|Trump says union head who accused him of lying has 'done a terrible job'
3|5|U.S. judge reverses order requiring vote recount in Michigan
3|5|Cuba wants to sign accords with U.S. before Obama exit: officials
3|5|Factbox: Trump fills top jobs for his administration
3|5|China's CIC head says Trump to be careful in considering tariffs when in office
3|5|U.S. Republicans quibble over effective date of Obamacare repeal
3|5|Ukrainian aircraft maker tweets Air Force One offer to Trump
3|5|Time magazine names U.S. President-elect Trump Person of the Year
3|5|Reports Branstad picked as ambassador to China inaccurate: Branstad spokesman
3|5|Nobel laureate says Trump policies may lead to budget problems
3|5|Ex-U.S. Attorney Yang being considered for SEC chair: source
3|5|Trump lays out non-interventionist U.S. military policy
3|5|Obama defends record on terrorism in national security speech
3|5|U.S. spending bill far short of sum sought for Trump NYC security
3|5|"U.S., state courts issue conflicting rulings on Michigan vote recount"
3|5|Trump on Boeing's Air Force One contract: 'Cancel order!'
3|5|Merkel silent on fourth term despite glowing words from Obama
3|5|Trump 'unbelievably impressed' with Sen. Sessions: statement
3|5|Obama says will continue to try to affect change in Syria
3|5|Obama says will come back to Germany for Oktoberfest
3|5|Merkel: I will announce decision on fourth term at right time
3|5|Obama says hopes Trump can stand up to Russia when needed
3|5|House Republicans pursue short-term government funding bill
3|5|U.S. Mideast intelligence analysts felt superiors distorted findings
3|5|Sanders to build base outside of Washington in new Democratic post
3|5|U.S. spy chief says expects Russia plans to expand presence in Syria base
3|5|"For Trump, challenging an election loss would be tough"
3|5|Trump says he will accept election result - if he wins
3|5|Polling safeguards stepped up after Trump's 'rigged election' claim
3|5|Trump supporters tricked into buying beers at Mexico City booze-up
3|5|Trump's war chest one of smallest in recent presidential campaigns
3|5|U.S. vote authorities warned to be alert to Russian hacks faking fraud: officials
3|5|Long-time Arizona sheriff Arpaio trails in re-election bid: poll
3|5|Rigged elections? Nasty woman? Trump's scorched earth tactics have little upside
3|5|"In U.S. battle of election T-shirts, 'Nasty Woman' rules"
3|5|"Final Trump-Clinton debate draws nearly 72 million viewers, third largest ever"
3|5|Trump: Obama should be investigated over Clinton email server
3|5|Highlights from Reuters' exclusive interview with Donald Trump
3|5|"Clinton warns against complacency, Trump warns of World War Three"
3|5|Exclusive: U.S. House to vote on Iran Sanctions Act renewal as soon as November
3|5|White House weighing whether greenhouse gas deal needs Senate approval
3|5|"Trump asks team to trim back transition efforts, focus on race: sources"
3|5|White House urges ban on non-compete agreements for many workers
3|5|Yahoo scanning order unlikely to be made public: sources
3|5|Former Secretary of State Powell will vote for Clinton: Newsday
3|5|U.S. says troubled by reports of another U.S. citizen jailed by Iran
3|5|Trump to meet with retired U.S. Admiral Stavridis on Thursday
3|5|"Trump to intervene to keep U.S. jobs at home on 'day-by-day' basis, Pence says"
3|5|Former astronaut Buzz Aldrin to stay in New Zealand until lungs clear
3|5|"U.S. Navy, shipbuilders ready for Trump's expansion plan"
3|5|Trump conversation with Taiwan president a 'courtesy call': Pence
3|5|Iran vows 'firm response' unless Obama stops sanctions renewal
3|5|Green Party's Stein to pursue Pennsylvania recount petition in federal court
3|5|Trump attends 'Villains and Heroes' costume party dressed as...himself
3|5|Australian PM says he's confident Trump won't pull out of U.S. refugee deal
3|5|China lodges protest after Trump call with Taiwan president
3|5|Iran says Trump should stay committed to the nuclear deal: Tasnim news
3|5|'Go to hell!' A divided America struggles to heal after ugly election
3|5|Germany's Gabriel calls Trump 'pioneer of a new authoritarian movement'
3|5|"Renzi congratulates Trump, says Italy friendship with U.S. solid"
3|5|Greece's Golden Dawn says Trump win a victory for ethnically 'clean' states
3|5|Trump victory may create new tension between U.S. and Islam: Indonesia clerical body
3|5|Outlines of Trump foreign policy are largely uncharted territory
3|5|"With Trump win, Republican chairman Priebus emerges as key adviser"
3|5|"Fed up with Washington, Trump's 'deplorables' shake up the elite"
3|5|EU parliament head hopes for 'rational cooperation' with Trump
3|5|Obama asks for $11.6 billion more in supplemental defense budget
3|5|Mexico President Pena Nieto says optimistic about U.S. relationship
3|5|Trump strongly considering naming campaign chief Bannon as chief of staff: CNN
3|5|Judge tells Trump University litigants they would be wise to settle
3|5|"Bannon, Priebus top candidates for White House chief of staff: NY Times"
3|5|Trump considering Rep. Hensarling for Treasury secretary: WSJ
3|5|"Trump, after meeting Ryan, says will move fast on healthcare, immigration"
3|5|"Trump says discussed immigration, healthcare and jobs in Senate meeting"
3|5|Glitch briefly removes 'Muslim ban' proposal from Trump website
3|5|Ex-congressman indicted on 24 counts in spending scandal
3|5|Trump gets one presidential intelligence briefing a week: sources
3|5|Commentary: Trump can't fight Islamic State without wading into Syria's war
3|5|Democrats plot uphill fight against some Trump nominations
3|5|U.S. Congress passes $618.7 billion annual defense bill
3|5|Trump's EPA pick may struggle to dismantle Obama's environmental legacy
3|5|"Under Trump, Congress likely to pull plug on medical device tax"
3|5|Guatemalans burn Trump effigies to scatter evil spirits
3|5|Factbox: U.S. labor secretary nominee's book lays out his job creation theory
3|5|Figures show Trump spent $66 million of his own cash on election campaign
3|5|Trump says U.S.-China relationship must improve
3|5|Turkish foreign minister says to strengthen U.S. ties after Trump victory
3|5|EU's Mogherini says EU-U.S. ties deeper than any change in politics
3|5|EU's Schulz says working with Trump will be 'harder'
3|5|Trump rewrote political playbook in successful White House bid
3|5|"Trump's chance of victory skyrockets on betting exchanges, online market"
3|5|U.S. voters want leader to end advantage of rich and powerful: Reuters/Ipsos poll
3|5|Colorado voters reject measure to create universal healthcare
3|5|Republican Speaker Ryan re-elected to U.S. House from Wisconsin
3|5|"U.S. election largely peaceful, despite intimidation, glitches"
3|5|Voting extended in North Carolina but not in Colorado after court requests
3|5|"Amid scandal, bluster and insults, Trump closes in on White House"
3|5|Final reckoning approaches for Obama's high court nominee
3|5|Clinton leads Trump 48-43 percent in Washington Post-ABC tracking poll
3|5|'You're fired' - Trump effigy feels the heat on UK bonfire night
3|5|Secret Service says no weapon was found in Trump incident
3|5|Trump hustled off stage in Nevada by security agents
3|5|"Dependent on migrant dollars, rural Mexico prays for Trump defeat"
3|5|Arizona may enforce ballot collection law: Supreme Court order
3|5|"Clinton, Trump clash over economy in final campaign stretch"
3|5|"Fate of Obama legacy initiatives in hands of courts, successor"
3|5|"Clinton leads Trump by 6 points, same as before FBI announcement: Reuters/Ipsos"
3|5|Wedge issue: Texas golf range offers Clinton and Trump targets
3|5|Appeals court revives challenge to Arizona voting law
3|5|Trump raised $100 million in 'small-dollar' donations in October
3|5|Ku Klux Klan newspaper declares support for Trump
3|5|Trump's campaign should be fair game in Trump University trial: lawyers
3|5|"Bill Clinton, Tim Kaine cancel Iowa event after police shooting"
3|5|Gun control groups spend millions on state ballot initiatives
3|5|Clinton camp says FBI should say what it knows about Trump's Russia ties
3|5|Hillary Clinton: Wall Street's favorite enemy
3|5|Russia intervened to help Trump win election: intelligence officials
3|5|Trump to name Exxon CEO Tillerson secretary of state: NBC NEWS
3|5|Exxon CEO is now Trump's secretary of state favorite - transition official
3|5|"Senate passes funding bill, Obama signs into law"
3|5|U.S. slated to sell $375 million of emergency reserve oil this winter
3|5|Wisconsin judge rejects bid to stop election recount
3|5|US Senate passes bill to fund government through April
3|5|Legislation to fund US gov't through April clears procedural hurdle in Senate
3|5|Romney niece McDaniel is favorite to head Republican Party
3|5|U.S. allies caution Trump on Syria strategy
3|5|Democrats sue Trump for alleged voter intimidation in four states
3|5|Trump raises specter of crisis if Clinton wins the White House
3|5|Tech billionaire Thiel says Trump movement 'not going away'
3|5|"CNN, Brazile part ways amid renewed WikiLeaks controversy"
3|5|U.S. attorney general did not order FBI to withhold Clinton-related emails: source
3|5|White House says FBI director not trying to influence election
3|5|State Department says FBI has not approached it in renewed email probe
3|5|Clinton says 'there is no case here' in FBI email investigation
3|5|Got bank? Election could create flood of marijuana cash with no place to go
3|5|Backers of Paris climate pact play down Trump threat to deal as election looms
3|5|UKIP's Farage: I can help UK build ties with Trump
3|5|Trump says Brexiteer Farage would be a good British ambassador to U.S.
3|5|"Trump's NAFTA revamp would require concessions, may borrow from TPP"
3|5|"Trump foreign policies could hurt, help his business empire"
3|5|"Trump outlines plans for first day in office, meets with Cabinet hopefuls"
3|5|Trump says will quit Pacific trade deal on day one of presidency
3|5|Trump picks regulation opponents to lead FCC transition
3|5|"In weekend of deliberation, Mattis favored for Trump Pentagon chief"
3|5|"Trump's Interior Department shortlist vexes employees, green groups"
3|5|Factbox: Contenders for key jobs in Trump's administration
3|5|"Contenders, picks for key jobs in Trump's administration"
3|5|"Trump, Pence to meet with former BB&T; CEO Allison, others on Monday"
3|5|Trump's shifting positions since U.S. election win
3|5|"More company climate votes ahead, as Trump may loosen energy rules"
3|5|Trump will pursue 'regional hegemony' in South China Sea: Chinese academics
3|5|Trump keeps politics on his Thanksgiving menu
3|5|U.N. envoy sees continued U.S. work to end Syria war
3|5|"In India's Punjab, Haley relatives cheer appointment as UN envoy"
3|5|Green Party raises $3.5 million for presidential vote recounts
3|5|Germany's Seehofer invites Trump to Bavaria: source
3|5|Elton John denies he will play at Trump inauguration
3|5|Big banks' relationship with Dodd-Frank: it's complicated
3|5|South Carolina Governor Haley accepts Trump's U.N. offer: NBC
3|5|Mexican cement maker ready to help Trump build border wall
3|5|"Carson talks with Trump team, says he can make 'inner cities great'"
3|5|"Greek PM Tsipras, Trump talk about cooperation, security"
3|5|Iran warns of retaliation if U.S. breaches nuclear deal
3|5|Judge blocks Obama rule extending overtime pay to 4.2 million U.S. workers
3|5|Democrats search for answers to stem a spreading Republican tide
3|5|Illinois fix to unpaid bills may end up as financial time bomb
3|5|Trump says to stop visa abuses that undermine U.S. workers
3|5|Oil drilling advocate to be Trump pick for Interior Department
3|5|Coal CEO pressing Trump to speak up for miners' benefits
3|5|Obama orders review of 2016 election cyber attacks
3|5|Trump picks opponent of higher minimum wage for Labor Department
3|5|Contenders for senior jobs in Trump's administration
3|5|Factbox: Trump fills top jobs for his administration
3|5|Trump's threats chill corporate investment plans in Mexico
3|5|"Bolton says Trump moves could signal 'different,' tougher, China line"
3|5|"Trump, Scotland's Sturgeon spoke briefly on Friday: statement"
3|5|Voters illegally removed from Ohio rolls may cast provisional ballots: judge
3|5|"Before debate, protesters build 'wall of taco trucks' outside Trump hotel"
3|5|North Carolina offers reward in arson at local Republican office
3|5|"Rocky politics, slow growth loom as Obama, Italy's Renzi meet"
3|5|Trump's appeal for poll monitors draws tepid response from some supporters
3|5|"Trump? Clinton? Many young Americans prefer giant meteor, poll finds"
3|5|Kremlin says Putin ready to welcome any U.S. candidate keen to mend ties
3|5|Obama tells Trump to 'stop whining' over rigged election claims
3|5|U.S. civil rights groups to fan out on Nov. 8 to fight voter intimidation
3|5|Michael Moore to release anti-Trump film as celebs step up Clinton support
3|5|North Carolina governor requests vote recount in tight race
3|5|"Trump sinks Asia trade pact, opening the way for China to lead"
3|5|Chinese official optimistic about US trade amid Trump uncertainty
3|5|"Italy to push Iran trade ties, undaunted by Trump"
3|5|Obama's not-so-secret admirer: Donald Trump
3|5|Peru proposes talks to save TPP after Trump firms up opposition
3|5|Trumps foundation says it violated 'self-dealing' ban: IRS forms
3|5|Trump condemns alt-right gathering in Washington: New York Times
3|5|"Mexico sees trade deals in TPP leftovers, flags China opportunity"
3|5|Trump says keeping 'open mind' on climate change: New York Times
3|5|Obama says not worried about being last Democratic U.S. leader for a while
3|5|Trudeau looks forward to welcoming Trump to Canada
3|5|"New York's Cuomo unveils rights initiative, says election spawned 'social crisis'"
3|5|Trump team promises to address ethics concerns on businesses
3|5|Pence not offended by comments to him at 'Hamilton' show
3|5|Trump to hold series of meetings as he assembles new administration
3|5|Romney under 'active consideration' for Secretary of State: Pence
3|5|Romney in mix with others for secretary of state: Trump adviser
3|5|Radio host Ingraham says she's being considered for White House post
3|5|Trump confirms he is considering Mattis for U.S. defense post
3|5|U.S. panel urges probe on whether China weakening U.S. militarily
3|5|A post-Trump SEC could shake up current policy
3|5|"Obama, on last trip to Europe, warns against nationalism, populism"
3|5|"House reauthorizes Iran sanctions bill, sets Syria sanctions"
3|5|Trump transition clears first paperwork hurdle: White House
3|5|"Trump shuffles transition team, eyes loyalists for Cabinet"
3|5|Factbox: Short list of potential Trump administration picks
3|5|"Immigration hardliner says Trump team preparing plans for wall, mulling Muslim registry"
3|5|Son-in-law Kushner poised to wield clout in Trump presidency
3|5|Bannon role in Trump administration sets off critical firestorm
3|5|Death of Australian Hughes ruled 'tragic accident'
3|5|U.S. House Speaker Ryan running for re-election: spokeswoman
3|5|U.S. court deals Trump a setback in poll-monitor fight
3|5|White House study: China trade deal worsens damage from TPP failure
3|5|FBI fear of leaks drove decision on emails linked to Clinton: sources
3|5|Factbox: Wall Street's take on possible outcome of U.S. elections
3|5|"Kerry says confident on Philippines ties, hopes to visit again"
3|5|Trump wants ex-Goldman partner Mnuchin to run U.S. Treasury: Fox Business
3|5|"Obama on FBI: 'We don't operate on innuendo,' leaks"
3|5|California judge says too late to change voting selfie law
3|5|Melania Trump calls taped comments by Donald Trump 'boy talk'
3|5|"Rejecting Trump, Wall Street Republican donors scatter largesse"
3|5|"How Trump, Clinton would fix the 'crazy' U.S. health system"
3|5|Vietnam gives thumbs-up to U.S. regional role as pivot stumbles
3|5|Voting for Trump? Pennsylvania Republican senator will not say
3|5|State Department official 'pressured' FBI to declassify Clinton email: FBI documents
3|5|"North Carolina police probe arson, graffiti threat at Republican office"
3|5|New Jersey 'Bridgegate' defendant says he was duped
3|5|Trump to propose five-year lobbying ban on ex-executive branch officials
3|5|Trump's son-in-law held talks to set up Trump TV network: source
3|5|Porous Texas border fence foreshadows challenges for Trump's wall
3|5|Trump takes populist message to U.S. heartland in 'thank you' tour
3|5|"Obama, trying to protect legacy, unlikely to act on Mideast peace"
3|5|"Trump, Norwegian PM Solberg speak by phone: Trump statement"
3|5|Trump considering Senator Heitkamp of North Dakota for Cabinet: source
3|5|Trump considering Goldman Sachs COO Cohn for energy secretary: Fox Business Network
3|5|Trump considering Democratic Senator Manchin for energy secretary: Politico
3|5|Trump supports completion of Dakota Access Pipeline
3|5|FBI to gain expanded hacking powers as Senate effort to block fails
3|5|Senator warns against simultaneous overhaul of Medicare and Obamacare
3|5|Trump vows to end U.S.-Cuba 'deal' unless Havana makes better one
3|5|Trump to pick Seema Verma for Centers for Medicare and Medicaid Services: transition official
3|5|"Factbox: Trump to meet with retired General Petraeus, Mitt Romney"
3|5|"U.S. companies hope Trump will stick to business roots, back Cuba ties"
3|5|Trump has chosen Representative Price for health secretary: New York Times
3|5|Trump considering Representative Barletta for transportation secretary: Politico
3|5|Trump close to naming congressman Price as health secretary: Atlanta Journal-Constitution
3|5|Wide-ranging U.S. health bill expected to sail through House vote
3|5|Trump adds antitrust expert to Justice transition team
3|5|Vote recount effort races forward despite Trump team rejection
3|5|"China, U.S. must avoid excessive mutual suspicion: Chinese envoy"
3|5|"Schumer, McConnell elected top leaders in Senate"
3|5|"Trump cyber security team, policy slow to take shape: officials"
3|5|U.S. Senate leader says Iran sanctions renewal will pass
3|5|Congressional panel calls for U.S. women's history museum
3|5|New York City mayor tells Trump about fear over his policies
3|5|"Ahead of Trump meeting, Abe told not to take campaign rhetoric literally"
3|5|European leaders and Obama to discuss Russia sanctions in Berlin: sources
3|5|No new U.S. administration is completely prepared: Biden
3|5|Top U.S. diplomat role an unlikely fit for 'tough guy' Giuliani
3|5|Tech privacy ally Feingold leads in Wisconsin Senate race
3|5|"In hats and t-shirts, Trump fans rally in Jerusalem's Old City"
3|5|"More Republicans expect Clinton, rather than Trump, to win U.S. election"
3|5|Trump touts urban policy following detour to open new hotel
3|5|"To applause and boos, Kerry urges Congress to ratify Pacific trade pact"
3|5|Clinton expresses concern about AT&T-Time; Warner deal
3|5|Factbox: Wall Street's take on possible impact of U.S. elections
3|5|Democrats ask judge to sanction Republicans over Trump
3|5|U.S. abstains for first time on U.N. call for end to Cuba embargo
3|5|Republicans may be on verge of losing U.S. Senate majority: aides
3|5|Trump's national security adviser vows to tackle North Korea nuclear threat: Yonhap
3|5|Pro-business Sessions will not go easy on corporate crime: lawyers
3|5|"Claims of votes by the dead, felons cloud North Carolina governor race"
3|5|"Trump's CIA pick supports domestic surveillance, opposes Iran deal"
3|5|A surge in U.S. deportations could swamp an overtaxed system
3|5|Trump agrees to pay $25 million to settle Trump University lawsuits
3|5|"Factbox: Trump to meet with Huckabee, Romney, others this weekend"
3|5|"Trump considering Petraeus, others for Pentagon chief: WSJ"
3|5|NSA director Rogers is top candidate for DNI under Trump: WSJ
3|5|"With Trump victory, blunt U.S. general gets second chance"
3|5|Britain's Brexit firebrand Farage meets Trump in New York
3|5|Obama officials work against time to wrap banking rules
3|5|U.S. to push ahead on climate pact before Trump takes over: Kerry
3|5|Abe aims to underscore importance of Japan-U.S. alliance with Trump
3|5|Turkey issues warning over travel to U.S. after Trump protests
3|5|Some Republicans see attacking Obamacare through regulation
3|5|"Trump threat fires up U.S. climate activists, draws in more"
3|5|"Anti-Trump protesters gather for third night, one shot in Portland"
3|5|One person shot in Portland as anti-Trump protesters cross bridge: police
3|5|Trump packs transition team with loyalists and family
3|5|Illinois abuse victim's lawsuit against ex-U.S. House speaker to proceed
3|5|"Democrats, civil rights groups disagree over levels of voter complaints"
3|5|Pennsylvania glitches did not cause ballots to be miscounted: officials
3|5|Assange says WikiLeaks not trying to influence U.S. election
3|5|Factbox: Clean energy faces vote in four state ballot initiatives
3|5|"Trump or Clinton? Israelis fret, but either is a likely ally"
3|5|"Tiger tips Clinton, bear backs Trump in Siberian zoo's mock vote"
3|5|"Asia sees changed U.S. relationship, whoever wins"
3|5|Russia to bar U.S. diplomats from monitoring its elections: RIA
3|5|Hate speech seeps into U.S. mainstream amid bitter campaign
3|5|Monmouth poll: 6-point Clinton lead over Trump day before U.S. election
3|5|Clinton's pantsuits inspire flashmob video
3|5|Fox News poll shows Clinton leading Trump by 4 points in White House race
3|5|CBS poll shows Clinton with 4-point lead vs Trump in White House race
3|5|Clinton leads Trump 47-43 percent in White House race: Washington Post/ABC poll
3|5|"Fending off foes, Clinton blazes a trail with White House in sight"
3|5|Clinton leads Trump by 3 percentage points: Bloomberg/Selzer poll
3|5|Trump says he would not admit refugees without community support
3|5|"As election looms, Trump says he is 'last chance,' Clinton sees 'moment of reckoning'"
3|5|Betting sites see record wagering on U.S. presidential election
3|5|A waste of money? Trump's border wall falling flat in Arizona: Reuters/Ipsos poll
3|5|Obama turns focus to U.S. Congress as he campaigns for Clinton
3|5|Mexico president says Trump visit could have been done better
3|5|U.S. options market not very 'Trumped up' ahead of vote
3|5|Clinton thinks regulators should scrutinize AT&T-Time; Warner deal: spokesman
3|5|"Trump will accept election results if it's fair, his son says"
3|5|Iran's president says U.S. election offers only bad or worse choice
3|5|"Trump uses policy speech to attack media, promises to sue accusers"
3|5|Clinton far ahead in Electoral College race: Reuters/Ipsos poll
3|5|Trump to lay out what he would do in first 100 days if elected president
3|5|"At under $5 each, Trump's votes came cheap"
3|5|U.N. chief hopes Trump will strengthen international cooperation
3|5|Rhetoric or reality? Arabs struggle to decode Trump's Mideast rhetoric
3|5|Putin says will try to repair ties with U.S.A. under Trump
3|5|Backs against the wall: Trump victory casts pall over Mexico
3|5|Mexico says paying for Trump wall 'not part of our vision'
3|5|"Czech president very happy with Trump win, says shares his views"
3|5|U.S. voters deliver mixed results on gun control measures
3|5|Ukraine says hopes for continued support against Russia from U.S. under Trump
3|5|"Canada PM congratulates Trump, wants to work on trade, security"
3|5|Trump says he will back away from business to focus on White House
3|5|Senior senators want to amend Saudi September 11 law
3|5|U.S. ethics office tweets sarcasm at Trump on business conflicts
3|5|Trump faces challenges in separating from business: legal experts
3|5|Trump to keep Manhattan federal prosecutor Bharara in post
3|5|Just one Trump transition aide for U.S. spy agencies: officials
3|5|Republicans aim to coax Trump toward House trade tax plan
3|5|Goldman's Cohn eyed for top Trump budget post: transition official
3|5|Pelosi re-elected to House Democratic leadership post
3|5|Supreme Court divided in immigration detention dispute
3|5|"Trump seen more moderate on criminal justice, law enforcement"
3|5|"Trump taps Pence to lead transition team, removes New Jersey's Christie: NYT"
3|5|A discontented Michigan town: America should have seen Trump coming
3|5|"U.S. consumers will want Trump, Congress to take on drug prices"
3|5|Trump win puts U.S.-Russia hostility on hold - but for how long?
3|5|Britain's Johnson says no need for gloom about Trump victory
3|5|Trump win opens way for China to take climate leadership role
3|5|Hollande and Trump agreed to 'clarify' key issues including Middle East: source
3|5|"Uncertain Afghanistan looks to Trump for decisions on troops, aid"
3|5|"Expert Views: What will be the impact of Trump presidency on immigration, refugees?"
3|5|Russia intervened to help Trump win election: intelligence officials
3|5|Trump to name Exxon CEO Tillerson secretary of state: NBC NEWS
3|5|Exxon CEO is now Trump's secretary of state favorite - transition official
3|5|"Senate passes funding bill, Obama signs into law"
3|5|U.S. slated to sell $375 million of emergency reserve oil this winter
3|5|Wisconsin judge rejects bid to stop election recount
3|5|US Senate passes bill to fund government through April
3|5|Legislation to fund US gov't through April clears procedural hurdle in Senate
3|5|Romney niece McDaniel is favorite to head Republican Party
3|5|U.S. allies caution Trump on Syria strategy
3|5|Top U.S. Marine's wish-list for Trump goes well beyond troop hikes
3|5|Trump fires opening salvo in risky test of wills with Beijing
3|5|Kissinger says impressed by China's 'calm reaction' to Trump's Taiwan call
3|5|"Carson to HUD: The agency that oversees public housing, federal mortgage programs"
3|5|U.S. top court weighs race challenges to legislative districts
3|5|New House labor committee chair questions need for unions
3|5|Trump meets former Vice President Gore in New York: Gore
3|5|North Carolina governor concedes election to Democratic opponent
3|5|U.S. court puts Obamacare case on hold until Trump takes office
3|5|Trump clear on China's stance on call with Taiwan's Tsai: ministry
3|5|"Trump picks loyalists for economic posts, Obamacare critic for cabinet"
3|5|CIA's Brennan says tearing up Iran deal would be 'folly'
3|5|Federal judges order North Carolina to redraw legislative districts
3|5|Trump expected to name former Goldman banker Mnuchin for Treasury: source
3|5|Health industry breathes easier as post-Obamacare path stabilizes
3|5|Trump flag-burning tweet leads activists to burn some flags in New York
3|5|Factbox: Trump fills top jobs for his administration
3|5|Compromise reached on massive U.S. defense bill
3|5|Trump expected to pick investor Wilbur Ross as U.S. commerce secretary
3|5|"Factbox: Contenders, picks for key jobs in Trump's administration"
3|5|Clinton email problem resurfaces as FBI announces review
3|5|Clinton leads Trump 42 to 36 percent as he loses women's support: poll
3|5|"Three in Florida, Virginia charged with voter fraud"
3|5|Trump looks for boost from Clinton's new email problem
3|5|Clinton ad blitz outpaces Trump as his Super PACs bow out
3|5|"Plane carrying VP candidate Pence skids off NY runway, no injuries"
3|5|Clinton says confident new emails will not change FBI probe's conclusion
3|5|Newly found emails in FBI probe not on Clinton server: U.S. source
3|5|"FBI found Clinton-related emails on devices belonging to aide, ex-congressman: NYT"
3|5|Clinton campaign says 'confident' FBI conclusion in email probe won't change
3|5|"Solar, wind industries hope years courting Republicans pays off under Trump"
3|5|Cubans fret over life after Castro with Trump next door
3|5|Trump adviser warns him not to pick Romney for Secretary of State
3|5|Trump says hopes for Cuban 'freedom' after Castro death
3|5|Sanders to Trump: use defense contracts as leverage for Carrier jobs
3|5|"Clinton team to take part in U.S. state vote recount, Trump blasts effort"
3|5|Trump calls Green Party vote recount request a 'scam'
3|5|Vice President-elect Pence says 'new hope dawns' for Cuba
3|5|U.S. to continue supporting engagement with Cuban people: Kerry
3|5|House Speaker Ryan says work remains to secure freedom in Cuba
3|5|"For China, Trump win creates uncertainty, opportunity"
3|5|Merkel offers to work with Trump on basis of democratic values
3|5|Trump presidency to create high anxiety among Asian allies
3|5|"Vatican wishes Trump well in U.S. presidency, prays for 'enlightenment'"
3|5|Taliban call on Trump to withdraw U.S. troops from Afghanistan
3|5|Germany expects U.S. to stand by long-standing commitment to Europe: defense minister
3|5|How Trump crushed naysayers with a coalition of the forgotten
3|5|Iran's Rouhani says Trump election has no effect on Tehran policies: IRNA
3|5|Britain's Johnson says looks forward to continuing UK-U.S. partnership with Trump
3|5|"Anti-Trump demonstrators set fires, break windows in California"
3|5|"'The Rock' talks a future in politics, including potential White House run"
3|5|"Factbox: President-elect Trump's top goals, biggest hurdles"
3|5|CalPERS chief sees volatility until Trump implements plans
3|5|CalPERS shared 14 percent of private equity profits with firms
3|5|Obama says he hopes Trump sends 'signals of unity' after campaign
3|5|Snowden warns of increase in U.S. domestic spying after Trump victory
3|5|"Putin, Trump speak by phone, aim for cooperation: Kremlin"
3|5|Oil mogul Hamm tops Trump list for U.S. energy secretary: sources
3|5|Trump poses daunting new challenge for Germany's Merkel
3|5|"Obama, Mexico's Pena Nieto discuss U.S.-Mexico relationship: White House"
3|5|Trump offers Sessions attorney general post: CBS News
3|5|Trump lawyers aim to delay fraud trial at hearing
3|5|Trump may discuss secretary of state job with critic Romney: source
3|5|Trump offers national security adviser post to Michael Flynn: senior Trump official
3|5|Contenders for key jobs in Trump administration
3|5|Ford tells Trump no Lincoln SUV production going to Mexico
3|5|Case on Trump worker contract raises conflict of interest question
3|5|Japan PM Abe: Confident of building relationship of trust with Trump
3|5|Trump has offered national security adviser job to Flynn: AP
3|5|Congress could undo Obama-era student loan relief
3|5|Mexico president to show 'pragmatism' dealing with Trump
3|5|Texas eyes 'women's privacy act' that critics say targets transgender people
3|5|Georgia congressman being eyed for top Trump health post: Politico
3|5|Thousands donate to Planned Parenthood in name of anti-abortion U.S. vice president-elect
3|5|"Obama administration completes rule to curb methane from federal oil, gas production"
3|5|North Korea does not care who is president of United States
3|5|"Trump, Pence meeting in New York on Cabinet picks"
3|5|Republican Ben Carson opts against job in Trump Cabinet
3|5|Giuliani is a leading candidate to be Trump's secretary of state: source
3|5|Top tax-writing Republican says TPP trade deal not dead in Congress
3|5|Ex-Miss Finland says Trump groped her
3|5|Most Republicans believe Russia is meddling in U.S. election: Reuters/Ipsos poll
3|5|"Clinton holds lead, but pollsters say their job is harder"
3|5|"Trump attacks Clinton on trade, says he should be handed victory"
3|5|Brazil prosecutor says Trump franchise may have benefited from corruption
3|5|Donald Trump throws counter punch after Joe Biden comments
3|5|'Nasty woman' and Ken Bone: election's viral stars a hit for Halloween
3|5|Obama rallies Obamacare troops at 'critical time' for program
3|5|Obama shortens prison sentences for 98 convicts: White House
3|5|U.S. lawmakers raise privacy concerns over new hacking rules
3|5|"Taiwan presidential office says Trump, Tsai exchanged views on Taiwan-U.S. relations"
3|5|Trump says Taiwan president 'called me' to offer congratulations
3|5|Trump is 'well aware' of what U.S. policy has been on Taiwan: spokeswoman
3|5|Taiwan says contact with Trump agreed ahead of time-presidential office
3|5|Trump moves to quickly fill his top Cabinet ranks
3|5|"Trump speaks with leaders of Afghanistan, Singapore"
3|5|Trump supporters try to block vote recounts in three states
3|5|"Mattis likely to become defense secretary, despite Democrats' concerns"
3|5|Obama expresses confidence in incoming U.N. chief Guterres
3|5|"Factbox: Contenders, picks for key jobs in Trump's administration"
3|5|Ohio judge warns Trump campaign as voter advocates score court wins
3|5|Clinton leading Trump by 2 points in McClatchy-Marist poll
3|5|Clinton leads Trump by 4 points in Washington Post: ABC News poll
3|5|Kansas judge strikes state's dual voter registration system
3|5|Clinton leads Trump by 2 points in Fox News poll
3|5|FBI examining fake documents targeting Clinton campaign: sources
3|5|North Carolina Republican office painted with anti-Trump message
3|5|Insight: Emails show how Republicans lobbied to limit voting hours in North Carolina
3|5|"School, infrastructure bond measures fill U.S. ballots"
3|5|Factbox: Governorships up for grabs in 12 states
3|5|"Cuba, U.S. to discuss detente in wake of Trump election"
3|5|Trump sold all his shares in companies in June: spokesman
3|5|Blackstone's Schwarzman sees historic regulatory overhaul from Trump
3|5|Senate leader pushes for extension of coal miner healthcare
3|5|Release of CIA torture details unlikely: senior Democrat
3|5|Boeing says current Air Force One contract worth $170 million
3|5|White House: Trump's $4 billion figure on Air Force One is questionable
3|5|Factbox: Contenders for key jobs in Trump's administration
3|5|Ex-U.S. attorney from California top candidate to head SEC: CNBC
3|5|Trump's Boeing comments reflect bid to save taxpayer money: aides
3|5|Trump invites UK's May to visit 'as soon as possible'
3|5|Trump could pull out of global climate accord in a year: lawyers
3|5|Russian foreign ministry says eyes better ties with U.S. under Trump
3|5|"Tough reality check for Trump's pledge of better heartland jobs, wages"
3|5|House Republicans test Trump on his U.S.-Mexico wall
3|5|Vexation gives way to pragmatism as Wall Street girds for Trump
3|5|Trump likely to reward loyalty with top appointments
3|5|"Clinton, Obama pledge unity behind Trump presidency"
3|5|Kerry tells State Department to cooperate with U.S. President-elect Trump
3|5|"U.S. voters say yes to big bond issues, mixed message on taxes"
3|5|Russia intervened to help Trump win election: intelligence officials
3|5|Trump to name Exxon CEO Tillerson secretary of state: NBC NEWS
3|5|Exxon CEO is now Trump's secretary of state favorite - transition official
3|5|"Senate passes funding bill, Obama signs into law"
3|5|U.S. slated to sell $375 million of emergency reserve oil this winter
3|5|Wisconsin judge rejects bid to stop election recount
3|5|US Senate passes bill to fund government through April
3|5|Legislation to fund US gov't through April clears procedural hurdle in Senate
3|5|Romney niece McDaniel is favorite to head Republican Party
3|5|U.S. allies caution Trump on Syria strategy
3|5|"Trump win boosts coal, hits renewable stocks"
3|5|Russia's Putin congratulates Trump on election win
3|5|Obama on Trump victory: we are now all rooting for his success
3|5|"Some Americans look to Canada, NZ as Trump surges to victory"
3|5|California voters turn down drug pricing initiative
3|5|"Obama intends to brief, not lobby, Trump on policies: White House"
3|5|Democrat Hassan wins New Hampshire Senate race
3|5|Melania's Slovenian hometown eyes Trump win as boon for tourism
3|5|"White House says committed to implementing Iran deal, climate change agreement"
3|5|ECB's Rimsevics says Trump will be 'very good' president
3|5|Republican foreign policy veterans in quandary over Trump
3|5|"U.S. election was fair, despite voting obstacles: OSCE rights group"
3|5|U.S. presidential election drives record ratings for cable news
3|5|Transgender advocates fear reversal of civil rights under Trump
3|5|"Trump, U.S. Congress will agree on some issues, long-term questions loom"
3|5|"How the polls, including ours, missed Trump's victory"
3|5|Unions brace for pro-business shift in labor policy under Trump
3|5|Mexico says does not expect Trump deportation plan to begin soon
3|5|Trump due in court before Oval Office
3|5|"In election upset, Trump finds pockets of Latino support"
4|5|PHOTOS: Miami's Cubans Celebrate Death of Dictator Fidel Castro
4|4|Obama Offers Condolences After Fidel Castro Death
4|5|Donald Trump Calls For Free Cuba After Fidel Castros Death
4|5|"Miami Herald: No RIP for Fidel Castro in Miami, Just Good Riddance"
4|5|Canadian PM Trudeau Praises Dictator Castro as 'Remarkable Leader'
4|3|BBC Fawns over 'World Icon' Fidel Castro
4|4|UN Migration Chiefs: The Mediterranean Is Cluttered with Sunk Rubber Dinghies
4|5|U.S. Failed to Heed Afghan Intel Warnings Before Hiring Bagram Terrorist
4|3|Pakistan Warns India Kashmir on Brink of 'Full-Fledged Crisis'
4|4|Colombia Pushes Through Unpopular FARC 'Peace' Deal over Voter Rejection
4|5|Putin's Geography Lesson: 'Russia's Borders Don't End Anywhere'
4|3|Philippines' Duterte: Russia Offered Me 'Buy One Get One Free' Weapons Deal
4|3|"Turkey Claims Syrian Airstrike Targeted Its Troops, Killed Three"
4|5|China Denies Ordering Citizens in Muslim Western Region to Hand Over Passports
4|4|Hezbollah Leader: Donald Trump Is Racist
4|3|German Company Launches Line of Atheist Shoes
4|5|Poll: Who Should Be Donald Trump's Secretary of State?
4|4|Inside The Terror Fires Raging Across Israel
4|5|World View: Turkey Furious at EU Parliament's Vote to End Accession Talks
4|3|"UK Welfare Payments Used to Fund Paris, Brussels Terror Attacks"
4|5|AP Disturbed by 'Parade of Retired Generals' Seeking Jobs in Trump Admin
4|3|Politico: Scour Breitbart for Clues About Trump Policy
4|5|"Thanksgiving: 35,000 Pounds of Turkey Flown to U.S. Troops in War Zones"
4|4|World View: How the First Thanksgiving Led to American independence
4|5|"Inside Venezuela: Empty Supermarkets, Fascist Imagery and a Collapsing Social Order"
4|3|Smiling Down Syndrome Kids Banned from French TV in Case they Offend Post-Abortive Women
4|4|"Exclusive--Rep. Dana Rohrabacher: If Trump Offered Me Secretary of State, I Would Take It"
4|4|Iran Claims Navy Fleet Entered Atlantic Ocean for First Time
4|5|Banned Pro-Independence Hong Kong Legislators Aren't Giving Up
4|3|Venezuela Peace Talks Collapse as Opposition Accuses Maduro of 'Mocking the Pope'
4|4|"Philippine Military Defies Duterte, Promises Robust Cooperation with U.S."
4|4|GOP Lawmaker: Islamic State Has Established Training Camps in Latin America
4|4|Cuba Orders North Korea-Style 'Fighting People's March' Following Military Exercises
4|5|"DHS, FBI: Terrorists Looking to Strike Thanksgiving Parades, Black Friday"
4|5|Ayatollah Khamenei: U.S. Has 'Breached the Nuclear Deal in Many Occasions'
4|4|Justin Trudeau's Alleged Pay-to-Play with Chinese Millionaire Raises Human Rights Concerns
4|4|Army Vet Hassled at Chili's Restaurant Is Forced from Home After Media Reveals Address
4|5|Obama Steps Up Gitmo Reviews with Promise of More Transfers
4|4|Pakistan Issues Five Death Sentences After Mob Burns Christian Couple in Kiln
4|3|Opposition Dings Anti-Communist South Korean President over Large Viagra Order
4|5|Officials Fear 'Explosion' of Zika Cases Following Brazil's Rainy Season
4|5|Thanksgiving: Butterball Turkey Shareholder Investigated for Ties to Hezbollah
4|3|Trump Rally Takes Wall Street to Historic 'Superfecta' High
4|3|Report: Facebook Working on Chinese Censorship Tool to Restrict News
4|5|The Pros and Cons of Nikki Haley as UN Ambassador
4|3|Egyptian Court Rescinds Life Sentence on Former President Mohamed Morsi
4|5|Islamic State and Al-Qaeda 'Plotting to Attack Christmas Events in Europe'
4|4|Islamic State Strengthening Presence in Afghanistan
4|3|World View: Cameroon: One Person Killed in English-Speaking vs French-Speaking Civil Unrest
4|5|Iran Sanctions Bills Filed in Texas Senate
4|3|Catholics Launch Sindr App to Find Nearest Confessional
4|4|Samantha Powers Failure to Stop Genocide at the UN
4|4|Italy Report: More Immigrants = More Crime
4|3|"Over 1,000 Iranian 'Martyrs' Killed Fighting for Assad in Syria"
4|3|"Report: Boko Haram Struggling to Meet Demand for Viagra, STD Medication"
4|4|Turkey Issues Warrant for Head of Pro-American Kurdish Militia
4|5|Report: Islamic State Has Launched at Least 52 Chemical Weapons Attacks
4|3|"Fake News: No, the Pope Hasnt Softened Church Teaching on Evil of Abortion"
4|3|Video: Tsunami Hits Near Damaged Nuclear Plant on Japan's Coast
4|5|"FLEITZ: The Truth About John Bolton, the Iraq War and WMD Diplomacy"
4|5|Assad Says Aleppo Win 'Huge Step' Towards End of Syria War
4|4|"Palestinian Tries to Stab Israeli Police, Shot Dead"
4|4|Defense Minister: We Struck in Syria to Prevent Hezbollah from Getting WMDs
4|5|Photos Reveal Islamic State Destruction of Ancient Christian Churches in Iraq
4|3|Libya Claims to Eject Islamic State from Qaddafi's Birthplace
4|5|Chaos as All Sides of Venezuelan Conflict Turn Their Ire Towards the Vatican
4|5|Islamic State Calls for More Attacks on Turkey: Erdogan a 'Beggar' Before 'Crusader Europe'
4|5|House Homeland Security: U.S. Faces Worst Terror Threat Since 9/11
4|3|Turkey: Kurdish Opposition Accuses Erdogan of Torturing Party Leader in Prison
4|5|Pakistan Welcomes Trumps Mediation Role in Deadly Kashmir Dispute
4|5|Internet Archive Defeats FBI Demand for User Data
4|3|Pope Francis: Church Buildings Should Be an Oasis of Beauty
4|3|Pope Francis Compares Fake News to Excrement
4|3|Frank Gaffney: Japan's PM Abe May Convey 'Note of Regret' During Pearl Harbor Visit
4|4|Historian Craig Shirley on Pearl Harbor: December 7 Is the Linchpin of History for America
4|3|Historian Patrick K. O'Donnell Recalls Stories of Pearl Harbor Veterans
4|5|Obama: Islamic State Surge Was Not on My Intelligence Radar Screen
4|4|Pearl Harbor: A Photo Essay of the 'Date Which Will Live in Infamy'
4|5|Netanyahu Dismisses Call for UK to Apologize for Balfour Declaration
4|3|Frank Gaffney: Pearl Harbor an Object Lesson in Practicing Ronald Reagans Peace Through Strength
4|5|Steve Bannon: Fathers and Grandfathers of Deplorables Turned War Around After Pearl Harbor
4|3|Exclusive--Rep. Vern Buchanan: President Barack Obama Must Not Pardon Bergdahl
4|5|Turkey Wants Immediate Extradition of all Turkish Soldiers Who Fled to Greece
4|3|World View: Asian Jihadists Become Radicalized by Myanmar's Rohingya Slaughter
4|5|Egyptian Women's Rights Advocate Azza Soliman Detained
4|5|Montenegro's Push to Join NATO May Set Up Trump-GOP Congress Showdown
4|3|Islamic State Attacks Iraqi Soldiers in Mosul
4|4|Source: Egypt Mulls Warmer Relations With Hamas
4|4|Five Reasons Obama Targeting Israel At The United Nations Would Reward Palestinian Extremism
4|5|Israeli Arabs Sign up for Israel's Army
4|3|Congress Okays $600m. for Israel Missile Defense
4|3|BDS Fail: Israel Preferred Research Partner for American Academia
4|4|U.S. Jewish Group Petitions Qatar to Remove Anti-Semitic Titles from Book Fair
4|3|Taiwan Play: Trump Knows China Needs Us More than We Need Them
4|4|U.S. Government Warns China Facing Growing Islamic Terror Threat
4|3|"EXCLUSIVE - Source: Concern Iran-Backed Forces May Establish Presence Near Israeli, Jordanian Borders"
4|3|Syrian Rebels: 'History Will Never Forgive Obama for What He Has Done'
4|4|"Islamic State Mag Praises Ohio State Jihadi, Doubles Down on Knife Attacks"
4|4|"Cuba on Track for 10,000 Politically-Motivated Arrests by End of Year"
4|3|WATCH: Navy Admiral Slams Kaepernick in Pearl Harbor Speech for Refusing to Stand for National Anthem
4|4|MOSHER: Opening a Dialogue with Democratic Taiwan Can Check Chinas Aggression
4|4|GLAZOV: Castros Torture of American POWs in Vietnam: An Untold Story
4|3|U.S. Govt: China Exploiting Kashmir Tension to Contain Rival India
4|5|Iran: Saudi Arabia's Execution of 15 for Espionage 'Politically Motivated and Unfounded'
4|3|"Report: Russia, Putin Back Left-Wing California Secession Movement"
4|5|Report: Russian Forces Use Weaponized Robot to Take Out Islamic State Leader
4|4|"John Cantlie Resurfaces, Condemning 'Distressing' Attacks on Islamic State in Mosul"
4|3|NYT: Wealthy Saudis Are Funding Both Sides of Taliban War
4|4|Japan Tags Dementia Sufferers with Barcodes
4|4|Pope Francis Confirms Ban on Homosexual Priests
4|5|Cooking up Conspiracies: Erdogan Advisor Says Foreign Chefs on Turkish TV Are Spies
4|3|"World View: Venezuela's Currency Becomes Worthless, as Zimbabwe Introduces New Currency"
4|3|German Chancellor Merkel's Party Passes Anti-BDS Law; Compares BDS To Nazi Boycotts
4|3|"Columbia U Students Protest Event For Highlighting Jewish Connection To Israel, Saying 'Zionism Is Racism'"
4|5|Two Hamas Terrorists Killed in Tunnel Collapse
4|3|Research Indicates Israeli Men Live Longer Due to Military Service
4|4|Shin Bet Arrests Palestinian Cell Responsible for West Bank Shootings
4|5|"Report: U.S., UK Spied on Israeli Diplomats"
4|5|British Foreign Minister says Saudi and Iran Stoking Proxy Wars in Middle East
4|4|Theresa May: Iran Nuclear Deal is Vitally Important For Regional Security
4|5|Hezbollah Accuses Israel of Airstrikes Near Damascus
4|3|Italy Deports Moroccan Jihadist Planning Bomb Attack in Vatican
4|5|Syria Army Takes all of Aleppo Old City: Monitor
4|3|"Egypt Busts Organ Trading Racket, Arrests 45 People"
4|4|Netanyahu Slams Fatah for Electing Intifada Architect Marwan Barghouti to Senior Position
4|4|Survey: Nearly Half Israeli Jews Believe Left Not Loyal to the State
4|3|"Islamic State Capitol Hill Jihadi in Court: Allah Is in Control, Not This Judge!"
4|3|Pakistan Reaches Out to Trump as Congress Mulls 'State Sponsor of Terror' Label
4|5|"Justin Trudeau OKs Marijuana Raids, Leaving Canada's Cannabis Users Feeling 'Cheated'"
4|3|Venezuelan Women Sell Their Hair for Food in Neighboring Colombia
4|4|Iran Jails 12 Fashion Workers for 'Spreading Western-Style Culture of Nudity'
4|5|Bob Dole Says He 'May Have Had Some Influence' over Trump's Taiwan Call
4|5|Mongolia Protests Chinese Import Tax Following Dalai Lama Visit
4|3|Iran's Rouhani Promises Not to Allow Trump to Undo Nuclear Deal
4|4|"Obama Says No Foreign Terrorist Organization Has Planned, Executed Attack on U.S. During His Term"
4|3|Trump Formally Announces Gen. Mattis for Secretary of Defense: 'Mad Dog Plays No Games'
4|5|"Syria: U.S. Blames 'Unintentional, Regrettable Error' for Attack on Assad Troops"
4|5|Unprecedented: Trump May Appoint 5 Military Officers to Top Admin Posts
4|4|Washington Post: Trumps Appointments of Military Officers May Turn U.S. Into Dictatorship
4|3|ZUMWALT: Congress's 9/11 Lawsuit Bill Opens Pandora's Box of Claims Against U.S.
4|4|California HOA Orders Marine Wife to Remove Her Flag
4|3|Chinese Media Panic over Trump as Xi Vows Cooperation in Chat with Kissinger
4|5|Obamas Pentagon Suppresses Study Finding $125 Billion in Wasteful Spending
4|4|Reports: Hamas Police Injured In Gunfight With Islamic State Loyalists
4|5|Italy Breaks Immigration Record in 2016
4|4|GLAZOV: Why the Left Cried When Fidel Died
4|3|Kurds Open 'Trump Fish' Restaurant
4|4|"Trump Denounces Chinas Economic, Military Policies After Taiwan Call"
4|3|WATCH: Fatah Song On Palestinian Authority TV Calls To 'Slice Open' Israel's Chest
4|5|New York Times Fails To Mention Author's Ties To Anti-Israel NGO Breaking The Silence
4|3|PHOTOS: Historic: Japanese Troops Arrive in South Sudan with Mandate to Use Force
4|3|Donald Trump: Jared Kushner 'Could Be Very Helpful' In Brokering Israeli-Palestinian Peace Deal
4|5|UN Chief: Politicians Ignoring the Losers of Globalization
4|4|Trump Meets With Longest-Serving Marine General John Kelly
4|5|Putin Moves Missiles Closer to Europe: 'We Are Concerned by NATO's Decision-Making'
4|5|Al-Qaeda Rails Against Steve Bannon and 'Far-Right Breitbart Website'
4|3|Mosul: All-Female Islamic State Morality Police Tortured Women
4|4|GAFFNEY: The 'Big Lie' Is Back
4|4|World View: China Puts Army on High Alert Along Border with Burma (Myanmar)
4|4|Bishops and President Proclaim Jesus Christ King of Poland
4|5|Italy Set to Break Yearly Immigration Record in 2016
4|3|Coup Purge: Turkey Ousts Only Christian Mayor
4|3|Venezuela: Dictator Nicolas Maduro Hoping for 'Respectful Relations' with Trump
4|4|Vietnam Challenges China with Bigger Military Facilities in South China Sea
4|3|Erdogan 'Disillusioned' with Obama for Not Taking Migrant Crisis 'Seriously'
4|4|Dem Congresswoman Meets with Trump to Discuss Foreign Policy
4|4|"Tsunami Warning After 7.3 Magnitude Earthquake Hits Near Fukushima, Japan"
4|4|Police Arrest Yemeni Plotting 'Nice-Style' Islamic State Truck Attack in New York
4|5|"'Starstruck Schoolboy' Rodrigo Duterte Meets 'Idol,' Russian Strongman Putin"
4|3|"Japan, China Heads of State Meet amid Dueling Trump Charm Offensives"
4|5|"Obama, Despite Own Record, Demands Trump 'Stand Up to Russia'"
4|5|World View: Bizarre Monkey Attack Triggers Tribal War in Jabha in Southern Libya
4|4|House Chairman Jumps into Fight Over Adm. Michael Rogers at NSA
4|5|Breitbart's Aaron Klein: Steve Bannon 'One Of The Best Friends Israel Ever Had In The White House'
4|5|Pope Francis Denounces Abortion as a Horrendous Crime
4|4|John Bolton Warns Obama Against Lame Duck Offensive Targeting Israel
4|5|Poll: Mexico President Pena Nieto Approval Hits Low After Trump Win
4|5|World View: Sri Lankan Buddhist Monks Accused of Racist Hate Speech
4|4|Pope Francis: Immigrants and Refugees Are Not Our Enemies
4|5|Army Band Not Allowed to Play Holiday Music at Religious Christmas Show
4|5|Morici: Trump Must Prepare for Showdown with China
4|3|EXCLUSIVE - Jackie Mason Slams Mitt Romney For Interest in State Job After Repeatedly Criticizing Donald Trump
4|3|Russia Says to Start Talks with U.S. on Aleppo Rebel Withdrawal
4|3|John Kerry Refuses To Rule Out Unilateral United Nations Action on Palestinian State
4|4|First Israeli Envoy to Turkey Since 2010 Starts Work
4|4|Rubin: John Bolton Is No Loose Cannon
4|4|Second Russian Jet Crashes in Failed Carrier Landing Near Syria
4|3|Islamic State Sympathizers Debate Fate of Two Captured Turkish Soldiers
4|5|World View: No War Erupted from Trump's Ten Minute Phone Call with Taiwan's Tsai Ing-wen
4|3|Israel Resumes Parcel Post Into Gaza
4|5|Russia Says Proposed UN Resolution on Aleppo 'Provocative Step'
4|3|UK Home Secretary Vows to Spend Millions for Jewish Security
4|3|Airstrikes Kill 21 in Syrias Idlib - Monitor
4|3|New Controversy Hits Israel Sub Deal Over Iran Link
4|4|Populists Primed to Govern Italy After Stinging Renzi Defeat
4|4|Netanyahu Seeks 30 Day Delay of Supreme Court Order to Evacuate West Bank Jewish Outpost
4|5|Ex-CIA Officer Fights Conviction for Leaking Anti-Iran Operation
4|4|Israel Summons Ecuadors UN Ambassador For Equating Zionism with Nazism
4|4|Jewish Family Battles Spain Museum Over Art Looted By Nazis
4|3|Netanyahu to Discuss Fate of 'Bad' Iran Deal With Trump
4|3|"Airstrikes Kill Aleppo Children's Beloved Clown; Russia, Syria Accused of Blocking Humanitarian Aid"
4|5|Viva La Revolucion! Jeep Carrying Fidel Castro Ashes Breaks Down Mid-Funeral
4|5|Venezuela to Issue Bills in Larger Denominations in the Midst of Currency Meltdown
4|5|Linda Tripp - Jill-Hill Recount: A Frivolous Farce
4|3|Saudi Cleric: Males Whose Female Relatives Work In Medical Profession 'Are Not Men'
4|3|Saudi Arabias Social Stability to Fall Apart
4|4|More British Muslims Believe Jews Behind 9/11 Attacks Than Al-Qaeda
4|3|Senior Cleric: Iran Must Retaliate For U.S. Violation Of Nuclear Deal
4|4|Palestinian Fatah Party Ends Conference With Boost For Abbas
4|5|Egypt's Top Constitutional Court Upholds Law Restricting Street Protests
4|3|Syria Army Seizes New Rebel District in Aleppo - Monitor
4|5|Iranian FM: U.S. Sanctions Vote Shows Lack of American Credibility
4|3|Swiss Seize Artifacts Looted From Syrias Palmyra
4|4|"Iran, Russia Reaffirm Alliance in Syrian War"
4|3|Dozens of States Approve Fund to Protect Heritage Sites in Conflict Zones
4|4|Palestinian Arrested After Crossing into Israel from Gaza
4|5|Muslim Cleric Fights U.S. Deportation Over Undisclosed Detention by Israel
4|4|Democratic Mega-Donor Haim Saban: Keith Ellison Clearly An Anti-Semite
4|4|Exclusive--Rep. Dana Rohrabacher: Trump's Taiwan Call Alerts Chinese U.S. No Longer a 'Pushover'
4|5|World View: Narendra Modi Threatens to Divert Water from Pakistan to India's Farmers
4|3|"Rep. Jeff Duncan: McCaul Is the Leader Trump Needs to Secure Border, Enforce Immigration Laws"
4|4|Sgt. Bowe Bergdahl Requests Pardon from Obama Before Trump Takes Office
4|3|Gaza Jihadi: Expect More 'Lone Wolf' Attacks Like Ohio
4|4|Islamic State Publishes Picture of Palestinian 'Martyr' In Seeming Bid to Embarrass Hamas
4|3|Italy PM Renzi Makes Last-Ditch Appeal to Save Referendum
4|5|"Iran Says Extended U.S. Sanctions Violate Nuclear Deal, Vows Retaliation"
4|4|Mosul: Anti-Islamic State Coalition 'Cratering' Roads to Stop Suicide Bombers
4|5|Iranian Lawyers Arrested in Kenya for Planning 'Terrorist Act' on Israeli Embassy
4|5|Indian Media Accuse China of Conducting Military Patrols in Afghanistan
4|5|Leaflets Dropped in Rebel-Held Aleppo: 'You Will Be Annihilated'
4|4|General Tso's Chicken Inventor Dies: The Anti-Communist Origins of America's Favorite Chinese Dish
4|4|MILO: Trump Nominee 'Mad Dog' Mattis 'Makes Clint Eastwood Look Like A Thai Ladyboy'
4|5|Donald Trump Takes on China; Opens Communications with Taiwan
4|5|'A Marine's Marine': Veteran Lawmakers Praise Gen. Mad Dog Mattis Pick
4|3|Report: Exxon CEO Rex Tillerson a Dark Horse Candidate for Trump Secretary of State
4|4|Republican Jewish Coalition Backs 'Mad Dog' Mattis
4|3|Report: U.S. Military Gives Russia Advance Notice of Airstrikes in Syria
4|4|7 Things to Know About Secretary of Defense Nominee James Mattis
4|3|Senate Republicans Strip Religious Freedom Protection from Defense Spending Bill
4|3|FBI: Islamic State and Al-Qaeda Cleric Inspired Ohio State Attacker
4|5|A Look into the Mind of Gen. James Mattis: 15 Quotes from Trump's Secretary of Defense Pick
4|4|Torture Appeared Widespread After Turkey Coup: UN Expert
4|4|"Donald Trump, Philippines' Duterte Speak for First Time in 'Animated' Phone Call"
4|4|"Senate Passes Iran Sanctions 99-0, Sen. Bernie Sanders Only No-Show"
4|5|World View: Sunday's Referendum in Italy Threatens EU's Stability
4|4|Syria Rebels Mount Fierce Defence of Key Aleppo District
4|4|Erdogan Urges Turks to Convert Foreign Currency to Lira
4|3|Turkish Call to Drop Gaza Ship Case Against Israelis
4|4|"Former Israeli Intel Official: Fearing Trump Presidency, Iran To Speed Up Arming Terror Proxies"
4|3|Iran Says It Will Respond to U.S. Sanctions Renewal
4|3|Israeli Arab Firms Offer to Donate Wood to Rebuild Burned Synagogue
4|3|Israeli Defense Minister: UN Risks Becoming Irrelevant with Resolutions Against Jewish State
4|3|Obama Uses Waiver to Delay Moving U.S. Embassy to Jerusalem
4|5|U.S. Ambassador to Israel: We Will Always Oppose One-Sided Initiatives
4|3|Iranians Face Terrorism Charges After Filming Israeli Embassy in Kenya
4|4|Report: Boycott Movement Targets Egyptian Band for Coordinating Palestinian Show with Israel
4|4|GAO: Obama's Troop Deployment Caps Force Pentagon to Rely on Contractors
4|4|Ugandan Archbishop Urges Women to Stop Beating Their Husbands
4|5|"After Accusing Assad of 'State Terror,' Erdogan Says Troops in Syria Only Targeting 'Terror'"
4|5|Colombia: Congress Approves FARC 'Peace' Deal Rejected by Popular Vote
4|4|Latest Round of U.N. Sanctions Cut North Korea's Export Revenue by 25%
4|5|Ukraine Missile Tests Put Russian Forces on 'High Alert'
4|5|Islamic State Claims It Captured Two Turkish Soldiers in Northern Syria
4|3|Mexican President at Fidel Castro Ceremony: 'Mexico Is a Land of Refuge'
4|5|Reports: Donald Trump selects 'Mad Dog' James Mattis for Defense Secretary
4|4|Mattis Pick Would Risk Confirmation Fight with Pro-Israel Groups
4|4|"Ohio Jihad Shows How American-born Muslim Has Transformed, Decentralized, Al Qaedas Strategy"
4|4|Kellogg Foundation Provided Nearly $1 Million to Support Black Lives Matter
4|3|Cuba: Imprisoned Artist 'Badly Beaten' During Asthma Attack for Anti-Castro Graffiti
4|3|Santeria Priest Warns Cubans: Cover Heads to Stop Fidel Castro from Possessing You
4|3|Leftist Professors Across U.S. Mourn Fidel Castro's Death
4|3|First Navy SEAL Rep. Ryan Zinke in Book: Troops Bound by 'Restrictive' Rules of Engagement
4|4|Five Cuban Dissidents to Watch in the Post-Fidel Era
4|4|After Fidel Castro: Five Cuban Dissident Artists You Need to Know
4|3|Josh Earnest: Fidel Castro a 'Towering Figure'
4|5|"A.J. Delgado: Cuba Must Release Political Prisoners, Support Free Speech to Bring Trump to the Table"
4|5|"'Thousands of Moments of Silence': Cuba Bans Music, Alcohol, Public Mirth for 9 Days"
4|4|Russias Holy War Against the West
4|4|Zumwalt: How The New York Times Used Fake News to Help Fidel Castro
4|3|Ms. Veteran America Contest Helps Female Troops: 'Im A Lot Stronger'
4|3|Mosher: How Trump Will Win the Trade War with China
4|4|North Korea Commands 3-Day Mourning Period for Fidel Castro
4|4|"World View: Iraq Sending Shia Militias to Mosul, Directly Violating Promise to Turkey"
4|3|Report: Italian Birthrate Continues to Plummet
4|5|Cardinal Zen Says Vatican Deal with China Would Betray Jesus Christ
4|3|Pope Francis Sends Condolences over Sad News of Castro's Death
4|4|Glazov: 'Monster' Fidel Castro Leaves Blood of Innocents in His Wake
4|4|World View: Egypt to Send Troops to Syria to Aid Bashar al-Assad and Russia
4|4|'Children of Satan': CAIR Claims Pro-Trump Hate Mail Hits Mosques
4|4|California Cubans Celebrate Fidel Castro's Death
4|3|California Democratic Congresswoman Praises Fidel Castro
4|3|Rep. Dana Rohrabacher Says Trump Admin Considering Him for Secretary of State
4|4|"World View: Turkey, Syria, Kurds, Islamic State Converge in al-Bab"
4|5|#TrudeauEulogies Trends on Twitter to Mock Canadian PM's Praise of Castro
4|3|Cuban Artist Arrested for 'He's Gone' Graffiti Following Fidel Castro's Death
4|4|Four World Dictators Mourning Fidel Castro
4|3|Ted Cruz: Remember the 'Brave Souls' Who Fought Against Castro
4|4|Martel: Fidel Castro Is Dead. This Changes Nothing.
4|3|Washington Post: Farewell to Cubas Brutal Big Brother
4|4|EU Chief Juncker Praises 'Hero' Fidel Castro
4|5|"American Official: U.S.-Led Coalition Has Killed 50,000 Islamic State Jihadis"
4|4|Syrian Rebels: 'History Will Never Forgive Obama for What He Has Done'
4|3|"Islamic State Mag Praises Ohio State Jihadi, Doubles Down on Knife Attacks"
4|5|Porn Icon Jenna Jameson Admits to Massive Crush on Netanyahu
4|4|Qatari Writer: Religious Extremism Existed 'Throughout Islamic History'
4|5|Islamic State Looks to Regroup in Libya After Losing Sirte
4|3|"George Clooney: U.S. Not Taking in Enough Syrian Refugees, We Need to 'Do More'"
4|3|"Trump Blasts Pope on Mexican Immigration, He Doesnt Understand"
4|3|Rubio: Hillary Lying to Benghazi Families Disqualifies Her to Be Commander-in-Chief
4|3|GLAZOV: Castros Torture of American POWs in Vietnam: An Untold Story
4|4|MOSHER: Opening a Dialogue with Democratic Taiwan Can Check Chinas Aggression
4|3|"Cuba on Track for 10,000 Politically-Motivated Arrests by End of Year"
4|5|Taiwan Play: Trump Knows China Needs Us More than We Need Them
4|4|Massive Pro-Family Cape Town Declaration Defies LGBT Culture
4|3|German Lawmakers Call for Probe on Imams Suspected of Spying for Turkey
4|4|Chinese Education Rankings Plummet After Most of China Added to Survey
4|4|Lawyer Strike Delays 'Pakistan's Kim Kardashian' Honor Killing Case
4|3|Business Interests Benefitting from Castro Regime Urge Trump to Be Friendly to Cuba
4|3|Obama Request Sparks Israels Interest in Taking 'Forever' Gitmo Detainee
4|3|"Russia's 'Sad, Smoky' Aircraft Carrier Fails Mediterranean Syria Mission"
4|4|Turkey Seeks Role in Aleppo Ceasefire with Renewed Russia Ties
4|3|Vietnam Begins Its Own Island-Building Project in the South China Sea
4|5|Egypt Increases Penalty for Female Genital Mutilation to Up to 15 Years in Prison
4|5|Report: Afghan Taliban Claims 'Sole Purpose' of Russian Ties Is to Expel U.S.
4|4|RABBI SHMULEY: Trump Should Advance Human Rights Where Obama Failed
4|3|South Korean President Park Geun-hye Impeached
4|5|Chinese Propaganda: 'Build More Strategic Nuclear Arms' to Fight Donald Trump
4|4|"NSA Listens to In-Flight Mobile Calls Placed 'Above 10,000 Feet'"
4|4|"American Official: U.S.-Led Coalition Has Killed 50,000 Islamic State Jihadis"
4|4|"Dr. Sebastian Gorka on Trumps Cabinet: After Eight Years of Pajama Boys, Its Time for the Alpha Males"
4|3|Islamic State Looks to Regroup in Libya After Losing Sirte
4|3|LGBT Groups Blast Vatican for Banning Homosexuals from Seminaries
4|5|World View: China Says Its South China Sea Military Buildup Is a Boon to the World
4|3|Porn Icon Jenna Jameson Admits to Massive Crush on Netanyahu
4|4|Tens Of Thousands Of Emails To Senators Urge End to Aid Until Palestinians Stop Financing Terrorism
4|4|Qatari Writer: Religious Extremism Existed 'Throughout Islamic History'
4|3|UN To Decide on Creation of Database of Firms Doing Business in Jewish Settlements
4|3|Italy Migrant Crisis: Thousands of Nigerian Women Forced into Prostitution
4|3|Bombing on Road Leading to Giza Pyramids Kills Six
4|4|WATCH: Dust Storm Shields Israel From Islamic State Terrorists on Golan Heights
4|4|Islamic State Suffering From Fewer Fighters and Resources: Pentagon
4|4|Israel Eases Process for Same Sex Couples to Obtain Citizenship
4|4|Heavy Syrian Army Shelling Hits Rebel Aleppo: Monitor
4|4|"American Official: U.S.-Led Coalition Has Killed 50,000 Islamic State Jihadis"
4|4|Syrian Rebels: 'History Will Never Forgive Obama for What He Has Done'
4|5|"Islamic State Mag Praises Ohio State Jihadi, Doubles Down on Knife Attacks"
4|4|Porn Icon Jenna Jameson Admits to Massive Crush on Netanyahu
4|3|Qatari Writer: Religious Extremism Existed 'Throughout Islamic History'
4|3|Islamic State Looks to Regroup in Libya After Losing Sirte
4|4|"George Clooney: U.S. Not Taking in Enough Syrian Refugees, We Need to 'Do More'"
4|3|"Trump Blasts Pope on Mexican Immigration, He Doesnt Understand"
4|5|Rubio: Hillary Lying to Benghazi Families Disqualifies Her to Be Commander-in-Chief
4|4|GLAZOV: Castros Torture of American POWs in Vietnam: An Untold Story
4|3|MOSHER: Opening a Dialogue with Democratic Taiwan Can Check Chinas Aggression
4|5|"Cuba on Track for 10,000 Politically-Motivated Arrests by End of Year"
4|3|Taiwan Play: Trump Knows China Needs Us More than We Need Them
4|3|Massive Pro-Family Cape Town Declaration Defies LGBT Culture
4|5|German Lawmakers Call for Probe on Imams Suspected of Spying for Turkey
4|4|Chinese Education Rankings Plummet After Most of China Added to Survey
4|5|Lawyer Strike Delays 'Pakistan's Kim Kardashian' Honor Killing Case
4|3|Business Interests Benefitting from Castro Regime Urge Trump to Be Friendly to Cuba
4|5|Obama Request Sparks Israels Interest in Taking 'Forever' Gitmo Detainee
4|4|"Russia's 'Sad, Smoky' Aircraft Carrier Fails Mediterranean Syria Mission"
4|5|Turkey Seeks Role in Aleppo Ceasefire with Renewed Russia Ties
4|3|Vietnam Begins Its Own Island-Building Project in the South China Sea
4|4|Egypt Increases Penalty for Female Genital Mutilation to Up to 15 Years in Prison
4|3|Report: Afghan Taliban Claims 'Sole Purpose' of Russian Ties Is to Expel U.S.
4|3|RABBI SHMULEY: Trump Should Advance Human Rights Where Obama Failed
4|5|South Korean President Park Geun-hye Impeached
4|3|Chinese Propaganda: 'Build More Strategic Nuclear Arms' to Fight Donald Trump
4|3|"NSA Listens to In-Flight Mobile Calls Placed 'Above 10,000 Feet'"
4|3|"American Official: U.S.-Led Coalition Has Killed 50,000 Islamic State Jihadis"
4|3|"Dr. Sebastian Gorka on Trumps Cabinet: After Eight Years of Pajama Boys, Its Time for the Alpha Males"
4|5|Islamic State Looks to Regroup in Libya After Losing Sirte
4|5|LGBT Groups Blast Vatican for Banning Homosexuals from Seminaries
4|5|World View: China Says Its South China Sea Military Buildup Is a Boon to the World
4|4|Porn Icon Jenna Jameson Admits to Massive Crush on Netanyahu
4|5|Tens Of Thousands Of Emails To Senators Urge End to Aid Until Palestinians Stop Financing Terrorism
4|4|Qatari Writer: Religious Extremism Existed 'Throughout Islamic History'
4|5|UN To Decide on Creation of Database of Firms Doing Business in Jewish Settlements
4|3|Italy Migrant Crisis: Thousands of Nigerian Women Forced into Prostitution
4|4|Bombing on Road Leading to Giza Pyramids Kills Six
4|5|WATCH: Dust Storm Shields Israel From Islamic State Terrorists on Golan Heights
4|3|Islamic State Suffering From Fewer Fighters and Resources: Pentagon
4|4|Israel Eases Process for Same Sex Couples to Obtain Citizenship
4|4|Heavy Syrian Army Shelling Hits Rebel Aleppo: Monitor
4|4|World View: Europeans Wonder if Turkey Will Reopen the Refugee Floodgates
4|4|Aaron Klein: Breitbart Jerusalem Founded To Counter The Total Bias Of The Mainstream Media
4|5|Pope Francis Calls for Responsible Behavior to Stop AIDS
4|4|Israeli Bus Company Suspends Arabic-Language Announcements Amid Complaints
4|5|Israel's Chief Diplomat: We Would Welcome Trump's Son-In-Law Kushner As Peace Envoy
4|5|Saudi Prince: Time to Allow Women to Drive...Just Not in Rural Areas
4|3|First Israeli Ambassador to Turkey Since 2010 Arrives
4|3|Aleppo Rebels Hope to Reverse Fortunes Under New Alliance
4|3|Qatar Accused of Blocking News Website
4|3|Palestinian Arrested in Connection with Fire Near Jerusalem
4|3|Arab-Israeli Teen Arrested for Planning to Join Islamic State
4|5|Israel Navy Debuts Advanced Patrol Craft
4|5|Kuwait Court Upholds Cyberactivist's 10-Year Jail Term
4|4|Leviathan Partners Sign $2 bln Israeli Power Plant Natgas Deal
4|3|Update: Israeli Police Say Nearly Half of Recent Fires Were Arson
4|3|Coca-Cola Opens Plant in Gaza Strip
4|5|Report: Close Netanyahu Associate Under House Arrest for Sexual Assault
4|3|Syrian Army Assault Leaves Bodies Strewn in Aleppo Streets
4|5|Gitmo Board Approves Release of Al-Qaeda Bomb Maker
4|4|"South African President: Castro Was a 'Progressive Force,' 'Embraced Liberty'"
4|5|Castro's Millions: Fidel's Family Expected to Secure Estimated $900 Million Estate
4|4|South Korean Political Crisis: Park Asks Parliament to Decide Her Fate
4|5|'Fidel Taught Me How to Think': Elian Gonzalez Calls Castro 'Immortal Superman'
4|3|Captured Jihadis: Mosul's Sunnis Indoctrinated to Support Islamic State
4|4|"War-Torn Yemen on the Brink of Its Own Refugee Crisis as Somalis, Ethiopians Pour In"
4|4|U.S. Special Envoy to Libya: Islamic State May Be Expanding Outside Stronghold
4|4|Russia: Erdogan's Vow to Topple Assad 'Really Came as News to Us'
4|5|EXCLUSIVE - Islamic State Loyalists After Ohio State Rampage:  We Ask Allah To Shake Up America With New Attacks
4|5|Greek PM Alexis Tsipras Toasts 'Great 20th Century Revolutionary' Fidel Castro
4|3|PHOTOS: Mandatory Mourning in Cuba as Fidel Castro Urn Caravan Takes the Streets
4|5|World View: China and Russia in Military Competition in Tajikistan
4|4|Iran's Rouhani Slams U.S. as Still the 'Enemy' After Sanctions Renewal; Promises 'Harsh Reaction'
4|4|Palestinians Demand UN Recognition of State After Knesset Approves Outpost Bill
4|4|"Turkey Condemns Alleged Problems with Media Freedom in U.S., Europe"
4|4|EXCLUSIVE - Gaza Jihadi Claims Islamic State Leader Baghdadi Still Alive Amid Unconfirmed Death Reports
4|3|Nevada Introduces Anti-BDS Legislation
4|4|New French Abortion Protection Law Blasted as Total Censorship
4|4|WATCH: IDF in Gaza Division Drill Readies for Cross-Border Terrorist Attacks
4|5|U.S. Airstrikes Help Drive Islamic State From Libyan Coastal City
4|3|Knesset Approves Plan to Reduce Mandatory IDF Service For Male Soldiers
4|4|Lindsey Graham Pushing to Suspend Aid to Palestinian Authority
4|3|Saudi Court Sentences 15 People to Death for Spying for Iran: Arabiya TV
4|4|Egypt Advisory Council Says Red Sea Islands Should Remain Egyptian
4|5|China Warns Trump: Iran Nuclear Deal Must Stand
4|3|Syria Rebels Reject Aleppo Exit as Regime Army Advances
4|5|Poll: Vast Majority of Israelis Believe Trump Will Be Pro-Israel
4|5|Japan PM Abe Will Visit Pearl Harbor to 'Comfort the Souls of the Victims'
4|3|Aleppo Cemeteries Run Out of Room for the Dead
4|4|Russia Claims to Have Killed Islamic State 'Emir' in Dagestan
4|3|Wives of Venezuela's Political Prisoners Chain Selves Outside Vatican
4|5|"Cuba: Artist 'El Sexto,' Jailed for Anti-Fidel Graffiti, Refusing to Eat After Being Drugged"
4|3|Iranian 'Military-Religious Amusement Park' Lets Kids Practice Attacks on Israel
4|5|US Transfers Gitmo Detainee to African Nation with Possible Al-Qaeda Cells
4|5|'Huge Abyss of Desperation' Leading Nigerian Women to Join Boko Haram
4|5|Zumwalt: Obama Used 'Fake News' to Sell the Iran Nuclear Deal
4|5|Fake U.S. Embassy in Ghana Open for a Decade Before Being Shut Down
4|3|Klein: John Kerrys Dangerous Ignorance On The Israeli-Palestinian Conflict
4|5|Trump Taiwan Call Highlights Separatist Movements Against Communism in China
4|4|Former Platoon Leader: Bowe Bergdahl Seeking Pardon from Obama a 'Desperate Attempt' by His Defense Team
4|3|PICTURES: Embattled Islamic State Continues 'Business as Usual' Propaganda Push
4|4|'DroneGun' Takes Down Drones by Jamming Signals from Remote Pilot
4|5|"World View: Mahmoud Abbas, 81, Reelected Leader of Fatah/Palestinian Authority"
4|4|Top Cardinal: Many Catholics Unnerved by Church Under Pope Francis
4|5|Syria: Israeli Warplanes Struck Targets Outside Damascus
4|5|Report: Ohio State Attacker Praised al-Qaeda Leader After Years Spent in Pakistan
4|4|Mourning Fidel Castro: Cuba Forces Citizens to Sign Loyalty Vow to Communism
4|2|Khalid Sheik Mohammed: 'Cowboy' George W. Bush Shocked Al-Qaeda with Ferocity'
4|2|"Duterte: International Criminal Court Is 'Bulls**t,' European Lawyers Have 'Brains Like a Pea'"
4|4|"Islamic State Video Teaches Bomb-Making, Decapitation to Aspiring Lone Wolves"
4|1|20-Year-Old in North Carolina Planned to Murder Hundreds for Islamic State
4|3|"Obama Gives Special Forces Expanded Power,' Intensifies War on Somali Al-Shabaab"
4|1|Who's Who of Anti-American Elite to Attend Dictator Fidel Castro's Funeral
4|4|Iranian Patrol Boat Trains Weapons on U.S. Navy Helicopter
4|5|"Iran: Military Chief of Staff Suggests Bases in Yemen, Syria"
4|4|White House Warns Against Blaming Religion of Islam After Ohio State Attack
4|3|Erdogan: Turkey Entered Syria to 'End the Rule of the Tyrant Assad'
4|3|Islamic State Claims Ohio State Attack: Abdul Razak Ali Artan Was a 'Soldier'
4|1|Watch: Cuban Americans Tell Their Grandparents Fidel Castro Died
4|2|Russian Taliban Recruit Argues He Is a 'Lawful Combatant'
4|3|Vatican Hosts World Premiere of Martin Scorseses Silence
4|2|Cuban Journalists Criticize Ban on 'Good Morning' Post-Fidel Castro Death on Hot Mic
4|5|Senior White House Aide Ben Rhodes Will Attend Fidel Castros Memorial
4|1|"Justin Trudeau Will Not Attend Funeral of His Father's Honorary Pallbearer, Fidel Castro"
4|3|World View: UN: Burma (Myanmar) Committing 'Ethnic Cleansing' of Rohingyas
4|5|"MILO: On His First Day, Trump Could Stop More Ohio States from Happening"
4|4|"BOTEACH: Obama, World Leaders Disgrace Themselves by Refusing to Condemn Castro"
4|2|Pope Francis Calls Climate Skeptics to Ecological Conversion
4|3|Who Are the Ladies in White? Cuba's Dissidents in the Spotlight After Death of Castro
4|4|Jimmy Carter: U.S. Must Recognize 'Palestine' at United Nations
4|5|"Mosul: Locals Demand Removal of Rotting Bodies as Islamic State Death Toll Hits 1,000"
4|5|Cultural Enrichment: The Globalists Ultimate Trojan Horse
4|2|Exiles Pour into Miami Streets to Celebrate Castro Death
4|2|"EU Censoring Free Speech With Fake News Claims, Says IFJ"
4|1|Syrian Army Taking Back Aleppo
4|3|Cuban Communist Icon Fidel Castro Dead at 90
4|2|Obama urged Clinton to concede on election night
4|3|Journalist Tricked Into Spreading Hoax Trump-Inspired Attack [VIDEO]
4|2|Using fake news against opposing views
4|5|Tensions rise at CNN as the network aims for Trump
4|3|Fake News: CNN Accidentally Falsely Admits It Aired Pornography for 30 Minutes on Thanksgiving
4|1|Breaking: Democrat Counter-Coup Against Trump in Progress
4|4|"If Trump Election is Overturned, Who Will Be President?"
4|3|"Warning to Trump: New Student Loan Plan Treats the Symptoms, Not the Disease"
4|5|Watch This Viral Video of Trump on 9/11
4|2|"Erdogan accuses EU of betrayal, threatens to open borders for migrants"
4|5|Cannibal Bacteria Destroying Superbugs?
4|1|Terrorism Blamed For Wildfires Raging Through Israel
4|4|Heres the Dutch Donald Trump Speech the Media Wont Show You
4|1|Is Jill Steins Recount an Attempt to Steal the Election For Hillary?
4|5|Black Friday Zombies 2016
4|2|Black Lives Matter Plans To Block White-Owned Businesses On Black Friday
4|3|SEASONS BEATINGS: Walmart Shopper Tries To Kick Child On Black Friday
4|5|"CEO Tries To Call Trump HlTLER, Tucker Carlson Responds Accordingly"
4|4|"Central Americans Surge North, Hoping To Reach U.S. Before Trump Inauguration"
4|5|An Emergency Warning To Donald Trump
4|4|Another Pro-Trump Hate Crime Deemed A Hoax
4|5|Video: Butt-Hurt Losers Demand Election Recount!
4|4|Proof Donald Trump Won The Popular Vote
4|2|Proof Communism Is Cancer!
4|3|Trump Calls For National Unity In Thanksgiving Video
4|2|Terrorists Across The Globe Know Our Border Is Open
4|5|Holiday Gridlock: Govt Failure By Design
4|3|Lying About Trump: CNN Breaks The Record
4|4|Video: CNN Attacks Alex Jones
4|4|German Intel Officer Arrested Over Islamist Plot to Bomb Agency Headquarters
4|4|Surveillance State On Steroids Beginning December First
4|5|Video: CNN Anchor Urges American Women to Wear Hijabs
4|1|Media Characterizes Mean Tweets as More Dangerous Than Islamic Terror After Ohio Attack
4|3|Trump Considering Bilderberg Globalist for Sec State
4|2|"Dem Civil War: MSNBC Unloads On Shrill, Unhinged Elizabeth Warren"
4|2|Fact Check: Trump Right About Illegals Voting
4|1|Breaking: Hillary Proposed Anti-Flag Burning law way before Trump
4|4|Trump Trolls Media into Savaging Hillary Clinton
4|3|Rand Paul: Hiring Petraeus Would Be Like Hiring Hillary Clinton
4|4|Video: College Kids Choose Castro Over Trump
4|2|Report: Hillary Planning Yet Another Run For President in 2020
4|2|Trump Adds Antitrust Expert to Justice Transition Team
4|3|Philippine President Dutertes Motorcade Attacked by Militants
4|4|Trump Was Right About Somali Migrants
4|1|Republican-Led Congress Oversees Large-Scale Importation of Somali Migrants
4|3|Infowars Surges 31 Spots In Media Site Rankings  In One Month
4|4|Cologne Plans Helicopters & Mounted Police To Prevent Mass Sex Assaults On NYE  Report
4|2|OHIO STATE ATTACK: Twitter EXPLODES On John Kasich For Opening States Borders To Refugees
4|5|"Hillary Lawyer Calls On NC GOP Governor To Stop Recount Despite Tighter Race Than WI, MI & PA"
4|1|Furious Democrats Blast Steins Recount Effort As Nothing But A Scam
4|2|Why Are So Many Among The Elite Building Luxury Bunkers In Preparation For An Imminent Apocalypse?
4|4|Left Moves to Invoke 25th Amendment
4|2|Filmmaker Outraged White Cop Praised as Hero For Shooting Somali
4|4|"Shock Photo: Border Agents Life Saved by Gun Magazine, Bulletproof Vest"
4|5|Jill Stein is a Complete Idiot
4|2|CIA Admits They Are Behind Fake News
4|1|Alex Jones: The Secrets of the Universe
4|5|Roger Stone: Trump to Reduce Federal Land Holdings
4|2|Cuban NFL Star Savages Castro-Loving Kaepernick In Miami Showdown
4|5|Report: Trump to Fire Romney on Tuesday
4|1|Ohio State University is a Gun Free Zone
4|1|Thousands of Vets Protest US Flag Removal at Mass College
4|1|Report: Trump Furious At Aides Romney Push-back Sabotage
4|4|Police Detonate I.E.D. Outside U.S. Embassy In Manila
4|3|Canada Celebrates Hijab-Wearing News Anchor While Christian Crosses Are Banned
4|3|Reince Priebus Suggests Clinton Campaign Backing Off Election-Night Agreement to Concede
4|5|Fidel Castro Supporter Colin Kaepernick Greeted By Thunderous Boos In Miami [VIDEO]
4|5|Economist Steve Moore: If Election Results Are Overturned We Will Be looking at Civil War
4|5|Italys Minister Of Interior: Surrender Your Homes To Migrants Or Face Jail
4|2|FAKE NEWS: Media Spreads False Ivanka Trump Quote About Macing The Donald
4|3|Is This The Democrats Real Strategy In Launching Recounts?
4|4|What It Feels Like To Be Homeless For The Holidays In America
4|5|Trump: I Won Popular Vote If Illegal Voters Excluded
4|1|The Democrats real strategy in launching recounts
4|3|"Trump Has Won, But the Battle Has Just Begun"
4|3|Trump to Pressure Foreign Leaders to Probe Clinton Foundation
4|2|Even Obama Slams Steins Recounts: The Results Accurately Reflect The Will Of The American People
4|3|Rubio: Obamas response to Castro death pathetic
4|3|Trumps Brutally Honest Castro Statement Proves Hes No Obama
4|3|Flashback: Clinton Said Not Accepting Election Results Was Horrifying [VIDEO]
4|5|Trump launches furious morning Twitter rant at Hillary
4|3|"Washington Post Disgracefully Promotes a McCarthyite Blacklist From a New, Hidden, and Very Shady Group"
4|2|Nigel Farage: I fear for my life
4|5|Texas state trooper hit by gunfire from Mexico
4|1|Danger: Bureaucracy Growing More Powerful Than Congress
4|2|Socialists risk getting pulverized in 2017 election
4|4|"Japan scrambles aircraft in response to China fighters, bombers"
4|1|Whereabouts of Julian Assange Remain a Mystery
4|1|Secrets of Castros Death and Life Revealed
4|4|Is the Alt-Right Dead?
4|4|"Bombshell: Trump Declares Castro a Brutal, Oppressive Dictator"
4|3|White House Announces Support For Women In Military Draft
4|1|Yahoo News Columnist Wants Schools to Indoctrinate Kids to Trust Mainstream Media
4|4|Morons Opposing Trump Cant Answer Simple Questions
4|1|"The Truth About Mad Dog Mattis, Trumps Defense Secretary Pick"
4|4|Petition To Overturn Democratic Election Now Most Popular EVER
4|2|Alex Jones Responds to Anderson Coopers Attack on Infowars
4|2|Democrat Reps Warn: Demise of Party Imminent
4|3|Video of Obama Making Fun of Trump Backfires
4|5|Video: Driver Livestreams Own Car Crash at 115 MPH
4|2|Congressman: Dems Stalling Recount in Wisconsin to Steal Electoral Votes From Trump
4|5|Video: OSU Students Blame Racist America For ISIS Terror Attack
4|3|"Trump: No Global Flag, No Global Currency, No Global Citizenship"
4|4|"14,172 Syrian Refugees Admitted This Year Through November; 98.9% Are Muslims"
4|4|Columbia U Prof: Stop Calling All White People Who Disagree With You White Supremacists
4|3|A Generation That Has Never Been Told No' Daniel Hannan Destroys Anti-Trump Protestors Safe Spaces
4|2|Facebook suspends user over American flag image
4|4|Its A Hate Crime: Black Teens Hospitalize White Trump Voter
4|3|"No religious icons during Christmas, colleges tell students"
4|4|Alex Jones: Thank God Hillary Did Not Win
4|1|Breaking: Dem Operative Confirms Electors Plot to Sabotage Trump
4|5|Watch: Tucker Carlson Owns Islamic Professor
4|3|Defiant Obama Continues Provoking Russia
4|1|Video: Ex-Cop Astonished After Taking Medical Marijuana for Parkinsons
4|3|"Kellogg Foundation Donates to Radical BLM, But Calls Breitbart Racist"
4|5|Trump has chosen retired Marine Gen. James Mattis for secretary of defense
4|3|Guns N Roses Invite Mexican Fans on Stage to Beat Trump Pinata
4|3|H.S. Students Recreate $750 Medication For Only $2
4|3|Report: 15 Electors Will Refuse to Vote For Trump
4|2|PIZZAGATE: The Bigger Picture
4|4|"Psychedelic Mushrooms Could Treat Anxiety, Depression"
4|2|Fake News: How the MSM Destroyed Themselves
4|4|FAKE NEWS: Newsweek Admits They Didnt Proof Read Madam President Issue; They Didnt Even Write It
4|4|Record Cold Coming to Almost Entire USA
4|5|Slovakia Passes Law to Prevent Islam From Registering as a Religion
4|1|Obama Blames Democrat Losses on Fox News in Every Bar and Restaurant
4|2|SHOCK: Amnesty International Blasts Kelloggs for Child Labor
4|2|"Oregon school district bans Santa, religious-themed Christmas decorations"
4|4|These numbers should SHUT UP liberals about the Electoral College once and for all
4|4|French Lawmakers Debating Bill to Criminalize Online Pro-Life Advocacy
4|1|Tucker Carlson Interviews Goofy Jill Stein Campaign Manager About Election Recount...
4|4|Hillary seeks volunteers for Michigan recount
4|4|Twitter Threatens To Kill Trumps Account
4|1|Islam: War on Women and Western Society
4|4|CNN: Alex Jones Leader of The KKK
4|5|Video: Carrier Employee Thanks Trump For Being Able to Keep His Job
4|4|CNN Caught In Biggest Lies Yet Against The American People
4|2|Report: The Guardian Publishes Fake News From Notorious Internet Troll
4|1|Texas to Require Burial or Cremation of Aborted Fetuses
4|3|NATO Now in Declared War With Russia!
4|2|Ohio State University Terrorist Was a Social Justice Warrior
4|3|Out-of-Touch Dems Re-elect Pelosi
4|4|What They Arent Telling You About The OSU Terrorist Attack
4|5|WATCH: CNNs Anderson Cooper Scared Trump Reads Infowars
4|2|Charlotte Braces For Riots After Officer in Keith Scott Shooting Escapes Charges
4|2|The Left Defends Terrorism
4|2|Trump: Ohio Attacker Should Not Have Been In US
4|4|Green Party Disowns Jill Stein Over Hillary Recount
4|5|"Trump, Castro, or Death?"
4|4|Report: Apple Purges Breitbart News App From iTunes Store
4|1|Trump Quits All Business To Focus On Presidency
4|2|"Navy Vets Home Vandalized, Torched by Anti-Trump Extremists"
4|3|OPEC Agrees to Cut Production in Drive to End Global Glut
4|2|POLL: 27% of Europeans Say Rape Is Justifiable
4|3|White House Warns Against Blaming Religion of Islam After Ohio State Attack
4|1|San Antonio Police Officer Executed While Writing Traffic Ticket  Suspect/ Black Man in Black Car
4|4|Stevie Van Zandt Calls Out Cast of Hamilton For Bullying Its Audience
4|5|Obama: I Will Criticize Trump if Necessary or Helpful
4|4|"We Are Being Set Up For Higher Interest Rates, A Major Recession And A Giant Stock Market Crash"
4|1|No Hate Crime Charges For Thugs Filmed Beating White Boy Trump Voter in Chicago
4|5|Woman posted false sexual assault claim because she was distraught over the recent election
4|2|Emergency Message To Leftists From Trump / Steve Bannon
4|1|War Breaks Out Between Neo-Cons And Libertarians Over Trumps Foreign Policy
4|2|Ron Paul Reveals Hit List Of Alleged Fake News Journalists
4|3|Obama Says He Cant Pardon Snowden Unless Whistleblower Goes To Court
4|3|"BarackObama.com: Fight, Were Not Backing Down"
4|3|Merkel Tells Party Ready To Seek Fourth Term As Chancellor
4|1|Tony Blair Returning To Politics In Attempt To Influence Brexit
4|3|Marine Le Pen Takes Huge Lead Over Nearest Rival In New French Presidential Election Poll
4|5|Why Feds Are Banning Fireplaces And Wood Stoves
4|1|Proof: Wholesome Americana Thrives Despite Increasingly Vicious Left
4|1|ALEX GO F**K YOURSELF!! Screamed The Tolerant Liberals
4|4|Austin Commie Triggered by Infowars Reporter
4|2|Tolerant Non-Violent Left Strikes Again!
4|2|Putin Vows to Choke NATO if it Continues Encirclement of Russia
4|2|Stone on Trump Cabinet Picks: Team of Nationalists
4|2|Alex Jones Harassed & Threatened With a Gun For Supporting Trump
4|5|Poll: Europeans Turning Against EU
4|4|House Democrats in Disarray as Ohio Congressman Challenges Pelosi
4|3|UK Passes the Most Extreme Surveillance Law in the History of Western Democracy
4|1|Trump Demands Apology after Vice President Harassed at Broadway Musical
4|4|Fake News Alert: Bloomberg Editor Creates Libelous Trump Tweet Out of Thin Air!
4|4|Left Calls For Internet Kill Switch To Stop Right
4|3|News Reporter Fired For Supporting Trump
4|4|Steve Bannon Interviewed: Its About Americans Not Getting Fed Over
4|4|Trumps Digital Director: Twitter CEO Personally Censored Our Campaign
4|1|"Rand: Im Comforted by Flynn Saying Iraq War Was a Mistake, Iran Deal Misinterpreted"
4|3|Climate Changists Throwing Fits Over Trumps EPA Pick
4|2|Black Homeless Woman Says Trump Allowed Her to Live in Trump Tower Rent Free For 8 Years
4|5|VIDEO: Mark Dice Guts New York Times After They Smear Him as Fake News
4|3|"Trump Effect: U.S. Steel Prepared to Bring Back 10,000 American Jobs"
4|5|Michael Moore Predicts Trump Will Quit Before Inauguration Because He Is Bummed Out By Amount Of Work
4|2|Barbaric Migrants: African Sets Wife On Fire In German Street
4|4|Obama Tells Military No Successful Foreign Attacks On U.S. Soil
4|4|Trump: One Thing Will Truly Unite The Country
4|3|Angela Merkel Says Germans Need to Integrate With Multiculturalism
4|4|Facebook Already Blocking Links to Fake News
4|2|"Washington Post Appends Russian Propaganda Fake News Story, Admits It May Be Fake"
4|1|"Pope Pontificates on Fake News, Calls It a Sin and Likens It to Sexual Arousal from Excrement"
4|1|Afghan Migrants Use Belts As Whips to Attack Austrians at Christmas Celebration
4|4|SHOCK VIDEO: Migrant Kicks German Woman Down Subway Stairs
4|5|Detroit recount observer: Box marked 306 ballots  only had 50 inside
4|2|Watch: The Shocking Proof That Multiculturalism Has Failed
4|1|NPR Guest: Alex Jones a gateway drug to white supremacy
4|2|Lewandowski: Trump Has Done More For U.S. in 4 Weeks Than Obama in 4 Years
4|3|The Ultimate Fake News List
4|1|Filmmaker Joel Gilbert: Obama to Continue Leftist Revolution After Presidency
4|1|Insider: Trump To Pull Plug On Fake Climate Change Agenda Make US Energy Independent
4|4|"Fake News: Mediaite Claims CNN, Megyn Kelly More Influential Than Drudge"
4|1|Exclusive: Obamas Biggest Secrets Released
4|3|Trump Supporters Shatter Mainstream Media Narrative
4|1|Time Urges 65 Million Americans Who Voted For Hillary Not To Pay Taxes
4|3|We Are Under Economic Sabotage!
4|4|Methodist Churches Converting to Virtual Mosques For Muslim Migrants
4|1|"Brexit Referendum Not Legally Binding, UK Supreme Court Told"
4|4|Donald Trump Selected as Time Magazines Person of the Year
4|5|"Trump Speech Highlights: Fayetteville, North Carolina"
4|3|James OKeefe: The Mainstream Media is Dead  We Killed It.
4|3|France Passes Crackdown on Pro-Life Websites
4|2|Single Border Patrol Sector Catching 500 Illegals A DAY: They Want To Get Caught
4|3|"TPP Dead, Now Stop PPP  Crony Capitalism by Another Name"
4|4|Video: Reporter Shows Disgruntled Hillary Voters Path to Canada
4|5|This Video Proves The Media is Lying About Trump
4|2|"Obamas Brother Calls for Boycott of CNN, MSNBC, New York Times"
4|5|Assaulted Trump Supporter Speaks Out
4|2|Trump Pulls World From Brink Of Nuclear War: Soros Outraged
4|4|"Soros, Liberal Billionaires Meet in DC to Plan War on Trump"
4|4|Pence Purges Christie-Selected Lobbyists From Transition Team
4|3|Rand Paul Warns Some Trump Cabinet Candidates Are Unfit For Government
4|2|Lamestream Media Suddenly Cares About Free Speech!
4|5|Wheres Hillary...? Creeping Around Children
4|5|SHOCKING: Trump Racism Caught on Camera!
4|5|Neocon Invasion of Team Trump Fully Underway
4|1|SPLC Celebrates Twitters Free Speech Purge After Alt-Right Accounts Banned
4|2|Media Has Hissy Fit Over Trump Attending Private Dinner With His Family
4|3|Defcon Nuclear Threat REDUCED To Safest Level Following Donald Trump Victory
4|3|Registered Democrat Arrested For Slamming Trump Protester Down Stairs
4|1|Twitter Initiates Mass Purge Of Prominent Alt-Right Accounts Following Trump Victory
4|2|"Ann Coulter: Appropriate Reaction to Those Calling Bannon Anti-Semitic, Racist  Screw You"
4|5|Glenn Beck: We Are Racist If We Accept Steve Bannon in the White House
4|1|"Youre Not Getting My Name, Youre Getting An F-You! Based Female Trump Supporter Scolds MSNBC Host"
4|2|"Man Wearing Donald Trump Make America Great Again Hat Choked, Pinned On NYC Subway 5 Train"
4|5|Whistleblowers Elected Trump: He Should Pardon Them
4|1|Infowars Announces Fake News Analysis Center
4|5|Austin Communists Arrested for Attacking Trump Supporters
4|3|Anti-Trump Rioters Protest Constitution
4|4|"Bergdahl: Obamas Hero, Americas Traitor"
4|4|Dear Protesters (The United Hates Of America)
4|1|Video: Morons React to Trump Winning
4|4|PROOF  The Trump protests utilizing paid professional protesters financed by George Soros
4|2|Drunk Driver Blames Crash on Trump
4|5|Washington Post Fake News: Secret CIA assessment says Russia was trying to help Trump win White House
4|4|The Intercept: A Clinton Fan Manufactured Fake News That MSNBC Personalities Spread to Discredit Wikileaks Docs
4|4|"Joe Scarborough: Hillary Clinton Cost Hillary Clinton the Election, Not Fake News"
4|4|Yahoo Spreads Fake News Story About Hillary Getting Most Votes Ever
4|5|"Trump: Companies That Leave U.S. Will Have a Very, Very Substantial Tariff or Tax to Pay"
4|5|STUDY: 77 percent of Trumps general election news coverage was negative
4|3|Hillary Clintons losing campaign cost a record $1.2B
4|4|BOOM: Trump offered to buy Hillarys election night fireworks!
4|1|Breaking! Drudge Report Bombshells Live
4|4|The End of Alt-Media = The End of Trump!
4|4|Trump Supporters Fight Back Against The Establishment
4|5|Fake News: Newsweek Retracts Claim Trump Supporters Booed John Glenn
4|5|Hillary Supporters Issue Death Threats to Trump Senior Advisor
4|3|Max Keiser Joins Infowars In Studio
4|1|Report: Hillary Ignites Soros-Funded Purple Revolution Against Trump
4|3|Here She Comes To Save The Day!
4|3|Reddit Shadow Bans Infowars As Fake News War Accelerates
4|5|"Video: Sheriff Blasts Lefty Lawyer  Hands Up, Dont Shoot Was FAKE NEWS"
4|2|Michael Moore: Something Crazy Could Happen to Stop Trump Becoming President
4|2|Hillary Clinton  The Queen of Fake News  Lectures Americans About Fake News
4|1|Anti-Sharia Dutch Leader Wilders Defiant of Hate Speech Conviction
4|5|Mississippi Governor: No Syrian Refugees For Us Until D.C. Takes Some
4|5|Rep. Tulsi Gabbard Introduces Stop Arming Terrorists Act
4|1|South Korean President Impeached After Populist Uprising
4|4|Orange Coast College Teacher Calls Trump Victory Act of Terrorism
4|4|AJ Responds To Steven Colbert NPR and the rest of the Fake News
4|2|Video of the Day  Congressman Calls Tucker Carlson a Russian Agent on Prime Time Television
4|2|Internet Users Lash at Hillary Clinton for Comments About Fake News Epidemic
4|3|Black lawyer: Free anyone charged with murdering whites
4|4|OSU Activists Complain Terrorist Was Wrongly Shot By Police
4|2|Video: Mexican Politicians Bash Donald Trump Pinata
4|1|Brian Williams Complains About Fake News After Losing Job for Fake News
4|1|Washington Post Fake News: Secret CIA assessment says Russia was trying to help Trump win White House
4|3|The Intercept: A Clinton Fan Manufactured Fake News That MSNBC Personalities Spread to Discredit Wikileaks Docs
4|5|"Joe Scarborough: Hillary Clinton Cost Hillary Clinton the Election, Not Fake News"
4|5|Yahoo Spreads Fake News Story About Hillary Getting Most Votes Ever
4|3|"Trump: Companies That Leave U.S. Will Have a Very, Very Substantial Tariff or Tax to Pay"
4|1|STUDY: 77 percent of Trumps general election news coverage was negative
4|1|Hillary Clintons losing campaign cost a record $1.2B
4|2|BOOM: Trump offered to buy Hillarys election night fireworks!
4|3|Breaking! Drudge Report Bombshells Live
4|4|The End of Alt-Media = The End of Trump!
4|1|Trump Supporters Fight Back Against The Establishment
4|4|Fake News: Newsweek Retracts Claim Trump Supporters Booed John Glenn
4|5|Hillary Supporters Issue Death Threats to Trump Senior Advisor
4|2|Max Keiser Joins Infowars In Studio
4|1|Report: Hillary Ignites Soros-Funded Purple Revolution Against Trump
4|4|Here She Comes To Save The Day!
4|2|Reddit Shadow Bans Infowars As Fake News War Accelerates
4|4|"Video: Sheriff Blasts Lefty Lawyer  Hands Up, Dont Shoot Was FAKE NEWS"
4|4|Michael Moore: Something Crazy Could Happen to Stop Trump Becoming President
4|2|Hillary Clinton  The Queen of Fake News  Lectures Americans About Fake News
4|2|Anti-Sharia Dutch Leader Wilders Defiant of Hate Speech Conviction
4|5|Mississippi Governor: No Syrian Refugees For Us Until D.C. Takes Some
4|1|Rep. Tulsi Gabbard Introduces Stop Arming Terrorists Act
4|3|South Korean President Impeached After Populist Uprising
4|2|Orange Coast College Teacher Calls Trump Victory Act of Terrorism
4|1|AJ Responds To Steven Colbert NPR and the rest of the Fake News
4|1|Video of the Day  Congressman Calls Tucker Carlson a Russian Agent on Prime Time Television
4|4|Internet Users Lash at Hillary Clinton for Comments About Fake News Epidemic
4|5|Black lawyer: Free anyone charged with murdering whites
4|2|OSU Activists Complain Terrorist Was Wrongly Shot By Police
4|1|Video: Mexican Politicians Bash Donald Trump Pinata
4|5|Brian Williams Complains About Fake News After Losing Job for Fake News
4|1|When will Alex Jones lose credibility?: Dem Analyst Claims Infowars Fake News
4|5|"Its Official: Flynn, Pompeo and Sessions in Trumps Cabinet"
4|3|Harry Reid: Republican Operative James Comey Responsible for Clinton Loss
4|4|Man Arrested for Death Threat Against President Elect Trump
4|4|Obama Pushes Fake News Talking Point; Its A Threat To Democracy
4|4|Tale of Two Cities: Russian City Honors Trump While NYC Censors Trump Signs
4|4|The Mainstream Medias Fake News Narrative is Already Beginning to Collapse
4|4|Ryan Claims Hes a Fan of Term Limits  After His 10th Term
4|3|Soros & Hillary Launch Purple Revolution Against Trump
4|1|Anti-Trump Protesters Threaten to Put a Bullet in the Brain of Michigan Elector
4|1|Shock Video: Police Force 80-Year-Old Italian Hotel Owner to House African Migrants
4|5|"Why We Are Still In The Danger Zone Until January 20th, 2017"
4|4|More Winning  Ford CEO Calls Donald Trump: Lincoln Plant Will Stay in Kentucky...
4|1|DISGRACEFUL. Michael Shannon To Trump Supporters: Its Time To Die
4|2|"Twitter User Replaces Word White With Black, Gets Banned"
4|2|Calling All Trump Supporters Racist is Hypocritical... Says Jon Stewart?!
4|3|Police: Anti-Trump Protester Punched Officer in Face in San Diego
4|5|Clintons Begging Trump To Stop Investigation of Hillary Through Chelsea
4|1|"Alex Jones: The Media is a Joke, We Have Won"
4|4|Backlash After De Blasio Staffer Posts F*** WHITENESS Photo
4|3|"CBS, CNN, Salon Caught Creating Fake News"
4|2|Starbucks Calls Cops After Customer Requests Trump Name on Cup
4|1|"Majority of America Rejected Hillary Clinton, NYT Maps Show"
4|1|Video: The Truth About Fake News
4|3|Anti-Trump Left Pushing Pedophile Rights
4|3|Ultimate Fail Compilation: SNL Predicts President Hillary Clinton
4|4|"Climate Report to UN: Trump right, UN wrong  Skeptics Deliver Consensus Busting State of the Climate Report to UN Summit"
4|1|Trump Campaign Manager Slams Snowflake Millenials For Protesting Trump
4|1|"Media Caught Promoting Fake Racism, Hiding Real Racism"
4|1|Mainstream Media Is A Cult Of Racist Mind Control
4|1|QuantCast Blacklists Infowars as Fake News Free Speech Purge Accelerates
4|2|Hillary Re-Emerges Looking Like Death Warmed Up
4|4|CBS Labels Infowars a Fake News Website
4|2|Trump Nominates Ben Carson As Housing Secretary
4|4|"UK uses museum tanks, civilians to simulate Putin launching WWIII  reports"
4|1|Italy Votes Against EU Takeover As Globalism Implodes
4|4|ISIS declares WAR on Trumps inauguration day calling it BLOODY FRIDAY
4|4|EU parents of daughter raped/murdered by Muslim migrant COLLECT FUNERAL DONATIONS FOR MIGRANTS
4|4|Chris Wallace Absolutely Roasts Jill Stein on Her Recount Scam
4|2|REPORT: Technology Has Made Us Ugly
4|1|Breaking: Italy PM Renzi says he will resign following referendum defeat
4|4|Moderate Rebels Admit al-Qaeda Ties As Trump Discusses Ending Support
4|4|Obama TV: Is Obama Planning A Fake News Outlet Of His Own?
4|3|A Very Concise Explanation Of Why The Democrats Lost (And Will Keep Losing)
4|1|"The Vote In Italy Will Be A Wide-Ranging F**k Off, And Its Just The Start..."
4|3|"Putin: Trump is smart, will soon be aware of different level of responsibility"
4|1|Obama: Weve Made Health Care More Affordable for All Americans
4|2|Recount Collapses: Jill Steins Failure in Pennsylvania Means No Overturning Donald Trumps Ascension To Presidency
4|2|"Trump Refuses to Bow to Chinese Communist Threats, Re-establishes Ties with Taiwan"
4|1|"Ford Willing to Work With Trump If Policies Are Right, CEO Says"
4|5|Donald Trump Targets Second Indiana Plant Over Plans to Shift to Mexico
4|2|Trump Delivers Deathblow to Globalism
4|2|Congress Authorizes Ministry of Truth Powers for State Department
4|5|PIZZAGATE: The Mysterious Death Of A Human Trafficking Investigator
4|4|Congress Launches Program to Take Over and Shut Down Independent Media
4|3|Kellyanne Pistol Whips Robby Mook: Biggest Piece Of Fake News In This Election Was That Trump Couldnt Win [VIDEO]
4|2|Former Immigration Officer: Many Illegals Can Vote with Fake Documents
4|2|Blair Gifts Money to Set up New Anti-Populist Institute
4|3|Trump invites Philippine president who called Obama a son of a b**** to visit the White House
4|2|Donald Trumps break with US policy in phone call to Taiwan president risks China fury
4|5|Spoiler Alert! Yuge Trump Announcement Leaked Early
4|1|Watch Trump Make Obama Look Clueless
4|1|Alex Jones: We Now Know The Globalist Attack Plan Three Weeks After The Election
4|4|Darknet Site Takes Donations for Trump Assassination
4|4|Buzzfeed: White People Are A Plague To The Planet
4|4|"Sweden charges 5 teenage refugees with beating, gang-raping boy for over an hour"
4|2|No! Dont Touch Me! German Police Release Shocking Footage From Cologne On New Years Eve 2015
4|3|"Proof That The Elite Really Do Want A Global Society With No Possessions, No Privacy And No Freedom"
4|1|Support for Abolishing Electoral College Hits Historic Low in Gallup Poll
4|3|Trumps Truth Bombs Neuter the LieStream Medias Fading influence
4|1|Desperate: Merkel Hijacks Populism to Stay in Power
4|1|Self-proclaimed Hack Journalist Calls on Social Media to Censor fake news
4|4|Wikileaks: Colbert Report Gave Clinton Foundation Control Over Production
4|3|Whos Behind The Fake News
4|5|Hate Speech: Facebook Bans German Woman For Posting Picture of Migrant Rapist
4|5|"Update: Trump Up By 70,000 Votes in Wisconsin Recount So Far"
4|2|Open Borders: Grab Bag of Valid U.S. Visas Available Overseas
4|3|Mike Huckabee Guts Elitist Pelosi in Savage Viral Tweet
4|5|Fake News: CNN Runs Segment Suggesting Trump Will Put Muslims In Internment Camps
4|1|Trumps America: GOP Congressman Preps National Concealed Carry Bill
4|1|Bank Chief Warns Robots Could Replace Half of British Workforce
4|4|Angela Merkel Calls For Burka Ban
4|3|"Vote Fraud in Michigan Favored Hillary Clinton, Not Trump"
4|1|EU Demands Social Media Websites Censor Fake News Within 24 Hours
4|4|Report buried Trump-related hate crimes against white kids
4|1|Despicable: UNs Top Human Rights Body Holds Minutes Silence For Fidel Castro
4|5|"German State Media Refuse to Run Migrant Murder Story, Say Its Too Regional"
4|5|Trump Supporter Has His Truck Torched & Sprayed With Anti-Trump Slogans While at Christmas Party
4|4|Its Not Over: Rogue Republican Elector Announces He Will Not Vote For Trump And Urges Others To Join Him
4|1|"The Philly Recount is Done, and it Didnt Help Hillary Much at All"
4|1|Video: Tim Allen Slams Microaggressions on College Campuses
4|3|Pizzagate Is A Diversion From the Greater Crimes in Podesta Wikileaks
4|2|Clueless Pelosi: I Dont Think People Want New Direction
4|5|Why Clintons Must Face Justice
4|4|"WATCH: Liberals Agree Nothing Wrong with Incest, Totally Normal"
4|5|My Interview with Former CBS Star Reporter: Fake News
4|4|Trump Goes High: Wants Hillary to Heal Rather than In Prison
4|1|Whats Ahead for Civil Liberty in a Trump Administration
4|1|"Trump Overrides Media, Takes Message on Jobs Straight to Public"
4|5|"Tim Allen: Hollywood Calls Trump a Bully, Then Bullies Anyone Who Supports Him"
4|2|Hard-Pressed Blacks Leaving Democratic Party
4|2|Leaked Document Shows Trump Does Actually Plan to Build a Wall
4|4|"European Union Army Set For Creation, UK to Fund Despite Brexit"
4|5|Fukushima Reactor Cooling System Stops Following Quake & Tsunami
4|4|U.S. Stocks Hit Highs as Oil Jumps; Yen Rises on Tsunami Warning
4|3|Ex-Diplomat: Trumps Election Proves Mainstream Media Worthless
4|5|Day One of Trump Presidency: Withdraw From the TPP
4|4|Obama Admin Fines Police Department For Not Hiring Non-Citizens
4|1|"When It Comes to Fake News, the U.S. Government Is the Biggest Culprit"
4|4|When Americans Shall Say Peace And Safety...
4|4|"Fake News Site CNN Completely Misrepresents Quote, Rest of Lying Media Runs With It"
4|3|President Elect Slams Smug Media in Face-to-Face at Trump Tower
4|3|"Obama Declares War on Infowars, Breitbart"
4|1|Note Making Fun of Butt-Hurt Leftists Deemed a Hate Crime
4|5|Global Establishment Assails Rise of Populism
4|3|Massive New Fukushima Earthquake: Giant Tsunamis Making Landfall
4|5|Earthquake Strikes Near Radioactive Fukushima Plant
4|1|"Video: Dear Blacks, Latinos & Gays"
4|5|Social Justice Warriors Explain Safe Spaces
4|3|BREAKING: Terrorist Attack In Times Square Prevented
4|3|College professors call for Pro-Trump students to be expelled
4|4|Parents of Murdered DNC Staffer Seth Rich Beg Public for Help
4|4|96% Hopeful: Polls Show Tremendous Confidence in President Trump
4|3|"Democratic Party Going Extinct, Admits Dem Rep"
4|2|Bombshell Report: Border Agents Ordered To Leave Floodgate Open
4|3|Armed Communists March In Austin And Democrats Dream Of Banning Alex Jones
4|4|Watch: SNL Gives Butt-Hurt Anti-Trumpers Their Own Safe Space
4|3|BET Founder: Give Trump a Chance
4|5|9/11 Mastermind: Al Qaeda Favors Immigration To Defeat USA
4|4|Reddit Bans Pizzagate  We Dont Want Witchhunts On Our Site
4|4|"Rush Limbaugh: Liberals, Democrats Are Now Genuinely Mentally Ill"
4|2|Former Sanders Spokeswoman: We Dont Need White People Leading The Democratic Party
4|1|"Business Owner Refuses Service to Racist, Sexist, Fascist Trump Supporters"
4|3|Roger Stone: Trump Must Bring Hillary Clinton To Justice
4|5|Why The Hamilton Pence Feud Is Total BS
4|4|Most Tense Family Thanksgiving Ever
4|2|Secret To Trump Victory Revealed!
4|4|Russian TV: Infowars Is The Most Influential Media Outlet In America
4|1|Anti-Trump Protesters: A Lesson in Cognitive Dissonance
4|2|Fake Corporate News Media Calls All Other News Fake
4|3|Shock: Majority of Americans Wont Shop Black Friday
4|4|Mass Murder by Bus? What If It Was a Gun?
4|4|Anti-Trump Protesters Chant For More Cop Killings After Spate of Nationwide Murders of Police Officers
4|5|"Hawking: If We Find Aliens, We Should Not Communicate With Them"
4|2|Huckabee: Trump Appointing Romney Would Be A Huge Insult To Voters
4|5|Wayne State Officer Shot in Head Amid Anti-Police Shootings
4|2|Clinton Recount Effort Debunked Before it Even Began
4|4|Trump Era: Turkey Considering Shanghai Cooperative Instead of EU
4|4|How Trump Destroyed Mainstream Media Forever
4|4|Sanders Electors Vow To Vote Against Clinton In Wild Attempt To Keep Trump From White House
4|4|New Surveillance Tape In Seth Rich Murder Case
4|4|CNN: SPLC Editor Says Drain The Swamp Is Racist
4|4|"Hateful Trump Notes Allegedly Aimed at Student Were Fabricated, University Says"
4|3|Dalai Lama Has No Worries About President-elect Donald Trump
4|4|She Doesnt Want to be White Anymore: 12yo Girl Bullied at Kansas City School for Being White
4|1|Young Turks Push Alex Jones Off Stage  Again!
4|4|"Special Report: Kanye West Has Been Kidnapped, Placed In Mental Hospital"
4|3|Trump Nearly Triples Number of Muslim Voters Compared to Romney
4|1|60 Minutes: George Soros Is Proud Of Using Nazis
4|1|Breaking! Trump Criminal Investigation Still on The Table
1|1|Noam Chomsky Announces Las Vegas Residency
1|1|Horrified Investigators Find Unresponsive Legislative Body In Capitol Building
1|1|Obama Transformed Into 20-Foot-Tall Monster President After Being Doused With Job-Growth Chemical
1|1|Rubio Campaign Hires New Candidate In Top-Level Staff Shakeup
1|1|Vatican City Residents Rally To Save St. Peters Basilica From Development
1|1|Obama Tells Nation To Just Chalk Up Today As Loss
1|1|Parallel World Leaders Meet In Washington For Interdimensional Summit
1|1|Dazed Marco Rubio Wakes Up In Koch Compound To Find Cold Metal Device Installed Behind Ear
1|1|Disney World Opens New Ordeal Kingdom For Family Meltdowns
1|1|Pentagon Holds Gala To Celebrate 25 Years Of Bombing Iraq
1|1|Khalid Sheikh Mohammed Reluctantly Accepts Alternative Sentence Of Coaching Troublesome Youth Sports Team
1|1|You To Still Die One Day
1|1|Monsanto Lab On Lockdown After Scientists Find Shattered Tomato Containment Unit
1|1|Coca-Cola Marketing Strategist Named New United States PR Laureate
1|1|Vatican Tour Group Catches Glimpse Of Pale, Emaciated Joseph Ratzinger Scuttling Into Dark Catacombs
1|1|Assault Rifle In Iraq Losing Track Of How Many Times Its Switched Sides During War
1|1|Ted Cruz Dressed For Campaign Rally By Swarm Of Loyal Vermin
1|1|New OSHA Regulations To Cut Down On Workplace Mutations
1|1|Officials Starting To Think School Just Not Nations Thing
1|1|Hollywood Stars Overthrown In Bloody C-List Uprising
1|1|FBI Convinces George Clooney To Wear Wire During Clinton Fundraising Dinner
1|1|Passersby Stop To Stare At Man Leading Sad Life Through Open Apartment Window
1|1|ExxonMobil CEO Relieved It Finally Too Late To Do Anything About Climate Change
1|1|Shimmering Immaculate Republican Candidate Appears Before GOP Officials
1|1|New Royal Caribbean Cruise Just 12-Day Buffet On Floor Of Empty Dockside Warehouse
1|1|Struggling Nation Sends Middle Class To Go Live With Canadian Government For A While
1|1|Mattel Releases New Male Barbie To Inspire Girls To Imagine Holding Highest Leadership Positions
1|1|Scientists Slowly Reintroducing Small Group Of Normal, Well-Adjusted Humans Into Society
1|1|Nation Comes To Halt To Watch Crane Move Massive Concrete Tube
1|1|Report: Leading Cause Of Death Still Venturing Beyond The Pines
1|1|World Makes Final Attempt To Try To Understand This Shit
1|1|Obama Receives Classified Briefing On Likelihood Of Krull Reboot
1|1|Nation Reaffirms Commitment To Things They Recognize
1|1|Hillary Clinton Appears Before Rally Completely Nude In Bid For Authenticity
1|1|I Suffer From Severe Psychological Issues And I Need The Help Of Mental Health Professionals, Says Trump In Pointed Debate Comeback
1|1|Scientists Make Discovery About Worlds Silt Deposits But Understand If You Arent Interested In That
1|1|City Of Chicago Working Around Clock To Clear 18 Inches Of Bullet Casings From Streets
1|1|Obama Finally Fulfills Campaign Promise To Spend One Night In Abandoned Amusement Park
1|1|Historians Piece Together Carnival East India Companys First Cruise In 1605
1|1|Deep-Sea Godiva Rig Taps Worlds Largest Offshore Ganache Deposit
1|1|Nation Elects First Black-Hearted President
1|1|Millions Gather Under Times Square Countdown Clock To Celebrate End Of 2016 Election
1|1|New Heavy-Duty Voting Machine Allows Americans To Take Out Frustration On It Before Casting Ballot
1|1|Nate Silver Gunned Down Attempting To Cross Mexican Border With All 2016 Polling Data
1|1|Anthropologists Discover Isolated Tribe Of Joyful Americans Living In Remote Village Untouched By 2016 Election
1|1|Psychologists Say It Perfectly Natural To Fantasize About Sandwiches Other Than One Currently In Hand
1|1|New Company Aims To Explore Intersection Of Technology, Other Thing
1|1|The Onion Humbly Offers Up Its Offices To Imprison The Women Who Have Wrongfully Accused Donald Trump
1|1|Sunny Saves Bo From Mountain Lion During Cross-Country Journey To Reunite With Obamas
1|1|Subway Breeding Program Successfully Creates Black Forest Ham/Meatball Marinara Hybrid
1|1|National Association Of Enablers To Americans: Cmon
1|1|CIA Orchestrates Coup DEtat To Replace Entire Population Of Venezuela
1|1|Man Wakes From Coma With Ability To Understand Health Insurance Policy
1|1|The Onion Has Obtained Donald Trumps Tax Returns And Has Chosen To Destroy Them
1|1|Im A Trump-Era Conservative, Says Horrifying Man 25 Years From Now
1|1|Investigators: First 48 Hours Most Critical In Locating Missing Children Who Entered Portal To Fantastical World
1|1|Hillary Clinton Bowls Over Catcher To Score Winning Run In Campaign Staff Softball Game
1|1|Seagull This Far Inland Must Be Total Fuckup
1|1|NASA Social Media Manager Considers Himself Part Of Team
1|1|Its Hard Being Away From You All, Says Donald Trump While Spreading Bird Feed Around Rooftop Pigeon Coop
1|1|Only News Source Man Trusts Has Logo Of Eyeball In Crosshairs
1|1|CDC Horrified After Discovering Existence Of Thousands Of Public Pools
1|1|7-Year-Old Unable To Maintain Single Cohesive Storyline While Playing With Action Figures
1|1|FBI Discontinues Surveillance Of Muslim Americans After Completing 15-Year Study Of Beautiful Culture
1|1|Obama Discovers Telepathic Connection With Military Drone In Afghanistan
1|1|Campaign Announces Clinton Has Entered Incubation Period After Securing Nomination
1|1|Nations Overthinkers Convene To Determine What Thats Supposed To Mean
1|1|Brazen Man Leaves Copy Of Consent To Kill By Vince Flynn Unattended In Coffee Shop While Going To Bathroom
1|1|Leaked Documents Reveal Studio Executives Knew About Gods Of Egypt Before It Released Onto Public
1|1|Mans Garbage To Have Much More Significant Effect On Planet Than He Will
1|1|Wealthy Socialite Falling For Unrefined But Beautiful Lower-Class Populace
1|1|Ayahuasca Shaman Dreading Another Week Of Guiding Tech CEOs To Spiritual Oneness
1|1|Christ Does Soft Return To Gauge Interest
1|1|13-Year-Old Excited To Learn Unemployed Older Brother Forced To Move Back Home After College
1|1|Rest Of Nation To Penn State: Something Is Very Wrong With All Of You
1|1|Report: U.S. Students Lack Language Skills, Vocabulary To Effectively Belittle Classmates
1|1|Report: Feeling Bad Right Now Most Reliable Predictor Of Feeling Bad Forever
1|1|Hollywood Refusing To Give Public Any New Movies Until It Can Appreciate Ones It Already Has
1|1|Man Just Waiting Tables Until Fundamental Structure Of U.S. Economy Changes
1|1|Newly Redesigned HillaryClinton.com Allows Users To Fully Customize Issues Page To Suit Own Preferences
1|1|New STEM Initiative Just Tries To Dissuade Students In Other Countries From Pursuing Science Careers
1|1|Precocious 4-Year-Old Already Feels Terrible About Herself
1|1|Team Of Vatican Geneticists Successfully Clone God
1|1|Incoming Class Of Subway Trainees Spends Week Practicing On Sandwich Cadavers
1|1|Diehard Trump Voters Confirm Rest Of Nation Should Stop Wasting Time Trying To Reach Them
1|1|Each Member Of Family On Edge As Vacation Has Gone By Without One Blowout Fight
1|1|I Cant Do This Anymore, Think 320 Million Americans Quietly Going About Day
1|1|Melania Trump Stumbles Upon Dozens Of Husbands Haunting, Macabre Self-Portraits
1|1|Late-Blooming Dad Just Now Getting Into Civil War History
1|1|Ayatollah Khamenei Addresses Tehran Prison Mess Hall During Annual Press Correspondents Dinner
1|1|Obama Holds Camp David Summit To Ease Tensions With Coyotes
1|1|No One Really Knows What Dad Was Doing From 1985 To 1988
1|1|Trump: Remember, This Is Your Last Chance To Get Out Before This Goes Any Further
1|1|We Get The Food And Then We Eat The Food Until All The Food Is Gone, City Of Chicago Announces Unprompted
1|1|Scientists Make Discovery About Worlds Silt Deposits But Understand If You Arent Interested In That
1|1|City Of Chicago Working Around Clock To Clear 18 Inches Of Bullet Casings From Streets
1|1|Obama Finally Fulfills Campaign Promise To Spend One Night In Abandoned Amusement Park
1|1|Historians Piece Together Carnival East India Companys First Cruise In 1605
1|1|Deep-Sea Godiva Rig Taps Worlds Largest Offshore Ganache Deposit
1|1|Nation Elects First Black-Hearted President
1|1|Millions Gather Under Times Square Countdown Clock To Celebrate End Of 2016 Election
1|1|New Heavy-Duty Voting Machine Allows Americans To Take Out Frustration On It Before Casting Ballot
1|1|Nate Silver Gunned Down Attempting To Cross Mexican Border With All 2016 Polling Data
1|1|Anthropologists Discover Isolated Tribe Of Joyful Americans Living In Remote Village Untouched By 2016 Election
1|1|Psychologists Say It Perfectly Natural To Fantasize About Sandwiches Other Than One Currently In Hand
1|1|New Company Aims To Explore Intersection Of Technology, Other Thing
1|1|The Onion Humbly Offers Up Its Offices To Imprison The Women Who Have Wrongfully Accused Donald Trump
1|1|Sunny Saves Bo From Mountain Lion During Cross-Country Journey To Reunite With Obamas
1|1|Subway Breeding Program Successfully Creates Black Forest HamMeatball Marinara Hybrid
1|1|The Onion Is Withholding Our Endorsement For President Until Both Candidates Respond To Our Questionnaire
1|1|National Association Of Enablers To Americans: Cmon
1|1|CIA Orchestrates Coup DEtat To Replace Entire Population Of Venezuela
1|1|Man Wakes From Coma With Ability To Understand Health Insurance Policy
1|1|The Onion Has Obtained Donald Trumps Tax Returns And Has Chosen To Destroy Them
"""

	_headlines = []
	_published_headlines = []

	for _raw_headline in RAW_HEADLINES.split("\n", false):
		var _headline = _raw_headline.split("|")
		var _headline_alignment = _headline[0]
		var _headline_truthiness = _headline[1]
		var _headline_text = _headline[2]
		_headlines.append({
			'alignment': _headline_alignment,
			'truthiness': _headline_truthiness,
			'text': _headline_text
		})
