extends TextureRect

var note_prefab: PackedScene
var note_history := []
var start_portée := 250.0
var crush_decomp := false
var decomp := ["etoile","neutre", "cringe", "degout"]

func _ready():
	note_prefab = load("res://Scenes/note.tscn")
	
	for i in range(20):
		var clone = note_prefab.instantiate()
		add_child(clone)
		clone.global_position.x = start_portée+ (i+2)*50
		note_history.append(clone)

func _process(delta):
	var idx := 0
	for i in range(note_history.size()):
		note_history[i].set_note(Melody.get_history_note(i))
		if (note_history[i].note != ""):
			idx+=1
	$VisualizerNote.position.x = start_portée + (idx+4)*50
	$Target.position.x = start_portée + (idx+2)*50

	$VisualizerNote.set_note(Melody.visualized_note)
	if (Melody.target_melody != null):
		if (crush_decomp):
			if (floori(idx/5.0) >= 4):
				$"..".back_to_date()
				$"../../DialogueManager".display_next()
				return
			$"../../CharaManager".set_bg(decomp[floori(idx/5.0)])
		
		
		if (idx < Melody.target_melody.size()):
			$Target.set_note(Melody.target_melody[idx])
		else:
			if (Melody.check_melody()):
				$"..".back_to_date()
				$"../../DialogueManager".display_next()
