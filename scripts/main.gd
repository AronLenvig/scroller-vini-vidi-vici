extends Node2D

# Define your global variables here
var ceaser_soldiers: int = 100
var player_score: int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.soldiers < 0:
		Transition.transition()
		await Transition.on_tansition_finished
		get_tree().change_scene_to_file("res://death_screen.tscn")
	elif Global.timer < 0:
		Transition.transition()
		await Transition.on_tansition_finished
		get_tree().change_scene_to_file("res://end_screen.tscn")
