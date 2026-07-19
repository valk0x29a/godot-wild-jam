extends StaticBody2D

@export var door_open_offset: Vector2;
@onready var original_pos: Vector2 = global_position;
@export var open_duration: float = 1.0;
var is_opening: bool = false;
var played = false

func _physics_process(delta: float) -> void:
	if(is_opening):
		var reached_x: bool;
		var reached_y: bool;
		if(door_open_offset.x > 0):
			reached_x = global_position.x > original_pos.x + door_open_offset.x;
		else:
			reached_x = global_position.x < original_pos.x + door_open_offset.x;
		if(door_open_offset.x == 0): reached_x = true;

		if(door_open_offset.y > 0):
			reached_y = global_position.y > original_pos.y + door_open_offset.y;
		else:
			reached_y = global_position.y < original_pos.y + door_open_offset.y;
		if(door_open_offset.y == 0): reached_y = true;

		is_opening = !reached_x || !reached_y;
		if(!is_opening): return;
		global_position += door_open_offset * delta / open_duration;


func open(): 
	is_opening = true;
	if not played:
		%Sprite2D.play("open")
		played = true
		SoundManager.play_door_sound();
