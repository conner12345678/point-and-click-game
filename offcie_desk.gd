extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$keyHover.modulate.a = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.handle_click($keyHover):
		$keyHover.modulate.a = 0.3
	else:
		$keyHover.modulate.a = 0
	if Input.is_action_just_pressed("select"):
		if Global.handle_click($keyHover):
			Global.isFindKey = true
			get_tree().change_scene_to_file("res://office.tscn")
