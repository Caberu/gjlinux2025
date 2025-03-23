extends Node

var mus_dic : Dictionary

var mus_name = ["parc", "bar", "intro"]

func _ready():
	load_music()

func load_music():
	mus_dic = {}
	
	for n in mus_name:
		mus_dic[n] = load("res://Sounds/Music/"+n+".wav")

func play(name : String, reset := false):
	if (name.is_empty() or name == "noir" or !mus_dic.has(name)):
		$AudioStreamPlayer.stop()
		return

	$AudioStreamPlayer.stream = mus_dic[name]
	print((Time.get_ticks_msec()%ceili($AudioStreamPlayer.stream.get_length()*1000)))
	$AudioStreamPlayer.play(
		(Time.get_ticks_msec()%ceili($AudioStreamPlayer.stream.get_length()*1000))/1000.0 
		if !reset else 0)

func reset():
	$AudioStreamPlayer.play(0)
