extends RigidBody2D
class_name Barrel

var is_thrown: bool = false;
@export var bounciness: float = 0.0;

func _ready() -> void:
    is_thrown = false;
    physics_material_override.bounce = bounciness;

func disable_physics():
    freeze = true;
    process_mode = Node.PROCESS_MODE_DISABLED;

func enable_physics():
    freeze = false;
    process_mode = Node.PROCESS_MODE_PAUSABLE; 
