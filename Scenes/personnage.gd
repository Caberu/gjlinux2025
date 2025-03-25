extends TextureRect

@export var on_screen := false

@export var off_screen_offset = 1920.0

@export var background_modulate : Dictionary

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

func back_ground_color_filter():
	var key = $"../BGManager".current_bg
	modulate = background_modulate[key] if background_modulate.has(key) else Color.WHITE
	

func _process(delta):
	back_ground_color_filter()
	
	position.x = lerp(position.x, off_screen_offset if not on_screen else 0.0, 0.1)
