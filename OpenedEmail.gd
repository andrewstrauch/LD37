extends Node

var openHeadline
#Vars for headline values here?

var c
var g

var _twitter_shares
var _facebook_shares
var _google_shares

func _ready():
	c = get_node("/root/Controller")
	g = get_node("/root/GameState")

	_twitter_shares = get_node("Panel/SocialMediaShares/TwitterShares")
	_facebook_shares = get_node("Panel/SocialMediaShares/FacebookShares")
	_google_shares = get_node("Panel/SocialMediaShares/GoogleShares")

	get_node("Panel/ApproveButton").connect("pressed", self, "on_approve_button_pressed")
	get_node("Panel/RejectButton").connect("pressed", self, "on_reject_button_pressed")
	get_node("Panel/BurndownTimer").connect("timeout", self, "on_burndown_timer_timeout")
	get_node("Panel/HeadlineLabel").set_text(openHeadline.text)

func set_headline(headline):
	openHeadline = headline

func pass_timer_time(time):
	get_node("Panel/BurndownTimer").set_wait_time(time)
	get_node("Panel/BurndownTimer").start()
	
func on_approve_button_pressed():
	print("Approved!")
	handle_email_close("approve")
	
func on_reject_button_pressed():
	print("Rejected!")
	handle_email_close("reject")
	
func on_burndown_timer_timeout():
	handle_email_close(null)

func handle_email_close(button):
	get_node("Panel/BurndownTimer").stop()

	if g.is_game_over:
		return

	if button == "approve":
		g.publish_headline(openHeadline)
		get_node("/root/Headlines").add_published_headline(openHeadline)

	c.readingAnEmail = false
	#Set other values in controller for handling effects
	c.emailsOpen = false
	g.publish_headline(openHeadline)
	c.advisorList.clear()

	queue_free()
