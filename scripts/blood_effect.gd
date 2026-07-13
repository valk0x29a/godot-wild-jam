extends AnimatedSprite2D


func _physics_process(_delta: float) -> void:
	await animation_finished
	queue_free()
