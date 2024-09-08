extends Node2D

var add_point_node = preload("res://Sceans/add_point.tscn")
var wall_node = preload("res://Sceans/wall.tscn")
var wall_node_h = preload("res://Sceans/wall_h.tscn")
var enemy_node = preload("res://enemy_soldier.tscn")
var enemy_node_w = preload("res://Soldier_wall.tscn")

var time_passed: float = 0.0
var increment_interval: float = 2.5

var lable_funct = [
	["+1000", "add1000", false],
	["-1000", "add1000", true],
	["÷ 10", "div10", true],
	["+100", "add100", false],
	["-100", "sub100", true],
	["x 2", "ganga2", false],
	["x 1.5", "ganga1_5", false],
	["÷ 2", "div2", true],
	["÷ 4", "div4", true],
	["-69", "sub69", true],
	["cleo", "cleo", false],
]

var buble_list = [
	"douple_bubble",
	"douple_buble_with_wall",
	"bubble_wave",
	"bubble_wave_reverse",
	"douple_buble_front_walls",
	"douple_buble_back_walls",
	"wall_obstical",
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
	spawn_point_gain(Vector2(120,0), 1.4)
	spawn_point_gain(Vector2(-140,0), 1.4)
	spawn_enemy_w(Vector2(0,150))
	
func douple_buble_with_wall():
	spawn_point_gain(Vector2(150,0), 1.2)
	spawn_wall(Vector2(-20,-150))
	spawn_point_gain(Vector2(-150,0), 1.2)
	
func wall_obstical():
	spawn_wall_h(Vector2(280, -150))
	spawn_wall_h(Vector2(120, -150))
	
	spawn_wall_h(Vector2(-115, 150))
	spawn_wall_h(Vector2(0, 150))
	
	
func douple_buble_front_walls():
	spawn_point_gain(Vector2(150,0))
	spawn_wall_h(Vector2(280, 150))
	spawn_point_gain(Vector2(-150,0))
	spawn_wall_h(Vector2(-115, 150))
	
func douple_buble_back_walls():
	spawn_point_gain(Vector2(150,0))
	spawn_wall_h(Vector2(280, -150))
	spawn_point_gain(Vector2(-150,0))
	spawn_wall_h(Vector2(-115, -150))
	
func bubble_wave():
	spawn_point_gain(Vector2(200, -100), 0.7)
	spawn_point_gain(Vector2(0, 0), 0.7)
	spawn_point_gain(Vector2(-200, 100), 0.7)
	
func bubble_wave_reverse():
	spawn_point_gain(Vector2(200, 100), 0.7)
	spawn_point_gain(Vector2(0, 0), 0.7)
	spawn_point_gain(Vector2(-200, -100), 0.7)

func spawn_point_gain(pos: Vector2, scale: float = 1.0):
	var point_instance = add_point_node.instantiate()
	#add_point_node.positions = pos
	var _item = lable_funct.pick_random()
	point_instance.position = pos
	point_instance.scale = Vector2(scale, scale)
	if _item[0] == "cleo":
		point_instance._is_cleopatra = true
	point_instance._is_negativ = _item[2]
	point_instance.label_text = _item[0]
	var callable = Callable(self, _item[1])
	point_instance._action = callable
	add_child(point_instance)
	
func spawn_wall(pos: Vector2):
	var wall_instance = wall_node.instantiate()
	wall_instance.position = pos
	add_child(wall_instance)
	
func spawn_wall_h(pos: Vector2):
	var wall_instance = wall_node_h.instantiate()
	wall_instance.position = pos
	add_child(wall_instance)
	
func spawn_enemy(pos: Vector2):
	var enemy_instance = enemy_node.instantiate()
	enemy_instance.position = pos
	add_child(enemy_instance)
	
	
func spawn_enemy_w(pos: Vector2):
	var enemy_instance = enemy_node_w.instantiate()
	enemy_instance.position = pos
	add_child(enemy_instance)
	
func add100():
	Global.soldiers += 100
	
func sub100():
	Global.soldiers -= 100
	
func add1000():
	Global.soldiers += 1000
	
func sub1000():
	Global.soldiers -= 1000
	
func ganga2():
	Global.soldiers = Global.soldiers * 2
	
func ganga1_5():
	Global.soldiers = int(Global.soldiers * 1.5)
	
func div2():
	if Global.soldiers == 0:
		Global.soldiers = 0
	else:
		Global.soldiers = Global.soldiers / 2
		
func div4():
	if Global.soldiers == 0:
		Global.soldiers = 0
	else:
		Global.soldiers = Global.soldiers / 4

func div10():
	if Global.soldiers == 0:
		Global.soldiers = 0
	else:
		Global.soldiers = Global.soldiers / 10
	
func sub69():
	Global.soldiers -= 69
	
func cleo():
	Global.cleopatras += 1
	
