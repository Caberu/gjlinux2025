extends Panel

var on_button := false

signal cliked

func _on_mouse_entered():
	print("in")
	on_button = true


func _on_mouse_exited():
	on_button = false

func  _process(delta):
	if (Input.is_action_just_pressed("click") and on_button):
		click()

func click():
	print("clickckkc")
	cliked.emit()
	
