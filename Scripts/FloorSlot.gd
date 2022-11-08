extends TextureRect

signal item_placed
signal furniture_type(item)

onready var Mouse = get_node("../../../Mouse")
onready var Grid = get_parent()
var FurnitureScene = preload("res://Scenes/FurnitureItem.tscn")

var placedFurniture = null
var adjacentSlot = null

func _on_FloorSlot_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Mouse.held_item != null:
				if Mouse.held_item.itemType == "Furniture" and placedFurniture == null:
					
					if Mouse.held_item.size == "2x1":
						adjacentSlot = Grid.get_child(get_index() + 1)
						if adjacentSlot.placedFurniture == null and (get_index() + 1) % 7 != 0:
							placedFurniture = Mouse.held_item
							var Furniture = FurnitureScene.instance()
							add_child(Furniture)
							emit_signal("item_placed")
							emit_signal("furniture_type", placedFurniture)
							adjacentSlot.placedFurniture = 1
					elif Mouse.held_item.size == "1x1":
						placedFurniture = Mouse.held_item
						var Furniture = FurnitureScene.instance()
						add_child(Furniture)
						emit_signal("item_placed")
						emit_signal("furniture_type", placedFurniture)

func _on_FloorSlot_mouse_entered():
	pass # Replace with function body.


func _on_FloorSlot_mouse_exited():
	pass # Replace with function body.
