extends Area2D

@export var itemRes: InventoryItem

func collect(inventory: Inventory):
	if itemRes.name == "key":
		State.key_status = "has"
	if itemRes.name == "cable":
		State.cable_status = "has"
	inventory.insert(itemRes)
	queue_free()
