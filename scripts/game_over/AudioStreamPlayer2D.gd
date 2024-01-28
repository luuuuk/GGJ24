extends AudioStreamPlayer2D

var end_music := AudioStreamPlayer.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	end_music.stream = load("res://assets/music/game_over.wav")
	end_music.autoplay = true
	add_child(end_music)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
