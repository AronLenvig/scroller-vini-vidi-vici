extends Node2D

var add_point_node = preload("res://Sceans/add_point.tscn")

var time_passed: float = 0.0
var increment_interval: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_passed += delta
	if time_passed >= increment_interval:
		spawn_point_gain(Vector2(0,0))
		time_passed = 0.0
		
func spawn_point_gain(pos: Vector2):
	var point_instance = add_point_node.instantiate()
	#add_point_node.positions = pos
	point_instance.position = pos
	add_child(point_instance)
