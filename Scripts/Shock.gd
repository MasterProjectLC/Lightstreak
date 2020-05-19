extends "res://Scripts/Weapon.gd"

var _color

signal hit_enemy

# Called when the node enters the scene tree for the first time.
func _ready():
	_weapon_offset = Vector2(0, 0)
	Audio.play_sound(Audio.shock)


func _on_Shock_area_entered(area):
	if area.has_method("take_damage"):
		Audio.play_sound(Audio.shock_hit)
		area.take_damage(1)
		area.set_stunned(15)
		emit_signal('hit_enemy')
		queue_free()
