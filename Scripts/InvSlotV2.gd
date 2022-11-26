extends Slot

onready var itemTextureRect = $ItemTextureRect
onready var itemSlotTexture = $ItemSlotTexture
onready var mouse = get_node("../../../../Mouse")

func _ready():
	inventory = resourceArray[inventoryResource]

func _on_InventorySlotDisplay_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			click_pick_up(mouse)
