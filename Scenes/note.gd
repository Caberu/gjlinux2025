extends TextureRect

var note : String

var note_dic : Dictionary

func _ready():
	load_note()

func _process(delta):
	set_note(Melody.visualized_note)

func load_note():
	for n in InstruSound.NOTE.keys():
		var path = "res://Image/Notes/"+ n+".PNG"
		#print(path)
		note_dic[n] = load(path)
	#print(clips)

func cycle():
	while true:
		for n in InstruSound.NOTE.keys():
			set_note(n)
			await get_tree().create_timer(1).timeout

func set_note(n):
	if (n is int):
		n = InstruSound.NOTE.keys()[n]
	note = n
	if (note.is_empty() or note == "FAIL"):
		texture = null
		return
	texture = note_dic[note]
