extends Area2D
func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node) -> void:
	var player = body as Player
	if player:
		get_tree().change_scene_to_file("res://ui/win_menu.tscn")
