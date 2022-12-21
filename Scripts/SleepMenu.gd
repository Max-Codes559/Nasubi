extends Node2D

func _on_NoButton_button_down():
	visible = false

func _on_YesButton_button_down():
	global.date = Vector3(0, 1, 0)
	visible = false
