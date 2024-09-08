extends Control

@onready var tutorial = $ColorRect


func _on_introduction_2_pressed() -> void:
	tutorial.visible = true


func _on_Leave_tut_pressed() -> void:
	tutorial.visible = false


func _on_start_mobile_pressed() -> void:
	pass # Replace with function body.
