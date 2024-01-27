extends Area2D

@onready var inventory: Inventory = preload("res://scenes/inventory/playerInventory.tres")


const successLines: Array[String] = [
	"You seem to have acquired the necessary equipment...",
	"This key grants you access to the house!"
]

const failureLines: Array[String] = [
	"Looks like the door is locked...",
	"Maybe you can find a way to unlock it!"
]

func _on_body_entered(body):
	if body.is_in_group("Player"):

		var itemSlots = inventory.slots.filter(func(slot): return slot.item)
		
		if !itemSlots.is_empty():
			var fullItems =  itemSlots.filter(func(slot): return slot.item.name == "key")
			print(fullItems)
			if fullItems.is_empty():
				DialogManager.startDialog(get_global_mouse_position(), failureLines)
			else:
				DialogManager.startDialog(get_global_mouse_position(), successLines)
				get_tree().change_scene_to_file("res://scenes/computer_puzzle/computer_assembly.tscn")
