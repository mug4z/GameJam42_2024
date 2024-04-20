extends Button

func _on_pressed():
	get_tree().root.remove_child(get_node("/root/CreditsMenu"))
