extends Node

const ADVISOR_ALIGNMENT = {
    SUPER_LEFT = 1,	# they'll push LEFT headlines and pass on RIGHT headlines no matter the truthiness
    LEFT = 2,
    MODERATE = 3,
    RIGHT = 4,
	SUPER_RIGHT = 5	# they'll push RIGHT headlines and pass on LEFT headlines no matter the truthiness
}

const HEADLINE_TRUTHINESS = {
    COMPLETELY_FALSE = 1,
    MOSTLY_FALSE = 2,
    NEUTRAL = 3,
    MOSTLY_TRUE = 4,
    COMPLETELY_TRUE = 5
}

const HEADLINE_ALIGNMENT = {
    SPAM = 1,
    LEFT = 2,
    MODERATE = 3,
    RIGHT = 4
}

# spam is only ever completely false
const COMPLETELY_FALSE_SPAM = [
	"Is it even legal to send these kinds of emails?",
	"Someone notify the NSA; I think we've been hacked!"
]

# moderate news is only ever completely true
const COMPLETELY_TRUE_MODERATE = [
	"It's safe to say that this one is true.",
	"Passed the fact checkers with flying colors. Print it.",
	"I can't imagine anyone would question this story.",
	"Even the skeptics will take this story at face value."
]

# SUPER LEFT

const SUPER_LEFT_LEFT = [
	"THIS IS THE REAL NEWS. IF YOU DON'T PRINT THIS, YOU'LL BE DOING ALL OF AMERICA A GREAT DISSERVICE. ARE YOU SOME KIND OF NEO-NAZI? DO YOU WANT CHILDREN TO DIE?"
]
const SUPER_LEFT_RIGHT = [
	"GET THIS FUCKING HORSESHIT OUT OF HERE. BUSH IS RESPONSIBLE FOR THE ECONOMIC DOWNTURN. CLINTON AND OBAMA ARE THE HEROES WE NEED AND DESERVE!"
]

const SUPER_LEFT_COMPLETELY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_LEFT_COMPLETELY_FALSE_LEFT = SUPER_LEFT_LEFT
const SUPER_LEFT_COMPLETELY_FALSE_MODERATE = COMPLETELY_TRUE_MODERATE

const SUPER_LEFT_COMPLETELY_FALSE_RIGHT = SUPER_LEFT_RIGHT

const SUPER_LEFT_MOSTLY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_LEFT_MOSTLY_FALSE_LEFT = SUPER_LEFT_LEFT
const SUPER_LEFT_MOSTLY_FALSE_MODERATE = COMPLETELY_TRUE_MODERATE

const SUPER_LEFT_MOSTLY_FALSE_RIGHT = SUPER_LEFT_RIGHT

const SUPER_LEFT_NEUTRAL_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_LEFT_NEUTRAL_LEFT = SUPER_LEFT_LEFT
const SUPER_LEFT_NEUTRAL_MODERATE = COMPLETELY_TRUE_MODERATE

const SUPER_LEFT_NEUTRAL_RIGHT = SUPER_LEFT_RIGHT

const SUPER_LEFT_MOSTLY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_LEFT_MOSTLY_TRUE_LEFT = SUPER_LEFT_LEFT
const SUPER_LEFT_MOSTLY_TRUE_MODERATE = COMPLETELY_TRUE_MODERATE

const SUPER_LEFT_MOSTLY_TRUE_RIGHT = SUPER_LEFT_RIGHT

const SUPER_LEFT_COMPLETELY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_LEFT_COMPLETELY_TRUE_LEFT = SUPER_LEFT_LEFT
const SUPER_LEFT_COMPLETELY_TRUE_MODERATE = COMPLETELY_TRUE_MODERATE

const SUPER_LEFT_COMPLETELY_TRUE_RIGHT = SUPER_LEFT_RIGHT

# LEFT

const LEFT_COMPLETELY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const LEFT_COMPLETELY_FALSE_LEFT = [
	"My God, I wish this were true. This would totally discredit the alt-right FOREVER! Absolutely incredible."
]
const LEFT_COMPLETELY_FALSE_MODERATE = COMPLETELY_TRUE_MODERATE

const LEFT_COMPLETELY_FALSE_RIGHT = [
	"These alt-right whack-jobs will stop at nothing to discredit us! Only an inbred retard would believe this insanity."
]

