extends Control

var menu = preload("res://Src/Scenes/MainMenu.tscn")
var game = preload("res://Src/Scenes/Level.tscn")

func _ready():
	$OUIN.play()

func _on_menu_button_pressed():
	menu.instantiate()
	get_tree().change_scene_to_packed(menu)


func _on_retry_button_pressed():
	game.instantiate()
	get_tree().change_scene_to_packed(game)
