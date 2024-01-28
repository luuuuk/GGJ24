extends Node2D

@onready var _animated_sprite = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_sprite.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animated_sprite_2d_frame_changed():
	if _animated_sprite.frame == 17:
		_animated_sprite.pause()
		
	#print(_animated_sprite.frame)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			print("transition")
			get_tree().change_scene_to_file("res://scenes/main.tscn")
