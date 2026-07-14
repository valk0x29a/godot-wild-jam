extends StaticBody2D

@onready var trigger: Area2D = get_node("Fan Trigger");
@export var force: float;

func _physics_process(_delta: float) -> void:
	var nodes = trigger.get_overlapping_bodies();
	print(nodes.size());
	var direction = (trigger.get_node("CollisionShape2D").global_position - global_position).normalized();
	print(direction);
	for i in nodes.size():
		if(nodes[i] is RigidBody2D):
			var rigidbody: RigidBody2D = nodes[i];
			rigidbody.apply_impulse(direction * force);
		if(nodes[i] is CharacterBody2D):
			var character: CharacterBody2D = nodes[i];
			character.velocity += direction * force * 32;
			character.move_and_slide();
