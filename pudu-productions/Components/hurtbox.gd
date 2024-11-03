class_name Hurtbox
extends Area2D
var player = null
func _ready() -> void:
	area_entered.connect(_on_area_entered)
	
func _on_area_entered(area:Area2D)->void:
	print(area)
	print(area.owner)
	print(area.get_parent())
	var hitbox = area as Hitbox
	
	if hitbox:
		if owner.has_method("detection"):
			owner.detection(area)
	
