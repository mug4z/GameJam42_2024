extends Npc

func _ready():
	stat = "attack_speed"
	stat_text = "Attack speed"

func Interact_action(player):
	player.upgrade(stat)
