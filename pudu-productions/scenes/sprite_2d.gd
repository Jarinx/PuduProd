
extends "res://scenes/item.gd"
@onready var point_light_2d: PointLight2D = $PointLight2D
var player_in_area= false
var iluminado = false
var exit = false

func _ready():
	item_texture = preload("res://assets/Key Items 16x16/00.png")
# Called when the node enters the scene tree for the first time.
func iluminate():
	print("me ilumine")
	point_light_2d.enabled = true
	iluminado = true
	
func _process(delta: float) -> void:
	if player_in_area:
		if Input.is_action_just_pressed("grab") and iluminado==true:
			var cloned_item = self.duplicate()
			cloned_item.item_texture = self.item_texture
			Global.add_item_to_inventory(cloned_item)
			var inventory = self.get_parent().get_parent().get_node("Inventory")
			if inventory:
				
				inventory.update_ui()
			else:
				print("No hay inventario")
			self.queue_free()





func _on_area_2d_body_exited(body) -> void:
	if body.has_method("Player"):
		player_in_area=false


func _on_area_2d_body_entered(body) -> void:
	if body.has_method("Player"):
		player_in_area=true
