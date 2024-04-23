extends Npc

func _ready():
	stat = "fire_speed"
	stat_text = "Flame speed"

func Interact_action(player):
	player.upgrade(stat)
