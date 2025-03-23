extends Node

var melody_history := []
var visualized_note

func add_note(note : String):
	melody_history.append(note)
	print(melody_history)

func clear():
	melody_history = []

func show(note):
	visualized_note = note

func hide(note):
	if (visualized_note == note):
		visualized_note = ""