const LEFT_COMPLETELY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const LEFT_COMPLETELY_FALSE_LEFT = [
	"My God, I wish this were true. This would totally discredit the alt-right FOREVER! Absolutely incredible."
]
const LEFT_COMPLETELY_FALSE_MODERATE = COMPLETELY_TRUE_MODERATE
const LEFT_COMPLETELY_FALSE_RIGHT = [
	"These alt-right whack-jobs will stop at nothing to discredit us! Only an inbred retard would believe this insanity."
]

const LEFT_MOSTLY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const LEFT_MOSTLY_FALSE_LEFT = [
	"LOVE IT! It is a LITTLE heavy on the liberal propaganda, but sometimes you gotta say what people want to hear, you know?"
]
const LEFT_MOSTLY_FALSE_MODERATE = COMPLETELY_TRUE_MODERATE

const LEFT_MOSTLY_FALSE_RIGHT = [
	"They think anyone will buy this racist sexist garbage? They're just making jokes out of themselves."
]

const LEFT_NEUTRAL_SPAM = COMPLETELY_FALSE_SPAM
const LEFT_NEUTRAL_LEFT = [
	"This is great! I'm not sure Obama would be able to hand-deliver gifts to EVERY child in America, but man, what a feel-good story!"
]
const LEFT_NEUTRAL_MODERATE = COMPLETELY_TRUE_MODERATE
const LEFT_NEUTRAL_RIGHT = [
	"I've definitely heard crazier stories from the right, but this is just pathetically ignorant."
]

const LEFT_MOSTLY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const LEFT_MOSTLY_TRUE_LEFT = [
	"Oooh, those white supremacist scum are gonna squirm when this story gets out!"
]
const LEFT_MOSTLY_TRUE_MODERATE = COMPLETELY_TRUE_MODERATE
const LEFT_MOSTLY_TRUE_RIGHT = [
	"I... don't understand. This is actually passing through the fact checkers. How? How??"
]

const LEFT_COMPLETELY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const LEFT_COMPLETELY_TRUE_LEFT = [
	"Print this! Print it NOW! This will absolutely annihilate those racist Trump supporters for good!"
]
const LEFT_COMPLETELY_TRUE_MODERATE = COMPLETELY_TRUE_MODERATE
const LEFT_COMPLETELY_TRUE_RIGHT = [
	"Oh my God. The racists were RIGHT ALL ALONG. I don't even know what to believe anymore!!"
]

# MODERATE

const MODERATE_COMPLETELY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const MODERATE_COMPLETELY_FALSE_LEFT = [
	"You've got to be kidding me with that headline. Get that pseudo-progressive bleeding heart trash out of here."
]
const MODERATE_COMPLETELY_FALSE_MODERATE = COMPLETELY_TRUE_MODERATE
const MODERATE_COMPLETELY_FALSE_RIGHT = [
	"This is a parody of conservatism, right? Did you find this trash scrawled on the wall of an insane asylum?"
]

const MODERATE_MOSTLY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const MODERATE_MOSTLY_FALSE_LEFT = [
	"Okay, come on, this is obviously bullshit social-justice-warrior pandering."
]
const MODERATE_MOSTLY_FALSE_MODERATE = COMPLETELY_TRUE_MODERATE
const MODERATE_MOSTLY_FALSE_RIGHT = [
	"Are they trying to start the next birther movement with this story? No way this is legit."
]

const MODERATE_NEUTRAL_SPAM = COMPLETELY_FALSE_SPAM
const MODERATE_NEUTRAL_LEFT = [
	"I'm skeptical about some of these facts. How could Paul Ryan have known which orphanage to burn down?"
]
const MODERATE_NEUTRAL_MODERATE = COMPLETELY_TRUE_MODERATE
const MODERATE_NEUTRAL_RIGHT = [
	"I don't understand why they had to include that part about Obama's gay affair, but the rest of it is actually surprisingly true."
]

const MODERATE_MOSTLY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const MODERATE_MOSTLY_TRUE_LEFT = [
	"Oh yeah, this story is the real deal. Even the Republicans will have to reconsider their stance after this."
]
const MODERATE_MOSTLY_TRUE_MODERATE = COMPLETELY_TRUE_MODERATE
const MODERATE_MOSTLY_TRUE_RIGHT = [
	"FOX News actually nailed this one. People need to hear this uncomfortable truth."
]

