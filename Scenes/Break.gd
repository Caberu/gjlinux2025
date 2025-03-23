extends TextureRect

@export var breaking_tex : Texture2D
@export var broken_tex : Texture2D


func _on_sound_but_cliked():
	texture = breaking_tex
	$"../AudioStreamPlayer".stop()
	await get_tree().create_timer(0.05).timeout
	$"..".shake(20,0.1)
	texture = broken_tex
	
	await get_tree().create_timer(1).timeout
	
	$"../SceneManager".go_to_game()
