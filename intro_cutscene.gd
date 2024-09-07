extends CanvasLayer

@onready var animation_player = $AnimationPlayer
@onready var pic_1 = $pictur_1/sprite_1
@onready var pic_2 = $pictur_2/sprite_2
@onready var pic_3 = $pictur_3/sprite_3
@onready var pic_4 = $pictur_4/sprite_4
@onready var pic_5 = $pictur_5/sprite_5

func _input(event: InputEvent) -> void:
	if event.is_action("Skip_sceness "):
		animation_player.stop()
		get_tree().change_scene_to_file("res://main.tscn")
		
func start_introcutscean():
	animation_player.play("start_cutscean")
	animation_player.animation_finished.connect(_animation_over)
	
func _animation_over(animation_name):
	Transition.transition()
	await Transition.on_tansition_finished
	get_tree().change_scene_to_file("res://main.tscn")

func _ready() -> void:
	start_introcutscean()
	
