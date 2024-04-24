extends Button

var credits = preload("res://Src/Scenes/CreditsMenu.tscn")

func _on_pressed():
	credits.instantiate()
	get_tree().change_scene_to_packed(credits)

#ADD CREDITS  Monument_Music
