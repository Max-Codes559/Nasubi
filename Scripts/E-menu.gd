extends Control

var clothingInv = preload("res://Clothing.tres")

func _ready():
	clothingInv.connect("items_changed", self, "on_items_changed")
	#connects to signal in Inventory resource
	update_full_inventory_display()
	
func update_full_inventory_display():
	for item_index in clothingInv.items.size():
		update_inventory_slot_display(item_index)
		#For updating every slot in inventory
	
func update_inventory_slot_display(item_index):
	var inventorySlotDisplay = get_child(item_index)
	var item = clothingInv.items[item_index]
	inventorySlotDisplay.display_item(item)
	#updates a specific item slot display
	
func on_items_changed(indexes):
	for item_index in indexes:
		update_inventory_slot_display(item_index)
