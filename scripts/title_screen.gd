extends Control

@onready var tut = $ColorRect

func _on_button_pressed() -> void:
	Global.is_mobile = false
	Transition.transition()
	await Transition.on_tansition_finished
	get_tree().change_scene_to_file("res://Sceans/intro_cutscenes.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_Leave_tut_pressed() -> void:
	tut.visible = false


func _on_to_tut_pressed() -> void:
	tut.visible = true


func _on_start_button_mobile() -> void:
	Global.is_mobile = true
	Transition.transition()
	await Transition.on_tansition_finished
	get_tree().change_scene_to_file("res://Sceans/intro_cutscenes.tscn")
