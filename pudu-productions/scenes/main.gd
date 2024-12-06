extends Node2D
@onready var hearts_container: HBoxContainer = $CanvasLayer/Hearts_container
@onready var player: Player = $Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hearts_container.setMaxHearts(Global.maxHealth)
	hearts_container.updateHearts(player.currentHealth)
	player.healthChanged.connect(hearts_container.updateHearts)
	$AudioStreamPlayer2D.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
