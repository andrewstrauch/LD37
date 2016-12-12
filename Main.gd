extends Node2D

var headlineArray = []
var headlineBurndownTime = 15

var _gamestate
var receive_email_timer

var t

var c

var paused = true

func _ready():
	c = get_node("/root/Controller")
	_gamestate = get_node("/root/GameState")
	t = get_node("/root/TalkingPoints")

	receive_email_timer = get_node("ReceiveEmailTimer")
	_set_receive_email_timer_wait_time()
	receive_email_timer.connect("timeout", self, "_on_receive_email_timer_timeout")
	receive_email_timer.start()
	get_node("Instructions/Button").set_text("Fuck this, let's play!")
	get_node("Instructions/Button").connect("pressed", self, "on_play_button_push")
	get_node("Pause/Button").set_text("Unpause")
	get_node("Pause/Button").connect("pressed", self, "on_unpause_button_push")
	get_node("Pause").hide()
	get_node("MainPauseButton").set_text("Pause")
	get_node("MainPauseButton").connect("pressed", self, "on_main_pause_button_push")
	pause()
	get_node("Pause").hide()
	
	#print(get_tree().get_root().get_children())
	
	#for each in get_tree().get_root().get_children():
		#print (each.get_name())
	
	#Shuffle up stories into array
	#Pick first story, pull it out, push it to laptop scene
	#Reset timer as one-shot, set wait_time to default above
	#get_node("Advisors").get_children().hide()
	#foreach (get_node("Advisors").get_children())
	#for cps in get_tree().get_nodes_in_group("Checkpoints"):
	
	var advisorNum = 1
	#Hide the anchors
	for each in get_node("AdvisorAnchors").get_children():
		#print(each.get_name())
		each.hide()
		#Spawn Advisors
		var advisor = load("res://Advisor.tscn")
		var ai = advisor.instance()
		#get_tree().get_root().add_child(ai)
		ai.set_actual_name("Advisor" + str(advisorNum))
		ai.set_hotkey(advisorNum)
		get_node("Advisors").add_child(ai)
		#get_tree().get_root().get_node("world1-1").add_child(bi)
		ai.set_pos(each.get_pos())
		ai.set_name("Advisor" + str(advisorNum))
		advisorNum += 1
		ai.hide()
		
		#print(ai.get_name())
		
		#Pass in instance shit here
		#ai.init(isPlayerFacingRight)
		
		
	#get_node("Advisors").get_node("Advisor1").show()
	
	_add_email()
	_add_email()
	
	set_fixed_process(true)

func on_play_button_push():
	unpause()
	get_node("Instructions").hide()
	
func pause():
	get_tree().set_pause(true)
	paused = true
	get_node("MainPauseButton").hide()
	get_node("Pause").show()
	#get_node("Pause").set_z(100)
	
func unpause():
	get_tree().set_pause(false)
	paused = false
	get_node("MainPauseButton").show()
	get_node("Pause").hide()
	#get_node("Pause").set_z(100)
	
func on_unpause_button_push():
	unpause()

func on_main_pause_button_push():
	if(not paused):
		pause()

func _set_receive_email_timer_wait_time():
	randomize()
	receive_email_timer.set_wait_time(floor(randf() * (_gamestate.RECEIVE_EMAIL_TIMER_MAX_INTERVAL - _gamestate.RECEIVE_EMAIL_TIMER_MIN_INTERVAL + 1) + _gamestate.RECEIVE_EMAIL_TIMER_MIN_INTERVAL))

func _on_receive_email_timer_timeout():
	if _gamestate.is_game_over:
		receive_email_timer.stop()
		return

	_add_email()
	_set_receive_email_timer_wait_time()

func _add_email():
	var email = load("res://Email.tscn")
	var ei = email.instance()
	#ei.set_name("Bubble"+actualName)
	#add_child(ei)
	#ei.set_pos(get_pos() + offset)
	#get_node("Laptop").get_node("EmailClient").get_node("EmailScrollContainer").get_node("VBoxContainer").add_child(load("res://Email.tscn").instance())
	get_node("Laptop").get_node("EmailClient").get_node("EmailScrollContainer").get_node("VBoxContainer").add_child(ei)
func _fixed_process(delta):
	if(Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().quit()
	if (Input.is_key_pressed(KEY_P)):
		if(paused):
			unpause()
		else:
			pause()
