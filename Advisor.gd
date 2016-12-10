extends Node2D

var hotkey
var hotkeyPressed = bool(false)
var talking = bool(false)
var canStopTalking = bool(false)

#Talking points

func _ready():
	get_node("Detect").connect("mouse_enter", self, "on_detect_body_enter")
	get_node("Detect").connect("mouse_exit", self, "on_detect_body_exit")
	set_fixed_process(true)

func _fixed_process(delta):
	#Refactor this to be outside class
	hotkeyPressed = Input.is_key_pressed(KEY_1)
	if (hotkeyPressed):
		if (not talking && not canStopTalking):
			talking = true
			canStopTalking = true
			startTalking()
	elif(not hotkeyPressed):
		if (canStopTalking):
			talking = false
			canStopTalking = false
			stopTalking()
		
func startTalking():
	print("Wolf On Hotkey!")
	
func stopTalking():
	print("Wolf Off Hotkey!")

func on_detect_body_enter():
	print("Wolf On Hover!")

func on_detect_body_exit():
	print("Wolf Off Hover!")
	
func set_hotkey(myHotkey):
	hotkey = myHotkey