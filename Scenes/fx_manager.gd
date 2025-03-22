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
