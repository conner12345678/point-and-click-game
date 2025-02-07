extends Node

var isOfficeDiologue = true
var isCheckBack = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func handle_click(item):
	var mouse_pos = get_tree().root.get_viewport().get_mouse_position()
	
	# Get the global position and size of the duplicate
	var item_pos = item.global_position
	var size = item.get_texture().get_size() * item.get_global_scale()  # Assuming `duplicate` has a texture
	
	# Create a Rect2 using the duplicate's position and size
	var rect = Rect2(item_pos - size * 0.5, size).abs()
	
	# Check if the mouse is within the bounding box
	return rect.has_point(mouse_pos)
