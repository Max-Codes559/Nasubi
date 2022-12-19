extends TextureRect

onready var Main = $".."
onready var MagazineInterface = $MagInterface

func _input(event):
	if Input.is_action_just_pressed("esc"):
		if MagazineInterface.visible:
			MagazineInterface.visible = false

func _on_MagazineOpen_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if MagazineInterface.visible:
				MagazineInterface.visible = false
		
			elif not MagazineInterface.visible:
				MagazineInterface.visible = true
