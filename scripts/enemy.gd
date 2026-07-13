extends CharacterBody2D
class_name Enemy

@export var speed: float;
@export var gravity: float;
var ENEMY_SIZE: float = 32.0;
var state = 'follow'
var direction

@onready var player: Player = get_tree().get_root().get_child(0).get_node("Player");

func _physics_process(delta: float) -> void:
	check_state()
	if state == 'follow':
		follow()
	elif state == 'attack':
		attack()
	velocity.y += gravity * ENEMY_SIZE * delta;
	handle_animation()
	move_and_slide();

func check_state():
	if global_position.distance_to(player.global_position)>50:
		state = 'follow'
	else:
		state = 'attack'
	
func follow():
	direction = global_position.direction_to(player.global_position)
	velocity = direction * ENEMY_SIZE * speed;

func attack():
	velocity = Vector2.ZERO

func handle_animation():
	if direction.x <0 :
		%AnimatedSprite2D.flip_h = false
	else:
		%AnimatedSprite2D.flip_h = true
	if state == 'follow':
		%AnimatedSprite2D.play("walk")
	elif state == 'attack':
		%AnimatedSprite2D.play("attack")
