class_name PlaySoundOnReady
extends Node

@export var sound: AudioStream;

func _ready() -> void:
    SoundManager.play_audio_stream(sound);
