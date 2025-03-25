extends Panel

var on_button := false

signal cliked

@export var on_screen := true

@export var off_screen_offset = 1920.0

func _ready():
	position.x = off_screen_offset if not on_screen else 0.0

func _on_mouse_entered():
	on_button = true


func _on_mouse_exited():
	on_button = false

func  _process(delta):
	#if (Input.is_action_just_pressed("click") and on_button):
		#click()
	position.x = lerp(position.x, off_screen_offset if not on_screen else 0.0, 0.1)

func click():
	cliked.emit()
