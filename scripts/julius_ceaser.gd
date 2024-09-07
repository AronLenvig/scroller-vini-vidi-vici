extends CharacterBody2D

var add_point_node = preload("res://soldier_bullet.tscn")

@export var speed := 400
@export var jump_strength := -500
@onready var animation_player = $AnimationPlayer
var can_shoot = 0.0

func _ready() -> void:
	animation_player.play("walk")

func spawn_point_gain(pos: Vector2):
	var point_instance = add_point_node.instantiate()
	#add_point_node.positions = pos
	point_instance.position = pos
	add_child(point_instance)

func _physics_process(delta: float) -> void:
		
	var direction := Vector2.ZERO
	# handle movement
	if can_shoot <= 0.0:
		if Input.is_action_pressed("forward"):
			spawn_point_gain(Vector2(0,0))
			can_shoot = 0.5
	else:
		can_shoot -= delta
		
	if Input.is_action_pressed("left"):
		direction.x -= 1
	elif Input.is_action_pressed("right"):
		direction.x += 1
	

		
	
	velocity.x = direction.x * speed
	#velocity.y = direction.y * speed
	
	# when hitting the wall ignore
	move_and_slide()
