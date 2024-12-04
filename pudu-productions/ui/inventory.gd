extends CanvasLayer

var slots = [null,null,null]
@onready var slot_images = [$Control/Slot1/ImgSlot1,$Control/Slot2/ImgSlot2,$Control/Slot3/ImgSlot3]

func _ready() -> void:
	slots = Global.get_inventory()
	update_ui()
func update_ui():

	slots = Global.get_inventory()


	for i in range(len(slots)):

		print(slots[i])
		if slots[i] != null:

			print(slots[i].item_texture)
			slot_images[i].texture = slots[i].item_texture
func use_item():
	for i in range(len(slots)):
		if slots[i] != null:
			slots[i]= null
			slot_images[i].texture = null
			update_ui()
			break
			
	
