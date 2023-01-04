extends Node

signal date_changed(date)
signal hunger_changed(hunger)

var enteredContests = []
var contestDetailDict= {1 : "contest 1 data"}
var minigameScore = 0

var monthLength = 2
var months = 4
#12 days after testing
var date = Vector3(0, 0, 0) setget set_date
#month, day, total days played
var hunger = 100 

func set_date(addDate):
	date += addDate
	date.z += 1
	if date.y > monthLength - 1:
		date.y = 0
		date.x += 1
		if date.x > months - 1:
			date.x = 0
	emit_signal("date_changed", date)
	print(date)
	
	randomize()
	var prevHunger = hunger
	hunger -= (10 + randi() % 9) * addDate.y
	print(prevHunger - hunger)
	emit_signal("hunger_changed", hunger)
