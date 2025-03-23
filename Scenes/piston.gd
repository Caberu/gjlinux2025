extends TextureRect

@export var up : Texture2D
@export var down : Texture2D
@export var input : String


func _process(_delta):
	texture = down if Input.is_action_pressed(input) else up
