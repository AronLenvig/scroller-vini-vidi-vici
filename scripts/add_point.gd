extends Node2D

@export var label_text: String
@export var _action: Callable
@export var _is_negativ: bool
@export var _is_cleopatra: bool



var velocity = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if _is_negativ:
		var pos_sprite = $Area2D/Sprite2D
		var neg_sprite = $Area2D/Sprite2D2
		pos_sprite.visible = false
		neg_sprite.visible = true
	if _is_cleopatra:
		var pos_sprite = $Area2D/Sprite2D
		var cleo_sprite = $Area2D/cleopatra
		pos_sprite.visible = false
		cleo_sprite.visible = true
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var label = $Area2D/Label
	label.text = label_text
	
	velocity.y = Global.game_speed  # Change the speed of the movement here
	position.y += velocity.y * delta
	# if object is more than 2000 delete it
	if position.y > 2000:
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		_action.call()
		queue_free()  # Remove this node (the spawned object)
