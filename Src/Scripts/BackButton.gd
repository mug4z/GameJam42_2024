extends Button

var menu = preload("res://Src/Scenes/MainMenu.tscn")

func _on_pressed():
	menu.instantiate()
	get_tree().change_scene_to_packed(menu)
