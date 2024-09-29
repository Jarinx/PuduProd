extends CharacterBody2D
@onready var animation_tree: AnimationTree = $AnimationTree

var speed= 200

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
	

	