const MODERATE_COMPLETELY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const MODERATE_COMPLETELY_TRUE_LEFT = [
	"This is HUGE news. HuffPo and MSNBC are going to be jerking off for days when this story breaks!"
]
const MODERATE_COMPLETELY_TRUE_MODERATE = COMPLETELY_TRUE_MODERATE
const MODERATE_COMPLETELY_TRUE_RIGHT = [
	"My God, those conspiracy theorists... they were actually right! We can't let the liberal media cover this up!"
]

# RIGHT

const RIGHT_COMPLETELY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const RIGHT_COMPLETELY_FALSE_LEFT = [
	""
]
const RIGHT_COMPLETELY_FALSE_MODERATE = COMPLETELY_TRUE_MODERATE
const RIGHT_COMPLETELY_FALSE_RIGHT = [
	""
]

const RIGHT_MOSTLY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const RIGHT_MOSTLY_FALSE_LEFT = [
	""
]
const RIGHT_MOSTLY_FALSE_MODERATE = COMPLETELY_TRUE_MODERATE
const RIGHT_MOSTLY_FALSE_RIGHT = [
	""
]

const RIGHT_NEUTRAL_SPAM = COMPLETELY_FALSE_SPAM
const RIGHT_NEUTRAL_LEFT = [
	""
]
const RIGHT_NEUTRAL_MODERATE = COMPLETELY_TRUE_MODERATE
const RIGHT_NEUTRAL_RIGHT = [
	""
]

const RIGHT_MOSTLY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const RIGHT_MOSTLY_TRUE_LEFT = [
	""
]
const RIGHT_MOSTLY_TRUE_MODERATE = COMPLETELY_TRUE_MODERATE
const RIGHT_MOSTLY_TRUE_RIGHT = [
	""
]

const RIGHT_COMPLETELY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const RIGHT_COMPLETELY_TRUE_LEFT = [
	""
]
const RIGHT_COMPLETELY_TRUE_MODERATE = COMPLETELY_TRUE_MODERATE
const RIGHT_COMPLETELY_TRUE_RIGHT = [
	""
]

# SUPER RIGHT

const SUPER_RIGHT_LEFT = [
	"IT'S CRAZY HOW OBAMA CONTINUES TO SPEW HIS SOCIALIST SHIT EVEN WHILE LEAVING OFFICE. BURY THIS STORY NOW."
]
const SUPER_RIGHT_RIGHT = [
	"THIS IS THE REAL AMERICA. IT'S ABOUT TIME SOMEONE HAS THE BALLS TO FUCKING TELL THE TRUTH AROUND HERE. PRINT THIS OR YOU AREN'T A REAL AMERICAN."
]

const SUPER_RIGHT_COMPLETELY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_RIGHT_COMPLETELY_FALSE_LEFT = SUPER_RIGHT_LEFT
const SUPER_RIGHT_COMPLETELY_FALSE_MODERATE = COMPLETELY_TRUE_MODERATE
const SUPER_RIGHT_COMPLETELY_FALSE_RIGHT = SUPER_RIGHT_RIGHT

const SUPER_RIGHT_MOSTLY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_RIGHT_MOSTLY_FALSE_LEFT = SUPER_RIGHT_LEFT
const SUPER_RIGHT_MOSTLY_FALSE_MODERATE = COMPLETELY_TRUE_MODERATE
const SUPER_RIGHT_MOSTLY_FALSE_RIGHT = SUPER_RIGHT_RIGHT

const SUPER_RIGHT_COMPLETELY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_RIGHT_COMPLETELY_FALSE_LEFT = SUPER_RIGHT_LEFT
const SUPER_RIGHT_COMPLETELY_FALSE_MODERATE = COMPLETELY_TRUE_MODERATE
const SUPER_RIGHT_COMPLETELY_FALSE_RIGHT = SUPER_RIGHT_RIGHT

const SUPER_RIGHT_NEUTRAL_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_RIGHT_NEUTRAL_LEFT = SUPER_RIGHT_LEFT
const SUPER_RIGHT_NEUTRAL_MODERATE = COMPLETELY_TRUE_MODERATE
const SUPER_RIGHT_NEUTRAL_RIGHT = SUPER_RIGHT_RIGHT

