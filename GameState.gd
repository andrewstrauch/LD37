extends Node

const RECEIVE_EMAIL_TIMER_MIN_INTERVAL = 1
const RECEIVE_EMAIL_TIMER_MAX_INTERVAL = 5
const EMAIL_BURNDOWN_TIMER_TIME = 40

const TRUTHINESS_THRESHOLD = 50
const LEFT_APPEAL_THRESHOLD = 0
const RIGHT_APPEAL_THRESHOLD = 0

const STARTING_TRUTHINESS = 85
const STARTING_LEFT_APPEAL = 25
const STARTING_RIGHT_APPEAL = 25

const MAX_TRUTHINESS = 100
const MAX_LEFT_APPEAL = 100
const MAX_RIGHT_APPEAL = 100

const APPEAL_BURNDOWN_TIMER_INTERVAL = 0.1
const APPEAL_BURNDOWN_TIMER_AMOUNT = -0.02

const EMAILS_PER_ROUND = 20

var number_of_emails_generated

var is_game_over
var current_truthiness
var current_left_appeal
var current_right_appeal

var opened_email_time_left

func _modify_current_truthiness(truthiness_delta):
	if is_game_over:
		return
	
	# spreading false (negative truthiness) news impacts your score more severely
	if (truthiness_delta < 0):
		truthiness_delta *= 10
		
	current_truthiness = min(max(current_truthiness + truthiness_delta, 0), MAX_TRUTHINESS)

	if current_truthiness <= 65:
		print("FUCK")
		var sample = get_tree().get_root().get_node("Main").get_node("SamplePlayer").get_sample_library().get_sample("test")
		sample.set_loop_format(sample.LOOP_FORWARD)
		sample.set_loop_begin(0)
		sample.set_loop_end(sample.get_length())
		get_node("SamplePlayer").play("test")

func _decrease_current_left_appeal(appeal_delta):
	if is_game_over:
		return
	
	current_left_appeal = min(max(current_left_appeal + appeal_delta, 0), MAX_LEFT_APPEAL)

func _increase_current_left_appeal(appeal_delta):
	if is_game_over:
		return
	
	var value_to_add = appeal_delta*6 - (EMAIL_BURNDOWN_TIMER_TIME-opened_email_time_left)*4
	value_to_add = max(value_to_add, 5)
	current_left_appeal = min(max(current_left_appeal + value_to_add, 0), MAX_LEFT_APPEAL)

func _decrease_current_right_appeal(appeal_delta):
	if is_game_over:
		return
		
	
	current_right_appeal = min(max(current_right_appeal + appeal_delta, 0), MAX_RIGHT_APPEAL)

func _increase_current_right_appeal(appeal_delta):
	if is_game_over:
		return
	
	var value_to_add = appeal_delta*6 - (EMAIL_BURNDOWN_TIMER_TIME-opened_email_time_left)*4
	value_to_add = max(value_to_add, 5)
	current_right_appeal = min(max(current_right_appeal + value_to_add, 0), MAX_RIGHT_APPEAL)

func _get_truthiness_delta(truthiness):
	return (truthiness - 3)

func _get_appeal_delta(truthiness):
	return TalkingPoints.HEADLINE_TRUTHINESS.size() - truthiness + 1

func publish_headline(headline):
	if is_game_over:
		return
	
	var truthiness_delta = _get_truthiness_delta(headline.truthiness)
	_modify_current_truthiness(truthiness_delta)

	var appeal_delta = _get_appeal_delta(headline.truthiness)
	if headline.alignment == TalkingPoints.HEADLINE_ALIGNMENT.LEFT:
		_increase_current_left_appeal(appeal_delta)
	elif headline.alignment == TalkingPoints.HEADLINE_ALIGNMENT.RIGHT:
		_increase_current_right_appeal(appeal_delta)

func burndown_appeal():
	if is_game_over:
		return
	

	#get_tree().get_root().get_node("Main").get_node("SamplePlayer").play("test")


	
	_decrease_current_left_appeal(APPEAL_BURNDOWN_TIMER_AMOUNT)
	_decrease_current_right_appeal(APPEAL_BURNDOWN_TIMER_AMOUNT)

func _ready():
	is_game_over = false
	current_truthiness = STARTING_TRUTHINESS
	current_left_appeal = STARTING_LEFT_APPEAL
	current_right_appeal = STARTING_RIGHT_APPEAL

	set_fixed_process(true)

func _end_game():
	is_game_over = true
	
	# TODO
	print("GAME OVER")

func _fixed_process(delta):
	if is_game_over:
		return

	# update all components using gamestate
	if (current_truthiness <= TRUTHINESS_THRESHOLD) or (current_left_appeal <= LEFT_APPEAL_THRESHOLD) or (current_right_appeal <= RIGHT_APPEAL_THRESHOLD):
		_end_game()
