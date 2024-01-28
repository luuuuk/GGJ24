extends CharacterBody2D

var animation := AnimationPlayer.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	animation.autoplay = true
	add_child(animation)
