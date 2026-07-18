extends Node2D

signal on_button_press;
var played = false

func _on_body_entered(_body: Node2D) -> void:
	if not played:
		on_button_press.emit();
		SoundManager.play_ingame_button_sound();
		%AnimatedSprite2D.play("pressed")
		played = true
	
