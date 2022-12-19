extends Control
class_name Slot

signal item_clicked(item)

const emptySlot = preload("res://Inventory/UI Box faded20x20.png")
const filledSlot = preload("res://Inventory/UI Box20x20.png")

var previous_item = null

const mailInventory = preload("res://Resources/Inventory.tres")
const closetInventory = preload("res://Resources/ClosetInventory.tres")
const clothingInventory = preload("res://Resources/Clothing.tres")
const resourceArray = [mailInventory, closetInventory,clothingInventory]

var inventory

func click_pick_up(mouse):
	previous_item = mouse.held_item
	var item = inventory.remove_item(get_index())
	inventory.set_item(get_index(), previous_item)
	
	if item == null:
		inventory.set_item(get_index(), mouse.held_item)
		emit_signal("item_clicked", null)
		
	elif item != null:
		emit_signal("item_clicked", item)
		#when clicking on item slot in inventory that is full, sends signal to mouse
