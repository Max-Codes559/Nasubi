extends StaticBody2D

onready var collisionBody = $CollisionShape2D
onready var sprite = $Sprite
onready var ysort = get_parent().get_parent().get_parent()
var slot
var dataRecieved = false

func get_resource_data(item):
	if dataRecieved == false:
		sprite.texture = item.texture
	
		if item.size == "1x1":
			sprite.position = slot.rect_size / 2
			collisionBody.position = slot.rect_size / 2
		
		elif item.size == "2x1":
			collisionBody.scale *= Vector2(3.6,2)
			collisionBody.position.x = slot.rect_size.x
			collisionBody.position.y = slot.rect_size.y / 2
			sprite.position.x = slot.rect_size.x
			sprite.position.y = slot.rect_size.y / 2
		
		elif item.size == "2x2":
			collisionBody.scale *= Vector2(2,2)
		
		elif item.size == "rug":
			collisionBody.set_deferred("disabled", true)
		
		dataRecieved = true

func transfer_node():
	var slotPosition = global_position
	var slotNumber = get_parent().get_index()
	get_parent().remove_child(self)
	ysort.add_child(self)
	global_position = slotPosition

func _ready():
	if dataRecieved == false:
		slot = get_parent()
		slot.connect("furniture_type", self, "get_resource_data")
		transfer_node()
