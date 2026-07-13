extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if(body is Player):
		call_deferred("restart_scene");

func restart_scene():
	get_tree().reload_current_scene()
