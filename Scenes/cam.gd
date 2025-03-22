class_name CameraEffects extends Control

func _process(delta):
	position = lerp(position, Vector2.ZERO,0.9)

func shake(force, time):
	var start := Time.get_ticks_msec()
	while (Time.get_ticks_msec() < start+time*1000):
		shake_once(force)
		await  get_tree().process_frame

func shake_once(force : float):
	position += (Vector2(randf(),randf())-Vector2.ONE*0.5)*force
