extends TextureRect

signal item_unplaced(item, slotNumber)
signal item_placed
signal furniture_type(item)

onready var Mouse = get_node("../../../Mouse")
onready var Grid = get_parent()
var FurnitureScene = preload("res://Scenes/FurnitureItem.tscn")
var Selector = preload("res://Scenes/Selector.tscn")

var placedFurniture = null
var adjacentSlot = null
var selectUI

func _on_FloorSlot_gui_input(event):
	#Attempts to place held item on floor
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if Mouse.held_item != null:
				if Mouse.held_item.itemType == "Furniture" and placedFurniture == null:
					
					if Mouse.held_item.size == "1x2":
						adjacentSlot = Grid.get_child(get_index() + 1)
						
						if adjacentSlot.placedFurniture == null and (get_index() + 1) % get_parent().columns != 0:
							placedFurniture = Mouse.held_item
							var Furniture = FurnitureScene.instance()
							add_child(Furniture)
							
							emit_signal("item_placed")
							emit_signal("furniture_type", placedFurniture)
							Furniture.connect("unplace_item", self, "clear_slot")
							
							adjacentSlot.placedFurniture = 1
					elif Mouse.held_item.size == "1x1" or "tall":
						placedFurniture = Mouse.held_item
						var Furniture = FurnitureScene.instance()
						add_child(Furniture)
						
						emit_signal("item_placed")
						emit_signal("furniture_type", placedFurniture)
						Furniture.connect("unplace_item", self, "clear_slot")
						
func clear_slot(item, slotNumber):
	#clears slot if furniture is picked up
	if slotNumber == get_index():
		if placedFurniture.size == "1x2":
			adjacentSlot.placedFurniture = null
		placedFurniture = null
		emit_signal("item_unplaced", item, slotNumber)

func _on_FloorSlot_mouse_entered():
	selectUI = Selector.instance()
	add_child(selectUI)

func _on_FloorSlot_mouse_exited():
	selectUI.queue_free()
