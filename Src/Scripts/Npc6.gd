extends Npc

func _ready():
	stat = "recharge_speed"
	stat_text = "Recharge speed"

func Interact_action(player):
	player.upgrade(stat)
