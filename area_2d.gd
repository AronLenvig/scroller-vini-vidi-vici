extends Area2D

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set initial velocity or other properties here if needed
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity.y = Global.game_speed  # Change the speed of the movement here
	position.y += velocity.y * delta  # Move the object horizontally
