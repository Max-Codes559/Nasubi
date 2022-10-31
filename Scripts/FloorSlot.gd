extends TextureRect

signal item_placed
onready var Mouse = get_node("../../../Mouse")
var FurnitureScene = preload("res://Scenes/FurnitureItem.tscn")

var placedFurniture = null

func _on_FloorSlot_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Mouse.held_item != null:
				if Mouse.held_item.itemType == "Furniture" and placedFurniture == null:
					placedFurniture = Mouse.held_item
					var Furniture = FurnitureScene.instance()
					add_child(Furniture)
					emit_signal("item_placed")
					
					var sprite = get_node("FurnitureItem/Sprite")
					sprite.texture = placedFurniture.texture
					print("Furniture added")

