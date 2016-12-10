extends Node2D

var hotkey

#Talking points

func _ready():
	get_node("Detect").connect("mouse_enter", self, "on_detect_body_enter")
	#Refactor this to be outside class
	hotkey = Input.is_key_pressed(KEY_1)
	set_fixed_process(true)

func _fixed_process(delta):
	if (hotkey):
		print("Hotkey!")

func on_detect_body_enter():
	print("Wolf!")
	
func set_hotkey(myHotkey):
	hotkey = myHotkey