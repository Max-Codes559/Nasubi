extends Control
class_name Slot

signal item_clicked(item)

const emptySlot = preload("res://Inventory/UI Box faded20x20.png")
const filledSlot = preload("res://Inventory/UI Box20x20.png")

var previous_item = null

const mailInventory = preload("res://Inventory.tres")
const closetInventory = preload("res://ClosetInventory.tres")
const clothingInventory = preload("res://Clothing.tres")
const resourceArray = [mailInventory, closetInventory,clothingInventory]

enum inventoryResourceNum {
	mailInventory,
	closetInventory
	clothingInventory
}
export(inventoryResourceNum) var inventoryResource

export(String, "Furniture", "Wallet", "Food", "Clothing") var rejectType1
export(String, "Furniture", "Wallet", "Food", "Clothing") var rejectType2
export(String, "Furniture", "Wallet", "Food", "Clothing") var rejectType3
var rejectedTypes = [rejectType1, rejectType2, rejectType3]

var inventory

func display_item(item, itemTextureRect, itemSlotTexture):
	if item is Item:
		#Confirms that item is not null
		itemTextureRect.texture = item.texture
		#Sets connected texture rect to texture of Item resource
		itemSlotTexture.texture = filledSlot
	else:
		itemSlotTexture.texture = emptySlot
		itemTextureRect.texture = null
	
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
