extends StaticBody2D

@export var jump_force: float = 15.0;

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body is CharacterBody2D):
		%Sprite2D.play("boing")
		var character: CharacterBody2D = body;
		character.velocity.y = -jump_force;
		await %Sprite2D.animation_finished
		%Sprite2D.play("default")
	if(body is RigidBody2D):
		%Sprite2D.play("boing")
		var rigidbody: RigidBody2D = body;
		rigidbody.linear_velocity.y = -jump_force;
		# if(body is Player): SoundManager.play_jumppad_sound();
		await %Sprite2D.animation_finished
		%Sprite2D.play("default")
