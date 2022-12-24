extends Sprite

signal furniture_selected
signal furniture_placed

onready var MailSlots = get_node("../Mail/MailInv/InventoryDisplay").get_children()
onready var ClosetSlots = get_node("../Closet/ClosetInv/ClosetInvGrid").get_children()
onready var ClothingSlots = get_node("../Menus/PlayerMenus/E-menu").get_children()
onready var FloorSlots = get_node("../../Floor/FloorGrid").get_children()

var held_item = null

func update_item(item):
	held_item = item
	
	if item != null:
		texture = item.texture
		if held_item.itemType == "Furniture":
			emit_signal("furniture_selected")

	elif item == null:
		texture = null
		emit_signal("furniture_placed")

func remove_item():
	held_item = null
	texture = null

func connect_to_slots():
	for slots in MailSlots:
		slots.connect("item_clicked", self, "update_item")
	for slots in ClosetSlots:
		slots.connect("item_clicked", self, "update_item")
	for slots in ClothingSlots:
		slots.connect("item_clicked", self, "update_item")
		
	for slots in FloorSlots:
		slots.connect("item_placed", self, "remove_item")
		slots.connect("item_unplaced", self, "update_item")

func _ready():
	connect_to_slots()
	
func _process(_delta):
	offset = get_local_mouse_position()

