extends StaticBody2D

signal unplace_item(item, slotNumber)

var mouse 
onready var collisionBody = $CollisionShape2D
onready var sprite = $Sprite
onready var button = $Button
onready var ysort = get_parent().get_parent().get_parent()
var slot
var dataRecieved = false

var slotNumber
var itemData

func get_resource_data(item):
	#Sets up furniture scene according to item resource
	if dataRecieved == false:
		itemData = item
		sprite.texture = item.texture
	
		if item.size == "1x1":
			collisionBody.position.x = slot.rect_size.x / 2
			collisionBody.position.y = slot.rect_size.y / 1.5
			sprite.position = slot.rect_size / 2
		
		elif item.size == "1x2":
			collisionBody.scale *= Vector2(3.6,2)
			collisionBody.position.x = slot.rect_size.x
			collisionBody.position.y = slot.rect_size.y / 1.5
			sprite.position.x = slot.rect_size.x + 12
			sprite.position.y = slot.rect_size.y / 2
			button.rect_size.x *= 2
		
		elif item.size == "2x2":
			collisionBody.scale *= Vector2(2,2)
			button.rect_size *= 2
			
		elif item.size == "tall":
			collisionBody.position = slot.rect_size / 2
			sprite.position.x = slot.rect_size.x / 2
			sprite.position.y = slot.rect_size.y / 16
		
		elif item.size == "rug":
			collisionBody.set_deferred("disabled", true)
		
		dataRecieved = true

func transfer_node():
	#transfers node to Ysort Floor, gets ref to mouse, records slot number
	var slotPosition = global_position
	slotNumber = get_parent().get_index()
	get_parent().remove_child(self)
	ysort.add_child(self)
	global_position = slotPosition
	mouse = get_node("../../Mouse")

func _ready():
	if dataRecieved == false:
		slot = get_parent()
		slot.connect("furniture_type", self, "get_resource_data")
		transfer_node()

func _on_Button_pressed():
	#puts item back on mouse
	if dataRecieved == true and mouse.held_item == null and get_parent().get_node("FloorGrid").visible:
		emit_signal("unplace_item", itemData, slotNumber)
		queue_free()
