extends Control


@onready var inventory: Inventory = preload("res://scenes/inventory/playerInventory.tres")
@onready var ItemStackGuiClass = preload("res://scenes/inventory/items_stack_gui.tscn")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var itemInHand: ItemStackGUI

func update():
	
	for i in range(min(inventory.slots.size(), slots.size())):
		
		var inventorySlot: InventorySlot = inventory.slots[i]
		if !inventorySlot.item: continue
		
		var itemStackGui: ItemStackGUI = slots[i].itemStackGui
		if !itemStackGui:
			itemStackGui = ItemStackGuiClass.instantiate()
			slots[i].insert(itemStackGui)
			
		itemStackGui.inventorySlot = inventorySlot
		itemStackGui.update()

# Called when the node enters the scene tree for the first time.
func _ready():
	connectSlots()
	inventory.updated.connect(update)
	update()
	

func connectSlots():
	
	for i in range(slots.size()):
		
		var slot = slots[i]
		slot.index = i
		
		var callable = Callable(onSlotClicked)
		callable = callable.bind(slot)
		slot.pressed.connect(callable)


func onInteractableClicked(interactable):
	if itemInHand:
		remove_child(itemInHand)
		itemInHand = null
		# slot.insert(item)


func onSlotClicked(slot):
	
	if slot.isEmpty():
		if !itemInHand: return
		
		insertItemInSlot(slot)
		return
	
	if !itemInHand:
		takeItemFromSlot(slot)


func takeItemFromSlot(slot):
	itemInHand = slot.takeItem()
	add_child(itemInHand)
	updateItemInHand()
	

func insertItemInSlot(slot):
	
	var item = itemInHand

	remove_child(itemInHand)
	itemInHand = null
	slot.insert(item)
	

func updateItemInHand():
	if !itemInHand: return
	itemInHand.global_position = get_global_mouse_position() - itemInHand.size / 2
	
	
func _input(event):
	updateItemInHand()
	
