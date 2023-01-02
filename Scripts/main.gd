extends Node2D

onready var SleepMenu = $UILayer/SleepMenu

func _input(_event):
	if Input.is_action_just_pressed("space"):
		if SleepMenu.visible:
			SleepMenu.visible = false
		
		elif not SleepMenu.visible:
			SleepMenu.visible = true
