extends Control
@onready var start: Button = $TextureRect/VBoxContainer/Start
@onready var quit: Button = $TextureRect/VBoxContainer/Quit
@onready var credits: Button = $TextureRect/VBoxContainer/Credits



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start.pressed.connect(_on_start_pressed)
	credits.pressed.connect(_on_credits_pressed)
	quit.pressed.connect(_on_quit_pressed)
	$AudioStreamPlayer2D.play()
func _on_start_pressed () -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	$AudioStreamPlayer2D.play()

func _on_credits_pressed () -> void:
	get_tree().change_scene_to_file("res://ui/credits.tscn")
	$AudioStreamPlayer2D.play()
func _on_quit_pressed () -> void:
	get_tree().quit()
	$AudioStreamPlayer2D.play()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
