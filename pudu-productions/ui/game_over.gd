extends CanvasLayer
@onready var retry: Button = $VBoxContainer/Retry

@onready var quit: Button = $VBoxContainer/Quit
@onready var menu: Button = $VBoxContainer/Menu


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#self.hide()
	retry.pressed.connect(on_retry_pressed)
	quit.pressed.connect(get_tree().quit)
	menu.pressed.connect(on_menu_pressed)
func on_retry_pressed():
	get_tree().paused= false
	get_tree().change_scene_to_file("res://scenes/main.tscn")
func on_menu_pressed():
	get_tree().paused= false
	get_tree().change_scene_to_file("res://ui/mainMenu.tscn")
func game_over():
	get_tree().paused= true
	self.show()
	
