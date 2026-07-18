extends Control

const SCENES_PATH = "res://scenes/"
@export var scene_name: String
var pressed = false

func _ready() -> void:
	var play_button: TextureButton = get_node("Play");
	play_button.pressed.connect(play);

func play():
	if not pressed:
		pressed = true
		SoundManager.play_ui_button_sound();
		%AnimatedSprite2D.play("pressed")
		await %AnimatedSprite2D.animation_finished
		get_tree().change_scene_to_file(SCENES_PATH + scene_name + ".tscn");
