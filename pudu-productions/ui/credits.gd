extends Control
@onready var back: Button = $VBoxContainer2/Back


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	back.pressed.connect(_on_back_pressed)

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/mainMenu.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
