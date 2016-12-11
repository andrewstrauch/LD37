extends Node

var openHeadline
#Vars for headline values here?

var c

func _ready():
	#set_color("Panel/ApproveButton", Color(1,0,0))
	#get_node("Panel/ApproveButton").
	get_node("Panel/ApproveButton").set_text("Approve")
	get_node("Panel/RejectButton").set_text("Reject")
	get_node("Panel/ApproveButton").connect("pressed", self, "on_approve_button_pressed")
	get_node("Panel/RejectButton").connect("pressed", self, "on_reject_button_pressed")
	c = get_node("/root/Controller")
	get_node("Panel/BurndownTimer").connect("timeout", self, "on_burndown_timer_timeout")
	get_node("Panel/HeadlineLabel").add_text(openHeadline.text)
	
func set_headline(headline):
	openHeadline = headline

func pass_timer_time(time):
		get_node("Panel/BurndownTimer").set_wait_time(time)
		get_node("Panel/BurndownTimer").start()
	
func on_approve_button_pressed():
	print("Approved!")
	handle_email_close("approve", "Test")
	
func on_reject_button_pressed():
	print("Rejected!")
	handle_email_close("reject", "Test")
	
func on_burndown_timer_timeout():
	handle_email_close(null, "Test")

func handle_email_close(button, headline):
	c.readingAnEmail = false
	#Set other values in controller for handling effects
	c.emailsOpen = false
		
	queue_free()