const SUPER_RIGHT_MOSTLY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_RIGHT_MOSTLY_TRUE_LEFT = SUPER_RIGHT_LEFT
const SUPER_RIGHT_MOSTLY_TRUE_MODERATE = COMPLETELY_TRUE_MODERATE
const SUPER_RIGHT_MOSTLY_TRUE_RIGHT = SUPER_RIGHT_RIGHT

const SUPER_RIGHT_COMPLETELY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_RIGHT_COMPLETELY_TRUE_LEFT = SUPER_RIGHT_LEFT
const SUPER_RIGHT_COMPLETELY_TRUE_MODERATE = COMPLETELY_TRUE_MODERATE
const SUPER_RIGHT_COMPLETELY_TRUE_RIGHT = SUPER_RIGHT_RIGHT

func get_talking_point(advisor_alignment, headline_truthiness, headline_alignment):
	var talking_points = null

	if advisor_alignment == ADVISOR_ALIGNMENT.SUPER_LEFT:
		if headline_truthiness == HEADLINE_TRUTHINESS.COMPLETELY_FALSE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = SUPER_LEFT_COMPLETELY_FALSE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = SUPER_LEFT_COMPLETELY_FALSE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = SUPER_LEFT_COMPLETELY_FALSE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = SUPER_LEFT_COMPLETELY_FALSE_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.MOSTLY_FALSE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = SUPER_LEFT_MOSTLY_FALSE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = SUPER_LEFT_MOSTLY_FALSE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = SUPER_LEFT_MOSTLY_FALSE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = SUPER_LEFT_MOSTLY_FALSE_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.NEUTRAL:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = SUPER_LEFT_NEUTRAL_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = SUPER_LEFT_NEUTRAL_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = SUPER_LEFT_NEUTRAL_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = SUPER_LEFT_NEUTRAL_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.MOSTLY_TRUE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = SUPER_LEFT_MOSTLY_TRUE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = SUPER_LEFT_MOSTLY_TRUE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = SUPER_LEFT_MOSTLY_TRUE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = SUPER_LEFT_MOSTLY_TRUE_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.COMPLETELY_TRUE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = SUPER_LEFT_COMPLETELY_TRUE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = SUPER_LEFT_COMPLETELY_TRUE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = SUPER_LEFT_COMPLETELY_TRUE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = SUPER_LEFT_COMPLETELY_TRUE_RIGHT
	elif advisor_alignment == ADVISOR_ALIGNMENT.LEFT:
		if headline_truthiness == HEADLINE_TRUTHINESS.COMPLETELY_FALSE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = LEFT_COMPLETELY_FALSE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = LEFT_COMPLETELY_FALSE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = LEFT_COMPLETELY_FALSE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = LEFT_COMPLETELY_FALSE_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.MOSTLY_FALSE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = LEFT_MOSTLY_FALSE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = LEFT_MOSTLY_FALSE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = LEFT_MOSTLY_FALSE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = LEFT_MOSTLY_FALSE_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.NEUTRAL:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = LEFT_NEUTRAL_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = LEFT_NEUTRAL_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = LEFT_NEUTRAL_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = LEFT_NEUTRAL_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.MOSTLY_TRUE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = LEFT_MOSTLY_TRUE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = LEFT_MOSTLY_TRUE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = LEFT_MOSTLY_TRUE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = LEFT_MOSTLY_TRUE_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.COMPLETELY_TRUE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = LEFT_COMPLETELY_TRUE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = LEFT_COMPLETELY_TRUE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = LEFT_COMPLETELY_TRUE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = LEFT_COMPLETELY_TRUE_RIGHT
	elif advisor_alignment == ADVISOR_ALIGNMENT.MODERATE:
		if headline_truthiness == HEADLINE_TRUTHINESS.COMPLETELY_FALSE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = MODERATE_COMPLETELY_FALSE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = MODERATE_COMPLETELY_FALSE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = MODERATE_COMPLETELY_FALSE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = MODERATE_COMPLETELY_FALSE_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.MOSTLY_FALSE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = MODERATE_MOSTLY_FALSE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = MODERATE_MOSTLY_FALSE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = MODERATE_MOSTLY_FALSE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = MODERATE_MOSTLY_FALSE_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.NEUTRAL:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = MODERATE_NEUTRAL_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = MODERATE_NEUTRAL_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = MODERATE_NEUTRAL_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = MODERATE_NEUTRAL_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.MOSTLY_TRUE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = MODERATE_MOSTLY_TRUE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = MODERATE_MOSTLY_TRUE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = MODERATE_MOSTLY_TRUE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = MODERATE_MOSTLY_TRUE_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.COMPLETELY_TRUE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = MODERATE_COMPLETELY_TRUE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = MODERATE_COMPLETELY_TRUE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = MODERATE_COMPLETELY_TRUE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = MODERATE_COMPLETELY_TRUE_RIGHT
	elif advisor_alignment == ADVISOR_ALIGNMENT.RIGHT:
		if headline_truthiness == HEADLINE_TRUTHINESS.COMPLETELY_FALSE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = RIGHT_COMPLETELY_FALSE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = RIGHT_COMPLETELY_FALSE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = RIGHT_COMPLETELY_FALSE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = RIGHT_COMPLETELY_FALSE_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.MOSTLY_FALSE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = RIGHT_MOSTLY_FALSE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = RIGHT_MOSTLY_FALSE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = RIGHT_MOSTLY_FALSE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = RIGHT_MOSTLY_FALSE_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.NEUTRAL:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = RIGHT_NEUTRAL_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = RIGHT_NEUTRAL_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = RIGHT_NEUTRAL_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = RIGHT_NEUTRAL_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.MOSTLY_TRUE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = RIGHT_MOSTLY_TRUE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = RIGHT_MOSTLY_TRUE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = RIGHT_MOSTLY_TRUE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = RIGHT_MOSTLY_TRUE_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.COMPLETELY_TRUE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = RIGHT_COMPLETELY_TRUE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = RIGHT_COMPLETELY_TRUE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = RIGHT_COMPLETELY_TRUE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = RIGHT_COMPLETELY_TRUE_RIGHT
	elif advisor_alignment == ADVISOR_ALIGNMENT.SUPER_RIGHT:
		if headline_truthiness == HEADLINE_TRUTHINESS.COMPLETELY_FALSE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = SUPER_RIGHT_COMPLETELY_FALSE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = SUPER_RIGHT_COMPLETELY_FALSE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = SUPER_RIGHT_COMPLETELY_FALSE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = SUPER_RIGHT_COMPLETELY_FALSE_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.MOSTLY_FALSE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = SUPER_RIGHT_MOSTLY_FALSE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = SUPER_RIGHT_MOSTLY_FALSE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = SUPER_RIGHT_MOSTLY_FALSE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = SUPER_RIGHT_MOSTLY_FALSE_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.NEUTRAL:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = SUPER_RIGHT_NEUTRAL_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = SUPER_RIGHT_NEUTRAL_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = SUPER_RIGHT_NEUTRAL_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = SUPER_RIGHT_NEUTRAL_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.MOSTLY_TRUE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = SUPER_RIGHT_MOSTLY_TRUE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = SUPER_RIGHT_MOSTLY_TRUE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = SUPER_RIGHT_MOSTLY_TRUE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = SUPER_RIGHT_MOSTLY_TRUE_RIGHT
		elif headline_truthiness == HEADLINE_TRUTHINESS.COMPLETELY_TRUE:
			if headline_alignment == HEADLINE_ALIGNMENT.SPAM:
				talking_points = SUPER_RIGHT_COMPLETELY_TRUE_SPAM
			elif headline_alignment == HEADLINE_ALIGNMENT.LEFT:
				talking_points = SUPER_RIGHT_COMPLETELY_TRUE_LEFT
			elif headline_alignment == HEADLINE_ALIGNMENT.MODERATE:
				talking_points = SUPER_RIGHT_COMPLETELY_TRUE_MODERATE
			elif headline_alignment == HEADLINE_ALIGNMENT.RIGHT:
				talking_points = SUPER_RIGHT_COMPLETELY_TRUE_RIGHT

	var talking_point = "Doesn't look like anything to me."
	if talking_points != null:
		randomize()
		var random_talking_points_array_index = randi() % talking_points.size()
		talking_point = talking_points[random_talking_points_array_index]

	return talking_point

func _ready():
	pass
