extends "res://scenes/rooms.gd"

func _ready():
	tipo_de_area = "bright"





func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.owner.has_method("Player"):
		area.owner.auto_iluminate(self)
