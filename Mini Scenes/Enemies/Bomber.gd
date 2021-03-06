extends "res://Mini Scenes/Enemies/Enemy.gd"

export(PackedScene) var explosion

func _process(delta):
	__process(delta)

func destroy():
	if (!_stunned):
		Audio.play_sound(Audio.bomber)
		var new = explosion.instance()
		new.position = position
		get_parent().call_deferred('add_child',new)
	
	.destroy()
