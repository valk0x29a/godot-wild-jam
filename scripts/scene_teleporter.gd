extends Area2D

const SCENES_PATH = "res://scenes/"
@export var scene_name: String

func _on_body_entered(body: Node2D) -> void:
	if(body is Player):
		if(scene_name == ""): print("ERROR: scene-name not defined in scene teleporter!!!"); return;
		call_deferred("teleport_player");

func teleport_player():
	get_tree().change_scene_to_file(SCENES_PATH + scene_name + ".tscn");
