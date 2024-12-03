class_name Player
extends CharacterBody2D
@onready var animation_tree: AnimationTree = $AnimationTree
const onda = preload('res://scenes/onda.tscn')
var speed= 100
@onready var onda_cooldown: Timer = $OndaCooldown
@onready var onda_time: Timer = $OndaTime
var wave: Node = null
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var currentHealth = Global.health
signal healthChanged
func _ready() -> void:
	#onda_time.timeout.connect(_on_onda_timeout())
	onda_time.timeout.connect(Callable(self, "_on_onda_timeout"))
	
	

func _physics_process(delta: float) -> void:
	var input_vector  = Vector2.ZERO
	input_vector.x= Input.get_axis("left","right")
	input_vector.y = Input.get_axis("up","down")
	input_vector= input_vector.normalized()
	
	if input_vector:
		velocity= input_vector * speed
		$AnimationTree.set("parameters/Idle/blend_position",velocity)
		$AnimationTree.set("parameters/Walk/blend_position",velocity)
		$AnimationTree.get("parameters/playback").travel("Walk")
		move_and_slide()
	
	else:
		velocity= input_vector
		$AnimationTree.get("parameters/playback").travel("Idle")
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("onda"):
		print("lanzar onda")
		lanzar()
	$Node2D.look_at(get_global_mouse_position())

func lanzar ():
	
	if onda_cooldown.time_left > 0:
		return
	var wave = onda.instantiate()
	get_parent().add_child(wave)
	wave.position = global_position
	# Calcula la dirección exacta entre el marcador y el mouse
	var direction_to_mouse = (get_global_mouse_position() - wave.position).normalized()
	
	# Ajusta la rotación de la onda y agrega un desfase de -PI/2 para que apunte en la dirección correcta
	wave.rotation = direction_to_mouse.angle() 
	# Aquí puedes ajustar la rotación para que la dirección del cono empiece correctamente desde el jugador
	wave.rotation += PI / 2  # Ajusta esto si es necesario, dependiendo de la orientación de tu textura
	
	# Inicia la disipación
	wave.is_dissipating = true  # Cambia el estado para comenzar a disiparse
	wave.timer = 0  # Reinicia el temporizador
	wave.original_scale = Vector2(1, 1)  # Escala original
	wave.target_scale = Vector2(0, 0)  # Escala final (disiparse completamente)
	
	onda_cooldown.start()
	onda_time.start()

func _on_onda_timeout():
	if wave != null:
		wave.queue_free()
		wave = null
func take_damage():
	Global.health -= 1
	currentHealth = Global.health
	if currentHealth == 0:
		pass
	healthChanged.emit(currentHealth)
	
func Player():
	pass
