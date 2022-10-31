extends Sprite

#var mailInv = preload("res://Scenes/Inventory.tscn")
onready var mailInv = $MailInv

func _on_Button_pressed():
	#if not has_node("BackTextureRect"):
		#var inv = mailInv.instance()
		#add_child(inv)
		#print("inv added")
	#elif has_node("BackTextureRect"):
		#$BackTextureRect.queue_free()
		
	if mailInv.visible == false:
		mailInv.visible = true
	elif mailInv.visible == true:
		mailInv.visible = false
