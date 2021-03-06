extends "res://Mini Scenes/Weapon/Projectile.gd"

var pushed_minions = []

func _ready():
	Audio.play_sound(Audio.sphere)
	ready()


func _process(_delta):
	for minion in pushed_minions:
		minion.set_position_y(position.y - 15)


func _on_Push_area_entered(area):
	if not area in pushed_minions and area.has_method("take_damage") and area.has_method("set_position_y"):
		area.take_damage(1)
		pushed_minions.append(area)


func _on_Push_area_exited(area):
	if area in pushed_minions:
		pushed_minions.erase(area)
