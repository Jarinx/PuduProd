class_name Checkpoint
extends Area2D

@export var respawn_point: Node2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node) -> void:
	var player = body as Player
	if player:
		get_tree().change_scene_to_file("res://ui/tutorial_complete.tscn")
