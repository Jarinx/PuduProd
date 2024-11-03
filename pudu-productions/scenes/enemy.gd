extends CharacterBody2D
@onready var follow_time: Timer = $FollowTime


var player_chase = false
var speed = 25
var player = null

func _physics_process(_delta: float) -> void:
	if player_chase:
		position += (player.position-position)/speed
	move_and_collide(Vector2(0,0))
func detection(body):
	print("wow")
	player = body
	player_chase = true
	
	
