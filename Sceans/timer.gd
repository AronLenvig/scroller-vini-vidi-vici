extends Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.timer > 60:
		#End
		print("END")
		pass
	text = "%.1f" % (60.0 - Global.timer)
