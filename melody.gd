extends Node

var melody_history := []
var visualized_note
var target_melody


func add_note(note : String):
	melody_history.append(note)
	if (melody_history.size()>20):
		melody_history.remove_at(0)

func get_history_note(i):
	return melody_history[i] if i<melody_history.size() else ""

func check_melody():
	for i in range(melody_history.size()):
		if (melody_history[i] == "Pokd"):
			melody_history[i] = "Pok"
		if (melody_history[i] == "Poungd"):
			melody_history[i] = "Poung"
		if (melody_history[i] == "Clapd"):
			melody_history[i] = "Clap"
		if (melody_history[i] != InstruSound.NOTE.keys()[target_melody[i]]):
			clear()
			return false
	return true

func clear():
	melody_history = []

func show(note):
	if (note is int):
		note = InstruSound.NOTE.keys()[note]
	
	visualized_note = note

func hide(note):
	if (visualized_note == InstruSound.NOTE.keys()[note]):
		visualized_note = ""
