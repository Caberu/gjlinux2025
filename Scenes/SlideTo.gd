extends Control

var from : Vector2
@export var to : Vector2
var from_time : float
@export var time := 1.0
@export var curve : Curve
@export var slid_to := true

func _ready():
	from = position
	from_time = -10

func slide(to := true):
	slid_to = to
	from_time = Time.get_ticks_msec()/1000.0


func _process(delta):
	var t = curve.sample(clamp(((Time.get_ticks_msec()/1000.0 - from_time)/time),0.0,1.0))
	if (!slid_to):
		t = 1 - t
	position = lerp(from, to, t)
