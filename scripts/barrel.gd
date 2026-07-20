extends RigidBody2D
class_name Barrel

var is_thrown: bool = false;
@export var bounciness: float = 0.0;
@export var bounce_sound_required_force: float = 64.0;
@export var explodes_on_touch: bool = false;
@export var explode_required_force: float = 0.0;
@export var explosion_force: float;

var explosion_area: Area2D;

func _ready() -> void:
	if(explodes_on_touch):
		explosion_area = get_node("ExplosionArea");
	is_thrown = false;
	physics_material_override.bounce = bounciness;

func disable_physics():
	global_rotation = 0
	if %Sprite2D:
		%Sprite2D.play("held")
	freeze = true;
	process_mode = Node.PROCESS_MODE_DISABLED;

func enable_physics():
	if %Sprite2D:
		if %Sprite2D.sprite_frames.has_animation('thrown'):
			%Sprite2D.play("thrown")
		else:
			%Sprite2D.play("idle")
		
	freeze = false;
	process_mode = Node.PROCESS_MODE_PAUSABLE; 

func _on_barrel_trigger_body_entered(body: Node2D) -> void:
	if(body.is_in_group("enemy")):
		if(absf(linear_velocity.x) > absf(body.velocity.x)):
			blood_effect(body)
			SoundManager.play_death_splash_sound();
			body.queue_free();

func _on_body_entered(_body: Node) -> void:
	if(linear_velocity.length() > bounce_sound_required_force):
		if(bounciness > 0.1): SoundManager.play_bouncable_barrel_bounce_sound();
		else: SoundManager.play_barrel_bounce_sound();
	if(!explodes_on_touch): return;
	if(linear_velocity.length() > explode_required_force):
		var nodes = explosion_area.get_overlapping_bodies();
		for i in nodes.size():
			var direction = (nodes[i].global_position - global_position).normalized();
			if(nodes[i] is RigidBody2D):
				var rigidbody: RigidBody2D = nodes[i];
				rigidbody.apply_impulse(direction * explosion_force);
			if(nodes[i] is Player):
				nodes[i].die();
			if(nodes[i] is Enemy):
				blood_effect(nodes[i])
				nodes[i].queue_free()
	
		explode()
		queue_free();
		
func explode():
	SoundManager.play_barrel_explosion_sound();
	var effect = preload("uid://djyn8sj27sgd6").instantiate()
	effect.global_position = global_position
	add_sibling(effect)

func blood_effect(node):
	var effect = preload("uid://db2es7rfivbxe").instantiate()
	effect.global_position = node.global_position
	add_sibling(effect)
