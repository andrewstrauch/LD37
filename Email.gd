extends Node

var _burndown_timer
var _burndown_progress_bar

var hasBeenOpened = false

var c

func get_burndown_timer_time_left():
	return _burndown_timer.get_time_left()

func _on_burndown_timer_timeout():
	queue_free()

func _ready():
	c = get_node("/root/Controller")
	set_process_input(true)
	_burndown_timer = get_node("EmailSprite").get_node("BurndownTimer")
	_burndown_timer.connect("timeout", self, "_on_burndown_timer_timeout")

	_burndown_progress_bar = get_node("EmailSprite").get_node("BurndownProgressBar")

	set_fixed_process(true)
	pass

func _fixed_process(delta):
	_burndown_progress_bar.set_value(_burndown_timer.get_time_left() / _burndown_timer.get_wait_time())

func _input(event):
	if (event.type == InputEvent.MOUSE_BUTTON && event.button_index == BUTTON_LEFT && not hasBeenOpened):
		if (c.get_reading_an_email() == false):
			c.set_reading_an_email(true)
			#print(hasBeenOpened)
			set_process_input(false)
			hasBeenOpened = true
			var opened = load("res://OpenedEmail.tscn")
			var oi = opened.instance()
			#oi.set_name("Bubble"+actualName)
			#print(bi.get_name())
			#oi.hide()
			#add_child(oi)
			get_tree().get_root().add_child(oi)
			oi.set_pos(get_pos() + Vector2(250,340))