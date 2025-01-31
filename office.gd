extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if handle_click($"Back-arrow"):
		$"Back-arrow".texture = load("res://images/hoverArrow.png")
	elif !handle_click($"Back-arrow"):
		$"Back-arrow".texture = load("res://images/back-arrow.png")
	if Input.is_action_just_pressed("select"):
		if handle_click($"Back-arrow"):
			get_tree().change_scene_to_file("res://street.tscn")
func handle_click(item):
	var mouse_pos = get_global_mouse_position()
	
	# Get the global position and size of the duplicate
	var item_pos = item.global_position
	var size = item.get_texture().get_size() * item.get_global_scale()  # Assuming `duplicate` has a texture
	
	# Create a Rect2 using the duplicate's position and size
	var rect = Rect2(item_pos - size * 0.5, size)
	
	# Check if the mouse is within the bounding box
	return rect.has_point(mouse_pos)
