extends TextureRect

var note_prefab: PackedScene
var note_history := []
var start_portée := 250.0
var crush_decomp := false
var decomp := ["etoile","neutre", "cringe", "degout"]
var cringe_sounds : Array

func _ready():
	note_prefab = load("res://Scenes/note.tscn")
	
	cringe_sounds = []
	for i in range(4):
		cringe_sounds.append(load("res://Sounds/Cringe/Cringe%s.wav" % (i+1)))
	
	for i in range(20):
		var clone = note_prefab.instantiate()
		add_child(clone)
		clone.global_position.x = start_portée+ (i+2)*50
		note_history.append(clone)

var cringe_decomp_idx := 0

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
			if (max(floori(idx/5.0),cringe_decomp_idx) >= 4):
				$"..".back_to_date()
				$"../../DialogueManager".display_next()
				crush_decomp = false
				return
			if (prev_decomp != floori(idx/5.0)):
				cringe()
			prev_decomp = floori(idx/5.0)
			$"../../CharaManager".set_bg(decomp[max(floori(idx/5.0),cringe_decomp_idx)])
		
		
		if (idx < Melody.target_melody.size()):
			$Target.set_note(Melody.target_melody[idx])
			if (!Melody.check_melody()):
				cringe()
				if (crush_decomp):
					cringe_decomp_idx += 1
		else:
			if (Melody.check_melody()):
				$"..".back_to_date()
				$"../../DialogueManager".display_next()
			else:
				cringe()
var prev_decomp := 0
var cringe_idx := 0

func cringe():
	$"../..".shake()
	$AudioStreamPlayer.stream = cringe_sounds[cringe_idx]
	cringe_idx = (cringe_idx+randi()%2)%cringe_sounds.size()
	$AudioStreamPlayer.play(0)
