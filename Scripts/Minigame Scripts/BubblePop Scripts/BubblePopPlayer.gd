extends Sprite

onready var clothes = load("res://Resources/Clothing.tres")
onready var hat = $Hat
onready var shirt = $Shirt
onready var pants = $Pants
onready var shoes = $Shoes

func _ready():
	hat.texture = clothes.items[0].texture
	shirt.texture = clothes.items[1].texture
	pants.texture = clothes.items[2].texture
	shoes.texture = clothes.items[3].texture
