class_name PlayMusicOnReady
extends Node

@export var intro_sound: AudioStream;
@export var loop_sound: AudioStream;

func _ready() -> void:
	await get_tree().create_timer(1.0).timeout;
	SoundManager.play_music(intro_sound);
	await SoundManager.get_music_node().finished;
	SoundManager.play_music(loop_sound);
