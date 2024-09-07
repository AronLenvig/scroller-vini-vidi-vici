extends Node2D

var add_point_node = preload("res://Sceans/add_point.tscn")
var wall_node = preload("res://Sceans/wall.tscn")

var time_passed: float = 0.0
var increment_interval: float = 3.0

var lable_funct = [
	["+100", "add100"],
	["-100", "sub100"],
	["x 2", "ganga2"],
	["÷ 2", "div2"],
	["-69", "sub69"],
]

var buble_list = [
	"douple_bubble",
	"douple_buble_with_wall",
	"bubble_wave",
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_passed += delta
	if time_passed >= increment_interval:
		var _item = Callable(self, buble_list.pick_random())
		_item.call()
		time_passed = 0.0
		
func douple_bubble():
	spawn_point_gain(Vector2(120,0))
	spawn_point_gain(Vector2(-140,0))
	
func douple_buble_with_wall():
	spawn_point_gain(Vector2(120,0))
	spawn_wall(Vector2(0,-100))
	spawn_point_gain(Vector2(-140,0))
	
func bubble_wave():
	spawn_point_gain(Vector2(200, -200), 0.7)
	spawn_point_gain(Vector2(100, -100), 0.7)
	spawn_point_gain(Vector2(0, 0), 0.7)
	spawn_point_gain(Vector2(-100, 100), 0.7)
	spawn_point_gain(Vector2(-200, 200), 0.7)
	
	

		
func spawn_point_gain(pos: Vector2, scale: float = 1.0):
	var point_instance = add_point_node.instantiate()
	#add_point_node.positions = pos
	var _item = lable_funct.pick_random()
	point_instance.position = pos
	point_instance.scale = Vector2(scale, scale)
	point_instance.label_text = _item[0]
	var callable = Callable(self, _item[1])
	point_instance._action = callable
	add_child(point_instance)
	
func spawn_wall(pos: Vector2):
	var wall_instance = wall_node.instantiate()
	wall_instance.position = pos
	add_child(wall_instance)
	

func add100():
	Global.soldiers += 100
	
func sub100():
	Global.soldiers -= 100
	
func ganga2():
	Global.soldiers = Global.soldiers * 2
	
func div2():
	Global.soldiers = Global.soldiers / 2
	
func sub69():
	Global.soldiers -= 69
	
