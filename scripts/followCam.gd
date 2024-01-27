extends Camera2D

@export var map : TextureRect

# Called when the node enters the scene tree for the first time.
func _ready():
	var mapSize = map.get_global_rect()
	
	limit_left = mapSize.position[0]
	limit_top = mapSize.position[1]
	limit_right = mapSize.size[0] + mapSize.position[0]
	limit_bottom = mapSize.size[1] + mapSize.position[1]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
