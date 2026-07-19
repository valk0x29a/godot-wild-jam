extends Node


func play_jump():
	%jump.play();

func play_walk():
	%walk.play();

func play_death_splash_sound():
	%death_splash.play();

func play_ui_button_sound():
	%ui_button.play();

func play_ingame_button_sound():
	%ingame_button.play();

func play_fan_sound():
	%fan.play();

func play_jumppad_sound():
	%jumppad.play();

func play_barrel_bounce_sound():
	%barrel_bounce.play();

func play_bouncable_barrel_bounce_sound():
	%bouncable_barrel_bounce.play();

func play_barrel_explosion_sound():
	%barrel_explosion.play();

func play_door_sound():
	%door.play();

func play_music(stream: AudioStream):
	%music_placeholder.stream = stream;
	%music_placeholder.play();

func stop_music():
	%music_placeholder.stop()

func play_story():
	%story.play()

func get_music_node() -> AudioStreamPlayer: return %music_placeholder;
