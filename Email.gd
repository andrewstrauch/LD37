extends Node

var _gamestate
var c

var _burndown_timer
var _burndown_progress_bar
var _headlines
var _headline

var hasBeenOpened = false

func get_burndown_timer_time_left():
	return _burndown_timer.get_time_left()

func _on_burndown_timer_timeout():
	_delete_email()

func _delete_email():
	queue_free()

func _ready():
	_gamestate = get_node("/root/GameState")
	c = get_node("/root/Controller")
	
	_burndown_timer = get_node("EmailSprite/BurndownTimer")
	_burndown_timer.connect("timeout", self, "_on_burndown_timer_timeout")

	self.connect("input_event", self, "_input_event")

	_burndown_progress_bar = get_node("EmailSprite/BurndownProgressBar")
	
	_headlines = get_node("/root/Headlines")
	_headline = _headlines.get_random_headline()
	var _headline_text_to_display = _headline.text
	if _headline_text_to_display.length() > 60:
		_headline_text_to_display = _headline_text_to_display.substr(0, 60) + "..."
	get_node("EmailSprite/HeadlineText").set_bbcode(_headline_text_to_display)

	set_fixed_process(true)
	pass

func _fixed_process(delta):
	if _gamestate.is_game_over:
		_burndown_timer.stop()
		return

	_burndown_progress_bar.set_value(_burndown_timer.get_time_left() / _burndown_timer.get_wait_time())

func _input_event(event):
	if (event.type == InputEvent.MOUSE_BUTTON && event.button_index == BUTTON_LEFT && not hasBeenOpened):
		if (c.readingAnEmail == false):
			c.readingAnEmail = true
			hasBeenOpened = true
			var opened = load("res://OpenedEmail.tscn")
			var oi = opened.instance()
			oi.set_headline(_headline)
			get_tree().get_root().add_child(oi)
			oi.pass_timer_time(get_burndown_timer_time_left())
			oi.set_pos(Vector2(250,340))

			#Show advisors
			#Random
			var unshuffledArray = ["Advisor1", "Advisor2", "Advisor3",
			"Advisor4", "Advisor5", "Advisor6"]
			var shuffledArray = []
			for item in unshuffledArray:
				var rand = randi()%2+1
				if (rand == 2):
					shuffledArray.push_back(item)
			c.emailsOpen = true
			c.advisorList= shuffledArray
			c.Advisor1 = true
			#print(c.advisorList)
			
			#Kill email header on spawn
			_delete_email()
