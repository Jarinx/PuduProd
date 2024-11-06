class_name Hitbox
extends Area2D
var original_scale = Vector2(1, 1)  # Escala original
var target_scale = Vector2(0, 0)     # Escala objetivo
var time_to_dissipate = 2.5           # Tiempo para disiparse
var wait_time = 0.5                   # Tiempo adicional en el estado original
var timer = 0.0                       # Temporizador interno
var is_dissipating = false              # Estado de disipación
var is_waiting = true
var player: CharacterBody2D

func _ready() -> void:
	# Obtener referencia al jugador (puedes ajustar esto si es necesario)
	player = get_parent().get_node("Player")  # Asegúrate de que el nombre sea correcto


func _process(delta: float) -> void:
	if is_waiting:
		timer += delta  # Incrementa el temporizador
		# Si el tiempo de espera se ha cumplido, inicia la disipación
		if timer >= wait_time:
			is_waiting = false
			timer = 0  # Reinicia el temporizador para la disipación
	elif is_dissipating:
		# Actualiza la posición de la onda para seguir al jugador
		position = player.global_position  # Sigue la posición del jugador
		timer += delta  # Incrementa el temporizador de disipación
		var progress = timer / time_to_dissipate  # Progreso de la disipación
		# Interpolación lineal para escalar hacia el objetivo
		scale = original_scale.lerp(target_scale, progress)
		# Si hemos llegado a la escala objetivo, detener la disipación
		if progress >= 1:
			queue_free()  #
