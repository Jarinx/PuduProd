extends TileMapLayer
@onready var press: Label = $"../interact/press"

var player_in_area = false

	

func _process(delta: float) -> void:
	if player_in_area:
		press.visible= true
		
		var inventory = self.get_parent().get_parent().get_node("Inventory")
		print(inventory.slots)
		if Input.is_action_just_pressed("grab"):
			if inventory.slots == []:
				press.text = "You need the key"
			else:
				inventory.use_item()
				self.queue_free()
				press.visible=false
		
	else:
		press.visible=false


	


func _on_area_2d_body_entered(body) -> void:
	if body.has_method("Player"):
		player_in_area= true


func _on_area_2d_body_exited(body) -> void:
	if body.has_method("Player"):
		player_in_area= false
		press.text = "Press E to Open"
