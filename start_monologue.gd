extends Node2D

var monologue = ["once upon a time there was nothing"]
var j = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in monologue:
		while j < len(i):
			$RichTextLabel.text += i[j]
			j += 1
			await get_tree().create_timer(0.1).timeout
			$RichTextLabel.text
		await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://office.tscn")




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
