extends RigidBody2D
class_name Barrel

var is_thrown: bool = false;

func _ready() -> void:
    is_thrown = false;

func disable_physics():
    freeze = true;
    process_mode = Node.PROCESS_MODE_DISABLED;

func enable_physics():
    freeze = false;
    process_mode = Node.PROCESS_MODE_PAUSABLE;