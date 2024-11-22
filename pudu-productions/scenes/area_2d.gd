
extends Area2D
var player = null


func _ready() -> void:
	area_entered.connect(_on_area_entered)
	
func _on_area_entered(area:Area2D)->void:
	
	var hitbox = area as Hitbox
	
	if hitbox:
		if Input.is_action_just_pressed("grab"):
			owner.queue_free()
