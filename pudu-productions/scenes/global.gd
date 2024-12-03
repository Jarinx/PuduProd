extends Node

var maxHealth = 3
var health = maxHealth
var inventory = []
var max_inventory_size = 3

func add_item_to_inventory(item):
	for i in range (min(inventory.size(),max_inventory_size)):
		if inventory[i] == null:
			inventory[i] = item
			return
	if inventory.size() < max_inventory_size:
		inventory.append(item)
	else:
		print("Inventario lleno")
func get_inventory():
	return inventory	
