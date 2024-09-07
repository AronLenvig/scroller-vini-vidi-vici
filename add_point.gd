extends Node2D
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity.y = Global.game_speed  # Change the speed of the movement here
	position.y += velocity.y * delta
	# if object is more than 2000 delete it
	if position.y > 2000:
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		# Signal the player or global manager to increase points
		Global.soldiers += 100
		queue_free()  # Remove this node (the spawned object)
