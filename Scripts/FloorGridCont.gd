extends GridContainer

onready var mouse = $"../../UILayer/Mouse"

func close_grid():
	if modulate == Color.white:
		set_modulate(Color.transparent)
		
func open_grid():
	if modulate == Color.transparent:
		set_modulate(Color.white)

func _ready():
	var  FloorSlots = get_children()
	for slot in FloorSlots:
		slot.connect("item_placed", self, "close_grid")

	mouse.connect("furniture_selected", self, "open_grid")
	mouse.connect("furniture_placed", self, "close_grid")
