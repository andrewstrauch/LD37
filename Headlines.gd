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
ALIGNMENT|TRUTHINESS|TITLE
2|3|An Open Letter to President-Elect Trump: Live Up to the Holocaust, Wants Donald Trump
2|2|It's True: The Trump Vote Was A Racist'"
2|3|Obama Tells Trump To Admit He's A Liar Or Nominate A Decent HHS Secretary Is Near Universal Horror
2|5|We Desperately Need The Media Got That Al Qaeda Warning First
2|1|Even Michael Moore to Megyn Kelly: Trump Was Sniffing All the Devices With State Dept. Emails
2|1|Evangelical Leaders Shrug At Donald Trumps Pollster Says the Election Came Down to Five Counties
2|2|Glenn Beck Says Stephen Bannon Bragged in 2015: Im Trumps Campaign Manager Waffles On If He's Owed Apology"
2|5|Kellyanne Conway Suggests Trump Protester Deserved Beating Because He Was Robbing?
2|5|Women Hit the Gym Before Trump Gets to Work With Enemy Steve Bannon
2|1|Rachel Maddow Reacts To Transition Statement On Russia To Help Trump
2|1|Lethal Coal King Don Blankenship: Im an American Political Candidates Ilhan Omar and Ahmad Rafah
2|2|Donald Trumps Win, Has the Trump Campaigns Worst Surrogate
2|1|Trump Tells Michigan Rally: 'Lock Her Up.'
2|4|An Exhaustive List Of 281 Angry Trump Tweet Targets
2|2|LeBron James Tries to Drag Hillary Clinton, and Died."
2|1|Trump Team Wants You to See Americas Most Carefully Kept Secrets
2|4|CNN's McEnany: It's Trump Supporters Behaving Badly: Assault Victims Should 'Grow A Set'
2|1|Trump Finally Pissed Off the Wrong Women. All of Us, Down"
2|4|"Ted Nugent Wants to Block a Supreme Court With Fewer Justices'
2|3|"Donald Trump Brings Four Bill Clinton Is on Drugs"
2|1|Rob Reiner On AM Joy: Anti-Obamacare Sentiment Is About The Damn Emails!
2|4|A Better Way to Stop Trump Is A Mess -- And The Trump Interview: Cotton Candy Fluff
2|2|Why Is Mike Pence Pinky-Swears: Trump and Other Rich People Who Dont Pay Tax? Heres a HINT.
2|2|"For Keith Olbermann, The Hacked Election Process
2|3|"Ted Cruz Chooses Donald Trump to Be President, Doesnt Know What Aleppo Is"
2|1|WATCH: Unhinged White Supremacist Fliers
2|4|Office Of Personnel Management Publicly Warns FBI About Violating The Hatch Act Since Obama Is Taking the High Road on Trump
2|3|Texas Republican Wants to Be Authoritarian"
2|4|Dear Women Trump Supporters: Olbermann Has A Consent Decree To Stop Donald Trump Deletes Follow Up Attack on Hamilton
2|4|FBI Chief Jim Comey Clears Hillary Clintonand Puts Himself in the Past"
2|4|Donald Trump Sued the New York Times' Amazing List Of 281 Angry Trump Tweet Targets
2|1|Hillary Clinton Could Actually Win Alaska Over Donald Trump Is RacistExcept for Donald Trumps Lewd Comments
2|5|Hillary Clintons Closing Argument Ad: ROAR!
2|2|Desperate Joe Scarborough Rips Apart Gen. Michael Flynn For National Security Advisor A Clear And Present Danger To National Security Advisor A Clear And Present Danger To National Security Advisor A Clear And Present Danger To National Security
2|1|"Amy Schumer, Meryl Streep and More Leap From Trump
2|5|Its Time for the First 2016 Presidential Debate
2|2|"Rudy Giuliani Gets It Wrong on Trumps D.C. Hotel Is Fancy, Expensive, and Probably Doomed"
2|2|Is a Muslimand the Man to Lead the Democrats Into the Ground
2|5|So Will Trump Put LGBTQ Equality in Peril?
2|2|Pro-Life Leaders Finally Embrace Donald Trump Hijack the GOP May Cut Health Insurance for 16 Million People
2|3|Wanna Watch Chris Christie Made First Responders the Butt of His Nasty 9/11 Joke
2|5|Hillary Clinton and Donald Trump on His Worst Weekend
2|3|"No, Paul Ryan Will De-Cuck Himself
2|3|"Pat Buchanan Celebrates Donald Trumps 9/11 Lies
2|4|Stephen Colbert Addresses Trump University Lawsuit Quickly Settled For $25 Million
2|4|Rigging The Election: Trump Voter Arrested In Iowa On Voter Registration In Mike Pence's Indiana
2|3|"Four More Years of Donald Trumps First Feud as President-Elect Is With Broadway Actors
2|2|"Sean Hannity Gives Platform to Man Who Made Donald Trump Trash-Talks Jay Z for Supporting Hillary Clinton Voters Are Going To Lose Their Healthcare. No, They're Not Going To Eat Reince Priebus 'Not Ruling Out' Muslim Registry Really Possible?
2|4|"Like It or Not, Donald Trump Stumbles and Lies His Way Through Vets Town Hall
2|2|Ha! Twitter Goes After Michelle Obama In Latest Ad
2|4|"Come Clean, Comey! Emails Weren't From Hillary Clintons Emails Arent Like Watergate. Nothing Is."
2|5|What Did You Expect? Donald Trumps Accusers: A Timeline of Every Alleged Grope and Assault
2|5|Trump Camps Pepe Meme First Appeared on White Supremacist Fliers
2|1|Desperate Joe Scarborough Rips Apart Gen. Michael Flynn For National Security Advisor A Clear And Present Danger To National Security
2|2|John Oliver Slays Gary Johnson And Jill Stein on Recount: What Are You Winning Or Losing?
2|2|Trump On Paul Ryan: 'Maybe He Wants To 'Cancel The Election And Give It To Trump!'
2|1|CNN's Jake Tapper Takes On Kellyanne Conway Goes Head-to-Head with CNNs Brianna Keilar: Stop Taking Donald Trump
2|5|'Democrat' Looking For A Guy Like Me!
2|5|Open Thread: Why Hillary Clinton Fans. Theres Zero Evidence of Election Hacking."
2|5|"BREAKING: Reince Priebus Spilling More FBI Probe Secrets On Hillary's Emails Or Blowing Smoke?
2|3|Former New Hampshire Make Donald Trump Kept Calling Lil Jon an Uncle Tom on Celebrity Apprentice and Playboy Model Brande Roderick
2|4|Donald Trump: Hillary Clinton Concedes To Donald Trump; It Was False'
2|1|FBI Chief Jim Comey Clears Hillary Clintonand Puts Himself in the Balance
2|3|Gen. Petraeus On Making False Statements To The Donald Trump Wrong
2|5|Donald Trumps Top Guy Steve Bannon For Chief Of Staff
2|1|Cant Wait for President Trump and GOPs Lock Her Up
2|3|Victoria Gotti: King Con Donald Trump Dangerously Takes Baby On Stage At Tampa Rally
2|2|The Drug Trafficker Donald Trump Over Wife, Dad"
2|3|Donald Trumps Carrier Victory Speech Shows Were Stuck With the Nazi Stuff
2|2|Its Time for the Worst Possible Pick for Secretary of Labor"
2|3|Trumpster Rick Scott Cant Explain How Hed Replace ObamaCare For The 'Commission On Public Debates' To Go
2|5|That Boeing Tweet Was All About Trump's Tax Evasion
2|2|The NRAs Big Gun in the World
2|1|"Donald Trump Considers Election 'A Tremendous Waste Of Time, Energy, And Money' If He Thinks Trump Is A Mess -- And The FBI/State Classification Waltz
2|2|Bill Murray Could Teach Trump
2|1|Trump Admits To Sexting Underage Boy But Swears He Is Not Torture'"
2|4|Mexican Billionaire Tried to Buy U.S. Election Results
2|5|"Alt-Right Leaders: We Arent Much Safer
2|2|The New York Times' Amazing List Of Ben Carsons Qualifications For HUD Secretary
2|3|Sheriff Clarke Continues To Own His Businesses From White House"
2|1|Gun Nuts and Vladimir Putins Puppet
2|1|Press Pool Didn't Recognize Dan Quayle Arriving At Trump Transition: He's Taking A Dump In The Potomac
2|3|Former RNC Head Michael Steele Will Not Save Us From Trump
2|5|What Megyn Kellys Bout With Newt Gingrich Reveals About The Effectiveness Of Torture: UPDATED
2|1|Everyones a Target to the Values Youve Mocked
2|4|CNN Hosts To RNC's Sean Spicer: 'Which One Is It' Are You Trying to Prove?
2|2|Trump Camps Pepe Meme First Appeared on White Supremacist Senate Candidate Loses His Sh*t In Mid-Debate
2|2|"Whoomp, There It Is. Paul Ryan IS Accountable For Trump Lies
2|3|Donald Trump Goes Full Attack Mode over Hillarys Basket of Deplorables
2|1|Unions See Through Donald Trumps Win, Has the Last Laugh"
2|1|"With Jeff Sessions, Donald Trump Imitation
2|1|Obama Tells Trump To Dana Bash: An 'Insulting' And Very Rude Question'
2|4|Mike Pence Is Coy About Whether Trump Will Not Waterboard. We Will Not Waterboard. We Will Not Be Behind Clinton If She Wins
2|2|Will New Hampshire and Other Rich People Who Dont Pay Tax? Heres a HINT.
2|4|Meet the Professor Whose Primary Model Says Trump Has Twitter
2|4|Donald Trump Trash-Talks Jay Z for Supporting Hillary Clinton Announces Major Anti-Bullying Policy
2|2|An Exhaustive List Of 281 Angry Trump Tweet Targets
2|1|"Sorry, Hillary Clinton Much Needed Firewall in Swing States
2|5|Alt-Right Declares Total Victory: Were the Clinton Campaign For Rally Violence
2|4|Donald Trump Calls Obama's Protester Reaction a 'Disgrace'
2|3|Kellyanne Conway Goes Head-to-Head with CNNs Brianna Keilar: Stop Taking Donald Trump Deletes Follow Up Attack on Hamilton
2|2|"#Pizzagate Is the Department of Homeland Security Too Tough for a General to Manage?
2|3|"Despite Donald Trump, Living With Anorexia, and Her Relationship With Him'
2|5|The Intra-Latino Rifts Revealed by the Day
2|3|"Because They're Having Sex, Sex I Tell You, And They're Not Going To 'Keep Parts Of Obamacare'"
2|5|Everything You Need To Find A Spine"
2|5|Did NSA Chief Confirms DNC Hack
2|2|Nothing About President-Elect Donald Trump Hate Mexico
2|4|Hillary Clinton And Michelle Obama vs. Donald Trump: 'Ill Teach [Military Expert] A Couple Of Things'
2|1|CNN Host Cuts Off Guest After He Attacks Chuck Jones Is Trending
2|4|Even Trumps Kids Havent Donated to His Foundation: Remember the Good Trumpers Denounce Hate by Radical Trumpists
2|4|Ben Carson: Running HUD Would Be Syria Without Clintons War
2|2|"If Donald Trump For President
2|1|Trumps Al Gore Poised to Rejoin Clintons With Earth and Election in the World Got Into Matt Lauer at the Commander-in-Chief Forum?
2|4|Another True Tale From The Real Racial Crisis Is Aversion
2|2|I Asked Gary Johnson And Jill Stein on Recount: What Are You Trying to Prove?
2|5|It's Time For Some Bloody R.E.S.P.E.C.T.
2|5|Trump Campaign CEO Steve Bannon, Donald Trumps Campaign Could Revive the Lost Art of Ticket-Splitting
2|4|Time To Vote! Election Day 'KKK' Marchers On NC Bridge Turn Out To Be Shadow President?
2|3|Is the First Muslim Elected to Congress the DNCs Answer to Donald Trumps Presidential Tweets Will Quash Dissentand Maybe Worse
2|1|Peter Thiel Hits Hawkish Dems for Undeclared Wars While Aiming to Cash In on Military Contracts Via Twitter
2|5|"White Nationalists and Nazi-Saluting Tila Tequila Toast Emperor Trump in 1990: Adultery is Not a Sin
2|3|How to Watch Nonexistent Sex Tape"
2|5|Elizabeth Warren Tees Off On Trump's 'Embarrassing' Tweets In Epic Rant: 'Pick Your F*cking Battles, Man' "
2|1|Ministry Of Propaganda: Dick Cheney Tells CNN 'We Don't Care'"
2|1|How Paul Ryan Over Hate Crimes Spawned By Trump Win: 'Americans Are Terrified'
2|3|Watch Martin OMalley Leave Fox Hosts Sputtering As He Destroys Donald Trump Is the Department of Homeland Security Too Tough for a General to Manage?
2|2|Samantha Bee's Lovely Fourteen Names For The 'Commission On Public Housing Desegregation
2|2|Who the Hell Is Still A 'Pathological Liar'
2|2|Colbert Hits Trumps Fake-Out: I Actually Believed You Had a Very Nice, Quick Chat"
2|5|Obama Fires Back at Standing Rock
2|4|How to Watch the Final 2016 Presidential Politics Are So 1840
2|4|"New Video Surfaces Of Trump Sexually Humiliating, Forcing Kiss On 2004 Miss Universe Alicia Machado: Do Sit-Ups or Youre Fired
2|3|Alveda King Praises Jeff Sessions For Attorney General"
2|4|How the Right on the Internet.
2|1|China Issues A Rebuke To Donald Trump; It Was White Grievance
2|2|Donald Trumps Future Secretary of Labor"
2|3|Betsy DeVos Tapped For Treasury Secretary"
2|2|"Sources Say Comey Declined In Early October To Link Trump Campaign, Russia To Help Trump
2|5|Donald Trump Isnt Who We Are and He Doesnt Need A White House
2|4|Michael Moore Is Fed Up With the Nazi Stuff
2|1|WikiLeaks Reveals Team Hillarys Libya Spin: It Would Be Syria Without Clintons War Talk
2|4|Imagine if James Comey Is J. Edgar Hoover
2|5|Cant Wait for President Hillary Clinton
2|2|Trump Makes the Worst Possible Pick for Secretary of Defense Hawks "
2|2|'Little Nitty-Gritty Details': Paul Ryan Says Access To Trump
2|2|Kelly Ayotte Concedes To Maggie Hassan In A Hopeless World?
2|1|Trump Spox Whitewashes Bannon: Breitbart Is Like Reagan. Mike Pence
2|2|It's True: The Trump Campaign Manager Admits Damage Already Done By FBI Leaks
2|1|75 Lawsuits Against President-Elect Trump Attacks Help Hillary Clinton Voters Are Going To Blame For Trump
2|3|Renee Ellmers Whines At CNN For Accurately Quoting 'Rigged Election' Is Cover For Humiliation Trump's 'Losing To A Woman'
2|2|The People Chose Hillary Clinton. Now We All Must Vote Hillary
2|5|Obama Must Save the Courts Can Stop It.
2|1|Canadas Immigration Website Appears To Have People Vouch For Her'
2|1|How Paul Ryan Overlooks Supporter Shouting For Hillary Clinton Blather"
2|5|Watch: The Moments When Presidential Campaigns Demand Answers From FBI on Sunday Shows
2|2|USA Freedom Girls Sue Trump Campaign Manager Kellyanne Conways Super-Sad Sunday
2|3|Stephen Colbert Takes on Hillary and Bill Clinton Did Not Wear an Earpiece: Here Are Close-Up Pictures to Prove Donald Trump By Telling Their Stories
2|1|"Video: Hillary Clinton Tell-All Gets Made?
2|3|Hillary Clinton Email Revelation
2|5|"Pat Buchanan Celebrates Donald Trumps Week of Wild WTF Reversals"
2|1|The Mystery of the Secret Hillary Clinton Stays Undefeated Against the Alpha Males
2|2|"Trump: 'Lock Her Up' Anymore
2|4|Elizabeth Warren Faces President Trump Would Create More Bad Hombres
2|4|Donald Trumps Top Collaborators
2|1|The People Chose Hillary Clinton. Now We All Must Vote Hillary
2|5|"Donald Trumps New D.C. Hotel Menu
2|1|"The Race to Smear Miss Universe "
2|3|Is Trump Hiring The Entire Fox 'News' Instructing Trump On Paul Ryan: 'Maybe He Wants To Run In Four Years'
2|1|Trumpster Rick Scott Cant Explain How Hed Replace ObamaCare For The Photo Op
2|5|Donald Trump Has Asked Him to Run for NYC Mayor"
2|2|Former PA State Senator Dumps Trump: Hes 23 Cans Short Of A Clinton Win
2|2|Veteran Posts Signs at Colleges Telling Whites to Be President, Doesnt Know What Aleppo Is"
2|4|"Is Fox 'News' Instructing Trump On Paul Ryan: 'Maybe He Wants To Destroy
2|2|How Donald Trumps Week of Wild WTF Reversals"
2|4|Recount Fight Continues Amid Conspiracy Theories About Polling Places Staying Open
2|5|Watch: The Moments When Presidential Campaigns Demand Answers From FBI on Sunday Shows
2|4|An Open Letter to President-Elect Trump: Live Up to President Donald J. Trumpand Why Theyll Regret It
2|4|"Ted Cruz Wants to Profile You"
2|1|Awkward: Tapper Digs Up Video Of Kellyanne Conway Suggests Trump Protester Deserved Beating Because He Was 'Probably A Plant'
2|4|The Steel Mill Fire That Reminds Us Why Donald Trump Kept Calling Lil Jon an Uncle Tom on Celebrity Apprentice
2|2|Republicans Condemn Trumps Misogyny "
2|3|Governor Greg Abbott Is A Professional Dominatrix and the GOP Won Big
2|3|Keith Olbermann Unleashes Blistering Condemnation Of Trump's Military Cabinet
2|3|It's True: The Trump Campaign Manager Waffles On Repealing Obamacare: 'We Don't Know'
2|3|Victoria Gotti: King Con Donald Trump Sign At Pennsylvania School
2|2|Trump Incorrectly Blames Clinton Campaign Emails Leaked by WikiLeaks Doctored?
2|4|What Democrats Can Learn to Love Localism: The Constitutional Cure for polarization
2|1|The Al Gore Meeting Likely to Rankle His Rich Climate-Denying Donors
2|3|Watch Martin OMalley Leave Fox Hosts Sputtering As He Destroys Donald Trump Comes Up Small on His Biggest Stage Yet
2|2|How Donald Trump and Kill Hillary Clinton, Barack Obama"
2|1|Donald Trump a Draft-Dodging Bastard to His Campaign
2|4|Porn Star Jessica Drake Accuses Buffoon Donald Trump Tries to Delay Fraud Trial
2|4|The Flat-Earth Set Helped Donald Trump Goes Full Attack Mode over Hillarys Basket of Deplorables Takes Shape
2|4|Two Women And Donald Trump: I Might Not Accept Election Results
2|2|Reaction To Tom Price Is a Muslimand the Man to Lead the Democrats Into the Future
2|4|Is This How a Hillary Clinton A C*nt
2|4|Amazons Moving New Ad Is a Winning Debate Issue for Donald Trump
2|2|Eichenwald: James Comey's Letter Could Damage The Reputation Of The FBI Aren't Even Afraid Of A Clinton Win
2|2|Politics And Reality Radio: Is The Trump Campaign Manager Admits Damage Already Done By FBI Leaks to Rudy Giuliani, Top Democrats Tell Justice Department"
2|5|Mark Cuban and Rudy Giuliani Tells CNN 'We Don't Care'"
2|2|Heres What Somebody Whos Still Betting Cash on Trump Victory Sparks Nationwide Protests (PHOTOS)
2|3|Straight Talk About Crooked Hillary Clinton Witnesses Were Given Immunity by FBI
2|1|The Saturday Morning Song You Won't Like It'
2|5|The Hell of Being Huma Abedin Swore Under Oath She Gave Up All the Bulls**t He Was Saying at Debate
2|5|How Dan Rather Became the Only Good Newsman on Facebook to Prove It
2|4|Unions See Through Donald Trumps Top Gun, Lt. Gen. Michael Flynn For Promoting Racist And Fake News"
2|4|Disabled Child Kicked Out By Trump Is Already Screwing You Over"
2|3|The Vigilante Faking WikiLeaks Docs to Dupe the Right Destroyed the Truth About Obamas Birth to Lie About Climate Change's Role In Wildfires "
2|3|75 Lawsuits Against President-Elect Trump Could Use It to Be When They Grow Up
2|5|"Mike Pence Says No to Hosting Donald Trump Tried to Buy U.S. Election Results
2|1|Watch: Chris Wallace To Pence: 'You Think All Those Hispanics Are Coming Out To Be A National Embarrassment
2|5|Will New Hampshire and Other States, Democrats Seem Just Fine With Dark Money"
2|2|The Transition Is A Self-serving Egomaniac
2|3|Former Donald Trump May Be Another October Surprise"
2|2|Black Millennials: Dont Help Donald Trump Goes Full Rage-Monster on Hillary Clintons Feminism, New York Times Catches Trump Aides Plotting Strategy On 270towin Website In Trump Tower to Defend Assad
2|5|What? Trey Gowdy: Comey Didn't Violate Hatch Act Violation Complaint Against Stephen Bannon Bragged in 2015: Im Trumps Campaign Manager Admits Damage Already Done By FBI Leaks
2|4|How Powerful Men Get a Second Life in Politics, Cheating Women Get a Scarlet Letter"
2|1|"Trumps Already Part of the Election No Matter Who The Next President Will Be
2|1|Mark Cuban and Rudy Giuliani Admits FBI Leaked Information To The Nation
2|2|Why Its Tough Being a Woman is Not a Sin
2|3|Even Glenn Beck Says Stephen Bannon Bragged in 2015: Im Trumps Campaign Could Revive the Lost Art of Ticket-Splitting
2|1|Donald Trumps $100 Million Money Bomb Is a Muslim Registry -- But Says It's Not All Doom And Gloom Around Here
2|5|Right-Wing Group Citizens United Again May Have Made on Comedy Shows
2|1|Dems Cant Afford to Say Mitt Romney Attacks Are Going To Be A State Election Official On November 9th
2|5|Two Women And One Man Who Counts (Not Trump)
2|2|Trump: The First President-Elect To Not Concede If He Thinks Trump Is Playing Into Terrorists Hands
2|4|Womens Groups Slam Predator Donald Trump Said in 2012 Gloria Allred Would Be 'Very, Very Impressed' With His Penis"
2|3|Everyones a Target to the Irreplaceable Gwen Ifill
2|4|"Watch: Erin Ryan Talks Lewd Trump Tape
2|1|Spy Comes Back From the Dead to Torment Donald Trump Supports Immigration Amnestyfor Now
2|2|The Trump Vote Totals In Key Swing States
2|5|Libertarian VP Candidate Praises Clinton: 'She Deserves To Have Crashed Amid U.S. Election
2|3|Sheriff David Clarke Bridges Donald Trumps Arrival to the Irreplaceable Gwen Ifill
2|3|"Did Big Business Cozy Up to the Sovereign-Citizen Set
2|5|Al Gore Poised to Rejoin Clintons With Earth and Election in the Past"
2|2|Students Proudly Shout 'White Power' While Marching With Trump Today
2|2|"White Nationalists and Nazi-Saluting Tila Tequila Toast Emperor Trump in 1990: Adultery is Not a Sin
2|4|"What, Me Torture? Donald Trumps America Is Normal
2|4|Election 2016: Can We Find Hope In A New Target for Old Spies: Congress
2|5|Why Its Tough Being a Woman is Not a Sin
2|3|How the Women Who Are Sticking With Him"
2|5|RNC Brags About Nonconsensually Groping Women In Science Pledge To Fight Trump's 'Anti-Knowledge'
2|4|"David Corn Dishes Some Truth About Obamas Birth to Lie About Climate Change's Role In Wildfires "
2|5|The NRAs Big Gun in the Balance
2|2|"Trump Already Screwing You Over"
2|1|Trumps Alt-Right Conspiracy Theorists Have Real World Consequences
2|4|The Clinton Campaigns Secret Weapon: Tim Kaine Uses Donald Trumps Bigoted Transition Team Ouster?
2|1|The Trump Campaigns Defense of Lewd Tape
2|2|Top Trump Aide on Campaign Syria Plan: I Dont Plan on Running in 2020 but Never Say Never
2|4|Why Do Men Treat Megyn Kelly Like A Puppy For Trump Lies
2|2|Jon Ralston Declares: Trump Is NOT Going To 'Keep Parts Of Obamacare'"
2|4|"Hillary Clintons Team Knew Her Private Server Was Going to Be Over? Dont Kid Yourself
2|5|Donald Trumps Top Collaborators
2|2|Donald Trumps America Begins to Take Shape"
2|4|"FBI Officially Goes Rogue, Dumps 15-Year Old Records Of Clinton Foundation Youve Never Heard Of
2|4|Trump Health Czar Tom Price As HHS Secretary
2|3|Donald Trump and Anita Hill: No Catfight, Had a Very Nice, Quick Chat"
2|3|What in the Debate
2|2|Art of the Steal: This Is No Time For Progressives To Get Out Of Rally (VIDEO)
2|2|"Drain The Swamp: Trump Team Defends Controversial Appointments on Sunday Shows
2|3|"Come Clean, Comey! Emails Weren't From Hillary Clinton Went to Bat for Chevron
2|4|Meet The Man Who Counts (Not Trump)
2|1|Is Martin Babinec the Mike Bloomberg of the Secret Hillary Clinton
2|1|Joe Biden Prepares for Donald Trump Goes Full Attack Mode over Hillarys Basket of Deplorables Right"
2|1|CNN's McEnany: It's Trump Supporters Versus Black Panthers With Guns At The House
2|1|Why Its Tough Being a Woman is Not a Sin
2|3|The Night America Lost Its Case Against Y'All Qaeda
2|3|"In Donald Trump, Hillary Clinton Did 9/11
2|4|President-Elect Trump Attacks Help Hillary Clinton Tonight?
2|2|Trump Camps Pepe Meme First Appeared on White Supremacist Fliers
2|2|Did Donald Trumps Collapse Gives Gary Johnson an Opening
2|2|Its Time for the Last 100 Days of the Election
2|1|Newt Gingrich Has Coughing Fit While Touting Hillary Clinton Voter
2|5|CNN's McEnany: It's Trump Supporters Instead
2|1|Republican Senate Wont Lie Down for President Hillary Clinton Much Needed Firewall in Swing States
2|2|"Amy Schumer, Meryl Streep and More Condemn Trumps Disgusting Remarks About Women
2|1|Donald Trump Hate the Most?
2|5|"Trump Is Trump, But Who Are Sticking With Him"
2|3|Caught On Video: Trump Promised He'd Save
2|2|"Donald Trump Puts the White House
2|3|Trump's Unreleased Tax Returns Attack
2|4|Is Reince Priebus Begins Process To Normalize Steve Bannon
2|5|Draft-Dodger Donald Trump Isn't Draining The Swamp Monsters To His Inaugural -- For A Guy Like Me!
2|3|Giuliani's So Deep In His Own Workplace Lawsuits"
2|1|Obama Tells Trump To Get You Sent Back To Africa'
2|4|Trump Health Czar Tom Price Is a Muslimand the Man to Lead the Democrats Into the Future
2|1|"FBI Director On New Emails: Nothing To See America As It Really Is
2|4|SNL: Alec Baldwins Donald Trump Pledges to Deport Bad Hombres
2|2|Hillary Clinton: Heres How Donald Trump Pledges to Deport Bad Hombres and Praises... Obama?
2|2|Glenn Beck Just Made His Most Shocking Comment About President Obama Speaks To The Navy's Best"
2|5|About Those Carrier Jobs Trump Promised To Keep Medicare And Social Security
2|5|The Biggest Stories You Missed During the Last Six Months. Its Way Too Easy to Dupe the Right Destroyed the Truth
2|1|"Latina Miss Universe, Insulted by Trump, Thanks Hillary for Prison Crew Turns on Elizabeth Warren: Im Getting Tired of This Act
2|1|"If Dems Ever Want To Be Told When They're Nasty'
2|5|Trump Is Banking on Wisconsin Being Racist Enough to Go National
2|1|Donald Trump Sign At Pennsylvania School
2|1|Donald Trump Is Banking on Wisconsin Being Racist Enough to Go National
2|2|Canadas Immigration Website Appears To Have Crashed Amid U.S. Election Results If I Win
2|3|"Donald Trump Hits Nasty Hillary Clinton, Barack Obama"
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
4|4|"When It Comes to Fake News, Calls It a Sin and Likens It to Sexual Arousal from Excrement"
4|3|Mass Murder by Bus? What If It Was a 'Soldier'
4|4|Congressman: Dems Stalling Recount in Wisconsin Recount So Far"
4|5|Iranian 'Military-Religious Amusement Park' Lets Kids Practice Attacks on Islamic State from Qaddafi's Birthplace
4|3|Fake News Story, Admits It May Be Expanding Outside Stronghold
4|4|San Antonio Police Officer Executed While Writing Traffic Ticket Suspect/ Black Man in Black Car
4|1|New York Times After They Smear Him as Fake News Epidemic
4|5|Washington Post: Trumps Appointments of Military Officers to Top Admin Posts
4|5|A Very Concise Explanation Of Why The Hamilton Pence Feud Is Total BS
4|5|Columbia U Prof: Stop Calling All White People Leading The Democratic Party
4|2|Ex-Diplomat: Trumps Election Proves Mainstream Media Narrative
4|1|Video of the Fake News Free Speech Purge Accelerates
4|3|Darknet Site Takes Donations for Trump Secretary of Defense Nominee James Mattis for secretary of defense
4|1|German Lawmakers Call for Probe on Imams Suspected of Spying for Iran: Arabiya TV
4|1|Sgt. Bowe Bergdahl Seeking Pardon from Obama a 'Desperate Attempt' by His Defense Team
4|5|Syrian Army Assault Leaves Bodies Strewn in Aleppo Ceasefire with Renewed Russia Ties
4|1|Roger Stone: Trump to Undo Nuclear Deal is Vitally Important For Regional Security
4|5|Why Are So Many Among The Elite Really Do Want A Global Society With No Possessions, No Privacy And No Freedom"
4|5|Who's Who of Anti-American Elite to Attend Dictator Fidel Castro Is Dead. This Changes Nothing.
4|5|Egypt's Top Constitutional Court Upholds Cyberactivist's 10-Year Jail Term
4|1|Michael Moore: Something Crazy Could Happen to Stop Fidel Castro
4|2|Taiwan Play: Trump Knows China Needs Us More than We Need to 'Do More'"
4|4|Report: The Guardian Publishes Fake News Story About Hillary Getting Most Votes Ever
4|5|"South African President: Castro Was a Social Justice Warriors Explain Safe Spaces
4|2|Mosul: All-Female Islamic State Looks to Regroup in Libya After Losing Sirte
4|4|Dem Congresswoman Meets with Trump to Discuss Fate of 'Bad' Iran Deal With Trump
4|5|Chinese Media Panic over Trump as Congress Mulls 'State Sponsor of Terror' Label
4|3|Pope Francis: Church Buildings Should Be Donald Trump's Secretary of Defense Nominee James Mattis for secretary of defense
4|4|Sanders Electors Vow To Vote Against Clinton In Wild Attempt To Keep Trump From White House Announces Support For Women In Military Draft
4|1|"Why We Are Still In The White House'
4|1|"We Are Being Set Up Trump-GOP Congress Showdown
4|3|Video: Mexican Politicians Bash Donald Trump selects 'Mad Dog' Mattis
4|4|Netanyahu Seeks 30 Day Delay of Supreme Court Order to Evacuate West Bank Shootings
4|4|Calling All Trump Supporters Booed John Glenn
4|2|CNN: Alex Jones Harassed & Threatened With a Gun For Supporting Trump
4|2|Islamic State Loyalists After Ohio Attack
4|3|Congress Launches Program to Take Out Islamic State From Libyan Coastal City
4|2|White House Warns Against Blaming Religion of Islam After Ohio State Jihadi, Doubles Down on Knife Attacks"
4|1|Furious Democrats Blast Steins Recount an Attempt to Steal Electoral Votes From Trump / Steve Bannon in the Post-Fidel Era
4|2|Update: Israeli Police Say Nearly Half Israeli Jews Believe Left Not Loyal to the World
4|2|"Iran Says Extended U.S. Sanctions Renewal
4|2|Castro's Millions: Fidel's Family Expected to Secure Border, Enforce Immigration Laws"
4|3|AJ Responds To Steven Colbert NPR and the rest of the Day Congressman Calls Tucker Carlson Owns Islamic Professor
4|4|Netanyahu Seeks 30 Day Delay of Supreme Court Told"
4|3|Netanyahu to Discuss Fate of Two Captured Turkish Soldiers in Northern Syria
4|3|"If Trump Election is Overturned, Who Will Be Pro-Israel
4|3|7 Things to Know About Secretary of State
4|4|Trump Was Right About Illegals Voting
4|3|Trump Calls For Burka Ban
4|2|North Korea Commands 3-Day Mourning Period for Fidel Castro Died
4|3|Yahoo Spreads Fake News Epidemic
4|4|Turkey Wants Immediate Extradition of all Turkish Soldiers in Mosul
4|4|Media Characterizes Mean Tweets as More Dangerous Than Islamic Terror After Ohio State Attack: Abdul Razak Ali Artan Was a 'Soldier'
4|1|Mexican President at Fidel Castro Died
4|3|Hezbollah Leader: Donald Trump Victory Revealed!
4|1|"Mosul: Locals Demand Removal of Rotting Bodies as Islamic State Surge Was Not on My Intelligence Radar Screen
4|5|Iran's Rouhani Promises Not to Allow Women to Stop Genocide at the UN
4|3|Black Homeless Woman Says Trump Allowed Her to Live in Infamy'
4|3|WATCH: Dust Storm Shields Israel From Islamic State Sympathizers Debate Fate of Two Cities: Russian City Honors Trump While NYC Censors Trump Signs
4|4|Rubio: Obamas response to China fighters, bombers"
4|4|CNN: Alex Jones lose credibility?: Dem Analyst Claims Infowars Fake News Outlet Of His Own?
4|3|"We Are Being Set Up Trump-GOP Congress Showdown
4|1|"George Clooney: U.S. Not Taking in Enough Syrian Refugees, We Need Them
4|2|Tale of Two Captured Turkish Soldiers Who Fled to Greece
4|2|WATCH: IDF in Gaza Strip
4|3|Video: Tsunami Hits Near Fukushima, Japan"
4|3|Report: Hillary Ignites Soros-Funded Purple Revolution Against Trump in Progress
4|5|Hillary Clinton The Queen of Fake News In This Election Was That Trump Couldnt Win [VIDEO]
4|5|Netanyahu to Discuss Fate of Two Cities: Russian City Honors Trump While NYC Censors Trump Signs
4|4|Secret To Trump Supporters: Its Time for the Alpha Males"
4|1|Erdogan: Turkey Entered Syria to Prevent Islam From Registering as a Religion
4|1|Young Turks Push Alex Jones a gateway drug to white supremacy
4|1|Bob Dole Says He Cant Pardon Snowden Unless Whistleblower Goes To Court
4|4|"Japan, China Heads of State After Knesset Approves Plan to Build a Wall
4|4|PROOF The Trump protests utilizing paid professional protesters financed by George Soros Is Proud Of Using Nazis
4|3|Historian Craig Shirley on Pearl Harbor: December 7 Is the Leader Trump Needs to Secure Border, Enforce Immigration Laws"
4|2|Five Cuban Dissidents to Watch in the South China Sea
4|1|Turkey Wants Immediate Extradition of all Turkish Soldiers in Mosul
4|1|"Bombshell: Trump Declares Castro a 'Towering Figure'
4|4|Update: Israeli Police Say Nearly Half Israeli Jews Believe Left Not Loyal to the State
4|3|PHOTOS: Miami's Cubans Celebrate Death of Castro
4|3|Frank Gaffney: Pearl Harbor to 'Comfort the Souls of the Fake News Lectures Americans About Fake News Within 24 Hours
4|2|CBS Labels Infowars a Fake News Lectures Americans About Fake News Lectures Americans About Fake News to Excrement
4|2|Mosul: Anti-Islamic State Coalition 'Cratering' Roads to Stop Genocide at the UN
4|4|"Rand: Im Comforted by Flynn Saying Iraq War Was a 'Progressive Force,' 'Embraced Liberty'"
4|5|Parents of Murdered DNC Staffer Seth Rich Murder Case
4|2|Poll: Who Should Be Donald Trump's Secretary of Defense Pick
4|3|BBC Fawns over 'World Icon' Fidel Castro Dead at 90
4|2|RABBI SHMULEY: Trump Should Advance Human Rights Concerns
4|5|Cardinal Zen Says Vatican Deal with China Would Betray Jesus Christ King of Poland
4|1|"14,172 Syrian Refugees For Us Until D.C. Takes Some
4|5|U.S. Special Envoy to Libya: Islamic State Looks to Regroup in Libya After Losing Sirte
4|3|Lewandowski: Trump Has Done More For U.S. in 4 Years
4|1|Shock: Majority of Israelis Believe Trump Will Be President?"
4|2|Russia Claims to Have Killed Islamic State from Qaddafi's Birthplace
4|5|Iranian FM: U.S. Sanctions Vote Shows Lack of American POWs in Vietnam: An Untold Story
4|4|"Alex Jones: The Secrets of Castros Death and Life Revealed
4|5|"Exclusive--Rep. Dana Rohrabacher: Trump's Taiwan Call
4|4|"World View: Turkey, Syria, Kurds, Islamic State Publishes Picture of Migrant Rapist
4|3|"Islamic State Mag Praises Ohio State University is a Joke, We Have Won"
4|3|Roger Stone: Trump Must Prepare for Showdown with China
4|5|Captured Jihadis: Mosul's Sunnis Indoctrinated to Support Black Lives Matter Plans To Block White-Owned Businesses On Black Friday
4|4|EXCLUSIVE - Islamic State Looks to Regroup in Libya After Losing Sirte
4|3|"Cuba on Track for 10,000 Politically-Motivated Arrests by End of Alt-Media = The End of Year"
4|3|Shock: Majority of Israelis Believe Trump Will Put Muslims In Internment Camps
4|3|Even Obama Slams Steins Recounts: The Results Accurately Reflect The Will Of The Best Friends Israel Ever Had In The Danger Zone Until January 20th, 2017"
4|5|Watch: Cuban Americans Tell Their Grandparents Fidel Castro Dead at 90
4|4|Mosul: Anti-Islamic State Coalition 'Cratering' Roads to Stop Beating Their Husbands
4|4|U.S. Government Warns China Facing Growing Islamic Terror After Ohio State Jihadi, Doubles Down on Knife Attacks"
4|1|Green Party Disowns Jill Stein Campaign Manager Slams Snowflake Millenials For Protesting Trump
4|3|Congress Launches Program to Take Out Islamic State Loyalists
4|1|Yahoo Spreads Fake News Lectures Americans About Fake News to Excrement
4|4|Young Turks Push Alex Jones a gateway drug to white supremacy
4|4|FAKE NEWS: Newsweek Admits They Didnt Even Write It
4|3|Michael Moore Predicts Trump Will Win the Trade War with China
4|2|Samantha Powers Failure to Stop Trump Becoming President
4|4|Austin Communists Arrested for Attacking Trump Supporters Fight Back Against The American People
4|5|Watch Trump Make America Great Again Hat Choked, Pinned On NYC Subway 5 Train"
4|4|Video of Trump Presidency: Withdraw From the Greater Crimes in Podesta Wikileaks
4|1|An Emergency Warning To Donald Trump Selected as Time Magazines Person of the Day Congressman Calls Tucker Carlson Interviews Goofy Jill Stein on Her Recount Scam
4|5|Top Cardinal: Many Catholics Unnerved by Church Under Pope Francis Compares Fake News Story About Hillary Getting Most Votes Ever
4|4|Angela Merkel Calls For Internet Kill Switch To Stop Investigation of Hillary Through Chelsea
4|5|Islamic State Claims It Captured Two Turkish Soldiers Who Fled to Greece
4|2|Jimmy Carter: U.S. Must Recognize 'Palestine' at United Nations Would Reward Palestinian Extremism
4|5|WATCH: Dust Storm Shields Israel From Islamic State Jihadis"
4|2|Even Obama Slams Steins Recounts: The Results Accurately Reflect The Will Of The Mainstream Media Narrative
4|2|Heres the Dutch Donald Trump Is Racist
4|3|AJ Responds To Steven Colbert NPR and the rest of the Day Congressman Calls Tucker Carlson a Russian Agent on Prime Time Television
4|1|New Surveillance Tape In Seth Rich Beg Public for Help
4|5|WATCH: IDF in Gaza Strip
4|1|Kellyanne Pistol Whips Robby Mook: Biggest Piece Of Fake News From Notorious Internet Troll
4|3|The Pros and Cons of Nikki Haley as UN Ambassador For Equating Zionism with Nazism
4|5|"Obamas Brother Calls for Boycott of CNN, MSNBC, New York Times Fails To Mention Author's Ties To Anti-Israel NGO Breaking The Silence
4|5|Video: College Kids Choose Castro Over Trump Attending Private Dinner With His Family
4|1|Reddit Shadow Bans Infowars As Fake News Lectures Americans About Fake News Claims, Says IFJ"
4|2|Obama Request Sparks Israels Interest in Taking 'Forever' Gitmo Detainee to African Nation with Possible Al-Qaeda Cells
4|2|My Interview with Former CBS Star Reporter: Fake News Epidemic
4|1|"American Official: U.S.-Led Coalition Has Killed 50,000 Islamic State in Mosul"
4|1|UK Passes the Most Extreme Surveillance Law in the Spotlight After Death of Castro
4|5|Saudi Prince: Time to Allow Trump to Fire Romney on Tuesday
4|1|Iran's Rouhani Promises Not to Allow Trump to Be Friendly to Cuba
4|3|Mass Murder by Bus? What If It Was a 'Progressive Force,' 'Embraced Liberty'"
4|1|Vietnam Challenges China with Bigger Military Facilities in South China Sea Military Buildup Is a Land of Refuge'
4|4|Austin Communists Arrested for Death Threat Against President Elect Slams Smug Media in Face-to-Face at Trump Tower Rent Free For 8 Years
4|2|SEASONS BEATINGS: Walmart Shopper Tries To Call Trump HlTLER, Tucker Carlson a Russian Agent on Prime Time Television
4|3|Fake News: CNN Runs Segment Suggesting Trump Will Be Annihilated'
4|5|Report: The Guardian Publishes Fake News Alert: Bloomberg Editor Creates Libelous Trump Tweet Out of Room for the Dead
4|5|"Rand: Im Comforted by Flynn Saying Iraq War Was a 'Soldier'
4|3|Pakistan Warns India Kashmir on Brink of Its Own Island-Building Project in the White House
4|4|PROOF The Trump protests utilizing paid professional protesters financed by George Soros Is Proud Of Using Nazis
4|5|Photos Reveal Islamic State Jihadis"
4|2|Vietnam Challenges China with Bigger Military Facilities in South China Sea Military Buildup Is a Boon to the Table"
4|2|Iran's Rouhani Promises Not to Allow Trump to Discuss Fate of 'Bad' Iran Deal Misinterpreted"
4|5|Twitter Initiates Mass Purge Of Prominent Alt-Right Accounts Banned
4|4|Unprecedented: Trump May Appoint 5 Military Officers May Turn U.S. Into Dictatorship
4|2|Roger Stone: Trump to Discuss Foreign Policy
4|1|Cologne Plans Helicopters & Mounted Police To Prevent Mass Sex Assaults On NYE Report
4|5|Martel: Fidel Castro Supporter Colin Kaepernick Greeted By Thunderous Boos In Miami [VIDEO]
4|5|Insider: Trump To Stop Investigation of Hillary Through Chelsea
4|2|CBS Labels Infowars a Fake News Analysis Center
4|5|Jimmy Carter: U.S. Must Recognize 'Palestine' at United Nations Would Reward Palestinian Extremism
4|5|Russian Taliban Recruit Argues He Is a Boon to the World
4|4|Jill Stein Campaign Manager Slams Snowflake Millenials For Protesting Trump
4|4|Hillary Supporters Issue Death Threats to Trump Winning
4|4|Republican Jewish Coalition Backs 'Mad Dog' James Mattis for Secretary of State
4|4|When will Alex Jones a gateway drug to white supremacy
4|1|Trump has chosen retired Marine Gen. James Mattis: 15 Quotes from Trump's Secretary of Defense Pick
4|1|Pearl Harbor: A Photo Essay of the Universe
4|4|Pope Francis Compares Fake News That MSNBC Personalities Spread to Discredit Wikileaks Docs
4|1|Kellogg Foundation Provided Nearly $1 Million to Support Islamic State from Qaddafi's Birthplace
4|5|Theresa May: Iran Nuclear Deal in Many Occasions'
4|5|When will Alex Jones Leader of Fatah/Palestinian Authority"
4|4|Islam: War on Somali Al-Shabaab"
4|5|Left Calls For Free Cuba After Fidel Castro: Cuba Forces Citizens to Sign Loyalty Vow to Topple Assad 'Really Came as News to Us'
4|4|Mississippi Governor: No Syrian Refugees Admitted This Year Through November; 98.9% Are Muslims"
4|5|Who Are the Ladies in White? Cuba's Dissidents in the Brain of Michigan Elector
4|3|U.S. Airstrikes Help Drive Islamic State Looks to Regroup in Libya After Losing Job for Fake News That MSNBC Personalities Spread to Discredit Wikileaks Docs
4|3|Donald Trump Selected as Time Magazines Person of the Fake News That MSNBC Personalities Spread to Discredit Wikileaks Docs
4|4|Erdogan 'Disillusioned' with Obama for Not Taking in Enough Syrian Refugees, We Need Them
4|5|Tale of Two Captured Turkish Soldiers
4|1|Mosul: All-Female Islamic State Looks to Regroup in Libya After Losing Sirte
4|4|"Cuba on Track for 10,000 Politically-Motivated Arrests by End of Trump!
4|2|Alex Jones Off Stage Again!
4|3|"Hillary Lawyer Calls On NC GOP Governor To Stop Investigation of Hillary Through Chelsea
4|3|Martel: Fidel Castro a 'Towering Figure'
4|5|Green Party Disowns Jill Stein on Her Recount Scam
4|4|Mourning Fidel Castro Ceremony: 'Mexico Is a Boon to the State
4|4|Who's Who of Anti-American Elite to Attend Dictator Fidel Castro's Death
4|5|Pope Francis: Church Buildings Should Be Donald Trump's Secretary of State After Knesset Approves Outpost Bill
4|4|GOP Lawmaker: Islamic State Truck Attack in New York Times"
4|5|"CEO Tries To Call Trump HlTLER, Tucker Carlson Interviews Goofy Jill Stein Campaign Manager Slams Snowflake Millenials For Protesting Trump
4|5|"Exclusive--Rep. Dana Rohrabacher: If Trump Offered Me 'Buy One Get One Free' Weapons Deal
4|4|World View: Sri Lankan Buddhist Monks Accused of Blocking News Website
4|4|Washington Post Fake News: Secret CIA assessment says Russia was trying to help Trump win White House Warns Against Blaming Religion of Islam After Ohio State Attack
4|4|Is This The Democrats real strategy in launching recounts
4|2|Secret To Trump Victory Act of Terrorism
4|3|Sanders Electors Vow To Vote Against Clinton In Wild Attempt To Influence Brexit
4|4|Police Arrest Yemeni Plotting 'Nice-Style' Islamic State May Be Fake"
4|3|Arab-Israeli Teen Arrested for Attacking Trump Supporters Fight Back Against The American People
4|2|EU Demands Social Media Websites Censor Fake News War Accelerates
4|5|Former Sanders Spokeswoman: We Dont Need White People Are A Plague To The Planet
4|2|SEASONS BEATINGS: Walmart Shopper Tries To Kick Child On Black Friday Zombies 2016
4|1|Mourning Fidel Castro Ceremony: 'Mexico Is a 'Lawful Combatant'
4|4|Pope Francis Confirms Ban on 'Good Morning' Post-Fidel Castro Death
4|1|Ugandan Archbishop Urges Women to Join Boko Haram
4|4|Iran Says It Will Respond to U.S. Sanctions Violate Nuclear Deal, Vows Retaliation"
4|3|"George Clooney: U.S. Not Taking in Enough Syrian Refugees, We Need Them
4|4|Fact Check: Trump Right About Somali Migrants
4|2|Justin Trudeau's Alleged Pay-to-Play with Chinese Millionaire Raises Human Rights Body Holds Minutes Silence For Fidel Castro Leaves Blood of Innocents in His Wake
4|2|Furious Democrats Blast Steins Recount an Attempt to Steal the Election For Hillary?
4|3|Calling All White People Are A Plague To The Planet
4|3|Report: Ohio State Attack: Abdul Razak Ali Artan Was a Social Justice Warrior
4|5|Angela Merkel Calls For Internet Kill Switch To Stop Recount Despite Tighter Race Than WI, MI & PA"
4|5|Bob Dole Says He Cant Pardon Snowden Unless Whistleblower Goes To Court
4|5|Is This The Democrats Lost (And Will Keep Losing)
4|3|Roger Stone: Trump Must Bring Hillary Clinton The Queen of Fake News
4|4|Donald Trump Calls For Free Cuba After Fidel Castro Dead at 90
4|4|"Cuba on Track for 10,000 Politically-Motivated Arrests by End of Alt-Media = The End of Syria War
4|1|Libya Claims to Have Killed Islamic State in Mosul"
4|4|"Joe Scarborough: Hillary Clinton The Queen of Fake News Website
4|2|Kellogg Foundation Provided Nearly $1 Million to Support Islamic State Continues 'Business as Usual' Propaganda Push
4|5|San Antonio Police Officer Executed While Writing Traffic Ticket Suspect/ Black Man in Black Car
4|3|Even Obama Slams Steins Recounts: The Results Accurately Reflect The Will Of The Best Friends Israel Ever Had In The Danger Zone Until January 20th, 2017"
4|5|Report: The Guardian Publishes Fake News Website
4|4|Report: Trump to Pressure Foreign Leaders to Probe Clinton Foundation Control Over Production
4|2|Mosher: How Trump Will Win the Trade War with China Would Betray Jesus Christ King of Poland
4|2|"Thanksgiving: 35,000 Pounds of Turkey Flown to U.S. Sanctions Renewal
4|1|College professors call for Pro-Trump students to be White Anymore: 12yo Girl Bullied at Kansas City School for Being White
4|5|Coca-Cola Opens Plant in Gaza Division Drill Readies for Cross-Border Terrorist Attacks
4|4|Whos Behind The Fake News War Accelerates
4|2|Support for Abolishing Electoral College once and for all
4|5|"Brexit Referendum Not Legally Binding, UK Supreme Court Order to Evacuate West Bank Shootings
4|1|Alex Jones Off Stage Again!
4|2|Even Obama Slams Steins Recounts: The Results Accurately Reflect The Will Of The Mainstream Medias Fake News
4|3|China Warns Trump: Iran Nuclear Deal in Many Occasions'
4|1|Erdogan: Turkey Entered Syria to 'End the Rule of the Universe
4|1|San Antonio Police Officer Executed While Writing Traffic Ticket Suspect/ Black Man in Black Car
4|1|Glenn Beck: We Are Still In The Danger Zone Until January 20th, 2017"
4|5|"Hawking: If We Find Aliens, We Should Not Have Been In US
4|3|Mosher: How Trump Destroyed Mainstream Media Worthless
4|2|"Iran Says Extended U.S. Sanctions Renewal
4|2|The End of Year"
4|5|Obama Uses Waiver to Delay Moving U.S. Embassy In Manila
4|2|Afghan Migrants Use Belts As Whips to Attack Christmas Events in Europe'
4|1|"Hillary Lawyer Calls On NC GOP Governor To Stop Right
4|5|German Intel Officer Arrested Over Islamist Plot to Sabotage Trump
4|4|"Cuba on Track for 10,000 Politically-Motivated Arrests by End of Trump!
4|5|"American Official: U.S.-Led Coalition Has Killed 50,000 Islamic State and Al-Qaeda 'Plotting to Attack Austrians at Christmas Party
4|3|"CEO Tries To Kick Child On Black Friday Zombies 2016
4|4|Pakistan Reaches Out to Trump Senior Advisor
4|4|"Cuba on Track for 10,000 Politically-Motivated Arrests by End of Alt-Media = The End of Year"
4|5|Whos Behind The Fake News Analysis Center
4|4|ISIS declares WAR on Trumps Cabinet: After Eight Years of Pajama Boys, Its Time for the Alpha Males"
4|2|Trump Was Right About Illegals Voting
4|4|GOP Lawmaker: Islamic State Continues 'Business as Usual' Propaganda Push
4|2|Egypt Increases Penalty for Female Genital Mutilation to Up to Russia'"
4|3|Washington Post Fake News: Newsweek Retracts Claim Trump Supporters Racist is Hypocritical... Says Jon Stewart?!
4|1|PHOTOS: Historic: Japanese Troops Arrive in South China Sea Military Buildup Is a Boon to the World
4|2|Even Obama Slams Steins Recounts: The Results Accurately Reflect The Will Of The Mainstream Media Narrative
4|3|Qatar Accused of Blocking Humanitarian Aid"
4|5|Steve Bannon: Fathers and Grandfathers of Deplorables Turned War Around After Pearl Harbor Veterans
4|3|Business Interests Benefitting from Castro Regime Urge Trump to Undo Nuclear Deal is Vitally Important For Regional Security
4|3|Pakistan Warns India Kashmir on Brink of Its Own Refugee Crisis as Somalis, Ethiopians Pour In"
4|5|Mexican President at Fidel Castro from Possessing You
4|5|Iran Says It Will Respond to U.S. Troops in War Zones"
4|1|Chinese Propaganda: 'Build More Strategic Nuclear Arms' to Fight Donald Trump selects 'Mad Dog' Mattis
4|5|Philippines' Duterte: Russia Offered Me Secretary of State Meet amid Dueling Trump Charm Offensives"
4|1|FAKE NEWS: Newsweek Admits They Didnt Even Write It
4|1|Austin Communists Arrested for Death Threat Against President Elect Slams Smug Media in Face-to-Face at Trump Tower Rent Free For 8 Years
4|4|"If Trump Election is Overturned, Who Will Be Annihilated'
4|3|A Very Concise Explanation Of Why The Democrats Real Strategy In Launching Recounts?
4|3|CBS Labels Infowars a Fake News Claims, Says IFJ"
4|1|"John Cantlie Resurfaces, Condemning 'Distressing' Attacks on Islamic State Looks to Regroup in Libya After Losing Job for Fake News
4|3|Russia: Erdogan's Vow to Communism
4|5|WATCH: IDF in Gaza Strip
4|2|Mass Murder by Bus? What If It Was a Mistake, Iran Deal Misinterpreted"
4|2|Proof Donald Trump Pinata
4|3|"Tim Allen: Hollywood Calls Trump a Chance
4|2|The Ultimate Fake News That MSNBC Personalities Spread to Discredit Wikileaks Docs
4|4|Buzzfeed: White People Leading The Democratic Party
4|1|Egypt's Top Constitutional Court Upholds Cyberactivist's 10-Year Jail Term
4|1|Glenn Beck: We Are Under Economic Sabotage!
4|3|"Trump: No Global Flag, No Global Currency, No Global Flag, No Global Citizenship"
4|5|Trump: Ohio Attacker Should Not Communicate With Them"
4|2|Chinese Propaganda: 'Build More Strategic Nuclear Arms' to Fight Donald Trump selects 'Mad Dog' James Mattis for Defense Secretary
4|2|Islam: War on Somali Al-Shabaab"
4|1|Defcon Nuclear Threat REDUCED To Safest Level Following Donald Trump Pinata
4|5|U.S. Government Is the Linchpin of History for America
4|3|San Antonio Police Officer Executed While Writing Traffic Ticket Suspect/ Black Man in Black Car
4|3|Erdogan 'Disillusioned' with Obama for What He Has Done'
4|3|"Obama, Despite Own Record, Demands Trump 'Stand Up to 15 Years in Prison
4|2|Pope Francis Calls for Boycott of CNN, MSNBC, New York Times Used Fake News War Accelerates
4|1|Note Making Fun of Butt-Hurt Leftists Deemed a Hate Crime Deemed A Hoax
4|5|"Ann Coulter: Appropriate Reaction to Those Calling Bannon Anti-Semitic, Racist Screw You"
4|1|Vietnam Challenges China with Bigger Military Facilities in South Sudan with Mandate to Use Force
4|1|U.S. Airstrikes Help Drive Islamic State Claims Ohio State University Terrorist Was a Mistake, Iran Deal Misinterpreted"
4|1|"If Trump Election is Overturned, Who Will Be Annihilated'
4|1|"Pope Pontificates on Fake News, the U.S. Government Is the Linchpin of History for America
4|1|EXCLUSIVE - Jackie Mason Slams Mitt Romney For Interest in State Job After Repeatedly Criticizing Donald Trump Pinata
4|1|Congressman: Dems Stalling Recount in Wisconsin Recount So Far"
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
1|1|"Vatican Tour Group Catches Glimpse Of Pale, Emaciated Joseph Ratzinger Scuttling Into Dark Catacombs"
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
1|1|"Scientists Slowly Reintroducing Small Group Of Normal, Well-Adjusted Humans Into Society"
1|1|Nation Comes To Halt To Watch Crane Move Massive Concrete Tube
1|1|Report: Leading Cause Of Death Still Venturing Beyond The Pines
1|1|World Makes Final Attempt To Try To Understand This Shit
1|1|Obama Receives Classified Briefing On Likelihood Of Krull Reboot
1|1|Nation Reaffirms Commitment To Things They Recognize
1|1|Hillary Clinton Appears Before Rally Completely Nude In Bid For Authenticity
1|1|"I Suffer From Severe Psychological Issues And I Need The Help Of Mental Health Professionals, Says Trump In Pointed Debate Comeback"
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
1|1|"New Company Aims To Explore Intersection Of Technology, Other Thing"
1|1|The Onion Humbly Offers Up Its Offices To Imprison The Women Who Have Wrongfully Accused Donald Trump
1|1|Sunny Saves Bo From Mountain Lion During Cross-Country Journey To Reunite With Obamas
1|1|Subway Breeding Program Successfully Creates Black Forest Ham/Meatball Marinara Hybrid
1|1|National Association Of Enablers To Americans: Cmon
1|1|CIA Orchestrates Coup DEtat To Replace Entire Population Of Venezuela
1|1|Man Wakes From Coma With Ability To Understand Health Insurance Policy
1|1|The Onion Has Obtained Donald Trumps Tax Returns And Has Chosen To Destroy Them
1|1|"Im A Trump-Era Conservative, Says Horrifying Man 25 Years From Now"
1|1|Investigators: First 48 Hours Most Critical In Locating Missing Children Who Entered Portal To Fantastical World
1|1|Hillary Clinton Bowls Over Catcher To Score Winning Run In Campaign Staff Softball Game
1|1|Seagull This Far Inland Must Be Total Fuckup
1|1|NASA Social Media Manager Considers Himself Part Of Team
1|1|"Its Hard Being Away From You All, Says Donald Trump While Spreading Bird Feed Around Rooftop Pigeon Coop"
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
1|1|"Report: U.S. Students Lack Language Skills, Vocabulary To Effectively Belittle Classmates"
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
1|1|"I Cant Do This Anymore, Think 320 Million Americans Quietly Going About Day"
1|1|"Melania Trump Stumbles Upon Dozens Of Husbands Haunting, Macabre Self-Portraits"
1|1|Late-Blooming Dad Just Now Getting Into Civil War History
1|1|Ayatollah Khamenei Addresses Tehran Prison Mess Hall During Annual Press Correspondents Dinner
1|1|Obama Holds Camp David Summit To Ease Tensions With Coyotes
1|1|No One Really Knows What Dad Was Doing From 1985 To 1988
1|1|"Trump: Remember, This Is Your Last Chance To Get Out Before This Goes Any Further"
1|1|"We Get The Food And Then We Eat The Food Until All The Food Is Gone, City Of Chicago Announces Unprompted"
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
1|1|"New Company Aims To Explore Intersection Of Technology, Other Thing"
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

	var _num_headlines = 0
	for _raw_headline in RAW_HEADLINES.split("\n", false):
		var _headline = _raw_headline.split("|")
		var _headline_alignment = _headline[0]
		var _headline_truthiness = _headline[1]
		var _headline_text = _headline[2]
		_headlines.append({
			'id': _num_headlines,
			'alignment': _headline_alignment,
			'truthiness': _headline_truthiness,
			'text': _headline_text
		})
		_num_headlines += 1
