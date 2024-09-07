extends Node2D

var velocity = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity.x += 1
	
	velocity.y = Global.game_speed  # Change the speed of the movement here
	#velocity.y = 1000
	position.y += velocity.y * delta
	# if object is more than 2000 delete it
	if position.y > 2000:
		queue_free()
