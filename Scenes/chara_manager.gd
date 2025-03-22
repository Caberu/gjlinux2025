extends Node

var current_chara := ""

func set_bg(chara):
	current_chara = chara
	$"../Personnage".texture = load("res://Image/Octave/octave_"+chara+".png")
