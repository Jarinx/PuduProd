extends CanvasLayer
@onready var resume: Button = $ColorRect/VBoxContainer/Resume
@onready var restart: Button = $ColorRect/VBoxContainer/Restart
@onready var quit: Button = $ColorRect/VBoxContainer/Quit

@onready var menu: Button = $ColorRect/VBoxContainer/Menu



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	resume.pressed.connect(_on_resume_pressed)
	menu.pressed.connect(_on_menu_pressed)
	quit.pressed.connect(get_tree().quit)
	restart.pressed.connect(_on_reset_pressed)
	hide()
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		visible= not visible
		get_tree().paused = visible

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_resume_pressed()->void:
	hide()
	get_tree().paused = false
	
func _on_menu_pressed()->void:
	get_tree().paused=false
	get_tree().change_scene_to_file('res://ui/mainMenu.tscn')
func _on_reset_pressed()->void:
	get_tree().paused=false
	get_tree().reload_current_scene()
