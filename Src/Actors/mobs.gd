extends Node2D

var mob_instance = [preload("res://Src/Actors/mob1.tscn"), preload("res://Src/Actors/mob2.tscn"), preload("res://Src/Actors/mob3.tscn")]
var center_x = 0  # Center x-coordinate
var center_y = 0  # Center y-coordinate
var radius = 4000  # Radius of the circle

# Called when the node enters the scene tree for the first time.
func _ready():
	var num_sprites = 10  # Number of sprites to place in a circle
	for i in range(0, num_sprites):
		var angle = 2 * PI * i / num_sprites  # Calculate the angle for each sprite
		var positionn = Vector2(center_x + radius * cos(angle), center_y + radius * sin(angle)) * randf_range(0.95,1.05)
		spawnn(2, positionn)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func spawnn(tier, positionn):
	var new_sprite = mob_instance[tier].instantiate()
	add_child(new_sprite)  # Adding as a sibling to maintain same parent
	new_sprite.global_position = positionn
