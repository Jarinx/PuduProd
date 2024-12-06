extends Control
@onready var start: Button = $TextureRect/VBoxContainer/Start
@onready var quit: Button = $TextureRect/VBoxContainer/Quit
@onready var credits: Button = $TextureRect/VBoxContainer/Credits
@onready var audio_stream_player_2d_1: AudioStreamPlayer2D = $TextureRect/VBoxContainer/Start/AudioStreamPlayer2D
@onready var audio_stream_player_2d_2: AudioStreamPlayer2D = $TextureRect/VBoxContainer/Start/AudioStreamPlayer2D
@onready var audio_stream_player_2d_3: AudioStreamPlayer2D = $TextureRect/VBoxContainer/Quit/AudioStreamPlayer2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start.pressed.connect(_on_start_pressed)
	credits.pressed.connect(_on_credits_pressed)
	quit.pressed.connect(_on_quit_pressed)
	$AudioStreamPlayer2D.play()
func _on_start_pressed () -> void:
	audio_stream_player_2d_1.play()
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_credits_pressed () -> void:
	audio_stream_player_2d_2.play()
	get_tree().change_scene_to_file("res://ui/credits.tscn")
func _on_quit_pressed () -> void:
	audio_stream_player_2d_3.play()
	get_tree().quit()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
