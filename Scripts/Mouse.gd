extends Sprite

onready var InventorySlots = get_node("../Mail/MailInv/InventoryDisplay").get_children()
onready var ClosetSlots = get_node("../Closet/ClosetInv/ClosetInvGrid").get_children()
onready var ClothingSlots = get_node("../Floor/Player/E-menu").get_children()
onready var FloorSlots = get_node("../Floor/FloorGrid").get_children()

var held_item = null

func update_item(item):
	held_item = item
	if item != null:
		texture = item.texture
	if item == null:
		texture = null
		
func update_item_from_floor(item, _slotNumber):
	held_item = item
	if item != null:
		texture = item.texture
	if item == null:
		texture = null
		
func remove_item():
	held_item = null
	texture = null

func _ready():
	for slots in InventorySlots:
		slots.connect("item_clicked", self, "update_item")
	for slots in ClosetSlots:
		slots.connect("item_clicked", self, "update_item")
	for slots in ClothingSlots:
		slots.connect("item_clicked", self, "update_item")
		
	for slots in FloorSlots:
		slots.connect("item_placed", self, "remove_item")
		slots.connect("item_unplaced", self, "update_item_from_floor")
	
		
func _process(_delta):
	offset = get_local_mouse_position()

