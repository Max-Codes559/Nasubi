extends GridContainer

onready var MailInv = get_node("../../Mail/MailInv")
onready var ClosetInv = get_node("../../Closet/ClosetInv")
onready var Mouse = get_node("../../Mouse")

func close_grid():
	if visible == true and MailInv.visible == false and ClosetInv.visible == false:
		visible = false

func _ready():
	var  FloorSlots = get_children()
	for slot in FloorSlots:
		slot.connect("item_placed", self, "close_grid")

func _on_Button_pressed():
	if visible == true and Mouse.held_item == null and ClosetInv.visible == false:
		visible = false
		
	elif visible == false:
		visible = true

func _on_Button2_pressed():
	if visible == true and Mouse.held_item == null and MailInv.visible == false:
		visible = false
		
	elif visible == false:
		visible = true
