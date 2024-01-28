extends CharacterBody2D

const MAX_SPEED = 400

var velocity_percent = Vector2.ZERO
var acceleration = 40

@onready var _animated_sprite = $AnimatedSprite2D
@onready var actionable_finder: Area2D = $Direction/ActionableFinder
@export var inventory: Inventory

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	velocity = Vector2()
	
	if Input.is_action_pressed("up"):
		velocity_percent = velocity_percent.move_toward(Vector2(0,-1), acceleration * delta)
		_animated_sprite.play("move_up")
	elif Input.is_action_pressed("down"):
		velocity_percent = velocity_percent.move_toward(Vector2(0,1), acceleration * delta)
		_animated_sprite.play("move_down")
	elif Input.is_action_pressed("left"):
		velocity_percent = velocity_percent.move_toward(Vector2(-1,0), acceleration * delta)
		_animated_sprite.play("move_left")
	elif Input.is_action_pressed("right"):
		velocity_percent = velocity_percent.move_toward(Vector2(1,0), acceleration * delta)
		_animated_sprite.play("move_right")
	else:
		velocity_percent = velocity_percent.move_toward(Vector2.ZERO, acceleration * delta)
		_animated_sprite.stop()
	
	velocity = MAX_SPEED * velocity_percent
	move_and_slide()


func _on_hurt_box_area_entered(area):
	
	if area.has_method("collect"):
		area.collect(inventory)

		#var itemSlots = inventory.slots.filter(func(slot): return slot.item)
		#
		#if !itemSlots.is_empty():
			#var fullItems =  itemSlots.filter(func(slot): return slot.item.name == "croissant")
			#if !fullItems.is_empty():
				#DialogManager.startDialog(get_global_mouse_position(), ["I could've dropped my croissant!"])
				
				

func _unhandled_input(event):
	if Input.is_action_just_pressed("click"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return

