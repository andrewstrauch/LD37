
extends Node

var readingAnEmail = bool(false)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func get_reading_an_email():
	return readingAnEmail

func set_reading_an_email(myBool):
	readingAnEmail = myBool