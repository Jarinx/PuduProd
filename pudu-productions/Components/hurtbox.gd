class_name Hurtbox
extends Area2D
var player = null


func _ready() -> void:
	area_entered.connect(_on_area_entered)
	
func _on_area_entered(area:Area2D)->void:
	print(area)
	print(area.owner)
	print(area.get_parent())
	print(area.get_parent().get_node("Player"))
	
	var hitbox = area as Hitbox
	
	if hitbox:
		if owner.has_method("detection"):
			owner.detection(area.get_parent().get_node("Player"))
		if owner.has_method("take_damage"):
			owner.take_damage()
	
