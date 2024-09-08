extends CharacterBody2D

var add_point_node = preload("res://soldier_bullet.tscn")

@export var speed := int(Global.game_speed + 200)
@export var jump_strength := -500
@onready var animation_player = $AnimationPlayer
var can_shoot = 0.0

var starting_y = null

func _ready() -> void:
	animation_player.play("walk")
	starting_y = position.y

func spawn_point_gain(pos: Vector2):
	var point_instance = add_point_node.instantiate()
	#add_point_node.positions = pos
	point_instance.position = pos
	add_sibling(point_instance)

func _physics_process(delta: float) -> void:
		
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
	move_and_slide()
