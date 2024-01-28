extends Node2D
 
@onready var _animated_sprite = $CharacterBody2D/AnimatedSprite2D
 
# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_sprite.play("default")
 
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
 
 
func _on_animated_sprite_2d_frame_changed():
	if _animated_sprite.frame == 10:
		_animated_sprite.pause()
		await get_tree().create_timer(2.0).timeout
		SceneSwitcher.switch_scene("res://scenes/thanks.tscn")
