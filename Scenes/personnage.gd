extends TextureRect

@export var on_screen := false

@export var off_screen_offset = 1920.0

func _ready():
	position.x = off_screen_offset if not on_screen else 0.0

func slide_in():
	position.x = off_screen_offset

	on_screen = true

func slide_out():
	position.x = 0

	on_screen = false


func tp_in():
	position.x =0
	
func tp_out():
	position.x =off_screen_offset


func _process(delta):
	position.x = lerp(position.x, off_screen_offset if not on_screen else 0.0, 0.1)
