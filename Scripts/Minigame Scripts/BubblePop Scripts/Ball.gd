extends RigidBody2D

onready var FirePoint = $"../../FirePoint"
var Main 

export var speed = 450
export var gridSize = 50

enum {
	PREVIEW
	PROJECTILE,
	PUZZLE
}
var state = PREVIEW 

var puzzlePositions

func check_open_positions():
	if puzzlePositions.has(position):
		print("space occupied")

func _ready():
	FirePoint.connect("ball_fired", self, "on_ball_fired")
	Main = FirePoint.get_parent()
	puzzlePositions = Main.puzzlePositions

func on_ball_fired(direction):
	apply_central_impulse(direction * speed)
	state = PROJECTILE
	if FirePoint.is_connected("ball_fired", self, "on_ball_fired"):
		FirePoint.disconnect("ball_fired", self, "on_ball_fired")

func enter_puzzle(collisionDirect: Vector2 = Vector2(0, -1)):
	state = PUZZLE
	set_deferred("mode", MODE_STATIC)
	sleeping = true
	position.x = stepify(float(position.x), gridSize)
	position.y = stepify(float(position.y), gridSize)
	rotation = 0
	print(position)
	check_open_positions()
	puzzlePositions[position] = self.name
	print(puzzlePositions.keys())
	
func _process(delta):
	match state:
		PREVIEW:
			pass
		
		PROJECTILE:
			pass
			
		PUZZLE:
			pass


func _on_Ball_body_entered(body):
	if state == PROJECTILE:
		if body.name == "BackWall":
			enter_puzzle()
		if body.name == "Ball" or str(body.name.replace("@", "").replace(str(int(body.name)), "")) == "Ball":
			#detects original and instances
			if body.state == PUZZLE:
				var collisionDirect = body.position.normalized()
				enter_puzzle(collisionDirect)
				print("Collision angle = ", collisionDirect)
				
