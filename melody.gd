extends Node

var melody_history := []

func add_note(note : String):
	melody_history.append(note)
	print(melody_history)

func clear():
	melody_history = []
