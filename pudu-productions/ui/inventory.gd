extends CanvasLayer

var slots = [null,null,null]
@onready var slot_images = [$Control/Slot1/ImgSlot1,$Control/Slot2/ImgSlot2,$Control/Slot3/ImgSlot3]

func _ready() -> void:
	slots = Global.get_inventory()
	update_ui()
func update_ui():
	slots = Global.get_inventory()
	for i in range (len(slots)):
		if slots[i] != null:
			slot_images[i].texture = slots[i].texture
			
	pass
