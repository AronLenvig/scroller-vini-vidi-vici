extends Control

func _ready() -> void:
	pass

func _on_button_pressed() -> void:
	Transition.transition()
	await Transition.on_tansition_finished
	get_tree().change_scene_to_file("res://Sceans/title_screen.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
