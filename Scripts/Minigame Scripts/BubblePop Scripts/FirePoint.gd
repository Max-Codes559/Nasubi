extends Node2D

signal ball_fired(direction)

onready var FireTimer = $FireTimer

var Ball = preload("res://Scenes/Mini Games/BubblePop/Ball.tscn")
var canFire = true

func _input(event):
	if Input.is_action_pressed("left_mouse") and canFire == true:
		var ballPoint = event.position
		var FiredBall = Ball.instance()
		add_child(FiredBall)
		emit_signal("ball_fired", (ballPoint - position).normalized())
		canFire = false
		FireTimer.start()
		
func _on_Timer_timeout():
	canFire = true
