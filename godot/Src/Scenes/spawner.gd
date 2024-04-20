extends Node

var mob_instance = preload("res://Src/Scenes/mob.tscn")
var center_x = 0  # Center x-coordinate
var center_y = 0  # Center y-coordinate
var radius = 4000  # Radius of the circle

# Called when the node enters the scene tree for the first time.
func _ready():
	var num_sprites = 40  # Number of sprites to place in a circle
	for i in range(0, num_sprites):
		var angle = 2 * PI * i / num_sprites  # Calculate the angle for each sprite
		var new_sprite = mob_instance.instantiate()
		add_child(new_sprite)
		new_sprite.immortal = 1
		# Calculate and set position in a circle around the center
		new_sprite.position = Vector2(center_x + radius * cos(angle), center_y + radius * sin(angle))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
