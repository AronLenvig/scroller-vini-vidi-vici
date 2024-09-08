extends Node2D

# Define your global variables here
var ceaser_soldiers: int = 100
var player_score: int = 0

func _ready() -> void:
	var diskArr = ["macos", "windows", "linux", "web"]
	
	if Global.is_mobile:
		$MobileCanvas.visible = true
		
func _input(event: InputEvent) -> void:
	# if exit button is pressed then exit the game
	if event.is_action_pressed("exit"):
		get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.soldiers < 0:
		#Transition.transition()
		#await Transition.on_tansition_finished
		get_tree().change_scene_to_file("res://death_screen.tscn")
		
	elif Global.timer >= 60:
		#Transition.transition()
		#await Transition.on_tansition_finished
		get_tree().change_scene_to_file("res://end_screen.tscn")
