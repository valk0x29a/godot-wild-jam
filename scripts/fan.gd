extends StaticBody2D

@onready var trigger: Area2D = get_node("Fan Trigger");
@export var force: float;

func _ready() -> void:
	SoundManager.play_fan_sound();

func _exit_tree() -> void:
	SoundManager.stop_fan_sound();

func _physics_process(_delta: float) -> void:
	var nodes = trigger.get_overlapping_bodies();
	var direction = (trigger.get_node("CollisionShape2D").global_position - global_position).normalized();
	for i in nodes.size():
		if(nodes[i] is RigidBody2D):
			var rigidbody: RigidBody2D = nodes[i];
			rigidbody.apply_impulse(direction * force);
		if(nodes[i] is CharacterBody2D):
			var character: CharacterBody2D = nodes[i];
			character.velocity += direction * force;
			character.move_and_slide();
