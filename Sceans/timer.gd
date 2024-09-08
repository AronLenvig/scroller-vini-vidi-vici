extends Label

var play_time = 60

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.timer > play_time:
		if Global.soldiers < 4000:
			get_tree().change_scene_to_file("res://death_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://win_screen.tscn")
	text = "%.1f" % (play_time - Global.timer)
