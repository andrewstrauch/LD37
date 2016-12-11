extends Node

var text
var headlines
var num_seconds_elapsed_since_last_change
var headline_start_index

func _ready():
	text = get_node("Text")
	headlines = get_node("/root/Headlines")
	num_seconds_elapsed_since_last_change = 0
	headline_start_index = 0
	
	set_fixed_process(true)

func _fixed_process(delta):
	num_seconds_elapsed_since_last_change += delta
	if num_seconds_elapsed_since_last_change >= 0.25:
		var published_headlines_text = headlines.get_published_headline_text()
		if headline_start_index < published_headlines_text.length():
			var shown_published_headlines_text = published_headlines_text.substr(headline_start_index, published_headlines_text.length() - headline_start_index)
			text.set_text(shown_published_headlines_text)
			headline_start_index += 1
			num_seconds_elapsed_since_last_change = 0
