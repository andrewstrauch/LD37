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

# SUPER LEFT

const SUPER_LEFT_LEFT = [
	"THIS IS THE REAL NEWS. IF YOU DON'T PRINT THIS, YOU'LL BE DOING ALL OF AMERICA A GREAT DISSERVICE. ARE YOU SOME KIND OF NEO-NAZI? DO YOU WANT CHILDREN TO DIE?"
]
const SUPER_LEFT_RIGHT = [
	"GET THIS FUCKING HORSESHIT OUT OF HERE. BUSH IS RESPONSIBLE FOR THE ECONOMIC DOWNTURN. CLINTON AND OBAMA ARE THE HEROES WE NEED AND DESERVE!"
]

const SUPER_LEFT_COMPLETELY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_LEFT_COMPLETELY_FALSE_LEFT = SUPER_LEFT_LEFT
const SUPER_LEFT_COMPLETELY_FALSE_MODERATE = [
	"This is an absolutely ridiculous headline that passes itself off as 'moderate.' Get this shit out of here!"
]
const SUPER_LEFT_COMPLETELY_FALSE_RIGHT = SUPER_LEFT_RIGHT

const SUPER_LEFT_MOSTLY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_LEFT_MOSTLY_FALSE_LEFT = SUPER_LEFT_LEFT
const SUPER_LEFT_MOSTLY_FALSE_MODERATE = [
	"They took the truth and they completely fucked it up. Probably the doing of the alt-right plebians."
]
const SUPER_LEFT_MOSTLY_FALSE_RIGHT = SUPER_LEFT_RIGHT

const SUPER_LEFT_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_LEFT_FALSE_LEFT = SUPER_LEFT_LEFT
const SUPER_LEFT_FALSE_MODERATE = [
	"This is playing fast and loose with the facts in a way my hyper-socialist viewpoint frowns upon."
]
const SUPER_LEFT_FALSE_RIGHT = SUPER_LEFT_RIGHT

const SUPER_LEFT_NEUTRAL_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_LEFT_NEUTRAL_LEFT = SUPER_LEFT_LEFT
const SUPER_LEFT_NEUTRAL_MODERATE = [
	"It might be both true and false, but there's no spin! BORING!"
]
const SUPER_LEFT_NEUTRAL_RIGHT = SUPER_LEFT_RIGHT

const SUPER_LEFT_MOSTLY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_LEFT_MOSTLY_TRUE_LEFT = SUPER_LEFT_LEFT
const SUPER_LEFT_MOSTLY_TRUE_MODERATE = [
	"This is pretty factual and accurate, but doesn't tell a good story..."
]
const SUPER_LEFT_MOSTLY_TRUE_RIGHT = SUPER_LEFT_RIGHT

const SUPER_LEFT_COMPLETELY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_LEFT_COMPLETELY_TRUE_LEFT = SUPER_LEFT_LEFT
const SUPER_LEFT_COMPLETELY_TRUE_MODERATE = [
	"Yeah, this is true. So what? Wasted story though. Not worth reading."
]
const SUPER_LEFT_COMPLETELY_TRUE_RIGHT = SUPER_LEFT_RIGHT

# LEFT

const LEFT_COMPLETELY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const LEFT_COMPLETELY_FALSE_LEFT = [
	""
]
const LEFT_COMPLETELY_FALSE_MODERATE = [
	""
]
const LEFT_COMPLETELY_FALSE_RIGHT = [
	""
]

const LEFT_MOSTLY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const LEFT_MOSTLY_FALSE_LEFT = [
	""
]
const LEFT_MOSTLY_FALSE_MODERATE = [
	""
]
const LEFT_MOSTLY_FALSE_RIGHT = [
	""
]

const LEFT_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const LEFT_FALSE_LEFT = [
	""
]
const LEFT_FALSE_MODERATE = [
	""
]
const LEFT_FALSE_RIGHT = [
	""
]

const LEFT_NEUTRAL_SPAM = COMPLETELY_FALSE_SPAM
const LEFT_NEUTRAL_LEFT = [
	""
]
const LEFT_NEUTRAL_MODERATE = [
	""
]
const LEFT_NEUTRAL_RIGHT = [
	""
]

const LEFT_MOSTLY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const LEFT_MOSTLY_TRUE_LEFT = [
	""
]
const LEFT_MOSTLY_TRUE_MODERATE = [
	""
]
const LEFT_MOSTLY_TRUE_RIGHT = [
	""
]

const LEFT_COMPLETELY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const LEFT_COMPLETELY_TRUE_LEFT = [
	""
]
const LEFT_COMPLETELY_TRUE_MODERATE = [
	""
]
const LEFT_COMPLETELY_TRUE_RIGHT = [
	""
]

# MODERATE

const MODERATE_COMPLETELY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const MODERATE_COMPLETELY_FALSE_LEFT = [
	""
]
const MODERATE_COMPLETELY_FALSE_MODERATE = [
	""
]
const MODERATE_COMPLETELY_FALSE_RIGHT = [
	""
]

