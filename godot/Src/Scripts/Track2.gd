extends AudioStreamPlayer2D

func _on_finished():
	get_node("/root/Level_Test/BackgroundMusic/Track3").play()
