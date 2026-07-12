extends CharacterBody2D
class_name Player

@export var speed: float;
@export var gravity: float;
@export var jump_force: float;
@export var coyotte_time: float;
@export var barrel_interaction_range: float;
@export var barrel_offset: Vector2;
@export var throw_force_ref: Vector2;
@export var throw_hold_time_for_ref: float;
@export var max_throw_hold_time: float;

var PLAYER_SIZE: float = 32.0;

var not_grounded_timer: float = 0.0;
var chosen_barrel: Barrel = null;	
var is_flipped: bool = false;

var throw_start_time: float;

func _physics_process(delta: float) -> void:
	handle_animation()
	var input_x: float = Input.get_action_strength("Right") - Input.get_action_strength("Left");
	if(input_x == 1.0): is_flipped = false;
	elif(input_x == -1.0): is_flipped = true;

	if(Input.is_action_just_pressed("Jump") && not_grounded_timer <= coyotte_time && velocity.y >= 0.0):
		velocity.y = -jump_force * PLAYER_SIZE;

	if(chosen_barrel != null):
		chosen_barrel.global_position = global_position + (barrel_offset * PLAYER_SIZE);
		if(Input.is_action_just_pressed("Throw")):
			throw_start_time = Time.get_ticks_msec();
		if(Input.is_action_just_released("Throw")):
			var hold_time: float = (Time.get_ticks_msec() - throw_start_time) / 1000 / throw_hold_time_for_ref;
			hold_time = minf(hold_time, max_throw_hold_time);

			chosen_barrel.enable_physics();
			var throw_vec: Vector2 = Vector2(throw_force_ref.x, throw_force_ref.y);
			if(is_flipped): throw_vec.x = -throw_vec.x;
			throw_vec *= PLAYER_SIZE;
			throw_vec.y *= hold_time;
			throw_vec += velocity;
			chosen_barrel.apply_impulse(throw_vec);
			chosen_barrel = null;
	if(Input.is_action_just_pressed("Interact")):
		if(chosen_barrel == null):
			var barrels = get_tree().get_nodes_in_group("barrel");
			var closest_dist: float = 1.79769e308;
			var closest_barrel: Barrel = null;
			for i in barrels.size():
				var barrel: Barrel = barrels[i];
				var dist: = barrel.global_position.distance_to(global_position);
				if(dist > barrel_interaction_range * PLAYER_SIZE): continue;
				if(dist < closest_dist):
					closest_dist = dist;
					closest_barrel = barrel;
			if(closest_barrel != null):
				closest_barrel.disable_physics();
				chosen_barrel = closest_barrel;
		else:
			chosen_barrel.enable_physics();
			chosen_barrel.apply_impulse(velocity);
			chosen_barrel = null;

	if(is_on_floor()):
		not_grounded_timer = 0.0;
	else:
		not_grounded_timer += delta;
	
	velocity.x = input_x * PLAYER_SIZE * speed;
	velocity.y += gravity * PLAYER_SIZE * delta;
	move_and_slide();
	for i in get_slide_collision_count():
		var collision: KinematicCollision2D = get_slide_collision(i)
		if(collision.get_collider() is RigidBody2D):
			collision.get_collider().linear_velocity.x = input_x * PLAYER_SIZE * speed;
			
			
func handle_animation():
	if velocity and is_on_floor():
		%Sprite2D.play("walk")
	else:
		%Sprite2D.play("idle")
	%Sprite2D.flip_h = is_flipped
	if not is_on_floor():
		%Sprite2D.play("jump")
