extends Node2D

signal on_button_press;

func _on_body_entered(_body: Node2D) -> void:
    on_button_press.emit();
	
