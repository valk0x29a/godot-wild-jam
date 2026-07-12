extends CharacterBody2D
class_name Enemy

@export var speed: float;
@export var gravity: float;
var ENEMY_SIZE: float = 32.0;

@onready var player: Player = get_tree().get_root().get_child(0).get_node("Player");

func _physics_process(delta: float) -> void:
	var direction_x = 0.0
	if(player.global_position.x < global_position.x):
		direction_x = -1.0;
	else:
		direction_x = 1.0;
	# print(direction_x);
	velocity.y += gravity * ENEMY_SIZE * delta;
	velocity.x = direction_x * ENEMY_SIZE * speed;
	move_and_slide();