const MODERATE_MOSTLY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const MODERATE_MOSTLY_FALSE_LEFT = [
	""
]
const MODERATE_MOSTLY_FALSE_MODERATE = [
	""
]
const MODERATE_MOSTLY_FALSE_RIGHT = [
	""
]

const MODERATE_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const MODERATE_FALSE_LEFT = [
	""
]
const MODERATE_FALSE_MODERATE = [
	""
]
const MODERATE_FALSE_RIGHT = [
	""
]

const MODERATE_NEUTRAL_SPAM = COMPLETELY_FALSE_SPAM
const MODERATE_NEUTRAL_LEFT = [
	""
]
const MODERATE_NEUTRAL_MODERATE = [
	""
]
const MODERATE_NEUTRAL_RIGHT = [
	""
]

const MODERATE_MOSTLY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const MODERATE_MOSTLY_TRUE_LEFT = [
	""
]
const MODERATE_MOSTLY_TRUE_MODERATE = [
	""
]
const MODERATE_MOSTLY_TRUE_RIGHT = [
	""
]

const MODERATE_COMPLETELY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const MODERATE_COMPLETELY_TRUE_LEFT = [
	""
]
const MODERATE_COMPLETELY_TRUE_MODERATE = [
	""
]
const MODERATE_COMPLETELY_TRUE_RIGHT = [
	""
]

# RIGHT

const RIGHT_COMPLETELY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const RIGHT_COMPLETELY_FALSE_LEFT = [
	""
]
const RIGHT_COMPLETELY_FALSE_MODERATE = [
	""
]
const RIGHT_COMPLETELY_FALSE_RIGHT = [
	""
]

const RIGHT_MOSTLY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const RIGHT_MOSTLY_FALSE_LEFT = [
	""
]
const RIGHT_MOSTLY_FALSE_MODERATE = [
	""
]
const RIGHT_MOSTLY_FALSE_RIGHT = [
	""
]

const RIGHT_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const RIGHT_FALSE_LEFT = [
	""
]
const RIGHT_FALSE_MODERATE = [
	""
]
const RIGHT_FALSE_RIGHT = [
	""
]

const RIGHT_NEUTRAL_SPAM = COMPLETELY_FALSE_SPAM
const RIGHT_NEUTRAL_LEFT = [
	""
]
const RIGHT_NEUTRAL_MODERATE = [
	""
]
const RIGHT_NEUTRAL_RIGHT = [
	""
]

const RIGHT_MOSTLY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const RIGHT_MOSTLY_TRUE_LEFT = [
	""
]
const RIGHT_MOSTLY_TRUE_MODERATE = [
	""
]
const RIGHT_MOSTLY_TRUE_RIGHT = [
	""
]

const RIGHT_COMPLETELY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const RIGHT_COMPLETELY_TRUE_LEFT = [
	""
]
const RIGHT_COMPLETELY_TRUE_MODERATE = [
	""
]
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
const SUPER_RIGHT_COMPLETELY_FALSE_MODERATE = [
	"This is an absolutely ridiculous headline that passes itself off as 'moderate.' Get this shit out of here!"
]
const SUPER_RIGHT_COMPLETELY_FALSE_RIGHT = SUPER_RIGHT_RIGHT

const SUPER_RIGHT_MOSTLY_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_RIGHT_MOSTLY_FALSE_LEFT = SUPER_RIGHT_LEFT
const SUPER_RIGHT_MOSTLY_FALSE_MODERATE = [
	"There might have been facts here at one point, but this is some libtard shit moderate right here."
]
const SUPER_RIGHT_MOSTLY_FALSE_RIGHT = SUPER_RIGHT_RIGHT

const SUPER_RIGHT_FALSE_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_RIGHT_FALSE_LEFT = SUPER_RIGHT_LEFT
const SUPER_RIGHT_FALSE_MODERATE = [
	"This is playing fast and loose with the facts in a way my hyper-socialist viewpoint frowns upon."
]
const SUPER_RIGHT_FALSE_RIGHT = SUPER_RIGHT_RIGHT

const SUPER_RIGHT_NEUTRAL_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_RIGHT_NEUTRAL_LEFT = SUPER_RIGHT_LEFT
const SUPER_RIGHT_NEUTRAL_MODERATE = [
	"It might be both true and false, but there's no spin! BORING!"
]
const SUPER_RIGHT_NEUTRAL_RIGHT = SUPER_RIGHT_RIGHT

const SUPER_RIGHT_MOSTLY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_RIGHT_MOSTLY_TRUE_LEFT = SUPER_RIGHT_LEFT
const SUPER_RIGHT_MOSTLY_TRUE_MODERATE = [
	"This is pretty factual and accurate, but doesn't tell a good story..."
]
const SUPER_RIGHT_MOSTLY_TRUE_RIGHT = SUPER_RIGHT_RIGHT

const SUPER_RIGHT_COMPLETELY_TRUE_SPAM = COMPLETELY_FALSE_SPAM
const SUPER_RIGHT_COMPLETELY_TRUE_LEFT = SUPER_RIGHT_LEFT
const SUPER_RIGHT_COMPLETELY_TRUE_MODERATE = [
	"Yeah, this is true. So what? Wasted story though. Not worth reading."
]
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
