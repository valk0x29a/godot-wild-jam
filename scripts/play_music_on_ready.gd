class_name PlayMusicOnReady
extends Node

@export var sound: AudioStream;

func _ready() -> void:
	SoundManager.play_music(sound);
