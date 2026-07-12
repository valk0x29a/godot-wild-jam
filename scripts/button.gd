extends Node2D

signal on_button_press;
var played = false

func _on_body_entered(_body: Node2D) -> void:
	on_button_press.emit();
	if not played:
		%AnimatedSprite2D.play("pressed")
		played = true
	
