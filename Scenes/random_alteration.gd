extends Alterator

@export var random_alter_max := 1

func _process(delta):
	$"..".alteration = randi()%(random_alter_max+1)
