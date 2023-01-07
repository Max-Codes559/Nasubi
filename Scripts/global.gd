extends Node

signal date_changed(date)
signal hunger_changed(hunger)

var enteredContests = []
var completedContests = []
var contestDetailDict= {"res://Items/Item Resources/Furniture/chairs/GreenChair.tres" : 0.50}
#resource of item, prob of winning it
var minigameScore = 0
var totalScore = 0
var roomMultiplier = 1

var monthLength = 2
var months = 4
#12 days after testing
var date = Vector3(0, 0, 0) setget set_date
#month, day, total days played
var hunger = 100 setget set_hunger
var night = false

func add_contests_to_array():
	print("entered contests ", enteredContests.size())
	var n = 0
	while totalScore >= 100 and n < enteredContests.size():
		completedContests.append(enteredContests[n]) 
		totalScore -= 100
		n += 1
		print(completedContests)

func roll_entries():
	pass

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
	set_hunger(-(10 + randi() % 9) * addDate.y)
	
	totalScore += minigameScore * roomMultiplier
	minigameScore = 0
	add_contests_to_array()
	roll_entries()
	print("totalscore = ", totalScore)

func set_hunger(addHunger):
	print("addHunger ", addHunger)
	hunger += addHunger
	if hunger > 100:
		hunger = 100
	emit_signal("hunger_changed", hunger)
