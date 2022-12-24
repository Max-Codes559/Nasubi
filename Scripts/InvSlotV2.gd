extends Slot

onready var itemTextureRect = $ItemTextureRect
onready var itemSlotTexture = $ItemSlotTexture
onready var mouse = $"../../../../Mouse"

enum inventoryResourceNum {
	mailInventory,
	closetInventory
	clothingInventory
}
export(inventoryResourceNum) var inventoryResource

export(String, "Furniture", "Wallet", "Food", "Clothing") var acceptType1
export(String, "Furniture", "Wallet", "Food", "Clothing") var acceptType2
export(String, "Furniture", "Wallet", "Food", "Clothing") var acceptType3
export(String, "Furniture", "Wallet", "Food", "Clothing") var acceptType4
var acceptedTypes

func display_item(item):
	#called directly from parent
	if item is Item:
		#Confirms that item is not null
		itemTextureRect.texture = item.texture
		#Sets connected texture rect to texture of Item resource
		itemSlotTexture.texture = filledSlot
	else:
		itemSlotTexture.texture = emptySlot
		itemTextureRect.texture = null

func _ready():
	acceptedTypes = [acceptType1, acceptType2, acceptType3, acceptType4]
	inventory = resourceArray[inventoryResource]

func _on_InventorySlotDisplay_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if mouse.held_item == null or acceptedTypes.has(mouse.held_item.itemType):
				click_pick_up(mouse)

