class_name InstruSound extends AudioStreamPlayer

enum INSTRU {GuitareClakos}
enum NOTE {
	Do1, Dod1, Ré1, Réd1, Mi1, Fa1, Fad1, Sol1, Sold1, La1, Lad1, Si1,
	Do2, Dod2, Ré2, Réd2, Mi2, Fa2, Fad2, Sol2, Sold2, La2, Lad2, Si2,
	Do3, FAIL}

@export var clips : Array[AudioStream]

func load_instru(instru : INSTRU):
	for n in NOTE.keys():
		var path = "res://Sounds/Instru/"+INSTRU.keys()[instru]+"/"+ n+".wav"
		#print(path)
		var clip = load(path)
		clips.append(clip)
	#print(clips)


func play_instru(note : NOTE):
	Melody.add_note(NOTE.keys()[note])
	stream = clips[note]
	play(0)
