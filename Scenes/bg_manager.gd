extends Node

var current_bg := ""

func set_bg(bg):
	current_bg = bg
	$"../BG".texture = load("res://Image/Backgrounds/BG_"+bg+".png")
	$"../BGMManager".play(bg)
