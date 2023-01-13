extends Label


func _ready():
	text = "$" + str(global.moneyGoal)
	global.connect("money_changed", self, "on_money_changed")

func on_money_changed(_money):
	print("money changed")
	text = "$" + str(global.moneyGoal)
