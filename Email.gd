extends Node

var _burndown_timer
var _burndown_progress_bar

func get_burndown_timer_time_left():
	return _burndown_timer.get_time_left()

func _on_burndown_timer_timeout():
	queue_free()

func _ready():
	_burndown_timer = get_node("EmailSprite").get_node("BurndownTimer")
	_burndown_timer.connect("timeout", self, "_on_burndown_timer_timeout")

	_burndown_progress_bar = get_node("EmailSprite").get_node("BurndownProgressBar")

	set_fixed_process(true)
	pass

func _fixed_process(delta):
	_burndown_progress_bar.set_value(_burndown_timer.get_time_left() / _burndown_timer.get_wait_time())
	pass
