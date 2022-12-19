extends Node2D

onready var Score = $LineEdit

func _input(_event):
	if Input.is_action_just_pressed("enter") and int(Score.text) != 0:
		global.minigameScore = int(Score.text)
		print(global.minigameScore)
		queue_free()
		
