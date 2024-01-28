extends Area2D

@onready var inventory: Inventory = preload("res://scenes/inventory/playerInventory.tres")

func _on_body_entered(body):
	print("entered")
	if body.is_in_group("Player"):
		var itemSlots = inventory.slots.filter(func(slot): return slot.item)
		if !itemSlots.is_empty():
			var fullItems =  itemSlots.filter(func(slot): return slot.item.name == "cable")
			if !fullItems.is_empty():
				SceneSwitcher.switch_scene("res://scenes/compuer_puzzle/computer_assembly.tscn")
