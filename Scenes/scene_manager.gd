extends Node

var loading := false
var loading_screen

func _ready():
	loading_screen = load("res://Scenes/loading_screen.tscn").instantiate()
	get_tree().root.add_child.call_deferred(loading_screen)

func show_loading():
	loading_screen.show_screen()

func clear_loading():
	loading_screen.hide_screen()

func go_to_game():
	go_to("DateScene")
	

func go_to_end():
	go_to("End")

func go_to(scene_name : String):
	if (loading): return
	loading = true
	show_loading()
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://Scenes/%s.tscn" % scene_name)
	await get_tree().create_timer(1).timeout
	clear_loading()
	loading = false
