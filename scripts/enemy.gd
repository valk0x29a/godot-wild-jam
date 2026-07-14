extends CharacterBody2D
class_name Enemy

@export var speed: float;
@export var gravity: float;
@export var attack_delay: float;
@export var attack_range:float  = 50.0
var ENEMY_SIZE: float = 32.0;
var state: String = 'follow'
var direction: Vector2;

var attack_timer;

@onready var player: Player = get_tree().get_root().get_child(0).get_node("Player");

func _physics_process(delta: float) -> void:
	check_state()

	if state == 'follow':
		attack_timer = attack_delay;
		direction = global_position.direction_to(player.global_position)
		velocity.x = direction.x * ENEMY_SIZE * speed;
	elif state == 'attack':
		player.is_player_locked = true;
		velocity = Vector2.ZERO
		attack_timer -= delta;
		if(attack_timer <= 0):
			player.die();

	velocity.y += gravity * ENEMY_SIZE * delta;
	handle_animation()
	move_and_slide();

func check_state():
	if global_position.distance_to(player.global_position) > attack_range:
		state = 'follow'
	else:
		state = 'attack'

func handle_animation():
	if direction.x < 0 :
		%AnimatedSprite2D.flip_h = false
	else:
		%AnimatedSprite2D.flip_h = true
	if state == 'follow':
		%AnimatedSprite2D.play("walk")
	elif state == 'attack':
		%AnimatedSprite2D.play("attack")
