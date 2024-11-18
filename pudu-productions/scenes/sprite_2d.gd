extends CharacterBody2D
@onready var point_light_2d: PointLight2D = $PointLight2D


# Called when the node enters the scene tree for the first time.
func iluminate():
	print("me ilumine")
	point_light_2d.enabled = true
	
