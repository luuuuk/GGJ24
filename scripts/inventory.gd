extends Control


@onready var inventory: Inventory = preload("res://scenes/inventory/playerInventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

func update():
	#for i in range(min(inventory.items.size()), slot)
	for i in range(min(inventory.slots.size(), slots.size())):
		slots[i].update(inventory.slots[i])

# Called when the node enters the scene tree for the first time.
func _ready():
	inventory.updated.connect(update)
	update()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
