extends TextureRect

onready var Main = $".."
var MagazineInterface = preload("res://Scenes/MagazineInterface.tscn")


func _on_Magazine_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			var NewMag = MagazineInterface.instance()
			Main.add_child(NewMag)
