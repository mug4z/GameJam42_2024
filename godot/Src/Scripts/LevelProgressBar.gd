extends TextureProgressBar

@onready var label = $"../LevelLabel"

var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("../../../../Player")
	value = 0
	player.update_xp.connect(update)

func update():
	label.text = "LEVEL " + str(player.level)
	value = player.xp
	if value == 0:
		value -= 25
	elif value == 100:
		value += 20
