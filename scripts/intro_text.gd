extends AnimationPlayer

var animation = true

# Called when the node enters the scene tree for the first time.
func _ready():
	speed_scale = 0.02
	
	play("intro_blend")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_finished(anim_name):
	animation = false

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
				get_tree().change_scene_to_file("res://scenes/intro_landing.tscn")
