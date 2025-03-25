extends TextureRect

var pos_x : float

func _ready():
	pos_x = position.x

func _process(delta):
	$PenseBete.visible = $"../InstrumentHand".on_screen
	position.x = lerp(position.x, pos_x, 0.1)


func show_paper():
	pos_x = 0.0

func hide_paper():
	pos_x = 1227.0


func ClickAide():
	if !$PenseBete.visible: return
	if (pos_x == 0):
		hide_paper()
	else:
		show_paper()
