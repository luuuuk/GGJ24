extends Marker2D

var occupied = -1

func _draw():
	draw_circle(Vector2.ZERO, 40, Color.TRANSPARENT)
	#draw_circle(Vector2.ZERO, 36, Color.SALMON)
	
func select(id):
	#for child in get_tree().get_nodes_in_group("zone"):
	#	child.deselect()
	modulate = Color.WEB_MAROON
	occupied = id
	#print(id)
	
	
func deselect():
	modulate = Color.WHITE
	occupied = -1

