extends Button

func _ready() -> void:
    pressed.connect(retry);

func retry():
    SoundManager.play_ui_button_sound();
    get_tree().reload_current_scene();
