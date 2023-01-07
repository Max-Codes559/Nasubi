extends Node

signal date_changed(date)
signal hunger_changed(hunger)

var enteredContests = []
var completedContests = []
var contestDetailDict = {
	0 : ["res://Items/Item Resources/Furniture/chairs/GreenChair.tres", 0.50],
	1 : ["res://Items/Item Resources/Furniture/tables/SmallWhiteTable.tres", 0.50]
	}
# key(for choosing which entries to list) : resource of item, prob of winning it
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
	while totalScore >= 100 and enteredContests.size() != 0:
		var addedEntry = enteredContests.pop_front()
		completedContests.append(addedEntry) 
		totalScore -= 100
		print(completedContests)

func roll_entries():
	for entries in completedContests:
		var contestEntry = contestDetailDict[entries[1]]
		var contestItem = contestEntry[0]
		var contestProbability = contestEntry[1]
		randomize()
		var roll = randi() % 100 +1
		
		if roll <= contestProbability * 100:
			print("you won ", load(contestItem).name)
	completedContests.clear()

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
