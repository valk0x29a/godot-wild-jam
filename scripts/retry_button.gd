extends Button

func _ready() -> void:
    pressed.connect(retry);

func retry():
    get_tree().reload_current_scene();
