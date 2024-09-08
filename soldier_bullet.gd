extends Node2D

var velocity = Vector2()
var curent_x_pos
var direction = Vector2()

func _ready() -> void:
	add_to_group("bullet")
	Global.soldiers -= 100
	curent_x_pos = position.x
	print(is_in_group("bullet"))

func _process(delta: float) -> void:
	velocity.y = 500  # Change the speed of the movement here
	position.y -= velocity.y * delta
	
	if position.y < -2000:
		queue_free()
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		queue_free()  # Remove this node (the spawned object)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		queue_free()  # Remove this node (the spawned object)
