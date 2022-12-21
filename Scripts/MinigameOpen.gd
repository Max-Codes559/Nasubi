extends TextureRect

onready var Main = $"../.."
var MiniGameScene = preload("res://Scenes/Minigame.tscn")

func _on_MinigameOpen_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			
			if not Main.has_node("Minigame"):
				var newMinigame = MiniGameScene.instance()
				Main.add_child(newMinigame)
				
			elif Main.has_node("Minigame"):
				Main.get_node("Minigame").queue_free()
