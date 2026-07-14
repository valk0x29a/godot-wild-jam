extends StaticBody2D

@export var jump_force: float = 15.0;

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body is CharacterBody2D):
		var character: CharacterBody2D = body;
		character.velocity.y = -jump_force;
	if(body is RigidBody2D):
		var rigidbody: RigidBody2D = body;
		rigidbody.velocity.y = -jump_force;
