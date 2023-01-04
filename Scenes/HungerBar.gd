extends ProgressBar


func _ready():
	value = global.hunger
	global.connect("hunger_changed", self, "on_hunger_changed")
	
func on_hunger_changed(hunger):
	value = hunger
