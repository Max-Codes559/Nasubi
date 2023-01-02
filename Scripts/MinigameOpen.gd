extends TextureRect

onready var UILayer = $".."
var MiniGameScene = preload("res://Scenes/Minigame.tscn")

func _on_MinigameOpen_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			
			if not UILayer.has_node("Minigame"):
				var newMinigame = MiniGameScene.instance()
				UILayer.add_child(newMinigame)
				
			elif UILayer.has_node("Minigame"):
				UILayer.get_node("Minigame").queue_free()
