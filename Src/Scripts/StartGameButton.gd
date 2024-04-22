extends Button

var level = preload("res://Src/Scenes/Level.tscn")

func _on_pressed():
	level.instantiate()
	get_tree().change_scene_to_packed(level)
