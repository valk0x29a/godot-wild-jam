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

func _on_barrel_trigger_body_entered(body: Node2D) -> void:
    if(body.is_in_group("enemy")):
        if(absf(linear_velocity.x) > absf(body.velocity.x)):
            body.queue_free();
