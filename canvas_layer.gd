extends CanvasLayer

@onready var blackout_screen = $ColorRect
@onready var animation_player= $AnimationPlayer

signal on_tansition_finished
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	blackout_screen.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(animation_name):
	if animation_name == "to_black":
		on_tansition_finished.emit()
		animation_player.play("to_normal")
	elif animation_name == "to_normal":
		blackout_screen.visible = false
		
	

func transition():
	blackout_screen.visible = true
	animation_player.play("to_black")
