extends Node

var headline
var truthiness
var headlineCurrentValue
var liberalPoints
var conservativePoints
var moderatePoints

func _ready():
	pass
	
#Getters and setters	
func get_headine():
	return headline

func set_headine(myHeadline):
	headline = myHeadline
	
func get_truthiness():
	return truthiness
	
func set_truthiness(myTruthiness):
	truthiness = myTruthiness
	
func get_headline_current_value():
	return headlineCurrentValue

func set_headline_current_value(myHeadlineCurrentValue):
	headlineCurrentValue = myHeadlineCurrentValue
	
func get_liberal_points():
	return liberalPoints
	
func set_liberal_points(myLiberalPoints):
	liberalPoints = myLiberalPoints
	
func get_conservative_points():
	return conservativePoints
	
func set_conservative_points(myConservativePoints):
	conservativePoints = myConservativePoints