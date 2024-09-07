extends Control


func _on_button_pressed() -> void:
	Transition.transition()
	await Transition.on_tansition_finished
	get_tree().change_scene_to_file("res://intro_cutscenes.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
