extends Control

@export var act : Array[Texture2D]
@export var titre : Array[Texture2D]
@export var audio : Array[AudioStream]

func show_act(i : int):
	$"../DialogueManager".can_skip = false
	$TextureRect.visible = true
	$TextureRect.texture = act[i]
	$TextureRect/TextureRect.texture = null
	
	$AudioStreamPlayer.stream = audio[i]
	$AudioStreamPlayer.play(0)
	
	await get_tree().create_timer(1).timeout
	
	$TextureRect/TextureRect.texture = titre[i]
	
	await get_tree().create_timer($AudioStreamPlayer.stream.get_length()-1).timeout
	$TextureRect.visible = false
	$"../DialogueManager".can_skip = true
	$"../DialogueManager".display_next()
