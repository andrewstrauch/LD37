extends Node

var _burndown_timer
var _burndown_progress_bar
var _headlines
var _headline

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
	get_node("Detect").connect("mouse_enter", self, "on_detect_mouse_enter")

	_burndown_progress_bar = get_node("EmailSprite").get_node("BurndownProgressBar")
	
	_headlines = get_node("/root/Headlines")
	_headline = _headlines.get_random_headline()
	var _headline_text_to_display = _headline.text
	if _headline_text_to_display.length() > 60:
		_headline_text_to_display = _headline_text_to_display.substr(0, 60) + "..."
	get_node("EmailSprite").get_node("HeadlineText").set_bbcode(_headline_text_to_display)

	set_fixed_process(true)
	pass

func _fixed_process(delta):
	_burndown_progress_bar.set_value(_burndown_timer.get_time_left() / _burndown_timer.get_wait_time())

#func _input(event):
#	if (event.type == InputEvent.MOUSE_BUTTON && event.button_index == BUTTON_LEFT && not hasBeenOpened):

func on_detect_mouse_enter():
	print("Moused")
	if (c.readingAnEmail == false):
		print(_headline)
		c.readingAnEmail = true
		hasBeenOpened = true
		var opened = load("res://OpenedEmail.tscn")
		var oi = opened.instance()
		#oi.get_node("Panel/HeadlineLabel").add_text("Test!")
		#get_node("EmailSprite").set_modulate("f58f8f")
		oi.set_headline(_headline)
		#oi.set_name("Bubble"+actualName)
		#print(bi.get_name())
		#oi.hide()
		#add_child(oi)
		get_tree().get_root().add_child(oi)
		oi.pass_timer_time(get_burndown_timer_time_left())
		oi.set_pos(Vector2(250,340))
		#Kill email header on spawn
		get_node("EmailSprite/BurndownTimer").stop()
		print(get_parent().get_child_count()-1)
		
		
		queue_free()
