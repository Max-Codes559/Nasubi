extends StaticBody2D

onready var collisionBody = $CollisionShape2D
onready var sprite = $Sprite

var size

func get_resource_data(item):
	sprite.texture = item.texture
	
	if item.size == "1x1":
		sprite.position = get_parent().rect_size / 2
		collisionBody.position = get_parent().rect_size / 2
		
	elif item.size == "2x1":
		collisionBody.scale *= Vector2(3.6,2)
		collisionBody.position.x = get_parent().rect_size.x
		collisionBody.position.y = get_parent().rect_size.y / 2
		sprite.position.x = get_parent().rect_size.x
		sprite.position.y = get_parent().rect_size.y / 2
		
	elif item.size == "2x2":
		collisionBody.scale *= Vector2(2,2)
		
	elif item.size == "rug":
		collisionBody.set_deferred("disabled", true)

func _ready():
	var slot = get_parent()
	slot.connect("furniture_type", self, "get_resource_data")
