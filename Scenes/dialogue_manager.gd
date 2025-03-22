extends Node

var dialogue_index := 0

var dialogue_array

func _ready():
	load_file("res://Dialogue/Dialogue_1.csv")
	display_next()

func _process(delta):
	if (Input.is_action_just_pressed("skip")):
		display_next()
	elif (Input.is_action_just_pressed("back")):
		display_next(-1)

func load_file(path):
	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text().split("\n")
	dialogue_array = []
	for c in content:
		dialogue_array.append(c.split(",",true,4))
	dialogue_index = 0

func display_next(skip = 1):
	if (dialogue_index+skip>=dialogue_array.size()):
		dialogue_index = dialogue_array.size()
		return
	if (dialogue_index+skip<1):
		dialogue_index = 1
		return
	
	dialogue_index+=skip
	var dialogue = dialogue_array[dialogue_index]
	display_text(dialogue[0],dialogue[4])
	if (!dialogue[1].is_empty()):
		$"../BGManager".set_bg(dialogue[1])
	if (!dialogue[2].is_empty()):
		$"../CharaManager".set_bg(dialogue[2])
	if (!dialogue[3].is_empty()):
		$"../FXManager".set_fx(dialogue[3])

func display_text(chara_name : String, text : String):
	$"../DialogueCadre/Dialogue".text = text.replace("\"","")
	$"../DialogueCadre/Nom/Name".text = chara_name.replace("\"","")
