extends VideoStreamPlayer

var end_video := VideoStreamPlayer.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	end_video.stream = load("res://assets/big_brain/mp4.ogv")
	end_video.autoplay = true
	add_child(end_video)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
