extends Node2D

@export var flip_h: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if flip_h:
		var sprite = $Sprite2D
		sprite.flip_h = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# if person hits something than delete
	# remove 100 soilders
	pass
