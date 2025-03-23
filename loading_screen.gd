extends Node

var screen 

func loading():
	screen = load("res://Scenes/loading_screen.tscn").instantiate()
	get_tree().current_scene.add_child(screen)

func clear():
	screen.queue_free()
