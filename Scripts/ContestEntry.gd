extends RichTextLabel
#provide data for contest entry
var contestData = "contestData"
#data is key to dict

func _ready():
	randomize()
	contestData = [get_parent().get_index(), randi() % (global.contestDetailDict.size())]
	#first number is dict key and index of Entry,
	#2nd number is dict key for contest entry type(reward and probability)

func _on_ContestEntry_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if global.enteredContests.has(contestData):
				global.enteredContests.remove(global.enteredContests.find(contestData))
				print(global.enteredContests)
				
			elif not global.enteredContests.has(contestData):
				global.enteredContests.append(contestData)
				print(global.enteredContests)
