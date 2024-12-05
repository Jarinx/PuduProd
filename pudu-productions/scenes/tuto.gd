extends CanvasLayer
@onready var texto_tuto: Label = $texto_tuto
var tutorial_steps = 0
var wasd = {"up":false,"down":false,"right":false,"left":false}
var tutorial_texts = [
	"Presiona WASD para moverte",
	"Usa el mouse para apuntar y presiona
	 click izquierdo o espacio para lanzar la onda",
	"Apreta E para agarrar las
	 llaves e interactuar con las puertas"]
	

func wasd_pressed():
	for key in wasd:
		if not wasd[key]:
			return false
	return true
func update_label():
	if tutorial_steps < tutorial_texts.size():
		texto_tuto.text = tutorial_texts[tutorial_steps]
func _process(delta):
	texto_tuto.visible = true
	match tutorial_steps:
		0:
			if Input.is_action_just_pressed("up"):
				wasd["up"] = true
			if Input.is_action_just_pressed("left"):
				wasd["left"] = true
			if Input.is_action_just_pressed("down"):
				wasd["down"] = true
			if Input.is_action_just_pressed("right"):
				wasd["right"] = true
			if wasd_pressed():
				tutorial_steps+=1
				update_label()
		1:
			if Input.is_action_just_pressed("onda"):
				tutorial_steps += 1
				update_label()
		2:
			if Input.is_action_just_pressed("grab"):
				self.queue_free()
				
