extends Control

const SCENES_PATH = "res://scenes/"
@export var scene_name: String

func _ready() -> void:
	var play_button: Button = get_node("Play");
	play_button.pressed.connect(play);
	var quit_button: Button = get_node("Quit");
	quit_button.pressed.connect(quit);

func play():
	get_tree().change_scene_to_file(SCENES_PATH + scene_name + ".tscn");

func quit():
	get_tree().quit();
