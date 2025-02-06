extends Node2D
var diologue = ['hello fren']
var j = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$"Back-arrow".modulate.a = 0
	if Global.isOfficeDiologue:
		$diologueBox.position = Vector2(576, 561)
	if !Global.isOfficeDiologue:
		$diologueBox.position = Vector2(999999, 9999999)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$officeHover.modulate.a = 0
	if Global.isOfficeDiologue:
		for i in diologue:
			while j < len(i):
				$RichTextLabel.text += i[j]
				j += 1
				await get_tree().create_timer(0.1).timeout
		if Input.is_action_just_pressed("select"):
			if handle_click($diologueBox):
				$diologueBox.position = Vector2(999999, 999999)
				Global.isOfficeDiologue = false
				$RichTextLabel.text = ''
	if !Global.isOfficeDiologue:
		if Global.isCheckBack:
			$"Back-arrow".modulate.a = 1
		if handle_click($"Back-arrow"):
			$"Back-arrow".texture = load("res://images/hoverArrow.png")
		elif !handle_click($"Back-arrow"):
			$"Back-arrow".texture = load("res://images/back-arrow.png")
		if Input.is_action_just_pressed("select"):
			if handle_click($"Back-arrow"):
				get_tree().change_scene_to_file("res://street.tscn")
			if handle_click($checkBack):
				Global.isCheckBack = true
		if !handle_click($officeHover):
			$officeHover.modulate.a = 0
		elif handle_click($officeHover):
			$officeHover.modulate.a = 0.3
func handle_click(item):
	var mouse_pos = get_global_mouse_position()
	
	# Get the global position and size of the duplicate
	var item_pos = item.global_position
	var size = item.get_texture().get_size() * item.get_global_scale()  # Assuming `duplicate` has a texture
	
	# Create a Rect2 using the duplicate's position and size
	var rect = Rect2(item_pos - size * 0.5, size).abs()
	
	# Check if the mouse is within the bounding box
	return rect.has_point(mouse_pos)
