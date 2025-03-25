extends Control

@export var on_screen := false :
	get:
		return on_screen
	set(value):
		if (value != on_screen):
			if (value):
				$SlideInAudio.play(0)
		on_screen = value

@export var off_screen_offset = -1920.0

@export var instrument_pensebete : Array[Texture2D]

@export var melody_tamtam : Array[InstruSound.NOTE]
@export var melody_trompette : Array[InstruSound.NOTE]
@export var melody_uku : Array[InstruSound.NOTE]

func _ready():
	position.x = off_screen_offset if not on_screen else 0.0


func _process(delta):
	position.x = lerp(position.x, off_screen_offset if not on_screen else 0.0, 0.1)

func tamtam():
	$"../PenseBete/PenseBete".texture = instrument_pensebete[0]
	$"../DialogueManager".can_skip = false
	Melody.target_melody = melody_tamtam
	$Tamtam.visible = true
	$Uku.visible = false
	$Trompette.visible = false
	on_screen = true

func trompette():
	$"../PenseBete/PenseBete".texture = instrument_pensebete[1]
	$"../DialogueManager".can_skip = false
	Melody.target_melody = melody_trompette
	$Trompette.visible = true
	$Tamtam.visible = false
	$Uku.visible = false
	on_screen = true

func uku():
	$"../PenseBete/PenseBete".texture = instrument_pensebete[2]
	$"../DialogueManager".can_skip = false
	Melody.target_melody = melody_uku
	$Tamtam.visible = false
	$Uku.visible = true
	$Trompette.visible = false
	on_screen = true

func back_to_date():
	Melody.clear()
	$Uku.visible = false
	$Tamtam.visible = false
	$Trompette.visible = false
	on_screen = false
	await get_tree().process_frame
	$"../DialogueManager".can_skip = true
	
