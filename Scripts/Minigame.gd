extends TextureRect

signal minigameFinished

var minigames = [
	preload("res://Scenes/Mini Games/TestMinigame.tscn")
]

func finish_minigame():
	emit_signal("minigameFinished")
	get_child(0).queue_free()
	print("minigame finished")

func spawn_minigame():
	randomize()
	var newMinigame = minigames[randi() % minigames.size()].instance()
	add_child(newMinigame)
	
func _on_Minigame_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			
			if get_child_count() < 1 and global.night == false:
				spawn_minigame()
				print("minigame spawned")
