extends AudioStreamPlayer2D

var bg_music := AudioStreamPlayer.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	bg_music.stream = load("res://assets/music/bg_music.ogg")
	bg_music.autoplay = true
	add_child(bg_music)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
