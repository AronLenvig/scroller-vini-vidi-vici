extends CharacterBody2D


@export var speed := 400
@export var jump_strength := -500

func _physics_process(delta: float) -> void:
		
	var direction := Vector2.ZERO
	# handle movement
	
	if Input.is_action_pressed("left"):
		direction.x -= 1
	elif Input.is_action_pressed("right"):
		direction.x += 1
	
	velocity.x = direction.x * speed
	velocity.y = direction.y * speed
	
	# when hitting the wall ignore
	

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("hello bitch")
	print("soldiers", Global.soldiers)
	pass # Replace with function body.
