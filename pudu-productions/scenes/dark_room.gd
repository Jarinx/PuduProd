extends "res://scenes/rooms.gd"


func _ready() -> void:
	tipo_de_area="dark"


func _on_area_2d_area_entered(area: Area2D) -> void:
	print(area)
	print(area.owner)
	if area.owner.has_method("Player"):
		area.owner.auto_iluminate(self)


func _on_area_2d_2_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
