extends Node2D

var hotkey
var hotkeyPressed = bool(false)
var talking = bool(false)
var canStopTalking = bool(false)
var actualName
var bubbleNumber = 1

const leftMargin = -90
const rightMargin = -40
const topMargin = 10
const bottomMargin = -10
const centerOffset = -65

#Vector2 offsets
	
var advisorOneOffset = Vector2(rightMargin,0)
var advisorTwoOffset = Vector2(rightMargin,0)
var advisorThreeOffset = Vector2(centerOffset,0)
var advisorFourOffset = Vector2(centerOffset,0)
var advisorFiveOffset = Vector2(leftMargin,0)
var advisorSixOffset = Vector2(leftMargin,0)

#Talking points

func _ready():
	get_node("Detect").connect("mouse_enter", self, "on_detect_body_enter")
	get_node("Detect").connect("mouse_exit", self, "on_detect_body_exit")
	
	_spawn_bubbles(actualName)
	#print(actualName)
	
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

func _spawn_bubbles(myName):
	var bubbleName
	var offset = Vector2()
	
	if (myName == "Advisor1"):
		offset = advisorOneOffset
	if (myName == "Advisor2"):
		offset = advisorTwoOffset
	if (myName == "Advisor3"):
		offset = advisorThreeOffset
	if (myName == "Advisor4"):
		offset = advisorFourOffset
	if (myName == "Advisor5"):
		offset = advisorFiveOffset
	if (myName == "Advisor6"):
		offset = advisorSixOffset
	
	var bubble = load("res://AdvisorSpeechBubble.tscn")
	var bi = bubble.instance()
	bi.set_name("Bubble"+actualName)
	print(bi.get_name())
	bi.hide()
	add_child(bi)
	bi.set_pos(get_pos() + offset)
	
	#get_tree().get_root().add_child(bi)
	#get_tree().get_root().add_child(bi)
	
	#get_tree().get_root().add_child(bi)
	#bi.set_pos(get_pos() + offset)

func startTalking():
	print("Wolf On Hotkey!"+str(get_name()))
	
func stopTalking():
	print("Wolf Off Hotkey!"+str(get_name()))

func on_detect_body_enter():
	print("Wolf On Hover!"+str(get_name()))

func on_detect_body_exit():
	print("Wolf Off Hover!"+str(get_name()))
	
func set_hotkey(myHotkey):
	hotkey = myHotkey
	
func set_actual_name(myName):
	actualName = myName