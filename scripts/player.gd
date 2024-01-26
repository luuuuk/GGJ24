extends CharacterBody2D

const MAX_SPEED = 300

var velocity_percent = Vector2.ZERO
var acceleration = 30


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	velocity = Vector2()
	
	if Input.is_action_pressed("up"):
		velocity_percent = velocity_percent.move_toward(Vector2(0,-1), acceleration * delta)
	elif Input.is_action_pressed("down"):
		velocity_percent = velocity_percent.move_toward(Vector2(0,1), acceleration * delta)
	elif Input.is_action_pressed("left"):
		velocity_percent = velocity_percent.move_toward(Vector2(-1,0), acceleration * delta)
	elif Input.is_action_pressed("right"):
		velocity_percent = velocity_percent.move_toward(Vector2(1,0), acceleration * delta)
	else:
		velocity_percent = velocity_percent.move_toward(Vector2.ZERO, acceleration * delta)
	
	velocity = MAX_SPEED * velocity_percent
	move_and_slide()
	
	# Pick somthing up if colliding
