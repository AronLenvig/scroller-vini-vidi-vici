extends Control

func _ready() -> void:
	var sound = $AudioStreamPlayer
	sound.play()

func _on_button_pressed() -> void:
	var sound = $AudioStreamPlayer
	sound.stop()
	Transition.transition()
	await Transition.on_tansition_finished
	get_tree().change_scene_to_file("res://Sceans/intro_cutscenes.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
