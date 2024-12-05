extends CanvasLayer
@onready var button: Button = $Label/Button
@onready var label: Label = $Label
var text_steps = 0
var texts = [
	"En este juego tu objetivo
	 sera escapar de una mansion
	 llena de peligros
	para ello deberas encontrar las llaves
	 de la puerta para abrir la salida",
	"El problema es que las habitaciones
	 de esta mansion estan totalmente a oscuras,
	por lo que contaras con una pequeña luz
	 alrededor y una linterna para iluminar por
	algunos segundos hacia donde apuntes, pero cuidado, 
	si llegas a iluminar con esta linterna a uno de los
	enemigos estos te seguiran por unos segundos
	 para atacarte",
	"Además, deberás iluminar
	 las llaves que esten 
	en las habitaciones para 
	poder recogerlas,
	por lo que deberas
	 tener cuidado al usar 
	tu linterna para poder
	 moverte por la habitación
	 y encontrar las llaves",
	"Sin mas preambulo, te enseñaremos
	 los controles y deberas pasar
	 por esta pequeña habitación
	 para terminal el tutorial!"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused= true
	button.pressed.connect(on_ok_pressed)
func update_label():
	if text_steps < texts.size():
		label.text = texts[text_steps]
func on_ok_pressed():
	match text_steps:
		0:
			text_steps += 1
			update_label()
		1: 
			text_steps += 1
			update_label()
		2:
			text_steps += 1
			update_label()
		3:
			get_tree().paused= false
			self.queue_free()
	
