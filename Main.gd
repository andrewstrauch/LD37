extends Node2D

var headlineArray = []
var headlineBurndownTime = 15

func _ready():
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
		get_node("Advisors").add_child(ai)
		#get_tree().get_root().get_node("world1-1").add_child(bi)
		ai.set_pos(each.get_pos())
		ai.set_name("Advisor" + str(advisorNum))
		advisorNum += 1
		#ai.hide()
		
		#print(ai.get_name())
		
		#Pass in instance shit here
		#ai.init(isPlayerFacingRight)
		
		
	#get_node("Advisors").get_node("Advisor1").show()
	
	var email = load("res://Email.tscn")
	var ei = email.instance()
	get_node("Laptop").get_node("EmailClient").get_node("EmailScrollContainer").add_child(ei)
	add_child(ei)
	
	set_fixed_process(true)

func _fixed_process(delta):
	if(Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().quit()
