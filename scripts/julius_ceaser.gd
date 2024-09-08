extends CharacterBody2D

var add_point_node = preload("res://soldier_bullet.tscn")

@export var speed := int(Global.game_speed + 200)
@export var jump_strength := -500
@onready var animation_player = $AnimationPlayer
var can_shoot = 0.0
var starting_y = null

var soilder_follower = preload("res://back_soilder.tscn")
var last_soilder = 0
var followeres = 2

func _ready() -> void:
	animation_player.play("walk")
	starting_y = position.y
	add_follower(Vector2(25, 50), false )
	add_follower(Vector2(-25, 50), true )

func spawn_point_gain(pos: Vector2):
	var point_instance = add_point_node.instantiate()
	#add_point_node.positions = pos
	point_instance.position = pos
	add_sibling(point_instance)
	print("spawn_point_gain")
	
func add_follower(pos: Vector2, flip_h: bool = false):
	var follower = soilder_follower.instantiate()
	follower.position = pos
	follower.flip_h = flip_h
	add_child(follower)
	print("add follow")
	pass
 
func _physics_process(delta: float) -> void:
	if last_soilder != Global.soldiers:
		print("update")
		var new_followeres = int(Global.soldiers / 100)
		if new_followeres > followeres:
			for i in range(new_followeres-followeres):
				pass
		
			#for i in range(followeres):
				#add_follower(Vector2(25, 50), false )
				#add_follower(Vector2(-25, 50), true )
			#pass
		
	var direction := Vector2.ZERO
	# handle movement
	if can_shoot <= 0.0:
		if Input.is_action_pressed("forward"):
			spawn_point_gain(position)
			can_shoot = 0.5
	else:
		can_shoot -= delta
		
	if Input.is_action_pressed("left"):
		direction.x -= 1
	elif Input.is_action_pressed("right"):
		direction.x += 1
		
	velocity.x = direction.x * speed
	#velocity.y = direction.y * speed
	
	var new_y = position.y
	
	if new_y != starting_y:
		get_tree().change_scene_to_file("res://death_screen.tscn")
		
	# when hitting the wall ignore
	last_soilder = Global.soldiers
	move_and_slide()
