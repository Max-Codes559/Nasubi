extends CanvasModulate

onready var Minigame = $"../UILayer/Minigame"

var seasonal_colour = [
	Color(0.9, 0.745098, 0.92549).lightened(0.20), #e4beec
	Color(0.894118, 0.882353, 0.592157).lightened(0.4),
	Color(0.85, 0.647059, 0.52549).lightened(0.12),
	Color(0.7, 0.886275, 0.960784).darkened(0.20)
]

func _ready():
	global.connect("date_changed", self, "on_date_changed")
	Minigame.connect("minigameFinished", self, "on_minigame_finished")
	on_date_changed(global.date)

func on_date_changed(date):
	color = seasonal_colour[date.x]
	global.night = false

func on_minigame_finished():
	color = color.darkened(0.90)
	global.night = true
