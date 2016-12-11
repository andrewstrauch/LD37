extends Node2D

var hotkey
var hotKeyFormatted
var hotkeyPressed = bool(false)
var talking = bool(false)
var canStopTalking = bool(false)
var actualName
var bubbleNumber = 1
var readyToTalk = true

const leftMargin = -100
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

var c

var t

var alignment

var bi

#Talking points

func _ready():
	c = get_node("/root/Controller")
	t = get_node("/root/TalkingPoints")
	
	
	get_node("Detect").connect("mouse_enter", self, "on_detect_body_enter")
	get_node("Detect").connect("mouse_exit", self, "on_detect_body_exit")
	
	spawn_bubbles(actualName)
	#print(actualName)
	get_node("WolfBlitzer").hide()
	get_node("JakeTapper").hide()
	get_node("MegynKelly").hide()
	get_node("KeithOlbermann").hide()
	get_node("RachelMaddow").hide()
	get_node("AlexJones").hide()
	
	if (actualName == "Advisor1"):
		get_node("WolfBlitzer").show()
		
	if (actualName == "Advisor2"):
		get_node("JakeTapper").show()
	if (actualName == "Advisor3"):
		get_node("MegynKelly").show()
	if (actualName == "Advisor4"):
		get_node("KeithOlbermann").show()
	if (actualName == "Advisor5"):
		get_node("RachelMaddow").show()
	if (actualName == "Advisor6"):
		get_node("AlexJones").show()
	
	set_fixed_process(true)

func _fixed_process(delta):
	#Listen for turning on
	#if (actualName == "Advisor1"):
	#	show()
	
#	if (c.advisorList.has(actualName)):
#		print(actualName)
	
	if (c.emailsOpen && readyToTalk):
		#if (c.Advisor1 == true):
		if (c.advisorList.has(actualName)):
			readyToTalk = false
			bi.get_node("Panel/Label").set_text(t.get_talking_point(alignment, c.currentHeadline.truthiness, c.currentHeadline.alignment))
			show()
	
	if (not c.emailsOpen && not readyToTalk):
		readyToTalk = true
		hide()
	
	#Refactor this to be outside class
	hotkeyPressed = Input.is_key_pressed(hotKeyFormatted)
	if (hotkeyPressed):
		if (not talking && not canStopTalking):
			talking = true
			canStopTalking = true
			startTalking(return_bubble())
	elif(not hotkeyPressed):
		if (canStopTalking):
			talking = false
			canStopTalking = false
			stopTalking(return_bubble())

func return_bubble():
	if(hotKeyFormatted == KEY_1):
		return "BubbleAdvisor1"
	if(hotKeyFormatted == KEY_2):
		return "BubbleAdvisor2"
	if(hotKeyFormatted == KEY_3):
		return "BubbleAdvisor3"
	if(hotKeyFormatted == KEY_4):
		return "BubbleAdvisor4"
	if(hotKeyFormatted == KEY_5):
		return "BubbleAdvisor5"
	if(hotKeyFormatted == KEY_6):
		return "BubbleAdvisor6"

func spawn_bubbles(myName):
	if (hotkey == 1):
		hotKeyFormatted = KEY_1
	if (hotkey == 2):
		hotKeyFormatted = KEY_2
	if (hotkey == 3):
		hotKeyFormatted = KEY_3
	if (hotkey == 4):
		hotKeyFormatted = KEY_4
	if (hotkey == 5):
		hotKeyFormatted = KEY_5
	if (hotkey == 6):
		hotKeyFormatted = KEY_6
	
	var bubbleName
	var offset = Vector2()
	
	get_node("WolfBlitzer").hide()
	get_node("JakeTapper").hide()
	get_node("MegynKelly").hide()
	get_node("KeithOlbermann").hide()
	get_node("RachelMaddow").hide()
	get_node("AlexJones").hide()
	
	if (myName == "Advisor1"):
		offset = advisorOneOffset
		alignment = t.ADVISOR_ALIGNMENT.MODERATE
	if (myName == "Advisor2"):
		offset = advisorTwoOffset
		alignment = t.ADVISOR_ALIGNMENT.MODERATE
	if (myName == "Advisor3"):
		offset = advisorThreeOffset
		alignment = t.ADVISOR_ALIGNMENT.RIGHT
	if (myName == "Advisor4"):
		offset = advisorFourOffset
		alignment = t.ADVISOR_ALIGNMENT.SUPER_LEFT
	if (myName == "Advisor5"):
		offset = advisorFiveOffset
		alignment = t.ADVISOR_ALIGNMENT.LEFT
	if (myName == "Advisor6"):
		offset = advisorSixOffset
		alignment = t.ADVISOR_ALIGNMENT.SUPER_RIGHT
	
	var bubble = load("res://AdvisorSpeechBubble.tscn")
	bi = bubble.instance()
	#Set the text
	bi.set_name("Bubble"+actualName)
	bi.hide()
	add_child(bi)
	bi.set_pos(get_pos() + offset)
	
	#get_tree().get_root().add_child(bi)
	#get_tree().get_root().add_child(bi)
	
	#get_tree().get_root().add_child(bi)
	#bi.set_pos(get_pos() + offset)

func startTalking(bubble):
	get_node(bubble).show()
	
func stopTalking(bubble):
	get_node(bubble).hide()

func on_detect_body_enter():
	var bubble = return_bubble()
	get_node(bubble).show()

func on_detect_body_exit():
	var bubble = return_bubble()
	get_node(bubble).hide()
	
func set_hotkey(myHotkey):
	hotkey = myHotkey
	
func set_actual_name(myName):
	actualName = myName