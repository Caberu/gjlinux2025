extends RichTextLabel

@export var speed := 100
var start_pos

func _ready():
	start_pos = position.x

func _process(delta):
	position.x -= delta * speed
	if (position.x <= start_pos-size.x):
		position.x += size.x
