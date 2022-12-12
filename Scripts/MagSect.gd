extends Control

var GiveAway = preload("res://Scenes/ContestEntry.tscn")


func _ready():
	var NewLabel = GiveAway.instance()
	add_child(NewLabel)

