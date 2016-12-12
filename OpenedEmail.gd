extends Node

var openHeadline
#Vars for headline values here?

var c
var g

var _twitter_shares
var _facebook_shares
var _google_shares

var _max_twitter_shares
var _max_facebook_shares
var _max_google_shares

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
	
	set_fixed_process(true)

func _fixed_process(delta):
	var time = int(round(get_node("Panel/BurndownTimer").get_time_left()))

	get_node("Panel/TimerPanel/TimerLabel").set_text(str(time))
	g.opened_email_time_left = time

	_twitter_shares.set_text(str(int(_max_twitter_shares * ((g.EMAIL_BURNDOWN_TIMER_TIME - get_node("Panel/BurndownTimer").get_time_left()) / float(g.EMAIL_BURNDOWN_TIMER_TIME)))) + "." + str(randi() % 10) + "k")
	_facebook_shares.set_text(str(int(_max_facebook_shares * ((g.EMAIL_BURNDOWN_TIMER_TIME - get_node("Panel/BurndownTimer").get_time_left()) / float(g.EMAIL_BURNDOWN_TIMER_TIME)))) + "." + str(randi() % 10) + "k")
	_google_shares.set_text(str(int(_max_google_shares * ((g.EMAIL_BURNDOWN_TIMER_TIME - get_node("Panel/BurndownTimer").get_time_left()) / float(g.EMAIL_BURNDOWN_TIMER_TIME)))) + "." + str(randi() % 10) + "k")

func set_headline(headline):
	openHeadline = headline
	_max_twitter_shares = randi() % 1000
	_max_facebook_shares = randi() % 1000
	_max_google_shares = randi() % 1000

func pass_timer_time(time):
	get_node("Panel/BurndownTimer").set_wait_time(time)
	get_node("Panel/BurndownTimer").start()
	
func on_approve_button_pressed():
	print("Approved!")
	handle_email_close("approve")
	
func on_reject_button_pressed():
	get_tree().get_root().get_node("Main").get_node("SamplePlayer").play("trash")
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
	c.advisorList.clear()

	queue_free()
