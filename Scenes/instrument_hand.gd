extends Control

@export var on_screen := false

@export var off_screen_offset = -1920.0

@export var melody_tamtam : Array[InstruSound.NOTE]
@export var melody_trompette : Array[InstruSound.NOTE]
@export var melody_uku : Array[InstruSound.NOTE]

func _ready():
	position.x = off_screen_offset if not on_screen else 0.0


func _process(delta):
	position.x = lerp(position.x, off_screen_offset if not on_screen else 0.0, 0.1)

func tamtam():
	$"../DialogueManager".can_skip = false
	Melody.target_melody = melody_tamtam
	$Tamtam.visible = true
	$Uku.visible = false
	$Trompette.visible = false
	on_screen = true

func trompette():
	$"../DialogueManager".can_skip = false
	Melody.target_melody = melody_trompette
	$Trompette.visible = true
	$Tamtam.visible = false
	$Uku.visible = false
	on_screen = true

func uku():
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
	$"../DialogueManager".can_skip = true
	
