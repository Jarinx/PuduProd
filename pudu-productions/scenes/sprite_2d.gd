extends CharacterBody2D
@onready var point_light_2d: PointLight2D = $PointLight2D
var player_in_area= false

# Called when the node enters the scene tree for the first time.
func iluminate():
	print("me ilumine")
	point_light_2d.enabled = true


func _process(delta: float) -> void:
	if player_in_area:
		if Input.is_action_just_pressed("grab"):
			self.queue_free()





func _on_area_2d_body_exited(body) -> void:
	if body.has_method("Player"):
		player_in_area=false


func _on_area_2d_body_entered(body) -> void:
	if body.has_method("Player"):
		player_in_area=true
