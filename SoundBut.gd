class_name SoundBut extends TextureRect

@export var instrument : InstruSound.INSTRU
@export var note : InstruSound.NOTE
var on_button := false
var played := false

signal cliked

var alteration := 0 :
	get:
		return alteration
	set(value):
		alteration = value
		if (on_button):
			Melody.show(note+alteration)


func _on_mouse_entered():
	on_button = true
	Melody.show(note+alteration)

func _on_mouse_exited():
	on_button = false
	played = false
	Melody.hide(note+alteration)

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
	cliked.emit()
	print(InstruSound.NOTE.keys()[note+alteration])
	played = true
	$AudioStreamPlayer.play_instru(note+alteration)
