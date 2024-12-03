extends CanvasLayer

var slots = [null,null,null]
@onready var slot_images = [$Control/Slot1/ImgSlot1,$Control/Slot2/ImgSlot2,$Control/Slot3/ImgSlot3]

func _ready() -> void:
	slots = Global.get_inventory()
	update_ui()
func update_ui():
	print(Global.get_inventory())
	slots = Global.get_inventory()
	print(slots)
	print("Updating ui")
	for i in range(len(slots)):
		print("updating slots")
		print(slots[i])
		if slots[i] != null:
			print("found slot")
			print(slots[i].item_texture)
			slot_images[i].texture = slots[i].item_texture
			
	
