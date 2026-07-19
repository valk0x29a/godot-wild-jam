class_name CutscenesManager
extends Node

const SCENES_PATH = "res://scenes/"

@export var text_ui: RichTextLabel;
@export var time_to_show_next_char: float = 0.1;
@export var time_to_switch_to_next_cutscene: float = 1.0;
@export var scene_to_load_after: String
@export var texts: Array[String] = [""]

static var instance: CutscenesManager;

var current_index;
var current_text_index = 0;
var current_timer = 0;


func _ready() -> void:
	if(instance == null):
		instance = self;
		for i in get_child_count():
			get_child(i).visible = false;
		current_index = 0;
		current_text_index = 0;
		current_timer = time_to_show_next_char;
		get_child(0).visible = true;
		text_ui.visible_characters = 0;
		text_ui.text = texts[0];

func _process(delta: float) -> void:
	current_timer -= delta;

	if(current_timer <= 0):
		current_text_index += 1;
		text_ui.visible_characters = current_text_index;
		current_timer = time_to_show_next_char;
		if (current_text_index == texts[current_index].length() + 1):
			current_timer = time_to_switch_to_next_cutscene;
		if(current_text_index == texts[current_index].length() + 2):
			move_next();


func move_next():
	if(current_index < get_child_count() - 1):
		get_child(current_index).visible = false;
		current_index += 1;
		get_child(current_index).visible = true;
		current_text_index = 0;
		text_ui.visible_characters = 0;
		text_ui.text = texts[current_index];
	else:
		get_tree().change_scene_to_file(SCENES_PATH + scene_to_load_after + ".tscn");
