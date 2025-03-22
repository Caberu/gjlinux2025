extends "res://Scenes/alterator.gd"

@export var alter_count := 0
@export var input_particle := ""

func _process(delta):
	$"..".alteration = 0

	for i in range(alter_count):
		var input = input_particle + str(i+1)
		if (Input.is_action_pressed(input)):
			$"..".alteration = i+1
