extends CharacterBody2D
class_name Tut_guy



func blood_effect(node):
	var effect = preload("uid://db2es7rfivbxe").instantiate()
	effect.global_position = node.global_position
	add_sibling(effect)

func _on_barrel_body_entered(body: Node) -> void:
	if body == self:
		SoundManager.play_death_splash_sound();
		blood_effect(self)
		queue_free()
