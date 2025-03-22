extends Node

var dialogue_index := 0

var dialogue_array

func _ready():
	load_file("res://Dialogue/Dialogue.csv")
	display_next()

func _process(delta):
	if (Input.is_action_just_pressed("Skip")):
		display_next()

func load_file(path):
	print("Start loading...")
	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text().split("\n")
	dialogue_array = []
	for c in content:
		dialogue_array.append(c.split(",",true,1))
		print(c)
	dialogue_index = 0

func display_next():
	if (dialogue_index>=dialogue_array.size()-1):
		dialogue_index = dialogue_array.size()
		return
	
	dialogue_index+=1
	display_text(dialogue_array[dialogue_index][0],dialogue_array[dialogue_index][1])

func display_text(chara_name : String, text : String):
	$"../DialogueCadre/Dialogue".text = text
	$"../DialogueCadre/Nom/Name".text = chara_name
