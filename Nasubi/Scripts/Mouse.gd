extends Sprite

onready var InventorySlots = get_node("../Mail/MailInv/InventoryDisplay").get_children()
onready var FloorSlots = get_node("../Floor/GridContainer").get_children()

var held_item = null

func update_image(item):
	held_item = item
	if item != null:
		texture = item.texture
	if item == null:
		texture = null
	print("mouse sprite updated")
	
func remove_item():
	held_item = null
	texture = null

func _ready():
	for slots in InventorySlots:
		slots.connect("item_clicked", self, "update_image")
	for slots in FloorSlots:
		slots.connect("item_placed", self, "remove_item")
	
		
func _process(_delta):
	offset = get_local_mouse_position()
	#position = get_global_mouse_position()


