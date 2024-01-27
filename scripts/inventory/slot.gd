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
	pass
	#if event is InputEventMouseButton && event.button_index == 2:
		#if itemStackGui:
			#if itemStackGui.inventorySlot:
				#DialogManager.startDialog(get_global_mouse_position() , itemStackGui.inventorySlot.item.description)
		
