extends Button

var credits_scene = preload("res://Src/Scenes/CreditsMenu.tscn").instantiate()

func go_to_credits():
	get_tree().root.add_child(credits_scene)

func _on_pressed():
	go_to_credits()
