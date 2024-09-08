extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("collectibles")
	# Set initial velocity or other properties here if needed
	pass
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	print("entered")
	# Check if the body is in the "Player" group
	if body.is_in_group("player"):
		Global.soldiers -= 100
		print("soldier")
		queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
