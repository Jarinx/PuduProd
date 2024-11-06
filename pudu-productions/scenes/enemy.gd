extends CharacterBody2D
@onready var follow_time: Timer = $FollowTime


var player_chase = false
var speed = 70
var player = null
func _ready() -> void:
	follow_time.wait_time=2
	follow_time.connect("timeout", Callable(self, "_on_follow_time_timeout"))


func _physics_process(_delta: float) -> void:
		if player_chase and player:
			position += (player.position-position)/speed
			move_and_collide(Vector2.ZERO)
	
func detection(body):
	print("wow")
	player = body
	player_chase = true
	follow_time.start()
func _on_follow_time_timeout() -> void:
	player_chase = false  # Deja de seguir al jugador cuando el temporizador se acabe
	
	
