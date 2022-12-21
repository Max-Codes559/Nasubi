extends Node

signal date_change(date)

var enteredContests = []
var contestDetailDict= {1 : "contest 1 data"}
var minigameScore = 0

var monthLength = 1
var months = 4
#12 days after testing
var date = Vector3(0, 0, 0) setget set_date
#month, day, total days played

func set_date(addDate):
	date += addDate
	date.z += 1
	if date.y > monthLength - 1:
		date.y = 0
		date.x += 1
		if date.x > months - 1:
			date.x = 0
	emit_signal("date_change", date)
	print(date)
