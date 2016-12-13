
extends Node

var canRestart = bool (true)
var g

func _ready():
	g = get_node("/root/GameState")
	get_node("Button").connect("pressed", self, "on_button_pressed")

func on_button_pressed():
	if (canRestart):
		canRestart = false
		g.is_game_over = false
		g.current_truthiness = 85
		g.current_left_appeal = 25
		g.current_right_appeal = 25
		var map = load("res://Main.tscn")
		var mi = map.instance()
		#root.add_child(mi)
		get_tree().get_root().add_child(mi)
		#print(g.is_game_over)
		queue_free()