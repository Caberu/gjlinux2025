extends Node

var dialogue_index := 0

var dialogue_array

var can_skip := true

var instru = [InstruSound.INSTRU.Tamtam,InstruSound.INSTRU.Trompette, InstruSound.INSTRU.Uku]

var current_dialogue = 0

func _ready():
	next_dialogue()

func next_dialogue():
	current_dialogue+=1
	start_dialogue(current_dialogue)

func start_dialogue(n : int):
	if (load_file("res://Dialogue/Dialogue_"+str(n)+".csv")):
		display_next()

func _process(delta):
	if (Input.is_action_just_pressed("skip")):
		display_next()
	elif (Input.is_action_just_pressed("back")):
		display_next(-1)
	if (Input.is_action_just_pressed("debug_skip")):
		$"../InstrumentHand".back_to_date()
		next_dialogue()

func load_file(path):
	var file = FileAccess.open(path, FileAccess.READ)
	if (file == null):
		print("no more dialogue")
		SceneManager.go_to_end()
		return false
	var content = file.get_as_text().split("\n")
	dialogue_array = []
	for c in content:
		dialogue_array.append(c.split(",",true,4))
	dialogue_index = 0
	$AudioStreamPlayer.load_instru(instru[current_dialogue-1])
	return true

func display_next(skip = 1):
	if (!can_skip): return

	$AudioStreamPlayer.play_random()

	if (dialogue_index+skip>=dialogue_array.size()):
		next_dialogue()
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
		var fx_list = dialogue[3].split(";")
		for fx in fx_list:
			$"../FXManager".set_fx(fx)

func display_text(chara_name : String, text : String):
	$"../DialogueCadre/Dialogue".text = text.replace("\"","")
	$"../DialogueCadre/Nom/Name".text = chara_name.replace("\"","")
