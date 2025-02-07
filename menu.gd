extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !handle_click($"Camera2D/TitleScreen/StartButton"):
		$Camera2D/TitleScreen/StartButton.modulate.a = 0
		$Camera2D/TitleScreen/Start.text = "[color=white]Start[/color]"
	elif handle_click($"Camera2D/TitleScreen/StartButton"):
		$Camera2D/TitleScreen/Start.text = "[color=red]Start[/color]"
	if !handle_click($"Camera2D/TitleScreen/LoadButton"):
		$Camera2D/TitleScreen/LoadButton.modulate.a = 0
		$Camera2D/TitleScreen/Load.text = "[color=white]Load[/color]"
	elif handle_click($"Camera2D/TitleScreen/LoadButton"):
		$Camera2D/TitleScreen/Load.text = "[color=red]Load[/color]"
	if !handle_click($"Camera2D/TitleScreen/CredditsButton"):
		$Camera2D/TitleScreen/CredditsButton.modulate.a = 0
		$Camera2D/TitleScreen/Credits.text = "[color=white]Credits[/color]"
	elif handle_click($"Camera2D/TitleScreen/CredditsButton"):
		$Camera2D/TitleScreen/Credits.text = "[color=red]Credits[/color]"
	if !handle_click($"Camera2D/TitleScreen/SettingsButton"):
		$Camera2D/TitleScreen/SettingsButton.modulate.a = 0
		$Camera2D/TitleScreen/Settings.text = "[color=white]Settings[/color]"
	elif handle_click($"Camera2D/TitleScreen/SettingsButton"):
		$Camera2D/TitleScreen/Settings.text = "[color=red]Settings[/color]"
	if Input.is_action_just_pressed("select"):
		if handle_click($Camera2D/TitleScreen/StartButton):
			get_tree().change_scene_to_file("res://start_monologue.tscn")

func handle_click(item):
	var mouse_pos = get_global_mouse_position()
	
	# Get the global position and size of the duplicate
	var item_pos = item.global_position
	var size = item.get_texture().get_size() * item.get_global_scale()  # Assuming `duplicate` has a texture
	
	# Create a Rect2 using the duplicate's position and size
	var rect = Rect2(item_pos - size * 0.5, size)
	
	# Check if the mouse is within the bounding box
	return rect.has_point(mouse_pos)
