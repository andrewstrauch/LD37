extends Node

var _gamestate

var _truthiness_bar
var _left_appeal_bar
var _right_appeal_bar

var _truthiness_percentage
var _left_appeal_percentage
var _right_appeal_percentage

func _on_appeal_burndown_timer_timeout():
	_gamestate.burndown_appeal()

func _ready():
	_gamestate = get_node("/root/GameState")

	_truthiness_bar = get_node("TruthinessBar")
	_truthiness_bar.set_max(_gamestate.MAX_TRUTHINESS)
	_left_appeal_bar = get_node("LeftAppealBar")
	_left_appeal_bar.set_max(_gamestate.MAX_LEFT_APPEAL)
	_right_appeal_bar = get_node("RightAppealBar")
	_right_appeal_bar.set_max(_gamestate.MAX_RIGHT_APPEAL)

	_truthiness_percentage = _truthiness_bar.get_node("TruthinessPercentage")
	_left_appeal_percentage = _left_appeal_bar.get_node("LeftAppealPercentage")
	_right_appeal_percentage = _right_appeal_bar.get_node("RightAppealPercentage")

	var _appeal_burndown_timer = get_node("AppealBurndownTimer")
	_appeal_burndown_timer.set_wait_time(_gamestate.APPEAL_BURNDOWN_TIMER_INTERVAL)
	_appeal_burndown_timer.connect("timeout", self, "_on_appeal_burndown_timer_timeout")
	_appeal_burndown_timer.start()

	set_fixed_process(true)

func _fixed_process(delta):
	# update all components using gamestate
	_truthiness_bar.set_value(_gamestate.current_truthiness)
	_truthiness_percentage.set_text(str(int(round((_gamestate.current_truthiness / float(_gamestate.MAX_TRUTHINESS)) * 100))) + "%")
	_left_appeal_bar.set_value(_gamestate.current_left_appeal)
	_left_appeal_percentage.set_text(str(int(round((_gamestate.current_left_appeal / float(_gamestate.MAX_LEFT_APPEAL)) * 100))) + "%")
	_right_appeal_bar.set_value(_gamestate.current_right_appeal)
	_right_appeal_percentage.set_text(str(int(round((_gamestate.current_right_appeal / float(_gamestate.MAX_RIGHT_APPEAL)) * 100))) + "%")
