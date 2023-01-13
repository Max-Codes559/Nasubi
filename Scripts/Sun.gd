extends Light2D

onready var Minigame = $"../UILayer/Minigame"

func _ready():
	global.connect("date_changed", self, "on_date_changed")
	Minigame.connect("minigameFinished", self, "on_minigame_finished")

func on_date_changed(date):
	energy = 0.5
	color = Color(1, 1, 1)
	shadow_buffer_size = 2048
	
func on_minigame_finished():
	energy = 0.4
	color = Color(0.498352, 0.767159, 0.898438)
	shadow_buffer_size = 100
