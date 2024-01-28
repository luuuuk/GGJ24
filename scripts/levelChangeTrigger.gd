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
		if State.key_status == "has":
				SceneSwitcher.switch_scene("res://scenes/teenRoom.tscn")
