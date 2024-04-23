extends Npc

func _ready():
	stat = "fire_scale"
	stat_text = "Fire size"

func Interact_action(player):
	player.upgrade(stat)
