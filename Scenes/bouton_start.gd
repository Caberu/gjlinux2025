extends Node

func _process(delta):
	if (Input.is_action_just_pressed("skip")):
		$"../Guitare/SoundBut".click()
