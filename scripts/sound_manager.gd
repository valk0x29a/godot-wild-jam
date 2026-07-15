extends Node

# var jump_sound = preload("res://assets/audio/sfx/jump.wav");
# var walk_sound = preload("res://assets/audio/sfx/jump.wav");
var death_splash_sound = preload("res://assets/audio/sfx/squish.mp3");
# var ui_button_sound = preload("res://assets/audio/sfx/jump.wav");
# var ingame_button_sound = preload("res://assets/audio/sfx/jump.wav");
# var fan_sound = preload("res://assets/audio/sfx/jump.wav");
# var jumppad_sound = preload("res://assets/audio/sfx/jump.wav");
# var barrel_bounce_sound = preload("res://assets/audio/sfx/jump.wav");
# var bouncable_barrel_bounce_sound = preload("res://assets/audio/sfx/jump.wav");
# var barrel_explosion_sound = preload("res://assets/audio/sfx");
# var door_sound = preload("res://assets/audio/sfx");


var audio: AudioStreamPlayer;

func _ready() -> void:
    audio = AudioStreamPlayer.new();
    add_child(audio);

# func play_jump():
#     audio.stream = jump_sound;
#     audio.play();

# func play_walk():
#     audio.stream = walk_sound;
#     audio.play();

func play_death_splash_sound():
    audio.stream = death_splash_sound;
    audio.play();

# func play_ui_button_sound():
#     audio.stream = ui_button_sound;
#     audio.play();

# func play_ingame_button_sound():
#     audio.stream = ingame_button_sound;
#     audio.play();

# func play_fan_sound():
#     audio.stream = fan_sound;
#     audio.play();

# func play_jumppad_sound():
#     audio.stream = jumppad_sound;
#     audio.play();

# func play_barrel_bounce_sound():
#     audio.stream = barrel_bounce_sound;
#     audio.play();

# func play_bouncable_barrel_bounce_sound():
#     audio.stream = bouncable_barrel_bounce_sound;
#     audio.play();

# func play_barrel_explosion_sound():
#     audio.stream = barrel_explosion_sound;
#     audio.play();

# func play_door_sound():
#     audio.stream = door_sound;
#     audio.play();

func play_audio_stream(stream: AudioStream):
    audio.stream = stream;
    audio.play();