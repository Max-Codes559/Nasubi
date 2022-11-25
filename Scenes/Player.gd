extends KinematicBody2D

onready var Emenu = get_node("E-menu")

onready var hat = $Hat
onready var shirt = $Shirt
onready var pants = $Pants
onready var shoes = $Shoes

export (int) var speed = 200

var velocity = Vector2.ZERO

func ready_clothes(_clothingItem = null):
	hat.texture = $"E-menu/HatSlot".itemTextureRect.texture
	shirt.texture = $"E-menu/ShirtSlot".itemTextureRect.texture
	pants.texture = $"E-menu/PantsSlot".itemTextureRect.texture
	shoes.texture = $"E-menu/ShoesSlot".itemTextureRect.texture
	print("clothes readied")

func connect_emenu():
	for slots in Emenu.get_children():
		slots.connect("item_clicked", self, "ready_clothes")

func basic_movement():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func get_input():
	basic_movement()
	
func _ready():
	ready_clothes()
	connect_emenu()
	
func _physics_process(delta):
	get_input()
	move_and_slide(velocity, Vector2.ZERO)

func _input(event):
	if Input.is_action_just_pressed("E-menu"):
		if Emenu.visible == true:
			Emenu.visible = false
		
		elif Emenu.visible == false:
			Emenu.visible = true
