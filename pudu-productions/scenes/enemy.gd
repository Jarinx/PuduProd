extends CharacterBody2D
@onready var follow_time: Timer = $FollowTime
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var sprite_2d: Sprite2D = $Sprite2D

var player_chase = false
var speed = 70
var player = null

func _ready() -> void:
	animation_tree.active = true
	follow_time.wait_time=2
	follow_time.connect("timeout", Callable(self, "_on_follow_time_timeout"))


func _physics_process(_delta: float) -> void:
	sprite_2d.modulate = Color8(255, 255, 255, 150)
	if player_chase and player:
		sprite_2d.modulate = Color8(255, 255, 255, 255)
		position += (player.position-position)/speed
		move_and_collide(Vector2.ZERO)
	
func detection(body):
	#print("wow")
	player = body
	player_chase = true
	follow_time.start()
	
func _on_follow_time_timeout() -> void:
	player_chase = false  # Deja de seguir al jugador cuando el temporizador se acabe
func enemy():
	pass
	
	
