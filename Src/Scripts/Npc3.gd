extends Npc

func _ready():
	stat = "max_fuel"
	stat_text = "Tank size"

func Interact_action(player):
	player.upgrade(stat)
