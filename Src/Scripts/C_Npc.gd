extends Area2D
class_name Npc

var can_interact = 0
var stat = ""
var stat_text = ""

func Interact_action(player):
	pass

func _process(delta):
	if (can_interact && Input.is_action_just_pressed("interact")):
		Interact_action(get_tree().root.get_node("Level/Player"));

func _on_body_entered(body):
	get_parent().get_node("UpgradeLabel").text = "Upgrade!\n" + stat_text
	get_parent().get_node("UpgradeLabel").set_base_position($LabelPoint.global_position)
	get_parent().get_node("UpgradeLabel").visible = 1
	can_interact = 1

func _on_body_exited(body):
	get_parent().get_node("UpgradeLabel").visible = 0
	can_interact = 0
