extends Button

@onready var backgroundSprite: Sprite2D = $background
@onready var container: CenterContainer = $CenterContainer

@onready var inventory = preload("res://scenes/inventory/playerInventory.tres")

var itemStackGui: ItemStackGUI
var index: int

func insert(isg: ItemStackGUI):
	itemStackGui = isg
	backgroundSprite.frame = 1
	container.add_child(itemStackGui)
	
	if !itemStackGui.inventorySlot || inventory.slots[index] == itemStackGui.inventorySlot:
		return
		
	inventory.insertSlot(index, itemStackGui.inventorySlot)
	
	
func takeItem():
	var item = itemStackGui
	
	container.remove_child(itemStackGui)
	itemStackGui = null
	backgroundSprite.frame = 0
	
	return item
	

func isEmpty():
	return !itemStackGui


func _on_gui_input(event):
	if Input.is_action_just_pressed("rightClick"):
		if itemStackGui:
			if itemStackGui.inventorySlot:
				if itemStackGui.inventorySlot.item.name == "croissant":
					DialogueManager.show_example_dialogue_balloon(load("res://dialogue/croissantFind.dialogue"), "start")
				elif itemStackGui.inventorySlot.item.name == "key":
					State.key_status = "has"
					DialogueManager.show_example_dialogue_balloon(load("res://dialogue/key.dialogue"), "start")
				elif itemStackGui.inventorySlot.item.name == "coin":
					DialogueManager.show_example_dialogue_balloon(load("res://dialogue/coin.dialogue"), "start")
		
