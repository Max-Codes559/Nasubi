extends Node

var enteredContests = []
var contestDetailDict= {1 : "contest 1 data"}
var minigameScore = 0

var monthLength = 4
#28 days after testing
var date = Vector2(1, 1) setget set_date
#month, day

func set_date(addDate):
	date += addDate
	if date.y > monthLength:
		date.y = 1
		date.x += 1
		if date.x > 4:
			date.x = 1
	print(date)
