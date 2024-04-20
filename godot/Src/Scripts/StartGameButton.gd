extends Button

var game_scene = preload("res://Src/Scenes/Level.tscn").instantiate()

func play_game():
	get_tree().root.add_child(game_scene)
	get_node("/root/MainMenu").call_deferred("free")

func _on_pressed():
	play_game()
