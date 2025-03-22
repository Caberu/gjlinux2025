class_name SoundBut extends TextureRect

@export var instrument : InstruSound.INSTRU
@export var note : InstruSound.NOTE
@export var diese := false
var on_button := false
var played := false

var alteration := []

func _on_mouse_entered():
	on_button = true


func _on_mouse_exited():
	on_button = false
	played = false

func _ready():
	$AudioStreamPlayer.load_instru(instrument)

func  _process(delta):
	if (Input.is_action_pressed("click") and not played and on_button):
		click()
	elif (Input.is_action_just_pressed("click") and on_button):
		click()
	if (Input.is_action_just_released("click")):
		played = false

func click():
	print(InstruSound.NOTE.keys()[note+get_alter()])
	played = true
	$AudioStreamPlayer.play_instru(note)

func get_alter():
	if (alteration.is_empty()): return 1;
	var max = 0
	for i in alteration:
		max = max(max,i)
	return max
