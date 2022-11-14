extends CenterContainer

signal item_clicked(item)

onready var itemTextureRect = $ItemTextureRect
onready var itemSlotTexture = $ItemSlotTexture
onready var mouse = get_node("../../../../Mouse")

enum inventoryResourceNum {
	mailInventory,
	closetInventory
}
export(inventoryResourceNum) var inventoryResource
var mailInventory = preload("res://Inventory.tres")
var closetInventory = preload("res://ClosetInventory.tres")
var resourceArray = [mailInventory, closetInventory]

var inventory

var emptySlot = preload("res://Inventory/UI Box faded20x20.png")
var filledSlot = preload("res://Inventory/UI Box20x20.png")

var previous_item = null

func _ready():
	inventory = resourceArray[inventoryResource]

func display_item(item):
	if item is Item:
		#Confirms that item is not null
		itemTextureRect.texture = item.texture
		#Sets connected texture rect to texture of Item resource
		itemSlotTexture.texture = filledSlot
	else:
		itemSlotTexture.texture = emptySlot
		itemTextureRect.texture = null
	
func click_pick_up():
	previous_item = mouse.held_item
	var item = inventory.remove_item(get_index())
	inventory.set_item(get_index(), previous_item)
	
	if item == null:
		inventory.set_item(get_index(), mouse.held_item)
		emit_signal("item_clicked", null)
		
	elif item != null:
		emit_signal("item_clicked", item)
		#when clicking on item slot in inventory that is full, sends signal to mouse
	
	
func _on_InventorySlotDisplay_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			click_pick_up()
			

