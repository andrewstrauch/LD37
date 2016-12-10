extends Node2D

var headlineArray = []
var headlineBurndownTime = 15

func _ready():
	#Shuffle up stories into array
	#Pick first story, pull it out, push it to laptop scene
	#Reset timer as one-shot, set wait_time to default above
	set_fixed_process(true)

func _fixed_process(delta):
	pass
