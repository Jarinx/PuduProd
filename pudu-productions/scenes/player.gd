extends CharacterBody2D
@onready var animation_tree: AnimationTree = $AnimationTree
const onda = preload('res://scenes/onda.tscn')
var speed= 200
@onready var onda_cooldown: Timer = $OndaCooldown
@onready var onda_time: Timer = $OndaTime

func _physics_process(delta: float) -> void:
	var input_vector  = Vector2.ZERO
	input_vector.x= Input.get_axis("left","right")
	input_vector.y = Input.get_axis("up","down")
	input_vector= input_vector.normalized()
	print(input_vector)
	
	if input_vector:
		velocity= input_vector * speed
		$AnimationTree.set("parameters/Idle/blend_position",velocity)
		$AnimationTree.set("parameters/Walk/blend_position",velocity)
		$AnimationTree.get("parameters/playback").travel("Walk")
		move_and_slide()
	
		
		
	else:
		velocity= input_vector
		$AnimationTree.get("parameters/playback").travel("Idle")
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("onda"):
		print("lanzar onda")
		lanzar()
	$Node2D.look_at(get_global_mouse_position())

func lanzar ():
	
	if onda_cooldown.time_left:
		return
	var wave = onda.instantiate()
	get_parent().add_child(wave)
	wave.position = $Node2D/Marker2D.global_position
	onda_cooldown.start()
	onda_time.start()
	
	
	
	
	
	

	
