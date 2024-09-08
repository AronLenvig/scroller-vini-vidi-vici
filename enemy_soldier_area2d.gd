extends Area2D

var velocity: Vector2

func _process(delta: float) -> void:
	var label = $Area2D/Label
	velocity.y = Global.game_speed  # Change the speed of the movement here
	position.y += velocity.y * delta
	# if object is more than 2000 delete it
	if position.y > 2000:
		queue_free()
