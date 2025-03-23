extends Node

func set_fx(fx):
	if (fx == "screenshake"):
		$"..".shake(30,0.25)
	if (fx == "slide_in"):
		$"../Personnage".slide_in()
	if (fx == "slide_out"):
		$"../Personnage".slide_out()
	if (fx == "tp_in"):
		$"../Personnage".tp_in()
	if (fx == "tp_out"):
		$"../Personnage".tp_out()
	if (fx == "reset_music"):
		$"../BGMManager".reset()
	if (fx == "TAMTAM"):
		$"../BGMManager".play("")
		Melody.clear()
		$"../InstrumentHand".tamtam()
	if (fx == "UKU"):
		$"../BGMManager".play("")
		Melody.clear()
		$"../InstrumentHand".uku()
		$"../InstrumentHand/Portée".crush_decomp = true
	if (fx == "TROMPETTE"):
		$"../BGMManager".play("")
		Melody.clear()
		$"../InstrumentHand".trompette()
	if (fx == "ACT"):
		$"../ACT".show_act($"../DialogueManager".current_dialogue-1)
