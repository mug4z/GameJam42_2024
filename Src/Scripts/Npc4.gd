extends Npc

func _ready():
	stat = "move_speed"
	stat_text = "Movement speed"

func Interact_action(player):
	player.upgrade(stat)
