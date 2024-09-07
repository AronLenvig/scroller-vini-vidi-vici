extends Node

var soldiers = 100
var cleopatras = 0
var game_speed = 500

var time_passed: float = 0.0
var increment_interval: float = 1.0
var timer: float = 0.0
var game_start = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Add the delta time to the time_passed variable
	time_passed += delta
	if game_start:
		timer += delta
	
	if time_passed >= increment_interval:
		game_speed += 1
		time_passed = 0.0  # Reset the timer
		
		#print("Game speed increased: ", game_speed)
