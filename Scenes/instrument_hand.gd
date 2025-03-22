extends Control

@export var on_screen := false

@export var off_screen_offset = -1920.0

func _process(delta):
	position.x = lerp(position.x, off_screen_offset if on_screen else 0.0, 0.1)
	
	if (Input.is_action_just_pressed("toggle_instru")):
		on_screen = !on_screen
