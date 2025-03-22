extends TextureRect

@export var broken_tex : Texture2D

func _on_sound_but_cliked():
	texture = broken_tex
	
	await get_tree().create_timer(1).timeout
	
	$"../SceneManager".go_to_game()
