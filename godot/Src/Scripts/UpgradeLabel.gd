extends Label

var amplitude = 10
var base_position
var speed = 4
var absolute_time = 0

func _ready():
	base_position = global_position
	visible = 0

func set_base_position(pos):
	base_position = pos

func _process(delta):
	absolute_time += delta
	global_position = Vector2(base_position.x, base_position.y + ( amplitude * sin(speed * absolute_time) ))
